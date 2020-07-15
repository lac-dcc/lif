//===-- Lif.cpp -----------------------------------------------------------===//
// Copyright (C) 2020  Luigi D. C. Soares
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//===----------------------------------------------------------------------===//
///
/// \file
/// A command-line tool that transforms functions of a LLLVM IR module into a
/// version that is isochronous w.r.t. the set of instructions executed. In
/// other words, the set of instructions executed by a isochronous function is
/// always the same regardless of its inputs. This tool ensures that no
/// out-of-bounds access to memory is introduced after the transformation.
/// Finally, it also guarantees the absence of cache-based timing leaks iff
/// every memory access is proven to be safe. For that, it requires every
/// function to follow the contract above: each pointer argument (e.g. array)
/// must be immediately followed by an argument carrying its length. The user
/// can either manually add these arguments or let the tool insert it
/// automatically.
///
//===----------------------------------------------------------------------===//

#include "Isochronous.h"

#include <llvm/ADT/DenseSet.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/StandardInstrumentations.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Scalar/DCE.h>
#include <llvm/Transforms/Scalar/IndVarSimplify.h>
#include <llvm/Transforms/Scalar/LoopPassManager.h>
#include <llvm/Transforms/Scalar/LoopRotation.h>
#include <llvm/Transforms/Scalar/LoopUnrollPass.h>
#include <llvm/Transforms/Scalar/NewGVN.h>
#include <llvm/Transforms/Scalar/SCCP.h>
#include <llvm/Transforms/Scalar/SimplifyCFG.h>
#include <llvm/Transforms/Utils/Mem2Reg.h>

using namespace llvm;

/// A category for the options specified for this tool.
static cl::OptionCategory LifCategory("isochronous pass options");

/// A required argument that specifies the module that will be transformed.
static cl::opt<std::string> InputModule(cl::Positional,
                                        cl::desc("<Module to be transformed>"),
                                        cl::value_desc("bitcode filename"),
                                        cl::init(""), cl::Required,
                                        cl::cat(LifCategory));

/// An optional argument that specifies the name of the output file.
static cl::opt<std::string>
    OutputModule("o", cl::Positional,
                 cl::desc("<Module after the transformations>"),
                 cl::value_desc("bitcode filename"), cl::init("out.ll"),
                 cl::cat(LifCategory));

/// An optional argument that specifies whether the tool should try to unroll
/// existing loops or not.
static cl::opt<bool>
    Unroll("unroll",
           cl::desc("Try to unroll existing loops by (set unroll-count and/or "
                    "unroll-threshold = the max number of loop iterations to "
                    "perform a full unroll)"),
           cl::init(false), cl::cat(LifCategory));

enum OptLevel { O0, O1, O2, O3 };
const std::map<OptLevel, PassBuilder::OptimizationLevel> OptM = {
    {O0, PassBuilder::OptimizationLevel::O0},
    {O1, PassBuilder::OptimizationLevel::O1},
    {O2, PassBuilder::OptimizationLevel::O2},
    {O3, PassBuilder::OptimizationLevel::O3}};

/// An optional argument that specifies whether the tool should optimize the
/// original & transformed functions.
static cl::opt<OptLevel>
    Opt(cl::desc("Optimization level"),
        cl::values(clEnumVal(O0, "Optimization level 0 (same as opt -O0)"),
                   clEnumVal(O1, "Optimization level 1 (same as opt -O1)"),
                   clEnumVal(O2, "Optimization level 2 (same as opt -O2)"),
                   clEnumVal(O3, "Optimization level 3 (same as opt -O3)")),
        cl::init(O0), cl::cat(LifCategory));

/// An optional argument that specifies the name of the functions that should
/// be transformed.
static cl::opt<std::string>
    Names("names",
          cl::desc("List of functions to be transformed. [empty = all]"),
          cl::value_desc("f1,f2,f3...,fn"), cl::init(""), cl::cat(LifCategory));

/// Applies the Isochronous pass to the selected functions.
void runIsochronousPass(Module &M) {
    // If no function name was specified, we transform all functions within the
    // given module.
    SmallVector<StringRef, 32> FNames;
    StringRef(Names.getValue()).split(FNames, ",", -1, false);

    PassInstrumentationCallbacks PIC;
    StandardInstrumentations SI;
    SI.registerCallbacks(PIC);

    PassBuilder PB(nullptr, PipelineTuningOptions(), None, &PIC);
    LoopAnalysisManager LAM;
    FunctionAnalysisManager FAM;
    CGSCCAnalysisManager CGAM;
    ModuleAnalysisManager MAM;

    PB.registerLoopAnalyses(LAM);
    PB.registerFunctionAnalyses(FAM);
    PB.registerCGSCCAnalyses(CGAM);
    PB.registerModuleAnalyses(MAM);
    PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);

    ModulePassManager MPM;
    FunctionPassManager FPM;

    if (Unroll) {
        LoopPassManager LPM;
        LPM.addPass(LoopRotatePass());
        LPM.addPass(IndVarSimplifyPass());
        FPM.addPass(PromotePass());
        FPM.addPass(SimplifyCFGPass());
        FPM.addPass(createFunctionToLoopPassAdaptor(std::move(LPM)));
        FPM.addPass(LoopUnrollPass());
        MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
    }

    std::set<StringRef> Names(FNames.begin(), FNames.end());
    MPM.addPass(isochronous::Pass(Names));

    if (Opt != O0)
        MPM.addPass(PB.buildPerModuleDefaultPipeline(OptM.find(Opt)->second));

    MPM.run(M, MAM);
}

int main(int Argc, char **Argv) {
    // Hide all options apart from the ones specific to this tool.
    cl::HideUnrelatedOptions(LifCategory);

    // Parse the command-line options that should be passed to the isochronous
    // pass.
    cl::ParseCommandLineOptions(
        Argc, Argv,
        "transforms functions into versions that are isochronous.\n");

    // Makes sure llvm_shutdown() is called (which cleans up LLVM objects)
    //  http://llvm.org/docs/ProgrammersManual.html#ending-execution-with-llvm-shutdown
    llvm_shutdown_obj SDO;

    // Parse the IR file passed on the command line.
    SMDiagnostic Err;
    LLVMContext Ctx;
    std::unique_ptr<Module> M = parseIRFile(InputModule.getValue(), Err, Ctx);

    if (!M) {
        errs() << "Error reading bitcode file: " << InputModule << "\n";
        Err.print(Argv[0], errs());
        return -1;
    }

    runIsochronousPass(*M);

    std::error_code EC;
    raw_fd_ostream OS(OutputModule.getValue(), EC);

    if (EC) {
        errs() << "Couldn't open " << OutputModule.getValue() << ": "
               << EC.message() << "\n";
        return 1;
    }

    M->print(OS, nullptr);
    OS.close();
    return 0;
}

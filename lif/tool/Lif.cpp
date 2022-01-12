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

#include "CCFG.h"
#include "Isochronous.h"

#include <llvm/ADT/DenseSet.h>
#include <llvm/ADT/PostOrderIterator.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/StandardInstrumentations.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/ErrorOr.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/YAMLParser.h>
#include <llvm/Support/YAMLTraits.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Scalar/DCE.h>
#include <llvm/Transforms/Scalar/IndVarSimplify.h>
#include <llvm/Transforms/Scalar/LoopPassManager.h>
#include <llvm/Transforms/Scalar/LoopRotation.h>
#include <llvm/Transforms/Scalar/LoopUnrollPass.h>
#include <llvm/Transforms/Scalar/NewGVN.h>
#include <llvm/Transforms/Scalar/SCCP.h>
#include <llvm/Transforms/Scalar/SimplifyCFG.h>
#include <llvm/Transforms/Utils/LoopSimplify.h>
#include <llvm/Transforms/Utils/LowerSwitch.h>
#include <llvm/Transforms/Utils/Mem2Reg.h>
#include <llvm/Transforms/Utils/UnifyFunctionExitNodes.h>

/// A category for the options specified for this tool.
static llvm::cl::OptionCategory LifCategory("isochronous pass options");

/// A required argument that specifies the module that will be transformed.
static llvm::cl::opt<std::string>
    InputModule(llvm::cl::Positional,
                llvm::cl::desc("<Module to be transformed>"),
                llvm::cl::value_desc("Bitcode filepath"), llvm::cl::init(""),
                llvm::cl::Required, llvm::cl::cat(LifCategory));

/// An optional argument that specifies the name of the output file.
static llvm::cl::opt<std::string>
    OutputModule("o", llvm::cl::Positional,
                 llvm::cl::desc("<Transformed module>"),
                 llvm::cl::value_desc("Bitcode filepath"),
                 llvm::cl::init("out.ll"), llvm::cl::cat(LifCategory));

enum OptLevel { O0, O1, O2, O3 };
const std::map<OptLevel, llvm::PassBuilder::OptimizationLevel> OptM = {
    {O0, llvm::PassBuilder::OptimizationLevel::O0},
    {O1, llvm::PassBuilder::OptimizationLevel::O1},
    {O2, llvm::PassBuilder::OptimizationLevel::O2},
    {O3, llvm::PassBuilder::OptimizationLevel::O3}};

/// An optional argument that specifies whether the tool should optimize the
/// original & transformed functions.
static llvm::cl::opt<OptLevel> Opt(
    llvm::cl::desc("Optimization level"),
    llvm::cl::values(clEnumVal(O0, "Optimization level 0"),
                     clEnumVal(O1, "Optimization level 1"),
                     clEnumVal(O2, "Optimization level 2"),
                     clEnumVal(O3, "Optimization level 3")),
    llvm::cl::init(O0), llvm::cl::cat(LifCategory));

/// A required arguments that specifies the path to the module configuration
/// file.
static llvm::cl::opt<std::string>
    ConfigYAML("config",
               llvm::cl::desc("<Configuration file with tainted inputs>"),
               llvm::cl::value_desc("Config filepath"), llvm::cl::init(""),
               llvm::cl::Required, llvm::cl::cat(LifCategory));

/// Applies the Isochronous pass to the selected functions.
void runIsochronousPass(llvm::Module &M, llvm::StringRef ConfigBuffer) {
    llvm::PassInstrumentationCallbacks PIC;
    llvm::StandardInstrumentations SI(/* DebugLogging */ false);
    SI.registerCallbacks(PIC);

    llvm::PassBuilder PB(
        nullptr, llvm::PipelineTuningOptions(), llvm::None, &PIC);

    llvm::LoopAnalysisManager LAM;
    llvm::FunctionAnalysisManager FAM;
    llvm::CGSCCAnalysisManager CGAM;
    llvm::ModuleAnalysisManager MAM;

    PB.registerLoopAnalyses(LAM);
    PB.registerFunctionAnalyses(FAM);
    PB.registerCGSCCAnalyses(CGAM);
    PB.registerModuleAnalyses(MAM);
    PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);

    llvm::ModulePassManager MPM;
    llvm::FunctionPassManager FPM;

    FPM.addPass(llvm::PromotePass());
    FPM.addPass(llvm::LowerSwitchPass());
    FPM.addPass(llvm::UnifyFunctionExitNodesPass());
    FPM.addPass(llvm::LoopSimplifyPass());
    MPM.addPass(llvm::createModuleToFunctionPassAdaptor(std::move(FPM)));

    lif::config::Module Config;
    llvm::yaml::Input InputYAML(ConfigBuffer);
    InputYAML >> Config;
    MPM.addPass(lif::IsochronousPass(Config));

    if (Opt != O0) {
        MPM.addPass(PB.buildPerModuleDefaultPipeline(OptM.find(Opt)->second));
    }

    MPM.run(M, MAM);

}

int main(int Argc, char **Argv) {
    // Hide all options apart from the ones specific to this tool.
    llvm::cl::HideUnrelatedOptions(LifCategory);

    // Parse the command-line options that should be passed to the isochronous
    // pass.
    llvm::cl::ParseCommandLineOptions(
        Argc, Argv,
        "transforms functions into versions that are isochronous.\n");

    // Makes sure llvm_shutdown() is called (which cleans up LLVM objects)
    //  http://llvm.org/docs/ProgrammersManual.html#ending-execution-with-llvm-shutdown
    llvm::llvm_shutdown_obj SDO;

    // Parse the IR file passed on the command line.
    llvm::SMDiagnostic Err;
    llvm::LLVMContext Ctx;
    std::unique_ptr<llvm::Module> M = parseIRFile(InputModule, Err, Ctx);

    if (!M) {
        llvm::errs() << "Error reading bitcode file: " << InputModule << "\n";
        Err.print(Argv[0], llvm::errs());
        return 1;
    }

    auto ConfigMB = llvm::MemoryBuffer::getFile(ConfigYAML);
    if (!ConfigMB) {
        llvm::errs() << "Error reading config (yaml) file: " << ConfigYAML
                     << "\n";
        Err.print(Argv[0], llvm::errs());
        return 1;
    }

    runIsochronousPass(*M, (*ConfigMB)->getBuffer());

    std::error_code EC;
    llvm::raw_fd_ostream OS(OutputModule.getValue(), EC);

    if (EC) {
        llvm::errs() << "Couldn't open " << OutputModule.getValue() << ": "
                     << EC.message() << "\n";
        return 1;
    }

    M->print(OS, nullptr);
    OS.close();
    return 0;
}

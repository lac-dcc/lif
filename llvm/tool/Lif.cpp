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
/// version that is invariant w.r.t. the set of instructions executed. In other
/// words, the set of instructions executed by a invariant function is always
/// the same regardless of its inputs. This tool ensures that no out-of-bounds
/// access to memory is introduced after the transformation. Finally, it also
/// guarantees the absence of cache-based timing leaks iff every memory access
/// is proven to be safe. For that, it requires every function to follow the
/// contract above: each pointer argument (e.g. array) must be immediately
/// followed by an argument carrying its length. The user can either manually
/// add these arguments or let the tool insert it automatically.
///
//===----------------------------------------------------------------------===//

#include "Invariant.h"
#include "LenArgs.h"

#include <llvm/ADT/DenseSet.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/IPO/DeadArgumentElimination.h>
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
static cl::OptionCategory LifCategory("invariant pass options");

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

/// An optional argument that specifies whether the tool should insert
/// arguments for the length of the original pointer arguments or not.
static cl::opt<bool> LenArgs("len-args",
                             cl::desc("Insert an argument for the length of "
                                      "each pointer passed to a function"),
                             cl::init(false), cl::cat(LifCategory));

/// An optional argument that specifies whether the tool should try to unroll
/// existing loops or not.
static cl::opt<bool>
    Unroll("unroll",
           cl::desc("Try to unroll existing loops by (set unroll-count and/or "
                    "unroll-threshold = the max number of loop iterations to "
                    "perform a full unroll)"),
           cl::init(false), cl::cat(LifCategory));

/// An optional argument that specifies whether the tool should optmized the
/// transformed functions or not.
static cl::opt<bool>
    Opt("opt",
        cl::desc("Optimize the transformed functions by applying the following "
                 "passes: mem2reg, sccp, newgvn, dce"),
        cl::init(false), cl::cat(LifCategory));

/// An optional argument that specifies the name of the functions that should
/// be transformed.
static cl::opt<std::string>
    Names("names",
          cl::desc("List of functions to be transformed. [empty = all]"),
          cl::value_desc("f1,f2,f3...,fn"), cl::init(""), cl::cat(LifCategory));

/// Applies the LenArgs pass to a Module in order to insert the length
/// arguments when necessary. We transform the signature of every defined
/// function, even those not selected by the user, since we rely on the length
/// of arguments to replace old calls by the new ones (see util::getLen).
void runLenArgsPass(Module &M) {
    PassBuilder PB;
    FunctionAnalysisManager FAM;
    ModuleAnalysisManager MAM;

    PB.registerFunctionAnalyses(FAM);
    PB.registerModuleAnalyses(MAM);

    // LenArgsPass requires FunctionAnalysisManagerModuleProxy to work.
    MAM.registerPass([&] { return FunctionAnalysisManagerModuleProxy(FAM); });
    ModulePassManager MPM;

    if (Unroll) {
        LoopAnalysisManager LAM;
        PB.registerLoopAnalyses(LAM);

        FAM.registerPass([&] { return LoopAnalysisManagerFunctionProxy(LAM); });
        FAM.registerPass(
            [&] { return ModuleAnalysisManagerFunctionProxy(MAM); });

        FunctionPassManager FPM;
        FPM.addPass(PromotePass());
        FPM.addPass(SimplifyCFGPass());
        FPM.addPass(createFunctionToLoopPassAdaptor(LoopRotatePass()));
        FPM.addPass(createFunctionToLoopPassAdaptor(IndVarSimplifyPass()));
        FPM.addPass(LoopUnrollPass());

        MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));
    }

    MPM.addPass(lenargs::Pass());
    MPM.run(M, MAM);
}

/// Applies the Invariant pass to the selected functions.
void runInvariantPass(Module &M) {
    SmallPtrSet<Function *, 32> Skip;
    // If no function name was specified, we transform all functions within the
    // given module. Else, we add all functions not listed to a set of
    // functions that should be skipped.
    if (Names != "") {
        SmallVector<StringRef, 32> NameV;
        SmallDenseSet<StringRef> Transform;

        StringRef(Names.getValue()).split(NameV, ",");
        Transform.insert(NameV.begin(), NameV.end());

        for (auto &F : M)
            if (Transform.find(F.getName()) == Transform.end()) Skip.insert(&F);
    }

    PassBuilder PB;
    FunctionAnalysisManager FAM;

    PB.registerFunctionAnalyses(FAM);
    FunctionPassManager FPM;
    FPM.addPass(invariant::Pass());

    if (Opt) {
        FPM.addPass(PromotePass());
        FPM.addPass(SCCPPass());
        FPM.addPass(NewGVNPass());
        FPM.addPass(DCEPass());
    }

    for (auto &F : M)
        if (Skip.find(&F) == Skip.end()) FPM.run(F, FAM);
}

int main(int Argc, char **Argv) {
    // Hide all options apart from the ones specific to this tool.
    cl::HideUnrelatedOptions(LifCategory);

    // Parse the command-line options that should be passed to the invariant
    // pass.
    cl::ParseCommandLineOptions(
        Argc, Argv, "transforms functions into versions that are invariant.\n");

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

    // If LenArgs is true, create a module pass manager to run the pass that
    // inserts the length arguments.
    if (LenArgs) runLenArgsPass(*M);
    runInvariantPass(*M);

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

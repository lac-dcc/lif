//===-- Invariant.cpp -----------------------------------------------------===//
///
/// \file
/// This file contains the implementation of the Invariant Pass.
///
//===----------------------------------------------------------------------===//

#include "Invariant.h"
#include "Cond.h"

#include <llvm/IR/PassManager.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>

using namespace llvm;

PreservedAnalyses InvariantPass::run(Function &F, FunctionAnalysisManager &AM) {
    // We currently cannot handle functions with loops, so we use LoopAnalysis
    // info to check if there are any loops.
    auto &LA = AM.getResult<LoopAnalysis>(F);
    if (LA.begin() != LA.end()) {
        errs() << "Error: unexpected loop(s) on function \"" << F.getName()
               << "\" (possible fix: run mem2reg and loop-unroll)\n";
        return PreservedAnalyses::all();
    }

    cond::OutMap Out = cond::allocOut(F);
    cond::InMap In = cond::bind(F, Out);

    return PreservedAnalyses::none();
}

PassPluginLibraryInfo getInvariantPluginInfo() {
    return {LLVM_PLUGIN_API_VERSION, "Invariant Pass", LLVM_VERSION_STRING,
            [](PassBuilder &PB) {
                PB.registerPipelineParsingCallback(
                    [](StringRef Name, FunctionPassManager &PM, ...) {
                        if (Name == "invar") {
                            PM.addPass(InvariantPass());
                            return true;
                        }

                        return false;
                    });
            }};
}

// The public entry point for a pass plugin.
extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getInvariantPluginInfo();
}

#include "Invariant.h"
#include "Cond.h"

#include <llvm/IR/PassManager.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>

using namespace llvm;

PreservedAnalyses Invariant::run(Function &F, FunctionAnalysisManager &AM) {
    // We currently cannot handle functions with loops.
    const auto &LA = AM.getResult<LoopAnalysis>(F);
    if (LA.begin() != LA.end()) {
        errs() << "Error: unexpected loop(s) on function \"" << F.getName()
               << "\" (possible fix: run mem2reg and loop-unroll)\n";
        return PreservedAnalyses::all();
    }

    allocOut(F);
    return PreservedAnalyses::none();
}

PassPluginLibraryInfo getInvariantPluginInfo() {
    return {LLVM_PLUGIN_API_VERSION, "Invariant Pass", LLVM_VERSION_STRING,
            [](PassBuilder &PB) {
                PB.registerPipelineParsingCallback(
                    [](StringRef Name, FunctionPassManager &PM, ...) {
                        if (Name == "invar") {
                            PM.addPass(Invariant());
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

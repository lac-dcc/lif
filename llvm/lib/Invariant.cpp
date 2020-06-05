//===-- Invariant.cpp -----------------------------------------------------===//
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

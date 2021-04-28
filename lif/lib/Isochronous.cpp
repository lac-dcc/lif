//===-- Isochronous.cpp ---------------------------------------------------===//
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
/// This file contains the implementation of the Isochronous Pass, a function
/// pass that transforms a function F into a version that is isochronous. This
/// pass expects each pointer argument of F to be followed by an integer
/// argument representing its length.
///
//===----------------------------------------------------------------------===//

#include "Isochronous.h"
#include "Module.h"

#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>

using namespace lif;

llvm::PreservedAnalyses IsochronousPass::run(llvm::Module &M,
                                             llvm::ModuleAnalysisManager &MAM) {
    llvm::SmallVector<llvm::Function *, 32> Fs;
    for (auto &F : M)
        if (Names.count(F.getName())) Fs.push_back(&F);

    auto &FAM =
        MAM.getResult<llvm::FunctionAnalysisManagerModuleProxy>(M).getManager();

    auto Derived = findDerived(
        M, llvm::SmallPtrSet<llvm::Function *, 32>(Fs.begin(), Fs.end()));

    // We transform every function selected by the user plus the derived ones.
    // If no function was selected, we consider all functions from M as
    // derived, as long as they are used by some other function. We need to
    // filter functions that we don't have access to the definition.
    if (Names.empty()) {
        for (llvm::Function &F : M)
            if (!F.use_empty() && !F.isDeclaration()) Derived.insert(&F);
    }

    // List of functions that shall be isochronified, plus a bool indicating if
    // they are derived or not (i.e. Fs + Derived).
    llvm::SmallVector<std::pair<llvm::Function *, bool>, 32> NeedRepair;

    for (auto *F : Derived) NeedRepair.push_back({F, true});
    for (auto *F : Fs)
        if (!Derived.count(F)) NeedRepair.push_back({F, false});

    auto Wrapped = prepareModule(NeedRepair, M, FAM);
    for (auto &FW : Wrapped) transformFunc(FW.get(), FAM);

    return llvm::PreservedAnalyses::none();
} // namespace lif::isochronous

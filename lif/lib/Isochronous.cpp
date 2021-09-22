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

llvm::PreservedAnalyses
lif::IsochronousPass::run(llvm::Module &M, llvm::ModuleAnalysisManager &MAM) {
    llvm::SmallVector<llvm::Function *, 16> FromUser;
    for (auto [Name, _] : this->Config) {
        auto *F = M.getFunction(Name);
        // We need to filter functions that we don't have access to the
        // definition.
        if (!F->isDeclaration()) FromUser.push_back(M.getFunction(Name));
    }

    auto Derived = findDerived(M, llvm::SmallPtrSet<llvm::Function *, 32>(
                                      FromUser.begin(), FromUser.end()));

    // List of functions that shall be isochronified, plus a bool indicating if
    // they are derived or not (i.e. Fs + Derived).
    llvm::SmallVector<std::pair<llvm::Function *, bool>, 32> NeedRepair;

    for (auto *F : Derived) NeedRepair.push_back({F, true});
    for (auto *F : FromUser)
        if (!Derived.count(F)) NeedRepair.push_back({F, false});

    auto &FAM =
        MAM.getResult<llvm::FunctionAnalysisManagerModuleProxy>(M).getManager();

    auto Wrapped = prepareModule(NeedRepair, this->Config, M, FAM);
    for (auto &FW : Wrapped) transformFunc(FW.get(), FAM);

    return llvm::PreservedAnalyses::none();
}

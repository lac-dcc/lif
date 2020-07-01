//===-- LenArgs.h -----------------------------------------------*- C++ -*-===//
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
/// This file contains the declaration of the LenArgs Pass, which traverses the
/// funtions of a module inserting an integer argument for each pointer arg in
/// the original function. Those integer arguments carry the length of the
/// associated pointer.
///
//===----------------------------------------------------------------------===//
#ifndef LLVM_LIF_LENARGS_H
#define LLVM_LIF_LENARGS_H

#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/IR/PassManager.h>
namespace lenargs {
/// A pass that transforms functions of a given module by inserting the length
/// of each pointer to a function signature.
struct Pass : public llvm::PassInfoMixin<Pass> {
    /// Traverses each function from \p M modifying the signature to include
    /// arguments carrying the length of each pointer arg. Also replace the
    /// original calls, passing the length args.
    ///
    /// \returns the set of analysis preserved after running this pass.
    llvm::PreservedAnalyses run(llvm::Module &M,
                                llvm::ModuleAnalysisManager &MAM);
};
} // namespace lenargs

#endif

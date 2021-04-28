//===-- Isochronous.h -------------------------------------------*- C++ -*-===//
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
/// This file contains the declaration of the Isochronous Pass, which
/// transforms some LLVM IR into a version that executes the same set
/// of instructions regardless of the inputs.
///
//===----------------------------------------------------------------------===//
#ifndef LIF_ISOCHRONOUS_H
#define LIF_ISOCHRONOUS_H

#include <llvm/ADT/StringRef.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>

#include <set>

namespace lif {
/// A pass that transforms a function into an isochronous version.
///
/// An isochronous function executes the same set of instructions regardless of
/// its inputs. Hence, this property can be used, e.g., for the mitigation of
/// side channel leaks on a cryptography library.
///
/// Currently, this pass cannot handle functions contanining loops.
class IsochronousPass : public llvm::PassInfoMixin<IsochronousPass> {
  public:
    /// A constructor that takes the name of functions to be transformed and a
    /// boolean indicating if this pass should insert the length of pointer
    /// arguments.
    IsochronousPass(std::set<llvm::StringRef> Names = {}) : Names(Names){};

    /// Traverses the module \p M transforming functions into isochronous
    /// versions. If FNames is not empty, then we transform only the functions
    /// in there and skip the others.
    ///
    /// \returns the set of analyses preserved after running this pass.
    llvm::PreservedAnalyses run(llvm::Module &M,
                                llvm::ModuleAnalysisManager &MAM);

  private:
    /// A set storing the name of the functions that should be transformed.
    std::set<llvm::StringRef> Names;
};
} // namespace lif

#endif

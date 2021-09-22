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

#include "Config.h"

#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>

namespace lif {
/// A pass that transforms a function into an isochronous version.
///
/// An isochronous function executes the same set of instructions regardless of
/// its inputs. Hence, this property can be used, e.g., for the mitigation of
/// side channel leaks on a cryptography library.
///
/// Requirement: functions must have unique exit points.
class IsochronousPass : public llvm::PassInfoMixin<IsochronousPass> {
  public:
    /// A constructor that takes the module configuration (function names and
    /// observable arguments).
    IsochronousPass(config::Module &Config) : Config(Config){};

    /// Traverses the module \p M transforming functions into isochronous
    /// versions.
    ///
    /// \returns the set of analyses preserved after running this pass.
    llvm::PreservedAnalyses run(llvm::Module &M,
                                llvm::ModuleAnalysisManager &MAM);

  private:
    /// Configuration of the functions that must be transformed.
    config::Module &Config;
};
} // namespace lif

#endif

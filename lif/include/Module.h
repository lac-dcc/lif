//===-- Module.h ------------------------------------------------*- C++ -*-===//
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
/// This file contains module-related types and functions used by the
/// isochronous pass.
///
//===----------------------------------------------------------------------===//
#ifndef LIF_MODULE_H
#define LIF_MODULE_H

#include "Func.h"

#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>

#include <memory>

namespace lif {
/// Searches for the derived functions from \p Fs, i.e. each function called
/// by F as well as the ones called by F's callees and so on.
///
/// \returns a set of the functions collected.
llvm::SmallPtrSet<llvm::Function *, 32>
findDerived(llvm::Module &M, const llvm::SmallPtrSetImpl<llvm::Function *> &Fs);

/// Takes a list of functions \p Fs that are candidates to be isochronified and
/// preprocess them, modifying their interfaces whenever necessary, computing
/// path conditions and value lengths, and preprocessing loops.
///
/// \returns a List of the wrapped functions corresponding to the functions in
/// \p Fs (or their new versions).
llvm::SmallVector<std::unique_ptr<FuncWrapper>, 32>
prepareModule(llvm::SmallVectorImpl<std::pair<llvm::Function *, bool>> &Fs,
              llvm::Module &M, llvm::FunctionAnalysisManager &FAM);
} // namespace lif

#endif

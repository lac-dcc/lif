//===-- Util.h --------------------------------------------------*- C++ -*-===//
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
/// This file contains the declaration of some utility functions.
///
//===----------------------------------------------------------------------===//
#ifndef LLVM_LIF_UTIL_H
#define LLVM_LIF_UTIL_H

#include <llvm/Analysis/TargetLibraryInfo.h>
#include <llvm/IR/Value.h>

namespace util {
/// Given two values, \p VTrue and \p VFalse, and a condition \p Cond,
/// generate instructions for selecting between \p VTrue and \p VFalse.
///
/// We use LLVM select inst. assuming that it is going to be lowered to a
/// constant-time inst. (e.g. cmov on x86). However, it can be manually
/// implemented as ctsel(cond, vtrue, vfalse) = { c = cond - 1; c' = ~c; v
/// = (c & vfalse) | (c' & vtrue) }
///
/// \returns a value representing the selected one.
llvm::Value *ctsel(llvm::Value *Cond, llvm::Value *VTrue, llvm::Value *VFalse,
                   llvm::Instruction *Before);

/// Traverses the list of arguments of F to match each pointer with its
/// length. Also infers the length of local pointers.
llvm::DenseMap<const llvm::Value *, llvm::Value *>
getLen(llvm::Function &F, const llvm::TargetLibraryInfo *TLI);
} // namespace util

#endif

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

#include "Config.h"
#include "Func.h"

#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>

#include <set>

namespace lif {

/// Wrapped type info. For example, if we have a function foo(i32 *), we
/// change it to foo(%i32.wrapped *), where %i32.wrapped = type { i32 *, i64 },
/// such that the second field (i64) is the length of the i32 pointer. A
/// second example would be a function bar(%struct *s), where %struct = type
/// { i32 *, ... }. In this case, we transform it to foo(%struct.extended *),
/// where %struct.extended corresponds to %struct but with its pointers
/// transformed into their wrapped version (as above).
using WrappedFieldSizes = llvm::DenseMap<size_t, size_t>;
using WrappedType = std::pair <llvm::Type *, WrappedFieldSizes>;

/// A wrapper around a module to store additional information.
struct ModuleWrapper {
    /// The actual llvm module:
    llvm::Module &M;
    /// A map from types to their wrapped versions:
    llvm::DenseMap<llvm::Type *, llvm::Type *> WrappedTypes;
    /// A map from wrapped types to their unwrapped versions
    /// (reverse of Wrapped Types):
    llvm::DenseMap<llvm::Type *, llvm::Type *> UnwrappedTypes;
    /// Set of functions that had their interfaces modified and thus need
    /// fixes on their calling sites (their new versions).
    std::vector<llvm::Function *> NeedFix;
    /// Map from modified functions to their old versions.
    llvm::DenseMap<llvm::Function *, llvm::Function *> Replace;
    /// Initialize the underlying llvm module.
    ModuleWrapper(llvm::Module &M) : M(M) {}
};

/// Takes a module \p M and wraps it to store additional information. We fill
/// the map of wrapped types by wrapping structs and pointers that are arguments
/// of functions.
///
/// \returns a wrapped module.
ModuleWrapper wrapModule(llvm::Module &M);

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
prepareModule(ModuleWrapper *M, config::Module &Config,
              llvm::DenseMap<llvm::Function *, bool> Fs,
              llvm::FunctionAnalysisManager &FAM);
} // namespace lif

#endif

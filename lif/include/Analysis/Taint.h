//===-- Taint.h -------------------------------------------------*- C++ -*-===//
// Copyright (C) 2021  Luigi D. C. Soares
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
/// This file contains the declaration of the Taint analysis pass.
///
//===----------------------------------------------------------------------===//
#ifndef LIF_ANALYSIS_TAINT_H
#define LIF_ANALYSIS_TAINT_H

#include <llvm/ADT/DenseSet.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Value.h>

namespace lif::analysis {
/// Set of values that are depend on sensitive information.
using TaintedInfo = llvm::DenseSet<llvm::Value *>;

/// A pass that traverses the call graph of the module to taint values,
/// following control and data dependencies.
struct TaintAnalysis : public llvm::AnalysisInfoMixin<TaintAnalysis> {
    using Result = TaintedInfo;

    /// Traverses the call graph of a module \p M, tainting values that
    /// somehow depend on any secret data. We assume that secret data
    /// is annotated with the key "secret". For example:
    ///
    /// \code{.c}
    /// __attribute__((annotate("secret"))) int *key;
    /// \endcode
    ///
    /// \returns the set of values that are tainted.
    TaintedInfo run(llvm::Module &M, llvm::ModuleAnalysisManager &MAM);

    // A special type used by analysis passes to provide an address that
    // identifies that particular analysis pass type.
    static llvm::AnalysisKey Key;
};

/// Inspects the global variables to search for data annotated as secret.
void taintGlobals(llvm::Module &M, TaintedInfo &T);

/// Inspects a call instruction to search for data annotated as secret.
void taintLocal(llvm::CallInst *Call, TaintedInfo &T);

/// Traverses the dominance tree of a function \p F, marking variables
/// as tainted. For that, we rely on the backward slice of a variable,
/// which is composed by its data and (for phi nodes and loads)
/// control dependencies. For stores (e.g. to an array position) we
/// overapproximate by tainting the entire structure.
void taintFunction(
    llvm::Function &F, TaintedInfo &T, llvm::FunctionAnalysisManager &FAM);
}; // namespace lif::analysis

#endif

//===-- Func.h --------------------------------------------------*- C++ -*-===//
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
/// This file contains function-related types and functions used by the
/// isochronous pass.
///
//===----------------------------------------------------------------------===//
#ifndef LIF_TRANSFORM_FUNC_H
#define LIF_TRANSFORM_FUNC_H

#include "Transform/Cond.h"
#include "Transform/Loop.h"

#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/DenseSet.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/Analysis/TargetLibraryInfo.h>
#include <llvm/IR/Argument.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/PassManager.h>

#include <memory>
#include <variant>

namespace lif::transform {
/// A wrapper around a function to store additional information.
struct FuncWrapper {
    /// The wrapped function.
    llvm::Function &F;
    /// Map of outgoing conditions for each basic block (see Cond.h).
    OutMap OM;
    /// Map of incoming conditions for each basic block (see Cond.h).
    InMap IM;
    /// Set of tainted values (global + local).
    llvm::DenseSet<llvm::Value *> Tainted;
    /// Instructions produced during the program transformation, which
    /// do not need to be rewritten.
    llvm::SmallPtrSet<llvm::Instruction *, 32> Skip;
    /// A wrapper to extend informations about loops (see Loop.h).
    std::unique_ptr<LoopWrapper> LW;
    /// Takes a function \p F and produces a wrapper to extend \p F with useful
    /// information.
    FuncWrapper(llvm::Function &F) : F(F) {}
};

/// The length of a value is represented as a list of llvm::Values. For
/// structs, each position corresponds to the length of one field, whereas
/// for the remaining types the list has exactly one element. For
/// multi-dimensional arrays, we multiply their dimensions to store as a
/// single value. We define it as a shared_ptr so that we can propagate and
/// update in-place.
using ValueLength = std::shared_ptr<std::vector<llvm::Value *>>;

inline ValueLength copyLength(ValueLength &Length) {
    return ValueLength(Length);
}

inline ValueLength makeLength(const std::vector<llvm::Value *> &Length) {
    return std::make_shared<std::vector<llvm::Value *>>(Length);
}

using LenMap = llvm::DenseMap<llvm::Value *, ValueLength>;
/// Traverses the list of arguments of \p F to match each pointer with its
/// length. Also infers the length of local values for later use.
///
/// \returns A map between a value and its length.
LenMap inferLength(llvm::Function &F,
                   llvm::DenseMap<llvm::Type *, llvm::Type *> UnwrappedTypes,
                   const llvm::TargetLibraryInfo *TLI);

/// Given two values, \p VTrue and \p VFalse, and a condition \p Cond,
/// generate instructions for selecting between \p VTrue and \p VFalse.
///
/// We use LLVM select inst. assuming that it is going to be lowered to a
/// constant-time inst. (e.g. cmov on x86). However, it can be manually
/// implemented as ctsel(cond, vtrue, vfalse) = { c = cond - 1; c' = ~c; v
/// = (c & vfalse) | (c' & vtrue) }
///
/// \returns a value representing the selected one.
llvm::SelectInst *ctsel(llvm::Value *Cond, llvm::Value *VTrue,
                        llvm::Value *VFalse, llvm::Instruction *Before);

/// Transforms \p Load into a set of instructions according to the outgoing
/// condition of the basic block (i.e. the fold of the incoming conds.) that
/// contains \p Load.
void rewriteLoad(llvm::LoadInst &Load, llvm::AllocaInst *Shadow, LenMap &LM,
                 llvm::Value *Cond);

/// Transforms \p Store into a set of instructions according to the incoming
/// conditions of the basic block that contains \p Store.
void rewriteStore(llvm::StoreInst &Store, llvm::AllocaInst *Shadow, LenMap &LM,
                  llvm::Value *Cond);

/// Partially rewrite phi functions to adjust them according to the
/// linearization of the CFG.
void rewritePhis(FuncWrapper *FW, llvm::FunctionAnalysisManager &FAM);

/// Transforms \p P (the definition of some a loop-exiting predicate) in a way
/// that it respects the associated \p Phi. That is, whenever \p P becomes true,
/// it cannot change back to false.
///
/// \returns the corresponding new value.
llvm::Value *rewriteExitingPredicate(llvm::Instruction &P, llvm::PHINode &Phi);

/// Produces a compact topological order of a CFG.
///
/// \returns basic blocks in compact topological order.
std::vector<llvm::BasicBlock *>
compactOrder(FuncWrapper *FW, llvm::FunctionAnalysisManager &FAM);

/// Traverses the compact topological order transforming edges to eliminate
/// secret-dependent branches. We use Moll & Hack's partial linearization
/// algorithm published at PLDI:
/// https://compilers.cs.uni-saarland.de/papers/moll_parlin_pldi18.pdf
///
/// Partial linearization is done in-place, so the original edges are
/// lost in the process. The resulting CFG is possibly broken, due to
/// malformed phi functions, so you must fix it!
void plinearize(FuncWrapper *FW, llvm::FunctionAnalysisManager &FAM);

/// Transform \p F into isochronous by applying the proper rules to each
/// instruction.
void rewriteFunc(FuncWrapper *FW, LenMap &LM,
                 llvm::FunctionAnalysisManager &FAM);

/// Takes a basic block \p BB and computes BB's influence region, which
/// comprises every block between BB and its post dominator.
///
/// TODO: move to another file? This doesn't really relate to functions.
///
/// \returns a list of the basic blocks that make up BB's influence region.
std::vector<llvm::BasicBlock *> influenceRegion(
    llvm::BasicBlock *BB, llvm::BasicBlock *PDom
);

/// If F has any tainted call site or F has any pointer argument, we
/// augment its interface with wrapped structs and entry block condition.
///
/// \returns The new function or nullptr if there's no change.
llvm::Function *augmentInterface(
    llvm::Function &F, llvm::DenseMap<llvm::Type *,
    llvm::Type *> &WrappedTypes,
    llvm::DenseMap<llvm::Type *, llvm::Type *> &UnwrappedTypes,
    bool IsTaintedCallee
);

/// Fix the call sites of a function that had its interface modified.
void fixCallSites(
    llvm::Function *OldF, llvm::Function *NewF, bool IsTaintedCallee,
    llvm::DenseMap<llvm::Function *, std::unique_ptr<FuncWrapper>> &WrappedFuncs,
    llvm::DenseMap<llvm::Type *, llvm::Type *> &WrappedTypes
);

/// Takes a function \p F, computes its block (outgoing) & edge (incoming)
/// conditions and wrap everything together into a single structure.
///
/// \returns The wrapped function.
FuncWrapper wrapFunc(
    llvm::Function &F, llvm::DenseSet<llvm::Value *> &Tainted,
    llvm::FunctionAnalysisManager &FAM
);
} // namespace lif::transform

#endif

//===-- Cond.h --------------------------------------------------*- C++ -*-===//
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
/// This file contains the declaration of types and functions related to
/// incoming and outgoing conditions of a basic block.
///
//===----------------------------------------------------------------------===//

#ifndef LIF_TRANSFORM_COND_H
#define LIF_TRANSFORM_COND_H

#include "Transform/Loop.h"

#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Value.h>

namespace lif::transform {
/// A condition from Bp to B, where Bp is a immediate predecessor of B.
///
/// A condition from path B1 to Bk is a set of expressions (predicates) such as
/// {p1, ..., pk}, i.e. c = p1 & ... & pk. A block can have multiple incoming
/// conditions expressed as a set of sets of preds such as {{p1, ..., pk}, {q1,
/// ..., qn}}, with c1 = p1 & ... & pk and c2 = q1 & ... & qn.
///
/// The outgoing condition of a block is a single value represented by some
/// variable out. Hence, for a set of incoming conditions {{p1, ..., pk}, {q1,
/// ..., qn}}, we have an outgoing condition out = c1 | c2.
///
/// The incoming condition, therefore, is defined as Out(Bp) U {predicate(Bp,
/// B)}, where Out(Bp) is the outgoing condition of Bp.
///
/// For convenience, we implement a single incoming condition as a map from the
/// incoming block and its corresponding condition.
using Incoming = llvm::DenseMap<
    /// The predecessor basic block from where the condition comes.
    llvm::BasicBlock *,
    /// Incoming condition. Let Out(Bp) = x and predicate(Bp, B) = p. Then, Cond
    /// = x & p.
    llvm::Value *>;

/// A map between a basic block and its incoming conditions.
using InMap = llvm::DenseMap<llvm::BasicBlock *, Incoming>;

/// A map between a basic block and its outgoing condition. We add an additional
/// outgoing condition for loop exiting blocks that are tainted, so that we can
/// freeze it once it becomes true (meaning that the loop should have exited in
/// the original program).
using OutMap =
    llvm::DenseMap<llvm::BasicBlock *,
                   std::pair<
                       // Outgoing condition of general basic blocks
                       llvm::AllocaInst *,
                       // Frozen outgoing condition of a tainted exiting block
                       llvm::AllocaInst *>>;

/// Allocates a variable for each basic block in \p F, representing their
/// outgoing conditions.
///
/// The actual computation of the outgoing condition is not done here. This
/// function only reserves a name for the out variable. The size of each basic
/// block in \p F grows by O(1) inst.
///
/// \returns a map between basic blocks and their outgoing conditions.
OutMap allocOut(llvm::Function &F, const LoopWrapper &LW,
                const llvm::DenseSet<llvm::Value *> &Tainted);

/// Computes the incoming conditions for a given basic block.
///
/// The size of the basic block grows according to the # of instructions needed
/// to compute the incoming conditions.
///
/// \returns a list of incoming conditions plus a list the Load/Stores created.
std::pair<Incoming, llvm::SmallVector<llvm::Instruction *, 4>>
bindIn(llvm::BasicBlock &BB, llvm::Instruction *Before, const OutMap OM,
       const LoopWrapper &LW, const llvm::DenseSet<llvm::Value *> &Tainted,
       const llvm::DominatorTree &DT);

/// Computes the outgoing condition for \p BB.
///
/// The size of the basic block grows according to the # of instructions needed
/// to compute the outgoing condition.
///
/// \returns the Store created to set the value of the outgoing condition. In
/// addition, if its a loop exiting block, returns the load+store corresponding
/// to the frozen outgoing condition.
std::tuple<llvm::StoreInst *, llvm::LoadInst *, llvm::StoreInst *>
bindOut(llvm::BasicBlock &BB, llvm::Value *OutPtr, llvm::Value *FrozenPtr,
        llvm::Instruction *Before, const Incoming &In, const LoopWrapper &LW);

/// Traverses the basic blocks of \p F, binding the proper incoming and outgoing
/// conditions to them.
///
/// The size of each basic block in \p F grows according to the # of
/// instructions needed to compute both their incoming and outgoing conds.
///
/// \returns a map between basic blocks and their incoming conditions plus a
/// list of the Load/Stores generated.
std::pair<InMap, llvm::SmallVector<llvm::Instruction *, 32>>
bindAll(llvm::Function &F, const OutMap OM, const LoopWrapper &LW,
        const llvm::DenseSet<llvm::Value *> &Tainted,
        const llvm::DominatorTree &DT);

/// Fold a list of incoming conds. (\p In) into a single value by
/// applying the | (or) operator.
///
/// \returns a new value representing the folded condition.
llvm::Value *fold(const Incoming &In, llvm::Instruction *Before,
                  const LoopWrapper &LW);
} // namespace lif::transform

#endif

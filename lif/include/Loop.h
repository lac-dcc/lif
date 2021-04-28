//===-- Loop.h --------------------------------------------------*- C++ -*-===//
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
/// This file contains loop-related types and functions used by both the
/// data-flow analysis that binds conditions to basic blocks and the
/// isochronous pass.
///
//===----------------------------------------------------------------------===//
#ifndef LIF_LOOP_H
#define LIF_LOOP_H

#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Value.h>

namespace lif {
/// Contains useful information to be used by the data-flow analysis and the
/// isochronous pass, such as the phi-functions associated with predicates that
/// branch to outside the loop (see function prepare).
struct LoopWrapper {
    /// LoopInfo produced by running LoopAnalysis.
    llvm::LoopInfo &LI;
    /// A map between the predicate that governs the outcome of a loop exiting,
    /// and the associated phi-functions inserted at the loop header.
    llvm::DenseMap<llvm::Value *, llvm::PHINode *> PredMap;
    /// A set containing all the loop latches (LL), so it is easy to check if a
    /// basic block is one of them. In the case of rotated loops, loop latches
    /// are the ones that contain the loop condition.
    llvm::SmallPtrSet<llvm::BasicBlock *, 32> LLBlocks;
    /// A set containing all the loop exiting blocks, so it is easy to check
    /// if a basic block is one of them.
    llvm::SmallPtrSet<llvm::BasicBlock *, 32> ExitingBlocks;
    /// A set containing all the loop exit blocks, so it is easy to check if a
    /// basic block is one of them.
    llvm::SmallPtrSet<llvm::BasicBlock *, 32> ExitBlocks;
    /// Takes LoopInfo and produces a wrapper to extend \p LI with useful
    /// information.
    LoopWrapper(llvm::LoopInfo &LI) : LI(LI) {}
};

/// In order to handle loops properly, we must insert a phi-function at the
/// loop header for each predicate that branches out the loop. We assume that
/// (i) the loop is in canonical form; and (ii) the loop is rotated. From (ii),
/// we can guarantee that the loop latch will contain the loop condition.
///
/// \returns a map between the predicates and the phi-functions created, a
/// a set containing the loop latches, and sets containing the exiting and
/// exit blocks.
LoopWrapper prepare(llvm::LoopInfo &LI, llvm::LLVMContext &Ctx);
} // namespace lif

#endif

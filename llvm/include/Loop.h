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
#ifndef LLVM_LIF_LOOP_H
#define LLVM_LIF_LOOP_H

#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/Analysis/LoopInfo.h>

namespace loop {
/// Contains useful information to be used by the data-flow analysis and the
/// isochronous pass, such as the phi-functions associated with predicates that
/// branch to outside the loop (see function prepare).
struct LoopWrapper {
    /// LoopInfo produced by running LoopAnalysis.
    llvm::LoopInfo &LI;
    /// A map between the predicate that governs the outcome of a loop exiting,
    /// and the associated phi-functions inserted at the loop header. We also
    /// save the initial value.
    llvm::DenseMap<llvm::Value *, std::pair<llvm::Value *, llvm::Value *>>
        PredMap;
    /// A set that contains "loop condition" (LC) basic blocks. This kind of
    /// basic block can be either the loop header or the (unique) latch. We
    /// assume the loop has a unique latch, so it is easier to handle (run the
    /// "loop-simplify" pass to prepare the loops, if necessary).
    llvm::SmallPtrSet<llvm::BasicBlock *, 32> LCBlocks;
    /// A set containing all the loop latches (LL), so it is easy to check if a
    /// basic block is one of them.
    llvm::SmallPtrSet<llvm::BasicBlock *, 32> LLBlocks;
    /// A set containing all the loop exiting blocks, so it is easy to
    /// check if a basic block is one of them. Note that here we don't consider
    /// the loop condition block.
    llvm::SmallPtrSet<llvm::BasicBlock *, 32> ExitingBlocks;
    /// A set containing all the loop exit blocks, so it is easy to check if a
    /// basic block is one of them.
    llvm::SmallPtrSet<llvm::BasicBlock *, 32> ExitBlocks;
    /// Takes LoopInfo and produces a wrapper to extend \p LI with useful
    /// information.
    LoopWrapper(llvm::LoopInfo &LI) : LI(LI) {}
};

/// In order to handle loops properly, we must insert a phi-function at the
/// the loop header for the predicate of the loop latch, whenever it is
/// conditional. This function assumes that every loop is in the canonical
/// form. Specifically, every loop must contain a single backedge.
//
/// \returns a map between the predicates and the phi-functions created, a
/// set containing "loop condition" basic blocks, and a set containing the loop
/// latches.
LoopWrapper &prepare(llvm::LoopInfo &LI, llvm::LLVMContext &Ctx);

/// This function is pretty similar to "prepare", but instead of inserting
/// phi-functions, it assumes that these phi-functions were already inserted
/// and tries to recover them from the successors of a loop latch.
LoopWrapper &recover(llvm::LoopInfo &LI, llvm::LLVMContext &Ctx);
} // namespace loop

#endif

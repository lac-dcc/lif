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
    const llvm::LoopInfo &LI;
    /// A map between the predicate that governs the outcome of an exiting
    /// block (except for the loop condition block) to the associated
    /// phi-function at the header, created by calling "loop::prepare".
    llvm::DenseMap<llvm::Value *, llvm::Value *> PredMap;
    /// A set that contains "loop condition" basic blocks. This kind of basic
    /// block can be either the loop header or the (unique) latch. We assume
    /// the loop has a unique latch, so it is easier to handle (run the
    /// "loop-simplify" pass to prepare the loops, if necessary).
    llvm::SmallPtrSet<llvm::BasicBlock *, 32> LCBlocks;
    /// Takes LoopInfo and produces a wrapper to extend \p LI with useful
    /// information.
    LoopWrapper(const llvm::LoopInfo &LI) : LI(LI) {}
};

/// In order to handle loops properly, we must insert a phi-function at the
/// loop header for each conditional statement that targets a basic block
/// outside the loop (e.g. if break/return). This function assumes that every
/// loop is in the canonical form. Specifically, every loop must contain a
/// single backedge.
//
/// \returns a map between the predicates and the phi-functions created, plus a
/// set containing "loop condition" basic blocks.
LoopWrapper prepare(const llvm::LoopInfo &LI, llvm::LLVMContext &Ctx);
} // namespace loop

#endif

//===-- Cond.cpp ----------------------------------------------------------===//
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
/// This file contains the implementation of the functions related to both
/// incoming and outgoing conditions of some basic block.
///
//===----------------------------------------------------------------------===//

#include "Cond.h"

#include <cstddef>
#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Constant.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/raw_ostream.h>
#include <numeric>

using namespace llvm;

namespace cond {
OutMap allocOut(Function &F) {
    OutMap OutM(F.size());
    auto Before = &*F.getEntryBlock().getFirstInsertionPt();
    auto BoolTy = IntegerType::getInt1Ty(F.getContext());
    for (BasicBlock &BB : F)
        OutM[&BB] = new AllocaInst(BoolTy, 0, "out.", Before);
    return OutM;
}

std::pair<SmallVector<Incoming, 8>, SmallVector<Value *, 4>>
bindIn(BasicBlock &BB, const OutMap OutM) {
    SmallVector<Incoming, 8> InV;
    SmallVector<Value *, 4> GenV;

    for (auto Bp : predecessors(&BB)) {
        // Whenever P is a Loop Condition Basic Block, we must not include its
        // predicate in the incoming conditions of BB.

        auto Terminator = Bp->getTerminator();
        auto Br = dyn_cast<BranchInst>(Terminator);

        // TODO: Handle switch, etc...
        if (!Br) continue;

        // Get the address of the instruction associated with the first
        // insertion pointer.
        auto Before = &*BB.getFirstInsertionPt();

        // Out map must have been constructed already; thus, every
        // basic block should be associated with an out variable.
        auto OutPtr = cast<AllocaInst>(OutM.lookup(Bp));
        Instruction *C =
            new LoadInst(OutPtr->getAllocatedType(), OutPtr, "", Before);

        GenV.push_back(C);
        if (Br->isConditional()) {
            // If we are at an else branch, then we should negate the
            // predicate.
            auto P = Br->getCondition();
            if (Br->getSuccessor(1) == &BB) {
                P = BinaryOperator::CreateNot(P, "", Before);
                GenV.push_back(P);
            }

            C = BinaryOperator::CreateAnd(C, P, "in.", Before);
            GenV.push_back(C);
        }

        // Insert to the beginning of the vector to preserve the insertion
        // order at the basic block.
        InV.insert(InV.begin(), {C /* Cond */, Bp /* From */});
    }

    return {InV, GenV};
}

std::vector<Value *> bindOut(BasicBlock &BB, Value *OutPtr,
                             const SmallVectorImpl<Incoming> &InV) {
    std::vector<Value *> GenV;

    // Compute and store the proper value at OutPtr.
    Value *OutV;
    Instruction *Before;

    if (InV.empty()) {
        // There are no incoming conditions, so we set the out value as
        // true.
        auto BoolTy = IntegerType::getInt1Ty(BB.getContext());
        OutV = ConstantInt::get(BoolTy, 1);
        Before = cast<Instruction>(OutPtr)->getNextNode();
    } else {
        OutV = fold(InV);
        Before = cast<Instruction>(OutV)->getNextNode();
    }

    // TODO: Let (p1, p2) be a pair composed by a predicate of a branch at a
    // loop's exiting block (except for loop condition). If BB is the loop
    // latch, we must replace p1 by p2 in the outgoing of BB. That is, we must
    // traverse each instruction from OutV, search for the use of p1 as an
    // operand and replace it. This must be done for every pair (p1, p2). There
    // is probably a better solution, but let's stick with that for now.

    GenV.push_back(new StoreInst(OutV, OutPtr, Before));
    return GenV;
}

std::pair<InMap, std::vector<Value *>> bind(Function &F, const OutMap OutM,
                                            const loop::LoopWrapper LW) {
    InMap InM(F.size());
    std::vector<Value *> GenV;

    for (BasicBlock &BB : F) {
        auto [InV, GenInV] = bindIn(BB, OutM);
        InM[&BB] = InV;
        GenV.insert(GenV.end(), GenInV.begin(), GenInV.end());
        auto GenOutV = bindOut(BB, OutM.lookup(&BB), InV);
        GenV.insert(GenV.end(), GenOutV.begin(), GenOutV.end());
    }

    return {InM, GenV};
}

Value *fold(const SmallVectorImpl<Incoming> &InV) {
    if (InV.size() == 1) return InV[0].Cond;

    Instruction *Before = cast<Instruction>(InV.back().Cond)->getNextNode();
    auto ApplyOr = [&Before](Value *U, Value *V) {
        return BinaryOperator::CreateOr(U, V, "", Before);
    };

    return std::accumulate(
               InV.begin() + 2, InV.end(),
               SmallVector<Value *, 8>({ApplyOr(InV[0].Cond, InV[1].Cond)}),
               [&ApplyOr](auto Accum, auto In) {
                   Accum.push_back(ApplyOr(Accum.back(), In.Cond));
                   return Accum;
               })
        .back();
}

} // namespace cond

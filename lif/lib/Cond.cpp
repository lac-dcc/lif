//===-- Cond.cpp ----------------------------------------------------------===//
// Copyright (C) 2020  Luigi D. C. Soares
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
// details.
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

#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/Support/Casting.h>

using namespace lif;

OutMap lif::allocOut(llvm::Function &F) {
    OutMap OM(F.size());
    auto *Before = &*F.getEntryBlock().getFirstInsertionPt();
    auto *BoolTy = llvm::IntegerType::getInt1Ty(F.getContext());

    // Allocate an outgoing variable for every basic block in F.
    for (auto &BB : F)
        OM[&BB] = new llvm::AllocaInst(BoolTy, 0, "out.", Before);

    return OM;
}

std::pair<llvm::SmallVector<Incoming, 4>,
          llvm::SmallVector<llvm::Instruction *, 4>>
lif::bindIn(llvm::BasicBlock &BB, const OutMap OM, const LoopWrapper &LW) {
    llvm::SmallVector<Incoming, 4> Incomings;
    llvm::SmallVector<llvm::Instruction *, 4> MemInsts;
    auto LatchEnd = LW.Latches.end();

    for (auto *Bp : predecessors(&BB)) {
        auto *Terminator = Bp->getTerminator();
        auto *Br = llvm::dyn_cast<llvm::BranchInst>(Terminator);

        // TODO: Handle switch, etc...
        if (!Br) continue;

        // Get the address of the instruction associated with the first
        // insertion pointer.
        auto *Before = &*BB.getFirstInsertionPt();

        // Out map must have been constructed already; thus, every
        // basic block should be associated with an out variable.
        auto OutPtr = llvm::cast<llvm::AllocaInst>(OM.lookup(Bp));
        llvm::Instruction *C =
            new llvm::LoadInst(OutPtr->getAllocatedType(), OutPtr, "", Before);

        MemInsts.push_back(C);

        // Whenever Bp is a Loop Latch containing the loop condition, we shall
        // not include its predicate in the incoming conditions of BB.
        if (Br->isConditional() && LW.Latches.find(Bp) == LatchEnd) {
            auto *P = Br->getCondition();
            // If we are at an else branch, then we should negate the
            // predicate. Otherwise, just use the original condition.
            if (Br->getSuccessor(1) == &BB)
                P = llvm::BinaryOperator::CreateNot(P, "", Before);

            C = llvm::BinaryOperator::CreateAnd(C, P, "in.", Before);
        }

        // Insert to the beginning of the vector to preserve the insertion
        // order at the basic block.
        Incomings.insert(Incomings.begin(), {C, Bp});
    }

    return {Incomings, MemInsts};
}

llvm::StoreInst *
lif::bindOut(llvm::BasicBlock &BB, llvm::Value *OutPtr,
             const llvm::SmallVectorImpl<Incoming> &Incomings) {
    // Compute and store the proper value at OutPtr.
    llvm::Value *OutVal;
    llvm::Instruction *Before;

    if (Incomings.empty()) {
        // There are no incoming conditions, so we set the out value as
        // true.
        auto *BoolTy = llvm::IntegerType::getInt1Ty(BB.getContext());
        OutVal = llvm::ConstantInt::getTrue(BoolTy);
        Before = llvm::cast<llvm::Instruction>(OutPtr)->getNextNode();
    } else {
        OutVal = fold(Incomings);
        Before = llvm::cast<llvm::Instruction>(OutVal)->getNextNode();
    }

    return new llvm::StoreInst(OutVal, OutPtr, Before);
}

std::pair<InMap, llvm::SmallVector<llvm::Instruction *, 32>>
lif::bindAll(llvm::Function &F, const OutMap OM, const LoopWrapper &LW) {
    InMap IM(F.size());
    llvm::SmallVector<llvm::Instruction *, 32> MemInsts;

    auto *BoolTy = llvm::IntegerType::getInt1Ty(F.getContext());
    auto *False = llvm::ConstantInt::getFalse(BoolTy);
    auto LatchEnd = LW.Latches.end();

    for (auto &BB : F) {
        auto [Incomings, MemInstsIn] = bindIn(BB, OM, LW);
        IM[&BB] = Incomings;
        MemInsts.insert(MemInsts.end(), MemInstsIn.begin(), MemInstsIn.end());
        auto *OutPtr = OM.lookup(&BB);
        // Whenever BB is a loop latch, we need to initialize its reserved
        // outgoing variable as "false", for it is used to compute the incoming
        // conditions of the loop header. Otherwise, the initial value will be
        // a trash, which can produce undefined behavior.
        if (LW.Latches.find(&BB) != LatchEnd) {
            new llvm::StoreInst(
                False, OutPtr,
                llvm::cast<llvm::Instruction>(OutPtr)->getNextNode());
        }
        auto *Store = bindOut(BB, OutPtr, Incomings);
        MemInsts.push_back(llvm::cast<llvm::Instruction>(Store));
    }

    return {IM, MemInsts};
}

llvm::BinaryOperator *
lif::fold(const llvm::SmallVectorImpl<Incoming> &Incomings) {
    auto *Before =
        llvm::cast<llvm::Instruction>(Incomings.back().Cond)->getNextNode();

    auto Or = [Before](llvm::Value *X, llvm::Value *Y) {
        return llvm::BinaryOperator::CreateOr(X, Y, "", Before);
    };

    auto *BoolTy = llvm::IntegerType::getInt1Ty(Before->getContext());
    auto *False = llvm::ConstantInt::getFalse(BoolTy);
    auto *IncEnd = Incomings.end();

    auto *Fold = Or(False, Incomings[0].Cond);
    for (auto It = Incomings.begin() + 1; It != IncEnd; ++It)
        Fold = Or(Fold, It->Cond);

    return Fold;
}

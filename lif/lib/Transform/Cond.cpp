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

#include "Transform/Cond.h"

#include <llvm/IR/CFG.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/Casting.h>

using namespace lif::transform;

OutMap lif::transform::allocOut(
    llvm::Function &F, const LoopWrapper &LW,
    const llvm::DenseSet<llvm::Value *> &Tainted
) {
    OutMap OM(F.size());

    auto InsPoint = F.getEntryBlock().getFirstNonPHI();
    auto BoolTy = llvm::IntegerType::getInt1Ty(F.getContext());
    auto False = llvm::ConstantInt::getFalse(BoolTy);

    // Allocate an outgoing variable for every basic block in F.
    for (auto &BB : F) {
        auto Out = new llvm::AllocaInst(BoolTy, 0, "out.", InsPoint);
        new llvm::StoreInst(False, Out, Out->getNextNode());

        llvm::AllocaInst *Frozen = nullptr;
        if (LW.ExitingBlocks.contains(&BB) && Tainted.contains(&BB)) {
            Frozen = new llvm::AllocaInst(BoolTy, 0, "out.frozen", InsPoint);
            new llvm::StoreInst(False, Frozen, Frozen->getNextNode());
        }

        OM[&BB] = {Out, Frozen};
    }

    return OM;
}

std::pair<Incoming, llvm::SmallVector<llvm::Instruction *, 4>>
lif::transform::bindIn(
    llvm::BasicBlock &BB, llvm::Instruction *Before, const OutMap OM,
    const LoopWrapper &LW, const llvm::DenseSet<llvm::Value *> &Tainted,
    const llvm::DominatorTree &DT
) {
    Incoming In;
    llvm::SmallVector<llvm::Instruction *, 4> Skip;

    auto EntryInsertionPoint = BB.getParent()->getEntryBlock().getFirstNonPHI();

    for (auto Pred : predecessors(&BB)) {
        auto T = Pred->getTerminator();
        auto Branch = llvm::dyn_cast<llvm::BranchInst>(T);

        // TODO: Handle switch, etc...
        if (!Branch) continue;

        // Out map must have been constructed already; thus, every
        // basic block should be associated with an out variable. In the case of
        // loop exiting edges that are tainted, we consider the frozen outgoing
        // condition.
        auto OutPtr = LW.ExitBlocks.contains(&BB) &&
                              LW.ExitingBlocks.contains(Pred) &&
                              Tainted.contains(Pred)
                          ? OM.lookup(Pred).second
                          : OM.lookup(Pred).first;

        llvm::Instruction *C =
            new llvm::LoadInst(OutPtr->getAllocatedType(), OutPtr, "", Before);

        Skip.push_back(C);

        if (!Branch->isConditional()) {
            In[Pred] = C;
            continue;
        }

        auto P = Branch->getCondition();
        // We're only partially linearizing branches; hence, the predicate
        // might not be available for every predecessor:
        if (!DT.dominates(Pred, &BB)) {
            auto PTy = P->getType();
            auto AllocaP = new llvm::AllocaInst(
                PTy, 0, "pred.alloca", EntryInsertionPoint);

            // The initial value indicates the the the edge Pred -> BB
            // hasn't been traversed yet:
            //   a) If Pred -> BB is a "then" branch, then false.
            //   b) If Pred -> BB is an "else" branch, then true,
            //   so we can negate it to get false.
            llvm::Value *InitVal = Branch->getSuccessor(0) == &BB
                                       ? llvm::ConstantInt::getFalse(PTy)
                                       : llvm::ConstantInt::getTrue(PTy);

            // We don't want to skip these stores in the transformation.
            // Otherwise, we could visit Pred in a dummy path and the
            // predicate could get overwritten.
            new llvm::StoreInst(InitVal, AllocaP, EntryInsertionPoint);
            new llvm::StoreInst(P, AllocaP, Pred->getTerminator());

            P = new llvm::LoadInst(
                PTy, AllocaP, "pred.load", BB.getFirstNonPHI());
            Skip.push_back(llvm::cast<llvm::LoadInst>(P));
        }

        // If we are at an else branch, then we should negate the
        // predicate. Otherwise, just use the original condition.
        if (Branch->getSuccessor(1) == &BB)
            P = llvm::BinaryOperator::CreateNot(P, "", Before);

        C = llvm::BinaryOperator::CreateAnd(C, P, "in.", Before);

        In[Pred] = C;
    }

    return {In, Skip};
}

std::tuple<llvm::StoreInst *, llvm::LoadInst *, llvm::StoreInst *>
lif::transform::bindOut(
    llvm::BasicBlock &BB, llvm::Value *OutPtr, llvm::Value *FrozenPtr,
    llvm::Instruction *Before, const Incoming &In, const LoopWrapper &LW
) {
    auto BoolTy = llvm::IntegerType::getInt1Ty(BB.getContext());
    auto True = llvm::ConstantInt::getTrue(BoolTy);

    // If there are no incoming conditions, we set the out value as true.
    llvm::Value *OutVal = True;
    if (!In.empty()) OutVal = fold(In, Before, LW);

    auto StoreOut = new llvm::StoreInst(OutVal, OutPtr, Before);

    // Frozen versions:
    llvm::LoadInst *LoadF = nullptr;
    llvm::StoreInst *StoreF = nullptr;

    if (FrozenPtr) {
        LoadF = new llvm::LoadInst(BoolTy, FrozenPtr, "load.frozen", Before);
        StoreF = new llvm::StoreInst(
            llvm::BinaryOperator::CreateOr(LoadF, OutVal, "or.frozen", Before),
            FrozenPtr, Before);
    }

    return {StoreOut, LoadF, StoreF};
}

std::pair<InMap, llvm::SmallVector<llvm::Instruction *, 32>>
lif::transform::bindAll(
    llvm::Function &F, const OutMap OM, const LoopWrapper &LW,
    const llvm::DenseSet<llvm::Value *> &Tainted,
    const llvm::DominatorTree &DT
) {
    InMap IM(F.size());
    llvm::SmallVector<llvm::Instruction *, 32> MemInsts;

    auto BoolTy = llvm::IntegerType::getInt1Ty(F.getContext());
    auto False = llvm::ConstantInt::getFalse(BoolTy);
    auto LatchEnd = LW.Latches.end();

    auto EntryInsertionPoint = F.getEntryBlock().getFirstNonPHI();
    while (llvm::isa<llvm::AllocaInst>(EntryInsertionPoint) ||
           llvm::isa<llvm::StoreInst>(EntryInsertionPoint))
        EntryInsertionPoint = EntryInsertionPoint->getNextNode();

    for (auto &BB : F) {
        auto InsertionPoint =
            BB.isEntryBlock() ? EntryInsertionPoint : BB.getFirstNonPHI();

        auto [In, MemInstsIn] = bindIn(BB, InsertionPoint, OM, LW, Tainted, DT);
        IM[&BB] = In;
        MemInsts.insert(MemInsts.end(), MemInstsIn.begin(), MemInstsIn.end());
        auto [OutPtr, FrozenPtr] = OM.lookup(&BB);
        // Whenever BB is a loop latch, we need to initialize its reserved
        // outgoing variable as "false", for it is used to compute the incoming
        // conditions of the loop header. Otherwise, the initial value will be
        // a trash, which can produce undefined behavior.
        if (LW.Latches.find(&BB) != LatchEnd)
            new llvm::StoreInst(False, OutPtr, EntryInsertionPoint);

        auto [StoreOut, LoadFrozen, StoreFrozen] =
            bindOut(BB, OutPtr, FrozenPtr, InsertionPoint, In, LW);

        MemInsts.push_back(StoreOut);
        if (StoreFrozen) {
            MemInsts.push_back(LoadFrozen);
            MemInsts.push_back(StoreFrozen);
        }
    }

    return {IM, MemInsts};
}

llvm::Value *lif::transform::fold(
    const Incoming &In, llvm::Instruction *Before, const LoopWrapper &LW
) {
    auto Or = [Before](auto X, auto Y) {
        return llvm::BinaryOperator::CreateOr(X, Y, "cond.fold", Before);
    };

    auto BoolTy = llvm::IntegerType::getInt1Ty(Before->getContext());
    llvm::Value *Fold = llvm::ConstantInt::getFalse(BoolTy);

    auto BB = Before->getParent();
    if (!LW.Headers.contains(BB)) {
        for (auto [_, Cond] : In) Fold = Or(Fold, Cond);
        return Fold;
    }

    auto L = LW.LI.getLoopFor(BB);
    auto PreHeader = L->getLoopPreheader();
    assert(PreHeader &&
           "error: we require loops to have a preheader! please, run the "
           "--loop-simplify pass.");

    auto Latch = L->getLoopLatch();
    assert(Latch &&
           "error: we require loops to have a unique latch! please, run the "
           "--loop-simplify pass.");

    assert(In.size() == 2 &&
           "error: wrong number of incoming conditions for loop header!");

    auto AndFw = llvm::BinaryOperator::CreateAnd(LW.FwedgeTakenPhi.lookup(BB),
                                                 In.lookup(PreHeader),
                                                 "fwcond.and.fwtaken", Before);

    return Or(AndFw, In.lookup(Latch));
}

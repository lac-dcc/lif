//===-- Loop.cpp ----------------------------------------------------------===//
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
/// This file contains the implementation of some loop-related utilities used
/// by both the data-flow analysis that binds conditions to basic blocks and
/// the isochronous pass.
///
//===----------------------------------------------------------------------===//

#include "Loop.h"

#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/Casting.h>

using namespace lif;

LoopWrapper lif::prepare(llvm::LoopInfo &LI, llvm::LLVMContext &Ctx) {
    LoopWrapper LW(LI);

    auto BoolTy = llvm::IntegerType::getInt1Ty(Ctx);
    auto True = llvm::ConstantInt::getTrue(BoolTy);
    auto False = llvm::ConstantInt::getFalse(BoolTy);

    for (auto L : LI.getLoopsInPreorder()) {
        auto Header = L->getHeader();
        LW.Headers.insert(Header);

        assert(L->getLoopPreheader() &&
               "error: we require loops to have a preheader! please, run the "
               "--loop-simplify pass.");

        auto Latch = L->getLoopLatch();
        assert(
            Latch &&
            "error: we require loops to have a unique latch! please, run the "
            "--loop-simplify pass.");

        // Save every loop latch for future use, if necessary.
        LW.Latches.insert(Latch);

        // Insert a phi function to identify, during the execution, whether the
        // backedge was taken or not.
        auto NumHeaderPred = llvm::pred_size(Header);
        auto InsertionPoint = Header->getFirstNonPHI();
        LW.BackedgeTakenPhi[Header] = llvm::PHINode::Create(
            BoolTy, NumHeaderPred, "backedge.taken", InsertionPoint);

        for (auto Pred : llvm::predecessors(Header))
            LW.BackedgeTakenPhi[Header]->addIncoming(
                Pred == Latch ? True : False, Pred);

        llvm::SmallVector<llvm::BasicBlock *, 4> ExitingBlocks;
        L->getExitingBlocks(ExitingBlocks);

        for (auto Exiting : ExitingBlocks) {
            LW.ExitingBlocks.insert(Exiting);
            // For each exiting block LE, insert a phi-function at the LH
            // associated with the predicate of LE.
            auto T = llvm::cast<llvm::BranchInst>(Exiting->getTerminator());
            auto C = T->getCondition();
            auto Phi = llvm::PHINode::Create(
                BoolTy, NumHeaderPred,
                (T->hasName() ? T->getName() : "exitpred") + ".freezed",
                InsertionPoint);

            for (auto Pred : llvm::predecessors(Header)) {
                Phi->addIncoming(LW.Latches.count(Pred) ? C : False, Pred);
                LW.ExitPredPhi[C] = Phi;
            }
        }

        // Save every loop exit block as well.
        llvm::SmallVector<llvm::BasicBlock *, 4> ExitBlocks;
        L->getExitBlocks(ExitBlocks);
        for (auto Exit : ExitBlocks) LW.ExitBlocks.insert(Exit);
    }

    return LW;
}

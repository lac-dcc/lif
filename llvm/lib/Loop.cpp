//===-- Loop.h ------------------------------------------------------------===//
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
#include <llvm/Analysis/LoopInfo.h>

using namespace llvm;

namespace loop {
LoopWrapper &prepare(LoopInfo &LI, LLVMContext &Ctx) {
    auto LW = new LoopWrapper(LI);

    auto BoolTy = IntegerType::getInt1Ty(Ctx);
    auto True = ConstantInt::getTrue(BoolTy);
    auto False = ConstantInt::getFalse(BoolTy);

    for (auto L : LI.getLoopsInPreorder()) {
        auto LH = L->getHeader();
        auto LL = L->getLoopLatch();
        assert(L->isRotatedForm() && "loop is not in rotated form!");

        // Save every loop latch for future use, if necessary.
        LW->LLBlocks.insert(LL);

        SmallVector<BasicBlock *, 4> ExitingBlocks;
        L->getExitingBlocks(ExitingBlocks);
        auto Before = LH->getFirstNonPHI();
        for (auto LE : ExitingBlocks) {
            // For each exiting block LE, insert a phi-function at the LH
            // associated with the predicate of LE.
            auto LET = cast<BranchInst>(LE->getTerminator());
            auto C = LET->getCondition();
            // It can be the LL, which targets the LH. We need this information
            // in order to get the correct initial value.
            auto Init = LET->getSuccessor(0) == LH ? True : False;
            auto Phi = PHINode::Create(BoolTy, pred_size(LH), "p", Before);
            for (auto P : predecessors(LH)) {
                Phi->addIncoming(P == LL ? C : Init, P);
                LW->PredMap[C] = {Phi, Init};
            }
        }

        // Save every loop exit block as well.
        SmallVector<BasicBlock *, 4> ExitBlocks;
        L->getExitBlocks(ExitBlocks);
        for (auto LE : ExitBlocks) LW->ExitBlocks.insert(LE);
    }

    return *LW;
} // namespace loop

LoopWrapper &recover(LoopInfo &LI, LLVMContext &Ctx) {
    auto LW = new LoopWrapper(LI);
    for (auto L : LI.getLoopsInPreorder()) {
        assert(L->isRotatedForm() && "loop is not in rotated form!");
        auto LH = L->getHeader();
        auto LL = L->getLoopLatch();

        // Save every loop latch for future use, if necessary.
        LW->LLBlocks.insert(LL);
        // Save every loop exiting block that is not the loop condition.
        SmallVector<BasicBlock *, 4> ExitingBlocks;
        L->getExitingBlocks(ExitingBlocks);
        for (auto LE : ExitingBlocks) {
            // For each exiting block LE, there is a phi-function at the LH
            // associated with the predicate of LE.
            auto LET = cast<BranchInst>(LE->getTerminator());
            auto C = LET->getCondition();
            // Since the loop is in canonical form, the predecessor of the
            // header outside the loop is always unique: it is the loop
            // preheader.
            auto LHP = L->getLoopPredecessor();
            for (auto &I : *LH) {
                auto Phi = dyn_cast<PHINode>(&I);
                if (!Phi) continue;
                if (Phi->getIncomingValueForBlock(LL) == C)
                    LW->PredMap[C] = {Phi, Phi->getIncomingValueForBlock(LHP)};
            }
        }

        // Save every loop exit block.
        SmallVector<BasicBlock *, 4> ExitBlocks;
        L->getExitBlocks(ExitBlocks);
        for (auto LE : ExitBlocks) LW->ExitBlocks.insert(LE);
    }

    return *LW;
}
} // namespace loop

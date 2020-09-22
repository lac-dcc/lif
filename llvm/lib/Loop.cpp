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

    for (auto L : LI) {
        auto LH = L->getHeader();
        auto LL = L->getLoopLatch();

        // Save every loop latch for future use, if necessary.
        LW->LLBlocks.insert(LL);

        // We need to save this. LC is the basic block that contains
        // the loop condition. It can be the header or the latch. The predicate
        // of this block must not be included in the incoming conditions of its
        // successors, since the loop will always run the same number of
        // iterations.
        auto LHT = cast<BranchInst>(LH->getTerminator());

        // In order to find the LC block, we need to find the loop induction
        // variable. We assume it is in canonical form (run -indvars). The
        // canonical induction variable is guaranteed to be the first PHI node
        // in the loop header block.
        auto LIV = L->getCanonicalInductionVariable();
        assert(LIV && "loop induction variable not in canonical form!");

        BasicBlock *LC = nullptr;
        if (LHT->isConditional()) {
            auto C = dyn_cast<Instruction>(LHT->getCondition());
            if (!C) break;

            for (auto &Op : C->operands()) {
                if (Op == LIV) {
                    LC = LH;
                    break;
                }
            }
        }

        // If LC was set as the loop header, leave it as it is. Else, it is the
        // loop latch.
        LC = LC ?: LL;
        LW->LCBlocks.insert(LC);

        SmallVector<BasicBlock *, 4> ExitingBlocks;
        L->getExitingBlocks(ExitingBlocks);
        auto Before = LH->getFirstNonPHI();
        for (auto LE : ExitingBlocks) {
            // Save every loop exiting block that is not the loop condition as
            // exiting block.
            if (LE != LC) LW->ExitingBlocks.insert(LE);
            if (LE == LH && LH == LC) continue;
            // For each exiting block LE (except the LH, if it is the LC),
            // insert a phi-function at the LH associated with the predicate of
            // LE.
            auto LET = cast<BranchInst>(LE->getTerminator());
            auto C = LET->getCondition();
            // It can be the LC, which targets the LH. We need this information
            // in order to get the correct initial value.
            auto Init = LET->getSuccessor(0) == LH ? True : False;
            auto Phi = PHINode::Create(BoolTy, pred_size(LH), "p", Before);
            for (auto P : predecessors(LH)) {
                Phi->addIncoming(P == LL ? C : Init, P);
                LW->PredMap[C] = {Phi, Init};
            }
        }

        // Save every loop exit block.
        SmallVector<BasicBlock *, 4> ExitBlocks;
        L->getExitBlocks(ExitBlocks);
        for (auto LE : ExitBlocks) LW->ExitBlocks.insert(LE);
    }

    return *LW;
} // namespace loop

LoopWrapper &recover(LoopInfo &LI, LLVMContext &Ctx) {
    auto LW = new LoopWrapper(LI);
    for (auto L : LI) {
        auto LH = L->getHeader();
        auto LL = L->getLoopLatch();

        // Save every loop latch for future use, if necessary.
        LW->LLBlocks.insert(LL);

        // We need to save this. LC is the basic block that contains
        // the loop condition. It can be the header or the latch. The predicate
        // of this block must not be included in the incoming conditions of its
        // successors, since the loop will always run the same number of
        // iterations.
        auto LHT = cast<BranchInst>(LH->getTerminator());

        // In other to find the LC block, we need to find the loop induction
        // variable. We assume it is in canonical form (run -indvars). The
        // canonical induction variable is guaranteed to be the first PHI node
        // in the loop header block.
        auto LIV = L->getCanonicalInductionVariable();
        assert(LIV);

        BasicBlock *LC = nullptr;
        if (LHT->isConditional()) {
            auto C = dyn_cast<Instruction>(LHT->getCondition());
            if (!C) break;

            for (auto &Op : C->operands()) {
                if (Op == LIV) {
                    LC = LH;
                    break;
                }
            }
        }

        // If LC was set as the loop header, leave it as it is. Else, it is the
        // loop latch.
        LC = LC ?: LL;
        LW->LCBlocks.insert(LC);

        // Save every loop exiting block that is not the loop condition.
        SmallVector<BasicBlock *, 4> ExitingBlocks;
        L->getExitingBlocks(ExitingBlocks);
        for (auto LE : ExitingBlocks) {
            if (LE != LC) LW->ExitingBlocks.insert(LE);
            if (LE == LH && LH == LC) continue;
            // For each exiting block LE (except the LH, if it is the LC),
            // that is a phi-function at the LH associated with the predicate of
            // LE.
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

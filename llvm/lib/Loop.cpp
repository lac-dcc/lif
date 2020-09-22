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
LoopWrapper prepare(const LoopInfo &LI, LLVMContext &Ctx) {
    LoopWrapper LW(LI);

    auto BoolTy = IntegerType::getInt1Ty(Ctx);
    auto False = ConstantInt::getFalse(BoolTy);

    for (auto L : LI) {
        auto LH = L->getHeader();
        auto LL = L->getLoopLatch();
        auto LP = L->getLoopPredecessor();
        auto Before = LH->getFirstNonPHI();

        // We need to save this. LC is the basic block that contains
        // the loop condition. It can be the header of the latch (we assume
        // it is unique). The predicate of this block must not be included
        // in the incoming conditions of its successors, since the loop
        // will always run the same number of iterations.
        auto T = cast<BranchInst>(LH->getTerminator());
        LW.LCBlocks.insert(T->isConditional() ? LH : LL);

        SmallVector<BasicBlock *, 4> ExitingBlocks;
        L->getExitingBlocks(ExitingBlocks);

        for (auto B : ExitingBlocks) {
            if (B == LH) continue;

            auto T = cast<BranchInst>(B->getTerminator());
            // TODO: Handle unconditonal brs?
            assert(T->isConditional());

            // Insert phi [false, LP] [p, LL] at the header LH, where p is
            // the predicate that governs that outcome of B, LP is the
            // block that preceeds LH (outside the loop), and LL is the
            // (unique) latch. We assume that the loop has a unique latch,
            // so it is easier to produce the correct phi-function.
            auto Phi = PHINode::Create(BoolTy, 2, "p", Before);
            auto P = T->getCondition();

            Phi->addIncoming(False, LP);
            Phi->addIncoming(P, LL);

            LW.PredMap[P] = Phi;
        }
    }

    return LW;
}
} // namespace loop

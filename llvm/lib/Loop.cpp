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
    auto True = ConstantInt::getTrue(BoolTy);
    auto False = ConstantInt::getFalse(BoolTy);

    for (auto L : LI) {
        auto LH = L->getHeader();
        auto LL = L->getLoopLatch();

        // Save every loop latch for future use, if necessary.
        LW.LLBlocks.insert(LL);

        // We need to save this. LC is the basic block that contains
        // the loop condition. It can be the header of the latch (we assume
        // it is unique). The predicate of this block must not be included
        // in the incoming conditions of its successors, since the loop
        // will always run the same number of iterations.
        auto LHT = cast<BranchInst>(LH->getTerminator());
        LW.LCBlocks.insert(LHT->isConditional() ? LH : LL);

        // For each successor S of the loop latch LL, such that S has more than
        // one predecessor Sp, insert a phi-function for the predicate of LL.
        auto LLT = cast<BranchInst>(LL->getTerminator());
        if (!LLT->isConditional()) continue;

        auto P = LLT->getCondition();
        for (auto S : LLT->successors()) {
            if (S->hasNPredecessors(1)) continue;

            auto Init = LLT->getSuccessor(0) == S ? True : False;
            auto Before = S->getFirstNonPHI();
            auto Phi = PHINode::Create(BoolTy, pred_size(S), "p", Before);
            LW.PredMap[P][S] = Phi;

            for (auto Sp : predecessors(S))
                Phi->addIncoming(Sp == LL ? P : Init, Sp);
        }
    }

    return LW;
}
} // namespace loop

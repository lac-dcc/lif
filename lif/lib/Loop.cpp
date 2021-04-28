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
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/Casting.h>

using namespace lif;

LoopWrapper lif::prepare(llvm::LoopInfo &LI, llvm::LLVMContext &Ctx) {
    LoopWrapper LW(LI);

    auto *BoolTy = llvm::IntegerType::getInt1Ty(Ctx);
    auto *False = llvm::ConstantInt::getFalse(BoolTy);

    for (auto *L : LI.getLoopsInPreorder()) {
        auto *LH = L->getHeader();

        // --loop-simplify
        auto *LL = L->getLoopLatch();

        // --loop-rotate
        assert(L->isRotatedForm() && "loop is not in rotated form!");

        // Save every loop latch for future use, if necessary.
        LW.LLBlocks.insert(LL);

        llvm::SmallVector<llvm::BasicBlock *, 4> ExitingBlocks;
        L->getExitingBlocks(ExitingBlocks);
        auto *Before = LH->getFirstNonPHI();
        for (auto *LE : ExitingBlocks) {
            if (LE == LL) continue;

            // For each exiting block LE, insert a phi-function at the LH
            // associated with the predicate of LE.
            auto *LET = llvm::cast<llvm::BranchInst>(LE->getTerminator());
            auto *C = LET->getCondition();
            auto *Phi =
                llvm::PHINode::Create(BoolTy, pred_size(LH), "p", Before);

            for (auto P : predecessors(LH)) {
                Phi->addIncoming(P == LL ? C : False, P);
                LW.PredMap[C] = Phi;
            }
        }

        // Save every loop exit block as well.
        llvm::SmallVector<llvm::BasicBlock *, 4> ExitBlocks;
        L->getExitBlocks(ExitBlocks);
        for (auto *LE : ExitBlocks) LW.ExitBlocks.insert(LE);
    }

    return LW;
}

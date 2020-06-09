//===-- Cond.h ------------------------------------------------------------===//
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
    auto &Entry = F.front();
    auto *BoolT = IntegerType::get(F.getContext(), 1);

    for (auto &BB : F) {
        auto *AI = new AllocaInst(BoolT, 0, "out.", Entry.getTerminator());
        OutM[&BB] = AI;
    }

    return OutM;
}

std::pair<SmallVector<Incoming, 8>, SmallVector<Value *, 4>>
bindIn(BasicBlock &BB, const OutMap OutM) {
    SmallVector<Incoming, 8> InV;
    SmallVector<Value *, 4> GenV;

    for (auto *P : predecessors(&BB)) {
        auto *Terminator = P->getTerminator();
        auto *Br = dyn_cast<BranchInst>(Terminator);

        // TODO: Handle switch, etc...
        if (!Br) continue;

        // Get the address of the instruction associated with the first
        // insertion pointer.
        auto *Pos = &*BB.getFirstInsertionPt();

        // Out map must have been constructed already; thus, every
        // basic block should be associated with an out variable.
        auto *OutPtr = cast<AllocaInst>(OutM.lookup(P));
        Instruction *C =
            new LoadInst(OutPtr->getAllocatedType(), OutPtr, "", Pos);

        GenV.push_back(C);
        if (Br->isConditional()) {
            // If we are at an else branch, then we should negate the
            // predicate.
            auto *Pred = Br->getCondition();
            if (Br->getSuccessor(1) == &BB) {
                Pred = BinaryOperator::CreateNot(Pred, "", Pos);
                GenV.push_back(Pred);
            }

            C = BinaryOperator::CreateAnd(C, Pred, "in.", Pos);
            GenV.push_back(C);
        }

        // Insert to the beginning of the vector to preserve the insertion
        // order at the basic block.
        InV.insert(InV.begin(), {C /* Cond */, P /* From */});
    }

    return {InV, GenV};
}

std::vector<Value *> bindOut(BasicBlock &BB, Value *OutPtr,
                             const SmallVectorImpl<Value *> &InV) {
    std::vector<Value *> GenV;

    // Compute and store the proper value at OutPtr.
    Value *OutV;
    if (InV.empty()) {
        // There are no incoming conditions, so we set the out value as
        // true.
        auto *BoolT = IntegerType::get(BB.getContext(), 1);
        OutV = ConstantInt::get(BoolT, 1);
    } else if (InV.size() == 1) {
        // Set the out value as the single value from InV.
        OutV = InV[0];
    } else {
        // If there are more than one incoming cond, fold them and set the
        // last instruction as the out value. We proceed as following:
        //   > Let InV = {v0, v1, ..., vn}, i.e. the list of values
        //   > z0 = v0 & v1
        //   > z1 = z0 & v2
        //   ...
        //   > zn-1 = zn-2 & vn
        OutV = BinaryOperator::CreateOr(InV[0], InV[1]);
        cast<Instruction>(OutV)->insertBefore(BB.getTerminator());
        GenV.push_back(OutV);

        for (auto Iter = InV.begin() + 2; Iter != InV.end(); ++Iter) {
            OutV = BinaryOperator::CreateOr(OutV, *Iter);
            cast<Instruction>(OutV)->insertBefore(BB.getTerminator());
            GenV.push_back(OutV);
        }
    }

    GenV.push_back(new StoreInst(OutV, OutPtr, BB.getTerminator()));
    return GenV;
}

std::pair<InMap, std::vector<Value *>> bind(Function &F, const OutMap OutM) {
    InMap InM(F.size());
    std::vector<Value *> GenV;

    for (auto &BB : F) {
        auto [InV, GenInV] = bindIn(BB, OutM);
        InM[&BB] = InV;

        auto GenOutV = bindOut(BB, OutM.lookup(&BB),
                               std::accumulate(InV.begin(), InV.end(),
                                               SmallVector<Value *, 8>(),
                                               [](auto Accum, auto In) {
                                                   Accum.push_back(In.Cond);
                                                   return Accum;
                                               }));

        GenV.insert(GenV.end(), GenInV.begin(), GenInV.end());
        GenV.insert(GenV.end(), GenOutV.begin(), GenOutV.end());
    }

    return {InM, GenV};
}
} // namespace cond

//===-- Cond.h ------------------------------------------------------------===//
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
    auto BoolT = IntegerType::get(F.getContext(), 1);

    for (auto &BB : F) {
        auto *AI = new AllocaInst(BoolT, 0, "out.", Entry.getTerminator());
        OutM[&BB] = AI;
    }

    return OutM;
}

SmallVector<Incoming, 8> bindIn(BasicBlock &BB, const OutMap OutM) {
    auto InV = SmallVector<Incoming, 8>();
    for (auto *P : predecessors(&BB)) {
        auto *Terminator = P->getTerminator();
        auto *Br = dyn_cast<BranchInst>(Terminator);

        // TODO: Handle switch, etc...
        if (!Br) continue;

        auto *Pos = BB.getFirstNonPHI();

        // Out map must have been constructed already; thus, every
        // basic block should be associated with an out variable.
        auto *OutPtr = cast<AllocaInst>(OutM.lookup(P));
        Instruction *C =
            new LoadInst(OutPtr->getAllocatedType(), OutPtr, "", Pos);

        if (Br->isConditional()) {
            // If we are at an else branch, then we should negate the
            // predicate.
            auto *Predicate =
                Br->getSuccessor(1) == &BB
                    ? BinaryOperator::CreateNot(Br->getCondition(), "not.", Pos)
                    : Br->getCondition();

            C = BinaryOperator::CreateAnd(C, Predicate, "in.", Pos);
        }

        InV.push_back({C /* Cond */, P /* From */});
    }

    return InV;
}

void bindOut(BasicBlock &BB, Value *OutPtr,
             const SmallVectorImpl<Value *> &InV) {
    // Compute and store the proper value at OutPtr.
    Value *OutV;
    if (InV.empty()) {
        // There are no incoming conditions, so we set the out value as
        // true.
        auto BoolT = IntegerType::get(BB.getContext(), 1);
        OutV = ConstantInt::get(BoolT, 1);
    } else if (InV.size() == 1) {
        // Set the out value as the single value from InV.
        OutV = InV[0];
    } else {
        // If there are more than one incoming cond, fold them and set the
        // last instruction as the out value. We proceed as following:
        //   > Let InV = {v0, v1, ..., vn}, i.e. the list of values
        //   > z0 = v0 & v1, the initial value we pass to std::accumulate
        //   > z1 = z0 & v2
        //   ...
        //   > zn-1 = zn-2 & vn
        OutV = BinaryOperator::CreateOr(InV[0], InV[1]);
        cast<Instruction>(OutV)->insertBefore(BB.getTerminator());

        for (auto V = InV.begin() + 2; V != InV.end(); ++V) {
            OutV = BinaryOperator::CreateOr(OutV, *V);
            cast<Instruction>(OutV)->insertBefore(BB.getTerminator());
        }
    }

    new StoreInst(OutV, OutPtr, BB.getTerminator());
}

InMap bind(Function &F, const OutMap OutM) {
    InMap InM(F.size());
    for (auto &BB : F) {
        auto InV = bindIn(BB, OutM);
        InM[&BB] = InV;

        bindOut(BB, OutM.lookup(&BB),
                std::accumulate(InV.begin(), InV.end(),
                                SmallVector<Value *, 8>(),
                                [](auto Vals, auto In) {
                                    Vals.push_back(In.Cond);
                                    return Vals;
                                }));
    }
    return InM;
}
} // namespace cond

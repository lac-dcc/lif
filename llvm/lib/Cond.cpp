#include "Cond.h"
#include "Util.h"

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

using namespace llvm;

namespace cond {
OutMap allocOut(Function &F) {
    OutMap Out(F.size());
    auto &Entry = F.front();
    auto BoolT = IntegerType::get(F.getContext(), 1);

    for (auto &BB : F) {
        auto *AI = new AllocaInst(BoolT, 0, "out.", Entry.getTerminator());
        Out[&BB] = AI;
    }

    return Out;
}

InMap bind(Function &F, const OutMap Out) {
    InMap In(F.size());

    for (auto &BB : F) {
        auto InVals = SmallVector<Value *, 8>();

        for (auto *P : predecessors(&BB)) {
            auto *Terminator = P->getTerminator();
            auto *Br = dyn_cast<BranchInst>(Terminator);

            // TODO: Handle switch, etc...
            if (!Br) continue;

            auto *Pos = BB.getFirstNonPHI();

            // Out map must have been constructed already; thus, every
            // basic block should be associated with an out variable.
            auto *OutPtr = cast<AllocaInst>(Out.lookup(P));
            Instruction *C =
                new LoadInst(OutPtr->getAllocatedType(), OutPtr, "", Pos);

            if (Br->isConditional()) {
                // If we are at an else branch, then we should negate the
                // predicate.
                bool Else = Br->getSuccessor(1) == &BB;
                auto *Predicate = Else ? BinaryOperator::CreateNot(
                                             Br->getCondition(), "not.", Pos)
                                       : Br->getCondition();

                C = BinaryOperator::CreateAnd(C, Predicate, "in.", Pos);
            }

            auto InCond = Incoming{C /* Cond */, P /* From */};
            In[&BB].push_back(&InCond);
            InVals.push_back(C);
        }

        // Compute and store the proper value at Out(BB) address.
        Value *OutV;
        auto *OutPtr = Out.lookup(&BB);

        if (InVals.empty()) {
            // There are no incoming conditions, so we set the out value as
            // true.
            auto BoolT = IntegerType::get(F.getContext(), 1);
            OutV = ConstantInt::get(BoolT, 1);
        } else if (InVals.size() == 1) {
            // Set the out value as the single value from InVals.
            OutV = InVals[0];
        } else {
            // If there are more than one incoming cond, fold them and set the
            // last instruction as the out value.
            auto Fold = util::fold(Instruction::Or, InVals);
            for (auto *V : Fold)
                cast<Instruction>(V)->insertBefore(BB.getTerminator());

            OutV = Fold.back();
        }

        new StoreInst(OutV, OutPtr, BB.getTerminator());
    }

    return In;
}
} // namespace cond

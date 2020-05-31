#include "Cond.h"
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/raw_ostream.h>

using namespace llvm;

OutMap allocOut(Function &F) {
    OutMap Out(F.size());

    for (auto &BB : F) {
        auto BoolT = IntegerType::get(F.getContext(), 1);
        auto *AI = new AllocaInst(BoolT, 0, "out.", BB.getTerminator());
        Out[&BB] = AI;
    }

    return Out;
}

// TODO: Move everything to Invariant.cpp and remove BindCond.cpp.
//       > Reason: we need to alloc vars for the outgoing conditions.
// BindCond::Result BindCond::run(Function &F, FunctionAnalysisManager &AM) {
// We currently cannot handle functions with loops
// const auto &LA = AM.getResult<LoopAnalysis>(F);
// if (LA.begin() != LA.end()) {
//     return make_error<Unsupported>(F.getName());
// }
//
// const auto Map = CMap(F.size());
//
// for (const auto &BB : F) {
//     for (const auto *P : predecessors(&BB)) {
//         const auto *BR = dyn_cast<BranchInst>(P->getTerminator());
//         if (!BR)
//             continue;
//
//         bool Negate = BR->isConditional() && BR->getOperand(2) == &BB;
//         Cond::Predicate Pred = {Negate, BR->getCondition()};
//     }
// }
//
// // TODO: Update the return value
// return CMap();
// }

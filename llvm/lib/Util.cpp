#include "Util.h"
#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Value.h>

using namespace llvm;
namespace util {
SmallVector<Value *, 8> fold(const Instruction::BinaryOps Op,
                             const SmallVectorImpl<Value *> &Vals) {
    // Nothing to do, just return an empty list.
    if (Vals.empty()) return SmallVector<Value *, 8>();

    auto Fold = SmallVector<Value *, 8>();

    // Just a single value, so we return a list of size 1 with this single
    // value.
    if (Vals.size() == 1) {
        Fold.push_back(Vals[0]);
        return Fold;
    }

    Value *Z = BinaryOperator::Create(Op, Vals[0], Vals[1]);
    Fold.push_back(Z);

    for (unsigned i = 2; i < Vals.size(); i++) {
        Z = BinaryOperator::Create(Op, Z, Vals[i]);
        Fold.push_back(Z);
    }

    return Fold;
}
} // namespace util

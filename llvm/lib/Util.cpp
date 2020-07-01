//===-- Util.cpp ----------------------------------------------------------===//
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
/// This file contains the implementation of some utility functions.
///
//===----------------------------------------------------------------------===//

#include "Util.h"
#include <llvm/Analysis/MemoryBuiltins.h>

using namespace llvm;

namespace util {
DenseMap<const Value *, Value *> getLen(Function &F,
                                        const TargetLibraryInfo *TLI) {
    DenseMap<const Value *, Value *> LenM;

    // Fill LenM with the size of all local ptrs as well.
    auto DL = F.getParent()->getDataLayout();
    auto Propag = [&LenM](const Value *V, Value *Size) {
        for (auto *U : V->users()) LenM[U] = Size;
    };

    for (auto &BB : F) {
        for (auto &I : BB) {
            // TODO: Only alloc and call @malloc????
            if (auto *Alloca = dyn_cast<AllocaInst>(&I)) {
                Value *Len;
                auto *ArrayTy = dyn_cast<ArrayType>(Alloca->getAllocatedType());

                // If AllocTy is an array (e.g. [10 x i32]) but it is not an
                // array allocation (e.g. C arrays: %x = alloca [10 x i32],
                // align 16), then we need to get the length from the allocated
                // type.
                if (ArrayTy && !Alloca->isArrayAllocation())
                    Len = ConstantInt::get(ArrayTy->getElementType(),
                                           ArrayTy->getNumElements());
                else
                    Len = Alloca->getArraySize();

                LenM[Alloca] = Len;
                Propag(Alloca, Len);
                continue;
            }

            auto *Call = dyn_cast<CallInst>(&I);
            if (Call && isAllocationFn(Call, TLI)) {
                auto *Len = getMallocArraySize(Call, DL, TLI);
                LenM[Call] = Len;
                Propag(Call, Len);
            }
        }
    }

    if (F.arg_begin() == F.arg_end()) return LenM;

    // Match pointer args with its size.
    // TODO: get the match from annotations (position of the arg?).
    // int comp(int *a, const unsigned sa, int *b, const unsigned sb);
    for (auto Iter = F.arg_begin(); Iter + 1 != F.arg_end(); ++Iter) {
        Value *V = &*Iter;
        if (!isa<PointerType>(V->getType())) continue;

        auto *Len = &*(Iter + 1);
        assert(isa<IntegerType>(Len->getType()) &&
               "pointer argument must be followed by its length!");

        LenM[&*Iter] = Len;
        Propag(V, Len);
    }

    return LenM;
}

Value *ctsel(Value *Cond, Value *VTrue, Value *VFalse, Instruction *Before) {
    // auto *CFalse = BinaryOperator::CreateSub(
    //     Cond, ConstantInt::get(Cond->getType(), 1), "", Before);
    // auto *CTrue = BinaryOperator::CreateNot(CFalse, "", Before);
    //
    // // Select(Cond, VTrue, VFalse) = (CTrue & VTrue) | (CFalse & VFalse)
    // return BinaryOperator::CreateOr(
    //     BinaryOperator::CreateAnd(
    //         new SExtInst(CTrue, VTrue->getType(), "", Before), VTrue, "",
    //         Before), // Select VTrue
    //     BinaryOperator::CreateAnd(
    //         new SExtInst(CFalse, VFalse->getType(), "", Before), VFalse, "",
    //         Before), // Select VFalse
    //     "", Before);
    return llvm::SelectInst::Create(Cond, VTrue, VFalse, "", Before);
}
} // namespace util

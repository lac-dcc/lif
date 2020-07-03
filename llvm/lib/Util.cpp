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
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/Analysis/MemoryBuiltins.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>

using namespace llvm;

namespace util {
Value *ctsel(Value *Cond, Value *VTrue, Value *VFalse, Instruction *Before) {
    return llvm::SelectInst::Create(Cond, VTrue, VFalse, "", Before);
}

DenseMap<const Value *, Value *> getLen(Function &F,
                                        const TargetLibraryInfo *TLI) {
    DenseMap<const Value *, Value *> LenM;

    // Fill LenM with the size of all local ptrs as well.
    auto DL = F.getParent()->getDataLayout();
    auto Propag = [&LenM](const Value *V, Value *Size) {
        for (auto *U : V->users()) LenM[U] = Size;
    };

    // There may be GEPs pointing to other GEPs so we need to propagate the
    // length from them. This must be the last step.
    std::vector<GetElementPtrInst *> GEPV;

    for (auto &BB : F) {
        for (auto &I : BB) {
            if (auto *GEP = dyn_cast<GetElementPtrInst>(&I)) {
                GEPV.push_back(GEP);
                continue;
            }

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

    // We also need to check the global values, e.g. constant arrays.
    for (auto &Global : F.getParent()->globals()) {
        auto *PtrTy = dyn_cast<PointerType>(Global.getType());
        if (!PtrTy) continue;

        auto *ArrayTy = dyn_cast<ArrayType>(PtrTy->getElementType());
        if (ArrayTy) {
            auto *Len = ConstantInt::get(ArrayTy->getElementType(),
                                         ArrayTy->getNumElements());
            LenM[&Global] = Len;
            Propag(&Global, Len);
        }
    }

    if (F.arg_begin() != F.arg_end()) {
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
    }

    for (auto *GEP : GEPV) Propag(GEP, LenM[GEP]);
    return LenM;
}
} // namespace util

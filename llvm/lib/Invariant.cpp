//===-- Invariant.cpp -----------------------------------------------------===//
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
/// This file contains the implementation of the Invariant Pass.
///
//===----------------------------------------------------------------------===//

#include "Invariant.h"
#include "Cond.h"

#include <llvm/ADT/PostOrderIterator.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/CFG.h>
#include <llvm/Analysis/MemoryBuiltins.h>
#include <llvm/Analysis/TargetLibraryInfo.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>
#include <llvm/Support/Casting.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>
#include <numeric>
#include <set>

using namespace llvm;
using namespace cond;

namespace invariant {
PreservedAnalyses InvariantPass::run(Function &F, FunctionAnalysisManager &AM) {
    // We currently cannot handle functions with cycles.
    SmallVector<std::pair<const BasicBlock *, const BasicBlock *>, 32> Result;
    FindFunctionBackedges(F, Result);

    if (!Result.empty()) {
        errs() << "Error: unexpected cycle(s) on function \"" << F.getName()
               << "\" (possible fix: run 'opt -mem2reg -loop-rotate "
                  "-loop-unroll -unroll-count=N')\n";
        return PreservedAnalyses::all();
    }

    // TODO: define the set of analyses not preserved.
    Transform(F, &AM.getResult<TargetLibraryAnalysis>(F)).run();
    return PreservedAnalyses::none();
}

Transform::Transform(Function &F, const TargetLibraryInfo *TLI) : F(F) {
    // Match pointer args with its size.
    // TODO: get the match from annotations (position of the arg?).
    // int comp(int *a, const unsigned sa, int *b, const unsigned sb);
    for (auto Iter = F.arg_begin();
         Iter != F.arg_end() && Iter + 1 != F.arg_end(); ++Iter)
        this->SizeM[&*Iter] = &*(Iter + 1);

    // Fill SizeM with the size of all local ptrs as well.
    auto DL = F.getParent()->getDataLayout();
    auto Propag = [this](const Value *V, Value *Size) {
        for (auto *U : V->users()) this->SizeM[U] = Size;
    };

    for (auto &BB : F) {
        for (auto &I : BB) {
            // TODO: Only alloc and call @malloc????
            if (auto *Alloca = dyn_cast<AllocaInst>(&I)) {
                auto *Size = Alloca->getArraySize();
                this->SizeM[Alloca] = Size;
                Propag(Alloca, Size);
                continue;
            }

            auto *Call = dyn_cast<CallInst>(&I);
            if (Call && isAllocationFn(Call, TLI)) {
                auto *Size = getMallocArraySize(Call, DL, TLI);
                this->SizeM[Call] = Size;
                Propag(Call, Size);
            }
        }
    }

    // Initialize Shadow memory as a pointer to an integer. We use
    // MaxPointerSize to ensure absence of overflow.
    this->Shadow = new AllocaInst(
        IntegerType::get(F.getContext(), DL.getMaxPointerSizeInBits()), 0,
        "shadow", F.getEntryBlock().getTerminator());

    // Bind the outgoing and incoming conditions to all basic blocks.
    OutMap OutM = allocOut(F);
    auto [InM, GenV] = bind(F, OutM);
    this->InM = InM;

    // Fill SkipM with the instructions generated after binding the
    // conditions to each basic block, since we don't need to modify them.
    for (auto *V : GenV) this->SkipS.insert(V);
}

void Transform::run() {
    for (auto &BB : this->F) {
        // We need to collect every phi instruction and store in a separate
        // vector because phi transform. fn removes the phi instruction, so we
        // cannot do this in an iterator loop.
        SmallVector<PHINode *, 8> PhiV;

        for (auto &I : BB) {
            auto Iter = this->SkipS.find(&I);
            if (Iter != this->SkipS.end()) continue;

            if (auto *Phi = dyn_cast<PHINode>(&I))
                PhiV.push_back(Phi);
            else if (auto *Load = dyn_cast<LoadInst>(&I))
                this->load(*Load);
            else if (auto *Store = dyn_cast<StoreInst>(&I))
                this->store(*Store);
        }

        for (auto *Phi : PhiV) this->phi(*Phi);
    }

    // Replace each terminator by an uncond. br linked to the next basic block,
    // following the reverse postorder.
    ReversePostOrderTraversal<Function *> RPOT(&this->F);
    SmallVector<BasicBlock *, 32> MergeV;

    for (auto Iter = RPOT.begin(); Iter + 1 != RPOT.end(); ++Iter) {
        MergeV.push_back(*(Iter + 1));
        ReplaceInstWithInst((*Iter)->getTerminator(),
                            BranchInst::Create(*(Iter + 1)));
    }

    // Now that every basic block has only one successor, we can merge them
    // without any problems.
    for (auto *BB : MergeV) MergeBlockIntoPredecessor(BB);
}

void Transform::phi(PHINode &Phi) {
    auto InV = this->InM.lookup(Phi.getParent());

    // No incoming condition, so there is nothing to do.
    if (InV.empty()) return;

    // Get the negative value of each cond in the list of conditions of
    // InV.  For each phi-value v in Phi, get the condition associated with it
    // and apply the operator & (and) so the result will either be zero or the
    // phi-value.
    SmallVector<Instruction *, 8> AndV;
    AndV.reserve(this->InM.size());

    for (auto In : InV) {
        Instruction *Pos = In.Cond->getNextNode();

        auto *SExt = new SExtInst(In.Cond, Phi.getType(), "", Pos);
        auto *C = BinaryOperator::CreateNeg(SExt, "", Pos);
        auto *And = BinaryOperator::CreateAnd(
            Phi.getIncomingValueForBlock(In.From), C, "", Pos);

        AndV.push_back(And);
    }

    // Fold the list of values generated by applying the operator & (and), so we
    // can select the correct value
    Value *Replace;
    if (AndV.size() == 1) {
        Replace = AndV[0];
    } else {
        Instruction *Pos = AndV.back()->getNextNode();
        auto ApplyOr = [&Pos](Value *U, Value *V) {
            return BinaryOperator::CreateOr(U, V, "", Pos);
        };

        Replace = ApplyOr(AndV[0], AndV[1]);
        for (auto Iter = AndV.begin() + 2; Iter != AndV.end(); ++Iter)
            Replace = ApplyOr(Replace, *Iter);
    }

    Replace->setName("select.phi.");
    Phi.replaceAllUsesWith(Replace);
    Phi.eraseFromParent();
}

void Transform::load(LoadInst &Load) {
    auto InV = this->InM.lookup(Load.getParent());

    // No incoming condition, so there is nothing to do.
    if (InV.empty()) return;

    // Fold the incoming conditions from InV into a single value by applying the
    // operator | (or).
    auto OrV = this->joinCond(*Load.getParent());

    // If the Ptr operand is a GEP instruction, then we need to work on the
    // indices used by GEP. If not, this load does not need to be transformed.
    auto *GEP = dyn_cast<GetElementPtrInst>(Load.getPointerOperand());
    if (!GEP) return;

    // Clone GEP inst to ensure that it is right before the Load inst.
    auto *GEPClone = cast<GetElementPtrInst>(GEP->clone());
    GEPClone->insertBefore(&Load);
    Load.setOperand(0, GEPClone);
    this->gep(GEPClone, OrV.back());
}

void Transform::store(StoreInst &Store) {
    auto InV = this->InM.lookup(Store.getParent());

    // No incoming condition, so there is nothing to do.
    if (InV.empty()) return;

    // Fold the incoming conditions from InV into a single value by applying the
    // operator | (or).
    auto OrV = this->joinCond(*Store.getParent());

    // If the Ptr operand is a GEP instruction, then we need to work on the
    // indices used by GEP.
    auto *GEP = dyn_cast<GetElementPtrInst>(Store.getPointerOperand());
    if (GEP) {
        // Clone GEP inst to ensure that it is right before the Load inst.
        auto *GEPClone = cast<GetElementPtrInst>(GEP->clone());
        GEPClone->insertBefore(&Store);
        Store.setOperand(1, GEPClone);
        this->gep(GEPClone, OrV.back());
    }

    // Generate a load to get either the value of the last accessed position or
    // the value stored at the position that Store is trying to update. For the
    // first case, we execute a store without changing the value (store the same
    // value), while for the latter we execute Store as it is.
    auto *StoreVal = Store.getValueOperand();
    auto *Load = new LoadInst(StoreVal->getType(), Store.getPointerOperand(),
                              "", &Store);

    // Replace Store(val, addr) with Store(val', addr) where val' = either val
    // or Load(addr);
    auto *SelectVal = this->select(OrV.back(), StoreVal, Load, &Store);
    SelectVal->setName("select.val.");
    Store.setOperand(0, SelectVal);
}

void Transform::gep(GetElementPtrInst *GEP, Value *Cond) {
    auto *Ptr = GEP->getPointerOperand();
    auto *Idx = GEP->getOperand(GEP->getNumIndices());
    auto *Size = this->SizeM.lookup(Ptr);

    auto *IdxTy = Idx->getType();
    if (Size->getType()->getScalarSizeInBits() < IdxTy->getScalarSizeInBits())
        Size = new SExtInst(Size, IdxTy, "", GEP);

    auto *IsSafe = ICmpInst::Create(Instruction::ICmp, ICmpInst::ICMP_SLT, Idx,
                                    Size, "", GEP);

    // Check if the incoming condition is true AND the access to the original
    // array at Idx is safe.
    auto *AccessCond = BinaryOperator::CreateAnd(Cond, IsSafe, "safe.", GEP);

    // If safe, use the original ptr. Else, use shadow memory.
    auto *PtrTy = Ptr->getType();
    auto PtrSize =
        GEP->getModule()->getDataLayout().getPointerTypeSizeInBits(PtrTy);
    auto *AddrTy = IntegerType::get(GEP->getContext(), PtrSize);
    auto *PtrAddr = new PtrToIntInst(Ptr, AddrTy, "", GEP);
    auto *ShadowAddr = new PtrToIntInst(this->Shadow, AddrTy, "", GEP);
    GEP->setOperand(
        GEP->getPointerOperandIndex(),
        new IntToPtrInst(this->select(AccessCond, PtrAddr, ShadowAddr, GEP),
                         PtrTy, "select.ptr.", GEP));
}

Value *Transform::select(Value *Cond, Value *VTrue, Value *VFalse,
                         Instruction *Before) {
    auto *CFalse = BinaryOperator::CreateSub(
        Cond, ConstantInt::get(Cond->getType(), 1), "", Before);
    auto *CTrue = BinaryOperator::CreateNot(CFalse, "", Before);

    // Select(Cond, VTrue, VFalse) = (CTrue & VTrue) | (CFalse & VFalse)
    return BinaryOperator::CreateOr(
        BinaryOperator::CreateAnd(
            new SExtInst(CTrue, VTrue->getType(), "", Before), VTrue, "",
            Before), // Select VTrue
        BinaryOperator::CreateAnd(
            new SExtInst(CFalse, VFalse->getType(), "", Before), VFalse, "",
            Before), // Select VFalse
        "", Before);
}

SmallVector<Instruction *, 8> Transform::joinCond(BasicBlock &BB) {
    auto InV = this->InM.lookup(&BB);
    if (InV.size() == 1) return {InV[0].Cond};

    Instruction *Pos = InV.back().Cond->getNextNode();
    auto ApplyOr = [&Pos](Value *U, Value *V) {
        return BinaryOperator::CreateOr(U, V, "", Pos);
    };

    return std::accumulate(
        InV.begin() + 2, InV.end(),
        SmallVector<Instruction *, 8>({ApplyOr(InV[0].Cond, InV[1].Cond)}),
        [&ApplyOr](auto Accum, auto In) {
            Accum.push_back(ApplyOr(Accum.back(), In.Cond));
            return Accum;
        });
}
} // namespace invariant

PassPluginLibraryInfo getInvariantPluginInfo() {
    return {LLVM_PLUGIN_API_VERSION, "Invariant Pass", LLVM_VERSION_STRING,
            [](PassBuilder &PB) {
                PB.registerPipelineParsingCallback(
                    [](StringRef Name, FunctionPassManager &PM, ...) {
                        if (Name == "invar") {
                            PM.addPass(invariant::InvariantPass());
                            return true;
                        }

                        return false;
                    });
            }};
}

// The public entry point for a pass plugin.
extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getInvariantPluginInfo();
}

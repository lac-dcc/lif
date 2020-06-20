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
PreservedAnalyses Pass::run(Module &M, ModuleAnalysisManager &AM) {
    errs() << "MODULEEEEEEEEEEE\n";
    return PreservedAnalyses::all();
}

PreservedAnalyses Pass::run(Function &F, FunctionAnalysisManager &AM) {
    // We currently cannot handle functions with cycles.
    SmallVector<std::pair<const BasicBlock *, const BasicBlock *>, 32> Result;
    FindFunctionBackedges(F, Result);

    if (!Result.empty()) {
        errs() << "Error: unexpected cycle(s) on function \"" << F.getName()
               << "\" (possible fix: run 'opt -mem2reg -loop-rotate "
                  "-loop-unroll -unroll-count=N')\n";
        return PreservedAnalyses::all();
    }

    // Get the length associated with each pointer (either local or argument).
    auto LenM = getLen(F, &AM.getResult<TargetLibraryAnalysis>(F));

    // Initialize Shadow memory as a pointer to an integer. We use
    // MaxPointerSize to ensure absence of overflow.
    auto *Shadow = new AllocaInst(
        IntegerType::get(
            F.getContext(),
            F.getParent()->getDataLayout().getMaxPointerSizeInBits()),
        0, "shadow", F.getEntryBlock().getTerminator());

    // Bind the outgoing and incoming conditions to all basic blocks.
    OutMap OutM = allocOut(F);
    auto [InM, GenV] = bind(F, OutM);

    // Fill SkipS with the instructions generated after binding the conditions
    // to each basic block, since we don't need to modify them.
    std::set<Value *> SkipS;
    for (auto *V : GenV) SkipS.insert(V);

    for (auto &BB : F) {
        auto InV = InM[&BB];
        // We need to collect every phi instruction and store in a separate
        // vector because phi transform. fn removes the phi instruction, so we
        // cannot do this in an iterator loop.
        SmallVector<PHINode *, 8> PhiV;

        for (auto &I : BB) {
            if (SkipS.find(&I) != SkipS.end()) continue;

            if (auto *Phi = dyn_cast<PHINode>(&I))
                PhiV.push_back(Phi);
            else if (auto *Load = dyn_cast<LoadInst>(&I))
                transformLoad(*Load, Shadow,
                              LenM.lookup(Load->getPointerOperand()), InV);
            else if (auto *Store = dyn_cast<StoreInst>(&I))
                transformStore(*Store, Shadow,
                               LenM.lookup(Store->getPointerOperand()), InV);
        }

        for (auto *Phi : PhiV) transformPhi(*Phi, InV);
    }

    // Replace each terminator by an uncond. br linked to the next basic block,
    // following the reverse postorder.
    ReversePostOrderTraversal<Function *> RPOT(&F);
    SmallVector<BasicBlock *, 32> MergeV;

    for (auto Iter = RPOT.begin(); Iter + 1 != RPOT.end(); ++Iter) {
        MergeV.push_back(*(Iter + 1));
        ReplaceInstWithInst((*Iter)->getTerminator(),
                            BranchInst::Create(*(Iter + 1)));
    }

    // Now that every basic block has only one successor, we can merge them
    // without any problems.
    for (auto *BB : MergeV) MergeBlockIntoPredecessor(BB);

    // TODO: define the set of analyses not preserved.
    return PreservedAnalyses::none();
}

void transformPhi(PHINode &Phi, const SmallVectorImpl<Incoming> &InV) {
    // No incoming condition, so there is nothing to do.
    if (InV.empty()) return;

    // Get the negative value of each cond in the list of conditions of
    // InV. For each phi-value v in Phi, get the condition associated with it
    // and apply the operator & (and) so the result will either be zero or the
    // phi-value.
    SmallVector<Instruction *, 8> AndV;
    AndV.reserve(InV.size());

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

void transformLoad(LoadInst &Load, AllocaInst *Shadow, Value *PtrLen,
                   const SmallVectorImpl<Incoming> &InV) {
    // No incoming condition, so there is nothing to do.
    if (InV.empty()) return;

    // If the pointer operand is a GEP we need to transform it in order to
    // ensure the safety of the memory access. We fold the incoming conditions
    // from InV into a single value by applying the operator | (or) to get the
    // condition.
    if (auto *GEP = dyn_cast<GetElementPtrInst>(Load.getPointerOperand()))
        transformGEP(GEP, Shadow, PtrLen, joinCond(InV).back(), &Load);
}

void transformStore(StoreInst &Store, AllocaInst *Shadow, Value *PtrLen,
                    const SmallVectorImpl<Incoming> &InV) {
    // No incoming condition, so there is nothing to do.
    if (InV.empty()) return;

    // Fold the incoming conditions from InV into a single value by applying the
    // operator | (or).
    auto OrV = joinCond(InV);

    // Let addr' be either the original addr accessed by Store or the addr
    // got after transforming a GEP inst (see transformLoad). Let val' be either
    // val or Load(addr'), according to the incoming conditions. Replace
    // Store(val, addr) by Store(val', addr').
    auto *StoreVal = Store.getValueOperand();
    auto *StorePtr = Store.getPointerOperand();

    // If the Ptr operand is a GEP instruction, then we need to work on the
    // indices used by GEP. If not, this load does not need to be transformed.
    if (auto *GEP = dyn_cast<GetElementPtrInst>(StorePtr))
        transformGEP(GEP, Shadow, PtrLen, OrV.back(), &Store);

    auto *Load = new LoadInst(StoreVal->getType(), StorePtr, "", &Store);
    auto *SelectVal = ctsel(OrV.back(), StoreVal, Load, &Store);
    SelectVal->setName("select.val.");
    Store.setOperand(0, SelectVal);
}

void transformGEP(GetElementPtrInst *GEP, AllocaInst *Shadow, Value *PtrLen,
                  Value *Cond, Instruction *Before) {
    auto *Idx = GEP->getOperand(GEP->getNumIndices());
    auto *IdxTy = Idx->getType();

    if (PtrLen->getType()->getScalarSizeInBits() < IdxTy->getScalarSizeInBits())
        PtrLen = new SExtInst(PtrLen, IdxTy, "", Before);

    auto *IsSafe = ICmpInst::Create(Instruction::ICmp, ICmpInst::ICMP_SLT, Idx,
                                    PtrLen, "", Before);

    // Check if (i) the incoming condition is true OR (ii) the access to the
    // original array at Idx is safe. If (i), we execute the original
    // instruction as it is. If (ii), we also execute the original instruction
    // as it is because we know the access is inbounds. Otherwise, we access a
    // shadow memory.
    auto *NewPtr =
        ctsel(BinaryOperator::CreateOr(Cond, IsSafe, "safe.", Before), GEP,
              new BitCastInst(Shadow, GEP->getType(), "", Before), Before);
    GEP->replaceUsesWithIf(NewPtr,
                           [NewPtr](Use &U) { return U.getUser() != NewPtr; });
}

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
                auto *Len = Alloca->getArraySize();
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

SmallVector<Instruction *, 8> joinCond(const SmallVectorImpl<Incoming> &InV) {
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
    return SelectInst::Create(Cond, VTrue, VFalse, "", Before);
}

} // namespace invariant

PassPluginLibraryInfo getInvariantPluginInfo() {
    return {LLVM_PLUGIN_API_VERSION, "Invariant Pass", LLVM_VERSION_STRING,
            [](PassBuilder &PB) {
                PB.registerPipelineParsingCallback(
                    [](StringRef Name, ModulePassManager &PM, ...) {
                        bool isPass = Name == "invar";
                        if (isPass) PM.addPass(invariant::Pass());
                        return isPass;
                    });

                PB.registerPipelineParsingCallback(
                    [](StringRef Name, FunctionPassManager &PM, ...) {
                        bool isPass = Name == "invar";
                        if (isPass) PM.addPass(invariant::Pass());
                        return isPass;
                    });
            }};
}

// The public entry point for a pass plugin.
extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getInvariantPluginInfo();
}

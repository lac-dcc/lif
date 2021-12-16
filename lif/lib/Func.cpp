//===-- Func.cpp ----------------------------------------------------------===//
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
/// This file contains the implementation of some function-related utilities
/// used by both the data-flow analysis and the isochronous pass.
///
//===----------------------------------------------------------------------===//

#include "Func.h"
#include "CCFG.h"

#include <llvm/ADT/ArrayRef.h>
#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/DenseSet.h>
#include <llvm/ADT/STLExtras.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/ADT/simple_ilist.h>
#include <llvm/Analysis/MemoryBuiltins.h>
#include <llvm/Analysis/PostDominators.h>
#include <llvm/Analysis/TargetLibraryInfo.h>
#include <llvm/IR/Argument.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Operator.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Use.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/Casting.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>

#include <algorithm>
#include <functional>
#include <memory>
#include <stack>
#include <variant>

using namespace lif;

LenMap
lif::inferLength(llvm::Function &F,
                 llvm::DenseMap<llvm::Type *, llvm::Type *> UnwrappedTypes,
                 const llvm::TargetLibraryInfo *TLI) {
    LenMap LM;

    auto &Ctx = F.getContext();
    auto DL = F.getParent()->getDataLayout();

    auto Int32Ty = llvm::IntegerType::getInt32Ty(Ctx);
    auto Int64Ty = llvm::IntegerType::getInt64Ty(Ctx);
    auto Zero32 = llvm::ConstantInt::get(Int32Ty, 0);
    auto Zero64 = llvm::ConstantInt::get(Int64Ty, 0);
    auto One32 = llvm::ConstantInt::get(Int32Ty, 1);

    auto InsertionPoint = F.getEntryBlock().getFirstNonPHI();
    auto getArrayLength = [Int64Ty](llvm::ArrayType *ArrTy) {
        size_t Len = 1;
        while (ArrTy) {
            Len *= ArrTy->getNumElements();
            ArrTy = llvm::dyn_cast<llvm::ArrayType>(ArrTy->getElementType());
        }
        return llvm::ConstantInt::get(Int64Ty, Len);
    };

    auto getCallToMalloc = [](llvm::Value *V) -> llvm::CallInst * {
        auto Call = llvm::dyn_cast<llvm::CallInst>(V);
        if (Call && Call->getCalledFunction()->getName() == "malloc")
            return Call;
        else
            return nullptr;
    };

    auto inferFromType = [&getArrayLength, Zero64](llvm::Type *Ty) {
        std::vector<llvm::Value *> Length;
        if (auto ArrTy = llvm::dyn_cast<llvm::ArrayType>(Ty)) {
            Length.push_back(getArrayLength(ArrTy));
        } else if (auto StructTy = llvm::dyn_cast<llvm::StructType>(Ty)) {
            for (auto FieldTy : StructTy->elements()) {
                auto ArrTy = llvm::dyn_cast<llvm::ArrayType>(FieldTy);
                // The field may be e.g. a pointer corresponding to an array.
                // In this case, we'll compute its length later (there must
                // be an alloca or malloc call somewhere...).
                auto FieldLen = ArrTy ? getArrayLength(ArrTy) : Zero64;
                Length.push_back(FieldLen);
            }
        } else {
            Length.push_back(Zero64);
        }
        return makeSharedLength(Length);
    };

    for (auto &G : F.getParent()->globals())
        LM[&G] = inferFromType(G.getValueType());

    for (auto &Arg : F.args()) {
        auto ArgTy = Arg.getType();

        if (!UnwrappedTypes.count(ArgTy)) {
            auto StructTy = llvm::dyn_cast<llvm::StructType>(
                ArgTy->isPointerTy() ? ArgTy->getPointerElementType() : ArgTy);

            if (!StructTy) {
                LM[&Arg] = makeSharedLength({Zero64});
                continue;
            }

            std::vector<llvm::Value *> Length;
            for (auto FieldTy : StructTy->elements()) {
                // TODO: handle nested structs?
                auto ArrTy = llvm::dyn_cast<llvm::ArrayType>(FieldTy);
                Length.push_back(ArrTy ? getArrayLength(ArrTy) : Zero64);
            }

            LM[&Arg] = makeSharedLength(Length);
            continue;
        }

        assert(ArgTy->isPointerTy());
        auto ArgElTy = ArgTy->getPointerElementType();
        assert(ArgElTy->isStructTy());

        auto FieldName =
            (Arg.hasName() ? Arg.getName().str() : "arg") + ".field";

        auto UnwrappedArgTy = UnwrappedTypes[ArgTy];
        assert(UnwrappedArgTy->isPointerTy());

        auto UnwrappedArgElTy = UnwrappedArgTy->getPointerElementType();
        if (!UnwrappedArgElTy->isStructTy()) {
            auto ArgElTy = ArgTy->getPointerElementType();
            auto LenPtr = llvm::GetElementPtrInst::CreateInBounds(
                ArgElTy, &Arg, {Zero32, One32}, FieldName + "0.length.ptr",
                InsertionPoint);
            auto LoadLen = new llvm::LoadInst(
                Int64Ty, LenPtr, FieldName + "0.length", InsertionPoint);
            LM[&Arg] = makeSharedLength({LoadLen, Zero64});
            LM[LenPtr] = makeSharedLength({Zero64});
            continue;
        }

        auto StructTy = llvm::cast<llvm::StructType>(ArgElTy);
        std::vector<llvm::Value *> Length;
        for (size_t Idx = 0; Idx < StructTy->getNumElements(); Idx++) {
            auto FieldTy = StructTy->getTypeAtIndex(Idx);
            if (!UnwrappedTypes.count(FieldTy)) {
                auto ArrTy = llvm::dyn_cast<llvm::ArrayType>(FieldTy);
                auto FieldLen = ArrTy ? getArrayLength(ArrTy) : Zero64;
                Length.push_back(FieldLen);
                continue;
            }

            assert(FieldTy->isPointerTy());
            auto FieldElTy = FieldTy->getPointerElementType();
            assert(FieldElTy->isStructTy());

            auto FieldPtr = llvm::GetElementPtrInst::CreateInBounds(
                ArgElTy, &Arg, {Zero32, llvm::ConstantInt::get(Int32Ty, Idx)},
                FieldName + std::to_string(Idx) + ".ptr", InsertionPoint);

            auto LoadField =
                new llvm::LoadInst(FieldTy, FieldPtr, "", InsertionPoint);

            auto LenPtr = llvm::GetElementPtrInst::CreateInBounds(
                FieldElTy, LoadField, {Zero32, One32},
                FieldName + std::to_string(Idx) + ".length.ptr",
                InsertionPoint);

            auto LoadLen = new llvm::LoadInst(
                Int64Ty, LenPtr, FieldName + std::to_string(Idx) + ".length",
                InsertionPoint);

            LM[LoadField] = LM[FieldPtr] = makeSharedLength({LoadLen, Zero64});
            LM[LenPtr] = makeSharedLength({LoadLen});

            // We push LoadLen as the length of the wrapped field for
            // convenience. It is actually the length of the pointer
            // wrapped by this struct.
            Length.push_back(LoadLen);
        }

        LM[&Arg] = makeSharedLength(Length);
    }

    auto setGEPLength = [&LM, &inferFromType](llvm::GEPOperator *GEP) {
        auto ResultElTy = GEP->getResultElementType();
        if (ResultElTy->isStructTy()) {
            LM[GEP] = inferFromType(ResultElTy);
            return;
        }

        auto PtrOp = GEP->getPointerOperand();
        auto SrcElTy = GEP->getSourceElementType();

        if (SrcElTy->isArrayTy()) {
            if (GEP->getNumIndices() == 1) {
                LM[GEP] = LM[PtrOp];
                return;
            }

            assert(GEP->getNumIndices() == 2);
            LM[GEP] = inferFromType(SrcElTy->getArrayElementType());
            return;
        }

        if (!SrcElTy->isStructTy()) {
            assert(GEP->getNumIndices() == 1);
            LM[GEP] = LM[PtrOp];
            return;
        }

        assert(GEP->getNumIndices() == 2);
        auto FieldIdx = llvm::cast<llvm::ConstantInt>(GEP->getOperand(2));
        auto Length = LM[PtrOp]->at(FieldIdx->getZExtValue());

        LM[GEP] = makeSharedLength({Length});
    };

    // TODO: How to handle phis?
    for (auto &BB : F) {
        for (auto &I : BB) {
            if (LM.count(&I)) continue;
            if (auto Alloca = llvm::dyn_cast<llvm::AllocaInst>(&I)) {
                LM[Alloca] = inferFromType(Alloca->getAllocatedType());
                continue;
            }

            if (llvm::isAllocationFn(&I, TLI, true)) {
                auto Call = llvm::cast<llvm::CallInst>(&I);
                auto Length = llvm::getMallocArraySize(Call, DL, TLI);
                LM[Call] = makeSharedLength({Length});
                continue;
            }

            if (auto Call = getCallToMalloc(&I)) {
                auto MallocArg = Call->getArgOperand(0);
                auto Mul = llvm::cast<llvm::MulOperator>(MallocArg);
                auto Length = Mul->getOperand(0);
                LM[Call] = makeSharedLength({Length});
                continue;
            }

            if (auto BitCast = llvm::dyn_cast<llvm::BitCastInst>(&I)) {
                auto PtrOp = BitCast->getOperand(0);

                if (auto GEP = llvm::dyn_cast<llvm::GEPOperator>(PtrOp))
                    setGEPLength(GEP);

                LM[BitCast] = LM[PtrOp];
                continue;
            }

            if (auto Load = llvm::dyn_cast<llvm::LoadInst>(&I)) {
                auto PtrOp = Load->getPointerOperand();

                if (auto GEP = llvm::dyn_cast<llvm::GEPOperator>(PtrOp))
                    setGEPLength(GEP);

                LM[Load] = LM[PtrOp];
                continue;
            }

            if (auto GEP = llvm::dyn_cast<llvm::GEPOperator>(&I)) {
                setGEPLength(GEP);
                continue;
            }

            // TODO: Handle PHI nodes!
            if (auto Phi = llvm::dyn_cast<llvm::PHINode>(&I)) {
                auto Ty = Phi->getType();
                if (!Ty->isPointerTy()) continue;
                if (!Ty->isStructTy()) {
                    LM[Phi] = makeSharedLength({Zero64});
                    continue;
                }

                auto NumFields = Ty->getStructNumElements();
                std::vector<llvm::Value *> Length(NumFields, Zero64);
                LM[Phi] = makeSharedLength(Length);
                continue;
            }

            auto Store = llvm::dyn_cast<llvm::StoreInst>(&I);
            if (!Store) continue;

            auto ValOp = Store->getValueOperand();
            if (!ValOp->getType()->isPointerTy()) continue;

            if (auto GEP = llvm::dyn_cast<llvm::GEPOperator>(ValOp))
                setGEPLength(GEP);

            auto PtrOp = Store->getPointerOperand();
            while (auto BitCast = llvm::dyn_cast<llvm::BitCastInst>(PtrOp))
                PtrOp = BitCast->getOperand(0);

            auto GEP = llvm::dyn_cast<llvm::GEPOperator>(PtrOp);
            if (!GEP || !GEP->getSourceElementType()->isStructTy()) continue;

            assert(GEP->getNumIndices() >= 2);
            auto FieldIdx = llvm::cast<llvm::ConstantInt>(GEP->getOperand(2))
                                ->getZExtValue();

            auto GEPPtrOp = GEP->getPointerOperand();
            LM[GEPPtrOp]->at(FieldIdx) = LM[ValOp]->at(FieldIdx);
            setGEPLength(GEP);

            auto PtrTy = GEP->getPointerOperandType();
            auto SrcTy = GEP->getSourceElementType();
            auto FieldTy = SrcTy->getStructElementType(FieldIdx);

            if (!UnwrappedTypes.count(PtrTy) || UnwrappedTypes.count(FieldTy))
                continue;

            assert(LM[GEP]->size() == 1);
            auto Name = (GEPPtrOp->hasName() ? GEPPtrOp->getName().str() : "") +
                        ".field" + std::to_string(FieldIdx) + ".length";

            auto InsertionPoint = Store->getNextNode();
            auto LenGEP = llvm::GetElementPtrInst::CreateInBounds(
                SrcTy, GEPPtrOp, {Zero32, One32}, Name + ".ptr", InsertionPoint);

            new llvm::StoreInst(LM[GEP]->at(0), LenGEP, InsertionPoint);
        }
    }

    return LM;
}

/// Takes a function \p F  and traverses the dominance tree of F marking
/// values as tainted, according to a configuration \p Config.
static llvm::DenseSet<llvm::Value *> taint(llvm::Function &F,
                                           config::Func &Config,
                                           llvm::FunctionAnalysisManager &FAM) {

    llvm::DenseSet<llvm::Value *> Tainted;
    auto &DT = FAM.getResult<llvm::DominatorTreeAnalysis>(F);

    std::stack<llvm::BasicBlock *> S;
    S.push(DT.getRoot());

    // We initially mark the arguments from Config as tainted:
    for (auto [_, Idx] : Config) Tainted.insert(F.getArg(Idx));

   // Check if an operand is tainted or not.
    auto IsOpTainted = [&Tainted](auto &Op) {
        return Tainted.contains(llvm::cast<llvm::Value>(Op));
    };

    // Traverse the dominance tree in a DFS-like manner, propagating taint
    // information. We only consider data dependence.
    while (!S.empty()) {
        auto BB = S.top();
        S.pop();

        // We first mark values as tainted, as an intermediate step:
        for (auto &V : *BB) {
            if (std::any_of(V.op_begin(), V.op_end(), IsOpTainted))
                Tainted.insert(&V);
        }

        // Then, if the terminator of the basic block was marked as tainted,
        // we mark the entire basic block as tainted -- this is what we
        // really need:
        if (Tainted.contains(BB->getTerminator())) Tainted.insert(BB);

        // Push every child of BB in the dominance tree to the stack S.
        for (auto Child : DT.getNode(BB)->children()) S.push(Child->getBlock());
    }

    return Tainted;
}

llvm::Value *lif::ctsel(llvm::Value *Cond, llvm::Value *VTrue,
                        llvm::Value *VFalse, llvm::Instruction *Before) {
    return llvm::SelectInst::Create(Cond, VTrue, VFalse, "", Before);
}

/// Takes a pointer operand (either from a load or a store) and transforms it
/// into a safe pointer. That is, if the access to its corresponding address
/// should not happen and is not safe, then we replace it with an access
/// to \p Shadow.
///
/// \returns The llvm value representing the new safe pointer operand.
static llvm::Value *rewritePtrOp(llvm::Value *PtrOp, llvm::AllocaInst *Shadow,
                                 LenMap &LM, llvm::Value *Cond,
                                 llvm::Instruction *Before) {
    auto &Ctx = Shadow->getContext();
    auto Int64Ty = llvm::IntegerType::getInt64Ty(Ctx);
    auto BoolTy = llvm::IntegerType::getInt1Ty(Ctx);
    auto True = llvm::ConstantInt::getTrue(BoolTy);

    auto arrayShape = [Int64Ty](llvm::ArrayType *Ty) {
        std::vector<llvm::Value *> Shape;
        while (Ty) {
            auto NumEl = Ty->getNumElements();
            Shape.push_back(llvm::ConstantInt::get(Int64Ty, NumEl));
            Ty = llvm::dyn_cast<llvm::ArrayType>(Ty->getElementType());
        }
        return Shape;
    };

    auto matchType = [Before](llvm::Value *A, llvm::Value *B) {
        auto Pair = std::make_pair(A, B);
        auto ATy = A->getType();
        auto BTy = B->getType();
        auto ANumBits = ATy->getScalarSizeInBits();
        auto BNumBits = BTy->getScalarSizeInBits();

        if (ANumBits < BNumBits)
            Pair.first = new llvm::SExtInst(A, BTy, "", Before);
        else if (BNumBits < ANumBits)
            Pair.second = new llvm::SExtInst(B, ATy, "", Before);

        return Pair;
    };

    // We move back searching for a GEP related to PtrOp. If there is such a
    // GEP, we need adapt Cond so that we keep the access to PtrOp if (i) the
    // access should happen, i.e. Cond is true, or (ii) the access is safe.
    //
    // TODO: Which other intermediate insts. could we have beside BitCasts?
    auto Base = PtrOp;
    while (llvm::isa<llvm::BitCastInst>(PtrOp))
        Base = llvm::cast<llvm::BitCastInst>(PtrOp)->getOperand(0);

    if (auto GEP = llvm::dyn_cast<llvm::GEPOperator>(Base)) {
        auto GEPSrcTy = GEP->getSourceElementType();
        auto NumIndices = GEP->getNumIndices();

        if (GEPSrcTy->isArrayTy()) {
            auto Shape = arrayShape(llvm::cast<llvm::ArrayType>(GEPSrcTy));
            assert(NumIndices - 1 <= Shape.size());

            llvm::Value *IsSafe = True;
            for (size_t Idx = 1; Idx < NumIndices; Idx++) {
                auto [IdxVal, Length] =
                    matchType(GEP->getOperand(Idx + 1), Shape[Idx - 1]);
                auto IsIdxSafe = llvm::ICmpInst::Create(
                    llvm::Instruction::ICmp, llvm::ICmpInst::ICMP_SLT, IdxVal,
                    Length, "idx" + std::to_string(Idx) + ".safe", Before);
                IsSafe = llvm::BinaryOperator::CreateAnd(IsSafe, IsIdxSafe, "",
                                                         Before);
            }
            IsSafe->setName("access.safe");
            Cond = llvm::BinaryOperator::CreateOr(Cond, IsSafe, "", Before);
        } else if (GEPSrcTy->isStructTy()) {
            assert(NumIndices == 2);
            Cond = llvm::BinaryOperator::CreateOr(Cond, True, "", Before);
        } else {
            assert(NumIndices == 1);
            auto Length = LM[GEP]->at(0);
            auto IsIdxSafe = llvm::ICmpInst::Create(
                llvm::Instruction::ICmp, llvm::ICmpInst::ICMP_SLT,
                GEP->getOperand(1), Length, "idx0.safe", Before);
            Cond = llvm::BinaryOperator::CreateOr(Cond, IsIdxSafe, "", Before);
        }
    }

    auto Cast = new llvm::BitCastInst(Shadow, PtrOp->getType(), "", Before);
    PtrOp = ctsel(Cond, PtrOp, Cast, Before);
    PtrOp->setName("ctsel");

    return PtrOp;
}

void lif::rewriteLoad(llvm::LoadInst &Load, llvm::AllocaInst *Shadow,
                      LenMap &LM, llvm::Value *Cond) {
    Load.setOperand(
        Load.getPointerOperandIndex(),
        rewritePtrOp(Load.getPointerOperand(), Shadow, LM, Cond, &Load));
}

void lif::rewriteStore(llvm::StoreInst &Store, llvm::AllocaInst *Shadow,
                       LenMap &LM, llvm::Value *Cond) {
    // Let addr' be either the original addr accessed by Store or the
    // addr got after transforming a GEP inst. Let val' be either val
    // or Load(addr'), according to the incoming conditions. Replace
    // Store(val, addr) with Store(val', addr').
    auto StoreVal = Store.getValueOperand();
    auto StorePtr =
        rewritePtrOp(Store.getPointerOperand(), Shadow, LM, Cond, &Store);
    Store.setOperand(Store.getPointerOperandIndex(), StorePtr);

    auto Load = new llvm::LoadInst(StoreVal->getType(), StorePtr, "", &Store);
    auto SelectVal = ctsel(Cond, StoreVal, Load, &Store);
    SelectVal->setName("select.val.");
    Store.setOperand(0, SelectVal);
}

llvm::Value *lif::rewriteExitingPredicate(llvm::Instruction &P,
                                          llvm::PHINode &Phi) {
    auto PredAssign = llvm::BinaryOperator::CreateOr(&P, &Phi, "");

    PredAssign->insertAfter(&P);
    P.replaceUsesWithIf(PredAssign, [PredAssign](llvm::Use &U) {
        return U.getUser() != PredAssign;
    });

    return PredAssign;
}

/// Takes a set of tainted instructions and return the corresponding tainted
/// basic blocks.
///
/// \returns a list of the tainted basic blocks, which might be empty.
static std::vector<llvm::BasicBlock *>
taintedBBlocks(llvm::DenseSet<llvm::Value *> &Tainted) {
    std::set<llvm::BasicBlock *> BBTainted;

    for (auto V : Tainted) {
        // Skip any value that is not a basic block:
        auto BB = llvm::dyn_cast<llvm::BasicBlock>(V);
        if (BB && Tainted.contains(BB)) BBTainted.insert(BB);
    }

    return std::vector<llvm::BasicBlock *>(BBTainted.begin(), BBTainted.end());
}

/// Takes a basic block \p BB and computes BB's influence region, which
/// comprises every block between BB and its post dominator.
///
/// \returns a list of the basic blocks that make up BB's influence region.
static std::vector<llvm::BasicBlock *> influenceRegion(llvm::BasicBlock *BB,
                                                       llvm::BasicBlock *PDom) {
    std::vector<llvm::BasicBlock *> IR;

    llvm::DenseSet<llvm::BasicBlock *> Visited;
    std::stack<llvm::BasicBlock *> S;

    auto pushSucc = [&IR, &S, &Visited, PDom](auto BB) {
        for (auto Succ : llvm::successors(BB))
            if (!Visited.contains(Succ) && Succ != PDom) {
                S.push(Succ);
                IR.push_back(Succ);
            }
    };

    pushSucc(BB);
    while (!S.empty()) {
        auto BB = S.top();
        S.pop();
        Visited.insert(BB);
        pushSucc(BB);
    }

    return IR;
}

/// Takes a FunctionWrapper \p FW containing a function to be isochronified and
/// applies the transformation rules whenever necessary.
static void applyRewriteRules(FuncWrapper *FW, LenMap &LM,
                              llvm::FunctionAnalysisManager &FAM) {
    // Initialize the shadow memory as a pointer to an integer. We use
    // MaxPointerSize to ensure absence of overflow.
    auto Shadow = new llvm::AllocaInst(
        llvm::IntegerType::get(
            FW->F.getContext(),
            FW->F.getParent()->getDataLayout().getMaxPointerSizeInBits()),
        0, "shadow", FW->F.getEntryBlock().getTerminator());

    // We rewrite instructions in regions between a tainted node N and its post
    // dominator, which we call as the influence region of N. Because there
    // might be nested influence regions, we store the basic blocks whose
    // instructions we have already rewritten so that we can skip them.
    llvm::DenseSet<llvm::BasicBlock *> Fixed;

    auto ExitPredPhiEnd = FW->LW->ExitPredPhi.end();
    auto &PDT = FAM.getResult<llvm::PostDominatorTreeAnalysis>(FW->F);

    for (auto BBTainted : taintedBBlocks(FW->Tainted)) {
        auto PDom = PDT.getNode(BBTainted)->getIDom()->getBlock();
        for (auto BB : influenceRegion(BBTainted, PDom)) {
            if (Fixed.contains(BB)) continue;
            Fixed.insert(BB);

            auto In = FW->IM[BB];
            auto OutPtr = FW->OM[BB].first;
            bool isBBTainted = FW->Tainted.contains(BB);

            for (auto &I : *BB) {
                if (FW->Skip.contains(&I) || In.empty()) continue;

                // If it is the definition of a tainted predicate that may cause
                // a branch to outside the loop, we need to ensure that whenever
                // its value changes (considering the initial one), it will
                // never change back to the initial.
                auto PredIt =
                    FW->LW->ExitPredPhi.find(llvm::cast<llvm::Value>(&I));
                if (PredIt != ExitPredPhiEnd && isBBTainted) {
                    auto Phi = PredIt->getSecond();
                    auto ExitFreeze = rewriteExitingPredicate(I, *Phi);
                    FW->LW->ExitPredPhi.erase(&I);
                    FW->LW->ExitPredPhi[ExitFreeze] = Phi;
                    FW->Skip.insert(llvm::cast<llvm::Instruction>(ExitFreeze));
                    continue;
                }

                if (!llvm::isa<llvm::LoadInst>(&I) &&
                    !llvm::isa<llvm::StoreInst>(&I))
                    continue;

                // We create a load to get the value of the outgoing
                // condition for each load or store.
                auto OutVal = new llvm::LoadInst(OutPtr->getAllocatedType(),
                                                 OutPtr, "", &I);
                FW->Skip.insert(OutVal);

                if (auto Load = llvm::dyn_cast<llvm::LoadInst>(&I))
                    rewriteLoad(*Load, Shadow, LM, OutVal);
                else if (auto Store = llvm::dyn_cast<llvm::StoreInst>(&I))
                    rewriteStore(*Store, Shadow, LM, OutVal);
            }
        }
    }
}

void lif::rewritePhis(FuncWrapper *FW, llvm::FunctionAnalysisManager &FAM) {
    // Is 'A' reachable from 'B'? We compute this incrementally:
    llvm::DenseMap<llvm::BasicBlock *, llvm::DenseSet<llvm::BasicBlock *>> R;
    auto isReachableFrom = [&R](auto A, auto B) {
        if (A == B) R[A].insert(B);
        if (R[A].contains(B)) return true;

        std::stack<llvm::BasicBlock *> S;
        llvm::DenseSet<llvm::BasicBlock *> Visited;

        for (auto C : llvm::successors(B)) {
            R[C].insert(B);
            S.push(C);
        }

        while (!S.empty()) {
            auto C = S.top();
            S.pop();
            Visited.insert(C);

            if (A == C) R[A].insert(B);
            if (R[A].contains(C)) return true;

            for (auto D : llvm::successors(C)) {
                R[D].insert(C);
                if (!Visited.contains(D)) S.push(D);
            }
        }

        return false;
    };

    auto &DT = FAM.getResult<llvm::DominatorTreeAnalysis>(FW->F);
    // For every loop-exit predicate, we have created a corresponding phi
    // function at the loop header. Since at this point we have already
    // linearized the CFG, it may be that the predicate doesn't dominate all
    // its uses anymore (we may have been using it to compute path conditions).
    // In such cases, we replace its use with its corresponding phi function.
    for (auto [LoopExitPred, Phi] : FW->LW->ExitPredPhi) {
        LoopExitPred->replaceUsesWithIf(Phi, [&DT](llvm::Use &U) {
            return !DT.dominates(U.get(), U);
        });
    }

    for (auto &BB : FW->F) {
        auto PredSize = llvm::pred_size(&BB);
        llvm::SmallPtrSet<llvm::BasicBlock *, 4> Preds(llvm::pred_begin(&BB),
                                                       llvm::pred_end(&BB));
        std::vector<llvm::PHINode *> Rewritten;
        for (auto &Phi : BB.phis()) {
            // List of incoming basic blocks that hasn't changed
            // and because of that we can keep the incoming values:
            llvm::SmallVector<llvm::BasicBlock *, 4> UnchangedFroms;
            // List of incoming values whose corresponding incoming blocks
            // are not a predecessor of BB anymore, plus their corresponding
            // incoming block:
            llvm::SmallVector<std::pair<llvm::BasicBlock *, llvm::Value *>, 4>
                UnlinkedIncs;

            auto NewPhi = llvm::PHINode::Create(
                Phi.getType(), PredSize,
                (Phi.hasName() ? Phi.getName() : "phi") + ".rewritten", &Phi);

            size_t Added = 0;
            for (auto &Inc : Phi.incoming_values()) {
                auto From = Phi.getIncomingBlock(Inc);
                auto Val = Inc.get();

                if (Preds.contains(From)) {
                    NewPhi->addIncoming(Val, From);
                    UnchangedFroms.push_back(From);
                    Added++;
                } else {
                    UnlinkedIncs.push_back({From, Val});
                }
            }

            // Get the intersection between (possibly new) predecessors
            // and old predecessors of BB:
            llvm::SmallPtrSet<llvm::BasicBlock *, 4> Workset(Preds);
            for (auto From : UnchangedFroms) Workset.erase(From);

            assert(Workset.size() == PredSize - Added);
            // For each new predecessors P', we check if there is any inc.
            // val that reaches P'. If so, we change the inc. block of this
            // value to P'; otherwise, we add an undef inc. val for P':
            for (auto From : Workset) {
                llvm::Value *FromVal = llvm::UndefValue::get(Phi.getType());

                auto End = UnlinkedIncs.end();
                for (auto It = UnlinkedIncs.begin(); It != End; ++It) {
                    auto [OldFrom, Val] = *It;
                    if (!isReachableFrom(From, OldFrom)) continue;

                    UnlinkedIncs.erase(It);
                    // If Val is a constant or the new incoming block (From)
                    // is dominated by the old incoming block (OldFrom), we
                    // can just use Val as it is.
                    if (llvm::isa<llvm::Constant>(Val) ||
                        DT.dominates(OldFrom, From)) {

                        FromVal = Val;
                        break;
                    }

                    // Else, we add a phi node to get the value of Val if
                    // available or undef otherwise:
                    auto MaybeUndef = llvm::PHINode::Create(
                        Val->getType(), llvm::pred_size(From), "incval.phi",
                        From->getFirstNonPHI());

                    for (auto Pred : llvm::predecessors(From)) {
                        MaybeUndef->addIncoming(
                            isReachableFrom(Pred, OldFrom)
                                ? Val
                                : llvm::UndefValue::get(Val->getType()),
                            Pred);
                    }

                    FromVal = MaybeUndef;
                    break;
                }

                NewPhi->addIncoming(FromVal, From);
            }

            Rewritten.push_back(&Phi);
            llvm::Value *PhiSelect = NewPhi;

            auto InsertionPoint = BB.getFirstNonPHI();
            for (size_t Idx = 0; Idx < FW->IM[&BB].size(); Idx++)
                InsertionPoint = InsertionPoint->getNextNode();

            for (auto [OldFrom, Val] : UnlinkedIncs) {
                auto Cond = FW->IM[&BB][OldFrom];
                PhiSelect = llvm::SelectInst::Create(
                    Cond, Val, PhiSelect, "phi.fold", InsertionPoint);
            }

            Phi.replaceAllUsesWith(PhiSelect);
        }

        for (auto &Phi : Rewritten) Phi->removeFromParent();
    }
}

std::vector<llvm::BasicBlock *>
lif::compactOrder(FuncWrapper *FW, llvm::FunctionAnalysisManager &FAM) {
    std::vector<llvm::BasicBlock *> BBs;

    // Simply run CCFG's compact order and ignore loop nodes:
    auto Entry = CCFG::Node::make(&FW->F.getEntryBlock(), FW->LW->LI);

    for (auto N : CCFG::compactOrder(Entry, FW->LW->LI, FAM)) {
        if (std::holds_alternative<llvm::BasicBlock *>(N->Val))
            BBs.push_back(N->asBasicBlock());
    }

    return BBs;
}

void lif::plinearize(FuncWrapper *FW, llvm::FunctionAnalysisManager &FAM) {
    auto CompactOrder = compactOrder(FW, FAM);
    llvm::DenseMap<llvm::BasicBlock *, size_t> Index;

    for (size_t Idx = 0; Idx < CompactOrder.size(); Idx++)
        Index[CompactOrder[Idx]] = Idx;

    // Use the index map to get the first bb that appear in compact order:
    auto min = [&Index](auto &BBs) {
        llvm::BasicBlock *MinBB = nullptr;
        for (auto BB : BBs)
            if (!MinBB || Index[BB] < Index[MinBB]) MinBB = BB;
        return MinBB;
    };

    auto isLoopTainted =
        [FW](llvm::SmallVectorImpl<llvm::BasicBlock *> &ExitingBlocks) {
            for (auto Ex : ExitingBlocks)
                if (FW->Tainted.contains(Ex)) return true;

            return false;
        };

    // Set of deferral edges maintained by Moll & Hack's algorithm.
    std::set<std::pair<llvm::BasicBlock *, llvm::BasicBlock *>> D;
    for (auto BB : CompactOrder) {
        // Set of deferral edges that leave BB:
        llvm::DenseSet<llvm::BasicBlock *> T;
        for (auto E : D)
            if (E.first == BB) T.insert(E.second);


        auto IsExitingBB = FW->LW->ExitingBlocks.contains(BB);
        auto L = FW->LW->LI.getLoopFor(BB);

        llvm::SmallVector<llvm::BasicBlock *, 4> ExitBlocks;
        llvm::SmallVector<llvm::BasicBlock *, 4> ExitingBlocks;
        bool IsLoopTainted = false;

        if (L) {
            L->getExitBlocks(ExitBlocks);
            L->getExitingBlocks(ExitingBlocks);
            IsLoopTainted = isLoopTainted(ExitingBlocks);
        }

        // If M is clean (equivalent as uniform in Moll & Hack's algorithm):
        if (!FW->Tainted.contains(BB)) {
            auto End = llvm::succ_end(BB);
            for (auto It = llvm::succ_begin(BB); It != End; ++It) {
                llvm::SmallPtrSet<llvm::BasicBlock *, 8> S;
                auto Succ = *It;
                auto IsExitSucc = FW->LW->ExitBlocks.contains(Succ);

                // If BB is an exiting block and the loop is tainted
                // we redirect every exiting edge to the same node:
                if (IsExitingBB && IsExitSucc && IsLoopTainted) {
                    S.insert(ExitBlocks.begin(), ExitBlocks.end());
                } else {
                    S.insert(Succ);
                }

                // S = T U {N or Exits}
                S.insert(T.begin(), T.end());
                auto Next = min(S);

                // D = D U {(Next, t) | t in (T U {N}) \ {Next}}, i.e.
                // D = D U {(Next, t) | t in S \ {Next}}.
                S.erase(Next);
                for (auto Target : S) D.insert({Next, Target});

                if (Next == Succ) continue;

                // Update successor:
                auto Br = llvm::cast<llvm::BranchInst>(BB->getTerminator());
                Br->setSuccessor(It.getSuccessorIndex(), Next);
            }
        }

        // If BB is tainted (equivalent as divergent in Moll & Hack's
        // algorithm):
        else if (llvm::succ_size(BB) > 0) {
            llvm::SmallPtrSet<llvm::BasicBlock *, 8> S;
            // S = {s | (b, s) in E(G)}
            S.insert(llvm::succ_begin(BB), llvm::succ_end(BB));
            // T U S
            S.insert(T.begin(), T.end());

            auto Next = min(S);

            // D = D U {(Next, t) | t in (T U S) \ {Next}}
            S.erase(Next);
            for (auto Target : S) D.insert({Next, Target});

            auto Br = llvm::cast<llvm::BranchInst>(BB->getTerminator());
            llvm::ReplaceInstWithInst(Br, llvm::BranchInst::Create(Next, Br));
        }

        // D = D \ {(M, N) | (M, N) in D}, where M is fixed as the
        // current node. Equivalent to C++20 erase_if:
        for (auto It = D.begin(), End = D.end(); It != End;) {
            if (It->first == BB)
                It = D.erase(It);
            else {
                ++It;
            }
        }
    }
}

void lif::rewriteFunc(FuncWrapper *FW, LenMap &LM,
                      llvm::FunctionAnalysisManager &FAM) {
    auto PA = llvm::PreservedAnalyses::all();
    PA.abandon(llvm::DominatorTreeAnalysis::ID());
    FAM.invalidate(FW->F, PA);

    // Step 1: apply the transformation rules to the load, stores and
    // definition of loop-exiting predicates, to ensure the correctness
    // of the produced code:
    applyRewriteRules(FW, LM, FAM);

    // Step 2: Partial linearization of the CFG:
    plinearize(FW, FAM);
    FAM.invalidate(FW->F, PA);

    // Step 3: Since we have (partially) linearized the CFG, we need
    // to adjust the old phi functions:
    rewritePhis(FW, FAM);
}

FuncWrapper lif::wrapFunc(llvm::Function &F, config::Func &Config,
                          bool IsDerived, llvm::FunctionAnalysisManager &FAM) {
    FuncWrapper FW(F, IsDerived);

    // Taint values according to the observable inputs from the config file.
    FW.Tainted = taint(F, Config, FAM);

    // Prepare loops by inserting phi-functions at loop headers for every
    // predicate that branch out the loop.
    auto &LI = FAM.getResult<llvm::LoopAnalysis>(F);
    auto LW = wrapLoop(LI, F.getContext());
    FW.LW = std::make_unique<LoopWrapper>(LW);

    // Bind the outgoing and incoming conditions to all basic blocks.
    FW.OM = allocOut(F, LW, FW.Tainted);
    auto &DT = FAM.getResult<llvm::DominatorTreeAnalysis>(F);
    auto [IM, MemInsts] = bindAll(F, FW.OM, LW, FW.Tainted, DT);
    FW.IM = IM;

    // Fill Skip with the Load/Stores generated after binding the conditions
    // to each basic block, since we don't need to modify them.
    for (auto I : MemInsts) FW.Skip.insert(I);

    return FW;
}

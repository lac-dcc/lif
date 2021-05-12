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

#include <llvm/ADT/DenseSet.h>
#include <llvm/ADT/PostOrderIterator.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/MemoryBuiltins.h>
#include <llvm/Analysis/TargetLibraryInfo.h>
#include <llvm/IR/Argument.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Use.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/Casting.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>

#include <stack>

using namespace lif;

// FIXME: Compute length of arrays inside structs (recursive?).
// TODO: Refactor everything... argh, so ugly!!!!!!
LenMap lif::computeLength(llvm::Function &F,
                          const llvm::TargetLibraryInfo *TLI) {
    LenMap LM;
    auto DL = F.getParent()->getDataLayout();
    auto *Int64Ty = llvm::IntegerType::getInt64Ty(F.getContext());

    // Helper function to early propagate the length to users of arguments or
    // globals.
    auto Propagate = [&LM](llvm::Value *V) {
        for (auto U : V->users())
            if (llvm::isa<llvm::PointerType>(U->getType())) LM[U] = LM[V];
    };

    // We first compute the length of the pointer arguments. This is quite
    // simple, since we require each pointer to be immediately followed by its
    // length. TODO: get the length from annotations?.
    auto ArgEnd = F.arg_end();
    for (auto It = F.arg_begin(); It != ArgEnd; ++It) {
        auto V = &*It;
        if (!llvm::isa<llvm::PointerType>(V->getType())) continue;

        auto Len = &*(It + 1);
        assert(llvm::isa<llvm::IntegerType>(Len->getType()) &&
               "pointer argument must be followed by its length!");

        LM[V] = Len;
        Propagate(V);
    }

    auto dynCastNestedArrType = [](auto *Ty) {
        return llvm::dyn_cast<llvm::ArrayType>(Ty->getElementType());
    };

    // Then we compute the length of all global values.
    for (auto &Global : F.getParent()->globals()) {
        if (LM.count(&Global)) continue;

        auto *PtrTy = llvm::dyn_cast<llvm::PointerType>(Global.getType());
        if (!PtrTy) continue;

        auto *Len = llvm::ConstantInt::get(Int64Ty, 1);
        auto *ArrTy = dynCastNestedArrType(PtrTy);

        if (ArrTy) {
            auto NumElems = ArrTy->getNumElements();
            while ((ArrTy = dynCastNestedArrType(ArrTy)))
                NumElems *= ArrTy->getNumElements();
            Len = llvm::ConstantInt::get(Int64Ty, NumElems);
        }

        LM[&Global] = Len;
        Propagate(&Global);
    }

    // For phis, we create a phi to select between the length of the pointers.
    // We leave the incoming values (the lengths) as holes to be filled after
    // we've computed the length of the other values.
    llvm::DenseMap<
        llvm::PHINode *,
        llvm::SmallVector<std::pair<llvm::BasicBlock *, llvm::Value *>, 8>>
        PhiLens;

    // Returns true if V is a pointer and it is either an argument or a global
    // value.
    auto isNonLocalPtr = [](llvm::Value *V) {
        return (llvm::isa<llvm::Argument>(V) ||
                llvm::isa<llvm::GlobalValue>(V)) &&
               llvm::isa<llvm::PointerType>(V->getType());
    };

    // Returns true if V is a malloc, realloc, calloc, etc.
    auto isMemAllocCall = [TLI](llvm::Value *V) {
        return llvm::isa<llvm::CallInst>(V) && llvm::isAllocLikeFn(V, TLI);
    };

    // Now we compute the length of the pointers used inside the F's body.
    for (auto &BB : F) {
        for (auto &I : BB) {
            // We only care for pointers...
            auto *PtrTy = I.getType();
            if (!llvm::isa<llvm::PointerType>(PtrTy)) continue;

            // We've already computed the length of this guy, so just move on.
            if (LM.count(&I)) continue;

            // If it is not a alloca inst, malloc, a global array or an
            // argument ptr, we need to move back until we reach the base
            // instruction. However, we may be lucky if we reach a GEP
            // instruction in which we can extract the array type.
            llvm::Value *Ptr = &I;
            std::stack<llvm::Value *> Ptrs;
            Ptrs.push(Ptr);

            // Arguments and globals are always be cached, since we compute
            // their lengths before moving to the body of the function.
            bool Cached = false;
            llvm::DenseSet<llvm::Value *> Skip;

            while (!(Cached || llvm::isa<llvm::AllocaInst>(Ptr) ||
                     isNonLocalPtr(Ptr) || isMemAllocCall(Ptr))) {
                // We already computed this? So no need to go ahead.
                if (LM.count(Ptr)) {
                    Cached = true;
                    break;
                };

                // Is this a GEP? If so, is it pointing to an array? Yes? Cool!
                auto *GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(Ptr);
                if (GEP &&
                    llvm::isa<llvm::ArrayType>(GEP->getPointerOperandType()))
                    break;

                // Is this is a phi node? If so, we create a second phi node to
                // select between the length of the pointers.
                auto *Phi = llvm::dyn_cast<llvm::PHINode>(Ptr);
                if (Phi && llvm::isa<llvm::PointerType>(Phi->getType())) {
                    llvm::SmallVector<
                        std::pair<llvm::BasicBlock *, llvm::Value *>, 8>
                        IncEdges;
                    llvm::SmallVector<llvm::BasicBlock *, 4> Cycles;

                    for (auto *BB : Phi->blocks()) {
                        // Ignore cycles!
                        if (BB == Phi->getParent()) {
                            Cycles.push_back(BB);
                            continue;
                        }

                        auto *V = Phi->getIncomingValueForBlock((BB));
                        IncEdges.push_back({BB, V});
                    }

                    // In case we have cycles, i.e. |Incs| < number of
                    // predecessors, we fill the remaining wholes by repeating
                    // previous values. Does this make sense??
                    auto V = IncEdges.back().second;
                    for (auto BB : Cycles) IncEdges.push_back({BB, V});

                    auto *Len = llvm::PHINode::Create(Int64Ty, IncEdges.size(),
                                                      "", Phi->getNextNode());

                    PhiLens[Len] = IncEdges;
                    LM[Phi] = Len;
                    Cached = true;
                    break;
                }

                // TODO: is there any better approach for this backward step?
                for (auto &Op :
                     llvm::cast<llvm::Instruction>(Ptr)->operands()) {
                    auto *OpTy = Op->getType();
                    if (llvm::isa<llvm::PointerType>(OpTy)) {
                        Ptr = Op;
                        Ptrs.push(Ptr);
                        Cached = LM.count(Ptr);
                        break;
                    }
                }
            }

            llvm::Value *Len;
            // Hell yeah! No need to compute again!
            if (Cached) Len = LM[Ptr];

            // We're lucky! It is a GEP and the type is an array.
            else if (auto *GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(Ptr)) {
                auto *ArrTy =
                    llvm::cast<llvm::ArrayType>(GEP->getPointerOperandType());
                auto NumElems = ArrTy->getNumElements();

                while ((ArrTy = dynCastNestedArrType(ArrTy)))
                    NumElems *= ArrTy->getNumElements();

                Len = llvm::ConstantInt::get(Int64Ty, NumElems);
            }

            // Okay, not a GEP. Perhaps an alloca?
            else if (auto *Alloca = llvm::dyn_cast<llvm::AllocaInst>(Ptr)) {
                auto *ArrTy =
                    llvm::dyn_cast<llvm::ArrayType>(Alloca->getAllocatedType());

                if (ArrTy && !Alloca->isArrayAllocation()) {
                    auto NumElems = ArrTy->getNumElements();

                    while ((ArrTy = dynCastNestedArrType(ArrTy)))
                        NumElems *= ArrTy->getNumElements();

                    Len = llvm::ConstantInt::get(Int64Ty, NumElems);
                } else {
                    Len = Alloca->getArraySize();
                }
            }

            // Nothing yet... so it has to be a malloc call!
            else {
                auto *Call = llvm::cast<llvm::CallInst>(Ptr);
                Len = getMallocArraySize(Call, DL, TLI);
            }

            while (!Ptrs.empty()) {
                LM[Ptrs.top()] = Len;
                Ptrs.pop();
            }
        }
    }

    // Finally, we fill the gaps of the phi nodes that we've created.
    for (auto [Phi, IncEdges] : PhiLens)
        for (auto [BB, V] : IncEdges) Phi->addIncoming(LM[V], BB);

    return LM;
}

void lif::unifyExits(llvm::Function &F) {
    llvm::SmallVector<llvm::ReturnInst *, 4> Returns;
    for (auto &BB : F) {
        for (auto &I : BB) {
            auto *Ret = llvm::dyn_cast<llvm::ReturnInst>(&I);
            if (Ret) Returns.push_back(Ret);
        }
    }

    if (Returns.size() == 1) return;

    // We create a new basic block for the unique return point and transform
    // all the other return points to uncond. branches.
    auto *Ret = Returns[0];
    auto *Exit =
        llvm::BasicBlock::Create(F.getContext(), "", &F, Ret->getParent());
    auto *Phi = llvm::PHINode::Create(Ret->getReturnValue()->getType(),
                                      Returns.size(), "");

    for (auto *Ret : Returns) {
        Phi->addIncoming(Ret->getReturnValue(), Ret->getParent());
        llvm::ReplaceInstWithInst(Ret, llvm::BranchInst::Create(Exit));
    }

    Exit->getInstList().insert(Exit->end(), Phi);
    Exit->getInstList().insert(Exit->end(),
                               llvm::ReturnInst::Create(F.getContext(), Phi));
}

llvm::Value *lif::ctsel(llvm::Value *Cond, llvm::Value *VTrue,
                        llvm::Value *VFalse, llvm::Instruction *Before) {
    return llvm::SelectInst::Create(Cond, VTrue, VFalse, "", Before);
}

llvm::Value *lif::transformGEP(llvm::GetElementPtrInst *GEP,
                               llvm::AllocaInst *Shadow, llvm::Value *PtrLen,
                               llvm::Value *Cond, llvm::Instruction *Before) {
    // If GEP operand pointer is of array type, it may be a multidimensional
    // array so we need to compute the actual index.
    //
    // Example 1: an access like A[1][1] may be translated to a getlementptr
    // .. i32 0, i64 1, i64 1.  In this situation, the actual index would be
    // 2^0 * 1 + 2^1 * 1 = 3.
    //
    // Example 2: Let A be the third field of some struct. In this case, the
    // GEP inst. would be something like getlementptr ... i32 0, i32 2, i64
    // 1, i64 1. Hence, the actual index would be 0 + 2 + 2^0 * 1 + 2^1 * 1
    // = 5. For computing the safety of the access we are interested in the
    // index related to the array, so in this case it would be 3 as well.
    //
    // TODO: We can simplify this code if we change the behavior of
    // computeLength for multidimensional arrays (and structs). Instead of
    // computing a single value, we can store a list of lengths (e.g. a
    // matrix [3][3] would be stored as two lengths [3, 3]). This way, we
    // already know how much operand indices we need to aggregate (in case
    // we're explicit dealing with a multidimensional array). For simple
    // pointers we'd store the length as a list of size 1, so we know that
    // we should compare with the last idx operand. The "base" GEP operand
    // pointer type is always a pointer.
    auto *PtrOpTy = llvm::cast<llvm::PointerType>(GEP->getPointerOperandType())
                        ->getElementType();

    size_t OpIdx = 1;
    // Move until we found the pointed element (which can be an array).
    while ((llvm::isa<llvm::PointerType>(PtrOpTy) ||
            llvm::isa<llvm::StructType>(PtrOpTy)) &&
           OpIdx < GEP->getNumOperands() - 1) {
        OpIdx++;
        if (llvm::isa<llvm::PointerType>(PtrOpTy)) {
            PtrOpTy = llvm::cast<llvm::PointerType>(PtrOpTy)->getElementType();
        } else {
            auto *Op = llvm::cast<llvm::ConstantInt>(GEP->getOperand(OpIdx));
            PtrOpTy = llvm::cast<llvm::StructType>(PtrOpTy)->getElementType(
                Op->getSExtValue());
        }
    }

    auto *Idx = GEP->getOperand(OpIdx);
    auto ArrIdxMult = 1;

    auto MatchType = [Before](llvm::Value *&A, llvm::Value *&B) {
        auto *ATy = A->getType();
        auto *BTy = B->getType();
        int ANumBits = ATy->getScalarSizeInBits();
        int BNumBits = BTy->getScalarSizeInBits();
        if (ANumBits < BNumBits)
            A = new llvm::SExtInst(A, BTy, "", Before);
        else if (BNumBits < ANumBits)
            B = new llvm::SExtInst(B, ATy, "", Before);
    };

    if (llvm::isa<llvm::ArrayType>(PtrOpTy)) {
        auto *ArrIdx = GEP->getOperand(OpIdx);
        auto *ArrIdxTy = ArrIdx->getType();
        MatchType(ArrIdx, Idx);
        Idx = llvm::BinaryOperator::CreateMul(
            ArrIdx, llvm::ConstantInt::get(ArrIdxTy, ArrIdxMult), "", Before);

        while (OpIdx < GEP->getNumIndices()) {
            ArrIdxMult *= 2;
            OpIdx++;
            auto *ArrIdx = GEP->getOperand(OpIdx);
            auto *ArrIdxTy = ArrIdx->getType();
            MatchType(ArrIdx, Idx);
            ArrIdx = llvm::BinaryOperator::CreateMul(
                ArrIdx, llvm::ConstantInt::get(ArrIdxTy, ArrIdxMult), "",
                Before);
            MatchType(ArrIdx, Idx);
            Idx = llvm::BinaryOperator::CreateAdd(Idx, ArrIdx, "", Before);
        }
    }

    MatchType(Idx, PtrLen);
    auto *IsSafe = llvm::ICmpInst::Create(llvm::Instruction::ICmp,
                                          llvm::ICmpInst::ICMP_SLT, Idx, PtrLen,
                                          "", Before);

    // Check if (i) the incoming condition is true OR (ii) the access to the
    // original array at Idx is safe. If (i), we execute the original
    // instruction as it is. If (ii), we also execute the original
    // instruction as it is because we know the access is inbounds.
    // Otherwise, we access a shadow memory.
    auto *NewPtr = ctsel(
        llvm::BinaryOperator::CreateOr(Cond, IsSafe, "safe.", Before), GEP,
        new llvm::BitCastInst(Shadow, GEP->getType(), "", Before), Before);

    NewPtr->setName("select.ptr.");
    return NewPtr;
}

void lif::transformLoad(llvm::LoadInst &Load, llvm::AllocaInst *Shadow,
                        llvm::Value *PtrLen, llvm::Value *Cond) {
    // The pointer operand may be a GEP in the form of a ConstantExpr. In
    // this case, we transform it into a GEP instruction so we can handle
    // easier.
    auto *PtrOp = Load.getPointerOperand();
    if (auto *ConstExpr = llvm::dyn_cast<llvm::ConstantExpr>(PtrOp)) {
        auto *GEP =
            llvm::cast<llvm::GetElementPtrInst>(ConstExpr->getAsInstruction());
        GEP->insertBefore(&Load);
        Load.setOperand(Load.getPointerOperandIndex(), GEP);
    }
    // If the pointer operand is a GEP we need to transform it in order to
    // ensure the safety of the memory access.
    PtrOp = Load.getPointerOperand();
    if (auto *GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(PtrOp))
        Load.setOperand(Load.getPointerOperandIndex(),
                        transformGEP(GEP, Shadow, PtrLen, Cond, &Load));
}

void lif::transformStore(llvm::StoreInst &Store, llvm::AllocaInst *Shadow,
                         llvm::Value *PtrLen, llvm::Value *Cond) {
    // Let addr' be either the original addr accessed by Store or the addr
    // got after transforming a GEP inst. Let val' be either val or
    // Load(addr'), according to the incoming conditions. Replace Store(val,
    // addr) by Store(val', addr').
    auto *StoreVal = Store.getValueOperand();
    auto *StorePtr = Store.getPointerOperand();

    // If the Ptr operand is a GEP instruction, then we need to transform it
    // in in order to ensure the safety of the memory access. If not, this
    // load does not need to be transformed.  We fold the incoming
    // conditions from InV into a single value by applying the operator |
    // (or) to get the condition.
    if (auto *GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(StorePtr))
        Store.setOperand(Store.getPointerOperandIndex(),
                         transformGEP(GEP, Shadow, PtrLen, Cond, &Store));

    auto *Load = new llvm::LoadInst(StoreVal->getType(), StorePtr, "", &Store);
    auto *SelectVal = ctsel(Cond, StoreVal, Load, &Store);
    SelectVal->setName("select.val.");
    Store.setOperand(0, SelectVal);
}

void lif::transformPhi(llvm::PHINode &Phi,
                       const llvm::SmallVectorImpl<Incoming> &Incomings) {
    // No incoming condition, so there is nothing to do.
    if (Incomings.empty()) return;

    auto *V0 = Phi.getIncomingValueForBlock(Incomings.front().From);
    auto *Cond0 = Incomings.front().Cond;

    if (Incomings.size() > 1) {
        auto *Before =
            llvm::cast<llvm::Instruction>(Incomings.back().Cond)->getNextNode();
        auto *IncBegin = Incomings.begin();
        auto *It1 = Incomings.end() - 1;

        auto *V1 = Phi.getIncomingValueForBlock(It1->From);
        for (auto It2 = It1 - 1; It2 != IncBegin; --It1, --It2) {
            auto *IncVal = Phi.getIncomingValueForBlock(It2->From);
            V1 = llvm::SelectInst::Create(It2->Cond, IncVal, V1, "", Before);
        }

        V0 = llvm::SelectInst::Create(Cond0, V0, V1, "select.phi.", Before);
    }

    Phi.replaceAllUsesWith(V0);
    Phi.eraseFromParent();
}

void lif::transformPredAssign(llvm::Instruction &P, llvm::PHINode &Phi) {
    auto *PredAssign = llvm::BinaryOperator::CreateOr(&P, &Phi, "");

    PredAssign->insertAfter(&P);
    P.replaceUsesWithIf(PredAssign, [PredAssign](llvm::Use &U) {
        return U.getUser() != PredAssign;
    });
}

/// Takes a FunctionWrapper \p FW containing a function to be isochronified and
/// applies the transformation rules whenever necessary.
static void applyTransformRules(FuncWrapper *FW,
                                llvm::FunctionAnalysisManager &FAM) {
    // Get the length associated with each pointer (either local or argument).
    auto LM = computeLength(FW->F,
                            &FAM.getResult<llvm::TargetLibraryAnalysis>(FW->F));

    // Initialize the shadow memory as a pointer to an integer. We use
    // MaxPointerSize to ensure absence of overflow.
    auto *Shadow = new llvm::AllocaInst(
        llvm::IntegerType::get(
            FW->F.getContext(),
            FW->F.getParent()->getDataLayout().getMaxPointerSizeInBits()),
        0, "shadow", FW->F.getEntryBlock().getTerminator());

    auto LLEnd = FW->LW->LLBlocks.end();
    for (auto &BB : FW->F) {
        // We need to collect every phi instruction and store in a separate
        // vector because phi transform. fn removes the phi instruction, so we
        // cannot do this in an iterator loop.
        llvm::SmallVector<llvm::PHINode *, 16> Phis;
        auto Incomings = FW->IM[&BB];
        auto *OutPtr = FW->OM[&BB];

        bool IsLH = FW->LW->LI.isLoopHeader(&BB);
        bool IsLL = FW->LW->LLBlocks.find(&BB) != LLEnd;

        for (auto &I : BB) {
            if (FW->Skip.count(&I) || Incomings.empty()) continue;

            if (auto *Phi = llvm::dyn_cast<llvm::PHINode>(&I)) {
                if (!IsLH) Phis.push_back(Phi);
                continue;
            }

            // If it is the definition of a predicate that may cause a branch
            // to outside the loop, we need to ensure that whenever its value
            // changes (considering the initial one), it will never change back
            // to the initial. Note that this does not apply to the LL block.
            auto PredIt = FW->LW->PredMap.find(llvm::cast<llvm::Value>(&I));
            if (!IsLL && PredIt != FW->LW->PredMap.end()) {
                transformPredAssign(I, *PredIt->getSecond());
                continue;
            }

            if (!llvm::isa<llvm::LoadInst>(&I) &&
                !llvm::isa<llvm::StoreInst>(&I))
                continue;

            // We create a load to get the value of the outgoing condition for
            // each load or store. There is probably a better way to do that,
            // but this is simpler.
            auto *OutVal =
                new llvm::LoadInst(OutPtr->getAllocatedType(), OutPtr, "", &I);
            FW->Skip.insert(OutVal);

            if (auto *Load = llvm::dyn_cast<llvm::LoadInst>(&I)) {
                auto *PtrLen = LM[Load->getPointerOperand()];
                transformLoad(*Load, Shadow, PtrLen, OutVal);
            } else if (auto *Store = llvm::dyn_cast<llvm::StoreInst>(&I)) {
                auto *PtrLen = LM[Store->getPointerOperand()];
                transformStore(*Store, Shadow, PtrLen, OutVal);
            }
        }

        for (auto *Phi : Phis) transformPhi(*Phi, Incomings);
    }
}

/// Takes a FunctionWrapper \p FW containing a function to be isochronified and
/// replaces every early exiting point of a loop with a unconditional jump to
/// the successor block that is inside the loop, essentially making every loop
/// to have a single exit region.
static void elimEarlyExits(FuncWrapper *FW) {
    auto LLEnd = FW->LW->LLBlocks.end();
    auto LExitEnd = FW->LW->ExitBlocks.end();
    for (auto *LE : FW->LW->ExitingBlocks) {
        // Skip loop latches, since they contain the loop termination condition
        // and thus must not be transformed.
        if (FW->LW->LLBlocks.find(LE) != LLEnd) continue;

        auto *LET = LE->getTerminator();
        llvm::BasicBlock *Inside = nullptr, *Outside = nullptr;

        for (auto *Target : llvm::cast<llvm::BranchInst>(LET)->successors()) {
            if (FW->LW->ExitBlocks.find(Target) == LExitEnd)
                Inside = Target;
            else
                Outside = Target;
        }

        // TODO: we should actually consider the post dominator of the loop
        // header, which should in turn post-dominate every loop exit block.
        //
        // Outside may be a basic block created to eliminate critical edges. In
        // such case, it may become unreachable if we just ignore it. Thus, we
        // need to reconnect it to the CFG somehow. If that is the case, we
        // link LE to Outside and Outside to Inside.
        auto Target = Inside;
        if (pred_size(Outside) == 1) {
            auto *T = llvm::cast<llvm::BranchInst>(Outside->getTerminator());
            T->setSuccessor(0, Inside);
            Target = Outside;
        }

        ReplaceInstWithInst(LET, llvm::BranchInst::Create(Target));
    }
}

/// Takes a FunctionWrapper \p FW containing a function to be isochronified and
/// eliminates every conditional statement that is not a loop termination
/// condition.
static void elimCondStmts(FuncWrapper *FW) {
    auto LLEnd = FW->LW->LLBlocks.end();
    // Replace each terminator with an uncond. br linked to the next basic
    // block, following the reverse postorder.
    llvm::ReversePostOrderTraversal<llvm::Function *> RPOT(&FW->F);
    auto RPOTEnd = RPOT.end();
    for (auto It = RPOT.begin(); It + 1 != RPOTEnd; ++It) {
        auto *BB = *It;
        auto *T = BB->getTerminator();

        // Do not mess with loop conditions.
        if (FW->LW->LLBlocks.find(BB) != LLEnd) continue;

        // We must not remove loop conditions, so just skip them.
        if (FW->LW->LLBlocks.find(BB) == LLEnd)
            ReplaceInstWithInst(T, llvm::BranchInst::Create(*(It + 1)));
    }
}

void lif::transformFunc(FuncWrapper *FW, llvm::FunctionAnalysisManager &FAM) {
    // Phase 1: apply the transformation rules to the load, stores, phis and
    // pred. assignments.
    applyTransformRules(FW, FAM);

    // Phase 2: eliminate every conditional statement that branches to outside
    // a loop and is not the loop latch (i.e. the loop termination condition).
    elimEarlyExits(FW);

    // Phase 3: eliminate every conditional statement that is not a loop
    // termination.
    elimCondStmts(FW);
}

FuncWrapper lif::wrapFunc(llvm::Function &F, bool IsDerived,
                          llvm::FunctionAnalysisManager &FAM) {
    FuncWrapper FW(F, IsDerived);
    // Transform multiple return points into a unique exit block.
    unifyExits(F);

    // Prepare loops by inserting phi-functions at loop headers for every
    // predicate that branch out the loop.
    auto &LI = FAM.getResult<llvm::LoopAnalysis>(F);
    auto LW = prepare(LI, F.getContext());
    FW.LW = std::make_unique<LoopWrapper>(LW);

    // Bind the outgoing and incoming conditions to all basic blocks.
    FW.OM = allocOut(F);
    auto [IM, MemInsts] = bindAll(F, FW.OM, LW);
    FW.IM = IM;

    // Fill Skip with the Load/Stores generated after binding the conditions
    // to each basic block, since we don't need to modify them.
    for (auto *I : MemInsts) FW.Skip.insert(I);

    return FW;
}

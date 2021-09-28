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

#include <algorithm>
#include <functional>
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
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Use.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/Casting.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>

#include <stack>
#include <variant>

using namespace lif;

// FIXME: Compute length of arrays inside structs (recursive?).
// TODO: Refactor everything... argh, so ugly!!!!!!
LenMap lif::computeLength(llvm::Function &F,
                          const llvm::TargetLibraryInfo *TLI) {
    LenMap LM;
    auto DL = F.getParent()->getDataLayout();
    auto Int64Ty = llvm::IntegerType::getInt64Ty(F.getContext());

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

    auto dynCastNestedArrType = [](auto Ty) {
        return llvm::dyn_cast<llvm::ArrayType>(Ty->getElementType());
    };

    // Then we compute the length of all global values.
    for (auto &Global : F.getParent()->globals()) {
        if (LM.count(&Global)) continue;

        auto PtrTy = llvm::dyn_cast<llvm::PointerType>(Global.getType());
        if (!PtrTy) continue;

        auto Len = llvm::ConstantInt::get(Int64Ty, 1);
        auto ArrTy = dynCastNestedArrType(PtrTy);

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
            auto PtrTy = I.getType();
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

            // Arguments and globals are always cached, since we compute their
            // lengths before moving to the body of the function.
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
                auto GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(Ptr);
                if (GEP &&
                    llvm::isa<llvm::ArrayType>(GEP->getPointerOperandType()))
                    break;

                // Is this is a phi node? If so, we create a second phi node to
                // select between the length of the pointers.
                auto Phi = llvm::dyn_cast<llvm::PHINode>(Ptr);
                if (Phi && llvm::isa<llvm::PointerType>(Phi->getType())) {
                    llvm::SmallVector<
                        std::pair<llvm::BasicBlock *, llvm::Value *>, 8>
                        IncEdges;
                    llvm::SmallVector<llvm::BasicBlock *, 4> Cycles;

                    for (auto BB : Phi->blocks()) {
                        // Ignore cycles!
                        if (BB == Phi->getParent()) {
                            Cycles.push_back(BB);
                            continue;
                        }

                        auto V = Phi->getIncomingValueForBlock((BB));
                        IncEdges.push_back({BB, V});
                    }

                    // In case we have cycles, i.e. |Incs| < number of
                    // predecessors, we fill the remaining wholes by repeating
                    // previous values. Does this make sense??
                    auto V = IncEdges.back().second;
                    for (auto BB : Cycles) IncEdges.push_back({BB, V});

                    auto Len = llvm::PHINode::Create(Int64Ty, IncEdges.size(),
                                                     "", Phi->getNextNode());

                    PhiLens[Len] = IncEdges;
                    LM[Phi] = Len;
                    Cached = true;
                    break;
                }

                // TODO: is there any better approach for this backward step?
                for (auto &Op :
                     llvm::cast<llvm::Instruction>(Ptr)->operands()) {
                    auto OpTy = Op->getType();
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
            else if (auto GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(Ptr)) {
                auto ArrTy =
                    llvm::cast<llvm::ArrayType>(GEP->getPointerOperandType());
                auto NumElems = ArrTy->getNumElements();

                while ((ArrTy = dynCastNestedArrType(ArrTy)))
                    NumElems *= ArrTy->getNumElements();

                Len = llvm::ConstantInt::get(Int64Ty, NumElems);
            }

            // Okay, not a GEP. Perhaps an alloca?
            else if (auto Alloca = llvm::dyn_cast<llvm::AllocaInst>(Ptr)) {
                auto ArrTy =
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
                auto Call = llvm::cast<llvm::CallInst>(Ptr);
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

/// Takes a function \p F  and traverses the dominance tree of F marking
/// values as tainted, according to a configuration \p Config.
static llvm::DenseSet<llvm::Value *>
taint(llvm::Function &F, config::Func &Config,
      llvm::SmallDenseMap<size_t, size_t, 8> &ArgIdx,
      llvm::FunctionAnalysisManager &FAM) {

    llvm::DenseSet<llvm::Value *> Tainted;
    auto &DT = FAM.getResult<llvm::DominatorTreeAnalysis>(F);

    std::stack<llvm::BasicBlock *> S;
    S.push(DT.getRoot());

    // We initially mark the arguments from Config as tainted.
    for (auto [ArgName, OldIdx] : Config)
        Tainted.insert(F.getArg(ArgIdx[OldIdx]));

    // Check if an operand is tainted or not.
    auto IsOpTainted = [&Tainted](auto &Op) {
        return Tainted.contains(llvm::cast<llvm::Value>(Op));
    };

    // Traverse the dominance tree in a DFS-like manner, propagating taint
    // information. We only consider data dependence.
    while (!S.empty()) {
        auto BB = S.top();
        S.pop();

        for (auto &V : *BB) {
            if (std::any_of(V.op_begin(), V.op_end(), IsOpTainted))
                Tainted.insert(&V);
        }

        // Push every child of BB in the dominance tree to the stack S.
        for (auto Child : DT.getNode(BB)->children()) S.push(Child->getBlock());
    }

    return Tainted;
}

llvm::Value *lif::ctsel(llvm::Value *Cond, llvm::Value *VTrue,
                        llvm::Value *VFalse, llvm::Instruction *Before) {
    return llvm::SelectInst::Create(Cond, VTrue, VFalse, "", Before);
}

llvm::Value *lif::rewriteGEP(llvm::GetElementPtrInst *GEP,
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
    auto PtrOpTy = llvm::cast<llvm::PointerType>(GEP->getPointerOperandType())
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
            auto Op = llvm::cast<llvm::ConstantInt>(GEP->getOperand(OpIdx));
            PtrOpTy = llvm::cast<llvm::StructType>(PtrOpTy)->getElementType(
                Op->getSExtValue());
        }
    }

    auto Idx = GEP->getOperand(OpIdx);
    auto ArrIdxMult = 1;

    auto MatchType = [Before](llvm::Value *&A, llvm::Value *&B) {
        auto ATy = A->getType();
        auto BTy = B->getType();
        int ANumBits = ATy->getScalarSizeInBits();
        int BNumBits = BTy->getScalarSizeInBits();
        if (ANumBits < BNumBits)
            A = new llvm::SExtInst(A, BTy, "", Before);
        else if (BNumBits < ANumBits)
            B = new llvm::SExtInst(B, ATy, "", Before);
    };

    if (llvm::isa<llvm::ArrayType>(PtrOpTy)) {
        auto ArrIdx = GEP->getOperand(OpIdx);
        auto ArrIdxTy = ArrIdx->getType();
        MatchType(ArrIdx, Idx);
        Idx = llvm::BinaryOperator::CreateMul(
            ArrIdx, llvm::ConstantInt::get(ArrIdxTy, ArrIdxMult), "", Before);

        while (OpIdx < GEP->getNumIndices()) {
            ArrIdxMult *= 2;
            OpIdx++;
            auto ArrIdx = GEP->getOperand(OpIdx);
            auto ArrIdxTy = ArrIdx->getType();
            MatchType(ArrIdx, Idx);
            ArrIdx = llvm::BinaryOperator::CreateMul(
                ArrIdx, llvm::ConstantInt::get(ArrIdxTy, ArrIdxMult), "",
                Before);
            MatchType(ArrIdx, Idx);
            Idx = llvm::BinaryOperator::CreateAdd(Idx, ArrIdx, "", Before);
        }
    }

    MatchType(Idx, PtrLen);
    auto IsSafe = llvm::ICmpInst::Create(llvm::Instruction::ICmp,
                                         llvm::ICmpInst::ICMP_SLT, Idx, PtrLen,
                                         "", Before);

    // Check if (i) the incoming condition is true OR (ii) the access to the
    // original array at Idx is safe. If (i), we execute the original
    // instruction as it is. If (ii), we also execute the original
    // instruction as it is because we know the access is inbounds.
    // Otherwise, we access a shadow memory.
    auto NewPtr = ctsel(
        llvm::BinaryOperator::CreateOr(Cond, IsSafe, "safe.", Before), GEP,
        new llvm::BitCastInst(Shadow, GEP->getType(), "", Before), Before);

    NewPtr->setName("select.ptr.");
    return NewPtr;
}

void lif::rewriteLoad(llvm::LoadInst &Load, llvm::AllocaInst *Shadow,
                      llvm::Value *PtrLen, llvm::Value *Cond) {
    // The pointer operand may be a GEP in the form of a ConstantExpr. In
    // this case, we transform it into a GEP instruction so we can handle
    // easier.
    auto PtrOp = Load.getPointerOperand();
    if (auto ConstExpr = llvm::dyn_cast<llvm::ConstantExpr>(PtrOp)) {
        auto GEP =
            llvm::cast<llvm::GetElementPtrInst>(ConstExpr->getAsInstruction());
        GEP->insertBefore(&Load);
        Load.setOperand(Load.getPointerOperandIndex(), GEP);
    }
    // If the pointer operand is a GEP we need to transform it in order to
    // ensure the safety of the memory access.
    PtrOp = Load.getPointerOperand();
    if (auto GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(PtrOp))
        Load.setOperand(Load.getPointerOperandIndex(),
                        rewriteGEP(GEP, Shadow, PtrLen, Cond, &Load));
}

void lif::rewriteStore(llvm::StoreInst &Store, llvm::AllocaInst *Shadow,
                       llvm::Value *PtrLen, llvm::Value *Cond) {
    // Let addr' be either the original addr accessed by Store or the addr
    // got after transforming a GEP inst. Let val' be either val or
    // Load(addr'), according to the incoming conditions. Replace Store(val,
    // addr) by Store(val', addr').
    auto StoreVal = Store.getValueOperand();
    auto StorePtr = Store.getPointerOperand();

    // If the Ptr operand is a GEP instruction, then we need to transform it
    // in in order to ensure the safety of the memory access. If not, this
    // load does not need to be transformed.  We fold the incoming
    // conditions from InV into a single value by applying the operator |
    // (or) to get the condition.
    if (auto GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(StorePtr))
        Store.setOperand(Store.getPointerOperandIndex(),
                         rewriteGEP(GEP, Shadow, PtrLen, Cond, &Store));

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

/// Takes a basic block \p BB and check if it is tainted. A basic block is
/// tainted if its terminator is tainted (and for that its terminator must be
/// some kind of conditional branch).
///
/// \returns bool
static inline bool isBBlockTainted(llvm::BasicBlock *BB,
                                   llvm::DenseSet<llvm::Value *> &Tainted) {
    return Tainted.contains(BB->getTerminator());
}

/// Takes a set of tainted instructions and return the corresponding tainted
/// basic blocks.
///
/// \returns a list of the tainted basic blocks, which might be empty.
static std::vector<llvm::BasicBlock *>
taintedBBlocks(llvm::DenseSet<llvm::Value *> &Tainted) {
    std::set<llvm::BasicBlock *> BBTainted;

    for (auto V : Tainted) {
        // We use tainted arguments to taint instructions, but we don't need
        // them here.
        if (llvm::isa<llvm::Argument>(V)) continue;

        auto I = llvm::cast<llvm::Instruction>(V);
        auto BB = I->getParent();
        if (isBBlockTainted(BB, Tainted)) BBTainted.insert(BB);
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
static void applyRewriteRules(FuncWrapper *FW,
                              llvm::FunctionAnalysisManager &FAM) {
    // Get the length associated with each pointer (either local or argument).
    auto LM = computeLength(FW->F,
                            &FAM.getResult<llvm::TargetLibraryAnalysis>(FW->F));

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
            bool isBBTainted = isBBlockTainted(BB, FW->Tainted);

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

                if (auto Load = llvm::dyn_cast<llvm::LoadInst>(&I)) {
                    auto PtrLen = LM[Load->getPointerOperand()];
                    rewriteLoad(*Load, Shadow, PtrLen, OutVal);
                } else if (auto Store = llvm::dyn_cast<llvm::StoreInst>(&I)) {
                    auto PtrLen = LM[Store->getPointerOperand()];
                    rewriteStore(*Store, Shadow, PtrLen, OutVal);
                }
            }
        }
    }
}

static void rewriteTerminator(lif::CCFG::Node &N,
                              lif::CCFG::EdgeReplacementMap &NewCCFG) {
    assert(std::holds_alternative<lif::CCFG::BasicBlockNode *>(N) &&
           "rewriteTerminator should only be applied to BB nodes!");

    auto Succs = std::visit([](auto &&N) { return N->Succs; }, N);
    auto BB = std::get<lif::CCFG::BasicBlockNode *>(N)->BB;
    auto T = BB->getTerminator();

    // If the node is tainted, we need to replace the terminator with an
    // unconditional jump.
    if (std::visit([](auto &&N) { return N->IsTainted; }, N)) {
        assert(Succs.size() == 1 && "error: tainted node was not linearized!");
        auto NewSucc = CCFG::extractBB(Succs[0]);
        llvm::ReplaceInstWithInst(T, llvm::BranchInst::Create(NewSucc));
    }

    // Otherwise, we still might need to replace some of BB's edges, due to the
    // linearization.
    else {
        llvm::SmallDenseSet<std::pair<llvm::BasicBlock *, llvm::BasicBlock *>,
                            4>
            OldToNew;

        for (auto It : NewCCFG[N]) {
            auto OldSucc = It.first, NewSucc = It.second;
            auto OldSuccBB = CCFG::extractBB(OldSucc);
            auto NewSuccBB = CCFG::extractBB(NewSucc);
            OldToNew.insert({OldSuccBB, NewSuccBB});
        }

        // TODO: It would probably be more efficient to check if the block is a
        // loop exiting. Consider that in upcoming refactorings.
        if (auto P = std::visit([](auto &&N) { return N->Parent; }, N)) {
            for (auto It : NewCCFG[P]) {
                auto OldSucc = It.first, NewSucc = It.second;
                auto OldSuccBB = CCFG::extractBB(OldSucc);
                auto NewSuccBB = CCFG::extractBB(NewSucc);
                OldToNew.insert({OldSuccBB, NewSuccBB});
            }
        }

        for (auto [OldSucc, NewSucc] : OldToNew)
            T->replaceSuccessorWith(OldSucc, NewSucc);
    }
}

/// Traverses the linearized CCFG, using its edges to rewrite (i.e. linearized)
/// the corresponding CFG.
static void rewriteCFG(lif::CCFG *G, lif::CCFG::EdgeReplacementMap &NewCCFG,
                       lif::CCFG::LoopNode *L = nullptr) {
    std::stack<lif::CCFG::Node> S;
    std::set<lif::CCFG::Node> Visited;

    S.push(*G->Root);
    while (!S.empty()) {
        auto M = S.top();
        S.pop();

        // If it is a LoopNode, open it.
        if (std::holds_alternative<lif::CCFG::LoopNode *>(M)) {
            auto L = std::get<lif::CCFG::LoopNode *>(M);
            rewriteCFG(L->G.get(), NewCCFG, L);
        }
        // Else, rewrite its terminator.
        else {
            rewriteTerminator(M, NewCCFG);
        }

        Visited.insert(M);
        auto Succs = std::visit([](auto &&M) { return M->Succs; }, M);

        for (auto Succ : Succs)
            if (!Visited.count(Succ)) S.push(Succ);
    }
}

void lif::rewritePhis(FuncWrapper *FW, llvm::FunctionAnalysisManager &FAM) {
    // We construct a structure Dphi mapping a phi function to a set of
    // pairs (Old Block, New Block, Value), where New Block is a new incoming
    // block (after linearization) for that phi function and Value is a new
    // incoming value.  Notice that Value might be the same as before
    // linearization, but might as well be, for instance, a combination of
    // ctsels merging multiple old incoming values. We then use Dphi as a guide
    // to rewrite all phi functions.
    using DPhiInfo = std::tuple<
        // Old Incoming Block
        llvm::BasicBlock *,
        // New incoming block
        llvm::BasicBlock *,
        // New incoming value
        llvm::Value *>;

    llvm::DenseMap<llvm::PHINode *, llvm::SmallVector<DPhiInfo, 4>> DPhi;
    llvm::DenseMap<llvm::BasicBlock *, llvm::SmallPtrSet<llvm::BasicBlock *, 4>>
        R;

    // Is 'A' reachable from 'B'? We compute this incrementally.
    auto isReachableFrom = [&R](auto A, auto B) {
        if (A == B) {
            R[A].insert(B);
            return true;
        }

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

            if (R[A].contains(C)) return true;
            for (auto D : llvm::successors(C)) {
                R[D].insert(C);
                if (!Visited.contains(D)) S.push(D);
            }
        }

        return false;
    };

    auto &DT = FAM.getResult<llvm::DominatorTreeAnalysis>(FW->F);
    llvm::DenseMap<
        // Phi function added to compute -- possibly undef -- incoming value.
        llvm::PHINode *,
        // Insertion point for the phi function.
        llvm::Instruction *>
        Unlinked;

    for (auto &BB : FW->F) {
        unsigned PredSize = llvm::pred_size(&BB);
        auto InsertionPointNext = BB.getTerminator();
        auto InsertionPoint = InsertionPointNext->getPrevNode();

        for (auto Succ : llvm::successors(&BB)) {
            for (auto &Phi : Succ->phis()) {
                // If (BB, Succ) is a backedge, we  use its original incoming
                // value, since we assume backedges to be unique and,
                // consequently, the information flowing from a backedge to a
                // phi function shall not be altered.
                if (DT.dominates(Succ, &BB)) {
                    DPhi[&Phi].push_back(
                        {&BB, &BB, Phi.getIncomingValueForBlock(&BB)});
                    continue;
                }

                for (auto &U : Phi.incoming_values()) {
                    auto From = Phi.getIncomingBlock(U);
                    auto Val = U.get();

                    // If (From, Succ) is a backedge, we ignore it, for
                    // we're certainly visiting a forward edge to a loop header
                    // and it doesn't make sense to include backedge info.
                    if (DT.dominates(Succ, From)) continue;

                    // If Val is a constant or From (old incoming block)
                    // dominates BB (new incoming block), we can just use Val as
                    // it is.
                    if (llvm::isa<llvm::Constant>(Val) ||
                        DT.dominates(From, &BB)) {

                        DPhi[&Phi].push_back({From, &BB, Val});
                        continue;
                    }

                    // Otherwise, we create a phi function for Val.
                    auto ValTy = Val->getType();
                    auto MaybeUndef =
                        llvm::PHINode::Create(ValTy, PredSize, "val.phi");

                    for (auto Pred : llvm::predecessors(&BB)) {
                        MaybeUndef->addIncoming(
                            isReachableFrom(Pred, From)
                                ? Val
                                : llvm::UndefValue::get(ValTy),
                            Pred);
                    }

                    DPhi[&Phi].push_back({From, &BB, Val});
                    Unlinked[MaybeUndef] = InsertionPoint;
                }
            }
        }
    }

    for (auto [Phi, InsertionPoint] : Unlinked)
        Phi->insertBefore(InsertionPoint);

    // For every loop-exit predicate, we have created a corresponding phi
    // function at the loop header. Since at this point we have already
    // linearized the CFG, it may be that the predicate doesn't dominate all its
    // uses anymore (we may have been using it to compute path conditions). In
    // such cases, we replace its use with its corresponding phi function.
    for (auto [LoopExitPred, Phi] : FW->LW->ExitPredPhi) {
        LoopExitPred->replaceUsesWithIf(Phi, [&DT](llvm::Use &U) {
            auto User = llvm::cast<llvm::Instruction>(U.getUser());
            return !DT.dominates(U.get(), User);
        });
    }

    for (auto [Phi, IncList] : DPhi) {
        auto BB = Phi->getParent();
        auto NumPred = llvm::pred_size(BB);
        auto NewPhi = llvm::PHINode::Create(
            Phi->getType(), NumPred,
            (Phi->hasName() ? Phi->getName() : "phi") + ".rewritten", Phi);

        size_t Idx = 0;
        for (; Idx < NumPred; Idx++) {
            auto [_, FromNew, Val] = IncList[Idx];
            NewPhi->addIncoming(Val, FromNew);
        }

        llvm::Value *PhiFold = NewPhi;
        auto NumInc = IncList.size();

        for (; Idx < NumInc; Idx++) {
            auto [FromOld, _, Val] = IncList[Idx];
            auto Cond = FW->IM[BB][FromOld];

            assert(Cond &&
                   "error: missing incoming condition for phi rewrite!");

            PhiFold = llvm::SelectInst::Create(Cond, Val, PhiFold, "phi.fold",
                                               BB->getTerminator());
        }

        Phi->replaceAllUsesWith(PhiFold);
        Phi->eraseFromParent();
    }
}

void lif::rewriteFunc(FuncWrapper *FW, llvm::FunctionAnalysisManager &FAM) {
    auto G = CCFG::make(FW->F, FW->Tainted, FW->LW->LI);
    auto NewCCFG = G.plinearize(FAM, FW->LW->LI);

    // Step 1: apply the transformation rules to the load, stores and definition
    // of loop-exiting predicates, to ensure the correctness of the produced
    // code.
    applyRewriteRules(FW, FAM);

    // Step 2: Partial linearization of the CFG.
    rewriteCFG(&G, NewCCFG);
    FAM.invalidate(FW->F, {});

    // Step 3: Since we have (partially) linearized the CFG, we need to adjust
    // the old phi functions.
    rewritePhis(FW, FAM);
}

FuncWrapper lif::wrapFunc(llvm::Function &F, config::Func &Config,
                          bool IsDerived,
                          llvm::SmallDenseMap<size_t, size_t, 8> &ArgIdx,
                          llvm::FunctionAnalysisManager &FAM) {
    FuncWrapper FW(F, IsDerived);

    // Taint values according to the observable inputs from the config file.
    FW.Tainted = taint(F, Config, ArgIdx, FAM);

    // Prepare loops by inserting phi-functions at loop headers for every
    // predicate that branch out the loop.
    auto &LI = FAM.getResult<llvm::LoopAnalysis>(F);
    auto LW = prepare(LI, F.getContext());
    FW.LW = std::make_unique<LoopWrapper>(LW);

    // Bind the outgoing and incoming conditions to all basic blocks.
    FW.OM = allocOut(F, LW, FW.Tainted);
    auto [IM, MemInsts] = bindAll(F, FW.OM, LW, FW.Tainted);
    FW.IM = IM;

    // Fill Skip with the Load/Stores generated after binding the conditions
    // to each basic block, since we don't need to modify them.
    for (auto I : MemInsts) FW.Skip.insert(I);

    return FW;
}

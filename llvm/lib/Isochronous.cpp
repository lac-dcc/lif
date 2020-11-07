//===-- Isochronous.cpp ---------------------------------------------------===//
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
/// This file contains the implementation of the Isochronous Pass, a function
/// pass that transforms a function F into a version that is isochronous. This
/// pass expects each pointer argument of F to be followed by an integer
/// argument representing its length.
///
//===----------------------------------------------------------------------===//

#include "Isochronous.h"
#include "Cond.h"
#include "Loop.h"

#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/PostOrderIterator.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/CFG.h>
#include <llvm/Analysis/LoopInfo.h>
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
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>
#include <numeric>
#include <set>

using namespace llvm;
using namespace cond;

namespace isochronous {
PreservedAnalyses Pass::run(Module &M, ModuleAnalysisManager &MAM) {
    llvm::SmallVector<Function *, 32> Fns;
    for (auto &F : M)
        if (Names.find(F.getName()) != Names.end()) Fns.push_back(&F);

    auto &FAM =
        MAM.getResult<FunctionAnalysisManagerModuleProxy>(M).getManager();

    auto Derived = findDerived(M, std::set(Fns.begin(), Fns.end()));

    // We transform every function selected by the user plus the derived ones.
    // If no function was selected, we consider all functions from M as
    // derived, as long as they are used by some other function, and thus all
    // functions shall be transformed. We need to filter functions that we don't
    // have access to the definition.
    if (Names.empty())
        for (Function &F : M)
            if (!F.use_empty() && !F.isDeclaration()) Derived.insert(&F);

    auto Wrap = [&FAM](Function *F, bool IsDerived) -> FuncWrapper * {
        // Transform multiple return points into a unique exit block.
        unifyExits(*F);

        // Prepare loops by inserting phi-functions at loop headers for every
        // predicate that branch out the loop.
        auto &LI = FAM.getResult<LoopAnalysis>(*F);
        auto &LW = loop::prepare(LI, F->getContext());

        // Bind the outgoing and incoming conditions to all basic blocks.
        auto OutM = allocOut(*F);
        auto [InM, GenV] = bind(*F, OutM, LW);

        // Fill SkipS with the instructions generated after binding the
        // conditions to each basic block, since we don't need to modify them.
        std::set<Value *> Skip;
        for (auto V : GenV) Skip.insert(V);

        return new FuncWrapper{F, IsDerived, OutM, InM, Skip, LW};
    };

    // We cannot modify external functions (i.e. functions that we don't have
    // access to their definition), so we just emit a warning.
    auto WarnExternal = [](const Function &F) {
        errs() << "Warning: cannot handle external function " << F.getName()
               << "!\n";
    };

    // We curently cannot handle functions with loops/cycles, so we skip them
    // and throw an error.
    // auto ErrCycles = [](const Function &F) {
    //     errs() << "Error: unexpected cycle(s) on function \"" << F.getName()
    //            << "\" (possible fix: run 'opt -mem2reg -loop-rotate "
    //               "-loop-unroll -unroll-count=N')\n";
    // };

    // We mark all functions from the derived set as "Derived".
    llvm::SmallVector<FuncWrapper *, 32> Wrapped;
    for (auto F : Derived) {
        // SmallVector<std::pair<const BasicBlock *, const BasicBlock *>, 32>
        //     Result;
        // FindFunctionBackedges(*F, Result);

        // TODO: Check for loop properties.
        // if (!Result.empty())
        //     ErrCycles(*F);
        if (F->isDeclaration())
            WarnExternal(*F);
        else
            Wrapped.push_back(Wrap(F, true));
    }

    // Then, we insert the functions selected by the user as not derived (unless
    // it was already marked as derived).
    for (auto F : Fns) {
        // SmallVector<std::pair<const BasicBlock *, const BasicBlock *>, 32>
        //     Result;
        // FindFunctionBackedges(*F, Result);

        // TODO: Check for loop properties.
        // if (!Result.empty())
        //     ErrCycles(*F);
        if (F->isDeclaration())
            WarnExternal(*F);
        else if (Derived.find(F) == Derived.end()) {
            Wrapped.push_back(Wrap(F, false));
        }
    }

    prepareModule(M, Wrapped, FAM);
    for (auto FW : Wrapped) transformFunc(*FW, FAM);

    return PreservedAnalyses::none();
}

std::set<Function *> findDerived(Module &M, const std::set<Function *> Fns) {
    std::set<Function *> Derived;

    // Search for the derived functions, i.e. functions called by the ones that
    // initially should be transformed.
    std::stack<Function *> S;
    auto PushCalls = [&](Function &F) {
        for (auto &BB : F)
            for (auto &I : BB) {
                auto Call = dyn_cast<CallInst>(&I);
                if (!Call) continue;

                auto G = Call->getCalledFunction();
                if (Derived.find(G) == Derived.end()) S.push(G);
            }
    };

    // Initialize the stack with the functions called by the ones that should
    // be transformed.
    for (auto F : Fns) PushCalls(*F);

    // For each function F in the stack S, insert F in the derived list and
    // push all functions called by F to the stack.
    while (!S.empty()) {
        auto G = S.top();
        S.pop();
        Derived.insert(G);
        PushCalls(*G);
    }

    return Derived;
}

// FIXME: Compute length of arrays inside structs.
DenseMap<const Value *, Value *> computeLength(Function &F,
                                               const TargetLibraryInfo *TLI) {
    DenseMap<const Value *, Value *> LenM;
    auto DL = F.getParent()->getDataLayout();
    auto Int64Ty = IntegerType::getInt64Ty(F.getContext());

    // Helper function to early propagate the length to users of arguments or
    // globals.
    auto Propagate = [&](Value *V) {
        for (auto U : V->users())
            if (isa<PointerType>(U->getType())) LenM[U] = LenM[V];
    };

    // We first compute the length of the pointer arguments. This is quite
    // simple, since we require each pointer to be immediately followed by its
    // length. TODO: get the length from annotations.
    for (auto Iter = F.arg_begin(); Iter != F.arg_end(); ++Iter) {
        auto V = &*Iter;
        if (!isa<PointerType>(V->getType())) continue;

        auto Len = &*(Iter + 1);
        assert(isa<IntegerType>(Len->getType()) &&
               "pointer argument must be followed by its length!");

        LenM[V] = Len;
        Propagate(V);
    }

    // Then we compute the length of all global values.
    for (Value &Global : F.getParent()->globals()) {
        if (LenM.find(&Global) != LenM.end()) continue;

        auto PtrTy = dyn_cast<PointerType>(Global.getType());
        if (!PtrTy) continue;

        auto Len = ConstantInt::get(Int64Ty, 1);
        auto ArrTy = dyn_cast<ArrayType>(PtrTy->getElementType());

        if (ArrTy) {
            auto NumElems = ArrTy->getNumElements();
            while ((ArrTy = dyn_cast<ArrayType>(ArrTy->getElementType())))
                NumElems *= ArrTy->getNumElements();
            Len = ConstantInt::get(Int64Ty, NumElems);
        }

        LenM[&Global] = Len;
        Propagate(&Global);
    }

    // For phis, we create a phi to select between the length of the pointers.
    // We leave the incoming values (the lengths) as whole to be filled after
    // we've computed the length of the other values.
    DenseMap<PHINode *, SmallVector<std::pair<BasicBlock *, Value *>, 8>> PhiM;

    // Now we compute the length of the pointers used inside the F's body.
    for (BasicBlock &BB : F) {
        for (Instruction &I : BB) {
            // We only care for pointers...
            auto PtrTy = I.getType();
            if (!isa<PointerType>(PtrTy)) continue;

            // We already computed the length of this guy, so just move on.
            if (LenM.find(&I) != LenM.end()) continue;

            // If it is not a alloca inst, malloc, a global array or an
            // argument ptr, we need to move back until we reach the base
            // instruction. However, we may be lucky if we reach a GEP
            // instruction in which we can extract the array type.
            Value *Ptr = &I;
            std::stack<Value *> Ptrs;
            Ptrs.push(Ptr);

            // Arguments and globals are always be cached, since we compute
            // their lengths before moving to the body of the function.
            bool Cached = false;
            DenseSet<Value *> Skip;

            while (!(Cached || isa<AllocaInst>(Ptr) ||
                     ((isa<Argument>(Ptr) || isa<GlobalValue>(Ptr)) &&
                      isa<PointerType>(PtrTy)) ||
                     (isa<CallInst>(Ptr) && isAllocationFn(Ptr, TLI)))) {
                // We already computed this? So no need to go ahead.
                if (LenM.find(Ptr) != LenM.end()) {
                    Cached = true;
                    break;
                };

                // Is this a GEP? If so, is it pointing to an array? Yes? Cool!
                auto GEP = dyn_cast<GetElementPtrInst>(Ptr);
                if (GEP && isa<ArrayType>(GEP->getPointerOperandType())) break;

                // Is this is a phi node? If so, we create a second phi node to
                // select between the length of the pointers.
                auto Phi = dyn_cast<PHINode>(Ptr);
                if (Phi && isa<PointerType>(Phi->getType())) {
                    SmallVector<std::pair<BasicBlock *, Value *>, 8> Incs;
                    SmallVector<BasicBlock *, 4> Cycles;

                    for (auto BB : Phi->blocks()) {
                        // Ignore cycles!
                        if (BB == Phi->getParent()) {
                            Cycles.push_back(BB);
                            continue;
                        }

                        auto V = Phi->getIncomingValueForBlock((BB));
                        Incs.push_back({BB, V});
                    }

                    // In case we have cycles, i.e. |Incs| < number of
                    // predecessors, we fill the remaining wholes by repeating
                    // previous values. Does this make sense??
                    auto V = Incs.back().second;
                    for (auto BB : Cycles) Incs.push_back({BB, V});

                    auto PhiLen = PHINode::Create(Int64Ty, Incs.size(), "",
                                                  Phi->getNextNode());

                    PhiM[PhiLen] = Incs;
                    LenM[Phi] = PhiLen;
                    Cached = true;
                    break;
                }

                // TODO: is there any better approach for this backward step?
                for (Use &Op : cast<Instruction>(Ptr)->operands()) {
                    auto OpTy = Op->getType();
                    if (isa<PointerType>(OpTy)) {
                        Ptr = Op, PtrTy = OpTy;
                        Ptrs.push(Ptr);
                        Cached = LenM.find(Ptr) != LenM.end();
                        break;
                    }
                }
            }

            Value *Len;
            // Hell yeah! No need to compute again!
            if (Cached) Len = LenM[Ptr];

            // We're lucky! It is a GEP and the type is an array.
            else if (auto GEP = dyn_cast<GetElementPtrInst>(Ptr)) {
                auto ArrTy = cast<ArrayType>(GEP->getPointerOperandType());
                auto NumElems = ArrTy->getNumElements();
                while ((ArrTy = dyn_cast<ArrayType>(ArrTy->getElementType())))
                    NumElems *= ArrTy->getNumElements();
                Len = ConstantInt::get(Int64Ty, NumElems);
            }

            // Okay, not a GEP. Perhaps an alloca?
            else if (auto Alloca = dyn_cast<AllocaInst>(Ptr)) {
                auto ArrTy = dyn_cast<ArrayType>(Alloca->getAllocatedType());
                if (ArrTy && !Alloca->isArrayAllocation()) {
                    auto NumElems = ArrTy->getNumElements();
                    while (
                        (ArrTy = dyn_cast<ArrayType>(ArrTy->getElementType())))
                        NumElems *= ArrTy->getNumElements();
                    Len = ConstantInt::get(Int64Ty, NumElems);
                } else {
                    Len = Alloca->getArraySize();
                }
            }

            // Nothing yet... so it has to be a malloc call!
            else {
                auto Call = cast<CallInst>(Ptr);
                Len = getMallocArraySize(Call, DL, TLI);
            }

            while (!Ptrs.empty()) {
                LenM[Ptrs.top()] = Len;
                Ptrs.pop();
            }
        }
    }

    // Finally, we fill the gaps of the phi nodes that we've created.
    for (auto [Phi, IncV] : PhiM)
        for (auto [BB, V] : IncV) Phi->addIncoming(LenM[V], BB);

    return LenM;
}

void prepareModule(Module &M, SmallVectorImpl<FuncWrapper *> &Fns,
                   FunctionAnalysisManager &FAM) {
    // Map from a pointer to a function to its index on FV.
    DenseMap<Function *, size_t> TransformIdx;

    size_t Idx = 0;
    for (auto Iter = Fns.begin(); Iter != Fns.end(); ++Iter)
        TransformIdx[(*Iter)->F] = Idx++;

    auto GetTLI = [&FAM](Function &F) {
        return &FAM.getResult<TargetLibraryAnalysis>(F);
    };

    llvm::SmallVector<Function *, 16> Modified;
    DenseMap<Function *, DenseMap<const llvm::Value *, Value *>> FLenM;
    DenseMap<Function *, Function *> Replace;

    LLVMContext &Ctx = M.getContext();

    // We modify all functions from M, not only the ones that will be
    // transformed to isochronous, because we need the length arguments to
    // "computeLength" work.
    for (Function &F : M) {
        if (F.isDeclaration()) continue;

        SmallVector<Type *, 16> ArgTypes;
        SmallVector<Twine, 16> ArgNames;

        // Keep track of the indices of each old argument.
        DenseMap<Argument *, size_t> ArgIdx;
        size_t Idx = 0;
        unsigned NumPtrArgs = 0;

        // Start by collecting the argument types as well as the names.
        for (Argument &Arg : F.args()) {
            ArgTypes.push_back(Arg.getType());
            ArgNames.push_back(Arg.getName());
            ArgIdx[&Arg] = Idx;

            // If Arg is a pointer, we add a new int64 argument.
            if (isa<PointerType>(Arg.getType())) {
                ArgTypes.push_back(IntegerType::getInt64Ty(Ctx));
                ArgNames.push_back("N" + Arg.getName());
                Idx++;
                NumPtrArgs++;
            }

            Idx++;
        }

        auto IdxIter = TransformIdx.find(&F);
        bool IsDerived = false;

        if (IdxIter != TransformIdx.end())
            IsDerived = Fns[IdxIter->second]->IsDerived;

        // If there are any ptr argument we modify F signature by inserting
        // args carrying the length of each ptr arg. We also modify the
        // function if it is marked as derived. Else, we just move to the next
        // func.
        if (NumPtrArgs == 0 && !IsDerived) {
            FLenM[&F] = computeLength(F, GetTLI(F));
            continue;
        }

        if (IsDerived) {
            ArgTypes.push_back(IntegerType::getInt1Ty(Ctx));
            ArgNames.push_back(".cond");
        }

        Modified.push_back(&F);
        auto FTy = F.getFunctionType();
        auto NewFTy =
            FunctionType::get(F.getReturnType(), ArgTypes, FTy->isVarArg());
        auto NewF =
            Function::Create(NewFTy, F.getLinkage(), F.getAddressSpace());
        M.getFunctionList().insert(F.getIterator(), NewF);
        NewF->copyAttributesFrom(&F);
        NewF->takeName(&F);

        // Set the new function's argument's names.
        for (size_t i = 0; i < NewF->arg_size(); i++)
            (NewF->arg_begin() + i)->setName(ArgNames[i]);

        // Replace all uses of each old arg.
        for (Argument &Arg : F.args())
            Arg.replaceAllUsesWith(NewF->arg_begin() + ArgIdx[&Arg]);

        // Patch the pointer to LLVM function in debug info descriptor.
        NewF->setSubprogram(F.getSubprogram());
        F.setSubprogram(nullptr);

        // Move over the function body to the new function.
        NewF->getBasicBlockList().splice(NewF->begin(), F.getBasicBlockList());

        // If is a derived function we need to set an incoming condition for
        // the entry block. So, we create a new entry block with an outgoing
        // condition = the boolean argument and jmp to the old entry block.
        if (IsDerived) {
            BasicBlock &Entry = NewF->getEntryBlock();
            auto NewEntry = BasicBlock::Create(Ctx, "", NewF, &Entry);
            BranchInst::Create(&Entry, NewEntry);

            auto Cond = NewF->getArg(ArgTypes.size() - 1);
            auto FW = Fns[IdxIter->second];

            // Set the incoming and the outgoing cond. of the old entry block
            // (the outgoing we only need to set if there are other blocks
            // followed by the old entry).
            FW->InM[&Entry] = SmallVector<Incoming, 1>({{Cond, NewEntry}});
            auto Out = FW->OutM[&Entry];
            auto I = *std::next(Out->user_begin(), Out->getNumUses() - 1);
            cast<StoreInst>(I)->setOperand(0, Cond);
        }

        Replace[&F] = NewF;
        FLenM[NewF] = computeLength(*NewF, GetTLI(*NewF));

        // Update the pointer to F to point to the new function we just create.
        if (IdxIter != TransformIdx.end()) {
            TransformIdx[NewF] = IdxIter->second;
            auto FW = Fns[IdxIter->second];
            auto &LI = FAM.getResult<LoopAnalysis>(*FW->F);
            auto &LW = loop::recover(LI, Ctx);
            Fns[IdxIter->second] = new FuncWrapper{
                NewF, FW->IsDerived, FW->OutM, FW->InM, FW->Skip, LW};
        }
    }

    // Check for calls to the modified functions and replace them by a new call
    // passing the length of each ptr arg.
    for (auto F : Modified) {
        while (!F->use_empty()) {
            auto NewF = Replace[F];
            auto U = F->user_back();
            CallSite CS(U);

            // If CS is not a call, then probably it is storing F's address so
            // it can be used as an indirect call somewhere. This is hard to
            // track and even hard to fix, so we currently does not support.
            // We just replace the use of F by NewF so we can move to the next
            // user.
            if (!CS.isCall()) {
                U->replaceUsesOfWith(F, NewF);
                errs() << "Warning: cannot handle possible indirect calls to "
                       << NewF->getName() << "!\n";
                continue;
            }

            assert(CS.getCalledFunction() == F);
            SmallVector<Value *, 16> Args;
            CallInst *Call = cast<CallInst>(CS.getInstruction());

            size_t Idx = 0;
            for (Use &Arg : CS.args()) {
                Args.push_back(Arg);
                Idx++;

                if (!isa<PointerType>(Arg->getType())) continue;

                auto Len = FLenM[CS.getCaller()][Arg];
                auto LenArgTy = (NewF->arg_begin() + Idx)->getType();

                if (Len->getType()->getScalarSizeInBits() <
                    LenArgTy->getScalarSizeInBits())
                    Len = new SExtInst(Len, LenArgTy, "", Call);

                Args.push_back(Len);
                Idx++;
            }

            // If F (NewF) is a derived function, we need to pass the incoming
            // condition of the current basic block as argument.
            auto IdxIter = TransformIdx.find(NewF);
            if (IdxIter != TransformIdx.end() &&
                Fns[IdxIter->second]->IsDerived) {
                // If the caller won't be transformed to invariant, this means
                // that it does not have any incoming condition defined, so we
                // just pass true.
                Value *C = ConstantInt::getTrue(NewF->getContext());
                IdxIter = TransformIdx.find(CS.getCaller());

                if (IdxIter != TransformIdx.end()) {
                    auto InV = Fns[IdxIter->second]->InM[Call->getParent()];
                    if (InV.size() > 0) C = cond::fold(InV);
                }

                Args.push_back(C);
            }

            auto NewCall = CallInst::Create(NewF, Args);
            NewCall->setCallingConv(NewF->getCallingConv());

            if (!Call->use_empty()) Call->replaceAllUsesWith(NewCall);

            ReplaceInstWithInst(Call, NewCall);
        }

        // Now we safely can remove this function from the current module.
        F->eraseFromParent();
    }
}

void unifyExits(Function &F) {
    SmallVector<ReturnInst *, 8> Returns;
    for (BasicBlock &BB : F)
        for (Instruction &I : BB)
            if (auto Ret = dyn_cast<ReturnInst>(&I)) Returns.push_back(Ret);

    if (Returns.size() == 1) return;

    // We create a new basic block for the unique return point and transform
    // all the other return points to uncond. branches.
    auto Ret = Returns[0];
    auto Exit = BasicBlock::Create(F.getContext(), "", &F, Ret->getParent());
    auto Phi =
        PHINode::Create(Ret->getReturnValue()->getType(), Returns.size(), "");

    for (auto Ret : Returns) {
        Phi->addIncoming(Ret->getReturnValue(), Ret->getParent());
        ReplaceInstWithInst(Ret, BranchInst::Create(Exit));
    }

    Exit->getInstList().insert(Exit->end(), Phi);
    Exit->getInstList().insert(Exit->end(),
                               ReturnInst::Create(F.getContext(), Phi));
}

void transformFunc(const FuncWrapper &W, FunctionAnalysisManager &FAM) {
    auto [F, _, OutM, InM, Skip, LW] = W;

    // Get the length associated with each pointer (either local or
    // argument).
    auto LenM = computeLength(*F, &FAM.getResult<TargetLibraryAnalysis>(*F));

    // Initialize Shadow memory as a pointer to an integer. We use
    // MaxPointerSize to ensure absence of overflow.
    auto Shadow = new AllocaInst(
        IntegerType::get(
            F->getContext(),
            F->getParent()->getDataLayout().getMaxPointerSizeInBits()),
        0, "shadow", F->getEntryBlock().getTerminator());

    auto LLEnd = LW.LLBlocks.end();
    for (BasicBlock &BB : *F) {
        // We need to collect every phi instruction and store in a separate
        // vector because phi transform. fn removes the phi instruction, so
        // we cannot do this in an iterator loop.
        SmallVector<PHINode *, 8> PhiV;
        auto InV = InM[&BB];
        auto Out = OutM[&BB];

        auto IsLH = LW.LI.isLoopHeader(&BB);
        auto IsLL = LW.LLBlocks.find(&BB) != LLEnd;

        for (Instruction &I : BB) {
            if (Skip.find(&I) != Skip.end() || InV.empty()) continue;
            if (auto Phi = dyn_cast<PHINode>(&I)) {
                if (!IsLH) PhiV.push_back(Phi);
                continue;
            }

            // If it is the definition of a predicate that may cause a branch
            // to outside the loop, we need to ensure that whenever its value
            // changes (considering the initial one), it will never change back
            // to the initial. Note that this does not apply to the LL block.
            if (!IsLL && LW.PredMap.find(cast<Value>(&I)) != LW.PredMap.end()) {
                auto [Phi, Init] = LW.PredMap.lookup(cast<Value>(&I));
                transformPredAssign(I, cast<PHINode>(*Phi), *Init);
                continue;
            }

            if (!isa<LoadInst>(&I) && !isa<StoreInst>(&I)) continue;

            // We create a load to get the value of the outgoing condition for
            // each load or store. There is probably a better way to do that,
            // but this is simpler.
            auto OutCond = new LoadInst(Out, "", &I);
            Skip.insert(OutCond);

            if (auto Load = dyn_cast<LoadInst>(&I)) {
                auto PtrLen = LenM[Load->getPointerOperand()];
                transformLoad(*Load, Shadow, PtrLen, OutCond);
            } else if (auto Store = dyn_cast<StoreInst>(&I)) {
                auto PtrLen = LenM[Store->getPointerOperand()];
                transformStore(*Store, Shadow, PtrLen, OutCond);
            }
        }

        for (auto Phi : PhiV) transformPhi(*Phi, InM[&BB]);
    }

    // We treat loop exiting blocks in a distinct way. Here, we are
    // considering every exiting block except for the loop condition. The
    // successor of these blocks will always be the basic block that is
    // inside the loop, not the one that is outside, regardless of the
    // topological ordering.
    for (auto LE : LW.ExitingBlocks) {
        // Skip loop latches, since they were already handled above.
        if (LW.LLBlocks.find(LE) != LLEnd) continue;

        auto LET = LE->getTerminator();
        BasicBlock *Inside = nullptr, *Outside = nullptr;

        for (auto Target : cast<BranchInst>(LET)->successors()) {
            if (LW.ExitBlocks.find(Target) == LW.ExitBlocks.end())
                Inside = Target;
            else
                Outside = Target;
        }

        // Outside may be a basic block created to eliminate critical edges. In
        // such case, it may become unreachable if we just ignore it. Thus, we
        // need to reconnect it to the CFG somehow. If that is the case, we
        // link LE to Outside and Outside to Inside.
        auto Target = Inside;
        if (pred_size(Outside) == 1) {
            auto OutsideT = cast<BranchInst>(Outside->getTerminator());
            OutsideT->setSuccessor(0, Inside);
            Target = Outside;
        }

        ReplaceInstWithInst(LET, BranchInst::Create(Target));
    }

    // Replace each terminator by an uncond. br linked to the next basic
    // block, following the reverse postorder.
    ReversePostOrderTraversal<Function *> RPOT(F);
    for (auto Iter = RPOT.begin(); Iter + 1 != RPOT.end(); ++Iter) {
        auto BB = *Iter;
        auto BBT = BB->getTerminator();

        // Do not mess with loop conditions.
        if (LW.LLBlocks.find(BB) != LW.LLBlocks.end()) continue;

        // We must not remove loop conditions, so just skip them.
        if (LW.LLBlocks.find(BB) == LLEnd)
            ReplaceInstWithInst(BBT, BranchInst::Create(*(Iter + 1)));
    }
}

void transformPhi(PHINode &Phi, const SmallVectorImpl<Incoming> &InV) {
    // No incoming condition, so there is nothing to do.
    if (InV.empty()) return;

    auto V0 = Phi.getIncomingValueForBlock(InV.front().From);
    auto Cond0 = InV.front().Cond;

    if (InV.size() > 1) {
        auto Before = cast<Instruction>(InV.back().Cond)->getNextNode();
        auto Iter1 = InV.end() - 1;

        auto V1 = Phi.getIncomingValueForBlock(Iter1->From);
        for (auto Iter2 = Iter1 - 1; Iter2 != InV.begin(); --Iter1, --Iter2)
            V1 = SelectInst::Create(Iter2->Cond,
                                    Phi.getIncomingValueForBlock(Iter2->From),
                                    V1, "", Before);

        V0 = SelectInst::Create(Cond0, V0, V1, "select.phi.", Before);
    }

    Phi.replaceAllUsesWith(V0);
    Phi.eraseFromParent();
}

void transformLoad(LoadInst &Load, AllocaInst *Shadow, Value *PtrLen,
                   Value *Cond) {
    // The pointer operand may be a GEP in the form of a ConstantExpr. In
    // this case, we transform it into a GEP instruction so we can handle
    // easier.
    if (auto ConstExpr = dyn_cast<ConstantExpr>(Load.getPointerOperand())) {
        auto GEP = cast<GetElementPtrInst>(ConstExpr->getAsInstruction());
        GEP->insertBefore(&Load);
        Load.setOperand(Load.getPointerOperandIndex(), GEP);
    }
    // If the pointer operand is a GEP we need to transform it in order to
    // ensure the safety of the memory access.
    if (auto GEP = dyn_cast<GetElementPtrInst>(Load.getPointerOperand()))
        Load.setOperand(Load.getPointerOperandIndex(),
                        transformGEP(GEP, Shadow, PtrLen, Cond, &Load));
}
void transformStore(StoreInst &Store, AllocaInst *Shadow, Value *PtrLen,
                    Value *Cond) {
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
    if (auto GEP = dyn_cast<GetElementPtrInst>(StorePtr))
        Store.setOperand(Store.getPointerOperandIndex(),
                         transformGEP(GEP, Shadow, PtrLen, Cond, &Store));

    auto Load = new LoadInst(StoreVal->getType(), StorePtr, "", &Store);
    auto SelectVal = ctsel(Cond, StoreVal, Load, &Store);
    SelectVal->setName("select.val.");
    Store.setOperand(0, SelectVal);
}

Value *transformGEP(GetElementPtrInst *GEP, AllocaInst *Shadow, Value *PtrLen,
                    Value *Cond, Instruction *Before) {
    // If GEP operand pointer is of an array type, it may be a
    // multidimensional array so we need to compute the actual index.
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
    auto PtrOpTy =
        cast<PointerType>(GEP->getPointerOperandType())->getElementType();

    size_t OpIdx = 1;
    // Move until we found the pointed element (which can be an array).
    while ((isa<PointerType>(PtrOpTy) || isa<StructType>(PtrOpTy)) &&
           OpIdx < GEP->getNumOperands() - 1) {
        OpIdx++;
        PtrOpTy = isa<PointerType>(PtrOpTy)
                      ? cast<PointerType>(PtrOpTy)->getElementType()
                      // Indexing a struct field requires a constant integer.
                      : cast<StructType>(PtrOpTy)->getElementType(
                            cast<ConstantInt>(GEP->getOperand(OpIdx))
                                ->getSExtValue());
    }

    auto Idx = GEP->getOperand(OpIdx);
    auto ArrIdxMult = 1;

    auto MatchType = [Before](Value *&A, Value *&B) {
        auto ATy = A->getType();
        auto BTy = B->getType();
        auto ANumBits = ATy->getScalarSizeInBits();
        auto BNumBits = BTy->getScalarSizeInBits();
        if (ANumBits < BNumBits)
            A = new SExtInst(A, BTy, "", Before);
        else if (BNumBits < ANumBits)
            B = new SExtInst(B, ATy, "", Before);
    };

    if (isa<ArrayType>(PtrOpTy)) {
        auto ArrIdx = GEP->getOperand(OpIdx);
        auto ArrIdxTy = ArrIdx->getType();
        MatchType(ArrIdx, Idx);
        Idx = BinaryOperator::CreateMul(
            ArrIdx, ConstantInt::get(ArrIdxTy, ArrIdxMult), "", Before);

        while (OpIdx < GEP->getNumIndices()) {
            ArrIdxMult *= 2;
            OpIdx++;
            auto ArrIdx = GEP->getOperand(OpIdx);
            auto ArrIdxTy = ArrIdx->getType();
            MatchType(ArrIdx, Idx);
            ArrIdx = BinaryOperator::CreateMul(
                ArrIdx, ConstantInt::get(ArrIdxTy, ArrIdxMult), "", Before);
            MatchType(ArrIdx, Idx);
            Idx = BinaryOperator::CreateAdd(Idx, ArrIdx, "", Before);
        }
    }

    MatchType(Idx, PtrLen);
    auto IsSafe = ICmpInst::Create(Instruction::ICmp, ICmpInst::ICMP_SLT, Idx,
                                   PtrLen, "", Before);

    // Check if (i) the incoming condition is true OR (ii) the access to the
    // original array at Idx is safe. If (i), we execute the original
    // instruction as it is. If (ii), we also execute the original
    // instruction as it is because we know the access is inbounds.
    // Otherwise, we access a shadow memory.
    auto NewPtr =
        ctsel(BinaryOperator::CreateOr(Cond, IsSafe, "safe.", Before), GEP,
              new BitCastInst(Shadow, GEP->getType(), "", Before), Before);

    NewPtr->setName("select.ptr.");
    return NewPtr;
}

void transformPredAssign(Instruction &P, PHINode &Phi, Value &Init) {
    auto PredAssign = cast<ConstantInt>(Init).isOne()
                          // If the initial value is "true", and at some point
                          // it becomes "false", it cannot be "true" again.
                          ? BinaryOperator::CreateAnd(&P, &Phi, "")
                          // Similarly, if it is "false", and at some point it
                          // becomes "true", it cannot be "false" again.
                          : BinaryOperator::CreateOr(&P, &Phi, "");

    PredAssign->insertAfter(&P);
    P.replaceUsesWithIf(
        PredAssign, [PredAssign](Use &U) { return U.getUser() != PredAssign; });
}

Value *ctsel(Value *Cond, Value *VTrue, Value *VFalse, Instruction *Before) {
    return llvm::SelectInst::Create(Cond, VTrue, VFalse, "", Before);
}
} // namespace isochronous

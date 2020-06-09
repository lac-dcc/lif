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
#include <llvm/IR/BasicBlock.h>
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
    Transform(F).run();
    return PreservedAnalyses::none();
}

Transform::Transform(Function &F) : F(F) {
    OutMap OutM = allocOut(F);
    auto [InM, GenV] = bind(F, OutM);
    this->InM = InM;

    // Fill SkipM with the instructions generated after binding the
    // conditions to each basic block, since we don't need to modify them.
    for (auto *V : GenV) this->SkipS.insert(V);

    // Fill LastM with the constant 0 for each memory-related value.
    auto *Int64T = IntegerType::get(F.getContext(), 64);
    auto *Const0 = ConstantInt::get(Int64T, 0);

    for (auto &BB : F)
        for (auto &I : BB)
            if (auto *GEP = dyn_cast<GetElementPtrInst>(&I))
                this->LastM[GEP->getPointerOperand()] = Const0;
}

void Transform::run() {
    for (auto &BB : this->F) {
        // We need to collect every phi instruction and store at a separate
        // vector because phi tranform. fn removes the phi instruction, so we
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

    auto *InCond = OrV.back();
    auto *Const1 = ConstantInt::get(InCond->getType(), 1);
    auto *LastCond = BinaryOperator::CreateSub(InCond, Const1, "", &Load);
    auto *NewCond = BinaryOperator::CreateNot(LastCond, "", &Load);

    // Clone GEP inst to ensure that it is right before the Load inst.
    auto *GEPClone = cast<GetElementPtrInst>(GEP->clone());
    GEPClone->insertBefore(&Load);
    Load.setOperand(0, GEPClone);
    this->gep(GEPClone, LastCond, NewCond);
}

void Transform::store(StoreInst &Store) {
    auto InV = this->InM.lookup(Store.getParent());

    // No incoming condition, so there is nothing to do.
    if (InV.empty()) return;

    // Fold the incoming conditions from InV into a single value by applying the
    // operator | (or).
    auto OrV = this->joinCond(*Store.getParent());

    auto *InCond = OrV.back();
    auto *Const1 = ConstantInt::get(InCond->getType(), 1);
    auto *LastCond = BinaryOperator::CreateSub(InCond, Const1, "", &Store);
    auto *NewCond = BinaryOperator::CreateNot(LastCond, "", &Store);

    // If the Ptr operand is a GEP instruction, then we need to work on the
    // indices used by GEP.
    auto *GEP = dyn_cast<GetElementPtrInst>(Store.getPointerOperand());
    if (GEP) {
        // Clone GEP inst to ensure that it is right before the Load inst.
        auto *GEPClone = cast<GetElementPtrInst>(GEP->clone());
        GEPClone->insertBefore(&Store);
        Store.setOperand(1, GEPClone);
        this->gep(GEPClone, LastCond, NewCond);
    }

    // Generate a load to get either the value of the last accessed position or
    // the value stored at the position that Store is trying to update. For the
    // first case, we execute a store without changing the value (store the same
    // value), while for the latter we execute Store as it is.
    auto *StoreVal = Store.getValueOperand();
    auto *StoreValT = StoreVal->getType();
    auto *Load = new LoadInst(StoreValT, Store.getPointerOperand(), "", &Store);

    // Replace Store(val, addr) with Store(val', addr) where val' = either val
    // or Load(addr);
    auto *LastSExt = new SExtInst(LastCond, StoreValT, "", &Store);
    auto *Last = BinaryOperator::CreateAnd(LastSExt, Load, "", &Store);
    auto *NewSExt = new SExtInst(NewCond, StoreValT, "", &Store);
    auto *New = BinaryOperator::CreateAnd(NewSExt, StoreVal, "", &Store);

    auto *Select = BinaryOperator::CreateOr(Last, New, "select.val.", &Store);
    Store.setOperand(0, Select);
}

void Transform::gep(GetElementPtrInst *GEP, Value *LastCond, Value *NewCond) {
    for (unsigned i = 1; i <= GEP->getNumIndices(); i++) {
        auto *NewIdx = GEP->getOperand(i);
        // TODO: use last access index?
        auto *LastIdx = ConstantInt::get(NewIdx->getType(), 0);

        auto *LastSExt = new SExtInst(LastCond, NewIdx->getType(), "", GEP);
        auto *Last = BinaryOperator::CreateAnd(LastSExt, LastIdx, "", GEP);

        auto *NewSExt = new SExtInst(NewCond, NewIdx->getType(), "", GEP);
        auto *New = BinaryOperator::CreateAnd(NewSExt, NewIdx, "", GEP);

        auto *Select = BinaryOperator::CreateOr(Last, New, "select.idx.", GEP);
        GEP->setOperand(i, Select);
    }
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

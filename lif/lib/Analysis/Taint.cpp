//===-- Taint.cpp ---------------------------------------------------------===//
// Copyright (C) 2021  Luigi D. C. Soares
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
/// This file contains the implementation of the Taint analysis pass.
///
//===----------------------------------------------------------------------===//

#include "Analysis/Taint.h"

#include <cstdint>
#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/DenseSet.h>
#include <llvm/ADT/PostOrderIterator.h>
#include <llvm/Analysis/CallGraph.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/Analysis/MemoryBuiltins.h>
#include <llvm/Analysis/PostDominators.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Operator.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Support/Casting.h>

#include <stack>
#include <variant>

using namespace lif::analysis;

TaintedInfo lif::analysis::TaintAnalysis::run(
    llvm::Module &M, llvm::ModuleAnalysisManager &MAM
) {
    const auto &CG = MAM.getResult<llvm::CallGraphAnalysis>(M);
    llvm::ReversePostOrderTraversal<const llvm::CallGraph *> RPOT(&CG);

    TaintedInfo T;
    taintGlobals(M, T);

    for (auto It = RPOT.begin(), End = RPOT.end(); It != End; ++It) {
        auto F = (*It)->getFunction();
        if (!F || F->isDeclaration()) continue;

        auto &FAM = MAM.getResult<llvm::FunctionAnalysisManagerModuleProxy>(M)
                        .getManager();

        taintFunction(*F, T, FAM);
    }

    return T;
}

// Initialize the analysis key.
llvm::AnalysisKey lif::analysis::TaintAnalysis::Key;

void lif::analysis::taintGlobals(llvm::Module &M, TaintedInfo &T) {
    const auto G = M.getGlobalVariable("llvm.global.annotations");
    if (!G) return;

    // llvm.global.annotations is an array of structs.
    assert(G->getNumOperands() == 1);
    const auto Array = llvm::cast<llvm::ConstantArray>(G->getOperand(0));

    for (const auto &Element :  Array->operands()) {
        const auto Struct = llvm::cast<llvm::ConstantStruct>(Element);
        assert(Struct->getNumOperands() == 5);

        // The second field is the annotation, which in this context should
        // be the string "secret" (constant GEP). The last character,
        // which we drop with drop_back(), is \00 (null-terminated string).
        const llvm::StringRef Annotation = llvm::cast<llvm::ConstantDataArray>(
            llvm::cast<llvm::GlobalVariable>(
                Struct->getOperand(1)->getOperand(0)
            )->getOperand(0))->getAsString().drop_back();

        if (!Annotation.equals_insensitive("secret")) continue;

        // The first field corresponds to a pointer to the annotated variable
        // (it is bitcast instruction).
        auto Annotated = llvm::cast<llvm::BitCastInst>(
            llvm::cast<llvm::ConstantExpr>(Struct->getOperand(0))
                ->getAsInstruction()
            )->getOperand(0);

        T.insert(Annotated);
    }
}

void lif::analysis::taintLocal(llvm::CallInst *Call, TaintedInfo &T) {
    assert(Call->getCalledFunction()->getName().equals("llvm.var.annotation"));
    assert(Call->getNumArgOperands() == 5);

    // The second argument is the annotation, which in this context should
    // be the string "secret" (constant GEP). The last character,
    // which we drop with drop_back(), is \00 (null-terminated string).
    const llvm::StringRef Annotation = llvm::cast<llvm::ConstantDataArray>(
        llvm::cast<llvm::GlobalVariable>(
            llvm::cast<llvm::Constant>(Call->getArgOperand(1))->getOperand(0)
        )->getOperand(0))->getAsString().drop_back();

    if (!Annotation.equals_insensitive("secret")) return;

    // The first argument corresponds to a pointer to the annotated variable
    // (bitcast instruction).
    auto Annotated = llvm::cast<llvm::BitCastInst>(
        Call->getArgOperand(0))->getOperand(0);

    T.insert(Annotated);
}

void lif::analysis::taintFunction(
    llvm::Function &F, TaintedInfo &T, llvm::FunctionAnalysisManager &FAM
) {
    TaintedInfo TAux;

    const auto &TLI = FAM.getResult<llvm::TargetLibraryAnalysis>(F);
    auto &LI = FAM.getResult<llvm::LoopAnalysis>(F);
    auto &DT = FAM.getResult<llvm::DominatorTreeAnalysis>(F);
    auto &PDT = FAM.getResult<llvm::PostDominatorTreeAnalysis>(F);

    // Check if an operand is tainted or not.
    auto IsOpTainted = [&TAux](llvm::Value *Op) {
        return !llvm::isa<llvm::BasicBlock>(Op) &&
               TAux.contains(llvm::cast<llvm::Value>(Op));
    };

    bool Rerun = true;
    while (Rerun) {
        Rerun = false;

        TAux.clear();
        TAux.insert(T.begin(), T.end());

        std::stack<llvm::DomTreeNode *> DFS;
        DFS.push(DT.getRootNode());

        // A notin NodeMark => not visited yet
        // 1 => visited and we're still visiting its children
        // 2 => done
        llvm::DenseMap<llvm::DomTreeNode *, uint8_t> NodeMark;

        // Stack of tainted basic block for control dependence. We also store
        // the number of edges that the predicate controls within a loop.
        std::stack<std::pair<llvm::BasicBlock *, unsigned>> CDep;

        // Traverse the dominance tree in a DFS-like manner, propagating taint
        // information. A variable is tainted if its backward slice (data +
        // control dependencies) contains a tainted variable.
        //
        // Within loops, we adopt the following strategy: "Only propagate
        // control dependencies within the loop if that branch has two or more
        // edges pointing within the loop".
        //
        // We require loops to be in closed form (run -lcssa pass).
        while (!DFS.empty()) {
            llvm::DomTreeNode *A = DFS.top();
            DFS.pop();


            if (!NodeMark.count(A)) NodeMark[A] = 0;
            NodeMark[A]++;

            llvm::BasicBlock *BlockA = A->getBlock();
            llvm::BasicBlock *BlockB = nullptr;
            llvm::BasicBlock *IPDomBlockB = nullptr;
            unsigned NumEdgesWithinLoop = 0;

            if (!CDep.empty()) {
                BlockB = CDep.top().first;
                NumEdgesWithinLoop = CDep.top().second;
                IPDomBlockB = PDT.getNode(BlockB)->getIDom()->getBlock();
            }

            // Inside loops, we only propagate control dependence if the tainted
            // predicate controls more than one edge.
            bool PropCDep = BlockB && (
                !(LI.getLoopDepth(BlockB) > 0 &&
                  LI.getLoopFor(BlockB)->contains(BlockA)) ||
                NumEdgesWithinLoop > 1
            ) && IPDomBlockB != BlockA;
            // If A is the immediate post-dominator of B, in most cases we
            // should disconsider it, as there shouldn't usually be
            // control-dependence edges to the post-dominator of a node.
            // We need, however, to consider control dependence for phi nodes
            // in the immediate post-dominator of B.
            //
            // TODO: implement this with gating, which allows us to transform
            // control into data dependence.
            bool PropIDomCDep = BlockB && (
                !(LI.getLoopDepth(BlockB) > 0 &&
                  LI.getLoopFor(BlockB)->contains(BlockA)) ||
                NumEdgesWithinLoop > 1
            ) && IPDomBlockB == BlockA;

            // If A == B, which implies that A's number is 2, we're done
            // visiting it. In this case, we pop BlockB from the
            // control-dependence stack. We also pop BlockB if BlockA is the
            // immediate post-dominator of BlockB, which we have left as the
            // last child to be visited.
            if ((BlockA == BlockB) || (IPDomBlockB == BlockA)) CDep.pop();
            if (NodeMark[A] == 2) continue;

            for (auto &V : *BlockA) {
                auto Call = llvm::dyn_cast<llvm::CallInst>(&V);
                if (!Call) {
                    bool DDep;
                    // Loads are tainted if the address to be accessed is
                    // tainted. The index, however, may be tainted --- which
                    // implies that the program is not publicly safe --- but
                    // this not cause the loaded value to be tainted. As
                    // a workaround, we ignore tainted indices for GEPs and
                    // report a warning regarding publicly unsafety.
                    //
                    // TODO: any better solution?
                    auto Load = llvm::dyn_cast<llvm::LoadInst>(&V);
                    auto GEP = llvm::dyn_cast<llvm::GEPOperator>(
                        Load ? Load->getPointerOperand() : &V);

                    if (GEP) {
                        DDep = IsOpTainted(GEP->getPointerOperand());
                        if (std::any_of(
                                GEP->indices().begin(), GEP->indices().end(),
                                IsOpTainted
                        )) {
                            llvm::errs() << "Warning: secret-dependent index!\n";
                            llvm::errs() << *GEP << "\n";
                        }
                    } else {
                        DDep = std::any_of(
                            V.op_begin(), V.op_end(), IsOpTainted
                        );
                    }

                    bool PhiCDep = llvm::isa<llvm::PHINode>(V) && PropIDomCDep;
                    if (DDep || PropCDep || PhiCDep) TAux.insert(&V);
                    continue;
                }

                if (Call->isInlineAsm()) continue;

                auto Callee = Call->getCalledFunction();
                if (!Callee) {
                    Callee = llvm::cast<llvm::Function>(
                        Call->getCalledOperand()->stripPointerCasts());
                }

                if (Callee->getName().equals("llvm.var.annotation")) {
                    taintLocal(Call, TAux);
                    continue;
                }

                if (Callee->isDeclaration()) {
                    // As a sound overapproximation, we consider functions
                    // that we don't have access to their body as tainted,
                    // unless explicitly stated otherwise.
                    //
                    // TODO: right now we manually define malloc as safe;
                    // consider adding annotations for safe functions.
                    if (!llvm::isAllocationFn(Call, &TLI))
                        TAux.insert(Call); // Overapproximation.
                    continue;
                }

                TaintedInfo TContextCall;
                taintGlobals(*F.getParent(), TContextCall);

                for (size_t Idx = 0; Idx < Call->arg_size(); Idx++) {
                    auto ArgOp = Call->getArgOperand(Idx);
                    auto ConstExpr = llvm::dyn_cast<llvm::ConstantExpr>(ArgOp);

                    if (ConstExpr && std::any_of(
                            ConstExpr->op_begin(), ConstExpr->op_end(),
                            IsOpTainted
                    )) TAux.insert(ArgOp);

                    if (TAux.contains(ArgOp)) {
                        // The arguments of Callee tainted in TContextCall
                        // correspond to the context of the call site
                        // currently being analyzed.
                        TContextCall.insert(Callee->getArg(Idx));
                        // In TAux, there may be other arguments tainted already,
                        // so we add the new ones to get the "most insecure"
                        // version of the function.
                        TAux.insert(Callee->getArg(Idx));
                    }
                }

                // Multiple calls to a function will taint it multiple times
                // (each time, possibly with more secret inputs).
                //
                // We're currently transforming the "most insecure" version of
                // functions, according to the arguments tainted during taint
                // analysis.
                //
                // TODO 1: Any way to optimize this?
                // TODO 2: Any better approach? Perhaps clone functions and
                //         transform each version according to the tainted
                //         parameters obtained from the call site context?
                taintFunction(*Callee, TContextCall, FAM);

                // If the callee function is tainted, marked the call inst
                // as tainted as well (the returned value).
                if (TContextCall.contains(Callee)) TAux.insert(Call);
            }

            if (TAux.contains(BlockA->getTerminator())) {
                unsigned NumEdgesWithinLoop = 0;

                if (auto LA = LI.getLoopFor(BlockA)) {
                    llvm::SmallVector<llvm::BasicBlock *, 4> V;
                    LA->getExitBlocks(V);

                    llvm::SmallDenseSet<llvm::BasicBlock *, 4> ExitBlocks(
                        V.begin(), V.end()
                    );

                    for (auto Succ : llvm::successors(BlockA)) {
                        if (!ExitBlocks.contains(Succ)) NumEdgesWithinLoop++;
                    }
                }

                CDep.push({BlockA, NumEdgesWithinLoop});
                TAux.insert(BlockA);

                if (llvm::isa<llvm::ReturnInst>(BlockA->getTerminator()))
                    TAux.insert(&F);
            }

            // Push node A again to the stack so we visit a second time:
            DFS.push(A);

            // Traverse the children of A a first time, looking to A's ipdom:
            auto IPDomA = PDT.getNode(BlockA)->getIDom();
            bool IPDomAFound = false;
            for (auto Child : A->children()) {
                if (IPDomA == Child) {
                    IPDomAFound = true;
                    break;
                }
            }

            // Push the ipdom of A first so it is the last child to be visited:
            if (IPDomAFound) DFS.push(IPDomA);

            // Push the remaining children:
            for (auto Child : A->children())
                if (Child != IPDomA) DFS.push(Child);
        }

        // We rerun the taint analysis if we find an store that taints an
        // address that hasn't been tainted yet. We also rerun the analysis if
        // we find a phi node that we should taint, but we haven't yet,
        // for they are the only instructions whose operands may be defined
        // after the use (when within a loop).
        //
        // TODO: any way to optimize this backtracking/any better approach?
        for (auto &BB : F) {
            for (auto &I : BB) {
                auto Phi = llvm::dyn_cast<llvm::PHINode>(&I);
                if (Phi && std::any_of(I.op_begin(), I.op_end(), IsOpTainted)) {
                    Rerun |= T.insert(Phi).second;
                    continue;
                }

                // If I is an store, we must taint the address
                // (sound overapproximation).
                auto Store = llvm::dyn_cast<llvm::StoreInst>(&I);
                if (!Store || !TAux.contains(Store)) continue;

                auto PtrOp = Store->getPointerOperand();

                // TODO: consider other intermediate instructions?
                while (auto GEP = llvm::dyn_cast<llvm::GEPOperator>(PtrOp))
                    PtrOp = GEP->getPointerOperand();

                Rerun |= T.insert(PtrOp).second;
            }
        }
    }

    T.insert(TAux.begin(), TAux.end());
}

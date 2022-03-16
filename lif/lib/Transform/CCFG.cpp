//===-- CCFG.cpp ----------------------------------------------------------===//
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
// along with this program. If not, see <https://www.gnu.org/licenses/>.
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementation of the Collapsed CFG.
///
//===----------------------------------------------------------------------===//

#include "Transform/CCFG.h"

#include <llvm/ADT/DenseSet.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/CFG.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Value.h>

#include <stack>
#include <variant>

using namespace lif::transform;

CCFG::Node *lif::transform::CCFG::Node::make(
    llvm::BasicBlock *BB, const llvm::LoopInfo &LI, bool IsSubgraph
) {
    auto N = new Node();
    if (!IsSubgraph && LI.isLoopHeader(BB))
        N->Val = LI.getLoopFor(BB);
    else
        N->Val = BB;
    return N;
}

CCFG::ChildrenTy lif::transform::CCFG::Node::successors(
    const llvm::LoopInfo &LI, bool Invalidate
) {
    if (!Invalidate && !this->Successors.empty()) return this->Successors;
    this->Successors.clear();

    if (std::holds_alternative<llvm::BasicBlock *>(this->Val)) {
        auto BB = std::get<llvm::BasicBlock *>(this->Val);

        auto L = LI.getLoopFor(BB);
        llvm::BasicBlock *Header = nullptr;
        llvm::SmallVector<llvm::BasicBlock *, 4> Tmp;

        if (L) {
            Header = L->getHeader();
            L->getExitBlocks(Tmp);
        }

        llvm::DenseSet<llvm::BasicBlock *> ExitBlocks(Tmp.begin(), Tmp.end());

        for (auto Succ : llvm::successors(BB)) {
            // If we're inside a loop and succ is an exit block, we
            // ignore this edge, since this edge will appear at the
            // loop node:
            if (L && ExitBlocks.contains(Succ)) continue;
            // If we're visiting a backedge, we also ignore it:
            if (L && L->isLoopLatch(BB) && Header == Succ) continue;
            this->Successors.push_back(Node::make(Succ, LI));
        }
    } else {
        auto L = std::get<llvm::Loop *>(this->Val);
        llvm::SmallVector<llvm::BasicBlock *, 4> ExitBlocks;
        L->getExitBlocks(ExitBlocks);

        for (auto Ex : ExitBlocks)
            this->Successors.push_back(Node::make(Ex, LI));
    }

    return this->Successors;
}

llvm::BasicBlock *lif::transform::CCFG::Node::asBasicBlock() {
    if (std::holds_alternative<llvm::Loop *>(this->Val))
        return std::get<llvm::Loop *>(this->Val)->getHeader();
    else
        return std::get<llvm::BasicBlock *>(this->Val);
}

std::vector<CCFG::Node *> lif::transform::CCFG::postOrder(
    Node *Entry, const llvm::LoopInfo &LI
) {
    std::function<void(Node *, llvm::DenseSet<llvm::BasicBlock *> &,
                       std::vector<Node *> &)>
        go = [&LI, &go](auto M, auto &Visited, auto &Nodes) {
            Visited.insert(M->asBasicBlock());

            for (auto N : M->successors(LI)) {
                auto BB = N->asBasicBlock();
                if (!Visited.contains(BB)) go(N, Visited, Nodes);
            }

            Nodes.push_back(M);
        };

    llvm::DenseSet<llvm::BasicBlock *> Visited;
    std::vector<Node *> Nodes;

    go(Entry, Visited, Nodes);
    return Nodes;
}

std::vector<CCFG::Node *> lif::transform::CCFG::compactOrder(
    Node *Entry, const llvm::LoopInfo &LI, llvm::FunctionAnalysisManager &FAM
) {
    auto F = Entry->asBasicBlock()->getParent();
    auto &DT = FAM.getResult<llvm::DominatorTreeAnalysis>(*F);

    // A loop L is the immediate dominator of a node N (in the CCFG)
    // if N's immediate dominator (in the CFG) is part of L.
    auto IsIDom = [&DT, &LI](auto N, auto M) {
        bool IsLoop = std::holds_alternative<llvm::Loop *>(N->Val);

        auto BBN = N->asBasicBlock();
        auto BBM = M->asBasicBlock();
        auto IDom = DT.getNode(BBM)->getIDom();

        auto LN = LI.getLoopFor(BBN);
        auto LIDom = LI.getLoopFor(IDom->getBlock());

        return (IsLoop && LIDom && LN->contains(LIDom)) ||
               (IDom == DT.getNode(BBN));
    };

    // Topological sort is just reverse post-order.
    auto PostOrder = postOrder(Entry, LI);
    auto It = PostOrder.rbegin();
    auto End = PostOrder.rend();

    std::function<void(std::vector<Node *>::reverse_iterator,
                       std::vector<Node *> &)>
        go = [&IsIDom, &LI, &FAM, &End, &go](auto It, auto &Nodes) {
            auto N = *It;
            Nodes.push_back(N);

            if (std::holds_alternative<llvm::Loop *>(N->Val)) {
                auto H = Node::make(N->asBasicBlock(), LI, true);
                auto LNodes = compactOrder(H, LI, FAM);
                Nodes.insert(Nodes.end(), LNodes.begin(), LNodes.end());
            }

            ++It;
            while (It != End) {
                auto M = *It;
                if (IsIDom(N, M)) go(It, Nodes);
                ++It;
            }
        };

    std::vector<Node *> Nodes;
    go(It, Nodes);

    return Nodes;
}

void lif::transform::CCFG::prettyPrint(
    Node *Entry, const llvm::LoopInfo &LI, llvm::FunctionAnalysisManager &FAM
) {
    auto printNode = [](Node *N) {
        auto BB = N->asBasicBlock();
        std::pair<std::string, std::string> Shape;

        if (std::holds_alternative<llvm::Loop *>(N->Val))
            Shape = {"(", ")"};
        else
            Shape = {"[", "]"};

        std::string BBName;
        llvm::raw_string_ostream OS(BBName);
        BB->printAsOperand(OS, false);

        llvm::errs() << Shape.first << BBName << Shape.second;
    };

    auto BB = Entry->asBasicBlock();
    auto PrintHeader = "===== " + BB->getParent()->getName().str() + " =====";
    llvm::errs() << PrintHeader << "\n";

    for (auto M : compactOrder(Entry, LI, FAM)) {
        printNode(M);
        llvm::errs() << ": { ";

        auto Succs = M->successors(LI);
        for (size_t Idx = 0; Idx < Succs.size(); Idx++) {
            auto N = Succs[Idx];
            printNode(N);
            if (Idx < Succs.size() - 1) llvm::errs() << ", ";
        }

        llvm::errs() << " }\n";
    }

    for (size_t Idx = 0; Idx < PrintHeader.size(); Idx++) llvm::errs() << "=";
    llvm::errs() << "\n";
}

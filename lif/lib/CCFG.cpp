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

#include "CCFG.h"

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

using namespace lif::CCFG;

Node *lif::CCFG::Node::make(llvm::BasicBlock *BB, const llvm::LoopInfo &LI,
                            bool IsSubgraph) {
    auto N = new Node();
    if (!IsSubgraph && LI.isLoopHeader(BB))
        N->Val = LI.getLoopFor(BB);
    else
        N->Val = BB;
    return N;
}

ChildrenTy lif::CCFG::Node::successors(const llvm::LoopInfo &LI,
                                       bool Invalidate) {
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

llvm::BasicBlock *lif::CCFG::Node::asBasicBlock() {
    if (std::holds_alternative<llvm::Loop *>(this->Val))
        return std::get<llvm::Loop *>(this->Val)->getHeader();
    else
        return std::get<llvm::BasicBlock *>(this->Val);
}

std::vector<Node *> lif::CCFG::postOrder(Node *Entry, const llvm::LoopInfo &LI) {
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

std::vector<Node *>
lif::CCFG::compactOrder(Node *Entry, const llvm::LoopInfo &LI,
                        llvm::FunctionAnalysisManager &FAM) {
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

// EdgeReplacementMapTy
// lif::CCFG::plinearize(Node *Entry, llvm::DenseSet<llvm::Value *> &Tainted,
//                       const llvm::LoopInfo &LI,
//                       llvm::FunctionAnalysisManager &FAM) {
//     return EdgeReplacementMapTy();
    // auto Nodes = compactOrder(Entry, LI, FAM);

    // llvm::DenseMap<Node *, size_t> Index;
    // for (size_t Idx = 0; Idx < Nodes.size(); Idx++) Index[Nodes[Idx]] = Idx;

    // // Use the index map to get the first node that appear in compact order:
    // auto min = [&Index](llvm::SmallPtrSetImpl<Node *> &Ns) {
    //     Node *M = nullptr;
    //     for (auto N : Ns)
    //         if (!M || Index[N] < Index[M]) M = N;
    //     return M;
    // };

    // // Set of deferral edges maintained by Moll & Hack's algorithm.
    // using Edge = std::pair<Node *, Node *>;
    // std::set<Edge> D;

    // auto printNode = [](Node *N) {
    //     llvm::BasicBlock *BB = nullptr;
    //     std::pair<std::string, std::string> Shape;

    //     if (std::holds_alternative<llvm::Loop *>(N->Val)) {
    //         BB = std::get<llvm::Loop *>(N->Val)->getHeader();
    //         Shape = {"(", ")"};
    //     } else {
    //         BB = std::get<llvm::BasicBlock *>(N->Val);
    //         Shape = {"[", "]"};
    //     }

    //     std::string BBName;
    //     llvm::raw_string_ostream OS(BBName);
    //     BB->printAsOperand(OS, false);

    //     llvm::errs() << Shape.first << BBName << Shape.second;
    // };

    // EdgeReplacementMapTy ERM;
    // for (auto M : Nodes) {
    //     printNode(M);
    //     llvm::errs() << "\n";
    //     auto BBM = M->asBasicBlock();
    //     auto Terminator = BBM->getTerminator();
    //     llvm::Loop *L = nullptr;

    //     // If M is a loop, we linearize the content of the loop:
    //     if (std::holds_alternative<llvm::Loop *>(M->Val)) {
    //         L = std::get<llvm::Loop *>(M->Val);
    //         auto H = Node::make(BBM, LI, true);
    //         for (auto [N, ERMLoop] : plinearize(H, Tainted, LI, FAM))
    //             ERM[N] = ERMLoop;

    //         // Force edges to update in the CCFG:
    //         M->successors(LI, true);
    //     }

    //     // Set of deferral edges that leave M:
    //     llvm::DenseSet<Node *> T;
    //     for (auto E : D)
    //         if (E.first == M) T.insert(E.second);

    //     // If M is clean (equivalent as uniform in Moll & Hack's algorithm):
    //     if (!isTainted(M, Tainted) && !L) {
    //         size_t Idx = 0;
    //         for (auto N : M->successors(LI)) {
    //             llvm::SmallPtrSet<Node *, 8> S{N};
    //             // S = T U {N}
    //             for (auto Target : T) S.insert(Target);
    //             auto Next = min(S);

    //             if (Next != N) {
    //                 auto Br = llvm::cast<llvm::BranchInst>(Terminator);
    //                 auto BBNext = Next->asBasicBlock();
    //                 Br->setSuccessor(Idx, BBNext);
    //                 // If edge has changed, update the replacement map:
    //                 auto BBN = N->asBasicBlock();
    //                 ERM[BBM][BBN] = BBNext;
    //             }

    //             // D = D U {(Next, t) | t in (T U {N}) \ {Next}}, i.e.
    //             // D = D U {(Next, t) | t in S \ {Next}}.
    //             S.erase(Next);
    //             for (auto Target : S) D.insert({Next, Target});

    //             Idx++;
    //         }
    //     }

    //     // If M is tainted (equivalent as divergent in Moll & Hack's algorithm):
    //     else {
    //         llvm::SmallPtrSet<Node *, 8> S;
    //         // S = {s | (M, N) in E(G)}
    //         for (auto N : M->successors(LI)) S.insert(N);
    //         // T U S
    //         for (auto Target : T) S.insert(Target);
    //         auto Next = min(S);

    //         // llvm::errs() << "+++++++++++++++\n";
    //         // for (auto N : S) {
    //         //     printNode(N);
    //         //     llvm::errs() << "\n";
    //         // }
    //         // printNode(Next);
    //         // llvm::errs() << "\n";
    //         // llvm::errs() << "+++++++++++++++\n";

    //         auto Br = llvm::cast<llvm::BranchInst>(Terminator);
    //         auto BBNext = Next->asBasicBlock();
    //         size_t Idx = 0;
    //         for (auto BBN : llvm::successors(BBM)) {
    //             llvm::errs() << "CHANGING TAINTED: " << *BBM << "\n"
    //                          << *BBNext << "\n\n";
    //             // If edge has changed, update the replacement map:
    //             if (BBNext != BBN) {
    //                 Br->setSuccessor(Idx, BBNext);
    //                 ERM[BBM][BBN] = BBNext;
    //             }
    //             Idx++;
    //         }

    //         // D = D U {(Next, t) | t in (T U S) \ {Next}}
    //         S.erase(Next);
    //         for (auto Target : S) D.insert({Next, Target});
    //     }

    //     // D = D \ {(M, N) | (M, N) in D}, where M is fixed as the
    //     // current node. Equivalent to C++20 erase_if:
    //     for (auto It = D.begin(), End = D.end(); It != End;) {
    //         if (It->first == M)
    //             It = D.erase(It);
    //         else {
    //             ++It;
    //         }
    //     }

    //     // Force edges to update in the CCFG:
    //     M->successors(LI, true);
    // }

    // return ERM;
// }

void lif::CCFG::prettyPrint(Node *Entry, const llvm::LoopInfo &LI,
                            llvm::FunctionAnalysisManager &FAM) {
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

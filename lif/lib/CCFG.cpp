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
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementation of the Collapsed CFG.
///
//===----------------------------------------------------------------------===//

#include "CCFG.h"

#include <llvm/ADT/DenseMap.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/IR/Dominators.h>
#include <llvm/Support/GraphWriter.h>

#include <functional>
#include <set>

using namespace lif;

void lif::CCFG::LoopNode::setContent(llvm::BasicBlock *BB) {
    auto BBN = BasicBlockNode::make(BB, this);
    auto N = std::make_unique<Node>(BBN);
    this->G = std::make_unique<CCFG>(std::move(N));
}

void lif::CCFG::LoopNode::taint(llvm::DenseSet<llvm::Value *> &Tainted,
                                const llvm::LoopInfo &LI) {
    auto BBN = std::get<BasicBlockNode *>(*this->G->Root);
    auto Header = BBN->BB;

    llvm::SmallVector<llvm::BasicBlock *, 4> ExitingBlocks;
    LI.getLoopFor(Header)->getExitingBlocks(ExitingBlocks);

    BBN->IsTainted = Tainted.contains(Header->getTerminator());
    this->IsTainted = std::any_of(
        ExitingBlocks.begin(), ExitingBlocks.end(),
        [&Tainted](auto BB) { return Tainted.contains(BB->getTerminator()); });
}

void lif::CCFG::BasicBlockNode::setContent(llvm::BasicBlock *BB) {
    this->BB = BB;
}

void lif::CCFG::BasicBlockNode::taint(llvm::DenseSet<llvm::Value *> &Tainted) {
    this->IsTainted = Tainted.contains(this->BB->getTerminator());
}

lif::CCFG lif::CCFG::make(llvm::Function &F,
                          llvm::DenseSet<llvm::Value *> &Tainted,
                          const llvm::LoopInfo &LI) {
    CCFG G;
    llvm::DenseMap<llvm::BasicBlock *, Node *> AsNode;
    llvm::DenseSet<llvm::BasicBlock *> InStack;
    G.Root = std::unique_ptr<Node>(
        build(&F.getEntryBlock(), Tainted, AsNode, InStack, LI));
    return G;
}

/// Takes a basic block \p BB and converts to a CCFG. Whenever we're
/// visiting a node that is inside a loop
///
/// \returns a CCFG that corresponds to BB.
CCFG::Node *lif::CCFG::build(llvm::BasicBlock *BB,
                             llvm::DenseSet<llvm::Value *> &Tainted,
                             llvm::DenseMap<llvm::BasicBlock *, Node *> &AsNode,
                             llvm::DenseSet<llvm::BasicBlock *> &InStack,
                             const llvm::LoopInfo &LI, LoopNode *Parent) {
    InStack.insert(BB);

    auto M = convert(BB, Tainted, LI, Parent);
    bool IsLoopNode = std::holds_alternative<LoopNode *>(*M);
    AsNode[BB] = M;

    auto L = LI.getLoopFor(BB);
    llvm::SmallVector<llvm::BasicBlock *, 4> ExitBlocksVec;
    if (L) L->getExitBlocks(ExitBlocksVec);

    llvm::SmallPtrSet<llvm::BasicBlock *, 4> ExitBlocksSet;
    for (auto ExitBB : ExitBlocksVec) ExitBlocksSet.insert(ExitBB);

    /// Takes nodes \p M and N and creates a new edge between them.
    auto AddEdgeToNode = [](Node *M, Node *N) {
        std::visit(
            [N](auto &&M) {
                M->SuccsRef.push_back(N);
                M->Succs.push_back(*N);
            },
            *M);
        std::visit([M](auto &&N) { N->Preds.push_back(*M); }, *N);
    };

    /// Takes nodes \p M and N and creates a new edge between N and the parent
    /// of node M.
    auto AddEdgeToParent = [](Node *M, Node *N) {
        auto P = std::visit([](auto &&M) { return M->Parent; }, *M);
        assert(P && "error: trying to add edge to null parent!");
        P->SuccsRef.push_back(N);
        P->Succs.push_back(*N);
        std::visit([P](auto &&N) { N->Preds.push_back(P); }, *N);
    };

    for (auto Succ : llvm::successors(BB)) {
        // If Succ is in the recursion stack, then (BB, Succ) is a back edge and
        // we don't want it.
        if (InStack.contains(Succ)) continue;

        // We might have already visited Succ.
        Node *N = nullptr;
        if (AsNode.count(Succ)) {
            N = AsNode[Succ];
        } else {
            LoopNode *SuccParent = nullptr;
            // We're moving to inside the loop headed by node M.
            if (LI.isLoopHeader(BB) && L->contains(Succ))
                SuccParent = std::get<LoopNode *>(*M);
            // We're moving to outside the loop that contains node M.
            else if (Parent && ExitBlocksSet.contains(Succ))
                SuccParent = Parent->Parent;
            // We're moving to the same loop depth.
            else
                SuccParent = Parent;

            N = build(Succ, Tainted, AsNode, InStack, LI, SuccParent);
        }

        // If the edge (BB, Succ) is an exiting edge, then we set node N as
        // a child of BB's Parent. Recall that loops are collapsed in a CCFG,
        // so the exiting edges of a loop in a CFG become edges leaving its
        // corresponding parent node.
        if (ExitBlocksSet.contains(Succ)) {
            // Recall that if BB was converted to a loop node M (i.e. BB is a
            // loop header), then the parent of the nodes within the loop is
            // the loop node M (i.e. we must not use its parent).
            if (IsLoopNode)
                AddEdgeToNode(M, N);
            else
                AddEdgeToParent(M, N);
        } else if (IsLoopNode) {
            // If BB is a loop header, then M is the loop node corresponding to
            // the collapsed loop. But we know that the edge (BB, Succ) isn't
            // an exiting edge, so now we must consider the underlying CCFG
            // stored in the loop node.
            AddEdgeToNode(std::get<LoopNode *>(*M)->G->Root.get(), N);
        } else {
            AddEdgeToNode(M, N);
        }
    }

    InStack.erase(BB);
    return M;
}

lif::CCFG::Node *lif::CCFG::convert(llvm::BasicBlock *BB,
                                    llvm::DenseSet<llvm::Value *> &Tainted,
                                    const llvm::LoopInfo &LI,
                                    LoopNode *Parent) {
    if (LI.isLoopHeader(BB)) {
        auto LN = LoopNode::make(BB, Parent);
        LN->taint(Tainted, LI);
        return new Node(LN);
    } else {
        auto BBN = BasicBlockNode::make(BB, Parent);
        BBN->taint(Tainted);
        return new Node(BBN);
    }
}

llvm::ReversePostOrderTraversal<lif::CCFG::Node *> lif::CCFG::topological() {
    return llvm::ReversePostOrderTraversal<Node *>(this->Root.get());
}

std::vector<lif::CCFG::Node *>
lif::CCFG::bindex(llvm::FunctionAnalysisManager &FAM,
                  const llvm::LoopInfo &LI) {
    // Get the corresponding function, so we can use LLVM's dominance tree.
    auto N = std::holds_alternative<LoopNode *>(*this->Root)
                 ? std::get<LoopNode *>(*this->Root)->G->Root.get()
                 : this->Root.get();
    auto F = std::get<BasicBlockNode *>(*N)->BB->getParent();
    // A BasicBlockNode is the immediate dominator of a node M if its
    // underlying BasicBlock is the immediate dominator of M. Similarly, a
    // LoopNode is the immediate dominator of a node M if M's immediate
    // dominator is part of the corresponding loop.
    auto &DT = FAM.getResult<llvm::DominatorTreeAnalysis>(*F);
    auto IsIDom = [&DT, &LI](Node *N, Node *M) {
        bool IsNLoopNode = std::holds_alternative<LoopNode *>(*N);
        bool IsMLoopNode = std::holds_alternative<LoopNode *>(*M);

        if (IsNLoopNode) N = std::get<LoopNode *>(*N)->G->Root.get();
        if (IsMLoopNode) M = std::get<LoopNode *>(*M)->G->Root.get();

        auto A = std::get<BasicBlockNode *>(*N)->BB;
        auto B = std::get<BasicBlockNode *>(*M)->BB;
        auto IDomB = DT.getNode(B)->getIDom();

        auto LA = LI.getLoopFor(A);
        auto LIDomB = LI.getLoopFor(IDomB->getBlock());

        return (IsNLoopNode && LIDomB && LA->contains(LIDomB)) ||
               (IDomB == DT.getNode(A));
    };

    auto RPOT = this->topological();
    auto It = RPOT.begin();
    auto End = RPOT.end();

    std::function<std::vector<Node *>(
        llvm::ReversePostOrderTraversal<Node *>::rpo_iterator)>
        compact = [&IsIDom, &End, &compact](auto It) {
            auto N = *It;
            std::vector<Node *> BIndex;
            BIndex.push_back(N);

            ++It;
            while (It != End) {
                auto M = *It;

                if (IsIDom(N, M)) {
                    auto SubBIndex = compact(It);
                    BIndex.insert(std::end(BIndex), std::begin(SubBIndex),
                                  std::end(SubBIndex));
                }

                ++It;
            }

            return BIndex;
        };

    return compact(It);
}

lif::CCFG::EdgeReplacementMap
lif::CCFG::plinearize(llvm::FunctionAnalysisManager &FAM,
                      const llvm::LoopInfo &LI) {
    auto BList = this->bindex(FAM, LI);
    llvm::DenseMap<Node *, size_t> BIndex;

    for (size_t I = 0; I < BList.size(); I++) BIndex[BList[I]] = I;

    // Use BIndex to get the first node that appear in the compact order.
    auto min = [&BIndex](llvm::SmallPtrSet<Node *, 8> Ns) {
        Node *M = nullptr;
        for (auto N : Ns)
            if (!M || BIndex[N] < BIndex[M]) M = N;
        return M;
    };

    // Set of deferral edges maintained by Moll & Hack's algorithm.
    using Edge = std::pair<Node *, Node *>;
    std::set<Edge> D;

    EdgeReplacementMap NewCCFG;
    for (auto M : BList) {
        // If M is a LoopNode, we linearize its underlying CCFG, which
        // corresponds to the loop.
        if (std::holds_alternative<LoopNode *>(*M)) {
            auto L = std::get<LoopNode *>(*M);
            for (auto [Node, EdgeMap] : L->G->plinearize(FAM, LI))
                NewCCFG[Node] = EdgeMap;
        }

        // Set of deferral edges that leave M.
        llvm::DenseSet<Node *> T;
        for (auto E : D)
            if (E.first == M) T.insert(E.second);

        auto OldSuccs = std::visit([](auto &&M) { return M->SuccsRef; }, *M);
        llvm::SmallVector<Node *, 4> NewSuccs;

        // If M is clean (equivalent as uniform in Moll & Hack's algorithm).
        if (!std::visit([](auto &&M) { return M->IsTainted; }, *M)) {
            for (auto N : OldSuccs) {
                llvm::SmallPtrSet<Node *, 8> S({N});
                // S = T U {N}
                S.insert(T.begin(), T.end());
                auto Next = min(S);
                NewSuccs.push_back(Next);
                if (Next != N) NewCCFG[*M][*N] = *Next;
                // D = D U {(Next, t) | t in (T U {N}) \ {Next}}, i.e.
                // D = D U {(Next, t) | t in S \ {Next}}.
                S.erase(Next);
                for (auto TargetPtr : S) D.insert({Next, TargetPtr});
            }
        }

        // If M is tainted (equivalent as divergent in Moll & Hack's
        // algorithm).
        else {
            llvm::SmallPtrSet<Node *, 8> S;
            // S = {s | (M, N) in E(G)}
            S.insert(OldSuccs.begin(), OldSuccs.end());
            // T U S
            S.insert(T.begin(), T.end());
            auto Next = min(S);
            NewSuccs.push_back(Next);
            for (auto N : OldSuccs)
                if (Next != N) NewCCFG[*M][*N] = *Next;
            // D = D U {(Next, t) | t in (T U S) \ {Next}}
            S.erase(Next);
            for (auto Target : S) D.insert({Next, Target});
        }

        // D = D \ {(M, N) | (M, N) in D}, where M is fixed as the curerent
        // Equivalent to C++20 erase_if.
        for (auto It = D.begin(), End = D.end(); It != End;) {
            if (It->first == M)
                It = D.erase(It);
            else
                ++It;
        }

        // Update edges.
        std::visit(
            [&OldSuccs, &NewSuccs](auto &&M) {
                llvm::SmallPtrSet<Node *, 4> Diff(OldSuccs.begin(),
                                                  OldSuccs.end());
                for (auto N : NewSuccs) Diff.erase(N);
                // TODO: is there any more efficient way to do this?
                for (auto N : Diff) {
                    // Node M is no longer a predecessor of N.
                    std::visit(
                        [M](auto &&N) {
                            std::set<Node> NewPreds;
                            for (auto Pred : N->Preds) NewPreds.insert(Pred);
                            NewPreds.erase(M);
                            N->Preds.assign(NewPreds.begin(), NewPreds.end());
                        },
                        *N);
                }

                M->SuccsRef.clear();
                M->Succs.clear();
                for (auto Succ : NewSuccs) {
                    M->SuccsRef.push_back(Succ);
                    M->Succs.push_back(*Succ);
                }
            },
            *M);
    }

    return NewCCFG;
}

static std::string dotFileName(lif::CCFG::Node &N) {
    // First, get the name of the function. We check for the parent node (if
    // any) to verify if we're inside a loop.
    auto Parent = std::visit([](auto &&N) { return N->Parent; }, N);

    auto BB = std::get<lif::CCFG::BasicBlockNode *>(N)->BB;
    auto FuncName = BB->getParent()->getName().str();

    // Define the suffix of the filename.
    std::string SuffixFileName = "";
    if (Parent) {
        auto LRoot = *Parent->G->Root;
        auto LHeader = std::get<lif::CCFG::BasicBlockNode *>(LRoot)->BB;
        std::string HeaderName;
        if (LHeader->hasName()) {
            HeaderName = BB->getName().str();
        } else {
            llvm::raw_string_ostream OS(HeaderName);
            LHeader->printAsOperand(OS, false);
        }

        HeaderName.erase(std::remove(HeaderName.begin(), HeaderName.end(), '%'),
                         HeaderName.end());

        SuffixFileName = "[loop@" + HeaderName + "]";
    }

    return FuncName + SuffixFileName + ".dot";
}

static void writeDotFile(lif::CCFG::Node &N) {
    auto Filename = dotFileName(N);
    llvm::errs() << "Writing " << Filename << " ...";

    std::error_code EC;
    llvm::raw_fd_ostream File(Filename, EC, llvm::sys::fs::OF_Text);

    if (!EC)
        llvm::WriteGraph(File, &N);
    else
        llvm::errs() << " error opening dot file for writing!";

    llvm::errs() << "\n";
}

void lif::CCFG::writeGraph() {
    std::stack<lif::CCFG::Node> S;
    S.push(*this->Root);

    std::set<lif::CCFG::Node> Visited;
    while (!S.empty()) {
        auto N = S.top();
        Visited.insert(N);
        S.pop();

        writeDotFile(N);

        auto Succs = std::visit([](auto &&N) { return N->Succs; }, N);
        for (auto M : Succs) {
            if (!Visited.count(M) && std::holds_alternative<LoopNode *>(M))
                S.push(*std::get<LoopNode *>(M)->G->Root);
        }
    }
}

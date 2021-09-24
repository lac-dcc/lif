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

#include <llvm/Support/GraphWriter.h>

using namespace lif;

lif::CCFG::CCFG(llvm::Function &F, llvm::DenseSet<llvm::Value *> &Tainted,
                const llvm::LoopInfo &LI) {
    llvm::DenseMap<llvm::BasicBlock *, Node *> AsNode;
    llvm::DenseSet<llvm::BasicBlock *> InStack;
    this->Root =
        NodePtr(build(&F.getEntryBlock(), Tainted, AsNode, InStack, LI));
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

    auto [N, NewParent] = convert(BB, Tainted, LI, Parent);
    bool IsLoopNode = std::holds_alternative<LoopNode *>(*N);
    AsNode[BB] = N;

    auto *L = LI.getLoopFor(BB);
    llvm::SmallVector<llvm::BasicBlock *, 4> ExitBlocksVec;
    if (L) L->getExitBlocks(ExitBlocksVec);

    llvm::SmallPtrSet<llvm::BasicBlock *, 4> ExitBlocksSet;
    for (auto *ExitBB : ExitBlocksVec) ExitBlocksSet.insert(ExitBB);

    /// Takes a CCFG \p N and returns a function that shall create a new edge
    /// connecting a node to N.
    ///
    /// \returns a function that creates a new edge.
    auto AddEdgeToNode = [](Node *N) {
        return [N](auto &&M) { M->Children.push_back(N); };
    };

    /// Takes a CCFG \p N and returns a function that shall create a new
    /// edge connecting the parent of a node to N.
    ///
    /// \returns a function that creates a new edge.
    auto AddEdgeToParent = [](Node *N) {
        return [N](auto &&M) { M->Parent->Children.push_back(N); };
    };

    for (auto *ChildBB : llvm::successors(BB)) {
        // If ChildBB is in the recursion stack, then (BB, ChildBB) is a back
        // edge and we don't want it.
        if (InStack.contains(ChildBB)) continue;

        // We might have already visited ChildBB.
        auto *M = AsNode.count(ChildBB)
                      ? AsNode[ChildBB]
                      : build(ChildBB, Tainted, AsNode, InStack, LI, NewParent);

        // If the edge (BB, ChildBB) is an exiting edge, then we set ChildT as
        // a child of BB's Parent. Recall that loops are collapsed in a CCFG,
        // so the exiting edges of a loop in a CFG become edges leaving its
        // corresponding parent node.
        if (ExitBlocksSet.contains(ChildBB)) {
            // Recall that if BB was converted to a loop node N (i.e. BB is a
            // loop header), then the parent of the nodes within the loop is
            // the node N itself (i.e. we must not use its parent).
            if (IsLoopNode)
                std::visit(AddEdgeToNode(M), *N);
            else
                std::visit(AddEdgeToParent(M), *N);
        } else if (IsLoopNode) {
            // If BB is a loop header, then N is the loop node corresponding to
            // the collapsed loop. But we know that the edge (BB, ChildBB) isn't
            // an exiting edge, so now we must consider the underlying CCFG
            // stored in the loop node.
            std::visit(AddEdgeToNode(M), *std::get<LoopNode *>(*N)->G->Root);
        } else {
            std::visit(AddEdgeToNode(M), *N);
        }
    }

    InStack.erase(BB);
    return N;
}

llvm::ReversePostOrderTraversal<lif::CCFG::Node *> lif::CCFG::topological() {
    return llvm::ReversePostOrderTraversal<Node *>(this->Root.get());
}

static std::string dotFileName(lif::CCFG::Node *N) {
    // First, get the name of the function. We check for the parent node (if
    // any) to verify if we're inside a loop.
    auto *Parent = std::visit([](auto &&N) { return N->Parent; }, *N);

    auto *BB = std::get<lif::CCFG::BasicBlockNode *>(*N)->BB;
    auto FuncName = BB->getParent()->getName().str();

    // Define the suffix of the filename.
    std::string SuffixFileName = "";
    if (Parent) {
        auto *Header =
            std::get<lif::CCFG::BasicBlockNode *>(*Parent->G->Root)->BB;
        std::string HeaderName;
        if (Header->hasName()) {
            HeaderName = BB->getName().str();
        } else {
            llvm::raw_string_ostream OS(HeaderName);
            Header->printAsOperand(OS, false);
        }

        HeaderName.erase(std::remove(HeaderName.begin(), HeaderName.end(), '%'),
                         HeaderName.end());

        SuffixFileName = "[loop@" + HeaderName + "]";
    }

    return FuncName + SuffixFileName + ".dot";
}

static void writeDotFile(lif::CCFG::Node *N) {
    auto Filename = dotFileName(N);
    llvm::errs() << "Writing " << Filename << " ...";

    std::error_code EC;
    llvm::raw_fd_ostream File(Filename, EC, llvm::sys::fs::OF_Text);

    if (!EC)
        llvm::WriteGraph(File, N);
    else
        llvm::errs() << " error opening dot file for writing!";

    llvm::errs() << "\n";
}

void lif::CCFG::writeGraph() {
    std::stack<lif::CCFG::Node *> S;
    S.push(this->Root.get());

    llvm::DenseSet<lif::CCFG::Node *> Visited;
    while (!S.empty()) {
        auto *N = S.top();
        Visited.insert(N);
        S.pop();

        writeDotFile(N);

        auto Children = std::visit([](auto &&N) { return N->Children; }, *N);
        for (auto *M : Children) {
            if (!Visited.contains(M) && std::holds_alternative<LoopNode *>(*M))
                S.push(std::get<LoopNode *>(*M)->G->Root.get());
        }
    }
}

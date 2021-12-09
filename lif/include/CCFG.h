//===-- CCFG.h --------------------------------------------------*- C++ -*-===//
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
/// This file contains the declaration of a Collapsed Control Flow Graph
/// (CCFG), which is basically a CFG with its loops collapsed and without any
/// back edges (i.e. acyclic).
//===----------------------------------------------------------------------===//
#ifndef LIF_CCFG_H
#define LIF_CCFG_H

#include <llvm/ADT/DenseMap.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Value.h>

#include <variant>

/// A CCFG is a CFG with its loops collapsed into a single node, which stores
/// the actual loop. Each loop node contains a CCFG corresponding to the actual
/// loop. In a declarative style (using a haskell-like notation), CCFG can be
/// defined as:
///
///     data Node = BasicBlock | Loop CCFG
///     data CCFG = CCFG Node [CCFG]
///
/// This definition assumes that every CFG has a single entry block and every
/// loop is natural (and thus have a single entry block as well).
///
/// Since the purpose of CCFG is to construct a compact topological order
/// and apply Moll & Hack's partial linearization, we:
///
///     (i) Assume loops to have unique latches and
///     (ii) Ignore every backedge.
namespace lif::CCFG {
/// A CCFG Node can be either a Basic Block or a Loop:
using NodeTy = std::variant<llvm::BasicBlock *, llvm::Loop *>;

struct Node;
/// If the node is a loop, its successors are the exiting blocks of that
/// loop. The successor of a node may either be a basic block or a loop.
using ChildrenTy = llvm::SmallVector<Node *, 4>;
struct Node {
    NodeTy Val;
    /// If the node is a Loop, its successors are the exit blocks. Successors
    /// may either be a basic block or a loop. We cache the result so we can
    /// access successors efficiently.
    ///
    /// \returns the successors of the node in the CCFG structure.
    ChildrenTy successors(const llvm::LoopInfo &LI, bool Invalidate = false);

    /// \returns the node represented as a basic block. For loops, we consider
    /// the loop header as the representant of the loop.
    llvm::BasicBlock *asBasicBlock();

    /// Produces a CCFG node of the correct type. In general, if \p BB
    /// is a loop header, the node type is a loop node; otherwise,
    /// it is a basic block.  However, we consider loop headers as basic
    /// blocks whenever we are visiting a subgraph (i.e. a loop headed
    /// by \p BB).
    ///
    /// \returns the corresponding CCFG node.
    static Node *make(llvm::BasicBlock *BB, const llvm::LoopInfo &LI,
                      bool IsSubgraph = false);

  private:
    // Cache for node successors:
    ChildrenTy Successors;
};

/// Takes the entry of a graph (CFG or loop) and produces a sequence of
/// the nodes in post order.
///
/// \returns the nodes in post order.
std::vector<Node *> postOrder(Node *Entry, const llvm::LoopInfo &LI);                              ;

/// Takes the entry of a graph (CFG or Loop) and produces a compact
/// topological order of that graph.
///
/// \returns the nodes in compact topological order.
std::vector<Node *> compactOrder(Node *Entry, const llvm::LoopInfo &LI,
                                 llvm::FunctionAnalysisManager &FAM);

/// Takes the entry node of a CCFG and prints the CCFG plus every collapsed
/// loop (mainly for debug).
void prettyPrint(Node *Entry, const llvm::LoopInfo &LI,
                 llvm::FunctionAnalysisManager &FAM);
} // namespace lif::CCFG

#endif

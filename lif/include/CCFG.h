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

#include <llvm/ADT/GraphTraits.h>
#include <llvm/ADT/Optional.h>
#include <llvm/ADT/PostOrderIterator.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/LoopInfo.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/Support/DOTGraphTraits.h>
#include <llvm/Support/raw_ostream.h>

#include <memory>
#include <variant>

namespace lif {
/// A CCFG is a CFG with its loops collapsed into a single node, which
/// stores the actual loop, and without any back edges. Each loop node contains
/// a CCFG corresponding to the actual loop (again, without back edges). In a
/// declarative style (using a haskell-like notation), CCFG
/// can be defined as:
///
///     data Node = BasicBlock | Loop CCFG
///     data CCFG = CCFG Node [CCFG]
///
/// This definition assumes that every CFG has a single entry block and every
/// loop is natural (and thus have a single entry block as well), but the
/// definition can be easily adapted to capture multiple entries.
///
/// We mark nodes as tainted according to pre-computed information. A basic
/// block is tainted if it ends with a tainted branch, whereas a loop is
/// tainted if at least one of its exiting blocks is tainted.
struct CCFG {
    struct LoopNode;
    struct BasicBlockNode;

    /// A CCFG node can be either a BB node or a Loop node.
    using Node = std::variant<BasicBlockNode *, LoopNode *>;
    using NodePtr = std::unique_ptr<Node>;
    using CCFGPtr = std::unique_ptr<CCFG>;

    template <typename NodeT> struct BaseNode {
        /// Parent corresponds to the the node that represents the inner most
        /// loop, if any. We need this to properly construct the CCFG, since
        /// loop exiting edges shall become edges leaving the collapsed node.
        LoopNode *Parent;
        /// Indicates whether this node is tainted or not.
        bool IsTainted;
        /// Every child of a node is itself a (sub) CCFG.
        llvm::SmallVector<Node *, 4> Children;
        /// Creates a node of type NodeT from a llvm BasicBlock \p BB, defining
        /// its corresponding \p Parent and content.
        ///
        /// \returns a pointer to a node of type NodeT.
        static NodeT *make(llvm::BasicBlock *BB, LoopNode *Parent = nullptr) {
            auto N = new NodeT();
            N->Parent = Parent;
            N->setContent(BB);
            return N;
        }
    };

    struct LoopNode : BaseNode<LoopNode> {
        /// The collapsed tree that corresponds to the actual loop (without any
        /// back edges).
        CCFGPtr G;
        /// Sets the CCFG that corresponds to the loop node.
        void setContent(llvm::BasicBlock *BB) {
            auto *BBN = BasicBlockNode::make(BB, this);
            auto N = std::make_unique<Node>(BBN);
            this->G = std::make_unique<CCFG>(std::move(N));
        }
        /// Sets the node as tainted according to pre-computed info.
        void taint(llvm::DenseSet<llvm::Value *> &Tainted,
                   const llvm::LoopInfo &LI) {
            auto *BBN = std::get<BasicBlockNode *>(*this->G->Root);
            auto *Header = BBN->BB;

            llvm::SmallVector<llvm::BasicBlock *, 4> ExitingBlocks;
            LI.getLoopFor(Header)->getExitingBlocks(ExitingBlocks);

            BBN->IsTainted = Tainted.contains(Header->getTerminator());
            this->IsTainted =
                std::any_of(ExitingBlocks.begin(), ExitingBlocks.end(),
                            [&Tainted](auto *BB) {
                                return Tainted.contains(BB->getTerminator());
                            });
        }
    };

    struct BasicBlockNode : BaseNode<BasicBlockNode> {
        /// The basic block that this node corresponds to. BasicBlocks are
        /// controlled by LLVM, so we shouldn't use unique_ptr.
        llvm::BasicBlock *BB;
        /// Sets the BasicBlock that corresponds to the BB node.
        void setContent(llvm::BasicBlock *BB) { this->BB = BB; }
        /// Sets the node as tainted according to pre-computed info.
        void taint(llvm::DenseSet<llvm::Value *> &Tainted) {
            this->IsTainted = Tainted.contains(this->BB->getTerminator());
        }
    };

    /// The root node of the CCFG, which is either the entry of the original
    /// CFG or the header of a loop.
    NodePtr Root;

    /// Constructs a CCFG from a llvm function \p F, collapsing loops as single
    /// nodes.
    CCFG(llvm::Function &F, llvm::DenseSet<llvm::Value *> &Tainted,
         const llvm::LoopInfo &LI);

    /// Constructs a CCFG from an root node \p Root. Unlike CCFG's 2-params
    /// constructor, this one does not traverse basic blocks to convert all
    /// of them. It simply creates an instance of CCFG rooted at node Root.
    CCFG(NodePtr Root) : Root(std::move(Root)) {}

    /// Sorts the CCFG topologically.
    ///
    /// \returns a reverse post order of the nodes.
    llvm::ReversePostOrderTraversal<Node *> topological();

    /// Produces multiple dot files for visualization of the CCFG. The dot file
    /// named as funcName.dot corresponds to the outermost CCFG, whereas the
    /// remaining dot files, named as funcName[loop@...].dot refers to the
    /// collapsed loops.
    void writeGraph();

  private:
    /// Takes a basic block \p BB and converts to a CCFG. Whenever we're
    /// visiting a node that is inside a loop and is an exiting block, we move
    /// its exiting edges to its parent loop node.
    ///
    /// \returns the root node of the CCFG.
    static Node *build(llvm::BasicBlock *BB,
                       llvm::DenseSet<llvm::Value *> &Tainted,
                       llvm::DenseMap<llvm::BasicBlock *, Node *> &AsNode,
                       llvm::DenseSet<llvm::BasicBlock *> &InStack,
                       const llvm::LoopInfo &LI, LoopNode *Parent = nullptr);

    /// Takes a basic block \p BB and converts to a CCFG node.
    ///
    /// \returns a BasicBlockNode corresponding to BB, plus the (possibly
    /// new) parent. The Parent returned is \p Parent if BB isn't a loop
    /// header; otherwise, it is a loop node corresponing to the collapsed
    /// loop.
    static std::pair<Node *, LoopNode *>
    convert(llvm::BasicBlock *BB, llvm::DenseSet<llvm::Value *> &Tainted,
            const llvm::LoopInfo &LI, LoopNode *Parent = nullptr) {
        if (LI.isLoopHeader(BB)) {
            auto *LN = LoopNode::make(BB, Parent);
            LN->taint(Tainted, LI);
            return {new Node(LN), LN};
        } else {
            auto *BBN = BasicBlockNode::make(BB, Parent);
            BBN->taint(Tainted);
            return {new Node(BBN), Parent};
        }
    }
};
} // namespace lif

template <> struct llvm::GraphTraits<lif::CCFG::Node *> {
    using NodeRef = lif::CCFG::Node *;
    static NodeRef getEntryNode(NodeRef N) { return N; }

    using ChildIteratorType = llvm::SmallVector<NodeRef, 4>::iterator;
    static ChildIteratorType child_begin(NodeRef N) {
        return std::visit([](auto &&N) { return N->Children.begin(); }, *N);
    }

    static ChildIteratorType child_end(NodeRef N) {
        return std::visit([](auto &&N) { return N->Children.end(); }, *N);
    };

    using nodes_iterator = llvm::po_iterator<NodeRef>;
    static nodes_iterator nodes_begin(NodeRef N) { return llvm::po_begin(N); }
    static nodes_iterator nodes_end(NodeRef N) { return llvm::po_end(N); }
};

template <>
struct llvm::DOTGraphTraits<lif::CCFG::Node *> : public DefaultDOTGraphTraits {
    using LoopNode = lif::CCFG::LoopNode;
    using BasicBlockNode = lif::CCFG::BasicBlockNode;
    using NodeRef = lif::CCFG::Node *;

    DOTGraphTraits(bool isSimple = false) : DefaultDOTGraphTraits(isSimple) {}

    static std::string getGraphName(const NodeRef N) {
        // We check if N has a parent. If so, it means it is inside a loop so
        // we add this information to the graph name.
        auto *Parent = std::visit([](auto &&N) { return N->Parent; }, *N);

        std::string SuffixGraphName = "";
        if (Parent) {
            auto *Header =
                std::get<lif::CCFG::BasicBlockNode *>(*Parent->G->Root)->BB;
            std::string HeaderName;

            if (Header->hasName()) {
                HeaderName = Header->getName().str();
            } else {
                llvm::raw_string_ostream OS(HeaderName);
                Header->printAsOperand(OS, false);
            }

            HeaderName.erase(
                std::remove(HeaderName.begin(), HeaderName.end(), '%'),
                HeaderName.end());

            SuffixGraphName = " [loop @ " + HeaderName + "]";
        }

        auto *BB = std::get<BasicBlockNode *>(*N)->BB;
        auto FuncName = BB->getParent()->getName().str();
        return "CCFG for " + FuncName + SuffixGraphName;
    }

    static std::string getNodeLabel(const NodeRef N, const NodeRef) {
        NodeRef M = N;
        std::string LabelPrefix = "";
        if (std::holds_alternative<LoopNode *>(*N)) {
            M = std::get<LoopNode *>(*N)->G->Root.get();
            LabelPrefix = "Loop @ ";
        }

        auto *BB = std::get<BasicBlockNode *>(*M)->BB;
        std::string Name;

        if (BB->hasName()) {
            Name = BB->getName().str();
        } else {
            llvm::raw_string_ostream OS(Name);
            BB->printAsOperand(OS, false);
        }

        return LabelPrefix + Name;
    }

    static std::string getNodeAttributes(const NodeRef N, const NodeRef) {
        std::string Shape = std::holds_alternative<LoopNode *>(*N)
                                ? "shape=circle"
                                : "shape=box";
        std::string Style = " style=\"rounded";
        Style += std::visit([](auto &&N) { return N->IsTainted; }, *N)
                     ? ",filled\" fillcolor=\"#EA325C\" fontcolor=white"
                     : "\"";
        return "margin=0 " + Shape + Style;
    }
};

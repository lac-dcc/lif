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

#include <llvm/ADT/DenseMap.h>
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

    template <typename NodeT> struct BaseNode {
        /// Parent corresponds to the the node that represents the inner most
        /// loop, if any. We need this to properly construct the CCFG, since
        /// loop exiting edges shall become edges leaving the collapsed node.
        LoopNode *Parent;
        /// Indicates whether this node is tainted or not.
        bool IsTainted;
        // We keep both endpoints of edges.
        llvm::SmallVector<Node, 4> Succs;
        llvm::SmallVector<Node, 4> Preds;
        // We also keep a vector of refs to the successors, to be used by
        // GraphTraits.
        // TODO: any better/more efficient way to handle this?
        llvm::SmallVector<Node *, 4> SuccsRef;
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
        std::unique_ptr<CCFG> G;
        /// Sets the CCFG that corresponds to the loop node.
        void setContent(llvm::BasicBlock *BB);
        /// Sets the node as tainted according to pre-computed info.
        void taint(llvm::DenseSet<llvm::Value *> &Tainted,
                   const llvm::LoopInfo &LI);
    };

    struct BasicBlockNode : BaseNode<BasicBlockNode> {
        /// The basic block that this node corresponds to. BasicBlocks are
        /// controlled by LLVM, so we shouldn't use unique_ptr.
        llvm::BasicBlock *BB;
        /// Sets the BasicBlock that corresponds to the BB node.
        void setContent(llvm::BasicBlock *BB);
        /// Sets the node as tainted according to pre-computed info.
        void taint(llvm::DenseSet<llvm::Value *> &Tainted);
    };

    /// Takes a CCFG::Node \p N and extract the corresponding llvm basic block.
    /// If N is a LoopNode, then the corresponding basic block is the loop
    /// header.
    ///
    /// \returns a llvm BasicBlock.
    static llvm::BasicBlock *extractBB(Node &N) {
        if (std::holds_alternative<LoopNode *>(N)) {
            auto LHeader = *std::get<LoopNode *>(N)->G->Root;
            return std::get<BasicBlockNode *>(LHeader)->BB;
        } else {
            return std::get<BasicBlockNode *>(N)->BB;
        }
    }

    /// The root node of the CCFG, which is either the entry of the original
    /// CFG or the header of a loop. If root is nil, the graph is empty.
    std::unique_ptr<Node> Root;

    /// Constructs a CCFG from a llvm function \p F, collapsing loops as single
    /// nodes.
    static CCFG make(llvm::Function &F, llvm::DenseSet<llvm::Value *> &Tainted,
                     const llvm::LoopInfo &LI);

    /// Constructs an empty CCFG.
    CCFG() {}

    /// Constructs a CCFG from a root node \p Root.
    CCFG(std::unique_ptr<Node> Root) : Root(std::move(Root)) {}

    /// Sorts the CCFG topologically.
    ///
    /// \returns a reverse post order of the nodes.
    llvm::ReversePostOrderTraversal<Node *> topological();

    /// Produces a compact topological sort of the CCFG.
    /// TODO: add the definition of bindex.
    ///
    /// \returns an iterator for the compact reverse post order.
    std::vector<Node *> bindex(llvm::FunctionAnalysisManager &FAM,
                               const llvm::LoopInfo &LI);

    using EdgeReplacementMap = std::map<Node, std::map<Node, Node>>;
    /// Traverses the compact topological order transforming edges to eliminate
    /// secret-dependent branches. We use Moll & Hack's partial linearization
    /// algorithm published at PLDI:
    /// https://compilers.cs.uni-saarland.de/papers/moll_parlin_pldi18.pdf
    ///
    /// Partial linearization is done in-place, so the original edges are
    /// lost in the process.
    ///
    /// \returns a map from a node to a list of pairs where the first element is
    /// the old target of that edge and the second element is the new target
    /// (empty if nothing has changed).
    EdgeReplacementMap plinearize(llvm::FunctionAnalysisManager &FAM,
                                  const llvm::LoopInfo &LI);

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
    /// \returns the CCFG node corresponding to BB.
    static Node *convert(llvm::BasicBlock *BB,
                         llvm::DenseSet<llvm::Value *> &Tainted,
                         const llvm::LoopInfo &LI, LoopNode *Parent = nullptr);
};
} // namespace lif

template <> struct llvm::GraphTraits<lif::CCFG::Node *> {
    using NodeRef = lif::CCFG::Node *;
    static NodeRef getEntryNode(NodeRef N) { return N; }

    using ChildIteratorType = llvm::SmallVector<NodeRef, 4>::iterator;
    static ChildIteratorType child_begin(NodeRef N) {
        return std::visit([](auto &&N) { return N->SuccsRef.begin(); }, *N);
    }

    static ChildIteratorType child_end(NodeRef N) {
        return std::visit([](auto &&N) { return N->SuccsRef.end(); }, *N);
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
        auto Parent = std::visit([](auto &&N) { return N->Parent; }, *N);

        std::string SuffixGraphName = "";
        if (Parent) {
            auto LRoot = *Parent->G->Root;
            auto Header = std::get<lif::CCFG::BasicBlockNode *>(LRoot)->BB;
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

        auto BB = std::get<BasicBlockNode *>(*N)->BB;
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

        auto BB = std::get<BasicBlockNode *>(*M)->BB;
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

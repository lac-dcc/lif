#ifndef LLVM_LIF_COND_H
#define LLVM_LIF_COND_H

#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Value.h>

namespace cond {
// A condition from path B1 to Bk is a set of expressions
// (predicates) such as {p1, ..., pk}, i.e. c = p1 & ... & pk.
//
// A block can have multiple incoming conditions expressed as a
// set of sets of preds such as {{p1, ..., pk}, {q1, ..., qn}},
// with:
//   > c1 = p1 & ... & pk
//   > c2 = q1 & ... &qn
//
// The outgoing condition of a block is a single value represented
// by some variable t. Hence, for a set of incoming conditions
// {{p1, ..., pk}, {q1, ..., qn}}, we have an outgoing condition
// out = c1 | c2.
//
// Type Incoming represents a condition from Bp to B, where Bp is a
// immediate predecessor of B. The incoming condition, though, is
// defined as Out(Bp) U { predicate(Bp, B) }, where Out(Bp) is
// the outgoing condition of Bp.
struct Incoming {
    // Let Out(Bp) = x and predicate(Bp, B) = p. Then, Cond = x & p.
    llvm::Instruction *Cond;
    // Thre BasicBlock from where the condition comes.
    llvm::BasicBlock *From;
};

// A map between a basic block and its incoming conditions.
// From LLVM doc
// (https://llvm.org/docs/ProgrammersManual.html#llvm-adt-smallvector-h):
//   > the number of predecessors/successors of a block is usually less than 8
using InMap =
    llvm::DenseMap<llvm::BasicBlock *, llvm::SmallVector<Incoming, 8>>;

// A map between a basic block and its outgoing condition.
// We should alloc a variable for the outgoing condition
// of each block and keep track of the alloc instruction.
using OutMap = llvm::DenseMap<llvm::BasicBlock *, llvm::Instruction *>;

// Allocate a variable for each basic block in F representing
// their outgoing conditions.
//
// Returns a map between a basic block and its outgoing condition.
// Side effect: the size of each basic block in F grows by 1 inst.
//
// Note: the actual computation of the outgoing condition is not
// done here. This function should only reserve a name for the out
// variable.
OutMap allocOut(llvm::Function &F);

// Compute the incoming conditions for a given basic block.
//
// Return a list of incoming conditions.
// Side effect: the size of the basic block grows according to
// the # of instructions needed to compute the incoming conditions.
llvm::SmallVector<Incoming, 8> bindIn(llvm::BasicBlock &BB, const OutMap OutM);

// Compute the outgoing condition for a given basic block.
//
// Side effect: the size of the basic block grows according to
// the # of instructions needed to compute the outgoing condition.
void bindOut(llvm::BasicBlock &BB, llvm::Value *OutPtr,
             const llvm::SmallVectorImpl<llvm::Value *> &InV);

// Run through the basic blocks of a given function F, binding the
// proper incoming and outgoing conditions to them.
//
// Return a map between a basic block and its incoming conditions.
// Side effect: the size of each basic block in F grows according
// to the # of instructions needed to compute both their incoming
// and outgoing conds.
InMap bind(llvm::Function &F, const OutMap OutM);
} // namespace cond

#endif

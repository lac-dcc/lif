#ifndef LLVM_LIF_COND_H
#define LLVM_LIF_COND_H

#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Value.h>

// A type representing some predicate, where:
//   > Bool is true if predicate comes from an else branch
//   > Value is a const or var name representing the predicate
using Expr = std::pair<bool, llvm::Value *>;

// A condition from path B1 to Bk is a set of expressions (predicates)
// such as {p1, ..., pk}. These sets can be transformed into a set
// of assignments as follows:
//   > { p1, ..., pk } => t1 = p1 & p2
//                        t2 = t1 & p3
//                        ...
//                        tk-1 = tk-2, pk
//
// A block can have multiple incoming conditions expressed as a
// set of sets of values { {p1, ..., pk}, {q1, ..., qn} }, with:
//    > { {p1, ..., pk}, {q1, ..., qn} } => t1 = p1 & p2
//                                          t2 = t1 & p3
//                                          ...
//                                          tk-1 = tk-2 & pk
//                                          tk = q1 & q2
//                                          tk+1 = tk & q3
//                                          ...
//                                          tk+n-1 = tk+n-2 & qn
//
// The outgoing condition of a block is a single value represented
// by some variable t. Hence, for a set of incoming conditions
// { { p1, ..., pk }, { q1, ..., qn } }, we have that the outgoing
// condition is represented by the last variable tk+n-1.
//
// Type Cond represents a condition from Bp to B, where Bp is a
// immediate predecessor of B. The incoming condition, though, is
// defined as Out(Bp) U { predicate Bp -> B }, where Out(Bp) is
// the outgoing condition of Bp.
struct Cond {
    // Let E be a set of expressions. Then, a condition c can be
    // defined as:
    //   > c  = fold (&) P where
    //   > P  = { p  if neg is false
    //          { !p otherwise
    //        forall (neg, p) in E.
    //
    // e.g.: E = { (false, p0), (true, p1), (true, p2) }
    //     > c = p0 & !p1 & !p2
    //
    // For a path B0 -> Bn, where Bi is a BasicBlock, if the
    // length of the path is > 3, a cond c for the last block
    // can be simplified as follows:
    //
    // Let P = B0 --p0--> B1 --p1--> B2 --p2--> B3, and C(Bi)
    // the condition of a block Bi. Then,
    //   > C(B0) = empty
    //   > C(B1) = p0
    //   > C(B2) = p0 & p1
    //   > C(B3) = p0 & p1 & p2
    //
    // Note that the predicates of C(B2) and C(B3) are the same.
    // Hence, one can avoid recalculating p0 & p1.
    //
    // Let x = p0 & p1. Then,
    //   > C[B2] = x and
    //   > C[B3] = x & p2
    llvm::SmallVectorImpl<Expr> List;
    // Thre BasicBlock from where the condition comes.
    llvm::BasicBlock From;
};

// A map between a basic block and its incoming conditions.
using CondMap = llvm::DenseMap<llvm::BasicBlock *, llvm::SmallVectorImpl<Cond>>;

// A map between a basic block and its outgoing condition.
// We should alloc a variable for the outgoing condition
// of each block and keep track of the alloc instruction.
using OutMap = llvm::DenseMap<llvm::BasicBlock *, llvm::Instruction *>;

// Allocate a variable for each basic block in F representing
// their outgoing conditions.
//
// Returns a map between a basic block and its outgoing cond.
// Side effect: the size of each basic block in F grows by 1 inst.
OutMap allocOut(llvm::Function &F);

#endif

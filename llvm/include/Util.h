#ifndef LLVM_LIF_UTIL_H
#define LLVM_LIF_UTIL_H

#include <llvm/ADT/SmallVector.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Value.h>

namespace util {
// Takes a list of values Vals = { v0, ..., vn } and transforms it into a
// sequence of instructions - by applying the binary operator Op - as follows:
//   > z0 = v0 op v1
//   > z1 = z0 op v2
//   > ...
//   > zn-1 = zn-2 op vn
llvm::SmallVector<llvm::Value *, 8>
fold(const llvm::Instruction::BinaryOps Op,
     const llvm::SmallVectorImpl<llvm::Value *> &Vals);
} // namespace util

#endif

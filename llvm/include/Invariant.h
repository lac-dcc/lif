//===-- Invariant.h ---------------------------------------------*- C++ -*-===//
///
/// \file
/// This file contains the declaration of the Invariant Pass, which transforms
/// some LLVM IR into a version that executes the same set of instructions
/// regardless of the inputs.
///
//===----------------------------------------------------------------------===//
#ifndef LLVM_LIF_INVARIANT_H
#define LLVM_LIF_INVARIANT_H

#include <llvm/IR/Function.h>
#include <llvm/IR/PassManager.h>

/// A pass that transforms a function into an invariant version.
///
/// An invariant function executes the same set of instructions regardless of
/// its inputs. Hence, this property can be used, e.g., for the mitigation of
/// side channel leaks on a cryptography library.
///
/// Currently, this pass cannot handle functions contanining loops.
struct InvariantPass : public llvm::PassInfoMixin<InvariantPass> {
    /// Transforms \p F into an invariant version.
    ///
    /// \returns the set of analyses preserved after running this pass.
    /// PreservedAnalyses::all if something went wrong (e.g. trying to
    /// transform a function with loops); otherwise, PreservedAnalyses::none.
    llvm::PreservedAnalyses run(llvm::Function &F,
                                llvm::FunctionAnalysisManager &AM);
};

#endif

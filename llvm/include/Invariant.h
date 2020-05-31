#ifndef LLVM_LIF_INVARIANT_H
#define LLVM_LIF_INVARIANT_H

#include <llvm/IR/Function.h>
#include <llvm/IR/PassManager.h>

struct Invariant : public llvm::PassInfoMixin<Invariant> {
    llvm::PreservedAnalyses run(llvm::Function &F,
                                llvm::FunctionAnalysisManager &AM);
};

#endif

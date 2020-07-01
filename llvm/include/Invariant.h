//===-- Invariant.h ---------------------------------------------*- C++ -*-===//
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
/// This file contains the declaration of the Invariant Pass, which transforms
/// some LLVM IR into a version that executes the same set of instructions
/// regardless of the inputs.
///
//===----------------------------------------------------------------------===//
#ifndef LLVM_LIF_INVARIANT_H
#define LLVM_LIF_INVARIANT_H

#include "Cond.h"

#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/DenseSet.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/TargetLibraryInfo.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Value.h>
#include <set>

namespace invariant {
/// A pass that transforms a function into an invariant version.
///
/// An invariant function executes the same set of instructions regardless of
/// its inputs. Hence, this property can be used, e.g., for the mitigation of
/// side channel leaks on a cryptography library.
///
/// Currently, this pass cannot handle functions contanining loops.
struct Pass : public llvm::PassInfoMixin<Pass> {
    /// Transforms \p F into an invariant version by applying the proper rule
    /// to each instruction, if necessary.
    ///
    /// \returns the set of analyses preserved after running this pass.
    llvm::PreservedAnalyses run(llvm::Function &F,
                                llvm::FunctionAnalysisManager &FAM);
};

/// Transforms \p Phi into a set of instructions according to the incoming
/// conditions of the basic block that contains \Phi.
///
/// Note: If the transformation occurs, \p Phi is removed from the basic
/// block.
void transformPhi(llvm::PHINode &Phi,
                  const llvm::SmallVectorImpl<cond::Incoming> &InV);

/// Transforms \p Load into a set of instructions according to the incoming
/// conditions of the basic block that contains \p Load.
void transformLoad(llvm::LoadInst &Load, llvm::AllocaInst *Shadow,
                   llvm::Value *PtrLen,
                   const llvm::SmallVectorImpl<cond::Incoming> &InV);

/// Transforms \p Store into a set of instructions according to the incoming
/// conditions of the basic block that contains \p Store.
void transformStore(llvm::StoreInst &Store, llvm::AllocaInst *Shadow,
                    llvm::Value *PtrLen,
                    const llvm::SmallVectorImpl<cond::Incoming> &InV);

/// Transforms \p GEP into a set of instructions according to \p Cond and
/// \p Len.
///
/// \returns The llvm value representing the select between GEP and Shadow.
llvm::Value *transformGEP(llvm::GetElementPtrInst *GEP,
                          llvm::AllocaInst *Shadow, llvm::Value *PtrLen,
                          llvm::Value *Cond, llvm::Instruction *Before);
} // namespace invariant

#endif

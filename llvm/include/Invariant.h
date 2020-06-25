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
  public:
    /// Traverses each function from \p M modifying the signature to include
    /// arguments carrying the length of each pointer arg. Also replace the
    /// original calls, passing the length args.
    ///
    /// \returns the set of analysis preserved after running this pass.
    llvm::PreservedAnalyses run(llvm::Module &M,
                                llvm::ModuleAnalysisManager &MAM);

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

/// Traverses the list of arguments of F to match each pointer with its
/// length. Also infers the length of local pointers.
llvm::DenseMap<const llvm::Value *, llvm::Value *>
getLen(llvm::Function &F, const llvm::TargetLibraryInfo *TLI);

/// Join a list of incoming conds. \p InV / by applying the | (or) operator.
///
/// This method requries #incoming conds > 0.
/// The size of \p BB grows according to #insts. generated.
///
/// \returns a list of generated instructions.
llvm::SmallVector<llvm::Instruction *, 8>
joinCond(const llvm::SmallVectorImpl<cond::Incoming> &InV);

/// Given two values, \p VTrue and \p VFalse, and a condition \p Cond,
/// generate instructions for selecting between \p VTrue and \p VFalse.
///
/// We use LLVM select inst. assuming that it is going to be lowered to a
/// constant-time inst. (e.g. cmov on x86). However, it can be manually
/// implemented as ctsel(cond, vtrue, vfalse) = { c = cond - 1; c' = ~c; v
/// = (c & vfalse) | (c' & vtrue) }
///
/// \returns a value representing the selected one.
llvm::Value *ctsel(llvm::Value *Cond, llvm::Value *VTrue, llvm::Value *VFalse,
                   llvm::Instruction *Before);
} // namespace invariant

#endif

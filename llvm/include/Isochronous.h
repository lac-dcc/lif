//===-- Isochronous.h -------------------------------------------*- C++ -*-===//
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
/// This file contains the declaration of the Isochronous Pass, which
/// transforms some LLVM IR into a version that executes the same set
/// of instructions regardless of the inputs.
///
//===----------------------------------------------------------------------===//
#ifndef LLVM_LIF_INVARIANT_H
#define LLVM_LIF_INVARIANT_H

#include "Cond.h"

#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/DenseSet.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/ADT/StringRef.h>
#include <llvm/Analysis/TargetLibraryInfo.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Value.h>
#include <set>

namespace isochronous {
/// A pass that transforms a function into an isochronous version.
///
/// An isochronous function executes the same set of instructions regardless of
/// its inputs. Hence, this property can be used, e.g., for the mitigation of
/// side channel leaks on a cryptography library.
///
/// Currently, this pass cannot handle functions contanining loops.
class Pass : public llvm::PassInfoMixin<Pass> {
  public:
    /// A constructor that takes the name of functions to be transformed and a
    /// boolean indicating if this pass should insert the length of pointer
    /// arguments.
    Pass(std::set<llvm::StringRef> Names = {}) : Names(Names){};

    /// Traverses the module \p M transforming functions into isochronous
    /// versions. If FNames is not empty, then we transform only the functions
    /// in there and skip the others.
    ///
    /// \returns the set of analyses preserved after running this pass.
    llvm::PreservedAnalyses run(llvm::Module &M,
                                llvm::ModuleAnalysisManager &MAM);

  private:
    /// A set storing the name of the functions that should be transformed.
    std::set<llvm::StringRef> Names;
};

/// A wrapper for a function F to indicate whether it is derived or not. By
/// derived we mean that F is called directly or indirectly by another function
/// G. We also store both the map of incoming and outgoing conditions, as well
/// as instructions that we should skip.
struct FuncWrapper {
    llvm::Function *F;
    bool IsDerived;
    cond::OutMap OutM;
    cond::InMap InM;
    std::set<llvm::Value *> Skip;
};

/// Searches for the derived functions from \p Fns, i.e. each function called
/// by F as well as the ones called by F's callees and so on.
///
/// \returns a set of the functions collected.
std::set<llvm::Function *> findDerived(llvm::Module &M,
                                       const std::set<llvm::Function *> Fns);

/// Traverses the list of arguments of F to match each pointer with its
/// length. Also infers the length of local pointers.
llvm::DenseMap<const llvm::Value *, llvm::Value *>
computeLength(llvm::Function &F, const llvm::TargetLibraryInfo *TLI);

/// For each funtion F in \p M, transforms F's signature by inserting  an
/// argument for the length of each pointer. If F is marked as a function
/// derived from another function, we also add a boolean argument indicating
/// the incoming condition of the entry block of F.
void prepareModule(llvm::Module &M, llvm::SmallVectorImpl<FuncWrapper *> &Fns,
                   llvm::FunctionAnalysisManager &FAM);

/// We cannot transform properly functions that have multiple return points, so
/// we replace multiple returns by a combination of phis + uncond. jmps.
void prepareFunc(llvm::Function &F);

/// Transform \p F into isochronous by applying the proper rules to each
/// instruction.
void transformFunc(const FuncWrapper &W, llvm::FunctionAnalysisManager &FAM);

/// Transforms \p Phi into a set of instructions according to the incoming
/// conditions of the basic block that contains \Phi.
///
/// Note: If the transformation occurs, \p Phi is removed from the basic
/// block.
void transformPhi(llvm::PHINode &Phi,
                  const llvm::SmallVectorImpl<cond::Incoming> &InV);

/// Transforms \p Load into a set of instructions according to the outgoing
/// condition of the basic block (i.e. the fold of the incoming conds.) that
/// contains \p Load.
void transformLoad(llvm::LoadInst &Load, llvm::AllocaInst *Shadow,
                   llvm::Value *PtrLen, llvm::Value *Cond);

/// Transforms \p Store into a set of instructions according to the incoming
/// conditions of the basic block that contains \p Store.
void transformStore(llvm::StoreInst &Store, llvm::AllocaInst *Shadow,
                    llvm::Value *PtrLen, llvm::Value *Cond);

/// Transforms \p GEP into a set of instructions according to \p Cond and
/// \p PtrLen.
///
/// \returns The llvm value representing the select between GEP and Shadow.
llvm::Value *transformGEP(llvm::GetElementPtrInst *GEP,
                          llvm::AllocaInst *Shadow, llvm::Value *PtrLen,
                          llvm::Value *Cond, llvm::Instruction *Before);

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
} // namespace isochronous

#endif

//===-- Isochronous.cpp ---------------------------------------------------===//
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
/// This file contains the implementation of the Isochronous Pass, a function
/// pass that transforms a function F into a version that is isochronous. This
/// pass expects each pointer argument of F to be followed by an integer
/// argument representing its length.
///
//===----------------------------------------------------------------------===//

#include "Analysis/Taint.h"
#include "Transform/Func.h"
#include "Transform/Isochronous.h"

#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/DenseSet.h>
#include <llvm/ADT/PostOrderIterator.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/CallGraph.h>
#include <llvm/Analysis/PostDominators.h>
#include <llvm/Analysis/TargetLibraryInfo.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Support/Casting.h>

using namespace lif::analysis;

llvm::PreservedAnalyses lif::transform::IsochronousPass::run(
    llvm::Module &M, llvm::ModuleAnalysisManager &MAM
) {
    TaintedInfo Tainted = MAM.getResult<analysis::TaintAnalysis>(M);

    auto &CG = MAM.getResult<llvm::CallGraphAnalysis>(M);
    llvm::ReversePostOrderTraversal<llvm::CallGraph *> RPOT(&CG);

    // If there's at least one call site of a function F within the
    // influence region of a tainted branch, we consider F itself as
    // within the tainted influence region.
    llvm::SmallDenseSet<llvm::Function *> TaintedCallees;

    // Map from old version of functions, which had their interface
    // modified, to their new versions.
    llvm::SmallDenseMap<llvm::Function *, llvm::Function *> Replace;

    llvm::DenseMap<llvm::Type *, llvm::Type *> WrappedTypes;
    llvm::DenseMap<llvm::Type *, llvm::Type *> UnwrappedTypes;
    llvm::DenseMap<llvm::Function *, std::unique_ptr<FuncWrapper>> WrappedFuncs;

    auto &Ctx = M.getContext();
    auto &FAM = MAM.getResult<llvm::FunctionAnalysisManagerModuleProxy>(M)
        .getManager();

    for (auto It = RPOT.begin(), End = RPOT.end(); It != End; ++It) {
        auto F = (*It)->getFunction();
        if (!F || F->isDeclaration()) continue;

        bool IsTaintedCallee = TaintedCallees.contains(F);
        // Augment the interface. This step may broke the call sites,
        // which we shall fix later on,
        llvm::Function *NewF = augmentInterface(
            *F, WrappedTypes, UnwrappedTypes, IsTaintedCallee);

        // If F is untouched, keep using it; otherwise, replace with NewF:
        if (NewF) {
            if (TaintedCallees.contains(F)) TaintedCallees.insert(NewF);
            for (size_t Idx = 0; Idx < F->arg_size(); Idx++) {
                auto Arg = F->getArg(Idx);
                if (Tainted.contains(Arg)) Tainted.insert(NewF->getArg(Idx));
            }
            Replace[F] = NewF;
            F = NewF;
        }

        WrappedFuncs[F] = std::make_unique<FuncWrapper>(
            wrapFunc(*F, Tainted, FAM));
        auto FW = WrappedFuncs[F].get();

        llvm::DenseSet<llvm::BasicBlock *> Visited;
        auto &PDT = FAM.getResult<llvm::PostDominatorTreeAnalysis>(*F);

        // Traverse the influence regions of tainted branches, searching
        // for calls so that we can identify the functions that require
        // interprocedural intervention.
        for (auto &MaybeTaintedBB : FW->F) {
            if (!Tainted.contains(&MaybeTaintedBB)) continue;

            auto TaintedBB = &MaybeTaintedBB;
            auto PDom = PDT.getNode(TaintedBB)->getIDom()->getBlock();

            for (auto BB : influenceRegion(TaintedBB, PDom)) {
                if (Visited.contains(BB)) continue;
                for (auto &I : *BB) {
                    auto Call = llvm::dyn_cast<llvm::CallInst>(&I);
                    if (!Call) continue;
                    auto Callee = Call->getCalledFunction();
                    TaintedCallees.insert(Callee);
                }
                Visited.insert(BB);
            }
        }

        if (!IsTaintedCallee) continue;

        auto &Entry = F->getEntryBlock();
        auto NewEntry = llvm::BasicBlock::Create(Ctx, "", F, &Entry);
        llvm::BranchInst::Create(&Entry, NewEntry);

        // Set the incoming condition of the old entry block. The incoming
        // condition is the argument inserted by the augmentInterfaces
        // function, which is always the last argument.
        auto Cond = F->getArg(F->arg_size() - 1);
        FW->IM[&Entry][NewEntry] = Cond;
    }

    // Fix call sites of functions that had their interface modified:
    for (auto [OldF, NewF] : Replace) {
        bool IsTaintedCallee = TaintedCallees.contains(NewF);
        fixCallSites(OldF, NewF, IsTaintedCallee, WrappedFuncs, WrappedTypes);
    }

    for (auto &F : M) {
        if (F.isDeclaration()) continue;

        const auto &TLI = FAM.getResult<llvm::TargetLibraryAnalysis>(F);
        LenMap LM = inferLength(F, UnwrappedTypes, &TLI);
        rewriteFunc(WrappedFuncs[&F].get(), LM, FAM);
    }

    // for (auto &F : M) {
    //     if (F.isDeclaration()) continue;
    //     llvm::errs() << "===== " << F.getName() << " (Tainted? "
    //                  << TaintedCallees.contains(&F) << ") =====\n";
    //     for (auto &Arg : F.args())
    //         llvm::errs() << Arg << "\t" << "Tainted? "
    //                      << Tainted.contains(&Arg) << "\n";

    //     llvm::errs() << "++++++";
    //     for (auto _ : F.getName()) llvm::errs() << "+";
    //     llvm::errs() << "+++++++++++++++++++\n";

    //     for (auto &BB : F) {
    //         llvm::errs() << BB.getName() << " (BB tainted? "
    //                      << Tainted.contains(&BB) << "):\n";
    //         for (auto &I : BB)
    //             llvm::errs() << I << "\t" << "Tainted? "
    //                          << Tainted.contains(&I) << "\n";
    //     }

    //     llvm::errs() << "======";
    //     for (auto _ : F.getName()) llvm::errs() << "=";
    //     llvm::errs() << "===================\n\n";
    // }

    return llvm::PreservedAnalyses::none();
}

//===-- Module.cpp --------------------------------------------------------===//
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
/// This file contains the implementation of some module-related utilities used
/// by both the data-flow analysis and the isochronous pass.
///
//===----------------------------------------------------------------------===//

#include "Module.h"
#include "Cond.h"
#include "Func.h"

#include <llvm/ADT/DenseMap.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/TargetLibraryInfo.h>
#include <llvm/IR/Argument.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Support/Casting.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>

#include <memory>
#include <stack>

using namespace lif;

llvm::SmallPtrSet<llvm::Function *, 32>
lif::findDerived(llvm::Module &M,
                 const llvm::SmallPtrSetImpl<llvm::Function *> &Fs) {
    llvm::SmallPtrSet<llvm::Function *, 32> Derived;

    // Search for the derived functions, i.e. functions called by the ones that
    // initially should be transformed.
    std::stack<llvm::Function *> S;
    auto PushCalls = [&](llvm::Function &F) {
        for (auto &BB : F)
            for (auto &I : BB) {
                auto Call = llvm::dyn_cast<llvm::CallInst>(&I);
                if (!Call) continue;

                auto G = Call->getCalledFunction();
                if (!G->isDeclaration() && Derived.count(G)) S.push(G);
            }
    };

    // Initialize the stack with the functions called by the ones that should
    // be transformed.
    for (auto F : Fs) PushCalls(*F);

    // For each function F in the stack S, insert F in the derived list and
    // push all functions called by F to the stack.
    while (!S.empty()) {
        auto G = S.top();
        S.pop();
        Derived.insert(G);
        PushCalls(*G);
    }

    return Derived;
}

namespace {
struct AugmentInfo {
    /// Set of functions that had their interfaces augmented and thus need
    /// fixes on their calling sites (their new versions).
    llvm::SmallPtrSet<llvm::Function *, 16> NeedFix;
    /// Map from a new function to is old version.
    llvm::SmallDenseMap<llvm::Function *, llvm::Function *, 16> Replace;
    /// Map from a function and the length of its values.
    llvm::SmallDenseMap<llvm::Function *, LenMap, 32> FLen;
    /// Map from a function and its index in a list of functions.
    llvm::SmallDenseMap<llvm::Function *, size_t, 32> FIdx;
    /// Map from arguments old indices' to their new indices.
    llvm::SmallDenseMap<llvm::Function *,
                        llvm::SmallDenseMap<size_t, size_t, 8>, 32>
        FArgIdx;
};
} // namespace

/// Takes a list of functions \p Fs and augment the interface of the functions
/// that take at least one pointer to include ptr lengths. In addition, augment
/// the interface of derived functions to include a condition argument.
///
/// \returns the functions that were modified, their old versions, a map from
/// function to the lengths of their values and the index of such functions in
/// the \p Fs vector.
static std::unique_ptr<AugmentInfo>
augmentInterfaces(llvm::SmallVectorImpl<std::pair<llvm::Function *, bool>> &Fs,
                  llvm::Module &M, llvm::FunctionAnalysisManager &FAM) {
    AugmentInfo Info;

    size_t Idx = 0;
    for (auto [F, _] : Fs) Info.FIdx[F] = Idx++;

    auto GetTLI = [&FAM](llvm::Function &F) {
        return &FAM.getResult<llvm::TargetLibraryAnalysis>(F);
    };

    llvm::LLVMContext &Ctx = M.getContext();

    // We modify all functions from M, not only the ones that will be
    // transformed to isochronous, because we need the length arguments in
    // order to "computeLength" work.
    for (auto &F : M) {
        if (F.isDeclaration()) continue;

        llvm::SmallVector<llvm::Type *, 16> ArgTypes;
        llvm::SmallVector<llvm::Twine, 16> ArgNames;

        // Keep track of the new indices of each old argument.
        llvm::SmallDenseMap<llvm::Argument *, size_t, 8> ArgIdx;
        size_t Idx = 0;
        unsigned NumPtrArgs = 0;

        // Start by collecting the argument types as well as their names.
        for (auto &Arg : F.args()) {
            ArgTypes.push_back(Arg.getType());
            llvm::Twine Name(Arg.getName());
            ArgNames.push_back(Name);
            ArgIdx[&Arg] = Idx;

            // If Arg is a pointer, we add a new int64 argument.
            if (llvm::isa<llvm::PointerType>(Arg.getType())) {
                ArgTypes.push_back(llvm::IntegerType::getInt64Ty(Ctx));
                ArgNames.push_back("N" + Name);
                Idx++;
                NumPtrArgs++;
            }

            Idx++;
        }

        auto IdxIt = Info.FIdx.find(&F);
        bool IsDerived = false;

        if (IdxIt != Info.FIdx.end()) IsDerived = Fs[IdxIt->second].second;

        // If there is any ptr argument, we modify F's signature by inserting
        // args carrying the length of each ptr arg. We also modify the
        // function if it is marked as derived. Else, we just move to the next
        // func.
        if (NumPtrArgs == 0 && !IsDerived) {
            Info.FLen[&F] = computeLength(F, GetTLI(F));
            continue;
        }

        if (IsDerived) {
            ArgTypes.push_back(llvm::IntegerType::getInt1Ty(Ctx));
            ArgNames.push_back(".cond");
        }

        auto FTy = F.getFunctionType();
        auto NewFTy = llvm::FunctionType::get(F.getReturnType(), ArgTypes,
                                              FTy->isVarArg());
        auto NewF =
            llvm::Function::Create(NewFTy, F.getLinkage(), F.getAddressSpace());

        M.getFunctionList().insert(F.getIterator(), NewF);
        NewF->copyAttributesFrom(&F);
        NewF->takeName(&F);

        // Set the new function's argument's names.
        for (size_t i = 0; i < NewF->arg_size(); i++)
            (NewF->arg_begin() + i)->setName(ArgNames[i]);

        // Replace all uses of each old arg & save their old indices.
        Info.FArgIdx[NewF] = llvm::SmallDenseMap<size_t, size_t, 8>();
        for (size_t i = 0; i < F.arg_size(); i++) {
            auto Arg = F.getArg(i);
            Info.FArgIdx[NewF][i] = ArgIdx[Arg];
            Arg->replaceAllUsesWith(NewF->arg_begin() + ArgIdx[Arg]);
        }

        // Patch the pointer to LLVM function in the debug info descriptor.
        NewF->setSubprogram(F.getSubprogram());
        F.setSubprogram(nullptr);

        // Move the function body to the new function.
        NewF->getBasicBlockList().splice(NewF->begin(), F.getBasicBlockList());

        Info.NeedFix.insert(NewF);
        Info.Replace[NewF] = &F;
        Info.FLen[NewF] = computeLength(*NewF, GetTLI(*NewF));

        // Update the pointer to F to point to the new function we've just
        // created.
        if (IdxIt != Info.FIdx.end()) Fs[IdxIt->second] = {NewF, IsDerived};
    }

    return std::make_unique<AugmentInfo>(Info);
}

/// Takes a list of functions \p Fs and, for each function, Compute its path
/// conditions, value lengths and preprocess loops, wrapping everything into a
/// single structure. In addition, if it is a derived function we need to set
/// an incoming condition for the entry block. So, we create a new entry block
/// with an outgoing condition = the boolean argument and jmp to the old entry
/// block.
///
/// \returns A list of wrapped functions.
static llvm::SmallVector<std::unique_ptr<FuncWrapper>, 32> wrapFunctions(
    llvm::SmallVectorImpl<std::pair<llvm::Function *, bool>> &Fs,
    config::Module &Config,
    llvm::SmallDenseMap<llvm::Function *,
                        llvm::SmallDenseMap<size_t, size_t, 8>, 32> &FArgIdx,
    llvm::FunctionAnalysisManager &FAM) {
    llvm::SmallVector<std::unique_ptr<FuncWrapper>, 32> Wrapped;

    for (auto [F, IsDerived] : Fs) {
        auto FW = std::make_unique<FuncWrapper>(wrapFunc(
            *F, Config[F->getName().str()], IsDerived, FArgIdx[F], FAM));

        if (!IsDerived) {
            Wrapped.push_back(std::move(FW));
            continue;
        }

        auto &Entry = F->getEntryBlock();
        auto NewEntry =
            llvm::BasicBlock::Create(F->getContext(), "", F, &Entry);
        llvm::BranchInst::Create(&Entry, NewEntry);

        // Set the incoming condition of the old entry block. The incoming
        // condition is the argument inserted by the augmentInterfaces
        // function, which is always the last argument.
        auto Cond = F->getArg(F->arg_size() - 1);
        FW->IM[&Entry][NewEntry] = Cond;

        // Similarly, set the outgoing condition of the old entry block. Notice
        // that the old entry block had none incoming edge before and thus its
        // old outgoing condition was set to true. Now, it has a single
        // incoming edge, whose outgoing condition implicitly equals to the new
        // added condition argument.
        auto OutVal = FW->OM[&Entry].first;
        auto I = *std::next(OutVal->user_begin(), OutVal->getNumUses() - 1);
        llvm::cast<llvm::StoreInst>(I)->setOperand(0, Cond);

        Wrapped.push_back(std::move(FW));
    }

    return Wrapped;
}

/// Takes the result \p Info of the augmentInterfaces function, and fixes the
/// call sites of the functions that were modified by augmentInterfaces. It
/// also takes a list \p Wrapped of wrapped functions that shall be
/// isochronified, so we can have access to their outgoing & incoming
/// conditions, if necessary.
static void
fixCallSites(AugmentInfo *Info,
             llvm::SmallVectorImpl<std::unique_ptr<FuncWrapper>> &Wrapped) {
    auto FIdxEnd = Info->FIdx.end();
    // Check for calls to the modified functions and replace them with a new
    // call passing the length of each ptr arg.
    for (auto NewF : Info->NeedFix) {
        auto OldF = Info->Replace[NewF];
        while (!OldF->use_empty()) {
            auto U = OldF->user_back();

            // If CS is not a call, then probably it is storing F's address so
            // it can be used as an indirect call somewhere. This is hard to
            // track and even hard to fix, so we currently does not support.
            // We just replace the use of F by NewF so we can move to the next
            // user.
            if (!llvm::isa<llvm::CallInst>(U)) {
                U->replaceUsesOfWith(OldF, NewF);
                llvm::errs()
                    << "Warning: cannot handle possible indirect calls to "
                    << NewF->getName() << "!\n";
                continue;
            }

            auto Call = llvm::cast<llvm::CallInst>(U);
            assert(Call->getCalledFunction() == OldF);
            llvm::SmallVector<llvm::Value *, 16> Args;

            size_t Idx = 0;
            for (auto &Arg : Call->args()) {
                Args.push_back(Arg);
                Idx++;

                if (!llvm::isa<llvm::PointerType>(Arg->getType())) continue;

                auto Len = Info->FLen[Call->getCaller()][Arg];
                auto LenArgTy = (NewF->arg_begin() + Idx)->getType();

                if (Len->getType()->getScalarSizeInBits() <
                    LenArgTy->getScalarSizeInBits())
                    Len = new llvm::SExtInst(Len, LenArgTy, "", Call);

                Args.push_back(Len);
                Idx++;
            }

            // If NewF/OldF is a derived function, we need to pass the incoming
            // condition of the current basic block as argument.
            auto IdxIt = Info->FIdx.find(OldF);
            if (IdxIt != FIdxEnd && Wrapped[IdxIt->second]->IsDerived) {
                // If the caller won't be transformed to invariant, this means
                // that it does not have any incoming condition defined, so we
                // just pass true.
                llvm::Value *C = llvm::ConstantInt::getTrue(NewF->getContext());
                auto IdxIt = Info->FIdx.find(Call->getCaller());

                if (IdxIt != FIdxEnd) {
                    auto In = Wrapped[IdxIt->second]->IM[Call->getParent()];
                    C = fold(In, Call, *Wrapped[IdxIt->second]->LW);
                }

                Args.push_back(C);
            }

            auto NewCall = llvm::CallInst::Create(NewF, Args);
            NewCall->setCallingConv(NewF->getCallingConv());

            if (!Call->use_empty()) Call->replaceAllUsesWith(NewCall);
            llvm::ReplaceInstWithInst(Call, NewCall);
        }

        // Now we can safely remove this function from the current module.
        OldF->eraseFromParent();
    }
}

llvm::SmallVector<std::unique_ptr<FuncWrapper>, 32>
lif::prepareModule(llvm::SmallVectorImpl<std::pair<llvm::Function *, bool>> &Fs,
                   config::Module &Config, llvm::Module &M,
                   llvm::FunctionAnalysisManager &FAM) {
    // ==================== Phase 1 ====================
    // Augment the interface of some functions.
    auto Info = augmentInterfaces(Fs, M, FAM);

    // ==================== Phase 2 ====================
    // Compute path conditions, value lengths, preprocess loops and create new
    // entry blocks whenever necessary.
    auto Wrapped = wrapFunctions(Fs, Config, Info->FArgIdx, FAM);

    // ==================== Phase 3 ====================
    // Finally, we need to fix the call sites, since some functions were
    // replaced by new ones in phase 1.
    fixCallSites(Info.get(), Wrapped);

    return Wrapped;
}

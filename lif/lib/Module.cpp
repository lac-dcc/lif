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
#include <llvm/ADT/DenseSet.h>
#include <llvm/ADT/SmallPtrSet.h>
#include <llvm/ADT/SmallVector.h>
#include <llvm/Analysis/TargetLibraryInfo.h>
#include <llvm/IR/Argument.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Operator.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Support/Casting.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>

#include <memory>
#include <stack>
#include <string>

using namespace lif;

static llvm::Type *wrapPointer(llvm::LLVMContext &Ctx,
                                    llvm::PointerType *PTy) {
    auto ElementTy = PTy->getElementType();

    std::string Name;
    llvm::raw_string_ostream OS(Name);
    ElementTy->print(OS);
    Name += "ptr.wrapped.ty";

    auto Int64Ty = llvm::IntegerType::getInt64Ty(Ctx);
    auto Wrapped = llvm::StructType::create({PTy, Int64Ty}, Name);

    return llvm::PointerType::get(Wrapped, 0);
}

static llvm::Type *
extendStruct(llvm::LLVMContext &Ctx, llvm::StructType *StructTy,
             llvm::DenseMap<llvm::Type *, llvm::Type *> &WrappedTypes,
             llvm::DenseMap<llvm::Type *, llvm::Type *> &UnwrappedTypes) {
    auto TypeName =
        (StructTy->hasName() ? StructTy->getName().str() : "struct") +
        ".extended.ty";

    std::vector<llvm::Type *> FieldTypes;
    bool HasFieldWrapped = false;
    for (size_t I = 0; I < StructTy->getNumElements(); I++) {
        auto FieldTy = StructTy->getTypeAtIndex(I);
        auto PtrTy = llvm::dyn_cast<llvm::PointerType>(FieldTy);

        if (!PtrTy) {
            FieldTypes.push_back(FieldTy);
            continue;
        }

        if (WrappedTypes.count(PtrTy)) {
            FieldTypes.push_back(WrappedTypes[PtrTy]);
            continue;
        }

        auto WrappedTy = wrapPointer(Ctx, PtrTy);

        WrappedTypes[PtrTy] = WrappedTy;
        UnwrappedTypes[WrappedTy] = PtrTy;

        FieldTypes.push_back(WrappedTy);
        HasFieldWrapped = true;
    }

    return HasFieldWrapped ? llvm::StructType::create(FieldTypes, TypeName)
                           : StructTy;
}

ModuleWrapper lif::wrapModule(llvm::Module &M) {
    ModuleWrapper MW(M);
    auto &Ctx = M.getContext();

    for (auto &F : M) {
        for (auto &Arg : F.args()) {
            auto ArgTy = Arg.getType();
            if (MW.WrappedTypes.count(ArgTy)) continue;

            auto PtrTy = llvm::dyn_cast<llvm::PointerType>(ArgTy);
            if (!PtrTy) continue;

            auto ElTy = PtrTy->getElementType();
            auto StructTy = llvm::dyn_cast<llvm::StructType>(ElTy);

            if (!StructTy) {
                auto WrappedPtrTy = wrapPointer(Ctx, PtrTy);
                MW.WrappedTypes[PtrTy] = WrappedPtrTy;
                MW.UnwrappedTypes[WrappedPtrTy] = PtrTy;
                continue;
            }

            auto ExtStructTy =
                extendStruct(Ctx, StructTy, MW.WrappedTypes, MW.UnwrappedTypes);

            if (ExtStructTy != StructTy) {
                auto WrappedStructTy = llvm::PointerType::get(ExtStructTy, 0);
                MW.WrappedTypes[PtrTy] = WrappedStructTy;
                MW.UnwrappedTypes[WrappedStructTy] = PtrTy;
            }
        }
    }

    return MW;
}

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
                if (!G->isDeclaration() && !Derived.count(G)) S.push(G);
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

/// Takes a map \p Fs from functions that shall have their interface
/// modified to a boolean indicating whether they are derived or not. For
/// derived functions, we additionally augment their interface with an argument
/// that represents its entry condition.
///
/// \returns a (possibly) updated version of \p Fs.
static llvm::DenseMap<llvm::Function *, bool>
augmentInterfaces(ModuleWrapper *MW,
                  llvm::DenseMap<llvm::Function *, bool> &Fs) {
    llvm::DenseMap<llvm::Function *, bool> UpdatedFs;

    auto &Ctx = MW->M.getContext();
    auto BoolTy = llvm::IntegerType::getInt1Ty(Ctx);
    auto Int32Ty = llvm::IntegerType::getInt32Ty(Ctx);
    auto Zero = llvm::ConstantInt::get(Int32Ty, 0);

    for (auto [F, IsDerived] : Fs) {
        if (F->isDeclaration()) continue;

        llvm::SmallVector<llvm::Type *, 16> ArgTypes;
        llvm::SmallVector<llvm::StringRef, 16> ArgNames;

        // Store the indices of the arguments that are going to be modified.
        std::set<size_t> ModifiedArgIdx;

        // Start by collecting the argument types as well as their names.
        for (size_t I = 0; I < F->arg_size(); I++) {
            auto Arg = F->getArg(I);
            auto ArgTy = Arg->getType();

            ArgNames.push_back(Arg->getName());

            if (MW->WrappedTypes.count(ArgTy)) {
                ArgTypes.push_back(MW->WrappedTypes[ArgTy]);
                ModifiedArgIdx.insert(I);
            } else {
                ArgTypes.push_back(ArgTy);
            }
        }

        // If there is any pointer or structs storing pointers, we modify
        // the function signature, replacing such arguments with their
        // extended/wrapped version. We also modify the function if it is
        // marked as derived. Else, we just move to the next func.
        if (ModifiedArgIdx.empty() && !IsDerived) {
            UpdatedFs[F] = IsDerived;
            continue;
        }

        if (IsDerived) {
            ArgTypes.push_back(BoolTy);
            ArgNames.push_back("entry.cond");
        }

        auto FTy = F->getFunctionType();
        auto NewFTy = llvm::FunctionType::get(F->getReturnType(), ArgTypes,
                                              FTy->isVarArg());
        auto NewF = llvm::Function::Create(NewFTy, F->getLinkage(),
                                           F->getAddressSpace());

        MW->M.getFunctionList().insert(F->getIterator(), NewF);
        NewF->copyAttributesFrom(F);
        NewF->takeName(F);

        // Patch the pointer to LLVM function in the debug info descriptor:
        NewF->setSubprogram(F->getSubprogram());
        F->setSubprogram(nullptr);

        // Move the function body to the new function:
        NewF->getBasicBlockList().splice(NewF->begin(), F->getBasicBlockList());

        // Set the new function's argument's names:
        for (size_t Idx = 0; Idx < NewF->arg_size(); Idx++) {
            auto NewArg = NewF->getArg(Idx);
            NewArg->setName(ArgNames[Idx]);
            if (!ModifiedArgIdx.count(Idx) && Idx < F->arg_size())
                F->getArg(Idx)->replaceAllUsesWith(NewArg);
        }

        // Replace all uses of each old arg:
        auto InsertionPoint = NewF->getEntryBlock().getFirstNonPHI();
        for (auto Idx : ModifiedArgIdx) {
            auto Arg = F->getArg(Idx);
            auto ArgTy = Arg->getType();

            assert(ArgTy->isPointerTy());
            auto ArgElTy = ArgTy->getPointerElementType();

            auto NewArg = NewF->arg_begin() + Idx;
            auto NewArgTy = NewArg->getType();
            auto NewArgElTy = NewArgTy->getPointerElementType();

            auto Name = NewArg->hasName() ? NewArg->getName().str() : "arg";
            auto StructTy = llvm::dyn_cast<llvm::StructType>(ArgElTy);

            if (!StructTy) {
                auto GEP = llvm::GetElementPtrInst::CreateInBounds(
                    NewArgElTy, NewArg, {Zero, Zero}, "", InsertionPoint);
                Arg->replaceAllUsesWith(new llvm::LoadInst(
                    GEP->getType()->getPointerElementType(), GEP,
                    Name + ".unwrapped", InsertionPoint));
                continue;
            }

            for (auto &Use : Arg->uses()) {
                auto User = Use.getUser();
                auto GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(User);

                if (!GEP) {
                    Use.set(NewArg);
                    continue;
                }

                assert(GEP->getOperand(0) == Arg);
                auto FIdx = llvm::cast<llvm::ConstantInt>(GEP->getOperand(2));
                auto Idx = FIdx->getZExtValue();
                auto FieldTy = StructTy->getTypeAtIndex(FIdx);

                std::vector<llvm::Value *> Indices(
                    GEP->idx_begin(), GEP->idx_end());

                auto StructGEP = llvm::GetElementPtrInst::Create(
                    NewArgElTy, NewArg, Indices, "", GEP);

                StructGEP->setIsInBounds(GEP->isInBounds());
                StructGEP->takeName(GEP);

                if (!MW->WrappedTypes[FieldTy]) {
                    GEP->replaceAllUsesWith(StructGEP);
                    GEP->removeFromParent();
                    continue;
                }

                // If we're accessing a field that is a pointer, we need to
                // get through the struct wrapping this pointer. For that,
                // we add a second GEP:
                auto UnwrapLoad = new llvm::LoadInst(
                    StructGEP->getResultElementType(), StructGEP, "", GEP);

                auto UnwrapGEP = llvm::GetElementPtrInst::CreateInBounds(
                    UnwrapLoad->getType()->getPointerElementType(),
                    UnwrapLoad, {Zero, Zero},
                    Name + ".field" + std::to_string(Idx) + ".unwrapped", GEP);

                GEP->replaceAllUsesWith(UnwrapGEP);
                GEP->removeFromParent();
            }
        }

        MW->NeedFix.push_back(NewF);
        MW->Replace[NewF] = F;

        UpdatedFs[NewF] = IsDerived;
    }

    return UpdatedFs;
}

/// Takes a list of functions \p Fs and, for each function, Compute its
/// path conditions, tainted values and preprocess loops, wrapping everything
/// into a single structure. In addition, if it is a derived function we need to
/// set an incoming condition for the entry block. So, we create a new entry
/// block with an outgoing condition = the boolean argument and a jmp to the old
/// entry block.
///
/// \returns A list of wrapped functions.
static llvm::SmallVector<std::unique_ptr<FuncWrapper>, 32>
wrapFunctions(llvm::DenseMap<llvm::Function *, bool> &Fs,
              config::Module &Config, llvm::FunctionAnalysisManager &FAM) {
    llvm::SmallVector<std::unique_ptr<FuncWrapper>, 32> Wrapped;

    for (auto [F, IsDerived] : Fs) {
        auto FW = std::make_unique<FuncWrapper>(
            wrapFunc(*F, Config[F->getName().str()], IsDerived, FAM));

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

// Takes a map from functions -- which shall be isochronified -- to their
// wrapped versions and fixes the call sites of such functions to encompass the
// changes made to their interfaces.
static void
fixCallSites(ModuleWrapper *MW,
             llvm::DenseMap<llvm::Function *, FuncWrapper *> Wrapped) {
    auto &Ctx = MW->M.getContext();
    auto Int32Ty = llvm::IntegerType::getInt32Ty(Ctx);
    auto Zero = llvm::ConstantInt::get(Int32Ty, 0);
    // Check for calls to the modified functions and replace them with a new
    // call passing the length of each ptr arg.
    for (auto NewF : MW->NeedFix) {
        assert(
            Wrapped.count(NewF) &&
            "error: couldn't find wrapped version of function to be repaired!");

        auto F = MW->Replace[NewF];
        while (!F->use_empty()) {
            auto U = F->user_back();

            // If CS is not a call, then it's probably storing F's address so it
            // can be used as an indirect call somewhere. This is hard to track
            // and even hard to fix, so we currently does not support.
            assert(llvm::isa<llvm::CallInst>(U) &&
                   "error: cannot handle possible indirect calls!");

            auto Call = llvm::cast<llvm::CallInst>(U);
            assert(Call->getCalledFunction() == F);

            auto Caller = Call->getCaller();
            auto InsertionPoint = Caller->getEntryBlock().getFirstNonPHI();

            llvm::SmallVector<llvm::Value *, 16> Args;
            for (size_t I = 0; I < Call->arg_size(); I++) {
                auto Arg = Call->getArgOperand(I);
                auto ArgTy = Arg->getType();

                if (!MW->WrappedTypes.count(ArgTy)) {
                    Args.push_back(Arg);
                    continue;
                }

                assert(ArgTy->isPointerTy());
                auto ArgElTy = ArgTy->getPointerElementType();
                auto Name = Arg->hasName() ? Arg->getName().str() : "arg";

                auto NewArgTy = NewF->getArg(I)->getType();
                auto NewArgElTy = NewArgTy->getPointerElementType();

                auto Alloca = new llvm::AllocaInst(
                    NewArgElTy, 0, Name + ".wrapped", InsertionPoint);

                Args.push_back(Alloca);

                auto StructTy = llvm::dyn_cast<llvm::StructType>(ArgElTy);
                if (!StructTy) {
                    auto GEP = llvm::GetElementPtrInst::CreateInBounds(
                        NewArgElTy, Alloca, {Zero, Zero},
                        Name + ".unwrapped", Call);
                    new llvm::StoreInst(Arg, GEP, Call);
                    continue;
                }

                for (size_t Idx = 0; Idx < StructTy->getNumElements(); Idx++) {
                    auto FieldName = Name + ".field" + std::to_string(Idx);
                    auto FieldTy = StructTy->getTypeAtIndex(Idx);
                    auto FIdx = llvm::ConstantInt::get(Int32Ty, Idx);

                    auto From = llvm::GetElementPtrInst::CreateInBounds(
                        ArgElTy, Arg, {Zero, FIdx}, FieldName + ".from", Call);

                    if (!MW->WrappedTypes.count(FieldTy)) {
                        auto To = llvm::GetElementPtrInst::CreateInBounds(
                            NewArgElTy, Alloca, {Zero, FIdx},
                            FieldName + ".to", Call);
                        new llvm::StoreInst(
                            new llvm::LoadInst(FieldTy, From, "", Call), To,
                            Call);
                        continue;
                    }

                    auto NewFieldTy = MW->WrappedTypes[FieldTy];
                    assert(NewFieldTy->isPointerTy());

                    auto NewFieldElTy = NewFieldTy->getPointerElementType();
                    auto AllocaField = new llvm::AllocaInst(
                        NewFieldElTy, 0, FieldName + ".wrapped",
                        InsertionPoint);

                    auto To = llvm::GetElementPtrInst::CreateInBounds(
                        NewFieldElTy, AllocaField, {Zero, Zero},
                        FieldName + ".to", Call);

                    new llvm::StoreInst(
                        new llvm::LoadInst(FieldTy, From, "", Call), To, Call);

                    auto WrappedTo = llvm::GetElementPtrInst::CreateInBounds(
                        NewArgElTy, Alloca, {Zero, FIdx},
                        FieldName + ".wrapped.to", Call);

                    new llvm::StoreInst(AllocaField, WrappedTo, Call);
                }
            }

            // If F is a derived function, we need to pass the incoming
            // condition of the current basic block as argument.
            if (Wrapped[NewF]->IsDerived) {
                // If the caller won't be transformed to invariant, this means
                // that it does not have any incoming condition defined, so we
                // just pass true.
                llvm::Value *C = llvm::ConstantInt::getTrue(Ctx);

                if (Wrapped.count(Caller)) {
                    auto In = Wrapped[Caller]->IM[Call->getParent()];
                    C = fold(In, Call, *Wrapped[Caller]->LW);
                }

                Args.push_back(C);
            }

            auto NewCall = llvm::CallInst::Create(NewF, Args);
            NewCall->setCallingConv(NewF->getCallingConv());

            if (!Call->use_empty()) Call->replaceAllUsesWith(NewCall);
            llvm::ReplaceInstWithInst(Call, NewCall);
        }

        // Now we can safely remove this function from the current module.
        F->removeFromParent();
    }
}

llvm::SmallVector<std::unique_ptr<FuncWrapper>, 32>
lif::prepareModule(ModuleWrapper *MW, config::Module &Config,
                   llvm::DenseMap<llvm::Function *, bool> Fs,
                   llvm::FunctionAnalysisManager &FAM) {
    // ==================== Phase 1 ====================
    // Augment the interface of some functions.
    auto UpdatedFs = augmentInterfaces(MW, Fs);

    // ==================== Phase 2 ====================
    // Compute path conditions, tainted values, preprocess loops and create new
    // entry blocks whenever necessary.
    auto Wrapped = wrapFunctions(UpdatedFs, Config, FAM);

    llvm::DenseMap<llvm::Function *, FuncWrapper *> FnToWrapped;
    for (auto &FW : Wrapped) FnToWrapped[&FW->F] = FW.get();

    // ==================== Phase 3 ====================
    // Finally, we need to fix the call sites, since some functions were
    // replaced by new ones in phase 1.
    fixCallSites(MW, FnToWrapped);

    return Wrapped;
}

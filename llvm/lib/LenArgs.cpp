//===-- LenArgs.cpp -------------------------------------------------------===//
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
/// This file contains the implementation of the LenArgs Pass, a module pass
/// that, given a function signature, inserts an integer argument (the length)
/// for each existing pointer argument.
///
//===----------------------------------------------------------------------===//

#include "LenArgs.h"
#include "Util.h"

#include <llvm/Transforms/Utils/BasicBlockUtils.h>

using namespace llvm;

namespace lenargs {
PreservedAnalyses Pass::run(Module &M, ModuleAnalysisManager &MAM) {
    std::vector<Function *> Modified;
    DenseMap<Function *, DenseMap<const llvm::Value *, Value *>> FLenM;
    DenseMap<Function *, Function *> Replace;
    FunctionAnalysisManager &FAM =
        MAM.getResult<FunctionAnalysisManagerModuleProxy>(M).getManager();

    for (auto &F : M) {
        if (F.isDeclaration()) continue;

        SmallVector<Type *, 16> ArgTypes;
        SmallVector<Twine, 16> ArgNames;

        // Keep track of the indices of each old argument.
        DenseMap<Argument *, size_t> ArgIdx;
        size_t Idx = 0;
        unsigned NumPtrArgs = 0;

        // Start by collecting the argument types as well as the names.
        for (auto &Arg : F.args()) {
            ArgTypes.push_back(Arg.getType());
            ArgNames.push_back(Arg.getName());
            ArgIdx[&Arg] = Idx;

            // If Arg is a pointer, we add a new int64 argument.
            if (isa<PointerType>(Arg.getType())) {
                ArgTypes.push_back(IntegerType::getInt64Ty(F.getContext()));
                ArgNames.push_back(Arg.getName() + ".len");
                Idx++;
                NumPtrArgs++;
            }

            Idx++;
        }

        // If there are any ptr argument we modify F signature by inserting
        // args carrying the length of each ptr arg. Else, we just move to the
        // next func.
        if (NumPtrArgs == 0) {
            FLenM[&F] =
                util::getLen(F, &FAM.getResult<TargetLibraryAnalysis>(F));
            continue;
        }

        Modified.push_back(&F);
        auto *FTy = F.getFunctionType();
        auto *NewFTy =
            FunctionType::get(F.getReturnType(), ArgTypes, FTy->isVarArg());

        auto *NewF =
            Function::Create(NewFTy, F.getLinkage(), F.getAddressSpace());
        NewF->copyAttributesFrom(&F);
        NewF->setComdat(F.getComdat());
        M.getFunctionList().insert(F.getIterator(), NewF);
        NewF->takeName(&F);

        // Set the new function's argument's names.
        for (size_t i = 0; i < NewF->arg_size(); i++)
            (NewF->arg_begin() + i)->setName(ArgNames[i]);

        // Replace all uses of each old arg.
        for (auto &Arg : F.args())
            Arg.replaceAllUsesWith(NewF->arg_begin() + ArgIdx[&Arg]);

        // Patch the pointer to LLVM function in debug info descriptor.
        NewF->setSubprogram(F.getSubprogram());
        F.setSubprogram(nullptr);

        // Move over the function body to the new function.
        NewF->getBasicBlockList().splice(NewF->begin(), F.getBasicBlockList());

        Replace[&F] = NewF;
        FLenM[NewF] =
            util::getLen(*NewF, &FAM.getResult<TargetLibraryAnalysis>(*NewF));
    }

    // Check for calls to the modified functions and replace them by a new call
    // passing the length of each ptr arg.
    for (auto *F : Modified) {
        while (!F->use_empty()) {
            CallSite CS(F->user_back());
            assert(CS.getCalledFunction() == F);

            SmallVector<Value *, 16> Args;
            CallInst *Call = cast<CallInst>(CS.getInstruction());

            auto *NewF = Replace[F];
            size_t Idx = 0;

            for (auto &Arg : CS.args()) {
                Args.push_back(Arg);
                Idx++;

                if (!isa<PointerType>(Arg->getType())) continue;

                auto *Len = FLenM[CS.getCaller()][Arg];
                auto *LenArgTy = (NewF->arg_begin() + Idx)->getType();

                if (Len->getType()->getScalarSizeInBits() <
                    LenArgTy->getScalarSizeInBits())
                    Len = new SExtInst(Len, LenArgTy, "", Call);

                Args.push_back(Len);
                Idx++;
            }

            CallInst *NewCall = CallInst::Create(NewF, Args);
            NewCall->setCallingConv(NewF->getCallingConv());

            if (!Call->use_empty()) Call->replaceAllUsesWith(NewCall);

            ReplaceInstWithInst(Call, NewCall);
        }

        // Now we safely can remove this function from the current module.
        F->eraseFromParent();
    }

    // TODO: check for preserved analyses.
    return PreservedAnalyses::none();
}
} // namespace lenargs

; ModuleID = 'llvm-ir/base.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%i8ptr.wrapped.ty = type { i8*, i64 }
%i64ptr.wrapped.ty = type { i64*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [21 x i8] c"lib/curve25519_c64.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.3 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"
@__const.main.basepoint = private unnamed_addr constant <{ i8, [31 x i8] }> <{ i8 9, [31 x i8] zeroinitializer }>, align 16

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i64 @load_limb(%i8ptr.wrapped.ty* noundef %input) #0 {
entry:
  %input.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %input, i32 0, i32 1
  %input.field0.length = load i64, i64* %input.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %input, i32 0, i32 0
  %input.unwrapped = load i8*, i8** %0, align 8
  %arrayidx = getelementptr inbounds i8, i8* %input.unwrapped, i64 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %1 to i64
  %arrayidx1 = getelementptr inbounds i8, i8* %input.unwrapped, i64 1
  %2 = load i8, i8* %arrayidx1, align 1
  %conv2 = zext i8 %2 to i64
  %shl = shl i64 %conv2, 8
  %or = or i64 %conv, %shl
  %arrayidx3 = getelementptr inbounds i8, i8* %input.unwrapped, i64 2
  %3 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %3 to i64
  %shl5 = shl i64 %conv4, 16
  %or6 = or i64 %or, %shl5
  %arrayidx7 = getelementptr inbounds i8, i8* %input.unwrapped, i64 3
  %4 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %4 to i64
  %shl9 = shl i64 %conv8, 24
  %or10 = or i64 %or6, %shl9
  %arrayidx11 = getelementptr inbounds i8, i8* %input.unwrapped, i64 4
  %5 = load i8, i8* %arrayidx11, align 1
  %conv12 = zext i8 %5 to i64
  %shl13 = shl i64 %conv12, 32
  %or14 = or i64 %or10, %shl13
  %arrayidx15 = getelementptr inbounds i8, i8* %input.unwrapped, i64 5
  %6 = load i8, i8* %arrayidx15, align 1
  %conv16 = zext i8 %6 to i64
  %shl17 = shl i64 %conv16, 40
  %or18 = or i64 %or14, %shl17
  %arrayidx19 = getelementptr inbounds i8, i8* %input.unwrapped, i64 6
  %7 = load i8, i8* %arrayidx19, align 1
  %conv20 = zext i8 %7 to i64
  %shl21 = shl i64 %conv20, 48
  %or22 = or i64 %or18, %shl21
  %arrayidx23 = getelementptr inbounds i8, i8* %input.unwrapped, i64 7
  %8 = load i8, i8* %arrayidx23, align 1
  %conv24 = zext i8 %8 to i64
  %shl25 = shl i64 %conv24, 56
  %or26 = or i64 %or22, %shl25
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i64 %or26
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fexpand(%i64ptr.wrapped.ty* noundef %output, %i8ptr.wrapped.ty* noundef %input) #0 {
entry:
  %output.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i32 0, i32 1
  %output.field0.length = load i64, i64* %output.field0.length.ptr, align 8
  %input.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %input, i32 0, i32 1
  %input.field0.length = load i64, i64* %input.field0.length.ptr, align 8
  %arraydecay1.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay4.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay10.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay17.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay24.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i32 0, i32 0
  %output.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %input, i32 0, i32 0
  %input.unwrapped = load i8*, i8** %1, align 8
  %view = alloca [8 x i8], align 1
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay, i8* align 1 %input.unwrapped, i64 8, i1 false)
  %arraydecay1 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arraydecay1.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay1.wrapped, i32 0, i32 0
  %arraydecay1.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay1.wrapped, i32 0, i32 1
  store i64 8, i64* %arraydecay1.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay1, i8** %arraydecay1.unwrapped, align 8
  %call = call i64 @load_limb(%i8ptr.wrapped.ty* %arraydecay1.wrapped)
  %and = and i64 %call, 2251799813685247
  %arrayidx = getelementptr inbounds i64, i64* %output.unwrapped, i64 0
  store i64 %and, i64* %arrayidx, align 8
  %arraydecay2 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx3 = getelementptr inbounds i8, i8* %input.unwrapped, i64 6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay2, i8* align 1 %arrayidx3, i64 8, i1 false)
  %arraydecay4 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arraydecay4.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay4.wrapped, i32 0, i32 0
  %arraydecay4.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay4.wrapped, i32 0, i32 1
  store i64 8, i64* %arraydecay4.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay4, i8** %arraydecay4.unwrapped, align 8
  %call5 = call i64 @load_limb(%i8ptr.wrapped.ty* %arraydecay4.wrapped)
  %shr = lshr i64 %call5, 3
  %and6 = and i64 %shr, 2251799813685247
  %arrayidx7 = getelementptr inbounds i64, i64* %output.unwrapped, i64 1
  store i64 %and6, i64* %arrayidx7, align 8
  %arraydecay8 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx9 = getelementptr inbounds i8, i8* %input.unwrapped, i64 12
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay8, i8* align 1 %arrayidx9, i64 8, i1 false)
  %arraydecay10 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arraydecay10.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay10.wrapped, i32 0, i32 0
  %arraydecay10.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay10.wrapped, i32 0, i32 1
  store i64 8, i64* %arraydecay10.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay10, i8** %arraydecay10.unwrapped, align 8
  %call11 = call i64 @load_limb(%i8ptr.wrapped.ty* %arraydecay10.wrapped)
  %shr12 = lshr i64 %call11, 6
  %and13 = and i64 %shr12, 2251799813685247
  %arrayidx14 = getelementptr inbounds i64, i64* %output.unwrapped, i64 2
  store i64 %and13, i64* %arrayidx14, align 8
  %arraydecay15 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx16 = getelementptr inbounds i8, i8* %input.unwrapped, i64 19
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay15, i8* align 1 %arrayidx16, i64 8, i1 false)
  %arraydecay17 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arraydecay17.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay17.wrapped, i32 0, i32 0
  %arraydecay17.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay17.wrapped, i32 0, i32 1
  store i64 8, i64* %arraydecay17.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay17, i8** %arraydecay17.unwrapped, align 8
  %call18 = call i64 @load_limb(%i8ptr.wrapped.ty* %arraydecay17.wrapped)
  %shr19 = lshr i64 %call18, 1
  %and20 = and i64 %shr19, 2251799813685247
  %arrayidx21 = getelementptr inbounds i64, i64* %output.unwrapped, i64 3
  store i64 %and20, i64* %arrayidx21, align 8
  %arraydecay22 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx23 = getelementptr inbounds i8, i8* %input.unwrapped, i64 24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay22, i8* align 1 %arrayidx23, i64 8, i1 false)
  %arraydecay24 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arraydecay24.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay24.wrapped, i32 0, i32 0
  %arraydecay24.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay24.wrapped, i32 0, i32 1
  store i64 8, i64* %arraydecay24.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay24, i8** %arraydecay24.unwrapped, align 8
  %call25 = call i64 @load_limb(%i8ptr.wrapped.ty* %arraydecay24.wrapped)
  %shr26 = lshr i64 %call25, 12
  %and27 = and i64 %shr26, 2251799813685247
  %arrayidx28 = getelementptr inbounds i64, i64* %output.unwrapped, i64 4
  store i64 %and27, i64* %arrayidx28, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fsum(%i64ptr.wrapped.ty* noundef %output, %i64ptr.wrapped.ty* noundef %input) #0 {
entry:
  %output.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i32 0, i32 1
  %output.field0.length = load i64, i64* %output.field0.length.ptr, align 8
  %input.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i32 0, i32 1
  %input.field0.length = load i64, i64* %input.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i32 0, i32 0
  %output.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i32 0, i32 0
  %input.unwrapped = load i64*, i64** %1, align 8
  %arrayidx = getelementptr inbounds i64, i64* %input.unwrapped, i64 0
  %2 = load i64, i64* %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %output.unwrapped, i64 0
  %3 = load i64, i64* %arrayidx1, align 8
  %add = add i64 %3, %2
  store i64 %add, i64* %arrayidx1, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input.unwrapped, i64 1
  %4 = load i64, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %output.unwrapped, i64 1
  %5 = load i64, i64* %arrayidx3, align 8
  %add4 = add i64 %5, %4
  store i64 %add4, i64* %arrayidx3, align 8
  %arrayidx5 = getelementptr inbounds i64, i64* %input.unwrapped, i64 2
  %6 = load i64, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %output.unwrapped, i64 2
  %7 = load i64, i64* %arrayidx6, align 8
  %add7 = add i64 %7, %6
  store i64 %add7, i64* %arrayidx6, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %input.unwrapped, i64 3
  %8 = load i64, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds i64, i64* %output.unwrapped, i64 3
  %9 = load i64, i64* %arrayidx9, align 8
  %add10 = add i64 %9, %8
  store i64 %add10, i64* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds i64, i64* %input.unwrapped, i64 4
  %10 = load i64, i64* %arrayidx11, align 8
  %arrayidx12 = getelementptr inbounds i64, i64* %output.unwrapped, i64 4
  %11 = load i64, i64* %arrayidx12, align 8
  %add13 = add i64 %11, %10
  store i64 %add13, i64* %arrayidx12, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fdifference_backwards(%i64ptr.wrapped.ty* noundef %out, %i64ptr.wrapped.ty* noundef %input) #0 {
entry:
  %out.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %out, i32 0, i32 1
  %out.field0.length = load i64, i64* %out.field0.length.ptr, align 8
  %input.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i32 0, i32 1
  %input.field0.length = load i64, i64* %input.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %out, i32 0, i32 0
  %out.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i32 0, i32 0
  %input.unwrapped = load i64*, i64** %1, align 8
  %arrayidx = getelementptr inbounds i64, i64* %input.unwrapped, i64 0
  %2 = load i64, i64* %arrayidx, align 8
  %add = add i64 %2, poison
  %arrayidx1 = getelementptr inbounds i64, i64* %out.unwrapped, i64 0
  %3 = load i64, i64* %arrayidx1, align 8
  %sub = sub i64 %add, %3
  %arrayidx2 = getelementptr inbounds i64, i64* %out.unwrapped, i64 0
  store i64 %sub, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %input.unwrapped, i64 1
  %4 = load i64, i64* %arrayidx3, align 8
  %add4 = add i64 %4, poison
  %arrayidx5 = getelementptr inbounds i64, i64* %out.unwrapped, i64 1
  %5 = load i64, i64* %arrayidx5, align 8
  %sub6 = sub i64 %add4, %5
  %arrayidx7 = getelementptr inbounds i64, i64* %out.unwrapped, i64 1
  store i64 %sub6, i64* %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %input.unwrapped, i64 2
  %6 = load i64, i64* %arrayidx8, align 8
  %add9 = add i64 %6, poison
  %arrayidx10 = getelementptr inbounds i64, i64* %out.unwrapped, i64 2
  %7 = load i64, i64* %arrayidx10, align 8
  %sub11 = sub i64 %add9, %7
  %arrayidx12 = getelementptr inbounds i64, i64* %out.unwrapped, i64 2
  store i64 %sub11, i64* %arrayidx12, align 8
  %arrayidx13 = getelementptr inbounds i64, i64* %input.unwrapped, i64 3
  %8 = load i64, i64* %arrayidx13, align 8
  %add14 = add i64 %8, poison
  %arrayidx15 = getelementptr inbounds i64, i64* %out.unwrapped, i64 3
  %9 = load i64, i64* %arrayidx15, align 8
  %sub16 = sub i64 %add14, %9
  %arrayidx17 = getelementptr inbounds i64, i64* %out.unwrapped, i64 3
  store i64 %sub16, i64* %arrayidx17, align 8
  %arrayidx18 = getelementptr inbounds i64, i64* %input.unwrapped, i64 4
  %10 = load i64, i64* %arrayidx18, align 8
  %add19 = add i64 %10, poison
  %arrayidx20 = getelementptr inbounds i64, i64* %out.unwrapped, i64 4
  %11 = load i64, i64* %arrayidx20, align 8
  %sub21 = sub i64 %add19, %11
  %arrayidx22 = getelementptr inbounds i64, i64* %out.unwrapped, i64 4
  store i64 %sub21, i64* %arrayidx22, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fmul(%i64ptr.wrapped.ty* noundef %output, %i64ptr.wrapped.ty* noundef %input2, %i64ptr.wrapped.ty* noundef %input) #0 {
entry:
  %output.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i32 0, i32 1
  %output.field0.length = load i64, i64* %output.field0.length.ptr, align 8
  %input2.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input2, i32 0, i32 1
  %input2.field0.length = load i64, i64* %input2.field0.length.ptr, align 8
  %input.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i32 0, i32 1
  %input.field0.length = load i64, i64* %input.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i32 0, i32 0
  %output.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input2, i32 0, i32 0
  %input2.unwrapped = load i64*, i64** %1, align 8
  %2 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i32 0, i32 0
  %input.unwrapped = load i64*, i64** %2, align 8
  %t = alloca [5 x i64], align 16
  %3 = bitcast [5 x i64]* %t to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false)
  %arrayidx = getelementptr inbounds i64, i64* %input.unwrapped, i64 0
  %4 = load i64, i64* %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %input.unwrapped, i64 1
  %5 = load i64, i64* %arrayidx1, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input.unwrapped, i64 2
  %6 = load i64, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %input.unwrapped, i64 3
  %7 = load i64, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %input.unwrapped, i64 4
  %8 = load i64, i64* %arrayidx4, align 8
  %arrayidx5 = getelementptr inbounds i64, i64* %input2.unwrapped, i64 0
  %9 = load i64, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %input2.unwrapped, i64 1
  %10 = load i64, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds i64, i64* %input2.unwrapped, i64 2
  %11 = load i64, i64* %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %input2.unwrapped, i64 3
  %12 = load i64, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds i64, i64* %input2.unwrapped, i64 4
  %13 = load i64, i64* %arrayidx9, align 8
  %mul = mul i64 %4, %9
  %arrayidx10 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  store i64 %mul, i64* %arrayidx10, align 16
  %mul11 = mul i64 %4, %10
  %mul12 = mul i64 %5, %9
  %add = add i64 %mul11, %mul12
  %arrayidx13 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  store i64 %add, i64* %arrayidx13, align 8
  %mul14 = mul i64 %4, %11
  %mul15 = mul i64 %6, %9
  %add16 = add i64 %mul14, %mul15
  %mul17 = mul i64 %5, %10
  %add18 = add i64 %add16, %mul17
  %arrayidx19 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  store i64 %add18, i64* %arrayidx19, align 16
  %mul20 = mul i64 %4, %12
  %mul21 = mul i64 %7, %9
  %add22 = add i64 %mul20, %mul21
  %mul23 = mul i64 %5, %11
  %add24 = add i64 %add22, %mul23
  %mul25 = mul i64 %6, %10
  %add26 = add i64 %add24, %mul25
  %arrayidx27 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  store i64 %add26, i64* %arrayidx27, align 8
  %mul28 = mul i64 %4, %13
  %mul29 = mul i64 %8, %9
  %add30 = add i64 %mul28, %mul29
  %mul31 = mul i64 %7, %10
  %add32 = add i64 %add30, %mul31
  %mul33 = mul i64 %5, %12
  %add34 = add i64 %add32, %mul33
  %mul35 = mul i64 %6, %11
  %add36 = add i64 %add34, %mul35
  %arrayidx37 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  store i64 %add36, i64* %arrayidx37, align 16
  %mul38 = mul i64 %8, 19
  %mul39 = mul i64 %5, 19
  %mul40 = mul i64 %6, 19
  %mul41 = mul i64 %7, 19
  %mul42 = mul i64 %mul38, %10
  %mul43 = mul i64 %mul39, %13
  %add44 = add i64 %mul42, %mul43
  %mul45 = mul i64 %mul40, %12
  %add46 = add i64 %add44, %mul45
  %mul47 = mul i64 %mul41, %11
  %add48 = add i64 %add46, %mul47
  %arrayidx49 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %14 = load i64, i64* %arrayidx49, align 16
  %add50 = add i64 %14, %add48
  store i64 %add50, i64* %arrayidx49, align 16
  %mul51 = mul i64 %mul38, %11
  %mul52 = mul i64 %mul40, %13
  %add53 = add i64 %mul51, %mul52
  %mul54 = mul i64 %mul41, %12
  %add55 = add i64 %add53, %mul54
  %arrayidx56 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %15 = load i64, i64* %arrayidx56, align 8
  %add57 = add i64 %15, %add55
  store i64 %add57, i64* %arrayidx56, align 8
  %mul58 = mul i64 %mul38, %12
  %mul59 = mul i64 %mul41, %13
  %add60 = add i64 %mul58, %mul59
  %arrayidx61 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %16 = load i64, i64* %arrayidx61, align 16
  %add62 = add i64 %16, %add60
  store i64 %add62, i64* %arrayidx61, align 16
  %mul63 = mul i64 %mul38, %13
  %arrayidx64 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %17 = load i64, i64* %arrayidx64, align 8
  %add65 = add i64 %17, %mul63
  store i64 %add65, i64* %arrayidx64, align 8
  %arrayidx66 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %18 = load i64, i64* %arrayidx66, align 16
  %and = and i64 %18, 2251799813685247
  %arrayidx67 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %19 = load i64, i64* %arrayidx67, align 16
  %shr = lshr i64 %19, 51
  %arrayidx68 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %20 = load i64, i64* %arrayidx68, align 8
  %add69 = add i64 %20, %shr
  store i64 %add69, i64* %arrayidx68, align 8
  %arrayidx70 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %21 = load i64, i64* %arrayidx70, align 8
  %and71 = and i64 %21, 2251799813685247
  %arrayidx72 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %22 = load i64, i64* %arrayidx72, align 8
  %shr73 = lshr i64 %22, 51
  %arrayidx74 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %23 = load i64, i64* %arrayidx74, align 16
  %add75 = add i64 %23, %shr73
  store i64 %add75, i64* %arrayidx74, align 16
  %arrayidx76 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %24 = load i64, i64* %arrayidx76, align 16
  %and77 = and i64 %24, 2251799813685247
  %arrayidx78 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %25 = load i64, i64* %arrayidx78, align 16
  %shr79 = lshr i64 %25, 51
  %arrayidx80 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %26 = load i64, i64* %arrayidx80, align 8
  %add81 = add i64 %26, %shr79
  store i64 %add81, i64* %arrayidx80, align 8
  %arrayidx82 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %27 = load i64, i64* %arrayidx82, align 8
  %and83 = and i64 %27, 2251799813685247
  %arrayidx84 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %28 = load i64, i64* %arrayidx84, align 8
  %shr85 = lshr i64 %28, 51
  %arrayidx86 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %29 = load i64, i64* %arrayidx86, align 16
  %add87 = add i64 %29, %shr85
  store i64 %add87, i64* %arrayidx86, align 16
  %arrayidx88 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %30 = load i64, i64* %arrayidx88, align 16
  %and89 = and i64 %30, 2251799813685247
  %arrayidx90 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %31 = load i64, i64* %arrayidx90, align 16
  %shr91 = lshr i64 %31, 51
  %mul92 = mul i64 %shr91, 19
  %add93 = add i64 %and, %mul92
  %shr94 = lshr i64 %add93, 51
  %and95 = and i64 %add93, 2251799813685247
  %add96 = add i64 %and71, %shr94
  %shr97 = lshr i64 %add96, 51
  %and98 = and i64 %add96, 2251799813685247
  %add99 = add i64 %and77, %shr97
  %arrayidx100 = getelementptr inbounds i64, i64* %output.unwrapped, i64 0
  store i64 %and95, i64* %arrayidx100, align 8
  %arrayidx101 = getelementptr inbounds i64, i64* %output.unwrapped, i64 1
  store i64 %and98, i64* %arrayidx101, align 8
  %arrayidx102 = getelementptr inbounds i64, i64* %output.unwrapped, i64 2
  store i64 %add99, i64* %arrayidx102, align 8
  %arrayidx103 = getelementptr inbounds i64, i64* %output.unwrapped, i64 3
  store i64 %and83, i64* %arrayidx103, align 8
  %arrayidx104 = getelementptr inbounds i64, i64* %output.unwrapped, i64 4
  store i64 %and89, i64* %arrayidx104, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fsquare_times(%i64ptr.wrapped.ty* noundef %output, %i64ptr.wrapped.ty* noundef %input, i64 noundef %count) #0 {
entry:
  %output.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i32 0, i32 1
  %output.field0.length = load i64, i64* %output.field0.length.ptr, align 8
  %input.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i32 0, i32 1
  %input.field0.length = load i64, i64* %input.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.1 = alloca i1, align 1
  store i1 false, i1* %out.1, align 1
  %out.2 = alloca i1, align 1
  store i1 false, i1* %out.2, align 1
  %out.3 = alloca i1, align 1
  store i1 false, i1* %out.3, align 1
  %out.4 = alloca i1, align 1
  store i1 false, i1* %out.4, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.3, align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i32 0, i32 0
  %output.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i32 0, i32 0
  %input.unwrapped = load i64*, i64** %1, align 8
  %t = alloca [5 x i64], align 16
  %2 = bitcast [5 x i64]* %t to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false)
  %arrayidx = getelementptr inbounds i64, i64* %input.unwrapped, i64 0
  %3 = load i64, i64* %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %input.unwrapped, i64 1
  %4 = load i64, i64* %arrayidx1, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input.unwrapped, i64 2
  %5 = load i64, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %input.unwrapped, i64 3
  %6 = load i64, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %input.unwrapped, i64 4
  %7 = load i64, i64* %arrayidx4, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %r4.0.rewritten = phi i64 [ %7, %entry ], [ %and63, %for.inc ]
  %r3.0.rewritten = phi i64 [ %6, %entry ], [ %and57, %for.inc ]
  %r2.0.rewritten = phi i64 [ %5, %entry ], [ %add73, %for.inc ]
  %r1.0.rewritten = phi i64 [ %4, %entry ], [ %and72, %for.inc ]
  %r0.0.rewritten = phi i64 [ %3, %entry ], [ %and69, %for.inc ]
  %i.0.rewritten = phi i64 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %8 = load i1, i1* %out.3, align 1
  %9 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %9
  %cond.fold = or i1 %fwcond.and.fwtaken, %8
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp ult i64 %i.0.rewritten, %count
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load i1, i1* %out.1, align 1
  %in. = and i1 %10, %cmp
  %cond.fold5 = or i1 false, %in.
  store i1 %cond.fold5, i1* %out.2, align 1
  %mul = mul i64 %r0.0.rewritten, 2
  %mul5 = mul i64 %r1.0.rewritten, 2
  %mul6 = mul i64 %r2.0.rewritten, 2
  %mul7 = mul i64 %mul6, 19
  %mul8 = mul i64 %r4.0.rewritten, 19
  %mul9 = mul i64 %mul8, 2
  %mul10 = mul i64 %r0.0.rewritten, %r0.0.rewritten
  %mul11 = mul i64 %mul9, %r1.0.rewritten
  %add = add i64 %mul10, %mul11
  %mul12 = mul i64 %mul7, %r3.0.rewritten
  %add13 = add i64 %add, %mul12
  %arrayidx14 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  store i64 %add13, i64* %arrayidx14, align 16
  %mul15 = mul i64 %mul, %r1.0.rewritten
  %mul16 = mul i64 %mul9, %r2.0.rewritten
  %add17 = add i64 %mul15, %mul16
  %mul18 = mul i64 %r3.0.rewritten, 19
  %mul19 = mul i64 %r3.0.rewritten, %mul18
  %add20 = add i64 %add17, %mul19
  %arrayidx21 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  store i64 %add20, i64* %arrayidx21, align 8
  %mul22 = mul i64 %mul, %r2.0.rewritten
  %mul23 = mul i64 %r1.0.rewritten, %r1.0.rewritten
  %add24 = add i64 %mul22, %mul23
  %mul25 = mul i64 %mul9, %r3.0.rewritten
  %add26 = add i64 %add24, %mul25
  %arrayidx27 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  store i64 %add26, i64* %arrayidx27, align 16
  %mul28 = mul i64 %mul, %r3.0.rewritten
  %mul29 = mul i64 %mul5, %r2.0.rewritten
  %add30 = add i64 %mul28, %mul29
  %mul31 = mul i64 %r4.0.rewritten, %mul8
  %add32 = add i64 %add30, %mul31
  %arrayidx33 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  store i64 %add32, i64* %arrayidx33, align 8
  %mul34 = mul i64 %mul, %r4.0.rewritten
  %mul35 = mul i64 %mul5, %r3.0.rewritten
  %add36 = add i64 %mul34, %mul35
  %mul37 = mul i64 %r2.0.rewritten, %r2.0.rewritten
  %add38 = add i64 %add36, %mul37
  %arrayidx39 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  store i64 %add38, i64* %arrayidx39, align 16
  %arrayidx40 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %11 = load i64, i64* %arrayidx40, align 16
  %and = and i64 %11, 2251799813685247
  %arrayidx41 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %12 = load i64, i64* %arrayidx41, align 16
  %shr = lshr i64 %12, 51
  %arrayidx42 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %13 = load i64, i64* %arrayidx42, align 8
  %add43 = add i64 %13, %shr
  store i64 %add43, i64* %arrayidx42, align 8
  %arrayidx44 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %14 = load i64, i64* %arrayidx44, align 8
  %and45 = and i64 %14, 2251799813685247
  %arrayidx46 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %15 = load i64, i64* %arrayidx46, align 8
  %shr47 = lshr i64 %15, 51
  %arrayidx48 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %16 = load i64, i64* %arrayidx48, align 16
  %add49 = add i64 %16, %shr47
  store i64 %add49, i64* %arrayidx48, align 16
  %arrayidx50 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %17 = load i64, i64* %arrayidx50, align 16
  %and51 = and i64 %17, 2251799813685247
  %arrayidx52 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %18 = load i64, i64* %arrayidx52, align 16
  %shr53 = lshr i64 %18, 51
  %arrayidx54 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %19 = load i64, i64* %arrayidx54, align 8
  %add55 = add i64 %19, %shr53
  store i64 %add55, i64* %arrayidx54, align 8
  %arrayidx56 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %20 = load i64, i64* %arrayidx56, align 8
  %and57 = and i64 %20, 2251799813685247
  %arrayidx58 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %21 = load i64, i64* %arrayidx58, align 8
  %shr59 = lshr i64 %21, 51
  %arrayidx60 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %22 = load i64, i64* %arrayidx60, align 16
  %add61 = add i64 %22, %shr59
  store i64 %add61, i64* %arrayidx60, align 16
  %arrayidx62 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %23 = load i64, i64* %arrayidx62, align 16
  %and63 = and i64 %23, 2251799813685247
  %arrayidx64 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %24 = load i64, i64* %arrayidx64, align 16
  %shr65 = lshr i64 %24, 51
  %mul66 = mul i64 %shr65, 19
  %add67 = add i64 %and, %mul66
  %shr68 = lshr i64 %add67, 51
  %and69 = and i64 %add67, 2251799813685247
  %add70 = add i64 %and45, %shr68
  %shr71 = lshr i64 %add70, 51
  %and72 = and i64 %add70, 2251799813685247
  %add73 = add i64 %and51, %shr71
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %25 = load i1, i1* %out.2, align 1
  %cond.fold6 = or i1 false, %25
  store i1 %cond.fold6, i1* %out.3, align 1
  %inc = add i64 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %r4.0.lcssa.rewritten = phi i64 [ %r4.0.rewritten, %for.cond ]
  %r3.0.lcssa.rewritten = phi i64 [ %r3.0.rewritten, %for.cond ]
  %r2.0.lcssa.rewritten = phi i64 [ %r2.0.rewritten, %for.cond ]
  %r1.0.lcssa.rewritten = phi i64 [ %r1.0.rewritten, %for.cond ]
  %r0.0.lcssa.rewritten = phi i64 [ %r0.0.rewritten, %for.cond ]
  %26 = load i1, i1* %out.1, align 1
  %27 = xor i1 %cmp, true
  %in.7 = and i1 %26, %27
  %cond.fold8 = or i1 false, %in.7
  store i1 %cond.fold8, i1* %out.4, align 1
  %arrayidx74 = getelementptr inbounds i64, i64* %output.unwrapped, i64 0
  store i64 %r0.0.lcssa.rewritten, i64* %arrayidx74, align 8
  %arrayidx75 = getelementptr inbounds i64, i64* %output.unwrapped, i64 1
  store i64 %r1.0.lcssa.rewritten, i64* %arrayidx75, align 8
  %arrayidx76 = getelementptr inbounds i64, i64* %output.unwrapped, i64 2
  store i64 %r2.0.lcssa.rewritten, i64* %arrayidx76, align 8
  %arrayidx77 = getelementptr inbounds i64, i64* %output.unwrapped, i64 3
  store i64 %r3.0.lcssa.rewritten, i64* %arrayidx77, align 8
  %arrayidx78 = getelementptr inbounds i64, i64* %output.unwrapped, i64 4
  store i64 %r4.0.lcssa.rewritten, i64* %arrayidx78, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fscalar_product(%i64ptr.wrapped.ty* noundef %output, %i64ptr.wrapped.ty* noundef %input, i64 noundef %scalar) #0 {
entry:
  %output.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i32 0, i32 1
  %output.field0.length = load i64, i64* %output.field0.length.ptr, align 8
  %input.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i32 0, i32 1
  %input.field0.length = load i64, i64* %input.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i32 0, i32 0
  %output.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i32 0, i32 0
  %input.unwrapped = load i64*, i64** %1, align 8
  %arrayidx = getelementptr inbounds i64, i64* %input.unwrapped, i64 0
  %2 = load i64, i64* %arrayidx, align 8
  %mul = mul i64 %2, %scalar
  %and = and i64 %mul, 2251799813685247
  %arrayidx1 = getelementptr inbounds i64, i64* %output.unwrapped, i64 0
  store i64 %and, i64* %arrayidx1, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input.unwrapped, i64 1
  %3 = load i64, i64* %arrayidx2, align 8
  %mul3 = mul i64 %3, %scalar
  %shr = lshr i64 %mul, 51
  %add = add i64 %mul3, %shr
  %and4 = and i64 %add, 2251799813685247
  %arrayidx5 = getelementptr inbounds i64, i64* %output.unwrapped, i64 1
  store i64 %and4, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %input.unwrapped, i64 2
  %4 = load i64, i64* %arrayidx6, align 8
  %mul7 = mul i64 %4, %scalar
  %shr8 = lshr i64 %add, 51
  %add9 = add i64 %mul7, %shr8
  %and10 = and i64 %add9, 2251799813685247
  %arrayidx11 = getelementptr inbounds i64, i64* %output.unwrapped, i64 2
  store i64 %and10, i64* %arrayidx11, align 8
  %arrayidx12 = getelementptr inbounds i64, i64* %input.unwrapped, i64 3
  %5 = load i64, i64* %arrayidx12, align 8
  %mul13 = mul i64 %5, %scalar
  %shr14 = lshr i64 %add9, 51
  %add15 = add i64 %mul13, %shr14
  %and16 = and i64 %add15, 2251799813685247
  %arrayidx17 = getelementptr inbounds i64, i64* %output.unwrapped, i64 3
  store i64 %and16, i64* %arrayidx17, align 8
  %arrayidx18 = getelementptr inbounds i64, i64* %input.unwrapped, i64 4
  %6 = load i64, i64* %arrayidx18, align 8
  %mul19 = mul i64 %6, %scalar
  %shr20 = lshr i64 %add15, 51
  %add21 = add i64 %mul19, %shr20
  %and22 = and i64 %add21, 2251799813685247
  %arrayidx23 = getelementptr inbounds i64, i64* %output.unwrapped, i64 4
  store i64 %and22, i64* %arrayidx23, align 8
  %shr24 = lshr i64 %add21, 51
  %mul25 = mul i64 %shr24, 19
  %arrayidx26 = getelementptr inbounds i64, i64* %output.unwrapped, i64 0
  %7 = load i64, i64* %arrayidx26, align 8
  %add27 = add i64 %7, %mul25
  store i64 %add27, i64* %arrayidx26, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fmonty(%i64ptr.wrapped.ty* noundef %x2, %i64ptr.wrapped.ty* noundef %z2, %i64ptr.wrapped.ty* noundef %x3, %i64ptr.wrapped.ty* noundef %z3, %i64ptr.wrapped.ty* noundef %x, %i64ptr.wrapped.ty* noundef %z, %i64ptr.wrapped.ty* noundef %xprime, %i64ptr.wrapped.ty* noundef %zprime, %i64ptr.wrapped.ty* noundef %qmqp) #0 {
entry:
  %x2.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x2, i32 0, i32 1
  %x2.field0.length = load i64, i64* %x2.field0.length.ptr, align 8
  %z2.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z2, i32 0, i32 1
  %z2.field0.length = load i64, i64* %z2.field0.length.ptr, align 8
  %x3.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x3, i32 0, i32 1
  %x3.field0.length = load i64, i64* %x3.field0.length.ptr, align 8
  %z3.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z3, i32 0, i32 1
  %z3.field0.length = load i64, i64* %z3.field0.length.ptr, align 8
  %x.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x, i32 0, i32 1
  %x.field0.length = load i64, i64* %x.field0.length.ptr, align 8
  %z.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z, i32 0, i32 1
  %z.field0.length = load i64, i64* %z.field0.length.ptr, align 8
  %xprime.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %xprime, i32 0, i32 1
  %xprime.field0.length = load i64, i64* %xprime.field0.length.ptr, align 8
  %zprime.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime, i32 0, i32 1
  %zprime.field0.length = load i64, i64* %zprime.field0.length.ptr, align 8
  %qmqp.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %qmqp, i32 0, i32 1
  %qmqp.field0.length = load i64, i64* %qmqp.field0.length.ptr, align 8
  %arraydecay22.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay23.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %x.unwrapped.wrapped21 = alloca %i64ptr.wrapped.ty, align 8
  %z.unwrapped.wrapped23 = alloca %i64ptr.wrapped.ty, align 8
  %xprime.unwrapped.wrapped17 = alloca %i64ptr.wrapped.ty, align 8
  %zprime.unwrapped.wrapped19 = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay8.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay9.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay24.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay25.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay4.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %xprime.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %z.unwrapped.wrapped15 = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay5.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %x.unwrapped.wrapped11 = alloca %i64ptr.wrapped.ty, align 8
  %zprime.unwrapped.wrapped13 = alloca %i64ptr.wrapped.ty, align 8
  %z3.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay15.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %qmqp.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %x2.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay18.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay19.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %z2.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay26.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay27.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %z.unwrapped.wrapped9 = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay2.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %zprime.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay3.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay10.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay11.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay20.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay21.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %x3.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay12.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay13.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay14.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay16.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %x.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay17.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %z.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.1 = alloca i1, align 1
  store i1 false, i1* %out.1, align 1
  %out.2 = alloca i1, align 1
  store i1 false, i1* %out.2, align 1
  %out.3 = alloca i1, align 1
  store i1 false, i1* %out.3, align 1
  %out.4 = alloca i1, align 1
  store i1 false, i1* %out.4, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.3, align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x2, i32 0, i32 0
  %x2.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z2, i32 0, i32 0
  %z2.unwrapped = load i64*, i64** %1, align 8
  %2 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x3, i32 0, i32 0
  %x3.unwrapped = load i64*, i64** %2, align 8
  %3 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z3, i32 0, i32 0
  %z3.unwrapped = load i64*, i64** %3, align 8
  %4 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x, i32 0, i32 0
  %x.unwrapped = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z, i32 0, i32 0
  %z.unwrapped = load i64*, i64** %5, align 8
  %6 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %xprime, i32 0, i32 0
  %xprime.unwrapped = load i64*, i64** %6, align 8
  %7 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime, i32 0, i32 0
  %zprime.unwrapped = load i64*, i64** %7, align 8
  %8 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %qmqp, i32 0, i32 0
  %qmqp.unwrapped = load i64*, i64** %8, align 8
  %origx = alloca [5 x i64], align 16
  %origxprime = alloca [5 x i64], align 16
  %zzz = alloca [5 x i64], align 16
  %xx = alloca [5 x i64], align 16
  %zz = alloca [5 x i64], align 16
  %xxprime = alloca [5 x i64], align 16
  %zzprime = alloca [5 x i64], align 16
  %zzzprime = alloca [5 x i64], align 16
  %arraydecay = getelementptr inbounds [5 x i64], [5 x i64]* %origx, i64 0, i64 0
  %9 = bitcast i64* %arraydecay to i8*
  %10 = bitcast i64* %x.unwrapped to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %9, i8* align 8 %10, i64 5, i1 false)
  %arraydecay1 = getelementptr inbounds [5 x i64], [5 x i64]* %origxprime, i64 0, i64 0
  %11 = bitcast i64* %arraydecay1 to i8*
  %12 = bitcast i64* %xprime.unwrapped to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %11, i8* align 8 %12, i64 5, i1 false)
  %13 = bitcast [5 x i64]* %zzz to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %13, i8 0, i64 40, i1 false)
  %14 = bitcast [5 x i64]* %xx to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %14, i8 0, i64 40, i1 false)
  %15 = bitcast [5 x i64]* %zz to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false)
  %16 = bitcast [5 x i64]* %xxprime to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %16, i8 0, i64 40, i1 false)
  %17 = bitcast [5 x i64]* %zzprime to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false)
  %18 = bitcast [5 x i64]* %zzzprime to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %18, i8 0, i64 40, i1 false)
  %x.unwrapped.unwrapped22 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x.unwrapped.wrapped21, i32 0, i32 0
  %x.unwrapped.wrapped21.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x.unwrapped.wrapped21, i32 0, i32 1
  store i64 %x.field0.length, i64* %x.unwrapped.wrapped21.field0.length.ptr, align 8
  store i64* %x.unwrapped, i64** %x.unwrapped.unwrapped22, align 8
  %z.unwrapped.unwrapped24 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped23, i32 0, i32 0
  %z.unwrapped.wrapped23.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped23, i32 0, i32 1
  store i64 %z.field0.length, i64* %z.unwrapped.wrapped23.field0.length.ptr, align 8
  store i64* %z.unwrapped, i64** %z.unwrapped.unwrapped24, align 8
  call void @fsum(%i64ptr.wrapped.ty* %x.unwrapped.wrapped21, %i64ptr.wrapped.ty* %z.unwrapped.wrapped23)
  %arraydecay2 = getelementptr inbounds [5 x i64], [5 x i64]* %origx, i64 0, i64 0
  %z.unwrapped.unwrapped10 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped9, i32 0, i32 0
  %z.unwrapped.wrapped9.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped9, i32 0, i32 1
  store i64 %z.field0.length, i64* %z.unwrapped.wrapped9.field0.length.ptr, align 8
  store i64* %z.unwrapped, i64** %z.unwrapped.unwrapped10, align 8
  %arraydecay2.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay2.wrapped, i32 0, i32 0
  %arraydecay2.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay2.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay2.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay2, i64** %arraydecay2.unwrapped, align 8
  call void @fdifference_backwards(%i64ptr.wrapped.ty* %z.unwrapped.wrapped9, %i64ptr.wrapped.ty* %arraydecay2.wrapped)
  %xprime.unwrapped.unwrapped18 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %xprime.unwrapped.wrapped17, i32 0, i32 0
  %xprime.unwrapped.wrapped17.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %xprime.unwrapped.wrapped17, i32 0, i32 1
  store i64 %xprime.field0.length, i64* %xprime.unwrapped.wrapped17.field0.length.ptr, align 8
  store i64* %xprime.unwrapped, i64** %xprime.unwrapped.unwrapped18, align 8
  %zprime.unwrapped.unwrapped20 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime.unwrapped.wrapped19, i32 0, i32 0
  %zprime.unwrapped.wrapped19.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime.unwrapped.wrapped19, i32 0, i32 1
  store i64 %zprime.field0.length, i64* %zprime.unwrapped.wrapped19.field0.length.ptr, align 8
  store i64* %zprime.unwrapped, i64** %zprime.unwrapped.unwrapped20, align 8
  call void @fsum(%i64ptr.wrapped.ty* %xprime.unwrapped.wrapped17, %i64ptr.wrapped.ty* %zprime.unwrapped.wrapped19)
  %arraydecay3 = getelementptr inbounds [5 x i64], [5 x i64]* %origxprime, i64 0, i64 0
  %zprime.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime.unwrapped.wrapped, i32 0, i32 0
  %zprime.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime.unwrapped.wrapped, i32 0, i32 1
  store i64 %zprime.field0.length, i64* %zprime.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %zprime.unwrapped, i64** %zprime.unwrapped.unwrapped, align 8
  %arraydecay3.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay3.wrapped, i32 0, i32 0
  %arraydecay3.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay3.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay3.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay3.unwrapped, align 8
  call void @fdifference_backwards(%i64ptr.wrapped.ty* %zprime.unwrapped.wrapped, %i64ptr.wrapped.ty* %arraydecay3.wrapped)
  %arraydecay4 = getelementptr inbounds [5 x i64], [5 x i64]* %xxprime, i64 0, i64 0
  %arraydecay4.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay4.wrapped, i32 0, i32 0
  %arraydecay4.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay4.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay4.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay4, i64** %arraydecay4.unwrapped, align 8
  %xprime.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %xprime.unwrapped.wrapped, i32 0, i32 0
  %xprime.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %xprime.unwrapped.wrapped, i32 0, i32 1
  store i64 %xprime.field0.length, i64* %xprime.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %xprime.unwrapped, i64** %xprime.unwrapped.unwrapped, align 8
  %z.unwrapped.unwrapped16 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped15, i32 0, i32 0
  %z.unwrapped.wrapped15.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped15, i32 0, i32 1
  store i64 %z.field0.length, i64* %z.unwrapped.wrapped15.field0.length.ptr, align 8
  store i64* %z.unwrapped, i64** %z.unwrapped.unwrapped16, align 8
  call void @fmul(%i64ptr.wrapped.ty* %arraydecay4.wrapped, %i64ptr.wrapped.ty* %xprime.unwrapped.wrapped, %i64ptr.wrapped.ty* %z.unwrapped.wrapped15)
  %arraydecay5 = getelementptr inbounds [5 x i64], [5 x i64]* %zzprime, i64 0, i64 0
  %arraydecay5.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay5.wrapped, i32 0, i32 0
  %arraydecay5.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay5.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay5.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay5, i64** %arraydecay5.unwrapped, align 8
  %x.unwrapped.unwrapped12 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x.unwrapped.wrapped11, i32 0, i32 0
  %x.unwrapped.wrapped11.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x.unwrapped.wrapped11, i32 0, i32 1
  store i64 %x.field0.length, i64* %x.unwrapped.wrapped11.field0.length.ptr, align 8
  store i64* %x.unwrapped, i64** %x.unwrapped.unwrapped12, align 8
  %zprime.unwrapped.unwrapped14 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime.unwrapped.wrapped13, i32 0, i32 0
  %zprime.unwrapped.wrapped13.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime.unwrapped.wrapped13, i32 0, i32 1
  store i64 %zprime.field0.length, i64* %zprime.unwrapped.wrapped13.field0.length.ptr, align 8
  store i64* %zprime.unwrapped, i64** %zprime.unwrapped.unwrapped14, align 8
  call void @fmul(%i64ptr.wrapped.ty* %arraydecay5.wrapped, %i64ptr.wrapped.ty* %x.unwrapped.wrapped11, %i64ptr.wrapped.ty* %zprime.unwrapped.wrapped13)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %19 = load i1, i1* %out.3, align 1
  %20 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %20
  %cond.fold = or i1 %fwcond.and.fwtaken, %19
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp ult i32 %i.0.rewritten, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %21 = load i1, i1* %out.1, align 1
  %in. = and i1 %21, %cmp
  %cond.fold5 = or i1 false, %in.
  store i1 %cond.fold5, i1* %out.2, align 1
  %idxprom = zext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds [5 x i64], [5 x i64]* %xxprime, i64 0, i64 %idxprom
  %22 = load i64, i64* %arrayidx, align 8
  %idxprom6 = zext i32 %i.0.rewritten to i64
  %arrayidx7 = getelementptr inbounds [5 x i64], [5 x i64]* %origxprime, i64 0, i64 %idxprom6
  store i64 %22, i64* %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %23 = load i1, i1* %out.2, align 1
  %cond.fold6 = or i1 false, %23
  store i1 %cond.fold6, i1* %out.3, align 1
  %inc = add i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %24 = load i1, i1* %out.1, align 1
  %25 = xor i1 %cmp, true
  %in.7 = and i1 %24, %25
  %cond.fold8 = or i1 false, %in.7
  store i1 %cond.fold8, i1* %out.4, align 1
  %arraydecay8 = getelementptr inbounds [5 x i64], [5 x i64]* %xxprime, i64 0, i64 0
  %arraydecay9 = getelementptr inbounds [5 x i64], [5 x i64]* %zzprime, i64 0, i64 0
  %arraydecay8.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay8.wrapped, i32 0, i32 0
  %arraydecay8.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay8.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay8.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay8, i64** %arraydecay8.unwrapped, align 8
  %arraydecay9.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay9.wrapped, i32 0, i32 0
  %arraydecay9.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay9.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay9.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay9, i64** %arraydecay9.unwrapped, align 8
  call void @fsum(%i64ptr.wrapped.ty* %arraydecay8.wrapped, %i64ptr.wrapped.ty* %arraydecay9.wrapped)
  %arraydecay10 = getelementptr inbounds [5 x i64], [5 x i64]* %zzprime, i64 0, i64 0
  %arraydecay11 = getelementptr inbounds [5 x i64], [5 x i64]* %origxprime, i64 0, i64 0
  %arraydecay10.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay10.wrapped, i32 0, i32 0
  %arraydecay10.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay10.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay10.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay10, i64** %arraydecay10.unwrapped, align 8
  %arraydecay11.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay11.wrapped, i32 0, i32 0
  %arraydecay11.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay11.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay11.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay11, i64** %arraydecay11.unwrapped, align 8
  call void @fdifference_backwards(%i64ptr.wrapped.ty* %arraydecay10.wrapped, %i64ptr.wrapped.ty* %arraydecay11.wrapped)
  %arraydecay12 = getelementptr inbounds [5 x i64], [5 x i64]* %xxprime, i64 0, i64 0
  %x3.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x3.unwrapped.wrapped, i32 0, i32 0
  %x3.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x3.unwrapped.wrapped, i32 0, i32 1
  store i64 %x3.field0.length, i64* %x3.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %x3.unwrapped, i64** %x3.unwrapped.unwrapped, align 8
  %arraydecay12.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i32 0, i32 0
  %arraydecay12.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay12.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay12, i64** %arraydecay12.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %x3.unwrapped.wrapped, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i64 1)
  %arraydecay13 = getelementptr inbounds [5 x i64], [5 x i64]* %zzzprime, i64 0, i64 0
  %arraydecay14 = getelementptr inbounds [5 x i64], [5 x i64]* %zzprime, i64 0, i64 0
  %arraydecay13.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay13.wrapped, i32 0, i32 0
  %arraydecay13.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay13.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay13.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay13, i64** %arraydecay13.unwrapped, align 8
  %arraydecay14.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i32 0, i32 0
  %arraydecay14.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay14.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay14, i64** %arraydecay14.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay13.wrapped, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i64 1)
  %arraydecay15 = getelementptr inbounds [5 x i64], [5 x i64]* %zzzprime, i64 0, i64 0
  %z3.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z3.unwrapped.wrapped, i32 0, i32 0
  %z3.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z3.unwrapped.wrapped, i32 0, i32 1
  store i64 %z3.field0.length, i64* %z3.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %z3.unwrapped, i64** %z3.unwrapped.unwrapped, align 8
  %arraydecay15.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay15.wrapped, i32 0, i32 0
  %arraydecay15.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay15.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay15.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay15, i64** %arraydecay15.unwrapped, align 8
  %qmqp.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %qmqp.unwrapped.wrapped, i32 0, i32 0
  %qmqp.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %qmqp.unwrapped.wrapped, i32 0, i32 1
  store i64 %qmqp.field0.length, i64* %qmqp.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %qmqp.unwrapped, i64** %qmqp.unwrapped.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %z3.unwrapped.wrapped, %i64ptr.wrapped.ty* %arraydecay15.wrapped, %i64ptr.wrapped.ty* %qmqp.unwrapped.wrapped)
  %arraydecay16 = getelementptr inbounds [5 x i64], [5 x i64]* %xx, i64 0, i64 0
  %arraydecay16.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay16.wrapped, i32 0, i32 0
  %arraydecay16.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay16.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay16.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay16, i64** %arraydecay16.unwrapped, align 8
  %x.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x.unwrapped.wrapped, i32 0, i32 0
  %x.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x.unwrapped.wrapped, i32 0, i32 1
  store i64 %x.field0.length, i64* %x.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %x.unwrapped, i64** %x.unwrapped.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay16.wrapped, %i64ptr.wrapped.ty* %x.unwrapped.wrapped, i64 1)
  %arraydecay17 = getelementptr inbounds [5 x i64], [5 x i64]* %zz, i64 0, i64 0
  %arraydecay17.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay17.wrapped, i32 0, i32 0
  %arraydecay17.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay17.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay17.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay17, i64** %arraydecay17.unwrapped, align 8
  %z.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped, i32 0, i32 0
  %z.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped, i32 0, i32 1
  store i64 %z.field0.length, i64* %z.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %z.unwrapped, i64** %z.unwrapped.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay17.wrapped, %i64ptr.wrapped.ty* %z.unwrapped.wrapped, i64 1)
  %arraydecay18 = getelementptr inbounds [5 x i64], [5 x i64]* %xx, i64 0, i64 0
  %arraydecay19 = getelementptr inbounds [5 x i64], [5 x i64]* %zz, i64 0, i64 0
  %x2.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x2.unwrapped.wrapped, i32 0, i32 0
  %x2.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x2.unwrapped.wrapped, i32 0, i32 1
  store i64 %x2.field0.length, i64* %x2.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %x2.unwrapped, i64** %x2.unwrapped.unwrapped, align 8
  %arraydecay18.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay18.wrapped, i32 0, i32 0
  %arraydecay18.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay18.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay18.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay18, i64** %arraydecay18.unwrapped, align 8
  %arraydecay19.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i32 0, i32 0
  %arraydecay19.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay19.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay19, i64** %arraydecay19.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %x2.unwrapped.wrapped, %i64ptr.wrapped.ty* %arraydecay18.wrapped, %i64ptr.wrapped.ty* %arraydecay19.wrapped)
  %arraydecay20 = getelementptr inbounds [5 x i64], [5 x i64]* %zz, i64 0, i64 0
  %arraydecay21 = getelementptr inbounds [5 x i64], [5 x i64]* %xx, i64 0, i64 0
  %arraydecay20.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i32 0, i32 0
  %arraydecay20.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay20.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay20, i64** %arraydecay20.unwrapped, align 8
  %arraydecay21.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i32 0, i32 0
  %arraydecay21.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay21.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay21, i64** %arraydecay21.unwrapped, align 8
  call void @fdifference_backwards(%i64ptr.wrapped.ty* %arraydecay20.wrapped, %i64ptr.wrapped.ty* %arraydecay21.wrapped)
  %arraydecay22 = getelementptr inbounds [5 x i64], [5 x i64]* %zzz, i64 0, i64 0
  %arraydecay23 = getelementptr inbounds [5 x i64], [5 x i64]* %zz, i64 0, i64 0
  %arraydecay22.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay22.wrapped, i32 0, i32 0
  %arraydecay22.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay22.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay22.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay22, i64** %arraydecay22.unwrapped, align 8
  %arraydecay23.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay23.wrapped, i32 0, i32 0
  %arraydecay23.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay23.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay23.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay23, i64** %arraydecay23.unwrapped, align 8
  call void @fscalar_product(%i64ptr.wrapped.ty* %arraydecay22.wrapped, %i64ptr.wrapped.ty* %arraydecay23.wrapped, i64 121665)
  %arraydecay24 = getelementptr inbounds [5 x i64], [5 x i64]* %zzz, i64 0, i64 0
  %arraydecay25 = getelementptr inbounds [5 x i64], [5 x i64]* %xx, i64 0, i64 0
  %arraydecay24.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i32 0, i32 0
  %arraydecay24.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay24.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay24, i64** %arraydecay24.unwrapped, align 8
  %arraydecay25.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay25.wrapped, i32 0, i32 0
  %arraydecay25.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay25.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay25.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay25, i64** %arraydecay25.unwrapped, align 8
  call void @fsum(%i64ptr.wrapped.ty* %arraydecay24.wrapped, %i64ptr.wrapped.ty* %arraydecay25.wrapped)
  %arraydecay26 = getelementptr inbounds [5 x i64], [5 x i64]* %zz, i64 0, i64 0
  %arraydecay27 = getelementptr inbounds [5 x i64], [5 x i64]* %zzz, i64 0, i64 0
  %z2.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z2.unwrapped.wrapped, i32 0, i32 0
  %z2.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z2.unwrapped.wrapped, i32 0, i32 1
  store i64 %z2.field0.length, i64* %z2.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %z2.unwrapped, i64** %z2.unwrapped.unwrapped, align 8
  %arraydecay26.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i32 0, i32 0
  %arraydecay26.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay26.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay26, i64** %arraydecay26.unwrapped, align 8
  %arraydecay27.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay27.wrapped, i32 0, i32 0
  %arraydecay27.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay27.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay27.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay27, i64** %arraydecay27.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %z2.unwrapped.wrapped, %i64ptr.wrapped.ty* %arraydecay26.wrapped, %i64ptr.wrapped.ty* %arraydecay27.wrapped)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @swap_conditional(%i64ptr.wrapped.ty* noundef %a, %i64ptr.wrapped.ty* noundef %b, i64 noundef %swapi) #0 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %a, i32 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
  %b.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %b, i32 0, i32 1
  %b.field0.length = load i64, i64* %b.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.1 = alloca i1, align 1
  store i1 false, i1* %out.1, align 1
  %out.2 = alloca i1, align 1
  store i1 false, i1* %out.2, align 1
  %out.3 = alloca i1, align 1
  store i1 false, i1* %out.3, align 1
  %out.4 = alloca i1, align 1
  store i1 false, i1* %out.4, align 1
  %out.5 = alloca i1, align 1
  store i1 false, i1* %out.5, align 1
  %out.6 = alloca i1, align 1
  store i1 false, i1* %out.6, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.4, align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %a, i32 0, i32 0
  %a.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %b, i32 0, i32 0
  %b.unwrapped = load i64*, i64** %1, align 8
  %cmp = icmp eq i64 %swapi, 1
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %if.then

if.then:                                          ; preds = %entry
  %2 = load i1, i1* %out., align 1
  %in. = and i1 %2, %cmp
  %cond.fold = or i1 false, %in.
  store i1 %cond.fold, i1* %out.1, align 1
  %3 = load i1, i1* %out.1, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %i.0.rewritten = phi i32 [ 0, %if.then ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %if.then ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp1, %for.inc ], [ false, %if.then ]
  %4 = load i1, i1* %out.4, align 1
  %5 = load i1, i1* %out.1, align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %5
  %cond.fold7 = or i1 %fwcond.and.fwtaken, %4
  store i1 %cond.fold7, i1* %out.2, align 1
  %6 = load i1, i1* %out.2, align 1
  %cmp1 = icmp ult i32 %i.0.rewritten, 5
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i1, i1* %out.2, align 1
  %in.8 = and i1 %7, %cmp1
  %cond.fold9 = or i1 false, %in.8
  store i1 %cond.fold9, i1* %out.3, align 1
  %8 = load i1, i1* %out.3, align 1
  %idxprom = zext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds i64, i64* %a.unwrapped, i64 %idxprom
  %idx0.safe = icmp slt i64 %idxprom, %a.field0.length
  %9 = or i1 %8, %idx0.safe
  %10 = bitcast i64* %shadow to i64*
  %ctsel = select i1 %9, i64* %arrayidx, i64* %10
  %11 = load i64, i64* %ctsel, align 8
  %idxprom2 = zext i32 %i.0.rewritten to i64
  %arrayidx3 = getelementptr inbounds i64, i64* %b.unwrapped, i64 %idxprom2
  %idx0.safe16 = icmp slt i64 %idxprom2, %b.field0.length
  %12 = or i1 %8, %idx0.safe16
  %13 = bitcast i64* %shadow to i64*
  %ctsel17 = select i1 %12, i64* %arrayidx3, i64* %13
  %14 = load i64, i64* %ctsel17, align 8
  %idxprom4 = zext i32 %i.0.rewritten to i64
  %arrayidx5 = getelementptr inbounds i64, i64* %a.unwrapped, i64 %idxprom4
  %idx0.safe18 = icmp slt i64 %idxprom4, %a.field0.length
  %15 = or i1 %8, %idx0.safe18
  %16 = bitcast i64* %shadow to i64*
  %ctsel19 = select i1 %15, i64* %arrayidx5, i64* %16
  %17 = load i64, i64* %ctsel19, align 8
  %select.val. = select i1 %8, i64 %14, i64 %17
  store i64 %select.val., i64* %ctsel19, align 8
  %idxprom6 = zext i32 %i.0.rewritten to i64
  %arrayidx7 = getelementptr inbounds i64, i64* %b.unwrapped, i64 %idxprom6
  %idx0.safe20 = icmp slt i64 %idxprom6, %b.field0.length
  %18 = or i1 %8, %idx0.safe20
  %19 = bitcast i64* %shadow to i64*
  %ctsel21 = select i1 %18, i64* %arrayidx7, i64* %19
  %20 = load i64, i64* %ctsel21, align 8
  %select.val.22 = select i1 %8, i64 %11, i64 %20
  store i64 %select.val.22, i64* %ctsel21, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %21 = load i1, i1* %out.3, align 1
  %cond.fold10 = or i1 false, %21
  store i1 %cond.fold10, i1* %out.4, align 1
  %22 = load i1, i1* %out.4, align 1
  %inc = add i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %23 = load i1, i1* %out.2, align 1
  %24 = xor i1 %cmp1, true
  %in.11 = and i1 %23, %24
  %cond.fold12 = or i1 false, %in.11
  store i1 %cond.fold12, i1* %out.5, align 1
  %25 = load i1, i1* %out.5, align 1
  br label %if.end

if.end:                                           ; preds = %for.end
  %26 = load i1, i1* %out.5, align 1
  %27 = load i1, i1* %out., align 1
  %28 = xor i1 %cmp, true
  %in.13 = and i1 %27, %28
  %cond.fold14 = or i1 false, %26
  %cond.fold15 = or i1 %cond.fold14, %in.13
  store i1 %cond.fold15, i1* %out.6, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @cmult(%i64ptr.wrapped.ty* noundef %resultx, %i64ptr.wrapped.ty* noundef %resultz, %i8ptr.wrapped.ty* noundef %n, %i64ptr.wrapped.ty* noundef %q) #0 {
entry:
  %resultx.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %resultx, i32 0, i32 1
  %resultx.field0.length = load i64, i64* %resultx.field0.length.ptr, align 8
  %resultz.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %resultz, i32 0, i32 1
  %resultz.field0.length = load i64, i64* %resultz.field0.length.ptr, align 8
  %n.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %n, i32 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %q.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %q, i32 0, i32 1
  %q.field0.length = load i64, i64* %q.field0.length.ptr, align 8
  %arraydecay22.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay23.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay24.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay25.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay26.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay27.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay28.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay29.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %q.unwrapped.wrapped57 = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay38.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay39.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay40.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay41.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay42.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay43.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay44.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay45.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %q.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay19.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay20.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay21.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay30.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay31.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay32.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay33.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay34.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay35.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay36.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay37.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay46.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay47.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay48.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay49.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.7 = alloca i1, align 1
  store i1 false, i1* %out.7, align 1
  %out.8 = alloca i1, align 1
  store i1 false, i1* %out.8, align 1
  %out.9 = alloca i1, align 1
  store i1 false, i1* %out.9, align 1
  %out.10 = alloca i1, align 1
  store i1 false, i1* %out.10, align 1
  %out.11 = alloca i1, align 1
  store i1 false, i1* %out.11, align 1
  %out.12 = alloca i1, align 1
  store i1 false, i1* %out.12, align 1
  %out.13 = alloca i1, align 1
  store i1 false, i1* %out.13, align 1
  %out.14 = alloca i1, align 1
  store i1 false, i1* %out.14, align 1
  %out.15 = alloca i1, align 1
  store i1 false, i1* %out.15, align 1
  %out.16 = alloca i1, align 1
  store i1 false, i1* %out.16, align 1
  %out.17 = alloca i1, align 1
  store i1 false, i1* %out.17, align 1
  %out.18 = alloca i1, align 1
  store i1 false, i1* %out.18, align 1
  %out.19 = alloca i1, align 1
  store i1 false, i1* %out.19, align 1
  %out.20 = alloca i1, align 1
  store i1 false, i1* %out.20, align 1
  %out.21 = alloca i1, align 1
  store i1 false, i1* %out.21, align 1
  %out.22 = alloca i1, align 1
  store i1 false, i1* %out.22, align 1
  %out.23 = alloca i1, align 1
  store i1 false, i1* %out.23, align 1
  %out.24 = alloca i1, align 1
  store i1 false, i1* %out.24, align 1
  %out.25 = alloca i1, align 1
  store i1 false, i1* %out.25, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.9, align 1
  store i1 false, i1* %out.18, align 1
  store i1 false, i1* %out.20, align 1
  store i1 false, i1* %out.24, align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %resultx, i32 0, i32 0
  %resultx.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %resultz, i32 0, i32 0
  %resultz.unwrapped = load i64*, i64** %1, align 8
  %2 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %n, i32 0, i32 0
  %n.unwrapped = load i8*, i8** %2, align 8
  %3 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %q, i32 0, i32 0
  %q.unwrapped = load i64*, i64** %3, align 8
  %a = alloca [5 x i64], align 16
  %b = alloca [5 x i64], align 16
  %c = alloca [5 x i64], align 16
  %d = alloca [5 x i64], align 16
  %e = alloca [5 x i64], align 16
  %f = alloca [5 x i64], align 16
  %g = alloca [5 x i64], align 16
  %h = alloca [5 x i64], align 16
  %4 = bitcast [5 x i64]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false)
  %5 = bitcast [5 x i64]* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 40, i1 false)
  %6 = bitcast [5 x i64]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false)
  %7 = bitcast [5 x i64]* %d to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false)
  %8 = bitcast [5 x i64]* %e to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false)
  %9 = bitcast [5 x i64]* %f to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 40, i1 false)
  %10 = bitcast [5 x i64]* %g to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false)
  %11 = bitcast [5 x i64]* %h to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 40, i1 false)
  %arrayidx = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  store i64 1, i64* %arrayidx, align 16
  %arrayidx1 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  store i64 1, i64* %arrayidx1, align 16
  %arrayidx2 = getelementptr inbounds [5 x i64], [5 x i64]* %f, i64 0, i64 0
  store i64 1, i64* %arrayidx2, align 16
  %arrayidx3 = getelementptr inbounds [5 x i64], [5 x i64]* %h, i64 0, i64 0
  store i64 1, i64* %arrayidx3, align 16
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %12 = load i1, i1* %out.9, align 1
  %13 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %13
  %cond.fold = or i1 %fwcond.and.fwtaken, %12
  store i1 %cond.fold, i1* %out.7, align 1
  %cmp = icmp ult i32 %i.0.rewritten, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %14 = load i1, i1* %out.7, align 1
  %in. = and i1 %14, %cmp
  %cond.fold26 = or i1 false, %in.
  store i1 %cond.fold26, i1* %out.8, align 1
  %idxprom = zext i32 %i.0.rewritten to i64
  %arrayidx4 = getelementptr inbounds i64, i64* %q.unwrapped, i64 %idxprom
  %15 = load i64, i64* %arrayidx4, align 8
  %idxprom5 = zext i32 %i.0.rewritten to i64
  %arrayidx6 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 %idxprom5
  store i64 %15, i64* %arrayidx6, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %16 = load i1, i1* %out.8, align 1
  %cond.fold27 = or i1 false, %16
  store i1 %cond.fold27, i1* %out.9, align 1
  %inc = add i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  %17 = load i1, i1* %out.7, align 1
  %18 = xor i1 %cmp, true
  %in.28 = and i1 %17, %18
  %cond.fold29 = or i1 false, %in.28
  store i1 %cond.fold29, i1* %out.10, align 1
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc55, %for.end
  %i7.0.rewritten = phi i32 [ 0, %for.end ], [ %inc56, %for.inc55 ]
  %fwedge.taken1.rewritten = phi i1 [ true, %for.end ], [ false, %for.inc55 ]
  %exitpred.frozen2.rewritten = phi i1 [ %cmp9, %for.inc55 ], [ false, %for.end ]
  %19 = load i1, i1* %out.20, align 1
  %20 = load i1, i1* %out.10, align 1
  %fwcond.and.fwtaken30 = and i1 %fwedge.taken1.rewritten, %20
  %cond.fold31 = or i1 %fwcond.and.fwtaken30, %19
  store i1 %cond.fold31, i1* %out.11, align 1
  %cmp9 = icmp ult i32 %i7.0.rewritten, 32
  br i1 %cmp9, label %for.body10, label %for.end57

for.body10:                                       ; preds = %for.cond8
  %21 = load i1, i1* %out.11, align 1
  %in.32 = and i1 %21, %cmp9
  %cond.fold33 = or i1 false, %in.32
  store i1 %cond.fold33, i1* %out.12, align 1
  %sub = sub i32 31, %i7.0.rewritten
  %idxprom11 = zext i32 %sub to i64
  %arrayidx12 = getelementptr inbounds i8, i8* %n.unwrapped, i64 %idxprom11
  %22 = load i8, i8* %arrayidx12, align 1
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc52, %for.body10
  %byte.0.rewritten = phi i8 [ %22, %for.body10 ], [ %conv51, %for.inc52 ]
  %j.0.rewritten = phi i32 [ 0, %for.body10 ], [ %inc53, %for.inc52 ]
  %fwedge.taken3.rewritten = phi i1 [ true, %for.body10 ], [ false, %for.inc52 ]
  %exitpred.frozen4.rewritten = phi i1 [ %cmp14, %for.inc52 ], [ false, %for.body10 ]
  %23 = load i1, i1* %out.18, align 1
  %24 = load i1, i1* %out.12, align 1
  %fwcond.and.fwtaken34 = and i1 %fwedge.taken3.rewritten, %24
  %cond.fold35 = or i1 %fwcond.and.fwtaken34, %23
  store i1 %cond.fold35, i1* %out.13, align 1
  %cmp14 = icmp ult i32 %j.0.rewritten, 8
  br i1 %cmp14, label %for.body15, label %for.end54

for.body15:                                       ; preds = %for.cond13
  %25 = load i1, i1* %out.13, align 1
  %in.36 = and i1 %25, %cmp14
  %cond.fold37 = or i1 false, %in.36
  store i1 %cond.fold37, i1* %out.14, align 1
  %conv = zext i8 %byte.0.rewritten to i32
  %shr = ashr i32 %conv, 7
  %conv16 = sext i32 %shr to i64
  %and = and i32 %j.0.rewritten, 1
  %cmp17 = icmp eq i32 %and, 0
  br i1 %cmp17, label %if.then, label %if.else

if.then:                                          ; preds = %for.body15
  %26 = load i1, i1* %out.14, align 1
  %in.38 = and i1 %26, %cmp17
  %cond.fold39 = or i1 false, %in.38
  store i1 %cond.fold39, i1* %out.15, align 1
  %arraydecay = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay19 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay.wrapped, i32 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay, i64** %arraydecay.unwrapped, align 8
  %arraydecay19.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i32 0, i32 0
  %arraydecay19.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay19.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay19, i64** %arraydecay19.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* %arraydecay.wrapped, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i64 %conv16)
  %arraydecay20 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 0
  %arraydecay21 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay20.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i32 0, i32 0
  %arraydecay20.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay20.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay20, i64** %arraydecay20.unwrapped, align 8
  %arraydecay21.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i32 0, i32 0
  %arraydecay21.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay21.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay21, i64** %arraydecay21.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* %arraydecay20.wrapped, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i64 %conv16)
  %arraydecay22 = getelementptr inbounds [5 x i64], [5 x i64]* %g, i64 0, i64 0
  %arraydecay23 = getelementptr inbounds [5 x i64], [5 x i64]* %h, i64 0, i64 0
  %arraydecay24 = getelementptr inbounds [5 x i64], [5 x i64]* %e, i64 0, i64 0
  %arraydecay25 = getelementptr inbounds [5 x i64], [5 x i64]* %f, i64 0, i64 0
  %arraydecay26 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay27 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 0
  %arraydecay28 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay29 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay22.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay22.wrapped, i32 0, i32 0
  %arraydecay22.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay22.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay22.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay22, i64** %arraydecay22.unwrapped, align 8
  %arraydecay23.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay23.wrapped, i32 0, i32 0
  %arraydecay23.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay23.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay23.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay23, i64** %arraydecay23.unwrapped, align 8
  %arraydecay24.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i32 0, i32 0
  %arraydecay24.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay24.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay24, i64** %arraydecay24.unwrapped, align 8
  %arraydecay25.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay25.wrapped, i32 0, i32 0
  %arraydecay25.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay25.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay25.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay25, i64** %arraydecay25.unwrapped, align 8
  %arraydecay26.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i32 0, i32 0
  %arraydecay26.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay26.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay26, i64** %arraydecay26.unwrapped, align 8
  %arraydecay27.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay27.wrapped, i32 0, i32 0
  %arraydecay27.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay27.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay27.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay27, i64** %arraydecay27.unwrapped, align 8
  %arraydecay28.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay28.wrapped, i32 0, i32 0
  %arraydecay28.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay28.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay28.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay28, i64** %arraydecay28.unwrapped, align 8
  %arraydecay29.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay29.wrapped, i32 0, i32 0
  %arraydecay29.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay29.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay29.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay29, i64** %arraydecay29.unwrapped, align 8
  %q.unwrapped.unwrapped58 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %q.unwrapped.wrapped57, i32 0, i32 0
  %q.unwrapped.wrapped57.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %q.unwrapped.wrapped57, i32 0, i32 1
  store i64 %q.field0.length, i64* %q.unwrapped.wrapped57.field0.length.ptr, align 8
  store i64* %q.unwrapped, i64** %q.unwrapped.unwrapped58, align 8
  call void @fmonty(%i64ptr.wrapped.ty* %arraydecay22.wrapped, %i64ptr.wrapped.ty* %arraydecay23.wrapped, %i64ptr.wrapped.ty* %arraydecay24.wrapped, %i64ptr.wrapped.ty* %arraydecay25.wrapped, %i64ptr.wrapped.ty* %arraydecay26.wrapped, %i64ptr.wrapped.ty* %arraydecay27.wrapped, %i64ptr.wrapped.ty* %arraydecay28.wrapped, %i64ptr.wrapped.ty* %arraydecay29.wrapped, %i64ptr.wrapped.ty* %q.unwrapped.wrapped57)
  %arraydecay30 = getelementptr inbounds [5 x i64], [5 x i64]* %g, i64 0, i64 0
  %arraydecay31 = getelementptr inbounds [5 x i64], [5 x i64]* %e, i64 0, i64 0
  %arraydecay30.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay30.wrapped, i32 0, i32 0
  %arraydecay30.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay30.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay30.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay30, i64** %arraydecay30.unwrapped, align 8
  %arraydecay31.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay31.wrapped, i32 0, i32 0
  %arraydecay31.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay31.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay31.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay31, i64** %arraydecay31.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* %arraydecay30.wrapped, %i64ptr.wrapped.ty* %arraydecay31.wrapped, i64 %conv16)
  %arraydecay32 = getelementptr inbounds [5 x i64], [5 x i64]* %h, i64 0, i64 0
  %arraydecay33 = getelementptr inbounds [5 x i64], [5 x i64]* %f, i64 0, i64 0
  %arraydecay32.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay32.wrapped, i32 0, i32 0
  %arraydecay32.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay32.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay32.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay32, i64** %arraydecay32.unwrapped, align 8
  %arraydecay33.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay33.wrapped, i32 0, i32 0
  %arraydecay33.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay33.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay33.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay33, i64** %arraydecay33.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* %arraydecay32.wrapped, %i64ptr.wrapped.ty* %arraydecay33.wrapped, i64 %conv16)
  br label %if.end

if.else:                                          ; preds = %for.body15
  %27 = load i1, i1* %out.14, align 1
  %28 = xor i1 %cmp17, true
  %in.40 = and i1 %27, %28
  %cond.fold41 = or i1 false, %in.40
  store i1 %cond.fold41, i1* %out.16, align 1
  %arraydecay34 = getelementptr inbounds [5 x i64], [5 x i64]* %g, i64 0, i64 0
  %arraydecay35 = getelementptr inbounds [5 x i64], [5 x i64]* %e, i64 0, i64 0
  %arraydecay34.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay34.wrapped, i32 0, i32 0
  %arraydecay34.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay34.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay34.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay34, i64** %arraydecay34.unwrapped, align 8
  %arraydecay35.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay35.wrapped, i32 0, i32 0
  %arraydecay35.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay35.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay35.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay35, i64** %arraydecay35.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* %arraydecay34.wrapped, %i64ptr.wrapped.ty* %arraydecay35.wrapped, i64 %conv16)
  %arraydecay36 = getelementptr inbounds [5 x i64], [5 x i64]* %h, i64 0, i64 0
  %arraydecay37 = getelementptr inbounds [5 x i64], [5 x i64]* %f, i64 0, i64 0
  %arraydecay36.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay36.wrapped, i32 0, i32 0
  %arraydecay36.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay36.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay36.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay36, i64** %arraydecay36.unwrapped, align 8
  %arraydecay37.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay37.wrapped, i32 0, i32 0
  %arraydecay37.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay37.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay37.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay37, i64** %arraydecay37.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* %arraydecay36.wrapped, %i64ptr.wrapped.ty* %arraydecay37.wrapped, i64 %conv16)
  %arraydecay38 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay39 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 0
  %arraydecay40 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay41 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay42 = getelementptr inbounds [5 x i64], [5 x i64]* %g, i64 0, i64 0
  %arraydecay43 = getelementptr inbounds [5 x i64], [5 x i64]* %h, i64 0, i64 0
  %arraydecay44 = getelementptr inbounds [5 x i64], [5 x i64]* %e, i64 0, i64 0
  %arraydecay45 = getelementptr inbounds [5 x i64], [5 x i64]* %f, i64 0, i64 0
  %arraydecay38.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay38.wrapped, i32 0, i32 0
  %arraydecay38.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay38.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay38.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay38, i64** %arraydecay38.unwrapped, align 8
  %arraydecay39.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay39.wrapped, i32 0, i32 0
  %arraydecay39.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay39.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay39.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay39, i64** %arraydecay39.unwrapped, align 8
  %arraydecay40.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay40.wrapped, i32 0, i32 0
  %arraydecay40.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay40.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay40.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay40, i64** %arraydecay40.unwrapped, align 8
  %arraydecay41.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay41.wrapped, i32 0, i32 0
  %arraydecay41.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay41.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay41.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay41, i64** %arraydecay41.unwrapped, align 8
  %arraydecay42.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay42.wrapped, i32 0, i32 0
  %arraydecay42.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay42.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay42.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay42, i64** %arraydecay42.unwrapped, align 8
  %arraydecay43.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay43.wrapped, i32 0, i32 0
  %arraydecay43.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay43.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay43.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay43, i64** %arraydecay43.unwrapped, align 8
  %arraydecay44.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay44.wrapped, i32 0, i32 0
  %arraydecay44.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay44.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay44.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay44, i64** %arraydecay44.unwrapped, align 8
  %arraydecay45.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay45.wrapped, i32 0, i32 0
  %arraydecay45.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay45.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay45.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay45, i64** %arraydecay45.unwrapped, align 8
  %q.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %q.unwrapped.wrapped, i32 0, i32 0
  %q.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %q.unwrapped.wrapped, i32 0, i32 1
  store i64 %q.field0.length, i64* %q.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %q.unwrapped, i64** %q.unwrapped.unwrapped, align 8
  call void @fmonty(%i64ptr.wrapped.ty* %arraydecay38.wrapped, %i64ptr.wrapped.ty* %arraydecay39.wrapped, %i64ptr.wrapped.ty* %arraydecay40.wrapped, %i64ptr.wrapped.ty* %arraydecay41.wrapped, %i64ptr.wrapped.ty* %arraydecay42.wrapped, %i64ptr.wrapped.ty* %arraydecay43.wrapped, %i64ptr.wrapped.ty* %arraydecay44.wrapped, %i64ptr.wrapped.ty* %arraydecay45.wrapped, %i64ptr.wrapped.ty* %q.unwrapped.wrapped)
  %arraydecay46 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay47 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay46.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay46.wrapped, i32 0, i32 0
  %arraydecay46.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay46.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay46.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay46, i64** %arraydecay46.unwrapped, align 8
  %arraydecay47.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay47.wrapped, i32 0, i32 0
  %arraydecay47.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay47.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay47.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay47, i64** %arraydecay47.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* %arraydecay46.wrapped, %i64ptr.wrapped.ty* %arraydecay47.wrapped, i64 %conv16)
  %arraydecay48 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 0
  %arraydecay49 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay48.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay48.wrapped, i32 0, i32 0
  %arraydecay48.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay48.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay48.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay48, i64** %arraydecay48.unwrapped, align 8
  %arraydecay49.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay49.wrapped, i32 0, i32 0
  %arraydecay49.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay49.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay49.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay49, i64** %arraydecay49.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* %arraydecay48.wrapped, %i64ptr.wrapped.ty* %arraydecay49.wrapped, i64 %conv16)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %29 = load i1, i1* %out.16, align 1
  %30 = load i1, i1* %out.15, align 1
  %cond.fold42 = or i1 false, %29
  %cond.fold43 = or i1 %cond.fold42, %30
  store i1 %cond.fold43, i1* %out.17, align 1
  %conv50 = zext i8 %byte.0.rewritten to i32
  %shl = shl i32 %conv50, 1
  %conv51 = trunc i32 %shl to i8
  br label %for.inc52

for.inc52:                                        ; preds = %if.end
  %31 = load i1, i1* %out.17, align 1
  %cond.fold44 = or i1 false, %31
  store i1 %cond.fold44, i1* %out.18, align 1
  %inc53 = add i32 %j.0.rewritten, 1
  br label %for.cond13, !llvm.loop !11

for.end54:                                        ; preds = %for.cond13
  %32 = load i1, i1* %out.13, align 1
  %33 = xor i1 %cmp14, true
  %in.45 = and i1 %32, %33
  %cond.fold46 = or i1 false, %in.45
  store i1 %cond.fold46, i1* %out.19, align 1
  br label %for.inc55

for.inc55:                                        ; preds = %for.end54
  %34 = load i1, i1* %out.19, align 1
  %cond.fold47 = or i1 false, %34
  store i1 %cond.fold47, i1* %out.20, align 1
  %inc56 = add i32 %i7.0.rewritten, 1
  br label %for.cond8, !llvm.loop !12

for.end57:                                        ; preds = %for.cond8
  %35 = load i1, i1* %out.11, align 1
  %36 = xor i1 %cmp9, true
  %in.48 = and i1 %35, %36
  %cond.fold49 = or i1 false, %in.48
  store i1 %cond.fold49, i1* %out.21, align 1
  br label %for.cond59

for.cond59:                                       ; preds = %for.inc71, %for.end57
  %i58.0.rewritten = phi i32 [ 0, %for.end57 ], [ %inc72, %for.inc71 ]
  %fwedge.taken5.rewritten = phi i1 [ true, %for.end57 ], [ false, %for.inc71 ]
  %exitpred.frozen6.rewritten = phi i1 [ %cmp60, %for.inc71 ], [ false, %for.end57 ]
  %37 = load i1, i1* %out.24, align 1
  %38 = load i1, i1* %out.21, align 1
  %fwcond.and.fwtaken50 = and i1 %fwedge.taken5.rewritten, %38
  %cond.fold51 = or i1 %fwcond.and.fwtaken50, %37
  store i1 %cond.fold51, i1* %out.22, align 1
  %cmp60 = icmp ult i32 %i58.0.rewritten, 5
  br i1 %cmp60, label %for.body62, label %for.end73

for.body62:                                       ; preds = %for.cond59
  %39 = load i1, i1* %out.22, align 1
  %in.52 = and i1 %39, %cmp60
  %cond.fold53 = or i1 false, %in.52
  store i1 %cond.fold53, i1* %out.23, align 1
  %idxprom63 = zext i32 %i58.0.rewritten to i64
  %arrayidx64 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 %idxprom63
  %40 = load i64, i64* %arrayidx64, align 8
  %idxprom65 = zext i32 %i58.0.rewritten to i64
  %arrayidx66 = getelementptr inbounds i64, i64* %resultx.unwrapped, i64 %idxprom65
  store i64 %40, i64* %arrayidx66, align 8
  %idxprom67 = zext i32 %i58.0.rewritten to i64
  %arrayidx68 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 %idxprom67
  %41 = load i64, i64* %arrayidx68, align 8
  %idxprom69 = zext i32 %i58.0.rewritten to i64
  %arrayidx70 = getelementptr inbounds i64, i64* %resultz.unwrapped, i64 %idxprom69
  store i64 %41, i64* %arrayidx70, align 8
  br label %for.inc71

for.inc71:                                        ; preds = %for.body62
  %42 = load i1, i1* %out.23, align 1
  %cond.fold54 = or i1 false, %42
  store i1 %cond.fold54, i1* %out.24, align 1
  %inc72 = add i32 %i58.0.rewritten, 1
  br label %for.cond59, !llvm.loop !13

for.end73:                                        ; preds = %for.cond59
  %43 = load i1, i1* %out.22, align 1
  %44 = xor i1 %cmp60, true
  %in.55 = and i1 %43, %44
  %cond.fold56 = or i1 false, %in.55
  store i1 %cond.fold56, i1* %out.25, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @crecip(%i64ptr.wrapped.ty* noundef %out, %i64ptr.wrapped.ty* noundef %z) #0 {
entry:
  %out.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %out, i32 0, i32 1
  %out.field0.length = load i64, i64* %out.field0.length.ptr, align 8
  %z.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z, i32 0, i32 1
  %z.field0.length = load i64, i64* %z.field0.length.ptr, align 8
  %arraydecay3.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay4.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %z.unwrapped.wrapped1 = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay5.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay6.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay7.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay10.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay11.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay12.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay15.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay16.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay17.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay20.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay21.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay22.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay25.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay26.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay27.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay30.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay31.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay32.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay35.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay36.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay37.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay40.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay41.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay42.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay45.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay46.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay47.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %out.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay50.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay51.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %z.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay1.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay2.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay8.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay9.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay13.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay14.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay18.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay19.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay23.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay24.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay28.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay29.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay33.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay34.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay38.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay39.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay43.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay44.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay48.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay49.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %out, i32 0, i32 0
  %out.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z, i32 0, i32 0
  %z.unwrapped = load i64*, i64** %1, align 8
  %a = alloca [5 x i64], align 16
  %t0 = alloca [5 x i64], align 16
  %b = alloca [5 x i64], align 16
  %c = alloca [5 x i64], align 16
  %2 = bitcast [5 x i64]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false)
  %3 = bitcast [5 x i64]* %t0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false)
  %4 = bitcast [5 x i64]* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false)
  %5 = bitcast [5 x i64]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 40, i1 false)
  %arraydecay = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay.wrapped, i32 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay, i64** %arraydecay.unwrapped, align 8
  %z.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped, i32 0, i32 0
  %z.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped, i32 0, i32 1
  store i64 %z.field0.length, i64* %z.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %z.unwrapped, i64** %z.unwrapped.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay.wrapped, %i64ptr.wrapped.ty* %z.unwrapped.wrapped, i64 1)
  %arraydecay1 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay2 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay1.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay1.wrapped, i32 0, i32 0
  %arraydecay1.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay1.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay1.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay1.unwrapped, align 8
  %arraydecay2.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay2.wrapped, i32 0, i32 0
  %arraydecay2.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay2.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay2.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay2, i64** %arraydecay2.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay1.wrapped, %i64ptr.wrapped.ty* %arraydecay2.wrapped, i64 2)
  %arraydecay3 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay4 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay3.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay3.wrapped, i32 0, i32 0
  %arraydecay3.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay3.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay3.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay3.unwrapped, align 8
  %arraydecay4.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay4.wrapped, i32 0, i32 0
  %arraydecay4.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay4.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay4.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay4, i64** %arraydecay4.unwrapped, align 8
  %z.unwrapped.unwrapped2 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped1, i32 0, i32 0
  %z.unwrapped.wrapped1.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped1, i32 0, i32 1
  store i64 %z.field0.length, i64* %z.unwrapped.wrapped1.field0.length.ptr, align 8
  store i64* %z.unwrapped, i64** %z.unwrapped.unwrapped2, align 8
  call void @fmul(%i64ptr.wrapped.ty* %arraydecay3.wrapped, %i64ptr.wrapped.ty* %arraydecay4.wrapped, %i64ptr.wrapped.ty* %z.unwrapped.wrapped1)
  %arraydecay5 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay6 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay7 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay5.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay5.wrapped, i32 0, i32 0
  %arraydecay5.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay5.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay5.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay5, i64** %arraydecay5.unwrapped, align 8
  %arraydecay6.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay6.wrapped, i32 0, i32 0
  %arraydecay6.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay6.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay6.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay6, i64** %arraydecay6.unwrapped, align 8
  %arraydecay7.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay7.wrapped, i32 0, i32 0
  %arraydecay7.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay7.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay7.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay7, i64** %arraydecay7.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %arraydecay5.wrapped, %i64ptr.wrapped.ty* %arraydecay6.wrapped, %i64ptr.wrapped.ty* %arraydecay7.wrapped)
  %arraydecay8 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay9 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay8.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay8.wrapped, i32 0, i32 0
  %arraydecay8.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay8.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay8.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay8, i64** %arraydecay8.unwrapped, align 8
  %arraydecay9.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay9.wrapped, i32 0, i32 0
  %arraydecay9.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay9.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay9.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay9, i64** %arraydecay9.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay8.wrapped, %i64ptr.wrapped.ty* %arraydecay9.wrapped, i64 1)
  %arraydecay10 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay11 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay12 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay10.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay10.wrapped, i32 0, i32 0
  %arraydecay10.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay10.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay10.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay10, i64** %arraydecay10.unwrapped, align 8
  %arraydecay11.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay11.wrapped, i32 0, i32 0
  %arraydecay11.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay11.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay11.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay11, i64** %arraydecay11.unwrapped, align 8
  %arraydecay12.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i32 0, i32 0
  %arraydecay12.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay12.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay12, i64** %arraydecay12.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %arraydecay10.wrapped, %i64ptr.wrapped.ty* %arraydecay11.wrapped, %i64ptr.wrapped.ty* %arraydecay12.wrapped)
  %arraydecay13 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay14 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay13.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay13.wrapped, i32 0, i32 0
  %arraydecay13.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay13.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay13.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay13, i64** %arraydecay13.unwrapped, align 8
  %arraydecay14.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i32 0, i32 0
  %arraydecay14.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay14.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay14, i64** %arraydecay14.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay13.wrapped, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i64 5)
  %arraydecay15 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay16 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay17 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay15.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay15.wrapped, i32 0, i32 0
  %arraydecay15.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay15.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay15.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay15, i64** %arraydecay15.unwrapped, align 8
  %arraydecay16.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay16.wrapped, i32 0, i32 0
  %arraydecay16.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay16.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay16.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay16, i64** %arraydecay16.unwrapped, align 8
  %arraydecay17.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay17.wrapped, i32 0, i32 0
  %arraydecay17.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay17.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay17.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay17, i64** %arraydecay17.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %arraydecay15.wrapped, %i64ptr.wrapped.ty* %arraydecay16.wrapped, %i64ptr.wrapped.ty* %arraydecay17.wrapped)
  %arraydecay18 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay19 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay18.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay18.wrapped, i32 0, i32 0
  %arraydecay18.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay18.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay18.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay18, i64** %arraydecay18.unwrapped, align 8
  %arraydecay19.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i32 0, i32 0
  %arraydecay19.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay19.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay19, i64** %arraydecay19.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay18.wrapped, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i64 10)
  %arraydecay20 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay21 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay22 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay20.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i32 0, i32 0
  %arraydecay20.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay20.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay20, i64** %arraydecay20.unwrapped, align 8
  %arraydecay21.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i32 0, i32 0
  %arraydecay21.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay21.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay21, i64** %arraydecay21.unwrapped, align 8
  %arraydecay22.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay22.wrapped, i32 0, i32 0
  %arraydecay22.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay22.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay22.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay22, i64** %arraydecay22.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %arraydecay20.wrapped, %i64ptr.wrapped.ty* %arraydecay21.wrapped, %i64ptr.wrapped.ty* %arraydecay22.wrapped)
  %arraydecay23 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay24 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay23.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay23.wrapped, i32 0, i32 0
  %arraydecay23.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay23.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay23.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay23, i64** %arraydecay23.unwrapped, align 8
  %arraydecay24.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i32 0, i32 0
  %arraydecay24.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay24.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay24, i64** %arraydecay24.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay23.wrapped, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i64 20)
  %arraydecay25 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay26 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay27 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay25.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay25.wrapped, i32 0, i32 0
  %arraydecay25.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay25.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay25.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay25, i64** %arraydecay25.unwrapped, align 8
  %arraydecay26.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i32 0, i32 0
  %arraydecay26.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay26.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay26, i64** %arraydecay26.unwrapped, align 8
  %arraydecay27.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay27.wrapped, i32 0, i32 0
  %arraydecay27.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay27.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay27.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay27, i64** %arraydecay27.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %arraydecay25.wrapped, %i64ptr.wrapped.ty* %arraydecay26.wrapped, %i64ptr.wrapped.ty* %arraydecay27.wrapped)
  %arraydecay28 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay29 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay28.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay28.wrapped, i32 0, i32 0
  %arraydecay28.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay28.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay28.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay28, i64** %arraydecay28.unwrapped, align 8
  %arraydecay29.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay29.wrapped, i32 0, i32 0
  %arraydecay29.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay29.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay29.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay29, i64** %arraydecay29.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay28.wrapped, %i64ptr.wrapped.ty* %arraydecay29.wrapped, i64 10)
  %arraydecay30 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay31 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay32 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay30.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay30.wrapped, i32 0, i32 0
  %arraydecay30.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay30.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay30.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay30, i64** %arraydecay30.unwrapped, align 8
  %arraydecay31.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay31.wrapped, i32 0, i32 0
  %arraydecay31.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay31.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay31.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay31, i64** %arraydecay31.unwrapped, align 8
  %arraydecay32.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay32.wrapped, i32 0, i32 0
  %arraydecay32.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay32.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay32.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay32, i64** %arraydecay32.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %arraydecay30.wrapped, %i64ptr.wrapped.ty* %arraydecay31.wrapped, %i64ptr.wrapped.ty* %arraydecay32.wrapped)
  %arraydecay33 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay34 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay33.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay33.wrapped, i32 0, i32 0
  %arraydecay33.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay33.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay33.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay33, i64** %arraydecay33.unwrapped, align 8
  %arraydecay34.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay34.wrapped, i32 0, i32 0
  %arraydecay34.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay34.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay34.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay34, i64** %arraydecay34.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay33.wrapped, %i64ptr.wrapped.ty* %arraydecay34.wrapped, i64 50)
  %arraydecay35 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay36 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay37 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay35.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay35.wrapped, i32 0, i32 0
  %arraydecay35.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay35.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay35.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay35, i64** %arraydecay35.unwrapped, align 8
  %arraydecay36.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay36.wrapped, i32 0, i32 0
  %arraydecay36.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay36.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay36.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay36, i64** %arraydecay36.unwrapped, align 8
  %arraydecay37.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay37.wrapped, i32 0, i32 0
  %arraydecay37.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay37.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay37.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay37, i64** %arraydecay37.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %arraydecay35.wrapped, %i64ptr.wrapped.ty* %arraydecay36.wrapped, %i64ptr.wrapped.ty* %arraydecay37.wrapped)
  %arraydecay38 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay39 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay38.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay38.wrapped, i32 0, i32 0
  %arraydecay38.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay38.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay38.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay38, i64** %arraydecay38.unwrapped, align 8
  %arraydecay39.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay39.wrapped, i32 0, i32 0
  %arraydecay39.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay39.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay39.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay39, i64** %arraydecay39.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay38.wrapped, %i64ptr.wrapped.ty* %arraydecay39.wrapped, i64 100)
  %arraydecay40 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay41 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay42 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay40.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay40.wrapped, i32 0, i32 0
  %arraydecay40.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay40.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay40.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay40, i64** %arraydecay40.unwrapped, align 8
  %arraydecay41.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay41.wrapped, i32 0, i32 0
  %arraydecay41.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay41.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay41.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay41, i64** %arraydecay41.unwrapped, align 8
  %arraydecay42.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay42.wrapped, i32 0, i32 0
  %arraydecay42.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay42.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay42.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay42, i64** %arraydecay42.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %arraydecay40.wrapped, %i64ptr.wrapped.ty* %arraydecay41.wrapped, %i64ptr.wrapped.ty* %arraydecay42.wrapped)
  %arraydecay43 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay44 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay43.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay43.wrapped, i32 0, i32 0
  %arraydecay43.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay43.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay43.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay43, i64** %arraydecay43.unwrapped, align 8
  %arraydecay44.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay44.wrapped, i32 0, i32 0
  %arraydecay44.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay44.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay44.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay44, i64** %arraydecay44.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay43.wrapped, %i64ptr.wrapped.ty* %arraydecay44.wrapped, i64 50)
  %arraydecay45 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay46 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay47 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay45.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay45.wrapped, i32 0, i32 0
  %arraydecay45.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay45.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay45.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay45, i64** %arraydecay45.unwrapped, align 8
  %arraydecay46.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay46.wrapped, i32 0, i32 0
  %arraydecay46.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay46.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay46.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay46, i64** %arraydecay46.unwrapped, align 8
  %arraydecay47.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay47.wrapped, i32 0, i32 0
  %arraydecay47.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay47.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay47.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay47, i64** %arraydecay47.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %arraydecay45.wrapped, %i64ptr.wrapped.ty* %arraydecay46.wrapped, %i64ptr.wrapped.ty* %arraydecay47.wrapped)
  %arraydecay48 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay49 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay48.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay48.wrapped, i32 0, i32 0
  %arraydecay48.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay48.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay48.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay48, i64** %arraydecay48.unwrapped, align 8
  %arraydecay49.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay49.wrapped, i32 0, i32 0
  %arraydecay49.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay49.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay49.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay49, i64** %arraydecay49.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* %arraydecay48.wrapped, %i64ptr.wrapped.ty* %arraydecay49.wrapped, i64 5)
  %arraydecay50 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay51 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %out.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %out.unwrapped.wrapped, i32 0, i32 0
  %out.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %out.unwrapped.wrapped, i32 0, i32 1
  store i64 %out.field0.length, i64* %out.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %out.unwrapped, i64** %out.unwrapped.unwrapped, align 8
  %arraydecay50.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay50.wrapped, i32 0, i32 0
  %arraydecay50.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay50.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay50.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay50, i64** %arraydecay50.unwrapped, align 8
  %arraydecay51.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay51.wrapped, i32 0, i32 0
  %arraydecay51.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay51.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay51.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay51, i64** %arraydecay51.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %out.unwrapped.wrapped, %i64ptr.wrapped.ty* %arraydecay50.wrapped, %i64ptr.wrapped.ty* %arraydecay51.wrapped)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @store_limb(%i8ptr.wrapped.ty* noundef %out, i64 noundef %input) #0 {
entry:
  %out.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %out, i32 0, i32 1
  %out.field0.length = load i64, i64* %out.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %out, i32 0, i32 0
  %out.unwrapped = load i8*, i8** %0, align 8
  %and = and i64 %input, 255
  %conv = trunc i64 %and to i8
  %arrayidx = getelementptr inbounds i8, i8* %out.unwrapped, i64 0
  store i8 %conv, i8* %arrayidx, align 1
  %shr = lshr i64 %input, 8
  %and1 = and i64 %shr, 255
  %conv2 = trunc i64 %and1 to i8
  %arrayidx3 = getelementptr inbounds i8, i8* %out.unwrapped, i64 1
  store i8 %conv2, i8* %arrayidx3, align 1
  %shr4 = lshr i64 %input, 16
  %and5 = and i64 %shr4, 255
  %conv6 = trunc i64 %and5 to i8
  %arrayidx7 = getelementptr inbounds i8, i8* %out.unwrapped, i64 2
  store i8 %conv6, i8* %arrayidx7, align 1
  %shr8 = lshr i64 %input, 24
  %and9 = and i64 %shr8, 255
  %conv10 = trunc i64 %and9 to i8
  %arrayidx11 = getelementptr inbounds i8, i8* %out.unwrapped, i64 3
  store i8 %conv10, i8* %arrayidx11, align 1
  %shr12 = lshr i64 %input, 32
  %and13 = and i64 %shr12, 255
  %conv14 = trunc i64 %and13 to i8
  %arrayidx15 = getelementptr inbounds i8, i8* %out.unwrapped, i64 4
  store i8 %conv14, i8* %arrayidx15, align 1
  %shr16 = lshr i64 %input, 40
  %and17 = and i64 %shr16, 255
  %conv18 = trunc i64 %and17 to i8
  %arrayidx19 = getelementptr inbounds i8, i8* %out.unwrapped, i64 5
  store i8 %conv18, i8* %arrayidx19, align 1
  %shr20 = lshr i64 %input, 48
  %and21 = and i64 %shr20, 255
  %conv22 = trunc i64 %and21 to i8
  %arrayidx23 = getelementptr inbounds i8, i8* %out.unwrapped, i64 6
  store i8 %conv22, i8* %arrayidx23, align 1
  %shr24 = lshr i64 %input, 56
  %and25 = and i64 %shr24, 255
  %conv26 = trunc i64 %and25 to i8
  %arrayidx27 = getelementptr inbounds i8, i8* %out.unwrapped, i64 7
  store i8 %conv26, i8* %arrayidx27, align 1
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fcontract(%i8ptr.wrapped.ty* noundef %output, %i64ptr.wrapped.ty* noundef %input) #0 {
entry:
  %output.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %output, i32 0, i32 1
  %output.field0.length = load i64, i64* %output.field0.length.ptr, align 8
  %input.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i32 0, i32 1
  %input.field0.length = load i64, i64* %input.field0.length.ptr, align 8
  %arraydecay137.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay142.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay150.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay158.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %output, i32 0, i32 0
  %output.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i32 0, i32 0
  %input.unwrapped = load i64*, i64** %1, align 8
  %t = alloca [5 x i64], align 16
  %view = alloca [8 x i8], align 1
  %2 = bitcast [5 x i64]* %t to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false)
  %arrayidx = getelementptr inbounds i64, i64* %input.unwrapped, i64 0
  %3 = load i64, i64* %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  store i64 %3, i64* %arrayidx1, align 16
  %arrayidx2 = getelementptr inbounds i64, i64* %input.unwrapped, i64 1
  %4 = load i64, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  store i64 %4, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %input.unwrapped, i64 2
  %5 = load i64, i64* %arrayidx4, align 8
  %arrayidx5 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  store i64 %5, i64* %arrayidx5, align 16
  %arrayidx6 = getelementptr inbounds i64, i64* %input.unwrapped, i64 3
  %6 = load i64, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  store i64 %6, i64* %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %input.unwrapped, i64 4
  %7 = load i64, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  store i64 %7, i64* %arrayidx9, align 16
  %arrayidx10 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %8 = load i64, i64* %arrayidx10, align 16
  %shr = lshr i64 %8, 51
  %arrayidx11 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %9 = load i64, i64* %arrayidx11, align 8
  %add = add i64 %9, %shr
  store i64 %add, i64* %arrayidx11, align 8
  %arrayidx12 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %10 = load i64, i64* %arrayidx12, align 16
  %and = and i64 %10, 2251799813685247
  store i64 %and, i64* %arrayidx12, align 16
  %arrayidx13 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %11 = load i64, i64* %arrayidx13, align 8
  %shr14 = lshr i64 %11, 51
  %arrayidx15 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %12 = load i64, i64* %arrayidx15, align 16
  %add16 = add i64 %12, %shr14
  store i64 %add16, i64* %arrayidx15, align 16
  %arrayidx17 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %13 = load i64, i64* %arrayidx17, align 8
  %and18 = and i64 %13, 2251799813685247
  store i64 %and18, i64* %arrayidx17, align 8
  %arrayidx19 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %14 = load i64, i64* %arrayidx19, align 16
  %shr20 = lshr i64 %14, 51
  %arrayidx21 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %15 = load i64, i64* %arrayidx21, align 8
  %add22 = add i64 %15, %shr20
  store i64 %add22, i64* %arrayidx21, align 8
  %arrayidx23 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %16 = load i64, i64* %arrayidx23, align 16
  %and24 = and i64 %16, 2251799813685247
  store i64 %and24, i64* %arrayidx23, align 16
  %arrayidx25 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %17 = load i64, i64* %arrayidx25, align 8
  %shr26 = lshr i64 %17, 51
  %arrayidx27 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %18 = load i64, i64* %arrayidx27, align 16
  %add28 = add i64 %18, %shr26
  store i64 %add28, i64* %arrayidx27, align 16
  %arrayidx29 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %19 = load i64, i64* %arrayidx29, align 8
  %and30 = and i64 %19, 2251799813685247
  store i64 %and30, i64* %arrayidx29, align 8
  %arrayidx31 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %20 = load i64, i64* %arrayidx31, align 16
  %shr32 = lshr i64 %20, 51
  %mul = mul i64 19, %shr32
  %arrayidx33 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %21 = load i64, i64* %arrayidx33, align 16
  %add34 = add i64 %21, %mul
  store i64 %add34, i64* %arrayidx33, align 16
  %arrayidx35 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %22 = load i64, i64* %arrayidx35, align 16
  %and36 = and i64 %22, 2251799813685247
  store i64 %and36, i64* %arrayidx35, align 16
  %arrayidx37 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %23 = load i64, i64* %arrayidx37, align 16
  %shr38 = lshr i64 %23, 51
  %arrayidx39 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %24 = load i64, i64* %arrayidx39, align 8
  %add40 = add i64 %24, %shr38
  store i64 %add40, i64* %arrayidx39, align 8
  %arrayidx41 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %25 = load i64, i64* %arrayidx41, align 16
  %and42 = and i64 %25, 2251799813685247
  store i64 %and42, i64* %arrayidx41, align 16
  %arrayidx43 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %26 = load i64, i64* %arrayidx43, align 8
  %shr44 = lshr i64 %26, 51
  %arrayidx45 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %27 = load i64, i64* %arrayidx45, align 16
  %add46 = add i64 %27, %shr44
  store i64 %add46, i64* %arrayidx45, align 16
  %arrayidx47 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %28 = load i64, i64* %arrayidx47, align 8
  %and48 = and i64 %28, 2251799813685247
  store i64 %and48, i64* %arrayidx47, align 8
  %arrayidx49 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %29 = load i64, i64* %arrayidx49, align 16
  %shr50 = lshr i64 %29, 51
  %arrayidx51 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %30 = load i64, i64* %arrayidx51, align 8
  %add52 = add i64 %30, %shr50
  store i64 %add52, i64* %arrayidx51, align 8
  %arrayidx53 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %31 = load i64, i64* %arrayidx53, align 16
  %and54 = and i64 %31, 2251799813685247
  store i64 %and54, i64* %arrayidx53, align 16
  %arrayidx55 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %32 = load i64, i64* %arrayidx55, align 8
  %shr56 = lshr i64 %32, 51
  %arrayidx57 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %33 = load i64, i64* %arrayidx57, align 16
  %add58 = add i64 %33, %shr56
  store i64 %add58, i64* %arrayidx57, align 16
  %arrayidx59 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %34 = load i64, i64* %arrayidx59, align 8
  %and60 = and i64 %34, 2251799813685247
  store i64 %and60, i64* %arrayidx59, align 8
  %arrayidx61 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %35 = load i64, i64* %arrayidx61, align 16
  %shr62 = lshr i64 %35, 51
  %mul63 = mul i64 19, %shr62
  %arrayidx64 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %36 = load i64, i64* %arrayidx64, align 16
  %add65 = add i64 %36, %mul63
  store i64 %add65, i64* %arrayidx64, align 16
  %arrayidx66 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %37 = load i64, i64* %arrayidx66, align 16
  %and67 = and i64 %37, 2251799813685247
  store i64 %and67, i64* %arrayidx66, align 16
  %arrayidx68 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %38 = load i64, i64* %arrayidx68, align 16
  %add69 = add i64 %38, 19
  store i64 %add69, i64* %arrayidx68, align 16
  %arrayidx70 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %39 = load i64, i64* %arrayidx70, align 16
  %shr71 = lshr i64 %39, 51
  %arrayidx72 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %40 = load i64, i64* %arrayidx72, align 8
  %add73 = add i64 %40, %shr71
  store i64 %add73, i64* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %41 = load i64, i64* %arrayidx74, align 16
  %and75 = and i64 %41, 2251799813685247
  store i64 %and75, i64* %arrayidx74, align 16
  %arrayidx76 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %42 = load i64, i64* %arrayidx76, align 8
  %shr77 = lshr i64 %42, 51
  %arrayidx78 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %43 = load i64, i64* %arrayidx78, align 16
  %add79 = add i64 %43, %shr77
  store i64 %add79, i64* %arrayidx78, align 16
  %arrayidx80 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %44 = load i64, i64* %arrayidx80, align 8
  %and81 = and i64 %44, 2251799813685247
  store i64 %and81, i64* %arrayidx80, align 8
  %arrayidx82 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %45 = load i64, i64* %arrayidx82, align 16
  %shr83 = lshr i64 %45, 51
  %arrayidx84 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %46 = load i64, i64* %arrayidx84, align 8
  %add85 = add i64 %46, %shr83
  store i64 %add85, i64* %arrayidx84, align 8
  %arrayidx86 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %47 = load i64, i64* %arrayidx86, align 16
  %and87 = and i64 %47, 2251799813685247
  store i64 %and87, i64* %arrayidx86, align 16
  %arrayidx88 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %48 = load i64, i64* %arrayidx88, align 8
  %shr89 = lshr i64 %48, 51
  %arrayidx90 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %49 = load i64, i64* %arrayidx90, align 16
  %add91 = add i64 %49, %shr89
  store i64 %add91, i64* %arrayidx90, align 16
  %arrayidx92 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %50 = load i64, i64* %arrayidx92, align 8
  %and93 = and i64 %50, 2251799813685247
  store i64 %and93, i64* %arrayidx92, align 8
  %arrayidx94 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %51 = load i64, i64* %arrayidx94, align 16
  %shr95 = lshr i64 %51, 51
  %mul96 = mul i64 19, %shr95
  %arrayidx97 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %52 = load i64, i64* %arrayidx97, align 16
  %add98 = add i64 %52, %mul96
  store i64 %add98, i64* %arrayidx97, align 16
  %arrayidx99 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %53 = load i64, i64* %arrayidx99, align 16
  %and100 = and i64 %53, 2251799813685247
  store i64 %and100, i64* %arrayidx99, align 16
  %arrayidx101 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %54 = load i64, i64* %arrayidx101, align 16
  %add102 = add i64 %54, 2251799813685229
  store i64 %add102, i64* %arrayidx101, align 16
  %arrayidx103 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %55 = load i64, i64* %arrayidx103, align 8
  %add104 = add i64 %55, 2251799813685247
  store i64 %add104, i64* %arrayidx103, align 8
  %arrayidx105 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %56 = load i64, i64* %arrayidx105, align 16
  %add106 = add i64 %56, 2251799813685247
  store i64 %add106, i64* %arrayidx105, align 16
  %arrayidx107 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %57 = load i64, i64* %arrayidx107, align 8
  %add108 = add i64 %57, 2251799813685247
  store i64 %add108, i64* %arrayidx107, align 8
  %arrayidx109 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %58 = load i64, i64* %arrayidx109, align 16
  %add110 = add i64 %58, 2251799813685247
  store i64 %add110, i64* %arrayidx109, align 16
  %arrayidx111 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %59 = load i64, i64* %arrayidx111, align 16
  %shr112 = lshr i64 %59, 51
  %arrayidx113 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %60 = load i64, i64* %arrayidx113, align 8
  %add114 = add i64 %60, %shr112
  store i64 %add114, i64* %arrayidx113, align 8
  %arrayidx115 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %61 = load i64, i64* %arrayidx115, align 16
  %and116 = and i64 %61, 2251799813685247
  store i64 %and116, i64* %arrayidx115, align 16
  %arrayidx117 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %62 = load i64, i64* %arrayidx117, align 8
  %shr118 = lshr i64 %62, 51
  %arrayidx119 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %63 = load i64, i64* %arrayidx119, align 16
  %add120 = add i64 %63, %shr118
  store i64 %add120, i64* %arrayidx119, align 16
  %arrayidx121 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %64 = load i64, i64* %arrayidx121, align 8
  %and122 = and i64 %64, 2251799813685247
  store i64 %and122, i64* %arrayidx121, align 8
  %arrayidx123 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %65 = load i64, i64* %arrayidx123, align 16
  %shr124 = lshr i64 %65, 51
  %arrayidx125 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %66 = load i64, i64* %arrayidx125, align 8
  %add126 = add i64 %66, %shr124
  store i64 %add126, i64* %arrayidx125, align 8
  %arrayidx127 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %67 = load i64, i64* %arrayidx127, align 16
  %and128 = and i64 %67, 2251799813685247
  store i64 %and128, i64* %arrayidx127, align 16
  %arrayidx129 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %68 = load i64, i64* %arrayidx129, align 8
  %shr130 = lshr i64 %68, 51
  %arrayidx131 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %69 = load i64, i64* %arrayidx131, align 16
  %add132 = add i64 %69, %shr130
  store i64 %add132, i64* %arrayidx131, align 16
  %arrayidx133 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %70 = load i64, i64* %arrayidx133, align 8
  %and134 = and i64 %70, 2251799813685247
  store i64 %and134, i64* %arrayidx133, align 8
  %arrayidx135 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %71 = load i64, i64* %arrayidx135, align 16
  %and136 = and i64 %71, 2251799813685247
  store i64 %and136, i64* %arrayidx135, align 16
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %72 = bitcast i64* %input.unwrapped to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay, i8* align 8 %72, i64 8, i1 false)
  %arraydecay137 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx138 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %73 = load i64, i64* %arrayidx138, align 16
  %arrayidx139 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %74 = load i64, i64* %arrayidx139, align 8
  %shl = shl i64 %74, 51
  %or = or i64 %73, %shl
  %arraydecay137.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay137.wrapped, i32 0, i32 0
  %arraydecay137.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay137.wrapped, i32 0, i32 1
  store i64 8, i64* %arraydecay137.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay137, i8** %arraydecay137.unwrapped, align 8
  call void @store_limb(%i8ptr.wrapped.ty* %arraydecay137.wrapped, i64 %or)
  %arraydecay140 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx141 = getelementptr inbounds i64, i64* %input.unwrapped, i64 8
  %75 = bitcast i64* %arrayidx141 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay140, i8* align 8 %75, i64 8, i1 false)
  %arraydecay142 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx143 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %76 = load i64, i64* %arrayidx143, align 8
  %shr144 = lshr i64 %76, 13
  %arrayidx145 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %77 = load i64, i64* %arrayidx145, align 16
  %shl146 = shl i64 %77, 38
  %or147 = or i64 %shr144, %shl146
  %arraydecay142.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay142.wrapped, i32 0, i32 0
  %arraydecay142.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay142.wrapped, i32 0, i32 1
  store i64 8, i64* %arraydecay142.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay142, i8** %arraydecay142.unwrapped, align 8
  call void @store_limb(%i8ptr.wrapped.ty* %arraydecay142.wrapped, i64 %or147)
  %arraydecay148 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx149 = getelementptr inbounds i64, i64* %input.unwrapped, i64 16
  %78 = bitcast i64* %arrayidx149 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay148, i8* align 8 %78, i64 8, i1 false)
  %arraydecay150 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx151 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %79 = load i64, i64* %arrayidx151, align 16
  %shr152 = lshr i64 %79, 26
  %arrayidx153 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %80 = load i64, i64* %arrayidx153, align 8
  %shl154 = shl i64 %80, 25
  %or155 = or i64 %shr152, %shl154
  %arraydecay150.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay150.wrapped, i32 0, i32 0
  %arraydecay150.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay150.wrapped, i32 0, i32 1
  store i64 8, i64* %arraydecay150.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay150, i8** %arraydecay150.unwrapped, align 8
  call void @store_limb(%i8ptr.wrapped.ty* %arraydecay150.wrapped, i64 %or155)
  %arraydecay156 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx157 = getelementptr inbounds i64, i64* %input.unwrapped, i64 24
  %81 = bitcast i64* %arrayidx157 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay156, i8* align 8 %81, i64 8, i1 false)
  %arraydecay158 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx159 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %82 = load i64, i64* %arrayidx159, align 8
  %shr160 = lshr i64 %82, 39
  %arrayidx161 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %83 = load i64, i64* %arrayidx161, align 16
  %shl162 = shl i64 %83, 12
  %or163 = or i64 %shr160, %shl162
  %arraydecay158.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay158.wrapped, i32 0, i32 0
  %arraydecay158.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay158.wrapped, i32 0, i32 1
  store i64 8, i64* %arraydecay158.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay158, i8** %arraydecay158.unwrapped, align 8
  call void @store_limb(%i8ptr.wrapped.ty* %arraydecay158.wrapped, i64 %or163)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @curve25519_donna(%i8ptr.wrapped.ty* noundef %mypublic, %i8ptr.wrapped.ty* noundef %_secret, %i8ptr.wrapped.ty* noundef %basepoint) #0 {
entry:
  %mypublic.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %mypublic, i32 0, i32 1
  %mypublic.field0.length = load i64, i64* %mypublic.field0.length.ptr, align 8
  %_secret.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %_secret, i32 0, i32 1
  %_secret.field0.length = load i64, i64* %_secret.field0.length.ptr, align 8
  %basepoint.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %basepoint, i32 0, i32 1
  %basepoint.field0.length = load i64, i64* %basepoint.field0.length.ptr, align 8
  %arraydecay10.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %basepoint.unwrapped.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay11.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay12.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay13.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay14.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay17.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay18.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay19.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay15.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay16.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %mypublic.unwrapped.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay20.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %mypublic, i32 0, i32 0
  %mypublic.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %_secret, i32 0, i32 0
  %_secret.unwrapped = load i8*, i8** %1, align 8
  %2 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %basepoint, i32 0, i32 0
  %basepoint.unwrapped = load i8*, i8** %2, align 8
  %bp = alloca [5 x i64], align 16
  %x = alloca [5 x i64], align 16
  %z = alloca [5 x i64], align 16
  %zmone = alloca [5 x i64], align 16
  %e = alloca [32 x i8], align 16
  %3 = bitcast [5 x i64]* %bp to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false)
  %4 = bitcast [5 x i64]* %x to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false)
  %5 = bitcast [5 x i64]* %z to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 40, i1 false)
  %6 = bitcast [5 x i64]* %zmone to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false)
  %e1 = bitcast [32 x i8]* %e to i8*
  call void @llvm.var.annotation(i8* %e1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0), i32 503, i8* null)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %_secret.unwrapped, i64 32, i1 false)
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 0
  %7 = load i8, i8* %arrayidx, align 16
  %conv = zext i8 %7 to i32
  %and = and i32 %conv, 248
  %conv2 = trunc i32 %and to i8
  store i8 %conv2, i8* %arrayidx, align 16
  %arrayidx3 = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 31
  %8 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %8 to i32
  %and5 = and i32 %conv4, 127
  %conv6 = trunc i32 %and5 to i8
  store i8 %conv6, i8* %arrayidx3, align 1
  %arrayidx7 = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 31
  %9 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %9 to i32
  %or = or i32 %conv8, 64
  %conv9 = trunc i32 %or to i8
  store i8 %conv9, i8* %arrayidx7, align 1
  %arraydecay10 = getelementptr inbounds [5 x i64], [5 x i64]* %bp, i64 0, i64 0
  %arraydecay10.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay10.wrapped, i32 0, i32 0
  %arraydecay10.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay10.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay10.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay10, i64** %arraydecay10.unwrapped, align 8
  %basepoint.unwrapped.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %basepoint.unwrapped.wrapped, i32 0, i32 0
  %basepoint.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %basepoint.unwrapped.wrapped, i32 0, i32 1
  store i64 %basepoint.field0.length, i64* %basepoint.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %basepoint.unwrapped, i8** %basepoint.unwrapped.unwrapped, align 8
  call void @fexpand(%i64ptr.wrapped.ty* %arraydecay10.wrapped, %i8ptr.wrapped.ty* %basepoint.unwrapped.wrapped)
  %arraydecay11 = getelementptr inbounds [5 x i64], [5 x i64]* %x, i64 0, i64 0
  %arraydecay12 = getelementptr inbounds [5 x i64], [5 x i64]* %z, i64 0, i64 0
  %arraydecay13 = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 0
  %arraydecay14 = getelementptr inbounds [5 x i64], [5 x i64]* %bp, i64 0, i64 0
  %arraydecay11.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay11.wrapped, i32 0, i32 0
  %arraydecay11.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay11.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay11.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay11, i64** %arraydecay11.unwrapped, align 8
  %arraydecay12.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i32 0, i32 0
  %arraydecay12.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay12.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay12, i64** %arraydecay12.unwrapped, align 8
  %arraydecay13.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay13.wrapped, i32 0, i32 0
  %arraydecay13.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay13.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay13.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay13, i8** %arraydecay13.unwrapped, align 8
  %arraydecay14.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i32 0, i32 0
  %arraydecay14.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay14.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay14, i64** %arraydecay14.unwrapped, align 8
  call void @cmult(%i64ptr.wrapped.ty* %arraydecay11.wrapped, %i64ptr.wrapped.ty* %arraydecay12.wrapped, %i8ptr.wrapped.ty* %arraydecay13.wrapped, %i64ptr.wrapped.ty* %arraydecay14.wrapped)
  %arraydecay15 = getelementptr inbounds [5 x i64], [5 x i64]* %zmone, i64 0, i64 0
  %arraydecay16 = getelementptr inbounds [5 x i64], [5 x i64]* %z, i64 0, i64 0
  %arraydecay15.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay15.wrapped, i32 0, i32 0
  %arraydecay15.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay15.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay15.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay15, i64** %arraydecay15.unwrapped, align 8
  %arraydecay16.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay16.wrapped, i32 0, i32 0
  %arraydecay16.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay16.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay16.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay16, i64** %arraydecay16.unwrapped, align 8
  call void @crecip(%i64ptr.wrapped.ty* %arraydecay15.wrapped, %i64ptr.wrapped.ty* %arraydecay16.wrapped)
  %arraydecay17 = getelementptr inbounds [5 x i64], [5 x i64]* %z, i64 0, i64 0
  %arraydecay18 = getelementptr inbounds [5 x i64], [5 x i64]* %x, i64 0, i64 0
  %arraydecay19 = getelementptr inbounds [5 x i64], [5 x i64]* %zmone, i64 0, i64 0
  %arraydecay17.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay17.wrapped, i32 0, i32 0
  %arraydecay17.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay17.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay17.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay17, i64** %arraydecay17.unwrapped, align 8
  %arraydecay18.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay18.wrapped, i32 0, i32 0
  %arraydecay18.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay18.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay18.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay18, i64** %arraydecay18.unwrapped, align 8
  %arraydecay19.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i32 0, i32 0
  %arraydecay19.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay19.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay19, i64** %arraydecay19.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* %arraydecay17.wrapped, %i64ptr.wrapped.ty* %arraydecay18.wrapped, %i64ptr.wrapped.ty* %arraydecay19.wrapped)
  %arraydecay20 = getelementptr inbounds [5 x i64], [5 x i64]* %z, i64 0, i64 0
  %mypublic.unwrapped.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %mypublic.unwrapped.wrapped, i32 0, i32 0
  %mypublic.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %mypublic.unwrapped.wrapped, i32 0, i32 1
  store i64 %mypublic.field0.length, i64* %mypublic.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %mypublic.unwrapped, i8** %mypublic.unwrapped.unwrapped, align 8
  %arraydecay20.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i32 0, i32 0
  %arraydecay20.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i32 0, i32 1
  store i64 5, i64* %arraydecay20.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay20, i64** %arraydecay20.unwrapped, align 8
  call void @fcontract(%i8ptr.wrapped.ty* %mypublic.unwrapped.wrapped, %i64ptr.wrapped.ty* %arraydecay20.wrapped)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %arraydecay2.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay3.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay4.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %data = alloca [32 x i8], align 16
  %out = alloca [32 x i8], align 16
  %ret = alloca i8, align 1
  %basepoint = alloca [32 x i8], align 16
  store i1 true, i1* %out., align 1
  %data1 = bitcast [32 x i8]* %data to i8*
  call void @llvm.var.annotation(i8* %data1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.3, i32 0, i32 0), i32 19, i8* null)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %call = call i64 @read(i32 noundef 0, i8* noundef %arraydecay, i64 noundef 32)
  %0 = bitcast [32 x i8]* %out to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 32, i1 false)
  store i8 0, i8* %ret, align 1
  %1 = bitcast [32 x i8]* %basepoint to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 getelementptr inbounds (<{ i8, [31 x i8] }>, <{ i8, [31 x i8] }>* @__const.main.basepoint, i32 0, i32 0), i64 32, i1 false)
  %arraydecay2 = getelementptr inbounds [32 x i8], [32 x i8]* %out, i64 0, i64 0
  %arraydecay3 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %arraydecay4 = getelementptr inbounds [32 x i8], [32 x i8]* %basepoint, i64 0, i64 0
  %arraydecay2.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay2.wrapped, i32 0, i32 0
  %arraydecay2.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay2.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay2.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay2, i8** %arraydecay2.unwrapped, align 8
  %arraydecay3.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay3.wrapped, i32 0, i32 0
  %arraydecay3.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay3.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay3.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay3, i8** %arraydecay3.unwrapped, align 8
  %arraydecay4.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay4.wrapped, i32 0, i32 0
  %arraydecay4.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay4.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay4.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay4, i8** %arraydecay4.unwrapped, align 8
  %call5 = call i32 @curve25519_donna(%i8ptr.wrapped.ty* %arraydecay2.wrapped, %i8ptr.wrapped.ty* %arraydecay3.wrapped, %i8ptr.wrapped.ty* %arraydecay4.wrapped)
  %arraydecay6 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %arraydecay7 = getelementptr inbounds [32 x i8], [32 x i8]* %out, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 16 %arraydecay7, i64 32, i1 false)
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* %out, i64 0, i64 0
  %2 = load i8, i8* %arrayidx, align 16
  %conv = zext i8 %2 to i32
  %3 = load i8, i8* %ret, align 1
  %conv8 = zext i8 %3 to i32
  %xor = xor i32 %conv8, %conv
  %conv9 = trunc i32 %xor to i8
  store i8 %conv9, i8* %ret, align 1
  %call10 = call i64 @write(i32 noundef 1, i8* noundef %ret, i64 noundef 1)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 0
}

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #4

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #4

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 14.0.6"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}

; ModuleID = 'llvm-ir/base.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%i32ptr.wrapped.ty = type { i32*, i64 }
%struct.twy_ctx = type { [3 x i32], [3 x i32], [12 x i32], [12 x i32] }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @mu(%i32ptr.wrapped.ty* noundef %a) #0 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
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
  %out.7 = alloca i1, align 1
  store i1 false, i1* %out.7, align 1
  %out.8 = alloca i1, align 1
  store i1 false, i1* %out.8, align 1
  %out.9 = alloca i1, align 1
  store i1 false, i1* %out.9, align 1
  %out.10 = alloca i1, align 1
  store i1 false, i1* %out.10, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.9, align 1
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 0
  %a.unwrapped = load i32*, i32** %0, align 8
  %b = alloca [3 x i32], align 4
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  store i32 0, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  store i32 0, i32* %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  store i32 0, i32* %arrayidx2, align 4
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %1 = load i1, i1* %out.9, align 1
  %2 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %2
  %cond.fold = or i1 %fwcond.and.fwtaken, %1
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp slt i32 %i.0.rewritten, 32
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i1, i1* %out.1, align 1
  %in. = and i1 %3, %cmp
  %cond.fold11 = or i1 false, %in.
  store i1 %cond.fold11, i1* %out.2, align 1
  %arrayidx3 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %4 = load i32, i32* %arrayidx3, align 4
  %shl = shl i32 %4, 1
  store i32 %shl, i32* %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %5 = load i32, i32* %arrayidx4, align 4
  %shl5 = shl i32 %5, 1
  store i32 %shl5, i32* %arrayidx4, align 4
  %arrayidx6 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %6 = load i32, i32* %arrayidx6, align 4
  %shl7 = shl i32 %6, 1
  store i32 %shl7, i32* %arrayidx6, align 4
  %arrayidx8 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %7 = load i32, i32* %arrayidx8, align 4
  %and = and i32 %7, 1
  %tobool = icmp ne i32 %and, 0
  br label %if.then

if.then:                                          ; preds = %for.body
  %8 = load i1, i1* %out.2, align 1
  %in.12 = and i1 %8, %tobool
  %cond.fold13 = or i1 false, %in.12
  store i1 %cond.fold13, i1* %out.3, align 1
  %9 = load i1, i1* %out.3, align 1
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %idx1.safe = icmp slt i64 2, 3
  %access.safe = and i1 true, %idx1.safe
  %10 = or i1 %9, %access.safe
  %11 = bitcast i64* %shadow to i32*
  %ctsel = select i1 %10, i32* %arrayidx9, i32* %11
  %12 = load i32, i32* %ctsel, align 4
  %or = or i32 %12, 1
  %idx1.safe30 = icmp slt i64 2, 3
  %access.safe31 = and i1 true, %idx1.safe30
  %13 = or i1 %9, %access.safe31
  %14 = bitcast i64* %shadow to i32*
  %ctsel32 = select i1 %13, i32* %arrayidx9, i32* %14
  %15 = load i32, i32* %ctsel32, align 4
  %select.val. = select i1 %9, i32 %or, i32 %15
  store i32 %select.val., i32* %ctsel32, align 4
  br label %if.end

if.end:                                           ; preds = %if.then
  %16 = load i1, i1* %out.3, align 1
  %17 = load i1, i1* %out.2, align 1
  %18 = xor i1 %tobool, true
  %in.14 = and i1 %17, %18
  %cond.fold15 = or i1 false, %16
  %cond.fold16 = or i1 %cond.fold15, %in.14
  store i1 %cond.fold16, i1* %out.4, align 1
  %arrayidx10 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %19 = load i32, i32* %arrayidx10, align 4
  %and11 = and i32 %19, 1
  %tobool12 = icmp ne i32 %and11, 0
  br label %if.then13

if.then13:                                        ; preds = %if.end
  %20 = load i1, i1* %out.4, align 1
  %in.17 = and i1 %20, %tobool12
  %cond.fold18 = or i1 false, %in.17
  store i1 %cond.fold18, i1* %out.5, align 1
  %21 = load i1, i1* %out.5, align 1
  %arrayidx14 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %idx1.safe33 = icmp slt i64 1, 3
  %access.safe34 = and i1 true, %idx1.safe33
  %22 = or i1 %21, %access.safe34
  %23 = bitcast i64* %shadow to i32*
  %ctsel35 = select i1 %22, i32* %arrayidx14, i32* %23
  %24 = load i32, i32* %ctsel35, align 4
  %or15 = or i32 %24, 1
  %idx1.safe36 = icmp slt i64 1, 3
  %access.safe37 = and i1 true, %idx1.safe36
  %25 = or i1 %21, %access.safe37
  %26 = bitcast i64* %shadow to i32*
  %ctsel38 = select i1 %25, i32* %arrayidx14, i32* %26
  %27 = load i32, i32* %ctsel38, align 4
  %select.val.39 = select i1 %21, i32 %or15, i32 %27
  store i32 %select.val.39, i32* %ctsel38, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then13
  %28 = load i1, i1* %out.5, align 1
  %29 = load i1, i1* %out.4, align 1
  %30 = xor i1 %tobool12, true
  %in.19 = and i1 %29, %30
  %cond.fold20 = or i1 false, %28
  %cond.fold21 = or i1 %cond.fold20, %in.19
  store i1 %cond.fold21, i1* %out.6, align 1
  %arrayidx17 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %31 = load i32, i32* %arrayidx17, align 4
  %and18 = and i32 %31, 1
  %tobool19 = icmp ne i32 %and18, 0
  br label %if.then20

if.then20:                                        ; preds = %if.end16
  %32 = load i1, i1* %out.6, align 1
  %in.22 = and i1 %32, %tobool19
  %cond.fold23 = or i1 false, %in.22
  store i1 %cond.fold23, i1* %out.7, align 1
  %33 = load i1, i1* %out.7, align 1
  %arrayidx21 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %idx1.safe40 = icmp slt i64 0, 3
  %access.safe41 = and i1 true, %idx1.safe40
  %34 = or i1 %33, %access.safe41
  %35 = bitcast i64* %shadow to i32*
  %ctsel42 = select i1 %34, i32* %arrayidx21, i32* %35
  %36 = load i32, i32* %ctsel42, align 4
  %or22 = or i32 %36, 1
  %idx1.safe43 = icmp slt i64 0, 3
  %access.safe44 = and i1 true, %idx1.safe43
  %37 = or i1 %33, %access.safe44
  %38 = bitcast i64* %shadow to i32*
  %ctsel45 = select i1 %37, i32* %arrayidx21, i32* %38
  %39 = load i32, i32* %ctsel45, align 4
  %select.val.46 = select i1 %33, i32 %or22, i32 %39
  store i32 %select.val.46, i32* %ctsel45, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then20
  %40 = load i1, i1* %out.7, align 1
  %41 = load i1, i1* %out.6, align 1
  %42 = xor i1 %tobool19, true
  %in.24 = and i1 %41, %42
  %cond.fold25 = or i1 false, %in.24
  %cond.fold26 = or i1 %cond.fold25, %40
  store i1 %cond.fold26, i1* %out.8, align 1
  %arrayidx24 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %43 = load i32, i32* %arrayidx24, align 4
  %shr = ashr i32 %43, 1
  store i32 %shr, i32* %arrayidx24, align 4
  %arrayidx25 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %44 = load i32, i32* %arrayidx25, align 4
  %shr26 = ashr i32 %44, 1
  store i32 %shr26, i32* %arrayidx25, align 4
  %arrayidx27 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %45 = load i32, i32* %arrayidx27, align 4
  %shr28 = ashr i32 %45, 1
  store i32 %shr28, i32* %arrayidx27, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end23
  %46 = load i1, i1* %out.8, align 1
  %cond.fold27 = or i1 false, %46
  store i1 %cond.fold27, i1* %out.9, align 1
  %inc = add nsw i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %47 = load i1, i1* %out.1, align 1
  %48 = xor i1 %cmp, true
  %in.28 = and i1 %47, %48
  %cond.fold29 = or i1 false, %in.28
  store i1 %cond.fold29, i1* %out.10, align 1
  %arrayidx29 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %49 = load i32, i32* %arrayidx29, align 4
  %arrayidx30 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  store i32 %49, i32* %arrayidx30, align 4
  %arrayidx31 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %50 = load i32, i32* %arrayidx31, align 4
  %arrayidx32 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  store i32 %50, i32* %arrayidx32, align 4
  %arrayidx33 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %51 = load i32, i32* %arrayidx33, align 4
  %arrayidx34 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  store i32 %51, i32* %arrayidx34, align 4
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @gamma(%i32ptr.wrapped.ty* noundef %a) #0 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 0
  %a.unwrapped = load i32*, i32** %0, align 8
  %b = alloca [3 x i32], align 4
  %arrayidx = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %1 = load i32, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %2 = load i32, i32* %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %3 = load i32, i32* %arrayidx2, align 4
  %neg = xor i32 %3, -1
  %or = or i32 %2, %neg
  %xor = xor i32 %1, %or
  %arrayidx3 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  store i32 %xor, i32* %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %4 = load i32, i32* %arrayidx4, align 4
  %arrayidx5 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %5 = load i32, i32* %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %6 = load i32, i32* %arrayidx6, align 4
  %neg7 = xor i32 %6, -1
  %or8 = or i32 %5, %neg7
  %xor9 = xor i32 %4, %or8
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  store i32 %xor9, i32* %arrayidx10, align 4
  %arrayidx11 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %7 = load i32, i32* %arrayidx11, align 4
  %arrayidx12 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %8 = load i32, i32* %arrayidx12, align 4
  %arrayidx13 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %9 = load i32, i32* %arrayidx13, align 4
  %neg14 = xor i32 %9, -1
  %or15 = or i32 %8, %neg14
  %xor16 = xor i32 %7, %or15
  %arrayidx17 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  store i32 %xor16, i32* %arrayidx17, align 4
  %arrayidx18 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %10 = load i32, i32* %arrayidx18, align 4
  %arrayidx19 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  store i32 %10, i32* %arrayidx19, align 4
  %arrayidx20 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %11 = load i32, i32* %arrayidx20, align 4
  %arrayidx21 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  store i32 %11, i32* %arrayidx21, align 4
  %arrayidx22 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %12 = load i32, i32* %arrayidx22, align 4
  %arrayidx23 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  store i32 %12, i32* %arrayidx23, align 4
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @theta(%i32ptr.wrapped.ty* noundef %a) #0 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 0
  %a.unwrapped = load i32*, i32** %0, align 8
  %b = alloca [3 x i32], align 4
  %arrayidx = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %1 = load i32, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %2 = load i32, i32* %arrayidx1, align 4
  %shr = ashr i32 %2, 16
  %xor = xor i32 %1, %shr
  %arrayidx2 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %3 = load i32, i32* %arrayidx2, align 4
  %shl = shl i32 %3, 16
  %xor3 = xor i32 %xor, %shl
  %arrayidx4 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %4 = load i32, i32* %arrayidx4, align 4
  %shr5 = ashr i32 %4, 16
  %xor6 = xor i32 %xor3, %shr5
  %arrayidx7 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %5 = load i32, i32* %arrayidx7, align 4
  %shl8 = shl i32 %5, 16
  %xor9 = xor i32 %xor6, %shl8
  %arrayidx10 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %6 = load i32, i32* %arrayidx10, align 4
  %shr11 = ashr i32 %6, 24
  %xor12 = xor i32 %xor9, %shr11
  %arrayidx13 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %7 = load i32, i32* %arrayidx13, align 4
  %shl14 = shl i32 %7, 8
  %xor15 = xor i32 %xor12, %shl14
  %arrayidx16 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %8 = load i32, i32* %arrayidx16, align 4
  %shr17 = ashr i32 %8, 8
  %xor18 = xor i32 %xor15, %shr17
  %arrayidx19 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %9 = load i32, i32* %arrayidx19, align 4
  %shl20 = shl i32 %9, 24
  %xor21 = xor i32 %xor18, %shl20
  %arrayidx22 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %10 = load i32, i32* %arrayidx22, align 4
  %shr23 = ashr i32 %10, 16
  %xor24 = xor i32 %xor21, %shr23
  %arrayidx25 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %11 = load i32, i32* %arrayidx25, align 4
  %shl26 = shl i32 %11, 16
  %xor27 = xor i32 %xor24, %shl26
  %arrayidx28 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %12 = load i32, i32* %arrayidx28, align 4
  %shr29 = ashr i32 %12, 24
  %xor30 = xor i32 %xor27, %shr29
  %arrayidx31 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %13 = load i32, i32* %arrayidx31, align 4
  %shl32 = shl i32 %13, 8
  %xor33 = xor i32 %xor30, %shl32
  %arrayidx34 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  store i32 %xor33, i32* %arrayidx34, align 4
  %arrayidx35 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %14 = load i32, i32* %arrayidx35, align 4
  %arrayidx36 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %15 = load i32, i32* %arrayidx36, align 4
  %shr37 = ashr i32 %15, 16
  %xor38 = xor i32 %14, %shr37
  %arrayidx39 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %16 = load i32, i32* %arrayidx39, align 4
  %shl40 = shl i32 %16, 16
  %xor41 = xor i32 %xor38, %shl40
  %arrayidx42 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %17 = load i32, i32* %arrayidx42, align 4
  %shr43 = ashr i32 %17, 16
  %xor44 = xor i32 %xor41, %shr43
  %arrayidx45 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %18 = load i32, i32* %arrayidx45, align 4
  %shl46 = shl i32 %18, 16
  %xor47 = xor i32 %xor44, %shl46
  %arrayidx48 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %19 = load i32, i32* %arrayidx48, align 4
  %shr49 = ashr i32 %19, 24
  %xor50 = xor i32 %xor47, %shr49
  %arrayidx51 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %20 = load i32, i32* %arrayidx51, align 4
  %shl52 = shl i32 %20, 8
  %xor53 = xor i32 %xor50, %shl52
  %arrayidx54 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %21 = load i32, i32* %arrayidx54, align 4
  %shr55 = ashr i32 %21, 8
  %xor56 = xor i32 %xor53, %shr55
  %arrayidx57 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %22 = load i32, i32* %arrayidx57, align 4
  %shl58 = shl i32 %22, 24
  %xor59 = xor i32 %xor56, %shl58
  %arrayidx60 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %23 = load i32, i32* %arrayidx60, align 4
  %shr61 = ashr i32 %23, 16
  %xor62 = xor i32 %xor59, %shr61
  %arrayidx63 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %24 = load i32, i32* %arrayidx63, align 4
  %shl64 = shl i32 %24, 16
  %xor65 = xor i32 %xor62, %shl64
  %arrayidx66 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %25 = load i32, i32* %arrayidx66, align 4
  %shr67 = ashr i32 %25, 24
  %xor68 = xor i32 %xor65, %shr67
  %arrayidx69 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %26 = load i32, i32* %arrayidx69, align 4
  %shl70 = shl i32 %26, 8
  %xor71 = xor i32 %xor68, %shl70
  %arrayidx72 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  store i32 %xor71, i32* %arrayidx72, align 4
  %arrayidx73 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %27 = load i32, i32* %arrayidx73, align 4
  %arrayidx74 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %28 = load i32, i32* %arrayidx74, align 4
  %shr75 = ashr i32 %28, 16
  %xor76 = xor i32 %27, %shr75
  %arrayidx77 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %29 = load i32, i32* %arrayidx77, align 4
  %shl78 = shl i32 %29, 16
  %xor79 = xor i32 %xor76, %shl78
  %arrayidx80 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %30 = load i32, i32* %arrayidx80, align 4
  %shr81 = ashr i32 %30, 16
  %xor82 = xor i32 %xor79, %shr81
  %arrayidx83 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %31 = load i32, i32* %arrayidx83, align 4
  %shl84 = shl i32 %31, 16
  %xor85 = xor i32 %xor82, %shl84
  %arrayidx86 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %32 = load i32, i32* %arrayidx86, align 4
  %shr87 = ashr i32 %32, 24
  %xor88 = xor i32 %xor85, %shr87
  %arrayidx89 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %33 = load i32, i32* %arrayidx89, align 4
  %shl90 = shl i32 %33, 8
  %xor91 = xor i32 %xor88, %shl90
  %arrayidx92 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %34 = load i32, i32* %arrayidx92, align 4
  %shr93 = ashr i32 %34, 8
  %xor94 = xor i32 %xor91, %shr93
  %arrayidx95 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %35 = load i32, i32* %arrayidx95, align 4
  %shl96 = shl i32 %35, 24
  %xor97 = xor i32 %xor94, %shl96
  %arrayidx98 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %36 = load i32, i32* %arrayidx98, align 4
  %shr99 = ashr i32 %36, 16
  %xor100 = xor i32 %xor97, %shr99
  %arrayidx101 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %37 = load i32, i32* %arrayidx101, align 4
  %shl102 = shl i32 %37, 16
  %xor103 = xor i32 %xor100, %shl102
  %arrayidx104 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %38 = load i32, i32* %arrayidx104, align 4
  %shr105 = ashr i32 %38, 24
  %xor106 = xor i32 %xor103, %shr105
  %arrayidx107 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %39 = load i32, i32* %arrayidx107, align 4
  %shl108 = shl i32 %39, 8
  %xor109 = xor i32 %xor106, %shl108
  %arrayidx110 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  store i32 %xor109, i32* %arrayidx110, align 4
  %arrayidx111 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %40 = load i32, i32* %arrayidx111, align 4
  %arrayidx112 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  store i32 %40, i32* %arrayidx112, align 4
  %arrayidx113 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %41 = load i32, i32* %arrayidx113, align 4
  %arrayidx114 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  store i32 %41, i32* %arrayidx114, align 4
  %arrayidx115 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %42 = load i32, i32* %arrayidx115, align 4
  %arrayidx116 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  store i32 %42, i32* %arrayidx116, align 4
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @pi_1(%i32ptr.wrapped.ty* noundef %a) #0 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 0
  %a.unwrapped = load i32*, i32** %0, align 8
  %arrayidx = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %1 = load i32, i32* %arrayidx, align 4
  %shr = ashr i32 %1, 10
  %arrayidx1 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %2 = load i32, i32* %arrayidx1, align 4
  %shl = shl i32 %2, 22
  %xor = xor i32 %shr, %shl
  %arrayidx2 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  store i32 %xor, i32* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %3 = load i32, i32* %arrayidx3, align 4
  %shl4 = shl i32 %3, 1
  %arrayidx5 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %4 = load i32, i32* %arrayidx5, align 4
  %shr6 = ashr i32 %4, 31
  %xor7 = xor i32 %shl4, %shr6
  %arrayidx8 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  store i32 %xor7, i32* %arrayidx8, align 4
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @pi_2(%i32ptr.wrapped.ty* noundef %a) #0 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 0
  %a.unwrapped = load i32*, i32** %0, align 8
  %arrayidx = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %1 = load i32, i32* %arrayidx, align 4
  %shl = shl i32 %1, 1
  %arrayidx1 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %2 = load i32, i32* %arrayidx1, align 4
  %shr = ashr i32 %2, 31
  %xor = xor i32 %shl, %shr
  %arrayidx2 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  store i32 %xor, i32* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %3 = load i32, i32* %arrayidx3, align 4
  %shr4 = ashr i32 %3, 10
  %arrayidx5 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %4 = load i32, i32* %arrayidx5, align 4
  %shl6 = shl i32 %4, 22
  %xor7 = xor i32 %shr4, %shl6
  %arrayidx8 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  store i32 %xor7, i32* %arrayidx8, align 4
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @rho(%i32ptr.wrapped.ty* noundef %a) #0 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
  %a.unwrapped.wrapped5 = alloca %i32ptr.wrapped.ty, align 8
  %a.unwrapped.wrapped3 = alloca %i32ptr.wrapped.ty, align 8
  %a.unwrapped.wrapped1 = alloca %i32ptr.wrapped.ty, align 8
  %a.unwrapped.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 0
  %a.unwrapped = load i32*, i32** %0, align 8
  %a.unwrapped.unwrapped4 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a.unwrapped.wrapped3, i32 0, i32 0
  %a.unwrapped.wrapped3.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a.unwrapped.wrapped3, i32 0, i32 1
  store i64 %a.field0.length, i64* %a.unwrapped.wrapped3.field0.length.ptr, align 8
  store i32* %a.unwrapped, i32** %a.unwrapped.unwrapped4, align 8
  call void @theta(%i32ptr.wrapped.ty* %a.unwrapped.wrapped3)
  %a.unwrapped.unwrapped2 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a.unwrapped.wrapped1, i32 0, i32 0
  %a.unwrapped.wrapped1.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a.unwrapped.wrapped1, i32 0, i32 1
  store i64 %a.field0.length, i64* %a.unwrapped.wrapped1.field0.length.ptr, align 8
  store i32* %a.unwrapped, i32** %a.unwrapped.unwrapped2, align 8
  call void @pi_1(%i32ptr.wrapped.ty* %a.unwrapped.wrapped1)
  %a.unwrapped.unwrapped6 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a.unwrapped.wrapped5, i32 0, i32 0
  %a.unwrapped.wrapped5.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a.unwrapped.wrapped5, i32 0, i32 1
  store i64 %a.field0.length, i64* %a.unwrapped.wrapped5.field0.length.ptr, align 8
  store i32* %a.unwrapped, i32** %a.unwrapped.unwrapped6, align 8
  call void @gamma(%i32ptr.wrapped.ty* %a.unwrapped.wrapped5)
  %a.unwrapped.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a.unwrapped.wrapped, i32 0, i32 0
  %a.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a.unwrapped.wrapped, i32 0, i32 1
  store i64 %a.field0.length, i64* %a.unwrapped.wrapped.field0.length.ptr, align 8
  store i32* %a.unwrapped, i32** %a.unwrapped.unwrapped, align 8
  call void @pi_2(%i32ptr.wrapped.ty* %a.unwrapped.wrapped)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @rndcon_gen(i32 noundef %strt, %i32ptr.wrapped.ty* noundef %rtab) #0 {
entry:
  %rtab.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %rtab, i32 0, i32 1
  %rtab.field0.length = load i64, i64* %rtab.field0.length.ptr, align 8
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
  store i1 false, i1* %out.5, align 1
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %rtab, i32 0, i32 0
  %rtab.unwrapped = load i32*, i32** %0, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %strt.addr.0.rewritten = phi i32 [ %strt, %entry ], [ %strt.addr.1.rewritten, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %1 = load i1, i1* %out.5, align 1
  %2 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %2
  %cond.fold = or i1 %fwcond.and.fwtaken, %1
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp sle i32 %i.0.rewritten, 11
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i1, i1* %out.1, align 1
  %in. = and i1 %3, %cmp
  %cond.fold7 = or i1 false, %in.
  store i1 %cond.fold7, i1* %out.2, align 1
  %idxprom = sext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds i32, i32* %rtab.unwrapped, i64 %idxprom
  store i32 %strt.addr.0.rewritten, i32* %arrayidx, align 4
  %shl = shl i32 %strt.addr.0.rewritten, 1
  %and = and i32 %shl, 65536
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load i1, i1* %out.2, align 1
  %in.8 = and i1 %4, %tobool
  %cond.fold9 = or i1 false, %in.8
  store i1 %cond.fold9, i1* %out.3, align 1
  %xor = xor i32 %shl, 69649
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %strt.addr.1.rewritten = phi i32 [ %xor, %if.then ], [ %shl, %for.body ]
  %5 = load i1, i1* %out.3, align 1
  %6 = load i1, i1* %out.2, align 1
  %7 = xor i1 %tobool, true
  %in.10 = and i1 %6, %7
  %cond.fold11 = or i1 false, %5
  %cond.fold12 = or i1 %cond.fold11, %in.10
  store i1 %cond.fold12, i1* %out.4, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load i1, i1* %out.4, align 1
  %cond.fold13 = or i1 false, %8
  store i1 %cond.fold13, i1* %out.5, align 1
  %inc = add nsw i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %9 = load i1, i1* %out.1, align 1
  %10 = xor i1 %cmp, true
  %in.14 = and i1 %9, %10
  %cond.fold15 = or i1 false, %in.14
  store i1 %cond.fold15, i1* %out.6, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @encrypt(%struct.twy_ctx* noundef %c, %i32ptr.wrapped.ty* noundef %a) #0 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
  %a.unwrapped.wrapped9 = alloca %i32ptr.wrapped.ty, align 8
  %a.unwrapped.wrapped = alloca %i32ptr.wrapped.ty, align 8
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
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 0
  %a.unwrapped = load i32*, i32** %0, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %1 = load i1, i1* %out.3, align 1
  %2 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %2
  %cond.fold = or i1 %fwcond.and.fwtaken, %1
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp slt i32 %i.0.rewritten, 11
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i1, i1* %out.1, align 1
  %in. = and i1 %3, %cmp
  %cond.fold5 = or i1 false, %in.
  store i1 %cond.fold5, i1* %out.2, align 1
  %k = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %k, i64 0, i64 0
  %4 = load i32, i32* %arrayidx, align 4
  %ercon = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 2
  %idxprom = sext i32 %i.0.rewritten to i64
  %arrayidx1 = getelementptr inbounds [12 x i32], [12 x i32]* %ercon, i64 0, i64 %idxprom
  %5 = load i32, i32* %arrayidx1, align 4
  %shl = shl i32 %5, 16
  %xor = xor i32 %4, %shl
  %arrayidx2 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %6 = load i32, i32* %arrayidx2, align 4
  %xor3 = xor i32 %6, %xor
  store i32 %xor3, i32* %arrayidx2, align 4
  %k4 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* %k4, i64 0, i64 1
  %7 = load i32, i32* %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %8 = load i32, i32* %arrayidx6, align 4
  %xor7 = xor i32 %8, %7
  store i32 %xor7, i32* %arrayidx6, align 4
  %k8 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %k8, i64 0, i64 2
  %9 = load i32, i32* %arrayidx9, align 4
  %ercon10 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 2
  %idxprom11 = sext i32 %i.0.rewritten to i64
  %arrayidx12 = getelementptr inbounds [12 x i32], [12 x i32]* %ercon10, i64 0, i64 %idxprom11
  %10 = load i32, i32* %arrayidx12, align 4
  %xor13 = xor i32 %9, %10
  %arrayidx14 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %11 = load i32, i32* %arrayidx14, align 4
  %xor15 = xor i32 %11, %xor13
  store i32 %xor15, i32* %arrayidx14, align 4
  %a.unwrapped.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a.unwrapped.wrapped, i32 0, i32 0
  %a.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a.unwrapped.wrapped, i32 0, i32 1
  store i64 %a.field0.length, i64* %a.unwrapped.wrapped.field0.length.ptr, align 8
  store i32* %a.unwrapped, i32** %a.unwrapped.unwrapped, align 8
  call void @rho(%i32ptr.wrapped.ty* %a.unwrapped.wrapped)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i1, i1* %out.2, align 1
  %cond.fold6 = or i1 false, %12
  store i1 %cond.fold6, i1* %out.3, align 1
  %inc = add nsw i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %13 = load i1, i1* %out.1, align 1
  %14 = xor i1 %cmp, true
  %in.7 = and i1 %13, %14
  %cond.fold8 = or i1 false, %in.7
  store i1 %cond.fold8, i1* %out.4, align 1
  %k16 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx17 = getelementptr inbounds [3 x i32], [3 x i32]* %k16, i64 0, i64 0
  %15 = load i32, i32* %arrayidx17, align 4
  %ercon18 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 2
  %arrayidx19 = getelementptr inbounds [12 x i32], [12 x i32]* %ercon18, i64 0, i64 11
  %16 = load i32, i32* %arrayidx19, align 4
  %shl20 = shl i32 %16, 16
  %xor21 = xor i32 %15, %shl20
  %arrayidx22 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %17 = load i32, i32* %arrayidx22, align 4
  %xor23 = xor i32 %17, %xor21
  store i32 %xor23, i32* %arrayidx22, align 4
  %k24 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx25 = getelementptr inbounds [3 x i32], [3 x i32]* %k24, i64 0, i64 1
  %18 = load i32, i32* %arrayidx25, align 4
  %arrayidx26 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %19 = load i32, i32* %arrayidx26, align 4
  %xor27 = xor i32 %19, %18
  store i32 %xor27, i32* %arrayidx26, align 4
  %k28 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx29 = getelementptr inbounds [3 x i32], [3 x i32]* %k28, i64 0, i64 2
  %20 = load i32, i32* %arrayidx29, align 4
  %ercon30 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 2
  %arrayidx31 = getelementptr inbounds [12 x i32], [12 x i32]* %ercon30, i64 0, i64 11
  %21 = load i32, i32* %arrayidx31, align 4
  %xor32 = xor i32 %20, %21
  %arrayidx33 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %22 = load i32, i32* %arrayidx33, align 4
  %xor34 = xor i32 %22, %xor32
  store i32 %xor34, i32* %arrayidx33, align 4
  %a.unwrapped.unwrapped10 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a.unwrapped.wrapped9, i32 0, i32 0
  %a.unwrapped.wrapped9.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a.unwrapped.wrapped9, i32 0, i32 1
  store i64 %a.field0.length, i64* %a.unwrapped.wrapped9.field0.length.ptr, align 8
  store i32* %a.unwrapped, i32** %a.unwrapped.unwrapped10, align 8
  call void @theta(%i32ptr.wrapped.ty* %a.unwrapped.wrapped9)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @twy_key(%i32ptr.wrapped.ty* noundef %key, %struct.twy_ctx* noundef %c) #0 {
entry:
  %key.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %key, i32 0, i32 1
  %key.field0.length = load i64, i64* %key.field0.length.ptr, align 8
  %arraydecay15.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %arraydecay.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %arraydecay16.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %arraydecay17.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %key, i32 0, i32 0
  %key.unwrapped = load i32*, i32** %0, align 8
  %arrayidx = getelementptr inbounds i32, i32* %key.unwrapped, i64 0
  %1 = load i32, i32* %arrayidx, align 4
  %k = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx1 = getelementptr inbounds [3 x i32], [3 x i32]* %k, i64 0, i64 0
  store i32 %1, i32* %arrayidx1, align 4
  %ki = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 1
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %ki, i64 0, i64 0
  store i32 %1, i32* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds i32, i32* %key.unwrapped, i64 1
  %2 = load i32, i32* %arrayidx3, align 4
  %k4 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* %k4, i64 0, i64 1
  store i32 %2, i32* %arrayidx5, align 4
  %ki6 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 1
  %arrayidx7 = getelementptr inbounds [3 x i32], [3 x i32]* %ki6, i64 0, i64 1
  store i32 %2, i32* %arrayidx7, align 4
  %arrayidx8 = getelementptr inbounds i32, i32* %key.unwrapped, i64 2
  %3 = load i32, i32* %arrayidx8, align 4
  %k9 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %k9, i64 0, i64 2
  store i32 %3, i32* %arrayidx10, align 4
  %ki11 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 1
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %ki11, i64 0, i64 2
  store i32 %3, i32* %arrayidx12, align 4
  %ki13 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 1
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %ki13, i64 0, i64 0
  %arraydecay.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay.wrapped, i32 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay.wrapped, i32 0, i32 1
  store i64 3, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i32* %arraydecay, i32** %arraydecay.unwrapped, align 8
  call void @theta(%i32ptr.wrapped.ty* %arraydecay.wrapped)
  %ki14 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 1
  %arraydecay15 = getelementptr inbounds [3 x i32], [3 x i32]* %ki14, i64 0, i64 0
  %arraydecay15.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay15.wrapped, i32 0, i32 0
  %arraydecay15.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay15.wrapped, i32 0, i32 1
  store i64 3, i64* %arraydecay15.wrapped.field0.length.ptr, align 8
  store i32* %arraydecay15, i32** %arraydecay15.unwrapped, align 8
  call void @mu(%i32ptr.wrapped.ty* %arraydecay15.wrapped)
  %ercon = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 2
  %arraydecay16 = getelementptr inbounds [12 x i32], [12 x i32]* %ercon, i64 0, i64 0
  %arraydecay16.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay16.wrapped, i32 0, i32 0
  %arraydecay16.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay16.wrapped, i32 0, i32 1
  store i64 12, i64* %arraydecay16.wrapped.field0.length.ptr, align 8
  store i32* %arraydecay16, i32** %arraydecay16.unwrapped, align 8
  call void @rndcon_gen(i32 2827, %i32ptr.wrapped.ty* %arraydecay16.wrapped)
  %drcon = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 3
  %arraydecay17 = getelementptr inbounds [12 x i32], [12 x i32]* %drcon, i64 0, i64 0
  %arraydecay17.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay17.wrapped, i32 0, i32 0
  %arraydecay17.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay17.wrapped, i32 0, i32 1
  store i64 12, i64* %arraydecay17.wrapped.field0.length.ptr, align 8
  store i32* %arraydecay17, i32** %arraydecay17.unwrapped, align 8
  call void @rndcon_gen(i32 45489, %i32ptr.wrapped.ty* %arraydecay17.wrapped)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %arraydecay23.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %arraydecay24.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %gc = alloca %struct.twy_ctx, align 4
  %in_key = alloca [3 x i32], align 4
  %in = alloca [3 x i32], align 4
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %_zzq_args12 = alloca [6 x i64], align 16
  %_zzq_result13 = alloca i64, align 8
  store i1 true, i1* %out., align 1
  %in_key1 = bitcast [3 x i32]* %in_key to i8*
  call void @llvm.var.annotation(i8* %in_key1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 54, i8* null)
  %in2 = bitcast [3 x i32]* %in to i8*
  call void @llvm.var.annotation(i8* %in2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 55, i8* null)
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %in_key, i64 0, i64 0
  %0 = bitcast i32* %arraydecay to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef %0, i64 noundef 12)
  %arraydecay3 = getelementptr inbounds [3 x i32], [3 x i32]* %in, i64 0, i64 0
  %1 = bitcast i32* %arraydecay3 to i8*
  %call4 = call i64 @read(i32 noundef 0, i8* noundef %1, i64 noundef 12)
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %arraydecay5 = getelementptr inbounds [3 x i32], [3 x i32]* %in_key, i64 0, i64 0
  %2 = ptrtoint i32* %arraydecay5 to i64
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %2, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 3, i64* %arrayidx7, align 16
  %arrayidx8 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx9, align 16
  %arrayidx10 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx10, align 8
  %arrayidx11 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %3 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx11, i64 0) #3, !srcloc !10
  store volatile i64 %3, i64* %_zzq_result, align 8
  %4 = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx14 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx14, align 16
  %arraydecay15 = getelementptr inbounds [3 x i32], [3 x i32]* %in, i64 0, i64 0
  %5 = ptrtoint i32* %arraydecay15 to i64
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 1
  store volatile i64 %5, i64* %arrayidx16, align 8
  %arrayidx17 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 2
  store volatile i64 3, i64* %arrayidx17, align 16
  %arrayidx18 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx18, align 8
  %arrayidx19 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx19, align 16
  %arrayidx20 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx20, align 8
  %arrayidx21 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 0
  %6 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx21, i64 0) #3, !srcloc !11
  store volatile i64 %6, i64* %_zzq_result13, align 8
  %7 = load volatile i64, i64* %_zzq_result13, align 8
  %arraydecay23 = getelementptr inbounds [3 x i32], [3 x i32]* %in_key, i64 0, i64 0
  %arraydecay23.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay23.wrapped, i32 0, i32 0
  %arraydecay23.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay23.wrapped, i32 0, i32 1
  store i64 3, i64* %arraydecay23.wrapped.field0.length.ptr, align 8
  store i32* %arraydecay23, i32** %arraydecay23.unwrapped, align 8
  call void @twy_key(%i32ptr.wrapped.ty* %arraydecay23.wrapped, %struct.twy_ctx* %gc)
  %arraydecay24 = getelementptr inbounds [3 x i32], [3 x i32]* %in, i64 0, i64 0
  %arraydecay24.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay24.wrapped, i32 0, i32 0
  %arraydecay24.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay24.wrapped, i32 0, i32 1
  store i64 3, i64* %arraydecay24.wrapped.field0.length.ptr, align 8
  store i32* %arraydecay24, i32** %arraydecay24.unwrapped, align 8
  call void @encrypt(%struct.twy_ctx* %gc, %i32ptr.wrapped.ty* %arraydecay24.wrapped)
  %arraydecay25 = getelementptr inbounds [3 x i32], [3 x i32]* %in, i64 0, i64 0
  %8 = bitcast i32* %arraydecay25 to i8*
  %call26 = call i64 @write(i32 noundef 1, i8* noundef %8, i64 noundef 12)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #2

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
!10 = !{i64 2148230653, i64 2148230689, i64 2148230757}
!11 = !{i64 2148232213, i64 2148232249, i64 2148232317}

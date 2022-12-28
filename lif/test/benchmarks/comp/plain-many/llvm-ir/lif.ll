; ModuleID = 'llvm-ir/base.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"i32*ptr.wrapped.ty" = type { i32**, i64 }
%i32ptr.wrapped.ty = type { i32*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @comp(%"i32*ptr.wrapped.ty"* noundef %a, %i32ptr.wrapped.ty* noundef %b, i32 noundef %n, i32 noundef %m) #0 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %"i32*ptr.wrapped.ty", %"i32*ptr.wrapped.ty"* %a, i32 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
  %b.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b, i32 0, i32 1
  %b.field0.length = load i64, i64* %b.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.5 = alloca i1, align 1
  store i1 false, i1* %out.5, align 1
  %out.6 = alloca i1, align 1
  store i1 false, i1* %out.6, align 1
  %out.7 = alloca i1, align 1
  store i1 false, i1* %out.7, align 1
  %out.8 = alloca i1, align 1
  store i1 false, i1* %out.8, align 1
  %out.frozen = alloca i1, align 1
  store i1 false, i1* %out.frozen, align 1
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
  %out.frozen14 = alloca i1, align 1
  store i1 false, i1* %out.frozen14, align 1
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
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.11, align 1
  store i1 false, i1* %out.17, align 1
  %0 = getelementptr inbounds %"i32*ptr.wrapped.ty", %"i32*ptr.wrapped.ty"* %a, i32 0, i32 0
  %a.unwrapped = load i32**, i32*** %0, align 8
  %1 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b, i32 0, i32 0
  %b.unwrapped = load i32*, i32** %1, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc10, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %exitpred.frozen1.rewritten = phi i1 [ %35, %for.inc ], [ false, %entry ]
  %2 = load i1, i1* %out.17, align 1
  %3 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %3
  %cond.fold = or i1 %fwcond.and.fwtaken, %2
  store i1 %cond.fold, i1* %out.5, align 1
  %4 = load i1, i1* %out.5, align 1
  %cmp = icmp slt i32 %i.0.rewritten, %n
  br i1 %cmp, label %for.body, label %if.then8

for.body:                                         ; preds = %for.cond
  %5 = load i1, i1* %out.5, align 1
  %in. = and i1 %5, %cmp
  %cond.fold20 = or i1 false, %in.
  store i1 %cond.fold20, i1* %out.6, align 1
  %6 = load i1, i1* %out.6, align 1
  br label %while.cond

while.cond:                                       ; preds = %if.end, %for.body
  %j.0.rewritten = phi i32 [ 0, %for.body ], [ %inc, %if.end ]
  %fwedge.taken2.rewritten = phi i1 [ true, %for.body ], [ false, %if.end ]
  %exitpred.frozen3.rewritten = phi i1 [ %cmp1, %if.end ], [ false, %for.body ]
  %exitpred.frozen4.rewritten = phi i1 [ %21, %if.end ], [ false, %for.body ]
  %incval.phi = phi i32 [ %j.0.rewritten, %if.end ], [ undef, %for.body ]
  %7 = load i1, i1* %out.11, align 1
  %8 = load i1, i1* %out.6, align 1
  %fwcond.and.fwtaken21 = and i1 %fwedge.taken2.rewritten, %8
  %cond.fold22 = or i1 %fwcond.and.fwtaken21, %7
  store i1 %cond.fold22, i1* %out.7, align 1
  %9 = load i1, i1* %out.7, align 1
  %cmp1 = icmp slt i32 %j.0.rewritten, %m
  br i1 %cmp1, label %while.body, label %if.then

while.body:                                       ; preds = %while.cond
  %10 = load i1, i1* %out.7, align 1
  %in.23 = and i1 %10, %cmp1
  %cond.fold24 = or i1 false, %in.23
  store i1 %cond.fold24, i1* %out.8, align 1
  %11 = load i1, i1* %out.8, align 1
  %load.frozen = load i1, i1* %out.frozen, align 1
  %or.frozen = or i1 %load.frozen, %cond.fold24
  store i1 %or.frozen, i1* %out.frozen, align 1
  %idxprom = sext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds i32*, i32** %a.unwrapped, i64 %idxprom
  %idx0.safe = icmp slt i64 %idxprom, %a.field0.length
  %12 = or i1 %11, %idx0.safe
  %13 = bitcast i64* %shadow to i32**
  %ctsel = select i1 %12, i32** %arrayidx, i32** %13
  %14 = load i32*, i32** %ctsel, align 8
  %idxprom2 = sext i32 %j.0.rewritten to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %14, i64 %idxprom2
  %idx0.safe45 = icmp slt i64 %idxprom2, %a.field0.length
  %15 = or i1 %11, %idx0.safe45
  %16 = bitcast i64* %shadow to i32*
  %ctsel46 = select i1 %15, i32* %arrayidx3, i32* %16
  %17 = load i32, i32* %ctsel46, align 4
  %idxprom4 = sext i32 %j.0.rewritten to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %b.unwrapped, i64 %idxprom4
  %idx0.safe47 = icmp slt i64 %idxprom4, %b.field0.length
  %18 = or i1 %11, %idx0.safe47
  %19 = bitcast i64* %shadow to i32*
  %ctsel48 = select i1 %18, i32* %arrayidx5, i32* %19
  %20 = load i32, i32* %ctsel48, align 4
  %cmp6 = icmp ne i32 %17, %20
  %21 = or i1 %cmp6, %exitpred.frozen4.rewritten
  br label %if.else

if.then:                                          ; preds = %while.cond
  %j.0.lcssa1.rewritten = phi i32 [ %incval.phi, %while.cond ]
  %22 = load i1, i1* %out.frozen, align 1
  %in.25 = and i1 %22, %exitpred.frozen4.rewritten
  %cond.fold26 = or i1 false, %in.25
  store i1 %cond.fold26, i1* %out.9, align 1
  %23 = load i1, i1* %out.9, align 1
  br label %while.end.loopexit

if.else:                                          ; preds = %while.body
  %24 = load i1, i1* %out.8, align 1
  %25 = xor i1 %21, true
  %in.27 = and i1 %24, %25
  %cond.fold28 = or i1 false, %in.27
  store i1 %cond.fold28, i1* %out.10, align 1
  %26 = load i1, i1* %out.10, align 1
  %inc = add nsw i32 %j.0.rewritten, 1
  br label %if.end

if.end:                                           ; preds = %if.else
  %27 = load i1, i1* %out.10, align 1
  %cond.fold29 = or i1 false, %27
  store i1 %cond.fold29, i1* %out.11, align 1
  %28 = load i1, i1* %out.11, align 1
  br label %while.cond, !llvm.loop !6

while.end.loopexit:                               ; preds = %if.then
  %j.0.lcssa.rewritten = phi i32 [ %j.0.rewritten, %if.then ]
  %29 = load i1, i1* %out.7, align 1
  %30 = xor i1 %cmp1, true
  %in.30 = and i1 %29, %30
  %cond.fold31 = or i1 false, %in.30
  store i1 %cond.fold31, i1* %out.12, align 1
  %31 = load i1, i1* %out.12, align 1
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit
  %j.02.rewritten = phi i32 [ %j.0.lcssa.rewritten, %while.end.loopexit ]
  %32 = load i1, i1* %out.12, align 1
  %33 = load i1, i1* %out.9, align 1
  %phi.fold = select i1 %33, i32 %j.0.lcssa1.rewritten, i32 %j.02.rewritten
  %cond.fold32 = or i1 false, %32
  %cond.fold33 = or i1 %cond.fold32, %33
  store i1 %cond.fold33, i1* %out.13, align 1
  %34 = load i1, i1* %out.13, align 1
  %load.frozen34 = load i1, i1* %out.frozen14, align 1
  %or.frozen35 = or i1 %load.frozen34, %cond.fold33
  store i1 %or.frozen35, i1* %out.frozen14, align 1
  %cmp7 = icmp eq i32 %phi.fold, %m
  %35 = or i1 %cmp7, %exitpred.frozen1.rewritten
  br label %if.end9

if.then8:                                         ; preds = %for.cond
  %36 = load i1, i1* %out.frozen14, align 1
  %in.36 = and i1 %36, %exitpred.frozen1.rewritten
  %cond.fold37 = or i1 false, %in.36
  store i1 %cond.fold37, i1* %out.15, align 1
  %37 = load i1, i1* %out.15, align 1
  br label %for.end

if.end9:                                          ; preds = %while.end
  %38 = load i1, i1* %out.13, align 1
  %39 = xor i1 %35, true
  %in.38 = and i1 %38, %39
  %cond.fold39 = or i1 false, %in.38
  store i1 %cond.fold39, i1* %out.16, align 1
  %40 = load i1, i1* %out.16, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %41 = load i1, i1* %out.16, align 1
  %cond.fold40 = or i1 false, %41
  store i1 %cond.fold40, i1* %out.17, align 1
  %42 = load i1, i1* %out.17, align 1
  %inc10 = add nsw i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %if.then8
  %43 = load i1, i1* %out.5, align 1
  %44 = xor i1 %cmp, true
  %in.41 = and i1 %43, %44
  %cond.fold42 = or i1 false, %in.41
  store i1 %cond.fold42, i1* %out.18, align 1
  %45 = load i1, i1* %out.18, align 1
  br label %return

return:                                           ; preds = %for.end
  %retval.0.rewritten = phi i32 [ 0, %for.end ]
  %46 = load i1, i1* %out.18, align 1
  %47 = load i1, i1* %out.15, align 1
  %phi.fold49 = select i1 %47, i32 1, i32 %retval.0.rewritten
  %cond.fold43 = or i1 false, %47
  %cond.fold44 = or i1 %cond.fold43, %46
  store i1 %cond.fold44, i1* %out.19, align 1
  ret i32 %phi.fold49
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %arg.wrapped = alloca %"i32*ptr.wrapped.ty", align 8
  %arg.wrapped22 = alloca %i32ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
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
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %b = alloca i32*, align 8
  %r = alloca i32, align 4
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.5, align 1
  store i1 false, i1* %out.9, align 1
  %0 = bitcast i32* %n to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef %0, i64 noundef 4)
  %1 = bitcast i32* %m to i8*
  %call1 = call i64 @read(i32 noundef 0, i8* noundef %1, i64 noundef 4)
  %call2 = call noalias i8* @malloc(i64 noundef 40) #4
  %2 = bitcast i8* %call2 to i32**
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %3 = load i1, i1* %out.5, align 1
  %4 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %4
  %cond.fold = or i1 %fwcond.and.fwtaken, %3
  store i1 %cond.fold, i1* %out.3, align 1
  %cmp = icmp slt i32 %i.0.rewritten, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i1, i1* %out.3, align 1
  %in. = and i1 %5, %cmp
  %cond.fold11 = or i1 false, %in.
  store i1 %cond.fold11, i1* %out.4, align 1
  %6 = load i32, i32* %n, align 4
  %conv = sext i32 %6 to i64
  %mul = mul i64 %conv, 4
  %call3 = call noalias i8* @malloc(i64 noundef %mul) #4
  %7 = bitcast i8* %call3 to i32*
  %idxprom = sext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds i32*, i32** %2, i64 %idxprom
  store i32* %7, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i1, i1* %out.4, align 1
  %cond.fold12 = or i1 false, %8
  store i1 %cond.fold12, i1* %out.5, align 1
  %inc = add nsw i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %9 = load i1, i1* %out.3, align 1
  %10 = xor i1 %cmp, true
  %in.13 = and i1 %9, %10
  %cond.fold14 = or i1 false, %in.13
  store i1 %cond.fold14, i1* %out.6, align 1
  %b4 = bitcast i32** %b to i8*
  call void @llvm.var.annotation(i8* %b4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 30, i8* null)
  %11 = load i32, i32* %n, align 4
  %conv5 = sext i32 %11 to i64
  %mul6 = mul i64 %conv5, 4
  %call7 = call noalias i8* @malloc(i64 noundef %mul6) #4
  %12 = bitcast i8* %call7 to i32*
  store i32* %12, i32** %b, align 8
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc18, %for.end
  %i8.0.rewritten = phi i32 [ 0, %for.end ], [ %inc19, %for.inc18 ]
  %fwedge.taken1.rewritten = phi i1 [ true, %for.end ], [ false, %for.inc18 ]
  %exitpred.frozen2.rewritten = phi i1 [ %cmp10, %for.inc18 ], [ false, %for.end ]
  %13 = load i1, i1* %out.9, align 1
  %14 = load i1, i1* %out.6, align 1
  %fwcond.and.fwtaken15 = and i1 %fwedge.taken1.rewritten, %14
  %cond.fold16 = or i1 %fwcond.and.fwtaken15, %13
  store i1 %cond.fold16, i1* %out.7, align 1
  %cmp10 = icmp slt i32 %i8.0.rewritten, 5
  br i1 %cmp10, label %for.body12, label %for.end20

for.body12:                                       ; preds = %for.cond9
  %15 = load i1, i1* %out.7, align 1
  %in.17 = and i1 %15, %cmp10
  %cond.fold18 = or i1 false, %in.17
  store i1 %cond.fold18, i1* %out.8, align 1
  %idxprom13 = sext i32 %i8.0.rewritten to i64
  %arrayidx14 = getelementptr inbounds i32*, i32** %2, i64 %idxprom13
  %16 = load i32*, i32** %arrayidx14, align 8
  %17 = bitcast i32* %16 to i8*
  %18 = load i32, i32* %n, align 4
  %conv15 = sext i32 %18 to i64
  %mul16 = mul i64 4, %conv15
  %call17 = call i64 @read(i32 noundef 0, i8* noundef %17, i64 noundef %mul16)
  br label %for.inc18

for.inc18:                                        ; preds = %for.body12
  %19 = load i1, i1* %out.8, align 1
  %cond.fold19 = or i1 false, %19
  store i1 %cond.fold19, i1* %out.9, align 1
  %inc19 = add nsw i32 %i8.0.rewritten, 1
  br label %for.cond9, !llvm.loop !10

for.end20:                                        ; preds = %for.cond9
  %20 = load i1, i1* %out.7, align 1
  %21 = xor i1 %cmp10, true
  %in.20 = and i1 %20, %21
  %cond.fold21 = or i1 false, %in.20
  store i1 %cond.fold21, i1* %out.10, align 1
  %22 = load i32*, i32** %b, align 8
  %23 = bitcast i32* %22 to i8*
  %24 = load i32, i32* %n, align 4
  %conv21 = sext i32 %24 to i64
  %mul22 = mul i64 4, %conv21
  %call23 = call i64 @read(i32 noundef 0, i8* noundef %23, i64 noundef %mul22)
  %25 = load i32*, i32** %b, align 8
  %26 = load i32, i32* %m, align 4
  %arg.unwrapped = getelementptr inbounds %"i32*ptr.wrapped.ty", %"i32*ptr.wrapped.ty"* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %"i32*ptr.wrapped.ty", %"i32*ptr.wrapped.ty"* %arg.wrapped, i32 0, i32 1
  store i64 5, i64* %arg.wrapped.field0.length.ptr, align 8
  store i32** %2, i32*** %arg.unwrapped, align 8
  %arg.unwrapped23 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arg.wrapped22, i32 0, i32 0
  %arg.wrapped22.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arg.wrapped22, i32 0, i32 1
  store i64 0, i64* %arg.wrapped22.field0.length.ptr, align 8
  store i32* %25, i32** %arg.unwrapped23, align 8
  %call24 = call i32 @comp(%"i32*ptr.wrapped.ty"* %arg.wrapped, %i32ptr.wrapped.ty* %arg.wrapped22, i32 5, i32 %26)
  store i32 %call24, i32* %r, align 4
  %27 = bitcast i32* %r to i8*
  %call25 = call i64 @write(i32 noundef 1, i8* noundef %27, i64 noundef 4)
  ret i32 0
}

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #3

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #1

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #4 = { nounwind }

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

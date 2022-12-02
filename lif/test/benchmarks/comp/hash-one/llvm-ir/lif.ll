; ModuleID = 'llvm-ir/base.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%i32ptr.wrapped.ty = type { i32*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @comp(%i32ptr.wrapped.ty* noundef %a, %i32ptr.wrapped.ty* noundef %b, i32 noundef %n) #0 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
  %b.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b, i32 0, i32 1
  %b.field0.length = load i64, i64* %b.field0.length.ptr, align 8
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
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.8, align 1
  store i1 false, i1* %out.15, align 1
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 0
  %a.unwrapped = load i32*, i32** %0, align 8
  %1 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b, i32 0, i32 0
  %b.unwrapped = load i32*, i32** %1, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %ha.0.rewritten = phi i32 [ 1, %entry ], [ %ha.1.rewritten, %for.inc ]
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc3, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %2 = load i1, i1* %out.8, align 1
  %3 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %3
  %cond.fold = or i1 %fwcond.and.fwtaken, %2
  store i1 %cond.fold, i1* %out.3, align 1
  %cmp = icmp slt i32 %i.0.rewritten, %n
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i1, i1* %out.3, align 1
  %in. = and i1 %4, %cmp
  %cond.fold20 = or i1 false, %in.
  store i1 %cond.fold20, i1* %out.4, align 1
  %idxprom = sext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds i32, i32* %a.unwrapped, i64 %idxprom
  %5 = load i32, i32* %arrayidx, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %6 = load i1, i1* %out.4, align 1
  %in.21 = and i1 %6, %tobool
  %cond.fold22 = or i1 false, %in.21
  store i1 %cond.fold22, i1* %out.5, align 1
  %idxprom1 = sext i32 %i.0.rewritten to i64
  %arrayidx2 = getelementptr inbounds i32, i32* %a.unwrapped, i64 %idxprom1
  %7 = load i32, i32* %arrayidx2, align 4
  %mul = mul nsw i32 %ha.0.rewritten, %7
  %rem = srem i32 %mul, 1024
  br label %if.end

if.else:                                          ; preds = %for.body
  %8 = load i1, i1* %out.4, align 1
  %9 = xor i1 %tobool, true
  %in.23 = and i1 %8, %9
  %cond.fold24 = or i1 false, %in.23
  store i1 %cond.fold24, i1* %out.6, align 1
  %inc = add nsw i32 %ha.0.rewritten, 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %ha.1.rewritten = phi i32 [ %rem, %if.then ], [ %inc, %if.else ]
  %10 = load i1, i1* %out.6, align 1
  %11 = load i1, i1* %out.5, align 1
  %cond.fold25 = or i1 false, %11
  %cond.fold26 = or i1 %cond.fold25, %10
  store i1 %cond.fold26, i1* %out.7, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %12 = load i1, i1* %out.7, align 1
  %cond.fold27 = or i1 false, %12
  store i1 %cond.fold27, i1* %out.8, align 1
  %inc3 = add nsw i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %ha.0.lcssa.rewritten = phi i32 [ %ha.0.rewritten, %for.cond ]
  %13 = load i1, i1* %out.3, align 1
  %14 = xor i1 %cmp, true
  %in.28 = and i1 %13, %14
  %cond.fold29 = or i1 false, %in.28
  store i1 %cond.fold29, i1* %out.9, align 1
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc19, %for.end
  %hb.0.rewritten = phi i32 [ 1, %for.end ], [ %phi.fold, %for.inc19 ]
  %i4.0.rewritten = phi i32 [ 0, %for.end ], [ %inc20, %for.inc19 ]
  %fwedge.taken1.rewritten = phi i1 [ true, %for.end ], [ false, %for.inc19 ]
  %exitpred.frozen2.rewritten = phi i1 [ %cmp6, %for.inc19 ], [ false, %for.end ]
  %15 = load i1, i1* %out.15, align 1
  %16 = load i1, i1* %out.9, align 1
  %fwcond.and.fwtaken30 = and i1 %fwedge.taken1.rewritten, %16
  %cond.fold31 = or i1 %fwcond.and.fwtaken30, %15
  store i1 %cond.fold31, i1* %out.10, align 1
  %cmp6 = icmp slt i32 %i4.0.rewritten, %n
  br i1 %cmp6, label %for.body7, label %for.end21

for.body7:                                        ; preds = %for.cond5
  %17 = load i1, i1* %out.10, align 1
  %in.32 = and i1 %17, %cmp6
  %cond.fold33 = or i1 false, %in.32
  store i1 %cond.fold33, i1* %out.11, align 1
  %idxprom8 = sext i32 %i4.0.rewritten to i64
  %arrayidx9 = getelementptr inbounds i32, i32* %b.unwrapped, i64 %idxprom8
  %18 = load i32, i32* %arrayidx9, align 4
  %tobool10 = icmp ne i32 %18, 0
  br label %if.else16

if.then11:                                        ; preds = %if.else16
  %19 = load i1, i1* %out.11, align 1
  %in.34 = and i1 %19, %tobool10
  %cond.fold35 = or i1 false, %in.34
  store i1 %cond.fold35, i1* %out.12, align 1
  %20 = load i1, i1* %out.12, align 1
  %idxprom12 = sext i32 %i4.0.rewritten to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %b.unwrapped, i64 %idxprom12
  %idx0.safe = icmp slt i64 %idxprom12, %b.field0.length
  %21 = or i1 %20, %idx0.safe
  %22 = bitcast i64* %shadow to i32*
  %ctsel = select i1 %21, i32* %arrayidx13, i32* %22
  %23 = load i32, i32* %ctsel, align 4
  %mul14 = mul nsw i32 %hb.0.rewritten, %23
  %rem15 = srem i32 %mul14, 1024
  br label %if.end18

if.else16:                                        ; preds = %for.body7
  %24 = load i1, i1* %out.11, align 1
  %25 = xor i1 %tobool10, true
  %in.36 = and i1 %24, %25
  %cond.fold37 = or i1 false, %in.36
  store i1 %cond.fold37, i1* %out.13, align 1
  %26 = load i1, i1* %out.13, align 1
  %inc17 = add nsw i32 %hb.0.rewritten, 1
  br label %if.then11

if.end18:                                         ; preds = %if.then11
  %hb.1.rewritten = phi i32 [ %rem15, %if.then11 ]
  %27 = load i1, i1* %out.13, align 1
  %phi.fold = select i1 %27, i32 %inc17, i32 %hb.1.rewritten
  %28 = load i1, i1* %out.12, align 1
  %cond.fold38 = or i1 false, %27
  %cond.fold39 = or i1 %cond.fold38, %28
  store i1 %cond.fold39, i1* %out.14, align 1
  br label %for.inc19

for.inc19:                                        ; preds = %if.end18
  %29 = load i1, i1* %out.14, align 1
  %cond.fold40 = or i1 false, %29
  store i1 %cond.fold40, i1* %out.15, align 1
  %inc20 = add nsw i32 %i4.0.rewritten, 1
  br label %for.cond5, !llvm.loop !8

for.end21:                                        ; preds = %for.cond5
  %hb.0.lcssa.rewritten = phi i32 [ %hb.0.rewritten, %for.cond5 ]
  %30 = load i1, i1* %out.10, align 1
  %31 = xor i1 %cmp6, true
  %in.41 = and i1 %30, %31
  %cond.fold42 = or i1 false, %in.41
  store i1 %cond.fold42, i1* %out.16, align 1
  %cmp22 = icmp eq i32 %ha.0.lcssa.rewritten, %hb.0.lcssa.rewritten
  br label %if.else24

if.then23:                                        ; preds = %if.else24
  %32 = load i1, i1* %out.16, align 1
  %in.43 = and i1 %32, %cmp22
  %cond.fold44 = or i1 false, %in.43
  store i1 %cond.fold44, i1* %out.17, align 1
  %33 = load i1, i1* %out.17, align 1
  br label %return

if.else24:                                        ; preds = %for.end21
  %34 = load i1, i1* %out.16, align 1
  %35 = xor i1 %cmp22, true
  %in.45 = and i1 %34, %35
  %cond.fold46 = or i1 false, %in.45
  store i1 %cond.fold46, i1* %out.18, align 1
  %36 = load i1, i1* %out.18, align 1
  br label %if.then23

return:                                           ; preds = %if.then23
  %retval.0.rewritten = phi i32 [ 1, %if.then23 ]
  %37 = load i1, i1* %out.18, align 1
  %phi.fold49 = select i1 %37, i32 0, i32 %retval.0.rewritten
  %38 = load i1, i1* %out.17, align 1
  %cond.fold47 = or i1 false, %38
  %cond.fold48 = or i1 %cond.fold47, %37
  store i1 %cond.fold48, i1* %out.19, align 1
  ret i32 %phi.fold49
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %arg.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %arg.wrapped1 = alloca %i32ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %b = alloca i32*, align 8
  %r = alloca i32, align 4
  store i1 true, i1* %out., align 1
  %0 = bitcast i32* %n to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef %0, i64 noundef 4)
  %1 = bitcast i32* %m to i8*
  %call1 = call i64 @read(i32 noundef 0, i8* noundef %1, i64 noundef 4)
  %2 = load i32, i32* %n, align 4
  %conv = sext i32 %2 to i64
  %mul = mul i64 %conv, 4
  %call2 = call noalias i8* @malloc(i64 noundef %mul) #4
  %3 = bitcast i8* %call2 to i32*
  %b3 = bitcast i32** %b to i8*
  call void @llvm.var.annotation(i8* %b3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 28, i8* null)
  %4 = load i32, i32* %n, align 4
  %conv4 = sext i32 %4 to i64
  %mul5 = mul i64 %conv4, 4
  %call6 = call noalias i8* @malloc(i64 noundef %mul5) #4
  %5 = bitcast i8* %call6 to i32*
  store i32* %5, i32** %b, align 8
  %6 = bitcast i32* %3 to i8*
  %7 = load i32, i32* %n, align 4
  %conv7 = sext i32 %7 to i64
  %mul8 = mul i64 4, %conv7
  %call9 = call i64 @read(i32 noundef 0, i8* noundef %6, i64 noundef %mul8)
  %8 = load i32*, i32** %b, align 8
  %9 = bitcast i32* %8 to i8*
  %10 = load i32, i32* %n, align 4
  %conv10 = sext i32 %10 to i64
  %mul11 = mul i64 4, %conv10
  %call12 = call i64 @read(i32 noundef 0, i8* noundef %9, i64 noundef %mul11)
  %11 = load i32*, i32** %b, align 8
  %12 = load i32, i32* %m, align 4
  %arg.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arg.wrapped, i32 0, i32 1
  store i64 %conv, i64* %arg.wrapped.field0.length.ptr, align 8
  store i32* %3, i32** %arg.unwrapped, align 8
  %arg.unwrapped2 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arg.wrapped1, i32 0, i32 0
  %arg.wrapped1.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arg.wrapped1, i32 0, i32 1
  store i64 0, i64* %arg.wrapped1.field0.length.ptr, align 8
  store i32* %11, i32** %arg.unwrapped2, align 8
  %call13 = call i32 @comp(%i32ptr.wrapped.ty* %arg.wrapped, %i32ptr.wrapped.ty* %arg.wrapped1, i32 %12)
  store i32 %call13, i32* %r, align 4
  %13 = bitcast i32* %r to i8*
  %call14 = call i64 @write(i32 noundef 1, i8* noundef %13, i64 noundef 4)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
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

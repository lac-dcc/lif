; ModuleID = 'llvm-ir/base.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%i32ptr.wrapped.ty = type { i32*, i64 }

@foo = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @max(i32 noundef %n, %i32ptr.wrapped.ty* noundef %h) #0 {
entry:
  %h.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %h, i32 0, i32 1
  %h.field0.length = load i64, i64* %h.field0.length.ptr, align 8
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
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.4, align 1
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %h, i32 0, i32 0
  %h.unwrapped = load i32*, i32** %0, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %if.end ]
  %m.0.rewritten = phi i32 [ 0, %entry ], [ %phi.fold, %if.end ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %if.end ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %if.end ], [ false, %entry ]
  %1 = load i1, i1* %out.4, align 1
  %2 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %2
  %cond.fold = or i1 %fwcond.and.fwtaken, %1
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp slt i32 %i.0.rewritten, %n
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i1, i1* %out.1, align 1
  %in. = and i1 %3, %cmp
  %cond.fold6 = or i1 false, %in.
  store i1 %cond.fold6, i1* %out.2, align 1
  %idxprom = sext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds i32, i32* %h.unwrapped, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp sgt i32 %4, %m.0.rewritten
  br label %if.then

if.then:                                          ; preds = %while.body
  %5 = load i1, i1* %out.2, align 1
  %in.7 = and i1 %5, %cmp1
  %cond.fold8 = or i1 false, %in.7
  store i1 %cond.fold8, i1* %out.3, align 1
  %6 = load i1, i1* %out.3, align 1
  %idxprom2 = sext i32 %i.0.rewritten to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %h.unwrapped, i64 %idxprom2
  %idx0.safe = icmp slt i64 %idxprom2, %h.field0.length
  %7 = or i1 %6, %idx0.safe
  %8 = bitcast i64* %shadow to i32*
  %ctsel = select i1 %7, i32* %arrayidx3, i32* %8
  %9 = load i32, i32* %ctsel, align 4
  br label %if.end

if.end:                                           ; preds = %if.then
  %m.1.rewritten = phi i32 [ %9, %if.then ]
  %10 = load i1, i1* %out.3, align 1
  %11 = load i1, i1* %out.2, align 1
  %12 = xor i1 %cmp1, true
  %in.9 = and i1 %11, %12
  %phi.fold = select i1 %in.9, i32 %m.0.rewritten, i32 %m.1.rewritten
  %cond.fold10 = or i1 false, %in.9
  %cond.fold11 = or i1 %cond.fold10, %10
  store i1 %cond.fold11, i1* %out.4, align 1
  %inc = add nsw i32 %i.0.rewritten, 1
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %m.0.lcssa.rewritten = phi i32 [ %m.0.rewritten, %while.cond ]
  %13 = load i1, i1* %out.1, align 1
  %14 = xor i1 %cmp, true
  %in.12 = and i1 %13, %14
  %cond.fold13 = or i1 false, %in.12
  store i1 %cond.fold13, i1* %out.5, align 1
  ret i32 %m.0.lcssa.rewritten
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %arraydecay.wrapped = alloca %i32ptr.wrapped.ty, align 8
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
  %in = alloca [1000 x i32], align 16
  %r = alloca i32, align 4
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.3, align 1
  %in1 = bitcast [1000 x i32]* %in to i8*
  call void @llvm.var.annotation(i8* %in1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 18, i8* null)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %0 = load i1, i1* %out.3, align 1
  %1 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %1
  %cond.fold = or i1 %fwcond.and.fwtaken, %0
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp slt i32 %i.0.rewritten, 1000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i1, i1* %out.1, align 1
  %in. = and i1 %2, %cmp
  %cond.fold5 = or i1 false, %in.
  store i1 %cond.fold5, i1* %out.2, align 1
  %idxprom = sext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds [1000 x i32], [1000 x i32]* %in, i64 0, i64 %idxprom
  %3 = bitcast i32* %arrayidx to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef %3, i64 noundef 4)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i1, i1* %out.2, align 1
  %cond.fold6 = or i1 false, %4
  store i1 %cond.fold6, i1* %out.3, align 1
  %inc = add nsw i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %5 = load i1, i1* %out.1, align 1
  %6 = xor i1 %cmp, true
  %in.7 = and i1 %5, %6
  %cond.fold8 = or i1 false, %in.7
  store i1 %cond.fold8, i1* %out.4, align 1
  %arraydecay = getelementptr inbounds [1000 x i32], [1000 x i32]* %in, i64 0, i64 0
  %arraydecay.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay.wrapped, i32 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay.wrapped, i32 0, i32 1
  store i64 1000, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i32* %arraydecay, i32** %arraydecay.unwrapped, align 8
  %call2 = call i32 @max(i32 1000, %i32ptr.wrapped.ty* %arraydecay.wrapped)
  store i32 %call2, i32* %r, align 4
  %7 = bitcast i32* %r to i8*
  %call3 = call i64 @write(i32 noundef 1, i8* noundef %7, i64 noundef 4)
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #2

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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

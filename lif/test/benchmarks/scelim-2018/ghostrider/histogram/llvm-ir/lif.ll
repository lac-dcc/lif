; ModuleID = 'llvm-ir/base.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%i32ptr.wrapped.ty = type { i32*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @histogram(%i32ptr.wrapped.ty* noundef %a, %i32ptr.wrapped.ty* noundef %c) #0 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
  %c.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %c, i32 0, i32 1
  %c.field0.length = load i64, i64* %c.field0.length.ptr, align 8
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
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.5, align 1
  store i1 false, i1* %out.12, align 1
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 0
  %a.unwrapped = load i32*, i32** %0, align 8
  %1 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %c, i32 0, i32 0
  %c.unwrapped = load i32*, i32** %1, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %2 = load i1, i1* %out.5, align 1
  %3 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %3
  %cond.fold = or i1 %fwcond.and.fwtaken, %2
  store i1 %cond.fold, i1* %out.3, align 1
  %cmp = icmp slt i32 %i.0.rewritten, 1000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i1, i1* %out.3, align 1
  %in. = and i1 %4, %cmp
  %cond.fold14 = or i1 false, %in.
  store i1 %cond.fold14, i1* %out.4, align 1
  %idxprom = sext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds i32, i32* %c.unwrapped, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i1, i1* %out.4, align 1
  %cond.fold15 = or i1 false, %5
  store i1 %cond.fold15, i1* %out.5, align 1
  %inc = add nsw i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %6 = load i1, i1* %out.3, align 1
  %7 = xor i1 %cmp, true
  %in.16 = and i1 %6, %7
  %cond.fold17 = or i1 false, %in.16
  store i1 %cond.fold17, i1* %out.6, align 1
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc12, %for.end
  %i.1.rewritten = phi i32 [ 0, %for.end ], [ %inc13, %for.inc12 ]
  %fwedge.taken1.rewritten = phi i1 [ true, %for.end ], [ false, %for.inc12 ]
  %exitpred.frozen2.rewritten = phi i1 [ %cmp2, %for.inc12 ], [ false, %for.end ]
  %8 = load i1, i1* %out.12, align 1
  %9 = load i1, i1* %out.6, align 1
  %fwcond.and.fwtaken18 = and i1 %fwedge.taken1.rewritten, %9
  %cond.fold19 = or i1 %fwcond.and.fwtaken18, %8
  store i1 %cond.fold19, i1* %out.7, align 1
  %cmp2 = icmp slt i32 %i.1.rewritten, 1000
  br i1 %cmp2, label %for.body3, label %for.end14

for.body3:                                        ; preds = %for.cond1
  %10 = load i1, i1* %out.7, align 1
  %in.20 = and i1 %10, %cmp2
  %cond.fold21 = or i1 false, %in.20
  store i1 %cond.fold21, i1* %out.8, align 1
  %idxprom4 = sext i32 %i.1.rewritten to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %a.unwrapped, i64 %idxprom4
  %11 = load i32, i32* %arrayidx5, align 4
  %cmp6 = icmp sgt i32 %11, 0
  br label %if.else

if.then:                                          ; preds = %if.else
  %12 = load i1, i1* %out.8, align 1
  %in.22 = and i1 %12, %cmp6
  %cond.fold23 = or i1 false, %in.22
  store i1 %cond.fold23, i1* %out.9, align 1
  %13 = load i1, i1* %out.9, align 1
  %rem = srem i32 %11, 1000
  br label %if.end

if.else:                                          ; preds = %for.body3
  %14 = load i1, i1* %out.8, align 1
  %15 = xor i1 %cmp6, true
  %in.24 = and i1 %14, %15
  %cond.fold25 = or i1 false, %in.24
  store i1 %cond.fold25, i1* %out.10, align 1
  %16 = load i1, i1* %out.10, align 1
  %sub = sub nsw i32 0, %11
  %rem7 = srem i32 %sub, 1000
  br label %if.then

if.end:                                           ; preds = %if.then
  %t.0.rewritten = phi i32 [ %rem, %if.then ]
  %17 = load i1, i1* %out.10, align 1
  %phi.fold = select i1 %17, i32 %rem7, i32 %t.0.rewritten
  %18 = load i1, i1* %out.9, align 1
  %cond.fold26 = or i1 false, %18
  %cond.fold27 = or i1 %cond.fold26, %17
  store i1 %cond.fold27, i1* %out.11, align 1
  %idxprom8 = sext i32 %phi.fold to i64
  %arrayidx9 = getelementptr inbounds i32, i32* %c.unwrapped, i64 %idxprom8
  %19 = load i32, i32* %arrayidx9, align 4
  %add = add nsw i32 %19, 1
  %idxprom10 = sext i32 %phi.fold to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %c.unwrapped, i64 %idxprom10
  store i32 %add, i32* %arrayidx11, align 4
  br label %for.inc12

for.inc12:                                        ; preds = %if.end
  %20 = load i1, i1* %out.11, align 1
  %cond.fold28 = or i1 false, %20
  store i1 %cond.fold28, i1* %out.12, align 1
  %inc13 = add nsw i32 %i.1.rewritten, 1
  br label %for.cond1, !llvm.loop !8

for.end14:                                        ; preds = %for.cond1
  %21 = load i1, i1* %out.7, align 1
  %22 = xor i1 %cmp2, true
  %in.29 = and i1 %21, %22
  %cond.fold30 = or i1 false, %in.29
  store i1 %cond.fold30, i1* %out.13, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %arraydecay.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %arraydecay2.wrapped = alloca %i32ptr.wrapped.ty, align 8
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
  %out = alloca [1000 x i32], align 16
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
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %5 = load i1, i1* %out.1, align 1
  %6 = xor i1 %cmp, true
  %in.7 = and i1 %5, %6
  %cond.fold8 = or i1 false, %in.7
  store i1 %cond.fold8, i1* %out.4, align 1
  %arraydecay = getelementptr inbounds [1000 x i32], [1000 x i32]* %in, i64 0, i64 0
  %arraydecay2 = getelementptr inbounds [1000 x i32], [1000 x i32]* %out, i64 0, i64 0
  %arraydecay.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay.wrapped, i32 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay.wrapped, i32 0, i32 1
  store i64 1000, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i32* %arraydecay, i32** %arraydecay.unwrapped, align 8
  %arraydecay2.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay2.wrapped, i32 0, i32 0
  %arraydecay2.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay2.wrapped, i32 0, i32 1
  store i64 1000, i64* %arraydecay2.wrapped.field0.length.ptr, align 8
  store i32* %arraydecay2, i32** %arraydecay2.unwrapped, align 8
  call void @histogram(%i32ptr.wrapped.ty* %arraydecay.wrapped, %i32ptr.wrapped.ty* %arraydecay2.wrapped)
  %arraydecay3 = getelementptr inbounds [1000 x i32], [1000 x i32]* %out, i64 0, i64 0
  %7 = bitcast i32* %arraydecay3 to i8*
  %call4 = call i64 @write(i32 noundef 1, i8* noundef %7, i64 noundef 4000)
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
!9 = distinct !{!9, !7}

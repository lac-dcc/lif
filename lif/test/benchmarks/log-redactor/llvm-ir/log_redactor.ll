; ModuleID = 'llvm-ir/log_redactor.ll'
source_filename = "lib/log_redactor.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @log_redactor(i8** noundef %log, i8* noundef %pattern, i32 noundef %L0, i32 noundef %L1, i32 noundef %P) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc48, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc49, %for.inc48 ]
  %cmp = icmp ult i32 %i.0, %L0
  br i1 %cmp, label %for.body, label %for.end50

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %found.0 = phi i32 [ 0, %for.body ], [ %found.1, %for.inc ]
  %j.0 = phi i32 [ 0, %for.body ], [ %inc17, %for.inc ]
  %sub = sub nsw i32 %L1, %P
  %add = add nsw i32 %sub, 1
  %cmp2 = icmp ult i32 %j.0, %add
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  br label %while.cond

while.cond:                                       ; preds = %if.end, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %if.end ]
  %cmp4 = icmp ult i32 %k.0, %P
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %idxprom = zext i32 %k.0 to i64
  %arrayidx = getelementptr inbounds i8, i8* %pattern, i64 %idxprom
  %0 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %0 to i32
  %idxprom5 = zext i32 %i.0 to i64
  %arrayidx6 = getelementptr inbounds i8*, i8** %log, i64 %idxprom5
  %1 = load i8*, i8** %arrayidx6, align 8
  %add7 = add i32 %j.0, %k.0
  %idxprom8 = zext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds i8, i8* %1, i64 %idxprom8
  %2 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %2 to i32
  %cmp11 = icmp ne i32 %conv, %conv10
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %inc = add i32 %k.0, 1
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %if.then, %while.cond
  %cmp13 = icmp eq i32 %k.0, %P
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %while.end
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %while.end
  %found.1 = phi i32 [ 1, %if.then15 ], [ %found.0, %while.end ]
  br label %for.inc

for.inc:                                          ; preds = %if.end16
  %inc17 = add i32 %j.0, 1
  br label %for.cond1, !llvm.loop !8

for.end:                                          ; preds = %for.cond1
  %tobool = icmp ne i32 %found.0, 0
  br i1 %tobool, label %if.end19, label %if.then18

if.then18:                                        ; preds = %for.end
  br label %for.inc48

if.end19:                                         ; preds = %for.end
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc45, %if.end19
  %j20.0 = phi i32 [ 0, %if.end19 ], [ %inc46, %for.inc45 ]
  %cmp22 = icmp ult i32 %j20.0, %L1
  br i1 %cmp22, label %for.body24, label %for.end47

for.body24:                                       ; preds = %for.cond21
  %idxprom25 = zext i32 %i.0 to i64
  %arrayidx26 = getelementptr inbounds i8*, i8** %log, i64 %idxprom25
  %3 = load i8*, i8** %arrayidx26, align 8
  %idxprom27 = zext i32 %j20.0 to i64
  %arrayidx28 = getelementptr inbounds i8, i8* %3, i64 %idxprom27
  %4 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %4 to i32
  %cmp30 = icmp sge i32 %conv29, 48
  br i1 %cmp30, label %land.lhs.true, label %if.end44

land.lhs.true:                                    ; preds = %for.body24
  %idxprom32 = zext i32 %i.0 to i64
  %arrayidx33 = getelementptr inbounds i8*, i8** %log, i64 %idxprom32
  %5 = load i8*, i8** %arrayidx33, align 8
  %idxprom34 = zext i32 %j20.0 to i64
  %arrayidx35 = getelementptr inbounds i8, i8* %5, i64 %idxprom34
  %6 = load i8, i8* %arrayidx35, align 1
  %conv36 = sext i8 %6 to i32
  %cmp37 = icmp sle i32 %conv36, 57
  br i1 %cmp37, label %if.then39, label %if.end44

if.then39:                                        ; preds = %land.lhs.true
  %idxprom40 = zext i32 %i.0 to i64
  %arrayidx41 = getelementptr inbounds i8*, i8** %log, i64 %idxprom40
  %7 = load i8*, i8** %arrayidx41, align 8
  %idxprom42 = zext i32 %j20.0 to i64
  %arrayidx43 = getelementptr inbounds i8, i8* %7, i64 %idxprom42
  store i8 42, i8* %arrayidx43, align 1
  br label %if.end44

if.end44:                                         ; preds = %if.then39, %land.lhs.true, %for.body24
  br label %for.inc45

for.inc45:                                        ; preds = %if.end44
  %inc46 = add i32 %j20.0, 1
  br label %for.cond21, !llvm.loop !9

for.end47:                                        ; preds = %for.cond21
  br label %for.inc48

for.inc48:                                        ; preds = %for.end47, %if.then18
  %inc49 = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !10

for.end50:                                        ; preds = %for.cond
  ret void
}

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}

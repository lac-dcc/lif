; ModuleID = 'llvm-ir/comp.ctgrind.ll'
source_filename = "lib/comp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @comp(i32** noundef %a, i32* noundef %b, i32 noundef %n, i32 noundef %m) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc10, %for.inc ]
  %cmp = icmp slt i32 %i.0, %n
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %while.cond

while.cond:                                       ; preds = %if.end, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %if.end ]
  %cmp1 = icmp slt i32 %j.0, %m
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32*, i32** %a, i64 %idxprom
  %0 = load i32*, i32** %arrayidx, align 8
  %idxprom2 = sext i32 %j.0 to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %0, i64 %idxprom2
  %1 = load i32, i32* %arrayidx3, align 4
  %idxprom4 = sext i32 %j.0 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %b, i64 %idxprom4
  %2 = load i32, i32* %arrayidx5, align 4
  %cmp6 = icmp ne i32 %1, %2
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  br label %while.end

if.else:                                          ; preds = %while.body
  %inc = add nsw i32 %j.0, 1
  br label %if.end

if.end:                                           ; preds = %if.else
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %if.then, %while.cond
  %cmp7 = icmp eq i32 %j.0, %m
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %while.end
  br label %return

if.end9:                                          ; preds = %while.end
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %inc10 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  br label %return

return:                                           ; preds = %for.end, %if.then8
  %retval.0 = phi i32 [ 1, %if.then8 ], [ 0, %for.end ]
  ret i32 %retval.0
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

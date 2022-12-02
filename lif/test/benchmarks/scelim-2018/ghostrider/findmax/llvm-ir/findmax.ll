; ModuleID = 'llvm-ir/findmax.ll'
source_filename = "lib/findmax.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@foo = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @max(i32 noundef %n, i32* noundef %h) #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %if.end ]
  %m.0 = phi i32 [ 0, %entry ], [ %m.1, %if.end ]
  %cmp = icmp slt i32 %i.0, %n
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, i32* %h, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp sgt i32 %0, %m.0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %idxprom2 = sext i32 %i.0 to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %h, i64 %idxprom2
  %1 = load i32, i32* %arrayidx3, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %m.1 = phi i32 [ %1, %if.then ], [ %m.0, %while.body ]
  %inc = add nsw i32 %i.0, 1
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  ret i32 %m.0
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

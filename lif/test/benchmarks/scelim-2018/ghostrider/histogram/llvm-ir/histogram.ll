; ModuleID = 'llvm-ir/histogram.ll'
source_filename = "lib/histogram.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@foo = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @histogram(i32* noundef %a, i32* noundef %c) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 1000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, i32* %c, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc13, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc14, %for.inc13 ]
  %cmp2 = icmp slt i32 %i.1, 1000
  br i1 %cmp2, label %for.body3, label %for.end15

for.body3:                                        ; preds = %for.cond1
  %idxprom4 = sext i32 %i.1 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %a, i64 %idxprom4
  %0 = load i32, i32* %arrayidx5, align 4
  %cmp6 = icmp sgt i32 %0, 0
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %for.body3
  %1 = load volatile i32, i32* @foo, align 4
  %inc7 = add nsw i32 %1, 1
  store volatile i32 %inc7, i32* @foo, align 4
  %rem = srem i32 %0, 1000
  br label %if.end

if.else:                                          ; preds = %for.body3
  %sub = sub nsw i32 0, %0
  %rem8 = srem i32 %sub, 1000
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %t.0 = phi i32 [ %rem, %if.then ], [ %rem8, %if.else ]
  %idxprom9 = sext i32 %t.0 to i64
  %arrayidx10 = getelementptr inbounds i32, i32* %c, i64 %idxprom9
  %2 = load i32, i32* %arrayidx10, align 4
  %add = add nsw i32 %2, 1
  %idxprom11 = sext i32 %t.0 to i64
  %arrayidx12 = getelementptr inbounds i32, i32* %c, i64 %idxprom11
  store i32 %add, i32* %arrayidx12, align 4
  br label %for.inc13

for.inc13:                                        ; preds = %if.end
  %inc14 = add nsw i32 %i.1, 1
  br label %for.cond1, !llvm.loop !8

for.end15:                                        ; preds = %for.cond1
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

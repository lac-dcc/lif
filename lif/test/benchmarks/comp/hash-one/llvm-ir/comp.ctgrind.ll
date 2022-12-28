; ModuleID = 'llvm-ir/comp.ctgrind.ll'
source_filename = "lib/comp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @comp(i32* noundef %a, i32* noundef %b, i32 noundef %n) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %ha.0 = phi i32 [ 1, %entry ], [ %ha.1, %for.inc ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc3, %for.inc ]
  %cmp = icmp slt i32 %i.0, %n
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %idxprom1 = sext i32 %i.0 to i64
  %arrayidx2 = getelementptr inbounds i32, i32* %a, i64 %idxprom1
  %1 = load i32, i32* %arrayidx2, align 4
  %mul = mul nsw i32 %ha.0, %1
  %rem = srem i32 %mul, 1024
  br label %if.end

if.else:                                          ; preds = %for.body
  %inc = add nsw i32 %ha.0, 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %ha.1 = phi i32 [ %rem, %if.then ], [ %inc, %if.else ]
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %inc3 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc19, %for.end
  %hb.0 = phi i32 [ 1, %for.end ], [ %hb.1, %for.inc19 ]
  %i4.0 = phi i32 [ 0, %for.end ], [ %inc20, %for.inc19 ]
  %cmp6 = icmp slt i32 %i4.0, %n
  br i1 %cmp6, label %for.body7, label %for.end21

for.body7:                                        ; preds = %for.cond5
  %idxprom8 = sext i32 %i4.0 to i64
  %arrayidx9 = getelementptr inbounds i32, i32* %b, i64 %idxprom8
  %2 = load i32, i32* %arrayidx9, align 4
  %tobool10 = icmp ne i32 %2, 0
  br i1 %tobool10, label %if.then11, label %if.else16

if.then11:                                        ; preds = %for.body7
  %idxprom12 = sext i32 %i4.0 to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %b, i64 %idxprom12
  %3 = load i32, i32* %arrayidx13, align 4
  %mul14 = mul nsw i32 %hb.0, %3
  %rem15 = srem i32 %mul14, 1024
  br label %if.end18

if.else16:                                        ; preds = %for.body7
  %inc17 = add nsw i32 %hb.0, 1
  br label %if.end18

if.end18:                                         ; preds = %if.else16, %if.then11
  %hb.1 = phi i32 [ %rem15, %if.then11 ], [ %inc17, %if.else16 ]
  br label %for.inc19

for.inc19:                                        ; preds = %if.end18
  %inc20 = add nsw i32 %i4.0, 1
  br label %for.cond5, !llvm.loop !8

for.end21:                                        ; preds = %for.cond5
  %cmp22 = icmp eq i32 %ha.0, %hb.0
  br i1 %cmp22, label %if.then23, label %if.else24

if.then23:                                        ; preds = %for.end21
  br label %return

if.else24:                                        ; preds = %for.end21
  br label %return

return:                                           ; preds = %if.else24, %if.then23
  %retval.0 = phi i32 [ 1, %if.then23 ], [ 0, %if.else24 ]
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

; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @mu(i32* noundef %a) #0 {
entry:
  %b = alloca [3 x i32], align 4
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  store i32 0, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  store i32 0, i32* %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  store i32 0, i32* %arrayidx2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 32
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %0 = load i32, i32* %arrayidx3, align 4
  %shl = shl i32 %0, 1
  store i32 %shl, i32* %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %1 = load i32, i32* %arrayidx4, align 4
  %shl5 = shl i32 %1, 1
  store i32 %shl5, i32* %arrayidx4, align 4
  %arrayidx6 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %2 = load i32, i32* %arrayidx6, align 4
  %shl7 = shl i32 %2, 1
  store i32 %shl7, i32* %arrayidx6, align 4
  %arrayidx8 = getelementptr inbounds i32, i32* %a, i64 0
  %3 = load i32, i32* %arrayidx8, align 4
  %and = and i32 %3, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %4 = load i32, i32* %arrayidx9, align 4
  %or = or i32 %4, 1
  store i32 %or, i32* %arrayidx9, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %arrayidx10 = getelementptr inbounds i32, i32* %a, i64 1
  %5 = load i32, i32* %arrayidx10, align 4
  %and11 = and i32 %5, 1
  %tobool12 = icmp ne i32 %and11, 0
  br i1 %tobool12, label %if.then13, label %if.end16

if.then13:                                        ; preds = %if.end
  %arrayidx14 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %6 = load i32, i32* %arrayidx14, align 4
  %or15 = or i32 %6, 1
  store i32 %or15, i32* %arrayidx14, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then13, %if.end
  %arrayidx17 = getelementptr inbounds i32, i32* %a, i64 2
  %7 = load i32, i32* %arrayidx17, align 4
  %and18 = and i32 %7, 1
  %tobool19 = icmp ne i32 %and18, 0
  br i1 %tobool19, label %if.then20, label %if.end23

if.then20:                                        ; preds = %if.end16
  %arrayidx21 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %8 = load i32, i32* %arrayidx21, align 4
  %or22 = or i32 %8, 1
  store i32 %or22, i32* %arrayidx21, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then20, %if.end16
  %arrayidx24 = getelementptr inbounds i32, i32* %a, i64 0
  %9 = load i32, i32* %arrayidx24, align 4
  %shr = ashr i32 %9, 1
  store i32 %shr, i32* %arrayidx24, align 4
  %arrayidx25 = getelementptr inbounds i32, i32* %a, i64 1
  %10 = load i32, i32* %arrayidx25, align 4
  %shr26 = ashr i32 %10, 1
  store i32 %shr26, i32* %arrayidx25, align 4
  %arrayidx27 = getelementptr inbounds i32, i32* %a, i64 2
  %11 = load i32, i32* %arrayidx27, align 4
  %shr28 = ashr i32 %11, 1
  store i32 %shr28, i32* %arrayidx27, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end23
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %arrayidx29 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %12 = load i32, i32* %arrayidx29, align 4
  %arrayidx30 = getelementptr inbounds i32, i32* %a, i64 0
  store i32 %12, i32* %arrayidx30, align 4
  %arrayidx31 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %13 = load i32, i32* %arrayidx31, align 4
  %arrayidx32 = getelementptr inbounds i32, i32* %a, i64 1
  store i32 %13, i32* %arrayidx32, align 4
  %arrayidx33 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %14 = load i32, i32* %arrayidx33, align 4
  %arrayidx34 = getelementptr inbounds i32, i32* %a, i64 2
  store i32 %14, i32* %arrayidx34, align 4
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %a = alloca [3 x i32], align 4
  %a1 = bitcast [3 x i32]* %a to i8*
  call void @llvm.var.annotation(i8* %a1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 19, i8* null)
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0
  %0 = bitcast i32* %arraydecay to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef %0, i64 noundef 12)
  %arraydecay2 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0
  call void @mu(i32* noundef %arraydecay2)
  %arraydecay3 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0
  %1 = bitcast i32* %arraydecay3 to i8*
  %call4 = call i64 @write(i32 noundef 1, i8* noundef %1, i64 noundef 12)
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

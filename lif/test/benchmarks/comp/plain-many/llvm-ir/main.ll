; ModuleID = 'llvm-ir/main.ll'
source_filename = "src/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %b = alloca i32*, align 8
  %r = alloca i32, align 4
  %0 = bitcast i32* %n to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef %0, i64 noundef 4)
  %1 = bitcast i32* %m to i8*
  %call1 = call i64 @read(i32 noundef 0, i8* noundef %1, i64 noundef 4)
  %call2 = call noalias i8* @malloc(i64 noundef 40) #4
  %2 = bitcast i8* %call2 to i32**
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %n, align 4
  %conv = sext i32 %3 to i64
  %mul = mul i64 %conv, 4
  %call3 = call noalias i8* @malloc(i64 noundef %mul) #4
  %4 = bitcast i8* %call3 to i32*
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32*, i32** %2, i64 %idxprom
  store i32* %4, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %b4 = bitcast i32** %b to i8*
  call void @llvm.var.annotation(i8* %b4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 30, i8* null)
  %5 = load i32, i32* %n, align 4
  %conv5 = sext i32 %5 to i64
  %mul6 = mul i64 %conv5, 4
  %call7 = call noalias i8* @malloc(i64 noundef %mul6) #4
  %6 = bitcast i8* %call7 to i32*
  store i32* %6, i32** %b, align 8
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc18, %for.end
  %i8.0 = phi i32 [ 0, %for.end ], [ %inc19, %for.inc18 ]
  %cmp10 = icmp slt i32 %i8.0, 5
  br i1 %cmp10, label %for.body12, label %for.end20

for.body12:                                       ; preds = %for.cond9
  %idxprom13 = sext i32 %i8.0 to i64
  %arrayidx14 = getelementptr inbounds i32*, i32** %2, i64 %idxprom13
  %7 = load i32*, i32** %arrayidx14, align 8
  %8 = bitcast i32* %7 to i8*
  %9 = load i32, i32* %n, align 4
  %conv15 = sext i32 %9 to i64
  %mul16 = mul i64 4, %conv15
  %call17 = call i64 @read(i32 noundef 0, i8* noundef %8, i64 noundef %mul16)
  br label %for.inc18

for.inc18:                                        ; preds = %for.body12
  %inc19 = add nsw i32 %i8.0, 1
  br label %for.cond9, !llvm.loop !8

for.end20:                                        ; preds = %for.cond9
  %10 = load i32*, i32** %b, align 8
  %11 = bitcast i32* %10 to i8*
  %12 = load i32, i32* %n, align 4
  %conv21 = sext i32 %12 to i64
  %mul22 = mul i64 4, %conv21
  %call23 = call i64 @read(i32 noundef 0, i8* noundef %11, i64 noundef %mul22)
  %13 = load i32*, i32** %b, align 8
  %14 = load i32, i32* %m, align 4
  %call24 = call i32 @comp(i32** noundef %2, i32* noundef %13, i32 noundef 5, i32 noundef %14)
  store i32 %call24, i32* %r, align 4
  %15 = bitcast i32* %r to i8*
  %call25 = call i64 @write(i32 noundef 1, i8* noundef %15, i64 noundef 4)
  ret i32 0
}

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #3

declare i32 @comp(i32** noundef, i32* noundef, i32 noundef, i32 noundef) #1

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #1

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #4 = { nounwind }

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

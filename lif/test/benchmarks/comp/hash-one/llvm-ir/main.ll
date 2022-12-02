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
  %call13 = call i32 @comp(i32* noundef %3, i32* noundef %11, i32 noundef %12)
  store i32 %call13, i32* %r, align 4
  %13 = bitcast i32* %r to i8*
  %call14 = call i64 @write(i32 noundef 1, i8* noundef %13, i64 noundef 4)
  ret i32 0
}

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #3

declare i32 @comp(i32* noundef, i32* noundef, i32 noundef) #1

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

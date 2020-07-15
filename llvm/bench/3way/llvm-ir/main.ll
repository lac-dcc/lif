; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.twy_ctx = type { [3 x i64], [3 x i64], [12 x i64], [12 x i64] }

@.str = private unnamed_addr constant [27 x i8] c"%20s : %08lx %08lx %08lx \0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"**********\0A\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"KEY = \00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"PLAIN = \00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"CIPHER = \00", align 1
@.str.5 = private unnamed_addr constant [42 x i8] c"Block %01d encrypts to %08lx %08lx %08lx\0A\00", align 1
@.str.6 = private unnamed_addr constant [42 x i8] c"Block %01d decrypts to %08lx %08lx %08lx\0A\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @printvec(i8* %0, i64* %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64*, align 8
  store i8* %0, i8** %3, align 8
  store i64* %1, i64** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = load i64*, i64** %4, align 8
  %7 = getelementptr inbounds i64, i64* %6, i64 2
  %8 = load i64, i64* %7, align 8
  %9 = load i64*, i64** %4, align 8
  %10 = getelementptr inbounds i64, i64* %9, i64 1
  %11 = load i64, i64* %10, align 8
  %12 = load i64*, i64** %4, align 8
  %13 = getelementptr inbounds i64, i64* %12, i64 0
  %14 = load i64, i64* %13, align 8
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0), i8* %5, i64 %8, i64 %11, i64 %14)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.twy_ctx, align 8
  %3 = alloca [9 x i64], align 16
  %4 = alloca [3 x i64], align 16
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %6 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 2
  store i64 0, i64* %6, align 16
  %7 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 1
  store i64 0, i64* %7, align 8
  %8 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  store i64 0, i64* %8, align 16
  %9 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 2
  store i64 1, i64* %9, align 16
  %10 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 1
  store i64 1, i64* %10, align 8
  %11 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  store i64 1, i64* %11, align 16
  %12 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  call void @twy_key(%struct.twy_ctx* %2, i64* %12)
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0))
  %14 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  call void @printvec(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i64* %14)
  %15 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @printvec(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i64* %15)
  %16 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @encrypt(%struct.twy_ctx* %2, i64* %16)
  %17 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @printvec(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i64* %17)
  %18 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  store i64 6, i64* %18, align 16
  %19 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 1
  store i64 5, i64* %19, align 8
  %20 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 2
  store i64 4, i64* %20, align 16
  %21 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  store i64 3, i64* %21, align 16
  %22 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 1
  store i64 2, i64* %22, align 8
  %23 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 2
  store i64 1, i64* %23, align 16
  %24 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  call void @twy_key(%struct.twy_ctx* %2, i64* %24)
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0))
  %26 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  call void @printvec(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i64* %26)
  %27 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @printvec(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i64* %27)
  %28 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @encrypt(%struct.twy_ctx* %2, i64* %28)
  %29 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @printvec(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i64* %29)
  %30 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 2
  store i64 3168727058, i64* %30, align 16
  %31 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 1
  store i64 1164413355, i64* %31, align 8
  %32 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  store i64 3740275252, i64* %32, align 16
  %33 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 2
  store i64 19088743, i64* %33, align 16
  %34 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 1
  store i64 2596069104, i64* %34, align 8
  %35 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  store i64 591751049, i64* %35, align 16
  %36 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  call void @twy_key(%struct.twy_ctx* %2, i64* %36)
  %37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0))
  %38 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  call void @printvec(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i64* %38)
  %39 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @printvec(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i64* %39)
  %40 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @encrypt(%struct.twy_ctx* %2, i64* %40)
  %41 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @printvec(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i64* %41)
  %42 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 2
  store i64 3401130189, i64* %42, align 16
  %43 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 1
  store i64 3591651640, i64* %43, align 8
  %44 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  store i64 3538967390, i64* %44, align 16
  %45 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 2
  store i64 2904681719, i64* %45, align 16
  %46 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 1
  store i64 2209258948, i64* %46, align 8
  %47 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  store i64 1079625582, i64* %47, align 16
  %48 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  call void @twy_key(%struct.twy_ctx* %2, i64* %48)
  %49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0))
  %50 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  call void @printvec(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i64* %50)
  %51 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @printvec(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i64* %51)
  %52 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @encrypt(%struct.twy_ctx* %2, i64* %52)
  %53 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @printvec(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i64* %53)
  store i32 0, i32* %5, align 4
  br label %54

54:                                               ; preds = %63, %0
  %55 = load i32, i32* %5, align 4
  %56 = icmp slt i32 %55, 9
  br i1 %56, label %57, label %66

57:                                               ; preds = %54
  %58 = load i32, i32* %5, align 4
  %59 = sext i32 %58 to i64
  %60 = load i32, i32* %5, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 %61
  store i64 %59, i64* %62, align 8
  br label %63

63:                                               ; preds = %57
  %64 = load i32, i32* %5, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %5, align 4
  br label %54

66:                                               ; preds = %54
  %67 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @twy_enc(%struct.twy_ctx* %2, i64* %67, i32 3)
  store i32 0, i32* %5, align 4
  br label %68

68:                                               ; preds = %89, %66
  %69 = load i32, i32* %5, align 4
  %70 = icmp slt i32 %69, 9
  br i1 %70, label %71, label %92

71:                                               ; preds = %68
  %72 = load i32, i32* %5, align 4
  %73 = sdiv i32 %72, 3
  %74 = load i32, i32* %5, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 %75
  %77 = load i64, i64* %76, align 8
  %78 = load i32, i32* %5, align 4
  %79 = add nsw i32 %78, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 %80
  %82 = load i64, i64* %81, align 8
  %83 = load i32, i32* %5, align 4
  %84 = add nsw i32 %83, 2
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 %85
  %87 = load i64, i64* %86, align 8
  %88 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.5, i64 0, i64 0), i32 %73, i64 %77, i64 %82, i64 %87)
  br label %89

89:                                               ; preds = %71
  %90 = load i32, i32* %5, align 4
  %91 = add nsw i32 %90, 3
  store i32 %91, i32* %5, align 4
  br label %68

92:                                               ; preds = %68
  %93 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  call void @twy_dec(%struct.twy_ctx* %2, i64* %93, i32 2)
  %94 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 0
  %95 = getelementptr inbounds i64, i64* %94, i64 6
  call void @twy_dec(%struct.twy_ctx* %2, i64* %95, i32 1)
  store i32 0, i32* %5, align 4
  br label %96

96:                                               ; preds = %117, %92
  %97 = load i32, i32* %5, align 4
  %98 = icmp slt i32 %97, 9
  br i1 %98, label %99, label %120

99:                                               ; preds = %96
  %100 = load i32, i32* %5, align 4
  %101 = sdiv i32 %100, 3
  %102 = load i32, i32* %5, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 %103
  %105 = load i64, i64* %104, align 8
  %106 = load i32, i32* %5, align 4
  %107 = add nsw i32 %106, 1
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 %108
  %110 = load i64, i64* %109, align 8
  %111 = load i32, i32* %5, align 4
  %112 = add nsw i32 %111, 2
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [9 x i64], [9 x i64]* %3, i64 0, i64 %113
  %115 = load i64, i64* %114, align 8
  %116 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.6, i64 0, i64 0), i32 %101, i64 %105, i64 %110, i64 %115)
  br label %117

117:                                              ; preds = %99
  %118 = load i32, i32* %5, align 4
  %119 = add nsw i32 %118, 3
  store i32 %119, i32* %5, align 4
  br label %96

120:                                              ; preds = %96
  ret i32 0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @mu(i64* %0) #0 {
  %2 = alloca [3 x i64], align 16
  %3 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  store i64 0, i64* %3, align 16
  %4 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  store i64 0, i64* %4, align 8
  %5 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  store i64 0, i64* %5, align 16
  %6 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %7 = load i64, i64* %6, align 16
  %8 = shl i64 %7, 1
  store i64 %8, i64* %6, align 16
  %9 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %10 = load i64, i64* %9, align 8
  %11 = shl i64 %10, 1
  store i64 %11, i64* %9, align 8
  %12 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %13 = load i64, i64* %12, align 16
  %14 = shl i64 %13, 1
  store i64 %14, i64* %12, align 16
  %15 = load i64, i64* %0, align 8
  %16 = and i64 %15, 1
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %18, label %22

18:                                               ; preds = %1
  %19 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %20 = load i64, i64* %19, align 16
  %21 = or i64 %20, 1
  store i64 %21, i64* %19, align 16
  br label %22

22:                                               ; preds = %18, %1
  %23 = getelementptr inbounds i64, i64* %0, i64 1
  %24 = load i64, i64* %23, align 8
  %25 = and i64 %24, 1
  %26 = icmp ne i64 %25, 0
  br i1 %26, label %27, label %31

27:                                               ; preds = %22
  %28 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %29 = load i64, i64* %28, align 8
  %30 = or i64 %29, 1
  store i64 %30, i64* %28, align 8
  br label %31

31:                                               ; preds = %27, %22
  %32 = getelementptr inbounds i64, i64* %0, i64 2
  %33 = load i64, i64* %32, align 8
  %34 = and i64 %33, 1
  %35 = icmp ne i64 %34, 0
  br i1 %35, label %36, label %40

36:                                               ; preds = %31
  %37 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %38 = load i64, i64* %37, align 16
  %39 = or i64 %38, 1
  store i64 %39, i64* %37, align 16
  br label %40

40:                                               ; preds = %36, %31
  %41 = load i64, i64* %0, align 8
  %42 = lshr i64 %41, 1
  store i64 %42, i64* %0, align 8
  %43 = getelementptr inbounds i64, i64* %0, i64 1
  %44 = load i64, i64* %43, align 8
  %45 = lshr i64 %44, 1
  store i64 %45, i64* %43, align 8
  %46 = getelementptr inbounds i64, i64* %0, i64 2
  %47 = load i64, i64* %46, align 8
  %48 = lshr i64 %47, 1
  store i64 %48, i64* %46, align 8
  %49 = load i64, i64* %6, align 16
  %50 = shl i64 %49, 1
  store i64 %50, i64* %6, align 16
  %51 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %52 = load i64, i64* %51, align 8
  %53 = shl i64 %52, 1
  store i64 %53, i64* %51, align 8
  %54 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %55 = load i64, i64* %54, align 16
  %56 = shl i64 %55, 1
  store i64 %56, i64* %54, align 16
  %57 = load i64, i64* %0, align 8
  %58 = and i64 %57, 1
  %59 = icmp ne i64 %58, 0
  br i1 %59, label %60, label %64

60:                                               ; preds = %40
  %61 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %62 = load i64, i64* %61, align 16
  %63 = or i64 %62, 1
  store i64 %63, i64* %61, align 16
  br label %64

64:                                               ; preds = %60, %40
  %65 = getelementptr inbounds i64, i64* %0, i64 1
  %66 = load i64, i64* %65, align 8
  %67 = and i64 %66, 1
  %68 = icmp ne i64 %67, 0
  br i1 %68, label %69, label %73

69:                                               ; preds = %64
  %70 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %71 = load i64, i64* %70, align 8
  %72 = or i64 %71, 1
  store i64 %72, i64* %70, align 8
  br label %73

73:                                               ; preds = %69, %64
  %74 = getelementptr inbounds i64, i64* %0, i64 2
  %75 = load i64, i64* %74, align 8
  %76 = and i64 %75, 1
  %77 = icmp ne i64 %76, 0
  br i1 %77, label %78, label %82

78:                                               ; preds = %73
  %79 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %80 = load i64, i64* %79, align 16
  %81 = or i64 %80, 1
  store i64 %81, i64* %79, align 16
  br label %82

82:                                               ; preds = %78, %73
  %83 = load i64, i64* %0, align 8
  %84 = lshr i64 %83, 1
  store i64 %84, i64* %0, align 8
  %85 = getelementptr inbounds i64, i64* %0, i64 1
  %86 = load i64, i64* %85, align 8
  %87 = lshr i64 %86, 1
  store i64 %87, i64* %85, align 8
  %88 = getelementptr inbounds i64, i64* %0, i64 2
  %89 = load i64, i64* %88, align 8
  %90 = lshr i64 %89, 1
  store i64 %90, i64* %88, align 8
  %91 = load i64, i64* %6, align 16
  %92 = shl i64 %91, 1
  store i64 %92, i64* %6, align 16
  %93 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %94 = load i64, i64* %93, align 8
  %95 = shl i64 %94, 1
  store i64 %95, i64* %93, align 8
  %96 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %97 = load i64, i64* %96, align 16
  %98 = shl i64 %97, 1
  store i64 %98, i64* %96, align 16
  %99 = load i64, i64* %0, align 8
  %100 = and i64 %99, 1
  %101 = icmp ne i64 %100, 0
  br i1 %101, label %102, label %106

102:                                              ; preds = %82
  %103 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %104 = load i64, i64* %103, align 16
  %105 = or i64 %104, 1
  store i64 %105, i64* %103, align 16
  br label %106

106:                                              ; preds = %102, %82
  %107 = getelementptr inbounds i64, i64* %0, i64 1
  %108 = load i64, i64* %107, align 8
  %109 = and i64 %108, 1
  %110 = icmp ne i64 %109, 0
  br i1 %110, label %111, label %115

111:                                              ; preds = %106
  %112 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %113 = load i64, i64* %112, align 8
  %114 = or i64 %113, 1
  store i64 %114, i64* %112, align 8
  br label %115

115:                                              ; preds = %111, %106
  %116 = getelementptr inbounds i64, i64* %0, i64 2
  %117 = load i64, i64* %116, align 8
  %118 = and i64 %117, 1
  %119 = icmp ne i64 %118, 0
  br i1 %119, label %120, label %124

120:                                              ; preds = %115
  %121 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %122 = load i64, i64* %121, align 16
  %123 = or i64 %122, 1
  store i64 %123, i64* %121, align 16
  br label %124

124:                                              ; preds = %120, %115
  %125 = load i64, i64* %0, align 8
  %126 = lshr i64 %125, 1
  store i64 %126, i64* %0, align 8
  %127 = getelementptr inbounds i64, i64* %0, i64 1
  %128 = load i64, i64* %127, align 8
  %129 = lshr i64 %128, 1
  store i64 %129, i64* %127, align 8
  %130 = getelementptr inbounds i64, i64* %0, i64 2
  %131 = load i64, i64* %130, align 8
  %132 = lshr i64 %131, 1
  store i64 %132, i64* %130, align 8
  %133 = load i64, i64* %6, align 16
  %134 = shl i64 %133, 1
  store i64 %134, i64* %6, align 16
  %135 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %136 = load i64, i64* %135, align 8
  %137 = shl i64 %136, 1
  store i64 %137, i64* %135, align 8
  %138 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %139 = load i64, i64* %138, align 16
  %140 = shl i64 %139, 1
  store i64 %140, i64* %138, align 16
  %141 = load i64, i64* %0, align 8
  %142 = and i64 %141, 1
  %143 = icmp ne i64 %142, 0
  br i1 %143, label %144, label %148

144:                                              ; preds = %124
  %145 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %146 = load i64, i64* %145, align 16
  %147 = or i64 %146, 1
  store i64 %147, i64* %145, align 16
  br label %148

148:                                              ; preds = %144, %124
  %149 = getelementptr inbounds i64, i64* %0, i64 1
  %150 = load i64, i64* %149, align 8
  %151 = and i64 %150, 1
  %152 = icmp ne i64 %151, 0
  br i1 %152, label %153, label %157

153:                                              ; preds = %148
  %154 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %155 = load i64, i64* %154, align 8
  %156 = or i64 %155, 1
  store i64 %156, i64* %154, align 8
  br label %157

157:                                              ; preds = %153, %148
  %158 = getelementptr inbounds i64, i64* %0, i64 2
  %159 = load i64, i64* %158, align 8
  %160 = and i64 %159, 1
  %161 = icmp ne i64 %160, 0
  br i1 %161, label %162, label %166

162:                                              ; preds = %157
  %163 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %164 = load i64, i64* %163, align 16
  %165 = or i64 %164, 1
  store i64 %165, i64* %163, align 16
  br label %166

166:                                              ; preds = %162, %157
  %167 = load i64, i64* %0, align 8
  %168 = lshr i64 %167, 1
  store i64 %168, i64* %0, align 8
  %169 = getelementptr inbounds i64, i64* %0, i64 1
  %170 = load i64, i64* %169, align 8
  %171 = lshr i64 %170, 1
  store i64 %171, i64* %169, align 8
  %172 = getelementptr inbounds i64, i64* %0, i64 2
  %173 = load i64, i64* %172, align 8
  %174 = lshr i64 %173, 1
  store i64 %174, i64* %172, align 8
  %175 = load i64, i64* %6, align 16
  %176 = shl i64 %175, 1
  store i64 %176, i64* %6, align 16
  %177 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %178 = load i64, i64* %177, align 8
  %179 = shl i64 %178, 1
  store i64 %179, i64* %177, align 8
  %180 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %181 = load i64, i64* %180, align 16
  %182 = shl i64 %181, 1
  store i64 %182, i64* %180, align 16
  %183 = load i64, i64* %0, align 8
  %184 = and i64 %183, 1
  %185 = icmp ne i64 %184, 0
  br i1 %185, label %186, label %190

186:                                              ; preds = %166
  %187 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %188 = load i64, i64* %187, align 16
  %189 = or i64 %188, 1
  store i64 %189, i64* %187, align 16
  br label %190

190:                                              ; preds = %186, %166
  %191 = getelementptr inbounds i64, i64* %0, i64 1
  %192 = load i64, i64* %191, align 8
  %193 = and i64 %192, 1
  %194 = icmp ne i64 %193, 0
  br i1 %194, label %195, label %199

195:                                              ; preds = %190
  %196 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %197 = load i64, i64* %196, align 8
  %198 = or i64 %197, 1
  store i64 %198, i64* %196, align 8
  br label %199

199:                                              ; preds = %195, %190
  %200 = getelementptr inbounds i64, i64* %0, i64 2
  %201 = load i64, i64* %200, align 8
  %202 = and i64 %201, 1
  %203 = icmp ne i64 %202, 0
  br i1 %203, label %204, label %208

204:                                              ; preds = %199
  %205 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %206 = load i64, i64* %205, align 16
  %207 = or i64 %206, 1
  store i64 %207, i64* %205, align 16
  br label %208

208:                                              ; preds = %204, %199
  %209 = load i64, i64* %0, align 8
  %210 = lshr i64 %209, 1
  store i64 %210, i64* %0, align 8
  %211 = getelementptr inbounds i64, i64* %0, i64 1
  %212 = load i64, i64* %211, align 8
  %213 = lshr i64 %212, 1
  store i64 %213, i64* %211, align 8
  %214 = getelementptr inbounds i64, i64* %0, i64 2
  %215 = load i64, i64* %214, align 8
  %216 = lshr i64 %215, 1
  store i64 %216, i64* %214, align 8
  %217 = load i64, i64* %6, align 16
  %218 = shl i64 %217, 1
  store i64 %218, i64* %6, align 16
  %219 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %220 = load i64, i64* %219, align 8
  %221 = shl i64 %220, 1
  store i64 %221, i64* %219, align 8
  %222 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %223 = load i64, i64* %222, align 16
  %224 = shl i64 %223, 1
  store i64 %224, i64* %222, align 16
  %225 = load i64, i64* %0, align 8
  %226 = and i64 %225, 1
  %227 = icmp ne i64 %226, 0
  br i1 %227, label %228, label %232

228:                                              ; preds = %208
  %229 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %230 = load i64, i64* %229, align 16
  %231 = or i64 %230, 1
  store i64 %231, i64* %229, align 16
  br label %232

232:                                              ; preds = %228, %208
  %233 = getelementptr inbounds i64, i64* %0, i64 1
  %234 = load i64, i64* %233, align 8
  %235 = and i64 %234, 1
  %236 = icmp ne i64 %235, 0
  br i1 %236, label %237, label %241

237:                                              ; preds = %232
  %238 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %239 = load i64, i64* %238, align 8
  %240 = or i64 %239, 1
  store i64 %240, i64* %238, align 8
  br label %241

241:                                              ; preds = %237, %232
  %242 = getelementptr inbounds i64, i64* %0, i64 2
  %243 = load i64, i64* %242, align 8
  %244 = and i64 %243, 1
  %245 = icmp ne i64 %244, 0
  br i1 %245, label %246, label %250

246:                                              ; preds = %241
  %247 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %248 = load i64, i64* %247, align 16
  %249 = or i64 %248, 1
  store i64 %249, i64* %247, align 16
  br label %250

250:                                              ; preds = %246, %241
  %251 = load i64, i64* %0, align 8
  %252 = lshr i64 %251, 1
  store i64 %252, i64* %0, align 8
  %253 = getelementptr inbounds i64, i64* %0, i64 1
  %254 = load i64, i64* %253, align 8
  %255 = lshr i64 %254, 1
  store i64 %255, i64* %253, align 8
  %256 = getelementptr inbounds i64, i64* %0, i64 2
  %257 = load i64, i64* %256, align 8
  %258 = lshr i64 %257, 1
  store i64 %258, i64* %256, align 8
  %259 = load i64, i64* %6, align 16
  %260 = shl i64 %259, 1
  store i64 %260, i64* %6, align 16
  %261 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %262 = load i64, i64* %261, align 8
  %263 = shl i64 %262, 1
  store i64 %263, i64* %261, align 8
  %264 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %265 = load i64, i64* %264, align 16
  %266 = shl i64 %265, 1
  store i64 %266, i64* %264, align 16
  %267 = load i64, i64* %0, align 8
  %268 = and i64 %267, 1
  %269 = icmp ne i64 %268, 0
  br i1 %269, label %270, label %274

270:                                              ; preds = %250
  %271 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %272 = load i64, i64* %271, align 16
  %273 = or i64 %272, 1
  store i64 %273, i64* %271, align 16
  br label %274

274:                                              ; preds = %270, %250
  %275 = getelementptr inbounds i64, i64* %0, i64 1
  %276 = load i64, i64* %275, align 8
  %277 = and i64 %276, 1
  %278 = icmp ne i64 %277, 0
  br i1 %278, label %279, label %283

279:                                              ; preds = %274
  %280 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %281 = load i64, i64* %280, align 8
  %282 = or i64 %281, 1
  store i64 %282, i64* %280, align 8
  br label %283

283:                                              ; preds = %279, %274
  %284 = getelementptr inbounds i64, i64* %0, i64 2
  %285 = load i64, i64* %284, align 8
  %286 = and i64 %285, 1
  %287 = icmp ne i64 %286, 0
  br i1 %287, label %288, label %292

288:                                              ; preds = %283
  %289 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %290 = load i64, i64* %289, align 16
  %291 = or i64 %290, 1
  store i64 %291, i64* %289, align 16
  br label %292

292:                                              ; preds = %288, %283
  %293 = load i64, i64* %0, align 8
  %294 = lshr i64 %293, 1
  store i64 %294, i64* %0, align 8
  %295 = getelementptr inbounds i64, i64* %0, i64 1
  %296 = load i64, i64* %295, align 8
  %297 = lshr i64 %296, 1
  store i64 %297, i64* %295, align 8
  %298 = getelementptr inbounds i64, i64* %0, i64 2
  %299 = load i64, i64* %298, align 8
  %300 = lshr i64 %299, 1
  store i64 %300, i64* %298, align 8
  %301 = load i64, i64* %6, align 16
  %302 = shl i64 %301, 1
  store i64 %302, i64* %6, align 16
  %303 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %304 = load i64, i64* %303, align 8
  %305 = shl i64 %304, 1
  store i64 %305, i64* %303, align 8
  %306 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %307 = load i64, i64* %306, align 16
  %308 = shl i64 %307, 1
  store i64 %308, i64* %306, align 16
  %309 = load i64, i64* %0, align 8
  %310 = and i64 %309, 1
  %311 = icmp ne i64 %310, 0
  br i1 %311, label %312, label %316

312:                                              ; preds = %292
  %313 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %314 = load i64, i64* %313, align 16
  %315 = or i64 %314, 1
  store i64 %315, i64* %313, align 16
  br label %316

316:                                              ; preds = %312, %292
  %317 = getelementptr inbounds i64, i64* %0, i64 1
  %318 = load i64, i64* %317, align 8
  %319 = and i64 %318, 1
  %320 = icmp ne i64 %319, 0
  br i1 %320, label %321, label %325

321:                                              ; preds = %316
  %322 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %323 = load i64, i64* %322, align 8
  %324 = or i64 %323, 1
  store i64 %324, i64* %322, align 8
  br label %325

325:                                              ; preds = %321, %316
  %326 = getelementptr inbounds i64, i64* %0, i64 2
  %327 = load i64, i64* %326, align 8
  %328 = and i64 %327, 1
  %329 = icmp ne i64 %328, 0
  br i1 %329, label %330, label %334

330:                                              ; preds = %325
  %331 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %332 = load i64, i64* %331, align 16
  %333 = or i64 %332, 1
  store i64 %333, i64* %331, align 16
  br label %334

334:                                              ; preds = %330, %325
  %335 = load i64, i64* %0, align 8
  %336 = lshr i64 %335, 1
  store i64 %336, i64* %0, align 8
  %337 = getelementptr inbounds i64, i64* %0, i64 1
  %338 = load i64, i64* %337, align 8
  %339 = lshr i64 %338, 1
  store i64 %339, i64* %337, align 8
  %340 = getelementptr inbounds i64, i64* %0, i64 2
  %341 = load i64, i64* %340, align 8
  %342 = lshr i64 %341, 1
  store i64 %342, i64* %340, align 8
  %343 = load i64, i64* %6, align 16
  %344 = shl i64 %343, 1
  store i64 %344, i64* %6, align 16
  %345 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %346 = load i64, i64* %345, align 8
  %347 = shl i64 %346, 1
  store i64 %347, i64* %345, align 8
  %348 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %349 = load i64, i64* %348, align 16
  %350 = shl i64 %349, 1
  store i64 %350, i64* %348, align 16
  %351 = load i64, i64* %0, align 8
  %352 = and i64 %351, 1
  %353 = icmp ne i64 %352, 0
  br i1 %353, label %354, label %358

354:                                              ; preds = %334
  %355 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %356 = load i64, i64* %355, align 16
  %357 = or i64 %356, 1
  store i64 %357, i64* %355, align 16
  br label %358

358:                                              ; preds = %354, %334
  %359 = getelementptr inbounds i64, i64* %0, i64 1
  %360 = load i64, i64* %359, align 8
  %361 = and i64 %360, 1
  %362 = icmp ne i64 %361, 0
  br i1 %362, label %363, label %367

363:                                              ; preds = %358
  %364 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %365 = load i64, i64* %364, align 8
  %366 = or i64 %365, 1
  store i64 %366, i64* %364, align 8
  br label %367

367:                                              ; preds = %363, %358
  %368 = getelementptr inbounds i64, i64* %0, i64 2
  %369 = load i64, i64* %368, align 8
  %370 = and i64 %369, 1
  %371 = icmp ne i64 %370, 0
  br i1 %371, label %372, label %376

372:                                              ; preds = %367
  %373 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %374 = load i64, i64* %373, align 16
  %375 = or i64 %374, 1
  store i64 %375, i64* %373, align 16
  br label %376

376:                                              ; preds = %372, %367
  %377 = load i64, i64* %0, align 8
  %378 = lshr i64 %377, 1
  store i64 %378, i64* %0, align 8
  %379 = getelementptr inbounds i64, i64* %0, i64 1
  %380 = load i64, i64* %379, align 8
  %381 = lshr i64 %380, 1
  store i64 %381, i64* %379, align 8
  %382 = getelementptr inbounds i64, i64* %0, i64 2
  %383 = load i64, i64* %382, align 8
  %384 = lshr i64 %383, 1
  store i64 %384, i64* %382, align 8
  %385 = load i64, i64* %6, align 16
  %386 = shl i64 %385, 1
  store i64 %386, i64* %6, align 16
  %387 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %388 = load i64, i64* %387, align 8
  %389 = shl i64 %388, 1
  store i64 %389, i64* %387, align 8
  %390 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %391 = load i64, i64* %390, align 16
  %392 = shl i64 %391, 1
  store i64 %392, i64* %390, align 16
  %393 = load i64, i64* %0, align 8
  %394 = and i64 %393, 1
  %395 = icmp ne i64 %394, 0
  br i1 %395, label %396, label %400

396:                                              ; preds = %376
  %397 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %398 = load i64, i64* %397, align 16
  %399 = or i64 %398, 1
  store i64 %399, i64* %397, align 16
  br label %400

400:                                              ; preds = %396, %376
  %401 = getelementptr inbounds i64, i64* %0, i64 1
  %402 = load i64, i64* %401, align 8
  %403 = and i64 %402, 1
  %404 = icmp ne i64 %403, 0
  br i1 %404, label %405, label %409

405:                                              ; preds = %400
  %406 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %407 = load i64, i64* %406, align 8
  %408 = or i64 %407, 1
  store i64 %408, i64* %406, align 8
  br label %409

409:                                              ; preds = %405, %400
  %410 = getelementptr inbounds i64, i64* %0, i64 2
  %411 = load i64, i64* %410, align 8
  %412 = and i64 %411, 1
  %413 = icmp ne i64 %412, 0
  br i1 %413, label %414, label %418

414:                                              ; preds = %409
  %415 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %416 = load i64, i64* %415, align 16
  %417 = or i64 %416, 1
  store i64 %417, i64* %415, align 16
  br label %418

418:                                              ; preds = %414, %409
  %419 = load i64, i64* %0, align 8
  %420 = lshr i64 %419, 1
  store i64 %420, i64* %0, align 8
  %421 = getelementptr inbounds i64, i64* %0, i64 1
  %422 = load i64, i64* %421, align 8
  %423 = lshr i64 %422, 1
  store i64 %423, i64* %421, align 8
  %424 = getelementptr inbounds i64, i64* %0, i64 2
  %425 = load i64, i64* %424, align 8
  %426 = lshr i64 %425, 1
  store i64 %426, i64* %424, align 8
  %427 = load i64, i64* %6, align 16
  %428 = shl i64 %427, 1
  store i64 %428, i64* %6, align 16
  %429 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %430 = load i64, i64* %429, align 8
  %431 = shl i64 %430, 1
  store i64 %431, i64* %429, align 8
  %432 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %433 = load i64, i64* %432, align 16
  %434 = shl i64 %433, 1
  store i64 %434, i64* %432, align 16
  %435 = load i64, i64* %0, align 8
  %436 = and i64 %435, 1
  %437 = icmp ne i64 %436, 0
  br i1 %437, label %438, label %442

438:                                              ; preds = %418
  %439 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %440 = load i64, i64* %439, align 16
  %441 = or i64 %440, 1
  store i64 %441, i64* %439, align 16
  br label %442

442:                                              ; preds = %438, %418
  %443 = getelementptr inbounds i64, i64* %0, i64 1
  %444 = load i64, i64* %443, align 8
  %445 = and i64 %444, 1
  %446 = icmp ne i64 %445, 0
  br i1 %446, label %447, label %451

447:                                              ; preds = %442
  %448 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %449 = load i64, i64* %448, align 8
  %450 = or i64 %449, 1
  store i64 %450, i64* %448, align 8
  br label %451

451:                                              ; preds = %447, %442
  %452 = getelementptr inbounds i64, i64* %0, i64 2
  %453 = load i64, i64* %452, align 8
  %454 = and i64 %453, 1
  %455 = icmp ne i64 %454, 0
  br i1 %455, label %456, label %460

456:                                              ; preds = %451
  %457 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %458 = load i64, i64* %457, align 16
  %459 = or i64 %458, 1
  store i64 %459, i64* %457, align 16
  br label %460

460:                                              ; preds = %456, %451
  %461 = load i64, i64* %0, align 8
  %462 = lshr i64 %461, 1
  store i64 %462, i64* %0, align 8
  %463 = getelementptr inbounds i64, i64* %0, i64 1
  %464 = load i64, i64* %463, align 8
  %465 = lshr i64 %464, 1
  store i64 %465, i64* %463, align 8
  %466 = getelementptr inbounds i64, i64* %0, i64 2
  %467 = load i64, i64* %466, align 8
  %468 = lshr i64 %467, 1
  store i64 %468, i64* %466, align 8
  %469 = load i64, i64* %6, align 16
  %470 = shl i64 %469, 1
  store i64 %470, i64* %6, align 16
  %471 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %472 = load i64, i64* %471, align 8
  %473 = shl i64 %472, 1
  store i64 %473, i64* %471, align 8
  %474 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %475 = load i64, i64* %474, align 16
  %476 = shl i64 %475, 1
  store i64 %476, i64* %474, align 16
  %477 = load i64, i64* %0, align 8
  %478 = and i64 %477, 1
  %479 = icmp ne i64 %478, 0
  br i1 %479, label %480, label %484

480:                                              ; preds = %460
  %481 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %482 = load i64, i64* %481, align 16
  %483 = or i64 %482, 1
  store i64 %483, i64* %481, align 16
  br label %484

484:                                              ; preds = %480, %460
  %485 = getelementptr inbounds i64, i64* %0, i64 1
  %486 = load i64, i64* %485, align 8
  %487 = and i64 %486, 1
  %488 = icmp ne i64 %487, 0
  br i1 %488, label %489, label %493

489:                                              ; preds = %484
  %490 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %491 = load i64, i64* %490, align 8
  %492 = or i64 %491, 1
  store i64 %492, i64* %490, align 8
  br label %493

493:                                              ; preds = %489, %484
  %494 = getelementptr inbounds i64, i64* %0, i64 2
  %495 = load i64, i64* %494, align 8
  %496 = and i64 %495, 1
  %497 = icmp ne i64 %496, 0
  br i1 %497, label %498, label %502

498:                                              ; preds = %493
  %499 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %500 = load i64, i64* %499, align 16
  %501 = or i64 %500, 1
  store i64 %501, i64* %499, align 16
  br label %502

502:                                              ; preds = %498, %493
  %503 = load i64, i64* %0, align 8
  %504 = lshr i64 %503, 1
  store i64 %504, i64* %0, align 8
  %505 = getelementptr inbounds i64, i64* %0, i64 1
  %506 = load i64, i64* %505, align 8
  %507 = lshr i64 %506, 1
  store i64 %507, i64* %505, align 8
  %508 = getelementptr inbounds i64, i64* %0, i64 2
  %509 = load i64, i64* %508, align 8
  %510 = lshr i64 %509, 1
  store i64 %510, i64* %508, align 8
  %511 = load i64, i64* %6, align 16
  %512 = shl i64 %511, 1
  store i64 %512, i64* %6, align 16
  %513 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %514 = load i64, i64* %513, align 8
  %515 = shl i64 %514, 1
  store i64 %515, i64* %513, align 8
  %516 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %517 = load i64, i64* %516, align 16
  %518 = shl i64 %517, 1
  store i64 %518, i64* %516, align 16
  %519 = load i64, i64* %0, align 8
  %520 = and i64 %519, 1
  %521 = icmp ne i64 %520, 0
  br i1 %521, label %522, label %526

522:                                              ; preds = %502
  %523 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %524 = load i64, i64* %523, align 16
  %525 = or i64 %524, 1
  store i64 %525, i64* %523, align 16
  br label %526

526:                                              ; preds = %522, %502
  %527 = getelementptr inbounds i64, i64* %0, i64 1
  %528 = load i64, i64* %527, align 8
  %529 = and i64 %528, 1
  %530 = icmp ne i64 %529, 0
  br i1 %530, label %531, label %535

531:                                              ; preds = %526
  %532 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %533 = load i64, i64* %532, align 8
  %534 = or i64 %533, 1
  store i64 %534, i64* %532, align 8
  br label %535

535:                                              ; preds = %531, %526
  %536 = getelementptr inbounds i64, i64* %0, i64 2
  %537 = load i64, i64* %536, align 8
  %538 = and i64 %537, 1
  %539 = icmp ne i64 %538, 0
  br i1 %539, label %540, label %544

540:                                              ; preds = %535
  %541 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %542 = load i64, i64* %541, align 16
  %543 = or i64 %542, 1
  store i64 %543, i64* %541, align 16
  br label %544

544:                                              ; preds = %540, %535
  %545 = load i64, i64* %0, align 8
  %546 = lshr i64 %545, 1
  store i64 %546, i64* %0, align 8
  %547 = getelementptr inbounds i64, i64* %0, i64 1
  %548 = load i64, i64* %547, align 8
  %549 = lshr i64 %548, 1
  store i64 %549, i64* %547, align 8
  %550 = getelementptr inbounds i64, i64* %0, i64 2
  %551 = load i64, i64* %550, align 8
  %552 = lshr i64 %551, 1
  store i64 %552, i64* %550, align 8
  %553 = load i64, i64* %6, align 16
  %554 = shl i64 %553, 1
  store i64 %554, i64* %6, align 16
  %555 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %556 = load i64, i64* %555, align 8
  %557 = shl i64 %556, 1
  store i64 %557, i64* %555, align 8
  %558 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %559 = load i64, i64* %558, align 16
  %560 = shl i64 %559, 1
  store i64 %560, i64* %558, align 16
  %561 = load i64, i64* %0, align 8
  %562 = and i64 %561, 1
  %563 = icmp ne i64 %562, 0
  br i1 %563, label %564, label %568

564:                                              ; preds = %544
  %565 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %566 = load i64, i64* %565, align 16
  %567 = or i64 %566, 1
  store i64 %567, i64* %565, align 16
  br label %568

568:                                              ; preds = %564, %544
  %569 = getelementptr inbounds i64, i64* %0, i64 1
  %570 = load i64, i64* %569, align 8
  %571 = and i64 %570, 1
  %572 = icmp ne i64 %571, 0
  br i1 %572, label %573, label %577

573:                                              ; preds = %568
  %574 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %575 = load i64, i64* %574, align 8
  %576 = or i64 %575, 1
  store i64 %576, i64* %574, align 8
  br label %577

577:                                              ; preds = %573, %568
  %578 = getelementptr inbounds i64, i64* %0, i64 2
  %579 = load i64, i64* %578, align 8
  %580 = and i64 %579, 1
  %581 = icmp ne i64 %580, 0
  br i1 %581, label %582, label %586

582:                                              ; preds = %577
  %583 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %584 = load i64, i64* %583, align 16
  %585 = or i64 %584, 1
  store i64 %585, i64* %583, align 16
  br label %586

586:                                              ; preds = %582, %577
  %587 = load i64, i64* %0, align 8
  %588 = lshr i64 %587, 1
  store i64 %588, i64* %0, align 8
  %589 = getelementptr inbounds i64, i64* %0, i64 1
  %590 = load i64, i64* %589, align 8
  %591 = lshr i64 %590, 1
  store i64 %591, i64* %589, align 8
  %592 = getelementptr inbounds i64, i64* %0, i64 2
  %593 = load i64, i64* %592, align 8
  %594 = lshr i64 %593, 1
  store i64 %594, i64* %592, align 8
  %595 = load i64, i64* %6, align 16
  %596 = shl i64 %595, 1
  store i64 %596, i64* %6, align 16
  %597 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %598 = load i64, i64* %597, align 8
  %599 = shl i64 %598, 1
  store i64 %599, i64* %597, align 8
  %600 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %601 = load i64, i64* %600, align 16
  %602 = shl i64 %601, 1
  store i64 %602, i64* %600, align 16
  %603 = load i64, i64* %0, align 8
  %604 = and i64 %603, 1
  %605 = icmp ne i64 %604, 0
  br i1 %605, label %606, label %610

606:                                              ; preds = %586
  %607 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %608 = load i64, i64* %607, align 16
  %609 = or i64 %608, 1
  store i64 %609, i64* %607, align 16
  br label %610

610:                                              ; preds = %606, %586
  %611 = getelementptr inbounds i64, i64* %0, i64 1
  %612 = load i64, i64* %611, align 8
  %613 = and i64 %612, 1
  %614 = icmp ne i64 %613, 0
  br i1 %614, label %615, label %619

615:                                              ; preds = %610
  %616 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %617 = load i64, i64* %616, align 8
  %618 = or i64 %617, 1
  store i64 %618, i64* %616, align 8
  br label %619

619:                                              ; preds = %615, %610
  %620 = getelementptr inbounds i64, i64* %0, i64 2
  %621 = load i64, i64* %620, align 8
  %622 = and i64 %621, 1
  %623 = icmp ne i64 %622, 0
  br i1 %623, label %624, label %628

624:                                              ; preds = %619
  %625 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %626 = load i64, i64* %625, align 16
  %627 = or i64 %626, 1
  store i64 %627, i64* %625, align 16
  br label %628

628:                                              ; preds = %624, %619
  %629 = load i64, i64* %0, align 8
  %630 = lshr i64 %629, 1
  store i64 %630, i64* %0, align 8
  %631 = getelementptr inbounds i64, i64* %0, i64 1
  %632 = load i64, i64* %631, align 8
  %633 = lshr i64 %632, 1
  store i64 %633, i64* %631, align 8
  %634 = getelementptr inbounds i64, i64* %0, i64 2
  %635 = load i64, i64* %634, align 8
  %636 = lshr i64 %635, 1
  store i64 %636, i64* %634, align 8
  %637 = load i64, i64* %6, align 16
  %638 = shl i64 %637, 1
  store i64 %638, i64* %6, align 16
  %639 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %640 = load i64, i64* %639, align 8
  %641 = shl i64 %640, 1
  store i64 %641, i64* %639, align 8
  %642 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %643 = load i64, i64* %642, align 16
  %644 = shl i64 %643, 1
  store i64 %644, i64* %642, align 16
  %645 = load i64, i64* %0, align 8
  %646 = and i64 %645, 1
  %647 = icmp ne i64 %646, 0
  br i1 %647, label %648, label %652

648:                                              ; preds = %628
  %649 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %650 = load i64, i64* %649, align 16
  %651 = or i64 %650, 1
  store i64 %651, i64* %649, align 16
  br label %652

652:                                              ; preds = %648, %628
  %653 = getelementptr inbounds i64, i64* %0, i64 1
  %654 = load i64, i64* %653, align 8
  %655 = and i64 %654, 1
  %656 = icmp ne i64 %655, 0
  br i1 %656, label %657, label %661

657:                                              ; preds = %652
  %658 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %659 = load i64, i64* %658, align 8
  %660 = or i64 %659, 1
  store i64 %660, i64* %658, align 8
  br label %661

661:                                              ; preds = %657, %652
  %662 = getelementptr inbounds i64, i64* %0, i64 2
  %663 = load i64, i64* %662, align 8
  %664 = and i64 %663, 1
  %665 = icmp ne i64 %664, 0
  br i1 %665, label %666, label %670

666:                                              ; preds = %661
  %667 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %668 = load i64, i64* %667, align 16
  %669 = or i64 %668, 1
  store i64 %669, i64* %667, align 16
  br label %670

670:                                              ; preds = %666, %661
  %671 = load i64, i64* %0, align 8
  %672 = lshr i64 %671, 1
  store i64 %672, i64* %0, align 8
  %673 = getelementptr inbounds i64, i64* %0, i64 1
  %674 = load i64, i64* %673, align 8
  %675 = lshr i64 %674, 1
  store i64 %675, i64* %673, align 8
  %676 = getelementptr inbounds i64, i64* %0, i64 2
  %677 = load i64, i64* %676, align 8
  %678 = lshr i64 %677, 1
  store i64 %678, i64* %676, align 8
  %679 = load i64, i64* %6, align 16
  %680 = shl i64 %679, 1
  store i64 %680, i64* %6, align 16
  %681 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %682 = load i64, i64* %681, align 8
  %683 = shl i64 %682, 1
  store i64 %683, i64* %681, align 8
  %684 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %685 = load i64, i64* %684, align 16
  %686 = shl i64 %685, 1
  store i64 %686, i64* %684, align 16
  %687 = load i64, i64* %0, align 8
  %688 = and i64 %687, 1
  %689 = icmp ne i64 %688, 0
  br i1 %689, label %690, label %694

690:                                              ; preds = %670
  %691 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %692 = load i64, i64* %691, align 16
  %693 = or i64 %692, 1
  store i64 %693, i64* %691, align 16
  br label %694

694:                                              ; preds = %690, %670
  %695 = getelementptr inbounds i64, i64* %0, i64 1
  %696 = load i64, i64* %695, align 8
  %697 = and i64 %696, 1
  %698 = icmp ne i64 %697, 0
  br i1 %698, label %699, label %703

699:                                              ; preds = %694
  %700 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %701 = load i64, i64* %700, align 8
  %702 = or i64 %701, 1
  store i64 %702, i64* %700, align 8
  br label %703

703:                                              ; preds = %699, %694
  %704 = getelementptr inbounds i64, i64* %0, i64 2
  %705 = load i64, i64* %704, align 8
  %706 = and i64 %705, 1
  %707 = icmp ne i64 %706, 0
  br i1 %707, label %708, label %712

708:                                              ; preds = %703
  %709 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %710 = load i64, i64* %709, align 16
  %711 = or i64 %710, 1
  store i64 %711, i64* %709, align 16
  br label %712

712:                                              ; preds = %708, %703
  %713 = load i64, i64* %0, align 8
  %714 = lshr i64 %713, 1
  store i64 %714, i64* %0, align 8
  %715 = getelementptr inbounds i64, i64* %0, i64 1
  %716 = load i64, i64* %715, align 8
  %717 = lshr i64 %716, 1
  store i64 %717, i64* %715, align 8
  %718 = getelementptr inbounds i64, i64* %0, i64 2
  %719 = load i64, i64* %718, align 8
  %720 = lshr i64 %719, 1
  store i64 %720, i64* %718, align 8
  %721 = load i64, i64* %6, align 16
  %722 = shl i64 %721, 1
  store i64 %722, i64* %6, align 16
  %723 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %724 = load i64, i64* %723, align 8
  %725 = shl i64 %724, 1
  store i64 %725, i64* %723, align 8
  %726 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %727 = load i64, i64* %726, align 16
  %728 = shl i64 %727, 1
  store i64 %728, i64* %726, align 16
  %729 = load i64, i64* %0, align 8
  %730 = and i64 %729, 1
  %731 = icmp ne i64 %730, 0
  br i1 %731, label %732, label %736

732:                                              ; preds = %712
  %733 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %734 = load i64, i64* %733, align 16
  %735 = or i64 %734, 1
  store i64 %735, i64* %733, align 16
  br label %736

736:                                              ; preds = %732, %712
  %737 = getelementptr inbounds i64, i64* %0, i64 1
  %738 = load i64, i64* %737, align 8
  %739 = and i64 %738, 1
  %740 = icmp ne i64 %739, 0
  br i1 %740, label %741, label %745

741:                                              ; preds = %736
  %742 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %743 = load i64, i64* %742, align 8
  %744 = or i64 %743, 1
  store i64 %744, i64* %742, align 8
  br label %745

745:                                              ; preds = %741, %736
  %746 = getelementptr inbounds i64, i64* %0, i64 2
  %747 = load i64, i64* %746, align 8
  %748 = and i64 %747, 1
  %749 = icmp ne i64 %748, 0
  br i1 %749, label %750, label %754

750:                                              ; preds = %745
  %751 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %752 = load i64, i64* %751, align 16
  %753 = or i64 %752, 1
  store i64 %753, i64* %751, align 16
  br label %754

754:                                              ; preds = %750, %745
  %755 = load i64, i64* %0, align 8
  %756 = lshr i64 %755, 1
  store i64 %756, i64* %0, align 8
  %757 = getelementptr inbounds i64, i64* %0, i64 1
  %758 = load i64, i64* %757, align 8
  %759 = lshr i64 %758, 1
  store i64 %759, i64* %757, align 8
  %760 = getelementptr inbounds i64, i64* %0, i64 2
  %761 = load i64, i64* %760, align 8
  %762 = lshr i64 %761, 1
  store i64 %762, i64* %760, align 8
  %763 = load i64, i64* %6, align 16
  %764 = shl i64 %763, 1
  store i64 %764, i64* %6, align 16
  %765 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %766 = load i64, i64* %765, align 8
  %767 = shl i64 %766, 1
  store i64 %767, i64* %765, align 8
  %768 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %769 = load i64, i64* %768, align 16
  %770 = shl i64 %769, 1
  store i64 %770, i64* %768, align 16
  %771 = load i64, i64* %0, align 8
  %772 = and i64 %771, 1
  %773 = icmp ne i64 %772, 0
  br i1 %773, label %774, label %778

774:                                              ; preds = %754
  %775 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %776 = load i64, i64* %775, align 16
  %777 = or i64 %776, 1
  store i64 %777, i64* %775, align 16
  br label %778

778:                                              ; preds = %774, %754
  %779 = getelementptr inbounds i64, i64* %0, i64 1
  %780 = load i64, i64* %779, align 8
  %781 = and i64 %780, 1
  %782 = icmp ne i64 %781, 0
  br i1 %782, label %783, label %787

783:                                              ; preds = %778
  %784 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %785 = load i64, i64* %784, align 8
  %786 = or i64 %785, 1
  store i64 %786, i64* %784, align 8
  br label %787

787:                                              ; preds = %783, %778
  %788 = getelementptr inbounds i64, i64* %0, i64 2
  %789 = load i64, i64* %788, align 8
  %790 = and i64 %789, 1
  %791 = icmp ne i64 %790, 0
  br i1 %791, label %792, label %796

792:                                              ; preds = %787
  %793 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %794 = load i64, i64* %793, align 16
  %795 = or i64 %794, 1
  store i64 %795, i64* %793, align 16
  br label %796

796:                                              ; preds = %792, %787
  %797 = load i64, i64* %0, align 8
  %798 = lshr i64 %797, 1
  store i64 %798, i64* %0, align 8
  %799 = getelementptr inbounds i64, i64* %0, i64 1
  %800 = load i64, i64* %799, align 8
  %801 = lshr i64 %800, 1
  store i64 %801, i64* %799, align 8
  %802 = getelementptr inbounds i64, i64* %0, i64 2
  %803 = load i64, i64* %802, align 8
  %804 = lshr i64 %803, 1
  store i64 %804, i64* %802, align 8
  %805 = load i64, i64* %6, align 16
  %806 = shl i64 %805, 1
  store i64 %806, i64* %6, align 16
  %807 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %808 = load i64, i64* %807, align 8
  %809 = shl i64 %808, 1
  store i64 %809, i64* %807, align 8
  %810 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %811 = load i64, i64* %810, align 16
  %812 = shl i64 %811, 1
  store i64 %812, i64* %810, align 16
  %813 = load i64, i64* %0, align 8
  %814 = and i64 %813, 1
  %815 = icmp ne i64 %814, 0
  br i1 %815, label %816, label %820

816:                                              ; preds = %796
  %817 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %818 = load i64, i64* %817, align 16
  %819 = or i64 %818, 1
  store i64 %819, i64* %817, align 16
  br label %820

820:                                              ; preds = %816, %796
  %821 = getelementptr inbounds i64, i64* %0, i64 1
  %822 = load i64, i64* %821, align 8
  %823 = and i64 %822, 1
  %824 = icmp ne i64 %823, 0
  br i1 %824, label %825, label %829

825:                                              ; preds = %820
  %826 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %827 = load i64, i64* %826, align 8
  %828 = or i64 %827, 1
  store i64 %828, i64* %826, align 8
  br label %829

829:                                              ; preds = %825, %820
  %830 = getelementptr inbounds i64, i64* %0, i64 2
  %831 = load i64, i64* %830, align 8
  %832 = and i64 %831, 1
  %833 = icmp ne i64 %832, 0
  br i1 %833, label %834, label %838

834:                                              ; preds = %829
  %835 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %836 = load i64, i64* %835, align 16
  %837 = or i64 %836, 1
  store i64 %837, i64* %835, align 16
  br label %838

838:                                              ; preds = %834, %829
  %839 = load i64, i64* %0, align 8
  %840 = lshr i64 %839, 1
  store i64 %840, i64* %0, align 8
  %841 = getelementptr inbounds i64, i64* %0, i64 1
  %842 = load i64, i64* %841, align 8
  %843 = lshr i64 %842, 1
  store i64 %843, i64* %841, align 8
  %844 = getelementptr inbounds i64, i64* %0, i64 2
  %845 = load i64, i64* %844, align 8
  %846 = lshr i64 %845, 1
  store i64 %846, i64* %844, align 8
  %847 = load i64, i64* %6, align 16
  %848 = shl i64 %847, 1
  store i64 %848, i64* %6, align 16
  %849 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %850 = load i64, i64* %849, align 8
  %851 = shl i64 %850, 1
  store i64 %851, i64* %849, align 8
  %852 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %853 = load i64, i64* %852, align 16
  %854 = shl i64 %853, 1
  store i64 %854, i64* %852, align 16
  %855 = load i64, i64* %0, align 8
  %856 = and i64 %855, 1
  %857 = icmp ne i64 %856, 0
  br i1 %857, label %858, label %862

858:                                              ; preds = %838
  %859 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %860 = load i64, i64* %859, align 16
  %861 = or i64 %860, 1
  store i64 %861, i64* %859, align 16
  br label %862

862:                                              ; preds = %858, %838
  %863 = getelementptr inbounds i64, i64* %0, i64 1
  %864 = load i64, i64* %863, align 8
  %865 = and i64 %864, 1
  %866 = icmp ne i64 %865, 0
  br i1 %866, label %867, label %871

867:                                              ; preds = %862
  %868 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %869 = load i64, i64* %868, align 8
  %870 = or i64 %869, 1
  store i64 %870, i64* %868, align 8
  br label %871

871:                                              ; preds = %867, %862
  %872 = getelementptr inbounds i64, i64* %0, i64 2
  %873 = load i64, i64* %872, align 8
  %874 = and i64 %873, 1
  %875 = icmp ne i64 %874, 0
  br i1 %875, label %876, label %880

876:                                              ; preds = %871
  %877 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %878 = load i64, i64* %877, align 16
  %879 = or i64 %878, 1
  store i64 %879, i64* %877, align 16
  br label %880

880:                                              ; preds = %876, %871
  %881 = load i64, i64* %0, align 8
  %882 = lshr i64 %881, 1
  store i64 %882, i64* %0, align 8
  %883 = getelementptr inbounds i64, i64* %0, i64 1
  %884 = load i64, i64* %883, align 8
  %885 = lshr i64 %884, 1
  store i64 %885, i64* %883, align 8
  %886 = getelementptr inbounds i64, i64* %0, i64 2
  %887 = load i64, i64* %886, align 8
  %888 = lshr i64 %887, 1
  store i64 %888, i64* %886, align 8
  %889 = load i64, i64* %6, align 16
  %890 = shl i64 %889, 1
  store i64 %890, i64* %6, align 16
  %891 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %892 = load i64, i64* %891, align 8
  %893 = shl i64 %892, 1
  store i64 %893, i64* %891, align 8
  %894 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %895 = load i64, i64* %894, align 16
  %896 = shl i64 %895, 1
  store i64 %896, i64* %894, align 16
  %897 = load i64, i64* %0, align 8
  %898 = and i64 %897, 1
  %899 = icmp ne i64 %898, 0
  br i1 %899, label %900, label %904

900:                                              ; preds = %880
  %901 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %902 = load i64, i64* %901, align 16
  %903 = or i64 %902, 1
  store i64 %903, i64* %901, align 16
  br label %904

904:                                              ; preds = %900, %880
  %905 = getelementptr inbounds i64, i64* %0, i64 1
  %906 = load i64, i64* %905, align 8
  %907 = and i64 %906, 1
  %908 = icmp ne i64 %907, 0
  br i1 %908, label %909, label %913

909:                                              ; preds = %904
  %910 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %911 = load i64, i64* %910, align 8
  %912 = or i64 %911, 1
  store i64 %912, i64* %910, align 8
  br label %913

913:                                              ; preds = %909, %904
  %914 = getelementptr inbounds i64, i64* %0, i64 2
  %915 = load i64, i64* %914, align 8
  %916 = and i64 %915, 1
  %917 = icmp ne i64 %916, 0
  br i1 %917, label %918, label %922

918:                                              ; preds = %913
  %919 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %920 = load i64, i64* %919, align 16
  %921 = or i64 %920, 1
  store i64 %921, i64* %919, align 16
  br label %922

922:                                              ; preds = %918, %913
  %923 = load i64, i64* %0, align 8
  %924 = lshr i64 %923, 1
  store i64 %924, i64* %0, align 8
  %925 = getelementptr inbounds i64, i64* %0, i64 1
  %926 = load i64, i64* %925, align 8
  %927 = lshr i64 %926, 1
  store i64 %927, i64* %925, align 8
  %928 = getelementptr inbounds i64, i64* %0, i64 2
  %929 = load i64, i64* %928, align 8
  %930 = lshr i64 %929, 1
  store i64 %930, i64* %928, align 8
  %931 = load i64, i64* %6, align 16
  %932 = shl i64 %931, 1
  store i64 %932, i64* %6, align 16
  %933 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %934 = load i64, i64* %933, align 8
  %935 = shl i64 %934, 1
  store i64 %935, i64* %933, align 8
  %936 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %937 = load i64, i64* %936, align 16
  %938 = shl i64 %937, 1
  store i64 %938, i64* %936, align 16
  %939 = load i64, i64* %0, align 8
  %940 = and i64 %939, 1
  %941 = icmp ne i64 %940, 0
  br i1 %941, label %942, label %946

942:                                              ; preds = %922
  %943 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %944 = load i64, i64* %943, align 16
  %945 = or i64 %944, 1
  store i64 %945, i64* %943, align 16
  br label %946

946:                                              ; preds = %942, %922
  %947 = getelementptr inbounds i64, i64* %0, i64 1
  %948 = load i64, i64* %947, align 8
  %949 = and i64 %948, 1
  %950 = icmp ne i64 %949, 0
  br i1 %950, label %951, label %955

951:                                              ; preds = %946
  %952 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %953 = load i64, i64* %952, align 8
  %954 = or i64 %953, 1
  store i64 %954, i64* %952, align 8
  br label %955

955:                                              ; preds = %951, %946
  %956 = getelementptr inbounds i64, i64* %0, i64 2
  %957 = load i64, i64* %956, align 8
  %958 = and i64 %957, 1
  %959 = icmp ne i64 %958, 0
  br i1 %959, label %960, label %964

960:                                              ; preds = %955
  %961 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %962 = load i64, i64* %961, align 16
  %963 = or i64 %962, 1
  store i64 %963, i64* %961, align 16
  br label %964

964:                                              ; preds = %960, %955
  %965 = load i64, i64* %0, align 8
  %966 = lshr i64 %965, 1
  store i64 %966, i64* %0, align 8
  %967 = getelementptr inbounds i64, i64* %0, i64 1
  %968 = load i64, i64* %967, align 8
  %969 = lshr i64 %968, 1
  store i64 %969, i64* %967, align 8
  %970 = getelementptr inbounds i64, i64* %0, i64 2
  %971 = load i64, i64* %970, align 8
  %972 = lshr i64 %971, 1
  store i64 %972, i64* %970, align 8
  %973 = load i64, i64* %6, align 16
  %974 = shl i64 %973, 1
  store i64 %974, i64* %6, align 16
  %975 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %976 = load i64, i64* %975, align 8
  %977 = shl i64 %976, 1
  store i64 %977, i64* %975, align 8
  %978 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %979 = load i64, i64* %978, align 16
  %980 = shl i64 %979, 1
  store i64 %980, i64* %978, align 16
  %981 = load i64, i64* %0, align 8
  %982 = and i64 %981, 1
  %983 = icmp ne i64 %982, 0
  br i1 %983, label %984, label %988

984:                                              ; preds = %964
  %985 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %986 = load i64, i64* %985, align 16
  %987 = or i64 %986, 1
  store i64 %987, i64* %985, align 16
  br label %988

988:                                              ; preds = %984, %964
  %989 = getelementptr inbounds i64, i64* %0, i64 1
  %990 = load i64, i64* %989, align 8
  %991 = and i64 %990, 1
  %992 = icmp ne i64 %991, 0
  br i1 %992, label %993, label %997

993:                                              ; preds = %988
  %994 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %995 = load i64, i64* %994, align 8
  %996 = or i64 %995, 1
  store i64 %996, i64* %994, align 8
  br label %997

997:                                              ; preds = %993, %988
  %998 = getelementptr inbounds i64, i64* %0, i64 2
  %999 = load i64, i64* %998, align 8
  %1000 = and i64 %999, 1
  %1001 = icmp ne i64 %1000, 0
  br i1 %1001, label %1002, label %1006

1002:                                             ; preds = %997
  %1003 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %1004 = load i64, i64* %1003, align 16
  %1005 = or i64 %1004, 1
  store i64 %1005, i64* %1003, align 16
  br label %1006

1006:                                             ; preds = %1002, %997
  %1007 = load i64, i64* %0, align 8
  %1008 = lshr i64 %1007, 1
  store i64 %1008, i64* %0, align 8
  %1009 = getelementptr inbounds i64, i64* %0, i64 1
  %1010 = load i64, i64* %1009, align 8
  %1011 = lshr i64 %1010, 1
  store i64 %1011, i64* %1009, align 8
  %1012 = getelementptr inbounds i64, i64* %0, i64 2
  %1013 = load i64, i64* %1012, align 8
  %1014 = lshr i64 %1013, 1
  store i64 %1014, i64* %1012, align 8
  %1015 = load i64, i64* %6, align 16
  %1016 = shl i64 %1015, 1
  store i64 %1016, i64* %6, align 16
  %1017 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1018 = load i64, i64* %1017, align 8
  %1019 = shl i64 %1018, 1
  store i64 %1019, i64* %1017, align 8
  %1020 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1021 = load i64, i64* %1020, align 16
  %1022 = shl i64 %1021, 1
  store i64 %1022, i64* %1020, align 16
  %1023 = load i64, i64* %0, align 8
  %1024 = and i64 %1023, 1
  %1025 = icmp ne i64 %1024, 0
  br i1 %1025, label %1026, label %1030

1026:                                             ; preds = %1006
  %1027 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1028 = load i64, i64* %1027, align 16
  %1029 = or i64 %1028, 1
  store i64 %1029, i64* %1027, align 16
  br label %1030

1030:                                             ; preds = %1026, %1006
  %1031 = getelementptr inbounds i64, i64* %0, i64 1
  %1032 = load i64, i64* %1031, align 8
  %1033 = and i64 %1032, 1
  %1034 = icmp ne i64 %1033, 0
  br i1 %1034, label %1035, label %1039

1035:                                             ; preds = %1030
  %1036 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1037 = load i64, i64* %1036, align 8
  %1038 = or i64 %1037, 1
  store i64 %1038, i64* %1036, align 8
  br label %1039

1039:                                             ; preds = %1035, %1030
  %1040 = getelementptr inbounds i64, i64* %0, i64 2
  %1041 = load i64, i64* %1040, align 8
  %1042 = and i64 %1041, 1
  %1043 = icmp ne i64 %1042, 0
  br i1 %1043, label %1044, label %1048

1044:                                             ; preds = %1039
  %1045 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %1046 = load i64, i64* %1045, align 16
  %1047 = or i64 %1046, 1
  store i64 %1047, i64* %1045, align 16
  br label %1048

1048:                                             ; preds = %1044, %1039
  %1049 = load i64, i64* %0, align 8
  %1050 = lshr i64 %1049, 1
  store i64 %1050, i64* %0, align 8
  %1051 = getelementptr inbounds i64, i64* %0, i64 1
  %1052 = load i64, i64* %1051, align 8
  %1053 = lshr i64 %1052, 1
  store i64 %1053, i64* %1051, align 8
  %1054 = getelementptr inbounds i64, i64* %0, i64 2
  %1055 = load i64, i64* %1054, align 8
  %1056 = lshr i64 %1055, 1
  store i64 %1056, i64* %1054, align 8
  %1057 = load i64, i64* %6, align 16
  %1058 = shl i64 %1057, 1
  store i64 %1058, i64* %6, align 16
  %1059 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1060 = load i64, i64* %1059, align 8
  %1061 = shl i64 %1060, 1
  store i64 %1061, i64* %1059, align 8
  %1062 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1063 = load i64, i64* %1062, align 16
  %1064 = shl i64 %1063, 1
  store i64 %1064, i64* %1062, align 16
  %1065 = load i64, i64* %0, align 8
  %1066 = and i64 %1065, 1
  %1067 = icmp ne i64 %1066, 0
  br i1 %1067, label %1068, label %1072

1068:                                             ; preds = %1048
  %1069 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1070 = load i64, i64* %1069, align 16
  %1071 = or i64 %1070, 1
  store i64 %1071, i64* %1069, align 16
  br label %1072

1072:                                             ; preds = %1068, %1048
  %1073 = getelementptr inbounds i64, i64* %0, i64 1
  %1074 = load i64, i64* %1073, align 8
  %1075 = and i64 %1074, 1
  %1076 = icmp ne i64 %1075, 0
  br i1 %1076, label %1077, label %1081

1077:                                             ; preds = %1072
  %1078 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1079 = load i64, i64* %1078, align 8
  %1080 = or i64 %1079, 1
  store i64 %1080, i64* %1078, align 8
  br label %1081

1081:                                             ; preds = %1077, %1072
  %1082 = getelementptr inbounds i64, i64* %0, i64 2
  %1083 = load i64, i64* %1082, align 8
  %1084 = and i64 %1083, 1
  %1085 = icmp ne i64 %1084, 0
  br i1 %1085, label %1086, label %1090

1086:                                             ; preds = %1081
  %1087 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %1088 = load i64, i64* %1087, align 16
  %1089 = or i64 %1088, 1
  store i64 %1089, i64* %1087, align 16
  br label %1090

1090:                                             ; preds = %1086, %1081
  %1091 = load i64, i64* %0, align 8
  %1092 = lshr i64 %1091, 1
  store i64 %1092, i64* %0, align 8
  %1093 = getelementptr inbounds i64, i64* %0, i64 1
  %1094 = load i64, i64* %1093, align 8
  %1095 = lshr i64 %1094, 1
  store i64 %1095, i64* %1093, align 8
  %1096 = getelementptr inbounds i64, i64* %0, i64 2
  %1097 = load i64, i64* %1096, align 8
  %1098 = lshr i64 %1097, 1
  store i64 %1098, i64* %1096, align 8
  %1099 = load i64, i64* %6, align 16
  %1100 = shl i64 %1099, 1
  store i64 %1100, i64* %6, align 16
  %1101 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1102 = load i64, i64* %1101, align 8
  %1103 = shl i64 %1102, 1
  store i64 %1103, i64* %1101, align 8
  %1104 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1105 = load i64, i64* %1104, align 16
  %1106 = shl i64 %1105, 1
  store i64 %1106, i64* %1104, align 16
  %1107 = load i64, i64* %0, align 8
  %1108 = and i64 %1107, 1
  %1109 = icmp ne i64 %1108, 0
  br i1 %1109, label %1110, label %1114

1110:                                             ; preds = %1090
  %1111 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1112 = load i64, i64* %1111, align 16
  %1113 = or i64 %1112, 1
  store i64 %1113, i64* %1111, align 16
  br label %1114

1114:                                             ; preds = %1110, %1090
  %1115 = getelementptr inbounds i64, i64* %0, i64 1
  %1116 = load i64, i64* %1115, align 8
  %1117 = and i64 %1116, 1
  %1118 = icmp ne i64 %1117, 0
  br i1 %1118, label %1119, label %1123

1119:                                             ; preds = %1114
  %1120 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1121 = load i64, i64* %1120, align 8
  %1122 = or i64 %1121, 1
  store i64 %1122, i64* %1120, align 8
  br label %1123

1123:                                             ; preds = %1119, %1114
  %1124 = getelementptr inbounds i64, i64* %0, i64 2
  %1125 = load i64, i64* %1124, align 8
  %1126 = and i64 %1125, 1
  %1127 = icmp ne i64 %1126, 0
  br i1 %1127, label %1128, label %1132

1128:                                             ; preds = %1123
  %1129 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %1130 = load i64, i64* %1129, align 16
  %1131 = or i64 %1130, 1
  store i64 %1131, i64* %1129, align 16
  br label %1132

1132:                                             ; preds = %1128, %1123
  %1133 = load i64, i64* %0, align 8
  %1134 = lshr i64 %1133, 1
  store i64 %1134, i64* %0, align 8
  %1135 = getelementptr inbounds i64, i64* %0, i64 1
  %1136 = load i64, i64* %1135, align 8
  %1137 = lshr i64 %1136, 1
  store i64 %1137, i64* %1135, align 8
  %1138 = getelementptr inbounds i64, i64* %0, i64 2
  %1139 = load i64, i64* %1138, align 8
  %1140 = lshr i64 %1139, 1
  store i64 %1140, i64* %1138, align 8
  %1141 = load i64, i64* %6, align 16
  %1142 = shl i64 %1141, 1
  store i64 %1142, i64* %6, align 16
  %1143 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1144 = load i64, i64* %1143, align 8
  %1145 = shl i64 %1144, 1
  store i64 %1145, i64* %1143, align 8
  %1146 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1147 = load i64, i64* %1146, align 16
  %1148 = shl i64 %1147, 1
  store i64 %1148, i64* %1146, align 16
  %1149 = load i64, i64* %0, align 8
  %1150 = and i64 %1149, 1
  %1151 = icmp ne i64 %1150, 0
  br i1 %1151, label %1152, label %1156

1152:                                             ; preds = %1132
  %1153 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1154 = load i64, i64* %1153, align 16
  %1155 = or i64 %1154, 1
  store i64 %1155, i64* %1153, align 16
  br label %1156

1156:                                             ; preds = %1152, %1132
  %1157 = getelementptr inbounds i64, i64* %0, i64 1
  %1158 = load i64, i64* %1157, align 8
  %1159 = and i64 %1158, 1
  %1160 = icmp ne i64 %1159, 0
  br i1 %1160, label %1161, label %1165

1161:                                             ; preds = %1156
  %1162 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1163 = load i64, i64* %1162, align 8
  %1164 = or i64 %1163, 1
  store i64 %1164, i64* %1162, align 8
  br label %1165

1165:                                             ; preds = %1161, %1156
  %1166 = getelementptr inbounds i64, i64* %0, i64 2
  %1167 = load i64, i64* %1166, align 8
  %1168 = and i64 %1167, 1
  %1169 = icmp ne i64 %1168, 0
  br i1 %1169, label %1170, label %1174

1170:                                             ; preds = %1165
  %1171 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %1172 = load i64, i64* %1171, align 16
  %1173 = or i64 %1172, 1
  store i64 %1173, i64* %1171, align 16
  br label %1174

1174:                                             ; preds = %1170, %1165
  %1175 = load i64, i64* %0, align 8
  %1176 = lshr i64 %1175, 1
  store i64 %1176, i64* %0, align 8
  %1177 = getelementptr inbounds i64, i64* %0, i64 1
  %1178 = load i64, i64* %1177, align 8
  %1179 = lshr i64 %1178, 1
  store i64 %1179, i64* %1177, align 8
  %1180 = getelementptr inbounds i64, i64* %0, i64 2
  %1181 = load i64, i64* %1180, align 8
  %1182 = lshr i64 %1181, 1
  store i64 %1182, i64* %1180, align 8
  %1183 = load i64, i64* %6, align 16
  %1184 = shl i64 %1183, 1
  store i64 %1184, i64* %6, align 16
  %1185 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1186 = load i64, i64* %1185, align 8
  %1187 = shl i64 %1186, 1
  store i64 %1187, i64* %1185, align 8
  %1188 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1189 = load i64, i64* %1188, align 16
  %1190 = shl i64 %1189, 1
  store i64 %1190, i64* %1188, align 16
  %1191 = load i64, i64* %0, align 8
  %1192 = and i64 %1191, 1
  %1193 = icmp ne i64 %1192, 0
  br i1 %1193, label %1194, label %1198

1194:                                             ; preds = %1174
  %1195 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1196 = load i64, i64* %1195, align 16
  %1197 = or i64 %1196, 1
  store i64 %1197, i64* %1195, align 16
  br label %1198

1198:                                             ; preds = %1194, %1174
  %1199 = getelementptr inbounds i64, i64* %0, i64 1
  %1200 = load i64, i64* %1199, align 8
  %1201 = and i64 %1200, 1
  %1202 = icmp ne i64 %1201, 0
  br i1 %1202, label %1203, label %1207

1203:                                             ; preds = %1198
  %1204 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1205 = load i64, i64* %1204, align 8
  %1206 = or i64 %1205, 1
  store i64 %1206, i64* %1204, align 8
  br label %1207

1207:                                             ; preds = %1203, %1198
  %1208 = getelementptr inbounds i64, i64* %0, i64 2
  %1209 = load i64, i64* %1208, align 8
  %1210 = and i64 %1209, 1
  %1211 = icmp ne i64 %1210, 0
  br i1 %1211, label %1212, label %1216

1212:                                             ; preds = %1207
  %1213 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %1214 = load i64, i64* %1213, align 16
  %1215 = or i64 %1214, 1
  store i64 %1215, i64* %1213, align 16
  br label %1216

1216:                                             ; preds = %1212, %1207
  %1217 = load i64, i64* %0, align 8
  %1218 = lshr i64 %1217, 1
  store i64 %1218, i64* %0, align 8
  %1219 = getelementptr inbounds i64, i64* %0, i64 1
  %1220 = load i64, i64* %1219, align 8
  %1221 = lshr i64 %1220, 1
  store i64 %1221, i64* %1219, align 8
  %1222 = getelementptr inbounds i64, i64* %0, i64 2
  %1223 = load i64, i64* %1222, align 8
  %1224 = lshr i64 %1223, 1
  store i64 %1224, i64* %1222, align 8
  %1225 = load i64, i64* %6, align 16
  %1226 = shl i64 %1225, 1
  store i64 %1226, i64* %6, align 16
  %1227 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1228 = load i64, i64* %1227, align 8
  %1229 = shl i64 %1228, 1
  store i64 %1229, i64* %1227, align 8
  %1230 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1231 = load i64, i64* %1230, align 16
  %1232 = shl i64 %1231, 1
  store i64 %1232, i64* %1230, align 16
  %1233 = load i64, i64* %0, align 8
  %1234 = and i64 %1233, 1
  %1235 = icmp ne i64 %1234, 0
  br i1 %1235, label %1236, label %1240

1236:                                             ; preds = %1216
  %1237 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1238 = load i64, i64* %1237, align 16
  %1239 = or i64 %1238, 1
  store i64 %1239, i64* %1237, align 16
  br label %1240

1240:                                             ; preds = %1236, %1216
  %1241 = getelementptr inbounds i64, i64* %0, i64 1
  %1242 = load i64, i64* %1241, align 8
  %1243 = and i64 %1242, 1
  %1244 = icmp ne i64 %1243, 0
  br i1 %1244, label %1245, label %1249

1245:                                             ; preds = %1240
  %1246 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1247 = load i64, i64* %1246, align 8
  %1248 = or i64 %1247, 1
  store i64 %1248, i64* %1246, align 8
  br label %1249

1249:                                             ; preds = %1245, %1240
  %1250 = getelementptr inbounds i64, i64* %0, i64 2
  %1251 = load i64, i64* %1250, align 8
  %1252 = and i64 %1251, 1
  %1253 = icmp ne i64 %1252, 0
  br i1 %1253, label %1254, label %1258

1254:                                             ; preds = %1249
  %1255 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %1256 = load i64, i64* %1255, align 16
  %1257 = or i64 %1256, 1
  store i64 %1257, i64* %1255, align 16
  br label %1258

1258:                                             ; preds = %1254, %1249
  %1259 = load i64, i64* %0, align 8
  %1260 = lshr i64 %1259, 1
  store i64 %1260, i64* %0, align 8
  %1261 = getelementptr inbounds i64, i64* %0, i64 1
  %1262 = load i64, i64* %1261, align 8
  %1263 = lshr i64 %1262, 1
  store i64 %1263, i64* %1261, align 8
  %1264 = getelementptr inbounds i64, i64* %0, i64 2
  %1265 = load i64, i64* %1264, align 8
  %1266 = lshr i64 %1265, 1
  store i64 %1266, i64* %1264, align 8
  %1267 = load i64, i64* %6, align 16
  %1268 = shl i64 %1267, 1
  store i64 %1268, i64* %6, align 16
  %1269 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1270 = load i64, i64* %1269, align 8
  %1271 = shl i64 %1270, 1
  store i64 %1271, i64* %1269, align 8
  %1272 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1273 = load i64, i64* %1272, align 16
  %1274 = shl i64 %1273, 1
  store i64 %1274, i64* %1272, align 16
  %1275 = load i64, i64* %0, align 8
  %1276 = and i64 %1275, 1
  %1277 = icmp ne i64 %1276, 0
  br i1 %1277, label %1278, label %1282

1278:                                             ; preds = %1258
  %1279 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1280 = load i64, i64* %1279, align 16
  %1281 = or i64 %1280, 1
  store i64 %1281, i64* %1279, align 16
  br label %1282

1282:                                             ; preds = %1278, %1258
  %1283 = getelementptr inbounds i64, i64* %0, i64 1
  %1284 = load i64, i64* %1283, align 8
  %1285 = and i64 %1284, 1
  %1286 = icmp ne i64 %1285, 0
  br i1 %1286, label %1287, label %1291

1287:                                             ; preds = %1282
  %1288 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1289 = load i64, i64* %1288, align 8
  %1290 = or i64 %1289, 1
  store i64 %1290, i64* %1288, align 8
  br label %1291

1291:                                             ; preds = %1287, %1282
  %1292 = getelementptr inbounds i64, i64* %0, i64 2
  %1293 = load i64, i64* %1292, align 8
  %1294 = and i64 %1293, 1
  %1295 = icmp ne i64 %1294, 0
  br i1 %1295, label %1296, label %1300

1296:                                             ; preds = %1291
  %1297 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %1298 = load i64, i64* %1297, align 16
  %1299 = or i64 %1298, 1
  store i64 %1299, i64* %1297, align 16
  br label %1300

1300:                                             ; preds = %1296, %1291
  %1301 = load i64, i64* %0, align 8
  %1302 = lshr i64 %1301, 1
  store i64 %1302, i64* %0, align 8
  %1303 = getelementptr inbounds i64, i64* %0, i64 1
  %1304 = load i64, i64* %1303, align 8
  %1305 = lshr i64 %1304, 1
  store i64 %1305, i64* %1303, align 8
  %1306 = getelementptr inbounds i64, i64* %0, i64 2
  %1307 = load i64, i64* %1306, align 8
  %1308 = lshr i64 %1307, 1
  store i64 %1308, i64* %1306, align 8
  %1309 = load i64, i64* %6, align 16
  %1310 = shl i64 %1309, 1
  store i64 %1310, i64* %6, align 16
  %1311 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1312 = load i64, i64* %1311, align 8
  %1313 = shl i64 %1312, 1
  store i64 %1313, i64* %1311, align 8
  %1314 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1315 = load i64, i64* %1314, align 16
  %1316 = shl i64 %1315, 1
  store i64 %1316, i64* %1314, align 16
  %1317 = load i64, i64* %0, align 8
  %1318 = and i64 %1317, 1
  %1319 = icmp ne i64 %1318, 0
  br i1 %1319, label %1320, label %1324

1320:                                             ; preds = %1300
  %1321 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1322 = load i64, i64* %1321, align 16
  %1323 = or i64 %1322, 1
  store i64 %1323, i64* %1321, align 16
  br label %1324

1324:                                             ; preds = %1320, %1300
  %1325 = getelementptr inbounds i64, i64* %0, i64 1
  %1326 = load i64, i64* %1325, align 8
  %1327 = and i64 %1326, 1
  %1328 = icmp ne i64 %1327, 0
  br i1 %1328, label %1329, label %1333

1329:                                             ; preds = %1324
  %1330 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1331 = load i64, i64* %1330, align 8
  %1332 = or i64 %1331, 1
  store i64 %1332, i64* %1330, align 8
  br label %1333

1333:                                             ; preds = %1329, %1324
  %1334 = getelementptr inbounds i64, i64* %0, i64 2
  %1335 = load i64, i64* %1334, align 8
  %1336 = and i64 %1335, 1
  %1337 = icmp ne i64 %1336, 0
  br i1 %1337, label %1338, label %1342

1338:                                             ; preds = %1333
  %1339 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %1340 = load i64, i64* %1339, align 16
  %1341 = or i64 %1340, 1
  store i64 %1341, i64* %1339, align 16
  br label %1342

1342:                                             ; preds = %1338, %1333
  %1343 = load i64, i64* %0, align 8
  %1344 = lshr i64 %1343, 1
  store i64 %1344, i64* %0, align 8
  %1345 = getelementptr inbounds i64, i64* %0, i64 1
  %1346 = load i64, i64* %1345, align 8
  %1347 = lshr i64 %1346, 1
  store i64 %1347, i64* %1345, align 8
  %1348 = getelementptr inbounds i64, i64* %0, i64 2
  %1349 = load i64, i64* %1348, align 8
  %1350 = lshr i64 %1349, 1
  store i64 %1350, i64* %1348, align 8
  %1351 = load i64, i64* %6, align 16
  store i64 %1351, i64* %0, align 8
  %1352 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %1353 = load i64, i64* %1352, align 8
  %1354 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %1353, i64* %1354, align 8
  %1355 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %1356 = load i64, i64* %1355, align 16
  %1357 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %1356, i64* %1357, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @gamma_(i64* %0) #0 {
  %2 = alloca [3 x i64], align 16
  %3 = getelementptr inbounds i64, i64* %0, i64 0
  %4 = load i64, i64* %3, align 8
  %5 = getelementptr inbounds i64, i64* %0, i64 1
  %6 = load i64, i64* %5, align 8
  %7 = getelementptr inbounds i64, i64* %0, i64 2
  %8 = load i64, i64* %7, align 8
  %9 = xor i64 %8, -1
  %10 = or i64 %6, %9
  %11 = xor i64 %4, %10
  %12 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  store i64 %11, i64* %12, align 16
  %13 = getelementptr inbounds i64, i64* %0, i64 1
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds i64, i64* %0, i64 2
  %16 = load i64, i64* %15, align 8
  %17 = getelementptr inbounds i64, i64* %0, i64 0
  %18 = load i64, i64* %17, align 8
  %19 = xor i64 %18, -1
  %20 = or i64 %16, %19
  %21 = xor i64 %14, %20
  %22 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  store i64 %21, i64* %22, align 8
  %23 = getelementptr inbounds i64, i64* %0, i64 2
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds i64, i64* %0, i64 0
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds i64, i64* %0, i64 1
  %28 = load i64, i64* %27, align 8
  %29 = xor i64 %28, -1
  %30 = or i64 %26, %29
  %31 = xor i64 %24, %30
  %32 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  store i64 %31, i64* %32, align 16
  %33 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %34 = load i64, i64* %33, align 16
  %35 = getelementptr inbounds i64, i64* %0, i64 0
  store i64 %34, i64* %35, align 8
  %36 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %37, i64* %38, align 8
  %39 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %40 = load i64, i64* %39, align 16
  %41 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %40, i64* %41, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @theta(i64* %0) #0 {
  %2 = alloca [3 x i64], align 16
  %3 = getelementptr inbounds i64, i64* %0, i64 0
  %4 = load i64, i64* %3, align 8
  %5 = getelementptr inbounds i64, i64* %0, i64 0
  %6 = load i64, i64* %5, align 8
  %7 = lshr i64 %6, 16
  %8 = xor i64 %4, %7
  %9 = getelementptr inbounds i64, i64* %0, i64 1
  %10 = load i64, i64* %9, align 8
  %11 = shl i64 %10, 16
  %12 = xor i64 %8, %11
  %13 = getelementptr inbounds i64, i64* %0, i64 1
  %14 = load i64, i64* %13, align 8
  %15 = lshr i64 %14, 16
  %16 = xor i64 %12, %15
  %17 = getelementptr inbounds i64, i64* %0, i64 2
  %18 = load i64, i64* %17, align 8
  %19 = shl i64 %18, 16
  %20 = xor i64 %16, %19
  %21 = getelementptr inbounds i64, i64* %0, i64 1
  %22 = load i64, i64* %21, align 8
  %23 = lshr i64 %22, 24
  %24 = xor i64 %20, %23
  %25 = getelementptr inbounds i64, i64* %0, i64 2
  %26 = load i64, i64* %25, align 8
  %27 = shl i64 %26, 8
  %28 = xor i64 %24, %27
  %29 = getelementptr inbounds i64, i64* %0, i64 2
  %30 = load i64, i64* %29, align 8
  %31 = lshr i64 %30, 8
  %32 = xor i64 %28, %31
  %33 = getelementptr inbounds i64, i64* %0, i64 0
  %34 = load i64, i64* %33, align 8
  %35 = shl i64 %34, 24
  %36 = xor i64 %32, %35
  %37 = getelementptr inbounds i64, i64* %0, i64 2
  %38 = load i64, i64* %37, align 8
  %39 = lshr i64 %38, 16
  %40 = xor i64 %36, %39
  %41 = getelementptr inbounds i64, i64* %0, i64 0
  %42 = load i64, i64* %41, align 8
  %43 = shl i64 %42, 16
  %44 = xor i64 %40, %43
  %45 = getelementptr inbounds i64, i64* %0, i64 2
  %46 = load i64, i64* %45, align 8
  %47 = lshr i64 %46, 24
  %48 = xor i64 %44, %47
  %49 = getelementptr inbounds i64, i64* %0, i64 0
  %50 = load i64, i64* %49, align 8
  %51 = shl i64 %50, 8
  %52 = xor i64 %48, %51
  %53 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  store i64 %52, i64* %53, align 16
  %54 = getelementptr inbounds i64, i64* %0, i64 1
  %55 = load i64, i64* %54, align 8
  %56 = getelementptr inbounds i64, i64* %0, i64 1
  %57 = load i64, i64* %56, align 8
  %58 = lshr i64 %57, 16
  %59 = xor i64 %55, %58
  %60 = getelementptr inbounds i64, i64* %0, i64 2
  %61 = load i64, i64* %60, align 8
  %62 = shl i64 %61, 16
  %63 = xor i64 %59, %62
  %64 = getelementptr inbounds i64, i64* %0, i64 2
  %65 = load i64, i64* %64, align 8
  %66 = lshr i64 %65, 16
  %67 = xor i64 %63, %66
  %68 = getelementptr inbounds i64, i64* %0, i64 0
  %69 = load i64, i64* %68, align 8
  %70 = shl i64 %69, 16
  %71 = xor i64 %67, %70
  %72 = getelementptr inbounds i64, i64* %0, i64 2
  %73 = load i64, i64* %72, align 8
  %74 = lshr i64 %73, 24
  %75 = xor i64 %71, %74
  %76 = getelementptr inbounds i64, i64* %0, i64 0
  %77 = load i64, i64* %76, align 8
  %78 = shl i64 %77, 8
  %79 = xor i64 %75, %78
  %80 = getelementptr inbounds i64, i64* %0, i64 0
  %81 = load i64, i64* %80, align 8
  %82 = lshr i64 %81, 8
  %83 = xor i64 %79, %82
  %84 = getelementptr inbounds i64, i64* %0, i64 1
  %85 = load i64, i64* %84, align 8
  %86 = shl i64 %85, 24
  %87 = xor i64 %83, %86
  %88 = getelementptr inbounds i64, i64* %0, i64 0
  %89 = load i64, i64* %88, align 8
  %90 = lshr i64 %89, 16
  %91 = xor i64 %87, %90
  %92 = getelementptr inbounds i64, i64* %0, i64 1
  %93 = load i64, i64* %92, align 8
  %94 = shl i64 %93, 16
  %95 = xor i64 %91, %94
  %96 = getelementptr inbounds i64, i64* %0, i64 0
  %97 = load i64, i64* %96, align 8
  %98 = lshr i64 %97, 24
  %99 = xor i64 %95, %98
  %100 = getelementptr inbounds i64, i64* %0, i64 1
  %101 = load i64, i64* %100, align 8
  %102 = shl i64 %101, 8
  %103 = xor i64 %99, %102
  %104 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  store i64 %103, i64* %104, align 8
  %105 = getelementptr inbounds i64, i64* %0, i64 2
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds i64, i64* %0, i64 2
  %108 = load i64, i64* %107, align 8
  %109 = lshr i64 %108, 16
  %110 = xor i64 %106, %109
  %111 = getelementptr inbounds i64, i64* %0, i64 0
  %112 = load i64, i64* %111, align 8
  %113 = shl i64 %112, 16
  %114 = xor i64 %110, %113
  %115 = getelementptr inbounds i64, i64* %0, i64 0
  %116 = load i64, i64* %115, align 8
  %117 = lshr i64 %116, 16
  %118 = xor i64 %114, %117
  %119 = getelementptr inbounds i64, i64* %0, i64 1
  %120 = load i64, i64* %119, align 8
  %121 = shl i64 %120, 16
  %122 = xor i64 %118, %121
  %123 = getelementptr inbounds i64, i64* %0, i64 0
  %124 = load i64, i64* %123, align 8
  %125 = lshr i64 %124, 24
  %126 = xor i64 %122, %125
  %127 = getelementptr inbounds i64, i64* %0, i64 1
  %128 = load i64, i64* %127, align 8
  %129 = shl i64 %128, 8
  %130 = xor i64 %126, %129
  %131 = getelementptr inbounds i64, i64* %0, i64 1
  %132 = load i64, i64* %131, align 8
  %133 = lshr i64 %132, 8
  %134 = xor i64 %130, %133
  %135 = getelementptr inbounds i64, i64* %0, i64 2
  %136 = load i64, i64* %135, align 8
  %137 = shl i64 %136, 24
  %138 = xor i64 %134, %137
  %139 = getelementptr inbounds i64, i64* %0, i64 1
  %140 = load i64, i64* %139, align 8
  %141 = lshr i64 %140, 16
  %142 = xor i64 %138, %141
  %143 = getelementptr inbounds i64, i64* %0, i64 2
  %144 = load i64, i64* %143, align 8
  %145 = shl i64 %144, 16
  %146 = xor i64 %142, %145
  %147 = getelementptr inbounds i64, i64* %0, i64 1
  %148 = load i64, i64* %147, align 8
  %149 = lshr i64 %148, 24
  %150 = xor i64 %146, %149
  %151 = getelementptr inbounds i64, i64* %0, i64 2
  %152 = load i64, i64* %151, align 8
  %153 = shl i64 %152, 8
  %154 = xor i64 %150, %153
  %155 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  store i64 %154, i64* %155, align 16
  %156 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  %157 = load i64, i64* %156, align 16
  %158 = getelementptr inbounds i64, i64* %0, i64 0
  store i64 %157, i64* %158, align 8
  %159 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 1
  %160 = load i64, i64* %159, align 8
  %161 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %160, i64* %161, align 8
  %162 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 2
  %163 = load i64, i64* %162, align 16
  %164 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %163, i64* %164, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @pi_1(i64* %0) #0 {
  %2 = getelementptr inbounds i64, i64* %0, i64 0
  %3 = load i64, i64* %2, align 8
  %4 = lshr i64 %3, 10
  %5 = getelementptr inbounds i64, i64* %0, i64 0
  %6 = load i64, i64* %5, align 8
  %7 = shl i64 %6, 22
  %8 = xor i64 %4, %7
  %9 = getelementptr inbounds i64, i64* %0, i64 0
  store i64 %8, i64* %9, align 8
  %10 = getelementptr inbounds i64, i64* %0, i64 2
  %11 = load i64, i64* %10, align 8
  %12 = shl i64 %11, 1
  %13 = getelementptr inbounds i64, i64* %0, i64 2
  %14 = load i64, i64* %13, align 8
  %15 = lshr i64 %14, 31
  %16 = xor i64 %12, %15
  %17 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %16, i64* %17, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @pi_2(i64* %0) #0 {
  %2 = getelementptr inbounds i64, i64* %0, i64 0
  %3 = load i64, i64* %2, align 8
  %4 = shl i64 %3, 1
  %5 = getelementptr inbounds i64, i64* %0, i64 0
  %6 = load i64, i64* %5, align 8
  %7 = lshr i64 %6, 31
  %8 = xor i64 %4, %7
  %9 = getelementptr inbounds i64, i64* %0, i64 0
  store i64 %8, i64* %9, align 8
  %10 = getelementptr inbounds i64, i64* %0, i64 2
  %11 = load i64, i64* %10, align 8
  %12 = lshr i64 %11, 10
  %13 = getelementptr inbounds i64, i64* %0, i64 2
  %14 = load i64, i64* %13, align 8
  %15 = shl i64 %14, 22
  %16 = xor i64 %12, %15
  %17 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %16, i64* %17, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @rho(i64* %0) #0 {
  call void @theta(i64* %0)
  call void @pi_1(i64* %0)
  call void @gamma_(i64* %0)
  call void @pi_2(i64* %0)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @rndcon_gen(i64 %0, i64* %1) #0 {
  store i64 %0, i64* %1, align 8
  %3 = shl i64 %0, 1
  %4 = and i64 %3, 65536
  %5 = icmp ne i64 %4, 0
  %6 = xor i64 %3, 69649
  %spec.select = select i1 %5, i64 %6, i64 %3
  %7 = getelementptr inbounds i64, i64* %1, i64 1
  store i64 %spec.select, i64* %7, align 8
  %8 = shl i64 %spec.select, 1
  %9 = and i64 %8, 65536
  %10 = icmp ne i64 %9, 0
  %11 = xor i64 %8, 69649
  %spec.select.1 = select i1 %10, i64 %11, i64 %8
  %12 = getelementptr inbounds i64, i64* %1, i64 2
  store i64 %spec.select.1, i64* %12, align 8
  %13 = shl i64 %spec.select.1, 1
  %14 = and i64 %13, 65536
  %15 = icmp ne i64 %14, 0
  %16 = xor i64 %13, 69649
  %spec.select.2 = select i1 %15, i64 %16, i64 %13
  %17 = getelementptr inbounds i64, i64* %1, i64 3
  store i64 %spec.select.2, i64* %17, align 8
  %18 = shl i64 %spec.select.2, 1
  %19 = and i64 %18, 65536
  %20 = icmp ne i64 %19, 0
  %21 = xor i64 %18, 69649
  %spec.select.3 = select i1 %20, i64 %21, i64 %18
  %22 = getelementptr inbounds i64, i64* %1, i64 4
  store i64 %spec.select.3, i64* %22, align 8
  %23 = shl i64 %spec.select.3, 1
  %24 = and i64 %23, 65536
  %25 = icmp ne i64 %24, 0
  %26 = xor i64 %23, 69649
  %spec.select.4 = select i1 %25, i64 %26, i64 %23
  %27 = getelementptr inbounds i64, i64* %1, i64 5
  store i64 %spec.select.4, i64* %27, align 8
  %28 = shl i64 %spec.select.4, 1
  %29 = and i64 %28, 65536
  %30 = icmp ne i64 %29, 0
  %31 = xor i64 %28, 69649
  %spec.select.5 = select i1 %30, i64 %31, i64 %28
  %32 = getelementptr inbounds i64, i64* %1, i64 6
  store i64 %spec.select.5, i64* %32, align 8
  %33 = shl i64 %spec.select.5, 1
  %34 = and i64 %33, 65536
  %35 = icmp ne i64 %34, 0
  %36 = xor i64 %33, 69649
  %spec.select.6 = select i1 %35, i64 %36, i64 %33
  %37 = getelementptr inbounds i64, i64* %1, i64 7
  store i64 %spec.select.6, i64* %37, align 8
  %38 = shl i64 %spec.select.6, 1
  %39 = and i64 %38, 65536
  %40 = icmp ne i64 %39, 0
  %41 = xor i64 %38, 69649
  %spec.select.7 = select i1 %40, i64 %41, i64 %38
  %42 = getelementptr inbounds i64, i64* %1, i64 8
  store i64 %spec.select.7, i64* %42, align 8
  %43 = shl i64 %spec.select.7, 1
  %44 = and i64 %43, 65536
  %45 = icmp ne i64 %44, 0
  %46 = xor i64 %43, 69649
  %spec.select.8 = select i1 %45, i64 %46, i64 %43
  %47 = getelementptr inbounds i64, i64* %1, i64 9
  store i64 %spec.select.8, i64* %47, align 8
  %48 = shl i64 %spec.select.8, 1
  %49 = and i64 %48, 65536
  %50 = icmp ne i64 %49, 0
  %51 = xor i64 %48, 69649
  %spec.select.9 = select i1 %50, i64 %51, i64 %48
  %52 = getelementptr inbounds i64, i64* %1, i64 10
  store i64 %spec.select.9, i64* %52, align 8
  %53 = shl i64 %spec.select.9, 1
  %54 = and i64 %53, 65536
  %55 = icmp ne i64 %54, 0
  %56 = xor i64 %53, 69649
  %spec.select.10 = select i1 %55, i64 %56, i64 %53
  %57 = getelementptr inbounds i64, i64* %1, i64 11
  store i64 %spec.select.10, i64* %57, align 8
  %58 = shl i64 %spec.select.10, 1
  %59 = and i64 %58, 65536
  %60 = icmp ne i64 %59, 0
  %61 = xor i64 %58, 69649
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @encrypt(%struct.twy_ctx* %0, i64* %1) #0 {
  %3 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %4 = getelementptr inbounds [3 x i64], [3 x i64]* %3, i64 0, i64 0
  %5 = load i64, i64* %4, align 8
  %6 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %7 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 0
  %8 = load i64, i64* %7, align 8
  %9 = shl i64 %8, 16
  %10 = xor i64 %5, %9
  %11 = load i64, i64* %1, align 8
  %12 = xor i64 %11, %10
  store i64 %12, i64* %1, align 8
  %13 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %14 = getelementptr inbounds [3 x i64], [3 x i64]* %13, i64 0, i64 1
  %15 = load i64, i64* %14, align 8
  %16 = getelementptr inbounds i64, i64* %1, i64 1
  %17 = load i64, i64* %16, align 8
  %18 = xor i64 %17, %15
  store i64 %18, i64* %16, align 8
  %19 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %20 = getelementptr inbounds [3 x i64], [3 x i64]* %19, i64 0, i64 2
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %23 = getelementptr inbounds [12 x i64], [12 x i64]* %22, i64 0, i64 0
  %24 = load i64, i64* %23, align 8
  %25 = xor i64 %21, %24
  %26 = getelementptr inbounds i64, i64* %1, i64 2
  %27 = load i64, i64* %26, align 8
  %28 = xor i64 %27, %25
  store i64 %28, i64* %26, align 8
  call void @rho(i64* %1)
  %29 = load i64, i64* %4, align 8
  %30 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 1
  %31 = load i64, i64* %30, align 8
  %32 = shl i64 %31, 16
  %33 = xor i64 %29, %32
  %34 = load i64, i64* %1, align 8
  %35 = xor i64 %34, %33
  store i64 %35, i64* %1, align 8
  %36 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %37 = getelementptr inbounds [3 x i64], [3 x i64]* %36, i64 0, i64 1
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds i64, i64* %1, i64 1
  %40 = load i64, i64* %39, align 8
  %41 = xor i64 %40, %38
  store i64 %41, i64* %39, align 8
  %42 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %43 = getelementptr inbounds [3 x i64], [3 x i64]* %42, i64 0, i64 2
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %46 = getelementptr inbounds [12 x i64], [12 x i64]* %45, i64 0, i64 1
  %47 = load i64, i64* %46, align 8
  %48 = xor i64 %44, %47
  %49 = getelementptr inbounds i64, i64* %1, i64 2
  %50 = load i64, i64* %49, align 8
  %51 = xor i64 %50, %48
  store i64 %51, i64* %49, align 8
  call void @rho(i64* %1)
  %52 = load i64, i64* %4, align 8
  %53 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 2
  %54 = load i64, i64* %53, align 8
  %55 = shl i64 %54, 16
  %56 = xor i64 %52, %55
  %57 = load i64, i64* %1, align 8
  %58 = xor i64 %57, %56
  store i64 %58, i64* %1, align 8
  %59 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %60 = getelementptr inbounds [3 x i64], [3 x i64]* %59, i64 0, i64 1
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds i64, i64* %1, i64 1
  %63 = load i64, i64* %62, align 8
  %64 = xor i64 %63, %61
  store i64 %64, i64* %62, align 8
  %65 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %66 = getelementptr inbounds [3 x i64], [3 x i64]* %65, i64 0, i64 2
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %69 = getelementptr inbounds [12 x i64], [12 x i64]* %68, i64 0, i64 2
  %70 = load i64, i64* %69, align 8
  %71 = xor i64 %67, %70
  %72 = getelementptr inbounds i64, i64* %1, i64 2
  %73 = load i64, i64* %72, align 8
  %74 = xor i64 %73, %71
  store i64 %74, i64* %72, align 8
  call void @rho(i64* %1)
  %75 = load i64, i64* %4, align 8
  %76 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 3
  %77 = load i64, i64* %76, align 8
  %78 = shl i64 %77, 16
  %79 = xor i64 %75, %78
  %80 = load i64, i64* %1, align 8
  %81 = xor i64 %80, %79
  store i64 %81, i64* %1, align 8
  %82 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %83 = getelementptr inbounds [3 x i64], [3 x i64]* %82, i64 0, i64 1
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds i64, i64* %1, i64 1
  %86 = load i64, i64* %85, align 8
  %87 = xor i64 %86, %84
  store i64 %87, i64* %85, align 8
  %88 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %89 = getelementptr inbounds [3 x i64], [3 x i64]* %88, i64 0, i64 2
  %90 = load i64, i64* %89, align 8
  %91 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %92 = getelementptr inbounds [12 x i64], [12 x i64]* %91, i64 0, i64 3
  %93 = load i64, i64* %92, align 8
  %94 = xor i64 %90, %93
  %95 = getelementptr inbounds i64, i64* %1, i64 2
  %96 = load i64, i64* %95, align 8
  %97 = xor i64 %96, %94
  store i64 %97, i64* %95, align 8
  call void @rho(i64* %1)
  %98 = load i64, i64* %4, align 8
  %99 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 4
  %100 = load i64, i64* %99, align 8
  %101 = shl i64 %100, 16
  %102 = xor i64 %98, %101
  %103 = load i64, i64* %1, align 8
  %104 = xor i64 %103, %102
  store i64 %104, i64* %1, align 8
  %105 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %106 = getelementptr inbounds [3 x i64], [3 x i64]* %105, i64 0, i64 1
  %107 = load i64, i64* %106, align 8
  %108 = getelementptr inbounds i64, i64* %1, i64 1
  %109 = load i64, i64* %108, align 8
  %110 = xor i64 %109, %107
  store i64 %110, i64* %108, align 8
  %111 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %112 = getelementptr inbounds [3 x i64], [3 x i64]* %111, i64 0, i64 2
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %115 = getelementptr inbounds [12 x i64], [12 x i64]* %114, i64 0, i64 4
  %116 = load i64, i64* %115, align 8
  %117 = xor i64 %113, %116
  %118 = getelementptr inbounds i64, i64* %1, i64 2
  %119 = load i64, i64* %118, align 8
  %120 = xor i64 %119, %117
  store i64 %120, i64* %118, align 8
  call void @rho(i64* %1)
  %121 = load i64, i64* %4, align 8
  %122 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 5
  %123 = load i64, i64* %122, align 8
  %124 = shl i64 %123, 16
  %125 = xor i64 %121, %124
  %126 = load i64, i64* %1, align 8
  %127 = xor i64 %126, %125
  store i64 %127, i64* %1, align 8
  %128 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %129 = getelementptr inbounds [3 x i64], [3 x i64]* %128, i64 0, i64 1
  %130 = load i64, i64* %129, align 8
  %131 = getelementptr inbounds i64, i64* %1, i64 1
  %132 = load i64, i64* %131, align 8
  %133 = xor i64 %132, %130
  store i64 %133, i64* %131, align 8
  %134 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %135 = getelementptr inbounds [3 x i64], [3 x i64]* %134, i64 0, i64 2
  %136 = load i64, i64* %135, align 8
  %137 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %138 = getelementptr inbounds [12 x i64], [12 x i64]* %137, i64 0, i64 5
  %139 = load i64, i64* %138, align 8
  %140 = xor i64 %136, %139
  %141 = getelementptr inbounds i64, i64* %1, i64 2
  %142 = load i64, i64* %141, align 8
  %143 = xor i64 %142, %140
  store i64 %143, i64* %141, align 8
  call void @rho(i64* %1)
  %144 = load i64, i64* %4, align 8
  %145 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 6
  %146 = load i64, i64* %145, align 8
  %147 = shl i64 %146, 16
  %148 = xor i64 %144, %147
  %149 = load i64, i64* %1, align 8
  %150 = xor i64 %149, %148
  store i64 %150, i64* %1, align 8
  %151 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %152 = getelementptr inbounds [3 x i64], [3 x i64]* %151, i64 0, i64 1
  %153 = load i64, i64* %152, align 8
  %154 = getelementptr inbounds i64, i64* %1, i64 1
  %155 = load i64, i64* %154, align 8
  %156 = xor i64 %155, %153
  store i64 %156, i64* %154, align 8
  %157 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %158 = getelementptr inbounds [3 x i64], [3 x i64]* %157, i64 0, i64 2
  %159 = load i64, i64* %158, align 8
  %160 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %161 = getelementptr inbounds [12 x i64], [12 x i64]* %160, i64 0, i64 6
  %162 = load i64, i64* %161, align 8
  %163 = xor i64 %159, %162
  %164 = getelementptr inbounds i64, i64* %1, i64 2
  %165 = load i64, i64* %164, align 8
  %166 = xor i64 %165, %163
  store i64 %166, i64* %164, align 8
  call void @rho(i64* %1)
  %167 = load i64, i64* %4, align 8
  %168 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 7
  %169 = load i64, i64* %168, align 8
  %170 = shl i64 %169, 16
  %171 = xor i64 %167, %170
  %172 = load i64, i64* %1, align 8
  %173 = xor i64 %172, %171
  store i64 %173, i64* %1, align 8
  %174 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %175 = getelementptr inbounds [3 x i64], [3 x i64]* %174, i64 0, i64 1
  %176 = load i64, i64* %175, align 8
  %177 = getelementptr inbounds i64, i64* %1, i64 1
  %178 = load i64, i64* %177, align 8
  %179 = xor i64 %178, %176
  store i64 %179, i64* %177, align 8
  %180 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %181 = getelementptr inbounds [3 x i64], [3 x i64]* %180, i64 0, i64 2
  %182 = load i64, i64* %181, align 8
  %183 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %184 = getelementptr inbounds [12 x i64], [12 x i64]* %183, i64 0, i64 7
  %185 = load i64, i64* %184, align 8
  %186 = xor i64 %182, %185
  %187 = getelementptr inbounds i64, i64* %1, i64 2
  %188 = load i64, i64* %187, align 8
  %189 = xor i64 %188, %186
  store i64 %189, i64* %187, align 8
  call void @rho(i64* %1)
  %190 = load i64, i64* %4, align 8
  %191 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 8
  %192 = load i64, i64* %191, align 8
  %193 = shl i64 %192, 16
  %194 = xor i64 %190, %193
  %195 = load i64, i64* %1, align 8
  %196 = xor i64 %195, %194
  store i64 %196, i64* %1, align 8
  %197 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %198 = getelementptr inbounds [3 x i64], [3 x i64]* %197, i64 0, i64 1
  %199 = load i64, i64* %198, align 8
  %200 = getelementptr inbounds i64, i64* %1, i64 1
  %201 = load i64, i64* %200, align 8
  %202 = xor i64 %201, %199
  store i64 %202, i64* %200, align 8
  %203 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %204 = getelementptr inbounds [3 x i64], [3 x i64]* %203, i64 0, i64 2
  %205 = load i64, i64* %204, align 8
  %206 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %207 = getelementptr inbounds [12 x i64], [12 x i64]* %206, i64 0, i64 8
  %208 = load i64, i64* %207, align 8
  %209 = xor i64 %205, %208
  %210 = getelementptr inbounds i64, i64* %1, i64 2
  %211 = load i64, i64* %210, align 8
  %212 = xor i64 %211, %209
  store i64 %212, i64* %210, align 8
  call void @rho(i64* %1)
  %213 = load i64, i64* %4, align 8
  %214 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 9
  %215 = load i64, i64* %214, align 8
  %216 = shl i64 %215, 16
  %217 = xor i64 %213, %216
  %218 = load i64, i64* %1, align 8
  %219 = xor i64 %218, %217
  store i64 %219, i64* %1, align 8
  %220 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %221 = getelementptr inbounds [3 x i64], [3 x i64]* %220, i64 0, i64 1
  %222 = load i64, i64* %221, align 8
  %223 = getelementptr inbounds i64, i64* %1, i64 1
  %224 = load i64, i64* %223, align 8
  %225 = xor i64 %224, %222
  store i64 %225, i64* %223, align 8
  %226 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %227 = getelementptr inbounds [3 x i64], [3 x i64]* %226, i64 0, i64 2
  %228 = load i64, i64* %227, align 8
  %229 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %230 = getelementptr inbounds [12 x i64], [12 x i64]* %229, i64 0, i64 9
  %231 = load i64, i64* %230, align 8
  %232 = xor i64 %228, %231
  %233 = getelementptr inbounds i64, i64* %1, i64 2
  %234 = load i64, i64* %233, align 8
  %235 = xor i64 %234, %232
  store i64 %235, i64* %233, align 8
  call void @rho(i64* %1)
  %236 = load i64, i64* %4, align 8
  %237 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 10
  %238 = load i64, i64* %237, align 8
  %239 = shl i64 %238, 16
  %240 = xor i64 %236, %239
  %241 = load i64, i64* %1, align 8
  %242 = xor i64 %241, %240
  store i64 %242, i64* %1, align 8
  %243 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %244 = getelementptr inbounds [3 x i64], [3 x i64]* %243, i64 0, i64 1
  %245 = load i64, i64* %244, align 8
  %246 = getelementptr inbounds i64, i64* %1, i64 1
  %247 = load i64, i64* %246, align 8
  %248 = xor i64 %247, %245
  store i64 %248, i64* %246, align 8
  %249 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %250 = getelementptr inbounds [3 x i64], [3 x i64]* %249, i64 0, i64 2
  %251 = load i64, i64* %250, align 8
  %252 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %253 = getelementptr inbounds [12 x i64], [12 x i64]* %252, i64 0, i64 10
  %254 = load i64, i64* %253, align 8
  %255 = xor i64 %251, %254
  %256 = getelementptr inbounds i64, i64* %1, i64 2
  %257 = load i64, i64* %256, align 8
  %258 = xor i64 %257, %255
  store i64 %258, i64* %256, align 8
  call void @rho(i64* %1)
  %259 = load i64, i64* %4, align 8
  %260 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 11
  %261 = load i64, i64* %260, align 8
  %262 = shl i64 %261, 16
  %263 = xor i64 %259, %262
  %264 = load i64, i64* %1, align 8
  %265 = xor i64 %264, %263
  store i64 %265, i64* %1, align 8
  %266 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %267 = getelementptr inbounds [3 x i64], [3 x i64]* %266, i64 0, i64 1
  %268 = load i64, i64* %267, align 8
  %269 = getelementptr inbounds i64, i64* %1, i64 1
  %270 = load i64, i64* %269, align 8
  %271 = xor i64 %270, %268
  store i64 %271, i64* %269, align 8
  %272 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %273 = getelementptr inbounds [3 x i64], [3 x i64]* %272, i64 0, i64 2
  %274 = load i64, i64* %273, align 8
  %275 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %276 = getelementptr inbounds [12 x i64], [12 x i64]* %275, i64 0, i64 11
  %277 = load i64, i64* %276, align 8
  %278 = xor i64 %274, %277
  %279 = getelementptr inbounds i64, i64* %1, i64 2
  %280 = load i64, i64* %279, align 8
  %281 = xor i64 %280, %278
  store i64 %281, i64* %279, align 8
  call void @theta(i64* %1)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @decrypt(%struct.twy_ctx* %0, i64* %1) #0 {
  call void @mu(i64* %1)
  %3 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %4 = getelementptr inbounds [3 x i64], [3 x i64]* %3, i64 0, i64 0
  %5 = load i64, i64* %4, align 8
  %6 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %7 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 0
  %8 = load i64, i64* %7, align 8
  %9 = shl i64 %8, 16
  %10 = xor i64 %5, %9
  %11 = load i64, i64* %1, align 8
  %12 = xor i64 %11, %10
  store i64 %12, i64* %1, align 8
  %13 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %14 = getelementptr inbounds [3 x i64], [3 x i64]* %13, i64 0, i64 1
  %15 = load i64, i64* %14, align 8
  %16 = getelementptr inbounds i64, i64* %1, i64 1
  %17 = load i64, i64* %16, align 8
  %18 = xor i64 %17, %15
  store i64 %18, i64* %16, align 8
  %19 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %20 = getelementptr inbounds [3 x i64], [3 x i64]* %19, i64 0, i64 2
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %23 = getelementptr inbounds [12 x i64], [12 x i64]* %22, i64 0, i64 0
  %24 = load i64, i64* %23, align 8
  %25 = xor i64 %21, %24
  %26 = getelementptr inbounds i64, i64* %1, i64 2
  %27 = load i64, i64* %26, align 8
  %28 = xor i64 %27, %25
  store i64 %28, i64* %26, align 8
  call void @rho(i64* %1)
  %29 = load i64, i64* %4, align 8
  %30 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 1
  %31 = load i64, i64* %30, align 8
  %32 = shl i64 %31, 16
  %33 = xor i64 %29, %32
  %34 = load i64, i64* %1, align 8
  %35 = xor i64 %34, %33
  store i64 %35, i64* %1, align 8
  %36 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %37 = getelementptr inbounds [3 x i64], [3 x i64]* %36, i64 0, i64 1
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds i64, i64* %1, i64 1
  %40 = load i64, i64* %39, align 8
  %41 = xor i64 %40, %38
  store i64 %41, i64* %39, align 8
  %42 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %43 = getelementptr inbounds [3 x i64], [3 x i64]* %42, i64 0, i64 2
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %46 = getelementptr inbounds [12 x i64], [12 x i64]* %45, i64 0, i64 1
  %47 = load i64, i64* %46, align 8
  %48 = xor i64 %44, %47
  %49 = getelementptr inbounds i64, i64* %1, i64 2
  %50 = load i64, i64* %49, align 8
  %51 = xor i64 %50, %48
  store i64 %51, i64* %49, align 8
  call void @rho(i64* %1)
  %52 = load i64, i64* %4, align 8
  %53 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 2
  %54 = load i64, i64* %53, align 8
  %55 = shl i64 %54, 16
  %56 = xor i64 %52, %55
  %57 = load i64, i64* %1, align 8
  %58 = xor i64 %57, %56
  store i64 %58, i64* %1, align 8
  %59 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %60 = getelementptr inbounds [3 x i64], [3 x i64]* %59, i64 0, i64 1
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds i64, i64* %1, i64 1
  %63 = load i64, i64* %62, align 8
  %64 = xor i64 %63, %61
  store i64 %64, i64* %62, align 8
  %65 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %66 = getelementptr inbounds [3 x i64], [3 x i64]* %65, i64 0, i64 2
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %69 = getelementptr inbounds [12 x i64], [12 x i64]* %68, i64 0, i64 2
  %70 = load i64, i64* %69, align 8
  %71 = xor i64 %67, %70
  %72 = getelementptr inbounds i64, i64* %1, i64 2
  %73 = load i64, i64* %72, align 8
  %74 = xor i64 %73, %71
  store i64 %74, i64* %72, align 8
  call void @rho(i64* %1)
  %75 = load i64, i64* %4, align 8
  %76 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 3
  %77 = load i64, i64* %76, align 8
  %78 = shl i64 %77, 16
  %79 = xor i64 %75, %78
  %80 = load i64, i64* %1, align 8
  %81 = xor i64 %80, %79
  store i64 %81, i64* %1, align 8
  %82 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %83 = getelementptr inbounds [3 x i64], [3 x i64]* %82, i64 0, i64 1
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds i64, i64* %1, i64 1
  %86 = load i64, i64* %85, align 8
  %87 = xor i64 %86, %84
  store i64 %87, i64* %85, align 8
  %88 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %89 = getelementptr inbounds [3 x i64], [3 x i64]* %88, i64 0, i64 2
  %90 = load i64, i64* %89, align 8
  %91 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %92 = getelementptr inbounds [12 x i64], [12 x i64]* %91, i64 0, i64 3
  %93 = load i64, i64* %92, align 8
  %94 = xor i64 %90, %93
  %95 = getelementptr inbounds i64, i64* %1, i64 2
  %96 = load i64, i64* %95, align 8
  %97 = xor i64 %96, %94
  store i64 %97, i64* %95, align 8
  call void @rho(i64* %1)
  %98 = load i64, i64* %4, align 8
  %99 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 4
  %100 = load i64, i64* %99, align 8
  %101 = shl i64 %100, 16
  %102 = xor i64 %98, %101
  %103 = load i64, i64* %1, align 8
  %104 = xor i64 %103, %102
  store i64 %104, i64* %1, align 8
  %105 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %106 = getelementptr inbounds [3 x i64], [3 x i64]* %105, i64 0, i64 1
  %107 = load i64, i64* %106, align 8
  %108 = getelementptr inbounds i64, i64* %1, i64 1
  %109 = load i64, i64* %108, align 8
  %110 = xor i64 %109, %107
  store i64 %110, i64* %108, align 8
  %111 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %112 = getelementptr inbounds [3 x i64], [3 x i64]* %111, i64 0, i64 2
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %115 = getelementptr inbounds [12 x i64], [12 x i64]* %114, i64 0, i64 4
  %116 = load i64, i64* %115, align 8
  %117 = xor i64 %113, %116
  %118 = getelementptr inbounds i64, i64* %1, i64 2
  %119 = load i64, i64* %118, align 8
  %120 = xor i64 %119, %117
  store i64 %120, i64* %118, align 8
  call void @rho(i64* %1)
  %121 = load i64, i64* %4, align 8
  %122 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 5
  %123 = load i64, i64* %122, align 8
  %124 = shl i64 %123, 16
  %125 = xor i64 %121, %124
  %126 = load i64, i64* %1, align 8
  %127 = xor i64 %126, %125
  store i64 %127, i64* %1, align 8
  %128 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %129 = getelementptr inbounds [3 x i64], [3 x i64]* %128, i64 0, i64 1
  %130 = load i64, i64* %129, align 8
  %131 = getelementptr inbounds i64, i64* %1, i64 1
  %132 = load i64, i64* %131, align 8
  %133 = xor i64 %132, %130
  store i64 %133, i64* %131, align 8
  %134 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %135 = getelementptr inbounds [3 x i64], [3 x i64]* %134, i64 0, i64 2
  %136 = load i64, i64* %135, align 8
  %137 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %138 = getelementptr inbounds [12 x i64], [12 x i64]* %137, i64 0, i64 5
  %139 = load i64, i64* %138, align 8
  %140 = xor i64 %136, %139
  %141 = getelementptr inbounds i64, i64* %1, i64 2
  %142 = load i64, i64* %141, align 8
  %143 = xor i64 %142, %140
  store i64 %143, i64* %141, align 8
  call void @rho(i64* %1)
  %144 = load i64, i64* %4, align 8
  %145 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 6
  %146 = load i64, i64* %145, align 8
  %147 = shl i64 %146, 16
  %148 = xor i64 %144, %147
  %149 = load i64, i64* %1, align 8
  %150 = xor i64 %149, %148
  store i64 %150, i64* %1, align 8
  %151 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %152 = getelementptr inbounds [3 x i64], [3 x i64]* %151, i64 0, i64 1
  %153 = load i64, i64* %152, align 8
  %154 = getelementptr inbounds i64, i64* %1, i64 1
  %155 = load i64, i64* %154, align 8
  %156 = xor i64 %155, %153
  store i64 %156, i64* %154, align 8
  %157 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %158 = getelementptr inbounds [3 x i64], [3 x i64]* %157, i64 0, i64 2
  %159 = load i64, i64* %158, align 8
  %160 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %161 = getelementptr inbounds [12 x i64], [12 x i64]* %160, i64 0, i64 6
  %162 = load i64, i64* %161, align 8
  %163 = xor i64 %159, %162
  %164 = getelementptr inbounds i64, i64* %1, i64 2
  %165 = load i64, i64* %164, align 8
  %166 = xor i64 %165, %163
  store i64 %166, i64* %164, align 8
  call void @rho(i64* %1)
  %167 = load i64, i64* %4, align 8
  %168 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 7
  %169 = load i64, i64* %168, align 8
  %170 = shl i64 %169, 16
  %171 = xor i64 %167, %170
  %172 = load i64, i64* %1, align 8
  %173 = xor i64 %172, %171
  store i64 %173, i64* %1, align 8
  %174 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %175 = getelementptr inbounds [3 x i64], [3 x i64]* %174, i64 0, i64 1
  %176 = load i64, i64* %175, align 8
  %177 = getelementptr inbounds i64, i64* %1, i64 1
  %178 = load i64, i64* %177, align 8
  %179 = xor i64 %178, %176
  store i64 %179, i64* %177, align 8
  %180 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %181 = getelementptr inbounds [3 x i64], [3 x i64]* %180, i64 0, i64 2
  %182 = load i64, i64* %181, align 8
  %183 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %184 = getelementptr inbounds [12 x i64], [12 x i64]* %183, i64 0, i64 7
  %185 = load i64, i64* %184, align 8
  %186 = xor i64 %182, %185
  %187 = getelementptr inbounds i64, i64* %1, i64 2
  %188 = load i64, i64* %187, align 8
  %189 = xor i64 %188, %186
  store i64 %189, i64* %187, align 8
  call void @rho(i64* %1)
  %190 = load i64, i64* %4, align 8
  %191 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 8
  %192 = load i64, i64* %191, align 8
  %193 = shl i64 %192, 16
  %194 = xor i64 %190, %193
  %195 = load i64, i64* %1, align 8
  %196 = xor i64 %195, %194
  store i64 %196, i64* %1, align 8
  %197 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %198 = getelementptr inbounds [3 x i64], [3 x i64]* %197, i64 0, i64 1
  %199 = load i64, i64* %198, align 8
  %200 = getelementptr inbounds i64, i64* %1, i64 1
  %201 = load i64, i64* %200, align 8
  %202 = xor i64 %201, %199
  store i64 %202, i64* %200, align 8
  %203 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %204 = getelementptr inbounds [3 x i64], [3 x i64]* %203, i64 0, i64 2
  %205 = load i64, i64* %204, align 8
  %206 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %207 = getelementptr inbounds [12 x i64], [12 x i64]* %206, i64 0, i64 8
  %208 = load i64, i64* %207, align 8
  %209 = xor i64 %205, %208
  %210 = getelementptr inbounds i64, i64* %1, i64 2
  %211 = load i64, i64* %210, align 8
  %212 = xor i64 %211, %209
  store i64 %212, i64* %210, align 8
  call void @rho(i64* %1)
  %213 = load i64, i64* %4, align 8
  %214 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 9
  %215 = load i64, i64* %214, align 8
  %216 = shl i64 %215, 16
  %217 = xor i64 %213, %216
  %218 = load i64, i64* %1, align 8
  %219 = xor i64 %218, %217
  store i64 %219, i64* %1, align 8
  %220 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %221 = getelementptr inbounds [3 x i64], [3 x i64]* %220, i64 0, i64 1
  %222 = load i64, i64* %221, align 8
  %223 = getelementptr inbounds i64, i64* %1, i64 1
  %224 = load i64, i64* %223, align 8
  %225 = xor i64 %224, %222
  store i64 %225, i64* %223, align 8
  %226 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %227 = getelementptr inbounds [3 x i64], [3 x i64]* %226, i64 0, i64 2
  %228 = load i64, i64* %227, align 8
  %229 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %230 = getelementptr inbounds [12 x i64], [12 x i64]* %229, i64 0, i64 9
  %231 = load i64, i64* %230, align 8
  %232 = xor i64 %228, %231
  %233 = getelementptr inbounds i64, i64* %1, i64 2
  %234 = load i64, i64* %233, align 8
  %235 = xor i64 %234, %232
  store i64 %235, i64* %233, align 8
  call void @rho(i64* %1)
  %236 = load i64, i64* %4, align 8
  %237 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 10
  %238 = load i64, i64* %237, align 8
  %239 = shl i64 %238, 16
  %240 = xor i64 %236, %239
  %241 = load i64, i64* %1, align 8
  %242 = xor i64 %241, %240
  store i64 %242, i64* %1, align 8
  %243 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %244 = getelementptr inbounds [3 x i64], [3 x i64]* %243, i64 0, i64 1
  %245 = load i64, i64* %244, align 8
  %246 = getelementptr inbounds i64, i64* %1, i64 1
  %247 = load i64, i64* %246, align 8
  %248 = xor i64 %247, %245
  store i64 %248, i64* %246, align 8
  %249 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %250 = getelementptr inbounds [3 x i64], [3 x i64]* %249, i64 0, i64 2
  %251 = load i64, i64* %250, align 8
  %252 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %253 = getelementptr inbounds [12 x i64], [12 x i64]* %252, i64 0, i64 10
  %254 = load i64, i64* %253, align 8
  %255 = xor i64 %251, %254
  %256 = getelementptr inbounds i64, i64* %1, i64 2
  %257 = load i64, i64* %256, align 8
  %258 = xor i64 %257, %255
  store i64 %258, i64* %256, align 8
  call void @rho(i64* %1)
  %259 = load i64, i64* %4, align 8
  %260 = getelementptr inbounds [12 x i64], [12 x i64]* %6, i64 0, i64 11
  %261 = load i64, i64* %260, align 8
  %262 = shl i64 %261, 16
  %263 = xor i64 %259, %262
  %264 = load i64, i64* %1, align 8
  %265 = xor i64 %264, %263
  store i64 %265, i64* %1, align 8
  %266 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %267 = getelementptr inbounds [3 x i64], [3 x i64]* %266, i64 0, i64 1
  %268 = load i64, i64* %267, align 8
  %269 = getelementptr inbounds i64, i64* %1, i64 1
  %270 = load i64, i64* %269, align 8
  %271 = xor i64 %270, %268
  store i64 %271, i64* %269, align 8
  %272 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %273 = getelementptr inbounds [3 x i64], [3 x i64]* %272, i64 0, i64 2
  %274 = load i64, i64* %273, align 8
  %275 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %276 = getelementptr inbounds [12 x i64], [12 x i64]* %275, i64 0, i64 11
  %277 = load i64, i64* %276, align 8
  %278 = xor i64 %274, %277
  %279 = getelementptr inbounds i64, i64* %1, i64 2
  %280 = load i64, i64* %279, align 8
  %281 = xor i64 %280, %278
  store i64 %281, i64* %279, align 8
  call void @theta(i64* %1)
  call void @mu(i64* %1)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @twy_key(%struct.twy_ctx* %0, i64* %1) #0 {
  %3 = getelementptr inbounds i64, i64* %1, i64 0
  %4 = load i64, i64* %3, align 8
  %5 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %6 = getelementptr inbounds [3 x i64], [3 x i64]* %5, i64 0, i64 0
  store i64 %4, i64* %6, align 8
  %7 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %8 = getelementptr inbounds [3 x i64], [3 x i64]* %7, i64 0, i64 0
  store i64 %4, i64* %8, align 8
  %9 = getelementptr inbounds i64, i64* %1, i64 1
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %12 = getelementptr inbounds [3 x i64], [3 x i64]* %11, i64 0, i64 1
  store i64 %10, i64* %12, align 8
  %13 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %14 = getelementptr inbounds [3 x i64], [3 x i64]* %13, i64 0, i64 1
  store i64 %10, i64* %14, align 8
  %15 = getelementptr inbounds i64, i64* %1, i64 2
  %16 = load i64, i64* %15, align 8
  %17 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %18 = getelementptr inbounds [3 x i64], [3 x i64]* %17, i64 0, i64 2
  store i64 %16, i64* %18, align 8
  %19 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %20 = getelementptr inbounds [3 x i64], [3 x i64]* %19, i64 0, i64 2
  store i64 %16, i64* %20, align 8
  %21 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %22 = getelementptr inbounds [3 x i64], [3 x i64]* %21, i64 0, i64 0
  call void @theta(i64* %22)
  %23 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %24 = getelementptr inbounds [3 x i64], [3 x i64]* %23, i64 0, i64 0
  call void @mu(i64* %24)
  %25 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 2
  %26 = getelementptr inbounds [12 x i64], [12 x i64]* %25, i64 0, i64 0
  call void @rndcon_gen(i64 2827, i64* %26)
  %27 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 3
  %28 = getelementptr inbounds [12 x i64], [12 x i64]* %27, i64 0, i64 0
  call void @rndcon_gen(i64 45489, i64* %28)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @twy_enc(%struct.twy_ctx* %0, i64* %1, i32 %2) #0 {
  %4 = icmp slt i32 0, %2
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  call void @encrypt(%struct.twy_ctx* %0, i64* %1)
  %6 = getelementptr inbounds i64, i64* %1, i64 3
  br label %7

7:                                                ; preds = %5, %3
  %.1 = phi i64* [ %6, %5 ], [ %1, %3 ]
  %8 = icmp slt i32 1, %2
  br i1 %8, label %9, label %11

9:                                                ; preds = %7
  call void @encrypt(%struct.twy_ctx* %0, i64* %.1)
  %10 = getelementptr inbounds i64, i64* %.1, i64 3
  br label %11

11:                                               ; preds = %9, %7
  %.1.1 = phi i64* [ %10, %9 ], [ %.1, %7 ]
  %12 = icmp slt i32 2, %2
  br i1 %12, label %13, label %15

13:                                               ; preds = %11
  call void @encrypt(%struct.twy_ctx* %0, i64* %.1.1)
  %14 = getelementptr inbounds i64, i64* %.1.1, i64 3
  br label %15

15:                                               ; preds = %13, %11
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @twy_dec(%struct.twy_ctx* %0, i64* %1, i32 %2) #0 {
  %4 = icmp slt i32 0, %2
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  call void @decrypt(%struct.twy_ctx* %0, i64* %1)
  %6 = getelementptr inbounds i64, i64* %1, i64 3
  br label %7

7:                                                ; preds = %5, %3
  %.1 = phi i64* [ %6, %5 ], [ %1, %3 ]
  %8 = icmp slt i32 1, %2
  br i1 %8, label %9, label %11

9:                                                ; preds = %7
  call void @decrypt(%struct.twy_ctx* %0, i64* %.1)
  %10 = getelementptr inbounds i64, i64* %.1, i64 3
  br label %11

11:                                               ; preds = %9, %7
  %.1.1 = phi i64* [ %10, %9 ], [ %.1, %7 ]
  %12 = icmp slt i32 2, %2
  br i1 %12, label %13, label %15

13:                                               ; preds = %11
  call void @decrypt(%struct.twy_ctx* %0, i64* %.1.1)
  %14 = getelementptr inbounds i64, i64* %.1.1, i64 3
  br label %15

15:                                               ; preds = %13, %11
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @twy_destroy(%struct.twy_ctx* %0) #0 {
  %2 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %3 = getelementptr inbounds [3 x i64], [3 x i64]* %2, i64 0, i64 0
  store i64 0, i64* %3, align 8
  %4 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %5 = getelementptr inbounds [3 x i64], [3 x i64]* %4, i64 0, i64 0
  store i64 0, i64* %5, align 8
  %6 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %7 = getelementptr inbounds [3 x i64], [3 x i64]* %6, i64 0, i64 1
  store i64 0, i64* %7, align 8
  %8 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %9 = getelementptr inbounds [3 x i64], [3 x i64]* %8, i64 0, i64 1
  store i64 0, i64* %9, align 8
  %10 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 1
  %11 = getelementptr inbounds [3 x i64], [3 x i64]* %10, i64 0, i64 2
  store i64 0, i64* %11, align 8
  %12 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i32 0, i32 0
  %13 = getelementptr inbounds [3 x i64], [3 x i64]* %12, i64 0, i64 2
  store i64 0, i64* %13, align 8
  ret void
}

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}

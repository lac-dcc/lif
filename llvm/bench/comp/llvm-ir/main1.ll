; ModuleID = 'comp/llvm-ir/main1.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [32 x i32], align 16
  %2 = alloca [32 x i32], align 16
  br label %3

3:                                                ; preds = %0
  %4 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 0
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 0
  store i32 0, i32* %5, align 4
  %6 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 1
  store i32 1, i32* %6, align 4
  %7 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 1
  store i32 1, i32* %7, align 4
  %8 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 2
  store i32 2, i32* %8, align 4
  %9 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 2
  store i32 2, i32* %9, align 4
  %10 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 3
  store i32 3, i32* %10, align 4
  %11 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 3
  store i32 3, i32* %11, align 4
  %12 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 4
  store i32 4, i32* %12, align 4
  %13 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 4
  store i32 4, i32* %13, align 4
  %14 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 5
  store i32 5, i32* %14, align 4
  %15 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 5
  store i32 5, i32* %15, align 4
  %16 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 6
  store i32 6, i32* %16, align 4
  %17 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 6
  store i32 6, i32* %17, align 4
  %18 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 7
  store i32 7, i32* %18, align 4
  %19 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 7
  store i32 7, i32* %19, align 4
  %20 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 8
  store i32 8, i32* %20, align 4
  %21 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 8
  store i32 8, i32* %21, align 4
  %22 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 9
  store i32 9, i32* %22, align 4
  %23 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 9
  store i32 9, i32* %23, align 4
  %24 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 10
  store i32 10, i32* %24, align 4
  %25 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 10
  store i32 10, i32* %25, align 4
  %26 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 11
  store i32 11, i32* %26, align 4
  %27 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 11
  store i32 11, i32* %27, align 4
  %28 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 12
  store i32 12, i32* %28, align 4
  %29 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 12
  store i32 12, i32* %29, align 4
  %30 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 13
  store i32 13, i32* %30, align 4
  %31 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 13
  store i32 13, i32* %31, align 4
  %32 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 14
  store i32 14, i32* %32, align 4
  %33 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 14
  store i32 14, i32* %33, align 4
  %34 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 15
  store i32 15, i32* %34, align 4
  %35 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 15
  store i32 15, i32* %35, align 4
  %36 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 16
  store i32 16, i32* %36, align 4
  %37 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 16
  store i32 16, i32* %37, align 4
  %38 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 17
  store i32 17, i32* %38, align 4
  %39 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 17
  store i32 17, i32* %39, align 4
  %40 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 18
  store i32 18, i32* %40, align 4
  %41 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 18
  store i32 18, i32* %41, align 4
  %42 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 19
  store i32 19, i32* %42, align 4
  %43 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 19
  store i32 19, i32* %43, align 4
  %44 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 20
  store i32 20, i32* %44, align 4
  %45 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 20
  store i32 20, i32* %45, align 4
  %46 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 21
  store i32 21, i32* %46, align 4
  %47 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 21
  store i32 21, i32* %47, align 4
  %48 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 22
  store i32 22, i32* %48, align 4
  %49 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 22
  store i32 22, i32* %49, align 4
  %50 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 23
  store i32 23, i32* %50, align 4
  %51 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 23
  store i32 23, i32* %51, align 4
  %52 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 24
  store i32 24, i32* %52, align 4
  %53 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 24
  store i32 24, i32* %53, align 4
  %54 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 25
  store i32 25, i32* %54, align 4
  %55 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 25
  store i32 25, i32* %55, align 4
  %56 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 26
  store i32 26, i32* %56, align 4
  %57 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 26
  store i32 26, i32* %57, align 4
  %58 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 27
  store i32 27, i32* %58, align 4
  %59 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 27
  store i32 27, i32* %59, align 4
  %60 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 28
  store i32 28, i32* %60, align 4
  %61 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 28
  store i32 28, i32* %61, align 4
  %62 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 29
  store i32 29, i32* %62, align 4
  %63 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 29
  store i32 29, i32* %63, align 4
  %64 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 30
  store i32 30, i32* %64, align 4
  %65 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 30
  store i32 30, i32* %65, align 4
  %66 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 31
  store i32 31, i32* %66, align 4
  %67 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 31
  store i32 31, i32* %67, align 4
  %68 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 0
  %69 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 0
  %70 = call i32 @comp(i32* %68, i32* %69)
  %71 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %70)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @comp(i32* %0, i32* %1) #0 {
  br label %9

3:                                                ; preds = %9
  %4 = getelementptr inbounds i32, i32* %0, i64 1
  %5 = load i32, i32* %4, align 4
  %6 = getelementptr inbounds i32, i32* %1, i64 1
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %5, %7
  br i1 %8, label %13, label %14

9:                                                ; preds = %2
  %10 = load i32, i32* %0, align 4
  %11 = load i32, i32* %1, align 4
  %12 = icmp ne i32 %10, %11
  br i1 %12, label %13, label %3

13:                                               ; preds = %194, %188, %182, %176, %170, %164, %158, %152, %146, %140, %134, %128, %122, %116, %110, %104, %98, %92, %86, %80, %74, %68, %62, %56, %50, %44, %38, %32, %26, %20, %14, %3, %9
  %.0 = phi i32 [ 0, %9 ], [ 0, %3 ], [ 0, %14 ], [ 0, %20 ], [ 0, %26 ], [ 0, %32 ], [ 0, %38 ], [ 0, %44 ], [ 0, %50 ], [ 0, %56 ], [ 0, %62 ], [ 0, %68 ], [ 0, %74 ], [ 0, %80 ], [ 0, %86 ], [ 0, %92 ], [ 0, %98 ], [ 0, %104 ], [ 0, %110 ], [ 0, %116 ], [ 0, %122 ], [ 0, %128 ], [ 0, %134 ], [ 0, %140 ], [ 0, %146 ], [ 0, %152 ], [ 0, %158 ], [ 0, %164 ], [ 0, %170 ], [ 0, %176 ], [ 0, %182 ], [ 0, %188 ], [ 1, %194 ]
  ret i32 %.0

14:                                               ; preds = %3
  %15 = getelementptr inbounds i32, i32* %0, i64 2
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds i32, i32* %1, i64 2
  %18 = load i32, i32* %17, align 4
  %19 = icmp ne i32 %16, %18
  br i1 %19, label %13, label %20

20:                                               ; preds = %14
  %21 = getelementptr inbounds i32, i32* %0, i64 3
  %22 = load i32, i32* %21, align 4
  %23 = getelementptr inbounds i32, i32* %1, i64 3
  %24 = load i32, i32* %23, align 4
  %25 = icmp ne i32 %22, %24
  br i1 %25, label %13, label %26

26:                                               ; preds = %20
  %27 = getelementptr inbounds i32, i32* %0, i64 4
  %28 = load i32, i32* %27, align 4
  %29 = getelementptr inbounds i32, i32* %1, i64 4
  %30 = load i32, i32* %29, align 4
  %31 = icmp ne i32 %28, %30
  br i1 %31, label %13, label %32

32:                                               ; preds = %26
  %33 = getelementptr inbounds i32, i32* %0, i64 5
  %34 = load i32, i32* %33, align 4
  %35 = getelementptr inbounds i32, i32* %1, i64 5
  %36 = load i32, i32* %35, align 4
  %37 = icmp ne i32 %34, %36
  br i1 %37, label %13, label %38

38:                                               ; preds = %32
  %39 = getelementptr inbounds i32, i32* %0, i64 6
  %40 = load i32, i32* %39, align 4
  %41 = getelementptr inbounds i32, i32* %1, i64 6
  %42 = load i32, i32* %41, align 4
  %43 = icmp ne i32 %40, %42
  br i1 %43, label %13, label %44

44:                                               ; preds = %38
  %45 = getelementptr inbounds i32, i32* %0, i64 7
  %46 = load i32, i32* %45, align 4
  %47 = getelementptr inbounds i32, i32* %1, i64 7
  %48 = load i32, i32* %47, align 4
  %49 = icmp ne i32 %46, %48
  br i1 %49, label %13, label %50

50:                                               ; preds = %44
  %51 = getelementptr inbounds i32, i32* %0, i64 8
  %52 = load i32, i32* %51, align 4
  %53 = getelementptr inbounds i32, i32* %1, i64 8
  %54 = load i32, i32* %53, align 4
  %55 = icmp ne i32 %52, %54
  br i1 %55, label %13, label %56

56:                                               ; preds = %50
  %57 = getelementptr inbounds i32, i32* %0, i64 9
  %58 = load i32, i32* %57, align 4
  %59 = getelementptr inbounds i32, i32* %1, i64 9
  %60 = load i32, i32* %59, align 4
  %61 = icmp ne i32 %58, %60
  br i1 %61, label %13, label %62

62:                                               ; preds = %56
  %63 = getelementptr inbounds i32, i32* %0, i64 10
  %64 = load i32, i32* %63, align 4
  %65 = getelementptr inbounds i32, i32* %1, i64 10
  %66 = load i32, i32* %65, align 4
  %67 = icmp ne i32 %64, %66
  br i1 %67, label %13, label %68

68:                                               ; preds = %62
  %69 = getelementptr inbounds i32, i32* %0, i64 11
  %70 = load i32, i32* %69, align 4
  %71 = getelementptr inbounds i32, i32* %1, i64 11
  %72 = load i32, i32* %71, align 4
  %73 = icmp ne i32 %70, %72
  br i1 %73, label %13, label %74

74:                                               ; preds = %68
  %75 = getelementptr inbounds i32, i32* %0, i64 12
  %76 = load i32, i32* %75, align 4
  %77 = getelementptr inbounds i32, i32* %1, i64 12
  %78 = load i32, i32* %77, align 4
  %79 = icmp ne i32 %76, %78
  br i1 %79, label %13, label %80

80:                                               ; preds = %74
  %81 = getelementptr inbounds i32, i32* %0, i64 13
  %82 = load i32, i32* %81, align 4
  %83 = getelementptr inbounds i32, i32* %1, i64 13
  %84 = load i32, i32* %83, align 4
  %85 = icmp ne i32 %82, %84
  br i1 %85, label %13, label %86

86:                                               ; preds = %80
  %87 = getelementptr inbounds i32, i32* %0, i64 14
  %88 = load i32, i32* %87, align 4
  %89 = getelementptr inbounds i32, i32* %1, i64 14
  %90 = load i32, i32* %89, align 4
  %91 = icmp ne i32 %88, %90
  br i1 %91, label %13, label %92

92:                                               ; preds = %86
  %93 = getelementptr inbounds i32, i32* %0, i64 15
  %94 = load i32, i32* %93, align 4
  %95 = getelementptr inbounds i32, i32* %1, i64 15
  %96 = load i32, i32* %95, align 4
  %97 = icmp ne i32 %94, %96
  br i1 %97, label %13, label %98

98:                                               ; preds = %92
  %99 = getelementptr inbounds i32, i32* %0, i64 16
  %100 = load i32, i32* %99, align 4
  %101 = getelementptr inbounds i32, i32* %1, i64 16
  %102 = load i32, i32* %101, align 4
  %103 = icmp ne i32 %100, %102
  br i1 %103, label %13, label %104

104:                                              ; preds = %98
  %105 = getelementptr inbounds i32, i32* %0, i64 17
  %106 = load i32, i32* %105, align 4
  %107 = getelementptr inbounds i32, i32* %1, i64 17
  %108 = load i32, i32* %107, align 4
  %109 = icmp ne i32 %106, %108
  br i1 %109, label %13, label %110

110:                                              ; preds = %104
  %111 = getelementptr inbounds i32, i32* %0, i64 18
  %112 = load i32, i32* %111, align 4
  %113 = getelementptr inbounds i32, i32* %1, i64 18
  %114 = load i32, i32* %113, align 4
  %115 = icmp ne i32 %112, %114
  br i1 %115, label %13, label %116

116:                                              ; preds = %110
  %117 = getelementptr inbounds i32, i32* %0, i64 19
  %118 = load i32, i32* %117, align 4
  %119 = getelementptr inbounds i32, i32* %1, i64 19
  %120 = load i32, i32* %119, align 4
  %121 = icmp ne i32 %118, %120
  br i1 %121, label %13, label %122

122:                                              ; preds = %116
  %123 = getelementptr inbounds i32, i32* %0, i64 20
  %124 = load i32, i32* %123, align 4
  %125 = getelementptr inbounds i32, i32* %1, i64 20
  %126 = load i32, i32* %125, align 4
  %127 = icmp ne i32 %124, %126
  br i1 %127, label %13, label %128

128:                                              ; preds = %122
  %129 = getelementptr inbounds i32, i32* %0, i64 21
  %130 = load i32, i32* %129, align 4
  %131 = getelementptr inbounds i32, i32* %1, i64 21
  %132 = load i32, i32* %131, align 4
  %133 = icmp ne i32 %130, %132
  br i1 %133, label %13, label %134

134:                                              ; preds = %128
  %135 = getelementptr inbounds i32, i32* %0, i64 22
  %136 = load i32, i32* %135, align 4
  %137 = getelementptr inbounds i32, i32* %1, i64 22
  %138 = load i32, i32* %137, align 4
  %139 = icmp ne i32 %136, %138
  br i1 %139, label %13, label %140

140:                                              ; preds = %134
  %141 = getelementptr inbounds i32, i32* %0, i64 23
  %142 = load i32, i32* %141, align 4
  %143 = getelementptr inbounds i32, i32* %1, i64 23
  %144 = load i32, i32* %143, align 4
  %145 = icmp ne i32 %142, %144
  br i1 %145, label %13, label %146

146:                                              ; preds = %140
  %147 = getelementptr inbounds i32, i32* %0, i64 24
  %148 = load i32, i32* %147, align 4
  %149 = getelementptr inbounds i32, i32* %1, i64 24
  %150 = load i32, i32* %149, align 4
  %151 = icmp ne i32 %148, %150
  br i1 %151, label %13, label %152

152:                                              ; preds = %146
  %153 = getelementptr inbounds i32, i32* %0, i64 25
  %154 = load i32, i32* %153, align 4
  %155 = getelementptr inbounds i32, i32* %1, i64 25
  %156 = load i32, i32* %155, align 4
  %157 = icmp ne i32 %154, %156
  br i1 %157, label %13, label %158

158:                                              ; preds = %152
  %159 = getelementptr inbounds i32, i32* %0, i64 26
  %160 = load i32, i32* %159, align 4
  %161 = getelementptr inbounds i32, i32* %1, i64 26
  %162 = load i32, i32* %161, align 4
  %163 = icmp ne i32 %160, %162
  br i1 %163, label %13, label %164

164:                                              ; preds = %158
  %165 = getelementptr inbounds i32, i32* %0, i64 27
  %166 = load i32, i32* %165, align 4
  %167 = getelementptr inbounds i32, i32* %1, i64 27
  %168 = load i32, i32* %167, align 4
  %169 = icmp ne i32 %166, %168
  br i1 %169, label %13, label %170

170:                                              ; preds = %164
  %171 = getelementptr inbounds i32, i32* %0, i64 28
  %172 = load i32, i32* %171, align 4
  %173 = getelementptr inbounds i32, i32* %1, i64 28
  %174 = load i32, i32* %173, align 4
  %175 = icmp ne i32 %172, %174
  br i1 %175, label %13, label %176

176:                                              ; preds = %170
  %177 = getelementptr inbounds i32, i32* %0, i64 29
  %178 = load i32, i32* %177, align 4
  %179 = getelementptr inbounds i32, i32* %1, i64 29
  %180 = load i32, i32* %179, align 4
  %181 = icmp ne i32 %178, %180
  br i1 %181, label %13, label %182

182:                                              ; preds = %176
  %183 = getelementptr inbounds i32, i32* %0, i64 30
  %184 = load i32, i32* %183, align 4
  %185 = getelementptr inbounds i32, i32* %1, i64 30
  %186 = load i32, i32* %185, align 4
  %187 = icmp ne i32 %184, %186
  br i1 %187, label %13, label %188

188:                                              ; preds = %182
  %189 = getelementptr inbounds i32, i32* %0, i64 31
  %190 = load i32, i32* %189, align 4
  %191 = getelementptr inbounds i32, i32* %1, i64 31
  %192 = load i32, i32* %191, align 4
  %193 = icmp ne i32 %190, %192
  br i1 %193, label %13, label %194

194:                                              ; preds = %188
  br label %13
}

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}

; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [32 x i32], align 16
  %3 = alloca [32 x i32], align 16
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i64 0, i64* %4, align 8
  br label %6

6:                                                ; preds = %16, %0
  %7 = load i64, i64* %4, align 8
  %8 = icmp ult i64 %7, 32
  br i1 %8, label %9, label %19

9:                                                ; preds = %6
  %10 = load i64, i64* %4, align 8
  %11 = trunc i64 %10 to i32
  %12 = load i64, i64* %4, align 8
  %13 = getelementptr inbounds [32 x i32], [32 x i32]* %3, i64 0, i64 %12
  store i32 %11, i32* %13, align 4
  %14 = load i64, i64* %4, align 8
  %15 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 %14
  store i32 %11, i32* %15, align 4
  br label %16

16:                                               ; preds = %9
  %17 = load i64, i64* %4, align 8
  %18 = add i64 %17, 1
  store i64 %18, i64* %4, align 8
  br label %6

19:                                               ; preds = %6
  %20 = getelementptr inbounds [32 x i32], [32 x i32]* %3, i64 0, i64 0
  store i32 -1, i32* %20, align 16
  %21 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 0
  %22 = getelementptr inbounds [32 x i32], [32 x i32]* %3, i64 0, i64 0
  %23 = call i32 @comp(i32* %21, i32* %22)
  store i32 %23, i32* %5, align 4
  %24 = load i32, i32* %5, align 4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %24)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @comp(i32* %0, i32* %1) #0 {
  %3 = load i32, i32* %0, align 4
  %4 = load i32, i32* %1, align 4
  %5 = icmp ne i32 %3, %4
  br i1 %5, label %12, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds i32, i32* %0, i64 1
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr inbounds i32, i32* %1, i64 1
  %10 = load i32, i32* %9, align 4
  %11 = icmp ne i32 %8, %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %181, %175, %169, %163, %157, %151, %145, %139, %133, %127, %121, %115, %109, %103, %97, %91, %85, %79, %73, %67, %61, %55, %49, %43, %37, %31, %25, %19, %13, %6, %2
  ret i32 0

13:                                               ; preds = %6
  %14 = getelementptr inbounds i32, i32* %0, i64 2
  %15 = load i32, i32* %14, align 4
  %16 = getelementptr inbounds i32, i32* %1, i64 2
  %17 = load i32, i32* %16, align 4
  %18 = icmp ne i32 %15, %17
  br i1 %18, label %12, label %19

19:                                               ; preds = %13
  %20 = getelementptr inbounds i32, i32* %0, i64 3
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds i32, i32* %1, i64 3
  %23 = load i32, i32* %22, align 4
  %24 = icmp ne i32 %21, %23
  br i1 %24, label %12, label %25

25:                                               ; preds = %19
  %26 = getelementptr inbounds i32, i32* %0, i64 4
  %27 = load i32, i32* %26, align 4
  %28 = getelementptr inbounds i32, i32* %1, i64 4
  %29 = load i32, i32* %28, align 4
  %30 = icmp ne i32 %27, %29
  br i1 %30, label %12, label %31

31:                                               ; preds = %25
  %32 = getelementptr inbounds i32, i32* %0, i64 5
  %33 = load i32, i32* %32, align 4
  %34 = getelementptr inbounds i32, i32* %1, i64 5
  %35 = load i32, i32* %34, align 4
  %36 = icmp ne i32 %33, %35
  br i1 %36, label %12, label %37

37:                                               ; preds = %31
  %38 = getelementptr inbounds i32, i32* %0, i64 6
  %39 = load i32, i32* %38, align 4
  %40 = getelementptr inbounds i32, i32* %1, i64 6
  %41 = load i32, i32* %40, align 4
  %42 = icmp ne i32 %39, %41
  br i1 %42, label %12, label %43

43:                                               ; preds = %37
  %44 = getelementptr inbounds i32, i32* %0, i64 7
  %45 = load i32, i32* %44, align 4
  %46 = getelementptr inbounds i32, i32* %1, i64 7
  %47 = load i32, i32* %46, align 4
  %48 = icmp ne i32 %45, %47
  br i1 %48, label %12, label %49

49:                                               ; preds = %43
  %50 = getelementptr inbounds i32, i32* %0, i64 8
  %51 = load i32, i32* %50, align 4
  %52 = getelementptr inbounds i32, i32* %1, i64 8
  %53 = load i32, i32* %52, align 4
  %54 = icmp ne i32 %51, %53
  br i1 %54, label %12, label %55

55:                                               ; preds = %49
  %56 = getelementptr inbounds i32, i32* %0, i64 9
  %57 = load i32, i32* %56, align 4
  %58 = getelementptr inbounds i32, i32* %1, i64 9
  %59 = load i32, i32* %58, align 4
  %60 = icmp ne i32 %57, %59
  br i1 %60, label %12, label %61

61:                                               ; preds = %55
  %62 = getelementptr inbounds i32, i32* %0, i64 10
  %63 = load i32, i32* %62, align 4
  %64 = getelementptr inbounds i32, i32* %1, i64 10
  %65 = load i32, i32* %64, align 4
  %66 = icmp ne i32 %63, %65
  br i1 %66, label %12, label %67

67:                                               ; preds = %61
  %68 = getelementptr inbounds i32, i32* %0, i64 11
  %69 = load i32, i32* %68, align 4
  %70 = getelementptr inbounds i32, i32* %1, i64 11
  %71 = load i32, i32* %70, align 4
  %72 = icmp ne i32 %69, %71
  br i1 %72, label %12, label %73

73:                                               ; preds = %67
  %74 = getelementptr inbounds i32, i32* %0, i64 12
  %75 = load i32, i32* %74, align 4
  %76 = getelementptr inbounds i32, i32* %1, i64 12
  %77 = load i32, i32* %76, align 4
  %78 = icmp ne i32 %75, %77
  br i1 %78, label %12, label %79

79:                                               ; preds = %73
  %80 = getelementptr inbounds i32, i32* %0, i64 13
  %81 = load i32, i32* %80, align 4
  %82 = getelementptr inbounds i32, i32* %1, i64 13
  %83 = load i32, i32* %82, align 4
  %84 = icmp ne i32 %81, %83
  br i1 %84, label %12, label %85

85:                                               ; preds = %79
  %86 = getelementptr inbounds i32, i32* %0, i64 14
  %87 = load i32, i32* %86, align 4
  %88 = getelementptr inbounds i32, i32* %1, i64 14
  %89 = load i32, i32* %88, align 4
  %90 = icmp ne i32 %87, %89
  br i1 %90, label %12, label %91

91:                                               ; preds = %85
  %92 = getelementptr inbounds i32, i32* %0, i64 15
  %93 = load i32, i32* %92, align 4
  %94 = getelementptr inbounds i32, i32* %1, i64 15
  %95 = load i32, i32* %94, align 4
  %96 = icmp ne i32 %93, %95
  br i1 %96, label %12, label %97

97:                                               ; preds = %91
  %98 = getelementptr inbounds i32, i32* %0, i64 16
  %99 = load i32, i32* %98, align 4
  %100 = getelementptr inbounds i32, i32* %1, i64 16
  %101 = load i32, i32* %100, align 4
  %102 = icmp ne i32 %99, %101
  br i1 %102, label %12, label %103

103:                                              ; preds = %97
  %104 = getelementptr inbounds i32, i32* %0, i64 17
  %105 = load i32, i32* %104, align 4
  %106 = getelementptr inbounds i32, i32* %1, i64 17
  %107 = load i32, i32* %106, align 4
  %108 = icmp ne i32 %105, %107
  br i1 %108, label %12, label %109

109:                                              ; preds = %103
  %110 = getelementptr inbounds i32, i32* %0, i64 18
  %111 = load i32, i32* %110, align 4
  %112 = getelementptr inbounds i32, i32* %1, i64 18
  %113 = load i32, i32* %112, align 4
  %114 = icmp ne i32 %111, %113
  br i1 %114, label %12, label %115

115:                                              ; preds = %109
  %116 = getelementptr inbounds i32, i32* %0, i64 19
  %117 = load i32, i32* %116, align 4
  %118 = getelementptr inbounds i32, i32* %1, i64 19
  %119 = load i32, i32* %118, align 4
  %120 = icmp ne i32 %117, %119
  br i1 %120, label %12, label %121

121:                                              ; preds = %115
  %122 = getelementptr inbounds i32, i32* %0, i64 20
  %123 = load i32, i32* %122, align 4
  %124 = getelementptr inbounds i32, i32* %1, i64 20
  %125 = load i32, i32* %124, align 4
  %126 = icmp ne i32 %123, %125
  br i1 %126, label %12, label %127

127:                                              ; preds = %121
  %128 = getelementptr inbounds i32, i32* %0, i64 21
  %129 = load i32, i32* %128, align 4
  %130 = getelementptr inbounds i32, i32* %1, i64 21
  %131 = load i32, i32* %130, align 4
  %132 = icmp ne i32 %129, %131
  br i1 %132, label %12, label %133

133:                                              ; preds = %127
  %134 = getelementptr inbounds i32, i32* %0, i64 22
  %135 = load i32, i32* %134, align 4
  %136 = getelementptr inbounds i32, i32* %1, i64 22
  %137 = load i32, i32* %136, align 4
  %138 = icmp ne i32 %135, %137
  br i1 %138, label %12, label %139

139:                                              ; preds = %133
  %140 = getelementptr inbounds i32, i32* %0, i64 23
  %141 = load i32, i32* %140, align 4
  %142 = getelementptr inbounds i32, i32* %1, i64 23
  %143 = load i32, i32* %142, align 4
  %144 = icmp ne i32 %141, %143
  br i1 %144, label %12, label %145

145:                                              ; preds = %139
  %146 = getelementptr inbounds i32, i32* %0, i64 24
  %147 = load i32, i32* %146, align 4
  %148 = getelementptr inbounds i32, i32* %1, i64 24
  %149 = load i32, i32* %148, align 4
  %150 = icmp ne i32 %147, %149
  br i1 %150, label %12, label %151

151:                                              ; preds = %145
  %152 = getelementptr inbounds i32, i32* %0, i64 25
  %153 = load i32, i32* %152, align 4
  %154 = getelementptr inbounds i32, i32* %1, i64 25
  %155 = load i32, i32* %154, align 4
  %156 = icmp ne i32 %153, %155
  br i1 %156, label %12, label %157

157:                                              ; preds = %151
  %158 = getelementptr inbounds i32, i32* %0, i64 26
  %159 = load i32, i32* %158, align 4
  %160 = getelementptr inbounds i32, i32* %1, i64 26
  %161 = load i32, i32* %160, align 4
  %162 = icmp ne i32 %159, %161
  br i1 %162, label %12, label %163

163:                                              ; preds = %157
  %164 = getelementptr inbounds i32, i32* %0, i64 27
  %165 = load i32, i32* %164, align 4
  %166 = getelementptr inbounds i32, i32* %1, i64 27
  %167 = load i32, i32* %166, align 4
  %168 = icmp ne i32 %165, %167
  br i1 %168, label %12, label %169

169:                                              ; preds = %163
  %170 = getelementptr inbounds i32, i32* %0, i64 28
  %171 = load i32, i32* %170, align 4
  %172 = getelementptr inbounds i32, i32* %1, i64 28
  %173 = load i32, i32* %172, align 4
  %174 = icmp ne i32 %171, %173
  br i1 %174, label %12, label %175

175:                                              ; preds = %169
  %176 = getelementptr inbounds i32, i32* %0, i64 29
  %177 = load i32, i32* %176, align 4
  %178 = getelementptr inbounds i32, i32* %1, i64 29
  %179 = load i32, i32* %178, align 4
  %180 = icmp ne i32 %177, %179
  br i1 %180, label %12, label %181

181:                                              ; preds = %175
  %182 = getelementptr inbounds i32, i32* %0, i64 30
  %183 = load i32, i32* %182, align 4
  %184 = getelementptr inbounds i32, i32* %1, i64 30
  %185 = load i32, i32* %184, align 4
  %186 = icmp ne i32 %183, %185
  br i1 %186, label %12, label %187

187:                                              ; preds = %181
  %188 = getelementptr inbounds i32, i32* %0, i64 31
  %189 = load i32, i32* %188, align 4
  %190 = getelementptr inbounds i32, i32* %1, i64 31
  %191 = load i32, i32* %190, align 4
  %192 = icmp ne i32 %189, %191
  %spec.select = select i1 %192, i32 0, i32 1
  ret i32 %spec.select
}

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}

; ModuleID = 'comp/llvm-ir/main1.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [32 x i32], align 16
  %2 = alloca [32 x i32], align 16
  %3 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 0
  %4 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 0
  %5 = bitcast [32 x i32]* %2 to <4 x i32>*
  store <4 x i32> <i32 0, i32 1, i32 2, i32 3>, <4 x i32>* %5, align 16
  %6 = bitcast [32 x i32]* %1 to <4 x i32>*
  store <4 x i32> <i32 0, i32 1, i32 2, i32 3>, <4 x i32>* %6, align 16
  %7 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 4
  %8 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 4
  %9 = bitcast i32* %7 to <4 x i32>*
  store <4 x i32> <i32 4, i32 5, i32 6, i32 7>, <4 x i32>* %9, align 16
  %10 = bitcast i32* %8 to <4 x i32>*
  store <4 x i32> <i32 4, i32 5, i32 6, i32 7>, <4 x i32>* %10, align 16
  %11 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 8
  %12 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 8
  %13 = bitcast i32* %11 to <4 x i32>*
  store <4 x i32> <i32 8, i32 9, i32 10, i32 11>, <4 x i32>* %13, align 16
  %14 = bitcast i32* %12 to <4 x i32>*
  store <4 x i32> <i32 8, i32 9, i32 10, i32 11>, <4 x i32>* %14, align 16
  %15 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 12
  %16 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 12
  %17 = bitcast i32* %15 to <4 x i32>*
  store <4 x i32> <i32 12, i32 13, i32 14, i32 15>, <4 x i32>* %17, align 16
  %18 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 12, i32 13, i32 14, i32 15>, <4 x i32>* %18, align 16
  %19 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 16
  %20 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 16
  %21 = bitcast i32* %19 to <4 x i32>*
  store <4 x i32> <i32 16, i32 17, i32 18, i32 19>, <4 x i32>* %21, align 16
  %22 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 16, i32 17, i32 18, i32 19>, <4 x i32>* %22, align 16
  %23 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 20
  %24 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 20
  %25 = bitcast i32* %23 to <4 x i32>*
  store <4 x i32> <i32 20, i32 21, i32 22, i32 23>, <4 x i32>* %25, align 16
  %26 = bitcast i32* %24 to <4 x i32>*
  store <4 x i32> <i32 20, i32 21, i32 22, i32 23>, <4 x i32>* %26, align 16
  %27 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 24
  %28 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 24
  %29 = bitcast i32* %27 to <4 x i32>*
  store <4 x i32> <i32 24, i32 25, i32 26, i32 27>, <4 x i32>* %29, align 16
  %30 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 24, i32 25, i32 26, i32 27>, <4 x i32>* %30, align 16
  %31 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 28
  %32 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 28
  %33 = bitcast i32* %31 to <4 x i32>*
  store <4 x i32> <i32 28, i32 29, i32 30, i32 31>, <4 x i32>* %33, align 16
  %34 = bitcast i32* %32 to <4 x i32>*
  store <4 x i32> <i32 28, i32 29, i32 30, i32 31>, <4 x i32>* %34, align 16
  %35 = call i32 @comp(i32* nonnull %4, i32* nonnull %3)
  %36 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %35)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind readonly sspstrong uwtable
define dso_local i32 @comp(i32* readonly %0, i32* readonly %1) local_unnamed_addr #2 {
  %3 = load i32, i32* %0, align 4
  %4 = load i32, i32* %1, align 4
  %5 = icmp eq i32 %3, %4
  br i1 %5, label %6, label %12

6:                                                ; preds = %2
  %7 = getelementptr inbounds i32, i32* %0, i64 1
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr inbounds i32, i32* %1, i64 1
  %10 = load i32, i32* %9, align 4
  %11 = icmp eq i32 %8, %10
  br i1 %11, label %13, label %12

12:                                               ; preds = %181, %175, %169, %163, %157, %151, %145, %139, %133, %127, %121, %115, %109, %103, %97, %91, %85, %79, %73, %67, %61, %55, %49, %43, %37, %31, %25, %19, %13, %6, %2
  ret i32 0

13:                                               ; preds = %6
  %14 = getelementptr inbounds i32, i32* %0, i64 2
  %15 = load i32, i32* %14, align 4
  %16 = getelementptr inbounds i32, i32* %1, i64 2
  %17 = load i32, i32* %16, align 4
  %18 = icmp eq i32 %15, %17
  br i1 %18, label %19, label %12

19:                                               ; preds = %13
  %20 = getelementptr inbounds i32, i32* %0, i64 3
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds i32, i32* %1, i64 3
  %23 = load i32, i32* %22, align 4
  %24 = icmp eq i32 %21, %23
  br i1 %24, label %25, label %12

25:                                               ; preds = %19
  %26 = getelementptr inbounds i32, i32* %0, i64 4
  %27 = load i32, i32* %26, align 4
  %28 = getelementptr inbounds i32, i32* %1, i64 4
  %29 = load i32, i32* %28, align 4
  %30 = icmp eq i32 %27, %29
  br i1 %30, label %31, label %12

31:                                               ; preds = %25
  %32 = getelementptr inbounds i32, i32* %0, i64 5
  %33 = load i32, i32* %32, align 4
  %34 = getelementptr inbounds i32, i32* %1, i64 5
  %35 = load i32, i32* %34, align 4
  %36 = icmp eq i32 %33, %35
  br i1 %36, label %37, label %12

37:                                               ; preds = %31
  %38 = getelementptr inbounds i32, i32* %0, i64 6
  %39 = load i32, i32* %38, align 4
  %40 = getelementptr inbounds i32, i32* %1, i64 6
  %41 = load i32, i32* %40, align 4
  %42 = icmp eq i32 %39, %41
  br i1 %42, label %43, label %12

43:                                               ; preds = %37
  %44 = getelementptr inbounds i32, i32* %0, i64 7
  %45 = load i32, i32* %44, align 4
  %46 = getelementptr inbounds i32, i32* %1, i64 7
  %47 = load i32, i32* %46, align 4
  %48 = icmp eq i32 %45, %47
  br i1 %48, label %49, label %12

49:                                               ; preds = %43
  %50 = getelementptr inbounds i32, i32* %0, i64 8
  %51 = load i32, i32* %50, align 4
  %52 = getelementptr inbounds i32, i32* %1, i64 8
  %53 = load i32, i32* %52, align 4
  %54 = icmp eq i32 %51, %53
  br i1 %54, label %55, label %12

55:                                               ; preds = %49
  %56 = getelementptr inbounds i32, i32* %0, i64 9
  %57 = load i32, i32* %56, align 4
  %58 = getelementptr inbounds i32, i32* %1, i64 9
  %59 = load i32, i32* %58, align 4
  %60 = icmp eq i32 %57, %59
  br i1 %60, label %61, label %12

61:                                               ; preds = %55
  %62 = getelementptr inbounds i32, i32* %0, i64 10
  %63 = load i32, i32* %62, align 4
  %64 = getelementptr inbounds i32, i32* %1, i64 10
  %65 = load i32, i32* %64, align 4
  %66 = icmp eq i32 %63, %65
  br i1 %66, label %67, label %12

67:                                               ; preds = %61
  %68 = getelementptr inbounds i32, i32* %0, i64 11
  %69 = load i32, i32* %68, align 4
  %70 = getelementptr inbounds i32, i32* %1, i64 11
  %71 = load i32, i32* %70, align 4
  %72 = icmp eq i32 %69, %71
  br i1 %72, label %73, label %12

73:                                               ; preds = %67
  %74 = getelementptr inbounds i32, i32* %0, i64 12
  %75 = load i32, i32* %74, align 4
  %76 = getelementptr inbounds i32, i32* %1, i64 12
  %77 = load i32, i32* %76, align 4
  %78 = icmp eq i32 %75, %77
  br i1 %78, label %79, label %12

79:                                               ; preds = %73
  %80 = getelementptr inbounds i32, i32* %0, i64 13
  %81 = load i32, i32* %80, align 4
  %82 = getelementptr inbounds i32, i32* %1, i64 13
  %83 = load i32, i32* %82, align 4
  %84 = icmp eq i32 %81, %83
  br i1 %84, label %85, label %12

85:                                               ; preds = %79
  %86 = getelementptr inbounds i32, i32* %0, i64 14
  %87 = load i32, i32* %86, align 4
  %88 = getelementptr inbounds i32, i32* %1, i64 14
  %89 = load i32, i32* %88, align 4
  %90 = icmp eq i32 %87, %89
  br i1 %90, label %91, label %12

91:                                               ; preds = %85
  %92 = getelementptr inbounds i32, i32* %0, i64 15
  %93 = load i32, i32* %92, align 4
  %94 = getelementptr inbounds i32, i32* %1, i64 15
  %95 = load i32, i32* %94, align 4
  %96 = icmp eq i32 %93, %95
  br i1 %96, label %97, label %12

97:                                               ; preds = %91
  %98 = getelementptr inbounds i32, i32* %0, i64 16
  %99 = load i32, i32* %98, align 4
  %100 = getelementptr inbounds i32, i32* %1, i64 16
  %101 = load i32, i32* %100, align 4
  %102 = icmp eq i32 %99, %101
  br i1 %102, label %103, label %12

103:                                              ; preds = %97
  %104 = getelementptr inbounds i32, i32* %0, i64 17
  %105 = load i32, i32* %104, align 4
  %106 = getelementptr inbounds i32, i32* %1, i64 17
  %107 = load i32, i32* %106, align 4
  %108 = icmp eq i32 %105, %107
  br i1 %108, label %109, label %12

109:                                              ; preds = %103
  %110 = getelementptr inbounds i32, i32* %0, i64 18
  %111 = load i32, i32* %110, align 4
  %112 = getelementptr inbounds i32, i32* %1, i64 18
  %113 = load i32, i32* %112, align 4
  %114 = icmp eq i32 %111, %113
  br i1 %114, label %115, label %12

115:                                              ; preds = %109
  %116 = getelementptr inbounds i32, i32* %0, i64 19
  %117 = load i32, i32* %116, align 4
  %118 = getelementptr inbounds i32, i32* %1, i64 19
  %119 = load i32, i32* %118, align 4
  %120 = icmp eq i32 %117, %119
  br i1 %120, label %121, label %12

121:                                              ; preds = %115
  %122 = getelementptr inbounds i32, i32* %0, i64 20
  %123 = load i32, i32* %122, align 4
  %124 = getelementptr inbounds i32, i32* %1, i64 20
  %125 = load i32, i32* %124, align 4
  %126 = icmp eq i32 %123, %125
  br i1 %126, label %127, label %12

127:                                              ; preds = %121
  %128 = getelementptr inbounds i32, i32* %0, i64 21
  %129 = load i32, i32* %128, align 4
  %130 = getelementptr inbounds i32, i32* %1, i64 21
  %131 = load i32, i32* %130, align 4
  %132 = icmp eq i32 %129, %131
  br i1 %132, label %133, label %12

133:                                              ; preds = %127
  %134 = getelementptr inbounds i32, i32* %0, i64 22
  %135 = load i32, i32* %134, align 4
  %136 = getelementptr inbounds i32, i32* %1, i64 22
  %137 = load i32, i32* %136, align 4
  %138 = icmp eq i32 %135, %137
  br i1 %138, label %139, label %12

139:                                              ; preds = %133
  %140 = getelementptr inbounds i32, i32* %0, i64 23
  %141 = load i32, i32* %140, align 4
  %142 = getelementptr inbounds i32, i32* %1, i64 23
  %143 = load i32, i32* %142, align 4
  %144 = icmp eq i32 %141, %143
  br i1 %144, label %145, label %12

145:                                              ; preds = %139
  %146 = getelementptr inbounds i32, i32* %0, i64 24
  %147 = load i32, i32* %146, align 4
  %148 = getelementptr inbounds i32, i32* %1, i64 24
  %149 = load i32, i32* %148, align 4
  %150 = icmp eq i32 %147, %149
  br i1 %150, label %151, label %12

151:                                              ; preds = %145
  %152 = getelementptr inbounds i32, i32* %0, i64 25
  %153 = load i32, i32* %152, align 4
  %154 = getelementptr inbounds i32, i32* %1, i64 25
  %155 = load i32, i32* %154, align 4
  %156 = icmp eq i32 %153, %155
  br i1 %156, label %157, label %12

157:                                              ; preds = %151
  %158 = getelementptr inbounds i32, i32* %0, i64 26
  %159 = load i32, i32* %158, align 4
  %160 = getelementptr inbounds i32, i32* %1, i64 26
  %161 = load i32, i32* %160, align 4
  %162 = icmp eq i32 %159, %161
  br i1 %162, label %163, label %12

163:                                              ; preds = %157
  %164 = getelementptr inbounds i32, i32* %0, i64 27
  %165 = load i32, i32* %164, align 4
  %166 = getelementptr inbounds i32, i32* %1, i64 27
  %167 = load i32, i32* %166, align 4
  %168 = icmp eq i32 %165, %167
  br i1 %168, label %169, label %12

169:                                              ; preds = %163
  %170 = getelementptr inbounds i32, i32* %0, i64 28
  %171 = load i32, i32* %170, align 4
  %172 = getelementptr inbounds i32, i32* %1, i64 28
  %173 = load i32, i32* %172, align 4
  %174 = icmp eq i32 %171, %173
  br i1 %174, label %175, label %12

175:                                              ; preds = %169
  %176 = getelementptr inbounds i32, i32* %0, i64 29
  %177 = load i32, i32* %176, align 4
  %178 = getelementptr inbounds i32, i32* %1, i64 29
  %179 = load i32, i32* %178, align 4
  %180 = icmp eq i32 %177, %179
  br i1 %180, label %181, label %12

181:                                              ; preds = %175
  %182 = getelementptr inbounds i32, i32* %0, i64 30
  %183 = load i32, i32* %182, align 4
  %184 = getelementptr inbounds i32, i32* %1, i64 30
  %185 = load i32, i32* %184, align 4
  %186 = icmp eq i32 %183, %185
  br i1 %186, label %187, label %12

187:                                              ; preds = %181
  %188 = getelementptr inbounds i32, i32* %0, i64 31
  %189 = load i32, i32* %188, align 4
  %190 = getelementptr inbounds i32, i32* %1, i64 31
  %191 = load i32, i32* %190, align 4
  %192 = icmp eq i32 %189, %191
  %spec.select = zext i1 %192 to i32
  ret i32 %spec.select
}

attributes #0 = { nofree noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind readonly sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}

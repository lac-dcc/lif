; ModuleID = 'comp/llvm-ir/comp1.ll'
source_filename = "comp/sources/comp1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @comp(i32* %0, i32* %1) #0 !dbg !9 {
  call void @llvm.dbg.value(metadata i32* %0, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32* %1, metadata !16, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !19
  br label %9, !dbg !20

3:                                                ; preds = %9
  call void @llvm.dbg.value(metadata i32 1, metadata !17, metadata !DIExpression()), !dbg !19
  %4 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !21
  %5 = load i32, i32* %4, align 4, !dbg !21
  %6 = getelementptr inbounds i32, i32* %1, i64 1, !dbg !24
  %7 = load i32, i32* %6, align 4, !dbg !24
  %8 = icmp ne i32 %5, %7, !dbg !25
  call void @llvm.dbg.value(metadata i32 2, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %8, label %13, label %14, !dbg !26

9:                                                ; preds = %2
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !19
  %10 = load i32, i32* %0, align 4, !dbg !21
  %11 = load i32, i32* %1, align 4, !dbg !24
  %12 = icmp ne i32 %10, %11, !dbg !25
  call void @llvm.dbg.value(metadata i32 1, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %12, label %13, label %3, !dbg !26

13:                                               ; preds = %194, %188, %182, %176, %170, %164, %158, %152, %146, %140, %134, %128, %122, %116, %110, %104, %98, %92, %86, %80, %74, %68, %62, %56, %50, %44, %38, %32, %26, %20, %14, %3, %9
  %.0 = phi i32 [ 0, %9 ], [ 0, %3 ], [ 0, %14 ], [ 0, %20 ], [ 0, %26 ], [ 0, %32 ], [ 0, %38 ], [ 0, %44 ], [ 0, %50 ], [ 0, %56 ], [ 0, %62 ], [ 0, %68 ], [ 0, %74 ], [ 0, %80 ], [ 0, %86 ], [ 0, %92 ], [ 0, %98 ], [ 0, %104 ], [ 0, %110 ], [ 0, %116 ], [ 0, %122 ], [ 0, %128 ], [ 0, %134 ], [ 0, %140 ], [ 0, %146 ], [ 0, %152 ], [ 0, %158 ], [ 0, %164 ], [ 0, %170 ], [ 0, %176 ], [ 0, %182 ], [ 0, %188 ], [ 1, %194 ], !dbg !15
  ret i32 %.0, !dbg !27

14:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i32 2, metadata !17, metadata !DIExpression()), !dbg !19
  %15 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !21
  %16 = load i32, i32* %15, align 4, !dbg !21
  %17 = getelementptr inbounds i32, i32* %1, i64 2, !dbg !24
  %18 = load i32, i32* %17, align 4, !dbg !24
  %19 = icmp ne i32 %16, %18, !dbg !25
  call void @llvm.dbg.value(metadata i32 3, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %19, label %13, label %20, !dbg !26

20:                                               ; preds = %14
  call void @llvm.dbg.value(metadata i32 3, metadata !17, metadata !DIExpression()), !dbg !19
  %21 = getelementptr inbounds i32, i32* %0, i64 3, !dbg !21
  %22 = load i32, i32* %21, align 4, !dbg !21
  %23 = getelementptr inbounds i32, i32* %1, i64 3, !dbg !24
  %24 = load i32, i32* %23, align 4, !dbg !24
  %25 = icmp ne i32 %22, %24, !dbg !25
  call void @llvm.dbg.value(metadata i32 4, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %25, label %13, label %26, !dbg !26

26:                                               ; preds = %20
  call void @llvm.dbg.value(metadata i32 4, metadata !17, metadata !DIExpression()), !dbg !19
  %27 = getelementptr inbounds i32, i32* %0, i64 4, !dbg !21
  %28 = load i32, i32* %27, align 4, !dbg !21
  %29 = getelementptr inbounds i32, i32* %1, i64 4, !dbg !24
  %30 = load i32, i32* %29, align 4, !dbg !24
  %31 = icmp ne i32 %28, %30, !dbg !25
  call void @llvm.dbg.value(metadata i32 5, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %31, label %13, label %32, !dbg !26

32:                                               ; preds = %26
  call void @llvm.dbg.value(metadata i32 5, metadata !17, metadata !DIExpression()), !dbg !19
  %33 = getelementptr inbounds i32, i32* %0, i64 5, !dbg !21
  %34 = load i32, i32* %33, align 4, !dbg !21
  %35 = getelementptr inbounds i32, i32* %1, i64 5, !dbg !24
  %36 = load i32, i32* %35, align 4, !dbg !24
  %37 = icmp ne i32 %34, %36, !dbg !25
  call void @llvm.dbg.value(metadata i32 6, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %37, label %13, label %38, !dbg !26

38:                                               ; preds = %32
  call void @llvm.dbg.value(metadata i32 6, metadata !17, metadata !DIExpression()), !dbg !19
  %39 = getelementptr inbounds i32, i32* %0, i64 6, !dbg !21
  %40 = load i32, i32* %39, align 4, !dbg !21
  %41 = getelementptr inbounds i32, i32* %1, i64 6, !dbg !24
  %42 = load i32, i32* %41, align 4, !dbg !24
  %43 = icmp ne i32 %40, %42, !dbg !25
  call void @llvm.dbg.value(metadata i32 7, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %43, label %13, label %44, !dbg !26

44:                                               ; preds = %38
  call void @llvm.dbg.value(metadata i32 7, metadata !17, metadata !DIExpression()), !dbg !19
  %45 = getelementptr inbounds i32, i32* %0, i64 7, !dbg !21
  %46 = load i32, i32* %45, align 4, !dbg !21
  %47 = getelementptr inbounds i32, i32* %1, i64 7, !dbg !24
  %48 = load i32, i32* %47, align 4, !dbg !24
  %49 = icmp ne i32 %46, %48, !dbg !25
  call void @llvm.dbg.value(metadata i32 8, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %49, label %13, label %50, !dbg !26

50:                                               ; preds = %44
  call void @llvm.dbg.value(metadata i32 8, metadata !17, metadata !DIExpression()), !dbg !19
  %51 = getelementptr inbounds i32, i32* %0, i64 8, !dbg !21
  %52 = load i32, i32* %51, align 4, !dbg !21
  %53 = getelementptr inbounds i32, i32* %1, i64 8, !dbg !24
  %54 = load i32, i32* %53, align 4, !dbg !24
  %55 = icmp ne i32 %52, %54, !dbg !25
  call void @llvm.dbg.value(metadata i32 9, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %55, label %13, label %56, !dbg !26

56:                                               ; preds = %50
  call void @llvm.dbg.value(metadata i32 9, metadata !17, metadata !DIExpression()), !dbg !19
  %57 = getelementptr inbounds i32, i32* %0, i64 9, !dbg !21
  %58 = load i32, i32* %57, align 4, !dbg !21
  %59 = getelementptr inbounds i32, i32* %1, i64 9, !dbg !24
  %60 = load i32, i32* %59, align 4, !dbg !24
  %61 = icmp ne i32 %58, %60, !dbg !25
  call void @llvm.dbg.value(metadata i32 10, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %61, label %13, label %62, !dbg !26

62:                                               ; preds = %56
  call void @llvm.dbg.value(metadata i32 10, metadata !17, metadata !DIExpression()), !dbg !19
  %63 = getelementptr inbounds i32, i32* %0, i64 10, !dbg !21
  %64 = load i32, i32* %63, align 4, !dbg !21
  %65 = getelementptr inbounds i32, i32* %1, i64 10, !dbg !24
  %66 = load i32, i32* %65, align 4, !dbg !24
  %67 = icmp ne i32 %64, %66, !dbg !25
  call void @llvm.dbg.value(metadata i32 11, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %67, label %13, label %68, !dbg !26

68:                                               ; preds = %62
  call void @llvm.dbg.value(metadata i32 11, metadata !17, metadata !DIExpression()), !dbg !19
  %69 = getelementptr inbounds i32, i32* %0, i64 11, !dbg !21
  %70 = load i32, i32* %69, align 4, !dbg !21
  %71 = getelementptr inbounds i32, i32* %1, i64 11, !dbg !24
  %72 = load i32, i32* %71, align 4, !dbg !24
  %73 = icmp ne i32 %70, %72, !dbg !25
  call void @llvm.dbg.value(metadata i32 12, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %73, label %13, label %74, !dbg !26

74:                                               ; preds = %68
  call void @llvm.dbg.value(metadata i32 12, metadata !17, metadata !DIExpression()), !dbg !19
  %75 = getelementptr inbounds i32, i32* %0, i64 12, !dbg !21
  %76 = load i32, i32* %75, align 4, !dbg !21
  %77 = getelementptr inbounds i32, i32* %1, i64 12, !dbg !24
  %78 = load i32, i32* %77, align 4, !dbg !24
  %79 = icmp ne i32 %76, %78, !dbg !25
  call void @llvm.dbg.value(metadata i32 13, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %79, label %13, label %80, !dbg !26

80:                                               ; preds = %74
  call void @llvm.dbg.value(metadata i32 13, metadata !17, metadata !DIExpression()), !dbg !19
  %81 = getelementptr inbounds i32, i32* %0, i64 13, !dbg !21
  %82 = load i32, i32* %81, align 4, !dbg !21
  %83 = getelementptr inbounds i32, i32* %1, i64 13, !dbg !24
  %84 = load i32, i32* %83, align 4, !dbg !24
  %85 = icmp ne i32 %82, %84, !dbg !25
  call void @llvm.dbg.value(metadata i32 14, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %85, label %13, label %86, !dbg !26

86:                                               ; preds = %80
  call void @llvm.dbg.value(metadata i32 14, metadata !17, metadata !DIExpression()), !dbg !19
  %87 = getelementptr inbounds i32, i32* %0, i64 14, !dbg !21
  %88 = load i32, i32* %87, align 4, !dbg !21
  %89 = getelementptr inbounds i32, i32* %1, i64 14, !dbg !24
  %90 = load i32, i32* %89, align 4, !dbg !24
  %91 = icmp ne i32 %88, %90, !dbg !25
  call void @llvm.dbg.value(metadata i32 15, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %91, label %13, label %92, !dbg !26

92:                                               ; preds = %86
  call void @llvm.dbg.value(metadata i32 15, metadata !17, metadata !DIExpression()), !dbg !19
  %93 = getelementptr inbounds i32, i32* %0, i64 15, !dbg !21
  %94 = load i32, i32* %93, align 4, !dbg !21
  %95 = getelementptr inbounds i32, i32* %1, i64 15, !dbg !24
  %96 = load i32, i32* %95, align 4, !dbg !24
  %97 = icmp ne i32 %94, %96, !dbg !25
  call void @llvm.dbg.value(metadata i32 16, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %97, label %13, label %98, !dbg !26

98:                                               ; preds = %92
  call void @llvm.dbg.value(metadata i32 16, metadata !17, metadata !DIExpression()), !dbg !19
  %99 = getelementptr inbounds i32, i32* %0, i64 16, !dbg !21
  %100 = load i32, i32* %99, align 4, !dbg !21
  %101 = getelementptr inbounds i32, i32* %1, i64 16, !dbg !24
  %102 = load i32, i32* %101, align 4, !dbg !24
  %103 = icmp ne i32 %100, %102, !dbg !25
  call void @llvm.dbg.value(metadata i32 17, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %103, label %13, label %104, !dbg !26

104:                                              ; preds = %98
  call void @llvm.dbg.value(metadata i32 17, metadata !17, metadata !DIExpression()), !dbg !19
  %105 = getelementptr inbounds i32, i32* %0, i64 17, !dbg !21
  %106 = load i32, i32* %105, align 4, !dbg !21
  %107 = getelementptr inbounds i32, i32* %1, i64 17, !dbg !24
  %108 = load i32, i32* %107, align 4, !dbg !24
  %109 = icmp ne i32 %106, %108, !dbg !25
  call void @llvm.dbg.value(metadata i32 18, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %109, label %13, label %110, !dbg !26

110:                                              ; preds = %104
  call void @llvm.dbg.value(metadata i32 18, metadata !17, metadata !DIExpression()), !dbg !19
  %111 = getelementptr inbounds i32, i32* %0, i64 18, !dbg !21
  %112 = load i32, i32* %111, align 4, !dbg !21
  %113 = getelementptr inbounds i32, i32* %1, i64 18, !dbg !24
  %114 = load i32, i32* %113, align 4, !dbg !24
  %115 = icmp ne i32 %112, %114, !dbg !25
  call void @llvm.dbg.value(metadata i32 19, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %115, label %13, label %116, !dbg !26

116:                                              ; preds = %110
  call void @llvm.dbg.value(metadata i32 19, metadata !17, metadata !DIExpression()), !dbg !19
  %117 = getelementptr inbounds i32, i32* %0, i64 19, !dbg !21
  %118 = load i32, i32* %117, align 4, !dbg !21
  %119 = getelementptr inbounds i32, i32* %1, i64 19, !dbg !24
  %120 = load i32, i32* %119, align 4, !dbg !24
  %121 = icmp ne i32 %118, %120, !dbg !25
  call void @llvm.dbg.value(metadata i32 20, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %121, label %13, label %122, !dbg !26

122:                                              ; preds = %116
  call void @llvm.dbg.value(metadata i32 20, metadata !17, metadata !DIExpression()), !dbg !19
  %123 = getelementptr inbounds i32, i32* %0, i64 20, !dbg !21
  %124 = load i32, i32* %123, align 4, !dbg !21
  %125 = getelementptr inbounds i32, i32* %1, i64 20, !dbg !24
  %126 = load i32, i32* %125, align 4, !dbg !24
  %127 = icmp ne i32 %124, %126, !dbg !25
  call void @llvm.dbg.value(metadata i32 21, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %127, label %13, label %128, !dbg !26

128:                                              ; preds = %122
  call void @llvm.dbg.value(metadata i32 21, metadata !17, metadata !DIExpression()), !dbg !19
  %129 = getelementptr inbounds i32, i32* %0, i64 21, !dbg !21
  %130 = load i32, i32* %129, align 4, !dbg !21
  %131 = getelementptr inbounds i32, i32* %1, i64 21, !dbg !24
  %132 = load i32, i32* %131, align 4, !dbg !24
  %133 = icmp ne i32 %130, %132, !dbg !25
  call void @llvm.dbg.value(metadata i32 22, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %133, label %13, label %134, !dbg !26

134:                                              ; preds = %128
  call void @llvm.dbg.value(metadata i32 22, metadata !17, metadata !DIExpression()), !dbg !19
  %135 = getelementptr inbounds i32, i32* %0, i64 22, !dbg !21
  %136 = load i32, i32* %135, align 4, !dbg !21
  %137 = getelementptr inbounds i32, i32* %1, i64 22, !dbg !24
  %138 = load i32, i32* %137, align 4, !dbg !24
  %139 = icmp ne i32 %136, %138, !dbg !25
  call void @llvm.dbg.value(metadata i32 23, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %139, label %13, label %140, !dbg !26

140:                                              ; preds = %134
  call void @llvm.dbg.value(metadata i32 23, metadata !17, metadata !DIExpression()), !dbg !19
  %141 = getelementptr inbounds i32, i32* %0, i64 23, !dbg !21
  %142 = load i32, i32* %141, align 4, !dbg !21
  %143 = getelementptr inbounds i32, i32* %1, i64 23, !dbg !24
  %144 = load i32, i32* %143, align 4, !dbg !24
  %145 = icmp ne i32 %142, %144, !dbg !25
  call void @llvm.dbg.value(metadata i32 24, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %145, label %13, label %146, !dbg !26

146:                                              ; preds = %140
  call void @llvm.dbg.value(metadata i32 24, metadata !17, metadata !DIExpression()), !dbg !19
  %147 = getelementptr inbounds i32, i32* %0, i64 24, !dbg !21
  %148 = load i32, i32* %147, align 4, !dbg !21
  %149 = getelementptr inbounds i32, i32* %1, i64 24, !dbg !24
  %150 = load i32, i32* %149, align 4, !dbg !24
  %151 = icmp ne i32 %148, %150, !dbg !25
  call void @llvm.dbg.value(metadata i32 25, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %151, label %13, label %152, !dbg !26

152:                                              ; preds = %146
  call void @llvm.dbg.value(metadata i32 25, metadata !17, metadata !DIExpression()), !dbg !19
  %153 = getelementptr inbounds i32, i32* %0, i64 25, !dbg !21
  %154 = load i32, i32* %153, align 4, !dbg !21
  %155 = getelementptr inbounds i32, i32* %1, i64 25, !dbg !24
  %156 = load i32, i32* %155, align 4, !dbg !24
  %157 = icmp ne i32 %154, %156, !dbg !25
  call void @llvm.dbg.value(metadata i32 26, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %157, label %13, label %158, !dbg !26

158:                                              ; preds = %152
  call void @llvm.dbg.value(metadata i32 26, metadata !17, metadata !DIExpression()), !dbg !19
  %159 = getelementptr inbounds i32, i32* %0, i64 26, !dbg !21
  %160 = load i32, i32* %159, align 4, !dbg !21
  %161 = getelementptr inbounds i32, i32* %1, i64 26, !dbg !24
  %162 = load i32, i32* %161, align 4, !dbg !24
  %163 = icmp ne i32 %160, %162, !dbg !25
  call void @llvm.dbg.value(metadata i32 27, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %163, label %13, label %164, !dbg !26

164:                                              ; preds = %158
  call void @llvm.dbg.value(metadata i32 27, metadata !17, metadata !DIExpression()), !dbg !19
  %165 = getelementptr inbounds i32, i32* %0, i64 27, !dbg !21
  %166 = load i32, i32* %165, align 4, !dbg !21
  %167 = getelementptr inbounds i32, i32* %1, i64 27, !dbg !24
  %168 = load i32, i32* %167, align 4, !dbg !24
  %169 = icmp ne i32 %166, %168, !dbg !25
  call void @llvm.dbg.value(metadata i32 28, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %169, label %13, label %170, !dbg !26

170:                                              ; preds = %164
  call void @llvm.dbg.value(metadata i32 28, metadata !17, metadata !DIExpression()), !dbg !19
  %171 = getelementptr inbounds i32, i32* %0, i64 28, !dbg !21
  %172 = load i32, i32* %171, align 4, !dbg !21
  %173 = getelementptr inbounds i32, i32* %1, i64 28, !dbg !24
  %174 = load i32, i32* %173, align 4, !dbg !24
  %175 = icmp ne i32 %172, %174, !dbg !25
  call void @llvm.dbg.value(metadata i32 29, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %175, label %13, label %176, !dbg !26

176:                                              ; preds = %170
  call void @llvm.dbg.value(metadata i32 29, metadata !17, metadata !DIExpression()), !dbg !19
  %177 = getelementptr inbounds i32, i32* %0, i64 29, !dbg !21
  %178 = load i32, i32* %177, align 4, !dbg !21
  %179 = getelementptr inbounds i32, i32* %1, i64 29, !dbg !24
  %180 = load i32, i32* %179, align 4, !dbg !24
  %181 = icmp ne i32 %178, %180, !dbg !25
  call void @llvm.dbg.value(metadata i32 30, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %181, label %13, label %182, !dbg !26

182:                                              ; preds = %176
  call void @llvm.dbg.value(metadata i32 30, metadata !17, metadata !DIExpression()), !dbg !19
  %183 = getelementptr inbounds i32, i32* %0, i64 30, !dbg !21
  %184 = load i32, i32* %183, align 4, !dbg !21
  %185 = getelementptr inbounds i32, i32* %1, i64 30, !dbg !24
  %186 = load i32, i32* %185, align 4, !dbg !24
  %187 = icmp ne i32 %184, %186, !dbg !25
  call void @llvm.dbg.value(metadata i32 31, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %187, label %13, label %188, !dbg !26

188:                                              ; preds = %182
  call void @llvm.dbg.value(metadata i32 31, metadata !17, metadata !DIExpression()), !dbg !19
  %189 = getelementptr inbounds i32, i32* %0, i64 31, !dbg !21
  %190 = load i32, i32* %189, align 4, !dbg !21
  %191 = getelementptr inbounds i32, i32* %1, i64 31, !dbg !24
  %192 = load i32, i32* %191, align 4, !dbg !24
  %193 = icmp ne i32 %190, %192, !dbg !25
  call void @llvm.dbg.value(metadata i32 32, metadata !17, metadata !DIExpression()), !dbg !19
  br i1 %193, label %13, label %194, !dbg !26

194:                                              ; preds = %188
  call void @llvm.dbg.value(metadata i32 32, metadata !17, metadata !DIExpression()), !dbg !19
  br label %13
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 !dbg !28 {
  %1 = alloca [32 x i32], align 16
  %2 = alloca [32 x i32], align 16
  call void @llvm.dbg.declare(metadata [32 x i32]* %1, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [32 x i32]* %2, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.value(metadata i32 0, metadata !38, metadata !DIExpression()), !dbg !40
  br label %3, !dbg !41

3:                                                ; preds = %0
  call void @llvm.dbg.value(metadata i64 0, metadata !38, metadata !DIExpression()), !dbg !40
  %4 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 0, !dbg !42
  store i32 0, i32* %4, align 4, !dbg !44
  %5 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 0, !dbg !45
  store i32 0, i32* %5, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 1, metadata !38, metadata !DIExpression()), !dbg !40
  %6 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 1, !dbg !42
  store i32 1, i32* %6, align 4, !dbg !44
  %7 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 1, !dbg !45
  store i32 1, i32* %7, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 2, metadata !38, metadata !DIExpression()), !dbg !40
  %8 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 2, !dbg !42
  store i32 2, i32* %8, align 4, !dbg !44
  %9 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 2, !dbg !45
  store i32 2, i32* %9, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 3, metadata !38, metadata !DIExpression()), !dbg !40
  %10 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 3, !dbg !42
  store i32 3, i32* %10, align 4, !dbg !44
  %11 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 3, !dbg !45
  store i32 3, i32* %11, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 4, metadata !38, metadata !DIExpression()), !dbg !40
  %12 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 4, !dbg !42
  store i32 4, i32* %12, align 4, !dbg !44
  %13 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 4, !dbg !45
  store i32 4, i32* %13, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 5, metadata !38, metadata !DIExpression()), !dbg !40
  %14 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 5, !dbg !42
  store i32 5, i32* %14, align 4, !dbg !44
  %15 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 5, !dbg !45
  store i32 5, i32* %15, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 6, metadata !38, metadata !DIExpression()), !dbg !40
  %16 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 6, !dbg !42
  store i32 6, i32* %16, align 4, !dbg !44
  %17 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 6, !dbg !45
  store i32 6, i32* %17, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 7, metadata !38, metadata !DIExpression()), !dbg !40
  %18 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 7, !dbg !42
  store i32 7, i32* %18, align 4, !dbg !44
  %19 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 7, !dbg !45
  store i32 7, i32* %19, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 8, metadata !38, metadata !DIExpression()), !dbg !40
  %20 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 8, !dbg !42
  store i32 8, i32* %20, align 4, !dbg !44
  %21 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 8, !dbg !45
  store i32 8, i32* %21, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 9, metadata !38, metadata !DIExpression()), !dbg !40
  %22 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 9, !dbg !42
  store i32 9, i32* %22, align 4, !dbg !44
  %23 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 9, !dbg !45
  store i32 9, i32* %23, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 10, metadata !38, metadata !DIExpression()), !dbg !40
  %24 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 10, !dbg !42
  store i32 10, i32* %24, align 4, !dbg !44
  %25 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 10, !dbg !45
  store i32 10, i32* %25, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 11, metadata !38, metadata !DIExpression()), !dbg !40
  %26 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 11, !dbg !42
  store i32 11, i32* %26, align 4, !dbg !44
  %27 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 11, !dbg !45
  store i32 11, i32* %27, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 12, metadata !38, metadata !DIExpression()), !dbg !40
  %28 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 12, !dbg !42
  store i32 12, i32* %28, align 4, !dbg !44
  %29 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 12, !dbg !45
  store i32 12, i32* %29, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 13, metadata !38, metadata !DIExpression()), !dbg !40
  %30 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 13, !dbg !42
  store i32 13, i32* %30, align 4, !dbg !44
  %31 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 13, !dbg !45
  store i32 13, i32* %31, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 14, metadata !38, metadata !DIExpression()), !dbg !40
  %32 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 14, !dbg !42
  store i32 14, i32* %32, align 4, !dbg !44
  %33 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 14, !dbg !45
  store i32 14, i32* %33, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 15, metadata !38, metadata !DIExpression()), !dbg !40
  %34 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 15, !dbg !42
  store i32 15, i32* %34, align 4, !dbg !44
  %35 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 15, !dbg !45
  store i32 15, i32* %35, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 16, metadata !38, metadata !DIExpression()), !dbg !40
  %36 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 16, !dbg !42
  store i32 16, i32* %36, align 4, !dbg !44
  %37 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 16, !dbg !45
  store i32 16, i32* %37, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 17, metadata !38, metadata !DIExpression()), !dbg !40
  %38 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 17, !dbg !42
  store i32 17, i32* %38, align 4, !dbg !44
  %39 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 17, !dbg !45
  store i32 17, i32* %39, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 18, metadata !38, metadata !DIExpression()), !dbg !40
  %40 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 18, !dbg !42
  store i32 18, i32* %40, align 4, !dbg !44
  %41 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 18, !dbg !45
  store i32 18, i32* %41, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 19, metadata !38, metadata !DIExpression()), !dbg !40
  %42 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 19, !dbg !42
  store i32 19, i32* %42, align 4, !dbg !44
  %43 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 19, !dbg !45
  store i32 19, i32* %43, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 20, metadata !38, metadata !DIExpression()), !dbg !40
  %44 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 20, !dbg !42
  store i32 20, i32* %44, align 4, !dbg !44
  %45 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 20, !dbg !45
  store i32 20, i32* %45, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 21, metadata !38, metadata !DIExpression()), !dbg !40
  %46 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 21, !dbg !42
  store i32 21, i32* %46, align 4, !dbg !44
  %47 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 21, !dbg !45
  store i32 21, i32* %47, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 22, metadata !38, metadata !DIExpression()), !dbg !40
  %48 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 22, !dbg !42
  store i32 22, i32* %48, align 4, !dbg !44
  %49 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 22, !dbg !45
  store i32 22, i32* %49, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 23, metadata !38, metadata !DIExpression()), !dbg !40
  %50 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 23, !dbg !42
  store i32 23, i32* %50, align 4, !dbg !44
  %51 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 23, !dbg !45
  store i32 23, i32* %51, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 24, metadata !38, metadata !DIExpression()), !dbg !40
  %52 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 24, !dbg !42
  store i32 24, i32* %52, align 4, !dbg !44
  %53 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 24, !dbg !45
  store i32 24, i32* %53, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 25, metadata !38, metadata !DIExpression()), !dbg !40
  %54 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 25, !dbg !42
  store i32 25, i32* %54, align 4, !dbg !44
  %55 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 25, !dbg !45
  store i32 25, i32* %55, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 26, metadata !38, metadata !DIExpression()), !dbg !40
  %56 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 26, !dbg !42
  store i32 26, i32* %56, align 4, !dbg !44
  %57 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 26, !dbg !45
  store i32 26, i32* %57, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 27, metadata !38, metadata !DIExpression()), !dbg !40
  %58 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 27, !dbg !42
  store i32 27, i32* %58, align 4, !dbg !44
  %59 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 27, !dbg !45
  store i32 27, i32* %59, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 28, metadata !38, metadata !DIExpression()), !dbg !40
  %60 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 28, !dbg !42
  store i32 28, i32* %60, align 4, !dbg !44
  %61 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 28, !dbg !45
  store i32 28, i32* %61, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 29, metadata !38, metadata !DIExpression()), !dbg !40
  %62 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 29, !dbg !42
  store i32 29, i32* %62, align 4, !dbg !44
  %63 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 29, !dbg !45
  store i32 29, i32* %63, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 30, metadata !38, metadata !DIExpression()), !dbg !40
  %64 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 30, !dbg !42
  store i32 30, i32* %64, align 4, !dbg !44
  %65 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 30, !dbg !45
  store i32 30, i32* %65, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 31, metadata !38, metadata !DIExpression()), !dbg !40
  %66 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 31, !dbg !42
  store i32 31, i32* %66, align 4, !dbg !44
  %67 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 31, !dbg !45
  store i32 31, i32* %67, align 4, !dbg !46
  call void @llvm.dbg.value(metadata i64 32, metadata !38, metadata !DIExpression()), !dbg !40
  %68 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 0, !dbg !47
  %69 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 0, !dbg !48
  %70 = call i32 @comp(i32* %68, i32* %69), !dbg !49
  call void @llvm.dbg.value(metadata i32 %70, metadata !50, metadata !DIExpression()), !dbg !51
  %71 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %70), !dbg !52
  ret i32 0, !dbg !53
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "comp/sources/comp1.c", directory: "/home/luigi/dev/ufmg/static-analysis/side-channel/lif/llvm/bench")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"PIE Level", i32 2}
!8 = !{!"clang version 10.0.0 "}
!9 = distinct !DISubprogram(name: "comp", scope: !1, file: !1, line: 5, type: !10, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !13, !13}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 5, type: !13)
!15 = !DILocation(line: 0, scope: !9)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 5, type: !13)
!17 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 6, type: !12)
!18 = distinct !DILexicalBlock(scope: !9, file: !1, line: 6, column: 5)
!19 = !DILocation(line: 0, scope: !18)
!20 = !DILocation(line: 6, column: 5, scope: !18)
!21 = !DILocation(line: 7, column: 13, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !1, line: 7, column: 13)
!23 = distinct !DILexicalBlock(scope: !18, file: !1, line: 6, column: 5)
!24 = !DILocation(line: 7, column: 21, scope: !22)
!25 = !DILocation(line: 7, column: 18, scope: !22)
!26 = !DILocation(line: 7, column: 13, scope: !23)
!27 = !DILocation(line: 9, column: 1, scope: !9)
!28 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 11, type: !29, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{!12}
!31 = !DILocalVariable(name: "a", scope: !28, file: !1, line: 12, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1024, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 32)
!35 = !DILocation(line: 12, column: 9, scope: !28)
!36 = !DILocalVariable(name: "b", scope: !28, file: !1, line: 12, type: !32)
!37 = !DILocation(line: 12, column: 15, scope: !28)
!38 = !DILocalVariable(name: "i", scope: !39, file: !1, line: 13, type: !12)
!39 = distinct !DILexicalBlock(scope: !28, file: !1, line: 13, column: 5)
!40 = !DILocation(line: 0, scope: !39)
!41 = !DILocation(line: 13, column: 5, scope: !39)
!42 = !DILocation(line: 13, column: 40, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !1, line: 13, column: 5)
!44 = !DILocation(line: 13, column: 45, scope: !43)
!45 = !DILocation(line: 13, column: 33, scope: !43)
!46 = !DILocation(line: 13, column: 38, scope: !43)
!47 = !DILocation(line: 14, column: 18, scope: !28)
!48 = !DILocation(line: 14, column: 21, scope: !28)
!49 = !DILocation(line: 14, column: 13, scope: !28)
!50 = !DILocalVariable(name: "r", scope: !28, file: !1, line: 14, type: !12)
!51 = !DILocation(line: 0, scope: !28)
!52 = !DILocation(line: 15, column: 5, scope: !28)
!53 = !DILocation(line: 16, column: 5, scope: !28)

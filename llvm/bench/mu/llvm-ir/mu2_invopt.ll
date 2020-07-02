; ModuleID = 'mu/llvm-ir/mu2.ll'
source_filename = "mu/sources/mu2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.a = private unnamed_addr constant [3 x i32] [i32 1, i32 3, i32 5], align 4
@.str = private unnamed_addr constant [10 x i8] c"%d\09%d\09%d\0A\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @mu(i32* %0, i64 %len.) #0 !dbg !9 {
  %2 = alloca [3 x i32], align 4
  call void @llvm.dbg.value(metadata i32* %0, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [3 x i32]* %2, metadata !20, metadata !DIExpression()), !dbg !24
  %3 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !25
  store i32 0, i32* %3, align 4, !dbg !26
  %4 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !27
  store i32 0, i32* %4, align 4, !dbg !28
  %5 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !29
  store i32 0, i32* %5, align 4, !dbg !30
  call void @llvm.dbg.value(metadata i32 0, metadata !31, metadata !DIExpression()), !dbg !19
  %6 = load i32, i32* %4, align 4, !dbg !32
  %7 = shl i32 %6, 1, !dbg !32
  store i32 %7, i32* %4, align 4, !dbg !32
  %8 = load i32, i32* %3, align 4, !dbg !36
  %9 = shl i32 %8, 1, !dbg !36
  store i32 %9, i32* %3, align 4, !dbg !36
  %10 = load i32, i32* %0, align 4, !dbg !37
  %11 = and i32 %10, 1, !dbg !39
  %12 = icmp ne i32 %11, 0, !dbg !39
  %13 = or i32 %9, 1, !dbg !40
  %select.val.399 = select i1 %12, i32 %13, i32 %9
  store i32 %select.val.399, i32* %3, align 4, !dbg !40
  %14 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !41
  %15 = load i32, i32* %14, align 4, !dbg !41
  %16 = and i32 %15, 1, !dbg !43
  %17 = icmp ne i32 %16, 0, !dbg !43
  %18 = load i32, i32* %4, align 4, !dbg !44
  %19 = or i32 %18, 1, !dbg !44
  %select.val.406 = select i1 %17, i32 %19, i32 %18
  store i32 %select.val.406, i32* %4, align 4, !dbg !44
  %20 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !45
  %21 = load i32, i32* %20, align 4, !dbg !45
  %22 = and i32 %21, 1, !dbg !47
  %23 = icmp ne i32 %22, 0, !dbg !47
  %24 = load i32, i32* %5, align 4, !dbg !48
  %25 = or i32 %24, 1, !dbg !48
  %select.val.413 = select i1 %23, i32 %25, i32 %24
  store i32 %select.val.413, i32* %5, align 4, !dbg !48
  %26 = load i32, i32* %0, align 4, !dbg !49
  %27 = ashr i32 %26, 1, !dbg !49
  store i32 %27, i32* %0, align 4, !dbg !49
  %28 = load i32, i32* %14, align 4, !dbg !50
  %29 = ashr i32 %28, 1, !dbg !50
  store i32 %29, i32* %14, align 4, !dbg !50
  %30 = load i32, i32* %20, align 4, !dbg !51
  %31 = ashr i32 %30, 1, !dbg !51
  store i32 %31, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 1, metadata !31, metadata !DIExpression()), !dbg !19
  %32 = load i32, i32* %5, align 4, !dbg !19
  %33 = shl i32 %32, 1, !dbg !52
  store i32 %33, i32* %5, align 4, !dbg !52
  %34 = load i32, i32* %4, align 4, !dbg !32
  %35 = shl i32 %34, 1, !dbg !32
  store i32 %35, i32* %4, align 4, !dbg !32
  %36 = load i32, i32* %3, align 4, !dbg !36
  %37 = shl i32 %36, 1, !dbg !36
  store i32 %37, i32* %3, align 4, !dbg !36
  %38 = load i32, i32* %0, align 4, !dbg !37
  %39 = and i32 %38, 1, !dbg !39
  %40 = icmp ne i32 %39, 0, !dbg !39
  %41 = or i32 %37, 1, !dbg !40
  %select.val.444 = select i1 %40, i32 %41, i32 %37
  store i32 %select.val.444, i32* %3, align 4, !dbg !40
  %42 = load i32, i32* %14, align 4, !dbg !41
  %43 = and i32 %42, 1, !dbg !43
  %44 = icmp ne i32 %43, 0, !dbg !43
  %45 = load i32, i32* %4, align 4, !dbg !44
  %46 = or i32 %45, 1, !dbg !44
  %select.val.451 = select i1 %44, i32 %46, i32 %45
  store i32 %select.val.451, i32* %4, align 4, !dbg !44
  %47 = load i32, i32* %20, align 4, !dbg !45
  %48 = and i32 %47, 1, !dbg !47
  %49 = icmp ne i32 %48, 0, !dbg !47
  %50 = load i32, i32* %5, align 4, !dbg !48
  %51 = or i32 %50, 1, !dbg !48
  %select.val.458 = select i1 %49, i32 %51, i32 %50
  store i32 %select.val.458, i32* %5, align 4, !dbg !48
  %52 = load i32, i32* %0, align 4, !dbg !49
  %53 = ashr i32 %52, 1, !dbg !49
  store i32 %53, i32* %0, align 4, !dbg !49
  %54 = load i32, i32* %14, align 4, !dbg !50
  %55 = ashr i32 %54, 1, !dbg !50
  store i32 %55, i32* %14, align 4, !dbg !50
  %56 = load i32, i32* %20, align 4, !dbg !51
  %57 = ashr i32 %56, 1, !dbg !51
  store i32 %57, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 2, metadata !31, metadata !DIExpression()), !dbg !19
  %58 = load i32, i32* %5, align 4, !dbg !19
  %59 = shl i32 %58, 1, !dbg !52
  store i32 %59, i32* %5, align 4, !dbg !52
  %60 = load i32, i32* %4, align 4, !dbg !32
  %61 = shl i32 %60, 1, !dbg !32
  store i32 %61, i32* %4, align 4, !dbg !32
  %62 = load i32, i32* %3, align 4, !dbg !36
  %63 = shl i32 %62, 1, !dbg !36
  store i32 %63, i32* %3, align 4, !dbg !36
  %64 = load i32, i32* %0, align 4, !dbg !37
  %65 = and i32 %64, 1, !dbg !39
  %66 = icmp ne i32 %65, 0, !dbg !39
  %67 = or i32 %63, 1, !dbg !40
  %select.val.489 = select i1 %66, i32 %67, i32 %63
  store i32 %select.val.489, i32* %3, align 4, !dbg !40
  %68 = load i32, i32* %14, align 4, !dbg !41
  %69 = and i32 %68, 1, !dbg !43
  %70 = icmp ne i32 %69, 0, !dbg !43
  %71 = load i32, i32* %4, align 4, !dbg !44
  %72 = or i32 %71, 1, !dbg !44
  %select.val.496 = select i1 %70, i32 %72, i32 %71
  store i32 %select.val.496, i32* %4, align 4, !dbg !44
  %73 = load i32, i32* %20, align 4, !dbg !45
  %74 = and i32 %73, 1, !dbg !47
  %75 = icmp ne i32 %74, 0, !dbg !47
  %76 = load i32, i32* %5, align 4, !dbg !48
  %77 = or i32 %76, 1, !dbg !48
  %select.val.503 = select i1 %75, i32 %77, i32 %76
  store i32 %select.val.503, i32* %5, align 4, !dbg !48
  %78 = load i32, i32* %0, align 4, !dbg !49
  %79 = ashr i32 %78, 1, !dbg !49
  store i32 %79, i32* %0, align 4, !dbg !49
  %80 = load i32, i32* %14, align 4, !dbg !50
  %81 = ashr i32 %80, 1, !dbg !50
  store i32 %81, i32* %14, align 4, !dbg !50
  %82 = load i32, i32* %20, align 4, !dbg !51
  %83 = ashr i32 %82, 1, !dbg !51
  store i32 %83, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 3, metadata !31, metadata !DIExpression()), !dbg !19
  %84 = load i32, i32* %5, align 4, !dbg !19
  %85 = shl i32 %84, 1, !dbg !52
  store i32 %85, i32* %5, align 4, !dbg !52
  %86 = load i32, i32* %4, align 4, !dbg !32
  %87 = shl i32 %86, 1, !dbg !32
  store i32 %87, i32* %4, align 4, !dbg !32
  %88 = load i32, i32* %3, align 4, !dbg !36
  %89 = shl i32 %88, 1, !dbg !36
  store i32 %89, i32* %3, align 4, !dbg !36
  %90 = load i32, i32* %0, align 4, !dbg !37
  %91 = and i32 %90, 1, !dbg !39
  %92 = icmp ne i32 %91, 0, !dbg !39
  %93 = or i32 %89, 1, !dbg !40
  %select.val.534 = select i1 %92, i32 %93, i32 %89
  store i32 %select.val.534, i32* %3, align 4, !dbg !40
  %94 = load i32, i32* %14, align 4, !dbg !41
  %95 = and i32 %94, 1, !dbg !43
  %96 = icmp ne i32 %95, 0, !dbg !43
  %97 = load i32, i32* %4, align 4, !dbg !44
  %98 = or i32 %97, 1, !dbg !44
  %select.val.541 = select i1 %96, i32 %98, i32 %97
  store i32 %select.val.541, i32* %4, align 4, !dbg !44
  %99 = load i32, i32* %20, align 4, !dbg !45
  %100 = and i32 %99, 1, !dbg !47
  %101 = icmp ne i32 %100, 0, !dbg !47
  %102 = load i32, i32* %5, align 4, !dbg !48
  %103 = or i32 %102, 1, !dbg !48
  %select.val.548 = select i1 %101, i32 %103, i32 %102
  store i32 %select.val.548, i32* %5, align 4, !dbg !48
  %104 = load i32, i32* %0, align 4, !dbg !49
  %105 = ashr i32 %104, 1, !dbg !49
  store i32 %105, i32* %0, align 4, !dbg !49
  %106 = load i32, i32* %14, align 4, !dbg !50
  %107 = ashr i32 %106, 1, !dbg !50
  store i32 %107, i32* %14, align 4, !dbg !50
  %108 = load i32, i32* %20, align 4, !dbg !51
  %109 = ashr i32 %108, 1, !dbg !51
  store i32 %109, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 4, metadata !31, metadata !DIExpression()), !dbg !19
  %110 = load i32, i32* %5, align 4, !dbg !19
  %111 = shl i32 %110, 1, !dbg !52
  store i32 %111, i32* %5, align 4, !dbg !52
  %112 = load i32, i32* %4, align 4, !dbg !32
  %113 = shl i32 %112, 1, !dbg !32
  store i32 %113, i32* %4, align 4, !dbg !32
  %114 = load i32, i32* %3, align 4, !dbg !36
  %115 = shl i32 %114, 1, !dbg !36
  store i32 %115, i32* %3, align 4, !dbg !36
  %116 = load i32, i32* %0, align 4, !dbg !37
  %117 = and i32 %116, 1, !dbg !39
  %118 = icmp ne i32 %117, 0, !dbg !39
  %119 = or i32 %115, 1, !dbg !40
  %select.val.579 = select i1 %118, i32 %119, i32 %115
  store i32 %select.val.579, i32* %3, align 4, !dbg !40
  %120 = load i32, i32* %14, align 4, !dbg !41
  %121 = and i32 %120, 1, !dbg !43
  %122 = icmp ne i32 %121, 0, !dbg !43
  %123 = load i32, i32* %4, align 4, !dbg !44
  %124 = or i32 %123, 1, !dbg !44
  %select.val.586 = select i1 %122, i32 %124, i32 %123
  store i32 %select.val.586, i32* %4, align 4, !dbg !44
  %125 = load i32, i32* %20, align 4, !dbg !45
  %126 = and i32 %125, 1, !dbg !47
  %127 = icmp ne i32 %126, 0, !dbg !47
  %128 = load i32, i32* %5, align 4, !dbg !48
  %129 = or i32 %128, 1, !dbg !48
  %select.val.593 = select i1 %127, i32 %129, i32 %128
  store i32 %select.val.593, i32* %5, align 4, !dbg !48
  %130 = load i32, i32* %0, align 4, !dbg !49
  %131 = ashr i32 %130, 1, !dbg !49
  store i32 %131, i32* %0, align 4, !dbg !49
  %132 = load i32, i32* %14, align 4, !dbg !50
  %133 = ashr i32 %132, 1, !dbg !50
  store i32 %133, i32* %14, align 4, !dbg !50
  %134 = load i32, i32* %20, align 4, !dbg !51
  %135 = ashr i32 %134, 1, !dbg !51
  store i32 %135, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 5, metadata !31, metadata !DIExpression()), !dbg !19
  %136 = load i32, i32* %5, align 4, !dbg !19
  %137 = shl i32 %136, 1, !dbg !52
  store i32 %137, i32* %5, align 4, !dbg !52
  %138 = load i32, i32* %4, align 4, !dbg !32
  %139 = shl i32 %138, 1, !dbg !32
  store i32 %139, i32* %4, align 4, !dbg !32
  %140 = load i32, i32* %3, align 4, !dbg !36
  %141 = shl i32 %140, 1, !dbg !36
  store i32 %141, i32* %3, align 4, !dbg !36
  %142 = load i32, i32* %0, align 4, !dbg !37
  %143 = and i32 %142, 1, !dbg !39
  %144 = icmp ne i32 %143, 0, !dbg !39
  %145 = or i32 %141, 1, !dbg !40
  %select.val.624 = select i1 %144, i32 %145, i32 %141
  store i32 %select.val.624, i32* %3, align 4, !dbg !40
  %146 = load i32, i32* %14, align 4, !dbg !41
  %147 = and i32 %146, 1, !dbg !43
  %148 = icmp ne i32 %147, 0, !dbg !43
  %149 = load i32, i32* %4, align 4, !dbg !44
  %150 = or i32 %149, 1, !dbg !44
  %select.val.631 = select i1 %148, i32 %150, i32 %149
  store i32 %select.val.631, i32* %4, align 4, !dbg !44
  %151 = load i32, i32* %20, align 4, !dbg !45
  %152 = and i32 %151, 1, !dbg !47
  %153 = icmp ne i32 %152, 0, !dbg !47
  %154 = load i32, i32* %5, align 4, !dbg !48
  %155 = or i32 %154, 1, !dbg !48
  %select.val.638 = select i1 %153, i32 %155, i32 %154
  store i32 %select.val.638, i32* %5, align 4, !dbg !48
  %156 = load i32, i32* %0, align 4, !dbg !49
  %157 = ashr i32 %156, 1, !dbg !49
  store i32 %157, i32* %0, align 4, !dbg !49
  %158 = load i32, i32* %14, align 4, !dbg !50
  %159 = ashr i32 %158, 1, !dbg !50
  store i32 %159, i32* %14, align 4, !dbg !50
  %160 = load i32, i32* %20, align 4, !dbg !51
  %161 = ashr i32 %160, 1, !dbg !51
  store i32 %161, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 6, metadata !31, metadata !DIExpression()), !dbg !19
  %162 = load i32, i32* %5, align 4, !dbg !19
  %163 = shl i32 %162, 1, !dbg !52
  store i32 %163, i32* %5, align 4, !dbg !52
  %164 = load i32, i32* %4, align 4, !dbg !32
  %165 = shl i32 %164, 1, !dbg !32
  store i32 %165, i32* %4, align 4, !dbg !32
  %166 = load i32, i32* %3, align 4, !dbg !36
  %167 = shl i32 %166, 1, !dbg !36
  store i32 %167, i32* %3, align 4, !dbg !36
  %168 = load i32, i32* %0, align 4, !dbg !37
  %169 = and i32 %168, 1, !dbg !39
  %170 = icmp ne i32 %169, 0, !dbg !39
  %171 = or i32 %167, 1, !dbg !40
  %select.val.669 = select i1 %170, i32 %171, i32 %167
  store i32 %select.val.669, i32* %3, align 4, !dbg !40
  %172 = load i32, i32* %14, align 4, !dbg !41
  %173 = and i32 %172, 1, !dbg !43
  %174 = icmp ne i32 %173, 0, !dbg !43
  %175 = load i32, i32* %4, align 4, !dbg !44
  %176 = or i32 %175, 1, !dbg !44
  %select.val.676 = select i1 %174, i32 %176, i32 %175
  store i32 %select.val.676, i32* %4, align 4, !dbg !44
  %177 = load i32, i32* %20, align 4, !dbg !45
  %178 = and i32 %177, 1, !dbg !47
  %179 = icmp ne i32 %178, 0, !dbg !47
  %180 = load i32, i32* %5, align 4, !dbg !48
  %181 = or i32 %180, 1, !dbg !48
  %select.val.683 = select i1 %179, i32 %181, i32 %180
  store i32 %select.val.683, i32* %5, align 4, !dbg !48
  %182 = load i32, i32* %0, align 4, !dbg !49
  %183 = ashr i32 %182, 1, !dbg !49
  store i32 %183, i32* %0, align 4, !dbg !49
  %184 = load i32, i32* %14, align 4, !dbg !50
  %185 = ashr i32 %184, 1, !dbg !50
  store i32 %185, i32* %14, align 4, !dbg !50
  %186 = load i32, i32* %20, align 4, !dbg !51
  %187 = ashr i32 %186, 1, !dbg !51
  store i32 %187, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 7, metadata !31, metadata !DIExpression()), !dbg !19
  %188 = load i32, i32* %5, align 4, !dbg !19
  %189 = shl i32 %188, 1, !dbg !52
  store i32 %189, i32* %5, align 4, !dbg !52
  %190 = load i32, i32* %4, align 4, !dbg !32
  %191 = shl i32 %190, 1, !dbg !32
  store i32 %191, i32* %4, align 4, !dbg !32
  %192 = load i32, i32* %3, align 4, !dbg !36
  %193 = shl i32 %192, 1, !dbg !36
  store i32 %193, i32* %3, align 4, !dbg !36
  %194 = load i32, i32* %0, align 4, !dbg !37
  %195 = and i32 %194, 1, !dbg !39
  %196 = icmp ne i32 %195, 0, !dbg !39
  %197 = or i32 %193, 1, !dbg !40
  %select.val.714 = select i1 %196, i32 %197, i32 %193
  store i32 %select.val.714, i32* %3, align 4, !dbg !40
  %198 = load i32, i32* %14, align 4, !dbg !41
  %199 = and i32 %198, 1, !dbg !43
  %200 = icmp ne i32 %199, 0, !dbg !43
  %201 = load i32, i32* %4, align 4, !dbg !44
  %202 = or i32 %201, 1, !dbg !44
  %select.val.721 = select i1 %200, i32 %202, i32 %201
  store i32 %select.val.721, i32* %4, align 4, !dbg !44
  %203 = load i32, i32* %20, align 4, !dbg !45
  %204 = and i32 %203, 1, !dbg !47
  %205 = icmp ne i32 %204, 0, !dbg !47
  %206 = load i32, i32* %5, align 4, !dbg !48
  %207 = or i32 %206, 1, !dbg !48
  %select.val.728 = select i1 %205, i32 %207, i32 %206
  store i32 %select.val.728, i32* %5, align 4, !dbg !48
  %208 = load i32, i32* %0, align 4, !dbg !49
  %209 = ashr i32 %208, 1, !dbg !49
  store i32 %209, i32* %0, align 4, !dbg !49
  %210 = load i32, i32* %14, align 4, !dbg !50
  %211 = ashr i32 %210, 1, !dbg !50
  store i32 %211, i32* %14, align 4, !dbg !50
  %212 = load i32, i32* %20, align 4, !dbg !51
  %213 = ashr i32 %212, 1, !dbg !51
  store i32 %213, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 8, metadata !31, metadata !DIExpression()), !dbg !19
  %214 = load i32, i32* %5, align 4, !dbg !19
  %215 = shl i32 %214, 1, !dbg !52
  store i32 %215, i32* %5, align 4, !dbg !52
  %216 = load i32, i32* %4, align 4, !dbg !32
  %217 = shl i32 %216, 1, !dbg !32
  store i32 %217, i32* %4, align 4, !dbg !32
  %218 = load i32, i32* %3, align 4, !dbg !36
  %219 = shl i32 %218, 1, !dbg !36
  store i32 %219, i32* %3, align 4, !dbg !36
  %220 = load i32, i32* %0, align 4, !dbg !37
  %221 = and i32 %220, 1, !dbg !39
  %222 = icmp ne i32 %221, 0, !dbg !39
  %223 = or i32 %219, 1, !dbg !40
  %select.val.759 = select i1 %222, i32 %223, i32 %219
  store i32 %select.val.759, i32* %3, align 4, !dbg !40
  %224 = load i32, i32* %14, align 4, !dbg !41
  %225 = and i32 %224, 1, !dbg !43
  %226 = icmp ne i32 %225, 0, !dbg !43
  %227 = load i32, i32* %4, align 4, !dbg !44
  %228 = or i32 %227, 1, !dbg !44
  %select.val.766 = select i1 %226, i32 %228, i32 %227
  store i32 %select.val.766, i32* %4, align 4, !dbg !44
  %229 = load i32, i32* %20, align 4, !dbg !45
  %230 = and i32 %229, 1, !dbg !47
  %231 = icmp ne i32 %230, 0, !dbg !47
  %232 = load i32, i32* %5, align 4, !dbg !48
  %233 = or i32 %232, 1, !dbg !48
  %select.val.773 = select i1 %231, i32 %233, i32 %232
  store i32 %select.val.773, i32* %5, align 4, !dbg !48
  %234 = load i32, i32* %0, align 4, !dbg !49
  %235 = ashr i32 %234, 1, !dbg !49
  store i32 %235, i32* %0, align 4, !dbg !49
  %236 = load i32, i32* %14, align 4, !dbg !50
  %237 = ashr i32 %236, 1, !dbg !50
  store i32 %237, i32* %14, align 4, !dbg !50
  %238 = load i32, i32* %20, align 4, !dbg !51
  %239 = ashr i32 %238, 1, !dbg !51
  store i32 %239, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 9, metadata !31, metadata !DIExpression()), !dbg !19
  %240 = load i32, i32* %5, align 4, !dbg !19
  %241 = shl i32 %240, 1, !dbg !52
  store i32 %241, i32* %5, align 4, !dbg !52
  %242 = load i32, i32* %4, align 4, !dbg !32
  %243 = shl i32 %242, 1, !dbg !32
  store i32 %243, i32* %4, align 4, !dbg !32
  %244 = load i32, i32* %3, align 4, !dbg !36
  %245 = shl i32 %244, 1, !dbg !36
  store i32 %245, i32* %3, align 4, !dbg !36
  %246 = load i32, i32* %0, align 4, !dbg !37
  %247 = and i32 %246, 1, !dbg !39
  %248 = icmp ne i32 %247, 0, !dbg !39
  %249 = or i32 %245, 1, !dbg !40
  %select.val.804 = select i1 %248, i32 %249, i32 %245
  store i32 %select.val.804, i32* %3, align 4, !dbg !40
  %250 = load i32, i32* %14, align 4, !dbg !41
  %251 = and i32 %250, 1, !dbg !43
  %252 = icmp ne i32 %251, 0, !dbg !43
  %253 = load i32, i32* %4, align 4, !dbg !44
  %254 = or i32 %253, 1, !dbg !44
  %select.val.811 = select i1 %252, i32 %254, i32 %253
  store i32 %select.val.811, i32* %4, align 4, !dbg !44
  %255 = load i32, i32* %20, align 4, !dbg !45
  %256 = and i32 %255, 1, !dbg !47
  %257 = icmp ne i32 %256, 0, !dbg !47
  %258 = load i32, i32* %5, align 4, !dbg !48
  %259 = or i32 %258, 1, !dbg !48
  %select.val.818 = select i1 %257, i32 %259, i32 %258
  store i32 %select.val.818, i32* %5, align 4, !dbg !48
  %260 = load i32, i32* %0, align 4, !dbg !49
  %261 = ashr i32 %260, 1, !dbg !49
  store i32 %261, i32* %0, align 4, !dbg !49
  %262 = load i32, i32* %14, align 4, !dbg !50
  %263 = ashr i32 %262, 1, !dbg !50
  store i32 %263, i32* %14, align 4, !dbg !50
  %264 = load i32, i32* %20, align 4, !dbg !51
  %265 = ashr i32 %264, 1, !dbg !51
  store i32 %265, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 10, metadata !31, metadata !DIExpression()), !dbg !19
  %266 = load i32, i32* %5, align 4, !dbg !19
  %267 = shl i32 %266, 1, !dbg !52
  store i32 %267, i32* %5, align 4, !dbg !52
  %268 = load i32, i32* %4, align 4, !dbg !32
  %269 = shl i32 %268, 1, !dbg !32
  store i32 %269, i32* %4, align 4, !dbg !32
  %270 = load i32, i32* %3, align 4, !dbg !36
  %271 = shl i32 %270, 1, !dbg !36
  store i32 %271, i32* %3, align 4, !dbg !36
  %272 = load i32, i32* %0, align 4, !dbg !37
  %273 = and i32 %272, 1, !dbg !39
  %274 = icmp ne i32 %273, 0, !dbg !39
  %275 = or i32 %271, 1, !dbg !40
  %select.val.849 = select i1 %274, i32 %275, i32 %271
  store i32 %select.val.849, i32* %3, align 4, !dbg !40
  %276 = load i32, i32* %14, align 4, !dbg !41
  %277 = and i32 %276, 1, !dbg !43
  %278 = icmp ne i32 %277, 0, !dbg !43
  %279 = load i32, i32* %4, align 4, !dbg !44
  %280 = or i32 %279, 1, !dbg !44
  %select.val.856 = select i1 %278, i32 %280, i32 %279
  store i32 %select.val.856, i32* %4, align 4, !dbg !44
  %281 = load i32, i32* %20, align 4, !dbg !45
  %282 = and i32 %281, 1, !dbg !47
  %283 = icmp ne i32 %282, 0, !dbg !47
  %284 = load i32, i32* %5, align 4, !dbg !48
  %285 = or i32 %284, 1, !dbg !48
  %select.val.863 = select i1 %283, i32 %285, i32 %284
  store i32 %select.val.863, i32* %5, align 4, !dbg !48
  %286 = load i32, i32* %0, align 4, !dbg !49
  %287 = ashr i32 %286, 1, !dbg !49
  store i32 %287, i32* %0, align 4, !dbg !49
  %288 = load i32, i32* %14, align 4, !dbg !50
  %289 = ashr i32 %288, 1, !dbg !50
  store i32 %289, i32* %14, align 4, !dbg !50
  %290 = load i32, i32* %20, align 4, !dbg !51
  %291 = ashr i32 %290, 1, !dbg !51
  store i32 %291, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 11, metadata !31, metadata !DIExpression()), !dbg !19
  %292 = load i32, i32* %5, align 4, !dbg !19
  %293 = shl i32 %292, 1, !dbg !52
  store i32 %293, i32* %5, align 4, !dbg !52
  %294 = load i32, i32* %4, align 4, !dbg !32
  %295 = shl i32 %294, 1, !dbg !32
  store i32 %295, i32* %4, align 4, !dbg !32
  %296 = load i32, i32* %3, align 4, !dbg !36
  %297 = shl i32 %296, 1, !dbg !36
  store i32 %297, i32* %3, align 4, !dbg !36
  %298 = load i32, i32* %0, align 4, !dbg !37
  %299 = and i32 %298, 1, !dbg !39
  %300 = icmp ne i32 %299, 0, !dbg !39
  %301 = or i32 %297, 1, !dbg !40
  %select.val.894 = select i1 %300, i32 %301, i32 %297
  store i32 %select.val.894, i32* %3, align 4, !dbg !40
  %302 = load i32, i32* %14, align 4, !dbg !41
  %303 = and i32 %302, 1, !dbg !43
  %304 = icmp ne i32 %303, 0, !dbg !43
  %305 = load i32, i32* %4, align 4, !dbg !44
  %306 = or i32 %305, 1, !dbg !44
  %select.val.901 = select i1 %304, i32 %306, i32 %305
  store i32 %select.val.901, i32* %4, align 4, !dbg !44
  %307 = load i32, i32* %20, align 4, !dbg !45
  %308 = and i32 %307, 1, !dbg !47
  %309 = icmp ne i32 %308, 0, !dbg !47
  %310 = load i32, i32* %5, align 4, !dbg !48
  %311 = or i32 %310, 1, !dbg !48
  %select.val.908 = select i1 %309, i32 %311, i32 %310
  store i32 %select.val.908, i32* %5, align 4, !dbg !48
  %312 = load i32, i32* %0, align 4, !dbg !49
  %313 = ashr i32 %312, 1, !dbg !49
  store i32 %313, i32* %0, align 4, !dbg !49
  %314 = load i32, i32* %14, align 4, !dbg !50
  %315 = ashr i32 %314, 1, !dbg !50
  store i32 %315, i32* %14, align 4, !dbg !50
  %316 = load i32, i32* %20, align 4, !dbg !51
  %317 = ashr i32 %316, 1, !dbg !51
  store i32 %317, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 12, metadata !31, metadata !DIExpression()), !dbg !19
  %318 = load i32, i32* %5, align 4, !dbg !19
  %319 = shl i32 %318, 1, !dbg !52
  store i32 %319, i32* %5, align 4, !dbg !52
  %320 = load i32, i32* %4, align 4, !dbg !32
  %321 = shl i32 %320, 1, !dbg !32
  store i32 %321, i32* %4, align 4, !dbg !32
  %322 = load i32, i32* %3, align 4, !dbg !36
  %323 = shl i32 %322, 1, !dbg !36
  store i32 %323, i32* %3, align 4, !dbg !36
  %324 = load i32, i32* %0, align 4, !dbg !37
  %325 = and i32 %324, 1, !dbg !39
  %326 = icmp ne i32 %325, 0, !dbg !39
  %327 = or i32 %323, 1, !dbg !40
  %select.val.939 = select i1 %326, i32 %327, i32 %323
  store i32 %select.val.939, i32* %3, align 4, !dbg !40
  %328 = load i32, i32* %14, align 4, !dbg !41
  %329 = and i32 %328, 1, !dbg !43
  %330 = icmp ne i32 %329, 0, !dbg !43
  %331 = load i32, i32* %4, align 4, !dbg !44
  %332 = or i32 %331, 1, !dbg !44
  %select.val.946 = select i1 %330, i32 %332, i32 %331
  store i32 %select.val.946, i32* %4, align 4, !dbg !44
  %333 = load i32, i32* %20, align 4, !dbg !45
  %334 = and i32 %333, 1, !dbg !47
  %335 = icmp ne i32 %334, 0, !dbg !47
  %336 = load i32, i32* %5, align 4, !dbg !48
  %337 = or i32 %336, 1, !dbg !48
  %select.val.953 = select i1 %335, i32 %337, i32 %336
  store i32 %select.val.953, i32* %5, align 4, !dbg !48
  %338 = load i32, i32* %0, align 4, !dbg !49
  %339 = ashr i32 %338, 1, !dbg !49
  store i32 %339, i32* %0, align 4, !dbg !49
  %340 = load i32, i32* %14, align 4, !dbg !50
  %341 = ashr i32 %340, 1, !dbg !50
  store i32 %341, i32* %14, align 4, !dbg !50
  %342 = load i32, i32* %20, align 4, !dbg !51
  %343 = ashr i32 %342, 1, !dbg !51
  store i32 %343, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 13, metadata !31, metadata !DIExpression()), !dbg !19
  %344 = load i32, i32* %5, align 4, !dbg !19
  %345 = shl i32 %344, 1, !dbg !52
  store i32 %345, i32* %5, align 4, !dbg !52
  %346 = load i32, i32* %4, align 4, !dbg !32
  %347 = shl i32 %346, 1, !dbg !32
  store i32 %347, i32* %4, align 4, !dbg !32
  %348 = load i32, i32* %3, align 4, !dbg !36
  %349 = shl i32 %348, 1, !dbg !36
  store i32 %349, i32* %3, align 4, !dbg !36
  %350 = load i32, i32* %0, align 4, !dbg !37
  %351 = and i32 %350, 1, !dbg !39
  %352 = icmp ne i32 %351, 0, !dbg !39
  %353 = or i32 %349, 1, !dbg !40
  %select.val.984 = select i1 %352, i32 %353, i32 %349
  store i32 %select.val.984, i32* %3, align 4, !dbg !40
  %354 = load i32, i32* %14, align 4, !dbg !41
  %355 = and i32 %354, 1, !dbg !43
  %356 = icmp ne i32 %355, 0, !dbg !43
  %357 = load i32, i32* %4, align 4, !dbg !44
  %358 = or i32 %357, 1, !dbg !44
  %select.val.991 = select i1 %356, i32 %358, i32 %357
  store i32 %select.val.991, i32* %4, align 4, !dbg !44
  %359 = load i32, i32* %20, align 4, !dbg !45
  %360 = and i32 %359, 1, !dbg !47
  %361 = icmp ne i32 %360, 0, !dbg !47
  %362 = load i32, i32* %5, align 4, !dbg !48
  %363 = or i32 %362, 1, !dbg !48
  %select.val.998 = select i1 %361, i32 %363, i32 %362
  store i32 %select.val.998, i32* %5, align 4, !dbg !48
  %364 = load i32, i32* %0, align 4, !dbg !49
  %365 = ashr i32 %364, 1, !dbg !49
  store i32 %365, i32* %0, align 4, !dbg !49
  %366 = load i32, i32* %14, align 4, !dbg !50
  %367 = ashr i32 %366, 1, !dbg !50
  store i32 %367, i32* %14, align 4, !dbg !50
  %368 = load i32, i32* %20, align 4, !dbg !51
  %369 = ashr i32 %368, 1, !dbg !51
  store i32 %369, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 14, metadata !31, metadata !DIExpression()), !dbg !19
  %370 = load i32, i32* %5, align 4, !dbg !19
  %371 = shl i32 %370, 1, !dbg !52
  store i32 %371, i32* %5, align 4, !dbg !52
  %372 = load i32, i32* %4, align 4, !dbg !32
  %373 = shl i32 %372, 1, !dbg !32
  store i32 %373, i32* %4, align 4, !dbg !32
  %374 = load i32, i32* %3, align 4, !dbg !36
  %375 = shl i32 %374, 1, !dbg !36
  store i32 %375, i32* %3, align 4, !dbg !36
  %376 = load i32, i32* %0, align 4, !dbg !37
  %377 = and i32 %376, 1, !dbg !39
  %378 = icmp ne i32 %377, 0, !dbg !39
  %379 = or i32 %375, 1, !dbg !40
  %select.val.1029 = select i1 %378, i32 %379, i32 %375
  store i32 %select.val.1029, i32* %3, align 4, !dbg !40
  %380 = load i32, i32* %14, align 4, !dbg !41
  %381 = and i32 %380, 1, !dbg !43
  %382 = icmp ne i32 %381, 0, !dbg !43
  %383 = load i32, i32* %4, align 4, !dbg !44
  %384 = or i32 %383, 1, !dbg !44
  %select.val.1036 = select i1 %382, i32 %384, i32 %383
  store i32 %select.val.1036, i32* %4, align 4, !dbg !44
  %385 = load i32, i32* %20, align 4, !dbg !45
  %386 = and i32 %385, 1, !dbg !47
  %387 = icmp ne i32 %386, 0, !dbg !47
  %388 = load i32, i32* %5, align 4, !dbg !48
  %389 = or i32 %388, 1, !dbg !48
  %select.val.1043 = select i1 %387, i32 %389, i32 %388
  store i32 %select.val.1043, i32* %5, align 4, !dbg !48
  %390 = load i32, i32* %0, align 4, !dbg !49
  %391 = ashr i32 %390, 1, !dbg !49
  store i32 %391, i32* %0, align 4, !dbg !49
  %392 = load i32, i32* %14, align 4, !dbg !50
  %393 = ashr i32 %392, 1, !dbg !50
  store i32 %393, i32* %14, align 4, !dbg !50
  %394 = load i32, i32* %20, align 4, !dbg !51
  %395 = ashr i32 %394, 1, !dbg !51
  store i32 %395, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 15, metadata !31, metadata !DIExpression()), !dbg !19
  %396 = load i32, i32* %5, align 4, !dbg !19
  %397 = shl i32 %396, 1, !dbg !52
  store i32 %397, i32* %5, align 4, !dbg !52
  %398 = load i32, i32* %4, align 4, !dbg !32
  %399 = shl i32 %398, 1, !dbg !32
  store i32 %399, i32* %4, align 4, !dbg !32
  %400 = load i32, i32* %3, align 4, !dbg !36
  %401 = shl i32 %400, 1, !dbg !36
  store i32 %401, i32* %3, align 4, !dbg !36
  %402 = load i32, i32* %0, align 4, !dbg !37
  %403 = and i32 %402, 1, !dbg !39
  %404 = icmp ne i32 %403, 0, !dbg !39
  %405 = or i32 %401, 1, !dbg !40
  %select.val.1074 = select i1 %404, i32 %405, i32 %401
  store i32 %select.val.1074, i32* %3, align 4, !dbg !40
  %406 = load i32, i32* %14, align 4, !dbg !41
  %407 = and i32 %406, 1, !dbg !43
  %408 = icmp ne i32 %407, 0, !dbg !43
  %409 = load i32, i32* %4, align 4, !dbg !44
  %410 = or i32 %409, 1, !dbg !44
  %select.val.1081 = select i1 %408, i32 %410, i32 %409
  store i32 %select.val.1081, i32* %4, align 4, !dbg !44
  %411 = load i32, i32* %20, align 4, !dbg !45
  %412 = and i32 %411, 1, !dbg !47
  %413 = icmp ne i32 %412, 0, !dbg !47
  %414 = load i32, i32* %5, align 4, !dbg !48
  %415 = or i32 %414, 1, !dbg !48
  %select.val.1088 = select i1 %413, i32 %415, i32 %414
  store i32 %select.val.1088, i32* %5, align 4, !dbg !48
  %416 = load i32, i32* %0, align 4, !dbg !49
  %417 = ashr i32 %416, 1, !dbg !49
  store i32 %417, i32* %0, align 4, !dbg !49
  %418 = load i32, i32* %14, align 4, !dbg !50
  %419 = ashr i32 %418, 1, !dbg !50
  store i32 %419, i32* %14, align 4, !dbg !50
  %420 = load i32, i32* %20, align 4, !dbg !51
  %421 = ashr i32 %420, 1, !dbg !51
  store i32 %421, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 16, metadata !31, metadata !DIExpression()), !dbg !19
  %422 = load i32, i32* %5, align 4, !dbg !19
  %423 = shl i32 %422, 1, !dbg !52
  store i32 %423, i32* %5, align 4, !dbg !52
  %424 = load i32, i32* %4, align 4, !dbg !32
  %425 = shl i32 %424, 1, !dbg !32
  store i32 %425, i32* %4, align 4, !dbg !32
  %426 = load i32, i32* %3, align 4, !dbg !36
  %427 = shl i32 %426, 1, !dbg !36
  store i32 %427, i32* %3, align 4, !dbg !36
  %428 = load i32, i32* %0, align 4, !dbg !37
  %429 = and i32 %428, 1, !dbg !39
  %430 = icmp ne i32 %429, 0, !dbg !39
  %431 = or i32 %427, 1, !dbg !40
  %select.val.1119 = select i1 %430, i32 %431, i32 %427
  store i32 %select.val.1119, i32* %3, align 4, !dbg !40
  %432 = load i32, i32* %14, align 4, !dbg !41
  %433 = and i32 %432, 1, !dbg !43
  %434 = icmp ne i32 %433, 0, !dbg !43
  %435 = load i32, i32* %4, align 4, !dbg !44
  %436 = or i32 %435, 1, !dbg !44
  %select.val.1126 = select i1 %434, i32 %436, i32 %435
  store i32 %select.val.1126, i32* %4, align 4, !dbg !44
  %437 = load i32, i32* %20, align 4, !dbg !45
  %438 = and i32 %437, 1, !dbg !47
  %439 = icmp ne i32 %438, 0, !dbg !47
  %440 = load i32, i32* %5, align 4, !dbg !48
  %441 = or i32 %440, 1, !dbg !48
  %select.val.1133 = select i1 %439, i32 %441, i32 %440
  store i32 %select.val.1133, i32* %5, align 4, !dbg !48
  %442 = load i32, i32* %0, align 4, !dbg !49
  %443 = ashr i32 %442, 1, !dbg !49
  store i32 %443, i32* %0, align 4, !dbg !49
  %444 = load i32, i32* %14, align 4, !dbg !50
  %445 = ashr i32 %444, 1, !dbg !50
  store i32 %445, i32* %14, align 4, !dbg !50
  %446 = load i32, i32* %20, align 4, !dbg !51
  %447 = ashr i32 %446, 1, !dbg !51
  store i32 %447, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 17, metadata !31, metadata !DIExpression()), !dbg !19
  %448 = load i32, i32* %5, align 4, !dbg !19
  %449 = shl i32 %448, 1, !dbg !52
  store i32 %449, i32* %5, align 4, !dbg !52
  %450 = load i32, i32* %4, align 4, !dbg !32
  %451 = shl i32 %450, 1, !dbg !32
  store i32 %451, i32* %4, align 4, !dbg !32
  %452 = load i32, i32* %3, align 4, !dbg !36
  %453 = shl i32 %452, 1, !dbg !36
  store i32 %453, i32* %3, align 4, !dbg !36
  %454 = load i32, i32* %0, align 4, !dbg !37
  %455 = and i32 %454, 1, !dbg !39
  %456 = icmp ne i32 %455, 0, !dbg !39
  %457 = or i32 %453, 1, !dbg !40
  %select.val.1164 = select i1 %456, i32 %457, i32 %453
  store i32 %select.val.1164, i32* %3, align 4, !dbg !40
  %458 = load i32, i32* %14, align 4, !dbg !41
  %459 = and i32 %458, 1, !dbg !43
  %460 = icmp ne i32 %459, 0, !dbg !43
  %461 = load i32, i32* %4, align 4, !dbg !44
  %462 = or i32 %461, 1, !dbg !44
  %select.val.1171 = select i1 %460, i32 %462, i32 %461
  store i32 %select.val.1171, i32* %4, align 4, !dbg !44
  %463 = load i32, i32* %20, align 4, !dbg !45
  %464 = and i32 %463, 1, !dbg !47
  %465 = icmp ne i32 %464, 0, !dbg !47
  %466 = load i32, i32* %5, align 4, !dbg !48
  %467 = or i32 %466, 1, !dbg !48
  %select.val.1178 = select i1 %465, i32 %467, i32 %466
  store i32 %select.val.1178, i32* %5, align 4, !dbg !48
  %468 = load i32, i32* %0, align 4, !dbg !49
  %469 = ashr i32 %468, 1, !dbg !49
  store i32 %469, i32* %0, align 4, !dbg !49
  %470 = load i32, i32* %14, align 4, !dbg !50
  %471 = ashr i32 %470, 1, !dbg !50
  store i32 %471, i32* %14, align 4, !dbg !50
  %472 = load i32, i32* %20, align 4, !dbg !51
  %473 = ashr i32 %472, 1, !dbg !51
  store i32 %473, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 18, metadata !31, metadata !DIExpression()), !dbg !19
  %474 = load i32, i32* %5, align 4, !dbg !19
  %475 = shl i32 %474, 1, !dbg !52
  store i32 %475, i32* %5, align 4, !dbg !52
  %476 = load i32, i32* %4, align 4, !dbg !32
  %477 = shl i32 %476, 1, !dbg !32
  store i32 %477, i32* %4, align 4, !dbg !32
  %478 = load i32, i32* %3, align 4, !dbg !36
  %479 = shl i32 %478, 1, !dbg !36
  store i32 %479, i32* %3, align 4, !dbg !36
  %480 = load i32, i32* %0, align 4, !dbg !37
  %481 = and i32 %480, 1, !dbg !39
  %482 = icmp ne i32 %481, 0, !dbg !39
  %483 = or i32 %479, 1, !dbg !40
  %select.val.1209 = select i1 %482, i32 %483, i32 %479
  store i32 %select.val.1209, i32* %3, align 4, !dbg !40
  %484 = load i32, i32* %14, align 4, !dbg !41
  %485 = and i32 %484, 1, !dbg !43
  %486 = icmp ne i32 %485, 0, !dbg !43
  %487 = load i32, i32* %4, align 4, !dbg !44
  %488 = or i32 %487, 1, !dbg !44
  %select.val.1216 = select i1 %486, i32 %488, i32 %487
  store i32 %select.val.1216, i32* %4, align 4, !dbg !44
  %489 = load i32, i32* %20, align 4, !dbg !45
  %490 = and i32 %489, 1, !dbg !47
  %491 = icmp ne i32 %490, 0, !dbg !47
  %492 = load i32, i32* %5, align 4, !dbg !48
  %493 = or i32 %492, 1, !dbg !48
  %select.val.1223 = select i1 %491, i32 %493, i32 %492
  store i32 %select.val.1223, i32* %5, align 4, !dbg !48
  %494 = load i32, i32* %0, align 4, !dbg !49
  %495 = ashr i32 %494, 1, !dbg !49
  store i32 %495, i32* %0, align 4, !dbg !49
  %496 = load i32, i32* %14, align 4, !dbg !50
  %497 = ashr i32 %496, 1, !dbg !50
  store i32 %497, i32* %14, align 4, !dbg !50
  %498 = load i32, i32* %20, align 4, !dbg !51
  %499 = ashr i32 %498, 1, !dbg !51
  store i32 %499, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 19, metadata !31, metadata !DIExpression()), !dbg !19
  %500 = load i32, i32* %5, align 4, !dbg !19
  %501 = shl i32 %500, 1, !dbg !52
  store i32 %501, i32* %5, align 4, !dbg !52
  %502 = load i32, i32* %4, align 4, !dbg !32
  %503 = shl i32 %502, 1, !dbg !32
  store i32 %503, i32* %4, align 4, !dbg !32
  %504 = load i32, i32* %3, align 4, !dbg !36
  %505 = shl i32 %504, 1, !dbg !36
  store i32 %505, i32* %3, align 4, !dbg !36
  %506 = load i32, i32* %0, align 4, !dbg !37
  %507 = and i32 %506, 1, !dbg !39
  %508 = icmp ne i32 %507, 0, !dbg !39
  %509 = or i32 %505, 1, !dbg !40
  %select.val.1254 = select i1 %508, i32 %509, i32 %505
  store i32 %select.val.1254, i32* %3, align 4, !dbg !40
  %510 = load i32, i32* %14, align 4, !dbg !41
  %511 = and i32 %510, 1, !dbg !43
  %512 = icmp ne i32 %511, 0, !dbg !43
  %513 = load i32, i32* %4, align 4, !dbg !44
  %514 = or i32 %513, 1, !dbg !44
  %select.val.1261 = select i1 %512, i32 %514, i32 %513
  store i32 %select.val.1261, i32* %4, align 4, !dbg !44
  %515 = load i32, i32* %20, align 4, !dbg !45
  %516 = and i32 %515, 1, !dbg !47
  %517 = icmp ne i32 %516, 0, !dbg !47
  %518 = load i32, i32* %5, align 4, !dbg !48
  %519 = or i32 %518, 1, !dbg !48
  %select.val.1268 = select i1 %517, i32 %519, i32 %518
  store i32 %select.val.1268, i32* %5, align 4, !dbg !48
  %520 = load i32, i32* %0, align 4, !dbg !49
  %521 = ashr i32 %520, 1, !dbg !49
  store i32 %521, i32* %0, align 4, !dbg !49
  %522 = load i32, i32* %14, align 4, !dbg !50
  %523 = ashr i32 %522, 1, !dbg !50
  store i32 %523, i32* %14, align 4, !dbg !50
  %524 = load i32, i32* %20, align 4, !dbg !51
  %525 = ashr i32 %524, 1, !dbg !51
  store i32 %525, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 20, metadata !31, metadata !DIExpression()), !dbg !19
  %526 = load i32, i32* %5, align 4, !dbg !19
  %527 = shl i32 %526, 1, !dbg !52
  store i32 %527, i32* %5, align 4, !dbg !52
  %528 = load i32, i32* %4, align 4, !dbg !32
  %529 = shl i32 %528, 1, !dbg !32
  store i32 %529, i32* %4, align 4, !dbg !32
  %530 = load i32, i32* %3, align 4, !dbg !36
  %531 = shl i32 %530, 1, !dbg !36
  store i32 %531, i32* %3, align 4, !dbg !36
  %532 = load i32, i32* %0, align 4, !dbg !37
  %533 = and i32 %532, 1, !dbg !39
  %534 = icmp ne i32 %533, 0, !dbg !39
  %535 = or i32 %531, 1, !dbg !40
  %select.val.1299 = select i1 %534, i32 %535, i32 %531
  store i32 %select.val.1299, i32* %3, align 4, !dbg !40
  %536 = load i32, i32* %14, align 4, !dbg !41
  %537 = and i32 %536, 1, !dbg !43
  %538 = icmp ne i32 %537, 0, !dbg !43
  %539 = load i32, i32* %4, align 4, !dbg !44
  %540 = or i32 %539, 1, !dbg !44
  %select.val.1306 = select i1 %538, i32 %540, i32 %539
  store i32 %select.val.1306, i32* %4, align 4, !dbg !44
  %541 = load i32, i32* %20, align 4, !dbg !45
  %542 = and i32 %541, 1, !dbg !47
  %543 = icmp ne i32 %542, 0, !dbg !47
  %544 = load i32, i32* %5, align 4, !dbg !48
  %545 = or i32 %544, 1, !dbg !48
  %select.val.1313 = select i1 %543, i32 %545, i32 %544
  store i32 %select.val.1313, i32* %5, align 4, !dbg !48
  %546 = load i32, i32* %0, align 4, !dbg !49
  %547 = ashr i32 %546, 1, !dbg !49
  store i32 %547, i32* %0, align 4, !dbg !49
  %548 = load i32, i32* %14, align 4, !dbg !50
  %549 = ashr i32 %548, 1, !dbg !50
  store i32 %549, i32* %14, align 4, !dbg !50
  %550 = load i32, i32* %20, align 4, !dbg !51
  %551 = ashr i32 %550, 1, !dbg !51
  store i32 %551, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 21, metadata !31, metadata !DIExpression()), !dbg !19
  %552 = load i32, i32* %5, align 4, !dbg !19
  %553 = shl i32 %552, 1, !dbg !52
  store i32 %553, i32* %5, align 4, !dbg !52
  %554 = load i32, i32* %4, align 4, !dbg !32
  %555 = shl i32 %554, 1, !dbg !32
  store i32 %555, i32* %4, align 4, !dbg !32
  %556 = load i32, i32* %3, align 4, !dbg !36
  %557 = shl i32 %556, 1, !dbg !36
  store i32 %557, i32* %3, align 4, !dbg !36
  %558 = load i32, i32* %0, align 4, !dbg !37
  %559 = and i32 %558, 1, !dbg !39
  %560 = icmp ne i32 %559, 0, !dbg !39
  %561 = or i32 %557, 1, !dbg !40
  %select.val.1344 = select i1 %560, i32 %561, i32 %557
  store i32 %select.val.1344, i32* %3, align 4, !dbg !40
  %562 = load i32, i32* %14, align 4, !dbg !41
  %563 = and i32 %562, 1, !dbg !43
  %564 = icmp ne i32 %563, 0, !dbg !43
  %565 = load i32, i32* %4, align 4, !dbg !44
  %566 = or i32 %565, 1, !dbg !44
  %select.val.1351 = select i1 %564, i32 %566, i32 %565
  store i32 %select.val.1351, i32* %4, align 4, !dbg !44
  %567 = load i32, i32* %20, align 4, !dbg !45
  %568 = and i32 %567, 1, !dbg !47
  %569 = icmp ne i32 %568, 0, !dbg !47
  %570 = load i32, i32* %5, align 4, !dbg !48
  %571 = or i32 %570, 1, !dbg !48
  %select.val.1358 = select i1 %569, i32 %571, i32 %570
  store i32 %select.val.1358, i32* %5, align 4, !dbg !48
  %572 = load i32, i32* %0, align 4, !dbg !49
  %573 = ashr i32 %572, 1, !dbg !49
  store i32 %573, i32* %0, align 4, !dbg !49
  %574 = load i32, i32* %14, align 4, !dbg !50
  %575 = ashr i32 %574, 1, !dbg !50
  store i32 %575, i32* %14, align 4, !dbg !50
  %576 = load i32, i32* %20, align 4, !dbg !51
  %577 = ashr i32 %576, 1, !dbg !51
  store i32 %577, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 22, metadata !31, metadata !DIExpression()), !dbg !19
  %578 = load i32, i32* %5, align 4, !dbg !19
  %579 = shl i32 %578, 1, !dbg !52
  store i32 %579, i32* %5, align 4, !dbg !52
  %580 = load i32, i32* %4, align 4, !dbg !32
  %581 = shl i32 %580, 1, !dbg !32
  store i32 %581, i32* %4, align 4, !dbg !32
  %582 = load i32, i32* %3, align 4, !dbg !36
  %583 = shl i32 %582, 1, !dbg !36
  store i32 %583, i32* %3, align 4, !dbg !36
  %584 = load i32, i32* %0, align 4, !dbg !37
  %585 = and i32 %584, 1, !dbg !39
  %586 = icmp ne i32 %585, 0, !dbg !39
  %587 = or i32 %583, 1, !dbg !40
  %select.val.1389 = select i1 %586, i32 %587, i32 %583
  store i32 %select.val.1389, i32* %3, align 4, !dbg !40
  %588 = load i32, i32* %14, align 4, !dbg !41
  %589 = and i32 %588, 1, !dbg !43
  %590 = icmp ne i32 %589, 0, !dbg !43
  %591 = load i32, i32* %4, align 4, !dbg !44
  %592 = or i32 %591, 1, !dbg !44
  %select.val.1396 = select i1 %590, i32 %592, i32 %591
  store i32 %select.val.1396, i32* %4, align 4, !dbg !44
  %593 = load i32, i32* %20, align 4, !dbg !45
  %594 = and i32 %593, 1, !dbg !47
  %595 = icmp ne i32 %594, 0, !dbg !47
  %596 = load i32, i32* %5, align 4, !dbg !48
  %597 = or i32 %596, 1, !dbg !48
  %select.val.1403 = select i1 %595, i32 %597, i32 %596
  store i32 %select.val.1403, i32* %5, align 4, !dbg !48
  %598 = load i32, i32* %0, align 4, !dbg !49
  %599 = ashr i32 %598, 1, !dbg !49
  store i32 %599, i32* %0, align 4, !dbg !49
  %600 = load i32, i32* %14, align 4, !dbg !50
  %601 = ashr i32 %600, 1, !dbg !50
  store i32 %601, i32* %14, align 4, !dbg !50
  %602 = load i32, i32* %20, align 4, !dbg !51
  %603 = ashr i32 %602, 1, !dbg !51
  store i32 %603, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 23, metadata !31, metadata !DIExpression()), !dbg !19
  %604 = load i32, i32* %5, align 4, !dbg !19
  %605 = shl i32 %604, 1, !dbg !52
  store i32 %605, i32* %5, align 4, !dbg !52
  %606 = load i32, i32* %4, align 4, !dbg !32
  %607 = shl i32 %606, 1, !dbg !32
  store i32 %607, i32* %4, align 4, !dbg !32
  %608 = load i32, i32* %3, align 4, !dbg !36
  %609 = shl i32 %608, 1, !dbg !36
  store i32 %609, i32* %3, align 4, !dbg !36
  %610 = load i32, i32* %0, align 4, !dbg !37
  %611 = and i32 %610, 1, !dbg !39
  %612 = icmp ne i32 %611, 0, !dbg !39
  %613 = or i32 %609, 1, !dbg !40
  %select.val.1434 = select i1 %612, i32 %613, i32 %609
  store i32 %select.val.1434, i32* %3, align 4, !dbg !40
  %614 = load i32, i32* %14, align 4, !dbg !41
  %615 = and i32 %614, 1, !dbg !43
  %616 = icmp ne i32 %615, 0, !dbg !43
  %617 = load i32, i32* %4, align 4, !dbg !44
  %618 = or i32 %617, 1, !dbg !44
  %select.val.1441 = select i1 %616, i32 %618, i32 %617
  store i32 %select.val.1441, i32* %4, align 4, !dbg !44
  %619 = load i32, i32* %20, align 4, !dbg !45
  %620 = and i32 %619, 1, !dbg !47
  %621 = icmp ne i32 %620, 0, !dbg !47
  %622 = load i32, i32* %5, align 4, !dbg !48
  %623 = or i32 %622, 1, !dbg !48
  %select.val.1448 = select i1 %621, i32 %623, i32 %622
  store i32 %select.val.1448, i32* %5, align 4, !dbg !48
  %624 = load i32, i32* %0, align 4, !dbg !49
  %625 = ashr i32 %624, 1, !dbg !49
  store i32 %625, i32* %0, align 4, !dbg !49
  %626 = load i32, i32* %14, align 4, !dbg !50
  %627 = ashr i32 %626, 1, !dbg !50
  store i32 %627, i32* %14, align 4, !dbg !50
  %628 = load i32, i32* %20, align 4, !dbg !51
  %629 = ashr i32 %628, 1, !dbg !51
  store i32 %629, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 24, metadata !31, metadata !DIExpression()), !dbg !19
  %630 = load i32, i32* %5, align 4, !dbg !19
  %631 = shl i32 %630, 1, !dbg !52
  store i32 %631, i32* %5, align 4, !dbg !52
  %632 = load i32, i32* %4, align 4, !dbg !32
  %633 = shl i32 %632, 1, !dbg !32
  store i32 %633, i32* %4, align 4, !dbg !32
  %634 = load i32, i32* %3, align 4, !dbg !36
  %635 = shl i32 %634, 1, !dbg !36
  store i32 %635, i32* %3, align 4, !dbg !36
  %636 = load i32, i32* %0, align 4, !dbg !37
  %637 = and i32 %636, 1, !dbg !39
  %638 = icmp ne i32 %637, 0, !dbg !39
  %639 = or i32 %635, 1, !dbg !40
  %select.val.1479 = select i1 %638, i32 %639, i32 %635
  store i32 %select.val.1479, i32* %3, align 4, !dbg !40
  %640 = load i32, i32* %14, align 4, !dbg !41
  %641 = and i32 %640, 1, !dbg !43
  %642 = icmp ne i32 %641, 0, !dbg !43
  %643 = load i32, i32* %4, align 4, !dbg !44
  %644 = or i32 %643, 1, !dbg !44
  %select.val.1486 = select i1 %642, i32 %644, i32 %643
  store i32 %select.val.1486, i32* %4, align 4, !dbg !44
  %645 = load i32, i32* %20, align 4, !dbg !45
  %646 = and i32 %645, 1, !dbg !47
  %647 = icmp ne i32 %646, 0, !dbg !47
  %648 = load i32, i32* %5, align 4, !dbg !48
  %649 = or i32 %648, 1, !dbg !48
  %select.val.1493 = select i1 %647, i32 %649, i32 %648
  store i32 %select.val.1493, i32* %5, align 4, !dbg !48
  %650 = load i32, i32* %0, align 4, !dbg !49
  %651 = ashr i32 %650, 1, !dbg !49
  store i32 %651, i32* %0, align 4, !dbg !49
  %652 = load i32, i32* %14, align 4, !dbg !50
  %653 = ashr i32 %652, 1, !dbg !50
  store i32 %653, i32* %14, align 4, !dbg !50
  %654 = load i32, i32* %20, align 4, !dbg !51
  %655 = ashr i32 %654, 1, !dbg !51
  store i32 %655, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 25, metadata !31, metadata !DIExpression()), !dbg !19
  %656 = load i32, i32* %5, align 4, !dbg !19
  %657 = shl i32 %656, 1, !dbg !52
  store i32 %657, i32* %5, align 4, !dbg !52
  %658 = load i32, i32* %4, align 4, !dbg !32
  %659 = shl i32 %658, 1, !dbg !32
  store i32 %659, i32* %4, align 4, !dbg !32
  %660 = load i32, i32* %3, align 4, !dbg !36
  %661 = shl i32 %660, 1, !dbg !36
  store i32 %661, i32* %3, align 4, !dbg !36
  %662 = load i32, i32* %0, align 4, !dbg !37
  %663 = and i32 %662, 1, !dbg !39
  %664 = icmp ne i32 %663, 0, !dbg !39
  %665 = or i32 %661, 1, !dbg !40
  %select.val.1524 = select i1 %664, i32 %665, i32 %661
  store i32 %select.val.1524, i32* %3, align 4, !dbg !40
  %666 = load i32, i32* %14, align 4, !dbg !41
  %667 = and i32 %666, 1, !dbg !43
  %668 = icmp ne i32 %667, 0, !dbg !43
  %669 = load i32, i32* %4, align 4, !dbg !44
  %670 = or i32 %669, 1, !dbg !44
  %select.val.1531 = select i1 %668, i32 %670, i32 %669
  store i32 %select.val.1531, i32* %4, align 4, !dbg !44
  %671 = load i32, i32* %20, align 4, !dbg !45
  %672 = and i32 %671, 1, !dbg !47
  %673 = icmp ne i32 %672, 0, !dbg !47
  %674 = load i32, i32* %5, align 4, !dbg !48
  %675 = or i32 %674, 1, !dbg !48
  %select.val.1538 = select i1 %673, i32 %675, i32 %674
  store i32 %select.val.1538, i32* %5, align 4, !dbg !48
  %676 = load i32, i32* %0, align 4, !dbg !49
  %677 = ashr i32 %676, 1, !dbg !49
  store i32 %677, i32* %0, align 4, !dbg !49
  %678 = load i32, i32* %14, align 4, !dbg !50
  %679 = ashr i32 %678, 1, !dbg !50
  store i32 %679, i32* %14, align 4, !dbg !50
  %680 = load i32, i32* %20, align 4, !dbg !51
  %681 = ashr i32 %680, 1, !dbg !51
  store i32 %681, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 26, metadata !31, metadata !DIExpression()), !dbg !19
  %682 = load i32, i32* %5, align 4, !dbg !19
  %683 = shl i32 %682, 1, !dbg !52
  store i32 %683, i32* %5, align 4, !dbg !52
  %684 = load i32, i32* %4, align 4, !dbg !32
  %685 = shl i32 %684, 1, !dbg !32
  store i32 %685, i32* %4, align 4, !dbg !32
  %686 = load i32, i32* %3, align 4, !dbg !36
  %687 = shl i32 %686, 1, !dbg !36
  store i32 %687, i32* %3, align 4, !dbg !36
  %688 = load i32, i32* %0, align 4, !dbg !37
  %689 = and i32 %688, 1, !dbg !39
  %690 = icmp ne i32 %689, 0, !dbg !39
  %691 = or i32 %687, 1, !dbg !40
  %select.val.1569 = select i1 %690, i32 %691, i32 %687
  store i32 %select.val.1569, i32* %3, align 4, !dbg !40
  %692 = load i32, i32* %14, align 4, !dbg !41
  %693 = and i32 %692, 1, !dbg !43
  %694 = icmp ne i32 %693, 0, !dbg !43
  %695 = load i32, i32* %4, align 4, !dbg !44
  %696 = or i32 %695, 1, !dbg !44
  %select.val.1576 = select i1 %694, i32 %696, i32 %695
  store i32 %select.val.1576, i32* %4, align 4, !dbg !44
  %697 = load i32, i32* %20, align 4, !dbg !45
  %698 = and i32 %697, 1, !dbg !47
  %699 = icmp ne i32 %698, 0, !dbg !47
  %700 = load i32, i32* %5, align 4, !dbg !48
  %701 = or i32 %700, 1, !dbg !48
  %select.val.1583 = select i1 %699, i32 %701, i32 %700
  store i32 %select.val.1583, i32* %5, align 4, !dbg !48
  %702 = load i32, i32* %0, align 4, !dbg !49
  %703 = ashr i32 %702, 1, !dbg !49
  store i32 %703, i32* %0, align 4, !dbg !49
  %704 = load i32, i32* %14, align 4, !dbg !50
  %705 = ashr i32 %704, 1, !dbg !50
  store i32 %705, i32* %14, align 4, !dbg !50
  %706 = load i32, i32* %20, align 4, !dbg !51
  %707 = ashr i32 %706, 1, !dbg !51
  store i32 %707, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 27, metadata !31, metadata !DIExpression()), !dbg !19
  %708 = load i32, i32* %5, align 4, !dbg !19
  %709 = shl i32 %708, 1, !dbg !52
  store i32 %709, i32* %5, align 4, !dbg !52
  %710 = load i32, i32* %4, align 4, !dbg !32
  %711 = shl i32 %710, 1, !dbg !32
  store i32 %711, i32* %4, align 4, !dbg !32
  %712 = load i32, i32* %3, align 4, !dbg !36
  %713 = shl i32 %712, 1, !dbg !36
  store i32 %713, i32* %3, align 4, !dbg !36
  %714 = load i32, i32* %0, align 4, !dbg !37
  %715 = and i32 %714, 1, !dbg !39
  %716 = icmp ne i32 %715, 0, !dbg !39
  %717 = or i32 %713, 1, !dbg !40
  %select.val.1614 = select i1 %716, i32 %717, i32 %713
  store i32 %select.val.1614, i32* %3, align 4, !dbg !40
  %718 = load i32, i32* %14, align 4, !dbg !41
  %719 = and i32 %718, 1, !dbg !43
  %720 = icmp ne i32 %719, 0, !dbg !43
  %721 = load i32, i32* %4, align 4, !dbg !44
  %722 = or i32 %721, 1, !dbg !44
  %select.val.1621 = select i1 %720, i32 %722, i32 %721
  store i32 %select.val.1621, i32* %4, align 4, !dbg !44
  %723 = load i32, i32* %20, align 4, !dbg !45
  %724 = and i32 %723, 1, !dbg !47
  %725 = icmp ne i32 %724, 0, !dbg !47
  %726 = load i32, i32* %5, align 4, !dbg !48
  %727 = or i32 %726, 1, !dbg !48
  %select.val.1628 = select i1 %725, i32 %727, i32 %726
  store i32 %select.val.1628, i32* %5, align 4, !dbg !48
  %728 = load i32, i32* %0, align 4, !dbg !49
  %729 = ashr i32 %728, 1, !dbg !49
  store i32 %729, i32* %0, align 4, !dbg !49
  %730 = load i32, i32* %14, align 4, !dbg !50
  %731 = ashr i32 %730, 1, !dbg !50
  store i32 %731, i32* %14, align 4, !dbg !50
  %732 = load i32, i32* %20, align 4, !dbg !51
  %733 = ashr i32 %732, 1, !dbg !51
  store i32 %733, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 28, metadata !31, metadata !DIExpression()), !dbg !19
  %734 = load i32, i32* %5, align 4, !dbg !19
  %735 = shl i32 %734, 1, !dbg !52
  store i32 %735, i32* %5, align 4, !dbg !52
  %736 = load i32, i32* %4, align 4, !dbg !32
  %737 = shl i32 %736, 1, !dbg !32
  store i32 %737, i32* %4, align 4, !dbg !32
  %738 = load i32, i32* %3, align 4, !dbg !36
  %739 = shl i32 %738, 1, !dbg !36
  store i32 %739, i32* %3, align 4, !dbg !36
  %740 = load i32, i32* %0, align 4, !dbg !37
  %741 = and i32 %740, 1, !dbg !39
  %742 = icmp ne i32 %741, 0, !dbg !39
  %743 = or i32 %739, 1, !dbg !40
  %select.val.1659 = select i1 %742, i32 %743, i32 %739
  store i32 %select.val.1659, i32* %3, align 4, !dbg !40
  %744 = load i32, i32* %14, align 4, !dbg !41
  %745 = and i32 %744, 1, !dbg !43
  %746 = icmp ne i32 %745, 0, !dbg !43
  %747 = load i32, i32* %4, align 4, !dbg !44
  %748 = or i32 %747, 1, !dbg !44
  %select.val.1666 = select i1 %746, i32 %748, i32 %747
  store i32 %select.val.1666, i32* %4, align 4, !dbg !44
  %749 = load i32, i32* %20, align 4, !dbg !45
  %750 = and i32 %749, 1, !dbg !47
  %751 = icmp ne i32 %750, 0, !dbg !47
  %752 = load i32, i32* %5, align 4, !dbg !48
  %753 = or i32 %752, 1, !dbg !48
  %select.val.1673 = select i1 %751, i32 %753, i32 %752
  store i32 %select.val.1673, i32* %5, align 4, !dbg !48
  %754 = load i32, i32* %0, align 4, !dbg !49
  %755 = ashr i32 %754, 1, !dbg !49
  store i32 %755, i32* %0, align 4, !dbg !49
  %756 = load i32, i32* %14, align 4, !dbg !50
  %757 = ashr i32 %756, 1, !dbg !50
  store i32 %757, i32* %14, align 4, !dbg !50
  %758 = load i32, i32* %20, align 4, !dbg !51
  %759 = ashr i32 %758, 1, !dbg !51
  store i32 %759, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 29, metadata !31, metadata !DIExpression()), !dbg !19
  %760 = load i32, i32* %5, align 4, !dbg !19
  %761 = shl i32 %760, 1, !dbg !52
  store i32 %761, i32* %5, align 4, !dbg !52
  %762 = load i32, i32* %4, align 4, !dbg !32
  %763 = shl i32 %762, 1, !dbg !32
  store i32 %763, i32* %4, align 4, !dbg !32
  %764 = load i32, i32* %3, align 4, !dbg !36
  %765 = shl i32 %764, 1, !dbg !36
  store i32 %765, i32* %3, align 4, !dbg !36
  %766 = load i32, i32* %0, align 4, !dbg !37
  %767 = and i32 %766, 1, !dbg !39
  %768 = icmp ne i32 %767, 0, !dbg !39
  %769 = or i32 %765, 1, !dbg !40
  %select.val.1704 = select i1 %768, i32 %769, i32 %765
  store i32 %select.val.1704, i32* %3, align 4, !dbg !40
  %770 = load i32, i32* %14, align 4, !dbg !41
  %771 = and i32 %770, 1, !dbg !43
  %772 = icmp ne i32 %771, 0, !dbg !43
  %773 = load i32, i32* %4, align 4, !dbg !44
  %774 = or i32 %773, 1, !dbg !44
  %select.val.1711 = select i1 %772, i32 %774, i32 %773
  store i32 %select.val.1711, i32* %4, align 4, !dbg !44
  %775 = load i32, i32* %20, align 4, !dbg !45
  %776 = and i32 %775, 1, !dbg !47
  %777 = icmp ne i32 %776, 0, !dbg !47
  %778 = load i32, i32* %5, align 4, !dbg !48
  %779 = or i32 %778, 1, !dbg !48
  %select.val.1718 = select i1 %777, i32 %779, i32 %778
  store i32 %select.val.1718, i32* %5, align 4, !dbg !48
  %780 = load i32, i32* %0, align 4, !dbg !49
  %781 = ashr i32 %780, 1, !dbg !49
  store i32 %781, i32* %0, align 4, !dbg !49
  %782 = load i32, i32* %14, align 4, !dbg !50
  %783 = ashr i32 %782, 1, !dbg !50
  store i32 %783, i32* %14, align 4, !dbg !50
  %784 = load i32, i32* %20, align 4, !dbg !51
  %785 = ashr i32 %784, 1, !dbg !51
  store i32 %785, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 30, metadata !31, metadata !DIExpression()), !dbg !19
  %786 = load i32, i32* %5, align 4, !dbg !19
  %787 = shl i32 %786, 1, !dbg !52
  store i32 %787, i32* %5, align 4, !dbg !52
  %788 = load i32, i32* %4, align 4, !dbg !32
  %789 = shl i32 %788, 1, !dbg !32
  store i32 %789, i32* %4, align 4, !dbg !32
  %790 = load i32, i32* %3, align 4, !dbg !36
  %791 = shl i32 %790, 1, !dbg !36
  store i32 %791, i32* %3, align 4, !dbg !36
  %792 = load i32, i32* %0, align 4, !dbg !37
  %793 = and i32 %792, 1, !dbg !39
  %794 = icmp ne i32 %793, 0, !dbg !39
  %795 = or i32 %791, 1, !dbg !40
  %select.val.1749 = select i1 %794, i32 %795, i32 %791
  store i32 %select.val.1749, i32* %3, align 4, !dbg !40
  %796 = load i32, i32* %14, align 4, !dbg !41
  %797 = and i32 %796, 1, !dbg !43
  %798 = icmp ne i32 %797, 0, !dbg !43
  %799 = load i32, i32* %4, align 4, !dbg !44
  %800 = or i32 %799, 1, !dbg !44
  %select.val.1756 = select i1 %798, i32 %800, i32 %799
  store i32 %select.val.1756, i32* %4, align 4, !dbg !44
  %801 = load i32, i32* %20, align 4, !dbg !45
  %802 = and i32 %801, 1, !dbg !47
  %803 = icmp ne i32 %802, 0, !dbg !47
  %804 = load i32, i32* %5, align 4, !dbg !48
  %805 = or i32 %804, 1, !dbg !48
  %select.val.1763 = select i1 %803, i32 %805, i32 %804
  store i32 %select.val.1763, i32* %5, align 4, !dbg !48
  %806 = load i32, i32* %0, align 4, !dbg !49
  %807 = ashr i32 %806, 1, !dbg !49
  store i32 %807, i32* %0, align 4, !dbg !49
  %808 = load i32, i32* %14, align 4, !dbg !50
  %809 = ashr i32 %808, 1, !dbg !50
  store i32 %809, i32* %14, align 4, !dbg !50
  %810 = load i32, i32* %20, align 4, !dbg !51
  %811 = ashr i32 %810, 1, !dbg !51
  store i32 %811, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 31, metadata !31, metadata !DIExpression()), !dbg !19
  %812 = load i32, i32* %5, align 4, !dbg !19
  %813 = shl i32 %812, 1, !dbg !52
  store i32 %813, i32* %5, align 4, !dbg !52
  %814 = load i32, i32* %4, align 4, !dbg !32
  %815 = shl i32 %814, 1, !dbg !32
  store i32 %815, i32* %4, align 4, !dbg !32
  %816 = load i32, i32* %3, align 4, !dbg !36
  %817 = shl i32 %816, 1, !dbg !36
  store i32 %817, i32* %3, align 4, !dbg !36
  %818 = load i32, i32* %0, align 4, !dbg !37
  %819 = and i32 %818, 1, !dbg !39
  %820 = icmp ne i32 %819, 0, !dbg !39
  %821 = or i32 %817, 1, !dbg !40
  %select.val.1794 = select i1 %820, i32 %821, i32 %817
  store i32 %select.val.1794, i32* %3, align 4, !dbg !40
  %822 = load i32, i32* %14, align 4, !dbg !41
  %823 = and i32 %822, 1, !dbg !43
  %824 = icmp ne i32 %823, 0, !dbg !43
  %825 = load i32, i32* %4, align 4, !dbg !44
  %826 = or i32 %825, 1, !dbg !44
  %select.val.1801 = select i1 %824, i32 %826, i32 %825
  store i32 %select.val.1801, i32* %4, align 4, !dbg !44
  %827 = load i32, i32* %20, align 4, !dbg !45
  %828 = and i32 %827, 1, !dbg !47
  %829 = icmp ne i32 %828, 0, !dbg !47
  %830 = load i32, i32* %5, align 4, !dbg !48
  %831 = or i32 %830, 1, !dbg !48
  %select.val.1808 = select i1 %829, i32 %831, i32 %830
  store i32 %select.val.1808, i32* %5, align 4, !dbg !48
  %832 = load i32, i32* %0, align 4, !dbg !49
  %833 = ashr i32 %832, 1, !dbg !49
  store i32 %833, i32* %0, align 4, !dbg !49
  %834 = load i32, i32* %14, align 4, !dbg !50
  %835 = ashr i32 %834, 1, !dbg !50
  store i32 %835, i32* %14, align 4, !dbg !50
  %836 = load i32, i32* %20, align 4, !dbg !51
  %837 = ashr i32 %836, 1, !dbg !51
  store i32 %837, i32* %20, align 4, !dbg !51
  call void @llvm.dbg.value(metadata i32 32, metadata !31, metadata !DIExpression()), !dbg !19
  %838 = load i32, i32* %5, align 4, !dbg !19
  store i32 %838, i32* %0, align 4, !dbg !53
  %839 = load i32, i32* %4, align 4, !dbg !54
  store i32 %839, i32* %14, align 4, !dbg !55
  %840 = load i32, i32* %3, align 4, !dbg !56
  store i32 %840, i32* %20, align 4, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 !dbg !59 {
  %1 = alloca [3 x i32], align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %1, metadata !62, metadata !DIExpression()), !dbg !64
  %2 = bitcast [3 x i32]* %1 to i8*, !dbg !64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 4 bitcast ([3 x i32]* @__const.main.a to i8*), i64 12, i1 false), !dbg !64
  %3 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 0, !dbg !65
  %4 = sext i32 3 to i64
  call void @mu(i32* %3, i64 %4), !dbg !66
  %5 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 0, !dbg !67
  %6 = load i32, i32* %5, align 4, !dbg !67
  %7 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 1, !dbg !68
  %8 = load i32, i32* %7, align 4, !dbg !68
  %9 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 2, !dbg !69
  %10 = load i32, i32* %9, align 4, !dbg !69
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %6, i32 %8, i32 %10), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "mu/sources/mu2.c", directory: "/home/luigi/dev/ufmg/static-analysis/side-channel/lif/llvm/bench")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"PIE Level", i32 2}
!8 = !{!"clang version 10.0.0 "}
!9 = distinct !DISubprogram(name: "mu", scope: !1, file: !1, line: 4, type: !10, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !14, line: 26, baseType: !15)
!14 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "")
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !16, line: 41, baseType: !17)
!16 = !DIFile(filename: "/usr/include/bits/types.h", directory: "")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 4, type: !12)
!19 = !DILocation(line: 0, scope: !9)
!20 = !DILocalVariable(name: "b", scope: !9, file: !1, line: 6, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 96, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 3)
!24 = !DILocation(line: 6, column: 13, scope: !9)
!25 = !DILocation(line: 7, column: 19, scope: !9)
!26 = !DILocation(line: 7, column: 24, scope: !9)
!27 = !DILocation(line: 7, column: 12, scope: !9)
!28 = !DILocation(line: 7, column: 17, scope: !9)
!29 = !DILocation(line: 7, column: 5, scope: !9)
!30 = !DILocation(line: 7, column: 10, scope: !9)
!31 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 5, type: !17)
!32 = !DILocation(line: 10, column: 14, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !1, line: 8, column: 30)
!34 = distinct !DILexicalBlock(scope: !35, file: !1, line: 8, column: 5)
!35 = distinct !DILexicalBlock(scope: !9, file: !1, line: 8, column: 5)
!36 = !DILocation(line: 11, column: 14, scope: !33)
!37 = !DILocation(line: 12, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !33, file: !1, line: 12, column: 13)
!39 = !DILocation(line: 12, column: 18, scope: !38)
!40 = !DILocation(line: 12, column: 28, scope: !38)
!41 = !DILocation(line: 13, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !33, file: !1, line: 13, column: 13)
!43 = !DILocation(line: 13, column: 18, scope: !42)
!44 = !DILocation(line: 13, column: 28, scope: !42)
!45 = !DILocation(line: 14, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !33, file: !1, line: 14, column: 13)
!47 = !DILocation(line: 14, column: 18, scope: !46)
!48 = !DILocation(line: 14, column: 28, scope: !46)
!49 = !DILocation(line: 15, column: 14, scope: !33)
!50 = !DILocation(line: 16, column: 14, scope: !33)
!51 = !DILocation(line: 17, column: 14, scope: !33)
!52 = !DILocation(line: 9, column: 14, scope: !33)
!53 = !DILocation(line: 19, column: 10, scope: !9)
!54 = !DILocation(line: 20, column: 12, scope: !9)
!55 = !DILocation(line: 20, column: 10, scope: !9)
!56 = !DILocation(line: 21, column: 12, scope: !9)
!57 = !DILocation(line: 21, column: 10, scope: !9)
!58 = !DILocation(line: 22, column: 1, scope: !9)
!59 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 24, type: !60, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!17}
!62 = !DILocalVariable(name: "a", scope: !59, file: !1, line: 25, type: !63)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 96, elements: !22)
!64 = !DILocation(line: 25, column: 9, scope: !59)
!65 = !DILocation(line: 26, column: 8, scope: !59)
!66 = !DILocation(line: 26, column: 5, scope: !59)
!67 = !DILocation(line: 27, column: 28, scope: !59)
!68 = !DILocation(line: 27, column: 34, scope: !59)
!69 = !DILocation(line: 27, column: 40, scope: !59)
!70 = !DILocation(line: 27, column: 5, scope: !59)
!71 = !DILocation(line: 28, column: 1, scope: !59)

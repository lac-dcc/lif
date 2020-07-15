; ModuleID = '3way/llvm-ir/main1.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.twy_ctx = type { [3 x i64], [3 x i64], [12 x i64], [12 x i64] }

@.str = private unnamed_addr constant [27 x i8] c"%20s : %08lx %08lx %08lx \0A\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"KEY = \00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"PLAIN = \00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"CIPHER = \00", align 1
@.str.5 = private unnamed_addr constant [42 x i8] c"Block %01d encrypts to %08lx %08lx %08lx\0A\00", align 1
@.str.6 = private unnamed_addr constant [42 x i8] c"Block %01d decrypts to %08lx %08lx %08lx\0A\00", align 1
@str = private unnamed_addr constant [11 x i8] c"**********\00", align 1

; Function Attrs: nofree noinline nounwind sspstrong uwtable
define dso_local void @printvec(i8* %0, i64* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds i64, i64* %1, i64 2
  %4 = load i64, i64* %3, align 8
  %5 = getelementptr inbounds i64, i64* %1, i64 1
  %6 = load i64, i64* %5, align 8
  %7 = load i64, i64* %1, align 8
  %8 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0), i8* %0, i64 %4, i64 %6, i64 %7)
  ret void
}

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nofree noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca %struct.twy_ctx, align 8
  %2 = alloca [9 x i64], align 16
  %3 = alloca [3 x i64], align 16
  %4 = getelementptr inbounds [3 x i64], [3 x i64]* %3, i64 0, i64 0
  %5 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 2
  %6 = bitcast [3 x i64]* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(24) %6, i8 0, i64 24, i1 false)
  store i64 1, i64* %5, align 16
  %7 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 1
  store i64 1, i64* %7, align 8
  %8 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 0
  store i64 1, i64* %8, align 16
  call void @twy_key(%struct.twy_ctx* nonnull %1, i64* nonnull %4)
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str, i64 0, i64 0))
  call void @printvec(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i64* nonnull %4)
  call void @printvec(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i64* nonnull %8)
  call void @encrypt(%struct.twy_ctx* nonnull %1, i64* nonnull %8)
  call void @printvec(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i64* nonnull %8)
  %9 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 0
  store i64 0, i64* %9, align 16
  %10 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 1
  store i64 1, i64* %10, align 8
  %11 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 2
  store i64 2, i64* %11, align 16
  %12 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 3
  store i64 3, i64* %12, align 8
  %13 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 4
  store i64 4, i64* %13, align 16
  %14 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 5
  store i64 5, i64* %14, align 8
  %15 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 6
  store i64 6, i64* %15, align 16
  %16 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 7
  store i64 7, i64* %16, align 8
  %17 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 8
  store i64 8, i64* %17, align 16
  call void @twy_enc(%struct.twy_ctx* nonnull %1, i64* nonnull %8, i32 3)
  %18 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 0
  %19 = load i64, i64* %18, align 16
  %20 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 1
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 2
  %23 = load i64, i64* %22, align 16
  %24 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.5, i64 0, i64 0), i32 0, i64 %19, i64 %21, i64 %23)
  %25 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 3
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 4
  %28 = load i64, i64* %27, align 16
  %29 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 5
  %30 = load i64, i64* %29, align 8
  %31 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.5, i64 0, i64 0), i32 1, i64 %26, i64 %28, i64 %30)
  %32 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 6
  %33 = load i64, i64* %32, align 16
  %34 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 7
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 8
  %37 = load i64, i64* %36, align 16
  %38 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.5, i64 0, i64 0), i32 2, i64 %33, i64 %35, i64 %37)
  call void @twy_dec(%struct.twy_ctx* nonnull %1, i64* nonnull %8, i32 2)
  %39 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 6
  call void @twy_dec(%struct.twy_ctx* nonnull %1, i64* nonnull %39, i32 1)
  %40 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 0
  %41 = load i64, i64* %40, align 16
  %42 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 1
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 2
  %45 = load i64, i64* %44, align 16
  %46 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.6, i64 0, i64 0), i32 0, i64 %41, i64 %43, i64 %45)
  %47 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 3
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 4
  %50 = load i64, i64* %49, align 16
  %51 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 5
  %52 = load i64, i64* %51, align 8
  %53 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.6, i64 0, i64 0), i32 1, i64 %48, i64 %50, i64 %52)
  %54 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 6
  %55 = load i64, i64* %54, align 16
  %56 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 7
  %57 = load i64, i64* %56, align 8
  %58 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 8
  %59 = load i64, i64* %58, align 16
  %60 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.6, i64 0, i64 0), i32 2, i64 %55, i64 %57, i64 %59)
  ret i32 0
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define dso_local void @mu(i64* %0) local_unnamed_addr #2 {
  %2 = load i64, i64* %0, align 8
  %3 = shl i64 %2, 2
  %4 = and i64 %3, 4
  %5 = getelementptr inbounds i64, i64* %0, i64 1
  %6 = load i64, i64* %5, align 8
  %7 = shl i64 %6, 2
  %8 = and i64 %7, 4
  %9 = getelementptr inbounds i64, i64* %0, i64 2
  %10 = load i64, i64* %9, align 8
  %11 = shl i64 %10, 2
  %12 = and i64 %11, 4
  %13 = lshr i64 %2, 1
  store i64 %13, i64* %0, align 8
  %14 = lshr i64 %6, 1
  store i64 %14, i64* %5, align 8
  %15 = lshr i64 %10, 1
  store i64 %15, i64* %9, align 8
  %16 = and i64 %2, 2
  %17 = or i64 %4, %16
  %18 = and i64 %6, 2
  %19 = or i64 %8, %18
  %20 = and i64 %10, 2
  %21 = or i64 %12, %20
  %22 = lshr i64 %2, 2
  store i64 %22, i64* %0, align 8
  %23 = lshr i64 %6, 2
  store i64 %23, i64* %5, align 8
  %24 = lshr i64 %10, 2
  store i64 %24, i64* %9, align 8
  %25 = lshr i64 %2, 3
  store i64 %25, i64* %0, align 8
  %26 = lshr i64 %6, 3
  store i64 %26, i64* %5, align 8
  %27 = lshr i64 %10, 3
  store i64 %27, i64* %9, align 8
  %28 = lshr i64 %2, 4
  store i64 %28, i64* %0, align 8
  %29 = lshr i64 %6, 4
  store i64 %29, i64* %5, align 8
  %30 = lshr i64 %10, 4
  store i64 %30, i64* %9, align 8
  %.mask = and i64 %10, 4
  %31 = lshr i64 %10, 2
  %32 = and i64 %31, 2
  %.mask240 = and i64 %6, 4
  %33 = lshr i64 %6, 2
  %34 = and i64 %33, 2
  %.mask241 = and i64 %2, 4
  %35 = lshr i64 %2, 2
  %36 = and i64 %35, 2
  %37 = lshr i64 %2, 4
  %38 = and i64 %37, 1
  %39 = or i64 %36, %.mask241
  %40 = or i64 %39, %38
  %41 = lshr i64 %6, 4
  %42 = and i64 %41, 1
  %43 = or i64 %34, %.mask240
  %44 = or i64 %43, %42
  %45 = lshr i64 %10, 4
  %46 = and i64 %45, 1
  %47 = or i64 %32, %.mask
  %48 = or i64 %47, %46
  %49 = lshr i64 %2, 5
  store i64 %49, i64* %0, align 8
  %50 = lshr i64 %6, 5
  store i64 %50, i64* %5, align 8
  %51 = lshr i64 %10, 5
  store i64 %51, i64* %9, align 8
  %52 = lshr i64 %2, 6
  store i64 %52, i64* %0, align 8
  %53 = lshr i64 %6, 6
  store i64 %53, i64* %5, align 8
  %54 = lshr i64 %10, 6
  store i64 %54, i64* %9, align 8
  %55 = shl nuw nsw i64 %21, 4
  %56 = shl nuw nsw i64 %48, 2
  %57 = or i64 %55, %56
  %58 = lshr i64 %10, 4
  %59 = and i64 %58, 2
  %60 = shl nuw nsw i64 %19, 4
  %61 = shl nuw nsw i64 %44, 2
  %62 = or i64 %60, %61
  %63 = lshr i64 %6, 4
  %64 = and i64 %63, 2
  %65 = shl nuw nsw i64 %17, 4
  %66 = shl nuw nsw i64 %40, 2
  %67 = or i64 %65, %66
  %68 = lshr i64 %2, 4
  %69 = and i64 %68, 2
  %70 = lshr i64 %2, 6
  %71 = and i64 %70, 1
  %72 = or i64 %71, %69
  %73 = or i64 %72, %67
  %74 = lshr i64 %6, 6
  %75 = and i64 %74, 1
  %76 = or i64 %75, %64
  %77 = or i64 %76, %62
  %78 = lshr i64 %10, 6
  %79 = and i64 %78, 1
  %80 = or i64 %79, %59
  %81 = or i64 %80, %57
  %82 = lshr i64 %2, 7
  store i64 %82, i64* %0, align 8
  %83 = lshr i64 %6, 7
  store i64 %83, i64* %5, align 8
  %84 = lshr i64 %10, 7
  store i64 %84, i64* %9, align 8
  %85 = lshr i64 %2, 8
  store i64 %85, i64* %0, align 8
  %86 = lshr i64 %6, 8
  store i64 %86, i64* %5, align 8
  %87 = lshr i64 %10, 8
  store i64 %87, i64* %9, align 8
  %88 = lshr i64 %10, 6
  %89 = and i64 %88, 2
  %90 = lshr i64 %6, 6
  %91 = and i64 %90, 2
  %92 = lshr i64 %2, 6
  %93 = and i64 %92, 2
  %94 = lshr i64 %2, 8
  %95 = and i64 %94, 1
  %96 = or i64 %95, %93
  %97 = lshr i64 %6, 8
  %98 = and i64 %97, 1
  %99 = or i64 %98, %91
  %100 = lshr i64 %10, 8
  %101 = and i64 %100, 1
  %102 = or i64 %101, %89
  %103 = lshr i64 %2, 9
  store i64 %103, i64* %0, align 8
  %104 = lshr i64 %6, 9
  store i64 %104, i64* %5, align 8
  %105 = lshr i64 %10, 9
  store i64 %105, i64* %9, align 8
  %106 = lshr i64 %2, 10
  store i64 %106, i64* %0, align 8
  %107 = lshr i64 %6, 10
  store i64 %107, i64* %5, align 8
  %108 = lshr i64 %10, 10
  store i64 %108, i64* %9, align 8
  %109 = shl nuw nsw i64 %81, 4
  %110 = shl nuw nsw i64 %102, 2
  %111 = or i64 %109, %110
  %112 = lshr i64 %10, 8
  %113 = and i64 %112, 2
  %114 = shl nuw nsw i64 %77, 4
  %115 = shl nuw nsw i64 %99, 2
  %116 = or i64 %114, %115
  %117 = lshr i64 %6, 8
  %118 = and i64 %117, 2
  %119 = shl nuw nsw i64 %73, 4
  %120 = shl nuw nsw i64 %96, 2
  %121 = or i64 %119, %120
  %122 = lshr i64 %2, 8
  %123 = and i64 %122, 2
  %124 = lshr i64 %2, 10
  %125 = and i64 %124, 1
  %126 = or i64 %125, %123
  %127 = or i64 %126, %121
  %128 = lshr i64 %6, 10
  %129 = and i64 %128, 1
  %130 = or i64 %129, %118
  %131 = or i64 %130, %116
  %132 = lshr i64 %10, 10
  %133 = and i64 %132, 1
  %134 = or i64 %133, %113
  %135 = or i64 %134, %111
  %136 = lshr i64 %2, 11
  store i64 %136, i64* %0, align 8
  %137 = lshr i64 %6, 11
  store i64 %137, i64* %5, align 8
  %138 = lshr i64 %10, 11
  store i64 %138, i64* %9, align 8
  %139 = lshr i64 %2, 12
  store i64 %139, i64* %0, align 8
  %140 = lshr i64 %6, 12
  store i64 %140, i64* %5, align 8
  %141 = lshr i64 %10, 12
  store i64 %141, i64* %9, align 8
  %142 = lshr i64 %10, 10
  %143 = and i64 %142, 2
  %144 = lshr i64 %6, 10
  %145 = and i64 %144, 2
  %146 = lshr i64 %2, 10
  %147 = and i64 %146, 2
  %148 = lshr i64 %2, 12
  %149 = and i64 %148, 1
  %150 = or i64 %149, %147
  %151 = lshr i64 %6, 12
  %152 = and i64 %151, 1
  %153 = or i64 %152, %145
  %154 = lshr i64 %10, 12
  %155 = and i64 %154, 1
  %156 = or i64 %155, %143
  %157 = lshr i64 %2, 13
  store i64 %157, i64* %0, align 8
  %158 = lshr i64 %6, 13
  store i64 %158, i64* %5, align 8
  %159 = lshr i64 %10, 13
  store i64 %159, i64* %9, align 8
  %160 = lshr i64 %2, 14
  store i64 %160, i64* %0, align 8
  %161 = lshr i64 %6, 14
  store i64 %161, i64* %5, align 8
  %162 = lshr i64 %10, 14
  store i64 %162, i64* %9, align 8
  %163 = shl i64 %135, 4
  %164 = shl nuw nsw i64 %156, 2
  %165 = or i64 %163, %164
  %166 = lshr i64 %10, 12
  %167 = and i64 %166, 2
  %168 = shl i64 %131, 4
  %169 = shl nuw nsw i64 %153, 2
  %170 = or i64 %168, %169
  %171 = lshr i64 %6, 12
  %172 = and i64 %171, 2
  %173 = shl i64 %127, 4
  %174 = shl nuw nsw i64 %150, 2
  %175 = or i64 %173, %174
  %176 = lshr i64 %2, 12
  %177 = and i64 %176, 2
  %178 = lshr i64 %2, 14
  %179 = and i64 %178, 1
  %180 = or i64 %179, %177
  %181 = or i64 %180, %175
  %182 = lshr i64 %6, 14
  %183 = and i64 %182, 1
  %184 = or i64 %183, %172
  %185 = or i64 %184, %170
  %186 = lshr i64 %10, 14
  %187 = and i64 %186, 1
  %188 = or i64 %187, %167
  %189 = or i64 %188, %165
  %190 = lshr i64 %2, 15
  store i64 %190, i64* %0, align 8
  %191 = lshr i64 %6, 15
  store i64 %191, i64* %5, align 8
  %192 = lshr i64 %10, 15
  store i64 %192, i64* %9, align 8
  %193 = lshr i64 %2, 16
  store i64 %193, i64* %0, align 8
  %194 = lshr i64 %6, 16
  store i64 %194, i64* %5, align 8
  %195 = lshr i64 %10, 16
  store i64 %195, i64* %9, align 8
  %196 = lshr i64 %10, 14
  %197 = and i64 %196, 2
  %198 = lshr i64 %6, 14
  %199 = and i64 %198, 2
  %200 = lshr i64 %2, 14
  %201 = and i64 %200, 2
  %202 = lshr i64 %2, 16
  %203 = and i64 %202, 1
  %204 = or i64 %203, %201
  %205 = lshr i64 %6, 16
  %206 = and i64 %205, 1
  %207 = or i64 %206, %199
  %208 = lshr i64 %10, 16
  %209 = and i64 %208, 1
  %210 = or i64 %209, %197
  %211 = lshr i64 %2, 17
  store i64 %211, i64* %0, align 8
  %212 = lshr i64 %6, 17
  store i64 %212, i64* %5, align 8
  %213 = lshr i64 %10, 17
  store i64 %213, i64* %9, align 8
  %214 = lshr i64 %2, 18
  store i64 %214, i64* %0, align 8
  %215 = lshr i64 %6, 18
  store i64 %215, i64* %5, align 8
  %216 = lshr i64 %10, 18
  store i64 %216, i64* %9, align 8
  %217 = shl i64 %189, 4
  %218 = shl nuw nsw i64 %210, 2
  %219 = or i64 %217, %218
  %220 = lshr i64 %10, 16
  %221 = and i64 %220, 2
  %222 = shl i64 %185, 4
  %223 = shl nuw nsw i64 %207, 2
  %224 = or i64 %222, %223
  %225 = lshr i64 %6, 16
  %226 = and i64 %225, 2
  %227 = shl i64 %181, 4
  %228 = shl nuw nsw i64 %204, 2
  %229 = or i64 %227, %228
  %230 = lshr i64 %2, 16
  %231 = and i64 %230, 2
  %232 = lshr i64 %2, 18
  %233 = and i64 %232, 1
  %234 = or i64 %233, %231
  %235 = or i64 %234, %229
  %236 = lshr i64 %6, 18
  %237 = and i64 %236, 1
  %238 = or i64 %237, %226
  %239 = or i64 %238, %224
  %240 = lshr i64 %10, 18
  %241 = and i64 %240, 1
  %242 = or i64 %241, %221
  %243 = or i64 %242, %219
  %244 = lshr i64 %2, 19
  store i64 %244, i64* %0, align 8
  %245 = lshr i64 %6, 19
  store i64 %245, i64* %5, align 8
  %246 = lshr i64 %10, 19
  store i64 %246, i64* %9, align 8
  %247 = lshr i64 %2, 20
  store i64 %247, i64* %0, align 8
  %248 = lshr i64 %6, 20
  store i64 %248, i64* %5, align 8
  %249 = lshr i64 %10, 20
  store i64 %249, i64* %9, align 8
  %250 = lshr i64 %10, 18
  %251 = and i64 %250, 2
  %252 = lshr i64 %6, 18
  %253 = and i64 %252, 2
  %254 = lshr i64 %2, 18
  %255 = and i64 %254, 2
  %256 = lshr i64 %2, 20
  %257 = and i64 %256, 1
  %258 = or i64 %257, %255
  %259 = lshr i64 %6, 20
  %260 = and i64 %259, 1
  %261 = or i64 %260, %253
  %262 = lshr i64 %10, 20
  %263 = and i64 %262, 1
  %264 = or i64 %263, %251
  %265 = lshr i64 %2, 21
  store i64 %265, i64* %0, align 8
  %266 = lshr i64 %6, 21
  store i64 %266, i64* %5, align 8
  %267 = lshr i64 %10, 21
  store i64 %267, i64* %9, align 8
  %268 = lshr i64 %2, 22
  store i64 %268, i64* %0, align 8
  %269 = lshr i64 %6, 22
  store i64 %269, i64* %5, align 8
  %270 = lshr i64 %10, 22
  store i64 %270, i64* %9, align 8
  %271 = shl i64 %243, 4
  %272 = shl nuw nsw i64 %264, 2
  %273 = or i64 %271, %272
  %274 = lshr i64 %10, 20
  %275 = and i64 %274, 2
  %276 = shl i64 %239, 4
  %277 = shl nuw nsw i64 %261, 2
  %278 = or i64 %276, %277
  %279 = lshr i64 %6, 20
  %280 = and i64 %279, 2
  %281 = shl i64 %235, 4
  %282 = shl nuw nsw i64 %258, 2
  %283 = or i64 %281, %282
  %284 = lshr i64 %2, 20
  %285 = and i64 %284, 2
  %286 = lshr i64 %2, 22
  %287 = and i64 %286, 1
  %288 = or i64 %287, %285
  %289 = or i64 %288, %283
  %290 = lshr i64 %6, 22
  %291 = and i64 %290, 1
  %292 = or i64 %291, %280
  %293 = or i64 %292, %278
  %294 = lshr i64 %10, 22
  %295 = and i64 %294, 1
  %296 = or i64 %295, %275
  %297 = or i64 %296, %273
  %298 = lshr i64 %2, 23
  store i64 %298, i64* %0, align 8
  %299 = lshr i64 %6, 23
  store i64 %299, i64* %5, align 8
  %300 = lshr i64 %10, 23
  store i64 %300, i64* %9, align 8
  %301 = lshr i64 %2, 24
  store i64 %301, i64* %0, align 8
  %302 = lshr i64 %6, 24
  store i64 %302, i64* %5, align 8
  %303 = lshr i64 %10, 24
  store i64 %303, i64* %9, align 8
  %304 = lshr i64 %10, 22
  %305 = and i64 %304, 2
  %306 = lshr i64 %6, 22
  %307 = and i64 %306, 2
  %308 = lshr i64 %2, 22
  %309 = and i64 %308, 2
  %310 = lshr i64 %2, 24
  %311 = and i64 %310, 1
  %312 = or i64 %311, %309
  %313 = lshr i64 %6, 24
  %314 = and i64 %313, 1
  %315 = or i64 %314, %307
  %316 = lshr i64 %10, 24
  %317 = and i64 %316, 1
  %318 = or i64 %317, %305
  %319 = lshr i64 %2, 25
  store i64 %319, i64* %0, align 8
  %320 = lshr i64 %6, 25
  store i64 %320, i64* %5, align 8
  %321 = lshr i64 %10, 25
  store i64 %321, i64* %9, align 8
  %322 = lshr i64 %2, 26
  store i64 %322, i64* %0, align 8
  %323 = lshr i64 %6, 26
  store i64 %323, i64* %5, align 8
  %324 = lshr i64 %10, 26
  store i64 %324, i64* %9, align 8
  %325 = shl i64 %297, 4
  %326 = shl nuw nsw i64 %318, 2
  %327 = or i64 %325, %326
  %328 = lshr i64 %10, 24
  %329 = and i64 %328, 2
  %330 = shl i64 %293, 4
  %331 = shl nuw nsw i64 %315, 2
  %332 = or i64 %330, %331
  %333 = lshr i64 %6, 24
  %334 = and i64 %333, 2
  %335 = shl i64 %289, 4
  %336 = shl nuw nsw i64 %312, 2
  %337 = or i64 %335, %336
  %338 = lshr i64 %2, 24
  %339 = and i64 %338, 2
  %340 = lshr i64 %2, 26
  %341 = and i64 %340, 1
  %342 = or i64 %341, %339
  %343 = or i64 %342, %337
  %344 = lshr i64 %6, 26
  %345 = and i64 %344, 1
  %346 = or i64 %345, %334
  %347 = or i64 %346, %332
  %348 = lshr i64 %10, 26
  %349 = and i64 %348, 1
  %350 = or i64 %349, %329
  %351 = or i64 %350, %327
  %352 = lshr i64 %2, 27
  store i64 %352, i64* %0, align 8
  %353 = lshr i64 %6, 27
  store i64 %353, i64* %5, align 8
  %354 = lshr i64 %10, 27
  store i64 %354, i64* %9, align 8
  %355 = lshr i64 %2, 28
  store i64 %355, i64* %0, align 8
  %356 = lshr i64 %6, 28
  store i64 %356, i64* %5, align 8
  %357 = lshr i64 %10, 28
  store i64 %357, i64* %9, align 8
  %358 = lshr i64 %10, 26
  %359 = and i64 %358, 2
  %360 = lshr i64 %6, 26
  %361 = and i64 %360, 2
  %362 = lshr i64 %2, 26
  %363 = and i64 %362, 2
  %364 = lshr i64 %2, 28
  %365 = and i64 %364, 1
  %366 = or i64 %365, %363
  %367 = lshr i64 %6, 28
  %368 = and i64 %367, 1
  %369 = or i64 %368, %361
  %370 = lshr i64 %10, 28
  %371 = and i64 %370, 1
  %372 = or i64 %371, %359
  %373 = lshr i64 %2, 29
  store i64 %373, i64* %0, align 8
  %374 = lshr i64 %6, 29
  store i64 %374, i64* %5, align 8
  %375 = lshr i64 %10, 29
  store i64 %375, i64* %9, align 8
  %376 = lshr i64 %2, 30
  store i64 %376, i64* %0, align 8
  %377 = lshr i64 %6, 30
  store i64 %377, i64* %5, align 8
  %378 = lshr i64 %10, 30
  store i64 %378, i64* %9, align 8
  %379 = shl i64 %351, 4
  %380 = shl nuw nsw i64 %372, 2
  %381 = or i64 %379, %380
  %382 = lshr i64 %10, 28
  %383 = and i64 %382, 2
  %384 = shl i64 %347, 4
  %385 = shl nuw nsw i64 %369, 2
  %386 = or i64 %384, %385
  %387 = lshr i64 %6, 28
  %388 = and i64 %387, 2
  %389 = shl i64 %343, 4
  %390 = shl nuw nsw i64 %366, 2
  %391 = or i64 %389, %390
  %392 = lshr i64 %2, 28
  %393 = and i64 %392, 2
  %394 = lshr i64 %2, 30
  %395 = and i64 %394, 1
  %396 = or i64 %395, %393
  %397 = or i64 %396, %391
  %398 = lshr i64 %6, 30
  %399 = and i64 %398, 1
  %400 = or i64 %399, %388
  %401 = or i64 %400, %386
  %402 = lshr i64 %10, 30
  %403 = and i64 %402, 1
  %404 = or i64 %403, %383
  %405 = or i64 %404, %381
  %406 = lshr i64 %2, 31
  store i64 %406, i64* %0, align 8
  %407 = lshr i64 %6, 31
  store i64 %407, i64* %5, align 8
  %408 = lshr i64 %10, 31
  store i64 %408, i64* %9, align 8
  %409 = shl i64 %405, 1
  %410 = shl i64 %401, 1
  %411 = shl i64 %397, 1
  %412 = lshr i64 %2, 31
  %413 = and i64 %412, 1
  %414 = or i64 %411, %413
  %415 = lshr i64 %6, 31
  %416 = and i64 %415, 1
  %417 = or i64 %410, %416
  %418 = lshr i64 %10, 31
  %419 = and i64 %418, 1
  %420 = or i64 %409, %419
  %421 = lshr i64 %2, 32
  store i64 %421, i64* %0, align 8
  %422 = lshr i64 %6, 32
  store i64 %422, i64* %5, align 8
  %423 = lshr i64 %10, 32
  store i64 %423, i64* %9, align 8
  store i64 %420, i64* %0, align 8
  store i64 %417, i64* %5, align 8
  store i64 %414, i64* %9, align 8
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define dso_local void @gamma_(i64* nocapture %0) local_unnamed_addr #2 {
  %2 = load i64, i64* %0, align 8
  %3 = getelementptr inbounds i64, i64* %0, i64 1
  %4 = load i64, i64* %3, align 8
  %5 = getelementptr inbounds i64, i64* %0, i64 2
  %6 = load i64, i64* %5, align 8
  %7 = xor i64 %6, -1
  %8 = or i64 %4, %7
  %9 = xor i64 %8, %2
  %10 = xor i64 %2, -1
  %11 = or i64 %6, %10
  %12 = xor i64 %11, %4
  %13 = xor i64 %4, -1
  %14 = or i64 %2, %13
  %15 = xor i64 %6, %14
  store i64 %9, i64* %0, align 8
  store i64 %12, i64* %3, align 8
  store i64 %15, i64* %5, align 8
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define dso_local void @theta(i64* nocapture %0) local_unnamed_addr #2 {
  %2 = load i64, i64* %0, align 8
  %3 = lshr i64 %2, 16
  %4 = xor i64 %3, %2
  %5 = getelementptr inbounds i64, i64* %0, i64 1
  %6 = load i64, i64* %5, align 8
  %7 = shl i64 %6, 16
  %8 = lshr i64 %6, 16
  %9 = getelementptr inbounds i64, i64* %0, i64 2
  %10 = load i64, i64* %9, align 8
  %11 = shl i64 %10, 16
  %12 = lshr i64 %6, 24
  %13 = shl i64 %10, 8
  %14 = lshr i64 %10, 8
  %15 = shl i64 %2, 24
  %16 = lshr i64 %10, 16
  %17 = shl i64 %2, 16
  %18 = lshr i64 %10, 24
  %19 = shl i64 %2, 8
  %20 = xor i64 %4, %15
  %21 = xor i64 %20, %17
  %22 = xor i64 %21, %19
  %23 = xor i64 %22, %7
  %24 = xor i64 %23, %8
  %25 = xor i64 %24, %12
  %26 = xor i64 %25, %11
  %27 = xor i64 %26, %13
  %28 = xor i64 %27, %14
  %29 = xor i64 %28, %16
  %30 = xor i64 %29, %18
  %31 = lshr i64 %2, 8
  %32 = shl i64 %6, 24
  %33 = lshr i64 %2, 24
  %34 = shl i64 %6, 8
  %35 = xor i64 %17, %6
  %36 = xor i64 %35, %19
  %37 = xor i64 %36, %31
  %38 = xor i64 %37, %3
  %39 = xor i64 %38, %33
  %40 = xor i64 %39, %8
  %41 = xor i64 %40, %32
  %42 = xor i64 %41, %7
  %43 = xor i64 %42, %34
  %44 = xor i64 %43, %11
  %45 = xor i64 %44, %16
  %46 = xor i64 %45, %18
  %47 = lshr i64 %6, 8
  %48 = shl i64 %10, 24
  %49 = xor i64 %3, %17
  %50 = xor i64 %49, %33
  %51 = xor i64 %50, %10
  %52 = xor i64 %51, %7
  %53 = xor i64 %52, %34
  %54 = xor i64 %53, %47
  %55 = xor i64 %54, %8
  %56 = xor i64 %55, %12
  %57 = xor i64 %56, %16
  %58 = xor i64 %57, %48
  %59 = xor i64 %58, %11
  %60 = xor i64 %59, %13
  store i64 %30, i64* %0, align 8
  store i64 %46, i64* %5, align 8
  store i64 %60, i64* %9, align 8
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define dso_local void @pi_1(i64* nocapture %0) local_unnamed_addr #2 {
  %2 = load i64, i64* %0, align 8
  %3 = lshr i64 %2, 10
  %4 = shl i64 %2, 22
  %5 = xor i64 %3, %4
  store i64 %5, i64* %0, align 8
  %6 = getelementptr inbounds i64, i64* %0, i64 2
  %7 = load i64, i64* %6, align 8
  %8 = shl i64 %7, 1
  %9 = lshr i64 %7, 31
  %10 = xor i64 %8, %9
  store i64 %10, i64* %6, align 8
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define dso_local void @pi_2(i64* nocapture %0) local_unnamed_addr #2 {
  %2 = load i64, i64* %0, align 8
  %3 = shl i64 %2, 1
  %4 = lshr i64 %2, 31
  %5 = xor i64 %3, %4
  store i64 %5, i64* %0, align 8
  %6 = getelementptr inbounds i64, i64* %0, i64 2
  %7 = load i64, i64* %6, align 8
  %8 = lshr i64 %7, 10
  %9 = shl i64 %7, 22
  %10 = xor i64 %8, %9
  store i64 %10, i64* %6, align 8
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define dso_local void @rho(i64* nocapture %0) local_unnamed_addr #2 {
  call void @theta(i64* %0)
  call void @pi_1(i64* %0)
  call void @gamma_(i64* %0)
  call void @pi_2(i64* %0)
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable writeonly
define dso_local void @rndcon_gen(i64 %0, i64* nocapture %1) local_unnamed_addr #3 {
  store i64 %0, i64* %1, align 8
  %3 = shl i64 %0, 1
  %4 = trunc i64 %0 to i16
  %5 = icmp slt i16 %4, 0
  %6 = xor i64 %3, 69649
  %spec.select = select i1 %5, i64 %6, i64 %3
  %7 = getelementptr inbounds i64, i64* %1, i64 1
  store i64 %spec.select, i64* %7, align 8
  %8 = shl i64 %spec.select, 1
  %9 = trunc i64 %spec.select to i16
  %10 = icmp slt i16 %9, 0
  %11 = xor i64 %8, 69649
  %spec.select.1 = select i1 %10, i64 %11, i64 %8
  %12 = getelementptr inbounds i64, i64* %1, i64 2
  store i64 %spec.select.1, i64* %12, align 8
  %13 = shl i64 %spec.select.1, 1
  %14 = trunc i64 %spec.select.1 to i16
  %15 = icmp slt i16 %14, 0
  %16 = xor i64 %13, 69649
  %spec.select.2 = select i1 %15, i64 %16, i64 %13
  %17 = getelementptr inbounds i64, i64* %1, i64 3
  store i64 %spec.select.2, i64* %17, align 8
  %18 = shl i64 %spec.select.2, 1
  %19 = trunc i64 %spec.select.2 to i16
  %20 = icmp slt i16 %19, 0
  %21 = xor i64 %18, 69649
  %spec.select.3 = select i1 %20, i64 %21, i64 %18
  %22 = getelementptr inbounds i64, i64* %1, i64 4
  store i64 %spec.select.3, i64* %22, align 8
  %23 = shl i64 %spec.select.3, 1
  %24 = trunc i64 %spec.select.3 to i16
  %25 = icmp slt i16 %24, 0
  %26 = xor i64 %23, 69649
  %spec.select.4 = select i1 %25, i64 %26, i64 %23
  %27 = getelementptr inbounds i64, i64* %1, i64 5
  store i64 %spec.select.4, i64* %27, align 8
  %28 = shl i64 %spec.select.4, 1
  %29 = trunc i64 %spec.select.4 to i16
  %30 = icmp slt i16 %29, 0
  %31 = xor i64 %28, 69649
  %spec.select.5 = select i1 %30, i64 %31, i64 %28
  %32 = getelementptr inbounds i64, i64* %1, i64 6
  store i64 %spec.select.5, i64* %32, align 8
  %33 = shl i64 %spec.select.5, 1
  %34 = trunc i64 %spec.select.5 to i16
  %35 = icmp slt i16 %34, 0
  %36 = xor i64 %33, 69649
  %spec.select.6 = select i1 %35, i64 %36, i64 %33
  %37 = getelementptr inbounds i64, i64* %1, i64 7
  store i64 %spec.select.6, i64* %37, align 8
  %38 = shl i64 %spec.select.6, 1
  %39 = trunc i64 %spec.select.6 to i16
  %40 = icmp slt i16 %39, 0
  %41 = xor i64 %38, 69649
  %spec.select.7 = select i1 %40, i64 %41, i64 %38
  %42 = getelementptr inbounds i64, i64* %1, i64 8
  store i64 %spec.select.7, i64* %42, align 8
  %43 = shl i64 %spec.select.7, 1
  %44 = trunc i64 %spec.select.7 to i16
  %45 = icmp slt i16 %44, 0
  %46 = xor i64 %43, 69649
  %spec.select.8 = select i1 %45, i64 %46, i64 %43
  %47 = getelementptr inbounds i64, i64* %1, i64 9
  store i64 %spec.select.8, i64* %47, align 8
  %48 = shl i64 %spec.select.8, 1
  %49 = trunc i64 %spec.select.8 to i16
  %50 = icmp slt i16 %49, 0
  %51 = xor i64 %48, 69649
  %spec.select.9 = select i1 %50, i64 %51, i64 %48
  %52 = getelementptr inbounds i64, i64* %1, i64 10
  store i64 %spec.select.9, i64* %52, align 8
  %53 = shl i64 %spec.select.9, 1
  %54 = trunc i64 %spec.select.9 to i16
  %55 = icmp slt i16 %54, 0
  %56 = xor i64 %53, 69649
  %spec.select.10 = select i1 %55, i64 %56, i64 %53
  %57 = getelementptr inbounds i64, i64* %1, i64 11
  store i64 %spec.select.10, i64* %57, align 8
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define dso_local void @encrypt(%struct.twy_ctx* nocapture readonly %0, i64* %1) local_unnamed_addr #2 {
  %3 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 0, i64 0
  %4 = load i64, i64* %3, align 8
  %5 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 0
  %6 = load i64, i64* %5, align 8
  %7 = shl i64 %6, 16
  %8 = xor i64 %7, %4
  %9 = load i64, i64* %1, align 8
  %10 = xor i64 %8, %9
  store i64 %10, i64* %1, align 8
  %11 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 0, i64 1
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds i64, i64* %1, i64 1
  %14 = load i64, i64* %13, align 8
  %15 = xor i64 %14, %12
  store i64 %15, i64* %13, align 8
  %16 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 0, i64 2
  %17 = load i64, i64* %16, align 8
  %18 = load i64, i64* %5, align 8
  %19 = xor i64 %18, %17
  %20 = getelementptr inbounds i64, i64* %1, i64 2
  %21 = load i64, i64* %20, align 8
  %22 = xor i64 %19, %21
  store i64 %22, i64* %20, align 8
  call void @rho(i64* %1)
  %23 = load i64, i64* %3, align 8
  %24 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 1
  %25 = load i64, i64* %24, align 8
  %26 = shl i64 %25, 16
  %27 = xor i64 %26, %23
  %28 = load i64, i64* %1, align 8
  %29 = xor i64 %27, %28
  store i64 %29, i64* %1, align 8
  %30 = load i64, i64* %11, align 8
  %31 = load i64, i64* %13, align 8
  %32 = xor i64 %31, %30
  store i64 %32, i64* %13, align 8
  %33 = load i64, i64* %16, align 8
  %34 = load i64, i64* %24, align 8
  %35 = xor i64 %34, %33
  %36 = load i64, i64* %20, align 8
  %37 = xor i64 %35, %36
  store i64 %37, i64* %20, align 8
  call void @rho(i64* %1)
  %38 = load i64, i64* %3, align 8
  %39 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 2
  %40 = load i64, i64* %39, align 8
  %41 = shl i64 %40, 16
  %42 = xor i64 %41, %38
  %43 = load i64, i64* %1, align 8
  %44 = xor i64 %42, %43
  store i64 %44, i64* %1, align 8
  %45 = load i64, i64* %11, align 8
  %46 = load i64, i64* %13, align 8
  %47 = xor i64 %46, %45
  store i64 %47, i64* %13, align 8
  %48 = load i64, i64* %16, align 8
  %49 = load i64, i64* %39, align 8
  %50 = xor i64 %49, %48
  %51 = load i64, i64* %20, align 8
  %52 = xor i64 %50, %51
  store i64 %52, i64* %20, align 8
  call void @rho(i64* %1)
  %53 = load i64, i64* %3, align 8
  %54 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 3
  %55 = load i64, i64* %54, align 8
  %56 = shl i64 %55, 16
  %57 = xor i64 %56, %53
  %58 = load i64, i64* %1, align 8
  %59 = xor i64 %57, %58
  store i64 %59, i64* %1, align 8
  %60 = load i64, i64* %11, align 8
  %61 = load i64, i64* %13, align 8
  %62 = xor i64 %61, %60
  store i64 %62, i64* %13, align 8
  %63 = load i64, i64* %16, align 8
  %64 = load i64, i64* %54, align 8
  %65 = xor i64 %64, %63
  %66 = load i64, i64* %20, align 8
  %67 = xor i64 %65, %66
  store i64 %67, i64* %20, align 8
  call void @rho(i64* %1)
  %68 = load i64, i64* %3, align 8
  %69 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 4
  %70 = load i64, i64* %69, align 8
  %71 = shl i64 %70, 16
  %72 = xor i64 %71, %68
  %73 = load i64, i64* %1, align 8
  %74 = xor i64 %72, %73
  store i64 %74, i64* %1, align 8
  %75 = load i64, i64* %11, align 8
  %76 = load i64, i64* %13, align 8
  %77 = xor i64 %76, %75
  store i64 %77, i64* %13, align 8
  %78 = load i64, i64* %16, align 8
  %79 = load i64, i64* %69, align 8
  %80 = xor i64 %79, %78
  %81 = load i64, i64* %20, align 8
  %82 = xor i64 %80, %81
  store i64 %82, i64* %20, align 8
  call void @rho(i64* %1)
  %83 = load i64, i64* %3, align 8
  %84 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 5
  %85 = load i64, i64* %84, align 8
  %86 = shl i64 %85, 16
  %87 = xor i64 %86, %83
  %88 = load i64, i64* %1, align 8
  %89 = xor i64 %87, %88
  store i64 %89, i64* %1, align 8
  %90 = load i64, i64* %11, align 8
  %91 = load i64, i64* %13, align 8
  %92 = xor i64 %91, %90
  store i64 %92, i64* %13, align 8
  %93 = load i64, i64* %16, align 8
  %94 = load i64, i64* %84, align 8
  %95 = xor i64 %94, %93
  %96 = load i64, i64* %20, align 8
  %97 = xor i64 %95, %96
  store i64 %97, i64* %20, align 8
  call void @rho(i64* nonnull %1)
  %98 = load i64, i64* %3, align 8
  %99 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 6
  %100 = load i64, i64* %99, align 8
  %101 = shl i64 %100, 16
  %102 = xor i64 %101, %98
  %103 = load i64, i64* %1, align 8
  %104 = xor i64 %102, %103
  store i64 %104, i64* %1, align 8
  %105 = load i64, i64* %11, align 8
  %106 = load i64, i64* %13, align 8
  %107 = xor i64 %106, %105
  store i64 %107, i64* %13, align 8
  %108 = load i64, i64* %16, align 8
  %109 = load i64, i64* %99, align 8
  %110 = xor i64 %109, %108
  %111 = load i64, i64* %20, align 8
  %112 = xor i64 %110, %111
  store i64 %112, i64* %20, align 8
  call void @rho(i64* nonnull %1)
  %113 = load i64, i64* %3, align 8
  %114 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 7
  %115 = load i64, i64* %114, align 8
  %116 = shl i64 %115, 16
  %117 = xor i64 %116, %113
  %118 = load i64, i64* %1, align 8
  %119 = xor i64 %117, %118
  store i64 %119, i64* %1, align 8
  %120 = load i64, i64* %11, align 8
  %121 = load i64, i64* %13, align 8
  %122 = xor i64 %121, %120
  store i64 %122, i64* %13, align 8
  %123 = load i64, i64* %16, align 8
  %124 = load i64, i64* %114, align 8
  %125 = xor i64 %124, %123
  %126 = load i64, i64* %20, align 8
  %127 = xor i64 %125, %126
  store i64 %127, i64* %20, align 8
  call void @rho(i64* nonnull %1)
  %128 = load i64, i64* %3, align 8
  %129 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 8
  %130 = load i64, i64* %129, align 8
  %131 = shl i64 %130, 16
  %132 = xor i64 %131, %128
  %133 = load i64, i64* %1, align 8
  %134 = xor i64 %132, %133
  store i64 %134, i64* %1, align 8
  %135 = load i64, i64* %11, align 8
  %136 = load i64, i64* %13, align 8
  %137 = xor i64 %136, %135
  store i64 %137, i64* %13, align 8
  %138 = load i64, i64* %16, align 8
  %139 = load i64, i64* %129, align 8
  %140 = xor i64 %139, %138
  %141 = load i64, i64* %20, align 8
  %142 = xor i64 %140, %141
  store i64 %142, i64* %20, align 8
  call void @rho(i64* nonnull %1)
  %143 = load i64, i64* %3, align 8
  %144 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 9
  %145 = load i64, i64* %144, align 8
  %146 = shl i64 %145, 16
  %147 = xor i64 %146, %143
  %148 = load i64, i64* %1, align 8
  %149 = xor i64 %147, %148
  store i64 %149, i64* %1, align 8
  %150 = load i64, i64* %11, align 8
  %151 = load i64, i64* %13, align 8
  %152 = xor i64 %151, %150
  store i64 %152, i64* %13, align 8
  %153 = load i64, i64* %16, align 8
  %154 = load i64, i64* %144, align 8
  %155 = xor i64 %154, %153
  %156 = load i64, i64* %20, align 8
  %157 = xor i64 %155, %156
  store i64 %157, i64* %20, align 8
  call void @rho(i64* nonnull %1)
  %158 = load i64, i64* %3, align 8
  %159 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 10
  %160 = load i64, i64* %159, align 8
  %161 = shl i64 %160, 16
  %162 = xor i64 %161, %158
  %163 = load i64, i64* %1, align 8
  %164 = xor i64 %162, %163
  store i64 %164, i64* %1, align 8
  %165 = load i64, i64* %11, align 8
  %166 = load i64, i64* %13, align 8
  %167 = xor i64 %166, %165
  store i64 %167, i64* %13, align 8
  %168 = load i64, i64* %16, align 8
  %169 = load i64, i64* %159, align 8
  %170 = xor i64 %169, %168
  %171 = load i64, i64* %20, align 8
  %172 = xor i64 %170, %171
  store i64 %172, i64* %20, align 8
  call void @rho(i64* nonnull %1)
  %173 = load i64, i64* %3, align 8
  %174 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 11
  %175 = load i64, i64* %174, align 8
  %176 = shl i64 %175, 16
  %177 = xor i64 %176, %173
  %178 = load i64, i64* %1, align 8
  %179 = xor i64 %177, %178
  store i64 %179, i64* %1, align 8
  %180 = load i64, i64* %11, align 8
  %181 = load i64, i64* %13, align 8
  %182 = xor i64 %181, %180
  store i64 %182, i64* %13, align 8
  %183 = load i64, i64* %16, align 8
  %184 = load i64, i64* %174, align 8
  %185 = xor i64 %184, %183
  %186 = load i64, i64* %20, align 8
  %187 = xor i64 %185, %186
  store i64 %187, i64* %20, align 8
  call void @theta(i64* nonnull %1)
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define dso_local void @decrypt(%struct.twy_ctx* nocapture readonly %0, i64* %1) local_unnamed_addr #2 {
  call void @mu(i64* %1)
  %3 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 1, i64 0
  %4 = load i64, i64* %3, align 8
  %5 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 0
  %6 = load i64, i64* %5, align 8
  %7 = shl i64 %6, 16
  %8 = xor i64 %7, %4
  %9 = load i64, i64* %1, align 8
  %10 = xor i64 %8, %9
  store i64 %10, i64* %1, align 8
  %11 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 1, i64 1
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds i64, i64* %1, i64 1
  %14 = load i64, i64* %13, align 8
  %15 = xor i64 %14, %12
  store i64 %15, i64* %13, align 8
  %16 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 1, i64 2
  %17 = load i64, i64* %16, align 8
  %18 = load i64, i64* %5, align 8
  %19 = xor i64 %18, %17
  %20 = getelementptr inbounds i64, i64* %1, i64 2
  %21 = load i64, i64* %20, align 8
  %22 = xor i64 %19, %21
  store i64 %22, i64* %20, align 8
  call void @rho(i64* %1)
  %23 = load i64, i64* %3, align 8
  %24 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 1
  %25 = load i64, i64* %24, align 8
  %26 = shl i64 %25, 16
  %27 = xor i64 %26, %23
  %28 = load i64, i64* %1, align 8
  %29 = xor i64 %27, %28
  store i64 %29, i64* %1, align 8
  %30 = load i64, i64* %11, align 8
  %31 = load i64, i64* %13, align 8
  %32 = xor i64 %31, %30
  store i64 %32, i64* %13, align 8
  %33 = load i64, i64* %16, align 8
  %34 = load i64, i64* %24, align 8
  %35 = xor i64 %34, %33
  %36 = load i64, i64* %20, align 8
  %37 = xor i64 %35, %36
  store i64 %37, i64* %20, align 8
  call void @rho(i64* %1)
  %38 = load i64, i64* %3, align 8
  %39 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 2
  %40 = load i64, i64* %39, align 8
  %41 = shl i64 %40, 16
  %42 = xor i64 %41, %38
  %43 = load i64, i64* %1, align 8
  %44 = xor i64 %42, %43
  store i64 %44, i64* %1, align 8
  %45 = load i64, i64* %11, align 8
  %46 = load i64, i64* %13, align 8
  %47 = xor i64 %46, %45
  store i64 %47, i64* %13, align 8
  %48 = load i64, i64* %16, align 8
  %49 = load i64, i64* %39, align 8
  %50 = xor i64 %49, %48
  %51 = load i64, i64* %20, align 8
  %52 = xor i64 %50, %51
  store i64 %52, i64* %20, align 8
  call void @rho(i64* %1)
  %53 = load i64, i64* %3, align 8
  %54 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 3
  %55 = load i64, i64* %54, align 8
  %56 = shl i64 %55, 16
  %57 = xor i64 %56, %53
  %58 = load i64, i64* %1, align 8
  %59 = xor i64 %57, %58
  store i64 %59, i64* %1, align 8
  %60 = load i64, i64* %11, align 8
  %61 = load i64, i64* %13, align 8
  %62 = xor i64 %61, %60
  store i64 %62, i64* %13, align 8
  %63 = load i64, i64* %16, align 8
  %64 = load i64, i64* %54, align 8
  %65 = xor i64 %64, %63
  %66 = load i64, i64* %20, align 8
  %67 = xor i64 %65, %66
  store i64 %67, i64* %20, align 8
  call void @rho(i64* %1)
  %68 = load i64, i64* %3, align 8
  %69 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 4
  %70 = load i64, i64* %69, align 8
  %71 = shl i64 %70, 16
  %72 = xor i64 %71, %68
  %73 = load i64, i64* %1, align 8
  %74 = xor i64 %72, %73
  store i64 %74, i64* %1, align 8
  %75 = load i64, i64* %11, align 8
  %76 = load i64, i64* %13, align 8
  %77 = xor i64 %76, %75
  store i64 %77, i64* %13, align 8
  %78 = load i64, i64* %16, align 8
  %79 = load i64, i64* %69, align 8
  %80 = xor i64 %79, %78
  %81 = load i64, i64* %20, align 8
  %82 = xor i64 %80, %81
  store i64 %82, i64* %20, align 8
  call void @rho(i64* %1)
  %83 = load i64, i64* %3, align 8
  %84 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 5
  %85 = load i64, i64* %84, align 8
  %86 = shl i64 %85, 16
  %87 = xor i64 %86, %83
  %88 = load i64, i64* %1, align 8
  %89 = xor i64 %87, %88
  store i64 %89, i64* %1, align 8
  %90 = load i64, i64* %11, align 8
  %91 = load i64, i64* %13, align 8
  %92 = xor i64 %91, %90
  store i64 %92, i64* %13, align 8
  %93 = load i64, i64* %16, align 8
  %94 = load i64, i64* %84, align 8
  %95 = xor i64 %94, %93
  %96 = load i64, i64* %20, align 8
  %97 = xor i64 %95, %96
  store i64 %97, i64* %20, align 8
  call void @rho(i64* %1)
  %98 = load i64, i64* %3, align 8
  %99 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 6
  %100 = load i64, i64* %99, align 8
  %101 = shl i64 %100, 16
  %102 = xor i64 %101, %98
  %103 = load i64, i64* %1, align 8
  %104 = xor i64 %102, %103
  store i64 %104, i64* %1, align 8
  %105 = load i64, i64* %11, align 8
  %106 = load i64, i64* %13, align 8
  %107 = xor i64 %106, %105
  store i64 %107, i64* %13, align 8
  %108 = load i64, i64* %16, align 8
  %109 = load i64, i64* %99, align 8
  %110 = xor i64 %109, %108
  %111 = load i64, i64* %20, align 8
  %112 = xor i64 %110, %111
  store i64 %112, i64* %20, align 8
  call void @rho(i64* nonnull %1)
  %113 = load i64, i64* %3, align 8
  %114 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 7
  %115 = load i64, i64* %114, align 8
  %116 = shl i64 %115, 16
  %117 = xor i64 %116, %113
  %118 = load i64, i64* %1, align 8
  %119 = xor i64 %117, %118
  store i64 %119, i64* %1, align 8
  %120 = load i64, i64* %11, align 8
  %121 = load i64, i64* %13, align 8
  %122 = xor i64 %121, %120
  store i64 %122, i64* %13, align 8
  %123 = load i64, i64* %16, align 8
  %124 = load i64, i64* %114, align 8
  %125 = xor i64 %124, %123
  %126 = load i64, i64* %20, align 8
  %127 = xor i64 %125, %126
  store i64 %127, i64* %20, align 8
  call void @rho(i64* nonnull %1)
  %128 = load i64, i64* %3, align 8
  %129 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 8
  %130 = load i64, i64* %129, align 8
  %131 = shl i64 %130, 16
  %132 = xor i64 %131, %128
  %133 = load i64, i64* %1, align 8
  %134 = xor i64 %132, %133
  store i64 %134, i64* %1, align 8
  %135 = load i64, i64* %11, align 8
  %136 = load i64, i64* %13, align 8
  %137 = xor i64 %136, %135
  store i64 %137, i64* %13, align 8
  %138 = load i64, i64* %16, align 8
  %139 = load i64, i64* %129, align 8
  %140 = xor i64 %139, %138
  %141 = load i64, i64* %20, align 8
  %142 = xor i64 %140, %141
  store i64 %142, i64* %20, align 8
  call void @rho(i64* nonnull %1)
  %143 = load i64, i64* %3, align 8
  %144 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 9
  %145 = load i64, i64* %144, align 8
  %146 = shl i64 %145, 16
  %147 = xor i64 %146, %143
  %148 = load i64, i64* %1, align 8
  %149 = xor i64 %147, %148
  store i64 %149, i64* %1, align 8
  %150 = load i64, i64* %11, align 8
  %151 = load i64, i64* %13, align 8
  %152 = xor i64 %151, %150
  store i64 %152, i64* %13, align 8
  %153 = load i64, i64* %16, align 8
  %154 = load i64, i64* %144, align 8
  %155 = xor i64 %154, %153
  %156 = load i64, i64* %20, align 8
  %157 = xor i64 %155, %156
  store i64 %157, i64* %20, align 8
  call void @rho(i64* nonnull %1)
  %158 = load i64, i64* %3, align 8
  %159 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 10
  %160 = load i64, i64* %159, align 8
  %161 = shl i64 %160, 16
  %162 = xor i64 %161, %158
  %163 = load i64, i64* %1, align 8
  %164 = xor i64 %162, %163
  store i64 %164, i64* %1, align 8
  %165 = load i64, i64* %11, align 8
  %166 = load i64, i64* %13, align 8
  %167 = xor i64 %166, %165
  store i64 %167, i64* %13, align 8
  %168 = load i64, i64* %16, align 8
  %169 = load i64, i64* %159, align 8
  %170 = xor i64 %169, %168
  %171 = load i64, i64* %20, align 8
  %172 = xor i64 %170, %171
  store i64 %172, i64* %20, align 8
  call void @rho(i64* nonnull %1)
  %173 = load i64, i64* %3, align 8
  %174 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 11
  %175 = load i64, i64* %174, align 8
  %176 = shl i64 %175, 16
  %177 = xor i64 %176, %173
  %178 = load i64, i64* %1, align 8
  %179 = xor i64 %177, %178
  store i64 %179, i64* %1, align 8
  %180 = load i64, i64* %11, align 8
  %181 = load i64, i64* %13, align 8
  %182 = xor i64 %181, %180
  store i64 %182, i64* %13, align 8
  %183 = load i64, i64* %16, align 8
  %184 = load i64, i64* %174, align 8
  %185 = xor i64 %184, %183
  %186 = load i64, i64* %20, align 8
  %187 = xor i64 %185, %186
  store i64 %187, i64* %20, align 8
  call void @theta(i64* nonnull %1)
  call void @mu(i64* nonnull %1)
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define dso_local void @twy_key(%struct.twy_ctx* %0, i64* nocapture readonly %1) local_unnamed_addr #2 {
  %3 = load i64, i64* %1, align 8
  %4 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 0, i64 0
  store i64 %3, i64* %4, align 8
  %5 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 1, i64 0
  store i64 %3, i64* %5, align 8
  %6 = getelementptr inbounds i64, i64* %1, i64 1
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 0, i64 1
  store i64 %7, i64* %8, align 8
  %9 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 1, i64 1
  store i64 %7, i64* %9, align 8
  %10 = getelementptr inbounds i64, i64* %1, i64 2
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 0, i64 2
  store i64 %11, i64* %12, align 8
  %13 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 1, i64 2
  store i64 %11, i64* %13, align 8
  call void @theta(i64* nonnull %5)
  call void @mu(i64* nonnull %5)
  %14 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 0
  call void @rndcon_gen(i64 2827, i64* nonnull %14)
  %15 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 0
  call void @rndcon_gen(i64 45489, i64* nonnull %15)
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define dso_local void @twy_enc(%struct.twy_ctx* nocapture readonly %0, i64* %1, i32 %2) local_unnamed_addr #2 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  call void @encrypt(%struct.twy_ctx* %0, i64* %1)
  %6 = getelementptr inbounds i64, i64* %1, i64 3
  br label %7

7:                                                ; preds = %5, %3
  %.1 = phi i64* [ %6, %5 ], [ %1, %3 ]
  %8 = icmp sgt i32 %2, 1
  br i1 %8, label %9, label %11

9:                                                ; preds = %7
  call void @encrypt(%struct.twy_ctx* %0, i64* %.1)
  %10 = getelementptr inbounds i64, i64* %.1, i64 3
  br label %11

11:                                               ; preds = %9, %7
  %.1.1 = phi i64* [ %10, %9 ], [ %.1, %7 ]
  %12 = icmp sgt i32 %2, 2
  br i1 %12, label %13, label %14

13:                                               ; preds = %11
  call void @encrypt(%struct.twy_ctx* %0, i64* %.1.1)
  br label %14

14:                                               ; preds = %13, %11
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define dso_local void @twy_dec(%struct.twy_ctx* nocapture readonly %0, i64* %1, i32 %2) local_unnamed_addr #2 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  call void @decrypt(%struct.twy_ctx* %0, i64* %1)
  %6 = getelementptr inbounds i64, i64* %1, i64 3
  br label %7

7:                                                ; preds = %5, %3
  %.1 = phi i64* [ %6, %5 ], [ %1, %3 ]
  %8 = icmp sgt i32 %2, 1
  br i1 %8, label %9, label %11

9:                                                ; preds = %7
  call void @decrypt(%struct.twy_ctx* %0, i64* %.1)
  %10 = getelementptr inbounds i64, i64* %.1, i64 3
  br label %11

11:                                               ; preds = %9, %7
  %.1.1 = phi i64* [ %10, %9 ], [ %.1, %7 ]
  %12 = icmp sgt i32 %2, 2
  br i1 %12, label %13, label %14

13:                                               ; preds = %11
  call void @decrypt(%struct.twy_ctx* %0, i64* %.1.1)
  br label %14

14:                                               ; preds = %13, %11
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable writeonly
define dso_local void @twy_destroy(%struct.twy_ctx* nocapture %0) local_unnamed_addr #3 {
  %2 = bitcast %struct.twy_ctx* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(48) %2, i8 0, i64 48, i1 false)
  ret void
}

; Function Attrs: nofree nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

attributes #0 = { nofree noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree noinline norecurse nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree noinline norecurse nounwind sspstrong uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree nounwind }
attributes #5 = { argmemonly nounwind willreturn }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}

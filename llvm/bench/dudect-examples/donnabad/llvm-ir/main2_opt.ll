; ModuleID = 'dudect-examples/donnabad/llvm-ir/main2.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.input_data = private unnamed_addr constant [32 x i8] c"\91E\EE\0C\8A\BA\13\C5\AE\EB\A4\DC\BC?\E40X{\7F5\AB\09\96\A6AI\17\F4\D2qj\D6", align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@chunk_size = dso_local local_unnamed_addr constant i64 32, align 8
@number_measurements = dso_local local_unnamed_addr constant i64 1, align 8
@__const.do_one_computation.basepoint = private unnamed_addr constant <{ i8, [31 x i8] }> <{ i8 9, [31 x i8] zeroinitializer }>, align 16
@.str.9 = private unnamed_addr constant [10 x i8] c"xlen >= 0\00", align 1
@.str.1 = private unnamed_addr constant [42 x i8] c"dudect-examples/donnabad/sources/random.c\00", align 1
@__PRETTY_FUNCTION__.randombytes = private unnamed_addr constant [36 x i8] c"void randombytes(uint8_t *, size_t)\00", align 1
@randombytes.fd = internal unnamed_addr global i32 -1, align 4
@.str.2 = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [32 x i8], align 16
  %2 = getelementptr inbounds [32 x i8], [32 x i8]* %1, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(32) %2, i8* nonnull align 16 dereferenceable(32) getelementptr inbounds ([32 x i8], [32 x i8]* @__const.main.input_data, i64 0, i64 0), i64 32, i1 false)
  %3 = call zeroext i8 @do_one_computation(i8* nonnull %2)
  %4 = zext i8 %3 to i32
  %5 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %4)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i8 @do_one_computation(i8* %0) local_unnamed_addr #0 {
  %2 = alloca [32 x i8], align 16
  %3 = alloca [32 x i8], align 16
  %4 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(32) %4, i8 0, i64 32, i1 false)
  %5 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(32) %5, i8* nonnull align 16 dereferenceable(32) getelementptr inbounds (<{ i8, [31 x i8] }>, <{ i8, [31 x i8] }>* @__const.do_one_computation.basepoint, i64 0, i32 0), i64 32, i1 false)
  %6 = call i32 @curve25519_donna(i8* nonnull %4, i8* %0, i8* nonnull %5)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(32) %0, i8* nonnull align 16 dereferenceable(32) %4, i64 32, i1 false)
  %7 = call i32 @curve25519_donna(i8* nonnull %4, i8* %0, i8* nonnull %5)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(32) %0, i8* nonnull align 16 dereferenceable(32) %4, i64 32, i1 false)
  %8 = call i32 @curve25519_donna(i8* nonnull %4, i8* %0, i8* nonnull %5)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(32) %0, i8* nonnull align 16 dereferenceable(32) %4, i64 32, i1 false)
  %9 = call i32 @curve25519_donna(i8* nonnull %4, i8* %0, i8* nonnull %5)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(32) %0, i8* nonnull align 16 dereferenceable(32) %4, i64 32, i1 false)
  %10 = call i32 @curve25519_donna(i8* nonnull %4, i8* %0, i8* nonnull %5)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(32) %0, i8* nonnull align 16 dereferenceable(32) %4, i64 32, i1 false)
  %11 = call i32 @curve25519_donna(i8* nonnull %4, i8* %0, i8* nonnull %5)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(32) %0, i8* nonnull align 16 dereferenceable(32) %4, i64 32, i1 false)
  %12 = call i32 @curve25519_donna(i8* nonnull %4, i8* %0, i8* nonnull %5)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(32) %0, i8* nonnull align 16 dereferenceable(32) %4, i64 32, i1 false)
  %13 = call i32 @curve25519_donna(i8* nonnull %4, i8* %0, i8* nonnull %5)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(32) %0, i8* nonnull align 16 dereferenceable(32) %4, i64 32, i1 false)
  %14 = call i32 @curve25519_donna(i8* nonnull %4, i8* %0, i8* nonnull %5)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(32) %0, i8* nonnull align 16 dereferenceable(32) %4, i64 32, i1 false)
  %15 = load i8, i8* %4, align 16
  ret i8 %15
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline norecurse nounwind readnone sspstrong uwtable
define dso_local void @init_dut() local_unnamed_addr #3 {
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @prepare_inputs(i8* nocapture %0, i8* nocapture %1) local_unnamed_addr #0 {
  call void @randombytes(i8* %0, i64 32)
  %3 = call zeroext i8 @randombit()
  store i8 %3, i8* %1, align 1
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %5, label %6

5:                                                ; preds = %2
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(32) %0, i8 0, i64 32, i1 false)
  br label %6

6:                                                ; preds = %5, %2
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @curve25519_donna(i8* %0, i8* readonly %1, i8* readonly %2) local_unnamed_addr #0 {
  %4 = alloca [10 x i64], align 16
  %5 = alloca [10 x i64], align 16
  %6 = alloca [11 x i64], align 16
  %7 = alloca [10 x i64], align 16
  %8 = alloca [32 x i8], align 16
  %9 = load i8, i8* %1, align 1
  %10 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 0
  store i8 %9, i8* %10, align 16
  %11 = getelementptr inbounds i8, i8* %1, i64 1
  %12 = load i8, i8* %11, align 1
  %13 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 1
  store i8 %12, i8* %13, align 1
  %14 = getelementptr inbounds i8, i8* %1, i64 2
  %15 = load i8, i8* %14, align 1
  %16 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 2
  store i8 %15, i8* %16, align 2
  %17 = getelementptr inbounds i8, i8* %1, i64 3
  %18 = load i8, i8* %17, align 1
  %19 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 3
  store i8 %18, i8* %19, align 1
  %20 = getelementptr inbounds i8, i8* %1, i64 4
  %21 = load i8, i8* %20, align 1
  %22 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 4
  store i8 %21, i8* %22, align 4
  %23 = getelementptr inbounds i8, i8* %1, i64 5
  %24 = load i8, i8* %23, align 1
  %25 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 5
  store i8 %24, i8* %25, align 1
  %26 = getelementptr inbounds i8, i8* %1, i64 6
  %27 = load i8, i8* %26, align 1
  %28 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 6
  store i8 %27, i8* %28, align 2
  %29 = getelementptr inbounds i8, i8* %1, i64 7
  %30 = load i8, i8* %29, align 1
  %31 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 7
  store i8 %30, i8* %31, align 1
  %32 = getelementptr inbounds i8, i8* %1, i64 8
  %33 = load i8, i8* %32, align 1
  %34 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 8
  store i8 %33, i8* %34, align 8
  %35 = getelementptr inbounds i8, i8* %1, i64 9
  %36 = load i8, i8* %35, align 1
  %37 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 9
  store i8 %36, i8* %37, align 1
  %38 = getelementptr inbounds i8, i8* %1, i64 10
  %39 = load i8, i8* %38, align 1
  %40 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 10
  store i8 %39, i8* %40, align 2
  %41 = getelementptr inbounds i8, i8* %1, i64 11
  %42 = load i8, i8* %41, align 1
  %43 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 11
  store i8 %42, i8* %43, align 1
  %44 = getelementptr inbounds i8, i8* %1, i64 12
  %45 = load i8, i8* %44, align 1
  %46 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 12
  store i8 %45, i8* %46, align 4
  %47 = getelementptr inbounds i8, i8* %1, i64 13
  %48 = load i8, i8* %47, align 1
  %49 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 13
  store i8 %48, i8* %49, align 1
  %50 = getelementptr inbounds i8, i8* %1, i64 14
  %51 = load i8, i8* %50, align 1
  %52 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 14
  store i8 %51, i8* %52, align 2
  %53 = getelementptr inbounds i8, i8* %1, i64 15
  %54 = load i8, i8* %53, align 1
  %55 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 15
  store i8 %54, i8* %55, align 1
  %56 = getelementptr inbounds i8, i8* %1, i64 16
  %57 = load i8, i8* %56, align 1
  %58 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 16
  store i8 %57, i8* %58, align 16
  %59 = getelementptr inbounds i8, i8* %1, i64 17
  %60 = load i8, i8* %59, align 1
  %61 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 17
  store i8 %60, i8* %61, align 1
  %62 = getelementptr inbounds i8, i8* %1, i64 18
  %63 = load i8, i8* %62, align 1
  %64 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 18
  store i8 %63, i8* %64, align 2
  %65 = getelementptr inbounds i8, i8* %1, i64 19
  %66 = load i8, i8* %65, align 1
  %67 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 19
  store i8 %66, i8* %67, align 1
  %68 = getelementptr inbounds i8, i8* %1, i64 20
  %69 = load i8, i8* %68, align 1
  %70 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 20
  store i8 %69, i8* %70, align 4
  %71 = getelementptr inbounds i8, i8* %1, i64 21
  %72 = load i8, i8* %71, align 1
  %73 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 21
  store i8 %72, i8* %73, align 1
  %74 = getelementptr inbounds i8, i8* %1, i64 22
  %75 = load i8, i8* %74, align 1
  %76 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 22
  store i8 %75, i8* %76, align 2
  %77 = getelementptr inbounds i8, i8* %1, i64 23
  %78 = load i8, i8* %77, align 1
  %79 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 23
  store i8 %78, i8* %79, align 1
  %80 = getelementptr inbounds i8, i8* %1, i64 24
  %81 = load i8, i8* %80, align 1
  %82 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 24
  store i8 %81, i8* %82, align 8
  %83 = getelementptr inbounds i8, i8* %1, i64 25
  %84 = load i8, i8* %83, align 1
  %85 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 25
  store i8 %84, i8* %85, align 1
  %86 = getelementptr inbounds i8, i8* %1, i64 26
  %87 = load i8, i8* %86, align 1
  %88 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 26
  store i8 %87, i8* %88, align 2
  %89 = getelementptr inbounds i8, i8* %1, i64 27
  %90 = load i8, i8* %89, align 1
  %91 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 27
  store i8 %90, i8* %91, align 1
  %92 = getelementptr inbounds i8, i8* %1, i64 28
  %93 = load i8, i8* %92, align 1
  %94 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 28
  store i8 %93, i8* %94, align 4
  %95 = getelementptr inbounds i8, i8* %1, i64 29
  %96 = load i8, i8* %95, align 1
  %97 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 29
  store i8 %96, i8* %97, align 1
  %98 = getelementptr inbounds i8, i8* %1, i64 30
  %99 = load i8, i8* %98, align 1
  %100 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 30
  store i8 %99, i8* %100, align 2
  %101 = getelementptr inbounds i8, i8* %1, i64 31
  %102 = load i8, i8* %101, align 1
  %103 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 31
  store i8 %102, i8* %103, align 1
  %104 = and i8 %9, -8
  store i8 %104, i8* %10, align 16
  %105 = and i8 %102, 63
  %106 = or i8 %105, 64
  store i8 %106, i8* %103, align 1
  %107 = getelementptr inbounds [10 x i64], [10 x i64]* %4, i64 0, i64 0
  call fastcc void @fexpand(i64* nonnull %107, i8* %2)
  %108 = getelementptr inbounds [10 x i64], [10 x i64]* %5, i64 0, i64 0
  %109 = getelementptr inbounds [11 x i64], [11 x i64]* %6, i64 0, i64 0
  call fastcc void @cmult(i64* nonnull %108, i64* nonnull %109, i8* nonnull %10, i64* nonnull %107)
  %110 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  call fastcc void @crecip(i64* nonnull %110, i64* nonnull %109)
  call fastcc void @fmul(i64* nonnull %109, i64* nonnull %108, i64* nonnull %110)
  call fastcc void @fcontract(i8* %0, i64* nonnull %109)
  ret i32 0
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define internal fastcc void @fexpand(i64* nocapture %0, i8* readonly %1) unnamed_addr #4 {
  %3 = load i8, i8* %1, align 1
  %4 = zext i8 %3 to i64
  %5 = getelementptr inbounds i8, i8* %1, i64 1
  %6 = load i8, i8* %5, align 1
  %7 = zext i8 %6 to i64
  %8 = shl nuw nsw i64 %7, 8
  %9 = or i64 %8, %4
  %10 = getelementptr inbounds i8, i8* %1, i64 2
  %11 = load i8, i8* %10, align 1
  %12 = zext i8 %11 to i64
  %13 = shl nuw nsw i64 %12, 16
  %14 = or i64 %9, %13
  %15 = getelementptr inbounds i8, i8* %1, i64 3
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i64
  %18 = shl nuw nsw i64 %17, 24
  %.masked = and i64 %18, 50331648
  %19 = or i64 %14, %.masked
  store i64 %19, i64* %0, align 8
  %20 = load i8, i8* %15, align 1
  %21 = zext i8 %20 to i64
  %22 = getelementptr inbounds i8, i8* %1, i64 4
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i64
  %25 = shl nuw nsw i64 %24, 8
  %26 = or i64 %25, %21
  %27 = getelementptr inbounds i8, i8* %1, i64 5
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i64
  %30 = shl nuw nsw i64 %29, 16
  %31 = or i64 %26, %30
  %32 = getelementptr inbounds i8, i8* %1, i64 6
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i64
  %35 = shl nuw nsw i64 %34, 24
  %36 = or i64 %31, %35
  %37 = lshr i64 %36, 2
  %38 = and i64 %37, 33554431
  %39 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %38, i64* %39, align 8
  %40 = load i8, i8* %32, align 1
  %41 = zext i8 %40 to i64
  %42 = getelementptr inbounds i8, i8* %1, i64 7
  %43 = load i8, i8* %42, align 1
  %44 = zext i8 %43 to i64
  %45 = shl nuw nsw i64 %44, 8
  %46 = or i64 %45, %41
  %47 = getelementptr inbounds i8, i8* %1, i64 8
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i64
  %50 = shl nuw nsw i64 %49, 16
  %51 = or i64 %46, %50
  %52 = getelementptr inbounds i8, i8* %1, i64 9
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i64
  %55 = shl nuw nsw i64 %54, 24
  %56 = or i64 %51, %55
  %57 = lshr i64 %56, 3
  %58 = and i64 %57, 67108863
  %59 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %58, i64* %59, align 8
  %60 = load i8, i8* %52, align 1
  %61 = zext i8 %60 to i64
  %62 = getelementptr inbounds i8, i8* %1, i64 10
  %63 = load i8, i8* %62, align 1
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 8
  %66 = or i64 %65, %61
  %67 = getelementptr inbounds i8, i8* %1, i64 11
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i64
  %70 = shl nuw nsw i64 %69, 16
  %71 = or i64 %66, %70
  %72 = getelementptr inbounds i8, i8* %1, i64 12
  %73 = load i8, i8* %72, align 1
  %74 = zext i8 %73 to i64
  %75 = shl nuw nsw i64 %74, 24
  %76 = or i64 %71, %75
  %77 = lshr i64 %76, 5
  %78 = and i64 %77, 33554431
  %79 = getelementptr inbounds i64, i64* %0, i64 3
  store i64 %78, i64* %79, align 8
  %80 = load i8, i8* %72, align 1
  %81 = zext i8 %80 to i64
  %82 = getelementptr inbounds i8, i8* %1, i64 13
  %83 = load i8, i8* %82, align 1
  %84 = zext i8 %83 to i64
  %85 = shl nuw nsw i64 %84, 8
  %86 = or i64 %85, %81
  %87 = getelementptr inbounds i8, i8* %1, i64 14
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i64
  %90 = shl nuw nsw i64 %89, 16
  %91 = or i64 %86, %90
  %92 = getelementptr inbounds i8, i8* %1, i64 15
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i64
  %95 = shl nuw nsw i64 %94, 24
  %96 = or i64 %91, %95
  %97 = lshr i64 %96, 6
  %98 = and i64 %97, 67108863
  %99 = getelementptr inbounds i64, i64* %0, i64 4
  store i64 %98, i64* %99, align 8
  %100 = getelementptr inbounds i8, i8* %1, i64 16
  %101 = load i8, i8* %100, align 1
  %102 = zext i8 %101 to i64
  %103 = getelementptr inbounds i8, i8* %1, i64 17
  %104 = load i8, i8* %103, align 1
  %105 = zext i8 %104 to i64
  %106 = shl nuw nsw i64 %105, 8
  %107 = or i64 %106, %102
  %108 = getelementptr inbounds i8, i8* %1, i64 18
  %109 = load i8, i8* %108, align 1
  %110 = zext i8 %109 to i64
  %111 = shl nuw nsw i64 %110, 16
  %112 = or i64 %107, %111
  %113 = getelementptr inbounds i8, i8* %1, i64 19
  %114 = load i8, i8* %113, align 1
  %115 = zext i8 %114 to i64
  %116 = shl nuw nsw i64 %115, 24
  %.masked1 = and i64 %116, 16777216
  %117 = or i64 %112, %.masked1
  %118 = getelementptr inbounds i64, i64* %0, i64 5
  store i64 %117, i64* %118, align 8
  %119 = load i8, i8* %113, align 1
  %120 = zext i8 %119 to i64
  %121 = getelementptr inbounds i8, i8* %1, i64 20
  %122 = load i8, i8* %121, align 1
  %123 = zext i8 %122 to i64
  %124 = shl nuw nsw i64 %123, 8
  %125 = or i64 %124, %120
  %126 = getelementptr inbounds i8, i8* %1, i64 21
  %127 = load i8, i8* %126, align 1
  %128 = zext i8 %127 to i64
  %129 = shl nuw nsw i64 %128, 16
  %130 = or i64 %125, %129
  %131 = getelementptr inbounds i8, i8* %1, i64 22
  %132 = load i8, i8* %131, align 1
  %133 = zext i8 %132 to i64
  %134 = shl nuw nsw i64 %133, 24
  %135 = or i64 %130, %134
  %136 = lshr i64 %135, 1
  %137 = and i64 %136, 67108863
  %138 = getelementptr inbounds i64, i64* %0, i64 6
  store i64 %137, i64* %138, align 8
  %139 = load i8, i8* %131, align 1
  %140 = zext i8 %139 to i64
  %141 = getelementptr inbounds i8, i8* %1, i64 23
  %142 = load i8, i8* %141, align 1
  %143 = zext i8 %142 to i64
  %144 = shl nuw nsw i64 %143, 8
  %145 = or i64 %144, %140
  %146 = getelementptr inbounds i8, i8* %1, i64 24
  %147 = load i8, i8* %146, align 1
  %148 = zext i8 %147 to i64
  %149 = shl nuw nsw i64 %148, 16
  %150 = or i64 %145, %149
  %151 = getelementptr inbounds i8, i8* %1, i64 25
  %152 = load i8, i8* %151, align 1
  %153 = zext i8 %152 to i64
  %154 = shl nuw nsw i64 %153, 24
  %155 = or i64 %150, %154
  %156 = lshr i64 %155, 3
  %157 = and i64 %156, 33554431
  %158 = getelementptr inbounds i64, i64* %0, i64 7
  store i64 %157, i64* %158, align 8
  %159 = load i8, i8* %151, align 1
  %160 = zext i8 %159 to i64
  %161 = getelementptr inbounds i8, i8* %1, i64 26
  %162 = load i8, i8* %161, align 1
  %163 = zext i8 %162 to i64
  %164 = shl nuw nsw i64 %163, 8
  %165 = or i64 %164, %160
  %166 = getelementptr inbounds i8, i8* %1, i64 27
  %167 = load i8, i8* %166, align 1
  %168 = zext i8 %167 to i64
  %169 = shl nuw nsw i64 %168, 16
  %170 = or i64 %165, %169
  %171 = getelementptr inbounds i8, i8* %1, i64 28
  %172 = load i8, i8* %171, align 1
  %173 = zext i8 %172 to i64
  %174 = shl nuw nsw i64 %173, 24
  %175 = or i64 %170, %174
  %176 = lshr i64 %175, 4
  %177 = and i64 %176, 67108863
  %178 = getelementptr inbounds i64, i64* %0, i64 8
  store i64 %177, i64* %178, align 8
  %179 = load i8, i8* %171, align 1
  %180 = zext i8 %179 to i64
  %181 = getelementptr inbounds i8, i8* %1, i64 29
  %182 = load i8, i8* %181, align 1
  %183 = zext i8 %182 to i64
  %184 = shl nuw nsw i64 %183, 8
  %185 = or i64 %184, %180
  %186 = getelementptr inbounds i8, i8* %1, i64 30
  %187 = load i8, i8* %186, align 1
  %188 = zext i8 %187 to i64
  %189 = shl nuw nsw i64 %188, 16
  %190 = or i64 %185, %189
  %191 = getelementptr inbounds i8, i8* %1, i64 31
  %192 = load i8, i8* %191, align 1
  %193 = zext i8 %192 to i64
  %194 = shl nuw nsw i64 %193, 24
  %195 = or i64 %190, %194
  %196 = lshr i64 %195, 6
  %197 = and i64 %196, 33554431
  %198 = getelementptr inbounds i64, i64* %0, i64 9
  store i64 %197, i64* %198, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal fastcc void @cmult(i64* nocapture %0, i64* nocapture %1, i8* readonly %2, i64* readonly %3) unnamed_addr #0 {
  %5 = alloca [19 x i64], align 16
  %6 = alloca [19 x i64], align 16
  %7 = alloca [19 x i64], align 16
  %8 = alloca [19 x i64], align 16
  %9 = alloca [19 x i64], align 16
  %10 = alloca [19 x i64], align 16
  %11 = alloca [19 x i64], align 16
  %12 = alloca [19 x i64], align 16
  %13 = bitcast [19 x i64]* %5 to i8*
  %14 = bitcast [19 x i64]* %6 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(152) %14, i8 0, i64 152, i1 false)
  %15 = getelementptr inbounds [19 x i64], [19 x i64]* %6, i64 0, i64 0
  store i64 1, i64* %15, align 16
  %16 = bitcast [19 x i64]* %7 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(152) %16, i8 0, i64 152, i1 false)
  %17 = getelementptr inbounds [19 x i64], [19 x i64]* %7, i64 0, i64 0
  store i64 1, i64* %17, align 16
  %18 = bitcast [19 x i64]* %8 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(152) %18, i8 0, i64 152, i1 false)
  %19 = getelementptr inbounds [19 x i64], [19 x i64]* %5, i64 0, i64 0
  %20 = getelementptr inbounds [19 x i64], [19 x i64]* %8, i64 0, i64 0
  %21 = bitcast [19 x i64]* %9 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(152) %21, i8 0, i64 152, i1 false)
  %22 = bitcast [19 x i64]* %10 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(152) %22, i8 0, i64 152, i1 false)
  %23 = getelementptr inbounds [19 x i64], [19 x i64]* %10, i64 0, i64 0
  store i64 1, i64* %23, align 16
  %24 = bitcast [19 x i64]* %11 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(152) %24, i8 0, i64 152, i1 false)
  %25 = bitcast [19 x i64]* %12 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(152) %25, i8 0, i64 152, i1 false)
  %26 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  store i64 1, i64* %26, align 16
  %27 = getelementptr inbounds [19 x i64], [19 x i64]* %9, i64 0, i64 0
  %28 = getelementptr inbounds [19 x i64], [19 x i64]* %11, i64 0, i64 0
  %29 = bitcast i64* %3 to i8*
  %30 = getelementptr inbounds [19 x i64], [19 x i64]* %5, i64 0, i64 10
  %31 = bitcast i64* %30 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(72) %31, i8 0, i64 72, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(80) %13, i8* nonnull align 8 dereferenceable(80) %29, i64 80, i1 false)
  %32 = getelementptr inbounds i8, i8* %2, i64 31
  %33 = load i8, i8* %32, align 1
  %34 = lshr i8 %33, 7
  %35 = zext i8 %34 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %35)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %35)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %35)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %35)
  %36 = lshr i8 %33, 6
  %37 = and i8 %36, 1
  %38 = zext i8 %37 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %38)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %38)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %38)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %38)
  %39 = lshr i8 %33, 5
  %40 = and i8 %39, 1
  %41 = zext i8 %40 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %41)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %41)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %41)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %41)
  %42 = lshr i8 %33, 4
  %43 = and i8 %42, 1
  %44 = zext i8 %43 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %44)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %44)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %44)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %44)
  %45 = lshr i8 %33, 3
  %46 = and i8 %45, 1
  %47 = zext i8 %46 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %47)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %47)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %47)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %47)
  %48 = lshr i8 %33, 2
  %49 = and i8 %48, 1
  %50 = zext i8 %49 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %50)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %50)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %50)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %50)
  %51 = lshr i8 %33, 1
  %52 = and i8 %51, 1
  %53 = zext i8 %52 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %53)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %53)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %53)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %53)
  %54 = and i8 %33, 1
  %55 = zext i8 %54 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %55)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %55)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %55)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %55)
  %56 = getelementptr inbounds i8, i8* %2, i64 30
  %57 = load i8, i8* %56, align 1
  %58 = lshr i8 %57, 7
  %59 = zext i8 %58 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %59)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %59)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %59)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %59)
  %60 = lshr i8 %57, 6
  %61 = and i8 %60, 1
  %62 = zext i8 %61 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %62)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %62)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %62)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %62)
  %63 = lshr i8 %57, 5
  %64 = and i8 %63, 1
  %65 = zext i8 %64 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %65)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %65)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %65)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %65)
  %66 = lshr i8 %57, 4
  %67 = and i8 %66, 1
  %68 = zext i8 %67 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %68)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %68)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %68)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %68)
  %69 = lshr i8 %57, 3
  %70 = and i8 %69, 1
  %71 = zext i8 %70 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %71)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %71)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %71)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %71)
  %72 = lshr i8 %57, 2
  %73 = and i8 %72, 1
  %74 = zext i8 %73 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %74)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %74)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %74)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %74)
  %75 = lshr i8 %57, 1
  %76 = and i8 %75, 1
  %77 = zext i8 %76 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %77)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %77)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %77)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %77)
  %78 = and i8 %57, 1
  %79 = zext i8 %78 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %79)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %79)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %79)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %79)
  %80 = getelementptr inbounds i8, i8* %2, i64 29
  %81 = load i8, i8* %80, align 1
  %82 = lshr i8 %81, 7
  %83 = zext i8 %82 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %83)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %83)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %83)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %83)
  %84 = lshr i8 %81, 6
  %85 = and i8 %84, 1
  %86 = zext i8 %85 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %86)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %86)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %86)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %86)
  %87 = lshr i8 %81, 5
  %88 = and i8 %87, 1
  %89 = zext i8 %88 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %89)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %89)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %89)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %89)
  %90 = lshr i8 %81, 4
  %91 = and i8 %90, 1
  %92 = zext i8 %91 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %92)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %92)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %92)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %92)
  %93 = lshr i8 %81, 3
  %94 = and i8 %93, 1
  %95 = zext i8 %94 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %95)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %95)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %95)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %95)
  %96 = lshr i8 %81, 2
  %97 = and i8 %96, 1
  %98 = zext i8 %97 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %98)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %98)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %98)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %98)
  %99 = lshr i8 %81, 1
  %100 = and i8 %99, 1
  %101 = zext i8 %100 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %101)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %101)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %101)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %101)
  %102 = and i8 %81, 1
  %103 = zext i8 %102 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %103)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %103)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %103)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %103)
  %104 = getelementptr inbounds i8, i8* %2, i64 28
  %105 = load i8, i8* %104, align 1
  %106 = lshr i8 %105, 7
  %107 = zext i8 %106 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %107)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %107)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %107)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %107)
  %108 = lshr i8 %105, 6
  %109 = and i8 %108, 1
  %110 = zext i8 %109 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %110)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %110)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %110)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %110)
  %111 = lshr i8 %105, 5
  %112 = and i8 %111, 1
  %113 = zext i8 %112 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %113)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %113)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %113)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %113)
  %114 = lshr i8 %105, 4
  %115 = and i8 %114, 1
  %116 = zext i8 %115 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %116)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %116)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %116)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %116)
  %117 = lshr i8 %105, 3
  %118 = and i8 %117, 1
  %119 = zext i8 %118 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %119)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %119)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %119)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %119)
  %120 = lshr i8 %105, 2
  %121 = and i8 %120, 1
  %122 = zext i8 %121 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %122)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %122)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %122)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %122)
  %123 = lshr i8 %105, 1
  %124 = and i8 %123, 1
  %125 = zext i8 %124 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %125)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %125)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %125)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %125)
  %126 = and i8 %105, 1
  %127 = zext i8 %126 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %127)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %127)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %127)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %127)
  %128 = getelementptr inbounds i8, i8* %2, i64 27
  %129 = load i8, i8* %128, align 1
  %130 = lshr i8 %129, 7
  %131 = zext i8 %130 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %131)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %131)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %131)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %131)
  %132 = lshr i8 %129, 6
  %133 = and i8 %132, 1
  %134 = zext i8 %133 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %134)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %134)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %134)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %134)
  %135 = lshr i8 %129, 5
  %136 = and i8 %135, 1
  %137 = zext i8 %136 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %137)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %137)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %137)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %137)
  %138 = lshr i8 %129, 4
  %139 = and i8 %138, 1
  %140 = zext i8 %139 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %140)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %140)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %140)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %140)
  %141 = lshr i8 %129, 3
  %142 = and i8 %141, 1
  %143 = zext i8 %142 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %143)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %143)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %143)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %143)
  %144 = lshr i8 %129, 2
  %145 = and i8 %144, 1
  %146 = zext i8 %145 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %146)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %146)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %146)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %146)
  %147 = lshr i8 %129, 1
  %148 = and i8 %147, 1
  %149 = zext i8 %148 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %149)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %149)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %149)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %149)
  %150 = and i8 %129, 1
  %151 = zext i8 %150 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %151)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %151)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %151)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %151)
  %152 = getelementptr inbounds i8, i8* %2, i64 26
  %153 = load i8, i8* %152, align 1
  %154 = lshr i8 %153, 7
  %155 = zext i8 %154 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %155)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %155)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %155)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %155)
  %156 = lshr i8 %153, 6
  %157 = and i8 %156, 1
  %158 = zext i8 %157 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %158)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %158)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %158)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %158)
  %159 = lshr i8 %153, 5
  %160 = and i8 %159, 1
  %161 = zext i8 %160 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %161)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %161)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %161)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %161)
  %162 = lshr i8 %153, 4
  %163 = and i8 %162, 1
  %164 = zext i8 %163 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %164)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %164)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %164)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %164)
  %165 = lshr i8 %153, 3
  %166 = and i8 %165, 1
  %167 = zext i8 %166 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %167)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %167)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %167)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %167)
  %168 = lshr i8 %153, 2
  %169 = and i8 %168, 1
  %170 = zext i8 %169 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %170)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %170)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %170)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %170)
  %171 = lshr i8 %153, 1
  %172 = and i8 %171, 1
  %173 = zext i8 %172 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %173)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %173)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %173)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %173)
  %174 = and i8 %153, 1
  %175 = zext i8 %174 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %175)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %175)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %175)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %175)
  %176 = getelementptr inbounds i8, i8* %2, i64 25
  %177 = load i8, i8* %176, align 1
  %178 = lshr i8 %177, 7
  %179 = zext i8 %178 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %179)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %179)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %179)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %179)
  %180 = lshr i8 %177, 6
  %181 = and i8 %180, 1
  %182 = zext i8 %181 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %182)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %182)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %182)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %182)
  %183 = lshr i8 %177, 5
  %184 = and i8 %183, 1
  %185 = zext i8 %184 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %185)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %185)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %185)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %185)
  %186 = lshr i8 %177, 4
  %187 = and i8 %186, 1
  %188 = zext i8 %187 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %188)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %188)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %188)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %188)
  %189 = lshr i8 %177, 3
  %190 = and i8 %189, 1
  %191 = zext i8 %190 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %191)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %191)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %191)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %191)
  %192 = lshr i8 %177, 2
  %193 = and i8 %192, 1
  %194 = zext i8 %193 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %194)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %194)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %194)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %194)
  %195 = lshr i8 %177, 1
  %196 = and i8 %195, 1
  %197 = zext i8 %196 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %197)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %197)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %197)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %197)
  %198 = and i8 %177, 1
  %199 = zext i8 %198 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %199)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %199)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %199)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %199)
  %200 = getelementptr inbounds i8, i8* %2, i64 24
  %201 = load i8, i8* %200, align 1
  %202 = lshr i8 %201, 7
  %203 = zext i8 %202 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %203)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %203)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %203)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %203)
  %204 = lshr i8 %201, 6
  %205 = and i8 %204, 1
  %206 = zext i8 %205 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %206)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %206)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %206)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %206)
  %207 = lshr i8 %201, 5
  %208 = and i8 %207, 1
  %209 = zext i8 %208 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %209)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %209)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %209)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %209)
  %210 = lshr i8 %201, 4
  %211 = and i8 %210, 1
  %212 = zext i8 %211 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %212)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %212)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %212)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %212)
  %213 = lshr i8 %201, 3
  %214 = and i8 %213, 1
  %215 = zext i8 %214 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %215)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %215)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %215)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %215)
  %216 = lshr i8 %201, 2
  %217 = and i8 %216, 1
  %218 = zext i8 %217 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %218)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %218)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %218)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %218)
  %219 = lshr i8 %201, 1
  %220 = and i8 %219, 1
  %221 = zext i8 %220 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %221)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %221)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %221)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %221)
  %222 = and i8 %201, 1
  %223 = zext i8 %222 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %223)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %223)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %223)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %223)
  %224 = getelementptr inbounds i8, i8* %2, i64 23
  %225 = load i8, i8* %224, align 1
  %226 = lshr i8 %225, 7
  %227 = zext i8 %226 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %227)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %227)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %227)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %227)
  %228 = lshr i8 %225, 6
  %229 = and i8 %228, 1
  %230 = zext i8 %229 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %230)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %230)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %230)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %230)
  %231 = lshr i8 %225, 5
  %232 = and i8 %231, 1
  %233 = zext i8 %232 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %233)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %233)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %233)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %233)
  %234 = lshr i8 %225, 4
  %235 = and i8 %234, 1
  %236 = zext i8 %235 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %236)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %236)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %236)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %236)
  %237 = lshr i8 %225, 3
  %238 = and i8 %237, 1
  %239 = zext i8 %238 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %239)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %239)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %239)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %239)
  %240 = lshr i8 %225, 2
  %241 = and i8 %240, 1
  %242 = zext i8 %241 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %242)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %242)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %242)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %242)
  %243 = lshr i8 %225, 1
  %244 = and i8 %243, 1
  %245 = zext i8 %244 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %245)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %245)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %245)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %245)
  %246 = and i8 %225, 1
  %247 = zext i8 %246 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %247)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %247)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %247)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %247)
  %248 = getelementptr inbounds i8, i8* %2, i64 22
  %249 = load i8, i8* %248, align 1
  %250 = lshr i8 %249, 7
  %251 = zext i8 %250 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %251)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %251)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %251)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %251)
  %252 = lshr i8 %249, 6
  %253 = and i8 %252, 1
  %254 = zext i8 %253 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %254)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %254)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %254)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %254)
  %255 = lshr i8 %249, 5
  %256 = and i8 %255, 1
  %257 = zext i8 %256 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %257)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %257)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %257)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %257)
  %258 = lshr i8 %249, 4
  %259 = and i8 %258, 1
  %260 = zext i8 %259 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %260)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %260)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %260)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %260)
  %261 = lshr i8 %249, 3
  %262 = and i8 %261, 1
  %263 = zext i8 %262 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %263)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %263)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %263)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %263)
  %264 = lshr i8 %249, 2
  %265 = and i8 %264, 1
  %266 = zext i8 %265 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %266)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %266)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %266)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %266)
  %267 = lshr i8 %249, 1
  %268 = and i8 %267, 1
  %269 = zext i8 %268 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %269)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %269)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %269)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %269)
  %270 = and i8 %249, 1
  %271 = zext i8 %270 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %271)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %271)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %271)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %271)
  %272 = getelementptr inbounds i8, i8* %2, i64 21
  %273 = load i8, i8* %272, align 1
  %274 = lshr i8 %273, 7
  %275 = zext i8 %274 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %275)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %275)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %275)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %275)
  %276 = lshr i8 %273, 6
  %277 = and i8 %276, 1
  %278 = zext i8 %277 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %278)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %278)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %278)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %278)
  %279 = lshr i8 %273, 5
  %280 = and i8 %279, 1
  %281 = zext i8 %280 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %281)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %281)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %281)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %281)
  %282 = lshr i8 %273, 4
  %283 = and i8 %282, 1
  %284 = zext i8 %283 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %284)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %284)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %284)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %284)
  %285 = lshr i8 %273, 3
  %286 = and i8 %285, 1
  %287 = zext i8 %286 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %287)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %287)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %287)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %287)
  %288 = lshr i8 %273, 2
  %289 = and i8 %288, 1
  %290 = zext i8 %289 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %290)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %290)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %290)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %290)
  %291 = lshr i8 %273, 1
  %292 = and i8 %291, 1
  %293 = zext i8 %292 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %293)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %293)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %293)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %293)
  %294 = and i8 %273, 1
  %295 = zext i8 %294 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %295)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %295)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %295)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %295)
  %296 = getelementptr inbounds i8, i8* %2, i64 20
  %297 = load i8, i8* %296, align 1
  %298 = lshr i8 %297, 7
  %299 = zext i8 %298 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %299)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %299)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %299)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %299)
  %300 = lshr i8 %297, 6
  %301 = and i8 %300, 1
  %302 = zext i8 %301 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %302)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %302)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %302)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %302)
  %303 = lshr i8 %297, 5
  %304 = and i8 %303, 1
  %305 = zext i8 %304 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %305)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %305)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %305)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %305)
  %306 = lshr i8 %297, 4
  %307 = and i8 %306, 1
  %308 = zext i8 %307 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %308)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %308)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %308)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %308)
  %309 = lshr i8 %297, 3
  %310 = and i8 %309, 1
  %311 = zext i8 %310 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %311)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %311)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %311)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %311)
  %312 = lshr i8 %297, 2
  %313 = and i8 %312, 1
  %314 = zext i8 %313 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %314)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %314)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %314)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %314)
  %315 = lshr i8 %297, 1
  %316 = and i8 %315, 1
  %317 = zext i8 %316 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %317)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %317)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %317)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %317)
  %318 = and i8 %297, 1
  %319 = zext i8 %318 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %319)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %319)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %319)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %319)
  %320 = getelementptr inbounds i8, i8* %2, i64 19
  %321 = load i8, i8* %320, align 1
  %322 = lshr i8 %321, 7
  %323 = zext i8 %322 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %323)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %323)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %323)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %323)
  %324 = lshr i8 %321, 6
  %325 = and i8 %324, 1
  %326 = zext i8 %325 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %326)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %326)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %326)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %326)
  %327 = lshr i8 %321, 5
  %328 = and i8 %327, 1
  %329 = zext i8 %328 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %329)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %329)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %329)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %329)
  %330 = lshr i8 %321, 4
  %331 = and i8 %330, 1
  %332 = zext i8 %331 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %332)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %332)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %332)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %332)
  %333 = lshr i8 %321, 3
  %334 = and i8 %333, 1
  %335 = zext i8 %334 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %335)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %335)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %335)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %335)
  %336 = lshr i8 %321, 2
  %337 = and i8 %336, 1
  %338 = zext i8 %337 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %338)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %338)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %338)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %338)
  %339 = lshr i8 %321, 1
  %340 = and i8 %339, 1
  %341 = zext i8 %340 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %341)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %341)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %341)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %341)
  %342 = and i8 %321, 1
  %343 = zext i8 %342 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %343)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %343)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %343)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %343)
  %344 = getelementptr inbounds i8, i8* %2, i64 18
  %345 = load i8, i8* %344, align 1
  %346 = lshr i8 %345, 7
  %347 = zext i8 %346 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %347)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %347)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %347)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %347)
  %348 = lshr i8 %345, 6
  %349 = and i8 %348, 1
  %350 = zext i8 %349 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %350)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %350)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %350)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %350)
  %351 = lshr i8 %345, 5
  %352 = and i8 %351, 1
  %353 = zext i8 %352 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %353)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %353)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %353)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %353)
  %354 = lshr i8 %345, 4
  %355 = and i8 %354, 1
  %356 = zext i8 %355 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %356)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %356)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %356)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %356)
  %357 = lshr i8 %345, 3
  %358 = and i8 %357, 1
  %359 = zext i8 %358 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %359)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %359)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %359)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %359)
  %360 = lshr i8 %345, 2
  %361 = and i8 %360, 1
  %362 = zext i8 %361 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %362)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %362)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %362)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %362)
  %363 = lshr i8 %345, 1
  %364 = and i8 %363, 1
  %365 = zext i8 %364 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %365)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %365)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %365)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %365)
  %366 = and i8 %345, 1
  %367 = zext i8 %366 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %367)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %367)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %367)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %367)
  %368 = getelementptr inbounds i8, i8* %2, i64 17
  %369 = load i8, i8* %368, align 1
  %370 = lshr i8 %369, 7
  %371 = zext i8 %370 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %371)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %371)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %371)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %371)
  %372 = lshr i8 %369, 6
  %373 = and i8 %372, 1
  %374 = zext i8 %373 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %374)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %374)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %374)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %374)
  %375 = lshr i8 %369, 5
  %376 = and i8 %375, 1
  %377 = zext i8 %376 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %377)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %377)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %377)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %377)
  %378 = lshr i8 %369, 4
  %379 = and i8 %378, 1
  %380 = zext i8 %379 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %380)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %380)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %380)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %380)
  %381 = lshr i8 %369, 3
  %382 = and i8 %381, 1
  %383 = zext i8 %382 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %383)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %383)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %383)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %383)
  %384 = lshr i8 %369, 2
  %385 = and i8 %384, 1
  %386 = zext i8 %385 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %386)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %386)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %386)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %386)
  %387 = lshr i8 %369, 1
  %388 = and i8 %387, 1
  %389 = zext i8 %388 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %389)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %389)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %389)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %389)
  %390 = and i8 %369, 1
  %391 = zext i8 %390 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %391)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %391)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %391)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %391)
  %392 = getelementptr inbounds i8, i8* %2, i64 16
  %393 = load i8, i8* %392, align 1
  %394 = lshr i8 %393, 7
  %395 = zext i8 %394 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %395)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %395)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %395)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %395)
  %396 = lshr i8 %393, 6
  %397 = and i8 %396, 1
  %398 = zext i8 %397 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %398)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %398)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %398)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %398)
  %399 = lshr i8 %393, 5
  %400 = and i8 %399, 1
  %401 = zext i8 %400 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %401)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %401)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %401)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %401)
  %402 = lshr i8 %393, 4
  %403 = and i8 %402, 1
  %404 = zext i8 %403 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %404)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %404)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %404)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %404)
  %405 = lshr i8 %393, 3
  %406 = and i8 %405, 1
  %407 = zext i8 %406 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %407)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %407)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %407)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %407)
  %408 = lshr i8 %393, 2
  %409 = and i8 %408, 1
  %410 = zext i8 %409 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %410)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %410)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %410)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %410)
  %411 = lshr i8 %393, 1
  %412 = and i8 %411, 1
  %413 = zext i8 %412 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %413)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %413)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %413)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %413)
  %414 = and i8 %393, 1
  %415 = zext i8 %414 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %415)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %415)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %415)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %415)
  %416 = getelementptr inbounds i8, i8* %2, i64 15
  %417 = load i8, i8* %416, align 1
  %418 = lshr i8 %417, 7
  %419 = zext i8 %418 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %419)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %419)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %419)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %419)
  %420 = lshr i8 %417, 6
  %421 = and i8 %420, 1
  %422 = zext i8 %421 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %422)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %422)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %422)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %422)
  %423 = lshr i8 %417, 5
  %424 = and i8 %423, 1
  %425 = zext i8 %424 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %425)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %425)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %425)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %425)
  %426 = lshr i8 %417, 4
  %427 = and i8 %426, 1
  %428 = zext i8 %427 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %428)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %428)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %428)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %428)
  %429 = lshr i8 %417, 3
  %430 = and i8 %429, 1
  %431 = zext i8 %430 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %431)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %431)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %431)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %431)
  %432 = lshr i8 %417, 2
  %433 = and i8 %432, 1
  %434 = zext i8 %433 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %434)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %434)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %434)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %434)
  %435 = lshr i8 %417, 1
  %436 = and i8 %435, 1
  %437 = zext i8 %436 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %437)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %437)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %437)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %437)
  %438 = and i8 %417, 1
  %439 = zext i8 %438 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %439)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %439)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %439)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %439)
  %440 = getelementptr inbounds i8, i8* %2, i64 14
  %441 = load i8, i8* %440, align 1
  %442 = lshr i8 %441, 7
  %443 = zext i8 %442 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %443)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %443)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %443)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %443)
  %444 = lshr i8 %441, 6
  %445 = and i8 %444, 1
  %446 = zext i8 %445 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %446)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %446)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %446)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %446)
  %447 = lshr i8 %441, 5
  %448 = and i8 %447, 1
  %449 = zext i8 %448 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %449)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %449)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %449)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %449)
  %450 = lshr i8 %441, 4
  %451 = and i8 %450, 1
  %452 = zext i8 %451 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %452)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %452)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %452)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %452)
  %453 = lshr i8 %441, 3
  %454 = and i8 %453, 1
  %455 = zext i8 %454 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %455)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %455)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %455)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %455)
  %456 = lshr i8 %441, 2
  %457 = and i8 %456, 1
  %458 = zext i8 %457 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %458)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %458)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %458)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %458)
  %459 = lshr i8 %441, 1
  %460 = and i8 %459, 1
  %461 = zext i8 %460 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %461)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %461)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %461)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %461)
  %462 = and i8 %441, 1
  %463 = zext i8 %462 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %463)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %463)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %463)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %463)
  %464 = getelementptr inbounds i8, i8* %2, i64 13
  %465 = load i8, i8* %464, align 1
  %466 = lshr i8 %465, 7
  %467 = zext i8 %466 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %467)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %467)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %467)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %467)
  %468 = lshr i8 %465, 6
  %469 = and i8 %468, 1
  %470 = zext i8 %469 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %470)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %470)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %470)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %470)
  %471 = lshr i8 %465, 5
  %472 = and i8 %471, 1
  %473 = zext i8 %472 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %473)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %473)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %473)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %473)
  %474 = lshr i8 %465, 4
  %475 = and i8 %474, 1
  %476 = zext i8 %475 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %476)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %476)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %476)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %476)
  %477 = lshr i8 %465, 3
  %478 = and i8 %477, 1
  %479 = zext i8 %478 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %479)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %479)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %479)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %479)
  %480 = lshr i8 %465, 2
  %481 = and i8 %480, 1
  %482 = zext i8 %481 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %482)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %482)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %482)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %482)
  %483 = lshr i8 %465, 1
  %484 = and i8 %483, 1
  %485 = zext i8 %484 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %485)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %485)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %485)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %485)
  %486 = and i8 %465, 1
  %487 = zext i8 %486 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %487)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %487)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %487)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %487)
  %488 = getelementptr inbounds i8, i8* %2, i64 12
  %489 = load i8, i8* %488, align 1
  %490 = lshr i8 %489, 7
  %491 = zext i8 %490 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %491)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %491)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %491)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %491)
  %492 = lshr i8 %489, 6
  %493 = and i8 %492, 1
  %494 = zext i8 %493 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %494)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %494)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %494)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %494)
  %495 = lshr i8 %489, 5
  %496 = and i8 %495, 1
  %497 = zext i8 %496 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %497)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %497)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %497)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %497)
  %498 = lshr i8 %489, 4
  %499 = and i8 %498, 1
  %500 = zext i8 %499 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %500)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %500)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %500)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %500)
  %501 = lshr i8 %489, 3
  %502 = and i8 %501, 1
  %503 = zext i8 %502 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %503)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %503)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %503)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %503)
  %504 = lshr i8 %489, 2
  %505 = and i8 %504, 1
  %506 = zext i8 %505 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %506)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %506)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %506)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %506)
  %507 = lshr i8 %489, 1
  %508 = and i8 %507, 1
  %509 = zext i8 %508 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %509)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %509)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %509)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %509)
  %510 = and i8 %489, 1
  %511 = zext i8 %510 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %511)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %511)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %511)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %511)
  %512 = getelementptr inbounds i8, i8* %2, i64 11
  %513 = load i8, i8* %512, align 1
  %514 = lshr i8 %513, 7
  %515 = zext i8 %514 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %515)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %515)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %515)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %515)
  %516 = lshr i8 %513, 6
  %517 = and i8 %516, 1
  %518 = zext i8 %517 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %518)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %518)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %518)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %518)
  %519 = lshr i8 %513, 5
  %520 = and i8 %519, 1
  %521 = zext i8 %520 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %521)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %521)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %521)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %521)
  %522 = lshr i8 %513, 4
  %523 = and i8 %522, 1
  %524 = zext i8 %523 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %524)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %524)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %524)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %524)
  %525 = lshr i8 %513, 3
  %526 = and i8 %525, 1
  %527 = zext i8 %526 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %527)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %527)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %527)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %527)
  %528 = lshr i8 %513, 2
  %529 = and i8 %528, 1
  %530 = zext i8 %529 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %530)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %530)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %530)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %530)
  %531 = lshr i8 %513, 1
  %532 = and i8 %531, 1
  %533 = zext i8 %532 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %533)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %533)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %533)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %533)
  %534 = and i8 %513, 1
  %535 = zext i8 %534 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %535)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %535)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %535)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %535)
  %536 = getelementptr inbounds i8, i8* %2, i64 10
  %537 = load i8, i8* %536, align 1
  %538 = lshr i8 %537, 7
  %539 = zext i8 %538 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %539)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %539)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %539)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %539)
  %540 = lshr i8 %537, 6
  %541 = and i8 %540, 1
  %542 = zext i8 %541 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %542)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %542)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %542)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %542)
  %543 = lshr i8 %537, 5
  %544 = and i8 %543, 1
  %545 = zext i8 %544 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %545)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %545)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %545)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %545)
  %546 = lshr i8 %537, 4
  %547 = and i8 %546, 1
  %548 = zext i8 %547 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %548)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %548)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %548)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %548)
  %549 = lshr i8 %537, 3
  %550 = and i8 %549, 1
  %551 = zext i8 %550 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %551)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %551)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %551)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %551)
  %552 = lshr i8 %537, 2
  %553 = and i8 %552, 1
  %554 = zext i8 %553 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %554)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %554)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %554)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %554)
  %555 = lshr i8 %537, 1
  %556 = and i8 %555, 1
  %557 = zext i8 %556 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %557)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %557)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %557)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %557)
  %558 = and i8 %537, 1
  %559 = zext i8 %558 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %559)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %559)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %559)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %559)
  %560 = getelementptr inbounds i8, i8* %2, i64 9
  %561 = load i8, i8* %560, align 1
  %562 = lshr i8 %561, 7
  %563 = zext i8 %562 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %563)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %563)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %563)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %563)
  %564 = lshr i8 %561, 6
  %565 = and i8 %564, 1
  %566 = zext i8 %565 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %566)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %566)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %566)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %566)
  %567 = lshr i8 %561, 5
  %568 = and i8 %567, 1
  %569 = zext i8 %568 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %569)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %569)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %569)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %569)
  %570 = lshr i8 %561, 4
  %571 = and i8 %570, 1
  %572 = zext i8 %571 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %572)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %572)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %572)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %572)
  %573 = lshr i8 %561, 3
  %574 = and i8 %573, 1
  %575 = zext i8 %574 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %575)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %575)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %575)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %575)
  %576 = lshr i8 %561, 2
  %577 = and i8 %576, 1
  %578 = zext i8 %577 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %578)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %578)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %578)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %578)
  %579 = lshr i8 %561, 1
  %580 = and i8 %579, 1
  %581 = zext i8 %580 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %581)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %581)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %581)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %581)
  %582 = and i8 %561, 1
  %583 = zext i8 %582 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %583)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %583)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %583)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %583)
  %584 = getelementptr inbounds i8, i8* %2, i64 8
  %585 = load i8, i8* %584, align 1
  %586 = lshr i8 %585, 7
  %587 = zext i8 %586 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %587)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %587)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %587)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %587)
  %588 = lshr i8 %585, 6
  %589 = and i8 %588, 1
  %590 = zext i8 %589 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %590)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %590)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %590)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %590)
  %591 = lshr i8 %585, 5
  %592 = and i8 %591, 1
  %593 = zext i8 %592 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %593)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %593)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %593)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %593)
  %594 = lshr i8 %585, 4
  %595 = and i8 %594, 1
  %596 = zext i8 %595 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %596)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %596)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %596)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %596)
  %597 = lshr i8 %585, 3
  %598 = and i8 %597, 1
  %599 = zext i8 %598 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %599)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %599)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %599)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %599)
  %600 = lshr i8 %585, 2
  %601 = and i8 %600, 1
  %602 = zext i8 %601 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %602)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %602)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %602)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %602)
  %603 = lshr i8 %585, 1
  %604 = and i8 %603, 1
  %605 = zext i8 %604 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %605)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %605)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %605)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %605)
  %606 = and i8 %585, 1
  %607 = zext i8 %606 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %607)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %607)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %607)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %607)
  %608 = getelementptr inbounds i8, i8* %2, i64 7
  %609 = load i8, i8* %608, align 1
  %610 = lshr i8 %609, 7
  %611 = zext i8 %610 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %611)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %611)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %611)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %611)
  %612 = lshr i8 %609, 6
  %613 = and i8 %612, 1
  %614 = zext i8 %613 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %614)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %614)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %614)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %614)
  %615 = lshr i8 %609, 5
  %616 = and i8 %615, 1
  %617 = zext i8 %616 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %617)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %617)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %617)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %617)
  %618 = lshr i8 %609, 4
  %619 = and i8 %618, 1
  %620 = zext i8 %619 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %620)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %620)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %620)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %620)
  %621 = lshr i8 %609, 3
  %622 = and i8 %621, 1
  %623 = zext i8 %622 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %623)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %623)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %623)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %623)
  %624 = lshr i8 %609, 2
  %625 = and i8 %624, 1
  %626 = zext i8 %625 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %626)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %626)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %626)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %626)
  %627 = lshr i8 %609, 1
  %628 = and i8 %627, 1
  %629 = zext i8 %628 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %629)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %629)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %629)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %629)
  %630 = and i8 %609, 1
  %631 = zext i8 %630 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %631)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %631)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %631)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %631)
  %632 = getelementptr inbounds i8, i8* %2, i64 6
  %633 = load i8, i8* %632, align 1
  %634 = lshr i8 %633, 7
  %635 = zext i8 %634 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %635)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %635)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %635)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %635)
  %636 = lshr i8 %633, 6
  %637 = and i8 %636, 1
  %638 = zext i8 %637 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %638)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %638)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %638)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %638)
  %639 = lshr i8 %633, 5
  %640 = and i8 %639, 1
  %641 = zext i8 %640 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %641)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %641)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %641)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %641)
  %642 = lshr i8 %633, 4
  %643 = and i8 %642, 1
  %644 = zext i8 %643 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %644)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %644)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %644)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %644)
  %645 = lshr i8 %633, 3
  %646 = and i8 %645, 1
  %647 = zext i8 %646 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %647)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %647)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %647)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %647)
  %648 = lshr i8 %633, 2
  %649 = and i8 %648, 1
  %650 = zext i8 %649 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %650)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %650)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %650)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %650)
  %651 = lshr i8 %633, 1
  %652 = and i8 %651, 1
  %653 = zext i8 %652 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %653)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %653)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %653)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %653)
  %654 = and i8 %633, 1
  %655 = zext i8 %654 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %655)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %655)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %655)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %655)
  %656 = getelementptr inbounds i8, i8* %2, i64 5
  %657 = load i8, i8* %656, align 1
  %658 = lshr i8 %657, 7
  %659 = zext i8 %658 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %659)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %659)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %659)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %659)
  %660 = lshr i8 %657, 6
  %661 = and i8 %660, 1
  %662 = zext i8 %661 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %662)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %662)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %662)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %662)
  %663 = lshr i8 %657, 5
  %664 = and i8 %663, 1
  %665 = zext i8 %664 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %665)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %665)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %665)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %665)
  %666 = lshr i8 %657, 4
  %667 = and i8 %666, 1
  %668 = zext i8 %667 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %668)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %668)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %668)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %668)
  %669 = lshr i8 %657, 3
  %670 = and i8 %669, 1
  %671 = zext i8 %670 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %671)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %671)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %671)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %671)
  %672 = lshr i8 %657, 2
  %673 = and i8 %672, 1
  %674 = zext i8 %673 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %674)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %674)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %674)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %674)
  %675 = lshr i8 %657, 1
  %676 = and i8 %675, 1
  %677 = zext i8 %676 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %677)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %677)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %677)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %677)
  %678 = and i8 %657, 1
  %679 = zext i8 %678 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %679)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %679)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %679)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %679)
  %680 = getelementptr inbounds i8, i8* %2, i64 4
  %681 = load i8, i8* %680, align 1
  %682 = lshr i8 %681, 7
  %683 = zext i8 %682 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %683)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %683)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %683)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %683)
  %684 = lshr i8 %681, 6
  %685 = and i8 %684, 1
  %686 = zext i8 %685 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %686)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %686)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %686)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %686)
  %687 = lshr i8 %681, 5
  %688 = and i8 %687, 1
  %689 = zext i8 %688 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %689)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %689)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %689)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %689)
  %690 = lshr i8 %681, 4
  %691 = and i8 %690, 1
  %692 = zext i8 %691 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %692)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %692)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %692)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %692)
  %693 = lshr i8 %681, 3
  %694 = and i8 %693, 1
  %695 = zext i8 %694 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %695)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %695)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %695)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %695)
  %696 = lshr i8 %681, 2
  %697 = and i8 %696, 1
  %698 = zext i8 %697 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %698)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %698)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %698)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %698)
  %699 = lshr i8 %681, 1
  %700 = and i8 %699, 1
  %701 = zext i8 %700 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %701)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %701)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %701)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %701)
  %702 = and i8 %681, 1
  %703 = zext i8 %702 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %703)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %703)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %703)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %703)
  %704 = getelementptr inbounds i8, i8* %2, i64 3
  %705 = load i8, i8* %704, align 1
  %706 = lshr i8 %705, 7
  %707 = zext i8 %706 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %707)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %707)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %707)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %707)
  %708 = lshr i8 %705, 6
  %709 = and i8 %708, 1
  %710 = zext i8 %709 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %710)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %710)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %710)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %710)
  %711 = lshr i8 %705, 5
  %712 = and i8 %711, 1
  %713 = zext i8 %712 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %713)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %713)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %713)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %713)
  %714 = lshr i8 %705, 4
  %715 = and i8 %714, 1
  %716 = zext i8 %715 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %716)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %716)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %716)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %716)
  %717 = lshr i8 %705, 3
  %718 = and i8 %717, 1
  %719 = zext i8 %718 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %719)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %719)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %719)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %719)
  %720 = lshr i8 %705, 2
  %721 = and i8 %720, 1
  %722 = zext i8 %721 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %722)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %722)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %722)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %722)
  %723 = lshr i8 %705, 1
  %724 = and i8 %723, 1
  %725 = zext i8 %724 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %725)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %725)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %725)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %725)
  %726 = and i8 %705, 1
  %727 = zext i8 %726 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %727)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %727)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %727)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %727)
  %728 = getelementptr inbounds i8, i8* %2, i64 2
  %729 = load i8, i8* %728, align 1
  %730 = lshr i8 %729, 7
  %731 = zext i8 %730 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %731)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %731)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %731)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %731)
  %732 = lshr i8 %729, 6
  %733 = and i8 %732, 1
  %734 = zext i8 %733 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %734)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %734)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %734)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %734)
  %735 = lshr i8 %729, 5
  %736 = and i8 %735, 1
  %737 = zext i8 %736 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %737)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %737)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %737)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %737)
  %738 = lshr i8 %729, 4
  %739 = and i8 %738, 1
  %740 = zext i8 %739 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %740)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %740)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %740)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %740)
  %741 = lshr i8 %729, 3
  %742 = and i8 %741, 1
  %743 = zext i8 %742 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %743)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %743)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %743)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %743)
  %744 = lshr i8 %729, 2
  %745 = and i8 %744, 1
  %746 = zext i8 %745 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %746)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %746)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %746)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %746)
  %747 = lshr i8 %729, 1
  %748 = and i8 %747, 1
  %749 = zext i8 %748 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %749)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %749)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %749)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %749)
  %750 = and i8 %729, 1
  %751 = zext i8 %750 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %751)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %751)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %751)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %751)
  %752 = getelementptr inbounds i8, i8* %2, i64 1
  %753 = load i8, i8* %752, align 1
  %754 = lshr i8 %753, 7
  %755 = zext i8 %754 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %755)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %755)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %755)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %755)
  %756 = lshr i8 %753, 6
  %757 = and i8 %756, 1
  %758 = zext i8 %757 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %758)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %758)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %758)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %758)
  %759 = lshr i8 %753, 5
  %760 = and i8 %759, 1
  %761 = zext i8 %760 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %761)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %761)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %761)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %761)
  %762 = lshr i8 %753, 4
  %763 = and i8 %762, 1
  %764 = zext i8 %763 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %764)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %764)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %764)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %764)
  %765 = lshr i8 %753, 3
  %766 = and i8 %765, 1
  %767 = zext i8 %766 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %767)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %767)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %767)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %767)
  %768 = lshr i8 %753, 2
  %769 = and i8 %768, 1
  %770 = zext i8 %769 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %770)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %770)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %770)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %770)
  %771 = lshr i8 %753, 1
  %772 = and i8 %771, 1
  %773 = zext i8 %772 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %773)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %773)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %773)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %773)
  %774 = and i8 %753, 1
  %775 = zext i8 %774 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %775)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %775)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %775)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %775)
  %776 = load i8, i8* %2, align 1
  %777 = lshr i8 %776, 7
  %778 = zext i8 %777 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %778)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %778)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %778)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %778)
  %779 = lshr i8 %776, 6
  %780 = and i8 %779, 1
  %781 = zext i8 %780 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %781)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %781)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %781)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %781)
  %782 = lshr i8 %776, 5
  %783 = and i8 %782, 1
  %784 = zext i8 %783 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %784)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %784)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %784)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %784)
  %785 = lshr i8 %776, 4
  %786 = and i8 %785, 1
  %787 = zext i8 %786 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %787)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %787)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %787)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %787)
  %788 = lshr i8 %776, 3
  %789 = and i8 %788, 1
  %790 = zext i8 %789 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %790)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %790)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %790)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %790)
  %791 = lshr i8 %776, 2
  %792 = and i8 %791, 1
  %793 = zext i8 %792 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %793)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %793)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %793)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %793)
  %794 = lshr i8 %776, 1
  %795 = and i8 %794, 1
  %796 = zext i8 %795 to i64
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %796)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %796)
  call fastcc void @fmonty(i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %796)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %796)
  %797 = and i8 %776, 1
  %798 = zext i8 %797 to i64
  call fastcc void @swap_conditional(i64* nonnull %28, i64* nonnull %27, i64 %798)
  call fastcc void @swap_conditional(i64* nonnull %26, i64* nonnull %23, i64 %798)
  call fastcc void @fmonty(i64* nonnull %17, i64* nonnull %20, i64* nonnull %19, i64* nonnull %15, i64* nonnull %28, i64* nonnull %26, i64* nonnull %27, i64* nonnull %23, i64* %3)
  call fastcc void @swap_conditional(i64* nonnull %17, i64* nonnull %19, i64 %798)
  call fastcc void @swap_conditional(i64* nonnull %20, i64* nonnull %15, i64 %798)
  %799 = bitcast i64* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(80) %799, i8* nonnull align 16 dereferenceable(80) %16, i64 80, i1 false)
  %800 = bitcast i64* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(80) %800, i8* nonnull align 16 dereferenceable(80) %18, i64 80, i1 false)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal fastcc void @crecip(i64* nocapture %0, i64* nocapture readonly %1) unnamed_addr #0 {
  %3 = alloca [10 x i64], align 16
  %4 = alloca [10 x i64], align 16
  %5 = alloca [10 x i64], align 16
  %6 = alloca [10 x i64], align 16
  %7 = alloca [10 x i64], align 16
  %8 = alloca [10 x i64], align 16
  %9 = alloca [10 x i64], align 16
  %10 = alloca [10 x i64], align 16
  %11 = alloca [10 x i64], align 16
  %12 = alloca [10 x i64], align 16
  %13 = getelementptr inbounds [10 x i64], [10 x i64]* %3, i64 0, i64 0
  call fastcc void @fsquare(i64* nonnull %13, i64* %1)
  %14 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %13)
  %15 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  %16 = getelementptr inbounds [10 x i64], [10 x i64]* %4, i64 0, i64 0
  call fastcc void @fmul(i64* nonnull %16, i64* nonnull %15, i64* %1)
  %17 = getelementptr inbounds [10 x i64], [10 x i64]* %5, i64 0, i64 0
  call fastcc void @fmul(i64* nonnull %17, i64* nonnull %16, i64* nonnull %13)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %17)
  %18 = getelementptr inbounds [10 x i64], [10 x i64]* %6, i64 0, i64 0
  call fastcc void @fmul(i64* nonnull %18, i64* nonnull %15, i64* nonnull %16)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %18)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  %19 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  call fastcc void @fmul(i64* nonnull %19, i64* nonnull %15, i64* nonnull %18)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %19)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  %20 = getelementptr inbounds [10 x i64], [10 x i64]* %8, i64 0, i64 0
  call fastcc void @fmul(i64* nonnull %20, i64* nonnull %14, i64* nonnull %19)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %20)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fmul(i64* nonnull %15, i64* nonnull %14, i64* nonnull %20)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  %21 = getelementptr inbounds [10 x i64], [10 x i64]* %9, i64 0, i64 0
  call fastcc void @fmul(i64* nonnull %21, i64* nonnull %15, i64* nonnull %19)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %21)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  %22 = getelementptr inbounds [10 x i64], [10 x i64]* %10, i64 0, i64 0
  call fastcc void @fmul(i64* nonnull %22, i64* nonnull %14, i64* nonnull %21)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %22)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fmul(i64* nonnull %14, i64* nonnull %15, i64* nonnull %22)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fmul(i64* nonnull %15, i64* nonnull %14, i64* nonnull %21)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fsquare(i64* nonnull %15, i64* nonnull %14)
  call fastcc void @fsquare(i64* nonnull %14, i64* nonnull %15)
  call fastcc void @fmul(i64* %0, i64* nonnull %14, i64* nonnull %17)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal fastcc void @fmul(i64* nocapture %0, i64* nocapture readonly %1, i64* nocapture readonly %2) unnamed_addr #0 {
  %4 = alloca [19 x i64], align 16
  %5 = getelementptr inbounds [19 x i64], [19 x i64]* %4, i64 0, i64 0
  call fastcc void @fproduct(i64* nonnull %5, i64* %1, i64* %2)
  call fastcc void @freduce_degree(i64* nonnull %5)
  call fastcc void @freduce_coefficients(i64* nonnull %5)
  %6 = bitcast i64* %0 to i8*
  %7 = bitcast [19 x i64]* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(80) %6, i8* nonnull align 16 dereferenceable(80) %7, i64 80, i1 false)
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define internal fastcc void @fcontract(i8* %0, i64* nocapture readonly %1) unnamed_addr #4 {
.preheader6:
  %2 = load i64, i64* %1, align 8
  %3 = trunc i64 %2 to i32
  %4 = getelementptr inbounds i64, i64* %1, i64 1
  %5 = load i64, i64* %4, align 8
  %6 = trunc i64 %5 to i32
  %7 = getelementptr inbounds i64, i64* %1, i64 2
  %8 = load i64, i64* %7, align 8
  %9 = trunc i64 %8 to i32
  %10 = getelementptr inbounds i64, i64* %1, i64 3
  %11 = load i64, i64* %10, align 8
  %12 = trunc i64 %11 to i32
  %13 = getelementptr inbounds i64, i64* %1, i64 4
  %14 = load i64, i64* %13, align 8
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds i64, i64* %1, i64 5
  %17 = load i64, i64* %16, align 8
  %18 = trunc i64 %17 to i32
  %19 = getelementptr inbounds i64, i64* %1, i64 6
  %20 = load i64, i64* %19, align 8
  %21 = trunc i64 %20 to i32
  %22 = getelementptr inbounds i64, i64* %1, i64 7
  %23 = load i64, i64* %22, align 8
  %24 = trunc i64 %23 to i32
  %25 = getelementptr inbounds i64, i64* %1, i64 8
  %26 = load i64, i64* %25, align 8
  %27 = trunc i64 %26 to i32
  %28 = getelementptr inbounds i64, i64* %1, i64 9
  %29 = load i64, i64* %28, align 8
  %30 = trunc i64 %29 to i32
  %31 = ashr i32 %3, 31
  %32 = and i32 %31, %3
  %33 = ashr i32 %32, 26
  %34 = and i32 %32, -67108864
  %35 = sub i32 %3, %34
  %36 = add nsw i32 %33, %6
  %37 = ashr i32 %36, 31
  %38 = and i32 %37, %36
  %39 = ashr i32 %38, 25
  %40 = and i32 %38, -33554432
  %41 = sub i32 %36, %40
  %42 = add nsw i32 %39, %9
  %43 = ashr i32 %42, 31
  %44 = and i32 %43, %42
  %45 = ashr i32 %44, 26
  %46 = and i32 %44, -67108864
  %47 = sub i32 %42, %46
  %48 = add nsw i32 %45, %12
  %49 = ashr i32 %48, 31
  %50 = and i32 %49, %48
  %51 = ashr i32 %50, 25
  %52 = and i32 %50, -33554432
  %53 = sub i32 %48, %52
  %54 = add nsw i32 %51, %15
  %55 = ashr i32 %54, 31
  %56 = and i32 %55, %54
  %57 = ashr i32 %56, 26
  %58 = and i32 %56, -67108864
  %59 = sub i32 %54, %58
  %60 = add nsw i32 %57, %18
  %61 = ashr i32 %60, 31
  %62 = and i32 %61, %60
  %63 = ashr i32 %62, 25
  %64 = and i32 %62, -33554432
  %65 = sub i32 %60, %64
  %66 = add nsw i32 %63, %21
  %67 = ashr i32 %66, 31
  %68 = and i32 %67, %66
  %69 = ashr i32 %68, 26
  %70 = and i32 %68, -67108864
  %71 = sub i32 %66, %70
  %72 = add nsw i32 %69, %24
  %73 = ashr i32 %72, 31
  %74 = and i32 %73, %72
  %75 = ashr i32 %74, 25
  %76 = and i32 %74, -33554432
  %77 = sub i32 %72, %76
  %78 = add nsw i32 %75, %27
  %79 = ashr i32 %78, 31
  %80 = and i32 %79, %78
  %81 = ashr i32 %80, 26
  %82 = and i32 %80, -67108864
  %83 = sub i32 %78, %82
  %84 = add nsw i32 %81, %30
  %85 = ashr i32 %84, 31
  %86 = and i32 %85, %84
  %87 = ashr i32 %86, 25
  %88 = and i32 %86, -33554432
  %89 = sub i32 %84, %88
  %90 = mul nsw i32 %87, 19
  %91 = add i32 %90, %35
  %92 = ashr i32 %91, 31
  %93 = and i32 %92, %91
  %94 = ashr i32 %93, 26
  %95 = and i32 %93, -67108864
  %96 = sub i32 %91, %95
  %97 = add nsw i32 %94, %41
  %98 = ashr i32 %97, 31
  %99 = and i32 %98, %97
  %100 = ashr i32 %99, 25
  %101 = and i32 %99, -33554432
  %102 = sub i32 %97, %101
  %103 = add nsw i32 %100, %47
  %104 = ashr i32 %103, 31
  %105 = and i32 %104, %103
  %106 = ashr i32 %105, 26
  %107 = and i32 %105, -67108864
  %108 = sub i32 %103, %107
  %109 = add nsw i32 %106, %53
  %110 = ashr i32 %109, 31
  %111 = and i32 %110, %109
  %112 = ashr i32 %111, 25
  %113 = and i32 %111, -33554432
  %114 = sub i32 %109, %113
  %115 = add nsw i32 %112, %59
  %116 = ashr i32 %115, 31
  %117 = and i32 %116, %115
  %118 = ashr i32 %117, 26
  %119 = and i32 %117, -67108864
  %120 = sub i32 %115, %119
  %121 = add nsw i32 %118, %65
  %122 = ashr i32 %121, 31
  %123 = and i32 %122, %121
  %124 = ashr i32 %123, 25
  %125 = and i32 %123, -33554432
  %126 = sub i32 %121, %125
  %127 = add nsw i32 %124, %71
  %128 = ashr i32 %127, 31
  %129 = and i32 %128, %127
  %130 = ashr i32 %129, 26
  %131 = and i32 %129, -67108864
  %132 = sub i32 %127, %131
  %133 = add nsw i32 %130, %77
  %134 = ashr i32 %133, 31
  %135 = and i32 %134, %133
  %136 = ashr i32 %135, 25
  %137 = and i32 %135, -33554432
  %138 = sub i32 %133, %137
  %139 = add nsw i32 %136, %83
  %140 = ashr i32 %139, 31
  %141 = and i32 %140, %139
  %142 = ashr i32 %141, 26
  %143 = and i32 %141, -67108864
  %144 = sub i32 %139, %143
  %145 = add nsw i32 %142, %89
  %146 = ashr i32 %145, 31
  %147 = and i32 %146, %145
  %148 = ashr i32 %147, 25
  %149 = and i32 %147, -33554432
  %150 = sub i32 %145, %149
  %151 = mul nsw i32 %148, 19
  %152 = add i32 %151, %96
  %153 = ashr i32 %152, 31
  %154 = and i32 %153, %152
  %155 = ashr i32 %154, 26
  %156 = and i32 %154, -67108864
  %157 = sub i32 %152, %156
  %158 = add nsw i32 %102, %155
  %159 = ashr i32 %157, 26
  %160 = and i32 %157, 67108863
  %161 = add nsw i32 %158, %159
  %162 = ashr i32 %161, 25
  %163 = and i32 %161, 33554431
  %164 = add nsw i32 %162, %108
  %165 = ashr i32 %164, 26
  %166 = and i32 %164, 67108863
  %167 = add nsw i32 %165, %114
  %168 = ashr i32 %167, 25
  %169 = and i32 %167, 33554431
  %170 = add nsw i32 %168, %120
  %171 = ashr i32 %170, 26
  %172 = and i32 %170, 67108863
  %173 = add nsw i32 %171, %126
  %174 = ashr i32 %173, 25
  %175 = and i32 %173, 33554431
  %176 = add nsw i32 %174, %132
  %177 = ashr i32 %176, 26
  %178 = and i32 %176, 67108863
  %179 = add nsw i32 %177, %138
  %180 = ashr i32 %179, 25
  %181 = and i32 %179, 33554431
  %182 = add nsw i32 %180, %144
  %183 = ashr i32 %182, 26
  %184 = and i32 %182, 67108863
  %185 = add nsw i32 %183, %150
  %186 = ashr i32 %185, 25
  %187 = and i32 %185, 33554431
  %188 = mul nsw i32 %186, 19
  %189 = add nsw i32 %188, %160
  %190 = ashr i32 %189, 26
  %191 = and i32 %189, 67108863
  %192 = add nsw i32 %190, %163
  %193 = ashr i32 %192, 25
  %194 = and i32 %192, 33554431
  %195 = add nsw i32 %193, %166
  %196 = ashr i32 %195, 26
  %197 = and i32 %195, 67108863
  %198 = add nsw i32 %196, %169
  %199 = ashr i32 %198, 25
  %200 = and i32 %198, 33554431
  %201 = add nsw i32 %199, %172
  %202 = ashr i32 %201, 26
  %203 = and i32 %201, 67108863
  %204 = add nsw i32 %202, %175
  %205 = ashr i32 %204, 25
  %206 = and i32 %204, 33554431
  %207 = add nsw i32 %205, %178
  %208 = ashr i32 %207, 26
  %209 = and i32 %207, 67108863
  %210 = add nsw i32 %208, %181
  %211 = ashr i32 %210, 25
  %212 = and i32 %210, 33554431
  %213 = add nsw i32 %211, %184
  %214 = ashr i32 %213, 26
  %215 = and i32 %213, 67108863
  %216 = add nsw i32 %214, %187
  %217 = ashr i32 %216, 25
  %218 = and i32 %216, 33554431
  %219 = mul nsw i32 %217, 19
  %220 = add nsw i32 %219, %191
  %221 = call fastcc i32 @s32_gte(i32 %220)
  %222 = call fastcc i32 @s32_eq(i32 %194, i32 33554431)
  %223 = and i32 %222, %221
  %224 = call fastcc i32 @s32_eq(i32 %197, i32 67108863)
  %225 = and i32 %223, %224
  %226 = call fastcc i32 @s32_eq(i32 %200, i32 33554431)
  %227 = and i32 %225, %226
  %228 = call fastcc i32 @s32_eq(i32 %203, i32 67108863)
  %229 = and i32 %227, %228
  %230 = call fastcc i32 @s32_eq(i32 %206, i32 33554431)
  %231 = and i32 %229, %230
  %232 = call fastcc i32 @s32_eq(i32 %209, i32 67108863)
  %233 = and i32 %231, %232
  %234 = call fastcc i32 @s32_eq(i32 %212, i32 33554431)
  %235 = and i32 %233, %234
  %236 = call fastcc i32 @s32_eq(i32 %215, i32 67108863)
  %237 = and i32 %235, %236
  %238 = call fastcc i32 @s32_eq(i32 %218, i32 33554431)
  %239 = and i32 %237, %238
  %240 = and i32 %239, 67108845
  %241 = sub nsw i32 %220, %240
  %242 = and i32 %239, 33554431
  %243 = sub nsw i32 %194, %242
  %244 = and i32 %239, 67108863
  %245 = sub nsw i32 %197, %244
  %246 = sub nsw i32 %200, %242
  %247 = sub i32 %201, %239
  %248 = sub nsw i32 %206, %242
  %249 = sub nsw i32 %209, %244
  %250 = sub nsw i32 %212, %242
  %251 = sub nsw i32 %215, %244
  %252 = sub nsw i32 %218, %242
  %253 = shl nsw i32 %243, 2
  %254 = shl nsw i32 %245, 3
  %255 = shl nsw i32 %246, 5
  %256 = shl i32 %247, 6
  %257 = shl nsw i32 %249, 1
  %258 = shl nsw i32 %250, 3
  %259 = shl nsw i32 %251, 4
  %260 = shl i32 %252, 6
  store i8 0, i8* %0, align 1
  %261 = getelementptr inbounds i8, i8* %0, i64 16
  store i8 0, i8* %261, align 1
  %262 = trunc i32 %241 to i8
  store i8 %262, i8* %0, align 1
  %263 = lshr i32 %241, 8
  %264 = trunc i32 %263 to i8
  %265 = getelementptr inbounds i8, i8* %0, i64 1
  store i8 %264, i8* %265, align 1
  %266 = lshr i32 %241, 16
  %267 = trunc i32 %266 to i8
  %268 = getelementptr inbounds i8, i8* %0, i64 2
  store i8 %267, i8* %268, align 1
  %269 = lshr i32 %241, 24
  %270 = getelementptr inbounds i8, i8* %0, i64 3
  %271 = or i32 %269, %253
  %272 = trunc i32 %271 to i8
  store i8 %272, i8* %270, align 1
  %273 = lshr i32 %243, 6
  %274 = trunc i32 %273 to i8
  %275 = getelementptr inbounds i8, i8* %0, i64 4
  store i8 %274, i8* %275, align 1
  %276 = lshr i32 %243, 14
  %277 = trunc i32 %276 to i8
  %278 = getelementptr inbounds i8, i8* %0, i64 5
  store i8 %277, i8* %278, align 1
  %279 = ashr i32 %243, 22
  %280 = getelementptr inbounds i8, i8* %0, i64 6
  %281 = or i32 %254, %279
  %282 = trunc i32 %281 to i8
  store i8 %282, i8* %280, align 1
  %283 = lshr i32 %245, 5
  %284 = trunc i32 %283 to i8
  %285 = getelementptr inbounds i8, i8* %0, i64 7
  store i8 %284, i8* %285, align 1
  %286 = lshr i32 %245, 13
  %287 = trunc i32 %286 to i8
  %288 = getelementptr inbounds i8, i8* %0, i64 8
  store i8 %287, i8* %288, align 1
  %289 = ashr i32 %245, 21
  %290 = getelementptr inbounds i8, i8* %0, i64 9
  %291 = or i32 %255, %289
  %292 = trunc i32 %291 to i8
  store i8 %292, i8* %290, align 1
  %293 = lshr i32 %246, 3
  %294 = trunc i32 %293 to i8
  %295 = getelementptr inbounds i8, i8* %0, i64 10
  store i8 %294, i8* %295, align 1
  %296 = lshr i32 %246, 11
  %297 = trunc i32 %296 to i8
  %298 = getelementptr inbounds i8, i8* %0, i64 11
  store i8 %297, i8* %298, align 1
  %299 = lshr i32 %246, 19
  %300 = getelementptr inbounds i8, i8* %0, i64 12
  %301 = or i32 %256, %299
  %302 = trunc i32 %301 to i8
  store i8 %302, i8* %300, align 1
  %303 = lshr i32 %247, 2
  %304 = trunc i32 %303 to i8
  %305 = getelementptr inbounds i8, i8* %0, i64 13
  store i8 %304, i8* %305, align 1
  %306 = lshr i32 %247, 10
  %307 = trunc i32 %306 to i8
  %308 = getelementptr inbounds i8, i8* %0, i64 14
  store i8 %307, i8* %308, align 1
  %309 = lshr i32 %247, 18
  %310 = trunc i32 %309 to i8
  %311 = getelementptr inbounds i8, i8* %0, i64 15
  store i8 %310, i8* %311, align 1
  %312 = trunc i32 %248 to i8
  store i8 %312, i8* %261, align 1
  %313 = lshr i32 %248, 8
  %314 = trunc i32 %313 to i8
  %315 = getelementptr inbounds i8, i8* %0, i64 17
  store i8 %314, i8* %315, align 1
  %316 = lshr i32 %248, 16
  %317 = trunc i32 %316 to i8
  %318 = getelementptr inbounds i8, i8* %0, i64 18
  store i8 %317, i8* %318, align 1
  %319 = ashr i32 %248, 24
  %320 = getelementptr inbounds i8, i8* %0, i64 19
  %321 = or i32 %257, %319
  %322 = trunc i32 %321 to i8
  store i8 %322, i8* %320, align 1
  %323 = lshr i32 %249, 7
  %324 = trunc i32 %323 to i8
  %325 = getelementptr inbounds i8, i8* %0, i64 20
  store i8 %324, i8* %325, align 1
  %326 = lshr i32 %249, 15
  %327 = trunc i32 %326 to i8
  %328 = getelementptr inbounds i8, i8* %0, i64 21
  store i8 %327, i8* %328, align 1
  %329 = ashr i32 %249, 23
  %330 = getelementptr inbounds i8, i8* %0, i64 22
  %331 = or i32 %258, %329
  %332 = trunc i32 %331 to i8
  store i8 %332, i8* %330, align 1
  %333 = lshr i32 %250, 5
  %334 = trunc i32 %333 to i8
  %335 = getelementptr inbounds i8, i8* %0, i64 23
  store i8 %334, i8* %335, align 1
  %336 = lshr i32 %250, 13
  %337 = trunc i32 %336 to i8
  %338 = getelementptr inbounds i8, i8* %0, i64 24
  store i8 %337, i8* %338, align 1
  %339 = ashr i32 %250, 21
  %340 = getelementptr inbounds i8, i8* %0, i64 25
  %341 = or i32 %259, %339
  %342 = trunc i32 %341 to i8
  store i8 %342, i8* %340, align 1
  %343 = lshr i32 %251, 4
  %344 = trunc i32 %343 to i8
  %345 = getelementptr inbounds i8, i8* %0, i64 26
  store i8 %344, i8* %345, align 1
  %346 = lshr i32 %251, 12
  %347 = trunc i32 %346 to i8
  %348 = getelementptr inbounds i8, i8* %0, i64 27
  store i8 %347, i8* %348, align 1
  %349 = lshr i32 %251, 20
  %350 = getelementptr inbounds i8, i8* %0, i64 28
  %351 = or i32 %260, %349
  %352 = trunc i32 %351 to i8
  store i8 %352, i8* %350, align 1
  %353 = lshr i32 %252, 2
  %354 = trunc i32 %353 to i8
  %355 = getelementptr inbounds i8, i8* %0, i64 29
  store i8 %354, i8* %355, align 1
  %356 = lshr i32 %252, 10
  %357 = trunc i32 %356 to i8
  %358 = getelementptr inbounds i8, i8* %0, i64 30
  store i8 %357, i8* %358, align 1
  %359 = lshr i32 %252, 18
  %360 = trunc i32 %359 to i8
  %361 = getelementptr inbounds i8, i8* %0, i64 31
  store i8 %360, i8* %361, align 1
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone sspstrong uwtable
define internal fastcc i32 @s32_gte(i32 %0) unnamed_addr #3 {
  %2 = add nsw i32 %0, -67108845
  %3 = ashr i32 %2, 31
  %4 = xor i32 %3, -1
  ret i32 %4
}

; Function Attrs: noinline norecurse nounwind readnone sspstrong uwtable
define internal fastcc i32 @s32_eq(i32 %0, i32 %1) unnamed_addr #3 {
  %3 = xor i32 %0, -1
  %4 = xor i32 %3, %1
  %5 = shl i32 %4, 16
  %6 = and i32 %5, %4
  %7 = shl i32 %6, 8
  %8 = and i32 %7, %6
  %9 = shl i32 %8, 4
  %10 = and i32 %9, %8
  %11 = shl i32 %10, 2
  %12 = and i32 %11, %10
  %13 = shl i32 %12, 1
  %14 = and i32 %13, %12
  %15 = ashr i32 %14, 31
  ret i32 %15
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define internal fastcc void @fproduct(i64* nocapture %0, i64* nocapture readonly %1, i64* nocapture readonly %2) unnamed_addr #4 {
  %4 = load i64, i64* %1, align 8
  %sext = shl i64 %4, 32
  %5 = ashr exact i64 %sext, 32
  %6 = load i64, i64* %2, align 8
  %sext1 = shl i64 %6, 32
  %7 = ashr exact i64 %sext1, 32
  %8 = mul nsw i64 %7, %5
  store i64 %8, i64* %0, align 8
  %9 = load i64, i64* %1, align 8
  %sext2 = shl i64 %9, 32
  %10 = ashr exact i64 %sext2, 32
  %11 = getelementptr inbounds i64, i64* %2, i64 1
  %12 = load i64, i64* %11, align 8
  %sext3 = shl i64 %12, 32
  %13 = ashr exact i64 %sext3, 32
  %14 = mul nsw i64 %13, %10
  %15 = getelementptr inbounds i64, i64* %1, i64 1
  %16 = load i64, i64* %15, align 8
  %sext4 = shl i64 %16, 32
  %17 = ashr exact i64 %sext4, 32
  %18 = load i64, i64* %2, align 8
  %sext5 = shl i64 %18, 32
  %19 = ashr exact i64 %sext5, 32
  %20 = mul nsw i64 %19, %17
  %21 = add nsw i64 %20, %14
  %22 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %21, i64* %22, align 8
  %23 = load i64, i64* %15, align 8
  %sext6 = shl i64 %23, 32
  %24 = ashr exact i64 %sext6, 31
  %25 = load i64, i64* %11, align 8
  %sext7 = shl i64 %25, 32
  %26 = ashr exact i64 %sext7, 32
  %27 = mul nsw i64 %26, %24
  %28 = load i64, i64* %1, align 8
  %sext8 = shl i64 %28, 32
  %29 = ashr exact i64 %sext8, 32
  %30 = getelementptr inbounds i64, i64* %2, i64 2
  %31 = load i64, i64* %30, align 8
  %sext9 = shl i64 %31, 32
  %32 = ashr exact i64 %sext9, 32
  %33 = mul nsw i64 %32, %29
  %34 = add nsw i64 %33, %27
  %35 = getelementptr inbounds i64, i64* %1, i64 2
  %36 = load i64, i64* %35, align 8
  %sext10 = shl i64 %36, 32
  %37 = ashr exact i64 %sext10, 32
  %38 = load i64, i64* %2, align 8
  %sext11 = shl i64 %38, 32
  %39 = ashr exact i64 %sext11, 32
  %40 = mul nsw i64 %39, %37
  %41 = add nsw i64 %34, %40
  %42 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %41, i64* %42, align 8
  %43 = load i64, i64* %15, align 8
  %sext12 = shl i64 %43, 32
  %44 = ashr exact i64 %sext12, 32
  %45 = load i64, i64* %30, align 8
  %sext13 = shl i64 %45, 32
  %46 = ashr exact i64 %sext13, 32
  %47 = mul nsw i64 %46, %44
  %48 = load i64, i64* %35, align 8
  %sext14 = shl i64 %48, 32
  %49 = ashr exact i64 %sext14, 32
  %50 = load i64, i64* %11, align 8
  %sext15 = shl i64 %50, 32
  %51 = ashr exact i64 %sext15, 32
  %52 = mul nsw i64 %51, %49
  %53 = add nsw i64 %52, %47
  %54 = load i64, i64* %1, align 8
  %sext16 = shl i64 %54, 32
  %55 = ashr exact i64 %sext16, 32
  %56 = getelementptr inbounds i64, i64* %2, i64 3
  %57 = load i64, i64* %56, align 8
  %sext17 = shl i64 %57, 32
  %58 = ashr exact i64 %sext17, 32
  %59 = mul nsw i64 %58, %55
  %60 = add nsw i64 %53, %59
  %61 = getelementptr inbounds i64, i64* %1, i64 3
  %62 = load i64, i64* %61, align 8
  %sext18 = shl i64 %62, 32
  %63 = ashr exact i64 %sext18, 32
  %64 = load i64, i64* %2, align 8
  %sext19 = shl i64 %64, 32
  %65 = ashr exact i64 %sext19, 32
  %66 = mul nsw i64 %65, %63
  %67 = add nsw i64 %60, %66
  %68 = getelementptr inbounds i64, i64* %0, i64 3
  store i64 %67, i64* %68, align 8
  %69 = load i64, i64* %35, align 8
  %sext20 = shl i64 %69, 32
  %70 = ashr exact i64 %sext20, 32
  %71 = load i64, i64* %30, align 8
  %sext21 = shl i64 %71, 32
  %72 = ashr exact i64 %sext21, 32
  %73 = mul nsw i64 %72, %70
  %74 = load i64, i64* %15, align 8
  %sext22 = shl i64 %74, 32
  %75 = ashr exact i64 %sext22, 32
  %76 = load i64, i64* %56, align 8
  %sext23 = shl i64 %76, 32
  %77 = ashr exact i64 %sext23, 32
  %78 = mul nsw i64 %77, %75
  %79 = load i64, i64* %61, align 8
  %sext24 = shl i64 %79, 32
  %80 = ashr exact i64 %sext24, 32
  %81 = load i64, i64* %11, align 8
  %sext25 = shl i64 %81, 32
  %82 = ashr exact i64 %sext25, 32
  %83 = mul nsw i64 %82, %80
  %84 = add nsw i64 %83, %78
  %85 = shl i64 %84, 1
  %86 = add nsw i64 %85, %73
  %87 = load i64, i64* %1, align 8
  %sext26 = shl i64 %87, 32
  %88 = ashr exact i64 %sext26, 32
  %89 = getelementptr inbounds i64, i64* %2, i64 4
  %90 = load i64, i64* %89, align 8
  %sext27 = shl i64 %90, 32
  %91 = ashr exact i64 %sext27, 32
  %92 = mul nsw i64 %91, %88
  %93 = add nsw i64 %86, %92
  %94 = getelementptr inbounds i64, i64* %1, i64 4
  %95 = load i64, i64* %94, align 8
  %sext28 = shl i64 %95, 32
  %96 = ashr exact i64 %sext28, 32
  %97 = load i64, i64* %2, align 8
  %sext29 = shl i64 %97, 32
  %98 = ashr exact i64 %sext29, 32
  %99 = mul nsw i64 %98, %96
  %100 = add nsw i64 %93, %99
  %101 = getelementptr inbounds i64, i64* %0, i64 4
  store i64 %100, i64* %101, align 8
  %102 = load i64, i64* %35, align 8
  %sext30 = shl i64 %102, 32
  %103 = ashr exact i64 %sext30, 32
  %104 = load i64, i64* %56, align 8
  %sext31 = shl i64 %104, 32
  %105 = ashr exact i64 %sext31, 32
  %106 = mul nsw i64 %105, %103
  %107 = load i64, i64* %61, align 8
  %sext32 = shl i64 %107, 32
  %108 = ashr exact i64 %sext32, 32
  %109 = load i64, i64* %30, align 8
  %sext33 = shl i64 %109, 32
  %110 = ashr exact i64 %sext33, 32
  %111 = mul nsw i64 %110, %108
  %112 = add nsw i64 %111, %106
  %113 = load i64, i64* %15, align 8
  %sext34 = shl i64 %113, 32
  %114 = ashr exact i64 %sext34, 32
  %115 = load i64, i64* %89, align 8
  %sext35 = shl i64 %115, 32
  %116 = ashr exact i64 %sext35, 32
  %117 = mul nsw i64 %116, %114
  %118 = add nsw i64 %112, %117
  %119 = load i64, i64* %94, align 8
  %sext36 = shl i64 %119, 32
  %120 = ashr exact i64 %sext36, 32
  %121 = load i64, i64* %11, align 8
  %sext37 = shl i64 %121, 32
  %122 = ashr exact i64 %sext37, 32
  %123 = mul nsw i64 %122, %120
  %124 = add nsw i64 %118, %123
  %125 = load i64, i64* %1, align 8
  %sext38 = shl i64 %125, 32
  %126 = ashr exact i64 %sext38, 32
  %127 = getelementptr inbounds i64, i64* %2, i64 5
  %128 = load i64, i64* %127, align 8
  %sext39 = shl i64 %128, 32
  %129 = ashr exact i64 %sext39, 32
  %130 = mul nsw i64 %129, %126
  %131 = add nsw i64 %124, %130
  %132 = getelementptr inbounds i64, i64* %1, i64 5
  %133 = load i64, i64* %132, align 8
  %sext40 = shl i64 %133, 32
  %134 = ashr exact i64 %sext40, 32
  %135 = load i64, i64* %2, align 8
  %sext41 = shl i64 %135, 32
  %136 = ashr exact i64 %sext41, 32
  %137 = mul nsw i64 %136, %134
  %138 = add nsw i64 %131, %137
  %139 = getelementptr inbounds i64, i64* %0, i64 5
  store i64 %138, i64* %139, align 8
  %140 = load i64, i64* %61, align 8
  %sext42 = shl i64 %140, 32
  %141 = ashr exact i64 %sext42, 32
  %142 = load i64, i64* %56, align 8
  %sext43 = shl i64 %142, 32
  %143 = ashr exact i64 %sext43, 32
  %144 = mul nsw i64 %143, %141
  %145 = load i64, i64* %15, align 8
  %sext44 = shl i64 %145, 32
  %146 = ashr exact i64 %sext44, 32
  %147 = load i64, i64* %127, align 8
  %sext45 = shl i64 %147, 32
  %148 = ashr exact i64 %sext45, 32
  %149 = mul nsw i64 %148, %146
  %150 = add nsw i64 %149, %144
  %151 = load i64, i64* %132, align 8
  %sext46 = shl i64 %151, 32
  %152 = ashr exact i64 %sext46, 32
  %153 = load i64, i64* %11, align 8
  %sext47 = shl i64 %153, 32
  %154 = ashr exact i64 %sext47, 32
  %155 = mul nsw i64 %154, %152
  %156 = add nsw i64 %150, %155
  %157 = shl i64 %156, 1
  %158 = load i64, i64* %35, align 8
  %sext48 = shl i64 %158, 32
  %159 = ashr exact i64 %sext48, 32
  %160 = load i64, i64* %89, align 8
  %sext49 = shl i64 %160, 32
  %161 = ashr exact i64 %sext49, 32
  %162 = mul nsw i64 %161, %159
  %163 = add nsw i64 %157, %162
  %164 = load i64, i64* %94, align 8
  %sext50 = shl i64 %164, 32
  %165 = ashr exact i64 %sext50, 32
  %166 = load i64, i64* %30, align 8
  %sext51 = shl i64 %166, 32
  %167 = ashr exact i64 %sext51, 32
  %168 = mul nsw i64 %167, %165
  %169 = add nsw i64 %163, %168
  %170 = load i64, i64* %1, align 8
  %sext52 = shl i64 %170, 32
  %171 = ashr exact i64 %sext52, 32
  %172 = getelementptr inbounds i64, i64* %2, i64 6
  %173 = load i64, i64* %172, align 8
  %sext53 = shl i64 %173, 32
  %174 = ashr exact i64 %sext53, 32
  %175 = mul nsw i64 %174, %171
  %176 = add nsw i64 %169, %175
  %177 = getelementptr inbounds i64, i64* %1, i64 6
  %178 = load i64, i64* %177, align 8
  %sext54 = shl i64 %178, 32
  %179 = ashr exact i64 %sext54, 32
  %180 = load i64, i64* %2, align 8
  %sext55 = shl i64 %180, 32
  %181 = ashr exact i64 %sext55, 32
  %182 = mul nsw i64 %181, %179
  %183 = add nsw i64 %176, %182
  %184 = getelementptr inbounds i64, i64* %0, i64 6
  store i64 %183, i64* %184, align 8
  %185 = load i64, i64* %61, align 8
  %sext56 = shl i64 %185, 32
  %186 = ashr exact i64 %sext56, 32
  %187 = load i64, i64* %89, align 8
  %sext57 = shl i64 %187, 32
  %188 = ashr exact i64 %sext57, 32
  %189 = mul nsw i64 %188, %186
  %190 = load i64, i64* %94, align 8
  %sext58 = shl i64 %190, 32
  %191 = ashr exact i64 %sext58, 32
  %192 = load i64, i64* %56, align 8
  %sext59 = shl i64 %192, 32
  %193 = ashr exact i64 %sext59, 32
  %194 = mul nsw i64 %193, %191
  %195 = add nsw i64 %194, %189
  %196 = load i64, i64* %35, align 8
  %sext60 = shl i64 %196, 32
  %197 = ashr exact i64 %sext60, 32
  %198 = load i64, i64* %127, align 8
  %sext61 = shl i64 %198, 32
  %199 = ashr exact i64 %sext61, 32
  %200 = mul nsw i64 %199, %197
  %201 = add nsw i64 %195, %200
  %202 = load i64, i64* %132, align 8
  %sext62 = shl i64 %202, 32
  %203 = ashr exact i64 %sext62, 32
  %204 = load i64, i64* %30, align 8
  %sext63 = shl i64 %204, 32
  %205 = ashr exact i64 %sext63, 32
  %206 = mul nsw i64 %205, %203
  %207 = add nsw i64 %201, %206
  %208 = load i64, i64* %15, align 8
  %sext64 = shl i64 %208, 32
  %209 = ashr exact i64 %sext64, 32
  %210 = load i64, i64* %172, align 8
  %sext65 = shl i64 %210, 32
  %211 = ashr exact i64 %sext65, 32
  %212 = mul nsw i64 %211, %209
  %213 = add nsw i64 %207, %212
  %214 = load i64, i64* %177, align 8
  %sext66 = shl i64 %214, 32
  %215 = ashr exact i64 %sext66, 32
  %216 = load i64, i64* %11, align 8
  %sext67 = shl i64 %216, 32
  %217 = ashr exact i64 %sext67, 32
  %218 = mul nsw i64 %217, %215
  %219 = add nsw i64 %213, %218
  %220 = load i64, i64* %1, align 8
  %sext68 = shl i64 %220, 32
  %221 = ashr exact i64 %sext68, 32
  %222 = getelementptr inbounds i64, i64* %2, i64 7
  %223 = load i64, i64* %222, align 8
  %sext69 = shl i64 %223, 32
  %224 = ashr exact i64 %sext69, 32
  %225 = mul nsw i64 %224, %221
  %226 = add nsw i64 %219, %225
  %227 = getelementptr inbounds i64, i64* %1, i64 7
  %228 = load i64, i64* %227, align 8
  %sext70 = shl i64 %228, 32
  %229 = ashr exact i64 %sext70, 32
  %230 = load i64, i64* %2, align 8
  %sext71 = shl i64 %230, 32
  %231 = ashr exact i64 %sext71, 32
  %232 = mul nsw i64 %231, %229
  %233 = add nsw i64 %226, %232
  %234 = getelementptr inbounds i64, i64* %0, i64 7
  store i64 %233, i64* %234, align 8
  %235 = load i64, i64* %94, align 8
  %sext72 = shl i64 %235, 32
  %236 = ashr exact i64 %sext72, 32
  %237 = load i64, i64* %89, align 8
  %sext73 = shl i64 %237, 32
  %238 = ashr exact i64 %sext73, 32
  %239 = mul nsw i64 %238, %236
  %240 = load i64, i64* %61, align 8
  %sext74 = shl i64 %240, 32
  %241 = ashr exact i64 %sext74, 32
  %242 = load i64, i64* %127, align 8
  %sext75 = shl i64 %242, 32
  %243 = ashr exact i64 %sext75, 32
  %244 = mul nsw i64 %243, %241
  %245 = load i64, i64* %132, align 8
  %sext76 = shl i64 %245, 32
  %246 = ashr exact i64 %sext76, 32
  %247 = load i64, i64* %56, align 8
  %sext77 = shl i64 %247, 32
  %248 = ashr exact i64 %sext77, 32
  %249 = mul nsw i64 %248, %246
  %250 = add nsw i64 %249, %244
  %251 = load i64, i64* %15, align 8
  %sext78 = shl i64 %251, 32
  %252 = ashr exact i64 %sext78, 32
  %253 = load i64, i64* %222, align 8
  %sext79 = shl i64 %253, 32
  %254 = ashr exact i64 %sext79, 32
  %255 = mul nsw i64 %254, %252
  %256 = add nsw i64 %250, %255
  %257 = load i64, i64* %227, align 8
  %sext80 = shl i64 %257, 32
  %258 = ashr exact i64 %sext80, 32
  %259 = load i64, i64* %11, align 8
  %sext81 = shl i64 %259, 32
  %260 = ashr exact i64 %sext81, 32
  %261 = mul nsw i64 %260, %258
  %262 = add nsw i64 %256, %261
  %263 = shl i64 %262, 1
  %264 = add nsw i64 %263, %239
  %265 = load i64, i64* %35, align 8
  %sext82 = shl i64 %265, 32
  %266 = ashr exact i64 %sext82, 32
  %267 = load i64, i64* %172, align 8
  %sext83 = shl i64 %267, 32
  %268 = ashr exact i64 %sext83, 32
  %269 = mul nsw i64 %268, %266
  %270 = add nsw i64 %264, %269
  %271 = load i64, i64* %177, align 8
  %sext84 = shl i64 %271, 32
  %272 = ashr exact i64 %sext84, 32
  %273 = load i64, i64* %30, align 8
  %sext85 = shl i64 %273, 32
  %274 = ashr exact i64 %sext85, 32
  %275 = mul nsw i64 %274, %272
  %276 = add nsw i64 %270, %275
  %277 = load i64, i64* %1, align 8
  %sext86 = shl i64 %277, 32
  %278 = ashr exact i64 %sext86, 32
  %279 = getelementptr inbounds i64, i64* %2, i64 8
  %280 = load i64, i64* %279, align 8
  %sext87 = shl i64 %280, 32
  %281 = ashr exact i64 %sext87, 32
  %282 = mul nsw i64 %281, %278
  %283 = add nsw i64 %276, %282
  %284 = getelementptr inbounds i64, i64* %1, i64 8
  %285 = load i64, i64* %284, align 8
  %sext88 = shl i64 %285, 32
  %286 = ashr exact i64 %sext88, 32
  %287 = load i64, i64* %2, align 8
  %sext89 = shl i64 %287, 32
  %288 = ashr exact i64 %sext89, 32
  %289 = mul nsw i64 %288, %286
  %290 = add nsw i64 %283, %289
  %291 = getelementptr inbounds i64, i64* %0, i64 8
  store i64 %290, i64* %291, align 8
  %292 = load i64, i64* %94, align 8
  %sext90 = shl i64 %292, 32
  %293 = ashr exact i64 %sext90, 32
  %294 = load i64, i64* %127, align 8
  %sext91 = shl i64 %294, 32
  %295 = ashr exact i64 %sext91, 32
  %296 = mul nsw i64 %295, %293
  %297 = load i64, i64* %132, align 8
  %sext92 = shl i64 %297, 32
  %298 = ashr exact i64 %sext92, 32
  %299 = load i64, i64* %89, align 8
  %sext93 = shl i64 %299, 32
  %300 = ashr exact i64 %sext93, 32
  %301 = mul nsw i64 %300, %298
  %302 = add nsw i64 %301, %296
  %303 = load i64, i64* %61, align 8
  %sext94 = shl i64 %303, 32
  %304 = ashr exact i64 %sext94, 32
  %305 = load i64, i64* %172, align 8
  %sext95 = shl i64 %305, 32
  %306 = ashr exact i64 %sext95, 32
  %307 = mul nsw i64 %306, %304
  %308 = add nsw i64 %302, %307
  %309 = load i64, i64* %177, align 8
  %sext96 = shl i64 %309, 32
  %310 = ashr exact i64 %sext96, 32
  %311 = load i64, i64* %56, align 8
  %sext97 = shl i64 %311, 32
  %312 = ashr exact i64 %sext97, 32
  %313 = mul nsw i64 %312, %310
  %314 = add nsw i64 %308, %313
  %315 = load i64, i64* %35, align 8
  %sext98 = shl i64 %315, 32
  %316 = ashr exact i64 %sext98, 32
  %317 = load i64, i64* %222, align 8
  %sext99 = shl i64 %317, 32
  %318 = ashr exact i64 %sext99, 32
  %319 = mul nsw i64 %318, %316
  %320 = add nsw i64 %314, %319
  %321 = load i64, i64* %227, align 8
  %sext100 = shl i64 %321, 32
  %322 = ashr exact i64 %sext100, 32
  %323 = load i64, i64* %30, align 8
  %sext101 = shl i64 %323, 32
  %324 = ashr exact i64 %sext101, 32
  %325 = mul nsw i64 %324, %322
  %326 = add nsw i64 %320, %325
  %327 = load i64, i64* %15, align 8
  %sext102 = shl i64 %327, 32
  %328 = ashr exact i64 %sext102, 32
  %329 = load i64, i64* %279, align 8
  %sext103 = shl i64 %329, 32
  %330 = ashr exact i64 %sext103, 32
  %331 = mul nsw i64 %330, %328
  %332 = add nsw i64 %326, %331
  %333 = load i64, i64* %284, align 8
  %sext104 = shl i64 %333, 32
  %334 = ashr exact i64 %sext104, 32
  %335 = load i64, i64* %11, align 8
  %sext105 = shl i64 %335, 32
  %336 = ashr exact i64 %sext105, 32
  %337 = mul nsw i64 %336, %334
  %338 = add nsw i64 %332, %337
  %339 = load i64, i64* %1, align 8
  %sext106 = shl i64 %339, 32
  %340 = ashr exact i64 %sext106, 32
  %341 = getelementptr inbounds i64, i64* %2, i64 9
  %342 = load i64, i64* %341, align 8
  %sext107 = shl i64 %342, 32
  %343 = ashr exact i64 %sext107, 32
  %344 = mul nsw i64 %343, %340
  %345 = add nsw i64 %338, %344
  %346 = getelementptr inbounds i64, i64* %1, i64 9
  %347 = load i64, i64* %346, align 8
  %sext108 = shl i64 %347, 32
  %348 = ashr exact i64 %sext108, 32
  %349 = load i64, i64* %2, align 8
  %sext109 = shl i64 %349, 32
  %350 = ashr exact i64 %sext109, 32
  %351 = mul nsw i64 %350, %348
  %352 = add nsw i64 %345, %351
  %353 = getelementptr inbounds i64, i64* %0, i64 9
  store i64 %352, i64* %353, align 8
  %354 = load i64, i64* %132, align 8
  %sext110 = shl i64 %354, 32
  %355 = ashr exact i64 %sext110, 32
  %356 = load i64, i64* %127, align 8
  %sext111 = shl i64 %356, 32
  %357 = ashr exact i64 %sext111, 32
  %358 = mul nsw i64 %357, %355
  %359 = load i64, i64* %61, align 8
  %sext112 = shl i64 %359, 32
  %360 = ashr exact i64 %sext112, 32
  %361 = load i64, i64* %222, align 8
  %sext113 = shl i64 %361, 32
  %362 = ashr exact i64 %sext113, 32
  %363 = mul nsw i64 %362, %360
  %364 = add nsw i64 %363, %358
  %365 = load i64, i64* %227, align 8
  %sext114 = shl i64 %365, 32
  %366 = ashr exact i64 %sext114, 32
  %367 = load i64, i64* %56, align 8
  %sext115 = shl i64 %367, 32
  %368 = ashr exact i64 %sext115, 32
  %369 = mul nsw i64 %368, %366
  %370 = add nsw i64 %364, %369
  %371 = load i64, i64* %15, align 8
  %sext116 = shl i64 %371, 32
  %372 = ashr exact i64 %sext116, 32
  %373 = load i64, i64* %341, align 8
  %sext117 = shl i64 %373, 32
  %374 = ashr exact i64 %sext117, 32
  %375 = mul nsw i64 %374, %372
  %376 = add nsw i64 %370, %375
  %377 = load i64, i64* %346, align 8
  %sext118 = shl i64 %377, 32
  %378 = ashr exact i64 %sext118, 32
  %379 = load i64, i64* %11, align 8
  %sext119 = shl i64 %379, 32
  %380 = ashr exact i64 %sext119, 32
  %381 = mul nsw i64 %380, %378
  %382 = add nsw i64 %376, %381
  %383 = shl i64 %382, 1
  %384 = load i64, i64* %94, align 8
  %sext120 = shl i64 %384, 32
  %385 = ashr exact i64 %sext120, 32
  %386 = load i64, i64* %172, align 8
  %sext121 = shl i64 %386, 32
  %387 = ashr exact i64 %sext121, 32
  %388 = mul nsw i64 %387, %385
  %389 = add nsw i64 %383, %388
  %390 = load i64, i64* %177, align 8
  %sext122 = shl i64 %390, 32
  %391 = ashr exact i64 %sext122, 32
  %392 = load i64, i64* %89, align 8
  %sext123 = shl i64 %392, 32
  %393 = ashr exact i64 %sext123, 32
  %394 = mul nsw i64 %393, %391
  %395 = add nsw i64 %389, %394
  %396 = load i64, i64* %35, align 8
  %sext124 = shl i64 %396, 32
  %397 = ashr exact i64 %sext124, 32
  %398 = load i64, i64* %279, align 8
  %sext125 = shl i64 %398, 32
  %399 = ashr exact i64 %sext125, 32
  %400 = mul nsw i64 %399, %397
  %401 = add nsw i64 %395, %400
  %402 = load i64, i64* %284, align 8
  %sext126 = shl i64 %402, 32
  %403 = ashr exact i64 %sext126, 32
  %404 = load i64, i64* %30, align 8
  %sext127 = shl i64 %404, 32
  %405 = ashr exact i64 %sext127, 32
  %406 = mul nsw i64 %405, %403
  %407 = add nsw i64 %401, %406
  %408 = getelementptr inbounds i64, i64* %0, i64 10
  store i64 %407, i64* %408, align 8
  %409 = load i64, i64* %132, align 8
  %sext128 = shl i64 %409, 32
  %410 = ashr exact i64 %sext128, 32
  %411 = load i64, i64* %172, align 8
  %sext129 = shl i64 %411, 32
  %412 = ashr exact i64 %sext129, 32
  %413 = mul nsw i64 %412, %410
  %414 = load i64, i64* %177, align 8
  %sext130 = shl i64 %414, 32
  %415 = ashr exact i64 %sext130, 32
  %416 = load i64, i64* %127, align 8
  %sext131 = shl i64 %416, 32
  %417 = ashr exact i64 %sext131, 32
  %418 = mul nsw i64 %417, %415
  %419 = add nsw i64 %418, %413
  %420 = load i64, i64* %94, align 8
  %sext132 = shl i64 %420, 32
  %421 = ashr exact i64 %sext132, 32
  %422 = load i64, i64* %222, align 8
  %sext133 = shl i64 %422, 32
  %423 = ashr exact i64 %sext133, 32
  %424 = mul nsw i64 %423, %421
  %425 = add nsw i64 %419, %424
  %426 = load i64, i64* %227, align 8
  %sext134 = shl i64 %426, 32
  %427 = ashr exact i64 %sext134, 32
  %428 = load i64, i64* %89, align 8
  %sext135 = shl i64 %428, 32
  %429 = ashr exact i64 %sext135, 32
  %430 = mul nsw i64 %429, %427
  %431 = add nsw i64 %425, %430
  %432 = load i64, i64* %61, align 8
  %sext136 = shl i64 %432, 32
  %433 = ashr exact i64 %sext136, 32
  %434 = load i64, i64* %279, align 8
  %sext137 = shl i64 %434, 32
  %435 = ashr exact i64 %sext137, 32
  %436 = mul nsw i64 %435, %433
  %437 = add nsw i64 %431, %436
  %438 = load i64, i64* %284, align 8
  %sext138 = shl i64 %438, 32
  %439 = ashr exact i64 %sext138, 32
  %440 = load i64, i64* %56, align 8
  %sext139 = shl i64 %440, 32
  %441 = ashr exact i64 %sext139, 32
  %442 = mul nsw i64 %441, %439
  %443 = add nsw i64 %437, %442
  %444 = load i64, i64* %35, align 8
  %sext140 = shl i64 %444, 32
  %445 = ashr exact i64 %sext140, 32
  %446 = load i64, i64* %341, align 8
  %sext141 = shl i64 %446, 32
  %447 = ashr exact i64 %sext141, 32
  %448 = mul nsw i64 %447, %445
  %449 = add nsw i64 %443, %448
  %450 = load i64, i64* %346, align 8
  %sext142 = shl i64 %450, 32
  %451 = ashr exact i64 %sext142, 32
  %452 = load i64, i64* %30, align 8
  %sext143 = shl i64 %452, 32
  %453 = ashr exact i64 %sext143, 32
  %454 = mul nsw i64 %453, %451
  %455 = add nsw i64 %449, %454
  %456 = getelementptr inbounds i64, i64* %0, i64 11
  store i64 %455, i64* %456, align 8
  %457 = load i64, i64* %177, align 8
  %sext144 = shl i64 %457, 32
  %458 = ashr exact i64 %sext144, 32
  %459 = load i64, i64* %172, align 8
  %sext145 = shl i64 %459, 32
  %460 = ashr exact i64 %sext145, 32
  %461 = mul nsw i64 %460, %458
  %462 = load i64, i64* %132, align 8
  %sext146 = shl i64 %462, 32
  %463 = ashr exact i64 %sext146, 32
  %464 = load i64, i64* %222, align 8
  %sext147 = shl i64 %464, 32
  %465 = ashr exact i64 %sext147, 32
  %466 = mul nsw i64 %465, %463
  %467 = load i64, i64* %227, align 8
  %sext148 = shl i64 %467, 32
  %468 = ashr exact i64 %sext148, 32
  %469 = load i64, i64* %127, align 8
  %sext149 = shl i64 %469, 32
  %470 = ashr exact i64 %sext149, 32
  %471 = mul nsw i64 %470, %468
  %472 = add nsw i64 %471, %466
  %473 = load i64, i64* %61, align 8
  %sext150 = shl i64 %473, 32
  %474 = ashr exact i64 %sext150, 32
  %475 = load i64, i64* %341, align 8
  %sext151 = shl i64 %475, 32
  %476 = ashr exact i64 %sext151, 32
  %477 = mul nsw i64 %476, %474
  %478 = add nsw i64 %472, %477
  %479 = load i64, i64* %346, align 8
  %sext152 = shl i64 %479, 32
  %480 = ashr exact i64 %sext152, 32
  %481 = load i64, i64* %56, align 8
  %sext153 = shl i64 %481, 32
  %482 = ashr exact i64 %sext153, 32
  %483 = mul nsw i64 %482, %480
  %484 = add nsw i64 %478, %483
  %485 = shl i64 %484, 1
  %486 = add nsw i64 %485, %461
  %487 = load i64, i64* %94, align 8
  %sext154 = shl i64 %487, 32
  %488 = ashr exact i64 %sext154, 32
  %489 = load i64, i64* %279, align 8
  %sext155 = shl i64 %489, 32
  %490 = ashr exact i64 %sext155, 32
  %491 = mul nsw i64 %490, %488
  %492 = add nsw i64 %486, %491
  %493 = load i64, i64* %284, align 8
  %sext156 = shl i64 %493, 32
  %494 = ashr exact i64 %sext156, 32
  %495 = load i64, i64* %89, align 8
  %sext157 = shl i64 %495, 32
  %496 = ashr exact i64 %sext157, 32
  %497 = mul nsw i64 %496, %494
  %498 = add nsw i64 %492, %497
  %499 = getelementptr inbounds i64, i64* %0, i64 12
  store i64 %498, i64* %499, align 8
  %500 = load i64, i64* %177, align 8
  %sext158 = shl i64 %500, 32
  %501 = ashr exact i64 %sext158, 32
  %502 = load i64, i64* %222, align 8
  %sext159 = shl i64 %502, 32
  %503 = ashr exact i64 %sext159, 32
  %504 = mul nsw i64 %503, %501
  %505 = load i64, i64* %227, align 8
  %sext160 = shl i64 %505, 32
  %506 = ashr exact i64 %sext160, 32
  %507 = load i64, i64* %172, align 8
  %sext161 = shl i64 %507, 32
  %508 = ashr exact i64 %sext161, 32
  %509 = mul nsw i64 %508, %506
  %510 = add nsw i64 %509, %504
  %511 = load i64, i64* %132, align 8
  %sext162 = shl i64 %511, 32
  %512 = ashr exact i64 %sext162, 32
  %513 = load i64, i64* %279, align 8
  %sext163 = shl i64 %513, 32
  %514 = ashr exact i64 %sext163, 32
  %515 = mul nsw i64 %514, %512
  %516 = add nsw i64 %510, %515
  %517 = load i64, i64* %284, align 8
  %sext164 = shl i64 %517, 32
  %518 = ashr exact i64 %sext164, 32
  %519 = load i64, i64* %127, align 8
  %sext165 = shl i64 %519, 32
  %520 = ashr exact i64 %sext165, 32
  %521 = mul nsw i64 %520, %518
  %522 = add nsw i64 %516, %521
  %523 = load i64, i64* %94, align 8
  %sext166 = shl i64 %523, 32
  %524 = ashr exact i64 %sext166, 32
  %525 = load i64, i64* %341, align 8
  %sext167 = shl i64 %525, 32
  %526 = ashr exact i64 %sext167, 32
  %527 = mul nsw i64 %526, %524
  %528 = add nsw i64 %522, %527
  %529 = load i64, i64* %346, align 8
  %sext168 = shl i64 %529, 32
  %530 = ashr exact i64 %sext168, 32
  %531 = load i64, i64* %89, align 8
  %sext169 = shl i64 %531, 32
  %532 = ashr exact i64 %sext169, 32
  %533 = mul nsw i64 %532, %530
  %534 = add nsw i64 %528, %533
  %535 = getelementptr inbounds i64, i64* %0, i64 13
  store i64 %534, i64* %535, align 8
  %536 = load i64, i64* %227, align 8
  %sext170 = shl i64 %536, 32
  %537 = ashr exact i64 %sext170, 32
  %538 = load i64, i64* %222, align 8
  %sext171 = shl i64 %538, 32
  %539 = ashr exact i64 %sext171, 32
  %540 = mul nsw i64 %539, %537
  %541 = load i64, i64* %132, align 8
  %sext172 = shl i64 %541, 32
  %542 = ashr exact i64 %sext172, 32
  %543 = load i64, i64* %341, align 8
  %sext173 = shl i64 %543, 32
  %544 = ashr exact i64 %sext173, 32
  %545 = mul nsw i64 %544, %542
  %546 = add nsw i64 %545, %540
  %547 = load i64, i64* %346, align 8
  %sext174 = shl i64 %547, 32
  %548 = ashr exact i64 %sext174, 32
  %549 = load i64, i64* %127, align 8
  %sext175 = shl i64 %549, 32
  %550 = ashr exact i64 %sext175, 32
  %551 = mul nsw i64 %550, %548
  %552 = add nsw i64 %546, %551
  %553 = shl i64 %552, 1
  %554 = load i64, i64* %177, align 8
  %sext176 = shl i64 %554, 32
  %555 = ashr exact i64 %sext176, 32
  %556 = load i64, i64* %279, align 8
  %sext177 = shl i64 %556, 32
  %557 = ashr exact i64 %sext177, 32
  %558 = mul nsw i64 %557, %555
  %559 = add nsw i64 %553, %558
  %560 = load i64, i64* %284, align 8
  %sext178 = shl i64 %560, 32
  %561 = ashr exact i64 %sext178, 32
  %562 = load i64, i64* %172, align 8
  %sext179 = shl i64 %562, 32
  %563 = ashr exact i64 %sext179, 32
  %564 = mul nsw i64 %563, %561
  %565 = add nsw i64 %559, %564
  %566 = getelementptr inbounds i64, i64* %0, i64 14
  store i64 %565, i64* %566, align 8
  %567 = load i64, i64* %227, align 8
  %sext180 = shl i64 %567, 32
  %568 = ashr exact i64 %sext180, 32
  %569 = load i64, i64* %279, align 8
  %sext181 = shl i64 %569, 32
  %570 = ashr exact i64 %sext181, 32
  %571 = mul nsw i64 %570, %568
  %572 = load i64, i64* %284, align 8
  %sext182 = shl i64 %572, 32
  %573 = ashr exact i64 %sext182, 32
  %574 = load i64, i64* %222, align 8
  %sext183 = shl i64 %574, 32
  %575 = ashr exact i64 %sext183, 32
  %576 = mul nsw i64 %575, %573
  %577 = add nsw i64 %576, %571
  %578 = load i64, i64* %177, align 8
  %sext184 = shl i64 %578, 32
  %579 = ashr exact i64 %sext184, 32
  %580 = load i64, i64* %341, align 8
  %sext185 = shl i64 %580, 32
  %581 = ashr exact i64 %sext185, 32
  %582 = mul nsw i64 %581, %579
  %583 = add nsw i64 %577, %582
  %584 = load i64, i64* %346, align 8
  %sext186 = shl i64 %584, 32
  %585 = ashr exact i64 %sext186, 32
  %586 = load i64, i64* %172, align 8
  %sext187 = shl i64 %586, 32
  %587 = ashr exact i64 %sext187, 32
  %588 = mul nsw i64 %587, %585
  %589 = add nsw i64 %583, %588
  %590 = getelementptr inbounds i64, i64* %0, i64 15
  store i64 %589, i64* %590, align 8
  %591 = load i64, i64* %284, align 8
  %sext188 = shl i64 %591, 32
  %592 = ashr exact i64 %sext188, 32
  %593 = load i64, i64* %279, align 8
  %sext189 = shl i64 %593, 32
  %594 = ashr exact i64 %sext189, 32
  %595 = mul nsw i64 %594, %592
  %596 = load i64, i64* %227, align 8
  %sext190 = shl i64 %596, 32
  %597 = ashr exact i64 %sext190, 32
  %598 = load i64, i64* %341, align 8
  %sext191 = shl i64 %598, 32
  %599 = ashr exact i64 %sext191, 32
  %600 = mul nsw i64 %599, %597
  %601 = load i64, i64* %346, align 8
  %sext192 = shl i64 %601, 32
  %602 = ashr exact i64 %sext192, 32
  %603 = load i64, i64* %222, align 8
  %sext193 = shl i64 %603, 32
  %604 = ashr exact i64 %sext193, 32
  %605 = mul nsw i64 %604, %602
  %606 = add nsw i64 %605, %600
  %607 = shl i64 %606, 1
  %608 = add nsw i64 %607, %595
  %609 = getelementptr inbounds i64, i64* %0, i64 16
  store i64 %608, i64* %609, align 8
  %610 = load i64, i64* %284, align 8
  %sext194 = shl i64 %610, 32
  %611 = ashr exact i64 %sext194, 32
  %612 = load i64, i64* %341, align 8
  %sext195 = shl i64 %612, 32
  %613 = ashr exact i64 %sext195, 32
  %614 = mul nsw i64 %613, %611
  %615 = load i64, i64* %346, align 8
  %sext196 = shl i64 %615, 32
  %616 = ashr exact i64 %sext196, 32
  %617 = load i64, i64* %279, align 8
  %sext197 = shl i64 %617, 32
  %618 = ashr exact i64 %sext197, 32
  %619 = mul nsw i64 %618, %616
  %620 = add nsw i64 %619, %614
  %621 = getelementptr inbounds i64, i64* %0, i64 17
  store i64 %620, i64* %621, align 8
  %622 = load i64, i64* %346, align 8
  %sext198 = shl i64 %622, 32
  %623 = ashr exact i64 %sext198, 31
  %624 = load i64, i64* %341, align 8
  %sext199 = shl i64 %624, 32
  %625 = ashr exact i64 %sext199, 32
  %626 = mul nsw i64 %625, %623
  %627 = getelementptr inbounds i64, i64* %0, i64 18
  store i64 %626, i64* %627, align 8
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define internal fastcc void @freduce_degree(i64* nocapture %0) unnamed_addr #4 {
  %2 = getelementptr inbounds i64, i64* %0, i64 18
  %3 = load i64, i64* %2, align 8
  %4 = getelementptr inbounds i64, i64* %0, i64 8
  %5 = load i64, i64* %4, align 8
  %reass.mul = mul i64 %3, 18
  %6 = add i64 %5, %3
  %7 = add i64 %6, %reass.mul
  store i64 %7, i64* %4, align 8
  %8 = getelementptr inbounds i64, i64* %0, i64 17
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds i64, i64* %0, i64 7
  %11 = load i64, i64* %10, align 8
  %reass.mul2 = mul i64 %9, 18
  %12 = add i64 %11, %9
  %13 = add i64 %12, %reass.mul2
  store i64 %13, i64* %10, align 8
  %14 = getelementptr inbounds i64, i64* %0, i64 16
  %15 = load i64, i64* %14, align 8
  %16 = getelementptr inbounds i64, i64* %0, i64 6
  %17 = load i64, i64* %16, align 8
  %reass.mul4 = mul i64 %15, 18
  %18 = add i64 %17, %15
  %19 = add i64 %18, %reass.mul4
  store i64 %19, i64* %16, align 8
  %20 = getelementptr inbounds i64, i64* %0, i64 15
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds i64, i64* %0, i64 5
  %23 = load i64, i64* %22, align 8
  %reass.mul6 = mul i64 %21, 18
  %24 = add i64 %23, %21
  %25 = add i64 %24, %reass.mul6
  store i64 %25, i64* %22, align 8
  %26 = getelementptr inbounds i64, i64* %0, i64 14
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds i64, i64* %0, i64 4
  %29 = load i64, i64* %28, align 8
  %reass.mul8 = mul i64 %27, 18
  %30 = add i64 %29, %27
  %31 = add i64 %30, %reass.mul8
  store i64 %31, i64* %28, align 8
  %32 = getelementptr inbounds i64, i64* %0, i64 13
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds i64, i64* %0, i64 3
  %35 = load i64, i64* %34, align 8
  %reass.mul10 = mul i64 %33, 18
  %36 = add i64 %35, %33
  %37 = add i64 %36, %reass.mul10
  store i64 %37, i64* %34, align 8
  %38 = getelementptr inbounds i64, i64* %0, i64 12
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds i64, i64* %0, i64 2
  %41 = load i64, i64* %40, align 8
  %reass.mul12 = mul i64 %39, 18
  %42 = add i64 %41, %39
  %43 = add i64 %42, %reass.mul12
  store i64 %43, i64* %40, align 8
  %44 = getelementptr inbounds i64, i64* %0, i64 11
  %45 = load i64, i64* %44, align 8
  %46 = getelementptr inbounds i64, i64* %0, i64 1
  %47 = load i64, i64* %46, align 8
  %reass.mul14 = mul i64 %45, 18
  %48 = add i64 %47, %45
  %49 = add i64 %48, %reass.mul14
  store i64 %49, i64* %46, align 8
  %50 = getelementptr inbounds i64, i64* %0, i64 10
  %51 = load i64, i64* %50, align 8
  %52 = load i64, i64* %0, align 8
  %reass.mul16 = mul i64 %51, 18
  %53 = add i64 %52, %51
  %54 = add i64 %53, %reass.mul16
  store i64 %54, i64* %0, align 8
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define internal fastcc void @freduce_coefficients(i64* nocapture %0) unnamed_addr #4 {
  %2 = getelementptr inbounds i64, i64* %0, i64 10
  store i64 0, i64* %2, align 8
  %3 = load i64, i64* %0, align 8
  %4 = call fastcc i64 @div_by_2_26(i64 %3)
  %5 = shl i64 %4, 26
  %6 = sub nsw i64 %3, %5
  store i64 %6, i64* %0, align 8
  %7 = getelementptr inbounds i64, i64* %0, i64 1
  %8 = load i64, i64* %7, align 8
  %9 = add nsw i64 %8, %4
  %10 = call fastcc i64 @div_by_2_25(i64 %9)
  %11 = shl i64 %10, 25
  %12 = sub nsw i64 %9, %11
  store i64 %12, i64* %7, align 8
  %13 = getelementptr inbounds i64, i64* %0, i64 2
  %14 = load i64, i64* %13, align 8
  %15 = add nsw i64 %14, %10
  %16 = call fastcc i64 @div_by_2_26(i64 %15)
  %17 = shl i64 %16, 26
  %18 = sub nsw i64 %15, %17
  store i64 %18, i64* %13, align 8
  %19 = getelementptr inbounds i64, i64* %0, i64 3
  %20 = load i64, i64* %19, align 8
  %21 = add nsw i64 %20, %16
  %22 = call fastcc i64 @div_by_2_25(i64 %21)
  %23 = shl i64 %22, 25
  %24 = sub nsw i64 %21, %23
  store i64 %24, i64* %19, align 8
  %25 = getelementptr inbounds i64, i64* %0, i64 4
  %26 = load i64, i64* %25, align 8
  %27 = add nsw i64 %26, %22
  %28 = call fastcc i64 @div_by_2_26(i64 %27)
  %29 = shl i64 %28, 26
  %30 = sub nsw i64 %27, %29
  store i64 %30, i64* %25, align 8
  %31 = getelementptr inbounds i64, i64* %0, i64 5
  %32 = load i64, i64* %31, align 8
  %33 = add nsw i64 %32, %28
  %34 = call fastcc i64 @div_by_2_25(i64 %33)
  %35 = shl i64 %34, 25
  %36 = sub nsw i64 %33, %35
  store i64 %36, i64* %31, align 8
  %37 = getelementptr inbounds i64, i64* %0, i64 6
  %38 = load i64, i64* %37, align 8
  %39 = add nsw i64 %38, %34
  %40 = call fastcc i64 @div_by_2_26(i64 %39)
  %41 = shl i64 %40, 26
  %42 = sub nsw i64 %39, %41
  store i64 %42, i64* %37, align 8
  %43 = getelementptr inbounds i64, i64* %0, i64 7
  %44 = load i64, i64* %43, align 8
  %45 = add nsw i64 %44, %40
  %46 = call fastcc i64 @div_by_2_25(i64 %45)
  %47 = shl i64 %46, 25
  %48 = sub nsw i64 %45, %47
  store i64 %48, i64* %43, align 8
  %49 = getelementptr inbounds i64, i64* %0, i64 8
  %50 = load i64, i64* %49, align 8
  %51 = add nsw i64 %50, %46
  %52 = call fastcc i64 @div_by_2_26(i64 %51)
  %53 = shl i64 %52, 26
  %54 = sub nsw i64 %51, %53
  store i64 %54, i64* %49, align 8
  %55 = getelementptr inbounds i64, i64* %0, i64 9
  %56 = load i64, i64* %55, align 8
  %57 = add nsw i64 %56, %52
  %58 = call fastcc i64 @div_by_2_25(i64 %57)
  %59 = shl i64 %58, 25
  %60 = sub nsw i64 %57, %59
  store i64 %60, i64* %55, align 8
  store i64 %58, i64* %2, align 8
  %reass.mul = mul i64 %58, 18
  %61 = add i64 %58, %6
  %62 = add i64 %61, %reass.mul
  store i64 %62, i64* %0, align 8
  store i64 0, i64* %2, align 8
  %63 = call fastcc i64 @div_by_2_26(i64 %62)
  %64 = shl i64 %63, 26
  %65 = sub nsw i64 %62, %64
  store i64 %65, i64* %0, align 8
  %66 = add nsw i64 %63, %12
  store i64 %66, i64* %7, align 8
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone sspstrong uwtable
define internal fastcc i64 @div_by_2_26(i64 %0) unnamed_addr #3 {
  %2 = lshr i64 %0, 32
  %3 = trunc i64 %2 to i32
  %4 = ashr i32 %3, 31
  %5 = lshr i32 %4, 6
  %6 = zext i32 %5 to i64
  %7 = add nsw i64 %6, %0
  %8 = ashr i64 %7, 26
  ret i64 %8
}

; Function Attrs: noinline norecurse nounwind readnone sspstrong uwtable
define internal fastcc i64 @div_by_2_25(i64 %0) unnamed_addr #3 {
  %2 = lshr i64 %0, 32
  %3 = trunc i64 %2 to i32
  %4 = ashr i32 %3, 31
  %5 = lshr i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = add nsw i64 %6, %0
  %8 = ashr i64 %7, 25
  ret i64 %8
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal fastcc void @fsquare(i64* nocapture %0, i64* nocapture readonly %1) unnamed_addr #0 {
  %3 = alloca [19 x i64], align 16
  %4 = getelementptr inbounds [19 x i64], [19 x i64]* %3, i64 0, i64 0
  call fastcc void @fsquare_inner(i64* nonnull %4, i64* %1)
  call fastcc void @freduce_degree(i64* nonnull %4)
  call fastcc void @freduce_coefficients(i64* nonnull %4)
  %5 = bitcast i64* %0 to i8*
  %6 = bitcast [19 x i64]* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(80) %5, i8* nonnull align 16 dereferenceable(80) %6, i64 80, i1 false)
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define internal fastcc void @fsquare_inner(i64* nocapture %0, i64* nocapture readonly %1) unnamed_addr #4 {
  %3 = load i64, i64* %1, align 8
  %sext = shl i64 %3, 32
  %4 = ashr exact i64 %sext, 32
  %5 = mul nsw i64 %4, %4
  store i64 %5, i64* %0, align 8
  %6 = load i64, i64* %1, align 8
  %sext1 = shl i64 %6, 32
  %7 = ashr exact i64 %sext1, 31
  %8 = getelementptr inbounds i64, i64* %1, i64 1
  %9 = load i64, i64* %8, align 8
  %sext2 = shl i64 %9, 32
  %10 = ashr exact i64 %sext2, 32
  %11 = mul nsw i64 %10, %7
  %12 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %11, i64* %12, align 8
  %13 = load i64, i64* %8, align 8
  %sext3 = shl i64 %13, 32
  %14 = ashr exact i64 %sext3, 32
  %15 = mul nsw i64 %14, %14
  %16 = load i64, i64* %1, align 8
  %sext4 = shl i64 %16, 32
  %17 = ashr exact i64 %sext4, 32
  %18 = getelementptr inbounds i64, i64* %1, i64 2
  %19 = load i64, i64* %18, align 8
  %sext5 = shl i64 %19, 32
  %20 = ashr exact i64 %sext5, 32
  %21 = mul nsw i64 %20, %17
  %22 = add nsw i64 %21, %15
  %23 = shl nsw i64 %22, 1
  %24 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %23, i64* %24, align 8
  %25 = load i64, i64* %8, align 8
  %sext6 = shl i64 %25, 32
  %26 = ashr exact i64 %sext6, 32
  %27 = load i64, i64* %18, align 8
  %sext7 = shl i64 %27, 32
  %28 = ashr exact i64 %sext7, 32
  %29 = mul nsw i64 %28, %26
  %30 = load i64, i64* %1, align 8
  %sext8 = shl i64 %30, 32
  %31 = ashr exact i64 %sext8, 32
  %32 = getelementptr inbounds i64, i64* %1, i64 3
  %33 = load i64, i64* %32, align 8
  %sext9 = shl i64 %33, 32
  %34 = ashr exact i64 %sext9, 32
  %35 = mul nsw i64 %34, %31
  %36 = add nsw i64 %35, %29
  %37 = shl nsw i64 %36, 1
  %38 = getelementptr inbounds i64, i64* %0, i64 3
  store i64 %37, i64* %38, align 8
  %39 = load i64, i64* %18, align 8
  %sext10 = shl i64 %39, 32
  %40 = ashr exact i64 %sext10, 32
  %41 = mul nsw i64 %40, %40
  %42 = load i64, i64* %8, align 8
  %sext11 = shl i64 %42, 32
  %43 = ashr exact i64 %sext11, 30
  %44 = load i64, i64* %32, align 8
  %sext12 = shl i64 %44, 32
  %45 = ashr exact i64 %sext12, 32
  %46 = mul nsw i64 %45, %43
  %47 = add nsw i64 %46, %41
  %48 = load i64, i64* %1, align 8
  %sext13 = shl i64 %48, 32
  %49 = ashr exact i64 %sext13, 31
  %50 = getelementptr inbounds i64, i64* %1, i64 4
  %51 = load i64, i64* %50, align 8
  %sext14 = shl i64 %51, 32
  %52 = ashr exact i64 %sext14, 32
  %53 = mul nsw i64 %52, %49
  %54 = add nsw i64 %47, %53
  %55 = getelementptr inbounds i64, i64* %0, i64 4
  store i64 %54, i64* %55, align 8
  %56 = load i64, i64* %18, align 8
  %sext15 = shl i64 %56, 32
  %57 = ashr exact i64 %sext15, 32
  %58 = load i64, i64* %32, align 8
  %sext16 = shl i64 %58, 32
  %59 = ashr exact i64 %sext16, 32
  %60 = mul nsw i64 %59, %57
  %61 = load i64, i64* %8, align 8
  %sext17 = shl i64 %61, 32
  %62 = ashr exact i64 %sext17, 32
  %63 = load i64, i64* %50, align 8
  %sext18 = shl i64 %63, 32
  %64 = ashr exact i64 %sext18, 32
  %65 = mul nsw i64 %64, %62
  %66 = add nsw i64 %65, %60
  %67 = load i64, i64* %1, align 8
  %sext19 = shl i64 %67, 32
  %68 = ashr exact i64 %sext19, 32
  %69 = getelementptr inbounds i64, i64* %1, i64 5
  %70 = load i64, i64* %69, align 8
  %sext20 = shl i64 %70, 32
  %71 = ashr exact i64 %sext20, 32
  %72 = mul nsw i64 %71, %68
  %73 = add nsw i64 %66, %72
  %74 = shl nsw i64 %73, 1
  %75 = getelementptr inbounds i64, i64* %0, i64 5
  store i64 %74, i64* %75, align 8
  %76 = load i64, i64* %32, align 8
  %sext21 = shl i64 %76, 32
  %77 = ashr exact i64 %sext21, 32
  %78 = mul nsw i64 %77, %77
  %79 = load i64, i64* %18, align 8
  %sext22 = shl i64 %79, 32
  %80 = ashr exact i64 %sext22, 32
  %81 = load i64, i64* %50, align 8
  %sext23 = shl i64 %81, 32
  %82 = ashr exact i64 %sext23, 32
  %83 = mul nsw i64 %82, %80
  %84 = add nsw i64 %83, %78
  %85 = load i64, i64* %1, align 8
  %sext24 = shl i64 %85, 32
  %86 = ashr exact i64 %sext24, 32
  %87 = getelementptr inbounds i64, i64* %1, i64 6
  %88 = load i64, i64* %87, align 8
  %sext25 = shl i64 %88, 32
  %89 = ashr exact i64 %sext25, 32
  %90 = mul nsw i64 %89, %86
  %91 = add nsw i64 %84, %90
  %92 = load i64, i64* %8, align 8
  %sext26 = shl i64 %92, 32
  %93 = ashr exact i64 %sext26, 31
  %94 = load i64, i64* %69, align 8
  %sext27 = shl i64 %94, 32
  %95 = ashr exact i64 %sext27, 32
  %96 = mul nsw i64 %95, %93
  %97 = add nsw i64 %91, %96
  %98 = shl nsw i64 %97, 1
  %99 = getelementptr inbounds i64, i64* %0, i64 6
  store i64 %98, i64* %99, align 8
  %100 = load i64, i64* %32, align 8
  %sext28 = shl i64 %100, 32
  %101 = ashr exact i64 %sext28, 32
  %102 = load i64, i64* %50, align 8
  %sext29 = shl i64 %102, 32
  %103 = ashr exact i64 %sext29, 32
  %104 = mul nsw i64 %103, %101
  %105 = load i64, i64* %18, align 8
  %sext30 = shl i64 %105, 32
  %106 = ashr exact i64 %sext30, 32
  %107 = load i64, i64* %69, align 8
  %sext31 = shl i64 %107, 32
  %108 = ashr exact i64 %sext31, 32
  %109 = mul nsw i64 %108, %106
  %110 = add nsw i64 %109, %104
  %111 = load i64, i64* %8, align 8
  %sext32 = shl i64 %111, 32
  %112 = ashr exact i64 %sext32, 32
  %113 = load i64, i64* %87, align 8
  %sext33 = shl i64 %113, 32
  %114 = ashr exact i64 %sext33, 32
  %115 = mul nsw i64 %114, %112
  %116 = add nsw i64 %110, %115
  %117 = load i64, i64* %1, align 8
  %sext34 = shl i64 %117, 32
  %118 = ashr exact i64 %sext34, 32
  %119 = getelementptr inbounds i64, i64* %1, i64 7
  %120 = load i64, i64* %119, align 8
  %sext35 = shl i64 %120, 32
  %121 = ashr exact i64 %sext35, 32
  %122 = mul nsw i64 %121, %118
  %123 = add nsw i64 %116, %122
  %124 = shl nsw i64 %123, 1
  %125 = getelementptr inbounds i64, i64* %0, i64 7
  store i64 %124, i64* %125, align 8
  %126 = load i64, i64* %50, align 8
  %sext36 = shl i64 %126, 32
  %127 = ashr exact i64 %sext36, 32
  %128 = mul nsw i64 %127, %127
  %129 = load i64, i64* %18, align 8
  %sext37 = shl i64 %129, 32
  %130 = ashr exact i64 %sext37, 32
  %131 = load i64, i64* %87, align 8
  %sext38 = shl i64 %131, 32
  %132 = ashr exact i64 %sext38, 32
  %133 = mul nsw i64 %132, %130
  %134 = load i64, i64* %1, align 8
  %sext39 = shl i64 %134, 32
  %135 = ashr exact i64 %sext39, 32
  %136 = getelementptr inbounds i64, i64* %1, i64 8
  %137 = load i64, i64* %136, align 8
  %sext40 = shl i64 %137, 32
  %138 = ashr exact i64 %sext40, 32
  %139 = mul nsw i64 %138, %135
  %140 = add nsw i64 %139, %133
  %141 = load i64, i64* %8, align 8
  %sext41 = shl i64 %141, 32
  %142 = ashr exact i64 %sext41, 32
  %143 = load i64, i64* %119, align 8
  %sext42 = shl i64 %143, 32
  %144 = ashr exact i64 %sext42, 32
  %145 = mul nsw i64 %144, %142
  %146 = load i64, i64* %32, align 8
  %sext43 = shl i64 %146, 32
  %147 = ashr exact i64 %sext43, 32
  %148 = load i64, i64* %69, align 8
  %sext44 = shl i64 %148, 32
  %149 = ashr exact i64 %sext44, 32
  %150 = mul nsw i64 %149, %147
  %151 = add nsw i64 %150, %145
  %152 = shl i64 %151, 1
  %153 = add nsw i64 %140, %152
  %154 = shl i64 %153, 1
  %155 = add nsw i64 %154, %128
  %156 = getelementptr inbounds i64, i64* %0, i64 8
  store i64 %155, i64* %156, align 8
  %157 = load i64, i64* %50, align 8
  %sext45 = shl i64 %157, 32
  %158 = ashr exact i64 %sext45, 32
  %159 = load i64, i64* %69, align 8
  %sext46 = shl i64 %159, 32
  %160 = ashr exact i64 %sext46, 32
  %161 = mul nsw i64 %160, %158
  %162 = load i64, i64* %32, align 8
  %sext47 = shl i64 %162, 32
  %163 = ashr exact i64 %sext47, 32
  %164 = load i64, i64* %87, align 8
  %sext48 = shl i64 %164, 32
  %165 = ashr exact i64 %sext48, 32
  %166 = mul nsw i64 %165, %163
  %167 = add nsw i64 %166, %161
  %168 = load i64, i64* %18, align 8
  %sext49 = shl i64 %168, 32
  %169 = ashr exact i64 %sext49, 32
  %170 = load i64, i64* %119, align 8
  %sext50 = shl i64 %170, 32
  %171 = ashr exact i64 %sext50, 32
  %172 = mul nsw i64 %171, %169
  %173 = add nsw i64 %167, %172
  %174 = load i64, i64* %8, align 8
  %sext51 = shl i64 %174, 32
  %175 = ashr exact i64 %sext51, 32
  %176 = load i64, i64* %136, align 8
  %sext52 = shl i64 %176, 32
  %177 = ashr exact i64 %sext52, 32
  %178 = mul nsw i64 %177, %175
  %179 = add nsw i64 %173, %178
  %180 = load i64, i64* %1, align 8
  %sext53 = shl i64 %180, 32
  %181 = ashr exact i64 %sext53, 32
  %182 = getelementptr inbounds i64, i64* %1, i64 9
  %183 = load i64, i64* %182, align 8
  %sext54 = shl i64 %183, 32
  %184 = ashr exact i64 %sext54, 32
  %185 = mul nsw i64 %184, %181
  %186 = add nsw i64 %179, %185
  %187 = shl nsw i64 %186, 1
  %188 = getelementptr inbounds i64, i64* %0, i64 9
  store i64 %187, i64* %188, align 8
  %189 = load i64, i64* %69, align 8
  %sext55 = shl i64 %189, 32
  %190 = ashr exact i64 %sext55, 32
  %191 = mul nsw i64 %190, %190
  %192 = load i64, i64* %50, align 8
  %sext56 = shl i64 %192, 32
  %193 = ashr exact i64 %sext56, 32
  %194 = load i64, i64* %87, align 8
  %sext57 = shl i64 %194, 32
  %195 = ashr exact i64 %sext57, 32
  %196 = mul nsw i64 %195, %193
  %197 = add nsw i64 %196, %191
  %198 = load i64, i64* %18, align 8
  %sext58 = shl i64 %198, 32
  %199 = ashr exact i64 %sext58, 32
  %200 = load i64, i64* %136, align 8
  %sext59 = shl i64 %200, 32
  %201 = ashr exact i64 %sext59, 32
  %202 = mul nsw i64 %201, %199
  %203 = add nsw i64 %197, %202
  %204 = load i64, i64* %32, align 8
  %sext60 = shl i64 %204, 32
  %205 = ashr exact i64 %sext60, 32
  %206 = load i64, i64* %119, align 8
  %sext61 = shl i64 %206, 32
  %207 = ashr exact i64 %sext61, 32
  %208 = mul nsw i64 %207, %205
  %209 = load i64, i64* %8, align 8
  %sext62 = shl i64 %209, 32
  %210 = ashr exact i64 %sext62, 32
  %211 = load i64, i64* %182, align 8
  %sext63 = shl i64 %211, 32
  %212 = ashr exact i64 %sext63, 32
  %213 = mul nsw i64 %212, %210
  %214 = add nsw i64 %213, %208
  %215 = shl i64 %214, 1
  %216 = add nsw i64 %203, %215
  %217 = shl nsw i64 %216, 1
  %218 = getelementptr inbounds i64, i64* %0, i64 10
  store i64 %217, i64* %218, align 8
  %219 = load i64, i64* %69, align 8
  %sext64 = shl i64 %219, 32
  %220 = ashr exact i64 %sext64, 32
  %221 = load i64, i64* %87, align 8
  %sext65 = shl i64 %221, 32
  %222 = ashr exact i64 %sext65, 32
  %223 = mul nsw i64 %222, %220
  %224 = load i64, i64* %50, align 8
  %sext66 = shl i64 %224, 32
  %225 = ashr exact i64 %sext66, 32
  %226 = load i64, i64* %119, align 8
  %sext67 = shl i64 %226, 32
  %227 = ashr exact i64 %sext67, 32
  %228 = mul nsw i64 %227, %225
  %229 = add nsw i64 %228, %223
  %230 = load i64, i64* %32, align 8
  %sext68 = shl i64 %230, 32
  %231 = ashr exact i64 %sext68, 32
  %232 = load i64, i64* %136, align 8
  %sext69 = shl i64 %232, 32
  %233 = ashr exact i64 %sext69, 32
  %234 = mul nsw i64 %233, %231
  %235 = add nsw i64 %229, %234
  %236 = load i64, i64* %18, align 8
  %sext70 = shl i64 %236, 32
  %237 = ashr exact i64 %sext70, 32
  %238 = load i64, i64* %182, align 8
  %sext71 = shl i64 %238, 32
  %239 = ashr exact i64 %sext71, 32
  %240 = mul nsw i64 %239, %237
  %241 = add nsw i64 %235, %240
  %242 = shl nsw i64 %241, 1
  %243 = getelementptr inbounds i64, i64* %0, i64 11
  store i64 %242, i64* %243, align 8
  %244 = load i64, i64* %87, align 8
  %sext72 = shl i64 %244, 32
  %245 = ashr exact i64 %sext72, 32
  %246 = mul nsw i64 %245, %245
  %247 = load i64, i64* %50, align 8
  %sext73 = shl i64 %247, 32
  %248 = ashr exact i64 %sext73, 32
  %249 = load i64, i64* %136, align 8
  %sext74 = shl i64 %249, 32
  %250 = ashr exact i64 %sext74, 32
  %251 = mul nsw i64 %250, %248
  %252 = load i64, i64* %69, align 8
  %sext75 = shl i64 %252, 32
  %253 = ashr exact i64 %sext75, 32
  %254 = load i64, i64* %119, align 8
  %sext76 = shl i64 %254, 32
  %255 = ashr exact i64 %sext76, 32
  %256 = mul nsw i64 %255, %253
  %257 = load i64, i64* %32, align 8
  %sext77 = shl i64 %257, 32
  %258 = ashr exact i64 %sext77, 32
  %259 = load i64, i64* %182, align 8
  %sext78 = shl i64 %259, 32
  %260 = ashr exact i64 %sext78, 32
  %261 = mul nsw i64 %260, %258
  %262 = add nsw i64 %261, %256
  %263 = shl i64 %262, 1
  %264 = add nsw i64 %263, %251
  %265 = shl i64 %264, 1
  %266 = add nsw i64 %265, %246
  %267 = getelementptr inbounds i64, i64* %0, i64 12
  store i64 %266, i64* %267, align 8
  %268 = load i64, i64* %87, align 8
  %sext79 = shl i64 %268, 32
  %269 = ashr exact i64 %sext79, 32
  %270 = load i64, i64* %119, align 8
  %sext80 = shl i64 %270, 32
  %271 = ashr exact i64 %sext80, 32
  %272 = mul nsw i64 %271, %269
  %273 = load i64, i64* %69, align 8
  %sext81 = shl i64 %273, 32
  %274 = ashr exact i64 %sext81, 32
  %275 = load i64, i64* %136, align 8
  %sext82 = shl i64 %275, 32
  %276 = ashr exact i64 %sext82, 32
  %277 = mul nsw i64 %276, %274
  %278 = add nsw i64 %277, %272
  %279 = load i64, i64* %50, align 8
  %sext83 = shl i64 %279, 32
  %280 = ashr exact i64 %sext83, 32
  %281 = load i64, i64* %182, align 8
  %sext84 = shl i64 %281, 32
  %282 = ashr exact i64 %sext84, 32
  %283 = mul nsw i64 %282, %280
  %284 = add nsw i64 %278, %283
  %285 = shl nsw i64 %284, 1
  %286 = getelementptr inbounds i64, i64* %0, i64 13
  store i64 %285, i64* %286, align 8
  %287 = load i64, i64* %119, align 8
  %sext85 = shl i64 %287, 32
  %288 = ashr exact i64 %sext85, 32
  %289 = mul nsw i64 %288, %288
  %290 = load i64, i64* %87, align 8
  %sext86 = shl i64 %290, 32
  %291 = ashr exact i64 %sext86, 32
  %292 = load i64, i64* %136, align 8
  %sext87 = shl i64 %292, 32
  %293 = ashr exact i64 %sext87, 32
  %294 = mul nsw i64 %293, %291
  %295 = add nsw i64 %294, %289
  %296 = load i64, i64* %69, align 8
  %sext88 = shl i64 %296, 32
  %297 = ashr exact i64 %sext88, 31
  %298 = load i64, i64* %182, align 8
  %sext89 = shl i64 %298, 32
  %299 = ashr exact i64 %sext89, 32
  %300 = mul nsw i64 %299, %297
  %301 = add nsw i64 %295, %300
  %302 = shl nsw i64 %301, 1
  %303 = getelementptr inbounds i64, i64* %0, i64 14
  store i64 %302, i64* %303, align 8
  %304 = load i64, i64* %119, align 8
  %sext90 = shl i64 %304, 32
  %305 = ashr exact i64 %sext90, 32
  %306 = load i64, i64* %136, align 8
  %sext91 = shl i64 %306, 32
  %307 = ashr exact i64 %sext91, 32
  %308 = mul nsw i64 %307, %305
  %309 = load i64, i64* %87, align 8
  %sext92 = shl i64 %309, 32
  %310 = ashr exact i64 %sext92, 32
  %311 = load i64, i64* %182, align 8
  %sext93 = shl i64 %311, 32
  %312 = ashr exact i64 %sext93, 32
  %313 = mul nsw i64 %312, %310
  %314 = add nsw i64 %313, %308
  %315 = shl nsw i64 %314, 1
  %316 = getelementptr inbounds i64, i64* %0, i64 15
  store i64 %315, i64* %316, align 8
  %317 = load i64, i64* %136, align 8
  %sext94 = shl i64 %317, 32
  %318 = ashr exact i64 %sext94, 32
  %319 = mul nsw i64 %318, %318
  %320 = load i64, i64* %119, align 8
  %sext95 = shl i64 %320, 32
  %321 = ashr exact i64 %sext95, 30
  %322 = load i64, i64* %182, align 8
  %sext96 = shl i64 %322, 32
  %323 = ashr exact i64 %sext96, 32
  %324 = mul nsw i64 %323, %321
  %325 = add nsw i64 %324, %319
  %326 = getelementptr inbounds i64, i64* %0, i64 16
  store i64 %325, i64* %326, align 8
  %327 = load i64, i64* %136, align 8
  %sext97 = shl i64 %327, 32
  %328 = ashr exact i64 %sext97, 31
  %329 = load i64, i64* %182, align 8
  %sext98 = shl i64 %329, 32
  %330 = ashr exact i64 %sext98, 32
  %331 = mul nsw i64 %330, %328
  %332 = getelementptr inbounds i64, i64* %0, i64 17
  store i64 %331, i64* %332, align 8
  %333 = load i64, i64* %182, align 8
  %sext99 = shl i64 %333, 32
  %334 = ashr exact i64 %sext99, 32
  %335 = ashr exact i64 %sext99, 31
  %336 = mul nsw i64 %335, %334
  %337 = getelementptr inbounds i64, i64* %0, i64 18
  store i64 %336, i64* %337, align 8
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define internal fastcc void @swap_conditional(i64* nocapture %0, i64* nocapture %1, i64 %2) unnamed_addr #4 {
  %4 = icmp eq i64 %2, 1
  br i1 %4, label %.loopexit, label %53

.loopexit:                                        ; preds = %3
  %5 = load i64, i64* %0, align 8
  %6 = load i64, i64* %1, align 8
  store i64 %6, i64* %0, align 8
  %sext = shl i64 %5, 32
  %7 = ashr exact i64 %sext, 32
  store i64 %7, i64* %1, align 8
  %8 = getelementptr inbounds i64, i64* %0, i64 1
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds i64, i64* %1, i64 1
  %11 = load i64, i64* %10, align 8
  store i64 %11, i64* %8, align 8
  %sext1 = shl i64 %9, 32
  %12 = ashr exact i64 %sext1, 32
  store i64 %12, i64* %10, align 8
  %13 = getelementptr inbounds i64, i64* %0, i64 2
  %14 = load i64, i64* %13, align 8
  %15 = getelementptr inbounds i64, i64* %1, i64 2
  %16 = load i64, i64* %15, align 8
  store i64 %16, i64* %13, align 8
  %sext2 = shl i64 %14, 32
  %17 = ashr exact i64 %sext2, 32
  store i64 %17, i64* %15, align 8
  %18 = getelementptr inbounds i64, i64* %0, i64 3
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds i64, i64* %1, i64 3
  %21 = load i64, i64* %20, align 8
  store i64 %21, i64* %18, align 8
  %sext3 = shl i64 %19, 32
  %22 = ashr exact i64 %sext3, 32
  store i64 %22, i64* %20, align 8
  %23 = getelementptr inbounds i64, i64* %0, i64 4
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds i64, i64* %1, i64 4
  %26 = load i64, i64* %25, align 8
  store i64 %26, i64* %23, align 8
  %sext4 = shl i64 %24, 32
  %27 = ashr exact i64 %sext4, 32
  store i64 %27, i64* %25, align 8
  %28 = getelementptr inbounds i64, i64* %0, i64 5
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds i64, i64* %1, i64 5
  %31 = load i64, i64* %30, align 8
  store i64 %31, i64* %28, align 8
  %sext5 = shl i64 %29, 32
  %32 = ashr exact i64 %sext5, 32
  store i64 %32, i64* %30, align 8
  %33 = getelementptr inbounds i64, i64* %0, i64 6
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds i64, i64* %1, i64 6
  %36 = load i64, i64* %35, align 8
  store i64 %36, i64* %33, align 8
  %sext6 = shl i64 %34, 32
  %37 = ashr exact i64 %sext6, 32
  store i64 %37, i64* %35, align 8
  %38 = getelementptr inbounds i64, i64* %0, i64 7
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds i64, i64* %1, i64 7
  %41 = load i64, i64* %40, align 8
  store i64 %41, i64* %38, align 8
  %sext7 = shl i64 %39, 32
  %42 = ashr exact i64 %sext7, 32
  store i64 %42, i64* %40, align 8
  %43 = getelementptr inbounds i64, i64* %0, i64 8
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds i64, i64* %1, i64 8
  %46 = load i64, i64* %45, align 8
  store i64 %46, i64* %43, align 8
  %sext8 = shl i64 %44, 32
  %47 = ashr exact i64 %sext8, 32
  store i64 %47, i64* %45, align 8
  %48 = getelementptr inbounds i64, i64* %0, i64 9
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds i64, i64* %1, i64 9
  %51 = load i64, i64* %50, align 8
  store i64 %51, i64* %48, align 8
  %sext9 = shl i64 %49, 32
  %52 = ashr exact i64 %sext9, 32
  store i64 %52, i64* %50, align 8
  br label %53

53:                                               ; preds = %.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal fastcc void @fmonty(i64* nocapture %0, i64* nocapture %1, i64* nocapture %2, i64* nocapture %3, i64* nocapture %4, i64* nocapture %5, i64* nocapture %6, i64* nocapture %7, i64* nocapture readonly %8) unnamed_addr #0 {
  %10 = alloca [10 x i64], align 16
  %11 = alloca [10 x i64], align 16
  %12 = alloca [19 x i64], align 16
  %13 = alloca [19 x i64], align 16
  %14 = alloca [19 x i64], align 16
  %15 = alloca [19 x i64], align 16
  %16 = alloca [19 x i64], align 16
  %17 = alloca [19 x i64], align 16
  %18 = alloca [19 x i64], align 16
  %19 = getelementptr inbounds [10 x i64], [10 x i64]* %10, i64 0, i64 0
  %20 = bitcast [10 x i64]* %10 to i8*
  %21 = bitcast i64* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(80) %20, i8* nonnull align 8 dereferenceable(80) %21, i64 80, i1 false)
  call fastcc void @fsum(i64* %4, i64* %5)
  call fastcc void @fdifference(i64* %5, i64* nonnull %19)
  %22 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %23 = bitcast [10 x i64]* %11 to i8*
  %24 = bitcast i64* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(80) %23, i8* nonnull align 8 dereferenceable(80) %24, i64 80, i1 false)
  call fastcc void @fsum(i64* %6, i64* %7)
  call fastcc void @fdifference(i64* %7, i64* nonnull %22)
  %25 = getelementptr inbounds [19 x i64], [19 x i64]* %15, i64 0, i64 0
  call fastcc void @fproduct(i64* nonnull %25, i64* %6, i64* %5)
  %26 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call fastcc void @fproduct(i64* nonnull %26, i64* %4, i64* %7)
  call fastcc void @freduce_degree(i64* nonnull %25)
  call fastcc void @freduce_coefficients(i64* nonnull %25)
  call fastcc void @freduce_degree(i64* nonnull %26)
  call fastcc void @freduce_coefficients(i64* nonnull %26)
  %27 = bitcast [19 x i64]* %15 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(80) %23, i8* nonnull align 16 dereferenceable(80) %27, i64 80, i1 false)
  call fastcc void @fsum(i64* nonnull %25, i64* nonnull %26)
  call fastcc void @fdifference(i64* nonnull %26, i64* nonnull %22)
  %28 = getelementptr inbounds [19 x i64], [19 x i64]* %18, i64 0, i64 0
  call fastcc void @fsquare(i64* nonnull %28, i64* nonnull %25)
  %29 = getelementptr inbounds [19 x i64], [19 x i64]* %17, i64 0, i64 0
  call fastcc void @fsquare(i64* nonnull %29, i64* nonnull %26)
  call fastcc void @fproduct(i64* nonnull %26, i64* nonnull %29, i64* %8)
  call fastcc void @freduce_degree(i64* nonnull %26)
  call fastcc void @freduce_coefficients(i64* nonnull %26)
  %30 = bitcast i64* %2 to i8*
  %31 = bitcast [19 x i64]* %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(80) %30, i8* nonnull align 16 dereferenceable(80) %31, i64 80, i1 false)
  %32 = bitcast i64* %3 to i8*
  %33 = bitcast [19 x i64]* %16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(80) %32, i8* nonnull align 16 dereferenceable(80) %33, i64 80, i1 false)
  %34 = getelementptr inbounds [19 x i64], [19 x i64]* %13, i64 0, i64 0
  call fastcc void @fsquare(i64* nonnull %34, i64* %4)
  %35 = getelementptr inbounds [19 x i64], [19 x i64]* %14, i64 0, i64 0
  call fastcc void @fsquare(i64* nonnull %35, i64* %5)
  call fastcc void @fproduct(i64* %0, i64* nonnull %34, i64* nonnull %35)
  call fastcc void @freduce_degree(i64* %0)
  call fastcc void @freduce_coefficients(i64* %0)
  call fastcc void @fdifference(i64* nonnull %35, i64* nonnull %34)
  %36 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  %37 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 10
  %38 = bitcast i64* %37 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(72) %38, i8 0, i64 72, i1 false)
  call fastcc void @fscalar_product(i64* nonnull %36, i64* nonnull %35)
  call fastcc void @freduce_coefficients(i64* nonnull %36)
  call fastcc void @fsum(i64* nonnull %36, i64* nonnull %34)
  call fastcc void @fproduct(i64* %1, i64* nonnull %35, i64* nonnull %36)
  call fastcc void @freduce_degree(i64* %1)
  call fastcc void @freduce_coefficients(i64* %1)
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define internal fastcc void @fsum(i64* nocapture %0, i64* nocapture readonly %1) unnamed_addr #4 {
  %3 = load i64, i64* %0, align 8
  %4 = load i64, i64* %1, align 8
  %5 = add nsw i64 %4, %3
  store i64 %5, i64* %0, align 8
  %6 = getelementptr inbounds i64, i64* %0, i64 1
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds i64, i64* %1, i64 1
  %9 = load i64, i64* %8, align 8
  %10 = add nsw i64 %9, %7
  store i64 %10, i64* %6, align 8
  %11 = getelementptr inbounds i64, i64* %0, i64 2
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds i64, i64* %1, i64 2
  %14 = load i64, i64* %13, align 8
  %15 = add nsw i64 %14, %12
  store i64 %15, i64* %11, align 8
  %16 = getelementptr inbounds i64, i64* %0, i64 3
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds i64, i64* %1, i64 3
  %19 = load i64, i64* %18, align 8
  %20 = add nsw i64 %19, %17
  store i64 %20, i64* %16, align 8
  %21 = getelementptr inbounds i64, i64* %0, i64 4
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds i64, i64* %1, i64 4
  %24 = load i64, i64* %23, align 8
  %25 = add nsw i64 %24, %22
  store i64 %25, i64* %21, align 8
  %26 = getelementptr inbounds i64, i64* %0, i64 5
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds i64, i64* %1, i64 5
  %29 = load i64, i64* %28, align 8
  %30 = add nsw i64 %29, %27
  store i64 %30, i64* %26, align 8
  %31 = getelementptr inbounds i64, i64* %0, i64 6
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds i64, i64* %1, i64 6
  %34 = load i64, i64* %33, align 8
  %35 = add nsw i64 %34, %32
  store i64 %35, i64* %31, align 8
  %36 = getelementptr inbounds i64, i64* %0, i64 7
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds i64, i64* %1, i64 7
  %39 = load i64, i64* %38, align 8
  %40 = add nsw i64 %39, %37
  store i64 %40, i64* %36, align 8
  %41 = getelementptr inbounds i64, i64* %0, i64 8
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds i64, i64* %1, i64 8
  %44 = load i64, i64* %43, align 8
  %45 = add nsw i64 %44, %42
  store i64 %45, i64* %41, align 8
  %46 = getelementptr inbounds i64, i64* %0, i64 9
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds i64, i64* %1, i64 9
  %49 = load i64, i64* %48, align 8
  %50 = add nsw i64 %49, %47
  store i64 %50, i64* %46, align 8
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define internal fastcc void @fdifference(i64* nocapture %0, i64* nocapture readonly %1) unnamed_addr #4 {
  %3 = load i64, i64* %1, align 8
  %4 = load i64, i64* %0, align 8
  %5 = sub nsw i64 %3, %4
  store i64 %5, i64* %0, align 8
  %6 = getelementptr inbounds i64, i64* %1, i64 1
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds i64, i64* %0, i64 1
  %9 = load i64, i64* %8, align 8
  %10 = sub nsw i64 %7, %9
  store i64 %10, i64* %8, align 8
  %11 = getelementptr inbounds i64, i64* %1, i64 2
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds i64, i64* %0, i64 2
  %14 = load i64, i64* %13, align 8
  %15 = sub nsw i64 %12, %14
  store i64 %15, i64* %13, align 8
  %16 = getelementptr inbounds i64, i64* %1, i64 3
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds i64, i64* %0, i64 3
  %19 = load i64, i64* %18, align 8
  %20 = sub nsw i64 %17, %19
  store i64 %20, i64* %18, align 8
  %21 = getelementptr inbounds i64, i64* %1, i64 4
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds i64, i64* %0, i64 4
  %24 = load i64, i64* %23, align 8
  %25 = sub nsw i64 %22, %24
  store i64 %25, i64* %23, align 8
  %26 = getelementptr inbounds i64, i64* %1, i64 5
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds i64, i64* %0, i64 5
  %29 = load i64, i64* %28, align 8
  %30 = sub nsw i64 %27, %29
  store i64 %30, i64* %28, align 8
  %31 = getelementptr inbounds i64, i64* %1, i64 6
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds i64, i64* %0, i64 6
  %34 = load i64, i64* %33, align 8
  %35 = sub nsw i64 %32, %34
  store i64 %35, i64* %33, align 8
  %36 = getelementptr inbounds i64, i64* %1, i64 7
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds i64, i64* %0, i64 7
  %39 = load i64, i64* %38, align 8
  %40 = sub nsw i64 %37, %39
  store i64 %40, i64* %38, align 8
  %41 = getelementptr inbounds i64, i64* %1, i64 8
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds i64, i64* %0, i64 8
  %44 = load i64, i64* %43, align 8
  %45 = sub nsw i64 %42, %44
  store i64 %45, i64* %43, align 8
  %46 = getelementptr inbounds i64, i64* %1, i64 9
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds i64, i64* %0, i64 9
  %49 = load i64, i64* %48, align 8
  %50 = sub nsw i64 %47, %49
  store i64 %50, i64* %48, align 8
  ret void
}

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define internal fastcc void @fscalar_product(i64* nocapture %0, i64* nocapture readonly %1) unnamed_addr #4 {
  %3 = load i64, i64* %1, align 8
  %4 = mul nsw i64 %3, 121665
  store i64 %4, i64* %0, align 8
  %5 = getelementptr inbounds i64, i64* %1, i64 1
  %6 = load i64, i64* %5, align 8
  %7 = mul nsw i64 %6, 121665
  %8 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %7, i64* %8, align 8
  %9 = getelementptr inbounds i64, i64* %1, i64 2
  %10 = load i64, i64* %9, align 8
  %11 = mul nsw i64 %10, 121665
  %12 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %11, i64* %12, align 8
  %13 = getelementptr inbounds i64, i64* %1, i64 3
  %14 = load i64, i64* %13, align 8
  %15 = mul nsw i64 %14, 121665
  %16 = getelementptr inbounds i64, i64* %0, i64 3
  store i64 %15, i64* %16, align 8
  %17 = getelementptr inbounds i64, i64* %1, i64 4
  %18 = load i64, i64* %17, align 8
  %19 = mul nsw i64 %18, 121665
  %20 = getelementptr inbounds i64, i64* %0, i64 4
  store i64 %19, i64* %20, align 8
  %21 = getelementptr inbounds i64, i64* %1, i64 5
  %22 = load i64, i64* %21, align 8
  %23 = mul nsw i64 %22, 121665
  %24 = getelementptr inbounds i64, i64* %0, i64 5
  store i64 %23, i64* %24, align 8
  %25 = getelementptr inbounds i64, i64* %1, i64 6
  %26 = load i64, i64* %25, align 8
  %27 = mul nsw i64 %26, 121665
  %28 = getelementptr inbounds i64, i64* %0, i64 6
  store i64 %27, i64* %28, align 8
  %29 = getelementptr inbounds i64, i64* %1, i64 7
  %30 = load i64, i64* %29, align 8
  %31 = mul nsw i64 %30, 121665
  %32 = getelementptr inbounds i64, i64* %0, i64 7
  store i64 %31, i64* %32, align 8
  %33 = getelementptr inbounds i64, i64* %1, i64 8
  %34 = load i64, i64* %33, align 8
  %35 = mul nsw i64 %34, 121665
  %36 = getelementptr inbounds i64, i64* %0, i64 8
  store i64 %35, i64* %36, align 8
  %37 = getelementptr inbounds i64, i64* %1, i64 9
  %38 = load i64, i64* %37, align 8
  %39 = mul nsw i64 %38, 121665
  %40 = getelementptr inbounds i64, i64* %0, i64 9
  store i64 %39, i64* %40, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @randombytes(i8* nocapture %0, i64 %1) local_unnamed_addr #0 {
  %3 = icmp sgt i64 %1, -1
  br i1 %3, label %5, label %4

4:                                                ; preds = %2
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.1, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__PRETTY_FUNCTION__.randombytes, i64 0, i64 0)) #8
  unreachable

5:                                                ; preds = %2
  %6 = load i32, i32* @randombytes.fd, align 4
  %7 = icmp eq i32 %6, -1
  br i1 %7, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %5
  %8 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0) #9
  store i32 %8, i32* @randombytes.fd, align 4
  %9 = icmp eq i32 %8, -1
  br i1 %9, label %.lr.ph7, label %.loopexit

.lr.ph7:                                          ; preds = %.preheader, %91
  %10 = call i32 @sleep(i32 1) #9
  %11 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0) #9
  store i32 %11, i32* @randombytes.fd, align 4
  %12 = icmp eq i32 %11, -1
  br i1 %12, label %67, label %.loopexit

.loopexit:                                        ; preds = %91, %87, %83, %79, %75, %71, %67, %.lr.ph7, %.preheader, %5
  %13 = icmp sgt i64 %1, 0
  br i1 %13, label %.lr.ph, label %.outer._crit_edge

.lr.ph:                                           ; preds = %.loopexit, %.outer
  %14 = phi i1 [ %24, %.outer ], [ %13, %.loopexit ]
  %.0.ph6 = phi i8* [ %22, %.outer ], [ %0, %.loopexit ]
  %.01.ph5 = phi i64 [ %23, %.outer ], [ %1, %.loopexit ]
  %15 = icmp slt i64 %.01.ph5, 1048576
  %.01. = select i1 %15, i64 %.01.ph5, i64 1048576
  br label %16

16:                                               ; preds = %65, %.lr.ph
  %17 = load i32, i32* @randombytes.fd, align 4
  %18 = call i64 @read(i32 %17, i8* %.0.ph6, i64 %.01.) #9
  %19 = icmp slt i64 %18, 1
  br i1 %19, label %20, label %.outer

20:                                               ; preds = %16
  %21 = call i32 @sleep(i32 1) #9
  br i1 %14, label %25, label %.outer._crit_edge

.outer:                                           ; preds = %61, %55, %49, %43, %37, %31, %25, %16
  %.lcssa = phi i64 [ %18, %16 ], [ %27, %25 ], [ %33, %31 ], [ %39, %37 ], [ %45, %43 ], [ %51, %49 ], [ %57, %55 ], [ %63, %61 ]
  %22 = getelementptr inbounds i8, i8* %.0.ph6, i64 %.lcssa
  %23 = sub nsw i64 %.01.ph5, %.lcssa
  %24 = icmp sgt i64 %23, 0
  br i1 %24, label %.lr.ph, label %.outer._crit_edge

.outer._crit_edge:                                ; preds = %.outer, %20, %29, %35, %41, %47, %53, %59, %65, %.loopexit
  ret void

25:                                               ; preds = %20
  %26 = load i32, i32* @randombytes.fd, align 4
  %27 = call i64 @read(i32 %26, i8* %.0.ph6, i64 %.01.) #9
  %28 = icmp slt i64 %27, 1
  br i1 %28, label %29, label %.outer

29:                                               ; preds = %25
  %30 = call i32 @sleep(i32 1) #9
  br i1 %14, label %31, label %.outer._crit_edge

31:                                               ; preds = %29
  %32 = load i32, i32* @randombytes.fd, align 4
  %33 = call i64 @read(i32 %32, i8* %.0.ph6, i64 %.01.) #9
  %34 = icmp slt i64 %33, 1
  br i1 %34, label %35, label %.outer

35:                                               ; preds = %31
  %36 = call i32 @sleep(i32 1) #9
  br i1 %14, label %37, label %.outer._crit_edge

37:                                               ; preds = %35
  %38 = load i32, i32* @randombytes.fd, align 4
  %39 = call i64 @read(i32 %38, i8* %.0.ph6, i64 %.01.) #9
  %40 = icmp slt i64 %39, 1
  br i1 %40, label %41, label %.outer

41:                                               ; preds = %37
  %42 = call i32 @sleep(i32 1) #9
  br i1 %14, label %43, label %.outer._crit_edge

43:                                               ; preds = %41
  %44 = load i32, i32* @randombytes.fd, align 4
  %45 = call i64 @read(i32 %44, i8* %.0.ph6, i64 %.01.) #9
  %46 = icmp slt i64 %45, 1
  br i1 %46, label %47, label %.outer

47:                                               ; preds = %43
  %48 = call i32 @sleep(i32 1) #9
  br i1 %14, label %49, label %.outer._crit_edge

49:                                               ; preds = %47
  %50 = load i32, i32* @randombytes.fd, align 4
  %51 = call i64 @read(i32 %50, i8* %.0.ph6, i64 %.01.) #9
  %52 = icmp slt i64 %51, 1
  br i1 %52, label %53, label %.outer

53:                                               ; preds = %49
  %54 = call i32 @sleep(i32 1) #9
  br i1 %14, label %55, label %.outer._crit_edge

55:                                               ; preds = %53
  %56 = load i32, i32* @randombytes.fd, align 4
  %57 = call i64 @read(i32 %56, i8* %.0.ph6, i64 %.01.) #9
  %58 = icmp slt i64 %57, 1
  br i1 %58, label %59, label %.outer

59:                                               ; preds = %55
  %60 = call i32 @sleep(i32 1) #9
  br i1 %14, label %61, label %.outer._crit_edge

61:                                               ; preds = %59
  %62 = load i32, i32* @randombytes.fd, align 4
  %63 = call i64 @read(i32 %62, i8* %.0.ph6, i64 %.01.) #9
  %64 = icmp slt i64 %63, 1
  br i1 %64, label %65, label %.outer

65:                                               ; preds = %61
  %66 = call i32 @sleep(i32 1) #9
  br i1 %14, label %16, label %.outer._crit_edge, !llvm.loop !4

67:                                               ; preds = %.lr.ph7
  %68 = call i32 @sleep(i32 1) #9
  %69 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0) #9
  store i32 %69, i32* @randombytes.fd, align 4
  %70 = icmp eq i32 %69, -1
  br i1 %70, label %71, label %.loopexit

71:                                               ; preds = %67
  %72 = call i32 @sleep(i32 1) #9
  %73 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0) #9
  store i32 %73, i32* @randombytes.fd, align 4
  %74 = icmp eq i32 %73, -1
  br i1 %74, label %75, label %.loopexit

75:                                               ; preds = %71
  %76 = call i32 @sleep(i32 1) #9
  %77 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0) #9
  store i32 %77, i32* @randombytes.fd, align 4
  %78 = icmp eq i32 %77, -1
  br i1 %78, label %79, label %.loopexit

79:                                               ; preds = %75
  %80 = call i32 @sleep(i32 1) #9
  %81 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0) #9
  store i32 %81, i32* @randombytes.fd, align 4
  %82 = icmp eq i32 %81, -1
  br i1 %82, label %83, label %.loopexit

83:                                               ; preds = %79
  %84 = call i32 @sleep(i32 1) #9
  %85 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0) #9
  store i32 %85, i32* @randombytes.fd, align 4
  %86 = icmp eq i32 %85, -1
  br i1 %86, label %87, label %.loopexit

87:                                               ; preds = %83
  %88 = call i32 @sleep(i32 1) #9
  %89 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0) #9
  store i32 %89, i32* @randombytes.fd, align 4
  %90 = icmp eq i32 %89, -1
  br i1 %90, label %91, label %.loopexit

91:                                               ; preds = %87
  %92 = call i32 @sleep(i32 1) #9
  %93 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0) #9
  store i32 %93, i32* @randombytes.fd, align 4
  %94 = icmp eq i32 %93, -1
  br i1 %94, label %.lr.ph7, label %.loopexit, !llvm.loop !6
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #5

; Function Attrs: nofree
declare i32 @open(i8* nocapture readonly, i32, ...) local_unnamed_addr #6

declare i32 @sleep(i32) local_unnamed_addr #7

; Function Attrs: nofree
declare i64 @read(i32, i8* nocapture, i64) local_unnamed_addr #6

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i8 @randombit() local_unnamed_addr #0 {
  %1 = alloca i8, align 1
  store i8 0, i8* %1, align 1
  call void @randombytes(i8* nonnull %1, i64 1)
  %2 = load i8, i8* %1, align 1
  %3 = and i8 %2, 1
  ret i8 %3
}

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind readnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree noinline norecurse nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nofree "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = distinct !{!6, !5}

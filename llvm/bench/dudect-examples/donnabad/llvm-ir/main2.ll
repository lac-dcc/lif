; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.input_data = private unnamed_addr constant [32 x i8] c"\91E\EE\0C\8A\BA\13\C5\AE\EB\A4\DC\BC?\E40X{\7F5\AB\09\96\A6AI\17\F4\D2qj\D6", align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@chunk_size = dso_local constant i64 32, align 8
@number_measurements = dso_local constant i64 1, align 8
@__const.do_one_computation.basepoint = private unnamed_addr constant <{ i8, [31 x i8] }> <{ i8 9, [31 x i8] zeroinitializer }>, align 16
@.str.9 = private unnamed_addr constant [10 x i8] c"xlen >= 0\00", align 1
@.str.1 = private unnamed_addr constant [42 x i8] c"dudect-examples/donnabad/sources/random.c\00", align 1
@__PRETTY_FUNCTION__.randombytes = private unnamed_addr constant [36 x i8] c"void randombytes(uint8_t *, size_t)\00", align 1
@randombytes.fd = internal global i32 -1, align 4
@.str.2 = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [32 x i8], align 16
  store i32 0, i32* %1, align 4
  call void @init_dut()
  %3 = bitcast [32 x i8]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 getelementptr inbounds ([32 x i8], [32 x i8]* @__const.main.input_data, i32 0, i32 0), i64 32, i1 false)
  %4 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  %5 = call zeroext i8 @do_one_computation(i8* %4)
  %6 = zext i8 %5 to i32
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %6)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i8 @do_one_computation(i8* %0) #0 {
  %2 = alloca [32 x i8], align 16
  %3 = alloca [32 x i8], align 16
  %4 = bitcast [32 x i8]* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 32, i1 false)
  %5 = bitcast [32 x i8]* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 16 getelementptr inbounds (<{ i8, [31 x i8] }>, <{ i8, [31 x i8] }>* @__const.do_one_computation.basepoint, i32 0, i32 0), i64 32, i1 false)
  %6 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  %7 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %8 = call i32 @curve25519_donna(i8* %6, i8* %0, i8* %7)
  %9 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %9, i64 32, i1 false)
  %10 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  %11 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %12 = call i32 @curve25519_donna(i8* %10, i8* %0, i8* %11)
  %13 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %13, i64 32, i1 false)
  %14 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  %15 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %16 = call i32 @curve25519_donna(i8* %14, i8* %0, i8* %15)
  %17 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %17, i64 32, i1 false)
  %18 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  %19 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %20 = call i32 @curve25519_donna(i8* %18, i8* %0, i8* %19)
  %21 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %21, i64 32, i1 false)
  %22 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  %23 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %24 = call i32 @curve25519_donna(i8* %22, i8* %0, i8* %23)
  %25 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %25, i64 32, i1 false)
  %26 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  %27 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %28 = call i32 @curve25519_donna(i8* %26, i8* %0, i8* %27)
  %29 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %29, i64 32, i1 false)
  %30 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  %31 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %32 = call i32 @curve25519_donna(i8* %30, i8* %0, i8* %31)
  %33 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %33, i64 32, i1 false)
  %34 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  %35 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %36 = call i32 @curve25519_donna(i8* %34, i8* %0, i8* %35)
  %37 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %37, i64 32, i1 false)
  %38 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  %39 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %40 = call i32 @curve25519_donna(i8* %38, i8* %0, i8* %39)
  %41 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %41, i64 32, i1 false)
  %42 = getelementptr inbounds [32 x i8], [32 x i8]* %2, i64 0, i64 0
  %43 = load i8, i8* %42, align 16
  %44 = zext i8 %43 to i32
  %45 = zext i8 0 to i32
  %46 = xor i32 %45, %44
  %47 = trunc i32 %46 to i8
  ret i8 %47
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @init_dut() #0 {
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @prepare_inputs(i8* %0, i8* %1) #0 {
  call void @randombytes(i8* %0, i64 32)
  %3 = call zeroext i8 @randombit()
  store i8 %3, i8* %1, align 1
  %4 = load i8, i8* %1, align 1
  %5 = zext i8 %4 to i32
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 32, i1 false)
  br label %8

8:                                                ; preds = %7, %2
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @curve25519_donna(i8* %0, i8* %1, i8* %2) #0 {
  %4 = alloca [10 x i64], align 16
  %5 = alloca [10 x i64], align 16
  %6 = alloca [11 x i64], align 16
  %7 = alloca [10 x i64], align 16
  %8 = alloca [32 x i8], align 16
  %9 = load i8, i8* %1, align 1
  %10 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 0
  store i8 %9, i8* %10, align 1
  %11 = getelementptr inbounds i8, i8* %1, i64 1
  %12 = load i8, i8* %11, align 1
  %13 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 1
  store i8 %12, i8* %13, align 1
  %14 = getelementptr inbounds i8, i8* %1, i64 2
  %15 = load i8, i8* %14, align 1
  %16 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 2
  store i8 %15, i8* %16, align 1
  %17 = getelementptr inbounds i8, i8* %1, i64 3
  %18 = load i8, i8* %17, align 1
  %19 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 3
  store i8 %18, i8* %19, align 1
  %20 = getelementptr inbounds i8, i8* %1, i64 4
  %21 = load i8, i8* %20, align 1
  %22 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 4
  store i8 %21, i8* %22, align 1
  %23 = getelementptr inbounds i8, i8* %1, i64 5
  %24 = load i8, i8* %23, align 1
  %25 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 5
  store i8 %24, i8* %25, align 1
  %26 = getelementptr inbounds i8, i8* %1, i64 6
  %27 = load i8, i8* %26, align 1
  %28 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 6
  store i8 %27, i8* %28, align 1
  %29 = getelementptr inbounds i8, i8* %1, i64 7
  %30 = load i8, i8* %29, align 1
  %31 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 7
  store i8 %30, i8* %31, align 1
  %32 = getelementptr inbounds i8, i8* %1, i64 8
  %33 = load i8, i8* %32, align 1
  %34 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 8
  store i8 %33, i8* %34, align 1
  %35 = getelementptr inbounds i8, i8* %1, i64 9
  %36 = load i8, i8* %35, align 1
  %37 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 9
  store i8 %36, i8* %37, align 1
  %38 = getelementptr inbounds i8, i8* %1, i64 10
  %39 = load i8, i8* %38, align 1
  %40 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 10
  store i8 %39, i8* %40, align 1
  %41 = getelementptr inbounds i8, i8* %1, i64 11
  %42 = load i8, i8* %41, align 1
  %43 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 11
  store i8 %42, i8* %43, align 1
  %44 = getelementptr inbounds i8, i8* %1, i64 12
  %45 = load i8, i8* %44, align 1
  %46 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 12
  store i8 %45, i8* %46, align 1
  %47 = getelementptr inbounds i8, i8* %1, i64 13
  %48 = load i8, i8* %47, align 1
  %49 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 13
  store i8 %48, i8* %49, align 1
  %50 = getelementptr inbounds i8, i8* %1, i64 14
  %51 = load i8, i8* %50, align 1
  %52 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 14
  store i8 %51, i8* %52, align 1
  %53 = getelementptr inbounds i8, i8* %1, i64 15
  %54 = load i8, i8* %53, align 1
  %55 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 15
  store i8 %54, i8* %55, align 1
  %56 = getelementptr inbounds i8, i8* %1, i64 16
  %57 = load i8, i8* %56, align 1
  %58 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 16
  store i8 %57, i8* %58, align 1
  %59 = getelementptr inbounds i8, i8* %1, i64 17
  %60 = load i8, i8* %59, align 1
  %61 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 17
  store i8 %60, i8* %61, align 1
  %62 = getelementptr inbounds i8, i8* %1, i64 18
  %63 = load i8, i8* %62, align 1
  %64 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 18
  store i8 %63, i8* %64, align 1
  %65 = getelementptr inbounds i8, i8* %1, i64 19
  %66 = load i8, i8* %65, align 1
  %67 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 19
  store i8 %66, i8* %67, align 1
  %68 = getelementptr inbounds i8, i8* %1, i64 20
  %69 = load i8, i8* %68, align 1
  %70 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 20
  store i8 %69, i8* %70, align 1
  %71 = getelementptr inbounds i8, i8* %1, i64 21
  %72 = load i8, i8* %71, align 1
  %73 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 21
  store i8 %72, i8* %73, align 1
  %74 = getelementptr inbounds i8, i8* %1, i64 22
  %75 = load i8, i8* %74, align 1
  %76 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 22
  store i8 %75, i8* %76, align 1
  %77 = getelementptr inbounds i8, i8* %1, i64 23
  %78 = load i8, i8* %77, align 1
  %79 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 23
  store i8 %78, i8* %79, align 1
  %80 = getelementptr inbounds i8, i8* %1, i64 24
  %81 = load i8, i8* %80, align 1
  %82 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 24
  store i8 %81, i8* %82, align 1
  %83 = getelementptr inbounds i8, i8* %1, i64 25
  %84 = load i8, i8* %83, align 1
  %85 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 25
  store i8 %84, i8* %85, align 1
  %86 = getelementptr inbounds i8, i8* %1, i64 26
  %87 = load i8, i8* %86, align 1
  %88 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 26
  store i8 %87, i8* %88, align 1
  %89 = getelementptr inbounds i8, i8* %1, i64 27
  %90 = load i8, i8* %89, align 1
  %91 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 27
  store i8 %90, i8* %91, align 1
  %92 = getelementptr inbounds i8, i8* %1, i64 28
  %93 = load i8, i8* %92, align 1
  %94 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 28
  store i8 %93, i8* %94, align 1
  %95 = getelementptr inbounds i8, i8* %1, i64 29
  %96 = load i8, i8* %95, align 1
  %97 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 29
  store i8 %96, i8* %97, align 1
  %98 = getelementptr inbounds i8, i8* %1, i64 30
  %99 = load i8, i8* %98, align 1
  %100 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 30
  store i8 %99, i8* %100, align 1
  %101 = getelementptr inbounds i8, i8* %1, i64 31
  %102 = load i8, i8* %101, align 1
  %103 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 31
  store i8 %102, i8* %103, align 1
  %104 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 0
  %105 = load i8, i8* %104, align 16
  %106 = zext i8 %105 to i32
  %107 = and i32 %106, 248
  %108 = trunc i32 %107 to i8
  store i8 %108, i8* %104, align 16
  %109 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 31
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i32
  %112 = and i32 %111, 127
  %113 = trunc i32 %112 to i8
  store i8 %113, i8* %109, align 1
  %114 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 31
  %115 = load i8, i8* %114, align 1
  %116 = zext i8 %115 to i32
  %117 = or i32 %116, 64
  %118 = trunc i32 %117 to i8
  store i8 %118, i8* %114, align 1
  %119 = getelementptr inbounds [10 x i64], [10 x i64]* %4, i64 0, i64 0
  call void @fexpand(i64* %119, i8* %2)
  %120 = getelementptr inbounds [10 x i64], [10 x i64]* %5, i64 0, i64 0
  %121 = getelementptr inbounds [11 x i64], [11 x i64]* %6, i64 0, i64 0
  %122 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 0
  %123 = getelementptr inbounds [10 x i64], [10 x i64]* %4, i64 0, i64 0
  call void @cmult(i64* %120, i64* %121, i8* %122, i64* %123)
  %124 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  %125 = getelementptr inbounds [11 x i64], [11 x i64]* %6, i64 0, i64 0
  call void @crecip(i64* %124, i64* %125)
  %126 = getelementptr inbounds [11 x i64], [11 x i64]* %6, i64 0, i64 0
  %127 = getelementptr inbounds [10 x i64], [10 x i64]* %5, i64 0, i64 0
  %128 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  call void @fmul(i64* %126, i64* %127, i64* %128)
  %129 = getelementptr inbounds [11 x i64], [11 x i64]* %6, i64 0, i64 0
  call void @fcontract(i8* %0, i64* %129)
  ret i32 0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @fexpand(i64* %0, i8* %1) #0 {
  %3 = getelementptr inbounds i8, i8* %1, i64 0
  %4 = load i8, i8* %3, align 1
  %5 = zext i8 %4 to i64
  %6 = getelementptr inbounds i8, i8* %1, i64 1
  %7 = load i8, i8* %6, align 1
  %8 = zext i8 %7 to i64
  %9 = shl i64 %8, 8
  %10 = or i64 %5, %9
  %11 = getelementptr inbounds i8, i8* %1, i64 2
  %12 = load i8, i8* %11, align 1
  %13 = zext i8 %12 to i64
  %14 = shl i64 %13, 16
  %15 = or i64 %10, %14
  %16 = getelementptr inbounds i8, i8* %1, i64 3
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i64
  %19 = shl i64 %18, 24
  %20 = or i64 %15, %19
  %21 = ashr i64 %20, 0
  %22 = and i64 %21, 67108863
  %23 = getelementptr inbounds i64, i64* %0, i64 0
  store i64 %22, i64* %23, align 8
  %24 = getelementptr inbounds i8, i8* %1, i64 3
  %25 = load i8, i8* %24, align 1
  %26 = zext i8 %25 to i64
  %27 = getelementptr inbounds i8, i8* %1, i64 4
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i64
  %30 = shl i64 %29, 8
  %31 = or i64 %26, %30
  %32 = getelementptr inbounds i8, i8* %1, i64 5
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i64
  %35 = shl i64 %34, 16
  %36 = or i64 %31, %35
  %37 = getelementptr inbounds i8, i8* %1, i64 6
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i64
  %40 = shl i64 %39, 24
  %41 = or i64 %36, %40
  %42 = ashr i64 %41, 2
  %43 = and i64 %42, 33554431
  %44 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %43, i64* %44, align 8
  %45 = getelementptr inbounds i8, i8* %1, i64 6
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i64
  %48 = getelementptr inbounds i8, i8* %1, i64 7
  %49 = load i8, i8* %48, align 1
  %50 = zext i8 %49 to i64
  %51 = shl i64 %50, 8
  %52 = or i64 %47, %51
  %53 = getelementptr inbounds i8, i8* %1, i64 8
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i64
  %56 = shl i64 %55, 16
  %57 = or i64 %52, %56
  %58 = getelementptr inbounds i8, i8* %1, i64 9
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i64
  %61 = shl i64 %60, 24
  %62 = or i64 %57, %61
  %63 = ashr i64 %62, 3
  %64 = and i64 %63, 67108863
  %65 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %64, i64* %65, align 8
  %66 = getelementptr inbounds i8, i8* %1, i64 9
  %67 = load i8, i8* %66, align 1
  %68 = zext i8 %67 to i64
  %69 = getelementptr inbounds i8, i8* %1, i64 10
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i64
  %72 = shl i64 %71, 8
  %73 = or i64 %68, %72
  %74 = getelementptr inbounds i8, i8* %1, i64 11
  %75 = load i8, i8* %74, align 1
  %76 = zext i8 %75 to i64
  %77 = shl i64 %76, 16
  %78 = or i64 %73, %77
  %79 = getelementptr inbounds i8, i8* %1, i64 12
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i64
  %82 = shl i64 %81, 24
  %83 = or i64 %78, %82
  %84 = ashr i64 %83, 5
  %85 = and i64 %84, 33554431
  %86 = getelementptr inbounds i64, i64* %0, i64 3
  store i64 %85, i64* %86, align 8
  %87 = getelementptr inbounds i8, i8* %1, i64 12
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i64
  %90 = getelementptr inbounds i8, i8* %1, i64 13
  %91 = load i8, i8* %90, align 1
  %92 = zext i8 %91 to i64
  %93 = shl i64 %92, 8
  %94 = or i64 %89, %93
  %95 = getelementptr inbounds i8, i8* %1, i64 14
  %96 = load i8, i8* %95, align 1
  %97 = zext i8 %96 to i64
  %98 = shl i64 %97, 16
  %99 = or i64 %94, %98
  %100 = getelementptr inbounds i8, i8* %1, i64 15
  %101 = load i8, i8* %100, align 1
  %102 = zext i8 %101 to i64
  %103 = shl i64 %102, 24
  %104 = or i64 %99, %103
  %105 = ashr i64 %104, 6
  %106 = and i64 %105, 67108863
  %107 = getelementptr inbounds i64, i64* %0, i64 4
  store i64 %106, i64* %107, align 8
  %108 = getelementptr inbounds i8, i8* %1, i64 16
  %109 = load i8, i8* %108, align 1
  %110 = zext i8 %109 to i64
  %111 = getelementptr inbounds i8, i8* %1, i64 17
  %112 = load i8, i8* %111, align 1
  %113 = zext i8 %112 to i64
  %114 = shl i64 %113, 8
  %115 = or i64 %110, %114
  %116 = getelementptr inbounds i8, i8* %1, i64 18
  %117 = load i8, i8* %116, align 1
  %118 = zext i8 %117 to i64
  %119 = shl i64 %118, 16
  %120 = or i64 %115, %119
  %121 = getelementptr inbounds i8, i8* %1, i64 19
  %122 = load i8, i8* %121, align 1
  %123 = zext i8 %122 to i64
  %124 = shl i64 %123, 24
  %125 = or i64 %120, %124
  %126 = ashr i64 %125, 0
  %127 = and i64 %126, 33554431
  %128 = getelementptr inbounds i64, i64* %0, i64 5
  store i64 %127, i64* %128, align 8
  %129 = getelementptr inbounds i8, i8* %1, i64 19
  %130 = load i8, i8* %129, align 1
  %131 = zext i8 %130 to i64
  %132 = getelementptr inbounds i8, i8* %1, i64 20
  %133 = load i8, i8* %132, align 1
  %134 = zext i8 %133 to i64
  %135 = shl i64 %134, 8
  %136 = or i64 %131, %135
  %137 = getelementptr inbounds i8, i8* %1, i64 21
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i64
  %140 = shl i64 %139, 16
  %141 = or i64 %136, %140
  %142 = getelementptr inbounds i8, i8* %1, i64 22
  %143 = load i8, i8* %142, align 1
  %144 = zext i8 %143 to i64
  %145 = shl i64 %144, 24
  %146 = or i64 %141, %145
  %147 = ashr i64 %146, 1
  %148 = and i64 %147, 67108863
  %149 = getelementptr inbounds i64, i64* %0, i64 6
  store i64 %148, i64* %149, align 8
  %150 = getelementptr inbounds i8, i8* %1, i64 22
  %151 = load i8, i8* %150, align 1
  %152 = zext i8 %151 to i64
  %153 = getelementptr inbounds i8, i8* %1, i64 23
  %154 = load i8, i8* %153, align 1
  %155 = zext i8 %154 to i64
  %156 = shl i64 %155, 8
  %157 = or i64 %152, %156
  %158 = getelementptr inbounds i8, i8* %1, i64 24
  %159 = load i8, i8* %158, align 1
  %160 = zext i8 %159 to i64
  %161 = shl i64 %160, 16
  %162 = or i64 %157, %161
  %163 = getelementptr inbounds i8, i8* %1, i64 25
  %164 = load i8, i8* %163, align 1
  %165 = zext i8 %164 to i64
  %166 = shl i64 %165, 24
  %167 = or i64 %162, %166
  %168 = ashr i64 %167, 3
  %169 = and i64 %168, 33554431
  %170 = getelementptr inbounds i64, i64* %0, i64 7
  store i64 %169, i64* %170, align 8
  %171 = getelementptr inbounds i8, i8* %1, i64 25
  %172 = load i8, i8* %171, align 1
  %173 = zext i8 %172 to i64
  %174 = getelementptr inbounds i8, i8* %1, i64 26
  %175 = load i8, i8* %174, align 1
  %176 = zext i8 %175 to i64
  %177 = shl i64 %176, 8
  %178 = or i64 %173, %177
  %179 = getelementptr inbounds i8, i8* %1, i64 27
  %180 = load i8, i8* %179, align 1
  %181 = zext i8 %180 to i64
  %182 = shl i64 %181, 16
  %183 = or i64 %178, %182
  %184 = getelementptr inbounds i8, i8* %1, i64 28
  %185 = load i8, i8* %184, align 1
  %186 = zext i8 %185 to i64
  %187 = shl i64 %186, 24
  %188 = or i64 %183, %187
  %189 = ashr i64 %188, 4
  %190 = and i64 %189, 67108863
  %191 = getelementptr inbounds i64, i64* %0, i64 8
  store i64 %190, i64* %191, align 8
  %192 = getelementptr inbounds i8, i8* %1, i64 28
  %193 = load i8, i8* %192, align 1
  %194 = zext i8 %193 to i64
  %195 = getelementptr inbounds i8, i8* %1, i64 29
  %196 = load i8, i8* %195, align 1
  %197 = zext i8 %196 to i64
  %198 = shl i64 %197, 8
  %199 = or i64 %194, %198
  %200 = getelementptr inbounds i8, i8* %1, i64 30
  %201 = load i8, i8* %200, align 1
  %202 = zext i8 %201 to i64
  %203 = shl i64 %202, 16
  %204 = or i64 %199, %203
  %205 = getelementptr inbounds i8, i8* %1, i64 31
  %206 = load i8, i8* %205, align 1
  %207 = zext i8 %206 to i64
  %208 = shl i64 %207, 24
  %209 = or i64 %204, %208
  %210 = ashr i64 %209, 6
  %211 = and i64 %210, 33554431
  %212 = getelementptr inbounds i64, i64* %0, i64 9
  store i64 %211, i64* %212, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @cmult(i64* %0, i64* %1, i8* %2, i64* %3) #0 {
  %5 = alloca [19 x i64], align 16
  %6 = alloca [19 x i64], align 16
  %7 = alloca [19 x i64], align 16
  %8 = alloca [19 x i64], align 16
  %9 = alloca [19 x i64], align 16
  %10 = alloca [19 x i64], align 16
  %11 = alloca [19 x i64], align 16
  %12 = alloca [19 x i64], align 16
  %13 = bitcast [19 x i64]* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %13, i8 0, i64 152, i1 false)
  %14 = bitcast [19 x i64]* %6 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %14, i8 0, i64 152, i1 false)
  %15 = bitcast i8* %14 to <{ i64, [18 x i64] }>*
  %16 = getelementptr inbounds <{ i64, [18 x i64] }>, <{ i64, [18 x i64] }>* %15, i32 0, i32 0
  store i64 1, i64* %16, align 16
  %17 = bitcast [19 x i64]* %7 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 152, i1 false)
  %18 = bitcast i8* %17 to <{ i64, [18 x i64] }>*
  %19 = getelementptr inbounds <{ i64, [18 x i64] }>, <{ i64, [18 x i64] }>* %18, i32 0, i32 0
  store i64 1, i64* %19, align 16
  %20 = bitcast [19 x i64]* %8 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %20, i8 0, i64 152, i1 false)
  %21 = getelementptr inbounds [19 x i64], [19 x i64]* %5, i64 0, i64 0
  %22 = getelementptr inbounds [19 x i64], [19 x i64]* %6, i64 0, i64 0
  %23 = getelementptr inbounds [19 x i64], [19 x i64]* %7, i64 0, i64 0
  %24 = getelementptr inbounds [19 x i64], [19 x i64]* %8, i64 0, i64 0
  %25 = bitcast [19 x i64]* %9 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %25, i8 0, i64 152, i1 false)
  %26 = bitcast [19 x i64]* %10 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %26, i8 0, i64 152, i1 false)
  %27 = bitcast i8* %26 to <{ i64, [18 x i64] }>*
  %28 = getelementptr inbounds <{ i64, [18 x i64] }>, <{ i64, [18 x i64] }>* %27, i32 0, i32 0
  store i64 1, i64* %28, align 16
  %29 = bitcast [19 x i64]* %11 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %29, i8 0, i64 152, i1 false)
  %30 = bitcast [19 x i64]* %12 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %30, i8 0, i64 152, i1 false)
  %31 = bitcast i8* %30 to <{ i64, [18 x i64] }>*
  %32 = getelementptr inbounds <{ i64, [18 x i64] }>, <{ i64, [18 x i64] }>* %31, i32 0, i32 0
  store i64 1, i64* %32, align 16
  %33 = getelementptr inbounds [19 x i64], [19 x i64]* %9, i64 0, i64 0
  %34 = getelementptr inbounds [19 x i64], [19 x i64]* %10, i64 0, i64 0
  %35 = getelementptr inbounds [19 x i64], [19 x i64]* %11, i64 0, i64 0
  %36 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  %37 = bitcast i64* %21 to i8*
  %38 = bitcast i64* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %37, i8* align 8 %38, i64 80, i1 false)
  %39 = getelementptr inbounds i8, i8* %2, i64 31
  %40 = load i8, i8* %39, align 1
  %41 = zext i8 %40 to i32
  %42 = ashr i32 %41, 7
  %43 = sext i32 %42 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %43)
  call void @swap_conditional(i64* %24, i64* %22, i64 %43)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %43)
  call void @swap_conditional(i64* %36, i64* %34, i64 %43)
  %44 = zext i8 %40 to i32
  %45 = shl i32 %44, 1
  %46 = trunc i32 %45 to i8
  %47 = zext i8 %46 to i32
  %48 = ashr i32 %47, 7
  %49 = sext i32 %48 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %49)
  call void @swap_conditional(i64* %36, i64* %34, i64 %49)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %49)
  call void @swap_conditional(i64* %24, i64* %22, i64 %49)
  %50 = zext i8 %46 to i32
  %51 = shl i32 %50, 1
  %52 = trunc i32 %51 to i8
  %53 = zext i8 %52 to i32
  %54 = ashr i32 %53, 7
  %55 = sext i32 %54 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %55)
  call void @swap_conditional(i64* %24, i64* %22, i64 %55)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %55)
  call void @swap_conditional(i64* %36, i64* %34, i64 %55)
  %56 = zext i8 %52 to i32
  %57 = shl i32 %56, 1
  %58 = trunc i32 %57 to i8
  %59 = zext i8 %58 to i32
  %60 = ashr i32 %59, 7
  %61 = sext i32 %60 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %61)
  call void @swap_conditional(i64* %36, i64* %34, i64 %61)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %61)
  call void @swap_conditional(i64* %24, i64* %22, i64 %61)
  %62 = zext i8 %58 to i32
  %63 = shl i32 %62, 1
  %64 = trunc i32 %63 to i8
  %65 = zext i8 %64 to i32
  %66 = ashr i32 %65, 7
  %67 = sext i32 %66 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %67)
  call void @swap_conditional(i64* %24, i64* %22, i64 %67)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %67)
  call void @swap_conditional(i64* %36, i64* %34, i64 %67)
  %68 = zext i8 %64 to i32
  %69 = shl i32 %68, 1
  %70 = trunc i32 %69 to i8
  %71 = zext i8 %70 to i32
  %72 = ashr i32 %71, 7
  %73 = sext i32 %72 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %73)
  call void @swap_conditional(i64* %36, i64* %34, i64 %73)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %73)
  call void @swap_conditional(i64* %24, i64* %22, i64 %73)
  %74 = zext i8 %70 to i32
  %75 = shl i32 %74, 1
  %76 = trunc i32 %75 to i8
  %77 = zext i8 %76 to i32
  %78 = ashr i32 %77, 7
  %79 = sext i32 %78 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %79)
  call void @swap_conditional(i64* %24, i64* %22, i64 %79)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %79)
  call void @swap_conditional(i64* %36, i64* %34, i64 %79)
  %80 = zext i8 %76 to i32
  %81 = shl i32 %80, 1
  %82 = trunc i32 %81 to i8
  %83 = zext i8 %82 to i32
  %84 = ashr i32 %83, 7
  %85 = sext i32 %84 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %85)
  call void @swap_conditional(i64* %36, i64* %34, i64 %85)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %85)
  call void @swap_conditional(i64* %24, i64* %22, i64 %85)
  %86 = zext i8 %82 to i32
  %87 = getelementptr inbounds i8, i8* %2, i64 30
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = ashr i32 %89, 7
  %91 = sext i32 %90 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %91)
  call void @swap_conditional(i64* %24, i64* %22, i64 %91)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %91)
  call void @swap_conditional(i64* %36, i64* %34, i64 %91)
  %92 = zext i8 %88 to i32
  %93 = shl i32 %92, 1
  %94 = trunc i32 %93 to i8
  %95 = zext i8 %94 to i32
  %96 = ashr i32 %95, 7
  %97 = sext i32 %96 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %97)
  call void @swap_conditional(i64* %36, i64* %34, i64 %97)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %97)
  call void @swap_conditional(i64* %24, i64* %22, i64 %97)
  %98 = zext i8 %94 to i32
  %99 = shl i32 %98, 1
  %100 = trunc i32 %99 to i8
  %101 = zext i8 %100 to i32
  %102 = ashr i32 %101, 7
  %103 = sext i32 %102 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %103)
  call void @swap_conditional(i64* %24, i64* %22, i64 %103)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %103)
  call void @swap_conditional(i64* %36, i64* %34, i64 %103)
  %104 = zext i8 %100 to i32
  %105 = shl i32 %104, 1
  %106 = trunc i32 %105 to i8
  %107 = zext i8 %106 to i32
  %108 = ashr i32 %107, 7
  %109 = sext i32 %108 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %109)
  call void @swap_conditional(i64* %36, i64* %34, i64 %109)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %109)
  call void @swap_conditional(i64* %24, i64* %22, i64 %109)
  %110 = zext i8 %106 to i32
  %111 = shl i32 %110, 1
  %112 = trunc i32 %111 to i8
  %113 = zext i8 %112 to i32
  %114 = ashr i32 %113, 7
  %115 = sext i32 %114 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %115)
  call void @swap_conditional(i64* %24, i64* %22, i64 %115)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %115)
  call void @swap_conditional(i64* %36, i64* %34, i64 %115)
  %116 = zext i8 %112 to i32
  %117 = shl i32 %116, 1
  %118 = trunc i32 %117 to i8
  %119 = zext i8 %118 to i32
  %120 = ashr i32 %119, 7
  %121 = sext i32 %120 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %121)
  call void @swap_conditional(i64* %36, i64* %34, i64 %121)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %121)
  call void @swap_conditional(i64* %24, i64* %22, i64 %121)
  %122 = zext i8 %118 to i32
  %123 = shl i32 %122, 1
  %124 = trunc i32 %123 to i8
  %125 = zext i8 %124 to i32
  %126 = ashr i32 %125, 7
  %127 = sext i32 %126 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %127)
  call void @swap_conditional(i64* %24, i64* %22, i64 %127)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %127)
  call void @swap_conditional(i64* %36, i64* %34, i64 %127)
  %128 = zext i8 %124 to i32
  %129 = shl i32 %128, 1
  %130 = trunc i32 %129 to i8
  %131 = zext i8 %130 to i32
  %132 = ashr i32 %131, 7
  %133 = sext i32 %132 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %133)
  call void @swap_conditional(i64* %36, i64* %34, i64 %133)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %133)
  call void @swap_conditional(i64* %24, i64* %22, i64 %133)
  %134 = zext i8 %130 to i32
  %135 = getelementptr inbounds i8, i8* %2, i64 29
  %136 = load i8, i8* %135, align 1
  %137 = zext i8 %136 to i32
  %138 = ashr i32 %137, 7
  %139 = sext i32 %138 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %139)
  call void @swap_conditional(i64* %24, i64* %22, i64 %139)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %139)
  call void @swap_conditional(i64* %36, i64* %34, i64 %139)
  %140 = zext i8 %136 to i32
  %141 = shl i32 %140, 1
  %142 = trunc i32 %141 to i8
  %143 = zext i8 %142 to i32
  %144 = ashr i32 %143, 7
  %145 = sext i32 %144 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %145)
  call void @swap_conditional(i64* %36, i64* %34, i64 %145)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %145)
  call void @swap_conditional(i64* %24, i64* %22, i64 %145)
  %146 = zext i8 %142 to i32
  %147 = shl i32 %146, 1
  %148 = trunc i32 %147 to i8
  %149 = zext i8 %148 to i32
  %150 = ashr i32 %149, 7
  %151 = sext i32 %150 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %151)
  call void @swap_conditional(i64* %24, i64* %22, i64 %151)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %151)
  call void @swap_conditional(i64* %36, i64* %34, i64 %151)
  %152 = zext i8 %148 to i32
  %153 = shl i32 %152, 1
  %154 = trunc i32 %153 to i8
  %155 = zext i8 %154 to i32
  %156 = ashr i32 %155, 7
  %157 = sext i32 %156 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %157)
  call void @swap_conditional(i64* %36, i64* %34, i64 %157)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %157)
  call void @swap_conditional(i64* %24, i64* %22, i64 %157)
  %158 = zext i8 %154 to i32
  %159 = shl i32 %158, 1
  %160 = trunc i32 %159 to i8
  %161 = zext i8 %160 to i32
  %162 = ashr i32 %161, 7
  %163 = sext i32 %162 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %163)
  call void @swap_conditional(i64* %24, i64* %22, i64 %163)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %163)
  call void @swap_conditional(i64* %36, i64* %34, i64 %163)
  %164 = zext i8 %160 to i32
  %165 = shl i32 %164, 1
  %166 = trunc i32 %165 to i8
  %167 = zext i8 %166 to i32
  %168 = ashr i32 %167, 7
  %169 = sext i32 %168 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %169)
  call void @swap_conditional(i64* %36, i64* %34, i64 %169)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %169)
  call void @swap_conditional(i64* %24, i64* %22, i64 %169)
  %170 = zext i8 %166 to i32
  %171 = shl i32 %170, 1
  %172 = trunc i32 %171 to i8
  %173 = zext i8 %172 to i32
  %174 = ashr i32 %173, 7
  %175 = sext i32 %174 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %175)
  call void @swap_conditional(i64* %24, i64* %22, i64 %175)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %175)
  call void @swap_conditional(i64* %36, i64* %34, i64 %175)
  %176 = zext i8 %172 to i32
  %177 = shl i32 %176, 1
  %178 = trunc i32 %177 to i8
  %179 = zext i8 %178 to i32
  %180 = ashr i32 %179, 7
  %181 = sext i32 %180 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %181)
  call void @swap_conditional(i64* %36, i64* %34, i64 %181)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %181)
  call void @swap_conditional(i64* %24, i64* %22, i64 %181)
  %182 = zext i8 %178 to i32
  %183 = getelementptr inbounds i8, i8* %2, i64 28
  %184 = load i8, i8* %183, align 1
  %185 = zext i8 %184 to i32
  %186 = ashr i32 %185, 7
  %187 = sext i32 %186 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %187)
  call void @swap_conditional(i64* %24, i64* %22, i64 %187)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %187)
  call void @swap_conditional(i64* %36, i64* %34, i64 %187)
  %188 = zext i8 %184 to i32
  %189 = shl i32 %188, 1
  %190 = trunc i32 %189 to i8
  %191 = zext i8 %190 to i32
  %192 = ashr i32 %191, 7
  %193 = sext i32 %192 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %193)
  call void @swap_conditional(i64* %36, i64* %34, i64 %193)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %193)
  call void @swap_conditional(i64* %24, i64* %22, i64 %193)
  %194 = zext i8 %190 to i32
  %195 = shl i32 %194, 1
  %196 = trunc i32 %195 to i8
  %197 = zext i8 %196 to i32
  %198 = ashr i32 %197, 7
  %199 = sext i32 %198 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %199)
  call void @swap_conditional(i64* %24, i64* %22, i64 %199)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %199)
  call void @swap_conditional(i64* %36, i64* %34, i64 %199)
  %200 = zext i8 %196 to i32
  %201 = shl i32 %200, 1
  %202 = trunc i32 %201 to i8
  %203 = zext i8 %202 to i32
  %204 = ashr i32 %203, 7
  %205 = sext i32 %204 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %205)
  call void @swap_conditional(i64* %36, i64* %34, i64 %205)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %205)
  call void @swap_conditional(i64* %24, i64* %22, i64 %205)
  %206 = zext i8 %202 to i32
  %207 = shl i32 %206, 1
  %208 = trunc i32 %207 to i8
  %209 = zext i8 %208 to i32
  %210 = ashr i32 %209, 7
  %211 = sext i32 %210 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %211)
  call void @swap_conditional(i64* %24, i64* %22, i64 %211)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %211)
  call void @swap_conditional(i64* %36, i64* %34, i64 %211)
  %212 = zext i8 %208 to i32
  %213 = shl i32 %212, 1
  %214 = trunc i32 %213 to i8
  %215 = zext i8 %214 to i32
  %216 = ashr i32 %215, 7
  %217 = sext i32 %216 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %217)
  call void @swap_conditional(i64* %36, i64* %34, i64 %217)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %217)
  call void @swap_conditional(i64* %24, i64* %22, i64 %217)
  %218 = zext i8 %214 to i32
  %219 = shl i32 %218, 1
  %220 = trunc i32 %219 to i8
  %221 = zext i8 %220 to i32
  %222 = ashr i32 %221, 7
  %223 = sext i32 %222 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %223)
  call void @swap_conditional(i64* %24, i64* %22, i64 %223)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %223)
  call void @swap_conditional(i64* %36, i64* %34, i64 %223)
  %224 = zext i8 %220 to i32
  %225 = shl i32 %224, 1
  %226 = trunc i32 %225 to i8
  %227 = zext i8 %226 to i32
  %228 = ashr i32 %227, 7
  %229 = sext i32 %228 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %229)
  call void @swap_conditional(i64* %36, i64* %34, i64 %229)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %229)
  call void @swap_conditional(i64* %24, i64* %22, i64 %229)
  %230 = zext i8 %226 to i32
  %231 = getelementptr inbounds i8, i8* %2, i64 27
  %232 = load i8, i8* %231, align 1
  %233 = zext i8 %232 to i32
  %234 = ashr i32 %233, 7
  %235 = sext i32 %234 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %235)
  call void @swap_conditional(i64* %24, i64* %22, i64 %235)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %235)
  call void @swap_conditional(i64* %36, i64* %34, i64 %235)
  %236 = zext i8 %232 to i32
  %237 = shl i32 %236, 1
  %238 = trunc i32 %237 to i8
  %239 = zext i8 %238 to i32
  %240 = ashr i32 %239, 7
  %241 = sext i32 %240 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %241)
  call void @swap_conditional(i64* %36, i64* %34, i64 %241)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %241)
  call void @swap_conditional(i64* %24, i64* %22, i64 %241)
  %242 = zext i8 %238 to i32
  %243 = shl i32 %242, 1
  %244 = trunc i32 %243 to i8
  %245 = zext i8 %244 to i32
  %246 = ashr i32 %245, 7
  %247 = sext i32 %246 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %247)
  call void @swap_conditional(i64* %24, i64* %22, i64 %247)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %247)
  call void @swap_conditional(i64* %36, i64* %34, i64 %247)
  %248 = zext i8 %244 to i32
  %249 = shl i32 %248, 1
  %250 = trunc i32 %249 to i8
  %251 = zext i8 %250 to i32
  %252 = ashr i32 %251, 7
  %253 = sext i32 %252 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %253)
  call void @swap_conditional(i64* %36, i64* %34, i64 %253)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %253)
  call void @swap_conditional(i64* %24, i64* %22, i64 %253)
  %254 = zext i8 %250 to i32
  %255 = shl i32 %254, 1
  %256 = trunc i32 %255 to i8
  %257 = zext i8 %256 to i32
  %258 = ashr i32 %257, 7
  %259 = sext i32 %258 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %259)
  call void @swap_conditional(i64* %24, i64* %22, i64 %259)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %259)
  call void @swap_conditional(i64* %36, i64* %34, i64 %259)
  %260 = zext i8 %256 to i32
  %261 = shl i32 %260, 1
  %262 = trunc i32 %261 to i8
  %263 = zext i8 %262 to i32
  %264 = ashr i32 %263, 7
  %265 = sext i32 %264 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %265)
  call void @swap_conditional(i64* %36, i64* %34, i64 %265)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %265)
  call void @swap_conditional(i64* %24, i64* %22, i64 %265)
  %266 = zext i8 %262 to i32
  %267 = shl i32 %266, 1
  %268 = trunc i32 %267 to i8
  %269 = zext i8 %268 to i32
  %270 = ashr i32 %269, 7
  %271 = sext i32 %270 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %271)
  call void @swap_conditional(i64* %24, i64* %22, i64 %271)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %271)
  call void @swap_conditional(i64* %36, i64* %34, i64 %271)
  %272 = zext i8 %268 to i32
  %273 = shl i32 %272, 1
  %274 = trunc i32 %273 to i8
  %275 = zext i8 %274 to i32
  %276 = ashr i32 %275, 7
  %277 = sext i32 %276 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %277)
  call void @swap_conditional(i64* %36, i64* %34, i64 %277)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %277)
  call void @swap_conditional(i64* %24, i64* %22, i64 %277)
  %278 = zext i8 %274 to i32
  %279 = getelementptr inbounds i8, i8* %2, i64 26
  %280 = load i8, i8* %279, align 1
  %281 = zext i8 %280 to i32
  %282 = ashr i32 %281, 7
  %283 = sext i32 %282 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %283)
  call void @swap_conditional(i64* %24, i64* %22, i64 %283)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %283)
  call void @swap_conditional(i64* %36, i64* %34, i64 %283)
  %284 = zext i8 %280 to i32
  %285 = shl i32 %284, 1
  %286 = trunc i32 %285 to i8
  %287 = zext i8 %286 to i32
  %288 = ashr i32 %287, 7
  %289 = sext i32 %288 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %289)
  call void @swap_conditional(i64* %36, i64* %34, i64 %289)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %289)
  call void @swap_conditional(i64* %24, i64* %22, i64 %289)
  %290 = zext i8 %286 to i32
  %291 = shl i32 %290, 1
  %292 = trunc i32 %291 to i8
  %293 = zext i8 %292 to i32
  %294 = ashr i32 %293, 7
  %295 = sext i32 %294 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %295)
  call void @swap_conditional(i64* %24, i64* %22, i64 %295)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %295)
  call void @swap_conditional(i64* %36, i64* %34, i64 %295)
  %296 = zext i8 %292 to i32
  %297 = shl i32 %296, 1
  %298 = trunc i32 %297 to i8
  %299 = zext i8 %298 to i32
  %300 = ashr i32 %299, 7
  %301 = sext i32 %300 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %301)
  call void @swap_conditional(i64* %36, i64* %34, i64 %301)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %301)
  call void @swap_conditional(i64* %24, i64* %22, i64 %301)
  %302 = zext i8 %298 to i32
  %303 = shl i32 %302, 1
  %304 = trunc i32 %303 to i8
  %305 = zext i8 %304 to i32
  %306 = ashr i32 %305, 7
  %307 = sext i32 %306 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %307)
  call void @swap_conditional(i64* %24, i64* %22, i64 %307)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %307)
  call void @swap_conditional(i64* %36, i64* %34, i64 %307)
  %308 = zext i8 %304 to i32
  %309 = shl i32 %308, 1
  %310 = trunc i32 %309 to i8
  %311 = zext i8 %310 to i32
  %312 = ashr i32 %311, 7
  %313 = sext i32 %312 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %313)
  call void @swap_conditional(i64* %36, i64* %34, i64 %313)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %313)
  call void @swap_conditional(i64* %24, i64* %22, i64 %313)
  %314 = zext i8 %310 to i32
  %315 = shl i32 %314, 1
  %316 = trunc i32 %315 to i8
  %317 = zext i8 %316 to i32
  %318 = ashr i32 %317, 7
  %319 = sext i32 %318 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %319)
  call void @swap_conditional(i64* %24, i64* %22, i64 %319)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %319)
  call void @swap_conditional(i64* %36, i64* %34, i64 %319)
  %320 = zext i8 %316 to i32
  %321 = shl i32 %320, 1
  %322 = trunc i32 %321 to i8
  %323 = zext i8 %322 to i32
  %324 = ashr i32 %323, 7
  %325 = sext i32 %324 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %325)
  call void @swap_conditional(i64* %36, i64* %34, i64 %325)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %325)
  call void @swap_conditional(i64* %24, i64* %22, i64 %325)
  %326 = zext i8 %322 to i32
  %327 = getelementptr inbounds i8, i8* %2, i64 25
  %328 = load i8, i8* %327, align 1
  %329 = zext i8 %328 to i32
  %330 = ashr i32 %329, 7
  %331 = sext i32 %330 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %331)
  call void @swap_conditional(i64* %24, i64* %22, i64 %331)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %331)
  call void @swap_conditional(i64* %36, i64* %34, i64 %331)
  %332 = zext i8 %328 to i32
  %333 = shl i32 %332, 1
  %334 = trunc i32 %333 to i8
  %335 = zext i8 %334 to i32
  %336 = ashr i32 %335, 7
  %337 = sext i32 %336 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %337)
  call void @swap_conditional(i64* %36, i64* %34, i64 %337)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %337)
  call void @swap_conditional(i64* %24, i64* %22, i64 %337)
  %338 = zext i8 %334 to i32
  %339 = shl i32 %338, 1
  %340 = trunc i32 %339 to i8
  %341 = zext i8 %340 to i32
  %342 = ashr i32 %341, 7
  %343 = sext i32 %342 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %343)
  call void @swap_conditional(i64* %24, i64* %22, i64 %343)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %343)
  call void @swap_conditional(i64* %36, i64* %34, i64 %343)
  %344 = zext i8 %340 to i32
  %345 = shl i32 %344, 1
  %346 = trunc i32 %345 to i8
  %347 = zext i8 %346 to i32
  %348 = ashr i32 %347, 7
  %349 = sext i32 %348 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %349)
  call void @swap_conditional(i64* %36, i64* %34, i64 %349)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %349)
  call void @swap_conditional(i64* %24, i64* %22, i64 %349)
  %350 = zext i8 %346 to i32
  %351 = shl i32 %350, 1
  %352 = trunc i32 %351 to i8
  %353 = zext i8 %352 to i32
  %354 = ashr i32 %353, 7
  %355 = sext i32 %354 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %355)
  call void @swap_conditional(i64* %24, i64* %22, i64 %355)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %355)
  call void @swap_conditional(i64* %36, i64* %34, i64 %355)
  %356 = zext i8 %352 to i32
  %357 = shl i32 %356, 1
  %358 = trunc i32 %357 to i8
  %359 = zext i8 %358 to i32
  %360 = ashr i32 %359, 7
  %361 = sext i32 %360 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %361)
  call void @swap_conditional(i64* %36, i64* %34, i64 %361)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %361)
  call void @swap_conditional(i64* %24, i64* %22, i64 %361)
  %362 = zext i8 %358 to i32
  %363 = shl i32 %362, 1
  %364 = trunc i32 %363 to i8
  %365 = zext i8 %364 to i32
  %366 = ashr i32 %365, 7
  %367 = sext i32 %366 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %367)
  call void @swap_conditional(i64* %24, i64* %22, i64 %367)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %367)
  call void @swap_conditional(i64* %36, i64* %34, i64 %367)
  %368 = zext i8 %364 to i32
  %369 = shl i32 %368, 1
  %370 = trunc i32 %369 to i8
  %371 = zext i8 %370 to i32
  %372 = ashr i32 %371, 7
  %373 = sext i32 %372 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %373)
  call void @swap_conditional(i64* %36, i64* %34, i64 %373)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %373)
  call void @swap_conditional(i64* %24, i64* %22, i64 %373)
  %374 = zext i8 %370 to i32
  %375 = getelementptr inbounds i8, i8* %2, i64 24
  %376 = load i8, i8* %375, align 1
  %377 = zext i8 %376 to i32
  %378 = ashr i32 %377, 7
  %379 = sext i32 %378 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %379)
  call void @swap_conditional(i64* %24, i64* %22, i64 %379)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %379)
  call void @swap_conditional(i64* %36, i64* %34, i64 %379)
  %380 = zext i8 %376 to i32
  %381 = shl i32 %380, 1
  %382 = trunc i32 %381 to i8
  %383 = zext i8 %382 to i32
  %384 = ashr i32 %383, 7
  %385 = sext i32 %384 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %385)
  call void @swap_conditional(i64* %36, i64* %34, i64 %385)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %385)
  call void @swap_conditional(i64* %24, i64* %22, i64 %385)
  %386 = zext i8 %382 to i32
  %387 = shl i32 %386, 1
  %388 = trunc i32 %387 to i8
  %389 = zext i8 %388 to i32
  %390 = ashr i32 %389, 7
  %391 = sext i32 %390 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %391)
  call void @swap_conditional(i64* %24, i64* %22, i64 %391)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %391)
  call void @swap_conditional(i64* %36, i64* %34, i64 %391)
  %392 = zext i8 %388 to i32
  %393 = shl i32 %392, 1
  %394 = trunc i32 %393 to i8
  %395 = zext i8 %394 to i32
  %396 = ashr i32 %395, 7
  %397 = sext i32 %396 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %397)
  call void @swap_conditional(i64* %36, i64* %34, i64 %397)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %397)
  call void @swap_conditional(i64* %24, i64* %22, i64 %397)
  %398 = zext i8 %394 to i32
  %399 = shl i32 %398, 1
  %400 = trunc i32 %399 to i8
  %401 = zext i8 %400 to i32
  %402 = ashr i32 %401, 7
  %403 = sext i32 %402 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %403)
  call void @swap_conditional(i64* %24, i64* %22, i64 %403)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %403)
  call void @swap_conditional(i64* %36, i64* %34, i64 %403)
  %404 = zext i8 %400 to i32
  %405 = shl i32 %404, 1
  %406 = trunc i32 %405 to i8
  %407 = zext i8 %406 to i32
  %408 = ashr i32 %407, 7
  %409 = sext i32 %408 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %409)
  call void @swap_conditional(i64* %36, i64* %34, i64 %409)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %409)
  call void @swap_conditional(i64* %24, i64* %22, i64 %409)
  %410 = zext i8 %406 to i32
  %411 = shl i32 %410, 1
  %412 = trunc i32 %411 to i8
  %413 = zext i8 %412 to i32
  %414 = ashr i32 %413, 7
  %415 = sext i32 %414 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %415)
  call void @swap_conditional(i64* %24, i64* %22, i64 %415)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %415)
  call void @swap_conditional(i64* %36, i64* %34, i64 %415)
  %416 = zext i8 %412 to i32
  %417 = shl i32 %416, 1
  %418 = trunc i32 %417 to i8
  %419 = zext i8 %418 to i32
  %420 = ashr i32 %419, 7
  %421 = sext i32 %420 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %421)
  call void @swap_conditional(i64* %36, i64* %34, i64 %421)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %421)
  call void @swap_conditional(i64* %24, i64* %22, i64 %421)
  %422 = zext i8 %418 to i32
  %423 = getelementptr inbounds i8, i8* %2, i64 23
  %424 = load i8, i8* %423, align 1
  %425 = zext i8 %424 to i32
  %426 = ashr i32 %425, 7
  %427 = sext i32 %426 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %427)
  call void @swap_conditional(i64* %24, i64* %22, i64 %427)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %427)
  call void @swap_conditional(i64* %36, i64* %34, i64 %427)
  %428 = zext i8 %424 to i32
  %429 = shl i32 %428, 1
  %430 = trunc i32 %429 to i8
  %431 = zext i8 %430 to i32
  %432 = ashr i32 %431, 7
  %433 = sext i32 %432 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %433)
  call void @swap_conditional(i64* %36, i64* %34, i64 %433)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %433)
  call void @swap_conditional(i64* %24, i64* %22, i64 %433)
  %434 = zext i8 %430 to i32
  %435 = shl i32 %434, 1
  %436 = trunc i32 %435 to i8
  %437 = zext i8 %436 to i32
  %438 = ashr i32 %437, 7
  %439 = sext i32 %438 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %439)
  call void @swap_conditional(i64* %24, i64* %22, i64 %439)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %439)
  call void @swap_conditional(i64* %36, i64* %34, i64 %439)
  %440 = zext i8 %436 to i32
  %441 = shl i32 %440, 1
  %442 = trunc i32 %441 to i8
  %443 = zext i8 %442 to i32
  %444 = ashr i32 %443, 7
  %445 = sext i32 %444 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %445)
  call void @swap_conditional(i64* %36, i64* %34, i64 %445)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %445)
  call void @swap_conditional(i64* %24, i64* %22, i64 %445)
  %446 = zext i8 %442 to i32
  %447 = shl i32 %446, 1
  %448 = trunc i32 %447 to i8
  %449 = zext i8 %448 to i32
  %450 = ashr i32 %449, 7
  %451 = sext i32 %450 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %451)
  call void @swap_conditional(i64* %24, i64* %22, i64 %451)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %451)
  call void @swap_conditional(i64* %36, i64* %34, i64 %451)
  %452 = zext i8 %448 to i32
  %453 = shl i32 %452, 1
  %454 = trunc i32 %453 to i8
  %455 = zext i8 %454 to i32
  %456 = ashr i32 %455, 7
  %457 = sext i32 %456 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %457)
  call void @swap_conditional(i64* %36, i64* %34, i64 %457)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %457)
  call void @swap_conditional(i64* %24, i64* %22, i64 %457)
  %458 = zext i8 %454 to i32
  %459 = shl i32 %458, 1
  %460 = trunc i32 %459 to i8
  %461 = zext i8 %460 to i32
  %462 = ashr i32 %461, 7
  %463 = sext i32 %462 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %463)
  call void @swap_conditional(i64* %24, i64* %22, i64 %463)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %463)
  call void @swap_conditional(i64* %36, i64* %34, i64 %463)
  %464 = zext i8 %460 to i32
  %465 = shl i32 %464, 1
  %466 = trunc i32 %465 to i8
  %467 = zext i8 %466 to i32
  %468 = ashr i32 %467, 7
  %469 = sext i32 %468 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %469)
  call void @swap_conditional(i64* %36, i64* %34, i64 %469)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %469)
  call void @swap_conditional(i64* %24, i64* %22, i64 %469)
  %470 = zext i8 %466 to i32
  %471 = getelementptr inbounds i8, i8* %2, i64 22
  %472 = load i8, i8* %471, align 1
  %473 = zext i8 %472 to i32
  %474 = ashr i32 %473, 7
  %475 = sext i32 %474 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %475)
  call void @swap_conditional(i64* %24, i64* %22, i64 %475)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %475)
  call void @swap_conditional(i64* %36, i64* %34, i64 %475)
  %476 = zext i8 %472 to i32
  %477 = shl i32 %476, 1
  %478 = trunc i32 %477 to i8
  %479 = zext i8 %478 to i32
  %480 = ashr i32 %479, 7
  %481 = sext i32 %480 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %481)
  call void @swap_conditional(i64* %36, i64* %34, i64 %481)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %481)
  call void @swap_conditional(i64* %24, i64* %22, i64 %481)
  %482 = zext i8 %478 to i32
  %483 = shl i32 %482, 1
  %484 = trunc i32 %483 to i8
  %485 = zext i8 %484 to i32
  %486 = ashr i32 %485, 7
  %487 = sext i32 %486 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %487)
  call void @swap_conditional(i64* %24, i64* %22, i64 %487)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %487)
  call void @swap_conditional(i64* %36, i64* %34, i64 %487)
  %488 = zext i8 %484 to i32
  %489 = shl i32 %488, 1
  %490 = trunc i32 %489 to i8
  %491 = zext i8 %490 to i32
  %492 = ashr i32 %491, 7
  %493 = sext i32 %492 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %493)
  call void @swap_conditional(i64* %36, i64* %34, i64 %493)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %493)
  call void @swap_conditional(i64* %24, i64* %22, i64 %493)
  %494 = zext i8 %490 to i32
  %495 = shl i32 %494, 1
  %496 = trunc i32 %495 to i8
  %497 = zext i8 %496 to i32
  %498 = ashr i32 %497, 7
  %499 = sext i32 %498 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %499)
  call void @swap_conditional(i64* %24, i64* %22, i64 %499)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %499)
  call void @swap_conditional(i64* %36, i64* %34, i64 %499)
  %500 = zext i8 %496 to i32
  %501 = shl i32 %500, 1
  %502 = trunc i32 %501 to i8
  %503 = zext i8 %502 to i32
  %504 = ashr i32 %503, 7
  %505 = sext i32 %504 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %505)
  call void @swap_conditional(i64* %36, i64* %34, i64 %505)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %505)
  call void @swap_conditional(i64* %24, i64* %22, i64 %505)
  %506 = zext i8 %502 to i32
  %507 = shl i32 %506, 1
  %508 = trunc i32 %507 to i8
  %509 = zext i8 %508 to i32
  %510 = ashr i32 %509, 7
  %511 = sext i32 %510 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %511)
  call void @swap_conditional(i64* %24, i64* %22, i64 %511)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %511)
  call void @swap_conditional(i64* %36, i64* %34, i64 %511)
  %512 = zext i8 %508 to i32
  %513 = shl i32 %512, 1
  %514 = trunc i32 %513 to i8
  %515 = zext i8 %514 to i32
  %516 = ashr i32 %515, 7
  %517 = sext i32 %516 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %517)
  call void @swap_conditional(i64* %36, i64* %34, i64 %517)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %517)
  call void @swap_conditional(i64* %24, i64* %22, i64 %517)
  %518 = zext i8 %514 to i32
  %519 = getelementptr inbounds i8, i8* %2, i64 21
  %520 = load i8, i8* %519, align 1
  %521 = zext i8 %520 to i32
  %522 = ashr i32 %521, 7
  %523 = sext i32 %522 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %523)
  call void @swap_conditional(i64* %24, i64* %22, i64 %523)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %523)
  call void @swap_conditional(i64* %36, i64* %34, i64 %523)
  %524 = zext i8 %520 to i32
  %525 = shl i32 %524, 1
  %526 = trunc i32 %525 to i8
  %527 = zext i8 %526 to i32
  %528 = ashr i32 %527, 7
  %529 = sext i32 %528 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %529)
  call void @swap_conditional(i64* %36, i64* %34, i64 %529)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %529)
  call void @swap_conditional(i64* %24, i64* %22, i64 %529)
  %530 = zext i8 %526 to i32
  %531 = shl i32 %530, 1
  %532 = trunc i32 %531 to i8
  %533 = zext i8 %532 to i32
  %534 = ashr i32 %533, 7
  %535 = sext i32 %534 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %535)
  call void @swap_conditional(i64* %24, i64* %22, i64 %535)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %535)
  call void @swap_conditional(i64* %36, i64* %34, i64 %535)
  %536 = zext i8 %532 to i32
  %537 = shl i32 %536, 1
  %538 = trunc i32 %537 to i8
  %539 = zext i8 %538 to i32
  %540 = ashr i32 %539, 7
  %541 = sext i32 %540 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %541)
  call void @swap_conditional(i64* %36, i64* %34, i64 %541)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %541)
  call void @swap_conditional(i64* %24, i64* %22, i64 %541)
  %542 = zext i8 %538 to i32
  %543 = shl i32 %542, 1
  %544 = trunc i32 %543 to i8
  %545 = zext i8 %544 to i32
  %546 = ashr i32 %545, 7
  %547 = sext i32 %546 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %547)
  call void @swap_conditional(i64* %24, i64* %22, i64 %547)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %547)
  call void @swap_conditional(i64* %36, i64* %34, i64 %547)
  %548 = zext i8 %544 to i32
  %549 = shl i32 %548, 1
  %550 = trunc i32 %549 to i8
  %551 = zext i8 %550 to i32
  %552 = ashr i32 %551, 7
  %553 = sext i32 %552 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %553)
  call void @swap_conditional(i64* %36, i64* %34, i64 %553)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %553)
  call void @swap_conditional(i64* %24, i64* %22, i64 %553)
  %554 = zext i8 %550 to i32
  %555 = shl i32 %554, 1
  %556 = trunc i32 %555 to i8
  %557 = zext i8 %556 to i32
  %558 = ashr i32 %557, 7
  %559 = sext i32 %558 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %559)
  call void @swap_conditional(i64* %24, i64* %22, i64 %559)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %559)
  call void @swap_conditional(i64* %36, i64* %34, i64 %559)
  %560 = zext i8 %556 to i32
  %561 = shl i32 %560, 1
  %562 = trunc i32 %561 to i8
  %563 = zext i8 %562 to i32
  %564 = ashr i32 %563, 7
  %565 = sext i32 %564 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %565)
  call void @swap_conditional(i64* %36, i64* %34, i64 %565)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %565)
  call void @swap_conditional(i64* %24, i64* %22, i64 %565)
  %566 = zext i8 %562 to i32
  %567 = getelementptr inbounds i8, i8* %2, i64 20
  %568 = load i8, i8* %567, align 1
  %569 = zext i8 %568 to i32
  %570 = ashr i32 %569, 7
  %571 = sext i32 %570 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %571)
  call void @swap_conditional(i64* %24, i64* %22, i64 %571)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %571)
  call void @swap_conditional(i64* %36, i64* %34, i64 %571)
  %572 = zext i8 %568 to i32
  %573 = shl i32 %572, 1
  %574 = trunc i32 %573 to i8
  %575 = zext i8 %574 to i32
  %576 = ashr i32 %575, 7
  %577 = sext i32 %576 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %577)
  call void @swap_conditional(i64* %36, i64* %34, i64 %577)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %577)
  call void @swap_conditional(i64* %24, i64* %22, i64 %577)
  %578 = zext i8 %574 to i32
  %579 = shl i32 %578, 1
  %580 = trunc i32 %579 to i8
  %581 = zext i8 %580 to i32
  %582 = ashr i32 %581, 7
  %583 = sext i32 %582 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %583)
  call void @swap_conditional(i64* %24, i64* %22, i64 %583)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %583)
  call void @swap_conditional(i64* %36, i64* %34, i64 %583)
  %584 = zext i8 %580 to i32
  %585 = shl i32 %584, 1
  %586 = trunc i32 %585 to i8
  %587 = zext i8 %586 to i32
  %588 = ashr i32 %587, 7
  %589 = sext i32 %588 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %589)
  call void @swap_conditional(i64* %36, i64* %34, i64 %589)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %589)
  call void @swap_conditional(i64* %24, i64* %22, i64 %589)
  %590 = zext i8 %586 to i32
  %591 = shl i32 %590, 1
  %592 = trunc i32 %591 to i8
  %593 = zext i8 %592 to i32
  %594 = ashr i32 %593, 7
  %595 = sext i32 %594 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %595)
  call void @swap_conditional(i64* %24, i64* %22, i64 %595)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %595)
  call void @swap_conditional(i64* %36, i64* %34, i64 %595)
  %596 = zext i8 %592 to i32
  %597 = shl i32 %596, 1
  %598 = trunc i32 %597 to i8
  %599 = zext i8 %598 to i32
  %600 = ashr i32 %599, 7
  %601 = sext i32 %600 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %601)
  call void @swap_conditional(i64* %36, i64* %34, i64 %601)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %601)
  call void @swap_conditional(i64* %24, i64* %22, i64 %601)
  %602 = zext i8 %598 to i32
  %603 = shl i32 %602, 1
  %604 = trunc i32 %603 to i8
  %605 = zext i8 %604 to i32
  %606 = ashr i32 %605, 7
  %607 = sext i32 %606 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %607)
  call void @swap_conditional(i64* %24, i64* %22, i64 %607)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %607)
  call void @swap_conditional(i64* %36, i64* %34, i64 %607)
  %608 = zext i8 %604 to i32
  %609 = shl i32 %608, 1
  %610 = trunc i32 %609 to i8
  %611 = zext i8 %610 to i32
  %612 = ashr i32 %611, 7
  %613 = sext i32 %612 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %613)
  call void @swap_conditional(i64* %36, i64* %34, i64 %613)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %613)
  call void @swap_conditional(i64* %24, i64* %22, i64 %613)
  %614 = zext i8 %610 to i32
  %615 = getelementptr inbounds i8, i8* %2, i64 19
  %616 = load i8, i8* %615, align 1
  %617 = zext i8 %616 to i32
  %618 = ashr i32 %617, 7
  %619 = sext i32 %618 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %619)
  call void @swap_conditional(i64* %24, i64* %22, i64 %619)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %619)
  call void @swap_conditional(i64* %36, i64* %34, i64 %619)
  %620 = zext i8 %616 to i32
  %621 = shl i32 %620, 1
  %622 = trunc i32 %621 to i8
  %623 = zext i8 %622 to i32
  %624 = ashr i32 %623, 7
  %625 = sext i32 %624 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %625)
  call void @swap_conditional(i64* %36, i64* %34, i64 %625)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %625)
  call void @swap_conditional(i64* %24, i64* %22, i64 %625)
  %626 = zext i8 %622 to i32
  %627 = shl i32 %626, 1
  %628 = trunc i32 %627 to i8
  %629 = zext i8 %628 to i32
  %630 = ashr i32 %629, 7
  %631 = sext i32 %630 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %631)
  call void @swap_conditional(i64* %24, i64* %22, i64 %631)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %631)
  call void @swap_conditional(i64* %36, i64* %34, i64 %631)
  %632 = zext i8 %628 to i32
  %633 = shl i32 %632, 1
  %634 = trunc i32 %633 to i8
  %635 = zext i8 %634 to i32
  %636 = ashr i32 %635, 7
  %637 = sext i32 %636 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %637)
  call void @swap_conditional(i64* %36, i64* %34, i64 %637)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %637)
  call void @swap_conditional(i64* %24, i64* %22, i64 %637)
  %638 = zext i8 %634 to i32
  %639 = shl i32 %638, 1
  %640 = trunc i32 %639 to i8
  %641 = zext i8 %640 to i32
  %642 = ashr i32 %641, 7
  %643 = sext i32 %642 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %643)
  call void @swap_conditional(i64* %24, i64* %22, i64 %643)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %643)
  call void @swap_conditional(i64* %36, i64* %34, i64 %643)
  %644 = zext i8 %640 to i32
  %645 = shl i32 %644, 1
  %646 = trunc i32 %645 to i8
  %647 = zext i8 %646 to i32
  %648 = ashr i32 %647, 7
  %649 = sext i32 %648 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %649)
  call void @swap_conditional(i64* %36, i64* %34, i64 %649)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %649)
  call void @swap_conditional(i64* %24, i64* %22, i64 %649)
  %650 = zext i8 %646 to i32
  %651 = shl i32 %650, 1
  %652 = trunc i32 %651 to i8
  %653 = zext i8 %652 to i32
  %654 = ashr i32 %653, 7
  %655 = sext i32 %654 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %655)
  call void @swap_conditional(i64* %24, i64* %22, i64 %655)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %655)
  call void @swap_conditional(i64* %36, i64* %34, i64 %655)
  %656 = zext i8 %652 to i32
  %657 = shl i32 %656, 1
  %658 = trunc i32 %657 to i8
  %659 = zext i8 %658 to i32
  %660 = ashr i32 %659, 7
  %661 = sext i32 %660 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %661)
  call void @swap_conditional(i64* %36, i64* %34, i64 %661)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %661)
  call void @swap_conditional(i64* %24, i64* %22, i64 %661)
  %662 = zext i8 %658 to i32
  %663 = getelementptr inbounds i8, i8* %2, i64 18
  %664 = load i8, i8* %663, align 1
  %665 = zext i8 %664 to i32
  %666 = ashr i32 %665, 7
  %667 = sext i32 %666 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %667)
  call void @swap_conditional(i64* %24, i64* %22, i64 %667)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %667)
  call void @swap_conditional(i64* %36, i64* %34, i64 %667)
  %668 = zext i8 %664 to i32
  %669 = shl i32 %668, 1
  %670 = trunc i32 %669 to i8
  %671 = zext i8 %670 to i32
  %672 = ashr i32 %671, 7
  %673 = sext i32 %672 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %673)
  call void @swap_conditional(i64* %36, i64* %34, i64 %673)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %673)
  call void @swap_conditional(i64* %24, i64* %22, i64 %673)
  %674 = zext i8 %670 to i32
  %675 = shl i32 %674, 1
  %676 = trunc i32 %675 to i8
  %677 = zext i8 %676 to i32
  %678 = ashr i32 %677, 7
  %679 = sext i32 %678 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %679)
  call void @swap_conditional(i64* %24, i64* %22, i64 %679)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %679)
  call void @swap_conditional(i64* %36, i64* %34, i64 %679)
  %680 = zext i8 %676 to i32
  %681 = shl i32 %680, 1
  %682 = trunc i32 %681 to i8
  %683 = zext i8 %682 to i32
  %684 = ashr i32 %683, 7
  %685 = sext i32 %684 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %685)
  call void @swap_conditional(i64* %36, i64* %34, i64 %685)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %685)
  call void @swap_conditional(i64* %24, i64* %22, i64 %685)
  %686 = zext i8 %682 to i32
  %687 = shl i32 %686, 1
  %688 = trunc i32 %687 to i8
  %689 = zext i8 %688 to i32
  %690 = ashr i32 %689, 7
  %691 = sext i32 %690 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %691)
  call void @swap_conditional(i64* %24, i64* %22, i64 %691)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %691)
  call void @swap_conditional(i64* %36, i64* %34, i64 %691)
  %692 = zext i8 %688 to i32
  %693 = shl i32 %692, 1
  %694 = trunc i32 %693 to i8
  %695 = zext i8 %694 to i32
  %696 = ashr i32 %695, 7
  %697 = sext i32 %696 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %697)
  call void @swap_conditional(i64* %36, i64* %34, i64 %697)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %697)
  call void @swap_conditional(i64* %24, i64* %22, i64 %697)
  %698 = zext i8 %694 to i32
  %699 = shl i32 %698, 1
  %700 = trunc i32 %699 to i8
  %701 = zext i8 %700 to i32
  %702 = ashr i32 %701, 7
  %703 = sext i32 %702 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %703)
  call void @swap_conditional(i64* %24, i64* %22, i64 %703)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %703)
  call void @swap_conditional(i64* %36, i64* %34, i64 %703)
  %704 = zext i8 %700 to i32
  %705 = shl i32 %704, 1
  %706 = trunc i32 %705 to i8
  %707 = zext i8 %706 to i32
  %708 = ashr i32 %707, 7
  %709 = sext i32 %708 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %709)
  call void @swap_conditional(i64* %36, i64* %34, i64 %709)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %709)
  call void @swap_conditional(i64* %24, i64* %22, i64 %709)
  %710 = zext i8 %706 to i32
  %711 = getelementptr inbounds i8, i8* %2, i64 17
  %712 = load i8, i8* %711, align 1
  %713 = zext i8 %712 to i32
  %714 = ashr i32 %713, 7
  %715 = sext i32 %714 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %715)
  call void @swap_conditional(i64* %24, i64* %22, i64 %715)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %715)
  call void @swap_conditional(i64* %36, i64* %34, i64 %715)
  %716 = zext i8 %712 to i32
  %717 = shl i32 %716, 1
  %718 = trunc i32 %717 to i8
  %719 = zext i8 %718 to i32
  %720 = ashr i32 %719, 7
  %721 = sext i32 %720 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %721)
  call void @swap_conditional(i64* %36, i64* %34, i64 %721)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %721)
  call void @swap_conditional(i64* %24, i64* %22, i64 %721)
  %722 = zext i8 %718 to i32
  %723 = shl i32 %722, 1
  %724 = trunc i32 %723 to i8
  %725 = zext i8 %724 to i32
  %726 = ashr i32 %725, 7
  %727 = sext i32 %726 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %727)
  call void @swap_conditional(i64* %24, i64* %22, i64 %727)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %727)
  call void @swap_conditional(i64* %36, i64* %34, i64 %727)
  %728 = zext i8 %724 to i32
  %729 = shl i32 %728, 1
  %730 = trunc i32 %729 to i8
  %731 = zext i8 %730 to i32
  %732 = ashr i32 %731, 7
  %733 = sext i32 %732 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %733)
  call void @swap_conditional(i64* %36, i64* %34, i64 %733)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %733)
  call void @swap_conditional(i64* %24, i64* %22, i64 %733)
  %734 = zext i8 %730 to i32
  %735 = shl i32 %734, 1
  %736 = trunc i32 %735 to i8
  %737 = zext i8 %736 to i32
  %738 = ashr i32 %737, 7
  %739 = sext i32 %738 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %739)
  call void @swap_conditional(i64* %24, i64* %22, i64 %739)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %739)
  call void @swap_conditional(i64* %36, i64* %34, i64 %739)
  %740 = zext i8 %736 to i32
  %741 = shl i32 %740, 1
  %742 = trunc i32 %741 to i8
  %743 = zext i8 %742 to i32
  %744 = ashr i32 %743, 7
  %745 = sext i32 %744 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %745)
  call void @swap_conditional(i64* %36, i64* %34, i64 %745)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %745)
  call void @swap_conditional(i64* %24, i64* %22, i64 %745)
  %746 = zext i8 %742 to i32
  %747 = shl i32 %746, 1
  %748 = trunc i32 %747 to i8
  %749 = zext i8 %748 to i32
  %750 = ashr i32 %749, 7
  %751 = sext i32 %750 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %751)
  call void @swap_conditional(i64* %24, i64* %22, i64 %751)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %751)
  call void @swap_conditional(i64* %36, i64* %34, i64 %751)
  %752 = zext i8 %748 to i32
  %753 = shl i32 %752, 1
  %754 = trunc i32 %753 to i8
  %755 = zext i8 %754 to i32
  %756 = ashr i32 %755, 7
  %757 = sext i32 %756 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %757)
  call void @swap_conditional(i64* %36, i64* %34, i64 %757)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %757)
  call void @swap_conditional(i64* %24, i64* %22, i64 %757)
  %758 = zext i8 %754 to i32
  %759 = getelementptr inbounds i8, i8* %2, i64 16
  %760 = load i8, i8* %759, align 1
  %761 = zext i8 %760 to i32
  %762 = ashr i32 %761, 7
  %763 = sext i32 %762 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %763)
  call void @swap_conditional(i64* %24, i64* %22, i64 %763)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %763)
  call void @swap_conditional(i64* %36, i64* %34, i64 %763)
  %764 = zext i8 %760 to i32
  %765 = shl i32 %764, 1
  %766 = trunc i32 %765 to i8
  %767 = zext i8 %766 to i32
  %768 = ashr i32 %767, 7
  %769 = sext i32 %768 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %769)
  call void @swap_conditional(i64* %36, i64* %34, i64 %769)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %769)
  call void @swap_conditional(i64* %24, i64* %22, i64 %769)
  %770 = zext i8 %766 to i32
  %771 = shl i32 %770, 1
  %772 = trunc i32 %771 to i8
  %773 = zext i8 %772 to i32
  %774 = ashr i32 %773, 7
  %775 = sext i32 %774 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %775)
  call void @swap_conditional(i64* %24, i64* %22, i64 %775)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %775)
  call void @swap_conditional(i64* %36, i64* %34, i64 %775)
  %776 = zext i8 %772 to i32
  %777 = shl i32 %776, 1
  %778 = trunc i32 %777 to i8
  %779 = zext i8 %778 to i32
  %780 = ashr i32 %779, 7
  %781 = sext i32 %780 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %781)
  call void @swap_conditional(i64* %36, i64* %34, i64 %781)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %781)
  call void @swap_conditional(i64* %24, i64* %22, i64 %781)
  %782 = zext i8 %778 to i32
  %783 = shl i32 %782, 1
  %784 = trunc i32 %783 to i8
  %785 = zext i8 %784 to i32
  %786 = ashr i32 %785, 7
  %787 = sext i32 %786 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %787)
  call void @swap_conditional(i64* %24, i64* %22, i64 %787)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %787)
  call void @swap_conditional(i64* %36, i64* %34, i64 %787)
  %788 = zext i8 %784 to i32
  %789 = shl i32 %788, 1
  %790 = trunc i32 %789 to i8
  %791 = zext i8 %790 to i32
  %792 = ashr i32 %791, 7
  %793 = sext i32 %792 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %793)
  call void @swap_conditional(i64* %36, i64* %34, i64 %793)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %793)
  call void @swap_conditional(i64* %24, i64* %22, i64 %793)
  %794 = zext i8 %790 to i32
  %795 = shl i32 %794, 1
  %796 = trunc i32 %795 to i8
  %797 = zext i8 %796 to i32
  %798 = ashr i32 %797, 7
  %799 = sext i32 %798 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %799)
  call void @swap_conditional(i64* %24, i64* %22, i64 %799)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %799)
  call void @swap_conditional(i64* %36, i64* %34, i64 %799)
  %800 = zext i8 %796 to i32
  %801 = shl i32 %800, 1
  %802 = trunc i32 %801 to i8
  %803 = zext i8 %802 to i32
  %804 = ashr i32 %803, 7
  %805 = sext i32 %804 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %805)
  call void @swap_conditional(i64* %36, i64* %34, i64 %805)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %805)
  call void @swap_conditional(i64* %24, i64* %22, i64 %805)
  %806 = zext i8 %802 to i32
  %807 = getelementptr inbounds i8, i8* %2, i64 15
  %808 = load i8, i8* %807, align 1
  %809 = zext i8 %808 to i32
  %810 = ashr i32 %809, 7
  %811 = sext i32 %810 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %811)
  call void @swap_conditional(i64* %24, i64* %22, i64 %811)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %811)
  call void @swap_conditional(i64* %36, i64* %34, i64 %811)
  %812 = zext i8 %808 to i32
  %813 = shl i32 %812, 1
  %814 = trunc i32 %813 to i8
  %815 = zext i8 %814 to i32
  %816 = ashr i32 %815, 7
  %817 = sext i32 %816 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %817)
  call void @swap_conditional(i64* %36, i64* %34, i64 %817)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %817)
  call void @swap_conditional(i64* %24, i64* %22, i64 %817)
  %818 = zext i8 %814 to i32
  %819 = shl i32 %818, 1
  %820 = trunc i32 %819 to i8
  %821 = zext i8 %820 to i32
  %822 = ashr i32 %821, 7
  %823 = sext i32 %822 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %823)
  call void @swap_conditional(i64* %24, i64* %22, i64 %823)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %823)
  call void @swap_conditional(i64* %36, i64* %34, i64 %823)
  %824 = zext i8 %820 to i32
  %825 = shl i32 %824, 1
  %826 = trunc i32 %825 to i8
  %827 = zext i8 %826 to i32
  %828 = ashr i32 %827, 7
  %829 = sext i32 %828 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %829)
  call void @swap_conditional(i64* %36, i64* %34, i64 %829)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %829)
  call void @swap_conditional(i64* %24, i64* %22, i64 %829)
  %830 = zext i8 %826 to i32
  %831 = shl i32 %830, 1
  %832 = trunc i32 %831 to i8
  %833 = zext i8 %832 to i32
  %834 = ashr i32 %833, 7
  %835 = sext i32 %834 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %835)
  call void @swap_conditional(i64* %24, i64* %22, i64 %835)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %835)
  call void @swap_conditional(i64* %36, i64* %34, i64 %835)
  %836 = zext i8 %832 to i32
  %837 = shl i32 %836, 1
  %838 = trunc i32 %837 to i8
  %839 = zext i8 %838 to i32
  %840 = ashr i32 %839, 7
  %841 = sext i32 %840 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %841)
  call void @swap_conditional(i64* %36, i64* %34, i64 %841)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %841)
  call void @swap_conditional(i64* %24, i64* %22, i64 %841)
  %842 = zext i8 %838 to i32
  %843 = shl i32 %842, 1
  %844 = trunc i32 %843 to i8
  %845 = zext i8 %844 to i32
  %846 = ashr i32 %845, 7
  %847 = sext i32 %846 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %847)
  call void @swap_conditional(i64* %24, i64* %22, i64 %847)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %847)
  call void @swap_conditional(i64* %36, i64* %34, i64 %847)
  %848 = zext i8 %844 to i32
  %849 = shl i32 %848, 1
  %850 = trunc i32 %849 to i8
  %851 = zext i8 %850 to i32
  %852 = ashr i32 %851, 7
  %853 = sext i32 %852 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %853)
  call void @swap_conditional(i64* %36, i64* %34, i64 %853)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %853)
  call void @swap_conditional(i64* %24, i64* %22, i64 %853)
  %854 = zext i8 %850 to i32
  %855 = getelementptr inbounds i8, i8* %2, i64 14
  %856 = load i8, i8* %855, align 1
  %857 = zext i8 %856 to i32
  %858 = ashr i32 %857, 7
  %859 = sext i32 %858 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %859)
  call void @swap_conditional(i64* %24, i64* %22, i64 %859)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %859)
  call void @swap_conditional(i64* %36, i64* %34, i64 %859)
  %860 = zext i8 %856 to i32
  %861 = shl i32 %860, 1
  %862 = trunc i32 %861 to i8
  %863 = zext i8 %862 to i32
  %864 = ashr i32 %863, 7
  %865 = sext i32 %864 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %865)
  call void @swap_conditional(i64* %36, i64* %34, i64 %865)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %865)
  call void @swap_conditional(i64* %24, i64* %22, i64 %865)
  %866 = zext i8 %862 to i32
  %867 = shl i32 %866, 1
  %868 = trunc i32 %867 to i8
  %869 = zext i8 %868 to i32
  %870 = ashr i32 %869, 7
  %871 = sext i32 %870 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %871)
  call void @swap_conditional(i64* %24, i64* %22, i64 %871)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %871)
  call void @swap_conditional(i64* %36, i64* %34, i64 %871)
  %872 = zext i8 %868 to i32
  %873 = shl i32 %872, 1
  %874 = trunc i32 %873 to i8
  %875 = zext i8 %874 to i32
  %876 = ashr i32 %875, 7
  %877 = sext i32 %876 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %877)
  call void @swap_conditional(i64* %36, i64* %34, i64 %877)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %877)
  call void @swap_conditional(i64* %24, i64* %22, i64 %877)
  %878 = zext i8 %874 to i32
  %879 = shl i32 %878, 1
  %880 = trunc i32 %879 to i8
  %881 = zext i8 %880 to i32
  %882 = ashr i32 %881, 7
  %883 = sext i32 %882 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %883)
  call void @swap_conditional(i64* %24, i64* %22, i64 %883)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %883)
  call void @swap_conditional(i64* %36, i64* %34, i64 %883)
  %884 = zext i8 %880 to i32
  %885 = shl i32 %884, 1
  %886 = trunc i32 %885 to i8
  %887 = zext i8 %886 to i32
  %888 = ashr i32 %887, 7
  %889 = sext i32 %888 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %889)
  call void @swap_conditional(i64* %36, i64* %34, i64 %889)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %889)
  call void @swap_conditional(i64* %24, i64* %22, i64 %889)
  %890 = zext i8 %886 to i32
  %891 = shl i32 %890, 1
  %892 = trunc i32 %891 to i8
  %893 = zext i8 %892 to i32
  %894 = ashr i32 %893, 7
  %895 = sext i32 %894 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %895)
  call void @swap_conditional(i64* %24, i64* %22, i64 %895)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %895)
  call void @swap_conditional(i64* %36, i64* %34, i64 %895)
  %896 = zext i8 %892 to i32
  %897 = shl i32 %896, 1
  %898 = trunc i32 %897 to i8
  %899 = zext i8 %898 to i32
  %900 = ashr i32 %899, 7
  %901 = sext i32 %900 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %901)
  call void @swap_conditional(i64* %36, i64* %34, i64 %901)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %901)
  call void @swap_conditional(i64* %24, i64* %22, i64 %901)
  %902 = zext i8 %898 to i32
  %903 = getelementptr inbounds i8, i8* %2, i64 13
  %904 = load i8, i8* %903, align 1
  %905 = zext i8 %904 to i32
  %906 = ashr i32 %905, 7
  %907 = sext i32 %906 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %907)
  call void @swap_conditional(i64* %24, i64* %22, i64 %907)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %907)
  call void @swap_conditional(i64* %36, i64* %34, i64 %907)
  %908 = zext i8 %904 to i32
  %909 = shl i32 %908, 1
  %910 = trunc i32 %909 to i8
  %911 = zext i8 %910 to i32
  %912 = ashr i32 %911, 7
  %913 = sext i32 %912 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %913)
  call void @swap_conditional(i64* %36, i64* %34, i64 %913)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %913)
  call void @swap_conditional(i64* %24, i64* %22, i64 %913)
  %914 = zext i8 %910 to i32
  %915 = shl i32 %914, 1
  %916 = trunc i32 %915 to i8
  %917 = zext i8 %916 to i32
  %918 = ashr i32 %917, 7
  %919 = sext i32 %918 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %919)
  call void @swap_conditional(i64* %24, i64* %22, i64 %919)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %919)
  call void @swap_conditional(i64* %36, i64* %34, i64 %919)
  %920 = zext i8 %916 to i32
  %921 = shl i32 %920, 1
  %922 = trunc i32 %921 to i8
  %923 = zext i8 %922 to i32
  %924 = ashr i32 %923, 7
  %925 = sext i32 %924 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %925)
  call void @swap_conditional(i64* %36, i64* %34, i64 %925)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %925)
  call void @swap_conditional(i64* %24, i64* %22, i64 %925)
  %926 = zext i8 %922 to i32
  %927 = shl i32 %926, 1
  %928 = trunc i32 %927 to i8
  %929 = zext i8 %928 to i32
  %930 = ashr i32 %929, 7
  %931 = sext i32 %930 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %931)
  call void @swap_conditional(i64* %24, i64* %22, i64 %931)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %931)
  call void @swap_conditional(i64* %36, i64* %34, i64 %931)
  %932 = zext i8 %928 to i32
  %933 = shl i32 %932, 1
  %934 = trunc i32 %933 to i8
  %935 = zext i8 %934 to i32
  %936 = ashr i32 %935, 7
  %937 = sext i32 %936 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %937)
  call void @swap_conditional(i64* %36, i64* %34, i64 %937)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %937)
  call void @swap_conditional(i64* %24, i64* %22, i64 %937)
  %938 = zext i8 %934 to i32
  %939 = shl i32 %938, 1
  %940 = trunc i32 %939 to i8
  %941 = zext i8 %940 to i32
  %942 = ashr i32 %941, 7
  %943 = sext i32 %942 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %943)
  call void @swap_conditional(i64* %24, i64* %22, i64 %943)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %943)
  call void @swap_conditional(i64* %36, i64* %34, i64 %943)
  %944 = zext i8 %940 to i32
  %945 = shl i32 %944, 1
  %946 = trunc i32 %945 to i8
  %947 = zext i8 %946 to i32
  %948 = ashr i32 %947, 7
  %949 = sext i32 %948 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %949)
  call void @swap_conditional(i64* %36, i64* %34, i64 %949)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %949)
  call void @swap_conditional(i64* %24, i64* %22, i64 %949)
  %950 = zext i8 %946 to i32
  %951 = getelementptr inbounds i8, i8* %2, i64 12
  %952 = load i8, i8* %951, align 1
  %953 = zext i8 %952 to i32
  %954 = ashr i32 %953, 7
  %955 = sext i32 %954 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %955)
  call void @swap_conditional(i64* %24, i64* %22, i64 %955)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %955)
  call void @swap_conditional(i64* %36, i64* %34, i64 %955)
  %956 = zext i8 %952 to i32
  %957 = shl i32 %956, 1
  %958 = trunc i32 %957 to i8
  %959 = zext i8 %958 to i32
  %960 = ashr i32 %959, 7
  %961 = sext i32 %960 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %961)
  call void @swap_conditional(i64* %36, i64* %34, i64 %961)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %961)
  call void @swap_conditional(i64* %24, i64* %22, i64 %961)
  %962 = zext i8 %958 to i32
  %963 = shl i32 %962, 1
  %964 = trunc i32 %963 to i8
  %965 = zext i8 %964 to i32
  %966 = ashr i32 %965, 7
  %967 = sext i32 %966 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %967)
  call void @swap_conditional(i64* %24, i64* %22, i64 %967)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %967)
  call void @swap_conditional(i64* %36, i64* %34, i64 %967)
  %968 = zext i8 %964 to i32
  %969 = shl i32 %968, 1
  %970 = trunc i32 %969 to i8
  %971 = zext i8 %970 to i32
  %972 = ashr i32 %971, 7
  %973 = sext i32 %972 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %973)
  call void @swap_conditional(i64* %36, i64* %34, i64 %973)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %973)
  call void @swap_conditional(i64* %24, i64* %22, i64 %973)
  %974 = zext i8 %970 to i32
  %975 = shl i32 %974, 1
  %976 = trunc i32 %975 to i8
  %977 = zext i8 %976 to i32
  %978 = ashr i32 %977, 7
  %979 = sext i32 %978 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %979)
  call void @swap_conditional(i64* %24, i64* %22, i64 %979)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %979)
  call void @swap_conditional(i64* %36, i64* %34, i64 %979)
  %980 = zext i8 %976 to i32
  %981 = shl i32 %980, 1
  %982 = trunc i32 %981 to i8
  %983 = zext i8 %982 to i32
  %984 = ashr i32 %983, 7
  %985 = sext i32 %984 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %985)
  call void @swap_conditional(i64* %36, i64* %34, i64 %985)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %985)
  call void @swap_conditional(i64* %24, i64* %22, i64 %985)
  %986 = zext i8 %982 to i32
  %987 = shl i32 %986, 1
  %988 = trunc i32 %987 to i8
  %989 = zext i8 %988 to i32
  %990 = ashr i32 %989, 7
  %991 = sext i32 %990 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %991)
  call void @swap_conditional(i64* %24, i64* %22, i64 %991)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %991)
  call void @swap_conditional(i64* %36, i64* %34, i64 %991)
  %992 = zext i8 %988 to i32
  %993 = shl i32 %992, 1
  %994 = trunc i32 %993 to i8
  %995 = zext i8 %994 to i32
  %996 = ashr i32 %995, 7
  %997 = sext i32 %996 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %997)
  call void @swap_conditional(i64* %36, i64* %34, i64 %997)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %997)
  call void @swap_conditional(i64* %24, i64* %22, i64 %997)
  %998 = zext i8 %994 to i32
  %999 = getelementptr inbounds i8, i8* %2, i64 11
  %1000 = load i8, i8* %999, align 1
  %1001 = zext i8 %1000 to i32
  %1002 = ashr i32 %1001, 7
  %1003 = sext i32 %1002 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1003)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1003)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1003)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1003)
  %1004 = zext i8 %1000 to i32
  %1005 = shl i32 %1004, 1
  %1006 = trunc i32 %1005 to i8
  %1007 = zext i8 %1006 to i32
  %1008 = ashr i32 %1007, 7
  %1009 = sext i32 %1008 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1009)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1009)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1009)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1009)
  %1010 = zext i8 %1006 to i32
  %1011 = shl i32 %1010, 1
  %1012 = trunc i32 %1011 to i8
  %1013 = zext i8 %1012 to i32
  %1014 = ashr i32 %1013, 7
  %1015 = sext i32 %1014 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1015)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1015)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1015)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1015)
  %1016 = zext i8 %1012 to i32
  %1017 = shl i32 %1016, 1
  %1018 = trunc i32 %1017 to i8
  %1019 = zext i8 %1018 to i32
  %1020 = ashr i32 %1019, 7
  %1021 = sext i32 %1020 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1021)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1021)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1021)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1021)
  %1022 = zext i8 %1018 to i32
  %1023 = shl i32 %1022, 1
  %1024 = trunc i32 %1023 to i8
  %1025 = zext i8 %1024 to i32
  %1026 = ashr i32 %1025, 7
  %1027 = sext i32 %1026 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1027)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1027)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1027)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1027)
  %1028 = zext i8 %1024 to i32
  %1029 = shl i32 %1028, 1
  %1030 = trunc i32 %1029 to i8
  %1031 = zext i8 %1030 to i32
  %1032 = ashr i32 %1031, 7
  %1033 = sext i32 %1032 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1033)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1033)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1033)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1033)
  %1034 = zext i8 %1030 to i32
  %1035 = shl i32 %1034, 1
  %1036 = trunc i32 %1035 to i8
  %1037 = zext i8 %1036 to i32
  %1038 = ashr i32 %1037, 7
  %1039 = sext i32 %1038 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1039)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1039)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1039)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1039)
  %1040 = zext i8 %1036 to i32
  %1041 = shl i32 %1040, 1
  %1042 = trunc i32 %1041 to i8
  %1043 = zext i8 %1042 to i32
  %1044 = ashr i32 %1043, 7
  %1045 = sext i32 %1044 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1045)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1045)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1045)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1045)
  %1046 = zext i8 %1042 to i32
  %1047 = getelementptr inbounds i8, i8* %2, i64 10
  %1048 = load i8, i8* %1047, align 1
  %1049 = zext i8 %1048 to i32
  %1050 = ashr i32 %1049, 7
  %1051 = sext i32 %1050 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1051)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1051)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1051)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1051)
  %1052 = zext i8 %1048 to i32
  %1053 = shl i32 %1052, 1
  %1054 = trunc i32 %1053 to i8
  %1055 = zext i8 %1054 to i32
  %1056 = ashr i32 %1055, 7
  %1057 = sext i32 %1056 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1057)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1057)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1057)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1057)
  %1058 = zext i8 %1054 to i32
  %1059 = shl i32 %1058, 1
  %1060 = trunc i32 %1059 to i8
  %1061 = zext i8 %1060 to i32
  %1062 = ashr i32 %1061, 7
  %1063 = sext i32 %1062 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1063)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1063)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1063)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1063)
  %1064 = zext i8 %1060 to i32
  %1065 = shl i32 %1064, 1
  %1066 = trunc i32 %1065 to i8
  %1067 = zext i8 %1066 to i32
  %1068 = ashr i32 %1067, 7
  %1069 = sext i32 %1068 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1069)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1069)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1069)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1069)
  %1070 = zext i8 %1066 to i32
  %1071 = shl i32 %1070, 1
  %1072 = trunc i32 %1071 to i8
  %1073 = zext i8 %1072 to i32
  %1074 = ashr i32 %1073, 7
  %1075 = sext i32 %1074 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1075)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1075)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1075)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1075)
  %1076 = zext i8 %1072 to i32
  %1077 = shl i32 %1076, 1
  %1078 = trunc i32 %1077 to i8
  %1079 = zext i8 %1078 to i32
  %1080 = ashr i32 %1079, 7
  %1081 = sext i32 %1080 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1081)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1081)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1081)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1081)
  %1082 = zext i8 %1078 to i32
  %1083 = shl i32 %1082, 1
  %1084 = trunc i32 %1083 to i8
  %1085 = zext i8 %1084 to i32
  %1086 = ashr i32 %1085, 7
  %1087 = sext i32 %1086 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1087)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1087)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1087)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1087)
  %1088 = zext i8 %1084 to i32
  %1089 = shl i32 %1088, 1
  %1090 = trunc i32 %1089 to i8
  %1091 = zext i8 %1090 to i32
  %1092 = ashr i32 %1091, 7
  %1093 = sext i32 %1092 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1093)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1093)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1093)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1093)
  %1094 = zext i8 %1090 to i32
  %1095 = getelementptr inbounds i8, i8* %2, i64 9
  %1096 = load i8, i8* %1095, align 1
  %1097 = zext i8 %1096 to i32
  %1098 = ashr i32 %1097, 7
  %1099 = sext i32 %1098 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1099)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1099)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1099)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1099)
  %1100 = zext i8 %1096 to i32
  %1101 = shl i32 %1100, 1
  %1102 = trunc i32 %1101 to i8
  %1103 = zext i8 %1102 to i32
  %1104 = ashr i32 %1103, 7
  %1105 = sext i32 %1104 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1105)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1105)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1105)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1105)
  %1106 = zext i8 %1102 to i32
  %1107 = shl i32 %1106, 1
  %1108 = trunc i32 %1107 to i8
  %1109 = zext i8 %1108 to i32
  %1110 = ashr i32 %1109, 7
  %1111 = sext i32 %1110 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1111)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1111)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1111)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1111)
  %1112 = zext i8 %1108 to i32
  %1113 = shl i32 %1112, 1
  %1114 = trunc i32 %1113 to i8
  %1115 = zext i8 %1114 to i32
  %1116 = ashr i32 %1115, 7
  %1117 = sext i32 %1116 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1117)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1117)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1117)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1117)
  %1118 = zext i8 %1114 to i32
  %1119 = shl i32 %1118, 1
  %1120 = trunc i32 %1119 to i8
  %1121 = zext i8 %1120 to i32
  %1122 = ashr i32 %1121, 7
  %1123 = sext i32 %1122 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1123)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1123)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1123)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1123)
  %1124 = zext i8 %1120 to i32
  %1125 = shl i32 %1124, 1
  %1126 = trunc i32 %1125 to i8
  %1127 = zext i8 %1126 to i32
  %1128 = ashr i32 %1127, 7
  %1129 = sext i32 %1128 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1129)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1129)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1129)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1129)
  %1130 = zext i8 %1126 to i32
  %1131 = shl i32 %1130, 1
  %1132 = trunc i32 %1131 to i8
  %1133 = zext i8 %1132 to i32
  %1134 = ashr i32 %1133, 7
  %1135 = sext i32 %1134 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1135)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1135)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1135)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1135)
  %1136 = zext i8 %1132 to i32
  %1137 = shl i32 %1136, 1
  %1138 = trunc i32 %1137 to i8
  %1139 = zext i8 %1138 to i32
  %1140 = ashr i32 %1139, 7
  %1141 = sext i32 %1140 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1141)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1141)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1141)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1141)
  %1142 = zext i8 %1138 to i32
  %1143 = getelementptr inbounds i8, i8* %2, i64 8
  %1144 = load i8, i8* %1143, align 1
  %1145 = zext i8 %1144 to i32
  %1146 = ashr i32 %1145, 7
  %1147 = sext i32 %1146 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1147)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1147)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1147)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1147)
  %1148 = zext i8 %1144 to i32
  %1149 = shl i32 %1148, 1
  %1150 = trunc i32 %1149 to i8
  %1151 = zext i8 %1150 to i32
  %1152 = ashr i32 %1151, 7
  %1153 = sext i32 %1152 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1153)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1153)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1153)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1153)
  %1154 = zext i8 %1150 to i32
  %1155 = shl i32 %1154, 1
  %1156 = trunc i32 %1155 to i8
  %1157 = zext i8 %1156 to i32
  %1158 = ashr i32 %1157, 7
  %1159 = sext i32 %1158 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1159)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1159)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1159)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1159)
  %1160 = zext i8 %1156 to i32
  %1161 = shl i32 %1160, 1
  %1162 = trunc i32 %1161 to i8
  %1163 = zext i8 %1162 to i32
  %1164 = ashr i32 %1163, 7
  %1165 = sext i32 %1164 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1165)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1165)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1165)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1165)
  %1166 = zext i8 %1162 to i32
  %1167 = shl i32 %1166, 1
  %1168 = trunc i32 %1167 to i8
  %1169 = zext i8 %1168 to i32
  %1170 = ashr i32 %1169, 7
  %1171 = sext i32 %1170 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1171)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1171)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1171)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1171)
  %1172 = zext i8 %1168 to i32
  %1173 = shl i32 %1172, 1
  %1174 = trunc i32 %1173 to i8
  %1175 = zext i8 %1174 to i32
  %1176 = ashr i32 %1175, 7
  %1177 = sext i32 %1176 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1177)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1177)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1177)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1177)
  %1178 = zext i8 %1174 to i32
  %1179 = shl i32 %1178, 1
  %1180 = trunc i32 %1179 to i8
  %1181 = zext i8 %1180 to i32
  %1182 = ashr i32 %1181, 7
  %1183 = sext i32 %1182 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1183)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1183)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1183)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1183)
  %1184 = zext i8 %1180 to i32
  %1185 = shl i32 %1184, 1
  %1186 = trunc i32 %1185 to i8
  %1187 = zext i8 %1186 to i32
  %1188 = ashr i32 %1187, 7
  %1189 = sext i32 %1188 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1189)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1189)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1189)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1189)
  %1190 = zext i8 %1186 to i32
  %1191 = getelementptr inbounds i8, i8* %2, i64 7
  %1192 = load i8, i8* %1191, align 1
  %1193 = zext i8 %1192 to i32
  %1194 = ashr i32 %1193, 7
  %1195 = sext i32 %1194 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1195)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1195)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1195)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1195)
  %1196 = zext i8 %1192 to i32
  %1197 = shl i32 %1196, 1
  %1198 = trunc i32 %1197 to i8
  %1199 = zext i8 %1198 to i32
  %1200 = ashr i32 %1199, 7
  %1201 = sext i32 %1200 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1201)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1201)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1201)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1201)
  %1202 = zext i8 %1198 to i32
  %1203 = shl i32 %1202, 1
  %1204 = trunc i32 %1203 to i8
  %1205 = zext i8 %1204 to i32
  %1206 = ashr i32 %1205, 7
  %1207 = sext i32 %1206 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1207)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1207)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1207)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1207)
  %1208 = zext i8 %1204 to i32
  %1209 = shl i32 %1208, 1
  %1210 = trunc i32 %1209 to i8
  %1211 = zext i8 %1210 to i32
  %1212 = ashr i32 %1211, 7
  %1213 = sext i32 %1212 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1213)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1213)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1213)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1213)
  %1214 = zext i8 %1210 to i32
  %1215 = shl i32 %1214, 1
  %1216 = trunc i32 %1215 to i8
  %1217 = zext i8 %1216 to i32
  %1218 = ashr i32 %1217, 7
  %1219 = sext i32 %1218 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1219)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1219)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1219)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1219)
  %1220 = zext i8 %1216 to i32
  %1221 = shl i32 %1220, 1
  %1222 = trunc i32 %1221 to i8
  %1223 = zext i8 %1222 to i32
  %1224 = ashr i32 %1223, 7
  %1225 = sext i32 %1224 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1225)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1225)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1225)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1225)
  %1226 = zext i8 %1222 to i32
  %1227 = shl i32 %1226, 1
  %1228 = trunc i32 %1227 to i8
  %1229 = zext i8 %1228 to i32
  %1230 = ashr i32 %1229, 7
  %1231 = sext i32 %1230 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1231)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1231)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1231)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1231)
  %1232 = zext i8 %1228 to i32
  %1233 = shl i32 %1232, 1
  %1234 = trunc i32 %1233 to i8
  %1235 = zext i8 %1234 to i32
  %1236 = ashr i32 %1235, 7
  %1237 = sext i32 %1236 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1237)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1237)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1237)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1237)
  %1238 = zext i8 %1234 to i32
  %1239 = getelementptr inbounds i8, i8* %2, i64 6
  %1240 = load i8, i8* %1239, align 1
  %1241 = zext i8 %1240 to i32
  %1242 = ashr i32 %1241, 7
  %1243 = sext i32 %1242 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1243)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1243)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1243)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1243)
  %1244 = zext i8 %1240 to i32
  %1245 = shl i32 %1244, 1
  %1246 = trunc i32 %1245 to i8
  %1247 = zext i8 %1246 to i32
  %1248 = ashr i32 %1247, 7
  %1249 = sext i32 %1248 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1249)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1249)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1249)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1249)
  %1250 = zext i8 %1246 to i32
  %1251 = shl i32 %1250, 1
  %1252 = trunc i32 %1251 to i8
  %1253 = zext i8 %1252 to i32
  %1254 = ashr i32 %1253, 7
  %1255 = sext i32 %1254 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1255)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1255)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1255)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1255)
  %1256 = zext i8 %1252 to i32
  %1257 = shl i32 %1256, 1
  %1258 = trunc i32 %1257 to i8
  %1259 = zext i8 %1258 to i32
  %1260 = ashr i32 %1259, 7
  %1261 = sext i32 %1260 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1261)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1261)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1261)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1261)
  %1262 = zext i8 %1258 to i32
  %1263 = shl i32 %1262, 1
  %1264 = trunc i32 %1263 to i8
  %1265 = zext i8 %1264 to i32
  %1266 = ashr i32 %1265, 7
  %1267 = sext i32 %1266 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1267)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1267)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1267)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1267)
  %1268 = zext i8 %1264 to i32
  %1269 = shl i32 %1268, 1
  %1270 = trunc i32 %1269 to i8
  %1271 = zext i8 %1270 to i32
  %1272 = ashr i32 %1271, 7
  %1273 = sext i32 %1272 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1273)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1273)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1273)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1273)
  %1274 = zext i8 %1270 to i32
  %1275 = shl i32 %1274, 1
  %1276 = trunc i32 %1275 to i8
  %1277 = zext i8 %1276 to i32
  %1278 = ashr i32 %1277, 7
  %1279 = sext i32 %1278 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1279)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1279)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1279)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1279)
  %1280 = zext i8 %1276 to i32
  %1281 = shl i32 %1280, 1
  %1282 = trunc i32 %1281 to i8
  %1283 = zext i8 %1282 to i32
  %1284 = ashr i32 %1283, 7
  %1285 = sext i32 %1284 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1285)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1285)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1285)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1285)
  %1286 = zext i8 %1282 to i32
  %1287 = getelementptr inbounds i8, i8* %2, i64 5
  %1288 = load i8, i8* %1287, align 1
  %1289 = zext i8 %1288 to i32
  %1290 = ashr i32 %1289, 7
  %1291 = sext i32 %1290 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1291)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1291)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1291)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1291)
  %1292 = zext i8 %1288 to i32
  %1293 = shl i32 %1292, 1
  %1294 = trunc i32 %1293 to i8
  %1295 = zext i8 %1294 to i32
  %1296 = ashr i32 %1295, 7
  %1297 = sext i32 %1296 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1297)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1297)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1297)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1297)
  %1298 = zext i8 %1294 to i32
  %1299 = shl i32 %1298, 1
  %1300 = trunc i32 %1299 to i8
  %1301 = zext i8 %1300 to i32
  %1302 = ashr i32 %1301, 7
  %1303 = sext i32 %1302 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1303)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1303)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1303)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1303)
  %1304 = zext i8 %1300 to i32
  %1305 = shl i32 %1304, 1
  %1306 = trunc i32 %1305 to i8
  %1307 = zext i8 %1306 to i32
  %1308 = ashr i32 %1307, 7
  %1309 = sext i32 %1308 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1309)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1309)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1309)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1309)
  %1310 = zext i8 %1306 to i32
  %1311 = shl i32 %1310, 1
  %1312 = trunc i32 %1311 to i8
  %1313 = zext i8 %1312 to i32
  %1314 = ashr i32 %1313, 7
  %1315 = sext i32 %1314 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1315)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1315)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1315)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1315)
  %1316 = zext i8 %1312 to i32
  %1317 = shl i32 %1316, 1
  %1318 = trunc i32 %1317 to i8
  %1319 = zext i8 %1318 to i32
  %1320 = ashr i32 %1319, 7
  %1321 = sext i32 %1320 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1321)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1321)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1321)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1321)
  %1322 = zext i8 %1318 to i32
  %1323 = shl i32 %1322, 1
  %1324 = trunc i32 %1323 to i8
  %1325 = zext i8 %1324 to i32
  %1326 = ashr i32 %1325, 7
  %1327 = sext i32 %1326 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1327)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1327)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1327)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1327)
  %1328 = zext i8 %1324 to i32
  %1329 = shl i32 %1328, 1
  %1330 = trunc i32 %1329 to i8
  %1331 = zext i8 %1330 to i32
  %1332 = ashr i32 %1331, 7
  %1333 = sext i32 %1332 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1333)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1333)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1333)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1333)
  %1334 = zext i8 %1330 to i32
  %1335 = getelementptr inbounds i8, i8* %2, i64 4
  %1336 = load i8, i8* %1335, align 1
  %1337 = zext i8 %1336 to i32
  %1338 = ashr i32 %1337, 7
  %1339 = sext i32 %1338 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1339)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1339)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1339)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1339)
  %1340 = zext i8 %1336 to i32
  %1341 = shl i32 %1340, 1
  %1342 = trunc i32 %1341 to i8
  %1343 = zext i8 %1342 to i32
  %1344 = ashr i32 %1343, 7
  %1345 = sext i32 %1344 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1345)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1345)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1345)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1345)
  %1346 = zext i8 %1342 to i32
  %1347 = shl i32 %1346, 1
  %1348 = trunc i32 %1347 to i8
  %1349 = zext i8 %1348 to i32
  %1350 = ashr i32 %1349, 7
  %1351 = sext i32 %1350 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1351)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1351)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1351)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1351)
  %1352 = zext i8 %1348 to i32
  %1353 = shl i32 %1352, 1
  %1354 = trunc i32 %1353 to i8
  %1355 = zext i8 %1354 to i32
  %1356 = ashr i32 %1355, 7
  %1357 = sext i32 %1356 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1357)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1357)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1357)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1357)
  %1358 = zext i8 %1354 to i32
  %1359 = shl i32 %1358, 1
  %1360 = trunc i32 %1359 to i8
  %1361 = zext i8 %1360 to i32
  %1362 = ashr i32 %1361, 7
  %1363 = sext i32 %1362 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1363)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1363)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1363)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1363)
  %1364 = zext i8 %1360 to i32
  %1365 = shl i32 %1364, 1
  %1366 = trunc i32 %1365 to i8
  %1367 = zext i8 %1366 to i32
  %1368 = ashr i32 %1367, 7
  %1369 = sext i32 %1368 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1369)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1369)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1369)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1369)
  %1370 = zext i8 %1366 to i32
  %1371 = shl i32 %1370, 1
  %1372 = trunc i32 %1371 to i8
  %1373 = zext i8 %1372 to i32
  %1374 = ashr i32 %1373, 7
  %1375 = sext i32 %1374 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1375)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1375)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1375)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1375)
  %1376 = zext i8 %1372 to i32
  %1377 = shl i32 %1376, 1
  %1378 = trunc i32 %1377 to i8
  %1379 = zext i8 %1378 to i32
  %1380 = ashr i32 %1379, 7
  %1381 = sext i32 %1380 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1381)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1381)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1381)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1381)
  %1382 = zext i8 %1378 to i32
  %1383 = getelementptr inbounds i8, i8* %2, i64 3
  %1384 = load i8, i8* %1383, align 1
  %1385 = zext i8 %1384 to i32
  %1386 = ashr i32 %1385, 7
  %1387 = sext i32 %1386 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1387)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1387)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1387)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1387)
  %1388 = zext i8 %1384 to i32
  %1389 = shl i32 %1388, 1
  %1390 = trunc i32 %1389 to i8
  %1391 = zext i8 %1390 to i32
  %1392 = ashr i32 %1391, 7
  %1393 = sext i32 %1392 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1393)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1393)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1393)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1393)
  %1394 = zext i8 %1390 to i32
  %1395 = shl i32 %1394, 1
  %1396 = trunc i32 %1395 to i8
  %1397 = zext i8 %1396 to i32
  %1398 = ashr i32 %1397, 7
  %1399 = sext i32 %1398 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1399)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1399)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1399)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1399)
  %1400 = zext i8 %1396 to i32
  %1401 = shl i32 %1400, 1
  %1402 = trunc i32 %1401 to i8
  %1403 = zext i8 %1402 to i32
  %1404 = ashr i32 %1403, 7
  %1405 = sext i32 %1404 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1405)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1405)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1405)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1405)
  %1406 = zext i8 %1402 to i32
  %1407 = shl i32 %1406, 1
  %1408 = trunc i32 %1407 to i8
  %1409 = zext i8 %1408 to i32
  %1410 = ashr i32 %1409, 7
  %1411 = sext i32 %1410 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1411)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1411)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1411)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1411)
  %1412 = zext i8 %1408 to i32
  %1413 = shl i32 %1412, 1
  %1414 = trunc i32 %1413 to i8
  %1415 = zext i8 %1414 to i32
  %1416 = ashr i32 %1415, 7
  %1417 = sext i32 %1416 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1417)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1417)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1417)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1417)
  %1418 = zext i8 %1414 to i32
  %1419 = shl i32 %1418, 1
  %1420 = trunc i32 %1419 to i8
  %1421 = zext i8 %1420 to i32
  %1422 = ashr i32 %1421, 7
  %1423 = sext i32 %1422 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1423)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1423)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1423)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1423)
  %1424 = zext i8 %1420 to i32
  %1425 = shl i32 %1424, 1
  %1426 = trunc i32 %1425 to i8
  %1427 = zext i8 %1426 to i32
  %1428 = ashr i32 %1427, 7
  %1429 = sext i32 %1428 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1429)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1429)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1429)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1429)
  %1430 = zext i8 %1426 to i32
  %1431 = getelementptr inbounds i8, i8* %2, i64 2
  %1432 = load i8, i8* %1431, align 1
  %1433 = zext i8 %1432 to i32
  %1434 = ashr i32 %1433, 7
  %1435 = sext i32 %1434 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1435)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1435)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1435)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1435)
  %1436 = zext i8 %1432 to i32
  %1437 = shl i32 %1436, 1
  %1438 = trunc i32 %1437 to i8
  %1439 = zext i8 %1438 to i32
  %1440 = ashr i32 %1439, 7
  %1441 = sext i32 %1440 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1441)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1441)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1441)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1441)
  %1442 = zext i8 %1438 to i32
  %1443 = shl i32 %1442, 1
  %1444 = trunc i32 %1443 to i8
  %1445 = zext i8 %1444 to i32
  %1446 = ashr i32 %1445, 7
  %1447 = sext i32 %1446 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1447)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1447)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1447)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1447)
  %1448 = zext i8 %1444 to i32
  %1449 = shl i32 %1448, 1
  %1450 = trunc i32 %1449 to i8
  %1451 = zext i8 %1450 to i32
  %1452 = ashr i32 %1451, 7
  %1453 = sext i32 %1452 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1453)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1453)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1453)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1453)
  %1454 = zext i8 %1450 to i32
  %1455 = shl i32 %1454, 1
  %1456 = trunc i32 %1455 to i8
  %1457 = zext i8 %1456 to i32
  %1458 = ashr i32 %1457, 7
  %1459 = sext i32 %1458 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1459)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1459)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1459)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1459)
  %1460 = zext i8 %1456 to i32
  %1461 = shl i32 %1460, 1
  %1462 = trunc i32 %1461 to i8
  %1463 = zext i8 %1462 to i32
  %1464 = ashr i32 %1463, 7
  %1465 = sext i32 %1464 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1465)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1465)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1465)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1465)
  %1466 = zext i8 %1462 to i32
  %1467 = shl i32 %1466, 1
  %1468 = trunc i32 %1467 to i8
  %1469 = zext i8 %1468 to i32
  %1470 = ashr i32 %1469, 7
  %1471 = sext i32 %1470 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1471)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1471)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1471)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1471)
  %1472 = zext i8 %1468 to i32
  %1473 = shl i32 %1472, 1
  %1474 = trunc i32 %1473 to i8
  %1475 = zext i8 %1474 to i32
  %1476 = ashr i32 %1475, 7
  %1477 = sext i32 %1476 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1477)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1477)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1477)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1477)
  %1478 = zext i8 %1474 to i32
  %1479 = getelementptr inbounds i8, i8* %2, i64 1
  %1480 = load i8, i8* %1479, align 1
  %1481 = zext i8 %1480 to i32
  %1482 = ashr i32 %1481, 7
  %1483 = sext i32 %1482 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1483)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1483)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1483)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1483)
  %1484 = zext i8 %1480 to i32
  %1485 = shl i32 %1484, 1
  %1486 = trunc i32 %1485 to i8
  %1487 = zext i8 %1486 to i32
  %1488 = ashr i32 %1487, 7
  %1489 = sext i32 %1488 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1489)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1489)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1489)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1489)
  %1490 = zext i8 %1486 to i32
  %1491 = shl i32 %1490, 1
  %1492 = trunc i32 %1491 to i8
  %1493 = zext i8 %1492 to i32
  %1494 = ashr i32 %1493, 7
  %1495 = sext i32 %1494 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1495)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1495)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1495)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1495)
  %1496 = zext i8 %1492 to i32
  %1497 = shl i32 %1496, 1
  %1498 = trunc i32 %1497 to i8
  %1499 = zext i8 %1498 to i32
  %1500 = ashr i32 %1499, 7
  %1501 = sext i32 %1500 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1501)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1501)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1501)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1501)
  %1502 = zext i8 %1498 to i32
  %1503 = shl i32 %1502, 1
  %1504 = trunc i32 %1503 to i8
  %1505 = zext i8 %1504 to i32
  %1506 = ashr i32 %1505, 7
  %1507 = sext i32 %1506 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1507)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1507)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1507)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1507)
  %1508 = zext i8 %1504 to i32
  %1509 = shl i32 %1508, 1
  %1510 = trunc i32 %1509 to i8
  %1511 = zext i8 %1510 to i32
  %1512 = ashr i32 %1511, 7
  %1513 = sext i32 %1512 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1513)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1513)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1513)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1513)
  %1514 = zext i8 %1510 to i32
  %1515 = shl i32 %1514, 1
  %1516 = trunc i32 %1515 to i8
  %1517 = zext i8 %1516 to i32
  %1518 = ashr i32 %1517, 7
  %1519 = sext i32 %1518 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1519)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1519)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1519)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1519)
  %1520 = zext i8 %1516 to i32
  %1521 = shl i32 %1520, 1
  %1522 = trunc i32 %1521 to i8
  %1523 = zext i8 %1522 to i32
  %1524 = ashr i32 %1523, 7
  %1525 = sext i32 %1524 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1525)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1525)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1525)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1525)
  %1526 = zext i8 %1522 to i32
  %1527 = load i8, i8* %2, align 1
  %1528 = zext i8 %1527 to i32
  %1529 = ashr i32 %1528, 7
  %1530 = sext i32 %1529 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1530)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1530)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1530)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1530)
  %1531 = zext i8 %1527 to i32
  %1532 = shl i32 %1531, 1
  %1533 = trunc i32 %1532 to i8
  %1534 = zext i8 %1533 to i32
  %1535 = ashr i32 %1534, 7
  %1536 = sext i32 %1535 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1536)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1536)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1536)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1536)
  %1537 = zext i8 %1533 to i32
  %1538 = shl i32 %1537, 1
  %1539 = trunc i32 %1538 to i8
  %1540 = zext i8 %1539 to i32
  %1541 = ashr i32 %1540, 7
  %1542 = sext i32 %1541 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1542)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1542)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1542)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1542)
  %1543 = zext i8 %1539 to i32
  %1544 = shl i32 %1543, 1
  %1545 = trunc i32 %1544 to i8
  %1546 = zext i8 %1545 to i32
  %1547 = ashr i32 %1546, 7
  %1548 = sext i32 %1547 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1548)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1548)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1548)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1548)
  %1549 = zext i8 %1545 to i32
  %1550 = shl i32 %1549, 1
  %1551 = trunc i32 %1550 to i8
  %1552 = zext i8 %1551 to i32
  %1553 = ashr i32 %1552, 7
  %1554 = sext i32 %1553 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1554)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1554)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1554)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1554)
  %1555 = zext i8 %1551 to i32
  %1556 = shl i32 %1555, 1
  %1557 = trunc i32 %1556 to i8
  %1558 = zext i8 %1557 to i32
  %1559 = ashr i32 %1558, 7
  %1560 = sext i32 %1559 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1560)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1560)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1560)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1560)
  %1561 = zext i8 %1557 to i32
  %1562 = shl i32 %1561, 1
  %1563 = trunc i32 %1562 to i8
  %1564 = zext i8 %1563 to i32
  %1565 = ashr i32 %1564, 7
  %1566 = sext i32 %1565 to i64
  call void @swap_conditional(i64* %23, i64* %21, i64 %1566)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1566)
  call void @fmonty(i64* %35, i64* %36, i64* %33, i64* %34, i64* %23, i64* %24, i64* %21, i64* %22, i64* %3)
  call void @swap_conditional(i64* %35, i64* %33, i64 %1566)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1566)
  %1567 = zext i8 %1563 to i32
  %1568 = shl i32 %1567, 1
  %1569 = trunc i32 %1568 to i8
  %1570 = zext i8 %1569 to i32
  %1571 = ashr i32 %1570, 7
  %1572 = sext i32 %1571 to i64
  call void @swap_conditional(i64* %35, i64* %33, i64 %1572)
  call void @swap_conditional(i64* %36, i64* %34, i64 %1572)
  call void @fmonty(i64* %23, i64* %24, i64* %21, i64* %22, i64* %35, i64* %36, i64* %33, i64* %34, i64* %3)
  call void @swap_conditional(i64* %23, i64* %21, i64 %1572)
  call void @swap_conditional(i64* %24, i64* %22, i64 %1572)
  %1573 = zext i8 %1569 to i32
  %1574 = bitcast i64* %0 to i8*
  %1575 = bitcast i64* %23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1574, i8* align 8 %1575, i64 80, i1 false)
  %1576 = bitcast i64* %1 to i8*
  %1577 = bitcast i64* %24 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1576, i8* align 8 %1577, i64 80, i1 false)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @crecip(i64* %0, i64* %1) #0 {
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
  call void @fsquare(i64* %13, i64* %1)
  %14 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %15 = getelementptr inbounds [10 x i64], [10 x i64]* %3, i64 0, i64 0
  call void @fsquare(i64* %14, i64* %15)
  %16 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %17 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %16, i64* %17)
  %18 = getelementptr inbounds [10 x i64], [10 x i64]* %4, i64 0, i64 0
  %19 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fmul(i64* %18, i64* %19, i64* %1)
  %20 = getelementptr inbounds [10 x i64], [10 x i64]* %5, i64 0, i64 0
  %21 = getelementptr inbounds [10 x i64], [10 x i64]* %4, i64 0, i64 0
  %22 = getelementptr inbounds [10 x i64], [10 x i64]* %3, i64 0, i64 0
  call void @fmul(i64* %20, i64* %21, i64* %22)
  %23 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %24 = getelementptr inbounds [10 x i64], [10 x i64]* %5, i64 0, i64 0
  call void @fsquare(i64* %23, i64* %24)
  %25 = getelementptr inbounds [10 x i64], [10 x i64]* %6, i64 0, i64 0
  %26 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %27 = getelementptr inbounds [10 x i64], [10 x i64]* %4, i64 0, i64 0
  call void @fmul(i64* %25, i64* %26, i64* %27)
  %28 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %29 = getelementptr inbounds [10 x i64], [10 x i64]* %6, i64 0, i64 0
  call void @fsquare(i64* %28, i64* %29)
  %30 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %31 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %30, i64* %31)
  %32 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %33 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %32, i64* %33)
  %34 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %35 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %34, i64* %35)
  %36 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %37 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %36, i64* %37)
  %38 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  %39 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %40 = getelementptr inbounds [10 x i64], [10 x i64]* %6, i64 0, i64 0
  call void @fmul(i64* %38, i64* %39, i64* %40)
  %41 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %42 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  call void @fsquare(i64* %41, i64* %42)
  %43 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %44 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %43, i64* %44)
  %45 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %46 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %45, i64* %46)
  %47 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %48 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %47, i64* %48)
  %49 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %50 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %49, i64* %50)
  %51 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %52 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %51, i64* %52)
  %53 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %54 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %53, i64* %54)
  %55 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %56 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %55, i64* %56)
  %57 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %58 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %57, i64* %58)
  %59 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %60 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %59, i64* %60)
  %61 = getelementptr inbounds [10 x i64], [10 x i64]* %8, i64 0, i64 0
  %62 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %63 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  call void @fmul(i64* %61, i64* %62, i64* %63)
  %64 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %65 = getelementptr inbounds [10 x i64], [10 x i64]* %8, i64 0, i64 0
  call void @fsquare(i64* %64, i64* %65)
  %66 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %67 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %66, i64* %67)
  %68 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %69 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %68, i64* %69)
  %70 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %71 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %70, i64* %71)
  call void @fsquare(i64* %68, i64* %69)
  %72 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %73 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %72, i64* %73)
  call void @fsquare(i64* %68, i64* %69)
  %74 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %75 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %74, i64* %75)
  call void @fsquare(i64* %68, i64* %69)
  %76 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %77 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %76, i64* %77)
  call void @fsquare(i64* %68, i64* %69)
  %78 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %79 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %78, i64* %79)
  call void @fsquare(i64* %68, i64* %69)
  %80 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %81 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %80, i64* %81)
  call void @fsquare(i64* %68, i64* %69)
  %82 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %83 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %82, i64* %83)
  call void @fsquare(i64* %68, i64* %69)
  %84 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %85 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %84, i64* %85)
  call void @fsquare(i64* %68, i64* %69)
  %86 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %87 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %86, i64* %87)
  %88 = getelementptr inbounds [10 x i64], [10 x i64]* %8, i64 0, i64 0
  call void @fmul(i64* %68, i64* %69, i64* %88)
  %89 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %90 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %89, i64* %90)
  %91 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %92 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %91, i64* %92)
  %93 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %94 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %93, i64* %94)
  %95 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %96 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %95, i64* %96)
  %97 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %98 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %97, i64* %98)
  %99 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %100 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %99, i64* %100)
  %101 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %102 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %101, i64* %102)
  %103 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %104 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %103, i64* %104)
  %105 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %106 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %105, i64* %106)
  %107 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %108 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %107, i64* %108)
  %109 = getelementptr inbounds [10 x i64], [10 x i64]* %9, i64 0, i64 0
  %110 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %111 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  call void @fmul(i64* %109, i64* %110, i64* %111)
  %112 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %113 = getelementptr inbounds [10 x i64], [10 x i64]* %9, i64 0, i64 0
  call void @fsquare(i64* %112, i64* %113)
  %114 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %115 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %114, i64* %115)
  %116 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %117 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %116, i64* %117)
  %118 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %119 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %118, i64* %119)
  %120 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %121 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %120, i64* %121)
  %122 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %123 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %122, i64* %123)
  %124 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %125 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %124, i64* %125)
  %126 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %127 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %126, i64* %127)
  %128 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %129 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %128, i64* %129)
  %130 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %131 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %130, i64* %131)
  %132 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %133 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %132, i64* %133)
  %134 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %135 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %134, i64* %135)
  %136 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %137 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %136, i64* %137)
  %138 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %139 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %138, i64* %139)
  %140 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %141 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %140, i64* %141)
  %142 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %143 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %142, i64* %143)
  %144 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %145 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %144, i64* %145)
  %146 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %147 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %146, i64* %147)
  %148 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %149 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %148, i64* %149)
  %150 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %151 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %150, i64* %151)
  %152 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %153 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %152, i64* %153)
  %154 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %155 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %154, i64* %155)
  %156 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %157 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %156, i64* %157)
  %158 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %159 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %158, i64* %159)
  %160 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %161 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %160, i64* %161)
  %162 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %163 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %162, i64* %163)
  %164 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %165 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %164, i64* %165)
  %166 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %167 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %166, i64* %167)
  %168 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %169 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %168, i64* %169)
  %170 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %171 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %170, i64* %171)
  %172 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %173 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %172, i64* %173)
  %174 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %175 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %174, i64* %175)
  %176 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %177 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %176, i64* %177)
  %178 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %179 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %178, i64* %179)
  %180 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %181 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %180, i64* %181)
  %182 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %183 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %182, i64* %183)
  %184 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %185 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %184, i64* %185)
  %186 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %187 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %186, i64* %187)
  %188 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %189 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %188, i64* %189)
  %190 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %191 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %190, i64* %191)
  %192 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %193 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %192, i64* %193)
  %194 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %195 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %194, i64* %195)
  %196 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %197 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %196, i64* %197)
  %198 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %199 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %198, i64* %199)
  %200 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %201 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %200, i64* %201)
  %202 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %203 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %202, i64* %203)
  %204 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %205 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %204, i64* %205)
  %206 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %207 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %206, i64* %207)
  %208 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %209 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %208, i64* %209)
  %210 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %211 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %210, i64* %211)
  %212 = getelementptr inbounds [10 x i64], [10 x i64]* %10, i64 0, i64 0
  %213 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %214 = getelementptr inbounds [10 x i64], [10 x i64]* %9, i64 0, i64 0
  call void @fmul(i64* %212, i64* %213, i64* %214)
  %215 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %216 = getelementptr inbounds [10 x i64], [10 x i64]* %10, i64 0, i64 0
  call void @fsquare(i64* %215, i64* %216)
  %217 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %218 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %217, i64* %218)
  %219 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %220 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %219, i64* %220)
  %221 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %222 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %221, i64* %222)
  call void @fsquare(i64* %219, i64* %220)
  %223 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %224 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %223, i64* %224)
  call void @fsquare(i64* %219, i64* %220)
  %225 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %226 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %225, i64* %226)
  call void @fsquare(i64* %219, i64* %220)
  %227 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %228 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %227, i64* %228)
  call void @fsquare(i64* %219, i64* %220)
  %229 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %230 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %229, i64* %230)
  call void @fsquare(i64* %219, i64* %220)
  %231 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %232 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %231, i64* %232)
  call void @fsquare(i64* %219, i64* %220)
  %233 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %234 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %233, i64* %234)
  call void @fsquare(i64* %219, i64* %220)
  %235 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %236 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %235, i64* %236)
  call void @fsquare(i64* %219, i64* %220)
  %237 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %238 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %237, i64* %238)
  call void @fsquare(i64* %219, i64* %220)
  %239 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %240 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %239, i64* %240)
  call void @fsquare(i64* %219, i64* %220)
  %241 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %242 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %241, i64* %242)
  call void @fsquare(i64* %219, i64* %220)
  %243 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %244 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %243, i64* %244)
  call void @fsquare(i64* %219, i64* %220)
  %245 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %246 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %245, i64* %246)
  call void @fsquare(i64* %219, i64* %220)
  %247 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %248 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %247, i64* %248)
  call void @fsquare(i64* %219, i64* %220)
  %249 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %250 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %249, i64* %250)
  call void @fsquare(i64* %219, i64* %220)
  %251 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %252 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %251, i64* %252)
  call void @fsquare(i64* %219, i64* %220)
  %253 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %254 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %253, i64* %254)
  call void @fsquare(i64* %219, i64* %220)
  %255 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %256 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %255, i64* %256)
  call void @fsquare(i64* %219, i64* %220)
  %257 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %258 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %257, i64* %258)
  call void @fsquare(i64* %219, i64* %220)
  %259 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %260 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %259, i64* %260)
  call void @fsquare(i64* %219, i64* %220)
  %261 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %262 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %261, i64* %262)
  call void @fsquare(i64* %219, i64* %220)
  %263 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %264 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %263, i64* %264)
  call void @fsquare(i64* %219, i64* %220)
  %265 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %266 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %265, i64* %266)
  call void @fsquare(i64* %219, i64* %220)
  %267 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %268 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %267, i64* %268)
  call void @fsquare(i64* %219, i64* %220)
  %269 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %270 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %269, i64* %270)
  call void @fsquare(i64* %219, i64* %220)
  %271 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %272 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %271, i64* %272)
  call void @fsquare(i64* %219, i64* %220)
  %273 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %274 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %273, i64* %274)
  call void @fsquare(i64* %219, i64* %220)
  %275 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %276 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %275, i64* %276)
  call void @fsquare(i64* %219, i64* %220)
  %277 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %278 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %277, i64* %278)
  call void @fsquare(i64* %219, i64* %220)
  %279 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %280 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %279, i64* %280)
  call void @fsquare(i64* %219, i64* %220)
  %281 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %282 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %281, i64* %282)
  call void @fsquare(i64* %219, i64* %220)
  %283 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %284 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %283, i64* %284)
  call void @fsquare(i64* %219, i64* %220)
  %285 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %286 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %285, i64* %286)
  call void @fsquare(i64* %219, i64* %220)
  %287 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %288 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %287, i64* %288)
  call void @fsquare(i64* %219, i64* %220)
  %289 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %290 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %289, i64* %290)
  call void @fsquare(i64* %219, i64* %220)
  %291 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %292 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %291, i64* %292)
  call void @fsquare(i64* %219, i64* %220)
  %293 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %294 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %293, i64* %294)
  call void @fsquare(i64* %219, i64* %220)
  %295 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %296 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %295, i64* %296)
  call void @fsquare(i64* %219, i64* %220)
  %297 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %298 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %297, i64* %298)
  call void @fsquare(i64* %219, i64* %220)
  %299 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %300 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %299, i64* %300)
  call void @fsquare(i64* %219, i64* %220)
  %301 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %302 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %301, i64* %302)
  call void @fsquare(i64* %219, i64* %220)
  %303 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %304 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %303, i64* %304)
  call void @fsquare(i64* %219, i64* %220)
  %305 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %306 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %305, i64* %306)
  call void @fsquare(i64* %219, i64* %220)
  %307 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %308 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %307, i64* %308)
  call void @fsquare(i64* %219, i64* %220)
  %309 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %310 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %309, i64* %310)
  call void @fsquare(i64* %219, i64* %220)
  %311 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %312 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %311, i64* %312)
  call void @fsquare(i64* %219, i64* %220)
  %313 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %314 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %313, i64* %314)
  call void @fsquare(i64* %219, i64* %220)
  %315 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %316 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %315, i64* %316)
  call void @fsquare(i64* %219, i64* %220)
  %317 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %318 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %317, i64* %318)
  %319 = getelementptr inbounds [10 x i64], [10 x i64]* %10, i64 0, i64 0
  call void @fmul(i64* %219, i64* %220, i64* %319)
  %320 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %321 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %320, i64* %321)
  %322 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %323 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %322, i64* %323)
  %324 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %325 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %324, i64* %325)
  %326 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %327 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %326, i64* %327)
  call void @fsquare(i64* %324, i64* %325)
  %328 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %329 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %328, i64* %329)
  call void @fsquare(i64* %324, i64* %325)
  %330 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %331 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %330, i64* %331)
  call void @fsquare(i64* %324, i64* %325)
  %332 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %333 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %332, i64* %333)
  call void @fsquare(i64* %324, i64* %325)
  %334 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %335 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %334, i64* %335)
  call void @fsquare(i64* %324, i64* %325)
  %336 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %337 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %336, i64* %337)
  call void @fsquare(i64* %324, i64* %325)
  %338 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %339 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %338, i64* %339)
  call void @fsquare(i64* %324, i64* %325)
  %340 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %341 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %340, i64* %341)
  call void @fsquare(i64* %324, i64* %325)
  %342 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %343 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %342, i64* %343)
  call void @fsquare(i64* %324, i64* %325)
  %344 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %345 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %344, i64* %345)
  call void @fsquare(i64* %324, i64* %325)
  %346 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %347 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %346, i64* %347)
  call void @fsquare(i64* %324, i64* %325)
  %348 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %349 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %348, i64* %349)
  call void @fsquare(i64* %324, i64* %325)
  %350 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %351 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %350, i64* %351)
  call void @fsquare(i64* %324, i64* %325)
  %352 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %353 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %352, i64* %353)
  call void @fsquare(i64* %324, i64* %325)
  %354 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %355 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %354, i64* %355)
  call void @fsquare(i64* %324, i64* %325)
  %356 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %357 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %356, i64* %357)
  call void @fsquare(i64* %324, i64* %325)
  %358 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %359 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %358, i64* %359)
  call void @fsquare(i64* %324, i64* %325)
  %360 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %361 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %360, i64* %361)
  call void @fsquare(i64* %324, i64* %325)
  %362 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %363 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %362, i64* %363)
  call void @fsquare(i64* %324, i64* %325)
  %364 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %365 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %364, i64* %365)
  call void @fsquare(i64* %324, i64* %325)
  %366 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %367 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %366, i64* %367)
  call void @fsquare(i64* %324, i64* %325)
  %368 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %369 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %368, i64* %369)
  call void @fsquare(i64* %324, i64* %325)
  %370 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %371 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %370, i64* %371)
  call void @fsquare(i64* %324, i64* %325)
  %372 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %373 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %372, i64* %373)
  %374 = getelementptr inbounds [10 x i64], [10 x i64]* %9, i64 0, i64 0
  call void @fmul(i64* %324, i64* %325, i64* %374)
  %375 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %376 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %375, i64* %376)
  %377 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %378 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %377, i64* %378)
  %379 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %380 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %379, i64* %380)
  %381 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %382 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %381, i64* %382)
  %383 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %384 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %383, i64* %384)
  %385 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %386 = getelementptr inbounds [10 x i64], [10 x i64]* %5, i64 0, i64 0
  call void @fmul(i64* %0, i64* %385, i64* %386)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @fmul(i64* %0, i64* %1, i64* %2) #0 {
  %4 = alloca [19 x i64], align 16
  %5 = getelementptr inbounds [19 x i64], [19 x i64]* %4, i64 0, i64 0
  call void @fproduct(i64* %5, i64* %1, i64* %2)
  %6 = getelementptr inbounds [19 x i64], [19 x i64]* %4, i64 0, i64 0
  call void @freduce_degree(i64* %6)
  %7 = getelementptr inbounds [19 x i64], [19 x i64]* %4, i64 0, i64 0
  call void @freduce_coefficients(i64* %7)
  %8 = bitcast i64* %0 to i8*
  %9 = getelementptr inbounds [19 x i64], [19 x i64]* %4, i64 0, i64 0
  %10 = bitcast i64* %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 16 %10, i64 80, i1 false)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @fcontract(i8* %0, i64* %1) #0 {
.preheader6:
  %2 = alloca [10 x i32], align 16
  %3 = load i64, i64* %1, align 8
  %4 = trunc i64 %3 to i32
  %5 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  store i32 %4, i32* %5, align 4
  %6 = getelementptr inbounds i64, i64* %1, i64 1
  %7 = load i64, i64* %6, align 8
  %8 = trunc i64 %7 to i32
  %9 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  store i32 %8, i32* %9, align 4
  %10 = getelementptr inbounds i64, i64* %1, i64 2
  %11 = load i64, i64* %10, align 8
  %12 = trunc i64 %11 to i32
  %13 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  store i32 %12, i32* %13, align 4
  %14 = getelementptr inbounds i64, i64* %1, i64 3
  %15 = load i64, i64* %14, align 8
  %16 = trunc i64 %15 to i32
  %17 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  store i32 %16, i32* %17, align 4
  %18 = getelementptr inbounds i64, i64* %1, i64 4
  %19 = load i64, i64* %18, align 8
  %20 = trunc i64 %19 to i32
  %21 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  store i32 %20, i32* %21, align 4
  %22 = getelementptr inbounds i64, i64* %1, i64 5
  %23 = load i64, i64* %22, align 8
  %24 = trunc i64 %23 to i32
  %25 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  store i32 %24, i32* %25, align 4
  %26 = getelementptr inbounds i64, i64* %1, i64 6
  %27 = load i64, i64* %26, align 8
  %28 = trunc i64 %27 to i32
  %29 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  store i32 %28, i32* %29, align 4
  %30 = getelementptr inbounds i64, i64* %1, i64 7
  %31 = load i64, i64* %30, align 8
  %32 = trunc i64 %31 to i32
  %33 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  store i32 %32, i32* %33, align 4
  %34 = getelementptr inbounds i64, i64* %1, i64 8
  %35 = load i64, i64* %34, align 8
  %36 = trunc i64 %35 to i32
  %37 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  store i32 %36, i32* %37, align 4
  %38 = getelementptr inbounds i64, i64* %1, i64 9
  %39 = load i64, i64* %38, align 8
  %40 = trunc i64 %39 to i32
  %41 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  store i32 %40, i32* %41, align 4
  %42 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %43 = load i32, i32* %42, align 4
  %44 = ashr i32 %43, 31
  %45 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %46 = load i32, i32* %45, align 4
  %47 = and i32 %46, %44
  %48 = ashr i32 %47, 26
  %49 = sub nsw i32 0, %48
  %50 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %51 = load i32, i32* %50, align 4
  %52 = shl i32 %49, 26
  %53 = add nsw i32 %51, %52
  %54 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  store i32 %53, i32* %54, align 4
  %55 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %56 = load i32, i32* %55, align 4
  %57 = sub nsw i32 %56, %49
  %58 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  store i32 %57, i32* %58, align 4
  %59 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %60 = load i32, i32* %59, align 4
  %61 = ashr i32 %60, 31
  %62 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %63 = load i32, i32* %62, align 4
  %64 = and i32 %63, %61
  %65 = ashr i32 %64, 25
  %66 = sub nsw i32 0, %65
  %67 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %68 = load i32, i32* %67, align 4
  %69 = shl i32 %66, 25
  %70 = add nsw i32 %68, %69
  %71 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  store i32 %70, i32* %71, align 4
  %72 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %73 = load i32, i32* %72, align 4
  %74 = sub nsw i32 %73, %66
  %75 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  store i32 %74, i32* %75, align 4
  %76 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %77 = load i32, i32* %76, align 4
  %78 = ashr i32 %77, 31
  %79 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %80 = load i32, i32* %79, align 4
  %81 = and i32 %80, %78
  %82 = ashr i32 %81, 26
  %83 = sub nsw i32 0, %82
  %84 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %85 = load i32, i32* %84, align 4
  %86 = shl i32 %83, 26
  %87 = add nsw i32 %85, %86
  %88 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  store i32 %87, i32* %88, align 4
  %89 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %90 = load i32, i32* %89, align 4
  %91 = sub nsw i32 %90, %83
  %92 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  store i32 %91, i32* %92, align 4
  %93 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %94 = load i32, i32* %93, align 4
  %95 = ashr i32 %94, 31
  %96 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %97 = load i32, i32* %96, align 4
  %98 = and i32 %97, %95
  %99 = ashr i32 %98, 25
  %100 = sub nsw i32 0, %99
  %101 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %102 = load i32, i32* %101, align 4
  %103 = shl i32 %100, 25
  %104 = add nsw i32 %102, %103
  %105 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  store i32 %104, i32* %105, align 4
  %106 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %107 = load i32, i32* %106, align 4
  %108 = sub nsw i32 %107, %100
  %109 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  store i32 %108, i32* %109, align 4
  %110 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %111 = load i32, i32* %110, align 4
  %112 = ashr i32 %111, 31
  %113 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %114 = load i32, i32* %113, align 4
  %115 = and i32 %114, %112
  %116 = ashr i32 %115, 26
  %117 = sub nsw i32 0, %116
  %118 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %119 = load i32, i32* %118, align 4
  %120 = shl i32 %117, 26
  %121 = add nsw i32 %119, %120
  %122 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  store i32 %121, i32* %122, align 4
  %123 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %124 = load i32, i32* %123, align 4
  %125 = sub nsw i32 %124, %117
  %126 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  store i32 %125, i32* %126, align 4
  %127 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %128 = load i32, i32* %127, align 4
  %129 = ashr i32 %128, 31
  %130 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %131 = load i32, i32* %130, align 4
  %132 = and i32 %131, %129
  %133 = ashr i32 %132, 25
  %134 = sub nsw i32 0, %133
  %135 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %136 = load i32, i32* %135, align 4
  %137 = shl i32 %134, 25
  %138 = add nsw i32 %136, %137
  %139 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  store i32 %138, i32* %139, align 4
  %140 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %141 = load i32, i32* %140, align 4
  %142 = sub nsw i32 %141, %134
  %143 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  store i32 %142, i32* %143, align 4
  %144 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %145 = load i32, i32* %144, align 4
  %146 = ashr i32 %145, 31
  %147 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %148 = load i32, i32* %147, align 4
  %149 = and i32 %148, %146
  %150 = ashr i32 %149, 26
  %151 = sub nsw i32 0, %150
  %152 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %153 = load i32, i32* %152, align 4
  %154 = shl i32 %151, 26
  %155 = add nsw i32 %153, %154
  %156 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  store i32 %155, i32* %156, align 4
  %157 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %158 = load i32, i32* %157, align 4
  %159 = sub nsw i32 %158, %151
  %160 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  store i32 %159, i32* %160, align 4
  %161 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %162 = load i32, i32* %161, align 4
  %163 = ashr i32 %162, 31
  %164 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %165 = load i32, i32* %164, align 4
  %166 = and i32 %165, %163
  %167 = ashr i32 %166, 25
  %168 = sub nsw i32 0, %167
  %169 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %170 = load i32, i32* %169, align 4
  %171 = shl i32 %168, 25
  %172 = add nsw i32 %170, %171
  %173 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  store i32 %172, i32* %173, align 4
  %174 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %175 = load i32, i32* %174, align 4
  %176 = sub nsw i32 %175, %168
  %177 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  store i32 %176, i32* %177, align 4
  %178 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %179 = load i32, i32* %178, align 4
  %180 = ashr i32 %179, 31
  %181 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %182 = load i32, i32* %181, align 4
  %183 = and i32 %182, %180
  %184 = ashr i32 %183, 26
  %185 = sub nsw i32 0, %184
  %186 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %187 = load i32, i32* %186, align 4
  %188 = shl i32 %185, 26
  %189 = add nsw i32 %187, %188
  %190 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  store i32 %189, i32* %190, align 4
  %191 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %192 = load i32, i32* %191, align 4
  %193 = sub nsw i32 %192, %185
  %194 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  store i32 %193, i32* %194, align 4
  %195 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %196 = load i32, i32* %195, align 4
  %197 = ashr i32 %196, 31
  %198 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %199 = load i32, i32* %198, align 4
  %200 = and i32 %199, %197
  %201 = ashr i32 %200, 25
  %202 = sub nsw i32 0, %201
  %203 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %204 = load i32, i32* %203, align 4
  %205 = shl i32 %202, 25
  %206 = add nsw i32 %204, %205
  %207 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  store i32 %206, i32* %207, align 4
  %208 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %209 = load i32, i32* %208, align 16
  %210 = mul nsw i32 %202, 19
  %211 = sub nsw i32 %209, %210
  %212 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  store i32 %211, i32* %212, align 16
  %213 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %214 = load i32, i32* %213, align 4
  %215 = ashr i32 %214, 31
  %216 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %217 = load i32, i32* %216, align 4
  %218 = and i32 %217, %215
  %219 = ashr i32 %218, 26
  %220 = sub nsw i32 0, %219
  %221 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %222 = load i32, i32* %221, align 4
  %223 = shl i32 %220, 26
  %224 = add nsw i32 %222, %223
  %225 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  store i32 %224, i32* %225, align 4
  %226 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %227 = load i32, i32* %226, align 4
  %228 = sub nsw i32 %227, %220
  %229 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  store i32 %228, i32* %229, align 4
  %230 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %231 = load i32, i32* %230, align 4
  %232 = ashr i32 %231, 31
  %233 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %234 = load i32, i32* %233, align 4
  %235 = and i32 %234, %232
  %236 = ashr i32 %235, 25
  %237 = sub nsw i32 0, %236
  %238 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %239 = load i32, i32* %238, align 4
  %240 = shl i32 %237, 25
  %241 = add nsw i32 %239, %240
  %242 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  store i32 %241, i32* %242, align 4
  %243 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %244 = load i32, i32* %243, align 4
  %245 = sub nsw i32 %244, %237
  %246 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  store i32 %245, i32* %246, align 4
  %247 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %248 = load i32, i32* %247, align 4
  %249 = ashr i32 %248, 31
  %250 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %251 = load i32, i32* %250, align 4
  %252 = and i32 %251, %249
  %253 = ashr i32 %252, 26
  %254 = sub nsw i32 0, %253
  %255 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %256 = load i32, i32* %255, align 4
  %257 = shl i32 %254, 26
  %258 = add nsw i32 %256, %257
  %259 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  store i32 %258, i32* %259, align 4
  %260 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %261 = load i32, i32* %260, align 4
  %262 = sub nsw i32 %261, %254
  %263 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  store i32 %262, i32* %263, align 4
  %264 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %265 = load i32, i32* %264, align 4
  %266 = ashr i32 %265, 31
  %267 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %268 = load i32, i32* %267, align 4
  %269 = and i32 %268, %266
  %270 = ashr i32 %269, 25
  %271 = sub nsw i32 0, %270
  %272 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %273 = load i32, i32* %272, align 4
  %274 = shl i32 %271, 25
  %275 = add nsw i32 %273, %274
  %276 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  store i32 %275, i32* %276, align 4
  %277 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %278 = load i32, i32* %277, align 4
  %279 = sub nsw i32 %278, %271
  %280 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  store i32 %279, i32* %280, align 4
  %281 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %282 = load i32, i32* %281, align 4
  %283 = ashr i32 %282, 31
  %284 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %285 = load i32, i32* %284, align 4
  %286 = and i32 %285, %283
  %287 = ashr i32 %286, 26
  %288 = sub nsw i32 0, %287
  %289 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %290 = load i32, i32* %289, align 4
  %291 = shl i32 %288, 26
  %292 = add nsw i32 %290, %291
  %293 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  store i32 %292, i32* %293, align 4
  %294 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %295 = load i32, i32* %294, align 4
  %296 = sub nsw i32 %295, %288
  %297 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  store i32 %296, i32* %297, align 4
  %298 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %299 = load i32, i32* %298, align 4
  %300 = ashr i32 %299, 31
  %301 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %302 = load i32, i32* %301, align 4
  %303 = and i32 %302, %300
  %304 = ashr i32 %303, 25
  %305 = sub nsw i32 0, %304
  %306 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %307 = load i32, i32* %306, align 4
  %308 = shl i32 %305, 25
  %309 = add nsw i32 %307, %308
  %310 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  store i32 %309, i32* %310, align 4
  %311 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %312 = load i32, i32* %311, align 4
  %313 = sub nsw i32 %312, %305
  %314 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  store i32 %313, i32* %314, align 4
  %315 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %316 = load i32, i32* %315, align 4
  %317 = ashr i32 %316, 31
  %318 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %319 = load i32, i32* %318, align 4
  %320 = and i32 %319, %317
  %321 = ashr i32 %320, 26
  %322 = sub nsw i32 0, %321
  %323 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %324 = load i32, i32* %323, align 4
  %325 = shl i32 %322, 26
  %326 = add nsw i32 %324, %325
  %327 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  store i32 %326, i32* %327, align 4
  %328 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %329 = load i32, i32* %328, align 4
  %330 = sub nsw i32 %329, %322
  %331 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  store i32 %330, i32* %331, align 4
  %332 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %333 = load i32, i32* %332, align 4
  %334 = ashr i32 %333, 31
  %335 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %336 = load i32, i32* %335, align 4
  %337 = and i32 %336, %334
  %338 = ashr i32 %337, 25
  %339 = sub nsw i32 0, %338
  %340 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %341 = load i32, i32* %340, align 4
  %342 = shl i32 %339, 25
  %343 = add nsw i32 %341, %342
  %344 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  store i32 %343, i32* %344, align 4
  %345 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %346 = load i32, i32* %345, align 4
  %347 = sub nsw i32 %346, %339
  %348 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  store i32 %347, i32* %348, align 4
  %349 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %350 = load i32, i32* %349, align 4
  %351 = ashr i32 %350, 31
  %352 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %353 = load i32, i32* %352, align 4
  %354 = and i32 %353, %351
  %355 = ashr i32 %354, 26
  %356 = sub nsw i32 0, %355
  %357 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %358 = load i32, i32* %357, align 4
  %359 = shl i32 %356, 26
  %360 = add nsw i32 %358, %359
  %361 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  store i32 %360, i32* %361, align 4
  %362 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %363 = load i32, i32* %362, align 4
  %364 = sub nsw i32 %363, %356
  %365 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  store i32 %364, i32* %365, align 4
  %366 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %367 = load i32, i32* %366, align 4
  %368 = ashr i32 %367, 31
  %369 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %370 = load i32, i32* %369, align 4
  %371 = and i32 %370, %368
  %372 = ashr i32 %371, 25
  %373 = sub nsw i32 0, %372
  %374 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %375 = load i32, i32* %374, align 4
  %376 = shl i32 %373, 25
  %377 = add nsw i32 %375, %376
  %378 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  store i32 %377, i32* %378, align 4
  %379 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %380 = load i32, i32* %379, align 16
  %381 = mul nsw i32 %373, 19
  %382 = sub nsw i32 %380, %381
  %383 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  store i32 %382, i32* %383, align 16
  %384 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %385 = load i32, i32* %384, align 16
  %386 = ashr i32 %385, 31
  %387 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %388 = load i32, i32* %387, align 16
  %389 = and i32 %388, %386
  %390 = ashr i32 %389, 26
  %391 = sub nsw i32 0, %390
  %392 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %393 = load i32, i32* %392, align 16
  %394 = shl i32 %391, 26
  %395 = add nsw i32 %393, %394
  %396 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  store i32 %395, i32* %396, align 16
  %397 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %398 = load i32, i32* %397, align 4
  %399 = sub nsw i32 %398, %391
  %400 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  store i32 %399, i32* %400, align 4
  %401 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %402 = load i32, i32* %401, align 4
  %403 = ashr i32 %402, 26
  %404 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %405 = load i32, i32* %404, align 4
  %406 = and i32 %405, 67108863
  store i32 %406, i32* %404, align 4
  %407 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %408 = load i32, i32* %407, align 4
  %409 = add nsw i32 %408, %403
  store i32 %409, i32* %407, align 4
  %410 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %411 = load i32, i32* %410, align 4
  %412 = ashr i32 %411, 25
  %413 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %414 = load i32, i32* %413, align 4
  %415 = and i32 %414, 33554431
  store i32 %415, i32* %413, align 4
  %416 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %417 = load i32, i32* %416, align 4
  %418 = add nsw i32 %417, %412
  store i32 %418, i32* %416, align 4
  %419 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %420 = load i32, i32* %419, align 4
  %421 = ashr i32 %420, 26
  %422 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %423 = load i32, i32* %422, align 4
  %424 = and i32 %423, 67108863
  store i32 %424, i32* %422, align 4
  %425 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %426 = load i32, i32* %425, align 4
  %427 = add nsw i32 %426, %421
  store i32 %427, i32* %425, align 4
  %428 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %429 = load i32, i32* %428, align 4
  %430 = ashr i32 %429, 25
  %431 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %432 = load i32, i32* %431, align 4
  %433 = and i32 %432, 33554431
  store i32 %433, i32* %431, align 4
  %434 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %435 = load i32, i32* %434, align 4
  %436 = add nsw i32 %435, %430
  store i32 %436, i32* %434, align 4
  %437 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %438 = load i32, i32* %437, align 4
  %439 = ashr i32 %438, 26
  %440 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %441 = load i32, i32* %440, align 4
  %442 = and i32 %441, 67108863
  store i32 %442, i32* %440, align 4
  %443 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %444 = load i32, i32* %443, align 4
  %445 = add nsw i32 %444, %439
  store i32 %445, i32* %443, align 4
  %446 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %447 = load i32, i32* %446, align 4
  %448 = ashr i32 %447, 25
  %449 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %450 = load i32, i32* %449, align 4
  %451 = and i32 %450, 33554431
  store i32 %451, i32* %449, align 4
  %452 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %453 = load i32, i32* %452, align 4
  %454 = add nsw i32 %453, %448
  store i32 %454, i32* %452, align 4
  %455 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %456 = load i32, i32* %455, align 4
  %457 = ashr i32 %456, 26
  %458 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %459 = load i32, i32* %458, align 4
  %460 = and i32 %459, 67108863
  store i32 %460, i32* %458, align 4
  %461 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %462 = load i32, i32* %461, align 4
  %463 = add nsw i32 %462, %457
  store i32 %463, i32* %461, align 4
  %464 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %465 = load i32, i32* %464, align 4
  %466 = ashr i32 %465, 25
  %467 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %468 = load i32, i32* %467, align 4
  %469 = and i32 %468, 33554431
  store i32 %469, i32* %467, align 4
  %470 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %471 = load i32, i32* %470, align 4
  %472 = add nsw i32 %471, %466
  store i32 %472, i32* %470, align 4
  %473 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %474 = load i32, i32* %473, align 4
  %475 = ashr i32 %474, 26
  %476 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %477 = load i32, i32* %476, align 4
  %478 = and i32 %477, 67108863
  store i32 %478, i32* %476, align 4
  %479 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %480 = load i32, i32* %479, align 4
  %481 = add nsw i32 %480, %475
  store i32 %481, i32* %479, align 4
  %482 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %483 = load i32, i32* %482, align 4
  %484 = ashr i32 %483, 25
  %485 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %486 = load i32, i32* %485, align 4
  %487 = and i32 %486, 33554431
  store i32 %487, i32* %485, align 4
  %488 = mul nsw i32 19, %484
  %489 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %490 = load i32, i32* %489, align 16
  %491 = add nsw i32 %490, %488
  store i32 %491, i32* %489, align 16
  %492 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %493 = load i32, i32* %492, align 4
  %494 = ashr i32 %493, 26
  %495 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %496 = load i32, i32* %495, align 4
  %497 = and i32 %496, 67108863
  store i32 %497, i32* %495, align 4
  %498 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %499 = load i32, i32* %498, align 4
  %500 = add nsw i32 %499, %494
  store i32 %500, i32* %498, align 4
  %501 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %502 = load i32, i32* %501, align 4
  %503 = ashr i32 %502, 25
  %504 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %505 = load i32, i32* %504, align 4
  %506 = and i32 %505, 33554431
  store i32 %506, i32* %504, align 4
  %507 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %508 = load i32, i32* %507, align 4
  %509 = add nsw i32 %508, %503
  store i32 %509, i32* %507, align 4
  %510 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %511 = load i32, i32* %510, align 4
  %512 = ashr i32 %511, 26
  %513 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %514 = load i32, i32* %513, align 4
  %515 = and i32 %514, 67108863
  store i32 %515, i32* %513, align 4
  %516 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %517 = load i32, i32* %516, align 4
  %518 = add nsw i32 %517, %512
  store i32 %518, i32* %516, align 4
  %519 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %520 = load i32, i32* %519, align 4
  %521 = ashr i32 %520, 25
  %522 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %523 = load i32, i32* %522, align 4
  %524 = and i32 %523, 33554431
  store i32 %524, i32* %522, align 4
  %525 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %526 = load i32, i32* %525, align 4
  %527 = add nsw i32 %526, %521
  store i32 %527, i32* %525, align 4
  %528 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %529 = load i32, i32* %528, align 4
  %530 = ashr i32 %529, 26
  %531 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %532 = load i32, i32* %531, align 4
  %533 = and i32 %532, 67108863
  store i32 %533, i32* %531, align 4
  %534 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %535 = load i32, i32* %534, align 4
  %536 = add nsw i32 %535, %530
  store i32 %536, i32* %534, align 4
  %537 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %538 = load i32, i32* %537, align 4
  %539 = ashr i32 %538, 25
  %540 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %541 = load i32, i32* %540, align 4
  %542 = and i32 %541, 33554431
  store i32 %542, i32* %540, align 4
  %543 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %544 = load i32, i32* %543, align 4
  %545 = add nsw i32 %544, %539
  store i32 %545, i32* %543, align 4
  %546 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %547 = load i32, i32* %546, align 4
  %548 = ashr i32 %547, 26
  %549 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %550 = load i32, i32* %549, align 4
  %551 = and i32 %550, 67108863
  store i32 %551, i32* %549, align 4
  %552 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %553 = load i32, i32* %552, align 4
  %554 = add nsw i32 %553, %548
  store i32 %554, i32* %552, align 4
  %555 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %556 = load i32, i32* %555, align 4
  %557 = ashr i32 %556, 25
  %558 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %559 = load i32, i32* %558, align 4
  %560 = and i32 %559, 33554431
  store i32 %560, i32* %558, align 4
  %561 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %562 = load i32, i32* %561, align 4
  %563 = add nsw i32 %562, %557
  store i32 %563, i32* %561, align 4
  %564 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %565 = load i32, i32* %564, align 4
  %566 = ashr i32 %565, 26
  %567 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %568 = load i32, i32* %567, align 4
  %569 = and i32 %568, 67108863
  store i32 %569, i32* %567, align 4
  %570 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %571 = load i32, i32* %570, align 4
  %572 = add nsw i32 %571, %566
  store i32 %572, i32* %570, align 4
  %573 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %574 = load i32, i32* %573, align 4
  %575 = ashr i32 %574, 25
  %576 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %577 = load i32, i32* %576, align 4
  %578 = and i32 %577, 33554431
  store i32 %578, i32* %576, align 4
  %579 = mul nsw i32 19, %575
  %580 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %581 = load i32, i32* %580, align 16
  %582 = add nsw i32 %581, %579
  store i32 %582, i32* %580, align 16
  %583 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %584 = load i32, i32* %583, align 16
  %585 = call i32 @s32_gte(i32 %584, i32 67108845)
  %586 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %587 = load i32, i32* %586, align 4
  %588 = call i32 @s32_eq(i32 %587, i32 33554431)
  %589 = and i32 %585, %588
  %590 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %591 = load i32, i32* %590, align 4
  %592 = call i32 @s32_eq(i32 %591, i32 67108863)
  %593 = and i32 %589, %592
  %594 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %595 = load i32, i32* %594, align 4
  %596 = call i32 @s32_eq(i32 %595, i32 33554431)
  %597 = and i32 %593, %596
  %598 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %599 = load i32, i32* %598, align 4
  %600 = call i32 @s32_eq(i32 %599, i32 67108863)
  %601 = and i32 %597, %600
  %602 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %603 = load i32, i32* %602, align 4
  %604 = call i32 @s32_eq(i32 %603, i32 33554431)
  %605 = and i32 %601, %604
  %606 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %607 = load i32, i32* %606, align 4
  %608 = call i32 @s32_eq(i32 %607, i32 67108863)
  %609 = and i32 %605, %608
  %610 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %611 = load i32, i32* %610, align 4
  %612 = call i32 @s32_eq(i32 %611, i32 33554431)
  %613 = and i32 %609, %612
  %614 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %615 = load i32, i32* %614, align 4
  %616 = call i32 @s32_eq(i32 %615, i32 67108863)
  %617 = and i32 %613, %616
  %618 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %619 = load i32, i32* %618, align 4
  %620 = call i32 @s32_eq(i32 %619, i32 33554431)
  %621 = and i32 %617, %620
  %622 = and i32 %621, 67108845
  %623 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %624 = load i32, i32* %623, align 16
  %625 = sub nsw i32 %624, %622
  store i32 %625, i32* %623, align 16
  %626 = and i32 %621, 33554431
  %627 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %628 = load i32, i32* %627, align 4
  %629 = sub nsw i32 %628, %626
  store i32 %629, i32* %627, align 4
  %630 = and i32 %621, 67108863
  %631 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %632 = load i32, i32* %631, align 4
  %633 = sub nsw i32 %632, %630
  store i32 %633, i32* %631, align 4
  %634 = and i32 %621, 33554431
  %635 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %636 = load i32, i32* %635, align 4
  %637 = sub nsw i32 %636, %634
  store i32 %637, i32* %635, align 4
  %638 = and i32 %621, 67108863
  %639 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %640 = load i32, i32* %639, align 4
  %641 = sub nsw i32 %640, %638
  store i32 %641, i32* %639, align 4
  %642 = and i32 %621, 33554431
  %643 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %644 = load i32, i32* %643, align 4
  %645 = sub nsw i32 %644, %642
  store i32 %645, i32* %643, align 4
  %646 = and i32 %621, 67108863
  %647 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %648 = load i32, i32* %647, align 4
  %649 = sub nsw i32 %648, %646
  store i32 %649, i32* %647, align 4
  %650 = and i32 %621, 33554431
  %651 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %652 = load i32, i32* %651, align 4
  %653 = sub nsw i32 %652, %650
  store i32 %653, i32* %651, align 4
  %654 = and i32 %621, 67108863
  %655 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %656 = load i32, i32* %655, align 4
  %657 = sub nsw i32 %656, %654
  store i32 %657, i32* %655, align 4
  %658 = and i32 %621, 33554431
  %659 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %660 = load i32, i32* %659, align 4
  %661 = sub nsw i32 %660, %658
  store i32 %661, i32* %659, align 4
  %662 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %663 = load i32, i32* %662, align 4
  %664 = shl i32 %663, 2
  store i32 %664, i32* %662, align 4
  %665 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %666 = load i32, i32* %665, align 8
  %667 = shl i32 %666, 3
  store i32 %667, i32* %665, align 8
  %668 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %669 = load i32, i32* %668, align 4
  %670 = shl i32 %669, 5
  store i32 %670, i32* %668, align 4
  %671 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %672 = load i32, i32* %671, align 16
  %673 = shl i32 %672, 6
  store i32 %673, i32* %671, align 16
  %674 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %675 = load i32, i32* %674, align 8
  %676 = shl i32 %675, 1
  store i32 %676, i32* %674, align 8
  %677 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %678 = load i32, i32* %677, align 4
  %679 = shl i32 %678, 3
  store i32 %679, i32* %677, align 4
  %680 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %681 = load i32, i32* %680, align 16
  %682 = shl i32 %681, 4
  store i32 %682, i32* %680, align 16
  %683 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %684 = load i32, i32* %683, align 4
  %685 = shl i32 %684, 6
  store i32 %685, i32* %683, align 4
  store i8 0, i8* %0, align 1
  %686 = getelementptr inbounds i8, i8* %0, i64 16
  store i8 0, i8* %686, align 1
  %687 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %688 = load i32, i32* %687, align 16
  %689 = and i32 %688, 255
  %690 = load i8, i8* %0, align 1
  %691 = zext i8 %690 to i32
  %692 = or i32 %691, %689
  %693 = trunc i32 %692 to i8
  store i8 %693, i8* %0, align 1
  %694 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %695 = load i32, i32* %694, align 16
  %696 = ashr i32 %695, 8
  %697 = and i32 %696, 255
  %698 = trunc i32 %697 to i8
  %699 = getelementptr inbounds i8, i8* %0, i64 1
  store i8 %698, i8* %699, align 1
  %700 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %701 = load i32, i32* %700, align 16
  %702 = ashr i32 %701, 16
  %703 = and i32 %702, 255
  %704 = trunc i32 %703 to i8
  %705 = getelementptr inbounds i8, i8* %0, i64 2
  store i8 %704, i8* %705, align 1
  %706 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %707 = load i32, i32* %706, align 16
  %708 = ashr i32 %707, 24
  %709 = and i32 %708, 255
  %710 = trunc i32 %709 to i8
  %711 = getelementptr inbounds i8, i8* %0, i64 3
  store i8 %710, i8* %711, align 1
  %712 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %713 = load i32, i32* %712, align 4
  %714 = and i32 %713, 255
  %715 = getelementptr inbounds i8, i8* %0, i64 3
  %716 = load i8, i8* %715, align 1
  %717 = zext i8 %716 to i32
  %718 = or i32 %717, %714
  %719 = trunc i32 %718 to i8
  store i8 %719, i8* %715, align 1
  %720 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %721 = load i32, i32* %720, align 4
  %722 = ashr i32 %721, 8
  %723 = and i32 %722, 255
  %724 = trunc i32 %723 to i8
  %725 = getelementptr inbounds i8, i8* %0, i64 4
  store i8 %724, i8* %725, align 1
  %726 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %727 = load i32, i32* %726, align 4
  %728 = ashr i32 %727, 16
  %729 = and i32 %728, 255
  %730 = trunc i32 %729 to i8
  %731 = getelementptr inbounds i8, i8* %0, i64 5
  store i8 %730, i8* %731, align 1
  %732 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %733 = load i32, i32* %732, align 4
  %734 = ashr i32 %733, 24
  %735 = and i32 %734, 255
  %736 = trunc i32 %735 to i8
  %737 = getelementptr inbounds i8, i8* %0, i64 6
  store i8 %736, i8* %737, align 1
  %738 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %739 = load i32, i32* %738, align 8
  %740 = and i32 %739, 255
  %741 = getelementptr inbounds i8, i8* %0, i64 6
  %742 = load i8, i8* %741, align 1
  %743 = zext i8 %742 to i32
  %744 = or i32 %743, %740
  %745 = trunc i32 %744 to i8
  store i8 %745, i8* %741, align 1
  %746 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %747 = load i32, i32* %746, align 8
  %748 = ashr i32 %747, 8
  %749 = and i32 %748, 255
  %750 = trunc i32 %749 to i8
  %751 = getelementptr inbounds i8, i8* %0, i64 7
  store i8 %750, i8* %751, align 1
  %752 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %753 = load i32, i32* %752, align 8
  %754 = ashr i32 %753, 16
  %755 = and i32 %754, 255
  %756 = trunc i32 %755 to i8
  %757 = getelementptr inbounds i8, i8* %0, i64 8
  store i8 %756, i8* %757, align 1
  %758 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %759 = load i32, i32* %758, align 8
  %760 = ashr i32 %759, 24
  %761 = and i32 %760, 255
  %762 = trunc i32 %761 to i8
  %763 = getelementptr inbounds i8, i8* %0, i64 9
  store i8 %762, i8* %763, align 1
  %764 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %765 = load i32, i32* %764, align 4
  %766 = and i32 %765, 255
  %767 = getelementptr inbounds i8, i8* %0, i64 9
  %768 = load i8, i8* %767, align 1
  %769 = zext i8 %768 to i32
  %770 = or i32 %769, %766
  %771 = trunc i32 %770 to i8
  store i8 %771, i8* %767, align 1
  %772 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %773 = load i32, i32* %772, align 4
  %774 = ashr i32 %773, 8
  %775 = and i32 %774, 255
  %776 = trunc i32 %775 to i8
  %777 = getelementptr inbounds i8, i8* %0, i64 10
  store i8 %776, i8* %777, align 1
  %778 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %779 = load i32, i32* %778, align 4
  %780 = ashr i32 %779, 16
  %781 = and i32 %780, 255
  %782 = trunc i32 %781 to i8
  %783 = getelementptr inbounds i8, i8* %0, i64 11
  store i8 %782, i8* %783, align 1
  %784 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %785 = load i32, i32* %784, align 4
  %786 = ashr i32 %785, 24
  %787 = and i32 %786, 255
  %788 = trunc i32 %787 to i8
  %789 = getelementptr inbounds i8, i8* %0, i64 12
  store i8 %788, i8* %789, align 1
  %790 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %791 = load i32, i32* %790, align 16
  %792 = and i32 %791, 255
  %793 = getelementptr inbounds i8, i8* %0, i64 12
  %794 = load i8, i8* %793, align 1
  %795 = zext i8 %794 to i32
  %796 = or i32 %795, %792
  %797 = trunc i32 %796 to i8
  store i8 %797, i8* %793, align 1
  %798 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %799 = load i32, i32* %798, align 16
  %800 = ashr i32 %799, 8
  %801 = and i32 %800, 255
  %802 = trunc i32 %801 to i8
  %803 = getelementptr inbounds i8, i8* %0, i64 13
  store i8 %802, i8* %803, align 1
  %804 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %805 = load i32, i32* %804, align 16
  %806 = ashr i32 %805, 16
  %807 = and i32 %806, 255
  %808 = trunc i32 %807 to i8
  %809 = getelementptr inbounds i8, i8* %0, i64 14
  store i8 %808, i8* %809, align 1
  %810 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %811 = load i32, i32* %810, align 16
  %812 = ashr i32 %811, 24
  %813 = and i32 %812, 255
  %814 = trunc i32 %813 to i8
  %815 = getelementptr inbounds i8, i8* %0, i64 15
  store i8 %814, i8* %815, align 1
  %816 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %817 = load i32, i32* %816, align 4
  %818 = and i32 %817, 255
  %819 = getelementptr inbounds i8, i8* %0, i64 16
  %820 = load i8, i8* %819, align 1
  %821 = zext i8 %820 to i32
  %822 = or i32 %821, %818
  %823 = trunc i32 %822 to i8
  store i8 %823, i8* %819, align 1
  %824 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %825 = load i32, i32* %824, align 4
  %826 = ashr i32 %825, 8
  %827 = and i32 %826, 255
  %828 = trunc i32 %827 to i8
  %829 = getelementptr inbounds i8, i8* %0, i64 17
  store i8 %828, i8* %829, align 1
  %830 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %831 = load i32, i32* %830, align 4
  %832 = ashr i32 %831, 16
  %833 = and i32 %832, 255
  %834 = trunc i32 %833 to i8
  %835 = getelementptr inbounds i8, i8* %0, i64 18
  store i8 %834, i8* %835, align 1
  %836 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %837 = load i32, i32* %836, align 4
  %838 = ashr i32 %837, 24
  %839 = and i32 %838, 255
  %840 = trunc i32 %839 to i8
  %841 = getelementptr inbounds i8, i8* %0, i64 19
  store i8 %840, i8* %841, align 1
  %842 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %843 = load i32, i32* %842, align 8
  %844 = and i32 %843, 255
  %845 = getelementptr inbounds i8, i8* %0, i64 19
  %846 = load i8, i8* %845, align 1
  %847 = zext i8 %846 to i32
  %848 = or i32 %847, %844
  %849 = trunc i32 %848 to i8
  store i8 %849, i8* %845, align 1
  %850 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %851 = load i32, i32* %850, align 8
  %852 = ashr i32 %851, 8
  %853 = and i32 %852, 255
  %854 = trunc i32 %853 to i8
  %855 = getelementptr inbounds i8, i8* %0, i64 20
  store i8 %854, i8* %855, align 1
  %856 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %857 = load i32, i32* %856, align 8
  %858 = ashr i32 %857, 16
  %859 = and i32 %858, 255
  %860 = trunc i32 %859 to i8
  %861 = getelementptr inbounds i8, i8* %0, i64 21
  store i8 %860, i8* %861, align 1
  %862 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %863 = load i32, i32* %862, align 8
  %864 = ashr i32 %863, 24
  %865 = and i32 %864, 255
  %866 = trunc i32 %865 to i8
  %867 = getelementptr inbounds i8, i8* %0, i64 22
  store i8 %866, i8* %867, align 1
  %868 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %869 = load i32, i32* %868, align 4
  %870 = and i32 %869, 255
  %871 = getelementptr inbounds i8, i8* %0, i64 22
  %872 = load i8, i8* %871, align 1
  %873 = zext i8 %872 to i32
  %874 = or i32 %873, %870
  %875 = trunc i32 %874 to i8
  store i8 %875, i8* %871, align 1
  %876 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %877 = load i32, i32* %876, align 4
  %878 = ashr i32 %877, 8
  %879 = and i32 %878, 255
  %880 = trunc i32 %879 to i8
  %881 = getelementptr inbounds i8, i8* %0, i64 23
  store i8 %880, i8* %881, align 1
  %882 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %883 = load i32, i32* %882, align 4
  %884 = ashr i32 %883, 16
  %885 = and i32 %884, 255
  %886 = trunc i32 %885 to i8
  %887 = getelementptr inbounds i8, i8* %0, i64 24
  store i8 %886, i8* %887, align 1
  %888 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %889 = load i32, i32* %888, align 4
  %890 = ashr i32 %889, 24
  %891 = and i32 %890, 255
  %892 = trunc i32 %891 to i8
  %893 = getelementptr inbounds i8, i8* %0, i64 25
  store i8 %892, i8* %893, align 1
  %894 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %895 = load i32, i32* %894, align 16
  %896 = and i32 %895, 255
  %897 = getelementptr inbounds i8, i8* %0, i64 25
  %898 = load i8, i8* %897, align 1
  %899 = zext i8 %898 to i32
  %900 = or i32 %899, %896
  %901 = trunc i32 %900 to i8
  store i8 %901, i8* %897, align 1
  %902 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %903 = load i32, i32* %902, align 16
  %904 = ashr i32 %903, 8
  %905 = and i32 %904, 255
  %906 = trunc i32 %905 to i8
  %907 = getelementptr inbounds i8, i8* %0, i64 26
  store i8 %906, i8* %907, align 1
  %908 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %909 = load i32, i32* %908, align 16
  %910 = ashr i32 %909, 16
  %911 = and i32 %910, 255
  %912 = trunc i32 %911 to i8
  %913 = getelementptr inbounds i8, i8* %0, i64 27
  store i8 %912, i8* %913, align 1
  %914 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %915 = load i32, i32* %914, align 16
  %916 = ashr i32 %915, 24
  %917 = and i32 %916, 255
  %918 = trunc i32 %917 to i8
  %919 = getelementptr inbounds i8, i8* %0, i64 28
  store i8 %918, i8* %919, align 1
  %920 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %921 = load i32, i32* %920, align 4
  %922 = and i32 %921, 255
  %923 = getelementptr inbounds i8, i8* %0, i64 28
  %924 = load i8, i8* %923, align 1
  %925 = zext i8 %924 to i32
  %926 = or i32 %925, %922
  %927 = trunc i32 %926 to i8
  store i8 %927, i8* %923, align 1
  %928 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %929 = load i32, i32* %928, align 4
  %930 = ashr i32 %929, 8
  %931 = and i32 %930, 255
  %932 = trunc i32 %931 to i8
  %933 = getelementptr inbounds i8, i8* %0, i64 29
  store i8 %932, i8* %933, align 1
  %934 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %935 = load i32, i32* %934, align 4
  %936 = ashr i32 %935, 16
  %937 = and i32 %936, 255
  %938 = trunc i32 %937 to i8
  %939 = getelementptr inbounds i8, i8* %0, i64 30
  store i8 %938, i8* %939, align 1
  %940 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %941 = load i32, i32* %940, align 4
  %942 = ashr i32 %941, 24
  %943 = and i32 %942, 255
  %944 = trunc i32 %943 to i8
  %945 = getelementptr inbounds i8, i8* %0, i64 31
  store i8 %944, i8* %945, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @s32_gte(i32 %0, i32 %1) #0 {
  %3 = sub nsw i32 %0, %1
  %4 = ashr i32 %3, 31
  %5 = xor i32 %4, -1
  ret i32 %5
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @s32_eq(i32 %0, i32 %1) #0 {
  %3 = xor i32 %0, %1
  %4 = xor i32 %3, -1
  %5 = shl i32 %4, 16
  %6 = and i32 %4, %5
  %7 = shl i32 %6, 8
  %8 = and i32 %6, %7
  %9 = shl i32 %8, 4
  %10 = and i32 %8, %9
  %11 = shl i32 %10, 2
  %12 = and i32 %10, %11
  %13 = shl i32 %12, 1
  %14 = and i32 %12, %13
  %15 = ashr i32 %14, 31
  ret i32 %15
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @fproduct(i64* %0, i64* %1, i64* %2) #0 {
  %4 = getelementptr inbounds i64, i64* %1, i64 0
  %5 = load i64, i64* %4, align 8
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i64, i64* %2, i64 0
  %9 = load i64, i64* %8, align 8
  %10 = trunc i64 %9 to i32
  %11 = sext i32 %10 to i64
  %12 = mul nsw i64 %7, %11
  %13 = getelementptr inbounds i64, i64* %0, i64 0
  store i64 %12, i64* %13, align 8
  %14 = getelementptr inbounds i64, i64* %1, i64 0
  %15 = load i64, i64* %14, align 8
  %16 = trunc i64 %15 to i32
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i64, i64* %2, i64 1
  %19 = load i64, i64* %18, align 8
  %20 = trunc i64 %19 to i32
  %21 = sext i32 %20 to i64
  %22 = mul nsw i64 %17, %21
  %23 = getelementptr inbounds i64, i64* %1, i64 1
  %24 = load i64, i64* %23, align 8
  %25 = trunc i64 %24 to i32
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i64, i64* %2, i64 0
  %28 = load i64, i64* %27, align 8
  %29 = trunc i64 %28 to i32
  %30 = sext i32 %29 to i64
  %31 = mul nsw i64 %26, %30
  %32 = add nsw i64 %22, %31
  %33 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %32, i64* %33, align 8
  %34 = getelementptr inbounds i64, i64* %1, i64 1
  %35 = load i64, i64* %34, align 8
  %36 = trunc i64 %35 to i32
  %37 = sext i32 %36 to i64
  %38 = mul nsw i64 2, %37
  %39 = getelementptr inbounds i64, i64* %2, i64 1
  %40 = load i64, i64* %39, align 8
  %41 = trunc i64 %40 to i32
  %42 = sext i32 %41 to i64
  %43 = mul nsw i64 %38, %42
  %44 = getelementptr inbounds i64, i64* %1, i64 0
  %45 = load i64, i64* %44, align 8
  %46 = trunc i64 %45 to i32
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i64, i64* %2, i64 2
  %49 = load i64, i64* %48, align 8
  %50 = trunc i64 %49 to i32
  %51 = sext i32 %50 to i64
  %52 = mul nsw i64 %47, %51
  %53 = add nsw i64 %43, %52
  %54 = getelementptr inbounds i64, i64* %1, i64 2
  %55 = load i64, i64* %54, align 8
  %56 = trunc i64 %55 to i32
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i64, i64* %2, i64 0
  %59 = load i64, i64* %58, align 8
  %60 = trunc i64 %59 to i32
  %61 = sext i32 %60 to i64
  %62 = mul nsw i64 %57, %61
  %63 = add nsw i64 %53, %62
  %64 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %63, i64* %64, align 8
  %65 = getelementptr inbounds i64, i64* %1, i64 1
  %66 = load i64, i64* %65, align 8
  %67 = trunc i64 %66 to i32
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i64, i64* %2, i64 2
  %70 = load i64, i64* %69, align 8
  %71 = trunc i64 %70 to i32
  %72 = sext i32 %71 to i64
  %73 = mul nsw i64 %68, %72
  %74 = getelementptr inbounds i64, i64* %1, i64 2
  %75 = load i64, i64* %74, align 8
  %76 = trunc i64 %75 to i32
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i64, i64* %2, i64 1
  %79 = load i64, i64* %78, align 8
  %80 = trunc i64 %79 to i32
  %81 = sext i32 %80 to i64
  %82 = mul nsw i64 %77, %81
  %83 = add nsw i64 %73, %82
  %84 = getelementptr inbounds i64, i64* %1, i64 0
  %85 = load i64, i64* %84, align 8
  %86 = trunc i64 %85 to i32
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i64, i64* %2, i64 3
  %89 = load i64, i64* %88, align 8
  %90 = trunc i64 %89 to i32
  %91 = sext i32 %90 to i64
  %92 = mul nsw i64 %87, %91
  %93 = add nsw i64 %83, %92
  %94 = getelementptr inbounds i64, i64* %1, i64 3
  %95 = load i64, i64* %94, align 8
  %96 = trunc i64 %95 to i32
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i64, i64* %2, i64 0
  %99 = load i64, i64* %98, align 8
  %100 = trunc i64 %99 to i32
  %101 = sext i32 %100 to i64
  %102 = mul nsw i64 %97, %101
  %103 = add nsw i64 %93, %102
  %104 = getelementptr inbounds i64, i64* %0, i64 3
  store i64 %103, i64* %104, align 8
  %105 = getelementptr inbounds i64, i64* %1, i64 2
  %106 = load i64, i64* %105, align 8
  %107 = trunc i64 %106 to i32
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i64, i64* %2, i64 2
  %110 = load i64, i64* %109, align 8
  %111 = trunc i64 %110 to i32
  %112 = sext i32 %111 to i64
  %113 = mul nsw i64 %108, %112
  %114 = getelementptr inbounds i64, i64* %1, i64 1
  %115 = load i64, i64* %114, align 8
  %116 = trunc i64 %115 to i32
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i64, i64* %2, i64 3
  %119 = load i64, i64* %118, align 8
  %120 = trunc i64 %119 to i32
  %121 = sext i32 %120 to i64
  %122 = mul nsw i64 %117, %121
  %123 = getelementptr inbounds i64, i64* %1, i64 3
  %124 = load i64, i64* %123, align 8
  %125 = trunc i64 %124 to i32
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i64, i64* %2, i64 1
  %128 = load i64, i64* %127, align 8
  %129 = trunc i64 %128 to i32
  %130 = sext i32 %129 to i64
  %131 = mul nsw i64 %126, %130
  %132 = add nsw i64 %122, %131
  %133 = mul nsw i64 2, %132
  %134 = add nsw i64 %113, %133
  %135 = getelementptr inbounds i64, i64* %1, i64 0
  %136 = load i64, i64* %135, align 8
  %137 = trunc i64 %136 to i32
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i64, i64* %2, i64 4
  %140 = load i64, i64* %139, align 8
  %141 = trunc i64 %140 to i32
  %142 = sext i32 %141 to i64
  %143 = mul nsw i64 %138, %142
  %144 = add nsw i64 %134, %143
  %145 = getelementptr inbounds i64, i64* %1, i64 4
  %146 = load i64, i64* %145, align 8
  %147 = trunc i64 %146 to i32
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i64, i64* %2, i64 0
  %150 = load i64, i64* %149, align 8
  %151 = trunc i64 %150 to i32
  %152 = sext i32 %151 to i64
  %153 = mul nsw i64 %148, %152
  %154 = add nsw i64 %144, %153
  %155 = getelementptr inbounds i64, i64* %0, i64 4
  store i64 %154, i64* %155, align 8
  %156 = getelementptr inbounds i64, i64* %1, i64 2
  %157 = load i64, i64* %156, align 8
  %158 = trunc i64 %157 to i32
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i64, i64* %2, i64 3
  %161 = load i64, i64* %160, align 8
  %162 = trunc i64 %161 to i32
  %163 = sext i32 %162 to i64
  %164 = mul nsw i64 %159, %163
  %165 = getelementptr inbounds i64, i64* %1, i64 3
  %166 = load i64, i64* %165, align 8
  %167 = trunc i64 %166 to i32
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i64, i64* %2, i64 2
  %170 = load i64, i64* %169, align 8
  %171 = trunc i64 %170 to i32
  %172 = sext i32 %171 to i64
  %173 = mul nsw i64 %168, %172
  %174 = add nsw i64 %164, %173
  %175 = getelementptr inbounds i64, i64* %1, i64 1
  %176 = load i64, i64* %175, align 8
  %177 = trunc i64 %176 to i32
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i64, i64* %2, i64 4
  %180 = load i64, i64* %179, align 8
  %181 = trunc i64 %180 to i32
  %182 = sext i32 %181 to i64
  %183 = mul nsw i64 %178, %182
  %184 = add nsw i64 %174, %183
  %185 = getelementptr inbounds i64, i64* %1, i64 4
  %186 = load i64, i64* %185, align 8
  %187 = trunc i64 %186 to i32
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i64, i64* %2, i64 1
  %190 = load i64, i64* %189, align 8
  %191 = trunc i64 %190 to i32
  %192 = sext i32 %191 to i64
  %193 = mul nsw i64 %188, %192
  %194 = add nsw i64 %184, %193
  %195 = getelementptr inbounds i64, i64* %1, i64 0
  %196 = load i64, i64* %195, align 8
  %197 = trunc i64 %196 to i32
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds i64, i64* %2, i64 5
  %200 = load i64, i64* %199, align 8
  %201 = trunc i64 %200 to i32
  %202 = sext i32 %201 to i64
  %203 = mul nsw i64 %198, %202
  %204 = add nsw i64 %194, %203
  %205 = getelementptr inbounds i64, i64* %1, i64 5
  %206 = load i64, i64* %205, align 8
  %207 = trunc i64 %206 to i32
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds i64, i64* %2, i64 0
  %210 = load i64, i64* %209, align 8
  %211 = trunc i64 %210 to i32
  %212 = sext i32 %211 to i64
  %213 = mul nsw i64 %208, %212
  %214 = add nsw i64 %204, %213
  %215 = getelementptr inbounds i64, i64* %0, i64 5
  store i64 %214, i64* %215, align 8
  %216 = getelementptr inbounds i64, i64* %1, i64 3
  %217 = load i64, i64* %216, align 8
  %218 = trunc i64 %217 to i32
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds i64, i64* %2, i64 3
  %221 = load i64, i64* %220, align 8
  %222 = trunc i64 %221 to i32
  %223 = sext i32 %222 to i64
  %224 = mul nsw i64 %219, %223
  %225 = getelementptr inbounds i64, i64* %1, i64 1
  %226 = load i64, i64* %225, align 8
  %227 = trunc i64 %226 to i32
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds i64, i64* %2, i64 5
  %230 = load i64, i64* %229, align 8
  %231 = trunc i64 %230 to i32
  %232 = sext i32 %231 to i64
  %233 = mul nsw i64 %228, %232
  %234 = add nsw i64 %224, %233
  %235 = getelementptr inbounds i64, i64* %1, i64 5
  %236 = load i64, i64* %235, align 8
  %237 = trunc i64 %236 to i32
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds i64, i64* %2, i64 1
  %240 = load i64, i64* %239, align 8
  %241 = trunc i64 %240 to i32
  %242 = sext i32 %241 to i64
  %243 = mul nsw i64 %238, %242
  %244 = add nsw i64 %234, %243
  %245 = mul nsw i64 2, %244
  %246 = getelementptr inbounds i64, i64* %1, i64 2
  %247 = load i64, i64* %246, align 8
  %248 = trunc i64 %247 to i32
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds i64, i64* %2, i64 4
  %251 = load i64, i64* %250, align 8
  %252 = trunc i64 %251 to i32
  %253 = sext i32 %252 to i64
  %254 = mul nsw i64 %249, %253
  %255 = add nsw i64 %245, %254
  %256 = getelementptr inbounds i64, i64* %1, i64 4
  %257 = load i64, i64* %256, align 8
  %258 = trunc i64 %257 to i32
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds i64, i64* %2, i64 2
  %261 = load i64, i64* %260, align 8
  %262 = trunc i64 %261 to i32
  %263 = sext i32 %262 to i64
  %264 = mul nsw i64 %259, %263
  %265 = add nsw i64 %255, %264
  %266 = getelementptr inbounds i64, i64* %1, i64 0
  %267 = load i64, i64* %266, align 8
  %268 = trunc i64 %267 to i32
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds i64, i64* %2, i64 6
  %271 = load i64, i64* %270, align 8
  %272 = trunc i64 %271 to i32
  %273 = sext i32 %272 to i64
  %274 = mul nsw i64 %269, %273
  %275 = add nsw i64 %265, %274
  %276 = getelementptr inbounds i64, i64* %1, i64 6
  %277 = load i64, i64* %276, align 8
  %278 = trunc i64 %277 to i32
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds i64, i64* %2, i64 0
  %281 = load i64, i64* %280, align 8
  %282 = trunc i64 %281 to i32
  %283 = sext i32 %282 to i64
  %284 = mul nsw i64 %279, %283
  %285 = add nsw i64 %275, %284
  %286 = getelementptr inbounds i64, i64* %0, i64 6
  store i64 %285, i64* %286, align 8
  %287 = getelementptr inbounds i64, i64* %1, i64 3
  %288 = load i64, i64* %287, align 8
  %289 = trunc i64 %288 to i32
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i64, i64* %2, i64 4
  %292 = load i64, i64* %291, align 8
  %293 = trunc i64 %292 to i32
  %294 = sext i32 %293 to i64
  %295 = mul nsw i64 %290, %294
  %296 = getelementptr inbounds i64, i64* %1, i64 4
  %297 = load i64, i64* %296, align 8
  %298 = trunc i64 %297 to i32
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds i64, i64* %2, i64 3
  %301 = load i64, i64* %300, align 8
  %302 = trunc i64 %301 to i32
  %303 = sext i32 %302 to i64
  %304 = mul nsw i64 %299, %303
  %305 = add nsw i64 %295, %304
  %306 = getelementptr inbounds i64, i64* %1, i64 2
  %307 = load i64, i64* %306, align 8
  %308 = trunc i64 %307 to i32
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds i64, i64* %2, i64 5
  %311 = load i64, i64* %310, align 8
  %312 = trunc i64 %311 to i32
  %313 = sext i32 %312 to i64
  %314 = mul nsw i64 %309, %313
  %315 = add nsw i64 %305, %314
  %316 = getelementptr inbounds i64, i64* %1, i64 5
  %317 = load i64, i64* %316, align 8
  %318 = trunc i64 %317 to i32
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds i64, i64* %2, i64 2
  %321 = load i64, i64* %320, align 8
  %322 = trunc i64 %321 to i32
  %323 = sext i32 %322 to i64
  %324 = mul nsw i64 %319, %323
  %325 = add nsw i64 %315, %324
  %326 = getelementptr inbounds i64, i64* %1, i64 1
  %327 = load i64, i64* %326, align 8
  %328 = trunc i64 %327 to i32
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds i64, i64* %2, i64 6
  %331 = load i64, i64* %330, align 8
  %332 = trunc i64 %331 to i32
  %333 = sext i32 %332 to i64
  %334 = mul nsw i64 %329, %333
  %335 = add nsw i64 %325, %334
  %336 = getelementptr inbounds i64, i64* %1, i64 6
  %337 = load i64, i64* %336, align 8
  %338 = trunc i64 %337 to i32
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds i64, i64* %2, i64 1
  %341 = load i64, i64* %340, align 8
  %342 = trunc i64 %341 to i32
  %343 = sext i32 %342 to i64
  %344 = mul nsw i64 %339, %343
  %345 = add nsw i64 %335, %344
  %346 = getelementptr inbounds i64, i64* %1, i64 0
  %347 = load i64, i64* %346, align 8
  %348 = trunc i64 %347 to i32
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds i64, i64* %2, i64 7
  %351 = load i64, i64* %350, align 8
  %352 = trunc i64 %351 to i32
  %353 = sext i32 %352 to i64
  %354 = mul nsw i64 %349, %353
  %355 = add nsw i64 %345, %354
  %356 = getelementptr inbounds i64, i64* %1, i64 7
  %357 = load i64, i64* %356, align 8
  %358 = trunc i64 %357 to i32
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds i64, i64* %2, i64 0
  %361 = load i64, i64* %360, align 8
  %362 = trunc i64 %361 to i32
  %363 = sext i32 %362 to i64
  %364 = mul nsw i64 %359, %363
  %365 = add nsw i64 %355, %364
  %366 = getelementptr inbounds i64, i64* %0, i64 7
  store i64 %365, i64* %366, align 8
  %367 = getelementptr inbounds i64, i64* %1, i64 4
  %368 = load i64, i64* %367, align 8
  %369 = trunc i64 %368 to i32
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds i64, i64* %2, i64 4
  %372 = load i64, i64* %371, align 8
  %373 = trunc i64 %372 to i32
  %374 = sext i32 %373 to i64
  %375 = mul nsw i64 %370, %374
  %376 = getelementptr inbounds i64, i64* %1, i64 3
  %377 = load i64, i64* %376, align 8
  %378 = trunc i64 %377 to i32
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds i64, i64* %2, i64 5
  %381 = load i64, i64* %380, align 8
  %382 = trunc i64 %381 to i32
  %383 = sext i32 %382 to i64
  %384 = mul nsw i64 %379, %383
  %385 = getelementptr inbounds i64, i64* %1, i64 5
  %386 = load i64, i64* %385, align 8
  %387 = trunc i64 %386 to i32
  %388 = sext i32 %387 to i64
  %389 = getelementptr inbounds i64, i64* %2, i64 3
  %390 = load i64, i64* %389, align 8
  %391 = trunc i64 %390 to i32
  %392 = sext i32 %391 to i64
  %393 = mul nsw i64 %388, %392
  %394 = add nsw i64 %384, %393
  %395 = getelementptr inbounds i64, i64* %1, i64 1
  %396 = load i64, i64* %395, align 8
  %397 = trunc i64 %396 to i32
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds i64, i64* %2, i64 7
  %400 = load i64, i64* %399, align 8
  %401 = trunc i64 %400 to i32
  %402 = sext i32 %401 to i64
  %403 = mul nsw i64 %398, %402
  %404 = add nsw i64 %394, %403
  %405 = getelementptr inbounds i64, i64* %1, i64 7
  %406 = load i64, i64* %405, align 8
  %407 = trunc i64 %406 to i32
  %408 = sext i32 %407 to i64
  %409 = getelementptr inbounds i64, i64* %2, i64 1
  %410 = load i64, i64* %409, align 8
  %411 = trunc i64 %410 to i32
  %412 = sext i32 %411 to i64
  %413 = mul nsw i64 %408, %412
  %414 = add nsw i64 %404, %413
  %415 = mul nsw i64 2, %414
  %416 = add nsw i64 %375, %415
  %417 = getelementptr inbounds i64, i64* %1, i64 2
  %418 = load i64, i64* %417, align 8
  %419 = trunc i64 %418 to i32
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds i64, i64* %2, i64 6
  %422 = load i64, i64* %421, align 8
  %423 = trunc i64 %422 to i32
  %424 = sext i32 %423 to i64
  %425 = mul nsw i64 %420, %424
  %426 = add nsw i64 %416, %425
  %427 = getelementptr inbounds i64, i64* %1, i64 6
  %428 = load i64, i64* %427, align 8
  %429 = trunc i64 %428 to i32
  %430 = sext i32 %429 to i64
  %431 = getelementptr inbounds i64, i64* %2, i64 2
  %432 = load i64, i64* %431, align 8
  %433 = trunc i64 %432 to i32
  %434 = sext i32 %433 to i64
  %435 = mul nsw i64 %430, %434
  %436 = add nsw i64 %426, %435
  %437 = getelementptr inbounds i64, i64* %1, i64 0
  %438 = load i64, i64* %437, align 8
  %439 = trunc i64 %438 to i32
  %440 = sext i32 %439 to i64
  %441 = getelementptr inbounds i64, i64* %2, i64 8
  %442 = load i64, i64* %441, align 8
  %443 = trunc i64 %442 to i32
  %444 = sext i32 %443 to i64
  %445 = mul nsw i64 %440, %444
  %446 = add nsw i64 %436, %445
  %447 = getelementptr inbounds i64, i64* %1, i64 8
  %448 = load i64, i64* %447, align 8
  %449 = trunc i64 %448 to i32
  %450 = sext i32 %449 to i64
  %451 = getelementptr inbounds i64, i64* %2, i64 0
  %452 = load i64, i64* %451, align 8
  %453 = trunc i64 %452 to i32
  %454 = sext i32 %453 to i64
  %455 = mul nsw i64 %450, %454
  %456 = add nsw i64 %446, %455
  %457 = getelementptr inbounds i64, i64* %0, i64 8
  store i64 %456, i64* %457, align 8
  %458 = getelementptr inbounds i64, i64* %1, i64 4
  %459 = load i64, i64* %458, align 8
  %460 = trunc i64 %459 to i32
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds i64, i64* %2, i64 5
  %463 = load i64, i64* %462, align 8
  %464 = trunc i64 %463 to i32
  %465 = sext i32 %464 to i64
  %466 = mul nsw i64 %461, %465
  %467 = getelementptr inbounds i64, i64* %1, i64 5
  %468 = load i64, i64* %467, align 8
  %469 = trunc i64 %468 to i32
  %470 = sext i32 %469 to i64
  %471 = getelementptr inbounds i64, i64* %2, i64 4
  %472 = load i64, i64* %471, align 8
  %473 = trunc i64 %472 to i32
  %474 = sext i32 %473 to i64
  %475 = mul nsw i64 %470, %474
  %476 = add nsw i64 %466, %475
  %477 = getelementptr inbounds i64, i64* %1, i64 3
  %478 = load i64, i64* %477, align 8
  %479 = trunc i64 %478 to i32
  %480 = sext i32 %479 to i64
  %481 = getelementptr inbounds i64, i64* %2, i64 6
  %482 = load i64, i64* %481, align 8
  %483 = trunc i64 %482 to i32
  %484 = sext i32 %483 to i64
  %485 = mul nsw i64 %480, %484
  %486 = add nsw i64 %476, %485
  %487 = getelementptr inbounds i64, i64* %1, i64 6
  %488 = load i64, i64* %487, align 8
  %489 = trunc i64 %488 to i32
  %490 = sext i32 %489 to i64
  %491 = getelementptr inbounds i64, i64* %2, i64 3
  %492 = load i64, i64* %491, align 8
  %493 = trunc i64 %492 to i32
  %494 = sext i32 %493 to i64
  %495 = mul nsw i64 %490, %494
  %496 = add nsw i64 %486, %495
  %497 = getelementptr inbounds i64, i64* %1, i64 2
  %498 = load i64, i64* %497, align 8
  %499 = trunc i64 %498 to i32
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds i64, i64* %2, i64 7
  %502 = load i64, i64* %501, align 8
  %503 = trunc i64 %502 to i32
  %504 = sext i32 %503 to i64
  %505 = mul nsw i64 %500, %504
  %506 = add nsw i64 %496, %505
  %507 = getelementptr inbounds i64, i64* %1, i64 7
  %508 = load i64, i64* %507, align 8
  %509 = trunc i64 %508 to i32
  %510 = sext i32 %509 to i64
  %511 = getelementptr inbounds i64, i64* %2, i64 2
  %512 = load i64, i64* %511, align 8
  %513 = trunc i64 %512 to i32
  %514 = sext i32 %513 to i64
  %515 = mul nsw i64 %510, %514
  %516 = add nsw i64 %506, %515
  %517 = getelementptr inbounds i64, i64* %1, i64 1
  %518 = load i64, i64* %517, align 8
  %519 = trunc i64 %518 to i32
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds i64, i64* %2, i64 8
  %522 = load i64, i64* %521, align 8
  %523 = trunc i64 %522 to i32
  %524 = sext i32 %523 to i64
  %525 = mul nsw i64 %520, %524
  %526 = add nsw i64 %516, %525
  %527 = getelementptr inbounds i64, i64* %1, i64 8
  %528 = load i64, i64* %527, align 8
  %529 = trunc i64 %528 to i32
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds i64, i64* %2, i64 1
  %532 = load i64, i64* %531, align 8
  %533 = trunc i64 %532 to i32
  %534 = sext i32 %533 to i64
  %535 = mul nsw i64 %530, %534
  %536 = add nsw i64 %526, %535
  %537 = getelementptr inbounds i64, i64* %1, i64 0
  %538 = load i64, i64* %537, align 8
  %539 = trunc i64 %538 to i32
  %540 = sext i32 %539 to i64
  %541 = getelementptr inbounds i64, i64* %2, i64 9
  %542 = load i64, i64* %541, align 8
  %543 = trunc i64 %542 to i32
  %544 = sext i32 %543 to i64
  %545 = mul nsw i64 %540, %544
  %546 = add nsw i64 %536, %545
  %547 = getelementptr inbounds i64, i64* %1, i64 9
  %548 = load i64, i64* %547, align 8
  %549 = trunc i64 %548 to i32
  %550 = sext i32 %549 to i64
  %551 = getelementptr inbounds i64, i64* %2, i64 0
  %552 = load i64, i64* %551, align 8
  %553 = trunc i64 %552 to i32
  %554 = sext i32 %553 to i64
  %555 = mul nsw i64 %550, %554
  %556 = add nsw i64 %546, %555
  %557 = getelementptr inbounds i64, i64* %0, i64 9
  store i64 %556, i64* %557, align 8
  %558 = getelementptr inbounds i64, i64* %1, i64 5
  %559 = load i64, i64* %558, align 8
  %560 = trunc i64 %559 to i32
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds i64, i64* %2, i64 5
  %563 = load i64, i64* %562, align 8
  %564 = trunc i64 %563 to i32
  %565 = sext i32 %564 to i64
  %566 = mul nsw i64 %561, %565
  %567 = getelementptr inbounds i64, i64* %1, i64 3
  %568 = load i64, i64* %567, align 8
  %569 = trunc i64 %568 to i32
  %570 = sext i32 %569 to i64
  %571 = getelementptr inbounds i64, i64* %2, i64 7
  %572 = load i64, i64* %571, align 8
  %573 = trunc i64 %572 to i32
  %574 = sext i32 %573 to i64
  %575 = mul nsw i64 %570, %574
  %576 = add nsw i64 %566, %575
  %577 = getelementptr inbounds i64, i64* %1, i64 7
  %578 = load i64, i64* %577, align 8
  %579 = trunc i64 %578 to i32
  %580 = sext i32 %579 to i64
  %581 = getelementptr inbounds i64, i64* %2, i64 3
  %582 = load i64, i64* %581, align 8
  %583 = trunc i64 %582 to i32
  %584 = sext i32 %583 to i64
  %585 = mul nsw i64 %580, %584
  %586 = add nsw i64 %576, %585
  %587 = getelementptr inbounds i64, i64* %1, i64 1
  %588 = load i64, i64* %587, align 8
  %589 = trunc i64 %588 to i32
  %590 = sext i32 %589 to i64
  %591 = getelementptr inbounds i64, i64* %2, i64 9
  %592 = load i64, i64* %591, align 8
  %593 = trunc i64 %592 to i32
  %594 = sext i32 %593 to i64
  %595 = mul nsw i64 %590, %594
  %596 = add nsw i64 %586, %595
  %597 = getelementptr inbounds i64, i64* %1, i64 9
  %598 = load i64, i64* %597, align 8
  %599 = trunc i64 %598 to i32
  %600 = sext i32 %599 to i64
  %601 = getelementptr inbounds i64, i64* %2, i64 1
  %602 = load i64, i64* %601, align 8
  %603 = trunc i64 %602 to i32
  %604 = sext i32 %603 to i64
  %605 = mul nsw i64 %600, %604
  %606 = add nsw i64 %596, %605
  %607 = mul nsw i64 2, %606
  %608 = getelementptr inbounds i64, i64* %1, i64 4
  %609 = load i64, i64* %608, align 8
  %610 = trunc i64 %609 to i32
  %611 = sext i32 %610 to i64
  %612 = getelementptr inbounds i64, i64* %2, i64 6
  %613 = load i64, i64* %612, align 8
  %614 = trunc i64 %613 to i32
  %615 = sext i32 %614 to i64
  %616 = mul nsw i64 %611, %615
  %617 = add nsw i64 %607, %616
  %618 = getelementptr inbounds i64, i64* %1, i64 6
  %619 = load i64, i64* %618, align 8
  %620 = trunc i64 %619 to i32
  %621 = sext i32 %620 to i64
  %622 = getelementptr inbounds i64, i64* %2, i64 4
  %623 = load i64, i64* %622, align 8
  %624 = trunc i64 %623 to i32
  %625 = sext i32 %624 to i64
  %626 = mul nsw i64 %621, %625
  %627 = add nsw i64 %617, %626
  %628 = getelementptr inbounds i64, i64* %1, i64 2
  %629 = load i64, i64* %628, align 8
  %630 = trunc i64 %629 to i32
  %631 = sext i32 %630 to i64
  %632 = getelementptr inbounds i64, i64* %2, i64 8
  %633 = load i64, i64* %632, align 8
  %634 = trunc i64 %633 to i32
  %635 = sext i32 %634 to i64
  %636 = mul nsw i64 %631, %635
  %637 = add nsw i64 %627, %636
  %638 = getelementptr inbounds i64, i64* %1, i64 8
  %639 = load i64, i64* %638, align 8
  %640 = trunc i64 %639 to i32
  %641 = sext i32 %640 to i64
  %642 = getelementptr inbounds i64, i64* %2, i64 2
  %643 = load i64, i64* %642, align 8
  %644 = trunc i64 %643 to i32
  %645 = sext i32 %644 to i64
  %646 = mul nsw i64 %641, %645
  %647 = add nsw i64 %637, %646
  %648 = getelementptr inbounds i64, i64* %0, i64 10
  store i64 %647, i64* %648, align 8
  %649 = getelementptr inbounds i64, i64* %1, i64 5
  %650 = load i64, i64* %649, align 8
  %651 = trunc i64 %650 to i32
  %652 = sext i32 %651 to i64
  %653 = getelementptr inbounds i64, i64* %2, i64 6
  %654 = load i64, i64* %653, align 8
  %655 = trunc i64 %654 to i32
  %656 = sext i32 %655 to i64
  %657 = mul nsw i64 %652, %656
  %658 = getelementptr inbounds i64, i64* %1, i64 6
  %659 = load i64, i64* %658, align 8
  %660 = trunc i64 %659 to i32
  %661 = sext i32 %660 to i64
  %662 = getelementptr inbounds i64, i64* %2, i64 5
  %663 = load i64, i64* %662, align 8
  %664 = trunc i64 %663 to i32
  %665 = sext i32 %664 to i64
  %666 = mul nsw i64 %661, %665
  %667 = add nsw i64 %657, %666
  %668 = getelementptr inbounds i64, i64* %1, i64 4
  %669 = load i64, i64* %668, align 8
  %670 = trunc i64 %669 to i32
  %671 = sext i32 %670 to i64
  %672 = getelementptr inbounds i64, i64* %2, i64 7
  %673 = load i64, i64* %672, align 8
  %674 = trunc i64 %673 to i32
  %675 = sext i32 %674 to i64
  %676 = mul nsw i64 %671, %675
  %677 = add nsw i64 %667, %676
  %678 = getelementptr inbounds i64, i64* %1, i64 7
  %679 = load i64, i64* %678, align 8
  %680 = trunc i64 %679 to i32
  %681 = sext i32 %680 to i64
  %682 = getelementptr inbounds i64, i64* %2, i64 4
  %683 = load i64, i64* %682, align 8
  %684 = trunc i64 %683 to i32
  %685 = sext i32 %684 to i64
  %686 = mul nsw i64 %681, %685
  %687 = add nsw i64 %677, %686
  %688 = getelementptr inbounds i64, i64* %1, i64 3
  %689 = load i64, i64* %688, align 8
  %690 = trunc i64 %689 to i32
  %691 = sext i32 %690 to i64
  %692 = getelementptr inbounds i64, i64* %2, i64 8
  %693 = load i64, i64* %692, align 8
  %694 = trunc i64 %693 to i32
  %695 = sext i32 %694 to i64
  %696 = mul nsw i64 %691, %695
  %697 = add nsw i64 %687, %696
  %698 = getelementptr inbounds i64, i64* %1, i64 8
  %699 = load i64, i64* %698, align 8
  %700 = trunc i64 %699 to i32
  %701 = sext i32 %700 to i64
  %702 = getelementptr inbounds i64, i64* %2, i64 3
  %703 = load i64, i64* %702, align 8
  %704 = trunc i64 %703 to i32
  %705 = sext i32 %704 to i64
  %706 = mul nsw i64 %701, %705
  %707 = add nsw i64 %697, %706
  %708 = getelementptr inbounds i64, i64* %1, i64 2
  %709 = load i64, i64* %708, align 8
  %710 = trunc i64 %709 to i32
  %711 = sext i32 %710 to i64
  %712 = getelementptr inbounds i64, i64* %2, i64 9
  %713 = load i64, i64* %712, align 8
  %714 = trunc i64 %713 to i32
  %715 = sext i32 %714 to i64
  %716 = mul nsw i64 %711, %715
  %717 = add nsw i64 %707, %716
  %718 = getelementptr inbounds i64, i64* %1, i64 9
  %719 = load i64, i64* %718, align 8
  %720 = trunc i64 %719 to i32
  %721 = sext i32 %720 to i64
  %722 = getelementptr inbounds i64, i64* %2, i64 2
  %723 = load i64, i64* %722, align 8
  %724 = trunc i64 %723 to i32
  %725 = sext i32 %724 to i64
  %726 = mul nsw i64 %721, %725
  %727 = add nsw i64 %717, %726
  %728 = getelementptr inbounds i64, i64* %0, i64 11
  store i64 %727, i64* %728, align 8
  %729 = getelementptr inbounds i64, i64* %1, i64 6
  %730 = load i64, i64* %729, align 8
  %731 = trunc i64 %730 to i32
  %732 = sext i32 %731 to i64
  %733 = getelementptr inbounds i64, i64* %2, i64 6
  %734 = load i64, i64* %733, align 8
  %735 = trunc i64 %734 to i32
  %736 = sext i32 %735 to i64
  %737 = mul nsw i64 %732, %736
  %738 = getelementptr inbounds i64, i64* %1, i64 5
  %739 = load i64, i64* %738, align 8
  %740 = trunc i64 %739 to i32
  %741 = sext i32 %740 to i64
  %742 = getelementptr inbounds i64, i64* %2, i64 7
  %743 = load i64, i64* %742, align 8
  %744 = trunc i64 %743 to i32
  %745 = sext i32 %744 to i64
  %746 = mul nsw i64 %741, %745
  %747 = getelementptr inbounds i64, i64* %1, i64 7
  %748 = load i64, i64* %747, align 8
  %749 = trunc i64 %748 to i32
  %750 = sext i32 %749 to i64
  %751 = getelementptr inbounds i64, i64* %2, i64 5
  %752 = load i64, i64* %751, align 8
  %753 = trunc i64 %752 to i32
  %754 = sext i32 %753 to i64
  %755 = mul nsw i64 %750, %754
  %756 = add nsw i64 %746, %755
  %757 = getelementptr inbounds i64, i64* %1, i64 3
  %758 = load i64, i64* %757, align 8
  %759 = trunc i64 %758 to i32
  %760 = sext i32 %759 to i64
  %761 = getelementptr inbounds i64, i64* %2, i64 9
  %762 = load i64, i64* %761, align 8
  %763 = trunc i64 %762 to i32
  %764 = sext i32 %763 to i64
  %765 = mul nsw i64 %760, %764
  %766 = add nsw i64 %756, %765
  %767 = getelementptr inbounds i64, i64* %1, i64 9
  %768 = load i64, i64* %767, align 8
  %769 = trunc i64 %768 to i32
  %770 = sext i32 %769 to i64
  %771 = getelementptr inbounds i64, i64* %2, i64 3
  %772 = load i64, i64* %771, align 8
  %773 = trunc i64 %772 to i32
  %774 = sext i32 %773 to i64
  %775 = mul nsw i64 %770, %774
  %776 = add nsw i64 %766, %775
  %777 = mul nsw i64 2, %776
  %778 = add nsw i64 %737, %777
  %779 = getelementptr inbounds i64, i64* %1, i64 4
  %780 = load i64, i64* %779, align 8
  %781 = trunc i64 %780 to i32
  %782 = sext i32 %781 to i64
  %783 = getelementptr inbounds i64, i64* %2, i64 8
  %784 = load i64, i64* %783, align 8
  %785 = trunc i64 %784 to i32
  %786 = sext i32 %785 to i64
  %787 = mul nsw i64 %782, %786
  %788 = add nsw i64 %778, %787
  %789 = getelementptr inbounds i64, i64* %1, i64 8
  %790 = load i64, i64* %789, align 8
  %791 = trunc i64 %790 to i32
  %792 = sext i32 %791 to i64
  %793 = getelementptr inbounds i64, i64* %2, i64 4
  %794 = load i64, i64* %793, align 8
  %795 = trunc i64 %794 to i32
  %796 = sext i32 %795 to i64
  %797 = mul nsw i64 %792, %796
  %798 = add nsw i64 %788, %797
  %799 = getelementptr inbounds i64, i64* %0, i64 12
  store i64 %798, i64* %799, align 8
  %800 = getelementptr inbounds i64, i64* %1, i64 6
  %801 = load i64, i64* %800, align 8
  %802 = trunc i64 %801 to i32
  %803 = sext i32 %802 to i64
  %804 = getelementptr inbounds i64, i64* %2, i64 7
  %805 = load i64, i64* %804, align 8
  %806 = trunc i64 %805 to i32
  %807 = sext i32 %806 to i64
  %808 = mul nsw i64 %803, %807
  %809 = getelementptr inbounds i64, i64* %1, i64 7
  %810 = load i64, i64* %809, align 8
  %811 = trunc i64 %810 to i32
  %812 = sext i32 %811 to i64
  %813 = getelementptr inbounds i64, i64* %2, i64 6
  %814 = load i64, i64* %813, align 8
  %815 = trunc i64 %814 to i32
  %816 = sext i32 %815 to i64
  %817 = mul nsw i64 %812, %816
  %818 = add nsw i64 %808, %817
  %819 = getelementptr inbounds i64, i64* %1, i64 5
  %820 = load i64, i64* %819, align 8
  %821 = trunc i64 %820 to i32
  %822 = sext i32 %821 to i64
  %823 = getelementptr inbounds i64, i64* %2, i64 8
  %824 = load i64, i64* %823, align 8
  %825 = trunc i64 %824 to i32
  %826 = sext i32 %825 to i64
  %827 = mul nsw i64 %822, %826
  %828 = add nsw i64 %818, %827
  %829 = getelementptr inbounds i64, i64* %1, i64 8
  %830 = load i64, i64* %829, align 8
  %831 = trunc i64 %830 to i32
  %832 = sext i32 %831 to i64
  %833 = getelementptr inbounds i64, i64* %2, i64 5
  %834 = load i64, i64* %833, align 8
  %835 = trunc i64 %834 to i32
  %836 = sext i32 %835 to i64
  %837 = mul nsw i64 %832, %836
  %838 = add nsw i64 %828, %837
  %839 = getelementptr inbounds i64, i64* %1, i64 4
  %840 = load i64, i64* %839, align 8
  %841 = trunc i64 %840 to i32
  %842 = sext i32 %841 to i64
  %843 = getelementptr inbounds i64, i64* %2, i64 9
  %844 = load i64, i64* %843, align 8
  %845 = trunc i64 %844 to i32
  %846 = sext i32 %845 to i64
  %847 = mul nsw i64 %842, %846
  %848 = add nsw i64 %838, %847
  %849 = getelementptr inbounds i64, i64* %1, i64 9
  %850 = load i64, i64* %849, align 8
  %851 = trunc i64 %850 to i32
  %852 = sext i32 %851 to i64
  %853 = getelementptr inbounds i64, i64* %2, i64 4
  %854 = load i64, i64* %853, align 8
  %855 = trunc i64 %854 to i32
  %856 = sext i32 %855 to i64
  %857 = mul nsw i64 %852, %856
  %858 = add nsw i64 %848, %857
  %859 = getelementptr inbounds i64, i64* %0, i64 13
  store i64 %858, i64* %859, align 8
  %860 = getelementptr inbounds i64, i64* %1, i64 7
  %861 = load i64, i64* %860, align 8
  %862 = trunc i64 %861 to i32
  %863 = sext i32 %862 to i64
  %864 = getelementptr inbounds i64, i64* %2, i64 7
  %865 = load i64, i64* %864, align 8
  %866 = trunc i64 %865 to i32
  %867 = sext i32 %866 to i64
  %868 = mul nsw i64 %863, %867
  %869 = getelementptr inbounds i64, i64* %1, i64 5
  %870 = load i64, i64* %869, align 8
  %871 = trunc i64 %870 to i32
  %872 = sext i32 %871 to i64
  %873 = getelementptr inbounds i64, i64* %2, i64 9
  %874 = load i64, i64* %873, align 8
  %875 = trunc i64 %874 to i32
  %876 = sext i32 %875 to i64
  %877 = mul nsw i64 %872, %876
  %878 = add nsw i64 %868, %877
  %879 = getelementptr inbounds i64, i64* %1, i64 9
  %880 = load i64, i64* %879, align 8
  %881 = trunc i64 %880 to i32
  %882 = sext i32 %881 to i64
  %883 = getelementptr inbounds i64, i64* %2, i64 5
  %884 = load i64, i64* %883, align 8
  %885 = trunc i64 %884 to i32
  %886 = sext i32 %885 to i64
  %887 = mul nsw i64 %882, %886
  %888 = add nsw i64 %878, %887
  %889 = mul nsw i64 2, %888
  %890 = getelementptr inbounds i64, i64* %1, i64 6
  %891 = load i64, i64* %890, align 8
  %892 = trunc i64 %891 to i32
  %893 = sext i32 %892 to i64
  %894 = getelementptr inbounds i64, i64* %2, i64 8
  %895 = load i64, i64* %894, align 8
  %896 = trunc i64 %895 to i32
  %897 = sext i32 %896 to i64
  %898 = mul nsw i64 %893, %897
  %899 = add nsw i64 %889, %898
  %900 = getelementptr inbounds i64, i64* %1, i64 8
  %901 = load i64, i64* %900, align 8
  %902 = trunc i64 %901 to i32
  %903 = sext i32 %902 to i64
  %904 = getelementptr inbounds i64, i64* %2, i64 6
  %905 = load i64, i64* %904, align 8
  %906 = trunc i64 %905 to i32
  %907 = sext i32 %906 to i64
  %908 = mul nsw i64 %903, %907
  %909 = add nsw i64 %899, %908
  %910 = getelementptr inbounds i64, i64* %0, i64 14
  store i64 %909, i64* %910, align 8
  %911 = getelementptr inbounds i64, i64* %1, i64 7
  %912 = load i64, i64* %911, align 8
  %913 = trunc i64 %912 to i32
  %914 = sext i32 %913 to i64
  %915 = getelementptr inbounds i64, i64* %2, i64 8
  %916 = load i64, i64* %915, align 8
  %917 = trunc i64 %916 to i32
  %918 = sext i32 %917 to i64
  %919 = mul nsw i64 %914, %918
  %920 = getelementptr inbounds i64, i64* %1, i64 8
  %921 = load i64, i64* %920, align 8
  %922 = trunc i64 %921 to i32
  %923 = sext i32 %922 to i64
  %924 = getelementptr inbounds i64, i64* %2, i64 7
  %925 = load i64, i64* %924, align 8
  %926 = trunc i64 %925 to i32
  %927 = sext i32 %926 to i64
  %928 = mul nsw i64 %923, %927
  %929 = add nsw i64 %919, %928
  %930 = getelementptr inbounds i64, i64* %1, i64 6
  %931 = load i64, i64* %930, align 8
  %932 = trunc i64 %931 to i32
  %933 = sext i32 %932 to i64
  %934 = getelementptr inbounds i64, i64* %2, i64 9
  %935 = load i64, i64* %934, align 8
  %936 = trunc i64 %935 to i32
  %937 = sext i32 %936 to i64
  %938 = mul nsw i64 %933, %937
  %939 = add nsw i64 %929, %938
  %940 = getelementptr inbounds i64, i64* %1, i64 9
  %941 = load i64, i64* %940, align 8
  %942 = trunc i64 %941 to i32
  %943 = sext i32 %942 to i64
  %944 = getelementptr inbounds i64, i64* %2, i64 6
  %945 = load i64, i64* %944, align 8
  %946 = trunc i64 %945 to i32
  %947 = sext i32 %946 to i64
  %948 = mul nsw i64 %943, %947
  %949 = add nsw i64 %939, %948
  %950 = getelementptr inbounds i64, i64* %0, i64 15
  store i64 %949, i64* %950, align 8
  %951 = getelementptr inbounds i64, i64* %1, i64 8
  %952 = load i64, i64* %951, align 8
  %953 = trunc i64 %952 to i32
  %954 = sext i32 %953 to i64
  %955 = getelementptr inbounds i64, i64* %2, i64 8
  %956 = load i64, i64* %955, align 8
  %957 = trunc i64 %956 to i32
  %958 = sext i32 %957 to i64
  %959 = mul nsw i64 %954, %958
  %960 = getelementptr inbounds i64, i64* %1, i64 7
  %961 = load i64, i64* %960, align 8
  %962 = trunc i64 %961 to i32
  %963 = sext i32 %962 to i64
  %964 = getelementptr inbounds i64, i64* %2, i64 9
  %965 = load i64, i64* %964, align 8
  %966 = trunc i64 %965 to i32
  %967 = sext i32 %966 to i64
  %968 = mul nsw i64 %963, %967
  %969 = getelementptr inbounds i64, i64* %1, i64 9
  %970 = load i64, i64* %969, align 8
  %971 = trunc i64 %970 to i32
  %972 = sext i32 %971 to i64
  %973 = getelementptr inbounds i64, i64* %2, i64 7
  %974 = load i64, i64* %973, align 8
  %975 = trunc i64 %974 to i32
  %976 = sext i32 %975 to i64
  %977 = mul nsw i64 %972, %976
  %978 = add nsw i64 %968, %977
  %979 = mul nsw i64 2, %978
  %980 = add nsw i64 %959, %979
  %981 = getelementptr inbounds i64, i64* %0, i64 16
  store i64 %980, i64* %981, align 8
  %982 = getelementptr inbounds i64, i64* %1, i64 8
  %983 = load i64, i64* %982, align 8
  %984 = trunc i64 %983 to i32
  %985 = sext i32 %984 to i64
  %986 = getelementptr inbounds i64, i64* %2, i64 9
  %987 = load i64, i64* %986, align 8
  %988 = trunc i64 %987 to i32
  %989 = sext i32 %988 to i64
  %990 = mul nsw i64 %985, %989
  %991 = getelementptr inbounds i64, i64* %1, i64 9
  %992 = load i64, i64* %991, align 8
  %993 = trunc i64 %992 to i32
  %994 = sext i32 %993 to i64
  %995 = getelementptr inbounds i64, i64* %2, i64 8
  %996 = load i64, i64* %995, align 8
  %997 = trunc i64 %996 to i32
  %998 = sext i32 %997 to i64
  %999 = mul nsw i64 %994, %998
  %1000 = add nsw i64 %990, %999
  %1001 = getelementptr inbounds i64, i64* %0, i64 17
  store i64 %1000, i64* %1001, align 8
  %1002 = getelementptr inbounds i64, i64* %1, i64 9
  %1003 = load i64, i64* %1002, align 8
  %1004 = trunc i64 %1003 to i32
  %1005 = sext i32 %1004 to i64
  %1006 = mul nsw i64 2, %1005
  %1007 = getelementptr inbounds i64, i64* %2, i64 9
  %1008 = load i64, i64* %1007, align 8
  %1009 = trunc i64 %1008 to i32
  %1010 = sext i32 %1009 to i64
  %1011 = mul nsw i64 %1006, %1010
  %1012 = getelementptr inbounds i64, i64* %0, i64 18
  store i64 %1011, i64* %1012, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @freduce_degree(i64* %0) #0 {
  %2 = getelementptr inbounds i64, i64* %0, i64 18
  %3 = load i64, i64* %2, align 8
  %4 = shl i64 %3, 4
  %5 = getelementptr inbounds i64, i64* %0, i64 8
  %6 = load i64, i64* %5, align 8
  %7 = add nsw i64 %6, %4
  store i64 %7, i64* %5, align 8
  %8 = getelementptr inbounds i64, i64* %0, i64 18
  %9 = load i64, i64* %8, align 8
  %10 = shl i64 %9, 1
  %11 = getelementptr inbounds i64, i64* %0, i64 8
  %12 = load i64, i64* %11, align 8
  %13 = add nsw i64 %12, %10
  store i64 %13, i64* %11, align 8
  %14 = getelementptr inbounds i64, i64* %0, i64 18
  %15 = load i64, i64* %14, align 8
  %16 = getelementptr inbounds i64, i64* %0, i64 8
  %17 = load i64, i64* %16, align 8
  %18 = add nsw i64 %17, %15
  store i64 %18, i64* %16, align 8
  %19 = getelementptr inbounds i64, i64* %0, i64 17
  %20 = load i64, i64* %19, align 8
  %21 = shl i64 %20, 4
  %22 = getelementptr inbounds i64, i64* %0, i64 7
  %23 = load i64, i64* %22, align 8
  %24 = add nsw i64 %23, %21
  store i64 %24, i64* %22, align 8
  %25 = getelementptr inbounds i64, i64* %0, i64 17
  %26 = load i64, i64* %25, align 8
  %27 = shl i64 %26, 1
  %28 = getelementptr inbounds i64, i64* %0, i64 7
  %29 = load i64, i64* %28, align 8
  %30 = add nsw i64 %29, %27
  store i64 %30, i64* %28, align 8
  %31 = getelementptr inbounds i64, i64* %0, i64 17
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds i64, i64* %0, i64 7
  %34 = load i64, i64* %33, align 8
  %35 = add nsw i64 %34, %32
  store i64 %35, i64* %33, align 8
  %36 = getelementptr inbounds i64, i64* %0, i64 16
  %37 = load i64, i64* %36, align 8
  %38 = shl i64 %37, 4
  %39 = getelementptr inbounds i64, i64* %0, i64 6
  %40 = load i64, i64* %39, align 8
  %41 = add nsw i64 %40, %38
  store i64 %41, i64* %39, align 8
  %42 = getelementptr inbounds i64, i64* %0, i64 16
  %43 = load i64, i64* %42, align 8
  %44 = shl i64 %43, 1
  %45 = getelementptr inbounds i64, i64* %0, i64 6
  %46 = load i64, i64* %45, align 8
  %47 = add nsw i64 %46, %44
  store i64 %47, i64* %45, align 8
  %48 = getelementptr inbounds i64, i64* %0, i64 16
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds i64, i64* %0, i64 6
  %51 = load i64, i64* %50, align 8
  %52 = add nsw i64 %51, %49
  store i64 %52, i64* %50, align 8
  %53 = getelementptr inbounds i64, i64* %0, i64 15
  %54 = load i64, i64* %53, align 8
  %55 = shl i64 %54, 4
  %56 = getelementptr inbounds i64, i64* %0, i64 5
  %57 = load i64, i64* %56, align 8
  %58 = add nsw i64 %57, %55
  store i64 %58, i64* %56, align 8
  %59 = getelementptr inbounds i64, i64* %0, i64 15
  %60 = load i64, i64* %59, align 8
  %61 = shl i64 %60, 1
  %62 = getelementptr inbounds i64, i64* %0, i64 5
  %63 = load i64, i64* %62, align 8
  %64 = add nsw i64 %63, %61
  store i64 %64, i64* %62, align 8
  %65 = getelementptr inbounds i64, i64* %0, i64 15
  %66 = load i64, i64* %65, align 8
  %67 = getelementptr inbounds i64, i64* %0, i64 5
  %68 = load i64, i64* %67, align 8
  %69 = add nsw i64 %68, %66
  store i64 %69, i64* %67, align 8
  %70 = getelementptr inbounds i64, i64* %0, i64 14
  %71 = load i64, i64* %70, align 8
  %72 = shl i64 %71, 4
  %73 = getelementptr inbounds i64, i64* %0, i64 4
  %74 = load i64, i64* %73, align 8
  %75 = add nsw i64 %74, %72
  store i64 %75, i64* %73, align 8
  %76 = getelementptr inbounds i64, i64* %0, i64 14
  %77 = load i64, i64* %76, align 8
  %78 = shl i64 %77, 1
  %79 = getelementptr inbounds i64, i64* %0, i64 4
  %80 = load i64, i64* %79, align 8
  %81 = add nsw i64 %80, %78
  store i64 %81, i64* %79, align 8
  %82 = getelementptr inbounds i64, i64* %0, i64 14
  %83 = load i64, i64* %82, align 8
  %84 = getelementptr inbounds i64, i64* %0, i64 4
  %85 = load i64, i64* %84, align 8
  %86 = add nsw i64 %85, %83
  store i64 %86, i64* %84, align 8
  %87 = getelementptr inbounds i64, i64* %0, i64 13
  %88 = load i64, i64* %87, align 8
  %89 = shl i64 %88, 4
  %90 = getelementptr inbounds i64, i64* %0, i64 3
  %91 = load i64, i64* %90, align 8
  %92 = add nsw i64 %91, %89
  store i64 %92, i64* %90, align 8
  %93 = getelementptr inbounds i64, i64* %0, i64 13
  %94 = load i64, i64* %93, align 8
  %95 = shl i64 %94, 1
  %96 = getelementptr inbounds i64, i64* %0, i64 3
  %97 = load i64, i64* %96, align 8
  %98 = add nsw i64 %97, %95
  store i64 %98, i64* %96, align 8
  %99 = getelementptr inbounds i64, i64* %0, i64 13
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds i64, i64* %0, i64 3
  %102 = load i64, i64* %101, align 8
  %103 = add nsw i64 %102, %100
  store i64 %103, i64* %101, align 8
  %104 = getelementptr inbounds i64, i64* %0, i64 12
  %105 = load i64, i64* %104, align 8
  %106 = shl i64 %105, 4
  %107 = getelementptr inbounds i64, i64* %0, i64 2
  %108 = load i64, i64* %107, align 8
  %109 = add nsw i64 %108, %106
  store i64 %109, i64* %107, align 8
  %110 = getelementptr inbounds i64, i64* %0, i64 12
  %111 = load i64, i64* %110, align 8
  %112 = shl i64 %111, 1
  %113 = getelementptr inbounds i64, i64* %0, i64 2
  %114 = load i64, i64* %113, align 8
  %115 = add nsw i64 %114, %112
  store i64 %115, i64* %113, align 8
  %116 = getelementptr inbounds i64, i64* %0, i64 12
  %117 = load i64, i64* %116, align 8
  %118 = getelementptr inbounds i64, i64* %0, i64 2
  %119 = load i64, i64* %118, align 8
  %120 = add nsw i64 %119, %117
  store i64 %120, i64* %118, align 8
  %121 = getelementptr inbounds i64, i64* %0, i64 11
  %122 = load i64, i64* %121, align 8
  %123 = shl i64 %122, 4
  %124 = getelementptr inbounds i64, i64* %0, i64 1
  %125 = load i64, i64* %124, align 8
  %126 = add nsw i64 %125, %123
  store i64 %126, i64* %124, align 8
  %127 = getelementptr inbounds i64, i64* %0, i64 11
  %128 = load i64, i64* %127, align 8
  %129 = shl i64 %128, 1
  %130 = getelementptr inbounds i64, i64* %0, i64 1
  %131 = load i64, i64* %130, align 8
  %132 = add nsw i64 %131, %129
  store i64 %132, i64* %130, align 8
  %133 = getelementptr inbounds i64, i64* %0, i64 11
  %134 = load i64, i64* %133, align 8
  %135 = getelementptr inbounds i64, i64* %0, i64 1
  %136 = load i64, i64* %135, align 8
  %137 = add nsw i64 %136, %134
  store i64 %137, i64* %135, align 8
  %138 = getelementptr inbounds i64, i64* %0, i64 10
  %139 = load i64, i64* %138, align 8
  %140 = shl i64 %139, 4
  %141 = getelementptr inbounds i64, i64* %0, i64 0
  %142 = load i64, i64* %141, align 8
  %143 = add nsw i64 %142, %140
  store i64 %143, i64* %141, align 8
  %144 = getelementptr inbounds i64, i64* %0, i64 10
  %145 = load i64, i64* %144, align 8
  %146 = shl i64 %145, 1
  %147 = getelementptr inbounds i64, i64* %0, i64 0
  %148 = load i64, i64* %147, align 8
  %149 = add nsw i64 %148, %146
  store i64 %149, i64* %147, align 8
  %150 = getelementptr inbounds i64, i64* %0, i64 10
  %151 = load i64, i64* %150, align 8
  %152 = getelementptr inbounds i64, i64* %0, i64 0
  %153 = load i64, i64* %152, align 8
  %154 = add nsw i64 %153, %151
  store i64 %154, i64* %152, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @freduce_coefficients(i64* %0) #0 {
  %2 = getelementptr inbounds i64, i64* %0, i64 10
  store i64 0, i64* %2, align 8
  %3 = load i64, i64* %0, align 8
  %4 = call i64 @div_by_2_26(i64 %3)
  %5 = shl i64 %4, 26
  %6 = load i64, i64* %0, align 8
  %7 = sub nsw i64 %6, %5
  store i64 %7, i64* %0, align 8
  %8 = getelementptr inbounds i64, i64* %0, i64 1
  %9 = load i64, i64* %8, align 8
  %10 = add nsw i64 %9, %4
  store i64 %10, i64* %8, align 8
  %11 = getelementptr inbounds i64, i64* %0, i64 1
  %12 = load i64, i64* %11, align 8
  %13 = call i64 @div_by_2_25(i64 %12)
  %14 = shl i64 %13, 25
  %15 = getelementptr inbounds i64, i64* %0, i64 1
  %16 = load i64, i64* %15, align 8
  %17 = sub nsw i64 %16, %14
  store i64 %17, i64* %15, align 8
  %18 = getelementptr inbounds i64, i64* %0, i64 2
  %19 = load i64, i64* %18, align 8
  %20 = add nsw i64 %19, %13
  store i64 %20, i64* %18, align 8
  %21 = getelementptr inbounds i64, i64* %0, i64 2
  %22 = load i64, i64* %21, align 8
  %23 = call i64 @div_by_2_26(i64 %22)
  %24 = shl i64 %23, 26
  %25 = getelementptr inbounds i64, i64* %0, i64 2
  %26 = load i64, i64* %25, align 8
  %27 = sub nsw i64 %26, %24
  store i64 %27, i64* %25, align 8
  %28 = getelementptr inbounds i64, i64* %0, i64 3
  %29 = load i64, i64* %28, align 8
  %30 = add nsw i64 %29, %23
  store i64 %30, i64* %28, align 8
  %31 = getelementptr inbounds i64, i64* %0, i64 3
  %32 = load i64, i64* %31, align 8
  %33 = call i64 @div_by_2_25(i64 %32)
  %34 = shl i64 %33, 25
  %35 = getelementptr inbounds i64, i64* %0, i64 3
  %36 = load i64, i64* %35, align 8
  %37 = sub nsw i64 %36, %34
  store i64 %37, i64* %35, align 8
  %38 = getelementptr inbounds i64, i64* %0, i64 4
  %39 = load i64, i64* %38, align 8
  %40 = add nsw i64 %39, %33
  store i64 %40, i64* %38, align 8
  %41 = getelementptr inbounds i64, i64* %0, i64 4
  %42 = load i64, i64* %41, align 8
  %43 = call i64 @div_by_2_26(i64 %42)
  %44 = shl i64 %43, 26
  %45 = getelementptr inbounds i64, i64* %0, i64 4
  %46 = load i64, i64* %45, align 8
  %47 = sub nsw i64 %46, %44
  store i64 %47, i64* %45, align 8
  %48 = getelementptr inbounds i64, i64* %0, i64 5
  %49 = load i64, i64* %48, align 8
  %50 = add nsw i64 %49, %43
  store i64 %50, i64* %48, align 8
  %51 = getelementptr inbounds i64, i64* %0, i64 5
  %52 = load i64, i64* %51, align 8
  %53 = call i64 @div_by_2_25(i64 %52)
  %54 = shl i64 %53, 25
  %55 = getelementptr inbounds i64, i64* %0, i64 5
  %56 = load i64, i64* %55, align 8
  %57 = sub nsw i64 %56, %54
  store i64 %57, i64* %55, align 8
  %58 = getelementptr inbounds i64, i64* %0, i64 6
  %59 = load i64, i64* %58, align 8
  %60 = add nsw i64 %59, %53
  store i64 %60, i64* %58, align 8
  %61 = getelementptr inbounds i64, i64* %0, i64 6
  %62 = load i64, i64* %61, align 8
  %63 = call i64 @div_by_2_26(i64 %62)
  %64 = shl i64 %63, 26
  %65 = getelementptr inbounds i64, i64* %0, i64 6
  %66 = load i64, i64* %65, align 8
  %67 = sub nsw i64 %66, %64
  store i64 %67, i64* %65, align 8
  %68 = getelementptr inbounds i64, i64* %0, i64 7
  %69 = load i64, i64* %68, align 8
  %70 = add nsw i64 %69, %63
  store i64 %70, i64* %68, align 8
  %71 = getelementptr inbounds i64, i64* %0, i64 7
  %72 = load i64, i64* %71, align 8
  %73 = call i64 @div_by_2_25(i64 %72)
  %74 = shl i64 %73, 25
  %75 = getelementptr inbounds i64, i64* %0, i64 7
  %76 = load i64, i64* %75, align 8
  %77 = sub nsw i64 %76, %74
  store i64 %77, i64* %75, align 8
  %78 = getelementptr inbounds i64, i64* %0, i64 8
  %79 = load i64, i64* %78, align 8
  %80 = add nsw i64 %79, %73
  store i64 %80, i64* %78, align 8
  %81 = getelementptr inbounds i64, i64* %0, i64 8
  %82 = load i64, i64* %81, align 8
  %83 = call i64 @div_by_2_26(i64 %82)
  %84 = shl i64 %83, 26
  %85 = getelementptr inbounds i64, i64* %0, i64 8
  %86 = load i64, i64* %85, align 8
  %87 = sub nsw i64 %86, %84
  store i64 %87, i64* %85, align 8
  %88 = getelementptr inbounds i64, i64* %0, i64 9
  %89 = load i64, i64* %88, align 8
  %90 = add nsw i64 %89, %83
  store i64 %90, i64* %88, align 8
  %91 = getelementptr inbounds i64, i64* %0, i64 9
  %92 = load i64, i64* %91, align 8
  %93 = call i64 @div_by_2_25(i64 %92)
  %94 = shl i64 %93, 25
  %95 = getelementptr inbounds i64, i64* %0, i64 9
  %96 = load i64, i64* %95, align 8
  %97 = sub nsw i64 %96, %94
  store i64 %97, i64* %95, align 8
  %98 = getelementptr inbounds i64, i64* %0, i64 10
  %99 = load i64, i64* %98, align 8
  %100 = add nsw i64 %99, %93
  store i64 %100, i64* %98, align 8
  %101 = getelementptr inbounds i64, i64* %0, i64 10
  %102 = load i64, i64* %101, align 8
  %103 = shl i64 %102, 4
  %104 = load i64, i64* %0, align 8
  %105 = add nsw i64 %104, %103
  store i64 %105, i64* %0, align 8
  %106 = getelementptr inbounds i64, i64* %0, i64 10
  %107 = load i64, i64* %106, align 8
  %108 = shl i64 %107, 1
  %109 = load i64, i64* %0, align 8
  %110 = add nsw i64 %109, %108
  store i64 %110, i64* %0, align 8
  %111 = getelementptr inbounds i64, i64* %0, i64 10
  %112 = load i64, i64* %111, align 8
  %113 = load i64, i64* %0, align 8
  %114 = add nsw i64 %113, %112
  store i64 %114, i64* %0, align 8
  %115 = getelementptr inbounds i64, i64* %0, i64 10
  store i64 0, i64* %115, align 8
  %116 = load i64, i64* %0, align 8
  %117 = call i64 @div_by_2_26(i64 %116)
  %118 = shl i64 %117, 26
  %119 = load i64, i64* %0, align 8
  %120 = sub nsw i64 %119, %118
  store i64 %120, i64* %0, align 8
  %121 = getelementptr inbounds i64, i64* %0, i64 1
  %122 = load i64, i64* %121, align 8
  %123 = add nsw i64 %122, %117
  store i64 %123, i64* %121, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i64 @div_by_2_26(i64 %0) #0 {
  %2 = lshr i64 %0, 32
  %3 = trunc i64 %2 to i32
  %4 = ashr i32 %3, 31
  %5 = lshr i32 %4, 6
  %6 = sext i32 %5 to i64
  %7 = add nsw i64 %0, %6
  %8 = ashr i64 %7, 26
  ret i64 %8
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i64 @div_by_2_25(i64 %0) #0 {
  %2 = lshr i64 %0, 32
  %3 = trunc i64 %2 to i32
  %4 = ashr i32 %3, 31
  %5 = lshr i32 %4, 7
  %6 = sext i32 %5 to i64
  %7 = add nsw i64 %0, %6
  %8 = ashr i64 %7, 25
  ret i64 %8
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @fsquare(i64* %0, i64* %1) #0 {
  %3 = alloca [19 x i64], align 16
  %4 = getelementptr inbounds [19 x i64], [19 x i64]* %3, i64 0, i64 0
  call void @fsquare_inner(i64* %4, i64* %1)
  %5 = getelementptr inbounds [19 x i64], [19 x i64]* %3, i64 0, i64 0
  call void @freduce_degree(i64* %5)
  %6 = getelementptr inbounds [19 x i64], [19 x i64]* %3, i64 0, i64 0
  call void @freduce_coefficients(i64* %6)
  %7 = bitcast i64* %0 to i8*
  %8 = getelementptr inbounds [19 x i64], [19 x i64]* %3, i64 0, i64 0
  %9 = bitcast i64* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 16 %9, i64 80, i1 false)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @fsquare_inner(i64* %0, i64* %1) #0 {
  %3 = getelementptr inbounds i64, i64* %1, i64 0
  %4 = load i64, i64* %3, align 8
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i64, i64* %1, i64 0
  %8 = load i64, i64* %7, align 8
  %9 = trunc i64 %8 to i32
  %10 = sext i32 %9 to i64
  %11 = mul nsw i64 %6, %10
  %12 = getelementptr inbounds i64, i64* %0, i64 0
  store i64 %11, i64* %12, align 8
  %13 = getelementptr inbounds i64, i64* %1, i64 0
  %14 = load i64, i64* %13, align 8
  %15 = trunc i64 %14 to i32
  %16 = sext i32 %15 to i64
  %17 = mul nsw i64 2, %16
  %18 = getelementptr inbounds i64, i64* %1, i64 1
  %19 = load i64, i64* %18, align 8
  %20 = trunc i64 %19 to i32
  %21 = sext i32 %20 to i64
  %22 = mul nsw i64 %17, %21
  %23 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %22, i64* %23, align 8
  %24 = getelementptr inbounds i64, i64* %1, i64 1
  %25 = load i64, i64* %24, align 8
  %26 = trunc i64 %25 to i32
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i64, i64* %1, i64 1
  %29 = load i64, i64* %28, align 8
  %30 = trunc i64 %29 to i32
  %31 = sext i32 %30 to i64
  %32 = mul nsw i64 %27, %31
  %33 = getelementptr inbounds i64, i64* %1, i64 0
  %34 = load i64, i64* %33, align 8
  %35 = trunc i64 %34 to i32
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i64, i64* %1, i64 2
  %38 = load i64, i64* %37, align 8
  %39 = trunc i64 %38 to i32
  %40 = sext i32 %39 to i64
  %41 = mul nsw i64 %36, %40
  %42 = add nsw i64 %32, %41
  %43 = mul nsw i64 2, %42
  %44 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %43, i64* %44, align 8
  %45 = getelementptr inbounds i64, i64* %1, i64 1
  %46 = load i64, i64* %45, align 8
  %47 = trunc i64 %46 to i32
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i64, i64* %1, i64 2
  %50 = load i64, i64* %49, align 8
  %51 = trunc i64 %50 to i32
  %52 = sext i32 %51 to i64
  %53 = mul nsw i64 %48, %52
  %54 = getelementptr inbounds i64, i64* %1, i64 0
  %55 = load i64, i64* %54, align 8
  %56 = trunc i64 %55 to i32
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i64, i64* %1, i64 3
  %59 = load i64, i64* %58, align 8
  %60 = trunc i64 %59 to i32
  %61 = sext i32 %60 to i64
  %62 = mul nsw i64 %57, %61
  %63 = add nsw i64 %53, %62
  %64 = mul nsw i64 2, %63
  %65 = getelementptr inbounds i64, i64* %0, i64 3
  store i64 %64, i64* %65, align 8
  %66 = getelementptr inbounds i64, i64* %1, i64 2
  %67 = load i64, i64* %66, align 8
  %68 = trunc i64 %67 to i32
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i64, i64* %1, i64 2
  %71 = load i64, i64* %70, align 8
  %72 = trunc i64 %71 to i32
  %73 = sext i32 %72 to i64
  %74 = mul nsw i64 %69, %73
  %75 = getelementptr inbounds i64, i64* %1, i64 1
  %76 = load i64, i64* %75, align 8
  %77 = trunc i64 %76 to i32
  %78 = sext i32 %77 to i64
  %79 = mul nsw i64 4, %78
  %80 = getelementptr inbounds i64, i64* %1, i64 3
  %81 = load i64, i64* %80, align 8
  %82 = trunc i64 %81 to i32
  %83 = sext i32 %82 to i64
  %84 = mul nsw i64 %79, %83
  %85 = add nsw i64 %74, %84
  %86 = getelementptr inbounds i64, i64* %1, i64 0
  %87 = load i64, i64* %86, align 8
  %88 = trunc i64 %87 to i32
  %89 = sext i32 %88 to i64
  %90 = mul nsw i64 2, %89
  %91 = getelementptr inbounds i64, i64* %1, i64 4
  %92 = load i64, i64* %91, align 8
  %93 = trunc i64 %92 to i32
  %94 = sext i32 %93 to i64
  %95 = mul nsw i64 %90, %94
  %96 = add nsw i64 %85, %95
  %97 = getelementptr inbounds i64, i64* %0, i64 4
  store i64 %96, i64* %97, align 8
  %98 = getelementptr inbounds i64, i64* %1, i64 2
  %99 = load i64, i64* %98, align 8
  %100 = trunc i64 %99 to i32
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i64, i64* %1, i64 3
  %103 = load i64, i64* %102, align 8
  %104 = trunc i64 %103 to i32
  %105 = sext i32 %104 to i64
  %106 = mul nsw i64 %101, %105
  %107 = getelementptr inbounds i64, i64* %1, i64 1
  %108 = load i64, i64* %107, align 8
  %109 = trunc i64 %108 to i32
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i64, i64* %1, i64 4
  %112 = load i64, i64* %111, align 8
  %113 = trunc i64 %112 to i32
  %114 = sext i32 %113 to i64
  %115 = mul nsw i64 %110, %114
  %116 = add nsw i64 %106, %115
  %117 = getelementptr inbounds i64, i64* %1, i64 0
  %118 = load i64, i64* %117, align 8
  %119 = trunc i64 %118 to i32
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i64, i64* %1, i64 5
  %122 = load i64, i64* %121, align 8
  %123 = trunc i64 %122 to i32
  %124 = sext i32 %123 to i64
  %125 = mul nsw i64 %120, %124
  %126 = add nsw i64 %116, %125
  %127 = mul nsw i64 2, %126
  %128 = getelementptr inbounds i64, i64* %0, i64 5
  store i64 %127, i64* %128, align 8
  %129 = getelementptr inbounds i64, i64* %1, i64 3
  %130 = load i64, i64* %129, align 8
  %131 = trunc i64 %130 to i32
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i64, i64* %1, i64 3
  %134 = load i64, i64* %133, align 8
  %135 = trunc i64 %134 to i32
  %136 = sext i32 %135 to i64
  %137 = mul nsw i64 %132, %136
  %138 = getelementptr inbounds i64, i64* %1, i64 2
  %139 = load i64, i64* %138, align 8
  %140 = trunc i64 %139 to i32
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i64, i64* %1, i64 4
  %143 = load i64, i64* %142, align 8
  %144 = trunc i64 %143 to i32
  %145 = sext i32 %144 to i64
  %146 = mul nsw i64 %141, %145
  %147 = add nsw i64 %137, %146
  %148 = getelementptr inbounds i64, i64* %1, i64 0
  %149 = load i64, i64* %148, align 8
  %150 = trunc i64 %149 to i32
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i64, i64* %1, i64 6
  %153 = load i64, i64* %152, align 8
  %154 = trunc i64 %153 to i32
  %155 = sext i32 %154 to i64
  %156 = mul nsw i64 %151, %155
  %157 = add nsw i64 %147, %156
  %158 = getelementptr inbounds i64, i64* %1, i64 1
  %159 = load i64, i64* %158, align 8
  %160 = trunc i64 %159 to i32
  %161 = sext i32 %160 to i64
  %162 = mul nsw i64 2, %161
  %163 = getelementptr inbounds i64, i64* %1, i64 5
  %164 = load i64, i64* %163, align 8
  %165 = trunc i64 %164 to i32
  %166 = sext i32 %165 to i64
  %167 = mul nsw i64 %162, %166
  %168 = add nsw i64 %157, %167
  %169 = mul nsw i64 2, %168
  %170 = getelementptr inbounds i64, i64* %0, i64 6
  store i64 %169, i64* %170, align 8
  %171 = getelementptr inbounds i64, i64* %1, i64 3
  %172 = load i64, i64* %171, align 8
  %173 = trunc i64 %172 to i32
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i64, i64* %1, i64 4
  %176 = load i64, i64* %175, align 8
  %177 = trunc i64 %176 to i32
  %178 = sext i32 %177 to i64
  %179 = mul nsw i64 %174, %178
  %180 = getelementptr inbounds i64, i64* %1, i64 2
  %181 = load i64, i64* %180, align 8
  %182 = trunc i64 %181 to i32
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i64, i64* %1, i64 5
  %185 = load i64, i64* %184, align 8
  %186 = trunc i64 %185 to i32
  %187 = sext i32 %186 to i64
  %188 = mul nsw i64 %183, %187
  %189 = add nsw i64 %179, %188
  %190 = getelementptr inbounds i64, i64* %1, i64 1
  %191 = load i64, i64* %190, align 8
  %192 = trunc i64 %191 to i32
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i64, i64* %1, i64 6
  %195 = load i64, i64* %194, align 8
  %196 = trunc i64 %195 to i32
  %197 = sext i32 %196 to i64
  %198 = mul nsw i64 %193, %197
  %199 = add nsw i64 %189, %198
  %200 = getelementptr inbounds i64, i64* %1, i64 0
  %201 = load i64, i64* %200, align 8
  %202 = trunc i64 %201 to i32
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds i64, i64* %1, i64 7
  %205 = load i64, i64* %204, align 8
  %206 = trunc i64 %205 to i32
  %207 = sext i32 %206 to i64
  %208 = mul nsw i64 %203, %207
  %209 = add nsw i64 %199, %208
  %210 = mul nsw i64 2, %209
  %211 = getelementptr inbounds i64, i64* %0, i64 7
  store i64 %210, i64* %211, align 8
  %212 = getelementptr inbounds i64, i64* %1, i64 4
  %213 = load i64, i64* %212, align 8
  %214 = trunc i64 %213 to i32
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds i64, i64* %1, i64 4
  %217 = load i64, i64* %216, align 8
  %218 = trunc i64 %217 to i32
  %219 = sext i32 %218 to i64
  %220 = mul nsw i64 %215, %219
  %221 = getelementptr inbounds i64, i64* %1, i64 2
  %222 = load i64, i64* %221, align 8
  %223 = trunc i64 %222 to i32
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds i64, i64* %1, i64 6
  %226 = load i64, i64* %225, align 8
  %227 = trunc i64 %226 to i32
  %228 = sext i32 %227 to i64
  %229 = mul nsw i64 %224, %228
  %230 = getelementptr inbounds i64, i64* %1, i64 0
  %231 = load i64, i64* %230, align 8
  %232 = trunc i64 %231 to i32
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds i64, i64* %1, i64 8
  %235 = load i64, i64* %234, align 8
  %236 = trunc i64 %235 to i32
  %237 = sext i32 %236 to i64
  %238 = mul nsw i64 %233, %237
  %239 = add nsw i64 %229, %238
  %240 = getelementptr inbounds i64, i64* %1, i64 1
  %241 = load i64, i64* %240, align 8
  %242 = trunc i64 %241 to i32
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds i64, i64* %1, i64 7
  %245 = load i64, i64* %244, align 8
  %246 = trunc i64 %245 to i32
  %247 = sext i32 %246 to i64
  %248 = mul nsw i64 %243, %247
  %249 = getelementptr inbounds i64, i64* %1, i64 3
  %250 = load i64, i64* %249, align 8
  %251 = trunc i64 %250 to i32
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds i64, i64* %1, i64 5
  %254 = load i64, i64* %253, align 8
  %255 = trunc i64 %254 to i32
  %256 = sext i32 %255 to i64
  %257 = mul nsw i64 %252, %256
  %258 = add nsw i64 %248, %257
  %259 = mul nsw i64 2, %258
  %260 = add nsw i64 %239, %259
  %261 = mul nsw i64 2, %260
  %262 = add nsw i64 %220, %261
  %263 = getelementptr inbounds i64, i64* %0, i64 8
  store i64 %262, i64* %263, align 8
  %264 = getelementptr inbounds i64, i64* %1, i64 4
  %265 = load i64, i64* %264, align 8
  %266 = trunc i64 %265 to i32
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds i64, i64* %1, i64 5
  %269 = load i64, i64* %268, align 8
  %270 = trunc i64 %269 to i32
  %271 = sext i32 %270 to i64
  %272 = mul nsw i64 %267, %271
  %273 = getelementptr inbounds i64, i64* %1, i64 3
  %274 = load i64, i64* %273, align 8
  %275 = trunc i64 %274 to i32
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds i64, i64* %1, i64 6
  %278 = load i64, i64* %277, align 8
  %279 = trunc i64 %278 to i32
  %280 = sext i32 %279 to i64
  %281 = mul nsw i64 %276, %280
  %282 = add nsw i64 %272, %281
  %283 = getelementptr inbounds i64, i64* %1, i64 2
  %284 = load i64, i64* %283, align 8
  %285 = trunc i64 %284 to i32
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds i64, i64* %1, i64 7
  %288 = load i64, i64* %287, align 8
  %289 = trunc i64 %288 to i32
  %290 = sext i32 %289 to i64
  %291 = mul nsw i64 %286, %290
  %292 = add nsw i64 %282, %291
  %293 = getelementptr inbounds i64, i64* %1, i64 1
  %294 = load i64, i64* %293, align 8
  %295 = trunc i64 %294 to i32
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds i64, i64* %1, i64 8
  %298 = load i64, i64* %297, align 8
  %299 = trunc i64 %298 to i32
  %300 = sext i32 %299 to i64
  %301 = mul nsw i64 %296, %300
  %302 = add nsw i64 %292, %301
  %303 = getelementptr inbounds i64, i64* %1, i64 0
  %304 = load i64, i64* %303, align 8
  %305 = trunc i64 %304 to i32
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds i64, i64* %1, i64 9
  %308 = load i64, i64* %307, align 8
  %309 = trunc i64 %308 to i32
  %310 = sext i32 %309 to i64
  %311 = mul nsw i64 %306, %310
  %312 = add nsw i64 %302, %311
  %313 = mul nsw i64 2, %312
  %314 = getelementptr inbounds i64, i64* %0, i64 9
  store i64 %313, i64* %314, align 8
  %315 = getelementptr inbounds i64, i64* %1, i64 5
  %316 = load i64, i64* %315, align 8
  %317 = trunc i64 %316 to i32
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds i64, i64* %1, i64 5
  %320 = load i64, i64* %319, align 8
  %321 = trunc i64 %320 to i32
  %322 = sext i32 %321 to i64
  %323 = mul nsw i64 %318, %322
  %324 = getelementptr inbounds i64, i64* %1, i64 4
  %325 = load i64, i64* %324, align 8
  %326 = trunc i64 %325 to i32
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds i64, i64* %1, i64 6
  %329 = load i64, i64* %328, align 8
  %330 = trunc i64 %329 to i32
  %331 = sext i32 %330 to i64
  %332 = mul nsw i64 %327, %331
  %333 = add nsw i64 %323, %332
  %334 = getelementptr inbounds i64, i64* %1, i64 2
  %335 = load i64, i64* %334, align 8
  %336 = trunc i64 %335 to i32
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds i64, i64* %1, i64 8
  %339 = load i64, i64* %338, align 8
  %340 = trunc i64 %339 to i32
  %341 = sext i32 %340 to i64
  %342 = mul nsw i64 %337, %341
  %343 = add nsw i64 %333, %342
  %344 = getelementptr inbounds i64, i64* %1, i64 3
  %345 = load i64, i64* %344, align 8
  %346 = trunc i64 %345 to i32
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds i64, i64* %1, i64 7
  %349 = load i64, i64* %348, align 8
  %350 = trunc i64 %349 to i32
  %351 = sext i32 %350 to i64
  %352 = mul nsw i64 %347, %351
  %353 = getelementptr inbounds i64, i64* %1, i64 1
  %354 = load i64, i64* %353, align 8
  %355 = trunc i64 %354 to i32
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds i64, i64* %1, i64 9
  %358 = load i64, i64* %357, align 8
  %359 = trunc i64 %358 to i32
  %360 = sext i32 %359 to i64
  %361 = mul nsw i64 %356, %360
  %362 = add nsw i64 %352, %361
  %363 = mul nsw i64 2, %362
  %364 = add nsw i64 %343, %363
  %365 = mul nsw i64 2, %364
  %366 = getelementptr inbounds i64, i64* %0, i64 10
  store i64 %365, i64* %366, align 8
  %367 = getelementptr inbounds i64, i64* %1, i64 5
  %368 = load i64, i64* %367, align 8
  %369 = trunc i64 %368 to i32
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds i64, i64* %1, i64 6
  %372 = load i64, i64* %371, align 8
  %373 = trunc i64 %372 to i32
  %374 = sext i32 %373 to i64
  %375 = mul nsw i64 %370, %374
  %376 = getelementptr inbounds i64, i64* %1, i64 4
  %377 = load i64, i64* %376, align 8
  %378 = trunc i64 %377 to i32
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds i64, i64* %1, i64 7
  %381 = load i64, i64* %380, align 8
  %382 = trunc i64 %381 to i32
  %383 = sext i32 %382 to i64
  %384 = mul nsw i64 %379, %383
  %385 = add nsw i64 %375, %384
  %386 = getelementptr inbounds i64, i64* %1, i64 3
  %387 = load i64, i64* %386, align 8
  %388 = trunc i64 %387 to i32
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds i64, i64* %1, i64 8
  %391 = load i64, i64* %390, align 8
  %392 = trunc i64 %391 to i32
  %393 = sext i32 %392 to i64
  %394 = mul nsw i64 %389, %393
  %395 = add nsw i64 %385, %394
  %396 = getelementptr inbounds i64, i64* %1, i64 2
  %397 = load i64, i64* %396, align 8
  %398 = trunc i64 %397 to i32
  %399 = sext i32 %398 to i64
  %400 = getelementptr inbounds i64, i64* %1, i64 9
  %401 = load i64, i64* %400, align 8
  %402 = trunc i64 %401 to i32
  %403 = sext i32 %402 to i64
  %404 = mul nsw i64 %399, %403
  %405 = add nsw i64 %395, %404
  %406 = mul nsw i64 2, %405
  %407 = getelementptr inbounds i64, i64* %0, i64 11
  store i64 %406, i64* %407, align 8
  %408 = getelementptr inbounds i64, i64* %1, i64 6
  %409 = load i64, i64* %408, align 8
  %410 = trunc i64 %409 to i32
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds i64, i64* %1, i64 6
  %413 = load i64, i64* %412, align 8
  %414 = trunc i64 %413 to i32
  %415 = sext i32 %414 to i64
  %416 = mul nsw i64 %411, %415
  %417 = getelementptr inbounds i64, i64* %1, i64 4
  %418 = load i64, i64* %417, align 8
  %419 = trunc i64 %418 to i32
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds i64, i64* %1, i64 8
  %422 = load i64, i64* %421, align 8
  %423 = trunc i64 %422 to i32
  %424 = sext i32 %423 to i64
  %425 = mul nsw i64 %420, %424
  %426 = getelementptr inbounds i64, i64* %1, i64 5
  %427 = load i64, i64* %426, align 8
  %428 = trunc i64 %427 to i32
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds i64, i64* %1, i64 7
  %431 = load i64, i64* %430, align 8
  %432 = trunc i64 %431 to i32
  %433 = sext i32 %432 to i64
  %434 = mul nsw i64 %429, %433
  %435 = getelementptr inbounds i64, i64* %1, i64 3
  %436 = load i64, i64* %435, align 8
  %437 = trunc i64 %436 to i32
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds i64, i64* %1, i64 9
  %440 = load i64, i64* %439, align 8
  %441 = trunc i64 %440 to i32
  %442 = sext i32 %441 to i64
  %443 = mul nsw i64 %438, %442
  %444 = add nsw i64 %434, %443
  %445 = mul nsw i64 2, %444
  %446 = add nsw i64 %425, %445
  %447 = mul nsw i64 2, %446
  %448 = add nsw i64 %416, %447
  %449 = getelementptr inbounds i64, i64* %0, i64 12
  store i64 %448, i64* %449, align 8
  %450 = getelementptr inbounds i64, i64* %1, i64 6
  %451 = load i64, i64* %450, align 8
  %452 = trunc i64 %451 to i32
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds i64, i64* %1, i64 7
  %455 = load i64, i64* %454, align 8
  %456 = trunc i64 %455 to i32
  %457 = sext i32 %456 to i64
  %458 = mul nsw i64 %453, %457
  %459 = getelementptr inbounds i64, i64* %1, i64 5
  %460 = load i64, i64* %459, align 8
  %461 = trunc i64 %460 to i32
  %462 = sext i32 %461 to i64
  %463 = getelementptr inbounds i64, i64* %1, i64 8
  %464 = load i64, i64* %463, align 8
  %465 = trunc i64 %464 to i32
  %466 = sext i32 %465 to i64
  %467 = mul nsw i64 %462, %466
  %468 = add nsw i64 %458, %467
  %469 = getelementptr inbounds i64, i64* %1, i64 4
  %470 = load i64, i64* %469, align 8
  %471 = trunc i64 %470 to i32
  %472 = sext i32 %471 to i64
  %473 = getelementptr inbounds i64, i64* %1, i64 9
  %474 = load i64, i64* %473, align 8
  %475 = trunc i64 %474 to i32
  %476 = sext i32 %475 to i64
  %477 = mul nsw i64 %472, %476
  %478 = add nsw i64 %468, %477
  %479 = mul nsw i64 2, %478
  %480 = getelementptr inbounds i64, i64* %0, i64 13
  store i64 %479, i64* %480, align 8
  %481 = getelementptr inbounds i64, i64* %1, i64 7
  %482 = load i64, i64* %481, align 8
  %483 = trunc i64 %482 to i32
  %484 = sext i32 %483 to i64
  %485 = getelementptr inbounds i64, i64* %1, i64 7
  %486 = load i64, i64* %485, align 8
  %487 = trunc i64 %486 to i32
  %488 = sext i32 %487 to i64
  %489 = mul nsw i64 %484, %488
  %490 = getelementptr inbounds i64, i64* %1, i64 6
  %491 = load i64, i64* %490, align 8
  %492 = trunc i64 %491 to i32
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds i64, i64* %1, i64 8
  %495 = load i64, i64* %494, align 8
  %496 = trunc i64 %495 to i32
  %497 = sext i32 %496 to i64
  %498 = mul nsw i64 %493, %497
  %499 = add nsw i64 %489, %498
  %500 = getelementptr inbounds i64, i64* %1, i64 5
  %501 = load i64, i64* %500, align 8
  %502 = trunc i64 %501 to i32
  %503 = sext i32 %502 to i64
  %504 = mul nsw i64 2, %503
  %505 = getelementptr inbounds i64, i64* %1, i64 9
  %506 = load i64, i64* %505, align 8
  %507 = trunc i64 %506 to i32
  %508 = sext i32 %507 to i64
  %509 = mul nsw i64 %504, %508
  %510 = add nsw i64 %499, %509
  %511 = mul nsw i64 2, %510
  %512 = getelementptr inbounds i64, i64* %0, i64 14
  store i64 %511, i64* %512, align 8
  %513 = getelementptr inbounds i64, i64* %1, i64 7
  %514 = load i64, i64* %513, align 8
  %515 = trunc i64 %514 to i32
  %516 = sext i32 %515 to i64
  %517 = getelementptr inbounds i64, i64* %1, i64 8
  %518 = load i64, i64* %517, align 8
  %519 = trunc i64 %518 to i32
  %520 = sext i32 %519 to i64
  %521 = mul nsw i64 %516, %520
  %522 = getelementptr inbounds i64, i64* %1, i64 6
  %523 = load i64, i64* %522, align 8
  %524 = trunc i64 %523 to i32
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds i64, i64* %1, i64 9
  %527 = load i64, i64* %526, align 8
  %528 = trunc i64 %527 to i32
  %529 = sext i32 %528 to i64
  %530 = mul nsw i64 %525, %529
  %531 = add nsw i64 %521, %530
  %532 = mul nsw i64 2, %531
  %533 = getelementptr inbounds i64, i64* %0, i64 15
  store i64 %532, i64* %533, align 8
  %534 = getelementptr inbounds i64, i64* %1, i64 8
  %535 = load i64, i64* %534, align 8
  %536 = trunc i64 %535 to i32
  %537 = sext i32 %536 to i64
  %538 = getelementptr inbounds i64, i64* %1, i64 8
  %539 = load i64, i64* %538, align 8
  %540 = trunc i64 %539 to i32
  %541 = sext i32 %540 to i64
  %542 = mul nsw i64 %537, %541
  %543 = getelementptr inbounds i64, i64* %1, i64 7
  %544 = load i64, i64* %543, align 8
  %545 = trunc i64 %544 to i32
  %546 = sext i32 %545 to i64
  %547 = mul nsw i64 4, %546
  %548 = getelementptr inbounds i64, i64* %1, i64 9
  %549 = load i64, i64* %548, align 8
  %550 = trunc i64 %549 to i32
  %551 = sext i32 %550 to i64
  %552 = mul nsw i64 %547, %551
  %553 = add nsw i64 %542, %552
  %554 = getelementptr inbounds i64, i64* %0, i64 16
  store i64 %553, i64* %554, align 8
  %555 = getelementptr inbounds i64, i64* %1, i64 8
  %556 = load i64, i64* %555, align 8
  %557 = trunc i64 %556 to i32
  %558 = sext i32 %557 to i64
  %559 = mul nsw i64 2, %558
  %560 = getelementptr inbounds i64, i64* %1, i64 9
  %561 = load i64, i64* %560, align 8
  %562 = trunc i64 %561 to i32
  %563 = sext i32 %562 to i64
  %564 = mul nsw i64 %559, %563
  %565 = getelementptr inbounds i64, i64* %0, i64 17
  store i64 %564, i64* %565, align 8
  %566 = getelementptr inbounds i64, i64* %1, i64 9
  %567 = load i64, i64* %566, align 8
  %568 = trunc i64 %567 to i32
  %569 = sext i32 %568 to i64
  %570 = mul nsw i64 2, %569
  %571 = getelementptr inbounds i64, i64* %1, i64 9
  %572 = load i64, i64* %571, align 8
  %573 = trunc i64 %572 to i32
  %574 = sext i32 %573 to i64
  %575 = mul nsw i64 %570, %574
  %576 = getelementptr inbounds i64, i64* %0, i64 18
  store i64 %575, i64* %576, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @swap_conditional(i64* %0, i64* %1, i64 %2) #0 {
  %4 = icmp eq i64 %2, 1
  br i1 %4, label %.loopexit, label %81

.loopexit:                                        ; preds = %3
  %5 = load i64, i64* %0, align 8
  %6 = trunc i64 %5 to i32
  %7 = load i64, i64* %1, align 8
  store i64 %7, i64* %0, align 8
  %8 = sext i32 %6 to i64
  store i64 %8, i64* %1, align 8
  %9 = getelementptr inbounds i64, i64* %0, i64 1
  %10 = load i64, i64* %9, align 8
  %11 = trunc i64 %10 to i32
  %12 = getelementptr inbounds i64, i64* %1, i64 1
  %13 = load i64, i64* %12, align 8
  %14 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %13, i64* %14, align 8
  %15 = sext i32 %11 to i64
  %16 = getelementptr inbounds i64, i64* %1, i64 1
  store i64 %15, i64* %16, align 8
  %17 = getelementptr inbounds i64, i64* %0, i64 2
  %18 = load i64, i64* %17, align 8
  %19 = trunc i64 %18 to i32
  %20 = getelementptr inbounds i64, i64* %1, i64 2
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %21, i64* %22, align 8
  %23 = sext i32 %19 to i64
  %24 = getelementptr inbounds i64, i64* %1, i64 2
  store i64 %23, i64* %24, align 8
  %25 = getelementptr inbounds i64, i64* %0, i64 3
  %26 = load i64, i64* %25, align 8
  %27 = trunc i64 %26 to i32
  %28 = getelementptr inbounds i64, i64* %1, i64 3
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds i64, i64* %0, i64 3
  store i64 %29, i64* %30, align 8
  %31 = sext i32 %27 to i64
  %32 = getelementptr inbounds i64, i64* %1, i64 3
  store i64 %31, i64* %32, align 8
  %33 = getelementptr inbounds i64, i64* %0, i64 4
  %34 = load i64, i64* %33, align 8
  %35 = trunc i64 %34 to i32
  %36 = getelementptr inbounds i64, i64* %1, i64 4
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds i64, i64* %0, i64 4
  store i64 %37, i64* %38, align 8
  %39 = sext i32 %35 to i64
  %40 = getelementptr inbounds i64, i64* %1, i64 4
  store i64 %39, i64* %40, align 8
  %41 = getelementptr inbounds i64, i64* %0, i64 5
  %42 = load i64, i64* %41, align 8
  %43 = trunc i64 %42 to i32
  %44 = getelementptr inbounds i64, i64* %1, i64 5
  %45 = load i64, i64* %44, align 8
  %46 = getelementptr inbounds i64, i64* %0, i64 5
  store i64 %45, i64* %46, align 8
  %47 = sext i32 %43 to i64
  %48 = getelementptr inbounds i64, i64* %1, i64 5
  store i64 %47, i64* %48, align 8
  %49 = getelementptr inbounds i64, i64* %0, i64 6
  %50 = load i64, i64* %49, align 8
  %51 = trunc i64 %50 to i32
  %52 = getelementptr inbounds i64, i64* %1, i64 6
  %53 = load i64, i64* %52, align 8
  %54 = getelementptr inbounds i64, i64* %0, i64 6
  store i64 %53, i64* %54, align 8
  %55 = sext i32 %51 to i64
  %56 = getelementptr inbounds i64, i64* %1, i64 6
  store i64 %55, i64* %56, align 8
  %57 = getelementptr inbounds i64, i64* %0, i64 7
  %58 = load i64, i64* %57, align 8
  %59 = trunc i64 %58 to i32
  %60 = getelementptr inbounds i64, i64* %1, i64 7
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds i64, i64* %0, i64 7
  store i64 %61, i64* %62, align 8
  %63 = sext i32 %59 to i64
  %64 = getelementptr inbounds i64, i64* %1, i64 7
  store i64 %63, i64* %64, align 8
  %65 = getelementptr inbounds i64, i64* %0, i64 8
  %66 = load i64, i64* %65, align 8
  %67 = trunc i64 %66 to i32
  %68 = getelementptr inbounds i64, i64* %1, i64 8
  %69 = load i64, i64* %68, align 8
  %70 = getelementptr inbounds i64, i64* %0, i64 8
  store i64 %69, i64* %70, align 8
  %71 = sext i32 %67 to i64
  %72 = getelementptr inbounds i64, i64* %1, i64 8
  store i64 %71, i64* %72, align 8
  %73 = getelementptr inbounds i64, i64* %0, i64 9
  %74 = load i64, i64* %73, align 8
  %75 = trunc i64 %74 to i32
  %76 = getelementptr inbounds i64, i64* %1, i64 9
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds i64, i64* %0, i64 9
  store i64 %77, i64* %78, align 8
  %79 = sext i32 %75 to i64
  %80 = getelementptr inbounds i64, i64* %1, i64 9
  store i64 %79, i64* %80, align 8
  br label %81

81:                                               ; preds = %.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @fmonty(i64* %0, i64* %1, i64* %2, i64* %3, i64* %4, i64* %5, i64* %6, i64* %7, i64* %8) #0 {
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
  %20 = bitcast i64* %19 to i8*
  %21 = bitcast i64* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %20, i8* align 8 %21, i64 80, i1 false)
  call void @fsum(i64* %4, i64* %5)
  %22 = getelementptr inbounds [10 x i64], [10 x i64]* %10, i64 0, i64 0
  call void @fdifference(i64* %5, i64* %22)
  %23 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %24 = bitcast i64* %23 to i8*
  %25 = bitcast i64* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %24, i8* align 8 %25, i64 80, i1 false)
  call void @fsum(i64* %6, i64* %7)
  %26 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fdifference(i64* %7, i64* %26)
  %27 = getelementptr inbounds [19 x i64], [19 x i64]* %15, i64 0, i64 0
  call void @fproduct(i64* %27, i64* %6, i64* %5)
  %28 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @fproduct(i64* %28, i64* %4, i64* %7)
  %29 = getelementptr inbounds [19 x i64], [19 x i64]* %15, i64 0, i64 0
  call void @freduce_degree(i64* %29)
  %30 = getelementptr inbounds [19 x i64], [19 x i64]* %15, i64 0, i64 0
  call void @freduce_coefficients(i64* %30)
  %31 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @freduce_degree(i64* %31)
  %32 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @freduce_coefficients(i64* %32)
  %33 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %34 = bitcast i64* %33 to i8*
  %35 = getelementptr inbounds [19 x i64], [19 x i64]* %15, i64 0, i64 0
  %36 = bitcast i64* %35 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %34, i8* align 16 %36, i64 80, i1 false)
  %37 = getelementptr inbounds [19 x i64], [19 x i64]* %15, i64 0, i64 0
  %38 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @fsum(i64* %37, i64* %38)
  %39 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  %40 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fdifference(i64* %39, i64* %40)
  %41 = getelementptr inbounds [19 x i64], [19 x i64]* %18, i64 0, i64 0
  %42 = getelementptr inbounds [19 x i64], [19 x i64]* %15, i64 0, i64 0
  call void @fsquare(i64* %41, i64* %42)
  %43 = getelementptr inbounds [19 x i64], [19 x i64]* %17, i64 0, i64 0
  %44 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @fsquare(i64* %43, i64* %44)
  %45 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  %46 = getelementptr inbounds [19 x i64], [19 x i64]* %17, i64 0, i64 0
  call void @fproduct(i64* %45, i64* %46, i64* %8)
  %47 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @freduce_degree(i64* %47)
  %48 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @freduce_coefficients(i64* %48)
  %49 = bitcast i64* %2 to i8*
  %50 = getelementptr inbounds [19 x i64], [19 x i64]* %18, i64 0, i64 0
  %51 = bitcast i64* %50 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %49, i8* align 16 %51, i64 80, i1 false)
  %52 = bitcast i64* %3 to i8*
  %53 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  %54 = bitcast i64* %53 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %52, i8* align 16 %54, i64 80, i1 false)
  %55 = getelementptr inbounds [19 x i64], [19 x i64]* %13, i64 0, i64 0
  call void @fsquare(i64* %55, i64* %4)
  %56 = getelementptr inbounds [19 x i64], [19 x i64]* %14, i64 0, i64 0
  call void @fsquare(i64* %56, i64* %5)
  %57 = getelementptr inbounds [19 x i64], [19 x i64]* %13, i64 0, i64 0
  %58 = getelementptr inbounds [19 x i64], [19 x i64]* %14, i64 0, i64 0
  call void @fproduct(i64* %0, i64* %57, i64* %58)
  call void @freduce_degree(i64* %0)
  call void @freduce_coefficients(i64* %0)
  %59 = getelementptr inbounds [19 x i64], [19 x i64]* %14, i64 0, i64 0
  %60 = getelementptr inbounds [19 x i64], [19 x i64]* %13, i64 0, i64 0
  call void @fdifference(i64* %59, i64* %60)
  %61 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  %62 = getelementptr inbounds i64, i64* %61, i64 10
  %63 = bitcast i64* %62 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %63, i8 0, i64 72, i1 false)
  %64 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  %65 = getelementptr inbounds [19 x i64], [19 x i64]* %14, i64 0, i64 0
  call void @fscalar_product(i64* %64, i64* %65, i64 121665)
  %66 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  call void @freduce_coefficients(i64* %66)
  %67 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  %68 = getelementptr inbounds [19 x i64], [19 x i64]* %13, i64 0, i64 0
  call void @fsum(i64* %67, i64* %68)
  %69 = getelementptr inbounds [19 x i64], [19 x i64]* %14, i64 0, i64 0
  %70 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  call void @fproduct(i64* %1, i64* %69, i64* %70)
  call void @freduce_degree(i64* %1)
  call void @freduce_coefficients(i64* %1)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @fsum(i64* %0, i64* %1) #0 {
  %3 = load i64, i64* %0, align 8
  %4 = load i64, i64* %1, align 8
  %5 = add nsw i64 %3, %4
  store i64 %5, i64* %0, align 8
  %6 = getelementptr inbounds i64, i64* %0, i64 1
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds i64, i64* %1, i64 1
  %9 = load i64, i64* %8, align 8
  %10 = add nsw i64 %7, %9
  %11 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %10, i64* %11, align 8
  %12 = getelementptr inbounds i64, i64* %0, i64 2
  %13 = load i64, i64* %12, align 8
  %14 = getelementptr inbounds i64, i64* %1, i64 2
  %15 = load i64, i64* %14, align 8
  %16 = add nsw i64 %13, %15
  %17 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %16, i64* %17, align 8
  %18 = getelementptr inbounds i64, i64* %0, i64 3
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds i64, i64* %1, i64 3
  %21 = load i64, i64* %20, align 8
  %22 = add nsw i64 %19, %21
  %23 = getelementptr inbounds i64, i64* %0, i64 3
  store i64 %22, i64* %23, align 8
  %24 = getelementptr inbounds i64, i64* %0, i64 4
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds i64, i64* %1, i64 4
  %27 = load i64, i64* %26, align 8
  %28 = add nsw i64 %25, %27
  %29 = getelementptr inbounds i64, i64* %0, i64 4
  store i64 %28, i64* %29, align 8
  %30 = getelementptr inbounds i64, i64* %0, i64 5
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds i64, i64* %1, i64 5
  %33 = load i64, i64* %32, align 8
  %34 = add nsw i64 %31, %33
  %35 = getelementptr inbounds i64, i64* %0, i64 5
  store i64 %34, i64* %35, align 8
  %36 = getelementptr inbounds i64, i64* %0, i64 6
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds i64, i64* %1, i64 6
  %39 = load i64, i64* %38, align 8
  %40 = add nsw i64 %37, %39
  %41 = getelementptr inbounds i64, i64* %0, i64 6
  store i64 %40, i64* %41, align 8
  %42 = getelementptr inbounds i64, i64* %0, i64 7
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds i64, i64* %1, i64 7
  %45 = load i64, i64* %44, align 8
  %46 = add nsw i64 %43, %45
  %47 = getelementptr inbounds i64, i64* %0, i64 7
  store i64 %46, i64* %47, align 8
  %48 = getelementptr inbounds i64, i64* %0, i64 8
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds i64, i64* %1, i64 8
  %51 = load i64, i64* %50, align 8
  %52 = add nsw i64 %49, %51
  %53 = getelementptr inbounds i64, i64* %0, i64 8
  store i64 %52, i64* %53, align 8
  %54 = getelementptr inbounds i64, i64* %0, i64 9
  %55 = load i64, i64* %54, align 8
  %56 = getelementptr inbounds i64, i64* %1, i64 9
  %57 = load i64, i64* %56, align 8
  %58 = add nsw i64 %55, %57
  %59 = getelementptr inbounds i64, i64* %0, i64 9
  store i64 %58, i64* %59, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @fdifference(i64* %0, i64* %1) #0 {
  %3 = load i64, i64* %1, align 8
  %4 = load i64, i64* %0, align 8
  %5 = sub nsw i64 %3, %4
  store i64 %5, i64* %0, align 8
  %6 = getelementptr inbounds i64, i64* %1, i64 1
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds i64, i64* %0, i64 1
  %9 = load i64, i64* %8, align 8
  %10 = sub nsw i64 %7, %9
  %11 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %10, i64* %11, align 8
  %12 = getelementptr inbounds i64, i64* %1, i64 2
  %13 = load i64, i64* %12, align 8
  %14 = getelementptr inbounds i64, i64* %0, i64 2
  %15 = load i64, i64* %14, align 8
  %16 = sub nsw i64 %13, %15
  %17 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %16, i64* %17, align 8
  %18 = getelementptr inbounds i64, i64* %1, i64 3
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds i64, i64* %0, i64 3
  %21 = load i64, i64* %20, align 8
  %22 = sub nsw i64 %19, %21
  %23 = getelementptr inbounds i64, i64* %0, i64 3
  store i64 %22, i64* %23, align 8
  %24 = getelementptr inbounds i64, i64* %1, i64 4
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds i64, i64* %0, i64 4
  %27 = load i64, i64* %26, align 8
  %28 = sub nsw i64 %25, %27
  %29 = getelementptr inbounds i64, i64* %0, i64 4
  store i64 %28, i64* %29, align 8
  %30 = getelementptr inbounds i64, i64* %1, i64 5
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds i64, i64* %0, i64 5
  %33 = load i64, i64* %32, align 8
  %34 = sub nsw i64 %31, %33
  %35 = getelementptr inbounds i64, i64* %0, i64 5
  store i64 %34, i64* %35, align 8
  %36 = getelementptr inbounds i64, i64* %1, i64 6
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds i64, i64* %0, i64 6
  %39 = load i64, i64* %38, align 8
  %40 = sub nsw i64 %37, %39
  %41 = getelementptr inbounds i64, i64* %0, i64 6
  store i64 %40, i64* %41, align 8
  %42 = getelementptr inbounds i64, i64* %1, i64 7
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds i64, i64* %0, i64 7
  %45 = load i64, i64* %44, align 8
  %46 = sub nsw i64 %43, %45
  %47 = getelementptr inbounds i64, i64* %0, i64 7
  store i64 %46, i64* %47, align 8
  %48 = getelementptr inbounds i64, i64* %1, i64 8
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds i64, i64* %0, i64 8
  %51 = load i64, i64* %50, align 8
  %52 = sub nsw i64 %49, %51
  %53 = getelementptr inbounds i64, i64* %0, i64 8
  store i64 %52, i64* %53, align 8
  %54 = getelementptr inbounds i64, i64* %1, i64 9
  %55 = load i64, i64* %54, align 8
  %56 = getelementptr inbounds i64, i64* %0, i64 9
  %57 = load i64, i64* %56, align 8
  %58 = sub nsw i64 %55, %57
  %59 = getelementptr inbounds i64, i64* %0, i64 9
  store i64 %58, i64* %59, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @fscalar_product(i64* %0, i64* %1, i64 %2) #0 {
  %4 = load i64, i64* %1, align 8
  %5 = mul nsw i64 %4, %2
  store i64 %5, i64* %0, align 8
  %6 = getelementptr inbounds i64, i64* %1, i64 1
  %7 = load i64, i64* %6, align 8
  %8 = mul nsw i64 %7, %2
  %9 = getelementptr inbounds i64, i64* %0, i64 1
  store i64 %8, i64* %9, align 8
  %10 = getelementptr inbounds i64, i64* %1, i64 2
  %11 = load i64, i64* %10, align 8
  %12 = mul nsw i64 %11, %2
  %13 = getelementptr inbounds i64, i64* %0, i64 2
  store i64 %12, i64* %13, align 8
  %14 = getelementptr inbounds i64, i64* %1, i64 3
  %15 = load i64, i64* %14, align 8
  %16 = mul nsw i64 %15, %2
  %17 = getelementptr inbounds i64, i64* %0, i64 3
  store i64 %16, i64* %17, align 8
  %18 = getelementptr inbounds i64, i64* %1, i64 4
  %19 = load i64, i64* %18, align 8
  %20 = mul nsw i64 %19, %2
  %21 = getelementptr inbounds i64, i64* %0, i64 4
  store i64 %20, i64* %21, align 8
  %22 = getelementptr inbounds i64, i64* %1, i64 5
  %23 = load i64, i64* %22, align 8
  %24 = mul nsw i64 %23, %2
  %25 = getelementptr inbounds i64, i64* %0, i64 5
  store i64 %24, i64* %25, align 8
  %26 = getelementptr inbounds i64, i64* %1, i64 6
  %27 = load i64, i64* %26, align 8
  %28 = mul nsw i64 %27, %2
  %29 = getelementptr inbounds i64, i64* %0, i64 6
  store i64 %28, i64* %29, align 8
  %30 = getelementptr inbounds i64, i64* %1, i64 7
  %31 = load i64, i64* %30, align 8
  %32 = mul nsw i64 %31, %2
  %33 = getelementptr inbounds i64, i64* %0, i64 7
  store i64 %32, i64* %33, align 8
  %34 = getelementptr inbounds i64, i64* %1, i64 8
  %35 = load i64, i64* %34, align 8
  %36 = mul nsw i64 %35, %2
  %37 = getelementptr inbounds i64, i64* %0, i64 8
  store i64 %36, i64* %37, align 8
  %38 = getelementptr inbounds i64, i64* %1, i64 9
  %39 = load i64, i64* %38, align 8
  %40 = mul nsw i64 %39, %2
  %41 = getelementptr inbounds i64, i64* %0, i64 9
  store i64 %40, i64* %41, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @randombytes(i8* %0, i64 %1) #0 {
  %3 = icmp sge i64 %1, 0
  br i1 %3, label %5, label %4

4:                                                ; preds = %2
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.1, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__PRETTY_FUNCTION__.randombytes, i64 0, i64 0)) #4
  unreachable

5:                                                ; preds = %2
  %6 = load i32, i32* @randombytes.fd, align 4
  %7 = icmp eq i32 %6, -1
  br i1 %7, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %5
  %8 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %8, i32* @randombytes.fd, align 4
  %9 = load i32, i32* @randombytes.fd, align 4
  %10 = icmp ne i32 %9, -1
  br i1 %10, label %.loopexit, label %.lr.ph7.preheader

.lr.ph7.preheader:                                ; preds = %.preheader
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %106, %.lr.ph7.preheader
  %11 = call i32 @sleep(i32 1)
  %12 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %12, i32* @randombytes.fd, align 4
  %13 = load i32, i32* @randombytes.fd, align 4
  %14 = icmp ne i32 %13, -1
  br i1 %14, label %.loopexit.loopexit, label %76

.loopexit.loopexit:                               ; preds = %106, %101, %96, %91, %86, %81, %76, %.lr.ph7
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %5
  %15 = icmp sgt i64 %1, 0
  br i1 %15, label %.lr.ph.preheader, label %.outer._crit_edge

.lr.ph.preheader:                                 ; preds = %.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.outer, %.lr.ph.preheader
  %16 = phi i1 [ %26, %.outer ], [ %15, %.lr.ph.preheader ]
  %.0.ph6 = phi i8* [ %24, %.outer ], [ %0, %.lr.ph.preheader ]
  %.01.ph5 = phi i64 [ %25, %.outer ], [ %1, %.lr.ph.preheader ]
  br label %17

17:                                               ; preds = %74, %.lr.ph
  %18 = icmp slt i64 %.01.ph5, 1048576
  %.01. = select i1 %18, i64 %.01.ph5, i64 1048576
  %19 = load i32, i32* @randombytes.fd, align 4
  %20 = call i64 @read(i32 %19, i8* %.0.ph6, i64 %.01.)
  %21 = icmp slt i64 %20, 1
  br i1 %21, label %22, label %.outer

22:                                               ; preds = %17
  %23 = call i32 @sleep(i32 1)
  br i1 %16, label %27, label %.outer._crit_edge.loopexit

.outer:                                           ; preds = %69, %62, %55, %48, %41, %34, %27, %17
  %.lcssa = phi i64 [ %20, %17 ], [ %30, %27 ], [ %37, %34 ], [ %44, %41 ], [ %51, %48 ], [ %58, %55 ], [ %65, %62 ], [ %72, %69 ]
  %24 = getelementptr inbounds i8, i8* %.0.ph6, i64 %.lcssa
  %25 = sub nsw i64 %.01.ph5, %.lcssa
  %26 = icmp sgt i64 %25, 0
  br i1 %26, label %.lr.ph, label %.outer._crit_edge.loopexit1

.outer._crit_edge.loopexit:                       ; preds = %74, %67, %60, %53, %46, %39, %32, %22
  br label %.outer._crit_edge

.outer._crit_edge.loopexit1:                      ; preds = %.outer
  br label %.outer._crit_edge

.outer._crit_edge:                                ; preds = %.outer._crit_edge.loopexit1, %.outer._crit_edge.loopexit, %.loopexit
  ret void

27:                                               ; preds = %22
  %28 = icmp slt i64 %.01.ph5, 1048576
  %.01..1 = select i1 %28, i64 %.01.ph5, i64 1048576
  %29 = load i32, i32* @randombytes.fd, align 4
  %30 = call i64 @read(i32 %29, i8* %.0.ph6, i64 %.01..1)
  %31 = icmp slt i64 %30, 1
  br i1 %31, label %32, label %.outer

32:                                               ; preds = %27
  %33 = call i32 @sleep(i32 1)
  br i1 %16, label %34, label %.outer._crit_edge.loopexit

34:                                               ; preds = %32
  %35 = icmp slt i64 %.01.ph5, 1048576
  %.01..2 = select i1 %35, i64 %.01.ph5, i64 1048576
  %36 = load i32, i32* @randombytes.fd, align 4
  %37 = call i64 @read(i32 %36, i8* %.0.ph6, i64 %.01..2)
  %38 = icmp slt i64 %37, 1
  br i1 %38, label %39, label %.outer

39:                                               ; preds = %34
  %40 = call i32 @sleep(i32 1)
  br i1 %16, label %41, label %.outer._crit_edge.loopexit

41:                                               ; preds = %39
  %42 = icmp slt i64 %.01.ph5, 1048576
  %.01..3 = select i1 %42, i64 %.01.ph5, i64 1048576
  %43 = load i32, i32* @randombytes.fd, align 4
  %44 = call i64 @read(i32 %43, i8* %.0.ph6, i64 %.01..3)
  %45 = icmp slt i64 %44, 1
  br i1 %45, label %46, label %.outer

46:                                               ; preds = %41
  %47 = call i32 @sleep(i32 1)
  br i1 %16, label %48, label %.outer._crit_edge.loopexit

48:                                               ; preds = %46
  %49 = icmp slt i64 %.01.ph5, 1048576
  %.01..4 = select i1 %49, i64 %.01.ph5, i64 1048576
  %50 = load i32, i32* @randombytes.fd, align 4
  %51 = call i64 @read(i32 %50, i8* %.0.ph6, i64 %.01..4)
  %52 = icmp slt i64 %51, 1
  br i1 %52, label %53, label %.outer

53:                                               ; preds = %48
  %54 = call i32 @sleep(i32 1)
  br i1 %16, label %55, label %.outer._crit_edge.loopexit

55:                                               ; preds = %53
  %56 = icmp slt i64 %.01.ph5, 1048576
  %.01..5 = select i1 %56, i64 %.01.ph5, i64 1048576
  %57 = load i32, i32* @randombytes.fd, align 4
  %58 = call i64 @read(i32 %57, i8* %.0.ph6, i64 %.01..5)
  %59 = icmp slt i64 %58, 1
  br i1 %59, label %60, label %.outer

60:                                               ; preds = %55
  %61 = call i32 @sleep(i32 1)
  br i1 %16, label %62, label %.outer._crit_edge.loopexit

62:                                               ; preds = %60
  %63 = icmp slt i64 %.01.ph5, 1048576
  %.01..6 = select i1 %63, i64 %.01.ph5, i64 1048576
  %64 = load i32, i32* @randombytes.fd, align 4
  %65 = call i64 @read(i32 %64, i8* %.0.ph6, i64 %.01..6)
  %66 = icmp slt i64 %65, 1
  br i1 %66, label %67, label %.outer

67:                                               ; preds = %62
  %68 = call i32 @sleep(i32 1)
  br i1 %16, label %69, label %.outer._crit_edge.loopexit

69:                                               ; preds = %67
  %70 = icmp slt i64 %.01.ph5, 1048576
  %.01..7 = select i1 %70, i64 %.01.ph5, i64 1048576
  %71 = load i32, i32* @randombytes.fd, align 4
  %72 = call i64 @read(i32 %71, i8* %.0.ph6, i64 %.01..7)
  %73 = icmp slt i64 %72, 1
  br i1 %73, label %74, label %.outer

74:                                               ; preds = %69
  %75 = call i32 @sleep(i32 1)
  br i1 %16, label %17, label %.outer._crit_edge.loopexit, !llvm.loop !4

76:                                               ; preds = %.lr.ph7
  %77 = call i32 @sleep(i32 1)
  %78 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %78, i32* @randombytes.fd, align 4
  %79 = load i32, i32* @randombytes.fd, align 4
  %80 = icmp ne i32 %79, -1
  br i1 %80, label %.loopexit.loopexit, label %81

81:                                               ; preds = %76
  %82 = call i32 @sleep(i32 1)
  %83 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %83, i32* @randombytes.fd, align 4
  %84 = load i32, i32* @randombytes.fd, align 4
  %85 = icmp ne i32 %84, -1
  br i1 %85, label %.loopexit.loopexit, label %86

86:                                               ; preds = %81
  %87 = call i32 @sleep(i32 1)
  %88 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %88, i32* @randombytes.fd, align 4
  %89 = load i32, i32* @randombytes.fd, align 4
  %90 = icmp ne i32 %89, -1
  br i1 %90, label %.loopexit.loopexit, label %91

91:                                               ; preds = %86
  %92 = call i32 @sleep(i32 1)
  %93 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %93, i32* @randombytes.fd, align 4
  %94 = load i32, i32* @randombytes.fd, align 4
  %95 = icmp ne i32 %94, -1
  br i1 %95, label %.loopexit.loopexit, label %96

96:                                               ; preds = %91
  %97 = call i32 @sleep(i32 1)
  %98 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %98, i32* @randombytes.fd, align 4
  %99 = load i32, i32* @randombytes.fd, align 4
  %100 = icmp ne i32 %99, -1
  br i1 %100, label %.loopexit.loopexit, label %101

101:                                              ; preds = %96
  %102 = call i32 @sleep(i32 1)
  %103 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %103, i32* @randombytes.fd, align 4
  %104 = load i32, i32* @randombytes.fd, align 4
  %105 = icmp ne i32 %104, -1
  br i1 %105, label %.loopexit.loopexit, label %106

106:                                              ; preds = %101
  %107 = call i32 @sleep(i32 1)
  %108 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %108, i32* @randombytes.fd, align 4
  %109 = load i32, i32* @randombytes.fd, align 4
  %110 = icmp ne i32 %109, -1
  br i1 %110, label %.loopexit.loopexit, label %.lr.ph7, !llvm.loop !6
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

declare i32 @open(i8*, i32, ...) #2

declare i32 @sleep(i32) #2

declare i64 @read(i32, i8*, i64) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i8 @randombit() #0 {
  %1 = alloca i8, align 1
  store i8 0, i8* %1, align 1
  call void @randombytes(i8* %1, i64 1)
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = and i32 %3, 1
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = distinct !{!6, !5}

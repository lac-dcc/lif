; ModuleID = 'dudect-examples/donnabad/llvm-ir/main2.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.input_data = private unnamed_addr constant [32 x i8] c"\91E\EE\0C\8A\BA\13\C5\AE\EB\A4\DC\BC?\E40X{\7F5\AB\09\96\A6AI\17\F4\D2qj\D6", align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@chunk_size = dso_local constant i64 32, align 8
@number_measurements = dso_local constant i64 1, align 8
@__const.do_one_computation.secret = private unnamed_addr constant <{ i8, i8, i8, [29 x i8] }> <{ i8 1, i8 2, i8 3, [29 x i8] zeroinitializer }>, align 16
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
  %5 = sext i8 32 to i64
  %6 = call i8 @do_one_computation(i8* %4, i64 %5, i32 0)
  %7 = zext i8 %6 to i32
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %7)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(i8*, ...) #2

define i8 @do_one_computation(i8* %0, i64 %len., i32 %1) {
  %3 = alloca [32 x i8], align 16
  %4 = alloca [32 x i8], align 16
  %5 = alloca [32 x i8], align 16
  %6 = bitcast [32 x i8]* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 32, i1 false)
  %7 = bitcast [32 x i8]* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 getelementptr inbounds (<{ i8, i8, i8, [29 x i8] }>, <{ i8, i8, i8, [29 x i8] }>* @__const.do_one_computation.secret, i32 0, i32 0), i64 32, i1 false)
  %8 = bitcast [32 x i8]* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 getelementptr inbounds (<{ i8, [31 x i8] }>, <{ i8, [31 x i8] }>* @__const.do_one_computation.basepoint, i32 0, i32 0), i64 32, i1 false)
  %9 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %10 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 0
  %11 = sext i8 32 to i64
  %12 = sext i8 32 to i64
  %13 = call i32 @curve25519_donna(i8* %9, i64 %11, i8* %0, i64 %len., i8* %10, i64 %12)
  %14 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %14, i64 32, i1 false)
  %15 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %16 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 0
  %17 = sext i8 32 to i64
  %18 = sext i8 32 to i64
  %19 = call i32 @curve25519_donna(i8* %15, i64 %17, i8* %0, i64 %len., i8* %16, i64 %18)
  %20 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %20, i64 32, i1 false)
  %21 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %22 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 0
  %23 = sext i8 32 to i64
  %24 = sext i8 32 to i64
  %25 = call i32 @curve25519_donna(i8* %21, i64 %23, i8* %0, i64 %len., i8* %22, i64 %24)
  %26 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %26, i64 32, i1 false)
  %27 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %28 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 0
  %29 = sext i8 32 to i64
  %30 = sext i8 32 to i64
  %31 = call i32 @curve25519_donna(i8* %27, i64 %29, i8* %0, i64 %len., i8* %28, i64 %30)
  %32 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %32, i64 32, i1 false)
  %33 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %34 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 0
  %35 = sext i8 32 to i64
  %36 = sext i8 32 to i64
  %37 = call i32 @curve25519_donna(i8* %33, i64 %35, i8* %0, i64 %len., i8* %34, i64 %36)
  %38 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %38, i64 32, i1 false)
  %39 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %40 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 0
  %41 = sext i8 32 to i64
  %42 = sext i8 32 to i64
  %43 = call i32 @curve25519_donna(i8* %39, i64 %41, i8* %0, i64 %len., i8* %40, i64 %42)
  %44 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %44, i64 32, i1 false)
  %45 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %46 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 0
  %47 = sext i8 32 to i64
  %48 = sext i8 32 to i64
  %49 = call i32 @curve25519_donna(i8* %45, i64 %47, i8* %0, i64 %len., i8* %46, i64 %48)
  %50 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %50, i64 32, i1 false)
  %51 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %52 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 0
  %53 = sext i8 32 to i64
  %54 = sext i8 32 to i64
  %55 = call i32 @curve25519_donna(i8* %51, i64 %53, i8* %0, i64 %len., i8* %52, i64 %54)
  %56 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %56, i64 32, i1 false)
  %57 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %58 = getelementptr inbounds [32 x i8], [32 x i8]* %5, i64 0, i64 0
  %59 = sext i8 32 to i64
  %60 = sext i8 32 to i64
  %61 = call i32 @curve25519_donna(i8* %57, i64 %59, i8* %0, i64 %len., i8* %58, i64 %60)
  %62 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %62, i64 32, i1 false)
  %63 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i64 0, i64 0
  %64 = load i8, i8* %63, align 16
  %65 = zext i8 %64 to i32
  %66 = zext i8 0 to i32
  %67 = xor i32 %66, %65
  %68 = trunc i32 %67 to i8
  ret i8 %68
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @init_dut() #0 {
  ret void
}

define void @prepare_inputs(i8* %0, i64 %len., i8* %1, i64 %len.1) {
  call void @randombytes(i8* %0, i64 %len., i64 32)
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

define i32 @curve25519_donna(i8* %0, i64 %len., i8* %1, i64 %len.1, i8* %2, i64 %len.2) {
  %out. = alloca i1
  store i1 true, i1* %out.
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
  call void @fexpand(i64* %119, i64 10, i8* %2, i64 %len.2, i1 true)
  %120 = getelementptr inbounds [10 x i64], [10 x i64]* %5, i64 0, i64 0
  %121 = getelementptr inbounds [11 x i64], [11 x i64]* %6, i64 0, i64 0
  %122 = getelementptr inbounds [32 x i8], [32 x i8]* %8, i64 0, i64 0
  %123 = getelementptr inbounds [10 x i64], [10 x i64]* %4, i64 0, i64 0
  %124 = sext i8 32 to i64
  call void @cmult(i64* %120, i64 10, i64* %121, i64 11, i8* %122, i64 %124, i64* %123, i64 10, i1 true)
  %125 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  %126 = getelementptr inbounds [11 x i64], [11 x i64]* %6, i64 0, i64 0
  call void @crecip(i64* %125, i64 10, i64* %126, i64 11, i1 true)
  %127 = getelementptr inbounds [11 x i64], [11 x i64]* %6, i64 0, i64 0
  %128 = getelementptr inbounds [10 x i64], [10 x i64]* %5, i64 0, i64 0
  %129 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  call void @fmul(i64* %127, i64 11, i64* %128, i64 10, i64* %129, i64 10, i1 true)
  %130 = getelementptr inbounds [11 x i64], [11 x i64]* %6, i64 0, i64 0
  call void @fcontract(i8* %0, i64 %len., i64* %130, i64 11, i1 true)
  %shadow = alloca i64
  ret i32 0
}

define internal void @fexpand(i64* %0, i64 %len., i8* %1, i64 %len.1, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %3 = getelementptr inbounds i8, i8* %1, i64 0
  %4 = load i1, i1* %out.
  %5 = icmp slt i64 0, %len.1
  %6 = bitcast i64* %shadow to i8*
  %safe. = or i1 %4, %5
  %select.ptr. = select i1 %safe., i8* %3, i8* %6
  %7 = load i8, i8* %select.ptr., align 1
  %8 = zext i8 %7 to i64
  %9 = getelementptr inbounds i8, i8* %1, i64 1
  %10 = load i1, i1* %out.
  %11 = icmp slt i64 1, %len.1
  %12 = bitcast i64* %shadow to i8*
  %safe.2 = or i1 %10, %11
  %select.ptr.3 = select i1 %safe.2, i8* %9, i8* %12
  %13 = load i8, i8* %select.ptr.3, align 1
  %14 = zext i8 %13 to i64
  %15 = shl i64 %14, 8
  %16 = or i64 %8, %15
  %17 = getelementptr inbounds i8, i8* %1, i64 2
  %18 = load i1, i1* %out.
  %19 = icmp slt i64 2, %len.1
  %20 = bitcast i64* %shadow to i8*
  %safe.4 = or i1 %18, %19
  %select.ptr.5 = select i1 %safe.4, i8* %17, i8* %20
  %21 = load i8, i8* %select.ptr.5, align 1
  %22 = zext i8 %21 to i64
  %23 = shl i64 %22, 16
  %24 = or i64 %16, %23
  %25 = getelementptr inbounds i8, i8* %1, i64 3
  %26 = load i1, i1* %out.
  %27 = icmp slt i64 3, %len.1
  %28 = bitcast i64* %shadow to i8*
  %safe.6 = or i1 %26, %27
  %select.ptr.7 = select i1 %safe.6, i8* %25, i8* %28
  %29 = load i8, i8* %select.ptr.7, align 1
  %30 = zext i8 %29 to i64
  %31 = shl i64 %30, 24
  %32 = or i64 %24, %31
  %33 = ashr i64 %32, 0
  %34 = and i64 %33, 67108863
  %35 = getelementptr inbounds i64, i64* %0, i64 0
  %36 = load i1, i1* %out.
  %37 = icmp slt i64 0, %len.
  %38 = bitcast i64* %shadow to i64*
  %safe.8 = or i1 %36, %37
  %select.ptr.9 = select i1 %safe.8, i64* %35, i64* %38
  %39 = load i64, i64* %35
  %select.val. = select i1 %36, i64 %34, i64 %39
  store i64 %select.val., i64* %select.ptr.9, align 8
  %40 = getelementptr inbounds i8, i8* %1, i64 3
  %41 = load i1, i1* %out.
  %42 = icmp slt i64 3, %len.1
  %43 = bitcast i64* %shadow to i8*
  %safe.10 = or i1 %41, %42
  %select.ptr.11 = select i1 %safe.10, i8* %40, i8* %43
  %44 = load i8, i8* %select.ptr.11, align 1
  %45 = zext i8 %44 to i64
  %46 = getelementptr inbounds i8, i8* %1, i64 4
  %47 = load i1, i1* %out.
  %48 = icmp slt i64 4, %len.1
  %49 = bitcast i64* %shadow to i8*
  %safe.12 = or i1 %47, %48
  %select.ptr.13 = select i1 %safe.12, i8* %46, i8* %49
  %50 = load i8, i8* %select.ptr.13, align 1
  %51 = zext i8 %50 to i64
  %52 = shl i64 %51, 8
  %53 = or i64 %45, %52
  %54 = getelementptr inbounds i8, i8* %1, i64 5
  %55 = load i1, i1* %out.
  %56 = icmp slt i64 5, %len.1
  %57 = bitcast i64* %shadow to i8*
  %safe.14 = or i1 %55, %56
  %select.ptr.15 = select i1 %safe.14, i8* %54, i8* %57
  %58 = load i8, i8* %select.ptr.15, align 1
  %59 = zext i8 %58 to i64
  %60 = shl i64 %59, 16
  %61 = or i64 %53, %60
  %62 = getelementptr inbounds i8, i8* %1, i64 6
  %63 = load i1, i1* %out.
  %64 = icmp slt i64 6, %len.1
  %65 = bitcast i64* %shadow to i8*
  %safe.16 = or i1 %63, %64
  %select.ptr.17 = select i1 %safe.16, i8* %62, i8* %65
  %66 = load i8, i8* %select.ptr.17, align 1
  %67 = zext i8 %66 to i64
  %68 = shl i64 %67, 24
  %69 = or i64 %61, %68
  %70 = ashr i64 %69, 2
  %71 = and i64 %70, 33554431
  %72 = getelementptr inbounds i64, i64* %0, i64 1
  %73 = load i1, i1* %out.
  %74 = icmp slt i64 1, %len.
  %75 = bitcast i64* %shadow to i64*
  %safe.18 = or i1 %73, %74
  %select.ptr.19 = select i1 %safe.18, i64* %72, i64* %75
  %76 = load i64, i64* %72
  %select.val.20 = select i1 %73, i64 %71, i64 %76
  store i64 %select.val.20, i64* %select.ptr.19, align 8
  %77 = getelementptr inbounds i8, i8* %1, i64 6
  %78 = load i1, i1* %out.
  %79 = icmp slt i64 6, %len.1
  %80 = bitcast i64* %shadow to i8*
  %safe.21 = or i1 %78, %79
  %select.ptr.22 = select i1 %safe.21, i8* %77, i8* %80
  %81 = load i8, i8* %select.ptr.22, align 1
  %82 = zext i8 %81 to i64
  %83 = getelementptr inbounds i8, i8* %1, i64 7
  %84 = load i1, i1* %out.
  %85 = icmp slt i64 7, %len.1
  %86 = bitcast i64* %shadow to i8*
  %safe.23 = or i1 %84, %85
  %select.ptr.24 = select i1 %safe.23, i8* %83, i8* %86
  %87 = load i8, i8* %select.ptr.24, align 1
  %88 = zext i8 %87 to i64
  %89 = shl i64 %88, 8
  %90 = or i64 %82, %89
  %91 = getelementptr inbounds i8, i8* %1, i64 8
  %92 = load i1, i1* %out.
  %93 = icmp slt i64 8, %len.1
  %94 = bitcast i64* %shadow to i8*
  %safe.25 = or i1 %92, %93
  %select.ptr.26 = select i1 %safe.25, i8* %91, i8* %94
  %95 = load i8, i8* %select.ptr.26, align 1
  %96 = zext i8 %95 to i64
  %97 = shl i64 %96, 16
  %98 = or i64 %90, %97
  %99 = getelementptr inbounds i8, i8* %1, i64 9
  %100 = load i1, i1* %out.
  %101 = icmp slt i64 9, %len.1
  %102 = bitcast i64* %shadow to i8*
  %safe.27 = or i1 %100, %101
  %select.ptr.28 = select i1 %safe.27, i8* %99, i8* %102
  %103 = load i8, i8* %select.ptr.28, align 1
  %104 = zext i8 %103 to i64
  %105 = shl i64 %104, 24
  %106 = or i64 %98, %105
  %107 = ashr i64 %106, 3
  %108 = and i64 %107, 67108863
  %109 = getelementptr inbounds i64, i64* %0, i64 2
  %110 = load i1, i1* %out.
  %111 = icmp slt i64 2, %len.
  %112 = bitcast i64* %shadow to i64*
  %safe.29 = or i1 %110, %111
  %select.ptr.30 = select i1 %safe.29, i64* %109, i64* %112
  %113 = load i64, i64* %109
  %select.val.31 = select i1 %110, i64 %108, i64 %113
  store i64 %select.val.31, i64* %select.ptr.30, align 8
  %114 = getelementptr inbounds i8, i8* %1, i64 9
  %115 = load i1, i1* %out.
  %116 = icmp slt i64 9, %len.1
  %117 = bitcast i64* %shadow to i8*
  %safe.32 = or i1 %115, %116
  %select.ptr.33 = select i1 %safe.32, i8* %114, i8* %117
  %118 = load i8, i8* %select.ptr.33, align 1
  %119 = zext i8 %118 to i64
  %120 = getelementptr inbounds i8, i8* %1, i64 10
  %121 = load i1, i1* %out.
  %122 = icmp slt i64 10, %len.1
  %123 = bitcast i64* %shadow to i8*
  %safe.34 = or i1 %121, %122
  %select.ptr.35 = select i1 %safe.34, i8* %120, i8* %123
  %124 = load i8, i8* %select.ptr.35, align 1
  %125 = zext i8 %124 to i64
  %126 = shl i64 %125, 8
  %127 = or i64 %119, %126
  %128 = getelementptr inbounds i8, i8* %1, i64 11
  %129 = load i1, i1* %out.
  %130 = icmp slt i64 11, %len.1
  %131 = bitcast i64* %shadow to i8*
  %safe.36 = or i1 %129, %130
  %select.ptr.37 = select i1 %safe.36, i8* %128, i8* %131
  %132 = load i8, i8* %select.ptr.37, align 1
  %133 = zext i8 %132 to i64
  %134 = shl i64 %133, 16
  %135 = or i64 %127, %134
  %136 = getelementptr inbounds i8, i8* %1, i64 12
  %137 = load i1, i1* %out.
  %138 = icmp slt i64 12, %len.1
  %139 = bitcast i64* %shadow to i8*
  %safe.38 = or i1 %137, %138
  %select.ptr.39 = select i1 %safe.38, i8* %136, i8* %139
  %140 = load i8, i8* %select.ptr.39, align 1
  %141 = zext i8 %140 to i64
  %142 = shl i64 %141, 24
  %143 = or i64 %135, %142
  %144 = ashr i64 %143, 5
  %145 = and i64 %144, 33554431
  %146 = getelementptr inbounds i64, i64* %0, i64 3
  %147 = load i1, i1* %out.
  %148 = icmp slt i64 3, %len.
  %149 = bitcast i64* %shadow to i64*
  %safe.40 = or i1 %147, %148
  %select.ptr.41 = select i1 %safe.40, i64* %146, i64* %149
  %150 = load i64, i64* %146
  %select.val.42 = select i1 %147, i64 %145, i64 %150
  store i64 %select.val.42, i64* %select.ptr.41, align 8
  %151 = getelementptr inbounds i8, i8* %1, i64 12
  %152 = load i1, i1* %out.
  %153 = icmp slt i64 12, %len.1
  %154 = bitcast i64* %shadow to i8*
  %safe.43 = or i1 %152, %153
  %select.ptr.44 = select i1 %safe.43, i8* %151, i8* %154
  %155 = load i8, i8* %select.ptr.44, align 1
  %156 = zext i8 %155 to i64
  %157 = getelementptr inbounds i8, i8* %1, i64 13
  %158 = load i1, i1* %out.
  %159 = icmp slt i64 13, %len.1
  %160 = bitcast i64* %shadow to i8*
  %safe.45 = or i1 %158, %159
  %select.ptr.46 = select i1 %safe.45, i8* %157, i8* %160
  %161 = load i8, i8* %select.ptr.46, align 1
  %162 = zext i8 %161 to i64
  %163 = shl i64 %162, 8
  %164 = or i64 %156, %163
  %165 = getelementptr inbounds i8, i8* %1, i64 14
  %166 = load i1, i1* %out.
  %167 = icmp slt i64 14, %len.1
  %168 = bitcast i64* %shadow to i8*
  %safe.47 = or i1 %166, %167
  %select.ptr.48 = select i1 %safe.47, i8* %165, i8* %168
  %169 = load i8, i8* %select.ptr.48, align 1
  %170 = zext i8 %169 to i64
  %171 = shl i64 %170, 16
  %172 = or i64 %164, %171
  %173 = getelementptr inbounds i8, i8* %1, i64 15
  %174 = load i1, i1* %out.
  %175 = icmp slt i64 15, %len.1
  %176 = bitcast i64* %shadow to i8*
  %safe.49 = or i1 %174, %175
  %select.ptr.50 = select i1 %safe.49, i8* %173, i8* %176
  %177 = load i8, i8* %select.ptr.50, align 1
  %178 = zext i8 %177 to i64
  %179 = shl i64 %178, 24
  %180 = or i64 %172, %179
  %181 = ashr i64 %180, 6
  %182 = and i64 %181, 67108863
  %183 = getelementptr inbounds i64, i64* %0, i64 4
  %184 = load i1, i1* %out.
  %185 = icmp slt i64 4, %len.
  %186 = bitcast i64* %shadow to i64*
  %safe.51 = or i1 %184, %185
  %select.ptr.52 = select i1 %safe.51, i64* %183, i64* %186
  %187 = load i64, i64* %183
  %select.val.53 = select i1 %184, i64 %182, i64 %187
  store i64 %select.val.53, i64* %select.ptr.52, align 8
  %188 = getelementptr inbounds i8, i8* %1, i64 16
  %189 = load i1, i1* %out.
  %190 = icmp slt i64 16, %len.1
  %191 = bitcast i64* %shadow to i8*
  %safe.54 = or i1 %189, %190
  %select.ptr.55 = select i1 %safe.54, i8* %188, i8* %191
  %192 = load i8, i8* %select.ptr.55, align 1
  %193 = zext i8 %192 to i64
  %194 = getelementptr inbounds i8, i8* %1, i64 17
  %195 = load i1, i1* %out.
  %196 = icmp slt i64 17, %len.1
  %197 = bitcast i64* %shadow to i8*
  %safe.56 = or i1 %195, %196
  %select.ptr.57 = select i1 %safe.56, i8* %194, i8* %197
  %198 = load i8, i8* %select.ptr.57, align 1
  %199 = zext i8 %198 to i64
  %200 = shl i64 %199, 8
  %201 = or i64 %193, %200
  %202 = getelementptr inbounds i8, i8* %1, i64 18
  %203 = load i1, i1* %out.
  %204 = icmp slt i64 18, %len.1
  %205 = bitcast i64* %shadow to i8*
  %safe.58 = or i1 %203, %204
  %select.ptr.59 = select i1 %safe.58, i8* %202, i8* %205
  %206 = load i8, i8* %select.ptr.59, align 1
  %207 = zext i8 %206 to i64
  %208 = shl i64 %207, 16
  %209 = or i64 %201, %208
  %210 = getelementptr inbounds i8, i8* %1, i64 19
  %211 = load i1, i1* %out.
  %212 = icmp slt i64 19, %len.1
  %213 = bitcast i64* %shadow to i8*
  %safe.60 = or i1 %211, %212
  %select.ptr.61 = select i1 %safe.60, i8* %210, i8* %213
  %214 = load i8, i8* %select.ptr.61, align 1
  %215 = zext i8 %214 to i64
  %216 = shl i64 %215, 24
  %217 = or i64 %209, %216
  %218 = ashr i64 %217, 0
  %219 = and i64 %218, 33554431
  %220 = getelementptr inbounds i64, i64* %0, i64 5
  %221 = load i1, i1* %out.
  %222 = icmp slt i64 5, %len.
  %223 = bitcast i64* %shadow to i64*
  %safe.62 = or i1 %221, %222
  %select.ptr.63 = select i1 %safe.62, i64* %220, i64* %223
  %224 = load i64, i64* %220
  %select.val.64 = select i1 %221, i64 %219, i64 %224
  store i64 %select.val.64, i64* %select.ptr.63, align 8
  %225 = getelementptr inbounds i8, i8* %1, i64 19
  %226 = load i1, i1* %out.
  %227 = icmp slt i64 19, %len.1
  %228 = bitcast i64* %shadow to i8*
  %safe.65 = or i1 %226, %227
  %select.ptr.66 = select i1 %safe.65, i8* %225, i8* %228
  %229 = load i8, i8* %select.ptr.66, align 1
  %230 = zext i8 %229 to i64
  %231 = getelementptr inbounds i8, i8* %1, i64 20
  %232 = load i1, i1* %out.
  %233 = icmp slt i64 20, %len.1
  %234 = bitcast i64* %shadow to i8*
  %safe.67 = or i1 %232, %233
  %select.ptr.68 = select i1 %safe.67, i8* %231, i8* %234
  %235 = load i8, i8* %select.ptr.68, align 1
  %236 = zext i8 %235 to i64
  %237 = shl i64 %236, 8
  %238 = or i64 %230, %237
  %239 = getelementptr inbounds i8, i8* %1, i64 21
  %240 = load i1, i1* %out.
  %241 = icmp slt i64 21, %len.1
  %242 = bitcast i64* %shadow to i8*
  %safe.69 = or i1 %240, %241
  %select.ptr.70 = select i1 %safe.69, i8* %239, i8* %242
  %243 = load i8, i8* %select.ptr.70, align 1
  %244 = zext i8 %243 to i64
  %245 = shl i64 %244, 16
  %246 = or i64 %238, %245
  %247 = getelementptr inbounds i8, i8* %1, i64 22
  %248 = load i1, i1* %out.
  %249 = icmp slt i64 22, %len.1
  %250 = bitcast i64* %shadow to i8*
  %safe.71 = or i1 %248, %249
  %select.ptr.72 = select i1 %safe.71, i8* %247, i8* %250
  %251 = load i8, i8* %select.ptr.72, align 1
  %252 = zext i8 %251 to i64
  %253 = shl i64 %252, 24
  %254 = or i64 %246, %253
  %255 = ashr i64 %254, 1
  %256 = and i64 %255, 67108863
  %257 = getelementptr inbounds i64, i64* %0, i64 6
  %258 = load i1, i1* %out.
  %259 = icmp slt i64 6, %len.
  %260 = bitcast i64* %shadow to i64*
  %safe.73 = or i1 %258, %259
  %select.ptr.74 = select i1 %safe.73, i64* %257, i64* %260
  %261 = load i64, i64* %257
  %select.val.75 = select i1 %258, i64 %256, i64 %261
  store i64 %select.val.75, i64* %select.ptr.74, align 8
  %262 = getelementptr inbounds i8, i8* %1, i64 22
  %263 = load i1, i1* %out.
  %264 = icmp slt i64 22, %len.1
  %265 = bitcast i64* %shadow to i8*
  %safe.76 = or i1 %263, %264
  %select.ptr.77 = select i1 %safe.76, i8* %262, i8* %265
  %266 = load i8, i8* %select.ptr.77, align 1
  %267 = zext i8 %266 to i64
  %268 = getelementptr inbounds i8, i8* %1, i64 23
  %269 = load i1, i1* %out.
  %270 = icmp slt i64 23, %len.1
  %271 = bitcast i64* %shadow to i8*
  %safe.78 = or i1 %269, %270
  %select.ptr.79 = select i1 %safe.78, i8* %268, i8* %271
  %272 = load i8, i8* %select.ptr.79, align 1
  %273 = zext i8 %272 to i64
  %274 = shl i64 %273, 8
  %275 = or i64 %267, %274
  %276 = getelementptr inbounds i8, i8* %1, i64 24
  %277 = load i1, i1* %out.
  %278 = icmp slt i64 24, %len.1
  %279 = bitcast i64* %shadow to i8*
  %safe.80 = or i1 %277, %278
  %select.ptr.81 = select i1 %safe.80, i8* %276, i8* %279
  %280 = load i8, i8* %select.ptr.81, align 1
  %281 = zext i8 %280 to i64
  %282 = shl i64 %281, 16
  %283 = or i64 %275, %282
  %284 = getelementptr inbounds i8, i8* %1, i64 25
  %285 = load i1, i1* %out.
  %286 = icmp slt i64 25, %len.1
  %287 = bitcast i64* %shadow to i8*
  %safe.82 = or i1 %285, %286
  %select.ptr.83 = select i1 %safe.82, i8* %284, i8* %287
  %288 = load i8, i8* %select.ptr.83, align 1
  %289 = zext i8 %288 to i64
  %290 = shl i64 %289, 24
  %291 = or i64 %283, %290
  %292 = ashr i64 %291, 3
  %293 = and i64 %292, 33554431
  %294 = getelementptr inbounds i64, i64* %0, i64 7
  %295 = load i1, i1* %out.
  %296 = icmp slt i64 7, %len.
  %297 = bitcast i64* %shadow to i64*
  %safe.84 = or i1 %295, %296
  %select.ptr.85 = select i1 %safe.84, i64* %294, i64* %297
  %298 = load i64, i64* %294
  %select.val.86 = select i1 %295, i64 %293, i64 %298
  store i64 %select.val.86, i64* %select.ptr.85, align 8
  %299 = getelementptr inbounds i8, i8* %1, i64 25
  %300 = load i1, i1* %out.
  %301 = icmp slt i64 25, %len.1
  %302 = bitcast i64* %shadow to i8*
  %safe.87 = or i1 %300, %301
  %select.ptr.88 = select i1 %safe.87, i8* %299, i8* %302
  %303 = load i8, i8* %select.ptr.88, align 1
  %304 = zext i8 %303 to i64
  %305 = getelementptr inbounds i8, i8* %1, i64 26
  %306 = load i1, i1* %out.
  %307 = icmp slt i64 26, %len.1
  %308 = bitcast i64* %shadow to i8*
  %safe.89 = or i1 %306, %307
  %select.ptr.90 = select i1 %safe.89, i8* %305, i8* %308
  %309 = load i8, i8* %select.ptr.90, align 1
  %310 = zext i8 %309 to i64
  %311 = shl i64 %310, 8
  %312 = or i64 %304, %311
  %313 = getelementptr inbounds i8, i8* %1, i64 27
  %314 = load i1, i1* %out.
  %315 = icmp slt i64 27, %len.1
  %316 = bitcast i64* %shadow to i8*
  %safe.91 = or i1 %314, %315
  %select.ptr.92 = select i1 %safe.91, i8* %313, i8* %316
  %317 = load i8, i8* %select.ptr.92, align 1
  %318 = zext i8 %317 to i64
  %319 = shl i64 %318, 16
  %320 = or i64 %312, %319
  %321 = getelementptr inbounds i8, i8* %1, i64 28
  %322 = load i1, i1* %out.
  %323 = icmp slt i64 28, %len.1
  %324 = bitcast i64* %shadow to i8*
  %safe.93 = or i1 %322, %323
  %select.ptr.94 = select i1 %safe.93, i8* %321, i8* %324
  %325 = load i8, i8* %select.ptr.94, align 1
  %326 = zext i8 %325 to i64
  %327 = shl i64 %326, 24
  %328 = or i64 %320, %327
  %329 = ashr i64 %328, 4
  %330 = and i64 %329, 67108863
  %331 = getelementptr inbounds i64, i64* %0, i64 8
  %332 = load i1, i1* %out.
  %333 = icmp slt i64 8, %len.
  %334 = bitcast i64* %shadow to i64*
  %safe.95 = or i1 %332, %333
  %select.ptr.96 = select i1 %safe.95, i64* %331, i64* %334
  %335 = load i64, i64* %331
  %select.val.97 = select i1 %332, i64 %330, i64 %335
  store i64 %select.val.97, i64* %select.ptr.96, align 8
  %336 = getelementptr inbounds i8, i8* %1, i64 28
  %337 = load i1, i1* %out.
  %338 = icmp slt i64 28, %len.1
  %339 = bitcast i64* %shadow to i8*
  %safe.98 = or i1 %337, %338
  %select.ptr.99 = select i1 %safe.98, i8* %336, i8* %339
  %340 = load i8, i8* %select.ptr.99, align 1
  %341 = zext i8 %340 to i64
  %342 = getelementptr inbounds i8, i8* %1, i64 29
  %343 = load i1, i1* %out.
  %344 = icmp slt i64 29, %len.1
  %345 = bitcast i64* %shadow to i8*
  %safe.100 = or i1 %343, %344
  %select.ptr.101 = select i1 %safe.100, i8* %342, i8* %345
  %346 = load i8, i8* %select.ptr.101, align 1
  %347 = zext i8 %346 to i64
  %348 = shl i64 %347, 8
  %349 = or i64 %341, %348
  %350 = getelementptr inbounds i8, i8* %1, i64 30
  %351 = load i1, i1* %out.
  %352 = icmp slt i64 30, %len.1
  %353 = bitcast i64* %shadow to i8*
  %safe.102 = or i1 %351, %352
  %select.ptr.103 = select i1 %safe.102, i8* %350, i8* %353
  %354 = load i8, i8* %select.ptr.103, align 1
  %355 = zext i8 %354 to i64
  %356 = shl i64 %355, 16
  %357 = or i64 %349, %356
  %358 = getelementptr inbounds i8, i8* %1, i64 31
  %359 = load i1, i1* %out.
  %360 = icmp slt i64 31, %len.1
  %361 = bitcast i64* %shadow to i8*
  %safe.104 = or i1 %359, %360
  %select.ptr.105 = select i1 %safe.104, i8* %358, i8* %361
  %362 = load i8, i8* %select.ptr.105, align 1
  %363 = zext i8 %362 to i64
  %364 = shl i64 %363, 24
  %365 = or i64 %357, %364
  %366 = ashr i64 %365, 6
  %367 = and i64 %366, 33554431
  %368 = getelementptr inbounds i64, i64* %0, i64 9
  %369 = load i1, i1* %out.
  %370 = icmp slt i64 9, %len.
  %371 = bitcast i64* %shadow to i64*
  %safe.106 = or i1 %369, %370
  %select.ptr.107 = select i1 %safe.106, i64* %368, i64* %371
  %372 = load i64, i64* %368
  %select.val.108 = select i1 %369, i64 %367, i64 %372
  store i64 %select.val.108, i64* %select.ptr.107, align 8
  ret void
}

define internal void @cmult(i64* %0, i64 %len., i64* %1, i64 %len.1, i8* %2, i64 %len.2, i64* %3, i64 %len.3, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
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
  %17 = load i1, i1* %out.
  %18 = sext i32 0 to i64
  %19 = icmp slt i64 %18, 19
  %20 = bitcast i64* %shadow to i64*
  %safe. = or i1 %17, %19
  %select.ptr. = select i1 %safe., i64* %16, i64* %20
  %21 = load i64, i64* %16
  %select.val. = select i1 %17, i64 1, i64 %21
  store i64 %select.val., i64* %select.ptr., align 16
  %22 = bitcast [19 x i64]* %7 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %22, i8 0, i64 152, i1 false)
  %23 = bitcast i8* %22 to <{ i64, [18 x i64] }>*
  %24 = getelementptr inbounds <{ i64, [18 x i64] }>, <{ i64, [18 x i64] }>* %23, i32 0, i32 0
  %25 = load i1, i1* %out.
  %26 = sext i32 0 to i64
  %27 = icmp slt i64 %26, 19
  %28 = bitcast i64* %shadow to i64*
  %safe.4 = or i1 %25, %27
  %select.ptr.5 = select i1 %safe.4, i64* %24, i64* %28
  %29 = load i64, i64* %24
  %select.val.6 = select i1 %25, i64 1, i64 %29
  store i64 %select.val.6, i64* %select.ptr.5, align 16
  %30 = bitcast [19 x i64]* %8 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %30, i8 0, i64 152, i1 false)
  %31 = getelementptr inbounds [19 x i64], [19 x i64]* %5, i64 0, i64 0
  %32 = getelementptr inbounds [19 x i64], [19 x i64]* %6, i64 0, i64 0
  %33 = getelementptr inbounds [19 x i64], [19 x i64]* %7, i64 0, i64 0
  %34 = getelementptr inbounds [19 x i64], [19 x i64]* %8, i64 0, i64 0
  %35 = bitcast [19 x i64]* %9 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %35, i8 0, i64 152, i1 false)
  %36 = bitcast [19 x i64]* %10 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %36, i8 0, i64 152, i1 false)
  %37 = bitcast i8* %36 to <{ i64, [18 x i64] }>*
  %38 = getelementptr inbounds <{ i64, [18 x i64] }>, <{ i64, [18 x i64] }>* %37, i32 0, i32 0
  %39 = load i1, i1* %out.
  %40 = sext i32 0 to i64
  %41 = icmp slt i64 %40, 19
  %42 = bitcast i64* %shadow to i64*
  %safe.7 = or i1 %39, %41
  %select.ptr.8 = select i1 %safe.7, i64* %38, i64* %42
  %43 = load i64, i64* %38
  %select.val.9 = select i1 %39, i64 1, i64 %43
  store i64 %select.val.9, i64* %select.ptr.8, align 16
  %44 = bitcast [19 x i64]* %11 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %44, i8 0, i64 152, i1 false)
  %45 = bitcast [19 x i64]* %12 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %45, i8 0, i64 152, i1 false)
  %46 = bitcast i8* %45 to <{ i64, [18 x i64] }>*
  %47 = getelementptr inbounds <{ i64, [18 x i64] }>, <{ i64, [18 x i64] }>* %46, i32 0, i32 0
  %48 = load i1, i1* %out.
  %49 = sext i32 0 to i64
  %50 = icmp slt i64 %49, 19
  %51 = bitcast i64* %shadow to i64*
  %safe.10 = or i1 %48, %50
  %select.ptr.11 = select i1 %safe.10, i64* %47, i64* %51
  %52 = load i64, i64* %47
  %select.val.12 = select i1 %48, i64 1, i64 %52
  store i64 %select.val.12, i64* %select.ptr.11, align 16
  %53 = getelementptr inbounds [19 x i64], [19 x i64]* %9, i64 0, i64 0
  %54 = getelementptr inbounds [19 x i64], [19 x i64]* %10, i64 0, i64 0
  %55 = getelementptr inbounds [19 x i64], [19 x i64]* %11, i64 0, i64 0
  %56 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  %57 = bitcast i64* %31 to i8*
  %58 = bitcast i64* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %57, i8* align 8 %58, i64 80, i1 false)
  %59 = getelementptr inbounds i8, i8* %2, i64 31
  %60 = load i1, i1* %out.
  %61 = icmp slt i64 31, %len.2
  %62 = bitcast i64* %shadow to i8*
  %safe.13 = or i1 %60, %61
  %select.ptr.14 = select i1 %safe.13, i8* %59, i8* %62
  %63 = load i8, i8* %select.ptr.14, align 1
  %64 = zext i8 %63 to i32
  %65 = ashr i32 %64, 7
  %66 = sext i32 %65 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %66, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %66, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %66, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %66, i1 %.cond)
  %67 = zext i8 %63 to i32
  %68 = shl i32 %67, 1
  %69 = trunc i32 %68 to i8
  %70 = zext i8 %69 to i32
  %71 = ashr i32 %70, 7
  %72 = sext i32 %71 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %72, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %72, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %72, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %72, i1 %.cond)
  %73 = zext i8 %69 to i32
  %74 = shl i32 %73, 1
  %75 = trunc i32 %74 to i8
  %76 = zext i8 %75 to i32
  %77 = ashr i32 %76, 7
  %78 = sext i32 %77 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %78, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %78, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %78, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %78, i1 %.cond)
  %79 = zext i8 %75 to i32
  %80 = shl i32 %79, 1
  %81 = trunc i32 %80 to i8
  %82 = zext i8 %81 to i32
  %83 = ashr i32 %82, 7
  %84 = sext i32 %83 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %84, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %84, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %84, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %84, i1 %.cond)
  %85 = zext i8 %81 to i32
  %86 = shl i32 %85, 1
  %87 = trunc i32 %86 to i8
  %88 = zext i8 %87 to i32
  %89 = ashr i32 %88, 7
  %90 = sext i32 %89 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %90, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %90, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %90, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %90, i1 %.cond)
  %91 = zext i8 %87 to i32
  %92 = shl i32 %91, 1
  %93 = trunc i32 %92 to i8
  %94 = zext i8 %93 to i32
  %95 = ashr i32 %94, 7
  %96 = sext i32 %95 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %96, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %96, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %96, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %96, i1 %.cond)
  %97 = zext i8 %93 to i32
  %98 = shl i32 %97, 1
  %99 = trunc i32 %98 to i8
  %100 = zext i8 %99 to i32
  %101 = ashr i32 %100, 7
  %102 = sext i32 %101 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %102, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %102, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %102, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %102, i1 %.cond)
  %103 = zext i8 %99 to i32
  %104 = shl i32 %103, 1
  %105 = trunc i32 %104 to i8
  %106 = zext i8 %105 to i32
  %107 = ashr i32 %106, 7
  %108 = sext i32 %107 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %108, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %108, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %108, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %108, i1 %.cond)
  %109 = zext i8 %105 to i32
  %110 = getelementptr inbounds i8, i8* %2, i64 30
  %111 = load i1, i1* %out.
  %112 = icmp slt i64 30, %len.2
  %113 = bitcast i64* %shadow to i8*
  %safe.15 = or i1 %111, %112
  %select.ptr.16 = select i1 %safe.15, i8* %110, i8* %113
  %114 = load i8, i8* %select.ptr.16, align 1
  %115 = zext i8 %114 to i32
  %116 = ashr i32 %115, 7
  %117 = sext i32 %116 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %117, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %117, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %117, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %117, i1 %.cond)
  %118 = zext i8 %114 to i32
  %119 = shl i32 %118, 1
  %120 = trunc i32 %119 to i8
  %121 = zext i8 %120 to i32
  %122 = ashr i32 %121, 7
  %123 = sext i32 %122 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %123, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %123, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %123, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %123, i1 %.cond)
  %124 = zext i8 %120 to i32
  %125 = shl i32 %124, 1
  %126 = trunc i32 %125 to i8
  %127 = zext i8 %126 to i32
  %128 = ashr i32 %127, 7
  %129 = sext i32 %128 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %129, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %129, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %129, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %129, i1 %.cond)
  %130 = zext i8 %126 to i32
  %131 = shl i32 %130, 1
  %132 = trunc i32 %131 to i8
  %133 = zext i8 %132 to i32
  %134 = ashr i32 %133, 7
  %135 = sext i32 %134 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %135, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %135, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %135, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %135, i1 %.cond)
  %136 = zext i8 %132 to i32
  %137 = shl i32 %136, 1
  %138 = trunc i32 %137 to i8
  %139 = zext i8 %138 to i32
  %140 = ashr i32 %139, 7
  %141 = sext i32 %140 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %141, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %141, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %141, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %141, i1 %.cond)
  %142 = zext i8 %138 to i32
  %143 = shl i32 %142, 1
  %144 = trunc i32 %143 to i8
  %145 = zext i8 %144 to i32
  %146 = ashr i32 %145, 7
  %147 = sext i32 %146 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %147, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %147, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %147, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %147, i1 %.cond)
  %148 = zext i8 %144 to i32
  %149 = shl i32 %148, 1
  %150 = trunc i32 %149 to i8
  %151 = zext i8 %150 to i32
  %152 = ashr i32 %151, 7
  %153 = sext i32 %152 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %153, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %153, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %153, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %153, i1 %.cond)
  %154 = zext i8 %150 to i32
  %155 = shl i32 %154, 1
  %156 = trunc i32 %155 to i8
  %157 = zext i8 %156 to i32
  %158 = ashr i32 %157, 7
  %159 = sext i32 %158 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %159, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %159, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %159, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %159, i1 %.cond)
  %160 = zext i8 %156 to i32
  %161 = getelementptr inbounds i8, i8* %2, i64 29
  %162 = load i1, i1* %out.
  %163 = icmp slt i64 29, %len.2
  %164 = bitcast i64* %shadow to i8*
  %safe.17 = or i1 %162, %163
  %select.ptr.18 = select i1 %safe.17, i8* %161, i8* %164
  %165 = load i8, i8* %select.ptr.18, align 1
  %166 = zext i8 %165 to i32
  %167 = ashr i32 %166, 7
  %168 = sext i32 %167 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %168, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %168, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %168, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %168, i1 %.cond)
  %169 = zext i8 %165 to i32
  %170 = shl i32 %169, 1
  %171 = trunc i32 %170 to i8
  %172 = zext i8 %171 to i32
  %173 = ashr i32 %172, 7
  %174 = sext i32 %173 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %174, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %174, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %174, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %174, i1 %.cond)
  %175 = zext i8 %171 to i32
  %176 = shl i32 %175, 1
  %177 = trunc i32 %176 to i8
  %178 = zext i8 %177 to i32
  %179 = ashr i32 %178, 7
  %180 = sext i32 %179 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %180, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %180, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %180, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %180, i1 %.cond)
  %181 = zext i8 %177 to i32
  %182 = shl i32 %181, 1
  %183 = trunc i32 %182 to i8
  %184 = zext i8 %183 to i32
  %185 = ashr i32 %184, 7
  %186 = sext i32 %185 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %186, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %186, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %186, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %186, i1 %.cond)
  %187 = zext i8 %183 to i32
  %188 = shl i32 %187, 1
  %189 = trunc i32 %188 to i8
  %190 = zext i8 %189 to i32
  %191 = ashr i32 %190, 7
  %192 = sext i32 %191 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %192, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %192, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %192, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %192, i1 %.cond)
  %193 = zext i8 %189 to i32
  %194 = shl i32 %193, 1
  %195 = trunc i32 %194 to i8
  %196 = zext i8 %195 to i32
  %197 = ashr i32 %196, 7
  %198 = sext i32 %197 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %198, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %198, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %198, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %198, i1 %.cond)
  %199 = zext i8 %195 to i32
  %200 = shl i32 %199, 1
  %201 = trunc i32 %200 to i8
  %202 = zext i8 %201 to i32
  %203 = ashr i32 %202, 7
  %204 = sext i32 %203 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %204, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %204, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %204, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %204, i1 %.cond)
  %205 = zext i8 %201 to i32
  %206 = shl i32 %205, 1
  %207 = trunc i32 %206 to i8
  %208 = zext i8 %207 to i32
  %209 = ashr i32 %208, 7
  %210 = sext i32 %209 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %210, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %210, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %210, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %210, i1 %.cond)
  %211 = zext i8 %207 to i32
  %212 = getelementptr inbounds i8, i8* %2, i64 28
  %213 = load i1, i1* %out.
  %214 = icmp slt i64 28, %len.2
  %215 = bitcast i64* %shadow to i8*
  %safe.19 = or i1 %213, %214
  %select.ptr.20 = select i1 %safe.19, i8* %212, i8* %215
  %216 = load i8, i8* %select.ptr.20, align 1
  %217 = zext i8 %216 to i32
  %218 = ashr i32 %217, 7
  %219 = sext i32 %218 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %219, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %219, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %219, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %219, i1 %.cond)
  %220 = zext i8 %216 to i32
  %221 = shl i32 %220, 1
  %222 = trunc i32 %221 to i8
  %223 = zext i8 %222 to i32
  %224 = ashr i32 %223, 7
  %225 = sext i32 %224 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %225, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %225, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %225, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %225, i1 %.cond)
  %226 = zext i8 %222 to i32
  %227 = shl i32 %226, 1
  %228 = trunc i32 %227 to i8
  %229 = zext i8 %228 to i32
  %230 = ashr i32 %229, 7
  %231 = sext i32 %230 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %231, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %231, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %231, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %231, i1 %.cond)
  %232 = zext i8 %228 to i32
  %233 = shl i32 %232, 1
  %234 = trunc i32 %233 to i8
  %235 = zext i8 %234 to i32
  %236 = ashr i32 %235, 7
  %237 = sext i32 %236 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %237, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %237, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %237, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %237, i1 %.cond)
  %238 = zext i8 %234 to i32
  %239 = shl i32 %238, 1
  %240 = trunc i32 %239 to i8
  %241 = zext i8 %240 to i32
  %242 = ashr i32 %241, 7
  %243 = sext i32 %242 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %243, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %243, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %243, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %243, i1 %.cond)
  %244 = zext i8 %240 to i32
  %245 = shl i32 %244, 1
  %246 = trunc i32 %245 to i8
  %247 = zext i8 %246 to i32
  %248 = ashr i32 %247, 7
  %249 = sext i32 %248 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %249, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %249, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %249, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %249, i1 %.cond)
  %250 = zext i8 %246 to i32
  %251 = shl i32 %250, 1
  %252 = trunc i32 %251 to i8
  %253 = zext i8 %252 to i32
  %254 = ashr i32 %253, 7
  %255 = sext i32 %254 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %255, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %255, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %255, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %255, i1 %.cond)
  %256 = zext i8 %252 to i32
  %257 = shl i32 %256, 1
  %258 = trunc i32 %257 to i8
  %259 = zext i8 %258 to i32
  %260 = ashr i32 %259, 7
  %261 = sext i32 %260 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %261, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %261, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %261, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %261, i1 %.cond)
  %262 = zext i8 %258 to i32
  %263 = getelementptr inbounds i8, i8* %2, i64 27
  %264 = load i1, i1* %out.
  %265 = icmp slt i64 27, %len.2
  %266 = bitcast i64* %shadow to i8*
  %safe.21 = or i1 %264, %265
  %select.ptr.22 = select i1 %safe.21, i8* %263, i8* %266
  %267 = load i8, i8* %select.ptr.22, align 1
  %268 = zext i8 %267 to i32
  %269 = ashr i32 %268, 7
  %270 = sext i32 %269 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %270, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %270, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %270, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %270, i1 %.cond)
  %271 = zext i8 %267 to i32
  %272 = shl i32 %271, 1
  %273 = trunc i32 %272 to i8
  %274 = zext i8 %273 to i32
  %275 = ashr i32 %274, 7
  %276 = sext i32 %275 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %276, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %276, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %276, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %276, i1 %.cond)
  %277 = zext i8 %273 to i32
  %278 = shl i32 %277, 1
  %279 = trunc i32 %278 to i8
  %280 = zext i8 %279 to i32
  %281 = ashr i32 %280, 7
  %282 = sext i32 %281 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %282, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %282, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %282, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %282, i1 %.cond)
  %283 = zext i8 %279 to i32
  %284 = shl i32 %283, 1
  %285 = trunc i32 %284 to i8
  %286 = zext i8 %285 to i32
  %287 = ashr i32 %286, 7
  %288 = sext i32 %287 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %288, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %288, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %288, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %288, i1 %.cond)
  %289 = zext i8 %285 to i32
  %290 = shl i32 %289, 1
  %291 = trunc i32 %290 to i8
  %292 = zext i8 %291 to i32
  %293 = ashr i32 %292, 7
  %294 = sext i32 %293 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %294, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %294, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %294, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %294, i1 %.cond)
  %295 = zext i8 %291 to i32
  %296 = shl i32 %295, 1
  %297 = trunc i32 %296 to i8
  %298 = zext i8 %297 to i32
  %299 = ashr i32 %298, 7
  %300 = sext i32 %299 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %300, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %300, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %300, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %300, i1 %.cond)
  %301 = zext i8 %297 to i32
  %302 = shl i32 %301, 1
  %303 = trunc i32 %302 to i8
  %304 = zext i8 %303 to i32
  %305 = ashr i32 %304, 7
  %306 = sext i32 %305 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %306, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %306, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %306, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %306, i1 %.cond)
  %307 = zext i8 %303 to i32
  %308 = shl i32 %307, 1
  %309 = trunc i32 %308 to i8
  %310 = zext i8 %309 to i32
  %311 = ashr i32 %310, 7
  %312 = sext i32 %311 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %312, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %312, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %312, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %312, i1 %.cond)
  %313 = zext i8 %309 to i32
  %314 = getelementptr inbounds i8, i8* %2, i64 26
  %315 = load i1, i1* %out.
  %316 = icmp slt i64 26, %len.2
  %317 = bitcast i64* %shadow to i8*
  %safe.23 = or i1 %315, %316
  %select.ptr.24 = select i1 %safe.23, i8* %314, i8* %317
  %318 = load i8, i8* %select.ptr.24, align 1
  %319 = zext i8 %318 to i32
  %320 = ashr i32 %319, 7
  %321 = sext i32 %320 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %321, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %321, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %321, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %321, i1 %.cond)
  %322 = zext i8 %318 to i32
  %323 = shl i32 %322, 1
  %324 = trunc i32 %323 to i8
  %325 = zext i8 %324 to i32
  %326 = ashr i32 %325, 7
  %327 = sext i32 %326 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %327, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %327, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %327, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %327, i1 %.cond)
  %328 = zext i8 %324 to i32
  %329 = shl i32 %328, 1
  %330 = trunc i32 %329 to i8
  %331 = zext i8 %330 to i32
  %332 = ashr i32 %331, 7
  %333 = sext i32 %332 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %333, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %333, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %333, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %333, i1 %.cond)
  %334 = zext i8 %330 to i32
  %335 = shl i32 %334, 1
  %336 = trunc i32 %335 to i8
  %337 = zext i8 %336 to i32
  %338 = ashr i32 %337, 7
  %339 = sext i32 %338 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %339, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %339, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %339, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %339, i1 %.cond)
  %340 = zext i8 %336 to i32
  %341 = shl i32 %340, 1
  %342 = trunc i32 %341 to i8
  %343 = zext i8 %342 to i32
  %344 = ashr i32 %343, 7
  %345 = sext i32 %344 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %345, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %345, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %345, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %345, i1 %.cond)
  %346 = zext i8 %342 to i32
  %347 = shl i32 %346, 1
  %348 = trunc i32 %347 to i8
  %349 = zext i8 %348 to i32
  %350 = ashr i32 %349, 7
  %351 = sext i32 %350 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %351, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %351, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %351, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %351, i1 %.cond)
  %352 = zext i8 %348 to i32
  %353 = shl i32 %352, 1
  %354 = trunc i32 %353 to i8
  %355 = zext i8 %354 to i32
  %356 = ashr i32 %355, 7
  %357 = sext i32 %356 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %357, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %357, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %357, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %357, i1 %.cond)
  %358 = zext i8 %354 to i32
  %359 = shl i32 %358, 1
  %360 = trunc i32 %359 to i8
  %361 = zext i8 %360 to i32
  %362 = ashr i32 %361, 7
  %363 = sext i32 %362 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %363, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %363, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %363, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %363, i1 %.cond)
  %364 = zext i8 %360 to i32
  %365 = getelementptr inbounds i8, i8* %2, i64 25
  %366 = load i1, i1* %out.
  %367 = icmp slt i64 25, %len.2
  %368 = bitcast i64* %shadow to i8*
  %safe.25 = or i1 %366, %367
  %select.ptr.26 = select i1 %safe.25, i8* %365, i8* %368
  %369 = load i8, i8* %select.ptr.26, align 1
  %370 = zext i8 %369 to i32
  %371 = ashr i32 %370, 7
  %372 = sext i32 %371 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %372, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %372, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %372, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %372, i1 %.cond)
  %373 = zext i8 %369 to i32
  %374 = shl i32 %373, 1
  %375 = trunc i32 %374 to i8
  %376 = zext i8 %375 to i32
  %377 = ashr i32 %376, 7
  %378 = sext i32 %377 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %378, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %378, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %378, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %378, i1 %.cond)
  %379 = zext i8 %375 to i32
  %380 = shl i32 %379, 1
  %381 = trunc i32 %380 to i8
  %382 = zext i8 %381 to i32
  %383 = ashr i32 %382, 7
  %384 = sext i32 %383 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %384, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %384, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %384, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %384, i1 %.cond)
  %385 = zext i8 %381 to i32
  %386 = shl i32 %385, 1
  %387 = trunc i32 %386 to i8
  %388 = zext i8 %387 to i32
  %389 = ashr i32 %388, 7
  %390 = sext i32 %389 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %390, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %390, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %390, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %390, i1 %.cond)
  %391 = zext i8 %387 to i32
  %392 = shl i32 %391, 1
  %393 = trunc i32 %392 to i8
  %394 = zext i8 %393 to i32
  %395 = ashr i32 %394, 7
  %396 = sext i32 %395 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %396, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %396, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %396, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %396, i1 %.cond)
  %397 = zext i8 %393 to i32
  %398 = shl i32 %397, 1
  %399 = trunc i32 %398 to i8
  %400 = zext i8 %399 to i32
  %401 = ashr i32 %400, 7
  %402 = sext i32 %401 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %402, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %402, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %402, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %402, i1 %.cond)
  %403 = zext i8 %399 to i32
  %404 = shl i32 %403, 1
  %405 = trunc i32 %404 to i8
  %406 = zext i8 %405 to i32
  %407 = ashr i32 %406, 7
  %408 = sext i32 %407 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %408, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %408, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %408, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %408, i1 %.cond)
  %409 = zext i8 %405 to i32
  %410 = shl i32 %409, 1
  %411 = trunc i32 %410 to i8
  %412 = zext i8 %411 to i32
  %413 = ashr i32 %412, 7
  %414 = sext i32 %413 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %414, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %414, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %414, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %414, i1 %.cond)
  %415 = zext i8 %411 to i32
  %416 = getelementptr inbounds i8, i8* %2, i64 24
  %417 = load i1, i1* %out.
  %418 = icmp slt i64 24, %len.2
  %419 = bitcast i64* %shadow to i8*
  %safe.27 = or i1 %417, %418
  %select.ptr.28 = select i1 %safe.27, i8* %416, i8* %419
  %420 = load i8, i8* %select.ptr.28, align 1
  %421 = zext i8 %420 to i32
  %422 = ashr i32 %421, 7
  %423 = sext i32 %422 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %423, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %423, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %423, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %423, i1 %.cond)
  %424 = zext i8 %420 to i32
  %425 = shl i32 %424, 1
  %426 = trunc i32 %425 to i8
  %427 = zext i8 %426 to i32
  %428 = ashr i32 %427, 7
  %429 = sext i32 %428 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %429, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %429, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %429, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %429, i1 %.cond)
  %430 = zext i8 %426 to i32
  %431 = shl i32 %430, 1
  %432 = trunc i32 %431 to i8
  %433 = zext i8 %432 to i32
  %434 = ashr i32 %433, 7
  %435 = sext i32 %434 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %435, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %435, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %435, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %435, i1 %.cond)
  %436 = zext i8 %432 to i32
  %437 = shl i32 %436, 1
  %438 = trunc i32 %437 to i8
  %439 = zext i8 %438 to i32
  %440 = ashr i32 %439, 7
  %441 = sext i32 %440 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %441, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %441, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %441, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %441, i1 %.cond)
  %442 = zext i8 %438 to i32
  %443 = shl i32 %442, 1
  %444 = trunc i32 %443 to i8
  %445 = zext i8 %444 to i32
  %446 = ashr i32 %445, 7
  %447 = sext i32 %446 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %447, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %447, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %447, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %447, i1 %.cond)
  %448 = zext i8 %444 to i32
  %449 = shl i32 %448, 1
  %450 = trunc i32 %449 to i8
  %451 = zext i8 %450 to i32
  %452 = ashr i32 %451, 7
  %453 = sext i32 %452 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %453, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %453, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %453, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %453, i1 %.cond)
  %454 = zext i8 %450 to i32
  %455 = shl i32 %454, 1
  %456 = trunc i32 %455 to i8
  %457 = zext i8 %456 to i32
  %458 = ashr i32 %457, 7
  %459 = sext i32 %458 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %459, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %459, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %459, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %459, i1 %.cond)
  %460 = zext i8 %456 to i32
  %461 = shl i32 %460, 1
  %462 = trunc i32 %461 to i8
  %463 = zext i8 %462 to i32
  %464 = ashr i32 %463, 7
  %465 = sext i32 %464 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %465, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %465, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %465, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %465, i1 %.cond)
  %466 = zext i8 %462 to i32
  %467 = getelementptr inbounds i8, i8* %2, i64 23
  %468 = load i1, i1* %out.
  %469 = icmp slt i64 23, %len.2
  %470 = bitcast i64* %shadow to i8*
  %safe.29 = or i1 %468, %469
  %select.ptr.30 = select i1 %safe.29, i8* %467, i8* %470
  %471 = load i8, i8* %select.ptr.30, align 1
  %472 = zext i8 %471 to i32
  %473 = ashr i32 %472, 7
  %474 = sext i32 %473 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %474, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %474, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %474, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %474, i1 %.cond)
  %475 = zext i8 %471 to i32
  %476 = shl i32 %475, 1
  %477 = trunc i32 %476 to i8
  %478 = zext i8 %477 to i32
  %479 = ashr i32 %478, 7
  %480 = sext i32 %479 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %480, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %480, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %480, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %480, i1 %.cond)
  %481 = zext i8 %477 to i32
  %482 = shl i32 %481, 1
  %483 = trunc i32 %482 to i8
  %484 = zext i8 %483 to i32
  %485 = ashr i32 %484, 7
  %486 = sext i32 %485 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %486, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %486, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %486, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %486, i1 %.cond)
  %487 = zext i8 %483 to i32
  %488 = shl i32 %487, 1
  %489 = trunc i32 %488 to i8
  %490 = zext i8 %489 to i32
  %491 = ashr i32 %490, 7
  %492 = sext i32 %491 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %492, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %492, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %492, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %492, i1 %.cond)
  %493 = zext i8 %489 to i32
  %494 = shl i32 %493, 1
  %495 = trunc i32 %494 to i8
  %496 = zext i8 %495 to i32
  %497 = ashr i32 %496, 7
  %498 = sext i32 %497 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %498, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %498, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %498, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %498, i1 %.cond)
  %499 = zext i8 %495 to i32
  %500 = shl i32 %499, 1
  %501 = trunc i32 %500 to i8
  %502 = zext i8 %501 to i32
  %503 = ashr i32 %502, 7
  %504 = sext i32 %503 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %504, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %504, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %504, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %504, i1 %.cond)
  %505 = zext i8 %501 to i32
  %506 = shl i32 %505, 1
  %507 = trunc i32 %506 to i8
  %508 = zext i8 %507 to i32
  %509 = ashr i32 %508, 7
  %510 = sext i32 %509 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %510, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %510, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %510, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %510, i1 %.cond)
  %511 = zext i8 %507 to i32
  %512 = shl i32 %511, 1
  %513 = trunc i32 %512 to i8
  %514 = zext i8 %513 to i32
  %515 = ashr i32 %514, 7
  %516 = sext i32 %515 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %516, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %516, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %516, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %516, i1 %.cond)
  %517 = zext i8 %513 to i32
  %518 = getelementptr inbounds i8, i8* %2, i64 22
  %519 = load i1, i1* %out.
  %520 = icmp slt i64 22, %len.2
  %521 = bitcast i64* %shadow to i8*
  %safe.31 = or i1 %519, %520
  %select.ptr.32 = select i1 %safe.31, i8* %518, i8* %521
  %522 = load i8, i8* %select.ptr.32, align 1
  %523 = zext i8 %522 to i32
  %524 = ashr i32 %523, 7
  %525 = sext i32 %524 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %525, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %525, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %525, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %525, i1 %.cond)
  %526 = zext i8 %522 to i32
  %527 = shl i32 %526, 1
  %528 = trunc i32 %527 to i8
  %529 = zext i8 %528 to i32
  %530 = ashr i32 %529, 7
  %531 = sext i32 %530 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %531, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %531, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %531, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %531, i1 %.cond)
  %532 = zext i8 %528 to i32
  %533 = shl i32 %532, 1
  %534 = trunc i32 %533 to i8
  %535 = zext i8 %534 to i32
  %536 = ashr i32 %535, 7
  %537 = sext i32 %536 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %537, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %537, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %537, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %537, i1 %.cond)
  %538 = zext i8 %534 to i32
  %539 = shl i32 %538, 1
  %540 = trunc i32 %539 to i8
  %541 = zext i8 %540 to i32
  %542 = ashr i32 %541, 7
  %543 = sext i32 %542 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %543, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %543, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %543, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %543, i1 %.cond)
  %544 = zext i8 %540 to i32
  %545 = shl i32 %544, 1
  %546 = trunc i32 %545 to i8
  %547 = zext i8 %546 to i32
  %548 = ashr i32 %547, 7
  %549 = sext i32 %548 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %549, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %549, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %549, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %549, i1 %.cond)
  %550 = zext i8 %546 to i32
  %551 = shl i32 %550, 1
  %552 = trunc i32 %551 to i8
  %553 = zext i8 %552 to i32
  %554 = ashr i32 %553, 7
  %555 = sext i32 %554 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %555, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %555, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %555, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %555, i1 %.cond)
  %556 = zext i8 %552 to i32
  %557 = shl i32 %556, 1
  %558 = trunc i32 %557 to i8
  %559 = zext i8 %558 to i32
  %560 = ashr i32 %559, 7
  %561 = sext i32 %560 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %561, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %561, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %561, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %561, i1 %.cond)
  %562 = zext i8 %558 to i32
  %563 = shl i32 %562, 1
  %564 = trunc i32 %563 to i8
  %565 = zext i8 %564 to i32
  %566 = ashr i32 %565, 7
  %567 = sext i32 %566 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %567, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %567, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %567, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %567, i1 %.cond)
  %568 = zext i8 %564 to i32
  %569 = getelementptr inbounds i8, i8* %2, i64 21
  %570 = load i1, i1* %out.
  %571 = icmp slt i64 21, %len.2
  %572 = bitcast i64* %shadow to i8*
  %safe.33 = or i1 %570, %571
  %select.ptr.34 = select i1 %safe.33, i8* %569, i8* %572
  %573 = load i8, i8* %select.ptr.34, align 1
  %574 = zext i8 %573 to i32
  %575 = ashr i32 %574, 7
  %576 = sext i32 %575 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %576, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %576, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %576, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %576, i1 %.cond)
  %577 = zext i8 %573 to i32
  %578 = shl i32 %577, 1
  %579 = trunc i32 %578 to i8
  %580 = zext i8 %579 to i32
  %581 = ashr i32 %580, 7
  %582 = sext i32 %581 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %582, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %582, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %582, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %582, i1 %.cond)
  %583 = zext i8 %579 to i32
  %584 = shl i32 %583, 1
  %585 = trunc i32 %584 to i8
  %586 = zext i8 %585 to i32
  %587 = ashr i32 %586, 7
  %588 = sext i32 %587 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %588, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %588, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %588, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %588, i1 %.cond)
  %589 = zext i8 %585 to i32
  %590 = shl i32 %589, 1
  %591 = trunc i32 %590 to i8
  %592 = zext i8 %591 to i32
  %593 = ashr i32 %592, 7
  %594 = sext i32 %593 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %594, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %594, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %594, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %594, i1 %.cond)
  %595 = zext i8 %591 to i32
  %596 = shl i32 %595, 1
  %597 = trunc i32 %596 to i8
  %598 = zext i8 %597 to i32
  %599 = ashr i32 %598, 7
  %600 = sext i32 %599 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %600, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %600, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %600, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %600, i1 %.cond)
  %601 = zext i8 %597 to i32
  %602 = shl i32 %601, 1
  %603 = trunc i32 %602 to i8
  %604 = zext i8 %603 to i32
  %605 = ashr i32 %604, 7
  %606 = sext i32 %605 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %606, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %606, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %606, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %606, i1 %.cond)
  %607 = zext i8 %603 to i32
  %608 = shl i32 %607, 1
  %609 = trunc i32 %608 to i8
  %610 = zext i8 %609 to i32
  %611 = ashr i32 %610, 7
  %612 = sext i32 %611 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %612, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %612, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %612, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %612, i1 %.cond)
  %613 = zext i8 %609 to i32
  %614 = shl i32 %613, 1
  %615 = trunc i32 %614 to i8
  %616 = zext i8 %615 to i32
  %617 = ashr i32 %616, 7
  %618 = sext i32 %617 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %618, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %618, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %618, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %618, i1 %.cond)
  %619 = zext i8 %615 to i32
  %620 = getelementptr inbounds i8, i8* %2, i64 20
  %621 = load i1, i1* %out.
  %622 = icmp slt i64 20, %len.2
  %623 = bitcast i64* %shadow to i8*
  %safe.35 = or i1 %621, %622
  %select.ptr.36 = select i1 %safe.35, i8* %620, i8* %623
  %624 = load i8, i8* %select.ptr.36, align 1
  %625 = zext i8 %624 to i32
  %626 = ashr i32 %625, 7
  %627 = sext i32 %626 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %627, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %627, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %627, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %627, i1 %.cond)
  %628 = zext i8 %624 to i32
  %629 = shl i32 %628, 1
  %630 = trunc i32 %629 to i8
  %631 = zext i8 %630 to i32
  %632 = ashr i32 %631, 7
  %633 = sext i32 %632 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %633, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %633, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %633, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %633, i1 %.cond)
  %634 = zext i8 %630 to i32
  %635 = shl i32 %634, 1
  %636 = trunc i32 %635 to i8
  %637 = zext i8 %636 to i32
  %638 = ashr i32 %637, 7
  %639 = sext i32 %638 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %639, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %639, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %639, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %639, i1 %.cond)
  %640 = zext i8 %636 to i32
  %641 = shl i32 %640, 1
  %642 = trunc i32 %641 to i8
  %643 = zext i8 %642 to i32
  %644 = ashr i32 %643, 7
  %645 = sext i32 %644 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %645, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %645, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %645, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %645, i1 %.cond)
  %646 = zext i8 %642 to i32
  %647 = shl i32 %646, 1
  %648 = trunc i32 %647 to i8
  %649 = zext i8 %648 to i32
  %650 = ashr i32 %649, 7
  %651 = sext i32 %650 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %651, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %651, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %651, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %651, i1 %.cond)
  %652 = zext i8 %648 to i32
  %653 = shl i32 %652, 1
  %654 = trunc i32 %653 to i8
  %655 = zext i8 %654 to i32
  %656 = ashr i32 %655, 7
  %657 = sext i32 %656 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %657, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %657, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %657, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %657, i1 %.cond)
  %658 = zext i8 %654 to i32
  %659 = shl i32 %658, 1
  %660 = trunc i32 %659 to i8
  %661 = zext i8 %660 to i32
  %662 = ashr i32 %661, 7
  %663 = sext i32 %662 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %663, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %663, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %663, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %663, i1 %.cond)
  %664 = zext i8 %660 to i32
  %665 = shl i32 %664, 1
  %666 = trunc i32 %665 to i8
  %667 = zext i8 %666 to i32
  %668 = ashr i32 %667, 7
  %669 = sext i32 %668 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %669, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %669, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %669, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %669, i1 %.cond)
  %670 = zext i8 %666 to i32
  %671 = getelementptr inbounds i8, i8* %2, i64 19
  %672 = load i1, i1* %out.
  %673 = icmp slt i64 19, %len.2
  %674 = bitcast i64* %shadow to i8*
  %safe.37 = or i1 %672, %673
  %select.ptr.38 = select i1 %safe.37, i8* %671, i8* %674
  %675 = load i8, i8* %select.ptr.38, align 1
  %676 = zext i8 %675 to i32
  %677 = ashr i32 %676, 7
  %678 = sext i32 %677 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %678, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %678, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %678, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %678, i1 %.cond)
  %679 = zext i8 %675 to i32
  %680 = shl i32 %679, 1
  %681 = trunc i32 %680 to i8
  %682 = zext i8 %681 to i32
  %683 = ashr i32 %682, 7
  %684 = sext i32 %683 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %684, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %684, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %684, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %684, i1 %.cond)
  %685 = zext i8 %681 to i32
  %686 = shl i32 %685, 1
  %687 = trunc i32 %686 to i8
  %688 = zext i8 %687 to i32
  %689 = ashr i32 %688, 7
  %690 = sext i32 %689 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %690, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %690, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %690, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %690, i1 %.cond)
  %691 = zext i8 %687 to i32
  %692 = shl i32 %691, 1
  %693 = trunc i32 %692 to i8
  %694 = zext i8 %693 to i32
  %695 = ashr i32 %694, 7
  %696 = sext i32 %695 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %696, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %696, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %696, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %696, i1 %.cond)
  %697 = zext i8 %693 to i32
  %698 = shl i32 %697, 1
  %699 = trunc i32 %698 to i8
  %700 = zext i8 %699 to i32
  %701 = ashr i32 %700, 7
  %702 = sext i32 %701 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %702, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %702, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %702, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %702, i1 %.cond)
  %703 = zext i8 %699 to i32
  %704 = shl i32 %703, 1
  %705 = trunc i32 %704 to i8
  %706 = zext i8 %705 to i32
  %707 = ashr i32 %706, 7
  %708 = sext i32 %707 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %708, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %708, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %708, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %708, i1 %.cond)
  %709 = zext i8 %705 to i32
  %710 = shl i32 %709, 1
  %711 = trunc i32 %710 to i8
  %712 = zext i8 %711 to i32
  %713 = ashr i32 %712, 7
  %714 = sext i32 %713 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %714, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %714, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %714, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %714, i1 %.cond)
  %715 = zext i8 %711 to i32
  %716 = shl i32 %715, 1
  %717 = trunc i32 %716 to i8
  %718 = zext i8 %717 to i32
  %719 = ashr i32 %718, 7
  %720 = sext i32 %719 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %720, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %720, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %720, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %720, i1 %.cond)
  %721 = zext i8 %717 to i32
  %722 = getelementptr inbounds i8, i8* %2, i64 18
  %723 = load i1, i1* %out.
  %724 = icmp slt i64 18, %len.2
  %725 = bitcast i64* %shadow to i8*
  %safe.39 = or i1 %723, %724
  %select.ptr.40 = select i1 %safe.39, i8* %722, i8* %725
  %726 = load i8, i8* %select.ptr.40, align 1
  %727 = zext i8 %726 to i32
  %728 = ashr i32 %727, 7
  %729 = sext i32 %728 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %729, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %729, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %729, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %729, i1 %.cond)
  %730 = zext i8 %726 to i32
  %731 = shl i32 %730, 1
  %732 = trunc i32 %731 to i8
  %733 = zext i8 %732 to i32
  %734 = ashr i32 %733, 7
  %735 = sext i32 %734 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %735, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %735, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %735, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %735, i1 %.cond)
  %736 = zext i8 %732 to i32
  %737 = shl i32 %736, 1
  %738 = trunc i32 %737 to i8
  %739 = zext i8 %738 to i32
  %740 = ashr i32 %739, 7
  %741 = sext i32 %740 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %741, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %741, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %741, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %741, i1 %.cond)
  %742 = zext i8 %738 to i32
  %743 = shl i32 %742, 1
  %744 = trunc i32 %743 to i8
  %745 = zext i8 %744 to i32
  %746 = ashr i32 %745, 7
  %747 = sext i32 %746 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %747, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %747, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %747, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %747, i1 %.cond)
  %748 = zext i8 %744 to i32
  %749 = shl i32 %748, 1
  %750 = trunc i32 %749 to i8
  %751 = zext i8 %750 to i32
  %752 = ashr i32 %751, 7
  %753 = sext i32 %752 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %753, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %753, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %753, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %753, i1 %.cond)
  %754 = zext i8 %750 to i32
  %755 = shl i32 %754, 1
  %756 = trunc i32 %755 to i8
  %757 = zext i8 %756 to i32
  %758 = ashr i32 %757, 7
  %759 = sext i32 %758 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %759, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %759, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %759, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %759, i1 %.cond)
  %760 = zext i8 %756 to i32
  %761 = shl i32 %760, 1
  %762 = trunc i32 %761 to i8
  %763 = zext i8 %762 to i32
  %764 = ashr i32 %763, 7
  %765 = sext i32 %764 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %765, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %765, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %765, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %765, i1 %.cond)
  %766 = zext i8 %762 to i32
  %767 = shl i32 %766, 1
  %768 = trunc i32 %767 to i8
  %769 = zext i8 %768 to i32
  %770 = ashr i32 %769, 7
  %771 = sext i32 %770 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %771, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %771, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %771, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %771, i1 %.cond)
  %772 = zext i8 %768 to i32
  %773 = getelementptr inbounds i8, i8* %2, i64 17
  %774 = load i1, i1* %out.
  %775 = icmp slt i64 17, %len.2
  %776 = bitcast i64* %shadow to i8*
  %safe.41 = or i1 %774, %775
  %select.ptr.42 = select i1 %safe.41, i8* %773, i8* %776
  %777 = load i8, i8* %select.ptr.42, align 1
  %778 = zext i8 %777 to i32
  %779 = ashr i32 %778, 7
  %780 = sext i32 %779 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %780, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %780, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %780, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %780, i1 %.cond)
  %781 = zext i8 %777 to i32
  %782 = shl i32 %781, 1
  %783 = trunc i32 %782 to i8
  %784 = zext i8 %783 to i32
  %785 = ashr i32 %784, 7
  %786 = sext i32 %785 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %786, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %786, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %786, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %786, i1 %.cond)
  %787 = zext i8 %783 to i32
  %788 = shl i32 %787, 1
  %789 = trunc i32 %788 to i8
  %790 = zext i8 %789 to i32
  %791 = ashr i32 %790, 7
  %792 = sext i32 %791 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %792, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %792, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %792, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %792, i1 %.cond)
  %793 = zext i8 %789 to i32
  %794 = shl i32 %793, 1
  %795 = trunc i32 %794 to i8
  %796 = zext i8 %795 to i32
  %797 = ashr i32 %796, 7
  %798 = sext i32 %797 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %798, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %798, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %798, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %798, i1 %.cond)
  %799 = zext i8 %795 to i32
  %800 = shl i32 %799, 1
  %801 = trunc i32 %800 to i8
  %802 = zext i8 %801 to i32
  %803 = ashr i32 %802, 7
  %804 = sext i32 %803 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %804, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %804, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %804, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %804, i1 %.cond)
  %805 = zext i8 %801 to i32
  %806 = shl i32 %805, 1
  %807 = trunc i32 %806 to i8
  %808 = zext i8 %807 to i32
  %809 = ashr i32 %808, 7
  %810 = sext i32 %809 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %810, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %810, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %810, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %810, i1 %.cond)
  %811 = zext i8 %807 to i32
  %812 = shl i32 %811, 1
  %813 = trunc i32 %812 to i8
  %814 = zext i8 %813 to i32
  %815 = ashr i32 %814, 7
  %816 = sext i32 %815 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %816, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %816, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %816, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %816, i1 %.cond)
  %817 = zext i8 %813 to i32
  %818 = shl i32 %817, 1
  %819 = trunc i32 %818 to i8
  %820 = zext i8 %819 to i32
  %821 = ashr i32 %820, 7
  %822 = sext i32 %821 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %822, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %822, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %822, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %822, i1 %.cond)
  %823 = zext i8 %819 to i32
  %824 = getelementptr inbounds i8, i8* %2, i64 16
  %825 = load i1, i1* %out.
  %826 = icmp slt i64 16, %len.2
  %827 = bitcast i64* %shadow to i8*
  %safe.43 = or i1 %825, %826
  %select.ptr.44 = select i1 %safe.43, i8* %824, i8* %827
  %828 = load i8, i8* %select.ptr.44, align 1
  %829 = zext i8 %828 to i32
  %830 = ashr i32 %829, 7
  %831 = sext i32 %830 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %831, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %831, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %831, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %831, i1 %.cond)
  %832 = zext i8 %828 to i32
  %833 = shl i32 %832, 1
  %834 = trunc i32 %833 to i8
  %835 = zext i8 %834 to i32
  %836 = ashr i32 %835, 7
  %837 = sext i32 %836 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %837, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %837, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %837, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %837, i1 %.cond)
  %838 = zext i8 %834 to i32
  %839 = shl i32 %838, 1
  %840 = trunc i32 %839 to i8
  %841 = zext i8 %840 to i32
  %842 = ashr i32 %841, 7
  %843 = sext i32 %842 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %843, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %843, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %843, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %843, i1 %.cond)
  %844 = zext i8 %840 to i32
  %845 = shl i32 %844, 1
  %846 = trunc i32 %845 to i8
  %847 = zext i8 %846 to i32
  %848 = ashr i32 %847, 7
  %849 = sext i32 %848 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %849, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %849, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %849, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %849, i1 %.cond)
  %850 = zext i8 %846 to i32
  %851 = shl i32 %850, 1
  %852 = trunc i32 %851 to i8
  %853 = zext i8 %852 to i32
  %854 = ashr i32 %853, 7
  %855 = sext i32 %854 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %855, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %855, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %855, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %855, i1 %.cond)
  %856 = zext i8 %852 to i32
  %857 = shl i32 %856, 1
  %858 = trunc i32 %857 to i8
  %859 = zext i8 %858 to i32
  %860 = ashr i32 %859, 7
  %861 = sext i32 %860 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %861, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %861, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %861, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %861, i1 %.cond)
  %862 = zext i8 %858 to i32
  %863 = shl i32 %862, 1
  %864 = trunc i32 %863 to i8
  %865 = zext i8 %864 to i32
  %866 = ashr i32 %865, 7
  %867 = sext i32 %866 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %867, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %867, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %867, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %867, i1 %.cond)
  %868 = zext i8 %864 to i32
  %869 = shl i32 %868, 1
  %870 = trunc i32 %869 to i8
  %871 = zext i8 %870 to i32
  %872 = ashr i32 %871, 7
  %873 = sext i32 %872 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %873, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %873, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %873, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %873, i1 %.cond)
  %874 = zext i8 %870 to i32
  %875 = getelementptr inbounds i8, i8* %2, i64 15
  %876 = load i1, i1* %out.
  %877 = icmp slt i64 15, %len.2
  %878 = bitcast i64* %shadow to i8*
  %safe.45 = or i1 %876, %877
  %select.ptr.46 = select i1 %safe.45, i8* %875, i8* %878
  %879 = load i8, i8* %select.ptr.46, align 1
  %880 = zext i8 %879 to i32
  %881 = ashr i32 %880, 7
  %882 = sext i32 %881 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %882, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %882, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %882, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %882, i1 %.cond)
  %883 = zext i8 %879 to i32
  %884 = shl i32 %883, 1
  %885 = trunc i32 %884 to i8
  %886 = zext i8 %885 to i32
  %887 = ashr i32 %886, 7
  %888 = sext i32 %887 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %888, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %888, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %888, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %888, i1 %.cond)
  %889 = zext i8 %885 to i32
  %890 = shl i32 %889, 1
  %891 = trunc i32 %890 to i8
  %892 = zext i8 %891 to i32
  %893 = ashr i32 %892, 7
  %894 = sext i32 %893 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %894, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %894, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %894, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %894, i1 %.cond)
  %895 = zext i8 %891 to i32
  %896 = shl i32 %895, 1
  %897 = trunc i32 %896 to i8
  %898 = zext i8 %897 to i32
  %899 = ashr i32 %898, 7
  %900 = sext i32 %899 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %900, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %900, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %900, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %900, i1 %.cond)
  %901 = zext i8 %897 to i32
  %902 = shl i32 %901, 1
  %903 = trunc i32 %902 to i8
  %904 = zext i8 %903 to i32
  %905 = ashr i32 %904, 7
  %906 = sext i32 %905 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %906, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %906, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %906, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %906, i1 %.cond)
  %907 = zext i8 %903 to i32
  %908 = shl i32 %907, 1
  %909 = trunc i32 %908 to i8
  %910 = zext i8 %909 to i32
  %911 = ashr i32 %910, 7
  %912 = sext i32 %911 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %912, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %912, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %912, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %912, i1 %.cond)
  %913 = zext i8 %909 to i32
  %914 = shl i32 %913, 1
  %915 = trunc i32 %914 to i8
  %916 = zext i8 %915 to i32
  %917 = ashr i32 %916, 7
  %918 = sext i32 %917 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %918, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %918, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %918, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %918, i1 %.cond)
  %919 = zext i8 %915 to i32
  %920 = shl i32 %919, 1
  %921 = trunc i32 %920 to i8
  %922 = zext i8 %921 to i32
  %923 = ashr i32 %922, 7
  %924 = sext i32 %923 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %924, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %924, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %924, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %924, i1 %.cond)
  %925 = zext i8 %921 to i32
  %926 = getelementptr inbounds i8, i8* %2, i64 14
  %927 = load i1, i1* %out.
  %928 = icmp slt i64 14, %len.2
  %929 = bitcast i64* %shadow to i8*
  %safe.47 = or i1 %927, %928
  %select.ptr.48 = select i1 %safe.47, i8* %926, i8* %929
  %930 = load i8, i8* %select.ptr.48, align 1
  %931 = zext i8 %930 to i32
  %932 = ashr i32 %931, 7
  %933 = sext i32 %932 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %933, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %933, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %933, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %933, i1 %.cond)
  %934 = zext i8 %930 to i32
  %935 = shl i32 %934, 1
  %936 = trunc i32 %935 to i8
  %937 = zext i8 %936 to i32
  %938 = ashr i32 %937, 7
  %939 = sext i32 %938 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %939, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %939, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %939, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %939, i1 %.cond)
  %940 = zext i8 %936 to i32
  %941 = shl i32 %940, 1
  %942 = trunc i32 %941 to i8
  %943 = zext i8 %942 to i32
  %944 = ashr i32 %943, 7
  %945 = sext i32 %944 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %945, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %945, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %945, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %945, i1 %.cond)
  %946 = zext i8 %942 to i32
  %947 = shl i32 %946, 1
  %948 = trunc i32 %947 to i8
  %949 = zext i8 %948 to i32
  %950 = ashr i32 %949, 7
  %951 = sext i32 %950 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %951, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %951, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %951, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %951, i1 %.cond)
  %952 = zext i8 %948 to i32
  %953 = shl i32 %952, 1
  %954 = trunc i32 %953 to i8
  %955 = zext i8 %954 to i32
  %956 = ashr i32 %955, 7
  %957 = sext i32 %956 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %957, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %957, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %957, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %957, i1 %.cond)
  %958 = zext i8 %954 to i32
  %959 = shl i32 %958, 1
  %960 = trunc i32 %959 to i8
  %961 = zext i8 %960 to i32
  %962 = ashr i32 %961, 7
  %963 = sext i32 %962 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %963, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %963, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %963, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %963, i1 %.cond)
  %964 = zext i8 %960 to i32
  %965 = shl i32 %964, 1
  %966 = trunc i32 %965 to i8
  %967 = zext i8 %966 to i32
  %968 = ashr i32 %967, 7
  %969 = sext i32 %968 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %969, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %969, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %969, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %969, i1 %.cond)
  %970 = zext i8 %966 to i32
  %971 = shl i32 %970, 1
  %972 = trunc i32 %971 to i8
  %973 = zext i8 %972 to i32
  %974 = ashr i32 %973, 7
  %975 = sext i32 %974 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %975, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %975, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %975, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %975, i1 %.cond)
  %976 = zext i8 %972 to i32
  %977 = getelementptr inbounds i8, i8* %2, i64 13
  %978 = load i1, i1* %out.
  %979 = icmp slt i64 13, %len.2
  %980 = bitcast i64* %shadow to i8*
  %safe.49 = or i1 %978, %979
  %select.ptr.50 = select i1 %safe.49, i8* %977, i8* %980
  %981 = load i8, i8* %select.ptr.50, align 1
  %982 = zext i8 %981 to i32
  %983 = ashr i32 %982, 7
  %984 = sext i32 %983 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %984, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %984, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %984, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %984, i1 %.cond)
  %985 = zext i8 %981 to i32
  %986 = shl i32 %985, 1
  %987 = trunc i32 %986 to i8
  %988 = zext i8 %987 to i32
  %989 = ashr i32 %988, 7
  %990 = sext i32 %989 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %990, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %990, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %990, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %990, i1 %.cond)
  %991 = zext i8 %987 to i32
  %992 = shl i32 %991, 1
  %993 = trunc i32 %992 to i8
  %994 = zext i8 %993 to i32
  %995 = ashr i32 %994, 7
  %996 = sext i32 %995 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %996, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %996, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %996, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %996, i1 %.cond)
  %997 = zext i8 %993 to i32
  %998 = shl i32 %997, 1
  %999 = trunc i32 %998 to i8
  %1000 = zext i8 %999 to i32
  %1001 = ashr i32 %1000, 7
  %1002 = sext i32 %1001 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1002, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1002, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1002, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1002, i1 %.cond)
  %1003 = zext i8 %999 to i32
  %1004 = shl i32 %1003, 1
  %1005 = trunc i32 %1004 to i8
  %1006 = zext i8 %1005 to i32
  %1007 = ashr i32 %1006, 7
  %1008 = sext i32 %1007 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1008, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1008, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1008, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1008, i1 %.cond)
  %1009 = zext i8 %1005 to i32
  %1010 = shl i32 %1009, 1
  %1011 = trunc i32 %1010 to i8
  %1012 = zext i8 %1011 to i32
  %1013 = ashr i32 %1012, 7
  %1014 = sext i32 %1013 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1014, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1014, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1014, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1014, i1 %.cond)
  %1015 = zext i8 %1011 to i32
  %1016 = shl i32 %1015, 1
  %1017 = trunc i32 %1016 to i8
  %1018 = zext i8 %1017 to i32
  %1019 = ashr i32 %1018, 7
  %1020 = sext i32 %1019 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1020, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1020, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1020, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1020, i1 %.cond)
  %1021 = zext i8 %1017 to i32
  %1022 = shl i32 %1021, 1
  %1023 = trunc i32 %1022 to i8
  %1024 = zext i8 %1023 to i32
  %1025 = ashr i32 %1024, 7
  %1026 = sext i32 %1025 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1026, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1026, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1026, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1026, i1 %.cond)
  %1027 = zext i8 %1023 to i32
  %1028 = getelementptr inbounds i8, i8* %2, i64 12
  %1029 = load i1, i1* %out.
  %1030 = icmp slt i64 12, %len.2
  %1031 = bitcast i64* %shadow to i8*
  %safe.51 = or i1 %1029, %1030
  %select.ptr.52 = select i1 %safe.51, i8* %1028, i8* %1031
  %1032 = load i8, i8* %select.ptr.52, align 1
  %1033 = zext i8 %1032 to i32
  %1034 = ashr i32 %1033, 7
  %1035 = sext i32 %1034 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1035, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1035, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1035, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1035, i1 %.cond)
  %1036 = zext i8 %1032 to i32
  %1037 = shl i32 %1036, 1
  %1038 = trunc i32 %1037 to i8
  %1039 = zext i8 %1038 to i32
  %1040 = ashr i32 %1039, 7
  %1041 = sext i32 %1040 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1041, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1041, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1041, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1041, i1 %.cond)
  %1042 = zext i8 %1038 to i32
  %1043 = shl i32 %1042, 1
  %1044 = trunc i32 %1043 to i8
  %1045 = zext i8 %1044 to i32
  %1046 = ashr i32 %1045, 7
  %1047 = sext i32 %1046 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1047, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1047, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1047, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1047, i1 %.cond)
  %1048 = zext i8 %1044 to i32
  %1049 = shl i32 %1048, 1
  %1050 = trunc i32 %1049 to i8
  %1051 = zext i8 %1050 to i32
  %1052 = ashr i32 %1051, 7
  %1053 = sext i32 %1052 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1053, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1053, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1053, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1053, i1 %.cond)
  %1054 = zext i8 %1050 to i32
  %1055 = shl i32 %1054, 1
  %1056 = trunc i32 %1055 to i8
  %1057 = zext i8 %1056 to i32
  %1058 = ashr i32 %1057, 7
  %1059 = sext i32 %1058 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1059, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1059, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1059, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1059, i1 %.cond)
  %1060 = zext i8 %1056 to i32
  %1061 = shl i32 %1060, 1
  %1062 = trunc i32 %1061 to i8
  %1063 = zext i8 %1062 to i32
  %1064 = ashr i32 %1063, 7
  %1065 = sext i32 %1064 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1065, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1065, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1065, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1065, i1 %.cond)
  %1066 = zext i8 %1062 to i32
  %1067 = shl i32 %1066, 1
  %1068 = trunc i32 %1067 to i8
  %1069 = zext i8 %1068 to i32
  %1070 = ashr i32 %1069, 7
  %1071 = sext i32 %1070 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1071, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1071, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1071, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1071, i1 %.cond)
  %1072 = zext i8 %1068 to i32
  %1073 = shl i32 %1072, 1
  %1074 = trunc i32 %1073 to i8
  %1075 = zext i8 %1074 to i32
  %1076 = ashr i32 %1075, 7
  %1077 = sext i32 %1076 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1077, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1077, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1077, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1077, i1 %.cond)
  %1078 = zext i8 %1074 to i32
  %1079 = getelementptr inbounds i8, i8* %2, i64 11
  %1080 = load i1, i1* %out.
  %1081 = icmp slt i64 11, %len.2
  %1082 = bitcast i64* %shadow to i8*
  %safe.53 = or i1 %1080, %1081
  %select.ptr.54 = select i1 %safe.53, i8* %1079, i8* %1082
  %1083 = load i8, i8* %select.ptr.54, align 1
  %1084 = zext i8 %1083 to i32
  %1085 = ashr i32 %1084, 7
  %1086 = sext i32 %1085 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1086, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1086, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1086, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1086, i1 %.cond)
  %1087 = zext i8 %1083 to i32
  %1088 = shl i32 %1087, 1
  %1089 = trunc i32 %1088 to i8
  %1090 = zext i8 %1089 to i32
  %1091 = ashr i32 %1090, 7
  %1092 = sext i32 %1091 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1092, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1092, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1092, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1092, i1 %.cond)
  %1093 = zext i8 %1089 to i32
  %1094 = shl i32 %1093, 1
  %1095 = trunc i32 %1094 to i8
  %1096 = zext i8 %1095 to i32
  %1097 = ashr i32 %1096, 7
  %1098 = sext i32 %1097 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1098, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1098, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1098, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1098, i1 %.cond)
  %1099 = zext i8 %1095 to i32
  %1100 = shl i32 %1099, 1
  %1101 = trunc i32 %1100 to i8
  %1102 = zext i8 %1101 to i32
  %1103 = ashr i32 %1102, 7
  %1104 = sext i32 %1103 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1104, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1104, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1104, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1104, i1 %.cond)
  %1105 = zext i8 %1101 to i32
  %1106 = shl i32 %1105, 1
  %1107 = trunc i32 %1106 to i8
  %1108 = zext i8 %1107 to i32
  %1109 = ashr i32 %1108, 7
  %1110 = sext i32 %1109 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1110, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1110, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1110, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1110, i1 %.cond)
  %1111 = zext i8 %1107 to i32
  %1112 = shl i32 %1111, 1
  %1113 = trunc i32 %1112 to i8
  %1114 = zext i8 %1113 to i32
  %1115 = ashr i32 %1114, 7
  %1116 = sext i32 %1115 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1116, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1116, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1116, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1116, i1 %.cond)
  %1117 = zext i8 %1113 to i32
  %1118 = shl i32 %1117, 1
  %1119 = trunc i32 %1118 to i8
  %1120 = zext i8 %1119 to i32
  %1121 = ashr i32 %1120, 7
  %1122 = sext i32 %1121 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1122, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1122, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1122, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1122, i1 %.cond)
  %1123 = zext i8 %1119 to i32
  %1124 = shl i32 %1123, 1
  %1125 = trunc i32 %1124 to i8
  %1126 = zext i8 %1125 to i32
  %1127 = ashr i32 %1126, 7
  %1128 = sext i32 %1127 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1128, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1128, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1128, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1128, i1 %.cond)
  %1129 = zext i8 %1125 to i32
  %1130 = getelementptr inbounds i8, i8* %2, i64 10
  %1131 = load i1, i1* %out.
  %1132 = icmp slt i64 10, %len.2
  %1133 = bitcast i64* %shadow to i8*
  %safe.55 = or i1 %1131, %1132
  %select.ptr.56 = select i1 %safe.55, i8* %1130, i8* %1133
  %1134 = load i8, i8* %select.ptr.56, align 1
  %1135 = zext i8 %1134 to i32
  %1136 = ashr i32 %1135, 7
  %1137 = sext i32 %1136 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1137, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1137, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1137, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1137, i1 %.cond)
  %1138 = zext i8 %1134 to i32
  %1139 = shl i32 %1138, 1
  %1140 = trunc i32 %1139 to i8
  %1141 = zext i8 %1140 to i32
  %1142 = ashr i32 %1141, 7
  %1143 = sext i32 %1142 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1143, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1143, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1143, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1143, i1 %.cond)
  %1144 = zext i8 %1140 to i32
  %1145 = shl i32 %1144, 1
  %1146 = trunc i32 %1145 to i8
  %1147 = zext i8 %1146 to i32
  %1148 = ashr i32 %1147, 7
  %1149 = sext i32 %1148 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1149, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1149, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1149, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1149, i1 %.cond)
  %1150 = zext i8 %1146 to i32
  %1151 = shl i32 %1150, 1
  %1152 = trunc i32 %1151 to i8
  %1153 = zext i8 %1152 to i32
  %1154 = ashr i32 %1153, 7
  %1155 = sext i32 %1154 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1155, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1155, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1155, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1155, i1 %.cond)
  %1156 = zext i8 %1152 to i32
  %1157 = shl i32 %1156, 1
  %1158 = trunc i32 %1157 to i8
  %1159 = zext i8 %1158 to i32
  %1160 = ashr i32 %1159, 7
  %1161 = sext i32 %1160 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1161, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1161, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1161, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1161, i1 %.cond)
  %1162 = zext i8 %1158 to i32
  %1163 = shl i32 %1162, 1
  %1164 = trunc i32 %1163 to i8
  %1165 = zext i8 %1164 to i32
  %1166 = ashr i32 %1165, 7
  %1167 = sext i32 %1166 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1167, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1167, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1167, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1167, i1 %.cond)
  %1168 = zext i8 %1164 to i32
  %1169 = shl i32 %1168, 1
  %1170 = trunc i32 %1169 to i8
  %1171 = zext i8 %1170 to i32
  %1172 = ashr i32 %1171, 7
  %1173 = sext i32 %1172 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1173, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1173, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1173, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1173, i1 %.cond)
  %1174 = zext i8 %1170 to i32
  %1175 = shl i32 %1174, 1
  %1176 = trunc i32 %1175 to i8
  %1177 = zext i8 %1176 to i32
  %1178 = ashr i32 %1177, 7
  %1179 = sext i32 %1178 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1179, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1179, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1179, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1179, i1 %.cond)
  %1180 = zext i8 %1176 to i32
  %1181 = getelementptr inbounds i8, i8* %2, i64 9
  %1182 = load i1, i1* %out.
  %1183 = icmp slt i64 9, %len.2
  %1184 = bitcast i64* %shadow to i8*
  %safe.57 = or i1 %1182, %1183
  %select.ptr.58 = select i1 %safe.57, i8* %1181, i8* %1184
  %1185 = load i8, i8* %select.ptr.58, align 1
  %1186 = zext i8 %1185 to i32
  %1187 = ashr i32 %1186, 7
  %1188 = sext i32 %1187 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1188, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1188, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1188, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1188, i1 %.cond)
  %1189 = zext i8 %1185 to i32
  %1190 = shl i32 %1189, 1
  %1191 = trunc i32 %1190 to i8
  %1192 = zext i8 %1191 to i32
  %1193 = ashr i32 %1192, 7
  %1194 = sext i32 %1193 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1194, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1194, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1194, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1194, i1 %.cond)
  %1195 = zext i8 %1191 to i32
  %1196 = shl i32 %1195, 1
  %1197 = trunc i32 %1196 to i8
  %1198 = zext i8 %1197 to i32
  %1199 = ashr i32 %1198, 7
  %1200 = sext i32 %1199 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1200, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1200, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1200, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1200, i1 %.cond)
  %1201 = zext i8 %1197 to i32
  %1202 = shl i32 %1201, 1
  %1203 = trunc i32 %1202 to i8
  %1204 = zext i8 %1203 to i32
  %1205 = ashr i32 %1204, 7
  %1206 = sext i32 %1205 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1206, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1206, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1206, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1206, i1 %.cond)
  %1207 = zext i8 %1203 to i32
  %1208 = shl i32 %1207, 1
  %1209 = trunc i32 %1208 to i8
  %1210 = zext i8 %1209 to i32
  %1211 = ashr i32 %1210, 7
  %1212 = sext i32 %1211 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1212, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1212, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1212, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1212, i1 %.cond)
  %1213 = zext i8 %1209 to i32
  %1214 = shl i32 %1213, 1
  %1215 = trunc i32 %1214 to i8
  %1216 = zext i8 %1215 to i32
  %1217 = ashr i32 %1216, 7
  %1218 = sext i32 %1217 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1218, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1218, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1218, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1218, i1 %.cond)
  %1219 = zext i8 %1215 to i32
  %1220 = shl i32 %1219, 1
  %1221 = trunc i32 %1220 to i8
  %1222 = zext i8 %1221 to i32
  %1223 = ashr i32 %1222, 7
  %1224 = sext i32 %1223 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1224, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1224, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1224, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1224, i1 %.cond)
  %1225 = zext i8 %1221 to i32
  %1226 = shl i32 %1225, 1
  %1227 = trunc i32 %1226 to i8
  %1228 = zext i8 %1227 to i32
  %1229 = ashr i32 %1228, 7
  %1230 = sext i32 %1229 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1230, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1230, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1230, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1230, i1 %.cond)
  %1231 = zext i8 %1227 to i32
  %1232 = getelementptr inbounds i8, i8* %2, i64 8
  %1233 = load i1, i1* %out.
  %1234 = icmp slt i64 8, %len.2
  %1235 = bitcast i64* %shadow to i8*
  %safe.59 = or i1 %1233, %1234
  %select.ptr.60 = select i1 %safe.59, i8* %1232, i8* %1235
  %1236 = load i8, i8* %select.ptr.60, align 1
  %1237 = zext i8 %1236 to i32
  %1238 = ashr i32 %1237, 7
  %1239 = sext i32 %1238 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1239, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1239, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1239, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1239, i1 %.cond)
  %1240 = zext i8 %1236 to i32
  %1241 = shl i32 %1240, 1
  %1242 = trunc i32 %1241 to i8
  %1243 = zext i8 %1242 to i32
  %1244 = ashr i32 %1243, 7
  %1245 = sext i32 %1244 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1245, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1245, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1245, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1245, i1 %.cond)
  %1246 = zext i8 %1242 to i32
  %1247 = shl i32 %1246, 1
  %1248 = trunc i32 %1247 to i8
  %1249 = zext i8 %1248 to i32
  %1250 = ashr i32 %1249, 7
  %1251 = sext i32 %1250 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1251, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1251, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1251, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1251, i1 %.cond)
  %1252 = zext i8 %1248 to i32
  %1253 = shl i32 %1252, 1
  %1254 = trunc i32 %1253 to i8
  %1255 = zext i8 %1254 to i32
  %1256 = ashr i32 %1255, 7
  %1257 = sext i32 %1256 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1257, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1257, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1257, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1257, i1 %.cond)
  %1258 = zext i8 %1254 to i32
  %1259 = shl i32 %1258, 1
  %1260 = trunc i32 %1259 to i8
  %1261 = zext i8 %1260 to i32
  %1262 = ashr i32 %1261, 7
  %1263 = sext i32 %1262 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1263, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1263, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1263, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1263, i1 %.cond)
  %1264 = zext i8 %1260 to i32
  %1265 = shl i32 %1264, 1
  %1266 = trunc i32 %1265 to i8
  %1267 = zext i8 %1266 to i32
  %1268 = ashr i32 %1267, 7
  %1269 = sext i32 %1268 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1269, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1269, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1269, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1269, i1 %.cond)
  %1270 = zext i8 %1266 to i32
  %1271 = shl i32 %1270, 1
  %1272 = trunc i32 %1271 to i8
  %1273 = zext i8 %1272 to i32
  %1274 = ashr i32 %1273, 7
  %1275 = sext i32 %1274 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1275, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1275, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1275, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1275, i1 %.cond)
  %1276 = zext i8 %1272 to i32
  %1277 = shl i32 %1276, 1
  %1278 = trunc i32 %1277 to i8
  %1279 = zext i8 %1278 to i32
  %1280 = ashr i32 %1279, 7
  %1281 = sext i32 %1280 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1281, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1281, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1281, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1281, i1 %.cond)
  %1282 = zext i8 %1278 to i32
  %1283 = getelementptr inbounds i8, i8* %2, i64 7
  %1284 = load i1, i1* %out.
  %1285 = icmp slt i64 7, %len.2
  %1286 = bitcast i64* %shadow to i8*
  %safe.61 = or i1 %1284, %1285
  %select.ptr.62 = select i1 %safe.61, i8* %1283, i8* %1286
  %1287 = load i8, i8* %select.ptr.62, align 1
  %1288 = zext i8 %1287 to i32
  %1289 = ashr i32 %1288, 7
  %1290 = sext i32 %1289 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1290, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1290, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1290, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1290, i1 %.cond)
  %1291 = zext i8 %1287 to i32
  %1292 = shl i32 %1291, 1
  %1293 = trunc i32 %1292 to i8
  %1294 = zext i8 %1293 to i32
  %1295 = ashr i32 %1294, 7
  %1296 = sext i32 %1295 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1296, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1296, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1296, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1296, i1 %.cond)
  %1297 = zext i8 %1293 to i32
  %1298 = shl i32 %1297, 1
  %1299 = trunc i32 %1298 to i8
  %1300 = zext i8 %1299 to i32
  %1301 = ashr i32 %1300, 7
  %1302 = sext i32 %1301 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1302, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1302, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1302, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1302, i1 %.cond)
  %1303 = zext i8 %1299 to i32
  %1304 = shl i32 %1303, 1
  %1305 = trunc i32 %1304 to i8
  %1306 = zext i8 %1305 to i32
  %1307 = ashr i32 %1306, 7
  %1308 = sext i32 %1307 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1308, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1308, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1308, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1308, i1 %.cond)
  %1309 = zext i8 %1305 to i32
  %1310 = shl i32 %1309, 1
  %1311 = trunc i32 %1310 to i8
  %1312 = zext i8 %1311 to i32
  %1313 = ashr i32 %1312, 7
  %1314 = sext i32 %1313 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1314, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1314, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1314, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1314, i1 %.cond)
  %1315 = zext i8 %1311 to i32
  %1316 = shl i32 %1315, 1
  %1317 = trunc i32 %1316 to i8
  %1318 = zext i8 %1317 to i32
  %1319 = ashr i32 %1318, 7
  %1320 = sext i32 %1319 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1320, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1320, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1320, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1320, i1 %.cond)
  %1321 = zext i8 %1317 to i32
  %1322 = shl i32 %1321, 1
  %1323 = trunc i32 %1322 to i8
  %1324 = zext i8 %1323 to i32
  %1325 = ashr i32 %1324, 7
  %1326 = sext i32 %1325 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1326, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1326, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1326, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1326, i1 %.cond)
  %1327 = zext i8 %1323 to i32
  %1328 = shl i32 %1327, 1
  %1329 = trunc i32 %1328 to i8
  %1330 = zext i8 %1329 to i32
  %1331 = ashr i32 %1330, 7
  %1332 = sext i32 %1331 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1332, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1332, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1332, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1332, i1 %.cond)
  %1333 = zext i8 %1329 to i32
  %1334 = getelementptr inbounds i8, i8* %2, i64 6
  %1335 = load i1, i1* %out.
  %1336 = icmp slt i64 6, %len.2
  %1337 = bitcast i64* %shadow to i8*
  %safe.63 = or i1 %1335, %1336
  %select.ptr.64 = select i1 %safe.63, i8* %1334, i8* %1337
  %1338 = load i8, i8* %select.ptr.64, align 1
  %1339 = zext i8 %1338 to i32
  %1340 = ashr i32 %1339, 7
  %1341 = sext i32 %1340 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1341, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1341, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1341, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1341, i1 %.cond)
  %1342 = zext i8 %1338 to i32
  %1343 = shl i32 %1342, 1
  %1344 = trunc i32 %1343 to i8
  %1345 = zext i8 %1344 to i32
  %1346 = ashr i32 %1345, 7
  %1347 = sext i32 %1346 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1347, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1347, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1347, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1347, i1 %.cond)
  %1348 = zext i8 %1344 to i32
  %1349 = shl i32 %1348, 1
  %1350 = trunc i32 %1349 to i8
  %1351 = zext i8 %1350 to i32
  %1352 = ashr i32 %1351, 7
  %1353 = sext i32 %1352 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1353, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1353, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1353, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1353, i1 %.cond)
  %1354 = zext i8 %1350 to i32
  %1355 = shl i32 %1354, 1
  %1356 = trunc i32 %1355 to i8
  %1357 = zext i8 %1356 to i32
  %1358 = ashr i32 %1357, 7
  %1359 = sext i32 %1358 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1359, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1359, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1359, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1359, i1 %.cond)
  %1360 = zext i8 %1356 to i32
  %1361 = shl i32 %1360, 1
  %1362 = trunc i32 %1361 to i8
  %1363 = zext i8 %1362 to i32
  %1364 = ashr i32 %1363, 7
  %1365 = sext i32 %1364 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1365, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1365, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1365, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1365, i1 %.cond)
  %1366 = zext i8 %1362 to i32
  %1367 = shl i32 %1366, 1
  %1368 = trunc i32 %1367 to i8
  %1369 = zext i8 %1368 to i32
  %1370 = ashr i32 %1369, 7
  %1371 = sext i32 %1370 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1371, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1371, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1371, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1371, i1 %.cond)
  %1372 = zext i8 %1368 to i32
  %1373 = shl i32 %1372, 1
  %1374 = trunc i32 %1373 to i8
  %1375 = zext i8 %1374 to i32
  %1376 = ashr i32 %1375, 7
  %1377 = sext i32 %1376 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1377, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1377, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1377, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1377, i1 %.cond)
  %1378 = zext i8 %1374 to i32
  %1379 = shl i32 %1378, 1
  %1380 = trunc i32 %1379 to i8
  %1381 = zext i8 %1380 to i32
  %1382 = ashr i32 %1381, 7
  %1383 = sext i32 %1382 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1383, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1383, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1383, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1383, i1 %.cond)
  %1384 = zext i8 %1380 to i32
  %1385 = getelementptr inbounds i8, i8* %2, i64 5
  %1386 = load i1, i1* %out.
  %1387 = icmp slt i64 5, %len.2
  %1388 = bitcast i64* %shadow to i8*
  %safe.65 = or i1 %1386, %1387
  %select.ptr.66 = select i1 %safe.65, i8* %1385, i8* %1388
  %1389 = load i8, i8* %select.ptr.66, align 1
  %1390 = zext i8 %1389 to i32
  %1391 = ashr i32 %1390, 7
  %1392 = sext i32 %1391 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1392, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1392, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1392, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1392, i1 %.cond)
  %1393 = zext i8 %1389 to i32
  %1394 = shl i32 %1393, 1
  %1395 = trunc i32 %1394 to i8
  %1396 = zext i8 %1395 to i32
  %1397 = ashr i32 %1396, 7
  %1398 = sext i32 %1397 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1398, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1398, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1398, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1398, i1 %.cond)
  %1399 = zext i8 %1395 to i32
  %1400 = shl i32 %1399, 1
  %1401 = trunc i32 %1400 to i8
  %1402 = zext i8 %1401 to i32
  %1403 = ashr i32 %1402, 7
  %1404 = sext i32 %1403 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1404, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1404, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1404, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1404, i1 %.cond)
  %1405 = zext i8 %1401 to i32
  %1406 = shl i32 %1405, 1
  %1407 = trunc i32 %1406 to i8
  %1408 = zext i8 %1407 to i32
  %1409 = ashr i32 %1408, 7
  %1410 = sext i32 %1409 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1410, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1410, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1410, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1410, i1 %.cond)
  %1411 = zext i8 %1407 to i32
  %1412 = shl i32 %1411, 1
  %1413 = trunc i32 %1412 to i8
  %1414 = zext i8 %1413 to i32
  %1415 = ashr i32 %1414, 7
  %1416 = sext i32 %1415 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1416, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1416, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1416, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1416, i1 %.cond)
  %1417 = zext i8 %1413 to i32
  %1418 = shl i32 %1417, 1
  %1419 = trunc i32 %1418 to i8
  %1420 = zext i8 %1419 to i32
  %1421 = ashr i32 %1420, 7
  %1422 = sext i32 %1421 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1422, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1422, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1422, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1422, i1 %.cond)
  %1423 = zext i8 %1419 to i32
  %1424 = shl i32 %1423, 1
  %1425 = trunc i32 %1424 to i8
  %1426 = zext i8 %1425 to i32
  %1427 = ashr i32 %1426, 7
  %1428 = sext i32 %1427 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1428, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1428, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1428, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1428, i1 %.cond)
  %1429 = zext i8 %1425 to i32
  %1430 = shl i32 %1429, 1
  %1431 = trunc i32 %1430 to i8
  %1432 = zext i8 %1431 to i32
  %1433 = ashr i32 %1432, 7
  %1434 = sext i32 %1433 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1434, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1434, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1434, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1434, i1 %.cond)
  %1435 = zext i8 %1431 to i32
  %1436 = getelementptr inbounds i8, i8* %2, i64 4
  %1437 = load i1, i1* %out.
  %1438 = icmp slt i64 4, %len.2
  %1439 = bitcast i64* %shadow to i8*
  %safe.67 = or i1 %1437, %1438
  %select.ptr.68 = select i1 %safe.67, i8* %1436, i8* %1439
  %1440 = load i8, i8* %select.ptr.68, align 1
  %1441 = zext i8 %1440 to i32
  %1442 = ashr i32 %1441, 7
  %1443 = sext i32 %1442 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1443, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1443, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1443, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1443, i1 %.cond)
  %1444 = zext i8 %1440 to i32
  %1445 = shl i32 %1444, 1
  %1446 = trunc i32 %1445 to i8
  %1447 = zext i8 %1446 to i32
  %1448 = ashr i32 %1447, 7
  %1449 = sext i32 %1448 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1449, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1449, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1449, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1449, i1 %.cond)
  %1450 = zext i8 %1446 to i32
  %1451 = shl i32 %1450, 1
  %1452 = trunc i32 %1451 to i8
  %1453 = zext i8 %1452 to i32
  %1454 = ashr i32 %1453, 7
  %1455 = sext i32 %1454 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1455, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1455, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1455, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1455, i1 %.cond)
  %1456 = zext i8 %1452 to i32
  %1457 = shl i32 %1456, 1
  %1458 = trunc i32 %1457 to i8
  %1459 = zext i8 %1458 to i32
  %1460 = ashr i32 %1459, 7
  %1461 = sext i32 %1460 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1461, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1461, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1461, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1461, i1 %.cond)
  %1462 = zext i8 %1458 to i32
  %1463 = shl i32 %1462, 1
  %1464 = trunc i32 %1463 to i8
  %1465 = zext i8 %1464 to i32
  %1466 = ashr i32 %1465, 7
  %1467 = sext i32 %1466 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1467, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1467, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1467, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1467, i1 %.cond)
  %1468 = zext i8 %1464 to i32
  %1469 = shl i32 %1468, 1
  %1470 = trunc i32 %1469 to i8
  %1471 = zext i8 %1470 to i32
  %1472 = ashr i32 %1471, 7
  %1473 = sext i32 %1472 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1473, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1473, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1473, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1473, i1 %.cond)
  %1474 = zext i8 %1470 to i32
  %1475 = shl i32 %1474, 1
  %1476 = trunc i32 %1475 to i8
  %1477 = zext i8 %1476 to i32
  %1478 = ashr i32 %1477, 7
  %1479 = sext i32 %1478 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1479, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1479, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1479, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1479, i1 %.cond)
  %1480 = zext i8 %1476 to i32
  %1481 = shl i32 %1480, 1
  %1482 = trunc i32 %1481 to i8
  %1483 = zext i8 %1482 to i32
  %1484 = ashr i32 %1483, 7
  %1485 = sext i32 %1484 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1485, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1485, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1485, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1485, i1 %.cond)
  %1486 = zext i8 %1482 to i32
  %1487 = getelementptr inbounds i8, i8* %2, i64 3
  %1488 = load i1, i1* %out.
  %1489 = icmp slt i64 3, %len.2
  %1490 = bitcast i64* %shadow to i8*
  %safe.69 = or i1 %1488, %1489
  %select.ptr.70 = select i1 %safe.69, i8* %1487, i8* %1490
  %1491 = load i8, i8* %select.ptr.70, align 1
  %1492 = zext i8 %1491 to i32
  %1493 = ashr i32 %1492, 7
  %1494 = sext i32 %1493 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1494, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1494, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1494, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1494, i1 %.cond)
  %1495 = zext i8 %1491 to i32
  %1496 = shl i32 %1495, 1
  %1497 = trunc i32 %1496 to i8
  %1498 = zext i8 %1497 to i32
  %1499 = ashr i32 %1498, 7
  %1500 = sext i32 %1499 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1500, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1500, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1500, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1500, i1 %.cond)
  %1501 = zext i8 %1497 to i32
  %1502 = shl i32 %1501, 1
  %1503 = trunc i32 %1502 to i8
  %1504 = zext i8 %1503 to i32
  %1505 = ashr i32 %1504, 7
  %1506 = sext i32 %1505 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1506, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1506, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1506, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1506, i1 %.cond)
  %1507 = zext i8 %1503 to i32
  %1508 = shl i32 %1507, 1
  %1509 = trunc i32 %1508 to i8
  %1510 = zext i8 %1509 to i32
  %1511 = ashr i32 %1510, 7
  %1512 = sext i32 %1511 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1512, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1512, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1512, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1512, i1 %.cond)
  %1513 = zext i8 %1509 to i32
  %1514 = shl i32 %1513, 1
  %1515 = trunc i32 %1514 to i8
  %1516 = zext i8 %1515 to i32
  %1517 = ashr i32 %1516, 7
  %1518 = sext i32 %1517 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1518, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1518, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1518, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1518, i1 %.cond)
  %1519 = zext i8 %1515 to i32
  %1520 = shl i32 %1519, 1
  %1521 = trunc i32 %1520 to i8
  %1522 = zext i8 %1521 to i32
  %1523 = ashr i32 %1522, 7
  %1524 = sext i32 %1523 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1524, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1524, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1524, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1524, i1 %.cond)
  %1525 = zext i8 %1521 to i32
  %1526 = shl i32 %1525, 1
  %1527 = trunc i32 %1526 to i8
  %1528 = zext i8 %1527 to i32
  %1529 = ashr i32 %1528, 7
  %1530 = sext i32 %1529 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1530, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1530, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1530, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1530, i1 %.cond)
  %1531 = zext i8 %1527 to i32
  %1532 = shl i32 %1531, 1
  %1533 = trunc i32 %1532 to i8
  %1534 = zext i8 %1533 to i32
  %1535 = ashr i32 %1534, 7
  %1536 = sext i32 %1535 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1536, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1536, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1536, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1536, i1 %.cond)
  %1537 = zext i8 %1533 to i32
  %1538 = getelementptr inbounds i8, i8* %2, i64 2
  %1539 = load i1, i1* %out.
  %1540 = icmp slt i64 2, %len.2
  %1541 = bitcast i64* %shadow to i8*
  %safe.71 = or i1 %1539, %1540
  %select.ptr.72 = select i1 %safe.71, i8* %1538, i8* %1541
  %1542 = load i8, i8* %select.ptr.72, align 1
  %1543 = zext i8 %1542 to i32
  %1544 = ashr i32 %1543, 7
  %1545 = sext i32 %1544 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1545, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1545, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1545, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1545, i1 %.cond)
  %1546 = zext i8 %1542 to i32
  %1547 = shl i32 %1546, 1
  %1548 = trunc i32 %1547 to i8
  %1549 = zext i8 %1548 to i32
  %1550 = ashr i32 %1549, 7
  %1551 = sext i32 %1550 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1551, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1551, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1551, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1551, i1 %.cond)
  %1552 = zext i8 %1548 to i32
  %1553 = shl i32 %1552, 1
  %1554 = trunc i32 %1553 to i8
  %1555 = zext i8 %1554 to i32
  %1556 = ashr i32 %1555, 7
  %1557 = sext i32 %1556 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1557, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1557, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1557, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1557, i1 %.cond)
  %1558 = zext i8 %1554 to i32
  %1559 = shl i32 %1558, 1
  %1560 = trunc i32 %1559 to i8
  %1561 = zext i8 %1560 to i32
  %1562 = ashr i32 %1561, 7
  %1563 = sext i32 %1562 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1563, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1563, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1563, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1563, i1 %.cond)
  %1564 = zext i8 %1560 to i32
  %1565 = shl i32 %1564, 1
  %1566 = trunc i32 %1565 to i8
  %1567 = zext i8 %1566 to i32
  %1568 = ashr i32 %1567, 7
  %1569 = sext i32 %1568 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1569, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1569, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1569, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1569, i1 %.cond)
  %1570 = zext i8 %1566 to i32
  %1571 = shl i32 %1570, 1
  %1572 = trunc i32 %1571 to i8
  %1573 = zext i8 %1572 to i32
  %1574 = ashr i32 %1573, 7
  %1575 = sext i32 %1574 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1575, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1575, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1575, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1575, i1 %.cond)
  %1576 = zext i8 %1572 to i32
  %1577 = shl i32 %1576, 1
  %1578 = trunc i32 %1577 to i8
  %1579 = zext i8 %1578 to i32
  %1580 = ashr i32 %1579, 7
  %1581 = sext i32 %1580 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1581, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1581, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1581, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1581, i1 %.cond)
  %1582 = zext i8 %1578 to i32
  %1583 = shl i32 %1582, 1
  %1584 = trunc i32 %1583 to i8
  %1585 = zext i8 %1584 to i32
  %1586 = ashr i32 %1585, 7
  %1587 = sext i32 %1586 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1587, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1587, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1587, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1587, i1 %.cond)
  %1588 = zext i8 %1584 to i32
  %1589 = getelementptr inbounds i8, i8* %2, i64 1
  %1590 = load i1, i1* %out.
  %1591 = icmp slt i64 1, %len.2
  %1592 = bitcast i64* %shadow to i8*
  %safe.73 = or i1 %1590, %1591
  %select.ptr.74 = select i1 %safe.73, i8* %1589, i8* %1592
  %1593 = load i8, i8* %select.ptr.74, align 1
  %1594 = zext i8 %1593 to i32
  %1595 = ashr i32 %1594, 7
  %1596 = sext i32 %1595 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1596, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1596, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1596, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1596, i1 %.cond)
  %1597 = zext i8 %1593 to i32
  %1598 = shl i32 %1597, 1
  %1599 = trunc i32 %1598 to i8
  %1600 = zext i8 %1599 to i32
  %1601 = ashr i32 %1600, 7
  %1602 = sext i32 %1601 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1602, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1602, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1602, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1602, i1 %.cond)
  %1603 = zext i8 %1599 to i32
  %1604 = shl i32 %1603, 1
  %1605 = trunc i32 %1604 to i8
  %1606 = zext i8 %1605 to i32
  %1607 = ashr i32 %1606, 7
  %1608 = sext i32 %1607 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1608, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1608, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1608, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1608, i1 %.cond)
  %1609 = zext i8 %1605 to i32
  %1610 = shl i32 %1609, 1
  %1611 = trunc i32 %1610 to i8
  %1612 = zext i8 %1611 to i32
  %1613 = ashr i32 %1612, 7
  %1614 = sext i32 %1613 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1614, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1614, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1614, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1614, i1 %.cond)
  %1615 = zext i8 %1611 to i32
  %1616 = shl i32 %1615, 1
  %1617 = trunc i32 %1616 to i8
  %1618 = zext i8 %1617 to i32
  %1619 = ashr i32 %1618, 7
  %1620 = sext i32 %1619 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1620, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1620, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1620, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1620, i1 %.cond)
  %1621 = zext i8 %1617 to i32
  %1622 = shl i32 %1621, 1
  %1623 = trunc i32 %1622 to i8
  %1624 = zext i8 %1623 to i32
  %1625 = ashr i32 %1624, 7
  %1626 = sext i32 %1625 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1626, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1626, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1626, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1626, i1 %.cond)
  %1627 = zext i8 %1623 to i32
  %1628 = shl i32 %1627, 1
  %1629 = trunc i32 %1628 to i8
  %1630 = zext i8 %1629 to i32
  %1631 = ashr i32 %1630, 7
  %1632 = sext i32 %1631 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1632, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1632, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1632, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1632, i1 %.cond)
  %1633 = zext i8 %1629 to i32
  %1634 = shl i32 %1633, 1
  %1635 = trunc i32 %1634 to i8
  %1636 = zext i8 %1635 to i32
  %1637 = ashr i32 %1636, 7
  %1638 = sext i32 %1637 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1638, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1638, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1638, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1638, i1 %.cond)
  %1639 = zext i8 %1635 to i32
  %1640 = load i1, i1* %out.
  %1641 = load i8, i8* %2, align 1
  %1642 = zext i8 %1641 to i32
  %1643 = ashr i32 %1642, 7
  %1644 = sext i32 %1643 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1644, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1644, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1644, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1644, i1 %.cond)
  %1645 = zext i8 %1641 to i32
  %1646 = shl i32 %1645, 1
  %1647 = trunc i32 %1646 to i8
  %1648 = zext i8 %1647 to i32
  %1649 = ashr i32 %1648, 7
  %1650 = sext i32 %1649 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1650, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1650, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1650, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1650, i1 %.cond)
  %1651 = zext i8 %1647 to i32
  %1652 = shl i32 %1651, 1
  %1653 = trunc i32 %1652 to i8
  %1654 = zext i8 %1653 to i32
  %1655 = ashr i32 %1654, 7
  %1656 = sext i32 %1655 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1656, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1656, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1656, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1656, i1 %.cond)
  %1657 = zext i8 %1653 to i32
  %1658 = shl i32 %1657, 1
  %1659 = trunc i32 %1658 to i8
  %1660 = zext i8 %1659 to i32
  %1661 = ashr i32 %1660, 7
  %1662 = sext i32 %1661 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1662, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1662, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1662, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1662, i1 %.cond)
  %1663 = zext i8 %1659 to i32
  %1664 = shl i32 %1663, 1
  %1665 = trunc i32 %1664 to i8
  %1666 = zext i8 %1665 to i32
  %1667 = ashr i32 %1666, 7
  %1668 = sext i32 %1667 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1668, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1668, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1668, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1668, i1 %.cond)
  %1669 = zext i8 %1665 to i32
  %1670 = shl i32 %1669, 1
  %1671 = trunc i32 %1670 to i8
  %1672 = zext i8 %1671 to i32
  %1673 = ashr i32 %1672, 7
  %1674 = sext i32 %1673 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1674, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1674, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1674, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1674, i1 %.cond)
  %1675 = zext i8 %1671 to i32
  %1676 = shl i32 %1675, 1
  %1677 = trunc i32 %1676 to i8
  %1678 = zext i8 %1677 to i32
  %1679 = ashr i32 %1678, 7
  %1680 = sext i32 %1679 to i64
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1680, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1680, i1 %.cond)
  call void @fmonty(i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1680, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1680, i1 %.cond)
  %1681 = zext i8 %1677 to i32
  %1682 = shl i32 %1681, 1
  %1683 = trunc i32 %1682 to i8
  %1684 = zext i8 %1683 to i32
  %1685 = ashr i32 %1684, 7
  %1686 = sext i32 %1685 to i64
  call void @swap_conditional(i64* %55, i64 19, i64* %53, i64 19, i64 %1686, i1 %.cond)
  call void @swap_conditional(i64* %56, i64 19, i64* %54, i64 19, i64 %1686, i1 %.cond)
  call void @fmonty(i64* %33, i64 19, i64* %34, i64 19, i64* %31, i64 19, i64* %32, i64 19, i64* %55, i64 19, i64* %56, i64 19, i64* %53, i64 19, i64* %54, i64 19, i64* %3, i64 %len.3, i1 %.cond)
  call void @swap_conditional(i64* %33, i64 19, i64* %31, i64 19, i64 %1686, i1 %.cond)
  call void @swap_conditional(i64* %34, i64 19, i64* %32, i64 19, i64 %1686, i1 %.cond)
  %1687 = zext i8 %1683 to i32
  %1688 = bitcast i64* %0 to i8*
  %1689 = bitcast i64* %33 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1688, i8* align 8 %1689, i64 80, i1 false)
  %1690 = bitcast i64* %1 to i8*
  %1691 = bitcast i64* %34 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1690, i8* align 8 %1691, i64 80, i1 false)
  ret void
}

define internal void @crecip(i64* %0, i64 %len., i64* %1, i64 %len.1, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
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
  call void @fsquare(i64* %13, i64 10, i64* %1, i64 %len.1, i1 %.cond)
  %14 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %15 = getelementptr inbounds [10 x i64], [10 x i64]* %3, i64 0, i64 0
  call void @fsquare(i64* %14, i64 10, i64* %15, i64 10, i1 %.cond)
  %16 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %17 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %16, i64 10, i64* %17, i64 10, i1 %.cond)
  %18 = getelementptr inbounds [10 x i64], [10 x i64]* %4, i64 0, i64 0
  %19 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fmul(i64* %18, i64 10, i64* %19, i64 10, i64* %1, i64 %len.1, i1 %.cond)
  %20 = getelementptr inbounds [10 x i64], [10 x i64]* %5, i64 0, i64 0
  %21 = getelementptr inbounds [10 x i64], [10 x i64]* %4, i64 0, i64 0
  %22 = getelementptr inbounds [10 x i64], [10 x i64]* %3, i64 0, i64 0
  call void @fmul(i64* %20, i64 10, i64* %21, i64 10, i64* %22, i64 10, i1 %.cond)
  %23 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %24 = getelementptr inbounds [10 x i64], [10 x i64]* %5, i64 0, i64 0
  call void @fsquare(i64* %23, i64 10, i64* %24, i64 10, i1 %.cond)
  %25 = getelementptr inbounds [10 x i64], [10 x i64]* %6, i64 0, i64 0
  %26 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %27 = getelementptr inbounds [10 x i64], [10 x i64]* %4, i64 0, i64 0
  call void @fmul(i64* %25, i64 10, i64* %26, i64 10, i64* %27, i64 10, i1 %.cond)
  %28 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %29 = getelementptr inbounds [10 x i64], [10 x i64]* %6, i64 0, i64 0
  call void @fsquare(i64* %28, i64 10, i64* %29, i64 10, i1 %.cond)
  %30 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %31 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %30, i64 10, i64* %31, i64 10, i1 %.cond)
  %32 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %33 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %32, i64 10, i64* %33, i64 10, i1 %.cond)
  %34 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %35 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %34, i64 10, i64* %35, i64 10, i1 %.cond)
  %36 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %37 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %36, i64 10, i64* %37, i64 10, i1 %.cond)
  %38 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  %39 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %40 = getelementptr inbounds [10 x i64], [10 x i64]* %6, i64 0, i64 0
  call void @fmul(i64* %38, i64 10, i64* %39, i64 10, i64* %40, i64 10, i1 %.cond)
  %41 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %42 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  call void @fsquare(i64* %41, i64 10, i64* %42, i64 10, i1 %.cond)
  %43 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %44 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %43, i64 10, i64* %44, i64 10, i1 %.cond)
  %45 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %46 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %45, i64 10, i64* %46, i64 10, i1 %.cond)
  %47 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %48 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %47, i64 10, i64* %48, i64 10, i1 %.cond)
  %49 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %50 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %49, i64 10, i64* %50, i64 10, i1 %.cond)
  %51 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %52 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %51, i64 10, i64* %52, i64 10, i1 %.cond)
  %53 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %54 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %53, i64 10, i64* %54, i64 10, i1 %.cond)
  %55 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %56 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %55, i64 10, i64* %56, i64 10, i1 %.cond)
  %57 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %58 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %57, i64 10, i64* %58, i64 10, i1 %.cond)
  %59 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %60 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %59, i64 10, i64* %60, i64 10, i1 %.cond)
  %61 = getelementptr inbounds [10 x i64], [10 x i64]* %8, i64 0, i64 0
  %62 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %63 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  call void @fmul(i64* %61, i64 10, i64* %62, i64 10, i64* %63, i64 10, i1 %.cond)
  %64 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %65 = getelementptr inbounds [10 x i64], [10 x i64]* %8, i64 0, i64 0
  call void @fsquare(i64* %64, i64 10, i64* %65, i64 10, i1 %.cond)
  %66 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %67 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %66, i64 10, i64* %67, i64 10, i1 %.cond)
  %68 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %69 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %68, i64 10, i64* %69, i64 10, i1 %.cond)
  %70 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %71 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %70, i64 10, i64* %71, i64 10, i1 %.cond)
  call void @fsquare(i64* %68, i64 10, i64* %69, i64 10, i1 %.cond)
  %72 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %73 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %72, i64 10, i64* %73, i64 10, i1 %.cond)
  call void @fsquare(i64* %68, i64 10, i64* %69, i64 10, i1 %.cond)
  %74 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %75 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %74, i64 10, i64* %75, i64 10, i1 %.cond)
  call void @fsquare(i64* %68, i64 10, i64* %69, i64 10, i1 %.cond)
  %76 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %77 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %76, i64 10, i64* %77, i64 10, i1 %.cond)
  call void @fsquare(i64* %68, i64 10, i64* %69, i64 10, i1 %.cond)
  %78 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %79 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %78, i64 10, i64* %79, i64 10, i1 %.cond)
  call void @fsquare(i64* %68, i64 10, i64* %69, i64 10, i1 %.cond)
  %80 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %81 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %80, i64 10, i64* %81, i64 10, i1 %.cond)
  call void @fsquare(i64* %68, i64 10, i64* %69, i64 10, i1 %.cond)
  %82 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %83 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %82, i64 10, i64* %83, i64 10, i1 %.cond)
  call void @fsquare(i64* %68, i64 10, i64* %69, i64 10, i1 %.cond)
  %84 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %85 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %84, i64 10, i64* %85, i64 10, i1 %.cond)
  call void @fsquare(i64* %68, i64 10, i64* %69, i64 10, i1 %.cond)
  %86 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %87 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %86, i64 10, i64* %87, i64 10, i1 %.cond)
  %88 = getelementptr inbounds [10 x i64], [10 x i64]* %8, i64 0, i64 0
  call void @fmul(i64* %68, i64 10, i64* %69, i64 10, i64* %88, i64 10, i1 %.cond)
  %89 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %90 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %89, i64 10, i64* %90, i64 10, i1 %.cond)
  %91 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %92 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %91, i64 10, i64* %92, i64 10, i1 %.cond)
  %93 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %94 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %93, i64 10, i64* %94, i64 10, i1 %.cond)
  %95 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %96 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %95, i64 10, i64* %96, i64 10, i1 %.cond)
  %97 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %98 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %97, i64 10, i64* %98, i64 10, i1 %.cond)
  %99 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %100 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %99, i64 10, i64* %100, i64 10, i1 %.cond)
  %101 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %102 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %101, i64 10, i64* %102, i64 10, i1 %.cond)
  %103 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %104 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %103, i64 10, i64* %104, i64 10, i1 %.cond)
  %105 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %106 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %105, i64 10, i64* %106, i64 10, i1 %.cond)
  %107 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %108 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %107, i64 10, i64* %108, i64 10, i1 %.cond)
  %109 = getelementptr inbounds [10 x i64], [10 x i64]* %9, i64 0, i64 0
  %110 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %111 = getelementptr inbounds [10 x i64], [10 x i64]* %7, i64 0, i64 0
  call void @fmul(i64* %109, i64 10, i64* %110, i64 10, i64* %111, i64 10, i1 %.cond)
  %112 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %113 = getelementptr inbounds [10 x i64], [10 x i64]* %9, i64 0, i64 0
  call void @fsquare(i64* %112, i64 10, i64* %113, i64 10, i1 %.cond)
  %114 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %115 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %114, i64 10, i64* %115, i64 10, i1 %.cond)
  %116 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %117 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %116, i64 10, i64* %117, i64 10, i1 %.cond)
  %118 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %119 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %118, i64 10, i64* %119, i64 10, i1 %.cond)
  %120 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %121 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %120, i64 10, i64* %121, i64 10, i1 %.cond)
  %122 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %123 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %122, i64 10, i64* %123, i64 10, i1 %.cond)
  %124 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %125 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %124, i64 10, i64* %125, i64 10, i1 %.cond)
  %126 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %127 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %126, i64 10, i64* %127, i64 10, i1 %.cond)
  %128 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %129 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %128, i64 10, i64* %129, i64 10, i1 %.cond)
  %130 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %131 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %130, i64 10, i64* %131, i64 10, i1 %.cond)
  %132 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %133 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %132, i64 10, i64* %133, i64 10, i1 %.cond)
  %134 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %135 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %134, i64 10, i64* %135, i64 10, i1 %.cond)
  %136 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %137 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %136, i64 10, i64* %137, i64 10, i1 %.cond)
  %138 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %139 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %138, i64 10, i64* %139, i64 10, i1 %.cond)
  %140 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %141 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %140, i64 10, i64* %141, i64 10, i1 %.cond)
  %142 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %143 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %142, i64 10, i64* %143, i64 10, i1 %.cond)
  %144 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %145 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %144, i64 10, i64* %145, i64 10, i1 %.cond)
  %146 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %147 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %146, i64 10, i64* %147, i64 10, i1 %.cond)
  %148 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %149 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %148, i64 10, i64* %149, i64 10, i1 %.cond)
  %150 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %151 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %150, i64 10, i64* %151, i64 10, i1 %.cond)
  %152 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %153 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %152, i64 10, i64* %153, i64 10, i1 %.cond)
  %154 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %155 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %154, i64 10, i64* %155, i64 10, i1 %.cond)
  %156 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %157 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %156, i64 10, i64* %157, i64 10, i1 %.cond)
  %158 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %159 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %158, i64 10, i64* %159, i64 10, i1 %.cond)
  %160 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %161 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %160, i64 10, i64* %161, i64 10, i1 %.cond)
  %162 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %163 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %162, i64 10, i64* %163, i64 10, i1 %.cond)
  %164 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %165 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %164, i64 10, i64* %165, i64 10, i1 %.cond)
  %166 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %167 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %166, i64 10, i64* %167, i64 10, i1 %.cond)
  %168 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %169 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %168, i64 10, i64* %169, i64 10, i1 %.cond)
  %170 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %171 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %170, i64 10, i64* %171, i64 10, i1 %.cond)
  %172 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %173 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %172, i64 10, i64* %173, i64 10, i1 %.cond)
  %174 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %175 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %174, i64 10, i64* %175, i64 10, i1 %.cond)
  %176 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %177 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %176, i64 10, i64* %177, i64 10, i1 %.cond)
  %178 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %179 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %178, i64 10, i64* %179, i64 10, i1 %.cond)
  %180 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %181 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %180, i64 10, i64* %181, i64 10, i1 %.cond)
  %182 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %183 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %182, i64 10, i64* %183, i64 10, i1 %.cond)
  %184 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %185 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %184, i64 10, i64* %185, i64 10, i1 %.cond)
  %186 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %187 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %186, i64 10, i64* %187, i64 10, i1 %.cond)
  %188 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %189 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %188, i64 10, i64* %189, i64 10, i1 %.cond)
  %190 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %191 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %190, i64 10, i64* %191, i64 10, i1 %.cond)
  %192 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %193 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %192, i64 10, i64* %193, i64 10, i1 %.cond)
  %194 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %195 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %194, i64 10, i64* %195, i64 10, i1 %.cond)
  %196 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %197 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %196, i64 10, i64* %197, i64 10, i1 %.cond)
  %198 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %199 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %198, i64 10, i64* %199, i64 10, i1 %.cond)
  %200 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %201 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %200, i64 10, i64* %201, i64 10, i1 %.cond)
  %202 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %203 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %202, i64 10, i64* %203, i64 10, i1 %.cond)
  %204 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %205 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %204, i64 10, i64* %205, i64 10, i1 %.cond)
  %206 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %207 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %206, i64 10, i64* %207, i64 10, i1 %.cond)
  %208 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %209 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %208, i64 10, i64* %209, i64 10, i1 %.cond)
  %210 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %211 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %210, i64 10, i64* %211, i64 10, i1 %.cond)
  %212 = getelementptr inbounds [10 x i64], [10 x i64]* %10, i64 0, i64 0
  %213 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %214 = getelementptr inbounds [10 x i64], [10 x i64]* %9, i64 0, i64 0
  call void @fmul(i64* %212, i64 10, i64* %213, i64 10, i64* %214, i64 10, i1 %.cond)
  %215 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %216 = getelementptr inbounds [10 x i64], [10 x i64]* %10, i64 0, i64 0
  call void @fsquare(i64* %215, i64 10, i64* %216, i64 10, i1 %.cond)
  %217 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %218 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %217, i64 10, i64* %218, i64 10, i1 %.cond)
  %219 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %220 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %221 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %222 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %221, i64 10, i64* %222, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %223 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %224 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %223, i64 10, i64* %224, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %225 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %226 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %225, i64 10, i64* %226, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %227 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %228 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %227, i64 10, i64* %228, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %229 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %230 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %229, i64 10, i64* %230, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %231 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %232 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %231, i64 10, i64* %232, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %233 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %234 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %233, i64 10, i64* %234, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %235 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %236 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %235, i64 10, i64* %236, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %237 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %238 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %237, i64 10, i64* %238, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %239 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %240 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %239, i64 10, i64* %240, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %241 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %242 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %241, i64 10, i64* %242, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %243 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %244 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %243, i64 10, i64* %244, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %245 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %246 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %245, i64 10, i64* %246, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %247 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %248 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %247, i64 10, i64* %248, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %249 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %250 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %249, i64 10, i64* %250, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %251 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %252 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %251, i64 10, i64* %252, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %253 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %254 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %253, i64 10, i64* %254, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %255 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %256 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %255, i64 10, i64* %256, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %257 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %258 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %257, i64 10, i64* %258, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %259 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %260 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %259, i64 10, i64* %260, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %261 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %262 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %261, i64 10, i64* %262, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %263 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %264 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %263, i64 10, i64* %264, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %265 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %266 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %265, i64 10, i64* %266, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %267 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %268 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %267, i64 10, i64* %268, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %269 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %270 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %269, i64 10, i64* %270, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %271 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %272 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %271, i64 10, i64* %272, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %273 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %274 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %273, i64 10, i64* %274, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %275 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %276 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %275, i64 10, i64* %276, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %277 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %278 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %277, i64 10, i64* %278, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %279 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %280 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %279, i64 10, i64* %280, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %281 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %282 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %281, i64 10, i64* %282, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %283 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %284 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %283, i64 10, i64* %284, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %285 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %286 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %285, i64 10, i64* %286, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %287 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %288 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %287, i64 10, i64* %288, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %289 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %290 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %289, i64 10, i64* %290, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %291 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %292 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %291, i64 10, i64* %292, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %293 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %294 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %293, i64 10, i64* %294, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %295 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %296 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %295, i64 10, i64* %296, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %297 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %298 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %297, i64 10, i64* %298, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %299 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %300 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %299, i64 10, i64* %300, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %301 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %302 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %301, i64 10, i64* %302, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %303 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %304 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %303, i64 10, i64* %304, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %305 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %306 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %305, i64 10, i64* %306, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %307 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %308 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %307, i64 10, i64* %308, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %309 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %310 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %309, i64 10, i64* %310, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %311 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %312 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %311, i64 10, i64* %312, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %313 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %314 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %313, i64 10, i64* %314, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %315 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %316 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %315, i64 10, i64* %316, i64 10, i1 %.cond)
  call void @fsquare(i64* %219, i64 10, i64* %220, i64 10, i1 %.cond)
  %317 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %318 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %317, i64 10, i64* %318, i64 10, i1 %.cond)
  %319 = getelementptr inbounds [10 x i64], [10 x i64]* %10, i64 0, i64 0
  call void @fmul(i64* %219, i64 10, i64* %220, i64 10, i64* %319, i64 10, i1 %.cond)
  %320 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %321 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %320, i64 10, i64* %321, i64 10, i1 %.cond)
  %322 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %323 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %322, i64 10, i64* %323, i64 10, i1 %.cond)
  %324 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %325 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %326 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %327 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %326, i64 10, i64* %327, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %328 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %329 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %328, i64 10, i64* %329, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %330 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %331 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %330, i64 10, i64* %331, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %332 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %333 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %332, i64 10, i64* %333, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %334 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %335 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %334, i64 10, i64* %335, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %336 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %337 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %336, i64 10, i64* %337, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %338 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %339 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %338, i64 10, i64* %339, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %340 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %341 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %340, i64 10, i64* %341, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %342 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %343 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %342, i64 10, i64* %343, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %344 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %345 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %344, i64 10, i64* %345, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %346 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %347 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %346, i64 10, i64* %347, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %348 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %349 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %348, i64 10, i64* %349, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %350 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %351 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %350, i64 10, i64* %351, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %352 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %353 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %352, i64 10, i64* %353, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %354 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %355 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %354, i64 10, i64* %355, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %356 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %357 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %356, i64 10, i64* %357, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %358 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %359 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %358, i64 10, i64* %359, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %360 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %361 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %360, i64 10, i64* %361, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %362 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %363 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %362, i64 10, i64* %363, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %364 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %365 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %364, i64 10, i64* %365, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %366 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %367 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %366, i64 10, i64* %367, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %368 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %369 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %368, i64 10, i64* %369, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %370 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %371 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %370, i64 10, i64* %371, i64 10, i1 %.cond)
  call void @fsquare(i64* %324, i64 10, i64* %325, i64 10, i1 %.cond)
  %372 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %373 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %372, i64 10, i64* %373, i64 10, i1 %.cond)
  %374 = getelementptr inbounds [10 x i64], [10 x i64]* %9, i64 0, i64 0
  call void @fmul(i64* %324, i64 10, i64* %325, i64 10, i64* %374, i64 10, i1 %.cond)
  %375 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %376 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %375, i64 10, i64* %376, i64 10, i1 %.cond)
  %377 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %378 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %377, i64 10, i64* %378, i64 10, i1 %.cond)
  %379 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %380 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %379, i64 10, i64* %380, i64 10, i1 %.cond)
  %381 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %382 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  call void @fsquare(i64* %381, i64 10, i64* %382, i64 10, i1 %.cond)
  %383 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %384 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fsquare(i64* %383, i64 10, i64* %384, i64 10, i1 %.cond)
  %385 = getelementptr inbounds [10 x i64], [10 x i64]* %12, i64 0, i64 0
  %386 = getelementptr inbounds [10 x i64], [10 x i64]* %5, i64 0, i64 0
  call void @fmul(i64* %0, i64 %len., i64* %385, i64 10, i64* %386, i64 10, i1 %.cond)
  ret void
}

define internal void @fmul(i64* %0, i64 %len., i64* %1, i64 %len.1, i64* %2, i64 %len.2, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %4 = alloca [19 x i64], align 16
  %5 = getelementptr inbounds [19 x i64], [19 x i64]* %4, i64 0, i64 0
  call void @fproduct(i64* %5, i64 19, i64* %1, i64 %len.1, i64* %2, i64 %len.2, i1 %.cond)
  %6 = getelementptr inbounds [19 x i64], [19 x i64]* %4, i64 0, i64 0
  call void @freduce_degree(i64* %6, i64 19, i1 %.cond)
  %7 = getelementptr inbounds [19 x i64], [19 x i64]* %4, i64 0, i64 0
  call void @freduce_coefficients(i64* %7, i64 19, i1 %.cond)
  %8 = bitcast i64* %0 to i8*
  %9 = getelementptr inbounds [19 x i64], [19 x i64]* %4, i64 0, i64 0
  %10 = bitcast i64* %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 16 %10, i64 80, i1 false)
  ret void
}

define internal void @fcontract(i8* %0, i64 %len., i64* %1, i64 %len.1, i1 %.cond) {
.preheader6:
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %2 = alloca [10 x i32], align 16
  %3 = load i1, i1* %out.
  %4 = load i64, i64* %1, align 8
  %5 = trunc i64 %4 to i32
  %6 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %7 = load i1, i1* %out.
  %8 = sext i32 10 to i64
  %9 = icmp slt i64 0, %8
  %10 = bitcast i64* %shadow to i32*
  %safe. = or i1 %7, %9
  %select.ptr. = select i1 %safe., i32* %6, i32* %10
  %11 = load i32, i32* %6
  %select.val. = select i1 %7, i32 %5, i32 %11
  store i32 %select.val., i32* %select.ptr., align 4
  %12 = getelementptr inbounds i64, i64* %1, i64 1
  %13 = load i1, i1* %out.
  %14 = icmp slt i64 1, %len.1
  %15 = bitcast i64* %shadow to i64*
  %safe.2 = or i1 %13, %14
  %select.ptr.3 = select i1 %safe.2, i64* %12, i64* %15
  %16 = load i64, i64* %select.ptr.3, align 8
  %17 = trunc i64 %16 to i32
  %18 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %19 = load i1, i1* %out.
  %20 = sext i32 10 to i64
  %21 = icmp slt i64 1, %20
  %22 = bitcast i64* %shadow to i32*
  %safe.4 = or i1 %19, %21
  %select.ptr.5 = select i1 %safe.4, i32* %18, i32* %22
  %23 = load i32, i32* %18
  %select.val.6 = select i1 %19, i32 %17, i32 %23
  store i32 %select.val.6, i32* %select.ptr.5, align 4
  %24 = getelementptr inbounds i64, i64* %1, i64 2
  %25 = load i1, i1* %out.
  %26 = icmp slt i64 2, %len.1
  %27 = bitcast i64* %shadow to i64*
  %safe.7 = or i1 %25, %26
  %select.ptr.8 = select i1 %safe.7, i64* %24, i64* %27
  %28 = load i64, i64* %select.ptr.8, align 8
  %29 = trunc i64 %28 to i32
  %30 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %31 = load i1, i1* %out.
  %32 = sext i32 10 to i64
  %33 = icmp slt i64 2, %32
  %34 = bitcast i64* %shadow to i32*
  %safe.9 = or i1 %31, %33
  %select.ptr.10 = select i1 %safe.9, i32* %30, i32* %34
  %35 = load i32, i32* %30
  %select.val.11 = select i1 %31, i32 %29, i32 %35
  store i32 %select.val.11, i32* %select.ptr.10, align 4
  %36 = getelementptr inbounds i64, i64* %1, i64 3
  %37 = load i1, i1* %out.
  %38 = icmp slt i64 3, %len.1
  %39 = bitcast i64* %shadow to i64*
  %safe.12 = or i1 %37, %38
  %select.ptr.13 = select i1 %safe.12, i64* %36, i64* %39
  %40 = load i64, i64* %select.ptr.13, align 8
  %41 = trunc i64 %40 to i32
  %42 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %43 = load i1, i1* %out.
  %44 = sext i32 10 to i64
  %45 = icmp slt i64 3, %44
  %46 = bitcast i64* %shadow to i32*
  %safe.14 = or i1 %43, %45
  %select.ptr.15 = select i1 %safe.14, i32* %42, i32* %46
  %47 = load i32, i32* %42
  %select.val.16 = select i1 %43, i32 %41, i32 %47
  store i32 %select.val.16, i32* %select.ptr.15, align 4
  %48 = getelementptr inbounds i64, i64* %1, i64 4
  %49 = load i1, i1* %out.
  %50 = icmp slt i64 4, %len.1
  %51 = bitcast i64* %shadow to i64*
  %safe.17 = or i1 %49, %50
  %select.ptr.18 = select i1 %safe.17, i64* %48, i64* %51
  %52 = load i64, i64* %select.ptr.18, align 8
  %53 = trunc i64 %52 to i32
  %54 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %55 = load i1, i1* %out.
  %56 = sext i32 10 to i64
  %57 = icmp slt i64 4, %56
  %58 = bitcast i64* %shadow to i32*
  %safe.19 = or i1 %55, %57
  %select.ptr.20 = select i1 %safe.19, i32* %54, i32* %58
  %59 = load i32, i32* %54
  %select.val.21 = select i1 %55, i32 %53, i32 %59
  store i32 %select.val.21, i32* %select.ptr.20, align 4
  %60 = getelementptr inbounds i64, i64* %1, i64 5
  %61 = load i1, i1* %out.
  %62 = icmp slt i64 5, %len.1
  %63 = bitcast i64* %shadow to i64*
  %safe.22 = or i1 %61, %62
  %select.ptr.23 = select i1 %safe.22, i64* %60, i64* %63
  %64 = load i64, i64* %select.ptr.23, align 8
  %65 = trunc i64 %64 to i32
  %66 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %67 = load i1, i1* %out.
  %68 = sext i32 10 to i64
  %69 = icmp slt i64 5, %68
  %70 = bitcast i64* %shadow to i32*
  %safe.24 = or i1 %67, %69
  %select.ptr.25 = select i1 %safe.24, i32* %66, i32* %70
  %71 = load i32, i32* %66
  %select.val.26 = select i1 %67, i32 %65, i32 %71
  store i32 %select.val.26, i32* %select.ptr.25, align 4
  %72 = getelementptr inbounds i64, i64* %1, i64 6
  %73 = load i1, i1* %out.
  %74 = icmp slt i64 6, %len.1
  %75 = bitcast i64* %shadow to i64*
  %safe.27 = or i1 %73, %74
  %select.ptr.28 = select i1 %safe.27, i64* %72, i64* %75
  %76 = load i64, i64* %select.ptr.28, align 8
  %77 = trunc i64 %76 to i32
  %78 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %79 = load i1, i1* %out.
  %80 = sext i32 10 to i64
  %81 = icmp slt i64 6, %80
  %82 = bitcast i64* %shadow to i32*
  %safe.29 = or i1 %79, %81
  %select.ptr.30 = select i1 %safe.29, i32* %78, i32* %82
  %83 = load i32, i32* %78
  %select.val.31 = select i1 %79, i32 %77, i32 %83
  store i32 %select.val.31, i32* %select.ptr.30, align 4
  %84 = getelementptr inbounds i64, i64* %1, i64 7
  %85 = load i1, i1* %out.
  %86 = icmp slt i64 7, %len.1
  %87 = bitcast i64* %shadow to i64*
  %safe.32 = or i1 %85, %86
  %select.ptr.33 = select i1 %safe.32, i64* %84, i64* %87
  %88 = load i64, i64* %select.ptr.33, align 8
  %89 = trunc i64 %88 to i32
  %90 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %91 = load i1, i1* %out.
  %92 = sext i32 10 to i64
  %93 = icmp slt i64 7, %92
  %94 = bitcast i64* %shadow to i32*
  %safe.34 = or i1 %91, %93
  %select.ptr.35 = select i1 %safe.34, i32* %90, i32* %94
  %95 = load i32, i32* %90
  %select.val.36 = select i1 %91, i32 %89, i32 %95
  store i32 %select.val.36, i32* %select.ptr.35, align 4
  %96 = getelementptr inbounds i64, i64* %1, i64 8
  %97 = load i1, i1* %out.
  %98 = icmp slt i64 8, %len.1
  %99 = bitcast i64* %shadow to i64*
  %safe.37 = or i1 %97, %98
  %select.ptr.38 = select i1 %safe.37, i64* %96, i64* %99
  %100 = load i64, i64* %select.ptr.38, align 8
  %101 = trunc i64 %100 to i32
  %102 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %103 = load i1, i1* %out.
  %104 = sext i32 10 to i64
  %105 = icmp slt i64 8, %104
  %106 = bitcast i64* %shadow to i32*
  %safe.39 = or i1 %103, %105
  %select.ptr.40 = select i1 %safe.39, i32* %102, i32* %106
  %107 = load i32, i32* %102
  %select.val.41 = select i1 %103, i32 %101, i32 %107
  store i32 %select.val.41, i32* %select.ptr.40, align 4
  %108 = getelementptr inbounds i64, i64* %1, i64 9
  %109 = load i1, i1* %out.
  %110 = icmp slt i64 9, %len.1
  %111 = bitcast i64* %shadow to i64*
  %safe.42 = or i1 %109, %110
  %select.ptr.43 = select i1 %safe.42, i64* %108, i64* %111
  %112 = load i64, i64* %select.ptr.43, align 8
  %113 = trunc i64 %112 to i32
  %114 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %115 = load i1, i1* %out.
  %116 = sext i32 10 to i64
  %117 = icmp slt i64 9, %116
  %118 = bitcast i64* %shadow to i32*
  %safe.44 = or i1 %115, %117
  %select.ptr.45 = select i1 %safe.44, i32* %114, i32* %118
  %119 = load i32, i32* %114
  %select.val.46 = select i1 %115, i32 %113, i32 %119
  store i32 %select.val.46, i32* %select.ptr.45, align 4
  %120 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %121 = load i1, i1* %out.
  %122 = sext i32 10 to i64
  %123 = icmp slt i64 0, %122
  %124 = bitcast i64* %shadow to i32*
  %safe.47 = or i1 %121, %123
  %select.ptr.48 = select i1 %safe.47, i32* %120, i32* %124
  %125 = load i32, i32* %select.ptr.48, align 4
  %126 = ashr i32 %125, 31
  %127 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %128 = load i1, i1* %out.
  %129 = sext i32 10 to i64
  %130 = icmp slt i64 0, %129
  %131 = bitcast i64* %shadow to i32*
  %safe.49 = or i1 %128, %130
  %select.ptr.50 = select i1 %safe.49, i32* %127, i32* %131
  %132 = load i32, i32* %select.ptr.50, align 4
  %133 = and i32 %132, %126
  %134 = ashr i32 %133, 26
  %135 = sub nsw i32 0, %134
  %136 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %137 = load i1, i1* %out.
  %138 = sext i32 10 to i64
  %139 = icmp slt i64 0, %138
  %140 = bitcast i64* %shadow to i32*
  %safe.51 = or i1 %137, %139
  %select.ptr.52 = select i1 %safe.51, i32* %136, i32* %140
  %141 = load i32, i32* %select.ptr.52, align 4
  %142 = shl i32 %135, 26
  %143 = add nsw i32 %141, %142
  %144 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %145 = load i1, i1* %out.
  %146 = sext i32 10 to i64
  %147 = icmp slt i64 0, %146
  %148 = bitcast i64* %shadow to i32*
  %safe.53 = or i1 %145, %147
  %select.ptr.54 = select i1 %safe.53, i32* %144, i32* %148
  %149 = load i32, i32* %144
  %select.val.55 = select i1 %145, i32 %143, i32 %149
  store i32 %select.val.55, i32* %select.ptr.54, align 4
  %150 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %151 = load i1, i1* %out.
  %152 = sext i32 10 to i64
  %153 = icmp slt i64 1, %152
  %154 = bitcast i64* %shadow to i32*
  %safe.56 = or i1 %151, %153
  %select.ptr.57 = select i1 %safe.56, i32* %150, i32* %154
  %155 = load i32, i32* %select.ptr.57, align 4
  %156 = sub nsw i32 %155, %135
  %157 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %158 = load i1, i1* %out.
  %159 = sext i32 10 to i64
  %160 = icmp slt i64 1, %159
  %161 = bitcast i64* %shadow to i32*
  %safe.58 = or i1 %158, %160
  %select.ptr.59 = select i1 %safe.58, i32* %157, i32* %161
  %162 = load i32, i32* %157
  %select.val.60 = select i1 %158, i32 %156, i32 %162
  store i32 %select.val.60, i32* %select.ptr.59, align 4
  %163 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %164 = load i1, i1* %out.
  %165 = sext i32 10 to i64
  %166 = icmp slt i64 1, %165
  %167 = bitcast i64* %shadow to i32*
  %safe.61 = or i1 %164, %166
  %select.ptr.62 = select i1 %safe.61, i32* %163, i32* %167
  %168 = load i32, i32* %select.ptr.62, align 4
  %169 = ashr i32 %168, 31
  %170 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %171 = load i1, i1* %out.
  %172 = sext i32 10 to i64
  %173 = icmp slt i64 1, %172
  %174 = bitcast i64* %shadow to i32*
  %safe.63 = or i1 %171, %173
  %select.ptr.64 = select i1 %safe.63, i32* %170, i32* %174
  %175 = load i32, i32* %select.ptr.64, align 4
  %176 = and i32 %175, %169
  %177 = ashr i32 %176, 25
  %178 = sub nsw i32 0, %177
  %179 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %180 = load i1, i1* %out.
  %181 = sext i32 10 to i64
  %182 = icmp slt i64 1, %181
  %183 = bitcast i64* %shadow to i32*
  %safe.65 = or i1 %180, %182
  %select.ptr.66 = select i1 %safe.65, i32* %179, i32* %183
  %184 = load i32, i32* %select.ptr.66, align 4
  %185 = shl i32 %178, 25
  %186 = add nsw i32 %184, %185
  %187 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %188 = load i1, i1* %out.
  %189 = sext i32 10 to i64
  %190 = icmp slt i64 1, %189
  %191 = bitcast i64* %shadow to i32*
  %safe.67 = or i1 %188, %190
  %select.ptr.68 = select i1 %safe.67, i32* %187, i32* %191
  %192 = load i32, i32* %187
  %select.val.69 = select i1 %188, i32 %186, i32 %192
  store i32 %select.val.69, i32* %select.ptr.68, align 4
  %193 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %194 = load i1, i1* %out.
  %195 = sext i32 10 to i64
  %196 = icmp slt i64 2, %195
  %197 = bitcast i64* %shadow to i32*
  %safe.70 = or i1 %194, %196
  %select.ptr.71 = select i1 %safe.70, i32* %193, i32* %197
  %198 = load i32, i32* %select.ptr.71, align 4
  %199 = sub nsw i32 %198, %178
  %200 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %201 = load i1, i1* %out.
  %202 = sext i32 10 to i64
  %203 = icmp slt i64 2, %202
  %204 = bitcast i64* %shadow to i32*
  %safe.72 = or i1 %201, %203
  %select.ptr.73 = select i1 %safe.72, i32* %200, i32* %204
  %205 = load i32, i32* %200
  %select.val.74 = select i1 %201, i32 %199, i32 %205
  store i32 %select.val.74, i32* %select.ptr.73, align 4
  %206 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %207 = load i1, i1* %out.
  %208 = sext i32 10 to i64
  %209 = icmp slt i64 2, %208
  %210 = bitcast i64* %shadow to i32*
  %safe.75 = or i1 %207, %209
  %select.ptr.76 = select i1 %safe.75, i32* %206, i32* %210
  %211 = load i32, i32* %select.ptr.76, align 4
  %212 = ashr i32 %211, 31
  %213 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %214 = load i1, i1* %out.
  %215 = sext i32 10 to i64
  %216 = icmp slt i64 2, %215
  %217 = bitcast i64* %shadow to i32*
  %safe.77 = or i1 %214, %216
  %select.ptr.78 = select i1 %safe.77, i32* %213, i32* %217
  %218 = load i32, i32* %select.ptr.78, align 4
  %219 = and i32 %218, %212
  %220 = ashr i32 %219, 26
  %221 = sub nsw i32 0, %220
  %222 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %223 = load i1, i1* %out.
  %224 = sext i32 10 to i64
  %225 = icmp slt i64 2, %224
  %226 = bitcast i64* %shadow to i32*
  %safe.79 = or i1 %223, %225
  %select.ptr.80 = select i1 %safe.79, i32* %222, i32* %226
  %227 = load i32, i32* %select.ptr.80, align 4
  %228 = shl i32 %221, 26
  %229 = add nsw i32 %227, %228
  %230 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %231 = load i1, i1* %out.
  %232 = sext i32 10 to i64
  %233 = icmp slt i64 2, %232
  %234 = bitcast i64* %shadow to i32*
  %safe.81 = or i1 %231, %233
  %select.ptr.82 = select i1 %safe.81, i32* %230, i32* %234
  %235 = load i32, i32* %230
  %select.val.83 = select i1 %231, i32 %229, i32 %235
  store i32 %select.val.83, i32* %select.ptr.82, align 4
  %236 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %237 = load i1, i1* %out.
  %238 = sext i32 10 to i64
  %239 = icmp slt i64 3, %238
  %240 = bitcast i64* %shadow to i32*
  %safe.84 = or i1 %237, %239
  %select.ptr.85 = select i1 %safe.84, i32* %236, i32* %240
  %241 = load i32, i32* %select.ptr.85, align 4
  %242 = sub nsw i32 %241, %221
  %243 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %244 = load i1, i1* %out.
  %245 = sext i32 10 to i64
  %246 = icmp slt i64 3, %245
  %247 = bitcast i64* %shadow to i32*
  %safe.86 = or i1 %244, %246
  %select.ptr.87 = select i1 %safe.86, i32* %243, i32* %247
  %248 = load i32, i32* %243
  %select.val.88 = select i1 %244, i32 %242, i32 %248
  store i32 %select.val.88, i32* %select.ptr.87, align 4
  %249 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %250 = load i1, i1* %out.
  %251 = sext i32 10 to i64
  %252 = icmp slt i64 3, %251
  %253 = bitcast i64* %shadow to i32*
  %safe.89 = or i1 %250, %252
  %select.ptr.90 = select i1 %safe.89, i32* %249, i32* %253
  %254 = load i32, i32* %select.ptr.90, align 4
  %255 = ashr i32 %254, 31
  %256 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %257 = load i1, i1* %out.
  %258 = sext i32 10 to i64
  %259 = icmp slt i64 3, %258
  %260 = bitcast i64* %shadow to i32*
  %safe.91 = or i1 %257, %259
  %select.ptr.92 = select i1 %safe.91, i32* %256, i32* %260
  %261 = load i32, i32* %select.ptr.92, align 4
  %262 = and i32 %261, %255
  %263 = ashr i32 %262, 25
  %264 = sub nsw i32 0, %263
  %265 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %266 = load i1, i1* %out.
  %267 = sext i32 10 to i64
  %268 = icmp slt i64 3, %267
  %269 = bitcast i64* %shadow to i32*
  %safe.93 = or i1 %266, %268
  %select.ptr.94 = select i1 %safe.93, i32* %265, i32* %269
  %270 = load i32, i32* %select.ptr.94, align 4
  %271 = shl i32 %264, 25
  %272 = add nsw i32 %270, %271
  %273 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %274 = load i1, i1* %out.
  %275 = sext i32 10 to i64
  %276 = icmp slt i64 3, %275
  %277 = bitcast i64* %shadow to i32*
  %safe.95 = or i1 %274, %276
  %select.ptr.96 = select i1 %safe.95, i32* %273, i32* %277
  %278 = load i32, i32* %273
  %select.val.97 = select i1 %274, i32 %272, i32 %278
  store i32 %select.val.97, i32* %select.ptr.96, align 4
  %279 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %280 = load i1, i1* %out.
  %281 = sext i32 10 to i64
  %282 = icmp slt i64 4, %281
  %283 = bitcast i64* %shadow to i32*
  %safe.98 = or i1 %280, %282
  %select.ptr.99 = select i1 %safe.98, i32* %279, i32* %283
  %284 = load i32, i32* %select.ptr.99, align 4
  %285 = sub nsw i32 %284, %264
  %286 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %287 = load i1, i1* %out.
  %288 = sext i32 10 to i64
  %289 = icmp slt i64 4, %288
  %290 = bitcast i64* %shadow to i32*
  %safe.100 = or i1 %287, %289
  %select.ptr.101 = select i1 %safe.100, i32* %286, i32* %290
  %291 = load i32, i32* %286
  %select.val.102 = select i1 %287, i32 %285, i32 %291
  store i32 %select.val.102, i32* %select.ptr.101, align 4
  %292 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %293 = load i1, i1* %out.
  %294 = sext i32 10 to i64
  %295 = icmp slt i64 4, %294
  %296 = bitcast i64* %shadow to i32*
  %safe.103 = or i1 %293, %295
  %select.ptr.104 = select i1 %safe.103, i32* %292, i32* %296
  %297 = load i32, i32* %select.ptr.104, align 4
  %298 = ashr i32 %297, 31
  %299 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %300 = load i1, i1* %out.
  %301 = sext i32 10 to i64
  %302 = icmp slt i64 4, %301
  %303 = bitcast i64* %shadow to i32*
  %safe.105 = or i1 %300, %302
  %select.ptr.106 = select i1 %safe.105, i32* %299, i32* %303
  %304 = load i32, i32* %select.ptr.106, align 4
  %305 = and i32 %304, %298
  %306 = ashr i32 %305, 26
  %307 = sub nsw i32 0, %306
  %308 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %309 = load i1, i1* %out.
  %310 = sext i32 10 to i64
  %311 = icmp slt i64 4, %310
  %312 = bitcast i64* %shadow to i32*
  %safe.107 = or i1 %309, %311
  %select.ptr.108 = select i1 %safe.107, i32* %308, i32* %312
  %313 = load i32, i32* %select.ptr.108, align 4
  %314 = shl i32 %307, 26
  %315 = add nsw i32 %313, %314
  %316 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %317 = load i1, i1* %out.
  %318 = sext i32 10 to i64
  %319 = icmp slt i64 4, %318
  %320 = bitcast i64* %shadow to i32*
  %safe.109 = or i1 %317, %319
  %select.ptr.110 = select i1 %safe.109, i32* %316, i32* %320
  %321 = load i32, i32* %316
  %select.val.111 = select i1 %317, i32 %315, i32 %321
  store i32 %select.val.111, i32* %select.ptr.110, align 4
  %322 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %323 = load i1, i1* %out.
  %324 = sext i32 10 to i64
  %325 = icmp slt i64 5, %324
  %326 = bitcast i64* %shadow to i32*
  %safe.112 = or i1 %323, %325
  %select.ptr.113 = select i1 %safe.112, i32* %322, i32* %326
  %327 = load i32, i32* %select.ptr.113, align 4
  %328 = sub nsw i32 %327, %307
  %329 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %330 = load i1, i1* %out.
  %331 = sext i32 10 to i64
  %332 = icmp slt i64 5, %331
  %333 = bitcast i64* %shadow to i32*
  %safe.114 = or i1 %330, %332
  %select.ptr.115 = select i1 %safe.114, i32* %329, i32* %333
  %334 = load i32, i32* %329
  %select.val.116 = select i1 %330, i32 %328, i32 %334
  store i32 %select.val.116, i32* %select.ptr.115, align 4
  %335 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %336 = load i1, i1* %out.
  %337 = sext i32 10 to i64
  %338 = icmp slt i64 5, %337
  %339 = bitcast i64* %shadow to i32*
  %safe.117 = or i1 %336, %338
  %select.ptr.118 = select i1 %safe.117, i32* %335, i32* %339
  %340 = load i32, i32* %select.ptr.118, align 4
  %341 = ashr i32 %340, 31
  %342 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %343 = load i1, i1* %out.
  %344 = sext i32 10 to i64
  %345 = icmp slt i64 5, %344
  %346 = bitcast i64* %shadow to i32*
  %safe.119 = or i1 %343, %345
  %select.ptr.120 = select i1 %safe.119, i32* %342, i32* %346
  %347 = load i32, i32* %select.ptr.120, align 4
  %348 = and i32 %347, %341
  %349 = ashr i32 %348, 25
  %350 = sub nsw i32 0, %349
  %351 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %352 = load i1, i1* %out.
  %353 = sext i32 10 to i64
  %354 = icmp slt i64 5, %353
  %355 = bitcast i64* %shadow to i32*
  %safe.121 = or i1 %352, %354
  %select.ptr.122 = select i1 %safe.121, i32* %351, i32* %355
  %356 = load i32, i32* %select.ptr.122, align 4
  %357 = shl i32 %350, 25
  %358 = add nsw i32 %356, %357
  %359 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %360 = load i1, i1* %out.
  %361 = sext i32 10 to i64
  %362 = icmp slt i64 5, %361
  %363 = bitcast i64* %shadow to i32*
  %safe.123 = or i1 %360, %362
  %select.ptr.124 = select i1 %safe.123, i32* %359, i32* %363
  %364 = load i32, i32* %359
  %select.val.125 = select i1 %360, i32 %358, i32 %364
  store i32 %select.val.125, i32* %select.ptr.124, align 4
  %365 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %366 = load i1, i1* %out.
  %367 = sext i32 10 to i64
  %368 = icmp slt i64 6, %367
  %369 = bitcast i64* %shadow to i32*
  %safe.126 = or i1 %366, %368
  %select.ptr.127 = select i1 %safe.126, i32* %365, i32* %369
  %370 = load i32, i32* %select.ptr.127, align 4
  %371 = sub nsw i32 %370, %350
  %372 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %373 = load i1, i1* %out.
  %374 = sext i32 10 to i64
  %375 = icmp slt i64 6, %374
  %376 = bitcast i64* %shadow to i32*
  %safe.128 = or i1 %373, %375
  %select.ptr.129 = select i1 %safe.128, i32* %372, i32* %376
  %377 = load i32, i32* %372
  %select.val.130 = select i1 %373, i32 %371, i32 %377
  store i32 %select.val.130, i32* %select.ptr.129, align 4
  %378 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %379 = load i1, i1* %out.
  %380 = sext i32 10 to i64
  %381 = icmp slt i64 6, %380
  %382 = bitcast i64* %shadow to i32*
  %safe.131 = or i1 %379, %381
  %select.ptr.132 = select i1 %safe.131, i32* %378, i32* %382
  %383 = load i32, i32* %select.ptr.132, align 4
  %384 = ashr i32 %383, 31
  %385 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %386 = load i1, i1* %out.
  %387 = sext i32 10 to i64
  %388 = icmp slt i64 6, %387
  %389 = bitcast i64* %shadow to i32*
  %safe.133 = or i1 %386, %388
  %select.ptr.134 = select i1 %safe.133, i32* %385, i32* %389
  %390 = load i32, i32* %select.ptr.134, align 4
  %391 = and i32 %390, %384
  %392 = ashr i32 %391, 26
  %393 = sub nsw i32 0, %392
  %394 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %395 = load i1, i1* %out.
  %396 = sext i32 10 to i64
  %397 = icmp slt i64 6, %396
  %398 = bitcast i64* %shadow to i32*
  %safe.135 = or i1 %395, %397
  %select.ptr.136 = select i1 %safe.135, i32* %394, i32* %398
  %399 = load i32, i32* %select.ptr.136, align 4
  %400 = shl i32 %393, 26
  %401 = add nsw i32 %399, %400
  %402 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %403 = load i1, i1* %out.
  %404 = sext i32 10 to i64
  %405 = icmp slt i64 6, %404
  %406 = bitcast i64* %shadow to i32*
  %safe.137 = or i1 %403, %405
  %select.ptr.138 = select i1 %safe.137, i32* %402, i32* %406
  %407 = load i32, i32* %402
  %select.val.139 = select i1 %403, i32 %401, i32 %407
  store i32 %select.val.139, i32* %select.ptr.138, align 4
  %408 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %409 = load i1, i1* %out.
  %410 = sext i32 10 to i64
  %411 = icmp slt i64 7, %410
  %412 = bitcast i64* %shadow to i32*
  %safe.140 = or i1 %409, %411
  %select.ptr.141 = select i1 %safe.140, i32* %408, i32* %412
  %413 = load i32, i32* %select.ptr.141, align 4
  %414 = sub nsw i32 %413, %393
  %415 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %416 = load i1, i1* %out.
  %417 = sext i32 10 to i64
  %418 = icmp slt i64 7, %417
  %419 = bitcast i64* %shadow to i32*
  %safe.142 = or i1 %416, %418
  %select.ptr.143 = select i1 %safe.142, i32* %415, i32* %419
  %420 = load i32, i32* %415
  %select.val.144 = select i1 %416, i32 %414, i32 %420
  store i32 %select.val.144, i32* %select.ptr.143, align 4
  %421 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %422 = load i1, i1* %out.
  %423 = sext i32 10 to i64
  %424 = icmp slt i64 7, %423
  %425 = bitcast i64* %shadow to i32*
  %safe.145 = or i1 %422, %424
  %select.ptr.146 = select i1 %safe.145, i32* %421, i32* %425
  %426 = load i32, i32* %select.ptr.146, align 4
  %427 = ashr i32 %426, 31
  %428 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %429 = load i1, i1* %out.
  %430 = sext i32 10 to i64
  %431 = icmp slt i64 7, %430
  %432 = bitcast i64* %shadow to i32*
  %safe.147 = or i1 %429, %431
  %select.ptr.148 = select i1 %safe.147, i32* %428, i32* %432
  %433 = load i32, i32* %select.ptr.148, align 4
  %434 = and i32 %433, %427
  %435 = ashr i32 %434, 25
  %436 = sub nsw i32 0, %435
  %437 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %438 = load i1, i1* %out.
  %439 = sext i32 10 to i64
  %440 = icmp slt i64 7, %439
  %441 = bitcast i64* %shadow to i32*
  %safe.149 = or i1 %438, %440
  %select.ptr.150 = select i1 %safe.149, i32* %437, i32* %441
  %442 = load i32, i32* %select.ptr.150, align 4
  %443 = shl i32 %436, 25
  %444 = add nsw i32 %442, %443
  %445 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %446 = load i1, i1* %out.
  %447 = sext i32 10 to i64
  %448 = icmp slt i64 7, %447
  %449 = bitcast i64* %shadow to i32*
  %safe.151 = or i1 %446, %448
  %select.ptr.152 = select i1 %safe.151, i32* %445, i32* %449
  %450 = load i32, i32* %445
  %select.val.153 = select i1 %446, i32 %444, i32 %450
  store i32 %select.val.153, i32* %select.ptr.152, align 4
  %451 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %452 = load i1, i1* %out.
  %453 = sext i32 10 to i64
  %454 = icmp slt i64 8, %453
  %455 = bitcast i64* %shadow to i32*
  %safe.154 = or i1 %452, %454
  %select.ptr.155 = select i1 %safe.154, i32* %451, i32* %455
  %456 = load i32, i32* %select.ptr.155, align 4
  %457 = sub nsw i32 %456, %436
  %458 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %459 = load i1, i1* %out.
  %460 = sext i32 10 to i64
  %461 = icmp slt i64 8, %460
  %462 = bitcast i64* %shadow to i32*
  %safe.156 = or i1 %459, %461
  %select.ptr.157 = select i1 %safe.156, i32* %458, i32* %462
  %463 = load i32, i32* %458
  %select.val.158 = select i1 %459, i32 %457, i32 %463
  store i32 %select.val.158, i32* %select.ptr.157, align 4
  %464 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %465 = load i1, i1* %out.
  %466 = sext i32 10 to i64
  %467 = icmp slt i64 8, %466
  %468 = bitcast i64* %shadow to i32*
  %safe.159 = or i1 %465, %467
  %select.ptr.160 = select i1 %safe.159, i32* %464, i32* %468
  %469 = load i32, i32* %select.ptr.160, align 4
  %470 = ashr i32 %469, 31
  %471 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %472 = load i1, i1* %out.
  %473 = sext i32 10 to i64
  %474 = icmp slt i64 8, %473
  %475 = bitcast i64* %shadow to i32*
  %safe.161 = or i1 %472, %474
  %select.ptr.162 = select i1 %safe.161, i32* %471, i32* %475
  %476 = load i32, i32* %select.ptr.162, align 4
  %477 = and i32 %476, %470
  %478 = ashr i32 %477, 26
  %479 = sub nsw i32 0, %478
  %480 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %481 = load i1, i1* %out.
  %482 = sext i32 10 to i64
  %483 = icmp slt i64 8, %482
  %484 = bitcast i64* %shadow to i32*
  %safe.163 = or i1 %481, %483
  %select.ptr.164 = select i1 %safe.163, i32* %480, i32* %484
  %485 = load i32, i32* %select.ptr.164, align 4
  %486 = shl i32 %479, 26
  %487 = add nsw i32 %485, %486
  %488 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %489 = load i1, i1* %out.
  %490 = sext i32 10 to i64
  %491 = icmp slt i64 8, %490
  %492 = bitcast i64* %shadow to i32*
  %safe.165 = or i1 %489, %491
  %select.ptr.166 = select i1 %safe.165, i32* %488, i32* %492
  %493 = load i32, i32* %488
  %select.val.167 = select i1 %489, i32 %487, i32 %493
  store i32 %select.val.167, i32* %select.ptr.166, align 4
  %494 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %495 = load i1, i1* %out.
  %496 = sext i32 10 to i64
  %497 = icmp slt i64 9, %496
  %498 = bitcast i64* %shadow to i32*
  %safe.168 = or i1 %495, %497
  %select.ptr.169 = select i1 %safe.168, i32* %494, i32* %498
  %499 = load i32, i32* %select.ptr.169, align 4
  %500 = sub nsw i32 %499, %479
  %501 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %502 = load i1, i1* %out.
  %503 = sext i32 10 to i64
  %504 = icmp slt i64 9, %503
  %505 = bitcast i64* %shadow to i32*
  %safe.170 = or i1 %502, %504
  %select.ptr.171 = select i1 %safe.170, i32* %501, i32* %505
  %506 = load i32, i32* %501
  %select.val.172 = select i1 %502, i32 %500, i32 %506
  store i32 %select.val.172, i32* %select.ptr.171, align 4
  %507 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %508 = load i1, i1* %out.
  %509 = sext i32 10 to i64
  %510 = icmp slt i64 9, %509
  %511 = bitcast i64* %shadow to i32*
  %safe.173 = or i1 %508, %510
  %select.ptr.174 = select i1 %safe.173, i32* %507, i32* %511
  %512 = load i32, i32* %select.ptr.174, align 4
  %513 = ashr i32 %512, 31
  %514 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %515 = load i1, i1* %out.
  %516 = sext i32 10 to i64
  %517 = icmp slt i64 9, %516
  %518 = bitcast i64* %shadow to i32*
  %safe.175 = or i1 %515, %517
  %select.ptr.176 = select i1 %safe.175, i32* %514, i32* %518
  %519 = load i32, i32* %select.ptr.176, align 4
  %520 = and i32 %519, %513
  %521 = ashr i32 %520, 25
  %522 = sub nsw i32 0, %521
  %523 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %524 = load i1, i1* %out.
  %525 = sext i32 10 to i64
  %526 = icmp slt i64 9, %525
  %527 = bitcast i64* %shadow to i32*
  %safe.177 = or i1 %524, %526
  %select.ptr.178 = select i1 %safe.177, i32* %523, i32* %527
  %528 = load i32, i32* %select.ptr.178, align 4
  %529 = shl i32 %522, 25
  %530 = add nsw i32 %528, %529
  %531 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %532 = load i1, i1* %out.
  %533 = sext i32 10 to i64
  %534 = icmp slt i64 9, %533
  %535 = bitcast i64* %shadow to i32*
  %safe.179 = or i1 %532, %534
  %select.ptr.180 = select i1 %safe.179, i32* %531, i32* %535
  %536 = load i32, i32* %531
  %select.val.181 = select i1 %532, i32 %530, i32 %536
  store i32 %select.val.181, i32* %select.ptr.180, align 4
  %537 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %538 = load i1, i1* %out.
  %539 = sext i32 10 to i64
  %540 = icmp slt i64 0, %539
  %541 = bitcast i64* %shadow to i32*
  %safe.182 = or i1 %538, %540
  %select.ptr.183 = select i1 %safe.182, i32* %537, i32* %541
  %542 = load i32, i32* %select.ptr.183, align 16
  %543 = mul nsw i32 %522, 19
  %544 = sub nsw i32 %542, %543
  %545 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %546 = load i1, i1* %out.
  %547 = sext i32 10 to i64
  %548 = icmp slt i64 0, %547
  %549 = bitcast i64* %shadow to i32*
  %safe.184 = or i1 %546, %548
  %select.ptr.185 = select i1 %safe.184, i32* %545, i32* %549
  %550 = load i32, i32* %545
  %select.val.186 = select i1 %546, i32 %544, i32 %550
  store i32 %select.val.186, i32* %select.ptr.185, align 16
  %551 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %552 = load i1, i1* %out.
  %553 = sext i32 10 to i64
  %554 = icmp slt i64 0, %553
  %555 = bitcast i64* %shadow to i32*
  %safe.187 = or i1 %552, %554
  %select.ptr.188 = select i1 %safe.187, i32* %551, i32* %555
  %556 = load i32, i32* %select.ptr.188, align 4
  %557 = ashr i32 %556, 31
  %558 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %559 = load i1, i1* %out.
  %560 = sext i32 10 to i64
  %561 = icmp slt i64 0, %560
  %562 = bitcast i64* %shadow to i32*
  %safe.189 = or i1 %559, %561
  %select.ptr.190 = select i1 %safe.189, i32* %558, i32* %562
  %563 = load i32, i32* %select.ptr.190, align 4
  %564 = and i32 %563, %557
  %565 = ashr i32 %564, 26
  %566 = sub nsw i32 0, %565
  %567 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %568 = load i1, i1* %out.
  %569 = sext i32 10 to i64
  %570 = icmp slt i64 0, %569
  %571 = bitcast i64* %shadow to i32*
  %safe.191 = or i1 %568, %570
  %select.ptr.192 = select i1 %safe.191, i32* %567, i32* %571
  %572 = load i32, i32* %select.ptr.192, align 4
  %573 = shl i32 %566, 26
  %574 = add nsw i32 %572, %573
  %575 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %576 = load i1, i1* %out.
  %577 = sext i32 10 to i64
  %578 = icmp slt i64 0, %577
  %579 = bitcast i64* %shadow to i32*
  %safe.193 = or i1 %576, %578
  %select.ptr.194 = select i1 %safe.193, i32* %575, i32* %579
  %580 = load i32, i32* %575
  %select.val.195 = select i1 %576, i32 %574, i32 %580
  store i32 %select.val.195, i32* %select.ptr.194, align 4
  %581 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %582 = load i1, i1* %out.
  %583 = sext i32 10 to i64
  %584 = icmp slt i64 1, %583
  %585 = bitcast i64* %shadow to i32*
  %safe.196 = or i1 %582, %584
  %select.ptr.197 = select i1 %safe.196, i32* %581, i32* %585
  %586 = load i32, i32* %select.ptr.197, align 4
  %587 = sub nsw i32 %586, %566
  %588 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %589 = load i1, i1* %out.
  %590 = sext i32 10 to i64
  %591 = icmp slt i64 1, %590
  %592 = bitcast i64* %shadow to i32*
  %safe.198 = or i1 %589, %591
  %select.ptr.199 = select i1 %safe.198, i32* %588, i32* %592
  %593 = load i32, i32* %588
  %select.val.200 = select i1 %589, i32 %587, i32 %593
  store i32 %select.val.200, i32* %select.ptr.199, align 4
  %594 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %595 = load i1, i1* %out.
  %596 = sext i32 10 to i64
  %597 = icmp slt i64 1, %596
  %598 = bitcast i64* %shadow to i32*
  %safe.201 = or i1 %595, %597
  %select.ptr.202 = select i1 %safe.201, i32* %594, i32* %598
  %599 = load i32, i32* %select.ptr.202, align 4
  %600 = ashr i32 %599, 31
  %601 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %602 = load i1, i1* %out.
  %603 = sext i32 10 to i64
  %604 = icmp slt i64 1, %603
  %605 = bitcast i64* %shadow to i32*
  %safe.203 = or i1 %602, %604
  %select.ptr.204 = select i1 %safe.203, i32* %601, i32* %605
  %606 = load i32, i32* %select.ptr.204, align 4
  %607 = and i32 %606, %600
  %608 = ashr i32 %607, 25
  %609 = sub nsw i32 0, %608
  %610 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %611 = load i1, i1* %out.
  %612 = sext i32 10 to i64
  %613 = icmp slt i64 1, %612
  %614 = bitcast i64* %shadow to i32*
  %safe.205 = or i1 %611, %613
  %select.ptr.206 = select i1 %safe.205, i32* %610, i32* %614
  %615 = load i32, i32* %select.ptr.206, align 4
  %616 = shl i32 %609, 25
  %617 = add nsw i32 %615, %616
  %618 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %619 = load i1, i1* %out.
  %620 = sext i32 10 to i64
  %621 = icmp slt i64 1, %620
  %622 = bitcast i64* %shadow to i32*
  %safe.207 = or i1 %619, %621
  %select.ptr.208 = select i1 %safe.207, i32* %618, i32* %622
  %623 = load i32, i32* %618
  %select.val.209 = select i1 %619, i32 %617, i32 %623
  store i32 %select.val.209, i32* %select.ptr.208, align 4
  %624 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %625 = load i1, i1* %out.
  %626 = sext i32 10 to i64
  %627 = icmp slt i64 2, %626
  %628 = bitcast i64* %shadow to i32*
  %safe.210 = or i1 %625, %627
  %select.ptr.211 = select i1 %safe.210, i32* %624, i32* %628
  %629 = load i32, i32* %select.ptr.211, align 4
  %630 = sub nsw i32 %629, %609
  %631 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %632 = load i1, i1* %out.
  %633 = sext i32 10 to i64
  %634 = icmp slt i64 2, %633
  %635 = bitcast i64* %shadow to i32*
  %safe.212 = or i1 %632, %634
  %select.ptr.213 = select i1 %safe.212, i32* %631, i32* %635
  %636 = load i32, i32* %631
  %select.val.214 = select i1 %632, i32 %630, i32 %636
  store i32 %select.val.214, i32* %select.ptr.213, align 4
  %637 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %638 = load i1, i1* %out.
  %639 = sext i32 10 to i64
  %640 = icmp slt i64 2, %639
  %641 = bitcast i64* %shadow to i32*
  %safe.215 = or i1 %638, %640
  %select.ptr.216 = select i1 %safe.215, i32* %637, i32* %641
  %642 = load i32, i32* %select.ptr.216, align 4
  %643 = ashr i32 %642, 31
  %644 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %645 = load i1, i1* %out.
  %646 = sext i32 10 to i64
  %647 = icmp slt i64 2, %646
  %648 = bitcast i64* %shadow to i32*
  %safe.217 = or i1 %645, %647
  %select.ptr.218 = select i1 %safe.217, i32* %644, i32* %648
  %649 = load i32, i32* %select.ptr.218, align 4
  %650 = and i32 %649, %643
  %651 = ashr i32 %650, 26
  %652 = sub nsw i32 0, %651
  %653 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %654 = load i1, i1* %out.
  %655 = sext i32 10 to i64
  %656 = icmp slt i64 2, %655
  %657 = bitcast i64* %shadow to i32*
  %safe.219 = or i1 %654, %656
  %select.ptr.220 = select i1 %safe.219, i32* %653, i32* %657
  %658 = load i32, i32* %select.ptr.220, align 4
  %659 = shl i32 %652, 26
  %660 = add nsw i32 %658, %659
  %661 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %662 = load i1, i1* %out.
  %663 = sext i32 10 to i64
  %664 = icmp slt i64 2, %663
  %665 = bitcast i64* %shadow to i32*
  %safe.221 = or i1 %662, %664
  %select.ptr.222 = select i1 %safe.221, i32* %661, i32* %665
  %666 = load i32, i32* %661
  %select.val.223 = select i1 %662, i32 %660, i32 %666
  store i32 %select.val.223, i32* %select.ptr.222, align 4
  %667 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %668 = load i1, i1* %out.
  %669 = sext i32 10 to i64
  %670 = icmp slt i64 3, %669
  %671 = bitcast i64* %shadow to i32*
  %safe.224 = or i1 %668, %670
  %select.ptr.225 = select i1 %safe.224, i32* %667, i32* %671
  %672 = load i32, i32* %select.ptr.225, align 4
  %673 = sub nsw i32 %672, %652
  %674 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %675 = load i1, i1* %out.
  %676 = sext i32 10 to i64
  %677 = icmp slt i64 3, %676
  %678 = bitcast i64* %shadow to i32*
  %safe.226 = or i1 %675, %677
  %select.ptr.227 = select i1 %safe.226, i32* %674, i32* %678
  %679 = load i32, i32* %674
  %select.val.228 = select i1 %675, i32 %673, i32 %679
  store i32 %select.val.228, i32* %select.ptr.227, align 4
  %680 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %681 = load i1, i1* %out.
  %682 = sext i32 10 to i64
  %683 = icmp slt i64 3, %682
  %684 = bitcast i64* %shadow to i32*
  %safe.229 = or i1 %681, %683
  %select.ptr.230 = select i1 %safe.229, i32* %680, i32* %684
  %685 = load i32, i32* %select.ptr.230, align 4
  %686 = ashr i32 %685, 31
  %687 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %688 = load i1, i1* %out.
  %689 = sext i32 10 to i64
  %690 = icmp slt i64 3, %689
  %691 = bitcast i64* %shadow to i32*
  %safe.231 = or i1 %688, %690
  %select.ptr.232 = select i1 %safe.231, i32* %687, i32* %691
  %692 = load i32, i32* %select.ptr.232, align 4
  %693 = and i32 %692, %686
  %694 = ashr i32 %693, 25
  %695 = sub nsw i32 0, %694
  %696 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %697 = load i1, i1* %out.
  %698 = sext i32 10 to i64
  %699 = icmp slt i64 3, %698
  %700 = bitcast i64* %shadow to i32*
  %safe.233 = or i1 %697, %699
  %select.ptr.234 = select i1 %safe.233, i32* %696, i32* %700
  %701 = load i32, i32* %select.ptr.234, align 4
  %702 = shl i32 %695, 25
  %703 = add nsw i32 %701, %702
  %704 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %705 = load i1, i1* %out.
  %706 = sext i32 10 to i64
  %707 = icmp slt i64 3, %706
  %708 = bitcast i64* %shadow to i32*
  %safe.235 = or i1 %705, %707
  %select.ptr.236 = select i1 %safe.235, i32* %704, i32* %708
  %709 = load i32, i32* %704
  %select.val.237 = select i1 %705, i32 %703, i32 %709
  store i32 %select.val.237, i32* %select.ptr.236, align 4
  %710 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %711 = load i1, i1* %out.
  %712 = sext i32 10 to i64
  %713 = icmp slt i64 4, %712
  %714 = bitcast i64* %shadow to i32*
  %safe.238 = or i1 %711, %713
  %select.ptr.239 = select i1 %safe.238, i32* %710, i32* %714
  %715 = load i32, i32* %select.ptr.239, align 4
  %716 = sub nsw i32 %715, %695
  %717 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %718 = load i1, i1* %out.
  %719 = sext i32 10 to i64
  %720 = icmp slt i64 4, %719
  %721 = bitcast i64* %shadow to i32*
  %safe.240 = or i1 %718, %720
  %select.ptr.241 = select i1 %safe.240, i32* %717, i32* %721
  %722 = load i32, i32* %717
  %select.val.242 = select i1 %718, i32 %716, i32 %722
  store i32 %select.val.242, i32* %select.ptr.241, align 4
  %723 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %724 = load i1, i1* %out.
  %725 = sext i32 10 to i64
  %726 = icmp slt i64 4, %725
  %727 = bitcast i64* %shadow to i32*
  %safe.243 = or i1 %724, %726
  %select.ptr.244 = select i1 %safe.243, i32* %723, i32* %727
  %728 = load i32, i32* %select.ptr.244, align 4
  %729 = ashr i32 %728, 31
  %730 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %731 = load i1, i1* %out.
  %732 = sext i32 10 to i64
  %733 = icmp slt i64 4, %732
  %734 = bitcast i64* %shadow to i32*
  %safe.245 = or i1 %731, %733
  %select.ptr.246 = select i1 %safe.245, i32* %730, i32* %734
  %735 = load i32, i32* %select.ptr.246, align 4
  %736 = and i32 %735, %729
  %737 = ashr i32 %736, 26
  %738 = sub nsw i32 0, %737
  %739 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %740 = load i1, i1* %out.
  %741 = sext i32 10 to i64
  %742 = icmp slt i64 4, %741
  %743 = bitcast i64* %shadow to i32*
  %safe.247 = or i1 %740, %742
  %select.ptr.248 = select i1 %safe.247, i32* %739, i32* %743
  %744 = load i32, i32* %select.ptr.248, align 4
  %745 = shl i32 %738, 26
  %746 = add nsw i32 %744, %745
  %747 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %748 = load i1, i1* %out.
  %749 = sext i32 10 to i64
  %750 = icmp slt i64 4, %749
  %751 = bitcast i64* %shadow to i32*
  %safe.249 = or i1 %748, %750
  %select.ptr.250 = select i1 %safe.249, i32* %747, i32* %751
  %752 = load i32, i32* %747
  %select.val.251 = select i1 %748, i32 %746, i32 %752
  store i32 %select.val.251, i32* %select.ptr.250, align 4
  %753 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %754 = load i1, i1* %out.
  %755 = sext i32 10 to i64
  %756 = icmp slt i64 5, %755
  %757 = bitcast i64* %shadow to i32*
  %safe.252 = or i1 %754, %756
  %select.ptr.253 = select i1 %safe.252, i32* %753, i32* %757
  %758 = load i32, i32* %select.ptr.253, align 4
  %759 = sub nsw i32 %758, %738
  %760 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %761 = load i1, i1* %out.
  %762 = sext i32 10 to i64
  %763 = icmp slt i64 5, %762
  %764 = bitcast i64* %shadow to i32*
  %safe.254 = or i1 %761, %763
  %select.ptr.255 = select i1 %safe.254, i32* %760, i32* %764
  %765 = load i32, i32* %760
  %select.val.256 = select i1 %761, i32 %759, i32 %765
  store i32 %select.val.256, i32* %select.ptr.255, align 4
  %766 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %767 = load i1, i1* %out.
  %768 = sext i32 10 to i64
  %769 = icmp slt i64 5, %768
  %770 = bitcast i64* %shadow to i32*
  %safe.257 = or i1 %767, %769
  %select.ptr.258 = select i1 %safe.257, i32* %766, i32* %770
  %771 = load i32, i32* %select.ptr.258, align 4
  %772 = ashr i32 %771, 31
  %773 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %774 = load i1, i1* %out.
  %775 = sext i32 10 to i64
  %776 = icmp slt i64 5, %775
  %777 = bitcast i64* %shadow to i32*
  %safe.259 = or i1 %774, %776
  %select.ptr.260 = select i1 %safe.259, i32* %773, i32* %777
  %778 = load i32, i32* %select.ptr.260, align 4
  %779 = and i32 %778, %772
  %780 = ashr i32 %779, 25
  %781 = sub nsw i32 0, %780
  %782 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %783 = load i1, i1* %out.
  %784 = sext i32 10 to i64
  %785 = icmp slt i64 5, %784
  %786 = bitcast i64* %shadow to i32*
  %safe.261 = or i1 %783, %785
  %select.ptr.262 = select i1 %safe.261, i32* %782, i32* %786
  %787 = load i32, i32* %select.ptr.262, align 4
  %788 = shl i32 %781, 25
  %789 = add nsw i32 %787, %788
  %790 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %791 = load i1, i1* %out.
  %792 = sext i32 10 to i64
  %793 = icmp slt i64 5, %792
  %794 = bitcast i64* %shadow to i32*
  %safe.263 = or i1 %791, %793
  %select.ptr.264 = select i1 %safe.263, i32* %790, i32* %794
  %795 = load i32, i32* %790
  %select.val.265 = select i1 %791, i32 %789, i32 %795
  store i32 %select.val.265, i32* %select.ptr.264, align 4
  %796 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %797 = load i1, i1* %out.
  %798 = sext i32 10 to i64
  %799 = icmp slt i64 6, %798
  %800 = bitcast i64* %shadow to i32*
  %safe.266 = or i1 %797, %799
  %select.ptr.267 = select i1 %safe.266, i32* %796, i32* %800
  %801 = load i32, i32* %select.ptr.267, align 4
  %802 = sub nsw i32 %801, %781
  %803 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %804 = load i1, i1* %out.
  %805 = sext i32 10 to i64
  %806 = icmp slt i64 6, %805
  %807 = bitcast i64* %shadow to i32*
  %safe.268 = or i1 %804, %806
  %select.ptr.269 = select i1 %safe.268, i32* %803, i32* %807
  %808 = load i32, i32* %803
  %select.val.270 = select i1 %804, i32 %802, i32 %808
  store i32 %select.val.270, i32* %select.ptr.269, align 4
  %809 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %810 = load i1, i1* %out.
  %811 = sext i32 10 to i64
  %812 = icmp slt i64 6, %811
  %813 = bitcast i64* %shadow to i32*
  %safe.271 = or i1 %810, %812
  %select.ptr.272 = select i1 %safe.271, i32* %809, i32* %813
  %814 = load i32, i32* %select.ptr.272, align 4
  %815 = ashr i32 %814, 31
  %816 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %817 = load i1, i1* %out.
  %818 = sext i32 10 to i64
  %819 = icmp slt i64 6, %818
  %820 = bitcast i64* %shadow to i32*
  %safe.273 = or i1 %817, %819
  %select.ptr.274 = select i1 %safe.273, i32* %816, i32* %820
  %821 = load i32, i32* %select.ptr.274, align 4
  %822 = and i32 %821, %815
  %823 = ashr i32 %822, 26
  %824 = sub nsw i32 0, %823
  %825 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %826 = load i1, i1* %out.
  %827 = sext i32 10 to i64
  %828 = icmp slt i64 6, %827
  %829 = bitcast i64* %shadow to i32*
  %safe.275 = or i1 %826, %828
  %select.ptr.276 = select i1 %safe.275, i32* %825, i32* %829
  %830 = load i32, i32* %select.ptr.276, align 4
  %831 = shl i32 %824, 26
  %832 = add nsw i32 %830, %831
  %833 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %834 = load i1, i1* %out.
  %835 = sext i32 10 to i64
  %836 = icmp slt i64 6, %835
  %837 = bitcast i64* %shadow to i32*
  %safe.277 = or i1 %834, %836
  %select.ptr.278 = select i1 %safe.277, i32* %833, i32* %837
  %838 = load i32, i32* %833
  %select.val.279 = select i1 %834, i32 %832, i32 %838
  store i32 %select.val.279, i32* %select.ptr.278, align 4
  %839 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %840 = load i1, i1* %out.
  %841 = sext i32 10 to i64
  %842 = icmp slt i64 7, %841
  %843 = bitcast i64* %shadow to i32*
  %safe.280 = or i1 %840, %842
  %select.ptr.281 = select i1 %safe.280, i32* %839, i32* %843
  %844 = load i32, i32* %select.ptr.281, align 4
  %845 = sub nsw i32 %844, %824
  %846 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %847 = load i1, i1* %out.
  %848 = sext i32 10 to i64
  %849 = icmp slt i64 7, %848
  %850 = bitcast i64* %shadow to i32*
  %safe.282 = or i1 %847, %849
  %select.ptr.283 = select i1 %safe.282, i32* %846, i32* %850
  %851 = load i32, i32* %846
  %select.val.284 = select i1 %847, i32 %845, i32 %851
  store i32 %select.val.284, i32* %select.ptr.283, align 4
  %852 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %853 = load i1, i1* %out.
  %854 = sext i32 10 to i64
  %855 = icmp slt i64 7, %854
  %856 = bitcast i64* %shadow to i32*
  %safe.285 = or i1 %853, %855
  %select.ptr.286 = select i1 %safe.285, i32* %852, i32* %856
  %857 = load i32, i32* %select.ptr.286, align 4
  %858 = ashr i32 %857, 31
  %859 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %860 = load i1, i1* %out.
  %861 = sext i32 10 to i64
  %862 = icmp slt i64 7, %861
  %863 = bitcast i64* %shadow to i32*
  %safe.287 = or i1 %860, %862
  %select.ptr.288 = select i1 %safe.287, i32* %859, i32* %863
  %864 = load i32, i32* %select.ptr.288, align 4
  %865 = and i32 %864, %858
  %866 = ashr i32 %865, 25
  %867 = sub nsw i32 0, %866
  %868 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %869 = load i1, i1* %out.
  %870 = sext i32 10 to i64
  %871 = icmp slt i64 7, %870
  %872 = bitcast i64* %shadow to i32*
  %safe.289 = or i1 %869, %871
  %select.ptr.290 = select i1 %safe.289, i32* %868, i32* %872
  %873 = load i32, i32* %select.ptr.290, align 4
  %874 = shl i32 %867, 25
  %875 = add nsw i32 %873, %874
  %876 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %877 = load i1, i1* %out.
  %878 = sext i32 10 to i64
  %879 = icmp slt i64 7, %878
  %880 = bitcast i64* %shadow to i32*
  %safe.291 = or i1 %877, %879
  %select.ptr.292 = select i1 %safe.291, i32* %876, i32* %880
  %881 = load i32, i32* %876
  %select.val.293 = select i1 %877, i32 %875, i32 %881
  store i32 %select.val.293, i32* %select.ptr.292, align 4
  %882 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %883 = load i1, i1* %out.
  %884 = sext i32 10 to i64
  %885 = icmp slt i64 8, %884
  %886 = bitcast i64* %shadow to i32*
  %safe.294 = or i1 %883, %885
  %select.ptr.295 = select i1 %safe.294, i32* %882, i32* %886
  %887 = load i32, i32* %select.ptr.295, align 4
  %888 = sub nsw i32 %887, %867
  %889 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %890 = load i1, i1* %out.
  %891 = sext i32 10 to i64
  %892 = icmp slt i64 8, %891
  %893 = bitcast i64* %shadow to i32*
  %safe.296 = or i1 %890, %892
  %select.ptr.297 = select i1 %safe.296, i32* %889, i32* %893
  %894 = load i32, i32* %889
  %select.val.298 = select i1 %890, i32 %888, i32 %894
  store i32 %select.val.298, i32* %select.ptr.297, align 4
  %895 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %896 = load i1, i1* %out.
  %897 = sext i32 10 to i64
  %898 = icmp slt i64 8, %897
  %899 = bitcast i64* %shadow to i32*
  %safe.299 = or i1 %896, %898
  %select.ptr.300 = select i1 %safe.299, i32* %895, i32* %899
  %900 = load i32, i32* %select.ptr.300, align 4
  %901 = ashr i32 %900, 31
  %902 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %903 = load i1, i1* %out.
  %904 = sext i32 10 to i64
  %905 = icmp slt i64 8, %904
  %906 = bitcast i64* %shadow to i32*
  %safe.301 = or i1 %903, %905
  %select.ptr.302 = select i1 %safe.301, i32* %902, i32* %906
  %907 = load i32, i32* %select.ptr.302, align 4
  %908 = and i32 %907, %901
  %909 = ashr i32 %908, 26
  %910 = sub nsw i32 0, %909
  %911 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %912 = load i1, i1* %out.
  %913 = sext i32 10 to i64
  %914 = icmp slt i64 8, %913
  %915 = bitcast i64* %shadow to i32*
  %safe.303 = or i1 %912, %914
  %select.ptr.304 = select i1 %safe.303, i32* %911, i32* %915
  %916 = load i32, i32* %select.ptr.304, align 4
  %917 = shl i32 %910, 26
  %918 = add nsw i32 %916, %917
  %919 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %920 = load i1, i1* %out.
  %921 = sext i32 10 to i64
  %922 = icmp slt i64 8, %921
  %923 = bitcast i64* %shadow to i32*
  %safe.305 = or i1 %920, %922
  %select.ptr.306 = select i1 %safe.305, i32* %919, i32* %923
  %924 = load i32, i32* %919
  %select.val.307 = select i1 %920, i32 %918, i32 %924
  store i32 %select.val.307, i32* %select.ptr.306, align 4
  %925 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %926 = load i1, i1* %out.
  %927 = sext i32 10 to i64
  %928 = icmp slt i64 9, %927
  %929 = bitcast i64* %shadow to i32*
  %safe.308 = or i1 %926, %928
  %select.ptr.309 = select i1 %safe.308, i32* %925, i32* %929
  %930 = load i32, i32* %select.ptr.309, align 4
  %931 = sub nsw i32 %930, %910
  %932 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %933 = load i1, i1* %out.
  %934 = sext i32 10 to i64
  %935 = icmp slt i64 9, %934
  %936 = bitcast i64* %shadow to i32*
  %safe.310 = or i1 %933, %935
  %select.ptr.311 = select i1 %safe.310, i32* %932, i32* %936
  %937 = load i32, i32* %932
  %select.val.312 = select i1 %933, i32 %931, i32 %937
  store i32 %select.val.312, i32* %select.ptr.311, align 4
  %938 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %939 = load i1, i1* %out.
  %940 = sext i32 10 to i64
  %941 = icmp slt i64 9, %940
  %942 = bitcast i64* %shadow to i32*
  %safe.313 = or i1 %939, %941
  %select.ptr.314 = select i1 %safe.313, i32* %938, i32* %942
  %943 = load i32, i32* %select.ptr.314, align 4
  %944 = ashr i32 %943, 31
  %945 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %946 = load i1, i1* %out.
  %947 = sext i32 10 to i64
  %948 = icmp slt i64 9, %947
  %949 = bitcast i64* %shadow to i32*
  %safe.315 = or i1 %946, %948
  %select.ptr.316 = select i1 %safe.315, i32* %945, i32* %949
  %950 = load i32, i32* %select.ptr.316, align 4
  %951 = and i32 %950, %944
  %952 = ashr i32 %951, 25
  %953 = sub nsw i32 0, %952
  %954 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %955 = load i1, i1* %out.
  %956 = sext i32 10 to i64
  %957 = icmp slt i64 9, %956
  %958 = bitcast i64* %shadow to i32*
  %safe.317 = or i1 %955, %957
  %select.ptr.318 = select i1 %safe.317, i32* %954, i32* %958
  %959 = load i32, i32* %select.ptr.318, align 4
  %960 = shl i32 %953, 25
  %961 = add nsw i32 %959, %960
  %962 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %963 = load i1, i1* %out.
  %964 = sext i32 10 to i64
  %965 = icmp slt i64 9, %964
  %966 = bitcast i64* %shadow to i32*
  %safe.319 = or i1 %963, %965
  %select.ptr.320 = select i1 %safe.319, i32* %962, i32* %966
  %967 = load i32, i32* %962
  %select.val.321 = select i1 %963, i32 %961, i32 %967
  store i32 %select.val.321, i32* %select.ptr.320, align 4
  %968 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %969 = load i1, i1* %out.
  %970 = sext i32 10 to i64
  %971 = icmp slt i64 0, %970
  %972 = bitcast i64* %shadow to i32*
  %safe.322 = or i1 %969, %971
  %select.ptr.323 = select i1 %safe.322, i32* %968, i32* %972
  %973 = load i32, i32* %select.ptr.323, align 16
  %974 = mul nsw i32 %953, 19
  %975 = sub nsw i32 %973, %974
  %976 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %977 = load i1, i1* %out.
  %978 = sext i32 10 to i64
  %979 = icmp slt i64 0, %978
  %980 = bitcast i64* %shadow to i32*
  %safe.324 = or i1 %977, %979
  %select.ptr.325 = select i1 %safe.324, i32* %976, i32* %980
  %981 = load i32, i32* %976
  %select.val.326 = select i1 %977, i32 %975, i32 %981
  store i32 %select.val.326, i32* %select.ptr.325, align 16
  %982 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %983 = load i1, i1* %out.
  %984 = sext i32 10 to i64
  %985 = icmp slt i64 0, %984
  %986 = bitcast i64* %shadow to i32*
  %safe.327 = or i1 %983, %985
  %select.ptr.328 = select i1 %safe.327, i32* %982, i32* %986
  %987 = load i32, i32* %select.ptr.328, align 16
  %988 = ashr i32 %987, 31
  %989 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %990 = load i1, i1* %out.
  %991 = sext i32 10 to i64
  %992 = icmp slt i64 0, %991
  %993 = bitcast i64* %shadow to i32*
  %safe.329 = or i1 %990, %992
  %select.ptr.330 = select i1 %safe.329, i32* %989, i32* %993
  %994 = load i32, i32* %select.ptr.330, align 16
  %995 = and i32 %994, %988
  %996 = ashr i32 %995, 26
  %997 = sub nsw i32 0, %996
  %998 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %999 = load i1, i1* %out.
  %1000 = sext i32 10 to i64
  %1001 = icmp slt i64 0, %1000
  %1002 = bitcast i64* %shadow to i32*
  %safe.331 = or i1 %999, %1001
  %select.ptr.332 = select i1 %safe.331, i32* %998, i32* %1002
  %1003 = load i32, i32* %select.ptr.332, align 16
  %1004 = shl i32 %997, 26
  %1005 = add nsw i32 %1003, %1004
  %1006 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %1007 = load i1, i1* %out.
  %1008 = sext i32 10 to i64
  %1009 = icmp slt i64 0, %1008
  %1010 = bitcast i64* %shadow to i32*
  %safe.333 = or i1 %1007, %1009
  %select.ptr.334 = select i1 %safe.333, i32* %1006, i32* %1010
  %1011 = load i32, i32* %1006
  %select.val.335 = select i1 %1007, i32 %1005, i32 %1011
  store i32 %select.val.335, i32* %select.ptr.334, align 16
  %1012 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %1013 = load i1, i1* %out.
  %1014 = sext i32 10 to i64
  %1015 = icmp slt i64 1, %1014
  %1016 = bitcast i64* %shadow to i32*
  %safe.336 = or i1 %1013, %1015
  %select.ptr.337 = select i1 %safe.336, i32* %1012, i32* %1016
  %1017 = load i32, i32* %select.ptr.337, align 4
  %1018 = sub nsw i32 %1017, %997
  %1019 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %1020 = load i1, i1* %out.
  %1021 = sext i32 10 to i64
  %1022 = icmp slt i64 1, %1021
  %1023 = bitcast i64* %shadow to i32*
  %safe.338 = or i1 %1020, %1022
  %select.ptr.339 = select i1 %safe.338, i32* %1019, i32* %1023
  %1024 = load i32, i32* %1019
  %select.val.340 = select i1 %1020, i32 %1018, i32 %1024
  store i32 %select.val.340, i32* %select.ptr.339, align 4
  %1025 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %1026 = load i1, i1* %out.
  %1027 = sext i32 10 to i64
  %1028 = icmp slt i64 0, %1027
  %1029 = bitcast i64* %shadow to i32*
  %safe.341 = or i1 %1026, %1028
  %select.ptr.342 = select i1 %safe.341, i32* %1025, i32* %1029
  %1030 = load i32, i32* %select.ptr.342, align 4
  %1031 = ashr i32 %1030, 26
  %1032 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %1033 = load i1, i1* %out.
  %1034 = sext i32 10 to i64
  %1035 = icmp slt i64 0, %1034
  %1036 = bitcast i64* %shadow to i32*
  %safe.343 = or i1 %1033, %1035
  %select.ptr.344 = select i1 %safe.343, i32* %1032, i32* %1036
  %1037 = load i32, i32* %select.ptr.344, align 4
  %1038 = and i32 %1037, 67108863
  %1039 = load i1, i1* %out.
  %1040 = sext i32 10 to i64
  %1041 = icmp slt i64 0, %1040
  %1042 = bitcast i64* %shadow to i32*
  %safe.345 = or i1 %1039, %1041
  %select.ptr.346 = select i1 %safe.345, i32* %1032, i32* %1042
  %1043 = load i32, i32* %1032
  %select.val.347 = select i1 %1039, i32 %1038, i32 %1043
  store i32 %select.val.347, i32* %select.ptr.346, align 4
  %1044 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %1045 = load i1, i1* %out.
  %1046 = sext i32 10 to i64
  %1047 = icmp slt i64 1, %1046
  %1048 = bitcast i64* %shadow to i32*
  %safe.348 = or i1 %1045, %1047
  %select.ptr.349 = select i1 %safe.348, i32* %1044, i32* %1048
  %1049 = load i32, i32* %select.ptr.349, align 4
  %1050 = add nsw i32 %1049, %1031
  %1051 = load i1, i1* %out.
  %1052 = sext i32 10 to i64
  %1053 = icmp slt i64 1, %1052
  %1054 = bitcast i64* %shadow to i32*
  %safe.350 = or i1 %1051, %1053
  %select.ptr.351 = select i1 %safe.350, i32* %1044, i32* %1054
  %1055 = load i32, i32* %1044
  %select.val.352 = select i1 %1051, i32 %1050, i32 %1055
  store i32 %select.val.352, i32* %select.ptr.351, align 4
  %1056 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %1057 = load i1, i1* %out.
  %1058 = sext i32 10 to i64
  %1059 = icmp slt i64 1, %1058
  %1060 = bitcast i64* %shadow to i32*
  %safe.353 = or i1 %1057, %1059
  %select.ptr.354 = select i1 %safe.353, i32* %1056, i32* %1060
  %1061 = load i32, i32* %select.ptr.354, align 4
  %1062 = ashr i32 %1061, 25
  %1063 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %1064 = load i1, i1* %out.
  %1065 = sext i32 10 to i64
  %1066 = icmp slt i64 1, %1065
  %1067 = bitcast i64* %shadow to i32*
  %safe.355 = or i1 %1064, %1066
  %select.ptr.356 = select i1 %safe.355, i32* %1063, i32* %1067
  %1068 = load i32, i32* %select.ptr.356, align 4
  %1069 = and i32 %1068, 33554431
  %1070 = load i1, i1* %out.
  %1071 = sext i32 10 to i64
  %1072 = icmp slt i64 1, %1071
  %1073 = bitcast i64* %shadow to i32*
  %safe.357 = or i1 %1070, %1072
  %select.ptr.358 = select i1 %safe.357, i32* %1063, i32* %1073
  %1074 = load i32, i32* %1063
  %select.val.359 = select i1 %1070, i32 %1069, i32 %1074
  store i32 %select.val.359, i32* %select.ptr.358, align 4
  %1075 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %1076 = load i1, i1* %out.
  %1077 = sext i32 10 to i64
  %1078 = icmp slt i64 2, %1077
  %1079 = bitcast i64* %shadow to i32*
  %safe.360 = or i1 %1076, %1078
  %select.ptr.361 = select i1 %safe.360, i32* %1075, i32* %1079
  %1080 = load i32, i32* %select.ptr.361, align 4
  %1081 = add nsw i32 %1080, %1062
  %1082 = load i1, i1* %out.
  %1083 = sext i32 10 to i64
  %1084 = icmp slt i64 2, %1083
  %1085 = bitcast i64* %shadow to i32*
  %safe.362 = or i1 %1082, %1084
  %select.ptr.363 = select i1 %safe.362, i32* %1075, i32* %1085
  %1086 = load i32, i32* %1075
  %select.val.364 = select i1 %1082, i32 %1081, i32 %1086
  store i32 %select.val.364, i32* %select.ptr.363, align 4
  %1087 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %1088 = load i1, i1* %out.
  %1089 = sext i32 10 to i64
  %1090 = icmp slt i64 2, %1089
  %1091 = bitcast i64* %shadow to i32*
  %safe.365 = or i1 %1088, %1090
  %select.ptr.366 = select i1 %safe.365, i32* %1087, i32* %1091
  %1092 = load i32, i32* %select.ptr.366, align 4
  %1093 = ashr i32 %1092, 26
  %1094 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %1095 = load i1, i1* %out.
  %1096 = sext i32 10 to i64
  %1097 = icmp slt i64 2, %1096
  %1098 = bitcast i64* %shadow to i32*
  %safe.367 = or i1 %1095, %1097
  %select.ptr.368 = select i1 %safe.367, i32* %1094, i32* %1098
  %1099 = load i32, i32* %select.ptr.368, align 4
  %1100 = and i32 %1099, 67108863
  %1101 = load i1, i1* %out.
  %1102 = sext i32 10 to i64
  %1103 = icmp slt i64 2, %1102
  %1104 = bitcast i64* %shadow to i32*
  %safe.369 = or i1 %1101, %1103
  %select.ptr.370 = select i1 %safe.369, i32* %1094, i32* %1104
  %1105 = load i32, i32* %1094
  %select.val.371 = select i1 %1101, i32 %1100, i32 %1105
  store i32 %select.val.371, i32* %select.ptr.370, align 4
  %1106 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %1107 = load i1, i1* %out.
  %1108 = sext i32 10 to i64
  %1109 = icmp slt i64 3, %1108
  %1110 = bitcast i64* %shadow to i32*
  %safe.372 = or i1 %1107, %1109
  %select.ptr.373 = select i1 %safe.372, i32* %1106, i32* %1110
  %1111 = load i32, i32* %select.ptr.373, align 4
  %1112 = add nsw i32 %1111, %1093
  %1113 = load i1, i1* %out.
  %1114 = sext i32 10 to i64
  %1115 = icmp slt i64 3, %1114
  %1116 = bitcast i64* %shadow to i32*
  %safe.374 = or i1 %1113, %1115
  %select.ptr.375 = select i1 %safe.374, i32* %1106, i32* %1116
  %1117 = load i32, i32* %1106
  %select.val.376 = select i1 %1113, i32 %1112, i32 %1117
  store i32 %select.val.376, i32* %select.ptr.375, align 4
  %1118 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %1119 = load i1, i1* %out.
  %1120 = sext i32 10 to i64
  %1121 = icmp slt i64 3, %1120
  %1122 = bitcast i64* %shadow to i32*
  %safe.377 = or i1 %1119, %1121
  %select.ptr.378 = select i1 %safe.377, i32* %1118, i32* %1122
  %1123 = load i32, i32* %select.ptr.378, align 4
  %1124 = ashr i32 %1123, 25
  %1125 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %1126 = load i1, i1* %out.
  %1127 = sext i32 10 to i64
  %1128 = icmp slt i64 3, %1127
  %1129 = bitcast i64* %shadow to i32*
  %safe.379 = or i1 %1126, %1128
  %select.ptr.380 = select i1 %safe.379, i32* %1125, i32* %1129
  %1130 = load i32, i32* %select.ptr.380, align 4
  %1131 = and i32 %1130, 33554431
  %1132 = load i1, i1* %out.
  %1133 = sext i32 10 to i64
  %1134 = icmp slt i64 3, %1133
  %1135 = bitcast i64* %shadow to i32*
  %safe.381 = or i1 %1132, %1134
  %select.ptr.382 = select i1 %safe.381, i32* %1125, i32* %1135
  %1136 = load i32, i32* %1125
  %select.val.383 = select i1 %1132, i32 %1131, i32 %1136
  store i32 %select.val.383, i32* %select.ptr.382, align 4
  %1137 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %1138 = load i1, i1* %out.
  %1139 = sext i32 10 to i64
  %1140 = icmp slt i64 4, %1139
  %1141 = bitcast i64* %shadow to i32*
  %safe.384 = or i1 %1138, %1140
  %select.ptr.385 = select i1 %safe.384, i32* %1137, i32* %1141
  %1142 = load i32, i32* %select.ptr.385, align 4
  %1143 = add nsw i32 %1142, %1124
  %1144 = load i1, i1* %out.
  %1145 = sext i32 10 to i64
  %1146 = icmp slt i64 4, %1145
  %1147 = bitcast i64* %shadow to i32*
  %safe.386 = or i1 %1144, %1146
  %select.ptr.387 = select i1 %safe.386, i32* %1137, i32* %1147
  %1148 = load i32, i32* %1137
  %select.val.388 = select i1 %1144, i32 %1143, i32 %1148
  store i32 %select.val.388, i32* %select.ptr.387, align 4
  %1149 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %1150 = load i1, i1* %out.
  %1151 = sext i32 10 to i64
  %1152 = icmp slt i64 4, %1151
  %1153 = bitcast i64* %shadow to i32*
  %safe.389 = or i1 %1150, %1152
  %select.ptr.390 = select i1 %safe.389, i32* %1149, i32* %1153
  %1154 = load i32, i32* %select.ptr.390, align 4
  %1155 = ashr i32 %1154, 26
  %1156 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %1157 = load i1, i1* %out.
  %1158 = sext i32 10 to i64
  %1159 = icmp slt i64 4, %1158
  %1160 = bitcast i64* %shadow to i32*
  %safe.391 = or i1 %1157, %1159
  %select.ptr.392 = select i1 %safe.391, i32* %1156, i32* %1160
  %1161 = load i32, i32* %select.ptr.392, align 4
  %1162 = and i32 %1161, 67108863
  %1163 = load i1, i1* %out.
  %1164 = sext i32 10 to i64
  %1165 = icmp slt i64 4, %1164
  %1166 = bitcast i64* %shadow to i32*
  %safe.393 = or i1 %1163, %1165
  %select.ptr.394 = select i1 %safe.393, i32* %1156, i32* %1166
  %1167 = load i32, i32* %1156
  %select.val.395 = select i1 %1163, i32 %1162, i32 %1167
  store i32 %select.val.395, i32* %select.ptr.394, align 4
  %1168 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %1169 = load i1, i1* %out.
  %1170 = sext i32 10 to i64
  %1171 = icmp slt i64 5, %1170
  %1172 = bitcast i64* %shadow to i32*
  %safe.396 = or i1 %1169, %1171
  %select.ptr.397 = select i1 %safe.396, i32* %1168, i32* %1172
  %1173 = load i32, i32* %select.ptr.397, align 4
  %1174 = add nsw i32 %1173, %1155
  %1175 = load i1, i1* %out.
  %1176 = sext i32 10 to i64
  %1177 = icmp slt i64 5, %1176
  %1178 = bitcast i64* %shadow to i32*
  %safe.398 = or i1 %1175, %1177
  %select.ptr.399 = select i1 %safe.398, i32* %1168, i32* %1178
  %1179 = load i32, i32* %1168
  %select.val.400 = select i1 %1175, i32 %1174, i32 %1179
  store i32 %select.val.400, i32* %select.ptr.399, align 4
  %1180 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %1181 = load i1, i1* %out.
  %1182 = sext i32 10 to i64
  %1183 = icmp slt i64 5, %1182
  %1184 = bitcast i64* %shadow to i32*
  %safe.401 = or i1 %1181, %1183
  %select.ptr.402 = select i1 %safe.401, i32* %1180, i32* %1184
  %1185 = load i32, i32* %select.ptr.402, align 4
  %1186 = ashr i32 %1185, 25
  %1187 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %1188 = load i1, i1* %out.
  %1189 = sext i32 10 to i64
  %1190 = icmp slt i64 5, %1189
  %1191 = bitcast i64* %shadow to i32*
  %safe.403 = or i1 %1188, %1190
  %select.ptr.404 = select i1 %safe.403, i32* %1187, i32* %1191
  %1192 = load i32, i32* %select.ptr.404, align 4
  %1193 = and i32 %1192, 33554431
  %1194 = load i1, i1* %out.
  %1195 = sext i32 10 to i64
  %1196 = icmp slt i64 5, %1195
  %1197 = bitcast i64* %shadow to i32*
  %safe.405 = or i1 %1194, %1196
  %select.ptr.406 = select i1 %safe.405, i32* %1187, i32* %1197
  %1198 = load i32, i32* %1187
  %select.val.407 = select i1 %1194, i32 %1193, i32 %1198
  store i32 %select.val.407, i32* %select.ptr.406, align 4
  %1199 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %1200 = load i1, i1* %out.
  %1201 = sext i32 10 to i64
  %1202 = icmp slt i64 6, %1201
  %1203 = bitcast i64* %shadow to i32*
  %safe.408 = or i1 %1200, %1202
  %select.ptr.409 = select i1 %safe.408, i32* %1199, i32* %1203
  %1204 = load i32, i32* %select.ptr.409, align 4
  %1205 = add nsw i32 %1204, %1186
  %1206 = load i1, i1* %out.
  %1207 = sext i32 10 to i64
  %1208 = icmp slt i64 6, %1207
  %1209 = bitcast i64* %shadow to i32*
  %safe.410 = or i1 %1206, %1208
  %select.ptr.411 = select i1 %safe.410, i32* %1199, i32* %1209
  %1210 = load i32, i32* %1199
  %select.val.412 = select i1 %1206, i32 %1205, i32 %1210
  store i32 %select.val.412, i32* %select.ptr.411, align 4
  %1211 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %1212 = load i1, i1* %out.
  %1213 = sext i32 10 to i64
  %1214 = icmp slt i64 6, %1213
  %1215 = bitcast i64* %shadow to i32*
  %safe.413 = or i1 %1212, %1214
  %select.ptr.414 = select i1 %safe.413, i32* %1211, i32* %1215
  %1216 = load i32, i32* %select.ptr.414, align 4
  %1217 = ashr i32 %1216, 26
  %1218 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %1219 = load i1, i1* %out.
  %1220 = sext i32 10 to i64
  %1221 = icmp slt i64 6, %1220
  %1222 = bitcast i64* %shadow to i32*
  %safe.415 = or i1 %1219, %1221
  %select.ptr.416 = select i1 %safe.415, i32* %1218, i32* %1222
  %1223 = load i32, i32* %select.ptr.416, align 4
  %1224 = and i32 %1223, 67108863
  %1225 = load i1, i1* %out.
  %1226 = sext i32 10 to i64
  %1227 = icmp slt i64 6, %1226
  %1228 = bitcast i64* %shadow to i32*
  %safe.417 = or i1 %1225, %1227
  %select.ptr.418 = select i1 %safe.417, i32* %1218, i32* %1228
  %1229 = load i32, i32* %1218
  %select.val.419 = select i1 %1225, i32 %1224, i32 %1229
  store i32 %select.val.419, i32* %select.ptr.418, align 4
  %1230 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %1231 = load i1, i1* %out.
  %1232 = sext i32 10 to i64
  %1233 = icmp slt i64 7, %1232
  %1234 = bitcast i64* %shadow to i32*
  %safe.420 = or i1 %1231, %1233
  %select.ptr.421 = select i1 %safe.420, i32* %1230, i32* %1234
  %1235 = load i32, i32* %select.ptr.421, align 4
  %1236 = add nsw i32 %1235, %1217
  %1237 = load i1, i1* %out.
  %1238 = sext i32 10 to i64
  %1239 = icmp slt i64 7, %1238
  %1240 = bitcast i64* %shadow to i32*
  %safe.422 = or i1 %1237, %1239
  %select.ptr.423 = select i1 %safe.422, i32* %1230, i32* %1240
  %1241 = load i32, i32* %1230
  %select.val.424 = select i1 %1237, i32 %1236, i32 %1241
  store i32 %select.val.424, i32* %select.ptr.423, align 4
  %1242 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %1243 = load i1, i1* %out.
  %1244 = sext i32 10 to i64
  %1245 = icmp slt i64 7, %1244
  %1246 = bitcast i64* %shadow to i32*
  %safe.425 = or i1 %1243, %1245
  %select.ptr.426 = select i1 %safe.425, i32* %1242, i32* %1246
  %1247 = load i32, i32* %select.ptr.426, align 4
  %1248 = ashr i32 %1247, 25
  %1249 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %1250 = load i1, i1* %out.
  %1251 = sext i32 10 to i64
  %1252 = icmp slt i64 7, %1251
  %1253 = bitcast i64* %shadow to i32*
  %safe.427 = or i1 %1250, %1252
  %select.ptr.428 = select i1 %safe.427, i32* %1249, i32* %1253
  %1254 = load i32, i32* %select.ptr.428, align 4
  %1255 = and i32 %1254, 33554431
  %1256 = load i1, i1* %out.
  %1257 = sext i32 10 to i64
  %1258 = icmp slt i64 7, %1257
  %1259 = bitcast i64* %shadow to i32*
  %safe.429 = or i1 %1256, %1258
  %select.ptr.430 = select i1 %safe.429, i32* %1249, i32* %1259
  %1260 = load i32, i32* %1249
  %select.val.431 = select i1 %1256, i32 %1255, i32 %1260
  store i32 %select.val.431, i32* %select.ptr.430, align 4
  %1261 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %1262 = load i1, i1* %out.
  %1263 = sext i32 10 to i64
  %1264 = icmp slt i64 8, %1263
  %1265 = bitcast i64* %shadow to i32*
  %safe.432 = or i1 %1262, %1264
  %select.ptr.433 = select i1 %safe.432, i32* %1261, i32* %1265
  %1266 = load i32, i32* %select.ptr.433, align 4
  %1267 = add nsw i32 %1266, %1248
  %1268 = load i1, i1* %out.
  %1269 = sext i32 10 to i64
  %1270 = icmp slt i64 8, %1269
  %1271 = bitcast i64* %shadow to i32*
  %safe.434 = or i1 %1268, %1270
  %select.ptr.435 = select i1 %safe.434, i32* %1261, i32* %1271
  %1272 = load i32, i32* %1261
  %select.val.436 = select i1 %1268, i32 %1267, i32 %1272
  store i32 %select.val.436, i32* %select.ptr.435, align 4
  %1273 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %1274 = load i1, i1* %out.
  %1275 = sext i32 10 to i64
  %1276 = icmp slt i64 8, %1275
  %1277 = bitcast i64* %shadow to i32*
  %safe.437 = or i1 %1274, %1276
  %select.ptr.438 = select i1 %safe.437, i32* %1273, i32* %1277
  %1278 = load i32, i32* %select.ptr.438, align 4
  %1279 = ashr i32 %1278, 26
  %1280 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %1281 = load i1, i1* %out.
  %1282 = sext i32 10 to i64
  %1283 = icmp slt i64 8, %1282
  %1284 = bitcast i64* %shadow to i32*
  %safe.439 = or i1 %1281, %1283
  %select.ptr.440 = select i1 %safe.439, i32* %1280, i32* %1284
  %1285 = load i32, i32* %select.ptr.440, align 4
  %1286 = and i32 %1285, 67108863
  %1287 = load i1, i1* %out.
  %1288 = sext i32 10 to i64
  %1289 = icmp slt i64 8, %1288
  %1290 = bitcast i64* %shadow to i32*
  %safe.441 = or i1 %1287, %1289
  %select.ptr.442 = select i1 %safe.441, i32* %1280, i32* %1290
  %1291 = load i32, i32* %1280
  %select.val.443 = select i1 %1287, i32 %1286, i32 %1291
  store i32 %select.val.443, i32* %select.ptr.442, align 4
  %1292 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %1293 = load i1, i1* %out.
  %1294 = sext i32 10 to i64
  %1295 = icmp slt i64 9, %1294
  %1296 = bitcast i64* %shadow to i32*
  %safe.444 = or i1 %1293, %1295
  %select.ptr.445 = select i1 %safe.444, i32* %1292, i32* %1296
  %1297 = load i32, i32* %select.ptr.445, align 4
  %1298 = add nsw i32 %1297, %1279
  %1299 = load i1, i1* %out.
  %1300 = sext i32 10 to i64
  %1301 = icmp slt i64 9, %1300
  %1302 = bitcast i64* %shadow to i32*
  %safe.446 = or i1 %1299, %1301
  %select.ptr.447 = select i1 %safe.446, i32* %1292, i32* %1302
  %1303 = load i32, i32* %1292
  %select.val.448 = select i1 %1299, i32 %1298, i32 %1303
  store i32 %select.val.448, i32* %select.ptr.447, align 4
  %1304 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %1305 = load i1, i1* %out.
  %1306 = sext i32 10 to i64
  %1307 = icmp slt i64 9, %1306
  %1308 = bitcast i64* %shadow to i32*
  %safe.449 = or i1 %1305, %1307
  %select.ptr.450 = select i1 %safe.449, i32* %1304, i32* %1308
  %1309 = load i32, i32* %select.ptr.450, align 4
  %1310 = ashr i32 %1309, 25
  %1311 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %1312 = load i1, i1* %out.
  %1313 = sext i32 10 to i64
  %1314 = icmp slt i64 9, %1313
  %1315 = bitcast i64* %shadow to i32*
  %safe.451 = or i1 %1312, %1314
  %select.ptr.452 = select i1 %safe.451, i32* %1311, i32* %1315
  %1316 = load i32, i32* %select.ptr.452, align 4
  %1317 = and i32 %1316, 33554431
  %1318 = load i1, i1* %out.
  %1319 = sext i32 10 to i64
  %1320 = icmp slt i64 9, %1319
  %1321 = bitcast i64* %shadow to i32*
  %safe.453 = or i1 %1318, %1320
  %select.ptr.454 = select i1 %safe.453, i32* %1311, i32* %1321
  %1322 = load i32, i32* %1311
  %select.val.455 = select i1 %1318, i32 %1317, i32 %1322
  store i32 %select.val.455, i32* %select.ptr.454, align 4
  %1323 = mul nsw i32 19, %1310
  %1324 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %1325 = load i1, i1* %out.
  %1326 = sext i32 10 to i64
  %1327 = icmp slt i64 0, %1326
  %1328 = bitcast i64* %shadow to i32*
  %safe.456 = or i1 %1325, %1327
  %select.ptr.457 = select i1 %safe.456, i32* %1324, i32* %1328
  %1329 = load i32, i32* %select.ptr.457, align 16
  %1330 = add nsw i32 %1329, %1323
  %1331 = load i1, i1* %out.
  %1332 = sext i32 10 to i64
  %1333 = icmp slt i64 0, %1332
  %1334 = bitcast i64* %shadow to i32*
  %safe.458 = or i1 %1331, %1333
  %select.ptr.459 = select i1 %safe.458, i32* %1324, i32* %1334
  %1335 = load i32, i32* %1324
  %select.val.460 = select i1 %1331, i32 %1330, i32 %1335
  store i32 %select.val.460, i32* %select.ptr.459, align 16
  %1336 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %1337 = load i1, i1* %out.
  %1338 = sext i32 10 to i64
  %1339 = icmp slt i64 0, %1338
  %1340 = bitcast i64* %shadow to i32*
  %safe.461 = or i1 %1337, %1339
  %select.ptr.462 = select i1 %safe.461, i32* %1336, i32* %1340
  %1341 = load i32, i32* %select.ptr.462, align 4
  %1342 = ashr i32 %1341, 26
  %1343 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %1344 = load i1, i1* %out.
  %1345 = sext i32 10 to i64
  %1346 = icmp slt i64 0, %1345
  %1347 = bitcast i64* %shadow to i32*
  %safe.463 = or i1 %1344, %1346
  %select.ptr.464 = select i1 %safe.463, i32* %1343, i32* %1347
  %1348 = load i32, i32* %select.ptr.464, align 4
  %1349 = and i32 %1348, 67108863
  %1350 = load i1, i1* %out.
  %1351 = sext i32 10 to i64
  %1352 = icmp slt i64 0, %1351
  %1353 = bitcast i64* %shadow to i32*
  %safe.465 = or i1 %1350, %1352
  %select.ptr.466 = select i1 %safe.465, i32* %1343, i32* %1353
  %1354 = load i32, i32* %1343
  %select.val.467 = select i1 %1350, i32 %1349, i32 %1354
  store i32 %select.val.467, i32* %select.ptr.466, align 4
  %1355 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %1356 = load i1, i1* %out.
  %1357 = sext i32 10 to i64
  %1358 = icmp slt i64 1, %1357
  %1359 = bitcast i64* %shadow to i32*
  %safe.468 = or i1 %1356, %1358
  %select.ptr.469 = select i1 %safe.468, i32* %1355, i32* %1359
  %1360 = load i32, i32* %select.ptr.469, align 4
  %1361 = add nsw i32 %1360, %1342
  %1362 = load i1, i1* %out.
  %1363 = sext i32 10 to i64
  %1364 = icmp slt i64 1, %1363
  %1365 = bitcast i64* %shadow to i32*
  %safe.470 = or i1 %1362, %1364
  %select.ptr.471 = select i1 %safe.470, i32* %1355, i32* %1365
  %1366 = load i32, i32* %1355
  %select.val.472 = select i1 %1362, i32 %1361, i32 %1366
  store i32 %select.val.472, i32* %select.ptr.471, align 4
  %1367 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %1368 = load i1, i1* %out.
  %1369 = sext i32 10 to i64
  %1370 = icmp slt i64 1, %1369
  %1371 = bitcast i64* %shadow to i32*
  %safe.473 = or i1 %1368, %1370
  %select.ptr.474 = select i1 %safe.473, i32* %1367, i32* %1371
  %1372 = load i32, i32* %select.ptr.474, align 4
  %1373 = ashr i32 %1372, 25
  %1374 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %1375 = load i1, i1* %out.
  %1376 = sext i32 10 to i64
  %1377 = icmp slt i64 1, %1376
  %1378 = bitcast i64* %shadow to i32*
  %safe.475 = or i1 %1375, %1377
  %select.ptr.476 = select i1 %safe.475, i32* %1374, i32* %1378
  %1379 = load i32, i32* %select.ptr.476, align 4
  %1380 = and i32 %1379, 33554431
  %1381 = load i1, i1* %out.
  %1382 = sext i32 10 to i64
  %1383 = icmp slt i64 1, %1382
  %1384 = bitcast i64* %shadow to i32*
  %safe.477 = or i1 %1381, %1383
  %select.ptr.478 = select i1 %safe.477, i32* %1374, i32* %1384
  %1385 = load i32, i32* %1374
  %select.val.479 = select i1 %1381, i32 %1380, i32 %1385
  store i32 %select.val.479, i32* %select.ptr.478, align 4
  %1386 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %1387 = load i1, i1* %out.
  %1388 = sext i32 10 to i64
  %1389 = icmp slt i64 2, %1388
  %1390 = bitcast i64* %shadow to i32*
  %safe.480 = or i1 %1387, %1389
  %select.ptr.481 = select i1 %safe.480, i32* %1386, i32* %1390
  %1391 = load i32, i32* %select.ptr.481, align 4
  %1392 = add nsw i32 %1391, %1373
  %1393 = load i1, i1* %out.
  %1394 = sext i32 10 to i64
  %1395 = icmp slt i64 2, %1394
  %1396 = bitcast i64* %shadow to i32*
  %safe.482 = or i1 %1393, %1395
  %select.ptr.483 = select i1 %safe.482, i32* %1386, i32* %1396
  %1397 = load i32, i32* %1386
  %select.val.484 = select i1 %1393, i32 %1392, i32 %1397
  store i32 %select.val.484, i32* %select.ptr.483, align 4
  %1398 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %1399 = load i1, i1* %out.
  %1400 = sext i32 10 to i64
  %1401 = icmp slt i64 2, %1400
  %1402 = bitcast i64* %shadow to i32*
  %safe.485 = or i1 %1399, %1401
  %select.ptr.486 = select i1 %safe.485, i32* %1398, i32* %1402
  %1403 = load i32, i32* %select.ptr.486, align 4
  %1404 = ashr i32 %1403, 26
  %1405 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %1406 = load i1, i1* %out.
  %1407 = sext i32 10 to i64
  %1408 = icmp slt i64 2, %1407
  %1409 = bitcast i64* %shadow to i32*
  %safe.487 = or i1 %1406, %1408
  %select.ptr.488 = select i1 %safe.487, i32* %1405, i32* %1409
  %1410 = load i32, i32* %select.ptr.488, align 4
  %1411 = and i32 %1410, 67108863
  %1412 = load i1, i1* %out.
  %1413 = sext i32 10 to i64
  %1414 = icmp slt i64 2, %1413
  %1415 = bitcast i64* %shadow to i32*
  %safe.489 = or i1 %1412, %1414
  %select.ptr.490 = select i1 %safe.489, i32* %1405, i32* %1415
  %1416 = load i32, i32* %1405
  %select.val.491 = select i1 %1412, i32 %1411, i32 %1416
  store i32 %select.val.491, i32* %select.ptr.490, align 4
  %1417 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %1418 = load i1, i1* %out.
  %1419 = sext i32 10 to i64
  %1420 = icmp slt i64 3, %1419
  %1421 = bitcast i64* %shadow to i32*
  %safe.492 = or i1 %1418, %1420
  %select.ptr.493 = select i1 %safe.492, i32* %1417, i32* %1421
  %1422 = load i32, i32* %select.ptr.493, align 4
  %1423 = add nsw i32 %1422, %1404
  %1424 = load i1, i1* %out.
  %1425 = sext i32 10 to i64
  %1426 = icmp slt i64 3, %1425
  %1427 = bitcast i64* %shadow to i32*
  %safe.494 = or i1 %1424, %1426
  %select.ptr.495 = select i1 %safe.494, i32* %1417, i32* %1427
  %1428 = load i32, i32* %1417
  %select.val.496 = select i1 %1424, i32 %1423, i32 %1428
  store i32 %select.val.496, i32* %select.ptr.495, align 4
  %1429 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %1430 = load i1, i1* %out.
  %1431 = sext i32 10 to i64
  %1432 = icmp slt i64 3, %1431
  %1433 = bitcast i64* %shadow to i32*
  %safe.497 = or i1 %1430, %1432
  %select.ptr.498 = select i1 %safe.497, i32* %1429, i32* %1433
  %1434 = load i32, i32* %select.ptr.498, align 4
  %1435 = ashr i32 %1434, 25
  %1436 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %1437 = load i1, i1* %out.
  %1438 = sext i32 10 to i64
  %1439 = icmp slt i64 3, %1438
  %1440 = bitcast i64* %shadow to i32*
  %safe.499 = or i1 %1437, %1439
  %select.ptr.500 = select i1 %safe.499, i32* %1436, i32* %1440
  %1441 = load i32, i32* %select.ptr.500, align 4
  %1442 = and i32 %1441, 33554431
  %1443 = load i1, i1* %out.
  %1444 = sext i32 10 to i64
  %1445 = icmp slt i64 3, %1444
  %1446 = bitcast i64* %shadow to i32*
  %safe.501 = or i1 %1443, %1445
  %select.ptr.502 = select i1 %safe.501, i32* %1436, i32* %1446
  %1447 = load i32, i32* %1436
  %select.val.503 = select i1 %1443, i32 %1442, i32 %1447
  store i32 %select.val.503, i32* %select.ptr.502, align 4
  %1448 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %1449 = load i1, i1* %out.
  %1450 = sext i32 10 to i64
  %1451 = icmp slt i64 4, %1450
  %1452 = bitcast i64* %shadow to i32*
  %safe.504 = or i1 %1449, %1451
  %select.ptr.505 = select i1 %safe.504, i32* %1448, i32* %1452
  %1453 = load i32, i32* %select.ptr.505, align 4
  %1454 = add nsw i32 %1453, %1435
  %1455 = load i1, i1* %out.
  %1456 = sext i32 10 to i64
  %1457 = icmp slt i64 4, %1456
  %1458 = bitcast i64* %shadow to i32*
  %safe.506 = or i1 %1455, %1457
  %select.ptr.507 = select i1 %safe.506, i32* %1448, i32* %1458
  %1459 = load i32, i32* %1448
  %select.val.508 = select i1 %1455, i32 %1454, i32 %1459
  store i32 %select.val.508, i32* %select.ptr.507, align 4
  %1460 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %1461 = load i1, i1* %out.
  %1462 = sext i32 10 to i64
  %1463 = icmp slt i64 4, %1462
  %1464 = bitcast i64* %shadow to i32*
  %safe.509 = or i1 %1461, %1463
  %select.ptr.510 = select i1 %safe.509, i32* %1460, i32* %1464
  %1465 = load i32, i32* %select.ptr.510, align 4
  %1466 = ashr i32 %1465, 26
  %1467 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %1468 = load i1, i1* %out.
  %1469 = sext i32 10 to i64
  %1470 = icmp slt i64 4, %1469
  %1471 = bitcast i64* %shadow to i32*
  %safe.511 = or i1 %1468, %1470
  %select.ptr.512 = select i1 %safe.511, i32* %1467, i32* %1471
  %1472 = load i32, i32* %select.ptr.512, align 4
  %1473 = and i32 %1472, 67108863
  %1474 = load i1, i1* %out.
  %1475 = sext i32 10 to i64
  %1476 = icmp slt i64 4, %1475
  %1477 = bitcast i64* %shadow to i32*
  %safe.513 = or i1 %1474, %1476
  %select.ptr.514 = select i1 %safe.513, i32* %1467, i32* %1477
  %1478 = load i32, i32* %1467
  %select.val.515 = select i1 %1474, i32 %1473, i32 %1478
  store i32 %select.val.515, i32* %select.ptr.514, align 4
  %1479 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %1480 = load i1, i1* %out.
  %1481 = sext i32 10 to i64
  %1482 = icmp slt i64 5, %1481
  %1483 = bitcast i64* %shadow to i32*
  %safe.516 = or i1 %1480, %1482
  %select.ptr.517 = select i1 %safe.516, i32* %1479, i32* %1483
  %1484 = load i32, i32* %select.ptr.517, align 4
  %1485 = add nsw i32 %1484, %1466
  %1486 = load i1, i1* %out.
  %1487 = sext i32 10 to i64
  %1488 = icmp slt i64 5, %1487
  %1489 = bitcast i64* %shadow to i32*
  %safe.518 = or i1 %1486, %1488
  %select.ptr.519 = select i1 %safe.518, i32* %1479, i32* %1489
  %1490 = load i32, i32* %1479
  %select.val.520 = select i1 %1486, i32 %1485, i32 %1490
  store i32 %select.val.520, i32* %select.ptr.519, align 4
  %1491 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %1492 = load i1, i1* %out.
  %1493 = sext i32 10 to i64
  %1494 = icmp slt i64 5, %1493
  %1495 = bitcast i64* %shadow to i32*
  %safe.521 = or i1 %1492, %1494
  %select.ptr.522 = select i1 %safe.521, i32* %1491, i32* %1495
  %1496 = load i32, i32* %select.ptr.522, align 4
  %1497 = ashr i32 %1496, 25
  %1498 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %1499 = load i1, i1* %out.
  %1500 = sext i32 10 to i64
  %1501 = icmp slt i64 5, %1500
  %1502 = bitcast i64* %shadow to i32*
  %safe.523 = or i1 %1499, %1501
  %select.ptr.524 = select i1 %safe.523, i32* %1498, i32* %1502
  %1503 = load i32, i32* %select.ptr.524, align 4
  %1504 = and i32 %1503, 33554431
  %1505 = load i1, i1* %out.
  %1506 = sext i32 10 to i64
  %1507 = icmp slt i64 5, %1506
  %1508 = bitcast i64* %shadow to i32*
  %safe.525 = or i1 %1505, %1507
  %select.ptr.526 = select i1 %safe.525, i32* %1498, i32* %1508
  %1509 = load i32, i32* %1498
  %select.val.527 = select i1 %1505, i32 %1504, i32 %1509
  store i32 %select.val.527, i32* %select.ptr.526, align 4
  %1510 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %1511 = load i1, i1* %out.
  %1512 = sext i32 10 to i64
  %1513 = icmp slt i64 6, %1512
  %1514 = bitcast i64* %shadow to i32*
  %safe.528 = or i1 %1511, %1513
  %select.ptr.529 = select i1 %safe.528, i32* %1510, i32* %1514
  %1515 = load i32, i32* %select.ptr.529, align 4
  %1516 = add nsw i32 %1515, %1497
  %1517 = load i1, i1* %out.
  %1518 = sext i32 10 to i64
  %1519 = icmp slt i64 6, %1518
  %1520 = bitcast i64* %shadow to i32*
  %safe.530 = or i1 %1517, %1519
  %select.ptr.531 = select i1 %safe.530, i32* %1510, i32* %1520
  %1521 = load i32, i32* %1510
  %select.val.532 = select i1 %1517, i32 %1516, i32 %1521
  store i32 %select.val.532, i32* %select.ptr.531, align 4
  %1522 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %1523 = load i1, i1* %out.
  %1524 = sext i32 10 to i64
  %1525 = icmp slt i64 6, %1524
  %1526 = bitcast i64* %shadow to i32*
  %safe.533 = or i1 %1523, %1525
  %select.ptr.534 = select i1 %safe.533, i32* %1522, i32* %1526
  %1527 = load i32, i32* %select.ptr.534, align 4
  %1528 = ashr i32 %1527, 26
  %1529 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %1530 = load i1, i1* %out.
  %1531 = sext i32 10 to i64
  %1532 = icmp slt i64 6, %1531
  %1533 = bitcast i64* %shadow to i32*
  %safe.535 = or i1 %1530, %1532
  %select.ptr.536 = select i1 %safe.535, i32* %1529, i32* %1533
  %1534 = load i32, i32* %select.ptr.536, align 4
  %1535 = and i32 %1534, 67108863
  %1536 = load i1, i1* %out.
  %1537 = sext i32 10 to i64
  %1538 = icmp slt i64 6, %1537
  %1539 = bitcast i64* %shadow to i32*
  %safe.537 = or i1 %1536, %1538
  %select.ptr.538 = select i1 %safe.537, i32* %1529, i32* %1539
  %1540 = load i32, i32* %1529
  %select.val.539 = select i1 %1536, i32 %1535, i32 %1540
  store i32 %select.val.539, i32* %select.ptr.538, align 4
  %1541 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %1542 = load i1, i1* %out.
  %1543 = sext i32 10 to i64
  %1544 = icmp slt i64 7, %1543
  %1545 = bitcast i64* %shadow to i32*
  %safe.540 = or i1 %1542, %1544
  %select.ptr.541 = select i1 %safe.540, i32* %1541, i32* %1545
  %1546 = load i32, i32* %select.ptr.541, align 4
  %1547 = add nsw i32 %1546, %1528
  %1548 = load i1, i1* %out.
  %1549 = sext i32 10 to i64
  %1550 = icmp slt i64 7, %1549
  %1551 = bitcast i64* %shadow to i32*
  %safe.542 = or i1 %1548, %1550
  %select.ptr.543 = select i1 %safe.542, i32* %1541, i32* %1551
  %1552 = load i32, i32* %1541
  %select.val.544 = select i1 %1548, i32 %1547, i32 %1552
  store i32 %select.val.544, i32* %select.ptr.543, align 4
  %1553 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %1554 = load i1, i1* %out.
  %1555 = sext i32 10 to i64
  %1556 = icmp slt i64 7, %1555
  %1557 = bitcast i64* %shadow to i32*
  %safe.545 = or i1 %1554, %1556
  %select.ptr.546 = select i1 %safe.545, i32* %1553, i32* %1557
  %1558 = load i32, i32* %select.ptr.546, align 4
  %1559 = ashr i32 %1558, 25
  %1560 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %1561 = load i1, i1* %out.
  %1562 = sext i32 10 to i64
  %1563 = icmp slt i64 7, %1562
  %1564 = bitcast i64* %shadow to i32*
  %safe.547 = or i1 %1561, %1563
  %select.ptr.548 = select i1 %safe.547, i32* %1560, i32* %1564
  %1565 = load i32, i32* %select.ptr.548, align 4
  %1566 = and i32 %1565, 33554431
  %1567 = load i1, i1* %out.
  %1568 = sext i32 10 to i64
  %1569 = icmp slt i64 7, %1568
  %1570 = bitcast i64* %shadow to i32*
  %safe.549 = or i1 %1567, %1569
  %select.ptr.550 = select i1 %safe.549, i32* %1560, i32* %1570
  %1571 = load i32, i32* %1560
  %select.val.551 = select i1 %1567, i32 %1566, i32 %1571
  store i32 %select.val.551, i32* %select.ptr.550, align 4
  %1572 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %1573 = load i1, i1* %out.
  %1574 = sext i32 10 to i64
  %1575 = icmp slt i64 8, %1574
  %1576 = bitcast i64* %shadow to i32*
  %safe.552 = or i1 %1573, %1575
  %select.ptr.553 = select i1 %safe.552, i32* %1572, i32* %1576
  %1577 = load i32, i32* %select.ptr.553, align 4
  %1578 = add nsw i32 %1577, %1559
  %1579 = load i1, i1* %out.
  %1580 = sext i32 10 to i64
  %1581 = icmp slt i64 8, %1580
  %1582 = bitcast i64* %shadow to i32*
  %safe.554 = or i1 %1579, %1581
  %select.ptr.555 = select i1 %safe.554, i32* %1572, i32* %1582
  %1583 = load i32, i32* %1572
  %select.val.556 = select i1 %1579, i32 %1578, i32 %1583
  store i32 %select.val.556, i32* %select.ptr.555, align 4
  %1584 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %1585 = load i1, i1* %out.
  %1586 = sext i32 10 to i64
  %1587 = icmp slt i64 8, %1586
  %1588 = bitcast i64* %shadow to i32*
  %safe.557 = or i1 %1585, %1587
  %select.ptr.558 = select i1 %safe.557, i32* %1584, i32* %1588
  %1589 = load i32, i32* %select.ptr.558, align 4
  %1590 = ashr i32 %1589, 26
  %1591 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %1592 = load i1, i1* %out.
  %1593 = sext i32 10 to i64
  %1594 = icmp slt i64 8, %1593
  %1595 = bitcast i64* %shadow to i32*
  %safe.559 = or i1 %1592, %1594
  %select.ptr.560 = select i1 %safe.559, i32* %1591, i32* %1595
  %1596 = load i32, i32* %select.ptr.560, align 4
  %1597 = and i32 %1596, 67108863
  %1598 = load i1, i1* %out.
  %1599 = sext i32 10 to i64
  %1600 = icmp slt i64 8, %1599
  %1601 = bitcast i64* %shadow to i32*
  %safe.561 = or i1 %1598, %1600
  %select.ptr.562 = select i1 %safe.561, i32* %1591, i32* %1601
  %1602 = load i32, i32* %1591
  %select.val.563 = select i1 %1598, i32 %1597, i32 %1602
  store i32 %select.val.563, i32* %select.ptr.562, align 4
  %1603 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %1604 = load i1, i1* %out.
  %1605 = sext i32 10 to i64
  %1606 = icmp slt i64 9, %1605
  %1607 = bitcast i64* %shadow to i32*
  %safe.564 = or i1 %1604, %1606
  %select.ptr.565 = select i1 %safe.564, i32* %1603, i32* %1607
  %1608 = load i32, i32* %select.ptr.565, align 4
  %1609 = add nsw i32 %1608, %1590
  %1610 = load i1, i1* %out.
  %1611 = sext i32 10 to i64
  %1612 = icmp slt i64 9, %1611
  %1613 = bitcast i64* %shadow to i32*
  %safe.566 = or i1 %1610, %1612
  %select.ptr.567 = select i1 %safe.566, i32* %1603, i32* %1613
  %1614 = load i32, i32* %1603
  %select.val.568 = select i1 %1610, i32 %1609, i32 %1614
  store i32 %select.val.568, i32* %select.ptr.567, align 4
  %1615 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %1616 = load i1, i1* %out.
  %1617 = sext i32 10 to i64
  %1618 = icmp slt i64 9, %1617
  %1619 = bitcast i64* %shadow to i32*
  %safe.569 = or i1 %1616, %1618
  %select.ptr.570 = select i1 %safe.569, i32* %1615, i32* %1619
  %1620 = load i32, i32* %select.ptr.570, align 4
  %1621 = ashr i32 %1620, 25
  %1622 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %1623 = load i1, i1* %out.
  %1624 = sext i32 10 to i64
  %1625 = icmp slt i64 9, %1624
  %1626 = bitcast i64* %shadow to i32*
  %safe.571 = or i1 %1623, %1625
  %select.ptr.572 = select i1 %safe.571, i32* %1622, i32* %1626
  %1627 = load i32, i32* %select.ptr.572, align 4
  %1628 = and i32 %1627, 33554431
  %1629 = load i1, i1* %out.
  %1630 = sext i32 10 to i64
  %1631 = icmp slt i64 9, %1630
  %1632 = bitcast i64* %shadow to i32*
  %safe.573 = or i1 %1629, %1631
  %select.ptr.574 = select i1 %safe.573, i32* %1622, i32* %1632
  %1633 = load i32, i32* %1622
  %select.val.575 = select i1 %1629, i32 %1628, i32 %1633
  store i32 %select.val.575, i32* %select.ptr.574, align 4
  %1634 = mul nsw i32 19, %1621
  %1635 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %1636 = load i1, i1* %out.
  %1637 = sext i32 10 to i64
  %1638 = icmp slt i64 0, %1637
  %1639 = bitcast i64* %shadow to i32*
  %safe.576 = or i1 %1636, %1638
  %select.ptr.577 = select i1 %safe.576, i32* %1635, i32* %1639
  %1640 = load i32, i32* %select.ptr.577, align 16
  %1641 = add nsw i32 %1640, %1634
  %1642 = load i1, i1* %out.
  %1643 = sext i32 10 to i64
  %1644 = icmp slt i64 0, %1643
  %1645 = bitcast i64* %shadow to i32*
  %safe.578 = or i1 %1642, %1644
  %select.ptr.579 = select i1 %safe.578, i32* %1635, i32* %1645
  %1646 = load i32, i32* %1635
  %select.val.580 = select i1 %1642, i32 %1641, i32 %1646
  store i32 %select.val.580, i32* %select.ptr.579, align 16
  %1647 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %1648 = load i1, i1* %out.
  %1649 = sext i32 10 to i64
  %1650 = icmp slt i64 0, %1649
  %1651 = bitcast i64* %shadow to i32*
  %safe.581 = or i1 %1648, %1650
  %select.ptr.582 = select i1 %safe.581, i32* %1647, i32* %1651
  %1652 = load i32, i32* %select.ptr.582, align 16
  %1653 = call i32 @s32_gte(i32 %1652, i32 67108845, i1 %.cond)
  %1654 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %1655 = load i1, i1* %out.
  %1656 = sext i32 10 to i64
  %1657 = icmp slt i64 1, %1656
  %1658 = bitcast i64* %shadow to i32*
  %safe.583 = or i1 %1655, %1657
  %select.ptr.584 = select i1 %safe.583, i32* %1654, i32* %1658
  %1659 = load i32, i32* %select.ptr.584, align 4
  %1660 = call i32 @s32_eq(i32 %1659, i32 33554431, i1 %.cond)
  %1661 = and i32 %1653, %1660
  %1662 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %1663 = load i1, i1* %out.
  %1664 = sext i32 10 to i64
  %1665 = icmp slt i64 2, %1664
  %1666 = bitcast i64* %shadow to i32*
  %safe.585 = or i1 %1663, %1665
  %select.ptr.586 = select i1 %safe.585, i32* %1662, i32* %1666
  %1667 = load i32, i32* %select.ptr.586, align 4
  %1668 = call i32 @s32_eq(i32 %1667, i32 67108863, i1 %.cond)
  %1669 = and i32 %1661, %1668
  %1670 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %1671 = load i1, i1* %out.
  %1672 = sext i32 10 to i64
  %1673 = icmp slt i64 3, %1672
  %1674 = bitcast i64* %shadow to i32*
  %safe.587 = or i1 %1671, %1673
  %select.ptr.588 = select i1 %safe.587, i32* %1670, i32* %1674
  %1675 = load i32, i32* %select.ptr.588, align 4
  %1676 = call i32 @s32_eq(i32 %1675, i32 33554431, i1 %.cond)
  %1677 = and i32 %1669, %1676
  %1678 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %1679 = load i1, i1* %out.
  %1680 = sext i32 10 to i64
  %1681 = icmp slt i64 4, %1680
  %1682 = bitcast i64* %shadow to i32*
  %safe.589 = or i1 %1679, %1681
  %select.ptr.590 = select i1 %safe.589, i32* %1678, i32* %1682
  %1683 = load i32, i32* %select.ptr.590, align 4
  %1684 = call i32 @s32_eq(i32 %1683, i32 67108863, i1 %.cond)
  %1685 = and i32 %1677, %1684
  %1686 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %1687 = load i1, i1* %out.
  %1688 = sext i32 10 to i64
  %1689 = icmp slt i64 5, %1688
  %1690 = bitcast i64* %shadow to i32*
  %safe.591 = or i1 %1687, %1689
  %select.ptr.592 = select i1 %safe.591, i32* %1686, i32* %1690
  %1691 = load i32, i32* %select.ptr.592, align 4
  %1692 = call i32 @s32_eq(i32 %1691, i32 33554431, i1 %.cond)
  %1693 = and i32 %1685, %1692
  %1694 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %1695 = load i1, i1* %out.
  %1696 = sext i32 10 to i64
  %1697 = icmp slt i64 6, %1696
  %1698 = bitcast i64* %shadow to i32*
  %safe.593 = or i1 %1695, %1697
  %select.ptr.594 = select i1 %safe.593, i32* %1694, i32* %1698
  %1699 = load i32, i32* %select.ptr.594, align 4
  %1700 = call i32 @s32_eq(i32 %1699, i32 67108863, i1 %.cond)
  %1701 = and i32 %1693, %1700
  %1702 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %1703 = load i1, i1* %out.
  %1704 = sext i32 10 to i64
  %1705 = icmp slt i64 7, %1704
  %1706 = bitcast i64* %shadow to i32*
  %safe.595 = or i1 %1703, %1705
  %select.ptr.596 = select i1 %safe.595, i32* %1702, i32* %1706
  %1707 = load i32, i32* %select.ptr.596, align 4
  %1708 = call i32 @s32_eq(i32 %1707, i32 33554431, i1 %.cond)
  %1709 = and i32 %1701, %1708
  %1710 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %1711 = load i1, i1* %out.
  %1712 = sext i32 10 to i64
  %1713 = icmp slt i64 8, %1712
  %1714 = bitcast i64* %shadow to i32*
  %safe.597 = or i1 %1711, %1713
  %select.ptr.598 = select i1 %safe.597, i32* %1710, i32* %1714
  %1715 = load i32, i32* %select.ptr.598, align 4
  %1716 = call i32 @s32_eq(i32 %1715, i32 67108863, i1 %.cond)
  %1717 = and i32 %1709, %1716
  %1718 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %1719 = load i1, i1* %out.
  %1720 = sext i32 10 to i64
  %1721 = icmp slt i64 9, %1720
  %1722 = bitcast i64* %shadow to i32*
  %safe.599 = or i1 %1719, %1721
  %select.ptr.600 = select i1 %safe.599, i32* %1718, i32* %1722
  %1723 = load i32, i32* %select.ptr.600, align 4
  %1724 = call i32 @s32_eq(i32 %1723, i32 33554431, i1 %.cond)
  %1725 = and i32 %1717, %1724
  %1726 = and i32 %1725, 67108845
  %1727 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %1728 = load i1, i1* %out.
  %1729 = sext i32 10 to i64
  %1730 = icmp slt i64 0, %1729
  %1731 = bitcast i64* %shadow to i32*
  %safe.601 = or i1 %1728, %1730
  %select.ptr.602 = select i1 %safe.601, i32* %1727, i32* %1731
  %1732 = load i32, i32* %select.ptr.602, align 16
  %1733 = sub nsw i32 %1732, %1726
  %1734 = load i1, i1* %out.
  %1735 = sext i32 10 to i64
  %1736 = icmp slt i64 0, %1735
  %1737 = bitcast i64* %shadow to i32*
  %safe.603 = or i1 %1734, %1736
  %select.ptr.604 = select i1 %safe.603, i32* %1727, i32* %1737
  %1738 = load i32, i32* %1727
  %select.val.605 = select i1 %1734, i32 %1733, i32 %1738
  store i32 %select.val.605, i32* %select.ptr.604, align 16
  %1739 = and i32 %1725, 33554431
  %1740 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %1741 = load i1, i1* %out.
  %1742 = sext i32 10 to i64
  %1743 = icmp slt i64 1, %1742
  %1744 = bitcast i64* %shadow to i32*
  %safe.606 = or i1 %1741, %1743
  %select.ptr.607 = select i1 %safe.606, i32* %1740, i32* %1744
  %1745 = load i32, i32* %select.ptr.607, align 4
  %1746 = sub nsw i32 %1745, %1739
  %1747 = load i1, i1* %out.
  %1748 = sext i32 10 to i64
  %1749 = icmp slt i64 1, %1748
  %1750 = bitcast i64* %shadow to i32*
  %safe.608 = or i1 %1747, %1749
  %select.ptr.609 = select i1 %safe.608, i32* %1740, i32* %1750
  %1751 = load i32, i32* %1740
  %select.val.610 = select i1 %1747, i32 %1746, i32 %1751
  store i32 %select.val.610, i32* %select.ptr.609, align 4
  %1752 = and i32 %1725, 67108863
  %1753 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %1754 = load i1, i1* %out.
  %1755 = sext i32 10 to i64
  %1756 = icmp slt i64 2, %1755
  %1757 = bitcast i64* %shadow to i32*
  %safe.611 = or i1 %1754, %1756
  %select.ptr.612 = select i1 %safe.611, i32* %1753, i32* %1757
  %1758 = load i32, i32* %select.ptr.612, align 4
  %1759 = sub nsw i32 %1758, %1752
  %1760 = load i1, i1* %out.
  %1761 = sext i32 10 to i64
  %1762 = icmp slt i64 2, %1761
  %1763 = bitcast i64* %shadow to i32*
  %safe.613 = or i1 %1760, %1762
  %select.ptr.614 = select i1 %safe.613, i32* %1753, i32* %1763
  %1764 = load i32, i32* %1753
  %select.val.615 = select i1 %1760, i32 %1759, i32 %1764
  store i32 %select.val.615, i32* %select.ptr.614, align 4
  %1765 = and i32 %1725, 33554431
  %1766 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %1767 = load i1, i1* %out.
  %1768 = sext i32 10 to i64
  %1769 = icmp slt i64 3, %1768
  %1770 = bitcast i64* %shadow to i32*
  %safe.616 = or i1 %1767, %1769
  %select.ptr.617 = select i1 %safe.616, i32* %1766, i32* %1770
  %1771 = load i32, i32* %select.ptr.617, align 4
  %1772 = sub nsw i32 %1771, %1765
  %1773 = load i1, i1* %out.
  %1774 = sext i32 10 to i64
  %1775 = icmp slt i64 3, %1774
  %1776 = bitcast i64* %shadow to i32*
  %safe.618 = or i1 %1773, %1775
  %select.ptr.619 = select i1 %safe.618, i32* %1766, i32* %1776
  %1777 = load i32, i32* %1766
  %select.val.620 = select i1 %1773, i32 %1772, i32 %1777
  store i32 %select.val.620, i32* %select.ptr.619, align 4
  %1778 = and i32 %1725, 67108863
  %1779 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %1780 = load i1, i1* %out.
  %1781 = sext i32 10 to i64
  %1782 = icmp slt i64 4, %1781
  %1783 = bitcast i64* %shadow to i32*
  %safe.621 = or i1 %1780, %1782
  %select.ptr.622 = select i1 %safe.621, i32* %1779, i32* %1783
  %1784 = load i32, i32* %select.ptr.622, align 4
  %1785 = sub nsw i32 %1784, %1778
  %1786 = load i1, i1* %out.
  %1787 = sext i32 10 to i64
  %1788 = icmp slt i64 4, %1787
  %1789 = bitcast i64* %shadow to i32*
  %safe.623 = or i1 %1786, %1788
  %select.ptr.624 = select i1 %safe.623, i32* %1779, i32* %1789
  %1790 = load i32, i32* %1779
  %select.val.625 = select i1 %1786, i32 %1785, i32 %1790
  store i32 %select.val.625, i32* %select.ptr.624, align 4
  %1791 = and i32 %1725, 33554431
  %1792 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %1793 = load i1, i1* %out.
  %1794 = sext i32 10 to i64
  %1795 = icmp slt i64 5, %1794
  %1796 = bitcast i64* %shadow to i32*
  %safe.626 = or i1 %1793, %1795
  %select.ptr.627 = select i1 %safe.626, i32* %1792, i32* %1796
  %1797 = load i32, i32* %select.ptr.627, align 4
  %1798 = sub nsw i32 %1797, %1791
  %1799 = load i1, i1* %out.
  %1800 = sext i32 10 to i64
  %1801 = icmp slt i64 5, %1800
  %1802 = bitcast i64* %shadow to i32*
  %safe.628 = or i1 %1799, %1801
  %select.ptr.629 = select i1 %safe.628, i32* %1792, i32* %1802
  %1803 = load i32, i32* %1792
  %select.val.630 = select i1 %1799, i32 %1798, i32 %1803
  store i32 %select.val.630, i32* %select.ptr.629, align 4
  %1804 = and i32 %1725, 67108863
  %1805 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %1806 = load i1, i1* %out.
  %1807 = sext i32 10 to i64
  %1808 = icmp slt i64 6, %1807
  %1809 = bitcast i64* %shadow to i32*
  %safe.631 = or i1 %1806, %1808
  %select.ptr.632 = select i1 %safe.631, i32* %1805, i32* %1809
  %1810 = load i32, i32* %select.ptr.632, align 4
  %1811 = sub nsw i32 %1810, %1804
  %1812 = load i1, i1* %out.
  %1813 = sext i32 10 to i64
  %1814 = icmp slt i64 6, %1813
  %1815 = bitcast i64* %shadow to i32*
  %safe.633 = or i1 %1812, %1814
  %select.ptr.634 = select i1 %safe.633, i32* %1805, i32* %1815
  %1816 = load i32, i32* %1805
  %select.val.635 = select i1 %1812, i32 %1811, i32 %1816
  store i32 %select.val.635, i32* %select.ptr.634, align 4
  %1817 = and i32 %1725, 33554431
  %1818 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %1819 = load i1, i1* %out.
  %1820 = sext i32 10 to i64
  %1821 = icmp slt i64 7, %1820
  %1822 = bitcast i64* %shadow to i32*
  %safe.636 = or i1 %1819, %1821
  %select.ptr.637 = select i1 %safe.636, i32* %1818, i32* %1822
  %1823 = load i32, i32* %select.ptr.637, align 4
  %1824 = sub nsw i32 %1823, %1817
  %1825 = load i1, i1* %out.
  %1826 = sext i32 10 to i64
  %1827 = icmp slt i64 7, %1826
  %1828 = bitcast i64* %shadow to i32*
  %safe.638 = or i1 %1825, %1827
  %select.ptr.639 = select i1 %safe.638, i32* %1818, i32* %1828
  %1829 = load i32, i32* %1818
  %select.val.640 = select i1 %1825, i32 %1824, i32 %1829
  store i32 %select.val.640, i32* %select.ptr.639, align 4
  %1830 = and i32 %1725, 67108863
  %1831 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %1832 = load i1, i1* %out.
  %1833 = sext i32 10 to i64
  %1834 = icmp slt i64 8, %1833
  %1835 = bitcast i64* %shadow to i32*
  %safe.641 = or i1 %1832, %1834
  %select.ptr.642 = select i1 %safe.641, i32* %1831, i32* %1835
  %1836 = load i32, i32* %select.ptr.642, align 4
  %1837 = sub nsw i32 %1836, %1830
  %1838 = load i1, i1* %out.
  %1839 = sext i32 10 to i64
  %1840 = icmp slt i64 8, %1839
  %1841 = bitcast i64* %shadow to i32*
  %safe.643 = or i1 %1838, %1840
  %select.ptr.644 = select i1 %safe.643, i32* %1831, i32* %1841
  %1842 = load i32, i32* %1831
  %select.val.645 = select i1 %1838, i32 %1837, i32 %1842
  store i32 %select.val.645, i32* %select.ptr.644, align 4
  %1843 = and i32 %1725, 33554431
  %1844 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %1845 = load i1, i1* %out.
  %1846 = sext i32 10 to i64
  %1847 = icmp slt i64 9, %1846
  %1848 = bitcast i64* %shadow to i32*
  %safe.646 = or i1 %1845, %1847
  %select.ptr.647 = select i1 %safe.646, i32* %1844, i32* %1848
  %1849 = load i32, i32* %select.ptr.647, align 4
  %1850 = sub nsw i32 %1849, %1843
  %1851 = load i1, i1* %out.
  %1852 = sext i32 10 to i64
  %1853 = icmp slt i64 9, %1852
  %1854 = bitcast i64* %shadow to i32*
  %safe.648 = or i1 %1851, %1853
  %select.ptr.649 = select i1 %safe.648, i32* %1844, i32* %1854
  %1855 = load i32, i32* %1844
  %select.val.650 = select i1 %1851, i32 %1850, i32 %1855
  store i32 %select.val.650, i32* %select.ptr.649, align 4
  %1856 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %1857 = load i1, i1* %out.
  %1858 = sext i32 10 to i64
  %1859 = icmp slt i64 1, %1858
  %1860 = bitcast i64* %shadow to i32*
  %safe.651 = or i1 %1857, %1859
  %select.ptr.652 = select i1 %safe.651, i32* %1856, i32* %1860
  %1861 = load i32, i32* %select.ptr.652, align 4
  %1862 = shl i32 %1861, 2
  %1863 = load i1, i1* %out.
  %1864 = sext i32 10 to i64
  %1865 = icmp slt i64 1, %1864
  %1866 = bitcast i64* %shadow to i32*
  %safe.653 = or i1 %1863, %1865
  %select.ptr.654 = select i1 %safe.653, i32* %1856, i32* %1866
  %1867 = load i32, i32* %1856
  %select.val.655 = select i1 %1863, i32 %1862, i32 %1867
  store i32 %select.val.655, i32* %select.ptr.654, align 4
  %1868 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %1869 = load i1, i1* %out.
  %1870 = sext i32 10 to i64
  %1871 = icmp slt i64 2, %1870
  %1872 = bitcast i64* %shadow to i32*
  %safe.656 = or i1 %1869, %1871
  %select.ptr.657 = select i1 %safe.656, i32* %1868, i32* %1872
  %1873 = load i32, i32* %select.ptr.657, align 8
  %1874 = shl i32 %1873, 3
  %1875 = load i1, i1* %out.
  %1876 = sext i32 10 to i64
  %1877 = icmp slt i64 2, %1876
  %1878 = bitcast i64* %shadow to i32*
  %safe.658 = or i1 %1875, %1877
  %select.ptr.659 = select i1 %safe.658, i32* %1868, i32* %1878
  %1879 = load i32, i32* %1868
  %select.val.660 = select i1 %1875, i32 %1874, i32 %1879
  store i32 %select.val.660, i32* %select.ptr.659, align 8
  %1880 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %1881 = load i1, i1* %out.
  %1882 = sext i32 10 to i64
  %1883 = icmp slt i64 3, %1882
  %1884 = bitcast i64* %shadow to i32*
  %safe.661 = or i1 %1881, %1883
  %select.ptr.662 = select i1 %safe.661, i32* %1880, i32* %1884
  %1885 = load i32, i32* %select.ptr.662, align 4
  %1886 = shl i32 %1885, 5
  %1887 = load i1, i1* %out.
  %1888 = sext i32 10 to i64
  %1889 = icmp slt i64 3, %1888
  %1890 = bitcast i64* %shadow to i32*
  %safe.663 = or i1 %1887, %1889
  %select.ptr.664 = select i1 %safe.663, i32* %1880, i32* %1890
  %1891 = load i32, i32* %1880
  %select.val.665 = select i1 %1887, i32 %1886, i32 %1891
  store i32 %select.val.665, i32* %select.ptr.664, align 4
  %1892 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %1893 = load i1, i1* %out.
  %1894 = sext i32 10 to i64
  %1895 = icmp slt i64 4, %1894
  %1896 = bitcast i64* %shadow to i32*
  %safe.666 = or i1 %1893, %1895
  %select.ptr.667 = select i1 %safe.666, i32* %1892, i32* %1896
  %1897 = load i32, i32* %select.ptr.667, align 16
  %1898 = shl i32 %1897, 6
  %1899 = load i1, i1* %out.
  %1900 = sext i32 10 to i64
  %1901 = icmp slt i64 4, %1900
  %1902 = bitcast i64* %shadow to i32*
  %safe.668 = or i1 %1899, %1901
  %select.ptr.669 = select i1 %safe.668, i32* %1892, i32* %1902
  %1903 = load i32, i32* %1892
  %select.val.670 = select i1 %1899, i32 %1898, i32 %1903
  store i32 %select.val.670, i32* %select.ptr.669, align 16
  %1904 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %1905 = load i1, i1* %out.
  %1906 = sext i32 10 to i64
  %1907 = icmp slt i64 6, %1906
  %1908 = bitcast i64* %shadow to i32*
  %safe.671 = or i1 %1905, %1907
  %select.ptr.672 = select i1 %safe.671, i32* %1904, i32* %1908
  %1909 = load i32, i32* %select.ptr.672, align 8
  %1910 = shl i32 %1909, 1
  %1911 = load i1, i1* %out.
  %1912 = sext i32 10 to i64
  %1913 = icmp slt i64 6, %1912
  %1914 = bitcast i64* %shadow to i32*
  %safe.673 = or i1 %1911, %1913
  %select.ptr.674 = select i1 %safe.673, i32* %1904, i32* %1914
  %1915 = load i32, i32* %1904
  %select.val.675 = select i1 %1911, i32 %1910, i32 %1915
  store i32 %select.val.675, i32* %select.ptr.674, align 8
  %1916 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %1917 = load i1, i1* %out.
  %1918 = sext i32 10 to i64
  %1919 = icmp slt i64 7, %1918
  %1920 = bitcast i64* %shadow to i32*
  %safe.676 = or i1 %1917, %1919
  %select.ptr.677 = select i1 %safe.676, i32* %1916, i32* %1920
  %1921 = load i32, i32* %select.ptr.677, align 4
  %1922 = shl i32 %1921, 3
  %1923 = load i1, i1* %out.
  %1924 = sext i32 10 to i64
  %1925 = icmp slt i64 7, %1924
  %1926 = bitcast i64* %shadow to i32*
  %safe.678 = or i1 %1923, %1925
  %select.ptr.679 = select i1 %safe.678, i32* %1916, i32* %1926
  %1927 = load i32, i32* %1916
  %select.val.680 = select i1 %1923, i32 %1922, i32 %1927
  store i32 %select.val.680, i32* %select.ptr.679, align 4
  %1928 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %1929 = load i1, i1* %out.
  %1930 = sext i32 10 to i64
  %1931 = icmp slt i64 8, %1930
  %1932 = bitcast i64* %shadow to i32*
  %safe.681 = or i1 %1929, %1931
  %select.ptr.682 = select i1 %safe.681, i32* %1928, i32* %1932
  %1933 = load i32, i32* %select.ptr.682, align 16
  %1934 = shl i32 %1933, 4
  %1935 = load i1, i1* %out.
  %1936 = sext i32 10 to i64
  %1937 = icmp slt i64 8, %1936
  %1938 = bitcast i64* %shadow to i32*
  %safe.683 = or i1 %1935, %1937
  %select.ptr.684 = select i1 %safe.683, i32* %1928, i32* %1938
  %1939 = load i32, i32* %1928
  %select.val.685 = select i1 %1935, i32 %1934, i32 %1939
  store i32 %select.val.685, i32* %select.ptr.684, align 16
  %1940 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %1941 = load i1, i1* %out.
  %1942 = sext i32 10 to i64
  %1943 = icmp slt i64 9, %1942
  %1944 = bitcast i64* %shadow to i32*
  %safe.686 = or i1 %1941, %1943
  %select.ptr.687 = select i1 %safe.686, i32* %1940, i32* %1944
  %1945 = load i32, i32* %select.ptr.687, align 4
  %1946 = shl i32 %1945, 6
  %1947 = load i1, i1* %out.
  %1948 = sext i32 10 to i64
  %1949 = icmp slt i64 9, %1948
  %1950 = bitcast i64* %shadow to i32*
  %safe.688 = or i1 %1947, %1949
  %select.ptr.689 = select i1 %safe.688, i32* %1940, i32* %1950
  %1951 = load i32, i32* %1940
  %select.val.690 = select i1 %1947, i32 %1946, i32 %1951
  store i32 %select.val.690, i32* %select.ptr.689, align 4
  %1952 = load i1, i1* %out.
  %1953 = load i8, i8* %0
  %select.val.691 = select i1 %1952, i8 0, i8 %1953
  store i8 %select.val.691, i8* %0, align 1
  %1954 = getelementptr inbounds i8, i8* %0, i64 16
  %1955 = load i1, i1* %out.
  %1956 = icmp slt i64 16, %len.
  %1957 = bitcast i64* %shadow to i8*
  %safe.692 = or i1 %1955, %1956
  %select.ptr.693 = select i1 %safe.692, i8* %1954, i8* %1957
  %1958 = load i8, i8* %1954
  %select.val.694 = select i1 %1955, i8 0, i8 %1958
  store i8 %select.val.694, i8* %select.ptr.693, align 1
  %1959 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %1960 = load i1, i1* %out.
  %1961 = sext i32 10 to i64
  %1962 = icmp slt i64 0, %1961
  %1963 = bitcast i64* %shadow to i32*
  %safe.695 = or i1 %1960, %1962
  %select.ptr.696 = select i1 %safe.695, i32* %1959, i32* %1963
  %1964 = load i32, i32* %select.ptr.696, align 16
  %1965 = and i32 %1964, 255
  %1966 = load i1, i1* %out.
  %1967 = load i8, i8* %0, align 1
  %1968 = zext i8 %1967 to i32
  %1969 = or i32 %1968, %1965
  %1970 = trunc i32 %1969 to i8
  %1971 = load i1, i1* %out.
  %1972 = load i8, i8* %0
  %select.val.697 = select i1 %1971, i8 %1970, i8 %1972
  store i8 %select.val.697, i8* %0, align 1
  %1973 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %1974 = load i1, i1* %out.
  %1975 = sext i32 10 to i64
  %1976 = icmp slt i64 0, %1975
  %1977 = bitcast i64* %shadow to i32*
  %safe.698 = or i1 %1974, %1976
  %select.ptr.699 = select i1 %safe.698, i32* %1973, i32* %1977
  %1978 = load i32, i32* %select.ptr.699, align 16
  %1979 = ashr i32 %1978, 8
  %1980 = and i32 %1979, 255
  %1981 = trunc i32 %1980 to i8
  %1982 = getelementptr inbounds i8, i8* %0, i64 1
  %1983 = load i1, i1* %out.
  %1984 = icmp slt i64 1, %len.
  %1985 = bitcast i64* %shadow to i8*
  %safe.700 = or i1 %1983, %1984
  %select.ptr.701 = select i1 %safe.700, i8* %1982, i8* %1985
  %1986 = load i8, i8* %1982
  %select.val.702 = select i1 %1983, i8 %1981, i8 %1986
  store i8 %select.val.702, i8* %select.ptr.701, align 1
  %1987 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %1988 = load i1, i1* %out.
  %1989 = sext i32 10 to i64
  %1990 = icmp slt i64 0, %1989
  %1991 = bitcast i64* %shadow to i32*
  %safe.703 = or i1 %1988, %1990
  %select.ptr.704 = select i1 %safe.703, i32* %1987, i32* %1991
  %1992 = load i32, i32* %select.ptr.704, align 16
  %1993 = ashr i32 %1992, 16
  %1994 = and i32 %1993, 255
  %1995 = trunc i32 %1994 to i8
  %1996 = getelementptr inbounds i8, i8* %0, i64 2
  %1997 = load i1, i1* %out.
  %1998 = icmp slt i64 2, %len.
  %1999 = bitcast i64* %shadow to i8*
  %safe.705 = or i1 %1997, %1998
  %select.ptr.706 = select i1 %safe.705, i8* %1996, i8* %1999
  %2000 = load i8, i8* %1996
  %select.val.707 = select i1 %1997, i8 %1995, i8 %2000
  store i8 %select.val.707, i8* %select.ptr.706, align 1
  %2001 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 0
  %2002 = load i1, i1* %out.
  %2003 = sext i32 10 to i64
  %2004 = icmp slt i64 0, %2003
  %2005 = bitcast i64* %shadow to i32*
  %safe.708 = or i1 %2002, %2004
  %select.ptr.709 = select i1 %safe.708, i32* %2001, i32* %2005
  %2006 = load i32, i32* %select.ptr.709, align 16
  %2007 = ashr i32 %2006, 24
  %2008 = and i32 %2007, 255
  %2009 = trunc i32 %2008 to i8
  %2010 = getelementptr inbounds i8, i8* %0, i64 3
  %2011 = load i1, i1* %out.
  %2012 = icmp slt i64 3, %len.
  %2013 = bitcast i64* %shadow to i8*
  %safe.710 = or i1 %2011, %2012
  %select.ptr.711 = select i1 %safe.710, i8* %2010, i8* %2013
  %2014 = load i8, i8* %2010
  %select.val.712 = select i1 %2011, i8 %2009, i8 %2014
  store i8 %select.val.712, i8* %select.ptr.711, align 1
  %2015 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %2016 = load i1, i1* %out.
  %2017 = sext i32 10 to i64
  %2018 = icmp slt i64 1, %2017
  %2019 = bitcast i64* %shadow to i32*
  %safe.713 = or i1 %2016, %2018
  %select.ptr.714 = select i1 %safe.713, i32* %2015, i32* %2019
  %2020 = load i32, i32* %select.ptr.714, align 4
  %2021 = and i32 %2020, 255
  %2022 = getelementptr inbounds i8, i8* %0, i64 3
  %2023 = load i1, i1* %out.
  %2024 = icmp slt i64 3, %len.
  %2025 = bitcast i64* %shadow to i8*
  %safe.715 = or i1 %2023, %2024
  %select.ptr.716 = select i1 %safe.715, i8* %2022, i8* %2025
  %2026 = load i8, i8* %select.ptr.716, align 1
  %2027 = zext i8 %2026 to i32
  %2028 = or i32 %2027, %2021
  %2029 = trunc i32 %2028 to i8
  %2030 = load i1, i1* %out.
  %2031 = icmp slt i64 3, %len.
  %2032 = bitcast i64* %shadow to i8*
  %safe.717 = or i1 %2030, %2031
  %select.ptr.718 = select i1 %safe.717, i8* %2022, i8* %2032
  %2033 = load i8, i8* %2022
  %select.val.719 = select i1 %2030, i8 %2029, i8 %2033
  store i8 %select.val.719, i8* %select.ptr.718, align 1
  %2034 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %2035 = load i1, i1* %out.
  %2036 = sext i32 10 to i64
  %2037 = icmp slt i64 1, %2036
  %2038 = bitcast i64* %shadow to i32*
  %safe.720 = or i1 %2035, %2037
  %select.ptr.721 = select i1 %safe.720, i32* %2034, i32* %2038
  %2039 = load i32, i32* %select.ptr.721, align 4
  %2040 = ashr i32 %2039, 8
  %2041 = and i32 %2040, 255
  %2042 = trunc i32 %2041 to i8
  %2043 = getelementptr inbounds i8, i8* %0, i64 4
  %2044 = load i1, i1* %out.
  %2045 = icmp slt i64 4, %len.
  %2046 = bitcast i64* %shadow to i8*
  %safe.722 = or i1 %2044, %2045
  %select.ptr.723 = select i1 %safe.722, i8* %2043, i8* %2046
  %2047 = load i8, i8* %2043
  %select.val.724 = select i1 %2044, i8 %2042, i8 %2047
  store i8 %select.val.724, i8* %select.ptr.723, align 1
  %2048 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %2049 = load i1, i1* %out.
  %2050 = sext i32 10 to i64
  %2051 = icmp slt i64 1, %2050
  %2052 = bitcast i64* %shadow to i32*
  %safe.725 = or i1 %2049, %2051
  %select.ptr.726 = select i1 %safe.725, i32* %2048, i32* %2052
  %2053 = load i32, i32* %select.ptr.726, align 4
  %2054 = ashr i32 %2053, 16
  %2055 = and i32 %2054, 255
  %2056 = trunc i32 %2055 to i8
  %2057 = getelementptr inbounds i8, i8* %0, i64 5
  %2058 = load i1, i1* %out.
  %2059 = icmp slt i64 5, %len.
  %2060 = bitcast i64* %shadow to i8*
  %safe.727 = or i1 %2058, %2059
  %select.ptr.728 = select i1 %safe.727, i8* %2057, i8* %2060
  %2061 = load i8, i8* %2057
  %select.val.729 = select i1 %2058, i8 %2056, i8 %2061
  store i8 %select.val.729, i8* %select.ptr.728, align 1
  %2062 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 1
  %2063 = load i1, i1* %out.
  %2064 = sext i32 10 to i64
  %2065 = icmp slt i64 1, %2064
  %2066 = bitcast i64* %shadow to i32*
  %safe.730 = or i1 %2063, %2065
  %select.ptr.731 = select i1 %safe.730, i32* %2062, i32* %2066
  %2067 = load i32, i32* %select.ptr.731, align 4
  %2068 = ashr i32 %2067, 24
  %2069 = and i32 %2068, 255
  %2070 = trunc i32 %2069 to i8
  %2071 = getelementptr inbounds i8, i8* %0, i64 6
  %2072 = load i1, i1* %out.
  %2073 = icmp slt i64 6, %len.
  %2074 = bitcast i64* %shadow to i8*
  %safe.732 = or i1 %2072, %2073
  %select.ptr.733 = select i1 %safe.732, i8* %2071, i8* %2074
  %2075 = load i8, i8* %2071
  %select.val.734 = select i1 %2072, i8 %2070, i8 %2075
  store i8 %select.val.734, i8* %select.ptr.733, align 1
  %2076 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %2077 = load i1, i1* %out.
  %2078 = sext i32 10 to i64
  %2079 = icmp slt i64 2, %2078
  %2080 = bitcast i64* %shadow to i32*
  %safe.735 = or i1 %2077, %2079
  %select.ptr.736 = select i1 %safe.735, i32* %2076, i32* %2080
  %2081 = load i32, i32* %select.ptr.736, align 8
  %2082 = and i32 %2081, 255
  %2083 = getelementptr inbounds i8, i8* %0, i64 6
  %2084 = load i1, i1* %out.
  %2085 = icmp slt i64 6, %len.
  %2086 = bitcast i64* %shadow to i8*
  %safe.737 = or i1 %2084, %2085
  %select.ptr.738 = select i1 %safe.737, i8* %2083, i8* %2086
  %2087 = load i8, i8* %select.ptr.738, align 1
  %2088 = zext i8 %2087 to i32
  %2089 = or i32 %2088, %2082
  %2090 = trunc i32 %2089 to i8
  %2091 = load i1, i1* %out.
  %2092 = icmp slt i64 6, %len.
  %2093 = bitcast i64* %shadow to i8*
  %safe.739 = or i1 %2091, %2092
  %select.ptr.740 = select i1 %safe.739, i8* %2083, i8* %2093
  %2094 = load i8, i8* %2083
  %select.val.741 = select i1 %2091, i8 %2090, i8 %2094
  store i8 %select.val.741, i8* %select.ptr.740, align 1
  %2095 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %2096 = load i1, i1* %out.
  %2097 = sext i32 10 to i64
  %2098 = icmp slt i64 2, %2097
  %2099 = bitcast i64* %shadow to i32*
  %safe.742 = or i1 %2096, %2098
  %select.ptr.743 = select i1 %safe.742, i32* %2095, i32* %2099
  %2100 = load i32, i32* %select.ptr.743, align 8
  %2101 = ashr i32 %2100, 8
  %2102 = and i32 %2101, 255
  %2103 = trunc i32 %2102 to i8
  %2104 = getelementptr inbounds i8, i8* %0, i64 7
  %2105 = load i1, i1* %out.
  %2106 = icmp slt i64 7, %len.
  %2107 = bitcast i64* %shadow to i8*
  %safe.744 = or i1 %2105, %2106
  %select.ptr.745 = select i1 %safe.744, i8* %2104, i8* %2107
  %2108 = load i8, i8* %2104
  %select.val.746 = select i1 %2105, i8 %2103, i8 %2108
  store i8 %select.val.746, i8* %select.ptr.745, align 1
  %2109 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %2110 = load i1, i1* %out.
  %2111 = sext i32 10 to i64
  %2112 = icmp slt i64 2, %2111
  %2113 = bitcast i64* %shadow to i32*
  %safe.747 = or i1 %2110, %2112
  %select.ptr.748 = select i1 %safe.747, i32* %2109, i32* %2113
  %2114 = load i32, i32* %select.ptr.748, align 8
  %2115 = ashr i32 %2114, 16
  %2116 = and i32 %2115, 255
  %2117 = trunc i32 %2116 to i8
  %2118 = getelementptr inbounds i8, i8* %0, i64 8
  %2119 = load i1, i1* %out.
  %2120 = icmp slt i64 8, %len.
  %2121 = bitcast i64* %shadow to i8*
  %safe.749 = or i1 %2119, %2120
  %select.ptr.750 = select i1 %safe.749, i8* %2118, i8* %2121
  %2122 = load i8, i8* %2118
  %select.val.751 = select i1 %2119, i8 %2117, i8 %2122
  store i8 %select.val.751, i8* %select.ptr.750, align 1
  %2123 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 2
  %2124 = load i1, i1* %out.
  %2125 = sext i32 10 to i64
  %2126 = icmp slt i64 2, %2125
  %2127 = bitcast i64* %shadow to i32*
  %safe.752 = or i1 %2124, %2126
  %select.ptr.753 = select i1 %safe.752, i32* %2123, i32* %2127
  %2128 = load i32, i32* %select.ptr.753, align 8
  %2129 = ashr i32 %2128, 24
  %2130 = and i32 %2129, 255
  %2131 = trunc i32 %2130 to i8
  %2132 = getelementptr inbounds i8, i8* %0, i64 9
  %2133 = load i1, i1* %out.
  %2134 = icmp slt i64 9, %len.
  %2135 = bitcast i64* %shadow to i8*
  %safe.754 = or i1 %2133, %2134
  %select.ptr.755 = select i1 %safe.754, i8* %2132, i8* %2135
  %2136 = load i8, i8* %2132
  %select.val.756 = select i1 %2133, i8 %2131, i8 %2136
  store i8 %select.val.756, i8* %select.ptr.755, align 1
  %2137 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %2138 = load i1, i1* %out.
  %2139 = sext i32 10 to i64
  %2140 = icmp slt i64 3, %2139
  %2141 = bitcast i64* %shadow to i32*
  %safe.757 = or i1 %2138, %2140
  %select.ptr.758 = select i1 %safe.757, i32* %2137, i32* %2141
  %2142 = load i32, i32* %select.ptr.758, align 4
  %2143 = and i32 %2142, 255
  %2144 = getelementptr inbounds i8, i8* %0, i64 9
  %2145 = load i1, i1* %out.
  %2146 = icmp slt i64 9, %len.
  %2147 = bitcast i64* %shadow to i8*
  %safe.759 = or i1 %2145, %2146
  %select.ptr.760 = select i1 %safe.759, i8* %2144, i8* %2147
  %2148 = load i8, i8* %select.ptr.760, align 1
  %2149 = zext i8 %2148 to i32
  %2150 = or i32 %2149, %2143
  %2151 = trunc i32 %2150 to i8
  %2152 = load i1, i1* %out.
  %2153 = icmp slt i64 9, %len.
  %2154 = bitcast i64* %shadow to i8*
  %safe.761 = or i1 %2152, %2153
  %select.ptr.762 = select i1 %safe.761, i8* %2144, i8* %2154
  %2155 = load i8, i8* %2144
  %select.val.763 = select i1 %2152, i8 %2151, i8 %2155
  store i8 %select.val.763, i8* %select.ptr.762, align 1
  %2156 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %2157 = load i1, i1* %out.
  %2158 = sext i32 10 to i64
  %2159 = icmp slt i64 3, %2158
  %2160 = bitcast i64* %shadow to i32*
  %safe.764 = or i1 %2157, %2159
  %select.ptr.765 = select i1 %safe.764, i32* %2156, i32* %2160
  %2161 = load i32, i32* %select.ptr.765, align 4
  %2162 = ashr i32 %2161, 8
  %2163 = and i32 %2162, 255
  %2164 = trunc i32 %2163 to i8
  %2165 = getelementptr inbounds i8, i8* %0, i64 10
  %2166 = load i1, i1* %out.
  %2167 = icmp slt i64 10, %len.
  %2168 = bitcast i64* %shadow to i8*
  %safe.766 = or i1 %2166, %2167
  %select.ptr.767 = select i1 %safe.766, i8* %2165, i8* %2168
  %2169 = load i8, i8* %2165
  %select.val.768 = select i1 %2166, i8 %2164, i8 %2169
  store i8 %select.val.768, i8* %select.ptr.767, align 1
  %2170 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %2171 = load i1, i1* %out.
  %2172 = sext i32 10 to i64
  %2173 = icmp slt i64 3, %2172
  %2174 = bitcast i64* %shadow to i32*
  %safe.769 = or i1 %2171, %2173
  %select.ptr.770 = select i1 %safe.769, i32* %2170, i32* %2174
  %2175 = load i32, i32* %select.ptr.770, align 4
  %2176 = ashr i32 %2175, 16
  %2177 = and i32 %2176, 255
  %2178 = trunc i32 %2177 to i8
  %2179 = getelementptr inbounds i8, i8* %0, i64 11
  %2180 = load i1, i1* %out.
  %2181 = icmp slt i64 11, %len.
  %2182 = bitcast i64* %shadow to i8*
  %safe.771 = or i1 %2180, %2181
  %select.ptr.772 = select i1 %safe.771, i8* %2179, i8* %2182
  %2183 = load i8, i8* %2179
  %select.val.773 = select i1 %2180, i8 %2178, i8 %2183
  store i8 %select.val.773, i8* %select.ptr.772, align 1
  %2184 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 3
  %2185 = load i1, i1* %out.
  %2186 = sext i32 10 to i64
  %2187 = icmp slt i64 3, %2186
  %2188 = bitcast i64* %shadow to i32*
  %safe.774 = or i1 %2185, %2187
  %select.ptr.775 = select i1 %safe.774, i32* %2184, i32* %2188
  %2189 = load i32, i32* %select.ptr.775, align 4
  %2190 = ashr i32 %2189, 24
  %2191 = and i32 %2190, 255
  %2192 = trunc i32 %2191 to i8
  %2193 = getelementptr inbounds i8, i8* %0, i64 12
  %2194 = load i1, i1* %out.
  %2195 = icmp slt i64 12, %len.
  %2196 = bitcast i64* %shadow to i8*
  %safe.776 = or i1 %2194, %2195
  %select.ptr.777 = select i1 %safe.776, i8* %2193, i8* %2196
  %2197 = load i8, i8* %2193
  %select.val.778 = select i1 %2194, i8 %2192, i8 %2197
  store i8 %select.val.778, i8* %select.ptr.777, align 1
  %2198 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %2199 = load i1, i1* %out.
  %2200 = sext i32 10 to i64
  %2201 = icmp slt i64 4, %2200
  %2202 = bitcast i64* %shadow to i32*
  %safe.779 = or i1 %2199, %2201
  %select.ptr.780 = select i1 %safe.779, i32* %2198, i32* %2202
  %2203 = load i32, i32* %select.ptr.780, align 16
  %2204 = and i32 %2203, 255
  %2205 = getelementptr inbounds i8, i8* %0, i64 12
  %2206 = load i1, i1* %out.
  %2207 = icmp slt i64 12, %len.
  %2208 = bitcast i64* %shadow to i8*
  %safe.781 = or i1 %2206, %2207
  %select.ptr.782 = select i1 %safe.781, i8* %2205, i8* %2208
  %2209 = load i8, i8* %select.ptr.782, align 1
  %2210 = zext i8 %2209 to i32
  %2211 = or i32 %2210, %2204
  %2212 = trunc i32 %2211 to i8
  %2213 = load i1, i1* %out.
  %2214 = icmp slt i64 12, %len.
  %2215 = bitcast i64* %shadow to i8*
  %safe.783 = or i1 %2213, %2214
  %select.ptr.784 = select i1 %safe.783, i8* %2205, i8* %2215
  %2216 = load i8, i8* %2205
  %select.val.785 = select i1 %2213, i8 %2212, i8 %2216
  store i8 %select.val.785, i8* %select.ptr.784, align 1
  %2217 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %2218 = load i1, i1* %out.
  %2219 = sext i32 10 to i64
  %2220 = icmp slt i64 4, %2219
  %2221 = bitcast i64* %shadow to i32*
  %safe.786 = or i1 %2218, %2220
  %select.ptr.787 = select i1 %safe.786, i32* %2217, i32* %2221
  %2222 = load i32, i32* %select.ptr.787, align 16
  %2223 = ashr i32 %2222, 8
  %2224 = and i32 %2223, 255
  %2225 = trunc i32 %2224 to i8
  %2226 = getelementptr inbounds i8, i8* %0, i64 13
  %2227 = load i1, i1* %out.
  %2228 = icmp slt i64 13, %len.
  %2229 = bitcast i64* %shadow to i8*
  %safe.788 = or i1 %2227, %2228
  %select.ptr.789 = select i1 %safe.788, i8* %2226, i8* %2229
  %2230 = load i8, i8* %2226
  %select.val.790 = select i1 %2227, i8 %2225, i8 %2230
  store i8 %select.val.790, i8* %select.ptr.789, align 1
  %2231 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %2232 = load i1, i1* %out.
  %2233 = sext i32 10 to i64
  %2234 = icmp slt i64 4, %2233
  %2235 = bitcast i64* %shadow to i32*
  %safe.791 = or i1 %2232, %2234
  %select.ptr.792 = select i1 %safe.791, i32* %2231, i32* %2235
  %2236 = load i32, i32* %select.ptr.792, align 16
  %2237 = ashr i32 %2236, 16
  %2238 = and i32 %2237, 255
  %2239 = trunc i32 %2238 to i8
  %2240 = getelementptr inbounds i8, i8* %0, i64 14
  %2241 = load i1, i1* %out.
  %2242 = icmp slt i64 14, %len.
  %2243 = bitcast i64* %shadow to i8*
  %safe.793 = or i1 %2241, %2242
  %select.ptr.794 = select i1 %safe.793, i8* %2240, i8* %2243
  %2244 = load i8, i8* %2240
  %select.val.795 = select i1 %2241, i8 %2239, i8 %2244
  store i8 %select.val.795, i8* %select.ptr.794, align 1
  %2245 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 4
  %2246 = load i1, i1* %out.
  %2247 = sext i32 10 to i64
  %2248 = icmp slt i64 4, %2247
  %2249 = bitcast i64* %shadow to i32*
  %safe.796 = or i1 %2246, %2248
  %select.ptr.797 = select i1 %safe.796, i32* %2245, i32* %2249
  %2250 = load i32, i32* %select.ptr.797, align 16
  %2251 = ashr i32 %2250, 24
  %2252 = and i32 %2251, 255
  %2253 = trunc i32 %2252 to i8
  %2254 = getelementptr inbounds i8, i8* %0, i64 15
  %2255 = load i1, i1* %out.
  %2256 = icmp slt i64 15, %len.
  %2257 = bitcast i64* %shadow to i8*
  %safe.798 = or i1 %2255, %2256
  %select.ptr.799 = select i1 %safe.798, i8* %2254, i8* %2257
  %2258 = load i8, i8* %2254
  %select.val.800 = select i1 %2255, i8 %2253, i8 %2258
  store i8 %select.val.800, i8* %select.ptr.799, align 1
  %2259 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %2260 = load i1, i1* %out.
  %2261 = sext i32 10 to i64
  %2262 = icmp slt i64 5, %2261
  %2263 = bitcast i64* %shadow to i32*
  %safe.801 = or i1 %2260, %2262
  %select.ptr.802 = select i1 %safe.801, i32* %2259, i32* %2263
  %2264 = load i32, i32* %select.ptr.802, align 4
  %2265 = and i32 %2264, 255
  %2266 = getelementptr inbounds i8, i8* %0, i64 16
  %2267 = load i1, i1* %out.
  %2268 = icmp slt i64 16, %len.
  %2269 = bitcast i64* %shadow to i8*
  %safe.803 = or i1 %2267, %2268
  %select.ptr.804 = select i1 %safe.803, i8* %2266, i8* %2269
  %2270 = load i8, i8* %select.ptr.804, align 1
  %2271 = zext i8 %2270 to i32
  %2272 = or i32 %2271, %2265
  %2273 = trunc i32 %2272 to i8
  %2274 = load i1, i1* %out.
  %2275 = icmp slt i64 16, %len.
  %2276 = bitcast i64* %shadow to i8*
  %safe.805 = or i1 %2274, %2275
  %select.ptr.806 = select i1 %safe.805, i8* %2266, i8* %2276
  %2277 = load i8, i8* %2266
  %select.val.807 = select i1 %2274, i8 %2273, i8 %2277
  store i8 %select.val.807, i8* %select.ptr.806, align 1
  %2278 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %2279 = load i1, i1* %out.
  %2280 = sext i32 10 to i64
  %2281 = icmp slt i64 5, %2280
  %2282 = bitcast i64* %shadow to i32*
  %safe.808 = or i1 %2279, %2281
  %select.ptr.809 = select i1 %safe.808, i32* %2278, i32* %2282
  %2283 = load i32, i32* %select.ptr.809, align 4
  %2284 = ashr i32 %2283, 8
  %2285 = and i32 %2284, 255
  %2286 = trunc i32 %2285 to i8
  %2287 = getelementptr inbounds i8, i8* %0, i64 17
  %2288 = load i1, i1* %out.
  %2289 = icmp slt i64 17, %len.
  %2290 = bitcast i64* %shadow to i8*
  %safe.810 = or i1 %2288, %2289
  %select.ptr.811 = select i1 %safe.810, i8* %2287, i8* %2290
  %2291 = load i8, i8* %2287
  %select.val.812 = select i1 %2288, i8 %2286, i8 %2291
  store i8 %select.val.812, i8* %select.ptr.811, align 1
  %2292 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %2293 = load i1, i1* %out.
  %2294 = sext i32 10 to i64
  %2295 = icmp slt i64 5, %2294
  %2296 = bitcast i64* %shadow to i32*
  %safe.813 = or i1 %2293, %2295
  %select.ptr.814 = select i1 %safe.813, i32* %2292, i32* %2296
  %2297 = load i32, i32* %select.ptr.814, align 4
  %2298 = ashr i32 %2297, 16
  %2299 = and i32 %2298, 255
  %2300 = trunc i32 %2299 to i8
  %2301 = getelementptr inbounds i8, i8* %0, i64 18
  %2302 = load i1, i1* %out.
  %2303 = icmp slt i64 18, %len.
  %2304 = bitcast i64* %shadow to i8*
  %safe.815 = or i1 %2302, %2303
  %select.ptr.816 = select i1 %safe.815, i8* %2301, i8* %2304
  %2305 = load i8, i8* %2301
  %select.val.817 = select i1 %2302, i8 %2300, i8 %2305
  store i8 %select.val.817, i8* %select.ptr.816, align 1
  %2306 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 5
  %2307 = load i1, i1* %out.
  %2308 = sext i32 10 to i64
  %2309 = icmp slt i64 5, %2308
  %2310 = bitcast i64* %shadow to i32*
  %safe.818 = or i1 %2307, %2309
  %select.ptr.819 = select i1 %safe.818, i32* %2306, i32* %2310
  %2311 = load i32, i32* %select.ptr.819, align 4
  %2312 = ashr i32 %2311, 24
  %2313 = and i32 %2312, 255
  %2314 = trunc i32 %2313 to i8
  %2315 = getelementptr inbounds i8, i8* %0, i64 19
  %2316 = load i1, i1* %out.
  %2317 = icmp slt i64 19, %len.
  %2318 = bitcast i64* %shadow to i8*
  %safe.820 = or i1 %2316, %2317
  %select.ptr.821 = select i1 %safe.820, i8* %2315, i8* %2318
  %2319 = load i8, i8* %2315
  %select.val.822 = select i1 %2316, i8 %2314, i8 %2319
  store i8 %select.val.822, i8* %select.ptr.821, align 1
  %2320 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %2321 = load i1, i1* %out.
  %2322 = sext i32 10 to i64
  %2323 = icmp slt i64 6, %2322
  %2324 = bitcast i64* %shadow to i32*
  %safe.823 = or i1 %2321, %2323
  %select.ptr.824 = select i1 %safe.823, i32* %2320, i32* %2324
  %2325 = load i32, i32* %select.ptr.824, align 8
  %2326 = and i32 %2325, 255
  %2327 = getelementptr inbounds i8, i8* %0, i64 19
  %2328 = load i1, i1* %out.
  %2329 = icmp slt i64 19, %len.
  %2330 = bitcast i64* %shadow to i8*
  %safe.825 = or i1 %2328, %2329
  %select.ptr.826 = select i1 %safe.825, i8* %2327, i8* %2330
  %2331 = load i8, i8* %select.ptr.826, align 1
  %2332 = zext i8 %2331 to i32
  %2333 = or i32 %2332, %2326
  %2334 = trunc i32 %2333 to i8
  %2335 = load i1, i1* %out.
  %2336 = icmp slt i64 19, %len.
  %2337 = bitcast i64* %shadow to i8*
  %safe.827 = or i1 %2335, %2336
  %select.ptr.828 = select i1 %safe.827, i8* %2327, i8* %2337
  %2338 = load i8, i8* %2327
  %select.val.829 = select i1 %2335, i8 %2334, i8 %2338
  store i8 %select.val.829, i8* %select.ptr.828, align 1
  %2339 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %2340 = load i1, i1* %out.
  %2341 = sext i32 10 to i64
  %2342 = icmp slt i64 6, %2341
  %2343 = bitcast i64* %shadow to i32*
  %safe.830 = or i1 %2340, %2342
  %select.ptr.831 = select i1 %safe.830, i32* %2339, i32* %2343
  %2344 = load i32, i32* %select.ptr.831, align 8
  %2345 = ashr i32 %2344, 8
  %2346 = and i32 %2345, 255
  %2347 = trunc i32 %2346 to i8
  %2348 = getelementptr inbounds i8, i8* %0, i64 20
  %2349 = load i1, i1* %out.
  %2350 = icmp slt i64 20, %len.
  %2351 = bitcast i64* %shadow to i8*
  %safe.832 = or i1 %2349, %2350
  %select.ptr.833 = select i1 %safe.832, i8* %2348, i8* %2351
  %2352 = load i8, i8* %2348
  %select.val.834 = select i1 %2349, i8 %2347, i8 %2352
  store i8 %select.val.834, i8* %select.ptr.833, align 1
  %2353 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %2354 = load i1, i1* %out.
  %2355 = sext i32 10 to i64
  %2356 = icmp slt i64 6, %2355
  %2357 = bitcast i64* %shadow to i32*
  %safe.835 = or i1 %2354, %2356
  %select.ptr.836 = select i1 %safe.835, i32* %2353, i32* %2357
  %2358 = load i32, i32* %select.ptr.836, align 8
  %2359 = ashr i32 %2358, 16
  %2360 = and i32 %2359, 255
  %2361 = trunc i32 %2360 to i8
  %2362 = getelementptr inbounds i8, i8* %0, i64 21
  %2363 = load i1, i1* %out.
  %2364 = icmp slt i64 21, %len.
  %2365 = bitcast i64* %shadow to i8*
  %safe.837 = or i1 %2363, %2364
  %select.ptr.838 = select i1 %safe.837, i8* %2362, i8* %2365
  %2366 = load i8, i8* %2362
  %select.val.839 = select i1 %2363, i8 %2361, i8 %2366
  store i8 %select.val.839, i8* %select.ptr.838, align 1
  %2367 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 6
  %2368 = load i1, i1* %out.
  %2369 = sext i32 10 to i64
  %2370 = icmp slt i64 6, %2369
  %2371 = bitcast i64* %shadow to i32*
  %safe.840 = or i1 %2368, %2370
  %select.ptr.841 = select i1 %safe.840, i32* %2367, i32* %2371
  %2372 = load i32, i32* %select.ptr.841, align 8
  %2373 = ashr i32 %2372, 24
  %2374 = and i32 %2373, 255
  %2375 = trunc i32 %2374 to i8
  %2376 = getelementptr inbounds i8, i8* %0, i64 22
  %2377 = load i1, i1* %out.
  %2378 = icmp slt i64 22, %len.
  %2379 = bitcast i64* %shadow to i8*
  %safe.842 = or i1 %2377, %2378
  %select.ptr.843 = select i1 %safe.842, i8* %2376, i8* %2379
  %2380 = load i8, i8* %2376
  %select.val.844 = select i1 %2377, i8 %2375, i8 %2380
  store i8 %select.val.844, i8* %select.ptr.843, align 1
  %2381 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %2382 = load i1, i1* %out.
  %2383 = sext i32 10 to i64
  %2384 = icmp slt i64 7, %2383
  %2385 = bitcast i64* %shadow to i32*
  %safe.845 = or i1 %2382, %2384
  %select.ptr.846 = select i1 %safe.845, i32* %2381, i32* %2385
  %2386 = load i32, i32* %select.ptr.846, align 4
  %2387 = and i32 %2386, 255
  %2388 = getelementptr inbounds i8, i8* %0, i64 22
  %2389 = load i1, i1* %out.
  %2390 = icmp slt i64 22, %len.
  %2391 = bitcast i64* %shadow to i8*
  %safe.847 = or i1 %2389, %2390
  %select.ptr.848 = select i1 %safe.847, i8* %2388, i8* %2391
  %2392 = load i8, i8* %select.ptr.848, align 1
  %2393 = zext i8 %2392 to i32
  %2394 = or i32 %2393, %2387
  %2395 = trunc i32 %2394 to i8
  %2396 = load i1, i1* %out.
  %2397 = icmp slt i64 22, %len.
  %2398 = bitcast i64* %shadow to i8*
  %safe.849 = or i1 %2396, %2397
  %select.ptr.850 = select i1 %safe.849, i8* %2388, i8* %2398
  %2399 = load i8, i8* %2388
  %select.val.851 = select i1 %2396, i8 %2395, i8 %2399
  store i8 %select.val.851, i8* %select.ptr.850, align 1
  %2400 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %2401 = load i1, i1* %out.
  %2402 = sext i32 10 to i64
  %2403 = icmp slt i64 7, %2402
  %2404 = bitcast i64* %shadow to i32*
  %safe.852 = or i1 %2401, %2403
  %select.ptr.853 = select i1 %safe.852, i32* %2400, i32* %2404
  %2405 = load i32, i32* %select.ptr.853, align 4
  %2406 = ashr i32 %2405, 8
  %2407 = and i32 %2406, 255
  %2408 = trunc i32 %2407 to i8
  %2409 = getelementptr inbounds i8, i8* %0, i64 23
  %2410 = load i1, i1* %out.
  %2411 = icmp slt i64 23, %len.
  %2412 = bitcast i64* %shadow to i8*
  %safe.854 = or i1 %2410, %2411
  %select.ptr.855 = select i1 %safe.854, i8* %2409, i8* %2412
  %2413 = load i8, i8* %2409
  %select.val.856 = select i1 %2410, i8 %2408, i8 %2413
  store i8 %select.val.856, i8* %select.ptr.855, align 1
  %2414 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %2415 = load i1, i1* %out.
  %2416 = sext i32 10 to i64
  %2417 = icmp slt i64 7, %2416
  %2418 = bitcast i64* %shadow to i32*
  %safe.857 = or i1 %2415, %2417
  %select.ptr.858 = select i1 %safe.857, i32* %2414, i32* %2418
  %2419 = load i32, i32* %select.ptr.858, align 4
  %2420 = ashr i32 %2419, 16
  %2421 = and i32 %2420, 255
  %2422 = trunc i32 %2421 to i8
  %2423 = getelementptr inbounds i8, i8* %0, i64 24
  %2424 = load i1, i1* %out.
  %2425 = icmp slt i64 24, %len.
  %2426 = bitcast i64* %shadow to i8*
  %safe.859 = or i1 %2424, %2425
  %select.ptr.860 = select i1 %safe.859, i8* %2423, i8* %2426
  %2427 = load i8, i8* %2423
  %select.val.861 = select i1 %2424, i8 %2422, i8 %2427
  store i8 %select.val.861, i8* %select.ptr.860, align 1
  %2428 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 7
  %2429 = load i1, i1* %out.
  %2430 = sext i32 10 to i64
  %2431 = icmp slt i64 7, %2430
  %2432 = bitcast i64* %shadow to i32*
  %safe.862 = or i1 %2429, %2431
  %select.ptr.863 = select i1 %safe.862, i32* %2428, i32* %2432
  %2433 = load i32, i32* %select.ptr.863, align 4
  %2434 = ashr i32 %2433, 24
  %2435 = and i32 %2434, 255
  %2436 = trunc i32 %2435 to i8
  %2437 = getelementptr inbounds i8, i8* %0, i64 25
  %2438 = load i1, i1* %out.
  %2439 = icmp slt i64 25, %len.
  %2440 = bitcast i64* %shadow to i8*
  %safe.864 = or i1 %2438, %2439
  %select.ptr.865 = select i1 %safe.864, i8* %2437, i8* %2440
  %2441 = load i8, i8* %2437
  %select.val.866 = select i1 %2438, i8 %2436, i8 %2441
  store i8 %select.val.866, i8* %select.ptr.865, align 1
  %2442 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %2443 = load i1, i1* %out.
  %2444 = sext i32 10 to i64
  %2445 = icmp slt i64 8, %2444
  %2446 = bitcast i64* %shadow to i32*
  %safe.867 = or i1 %2443, %2445
  %select.ptr.868 = select i1 %safe.867, i32* %2442, i32* %2446
  %2447 = load i32, i32* %select.ptr.868, align 16
  %2448 = and i32 %2447, 255
  %2449 = getelementptr inbounds i8, i8* %0, i64 25
  %2450 = load i1, i1* %out.
  %2451 = icmp slt i64 25, %len.
  %2452 = bitcast i64* %shadow to i8*
  %safe.869 = or i1 %2450, %2451
  %select.ptr.870 = select i1 %safe.869, i8* %2449, i8* %2452
  %2453 = load i8, i8* %select.ptr.870, align 1
  %2454 = zext i8 %2453 to i32
  %2455 = or i32 %2454, %2448
  %2456 = trunc i32 %2455 to i8
  %2457 = load i1, i1* %out.
  %2458 = icmp slt i64 25, %len.
  %2459 = bitcast i64* %shadow to i8*
  %safe.871 = or i1 %2457, %2458
  %select.ptr.872 = select i1 %safe.871, i8* %2449, i8* %2459
  %2460 = load i8, i8* %2449
  %select.val.873 = select i1 %2457, i8 %2456, i8 %2460
  store i8 %select.val.873, i8* %select.ptr.872, align 1
  %2461 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %2462 = load i1, i1* %out.
  %2463 = sext i32 10 to i64
  %2464 = icmp slt i64 8, %2463
  %2465 = bitcast i64* %shadow to i32*
  %safe.874 = or i1 %2462, %2464
  %select.ptr.875 = select i1 %safe.874, i32* %2461, i32* %2465
  %2466 = load i32, i32* %select.ptr.875, align 16
  %2467 = ashr i32 %2466, 8
  %2468 = and i32 %2467, 255
  %2469 = trunc i32 %2468 to i8
  %2470 = getelementptr inbounds i8, i8* %0, i64 26
  %2471 = load i1, i1* %out.
  %2472 = icmp slt i64 26, %len.
  %2473 = bitcast i64* %shadow to i8*
  %safe.876 = or i1 %2471, %2472
  %select.ptr.877 = select i1 %safe.876, i8* %2470, i8* %2473
  %2474 = load i8, i8* %2470
  %select.val.878 = select i1 %2471, i8 %2469, i8 %2474
  store i8 %select.val.878, i8* %select.ptr.877, align 1
  %2475 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %2476 = load i1, i1* %out.
  %2477 = sext i32 10 to i64
  %2478 = icmp slt i64 8, %2477
  %2479 = bitcast i64* %shadow to i32*
  %safe.879 = or i1 %2476, %2478
  %select.ptr.880 = select i1 %safe.879, i32* %2475, i32* %2479
  %2480 = load i32, i32* %select.ptr.880, align 16
  %2481 = ashr i32 %2480, 16
  %2482 = and i32 %2481, 255
  %2483 = trunc i32 %2482 to i8
  %2484 = getelementptr inbounds i8, i8* %0, i64 27
  %2485 = load i1, i1* %out.
  %2486 = icmp slt i64 27, %len.
  %2487 = bitcast i64* %shadow to i8*
  %safe.881 = or i1 %2485, %2486
  %select.ptr.882 = select i1 %safe.881, i8* %2484, i8* %2487
  %2488 = load i8, i8* %2484
  %select.val.883 = select i1 %2485, i8 %2483, i8 %2488
  store i8 %select.val.883, i8* %select.ptr.882, align 1
  %2489 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 8
  %2490 = load i1, i1* %out.
  %2491 = sext i32 10 to i64
  %2492 = icmp slt i64 8, %2491
  %2493 = bitcast i64* %shadow to i32*
  %safe.884 = or i1 %2490, %2492
  %select.ptr.885 = select i1 %safe.884, i32* %2489, i32* %2493
  %2494 = load i32, i32* %select.ptr.885, align 16
  %2495 = ashr i32 %2494, 24
  %2496 = and i32 %2495, 255
  %2497 = trunc i32 %2496 to i8
  %2498 = getelementptr inbounds i8, i8* %0, i64 28
  %2499 = load i1, i1* %out.
  %2500 = icmp slt i64 28, %len.
  %2501 = bitcast i64* %shadow to i8*
  %safe.886 = or i1 %2499, %2500
  %select.ptr.887 = select i1 %safe.886, i8* %2498, i8* %2501
  %2502 = load i8, i8* %2498
  %select.val.888 = select i1 %2499, i8 %2497, i8 %2502
  store i8 %select.val.888, i8* %select.ptr.887, align 1
  %2503 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %2504 = load i1, i1* %out.
  %2505 = sext i32 10 to i64
  %2506 = icmp slt i64 9, %2505
  %2507 = bitcast i64* %shadow to i32*
  %safe.889 = or i1 %2504, %2506
  %select.ptr.890 = select i1 %safe.889, i32* %2503, i32* %2507
  %2508 = load i32, i32* %select.ptr.890, align 4
  %2509 = and i32 %2508, 255
  %2510 = getelementptr inbounds i8, i8* %0, i64 28
  %2511 = load i1, i1* %out.
  %2512 = icmp slt i64 28, %len.
  %2513 = bitcast i64* %shadow to i8*
  %safe.891 = or i1 %2511, %2512
  %select.ptr.892 = select i1 %safe.891, i8* %2510, i8* %2513
  %2514 = load i8, i8* %select.ptr.892, align 1
  %2515 = zext i8 %2514 to i32
  %2516 = or i32 %2515, %2509
  %2517 = trunc i32 %2516 to i8
  %2518 = load i1, i1* %out.
  %2519 = icmp slt i64 28, %len.
  %2520 = bitcast i64* %shadow to i8*
  %safe.893 = or i1 %2518, %2519
  %select.ptr.894 = select i1 %safe.893, i8* %2510, i8* %2520
  %2521 = load i8, i8* %2510
  %select.val.895 = select i1 %2518, i8 %2517, i8 %2521
  store i8 %select.val.895, i8* %select.ptr.894, align 1
  %2522 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %2523 = load i1, i1* %out.
  %2524 = sext i32 10 to i64
  %2525 = icmp slt i64 9, %2524
  %2526 = bitcast i64* %shadow to i32*
  %safe.896 = or i1 %2523, %2525
  %select.ptr.897 = select i1 %safe.896, i32* %2522, i32* %2526
  %2527 = load i32, i32* %select.ptr.897, align 4
  %2528 = ashr i32 %2527, 8
  %2529 = and i32 %2528, 255
  %2530 = trunc i32 %2529 to i8
  %2531 = getelementptr inbounds i8, i8* %0, i64 29
  %2532 = load i1, i1* %out.
  %2533 = icmp slt i64 29, %len.
  %2534 = bitcast i64* %shadow to i8*
  %safe.898 = or i1 %2532, %2533
  %select.ptr.899 = select i1 %safe.898, i8* %2531, i8* %2534
  %2535 = load i8, i8* %2531
  %select.val.900 = select i1 %2532, i8 %2530, i8 %2535
  store i8 %select.val.900, i8* %select.ptr.899, align 1
  %2536 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %2537 = load i1, i1* %out.
  %2538 = sext i32 10 to i64
  %2539 = icmp slt i64 9, %2538
  %2540 = bitcast i64* %shadow to i32*
  %safe.901 = or i1 %2537, %2539
  %select.ptr.902 = select i1 %safe.901, i32* %2536, i32* %2540
  %2541 = load i32, i32* %select.ptr.902, align 4
  %2542 = ashr i32 %2541, 16
  %2543 = and i32 %2542, 255
  %2544 = trunc i32 %2543 to i8
  %2545 = getelementptr inbounds i8, i8* %0, i64 30
  %2546 = load i1, i1* %out.
  %2547 = icmp slt i64 30, %len.
  %2548 = bitcast i64* %shadow to i8*
  %safe.903 = or i1 %2546, %2547
  %select.ptr.904 = select i1 %safe.903, i8* %2545, i8* %2548
  %2549 = load i8, i8* %2545
  %select.val.905 = select i1 %2546, i8 %2544, i8 %2549
  store i8 %select.val.905, i8* %select.ptr.904, align 1
  %2550 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i64 0, i64 9
  %2551 = load i1, i1* %out.
  %2552 = sext i32 10 to i64
  %2553 = icmp slt i64 9, %2552
  %2554 = bitcast i64* %shadow to i32*
  %safe.906 = or i1 %2551, %2553
  %select.ptr.907 = select i1 %safe.906, i32* %2550, i32* %2554
  %2555 = load i32, i32* %select.ptr.907, align 4
  %2556 = ashr i32 %2555, 24
  %2557 = and i32 %2556, 255
  %2558 = trunc i32 %2557 to i8
  %2559 = getelementptr inbounds i8, i8* %0, i64 31
  %2560 = load i1, i1* %out.
  %2561 = icmp slt i64 31, %len.
  %2562 = bitcast i64* %shadow to i8*
  %safe.908 = or i1 %2560, %2561
  %select.ptr.909 = select i1 %safe.908, i8* %2559, i8* %2562
  %2563 = load i8, i8* %2559
  %select.val.910 = select i1 %2560, i8 %2558, i8 %2563
  store i8 %select.val.910, i8* %select.ptr.909, align 1
  ret void
}

define internal i32 @s32_gte(i32 %0, i32 %1, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %3 = sub nsw i32 %0, %1
  %4 = ashr i32 %3, 31
  %5 = xor i32 %4, -1
  ret i32 %5
}

define internal i32 @s32_eq(i32 %0, i32 %1, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
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

define internal void @fproduct(i64* %0, i64 %len., i64* %1, i64 %len.1, i64* %2, i64 %len.2, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %4 = getelementptr inbounds i64, i64* %1, i64 0
  %5 = load i1, i1* %out.
  %6 = icmp slt i64 0, %len.1
  %7 = bitcast i64* %shadow to i64*
  %safe. = or i1 %5, %6
  %select.ptr. = select i1 %safe., i64* %4, i64* %7
  %8 = load i64, i64* %select.ptr., align 8
  %9 = trunc i64 %8 to i32
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i64, i64* %2, i64 0
  %12 = load i1, i1* %out.
  %13 = icmp slt i64 0, %len.2
  %14 = bitcast i64* %shadow to i64*
  %safe.3 = or i1 %12, %13
  %select.ptr.4 = select i1 %safe.3, i64* %11, i64* %14
  %15 = load i64, i64* %select.ptr.4, align 8
  %16 = trunc i64 %15 to i32
  %17 = sext i32 %16 to i64
  %18 = mul nsw i64 %10, %17
  %19 = getelementptr inbounds i64, i64* %0, i64 0
  %20 = load i1, i1* %out.
  %21 = icmp slt i64 0, %len.
  %22 = bitcast i64* %shadow to i64*
  %safe.5 = or i1 %20, %21
  %select.ptr.6 = select i1 %safe.5, i64* %19, i64* %22
  %23 = load i64, i64* %19
  %select.val. = select i1 %20, i64 %18, i64 %23
  store i64 %select.val., i64* %select.ptr.6, align 8
  %24 = getelementptr inbounds i64, i64* %1, i64 0
  %25 = load i1, i1* %out.
  %26 = icmp slt i64 0, %len.1
  %27 = bitcast i64* %shadow to i64*
  %safe.7 = or i1 %25, %26
  %select.ptr.8 = select i1 %safe.7, i64* %24, i64* %27
  %28 = load i64, i64* %select.ptr.8, align 8
  %29 = trunc i64 %28 to i32
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i64, i64* %2, i64 1
  %32 = load i1, i1* %out.
  %33 = icmp slt i64 1, %len.2
  %34 = bitcast i64* %shadow to i64*
  %safe.9 = or i1 %32, %33
  %select.ptr.10 = select i1 %safe.9, i64* %31, i64* %34
  %35 = load i64, i64* %select.ptr.10, align 8
  %36 = trunc i64 %35 to i32
  %37 = sext i32 %36 to i64
  %38 = mul nsw i64 %30, %37
  %39 = getelementptr inbounds i64, i64* %1, i64 1
  %40 = load i1, i1* %out.
  %41 = icmp slt i64 1, %len.1
  %42 = bitcast i64* %shadow to i64*
  %safe.11 = or i1 %40, %41
  %select.ptr.12 = select i1 %safe.11, i64* %39, i64* %42
  %43 = load i64, i64* %select.ptr.12, align 8
  %44 = trunc i64 %43 to i32
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i64, i64* %2, i64 0
  %47 = load i1, i1* %out.
  %48 = icmp slt i64 0, %len.2
  %49 = bitcast i64* %shadow to i64*
  %safe.13 = or i1 %47, %48
  %select.ptr.14 = select i1 %safe.13, i64* %46, i64* %49
  %50 = load i64, i64* %select.ptr.14, align 8
  %51 = trunc i64 %50 to i32
  %52 = sext i32 %51 to i64
  %53 = mul nsw i64 %45, %52
  %54 = add nsw i64 %38, %53
  %55 = getelementptr inbounds i64, i64* %0, i64 1
  %56 = load i1, i1* %out.
  %57 = icmp slt i64 1, %len.
  %58 = bitcast i64* %shadow to i64*
  %safe.15 = or i1 %56, %57
  %select.ptr.16 = select i1 %safe.15, i64* %55, i64* %58
  %59 = load i64, i64* %55
  %select.val.17 = select i1 %56, i64 %54, i64 %59
  store i64 %select.val.17, i64* %select.ptr.16, align 8
  %60 = getelementptr inbounds i64, i64* %1, i64 1
  %61 = load i1, i1* %out.
  %62 = icmp slt i64 1, %len.1
  %63 = bitcast i64* %shadow to i64*
  %safe.18 = or i1 %61, %62
  %select.ptr.19 = select i1 %safe.18, i64* %60, i64* %63
  %64 = load i64, i64* %select.ptr.19, align 8
  %65 = trunc i64 %64 to i32
  %66 = sext i32 %65 to i64
  %67 = mul nsw i64 2, %66
  %68 = getelementptr inbounds i64, i64* %2, i64 1
  %69 = load i1, i1* %out.
  %70 = icmp slt i64 1, %len.2
  %71 = bitcast i64* %shadow to i64*
  %safe.20 = or i1 %69, %70
  %select.ptr.21 = select i1 %safe.20, i64* %68, i64* %71
  %72 = load i64, i64* %select.ptr.21, align 8
  %73 = trunc i64 %72 to i32
  %74 = sext i32 %73 to i64
  %75 = mul nsw i64 %67, %74
  %76 = getelementptr inbounds i64, i64* %1, i64 0
  %77 = load i1, i1* %out.
  %78 = icmp slt i64 0, %len.1
  %79 = bitcast i64* %shadow to i64*
  %safe.22 = or i1 %77, %78
  %select.ptr.23 = select i1 %safe.22, i64* %76, i64* %79
  %80 = load i64, i64* %select.ptr.23, align 8
  %81 = trunc i64 %80 to i32
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i64, i64* %2, i64 2
  %84 = load i1, i1* %out.
  %85 = icmp slt i64 2, %len.2
  %86 = bitcast i64* %shadow to i64*
  %safe.24 = or i1 %84, %85
  %select.ptr.25 = select i1 %safe.24, i64* %83, i64* %86
  %87 = load i64, i64* %select.ptr.25, align 8
  %88 = trunc i64 %87 to i32
  %89 = sext i32 %88 to i64
  %90 = mul nsw i64 %82, %89
  %91 = add nsw i64 %75, %90
  %92 = getelementptr inbounds i64, i64* %1, i64 2
  %93 = load i1, i1* %out.
  %94 = icmp slt i64 2, %len.1
  %95 = bitcast i64* %shadow to i64*
  %safe.26 = or i1 %93, %94
  %select.ptr.27 = select i1 %safe.26, i64* %92, i64* %95
  %96 = load i64, i64* %select.ptr.27, align 8
  %97 = trunc i64 %96 to i32
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i64, i64* %2, i64 0
  %100 = load i1, i1* %out.
  %101 = icmp slt i64 0, %len.2
  %102 = bitcast i64* %shadow to i64*
  %safe.28 = or i1 %100, %101
  %select.ptr.29 = select i1 %safe.28, i64* %99, i64* %102
  %103 = load i64, i64* %select.ptr.29, align 8
  %104 = trunc i64 %103 to i32
  %105 = sext i32 %104 to i64
  %106 = mul nsw i64 %98, %105
  %107 = add nsw i64 %91, %106
  %108 = getelementptr inbounds i64, i64* %0, i64 2
  %109 = load i1, i1* %out.
  %110 = icmp slt i64 2, %len.
  %111 = bitcast i64* %shadow to i64*
  %safe.30 = or i1 %109, %110
  %select.ptr.31 = select i1 %safe.30, i64* %108, i64* %111
  %112 = load i64, i64* %108
  %select.val.32 = select i1 %109, i64 %107, i64 %112
  store i64 %select.val.32, i64* %select.ptr.31, align 8
  %113 = getelementptr inbounds i64, i64* %1, i64 1
  %114 = load i1, i1* %out.
  %115 = icmp slt i64 1, %len.1
  %116 = bitcast i64* %shadow to i64*
  %safe.33 = or i1 %114, %115
  %select.ptr.34 = select i1 %safe.33, i64* %113, i64* %116
  %117 = load i64, i64* %select.ptr.34, align 8
  %118 = trunc i64 %117 to i32
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i64, i64* %2, i64 2
  %121 = load i1, i1* %out.
  %122 = icmp slt i64 2, %len.2
  %123 = bitcast i64* %shadow to i64*
  %safe.35 = or i1 %121, %122
  %select.ptr.36 = select i1 %safe.35, i64* %120, i64* %123
  %124 = load i64, i64* %select.ptr.36, align 8
  %125 = trunc i64 %124 to i32
  %126 = sext i32 %125 to i64
  %127 = mul nsw i64 %119, %126
  %128 = getelementptr inbounds i64, i64* %1, i64 2
  %129 = load i1, i1* %out.
  %130 = icmp slt i64 2, %len.1
  %131 = bitcast i64* %shadow to i64*
  %safe.37 = or i1 %129, %130
  %select.ptr.38 = select i1 %safe.37, i64* %128, i64* %131
  %132 = load i64, i64* %select.ptr.38, align 8
  %133 = trunc i64 %132 to i32
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i64, i64* %2, i64 1
  %136 = load i1, i1* %out.
  %137 = icmp slt i64 1, %len.2
  %138 = bitcast i64* %shadow to i64*
  %safe.39 = or i1 %136, %137
  %select.ptr.40 = select i1 %safe.39, i64* %135, i64* %138
  %139 = load i64, i64* %select.ptr.40, align 8
  %140 = trunc i64 %139 to i32
  %141 = sext i32 %140 to i64
  %142 = mul nsw i64 %134, %141
  %143 = add nsw i64 %127, %142
  %144 = getelementptr inbounds i64, i64* %1, i64 0
  %145 = load i1, i1* %out.
  %146 = icmp slt i64 0, %len.1
  %147 = bitcast i64* %shadow to i64*
  %safe.41 = or i1 %145, %146
  %select.ptr.42 = select i1 %safe.41, i64* %144, i64* %147
  %148 = load i64, i64* %select.ptr.42, align 8
  %149 = trunc i64 %148 to i32
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i64, i64* %2, i64 3
  %152 = load i1, i1* %out.
  %153 = icmp slt i64 3, %len.2
  %154 = bitcast i64* %shadow to i64*
  %safe.43 = or i1 %152, %153
  %select.ptr.44 = select i1 %safe.43, i64* %151, i64* %154
  %155 = load i64, i64* %select.ptr.44, align 8
  %156 = trunc i64 %155 to i32
  %157 = sext i32 %156 to i64
  %158 = mul nsw i64 %150, %157
  %159 = add nsw i64 %143, %158
  %160 = getelementptr inbounds i64, i64* %1, i64 3
  %161 = load i1, i1* %out.
  %162 = icmp slt i64 3, %len.1
  %163 = bitcast i64* %shadow to i64*
  %safe.45 = or i1 %161, %162
  %select.ptr.46 = select i1 %safe.45, i64* %160, i64* %163
  %164 = load i64, i64* %select.ptr.46, align 8
  %165 = trunc i64 %164 to i32
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i64, i64* %2, i64 0
  %168 = load i1, i1* %out.
  %169 = icmp slt i64 0, %len.2
  %170 = bitcast i64* %shadow to i64*
  %safe.47 = or i1 %168, %169
  %select.ptr.48 = select i1 %safe.47, i64* %167, i64* %170
  %171 = load i64, i64* %select.ptr.48, align 8
  %172 = trunc i64 %171 to i32
  %173 = sext i32 %172 to i64
  %174 = mul nsw i64 %166, %173
  %175 = add nsw i64 %159, %174
  %176 = getelementptr inbounds i64, i64* %0, i64 3
  %177 = load i1, i1* %out.
  %178 = icmp slt i64 3, %len.
  %179 = bitcast i64* %shadow to i64*
  %safe.49 = or i1 %177, %178
  %select.ptr.50 = select i1 %safe.49, i64* %176, i64* %179
  %180 = load i64, i64* %176
  %select.val.51 = select i1 %177, i64 %175, i64 %180
  store i64 %select.val.51, i64* %select.ptr.50, align 8
  %181 = getelementptr inbounds i64, i64* %1, i64 2
  %182 = load i1, i1* %out.
  %183 = icmp slt i64 2, %len.1
  %184 = bitcast i64* %shadow to i64*
  %safe.52 = or i1 %182, %183
  %select.ptr.53 = select i1 %safe.52, i64* %181, i64* %184
  %185 = load i64, i64* %select.ptr.53, align 8
  %186 = trunc i64 %185 to i32
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i64, i64* %2, i64 2
  %189 = load i1, i1* %out.
  %190 = icmp slt i64 2, %len.2
  %191 = bitcast i64* %shadow to i64*
  %safe.54 = or i1 %189, %190
  %select.ptr.55 = select i1 %safe.54, i64* %188, i64* %191
  %192 = load i64, i64* %select.ptr.55, align 8
  %193 = trunc i64 %192 to i32
  %194 = sext i32 %193 to i64
  %195 = mul nsw i64 %187, %194
  %196 = getelementptr inbounds i64, i64* %1, i64 1
  %197 = load i1, i1* %out.
  %198 = icmp slt i64 1, %len.1
  %199 = bitcast i64* %shadow to i64*
  %safe.56 = or i1 %197, %198
  %select.ptr.57 = select i1 %safe.56, i64* %196, i64* %199
  %200 = load i64, i64* %select.ptr.57, align 8
  %201 = trunc i64 %200 to i32
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i64, i64* %2, i64 3
  %204 = load i1, i1* %out.
  %205 = icmp slt i64 3, %len.2
  %206 = bitcast i64* %shadow to i64*
  %safe.58 = or i1 %204, %205
  %select.ptr.59 = select i1 %safe.58, i64* %203, i64* %206
  %207 = load i64, i64* %select.ptr.59, align 8
  %208 = trunc i64 %207 to i32
  %209 = sext i32 %208 to i64
  %210 = mul nsw i64 %202, %209
  %211 = getelementptr inbounds i64, i64* %1, i64 3
  %212 = load i1, i1* %out.
  %213 = icmp slt i64 3, %len.1
  %214 = bitcast i64* %shadow to i64*
  %safe.60 = or i1 %212, %213
  %select.ptr.61 = select i1 %safe.60, i64* %211, i64* %214
  %215 = load i64, i64* %select.ptr.61, align 8
  %216 = trunc i64 %215 to i32
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds i64, i64* %2, i64 1
  %219 = load i1, i1* %out.
  %220 = icmp slt i64 1, %len.2
  %221 = bitcast i64* %shadow to i64*
  %safe.62 = or i1 %219, %220
  %select.ptr.63 = select i1 %safe.62, i64* %218, i64* %221
  %222 = load i64, i64* %select.ptr.63, align 8
  %223 = trunc i64 %222 to i32
  %224 = sext i32 %223 to i64
  %225 = mul nsw i64 %217, %224
  %226 = add nsw i64 %210, %225
  %227 = mul nsw i64 2, %226
  %228 = add nsw i64 %195, %227
  %229 = getelementptr inbounds i64, i64* %1, i64 0
  %230 = load i1, i1* %out.
  %231 = icmp slt i64 0, %len.1
  %232 = bitcast i64* %shadow to i64*
  %safe.64 = or i1 %230, %231
  %select.ptr.65 = select i1 %safe.64, i64* %229, i64* %232
  %233 = load i64, i64* %select.ptr.65, align 8
  %234 = trunc i64 %233 to i32
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds i64, i64* %2, i64 4
  %237 = load i1, i1* %out.
  %238 = icmp slt i64 4, %len.2
  %239 = bitcast i64* %shadow to i64*
  %safe.66 = or i1 %237, %238
  %select.ptr.67 = select i1 %safe.66, i64* %236, i64* %239
  %240 = load i64, i64* %select.ptr.67, align 8
  %241 = trunc i64 %240 to i32
  %242 = sext i32 %241 to i64
  %243 = mul nsw i64 %235, %242
  %244 = add nsw i64 %228, %243
  %245 = getelementptr inbounds i64, i64* %1, i64 4
  %246 = load i1, i1* %out.
  %247 = icmp slt i64 4, %len.1
  %248 = bitcast i64* %shadow to i64*
  %safe.68 = or i1 %246, %247
  %select.ptr.69 = select i1 %safe.68, i64* %245, i64* %248
  %249 = load i64, i64* %select.ptr.69, align 8
  %250 = trunc i64 %249 to i32
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds i64, i64* %2, i64 0
  %253 = load i1, i1* %out.
  %254 = icmp slt i64 0, %len.2
  %255 = bitcast i64* %shadow to i64*
  %safe.70 = or i1 %253, %254
  %select.ptr.71 = select i1 %safe.70, i64* %252, i64* %255
  %256 = load i64, i64* %select.ptr.71, align 8
  %257 = trunc i64 %256 to i32
  %258 = sext i32 %257 to i64
  %259 = mul nsw i64 %251, %258
  %260 = add nsw i64 %244, %259
  %261 = getelementptr inbounds i64, i64* %0, i64 4
  %262 = load i1, i1* %out.
  %263 = icmp slt i64 4, %len.
  %264 = bitcast i64* %shadow to i64*
  %safe.72 = or i1 %262, %263
  %select.ptr.73 = select i1 %safe.72, i64* %261, i64* %264
  %265 = load i64, i64* %261
  %select.val.74 = select i1 %262, i64 %260, i64 %265
  store i64 %select.val.74, i64* %select.ptr.73, align 8
  %266 = getelementptr inbounds i64, i64* %1, i64 2
  %267 = load i1, i1* %out.
  %268 = icmp slt i64 2, %len.1
  %269 = bitcast i64* %shadow to i64*
  %safe.75 = or i1 %267, %268
  %select.ptr.76 = select i1 %safe.75, i64* %266, i64* %269
  %270 = load i64, i64* %select.ptr.76, align 8
  %271 = trunc i64 %270 to i32
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds i64, i64* %2, i64 3
  %274 = load i1, i1* %out.
  %275 = icmp slt i64 3, %len.2
  %276 = bitcast i64* %shadow to i64*
  %safe.77 = or i1 %274, %275
  %select.ptr.78 = select i1 %safe.77, i64* %273, i64* %276
  %277 = load i64, i64* %select.ptr.78, align 8
  %278 = trunc i64 %277 to i32
  %279 = sext i32 %278 to i64
  %280 = mul nsw i64 %272, %279
  %281 = getelementptr inbounds i64, i64* %1, i64 3
  %282 = load i1, i1* %out.
  %283 = icmp slt i64 3, %len.1
  %284 = bitcast i64* %shadow to i64*
  %safe.79 = or i1 %282, %283
  %select.ptr.80 = select i1 %safe.79, i64* %281, i64* %284
  %285 = load i64, i64* %select.ptr.80, align 8
  %286 = trunc i64 %285 to i32
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds i64, i64* %2, i64 2
  %289 = load i1, i1* %out.
  %290 = icmp slt i64 2, %len.2
  %291 = bitcast i64* %shadow to i64*
  %safe.81 = or i1 %289, %290
  %select.ptr.82 = select i1 %safe.81, i64* %288, i64* %291
  %292 = load i64, i64* %select.ptr.82, align 8
  %293 = trunc i64 %292 to i32
  %294 = sext i32 %293 to i64
  %295 = mul nsw i64 %287, %294
  %296 = add nsw i64 %280, %295
  %297 = getelementptr inbounds i64, i64* %1, i64 1
  %298 = load i1, i1* %out.
  %299 = icmp slt i64 1, %len.1
  %300 = bitcast i64* %shadow to i64*
  %safe.83 = or i1 %298, %299
  %select.ptr.84 = select i1 %safe.83, i64* %297, i64* %300
  %301 = load i64, i64* %select.ptr.84, align 8
  %302 = trunc i64 %301 to i32
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds i64, i64* %2, i64 4
  %305 = load i1, i1* %out.
  %306 = icmp slt i64 4, %len.2
  %307 = bitcast i64* %shadow to i64*
  %safe.85 = or i1 %305, %306
  %select.ptr.86 = select i1 %safe.85, i64* %304, i64* %307
  %308 = load i64, i64* %select.ptr.86, align 8
  %309 = trunc i64 %308 to i32
  %310 = sext i32 %309 to i64
  %311 = mul nsw i64 %303, %310
  %312 = add nsw i64 %296, %311
  %313 = getelementptr inbounds i64, i64* %1, i64 4
  %314 = load i1, i1* %out.
  %315 = icmp slt i64 4, %len.1
  %316 = bitcast i64* %shadow to i64*
  %safe.87 = or i1 %314, %315
  %select.ptr.88 = select i1 %safe.87, i64* %313, i64* %316
  %317 = load i64, i64* %select.ptr.88, align 8
  %318 = trunc i64 %317 to i32
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds i64, i64* %2, i64 1
  %321 = load i1, i1* %out.
  %322 = icmp slt i64 1, %len.2
  %323 = bitcast i64* %shadow to i64*
  %safe.89 = or i1 %321, %322
  %select.ptr.90 = select i1 %safe.89, i64* %320, i64* %323
  %324 = load i64, i64* %select.ptr.90, align 8
  %325 = trunc i64 %324 to i32
  %326 = sext i32 %325 to i64
  %327 = mul nsw i64 %319, %326
  %328 = add nsw i64 %312, %327
  %329 = getelementptr inbounds i64, i64* %1, i64 0
  %330 = load i1, i1* %out.
  %331 = icmp slt i64 0, %len.1
  %332 = bitcast i64* %shadow to i64*
  %safe.91 = or i1 %330, %331
  %select.ptr.92 = select i1 %safe.91, i64* %329, i64* %332
  %333 = load i64, i64* %select.ptr.92, align 8
  %334 = trunc i64 %333 to i32
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds i64, i64* %2, i64 5
  %337 = load i1, i1* %out.
  %338 = icmp slt i64 5, %len.2
  %339 = bitcast i64* %shadow to i64*
  %safe.93 = or i1 %337, %338
  %select.ptr.94 = select i1 %safe.93, i64* %336, i64* %339
  %340 = load i64, i64* %select.ptr.94, align 8
  %341 = trunc i64 %340 to i32
  %342 = sext i32 %341 to i64
  %343 = mul nsw i64 %335, %342
  %344 = add nsw i64 %328, %343
  %345 = getelementptr inbounds i64, i64* %1, i64 5
  %346 = load i1, i1* %out.
  %347 = icmp slt i64 5, %len.1
  %348 = bitcast i64* %shadow to i64*
  %safe.95 = or i1 %346, %347
  %select.ptr.96 = select i1 %safe.95, i64* %345, i64* %348
  %349 = load i64, i64* %select.ptr.96, align 8
  %350 = trunc i64 %349 to i32
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds i64, i64* %2, i64 0
  %353 = load i1, i1* %out.
  %354 = icmp slt i64 0, %len.2
  %355 = bitcast i64* %shadow to i64*
  %safe.97 = or i1 %353, %354
  %select.ptr.98 = select i1 %safe.97, i64* %352, i64* %355
  %356 = load i64, i64* %select.ptr.98, align 8
  %357 = trunc i64 %356 to i32
  %358 = sext i32 %357 to i64
  %359 = mul nsw i64 %351, %358
  %360 = add nsw i64 %344, %359
  %361 = getelementptr inbounds i64, i64* %0, i64 5
  %362 = load i1, i1* %out.
  %363 = icmp slt i64 5, %len.
  %364 = bitcast i64* %shadow to i64*
  %safe.99 = or i1 %362, %363
  %select.ptr.100 = select i1 %safe.99, i64* %361, i64* %364
  %365 = load i64, i64* %361
  %select.val.101 = select i1 %362, i64 %360, i64 %365
  store i64 %select.val.101, i64* %select.ptr.100, align 8
  %366 = getelementptr inbounds i64, i64* %1, i64 3
  %367 = load i1, i1* %out.
  %368 = icmp slt i64 3, %len.1
  %369 = bitcast i64* %shadow to i64*
  %safe.102 = or i1 %367, %368
  %select.ptr.103 = select i1 %safe.102, i64* %366, i64* %369
  %370 = load i64, i64* %select.ptr.103, align 8
  %371 = trunc i64 %370 to i32
  %372 = sext i32 %371 to i64
  %373 = getelementptr inbounds i64, i64* %2, i64 3
  %374 = load i1, i1* %out.
  %375 = icmp slt i64 3, %len.2
  %376 = bitcast i64* %shadow to i64*
  %safe.104 = or i1 %374, %375
  %select.ptr.105 = select i1 %safe.104, i64* %373, i64* %376
  %377 = load i64, i64* %select.ptr.105, align 8
  %378 = trunc i64 %377 to i32
  %379 = sext i32 %378 to i64
  %380 = mul nsw i64 %372, %379
  %381 = getelementptr inbounds i64, i64* %1, i64 1
  %382 = load i1, i1* %out.
  %383 = icmp slt i64 1, %len.1
  %384 = bitcast i64* %shadow to i64*
  %safe.106 = or i1 %382, %383
  %select.ptr.107 = select i1 %safe.106, i64* %381, i64* %384
  %385 = load i64, i64* %select.ptr.107, align 8
  %386 = trunc i64 %385 to i32
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds i64, i64* %2, i64 5
  %389 = load i1, i1* %out.
  %390 = icmp slt i64 5, %len.2
  %391 = bitcast i64* %shadow to i64*
  %safe.108 = or i1 %389, %390
  %select.ptr.109 = select i1 %safe.108, i64* %388, i64* %391
  %392 = load i64, i64* %select.ptr.109, align 8
  %393 = trunc i64 %392 to i32
  %394 = sext i32 %393 to i64
  %395 = mul nsw i64 %387, %394
  %396 = add nsw i64 %380, %395
  %397 = getelementptr inbounds i64, i64* %1, i64 5
  %398 = load i1, i1* %out.
  %399 = icmp slt i64 5, %len.1
  %400 = bitcast i64* %shadow to i64*
  %safe.110 = or i1 %398, %399
  %select.ptr.111 = select i1 %safe.110, i64* %397, i64* %400
  %401 = load i64, i64* %select.ptr.111, align 8
  %402 = trunc i64 %401 to i32
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds i64, i64* %2, i64 1
  %405 = load i1, i1* %out.
  %406 = icmp slt i64 1, %len.2
  %407 = bitcast i64* %shadow to i64*
  %safe.112 = or i1 %405, %406
  %select.ptr.113 = select i1 %safe.112, i64* %404, i64* %407
  %408 = load i64, i64* %select.ptr.113, align 8
  %409 = trunc i64 %408 to i32
  %410 = sext i32 %409 to i64
  %411 = mul nsw i64 %403, %410
  %412 = add nsw i64 %396, %411
  %413 = mul nsw i64 2, %412
  %414 = getelementptr inbounds i64, i64* %1, i64 2
  %415 = load i1, i1* %out.
  %416 = icmp slt i64 2, %len.1
  %417 = bitcast i64* %shadow to i64*
  %safe.114 = or i1 %415, %416
  %select.ptr.115 = select i1 %safe.114, i64* %414, i64* %417
  %418 = load i64, i64* %select.ptr.115, align 8
  %419 = trunc i64 %418 to i32
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds i64, i64* %2, i64 4
  %422 = load i1, i1* %out.
  %423 = icmp slt i64 4, %len.2
  %424 = bitcast i64* %shadow to i64*
  %safe.116 = or i1 %422, %423
  %select.ptr.117 = select i1 %safe.116, i64* %421, i64* %424
  %425 = load i64, i64* %select.ptr.117, align 8
  %426 = trunc i64 %425 to i32
  %427 = sext i32 %426 to i64
  %428 = mul nsw i64 %420, %427
  %429 = add nsw i64 %413, %428
  %430 = getelementptr inbounds i64, i64* %1, i64 4
  %431 = load i1, i1* %out.
  %432 = icmp slt i64 4, %len.1
  %433 = bitcast i64* %shadow to i64*
  %safe.118 = or i1 %431, %432
  %select.ptr.119 = select i1 %safe.118, i64* %430, i64* %433
  %434 = load i64, i64* %select.ptr.119, align 8
  %435 = trunc i64 %434 to i32
  %436 = sext i32 %435 to i64
  %437 = getelementptr inbounds i64, i64* %2, i64 2
  %438 = load i1, i1* %out.
  %439 = icmp slt i64 2, %len.2
  %440 = bitcast i64* %shadow to i64*
  %safe.120 = or i1 %438, %439
  %select.ptr.121 = select i1 %safe.120, i64* %437, i64* %440
  %441 = load i64, i64* %select.ptr.121, align 8
  %442 = trunc i64 %441 to i32
  %443 = sext i32 %442 to i64
  %444 = mul nsw i64 %436, %443
  %445 = add nsw i64 %429, %444
  %446 = getelementptr inbounds i64, i64* %1, i64 0
  %447 = load i1, i1* %out.
  %448 = icmp slt i64 0, %len.1
  %449 = bitcast i64* %shadow to i64*
  %safe.122 = or i1 %447, %448
  %select.ptr.123 = select i1 %safe.122, i64* %446, i64* %449
  %450 = load i64, i64* %select.ptr.123, align 8
  %451 = trunc i64 %450 to i32
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds i64, i64* %2, i64 6
  %454 = load i1, i1* %out.
  %455 = icmp slt i64 6, %len.2
  %456 = bitcast i64* %shadow to i64*
  %safe.124 = or i1 %454, %455
  %select.ptr.125 = select i1 %safe.124, i64* %453, i64* %456
  %457 = load i64, i64* %select.ptr.125, align 8
  %458 = trunc i64 %457 to i32
  %459 = sext i32 %458 to i64
  %460 = mul nsw i64 %452, %459
  %461 = add nsw i64 %445, %460
  %462 = getelementptr inbounds i64, i64* %1, i64 6
  %463 = load i1, i1* %out.
  %464 = icmp slt i64 6, %len.1
  %465 = bitcast i64* %shadow to i64*
  %safe.126 = or i1 %463, %464
  %select.ptr.127 = select i1 %safe.126, i64* %462, i64* %465
  %466 = load i64, i64* %select.ptr.127, align 8
  %467 = trunc i64 %466 to i32
  %468 = sext i32 %467 to i64
  %469 = getelementptr inbounds i64, i64* %2, i64 0
  %470 = load i1, i1* %out.
  %471 = icmp slt i64 0, %len.2
  %472 = bitcast i64* %shadow to i64*
  %safe.128 = or i1 %470, %471
  %select.ptr.129 = select i1 %safe.128, i64* %469, i64* %472
  %473 = load i64, i64* %select.ptr.129, align 8
  %474 = trunc i64 %473 to i32
  %475 = sext i32 %474 to i64
  %476 = mul nsw i64 %468, %475
  %477 = add nsw i64 %461, %476
  %478 = getelementptr inbounds i64, i64* %0, i64 6
  %479 = load i1, i1* %out.
  %480 = icmp slt i64 6, %len.
  %481 = bitcast i64* %shadow to i64*
  %safe.130 = or i1 %479, %480
  %select.ptr.131 = select i1 %safe.130, i64* %478, i64* %481
  %482 = load i64, i64* %478
  %select.val.132 = select i1 %479, i64 %477, i64 %482
  store i64 %select.val.132, i64* %select.ptr.131, align 8
  %483 = getelementptr inbounds i64, i64* %1, i64 3
  %484 = load i1, i1* %out.
  %485 = icmp slt i64 3, %len.1
  %486 = bitcast i64* %shadow to i64*
  %safe.133 = or i1 %484, %485
  %select.ptr.134 = select i1 %safe.133, i64* %483, i64* %486
  %487 = load i64, i64* %select.ptr.134, align 8
  %488 = trunc i64 %487 to i32
  %489 = sext i32 %488 to i64
  %490 = getelementptr inbounds i64, i64* %2, i64 4
  %491 = load i1, i1* %out.
  %492 = icmp slt i64 4, %len.2
  %493 = bitcast i64* %shadow to i64*
  %safe.135 = or i1 %491, %492
  %select.ptr.136 = select i1 %safe.135, i64* %490, i64* %493
  %494 = load i64, i64* %select.ptr.136, align 8
  %495 = trunc i64 %494 to i32
  %496 = sext i32 %495 to i64
  %497 = mul nsw i64 %489, %496
  %498 = getelementptr inbounds i64, i64* %1, i64 4
  %499 = load i1, i1* %out.
  %500 = icmp slt i64 4, %len.1
  %501 = bitcast i64* %shadow to i64*
  %safe.137 = or i1 %499, %500
  %select.ptr.138 = select i1 %safe.137, i64* %498, i64* %501
  %502 = load i64, i64* %select.ptr.138, align 8
  %503 = trunc i64 %502 to i32
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds i64, i64* %2, i64 3
  %506 = load i1, i1* %out.
  %507 = icmp slt i64 3, %len.2
  %508 = bitcast i64* %shadow to i64*
  %safe.139 = or i1 %506, %507
  %select.ptr.140 = select i1 %safe.139, i64* %505, i64* %508
  %509 = load i64, i64* %select.ptr.140, align 8
  %510 = trunc i64 %509 to i32
  %511 = sext i32 %510 to i64
  %512 = mul nsw i64 %504, %511
  %513 = add nsw i64 %497, %512
  %514 = getelementptr inbounds i64, i64* %1, i64 2
  %515 = load i1, i1* %out.
  %516 = icmp slt i64 2, %len.1
  %517 = bitcast i64* %shadow to i64*
  %safe.141 = or i1 %515, %516
  %select.ptr.142 = select i1 %safe.141, i64* %514, i64* %517
  %518 = load i64, i64* %select.ptr.142, align 8
  %519 = trunc i64 %518 to i32
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds i64, i64* %2, i64 5
  %522 = load i1, i1* %out.
  %523 = icmp slt i64 5, %len.2
  %524 = bitcast i64* %shadow to i64*
  %safe.143 = or i1 %522, %523
  %select.ptr.144 = select i1 %safe.143, i64* %521, i64* %524
  %525 = load i64, i64* %select.ptr.144, align 8
  %526 = trunc i64 %525 to i32
  %527 = sext i32 %526 to i64
  %528 = mul nsw i64 %520, %527
  %529 = add nsw i64 %513, %528
  %530 = getelementptr inbounds i64, i64* %1, i64 5
  %531 = load i1, i1* %out.
  %532 = icmp slt i64 5, %len.1
  %533 = bitcast i64* %shadow to i64*
  %safe.145 = or i1 %531, %532
  %select.ptr.146 = select i1 %safe.145, i64* %530, i64* %533
  %534 = load i64, i64* %select.ptr.146, align 8
  %535 = trunc i64 %534 to i32
  %536 = sext i32 %535 to i64
  %537 = getelementptr inbounds i64, i64* %2, i64 2
  %538 = load i1, i1* %out.
  %539 = icmp slt i64 2, %len.2
  %540 = bitcast i64* %shadow to i64*
  %safe.147 = or i1 %538, %539
  %select.ptr.148 = select i1 %safe.147, i64* %537, i64* %540
  %541 = load i64, i64* %select.ptr.148, align 8
  %542 = trunc i64 %541 to i32
  %543 = sext i32 %542 to i64
  %544 = mul nsw i64 %536, %543
  %545 = add nsw i64 %529, %544
  %546 = getelementptr inbounds i64, i64* %1, i64 1
  %547 = load i1, i1* %out.
  %548 = icmp slt i64 1, %len.1
  %549 = bitcast i64* %shadow to i64*
  %safe.149 = or i1 %547, %548
  %select.ptr.150 = select i1 %safe.149, i64* %546, i64* %549
  %550 = load i64, i64* %select.ptr.150, align 8
  %551 = trunc i64 %550 to i32
  %552 = sext i32 %551 to i64
  %553 = getelementptr inbounds i64, i64* %2, i64 6
  %554 = load i1, i1* %out.
  %555 = icmp slt i64 6, %len.2
  %556 = bitcast i64* %shadow to i64*
  %safe.151 = or i1 %554, %555
  %select.ptr.152 = select i1 %safe.151, i64* %553, i64* %556
  %557 = load i64, i64* %select.ptr.152, align 8
  %558 = trunc i64 %557 to i32
  %559 = sext i32 %558 to i64
  %560 = mul nsw i64 %552, %559
  %561 = add nsw i64 %545, %560
  %562 = getelementptr inbounds i64, i64* %1, i64 6
  %563 = load i1, i1* %out.
  %564 = icmp slt i64 6, %len.1
  %565 = bitcast i64* %shadow to i64*
  %safe.153 = or i1 %563, %564
  %select.ptr.154 = select i1 %safe.153, i64* %562, i64* %565
  %566 = load i64, i64* %select.ptr.154, align 8
  %567 = trunc i64 %566 to i32
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds i64, i64* %2, i64 1
  %570 = load i1, i1* %out.
  %571 = icmp slt i64 1, %len.2
  %572 = bitcast i64* %shadow to i64*
  %safe.155 = or i1 %570, %571
  %select.ptr.156 = select i1 %safe.155, i64* %569, i64* %572
  %573 = load i64, i64* %select.ptr.156, align 8
  %574 = trunc i64 %573 to i32
  %575 = sext i32 %574 to i64
  %576 = mul nsw i64 %568, %575
  %577 = add nsw i64 %561, %576
  %578 = getelementptr inbounds i64, i64* %1, i64 0
  %579 = load i1, i1* %out.
  %580 = icmp slt i64 0, %len.1
  %581 = bitcast i64* %shadow to i64*
  %safe.157 = or i1 %579, %580
  %select.ptr.158 = select i1 %safe.157, i64* %578, i64* %581
  %582 = load i64, i64* %select.ptr.158, align 8
  %583 = trunc i64 %582 to i32
  %584 = sext i32 %583 to i64
  %585 = getelementptr inbounds i64, i64* %2, i64 7
  %586 = load i1, i1* %out.
  %587 = icmp slt i64 7, %len.2
  %588 = bitcast i64* %shadow to i64*
  %safe.159 = or i1 %586, %587
  %select.ptr.160 = select i1 %safe.159, i64* %585, i64* %588
  %589 = load i64, i64* %select.ptr.160, align 8
  %590 = trunc i64 %589 to i32
  %591 = sext i32 %590 to i64
  %592 = mul nsw i64 %584, %591
  %593 = add nsw i64 %577, %592
  %594 = getelementptr inbounds i64, i64* %1, i64 7
  %595 = load i1, i1* %out.
  %596 = icmp slt i64 7, %len.1
  %597 = bitcast i64* %shadow to i64*
  %safe.161 = or i1 %595, %596
  %select.ptr.162 = select i1 %safe.161, i64* %594, i64* %597
  %598 = load i64, i64* %select.ptr.162, align 8
  %599 = trunc i64 %598 to i32
  %600 = sext i32 %599 to i64
  %601 = getelementptr inbounds i64, i64* %2, i64 0
  %602 = load i1, i1* %out.
  %603 = icmp slt i64 0, %len.2
  %604 = bitcast i64* %shadow to i64*
  %safe.163 = or i1 %602, %603
  %select.ptr.164 = select i1 %safe.163, i64* %601, i64* %604
  %605 = load i64, i64* %select.ptr.164, align 8
  %606 = trunc i64 %605 to i32
  %607 = sext i32 %606 to i64
  %608 = mul nsw i64 %600, %607
  %609 = add nsw i64 %593, %608
  %610 = getelementptr inbounds i64, i64* %0, i64 7
  %611 = load i1, i1* %out.
  %612 = icmp slt i64 7, %len.
  %613 = bitcast i64* %shadow to i64*
  %safe.165 = or i1 %611, %612
  %select.ptr.166 = select i1 %safe.165, i64* %610, i64* %613
  %614 = load i64, i64* %610
  %select.val.167 = select i1 %611, i64 %609, i64 %614
  store i64 %select.val.167, i64* %select.ptr.166, align 8
  %615 = getelementptr inbounds i64, i64* %1, i64 4
  %616 = load i1, i1* %out.
  %617 = icmp slt i64 4, %len.1
  %618 = bitcast i64* %shadow to i64*
  %safe.168 = or i1 %616, %617
  %select.ptr.169 = select i1 %safe.168, i64* %615, i64* %618
  %619 = load i64, i64* %select.ptr.169, align 8
  %620 = trunc i64 %619 to i32
  %621 = sext i32 %620 to i64
  %622 = getelementptr inbounds i64, i64* %2, i64 4
  %623 = load i1, i1* %out.
  %624 = icmp slt i64 4, %len.2
  %625 = bitcast i64* %shadow to i64*
  %safe.170 = or i1 %623, %624
  %select.ptr.171 = select i1 %safe.170, i64* %622, i64* %625
  %626 = load i64, i64* %select.ptr.171, align 8
  %627 = trunc i64 %626 to i32
  %628 = sext i32 %627 to i64
  %629 = mul nsw i64 %621, %628
  %630 = getelementptr inbounds i64, i64* %1, i64 3
  %631 = load i1, i1* %out.
  %632 = icmp slt i64 3, %len.1
  %633 = bitcast i64* %shadow to i64*
  %safe.172 = or i1 %631, %632
  %select.ptr.173 = select i1 %safe.172, i64* %630, i64* %633
  %634 = load i64, i64* %select.ptr.173, align 8
  %635 = trunc i64 %634 to i32
  %636 = sext i32 %635 to i64
  %637 = getelementptr inbounds i64, i64* %2, i64 5
  %638 = load i1, i1* %out.
  %639 = icmp slt i64 5, %len.2
  %640 = bitcast i64* %shadow to i64*
  %safe.174 = or i1 %638, %639
  %select.ptr.175 = select i1 %safe.174, i64* %637, i64* %640
  %641 = load i64, i64* %select.ptr.175, align 8
  %642 = trunc i64 %641 to i32
  %643 = sext i32 %642 to i64
  %644 = mul nsw i64 %636, %643
  %645 = getelementptr inbounds i64, i64* %1, i64 5
  %646 = load i1, i1* %out.
  %647 = icmp slt i64 5, %len.1
  %648 = bitcast i64* %shadow to i64*
  %safe.176 = or i1 %646, %647
  %select.ptr.177 = select i1 %safe.176, i64* %645, i64* %648
  %649 = load i64, i64* %select.ptr.177, align 8
  %650 = trunc i64 %649 to i32
  %651 = sext i32 %650 to i64
  %652 = getelementptr inbounds i64, i64* %2, i64 3
  %653 = load i1, i1* %out.
  %654 = icmp slt i64 3, %len.2
  %655 = bitcast i64* %shadow to i64*
  %safe.178 = or i1 %653, %654
  %select.ptr.179 = select i1 %safe.178, i64* %652, i64* %655
  %656 = load i64, i64* %select.ptr.179, align 8
  %657 = trunc i64 %656 to i32
  %658 = sext i32 %657 to i64
  %659 = mul nsw i64 %651, %658
  %660 = add nsw i64 %644, %659
  %661 = getelementptr inbounds i64, i64* %1, i64 1
  %662 = load i1, i1* %out.
  %663 = icmp slt i64 1, %len.1
  %664 = bitcast i64* %shadow to i64*
  %safe.180 = or i1 %662, %663
  %select.ptr.181 = select i1 %safe.180, i64* %661, i64* %664
  %665 = load i64, i64* %select.ptr.181, align 8
  %666 = trunc i64 %665 to i32
  %667 = sext i32 %666 to i64
  %668 = getelementptr inbounds i64, i64* %2, i64 7
  %669 = load i1, i1* %out.
  %670 = icmp slt i64 7, %len.2
  %671 = bitcast i64* %shadow to i64*
  %safe.182 = or i1 %669, %670
  %select.ptr.183 = select i1 %safe.182, i64* %668, i64* %671
  %672 = load i64, i64* %select.ptr.183, align 8
  %673 = trunc i64 %672 to i32
  %674 = sext i32 %673 to i64
  %675 = mul nsw i64 %667, %674
  %676 = add nsw i64 %660, %675
  %677 = getelementptr inbounds i64, i64* %1, i64 7
  %678 = load i1, i1* %out.
  %679 = icmp slt i64 7, %len.1
  %680 = bitcast i64* %shadow to i64*
  %safe.184 = or i1 %678, %679
  %select.ptr.185 = select i1 %safe.184, i64* %677, i64* %680
  %681 = load i64, i64* %select.ptr.185, align 8
  %682 = trunc i64 %681 to i32
  %683 = sext i32 %682 to i64
  %684 = getelementptr inbounds i64, i64* %2, i64 1
  %685 = load i1, i1* %out.
  %686 = icmp slt i64 1, %len.2
  %687 = bitcast i64* %shadow to i64*
  %safe.186 = or i1 %685, %686
  %select.ptr.187 = select i1 %safe.186, i64* %684, i64* %687
  %688 = load i64, i64* %select.ptr.187, align 8
  %689 = trunc i64 %688 to i32
  %690 = sext i32 %689 to i64
  %691 = mul nsw i64 %683, %690
  %692 = add nsw i64 %676, %691
  %693 = mul nsw i64 2, %692
  %694 = add nsw i64 %629, %693
  %695 = getelementptr inbounds i64, i64* %1, i64 2
  %696 = load i1, i1* %out.
  %697 = icmp slt i64 2, %len.1
  %698 = bitcast i64* %shadow to i64*
  %safe.188 = or i1 %696, %697
  %select.ptr.189 = select i1 %safe.188, i64* %695, i64* %698
  %699 = load i64, i64* %select.ptr.189, align 8
  %700 = trunc i64 %699 to i32
  %701 = sext i32 %700 to i64
  %702 = getelementptr inbounds i64, i64* %2, i64 6
  %703 = load i1, i1* %out.
  %704 = icmp slt i64 6, %len.2
  %705 = bitcast i64* %shadow to i64*
  %safe.190 = or i1 %703, %704
  %select.ptr.191 = select i1 %safe.190, i64* %702, i64* %705
  %706 = load i64, i64* %select.ptr.191, align 8
  %707 = trunc i64 %706 to i32
  %708 = sext i32 %707 to i64
  %709 = mul nsw i64 %701, %708
  %710 = add nsw i64 %694, %709
  %711 = getelementptr inbounds i64, i64* %1, i64 6
  %712 = load i1, i1* %out.
  %713 = icmp slt i64 6, %len.1
  %714 = bitcast i64* %shadow to i64*
  %safe.192 = or i1 %712, %713
  %select.ptr.193 = select i1 %safe.192, i64* %711, i64* %714
  %715 = load i64, i64* %select.ptr.193, align 8
  %716 = trunc i64 %715 to i32
  %717 = sext i32 %716 to i64
  %718 = getelementptr inbounds i64, i64* %2, i64 2
  %719 = load i1, i1* %out.
  %720 = icmp slt i64 2, %len.2
  %721 = bitcast i64* %shadow to i64*
  %safe.194 = or i1 %719, %720
  %select.ptr.195 = select i1 %safe.194, i64* %718, i64* %721
  %722 = load i64, i64* %select.ptr.195, align 8
  %723 = trunc i64 %722 to i32
  %724 = sext i32 %723 to i64
  %725 = mul nsw i64 %717, %724
  %726 = add nsw i64 %710, %725
  %727 = getelementptr inbounds i64, i64* %1, i64 0
  %728 = load i1, i1* %out.
  %729 = icmp slt i64 0, %len.1
  %730 = bitcast i64* %shadow to i64*
  %safe.196 = or i1 %728, %729
  %select.ptr.197 = select i1 %safe.196, i64* %727, i64* %730
  %731 = load i64, i64* %select.ptr.197, align 8
  %732 = trunc i64 %731 to i32
  %733 = sext i32 %732 to i64
  %734 = getelementptr inbounds i64, i64* %2, i64 8
  %735 = load i1, i1* %out.
  %736 = icmp slt i64 8, %len.2
  %737 = bitcast i64* %shadow to i64*
  %safe.198 = or i1 %735, %736
  %select.ptr.199 = select i1 %safe.198, i64* %734, i64* %737
  %738 = load i64, i64* %select.ptr.199, align 8
  %739 = trunc i64 %738 to i32
  %740 = sext i32 %739 to i64
  %741 = mul nsw i64 %733, %740
  %742 = add nsw i64 %726, %741
  %743 = getelementptr inbounds i64, i64* %1, i64 8
  %744 = load i1, i1* %out.
  %745 = icmp slt i64 8, %len.1
  %746 = bitcast i64* %shadow to i64*
  %safe.200 = or i1 %744, %745
  %select.ptr.201 = select i1 %safe.200, i64* %743, i64* %746
  %747 = load i64, i64* %select.ptr.201, align 8
  %748 = trunc i64 %747 to i32
  %749 = sext i32 %748 to i64
  %750 = getelementptr inbounds i64, i64* %2, i64 0
  %751 = load i1, i1* %out.
  %752 = icmp slt i64 0, %len.2
  %753 = bitcast i64* %shadow to i64*
  %safe.202 = or i1 %751, %752
  %select.ptr.203 = select i1 %safe.202, i64* %750, i64* %753
  %754 = load i64, i64* %select.ptr.203, align 8
  %755 = trunc i64 %754 to i32
  %756 = sext i32 %755 to i64
  %757 = mul nsw i64 %749, %756
  %758 = add nsw i64 %742, %757
  %759 = getelementptr inbounds i64, i64* %0, i64 8
  %760 = load i1, i1* %out.
  %761 = icmp slt i64 8, %len.
  %762 = bitcast i64* %shadow to i64*
  %safe.204 = or i1 %760, %761
  %select.ptr.205 = select i1 %safe.204, i64* %759, i64* %762
  %763 = load i64, i64* %759
  %select.val.206 = select i1 %760, i64 %758, i64 %763
  store i64 %select.val.206, i64* %select.ptr.205, align 8
  %764 = getelementptr inbounds i64, i64* %1, i64 4
  %765 = load i1, i1* %out.
  %766 = icmp slt i64 4, %len.1
  %767 = bitcast i64* %shadow to i64*
  %safe.207 = or i1 %765, %766
  %select.ptr.208 = select i1 %safe.207, i64* %764, i64* %767
  %768 = load i64, i64* %select.ptr.208, align 8
  %769 = trunc i64 %768 to i32
  %770 = sext i32 %769 to i64
  %771 = getelementptr inbounds i64, i64* %2, i64 5
  %772 = load i1, i1* %out.
  %773 = icmp slt i64 5, %len.2
  %774 = bitcast i64* %shadow to i64*
  %safe.209 = or i1 %772, %773
  %select.ptr.210 = select i1 %safe.209, i64* %771, i64* %774
  %775 = load i64, i64* %select.ptr.210, align 8
  %776 = trunc i64 %775 to i32
  %777 = sext i32 %776 to i64
  %778 = mul nsw i64 %770, %777
  %779 = getelementptr inbounds i64, i64* %1, i64 5
  %780 = load i1, i1* %out.
  %781 = icmp slt i64 5, %len.1
  %782 = bitcast i64* %shadow to i64*
  %safe.211 = or i1 %780, %781
  %select.ptr.212 = select i1 %safe.211, i64* %779, i64* %782
  %783 = load i64, i64* %select.ptr.212, align 8
  %784 = trunc i64 %783 to i32
  %785 = sext i32 %784 to i64
  %786 = getelementptr inbounds i64, i64* %2, i64 4
  %787 = load i1, i1* %out.
  %788 = icmp slt i64 4, %len.2
  %789 = bitcast i64* %shadow to i64*
  %safe.213 = or i1 %787, %788
  %select.ptr.214 = select i1 %safe.213, i64* %786, i64* %789
  %790 = load i64, i64* %select.ptr.214, align 8
  %791 = trunc i64 %790 to i32
  %792 = sext i32 %791 to i64
  %793 = mul nsw i64 %785, %792
  %794 = add nsw i64 %778, %793
  %795 = getelementptr inbounds i64, i64* %1, i64 3
  %796 = load i1, i1* %out.
  %797 = icmp slt i64 3, %len.1
  %798 = bitcast i64* %shadow to i64*
  %safe.215 = or i1 %796, %797
  %select.ptr.216 = select i1 %safe.215, i64* %795, i64* %798
  %799 = load i64, i64* %select.ptr.216, align 8
  %800 = trunc i64 %799 to i32
  %801 = sext i32 %800 to i64
  %802 = getelementptr inbounds i64, i64* %2, i64 6
  %803 = load i1, i1* %out.
  %804 = icmp slt i64 6, %len.2
  %805 = bitcast i64* %shadow to i64*
  %safe.217 = or i1 %803, %804
  %select.ptr.218 = select i1 %safe.217, i64* %802, i64* %805
  %806 = load i64, i64* %select.ptr.218, align 8
  %807 = trunc i64 %806 to i32
  %808 = sext i32 %807 to i64
  %809 = mul nsw i64 %801, %808
  %810 = add nsw i64 %794, %809
  %811 = getelementptr inbounds i64, i64* %1, i64 6
  %812 = load i1, i1* %out.
  %813 = icmp slt i64 6, %len.1
  %814 = bitcast i64* %shadow to i64*
  %safe.219 = or i1 %812, %813
  %select.ptr.220 = select i1 %safe.219, i64* %811, i64* %814
  %815 = load i64, i64* %select.ptr.220, align 8
  %816 = trunc i64 %815 to i32
  %817 = sext i32 %816 to i64
  %818 = getelementptr inbounds i64, i64* %2, i64 3
  %819 = load i1, i1* %out.
  %820 = icmp slt i64 3, %len.2
  %821 = bitcast i64* %shadow to i64*
  %safe.221 = or i1 %819, %820
  %select.ptr.222 = select i1 %safe.221, i64* %818, i64* %821
  %822 = load i64, i64* %select.ptr.222, align 8
  %823 = trunc i64 %822 to i32
  %824 = sext i32 %823 to i64
  %825 = mul nsw i64 %817, %824
  %826 = add nsw i64 %810, %825
  %827 = getelementptr inbounds i64, i64* %1, i64 2
  %828 = load i1, i1* %out.
  %829 = icmp slt i64 2, %len.1
  %830 = bitcast i64* %shadow to i64*
  %safe.223 = or i1 %828, %829
  %select.ptr.224 = select i1 %safe.223, i64* %827, i64* %830
  %831 = load i64, i64* %select.ptr.224, align 8
  %832 = trunc i64 %831 to i32
  %833 = sext i32 %832 to i64
  %834 = getelementptr inbounds i64, i64* %2, i64 7
  %835 = load i1, i1* %out.
  %836 = icmp slt i64 7, %len.2
  %837 = bitcast i64* %shadow to i64*
  %safe.225 = or i1 %835, %836
  %select.ptr.226 = select i1 %safe.225, i64* %834, i64* %837
  %838 = load i64, i64* %select.ptr.226, align 8
  %839 = trunc i64 %838 to i32
  %840 = sext i32 %839 to i64
  %841 = mul nsw i64 %833, %840
  %842 = add nsw i64 %826, %841
  %843 = getelementptr inbounds i64, i64* %1, i64 7
  %844 = load i1, i1* %out.
  %845 = icmp slt i64 7, %len.1
  %846 = bitcast i64* %shadow to i64*
  %safe.227 = or i1 %844, %845
  %select.ptr.228 = select i1 %safe.227, i64* %843, i64* %846
  %847 = load i64, i64* %select.ptr.228, align 8
  %848 = trunc i64 %847 to i32
  %849 = sext i32 %848 to i64
  %850 = getelementptr inbounds i64, i64* %2, i64 2
  %851 = load i1, i1* %out.
  %852 = icmp slt i64 2, %len.2
  %853 = bitcast i64* %shadow to i64*
  %safe.229 = or i1 %851, %852
  %select.ptr.230 = select i1 %safe.229, i64* %850, i64* %853
  %854 = load i64, i64* %select.ptr.230, align 8
  %855 = trunc i64 %854 to i32
  %856 = sext i32 %855 to i64
  %857 = mul nsw i64 %849, %856
  %858 = add nsw i64 %842, %857
  %859 = getelementptr inbounds i64, i64* %1, i64 1
  %860 = load i1, i1* %out.
  %861 = icmp slt i64 1, %len.1
  %862 = bitcast i64* %shadow to i64*
  %safe.231 = or i1 %860, %861
  %select.ptr.232 = select i1 %safe.231, i64* %859, i64* %862
  %863 = load i64, i64* %select.ptr.232, align 8
  %864 = trunc i64 %863 to i32
  %865 = sext i32 %864 to i64
  %866 = getelementptr inbounds i64, i64* %2, i64 8
  %867 = load i1, i1* %out.
  %868 = icmp slt i64 8, %len.2
  %869 = bitcast i64* %shadow to i64*
  %safe.233 = or i1 %867, %868
  %select.ptr.234 = select i1 %safe.233, i64* %866, i64* %869
  %870 = load i64, i64* %select.ptr.234, align 8
  %871 = trunc i64 %870 to i32
  %872 = sext i32 %871 to i64
  %873 = mul nsw i64 %865, %872
  %874 = add nsw i64 %858, %873
  %875 = getelementptr inbounds i64, i64* %1, i64 8
  %876 = load i1, i1* %out.
  %877 = icmp slt i64 8, %len.1
  %878 = bitcast i64* %shadow to i64*
  %safe.235 = or i1 %876, %877
  %select.ptr.236 = select i1 %safe.235, i64* %875, i64* %878
  %879 = load i64, i64* %select.ptr.236, align 8
  %880 = trunc i64 %879 to i32
  %881 = sext i32 %880 to i64
  %882 = getelementptr inbounds i64, i64* %2, i64 1
  %883 = load i1, i1* %out.
  %884 = icmp slt i64 1, %len.2
  %885 = bitcast i64* %shadow to i64*
  %safe.237 = or i1 %883, %884
  %select.ptr.238 = select i1 %safe.237, i64* %882, i64* %885
  %886 = load i64, i64* %select.ptr.238, align 8
  %887 = trunc i64 %886 to i32
  %888 = sext i32 %887 to i64
  %889 = mul nsw i64 %881, %888
  %890 = add nsw i64 %874, %889
  %891 = getelementptr inbounds i64, i64* %1, i64 0
  %892 = load i1, i1* %out.
  %893 = icmp slt i64 0, %len.1
  %894 = bitcast i64* %shadow to i64*
  %safe.239 = or i1 %892, %893
  %select.ptr.240 = select i1 %safe.239, i64* %891, i64* %894
  %895 = load i64, i64* %select.ptr.240, align 8
  %896 = trunc i64 %895 to i32
  %897 = sext i32 %896 to i64
  %898 = getelementptr inbounds i64, i64* %2, i64 9
  %899 = load i1, i1* %out.
  %900 = icmp slt i64 9, %len.2
  %901 = bitcast i64* %shadow to i64*
  %safe.241 = or i1 %899, %900
  %select.ptr.242 = select i1 %safe.241, i64* %898, i64* %901
  %902 = load i64, i64* %select.ptr.242, align 8
  %903 = trunc i64 %902 to i32
  %904 = sext i32 %903 to i64
  %905 = mul nsw i64 %897, %904
  %906 = add nsw i64 %890, %905
  %907 = getelementptr inbounds i64, i64* %1, i64 9
  %908 = load i1, i1* %out.
  %909 = icmp slt i64 9, %len.1
  %910 = bitcast i64* %shadow to i64*
  %safe.243 = or i1 %908, %909
  %select.ptr.244 = select i1 %safe.243, i64* %907, i64* %910
  %911 = load i64, i64* %select.ptr.244, align 8
  %912 = trunc i64 %911 to i32
  %913 = sext i32 %912 to i64
  %914 = getelementptr inbounds i64, i64* %2, i64 0
  %915 = load i1, i1* %out.
  %916 = icmp slt i64 0, %len.2
  %917 = bitcast i64* %shadow to i64*
  %safe.245 = or i1 %915, %916
  %select.ptr.246 = select i1 %safe.245, i64* %914, i64* %917
  %918 = load i64, i64* %select.ptr.246, align 8
  %919 = trunc i64 %918 to i32
  %920 = sext i32 %919 to i64
  %921 = mul nsw i64 %913, %920
  %922 = add nsw i64 %906, %921
  %923 = getelementptr inbounds i64, i64* %0, i64 9
  %924 = load i1, i1* %out.
  %925 = icmp slt i64 9, %len.
  %926 = bitcast i64* %shadow to i64*
  %safe.247 = or i1 %924, %925
  %select.ptr.248 = select i1 %safe.247, i64* %923, i64* %926
  %927 = load i64, i64* %923
  %select.val.249 = select i1 %924, i64 %922, i64 %927
  store i64 %select.val.249, i64* %select.ptr.248, align 8
  %928 = getelementptr inbounds i64, i64* %1, i64 5
  %929 = load i1, i1* %out.
  %930 = icmp slt i64 5, %len.1
  %931 = bitcast i64* %shadow to i64*
  %safe.250 = or i1 %929, %930
  %select.ptr.251 = select i1 %safe.250, i64* %928, i64* %931
  %932 = load i64, i64* %select.ptr.251, align 8
  %933 = trunc i64 %932 to i32
  %934 = sext i32 %933 to i64
  %935 = getelementptr inbounds i64, i64* %2, i64 5
  %936 = load i1, i1* %out.
  %937 = icmp slt i64 5, %len.2
  %938 = bitcast i64* %shadow to i64*
  %safe.252 = or i1 %936, %937
  %select.ptr.253 = select i1 %safe.252, i64* %935, i64* %938
  %939 = load i64, i64* %select.ptr.253, align 8
  %940 = trunc i64 %939 to i32
  %941 = sext i32 %940 to i64
  %942 = mul nsw i64 %934, %941
  %943 = getelementptr inbounds i64, i64* %1, i64 3
  %944 = load i1, i1* %out.
  %945 = icmp slt i64 3, %len.1
  %946 = bitcast i64* %shadow to i64*
  %safe.254 = or i1 %944, %945
  %select.ptr.255 = select i1 %safe.254, i64* %943, i64* %946
  %947 = load i64, i64* %select.ptr.255, align 8
  %948 = trunc i64 %947 to i32
  %949 = sext i32 %948 to i64
  %950 = getelementptr inbounds i64, i64* %2, i64 7
  %951 = load i1, i1* %out.
  %952 = icmp slt i64 7, %len.2
  %953 = bitcast i64* %shadow to i64*
  %safe.256 = or i1 %951, %952
  %select.ptr.257 = select i1 %safe.256, i64* %950, i64* %953
  %954 = load i64, i64* %select.ptr.257, align 8
  %955 = trunc i64 %954 to i32
  %956 = sext i32 %955 to i64
  %957 = mul nsw i64 %949, %956
  %958 = add nsw i64 %942, %957
  %959 = getelementptr inbounds i64, i64* %1, i64 7
  %960 = load i1, i1* %out.
  %961 = icmp slt i64 7, %len.1
  %962 = bitcast i64* %shadow to i64*
  %safe.258 = or i1 %960, %961
  %select.ptr.259 = select i1 %safe.258, i64* %959, i64* %962
  %963 = load i64, i64* %select.ptr.259, align 8
  %964 = trunc i64 %963 to i32
  %965 = sext i32 %964 to i64
  %966 = getelementptr inbounds i64, i64* %2, i64 3
  %967 = load i1, i1* %out.
  %968 = icmp slt i64 3, %len.2
  %969 = bitcast i64* %shadow to i64*
  %safe.260 = or i1 %967, %968
  %select.ptr.261 = select i1 %safe.260, i64* %966, i64* %969
  %970 = load i64, i64* %select.ptr.261, align 8
  %971 = trunc i64 %970 to i32
  %972 = sext i32 %971 to i64
  %973 = mul nsw i64 %965, %972
  %974 = add nsw i64 %958, %973
  %975 = getelementptr inbounds i64, i64* %1, i64 1
  %976 = load i1, i1* %out.
  %977 = icmp slt i64 1, %len.1
  %978 = bitcast i64* %shadow to i64*
  %safe.262 = or i1 %976, %977
  %select.ptr.263 = select i1 %safe.262, i64* %975, i64* %978
  %979 = load i64, i64* %select.ptr.263, align 8
  %980 = trunc i64 %979 to i32
  %981 = sext i32 %980 to i64
  %982 = getelementptr inbounds i64, i64* %2, i64 9
  %983 = load i1, i1* %out.
  %984 = icmp slt i64 9, %len.2
  %985 = bitcast i64* %shadow to i64*
  %safe.264 = or i1 %983, %984
  %select.ptr.265 = select i1 %safe.264, i64* %982, i64* %985
  %986 = load i64, i64* %select.ptr.265, align 8
  %987 = trunc i64 %986 to i32
  %988 = sext i32 %987 to i64
  %989 = mul nsw i64 %981, %988
  %990 = add nsw i64 %974, %989
  %991 = getelementptr inbounds i64, i64* %1, i64 9
  %992 = load i1, i1* %out.
  %993 = icmp slt i64 9, %len.1
  %994 = bitcast i64* %shadow to i64*
  %safe.266 = or i1 %992, %993
  %select.ptr.267 = select i1 %safe.266, i64* %991, i64* %994
  %995 = load i64, i64* %select.ptr.267, align 8
  %996 = trunc i64 %995 to i32
  %997 = sext i32 %996 to i64
  %998 = getelementptr inbounds i64, i64* %2, i64 1
  %999 = load i1, i1* %out.
  %1000 = icmp slt i64 1, %len.2
  %1001 = bitcast i64* %shadow to i64*
  %safe.268 = or i1 %999, %1000
  %select.ptr.269 = select i1 %safe.268, i64* %998, i64* %1001
  %1002 = load i64, i64* %select.ptr.269, align 8
  %1003 = trunc i64 %1002 to i32
  %1004 = sext i32 %1003 to i64
  %1005 = mul nsw i64 %997, %1004
  %1006 = add nsw i64 %990, %1005
  %1007 = mul nsw i64 2, %1006
  %1008 = getelementptr inbounds i64, i64* %1, i64 4
  %1009 = load i1, i1* %out.
  %1010 = icmp slt i64 4, %len.1
  %1011 = bitcast i64* %shadow to i64*
  %safe.270 = or i1 %1009, %1010
  %select.ptr.271 = select i1 %safe.270, i64* %1008, i64* %1011
  %1012 = load i64, i64* %select.ptr.271, align 8
  %1013 = trunc i64 %1012 to i32
  %1014 = sext i32 %1013 to i64
  %1015 = getelementptr inbounds i64, i64* %2, i64 6
  %1016 = load i1, i1* %out.
  %1017 = icmp slt i64 6, %len.2
  %1018 = bitcast i64* %shadow to i64*
  %safe.272 = or i1 %1016, %1017
  %select.ptr.273 = select i1 %safe.272, i64* %1015, i64* %1018
  %1019 = load i64, i64* %select.ptr.273, align 8
  %1020 = trunc i64 %1019 to i32
  %1021 = sext i32 %1020 to i64
  %1022 = mul nsw i64 %1014, %1021
  %1023 = add nsw i64 %1007, %1022
  %1024 = getelementptr inbounds i64, i64* %1, i64 6
  %1025 = load i1, i1* %out.
  %1026 = icmp slt i64 6, %len.1
  %1027 = bitcast i64* %shadow to i64*
  %safe.274 = or i1 %1025, %1026
  %select.ptr.275 = select i1 %safe.274, i64* %1024, i64* %1027
  %1028 = load i64, i64* %select.ptr.275, align 8
  %1029 = trunc i64 %1028 to i32
  %1030 = sext i32 %1029 to i64
  %1031 = getelementptr inbounds i64, i64* %2, i64 4
  %1032 = load i1, i1* %out.
  %1033 = icmp slt i64 4, %len.2
  %1034 = bitcast i64* %shadow to i64*
  %safe.276 = or i1 %1032, %1033
  %select.ptr.277 = select i1 %safe.276, i64* %1031, i64* %1034
  %1035 = load i64, i64* %select.ptr.277, align 8
  %1036 = trunc i64 %1035 to i32
  %1037 = sext i32 %1036 to i64
  %1038 = mul nsw i64 %1030, %1037
  %1039 = add nsw i64 %1023, %1038
  %1040 = getelementptr inbounds i64, i64* %1, i64 2
  %1041 = load i1, i1* %out.
  %1042 = icmp slt i64 2, %len.1
  %1043 = bitcast i64* %shadow to i64*
  %safe.278 = or i1 %1041, %1042
  %select.ptr.279 = select i1 %safe.278, i64* %1040, i64* %1043
  %1044 = load i64, i64* %select.ptr.279, align 8
  %1045 = trunc i64 %1044 to i32
  %1046 = sext i32 %1045 to i64
  %1047 = getelementptr inbounds i64, i64* %2, i64 8
  %1048 = load i1, i1* %out.
  %1049 = icmp slt i64 8, %len.2
  %1050 = bitcast i64* %shadow to i64*
  %safe.280 = or i1 %1048, %1049
  %select.ptr.281 = select i1 %safe.280, i64* %1047, i64* %1050
  %1051 = load i64, i64* %select.ptr.281, align 8
  %1052 = trunc i64 %1051 to i32
  %1053 = sext i32 %1052 to i64
  %1054 = mul nsw i64 %1046, %1053
  %1055 = add nsw i64 %1039, %1054
  %1056 = getelementptr inbounds i64, i64* %1, i64 8
  %1057 = load i1, i1* %out.
  %1058 = icmp slt i64 8, %len.1
  %1059 = bitcast i64* %shadow to i64*
  %safe.282 = or i1 %1057, %1058
  %select.ptr.283 = select i1 %safe.282, i64* %1056, i64* %1059
  %1060 = load i64, i64* %select.ptr.283, align 8
  %1061 = trunc i64 %1060 to i32
  %1062 = sext i32 %1061 to i64
  %1063 = getelementptr inbounds i64, i64* %2, i64 2
  %1064 = load i1, i1* %out.
  %1065 = icmp slt i64 2, %len.2
  %1066 = bitcast i64* %shadow to i64*
  %safe.284 = or i1 %1064, %1065
  %select.ptr.285 = select i1 %safe.284, i64* %1063, i64* %1066
  %1067 = load i64, i64* %select.ptr.285, align 8
  %1068 = trunc i64 %1067 to i32
  %1069 = sext i32 %1068 to i64
  %1070 = mul nsw i64 %1062, %1069
  %1071 = add nsw i64 %1055, %1070
  %1072 = getelementptr inbounds i64, i64* %0, i64 10
  %1073 = load i1, i1* %out.
  %1074 = icmp slt i64 10, %len.
  %1075 = bitcast i64* %shadow to i64*
  %safe.286 = or i1 %1073, %1074
  %select.ptr.287 = select i1 %safe.286, i64* %1072, i64* %1075
  %1076 = load i64, i64* %1072
  %select.val.288 = select i1 %1073, i64 %1071, i64 %1076
  store i64 %select.val.288, i64* %select.ptr.287, align 8
  %1077 = getelementptr inbounds i64, i64* %1, i64 5
  %1078 = load i1, i1* %out.
  %1079 = icmp slt i64 5, %len.1
  %1080 = bitcast i64* %shadow to i64*
  %safe.289 = or i1 %1078, %1079
  %select.ptr.290 = select i1 %safe.289, i64* %1077, i64* %1080
  %1081 = load i64, i64* %select.ptr.290, align 8
  %1082 = trunc i64 %1081 to i32
  %1083 = sext i32 %1082 to i64
  %1084 = getelementptr inbounds i64, i64* %2, i64 6
  %1085 = load i1, i1* %out.
  %1086 = icmp slt i64 6, %len.2
  %1087 = bitcast i64* %shadow to i64*
  %safe.291 = or i1 %1085, %1086
  %select.ptr.292 = select i1 %safe.291, i64* %1084, i64* %1087
  %1088 = load i64, i64* %select.ptr.292, align 8
  %1089 = trunc i64 %1088 to i32
  %1090 = sext i32 %1089 to i64
  %1091 = mul nsw i64 %1083, %1090
  %1092 = getelementptr inbounds i64, i64* %1, i64 6
  %1093 = load i1, i1* %out.
  %1094 = icmp slt i64 6, %len.1
  %1095 = bitcast i64* %shadow to i64*
  %safe.293 = or i1 %1093, %1094
  %select.ptr.294 = select i1 %safe.293, i64* %1092, i64* %1095
  %1096 = load i64, i64* %select.ptr.294, align 8
  %1097 = trunc i64 %1096 to i32
  %1098 = sext i32 %1097 to i64
  %1099 = getelementptr inbounds i64, i64* %2, i64 5
  %1100 = load i1, i1* %out.
  %1101 = icmp slt i64 5, %len.2
  %1102 = bitcast i64* %shadow to i64*
  %safe.295 = or i1 %1100, %1101
  %select.ptr.296 = select i1 %safe.295, i64* %1099, i64* %1102
  %1103 = load i64, i64* %select.ptr.296, align 8
  %1104 = trunc i64 %1103 to i32
  %1105 = sext i32 %1104 to i64
  %1106 = mul nsw i64 %1098, %1105
  %1107 = add nsw i64 %1091, %1106
  %1108 = getelementptr inbounds i64, i64* %1, i64 4
  %1109 = load i1, i1* %out.
  %1110 = icmp slt i64 4, %len.1
  %1111 = bitcast i64* %shadow to i64*
  %safe.297 = or i1 %1109, %1110
  %select.ptr.298 = select i1 %safe.297, i64* %1108, i64* %1111
  %1112 = load i64, i64* %select.ptr.298, align 8
  %1113 = trunc i64 %1112 to i32
  %1114 = sext i32 %1113 to i64
  %1115 = getelementptr inbounds i64, i64* %2, i64 7
  %1116 = load i1, i1* %out.
  %1117 = icmp slt i64 7, %len.2
  %1118 = bitcast i64* %shadow to i64*
  %safe.299 = or i1 %1116, %1117
  %select.ptr.300 = select i1 %safe.299, i64* %1115, i64* %1118
  %1119 = load i64, i64* %select.ptr.300, align 8
  %1120 = trunc i64 %1119 to i32
  %1121 = sext i32 %1120 to i64
  %1122 = mul nsw i64 %1114, %1121
  %1123 = add nsw i64 %1107, %1122
  %1124 = getelementptr inbounds i64, i64* %1, i64 7
  %1125 = load i1, i1* %out.
  %1126 = icmp slt i64 7, %len.1
  %1127 = bitcast i64* %shadow to i64*
  %safe.301 = or i1 %1125, %1126
  %select.ptr.302 = select i1 %safe.301, i64* %1124, i64* %1127
  %1128 = load i64, i64* %select.ptr.302, align 8
  %1129 = trunc i64 %1128 to i32
  %1130 = sext i32 %1129 to i64
  %1131 = getelementptr inbounds i64, i64* %2, i64 4
  %1132 = load i1, i1* %out.
  %1133 = icmp slt i64 4, %len.2
  %1134 = bitcast i64* %shadow to i64*
  %safe.303 = or i1 %1132, %1133
  %select.ptr.304 = select i1 %safe.303, i64* %1131, i64* %1134
  %1135 = load i64, i64* %select.ptr.304, align 8
  %1136 = trunc i64 %1135 to i32
  %1137 = sext i32 %1136 to i64
  %1138 = mul nsw i64 %1130, %1137
  %1139 = add nsw i64 %1123, %1138
  %1140 = getelementptr inbounds i64, i64* %1, i64 3
  %1141 = load i1, i1* %out.
  %1142 = icmp slt i64 3, %len.1
  %1143 = bitcast i64* %shadow to i64*
  %safe.305 = or i1 %1141, %1142
  %select.ptr.306 = select i1 %safe.305, i64* %1140, i64* %1143
  %1144 = load i64, i64* %select.ptr.306, align 8
  %1145 = trunc i64 %1144 to i32
  %1146 = sext i32 %1145 to i64
  %1147 = getelementptr inbounds i64, i64* %2, i64 8
  %1148 = load i1, i1* %out.
  %1149 = icmp slt i64 8, %len.2
  %1150 = bitcast i64* %shadow to i64*
  %safe.307 = or i1 %1148, %1149
  %select.ptr.308 = select i1 %safe.307, i64* %1147, i64* %1150
  %1151 = load i64, i64* %select.ptr.308, align 8
  %1152 = trunc i64 %1151 to i32
  %1153 = sext i32 %1152 to i64
  %1154 = mul nsw i64 %1146, %1153
  %1155 = add nsw i64 %1139, %1154
  %1156 = getelementptr inbounds i64, i64* %1, i64 8
  %1157 = load i1, i1* %out.
  %1158 = icmp slt i64 8, %len.1
  %1159 = bitcast i64* %shadow to i64*
  %safe.309 = or i1 %1157, %1158
  %select.ptr.310 = select i1 %safe.309, i64* %1156, i64* %1159
  %1160 = load i64, i64* %select.ptr.310, align 8
  %1161 = trunc i64 %1160 to i32
  %1162 = sext i32 %1161 to i64
  %1163 = getelementptr inbounds i64, i64* %2, i64 3
  %1164 = load i1, i1* %out.
  %1165 = icmp slt i64 3, %len.2
  %1166 = bitcast i64* %shadow to i64*
  %safe.311 = or i1 %1164, %1165
  %select.ptr.312 = select i1 %safe.311, i64* %1163, i64* %1166
  %1167 = load i64, i64* %select.ptr.312, align 8
  %1168 = trunc i64 %1167 to i32
  %1169 = sext i32 %1168 to i64
  %1170 = mul nsw i64 %1162, %1169
  %1171 = add nsw i64 %1155, %1170
  %1172 = getelementptr inbounds i64, i64* %1, i64 2
  %1173 = load i1, i1* %out.
  %1174 = icmp slt i64 2, %len.1
  %1175 = bitcast i64* %shadow to i64*
  %safe.313 = or i1 %1173, %1174
  %select.ptr.314 = select i1 %safe.313, i64* %1172, i64* %1175
  %1176 = load i64, i64* %select.ptr.314, align 8
  %1177 = trunc i64 %1176 to i32
  %1178 = sext i32 %1177 to i64
  %1179 = getelementptr inbounds i64, i64* %2, i64 9
  %1180 = load i1, i1* %out.
  %1181 = icmp slt i64 9, %len.2
  %1182 = bitcast i64* %shadow to i64*
  %safe.315 = or i1 %1180, %1181
  %select.ptr.316 = select i1 %safe.315, i64* %1179, i64* %1182
  %1183 = load i64, i64* %select.ptr.316, align 8
  %1184 = trunc i64 %1183 to i32
  %1185 = sext i32 %1184 to i64
  %1186 = mul nsw i64 %1178, %1185
  %1187 = add nsw i64 %1171, %1186
  %1188 = getelementptr inbounds i64, i64* %1, i64 9
  %1189 = load i1, i1* %out.
  %1190 = icmp slt i64 9, %len.1
  %1191 = bitcast i64* %shadow to i64*
  %safe.317 = or i1 %1189, %1190
  %select.ptr.318 = select i1 %safe.317, i64* %1188, i64* %1191
  %1192 = load i64, i64* %select.ptr.318, align 8
  %1193 = trunc i64 %1192 to i32
  %1194 = sext i32 %1193 to i64
  %1195 = getelementptr inbounds i64, i64* %2, i64 2
  %1196 = load i1, i1* %out.
  %1197 = icmp slt i64 2, %len.2
  %1198 = bitcast i64* %shadow to i64*
  %safe.319 = or i1 %1196, %1197
  %select.ptr.320 = select i1 %safe.319, i64* %1195, i64* %1198
  %1199 = load i64, i64* %select.ptr.320, align 8
  %1200 = trunc i64 %1199 to i32
  %1201 = sext i32 %1200 to i64
  %1202 = mul nsw i64 %1194, %1201
  %1203 = add nsw i64 %1187, %1202
  %1204 = getelementptr inbounds i64, i64* %0, i64 11
  %1205 = load i1, i1* %out.
  %1206 = icmp slt i64 11, %len.
  %1207 = bitcast i64* %shadow to i64*
  %safe.321 = or i1 %1205, %1206
  %select.ptr.322 = select i1 %safe.321, i64* %1204, i64* %1207
  %1208 = load i64, i64* %1204
  %select.val.323 = select i1 %1205, i64 %1203, i64 %1208
  store i64 %select.val.323, i64* %select.ptr.322, align 8
  %1209 = getelementptr inbounds i64, i64* %1, i64 6
  %1210 = load i1, i1* %out.
  %1211 = icmp slt i64 6, %len.1
  %1212 = bitcast i64* %shadow to i64*
  %safe.324 = or i1 %1210, %1211
  %select.ptr.325 = select i1 %safe.324, i64* %1209, i64* %1212
  %1213 = load i64, i64* %select.ptr.325, align 8
  %1214 = trunc i64 %1213 to i32
  %1215 = sext i32 %1214 to i64
  %1216 = getelementptr inbounds i64, i64* %2, i64 6
  %1217 = load i1, i1* %out.
  %1218 = icmp slt i64 6, %len.2
  %1219 = bitcast i64* %shadow to i64*
  %safe.326 = or i1 %1217, %1218
  %select.ptr.327 = select i1 %safe.326, i64* %1216, i64* %1219
  %1220 = load i64, i64* %select.ptr.327, align 8
  %1221 = trunc i64 %1220 to i32
  %1222 = sext i32 %1221 to i64
  %1223 = mul nsw i64 %1215, %1222
  %1224 = getelementptr inbounds i64, i64* %1, i64 5
  %1225 = load i1, i1* %out.
  %1226 = icmp slt i64 5, %len.1
  %1227 = bitcast i64* %shadow to i64*
  %safe.328 = or i1 %1225, %1226
  %select.ptr.329 = select i1 %safe.328, i64* %1224, i64* %1227
  %1228 = load i64, i64* %select.ptr.329, align 8
  %1229 = trunc i64 %1228 to i32
  %1230 = sext i32 %1229 to i64
  %1231 = getelementptr inbounds i64, i64* %2, i64 7
  %1232 = load i1, i1* %out.
  %1233 = icmp slt i64 7, %len.2
  %1234 = bitcast i64* %shadow to i64*
  %safe.330 = or i1 %1232, %1233
  %select.ptr.331 = select i1 %safe.330, i64* %1231, i64* %1234
  %1235 = load i64, i64* %select.ptr.331, align 8
  %1236 = trunc i64 %1235 to i32
  %1237 = sext i32 %1236 to i64
  %1238 = mul nsw i64 %1230, %1237
  %1239 = getelementptr inbounds i64, i64* %1, i64 7
  %1240 = load i1, i1* %out.
  %1241 = icmp slt i64 7, %len.1
  %1242 = bitcast i64* %shadow to i64*
  %safe.332 = or i1 %1240, %1241
  %select.ptr.333 = select i1 %safe.332, i64* %1239, i64* %1242
  %1243 = load i64, i64* %select.ptr.333, align 8
  %1244 = trunc i64 %1243 to i32
  %1245 = sext i32 %1244 to i64
  %1246 = getelementptr inbounds i64, i64* %2, i64 5
  %1247 = load i1, i1* %out.
  %1248 = icmp slt i64 5, %len.2
  %1249 = bitcast i64* %shadow to i64*
  %safe.334 = or i1 %1247, %1248
  %select.ptr.335 = select i1 %safe.334, i64* %1246, i64* %1249
  %1250 = load i64, i64* %select.ptr.335, align 8
  %1251 = trunc i64 %1250 to i32
  %1252 = sext i32 %1251 to i64
  %1253 = mul nsw i64 %1245, %1252
  %1254 = add nsw i64 %1238, %1253
  %1255 = getelementptr inbounds i64, i64* %1, i64 3
  %1256 = load i1, i1* %out.
  %1257 = icmp slt i64 3, %len.1
  %1258 = bitcast i64* %shadow to i64*
  %safe.336 = or i1 %1256, %1257
  %select.ptr.337 = select i1 %safe.336, i64* %1255, i64* %1258
  %1259 = load i64, i64* %select.ptr.337, align 8
  %1260 = trunc i64 %1259 to i32
  %1261 = sext i32 %1260 to i64
  %1262 = getelementptr inbounds i64, i64* %2, i64 9
  %1263 = load i1, i1* %out.
  %1264 = icmp slt i64 9, %len.2
  %1265 = bitcast i64* %shadow to i64*
  %safe.338 = or i1 %1263, %1264
  %select.ptr.339 = select i1 %safe.338, i64* %1262, i64* %1265
  %1266 = load i64, i64* %select.ptr.339, align 8
  %1267 = trunc i64 %1266 to i32
  %1268 = sext i32 %1267 to i64
  %1269 = mul nsw i64 %1261, %1268
  %1270 = add nsw i64 %1254, %1269
  %1271 = getelementptr inbounds i64, i64* %1, i64 9
  %1272 = load i1, i1* %out.
  %1273 = icmp slt i64 9, %len.1
  %1274 = bitcast i64* %shadow to i64*
  %safe.340 = or i1 %1272, %1273
  %select.ptr.341 = select i1 %safe.340, i64* %1271, i64* %1274
  %1275 = load i64, i64* %select.ptr.341, align 8
  %1276 = trunc i64 %1275 to i32
  %1277 = sext i32 %1276 to i64
  %1278 = getelementptr inbounds i64, i64* %2, i64 3
  %1279 = load i1, i1* %out.
  %1280 = icmp slt i64 3, %len.2
  %1281 = bitcast i64* %shadow to i64*
  %safe.342 = or i1 %1279, %1280
  %select.ptr.343 = select i1 %safe.342, i64* %1278, i64* %1281
  %1282 = load i64, i64* %select.ptr.343, align 8
  %1283 = trunc i64 %1282 to i32
  %1284 = sext i32 %1283 to i64
  %1285 = mul nsw i64 %1277, %1284
  %1286 = add nsw i64 %1270, %1285
  %1287 = mul nsw i64 2, %1286
  %1288 = add nsw i64 %1223, %1287
  %1289 = getelementptr inbounds i64, i64* %1, i64 4
  %1290 = load i1, i1* %out.
  %1291 = icmp slt i64 4, %len.1
  %1292 = bitcast i64* %shadow to i64*
  %safe.344 = or i1 %1290, %1291
  %select.ptr.345 = select i1 %safe.344, i64* %1289, i64* %1292
  %1293 = load i64, i64* %select.ptr.345, align 8
  %1294 = trunc i64 %1293 to i32
  %1295 = sext i32 %1294 to i64
  %1296 = getelementptr inbounds i64, i64* %2, i64 8
  %1297 = load i1, i1* %out.
  %1298 = icmp slt i64 8, %len.2
  %1299 = bitcast i64* %shadow to i64*
  %safe.346 = or i1 %1297, %1298
  %select.ptr.347 = select i1 %safe.346, i64* %1296, i64* %1299
  %1300 = load i64, i64* %select.ptr.347, align 8
  %1301 = trunc i64 %1300 to i32
  %1302 = sext i32 %1301 to i64
  %1303 = mul nsw i64 %1295, %1302
  %1304 = add nsw i64 %1288, %1303
  %1305 = getelementptr inbounds i64, i64* %1, i64 8
  %1306 = load i1, i1* %out.
  %1307 = icmp slt i64 8, %len.1
  %1308 = bitcast i64* %shadow to i64*
  %safe.348 = or i1 %1306, %1307
  %select.ptr.349 = select i1 %safe.348, i64* %1305, i64* %1308
  %1309 = load i64, i64* %select.ptr.349, align 8
  %1310 = trunc i64 %1309 to i32
  %1311 = sext i32 %1310 to i64
  %1312 = getelementptr inbounds i64, i64* %2, i64 4
  %1313 = load i1, i1* %out.
  %1314 = icmp slt i64 4, %len.2
  %1315 = bitcast i64* %shadow to i64*
  %safe.350 = or i1 %1313, %1314
  %select.ptr.351 = select i1 %safe.350, i64* %1312, i64* %1315
  %1316 = load i64, i64* %select.ptr.351, align 8
  %1317 = trunc i64 %1316 to i32
  %1318 = sext i32 %1317 to i64
  %1319 = mul nsw i64 %1311, %1318
  %1320 = add nsw i64 %1304, %1319
  %1321 = getelementptr inbounds i64, i64* %0, i64 12
  %1322 = load i1, i1* %out.
  %1323 = icmp slt i64 12, %len.
  %1324 = bitcast i64* %shadow to i64*
  %safe.352 = or i1 %1322, %1323
  %select.ptr.353 = select i1 %safe.352, i64* %1321, i64* %1324
  %1325 = load i64, i64* %1321
  %select.val.354 = select i1 %1322, i64 %1320, i64 %1325
  store i64 %select.val.354, i64* %select.ptr.353, align 8
  %1326 = getelementptr inbounds i64, i64* %1, i64 6
  %1327 = load i1, i1* %out.
  %1328 = icmp slt i64 6, %len.1
  %1329 = bitcast i64* %shadow to i64*
  %safe.355 = or i1 %1327, %1328
  %select.ptr.356 = select i1 %safe.355, i64* %1326, i64* %1329
  %1330 = load i64, i64* %select.ptr.356, align 8
  %1331 = trunc i64 %1330 to i32
  %1332 = sext i32 %1331 to i64
  %1333 = getelementptr inbounds i64, i64* %2, i64 7
  %1334 = load i1, i1* %out.
  %1335 = icmp slt i64 7, %len.2
  %1336 = bitcast i64* %shadow to i64*
  %safe.357 = or i1 %1334, %1335
  %select.ptr.358 = select i1 %safe.357, i64* %1333, i64* %1336
  %1337 = load i64, i64* %select.ptr.358, align 8
  %1338 = trunc i64 %1337 to i32
  %1339 = sext i32 %1338 to i64
  %1340 = mul nsw i64 %1332, %1339
  %1341 = getelementptr inbounds i64, i64* %1, i64 7
  %1342 = load i1, i1* %out.
  %1343 = icmp slt i64 7, %len.1
  %1344 = bitcast i64* %shadow to i64*
  %safe.359 = or i1 %1342, %1343
  %select.ptr.360 = select i1 %safe.359, i64* %1341, i64* %1344
  %1345 = load i64, i64* %select.ptr.360, align 8
  %1346 = trunc i64 %1345 to i32
  %1347 = sext i32 %1346 to i64
  %1348 = getelementptr inbounds i64, i64* %2, i64 6
  %1349 = load i1, i1* %out.
  %1350 = icmp slt i64 6, %len.2
  %1351 = bitcast i64* %shadow to i64*
  %safe.361 = or i1 %1349, %1350
  %select.ptr.362 = select i1 %safe.361, i64* %1348, i64* %1351
  %1352 = load i64, i64* %select.ptr.362, align 8
  %1353 = trunc i64 %1352 to i32
  %1354 = sext i32 %1353 to i64
  %1355 = mul nsw i64 %1347, %1354
  %1356 = add nsw i64 %1340, %1355
  %1357 = getelementptr inbounds i64, i64* %1, i64 5
  %1358 = load i1, i1* %out.
  %1359 = icmp slt i64 5, %len.1
  %1360 = bitcast i64* %shadow to i64*
  %safe.363 = or i1 %1358, %1359
  %select.ptr.364 = select i1 %safe.363, i64* %1357, i64* %1360
  %1361 = load i64, i64* %select.ptr.364, align 8
  %1362 = trunc i64 %1361 to i32
  %1363 = sext i32 %1362 to i64
  %1364 = getelementptr inbounds i64, i64* %2, i64 8
  %1365 = load i1, i1* %out.
  %1366 = icmp slt i64 8, %len.2
  %1367 = bitcast i64* %shadow to i64*
  %safe.365 = or i1 %1365, %1366
  %select.ptr.366 = select i1 %safe.365, i64* %1364, i64* %1367
  %1368 = load i64, i64* %select.ptr.366, align 8
  %1369 = trunc i64 %1368 to i32
  %1370 = sext i32 %1369 to i64
  %1371 = mul nsw i64 %1363, %1370
  %1372 = add nsw i64 %1356, %1371
  %1373 = getelementptr inbounds i64, i64* %1, i64 8
  %1374 = load i1, i1* %out.
  %1375 = icmp slt i64 8, %len.1
  %1376 = bitcast i64* %shadow to i64*
  %safe.367 = or i1 %1374, %1375
  %select.ptr.368 = select i1 %safe.367, i64* %1373, i64* %1376
  %1377 = load i64, i64* %select.ptr.368, align 8
  %1378 = trunc i64 %1377 to i32
  %1379 = sext i32 %1378 to i64
  %1380 = getelementptr inbounds i64, i64* %2, i64 5
  %1381 = load i1, i1* %out.
  %1382 = icmp slt i64 5, %len.2
  %1383 = bitcast i64* %shadow to i64*
  %safe.369 = or i1 %1381, %1382
  %select.ptr.370 = select i1 %safe.369, i64* %1380, i64* %1383
  %1384 = load i64, i64* %select.ptr.370, align 8
  %1385 = trunc i64 %1384 to i32
  %1386 = sext i32 %1385 to i64
  %1387 = mul nsw i64 %1379, %1386
  %1388 = add nsw i64 %1372, %1387
  %1389 = getelementptr inbounds i64, i64* %1, i64 4
  %1390 = load i1, i1* %out.
  %1391 = icmp slt i64 4, %len.1
  %1392 = bitcast i64* %shadow to i64*
  %safe.371 = or i1 %1390, %1391
  %select.ptr.372 = select i1 %safe.371, i64* %1389, i64* %1392
  %1393 = load i64, i64* %select.ptr.372, align 8
  %1394 = trunc i64 %1393 to i32
  %1395 = sext i32 %1394 to i64
  %1396 = getelementptr inbounds i64, i64* %2, i64 9
  %1397 = load i1, i1* %out.
  %1398 = icmp slt i64 9, %len.2
  %1399 = bitcast i64* %shadow to i64*
  %safe.373 = or i1 %1397, %1398
  %select.ptr.374 = select i1 %safe.373, i64* %1396, i64* %1399
  %1400 = load i64, i64* %select.ptr.374, align 8
  %1401 = trunc i64 %1400 to i32
  %1402 = sext i32 %1401 to i64
  %1403 = mul nsw i64 %1395, %1402
  %1404 = add nsw i64 %1388, %1403
  %1405 = getelementptr inbounds i64, i64* %1, i64 9
  %1406 = load i1, i1* %out.
  %1407 = icmp slt i64 9, %len.1
  %1408 = bitcast i64* %shadow to i64*
  %safe.375 = or i1 %1406, %1407
  %select.ptr.376 = select i1 %safe.375, i64* %1405, i64* %1408
  %1409 = load i64, i64* %select.ptr.376, align 8
  %1410 = trunc i64 %1409 to i32
  %1411 = sext i32 %1410 to i64
  %1412 = getelementptr inbounds i64, i64* %2, i64 4
  %1413 = load i1, i1* %out.
  %1414 = icmp slt i64 4, %len.2
  %1415 = bitcast i64* %shadow to i64*
  %safe.377 = or i1 %1413, %1414
  %select.ptr.378 = select i1 %safe.377, i64* %1412, i64* %1415
  %1416 = load i64, i64* %select.ptr.378, align 8
  %1417 = trunc i64 %1416 to i32
  %1418 = sext i32 %1417 to i64
  %1419 = mul nsw i64 %1411, %1418
  %1420 = add nsw i64 %1404, %1419
  %1421 = getelementptr inbounds i64, i64* %0, i64 13
  %1422 = load i1, i1* %out.
  %1423 = icmp slt i64 13, %len.
  %1424 = bitcast i64* %shadow to i64*
  %safe.379 = or i1 %1422, %1423
  %select.ptr.380 = select i1 %safe.379, i64* %1421, i64* %1424
  %1425 = load i64, i64* %1421
  %select.val.381 = select i1 %1422, i64 %1420, i64 %1425
  store i64 %select.val.381, i64* %select.ptr.380, align 8
  %1426 = getelementptr inbounds i64, i64* %1, i64 7
  %1427 = load i1, i1* %out.
  %1428 = icmp slt i64 7, %len.1
  %1429 = bitcast i64* %shadow to i64*
  %safe.382 = or i1 %1427, %1428
  %select.ptr.383 = select i1 %safe.382, i64* %1426, i64* %1429
  %1430 = load i64, i64* %select.ptr.383, align 8
  %1431 = trunc i64 %1430 to i32
  %1432 = sext i32 %1431 to i64
  %1433 = getelementptr inbounds i64, i64* %2, i64 7
  %1434 = load i1, i1* %out.
  %1435 = icmp slt i64 7, %len.2
  %1436 = bitcast i64* %shadow to i64*
  %safe.384 = or i1 %1434, %1435
  %select.ptr.385 = select i1 %safe.384, i64* %1433, i64* %1436
  %1437 = load i64, i64* %select.ptr.385, align 8
  %1438 = trunc i64 %1437 to i32
  %1439 = sext i32 %1438 to i64
  %1440 = mul nsw i64 %1432, %1439
  %1441 = getelementptr inbounds i64, i64* %1, i64 5
  %1442 = load i1, i1* %out.
  %1443 = icmp slt i64 5, %len.1
  %1444 = bitcast i64* %shadow to i64*
  %safe.386 = or i1 %1442, %1443
  %select.ptr.387 = select i1 %safe.386, i64* %1441, i64* %1444
  %1445 = load i64, i64* %select.ptr.387, align 8
  %1446 = trunc i64 %1445 to i32
  %1447 = sext i32 %1446 to i64
  %1448 = getelementptr inbounds i64, i64* %2, i64 9
  %1449 = load i1, i1* %out.
  %1450 = icmp slt i64 9, %len.2
  %1451 = bitcast i64* %shadow to i64*
  %safe.388 = or i1 %1449, %1450
  %select.ptr.389 = select i1 %safe.388, i64* %1448, i64* %1451
  %1452 = load i64, i64* %select.ptr.389, align 8
  %1453 = trunc i64 %1452 to i32
  %1454 = sext i32 %1453 to i64
  %1455 = mul nsw i64 %1447, %1454
  %1456 = add nsw i64 %1440, %1455
  %1457 = getelementptr inbounds i64, i64* %1, i64 9
  %1458 = load i1, i1* %out.
  %1459 = icmp slt i64 9, %len.1
  %1460 = bitcast i64* %shadow to i64*
  %safe.390 = or i1 %1458, %1459
  %select.ptr.391 = select i1 %safe.390, i64* %1457, i64* %1460
  %1461 = load i64, i64* %select.ptr.391, align 8
  %1462 = trunc i64 %1461 to i32
  %1463 = sext i32 %1462 to i64
  %1464 = getelementptr inbounds i64, i64* %2, i64 5
  %1465 = load i1, i1* %out.
  %1466 = icmp slt i64 5, %len.2
  %1467 = bitcast i64* %shadow to i64*
  %safe.392 = or i1 %1465, %1466
  %select.ptr.393 = select i1 %safe.392, i64* %1464, i64* %1467
  %1468 = load i64, i64* %select.ptr.393, align 8
  %1469 = trunc i64 %1468 to i32
  %1470 = sext i32 %1469 to i64
  %1471 = mul nsw i64 %1463, %1470
  %1472 = add nsw i64 %1456, %1471
  %1473 = mul nsw i64 2, %1472
  %1474 = getelementptr inbounds i64, i64* %1, i64 6
  %1475 = load i1, i1* %out.
  %1476 = icmp slt i64 6, %len.1
  %1477 = bitcast i64* %shadow to i64*
  %safe.394 = or i1 %1475, %1476
  %select.ptr.395 = select i1 %safe.394, i64* %1474, i64* %1477
  %1478 = load i64, i64* %select.ptr.395, align 8
  %1479 = trunc i64 %1478 to i32
  %1480 = sext i32 %1479 to i64
  %1481 = getelementptr inbounds i64, i64* %2, i64 8
  %1482 = load i1, i1* %out.
  %1483 = icmp slt i64 8, %len.2
  %1484 = bitcast i64* %shadow to i64*
  %safe.396 = or i1 %1482, %1483
  %select.ptr.397 = select i1 %safe.396, i64* %1481, i64* %1484
  %1485 = load i64, i64* %select.ptr.397, align 8
  %1486 = trunc i64 %1485 to i32
  %1487 = sext i32 %1486 to i64
  %1488 = mul nsw i64 %1480, %1487
  %1489 = add nsw i64 %1473, %1488
  %1490 = getelementptr inbounds i64, i64* %1, i64 8
  %1491 = load i1, i1* %out.
  %1492 = icmp slt i64 8, %len.1
  %1493 = bitcast i64* %shadow to i64*
  %safe.398 = or i1 %1491, %1492
  %select.ptr.399 = select i1 %safe.398, i64* %1490, i64* %1493
  %1494 = load i64, i64* %select.ptr.399, align 8
  %1495 = trunc i64 %1494 to i32
  %1496 = sext i32 %1495 to i64
  %1497 = getelementptr inbounds i64, i64* %2, i64 6
  %1498 = load i1, i1* %out.
  %1499 = icmp slt i64 6, %len.2
  %1500 = bitcast i64* %shadow to i64*
  %safe.400 = or i1 %1498, %1499
  %select.ptr.401 = select i1 %safe.400, i64* %1497, i64* %1500
  %1501 = load i64, i64* %select.ptr.401, align 8
  %1502 = trunc i64 %1501 to i32
  %1503 = sext i32 %1502 to i64
  %1504 = mul nsw i64 %1496, %1503
  %1505 = add nsw i64 %1489, %1504
  %1506 = getelementptr inbounds i64, i64* %0, i64 14
  %1507 = load i1, i1* %out.
  %1508 = icmp slt i64 14, %len.
  %1509 = bitcast i64* %shadow to i64*
  %safe.402 = or i1 %1507, %1508
  %select.ptr.403 = select i1 %safe.402, i64* %1506, i64* %1509
  %1510 = load i64, i64* %1506
  %select.val.404 = select i1 %1507, i64 %1505, i64 %1510
  store i64 %select.val.404, i64* %select.ptr.403, align 8
  %1511 = getelementptr inbounds i64, i64* %1, i64 7
  %1512 = load i1, i1* %out.
  %1513 = icmp slt i64 7, %len.1
  %1514 = bitcast i64* %shadow to i64*
  %safe.405 = or i1 %1512, %1513
  %select.ptr.406 = select i1 %safe.405, i64* %1511, i64* %1514
  %1515 = load i64, i64* %select.ptr.406, align 8
  %1516 = trunc i64 %1515 to i32
  %1517 = sext i32 %1516 to i64
  %1518 = getelementptr inbounds i64, i64* %2, i64 8
  %1519 = load i1, i1* %out.
  %1520 = icmp slt i64 8, %len.2
  %1521 = bitcast i64* %shadow to i64*
  %safe.407 = or i1 %1519, %1520
  %select.ptr.408 = select i1 %safe.407, i64* %1518, i64* %1521
  %1522 = load i64, i64* %select.ptr.408, align 8
  %1523 = trunc i64 %1522 to i32
  %1524 = sext i32 %1523 to i64
  %1525 = mul nsw i64 %1517, %1524
  %1526 = getelementptr inbounds i64, i64* %1, i64 8
  %1527 = load i1, i1* %out.
  %1528 = icmp slt i64 8, %len.1
  %1529 = bitcast i64* %shadow to i64*
  %safe.409 = or i1 %1527, %1528
  %select.ptr.410 = select i1 %safe.409, i64* %1526, i64* %1529
  %1530 = load i64, i64* %select.ptr.410, align 8
  %1531 = trunc i64 %1530 to i32
  %1532 = sext i32 %1531 to i64
  %1533 = getelementptr inbounds i64, i64* %2, i64 7
  %1534 = load i1, i1* %out.
  %1535 = icmp slt i64 7, %len.2
  %1536 = bitcast i64* %shadow to i64*
  %safe.411 = or i1 %1534, %1535
  %select.ptr.412 = select i1 %safe.411, i64* %1533, i64* %1536
  %1537 = load i64, i64* %select.ptr.412, align 8
  %1538 = trunc i64 %1537 to i32
  %1539 = sext i32 %1538 to i64
  %1540 = mul nsw i64 %1532, %1539
  %1541 = add nsw i64 %1525, %1540
  %1542 = getelementptr inbounds i64, i64* %1, i64 6
  %1543 = load i1, i1* %out.
  %1544 = icmp slt i64 6, %len.1
  %1545 = bitcast i64* %shadow to i64*
  %safe.413 = or i1 %1543, %1544
  %select.ptr.414 = select i1 %safe.413, i64* %1542, i64* %1545
  %1546 = load i64, i64* %select.ptr.414, align 8
  %1547 = trunc i64 %1546 to i32
  %1548 = sext i32 %1547 to i64
  %1549 = getelementptr inbounds i64, i64* %2, i64 9
  %1550 = load i1, i1* %out.
  %1551 = icmp slt i64 9, %len.2
  %1552 = bitcast i64* %shadow to i64*
  %safe.415 = or i1 %1550, %1551
  %select.ptr.416 = select i1 %safe.415, i64* %1549, i64* %1552
  %1553 = load i64, i64* %select.ptr.416, align 8
  %1554 = trunc i64 %1553 to i32
  %1555 = sext i32 %1554 to i64
  %1556 = mul nsw i64 %1548, %1555
  %1557 = add nsw i64 %1541, %1556
  %1558 = getelementptr inbounds i64, i64* %1, i64 9
  %1559 = load i1, i1* %out.
  %1560 = icmp slt i64 9, %len.1
  %1561 = bitcast i64* %shadow to i64*
  %safe.417 = or i1 %1559, %1560
  %select.ptr.418 = select i1 %safe.417, i64* %1558, i64* %1561
  %1562 = load i64, i64* %select.ptr.418, align 8
  %1563 = trunc i64 %1562 to i32
  %1564 = sext i32 %1563 to i64
  %1565 = getelementptr inbounds i64, i64* %2, i64 6
  %1566 = load i1, i1* %out.
  %1567 = icmp slt i64 6, %len.2
  %1568 = bitcast i64* %shadow to i64*
  %safe.419 = or i1 %1566, %1567
  %select.ptr.420 = select i1 %safe.419, i64* %1565, i64* %1568
  %1569 = load i64, i64* %select.ptr.420, align 8
  %1570 = trunc i64 %1569 to i32
  %1571 = sext i32 %1570 to i64
  %1572 = mul nsw i64 %1564, %1571
  %1573 = add nsw i64 %1557, %1572
  %1574 = getelementptr inbounds i64, i64* %0, i64 15
  %1575 = load i1, i1* %out.
  %1576 = icmp slt i64 15, %len.
  %1577 = bitcast i64* %shadow to i64*
  %safe.421 = or i1 %1575, %1576
  %select.ptr.422 = select i1 %safe.421, i64* %1574, i64* %1577
  %1578 = load i64, i64* %1574
  %select.val.423 = select i1 %1575, i64 %1573, i64 %1578
  store i64 %select.val.423, i64* %select.ptr.422, align 8
  %1579 = getelementptr inbounds i64, i64* %1, i64 8
  %1580 = load i1, i1* %out.
  %1581 = icmp slt i64 8, %len.1
  %1582 = bitcast i64* %shadow to i64*
  %safe.424 = or i1 %1580, %1581
  %select.ptr.425 = select i1 %safe.424, i64* %1579, i64* %1582
  %1583 = load i64, i64* %select.ptr.425, align 8
  %1584 = trunc i64 %1583 to i32
  %1585 = sext i32 %1584 to i64
  %1586 = getelementptr inbounds i64, i64* %2, i64 8
  %1587 = load i1, i1* %out.
  %1588 = icmp slt i64 8, %len.2
  %1589 = bitcast i64* %shadow to i64*
  %safe.426 = or i1 %1587, %1588
  %select.ptr.427 = select i1 %safe.426, i64* %1586, i64* %1589
  %1590 = load i64, i64* %select.ptr.427, align 8
  %1591 = trunc i64 %1590 to i32
  %1592 = sext i32 %1591 to i64
  %1593 = mul nsw i64 %1585, %1592
  %1594 = getelementptr inbounds i64, i64* %1, i64 7
  %1595 = load i1, i1* %out.
  %1596 = icmp slt i64 7, %len.1
  %1597 = bitcast i64* %shadow to i64*
  %safe.428 = or i1 %1595, %1596
  %select.ptr.429 = select i1 %safe.428, i64* %1594, i64* %1597
  %1598 = load i64, i64* %select.ptr.429, align 8
  %1599 = trunc i64 %1598 to i32
  %1600 = sext i32 %1599 to i64
  %1601 = getelementptr inbounds i64, i64* %2, i64 9
  %1602 = load i1, i1* %out.
  %1603 = icmp slt i64 9, %len.2
  %1604 = bitcast i64* %shadow to i64*
  %safe.430 = or i1 %1602, %1603
  %select.ptr.431 = select i1 %safe.430, i64* %1601, i64* %1604
  %1605 = load i64, i64* %select.ptr.431, align 8
  %1606 = trunc i64 %1605 to i32
  %1607 = sext i32 %1606 to i64
  %1608 = mul nsw i64 %1600, %1607
  %1609 = getelementptr inbounds i64, i64* %1, i64 9
  %1610 = load i1, i1* %out.
  %1611 = icmp slt i64 9, %len.1
  %1612 = bitcast i64* %shadow to i64*
  %safe.432 = or i1 %1610, %1611
  %select.ptr.433 = select i1 %safe.432, i64* %1609, i64* %1612
  %1613 = load i64, i64* %select.ptr.433, align 8
  %1614 = trunc i64 %1613 to i32
  %1615 = sext i32 %1614 to i64
  %1616 = getelementptr inbounds i64, i64* %2, i64 7
  %1617 = load i1, i1* %out.
  %1618 = icmp slt i64 7, %len.2
  %1619 = bitcast i64* %shadow to i64*
  %safe.434 = or i1 %1617, %1618
  %select.ptr.435 = select i1 %safe.434, i64* %1616, i64* %1619
  %1620 = load i64, i64* %select.ptr.435, align 8
  %1621 = trunc i64 %1620 to i32
  %1622 = sext i32 %1621 to i64
  %1623 = mul nsw i64 %1615, %1622
  %1624 = add nsw i64 %1608, %1623
  %1625 = mul nsw i64 2, %1624
  %1626 = add nsw i64 %1593, %1625
  %1627 = getelementptr inbounds i64, i64* %0, i64 16
  %1628 = load i1, i1* %out.
  %1629 = icmp slt i64 16, %len.
  %1630 = bitcast i64* %shadow to i64*
  %safe.436 = or i1 %1628, %1629
  %select.ptr.437 = select i1 %safe.436, i64* %1627, i64* %1630
  %1631 = load i64, i64* %1627
  %select.val.438 = select i1 %1628, i64 %1626, i64 %1631
  store i64 %select.val.438, i64* %select.ptr.437, align 8
  %1632 = getelementptr inbounds i64, i64* %1, i64 8
  %1633 = load i1, i1* %out.
  %1634 = icmp slt i64 8, %len.1
  %1635 = bitcast i64* %shadow to i64*
  %safe.439 = or i1 %1633, %1634
  %select.ptr.440 = select i1 %safe.439, i64* %1632, i64* %1635
  %1636 = load i64, i64* %select.ptr.440, align 8
  %1637 = trunc i64 %1636 to i32
  %1638 = sext i32 %1637 to i64
  %1639 = getelementptr inbounds i64, i64* %2, i64 9
  %1640 = load i1, i1* %out.
  %1641 = icmp slt i64 9, %len.2
  %1642 = bitcast i64* %shadow to i64*
  %safe.441 = or i1 %1640, %1641
  %select.ptr.442 = select i1 %safe.441, i64* %1639, i64* %1642
  %1643 = load i64, i64* %select.ptr.442, align 8
  %1644 = trunc i64 %1643 to i32
  %1645 = sext i32 %1644 to i64
  %1646 = mul nsw i64 %1638, %1645
  %1647 = getelementptr inbounds i64, i64* %1, i64 9
  %1648 = load i1, i1* %out.
  %1649 = icmp slt i64 9, %len.1
  %1650 = bitcast i64* %shadow to i64*
  %safe.443 = or i1 %1648, %1649
  %select.ptr.444 = select i1 %safe.443, i64* %1647, i64* %1650
  %1651 = load i64, i64* %select.ptr.444, align 8
  %1652 = trunc i64 %1651 to i32
  %1653 = sext i32 %1652 to i64
  %1654 = getelementptr inbounds i64, i64* %2, i64 8
  %1655 = load i1, i1* %out.
  %1656 = icmp slt i64 8, %len.2
  %1657 = bitcast i64* %shadow to i64*
  %safe.445 = or i1 %1655, %1656
  %select.ptr.446 = select i1 %safe.445, i64* %1654, i64* %1657
  %1658 = load i64, i64* %select.ptr.446, align 8
  %1659 = trunc i64 %1658 to i32
  %1660 = sext i32 %1659 to i64
  %1661 = mul nsw i64 %1653, %1660
  %1662 = add nsw i64 %1646, %1661
  %1663 = getelementptr inbounds i64, i64* %0, i64 17
  %1664 = load i1, i1* %out.
  %1665 = icmp slt i64 17, %len.
  %1666 = bitcast i64* %shadow to i64*
  %safe.447 = or i1 %1664, %1665
  %select.ptr.448 = select i1 %safe.447, i64* %1663, i64* %1666
  %1667 = load i64, i64* %1663
  %select.val.449 = select i1 %1664, i64 %1662, i64 %1667
  store i64 %select.val.449, i64* %select.ptr.448, align 8
  %1668 = getelementptr inbounds i64, i64* %1, i64 9
  %1669 = load i1, i1* %out.
  %1670 = icmp slt i64 9, %len.1
  %1671 = bitcast i64* %shadow to i64*
  %safe.450 = or i1 %1669, %1670
  %select.ptr.451 = select i1 %safe.450, i64* %1668, i64* %1671
  %1672 = load i64, i64* %select.ptr.451, align 8
  %1673 = trunc i64 %1672 to i32
  %1674 = sext i32 %1673 to i64
  %1675 = mul nsw i64 2, %1674
  %1676 = getelementptr inbounds i64, i64* %2, i64 9
  %1677 = load i1, i1* %out.
  %1678 = icmp slt i64 9, %len.2
  %1679 = bitcast i64* %shadow to i64*
  %safe.452 = or i1 %1677, %1678
  %select.ptr.453 = select i1 %safe.452, i64* %1676, i64* %1679
  %1680 = load i64, i64* %select.ptr.453, align 8
  %1681 = trunc i64 %1680 to i32
  %1682 = sext i32 %1681 to i64
  %1683 = mul nsw i64 %1675, %1682
  %1684 = getelementptr inbounds i64, i64* %0, i64 18
  %1685 = load i1, i1* %out.
  %1686 = icmp slt i64 18, %len.
  %1687 = bitcast i64* %shadow to i64*
  %safe.454 = or i1 %1685, %1686
  %select.ptr.455 = select i1 %safe.454, i64* %1684, i64* %1687
  %1688 = load i64, i64* %1684
  %select.val.456 = select i1 %1685, i64 %1683, i64 %1688
  store i64 %select.val.456, i64* %select.ptr.455, align 8
  ret void
}

define internal void @freduce_degree(i64* %0, i64 %len., i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %2 = getelementptr inbounds i64, i64* %0, i64 18
  %3 = load i1, i1* %out.
  %4 = icmp slt i64 18, %len.
  %5 = bitcast i64* %shadow to i64*
  %safe. = or i1 %3, %4
  %select.ptr. = select i1 %safe., i64* %2, i64* %5
  %6 = load i64, i64* %select.ptr., align 8
  %7 = shl i64 %6, 4
  %8 = getelementptr inbounds i64, i64* %0, i64 8
  %9 = load i1, i1* %out.
  %10 = icmp slt i64 8, %len.
  %11 = bitcast i64* %shadow to i64*
  %safe.1 = or i1 %9, %10
  %select.ptr.2 = select i1 %safe.1, i64* %8, i64* %11
  %12 = load i64, i64* %select.ptr.2, align 8
  %13 = add nsw i64 %12, %7
  %14 = load i1, i1* %out.
  %15 = icmp slt i64 8, %len.
  %16 = bitcast i64* %shadow to i64*
  %safe.3 = or i1 %14, %15
  %select.ptr.4 = select i1 %safe.3, i64* %8, i64* %16
  %17 = load i64, i64* %8
  %select.val. = select i1 %14, i64 %13, i64 %17
  store i64 %select.val., i64* %select.ptr.4, align 8
  %18 = getelementptr inbounds i64, i64* %0, i64 18
  %19 = load i1, i1* %out.
  %20 = icmp slt i64 18, %len.
  %21 = bitcast i64* %shadow to i64*
  %safe.5 = or i1 %19, %20
  %select.ptr.6 = select i1 %safe.5, i64* %18, i64* %21
  %22 = load i64, i64* %select.ptr.6, align 8
  %23 = shl i64 %22, 1
  %24 = getelementptr inbounds i64, i64* %0, i64 8
  %25 = load i1, i1* %out.
  %26 = icmp slt i64 8, %len.
  %27 = bitcast i64* %shadow to i64*
  %safe.7 = or i1 %25, %26
  %select.ptr.8 = select i1 %safe.7, i64* %24, i64* %27
  %28 = load i64, i64* %select.ptr.8, align 8
  %29 = add nsw i64 %28, %23
  %30 = load i1, i1* %out.
  %31 = icmp slt i64 8, %len.
  %32 = bitcast i64* %shadow to i64*
  %safe.9 = or i1 %30, %31
  %select.ptr.10 = select i1 %safe.9, i64* %24, i64* %32
  %33 = load i64, i64* %24
  %select.val.11 = select i1 %30, i64 %29, i64 %33
  store i64 %select.val.11, i64* %select.ptr.10, align 8
  %34 = getelementptr inbounds i64, i64* %0, i64 18
  %35 = load i1, i1* %out.
  %36 = icmp slt i64 18, %len.
  %37 = bitcast i64* %shadow to i64*
  %safe.12 = or i1 %35, %36
  %select.ptr.13 = select i1 %safe.12, i64* %34, i64* %37
  %38 = load i64, i64* %select.ptr.13, align 8
  %39 = getelementptr inbounds i64, i64* %0, i64 8
  %40 = load i1, i1* %out.
  %41 = icmp slt i64 8, %len.
  %42 = bitcast i64* %shadow to i64*
  %safe.14 = or i1 %40, %41
  %select.ptr.15 = select i1 %safe.14, i64* %39, i64* %42
  %43 = load i64, i64* %select.ptr.15, align 8
  %44 = add nsw i64 %43, %38
  %45 = load i1, i1* %out.
  %46 = icmp slt i64 8, %len.
  %47 = bitcast i64* %shadow to i64*
  %safe.16 = or i1 %45, %46
  %select.ptr.17 = select i1 %safe.16, i64* %39, i64* %47
  %48 = load i64, i64* %39
  %select.val.18 = select i1 %45, i64 %44, i64 %48
  store i64 %select.val.18, i64* %select.ptr.17, align 8
  %49 = getelementptr inbounds i64, i64* %0, i64 17
  %50 = load i1, i1* %out.
  %51 = icmp slt i64 17, %len.
  %52 = bitcast i64* %shadow to i64*
  %safe.19 = or i1 %50, %51
  %select.ptr.20 = select i1 %safe.19, i64* %49, i64* %52
  %53 = load i64, i64* %select.ptr.20, align 8
  %54 = shl i64 %53, 4
  %55 = getelementptr inbounds i64, i64* %0, i64 7
  %56 = load i1, i1* %out.
  %57 = icmp slt i64 7, %len.
  %58 = bitcast i64* %shadow to i64*
  %safe.21 = or i1 %56, %57
  %select.ptr.22 = select i1 %safe.21, i64* %55, i64* %58
  %59 = load i64, i64* %select.ptr.22, align 8
  %60 = add nsw i64 %59, %54
  %61 = load i1, i1* %out.
  %62 = icmp slt i64 7, %len.
  %63 = bitcast i64* %shadow to i64*
  %safe.23 = or i1 %61, %62
  %select.ptr.24 = select i1 %safe.23, i64* %55, i64* %63
  %64 = load i64, i64* %55
  %select.val.25 = select i1 %61, i64 %60, i64 %64
  store i64 %select.val.25, i64* %select.ptr.24, align 8
  %65 = getelementptr inbounds i64, i64* %0, i64 17
  %66 = load i1, i1* %out.
  %67 = icmp slt i64 17, %len.
  %68 = bitcast i64* %shadow to i64*
  %safe.26 = or i1 %66, %67
  %select.ptr.27 = select i1 %safe.26, i64* %65, i64* %68
  %69 = load i64, i64* %select.ptr.27, align 8
  %70 = shl i64 %69, 1
  %71 = getelementptr inbounds i64, i64* %0, i64 7
  %72 = load i1, i1* %out.
  %73 = icmp slt i64 7, %len.
  %74 = bitcast i64* %shadow to i64*
  %safe.28 = or i1 %72, %73
  %select.ptr.29 = select i1 %safe.28, i64* %71, i64* %74
  %75 = load i64, i64* %select.ptr.29, align 8
  %76 = add nsw i64 %75, %70
  %77 = load i1, i1* %out.
  %78 = icmp slt i64 7, %len.
  %79 = bitcast i64* %shadow to i64*
  %safe.30 = or i1 %77, %78
  %select.ptr.31 = select i1 %safe.30, i64* %71, i64* %79
  %80 = load i64, i64* %71
  %select.val.32 = select i1 %77, i64 %76, i64 %80
  store i64 %select.val.32, i64* %select.ptr.31, align 8
  %81 = getelementptr inbounds i64, i64* %0, i64 17
  %82 = load i1, i1* %out.
  %83 = icmp slt i64 17, %len.
  %84 = bitcast i64* %shadow to i64*
  %safe.33 = or i1 %82, %83
  %select.ptr.34 = select i1 %safe.33, i64* %81, i64* %84
  %85 = load i64, i64* %select.ptr.34, align 8
  %86 = getelementptr inbounds i64, i64* %0, i64 7
  %87 = load i1, i1* %out.
  %88 = icmp slt i64 7, %len.
  %89 = bitcast i64* %shadow to i64*
  %safe.35 = or i1 %87, %88
  %select.ptr.36 = select i1 %safe.35, i64* %86, i64* %89
  %90 = load i64, i64* %select.ptr.36, align 8
  %91 = add nsw i64 %90, %85
  %92 = load i1, i1* %out.
  %93 = icmp slt i64 7, %len.
  %94 = bitcast i64* %shadow to i64*
  %safe.37 = or i1 %92, %93
  %select.ptr.38 = select i1 %safe.37, i64* %86, i64* %94
  %95 = load i64, i64* %86
  %select.val.39 = select i1 %92, i64 %91, i64 %95
  store i64 %select.val.39, i64* %select.ptr.38, align 8
  %96 = getelementptr inbounds i64, i64* %0, i64 16
  %97 = load i1, i1* %out.
  %98 = icmp slt i64 16, %len.
  %99 = bitcast i64* %shadow to i64*
  %safe.40 = or i1 %97, %98
  %select.ptr.41 = select i1 %safe.40, i64* %96, i64* %99
  %100 = load i64, i64* %select.ptr.41, align 8
  %101 = shl i64 %100, 4
  %102 = getelementptr inbounds i64, i64* %0, i64 6
  %103 = load i1, i1* %out.
  %104 = icmp slt i64 6, %len.
  %105 = bitcast i64* %shadow to i64*
  %safe.42 = or i1 %103, %104
  %select.ptr.43 = select i1 %safe.42, i64* %102, i64* %105
  %106 = load i64, i64* %select.ptr.43, align 8
  %107 = add nsw i64 %106, %101
  %108 = load i1, i1* %out.
  %109 = icmp slt i64 6, %len.
  %110 = bitcast i64* %shadow to i64*
  %safe.44 = or i1 %108, %109
  %select.ptr.45 = select i1 %safe.44, i64* %102, i64* %110
  %111 = load i64, i64* %102
  %select.val.46 = select i1 %108, i64 %107, i64 %111
  store i64 %select.val.46, i64* %select.ptr.45, align 8
  %112 = getelementptr inbounds i64, i64* %0, i64 16
  %113 = load i1, i1* %out.
  %114 = icmp slt i64 16, %len.
  %115 = bitcast i64* %shadow to i64*
  %safe.47 = or i1 %113, %114
  %select.ptr.48 = select i1 %safe.47, i64* %112, i64* %115
  %116 = load i64, i64* %select.ptr.48, align 8
  %117 = shl i64 %116, 1
  %118 = getelementptr inbounds i64, i64* %0, i64 6
  %119 = load i1, i1* %out.
  %120 = icmp slt i64 6, %len.
  %121 = bitcast i64* %shadow to i64*
  %safe.49 = or i1 %119, %120
  %select.ptr.50 = select i1 %safe.49, i64* %118, i64* %121
  %122 = load i64, i64* %select.ptr.50, align 8
  %123 = add nsw i64 %122, %117
  %124 = load i1, i1* %out.
  %125 = icmp slt i64 6, %len.
  %126 = bitcast i64* %shadow to i64*
  %safe.51 = or i1 %124, %125
  %select.ptr.52 = select i1 %safe.51, i64* %118, i64* %126
  %127 = load i64, i64* %118
  %select.val.53 = select i1 %124, i64 %123, i64 %127
  store i64 %select.val.53, i64* %select.ptr.52, align 8
  %128 = getelementptr inbounds i64, i64* %0, i64 16
  %129 = load i1, i1* %out.
  %130 = icmp slt i64 16, %len.
  %131 = bitcast i64* %shadow to i64*
  %safe.54 = or i1 %129, %130
  %select.ptr.55 = select i1 %safe.54, i64* %128, i64* %131
  %132 = load i64, i64* %select.ptr.55, align 8
  %133 = getelementptr inbounds i64, i64* %0, i64 6
  %134 = load i1, i1* %out.
  %135 = icmp slt i64 6, %len.
  %136 = bitcast i64* %shadow to i64*
  %safe.56 = or i1 %134, %135
  %select.ptr.57 = select i1 %safe.56, i64* %133, i64* %136
  %137 = load i64, i64* %select.ptr.57, align 8
  %138 = add nsw i64 %137, %132
  %139 = load i1, i1* %out.
  %140 = icmp slt i64 6, %len.
  %141 = bitcast i64* %shadow to i64*
  %safe.58 = or i1 %139, %140
  %select.ptr.59 = select i1 %safe.58, i64* %133, i64* %141
  %142 = load i64, i64* %133
  %select.val.60 = select i1 %139, i64 %138, i64 %142
  store i64 %select.val.60, i64* %select.ptr.59, align 8
  %143 = getelementptr inbounds i64, i64* %0, i64 15
  %144 = load i1, i1* %out.
  %145 = icmp slt i64 15, %len.
  %146 = bitcast i64* %shadow to i64*
  %safe.61 = or i1 %144, %145
  %select.ptr.62 = select i1 %safe.61, i64* %143, i64* %146
  %147 = load i64, i64* %select.ptr.62, align 8
  %148 = shl i64 %147, 4
  %149 = getelementptr inbounds i64, i64* %0, i64 5
  %150 = load i1, i1* %out.
  %151 = icmp slt i64 5, %len.
  %152 = bitcast i64* %shadow to i64*
  %safe.63 = or i1 %150, %151
  %select.ptr.64 = select i1 %safe.63, i64* %149, i64* %152
  %153 = load i64, i64* %select.ptr.64, align 8
  %154 = add nsw i64 %153, %148
  %155 = load i1, i1* %out.
  %156 = icmp slt i64 5, %len.
  %157 = bitcast i64* %shadow to i64*
  %safe.65 = or i1 %155, %156
  %select.ptr.66 = select i1 %safe.65, i64* %149, i64* %157
  %158 = load i64, i64* %149
  %select.val.67 = select i1 %155, i64 %154, i64 %158
  store i64 %select.val.67, i64* %select.ptr.66, align 8
  %159 = getelementptr inbounds i64, i64* %0, i64 15
  %160 = load i1, i1* %out.
  %161 = icmp slt i64 15, %len.
  %162 = bitcast i64* %shadow to i64*
  %safe.68 = or i1 %160, %161
  %select.ptr.69 = select i1 %safe.68, i64* %159, i64* %162
  %163 = load i64, i64* %select.ptr.69, align 8
  %164 = shl i64 %163, 1
  %165 = getelementptr inbounds i64, i64* %0, i64 5
  %166 = load i1, i1* %out.
  %167 = icmp slt i64 5, %len.
  %168 = bitcast i64* %shadow to i64*
  %safe.70 = or i1 %166, %167
  %select.ptr.71 = select i1 %safe.70, i64* %165, i64* %168
  %169 = load i64, i64* %select.ptr.71, align 8
  %170 = add nsw i64 %169, %164
  %171 = load i1, i1* %out.
  %172 = icmp slt i64 5, %len.
  %173 = bitcast i64* %shadow to i64*
  %safe.72 = or i1 %171, %172
  %select.ptr.73 = select i1 %safe.72, i64* %165, i64* %173
  %174 = load i64, i64* %165
  %select.val.74 = select i1 %171, i64 %170, i64 %174
  store i64 %select.val.74, i64* %select.ptr.73, align 8
  %175 = getelementptr inbounds i64, i64* %0, i64 15
  %176 = load i1, i1* %out.
  %177 = icmp slt i64 15, %len.
  %178 = bitcast i64* %shadow to i64*
  %safe.75 = or i1 %176, %177
  %select.ptr.76 = select i1 %safe.75, i64* %175, i64* %178
  %179 = load i64, i64* %select.ptr.76, align 8
  %180 = getelementptr inbounds i64, i64* %0, i64 5
  %181 = load i1, i1* %out.
  %182 = icmp slt i64 5, %len.
  %183 = bitcast i64* %shadow to i64*
  %safe.77 = or i1 %181, %182
  %select.ptr.78 = select i1 %safe.77, i64* %180, i64* %183
  %184 = load i64, i64* %select.ptr.78, align 8
  %185 = add nsw i64 %184, %179
  %186 = load i1, i1* %out.
  %187 = icmp slt i64 5, %len.
  %188 = bitcast i64* %shadow to i64*
  %safe.79 = or i1 %186, %187
  %select.ptr.80 = select i1 %safe.79, i64* %180, i64* %188
  %189 = load i64, i64* %180
  %select.val.81 = select i1 %186, i64 %185, i64 %189
  store i64 %select.val.81, i64* %select.ptr.80, align 8
  %190 = getelementptr inbounds i64, i64* %0, i64 14
  %191 = load i1, i1* %out.
  %192 = icmp slt i64 14, %len.
  %193 = bitcast i64* %shadow to i64*
  %safe.82 = or i1 %191, %192
  %select.ptr.83 = select i1 %safe.82, i64* %190, i64* %193
  %194 = load i64, i64* %select.ptr.83, align 8
  %195 = shl i64 %194, 4
  %196 = getelementptr inbounds i64, i64* %0, i64 4
  %197 = load i1, i1* %out.
  %198 = icmp slt i64 4, %len.
  %199 = bitcast i64* %shadow to i64*
  %safe.84 = or i1 %197, %198
  %select.ptr.85 = select i1 %safe.84, i64* %196, i64* %199
  %200 = load i64, i64* %select.ptr.85, align 8
  %201 = add nsw i64 %200, %195
  %202 = load i1, i1* %out.
  %203 = icmp slt i64 4, %len.
  %204 = bitcast i64* %shadow to i64*
  %safe.86 = or i1 %202, %203
  %select.ptr.87 = select i1 %safe.86, i64* %196, i64* %204
  %205 = load i64, i64* %196
  %select.val.88 = select i1 %202, i64 %201, i64 %205
  store i64 %select.val.88, i64* %select.ptr.87, align 8
  %206 = getelementptr inbounds i64, i64* %0, i64 14
  %207 = load i1, i1* %out.
  %208 = icmp slt i64 14, %len.
  %209 = bitcast i64* %shadow to i64*
  %safe.89 = or i1 %207, %208
  %select.ptr.90 = select i1 %safe.89, i64* %206, i64* %209
  %210 = load i64, i64* %select.ptr.90, align 8
  %211 = shl i64 %210, 1
  %212 = getelementptr inbounds i64, i64* %0, i64 4
  %213 = load i1, i1* %out.
  %214 = icmp slt i64 4, %len.
  %215 = bitcast i64* %shadow to i64*
  %safe.91 = or i1 %213, %214
  %select.ptr.92 = select i1 %safe.91, i64* %212, i64* %215
  %216 = load i64, i64* %select.ptr.92, align 8
  %217 = add nsw i64 %216, %211
  %218 = load i1, i1* %out.
  %219 = icmp slt i64 4, %len.
  %220 = bitcast i64* %shadow to i64*
  %safe.93 = or i1 %218, %219
  %select.ptr.94 = select i1 %safe.93, i64* %212, i64* %220
  %221 = load i64, i64* %212
  %select.val.95 = select i1 %218, i64 %217, i64 %221
  store i64 %select.val.95, i64* %select.ptr.94, align 8
  %222 = getelementptr inbounds i64, i64* %0, i64 14
  %223 = load i1, i1* %out.
  %224 = icmp slt i64 14, %len.
  %225 = bitcast i64* %shadow to i64*
  %safe.96 = or i1 %223, %224
  %select.ptr.97 = select i1 %safe.96, i64* %222, i64* %225
  %226 = load i64, i64* %select.ptr.97, align 8
  %227 = getelementptr inbounds i64, i64* %0, i64 4
  %228 = load i1, i1* %out.
  %229 = icmp slt i64 4, %len.
  %230 = bitcast i64* %shadow to i64*
  %safe.98 = or i1 %228, %229
  %select.ptr.99 = select i1 %safe.98, i64* %227, i64* %230
  %231 = load i64, i64* %select.ptr.99, align 8
  %232 = add nsw i64 %231, %226
  %233 = load i1, i1* %out.
  %234 = icmp slt i64 4, %len.
  %235 = bitcast i64* %shadow to i64*
  %safe.100 = or i1 %233, %234
  %select.ptr.101 = select i1 %safe.100, i64* %227, i64* %235
  %236 = load i64, i64* %227
  %select.val.102 = select i1 %233, i64 %232, i64 %236
  store i64 %select.val.102, i64* %select.ptr.101, align 8
  %237 = getelementptr inbounds i64, i64* %0, i64 13
  %238 = load i1, i1* %out.
  %239 = icmp slt i64 13, %len.
  %240 = bitcast i64* %shadow to i64*
  %safe.103 = or i1 %238, %239
  %select.ptr.104 = select i1 %safe.103, i64* %237, i64* %240
  %241 = load i64, i64* %select.ptr.104, align 8
  %242 = shl i64 %241, 4
  %243 = getelementptr inbounds i64, i64* %0, i64 3
  %244 = load i1, i1* %out.
  %245 = icmp slt i64 3, %len.
  %246 = bitcast i64* %shadow to i64*
  %safe.105 = or i1 %244, %245
  %select.ptr.106 = select i1 %safe.105, i64* %243, i64* %246
  %247 = load i64, i64* %select.ptr.106, align 8
  %248 = add nsw i64 %247, %242
  %249 = load i1, i1* %out.
  %250 = icmp slt i64 3, %len.
  %251 = bitcast i64* %shadow to i64*
  %safe.107 = or i1 %249, %250
  %select.ptr.108 = select i1 %safe.107, i64* %243, i64* %251
  %252 = load i64, i64* %243
  %select.val.109 = select i1 %249, i64 %248, i64 %252
  store i64 %select.val.109, i64* %select.ptr.108, align 8
  %253 = getelementptr inbounds i64, i64* %0, i64 13
  %254 = load i1, i1* %out.
  %255 = icmp slt i64 13, %len.
  %256 = bitcast i64* %shadow to i64*
  %safe.110 = or i1 %254, %255
  %select.ptr.111 = select i1 %safe.110, i64* %253, i64* %256
  %257 = load i64, i64* %select.ptr.111, align 8
  %258 = shl i64 %257, 1
  %259 = getelementptr inbounds i64, i64* %0, i64 3
  %260 = load i1, i1* %out.
  %261 = icmp slt i64 3, %len.
  %262 = bitcast i64* %shadow to i64*
  %safe.112 = or i1 %260, %261
  %select.ptr.113 = select i1 %safe.112, i64* %259, i64* %262
  %263 = load i64, i64* %select.ptr.113, align 8
  %264 = add nsw i64 %263, %258
  %265 = load i1, i1* %out.
  %266 = icmp slt i64 3, %len.
  %267 = bitcast i64* %shadow to i64*
  %safe.114 = or i1 %265, %266
  %select.ptr.115 = select i1 %safe.114, i64* %259, i64* %267
  %268 = load i64, i64* %259
  %select.val.116 = select i1 %265, i64 %264, i64 %268
  store i64 %select.val.116, i64* %select.ptr.115, align 8
  %269 = getelementptr inbounds i64, i64* %0, i64 13
  %270 = load i1, i1* %out.
  %271 = icmp slt i64 13, %len.
  %272 = bitcast i64* %shadow to i64*
  %safe.117 = or i1 %270, %271
  %select.ptr.118 = select i1 %safe.117, i64* %269, i64* %272
  %273 = load i64, i64* %select.ptr.118, align 8
  %274 = getelementptr inbounds i64, i64* %0, i64 3
  %275 = load i1, i1* %out.
  %276 = icmp slt i64 3, %len.
  %277 = bitcast i64* %shadow to i64*
  %safe.119 = or i1 %275, %276
  %select.ptr.120 = select i1 %safe.119, i64* %274, i64* %277
  %278 = load i64, i64* %select.ptr.120, align 8
  %279 = add nsw i64 %278, %273
  %280 = load i1, i1* %out.
  %281 = icmp slt i64 3, %len.
  %282 = bitcast i64* %shadow to i64*
  %safe.121 = or i1 %280, %281
  %select.ptr.122 = select i1 %safe.121, i64* %274, i64* %282
  %283 = load i64, i64* %274
  %select.val.123 = select i1 %280, i64 %279, i64 %283
  store i64 %select.val.123, i64* %select.ptr.122, align 8
  %284 = getelementptr inbounds i64, i64* %0, i64 12
  %285 = load i1, i1* %out.
  %286 = icmp slt i64 12, %len.
  %287 = bitcast i64* %shadow to i64*
  %safe.124 = or i1 %285, %286
  %select.ptr.125 = select i1 %safe.124, i64* %284, i64* %287
  %288 = load i64, i64* %select.ptr.125, align 8
  %289 = shl i64 %288, 4
  %290 = getelementptr inbounds i64, i64* %0, i64 2
  %291 = load i1, i1* %out.
  %292 = icmp slt i64 2, %len.
  %293 = bitcast i64* %shadow to i64*
  %safe.126 = or i1 %291, %292
  %select.ptr.127 = select i1 %safe.126, i64* %290, i64* %293
  %294 = load i64, i64* %select.ptr.127, align 8
  %295 = add nsw i64 %294, %289
  %296 = load i1, i1* %out.
  %297 = icmp slt i64 2, %len.
  %298 = bitcast i64* %shadow to i64*
  %safe.128 = or i1 %296, %297
  %select.ptr.129 = select i1 %safe.128, i64* %290, i64* %298
  %299 = load i64, i64* %290
  %select.val.130 = select i1 %296, i64 %295, i64 %299
  store i64 %select.val.130, i64* %select.ptr.129, align 8
  %300 = getelementptr inbounds i64, i64* %0, i64 12
  %301 = load i1, i1* %out.
  %302 = icmp slt i64 12, %len.
  %303 = bitcast i64* %shadow to i64*
  %safe.131 = or i1 %301, %302
  %select.ptr.132 = select i1 %safe.131, i64* %300, i64* %303
  %304 = load i64, i64* %select.ptr.132, align 8
  %305 = shl i64 %304, 1
  %306 = getelementptr inbounds i64, i64* %0, i64 2
  %307 = load i1, i1* %out.
  %308 = icmp slt i64 2, %len.
  %309 = bitcast i64* %shadow to i64*
  %safe.133 = or i1 %307, %308
  %select.ptr.134 = select i1 %safe.133, i64* %306, i64* %309
  %310 = load i64, i64* %select.ptr.134, align 8
  %311 = add nsw i64 %310, %305
  %312 = load i1, i1* %out.
  %313 = icmp slt i64 2, %len.
  %314 = bitcast i64* %shadow to i64*
  %safe.135 = or i1 %312, %313
  %select.ptr.136 = select i1 %safe.135, i64* %306, i64* %314
  %315 = load i64, i64* %306
  %select.val.137 = select i1 %312, i64 %311, i64 %315
  store i64 %select.val.137, i64* %select.ptr.136, align 8
  %316 = getelementptr inbounds i64, i64* %0, i64 12
  %317 = load i1, i1* %out.
  %318 = icmp slt i64 12, %len.
  %319 = bitcast i64* %shadow to i64*
  %safe.138 = or i1 %317, %318
  %select.ptr.139 = select i1 %safe.138, i64* %316, i64* %319
  %320 = load i64, i64* %select.ptr.139, align 8
  %321 = getelementptr inbounds i64, i64* %0, i64 2
  %322 = load i1, i1* %out.
  %323 = icmp slt i64 2, %len.
  %324 = bitcast i64* %shadow to i64*
  %safe.140 = or i1 %322, %323
  %select.ptr.141 = select i1 %safe.140, i64* %321, i64* %324
  %325 = load i64, i64* %select.ptr.141, align 8
  %326 = add nsw i64 %325, %320
  %327 = load i1, i1* %out.
  %328 = icmp slt i64 2, %len.
  %329 = bitcast i64* %shadow to i64*
  %safe.142 = or i1 %327, %328
  %select.ptr.143 = select i1 %safe.142, i64* %321, i64* %329
  %330 = load i64, i64* %321
  %select.val.144 = select i1 %327, i64 %326, i64 %330
  store i64 %select.val.144, i64* %select.ptr.143, align 8
  %331 = getelementptr inbounds i64, i64* %0, i64 11
  %332 = load i1, i1* %out.
  %333 = icmp slt i64 11, %len.
  %334 = bitcast i64* %shadow to i64*
  %safe.145 = or i1 %332, %333
  %select.ptr.146 = select i1 %safe.145, i64* %331, i64* %334
  %335 = load i64, i64* %select.ptr.146, align 8
  %336 = shl i64 %335, 4
  %337 = getelementptr inbounds i64, i64* %0, i64 1
  %338 = load i1, i1* %out.
  %339 = icmp slt i64 1, %len.
  %340 = bitcast i64* %shadow to i64*
  %safe.147 = or i1 %338, %339
  %select.ptr.148 = select i1 %safe.147, i64* %337, i64* %340
  %341 = load i64, i64* %select.ptr.148, align 8
  %342 = add nsw i64 %341, %336
  %343 = load i1, i1* %out.
  %344 = icmp slt i64 1, %len.
  %345 = bitcast i64* %shadow to i64*
  %safe.149 = or i1 %343, %344
  %select.ptr.150 = select i1 %safe.149, i64* %337, i64* %345
  %346 = load i64, i64* %337
  %select.val.151 = select i1 %343, i64 %342, i64 %346
  store i64 %select.val.151, i64* %select.ptr.150, align 8
  %347 = getelementptr inbounds i64, i64* %0, i64 11
  %348 = load i1, i1* %out.
  %349 = icmp slt i64 11, %len.
  %350 = bitcast i64* %shadow to i64*
  %safe.152 = or i1 %348, %349
  %select.ptr.153 = select i1 %safe.152, i64* %347, i64* %350
  %351 = load i64, i64* %select.ptr.153, align 8
  %352 = shl i64 %351, 1
  %353 = getelementptr inbounds i64, i64* %0, i64 1
  %354 = load i1, i1* %out.
  %355 = icmp slt i64 1, %len.
  %356 = bitcast i64* %shadow to i64*
  %safe.154 = or i1 %354, %355
  %select.ptr.155 = select i1 %safe.154, i64* %353, i64* %356
  %357 = load i64, i64* %select.ptr.155, align 8
  %358 = add nsw i64 %357, %352
  %359 = load i1, i1* %out.
  %360 = icmp slt i64 1, %len.
  %361 = bitcast i64* %shadow to i64*
  %safe.156 = or i1 %359, %360
  %select.ptr.157 = select i1 %safe.156, i64* %353, i64* %361
  %362 = load i64, i64* %353
  %select.val.158 = select i1 %359, i64 %358, i64 %362
  store i64 %select.val.158, i64* %select.ptr.157, align 8
  %363 = getelementptr inbounds i64, i64* %0, i64 11
  %364 = load i1, i1* %out.
  %365 = icmp slt i64 11, %len.
  %366 = bitcast i64* %shadow to i64*
  %safe.159 = or i1 %364, %365
  %select.ptr.160 = select i1 %safe.159, i64* %363, i64* %366
  %367 = load i64, i64* %select.ptr.160, align 8
  %368 = getelementptr inbounds i64, i64* %0, i64 1
  %369 = load i1, i1* %out.
  %370 = icmp slt i64 1, %len.
  %371 = bitcast i64* %shadow to i64*
  %safe.161 = or i1 %369, %370
  %select.ptr.162 = select i1 %safe.161, i64* %368, i64* %371
  %372 = load i64, i64* %select.ptr.162, align 8
  %373 = add nsw i64 %372, %367
  %374 = load i1, i1* %out.
  %375 = icmp slt i64 1, %len.
  %376 = bitcast i64* %shadow to i64*
  %safe.163 = or i1 %374, %375
  %select.ptr.164 = select i1 %safe.163, i64* %368, i64* %376
  %377 = load i64, i64* %368
  %select.val.165 = select i1 %374, i64 %373, i64 %377
  store i64 %select.val.165, i64* %select.ptr.164, align 8
  %378 = getelementptr inbounds i64, i64* %0, i64 10
  %379 = load i1, i1* %out.
  %380 = icmp slt i64 10, %len.
  %381 = bitcast i64* %shadow to i64*
  %safe.166 = or i1 %379, %380
  %select.ptr.167 = select i1 %safe.166, i64* %378, i64* %381
  %382 = load i64, i64* %select.ptr.167, align 8
  %383 = shl i64 %382, 4
  %384 = getelementptr inbounds i64, i64* %0, i64 0
  %385 = load i1, i1* %out.
  %386 = icmp slt i64 0, %len.
  %387 = bitcast i64* %shadow to i64*
  %safe.168 = or i1 %385, %386
  %select.ptr.169 = select i1 %safe.168, i64* %384, i64* %387
  %388 = load i64, i64* %select.ptr.169, align 8
  %389 = add nsw i64 %388, %383
  %390 = load i1, i1* %out.
  %391 = icmp slt i64 0, %len.
  %392 = bitcast i64* %shadow to i64*
  %safe.170 = or i1 %390, %391
  %select.ptr.171 = select i1 %safe.170, i64* %384, i64* %392
  %393 = load i64, i64* %384
  %select.val.172 = select i1 %390, i64 %389, i64 %393
  store i64 %select.val.172, i64* %select.ptr.171, align 8
  %394 = getelementptr inbounds i64, i64* %0, i64 10
  %395 = load i1, i1* %out.
  %396 = icmp slt i64 10, %len.
  %397 = bitcast i64* %shadow to i64*
  %safe.173 = or i1 %395, %396
  %select.ptr.174 = select i1 %safe.173, i64* %394, i64* %397
  %398 = load i64, i64* %select.ptr.174, align 8
  %399 = shl i64 %398, 1
  %400 = getelementptr inbounds i64, i64* %0, i64 0
  %401 = load i1, i1* %out.
  %402 = icmp slt i64 0, %len.
  %403 = bitcast i64* %shadow to i64*
  %safe.175 = or i1 %401, %402
  %select.ptr.176 = select i1 %safe.175, i64* %400, i64* %403
  %404 = load i64, i64* %select.ptr.176, align 8
  %405 = add nsw i64 %404, %399
  %406 = load i1, i1* %out.
  %407 = icmp slt i64 0, %len.
  %408 = bitcast i64* %shadow to i64*
  %safe.177 = or i1 %406, %407
  %select.ptr.178 = select i1 %safe.177, i64* %400, i64* %408
  %409 = load i64, i64* %400
  %select.val.179 = select i1 %406, i64 %405, i64 %409
  store i64 %select.val.179, i64* %select.ptr.178, align 8
  %410 = getelementptr inbounds i64, i64* %0, i64 10
  %411 = load i1, i1* %out.
  %412 = icmp slt i64 10, %len.
  %413 = bitcast i64* %shadow to i64*
  %safe.180 = or i1 %411, %412
  %select.ptr.181 = select i1 %safe.180, i64* %410, i64* %413
  %414 = load i64, i64* %select.ptr.181, align 8
  %415 = getelementptr inbounds i64, i64* %0, i64 0
  %416 = load i1, i1* %out.
  %417 = icmp slt i64 0, %len.
  %418 = bitcast i64* %shadow to i64*
  %safe.182 = or i1 %416, %417
  %select.ptr.183 = select i1 %safe.182, i64* %415, i64* %418
  %419 = load i64, i64* %select.ptr.183, align 8
  %420 = add nsw i64 %419, %414
  %421 = load i1, i1* %out.
  %422 = icmp slt i64 0, %len.
  %423 = bitcast i64* %shadow to i64*
  %safe.184 = or i1 %421, %422
  %select.ptr.185 = select i1 %safe.184, i64* %415, i64* %423
  %424 = load i64, i64* %415
  %select.val.186 = select i1 %421, i64 %420, i64 %424
  store i64 %select.val.186, i64* %select.ptr.185, align 8
  ret void
}

define internal void @freduce_coefficients(i64* %0, i64 %len., i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %2 = getelementptr inbounds i64, i64* %0, i64 10
  %3 = load i1, i1* %out.
  %4 = icmp slt i64 10, %len.
  %5 = bitcast i64* %shadow to i64*
  %safe. = or i1 %3, %4
  %select.ptr. = select i1 %safe., i64* %2, i64* %5
  %6 = load i64, i64* %2
  %select.val. = select i1 %3, i64 0, i64 %6
  store i64 %select.val., i64* %select.ptr., align 8
  %7 = load i1, i1* %out.
  %8 = load i64, i64* %0, align 8
  %9 = call i64 @div_by_2_26(i64 %8, i1 %.cond)
  %10 = shl i64 %9, 26
  %11 = load i1, i1* %out.
  %12 = load i64, i64* %0, align 8
  %13 = sub nsw i64 %12, %10
  %14 = load i1, i1* %out.
  %15 = load i64, i64* %0
  %select.val.1 = select i1 %14, i64 %13, i64 %15
  store i64 %select.val.1, i64* %0, align 8
  %16 = getelementptr inbounds i64, i64* %0, i64 1
  %17 = load i1, i1* %out.
  %18 = icmp slt i64 1, %len.
  %19 = bitcast i64* %shadow to i64*
  %safe.2 = or i1 %17, %18
  %select.ptr.3 = select i1 %safe.2, i64* %16, i64* %19
  %20 = load i64, i64* %select.ptr.3, align 8
  %21 = add nsw i64 %20, %9
  %22 = load i1, i1* %out.
  %23 = icmp slt i64 1, %len.
  %24 = bitcast i64* %shadow to i64*
  %safe.4 = or i1 %22, %23
  %select.ptr.5 = select i1 %safe.4, i64* %16, i64* %24
  %25 = load i64, i64* %16
  %select.val.6 = select i1 %22, i64 %21, i64 %25
  store i64 %select.val.6, i64* %select.ptr.5, align 8
  %26 = getelementptr inbounds i64, i64* %0, i64 1
  %27 = load i1, i1* %out.
  %28 = icmp slt i64 1, %len.
  %29 = bitcast i64* %shadow to i64*
  %safe.7 = or i1 %27, %28
  %select.ptr.8 = select i1 %safe.7, i64* %26, i64* %29
  %30 = load i64, i64* %select.ptr.8, align 8
  %31 = call i64 @div_by_2_25(i64 %30, i1 %.cond)
  %32 = shl i64 %31, 25
  %33 = getelementptr inbounds i64, i64* %0, i64 1
  %34 = load i1, i1* %out.
  %35 = icmp slt i64 1, %len.
  %36 = bitcast i64* %shadow to i64*
  %safe.9 = or i1 %34, %35
  %select.ptr.10 = select i1 %safe.9, i64* %33, i64* %36
  %37 = load i64, i64* %select.ptr.10, align 8
  %38 = sub nsw i64 %37, %32
  %39 = load i1, i1* %out.
  %40 = icmp slt i64 1, %len.
  %41 = bitcast i64* %shadow to i64*
  %safe.11 = or i1 %39, %40
  %select.ptr.12 = select i1 %safe.11, i64* %33, i64* %41
  %42 = load i64, i64* %33
  %select.val.13 = select i1 %39, i64 %38, i64 %42
  store i64 %select.val.13, i64* %select.ptr.12, align 8
  %43 = getelementptr inbounds i64, i64* %0, i64 2
  %44 = load i1, i1* %out.
  %45 = icmp slt i64 2, %len.
  %46 = bitcast i64* %shadow to i64*
  %safe.14 = or i1 %44, %45
  %select.ptr.15 = select i1 %safe.14, i64* %43, i64* %46
  %47 = load i64, i64* %select.ptr.15, align 8
  %48 = add nsw i64 %47, %31
  %49 = load i1, i1* %out.
  %50 = icmp slt i64 2, %len.
  %51 = bitcast i64* %shadow to i64*
  %safe.16 = or i1 %49, %50
  %select.ptr.17 = select i1 %safe.16, i64* %43, i64* %51
  %52 = load i64, i64* %43
  %select.val.18 = select i1 %49, i64 %48, i64 %52
  store i64 %select.val.18, i64* %select.ptr.17, align 8
  %53 = getelementptr inbounds i64, i64* %0, i64 2
  %54 = load i1, i1* %out.
  %55 = icmp slt i64 2, %len.
  %56 = bitcast i64* %shadow to i64*
  %safe.19 = or i1 %54, %55
  %select.ptr.20 = select i1 %safe.19, i64* %53, i64* %56
  %57 = load i64, i64* %select.ptr.20, align 8
  %58 = call i64 @div_by_2_26(i64 %57, i1 %.cond)
  %59 = shl i64 %58, 26
  %60 = getelementptr inbounds i64, i64* %0, i64 2
  %61 = load i1, i1* %out.
  %62 = icmp slt i64 2, %len.
  %63 = bitcast i64* %shadow to i64*
  %safe.21 = or i1 %61, %62
  %select.ptr.22 = select i1 %safe.21, i64* %60, i64* %63
  %64 = load i64, i64* %select.ptr.22, align 8
  %65 = sub nsw i64 %64, %59
  %66 = load i1, i1* %out.
  %67 = icmp slt i64 2, %len.
  %68 = bitcast i64* %shadow to i64*
  %safe.23 = or i1 %66, %67
  %select.ptr.24 = select i1 %safe.23, i64* %60, i64* %68
  %69 = load i64, i64* %60
  %select.val.25 = select i1 %66, i64 %65, i64 %69
  store i64 %select.val.25, i64* %select.ptr.24, align 8
  %70 = getelementptr inbounds i64, i64* %0, i64 3
  %71 = load i1, i1* %out.
  %72 = icmp slt i64 3, %len.
  %73 = bitcast i64* %shadow to i64*
  %safe.26 = or i1 %71, %72
  %select.ptr.27 = select i1 %safe.26, i64* %70, i64* %73
  %74 = load i64, i64* %select.ptr.27, align 8
  %75 = add nsw i64 %74, %58
  %76 = load i1, i1* %out.
  %77 = icmp slt i64 3, %len.
  %78 = bitcast i64* %shadow to i64*
  %safe.28 = or i1 %76, %77
  %select.ptr.29 = select i1 %safe.28, i64* %70, i64* %78
  %79 = load i64, i64* %70
  %select.val.30 = select i1 %76, i64 %75, i64 %79
  store i64 %select.val.30, i64* %select.ptr.29, align 8
  %80 = getelementptr inbounds i64, i64* %0, i64 3
  %81 = load i1, i1* %out.
  %82 = icmp slt i64 3, %len.
  %83 = bitcast i64* %shadow to i64*
  %safe.31 = or i1 %81, %82
  %select.ptr.32 = select i1 %safe.31, i64* %80, i64* %83
  %84 = load i64, i64* %select.ptr.32, align 8
  %85 = call i64 @div_by_2_25(i64 %84, i1 %.cond)
  %86 = shl i64 %85, 25
  %87 = getelementptr inbounds i64, i64* %0, i64 3
  %88 = load i1, i1* %out.
  %89 = icmp slt i64 3, %len.
  %90 = bitcast i64* %shadow to i64*
  %safe.33 = or i1 %88, %89
  %select.ptr.34 = select i1 %safe.33, i64* %87, i64* %90
  %91 = load i64, i64* %select.ptr.34, align 8
  %92 = sub nsw i64 %91, %86
  %93 = load i1, i1* %out.
  %94 = icmp slt i64 3, %len.
  %95 = bitcast i64* %shadow to i64*
  %safe.35 = or i1 %93, %94
  %select.ptr.36 = select i1 %safe.35, i64* %87, i64* %95
  %96 = load i64, i64* %87
  %select.val.37 = select i1 %93, i64 %92, i64 %96
  store i64 %select.val.37, i64* %select.ptr.36, align 8
  %97 = getelementptr inbounds i64, i64* %0, i64 4
  %98 = load i1, i1* %out.
  %99 = icmp slt i64 4, %len.
  %100 = bitcast i64* %shadow to i64*
  %safe.38 = or i1 %98, %99
  %select.ptr.39 = select i1 %safe.38, i64* %97, i64* %100
  %101 = load i64, i64* %select.ptr.39, align 8
  %102 = add nsw i64 %101, %85
  %103 = load i1, i1* %out.
  %104 = icmp slt i64 4, %len.
  %105 = bitcast i64* %shadow to i64*
  %safe.40 = or i1 %103, %104
  %select.ptr.41 = select i1 %safe.40, i64* %97, i64* %105
  %106 = load i64, i64* %97
  %select.val.42 = select i1 %103, i64 %102, i64 %106
  store i64 %select.val.42, i64* %select.ptr.41, align 8
  %107 = getelementptr inbounds i64, i64* %0, i64 4
  %108 = load i1, i1* %out.
  %109 = icmp slt i64 4, %len.
  %110 = bitcast i64* %shadow to i64*
  %safe.43 = or i1 %108, %109
  %select.ptr.44 = select i1 %safe.43, i64* %107, i64* %110
  %111 = load i64, i64* %select.ptr.44, align 8
  %112 = call i64 @div_by_2_26(i64 %111, i1 %.cond)
  %113 = shl i64 %112, 26
  %114 = getelementptr inbounds i64, i64* %0, i64 4
  %115 = load i1, i1* %out.
  %116 = icmp slt i64 4, %len.
  %117 = bitcast i64* %shadow to i64*
  %safe.45 = or i1 %115, %116
  %select.ptr.46 = select i1 %safe.45, i64* %114, i64* %117
  %118 = load i64, i64* %select.ptr.46, align 8
  %119 = sub nsw i64 %118, %113
  %120 = load i1, i1* %out.
  %121 = icmp slt i64 4, %len.
  %122 = bitcast i64* %shadow to i64*
  %safe.47 = or i1 %120, %121
  %select.ptr.48 = select i1 %safe.47, i64* %114, i64* %122
  %123 = load i64, i64* %114
  %select.val.49 = select i1 %120, i64 %119, i64 %123
  store i64 %select.val.49, i64* %select.ptr.48, align 8
  %124 = getelementptr inbounds i64, i64* %0, i64 5
  %125 = load i1, i1* %out.
  %126 = icmp slt i64 5, %len.
  %127 = bitcast i64* %shadow to i64*
  %safe.50 = or i1 %125, %126
  %select.ptr.51 = select i1 %safe.50, i64* %124, i64* %127
  %128 = load i64, i64* %select.ptr.51, align 8
  %129 = add nsw i64 %128, %112
  %130 = load i1, i1* %out.
  %131 = icmp slt i64 5, %len.
  %132 = bitcast i64* %shadow to i64*
  %safe.52 = or i1 %130, %131
  %select.ptr.53 = select i1 %safe.52, i64* %124, i64* %132
  %133 = load i64, i64* %124
  %select.val.54 = select i1 %130, i64 %129, i64 %133
  store i64 %select.val.54, i64* %select.ptr.53, align 8
  %134 = getelementptr inbounds i64, i64* %0, i64 5
  %135 = load i1, i1* %out.
  %136 = icmp slt i64 5, %len.
  %137 = bitcast i64* %shadow to i64*
  %safe.55 = or i1 %135, %136
  %select.ptr.56 = select i1 %safe.55, i64* %134, i64* %137
  %138 = load i64, i64* %select.ptr.56, align 8
  %139 = call i64 @div_by_2_25(i64 %138, i1 %.cond)
  %140 = shl i64 %139, 25
  %141 = getelementptr inbounds i64, i64* %0, i64 5
  %142 = load i1, i1* %out.
  %143 = icmp slt i64 5, %len.
  %144 = bitcast i64* %shadow to i64*
  %safe.57 = or i1 %142, %143
  %select.ptr.58 = select i1 %safe.57, i64* %141, i64* %144
  %145 = load i64, i64* %select.ptr.58, align 8
  %146 = sub nsw i64 %145, %140
  %147 = load i1, i1* %out.
  %148 = icmp slt i64 5, %len.
  %149 = bitcast i64* %shadow to i64*
  %safe.59 = or i1 %147, %148
  %select.ptr.60 = select i1 %safe.59, i64* %141, i64* %149
  %150 = load i64, i64* %141
  %select.val.61 = select i1 %147, i64 %146, i64 %150
  store i64 %select.val.61, i64* %select.ptr.60, align 8
  %151 = getelementptr inbounds i64, i64* %0, i64 6
  %152 = load i1, i1* %out.
  %153 = icmp slt i64 6, %len.
  %154 = bitcast i64* %shadow to i64*
  %safe.62 = or i1 %152, %153
  %select.ptr.63 = select i1 %safe.62, i64* %151, i64* %154
  %155 = load i64, i64* %select.ptr.63, align 8
  %156 = add nsw i64 %155, %139
  %157 = load i1, i1* %out.
  %158 = icmp slt i64 6, %len.
  %159 = bitcast i64* %shadow to i64*
  %safe.64 = or i1 %157, %158
  %select.ptr.65 = select i1 %safe.64, i64* %151, i64* %159
  %160 = load i64, i64* %151
  %select.val.66 = select i1 %157, i64 %156, i64 %160
  store i64 %select.val.66, i64* %select.ptr.65, align 8
  %161 = getelementptr inbounds i64, i64* %0, i64 6
  %162 = load i1, i1* %out.
  %163 = icmp slt i64 6, %len.
  %164 = bitcast i64* %shadow to i64*
  %safe.67 = or i1 %162, %163
  %select.ptr.68 = select i1 %safe.67, i64* %161, i64* %164
  %165 = load i64, i64* %select.ptr.68, align 8
  %166 = call i64 @div_by_2_26(i64 %165, i1 %.cond)
  %167 = shl i64 %166, 26
  %168 = getelementptr inbounds i64, i64* %0, i64 6
  %169 = load i1, i1* %out.
  %170 = icmp slt i64 6, %len.
  %171 = bitcast i64* %shadow to i64*
  %safe.69 = or i1 %169, %170
  %select.ptr.70 = select i1 %safe.69, i64* %168, i64* %171
  %172 = load i64, i64* %select.ptr.70, align 8
  %173 = sub nsw i64 %172, %167
  %174 = load i1, i1* %out.
  %175 = icmp slt i64 6, %len.
  %176 = bitcast i64* %shadow to i64*
  %safe.71 = or i1 %174, %175
  %select.ptr.72 = select i1 %safe.71, i64* %168, i64* %176
  %177 = load i64, i64* %168
  %select.val.73 = select i1 %174, i64 %173, i64 %177
  store i64 %select.val.73, i64* %select.ptr.72, align 8
  %178 = getelementptr inbounds i64, i64* %0, i64 7
  %179 = load i1, i1* %out.
  %180 = icmp slt i64 7, %len.
  %181 = bitcast i64* %shadow to i64*
  %safe.74 = or i1 %179, %180
  %select.ptr.75 = select i1 %safe.74, i64* %178, i64* %181
  %182 = load i64, i64* %select.ptr.75, align 8
  %183 = add nsw i64 %182, %166
  %184 = load i1, i1* %out.
  %185 = icmp slt i64 7, %len.
  %186 = bitcast i64* %shadow to i64*
  %safe.76 = or i1 %184, %185
  %select.ptr.77 = select i1 %safe.76, i64* %178, i64* %186
  %187 = load i64, i64* %178
  %select.val.78 = select i1 %184, i64 %183, i64 %187
  store i64 %select.val.78, i64* %select.ptr.77, align 8
  %188 = getelementptr inbounds i64, i64* %0, i64 7
  %189 = load i1, i1* %out.
  %190 = icmp slt i64 7, %len.
  %191 = bitcast i64* %shadow to i64*
  %safe.79 = or i1 %189, %190
  %select.ptr.80 = select i1 %safe.79, i64* %188, i64* %191
  %192 = load i64, i64* %select.ptr.80, align 8
  %193 = call i64 @div_by_2_25(i64 %192, i1 %.cond)
  %194 = shl i64 %193, 25
  %195 = getelementptr inbounds i64, i64* %0, i64 7
  %196 = load i1, i1* %out.
  %197 = icmp slt i64 7, %len.
  %198 = bitcast i64* %shadow to i64*
  %safe.81 = or i1 %196, %197
  %select.ptr.82 = select i1 %safe.81, i64* %195, i64* %198
  %199 = load i64, i64* %select.ptr.82, align 8
  %200 = sub nsw i64 %199, %194
  %201 = load i1, i1* %out.
  %202 = icmp slt i64 7, %len.
  %203 = bitcast i64* %shadow to i64*
  %safe.83 = or i1 %201, %202
  %select.ptr.84 = select i1 %safe.83, i64* %195, i64* %203
  %204 = load i64, i64* %195
  %select.val.85 = select i1 %201, i64 %200, i64 %204
  store i64 %select.val.85, i64* %select.ptr.84, align 8
  %205 = getelementptr inbounds i64, i64* %0, i64 8
  %206 = load i1, i1* %out.
  %207 = icmp slt i64 8, %len.
  %208 = bitcast i64* %shadow to i64*
  %safe.86 = or i1 %206, %207
  %select.ptr.87 = select i1 %safe.86, i64* %205, i64* %208
  %209 = load i64, i64* %select.ptr.87, align 8
  %210 = add nsw i64 %209, %193
  %211 = load i1, i1* %out.
  %212 = icmp slt i64 8, %len.
  %213 = bitcast i64* %shadow to i64*
  %safe.88 = or i1 %211, %212
  %select.ptr.89 = select i1 %safe.88, i64* %205, i64* %213
  %214 = load i64, i64* %205
  %select.val.90 = select i1 %211, i64 %210, i64 %214
  store i64 %select.val.90, i64* %select.ptr.89, align 8
  %215 = getelementptr inbounds i64, i64* %0, i64 8
  %216 = load i1, i1* %out.
  %217 = icmp slt i64 8, %len.
  %218 = bitcast i64* %shadow to i64*
  %safe.91 = or i1 %216, %217
  %select.ptr.92 = select i1 %safe.91, i64* %215, i64* %218
  %219 = load i64, i64* %select.ptr.92, align 8
  %220 = call i64 @div_by_2_26(i64 %219, i1 %.cond)
  %221 = shl i64 %220, 26
  %222 = getelementptr inbounds i64, i64* %0, i64 8
  %223 = load i1, i1* %out.
  %224 = icmp slt i64 8, %len.
  %225 = bitcast i64* %shadow to i64*
  %safe.93 = or i1 %223, %224
  %select.ptr.94 = select i1 %safe.93, i64* %222, i64* %225
  %226 = load i64, i64* %select.ptr.94, align 8
  %227 = sub nsw i64 %226, %221
  %228 = load i1, i1* %out.
  %229 = icmp slt i64 8, %len.
  %230 = bitcast i64* %shadow to i64*
  %safe.95 = or i1 %228, %229
  %select.ptr.96 = select i1 %safe.95, i64* %222, i64* %230
  %231 = load i64, i64* %222
  %select.val.97 = select i1 %228, i64 %227, i64 %231
  store i64 %select.val.97, i64* %select.ptr.96, align 8
  %232 = getelementptr inbounds i64, i64* %0, i64 9
  %233 = load i1, i1* %out.
  %234 = icmp slt i64 9, %len.
  %235 = bitcast i64* %shadow to i64*
  %safe.98 = or i1 %233, %234
  %select.ptr.99 = select i1 %safe.98, i64* %232, i64* %235
  %236 = load i64, i64* %select.ptr.99, align 8
  %237 = add nsw i64 %236, %220
  %238 = load i1, i1* %out.
  %239 = icmp slt i64 9, %len.
  %240 = bitcast i64* %shadow to i64*
  %safe.100 = or i1 %238, %239
  %select.ptr.101 = select i1 %safe.100, i64* %232, i64* %240
  %241 = load i64, i64* %232
  %select.val.102 = select i1 %238, i64 %237, i64 %241
  store i64 %select.val.102, i64* %select.ptr.101, align 8
  %242 = getelementptr inbounds i64, i64* %0, i64 9
  %243 = load i1, i1* %out.
  %244 = icmp slt i64 9, %len.
  %245 = bitcast i64* %shadow to i64*
  %safe.103 = or i1 %243, %244
  %select.ptr.104 = select i1 %safe.103, i64* %242, i64* %245
  %246 = load i64, i64* %select.ptr.104, align 8
  %247 = call i64 @div_by_2_25(i64 %246, i1 %.cond)
  %248 = shl i64 %247, 25
  %249 = getelementptr inbounds i64, i64* %0, i64 9
  %250 = load i1, i1* %out.
  %251 = icmp slt i64 9, %len.
  %252 = bitcast i64* %shadow to i64*
  %safe.105 = or i1 %250, %251
  %select.ptr.106 = select i1 %safe.105, i64* %249, i64* %252
  %253 = load i64, i64* %select.ptr.106, align 8
  %254 = sub nsw i64 %253, %248
  %255 = load i1, i1* %out.
  %256 = icmp slt i64 9, %len.
  %257 = bitcast i64* %shadow to i64*
  %safe.107 = or i1 %255, %256
  %select.ptr.108 = select i1 %safe.107, i64* %249, i64* %257
  %258 = load i64, i64* %249
  %select.val.109 = select i1 %255, i64 %254, i64 %258
  store i64 %select.val.109, i64* %select.ptr.108, align 8
  %259 = getelementptr inbounds i64, i64* %0, i64 10
  %260 = load i1, i1* %out.
  %261 = icmp slt i64 10, %len.
  %262 = bitcast i64* %shadow to i64*
  %safe.110 = or i1 %260, %261
  %select.ptr.111 = select i1 %safe.110, i64* %259, i64* %262
  %263 = load i64, i64* %select.ptr.111, align 8
  %264 = add nsw i64 %263, %247
  %265 = load i1, i1* %out.
  %266 = icmp slt i64 10, %len.
  %267 = bitcast i64* %shadow to i64*
  %safe.112 = or i1 %265, %266
  %select.ptr.113 = select i1 %safe.112, i64* %259, i64* %267
  %268 = load i64, i64* %259
  %select.val.114 = select i1 %265, i64 %264, i64 %268
  store i64 %select.val.114, i64* %select.ptr.113, align 8
  %269 = getelementptr inbounds i64, i64* %0, i64 10
  %270 = load i1, i1* %out.
  %271 = icmp slt i64 10, %len.
  %272 = bitcast i64* %shadow to i64*
  %safe.115 = or i1 %270, %271
  %select.ptr.116 = select i1 %safe.115, i64* %269, i64* %272
  %273 = load i64, i64* %select.ptr.116, align 8
  %274 = shl i64 %273, 4
  %275 = load i1, i1* %out.
  %276 = load i64, i64* %0, align 8
  %277 = add nsw i64 %276, %274
  %278 = load i1, i1* %out.
  %279 = load i64, i64* %0
  %select.val.117 = select i1 %278, i64 %277, i64 %279
  store i64 %select.val.117, i64* %0, align 8
  %280 = getelementptr inbounds i64, i64* %0, i64 10
  %281 = load i1, i1* %out.
  %282 = icmp slt i64 10, %len.
  %283 = bitcast i64* %shadow to i64*
  %safe.118 = or i1 %281, %282
  %select.ptr.119 = select i1 %safe.118, i64* %280, i64* %283
  %284 = load i64, i64* %select.ptr.119, align 8
  %285 = shl i64 %284, 1
  %286 = load i1, i1* %out.
  %287 = load i64, i64* %0, align 8
  %288 = add nsw i64 %287, %285
  %289 = load i1, i1* %out.
  %290 = load i64, i64* %0
  %select.val.120 = select i1 %289, i64 %288, i64 %290
  store i64 %select.val.120, i64* %0, align 8
  %291 = getelementptr inbounds i64, i64* %0, i64 10
  %292 = load i1, i1* %out.
  %293 = icmp slt i64 10, %len.
  %294 = bitcast i64* %shadow to i64*
  %safe.121 = or i1 %292, %293
  %select.ptr.122 = select i1 %safe.121, i64* %291, i64* %294
  %295 = load i64, i64* %select.ptr.122, align 8
  %296 = load i1, i1* %out.
  %297 = load i64, i64* %0, align 8
  %298 = add nsw i64 %297, %295
  %299 = load i1, i1* %out.
  %300 = load i64, i64* %0
  %select.val.123 = select i1 %299, i64 %298, i64 %300
  store i64 %select.val.123, i64* %0, align 8
  %301 = getelementptr inbounds i64, i64* %0, i64 10
  %302 = load i1, i1* %out.
  %303 = icmp slt i64 10, %len.
  %304 = bitcast i64* %shadow to i64*
  %safe.124 = or i1 %302, %303
  %select.ptr.125 = select i1 %safe.124, i64* %301, i64* %304
  %305 = load i64, i64* %301
  %select.val.126 = select i1 %302, i64 0, i64 %305
  store i64 %select.val.126, i64* %select.ptr.125, align 8
  %306 = load i1, i1* %out.
  %307 = load i64, i64* %0, align 8
  %308 = call i64 @div_by_2_26(i64 %307, i1 %.cond)
  %309 = shl i64 %308, 26
  %310 = load i1, i1* %out.
  %311 = load i64, i64* %0, align 8
  %312 = sub nsw i64 %311, %309
  %313 = load i1, i1* %out.
  %314 = load i64, i64* %0
  %select.val.127 = select i1 %313, i64 %312, i64 %314
  store i64 %select.val.127, i64* %0, align 8
  %315 = getelementptr inbounds i64, i64* %0, i64 1
  %316 = load i1, i1* %out.
  %317 = icmp slt i64 1, %len.
  %318 = bitcast i64* %shadow to i64*
  %safe.128 = or i1 %316, %317
  %select.ptr.129 = select i1 %safe.128, i64* %315, i64* %318
  %319 = load i64, i64* %select.ptr.129, align 8
  %320 = add nsw i64 %319, %308
  %321 = load i1, i1* %out.
  %322 = icmp slt i64 1, %len.
  %323 = bitcast i64* %shadow to i64*
  %safe.130 = or i1 %321, %322
  %select.ptr.131 = select i1 %safe.130, i64* %315, i64* %323
  %324 = load i64, i64* %315
  %select.val.132 = select i1 %321, i64 %320, i64 %324
  store i64 %select.val.132, i64* %select.ptr.131, align 8
  ret void
}

define internal i64 @div_by_2_26(i64 %0, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %2 = lshr i64 %0, 32
  %3 = trunc i64 %2 to i32
  %4 = ashr i32 %3, 31
  %5 = lshr i32 %4, 6
  %6 = sext i32 %5 to i64
  %7 = add nsw i64 %0, %6
  %8 = ashr i64 %7, 26
  ret i64 %8
}

define internal i64 @div_by_2_25(i64 %0, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %2 = lshr i64 %0, 32
  %3 = trunc i64 %2 to i32
  %4 = ashr i32 %3, 31
  %5 = lshr i32 %4, 7
  %6 = sext i32 %5 to i64
  %7 = add nsw i64 %0, %6
  %8 = ashr i64 %7, 25
  ret i64 %8
}

define internal void @fsquare(i64* %0, i64 %len., i64* %1, i64 %len.1, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %3 = alloca [19 x i64], align 16
  %4 = getelementptr inbounds [19 x i64], [19 x i64]* %3, i64 0, i64 0
  call void @fsquare_inner(i64* %4, i64 19, i64* %1, i64 %len.1, i1 %.cond)
  %5 = getelementptr inbounds [19 x i64], [19 x i64]* %3, i64 0, i64 0
  call void @freduce_degree(i64* %5, i64 19, i1 %.cond)
  %6 = getelementptr inbounds [19 x i64], [19 x i64]* %3, i64 0, i64 0
  call void @freduce_coefficients(i64* %6, i64 19, i1 %.cond)
  %7 = bitcast i64* %0 to i8*
  %8 = getelementptr inbounds [19 x i64], [19 x i64]* %3, i64 0, i64 0
  %9 = bitcast i64* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 16 %9, i64 80, i1 false)
  ret void
}

define internal void @fsquare_inner(i64* %0, i64 %len., i64* %1, i64 %len.1, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %3 = getelementptr inbounds i64, i64* %1, i64 0
  %4 = load i1, i1* %out.
  %5 = icmp slt i64 0, %len.1
  %6 = bitcast i64* %shadow to i64*
  %safe. = or i1 %4, %5
  %select.ptr. = select i1 %safe., i64* %3, i64* %6
  %7 = load i64, i64* %select.ptr., align 8
  %8 = trunc i64 %7 to i32
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i64, i64* %1, i64 0
  %11 = load i1, i1* %out.
  %12 = icmp slt i64 0, %len.1
  %13 = bitcast i64* %shadow to i64*
  %safe.2 = or i1 %11, %12
  %select.ptr.3 = select i1 %safe.2, i64* %10, i64* %13
  %14 = load i64, i64* %select.ptr.3, align 8
  %15 = trunc i64 %14 to i32
  %16 = sext i32 %15 to i64
  %17 = mul nsw i64 %9, %16
  %18 = getelementptr inbounds i64, i64* %0, i64 0
  %19 = load i1, i1* %out.
  %20 = icmp slt i64 0, %len.
  %21 = bitcast i64* %shadow to i64*
  %safe.4 = or i1 %19, %20
  %select.ptr.5 = select i1 %safe.4, i64* %18, i64* %21
  %22 = load i64, i64* %18
  %select.val. = select i1 %19, i64 %17, i64 %22
  store i64 %select.val., i64* %select.ptr.5, align 8
  %23 = getelementptr inbounds i64, i64* %1, i64 0
  %24 = load i1, i1* %out.
  %25 = icmp slt i64 0, %len.1
  %26 = bitcast i64* %shadow to i64*
  %safe.6 = or i1 %24, %25
  %select.ptr.7 = select i1 %safe.6, i64* %23, i64* %26
  %27 = load i64, i64* %select.ptr.7, align 8
  %28 = trunc i64 %27 to i32
  %29 = sext i32 %28 to i64
  %30 = mul nsw i64 2, %29
  %31 = getelementptr inbounds i64, i64* %1, i64 1
  %32 = load i1, i1* %out.
  %33 = icmp slt i64 1, %len.1
  %34 = bitcast i64* %shadow to i64*
  %safe.8 = or i1 %32, %33
  %select.ptr.9 = select i1 %safe.8, i64* %31, i64* %34
  %35 = load i64, i64* %select.ptr.9, align 8
  %36 = trunc i64 %35 to i32
  %37 = sext i32 %36 to i64
  %38 = mul nsw i64 %30, %37
  %39 = getelementptr inbounds i64, i64* %0, i64 1
  %40 = load i1, i1* %out.
  %41 = icmp slt i64 1, %len.
  %42 = bitcast i64* %shadow to i64*
  %safe.10 = or i1 %40, %41
  %select.ptr.11 = select i1 %safe.10, i64* %39, i64* %42
  %43 = load i64, i64* %39
  %select.val.12 = select i1 %40, i64 %38, i64 %43
  store i64 %select.val.12, i64* %select.ptr.11, align 8
  %44 = getelementptr inbounds i64, i64* %1, i64 1
  %45 = load i1, i1* %out.
  %46 = icmp slt i64 1, %len.1
  %47 = bitcast i64* %shadow to i64*
  %safe.13 = or i1 %45, %46
  %select.ptr.14 = select i1 %safe.13, i64* %44, i64* %47
  %48 = load i64, i64* %select.ptr.14, align 8
  %49 = trunc i64 %48 to i32
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i64, i64* %1, i64 1
  %52 = load i1, i1* %out.
  %53 = icmp slt i64 1, %len.1
  %54 = bitcast i64* %shadow to i64*
  %safe.15 = or i1 %52, %53
  %select.ptr.16 = select i1 %safe.15, i64* %51, i64* %54
  %55 = load i64, i64* %select.ptr.16, align 8
  %56 = trunc i64 %55 to i32
  %57 = sext i32 %56 to i64
  %58 = mul nsw i64 %50, %57
  %59 = getelementptr inbounds i64, i64* %1, i64 0
  %60 = load i1, i1* %out.
  %61 = icmp slt i64 0, %len.1
  %62 = bitcast i64* %shadow to i64*
  %safe.17 = or i1 %60, %61
  %select.ptr.18 = select i1 %safe.17, i64* %59, i64* %62
  %63 = load i64, i64* %select.ptr.18, align 8
  %64 = trunc i64 %63 to i32
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i64, i64* %1, i64 2
  %67 = load i1, i1* %out.
  %68 = icmp slt i64 2, %len.1
  %69 = bitcast i64* %shadow to i64*
  %safe.19 = or i1 %67, %68
  %select.ptr.20 = select i1 %safe.19, i64* %66, i64* %69
  %70 = load i64, i64* %select.ptr.20, align 8
  %71 = trunc i64 %70 to i32
  %72 = sext i32 %71 to i64
  %73 = mul nsw i64 %65, %72
  %74 = add nsw i64 %58, %73
  %75 = mul nsw i64 2, %74
  %76 = getelementptr inbounds i64, i64* %0, i64 2
  %77 = load i1, i1* %out.
  %78 = icmp slt i64 2, %len.
  %79 = bitcast i64* %shadow to i64*
  %safe.21 = or i1 %77, %78
  %select.ptr.22 = select i1 %safe.21, i64* %76, i64* %79
  %80 = load i64, i64* %76
  %select.val.23 = select i1 %77, i64 %75, i64 %80
  store i64 %select.val.23, i64* %select.ptr.22, align 8
  %81 = getelementptr inbounds i64, i64* %1, i64 1
  %82 = load i1, i1* %out.
  %83 = icmp slt i64 1, %len.1
  %84 = bitcast i64* %shadow to i64*
  %safe.24 = or i1 %82, %83
  %select.ptr.25 = select i1 %safe.24, i64* %81, i64* %84
  %85 = load i64, i64* %select.ptr.25, align 8
  %86 = trunc i64 %85 to i32
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i64, i64* %1, i64 2
  %89 = load i1, i1* %out.
  %90 = icmp slt i64 2, %len.1
  %91 = bitcast i64* %shadow to i64*
  %safe.26 = or i1 %89, %90
  %select.ptr.27 = select i1 %safe.26, i64* %88, i64* %91
  %92 = load i64, i64* %select.ptr.27, align 8
  %93 = trunc i64 %92 to i32
  %94 = sext i32 %93 to i64
  %95 = mul nsw i64 %87, %94
  %96 = getelementptr inbounds i64, i64* %1, i64 0
  %97 = load i1, i1* %out.
  %98 = icmp slt i64 0, %len.1
  %99 = bitcast i64* %shadow to i64*
  %safe.28 = or i1 %97, %98
  %select.ptr.29 = select i1 %safe.28, i64* %96, i64* %99
  %100 = load i64, i64* %select.ptr.29, align 8
  %101 = trunc i64 %100 to i32
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i64, i64* %1, i64 3
  %104 = load i1, i1* %out.
  %105 = icmp slt i64 3, %len.1
  %106 = bitcast i64* %shadow to i64*
  %safe.30 = or i1 %104, %105
  %select.ptr.31 = select i1 %safe.30, i64* %103, i64* %106
  %107 = load i64, i64* %select.ptr.31, align 8
  %108 = trunc i64 %107 to i32
  %109 = sext i32 %108 to i64
  %110 = mul nsw i64 %102, %109
  %111 = add nsw i64 %95, %110
  %112 = mul nsw i64 2, %111
  %113 = getelementptr inbounds i64, i64* %0, i64 3
  %114 = load i1, i1* %out.
  %115 = icmp slt i64 3, %len.
  %116 = bitcast i64* %shadow to i64*
  %safe.32 = or i1 %114, %115
  %select.ptr.33 = select i1 %safe.32, i64* %113, i64* %116
  %117 = load i64, i64* %113
  %select.val.34 = select i1 %114, i64 %112, i64 %117
  store i64 %select.val.34, i64* %select.ptr.33, align 8
  %118 = getelementptr inbounds i64, i64* %1, i64 2
  %119 = load i1, i1* %out.
  %120 = icmp slt i64 2, %len.1
  %121 = bitcast i64* %shadow to i64*
  %safe.35 = or i1 %119, %120
  %select.ptr.36 = select i1 %safe.35, i64* %118, i64* %121
  %122 = load i64, i64* %select.ptr.36, align 8
  %123 = trunc i64 %122 to i32
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i64, i64* %1, i64 2
  %126 = load i1, i1* %out.
  %127 = icmp slt i64 2, %len.1
  %128 = bitcast i64* %shadow to i64*
  %safe.37 = or i1 %126, %127
  %select.ptr.38 = select i1 %safe.37, i64* %125, i64* %128
  %129 = load i64, i64* %select.ptr.38, align 8
  %130 = trunc i64 %129 to i32
  %131 = sext i32 %130 to i64
  %132 = mul nsw i64 %124, %131
  %133 = getelementptr inbounds i64, i64* %1, i64 1
  %134 = load i1, i1* %out.
  %135 = icmp slt i64 1, %len.1
  %136 = bitcast i64* %shadow to i64*
  %safe.39 = or i1 %134, %135
  %select.ptr.40 = select i1 %safe.39, i64* %133, i64* %136
  %137 = load i64, i64* %select.ptr.40, align 8
  %138 = trunc i64 %137 to i32
  %139 = sext i32 %138 to i64
  %140 = mul nsw i64 4, %139
  %141 = getelementptr inbounds i64, i64* %1, i64 3
  %142 = load i1, i1* %out.
  %143 = icmp slt i64 3, %len.1
  %144 = bitcast i64* %shadow to i64*
  %safe.41 = or i1 %142, %143
  %select.ptr.42 = select i1 %safe.41, i64* %141, i64* %144
  %145 = load i64, i64* %select.ptr.42, align 8
  %146 = trunc i64 %145 to i32
  %147 = sext i32 %146 to i64
  %148 = mul nsw i64 %140, %147
  %149 = add nsw i64 %132, %148
  %150 = getelementptr inbounds i64, i64* %1, i64 0
  %151 = load i1, i1* %out.
  %152 = icmp slt i64 0, %len.1
  %153 = bitcast i64* %shadow to i64*
  %safe.43 = or i1 %151, %152
  %select.ptr.44 = select i1 %safe.43, i64* %150, i64* %153
  %154 = load i64, i64* %select.ptr.44, align 8
  %155 = trunc i64 %154 to i32
  %156 = sext i32 %155 to i64
  %157 = mul nsw i64 2, %156
  %158 = getelementptr inbounds i64, i64* %1, i64 4
  %159 = load i1, i1* %out.
  %160 = icmp slt i64 4, %len.1
  %161 = bitcast i64* %shadow to i64*
  %safe.45 = or i1 %159, %160
  %select.ptr.46 = select i1 %safe.45, i64* %158, i64* %161
  %162 = load i64, i64* %select.ptr.46, align 8
  %163 = trunc i64 %162 to i32
  %164 = sext i32 %163 to i64
  %165 = mul nsw i64 %157, %164
  %166 = add nsw i64 %149, %165
  %167 = getelementptr inbounds i64, i64* %0, i64 4
  %168 = load i1, i1* %out.
  %169 = icmp slt i64 4, %len.
  %170 = bitcast i64* %shadow to i64*
  %safe.47 = or i1 %168, %169
  %select.ptr.48 = select i1 %safe.47, i64* %167, i64* %170
  %171 = load i64, i64* %167
  %select.val.49 = select i1 %168, i64 %166, i64 %171
  store i64 %select.val.49, i64* %select.ptr.48, align 8
  %172 = getelementptr inbounds i64, i64* %1, i64 2
  %173 = load i1, i1* %out.
  %174 = icmp slt i64 2, %len.1
  %175 = bitcast i64* %shadow to i64*
  %safe.50 = or i1 %173, %174
  %select.ptr.51 = select i1 %safe.50, i64* %172, i64* %175
  %176 = load i64, i64* %select.ptr.51, align 8
  %177 = trunc i64 %176 to i32
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i64, i64* %1, i64 3
  %180 = load i1, i1* %out.
  %181 = icmp slt i64 3, %len.1
  %182 = bitcast i64* %shadow to i64*
  %safe.52 = or i1 %180, %181
  %select.ptr.53 = select i1 %safe.52, i64* %179, i64* %182
  %183 = load i64, i64* %select.ptr.53, align 8
  %184 = trunc i64 %183 to i32
  %185 = sext i32 %184 to i64
  %186 = mul nsw i64 %178, %185
  %187 = getelementptr inbounds i64, i64* %1, i64 1
  %188 = load i1, i1* %out.
  %189 = icmp slt i64 1, %len.1
  %190 = bitcast i64* %shadow to i64*
  %safe.54 = or i1 %188, %189
  %select.ptr.55 = select i1 %safe.54, i64* %187, i64* %190
  %191 = load i64, i64* %select.ptr.55, align 8
  %192 = trunc i64 %191 to i32
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i64, i64* %1, i64 4
  %195 = load i1, i1* %out.
  %196 = icmp slt i64 4, %len.1
  %197 = bitcast i64* %shadow to i64*
  %safe.56 = or i1 %195, %196
  %select.ptr.57 = select i1 %safe.56, i64* %194, i64* %197
  %198 = load i64, i64* %select.ptr.57, align 8
  %199 = trunc i64 %198 to i32
  %200 = sext i32 %199 to i64
  %201 = mul nsw i64 %193, %200
  %202 = add nsw i64 %186, %201
  %203 = getelementptr inbounds i64, i64* %1, i64 0
  %204 = load i1, i1* %out.
  %205 = icmp slt i64 0, %len.1
  %206 = bitcast i64* %shadow to i64*
  %safe.58 = or i1 %204, %205
  %select.ptr.59 = select i1 %safe.58, i64* %203, i64* %206
  %207 = load i64, i64* %select.ptr.59, align 8
  %208 = trunc i64 %207 to i32
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds i64, i64* %1, i64 5
  %211 = load i1, i1* %out.
  %212 = icmp slt i64 5, %len.1
  %213 = bitcast i64* %shadow to i64*
  %safe.60 = or i1 %211, %212
  %select.ptr.61 = select i1 %safe.60, i64* %210, i64* %213
  %214 = load i64, i64* %select.ptr.61, align 8
  %215 = trunc i64 %214 to i32
  %216 = sext i32 %215 to i64
  %217 = mul nsw i64 %209, %216
  %218 = add nsw i64 %202, %217
  %219 = mul nsw i64 2, %218
  %220 = getelementptr inbounds i64, i64* %0, i64 5
  %221 = load i1, i1* %out.
  %222 = icmp slt i64 5, %len.
  %223 = bitcast i64* %shadow to i64*
  %safe.62 = or i1 %221, %222
  %select.ptr.63 = select i1 %safe.62, i64* %220, i64* %223
  %224 = load i64, i64* %220
  %select.val.64 = select i1 %221, i64 %219, i64 %224
  store i64 %select.val.64, i64* %select.ptr.63, align 8
  %225 = getelementptr inbounds i64, i64* %1, i64 3
  %226 = load i1, i1* %out.
  %227 = icmp slt i64 3, %len.1
  %228 = bitcast i64* %shadow to i64*
  %safe.65 = or i1 %226, %227
  %select.ptr.66 = select i1 %safe.65, i64* %225, i64* %228
  %229 = load i64, i64* %select.ptr.66, align 8
  %230 = trunc i64 %229 to i32
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds i64, i64* %1, i64 3
  %233 = load i1, i1* %out.
  %234 = icmp slt i64 3, %len.1
  %235 = bitcast i64* %shadow to i64*
  %safe.67 = or i1 %233, %234
  %select.ptr.68 = select i1 %safe.67, i64* %232, i64* %235
  %236 = load i64, i64* %select.ptr.68, align 8
  %237 = trunc i64 %236 to i32
  %238 = sext i32 %237 to i64
  %239 = mul nsw i64 %231, %238
  %240 = getelementptr inbounds i64, i64* %1, i64 2
  %241 = load i1, i1* %out.
  %242 = icmp slt i64 2, %len.1
  %243 = bitcast i64* %shadow to i64*
  %safe.69 = or i1 %241, %242
  %select.ptr.70 = select i1 %safe.69, i64* %240, i64* %243
  %244 = load i64, i64* %select.ptr.70, align 8
  %245 = trunc i64 %244 to i32
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds i64, i64* %1, i64 4
  %248 = load i1, i1* %out.
  %249 = icmp slt i64 4, %len.1
  %250 = bitcast i64* %shadow to i64*
  %safe.71 = or i1 %248, %249
  %select.ptr.72 = select i1 %safe.71, i64* %247, i64* %250
  %251 = load i64, i64* %select.ptr.72, align 8
  %252 = trunc i64 %251 to i32
  %253 = sext i32 %252 to i64
  %254 = mul nsw i64 %246, %253
  %255 = add nsw i64 %239, %254
  %256 = getelementptr inbounds i64, i64* %1, i64 0
  %257 = load i1, i1* %out.
  %258 = icmp slt i64 0, %len.1
  %259 = bitcast i64* %shadow to i64*
  %safe.73 = or i1 %257, %258
  %select.ptr.74 = select i1 %safe.73, i64* %256, i64* %259
  %260 = load i64, i64* %select.ptr.74, align 8
  %261 = trunc i64 %260 to i32
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds i64, i64* %1, i64 6
  %264 = load i1, i1* %out.
  %265 = icmp slt i64 6, %len.1
  %266 = bitcast i64* %shadow to i64*
  %safe.75 = or i1 %264, %265
  %select.ptr.76 = select i1 %safe.75, i64* %263, i64* %266
  %267 = load i64, i64* %select.ptr.76, align 8
  %268 = trunc i64 %267 to i32
  %269 = sext i32 %268 to i64
  %270 = mul nsw i64 %262, %269
  %271 = add nsw i64 %255, %270
  %272 = getelementptr inbounds i64, i64* %1, i64 1
  %273 = load i1, i1* %out.
  %274 = icmp slt i64 1, %len.1
  %275 = bitcast i64* %shadow to i64*
  %safe.77 = or i1 %273, %274
  %select.ptr.78 = select i1 %safe.77, i64* %272, i64* %275
  %276 = load i64, i64* %select.ptr.78, align 8
  %277 = trunc i64 %276 to i32
  %278 = sext i32 %277 to i64
  %279 = mul nsw i64 2, %278
  %280 = getelementptr inbounds i64, i64* %1, i64 5
  %281 = load i1, i1* %out.
  %282 = icmp slt i64 5, %len.1
  %283 = bitcast i64* %shadow to i64*
  %safe.79 = or i1 %281, %282
  %select.ptr.80 = select i1 %safe.79, i64* %280, i64* %283
  %284 = load i64, i64* %select.ptr.80, align 8
  %285 = trunc i64 %284 to i32
  %286 = sext i32 %285 to i64
  %287 = mul nsw i64 %279, %286
  %288 = add nsw i64 %271, %287
  %289 = mul nsw i64 2, %288
  %290 = getelementptr inbounds i64, i64* %0, i64 6
  %291 = load i1, i1* %out.
  %292 = icmp slt i64 6, %len.
  %293 = bitcast i64* %shadow to i64*
  %safe.81 = or i1 %291, %292
  %select.ptr.82 = select i1 %safe.81, i64* %290, i64* %293
  %294 = load i64, i64* %290
  %select.val.83 = select i1 %291, i64 %289, i64 %294
  store i64 %select.val.83, i64* %select.ptr.82, align 8
  %295 = getelementptr inbounds i64, i64* %1, i64 3
  %296 = load i1, i1* %out.
  %297 = icmp slt i64 3, %len.1
  %298 = bitcast i64* %shadow to i64*
  %safe.84 = or i1 %296, %297
  %select.ptr.85 = select i1 %safe.84, i64* %295, i64* %298
  %299 = load i64, i64* %select.ptr.85, align 8
  %300 = trunc i64 %299 to i32
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds i64, i64* %1, i64 4
  %303 = load i1, i1* %out.
  %304 = icmp slt i64 4, %len.1
  %305 = bitcast i64* %shadow to i64*
  %safe.86 = or i1 %303, %304
  %select.ptr.87 = select i1 %safe.86, i64* %302, i64* %305
  %306 = load i64, i64* %select.ptr.87, align 8
  %307 = trunc i64 %306 to i32
  %308 = sext i32 %307 to i64
  %309 = mul nsw i64 %301, %308
  %310 = getelementptr inbounds i64, i64* %1, i64 2
  %311 = load i1, i1* %out.
  %312 = icmp slt i64 2, %len.1
  %313 = bitcast i64* %shadow to i64*
  %safe.88 = or i1 %311, %312
  %select.ptr.89 = select i1 %safe.88, i64* %310, i64* %313
  %314 = load i64, i64* %select.ptr.89, align 8
  %315 = trunc i64 %314 to i32
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds i64, i64* %1, i64 5
  %318 = load i1, i1* %out.
  %319 = icmp slt i64 5, %len.1
  %320 = bitcast i64* %shadow to i64*
  %safe.90 = or i1 %318, %319
  %select.ptr.91 = select i1 %safe.90, i64* %317, i64* %320
  %321 = load i64, i64* %select.ptr.91, align 8
  %322 = trunc i64 %321 to i32
  %323 = sext i32 %322 to i64
  %324 = mul nsw i64 %316, %323
  %325 = add nsw i64 %309, %324
  %326 = getelementptr inbounds i64, i64* %1, i64 1
  %327 = load i1, i1* %out.
  %328 = icmp slt i64 1, %len.1
  %329 = bitcast i64* %shadow to i64*
  %safe.92 = or i1 %327, %328
  %select.ptr.93 = select i1 %safe.92, i64* %326, i64* %329
  %330 = load i64, i64* %select.ptr.93, align 8
  %331 = trunc i64 %330 to i32
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds i64, i64* %1, i64 6
  %334 = load i1, i1* %out.
  %335 = icmp slt i64 6, %len.1
  %336 = bitcast i64* %shadow to i64*
  %safe.94 = or i1 %334, %335
  %select.ptr.95 = select i1 %safe.94, i64* %333, i64* %336
  %337 = load i64, i64* %select.ptr.95, align 8
  %338 = trunc i64 %337 to i32
  %339 = sext i32 %338 to i64
  %340 = mul nsw i64 %332, %339
  %341 = add nsw i64 %325, %340
  %342 = getelementptr inbounds i64, i64* %1, i64 0
  %343 = load i1, i1* %out.
  %344 = icmp slt i64 0, %len.1
  %345 = bitcast i64* %shadow to i64*
  %safe.96 = or i1 %343, %344
  %select.ptr.97 = select i1 %safe.96, i64* %342, i64* %345
  %346 = load i64, i64* %select.ptr.97, align 8
  %347 = trunc i64 %346 to i32
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds i64, i64* %1, i64 7
  %350 = load i1, i1* %out.
  %351 = icmp slt i64 7, %len.1
  %352 = bitcast i64* %shadow to i64*
  %safe.98 = or i1 %350, %351
  %select.ptr.99 = select i1 %safe.98, i64* %349, i64* %352
  %353 = load i64, i64* %select.ptr.99, align 8
  %354 = trunc i64 %353 to i32
  %355 = sext i32 %354 to i64
  %356 = mul nsw i64 %348, %355
  %357 = add nsw i64 %341, %356
  %358 = mul nsw i64 2, %357
  %359 = getelementptr inbounds i64, i64* %0, i64 7
  %360 = load i1, i1* %out.
  %361 = icmp slt i64 7, %len.
  %362 = bitcast i64* %shadow to i64*
  %safe.100 = or i1 %360, %361
  %select.ptr.101 = select i1 %safe.100, i64* %359, i64* %362
  %363 = load i64, i64* %359
  %select.val.102 = select i1 %360, i64 %358, i64 %363
  store i64 %select.val.102, i64* %select.ptr.101, align 8
  %364 = getelementptr inbounds i64, i64* %1, i64 4
  %365 = load i1, i1* %out.
  %366 = icmp slt i64 4, %len.1
  %367 = bitcast i64* %shadow to i64*
  %safe.103 = or i1 %365, %366
  %select.ptr.104 = select i1 %safe.103, i64* %364, i64* %367
  %368 = load i64, i64* %select.ptr.104, align 8
  %369 = trunc i64 %368 to i32
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds i64, i64* %1, i64 4
  %372 = load i1, i1* %out.
  %373 = icmp slt i64 4, %len.1
  %374 = bitcast i64* %shadow to i64*
  %safe.105 = or i1 %372, %373
  %select.ptr.106 = select i1 %safe.105, i64* %371, i64* %374
  %375 = load i64, i64* %select.ptr.106, align 8
  %376 = trunc i64 %375 to i32
  %377 = sext i32 %376 to i64
  %378 = mul nsw i64 %370, %377
  %379 = getelementptr inbounds i64, i64* %1, i64 2
  %380 = load i1, i1* %out.
  %381 = icmp slt i64 2, %len.1
  %382 = bitcast i64* %shadow to i64*
  %safe.107 = or i1 %380, %381
  %select.ptr.108 = select i1 %safe.107, i64* %379, i64* %382
  %383 = load i64, i64* %select.ptr.108, align 8
  %384 = trunc i64 %383 to i32
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds i64, i64* %1, i64 6
  %387 = load i1, i1* %out.
  %388 = icmp slt i64 6, %len.1
  %389 = bitcast i64* %shadow to i64*
  %safe.109 = or i1 %387, %388
  %select.ptr.110 = select i1 %safe.109, i64* %386, i64* %389
  %390 = load i64, i64* %select.ptr.110, align 8
  %391 = trunc i64 %390 to i32
  %392 = sext i32 %391 to i64
  %393 = mul nsw i64 %385, %392
  %394 = getelementptr inbounds i64, i64* %1, i64 0
  %395 = load i1, i1* %out.
  %396 = icmp slt i64 0, %len.1
  %397 = bitcast i64* %shadow to i64*
  %safe.111 = or i1 %395, %396
  %select.ptr.112 = select i1 %safe.111, i64* %394, i64* %397
  %398 = load i64, i64* %select.ptr.112, align 8
  %399 = trunc i64 %398 to i32
  %400 = sext i32 %399 to i64
  %401 = getelementptr inbounds i64, i64* %1, i64 8
  %402 = load i1, i1* %out.
  %403 = icmp slt i64 8, %len.1
  %404 = bitcast i64* %shadow to i64*
  %safe.113 = or i1 %402, %403
  %select.ptr.114 = select i1 %safe.113, i64* %401, i64* %404
  %405 = load i64, i64* %select.ptr.114, align 8
  %406 = trunc i64 %405 to i32
  %407 = sext i32 %406 to i64
  %408 = mul nsw i64 %400, %407
  %409 = add nsw i64 %393, %408
  %410 = getelementptr inbounds i64, i64* %1, i64 1
  %411 = load i1, i1* %out.
  %412 = icmp slt i64 1, %len.1
  %413 = bitcast i64* %shadow to i64*
  %safe.115 = or i1 %411, %412
  %select.ptr.116 = select i1 %safe.115, i64* %410, i64* %413
  %414 = load i64, i64* %select.ptr.116, align 8
  %415 = trunc i64 %414 to i32
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds i64, i64* %1, i64 7
  %418 = load i1, i1* %out.
  %419 = icmp slt i64 7, %len.1
  %420 = bitcast i64* %shadow to i64*
  %safe.117 = or i1 %418, %419
  %select.ptr.118 = select i1 %safe.117, i64* %417, i64* %420
  %421 = load i64, i64* %select.ptr.118, align 8
  %422 = trunc i64 %421 to i32
  %423 = sext i32 %422 to i64
  %424 = mul nsw i64 %416, %423
  %425 = getelementptr inbounds i64, i64* %1, i64 3
  %426 = load i1, i1* %out.
  %427 = icmp slt i64 3, %len.1
  %428 = bitcast i64* %shadow to i64*
  %safe.119 = or i1 %426, %427
  %select.ptr.120 = select i1 %safe.119, i64* %425, i64* %428
  %429 = load i64, i64* %select.ptr.120, align 8
  %430 = trunc i64 %429 to i32
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds i64, i64* %1, i64 5
  %433 = load i1, i1* %out.
  %434 = icmp slt i64 5, %len.1
  %435 = bitcast i64* %shadow to i64*
  %safe.121 = or i1 %433, %434
  %select.ptr.122 = select i1 %safe.121, i64* %432, i64* %435
  %436 = load i64, i64* %select.ptr.122, align 8
  %437 = trunc i64 %436 to i32
  %438 = sext i32 %437 to i64
  %439 = mul nsw i64 %431, %438
  %440 = add nsw i64 %424, %439
  %441 = mul nsw i64 2, %440
  %442 = add nsw i64 %409, %441
  %443 = mul nsw i64 2, %442
  %444 = add nsw i64 %378, %443
  %445 = getelementptr inbounds i64, i64* %0, i64 8
  %446 = load i1, i1* %out.
  %447 = icmp slt i64 8, %len.
  %448 = bitcast i64* %shadow to i64*
  %safe.123 = or i1 %446, %447
  %select.ptr.124 = select i1 %safe.123, i64* %445, i64* %448
  %449 = load i64, i64* %445
  %select.val.125 = select i1 %446, i64 %444, i64 %449
  store i64 %select.val.125, i64* %select.ptr.124, align 8
  %450 = getelementptr inbounds i64, i64* %1, i64 4
  %451 = load i1, i1* %out.
  %452 = icmp slt i64 4, %len.1
  %453 = bitcast i64* %shadow to i64*
  %safe.126 = or i1 %451, %452
  %select.ptr.127 = select i1 %safe.126, i64* %450, i64* %453
  %454 = load i64, i64* %select.ptr.127, align 8
  %455 = trunc i64 %454 to i32
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds i64, i64* %1, i64 5
  %458 = load i1, i1* %out.
  %459 = icmp slt i64 5, %len.1
  %460 = bitcast i64* %shadow to i64*
  %safe.128 = or i1 %458, %459
  %select.ptr.129 = select i1 %safe.128, i64* %457, i64* %460
  %461 = load i64, i64* %select.ptr.129, align 8
  %462 = trunc i64 %461 to i32
  %463 = sext i32 %462 to i64
  %464 = mul nsw i64 %456, %463
  %465 = getelementptr inbounds i64, i64* %1, i64 3
  %466 = load i1, i1* %out.
  %467 = icmp slt i64 3, %len.1
  %468 = bitcast i64* %shadow to i64*
  %safe.130 = or i1 %466, %467
  %select.ptr.131 = select i1 %safe.130, i64* %465, i64* %468
  %469 = load i64, i64* %select.ptr.131, align 8
  %470 = trunc i64 %469 to i32
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds i64, i64* %1, i64 6
  %473 = load i1, i1* %out.
  %474 = icmp slt i64 6, %len.1
  %475 = bitcast i64* %shadow to i64*
  %safe.132 = or i1 %473, %474
  %select.ptr.133 = select i1 %safe.132, i64* %472, i64* %475
  %476 = load i64, i64* %select.ptr.133, align 8
  %477 = trunc i64 %476 to i32
  %478 = sext i32 %477 to i64
  %479 = mul nsw i64 %471, %478
  %480 = add nsw i64 %464, %479
  %481 = getelementptr inbounds i64, i64* %1, i64 2
  %482 = load i1, i1* %out.
  %483 = icmp slt i64 2, %len.1
  %484 = bitcast i64* %shadow to i64*
  %safe.134 = or i1 %482, %483
  %select.ptr.135 = select i1 %safe.134, i64* %481, i64* %484
  %485 = load i64, i64* %select.ptr.135, align 8
  %486 = trunc i64 %485 to i32
  %487 = sext i32 %486 to i64
  %488 = getelementptr inbounds i64, i64* %1, i64 7
  %489 = load i1, i1* %out.
  %490 = icmp slt i64 7, %len.1
  %491 = bitcast i64* %shadow to i64*
  %safe.136 = or i1 %489, %490
  %select.ptr.137 = select i1 %safe.136, i64* %488, i64* %491
  %492 = load i64, i64* %select.ptr.137, align 8
  %493 = trunc i64 %492 to i32
  %494 = sext i32 %493 to i64
  %495 = mul nsw i64 %487, %494
  %496 = add nsw i64 %480, %495
  %497 = getelementptr inbounds i64, i64* %1, i64 1
  %498 = load i1, i1* %out.
  %499 = icmp slt i64 1, %len.1
  %500 = bitcast i64* %shadow to i64*
  %safe.138 = or i1 %498, %499
  %select.ptr.139 = select i1 %safe.138, i64* %497, i64* %500
  %501 = load i64, i64* %select.ptr.139, align 8
  %502 = trunc i64 %501 to i32
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds i64, i64* %1, i64 8
  %505 = load i1, i1* %out.
  %506 = icmp slt i64 8, %len.1
  %507 = bitcast i64* %shadow to i64*
  %safe.140 = or i1 %505, %506
  %select.ptr.141 = select i1 %safe.140, i64* %504, i64* %507
  %508 = load i64, i64* %select.ptr.141, align 8
  %509 = trunc i64 %508 to i32
  %510 = sext i32 %509 to i64
  %511 = mul nsw i64 %503, %510
  %512 = add nsw i64 %496, %511
  %513 = getelementptr inbounds i64, i64* %1, i64 0
  %514 = load i1, i1* %out.
  %515 = icmp slt i64 0, %len.1
  %516 = bitcast i64* %shadow to i64*
  %safe.142 = or i1 %514, %515
  %select.ptr.143 = select i1 %safe.142, i64* %513, i64* %516
  %517 = load i64, i64* %select.ptr.143, align 8
  %518 = trunc i64 %517 to i32
  %519 = sext i32 %518 to i64
  %520 = getelementptr inbounds i64, i64* %1, i64 9
  %521 = load i1, i1* %out.
  %522 = icmp slt i64 9, %len.1
  %523 = bitcast i64* %shadow to i64*
  %safe.144 = or i1 %521, %522
  %select.ptr.145 = select i1 %safe.144, i64* %520, i64* %523
  %524 = load i64, i64* %select.ptr.145, align 8
  %525 = trunc i64 %524 to i32
  %526 = sext i32 %525 to i64
  %527 = mul nsw i64 %519, %526
  %528 = add nsw i64 %512, %527
  %529 = mul nsw i64 2, %528
  %530 = getelementptr inbounds i64, i64* %0, i64 9
  %531 = load i1, i1* %out.
  %532 = icmp slt i64 9, %len.
  %533 = bitcast i64* %shadow to i64*
  %safe.146 = or i1 %531, %532
  %select.ptr.147 = select i1 %safe.146, i64* %530, i64* %533
  %534 = load i64, i64* %530
  %select.val.148 = select i1 %531, i64 %529, i64 %534
  store i64 %select.val.148, i64* %select.ptr.147, align 8
  %535 = getelementptr inbounds i64, i64* %1, i64 5
  %536 = load i1, i1* %out.
  %537 = icmp slt i64 5, %len.1
  %538 = bitcast i64* %shadow to i64*
  %safe.149 = or i1 %536, %537
  %select.ptr.150 = select i1 %safe.149, i64* %535, i64* %538
  %539 = load i64, i64* %select.ptr.150, align 8
  %540 = trunc i64 %539 to i32
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds i64, i64* %1, i64 5
  %543 = load i1, i1* %out.
  %544 = icmp slt i64 5, %len.1
  %545 = bitcast i64* %shadow to i64*
  %safe.151 = or i1 %543, %544
  %select.ptr.152 = select i1 %safe.151, i64* %542, i64* %545
  %546 = load i64, i64* %select.ptr.152, align 8
  %547 = trunc i64 %546 to i32
  %548 = sext i32 %547 to i64
  %549 = mul nsw i64 %541, %548
  %550 = getelementptr inbounds i64, i64* %1, i64 4
  %551 = load i1, i1* %out.
  %552 = icmp slt i64 4, %len.1
  %553 = bitcast i64* %shadow to i64*
  %safe.153 = or i1 %551, %552
  %select.ptr.154 = select i1 %safe.153, i64* %550, i64* %553
  %554 = load i64, i64* %select.ptr.154, align 8
  %555 = trunc i64 %554 to i32
  %556 = sext i32 %555 to i64
  %557 = getelementptr inbounds i64, i64* %1, i64 6
  %558 = load i1, i1* %out.
  %559 = icmp slt i64 6, %len.1
  %560 = bitcast i64* %shadow to i64*
  %safe.155 = or i1 %558, %559
  %select.ptr.156 = select i1 %safe.155, i64* %557, i64* %560
  %561 = load i64, i64* %select.ptr.156, align 8
  %562 = trunc i64 %561 to i32
  %563 = sext i32 %562 to i64
  %564 = mul nsw i64 %556, %563
  %565 = add nsw i64 %549, %564
  %566 = getelementptr inbounds i64, i64* %1, i64 2
  %567 = load i1, i1* %out.
  %568 = icmp slt i64 2, %len.1
  %569 = bitcast i64* %shadow to i64*
  %safe.157 = or i1 %567, %568
  %select.ptr.158 = select i1 %safe.157, i64* %566, i64* %569
  %570 = load i64, i64* %select.ptr.158, align 8
  %571 = trunc i64 %570 to i32
  %572 = sext i32 %571 to i64
  %573 = getelementptr inbounds i64, i64* %1, i64 8
  %574 = load i1, i1* %out.
  %575 = icmp slt i64 8, %len.1
  %576 = bitcast i64* %shadow to i64*
  %safe.159 = or i1 %574, %575
  %select.ptr.160 = select i1 %safe.159, i64* %573, i64* %576
  %577 = load i64, i64* %select.ptr.160, align 8
  %578 = trunc i64 %577 to i32
  %579 = sext i32 %578 to i64
  %580 = mul nsw i64 %572, %579
  %581 = add nsw i64 %565, %580
  %582 = getelementptr inbounds i64, i64* %1, i64 3
  %583 = load i1, i1* %out.
  %584 = icmp slt i64 3, %len.1
  %585 = bitcast i64* %shadow to i64*
  %safe.161 = or i1 %583, %584
  %select.ptr.162 = select i1 %safe.161, i64* %582, i64* %585
  %586 = load i64, i64* %select.ptr.162, align 8
  %587 = trunc i64 %586 to i32
  %588 = sext i32 %587 to i64
  %589 = getelementptr inbounds i64, i64* %1, i64 7
  %590 = load i1, i1* %out.
  %591 = icmp slt i64 7, %len.1
  %592 = bitcast i64* %shadow to i64*
  %safe.163 = or i1 %590, %591
  %select.ptr.164 = select i1 %safe.163, i64* %589, i64* %592
  %593 = load i64, i64* %select.ptr.164, align 8
  %594 = trunc i64 %593 to i32
  %595 = sext i32 %594 to i64
  %596 = mul nsw i64 %588, %595
  %597 = getelementptr inbounds i64, i64* %1, i64 1
  %598 = load i1, i1* %out.
  %599 = icmp slt i64 1, %len.1
  %600 = bitcast i64* %shadow to i64*
  %safe.165 = or i1 %598, %599
  %select.ptr.166 = select i1 %safe.165, i64* %597, i64* %600
  %601 = load i64, i64* %select.ptr.166, align 8
  %602 = trunc i64 %601 to i32
  %603 = sext i32 %602 to i64
  %604 = getelementptr inbounds i64, i64* %1, i64 9
  %605 = load i1, i1* %out.
  %606 = icmp slt i64 9, %len.1
  %607 = bitcast i64* %shadow to i64*
  %safe.167 = or i1 %605, %606
  %select.ptr.168 = select i1 %safe.167, i64* %604, i64* %607
  %608 = load i64, i64* %select.ptr.168, align 8
  %609 = trunc i64 %608 to i32
  %610 = sext i32 %609 to i64
  %611 = mul nsw i64 %603, %610
  %612 = add nsw i64 %596, %611
  %613 = mul nsw i64 2, %612
  %614 = add nsw i64 %581, %613
  %615 = mul nsw i64 2, %614
  %616 = getelementptr inbounds i64, i64* %0, i64 10
  %617 = load i1, i1* %out.
  %618 = icmp slt i64 10, %len.
  %619 = bitcast i64* %shadow to i64*
  %safe.169 = or i1 %617, %618
  %select.ptr.170 = select i1 %safe.169, i64* %616, i64* %619
  %620 = load i64, i64* %616
  %select.val.171 = select i1 %617, i64 %615, i64 %620
  store i64 %select.val.171, i64* %select.ptr.170, align 8
  %621 = getelementptr inbounds i64, i64* %1, i64 5
  %622 = load i1, i1* %out.
  %623 = icmp slt i64 5, %len.1
  %624 = bitcast i64* %shadow to i64*
  %safe.172 = or i1 %622, %623
  %select.ptr.173 = select i1 %safe.172, i64* %621, i64* %624
  %625 = load i64, i64* %select.ptr.173, align 8
  %626 = trunc i64 %625 to i32
  %627 = sext i32 %626 to i64
  %628 = getelementptr inbounds i64, i64* %1, i64 6
  %629 = load i1, i1* %out.
  %630 = icmp slt i64 6, %len.1
  %631 = bitcast i64* %shadow to i64*
  %safe.174 = or i1 %629, %630
  %select.ptr.175 = select i1 %safe.174, i64* %628, i64* %631
  %632 = load i64, i64* %select.ptr.175, align 8
  %633 = trunc i64 %632 to i32
  %634 = sext i32 %633 to i64
  %635 = mul nsw i64 %627, %634
  %636 = getelementptr inbounds i64, i64* %1, i64 4
  %637 = load i1, i1* %out.
  %638 = icmp slt i64 4, %len.1
  %639 = bitcast i64* %shadow to i64*
  %safe.176 = or i1 %637, %638
  %select.ptr.177 = select i1 %safe.176, i64* %636, i64* %639
  %640 = load i64, i64* %select.ptr.177, align 8
  %641 = trunc i64 %640 to i32
  %642 = sext i32 %641 to i64
  %643 = getelementptr inbounds i64, i64* %1, i64 7
  %644 = load i1, i1* %out.
  %645 = icmp slt i64 7, %len.1
  %646 = bitcast i64* %shadow to i64*
  %safe.178 = or i1 %644, %645
  %select.ptr.179 = select i1 %safe.178, i64* %643, i64* %646
  %647 = load i64, i64* %select.ptr.179, align 8
  %648 = trunc i64 %647 to i32
  %649 = sext i32 %648 to i64
  %650 = mul nsw i64 %642, %649
  %651 = add nsw i64 %635, %650
  %652 = getelementptr inbounds i64, i64* %1, i64 3
  %653 = load i1, i1* %out.
  %654 = icmp slt i64 3, %len.1
  %655 = bitcast i64* %shadow to i64*
  %safe.180 = or i1 %653, %654
  %select.ptr.181 = select i1 %safe.180, i64* %652, i64* %655
  %656 = load i64, i64* %select.ptr.181, align 8
  %657 = trunc i64 %656 to i32
  %658 = sext i32 %657 to i64
  %659 = getelementptr inbounds i64, i64* %1, i64 8
  %660 = load i1, i1* %out.
  %661 = icmp slt i64 8, %len.1
  %662 = bitcast i64* %shadow to i64*
  %safe.182 = or i1 %660, %661
  %select.ptr.183 = select i1 %safe.182, i64* %659, i64* %662
  %663 = load i64, i64* %select.ptr.183, align 8
  %664 = trunc i64 %663 to i32
  %665 = sext i32 %664 to i64
  %666 = mul nsw i64 %658, %665
  %667 = add nsw i64 %651, %666
  %668 = getelementptr inbounds i64, i64* %1, i64 2
  %669 = load i1, i1* %out.
  %670 = icmp slt i64 2, %len.1
  %671 = bitcast i64* %shadow to i64*
  %safe.184 = or i1 %669, %670
  %select.ptr.185 = select i1 %safe.184, i64* %668, i64* %671
  %672 = load i64, i64* %select.ptr.185, align 8
  %673 = trunc i64 %672 to i32
  %674 = sext i32 %673 to i64
  %675 = getelementptr inbounds i64, i64* %1, i64 9
  %676 = load i1, i1* %out.
  %677 = icmp slt i64 9, %len.1
  %678 = bitcast i64* %shadow to i64*
  %safe.186 = or i1 %676, %677
  %select.ptr.187 = select i1 %safe.186, i64* %675, i64* %678
  %679 = load i64, i64* %select.ptr.187, align 8
  %680 = trunc i64 %679 to i32
  %681 = sext i32 %680 to i64
  %682 = mul nsw i64 %674, %681
  %683 = add nsw i64 %667, %682
  %684 = mul nsw i64 2, %683
  %685 = getelementptr inbounds i64, i64* %0, i64 11
  %686 = load i1, i1* %out.
  %687 = icmp slt i64 11, %len.
  %688 = bitcast i64* %shadow to i64*
  %safe.188 = or i1 %686, %687
  %select.ptr.189 = select i1 %safe.188, i64* %685, i64* %688
  %689 = load i64, i64* %685
  %select.val.190 = select i1 %686, i64 %684, i64 %689
  store i64 %select.val.190, i64* %select.ptr.189, align 8
  %690 = getelementptr inbounds i64, i64* %1, i64 6
  %691 = load i1, i1* %out.
  %692 = icmp slt i64 6, %len.1
  %693 = bitcast i64* %shadow to i64*
  %safe.191 = or i1 %691, %692
  %select.ptr.192 = select i1 %safe.191, i64* %690, i64* %693
  %694 = load i64, i64* %select.ptr.192, align 8
  %695 = trunc i64 %694 to i32
  %696 = sext i32 %695 to i64
  %697 = getelementptr inbounds i64, i64* %1, i64 6
  %698 = load i1, i1* %out.
  %699 = icmp slt i64 6, %len.1
  %700 = bitcast i64* %shadow to i64*
  %safe.193 = or i1 %698, %699
  %select.ptr.194 = select i1 %safe.193, i64* %697, i64* %700
  %701 = load i64, i64* %select.ptr.194, align 8
  %702 = trunc i64 %701 to i32
  %703 = sext i32 %702 to i64
  %704 = mul nsw i64 %696, %703
  %705 = getelementptr inbounds i64, i64* %1, i64 4
  %706 = load i1, i1* %out.
  %707 = icmp slt i64 4, %len.1
  %708 = bitcast i64* %shadow to i64*
  %safe.195 = or i1 %706, %707
  %select.ptr.196 = select i1 %safe.195, i64* %705, i64* %708
  %709 = load i64, i64* %select.ptr.196, align 8
  %710 = trunc i64 %709 to i32
  %711 = sext i32 %710 to i64
  %712 = getelementptr inbounds i64, i64* %1, i64 8
  %713 = load i1, i1* %out.
  %714 = icmp slt i64 8, %len.1
  %715 = bitcast i64* %shadow to i64*
  %safe.197 = or i1 %713, %714
  %select.ptr.198 = select i1 %safe.197, i64* %712, i64* %715
  %716 = load i64, i64* %select.ptr.198, align 8
  %717 = trunc i64 %716 to i32
  %718 = sext i32 %717 to i64
  %719 = mul nsw i64 %711, %718
  %720 = getelementptr inbounds i64, i64* %1, i64 5
  %721 = load i1, i1* %out.
  %722 = icmp slt i64 5, %len.1
  %723 = bitcast i64* %shadow to i64*
  %safe.199 = or i1 %721, %722
  %select.ptr.200 = select i1 %safe.199, i64* %720, i64* %723
  %724 = load i64, i64* %select.ptr.200, align 8
  %725 = trunc i64 %724 to i32
  %726 = sext i32 %725 to i64
  %727 = getelementptr inbounds i64, i64* %1, i64 7
  %728 = load i1, i1* %out.
  %729 = icmp slt i64 7, %len.1
  %730 = bitcast i64* %shadow to i64*
  %safe.201 = or i1 %728, %729
  %select.ptr.202 = select i1 %safe.201, i64* %727, i64* %730
  %731 = load i64, i64* %select.ptr.202, align 8
  %732 = trunc i64 %731 to i32
  %733 = sext i32 %732 to i64
  %734 = mul nsw i64 %726, %733
  %735 = getelementptr inbounds i64, i64* %1, i64 3
  %736 = load i1, i1* %out.
  %737 = icmp slt i64 3, %len.1
  %738 = bitcast i64* %shadow to i64*
  %safe.203 = or i1 %736, %737
  %select.ptr.204 = select i1 %safe.203, i64* %735, i64* %738
  %739 = load i64, i64* %select.ptr.204, align 8
  %740 = trunc i64 %739 to i32
  %741 = sext i32 %740 to i64
  %742 = getelementptr inbounds i64, i64* %1, i64 9
  %743 = load i1, i1* %out.
  %744 = icmp slt i64 9, %len.1
  %745 = bitcast i64* %shadow to i64*
  %safe.205 = or i1 %743, %744
  %select.ptr.206 = select i1 %safe.205, i64* %742, i64* %745
  %746 = load i64, i64* %select.ptr.206, align 8
  %747 = trunc i64 %746 to i32
  %748 = sext i32 %747 to i64
  %749 = mul nsw i64 %741, %748
  %750 = add nsw i64 %734, %749
  %751 = mul nsw i64 2, %750
  %752 = add nsw i64 %719, %751
  %753 = mul nsw i64 2, %752
  %754 = add nsw i64 %704, %753
  %755 = getelementptr inbounds i64, i64* %0, i64 12
  %756 = load i1, i1* %out.
  %757 = icmp slt i64 12, %len.
  %758 = bitcast i64* %shadow to i64*
  %safe.207 = or i1 %756, %757
  %select.ptr.208 = select i1 %safe.207, i64* %755, i64* %758
  %759 = load i64, i64* %755
  %select.val.209 = select i1 %756, i64 %754, i64 %759
  store i64 %select.val.209, i64* %select.ptr.208, align 8
  %760 = getelementptr inbounds i64, i64* %1, i64 6
  %761 = load i1, i1* %out.
  %762 = icmp slt i64 6, %len.1
  %763 = bitcast i64* %shadow to i64*
  %safe.210 = or i1 %761, %762
  %select.ptr.211 = select i1 %safe.210, i64* %760, i64* %763
  %764 = load i64, i64* %select.ptr.211, align 8
  %765 = trunc i64 %764 to i32
  %766 = sext i32 %765 to i64
  %767 = getelementptr inbounds i64, i64* %1, i64 7
  %768 = load i1, i1* %out.
  %769 = icmp slt i64 7, %len.1
  %770 = bitcast i64* %shadow to i64*
  %safe.212 = or i1 %768, %769
  %select.ptr.213 = select i1 %safe.212, i64* %767, i64* %770
  %771 = load i64, i64* %select.ptr.213, align 8
  %772 = trunc i64 %771 to i32
  %773 = sext i32 %772 to i64
  %774 = mul nsw i64 %766, %773
  %775 = getelementptr inbounds i64, i64* %1, i64 5
  %776 = load i1, i1* %out.
  %777 = icmp slt i64 5, %len.1
  %778 = bitcast i64* %shadow to i64*
  %safe.214 = or i1 %776, %777
  %select.ptr.215 = select i1 %safe.214, i64* %775, i64* %778
  %779 = load i64, i64* %select.ptr.215, align 8
  %780 = trunc i64 %779 to i32
  %781 = sext i32 %780 to i64
  %782 = getelementptr inbounds i64, i64* %1, i64 8
  %783 = load i1, i1* %out.
  %784 = icmp slt i64 8, %len.1
  %785 = bitcast i64* %shadow to i64*
  %safe.216 = or i1 %783, %784
  %select.ptr.217 = select i1 %safe.216, i64* %782, i64* %785
  %786 = load i64, i64* %select.ptr.217, align 8
  %787 = trunc i64 %786 to i32
  %788 = sext i32 %787 to i64
  %789 = mul nsw i64 %781, %788
  %790 = add nsw i64 %774, %789
  %791 = getelementptr inbounds i64, i64* %1, i64 4
  %792 = load i1, i1* %out.
  %793 = icmp slt i64 4, %len.1
  %794 = bitcast i64* %shadow to i64*
  %safe.218 = or i1 %792, %793
  %select.ptr.219 = select i1 %safe.218, i64* %791, i64* %794
  %795 = load i64, i64* %select.ptr.219, align 8
  %796 = trunc i64 %795 to i32
  %797 = sext i32 %796 to i64
  %798 = getelementptr inbounds i64, i64* %1, i64 9
  %799 = load i1, i1* %out.
  %800 = icmp slt i64 9, %len.1
  %801 = bitcast i64* %shadow to i64*
  %safe.220 = or i1 %799, %800
  %select.ptr.221 = select i1 %safe.220, i64* %798, i64* %801
  %802 = load i64, i64* %select.ptr.221, align 8
  %803 = trunc i64 %802 to i32
  %804 = sext i32 %803 to i64
  %805 = mul nsw i64 %797, %804
  %806 = add nsw i64 %790, %805
  %807 = mul nsw i64 2, %806
  %808 = getelementptr inbounds i64, i64* %0, i64 13
  %809 = load i1, i1* %out.
  %810 = icmp slt i64 13, %len.
  %811 = bitcast i64* %shadow to i64*
  %safe.222 = or i1 %809, %810
  %select.ptr.223 = select i1 %safe.222, i64* %808, i64* %811
  %812 = load i64, i64* %808
  %select.val.224 = select i1 %809, i64 %807, i64 %812
  store i64 %select.val.224, i64* %select.ptr.223, align 8
  %813 = getelementptr inbounds i64, i64* %1, i64 7
  %814 = load i1, i1* %out.
  %815 = icmp slt i64 7, %len.1
  %816 = bitcast i64* %shadow to i64*
  %safe.225 = or i1 %814, %815
  %select.ptr.226 = select i1 %safe.225, i64* %813, i64* %816
  %817 = load i64, i64* %select.ptr.226, align 8
  %818 = trunc i64 %817 to i32
  %819 = sext i32 %818 to i64
  %820 = getelementptr inbounds i64, i64* %1, i64 7
  %821 = load i1, i1* %out.
  %822 = icmp slt i64 7, %len.1
  %823 = bitcast i64* %shadow to i64*
  %safe.227 = or i1 %821, %822
  %select.ptr.228 = select i1 %safe.227, i64* %820, i64* %823
  %824 = load i64, i64* %select.ptr.228, align 8
  %825 = trunc i64 %824 to i32
  %826 = sext i32 %825 to i64
  %827 = mul nsw i64 %819, %826
  %828 = getelementptr inbounds i64, i64* %1, i64 6
  %829 = load i1, i1* %out.
  %830 = icmp slt i64 6, %len.1
  %831 = bitcast i64* %shadow to i64*
  %safe.229 = or i1 %829, %830
  %select.ptr.230 = select i1 %safe.229, i64* %828, i64* %831
  %832 = load i64, i64* %select.ptr.230, align 8
  %833 = trunc i64 %832 to i32
  %834 = sext i32 %833 to i64
  %835 = getelementptr inbounds i64, i64* %1, i64 8
  %836 = load i1, i1* %out.
  %837 = icmp slt i64 8, %len.1
  %838 = bitcast i64* %shadow to i64*
  %safe.231 = or i1 %836, %837
  %select.ptr.232 = select i1 %safe.231, i64* %835, i64* %838
  %839 = load i64, i64* %select.ptr.232, align 8
  %840 = trunc i64 %839 to i32
  %841 = sext i32 %840 to i64
  %842 = mul nsw i64 %834, %841
  %843 = add nsw i64 %827, %842
  %844 = getelementptr inbounds i64, i64* %1, i64 5
  %845 = load i1, i1* %out.
  %846 = icmp slt i64 5, %len.1
  %847 = bitcast i64* %shadow to i64*
  %safe.233 = or i1 %845, %846
  %select.ptr.234 = select i1 %safe.233, i64* %844, i64* %847
  %848 = load i64, i64* %select.ptr.234, align 8
  %849 = trunc i64 %848 to i32
  %850 = sext i32 %849 to i64
  %851 = mul nsw i64 2, %850
  %852 = getelementptr inbounds i64, i64* %1, i64 9
  %853 = load i1, i1* %out.
  %854 = icmp slt i64 9, %len.1
  %855 = bitcast i64* %shadow to i64*
  %safe.235 = or i1 %853, %854
  %select.ptr.236 = select i1 %safe.235, i64* %852, i64* %855
  %856 = load i64, i64* %select.ptr.236, align 8
  %857 = trunc i64 %856 to i32
  %858 = sext i32 %857 to i64
  %859 = mul nsw i64 %851, %858
  %860 = add nsw i64 %843, %859
  %861 = mul nsw i64 2, %860
  %862 = getelementptr inbounds i64, i64* %0, i64 14
  %863 = load i1, i1* %out.
  %864 = icmp slt i64 14, %len.
  %865 = bitcast i64* %shadow to i64*
  %safe.237 = or i1 %863, %864
  %select.ptr.238 = select i1 %safe.237, i64* %862, i64* %865
  %866 = load i64, i64* %862
  %select.val.239 = select i1 %863, i64 %861, i64 %866
  store i64 %select.val.239, i64* %select.ptr.238, align 8
  %867 = getelementptr inbounds i64, i64* %1, i64 7
  %868 = load i1, i1* %out.
  %869 = icmp slt i64 7, %len.1
  %870 = bitcast i64* %shadow to i64*
  %safe.240 = or i1 %868, %869
  %select.ptr.241 = select i1 %safe.240, i64* %867, i64* %870
  %871 = load i64, i64* %select.ptr.241, align 8
  %872 = trunc i64 %871 to i32
  %873 = sext i32 %872 to i64
  %874 = getelementptr inbounds i64, i64* %1, i64 8
  %875 = load i1, i1* %out.
  %876 = icmp slt i64 8, %len.1
  %877 = bitcast i64* %shadow to i64*
  %safe.242 = or i1 %875, %876
  %select.ptr.243 = select i1 %safe.242, i64* %874, i64* %877
  %878 = load i64, i64* %select.ptr.243, align 8
  %879 = trunc i64 %878 to i32
  %880 = sext i32 %879 to i64
  %881 = mul nsw i64 %873, %880
  %882 = getelementptr inbounds i64, i64* %1, i64 6
  %883 = load i1, i1* %out.
  %884 = icmp slt i64 6, %len.1
  %885 = bitcast i64* %shadow to i64*
  %safe.244 = or i1 %883, %884
  %select.ptr.245 = select i1 %safe.244, i64* %882, i64* %885
  %886 = load i64, i64* %select.ptr.245, align 8
  %887 = trunc i64 %886 to i32
  %888 = sext i32 %887 to i64
  %889 = getelementptr inbounds i64, i64* %1, i64 9
  %890 = load i1, i1* %out.
  %891 = icmp slt i64 9, %len.1
  %892 = bitcast i64* %shadow to i64*
  %safe.246 = or i1 %890, %891
  %select.ptr.247 = select i1 %safe.246, i64* %889, i64* %892
  %893 = load i64, i64* %select.ptr.247, align 8
  %894 = trunc i64 %893 to i32
  %895 = sext i32 %894 to i64
  %896 = mul nsw i64 %888, %895
  %897 = add nsw i64 %881, %896
  %898 = mul nsw i64 2, %897
  %899 = getelementptr inbounds i64, i64* %0, i64 15
  %900 = load i1, i1* %out.
  %901 = icmp slt i64 15, %len.
  %902 = bitcast i64* %shadow to i64*
  %safe.248 = or i1 %900, %901
  %select.ptr.249 = select i1 %safe.248, i64* %899, i64* %902
  %903 = load i64, i64* %899
  %select.val.250 = select i1 %900, i64 %898, i64 %903
  store i64 %select.val.250, i64* %select.ptr.249, align 8
  %904 = getelementptr inbounds i64, i64* %1, i64 8
  %905 = load i1, i1* %out.
  %906 = icmp slt i64 8, %len.1
  %907 = bitcast i64* %shadow to i64*
  %safe.251 = or i1 %905, %906
  %select.ptr.252 = select i1 %safe.251, i64* %904, i64* %907
  %908 = load i64, i64* %select.ptr.252, align 8
  %909 = trunc i64 %908 to i32
  %910 = sext i32 %909 to i64
  %911 = getelementptr inbounds i64, i64* %1, i64 8
  %912 = load i1, i1* %out.
  %913 = icmp slt i64 8, %len.1
  %914 = bitcast i64* %shadow to i64*
  %safe.253 = or i1 %912, %913
  %select.ptr.254 = select i1 %safe.253, i64* %911, i64* %914
  %915 = load i64, i64* %select.ptr.254, align 8
  %916 = trunc i64 %915 to i32
  %917 = sext i32 %916 to i64
  %918 = mul nsw i64 %910, %917
  %919 = getelementptr inbounds i64, i64* %1, i64 7
  %920 = load i1, i1* %out.
  %921 = icmp slt i64 7, %len.1
  %922 = bitcast i64* %shadow to i64*
  %safe.255 = or i1 %920, %921
  %select.ptr.256 = select i1 %safe.255, i64* %919, i64* %922
  %923 = load i64, i64* %select.ptr.256, align 8
  %924 = trunc i64 %923 to i32
  %925 = sext i32 %924 to i64
  %926 = mul nsw i64 4, %925
  %927 = getelementptr inbounds i64, i64* %1, i64 9
  %928 = load i1, i1* %out.
  %929 = icmp slt i64 9, %len.1
  %930 = bitcast i64* %shadow to i64*
  %safe.257 = or i1 %928, %929
  %select.ptr.258 = select i1 %safe.257, i64* %927, i64* %930
  %931 = load i64, i64* %select.ptr.258, align 8
  %932 = trunc i64 %931 to i32
  %933 = sext i32 %932 to i64
  %934 = mul nsw i64 %926, %933
  %935 = add nsw i64 %918, %934
  %936 = getelementptr inbounds i64, i64* %0, i64 16
  %937 = load i1, i1* %out.
  %938 = icmp slt i64 16, %len.
  %939 = bitcast i64* %shadow to i64*
  %safe.259 = or i1 %937, %938
  %select.ptr.260 = select i1 %safe.259, i64* %936, i64* %939
  %940 = load i64, i64* %936
  %select.val.261 = select i1 %937, i64 %935, i64 %940
  store i64 %select.val.261, i64* %select.ptr.260, align 8
  %941 = getelementptr inbounds i64, i64* %1, i64 8
  %942 = load i1, i1* %out.
  %943 = icmp slt i64 8, %len.1
  %944 = bitcast i64* %shadow to i64*
  %safe.262 = or i1 %942, %943
  %select.ptr.263 = select i1 %safe.262, i64* %941, i64* %944
  %945 = load i64, i64* %select.ptr.263, align 8
  %946 = trunc i64 %945 to i32
  %947 = sext i32 %946 to i64
  %948 = mul nsw i64 2, %947
  %949 = getelementptr inbounds i64, i64* %1, i64 9
  %950 = load i1, i1* %out.
  %951 = icmp slt i64 9, %len.1
  %952 = bitcast i64* %shadow to i64*
  %safe.264 = or i1 %950, %951
  %select.ptr.265 = select i1 %safe.264, i64* %949, i64* %952
  %953 = load i64, i64* %select.ptr.265, align 8
  %954 = trunc i64 %953 to i32
  %955 = sext i32 %954 to i64
  %956 = mul nsw i64 %948, %955
  %957 = getelementptr inbounds i64, i64* %0, i64 17
  %958 = load i1, i1* %out.
  %959 = icmp slt i64 17, %len.
  %960 = bitcast i64* %shadow to i64*
  %safe.266 = or i1 %958, %959
  %select.ptr.267 = select i1 %safe.266, i64* %957, i64* %960
  %961 = load i64, i64* %957
  %select.val.268 = select i1 %958, i64 %956, i64 %961
  store i64 %select.val.268, i64* %select.ptr.267, align 8
  %962 = getelementptr inbounds i64, i64* %1, i64 9
  %963 = load i1, i1* %out.
  %964 = icmp slt i64 9, %len.1
  %965 = bitcast i64* %shadow to i64*
  %safe.269 = or i1 %963, %964
  %select.ptr.270 = select i1 %safe.269, i64* %962, i64* %965
  %966 = load i64, i64* %select.ptr.270, align 8
  %967 = trunc i64 %966 to i32
  %968 = sext i32 %967 to i64
  %969 = mul nsw i64 2, %968
  %970 = getelementptr inbounds i64, i64* %1, i64 9
  %971 = load i1, i1* %out.
  %972 = icmp slt i64 9, %len.1
  %973 = bitcast i64* %shadow to i64*
  %safe.271 = or i1 %971, %972
  %select.ptr.272 = select i1 %safe.271, i64* %970, i64* %973
  %974 = load i64, i64* %select.ptr.272, align 8
  %975 = trunc i64 %974 to i32
  %976 = sext i32 %975 to i64
  %977 = mul nsw i64 %969, %976
  %978 = getelementptr inbounds i64, i64* %0, i64 18
  %979 = load i1, i1* %out.
  %980 = icmp slt i64 18, %len.
  %981 = bitcast i64* %shadow to i64*
  %safe.273 = or i1 %979, %980
  %select.ptr.274 = select i1 %safe.273, i64* %978, i64* %981
  %982 = load i64, i64* %978
  %select.val.275 = select i1 %979, i64 %977, i64 %982
  store i64 %select.val.275, i64* %select.ptr.274, align 8
  ret void
}

define internal void @swap_conditional(i64* %0, i64 %len., i64* %1, i64 %len.1, i64 %2, i1 %.cond) {
.loopexit:
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %out.1 = alloca i1
  %out.2 = alloca i1
  %3 = icmp eq i64 %2, 1
  %4 = load i1, i1* %out.
  %in. = and i1 %4, %3
  store i1 %in., i1* %out.1
  %5 = load i1, i1* %out.1
  %6 = load i64, i64* %0, align 8
  %7 = trunc i64 %6 to i32
  %8 = load i1, i1* %out.1
  %9 = load i64, i64* %1, align 8
  %10 = load i1, i1* %out.1
  %11 = load i64, i64* %0
  %select.val. = select i1 %10, i64 %9, i64 %11
  store i64 %select.val., i64* %0, align 8
  %12 = sext i32 %7 to i64
  %13 = load i1, i1* %out.1
  %14 = load i64, i64* %1
  %select.val.2 = select i1 %13, i64 %12, i64 %14
  store i64 %select.val.2, i64* %1, align 8
  %15 = getelementptr inbounds i64, i64* %0, i64 1
  %16 = load i1, i1* %out.1
  %17 = icmp slt i64 1, %len.
  %18 = bitcast i64* %shadow to i64*
  %safe. = or i1 %16, %17
  %select.ptr. = select i1 %safe., i64* %15, i64* %18
  %19 = load i64, i64* %select.ptr., align 8
  %20 = trunc i64 %19 to i32
  %21 = getelementptr inbounds i64, i64* %1, i64 1
  %22 = load i1, i1* %out.1
  %23 = icmp slt i64 1, %len.1
  %24 = bitcast i64* %shadow to i64*
  %safe.3 = or i1 %22, %23
  %select.ptr.4 = select i1 %safe.3, i64* %21, i64* %24
  %25 = load i64, i64* %select.ptr.4, align 8
  %26 = getelementptr inbounds i64, i64* %0, i64 1
  %27 = load i1, i1* %out.1
  %28 = icmp slt i64 1, %len.
  %29 = bitcast i64* %shadow to i64*
  %safe.5 = or i1 %27, %28
  %select.ptr.6 = select i1 %safe.5, i64* %26, i64* %29
  %30 = load i64, i64* %26
  %select.val.7 = select i1 %27, i64 %25, i64 %30
  store i64 %select.val.7, i64* %select.ptr.6, align 8
  %31 = sext i32 %20 to i64
  %32 = getelementptr inbounds i64, i64* %1, i64 1
  %33 = load i1, i1* %out.1
  %34 = icmp slt i64 1, %len.1
  %35 = bitcast i64* %shadow to i64*
  %safe.8 = or i1 %33, %34
  %select.ptr.9 = select i1 %safe.8, i64* %32, i64* %35
  %36 = load i64, i64* %32
  %select.val.10 = select i1 %33, i64 %31, i64 %36
  store i64 %select.val.10, i64* %select.ptr.9, align 8
  %37 = getelementptr inbounds i64, i64* %0, i64 2
  %38 = load i1, i1* %out.1
  %39 = icmp slt i64 2, %len.
  %40 = bitcast i64* %shadow to i64*
  %safe.11 = or i1 %38, %39
  %select.ptr.12 = select i1 %safe.11, i64* %37, i64* %40
  %41 = load i64, i64* %select.ptr.12, align 8
  %42 = trunc i64 %41 to i32
  %43 = getelementptr inbounds i64, i64* %1, i64 2
  %44 = load i1, i1* %out.1
  %45 = icmp slt i64 2, %len.1
  %46 = bitcast i64* %shadow to i64*
  %safe.13 = or i1 %44, %45
  %select.ptr.14 = select i1 %safe.13, i64* %43, i64* %46
  %47 = load i64, i64* %select.ptr.14, align 8
  %48 = getelementptr inbounds i64, i64* %0, i64 2
  %49 = load i1, i1* %out.1
  %50 = icmp slt i64 2, %len.
  %51 = bitcast i64* %shadow to i64*
  %safe.15 = or i1 %49, %50
  %select.ptr.16 = select i1 %safe.15, i64* %48, i64* %51
  %52 = load i64, i64* %48
  %select.val.17 = select i1 %49, i64 %47, i64 %52
  store i64 %select.val.17, i64* %select.ptr.16, align 8
  %53 = sext i32 %42 to i64
  %54 = getelementptr inbounds i64, i64* %1, i64 2
  %55 = load i1, i1* %out.1
  %56 = icmp slt i64 2, %len.1
  %57 = bitcast i64* %shadow to i64*
  %safe.18 = or i1 %55, %56
  %select.ptr.19 = select i1 %safe.18, i64* %54, i64* %57
  %58 = load i64, i64* %54
  %select.val.20 = select i1 %55, i64 %53, i64 %58
  store i64 %select.val.20, i64* %select.ptr.19, align 8
  %59 = getelementptr inbounds i64, i64* %0, i64 3
  %60 = load i1, i1* %out.1
  %61 = icmp slt i64 3, %len.
  %62 = bitcast i64* %shadow to i64*
  %safe.21 = or i1 %60, %61
  %select.ptr.22 = select i1 %safe.21, i64* %59, i64* %62
  %63 = load i64, i64* %select.ptr.22, align 8
  %64 = trunc i64 %63 to i32
  %65 = getelementptr inbounds i64, i64* %1, i64 3
  %66 = load i1, i1* %out.1
  %67 = icmp slt i64 3, %len.1
  %68 = bitcast i64* %shadow to i64*
  %safe.23 = or i1 %66, %67
  %select.ptr.24 = select i1 %safe.23, i64* %65, i64* %68
  %69 = load i64, i64* %select.ptr.24, align 8
  %70 = getelementptr inbounds i64, i64* %0, i64 3
  %71 = load i1, i1* %out.1
  %72 = icmp slt i64 3, %len.
  %73 = bitcast i64* %shadow to i64*
  %safe.25 = or i1 %71, %72
  %select.ptr.26 = select i1 %safe.25, i64* %70, i64* %73
  %74 = load i64, i64* %70
  %select.val.27 = select i1 %71, i64 %69, i64 %74
  store i64 %select.val.27, i64* %select.ptr.26, align 8
  %75 = sext i32 %64 to i64
  %76 = getelementptr inbounds i64, i64* %1, i64 3
  %77 = load i1, i1* %out.1
  %78 = icmp slt i64 3, %len.1
  %79 = bitcast i64* %shadow to i64*
  %safe.28 = or i1 %77, %78
  %select.ptr.29 = select i1 %safe.28, i64* %76, i64* %79
  %80 = load i64, i64* %76
  %select.val.30 = select i1 %77, i64 %75, i64 %80
  store i64 %select.val.30, i64* %select.ptr.29, align 8
  %81 = getelementptr inbounds i64, i64* %0, i64 4
  %82 = load i1, i1* %out.1
  %83 = icmp slt i64 4, %len.
  %84 = bitcast i64* %shadow to i64*
  %safe.31 = or i1 %82, %83
  %select.ptr.32 = select i1 %safe.31, i64* %81, i64* %84
  %85 = load i64, i64* %select.ptr.32, align 8
  %86 = trunc i64 %85 to i32
  %87 = getelementptr inbounds i64, i64* %1, i64 4
  %88 = load i1, i1* %out.1
  %89 = icmp slt i64 4, %len.1
  %90 = bitcast i64* %shadow to i64*
  %safe.33 = or i1 %88, %89
  %select.ptr.34 = select i1 %safe.33, i64* %87, i64* %90
  %91 = load i64, i64* %select.ptr.34, align 8
  %92 = getelementptr inbounds i64, i64* %0, i64 4
  %93 = load i1, i1* %out.1
  %94 = icmp slt i64 4, %len.
  %95 = bitcast i64* %shadow to i64*
  %safe.35 = or i1 %93, %94
  %select.ptr.36 = select i1 %safe.35, i64* %92, i64* %95
  %96 = load i64, i64* %92
  %select.val.37 = select i1 %93, i64 %91, i64 %96
  store i64 %select.val.37, i64* %select.ptr.36, align 8
  %97 = sext i32 %86 to i64
  %98 = getelementptr inbounds i64, i64* %1, i64 4
  %99 = load i1, i1* %out.1
  %100 = icmp slt i64 4, %len.1
  %101 = bitcast i64* %shadow to i64*
  %safe.38 = or i1 %99, %100
  %select.ptr.39 = select i1 %safe.38, i64* %98, i64* %101
  %102 = load i64, i64* %98
  %select.val.40 = select i1 %99, i64 %97, i64 %102
  store i64 %select.val.40, i64* %select.ptr.39, align 8
  %103 = getelementptr inbounds i64, i64* %0, i64 5
  %104 = load i1, i1* %out.1
  %105 = icmp slt i64 5, %len.
  %106 = bitcast i64* %shadow to i64*
  %safe.41 = or i1 %104, %105
  %select.ptr.42 = select i1 %safe.41, i64* %103, i64* %106
  %107 = load i64, i64* %select.ptr.42, align 8
  %108 = trunc i64 %107 to i32
  %109 = getelementptr inbounds i64, i64* %1, i64 5
  %110 = load i1, i1* %out.1
  %111 = icmp slt i64 5, %len.1
  %112 = bitcast i64* %shadow to i64*
  %safe.43 = or i1 %110, %111
  %select.ptr.44 = select i1 %safe.43, i64* %109, i64* %112
  %113 = load i64, i64* %select.ptr.44, align 8
  %114 = getelementptr inbounds i64, i64* %0, i64 5
  %115 = load i1, i1* %out.1
  %116 = icmp slt i64 5, %len.
  %117 = bitcast i64* %shadow to i64*
  %safe.45 = or i1 %115, %116
  %select.ptr.46 = select i1 %safe.45, i64* %114, i64* %117
  %118 = load i64, i64* %114
  %select.val.47 = select i1 %115, i64 %113, i64 %118
  store i64 %select.val.47, i64* %select.ptr.46, align 8
  %119 = sext i32 %108 to i64
  %120 = getelementptr inbounds i64, i64* %1, i64 5
  %121 = load i1, i1* %out.1
  %122 = icmp slt i64 5, %len.1
  %123 = bitcast i64* %shadow to i64*
  %safe.48 = or i1 %121, %122
  %select.ptr.49 = select i1 %safe.48, i64* %120, i64* %123
  %124 = load i64, i64* %120
  %select.val.50 = select i1 %121, i64 %119, i64 %124
  store i64 %select.val.50, i64* %select.ptr.49, align 8
  %125 = getelementptr inbounds i64, i64* %0, i64 6
  %126 = load i1, i1* %out.1
  %127 = icmp slt i64 6, %len.
  %128 = bitcast i64* %shadow to i64*
  %safe.51 = or i1 %126, %127
  %select.ptr.52 = select i1 %safe.51, i64* %125, i64* %128
  %129 = load i64, i64* %select.ptr.52, align 8
  %130 = trunc i64 %129 to i32
  %131 = getelementptr inbounds i64, i64* %1, i64 6
  %132 = load i1, i1* %out.1
  %133 = icmp slt i64 6, %len.1
  %134 = bitcast i64* %shadow to i64*
  %safe.53 = or i1 %132, %133
  %select.ptr.54 = select i1 %safe.53, i64* %131, i64* %134
  %135 = load i64, i64* %select.ptr.54, align 8
  %136 = getelementptr inbounds i64, i64* %0, i64 6
  %137 = load i1, i1* %out.1
  %138 = icmp slt i64 6, %len.
  %139 = bitcast i64* %shadow to i64*
  %safe.55 = or i1 %137, %138
  %select.ptr.56 = select i1 %safe.55, i64* %136, i64* %139
  %140 = load i64, i64* %136
  %select.val.57 = select i1 %137, i64 %135, i64 %140
  store i64 %select.val.57, i64* %select.ptr.56, align 8
  %141 = sext i32 %130 to i64
  %142 = getelementptr inbounds i64, i64* %1, i64 6
  %143 = load i1, i1* %out.1
  %144 = icmp slt i64 6, %len.1
  %145 = bitcast i64* %shadow to i64*
  %safe.58 = or i1 %143, %144
  %select.ptr.59 = select i1 %safe.58, i64* %142, i64* %145
  %146 = load i64, i64* %142
  %select.val.60 = select i1 %143, i64 %141, i64 %146
  store i64 %select.val.60, i64* %select.ptr.59, align 8
  %147 = getelementptr inbounds i64, i64* %0, i64 7
  %148 = load i1, i1* %out.1
  %149 = icmp slt i64 7, %len.
  %150 = bitcast i64* %shadow to i64*
  %safe.61 = or i1 %148, %149
  %select.ptr.62 = select i1 %safe.61, i64* %147, i64* %150
  %151 = load i64, i64* %select.ptr.62, align 8
  %152 = trunc i64 %151 to i32
  %153 = getelementptr inbounds i64, i64* %1, i64 7
  %154 = load i1, i1* %out.1
  %155 = icmp slt i64 7, %len.1
  %156 = bitcast i64* %shadow to i64*
  %safe.63 = or i1 %154, %155
  %select.ptr.64 = select i1 %safe.63, i64* %153, i64* %156
  %157 = load i64, i64* %select.ptr.64, align 8
  %158 = getelementptr inbounds i64, i64* %0, i64 7
  %159 = load i1, i1* %out.1
  %160 = icmp slt i64 7, %len.
  %161 = bitcast i64* %shadow to i64*
  %safe.65 = or i1 %159, %160
  %select.ptr.66 = select i1 %safe.65, i64* %158, i64* %161
  %162 = load i64, i64* %158
  %select.val.67 = select i1 %159, i64 %157, i64 %162
  store i64 %select.val.67, i64* %select.ptr.66, align 8
  %163 = sext i32 %152 to i64
  %164 = getelementptr inbounds i64, i64* %1, i64 7
  %165 = load i1, i1* %out.1
  %166 = icmp slt i64 7, %len.1
  %167 = bitcast i64* %shadow to i64*
  %safe.68 = or i1 %165, %166
  %select.ptr.69 = select i1 %safe.68, i64* %164, i64* %167
  %168 = load i64, i64* %164
  %select.val.70 = select i1 %165, i64 %163, i64 %168
  store i64 %select.val.70, i64* %select.ptr.69, align 8
  %169 = getelementptr inbounds i64, i64* %0, i64 8
  %170 = load i1, i1* %out.1
  %171 = icmp slt i64 8, %len.
  %172 = bitcast i64* %shadow to i64*
  %safe.71 = or i1 %170, %171
  %select.ptr.72 = select i1 %safe.71, i64* %169, i64* %172
  %173 = load i64, i64* %select.ptr.72, align 8
  %174 = trunc i64 %173 to i32
  %175 = getelementptr inbounds i64, i64* %1, i64 8
  %176 = load i1, i1* %out.1
  %177 = icmp slt i64 8, %len.1
  %178 = bitcast i64* %shadow to i64*
  %safe.73 = or i1 %176, %177
  %select.ptr.74 = select i1 %safe.73, i64* %175, i64* %178
  %179 = load i64, i64* %select.ptr.74, align 8
  %180 = getelementptr inbounds i64, i64* %0, i64 8
  %181 = load i1, i1* %out.1
  %182 = icmp slt i64 8, %len.
  %183 = bitcast i64* %shadow to i64*
  %safe.75 = or i1 %181, %182
  %select.ptr.76 = select i1 %safe.75, i64* %180, i64* %183
  %184 = load i64, i64* %180
  %select.val.77 = select i1 %181, i64 %179, i64 %184
  store i64 %select.val.77, i64* %select.ptr.76, align 8
  %185 = sext i32 %174 to i64
  %186 = getelementptr inbounds i64, i64* %1, i64 8
  %187 = load i1, i1* %out.1
  %188 = icmp slt i64 8, %len.1
  %189 = bitcast i64* %shadow to i64*
  %safe.78 = or i1 %187, %188
  %select.ptr.79 = select i1 %safe.78, i64* %186, i64* %189
  %190 = load i64, i64* %186
  %select.val.80 = select i1 %187, i64 %185, i64 %190
  store i64 %select.val.80, i64* %select.ptr.79, align 8
  %191 = getelementptr inbounds i64, i64* %0, i64 9
  %192 = load i1, i1* %out.1
  %193 = icmp slt i64 9, %len.
  %194 = bitcast i64* %shadow to i64*
  %safe.81 = or i1 %192, %193
  %select.ptr.82 = select i1 %safe.81, i64* %191, i64* %194
  %195 = load i64, i64* %select.ptr.82, align 8
  %196 = trunc i64 %195 to i32
  %197 = getelementptr inbounds i64, i64* %1, i64 9
  %198 = load i1, i1* %out.1
  %199 = icmp slt i64 9, %len.1
  %200 = bitcast i64* %shadow to i64*
  %safe.83 = or i1 %198, %199
  %select.ptr.84 = select i1 %safe.83, i64* %197, i64* %200
  %201 = load i64, i64* %select.ptr.84, align 8
  %202 = getelementptr inbounds i64, i64* %0, i64 9
  %203 = load i1, i1* %out.1
  %204 = icmp slt i64 9, %len.
  %205 = bitcast i64* %shadow to i64*
  %safe.85 = or i1 %203, %204
  %select.ptr.86 = select i1 %safe.85, i64* %202, i64* %205
  %206 = load i64, i64* %202
  %select.val.87 = select i1 %203, i64 %201, i64 %206
  store i64 %select.val.87, i64* %select.ptr.86, align 8
  %207 = sext i32 %196 to i64
  %208 = getelementptr inbounds i64, i64* %1, i64 9
  %209 = load i1, i1* %out.1
  %210 = icmp slt i64 9, %len.1
  %211 = bitcast i64* %shadow to i64*
  %safe.88 = or i1 %209, %210
  %select.ptr.89 = select i1 %safe.88, i64* %208, i64* %211
  %212 = load i64, i64* %208
  %select.val.90 = select i1 %209, i64 %207, i64 %212
  store i64 %select.val.90, i64* %select.ptr.89, align 8
  %213 = load i1, i1* %out.
  %214 = xor i1 %3, true
  %in.3 = and i1 %213, %214
  %215 = load i1, i1* %out.1
  %216 = or i1 %in.3, %215
  store i1 %216, i1* %out.2
  ret void
}

define internal void @fmonty(i64* %0, i64 %len., i64* %1, i64 %len.1, i64* %2, i64 %len.2, i64* %3, i64 %len.3, i64* %4, i64 %len.4, i64* %5, i64 %len.5, i64* %6, i64 %len.6, i64* %7, i64 %len.7, i64* %8, i64 %len.8, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
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
  call void @fsum(i64* %4, i64 %len.4, i64* %5, i64 %len.5, i1 %.cond)
  %22 = getelementptr inbounds [10 x i64], [10 x i64]* %10, i64 0, i64 0
  call void @fdifference(i64* %5, i64 %len.5, i64* %22, i64 10, i1 %.cond)
  %23 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %24 = bitcast i64* %23 to i8*
  %25 = bitcast i64* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %24, i8* align 8 %25, i64 80, i1 false)
  call void @fsum(i64* %6, i64 %len.6, i64* %7, i64 %len.7, i1 %.cond)
  %26 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fdifference(i64* %7, i64 %len.7, i64* %26, i64 10, i1 %.cond)
  %27 = getelementptr inbounds [19 x i64], [19 x i64]* %15, i64 0, i64 0
  call void @fproduct(i64* %27, i64 19, i64* %6, i64 %len.6, i64* %5, i64 %len.5, i1 %.cond)
  %28 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @fproduct(i64* %28, i64 19, i64* %4, i64 %len.4, i64* %7, i64 %len.7, i1 %.cond)
  %29 = getelementptr inbounds [19 x i64], [19 x i64]* %15, i64 0, i64 0
  call void @freduce_degree(i64* %29, i64 19, i1 %.cond)
  %30 = getelementptr inbounds [19 x i64], [19 x i64]* %15, i64 0, i64 0
  call void @freduce_coefficients(i64* %30, i64 19, i1 %.cond)
  %31 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @freduce_degree(i64* %31, i64 19, i1 %.cond)
  %32 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @freduce_coefficients(i64* %32, i64 19, i1 %.cond)
  %33 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  %34 = bitcast i64* %33 to i8*
  %35 = getelementptr inbounds [19 x i64], [19 x i64]* %15, i64 0, i64 0
  %36 = bitcast i64* %35 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %34, i8* align 16 %36, i64 80, i1 false)
  %37 = getelementptr inbounds [19 x i64], [19 x i64]* %15, i64 0, i64 0
  %38 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @fsum(i64* %37, i64 19, i64* %38, i64 19, i1 %.cond)
  %39 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  %40 = getelementptr inbounds [10 x i64], [10 x i64]* %11, i64 0, i64 0
  call void @fdifference(i64* %39, i64 19, i64* %40, i64 10, i1 %.cond)
  %41 = getelementptr inbounds [19 x i64], [19 x i64]* %18, i64 0, i64 0
  %42 = getelementptr inbounds [19 x i64], [19 x i64]* %15, i64 0, i64 0
  call void @fsquare(i64* %41, i64 19, i64* %42, i64 19, i1 %.cond)
  %43 = getelementptr inbounds [19 x i64], [19 x i64]* %17, i64 0, i64 0
  %44 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @fsquare(i64* %43, i64 19, i64* %44, i64 19, i1 %.cond)
  %45 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  %46 = getelementptr inbounds [19 x i64], [19 x i64]* %17, i64 0, i64 0
  call void @fproduct(i64* %45, i64 19, i64* %46, i64 19, i64* %8, i64 %len.8, i1 %.cond)
  %47 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @freduce_degree(i64* %47, i64 19, i1 %.cond)
  %48 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  call void @freduce_coefficients(i64* %48, i64 19, i1 %.cond)
  %49 = bitcast i64* %2 to i8*
  %50 = getelementptr inbounds [19 x i64], [19 x i64]* %18, i64 0, i64 0
  %51 = bitcast i64* %50 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %49, i8* align 16 %51, i64 80, i1 false)
  %52 = bitcast i64* %3 to i8*
  %53 = getelementptr inbounds [19 x i64], [19 x i64]* %16, i64 0, i64 0
  %54 = bitcast i64* %53 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %52, i8* align 16 %54, i64 80, i1 false)
  %55 = getelementptr inbounds [19 x i64], [19 x i64]* %13, i64 0, i64 0
  call void @fsquare(i64* %55, i64 19, i64* %4, i64 %len.4, i1 %.cond)
  %56 = getelementptr inbounds [19 x i64], [19 x i64]* %14, i64 0, i64 0
  call void @fsquare(i64* %56, i64 19, i64* %5, i64 %len.5, i1 %.cond)
  %57 = getelementptr inbounds [19 x i64], [19 x i64]* %13, i64 0, i64 0
  %58 = getelementptr inbounds [19 x i64], [19 x i64]* %14, i64 0, i64 0
  call void @fproduct(i64* %0, i64 %len., i64* %57, i64 19, i64* %58, i64 19, i1 %.cond)
  call void @freduce_degree(i64* %0, i64 %len., i1 %.cond)
  call void @freduce_coefficients(i64* %0, i64 %len., i1 %.cond)
  %59 = getelementptr inbounds [19 x i64], [19 x i64]* %14, i64 0, i64 0
  %60 = getelementptr inbounds [19 x i64], [19 x i64]* %13, i64 0, i64 0
  call void @fdifference(i64* %59, i64 19, i64* %60, i64 19, i1 %.cond)
  %61 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  %62 = getelementptr inbounds i64, i64* %61, i64 10
  %63 = bitcast i64* %62 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %63, i8 0, i64 72, i1 false)
  %64 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  %65 = getelementptr inbounds [19 x i64], [19 x i64]* %14, i64 0, i64 0
  call void @fscalar_product(i64* %64, i64 19, i64* %65, i64 19, i64 121665, i1 %.cond)
  %66 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  call void @freduce_coefficients(i64* %66, i64 19, i1 %.cond)
  %67 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  %68 = getelementptr inbounds [19 x i64], [19 x i64]* %13, i64 0, i64 0
  call void @fsum(i64* %67, i64 19, i64* %68, i64 19, i1 %.cond)
  %69 = getelementptr inbounds [19 x i64], [19 x i64]* %14, i64 0, i64 0
  %70 = getelementptr inbounds [19 x i64], [19 x i64]* %12, i64 0, i64 0
  call void @fproduct(i64* %1, i64 %len.1, i64* %69, i64 19, i64* %70, i64 19, i1 %.cond)
  call void @freduce_degree(i64* %1, i64 %len.1, i1 %.cond)
  call void @freduce_coefficients(i64* %1, i64 %len.1, i1 %.cond)
  ret void
}

define internal void @fsum(i64* %0, i64 %len., i64* %1, i64 %len.1, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %3 = load i1, i1* %out.
  %4 = load i64, i64* %0, align 8
  %5 = load i1, i1* %out.
  %6 = load i64, i64* %1, align 8
  %7 = add nsw i64 %4, %6
  %8 = load i1, i1* %out.
  %9 = load i64, i64* %0
  %select.val. = select i1 %8, i64 %7, i64 %9
  store i64 %select.val., i64* %0, align 8
  %10 = getelementptr inbounds i64, i64* %0, i64 1
  %11 = load i1, i1* %out.
  %12 = icmp slt i64 1, %len.
  %13 = bitcast i64* %shadow to i64*
  %safe. = or i1 %11, %12
  %select.ptr. = select i1 %safe., i64* %10, i64* %13
  %14 = load i64, i64* %select.ptr., align 8
  %15 = getelementptr inbounds i64, i64* %1, i64 1
  %16 = load i1, i1* %out.
  %17 = icmp slt i64 1, %len.1
  %18 = bitcast i64* %shadow to i64*
  %safe.2 = or i1 %16, %17
  %select.ptr.3 = select i1 %safe.2, i64* %15, i64* %18
  %19 = load i64, i64* %select.ptr.3, align 8
  %20 = add nsw i64 %14, %19
  %21 = getelementptr inbounds i64, i64* %0, i64 1
  %22 = load i1, i1* %out.
  %23 = icmp slt i64 1, %len.
  %24 = bitcast i64* %shadow to i64*
  %safe.4 = or i1 %22, %23
  %select.ptr.5 = select i1 %safe.4, i64* %21, i64* %24
  %25 = load i64, i64* %21
  %select.val.6 = select i1 %22, i64 %20, i64 %25
  store i64 %select.val.6, i64* %select.ptr.5, align 8
  %26 = getelementptr inbounds i64, i64* %0, i64 2
  %27 = load i1, i1* %out.
  %28 = icmp slt i64 2, %len.
  %29 = bitcast i64* %shadow to i64*
  %safe.7 = or i1 %27, %28
  %select.ptr.8 = select i1 %safe.7, i64* %26, i64* %29
  %30 = load i64, i64* %select.ptr.8, align 8
  %31 = getelementptr inbounds i64, i64* %1, i64 2
  %32 = load i1, i1* %out.
  %33 = icmp slt i64 2, %len.1
  %34 = bitcast i64* %shadow to i64*
  %safe.9 = or i1 %32, %33
  %select.ptr.10 = select i1 %safe.9, i64* %31, i64* %34
  %35 = load i64, i64* %select.ptr.10, align 8
  %36 = add nsw i64 %30, %35
  %37 = getelementptr inbounds i64, i64* %0, i64 2
  %38 = load i1, i1* %out.
  %39 = icmp slt i64 2, %len.
  %40 = bitcast i64* %shadow to i64*
  %safe.11 = or i1 %38, %39
  %select.ptr.12 = select i1 %safe.11, i64* %37, i64* %40
  %41 = load i64, i64* %37
  %select.val.13 = select i1 %38, i64 %36, i64 %41
  store i64 %select.val.13, i64* %select.ptr.12, align 8
  %42 = getelementptr inbounds i64, i64* %0, i64 3
  %43 = load i1, i1* %out.
  %44 = icmp slt i64 3, %len.
  %45 = bitcast i64* %shadow to i64*
  %safe.14 = or i1 %43, %44
  %select.ptr.15 = select i1 %safe.14, i64* %42, i64* %45
  %46 = load i64, i64* %select.ptr.15, align 8
  %47 = getelementptr inbounds i64, i64* %1, i64 3
  %48 = load i1, i1* %out.
  %49 = icmp slt i64 3, %len.1
  %50 = bitcast i64* %shadow to i64*
  %safe.16 = or i1 %48, %49
  %select.ptr.17 = select i1 %safe.16, i64* %47, i64* %50
  %51 = load i64, i64* %select.ptr.17, align 8
  %52 = add nsw i64 %46, %51
  %53 = getelementptr inbounds i64, i64* %0, i64 3
  %54 = load i1, i1* %out.
  %55 = icmp slt i64 3, %len.
  %56 = bitcast i64* %shadow to i64*
  %safe.18 = or i1 %54, %55
  %select.ptr.19 = select i1 %safe.18, i64* %53, i64* %56
  %57 = load i64, i64* %53
  %select.val.20 = select i1 %54, i64 %52, i64 %57
  store i64 %select.val.20, i64* %select.ptr.19, align 8
  %58 = getelementptr inbounds i64, i64* %0, i64 4
  %59 = load i1, i1* %out.
  %60 = icmp slt i64 4, %len.
  %61 = bitcast i64* %shadow to i64*
  %safe.21 = or i1 %59, %60
  %select.ptr.22 = select i1 %safe.21, i64* %58, i64* %61
  %62 = load i64, i64* %select.ptr.22, align 8
  %63 = getelementptr inbounds i64, i64* %1, i64 4
  %64 = load i1, i1* %out.
  %65 = icmp slt i64 4, %len.1
  %66 = bitcast i64* %shadow to i64*
  %safe.23 = or i1 %64, %65
  %select.ptr.24 = select i1 %safe.23, i64* %63, i64* %66
  %67 = load i64, i64* %select.ptr.24, align 8
  %68 = add nsw i64 %62, %67
  %69 = getelementptr inbounds i64, i64* %0, i64 4
  %70 = load i1, i1* %out.
  %71 = icmp slt i64 4, %len.
  %72 = bitcast i64* %shadow to i64*
  %safe.25 = or i1 %70, %71
  %select.ptr.26 = select i1 %safe.25, i64* %69, i64* %72
  %73 = load i64, i64* %69
  %select.val.27 = select i1 %70, i64 %68, i64 %73
  store i64 %select.val.27, i64* %select.ptr.26, align 8
  %74 = getelementptr inbounds i64, i64* %0, i64 5
  %75 = load i1, i1* %out.
  %76 = icmp slt i64 5, %len.
  %77 = bitcast i64* %shadow to i64*
  %safe.28 = or i1 %75, %76
  %select.ptr.29 = select i1 %safe.28, i64* %74, i64* %77
  %78 = load i64, i64* %select.ptr.29, align 8
  %79 = getelementptr inbounds i64, i64* %1, i64 5
  %80 = load i1, i1* %out.
  %81 = icmp slt i64 5, %len.1
  %82 = bitcast i64* %shadow to i64*
  %safe.30 = or i1 %80, %81
  %select.ptr.31 = select i1 %safe.30, i64* %79, i64* %82
  %83 = load i64, i64* %select.ptr.31, align 8
  %84 = add nsw i64 %78, %83
  %85 = getelementptr inbounds i64, i64* %0, i64 5
  %86 = load i1, i1* %out.
  %87 = icmp slt i64 5, %len.
  %88 = bitcast i64* %shadow to i64*
  %safe.32 = or i1 %86, %87
  %select.ptr.33 = select i1 %safe.32, i64* %85, i64* %88
  %89 = load i64, i64* %85
  %select.val.34 = select i1 %86, i64 %84, i64 %89
  store i64 %select.val.34, i64* %select.ptr.33, align 8
  %90 = getelementptr inbounds i64, i64* %0, i64 6
  %91 = load i1, i1* %out.
  %92 = icmp slt i64 6, %len.
  %93 = bitcast i64* %shadow to i64*
  %safe.35 = or i1 %91, %92
  %select.ptr.36 = select i1 %safe.35, i64* %90, i64* %93
  %94 = load i64, i64* %select.ptr.36, align 8
  %95 = getelementptr inbounds i64, i64* %1, i64 6
  %96 = load i1, i1* %out.
  %97 = icmp slt i64 6, %len.1
  %98 = bitcast i64* %shadow to i64*
  %safe.37 = or i1 %96, %97
  %select.ptr.38 = select i1 %safe.37, i64* %95, i64* %98
  %99 = load i64, i64* %select.ptr.38, align 8
  %100 = add nsw i64 %94, %99
  %101 = getelementptr inbounds i64, i64* %0, i64 6
  %102 = load i1, i1* %out.
  %103 = icmp slt i64 6, %len.
  %104 = bitcast i64* %shadow to i64*
  %safe.39 = or i1 %102, %103
  %select.ptr.40 = select i1 %safe.39, i64* %101, i64* %104
  %105 = load i64, i64* %101
  %select.val.41 = select i1 %102, i64 %100, i64 %105
  store i64 %select.val.41, i64* %select.ptr.40, align 8
  %106 = getelementptr inbounds i64, i64* %0, i64 7
  %107 = load i1, i1* %out.
  %108 = icmp slt i64 7, %len.
  %109 = bitcast i64* %shadow to i64*
  %safe.42 = or i1 %107, %108
  %select.ptr.43 = select i1 %safe.42, i64* %106, i64* %109
  %110 = load i64, i64* %select.ptr.43, align 8
  %111 = getelementptr inbounds i64, i64* %1, i64 7
  %112 = load i1, i1* %out.
  %113 = icmp slt i64 7, %len.1
  %114 = bitcast i64* %shadow to i64*
  %safe.44 = or i1 %112, %113
  %select.ptr.45 = select i1 %safe.44, i64* %111, i64* %114
  %115 = load i64, i64* %select.ptr.45, align 8
  %116 = add nsw i64 %110, %115
  %117 = getelementptr inbounds i64, i64* %0, i64 7
  %118 = load i1, i1* %out.
  %119 = icmp slt i64 7, %len.
  %120 = bitcast i64* %shadow to i64*
  %safe.46 = or i1 %118, %119
  %select.ptr.47 = select i1 %safe.46, i64* %117, i64* %120
  %121 = load i64, i64* %117
  %select.val.48 = select i1 %118, i64 %116, i64 %121
  store i64 %select.val.48, i64* %select.ptr.47, align 8
  %122 = getelementptr inbounds i64, i64* %0, i64 8
  %123 = load i1, i1* %out.
  %124 = icmp slt i64 8, %len.
  %125 = bitcast i64* %shadow to i64*
  %safe.49 = or i1 %123, %124
  %select.ptr.50 = select i1 %safe.49, i64* %122, i64* %125
  %126 = load i64, i64* %select.ptr.50, align 8
  %127 = getelementptr inbounds i64, i64* %1, i64 8
  %128 = load i1, i1* %out.
  %129 = icmp slt i64 8, %len.1
  %130 = bitcast i64* %shadow to i64*
  %safe.51 = or i1 %128, %129
  %select.ptr.52 = select i1 %safe.51, i64* %127, i64* %130
  %131 = load i64, i64* %select.ptr.52, align 8
  %132 = add nsw i64 %126, %131
  %133 = getelementptr inbounds i64, i64* %0, i64 8
  %134 = load i1, i1* %out.
  %135 = icmp slt i64 8, %len.
  %136 = bitcast i64* %shadow to i64*
  %safe.53 = or i1 %134, %135
  %select.ptr.54 = select i1 %safe.53, i64* %133, i64* %136
  %137 = load i64, i64* %133
  %select.val.55 = select i1 %134, i64 %132, i64 %137
  store i64 %select.val.55, i64* %select.ptr.54, align 8
  %138 = getelementptr inbounds i64, i64* %0, i64 9
  %139 = load i1, i1* %out.
  %140 = icmp slt i64 9, %len.
  %141 = bitcast i64* %shadow to i64*
  %safe.56 = or i1 %139, %140
  %select.ptr.57 = select i1 %safe.56, i64* %138, i64* %141
  %142 = load i64, i64* %select.ptr.57, align 8
  %143 = getelementptr inbounds i64, i64* %1, i64 9
  %144 = load i1, i1* %out.
  %145 = icmp slt i64 9, %len.1
  %146 = bitcast i64* %shadow to i64*
  %safe.58 = or i1 %144, %145
  %select.ptr.59 = select i1 %safe.58, i64* %143, i64* %146
  %147 = load i64, i64* %select.ptr.59, align 8
  %148 = add nsw i64 %142, %147
  %149 = getelementptr inbounds i64, i64* %0, i64 9
  %150 = load i1, i1* %out.
  %151 = icmp slt i64 9, %len.
  %152 = bitcast i64* %shadow to i64*
  %safe.60 = or i1 %150, %151
  %select.ptr.61 = select i1 %safe.60, i64* %149, i64* %152
  %153 = load i64, i64* %149
  %select.val.62 = select i1 %150, i64 %148, i64 %153
  store i64 %select.val.62, i64* %select.ptr.61, align 8
  ret void
}

define internal void @fdifference(i64* %0, i64 %len., i64* %1, i64 %len.1, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %3 = load i1, i1* %out.
  %4 = load i64, i64* %1, align 8
  %5 = load i1, i1* %out.
  %6 = load i64, i64* %0, align 8
  %7 = sub nsw i64 %4, %6
  %8 = load i1, i1* %out.
  %9 = load i64, i64* %0
  %select.val. = select i1 %8, i64 %7, i64 %9
  store i64 %select.val., i64* %0, align 8
  %10 = getelementptr inbounds i64, i64* %1, i64 1
  %11 = load i1, i1* %out.
  %12 = icmp slt i64 1, %len.1
  %13 = bitcast i64* %shadow to i64*
  %safe. = or i1 %11, %12
  %select.ptr. = select i1 %safe., i64* %10, i64* %13
  %14 = load i64, i64* %select.ptr., align 8
  %15 = getelementptr inbounds i64, i64* %0, i64 1
  %16 = load i1, i1* %out.
  %17 = icmp slt i64 1, %len.
  %18 = bitcast i64* %shadow to i64*
  %safe.2 = or i1 %16, %17
  %select.ptr.3 = select i1 %safe.2, i64* %15, i64* %18
  %19 = load i64, i64* %select.ptr.3, align 8
  %20 = sub nsw i64 %14, %19
  %21 = getelementptr inbounds i64, i64* %0, i64 1
  %22 = load i1, i1* %out.
  %23 = icmp slt i64 1, %len.
  %24 = bitcast i64* %shadow to i64*
  %safe.4 = or i1 %22, %23
  %select.ptr.5 = select i1 %safe.4, i64* %21, i64* %24
  %25 = load i64, i64* %21
  %select.val.6 = select i1 %22, i64 %20, i64 %25
  store i64 %select.val.6, i64* %select.ptr.5, align 8
  %26 = getelementptr inbounds i64, i64* %1, i64 2
  %27 = load i1, i1* %out.
  %28 = icmp slt i64 2, %len.1
  %29 = bitcast i64* %shadow to i64*
  %safe.7 = or i1 %27, %28
  %select.ptr.8 = select i1 %safe.7, i64* %26, i64* %29
  %30 = load i64, i64* %select.ptr.8, align 8
  %31 = getelementptr inbounds i64, i64* %0, i64 2
  %32 = load i1, i1* %out.
  %33 = icmp slt i64 2, %len.
  %34 = bitcast i64* %shadow to i64*
  %safe.9 = or i1 %32, %33
  %select.ptr.10 = select i1 %safe.9, i64* %31, i64* %34
  %35 = load i64, i64* %select.ptr.10, align 8
  %36 = sub nsw i64 %30, %35
  %37 = getelementptr inbounds i64, i64* %0, i64 2
  %38 = load i1, i1* %out.
  %39 = icmp slt i64 2, %len.
  %40 = bitcast i64* %shadow to i64*
  %safe.11 = or i1 %38, %39
  %select.ptr.12 = select i1 %safe.11, i64* %37, i64* %40
  %41 = load i64, i64* %37
  %select.val.13 = select i1 %38, i64 %36, i64 %41
  store i64 %select.val.13, i64* %select.ptr.12, align 8
  %42 = getelementptr inbounds i64, i64* %1, i64 3
  %43 = load i1, i1* %out.
  %44 = icmp slt i64 3, %len.1
  %45 = bitcast i64* %shadow to i64*
  %safe.14 = or i1 %43, %44
  %select.ptr.15 = select i1 %safe.14, i64* %42, i64* %45
  %46 = load i64, i64* %select.ptr.15, align 8
  %47 = getelementptr inbounds i64, i64* %0, i64 3
  %48 = load i1, i1* %out.
  %49 = icmp slt i64 3, %len.
  %50 = bitcast i64* %shadow to i64*
  %safe.16 = or i1 %48, %49
  %select.ptr.17 = select i1 %safe.16, i64* %47, i64* %50
  %51 = load i64, i64* %select.ptr.17, align 8
  %52 = sub nsw i64 %46, %51
  %53 = getelementptr inbounds i64, i64* %0, i64 3
  %54 = load i1, i1* %out.
  %55 = icmp slt i64 3, %len.
  %56 = bitcast i64* %shadow to i64*
  %safe.18 = or i1 %54, %55
  %select.ptr.19 = select i1 %safe.18, i64* %53, i64* %56
  %57 = load i64, i64* %53
  %select.val.20 = select i1 %54, i64 %52, i64 %57
  store i64 %select.val.20, i64* %select.ptr.19, align 8
  %58 = getelementptr inbounds i64, i64* %1, i64 4
  %59 = load i1, i1* %out.
  %60 = icmp slt i64 4, %len.1
  %61 = bitcast i64* %shadow to i64*
  %safe.21 = or i1 %59, %60
  %select.ptr.22 = select i1 %safe.21, i64* %58, i64* %61
  %62 = load i64, i64* %select.ptr.22, align 8
  %63 = getelementptr inbounds i64, i64* %0, i64 4
  %64 = load i1, i1* %out.
  %65 = icmp slt i64 4, %len.
  %66 = bitcast i64* %shadow to i64*
  %safe.23 = or i1 %64, %65
  %select.ptr.24 = select i1 %safe.23, i64* %63, i64* %66
  %67 = load i64, i64* %select.ptr.24, align 8
  %68 = sub nsw i64 %62, %67
  %69 = getelementptr inbounds i64, i64* %0, i64 4
  %70 = load i1, i1* %out.
  %71 = icmp slt i64 4, %len.
  %72 = bitcast i64* %shadow to i64*
  %safe.25 = or i1 %70, %71
  %select.ptr.26 = select i1 %safe.25, i64* %69, i64* %72
  %73 = load i64, i64* %69
  %select.val.27 = select i1 %70, i64 %68, i64 %73
  store i64 %select.val.27, i64* %select.ptr.26, align 8
  %74 = getelementptr inbounds i64, i64* %1, i64 5
  %75 = load i1, i1* %out.
  %76 = icmp slt i64 5, %len.1
  %77 = bitcast i64* %shadow to i64*
  %safe.28 = or i1 %75, %76
  %select.ptr.29 = select i1 %safe.28, i64* %74, i64* %77
  %78 = load i64, i64* %select.ptr.29, align 8
  %79 = getelementptr inbounds i64, i64* %0, i64 5
  %80 = load i1, i1* %out.
  %81 = icmp slt i64 5, %len.
  %82 = bitcast i64* %shadow to i64*
  %safe.30 = or i1 %80, %81
  %select.ptr.31 = select i1 %safe.30, i64* %79, i64* %82
  %83 = load i64, i64* %select.ptr.31, align 8
  %84 = sub nsw i64 %78, %83
  %85 = getelementptr inbounds i64, i64* %0, i64 5
  %86 = load i1, i1* %out.
  %87 = icmp slt i64 5, %len.
  %88 = bitcast i64* %shadow to i64*
  %safe.32 = or i1 %86, %87
  %select.ptr.33 = select i1 %safe.32, i64* %85, i64* %88
  %89 = load i64, i64* %85
  %select.val.34 = select i1 %86, i64 %84, i64 %89
  store i64 %select.val.34, i64* %select.ptr.33, align 8
  %90 = getelementptr inbounds i64, i64* %1, i64 6
  %91 = load i1, i1* %out.
  %92 = icmp slt i64 6, %len.1
  %93 = bitcast i64* %shadow to i64*
  %safe.35 = or i1 %91, %92
  %select.ptr.36 = select i1 %safe.35, i64* %90, i64* %93
  %94 = load i64, i64* %select.ptr.36, align 8
  %95 = getelementptr inbounds i64, i64* %0, i64 6
  %96 = load i1, i1* %out.
  %97 = icmp slt i64 6, %len.
  %98 = bitcast i64* %shadow to i64*
  %safe.37 = or i1 %96, %97
  %select.ptr.38 = select i1 %safe.37, i64* %95, i64* %98
  %99 = load i64, i64* %select.ptr.38, align 8
  %100 = sub nsw i64 %94, %99
  %101 = getelementptr inbounds i64, i64* %0, i64 6
  %102 = load i1, i1* %out.
  %103 = icmp slt i64 6, %len.
  %104 = bitcast i64* %shadow to i64*
  %safe.39 = or i1 %102, %103
  %select.ptr.40 = select i1 %safe.39, i64* %101, i64* %104
  %105 = load i64, i64* %101
  %select.val.41 = select i1 %102, i64 %100, i64 %105
  store i64 %select.val.41, i64* %select.ptr.40, align 8
  %106 = getelementptr inbounds i64, i64* %1, i64 7
  %107 = load i1, i1* %out.
  %108 = icmp slt i64 7, %len.1
  %109 = bitcast i64* %shadow to i64*
  %safe.42 = or i1 %107, %108
  %select.ptr.43 = select i1 %safe.42, i64* %106, i64* %109
  %110 = load i64, i64* %select.ptr.43, align 8
  %111 = getelementptr inbounds i64, i64* %0, i64 7
  %112 = load i1, i1* %out.
  %113 = icmp slt i64 7, %len.
  %114 = bitcast i64* %shadow to i64*
  %safe.44 = or i1 %112, %113
  %select.ptr.45 = select i1 %safe.44, i64* %111, i64* %114
  %115 = load i64, i64* %select.ptr.45, align 8
  %116 = sub nsw i64 %110, %115
  %117 = getelementptr inbounds i64, i64* %0, i64 7
  %118 = load i1, i1* %out.
  %119 = icmp slt i64 7, %len.
  %120 = bitcast i64* %shadow to i64*
  %safe.46 = or i1 %118, %119
  %select.ptr.47 = select i1 %safe.46, i64* %117, i64* %120
  %121 = load i64, i64* %117
  %select.val.48 = select i1 %118, i64 %116, i64 %121
  store i64 %select.val.48, i64* %select.ptr.47, align 8
  %122 = getelementptr inbounds i64, i64* %1, i64 8
  %123 = load i1, i1* %out.
  %124 = icmp slt i64 8, %len.1
  %125 = bitcast i64* %shadow to i64*
  %safe.49 = or i1 %123, %124
  %select.ptr.50 = select i1 %safe.49, i64* %122, i64* %125
  %126 = load i64, i64* %select.ptr.50, align 8
  %127 = getelementptr inbounds i64, i64* %0, i64 8
  %128 = load i1, i1* %out.
  %129 = icmp slt i64 8, %len.
  %130 = bitcast i64* %shadow to i64*
  %safe.51 = or i1 %128, %129
  %select.ptr.52 = select i1 %safe.51, i64* %127, i64* %130
  %131 = load i64, i64* %select.ptr.52, align 8
  %132 = sub nsw i64 %126, %131
  %133 = getelementptr inbounds i64, i64* %0, i64 8
  %134 = load i1, i1* %out.
  %135 = icmp slt i64 8, %len.
  %136 = bitcast i64* %shadow to i64*
  %safe.53 = or i1 %134, %135
  %select.ptr.54 = select i1 %safe.53, i64* %133, i64* %136
  %137 = load i64, i64* %133
  %select.val.55 = select i1 %134, i64 %132, i64 %137
  store i64 %select.val.55, i64* %select.ptr.54, align 8
  %138 = getelementptr inbounds i64, i64* %1, i64 9
  %139 = load i1, i1* %out.
  %140 = icmp slt i64 9, %len.1
  %141 = bitcast i64* %shadow to i64*
  %safe.56 = or i1 %139, %140
  %select.ptr.57 = select i1 %safe.56, i64* %138, i64* %141
  %142 = load i64, i64* %select.ptr.57, align 8
  %143 = getelementptr inbounds i64, i64* %0, i64 9
  %144 = load i1, i1* %out.
  %145 = icmp slt i64 9, %len.
  %146 = bitcast i64* %shadow to i64*
  %safe.58 = or i1 %144, %145
  %select.ptr.59 = select i1 %safe.58, i64* %143, i64* %146
  %147 = load i64, i64* %select.ptr.59, align 8
  %148 = sub nsw i64 %142, %147
  %149 = getelementptr inbounds i64, i64* %0, i64 9
  %150 = load i1, i1* %out.
  %151 = icmp slt i64 9, %len.
  %152 = bitcast i64* %shadow to i64*
  %safe.60 = or i1 %150, %151
  %select.ptr.61 = select i1 %safe.60, i64* %149, i64* %152
  %153 = load i64, i64* %149
  %select.val.62 = select i1 %150, i64 %148, i64 %153
  store i64 %select.val.62, i64* %select.ptr.61, align 8
  ret void
}

define internal void @fscalar_product(i64* %0, i64 %len., i64* %1, i64 %len.1, i64 %2, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %4 = load i1, i1* %out.
  %5 = load i64, i64* %1, align 8
  %6 = mul nsw i64 %5, %2
  %7 = load i1, i1* %out.
  %8 = load i64, i64* %0
  %select.val. = select i1 %7, i64 %6, i64 %8
  store i64 %select.val., i64* %0, align 8
  %9 = getelementptr inbounds i64, i64* %1, i64 1
  %10 = load i1, i1* %out.
  %11 = icmp slt i64 1, %len.1
  %12 = bitcast i64* %shadow to i64*
  %safe. = or i1 %10, %11
  %select.ptr. = select i1 %safe., i64* %9, i64* %12
  %13 = load i64, i64* %select.ptr., align 8
  %14 = mul nsw i64 %13, %2
  %15 = getelementptr inbounds i64, i64* %0, i64 1
  %16 = load i1, i1* %out.
  %17 = icmp slt i64 1, %len.
  %18 = bitcast i64* %shadow to i64*
  %safe.2 = or i1 %16, %17
  %select.ptr.3 = select i1 %safe.2, i64* %15, i64* %18
  %19 = load i64, i64* %15
  %select.val.4 = select i1 %16, i64 %14, i64 %19
  store i64 %select.val.4, i64* %select.ptr.3, align 8
  %20 = getelementptr inbounds i64, i64* %1, i64 2
  %21 = load i1, i1* %out.
  %22 = icmp slt i64 2, %len.1
  %23 = bitcast i64* %shadow to i64*
  %safe.5 = or i1 %21, %22
  %select.ptr.6 = select i1 %safe.5, i64* %20, i64* %23
  %24 = load i64, i64* %select.ptr.6, align 8
  %25 = mul nsw i64 %24, %2
  %26 = getelementptr inbounds i64, i64* %0, i64 2
  %27 = load i1, i1* %out.
  %28 = icmp slt i64 2, %len.
  %29 = bitcast i64* %shadow to i64*
  %safe.7 = or i1 %27, %28
  %select.ptr.8 = select i1 %safe.7, i64* %26, i64* %29
  %30 = load i64, i64* %26
  %select.val.9 = select i1 %27, i64 %25, i64 %30
  store i64 %select.val.9, i64* %select.ptr.8, align 8
  %31 = getelementptr inbounds i64, i64* %1, i64 3
  %32 = load i1, i1* %out.
  %33 = icmp slt i64 3, %len.1
  %34 = bitcast i64* %shadow to i64*
  %safe.10 = or i1 %32, %33
  %select.ptr.11 = select i1 %safe.10, i64* %31, i64* %34
  %35 = load i64, i64* %select.ptr.11, align 8
  %36 = mul nsw i64 %35, %2
  %37 = getelementptr inbounds i64, i64* %0, i64 3
  %38 = load i1, i1* %out.
  %39 = icmp slt i64 3, %len.
  %40 = bitcast i64* %shadow to i64*
  %safe.12 = or i1 %38, %39
  %select.ptr.13 = select i1 %safe.12, i64* %37, i64* %40
  %41 = load i64, i64* %37
  %select.val.14 = select i1 %38, i64 %36, i64 %41
  store i64 %select.val.14, i64* %select.ptr.13, align 8
  %42 = getelementptr inbounds i64, i64* %1, i64 4
  %43 = load i1, i1* %out.
  %44 = icmp slt i64 4, %len.1
  %45 = bitcast i64* %shadow to i64*
  %safe.15 = or i1 %43, %44
  %select.ptr.16 = select i1 %safe.15, i64* %42, i64* %45
  %46 = load i64, i64* %select.ptr.16, align 8
  %47 = mul nsw i64 %46, %2
  %48 = getelementptr inbounds i64, i64* %0, i64 4
  %49 = load i1, i1* %out.
  %50 = icmp slt i64 4, %len.
  %51 = bitcast i64* %shadow to i64*
  %safe.17 = or i1 %49, %50
  %select.ptr.18 = select i1 %safe.17, i64* %48, i64* %51
  %52 = load i64, i64* %48
  %select.val.19 = select i1 %49, i64 %47, i64 %52
  store i64 %select.val.19, i64* %select.ptr.18, align 8
  %53 = getelementptr inbounds i64, i64* %1, i64 5
  %54 = load i1, i1* %out.
  %55 = icmp slt i64 5, %len.1
  %56 = bitcast i64* %shadow to i64*
  %safe.20 = or i1 %54, %55
  %select.ptr.21 = select i1 %safe.20, i64* %53, i64* %56
  %57 = load i64, i64* %select.ptr.21, align 8
  %58 = mul nsw i64 %57, %2
  %59 = getelementptr inbounds i64, i64* %0, i64 5
  %60 = load i1, i1* %out.
  %61 = icmp slt i64 5, %len.
  %62 = bitcast i64* %shadow to i64*
  %safe.22 = or i1 %60, %61
  %select.ptr.23 = select i1 %safe.22, i64* %59, i64* %62
  %63 = load i64, i64* %59
  %select.val.24 = select i1 %60, i64 %58, i64 %63
  store i64 %select.val.24, i64* %select.ptr.23, align 8
  %64 = getelementptr inbounds i64, i64* %1, i64 6
  %65 = load i1, i1* %out.
  %66 = icmp slt i64 6, %len.1
  %67 = bitcast i64* %shadow to i64*
  %safe.25 = or i1 %65, %66
  %select.ptr.26 = select i1 %safe.25, i64* %64, i64* %67
  %68 = load i64, i64* %select.ptr.26, align 8
  %69 = mul nsw i64 %68, %2
  %70 = getelementptr inbounds i64, i64* %0, i64 6
  %71 = load i1, i1* %out.
  %72 = icmp slt i64 6, %len.
  %73 = bitcast i64* %shadow to i64*
  %safe.27 = or i1 %71, %72
  %select.ptr.28 = select i1 %safe.27, i64* %70, i64* %73
  %74 = load i64, i64* %70
  %select.val.29 = select i1 %71, i64 %69, i64 %74
  store i64 %select.val.29, i64* %select.ptr.28, align 8
  %75 = getelementptr inbounds i64, i64* %1, i64 7
  %76 = load i1, i1* %out.
  %77 = icmp slt i64 7, %len.1
  %78 = bitcast i64* %shadow to i64*
  %safe.30 = or i1 %76, %77
  %select.ptr.31 = select i1 %safe.30, i64* %75, i64* %78
  %79 = load i64, i64* %select.ptr.31, align 8
  %80 = mul nsw i64 %79, %2
  %81 = getelementptr inbounds i64, i64* %0, i64 7
  %82 = load i1, i1* %out.
  %83 = icmp slt i64 7, %len.
  %84 = bitcast i64* %shadow to i64*
  %safe.32 = or i1 %82, %83
  %select.ptr.33 = select i1 %safe.32, i64* %81, i64* %84
  %85 = load i64, i64* %81
  %select.val.34 = select i1 %82, i64 %80, i64 %85
  store i64 %select.val.34, i64* %select.ptr.33, align 8
  %86 = getelementptr inbounds i64, i64* %1, i64 8
  %87 = load i1, i1* %out.
  %88 = icmp slt i64 8, %len.1
  %89 = bitcast i64* %shadow to i64*
  %safe.35 = or i1 %87, %88
  %select.ptr.36 = select i1 %safe.35, i64* %86, i64* %89
  %90 = load i64, i64* %select.ptr.36, align 8
  %91 = mul nsw i64 %90, %2
  %92 = getelementptr inbounds i64, i64* %0, i64 8
  %93 = load i1, i1* %out.
  %94 = icmp slt i64 8, %len.
  %95 = bitcast i64* %shadow to i64*
  %safe.37 = or i1 %93, %94
  %select.ptr.38 = select i1 %safe.37, i64* %92, i64* %95
  %96 = load i64, i64* %92
  %select.val.39 = select i1 %93, i64 %91, i64 %96
  store i64 %select.val.39, i64* %select.ptr.38, align 8
  %97 = getelementptr inbounds i64, i64* %1, i64 9
  %98 = load i1, i1* %out.
  %99 = icmp slt i64 9, %len.1
  %100 = bitcast i64* %shadow to i64*
  %safe.40 = or i1 %98, %99
  %select.ptr.41 = select i1 %safe.40, i64* %97, i64* %100
  %101 = load i64, i64* %select.ptr.41, align 8
  %102 = mul nsw i64 %101, %2
  %103 = getelementptr inbounds i64, i64* %0, i64 9
  %104 = load i1, i1* %out.
  %105 = icmp slt i64 9, %len.
  %106 = bitcast i64* %shadow to i64*
  %safe.42 = or i1 %104, %105
  %select.ptr.43 = select i1 %safe.42, i64* %103, i64* %106
  %107 = load i64, i64* %103
  %select.val.44 = select i1 %104, i64 %102, i64 %107
  store i64 %select.val.44, i64* %select.ptr.43, align 8
  ret void
}

define void @randombytes(i8* %0, i64 %len., i64 %1) {
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
  %2 = sext i32 1 to i64
  call void @randombytes(i8* %1, i64 %2, i64 1)
  %3 = load i8, i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = and i32 %4, 1
  %6 = trunc i32 %5 to i8
  ret i8 %6
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

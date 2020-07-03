; ModuleID = 'comp/llvm-ir/main2.ll'
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
  %68 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 0
  store i32 -1, i32* %68, align 16
  %69 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 0
  %70 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 0
  %71 = sext i32 32 to i64
  %72 = sext i32 32 to i64
  %73 = call i32 @comp(i32* %69, i64 %71, i32* %70, i64 %72)
  %74 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %73)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

define i32 @comp(i32* %0, i64 %len., i32* %1, i64 %len.1) {
  %shadow = alloca i64
  %out. = alloca i1
  %out.2 = alloca i1
  %out.3 = alloca i1
  %out.4 = alloca i1
  %out.5 = alloca i1
  %out.6 = alloca i1
  %out.7 = alloca i1
  %out.8 = alloca i1
  %out.9 = alloca i1
  %out.10 = alloca i1
  %out.11 = alloca i1
  %out.12 = alloca i1
  %out.13 = alloca i1
  %out.14 = alloca i1
  %out.15 = alloca i1
  %out.16 = alloca i1
  %out.17 = alloca i1
  %out.18 = alloca i1
  %out.19 = alloca i1
  %out.20 = alloca i1
  %out.21 = alloca i1
  %out.22 = alloca i1
  %out.23 = alloca i1
  %out.24 = alloca i1
  %out.25 = alloca i1
  %out.26 = alloca i1
  %out.27 = alloca i1
  %out.28 = alloca i1
  %out.29 = alloca i1
  %out.30 = alloca i1
  %out.31 = alloca i1
  %out.32 = alloca i1
  %out.33 = alloca i1
  %out.34 = alloca i1
  %out.35 = alloca i1
  store i1 true, i1* %out.
  %3 = load i1, i1* %out.
  %4 = load i32, i32* %0, align 4
  %5 = load i32, i32* %1, align 4
  %6 = icmp ne i32 %4, %5
  store i1 %3, i1* %out.3
  %7 = load i1, i1* %out.3
  %8 = xor i1 %6, true
  %in. = and i1 %7, %8
  %9 = getelementptr inbounds i32, i32* %0, i64 1
  %10 = icmp slt i64 1, %len.
  %11 = bitcast i64* %shadow to i32*
  %safe. = or i1 %in., %10
  %select.ptr. = select i1 %safe., i32* %9, i32* %11
  %12 = load i32, i32* %select.ptr., align 4
  %13 = getelementptr inbounds i32, i32* %1, i64 1
  %14 = icmp slt i64 1, %len.1
  %15 = bitcast i64* %shadow to i32*
  %safe.99 = or i1 %in., %14
  %select.ptr.100 = select i1 %safe.99, i32* %13, i32* %15
  %16 = load i32, i32* %select.ptr.100, align 4
  %17 = icmp ne i32 %12, %16
  store i1 %in., i1* %out.2
  %18 = load i1, i1* %out.2
  %19 = xor i1 %17, true
  %in.68 = and i1 %18, %19
  %20 = getelementptr inbounds i32, i32* %0, i64 2
  %21 = icmp slt i64 2, %len.
  %22 = bitcast i64* %shadow to i32*
  %safe.101 = or i1 %in.68, %21
  %select.ptr.102 = select i1 %safe.101, i32* %20, i32* %22
  %23 = load i32, i32* %select.ptr.102, align 4
  %24 = getelementptr inbounds i32, i32* %1, i64 2
  %25 = icmp slt i64 2, %len.1
  %26 = bitcast i64* %shadow to i32*
  %safe.103 = or i1 %in.68, %25
  %select.ptr.104 = select i1 %safe.103, i32* %24, i32* %26
  %27 = load i32, i32* %select.ptr.104, align 4
  %28 = icmp ne i32 %23, %27
  store i1 %in.68, i1* %out.5
  %29 = load i1, i1* %out.5
  %30 = xor i1 %28, true
  %in.69 = and i1 %29, %30
  %31 = getelementptr inbounds i32, i32* %0, i64 3
  %32 = icmp slt i64 3, %len.
  %33 = bitcast i64* %shadow to i32*
  %safe.105 = or i1 %in.69, %32
  %select.ptr.106 = select i1 %safe.105, i32* %31, i32* %33
  %34 = load i32, i32* %select.ptr.106, align 4
  %35 = getelementptr inbounds i32, i32* %1, i64 3
  %36 = icmp slt i64 3, %len.1
  %37 = bitcast i64* %shadow to i32*
  %safe.107 = or i1 %in.69, %36
  %select.ptr.108 = select i1 %safe.107, i32* %35, i32* %37
  %38 = load i32, i32* %select.ptr.108, align 4
  %39 = icmp ne i32 %34, %38
  store i1 %in.69, i1* %out.6
  %40 = load i1, i1* %out.6
  %41 = xor i1 %39, true
  %in.70 = and i1 %40, %41
  %42 = getelementptr inbounds i32, i32* %0, i64 4
  %43 = icmp slt i64 4, %len.
  %44 = bitcast i64* %shadow to i32*
  %safe.109 = or i1 %in.70, %43
  %select.ptr.110 = select i1 %safe.109, i32* %42, i32* %44
  %45 = load i32, i32* %select.ptr.110, align 4
  %46 = getelementptr inbounds i32, i32* %1, i64 4
  %47 = icmp slt i64 4, %len.1
  %48 = bitcast i64* %shadow to i32*
  %safe.111 = or i1 %in.70, %47
  %select.ptr.112 = select i1 %safe.111, i32* %46, i32* %48
  %49 = load i32, i32* %select.ptr.112, align 4
  %50 = icmp ne i32 %45, %49
  store i1 %in.70, i1* %out.7
  %51 = load i1, i1* %out.7
  %52 = xor i1 %50, true
  %in.71 = and i1 %51, %52
  %53 = getelementptr inbounds i32, i32* %0, i64 5
  %54 = icmp slt i64 5, %len.
  %55 = bitcast i64* %shadow to i32*
  %safe.113 = or i1 %in.71, %54
  %select.ptr.114 = select i1 %safe.113, i32* %53, i32* %55
  %56 = load i32, i32* %select.ptr.114, align 4
  %57 = getelementptr inbounds i32, i32* %1, i64 5
  %58 = icmp slt i64 5, %len.1
  %59 = bitcast i64* %shadow to i32*
  %safe.115 = or i1 %in.71, %58
  %select.ptr.116 = select i1 %safe.115, i32* %57, i32* %59
  %60 = load i32, i32* %select.ptr.116, align 4
  %61 = icmp ne i32 %56, %60
  store i1 %in.71, i1* %out.8
  %62 = load i1, i1* %out.8
  %63 = xor i1 %61, true
  %in.72 = and i1 %62, %63
  %64 = getelementptr inbounds i32, i32* %0, i64 6
  %65 = icmp slt i64 6, %len.
  %66 = bitcast i64* %shadow to i32*
  %safe.117 = or i1 %in.72, %65
  %select.ptr.118 = select i1 %safe.117, i32* %64, i32* %66
  %67 = load i32, i32* %select.ptr.118, align 4
  %68 = getelementptr inbounds i32, i32* %1, i64 6
  %69 = icmp slt i64 6, %len.1
  %70 = bitcast i64* %shadow to i32*
  %safe.119 = or i1 %in.72, %69
  %select.ptr.120 = select i1 %safe.119, i32* %68, i32* %70
  %71 = load i32, i32* %select.ptr.120, align 4
  %72 = icmp ne i32 %67, %71
  store i1 %in.72, i1* %out.9
  %73 = load i1, i1* %out.9
  %74 = xor i1 %72, true
  %in.73 = and i1 %73, %74
  %75 = getelementptr inbounds i32, i32* %0, i64 7
  %76 = icmp slt i64 7, %len.
  %77 = bitcast i64* %shadow to i32*
  %safe.121 = or i1 %in.73, %76
  %select.ptr.122 = select i1 %safe.121, i32* %75, i32* %77
  %78 = load i32, i32* %select.ptr.122, align 4
  %79 = getelementptr inbounds i32, i32* %1, i64 7
  %80 = icmp slt i64 7, %len.1
  %81 = bitcast i64* %shadow to i32*
  %safe.123 = or i1 %in.73, %80
  %select.ptr.124 = select i1 %safe.123, i32* %79, i32* %81
  %82 = load i32, i32* %select.ptr.124, align 4
  %83 = icmp ne i32 %78, %82
  store i1 %in.73, i1* %out.10
  %84 = load i1, i1* %out.10
  %85 = xor i1 %83, true
  %in.74 = and i1 %84, %85
  %86 = getelementptr inbounds i32, i32* %0, i64 8
  %87 = icmp slt i64 8, %len.
  %88 = bitcast i64* %shadow to i32*
  %safe.125 = or i1 %in.74, %87
  %select.ptr.126 = select i1 %safe.125, i32* %86, i32* %88
  %89 = load i32, i32* %select.ptr.126, align 4
  %90 = getelementptr inbounds i32, i32* %1, i64 8
  %91 = icmp slt i64 8, %len.1
  %92 = bitcast i64* %shadow to i32*
  %safe.127 = or i1 %in.74, %91
  %select.ptr.128 = select i1 %safe.127, i32* %90, i32* %92
  %93 = load i32, i32* %select.ptr.128, align 4
  %94 = icmp ne i32 %89, %93
  store i1 %in.74, i1* %out.11
  %95 = load i1, i1* %out.11
  %96 = xor i1 %94, true
  %in.75 = and i1 %95, %96
  %97 = getelementptr inbounds i32, i32* %0, i64 9
  %98 = icmp slt i64 9, %len.
  %99 = bitcast i64* %shadow to i32*
  %safe.129 = or i1 %in.75, %98
  %select.ptr.130 = select i1 %safe.129, i32* %97, i32* %99
  %100 = load i32, i32* %select.ptr.130, align 4
  %101 = getelementptr inbounds i32, i32* %1, i64 9
  %102 = icmp slt i64 9, %len.1
  %103 = bitcast i64* %shadow to i32*
  %safe.131 = or i1 %in.75, %102
  %select.ptr.132 = select i1 %safe.131, i32* %101, i32* %103
  %104 = load i32, i32* %select.ptr.132, align 4
  %105 = icmp ne i32 %100, %104
  store i1 %in.75, i1* %out.12
  %106 = load i1, i1* %out.12
  %107 = xor i1 %105, true
  %in.76 = and i1 %106, %107
  %108 = getelementptr inbounds i32, i32* %0, i64 10
  %109 = icmp slt i64 10, %len.
  %110 = bitcast i64* %shadow to i32*
  %safe.133 = or i1 %in.76, %109
  %select.ptr.134 = select i1 %safe.133, i32* %108, i32* %110
  %111 = load i32, i32* %select.ptr.134, align 4
  %112 = getelementptr inbounds i32, i32* %1, i64 10
  %113 = icmp slt i64 10, %len.1
  %114 = bitcast i64* %shadow to i32*
  %safe.135 = or i1 %in.76, %113
  %select.ptr.136 = select i1 %safe.135, i32* %112, i32* %114
  %115 = load i32, i32* %select.ptr.136, align 4
  %116 = icmp ne i32 %111, %115
  store i1 %in.76, i1* %out.13
  %117 = load i1, i1* %out.13
  %118 = xor i1 %116, true
  %in.77 = and i1 %117, %118
  %119 = getelementptr inbounds i32, i32* %0, i64 11
  %120 = icmp slt i64 11, %len.
  %121 = bitcast i64* %shadow to i32*
  %safe.137 = or i1 %in.77, %120
  %select.ptr.138 = select i1 %safe.137, i32* %119, i32* %121
  %122 = load i32, i32* %select.ptr.138, align 4
  %123 = getelementptr inbounds i32, i32* %1, i64 11
  %124 = icmp slt i64 11, %len.1
  %125 = bitcast i64* %shadow to i32*
  %safe.139 = or i1 %in.77, %124
  %select.ptr.140 = select i1 %safe.139, i32* %123, i32* %125
  %126 = load i32, i32* %select.ptr.140, align 4
  %127 = icmp ne i32 %122, %126
  store i1 %in.77, i1* %out.14
  %128 = load i1, i1* %out.14
  %129 = xor i1 %127, true
  %in.78 = and i1 %128, %129
  %130 = getelementptr inbounds i32, i32* %0, i64 12
  %131 = icmp slt i64 12, %len.
  %132 = bitcast i64* %shadow to i32*
  %safe.141 = or i1 %in.78, %131
  %select.ptr.142 = select i1 %safe.141, i32* %130, i32* %132
  %133 = load i32, i32* %select.ptr.142, align 4
  %134 = getelementptr inbounds i32, i32* %1, i64 12
  %135 = icmp slt i64 12, %len.1
  %136 = bitcast i64* %shadow to i32*
  %safe.143 = or i1 %in.78, %135
  %select.ptr.144 = select i1 %safe.143, i32* %134, i32* %136
  %137 = load i32, i32* %select.ptr.144, align 4
  %138 = icmp ne i32 %133, %137
  store i1 %in.78, i1* %out.15
  %139 = load i1, i1* %out.15
  %140 = xor i1 %138, true
  %in.79 = and i1 %139, %140
  %141 = getelementptr inbounds i32, i32* %0, i64 13
  %142 = icmp slt i64 13, %len.
  %143 = bitcast i64* %shadow to i32*
  %safe.145 = or i1 %in.79, %142
  %select.ptr.146 = select i1 %safe.145, i32* %141, i32* %143
  %144 = load i32, i32* %select.ptr.146, align 4
  %145 = getelementptr inbounds i32, i32* %1, i64 13
  %146 = icmp slt i64 13, %len.1
  %147 = bitcast i64* %shadow to i32*
  %safe.147 = or i1 %in.79, %146
  %select.ptr.148 = select i1 %safe.147, i32* %145, i32* %147
  %148 = load i32, i32* %select.ptr.148, align 4
  %149 = icmp ne i32 %144, %148
  store i1 %in.79, i1* %out.16
  %150 = load i1, i1* %out.16
  %151 = xor i1 %149, true
  %in.80 = and i1 %150, %151
  %152 = getelementptr inbounds i32, i32* %0, i64 14
  %153 = icmp slt i64 14, %len.
  %154 = bitcast i64* %shadow to i32*
  %safe.149 = or i1 %in.80, %153
  %select.ptr.150 = select i1 %safe.149, i32* %152, i32* %154
  %155 = load i32, i32* %select.ptr.150, align 4
  %156 = getelementptr inbounds i32, i32* %1, i64 14
  %157 = icmp slt i64 14, %len.1
  %158 = bitcast i64* %shadow to i32*
  %safe.151 = or i1 %in.80, %157
  %select.ptr.152 = select i1 %safe.151, i32* %156, i32* %158
  %159 = load i32, i32* %select.ptr.152, align 4
  %160 = icmp ne i32 %155, %159
  store i1 %in.80, i1* %out.17
  %161 = load i1, i1* %out.17
  %162 = xor i1 %160, true
  %in.81 = and i1 %161, %162
  %163 = getelementptr inbounds i32, i32* %0, i64 15
  %164 = icmp slt i64 15, %len.
  %165 = bitcast i64* %shadow to i32*
  %safe.153 = or i1 %in.81, %164
  %select.ptr.154 = select i1 %safe.153, i32* %163, i32* %165
  %166 = load i32, i32* %select.ptr.154, align 4
  %167 = getelementptr inbounds i32, i32* %1, i64 15
  %168 = icmp slt i64 15, %len.1
  %169 = bitcast i64* %shadow to i32*
  %safe.155 = or i1 %in.81, %168
  %select.ptr.156 = select i1 %safe.155, i32* %167, i32* %169
  %170 = load i32, i32* %select.ptr.156, align 4
  %171 = icmp ne i32 %166, %170
  store i1 %in.81, i1* %out.18
  %172 = load i1, i1* %out.18
  %173 = xor i1 %171, true
  %in.82 = and i1 %172, %173
  %174 = getelementptr inbounds i32, i32* %0, i64 16
  %175 = icmp slt i64 16, %len.
  %176 = bitcast i64* %shadow to i32*
  %safe.157 = or i1 %in.82, %175
  %select.ptr.158 = select i1 %safe.157, i32* %174, i32* %176
  %177 = load i32, i32* %select.ptr.158, align 4
  %178 = getelementptr inbounds i32, i32* %1, i64 16
  %179 = icmp slt i64 16, %len.1
  %180 = bitcast i64* %shadow to i32*
  %safe.159 = or i1 %in.82, %179
  %select.ptr.160 = select i1 %safe.159, i32* %178, i32* %180
  %181 = load i32, i32* %select.ptr.160, align 4
  %182 = icmp ne i32 %177, %181
  store i1 %in.82, i1* %out.19
  %183 = load i1, i1* %out.19
  %184 = xor i1 %182, true
  %in.83 = and i1 %183, %184
  %185 = getelementptr inbounds i32, i32* %0, i64 17
  %186 = icmp slt i64 17, %len.
  %187 = bitcast i64* %shadow to i32*
  %safe.161 = or i1 %in.83, %186
  %select.ptr.162 = select i1 %safe.161, i32* %185, i32* %187
  %188 = load i32, i32* %select.ptr.162, align 4
  %189 = getelementptr inbounds i32, i32* %1, i64 17
  %190 = icmp slt i64 17, %len.1
  %191 = bitcast i64* %shadow to i32*
  %safe.163 = or i1 %in.83, %190
  %select.ptr.164 = select i1 %safe.163, i32* %189, i32* %191
  %192 = load i32, i32* %select.ptr.164, align 4
  %193 = icmp ne i32 %188, %192
  store i1 %in.83, i1* %out.20
  %194 = load i1, i1* %out.20
  %195 = xor i1 %193, true
  %in.84 = and i1 %194, %195
  %196 = getelementptr inbounds i32, i32* %0, i64 18
  %197 = icmp slt i64 18, %len.
  %198 = bitcast i64* %shadow to i32*
  %safe.165 = or i1 %in.84, %197
  %select.ptr.166 = select i1 %safe.165, i32* %196, i32* %198
  %199 = load i32, i32* %select.ptr.166, align 4
  %200 = getelementptr inbounds i32, i32* %1, i64 18
  %201 = icmp slt i64 18, %len.1
  %202 = bitcast i64* %shadow to i32*
  %safe.167 = or i1 %in.84, %201
  %select.ptr.168 = select i1 %safe.167, i32* %200, i32* %202
  %203 = load i32, i32* %select.ptr.168, align 4
  %204 = icmp ne i32 %199, %203
  store i1 %in.84, i1* %out.21
  %205 = load i1, i1* %out.21
  %206 = xor i1 %204, true
  %in.85 = and i1 %205, %206
  %207 = getelementptr inbounds i32, i32* %0, i64 19
  %208 = icmp slt i64 19, %len.
  %209 = bitcast i64* %shadow to i32*
  %safe.169 = or i1 %in.85, %208
  %select.ptr.170 = select i1 %safe.169, i32* %207, i32* %209
  %210 = load i32, i32* %select.ptr.170, align 4
  %211 = getelementptr inbounds i32, i32* %1, i64 19
  %212 = icmp slt i64 19, %len.1
  %213 = bitcast i64* %shadow to i32*
  %safe.171 = or i1 %in.85, %212
  %select.ptr.172 = select i1 %safe.171, i32* %211, i32* %213
  %214 = load i32, i32* %select.ptr.172, align 4
  %215 = icmp ne i32 %210, %214
  store i1 %in.85, i1* %out.22
  %216 = load i1, i1* %out.22
  %217 = xor i1 %215, true
  %in.86 = and i1 %216, %217
  %218 = getelementptr inbounds i32, i32* %0, i64 20
  %219 = icmp slt i64 20, %len.
  %220 = bitcast i64* %shadow to i32*
  %safe.173 = or i1 %in.86, %219
  %select.ptr.174 = select i1 %safe.173, i32* %218, i32* %220
  %221 = load i32, i32* %select.ptr.174, align 4
  %222 = getelementptr inbounds i32, i32* %1, i64 20
  %223 = icmp slt i64 20, %len.1
  %224 = bitcast i64* %shadow to i32*
  %safe.175 = or i1 %in.86, %223
  %select.ptr.176 = select i1 %safe.175, i32* %222, i32* %224
  %225 = load i32, i32* %select.ptr.176, align 4
  %226 = icmp ne i32 %221, %225
  store i1 %in.86, i1* %out.23
  %227 = load i1, i1* %out.23
  %228 = xor i1 %226, true
  %in.87 = and i1 %227, %228
  %229 = getelementptr inbounds i32, i32* %0, i64 21
  %230 = icmp slt i64 21, %len.
  %231 = bitcast i64* %shadow to i32*
  %safe.177 = or i1 %in.87, %230
  %select.ptr.178 = select i1 %safe.177, i32* %229, i32* %231
  %232 = load i32, i32* %select.ptr.178, align 4
  %233 = getelementptr inbounds i32, i32* %1, i64 21
  %234 = icmp slt i64 21, %len.1
  %235 = bitcast i64* %shadow to i32*
  %safe.179 = or i1 %in.87, %234
  %select.ptr.180 = select i1 %safe.179, i32* %233, i32* %235
  %236 = load i32, i32* %select.ptr.180, align 4
  %237 = icmp ne i32 %232, %236
  store i1 %in.87, i1* %out.24
  %238 = load i1, i1* %out.24
  %239 = xor i1 %237, true
  %in.88 = and i1 %238, %239
  %240 = getelementptr inbounds i32, i32* %0, i64 22
  %241 = icmp slt i64 22, %len.
  %242 = bitcast i64* %shadow to i32*
  %safe.181 = or i1 %in.88, %241
  %select.ptr.182 = select i1 %safe.181, i32* %240, i32* %242
  %243 = load i32, i32* %select.ptr.182, align 4
  %244 = getelementptr inbounds i32, i32* %1, i64 22
  %245 = icmp slt i64 22, %len.1
  %246 = bitcast i64* %shadow to i32*
  %safe.183 = or i1 %in.88, %245
  %select.ptr.184 = select i1 %safe.183, i32* %244, i32* %246
  %247 = load i32, i32* %select.ptr.184, align 4
  %248 = icmp ne i32 %243, %247
  store i1 %in.88, i1* %out.25
  %249 = load i1, i1* %out.25
  %250 = xor i1 %248, true
  %in.89 = and i1 %249, %250
  %251 = getelementptr inbounds i32, i32* %0, i64 23
  %252 = icmp slt i64 23, %len.
  %253 = bitcast i64* %shadow to i32*
  %safe.185 = or i1 %in.89, %252
  %select.ptr.186 = select i1 %safe.185, i32* %251, i32* %253
  %254 = load i32, i32* %select.ptr.186, align 4
  %255 = getelementptr inbounds i32, i32* %1, i64 23
  %256 = icmp slt i64 23, %len.1
  %257 = bitcast i64* %shadow to i32*
  %safe.187 = or i1 %in.89, %256
  %select.ptr.188 = select i1 %safe.187, i32* %255, i32* %257
  %258 = load i32, i32* %select.ptr.188, align 4
  %259 = icmp ne i32 %254, %258
  store i1 %in.89, i1* %out.26
  %260 = load i1, i1* %out.26
  %261 = xor i1 %259, true
  %in.90 = and i1 %260, %261
  %262 = getelementptr inbounds i32, i32* %0, i64 24
  %263 = icmp slt i64 24, %len.
  %264 = bitcast i64* %shadow to i32*
  %safe.189 = or i1 %in.90, %263
  %select.ptr.190 = select i1 %safe.189, i32* %262, i32* %264
  %265 = load i32, i32* %select.ptr.190, align 4
  %266 = getelementptr inbounds i32, i32* %1, i64 24
  %267 = icmp slt i64 24, %len.1
  %268 = bitcast i64* %shadow to i32*
  %safe.191 = or i1 %in.90, %267
  %select.ptr.192 = select i1 %safe.191, i32* %266, i32* %268
  %269 = load i32, i32* %select.ptr.192, align 4
  %270 = icmp ne i32 %265, %269
  store i1 %in.90, i1* %out.27
  %271 = load i1, i1* %out.27
  %272 = xor i1 %270, true
  %in.91 = and i1 %271, %272
  %273 = getelementptr inbounds i32, i32* %0, i64 25
  %274 = icmp slt i64 25, %len.
  %275 = bitcast i64* %shadow to i32*
  %safe.193 = or i1 %in.91, %274
  %select.ptr.194 = select i1 %safe.193, i32* %273, i32* %275
  %276 = load i32, i32* %select.ptr.194, align 4
  %277 = getelementptr inbounds i32, i32* %1, i64 25
  %278 = icmp slt i64 25, %len.1
  %279 = bitcast i64* %shadow to i32*
  %safe.195 = or i1 %in.91, %278
  %select.ptr.196 = select i1 %safe.195, i32* %277, i32* %279
  %280 = load i32, i32* %select.ptr.196, align 4
  %281 = icmp ne i32 %276, %280
  store i1 %in.91, i1* %out.28
  %282 = load i1, i1* %out.28
  %283 = xor i1 %281, true
  %in.92 = and i1 %282, %283
  %284 = getelementptr inbounds i32, i32* %0, i64 26
  %285 = icmp slt i64 26, %len.
  %286 = bitcast i64* %shadow to i32*
  %safe.197 = or i1 %in.92, %285
  %select.ptr.198 = select i1 %safe.197, i32* %284, i32* %286
  %287 = load i32, i32* %select.ptr.198, align 4
  %288 = getelementptr inbounds i32, i32* %1, i64 26
  %289 = icmp slt i64 26, %len.1
  %290 = bitcast i64* %shadow to i32*
  %safe.199 = or i1 %in.92, %289
  %select.ptr.200 = select i1 %safe.199, i32* %288, i32* %290
  %291 = load i32, i32* %select.ptr.200, align 4
  %292 = icmp ne i32 %287, %291
  store i1 %in.92, i1* %out.29
  %293 = load i1, i1* %out.29
  %294 = xor i1 %292, true
  %in.93 = and i1 %293, %294
  %295 = getelementptr inbounds i32, i32* %0, i64 27
  %296 = icmp slt i64 27, %len.
  %297 = bitcast i64* %shadow to i32*
  %safe.201 = or i1 %in.93, %296
  %select.ptr.202 = select i1 %safe.201, i32* %295, i32* %297
  %298 = load i32, i32* %select.ptr.202, align 4
  %299 = getelementptr inbounds i32, i32* %1, i64 27
  %300 = icmp slt i64 27, %len.1
  %301 = bitcast i64* %shadow to i32*
  %safe.203 = or i1 %in.93, %300
  %select.ptr.204 = select i1 %safe.203, i32* %299, i32* %301
  %302 = load i32, i32* %select.ptr.204, align 4
  %303 = icmp ne i32 %298, %302
  store i1 %in.93, i1* %out.30
  %304 = load i1, i1* %out.30
  %305 = xor i1 %303, true
  %in.94 = and i1 %304, %305
  %306 = getelementptr inbounds i32, i32* %0, i64 28
  %307 = icmp slt i64 28, %len.
  %308 = bitcast i64* %shadow to i32*
  %safe.205 = or i1 %in.94, %307
  %select.ptr.206 = select i1 %safe.205, i32* %306, i32* %308
  %309 = load i32, i32* %select.ptr.206, align 4
  %310 = getelementptr inbounds i32, i32* %1, i64 28
  %311 = icmp slt i64 28, %len.1
  %312 = bitcast i64* %shadow to i32*
  %safe.207 = or i1 %in.94, %311
  %select.ptr.208 = select i1 %safe.207, i32* %310, i32* %312
  %313 = load i32, i32* %select.ptr.208, align 4
  %314 = icmp ne i32 %309, %313
  store i1 %in.94, i1* %out.31
  %315 = load i1, i1* %out.31
  %316 = xor i1 %314, true
  %in.95 = and i1 %315, %316
  %317 = getelementptr inbounds i32, i32* %0, i64 29
  %318 = icmp slt i64 29, %len.
  %319 = bitcast i64* %shadow to i32*
  %safe.209 = or i1 %in.95, %318
  %select.ptr.210 = select i1 %safe.209, i32* %317, i32* %319
  %320 = load i32, i32* %select.ptr.210, align 4
  %321 = getelementptr inbounds i32, i32* %1, i64 29
  %322 = icmp slt i64 29, %len.1
  %323 = bitcast i64* %shadow to i32*
  %safe.211 = or i1 %in.95, %322
  %select.ptr.212 = select i1 %safe.211, i32* %321, i32* %323
  %324 = load i32, i32* %select.ptr.212, align 4
  %325 = icmp ne i32 %320, %324
  store i1 %in.95, i1* %out.32
  %326 = load i1, i1* %out.32
  %327 = xor i1 %325, true
  %in.96 = and i1 %326, %327
  %328 = getelementptr inbounds i32, i32* %0, i64 30
  %329 = icmp slt i64 30, %len.
  %330 = bitcast i64* %shadow to i32*
  %safe.213 = or i1 %in.96, %329
  %select.ptr.214 = select i1 %safe.213, i32* %328, i32* %330
  %331 = load i32, i32* %select.ptr.214, align 4
  %332 = getelementptr inbounds i32, i32* %1, i64 30
  %333 = icmp slt i64 30, %len.1
  %334 = bitcast i64* %shadow to i32*
  %safe.215 = or i1 %in.96, %333
  %select.ptr.216 = select i1 %safe.215, i32* %332, i32* %334
  %335 = load i32, i32* %select.ptr.216, align 4
  %336 = icmp ne i32 %331, %335
  store i1 %in.96, i1* %out.33
  %337 = load i1, i1* %out.33
  %338 = xor i1 %336, true
  %in.97 = and i1 %337, %338
  %339 = getelementptr inbounds i32, i32* %0, i64 31
  %340 = icmp slt i64 31, %len.
  %341 = bitcast i64* %shadow to i32*
  %safe.217 = or i1 %in.97, %340
  %select.ptr.218 = select i1 %safe.217, i32* %339, i32* %341
  %342 = load i32, i32* %select.ptr.218, align 4
  %343 = getelementptr inbounds i32, i32* %1, i64 31
  %344 = icmp slt i64 31, %len.1
  %345 = bitcast i64* %shadow to i32*
  %safe.219 = or i1 %in.97, %344
  %select.ptr.220 = select i1 %safe.219, i32* %343, i32* %345
  %346 = load i32, i32* %select.ptr.220, align 4
  %347 = icmp ne i32 %342, %346
  store i1 %in.97, i1* %out.34
  %348 = load i1, i1* %out.34
  %349 = xor i1 %347, true
  %in.98 = and i1 %348, %349
  store i1 %in.98, i1* %out.35
  %350 = load i1, i1* %out.2
  %in.67 = and i1 %350, %17
  %351 = load i1, i1* %out.3
  %in.66 = and i1 %351, %6
  %352 = load i1, i1* %out.5
  %in.65 = and i1 %352, %28
  %353 = load i1, i1* %out.6
  %in.64 = and i1 %353, %39
  %354 = load i1, i1* %out.7
  %in.63 = and i1 %354, %50
  %355 = load i1, i1* %out.8
  %in.62 = and i1 %355, %61
  %356 = load i1, i1* %out.9
  %in.61 = and i1 %356, %72
  %357 = load i1, i1* %out.10
  %in.60 = and i1 %357, %83
  %358 = load i1, i1* %out.11
  %in.59 = and i1 %358, %94
  %359 = load i1, i1* %out.12
  %in.58 = and i1 %359, %105
  %360 = load i1, i1* %out.13
  %in.57 = and i1 %360, %116
  %361 = load i1, i1* %out.14
  %in.56 = and i1 %361, %127
  %362 = load i1, i1* %out.15
  %in.55 = and i1 %362, %138
  %363 = load i1, i1* %out.16
  %in.54 = and i1 %363, %149
  %364 = load i1, i1* %out.17
  %in.53 = and i1 %364, %160
  %365 = load i1, i1* %out.18
  %in.52 = and i1 %365, %171
  %366 = load i1, i1* %out.19
  %in.51 = and i1 %366, %182
  %367 = load i1, i1* %out.20
  %in.50 = and i1 %367, %193
  %368 = load i1, i1* %out.21
  %in.49 = and i1 %368, %204
  %369 = load i1, i1* %out.22
  %in.48 = and i1 %369, %215
  %370 = load i1, i1* %out.23
  %in.47 = and i1 %370, %226
  %371 = load i1, i1* %out.24
  %in.46 = and i1 %371, %237
  %372 = load i1, i1* %out.25
  %in.45 = and i1 %372, %248
  %373 = load i1, i1* %out.26
  %in.44 = and i1 %373, %259
  %374 = load i1, i1* %out.27
  %in.43 = and i1 %374, %270
  %375 = load i1, i1* %out.28
  %in.42 = and i1 %375, %281
  %376 = load i1, i1* %out.29
  %in.41 = and i1 %376, %292
  %377 = load i1, i1* %out.30
  %in.40 = and i1 %377, %303
  %378 = load i1, i1* %out.31
  %in.39 = and i1 %378, %314
  %379 = load i1, i1* %out.32
  %in.38 = and i1 %379, %325
  %380 = load i1, i1* %out.33
  %in.37 = and i1 %380, %336
  %381 = load i1, i1* %out.34
  %in.36 = and i1 %381, %347
  %382 = load i1, i1* %out.35
  %383 = select i1 %in.36, i32 0, i32 1
  %384 = select i1 %in.37, i32 0, i32 %383
  %385 = select i1 %in.38, i32 0, i32 %384
  %386 = select i1 %in.39, i32 0, i32 %385
  %387 = select i1 %in.40, i32 0, i32 %386
  %388 = select i1 %in.41, i32 0, i32 %387
  %389 = select i1 %in.42, i32 0, i32 %388
  %390 = select i1 %in.43, i32 0, i32 %389
  %391 = select i1 %in.44, i32 0, i32 %390
  %392 = select i1 %in.45, i32 0, i32 %391
  %393 = select i1 %in.46, i32 0, i32 %392
  %394 = select i1 %in.47, i32 0, i32 %393
  %395 = select i1 %in.48, i32 0, i32 %394
  %396 = select i1 %in.49, i32 0, i32 %395
  %397 = select i1 %in.50, i32 0, i32 %396
  %398 = select i1 %in.51, i32 0, i32 %397
  %399 = select i1 %in.52, i32 0, i32 %398
  %400 = select i1 %in.53, i32 0, i32 %399
  %401 = select i1 %in.54, i32 0, i32 %400
  %402 = select i1 %in.55, i32 0, i32 %401
  %403 = select i1 %in.56, i32 0, i32 %402
  %404 = select i1 %in.57, i32 0, i32 %403
  %405 = select i1 %in.58, i32 0, i32 %404
  %406 = select i1 %in.59, i32 0, i32 %405
  %407 = select i1 %in.60, i32 0, i32 %406
  %408 = select i1 %in.61, i32 0, i32 %407
  %409 = select i1 %in.62, i32 0, i32 %408
  %410 = select i1 %in.63, i32 0, i32 %409
  %411 = select i1 %in.64, i32 0, i32 %410
  %412 = select i1 %in.65, i32 0, i32 %411
  %413 = select i1 %in.66, i32 0, i32 %412
  %select.phi. = select i1 %in.67, i32 0, i32 %413
  %414 = or i1 %in.67, %in.66
  %415 = or i1 %414, %in.65
  %416 = or i1 %415, %in.64
  %417 = or i1 %416, %in.63
  %418 = or i1 %417, %in.62
  %419 = or i1 %418, %in.61
  %420 = or i1 %419, %in.60
  %421 = or i1 %420, %in.59
  %422 = or i1 %421, %in.58
  %423 = or i1 %422, %in.57
  %424 = or i1 %423, %in.56
  %425 = or i1 %424, %in.55
  %426 = or i1 %425, %in.54
  %427 = or i1 %426, %in.53
  %428 = or i1 %427, %in.52
  %429 = or i1 %428, %in.51
  %430 = or i1 %429, %in.50
  %431 = or i1 %430, %in.49
  %432 = or i1 %431, %in.48
  %433 = or i1 %432, %in.47
  %434 = or i1 %433, %in.46
  %435 = or i1 %434, %in.45
  %436 = or i1 %435, %in.44
  %437 = or i1 %436, %in.43
  %438 = or i1 %437, %in.42
  %439 = or i1 %438, %in.41
  %440 = or i1 %439, %in.40
  %441 = or i1 %440, %in.39
  %442 = or i1 %441, %in.38
  %443 = or i1 %442, %in.37
  %444 = or i1 %443, %in.36
  %445 = or i1 %444, %382
  store i1 %445, i1* %out.4
  ret i32 %select.phi.
}

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}

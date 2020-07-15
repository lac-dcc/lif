; ModuleID = '3way/llvm-ir/main.ll'
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
@str.3 = private unnamed_addr constant [11 x i8] c"**********\00", align 1

; Function Attrs: nofree nounwind
define void @printvec(i8* %0, i64 %N, i64* nocapture readonly %1, i64 %N1) local_unnamed_addr #0 {
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

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
  %1 = alloca %struct.twy_ctx, align 8
  %2 = alloca [9 x i64], align 16
  %3 = alloca [3 x i64], align 16
  %4 = getelementptr inbounds [3 x i64], [3 x i64]* %3, i64 0, i64 2
  %5 = getelementptr inbounds [3 x i64], [3 x i64]* %3, i64 0, i64 1
  %6 = getelementptr inbounds [3 x i64], [3 x i64]* %3, i64 0, i64 0
  %7 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 2
  %8 = bitcast [3 x i64]* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(24) %8, i8 0, i64 24, i1 false)
  store i64 1, i64* %7, align 16
  %9 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 1
  store i64 1, i64* %9, align 8
  %10 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 0
  store i64 1, i64* %10, align 16
  call void @twy_key(%struct.twy_ctx* nonnull %1, i64 1, i64* nonnull %6, i64 undef) #4
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str.3, i64 0, i64 0))
  call void @printvec(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i64 undef, i64* nonnull %6, i64 undef) #4
  call void @printvec(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i64 undef, i64* nonnull %10, i64 undef) #4
  call void @encrypt(%struct.twy_ctx* nonnull %1, i64 1, i64* nonnull %10, i64 9, i1 true) #4
  call void @printvec(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i64 undef, i64* nonnull %10, i64 undef) #4
  store i64 6, i64* %6, align 16
  store i64 5, i64* %5, align 8
  store i64 4, i64* %4, align 16
  store i64 3, i64* %10, align 16
  store i64 2, i64* %9, align 8
  store i64 1, i64* %7, align 16
  call void @twy_key(%struct.twy_ctx* nonnull %1, i64 1, i64* nonnull %6, i64 undef) #4
  %puts16 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str.3, i64 0, i64 0))
  call void @printvec(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i64 undef, i64* nonnull %6, i64 undef) #4
  call void @printvec(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i64 undef, i64* nonnull %10, i64 undef) #4
  call void @encrypt(%struct.twy_ctx* nonnull %1, i64 1, i64* nonnull %10, i64 9, i1 true) #4
  call void @printvec(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i64 undef, i64* nonnull %10, i64 undef) #4
  store i64 3168727058, i64* %4, align 16
  store i64 1164413355, i64* %5, align 8
  store i64 3740275252, i64* %6, align 16
  store i64 19088743, i64* %7, align 16
  store i64 2596069104, i64* %9, align 8
  store i64 591751049, i64* %10, align 16
  call void @twy_key(%struct.twy_ctx* nonnull %1, i64 1, i64* nonnull %6, i64 undef) #4
  %puts17 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str.3, i64 0, i64 0))
  call void @printvec(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i64 undef, i64* nonnull %6, i64 undef) #4
  call void @printvec(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i64 undef, i64* nonnull %10, i64 undef) #4
  call void @encrypt(%struct.twy_ctx* nonnull %1, i64 1, i64* nonnull %10, i64 9, i1 true) #4
  call void @printvec(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i64 undef, i64* nonnull %10, i64 undef) #4
  store i64 3401130189, i64* %4, align 16
  store i64 3591651640, i64* %5, align 8
  store i64 3538967390, i64* %6, align 16
  store i64 2904681719, i64* %7, align 16
  store i64 2209258948, i64* %9, align 8
  store i64 1079625582, i64* %10, align 16
  call void @twy_key(%struct.twy_ctx* nonnull %1, i64 1, i64* nonnull %6, i64 undef) #4
  %puts18 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @str.3, i64 0, i64 0))
  call void @printvec(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i64 undef, i64* nonnull %6, i64 undef) #4
  call void @printvec(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i64 undef, i64* nonnull %10, i64 undef) #4
  call void @encrypt(%struct.twy_ctx* nonnull %1, i64 1, i64* nonnull %10, i64 9, i1 true) #4
  call void @printvec(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i64 undef, i64* nonnull %10, i64 undef) #4
  %11 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 0
  store i64 0, i64* %11, align 16
  %12 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 1
  store i64 1, i64* %12, align 8
  %13 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 2
  store i64 2, i64* %13, align 16
  %14 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 3
  store i64 3, i64* %14, align 8
  %15 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 4
  store i64 4, i64* %15, align 16
  %16 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 5
  store i64 5, i64* %16, align 8
  %17 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 6
  store i64 6, i64* %17, align 16
  %18 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 7
  store i64 7, i64* %18, align 8
  %19 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 8
  store i64 8, i64* %19, align 16
  call void @twy_enc(%struct.twy_ctx* nonnull %1, i64 1, i64* nonnull %10, i64 9, i32 3) #4
  %20 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 0
  %21 = load i64, i64* %20, align 16
  %22 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 1
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 2
  %25 = load i64, i64* %24, align 16
  %26 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.5, i64 0, i64 0), i32 0, i64 %21, i64 %23, i64 %25)
  %27 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 3
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 4
  %30 = load i64, i64* %29, align 16
  %31 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 5
  %32 = load i64, i64* %31, align 8
  %33 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.5, i64 0, i64 0), i32 1, i64 %28, i64 %30, i64 %32)
  %34 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 6
  %35 = load i64, i64* %34, align 16
  %36 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 7
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 8
  %39 = load i64, i64* %38, align 16
  %40 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.5, i64 0, i64 0), i32 2, i64 %35, i64 %37, i64 %39)
  call void @twy_dec(%struct.twy_ctx* nonnull %1, i64 1, i64* nonnull %10, i64 9, i32 2) #4
  %41 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 6
  call void @twy_dec(%struct.twy_ctx* nonnull %1, i64 1, i64* nonnull %41, i64 9, i32 1) #4
  %42 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 0
  %43 = load i64, i64* %42, align 16
  %44 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 1
  %45 = load i64, i64* %44, align 8
  %46 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 2
  %47 = load i64, i64* %46, align 16
  %48 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.6, i64 0, i64 0), i32 0, i64 %43, i64 %45, i64 %47)
  %49 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 3
  %50 = load i64, i64* %49, align 8
  %51 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 4
  %52 = load i64, i64* %51, align 16
  %53 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 5
  %54 = load i64, i64* %53, align 8
  %55 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.6, i64 0, i64 0), i32 1, i64 %50, i64 %52, i64 %54)
  %56 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 6
  %57 = load i64, i64* %56, align 16
  %58 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 7
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds [9 x i64], [9 x i64]* %2, i64 0, i64 8
  %61 = load i64, i64* %60, align 16
  %62 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @.str.6, i64 0, i64 0), i32 2, i64 %57, i64 %59, i64 %61)
  ret i32 0
}

; Function Attrs: nofree norecurse nounwind
define void @mu(i64* %0, i64 %N, i1 %.cond) local_unnamed_addr #3 {
  %shadow = alloca i64, align 8
  %2 = load i64, i64* %0, align 8
  %3 = and i64 %2, 1
  %4 = icmp ne i64 %3, 0
  %in. = and i1 %4, %.cond
  %select.val.26 = zext i1 %in. to i64
  %5 = getelementptr inbounds i64, i64* %0, i64 1
  %6 = icmp sgt i64 %N, 1
  %safe.27 = or i1 %6, %.cond
  %select.ptr.28 = select i1 %safe.27, i64* %5, i64* %shadow
  %7 = load i64, i64* %select.ptr.28, align 8
  %8 = and i64 %7, 1
  %9 = icmp ne i64 %8, 0
  %in.194 = and i1 %9, %.cond
  %select.val.33 = zext i1 %in.194 to i64
  %10 = getelementptr inbounds i64, i64* %0, i64 2
  %11 = icmp sgt i64 %N, 2
  %safe.34 = or i1 %11, %.cond
  %select.ptr.35 = select i1 %safe.34, i64* %10, i64* %shadow
  %12 = load i64, i64* %select.ptr.35, align 8
  %13 = and i64 %12, 1
  %14 = icmp ne i64 %13, 0
  %in.196 = and i1 %14, %.cond
  %select.val.40 = zext i1 %in.196 to i64
  %15 = zext i1 %.cond to i64
  %select.val.41 = lshr i64 %2, %15
  store i64 %select.val.41, i64* %0, align 8
  %16 = load i64, i64* %select.ptr.28, align 8
  %17 = lshr i64 %16, 1
  %18 = load i64, i64* %5, align 8
  %select.val.46 = select i1 %.cond, i64 %17, i64 %18
  store i64 %select.val.46, i64* %select.ptr.28, align 8
  %19 = load i64, i64* %select.ptr.35, align 8
  %20 = lshr i64 %19, 1
  %21 = load i64, i64* %10, align 8
  %select.val.51 = select i1 %.cond, i64 %20, i64 %21
  store i64 %select.val.51, i64* %select.ptr.35, align 8
  %22 = select i1 %in.196, i64 2, i64 0
  %select.val.56 = select i1 %.cond, i64 %22, i64 %select.val.40
  %23 = select i1 %in.194, i64 2, i64 0
  %select.val.61 = select i1 %.cond, i64 %23, i64 %select.val.33
  %24 = select i1 %in., i64 2, i64 0
  %select.val.66 = select i1 %.cond, i64 %24, i64 %select.val.26
  %25 = load i64, i64* %0, align 8
  %26 = and i64 %25, 1
  %27 = icmp ne i64 %26, 0
  %in.198 = and i1 %27, %.cond
  %28 = zext i1 %in.198 to i64
  %select.val.71 = or i64 %select.val.66, %28
  %.val = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val = load i64, i64* %shadow, align 8
  %29 = select i1 %safe.27, i64 %.val, i64 %shadow.0.shadow.0.shadow.val
  %30 = and i64 %29, 1
  %31 = icmp ne i64 %30, 0
  %in.200 = and i1 %31, %.cond
  %32 = zext i1 %in.200 to i64
  %select.val.78 = or i64 %select.val.61, %32
  %.val2428 = load i64, i64* %10, align 8
  %33 = select i1 %safe.34, i64 %.val2428, i64 %shadow.0.shadow.0.shadow.val
  %34 = and i64 %33, 1
  %35 = icmp ne i64 %34, 0
  %in.202 = and i1 %35, %.cond
  %36 = zext i1 %in.202 to i64
  %select.val.85 = or i64 %select.val.56, %36
  %select.val.86 = lshr i64 %25, %15
  store i64 %select.val.86, i64* %0, align 8
  %37 = load i64, i64* %select.ptr.28, align 8
  %38 = lshr i64 %37, 1
  %39 = load i64, i64* %5, align 8
  %select.val.91 = select i1 %.cond, i64 %38, i64 %39
  store i64 %select.val.91, i64* %select.ptr.28, align 8
  %40 = load i64, i64* %select.ptr.35, align 8
  %41 = lshr i64 %40, 1
  %42 = load i64, i64* %10, align 8
  %select.val.96 = select i1 %.cond, i64 %41, i64 %42
  store i64 %select.val.96, i64* %select.ptr.35, align 8
  %select.val.101 = shl nuw nsw i64 %select.val.85, %15
  %select.val.106 = shl nuw nsw i64 %select.val.78, %15
  %select.val.111 = shl nuw nsw i64 %select.val.71, %15
  %43 = load i64, i64* %0, align 8
  %44 = and i64 %43, 1
  %45 = icmp ne i64 %44, 0
  %in.204 = and i1 %45, %.cond
  %46 = zext i1 %in.204 to i64
  %select.val.116 = or i64 %select.val.111, %46
  %.val2430 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2431 = load i64, i64* %shadow, align 8
  %47 = select i1 %safe.27, i64 %.val2430, i64 %shadow.0.shadow.0.shadow.val2431
  %48 = and i64 %47, 1
  %49 = icmp ne i64 %48, 0
  %in.206 = and i1 %49, %.cond
  %50 = zext i1 %in.206 to i64
  %select.val.123 = or i64 %select.val.106, %50
  %.val2432 = load i64, i64* %10, align 8
  %51 = select i1 %safe.34, i64 %.val2432, i64 %shadow.0.shadow.0.shadow.val2431
  %52 = and i64 %51, 1
  %53 = icmp ne i64 %52, 0
  %in.208 = and i1 %53, %.cond
  %54 = zext i1 %in.208 to i64
  %select.val.130 = or i64 %select.val.101, %54
  %select.val.131 = lshr i64 %43, %15
  store i64 %select.val.131, i64* %0, align 8
  %55 = load i64, i64* %select.ptr.28, align 8
  %56 = lshr i64 %55, 1
  %57 = load i64, i64* %5, align 8
  %select.val.136 = select i1 %.cond, i64 %56, i64 %57
  store i64 %select.val.136, i64* %select.ptr.28, align 8
  %58 = load i64, i64* %select.ptr.35, align 8
  %59 = lshr i64 %58, 1
  %60 = load i64, i64* %10, align 8
  %select.val.141 = select i1 %.cond, i64 %59, i64 %60
  store i64 %select.val.141, i64* %select.ptr.35, align 8
  %select.val.146 = shl nuw nsw i64 %select.val.130, %15
  %select.val.151 = shl nuw nsw i64 %select.val.123, %15
  %select.val.156 = shl nuw nsw i64 %select.val.116, %15
  %61 = load i64, i64* %0, align 8
  %62 = and i64 %61, 1
  %63 = icmp ne i64 %62, 0
  %in.210 = and i1 %63, %.cond
  %64 = zext i1 %in.210 to i64
  %select.val.161 = or i64 %select.val.156, %64
  %.val2434 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2435 = load i64, i64* %shadow, align 8
  %65 = select i1 %safe.27, i64 %.val2434, i64 %shadow.0.shadow.0.shadow.val2435
  %66 = and i64 %65, 1
  %67 = icmp ne i64 %66, 0
  %in.212 = and i1 %67, %.cond
  %68 = zext i1 %in.212 to i64
  %select.val.168 = or i64 %select.val.151, %68
  %.val2436 = load i64, i64* %10, align 8
  %69 = select i1 %safe.34, i64 %.val2436, i64 %shadow.0.shadow.0.shadow.val2435
  %70 = and i64 %69, 1
  %71 = icmp ne i64 %70, 0
  %in.214 = and i1 %71, %.cond
  %72 = zext i1 %in.214 to i64
  %select.val.175 = or i64 %select.val.146, %72
  %select.val.176 = lshr i64 %61, %15
  store i64 %select.val.176, i64* %0, align 8
  %73 = load i64, i64* %select.ptr.28, align 8
  %74 = lshr i64 %73, 1
  %75 = load i64, i64* %5, align 8
  %select.val.181 = select i1 %.cond, i64 %74, i64 %75
  store i64 %select.val.181, i64* %select.ptr.28, align 8
  %76 = load i64, i64* %select.ptr.35, align 8
  %77 = lshr i64 %76, 1
  %78 = load i64, i64* %10, align 8
  %select.val.186 = select i1 %.cond, i64 %77, i64 %78
  store i64 %select.val.186, i64* %select.ptr.35, align 8
  %select.val.191 = shl i64 %select.val.175, %15
  %select.val.196 = shl i64 %select.val.168, %15
  %select.val.201 = shl i64 %select.val.161, %15
  %79 = load i64, i64* %0, align 8
  %80 = and i64 %79, 1
  %81 = icmp ne i64 %80, 0
  %in.216 = and i1 %81, %.cond
  %82 = zext i1 %in.216 to i64
  %select.val.206 = or i64 %select.val.201, %82
  %.val2438 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2439 = load i64, i64* %shadow, align 8
  %83 = select i1 %safe.27, i64 %.val2438, i64 %shadow.0.shadow.0.shadow.val2439
  %84 = and i64 %83, 1
  %85 = icmp ne i64 %84, 0
  %in.218 = and i1 %85, %.cond
  %86 = zext i1 %in.218 to i64
  %select.val.213 = or i64 %select.val.196, %86
  %.val2440 = load i64, i64* %10, align 8
  %87 = select i1 %safe.34, i64 %.val2440, i64 %shadow.0.shadow.0.shadow.val2439
  %88 = and i64 %87, 1
  %89 = icmp ne i64 %88, 0
  %in.220 = and i1 %89, %.cond
  %90 = zext i1 %in.220 to i64
  %select.val.220 = or i64 %select.val.191, %90
  %select.val.221 = lshr i64 %79, %15
  store i64 %select.val.221, i64* %0, align 8
  %91 = load i64, i64* %select.ptr.28, align 8
  %92 = lshr i64 %91, 1
  %93 = load i64, i64* %5, align 8
  %select.val.226 = select i1 %.cond, i64 %92, i64 %93
  store i64 %select.val.226, i64* %select.ptr.28, align 8
  %94 = load i64, i64* %select.ptr.35, align 8
  %95 = lshr i64 %94, 1
  %96 = load i64, i64* %10, align 8
  %select.val.231 = select i1 %.cond, i64 %95, i64 %96
  store i64 %select.val.231, i64* %select.ptr.35, align 8
  %select.val.236 = shl i64 %select.val.220, %15
  %select.val.241 = shl i64 %select.val.213, %15
  %select.val.246 = shl i64 %select.val.206, %15
  %97 = load i64, i64* %0, align 8
  %98 = and i64 %97, 1
  %99 = icmp ne i64 %98, 0
  %in.222 = and i1 %99, %.cond
  %100 = zext i1 %in.222 to i64
  %select.val.251 = or i64 %select.val.246, %100
  %.val2442 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2443 = load i64, i64* %shadow, align 8
  %101 = select i1 %safe.27, i64 %.val2442, i64 %shadow.0.shadow.0.shadow.val2443
  %102 = and i64 %101, 1
  %103 = icmp ne i64 %102, 0
  %in.224 = and i1 %103, %.cond
  %104 = zext i1 %in.224 to i64
  %select.val.258 = or i64 %select.val.241, %104
  %.val2444 = load i64, i64* %10, align 8
  %105 = select i1 %safe.34, i64 %.val2444, i64 %shadow.0.shadow.0.shadow.val2443
  %106 = and i64 %105, 1
  %107 = icmp ne i64 %106, 0
  %in.226 = and i1 %107, %.cond
  %108 = zext i1 %in.226 to i64
  %select.val.265 = or i64 %select.val.236, %108
  %select.val.266 = lshr i64 %97, %15
  store i64 %select.val.266, i64* %0, align 8
  %109 = load i64, i64* %select.ptr.28, align 8
  %110 = lshr i64 %109, 1
  %111 = load i64, i64* %5, align 8
  %select.val.271 = select i1 %.cond, i64 %110, i64 %111
  store i64 %select.val.271, i64* %select.ptr.28, align 8
  %112 = load i64, i64* %select.ptr.35, align 8
  %113 = lshr i64 %112, 1
  %114 = load i64, i64* %10, align 8
  %select.val.276 = select i1 %.cond, i64 %113, i64 %114
  store i64 %select.val.276, i64* %select.ptr.35, align 8
  %select.val.281 = shl i64 %select.val.265, %15
  %select.val.286 = shl i64 %select.val.258, %15
  %select.val.291 = shl i64 %select.val.251, %15
  %115 = load i64, i64* %0, align 8
  %116 = and i64 %115, 1
  %117 = icmp ne i64 %116, 0
  %in.228 = and i1 %117, %.cond
  %118 = zext i1 %in.228 to i64
  %select.val.296 = or i64 %select.val.291, %118
  %.val2446 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2447 = load i64, i64* %shadow, align 8
  %119 = select i1 %safe.27, i64 %.val2446, i64 %shadow.0.shadow.0.shadow.val2447
  %120 = and i64 %119, 1
  %121 = icmp ne i64 %120, 0
  %in.230 = and i1 %121, %.cond
  %122 = zext i1 %in.230 to i64
  %select.val.303 = or i64 %select.val.286, %122
  %.val2448 = load i64, i64* %10, align 8
  %123 = select i1 %safe.34, i64 %.val2448, i64 %shadow.0.shadow.0.shadow.val2447
  %124 = and i64 %123, 1
  %125 = icmp ne i64 %124, 0
  %in.232 = and i1 %125, %.cond
  %126 = zext i1 %in.232 to i64
  %select.val.310 = or i64 %select.val.281, %126
  %select.val.311 = lshr i64 %115, %15
  store i64 %select.val.311, i64* %0, align 8
  %127 = load i64, i64* %select.ptr.28, align 8
  %128 = lshr i64 %127, 1
  %129 = load i64, i64* %5, align 8
  %select.val.316 = select i1 %.cond, i64 %128, i64 %129
  store i64 %select.val.316, i64* %select.ptr.28, align 8
  %130 = load i64, i64* %select.ptr.35, align 8
  %131 = lshr i64 %130, 1
  %132 = load i64, i64* %10, align 8
  %select.val.321 = select i1 %.cond, i64 %131, i64 %132
  store i64 %select.val.321, i64* %select.ptr.35, align 8
  %select.val.326 = shl i64 %select.val.310, %15
  %select.val.331 = shl i64 %select.val.303, %15
  %select.val.336 = shl i64 %select.val.296, %15
  %133 = load i64, i64* %0, align 8
  %134 = and i64 %133, 1
  %135 = icmp ne i64 %134, 0
  %in.234 = and i1 %135, %.cond
  %136 = zext i1 %in.234 to i64
  %select.val.341 = or i64 %select.val.336, %136
  %.val2450 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2451 = load i64, i64* %shadow, align 8
  %137 = select i1 %safe.27, i64 %.val2450, i64 %shadow.0.shadow.0.shadow.val2451
  %138 = and i64 %137, 1
  %139 = icmp ne i64 %138, 0
  %in.236 = and i1 %139, %.cond
  %140 = zext i1 %in.236 to i64
  %select.val.348 = or i64 %select.val.331, %140
  %.val2452 = load i64, i64* %10, align 8
  %141 = select i1 %safe.34, i64 %.val2452, i64 %shadow.0.shadow.0.shadow.val2451
  %142 = and i64 %141, 1
  %143 = icmp ne i64 %142, 0
  %in.238 = and i1 %143, %.cond
  %144 = zext i1 %in.238 to i64
  %select.val.355 = or i64 %select.val.326, %144
  %select.val.356 = lshr i64 %133, %15
  store i64 %select.val.356, i64* %0, align 8
  %145 = load i64, i64* %select.ptr.28, align 8
  %146 = lshr i64 %145, 1
  %147 = load i64, i64* %5, align 8
  %select.val.361 = select i1 %.cond, i64 %146, i64 %147
  store i64 %select.val.361, i64* %select.ptr.28, align 8
  %148 = load i64, i64* %select.ptr.35, align 8
  %149 = lshr i64 %148, 1
  %150 = load i64, i64* %10, align 8
  %select.val.366 = select i1 %.cond, i64 %149, i64 %150
  store i64 %select.val.366, i64* %select.ptr.35, align 8
  %select.val.371 = shl i64 %select.val.355, %15
  %select.val.376 = shl i64 %select.val.348, %15
  %select.val.381 = shl i64 %select.val.341, %15
  %151 = load i64, i64* %0, align 8
  %152 = and i64 %151, 1
  %153 = icmp ne i64 %152, 0
  %in.240 = and i1 %153, %.cond
  %154 = zext i1 %in.240 to i64
  %select.val.386 = or i64 %select.val.381, %154
  %.val2454 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2455 = load i64, i64* %shadow, align 8
  %155 = select i1 %safe.27, i64 %.val2454, i64 %shadow.0.shadow.0.shadow.val2455
  %156 = and i64 %155, 1
  %157 = icmp ne i64 %156, 0
  %in.242 = and i1 %157, %.cond
  %158 = zext i1 %in.242 to i64
  %select.val.393 = or i64 %select.val.376, %158
  %.val2456 = load i64, i64* %10, align 8
  %159 = select i1 %safe.34, i64 %.val2456, i64 %shadow.0.shadow.0.shadow.val2455
  %160 = and i64 %159, 1
  %161 = icmp ne i64 %160, 0
  %in.244 = and i1 %161, %.cond
  %162 = zext i1 %in.244 to i64
  %select.val.400 = or i64 %select.val.371, %162
  %select.val.401 = lshr i64 %151, %15
  store i64 %select.val.401, i64* %0, align 8
  %163 = load i64, i64* %select.ptr.28, align 8
  %164 = lshr i64 %163, 1
  %165 = load i64, i64* %5, align 8
  %select.val.406 = select i1 %.cond, i64 %164, i64 %165
  store i64 %select.val.406, i64* %select.ptr.28, align 8
  %166 = load i64, i64* %select.ptr.35, align 8
  %167 = lshr i64 %166, 1
  %168 = load i64, i64* %10, align 8
  %select.val.411 = select i1 %.cond, i64 %167, i64 %168
  store i64 %select.val.411, i64* %select.ptr.35, align 8
  %select.val.416 = shl i64 %select.val.400, %15
  %select.val.421 = shl i64 %select.val.393, %15
  %select.val.426 = shl i64 %select.val.386, %15
  %169 = load i64, i64* %0, align 8
  %170 = and i64 %169, 1
  %171 = icmp ne i64 %170, 0
  %in.246 = and i1 %171, %.cond
  %172 = zext i1 %in.246 to i64
  %select.val.431 = or i64 %select.val.426, %172
  %.val2458 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2459 = load i64, i64* %shadow, align 8
  %173 = select i1 %safe.27, i64 %.val2458, i64 %shadow.0.shadow.0.shadow.val2459
  %174 = and i64 %173, 1
  %175 = icmp ne i64 %174, 0
  %in.248 = and i1 %175, %.cond
  %176 = zext i1 %in.248 to i64
  %select.val.438 = or i64 %select.val.421, %176
  %.val2460 = load i64, i64* %10, align 8
  %177 = select i1 %safe.34, i64 %.val2460, i64 %shadow.0.shadow.0.shadow.val2459
  %178 = and i64 %177, 1
  %179 = icmp ne i64 %178, 0
  %in.250 = and i1 %179, %.cond
  %180 = zext i1 %in.250 to i64
  %select.val.445 = or i64 %select.val.416, %180
  %select.val.446 = lshr i64 %169, %15
  store i64 %select.val.446, i64* %0, align 8
  %181 = load i64, i64* %select.ptr.28, align 8
  %182 = lshr i64 %181, 1
  %183 = load i64, i64* %5, align 8
  %select.val.451 = select i1 %.cond, i64 %182, i64 %183
  store i64 %select.val.451, i64* %select.ptr.28, align 8
  %184 = load i64, i64* %select.ptr.35, align 8
  %185 = lshr i64 %184, 1
  %186 = load i64, i64* %10, align 8
  %select.val.456 = select i1 %.cond, i64 %185, i64 %186
  store i64 %select.val.456, i64* %select.ptr.35, align 8
  %select.val.461 = shl i64 %select.val.445, %15
  %select.val.466 = shl i64 %select.val.438, %15
  %select.val.471 = shl i64 %select.val.431, %15
  %187 = load i64, i64* %0, align 8
  %188 = and i64 %187, 1
  %189 = icmp ne i64 %188, 0
  %in.252 = and i1 %189, %.cond
  %190 = zext i1 %in.252 to i64
  %select.val.476 = or i64 %select.val.471, %190
  %.val2462 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2463 = load i64, i64* %shadow, align 8
  %191 = select i1 %safe.27, i64 %.val2462, i64 %shadow.0.shadow.0.shadow.val2463
  %192 = and i64 %191, 1
  %193 = icmp ne i64 %192, 0
  %in.254 = and i1 %193, %.cond
  %194 = zext i1 %in.254 to i64
  %select.val.483 = or i64 %select.val.466, %194
  %.val2464 = load i64, i64* %10, align 8
  %195 = select i1 %safe.34, i64 %.val2464, i64 %shadow.0.shadow.0.shadow.val2463
  %196 = and i64 %195, 1
  %197 = icmp ne i64 %196, 0
  %in.256 = and i1 %197, %.cond
  %198 = zext i1 %in.256 to i64
  %select.val.490 = or i64 %select.val.461, %198
  %select.val.491 = lshr i64 %187, %15
  store i64 %select.val.491, i64* %0, align 8
  %199 = load i64, i64* %select.ptr.28, align 8
  %200 = lshr i64 %199, 1
  %201 = load i64, i64* %5, align 8
  %select.val.496 = select i1 %.cond, i64 %200, i64 %201
  store i64 %select.val.496, i64* %select.ptr.28, align 8
  %202 = load i64, i64* %select.ptr.35, align 8
  %203 = lshr i64 %202, 1
  %204 = load i64, i64* %10, align 8
  %select.val.501 = select i1 %.cond, i64 %203, i64 %204
  store i64 %select.val.501, i64* %select.ptr.35, align 8
  %select.val.506 = shl i64 %select.val.490, %15
  %select.val.511 = shl i64 %select.val.483, %15
  %select.val.516 = shl i64 %select.val.476, %15
  %205 = load i64, i64* %0, align 8
  %206 = and i64 %205, 1
  %207 = icmp ne i64 %206, 0
  %in.258 = and i1 %207, %.cond
  %208 = zext i1 %in.258 to i64
  %select.val.521 = or i64 %select.val.516, %208
  %.val2466 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2467 = load i64, i64* %shadow, align 8
  %209 = select i1 %safe.27, i64 %.val2466, i64 %shadow.0.shadow.0.shadow.val2467
  %210 = and i64 %209, 1
  %211 = icmp ne i64 %210, 0
  %in.260 = and i1 %211, %.cond
  %212 = zext i1 %in.260 to i64
  %select.val.528 = or i64 %select.val.511, %212
  %.val2468 = load i64, i64* %10, align 8
  %213 = select i1 %safe.34, i64 %.val2468, i64 %shadow.0.shadow.0.shadow.val2467
  %214 = and i64 %213, 1
  %215 = icmp ne i64 %214, 0
  %in.262 = and i1 %215, %.cond
  %216 = zext i1 %in.262 to i64
  %select.val.535 = or i64 %select.val.506, %216
  %select.val.536 = lshr i64 %205, %15
  store i64 %select.val.536, i64* %0, align 8
  %217 = load i64, i64* %select.ptr.28, align 8
  %218 = lshr i64 %217, 1
  %219 = load i64, i64* %5, align 8
  %select.val.541 = select i1 %.cond, i64 %218, i64 %219
  store i64 %select.val.541, i64* %select.ptr.28, align 8
  %220 = load i64, i64* %select.ptr.35, align 8
  %221 = lshr i64 %220, 1
  %222 = load i64, i64* %10, align 8
  %select.val.546 = select i1 %.cond, i64 %221, i64 %222
  store i64 %select.val.546, i64* %select.ptr.35, align 8
  %select.val.551 = shl i64 %select.val.535, %15
  %select.val.556 = shl i64 %select.val.528, %15
  %select.val.561 = shl i64 %select.val.521, %15
  %223 = load i64, i64* %0, align 8
  %224 = and i64 %223, 1
  %225 = icmp ne i64 %224, 0
  %in.264 = and i1 %225, %.cond
  %226 = zext i1 %in.264 to i64
  %select.val.566 = or i64 %select.val.561, %226
  %.val2470 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2471 = load i64, i64* %shadow, align 8
  %227 = select i1 %safe.27, i64 %.val2470, i64 %shadow.0.shadow.0.shadow.val2471
  %228 = and i64 %227, 1
  %229 = icmp ne i64 %228, 0
  %in.266 = and i1 %229, %.cond
  %230 = zext i1 %in.266 to i64
  %select.val.573 = or i64 %select.val.556, %230
  %.val2472 = load i64, i64* %10, align 8
  %231 = select i1 %safe.34, i64 %.val2472, i64 %shadow.0.shadow.0.shadow.val2471
  %232 = and i64 %231, 1
  %233 = icmp ne i64 %232, 0
  %in.268 = and i1 %233, %.cond
  %234 = zext i1 %in.268 to i64
  %select.val.580 = or i64 %select.val.551, %234
  %select.val.581 = lshr i64 %223, %15
  store i64 %select.val.581, i64* %0, align 8
  %235 = load i64, i64* %select.ptr.28, align 8
  %236 = lshr i64 %235, 1
  %237 = load i64, i64* %5, align 8
  %select.val.586 = select i1 %.cond, i64 %236, i64 %237
  store i64 %select.val.586, i64* %select.ptr.28, align 8
  %238 = load i64, i64* %select.ptr.35, align 8
  %239 = lshr i64 %238, 1
  %240 = load i64, i64* %10, align 8
  %select.val.591 = select i1 %.cond, i64 %239, i64 %240
  store i64 %select.val.591, i64* %select.ptr.35, align 8
  %select.val.596 = shl i64 %select.val.580, %15
  %select.val.601 = shl i64 %select.val.573, %15
  %select.val.606 = shl i64 %select.val.566, %15
  %241 = load i64, i64* %0, align 8
  %242 = and i64 %241, 1
  %243 = icmp ne i64 %242, 0
  %in.270 = and i1 %243, %.cond
  %244 = zext i1 %in.270 to i64
  %select.val.611 = or i64 %select.val.606, %244
  %.val2474 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2475 = load i64, i64* %shadow, align 8
  %245 = select i1 %safe.27, i64 %.val2474, i64 %shadow.0.shadow.0.shadow.val2475
  %246 = and i64 %245, 1
  %247 = icmp ne i64 %246, 0
  %in.272 = and i1 %247, %.cond
  %248 = zext i1 %in.272 to i64
  %select.val.618 = or i64 %select.val.601, %248
  %.val2476 = load i64, i64* %10, align 8
  %249 = select i1 %safe.34, i64 %.val2476, i64 %shadow.0.shadow.0.shadow.val2475
  %250 = and i64 %249, 1
  %251 = icmp ne i64 %250, 0
  %in.274 = and i1 %251, %.cond
  %252 = zext i1 %in.274 to i64
  %select.val.625 = or i64 %select.val.596, %252
  %select.val.626 = lshr i64 %241, %15
  store i64 %select.val.626, i64* %0, align 8
  %253 = load i64, i64* %select.ptr.28, align 8
  %254 = lshr i64 %253, 1
  %255 = load i64, i64* %5, align 8
  %select.val.631 = select i1 %.cond, i64 %254, i64 %255
  store i64 %select.val.631, i64* %select.ptr.28, align 8
  %256 = load i64, i64* %select.ptr.35, align 8
  %257 = lshr i64 %256, 1
  %258 = load i64, i64* %10, align 8
  %select.val.636 = select i1 %.cond, i64 %257, i64 %258
  store i64 %select.val.636, i64* %select.ptr.35, align 8
  %select.val.641 = shl i64 %select.val.625, %15
  %select.val.646 = shl i64 %select.val.618, %15
  %select.val.651 = shl i64 %select.val.611, %15
  %259 = load i64, i64* %0, align 8
  %260 = and i64 %259, 1
  %261 = icmp ne i64 %260, 0
  %in.276 = and i1 %261, %.cond
  %262 = zext i1 %in.276 to i64
  %select.val.656 = or i64 %select.val.651, %262
  %.val2478 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2479 = load i64, i64* %shadow, align 8
  %263 = select i1 %safe.27, i64 %.val2478, i64 %shadow.0.shadow.0.shadow.val2479
  %264 = and i64 %263, 1
  %265 = icmp ne i64 %264, 0
  %in.278 = and i1 %265, %.cond
  %266 = zext i1 %in.278 to i64
  %select.val.663 = or i64 %select.val.646, %266
  %.val2480 = load i64, i64* %10, align 8
  %267 = select i1 %safe.34, i64 %.val2480, i64 %shadow.0.shadow.0.shadow.val2479
  %268 = and i64 %267, 1
  %269 = icmp ne i64 %268, 0
  %in.280 = and i1 %269, %.cond
  %270 = zext i1 %in.280 to i64
  %select.val.670 = or i64 %select.val.641, %270
  %select.val.671 = lshr i64 %259, %15
  store i64 %select.val.671, i64* %0, align 8
  %271 = load i64, i64* %select.ptr.28, align 8
  %272 = lshr i64 %271, 1
  %273 = load i64, i64* %5, align 8
  %select.val.676 = select i1 %.cond, i64 %272, i64 %273
  store i64 %select.val.676, i64* %select.ptr.28, align 8
  %274 = load i64, i64* %select.ptr.35, align 8
  %275 = lshr i64 %274, 1
  %276 = load i64, i64* %10, align 8
  %select.val.681 = select i1 %.cond, i64 %275, i64 %276
  store i64 %select.val.681, i64* %select.ptr.35, align 8
  %select.val.686 = shl i64 %select.val.670, %15
  %select.val.691 = shl i64 %select.val.663, %15
  %select.val.696 = shl i64 %select.val.656, %15
  %277 = load i64, i64* %0, align 8
  %278 = and i64 %277, 1
  %279 = icmp ne i64 %278, 0
  %in.282 = and i1 %279, %.cond
  %280 = zext i1 %in.282 to i64
  %select.val.701 = or i64 %select.val.696, %280
  %.val2482 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2483 = load i64, i64* %shadow, align 8
  %281 = select i1 %safe.27, i64 %.val2482, i64 %shadow.0.shadow.0.shadow.val2483
  %282 = and i64 %281, 1
  %283 = icmp ne i64 %282, 0
  %in.284 = and i1 %283, %.cond
  %284 = zext i1 %in.284 to i64
  %select.val.708 = or i64 %select.val.691, %284
  %.val2484 = load i64, i64* %10, align 8
  %285 = select i1 %safe.34, i64 %.val2484, i64 %shadow.0.shadow.0.shadow.val2483
  %286 = and i64 %285, 1
  %287 = icmp ne i64 %286, 0
  %in.286 = and i1 %287, %.cond
  %288 = zext i1 %in.286 to i64
  %select.val.715 = or i64 %select.val.686, %288
  %select.val.716 = lshr i64 %277, %15
  store i64 %select.val.716, i64* %0, align 8
  %289 = load i64, i64* %select.ptr.28, align 8
  %290 = lshr i64 %289, 1
  %291 = load i64, i64* %5, align 8
  %select.val.721 = select i1 %.cond, i64 %290, i64 %291
  store i64 %select.val.721, i64* %select.ptr.28, align 8
  %292 = load i64, i64* %select.ptr.35, align 8
  %293 = lshr i64 %292, 1
  %294 = load i64, i64* %10, align 8
  %select.val.726 = select i1 %.cond, i64 %293, i64 %294
  store i64 %select.val.726, i64* %select.ptr.35, align 8
  %select.val.731 = shl i64 %select.val.715, %15
  %select.val.736 = shl i64 %select.val.708, %15
  %select.val.741 = shl i64 %select.val.701, %15
  %295 = load i64, i64* %0, align 8
  %296 = and i64 %295, 1
  %297 = icmp ne i64 %296, 0
  %in.288 = and i1 %297, %.cond
  %298 = zext i1 %in.288 to i64
  %select.val.746 = or i64 %select.val.741, %298
  %.val2486 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2487 = load i64, i64* %shadow, align 8
  %299 = select i1 %safe.27, i64 %.val2486, i64 %shadow.0.shadow.0.shadow.val2487
  %300 = and i64 %299, 1
  %301 = icmp ne i64 %300, 0
  %in.290 = and i1 %301, %.cond
  %302 = zext i1 %in.290 to i64
  %select.val.753 = or i64 %select.val.736, %302
  %.val2488 = load i64, i64* %10, align 8
  %303 = select i1 %safe.34, i64 %.val2488, i64 %shadow.0.shadow.0.shadow.val2487
  %304 = and i64 %303, 1
  %305 = icmp ne i64 %304, 0
  %in.292 = and i1 %305, %.cond
  %306 = zext i1 %in.292 to i64
  %select.val.760 = or i64 %select.val.731, %306
  %select.val.761 = lshr i64 %295, %15
  store i64 %select.val.761, i64* %0, align 8
  %307 = load i64, i64* %select.ptr.28, align 8
  %308 = lshr i64 %307, 1
  %309 = load i64, i64* %5, align 8
  %select.val.766 = select i1 %.cond, i64 %308, i64 %309
  store i64 %select.val.766, i64* %select.ptr.28, align 8
  %310 = load i64, i64* %select.ptr.35, align 8
  %311 = lshr i64 %310, 1
  %312 = load i64, i64* %10, align 8
  %select.val.771 = select i1 %.cond, i64 %311, i64 %312
  store i64 %select.val.771, i64* %select.ptr.35, align 8
  %select.val.776 = shl i64 %select.val.760, %15
  %select.val.781 = shl i64 %select.val.753, %15
  %select.val.786 = shl i64 %select.val.746, %15
  %313 = load i64, i64* %0, align 8
  %314 = and i64 %313, 1
  %315 = icmp ne i64 %314, 0
  %in.294 = and i1 %315, %.cond
  %316 = zext i1 %in.294 to i64
  %select.val.791 = or i64 %select.val.786, %316
  %.val2490 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2491 = load i64, i64* %shadow, align 8
  %317 = select i1 %safe.27, i64 %.val2490, i64 %shadow.0.shadow.0.shadow.val2491
  %318 = and i64 %317, 1
  %319 = icmp ne i64 %318, 0
  %in.296 = and i1 %319, %.cond
  %320 = zext i1 %in.296 to i64
  %select.val.798 = or i64 %select.val.781, %320
  %.val2492 = load i64, i64* %10, align 8
  %321 = select i1 %safe.34, i64 %.val2492, i64 %shadow.0.shadow.0.shadow.val2491
  %322 = and i64 %321, 1
  %323 = icmp ne i64 %322, 0
  %in.298 = and i1 %323, %.cond
  %324 = zext i1 %in.298 to i64
  %select.val.805 = or i64 %select.val.776, %324
  %select.val.806 = lshr i64 %313, %15
  store i64 %select.val.806, i64* %0, align 8
  %325 = load i64, i64* %select.ptr.28, align 8
  %326 = lshr i64 %325, 1
  %327 = load i64, i64* %5, align 8
  %select.val.811 = select i1 %.cond, i64 %326, i64 %327
  store i64 %select.val.811, i64* %select.ptr.28, align 8
  %328 = load i64, i64* %select.ptr.35, align 8
  %329 = lshr i64 %328, 1
  %330 = load i64, i64* %10, align 8
  %select.val.816 = select i1 %.cond, i64 %329, i64 %330
  store i64 %select.val.816, i64* %select.ptr.35, align 8
  %select.val.821 = shl i64 %select.val.805, %15
  %select.val.826 = shl i64 %select.val.798, %15
  %select.val.831 = shl i64 %select.val.791, %15
  %331 = load i64, i64* %0, align 8
  %332 = and i64 %331, 1
  %333 = icmp ne i64 %332, 0
  %in.300 = and i1 %333, %.cond
  %334 = zext i1 %in.300 to i64
  %select.val.836 = or i64 %select.val.831, %334
  %.val2494 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2495 = load i64, i64* %shadow, align 8
  %335 = select i1 %safe.27, i64 %.val2494, i64 %shadow.0.shadow.0.shadow.val2495
  %336 = and i64 %335, 1
  %337 = icmp ne i64 %336, 0
  %in.302 = and i1 %337, %.cond
  %338 = zext i1 %in.302 to i64
  %select.val.843 = or i64 %select.val.826, %338
  %.val2496 = load i64, i64* %10, align 8
  %339 = select i1 %safe.34, i64 %.val2496, i64 %shadow.0.shadow.0.shadow.val2495
  %340 = and i64 %339, 1
  %341 = icmp ne i64 %340, 0
  %in.304 = and i1 %341, %.cond
  %342 = zext i1 %in.304 to i64
  %select.val.850 = or i64 %select.val.821, %342
  %select.val.851 = lshr i64 %331, %15
  store i64 %select.val.851, i64* %0, align 8
  %343 = load i64, i64* %select.ptr.28, align 8
  %344 = lshr i64 %343, 1
  %345 = load i64, i64* %5, align 8
  %select.val.856 = select i1 %.cond, i64 %344, i64 %345
  store i64 %select.val.856, i64* %select.ptr.28, align 8
  %346 = load i64, i64* %select.ptr.35, align 8
  %347 = lshr i64 %346, 1
  %348 = load i64, i64* %10, align 8
  %select.val.861 = select i1 %.cond, i64 %347, i64 %348
  store i64 %select.val.861, i64* %select.ptr.35, align 8
  %select.val.866 = shl i64 %select.val.850, %15
  %select.val.871 = shl i64 %select.val.843, %15
  %select.val.876 = shl i64 %select.val.836, %15
  %349 = load i64, i64* %0, align 8
  %350 = and i64 %349, 1
  %351 = icmp ne i64 %350, 0
  %in.306 = and i1 %351, %.cond
  %352 = zext i1 %in.306 to i64
  %select.val.881 = or i64 %select.val.876, %352
  %.val2498 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2499 = load i64, i64* %shadow, align 8
  %353 = select i1 %safe.27, i64 %.val2498, i64 %shadow.0.shadow.0.shadow.val2499
  %354 = and i64 %353, 1
  %355 = icmp ne i64 %354, 0
  %in.308 = and i1 %355, %.cond
  %356 = zext i1 %in.308 to i64
  %select.val.888 = or i64 %select.val.871, %356
  %.val2500 = load i64, i64* %10, align 8
  %357 = select i1 %safe.34, i64 %.val2500, i64 %shadow.0.shadow.0.shadow.val2499
  %358 = and i64 %357, 1
  %359 = icmp ne i64 %358, 0
  %in.310 = and i1 %359, %.cond
  %360 = zext i1 %in.310 to i64
  %select.val.895 = or i64 %select.val.866, %360
  %select.val.896 = lshr i64 %349, %15
  store i64 %select.val.896, i64* %0, align 8
  %361 = load i64, i64* %select.ptr.28, align 8
  %362 = lshr i64 %361, 1
  %363 = load i64, i64* %5, align 8
  %select.val.901 = select i1 %.cond, i64 %362, i64 %363
  store i64 %select.val.901, i64* %select.ptr.28, align 8
  %364 = load i64, i64* %select.ptr.35, align 8
  %365 = lshr i64 %364, 1
  %366 = load i64, i64* %10, align 8
  %select.val.906 = select i1 %.cond, i64 %365, i64 %366
  store i64 %select.val.906, i64* %select.ptr.35, align 8
  %select.val.911 = shl i64 %select.val.895, %15
  %select.val.916 = shl i64 %select.val.888, %15
  %select.val.921 = shl i64 %select.val.881, %15
  %367 = load i64, i64* %0, align 8
  %368 = and i64 %367, 1
  %369 = icmp ne i64 %368, 0
  %in.312 = and i1 %369, %.cond
  %370 = zext i1 %in.312 to i64
  %select.val.926 = or i64 %select.val.921, %370
  %.val2502 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2503 = load i64, i64* %shadow, align 8
  %371 = select i1 %safe.27, i64 %.val2502, i64 %shadow.0.shadow.0.shadow.val2503
  %372 = and i64 %371, 1
  %373 = icmp ne i64 %372, 0
  %in.314 = and i1 %373, %.cond
  %374 = zext i1 %in.314 to i64
  %select.val.933 = or i64 %select.val.916, %374
  %.val2504 = load i64, i64* %10, align 8
  %375 = select i1 %safe.34, i64 %.val2504, i64 %shadow.0.shadow.0.shadow.val2503
  %376 = and i64 %375, 1
  %377 = icmp ne i64 %376, 0
  %in.316 = and i1 %377, %.cond
  %378 = zext i1 %in.316 to i64
  %select.val.940 = or i64 %select.val.911, %378
  %select.val.941 = lshr i64 %367, %15
  store i64 %select.val.941, i64* %0, align 8
  %379 = load i64, i64* %select.ptr.28, align 8
  %380 = lshr i64 %379, 1
  %381 = load i64, i64* %5, align 8
  %select.val.946 = select i1 %.cond, i64 %380, i64 %381
  store i64 %select.val.946, i64* %select.ptr.28, align 8
  %382 = load i64, i64* %select.ptr.35, align 8
  %383 = lshr i64 %382, 1
  %384 = load i64, i64* %10, align 8
  %select.val.951 = select i1 %.cond, i64 %383, i64 %384
  store i64 %select.val.951, i64* %select.ptr.35, align 8
  %select.val.956 = shl i64 %select.val.940, %15
  %select.val.961 = shl i64 %select.val.933, %15
  %select.val.966 = shl i64 %select.val.926, %15
  %385 = load i64, i64* %0, align 8
  %386 = and i64 %385, 1
  %387 = icmp ne i64 %386, 0
  %in.318 = and i1 %387, %.cond
  %388 = zext i1 %in.318 to i64
  %select.val.971 = or i64 %select.val.966, %388
  %.val2506 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2507 = load i64, i64* %shadow, align 8
  %389 = select i1 %safe.27, i64 %.val2506, i64 %shadow.0.shadow.0.shadow.val2507
  %390 = and i64 %389, 1
  %391 = icmp ne i64 %390, 0
  %in.320 = and i1 %391, %.cond
  %392 = zext i1 %in.320 to i64
  %select.val.978 = or i64 %select.val.961, %392
  %.val2508 = load i64, i64* %10, align 8
  %393 = select i1 %safe.34, i64 %.val2508, i64 %shadow.0.shadow.0.shadow.val2507
  %394 = and i64 %393, 1
  %395 = icmp ne i64 %394, 0
  %in.322 = and i1 %395, %.cond
  %396 = zext i1 %in.322 to i64
  %select.val.985 = or i64 %select.val.956, %396
  %select.val.986 = lshr i64 %385, %15
  store i64 %select.val.986, i64* %0, align 8
  %397 = load i64, i64* %select.ptr.28, align 8
  %398 = lshr i64 %397, 1
  %399 = load i64, i64* %5, align 8
  %select.val.991 = select i1 %.cond, i64 %398, i64 %399
  store i64 %select.val.991, i64* %select.ptr.28, align 8
  %400 = load i64, i64* %select.ptr.35, align 8
  %401 = lshr i64 %400, 1
  %402 = load i64, i64* %10, align 8
  %select.val.996 = select i1 %.cond, i64 %401, i64 %402
  store i64 %select.val.996, i64* %select.ptr.35, align 8
  %select.val.1001 = shl i64 %select.val.985, %15
  %select.val.1006 = shl i64 %select.val.978, %15
  %select.val.1011 = shl i64 %select.val.971, %15
  %403 = load i64, i64* %0, align 8
  %404 = and i64 %403, 1
  %405 = icmp ne i64 %404, 0
  %in.324 = and i1 %405, %.cond
  %406 = zext i1 %in.324 to i64
  %select.val.1016 = or i64 %select.val.1011, %406
  %.val2510 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2511 = load i64, i64* %shadow, align 8
  %407 = select i1 %safe.27, i64 %.val2510, i64 %shadow.0.shadow.0.shadow.val2511
  %408 = and i64 %407, 1
  %409 = icmp ne i64 %408, 0
  %in.326 = and i1 %409, %.cond
  %410 = zext i1 %in.326 to i64
  %select.val.1023 = or i64 %select.val.1006, %410
  %.val2512 = load i64, i64* %10, align 8
  %411 = select i1 %safe.34, i64 %.val2512, i64 %shadow.0.shadow.0.shadow.val2511
  %412 = and i64 %411, 1
  %413 = icmp ne i64 %412, 0
  %in.328 = and i1 %413, %.cond
  %414 = zext i1 %in.328 to i64
  %select.val.1030 = or i64 %select.val.1001, %414
  %select.val.1031 = lshr i64 %403, %15
  store i64 %select.val.1031, i64* %0, align 8
  %415 = load i64, i64* %select.ptr.28, align 8
  %416 = lshr i64 %415, 1
  %417 = load i64, i64* %5, align 8
  %select.val.1036 = select i1 %.cond, i64 %416, i64 %417
  store i64 %select.val.1036, i64* %select.ptr.28, align 8
  %418 = load i64, i64* %select.ptr.35, align 8
  %419 = lshr i64 %418, 1
  %420 = load i64, i64* %10, align 8
  %select.val.1041 = select i1 %.cond, i64 %419, i64 %420
  store i64 %select.val.1041, i64* %select.ptr.35, align 8
  %select.val.1046 = shl i64 %select.val.1030, %15
  %select.val.1051 = shl i64 %select.val.1023, %15
  %select.val.1056 = shl i64 %select.val.1016, %15
  %421 = load i64, i64* %0, align 8
  %422 = and i64 %421, 1
  %423 = icmp ne i64 %422, 0
  %in.330 = and i1 %423, %.cond
  %424 = zext i1 %in.330 to i64
  %select.val.1061 = or i64 %select.val.1056, %424
  %.val2514 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2515 = load i64, i64* %shadow, align 8
  %425 = select i1 %safe.27, i64 %.val2514, i64 %shadow.0.shadow.0.shadow.val2515
  %426 = and i64 %425, 1
  %427 = icmp ne i64 %426, 0
  %in.332 = and i1 %427, %.cond
  %428 = zext i1 %in.332 to i64
  %select.val.1068 = or i64 %select.val.1051, %428
  %.val2516 = load i64, i64* %10, align 8
  %429 = select i1 %safe.34, i64 %.val2516, i64 %shadow.0.shadow.0.shadow.val2515
  %430 = and i64 %429, 1
  %431 = icmp ne i64 %430, 0
  %in.334 = and i1 %431, %.cond
  %432 = zext i1 %in.334 to i64
  %select.val.1075 = or i64 %select.val.1046, %432
  %select.val.1076 = lshr i64 %421, %15
  store i64 %select.val.1076, i64* %0, align 8
  %433 = load i64, i64* %select.ptr.28, align 8
  %434 = lshr i64 %433, 1
  %435 = load i64, i64* %5, align 8
  %select.val.1081 = select i1 %.cond, i64 %434, i64 %435
  store i64 %select.val.1081, i64* %select.ptr.28, align 8
  %436 = load i64, i64* %select.ptr.35, align 8
  %437 = lshr i64 %436, 1
  %438 = load i64, i64* %10, align 8
  %select.val.1086 = select i1 %.cond, i64 %437, i64 %438
  store i64 %select.val.1086, i64* %select.ptr.35, align 8
  %select.val.1091 = shl i64 %select.val.1075, %15
  %select.val.1096 = shl i64 %select.val.1068, %15
  %select.val.1101 = shl i64 %select.val.1061, %15
  %439 = load i64, i64* %0, align 8
  %440 = and i64 %439, 1
  %441 = icmp ne i64 %440, 0
  %in.336 = and i1 %441, %.cond
  %442 = zext i1 %in.336 to i64
  %select.val.1106 = or i64 %select.val.1101, %442
  %.val2518 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2519 = load i64, i64* %shadow, align 8
  %443 = select i1 %safe.27, i64 %.val2518, i64 %shadow.0.shadow.0.shadow.val2519
  %444 = and i64 %443, 1
  %445 = icmp ne i64 %444, 0
  %in.338 = and i1 %445, %.cond
  %446 = zext i1 %in.338 to i64
  %select.val.1113 = or i64 %select.val.1096, %446
  %.val2520 = load i64, i64* %10, align 8
  %447 = select i1 %safe.34, i64 %.val2520, i64 %shadow.0.shadow.0.shadow.val2519
  %448 = and i64 %447, 1
  %449 = icmp ne i64 %448, 0
  %in.340 = and i1 %449, %.cond
  %450 = zext i1 %in.340 to i64
  %select.val.1120 = or i64 %select.val.1091, %450
  %select.val.1121 = lshr i64 %439, %15
  store i64 %select.val.1121, i64* %0, align 8
  %451 = load i64, i64* %select.ptr.28, align 8
  %452 = lshr i64 %451, 1
  %453 = load i64, i64* %5, align 8
  %select.val.1126 = select i1 %.cond, i64 %452, i64 %453
  store i64 %select.val.1126, i64* %select.ptr.28, align 8
  %454 = load i64, i64* %select.ptr.35, align 8
  %455 = lshr i64 %454, 1
  %456 = load i64, i64* %10, align 8
  %select.val.1131 = select i1 %.cond, i64 %455, i64 %456
  store i64 %select.val.1131, i64* %select.ptr.35, align 8
  %select.val.1136 = shl i64 %select.val.1120, %15
  %select.val.1141 = shl i64 %select.val.1113, %15
  %select.val.1146 = shl i64 %select.val.1106, %15
  %457 = load i64, i64* %0, align 8
  %458 = and i64 %457, 1
  %459 = icmp ne i64 %458, 0
  %in.342 = and i1 %459, %.cond
  %460 = zext i1 %in.342 to i64
  %select.val.1151 = or i64 %select.val.1146, %460
  %.val2522 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2523 = load i64, i64* %shadow, align 8
  %461 = select i1 %safe.27, i64 %.val2522, i64 %shadow.0.shadow.0.shadow.val2523
  %462 = and i64 %461, 1
  %463 = icmp ne i64 %462, 0
  %in.344 = and i1 %463, %.cond
  %464 = zext i1 %in.344 to i64
  %select.val.1158 = or i64 %select.val.1141, %464
  %.val2524 = load i64, i64* %10, align 8
  %465 = select i1 %safe.34, i64 %.val2524, i64 %shadow.0.shadow.0.shadow.val2523
  %466 = and i64 %465, 1
  %467 = icmp ne i64 %466, 0
  %in.346 = and i1 %467, %.cond
  %468 = zext i1 %in.346 to i64
  %select.val.1165 = or i64 %select.val.1136, %468
  %select.val.1166 = lshr i64 %457, %15
  store i64 %select.val.1166, i64* %0, align 8
  %469 = load i64, i64* %select.ptr.28, align 8
  %470 = lshr i64 %469, 1
  %471 = load i64, i64* %5, align 8
  %select.val.1171 = select i1 %.cond, i64 %470, i64 %471
  store i64 %select.val.1171, i64* %select.ptr.28, align 8
  %472 = load i64, i64* %select.ptr.35, align 8
  %473 = lshr i64 %472, 1
  %474 = load i64, i64* %10, align 8
  %select.val.1176 = select i1 %.cond, i64 %473, i64 %474
  store i64 %select.val.1176, i64* %select.ptr.35, align 8
  %select.val.1181 = shl i64 %select.val.1165, %15
  %select.val.1186 = shl i64 %select.val.1158, %15
  %select.val.1191 = shl i64 %select.val.1151, %15
  %475 = load i64, i64* %0, align 8
  %476 = and i64 %475, 1
  %477 = icmp ne i64 %476, 0
  %in.348 = and i1 %477, %.cond
  %478 = zext i1 %in.348 to i64
  %select.val.1196 = or i64 %select.val.1191, %478
  %.val2526 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2527 = load i64, i64* %shadow, align 8
  %479 = select i1 %safe.27, i64 %.val2526, i64 %shadow.0.shadow.0.shadow.val2527
  %480 = and i64 %479, 1
  %481 = icmp ne i64 %480, 0
  %in.350 = and i1 %481, %.cond
  %482 = zext i1 %in.350 to i64
  %select.val.1203 = or i64 %select.val.1186, %482
  %.val2528 = load i64, i64* %10, align 8
  %483 = select i1 %safe.34, i64 %.val2528, i64 %shadow.0.shadow.0.shadow.val2527
  %484 = and i64 %483, 1
  %485 = icmp ne i64 %484, 0
  %in.352 = and i1 %485, %.cond
  %486 = zext i1 %in.352 to i64
  %select.val.1210 = or i64 %select.val.1181, %486
  %select.val.1211 = lshr i64 %475, %15
  store i64 %select.val.1211, i64* %0, align 8
  %487 = load i64, i64* %select.ptr.28, align 8
  %488 = lshr i64 %487, 1
  %489 = load i64, i64* %5, align 8
  %select.val.1216 = select i1 %.cond, i64 %488, i64 %489
  store i64 %select.val.1216, i64* %select.ptr.28, align 8
  %490 = load i64, i64* %select.ptr.35, align 8
  %491 = lshr i64 %490, 1
  %492 = load i64, i64* %10, align 8
  %select.val.1221 = select i1 %.cond, i64 %491, i64 %492
  store i64 %select.val.1221, i64* %select.ptr.35, align 8
  %select.val.1226 = shl i64 %select.val.1210, %15
  %select.val.1231 = shl i64 %select.val.1203, %15
  %select.val.1236 = shl i64 %select.val.1196, %15
  %493 = load i64, i64* %0, align 8
  %494 = and i64 %493, 1
  %495 = icmp ne i64 %494, 0
  %in.354 = and i1 %495, %.cond
  %496 = zext i1 %in.354 to i64
  %select.val.1241 = or i64 %select.val.1236, %496
  %.val2530 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2531 = load i64, i64* %shadow, align 8
  %497 = select i1 %safe.27, i64 %.val2530, i64 %shadow.0.shadow.0.shadow.val2531
  %498 = and i64 %497, 1
  %499 = icmp ne i64 %498, 0
  %in.356 = and i1 %499, %.cond
  %500 = zext i1 %in.356 to i64
  %select.val.1248 = or i64 %select.val.1231, %500
  %.val2532 = load i64, i64* %10, align 8
  %501 = select i1 %safe.34, i64 %.val2532, i64 %shadow.0.shadow.0.shadow.val2531
  %502 = and i64 %501, 1
  %503 = icmp ne i64 %502, 0
  %in.358 = and i1 %503, %.cond
  %504 = zext i1 %in.358 to i64
  %select.val.1255 = or i64 %select.val.1226, %504
  %select.val.1256 = lshr i64 %493, %15
  store i64 %select.val.1256, i64* %0, align 8
  %505 = load i64, i64* %select.ptr.28, align 8
  %506 = lshr i64 %505, 1
  %507 = load i64, i64* %5, align 8
  %select.val.1261 = select i1 %.cond, i64 %506, i64 %507
  store i64 %select.val.1261, i64* %select.ptr.28, align 8
  %508 = load i64, i64* %select.ptr.35, align 8
  %509 = lshr i64 %508, 1
  %510 = load i64, i64* %10, align 8
  %select.val.1266 = select i1 %.cond, i64 %509, i64 %510
  store i64 %select.val.1266, i64* %select.ptr.35, align 8
  %select.val.1271 = shl i64 %select.val.1255, %15
  %select.val.1276 = shl i64 %select.val.1248, %15
  %select.val.1281 = shl i64 %select.val.1241, %15
  %511 = load i64, i64* %0, align 8
  %512 = and i64 %511, 1
  %513 = icmp ne i64 %512, 0
  %in.360 = and i1 %513, %.cond
  %514 = zext i1 %in.360 to i64
  %select.val.1286 = or i64 %select.val.1281, %514
  %.val2534 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2535 = load i64, i64* %shadow, align 8
  %515 = select i1 %safe.27, i64 %.val2534, i64 %shadow.0.shadow.0.shadow.val2535
  %516 = and i64 %515, 1
  %517 = icmp ne i64 %516, 0
  %in.362 = and i1 %517, %.cond
  %518 = zext i1 %in.362 to i64
  %select.val.1293 = or i64 %select.val.1276, %518
  %.val2536 = load i64, i64* %10, align 8
  %519 = select i1 %safe.34, i64 %.val2536, i64 %shadow.0.shadow.0.shadow.val2535
  %520 = and i64 %519, 1
  %521 = icmp ne i64 %520, 0
  %in.364 = and i1 %521, %.cond
  %522 = zext i1 %in.364 to i64
  %select.val.1300 = or i64 %select.val.1271, %522
  %select.val.1301 = lshr i64 %511, %15
  store i64 %select.val.1301, i64* %0, align 8
  %523 = load i64, i64* %select.ptr.28, align 8
  %524 = lshr i64 %523, 1
  %525 = load i64, i64* %5, align 8
  %select.val.1306 = select i1 %.cond, i64 %524, i64 %525
  store i64 %select.val.1306, i64* %select.ptr.28, align 8
  %526 = load i64, i64* %select.ptr.35, align 8
  %527 = lshr i64 %526, 1
  %528 = load i64, i64* %10, align 8
  %select.val.1311 = select i1 %.cond, i64 %527, i64 %528
  store i64 %select.val.1311, i64* %select.ptr.35, align 8
  %select.val.1316 = shl i64 %select.val.1300, %15
  %select.val.1321 = shl i64 %select.val.1293, %15
  %select.val.1326 = shl i64 %select.val.1286, %15
  %529 = load i64, i64* %0, align 8
  %530 = and i64 %529, 1
  %531 = icmp ne i64 %530, 0
  %in.366 = and i1 %531, %.cond
  %532 = zext i1 %in.366 to i64
  %select.val.1331 = or i64 %select.val.1326, %532
  %.val2538 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2539 = load i64, i64* %shadow, align 8
  %533 = select i1 %safe.27, i64 %.val2538, i64 %shadow.0.shadow.0.shadow.val2539
  %534 = and i64 %533, 1
  %535 = icmp ne i64 %534, 0
  %in.368 = and i1 %535, %.cond
  %536 = zext i1 %in.368 to i64
  %select.val.1338 = or i64 %select.val.1321, %536
  %.val2540 = load i64, i64* %10, align 8
  %537 = select i1 %safe.34, i64 %.val2540, i64 %shadow.0.shadow.0.shadow.val2539
  %538 = and i64 %537, 1
  %539 = icmp ne i64 %538, 0
  %in.370 = and i1 %539, %.cond
  %540 = zext i1 %in.370 to i64
  %select.val.1345 = or i64 %select.val.1316, %540
  %select.val.1346 = lshr i64 %529, %15
  store i64 %select.val.1346, i64* %0, align 8
  %541 = load i64, i64* %select.ptr.28, align 8
  %542 = lshr i64 %541, 1
  %543 = load i64, i64* %5, align 8
  %select.val.1351 = select i1 %.cond, i64 %542, i64 %543
  store i64 %select.val.1351, i64* %select.ptr.28, align 8
  %544 = load i64, i64* %select.ptr.35, align 8
  %545 = lshr i64 %544, 1
  %546 = load i64, i64* %10, align 8
  %select.val.1356 = select i1 %.cond, i64 %545, i64 %546
  store i64 %select.val.1356, i64* %select.ptr.35, align 8
  %select.val.1361 = shl i64 %select.val.1345, %15
  %select.val.1366 = shl i64 %select.val.1338, %15
  %select.val.1371 = shl i64 %select.val.1331, %15
  %547 = load i64, i64* %0, align 8
  %548 = and i64 %547, 1
  %549 = icmp ne i64 %548, 0
  %in.372 = and i1 %549, %.cond
  %550 = zext i1 %in.372 to i64
  %select.val.1376 = or i64 %select.val.1371, %550
  %.val2542 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2543 = load i64, i64* %shadow, align 8
  %551 = select i1 %safe.27, i64 %.val2542, i64 %shadow.0.shadow.0.shadow.val2543
  %552 = and i64 %551, 1
  %553 = icmp ne i64 %552, 0
  %in.374 = and i1 %553, %.cond
  %554 = zext i1 %in.374 to i64
  %select.val.1383 = or i64 %select.val.1366, %554
  %.val2544 = load i64, i64* %10, align 8
  %555 = select i1 %safe.34, i64 %.val2544, i64 %shadow.0.shadow.0.shadow.val2543
  %556 = and i64 %555, 1
  %557 = icmp ne i64 %556, 0
  %in.376 = and i1 %557, %.cond
  %558 = zext i1 %in.376 to i64
  %select.val.1390 = or i64 %select.val.1361, %558
  %select.val.1391 = lshr i64 %547, %15
  store i64 %select.val.1391, i64* %0, align 8
  %559 = load i64, i64* %select.ptr.28, align 8
  %560 = lshr i64 %559, 1
  %561 = load i64, i64* %5, align 8
  %select.val.1396 = select i1 %.cond, i64 %560, i64 %561
  store i64 %select.val.1396, i64* %select.ptr.28, align 8
  %562 = load i64, i64* %select.ptr.35, align 8
  %563 = lshr i64 %562, 1
  %564 = load i64, i64* %10, align 8
  %select.val.1401 = select i1 %.cond, i64 %563, i64 %564
  store i64 %select.val.1401, i64* %select.ptr.35, align 8
  %select.val.1406 = shl i64 %select.val.1390, %15
  %select.val.1411 = shl i64 %select.val.1383, %15
  %select.val.1416 = shl i64 %select.val.1376, %15
  %565 = load i64, i64* %0, align 8
  %566 = and i64 %565, 1
  %567 = icmp ne i64 %566, 0
  %in.378 = and i1 %567, %.cond
  %568 = zext i1 %in.378 to i64
  %select.val.1421 = or i64 %select.val.1416, %568
  %.val2546 = load i64, i64* %5, align 8
  %shadow.0.shadow.0.shadow.val2547 = load i64, i64* %shadow, align 8
  %569 = select i1 %safe.27, i64 %.val2546, i64 %shadow.0.shadow.0.shadow.val2547
  %570 = and i64 %569, 1
  %571 = icmp ne i64 %570, 0
  %in.380 = and i1 %571, %.cond
  %572 = zext i1 %in.380 to i64
  %select.val.1428 = or i64 %select.val.1411, %572
  %.val2548 = load i64, i64* %10, align 8
  %573 = select i1 %safe.34, i64 %.val2548, i64 %shadow.0.shadow.0.shadow.val2547
  %574 = and i64 %573, 1
  %575 = icmp ne i64 %574, 0
  %in.382 = and i1 %575, %.cond
  %576 = zext i1 %in.382 to i64
  %select.val.1435 = or i64 %select.val.1406, %576
  %select.val.1436 = lshr i64 %565, %15
  store i64 %select.val.1436, i64* %0, align 8
  %577 = load i64, i64* %select.ptr.28, align 8
  %578 = lshr i64 %577, 1
  %579 = load i64, i64* %5, align 8
  %select.val.1441 = select i1 %.cond, i64 %578, i64 %579
  store i64 %select.val.1441, i64* %select.ptr.28, align 8
  %580 = load i64, i64* %select.ptr.35, align 8
  %581 = lshr i64 %580, 1
  %582 = load i64, i64* %10, align 8
  %select.val.1446 = select i1 %.cond, i64 %581, i64 %582
  store i64 %select.val.1446, i64* %select.ptr.35, align 8
  %583 = load i64, i64* %0, align 8
  %select.val.1449 = select i1 %.cond, i64 %select.val.1435, i64 %583
  store i64 %select.val.1449, i64* %0, align 8
  %584 = load i64, i64* %5, align 8
  %select.val.1454 = select i1 %.cond, i64 %select.val.1428, i64 %584
  store i64 %select.val.1454, i64* %select.ptr.28, align 8
  %585 = load i64, i64* %10, align 8
  %select.val.1459 = select i1 %.cond, i64 %select.val.1421, i64 %585
  store i64 %select.val.1459, i64* %select.ptr.35, align 8
  ret void
}

; Function Attrs: nofree norecurse nounwind
define void @gamma_(i64* nocapture %0, i64 %N, i1 %.cond) local_unnamed_addr #3 {
  %shadow = alloca i64, align 8
  %2 = icmp sgt i64 %N, 0
  %safe. = or i1 %2, %.cond
  %select.ptr. = select i1 %safe., i64* %0, i64* %shadow
  %3 = load i64, i64* %select.ptr., align 8
  %4 = getelementptr inbounds i64, i64* %0, i64 1
  %5 = icmp sgt i64 %N, 1
  %safe.1 = or i1 %5, %.cond
  %select.ptr.2 = select i1 %safe.1, i64* %4, i64* %shadow
  %6 = load i64, i64* %select.ptr.2, align 8
  %7 = getelementptr inbounds i64, i64* %0, i64 2
  %8 = icmp sgt i64 %N, 2
  %safe.3 = or i1 %8, %.cond
  %select.ptr.4 = select i1 %safe.3, i64* %7, i64* %shadow
  %9 = load i64, i64* %select.ptr.4, align 8
  %10 = xor i64 %9, -1
  %11 = or i64 %6, %10
  %12 = xor i64 %11, %3
  %13 = xor i64 %3, -1
  %14 = or i64 %9, %13
  %15 = xor i64 %14, %6
  %16 = xor i64 %6, -1
  %17 = or i64 %3, %16
  %18 = xor i64 %9, %17
  %19 = load i64, i64* %0, align 8
  %select.val.29 = select i1 %.cond, i64 %12, i64 %19
  store i64 %select.val.29, i64* %select.ptr., align 8
  %20 = load i64, i64* %4, align 8
  %select.val.34 = select i1 %.cond, i64 %15, i64 %20
  store i64 %select.val.34, i64* %select.ptr.2, align 8
  %21 = load i64, i64* %7, align 8
  %select.val.39 = select i1 %.cond, i64 %18, i64 %21
  store i64 %select.val.39, i64* %select.ptr.4, align 8
  ret void
}

; Function Attrs: nofree norecurse nounwind
define void @theta(i64* nocapture %0, i64 %N, i1 %.cond) local_unnamed_addr #3 {
  %shadow = alloca i64, align 8
  %2 = icmp sgt i64 %N, 0
  %safe. = or i1 %2, %.cond
  %select.ptr. = select i1 %safe., i64* %0, i64* %shadow
  %3 = load i64, i64* %select.ptr., align 8
  %4 = lshr i64 %3, 16
  %5 = xor i64 %4, %3
  %6 = getelementptr inbounds i64, i64* %0, i64 1
  %7 = icmp sgt i64 %N, 1
  %safe.3 = or i1 %7, %.cond
  %select.ptr.4 = select i1 %safe.3, i64* %6, i64* %shadow
  %8 = load i64, i64* %select.ptr.4, align 8
  %9 = shl i64 %8, 16
  %10 = lshr i64 %8, 16
  %11 = getelementptr inbounds i64, i64* %0, i64 2
  %12 = icmp sgt i64 %N, 2
  %safe.7 = or i1 %12, %.cond
  %select.ptr.8 = select i1 %safe.7, i64* %11, i64* %shadow
  %13 = load i64, i64* %select.ptr.8, align 8
  %14 = shl i64 %13, 16
  %15 = lshr i64 %8, 24
  %16 = shl i64 %13, 8
  %17 = lshr i64 %13, 8
  %18 = shl i64 %3, 24
  %19 = lshr i64 %13, 16
  %20 = shl i64 %3, 16
  %21 = lshr i64 %13, 24
  %22 = shl i64 %3, 8
  %23 = xor i64 %5, %18
  %24 = xor i64 %23, %20
  %25 = xor i64 %24, %22
  %26 = xor i64 %25, %9
  %27 = xor i64 %26, %10
  %28 = xor i64 %27, %15
  %29 = xor i64 %28, %14
  %30 = xor i64 %29, %16
  %31 = xor i64 %30, %17
  %32 = xor i64 %31, %19
  %33 = xor i64 %32, %21
  %34 = lshr i64 %3, 8
  %35 = shl i64 %8, 24
  %36 = lshr i64 %3, 24
  %37 = shl i64 %8, 8
  %38 = xor i64 %20, %8
  %39 = xor i64 %38, %22
  %40 = xor i64 %39, %34
  %41 = xor i64 %40, %4
  %42 = xor i64 %41, %36
  %43 = xor i64 %42, %10
  %44 = xor i64 %43, %35
  %45 = xor i64 %44, %9
  %46 = xor i64 %45, %37
  %47 = xor i64 %46, %14
  %48 = xor i64 %47, %19
  %49 = xor i64 %48, %21
  %50 = lshr i64 %8, 8
  %51 = shl i64 %13, 24
  %52 = xor i64 %4, %20
  %53 = xor i64 %52, %36
  %54 = xor i64 %53, %13
  %55 = xor i64 %54, %9
  %56 = xor i64 %55, %37
  %57 = xor i64 %56, %50
  %58 = xor i64 %57, %10
  %59 = xor i64 %58, %15
  %60 = xor i64 %59, %19
  %61 = xor i64 %60, %51
  %62 = xor i64 %61, %14
  %63 = xor i64 %62, %16
  %64 = load i64, i64* %0, align 8
  %select.val.89 = select i1 %.cond, i64 %33, i64 %64
  store i64 %select.val.89, i64* %select.ptr., align 8
  %65 = load i64, i64* %6, align 8
  %select.val.94 = select i1 %.cond, i64 %49, i64 %65
  store i64 %select.val.94, i64* %select.ptr.4, align 8
  %66 = load i64, i64* %11, align 8
  %select.val.99 = select i1 %.cond, i64 %63, i64 %66
  store i64 %select.val.99, i64* %select.ptr.8, align 8
  ret void
}

; Function Attrs: nofree norecurse nounwind
define void @pi_1(i64* nocapture %0, i64 %N, i1 %.cond) local_unnamed_addr #3 {
  %shadow = alloca i64, align 8
  %2 = icmp sgt i64 %N, 0
  %safe. = or i1 %2, %.cond
  %select.ptr. = select i1 %safe., i64* %0, i64* %shadow
  %3 = load i64, i64* %select.ptr., align 8
  %4 = lshr i64 %3, 10
  %5 = shl i64 %3, 22
  %6 = xor i64 %4, %5
  %7 = load i64, i64* %0, align 8
  %select.val. = select i1 %.cond, i64 %6, i64 %7
  store i64 %select.val., i64* %select.ptr., align 8
  %8 = getelementptr inbounds i64, i64* %0, i64 2
  %9 = icmp sgt i64 %N, 2
  %safe.5 = or i1 %9, %.cond
  %select.ptr.6 = select i1 %safe.5, i64* %8, i64* %shadow
  %10 = load i64, i64* %select.ptr.6, align 8
  %11 = shl i64 %10, 1
  %12 = lshr i64 %10, 31
  %13 = xor i64 %11, %12
  %14 = load i64, i64* %8, align 8
  %select.val.11 = select i1 %.cond, i64 %13, i64 %14
  store i64 %select.val.11, i64* %select.ptr.6, align 8
  ret void
}

; Function Attrs: nofree norecurse nounwind
define void @pi_2(i64* nocapture %0, i64 %N, i1 %.cond) local_unnamed_addr #3 {
  %shadow = alloca i64, align 8
  %2 = icmp sgt i64 %N, 0
  %safe. = or i1 %2, %.cond
  %select.ptr. = select i1 %safe., i64* %0, i64* %shadow
  %3 = load i64, i64* %select.ptr., align 8
  %4 = shl i64 %3, 1
  %5 = lshr i64 %3, 31
  %6 = xor i64 %4, %5
  %7 = load i64, i64* %0, align 8
  %select.val. = select i1 %.cond, i64 %6, i64 %7
  store i64 %select.val., i64* %select.ptr., align 8
  %8 = getelementptr inbounds i64, i64* %0, i64 2
  %9 = icmp sgt i64 %N, 2
  %safe.5 = or i1 %9, %.cond
  %select.ptr.6 = select i1 %safe.5, i64* %8, i64* %shadow
  %10 = load i64, i64* %select.ptr.6, align 8
  %11 = lshr i64 %10, 10
  %12 = shl i64 %10, 22
  %13 = xor i64 %11, %12
  %14 = load i64, i64* %8, align 8
  %select.val.11 = select i1 %.cond, i64 %13, i64 %14
  store i64 %select.val.11, i64* %select.ptr.6, align 8
  ret void
}

; Function Attrs: nounwind
define void @rho(i64* nocapture %0, i64 %N, i1 %.cond) local_unnamed_addr #4 {
  %shadow.i9 = alloca i64, align 8
  %shadow.i4 = alloca i64, align 8
  %shadow.i1 = alloca i64, align 8
  %shadow.i = alloca i64, align 8
  %shadow.i.0.sroa_cast20 = bitcast i64* %shadow.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %shadow.i.0.sroa_cast20)
  %2 = icmp sgt i64 %N, 0
  %safe..i = or i1 %2, %.cond
  %select.ptr..i = select i1 %safe..i, i64* %0, i64* %shadow.i
  %3 = load i64, i64* %select.ptr..i, align 8
  %4 = lshr i64 %3, 16
  %5 = xor i64 %4, %3
  %6 = getelementptr inbounds i64, i64* %0, i64 1
  %7 = icmp sgt i64 %N, 1
  %safe.3.i = or i1 %7, %.cond
  %select.ptr.4.i = select i1 %safe.3.i, i64* %6, i64* %shadow.i
  %8 = load i64, i64* %select.ptr.4.i, align 8
  %9 = shl i64 %8, 16
  %10 = lshr i64 %8, 16
  %11 = getelementptr inbounds i64, i64* %0, i64 2
  %12 = icmp sgt i64 %N, 2
  %safe.7.i = or i1 %12, %.cond
  %select.ptr.8.i = select i1 %safe.7.i, i64* %11, i64* %shadow.i
  %13 = load i64, i64* %select.ptr.8.i, align 8
  %14 = shl i64 %13, 16
  %15 = lshr i64 %8, 24
  %16 = shl i64 %13, 8
  %17 = lshr i64 %13, 8
  %18 = shl i64 %3, 24
  %19 = lshr i64 %13, 16
  %20 = shl i64 %3, 16
  %21 = lshr i64 %13, 24
  %22 = shl i64 %3, 8
  %23 = xor i64 %5, %18
  %24 = xor i64 %23, %20
  %25 = xor i64 %24, %22
  %26 = xor i64 %25, %9
  %27 = xor i64 %26, %10
  %28 = xor i64 %27, %15
  %29 = xor i64 %28, %14
  %30 = xor i64 %29, %16
  %31 = xor i64 %30, %17
  %32 = xor i64 %31, %19
  %33 = xor i64 %32, %21
  %34 = lshr i64 %3, 8
  %35 = shl i64 %8, 24
  %36 = lshr i64 %3, 24
  %37 = shl i64 %8, 8
  %38 = xor i64 %20, %8
  %39 = xor i64 %38, %22
  %40 = xor i64 %39, %34
  %41 = xor i64 %40, %4
  %42 = xor i64 %41, %36
  %43 = xor i64 %42, %10
  %44 = xor i64 %43, %35
  %45 = xor i64 %44, %9
  %46 = xor i64 %45, %37
  %47 = xor i64 %46, %14
  %48 = xor i64 %47, %19
  %49 = xor i64 %48, %21
  %50 = lshr i64 %8, 8
  %51 = shl i64 %13, 24
  %52 = xor i64 %4, %20
  %53 = xor i64 %52, %36
  %54 = xor i64 %53, %13
  %55 = xor i64 %54, %9
  %56 = xor i64 %55, %37
  %57 = xor i64 %56, %50
  %58 = xor i64 %57, %10
  %59 = xor i64 %58, %15
  %60 = xor i64 %59, %19
  %61 = xor i64 %60, %51
  %62 = xor i64 %61, %14
  %63 = xor i64 %62, %16
  %64 = load i64, i64* %0, align 8
  %select.val.89.i = select i1 %.cond, i64 %33, i64 %64
  store i64 %select.val.89.i, i64* %select.ptr..i, align 8
  %65 = load i64, i64* %6, align 8
  %select.val.94.i = select i1 %.cond, i64 %49, i64 %65
  store i64 %select.val.94.i, i64* %select.ptr.4.i, align 8
  %66 = load i64, i64* %11, align 8
  %select.val.99.i = select i1 %.cond, i64 %63, i64 %66
  store i64 %select.val.99.i, i64* %select.ptr.8.i, align 8
  %shadow.i.0.sroa_cast21 = bitcast i64* %shadow.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %shadow.i.0.sroa_cast21)
  %shadow.i1.0.sroa_cast22 = bitcast i64* %shadow.i1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %shadow.i1.0.sroa_cast22)
  %select.ptr..i3 = select i1 %safe..i, i64* %0, i64* %shadow.i1
  %67 = load i64, i64* %select.ptr..i3, align 8
  %68 = lshr i64 %67, 10
  %69 = shl i64 %67, 22
  %70 = xor i64 %68, %69
  %71 = load i64, i64* %0, align 8
  %select.val..i = select i1 %.cond, i64 %70, i64 %71
  store i64 %select.val..i, i64* %select.ptr..i3, align 8
  %select.ptr.6.i = select i1 %safe.7.i, i64* %11, i64* %shadow.i1
  %72 = load i64, i64* %select.ptr.6.i, align 8
  %73 = shl i64 %72, 1
  %74 = lshr i64 %72, 31
  %75 = xor i64 %73, %74
  %76 = load i64, i64* %11, align 8
  %select.val.11.i = select i1 %.cond, i64 %75, i64 %76
  store i64 %select.val.11.i, i64* %select.ptr.6.i, align 8
  %shadow.i1.0.sroa_cast23 = bitcast i64* %shadow.i1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %shadow.i1.0.sroa_cast23)
  %shadow.i4.0.sroa_cast24 = bitcast i64* %shadow.i4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %shadow.i4.0.sroa_cast24)
  %select.ptr..i6 = select i1 %safe..i, i64* %0, i64* %shadow.i4
  %77 = load i64, i64* %select.ptr..i6, align 8
  %select.ptr.2.i = select i1 %safe.3.i, i64* %6, i64* %shadow.i4
  %78 = load i64, i64* %select.ptr.2.i, align 8
  %select.ptr.4.i8 = select i1 %safe.7.i, i64* %11, i64* %shadow.i4
  %79 = load i64, i64* %select.ptr.4.i8, align 8
  %80 = xor i64 %79, -1
  %81 = or i64 %78, %80
  %82 = xor i64 %81, %77
  %83 = xor i64 %77, -1
  %84 = or i64 %79, %83
  %85 = xor i64 %84, %78
  %86 = xor i64 %78, -1
  %87 = or i64 %77, %86
  %88 = xor i64 %79, %87
  %89 = load i64, i64* %0, align 8
  %select.val.29.i = select i1 %.cond, i64 %82, i64 %89
  store i64 %select.val.29.i, i64* %select.ptr..i6, align 8
  %90 = load i64, i64* %6, align 8
  %select.val.34.i = select i1 %.cond, i64 %85, i64 %90
  store i64 %select.val.34.i, i64* %select.ptr.2.i, align 8
  %91 = load i64, i64* %11, align 8
  %select.val.39.i = select i1 %.cond, i64 %88, i64 %91
  store i64 %select.val.39.i, i64* %select.ptr.4.i8, align 8
  %shadow.i4.0.sroa_cast25 = bitcast i64* %shadow.i4 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %shadow.i4.0.sroa_cast25)
  %shadow.i9.0.sroa_cast26 = bitcast i64* %shadow.i9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %shadow.i9.0.sroa_cast26)
  %select.ptr..i11 = select i1 %safe..i, i64* %0, i64* %shadow.i9
  %92 = load i64, i64* %select.ptr..i11, align 8
  %93 = shl i64 %92, 1
  %94 = lshr i64 %92, 31
  %95 = xor i64 %93, %94
  %96 = load i64, i64* %0, align 8
  %select.val..i12 = select i1 %.cond, i64 %95, i64 %96
  store i64 %select.val..i12, i64* %select.ptr..i11, align 8
  %select.ptr.6.i14 = select i1 %safe.7.i, i64* %11, i64* %shadow.i9
  %97 = load i64, i64* %select.ptr.6.i14, align 8
  %98 = lshr i64 %97, 10
  %99 = shl i64 %97, 22
  %100 = xor i64 %98, %99
  %101 = load i64, i64* %11, align 8
  %select.val.11.i15 = select i1 %.cond, i64 %100, i64 %101
  store i64 %select.val.11.i15, i64* %select.ptr.6.i14, align 8
  %shadow.i9.0.sroa_cast27 = bitcast i64* %shadow.i9 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %shadow.i9.0.sroa_cast27)
  ret void
}

; Function Attrs: nofree norecurse nounwind
define void @rndcon_gen(i64 %0, i64* nocapture %1, i64 %N, i1 %.cond) local_unnamed_addr #3 {
  %shadow = alloca i64, align 8
  %3 = load i64, i64* %1, align 8
  %select.val. = select i1 %.cond, i64 %0, i64 %3
  store i64 %select.val., i64* %1, align 8
  %4 = shl i64 %0, 1
  %5 = trunc i64 %0 to i16
  %6 = icmp slt i16 %5, 0
  %7 = xor i64 %4, 69649
  %spec.select = select i1 %6, i64 %7, i64 %4
  %8 = getelementptr inbounds i64, i64* %1, i64 1
  %9 = icmp sgt i64 %N, 1
  %safe. = or i1 %9, %.cond
  %select.ptr. = select i1 %safe., i64* %8, i64* %shadow
  %10 = load i64, i64* %8, align 8
  %select.val.1 = select i1 %.cond, i64 %spec.select, i64 %10
  store i64 %select.val.1, i64* %select.ptr., align 8
  %11 = shl i64 %spec.select, 1
  %12 = trunc i64 %spec.select to i16
  %13 = icmp slt i16 %12, 0
  %14 = xor i64 %11, 69649
  %spec.select.1 = select i1 %13, i64 %14, i64 %11
  %15 = getelementptr inbounds i64, i64* %1, i64 2
  %16 = icmp sgt i64 %N, 2
  %safe.2 = or i1 %16, %.cond
  %select.ptr.3 = select i1 %safe.2, i64* %15, i64* %shadow
  %17 = load i64, i64* %15, align 8
  %select.val.4 = select i1 %.cond, i64 %spec.select.1, i64 %17
  store i64 %select.val.4, i64* %select.ptr.3, align 8
  %18 = shl i64 %spec.select.1, 1
  %19 = trunc i64 %spec.select.1 to i16
  %20 = icmp slt i16 %19, 0
  %21 = xor i64 %18, 69649
  %spec.select.2 = select i1 %20, i64 %21, i64 %18
  %22 = getelementptr inbounds i64, i64* %1, i64 3
  %23 = icmp sgt i64 %N, 3
  %safe.5 = or i1 %23, %.cond
  %select.ptr.6 = select i1 %safe.5, i64* %22, i64* %shadow
  %24 = load i64, i64* %22, align 8
  %select.val.7 = select i1 %.cond, i64 %spec.select.2, i64 %24
  store i64 %select.val.7, i64* %select.ptr.6, align 8
  %25 = shl i64 %spec.select.2, 1
  %26 = trunc i64 %spec.select.2 to i16
  %27 = icmp slt i16 %26, 0
  %28 = xor i64 %25, 69649
  %spec.select.3 = select i1 %27, i64 %28, i64 %25
  %29 = getelementptr inbounds i64, i64* %1, i64 4
  %30 = icmp sgt i64 %N, 4
  %safe.8 = or i1 %30, %.cond
  %select.ptr.9 = select i1 %safe.8, i64* %29, i64* %shadow
  %31 = load i64, i64* %29, align 8
  %select.val.10 = select i1 %.cond, i64 %spec.select.3, i64 %31
  store i64 %select.val.10, i64* %select.ptr.9, align 8
  %32 = shl i64 %spec.select.3, 1
  %33 = trunc i64 %spec.select.3 to i16
  %34 = icmp slt i16 %33, 0
  %35 = xor i64 %32, 69649
  %spec.select.4 = select i1 %34, i64 %35, i64 %32
  %36 = getelementptr inbounds i64, i64* %1, i64 5
  %37 = icmp sgt i64 %N, 5
  %safe.11 = or i1 %37, %.cond
  %select.ptr.12 = select i1 %safe.11, i64* %36, i64* %shadow
  %38 = load i64, i64* %36, align 8
  %select.val.13 = select i1 %.cond, i64 %spec.select.4, i64 %38
  store i64 %select.val.13, i64* %select.ptr.12, align 8
  %39 = shl i64 %spec.select.4, 1
  %40 = trunc i64 %spec.select.4 to i16
  %41 = icmp slt i16 %40, 0
  %42 = xor i64 %39, 69649
  %spec.select.5 = select i1 %41, i64 %42, i64 %39
  %43 = getelementptr inbounds i64, i64* %1, i64 6
  %44 = icmp sgt i64 %N, 6
  %safe.14 = or i1 %44, %.cond
  %select.ptr.15 = select i1 %safe.14, i64* %43, i64* %shadow
  %45 = load i64, i64* %43, align 8
  %select.val.16 = select i1 %.cond, i64 %spec.select.5, i64 %45
  store i64 %select.val.16, i64* %select.ptr.15, align 8
  %46 = shl i64 %spec.select.5, 1
  %47 = trunc i64 %spec.select.5 to i16
  %48 = icmp slt i16 %47, 0
  %49 = xor i64 %46, 69649
  %spec.select.6 = select i1 %48, i64 %49, i64 %46
  %50 = getelementptr inbounds i64, i64* %1, i64 7
  %51 = icmp sgt i64 %N, 7
  %safe.17 = or i1 %51, %.cond
  %select.ptr.18 = select i1 %safe.17, i64* %50, i64* %shadow
  %52 = load i64, i64* %50, align 8
  %select.val.19 = select i1 %.cond, i64 %spec.select.6, i64 %52
  store i64 %select.val.19, i64* %select.ptr.18, align 8
  %53 = shl i64 %spec.select.6, 1
  %54 = trunc i64 %spec.select.6 to i16
  %55 = icmp slt i16 %54, 0
  %56 = xor i64 %53, 69649
  %spec.select.7 = select i1 %55, i64 %56, i64 %53
  %57 = getelementptr inbounds i64, i64* %1, i64 8
  %58 = icmp sgt i64 %N, 8
  %safe.20 = or i1 %58, %.cond
  %select.ptr.21 = select i1 %safe.20, i64* %57, i64* %shadow
  %59 = load i64, i64* %57, align 8
  %select.val.22 = select i1 %.cond, i64 %spec.select.7, i64 %59
  store i64 %select.val.22, i64* %select.ptr.21, align 8
  %60 = shl i64 %spec.select.7, 1
  %61 = trunc i64 %spec.select.7 to i16
  %62 = icmp slt i16 %61, 0
  %63 = xor i64 %60, 69649
  %spec.select.8 = select i1 %62, i64 %63, i64 %60
  %64 = getelementptr inbounds i64, i64* %1, i64 9
  %65 = icmp sgt i64 %N, 9
  %safe.23 = or i1 %65, %.cond
  %select.ptr.24 = select i1 %safe.23, i64* %64, i64* %shadow
  %66 = load i64, i64* %64, align 8
  %select.val.25 = select i1 %.cond, i64 %spec.select.8, i64 %66
  store i64 %select.val.25, i64* %select.ptr.24, align 8
  %67 = shl i64 %spec.select.8, 1
  %68 = trunc i64 %spec.select.8 to i16
  %69 = icmp slt i16 %68, 0
  %70 = xor i64 %67, 69649
  %spec.select.9 = select i1 %69, i64 %70, i64 %67
  %71 = getelementptr inbounds i64, i64* %1, i64 10
  %72 = icmp sgt i64 %N, 10
  %safe.26 = or i1 %72, %.cond
  %select.ptr.27 = select i1 %safe.26, i64* %71, i64* %shadow
  %73 = load i64, i64* %71, align 8
  %select.val.28 = select i1 %.cond, i64 %spec.select.9, i64 %73
  store i64 %select.val.28, i64* %select.ptr.27, align 8
  %74 = shl i64 %spec.select.9, 1
  %75 = trunc i64 %spec.select.9 to i16
  %76 = icmp slt i16 %75, 0
  %77 = xor i64 %74, 69649
  %spec.select.10 = select i1 %76, i64 %77, i64 %74
  %78 = getelementptr inbounds i64, i64* %1, i64 11
  %79 = icmp sgt i64 %N, 11
  %safe.29 = or i1 %79, %.cond
  %select.ptr.30 = select i1 %safe.29, i64* %78, i64* %shadow
  %80 = load i64, i64* %78, align 8
  %select.val.31 = select i1 %.cond, i64 %spec.select.10, i64 %80
  store i64 %select.val.31, i64* %select.ptr.30, align 8
  ret void
}

; Function Attrs: nounwind
define void @encrypt(%struct.twy_ctx* nocapture readonly %0, i64 %N, i64* %1, i64 %N1, i1 %.cond) local_unnamed_addr #4 {
  %shadow.i = alloca i64, align 8
  %shadow = alloca i64, align 8
  %3 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 0, i64 0
  %4 = icmp sgt i64 %N, 0
  %safe. = or i1 %4, %.cond
  %select.ptr. = select i1 %safe., i64* %3, i64* %shadow
  %5 = load i64, i64* %select.ptr., align 8
  %6 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 0
  %select.ptr.3 = select i1 %safe., i64* %6, i64* %shadow
  %7 = load i64, i64* %select.ptr.3, align 8
  %8 = shl i64 %7, 16
  %9 = xor i64 %8, %5
  %10 = load i64, i64* %1, align 8
  %11 = select i1 %.cond, i64 %9, i64 0
  %select.val. = xor i64 %11, %10
  store i64 %select.val., i64* %1, align 8
  %12 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 0, i64 1
  %13 = icmp sgt i64 %N, 1
  %safe.4 = or i1 %13, %.cond
  %select.ptr.5 = select i1 %safe.4, i64* %12, i64* %shadow
  %14 = load i64, i64* %select.ptr.5, align 8
  %15 = getelementptr inbounds i64, i64* %1, i64 1
  %16 = icmp sgt i64 %N1, 1
  %safe.6 = or i1 %16, %.cond
  %select.ptr.7 = select i1 %safe.6, i64* %15, i64* %shadow
  %17 = load i64, i64* %select.ptr.7, align 8
  %18 = xor i64 %17, %14
  %19 = load i64, i64* %15, align 8
  %select.val.10 = select i1 %.cond, i64 %18, i64 %19
  store i64 %select.val.10, i64* %select.ptr.7, align 8
  %20 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 0, i64 2
  %21 = icmp sgt i64 %N, 2
  %safe.11 = or i1 %21, %.cond
  %select.ptr.12 = select i1 %safe.11, i64* %20, i64* %shadow
  %22 = load i64, i64* %select.ptr.12, align 8
  %23 = load i64, i64* %select.ptr.3, align 8
  %24 = xor i64 %23, %22
  %25 = getelementptr inbounds i64, i64* %1, i64 2
  %26 = icmp sgt i64 %N1, 2
  %safe.15 = or i1 %26, %.cond
  %select.ptr.16 = select i1 %safe.15, i64* %25, i64* %shadow
  %27 = load i64, i64* %select.ptr.16, align 8
  %28 = xor i64 %24, %27
  %29 = load i64, i64* %25, align 8
  %select.val.19 = select i1 %.cond, i64 %28, i64 %29
  store i64 %select.val.19, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %30 = load i64, i64* %select.ptr., align 8
  %31 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 1
  %select.ptr.23 = select i1 %safe.4, i64* %31, i64* %shadow
  %32 = load i64, i64* %select.ptr.23, align 8
  %33 = shl i64 %32, 16
  %34 = xor i64 %33, %30
  %35 = load i64, i64* %1, align 8
  %36 = select i1 %.cond, i64 %34, i64 0
  %select.val.24 = xor i64 %36, %35
  store i64 %select.val.24, i64* %1, align 8
  %37 = load i64, i64* %select.ptr.5, align 8
  %38 = load i64, i64* %select.ptr.7, align 8
  %39 = xor i64 %38, %37
  %40 = load i64, i64* %15, align 8
  %select.val.31 = select i1 %.cond, i64 %39, i64 %40
  store i64 %select.val.31, i64* %select.ptr.7, align 8
  %41 = load i64, i64* %select.ptr.12, align 8
  %42 = load i64, i64* %select.ptr.23, align 8
  %43 = xor i64 %42, %41
  %44 = load i64, i64* %select.ptr.16, align 8
  %45 = xor i64 %43, %44
  %46 = load i64, i64* %25, align 8
  %select.val.40 = select i1 %.cond, i64 %45, i64 %46
  store i64 %select.val.40, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %47 = load i64, i64* %select.ptr., align 8
  %48 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 2
  %select.ptr.44 = select i1 %safe.11, i64* %48, i64* %shadow
  %49 = load i64, i64* %select.ptr.44, align 8
  %50 = shl i64 %49, 16
  %51 = xor i64 %50, %47
  %52 = load i64, i64* %1, align 8
  %53 = select i1 %.cond, i64 %51, i64 0
  %select.val.45 = xor i64 %53, %52
  store i64 %select.val.45, i64* %1, align 8
  %54 = load i64, i64* %select.ptr.5, align 8
  %55 = load i64, i64* %select.ptr.7, align 8
  %56 = xor i64 %55, %54
  %57 = load i64, i64* %15, align 8
  %select.val.52 = select i1 %.cond, i64 %56, i64 %57
  store i64 %select.val.52, i64* %select.ptr.7, align 8
  %58 = load i64, i64* %select.ptr.12, align 8
  %59 = load i64, i64* %select.ptr.44, align 8
  %60 = xor i64 %59, %58
  %61 = load i64, i64* %select.ptr.16, align 8
  %62 = xor i64 %60, %61
  %63 = load i64, i64* %25, align 8
  %select.val.61 = select i1 %.cond, i64 %62, i64 %63
  store i64 %select.val.61, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %64 = load i64, i64* %select.ptr., align 8
  %65 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 3
  %66 = icmp sgt i64 %N, 3
  %safe.64 = or i1 %66, %.cond
  %select.ptr.65 = select i1 %safe.64, i64* %65, i64* %shadow
  %67 = load i64, i64* %select.ptr.65, align 8
  %68 = shl i64 %67, 16
  %69 = xor i64 %68, %64
  %70 = load i64, i64* %1, align 8
  %71 = select i1 %.cond, i64 %69, i64 0
  %select.val.66 = xor i64 %71, %70
  store i64 %select.val.66, i64* %1, align 8
  %72 = load i64, i64* %select.ptr.5, align 8
  %73 = load i64, i64* %select.ptr.7, align 8
  %74 = xor i64 %73, %72
  %75 = load i64, i64* %15, align 8
  %select.val.73 = select i1 %.cond, i64 %74, i64 %75
  store i64 %select.val.73, i64* %select.ptr.7, align 8
  %76 = load i64, i64* %select.ptr.12, align 8
  %77 = load i64, i64* %select.ptr.65, align 8
  %78 = xor i64 %77, %76
  %79 = load i64, i64* %select.ptr.16, align 8
  %80 = xor i64 %78, %79
  %81 = load i64, i64* %25, align 8
  %select.val.82 = select i1 %.cond, i64 %80, i64 %81
  store i64 %select.val.82, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %82 = load i64, i64* %select.ptr., align 8
  %83 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 4
  %84 = icmp sgt i64 %N, 4
  %safe.85 = or i1 %84, %.cond
  %select.ptr.86 = select i1 %safe.85, i64* %83, i64* %shadow
  %85 = load i64, i64* %select.ptr.86, align 8
  %86 = shl i64 %85, 16
  %87 = xor i64 %86, %82
  %88 = load i64, i64* %1, align 8
  %89 = select i1 %.cond, i64 %87, i64 0
  %select.val.87 = xor i64 %89, %88
  store i64 %select.val.87, i64* %1, align 8
  %90 = load i64, i64* %select.ptr.5, align 8
  %91 = load i64, i64* %select.ptr.7, align 8
  %92 = xor i64 %91, %90
  %93 = load i64, i64* %15, align 8
  %select.val.94 = select i1 %.cond, i64 %92, i64 %93
  store i64 %select.val.94, i64* %select.ptr.7, align 8
  %94 = load i64, i64* %select.ptr.12, align 8
  %95 = load i64, i64* %select.ptr.86, align 8
  %96 = xor i64 %95, %94
  %97 = load i64, i64* %select.ptr.16, align 8
  %98 = xor i64 %96, %97
  %99 = load i64, i64* %25, align 8
  %select.val.103 = select i1 %.cond, i64 %98, i64 %99
  store i64 %select.val.103, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %100 = load i64, i64* %select.ptr., align 8
  %101 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 5
  %102 = icmp sgt i64 %N, 5
  %safe.106 = or i1 %102, %.cond
  %select.ptr.107 = select i1 %safe.106, i64* %101, i64* %shadow
  %103 = load i64, i64* %select.ptr.107, align 8
  %104 = shl i64 %103, 16
  %105 = xor i64 %104, %100
  %106 = load i64, i64* %1, align 8
  %107 = select i1 %.cond, i64 %105, i64 0
  %select.val.108 = xor i64 %107, %106
  store i64 %select.val.108, i64* %1, align 8
  %108 = load i64, i64* %select.ptr.5, align 8
  %109 = load i64, i64* %select.ptr.7, align 8
  %110 = xor i64 %109, %108
  %111 = load i64, i64* %15, align 8
  %select.val.115 = select i1 %.cond, i64 %110, i64 %111
  store i64 %select.val.115, i64* %select.ptr.7, align 8
  %112 = load i64, i64* %select.ptr.12, align 8
  %113 = load i64, i64* %select.ptr.107, align 8
  %114 = xor i64 %113, %112
  %115 = load i64, i64* %select.ptr.16, align 8
  %116 = xor i64 %114, %115
  %117 = load i64, i64* %25, align 8
  %select.val.124 = select i1 %.cond, i64 %116, i64 %117
  store i64 %select.val.124, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %118 = load i64, i64* %select.ptr., align 8
  %119 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 6
  %120 = icmp sgt i64 %N, 6
  %safe.127 = or i1 %120, %.cond
  %select.ptr.128 = select i1 %safe.127, i64* %119, i64* %shadow
  %121 = load i64, i64* %select.ptr.128, align 8
  %122 = shl i64 %121, 16
  %123 = xor i64 %122, %118
  %124 = load i64, i64* %1, align 8
  %125 = select i1 %.cond, i64 %123, i64 0
  %select.val.129 = xor i64 %125, %124
  store i64 %select.val.129, i64* %1, align 8
  %126 = load i64, i64* %select.ptr.5, align 8
  %127 = load i64, i64* %select.ptr.7, align 8
  %128 = xor i64 %127, %126
  %129 = load i64, i64* %15, align 8
  %select.val.136 = select i1 %.cond, i64 %128, i64 %129
  store i64 %select.val.136, i64* %select.ptr.7, align 8
  %130 = load i64, i64* %select.ptr.12, align 8
  %131 = load i64, i64* %select.ptr.128, align 8
  %132 = xor i64 %131, %130
  %133 = load i64, i64* %select.ptr.16, align 8
  %134 = xor i64 %132, %133
  %135 = load i64, i64* %25, align 8
  %select.val.145 = select i1 %.cond, i64 %134, i64 %135
  store i64 %select.val.145, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %136 = load i64, i64* %select.ptr., align 8
  %137 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 7
  %138 = icmp sgt i64 %N, 7
  %safe.148 = or i1 %138, %.cond
  %select.ptr.149 = select i1 %safe.148, i64* %137, i64* %shadow
  %139 = load i64, i64* %select.ptr.149, align 8
  %140 = shl i64 %139, 16
  %141 = xor i64 %140, %136
  %142 = load i64, i64* %1, align 8
  %143 = select i1 %.cond, i64 %141, i64 0
  %select.val.150 = xor i64 %143, %142
  store i64 %select.val.150, i64* %1, align 8
  %144 = load i64, i64* %select.ptr.5, align 8
  %145 = load i64, i64* %select.ptr.7, align 8
  %146 = xor i64 %145, %144
  %147 = load i64, i64* %15, align 8
  %select.val.157 = select i1 %.cond, i64 %146, i64 %147
  store i64 %select.val.157, i64* %select.ptr.7, align 8
  %148 = load i64, i64* %select.ptr.12, align 8
  %149 = load i64, i64* %select.ptr.149, align 8
  %150 = xor i64 %149, %148
  %151 = load i64, i64* %select.ptr.16, align 8
  %152 = xor i64 %150, %151
  %153 = load i64, i64* %25, align 8
  %select.val.166 = select i1 %.cond, i64 %152, i64 %153
  store i64 %select.val.166, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %154 = load i64, i64* %select.ptr., align 8
  %155 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 8
  %156 = icmp sgt i64 %N, 8
  %safe.169 = or i1 %156, %.cond
  %select.ptr.170 = select i1 %safe.169, i64* %155, i64* %shadow
  %157 = load i64, i64* %select.ptr.170, align 8
  %158 = shl i64 %157, 16
  %159 = xor i64 %158, %154
  %160 = load i64, i64* %1, align 8
  %161 = select i1 %.cond, i64 %159, i64 0
  %select.val.171 = xor i64 %161, %160
  store i64 %select.val.171, i64* %1, align 8
  %162 = load i64, i64* %select.ptr.5, align 8
  %163 = load i64, i64* %select.ptr.7, align 8
  %164 = xor i64 %163, %162
  %165 = load i64, i64* %15, align 8
  %select.val.178 = select i1 %.cond, i64 %164, i64 %165
  store i64 %select.val.178, i64* %select.ptr.7, align 8
  %166 = load i64, i64* %select.ptr.12, align 8
  %167 = load i64, i64* %select.ptr.170, align 8
  %168 = xor i64 %167, %166
  %169 = load i64, i64* %select.ptr.16, align 8
  %170 = xor i64 %168, %169
  %171 = load i64, i64* %25, align 8
  %select.val.187 = select i1 %.cond, i64 %170, i64 %171
  store i64 %select.val.187, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %172 = load i64, i64* %select.ptr., align 8
  %173 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 9
  %174 = icmp sgt i64 %N, 9
  %safe.190 = or i1 %174, %.cond
  %select.ptr.191 = select i1 %safe.190, i64* %173, i64* %shadow
  %175 = load i64, i64* %select.ptr.191, align 8
  %176 = shl i64 %175, 16
  %177 = xor i64 %176, %172
  %178 = load i64, i64* %1, align 8
  %179 = select i1 %.cond, i64 %177, i64 0
  %select.val.192 = xor i64 %179, %178
  store i64 %select.val.192, i64* %1, align 8
  %180 = load i64, i64* %select.ptr.5, align 8
  %181 = load i64, i64* %select.ptr.7, align 8
  %182 = xor i64 %181, %180
  %183 = load i64, i64* %15, align 8
  %select.val.199 = select i1 %.cond, i64 %182, i64 %183
  store i64 %select.val.199, i64* %select.ptr.7, align 8
  %184 = load i64, i64* %select.ptr.12, align 8
  %185 = load i64, i64* %select.ptr.191, align 8
  %186 = xor i64 %185, %184
  %187 = load i64, i64* %select.ptr.16, align 8
  %188 = xor i64 %186, %187
  %189 = load i64, i64* %25, align 8
  %select.val.208 = select i1 %.cond, i64 %188, i64 %189
  store i64 %select.val.208, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %190 = load i64, i64* %select.ptr., align 8
  %191 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 10
  %192 = icmp sgt i64 %N, 10
  %safe.211 = or i1 %192, %.cond
  %select.ptr.212 = select i1 %safe.211, i64* %191, i64* %shadow
  %193 = load i64, i64* %select.ptr.212, align 8
  %194 = shl i64 %193, 16
  %195 = xor i64 %194, %190
  %196 = load i64, i64* %1, align 8
  %197 = select i1 %.cond, i64 %195, i64 0
  %select.val.213 = xor i64 %197, %196
  store i64 %select.val.213, i64* %1, align 8
  %198 = load i64, i64* %select.ptr.5, align 8
  %199 = load i64, i64* %select.ptr.7, align 8
  %200 = xor i64 %199, %198
  %201 = load i64, i64* %15, align 8
  %select.val.220 = select i1 %.cond, i64 %200, i64 %201
  store i64 %select.val.220, i64* %select.ptr.7, align 8
  %202 = load i64, i64* %select.ptr.12, align 8
  %203 = load i64, i64* %select.ptr.212, align 8
  %204 = xor i64 %203, %202
  %205 = load i64, i64* %select.ptr.16, align 8
  %206 = xor i64 %204, %205
  %207 = load i64, i64* %25, align 8
  %select.val.229 = select i1 %.cond, i64 %206, i64 %207
  store i64 %select.val.229, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %208 = load i64, i64* %select.ptr., align 8
  %209 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 11
  %210 = icmp sgt i64 %N, 11
  %safe.232 = or i1 %210, %.cond
  %select.ptr.233 = select i1 %safe.232, i64* %209, i64* %shadow
  %211 = load i64, i64* %select.ptr.233, align 8
  %212 = shl i64 %211, 16
  %213 = xor i64 %212, %208
  %214 = load i64, i64* %1, align 8
  %215 = select i1 %.cond, i64 %213, i64 0
  %select.val.234 = xor i64 %215, %214
  store i64 %select.val.234, i64* %1, align 8
  %216 = load i64, i64* %select.ptr.5, align 8
  %217 = load i64, i64* %select.ptr.7, align 8
  %218 = xor i64 %217, %216
  %219 = load i64, i64* %15, align 8
  %select.val.241 = select i1 %.cond, i64 %218, i64 %219
  store i64 %select.val.241, i64* %select.ptr.7, align 8
  %220 = load i64, i64* %select.ptr.12, align 8
  %221 = load i64, i64* %select.ptr.233, align 8
  %222 = xor i64 %221, %220
  %223 = load i64, i64* %select.ptr.16, align 8
  %224 = xor i64 %222, %223
  %225 = load i64, i64* %25, align 8
  %select.val.250 = select i1 %.cond, i64 %224, i64 %225
  store i64 %select.val.250, i64* %select.ptr.16, align 8
  %shadow.i.0.sroa_cast383 = bitcast i64* %shadow.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %shadow.i.0.sroa_cast383)
  %226 = icmp sgt i64 %N1, 0
  %safe..i = or i1 %226, %.cond
  %select.ptr..i = select i1 %safe..i, i64* %1, i64* %shadow.i
  %227 = load i64, i64* %select.ptr..i, align 8
  %228 = lshr i64 %227, 16
  %229 = xor i64 %228, %227
  %select.ptr.4.i = select i1 %safe.6, i64* %15, i64* %shadow.i
  %230 = load i64, i64* %select.ptr.4.i, align 8
  %231 = shl i64 %230, 16
  %232 = lshr i64 %230, 16
  %select.ptr.8.i = select i1 %safe.15, i64* %25, i64* %shadow.i
  %233 = load i64, i64* %select.ptr.8.i, align 8
  %234 = shl i64 %233, 16
  %235 = lshr i64 %230, 24
  %236 = shl i64 %233, 8
  %237 = lshr i64 %233, 8
  %238 = shl i64 %227, 24
  %239 = lshr i64 %233, 16
  %240 = shl i64 %227, 16
  %241 = lshr i64 %233, 24
  %242 = shl i64 %227, 8
  %243 = xor i64 %229, %238
  %244 = xor i64 %243, %240
  %245 = xor i64 %244, %242
  %246 = xor i64 %245, %231
  %247 = xor i64 %246, %232
  %248 = xor i64 %247, %235
  %249 = xor i64 %248, %234
  %250 = xor i64 %249, %236
  %251 = xor i64 %250, %237
  %252 = xor i64 %251, %239
  %253 = xor i64 %252, %241
  %254 = lshr i64 %227, 8
  %255 = shl i64 %230, 24
  %256 = lshr i64 %227, 24
  %257 = shl i64 %230, 8
  %258 = xor i64 %240, %230
  %259 = xor i64 %258, %242
  %260 = xor i64 %259, %254
  %261 = xor i64 %260, %228
  %262 = xor i64 %261, %256
  %263 = xor i64 %262, %232
  %264 = xor i64 %263, %255
  %265 = xor i64 %264, %231
  %266 = xor i64 %265, %257
  %267 = xor i64 %266, %234
  %268 = xor i64 %267, %239
  %269 = xor i64 %268, %241
  %270 = lshr i64 %230, 8
  %271 = shl i64 %233, 24
  %272 = xor i64 %228, %240
  %273 = xor i64 %272, %256
  %274 = xor i64 %273, %233
  %275 = xor i64 %274, %231
  %276 = xor i64 %275, %257
  %277 = xor i64 %276, %270
  %278 = xor i64 %277, %232
  %279 = xor i64 %278, %235
  %280 = xor i64 %279, %239
  %281 = xor i64 %280, %271
  %282 = xor i64 %281, %234
  %283 = xor i64 %282, %236
  %284 = load i64, i64* %1, align 8
  %select.val.89.i = select i1 %.cond, i64 %253, i64 %284
  store i64 %select.val.89.i, i64* %select.ptr..i, align 8
  %285 = load i64, i64* %15, align 8
  %select.val.94.i = select i1 %.cond, i64 %269, i64 %285
  store i64 %select.val.94.i, i64* %select.ptr.4.i, align 8
  %286 = load i64, i64* %25, align 8
  %select.val.99.i = select i1 %.cond, i64 %283, i64 %286
  store i64 %select.val.99.i, i64* %select.ptr.8.i, align 8
  %shadow.i.0.sroa_cast384 = bitcast i64* %shadow.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %shadow.i.0.sroa_cast384)
  ret void
}

; Function Attrs: nounwind
define void @decrypt(%struct.twy_ctx* nocapture readonly %0, i64 %N, i64* %1, i64 %N1, i1 %.cond) local_unnamed_addr #4 {
  %shadow.i = alloca i64, align 8
  %shadow = alloca i64, align 8
  call void @mu(i64* %1, i64 %N1, i1 %.cond)
  %3 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 1, i64 0
  %4 = icmp sgt i64 %N, 0
  %safe. = or i1 %4, %.cond
  %select.ptr. = select i1 %safe., i64* %3, i64* %shadow
  %5 = load i64, i64* %select.ptr., align 8
  %6 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 0
  %select.ptr.3 = select i1 %safe., i64* %6, i64* %shadow
  %7 = load i64, i64* %select.ptr.3, align 8
  %8 = shl i64 %7, 16
  %9 = xor i64 %8, %5
  %10 = load i64, i64* %1, align 8
  %11 = select i1 %.cond, i64 %9, i64 0
  %select.val. = xor i64 %11, %10
  store i64 %select.val., i64* %1, align 8
  %12 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 1, i64 1
  %13 = icmp sgt i64 %N, 1
  %safe.4 = or i1 %13, %.cond
  %select.ptr.5 = select i1 %safe.4, i64* %12, i64* %shadow
  %14 = load i64, i64* %select.ptr.5, align 8
  %15 = getelementptr inbounds i64, i64* %1, i64 1
  %16 = icmp sgt i64 %N1, 1
  %safe.6 = or i1 %16, %.cond
  %select.ptr.7 = select i1 %safe.6, i64* %15, i64* %shadow
  %17 = load i64, i64* %select.ptr.7, align 8
  %18 = xor i64 %17, %14
  %19 = load i64, i64* %15, align 8
  %select.val.10 = select i1 %.cond, i64 %18, i64 %19
  store i64 %select.val.10, i64* %select.ptr.7, align 8
  %20 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 1, i64 2
  %21 = icmp sgt i64 %N, 2
  %safe.11 = or i1 %21, %.cond
  %select.ptr.12 = select i1 %safe.11, i64* %20, i64* %shadow
  %22 = load i64, i64* %select.ptr.12, align 8
  %23 = load i64, i64* %select.ptr.3, align 8
  %24 = xor i64 %23, %22
  %25 = getelementptr inbounds i64, i64* %1, i64 2
  %26 = icmp sgt i64 %N1, 2
  %safe.15 = or i1 %26, %.cond
  %select.ptr.16 = select i1 %safe.15, i64* %25, i64* %shadow
  %27 = load i64, i64* %select.ptr.16, align 8
  %28 = xor i64 %24, %27
  %29 = load i64, i64* %25, align 8
  %select.val.19 = select i1 %.cond, i64 %28, i64 %29
  store i64 %select.val.19, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %30 = load i64, i64* %select.ptr., align 8
  %31 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 1
  %select.ptr.23 = select i1 %safe.4, i64* %31, i64* %shadow
  %32 = load i64, i64* %select.ptr.23, align 8
  %33 = shl i64 %32, 16
  %34 = xor i64 %33, %30
  %35 = load i64, i64* %1, align 8
  %36 = select i1 %.cond, i64 %34, i64 0
  %select.val.24 = xor i64 %36, %35
  store i64 %select.val.24, i64* %1, align 8
  %37 = load i64, i64* %select.ptr.5, align 8
  %38 = load i64, i64* %select.ptr.7, align 8
  %39 = xor i64 %38, %37
  %40 = load i64, i64* %15, align 8
  %select.val.31 = select i1 %.cond, i64 %39, i64 %40
  store i64 %select.val.31, i64* %select.ptr.7, align 8
  %41 = load i64, i64* %select.ptr.12, align 8
  %42 = load i64, i64* %select.ptr.23, align 8
  %43 = xor i64 %42, %41
  %44 = load i64, i64* %select.ptr.16, align 8
  %45 = xor i64 %43, %44
  %46 = load i64, i64* %25, align 8
  %select.val.40 = select i1 %.cond, i64 %45, i64 %46
  store i64 %select.val.40, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %47 = load i64, i64* %select.ptr., align 8
  %48 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 2
  %select.ptr.44 = select i1 %safe.11, i64* %48, i64* %shadow
  %49 = load i64, i64* %select.ptr.44, align 8
  %50 = shl i64 %49, 16
  %51 = xor i64 %50, %47
  %52 = load i64, i64* %1, align 8
  %53 = select i1 %.cond, i64 %51, i64 0
  %select.val.45 = xor i64 %53, %52
  store i64 %select.val.45, i64* %1, align 8
  %54 = load i64, i64* %select.ptr.5, align 8
  %55 = load i64, i64* %select.ptr.7, align 8
  %56 = xor i64 %55, %54
  %57 = load i64, i64* %15, align 8
  %select.val.52 = select i1 %.cond, i64 %56, i64 %57
  store i64 %select.val.52, i64* %select.ptr.7, align 8
  %58 = load i64, i64* %select.ptr.12, align 8
  %59 = load i64, i64* %select.ptr.44, align 8
  %60 = xor i64 %59, %58
  %61 = load i64, i64* %select.ptr.16, align 8
  %62 = xor i64 %60, %61
  %63 = load i64, i64* %25, align 8
  %select.val.61 = select i1 %.cond, i64 %62, i64 %63
  store i64 %select.val.61, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %64 = load i64, i64* %select.ptr., align 8
  %65 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 3
  %66 = icmp sgt i64 %N, 3
  %safe.64 = or i1 %66, %.cond
  %select.ptr.65 = select i1 %safe.64, i64* %65, i64* %shadow
  %67 = load i64, i64* %select.ptr.65, align 8
  %68 = shl i64 %67, 16
  %69 = xor i64 %68, %64
  %70 = load i64, i64* %1, align 8
  %71 = select i1 %.cond, i64 %69, i64 0
  %select.val.66 = xor i64 %71, %70
  store i64 %select.val.66, i64* %1, align 8
  %72 = load i64, i64* %select.ptr.5, align 8
  %73 = load i64, i64* %select.ptr.7, align 8
  %74 = xor i64 %73, %72
  %75 = load i64, i64* %15, align 8
  %select.val.73 = select i1 %.cond, i64 %74, i64 %75
  store i64 %select.val.73, i64* %select.ptr.7, align 8
  %76 = load i64, i64* %select.ptr.12, align 8
  %77 = load i64, i64* %select.ptr.65, align 8
  %78 = xor i64 %77, %76
  %79 = load i64, i64* %select.ptr.16, align 8
  %80 = xor i64 %78, %79
  %81 = load i64, i64* %25, align 8
  %select.val.82 = select i1 %.cond, i64 %80, i64 %81
  store i64 %select.val.82, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %82 = load i64, i64* %select.ptr., align 8
  %83 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 4
  %84 = icmp sgt i64 %N, 4
  %safe.85 = or i1 %84, %.cond
  %select.ptr.86 = select i1 %safe.85, i64* %83, i64* %shadow
  %85 = load i64, i64* %select.ptr.86, align 8
  %86 = shl i64 %85, 16
  %87 = xor i64 %86, %82
  %88 = load i64, i64* %1, align 8
  %89 = select i1 %.cond, i64 %87, i64 0
  %select.val.87 = xor i64 %89, %88
  store i64 %select.val.87, i64* %1, align 8
  %90 = load i64, i64* %select.ptr.5, align 8
  %91 = load i64, i64* %select.ptr.7, align 8
  %92 = xor i64 %91, %90
  %93 = load i64, i64* %15, align 8
  %select.val.94 = select i1 %.cond, i64 %92, i64 %93
  store i64 %select.val.94, i64* %select.ptr.7, align 8
  %94 = load i64, i64* %select.ptr.12, align 8
  %95 = load i64, i64* %select.ptr.86, align 8
  %96 = xor i64 %95, %94
  %97 = load i64, i64* %select.ptr.16, align 8
  %98 = xor i64 %96, %97
  %99 = load i64, i64* %25, align 8
  %select.val.103 = select i1 %.cond, i64 %98, i64 %99
  store i64 %select.val.103, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %100 = load i64, i64* %select.ptr., align 8
  %101 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 5
  %102 = icmp sgt i64 %N, 5
  %safe.106 = or i1 %102, %.cond
  %select.ptr.107 = select i1 %safe.106, i64* %101, i64* %shadow
  %103 = load i64, i64* %select.ptr.107, align 8
  %104 = shl i64 %103, 16
  %105 = xor i64 %104, %100
  %106 = load i64, i64* %1, align 8
  %107 = select i1 %.cond, i64 %105, i64 0
  %select.val.108 = xor i64 %107, %106
  store i64 %select.val.108, i64* %1, align 8
  %108 = load i64, i64* %select.ptr.5, align 8
  %109 = load i64, i64* %select.ptr.7, align 8
  %110 = xor i64 %109, %108
  %111 = load i64, i64* %15, align 8
  %select.val.115 = select i1 %.cond, i64 %110, i64 %111
  store i64 %select.val.115, i64* %select.ptr.7, align 8
  %112 = load i64, i64* %select.ptr.12, align 8
  %113 = load i64, i64* %select.ptr.107, align 8
  %114 = xor i64 %113, %112
  %115 = load i64, i64* %select.ptr.16, align 8
  %116 = xor i64 %114, %115
  %117 = load i64, i64* %25, align 8
  %select.val.124 = select i1 %.cond, i64 %116, i64 %117
  store i64 %select.val.124, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %118 = load i64, i64* %select.ptr., align 8
  %119 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 6
  %120 = icmp sgt i64 %N, 6
  %safe.127 = or i1 %120, %.cond
  %select.ptr.128 = select i1 %safe.127, i64* %119, i64* %shadow
  %121 = load i64, i64* %select.ptr.128, align 8
  %122 = shl i64 %121, 16
  %123 = xor i64 %122, %118
  %124 = load i64, i64* %1, align 8
  %125 = select i1 %.cond, i64 %123, i64 0
  %select.val.129 = xor i64 %125, %124
  store i64 %select.val.129, i64* %1, align 8
  %126 = load i64, i64* %select.ptr.5, align 8
  %127 = load i64, i64* %select.ptr.7, align 8
  %128 = xor i64 %127, %126
  %129 = load i64, i64* %15, align 8
  %select.val.136 = select i1 %.cond, i64 %128, i64 %129
  store i64 %select.val.136, i64* %select.ptr.7, align 8
  %130 = load i64, i64* %select.ptr.12, align 8
  %131 = load i64, i64* %select.ptr.128, align 8
  %132 = xor i64 %131, %130
  %133 = load i64, i64* %select.ptr.16, align 8
  %134 = xor i64 %132, %133
  %135 = load i64, i64* %25, align 8
  %select.val.145 = select i1 %.cond, i64 %134, i64 %135
  store i64 %select.val.145, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %136 = load i64, i64* %select.ptr., align 8
  %137 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 7
  %138 = icmp sgt i64 %N, 7
  %safe.148 = or i1 %138, %.cond
  %select.ptr.149 = select i1 %safe.148, i64* %137, i64* %shadow
  %139 = load i64, i64* %select.ptr.149, align 8
  %140 = shl i64 %139, 16
  %141 = xor i64 %140, %136
  %142 = load i64, i64* %1, align 8
  %143 = select i1 %.cond, i64 %141, i64 0
  %select.val.150 = xor i64 %143, %142
  store i64 %select.val.150, i64* %1, align 8
  %144 = load i64, i64* %select.ptr.5, align 8
  %145 = load i64, i64* %select.ptr.7, align 8
  %146 = xor i64 %145, %144
  %147 = load i64, i64* %15, align 8
  %select.val.157 = select i1 %.cond, i64 %146, i64 %147
  store i64 %select.val.157, i64* %select.ptr.7, align 8
  %148 = load i64, i64* %select.ptr.12, align 8
  %149 = load i64, i64* %select.ptr.149, align 8
  %150 = xor i64 %149, %148
  %151 = load i64, i64* %select.ptr.16, align 8
  %152 = xor i64 %150, %151
  %153 = load i64, i64* %25, align 8
  %select.val.166 = select i1 %.cond, i64 %152, i64 %153
  store i64 %select.val.166, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %154 = load i64, i64* %select.ptr., align 8
  %155 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 8
  %156 = icmp sgt i64 %N, 8
  %safe.169 = or i1 %156, %.cond
  %select.ptr.170 = select i1 %safe.169, i64* %155, i64* %shadow
  %157 = load i64, i64* %select.ptr.170, align 8
  %158 = shl i64 %157, 16
  %159 = xor i64 %158, %154
  %160 = load i64, i64* %1, align 8
  %161 = select i1 %.cond, i64 %159, i64 0
  %select.val.171 = xor i64 %161, %160
  store i64 %select.val.171, i64* %1, align 8
  %162 = load i64, i64* %select.ptr.5, align 8
  %163 = load i64, i64* %select.ptr.7, align 8
  %164 = xor i64 %163, %162
  %165 = load i64, i64* %15, align 8
  %select.val.178 = select i1 %.cond, i64 %164, i64 %165
  store i64 %select.val.178, i64* %select.ptr.7, align 8
  %166 = load i64, i64* %select.ptr.12, align 8
  %167 = load i64, i64* %select.ptr.170, align 8
  %168 = xor i64 %167, %166
  %169 = load i64, i64* %select.ptr.16, align 8
  %170 = xor i64 %168, %169
  %171 = load i64, i64* %25, align 8
  %select.val.187 = select i1 %.cond, i64 %170, i64 %171
  store i64 %select.val.187, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %172 = load i64, i64* %select.ptr., align 8
  %173 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 9
  %174 = icmp sgt i64 %N, 9
  %safe.190 = or i1 %174, %.cond
  %select.ptr.191 = select i1 %safe.190, i64* %173, i64* %shadow
  %175 = load i64, i64* %select.ptr.191, align 8
  %176 = shl i64 %175, 16
  %177 = xor i64 %176, %172
  %178 = load i64, i64* %1, align 8
  %179 = select i1 %.cond, i64 %177, i64 0
  %select.val.192 = xor i64 %179, %178
  store i64 %select.val.192, i64* %1, align 8
  %180 = load i64, i64* %select.ptr.5, align 8
  %181 = load i64, i64* %select.ptr.7, align 8
  %182 = xor i64 %181, %180
  %183 = load i64, i64* %15, align 8
  %select.val.199 = select i1 %.cond, i64 %182, i64 %183
  store i64 %select.val.199, i64* %select.ptr.7, align 8
  %184 = load i64, i64* %select.ptr.12, align 8
  %185 = load i64, i64* %select.ptr.191, align 8
  %186 = xor i64 %185, %184
  %187 = load i64, i64* %select.ptr.16, align 8
  %188 = xor i64 %186, %187
  %189 = load i64, i64* %25, align 8
  %select.val.208 = select i1 %.cond, i64 %188, i64 %189
  store i64 %select.val.208, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %190 = load i64, i64* %select.ptr., align 8
  %191 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 10
  %192 = icmp sgt i64 %N, 10
  %safe.211 = or i1 %192, %.cond
  %select.ptr.212 = select i1 %safe.211, i64* %191, i64* %shadow
  %193 = load i64, i64* %select.ptr.212, align 8
  %194 = shl i64 %193, 16
  %195 = xor i64 %194, %190
  %196 = load i64, i64* %1, align 8
  %197 = select i1 %.cond, i64 %195, i64 0
  %select.val.213 = xor i64 %197, %196
  store i64 %select.val.213, i64* %1, align 8
  %198 = load i64, i64* %select.ptr.5, align 8
  %199 = load i64, i64* %select.ptr.7, align 8
  %200 = xor i64 %199, %198
  %201 = load i64, i64* %15, align 8
  %select.val.220 = select i1 %.cond, i64 %200, i64 %201
  store i64 %select.val.220, i64* %select.ptr.7, align 8
  %202 = load i64, i64* %select.ptr.12, align 8
  %203 = load i64, i64* %select.ptr.212, align 8
  %204 = xor i64 %203, %202
  %205 = load i64, i64* %select.ptr.16, align 8
  %206 = xor i64 %204, %205
  %207 = load i64, i64* %25, align 8
  %select.val.229 = select i1 %.cond, i64 %206, i64 %207
  store i64 %select.val.229, i64* %select.ptr.16, align 8
  call void @rho(i64* nonnull %1, i64 %N1, i1 %.cond)
  %208 = load i64, i64* %select.ptr., align 8
  %209 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 11
  %210 = icmp sgt i64 %N, 11
  %safe.232 = or i1 %210, %.cond
  %select.ptr.233 = select i1 %safe.232, i64* %209, i64* %shadow
  %211 = load i64, i64* %select.ptr.233, align 8
  %212 = shl i64 %211, 16
  %213 = xor i64 %212, %208
  %214 = load i64, i64* %1, align 8
  %215 = select i1 %.cond, i64 %213, i64 0
  %select.val.234 = xor i64 %215, %214
  store i64 %select.val.234, i64* %1, align 8
  %216 = load i64, i64* %select.ptr.5, align 8
  %217 = load i64, i64* %select.ptr.7, align 8
  %218 = xor i64 %217, %216
  %219 = load i64, i64* %15, align 8
  %select.val.241 = select i1 %.cond, i64 %218, i64 %219
  store i64 %select.val.241, i64* %select.ptr.7, align 8
  %220 = load i64, i64* %select.ptr.12, align 8
  %221 = load i64, i64* %select.ptr.233, align 8
  %222 = xor i64 %221, %220
  %223 = load i64, i64* %select.ptr.16, align 8
  %224 = xor i64 %222, %223
  %225 = load i64, i64* %25, align 8
  %select.val.250 = select i1 %.cond, i64 %224, i64 %225
  store i64 %select.val.250, i64* %select.ptr.16, align 8
  %shadow.i.0.sroa_cast383 = bitcast i64* %shadow.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %shadow.i.0.sroa_cast383)
  %226 = icmp sgt i64 %N1, 0
  %safe..i = or i1 %226, %.cond
  %select.ptr..i = select i1 %safe..i, i64* %1, i64* %shadow.i
  %227 = load i64, i64* %select.ptr..i, align 8
  %228 = lshr i64 %227, 16
  %229 = xor i64 %228, %227
  %select.ptr.4.i = select i1 %safe.6, i64* %15, i64* %shadow.i
  %230 = load i64, i64* %select.ptr.4.i, align 8
  %231 = shl i64 %230, 16
  %232 = lshr i64 %230, 16
  %select.ptr.8.i = select i1 %safe.15, i64* %25, i64* %shadow.i
  %233 = load i64, i64* %select.ptr.8.i, align 8
  %234 = shl i64 %233, 16
  %235 = lshr i64 %230, 24
  %236 = shl i64 %233, 8
  %237 = lshr i64 %233, 8
  %238 = shl i64 %227, 24
  %239 = lshr i64 %233, 16
  %240 = shl i64 %227, 16
  %241 = lshr i64 %233, 24
  %242 = shl i64 %227, 8
  %243 = xor i64 %229, %238
  %244 = xor i64 %243, %240
  %245 = xor i64 %244, %242
  %246 = xor i64 %245, %231
  %247 = xor i64 %246, %232
  %248 = xor i64 %247, %235
  %249 = xor i64 %248, %234
  %250 = xor i64 %249, %236
  %251 = xor i64 %250, %237
  %252 = xor i64 %251, %239
  %253 = xor i64 %252, %241
  %254 = lshr i64 %227, 8
  %255 = shl i64 %230, 24
  %256 = lshr i64 %227, 24
  %257 = shl i64 %230, 8
  %258 = xor i64 %240, %230
  %259 = xor i64 %258, %242
  %260 = xor i64 %259, %254
  %261 = xor i64 %260, %228
  %262 = xor i64 %261, %256
  %263 = xor i64 %262, %232
  %264 = xor i64 %263, %255
  %265 = xor i64 %264, %231
  %266 = xor i64 %265, %257
  %267 = xor i64 %266, %234
  %268 = xor i64 %267, %239
  %269 = xor i64 %268, %241
  %270 = lshr i64 %230, 8
  %271 = shl i64 %233, 24
  %272 = xor i64 %228, %240
  %273 = xor i64 %272, %256
  %274 = xor i64 %273, %233
  %275 = xor i64 %274, %231
  %276 = xor i64 %275, %257
  %277 = xor i64 %276, %270
  %278 = xor i64 %277, %232
  %279 = xor i64 %278, %235
  %280 = xor i64 %279, %239
  %281 = xor i64 %280, %271
  %282 = xor i64 %281, %234
  %283 = xor i64 %282, %236
  %284 = load i64, i64* %1, align 8
  %select.val.89.i = select i1 %.cond, i64 %253, i64 %284
  store i64 %select.val.89.i, i64* %select.ptr..i, align 8
  %285 = load i64, i64* %15, align 8
  %select.val.94.i = select i1 %.cond, i64 %269, i64 %285
  store i64 %select.val.94.i, i64* %select.ptr.4.i, align 8
  %286 = load i64, i64* %25, align 8
  %select.val.99.i = select i1 %.cond, i64 %283, i64 %286
  store i64 %select.val.99.i, i64* %select.ptr.8.i, align 8
  %shadow.i.0.sroa_cast384 = bitcast i64* %shadow.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %shadow.i.0.sroa_cast384)
  call void @mu(i64* nonnull %1, i64 %N1, i1 %.cond)
  ret void
}

; Function Attrs: nofree norecurse nounwind
define void @twy_key(%struct.twy_ctx* %0, i64 %N, i64* nocapture readonly %1, i64 %N1) local_unnamed_addr #3 {
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
  %14 = load i64, i64* %5, align 8
  %15 = lshr i64 %14, 16
  %16 = xor i64 %15, %14
  %17 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 1, i64 1
  %18 = load i64, i64* %17, align 8
  %19 = shl i64 %18, 16
  %20 = lshr i64 %18, 16
  %21 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 1, i64 2
  %22 = load i64, i64* %21, align 8
  %23 = shl i64 %22, 16
  %24 = lshr i64 %18, 24
  %25 = shl i64 %22, 8
  %26 = lshr i64 %22, 8
  %27 = shl i64 %14, 24
  %28 = lshr i64 %22, 16
  %29 = shl i64 %14, 16
  %30 = lshr i64 %22, 24
  %31 = shl i64 %14, 8
  %32 = xor i64 %16, %27
  %33 = xor i64 %32, %29
  %34 = xor i64 %33, %31
  %35 = xor i64 %34, %19
  %36 = xor i64 %35, %20
  %37 = xor i64 %36, %24
  %38 = xor i64 %37, %23
  %39 = xor i64 %38, %25
  %40 = xor i64 %39, %26
  %41 = xor i64 %40, %28
  %42 = xor i64 %41, %30
  %43 = lshr i64 %14, 8
  %44 = shl i64 %18, 24
  %45 = lshr i64 %14, 24
  %46 = shl i64 %18, 8
  %47 = xor i64 %29, %18
  %48 = xor i64 %47, %31
  %49 = xor i64 %48, %43
  %50 = xor i64 %49, %15
  %51 = xor i64 %50, %45
  %52 = xor i64 %51, %20
  %53 = xor i64 %52, %44
  %54 = xor i64 %53, %19
  %55 = xor i64 %54, %46
  %56 = xor i64 %55, %23
  %57 = xor i64 %56, %28
  %58 = xor i64 %57, %30
  %59 = lshr i64 %18, 8
  %60 = shl i64 %22, 24
  %61 = xor i64 %15, %29
  %62 = xor i64 %61, %45
  %63 = xor i64 %62, %22
  %64 = xor i64 %63, %19
  %65 = xor i64 %64, %46
  %66 = xor i64 %65, %59
  %67 = xor i64 %66, %20
  %68 = xor i64 %67, %24
  %69 = xor i64 %68, %28
  %70 = xor i64 %69, %60
  %71 = xor i64 %70, %23
  %72 = xor i64 %71, %25
  store i64 %42, i64* %5, align 8
  store i64 %58, i64* %17, align 8
  store i64 %72, i64* %21, align 8
  call void @mu(i64* nonnull %5, i64 %N, i1 true)
  %73 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 0
  store i64 2827, i64* %73, align 8
  %74 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 1
  store i64 5654, i64* %74, align 8
  %75 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 2
  store i64 11308, i64* %75, align 8
  %76 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 3
  store i64 22616, i64* %76, align 8
  %77 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 4
  store i64 45232, i64* %77, align 8
  %78 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 5
  store i64 29041, i64* %78, align 8
  %79 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 6
  store i64 58082, i64* %79, align 8
  %80 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 7
  store i64 54741, i64* %80, align 8
  %81 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 8
  store i64 48059, i64* %81, align 8
  %82 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 9
  store i64 26471, i64* %82, align 8
  %83 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 10
  store i64 52942, i64* %83, align 8
  %84 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 2, i64 11
  store i64 36237, i64* %84, align 8
  %85 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 0
  store i64 45489, i64* %85, align 8
  %86 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 1
  store i64 29555, i64* %86, align 8
  %87 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 2
  store i64 59110, i64* %87, align 8
  %88 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 3
  store i64 56797, i64* %88, align 8
  %89 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 4
  store i64 43947, i64* %89, align 8
  %90 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 5
  store i64 18247, i64* %90, align 8
  %91 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 6
  store i64 36494, i64* %91, align 8
  %92 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 7
  store i64 3341, i64* %92, align 8
  %93 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 8
  store i64 6682, i64* %93, align 8
  %94 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 9
  store i64 13364, i64* %94, align 8
  %95 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 10
  store i64 26728, i64* %95, align 8
  %96 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %0, i64 0, i32 3, i64 11
  store i64 53456, i64* %96, align 8
  ret void
}

; Function Attrs: nounwind
define void @twy_enc(%struct.twy_ctx* nocapture readonly %0, i64 %N, i64* %1, i64 %N1, i32 %2) local_unnamed_addr #4 {
  %4 = icmp sgt i32 %2, 0
  call void @encrypt(%struct.twy_ctx* %0, i64 %N, i64* %1, i64 %N1, i1 %4)
  %5 = getelementptr inbounds i64, i64* %1, i64 3
  %select.phi. = select i1 %4, i64* %5, i64* %1
  %6 = icmp sgt i32 %2, 1
  call void @encrypt(%struct.twy_ctx* %0, i64 %N, i64* %select.phi., i64 %N1, i1 %6)
  %7 = getelementptr inbounds i64, i64* %select.phi., i64 3
  %select.phi.2 = select i1 %6, i64* %7, i64* %select.phi.
  %8 = icmp sgt i32 %2, 2
  call void @encrypt(%struct.twy_ctx* %0, i64 %N, i64* %select.phi.2, i64 %N1, i1 %8)
  ret void
}

; Function Attrs: nounwind
define void @twy_dec(%struct.twy_ctx* nocapture readonly %0, i64 %N, i64* %1, i64 %N1, i32 %2) local_unnamed_addr #4 {
  %4 = icmp sgt i32 %2, 0
  call void @decrypt(%struct.twy_ctx* %0, i64 %N, i64* %1, i64 %N1, i1 %4)
  %5 = getelementptr inbounds i64, i64* %1, i64 3
  %select.phi. = select i1 %4, i64* %5, i64* %1
  %6 = icmp sgt i32 %2, 1
  call void @decrypt(%struct.twy_ctx* %0, i64 %N, i64* %select.phi., i64 %N1, i1 %6)
  %7 = getelementptr inbounds i64, i64* %select.phi., i64 3
  %select.phi.2 = select i1 %6, i64* %7, i64* %select.phi.
  %8 = icmp sgt i32 %2, 2
  call void @decrypt(%struct.twy_ctx* %0, i64 %N, i64* %select.phi.2, i64 %N1, i1 %8)
  ret void
}

; Function Attrs: nofree norecurse nounwind writeonly
define void @twy_destroy(%struct.twy_ctx* nocapture %0, i64 %N) local_unnamed_addr #5 {
  %2 = bitcast %struct.twy_ctx* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(48) %2, i8 0, i64 48, i1 false)
  ret void
}

; Function Attrs: nofree nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #0

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #6

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #6

attributes #0 = { nofree nounwind }
attributes #1 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree norecurse nounwind }
attributes #4 = { nounwind }
attributes #5 = { nofree norecurse nounwind writeonly }
attributes #6 = { argmemonly nounwind willreturn }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}

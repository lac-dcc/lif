; ModuleID = 'llvm-ir/salsa20.ll'
source_filename = "lib/salsa20.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.uint8ptr_wrapped_ty = type { i8*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [14 x i8] c"lib/salsa20.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [9 x i8] c"nowrap:0\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [17 x i8] c"m->len == c->len\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"lib/salsa20.c\00", align 1
@__PRETTY_FUNCTION__._crypto_stream_salsa20_xor_ic = private unnamed_addr constant [116 x i8] c"int32_t _crypto_stream_salsa20_xor_ic(uint8ptr_wrapped_ty *, uint8ptr_wrapped_ty *, uint8_t *, uint64_t, uint8_t *)\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"nowrap:0,1\00", section "llvm.metadata"
@llvm.global.annotations = appending global [2 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (%struct.uint8ptr_wrapped_ty*, i8*, i8*)* @_crypto_stream_salsa20 to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 111, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, i8*, i64, i8*)* @_crypto_stream_salsa20_xor_ic to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 154, i8* null }], section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @_crypto_core_salsa20(i8* noundef %output, i8* noundef %input, i8* noundef %k) #0 {
entry:
  %output.addr = alloca i8*, align 8
  %input.addr = alloca i8*, align 8
  %k.addr = alloca i8*, align 8
  %x0 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %j0 = alloca i32, align 4
  %j5 = alloca i32, align 4
  %j10 = alloca i32, align 4
  %j15 = alloca i32, align 4
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %j1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %j3 = alloca i32, align 4
  %j4 = alloca i32, align 4
  %j11 = alloca i32, align 4
  %j12 = alloca i32, align 4
  %j13 = alloca i32, align 4
  %j14 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %j6 = alloca i32, align 4
  %j7 = alloca i32, align 4
  %j8 = alloca i32, align 4
  %j9 = alloca i32, align 4
  store i8* %output, i8** %output.addr, align 8
  %output.addr1 = bitcast i8** %output.addr to i8*
  call void @llvm.var.annotation(i8* %output.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 15, i8* null)
  store i8* %input, i8** %input.addr, align 8
  %input.addr2 = bitcast i8** %input.addr to i8*
  call void @llvm.var.annotation(i8* %input.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 16, i8* null)
  store i8* %k, i8** %k.addr, align 8
  %k.addr3 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 17, i8* null)
  %x04 = bitcast i32* %x0 to i8*
  call void @llvm.var.annotation(i8* %x04, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 19, i8* null)
  store i32 1634760805, i32* %x0, align 4
  %x55 = bitcast i32* %x5 to i8*
  call void @llvm.var.annotation(i8* %x55, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 20, i8* null)
  store i32 857760878, i32* %x5, align 4
  %x106 = bitcast i32* %x10 to i8*
  call void @llvm.var.annotation(i8* %x106, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 21, i8* null)
  store i32 2036477234, i32* %x10, align 4
  %x157 = bitcast i32* %x15 to i8*
  call void @llvm.var.annotation(i8* %x157, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 22, i8* null)
  store i32 1797285236, i32* %x15, align 4
  %j08 = bitcast i32* %j0 to i8*
  call void @llvm.var.annotation(i8* %j08, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 24, i8* null)
  %0 = load i32, i32* %x0, align 4
  store i32 %0, i32* %j0, align 4
  %j59 = bitcast i32* %j5 to i8*
  call void @llvm.var.annotation(i8* %j59, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 25, i8* null)
  %1 = load i32, i32* %x5, align 4
  store i32 %1, i32* %j5, align 4
  %j1010 = bitcast i32* %j10 to i8*
  call void @llvm.var.annotation(i8* %j1010, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 26, i8* null)
  %2 = load i32, i32* %x10, align 4
  store i32 %2, i32* %j10, align 4
  %j1511 = bitcast i32* %j15 to i8*
  call void @llvm.var.annotation(i8* %j1511, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 27, i8* null)
  %3 = load i32, i32* %x15, align 4
  store i32 %3, i32* %j15, align 4
  %x112 = bitcast i32* %x1 to i8*
  call void @llvm.var.annotation(i8* %x112, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 29, i8* null)
  %4 = load i8*, i8** %k.addr, align 8
  %call = call i32 @load32_le(i8* noundef %4)
  store i32 %call, i32* %x1, align 4
  %x213 = bitcast i32* %x2 to i8*
  call void @llvm.var.annotation(i8* %x213, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 30, i8* null)
  %5 = load i8*, i8** %k.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 4
  %call14 = call i32 @load32_le(i8* noundef %add.ptr)
  store i32 %call14, i32* %x2, align 4
  %x315 = bitcast i32* %x3 to i8*
  call void @llvm.var.annotation(i8* %x315, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 31, i8* null)
  %6 = load i8*, i8** %k.addr, align 8
  %add.ptr16 = getelementptr inbounds i8, i8* %6, i64 8
  %call17 = call i32 @load32_le(i8* noundef %add.ptr16)
  store i32 %call17, i32* %x3, align 4
  %x418 = bitcast i32* %x4 to i8*
  call void @llvm.var.annotation(i8* %x418, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 32, i8* null)
  %7 = load i8*, i8** %k.addr, align 8
  %add.ptr19 = getelementptr inbounds i8, i8* %7, i64 12
  %call20 = call i32 @load32_le(i8* noundef %add.ptr19)
  store i32 %call20, i32* %x4, align 4
  %x1121 = bitcast i32* %x11 to i8*
  call void @llvm.var.annotation(i8* %x1121, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 34, i8* null)
  %8 = load i8*, i8** %k.addr, align 8
  %add.ptr22 = getelementptr inbounds i8, i8* %8, i64 16
  %call23 = call i32 @load32_le(i8* noundef %add.ptr22)
  store i32 %call23, i32* %x11, align 4
  %x1224 = bitcast i32* %x12 to i8*
  call void @llvm.var.annotation(i8* %x1224, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 35, i8* null)
  %9 = load i8*, i8** %k.addr, align 8
  %add.ptr25 = getelementptr inbounds i8, i8* %9, i64 20
  %call26 = call i32 @load32_le(i8* noundef %add.ptr25)
  store i32 %call26, i32* %x12, align 4
  %x1327 = bitcast i32* %x13 to i8*
  call void @llvm.var.annotation(i8* %x1327, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 36, i8* null)
  %10 = load i8*, i8** %k.addr, align 8
  %add.ptr28 = getelementptr inbounds i8, i8* %10, i64 24
  %call29 = call i32 @load32_le(i8* noundef %add.ptr28)
  store i32 %call29, i32* %x13, align 4
  %x1430 = bitcast i32* %x14 to i8*
  call void @llvm.var.annotation(i8* %x1430, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 37, i8* null)
  %11 = load i8*, i8** %k.addr, align 8
  %add.ptr31 = getelementptr inbounds i8, i8* %11, i64 28
  %call32 = call i32 @load32_le(i8* noundef %add.ptr31)
  store i32 %call32, i32* %x14, align 4
  %j133 = bitcast i32* %j1 to i8*
  call void @llvm.var.annotation(i8* %j133, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 39, i8* null)
  %12 = load i32, i32* %x1, align 4
  store i32 %12, i32* %j1, align 4
  %j234 = bitcast i32* %j2 to i8*
  call void @llvm.var.annotation(i8* %j234, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 40, i8* null)
  %13 = load i32, i32* %x2, align 4
  store i32 %13, i32* %j2, align 4
  %j335 = bitcast i32* %j3 to i8*
  call void @llvm.var.annotation(i8* %j335, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 41, i8* null)
  %14 = load i32, i32* %x3, align 4
  store i32 %14, i32* %j3, align 4
  %j436 = bitcast i32* %j4 to i8*
  call void @llvm.var.annotation(i8* %j436, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 42, i8* null)
  %15 = load i32, i32* %x4, align 4
  store i32 %15, i32* %j4, align 4
  %j1137 = bitcast i32* %j11 to i8*
  call void @llvm.var.annotation(i8* %j1137, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 43, i8* null)
  %16 = load i32, i32* %x11, align 4
  store i32 %16, i32* %j11, align 4
  %j1238 = bitcast i32* %j12 to i8*
  call void @llvm.var.annotation(i8* %j1238, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 44, i8* null)
  %17 = load i32, i32* %x12, align 4
  store i32 %17, i32* %j12, align 4
  %j1339 = bitcast i32* %j13 to i8*
  call void @llvm.var.annotation(i8* %j1339, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 45, i8* null)
  %18 = load i32, i32* %x13, align 4
  store i32 %18, i32* %j13, align 4
  %j1440 = bitcast i32* %j14 to i8*
  call void @llvm.var.annotation(i8* %j1440, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 46, i8* null)
  %19 = load i32, i32* %x14, align 4
  store i32 %19, i32* %j14, align 4
  %x641 = bitcast i32* %x6 to i8*
  call void @llvm.var.annotation(i8* %x641, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 48, i8* null)
  %20 = load i8*, i8** %input.addr, align 8
  %call42 = call i32 @load32_le(i8* noundef %20)
  store i32 %call42, i32* %x6, align 4
  %x743 = bitcast i32* %x7 to i8*
  call void @llvm.var.annotation(i8* %x743, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 49, i8* null)
  %21 = load i8*, i8** %input.addr, align 8
  %add.ptr44 = getelementptr inbounds i8, i8* %21, i64 4
  %call45 = call i32 @load32_le(i8* noundef %add.ptr44)
  store i32 %call45, i32* %x7, align 4
  %x846 = bitcast i32* %x8 to i8*
  call void @llvm.var.annotation(i8* %x846, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 50, i8* null)
  %22 = load i8*, i8** %input.addr, align 8
  %add.ptr47 = getelementptr inbounds i8, i8* %22, i64 8
  %call48 = call i32 @load32_le(i8* noundef %add.ptr47)
  store i32 %call48, i32* %x8, align 4
  %x949 = bitcast i32* %x9 to i8*
  call void @llvm.var.annotation(i8* %x949, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 51, i8* null)
  %23 = load i8*, i8** %input.addr, align 8
  %add.ptr50 = getelementptr inbounds i8, i8* %23, i64 12
  %call51 = call i32 @load32_le(i8* noundef %add.ptr50)
  store i32 %call51, i32* %x9, align 4
  %j652 = bitcast i32* %j6 to i8*
  call void @llvm.var.annotation(i8* %j652, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 53, i8* null)
  %24 = load i32, i32* %x6, align 4
  store i32 %24, i32* %j6, align 4
  %j753 = bitcast i32* %j7 to i8*
  call void @llvm.var.annotation(i8* %j753, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 54, i8* null)
  %25 = load i32, i32* %x7, align 4
  store i32 %25, i32* %j7, align 4
  %j854 = bitcast i32* %j8 to i8*
  call void @llvm.var.annotation(i8* %j854, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 55, i8* null)
  %26 = load i32, i32* %x8, align 4
  store i32 %26, i32* %j8, align 4
  %j955 = bitcast i32* %j9 to i8*
  call void @llvm.var.annotation(i8* %j955, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 56, i8* null)
  %27 = load i32, i32* %x9, align 4
  store i32 %27, i32* %j9, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp ult i32 %i.0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %28 = load i32, i32* %x0, align 4
  %29 = load i32, i32* %x12, align 4
  %add = add i32 %28, %29
  %call56 = call i32 @rotl32(i32 noundef %add, i32 noundef 7)
  %30 = load i32, i32* %x4, align 4
  %xor = xor i32 %30, %call56
  store i32 %xor, i32* %x4, align 4
  %31 = load i32, i32* %x4, align 4
  %32 = load i32, i32* %x0, align 4
  %add57 = add i32 %31, %32
  %call58 = call i32 @rotl32(i32 noundef %add57, i32 noundef 9)
  %33 = load i32, i32* %x8, align 4
  %xor59 = xor i32 %33, %call58
  store i32 %xor59, i32* %x8, align 4
  %34 = load i32, i32* %x8, align 4
  %35 = load i32, i32* %x4, align 4
  %add60 = add i32 %34, %35
  %call61 = call i32 @rotl32(i32 noundef %add60, i32 noundef 13)
  %36 = load i32, i32* %x12, align 4
  %xor62 = xor i32 %36, %call61
  store i32 %xor62, i32* %x12, align 4
  %37 = load i32, i32* %x12, align 4
  %38 = load i32, i32* %x8, align 4
  %add63 = add i32 %37, %38
  %call64 = call i32 @rotl32(i32 noundef %add63, i32 noundef 18)
  %39 = load i32, i32* %x0, align 4
  %xor65 = xor i32 %39, %call64
  store i32 %xor65, i32* %x0, align 4
  %40 = load i32, i32* %x5, align 4
  %41 = load i32, i32* %x1, align 4
  %add66 = add i32 %40, %41
  %call67 = call i32 @rotl32(i32 noundef %add66, i32 noundef 7)
  %42 = load i32, i32* %x9, align 4
  %xor68 = xor i32 %42, %call67
  store i32 %xor68, i32* %x9, align 4
  %43 = load i32, i32* %x9, align 4
  %44 = load i32, i32* %x5, align 4
  %add69 = add i32 %43, %44
  %call70 = call i32 @rotl32(i32 noundef %add69, i32 noundef 9)
  %45 = load i32, i32* %x13, align 4
  %xor71 = xor i32 %45, %call70
  store i32 %xor71, i32* %x13, align 4
  %46 = load i32, i32* %x13, align 4
  %47 = load i32, i32* %x9, align 4
  %add72 = add i32 %46, %47
  %call73 = call i32 @rotl32(i32 noundef %add72, i32 noundef 13)
  %48 = load i32, i32* %x1, align 4
  %xor74 = xor i32 %48, %call73
  store i32 %xor74, i32* %x1, align 4
  %49 = load i32, i32* %x1, align 4
  %50 = load i32, i32* %x13, align 4
  %add75 = add i32 %49, %50
  %call76 = call i32 @rotl32(i32 noundef %add75, i32 noundef 18)
  %51 = load i32, i32* %x5, align 4
  %xor77 = xor i32 %51, %call76
  store i32 %xor77, i32* %x5, align 4
  %52 = load i32, i32* %x10, align 4
  %53 = load i32, i32* %x6, align 4
  %add78 = add i32 %52, %53
  %call79 = call i32 @rotl32(i32 noundef %add78, i32 noundef 7)
  %54 = load i32, i32* %x14, align 4
  %xor80 = xor i32 %54, %call79
  store i32 %xor80, i32* %x14, align 4
  %55 = load i32, i32* %x14, align 4
  %56 = load i32, i32* %x10, align 4
  %add81 = add i32 %55, %56
  %call82 = call i32 @rotl32(i32 noundef %add81, i32 noundef 9)
  %57 = load i32, i32* %x2, align 4
  %xor83 = xor i32 %57, %call82
  store i32 %xor83, i32* %x2, align 4
  %58 = load i32, i32* %x2, align 4
  %59 = load i32, i32* %x14, align 4
  %add84 = add i32 %58, %59
  %call85 = call i32 @rotl32(i32 noundef %add84, i32 noundef 13)
  %60 = load i32, i32* %x6, align 4
  %xor86 = xor i32 %60, %call85
  store i32 %xor86, i32* %x6, align 4
  %61 = load i32, i32* %x6, align 4
  %62 = load i32, i32* %x2, align 4
  %add87 = add i32 %61, %62
  %call88 = call i32 @rotl32(i32 noundef %add87, i32 noundef 18)
  %63 = load i32, i32* %x10, align 4
  %xor89 = xor i32 %63, %call88
  store i32 %xor89, i32* %x10, align 4
  %64 = load i32, i32* %x15, align 4
  %65 = load i32, i32* %x11, align 4
  %add90 = add i32 %64, %65
  %call91 = call i32 @rotl32(i32 noundef %add90, i32 noundef 7)
  %66 = load i32, i32* %x3, align 4
  %xor92 = xor i32 %66, %call91
  store i32 %xor92, i32* %x3, align 4
  %67 = load i32, i32* %x3, align 4
  %68 = load i32, i32* %x15, align 4
  %add93 = add i32 %67, %68
  %call94 = call i32 @rotl32(i32 noundef %add93, i32 noundef 9)
  %69 = load i32, i32* %x7, align 4
  %xor95 = xor i32 %69, %call94
  store i32 %xor95, i32* %x7, align 4
  %70 = load i32, i32* %x7, align 4
  %71 = load i32, i32* %x3, align 4
  %add96 = add i32 %70, %71
  %call97 = call i32 @rotl32(i32 noundef %add96, i32 noundef 13)
  %72 = load i32, i32* %x11, align 4
  %xor98 = xor i32 %72, %call97
  store i32 %xor98, i32* %x11, align 4
  %73 = load i32, i32* %x11, align 4
  %74 = load i32, i32* %x7, align 4
  %add99 = add i32 %73, %74
  %call100 = call i32 @rotl32(i32 noundef %add99, i32 noundef 18)
  %75 = load i32, i32* %x15, align 4
  %xor101 = xor i32 %75, %call100
  store i32 %xor101, i32* %x15, align 4
  %76 = load i32, i32* %x0, align 4
  %77 = load i32, i32* %x3, align 4
  %add102 = add i32 %76, %77
  %call103 = call i32 @rotl32(i32 noundef %add102, i32 noundef 7)
  %78 = load i32, i32* %x1, align 4
  %xor104 = xor i32 %78, %call103
  store i32 %xor104, i32* %x1, align 4
  %79 = load i32, i32* %x1, align 4
  %80 = load i32, i32* %x0, align 4
  %add105 = add i32 %79, %80
  %call106 = call i32 @rotl32(i32 noundef %add105, i32 noundef 9)
  %81 = load i32, i32* %x2, align 4
  %xor107 = xor i32 %81, %call106
  store i32 %xor107, i32* %x2, align 4
  %82 = load i32, i32* %x2, align 4
  %83 = load i32, i32* %x1, align 4
  %add108 = add i32 %82, %83
  %call109 = call i32 @rotl32(i32 noundef %add108, i32 noundef 13)
  %84 = load i32, i32* %x3, align 4
  %xor110 = xor i32 %84, %call109
  store i32 %xor110, i32* %x3, align 4
  %85 = load i32, i32* %x3, align 4
  %86 = load i32, i32* %x2, align 4
  %add111 = add i32 %85, %86
  %call112 = call i32 @rotl32(i32 noundef %add111, i32 noundef 18)
  %87 = load i32, i32* %x0, align 4
  %xor113 = xor i32 %87, %call112
  store i32 %xor113, i32* %x0, align 4
  %88 = load i32, i32* %x5, align 4
  %89 = load i32, i32* %x4, align 4
  %add114 = add i32 %88, %89
  %call115 = call i32 @rotl32(i32 noundef %add114, i32 noundef 7)
  %90 = load i32, i32* %x6, align 4
  %xor116 = xor i32 %90, %call115
  store i32 %xor116, i32* %x6, align 4
  %91 = load i32, i32* %x6, align 4
  %92 = load i32, i32* %x5, align 4
  %add117 = add i32 %91, %92
  %call118 = call i32 @rotl32(i32 noundef %add117, i32 noundef 9)
  %93 = load i32, i32* %x7, align 4
  %xor119 = xor i32 %93, %call118
  store i32 %xor119, i32* %x7, align 4
  %94 = load i32, i32* %x7, align 4
  %95 = load i32, i32* %x6, align 4
  %add120 = add i32 %94, %95
  %call121 = call i32 @rotl32(i32 noundef %add120, i32 noundef 13)
  %96 = load i32, i32* %x4, align 4
  %xor122 = xor i32 %96, %call121
  store i32 %xor122, i32* %x4, align 4
  %97 = load i32, i32* %x4, align 4
  %98 = load i32, i32* %x7, align 4
  %add123 = add i32 %97, %98
  %call124 = call i32 @rotl32(i32 noundef %add123, i32 noundef 18)
  %99 = load i32, i32* %x5, align 4
  %xor125 = xor i32 %99, %call124
  store i32 %xor125, i32* %x5, align 4
  %100 = load i32, i32* %x10, align 4
  %101 = load i32, i32* %x9, align 4
  %add126 = add i32 %100, %101
  %call127 = call i32 @rotl32(i32 noundef %add126, i32 noundef 7)
  %102 = load i32, i32* %x11, align 4
  %xor128 = xor i32 %102, %call127
  store i32 %xor128, i32* %x11, align 4
  %103 = load i32, i32* %x11, align 4
  %104 = load i32, i32* %x10, align 4
  %add129 = add i32 %103, %104
  %call130 = call i32 @rotl32(i32 noundef %add129, i32 noundef 9)
  %105 = load i32, i32* %x8, align 4
  %xor131 = xor i32 %105, %call130
  store i32 %xor131, i32* %x8, align 4
  %106 = load i32, i32* %x8, align 4
  %107 = load i32, i32* %x11, align 4
  %add132 = add i32 %106, %107
  %call133 = call i32 @rotl32(i32 noundef %add132, i32 noundef 13)
  %108 = load i32, i32* %x9, align 4
  %xor134 = xor i32 %108, %call133
  store i32 %xor134, i32* %x9, align 4
  %109 = load i32, i32* %x9, align 4
  %110 = load i32, i32* %x8, align 4
  %add135 = add i32 %109, %110
  %call136 = call i32 @rotl32(i32 noundef %add135, i32 noundef 18)
  %111 = load i32, i32* %x10, align 4
  %xor137 = xor i32 %111, %call136
  store i32 %xor137, i32* %x10, align 4
  %112 = load i32, i32* %x15, align 4
  %113 = load i32, i32* %x14, align 4
  %add138 = add i32 %112, %113
  %call139 = call i32 @rotl32(i32 noundef %add138, i32 noundef 7)
  %114 = load i32, i32* %x12, align 4
  %xor140 = xor i32 %114, %call139
  store i32 %xor140, i32* %x12, align 4
  %115 = load i32, i32* %x12, align 4
  %116 = load i32, i32* %x15, align 4
  %add141 = add i32 %115, %116
  %call142 = call i32 @rotl32(i32 noundef %add141, i32 noundef 9)
  %117 = load i32, i32* %x13, align 4
  %xor143 = xor i32 %117, %call142
  store i32 %xor143, i32* %x13, align 4
  %118 = load i32, i32* %x13, align 4
  %119 = load i32, i32* %x12, align 4
  %add144 = add i32 %118, %119
  %call145 = call i32 @rotl32(i32 noundef %add144, i32 noundef 13)
  %120 = load i32, i32* %x14, align 4
  %xor146 = xor i32 %120, %call145
  store i32 %xor146, i32* %x14, align 4
  %121 = load i32, i32* %x14, align 4
  %122 = load i32, i32* %x13, align 4
  %add147 = add i32 %121, %122
  %call148 = call i32 @rotl32(i32 noundef %add147, i32 noundef 18)
  %123 = load i32, i32* %x15, align 4
  %xor149 = xor i32 %123, %call148
  store i32 %xor149, i32* %x15, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %124 = load i8*, i8** %output.addr, align 8
  %125 = load i32, i32* %x0, align 4
  %126 = load i32, i32* %j0, align 4
  %add150 = add i32 %125, %126
  call void @store32_le(i8* noundef %124, i32 noundef %add150)
  %127 = load i8*, i8** %output.addr, align 8
  %add.ptr151 = getelementptr inbounds i8, i8* %127, i64 4
  %128 = load i32, i32* %x1, align 4
  %129 = load i32, i32* %j1, align 4
  %add152 = add i32 %128, %129
  call void @store32_le(i8* noundef %add.ptr151, i32 noundef %add152)
  %130 = load i8*, i8** %output.addr, align 8
  %add.ptr153 = getelementptr inbounds i8, i8* %130, i64 8
  %131 = load i32, i32* %x2, align 4
  %132 = load i32, i32* %j2, align 4
  %add154 = add i32 %131, %132
  call void @store32_le(i8* noundef %add.ptr153, i32 noundef %add154)
  %133 = load i8*, i8** %output.addr, align 8
  %add.ptr155 = getelementptr inbounds i8, i8* %133, i64 12
  %134 = load i32, i32* %x3, align 4
  %135 = load i32, i32* %j3, align 4
  %add156 = add i32 %134, %135
  call void @store32_le(i8* noundef %add.ptr155, i32 noundef %add156)
  %136 = load i8*, i8** %output.addr, align 8
  %add.ptr157 = getelementptr inbounds i8, i8* %136, i64 16
  %137 = load i32, i32* %x4, align 4
  %138 = load i32, i32* %j4, align 4
  %add158 = add i32 %137, %138
  call void @store32_le(i8* noundef %add.ptr157, i32 noundef %add158)
  %139 = load i8*, i8** %output.addr, align 8
  %add.ptr159 = getelementptr inbounds i8, i8* %139, i64 20
  %140 = load i32, i32* %x5, align 4
  %141 = load i32, i32* %j5, align 4
  %add160 = add i32 %140, %141
  call void @store32_le(i8* noundef %add.ptr159, i32 noundef %add160)
  %142 = load i8*, i8** %output.addr, align 8
  %add.ptr161 = getelementptr inbounds i8, i8* %142, i64 24
  %143 = load i32, i32* %x6, align 4
  %144 = load i32, i32* %j6, align 4
  %add162 = add i32 %143, %144
  call void @store32_le(i8* noundef %add.ptr161, i32 noundef %add162)
  %145 = load i8*, i8** %output.addr, align 8
  %add.ptr163 = getelementptr inbounds i8, i8* %145, i64 28
  %146 = load i32, i32* %x7, align 4
  %147 = load i32, i32* %j7, align 4
  %add164 = add i32 %146, %147
  call void @store32_le(i8* noundef %add.ptr163, i32 noundef %add164)
  %148 = load i8*, i8** %output.addr, align 8
  %add.ptr165 = getelementptr inbounds i8, i8* %148, i64 32
  %149 = load i32, i32* %x8, align 4
  %150 = load i32, i32* %j8, align 4
  %add166 = add i32 %149, %150
  call void @store32_le(i8* noundef %add.ptr165, i32 noundef %add166)
  %151 = load i8*, i8** %output.addr, align 8
  %add.ptr167 = getelementptr inbounds i8, i8* %151, i64 36
  %152 = load i32, i32* %x9, align 4
  %153 = load i32, i32* %j9, align 4
  %add168 = add i32 %152, %153
  call void @store32_le(i8* noundef %add.ptr167, i32 noundef %add168)
  %154 = load i8*, i8** %output.addr, align 8
  %add.ptr169 = getelementptr inbounds i8, i8* %154, i64 40
  %155 = load i32, i32* %x10, align 4
  %156 = load i32, i32* %j10, align 4
  %add170 = add i32 %155, %156
  call void @store32_le(i8* noundef %add.ptr169, i32 noundef %add170)
  %157 = load i8*, i8** %output.addr, align 8
  %add.ptr171 = getelementptr inbounds i8, i8* %157, i64 44
  %158 = load i32, i32* %x11, align 4
  %159 = load i32, i32* %j11, align 4
  %add172 = add i32 %158, %159
  call void @store32_le(i8* noundef %add.ptr171, i32 noundef %add172)
  %160 = load i8*, i8** %output.addr, align 8
  %add.ptr173 = getelementptr inbounds i8, i8* %160, i64 48
  %161 = load i32, i32* %x12, align 4
  %162 = load i32, i32* %j12, align 4
  %add174 = add i32 %161, %162
  call void @store32_le(i8* noundef %add.ptr173, i32 noundef %add174)
  %163 = load i8*, i8** %output.addr, align 8
  %add.ptr175 = getelementptr inbounds i8, i8* %163, i64 52
  %164 = load i32, i32* %x13, align 4
  %165 = load i32, i32* %j13, align 4
  %add176 = add i32 %164, %165
  call void @store32_le(i8* noundef %add.ptr175, i32 noundef %add176)
  %166 = load i8*, i8** %output.addr, align 8
  %add.ptr177 = getelementptr inbounds i8, i8* %166, i64 56
  %167 = load i32, i32* %x14, align 4
  %168 = load i32, i32* %j14, align 4
  %add178 = add i32 %167, %168
  call void @store32_le(i8* noundef %add.ptr177, i32 noundef %add178)
  %169 = load i8*, i8** %output.addr, align 8
  %add.ptr179 = getelementptr inbounds i8, i8* %169, i64 60
  %170 = load i32, i32* %x15, align 4
  %171 = load i32, i32* %j15, align 4
  %add180 = add i32 %170, %171
  call void @store32_le(i8* noundef %add.ptr179, i32 noundef %add180)
  ret void
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @load32_le(i8* noundef %src) #0 {
entry:
  %arrayidx = getelementptr inbounds i8, i8* %src, i64 0
  %0 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %0 to i32
  %arrayidx1 = getelementptr inbounds i8, i8* %src, i64 1
  %1 = load i8, i8* %arrayidx1, align 1
  %conv2 = zext i8 %1 to i32
  %shl = shl i32 %conv2, 8
  %or = or i32 %conv, %shl
  %arrayidx3 = getelementptr inbounds i8, i8* %src, i64 2
  %2 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %2 to i32
  %shl5 = shl i32 %conv4, 16
  %or6 = or i32 %or, %shl5
  %arrayidx7 = getelementptr inbounds i8, i8* %src, i64 3
  %3 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %3 to i32
  %shl9 = shl i32 %conv8, 24
  %or10 = or i32 %or6, %shl9
  ret i32 %or10
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @rotl32(i32 noundef %x, i32 noundef %b) #0 {
entry:
  %shl = shl i32 %x, %b
  %sub = sub nsw i32 32, %b
  %shr = lshr i32 %x, %sub
  %or = or i32 %shl, %shr
  ret i32 %or
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @store32_le(i8* noundef %dst, i32 noundef %w) #0 {
entry:
  %conv = trunc i32 %w to i8
  %arrayidx = getelementptr inbounds i8, i8* %dst, i64 0
  store i8 %conv, i8* %arrayidx, align 1
  %shr = lshr i32 %w, 8
  %conv1 = trunc i32 %shr to i8
  %arrayidx2 = getelementptr inbounds i8, i8* %dst, i64 1
  store i8 %conv1, i8* %arrayidx2, align 1
  %shr3 = lshr i32 %shr, 8
  %conv4 = trunc i32 %shr3 to i8
  %arrayidx5 = getelementptr inbounds i8, i8* %dst, i64 2
  store i8 %conv4, i8* %arrayidx5, align 1
  %shr6 = lshr i32 %shr3, 8
  %conv7 = trunc i32 %shr6 to i8
  %arrayidx8 = getelementptr inbounds i8, i8* %dst, i64 3
  store i8 %conv7, i8* %arrayidx8, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @_crypto_stream_salsa20(%struct.uint8ptr_wrapped_ty* noundef %c, i8* noundef %n, i8* noundef %k) #0 {
entry:
  %k.addr = alloca i8*, align 8
  %c_buf = alloca i8*, align 8
  %kcopy = alloca [32 x i8], align 16
  %input = alloca [16 x i8], align 16
  %u = alloca i32, align 4
  %block = alloca [64 x i8], align 16
  store i8* %k, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 114, i8* null)
  %c_buf2 = bitcast i8** %c_buf to i8*
  call void @llvm.var.annotation(i8* %c_buf2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 116, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %c_buf, align 8
  %kcopy3 = bitcast [32 x i8]* %kcopy to i8*
  call void @llvm.var.annotation(i8* %kcopy3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 119, i8* null)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  %1 = load i8*, i8** %k.addr, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %1, i64 32, i1 false)
  %input4 = bitcast [16 x i8]* %input to i8*
  call void @llvm.var.annotation(i8* %input4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 122, i8* null)
  %2 = bitcast [16 x i8]* %input to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 16, i1 false)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp ult i32 %i.0, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = zext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8, i8* %n, i64 %idxprom
  %3 = load i8, i8* %arrayidx, align 1
  %idxprom5 = zext i32 %i.0 to i64
  %arrayidx6 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom5
  store i8 %3, i8* %arrayidx6, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %4 = load i64, i64* %len, align 8
  %conv = trunc i64 %4 to i32
  %shr = lshr i32 %conv, 6
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc29, %for.end
  %j.0 = phi i32 [ 0, %for.end ], [ %inc30, %for.inc29 ]
  %cmp8 = icmp ult i32 %j.0, %shr
  br i1 %cmp8, label %for.body10, label %for.end31

for.body10:                                       ; preds = %for.cond7
  %5 = load i8*, i8** %c_buf, align 8
  %mul = mul i32 %j.0, 64
  %idx.ext = zext i32 %mul to i64
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %idx.ext
  %arraydecay11 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 0
  %arraydecay12 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  call void @_crypto_core_salsa20(i8* noundef %add.ptr, i8* noundef %arraydecay11, i8* noundef %arraydecay12)
  %u13 = bitcast i32* %u to i8*
  call void @llvm.var.annotation(i8* %u13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 131, i8* null)
  store i32 1, i32* %u, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc26, %for.body10
  %i14.0 = phi i32 [ 8, %for.body10 ], [ %inc27, %for.inc26 ]
  %cmp16 = icmp ult i32 %i14.0, 16
  br i1 %cmp16, label %for.body18, label %for.end28

for.body18:                                       ; preds = %for.cond15
  %idxprom19 = zext i32 %i14.0 to i64
  %arrayidx20 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom19
  %6 = load i8, i8* %arrayidx20, align 1
  %conv21 = zext i8 %6 to i32
  %7 = load i32, i32* %u, align 4
  %add = add i32 %7, %conv21
  store i32 %add, i32* %u, align 4
  %8 = load i32, i32* %u, align 4
  %conv22 = trunc i32 %8 to i8
  %idxprom23 = zext i32 %i14.0 to i64
  %arrayidx24 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom23
  store i8 %conv22, i8* %arrayidx24, align 1
  %9 = load i32, i32* %u, align 4
  %shr25 = lshr i32 %9, 8
  store i32 %shr25, i32* %u, align 4
  br label %for.inc26

for.inc26:                                        ; preds = %for.body18
  %inc27 = add i32 %i14.0, 1
  br label %for.cond15, !llvm.loop !9

for.end28:                                        ; preds = %for.cond15
  br label %for.inc29

for.inc29:                                        ; preds = %for.end28
  %inc30 = add i32 %j.0, 1
  br label %for.cond7, !llvm.loop !10

for.end31:                                        ; preds = %for.cond7
  %block32 = bitcast [64 x i8]* %block to i8*
  call void @llvm.var.annotation(i8* %block32, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 139, i8* null)
  %10 = bitcast [64 x i8]* %block to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 64, i1 false)
  %mul33 = mul i32 %shr, 64
  %conv34 = zext i32 %mul33 to i64
  %len35 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %11 = load i64, i64* %len35, align 8
  %cmp36 = icmp ult i64 %conv34, %11
  br i1 %cmp36, label %if.then, label %if.end

if.then:                                          ; preds = %for.end31
  %arraydecay38 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 0
  %arraydecay39 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 0
  %arraydecay40 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  call void @_crypto_core_salsa20(i8* noundef %arraydecay38, i8* noundef %arraydecay39, i8* noundef %arraydecay40)
  %len41 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %12 = load i64, i64* %len41, align 8
  %mul42 = mul i32 %shr, 64
  %conv43 = zext i32 %mul42 to i64
  %sub = sub i64 %12, %conv43
  %conv44 = trunc i64 %sub to i32
  br label %for.cond46

for.cond46:                                       ; preds = %for.inc54, %if.then
  %i45.0 = phi i32 [ 0, %if.then ], [ %inc55, %for.inc54 ]
  %cmp47 = icmp ult i32 %i45.0, %conv44
  br i1 %cmp47, label %for.body49, label %for.end56

for.body49:                                       ; preds = %for.cond46
  %idxprom50 = zext i32 %i45.0 to i64
  %arrayidx51 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 %idxprom50
  %13 = load i8, i8* %arrayidx51, align 1
  %14 = load i8*, i8** %c_buf, align 8
  %idxprom52 = zext i32 %i45.0 to i64
  %arrayidx53 = getelementptr inbounds i8, i8* %14, i64 %idxprom52
  store i8 %13, i8* %arrayidx53, align 1
  br label %for.inc54

for.inc54:                                        ; preds = %for.body49
  %inc55 = add i32 %i45.0, 1
  br label %for.cond46, !llvm.loop !11

for.end56:                                        ; preds = %for.cond46
  br label %if.end

if.end:                                           ; preds = %for.end56, %for.end31
  %arraydecay57 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 0
  call void @sodium_memzero(i8* noundef %arraydecay57, i64 noundef 64)
  %arraydecay58 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  call void @sodium_memzero(i8* noundef %arraydecay58, i64 noundef 32)
  ret i32 0
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @sodium_memzero(i8* noundef, i64 noundef) #4

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @_crypto_stream_salsa20_xor_ic(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, i8* noundef %n, i64 noundef %ic_val, i8* noundef %k) #0 {
entry:
  %n.addr = alloca i8*, align 8
  %k.addr = alloca i8*, align 8
  %c_buf = alloca i8*, align 8
  %m_buf = alloca i8*, align 8
  %kcopy = alloca [32 x i8], align 16
  %input = alloca [16 x i8], align 16
  %block = alloca [64 x i8], align 16
  %u = alloca i32, align 4
  store i8* %n, i8** %n.addr, align 8
  %n.addr1 = bitcast i8** %n.addr to i8*
  call void @llvm.var.annotation(i8* %n.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 157, i8* null)
  store i8* %k, i8** %k.addr, align 8
  %k.addr2 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 159, i8* null)
  %c_buf3 = bitcast i8** %c_buf to i8*
  call void @llvm.var.annotation(i8* %c_buf3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 162, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %c_buf, align 8
  %m_buf4 = bitcast i8** %m_buf to i8*
  call void @llvm.var.annotation(i8* %m_buf4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 163, i8* null)
  %buf5 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %1 = load i8*, i8** %buf5, align 8
  store i8* %1, i8** %m_buf, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %2 = load i64, i64* %len, align 8
  %len6 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %3 = load i64, i64* %len6, align 8
  %cmp = icmp eq i64 %2, %3
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), i32 noundef 166, i8* noundef getelementptr inbounds ([116 x i8], [116 x i8]* @__PRETTY_FUNCTION__._crypto_stream_salsa20_xor_ic, i64 0, i64 0)) #6
  unreachable

if.end:                                           ; preds = %if.then
  %kcopy7 = bitcast [32 x i8]* %kcopy to i8*
  call void @llvm.var.annotation(i8* %kcopy7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 169, i8* null)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  %4 = load i8*, i8** %k.addr, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %4, i64 32, i1 false)
  %input8 = bitcast [16 x i8]* %input to i8*
  call void @llvm.var.annotation(i8* %input8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 172, i8* null)
  %5 = bitcast [16 x i8]* %input to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 16, i1 false)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ]
  %cmp9 = icmp ult i32 %i.0, 8
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %n.addr, align 8
  %idxprom = zext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %idxprom
  %7 = load i8, i8* %arrayidx, align 1
  %idxprom10 = zext i32 %i.0 to i64
  %arrayidx11 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom10
  store i8 %7, i8* %arrayidx11, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !12

for.end:                                          ; preds = %for.cond
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc18, %for.end
  %i12.0 = phi i32 [ 8, %for.end ], [ %inc19, %for.inc18 ]
  %ic.0 = phi i64 [ %ic_val, %for.end ], [ %shr, %for.inc18 ]
  %cmp14 = icmp ult i32 %i12.0, 16
  br i1 %cmp14, label %for.body15, label %for.end20

for.body15:                                       ; preds = %for.cond13
  %and = and i64 %ic.0, 255
  %conv = trunc i64 %and to i8
  %idxprom16 = zext i32 %i12.0 to i64
  %arrayidx17 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom16
  store i8 %conv, i8* %arrayidx17, align 1
  %shr = lshr i64 %ic.0, 8
  br label %for.inc18

for.inc18:                                        ; preds = %for.body15
  %inc19 = add i32 %i12.0, 1
  br label %for.cond13, !llvm.loop !13

for.end20:                                        ; preds = %for.cond13
  %len21 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %8 = load i64, i64* %len21, align 8
  %div = udiv i64 %8, 64
  %block22 = bitcast [64 x i8]* %block to i8*
  call void @llvm.var.annotation(i8* %block22, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 183, i8* null)
  %9 = bitcast [64 x i8]* %block to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 64, i1 false)
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc63, %for.end20
  %j.0 = phi i64 [ 0, %for.end20 ], [ %inc64, %for.inc63 ]
  %cmp24 = icmp ult i64 %j.0, %div
  br i1 %cmp24, label %for.body26, label %for.end65

for.body26:                                       ; preds = %for.cond23
  %arraydecay27 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 0
  %arraydecay28 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 0
  %arraydecay29 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  call void @_crypto_core_salsa20(i8* noundef %arraydecay27, i8* noundef %arraydecay28, i8* noundef %arraydecay29)
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc44, %for.body26
  %i30.0 = phi i32 [ 0, %for.body26 ], [ %inc45, %for.inc44 ]
  %cmp32 = icmp ult i32 %i30.0, 64
  br i1 %cmp32, label %for.body34, label %for.end46

for.body34:                                       ; preds = %for.cond31
  %10 = load i8*, i8** %m_buf, align 8
  %idxprom35 = zext i32 %i30.0 to i64
  %arrayidx36 = getelementptr inbounds i8, i8* %10, i64 %idxprom35
  %11 = load i8, i8* %arrayidx36, align 1
  %conv37 = zext i8 %11 to i32
  %idxprom38 = zext i32 %i30.0 to i64
  %arrayidx39 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 %idxprom38
  %12 = load i8, i8* %arrayidx39, align 1
  %conv40 = zext i8 %12 to i32
  %xor = xor i32 %conv37, %conv40
  %conv41 = trunc i32 %xor to i8
  %13 = load i8*, i8** %c_buf, align 8
  %idxprom42 = zext i32 %i30.0 to i64
  %arrayidx43 = getelementptr inbounds i8, i8* %13, i64 %idxprom42
  store i8 %conv41, i8* %arrayidx43, align 1
  br label %for.inc44

for.inc44:                                        ; preds = %for.body34
  %inc45 = add i32 %i30.0, 1
  br label %for.cond31, !llvm.loop !14

for.end46:                                        ; preds = %for.cond31
  %u47 = bitcast i32* %u to i8*
  call void @llvm.var.annotation(i8* %u47, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 191, i8* null)
  store i32 1, i32* %u, align 4
  br label %for.cond49

for.cond49:                                       ; preds = %for.inc60, %for.end46
  %i48.0 = phi i32 [ 8, %for.end46 ], [ %inc61, %for.inc60 ]
  %cmp50 = icmp ult i32 %i48.0, 16
  br i1 %cmp50, label %for.body52, label %for.end62

for.body52:                                       ; preds = %for.cond49
  %idxprom53 = zext i32 %i48.0 to i64
  %arrayidx54 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom53
  %14 = load i8, i8* %arrayidx54, align 1
  %conv55 = zext i8 %14 to i32
  %15 = load i32, i32* %u, align 4
  %add = add i32 %15, %conv55
  store i32 %add, i32* %u, align 4
  %16 = load i32, i32* %u, align 4
  %conv56 = trunc i32 %16 to i8
  %idxprom57 = zext i32 %i48.0 to i64
  %arrayidx58 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom57
  store i8 %conv56, i8* %arrayidx58, align 1
  %17 = load i32, i32* %u, align 4
  %shr59 = lshr i32 %17, 8
  store i32 %shr59, i32* %u, align 4
  br label %for.inc60

for.inc60:                                        ; preds = %for.body52
  %inc61 = add i32 %i48.0, 1
  br label %for.cond49, !llvm.loop !15

for.end62:                                        ; preds = %for.cond49
  br label %for.inc63

for.inc63:                                        ; preds = %for.end62
  %inc64 = add i64 %j.0, 1
  br label %for.cond23, !llvm.loop !16

for.end65:                                        ; preds = %for.cond23
  %mul = mul i64 %div, 64
  %len66 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %18 = load i64, i64* %len66, align 8
  %cmp67 = icmp ult i64 %mul, %18
  br i1 %cmp67, label %if.then69, label %if.end90

if.then69:                                        ; preds = %for.end65
  %len70 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %19 = load i64, i64* %len70, align 8
  %mul71 = mul i64 %div, 64
  %sub = sub i64 %19, %mul71
  %arraydecay72 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 0
  %arraydecay73 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 0
  %arraydecay74 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  call void @_crypto_core_salsa20(i8* noundef %arraydecay72, i8* noundef %arraydecay73, i8* noundef %arraydecay74)
  br label %for.cond76

for.cond76:                                       ; preds = %for.inc87, %if.then69
  %i75.0 = phi i64 [ 0, %if.then69 ], [ %inc88, %for.inc87 ]
  %cmp77 = icmp ult i64 %i75.0, %sub
  br i1 %cmp77, label %for.body79, label %for.end89

for.body79:                                       ; preds = %for.cond76
  %20 = load i8*, i8** %m_buf, align 8
  %arrayidx80 = getelementptr inbounds i8, i8* %20, i64 %i75.0
  %21 = load i8, i8* %arrayidx80, align 1
  %conv81 = zext i8 %21 to i32
  %arrayidx82 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 %i75.0
  %22 = load i8, i8* %arrayidx82, align 1
  %conv83 = zext i8 %22 to i32
  %xor84 = xor i32 %conv81, %conv83
  %conv85 = trunc i32 %xor84 to i8
  %23 = load i8*, i8** %c_buf, align 8
  %arrayidx86 = getelementptr inbounds i8, i8* %23, i64 %i75.0
  store i8 %conv85, i8* %arrayidx86, align 1
  br label %for.inc87

for.inc87:                                        ; preds = %for.body79
  %inc88 = add i64 %i75.0, 1
  br label %for.cond76, !llvm.loop !17

for.end89:                                        ; preds = %for.cond76
  br label %if.end90

if.end90:                                         ; preds = %for.end89, %for.end65
  %arraydecay91 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 0
  call void @sodium_memzero(i8* noundef %arraydecay91, i64 noundef 64)
  %arraydecay92 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  call void @sodium_memzero(i8* noundef %arraydecay92, i64 noundef 32)
  %buf93 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %24 = load i8*, i8** %buf93, align 8
  %25 = load i8*, i8** %c_buf, align 8
  %len94 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %26 = load i64, i64* %len94, align 8
  %mul95 = mul i64 %26, 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %24, i8* align 1 %25, i64 %mul95, i1 false)
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #5

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}

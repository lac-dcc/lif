; ModuleID = 'llvm-ir/crypto_secretbox.ll'
source_filename = "lib/crypto_secretbox.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.uint8ptr_wrapped_ty = type { i8*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [23 x i8] c"lib/crypto_secretbox.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [9 x i8] c"nowrap:0\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [11 x i8] c"nowrap:0,1\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [17 x i8] c"c->len == m->len\00", align 1
@.str.5 = private unnamed_addr constant [23 x i8] c"lib/crypto_secretbox.c\00", align 1
@__PRETTY_FUNCTION__.__crypto_secretbox_xsalsa20poly1305 = private unnamed_addr constant [110 x i8] c"_Bool __crypto_secretbox_xsalsa20poly1305(uint8ptr_wrapped_ty *, uint8ptr_wrapped_ty *, uint8_t *, uint8_t *)\00", align 1
@__PRETTY_FUNCTION__.__crypto_secretbox_xsalsa20poly1305_open = private unnamed_addr constant [115 x i8] c"_Bool __crypto_secretbox_xsalsa20poly1305_open(uint8ptr_wrapped_ty *, uint8ptr_wrapped_ty *, uint8_t *, uint8_t *)\00", align 1
@llvm.global.annotations = appending global [7 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (%struct.uint8ptr_wrapped_ty*, i8*, i8*)* @__crypto_stream_xsalsa20 to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 95, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, i8*, i64, i8*)* @__crypto_stream_xsalsa20_xor_ic to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 113, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, i8*, i8*)* @__crypto_stream_xsalsa20_xor to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 134, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i1 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, i8*, i8*)* @__crypto_secretbox_xsalsa20poly1305 to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 144, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i1 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, i8*, i8*)* @__crypto_secretbox_xsalsa20poly1305_open to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 186, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i1 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, i8*, i8*)* @__crypto_secretbox to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 236, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i1 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, i8*, i8*)* @__crypto_secretbox_open to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 246, i8* null }], section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @__crypto_core_hsalsa20(i8* noundef %out, i8* noundef %input, i8* noundef %k) #0 {
entry:
  %out.addr = alloca i8*, align 8
  %input.addr = alloca i8*, align 8
  %k.addr = alloca i8*, align 8
  store i8* %out, i8** %out.addr, align 8
  %out.addr1 = bitcast i8** %out.addr to i8*
  call void @llvm.var.annotation(i8* %out.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 27, i8* null)
  store i8* %input, i8** %input.addr, align 8
  %input.addr2 = bitcast i8** %input.addr to i8*
  call void @llvm.var.annotation(i8* %input.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 28, i8* null)
  store i8* %k, i8** %k.addr, align 8
  %k.addr3 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 29, i8* null)
  %0 = load i8*, i8** %k.addr, align 8
  %call = call i32 @load32_le(i8* noundef %0)
  %1 = load i8*, i8** %k.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %1, i64 4
  %call4 = call i32 @load32_le(i8* noundef %add.ptr)
  %2 = load i8*, i8** %k.addr, align 8
  %add.ptr5 = getelementptr inbounds i8, i8* %2, i64 8
  %call6 = call i32 @load32_le(i8* noundef %add.ptr5)
  %3 = load i8*, i8** %k.addr, align 8
  %add.ptr7 = getelementptr inbounds i8, i8* %3, i64 12
  %call8 = call i32 @load32_le(i8* noundef %add.ptr7)
  %4 = load i8*, i8** %k.addr, align 8
  %add.ptr9 = getelementptr inbounds i8, i8* %4, i64 16
  %call10 = call i32 @load32_le(i8* noundef %add.ptr9)
  %5 = load i8*, i8** %k.addr, align 8
  %add.ptr11 = getelementptr inbounds i8, i8* %5, i64 20
  %call12 = call i32 @load32_le(i8* noundef %add.ptr11)
  %6 = load i8*, i8** %k.addr, align 8
  %add.ptr13 = getelementptr inbounds i8, i8* %6, i64 24
  %call14 = call i32 @load32_le(i8* noundef %add.ptr13)
  %7 = load i8*, i8** %k.addr, align 8
  %add.ptr15 = getelementptr inbounds i8, i8* %7, i64 28
  %call16 = call i32 @load32_le(i8* noundef %add.ptr15)
  %8 = load i8*, i8** %input.addr, align 8
  %call17 = call i32 @load32_le(i8* noundef %8)
  %9 = load i8*, i8** %input.addr, align 8
  %add.ptr18 = getelementptr inbounds i8, i8* %9, i64 4
  %call19 = call i32 @load32_le(i8* noundef %add.ptr18)
  %10 = load i8*, i8** %input.addr, align 8
  %add.ptr20 = getelementptr inbounds i8, i8* %10, i64 8
  %call21 = call i32 @load32_le(i8* noundef %add.ptr20)
  %11 = load i8*, i8** %input.addr, align 8
  %add.ptr22 = getelementptr inbounds i8, i8* %11, i64 12
  %call23 = call i32 @load32_le(i8* noundef %add.ptr22)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %x9.0 = phi i32 [ %call23, %entry ], [ %xor101, %for.inc ]
  %x8.0 = phi i32 [ %call21, %entry ], [ %xor98, %for.inc ]
  %x7.0 = phi i32 [ %call19, %entry ], [ %xor86, %for.inc ]
  %x6.0 = phi i32 [ %call17, %entry ], [ %xor83, %for.inc ]
  %x14.0 = phi i32 [ %call16, %entry ], [ %xor113, %for.inc ]
  %x13.0 = phi i32 [ %call14, %entry ], [ %xor110, %for.inc ]
  %x12.0 = phi i32 [ %call12, %entry ], [ %xor107, %for.inc ]
  %x11.0 = phi i32 [ %call10, %entry ], [ %xor95, %for.inc ]
  %x4.0 = phi i32 [ %call8, %entry ], [ %xor89, %for.inc ]
  %x3.0 = phi i32 [ %call6, %entry ], [ %xor77, %for.inc ]
  %x2.0 = phi i32 [ %call4, %entry ], [ %xor74, %for.inc ]
  %x1.0 = phi i32 [ %call, %entry ], [ %xor71, %for.inc ]
  %x15.0 = phi i32 [ 1797285236, %entry ], [ %xor116, %for.inc ]
  %x10.0 = phi i32 [ 2036477234, %entry ], [ %xor104, %for.inc ]
  %x5.0 = phi i32 [ 857760878, %entry ], [ %xor92, %for.inc ]
  %x0.0 = phi i32 [ 1634760805, %entry ], [ %xor80, %for.inc ]
  %cmp = icmp ult i32 %i.0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %add = add i32 %x0.0, %x12.0
  %shl = shl i32 %add, 7
  %xor = xor i32 %x4.0, %shl
  %add24 = add i32 %xor, %x0.0
  %shl25 = shl i32 %add24, 9
  %xor26 = xor i32 %x8.0, %shl25
  %add27 = add i32 %xor26, %xor
  %shl28 = shl i32 %add27, 13
  %xor29 = xor i32 %x12.0, %shl28
  %add30 = add i32 %xor29, %xor26
  %shl31 = shl i32 %add30, 18
  %xor32 = xor i32 %x0.0, %shl31
  %add33 = add i32 %x5.0, %x1.0
  %shl34 = shl i32 %add33, 7
  %xor35 = xor i32 %x9.0, %shl34
  %add36 = add i32 %xor35, %x5.0
  %shl37 = shl i32 %add36, 9
  %xor38 = xor i32 %x13.0, %shl37
  %add39 = add i32 %xor38, %xor35
  %shl40 = shl i32 %add39, 13
  %xor41 = xor i32 %x1.0, %shl40
  %add42 = add i32 %xor41, %xor38
  %shl43 = shl i32 %add42, 18
  %xor44 = xor i32 %x5.0, %shl43
  %add45 = add i32 %x10.0, %x6.0
  %shl46 = shl i32 %add45, 7
  %xor47 = xor i32 %x14.0, %shl46
  %add48 = add i32 %xor47, %x10.0
  %shl49 = shl i32 %add48, 9
  %xor50 = xor i32 %x2.0, %shl49
  %add51 = add i32 %xor50, %xor47
  %shl52 = shl i32 %add51, 13
  %xor53 = xor i32 %x6.0, %shl52
  %add54 = add i32 %xor53, %xor50
  %shl55 = shl i32 %add54, 18
  %xor56 = xor i32 %x10.0, %shl55
  %add57 = add i32 %x15.0, %x11.0
  %shl58 = shl i32 %add57, 7
  %xor59 = xor i32 %x3.0, %shl58
  %add60 = add i32 %xor59, %x15.0
  %shl61 = shl i32 %add60, 9
  %xor62 = xor i32 %x7.0, %shl61
  %add63 = add i32 %xor62, %xor59
  %shl64 = shl i32 %add63, 13
  %xor65 = xor i32 %x11.0, %shl64
  %add66 = add i32 %xor65, %xor62
  %shl67 = shl i32 %add66, 18
  %xor68 = xor i32 %x15.0, %shl67
  %add69 = add i32 %xor32, %xor59
  %shl70 = shl i32 %add69, 7
  %xor71 = xor i32 %xor41, %shl70
  %add72 = add i32 %xor71, %xor32
  %shl73 = shl i32 %add72, 9
  %xor74 = xor i32 %xor50, %shl73
  %add75 = add i32 %xor74, %xor71
  %shl76 = shl i32 %add75, 13
  %xor77 = xor i32 %xor59, %shl76
  %add78 = add i32 %xor77, %xor74
  %shl79 = shl i32 %add78, 18
  %xor80 = xor i32 %xor32, %shl79
  %add81 = add i32 %xor44, %xor
  %shl82 = shl i32 %add81, 7
  %xor83 = xor i32 %xor53, %shl82
  %add84 = add i32 %xor83, %xor44
  %shl85 = shl i32 %add84, 9
  %xor86 = xor i32 %xor62, %shl85
  %add87 = add i32 %xor86, %xor83
  %shl88 = shl i32 %add87, 13
  %xor89 = xor i32 %xor, %shl88
  %add90 = add i32 %xor89, %xor86
  %shl91 = shl i32 %add90, 18
  %xor92 = xor i32 %xor44, %shl91
  %add93 = add i32 %xor56, %xor35
  %shl94 = shl i32 %add93, 7
  %xor95 = xor i32 %xor65, %shl94
  %add96 = add i32 %xor95, %xor56
  %shl97 = shl i32 %add96, 9
  %xor98 = xor i32 %xor26, %shl97
  %add99 = add i32 %xor98, %xor95
  %shl100 = shl i32 %add99, 13
  %xor101 = xor i32 %xor35, %shl100
  %add102 = add i32 %xor101, %xor98
  %shl103 = shl i32 %add102, 18
  %xor104 = xor i32 %xor56, %shl103
  %add105 = add i32 %xor68, %xor47
  %shl106 = shl i32 %add105, 7
  %xor107 = xor i32 %xor29, %shl106
  %add108 = add i32 %xor107, %xor68
  %shl109 = shl i32 %add108, 9
  %xor110 = xor i32 %xor38, %shl109
  %add111 = add i32 %xor110, %xor107
  %shl112 = shl i32 %add111, 13
  %xor113 = xor i32 %xor47, %shl112
  %add114 = add i32 %xor113, %xor110
  %shl115 = shl i32 %add114, 18
  %xor116 = xor i32 %xor68, %shl115
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %out.addr, align 8
  call void @store32_le(i8* noundef %12, i32 noundef %x0.0)
  %13 = load i8*, i8** %out.addr, align 8
  %add.ptr117 = getelementptr inbounds i8, i8* %13, i64 4
  call void @store32_le(i8* noundef %add.ptr117, i32 noundef %x5.0)
  %14 = load i8*, i8** %out.addr, align 8
  %add.ptr118 = getelementptr inbounds i8, i8* %14, i64 8
  call void @store32_le(i8* noundef %add.ptr118, i32 noundef %x10.0)
  %15 = load i8*, i8** %out.addr, align 8
  %add.ptr119 = getelementptr inbounds i8, i8* %15, i64 12
  call void @store32_le(i8* noundef %add.ptr119, i32 noundef %x15.0)
  %16 = load i8*, i8** %out.addr, align 8
  %add.ptr120 = getelementptr inbounds i8, i8* %16, i64 16
  call void @store32_le(i8* noundef %add.ptr120, i32 noundef %x6.0)
  %17 = load i8*, i8** %out.addr, align 8
  %add.ptr121 = getelementptr inbounds i8, i8* %17, i64 20
  call void @store32_le(i8* noundef %add.ptr121, i32 noundef %x7.0)
  %18 = load i8*, i8** %out.addr, align 8
  %add.ptr122 = getelementptr inbounds i8, i8* %18, i64 24
  call void @store32_le(i8* noundef %add.ptr122, i32 noundef %x8.0)
  %19 = load i8*, i8** %out.addr, align 8
  %add.ptr123 = getelementptr inbounds i8, i8* %19, i64 28
  call void @store32_le(i8* noundef %add.ptr123, i32 noundef %x9.0)
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
define dso_local i32 @__crypto_stream_xsalsa20(%struct.uint8ptr_wrapped_ty* noundef %c, i8* noundef %n, i8* noundef %k) #0 {
entry:
  %k.addr = alloca i8*, align 8
  %subkey = alloca [32 x i8], align 16
  store i8* %k, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 98, i8* null)
  %0 = bitcast [32 x i8]* %subkey to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 32, i1 false)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  %1 = load i8*, i8** %k.addr, align 8
  call void @__crypto_core_hsalsa20(i8* noundef %arraydecay, i8* noundef %n, i8* noundef %1)
  %add.ptr = getelementptr inbounds i8, i8* %n, i64 16
  %arraydecay2 = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  %call = call i32 @_crypto_stream_salsa20(%struct.uint8ptr_wrapped_ty* noundef %c, i8* noundef %add.ptr, i8* noundef %arraydecay2)
  %arraydecay3 = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  call void @sodium_memzero(i8* noundef %arraydecay3, i64 noundef 32)
  ret i32 %call
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @_crypto_stream_salsa20(%struct.uint8ptr_wrapped_ty* noundef, i8* noundef, i8* noundef) #3

declare void @sodium_memzero(i8* noundef, i64 noundef) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @__crypto_stream_xsalsa20_xor_ic(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, i8* noundef %n, i64 noundef %ic, i8* noundef %k) #0 {
entry:
  %k.addr = alloca i8*, align 8
  %subkey = alloca [32 x i8], align 16
  store i8* %k, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 118, i8* null)
  %0 = bitcast [32 x i8]* %subkey to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 32, i1 false)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  %1 = load i8*, i8** %k.addr, align 8
  call void @__crypto_core_hsalsa20(i8* noundef %arraydecay, i8* noundef %n, i8* noundef %1)
  %add.ptr = getelementptr inbounds i8, i8* %n, i64 16
  %arraydecay2 = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  %call = call i32 @_crypto_stream_salsa20_xor_ic(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, i8* noundef %add.ptr, i64 noundef %ic, i8* noundef %arraydecay2)
  %arraydecay3 = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  call void @sodium_memzero(i8* noundef %arraydecay3, i64 noundef 32)
  ret i32 %call
}

declare i32 @_crypto_stream_salsa20_xor_ic(%struct.uint8ptr_wrapped_ty* noundef, %struct.uint8ptr_wrapped_ty* noundef, i8* noundef, i64 noundef, i8* noundef) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @__crypto_stream_xsalsa20_xor(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, i8* noundef %n, i8* noundef %k) #0 {
entry:
  %k.addr = alloca i8*, align 8
  store i8* %k, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 138, i8* null)
  %0 = load i8*, i8** %k.addr, align 8
  %call = call i32 @__crypto_stream_xsalsa20_xor_ic(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, i8* noundef %n, i64 noundef 0, i8* noundef %0)
  ret i32 %call
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @__crypto_secretbox_xsalsa20poly1305(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, i8* noundef %n, i8* noundef %k) #0 {
entry:
  %k.addr = alloca i8*, align 8
  %c_buf = alloca i8*, align 8
  %cview = alloca [16 x i8], align 16
  %w_mview = alloca %struct.uint8ptr_wrapped_ty, align 8
  %kview = alloca [32 x i8], align 16
  store i8* %k, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 148, i8* null)
  %c_buf2 = bitcast i8** %c_buf to i8*
  call void @llvm.var.annotation(i8* %c_buf2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 150, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %c_buf, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %1 = load i64, i64* %len, align 8
  %cmp = icmp ult i64 %1, 32
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %len3 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %2 = load i64, i64* %len3, align 8
  %len4 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %3 = load i64, i64* %len4, align 8
  %cmp5 = icmp eq i64 %2, %3
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.end
  br label %if.end7

if.else:                                          ; preds = %if.end
  call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i32 noundef 156, i8* noundef getelementptr inbounds ([110 x i8], [110 x i8]* @__PRETTY_FUNCTION__.__crypto_secretbox_xsalsa20poly1305, i64 0, i64 0)) #7
  unreachable

if.end7:                                          ; preds = %if.then6
  %4 = load i8*, i8** %k.addr, align 8
  %call = call i32 @__crypto_stream_xsalsa20_xor(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, i8* noundef %n, i8* noundef %4)
  %cview8 = bitcast [16 x i8]* %cview to i8*
  call void @llvm.var.annotation(i8* %cview8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 159, i8* null)
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %cview, i64 0, i64 0
  %5 = load i8*, i8** %c_buf, align 8
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %add.ptr, i64 16, i1 false)
  %len9 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %6 = load i64, i64* %len9, align 8
  %sub = sub i64 %6, 32
  %len10 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_mview, i32 0, i32 1
  store i64 %sub, i64* %len10, align 8
  %len11 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_mview, i32 0, i32 1
  %7 = load i64, i64* %len11, align 8
  %mul = mul i64 %7, 1
  %call12 = call noalias i8* @malloc(i64 noundef %mul) #8
  %buf13 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_mview, i32 0, i32 0
  store i8* %call12, i8** %buf13, align 8
  %buf14 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_mview, i32 0, i32 0
  %8 = load i8*, i8** %buf14, align 8
  %9 = load i8*, i8** %c_buf, align 8
  %add.ptr15 = getelementptr inbounds i8, i8* %9, i64 32
  %len16 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %10 = load i64, i64* %len16, align 8
  %sub17 = sub i64 %10, 32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* align 1 %add.ptr15, i64 %sub17, i1 false)
  %kview18 = bitcast [32 x i8]* %kview to i8*
  call void @llvm.var.annotation(i8* %kview18, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 167, i8* null)
  %arraydecay19 = getelementptr inbounds [32 x i8], [32 x i8]* %kview, i64 0, i64 0
  %11 = load i8*, i8** %c_buf, align 8
  %add.ptr20 = getelementptr inbounds i8, i8* %11, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay19, i8* align 1 %add.ptr20, i64 32, i1 false)
  %arraydecay21 = getelementptr inbounds [16 x i8], [16 x i8]* %cview, i64 0, i64 0
  %arraydecay22 = getelementptr inbounds [32 x i8], [32 x i8]* %kview, i64 0, i64 0
  %call23 = call i32 @_crypto_onetimeauth_poly1305(i8* noundef %arraydecay21, %struct.uint8ptr_wrapped_ty* noundef %w_mview, i8* noundef %arraydecay22)
  %buf24 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %12 = load i8*, i8** %buf24, align 8
  %add.ptr25 = getelementptr inbounds i8, i8* %12, i64 16
  %arraydecay26 = getelementptr inbounds [16 x i8], [16 x i8]* %cview, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr25, i8* align 16 %arraydecay26, i64 16, i1 false)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end7
  %i.0 = phi i64 [ 0, %if.end7 ], [ %inc, %for.inc ]
  %cmp27 = icmp ult i64 %i.0, 16
  br i1 %cmp27, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %buf28 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %13 = load i8*, i8** %buf28, align 8
  %arrayidx = getelementptr inbounds i8, i8* %13, i64 %i.0
  store i8 0, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i64 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  br label %return

return:                                           ; preds = %for.end, %if.then
  %retval.0 = phi i1 [ false, %if.then ], [ true, %for.end ]
  ret i1 %retval.0
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #6

declare i32 @_crypto_onetimeauth_poly1305(i8* noundef, %struct.uint8ptr_wrapped_ty* noundef, i8* noundef) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @__crypto_secretbox_xsalsa20poly1305_open(%struct.uint8ptr_wrapped_ty* noundef %m, %struct.uint8ptr_wrapped_ty* noundef %c, i8* noundef %n, i8* noundef %k) #0 {
entry:
  %k.addr = alloca i8*, align 8
  %c_buf = alloca i8*, align 8
  %w_subkey = alloca %struct.uint8ptr_wrapped_ty, align 8
  %subkey = alloca [32 x i8], align 16
  %tmp1 = alloca [16 x i8], align 16
  %w_cview = alloca %struct.uint8ptr_wrapped_ty, align 8
  store i8* %k, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 190, i8* null)
  %c_buf2 = bitcast i8** %c_buf to i8*
  call void @llvm.var.annotation(i8* %c_buf2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 192, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %c_buf, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %1 = load i64, i64* %len, align 8
  %cmp = icmp ult i64 %1, 32
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %len3 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %2 = load i64, i64* %len3, align 8
  %len4 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %3 = load i64, i64* %len4, align 8
  %cmp5 = icmp eq i64 %2, %3
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.end
  br label %if.end7

if.else:                                          ; preds = %if.end
  call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i32 noundef 198, i8* noundef getelementptr inbounds ([115 x i8], [115 x i8]* @__PRETTY_FUNCTION__.__crypto_secretbox_xsalsa20poly1305_open, i64 0, i64 0)) #7
  unreachable

if.end7:                                          ; preds = %if.then6
  %len8 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_subkey, i32 0, i32 1
  store i64 32, i64* %len8, align 8
  %len9 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_subkey, i32 0, i32 1
  %4 = load i64, i64* %len9, align 8
  %call = call noalias i8* @calloc(i64 noundef %4, i64 noundef 1) #8
  %buf10 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_subkey, i32 0, i32 0
  store i8* %call, i8** %buf10, align 8
  %5 = load i8*, i8** %k.addr, align 8
  %call11 = call i32 @__crypto_stream_xsalsa20(%struct.uint8ptr_wrapped_ty* noundef %w_subkey, i8* noundef %n, i8* noundef %5)
  %subkey12 = bitcast [32 x i8]* %subkey to i8*
  call void @llvm.var.annotation(i8* %subkey12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 205, i8* null)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  %buf13 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_subkey, i32 0, i32 0
  %6 = load i8*, i8** %buf13, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %6, i64 32, i1 false)
  %arraydecay14 = getelementptr inbounds [16 x i8], [16 x i8]* %tmp1, i64 0, i64 0
  %7 = load i8*, i8** %c_buf, align 8
  %add.ptr = getelementptr inbounds i8, i8* %7, i64 16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay14, i8* align 1 %add.ptr, i64 16, i1 false)
  %len15 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %8 = load i64, i64* %len15, align 8
  %sub = sub i64 %8, 32
  %len16 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_cview, i32 0, i32 1
  store i64 %sub, i64* %len16, align 8
  %len17 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_cview, i32 0, i32 1
  %9 = load i64, i64* %len17, align 8
  %mul = mul i64 %9, 1
  %call18 = call noalias i8* @malloc(i64 noundef %mul) #8
  %buf19 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_cview, i32 0, i32 0
  store i8* %call18, i8** %buf19, align 8
  %buf20 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_cview, i32 0, i32 0
  %10 = load i8*, i8** %buf20, align 8
  %buf21 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %11 = load i8*, i8** %buf21, align 8
  %add.ptr22 = getelementptr inbounds i8, i8* %11, i64 32
  %len23 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_cview, i32 0, i32 1
  %12 = load i64, i64* %len23, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %10, i8* align 1 %add.ptr22, i64 %12, i1 false)
  %arraydecay24 = getelementptr inbounds [16 x i8], [16 x i8]* %tmp1, i64 0, i64 0
  %arraydecay25 = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  %call26 = call zeroext i1 @_crypto_onetimeauth_poly1305_verify(i8* noundef %arraydecay24, %struct.uint8ptr_wrapped_ty* noundef %w_cview, i8* noundef %arraydecay25)
  br i1 %call26, label %if.end28, label %if.then27

if.then27:                                        ; preds = %if.end7
  br label %return

if.end28:                                         ; preds = %if.end7
  %13 = load i8*, i8** %k.addr, align 8
  %call29 = call i32 @__crypto_stream_xsalsa20_xor(%struct.uint8ptr_wrapped_ty* noundef %m, %struct.uint8ptr_wrapped_ty* noundef %c, i8* noundef %n, i8* noundef %13)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end28
  %i.0 = phi i32 [ 0, %if.end28 ], [ %inc, %for.inc ]
  %cmp30 = icmp ult i32 %i.0, 32
  br i1 %cmp30, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %buf31 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %14 = load i8*, i8** %buf31, align 8
  %idxprom = zext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8, i8* %14, i64 %idxprom
  store i8 0, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  br label %return

return:                                           ; preds = %for.end, %if.then27, %if.then
  %retval.0 = phi i1 [ false, %if.then ], [ true, %for.end ], [ false, %if.then27 ]
  ret i1 %retval.0
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) #6

declare zeroext i1 @_crypto_onetimeauth_poly1305_verify(i8* noundef, %struct.uint8ptr_wrapped_ty* noundef, i8* noundef) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @__crypto_secretbox(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, i8* noundef %n, i8* noundef %k) #0 {
entry:
  %k.addr = alloca i8*, align 8
  store i8* %k, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 240, i8* null)
  %0 = load i8*, i8** %k.addr, align 8
  %call = call zeroext i1 @__crypto_secretbox_xsalsa20poly1305(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, i8* noundef %n, i8* noundef %0)
  ret i1 %call
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @__crypto_secretbox_open(%struct.uint8ptr_wrapped_ty* noundef %m, %struct.uint8ptr_wrapped_ty* noundef %c, i8* noundef %n, i8* noundef %k) #0 {
entry:
  %k.addr = alloca i8*, align 8
  store i8* %k, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 250, i8* null)
  %0 = load i8*, i8** %k.addr, align 8
  %call = call zeroext i1 @__crypto_secretbox_xsalsa20poly1305_open(%struct.uint8ptr_wrapped_ty* noundef %m, %struct.uint8ptr_wrapped_ty* noundef %c, i8* noundef %n, i8* noundef %0)
  ret i1 %call
}

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind }

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

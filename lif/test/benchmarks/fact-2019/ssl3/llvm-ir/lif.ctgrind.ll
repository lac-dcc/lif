; ModuleID = 'llvm-ir/base.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.uint8ptr_wrapped_ty = type { i8*, i64 }
%struct.SHAstate_st = type { i32, i32, i32, i32, i32, i32, i32, [16 x i32], i32 }

@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, i64)* @__ssl3_cbc_digest_record to i8*), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 32, i8* null }], section "llvm.metadata"
@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"lib/ssl3.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [15 x i8] c"data->len >= k\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"lib/ssl3.c\00", align 1
@__PRETTY_FUNCTION__.__ssl3_cbc_digest_record = private unnamed_addr constant [135 x i8] c"int32_t __ssl3_cbc_digest_record(uint8ptr_wrapped_ty *, uint8ptr_wrapped_ty *, uint8ptr_wrapped_ty *, uint8ptr_wrapped_ty *, uint64_t)\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"header->len <= 2 * md_block_size\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"nowrap:0,1,2,3\00", section "llvm.metadata"
@.str.6 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.7 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @__ssl3_cbc_digest_record(%struct.uint8ptr_wrapped_ty* noundef %md_state, %struct.uint8ptr_wrapped_ty* noundef %mac_out, %struct.uint8ptr_wrapped_ty* noundef %header, %struct.uint8ptr_wrapped_ty* noundef %data, i64 noundef %data_plus_mac_size) #0 {
entry:
  %md_state.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 1
  %md_state.field0.length = load i64, i64* %md_state.field0.length.ptr, align 8
  %mac_out.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 1
  %mac_out.field0.length = load i64, i64* %mac_out.field0.length.ptr, align 8
  %header.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %header.field0.length = load i64, i64* %header.field0.length.ptr, align 8
  %data.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %data.field0.length = load i64, i64* %data.field0.length.ptr, align 8
  %arraydecay148.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %pred.alloca = alloca i1, align 1
  store i1 false, i1* %pred.alloca, align 1
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.7 = alloca i1, align 1
  store i1 false, i1* %out.7, align 1
  %out.8 = alloca i1, align 1
  store i1 false, i1* %out.8, align 1
  %out.9 = alloca i1, align 1
  store i1 false, i1* %out.9, align 1
  %out.10 = alloca i1, align 1
  store i1 false, i1* %out.10, align 1
  %out.11 = alloca i1, align 1
  store i1 false, i1* %out.11, align 1
  %out.12 = alloca i1, align 1
  store i1 false, i1* %out.12, align 1
  %out.13 = alloca i1, align 1
  store i1 false, i1* %out.13, align 1
  %out.14 = alloca i1, align 1
  store i1 false, i1* %out.14, align 1
  %out.15 = alloca i1, align 1
  store i1 false, i1* %out.15, align 1
  %out.16 = alloca i1, align 1
  store i1 false, i1* %out.16, align 1
  %out.17 = alloca i1, align 1
  store i1 false, i1* %out.17, align 1
  %out.18 = alloca i1, align 1
  store i1 false, i1* %out.18, align 1
  %out.19 = alloca i1, align 1
  store i1 false, i1* %out.19, align 1
  %out.20 = alloca i1, align 1
  store i1 false, i1* %out.20, align 1
  %out.21 = alloca i1, align 1
  store i1 false, i1* %out.21, align 1
  %out.22 = alloca i1, align 1
  store i1 false, i1* %out.22, align 1
  %out.23 = alloca i1, align 1
  store i1 false, i1* %out.23, align 1
  %out.24 = alloca i1, align 1
  store i1 false, i1* %out.24, align 1
  %out.25 = alloca i1, align 1
  store i1 false, i1* %out.25, align 1
  %out.26 = alloca i1, align 1
  store i1 false, i1* %out.26, align 1
  %out.27 = alloca i1, align 1
  store i1 false, i1* %out.27, align 1
  %out.28 = alloca i1, align 1
  store i1 false, i1* %out.28, align 1
  %out.29 = alloca i1, align 1
  store i1 false, i1* %out.29, align 1
  %out.30 = alloca i1, align 1
  store i1 false, i1* %out.30, align 1
  %out.31 = alloca i1, align 1
  store i1 false, i1* %out.31, align 1
  %out.32 = alloca i1, align 1
  store i1 false, i1* %out.32, align 1
  %out.33 = alloca i1, align 1
  store i1 false, i1* %out.33, align 1
  %out.34 = alloca i1, align 1
  store i1 false, i1* %out.34, align 1
  %out.35 = alloca i1, align 1
  store i1 false, i1* %out.35, align 1
  %out.36 = alloca i1, align 1
  store i1 false, i1* %out.36, align 1
  %out.37 = alloca i1, align 1
  store i1 false, i1* %out.37, align 1
  %out.38 = alloca i1, align 1
  store i1 false, i1* %out.38, align 1
  %out.39 = alloca i1, align 1
  store i1 false, i1* %out.39, align 1
  %out.40 = alloca i1, align 1
  store i1 false, i1* %out.40, align 1
  %out.41 = alloca i1, align 1
  store i1 false, i1* %out.41, align 1
  %out.42 = alloca i1, align 1
  store i1 false, i1* %out.42, align 1
  %out.43 = alloca i1, align 1
  store i1 false, i1* %out.43, align 1
  %out.44 = alloca i1, align 1
  store i1 false, i1* %out.44, align 1
  %out.45 = alloca i1, align 1
  store i1 false, i1* %out.45, align 1
  %out.46 = alloca i1, align 1
  store i1 false, i1* %out.46, align 1
  %out.47 = alloca i1, align 1
  store i1 false, i1* %out.47, align 1
  %out.48 = alloca i1, align 1
  store i1 false, i1* %out.48, align 1
  %out.49 = alloca i1, align 1
  store i1 false, i1* %out.49, align 1
  %out.50 = alloca i1, align 1
  store i1 false, i1* %out.50, align 1
  %out.51 = alloca i1, align 1
  store i1 false, i1* %out.51, align 1
  %out.52 = alloca i1, align 1
  store i1 false, i1* %out.52, align 1
  %out.53 = alloca i1, align 1
  store i1 false, i1* %out.53, align 1
  %out.54 = alloca i1, align 1
  store i1 false, i1* %out.54, align 1
  %out.55 = alloca i1, align 1
  store i1 false, i1* %out.55, align 1
  %out.56 = alloca i1, align 1
  store i1 false, i1* %out.56, align 1
  %out.57 = alloca i1, align 1
  store i1 false, i1* %out.57, align 1
  %out.58 = alloca i1, align 1
  store i1 false, i1* %out.58, align 1
  %out.59 = alloca i1, align 1
  store i1 false, i1* %out.59, align 1
  %out.60 = alloca i1, align 1
  store i1 false, i1* %out.60, align 1
  %out.61 = alloca i1, align 1
  store i1 false, i1* %out.61, align 1
  %md_state_buf = alloca i8*, align 8
  %mac_out_buf = alloca i8*, align 8
  %header_buf = alloca i8*, align 8
  %data_buf = alloca i8*, align 8
  %first_block = alloca [128 x i8], align 16
  %length_bytes = alloca [16 x i8], align 16
  %block = alloca [128 x i8], align 16
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.20, align 1
  store i1 false, i1* %out.49, align 1
  store i1 false, i1* %out.56, align 1
  store i1 false, i1* %out.58, align 1
  %md_state_buf1 = bitcast i8** %md_state_buf to i8*
  call void @llvm.var.annotation(i8* %md_state_buf1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 37, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %md_state_buf, align 8
  %mac_out_buf2 = bitcast i8** %mac_out_buf to i8*
  call void @llvm.var.annotation(i8* %mac_out_buf2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 38, i8* null)
  %buf3 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 0
  %1 = load i8*, i8** %buf3, align 8
  store i8* %1, i8** %mac_out_buf, align 8
  %header_buf4 = bitcast i8** %header_buf to i8*
  call void @llvm.var.annotation(i8* %header_buf4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 39, i8* null)
  %buf5 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 0
  %2 = load i8*, i8** %buf5, align 8
  store i8* %2, i8** %header_buf, align 8
  %data_buf6 = bitcast i8** %data_buf to i8*
  call void @llvm.var.annotation(i8* %data_buf6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 40, i8* null)
  %buf7 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 0
  %3 = load i8*, i8** %buf7, align 8
  store i8* %3, i8** %data_buf, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %4 = load i64, i64* %len, align 8
  %len8 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %5 = load i64, i64* %len8, align 8
  %add = add i64 %4, %5
  %sub = sub i64 %add, 20
  %sub9 = sub i64 %sub, 1
  %add10 = add i64 %sub9, 1
  %add11 = add i64 %add10, 8
  %add12 = add i64 %add11, 64
  %sub13 = sub i64 %add12, 1
  %div = udiv i64 %sub13, 64
  %len14 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %6 = load i64, i64* %len14, align 8
  %add15 = add i64 %data_plus_mac_size, %6
  %sub16 = sub i64 %add15, 20
  %rem = urem i64 %sub16, 64
  %div17 = udiv i64 %sub16, 64
  %add18 = add i64 %sub16, 8
  %div19 = udiv i64 %add18, 64
  %add20 = add i64 2, 1
  %cmp = icmp ugt i64 %div, %add20
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i1, i1* %out., align 1
  %in. = and i1 %7, %cmp
  %cond.fold = or i1 false, %in.
  store i1 %cond.fold, i1* %out.7, align 1
  %sub21 = sub i64 %div, 2
  %mul = mul i64 64, %sub21
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %num_starting_blocks.0.rewritten = phi i64 [ %sub21, %if.then ], [ 0, %entry ]
  %k.0.rewritten = phi i64 [ %mul, %if.then ], [ 0, %entry ]
  %8 = load i1, i1* %out.7, align 1
  %9 = load i1, i1* %out., align 1
  %10 = xor i1 %cmp, true
  %in.62 = and i1 %9, %10
  %cond.fold63 = or i1 false, %in.62
  %cond.fold64 = or i1 %cond.fold63, %8
  store i1 %cond.fold64, i1* %out.8, align 1
  %len22 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %11 = load i64, i64* %len22, align 8
  %cmp23 = icmp uge i64 %11, %k.0.rewritten
  br i1 %cmp23, label %if.then24, label %if.else

if.then24:                                        ; preds = %if.end
  %12 = load i1, i1* %out.8, align 1
  %in.65 = and i1 %12, %cmp23
  %cond.fold66 = or i1 false, %in.65
  store i1 %cond.fold66, i1* %out.9, align 1
  br label %if.end25

if.else:                                          ; preds = %if.end
  %13 = load i1, i1* %out.8, align 1
  %14 = xor i1 %cmp23, true
  %in.67 = and i1 %13, %14
  %cond.fold68 = or i1 false, %in.67
  store i1 %cond.fold68, i1* %out.10, align 1
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 noundef 75, i8* noundef getelementptr inbounds ([135 x i8], [135 x i8]* @__PRETTY_FUNCTION__.__ssl3_cbc_digest_record, i64 0, i64 0)) #7
  br label %UnifiedUnreachableBlock

if.end25:                                         ; preds = %if.then24
  %15 = load i1, i1* %out.9, align 1
  %cond.fold69 = or i1 false, %15
  store i1 %cond.fold69, i1* %out.11, align 1
  %len26 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %16 = load i64, i64* %len26, align 8
  %mul27 = mul i64 2, 64
  %cmp28 = icmp ule i64 %16, %mul27
  br i1 %cmp28, label %if.then29, label %if.else30

if.then29:                                        ; preds = %if.end25
  %17 = load i1, i1* %out.11, align 1
  %in.70 = and i1 %17, %cmp28
  %cond.fold71 = or i1 false, %in.70
  store i1 %cond.fold71, i1* %out.12, align 1
  br label %if.end31

if.else30:                                        ; preds = %if.end25
  %18 = load i1, i1* %out.11, align 1
  %19 = xor i1 %cmp28, true
  %in.72 = and i1 %18, %19
  %cond.fold73 = or i1 false, %in.72
  store i1 %cond.fold73, i1* %out.13, align 1
  call void @__assert_fail(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 noundef 76, i8* noundef getelementptr inbounds ([135 x i8], [135 x i8]* @__PRETTY_FUNCTION__.__ssl3_cbc_digest_record, i64 0, i64 0)) #7
  br label %UnifiedUnreachableBlock

if.end31:                                         ; preds = %if.then29
  %20 = load i1, i1* %out.12, align 1
  %cond.fold74 = or i1 false, %20
  store i1 %cond.fold74, i1* %out.14, align 1
  %21 = bitcast [128 x i8]* %first_block to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %21, i8 0, i64 128, i1 false)
  %mul32 = mul i64 8, %sub16
  %22 = bitcast [16 x i8]* %length_bytes to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %22, i8 0, i64 16, i1 false)
  %shr = lshr i64 %mul32, 24
  %conv = trunc i64 %shr to i8
  %sub33 = sub i64 8, 4
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %length_bytes, i64 0, i64 %sub33
  store i8 %conv, i8* %arrayidx, align 1
  %shr34 = lshr i64 %mul32, 16
  %conv35 = trunc i64 %shr34 to i8
  %sub36 = sub i64 8, 3
  %arrayidx37 = getelementptr inbounds [16 x i8], [16 x i8]* %length_bytes, i64 0, i64 %sub36
  store i8 %conv35, i8* %arrayidx37, align 1
  %shr38 = lshr i64 %mul32, 8
  %conv39 = trunc i64 %shr38 to i8
  %sub40 = sub i64 8, 2
  %arrayidx41 = getelementptr inbounds [16 x i8], [16 x i8]* %length_bytes, i64 0, i64 %sub40
  store i8 %conv39, i8* %arrayidx41, align 1
  %conv42 = trunc i64 %mul32 to i8
  %sub43 = sub i64 8, 1
  %arrayidx44 = getelementptr inbounds [16 x i8], [16 x i8]* %length_bytes, i64 0, i64 %sub43
  store i8 %conv42, i8* %arrayidx44, align 1
  %cmp45 = icmp ugt i64 %k.0.rewritten, 0
  br i1 %cmp45, label %if.then47, label %if.end66

if.then47:                                        ; preds = %if.end31
  %23 = load i1, i1* %out.14, align 1
  %in.75 = and i1 %23, %cmp45
  %cond.fold76 = or i1 false, %in.75
  store i1 %cond.fold76, i1* %out.15, align 1
  %len48 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %24 = load i64, i64* %len48, align 8
  %cmp49 = icmp ule i64 %24, 64
  br i1 %cmp49, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.then47
  %25 = load i1, i1* %out.15, align 1
  %in.77 = and i1 %25, %cmp49
  %cond.fold78 = or i1 false, %in.77
  store i1 %cond.fold78, i1* %out.16, align 1
  br label %return

if.end52:                                         ; preds = %if.then47
  %26 = load i1, i1* %out.15, align 1
  %27 = xor i1 %cmp49, true
  %in.79 = and i1 %26, %27
  %cond.fold80 = or i1 false, %in.79
  store i1 %cond.fold80, i1* %out.17, align 1
  %len53 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %28 = load i64, i64* %len53, align 8
  %sub54 = sub i64 %28, 64
  %29 = load i8*, i8** %md_state_buf, align 8
  %30 = bitcast i8* %29 to %struct.SHAstate_st*
  %31 = load i8*, i8** %header_buf, align 8
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %30, i8* noundef %31)
  %arraydecay = getelementptr inbounds [128 x i8], [128 x i8]* %first_block, i64 0, i64 0
  %32 = load i8*, i8** %header_buf, align 8
  %arrayidx55 = getelementptr inbounds i8, i8* %32, i64 64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %arrayidx55, i64 %sub54, i1 false)
  %sub56 = sub i64 64, %sub54
  %arrayidx57 = getelementptr inbounds [128 x i8], [128 x i8]* %first_block, i64 0, i64 %sub54
  %33 = load i8*, i8** %data_buf, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arrayidx57, i8* align 1 %33, i64 %sub56, i1 false)
  %34 = load i8*, i8** %md_state_buf, align 8
  %35 = bitcast i8* %34 to %struct.SHAstate_st*
  %arraydecay58 = getelementptr inbounds [128 x i8], [128 x i8]* %first_block, i64 0, i64 0
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %35, i8* noundef %arraydecay58)
  %div59 = udiv i64 %k.0.rewritten, 64
  %sub60 = sub i64 %div59, 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end52
  %i.0.rewritten = phi i64 [ 1, %if.end52 ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %if.end52 ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp61, %for.inc ], [ false, %if.end52 ]
  %36 = load i1, i1* %out.20, align 1
  %37 = load i1, i1* %out.17, align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %37
  %cond.fold81 = or i1 %fwcond.and.fwtaken, %36
  store i1 %cond.fold81, i1* %out.18, align 1
  %cmp61 = icmp ult i64 %i.0.rewritten, %sub60
  br i1 %cmp61, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %38 = load i1, i1* %out.18, align 1
  %in.82 = and i1 %38, %cmp61
  %cond.fold83 = or i1 false, %in.82
  store i1 %cond.fold83, i1* %out.19, align 1
  %mul63 = mul i64 64, %i.0.rewritten
  %sub64 = sub i64 %mul63, %sub54
  %39 = load i8*, i8** %md_state_buf, align 8
  %40 = bitcast i8* %39 to %struct.SHAstate_st*
  %41 = load i8*, i8** %data_buf, align 8
  %arrayidx65 = getelementptr inbounds i8, i8* %41, i64 %sub64
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %40, i8* noundef %arrayidx65)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %42 = load i1, i1* %out.19, align 1
  %cond.fold84 = or i1 false, %42
  store i1 %cond.fold84, i1* %out.20, align 1
  %inc = add i64 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %43 = load i1, i1* %out.18, align 1
  %44 = xor i1 %cmp61, true
  %in.85 = and i1 %43, %44
  %cond.fold86 = or i1 false, %in.85
  store i1 %cond.fold86, i1* %out.21, align 1
  br label %if.end66

if.end66:                                         ; preds = %for.end, %if.end31
  %45 = load i1, i1* %out.21, align 1
  %46 = load i1, i1* %out.14, align 1
  %47 = xor i1 %cmp45, true
  %in.87 = and i1 %46, %47
  %cond.fold88 = or i1 false, %45
  %cond.fold89 = or i1 %cond.fold88, %in.87
  store i1 %cond.fold89, i1* %out.22, align 1
  %add68 = add i64 %num_starting_blocks.0.rewritten, 2
  %add69 = add i64 %add68, 1
  br label %for.cond71

for.cond71:                                       ; preds = %for.inc168, %if.end66
  %k.1.rewritten = phi i64 [ %k.0.rewritten, %if.end66 ], [ %k.2.lcssa.rewritten, %for.inc168 ]
  %i70.0.rewritten = phi i64 [ %num_starting_blocks.0.rewritten, %if.end66 ], [ %inc169, %for.inc168 ]
  %fwedge.taken1.rewritten = phi i1 [ true, %if.end66 ], [ false, %for.inc168 ]
  %exitpred.frozen2.rewritten = phi i1 [ %cmp72, %for.inc168 ], [ false, %if.end66 ]
  %48 = load i1, i1* %out.58, align 1
  %49 = load i1, i1* %out.22, align 1
  %fwcond.and.fwtaken90 = and i1 %fwedge.taken1.rewritten, %49
  %cond.fold91 = or i1 %fwcond.and.fwtaken90, %48
  store i1 %cond.fold91, i1* %out.23, align 1
  %cmp72 = icmp ult i64 %i70.0.rewritten, %add69
  br i1 %cmp72, label %for.body74, label %for.end170

for.body74:                                       ; preds = %for.cond71
  %50 = load i1, i1* %out.23, align 1
  %in.92 = and i1 %50, %cmp72
  %cond.fold93 = or i1 false, %in.92
  store i1 %cond.fold93, i1* %out.24, align 1
  %51 = bitcast [128 x i8]* %block to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %51, i8 0, i64 128, i1 false)
  %cmp75 = icmp eq i64 %i70.0.rewritten, %div17
  %frombool = zext i1 %cmp75 to i8
  %cmp77 = icmp eq i64 %i70.0.rewritten, %div19
  %frombool79 = zext i1 %cmp77 to i8
  br label %for.cond80

for.cond80:                                       ; preds = %for.inc144, %for.body74
  %k.2.rewritten = phi i64 [ %k.1.rewritten, %for.body74 ], [ %inc101, %for.inc144 ]
  %j.0.rewritten = phi i64 [ 0, %for.body74 ], [ %inc145, %for.inc144 ]
  %fwedge.taken3.rewritten = phi i1 [ true, %for.body74 ], [ false, %for.inc144 ]
  %exitpred.frozen4.rewritten = phi i1 [ %cmp81, %for.inc144 ], [ false, %for.body74 ]
  %52 = load i1, i1* %out.49, align 1
  %53 = load i1, i1* %out.24, align 1
  %fwcond.and.fwtaken94 = and i1 %fwedge.taken3.rewritten, %53
  %cond.fold95 = or i1 %fwcond.and.fwtaken94, %52
  store i1 %cond.fold95, i1* %out.25, align 1
  %cmp81 = icmp ult i64 %j.0.rewritten, 64
  br i1 %cmp81, label %for.body83, label %for.end146

for.body83:                                       ; preds = %for.cond80
  %54 = load i1, i1* %out.25, align 1
  %in.96 = and i1 %54, %cmp81
  %cond.fold97 = or i1 false, %in.96
  store i1 %cond.fold97, i1* %out.26, align 1
  %len84 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %55 = load i64, i64* %len84, align 8
  %cmp85 = icmp ult i64 %k.2.rewritten, %55
  br i1 %cmp85, label %if.then87, label %if.else89

if.then87:                                        ; preds = %for.body83
  %56 = load i1, i1* %out.26, align 1
  %in.98 = and i1 %56, %cmp85
  %cond.fold99 = or i1 false, %in.98
  store i1 %cond.fold99, i1* %out.27, align 1
  %57 = load i8*, i8** %header_buf, align 8
  %arrayidx88 = getelementptr inbounds i8, i8* %57, i64 %k.2.rewritten
  %58 = load i8, i8* %arrayidx88, align 1
  br label %if.end100

if.else89:                                        ; preds = %for.body83
  %59 = load i1, i1* %out.26, align 1
  %60 = xor i1 %cmp85, true
  %in.100 = and i1 %59, %60
  %cond.fold101 = or i1 false, %in.100
  store i1 %cond.fold101, i1* %out.28, align 1
  %len90 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %61 = load i64, i64* %len90, align 8
  %len91 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %62 = load i64, i64* %len91, align 8
  %add92 = add i64 %61, %62
  %cmp93 = icmp ult i64 %k.2.rewritten, %add92
  br i1 %cmp93, label %if.then95, label %if.end99

if.then95:                                        ; preds = %if.else89
  %63 = load i1, i1* %out.28, align 1
  %in.102 = and i1 %63, %cmp93
  %cond.fold103 = or i1 false, %in.102
  store i1 %cond.fold103, i1* %out.29, align 1
  %64 = load i8*, i8** %data_buf, align 8
  %len96 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %65 = load i64, i64* %len96, align 8
  %sub97 = sub i64 %k.2.rewritten, %65
  %arrayidx98 = getelementptr inbounds i8, i8* %64, i64 %sub97
  %66 = load i8, i8* %arrayidx98, align 1
  br label %if.end99

if.end99:                                         ; preds = %if.then95, %if.else89
  %b.0.rewritten = phi i8 [ %66, %if.then95 ], [ 0, %if.else89 ]
  %67 = load i1, i1* %out.29, align 1
  %68 = load i1, i1* %out.28, align 1
  %69 = xor i1 %cmp93, true
  %in.104 = and i1 %68, %69
  %cond.fold105 = or i1 false, %in.104
  %cond.fold106 = or i1 %cond.fold105, %67
  store i1 %cond.fold106, i1* %out.30, align 1
  br label %if.end100

if.end100:                                        ; preds = %if.end99, %if.then87
  %b.1.rewritten = phi i8 [ %58, %if.then87 ], [ %b.0.rewritten, %if.end99 ]
  %70 = load i1, i1* %out.30, align 1
  %71 = load i1, i1* %out.27, align 1
  %cond.fold107 = or i1 false, %70
  %cond.fold108 = or i1 %cond.fold107, %71
  store i1 %cond.fold108, i1* %out.31, align 1
  %inc101 = add i64 %k.2.rewritten, 1
  %tobool = trunc i8 %frombool to i1
  br label %land.rhs

land.rhs:                                         ; preds = %if.end100
  %72 = load i1, i1* %out.31, align 1
  %in.109 = and i1 %72, %tobool
  %cond.fold110 = or i1 false, %in.109
  store i1 %cond.fold110, i1* %out.32, align 1
  %73 = load i1, i1* %out.32, align 1
  %cmp103 = icmp uge i64 %j.0.rewritten, %rem
  br label %land.end

land.end:                                         ; preds = %land.rhs
  %phi.rewritten = phi i1 [ %cmp103, %land.rhs ]
  %74 = load i1, i1* %out.32, align 1
  %75 = load i1, i1* %out.31, align 1
  %76 = xor i1 %tobool, true
  %in.111 = and i1 %75, %76
  %phi.fold = select i1 %in.111, i1 false, i1 %phi.rewritten
  %cond.fold112 = or i1 false, %74
  %cond.fold113 = or i1 %cond.fold112, %in.111
  store i1 %cond.fold113, i1* %out.33, align 1
  %frombool105 = zext i1 %phi.fold to i8
  %tobool106 = trunc i8 %frombool to i1
  br label %land.rhs108

land.rhs108:                                      ; preds = %land.end
  %77 = load i1, i1* %out.33, align 1
  %in.114 = and i1 %77, %tobool106
  %cond.fold115 = or i1 false, %in.114
  store i1 %cond.fold115, i1* %out.34, align 1
  %78 = load i1, i1* %out.34, align 1
  %add109 = add i64 %rem, 1
  %cmp110 = icmp uge i64 %j.0.rewritten, %add109
  br label %land.end112

land.end112:                                      ; preds = %land.rhs108
  %phi.rewritten177 = phi i1 [ %cmp110, %land.rhs108 ]
  %79 = load i1, i1* %out.34, align 1
  %80 = load i1, i1* %out.33, align 1
  %81 = xor i1 %tobool106, true
  %in.116 = and i1 %80, %81
  %phi.fold178 = select i1 %in.116, i1 false, i1 %phi.rewritten177
  %cond.fold117 = or i1 false, %in.116
  %cond.fold118 = or i1 %cond.fold117, %79
  store i1 %cond.fold118, i1* %out.35, align 1
  %frombool113 = zext i1 %phi.fold178 to i8
  %tobool114 = trunc i8 %frombool105 to i1
  br label %cond.false

cond.true:                                        ; preds = %cond.false
  %82 = load i1, i1* %out.35, align 1
  %in.119 = and i1 %82, %tobool114
  %cond.fold120 = or i1 false, %in.119
  store i1 %cond.fold120, i1* %out.36, align 1
  %83 = load i1, i1* %out.36, align 1
  br label %cond.end

cond.false:                                       ; preds = %land.end112
  %84 = load i1, i1* %out.35, align 1
  %85 = xor i1 %tobool114, true
  %in.121 = and i1 %84, %85
  %cond.fold122 = or i1 false, %in.121
  store i1 %cond.fold122, i1* %out.37, align 1
  %86 = load i1, i1* %out.37, align 1
  %conv116 = zext i8 %b.1.rewritten to i32
  br label %cond.true

cond.end:                                         ; preds = %cond.true
  %cond.rewritten = phi i32 [ 128, %cond.true ]
  %87 = load i1, i1* %out.37, align 1
  %phi.fold179 = select i1 %87, i32 %conv116, i32 %cond.rewritten
  %88 = load i1, i1* %out.36, align 1
  %cond.fold123 = or i1 false, %88
  %cond.fold124 = or i1 %cond.fold123, %87
  store i1 %cond.fold124, i1* %out.38, align 1
  %conv117 = trunc i32 %phi.fold179 to i8
  %tobool118 = trunc i8 %frombool113 to i1
  br label %if.then119

if.then119:                                       ; preds = %cond.end
  %89 = load i1, i1* %out.38, align 1
  %in.125 = and i1 %89, %tobool118
  %cond.fold126 = or i1 false, %in.125
  store i1 %cond.fold126, i1* %out.39, align 1
  %90 = load i1, i1* %out.39, align 1
  br label %if.end120

if.end120:                                        ; preds = %if.then119
  %b.2.rewritten = phi i8 [ 0, %if.then119 ]
  %91 = load i1, i1* %out.39, align 1
  %92 = load i1, i1* %out.38, align 1
  %93 = xor i1 %tobool118, true
  %in.127 = and i1 %92, %93
  %phi.fold180 = select i1 %in.127, i8 %conv117, i8 %b.2.rewritten
  %cond.fold128 = or i1 false, %91
  %cond.fold129 = or i1 %cond.fold128, %in.127
  store i1 %cond.fold129, i1* %out.40, align 1
  %tobool121 = trunc i8 %frombool79 to i1
  br label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end120
  %94 = load i1, i1* %out.40, align 1
  %in.130 = and i1 %94, %tobool121
  %cond.fold131 = or i1 false, %in.130
  store i1 %cond.fold131, i1* %out.41, align 1
  %95 = load i1, i1* %out.41, align 1
  %tobool123 = trunc i8 %frombool to i1
  %96 = bitcast i64* %shadow to i1*
  %ctsel = select i1 %95, i1* %pred.alloca, i1* %96
  %97 = load i1, i1* %ctsel, align 1
  %select.val. = select i1 %95, i1 %tobool123, i1 %97
  store i1 %select.val., i1* %ctsel, align 1
  br label %if.then124

if.then124:                                       ; preds = %land.lhs.true
  %98 = load i1, i1* %out.41, align 1
  %99 = xor i1 %tobool123, true
  %in.132 = and i1 %98, %99
  %cond.fold133 = or i1 false, %in.132
  store i1 %cond.fold133, i1* %out.42, align 1
  %100 = load i1, i1* %out.42, align 1
  br label %if.end125

if.end125:                                        ; preds = %if.then124
  %b.3.rewritten = phi i8 [ 0, %if.then124 ]
  %pred.load = load i1, i1* %pred.alloca, align 1
  %101 = load i1, i1* %out.42, align 1
  %102 = load i1, i1* %out.41, align 1
  %in.134 = and i1 %102, %pred.load
  %103 = load i1, i1* %out.40, align 1
  %104 = xor i1 %tobool121, true
  %in.135 = and i1 %103, %104
  %phi.fold181 = select i1 %in.134, i8 %phi.fold180, i8 %b.3.rewritten
  %phi.fold182 = select i1 %in.135, i8 %phi.fold180, i8 %phi.fold181
  %cond.fold136 = or i1 false, %101
  %cond.fold137 = or i1 %cond.fold136, %in.135
  %cond.fold138 = or i1 %cond.fold137, %in.134
  store i1 %cond.fold138, i1* %out.43, align 1
  %sub126 = sub i64 64, 8
  %cmp127 = icmp uge i64 %j.0.rewritten, %sub126
  br i1 %cmp127, label %if.then129, label %if.end142

if.then129:                                       ; preds = %if.end125
  %105 = load i1, i1* %out.43, align 1
  %in.139 = and i1 %105, %cmp127
  %cond.fold140 = or i1 false, %in.139
  store i1 %cond.fold140, i1* %out.44, align 1
  %tobool130 = trunc i8 %frombool79 to i1
  br label %cond.false137

cond.true132:                                     ; preds = %cond.false137
  %106 = load i1, i1* %out.44, align 1
  %in.141 = and i1 %106, %tobool130
  %cond.fold142 = or i1 false, %in.141
  store i1 %cond.fold142, i1* %out.45, align 1
  %107 = load i1, i1* %out.45, align 1
  %sub133 = sub i64 64, 8
  %sub134 = sub i64 %j.0.rewritten, %sub133
  %arrayidx135 = getelementptr inbounds [16 x i8], [16 x i8]* %length_bytes, i64 0, i64 %sub134
  %idx1.safe = icmp slt i64 %sub134, 16
  %access.safe = and i1 true, %idx1.safe
  %108 = or i1 %107, %access.safe
  %109 = bitcast i64* %shadow to i8*
  %ctsel173 = select i1 %108, i8* %arrayidx135, i8* %109
  %110 = load i8, i8* %ctsel173, align 1
  %conv136 = zext i8 %110 to i32
  br label %cond.end139

cond.false137:                                    ; preds = %if.then129
  %111 = load i1, i1* %out.44, align 1
  %112 = xor i1 %tobool130, true
  %in.143 = and i1 %111, %112
  %cond.fold144 = or i1 false, %in.143
  store i1 %cond.fold144, i1* %out.46, align 1
  %113 = load i1, i1* %out.46, align 1
  %conv138 = zext i8 %phi.fold182 to i32
  br label %cond.true132

cond.end139:                                      ; preds = %cond.true132
  %cond140.rewritten = phi i32 [ %conv136, %cond.true132 ]
  %114 = load i1, i1* %out.46, align 1
  %phi.fold183 = select i1 %114, i32 %conv138, i32 %cond140.rewritten
  %115 = load i1, i1* %out.45, align 1
  %cond.fold145 = or i1 false, %114
  %cond.fold146 = or i1 %cond.fold145, %115
  store i1 %cond.fold146, i1* %out.47, align 1
  %conv141 = trunc i32 %phi.fold183 to i8
  br label %if.end142

if.end142:                                        ; preds = %cond.end139, %if.end125
  %b.4.rewritten = phi i8 [ %conv141, %cond.end139 ], [ %phi.fold182, %if.end125 ]
  %116 = load i1, i1* %out.47, align 1
  %117 = load i1, i1* %out.43, align 1
  %118 = xor i1 %cmp127, true
  %in.147 = and i1 %117, %118
  %cond.fold148 = or i1 false, %116
  %cond.fold149 = or i1 %cond.fold148, %in.147
  store i1 %cond.fold149, i1* %out.48, align 1
  %arrayidx143 = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 %j.0.rewritten
  store i8 %b.4.rewritten, i8* %arrayidx143, align 1
  br label %for.inc144

for.inc144:                                       ; preds = %if.end142
  %119 = load i1, i1* %out.48, align 1
  %cond.fold150 = or i1 false, %119
  store i1 %cond.fold150, i1* %out.49, align 1
  %inc145 = add i64 %j.0.rewritten, 1
  br label %for.cond80, !llvm.loop !8

for.end146:                                       ; preds = %for.cond80
  %k.2.lcssa.rewritten = phi i64 [ %k.2.rewritten, %for.cond80 ]
  %120 = load i1, i1* %out.25, align 1
  %121 = xor i1 %cmp81, true
  %in.151 = and i1 %120, %121
  %cond.fold152 = or i1 false, %in.151
  store i1 %cond.fold152, i1* %out.50, align 1
  %122 = load i8*, i8** %md_state_buf, align 8
  %123 = bitcast i8* %122 to %struct.SHAstate_st*
  %arraydecay147 = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 0
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %123, i8* noundef %arraydecay147)
  %124 = load i8*, i8** %md_state_buf, align 8
  %125 = bitcast i8* %124 to %struct.SHAstate_st*
  %arraydecay148 = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 0
  %arraydecay148.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay148.wrapped, i32 0, i32 0
  %arraydecay148.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay148.wrapped, i32 0, i32 1
  store i64 128, i64* %arraydecay148.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay148, i8** %arraydecay148.unwrapped, align 8
  call void @md_final_raw(%struct.SHAstate_st* %125, %struct.uint8ptr_wrapped_ty* %arraydecay148.wrapped)
  br label %for.cond150

for.cond150:                                      ; preds = %for.inc165, %for.end146
  %j149.0.rewritten = phi i64 [ 0, %for.end146 ], [ %inc166, %for.inc165 ]
  %fwedge.taken5.rewritten = phi i1 [ true, %for.end146 ], [ false, %for.inc165 ]
  %exitpred.frozen6.rewritten = phi i1 [ %cmp151, %for.inc165 ], [ false, %for.end146 ]
  %126 = load i1, i1* %out.56, align 1
  %127 = load i1, i1* %out.50, align 1
  %fwcond.and.fwtaken153 = and i1 %fwedge.taken5.rewritten, %127
  %cond.fold154 = or i1 %fwcond.and.fwtaken153, %126
  store i1 %cond.fold154, i1* %out.51, align 1
  %cmp151 = icmp ult i64 %j149.0.rewritten, 20
  br i1 %cmp151, label %for.body153, label %for.end167

for.body153:                                      ; preds = %for.cond150
  %128 = load i1, i1* %out.51, align 1
  %in.155 = and i1 %128, %cmp151
  %cond.fold156 = or i1 false, %in.155
  store i1 %cond.fold156, i1* %out.52, align 1
  %tobool154 = trunc i8 %frombool79 to i1
  br label %cond.false159

cond.true156:                                     ; preds = %cond.false159
  %129 = load i1, i1* %out.52, align 1
  %in.157 = and i1 %129, %tobool154
  %cond.fold158 = or i1 false, %in.157
  store i1 %cond.fold158, i1* %out.53, align 1
  %130 = load i1, i1* %out.53, align 1
  %arrayidx157 = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 %j149.0.rewritten
  %idx1.safe174 = icmp slt i64 %j149.0.rewritten, 128
  %access.safe175 = and i1 true, %idx1.safe174
  %131 = or i1 %130, %access.safe175
  %132 = bitcast i64* %shadow to i8*
  %ctsel176 = select i1 %131, i8* %arrayidx157, i8* %132
  %133 = load i8, i8* %ctsel176, align 1
  %conv158 = zext i8 %133 to i32
  br label %cond.end160

cond.false159:                                    ; preds = %for.body153
  %134 = load i1, i1* %out.52, align 1
  %135 = xor i1 %tobool154, true
  %in.159 = and i1 %134, %135
  %cond.fold160 = or i1 false, %in.159
  store i1 %cond.fold160, i1* %out.54, align 1
  %136 = load i1, i1* %out.54, align 1
  br label %cond.true156

cond.end160:                                      ; preds = %cond.true156
  %cond161.rewritten = phi i32 [ %conv158, %cond.true156 ]
  %137 = load i1, i1* %out.54, align 1
  %phi.fold184 = select i1 %137, i32 0, i32 %cond161.rewritten
  %138 = load i1, i1* %out.53, align 1
  %cond.fold161 = or i1 false, %137
  %cond.fold162 = or i1 %cond.fold161, %138
  store i1 %cond.fold162, i1* %out.55, align 1
  %139 = load i8*, i8** %mac_out_buf, align 8
  %arrayidx162 = getelementptr inbounds i8, i8* %139, i64 %j149.0.rewritten
  %140 = load i8, i8* %arrayidx162, align 1
  %conv163 = zext i8 %140 to i32
  %or = or i32 %conv163, %phi.fold184
  %conv164 = trunc i32 %or to i8
  store i8 %conv164, i8* %arrayidx162, align 1
  br label %for.inc165

for.inc165:                                       ; preds = %cond.end160
  %141 = load i1, i1* %out.55, align 1
  %cond.fold163 = or i1 false, %141
  store i1 %cond.fold163, i1* %out.56, align 1
  %inc166 = add i64 %j149.0.rewritten, 1
  br label %for.cond150, !llvm.loop !9

for.end167:                                       ; preds = %for.cond150
  %142 = load i1, i1* %out.51, align 1
  %143 = xor i1 %cmp151, true
  %in.164 = and i1 %142, %143
  %cond.fold165 = or i1 false, %in.164
  store i1 %cond.fold165, i1* %out.57, align 1
  br label %for.inc168

for.inc168:                                       ; preds = %for.end167
  %144 = load i1, i1* %out.57, align 1
  %cond.fold166 = or i1 false, %144
  store i1 %cond.fold166, i1* %out.58, align 1
  %inc169 = add i64 %i70.0.rewritten, 1
  br label %for.cond71, !llvm.loop !10

for.end170:                                       ; preds = %for.cond71
  %145 = load i1, i1* %out.23, align 1
  %146 = xor i1 %cmp72, true
  %in.167 = and i1 %145, %146
  %cond.fold168 = or i1 false, %in.167
  store i1 %cond.fold168, i1* %out.59, align 1
  br label %return

return:                                           ; preds = %for.end170, %if.then51
  %retval.0.rewritten = phi i32 [ 0, %if.then51 ], [ 1, %for.end170 ]
  %147 = load i1, i1* %out.59, align 1
  %148 = load i1, i1* %out.16, align 1
  %cond.fold169 = or i1 false, %148
  %cond.fold170 = or i1 %cond.fold169, %147
  store i1 %cond.fold170, i1* %out.60, align 1
  ret i32 %retval.0.rewritten

UnifiedUnreachableBlock:                          ; preds = %if.else30, %if.else
  %149 = load i1, i1* %out.13, align 1
  %150 = load i1, i1* %out.10, align 1
  %cond.fold171 = or i1 false, %149
  %cond.fold172 = or i1 %cond.fold171, %150
  store i1 %cond.fold172, i1* %out.61, align 1
  unreachable
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @SHA1_Transform(%struct.SHAstate_st* noundef, i8* noundef) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @md_final_raw(%struct.SHAstate_st* noundef %ctx, %struct.uint8ptr_wrapped_ty* noundef %md_out) #0 {
entry:
  %md_out.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_out, i32 0, i32 1
  %md_out.field0.length = load i64, i64* %md_out.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_out, i32 0, i32 0
  %md_out.unwrapped = load i8*, i8** %0, align 8
  %h0 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 0
  %1 = load i32, i32* %h0, align 4
  %shr = lshr i32 %1, 24
  %and = and i32 %shr, 255
  %conv = trunc i32 %and to i8
  %incdec.ptr = getelementptr inbounds i8, i8* %md_out.unwrapped, i32 1
  store i8 %conv, i8* %md_out.unwrapped, align 1
  %h01 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 0
  %2 = load i32, i32* %h01, align 4
  %shr2 = lshr i32 %2, 16
  %and3 = and i32 %shr2, 255
  %conv4 = trunc i32 %and3 to i8
  %incdec.ptr5 = getelementptr inbounds i8, i8* %incdec.ptr, i32 1
  store i8 %conv4, i8* %incdec.ptr, align 1
  %h06 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 0
  %3 = load i32, i32* %h06, align 4
  %shr7 = lshr i32 %3, 8
  %and8 = and i32 %shr7, 255
  %conv9 = trunc i32 %and8 to i8
  %incdec.ptr10 = getelementptr inbounds i8, i8* %incdec.ptr5, i32 1
  store i8 %conv9, i8* %incdec.ptr5, align 1
  %h011 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 0
  %4 = load i32, i32* %h011, align 4
  %and12 = and i32 %4, 255
  %conv13 = trunc i32 %and12 to i8
  %incdec.ptr14 = getelementptr inbounds i8, i8* %incdec.ptr10, i32 1
  store i8 %conv13, i8* %incdec.ptr10, align 1
  %h1 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 1
  %5 = load i32, i32* %h1, align 4
  %shr15 = lshr i32 %5, 24
  %and16 = and i32 %shr15, 255
  %conv17 = trunc i32 %and16 to i8
  %incdec.ptr18 = getelementptr inbounds i8, i8* %incdec.ptr14, i32 1
  store i8 %conv17, i8* %incdec.ptr14, align 1
  %h119 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 1
  %6 = load i32, i32* %h119, align 4
  %shr20 = lshr i32 %6, 16
  %and21 = and i32 %shr20, 255
  %conv22 = trunc i32 %and21 to i8
  %incdec.ptr23 = getelementptr inbounds i8, i8* %incdec.ptr18, i32 1
  store i8 %conv22, i8* %incdec.ptr18, align 1
  %h124 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 1
  %7 = load i32, i32* %h124, align 4
  %shr25 = lshr i32 %7, 8
  %and26 = and i32 %shr25, 255
  %conv27 = trunc i32 %and26 to i8
  %incdec.ptr28 = getelementptr inbounds i8, i8* %incdec.ptr23, i32 1
  store i8 %conv27, i8* %incdec.ptr23, align 1
  %h129 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 1
  %8 = load i32, i32* %h129, align 4
  %and30 = and i32 %8, 255
  %conv31 = trunc i32 %and30 to i8
  %incdec.ptr32 = getelementptr inbounds i8, i8* %incdec.ptr28, i32 1
  store i8 %conv31, i8* %incdec.ptr28, align 1
  %h2 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 2
  %9 = load i32, i32* %h2, align 4
  %shr33 = lshr i32 %9, 24
  %and34 = and i32 %shr33, 255
  %conv35 = trunc i32 %and34 to i8
  %incdec.ptr36 = getelementptr inbounds i8, i8* %incdec.ptr32, i32 1
  store i8 %conv35, i8* %incdec.ptr32, align 1
  %h237 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 2
  %10 = load i32, i32* %h237, align 4
  %shr38 = lshr i32 %10, 16
  %and39 = and i32 %shr38, 255
  %conv40 = trunc i32 %and39 to i8
  %incdec.ptr41 = getelementptr inbounds i8, i8* %incdec.ptr36, i32 1
  store i8 %conv40, i8* %incdec.ptr36, align 1
  %h242 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 2
  %11 = load i32, i32* %h242, align 4
  %shr43 = lshr i32 %11, 8
  %and44 = and i32 %shr43, 255
  %conv45 = trunc i32 %and44 to i8
  %incdec.ptr46 = getelementptr inbounds i8, i8* %incdec.ptr41, i32 1
  store i8 %conv45, i8* %incdec.ptr41, align 1
  %h247 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 2
  %12 = load i32, i32* %h247, align 4
  %and48 = and i32 %12, 255
  %conv49 = trunc i32 %and48 to i8
  %incdec.ptr50 = getelementptr inbounds i8, i8* %incdec.ptr46, i32 1
  store i8 %conv49, i8* %incdec.ptr46, align 1
  %h3 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 3
  %13 = load i32, i32* %h3, align 4
  %shr51 = lshr i32 %13, 24
  %and52 = and i32 %shr51, 255
  %conv53 = trunc i32 %and52 to i8
  %incdec.ptr54 = getelementptr inbounds i8, i8* %incdec.ptr50, i32 1
  store i8 %conv53, i8* %incdec.ptr50, align 1
  %h355 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 3
  %14 = load i32, i32* %h355, align 4
  %shr56 = lshr i32 %14, 16
  %and57 = and i32 %shr56, 255
  %conv58 = trunc i32 %and57 to i8
  %incdec.ptr59 = getelementptr inbounds i8, i8* %incdec.ptr54, i32 1
  store i8 %conv58, i8* %incdec.ptr54, align 1
  %h360 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 3
  %15 = load i32, i32* %h360, align 4
  %shr61 = lshr i32 %15, 8
  %and62 = and i32 %shr61, 255
  %conv63 = trunc i32 %and62 to i8
  %incdec.ptr64 = getelementptr inbounds i8, i8* %incdec.ptr59, i32 1
  store i8 %conv63, i8* %incdec.ptr59, align 1
  %h365 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 3
  %16 = load i32, i32* %h365, align 4
  %and66 = and i32 %16, 255
  %conv67 = trunc i32 %and66 to i8
  %incdec.ptr68 = getelementptr inbounds i8, i8* %incdec.ptr64, i32 1
  store i8 %conv67, i8* %incdec.ptr64, align 1
  %h4 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 4
  %17 = load i32, i32* %h4, align 4
  %shr69 = lshr i32 %17, 24
  %and70 = and i32 %shr69, 255
  %conv71 = trunc i32 %and70 to i8
  %incdec.ptr72 = getelementptr inbounds i8, i8* %incdec.ptr68, i32 1
  store i8 %conv71, i8* %incdec.ptr68, align 1
  %h473 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 4
  %18 = load i32, i32* %h473, align 4
  %shr74 = lshr i32 %18, 16
  %and75 = and i32 %shr74, 255
  %conv76 = trunc i32 %and75 to i8
  %incdec.ptr77 = getelementptr inbounds i8, i8* %incdec.ptr72, i32 1
  store i8 %conv76, i8* %incdec.ptr72, align 1
  %h478 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 4
  %19 = load i32, i32* %h478, align 4
  %shr79 = lshr i32 %19, 8
  %and80 = and i32 %shr79, 255
  %conv81 = trunc i32 %and80 to i8
  %incdec.ptr82 = getelementptr inbounds i8, i8* %incdec.ptr77, i32 1
  store i8 %conv81, i8* %incdec.ptr77, align 1
  %h483 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 4
  %20 = load i32, i32* %h483, align 4
  %and84 = and i32 %20, 255
  %conv85 = trunc i32 %and84 to i8
  %incdec.ptr86 = getelementptr inbounds i8, i8* %incdec.ptr82, i32 1
  store i8 %conv85, i8* %incdec.ptr82, align 1
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %md_state = alloca %struct.uint8ptr_wrapped_ty, align 8
  %mac_out = alloca %struct.uint8ptr_wrapped_ty, align 8
  %header = alloca %struct.uint8ptr_wrapped_ty, align 8
  %data = alloca %struct.uint8ptr_wrapped_ty, align 8
  %data_plus_mac_size = alloca i64, align 8
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %_zzq_args43 = alloca [6 x i64], align 16
  %_zzq_result44 = alloca i64, align 8
  %_zzq_args56 = alloca [6 x i64], align 16
  %_zzq_result57 = alloca i64, align 8
  %_zzq_args69 = alloca [6 x i64], align 16
  %_zzq_result70 = alloca i64, align 8
  %_zzq_args82 = alloca [6 x i64], align 16
  %_zzq_result83 = alloca i64, align 8
  store i1 true, i1* %out., align 1
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 1
  store i64 96, i64* %len, align 8
  %len1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 1
  store i64 20, i64* %len1, align 8
  %add = add i64 20, 40
  %add2 = add i64 %add, 8
  %add3 = add i64 %add2, 1
  %add4 = add i64 %add3, 2
  %len5 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  store i64 %add4, i64* %len5, align 8
  %len6 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  store i64 128, i64* %len6, align 8
  %len7 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 1
  %0 = load i64, i64* %len7, align 8
  %mul = mul i64 %0, 1
  %call = call noalias i8* @malloc(i64 noundef %mul) #8
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 0
  %md_state.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 1
  store i64 %mul, i64* %md_state.field0.length.ptr, align 8
  store i8* %call, i8** %buf, align 8
  %len8 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 1
  %1 = load i64, i64* %len8, align 8
  %mul9 = mul i64 %1, 1
  %call10 = call noalias i8* @malloc(i64 noundef %mul9) #8
  %buf11 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 0
  %mac_out.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 1
  store i64 %mul9, i64* %mac_out.field0.length.ptr, align 8
  store i8* %call10, i8** %buf11, align 8
  %len12 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %2 = load i64, i64* %len12, align 8
  %mul13 = mul i64 %2, 1
  %call14 = call noalias i8* @malloc(i64 noundef %mul13) #8
  %buf15 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 0
  %header.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  store i64 %mul13, i64* %header.field0.length.ptr, align 8
  store i8* %call14, i8** %buf15, align 8
  %len16 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %3 = load i64, i64* %len16, align 8
  %mul17 = mul i64 %3, 1
  %call18 = call noalias i8* @malloc(i64 noundef %mul17) #8
  %buf19 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 0
  %data.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  store i64 %mul17, i64* %data.field0.length.ptr, align 8
  store i8* %call18, i8** %buf19, align 8
  %buf20 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 0
  %4 = load i8*, i8** %buf20, align 8
  %5 = bitcast i8* %4 to %struct.SHAstate_st*
  %call21 = call i32 @SHA1_Init(%struct.SHAstate_st* noundef %5)
  %buf22 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 0
  %6 = load i8*, i8** %buf22, align 8
  %len23 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %7 = load i64, i64* %len23, align 8
  %mul24 = mul i64 %7, 1
  %call25 = call i64 @read(i32 noundef 0, i8* noundef %6, i64 noundef %mul24)
  %buf26 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 0
  %8 = load i8*, i8** %buf26, align 8
  %len27 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %9 = load i64, i64* %len27, align 8
  %mul28 = mul i64 %9, 1
  %call29 = call i64 @read(i32 noundef 0, i8* noundef %8, i64 noundef %mul28)
  %data_plus_mac_size30 = bitcast i64* %data_plus_mac_size to i8*
  call void @llvm.var.annotation(i8* %data_plus_mac_size30, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.7, i32 0, i32 0), i32 52, i8* null)
  %len31 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %10 = load i64, i64* %len31, align 8
  %buf32 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 0
  %11 = load i8*, i8** %buf32, align 8
  %arrayidx = getelementptr inbounds i8, i8* %11, i64 127
  %12 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %12 to i64
  %sub = sub i64 %10, %conv
  store i64 %sub, i64* %data_plus_mac_size, align 8
  %arrayidx33 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx33, align 16
  %buf34 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 0
  %13 = load i8*, i8** %buf34, align 8
  %14 = ptrtoint i8* %13 to i64
  %arrayidx35 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %14, i64* %arrayidx35, align 8
  %len36 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 1
  %15 = load i64, i64* %len36, align 8
  %mul37 = mul i64 1, %15
  %arrayidx38 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 %mul37, i64* %arrayidx38, align 16
  %arrayidx39 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx39, align 8
  %arrayidx40 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx40, align 16
  %arrayidx41 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx41, align 8
  %arrayidx42 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %16 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx42, i64 0) #8, !srcloc !11
  store volatile i64 %16, i64* %_zzq_result, align 8
  %17 = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx45 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx45, align 16
  %buf46 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 0
  %18 = load i8*, i8** %buf46, align 8
  %19 = ptrtoint i8* %18 to i64
  %arrayidx47 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 1
  store volatile i64 %19, i64* %arrayidx47, align 8
  %len48 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 1
  %20 = load i64, i64* %len48, align 8
  %mul49 = mul i64 1, %20
  %arrayidx50 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 2
  store volatile i64 %mul49, i64* %arrayidx50, align 16
  %arrayidx51 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx51, align 8
  %arrayidx52 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx52, align 16
  %arrayidx53 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx53, align 8
  %arrayidx54 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 0
  %21 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx54, i64 0) #8, !srcloc !12
  store volatile i64 %21, i64* %_zzq_result44, align 8
  %22 = load volatile i64, i64* %_zzq_result44, align 8
  %arrayidx58 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx58, align 16
  %buf59 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 0
  %23 = load i8*, i8** %buf59, align 8
  %24 = ptrtoint i8* %23 to i64
  %arrayidx60 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 1
  store volatile i64 %24, i64* %arrayidx60, align 8
  %len61 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %25 = load i64, i64* %len61, align 8
  %mul62 = mul i64 1, %25
  %arrayidx63 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 2
  store volatile i64 %mul62, i64* %arrayidx63, align 16
  %arrayidx64 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx64, align 8
  %arrayidx65 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx65, align 16
  %arrayidx66 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx66, align 8
  %arrayidx67 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 0
  %26 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx67, i64 0) #8, !srcloc !13
  store volatile i64 %26, i64* %_zzq_result57, align 8
  %27 = load volatile i64, i64* %_zzq_result57, align 8
  %arrayidx71 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx71, align 16
  %buf72 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 0
  %28 = load i8*, i8** %buf72, align 8
  %29 = ptrtoint i8* %28 to i64
  %arrayidx73 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 1
  store volatile i64 %29, i64* %arrayidx73, align 8
  %len74 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %30 = load i64, i64* %len74, align 8
  %mul75 = mul i64 1, %30
  %arrayidx76 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 2
  store volatile i64 %mul75, i64* %arrayidx76, align 16
  %arrayidx77 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx77, align 8
  %arrayidx78 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx78, align 16
  %arrayidx79 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx79, align 8
  %arrayidx80 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 0
  %31 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx80, i64 0) #8, !srcloc !14
  store volatile i64 %31, i64* %_zzq_result70, align 8
  %32 = load volatile i64, i64* %_zzq_result70, align 8
  %arrayidx84 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx84, align 16
  %33 = ptrtoint i64* %data_plus_mac_size to i64
  %arrayidx85 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 1
  store volatile i64 %33, i64* %arrayidx85, align 8
  %arrayidx86 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 2
  store volatile i64 1, i64* %arrayidx86, align 16
  %arrayidx87 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx87, align 8
  %arrayidx88 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx88, align 16
  %arrayidx89 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx89, align 8
  %arrayidx90 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 0
  %34 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx90, i64 0) #8, !srcloc !15
  store volatile i64 %34, i64* %_zzq_result83, align 8
  %35 = load volatile i64, i64* %_zzq_result83, align 8
  %36 = load i64, i64* %data_plus_mac_size, align 8
  %call92 = call i32 @__ssl3_cbc_digest_record(%struct.uint8ptr_wrapped_ty* noundef %md_state, %struct.uint8ptr_wrapped_ty* noundef %mac_out, %struct.uint8ptr_wrapped_ty* noundef %header, %struct.uint8ptr_wrapped_ty* noundef %data, i64 noundef %36)
  %buf93 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 0
  %37 = load i8*, i8** %buf93, align 8
  %len94 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 1
  %38 = load i64, i64* %len94, align 8
  %mul95 = mul i64 %38, 1
  %call96 = call i64 @write(i32 noundef 1, i8* noundef %37, i64 noundef %mul95)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #6

declare i32 @SHA1_Init(%struct.SHAstate_st* noundef) #4

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #4

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #4

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 14.0.6"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = !{i64 2148384488, i64 2148384524, i64 2148384592}
!12 = !{i64 2148386159, i64 2148386195, i64 2148386263}
!13 = !{i64 2148387824, i64 2148387860, i64 2148387928}
!14 = !{i64 2148389477, i64 2148389513, i64 2148389581}
!15 = !{i64 2148391142, i64 2148391178, i64 2148391246}
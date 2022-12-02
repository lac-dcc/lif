; ModuleID = 'llvm-ir/lif.ctgrind.ll'
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
define dso_local i32 @__ssl3_cbc_digest_record(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %md_state, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %mac_out, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %header, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %data, i64 noundef %data_plus_mac_size) #0 {
entry:
  %header.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i64 0, i32 1
  %data.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i64 0, i32 1
  %pred.alloca = alloca i1, align 1
  store i1 false, i1* %pred.alloca, align 1
  %md_state_buf = alloca i8*, align 8
  %mac_out_buf = alloca i8*, align 8
  %header_buf = alloca i8*, align 8
  %data_buf = alloca i8*, align 8
  %first_block = alloca [128 x i8], align 16
  %length_bytes = alloca [16 x i8], align 16
  %block = alloca [128 x i8], align 16
  %md_state_buf1 = bitcast i8** %md_state_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %md_state_buf1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 37, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i64 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %md_state_buf, align 8
  %mac_out_buf2 = bitcast i8** %mac_out_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %mac_out_buf2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 38, i8* null)
  %buf3 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i64 0, i32 0
  %1 = load i8*, i8** %buf3, align 8
  store i8* %1, i8** %mac_out_buf, align 8
  %header_buf4 = bitcast i8** %header_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %header_buf4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 39, i8* null)
  %buf5 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i64 0, i32 0
  %2 = load i8*, i8** %buf5, align 8
  store i8* %2, i8** %header_buf, align 8
  %data_buf6 = bitcast i8** %data_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %data_buf6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 40, i8* null)
  %buf7 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i64 0, i32 0
  %3 = load i8*, i8** %buf7, align 8
  store i8* %3, i8** %data_buf, align 8
  %4 = load i64, i64* %data.field0.length.ptr, align 8
  %5 = load i64, i64* %header.field0.length.ptr, align 8
  %add = add i64 %4, 51
  %sub13 = add i64 %add, %5
  %add15 = add i64 %5, %data_plus_mac_size
  %sub16 = add i64 %add15, -20
  %rem = and i64 %sub16, 63
  %div17 = lshr i64 %sub16, 6
  %add18 = add i64 %add15, -12
  %div19 = lshr i64 %add18, 6
  %cmp = icmp ugt i64 %sub13, 255
  %shadow.sroa.0 = alloca i8, align 8
  store i8 0, i8* %shadow.sroa.0, align 8
  %div = lshr i64 %sub13, 6
  %sub21 = add nsw i64 %div, -2
  %mul = shl i64 %sub21, 6
  %num_starting_blocks.0.rewritten = select i1 %cmp, i64 %sub21, i64 0
  %k.0.rewritten = select i1 %cmp, i64 %mul, i64 0
  %cmp23.not = icmp ult i64 %4, %k.0.rewritten
  %6 = bitcast i8* %0 to %struct.SHAstate_st*
  br i1 %cmp23.not, label %if.else, label %if.then24

if.then24:                                        ; preds = %entry
  %cmp28 = icmp ult i64 %5, 129
  br i1 %cmp28, label %if.then29, label %if.else30

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 noundef 75, i8* noundef getelementptr inbounds ([135 x i8], [135 x i8]* @__PRETTY_FUNCTION__.__ssl3_cbc_digest_record, i64 0, i64 0)) #9
  unreachable

if.then29:                                        ; preds = %if.then24
  %7 = getelementptr inbounds [128 x i8], [128 x i8]* %first_block, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(128) %7, i8 0, i64 128, i1 false)
  %mul32 = shl i64 %sub16, 3
  %8 = getelementptr inbounds [16 x i8], [16 x i8]* %length_bytes, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %8, i8 0, i64 16, i1 false)
  %shr = lshr i64 %mul32, 24
  %conv = trunc i64 %shr to i8
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %length_bytes, i64 0, i64 4
  store i8 %conv, i8* %arrayidx, align 4
  %shr34 = lshr i64 %mul32, 16
  %conv35 = trunc i64 %shr34 to i8
  %arrayidx37 = getelementptr inbounds [16 x i8], [16 x i8]* %length_bytes, i64 0, i64 5
  store i8 %conv35, i8* %arrayidx37, align 1
  %shr38 = lshr i64 %mul32, 8
  %conv39 = trunc i64 %shr38 to i8
  %arrayidx41 = getelementptr inbounds [16 x i8], [16 x i8]* %length_bytes, i64 0, i64 6
  store i8 %conv39, i8* %arrayidx41, align 2
  %conv42 = trunc i64 %mul32 to i8
  %arrayidx44 = getelementptr inbounds [16 x i8], [16 x i8]* %length_bytes, i64 0, i64 7
  store i8 %conv42, i8* %arrayidx44, align 1
  %cmp45.not = icmp eq i64 %k.0.rewritten, 0
  br i1 %cmp45.not, label %if.end66, label %if.then47

if.else30:                                        ; preds = %if.then24
  call void @__assert_fail(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 noundef 76, i8* noundef getelementptr inbounds ([135 x i8], [135 x i8]* @__PRETTY_FUNCTION__.__ssl3_cbc_digest_record, i64 0, i64 0)) #9
  unreachable

if.then47:                                        ; preds = %if.then29
  %cmp49 = icmp ult i64 %5, 65
  br i1 %cmp49, label %return, label %if.end52

if.end52:                                         ; preds = %if.then47
  %sub54 = add nsw i64 %5, -64
  %9 = bitcast i8** %md_state_buf to %struct.SHAstate_st**
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %6, i8* noundef %2) #10
  %10 = load i8*, i8** %header_buf, align 8
  %arrayidx55 = getelementptr inbounds i8, i8* %10, i64 64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %7, i8* nonnull align 1 %arrayidx55, i64 %sub54, i1 false)
  %sub56 = sub nuw nsw i64 128, %5
  %arrayidx57 = getelementptr inbounds [128 x i8], [128 x i8]* %first_block, i64 0, i64 %sub54
  %11 = load i8*, i8** %data_buf, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %arrayidx57, i8* align 1 %11, i64 %sub56, i1 false)
  %12 = load %struct.SHAstate_st*, %struct.SHAstate_st** %9, align 8
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %12, i8* noundef nonnull %7) #10
  %div59 = lshr exact i64 %k.0.rewritten, 6
  %sub60 = add nsw i64 %div59, -1
  %cmp6135 = icmp ugt i64 %sub60, 1
  br i1 %cmp6135, label %for.body, label %if.end66

for.body:                                         ; preds = %if.end52, %for.body
  %i.0.rewritten36 = phi i64 [ %inc, %for.body ], [ 1, %if.end52 ]
  %mul63 = shl i64 %i.0.rewritten36, 6
  %sub64 = sub i64 %mul63, %sub54
  %13 = load %struct.SHAstate_st*, %struct.SHAstate_st** %9, align 8
  %14 = load i8*, i8** %data_buf, align 8
  %arrayidx65 = getelementptr inbounds i8, i8* %14, i64 %sub64
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %13, i8* noundef %arrayidx65) #10
  %inc = add nuw i64 %i.0.rewritten36, 1
  %exitcond.not = icmp eq i64 %inc, %sub60
  br i1 %exitcond.not, label %if.end66, label %for.body, !llvm.loop !6

if.end66:                                         ; preds = %for.body, %if.end52, %if.then29
  %add69 = add nsw i64 %num_starting_blocks.0.rewritten, 3
  %cmp7254 = icmp ult i64 %num_starting_blocks.0.rewritten, -3
  br i1 %cmp7254, label %for.body74.lr.ph, label %return

for.body74.lr.ph:                                 ; preds = %if.end66
  %15 = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 0
  %16 = bitcast i8** %md_state_buf to %struct.SHAstate_st**
  %shadow.sroa.0.0.sroa_cast66 = bitcast i8* %shadow.sroa.0 to i1*
  br label %for.body74

for.body74:                                       ; preds = %for.body74.lr.ph, %for.end167
  %cond.fold9163 = phi i1 [ true, %for.body74.lr.ph ], [ %cond.fold15451, %for.end167 ]
  %i70.0.rewritten62 = phi i64 [ %num_starting_blocks.0.rewritten, %for.body74.lr.ph ], [ %inc169, %for.end167 ]
  %k.1.rewritten61 = phi i64 [ %k.0.rewritten, %for.body74.lr.ph ], [ %inc101, %for.end167 ]
  %out.56.060 = phi i1 [ false, %for.body74.lr.ph ], [ %cond.fold15451, %for.end167 ]
  %out.49.059 = phi i1 [ false, %for.body74.lr.ph ], [ %cond.fold149, %for.end167 ]
  %out.47.058 = phi i1 [ false, %for.body74.lr.ph ], [ %out.47.2, %for.end167 ]
  %out.30.057 = phi i1 [ false, %for.body74.lr.ph ], [ %out.30.2, %for.end167 ]
  %out.29.056 = phi i1 [ false, %for.body74.lr.ph ], [ %out.29.3, %for.end167 ]
  %out.27.055 = phi i1 [ false, %for.body74.lr.ph ], [ %out.27.2, %for.end167 ]
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(128) %15, i8 0, i64 128, i1 false)
  %cmp75 = icmp eq i64 %i70.0.rewritten62, %div17
  %cmp77 = icmp eq i64 %i70.0.rewritten62, %div19
  %17 = load i64, i64* %header.field0.length.ptr, align 8
  %18 = xor i1 %cmp75, true
  %19 = xor i1 %cmp77, true
  %cond.fold9538 = or i1 %out.49.059, %cond.fold9163
  %20 = load i8*, i8** %data_buf, align 8
  %21 = load i8*, i8** %header_buf, align 8
  br label %for.body83

for.body83:                                       ; preds = %for.body74, %if.end142
  %cond.fold9548 = phi i1 [ %cond.fold9538, %for.body74 ], [ %cond.fold149, %if.end142 ]
  %j.0.rewritten46 = phi i64 [ 0, %for.body74 ], [ %inc145, %if.end142 ]
  %k.2.rewritten43 = phi i64 [ %k.1.rewritten61, %for.body74 ], [ %inc101, %if.end142 ]
  %out.47.142 = phi i1 [ %out.47.058, %for.body74 ], [ %out.47.2, %if.end142 ]
  %out.30.141 = phi i1 [ %out.30.057, %for.body74 ], [ %out.30.2, %if.end142 ]
  %out.29.140 = phi i1 [ %out.29.056, %for.body74 ], [ %out.29.3, %if.end142 ]
  %out.27.139 = phi i1 [ %out.27.055, %for.body74 ], [ %out.27.2, %if.end142 ]
  %cmp85 = icmp ult i64 %k.2.rewritten43, %17
  br i1 %cmp85, label %if.then87, label %if.else89

if.then87:                                        ; preds = %for.body83
  %arrayidx88 = getelementptr inbounds i8, i8* %21, i64 %k.2.rewritten43
  %22 = load i8, i8* %arrayidx88, align 1
  br label %if.end100

if.else89:                                        ; preds = %for.body83
  %23 = load i64, i64* %data.field0.length.ptr, align 8
  %add92 = add i64 %23, %17
  %cmp93 = icmp ult i64 %k.2.rewritten43, %add92
  br i1 %cmp93, label %if.then95, label %if.end99

if.then95:                                        ; preds = %if.else89
  %sub97 = sub i64 %k.2.rewritten43, %17
  %arrayidx98 = getelementptr inbounds i8, i8* %20, i64 %sub97
  %24 = load i8, i8* %arrayidx98, align 1
  br label %if.end99

if.end99:                                         ; preds = %if.then95, %if.else89
  %out.29.2 = phi i1 [ %cond.fold9548, %if.then95 ], [ %out.29.140, %if.else89 ]
  %b.0.rewritten = phi i8 [ %24, %if.then95 ], [ 0, %if.else89 ]
  %25 = xor i1 %cmp93, true
  %in.104 = and i1 %cond.fold9548, %25
  %cond.fold106 = or i1 %in.104, %out.29.2
  br label %if.end100

if.end100:                                        ; preds = %if.end99, %if.then87
  %out.27.2 = phi i1 [ %cond.fold9548, %if.then87 ], [ %out.27.139, %if.end99 ]
  %out.29.3 = phi i1 [ %out.29.140, %if.then87 ], [ %out.29.2, %if.end99 ]
  %out.30.2 = phi i1 [ %out.30.141, %if.then87 ], [ %cond.fold106, %if.end99 ]
  %b.1.rewritten = phi i8 [ %22, %if.then87 ], [ %b.0.rewritten, %if.end99 ]
  %cond.fold108 = or i1 %out.27.2, %out.30.2
  %inc101 = add i64 %k.2.rewritten43, 1
  %cmp103 = icmp ult i64 %j.0.rewritten46, %rem
  %in.111 = and i1 %cond.fold108, %18
  %cmp110 = icmp ule i64 %j.0.rewritten46, %rem
  %26 = select i1 %in.111, i1 true, i1 %cmp103
  %in.121 = and i1 %cond.fold108, %26
  %conv117 = select i1 %in.121, i8 %b.1.rewritten, i8 -128
  %27 = select i1 %in.111, i1 true, i1 %cmp110
  %in.127 = and i1 %cond.fold108, %27
  %in.130 = and i1 %cmp77, %cond.fold108
  %ctsel = select i1 %in.130, i1* %pred.alloca, i1* %shadow.sroa.0.0.sroa_cast66
  %28 = load i1, i1* %ctsel, align 1
  %select.val. = select i1 %in.130, i1 %cmp75, i1 %28
  store i1 %select.val., i1* %ctsel, align 1
  %in.132 = and i1 %in.130, %18
  %pred.alloca.0.pred.alloca.0.pred.alloca.0.pred.load = load i1, i1* %pred.alloca, align 1
  %in.134 = and i1 %in.130, %pred.alloca.0.pred.alloca.0.pred.alloca.0.pred.load
  %in.135 = and i1 %cond.fold108, %19
  %29 = select i1 %in.135, i1 true, i1 %in.134
  %30 = select i1 %29, i1 %in.127, i1 false
  %phi.fold182 = select i1 %30, i8 %conv117, i8 0
  %cond.fold137 = or i1 %in.135, %in.132
  %cond.fold138 = or i1 %cond.fold137, %in.134
  %cmp127 = icmp ugt i64 %j.0.rewritten46, 55
  br i1 %cmp127, label %if.then129, label %if.end142

if.then129:                                       ; preds = %if.end100
  %in.141 = or i1 %in.132, %in.134
  %sub134 = add nsw i64 %j.0.rewritten46, -56
  %arrayidx135 = getelementptr inbounds [16 x i8], [16 x i8]* %length_bytes, i64 0, i64 %sub134
  %31 = load i8, i8* %arrayidx135, align 1
  %phi.fold183.v = select i1 %in.135, i8 %phi.fold182, i8 %31
  %cond.fold146 = or i1 %in.135, %in.141
  br label %if.end142

if.end142:                                        ; preds = %if.then129, %if.end100
  %out.47.2 = phi i1 [ %cond.fold146, %if.then129 ], [ %out.47.142, %if.end100 ]
  %b.4.rewritten = phi i8 [ %phi.fold183.v, %if.then129 ], [ %phi.fold182, %if.end100 ]
  %32 = xor i1 %cmp127, true
  %in.147 = and i1 %cond.fold138, %32
  %cond.fold149 = or i1 %in.147, %out.47.2
  %arrayidx143 = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 %j.0.rewritten46
  store i8 %b.4.rewritten, i8* %arrayidx143, align 1
  %inc145 = add nuw nsw i64 %j.0.rewritten46, 1
  %exitcond64.not = icmp eq i64 %inc145, 64
  br i1 %exitcond64.not, label %for.end146, label %for.body83, !llvm.loop !8

for.end146:                                       ; preds = %if.end142
  %33 = load %struct.SHAstate_st*, %struct.SHAstate_st** %16, align 8
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %33, i8* noundef nonnull %15) #10
  %34 = load %struct.SHAstate_st*, %struct.SHAstate_st** %16, align 8
  call fastcc void @md_final_raw(%struct.SHAstate_st* %34, i8* nonnull %15)
  %cond.fold15451 = or i1 %out.56.060, %cond.fold149
  %in.159 = and i1 %cond.fold15451, %19
  br label %for.body153

for.body153:                                      ; preds = %for.end146, %for.body153
  %j149.0.rewritten52 = phi i64 [ 0, %for.end146 ], [ %inc166, %for.body153 ]
  %arrayidx157 = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 %j149.0.rewritten52
  %35 = load i8, i8* %arrayidx157, align 1
  %phi.fold184 = select i1 %in.159, i8 0, i8 %35
  %36 = load i8*, i8** %mac_out_buf, align 8
  %arrayidx162 = getelementptr inbounds i8, i8* %36, i64 %j149.0.rewritten52
  %37 = load i8, i8* %arrayidx162, align 1
  %or = or i8 %37, %phi.fold184
  store i8 %or, i8* %arrayidx162, align 1
  %inc166 = add nuw nsw i64 %j149.0.rewritten52, 1
  %exitcond65.not = icmp eq i64 %inc166, 20
  br i1 %exitcond65.not, label %for.end167, label %for.body153, !llvm.loop !9

for.end167:                                       ; preds = %for.body153
  %inc169 = add nuw nsw i64 %i70.0.rewritten62, 1
  %cmp72 = icmp ult i64 %inc169, %add69
  br i1 %cmp72, label %for.body74, label %return, !llvm.loop !10

return:                                           ; preds = %for.end167, %if.end66, %if.then47
  %retval.0.rewritten = phi i32 [ 0, %if.then47 ], [ 1, %if.end66 ], [ 1, %for.end167 ]
  ret i32 %retval.0.rewritten
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @SHA1_Transform(%struct.SHAstate_st* noundef, i8* noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define internal fastcc void @md_final_raw(%struct.SHAstate_st* nocapture noundef readonly %ctx, i8* %md_out.0.0.val) unnamed_addr #6 {
entry:
  %h0 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i64 0, i32 0
  %0 = load i32, i32* %h0, align 4
  %shr = lshr i32 %0, 24
  %conv = trunc i32 %shr to i8
  %incdec.ptr = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 1
  store i8 %conv, i8* %md_out.0.0.val, align 1
  %1 = load i32, i32* %h0, align 4
  %shr2 = lshr i32 %1, 16
  %conv4 = trunc i32 %shr2 to i8
  %incdec.ptr5 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 2
  store i8 %conv4, i8* %incdec.ptr, align 1
  %2 = load i32, i32* %h0, align 4
  %shr7 = lshr i32 %2, 8
  %conv9 = trunc i32 %shr7 to i8
  %incdec.ptr10 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 3
  store i8 %conv9, i8* %incdec.ptr5, align 1
  %3 = load i32, i32* %h0, align 4
  %conv13 = trunc i32 %3 to i8
  %incdec.ptr14 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 4
  store i8 %conv13, i8* %incdec.ptr10, align 1
  %h1 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i64 0, i32 1
  %4 = load i32, i32* %h1, align 4
  %shr15 = lshr i32 %4, 24
  %conv17 = trunc i32 %shr15 to i8
  %incdec.ptr18 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 5
  store i8 %conv17, i8* %incdec.ptr14, align 1
  %5 = load i32, i32* %h1, align 4
  %shr20 = lshr i32 %5, 16
  %conv22 = trunc i32 %shr20 to i8
  %incdec.ptr23 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 6
  store i8 %conv22, i8* %incdec.ptr18, align 1
  %6 = load i32, i32* %h1, align 4
  %shr25 = lshr i32 %6, 8
  %conv27 = trunc i32 %shr25 to i8
  %incdec.ptr28 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 7
  store i8 %conv27, i8* %incdec.ptr23, align 1
  %7 = load i32, i32* %h1, align 4
  %conv31 = trunc i32 %7 to i8
  %incdec.ptr32 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 8
  store i8 %conv31, i8* %incdec.ptr28, align 1
  %h2 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i64 0, i32 2
  %8 = load i32, i32* %h2, align 4
  %shr33 = lshr i32 %8, 24
  %conv35 = trunc i32 %shr33 to i8
  %incdec.ptr36 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 9
  store i8 %conv35, i8* %incdec.ptr32, align 1
  %9 = load i32, i32* %h2, align 4
  %shr38 = lshr i32 %9, 16
  %conv40 = trunc i32 %shr38 to i8
  %incdec.ptr41 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 10
  store i8 %conv40, i8* %incdec.ptr36, align 1
  %10 = load i32, i32* %h2, align 4
  %shr43 = lshr i32 %10, 8
  %conv45 = trunc i32 %shr43 to i8
  %incdec.ptr46 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 11
  store i8 %conv45, i8* %incdec.ptr41, align 1
  %11 = load i32, i32* %h2, align 4
  %conv49 = trunc i32 %11 to i8
  %incdec.ptr50 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 12
  store i8 %conv49, i8* %incdec.ptr46, align 1
  %h3 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i64 0, i32 3
  %12 = load i32, i32* %h3, align 4
  %shr51 = lshr i32 %12, 24
  %conv53 = trunc i32 %shr51 to i8
  %incdec.ptr54 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 13
  store i8 %conv53, i8* %incdec.ptr50, align 1
  %13 = load i32, i32* %h3, align 4
  %shr56 = lshr i32 %13, 16
  %conv58 = trunc i32 %shr56 to i8
  %incdec.ptr59 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 14
  store i8 %conv58, i8* %incdec.ptr54, align 1
  %14 = load i32, i32* %h3, align 4
  %shr61 = lshr i32 %14, 8
  %conv63 = trunc i32 %shr61 to i8
  %incdec.ptr64 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 15
  store i8 %conv63, i8* %incdec.ptr59, align 1
  %15 = load i32, i32* %h3, align 4
  %conv67 = trunc i32 %15 to i8
  %incdec.ptr68 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 16
  store i8 %conv67, i8* %incdec.ptr64, align 1
  %h4 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i64 0, i32 4
  %16 = load i32, i32* %h4, align 4
  %shr69 = lshr i32 %16, 24
  %conv71 = trunc i32 %shr69 to i8
  %incdec.ptr72 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 17
  store i8 %conv71, i8* %incdec.ptr68, align 1
  %17 = load i32, i32* %h4, align 4
  %shr74 = lshr i32 %17, 16
  %conv76 = trunc i32 %shr74 to i8
  %incdec.ptr77 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 18
  store i8 %conv76, i8* %incdec.ptr72, align 1
  %18 = load i32, i32* %h4, align 4
  %shr79 = lshr i32 %18, 8
  %conv81 = trunc i32 %shr79 to i8
  %incdec.ptr82 = getelementptr inbounds i8, i8* %md_out.0.0.val, i64 19
  store i8 %conv81, i8* %incdec.ptr77, align 1
  %19 = load i32, i32* %h4, align 4
  %conv85 = trunc i32 %19 to i8
  store i8 %conv85, i8* %incdec.ptr82, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
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
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i64 0, i32 1
  %len1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i64 0, i32 1
  %len5 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i64 0, i32 1
  %len6 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i64 0, i32 1
  %call = tail call noalias dereferenceable_or_null(96) i8* @malloc(i64 noundef 96) #10
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i64 0, i32 0
  store i64 96, i64* %len, align 8
  store i8* %call, i8** %buf, align 8
  %call10 = tail call noalias dereferenceable_or_null(20) i8* @malloc(i64 noundef 20) #10
  %buf11 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i64 0, i32 0
  store i64 20, i64* %len1, align 8
  store i8* %call10, i8** %buf11, align 8
  %call14 = tail call noalias dereferenceable_or_null(71) i8* @malloc(i64 noundef 71) #10
  %buf15 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i64 0, i32 0
  store i64 71, i64* %len5, align 8
  store i8* %call14, i8** %buf15, align 8
  %call18 = tail call noalias dereferenceable_or_null(128) i8* @malloc(i64 noundef 128) #10
  %buf19 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i64 0, i32 0
  store i64 128, i64* %len6, align 8
  store i8* %call18, i8** %buf19, align 8
  %0 = bitcast i8* %call to %struct.SHAstate_st*
  %call21 = tail call i32 @SHA1_Init(%struct.SHAstate_st* noundef %0) #10
  %call25 = tail call i64 @read(i32 noundef 0, i8* noundef %call14, i64 noundef 71) #10
  %call29 = tail call i64 @read(i32 noundef 0, i8* noundef %call18, i64 noundef 128) #10
  %data_plus_mac_size30 = bitcast i64* %data_plus_mac_size to i8*
  call void @llvm.var.annotation(i8* nonnull %data_plus_mac_size30, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.7, i64 0, i64 0), i32 52, i8* null)
  %arrayidx = getelementptr inbounds i8, i8* %call18, i64 127
  %1 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %1 to i64
  %sub = sub nsw i64 128, %conv
  store i64 %sub, i64* %data_plus_mac_size, align 8
  %arrayidx33 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx33, align 16
  %2 = ptrtoint i8* %call to i64
  %arrayidx35 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %2, i64* %arrayidx35, align 8
  %arrayidx38 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 96, i64* %arrayidx38, align 16
  %arrayidx39 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx39, align 8
  %arrayidx40 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx40, align 16
  %arrayidx41 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx41, align 8
  %3 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx33, i64 0) #10, !srcloc !11
  store volatile i64 %3, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx45 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx45, align 16
  %4 = ptrtoint i8* %call10 to i64
  %arrayidx47 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 1
  store volatile i64 %4, i64* %arrayidx47, align 8
  %arrayidx50 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 2
  store volatile i64 20, i64* %arrayidx50, align 16
  %arrayidx51 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx51, align 8
  %arrayidx52 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx52, align 16
  %arrayidx53 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx53, align 8
  %5 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx45, i64 0) #10, !srcloc !12
  store volatile i64 %5, i64* %_zzq_result44, align 8
  %_zzq_result44.0._zzq_result44.0._zzq_result44.0. = load volatile i64, i64* %_zzq_result44, align 8
  %arrayidx58 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx58, align 16
  %6 = ptrtoint i8* %call14 to i64
  %arrayidx60 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 1
  store volatile i64 %6, i64* %arrayidx60, align 8
  %arrayidx63 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 2
  store volatile i64 71, i64* %arrayidx63, align 16
  %arrayidx64 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx64, align 8
  %arrayidx65 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx65, align 16
  %arrayidx66 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx66, align 8
  %7 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx58, i64 0) #10, !srcloc !13
  store volatile i64 %7, i64* %_zzq_result57, align 8
  %_zzq_result57.0._zzq_result57.0._zzq_result57.0. = load volatile i64, i64* %_zzq_result57, align 8
  %arrayidx71 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx71, align 16
  %8 = ptrtoint i8* %call18 to i64
  %arrayidx73 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 1
  store volatile i64 %8, i64* %arrayidx73, align 8
  %arrayidx76 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 2
  store volatile i64 128, i64* %arrayidx76, align 16
  %arrayidx77 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx77, align 8
  %arrayidx78 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx78, align 16
  %arrayidx79 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx79, align 8
  %9 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx71, i64 0) #10, !srcloc !14
  store volatile i64 %9, i64* %_zzq_result70, align 8
  %_zzq_result70.0._zzq_result70.0._zzq_result70.0. = load volatile i64, i64* %_zzq_result70, align 8
  %arrayidx84 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx84, align 16
  %10 = ptrtoint i64* %data_plus_mac_size to i64
  %arrayidx85 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 1
  store volatile i64 %10, i64* %arrayidx85, align 8
  %arrayidx86 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 2
  store volatile i64 1, i64* %arrayidx86, align 16
  %arrayidx87 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx87, align 8
  %arrayidx88 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx88, align 16
  %arrayidx89 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx89, align 8
  %11 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx84, i64 0) #10, !srcloc !15
  store volatile i64 %11, i64* %_zzq_result83, align 8
  %_zzq_result83.0._zzq_result83.0._zzq_result83.0. = load volatile i64, i64* %_zzq_result83, align 8
  %12 = load i64, i64* %data_plus_mac_size, align 8
  %call92 = call i32 @__ssl3_cbc_digest_record(%struct.uint8ptr_wrapped_ty* noundef nonnull %md_state, %struct.uint8ptr_wrapped_ty* noundef nonnull %mac_out, %struct.uint8ptr_wrapped_ty* noundef nonnull %header, %struct.uint8ptr_wrapped_ty* noundef nonnull %data, i64 noundef %12)
  %call96 = call i64 @write(i32 noundef 1, i8* noundef %call10, i64 noundef 20) #10
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #7

declare i32 @SHA1_Init(%struct.SHAstate_st* noundef) local_unnamed_addr #4

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #8

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #6 = { mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind }

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

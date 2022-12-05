; ModuleID = 'llvm-ir/base.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.uint8ptr_wrapped_ty = type { i8*, i64 }
%struct.SHAstate_st = type { i32, i32, i32, i32, i32, i32, i32, [16 x i32], i32 }

@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, i64)* @__ssl3_cbc_digest_record to i8*), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 38, i8* null }], section "llvm.metadata"
@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"lib/ssl3.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [15 x i8] c"data->len >= k\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"lib/ssl3.c\00", align 1
@__PRETTY_FUNCTION__.__ssl3_cbc_digest_record = private unnamed_addr constant [135 x i8] c"int32_t __ssl3_cbc_digest_record(uint8ptr_wrapped_ty *, uint8ptr_wrapped_ty *, uint8ptr_wrapped_ty *, uint8ptr_wrapped_ty *, uint64_t)\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"header->len <= 2 * md_block_size\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"nowrap:0,1,2,3\00", section "llvm.metadata"
@.str.7 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.8 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @__ssl3_cbc_digest_record(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %md_state, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %mac_out, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %header, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %data, i64 noundef %data_plus_mac_size) #0 {
entry:
  %md_state_buf = alloca i8*, align 8
  %mac_out_buf = alloca i8*, align 8
  %header_buf = alloca i8*, align 8
  %data_buf = alloca i8*, align 8
  %first_block = alloca [128 x i8], align 16
  %length_bytes = alloca [16 x i8], align 16
  %block = alloca [128 x i8], align 16
  %foo = alloca i32, align 4
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %md_state_buf1 = bitcast i8** %md_state_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %md_state_buf1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 43, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i64 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %md_state_buf, align 8
  %mac_out_buf2 = bitcast i8** %mac_out_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %mac_out_buf2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 44, i8* null)
  %buf3 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i64 0, i32 0
  %1 = load i8*, i8** %buf3, align 8
  store i8* %1, i8** %mac_out_buf, align 8
  %header_buf4 = bitcast i8** %header_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %header_buf4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 45, i8* null)
  %buf5 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i64 0, i32 0
  %2 = load i8*, i8** %buf5, align 8
  store i8* %2, i8** %header_buf, align 8
  %data_buf6 = bitcast i8** %data_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %data_buf6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 46, i8* null)
  %buf7 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i64 0, i32 0
  %3 = load i8*, i8** %buf7, align 8
  store i8* %3, i8** %data_buf, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i64 0, i32 1
  %4 = load i64, i64* %len, align 8
  %len8 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i64 0, i32 1
  %5 = load i64, i64* %len8, align 8
  %add = add i64 %4, 51
  %sub13 = add i64 %add, %5
  %div = lshr i64 %sub13, 6
  %add15 = add i64 %5, %data_plus_mac_size
  %sub16 = add i64 %add15, -20
  %rem = and i64 %sub16, 63
  %div17 = lshr i64 %sub16, 6
  %add18 = add i64 %add15, -12
  %div19 = lshr i64 %add18, 6
  %cmp = icmp ugt i64 %sub13, 255
  %sub21 = add nsw i64 %div, -2
  %mul = shl i64 %sub21, 6
  %num_starting_blocks.0 = select i1 %cmp, i64 %sub21, i64 0
  %k.0 = select i1 %cmp, i64 %mul, i64 0
  %cmp23.not = icmp ult i64 %4, %k.0
  %6 = bitcast i8* %0 to %struct.SHAstate_st*
  br i1 %cmp23.not, label %if.else, label %if.end25

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 noundef 81, i8* noundef getelementptr inbounds ([135 x i8], [135 x i8]* @__PRETTY_FUNCTION__.__ssl3_cbc_digest_record, i64 0, i64 0)) #10
  unreachable

if.end25:                                         ; preds = %entry
  %cmp28 = icmp ult i64 %5, 129
  br i1 %cmp28, label %if.end31, label %if.else30

if.else30:                                        ; preds = %if.end25
  call void @__assert_fail(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 noundef 82, i8* noundef getelementptr inbounds ([135 x i8], [135 x i8]* @__PRETTY_FUNCTION__.__ssl3_cbc_digest_record, i64 0, i64 0)) #10
  unreachable

if.end31:                                         ; preds = %if.end25
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
  %cmp45.not = icmp eq i64 %k.0, 0
  br i1 %cmp45.not, label %if.end66, label %if.then47

if.then47:                                        ; preds = %if.end31
  %cmp49 = icmp ult i64 %5, 65
  br i1 %cmp49, label %return, label %if.end52

if.end52:                                         ; preds = %if.then47
  %sub54 = add nsw i64 %5, -64
  %9 = bitcast i8** %md_state_buf to %struct.SHAstate_st**
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %6, i8* noundef %2) #11
  %10 = load i8*, i8** %header_buf, align 8
  %arrayidx55 = getelementptr inbounds i8, i8* %10, i64 64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %7, i8* nonnull align 1 %arrayidx55, i64 %sub54, i1 false)
  %sub56 = sub nuw nsw i64 128, %5
  %arrayidx57 = getelementptr inbounds [128 x i8], [128 x i8]* %first_block, i64 0, i64 %sub54
  %11 = load i8*, i8** %data_buf, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %arrayidx57, i8* align 1 %11, i64 %sub56, i1 false)
  %12 = load %struct.SHAstate_st*, %struct.SHAstate_st** %9, align 8
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %12, i8* noundef nonnull %7) #11
  %div59 = lshr exact i64 %k.0, 6
  %sub60 = add nsw i64 %div59, -1
  %cmp613 = icmp ugt i64 %sub60, 1
  br i1 %cmp613, label %for.body, label %if.end66

for.body:                                         ; preds = %if.end52, %for.body
  %i.04 = phi i64 [ %inc, %for.body ], [ 1, %if.end52 ]
  %mul63 = shl i64 %i.04, 6
  %sub64 = sub i64 %mul63, %sub54
  %13 = load %struct.SHAstate_st*, %struct.SHAstate_st** %9, align 8
  %14 = load i8*, i8** %data_buf, align 8
  %arrayidx65 = getelementptr inbounds i8, i8* %14, i64 %sub64
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %13, i8* noundef %arrayidx65) #11
  %inc = add nuw i64 %i.04, 1
  %exitcond.not = icmp eq i64 %inc, %sub60
  br i1 %exitcond.not, label %if.end66, label %for.body, !llvm.loop !6

if.end66:                                         ; preds = %for.body, %if.end52, %if.end31
  %add69 = add nsw i64 %num_starting_blocks.0, 3
  %cmp7211 = icmp ult i64 %num_starting_blocks.0, -3
  br i1 %cmp7211, label %for.body74.lr.ph, label %return

for.body74.lr.ph:                                 ; preds = %if.end66
  %15 = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 0
  %16 = bitcast i8** %md_state_buf to %struct.SHAstate_st**
  %arrayidx162 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %17 = ptrtoint i32* %foo to i64
  %arrayidx163 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  %arrayidx164 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  %arrayidx165 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  %arrayidx166 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  %arrayidx167 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  br label %for.body74

for.body74:                                       ; preds = %for.body74.lr.ph, %for.inc172
  %i70.013 = phi i64 [ %num_starting_blocks.0, %for.body74.lr.ph ], [ %inc173, %for.inc172 ]
  %k.112 = phi i64 [ %k.0, %for.body74.lr.ph ], [ %inc101, %for.inc172 ]
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(128) %15, i8 0, i64 128, i1 false)
  %cmp75 = icmp eq i64 %i70.013, %div17
  %cmp77 = icmp eq i64 %i70.013, %div19
  %18 = load i64, i64* %len8, align 8
  %cmp77.not = xor i1 %cmp77, true
  %19 = load i8*, i8** %data_buf, align 8
  %20 = load i8*, i8** %header_buf, align 8
  br label %for.body83

for.body83:                                       ; preds = %for.body74, %if.end142
  %j.07 = phi i64 [ 0, %for.body74 ], [ %inc145, %if.end142 ]
  %k.25 = phi i64 [ %k.112, %for.body74 ], [ %inc101, %if.end142 ]
  %cmp85 = icmp ult i64 %k.25, %18
  br i1 %cmp85, label %if.then87, label %if.else89

if.then87:                                        ; preds = %for.body83
  %arrayidx88 = getelementptr inbounds i8, i8* %20, i64 %k.25
  br label %if.end100.sink.split

if.else89:                                        ; preds = %for.body83
  %21 = load i64, i64* %len, align 8
  %add92 = add i64 %21, %18
  %cmp93 = icmp ult i64 %k.25, %add92
  br i1 %cmp93, label %if.then95, label %if.end100

if.then95:                                        ; preds = %if.else89
  %sub97 = sub i64 %k.25, %18
  %arrayidx98 = getelementptr inbounds i8, i8* %19, i64 %sub97
  br label %if.end100.sink.split

if.end100.sink.split:                             ; preds = %if.then87, %if.then95
  %arrayidx98.sink = phi i8* [ %arrayidx98, %if.then95 ], [ %arrayidx88, %if.then87 ]
  %22 = load i8, i8* %arrayidx98.sink, align 1
  br label %if.end100

if.end100:                                        ; preds = %if.end100.sink.split, %if.else89
  %b.1 = phi i8 [ 0, %if.else89 ], [ %22, %if.end100.sink.split ]
  %inc101 = add i64 %k.25, 1
  %cmp103 = icmp uge i64 %j.07, %rem
  %spec.select = select i1 %cmp75, i1 %cmp103, i1 false
  %cmp110 = icmp ugt i64 %j.07, %rem
  %23 = select i1 %cmp75, i1 %cmp110, i1 false
  %conv117 = select i1 %spec.select, i8 -128, i8 %b.1
  %b.2 = select i1 %23, i8 0, i8 %conv117
  %spec.select1 = select i1 %cmp75, i8 %b.2, i8 0
  %b.3 = select i1 %cmp77, i8 %spec.select1, i8 %b.2
  %cmp127 = icmp ult i64 %j.07, 56
  %brmerge = select i1 %cmp127, i1 true, i1 %cmp77.not
  br i1 %brmerge, label %if.end142, label %cond.true132

cond.true132:                                     ; preds = %if.end100
  %sub134 = add nsw i64 %j.07, -56
  %arrayidx135 = getelementptr inbounds [16 x i8], [16 x i8]* %length_bytes, i64 0, i64 %sub134
  %24 = load i8, i8* %arrayidx135, align 1
  br label %if.end142

if.end142:                                        ; preds = %if.end100, %cond.true132
  %b.4 = phi i8 [ %b.3, %if.end100 ], [ %24, %cond.true132 ]
  %arrayidx143 = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 %j.07
  store i8 %b.4, i8* %arrayidx143, align 1
  %inc145 = add nuw nsw i64 %j.07, 1
  %exitcond15.not = icmp eq i64 %inc145, 64
  br i1 %exitcond15.not, label %for.end146, label %for.body83, !llvm.loop !8

for.end146:                                       ; preds = %if.end142
  %25 = load %struct.SHAstate_st*, %struct.SHAstate_st** %16, align 8
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %25, i8* noundef nonnull %15) #11
  %26 = load %struct.SHAstate_st*, %struct.SHAstate_st** %16, align 8
  call fastcc void @md_final_raw(%struct.SHAstate_st* noundef %26, i8* noundef nonnull %15)
  store i32 0, i32* %foo, align 4
  br i1 %cmp77, label %for.body153.us, label %for.body153

for.body153.us:                                   ; preds = %for.end146, %for.body153.us
  %j149.09.us = phi i64 [ %inc170.us, %for.body153.us ], [ 0, %for.end146 ]
  %arrayidx156.us = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 %j149.09.us
  %27 = load i8, i8* %arrayidx156.us, align 1
  %28 = load i8*, i8** %mac_out_buf, align 8
  %arrayidx157.us = getelementptr inbounds i8, i8* %28, i64 %j149.09.us
  store i8 %27, i8* %arrayidx157.us, align 1
  store volatile i64 1296236546, i64* %arrayidx162, align 16
  store volatile i64 %17, i64* %arrayidx163, align 8
  store volatile i64 4, i64* %arrayidx164, align 16
  store volatile i64 0, i64* %arrayidx165, align 8
  store volatile i64 0, i64* %arrayidx166, align 16
  store volatile i64 0, i64* %arrayidx167, align 8
  %29 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx162, i64 0) #11, !srcloc !9
  store volatile i64 %29, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0..us = load volatile i64, i64* %_zzq_result, align 8
  %30 = load i32, i32* %foo, align 4
  %call.us = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 noundef %30)
  %inc170.us = add nuw nsw i64 %j149.09.us, 1
  %exitcond17.not = icmp eq i64 %inc170.us, 20
  br i1 %exitcond17.not, label %for.inc172, label %for.body153.us, !llvm.loop !10

for.body153:                                      ; preds = %for.end146, %for.body153
  %j149.09 = phi i64 [ %inc170, %for.body153 ], [ 0, %for.end146 ]
  %31 = load i8*, i8** %mac_out_buf, align 8
  %arrayidx159 = getelementptr inbounds i8, i8* %31, i64 %j149.09
  store i8 0, i8* %arrayidx159, align 1
  %32 = load i32, i32* %foo, align 4
  %inc160 = add nsw i32 %32, 1
  store i32 %inc160, i32* %foo, align 4
  store volatile i64 1296236546, i64* %arrayidx162, align 16
  store volatile i64 %17, i64* %arrayidx163, align 8
  store volatile i64 4, i64* %arrayidx164, align 16
  store volatile i64 0, i64* %arrayidx165, align 8
  store volatile i64 0, i64* %arrayidx166, align 16
  store volatile i64 0, i64* %arrayidx167, align 8
  %33 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx162, i64 0) #11, !srcloc !9
  store volatile i64 %33, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  %34 = load i32, i32* %foo, align 4
  %call = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 noundef %34)
  %inc170 = add nuw nsw i64 %j149.09, 1
  %exitcond16.not = icmp eq i64 %inc170, 20
  br i1 %exitcond16.not, label %for.inc172, label %for.body153, !llvm.loop !10

for.inc172:                                       ; preds = %for.body153, %for.body153.us
  %inc173 = add nuw nsw i64 %i70.013, 1
  %cmp72 = icmp ult i64 %inc173, %add69
  br i1 %cmp72, label %for.body74, label %return, !llvm.loop !11

return:                                           ; preds = %for.inc172, %if.end66, %if.then47
  %retval.0 = phi i32 [ 0, %if.then47 ], [ 1, %if.end66 ], [ 1, %for.inc172 ]
  ret i32 %retval.0
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
define internal fastcc void @md_final_raw(%struct.SHAstate_st* nocapture noundef readonly %ctx, i8* nocapture noundef writeonly %md_out) unnamed_addr #6 {
entry:
  %h0 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i64 0, i32 0
  %0 = load i32, i32* %h0, align 4
  %shr = lshr i32 %0, 24
  %conv = trunc i32 %shr to i8
  %incdec.ptr = getelementptr inbounds i8, i8* %md_out, i64 1
  store i8 %conv, i8* %md_out, align 1
  %1 = load i32, i32* %h0, align 4
  %shr2 = lshr i32 %1, 16
  %conv4 = trunc i32 %shr2 to i8
  %incdec.ptr5 = getelementptr inbounds i8, i8* %md_out, i64 2
  store i8 %conv4, i8* %incdec.ptr, align 1
  %2 = load i32, i32* %h0, align 4
  %shr7 = lshr i32 %2, 8
  %conv9 = trunc i32 %shr7 to i8
  %incdec.ptr10 = getelementptr inbounds i8, i8* %md_out, i64 3
  store i8 %conv9, i8* %incdec.ptr5, align 1
  %3 = load i32, i32* %h0, align 4
  %conv13 = trunc i32 %3 to i8
  %incdec.ptr14 = getelementptr inbounds i8, i8* %md_out, i64 4
  store i8 %conv13, i8* %incdec.ptr10, align 1
  %h1 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i64 0, i32 1
  %4 = load i32, i32* %h1, align 4
  %shr15 = lshr i32 %4, 24
  %conv17 = trunc i32 %shr15 to i8
  %incdec.ptr18 = getelementptr inbounds i8, i8* %md_out, i64 5
  store i8 %conv17, i8* %incdec.ptr14, align 1
  %5 = load i32, i32* %h1, align 4
  %shr20 = lshr i32 %5, 16
  %conv22 = trunc i32 %shr20 to i8
  %incdec.ptr23 = getelementptr inbounds i8, i8* %md_out, i64 6
  store i8 %conv22, i8* %incdec.ptr18, align 1
  %6 = load i32, i32* %h1, align 4
  %shr25 = lshr i32 %6, 8
  %conv27 = trunc i32 %shr25 to i8
  %incdec.ptr28 = getelementptr inbounds i8, i8* %md_out, i64 7
  store i8 %conv27, i8* %incdec.ptr23, align 1
  %7 = load i32, i32* %h1, align 4
  %conv31 = trunc i32 %7 to i8
  %incdec.ptr32 = getelementptr inbounds i8, i8* %md_out, i64 8
  store i8 %conv31, i8* %incdec.ptr28, align 1
  %h2 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i64 0, i32 2
  %8 = load i32, i32* %h2, align 4
  %shr33 = lshr i32 %8, 24
  %conv35 = trunc i32 %shr33 to i8
  %incdec.ptr36 = getelementptr inbounds i8, i8* %md_out, i64 9
  store i8 %conv35, i8* %incdec.ptr32, align 1
  %9 = load i32, i32* %h2, align 4
  %shr38 = lshr i32 %9, 16
  %conv40 = trunc i32 %shr38 to i8
  %incdec.ptr41 = getelementptr inbounds i8, i8* %md_out, i64 10
  store i8 %conv40, i8* %incdec.ptr36, align 1
  %10 = load i32, i32* %h2, align 4
  %shr43 = lshr i32 %10, 8
  %conv45 = trunc i32 %shr43 to i8
  %incdec.ptr46 = getelementptr inbounds i8, i8* %md_out, i64 11
  store i8 %conv45, i8* %incdec.ptr41, align 1
  %11 = load i32, i32* %h2, align 4
  %conv49 = trunc i32 %11 to i8
  %incdec.ptr50 = getelementptr inbounds i8, i8* %md_out, i64 12
  store i8 %conv49, i8* %incdec.ptr46, align 1
  %h3 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i64 0, i32 3
  %12 = load i32, i32* %h3, align 4
  %shr51 = lshr i32 %12, 24
  %conv53 = trunc i32 %shr51 to i8
  %incdec.ptr54 = getelementptr inbounds i8, i8* %md_out, i64 13
  store i8 %conv53, i8* %incdec.ptr50, align 1
  %13 = load i32, i32* %h3, align 4
  %shr56 = lshr i32 %13, 16
  %conv58 = trunc i32 %shr56 to i8
  %incdec.ptr59 = getelementptr inbounds i8, i8* %md_out, i64 14
  store i8 %conv58, i8* %incdec.ptr54, align 1
  %14 = load i32, i32* %h3, align 4
  %shr61 = lshr i32 %14, 8
  %conv63 = trunc i32 %shr61 to i8
  %incdec.ptr64 = getelementptr inbounds i8, i8* %md_out, i64 15
  store i8 %conv63, i8* %incdec.ptr59, align 1
  %15 = load i32, i32* %h3, align 4
  %conv67 = trunc i32 %15 to i8
  %incdec.ptr68 = getelementptr inbounds i8, i8* %md_out, i64 16
  store i8 %conv67, i8* %incdec.ptr64, align 1
  %h4 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i64 0, i32 4
  %16 = load i32, i32* %h4, align 4
  %shr69 = lshr i32 %16, 24
  %conv71 = trunc i32 %shr69 to i8
  %incdec.ptr72 = getelementptr inbounds i8, i8* %md_out, i64 17
  store i8 %conv71, i8* %incdec.ptr68, align 1
  %17 = load i32, i32* %h4, align 4
  %shr74 = lshr i32 %17, 16
  %conv76 = trunc i32 %shr74 to i8
  %incdec.ptr77 = getelementptr inbounds i8, i8* %md_out, i64 18
  store i8 %conv76, i8* %incdec.ptr72, align 1
  %18 = load i32, i32* %h4, align 4
  %shr79 = lshr i32 %18, 8
  %conv81 = trunc i32 %shr79 to i8
  %incdec.ptr82 = getelementptr inbounds i8, i8* %md_out, i64 19
  store i8 %conv81, i8* %incdec.ptr77, align 1
  %19 = load i32, i32* %h4, align 4
  %conv85 = trunc i32 %19 to i8
  store i8 %conv85, i8* %incdec.ptr82, align 1
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #7

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
  store i64 96, i64* %len, align 8
  %len1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i64 0, i32 1
  store i64 20, i64* %len1, align 8
  %len5 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i64 0, i32 1
  store i64 71, i64* %len5, align 8
  %len6 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i64 0, i32 1
  store i64 128, i64* %len6, align 8
  %call = tail call noalias dereferenceable_or_null(96) i8* @malloc(i64 noundef 96) #11
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i64 0, i32 0
  store i8* %call, i8** %buf, align 8
  %call10 = tail call noalias dereferenceable_or_null(20) i8* @malloc(i64 noundef 20) #11
  %buf11 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i64 0, i32 0
  store i8* %call10, i8** %buf11, align 8
  %call14 = tail call noalias dereferenceable_or_null(71) i8* @malloc(i64 noundef 71) #11
  %buf15 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i64 0, i32 0
  store i8* %call14, i8** %buf15, align 8
  %call18 = tail call noalias dereferenceable_or_null(128) i8* @malloc(i64 noundef 128) #11
  %buf19 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i64 0, i32 0
  store i8* %call18, i8** %buf19, align 8
  %0 = bitcast i8* %call to %struct.SHAstate_st*
  %call21 = tail call i32 @SHA1_Init(%struct.SHAstate_st* noundef %0) #11
  %call25 = tail call i64 @read(i32 noundef 0, i8* noundef %call14, i64 noundef 71) #11
  %call29 = tail call i64 @read(i32 noundef 0, i8* noundef %call18, i64 noundef 128) #11
  %data_plus_mac_size30 = bitcast i64* %data_plus_mac_size to i8*
  call void @llvm.var.annotation(i8* nonnull %data_plus_mac_size30, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.8, i64 0, i64 0), i32 52, i8* null)
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
  %3 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx33, i64 0) #11, !srcloc !12
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
  %5 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx45, i64 0) #11, !srcloc !13
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
  %7 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx58, i64 0) #11, !srcloc !14
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
  %9 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx71, i64 0) #11, !srcloc !15
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
  %11 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx84, i64 0) #11, !srcloc !16
  store volatile i64 %11, i64* %_zzq_result83, align 8
  %_zzq_result83.0._zzq_result83.0._zzq_result83.0. = load volatile i64, i64* %_zzq_result83, align 8
  %12 = load i64, i64* %data_plus_mac_size, align 8
  %call92 = call i32 @__ssl3_cbc_digest_record(%struct.uint8ptr_wrapped_ty* noundef nonnull %md_state, %struct.uint8ptr_wrapped_ty* noundef nonnull %mac_out, %struct.uint8ptr_wrapped_ty* noundef nonnull %header, %struct.uint8ptr_wrapped_ty* noundef nonnull %data, i64 noundef %12)
  %call96 = call i64 @write(i32 noundef 1, i8* noundef %call10, i64 noundef 20) #11
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #8

declare i32 @SHA1_Init(%struct.SHAstate_st* noundef) local_unnamed_addr #4

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #9

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #9

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #6 = { mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind }

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
!9 = !{i64 2148238333, i64 2148238369, i64 2148238437}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = !{i64 2148384488, i64 2148384524, i64 2148384592}
!13 = !{i64 2148386159, i64 2148386195, i64 2148386263}
!14 = !{i64 2148387824, i64 2148387860, i64 2148387928}
!15 = !{i64 2148389477, i64 2148389513, i64 2148389581}
!16 = !{i64 2148391142, i64 2148391178, i64 2148391246}

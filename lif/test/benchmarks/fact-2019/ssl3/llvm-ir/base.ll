; ModuleID = 'llvm-link'
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
define dso_local i32 @__ssl3_cbc_digest_record(%struct.uint8ptr_wrapped_ty* noundef %md_state, %struct.uint8ptr_wrapped_ty* noundef %mac_out, %struct.uint8ptr_wrapped_ty* noundef %header, %struct.uint8ptr_wrapped_ty* noundef %data, i64 noundef %data_plus_mac_size) #0 {
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
  call void @llvm.var.annotation(i8* %md_state_buf1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 43, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %md_state_buf, align 8
  %mac_out_buf2 = bitcast i8** %mac_out_buf to i8*
  call void @llvm.var.annotation(i8* %mac_out_buf2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 44, i8* null)
  %buf3 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 0
  %1 = load i8*, i8** %buf3, align 8
  store i8* %1, i8** %mac_out_buf, align 8
  %header_buf4 = bitcast i8** %header_buf to i8*
  call void @llvm.var.annotation(i8* %header_buf4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 45, i8* null)
  %buf5 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 0
  %2 = load i8*, i8** %buf5, align 8
  store i8* %2, i8** %header_buf, align 8
  %data_buf6 = bitcast i8** %data_buf to i8*
  call void @llvm.var.annotation(i8* %data_buf6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 46, i8* null)
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
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %sub21 = sub i64 %div, 2
  %mul = mul i64 64, %sub21
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %num_starting_blocks.0 = phi i64 [ %sub21, %if.then ], [ 0, %entry ]
  %k.0 = phi i64 [ %mul, %if.then ], [ 0, %entry ]
  %len22 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %7 = load i64, i64* %len22, align 8
  %cmp23 = icmp uge i64 %7, %k.0
  br i1 %cmp23, label %if.then24, label %if.else

if.then24:                                        ; preds = %if.end
  br label %if.end25

if.else:                                          ; preds = %if.end
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 noundef 81, i8* noundef getelementptr inbounds ([135 x i8], [135 x i8]* @__PRETTY_FUNCTION__.__ssl3_cbc_digest_record, i64 0, i64 0)) #7
  unreachable

if.end25:                                         ; preds = %if.then24
  %len26 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %8 = load i64, i64* %len26, align 8
  %mul27 = mul i64 2, 64
  %cmp28 = icmp ule i64 %8, %mul27
  br i1 %cmp28, label %if.then29, label %if.else30

if.then29:                                        ; preds = %if.end25
  br label %if.end31

if.else30:                                        ; preds = %if.end25
  call void @__assert_fail(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 noundef 82, i8* noundef getelementptr inbounds ([135 x i8], [135 x i8]* @__PRETTY_FUNCTION__.__ssl3_cbc_digest_record, i64 0, i64 0)) #7
  unreachable

if.end31:                                         ; preds = %if.then29
  %9 = bitcast [128 x i8]* %first_block to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 128, i1 false)
  %mul32 = mul i64 8, %sub16
  %10 = bitcast [16 x i8]* %length_bytes to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 16, i1 false)
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
  %cmp45 = icmp ugt i64 %k.0, 0
  br i1 %cmp45, label %if.then47, label %if.end66

if.then47:                                        ; preds = %if.end31
  %len48 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %11 = load i64, i64* %len48, align 8
  %cmp49 = icmp ule i64 %11, 64
  br i1 %cmp49, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.then47
  br label %return

if.end52:                                         ; preds = %if.then47
  %len53 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %12 = load i64, i64* %len53, align 8
  %sub54 = sub i64 %12, 64
  %13 = load i8*, i8** %md_state_buf, align 8
  %14 = bitcast i8* %13 to %struct.SHAstate_st*
  %15 = load i8*, i8** %header_buf, align 8
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %14, i8* noundef %15)
  %arraydecay = getelementptr inbounds [128 x i8], [128 x i8]* %first_block, i64 0, i64 0
  %16 = load i8*, i8** %header_buf, align 8
  %arrayidx55 = getelementptr inbounds i8, i8* %16, i64 64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %arrayidx55, i64 %sub54, i1 false)
  %sub56 = sub i64 64, %sub54
  %arrayidx57 = getelementptr inbounds [128 x i8], [128 x i8]* %first_block, i64 0, i64 %sub54
  %17 = load i8*, i8** %data_buf, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arrayidx57, i8* align 1 %17, i64 %sub56, i1 false)
  %18 = load i8*, i8** %md_state_buf, align 8
  %19 = bitcast i8* %18 to %struct.SHAstate_st*
  %arraydecay58 = getelementptr inbounds [128 x i8], [128 x i8]* %first_block, i64 0, i64 0
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %19, i8* noundef %arraydecay58)
  %div59 = udiv i64 %k.0, 64
  %sub60 = sub i64 %div59, 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end52
  %i.0 = phi i64 [ 1, %if.end52 ], [ %inc, %for.inc ]
  %cmp61 = icmp ult i64 %i.0, %sub60
  br i1 %cmp61, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %mul63 = mul i64 64, %i.0
  %sub64 = sub i64 %mul63, %sub54
  %20 = load i8*, i8** %md_state_buf, align 8
  %21 = bitcast i8* %20 to %struct.SHAstate_st*
  %22 = load i8*, i8** %data_buf, align 8
  %arrayidx65 = getelementptr inbounds i8, i8* %22, i64 %sub64
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %21, i8* noundef %arrayidx65)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i64 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  br label %if.end66

if.end66:                                         ; preds = %for.end, %if.end31
  %add68 = add i64 %num_starting_blocks.0, 2
  %add69 = add i64 %add68, 1
  br label %for.cond71

for.cond71:                                       ; preds = %for.inc172, %if.end66
  %k.1 = phi i64 [ %k.0, %if.end66 ], [ %k.2, %for.inc172 ]
  %i70.0 = phi i64 [ %num_starting_blocks.0, %if.end66 ], [ %inc173, %for.inc172 ]
  %cmp72 = icmp ult i64 %i70.0, %add69
  br i1 %cmp72, label %for.body74, label %for.end174

for.body74:                                       ; preds = %for.cond71
  %23 = bitcast [128 x i8]* %block to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %23, i8 0, i64 128, i1 false)
  %cmp75 = icmp eq i64 %i70.0, %div17
  %frombool = zext i1 %cmp75 to i8
  %cmp77 = icmp eq i64 %i70.0, %div19
  %frombool79 = zext i1 %cmp77 to i8
  br label %for.cond80

for.cond80:                                       ; preds = %for.inc144, %for.body74
  %k.2 = phi i64 [ %k.1, %for.body74 ], [ %inc101, %for.inc144 ]
  %j.0 = phi i64 [ 0, %for.body74 ], [ %inc145, %for.inc144 ]
  %cmp81 = icmp ult i64 %j.0, 64
  br i1 %cmp81, label %for.body83, label %for.end146

for.body83:                                       ; preds = %for.cond80
  %len84 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %24 = load i64, i64* %len84, align 8
  %cmp85 = icmp ult i64 %k.2, %24
  br i1 %cmp85, label %if.then87, label %if.else89

if.then87:                                        ; preds = %for.body83
  %25 = load i8*, i8** %header_buf, align 8
  %arrayidx88 = getelementptr inbounds i8, i8* %25, i64 %k.2
  %26 = load i8, i8* %arrayidx88, align 1
  br label %if.end100

if.else89:                                        ; preds = %for.body83
  %len90 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %27 = load i64, i64* %len90, align 8
  %len91 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %28 = load i64, i64* %len91, align 8
  %add92 = add i64 %27, %28
  %cmp93 = icmp ult i64 %k.2, %add92
  br i1 %cmp93, label %if.then95, label %if.end99

if.then95:                                        ; preds = %if.else89
  %29 = load i8*, i8** %data_buf, align 8
  %len96 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %30 = load i64, i64* %len96, align 8
  %sub97 = sub i64 %k.2, %30
  %arrayidx98 = getelementptr inbounds i8, i8* %29, i64 %sub97
  %31 = load i8, i8* %arrayidx98, align 1
  br label %if.end99

if.end99:                                         ; preds = %if.then95, %if.else89
  %b.0 = phi i8 [ %31, %if.then95 ], [ 0, %if.else89 ]
  br label %if.end100

if.end100:                                        ; preds = %if.end99, %if.then87
  %b.1 = phi i8 [ %26, %if.then87 ], [ %b.0, %if.end99 ]
  %inc101 = add i64 %k.2, 1
  %tobool = trunc i8 %frombool to i1
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end100
  %cmp103 = icmp uge i64 %j.0, %rem
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end100
  %32 = phi i1 [ false, %if.end100 ], [ %cmp103, %land.rhs ]
  %frombool105 = zext i1 %32 to i8
  %tobool106 = trunc i8 %frombool to i1
  br i1 %tobool106, label %land.rhs108, label %land.end112

land.rhs108:                                      ; preds = %land.end
  %add109 = add i64 %rem, 1
  %cmp110 = icmp uge i64 %j.0, %add109
  br label %land.end112

land.end112:                                      ; preds = %land.rhs108, %land.end
  %33 = phi i1 [ false, %land.end ], [ %cmp110, %land.rhs108 ]
  %frombool113 = zext i1 %33 to i8
  %tobool114 = trunc i8 %frombool105 to i1
  br i1 %tobool114, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.end112
  br label %cond.end

cond.false:                                       ; preds = %land.end112
  %conv116 = zext i8 %b.1 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 128, %cond.true ], [ %conv116, %cond.false ]
  %conv117 = trunc i32 %cond to i8
  %tobool118 = trunc i8 %frombool113 to i1
  br i1 %tobool118, label %if.then119, label %if.end120

if.then119:                                       ; preds = %cond.end
  br label %if.end120

if.end120:                                        ; preds = %if.then119, %cond.end
  %b.2 = phi i8 [ 0, %if.then119 ], [ %conv117, %cond.end ]
  %tobool121 = trunc i8 %frombool79 to i1
  br i1 %tobool121, label %land.lhs.true, label %if.end125

land.lhs.true:                                    ; preds = %if.end120
  %tobool123 = trunc i8 %frombool to i1
  br i1 %tobool123, label %if.end125, label %if.then124

if.then124:                                       ; preds = %land.lhs.true
  br label %if.end125

if.end125:                                        ; preds = %if.then124, %land.lhs.true, %if.end120
  %b.3 = phi i8 [ %b.2, %land.lhs.true ], [ 0, %if.then124 ], [ %b.2, %if.end120 ]
  %sub126 = sub i64 64, 8
  %cmp127 = icmp uge i64 %j.0, %sub126
  br i1 %cmp127, label %if.then129, label %if.end142

if.then129:                                       ; preds = %if.end125
  %tobool130 = trunc i8 %frombool79 to i1
  br i1 %tobool130, label %cond.true132, label %cond.false137

cond.true132:                                     ; preds = %if.then129
  %sub133 = sub i64 64, 8
  %sub134 = sub i64 %j.0, %sub133
  %arrayidx135 = getelementptr inbounds [16 x i8], [16 x i8]* %length_bytes, i64 0, i64 %sub134
  %34 = load i8, i8* %arrayidx135, align 1
  %conv136 = zext i8 %34 to i32
  br label %cond.end139

cond.false137:                                    ; preds = %if.then129
  %conv138 = zext i8 %b.3 to i32
  br label %cond.end139

cond.end139:                                      ; preds = %cond.false137, %cond.true132
  %cond140 = phi i32 [ %conv136, %cond.true132 ], [ %conv138, %cond.false137 ]
  %conv141 = trunc i32 %cond140 to i8
  br label %if.end142

if.end142:                                        ; preds = %cond.end139, %if.end125
  %b.4 = phi i8 [ %conv141, %cond.end139 ], [ %b.3, %if.end125 ]
  %arrayidx143 = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 %j.0
  store i8 %b.4, i8* %arrayidx143, align 1
  br label %for.inc144

for.inc144:                                       ; preds = %if.end142
  %inc145 = add i64 %j.0, 1
  br label %for.cond80, !llvm.loop !8

for.end146:                                       ; preds = %for.cond80
  %35 = load i8*, i8** %md_state_buf, align 8
  %36 = bitcast i8* %35 to %struct.SHAstate_st*
  %arraydecay147 = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 0
  call void @SHA1_Transform(%struct.SHAstate_st* noundef %36, i8* noundef %arraydecay147)
  %37 = load i8*, i8** %md_state_buf, align 8
  %38 = bitcast i8* %37 to %struct.SHAstate_st*
  %arraydecay148 = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 0
  call void @md_final_raw(%struct.SHAstate_st* noundef %38, i8* noundef %arraydecay148)
  store i32 0, i32* %foo, align 4
  br label %for.cond150

for.cond150:                                      ; preds = %for.inc169, %for.end146
  %j149.0 = phi i64 [ 0, %for.end146 ], [ %inc170, %for.inc169 ]
  %cmp151 = icmp ult i64 %j149.0, 20
  br i1 %cmp151, label %for.body153, label %for.end171

for.body153:                                      ; preds = %for.cond150
  %tobool154 = trunc i8 %frombool79 to i1
  br i1 %tobool154, label %if.then155, label %if.else158

if.then155:                                       ; preds = %for.body153
  %arrayidx156 = getelementptr inbounds [128 x i8], [128 x i8]* %block, i64 0, i64 %j149.0
  %39 = load i8, i8* %arrayidx156, align 1
  %40 = load i8*, i8** %mac_out_buf, align 8
  %arrayidx157 = getelementptr inbounds i8, i8* %40, i64 %j149.0
  store i8 %39, i8* %arrayidx157, align 1
  br label %if.end161

if.else158:                                       ; preds = %for.body153
  %41 = load i8*, i8** %mac_out_buf, align 8
  %arrayidx159 = getelementptr inbounds i8, i8* %41, i64 %j149.0
  store i8 0, i8* %arrayidx159, align 1
  %42 = load i32, i32* %foo, align 4
  %inc160 = add nsw i32 %42, 1
  store i32 %inc160, i32* %foo, align 4
  br label %if.end161

if.end161:                                        ; preds = %if.else158, %if.then155
  %arrayidx162 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236546, i64* %arrayidx162, align 16
  %43 = ptrtoint i32* %foo to i64
  %arrayidx163 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %43, i64* %arrayidx163, align 8
  %arrayidx164 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 4, i64* %arrayidx164, align 16
  %arrayidx165 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx165, align 8
  %arrayidx166 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx166, align 16
  %arrayidx167 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx167, align 8
  %arrayidx168 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %44 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx168, i64 0) #8, !srcloc !9
  store volatile i64 %44, i64* %_zzq_result, align 8
  %45 = load volatile i64, i64* %_zzq_result, align 8
  %46 = load i32, i32* %foo, align 4
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 noundef %46)
  br label %for.inc169

for.inc169:                                       ; preds = %if.end161
  %inc170 = add i64 %j149.0, 1
  br label %for.cond150, !llvm.loop !10

for.end171:                                       ; preds = %for.cond150
  br label %for.inc172

for.inc172:                                       ; preds = %for.end171
  %inc173 = add i64 %i70.0, 1
  br label %for.cond71, !llvm.loop !11

for.end174:                                       ; preds = %for.cond71
  br label %return

return:                                           ; preds = %for.end174, %if.then51
  %retval.0 = phi i32 [ 0, %if.then51 ], [ 1, %for.end174 ]
  ret i32 %retval.0
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
define internal void @md_final_raw(%struct.SHAstate_st* noundef %ctx, i8* noundef %md_out) #0 {
entry:
  %h0 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 0
  %0 = load i32, i32* %h0, align 4
  %shr = lshr i32 %0, 24
  %and = and i32 %shr, 255
  %conv = trunc i32 %and to i8
  %incdec.ptr = getelementptr inbounds i8, i8* %md_out, i32 1
  store i8 %conv, i8* %md_out, align 1
  %h01 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 0
  %1 = load i32, i32* %h01, align 4
  %shr2 = lshr i32 %1, 16
  %and3 = and i32 %shr2, 255
  %conv4 = trunc i32 %and3 to i8
  %incdec.ptr5 = getelementptr inbounds i8, i8* %incdec.ptr, i32 1
  store i8 %conv4, i8* %incdec.ptr, align 1
  %h06 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 0
  %2 = load i32, i32* %h06, align 4
  %shr7 = lshr i32 %2, 8
  %and8 = and i32 %shr7, 255
  %conv9 = trunc i32 %and8 to i8
  %incdec.ptr10 = getelementptr inbounds i8, i8* %incdec.ptr5, i32 1
  store i8 %conv9, i8* %incdec.ptr5, align 1
  %h011 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 0
  %3 = load i32, i32* %h011, align 4
  %and12 = and i32 %3, 255
  %conv13 = trunc i32 %and12 to i8
  %incdec.ptr14 = getelementptr inbounds i8, i8* %incdec.ptr10, i32 1
  store i8 %conv13, i8* %incdec.ptr10, align 1
  %h1 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 1
  %4 = load i32, i32* %h1, align 4
  %shr15 = lshr i32 %4, 24
  %and16 = and i32 %shr15, 255
  %conv17 = trunc i32 %and16 to i8
  %incdec.ptr18 = getelementptr inbounds i8, i8* %incdec.ptr14, i32 1
  store i8 %conv17, i8* %incdec.ptr14, align 1
  %h119 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 1
  %5 = load i32, i32* %h119, align 4
  %shr20 = lshr i32 %5, 16
  %and21 = and i32 %shr20, 255
  %conv22 = trunc i32 %and21 to i8
  %incdec.ptr23 = getelementptr inbounds i8, i8* %incdec.ptr18, i32 1
  store i8 %conv22, i8* %incdec.ptr18, align 1
  %h124 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 1
  %6 = load i32, i32* %h124, align 4
  %shr25 = lshr i32 %6, 8
  %and26 = and i32 %shr25, 255
  %conv27 = trunc i32 %and26 to i8
  %incdec.ptr28 = getelementptr inbounds i8, i8* %incdec.ptr23, i32 1
  store i8 %conv27, i8* %incdec.ptr23, align 1
  %h129 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 1
  %7 = load i32, i32* %h129, align 4
  %and30 = and i32 %7, 255
  %conv31 = trunc i32 %and30 to i8
  %incdec.ptr32 = getelementptr inbounds i8, i8* %incdec.ptr28, i32 1
  store i8 %conv31, i8* %incdec.ptr28, align 1
  %h2 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 2
  %8 = load i32, i32* %h2, align 4
  %shr33 = lshr i32 %8, 24
  %and34 = and i32 %shr33, 255
  %conv35 = trunc i32 %and34 to i8
  %incdec.ptr36 = getelementptr inbounds i8, i8* %incdec.ptr32, i32 1
  store i8 %conv35, i8* %incdec.ptr32, align 1
  %h237 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 2
  %9 = load i32, i32* %h237, align 4
  %shr38 = lshr i32 %9, 16
  %and39 = and i32 %shr38, 255
  %conv40 = trunc i32 %and39 to i8
  %incdec.ptr41 = getelementptr inbounds i8, i8* %incdec.ptr36, i32 1
  store i8 %conv40, i8* %incdec.ptr36, align 1
  %h242 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 2
  %10 = load i32, i32* %h242, align 4
  %shr43 = lshr i32 %10, 8
  %and44 = and i32 %shr43, 255
  %conv45 = trunc i32 %and44 to i8
  %incdec.ptr46 = getelementptr inbounds i8, i8* %incdec.ptr41, i32 1
  store i8 %conv45, i8* %incdec.ptr41, align 1
  %h247 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 2
  %11 = load i32, i32* %h247, align 4
  %and48 = and i32 %11, 255
  %conv49 = trunc i32 %and48 to i8
  %incdec.ptr50 = getelementptr inbounds i8, i8* %incdec.ptr46, i32 1
  store i8 %conv49, i8* %incdec.ptr46, align 1
  %h3 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 3
  %12 = load i32, i32* %h3, align 4
  %shr51 = lshr i32 %12, 24
  %and52 = and i32 %shr51, 255
  %conv53 = trunc i32 %and52 to i8
  %incdec.ptr54 = getelementptr inbounds i8, i8* %incdec.ptr50, i32 1
  store i8 %conv53, i8* %incdec.ptr50, align 1
  %h355 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 3
  %13 = load i32, i32* %h355, align 4
  %shr56 = lshr i32 %13, 16
  %and57 = and i32 %shr56, 255
  %conv58 = trunc i32 %and57 to i8
  %incdec.ptr59 = getelementptr inbounds i8, i8* %incdec.ptr54, i32 1
  store i8 %conv58, i8* %incdec.ptr54, align 1
  %h360 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 3
  %14 = load i32, i32* %h360, align 4
  %shr61 = lshr i32 %14, 8
  %and62 = and i32 %shr61, 255
  %conv63 = trunc i32 %and62 to i8
  %incdec.ptr64 = getelementptr inbounds i8, i8* %incdec.ptr59, i32 1
  store i8 %conv63, i8* %incdec.ptr59, align 1
  %h365 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 3
  %15 = load i32, i32* %h365, align 4
  %and66 = and i32 %15, 255
  %conv67 = trunc i32 %and66 to i8
  %incdec.ptr68 = getelementptr inbounds i8, i8* %incdec.ptr64, i32 1
  store i8 %conv67, i8* %incdec.ptr64, align 1
  %h4 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 4
  %16 = load i32, i32* %h4, align 4
  %shr69 = lshr i32 %16, 24
  %and70 = and i32 %shr69, 255
  %conv71 = trunc i32 %and70 to i8
  %incdec.ptr72 = getelementptr inbounds i8, i8* %incdec.ptr68, i32 1
  store i8 %conv71, i8* %incdec.ptr68, align 1
  %h473 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 4
  %17 = load i32, i32* %h473, align 4
  %shr74 = lshr i32 %17, 16
  %and75 = and i32 %shr74, 255
  %conv76 = trunc i32 %and75 to i8
  %incdec.ptr77 = getelementptr inbounds i8, i8* %incdec.ptr72, i32 1
  store i8 %conv76, i8* %incdec.ptr72, align 1
  %h478 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 4
  %18 = load i32, i32* %h478, align 4
  %shr79 = lshr i32 %18, 8
  %and80 = and i32 %shr79, 255
  %conv81 = trunc i32 %and80 to i8
  %incdec.ptr82 = getelementptr inbounds i8, i8* %incdec.ptr77, i32 1
  store i8 %conv81, i8* %incdec.ptr77, align 1
  %h483 = getelementptr inbounds %struct.SHAstate_st, %struct.SHAstate_st* %ctx, i32 0, i32 4
  %19 = load i32, i32* %h483, align 4
  %and84 = and i32 %19, 255
  %conv85 = trunc i32 %and84 to i8
  %incdec.ptr86 = getelementptr inbounds i8, i8* %incdec.ptr82, i32 1
  store i8 %conv85, i8* %incdec.ptr82, align 1
  ret void
}

declare i32 @printf(i8* noundef, ...) #4

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %md_state = alloca %struct.uint8ptr_wrapped_ty, align 8
  %mac_out = alloca %struct.uint8ptr_wrapped_ty, align 8
  %header = alloca %struct.uint8ptr_wrapped_ty, align 8
  %data = alloca %struct.uint8ptr_wrapped_ty, align 8
  %data_plus_mac_size = alloca i64, align 8
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
  store i8* %call, i8** %buf, align 8
  %len8 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 1
  %1 = load i64, i64* %len8, align 8
  %mul9 = mul i64 %1, 1
  %call10 = call noalias i8* @malloc(i64 noundef %mul9) #8
  %buf11 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 0
  store i8* %call10, i8** %buf11, align 8
  %len12 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %2 = load i64, i64* %len12, align 8
  %mul13 = mul i64 %2, 1
  %call14 = call noalias i8* @malloc(i64 noundef %mul13) #8
  %buf15 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 0
  store i8* %call14, i8** %buf15, align 8
  %len16 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %3 = load i64, i64* %len16, align 8
  %mul17 = mul i64 %3, 1
  %call18 = call noalias i8* @malloc(i64 noundef %mul17) #8
  %buf19 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 0
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
  call void @llvm.var.annotation(i8* %data_plus_mac_size30, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.8, i32 0, i32 0), i32 52, i8* null)
  %len31 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %10 = load i64, i64* %len31, align 8
  %buf32 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 0
  %11 = load i8*, i8** %buf32, align 8
  %arrayidx = getelementptr inbounds i8, i8* %11, i64 127
  %12 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %12 to i64
  %sub = sub i64 %10, %conv
  store i64 %sub, i64* %data_plus_mac_size, align 8
  %13 = load i64, i64* %data_plus_mac_size, align 8
  %call33 = call i32 @__ssl3_cbc_digest_record(%struct.uint8ptr_wrapped_ty* noundef %md_state, %struct.uint8ptr_wrapped_ty* noundef %mac_out, %struct.uint8ptr_wrapped_ty* noundef %header, %struct.uint8ptr_wrapped_ty* noundef %data, i64 noundef %13)
  %buf34 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 0
  %14 = load i8*, i8** %buf34, align 8
  %len35 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 1
  %15 = load i64, i64* %len35, align 8
  %mul36 = mul i64 %15, 1
  %call37 = call i64 @write(i32 noundef 1, i8* noundef %14, i64 noundef %mul36)
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
!9 = !{i64 2148240467, i64 2148240503, i64 2148240571}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}

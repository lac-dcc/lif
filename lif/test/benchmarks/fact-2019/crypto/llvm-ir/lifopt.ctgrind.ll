; ModuleID = 'llvm-ir/lif.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.uint8ptr_wrapped_ty = type { i8*, i64 }
%struct.poly1305_state_internal_t = type { [3 x i64], [3 x i64], [2 x i64], i64, [16 x i8], i8 }

@llvm.global.annotations = appending global [13 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*)* @_crypto_stream_salsa20 to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 111, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, i64, %struct.uint8ptr_wrapped_ty*)* @_crypto_stream_salsa20_xor_ic to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 154, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (void (%struct.poly1305_state_internal_t*, %struct.uint8ptr_wrapped_ty*)* @_poly1305_blocks to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3.2, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 8, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (void (%struct.poly1305_state_internal_t*, %struct.uint8ptr_wrapped_ty*)* @_poly1305_update to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3.2, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 102, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*)* @_crypto_onetimeauth_poly1305 to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3.2, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 287, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i1 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*)* @_crypto_onetimeauth_poly1305_verify to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3.2, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 309, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*)* @__crypto_stream_xsalsa20 to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2.16, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 95, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, i64, %struct.uint8ptr_wrapped_ty*)* @__crypto_stream_xsalsa20_xor_ic to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3.18, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 113, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, i1)* @__crypto_stream_xsalsa20_xor to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3.18, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 134, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i1 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*)* @__crypto_secretbox_xsalsa20poly1305 to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3.18, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 144, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i1 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*)* @__crypto_secretbox_xsalsa20poly1305_open to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3.18, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 186, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i1 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*)* @__crypto_secretbox to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3.18, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 236, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i1 (%struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*, %struct.uint8ptr_wrapped_ty*)* @__crypto_secretbox_open to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3.18, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 246, i8* null }], section "llvm.metadata"
@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [14 x i8] c"lib/salsa20.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [9 x i8] c"nowrap:0\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [17 x i8] c"m->len == c->len\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"lib/salsa20.c\00", align 1
@__PRETTY_FUNCTION__._crypto_stream_salsa20_xor_ic = private unnamed_addr constant [116 x i8] c"int32_t _crypto_stream_salsa20_xor_ic(uint8ptr_wrapped_ty *, uint8ptr_wrapped_ty *, uint8_t *, uint64_t, uint8_t *)\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"nowrap:0,1\00", section "llvm.metadata"
@.str.6 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.3 = private unnamed_addr constant [22 x i8] c"lib/crypto_poly1305.c\00", section "llvm.metadata"
@.str.2.8 = private unnamed_addr constant [33 x i8] c"lib/../include/crypto_poly1305.h\00", section "llvm.metadata"
@.str.3.2 = private unnamed_addr constant [9 x i8] c"nowrap:1\00", section "llvm.metadata"
@.str.4.9 = private unnamed_addr constant [25 x i8] c"index < len_state_buffer\00", align 1
@.str.5.7 = private unnamed_addr constant [22 x i8] c"lib/crypto_poly1305.c\00", align 1
@__PRETTY_FUNCTION__._poly1305_update = private unnamed_addr constant [74 x i8] c"void _poly1305_update(poly1305_state_internal_t *, uint8ptr_wrapped_ty *)\00", align 1
@.str.6.10 = private unnamed_addr constant [11 x i8] c"i < m->len\00", align 1
@.str.7 = private unnamed_addr constant [25 x i8] c"_mindex < _mindex + want\00", align 1
@.str.8 = private unnamed_addr constant [25 x i8] c"_mindex + want <= m->len\00", align 1
@.str.9 = private unnamed_addr constant [33 x i8] c"_leftover + i < len_state_buffer\00", align 1
@.str.10 = private unnamed_addr constant [21 x i8] c"_mindex + i < m->len\00", align 1
@.str.11 = private unnamed_addr constant [25 x i8] c"start < len_state_buffer\00", align 1
@__PRETTY_FUNCTION__._poly1305_finish = private unnamed_addr constant [62 x i8] c"void _poly1305_finish(poly1305_state_internal_t *, uint8_t *)\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.14 = private unnamed_addr constant [14 x i8] c"lib/_stdlib.c\00", section "llvm.metadata"
@.str.19 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.17 = private unnamed_addr constant [23 x i8] c"lib/crypto_secretbox.c\00", section "llvm.metadata"
@.str.2.16 = private unnamed_addr constant [9 x i8] c"nowrap:0\00", section "llvm.metadata"
@.str.3.18 = private unnamed_addr constant [11 x i8] c"nowrap:0,1\00", section "llvm.metadata"
@.str.4.20 = private unnamed_addr constant [17 x i8] c"c->len == m->len\00", align 1
@.str.5.21 = private unnamed_addr constant [23 x i8] c"lib/crypto_secretbox.c\00", align 1
@__PRETTY_FUNCTION__.__crypto_secretbox_xsalsa20poly1305 = private unnamed_addr constant [110 x i8] c"_Bool __crypto_secretbox_xsalsa20poly1305(uint8ptr_wrapped_ty *, uint8ptr_wrapped_ty *, uint8_t *, uint8_t *)\00", align 1
@__PRETTY_FUNCTION__.__crypto_secretbox_xsalsa20poly1305_open = private unnamed_addr constant [115 x i8] c"_Bool __crypto_secretbox_xsalsa20poly1305_open(uint8ptr_wrapped_ty *, uint8ptr_wrapped_ty *, uint8_t *, uint8_t *)\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @_crypto_stream_salsa20(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %c, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %n, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %k) #0 {
entry:
  %arraydecay38.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay39.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay40.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay11.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay12.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i64 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  %c_buf = alloca i8*, align 8
  %kcopy = alloca [32 x i8], align 16
  %input = alloca [16 x i8], align 16
  %u = alloca i32, align 4
  %block = alloca [64 x i8], align 16
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 114, i8* null)
  %c_buf2 = bitcast i8** %c_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %c_buf2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 116, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i64 0, i32 0
  %2 = load i8*, i8** %buf, align 8
  store i8* %2, i8** %c_buf, align 8
  %kcopy3 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %kcopy3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 119, i8* null)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %kcopy3, i8* noundef nonnull align 1 dereferenceable(32) %k.unwrapped, i64 32, i1 false)
  %input4 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %input4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 122, i8* null)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %input4, i8 0, i64 16, i1 false)
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i8, i8* %n.unwrapped, i64 %indvars.iv
  %3 = load i8, i8* %arrayidx, align 1
  %arrayidx6 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %indvars.iv
  store i8 %3, i8* %arrayidx6, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !6

for.end:                                          ; preds = %for.body
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i64 0, i32 1
  %4 = load i64, i64* %c.field0.length.ptr, align 8
  %5 = and i64 %4, 4294967232
  %cmp813.not = icmp eq i64 %5, 0
  br i1 %cmp813.not, label %for.end31, label %for.body10.lr.ph

for.body10.lr.ph:                                 ; preds = %for.end
  %shr = lshr i64 %4, 6
  %add.ptr.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i64 0, i32 0
  %add.ptr.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i64 0, i32 1
  %arraydecay11.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay11.wrapped, i64 0, i32 0
  %arraydecay11.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay11.wrapped, i64 0, i32 1
  %arraydecay12.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay12.wrapped, i64 0, i32 0
  %arraydecay12.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay12.wrapped, i64 0, i32 1
  %u13 = bitcast i32* %u to i8*
  %wide.trip.count = and i64 %shr, 67108863
  br label %for.body10

for.body10:                                       ; preds = %for.end28.for.body10_crit_edge, %for.body10.lr.ph
  %6 = phi i8* [ %2, %for.body10.lr.ph ], [ %.pre, %for.end28.for.body10_crit_edge ]
  %indvars.iv25 = phi i64 [ 0, %for.body10.lr.ph ], [ %indvars.iv.next26, %for.end28.for.body10_crit_edge ]
  %7 = shl i64 %indvars.iv25, 6
  %add.ptr = getelementptr inbounds i8, i8* %6, i64 %7
  store i64 0, i64* %add.ptr.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr, i8** %add.ptr.unwrapped, align 8
  store i64 16, i64* %arraydecay11.wrapped.field0.length.ptr, align 8
  store i8* %input4, i8** %arraydecay11.unwrapped, align 8
  store i64 32, i64* %arraydecay12.wrapped.field0.length.ptr, align 8
  store i8* %kcopy3, i8** %arraydecay12.unwrapped, align 8
  call void @_crypto_core_salsa20(%struct.uint8ptr_wrapped_ty* nonnull %add.ptr.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay11.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay12.wrapped)
  call void @llvm.var.annotation(i8* nonnull %u13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 131, i8* null)
  br label %for.body18

for.body18:                                       ; preds = %for.body10, %for.body18
  %indvars.iv21 = phi i64 [ 8, %for.body10 ], [ %indvars.iv.next22, %for.body18 ]
  %shr25710 = phi i32 [ 1, %for.body10 ], [ %shr25, %for.body18 ]
  %arrayidx20 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %indvars.iv21
  %8 = load i8, i8* %arrayidx20, align 1
  %conv21 = zext i8 %8 to i32
  %add = add nuw nsw i32 %shr25710, %conv21
  %conv22 = trunc i32 %add to i8
  store i8 %conv22, i8* %arrayidx20, align 1
  %shr25 = lshr i32 %add, 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24.not = icmp eq i64 %indvars.iv.next22, 16
  br i1 %exitcond24.not, label %for.end28, label %for.body18, !llvm.loop !8

for.end28:                                        ; preds = %for.body18
  store i32 %shr25, i32* %u, align 4
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28.not = icmp eq i64 %indvars.iv.next26, %wide.trip.count
  br i1 %exitcond28.not, label %for.end31.loopexit, label %for.end28.for.body10_crit_edge, !llvm.loop !9

for.end28.for.body10_crit_edge:                   ; preds = %for.end28
  %.pre = load i8*, i8** %c_buf, align 8
  br label %for.body10

for.end31.loopexit:                               ; preds = %for.end28
  %.pre32 = load i64, i64* %c.field0.length.ptr, align 8
  br label %for.end31

for.end31:                                        ; preds = %for.end31.loopexit, %for.end
  %9 = phi i64 [ %.pre32, %for.end31.loopexit ], [ %4, %for.end ]
  %block32 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %block32, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 139, i8* null)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) %block32, i8 0, i64 64, i1 false)
  %mul33 = and i64 %4, 4294967232
  %cmp36 = icmp ult i64 %mul33, %9
  br i1 %cmp36, label %if.then, label %if.end

if.then:                                          ; preds = %for.end31
  %arraydecay38.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay38.wrapped, i64 0, i32 0
  %arraydecay38.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay38.wrapped, i64 0, i32 1
  store i64 64, i64* %arraydecay38.wrapped.field0.length.ptr, align 8
  store i8* %block32, i8** %arraydecay38.unwrapped, align 8
  %arraydecay39.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay39.wrapped, i64 0, i32 0
  %arraydecay39.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay39.wrapped, i64 0, i32 1
  store i64 16, i64* %arraydecay39.wrapped.field0.length.ptr, align 8
  store i8* %input4, i8** %arraydecay39.unwrapped, align 8
  %arraydecay40.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay40.wrapped, i64 0, i32 0
  %arraydecay40.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay40.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay40.wrapped.field0.length.ptr, align 8
  store i8* %kcopy3, i8** %arraydecay40.unwrapped, align 8
  call void @_crypto_core_salsa20(%struct.uint8ptr_wrapped_ty* nonnull %arraydecay38.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay39.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay40.wrapped)
  %10 = load i64, i64* %c.field0.length.ptr, align 8
  %sub = sub i64 %10, %mul33
  %conv44 = trunc i64 %sub to i32
  %cmp4717.not = icmp eq i32 %conv44, 0
  br i1 %cmp4717.not, label %if.end, label %for.body49.preheader

for.body49.preheader:                             ; preds = %if.then
  %11 = and i64 %sub, 4294967295
  br label %for.body49

for.body49:                                       ; preds = %for.body49.preheader, %for.body49
  %indvars.iv29 = phi i64 [ 0, %for.body49.preheader ], [ %indvars.iv.next30, %for.body49 ]
  %arrayidx51 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 %indvars.iv29
  %12 = load i8, i8* %arrayidx51, align 1
  %13 = load i8*, i8** %c_buf, align 8
  %arrayidx53 = getelementptr inbounds i8, i8* %13, i64 %indvars.iv29
  store i8 %12, i8* %arrayidx53, align 1
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %cmp47 = icmp ult i64 %indvars.iv.next30, %11
  br i1 %cmp47, label %for.body49, label %if.end, !llvm.loop !10

if.end:                                           ; preds = %for.body49, %if.then, %for.end31
  call void @sodium_memzero(i8* noundef nonnull %block32, i64 noundef 64) #14
  call void @sodium_memzero(i8* noundef nonnull %kcopy3, i64 noundef 32) #14
  ret i32 0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @_crypto_stream_salsa20_xor_ic(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %c, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %m, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %n, i64 noundef %ic_val, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %k) #0 {
entry:
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i64 0, i32 1
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i64 0, i32 1
  %arraydecay72.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay73.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay74.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay27.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay28.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay29.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i64 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %n.addr = alloca i8*, align 8
  %k.addr = alloca i8*, align 8
  %c_buf = alloca i8*, align 8
  %m_buf = alloca i8*, align 8
  %kcopy = alloca [32 x i8], align 16
  %input = alloca [16 x i8], align 16
  %block = alloca [64 x i8], align 16
  %u = alloca i32, align 4
  store i8* %n.unwrapped, i8** %n.addr, align 8
  %n.addr1 = bitcast i8** %n.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %n.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 157, i8* null)
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr2 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %k.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 159, i8* null)
  %c_buf3 = bitcast i8** %c_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %c_buf3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 162, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i64 0, i32 0
  %2 = load i8*, i8** %buf, align 8
  store i8* %2, i8** %c_buf, align 8
  %m_buf4 = bitcast i8** %m_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %m_buf4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 163, i8* null)
  %buf5 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i64 0, i32 0
  %3 = load i8*, i8** %buf5, align 8
  store i8* %3, i8** %m_buf, align 8
  %4 = load i64, i64* %m.field0.length.ptr, align 8
  %5 = load i64, i64* %c.field0.length.ptr, align 8
  %cmp = icmp eq i64 %4, %5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %kcopy7 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %kcopy7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 169, i8* null)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %kcopy7, i8* noundef nonnull align 1 dereferenceable(32) %k.unwrapped, i64 32, i1 false)
  %input8 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %input8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 172, i8* null)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %input8, i8 0, i64 16, i1 false)
  br label %for.body

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), i32 noundef 166, i8* noundef getelementptr inbounds ([116 x i8], [116 x i8]* @__PRETTY_FUNCTION__._crypto_stream_salsa20_xor_ic, i64 0, i64 0)) #15
  unreachable

for.body:                                         ; preds = %if.then, %for.body
  %indvars.iv = phi i64 [ 0, %if.then ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i8, i8* %n.unwrapped, i64 %indvars.iv
  %6 = load i8, i8* %arrayidx, align 1
  %arrayidx11 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %indvars.iv
  store i8 %6, i8* %arrayidx11, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond.not, label %for.body15, label %for.body, !llvm.loop !11

for.body15:                                       ; preds = %for.body, %for.body15
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.body15 ], [ 8, %for.body ]
  %ic.0.rewritten13 = phi i64 [ %shr, %for.body15 ], [ %ic_val, %for.body ]
  %conv = trunc i64 %ic.0.rewritten13 to i8
  %arrayidx17 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %indvars.iv33
  store i8 %conv, i8* %arrayidx17, align 1
  %shr = lshr i64 %ic.0.rewritten13, 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36.not = icmp eq i64 %indvars.iv.next34, 16
  br i1 %exitcond36.not, label %for.end20, label %for.body15, !llvm.loop !12

for.end20:                                        ; preds = %for.body15
  %block22 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %block22, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 183, i8* null)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) %block22, i8 0, i64 64, i1 false)
  %cmp2424.not = icmp ult i64 %4, 64
  br i1 %cmp2424.not, label %for.end65, label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.end20
  %div = lshr i64 %4, 6
  %arraydecay27.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay27.wrapped, i64 0, i32 0
  %arraydecay27.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay27.wrapped, i64 0, i32 1
  %arraydecay28.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay28.wrapped, i64 0, i32 0
  %arraydecay28.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay28.wrapped, i64 0, i32 1
  %arraydecay29.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay29.wrapped, i64 0, i32 0
  %arraydecay29.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay29.wrapped, i64 0, i32 1
  %u47 = bitcast i32* %u to i8*
  br label %for.body26

for.body26:                                       ; preds = %for.body26.lr.ph, %for.end62
  %j.0.rewritten27 = phi i64 [ 0, %for.body26.lr.ph ], [ %inc64, %for.end62 ]
  store i64 64, i64* %arraydecay27.wrapped.field0.length.ptr, align 8
  store i8* %block22, i8** %arraydecay27.unwrapped, align 8
  store i64 16, i64* %arraydecay28.wrapped.field0.length.ptr, align 8
  store i8* %input8, i8** %arraydecay28.unwrapped, align 8
  store i64 32, i64* %arraydecay29.wrapped.field0.length.ptr, align 8
  store i8* %kcopy7, i8** %arraydecay29.unwrapped, align 8
  call void @_crypto_core_salsa20(%struct.uint8ptr_wrapped_ty* nonnull %arraydecay27.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay28.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay29.wrapped)
  br label %for.body34

for.body34:                                       ; preds = %for.body26, %for.body34
  %indvars.iv37 = phi i64 [ 0, %for.body26 ], [ %indvars.iv.next38, %for.body34 ]
  %7 = load i8*, i8** %m_buf, align 8
  %arrayidx36 = getelementptr inbounds i8, i8* %7, i64 %indvars.iv37
  %8 = load i8, i8* %arrayidx36, align 1
  %arrayidx39 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 %indvars.iv37
  %9 = load i8, i8* %arrayidx39, align 1
  %xor10 = xor i8 %9, %8
  %10 = load i8*, i8** %c_buf, align 8
  %arrayidx43 = getelementptr inbounds i8, i8* %10, i64 %indvars.iv37
  store i8 %xor10, i8* %arrayidx43, align 1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40.not = icmp eq i64 %indvars.iv.next38, 64
  br i1 %exitcond40.not, label %for.end46, label %for.body34, !llvm.loop !13

for.end46:                                        ; preds = %for.body34
  call void @llvm.var.annotation(i8* nonnull %u47, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 191, i8* null)
  br label %for.body52

for.body52:                                       ; preds = %for.end46, %for.body52
  %indvars.iv41 = phi i64 [ 8, %for.end46 ], [ %indvars.iv.next42, %for.body52 ]
  %shr591821 = phi i32 [ 1, %for.end46 ], [ %shr59, %for.body52 ]
  %arrayidx54 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %indvars.iv41
  %11 = load i8, i8* %arrayidx54, align 1
  %conv55 = zext i8 %11 to i32
  %add = add nuw nsw i32 %shr591821, %conv55
  %conv56 = trunc i32 %add to i8
  store i8 %conv56, i8* %arrayidx54, align 1
  %shr59 = lshr i32 %add, 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44.not = icmp eq i64 %indvars.iv.next42, 16
  br i1 %exitcond44.not, label %for.end62, label %for.body52, !llvm.loop !14

for.end62:                                        ; preds = %for.body52
  store i32 %shr59, i32* %u, align 4
  %inc64 = add nuw nsw i64 %j.0.rewritten27, 1
  %exitcond45.not = icmp eq i64 %inc64, %div
  br i1 %exitcond45.not, label %for.end65.loopexit, label %for.body26, !llvm.loop !15

for.end65.loopexit:                               ; preds = %for.end62
  %.pre = load i64, i64* %m.field0.length.ptr, align 8
  br label %for.end65

for.end65:                                        ; preds = %for.end65.loopexit, %for.end20
  %12 = phi i64 [ %.pre, %for.end65.loopexit ], [ %4, %for.end20 ]
  %mul = and i64 %4, -64
  %cmp67 = icmp ugt i64 %12, %mul
  br i1 %cmp67, label %if.then69, label %if.end90

if.then69:                                        ; preds = %for.end65
  %sub = sub i64 %12, %mul
  %arraydecay72.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay72.wrapped, i64 0, i32 0
  %arraydecay72.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay72.wrapped, i64 0, i32 1
  store i64 64, i64* %arraydecay72.wrapped.field0.length.ptr, align 8
  store i8* %block22, i8** %arraydecay72.unwrapped, align 8
  %arraydecay73.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay73.wrapped, i64 0, i32 0
  %arraydecay73.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay73.wrapped, i64 0, i32 1
  store i64 16, i64* %arraydecay73.wrapped.field0.length.ptr, align 8
  store i8* %input8, i8** %arraydecay73.unwrapped, align 8
  %arraydecay74.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay74.wrapped, i64 0, i32 0
  %arraydecay74.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay74.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay74.wrapped.field0.length.ptr, align 8
  store i8* %kcopy7, i8** %arraydecay74.unwrapped, align 8
  call void @_crypto_core_salsa20(%struct.uint8ptr_wrapped_ty* nonnull %arraydecay72.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay73.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay74.wrapped)
  %cmp7729.not = icmp eq i64 %sub, 0
  br i1 %cmp7729.not, label %if.end90, label %for.body79

for.body79:                                       ; preds = %if.then69, %for.body79
  %i75.0.rewritten30 = phi i64 [ %inc88, %for.body79 ], [ 0, %if.then69 ]
  %13 = load i8*, i8** %m_buf, align 8
  %arrayidx80 = getelementptr inbounds i8, i8* %13, i64 %i75.0.rewritten30
  %14 = load i8, i8* %arrayidx80, align 1
  %arrayidx82 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 %i75.0.rewritten30
  %15 = load i8, i8* %arrayidx82, align 1
  %xor849 = xor i8 %15, %14
  %16 = load i8*, i8** %c_buf, align 8
  %arrayidx86 = getelementptr inbounds i8, i8* %16, i64 %i75.0.rewritten30
  store i8 %xor849, i8* %arrayidx86, align 1
  %inc88 = add nuw i64 %i75.0.rewritten30, 1
  %exitcond46.not = icmp eq i64 %inc88, %sub
  br i1 %exitcond46.not, label %if.end90, label %for.body79, !llvm.loop !16

if.end90:                                         ; preds = %for.body79, %if.then69, %for.end65
  call void @sodium_memzero(i8* noundef nonnull %block22, i64 noundef 64) #14
  call void @sodium_memzero(i8* noundef nonnull %kcopy7, i64 noundef 32) #14
  %17 = load i8*, i8** %buf, align 8
  %18 = load i8*, i8** %c_buf, align 8
  %19 = load i64, i64* %c.field0.length.ptr, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %17, i8* align 1 %18, i64 %19, i1 false)
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
define dso_local void @_crypto_core_salsa20(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %output, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %input, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %k) local_unnamed_addr #5 {
entry:
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %output, i64 0, i32 0
  %output.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %input, i64 0, i32 0
  %input.unwrapped = load i8*, i8** %1, align 8
  %2 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i64 0, i32 0
  %k.unwrapped = load i8*, i8** %2, align 8
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
  store i8* %output.unwrapped, i8** %output.addr, align 8
  %output.addr1 = bitcast i8** %output.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %output.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 15, i8* null)
  store i8* %input.unwrapped, i8** %input.addr, align 8
  %input.addr2 = bitcast i8** %input.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %input.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 16, i8* null)
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr3 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %k.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 17, i8* null)
  %x04 = bitcast i32* %x0 to i8*
  call void @llvm.var.annotation(i8* nonnull %x04, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 19, i8* null)
  store i32 1634760805, i32* %x0, align 4
  %x55 = bitcast i32* %x5 to i8*
  call void @llvm.var.annotation(i8* nonnull %x55, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 20, i8* null)
  store i32 857760878, i32* %x5, align 4
  %x106 = bitcast i32* %x10 to i8*
  call void @llvm.var.annotation(i8* nonnull %x106, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 21, i8* null)
  store i32 2036477234, i32* %x10, align 4
  %x157 = bitcast i32* %x15 to i8*
  call void @llvm.var.annotation(i8* nonnull %x157, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 22, i8* null)
  store i32 1797285236, i32* %x15, align 4
  %j08 = bitcast i32* %j0 to i8*
  call void @llvm.var.annotation(i8* nonnull %j08, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 24, i8* null)
  store i32 1634760805, i32* %j0, align 4
  %j59 = bitcast i32* %j5 to i8*
  call void @llvm.var.annotation(i8* nonnull %j59, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 25, i8* null)
  store i32 857760878, i32* %j5, align 4
  %j1010 = bitcast i32* %j10 to i8*
  call void @llvm.var.annotation(i8* nonnull %j1010, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 26, i8* null)
  store i32 2036477234, i32* %j10, align 4
  %j1511 = bitcast i32* %j15 to i8*
  call void @llvm.var.annotation(i8* nonnull %j1511, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 27, i8* null)
  store i32 1797285236, i32* %j15, align 4
  %x112 = bitcast i32* %x1 to i8*
  call void @llvm.var.annotation(i8* nonnull %x112, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 29, i8* null)
  %call = call fastcc i32 @load32_le(i8* %k.unwrapped)
  store i32 %call, i32* %x1, align 4
  %x213 = bitcast i32* %x2 to i8*
  call void @llvm.var.annotation(i8* nonnull %x213, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 30, i8* null)
  %add.ptr = getelementptr inbounds i8, i8* %k.unwrapped, i64 4
  %call14 = call fastcc i32 @load32_le(i8* nonnull %add.ptr)
  store i32 %call14, i32* %x2, align 4
  %x315 = bitcast i32* %x3 to i8*
  call void @llvm.var.annotation(i8* nonnull %x315, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 31, i8* null)
  %add.ptr16 = getelementptr inbounds i8, i8* %k.unwrapped, i64 8
  %call17 = call fastcc i32 @load32_le(i8* nonnull %add.ptr16)
  store i32 %call17, i32* %x3, align 4
  %x418 = bitcast i32* %x4 to i8*
  call void @llvm.var.annotation(i8* nonnull %x418, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 32, i8* null)
  %add.ptr19 = getelementptr inbounds i8, i8* %k.unwrapped, i64 12
  %call20 = call fastcc i32 @load32_le(i8* nonnull %add.ptr19)
  store i32 %call20, i32* %x4, align 4
  %x1121 = bitcast i32* %x11 to i8*
  call void @llvm.var.annotation(i8* nonnull %x1121, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 34, i8* null)
  %add.ptr22 = getelementptr inbounds i8, i8* %k.unwrapped, i64 16
  %call23 = call fastcc i32 @load32_le(i8* nonnull %add.ptr22)
  store i32 %call23, i32* %x11, align 4
  %x1224 = bitcast i32* %x12 to i8*
  call void @llvm.var.annotation(i8* nonnull %x1224, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 35, i8* null)
  %add.ptr25 = getelementptr inbounds i8, i8* %k.unwrapped, i64 20
  %call26 = call fastcc i32 @load32_le(i8* nonnull %add.ptr25)
  store i32 %call26, i32* %x12, align 4
  %x1327 = bitcast i32* %x13 to i8*
  call void @llvm.var.annotation(i8* nonnull %x1327, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 36, i8* null)
  %add.ptr28 = getelementptr inbounds i8, i8* %k.unwrapped, i64 24
  %call29 = call fastcc i32 @load32_le(i8* nonnull %add.ptr28)
  store i32 %call29, i32* %x13, align 4
  %x1430 = bitcast i32* %x14 to i8*
  call void @llvm.var.annotation(i8* nonnull %x1430, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 37, i8* null)
  %add.ptr31 = getelementptr inbounds i8, i8* %k.unwrapped, i64 28
  %call32 = call fastcc i32 @load32_le(i8* nonnull %add.ptr31)
  store i32 %call32, i32* %x14, align 4
  %j133 = bitcast i32* %j1 to i8*
  call void @llvm.var.annotation(i8* nonnull %j133, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 39, i8* null)
  store i32 %call, i32* %j1, align 4
  %j234 = bitcast i32* %j2 to i8*
  call void @llvm.var.annotation(i8* nonnull %j234, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 40, i8* null)
  store i32 %call14, i32* %j2, align 4
  %j335 = bitcast i32* %j3 to i8*
  call void @llvm.var.annotation(i8* nonnull %j335, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 41, i8* null)
  store i32 %call17, i32* %j3, align 4
  %j436 = bitcast i32* %j4 to i8*
  call void @llvm.var.annotation(i8* nonnull %j436, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 42, i8* null)
  store i32 %call20, i32* %j4, align 4
  %j1137 = bitcast i32* %j11 to i8*
  call void @llvm.var.annotation(i8* nonnull %j1137, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 43, i8* null)
  store i32 %call23, i32* %j11, align 4
  %j1238 = bitcast i32* %j12 to i8*
  call void @llvm.var.annotation(i8* nonnull %j1238, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 44, i8* null)
  store i32 %call26, i32* %j12, align 4
  %j1339 = bitcast i32* %j13 to i8*
  call void @llvm.var.annotation(i8* nonnull %j1339, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 45, i8* null)
  store i32 %call29, i32* %j13, align 4
  %j1440 = bitcast i32* %j14 to i8*
  call void @llvm.var.annotation(i8* nonnull %j1440, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 46, i8* null)
  store i32 %call32, i32* %j14, align 4
  %x641 = bitcast i32* %x6 to i8*
  call void @llvm.var.annotation(i8* nonnull %x641, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 48, i8* null)
  %call42 = call fastcc i32 @load32_le(i8* %input.unwrapped)
  store i32 %call42, i32* %x6, align 4
  %x743 = bitcast i32* %x7 to i8*
  call void @llvm.var.annotation(i8* nonnull %x743, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 49, i8* null)
  %add.ptr44 = getelementptr inbounds i8, i8* %input.unwrapped, i64 4
  %call45 = call fastcc i32 @load32_le(i8* nonnull %add.ptr44)
  store i32 %call45, i32* %x7, align 4
  %x846 = bitcast i32* %x8 to i8*
  call void @llvm.var.annotation(i8* nonnull %x846, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 50, i8* null)
  %add.ptr47 = getelementptr inbounds i8, i8* %input.unwrapped, i64 8
  %call48 = call fastcc i32 @load32_le(i8* nonnull %add.ptr47)
  store i32 %call48, i32* %x8, align 4
  %x949 = bitcast i32* %x9 to i8*
  call void @llvm.var.annotation(i8* nonnull %x949, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 51, i8* null)
  %add.ptr50 = getelementptr inbounds i8, i8* %input.unwrapped, i64 12
  %call51 = call fastcc i32 @load32_le(i8* nonnull %add.ptr50)
  %j652 = bitcast i32* %j6 to i8*
  call void @llvm.var.annotation(i8* nonnull %j652, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 53, i8* null)
  store i32 %call42, i32* %j6, align 4
  %j753 = bitcast i32* %j7 to i8*
  call void @llvm.var.annotation(i8* nonnull %j753, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 54, i8* null)
  store i32 %call45, i32* %j7, align 4
  %j854 = bitcast i32* %j8 to i8*
  call void @llvm.var.annotation(i8* nonnull %j854, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 55, i8* null)
  store i32 %call48, i32* %j8, align 4
  %j955 = bitcast i32* %j9 to i8*
  call void @llvm.var.annotation(i8* nonnull %j955, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 56, i8* null)
  store i32 %call51, i32* %j9, align 4
  %x0.promoted = load i32, i32* %x0, align 4
  %x5.promoted = load i32, i32* %x5, align 4
  %x10.promoted = load i32, i32* %x10, align 4
  %x15.promoted = load i32, i32* %x15, align 4
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.0.rewritten34 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %xor113233 = phi i32 [ %x0.promoted, %entry ], [ %xor113, %for.body ]
  %xor140332 = phi i32 [ %call26, %entry ], [ %xor140, %for.body ]
  %xor122431 = phi i32 [ %call20, %entry ], [ %xor122, %for.body ]
  %xor131530 = phi i32 [ %call48, %entry ], [ %xor131, %for.body ]
  %xor125629 = phi i32 [ %x5.promoted, %entry ], [ %xor125, %for.body ]
  %xor104728 = phi i32 [ %call, %entry ], [ %xor104, %for.body ]
  %xor134827 = phi i32 [ %call51, %entry ], [ %xor134, %for.body ]
  %xor143926 = phi i32 [ %call29, %entry ], [ %xor143, %for.body ]
  %xor1371025 = phi i32 [ %x10.promoted, %entry ], [ %xor137, %for.body ]
  %xor1161124 = phi i32 [ %call42, %entry ], [ %xor116, %for.body ]
  %xor1461223 = phi i32 [ %call32, %entry ], [ %xor146, %for.body ]
  %xor1071322 = phi i32 [ %call14, %entry ], [ %xor107, %for.body ]
  %xor1491421 = phi i32 [ %x15.promoted, %entry ], [ %xor149, %for.body ]
  %xor1281520 = phi i32 [ %call23, %entry ], [ %xor128, %for.body ]
  %xor1101619 = phi i32 [ %call17, %entry ], [ %xor110, %for.body ]
  %xor1191718 = phi i32 [ %call45, %entry ], [ %xor119, %for.body ]
  %add = add i32 %xor140332, %xor113233
  %call56 = call fastcc i32 @rotl32(i32 noundef %add, i32 noundef 7)
  %xor = xor i32 %xor122431, %call56
  %add57 = add i32 %xor, %xor113233
  %call58 = call fastcc i32 @rotl32(i32 noundef %add57, i32 noundef 9)
  %xor59 = xor i32 %xor131530, %call58
  %add60 = add i32 %xor59, %xor
  %call61 = call fastcc i32 @rotl32(i32 noundef %add60, i32 noundef 13)
  %xor62 = xor i32 %call61, %xor140332
  %add63 = add i32 %xor62, %xor59
  %call64 = call fastcc i32 @rotl32(i32 noundef %add63, i32 noundef 18)
  %xor65 = xor i32 %call64, %xor113233
  %add66 = add i32 %xor104728, %xor125629
  %call67 = call fastcc i32 @rotl32(i32 noundef %add66, i32 noundef 7)
  %xor68 = xor i32 %xor134827, %call67
  %add69 = add i32 %xor68, %xor125629
  %call70 = call fastcc i32 @rotl32(i32 noundef %add69, i32 noundef 9)
  %xor71 = xor i32 %xor143926, %call70
  %add72 = add i32 %xor71, %xor68
  %call73 = call fastcc i32 @rotl32(i32 noundef %add72, i32 noundef 13)
  %xor74 = xor i32 %call73, %xor104728
  %add75 = add i32 %xor74, %xor71
  %call76 = call fastcc i32 @rotl32(i32 noundef %add75, i32 noundef 18)
  %xor77 = xor i32 %call76, %xor125629
  %add78 = add i32 %xor1161124, %xor1371025
  %call79 = call fastcc i32 @rotl32(i32 noundef %add78, i32 noundef 7)
  %xor80 = xor i32 %xor1461223, %call79
  %add81 = add i32 %xor80, %xor1371025
  %call82 = call fastcc i32 @rotl32(i32 noundef %add81, i32 noundef 9)
  %xor83 = xor i32 %xor1071322, %call82
  %add84 = add i32 %xor83, %xor80
  %call85 = call fastcc i32 @rotl32(i32 noundef %add84, i32 noundef 13)
  %xor86 = xor i32 %call85, %xor1161124
  %add87 = add i32 %xor86, %xor83
  %call88 = call fastcc i32 @rotl32(i32 noundef %add87, i32 noundef 18)
  %xor89 = xor i32 %call88, %xor1371025
  %add90 = add i32 %xor1281520, %xor1491421
  %call91 = call fastcc i32 @rotl32(i32 noundef %add90, i32 noundef 7)
  %xor92 = xor i32 %xor1101619, %call91
  %add93 = add i32 %xor92, %xor1491421
  %call94 = call fastcc i32 @rotl32(i32 noundef %add93, i32 noundef 9)
  %xor95 = xor i32 %xor1191718, %call94
  %add96 = add i32 %xor95, %xor92
  %call97 = call fastcc i32 @rotl32(i32 noundef %add96, i32 noundef 13)
  %xor98 = xor i32 %call97, %xor1281520
  %add99 = add i32 %xor98, %xor95
  %call100 = call fastcc i32 @rotl32(i32 noundef %add99, i32 noundef 18)
  %xor101 = xor i32 %call100, %xor1491421
  %add102 = add i32 %xor92, %xor65
  %call103 = call fastcc i32 @rotl32(i32 noundef %add102, i32 noundef 7)
  %xor104 = xor i32 %call103, %xor74
  %add105 = add i32 %xor104, %xor65
  %call106 = call fastcc i32 @rotl32(i32 noundef %add105, i32 noundef 9)
  %xor107 = xor i32 %call106, %xor83
  %add108 = add i32 %xor107, %xor104
  %call109 = call fastcc i32 @rotl32(i32 noundef %add108, i32 noundef 13)
  %xor110 = xor i32 %call109, %xor92
  %add111 = add i32 %xor110, %xor107
  %call112 = call fastcc i32 @rotl32(i32 noundef %add111, i32 noundef 18)
  %xor113 = xor i32 %call112, %xor65
  %add114 = add i32 %xor77, %xor
  %call115 = call fastcc i32 @rotl32(i32 noundef %add114, i32 noundef 7)
  %xor116 = xor i32 %call115, %xor86
  %add117 = add i32 %xor116, %xor77
  %call118 = call fastcc i32 @rotl32(i32 noundef %add117, i32 noundef 9)
  %xor119 = xor i32 %call118, %xor95
  %add120 = add i32 %xor119, %xor116
  %call121 = call fastcc i32 @rotl32(i32 noundef %add120, i32 noundef 13)
  %xor122 = xor i32 %call121, %xor
  %add123 = add i32 %xor122, %xor119
  %call124 = call fastcc i32 @rotl32(i32 noundef %add123, i32 noundef 18)
  %xor125 = xor i32 %call124, %xor77
  %add126 = add i32 %xor89, %xor68
  %call127 = call fastcc i32 @rotl32(i32 noundef %add126, i32 noundef 7)
  %xor128 = xor i32 %call127, %xor98
  %add129 = add i32 %xor128, %xor89
  %call130 = call fastcc i32 @rotl32(i32 noundef %add129, i32 noundef 9)
  %xor131 = xor i32 %call130, %xor59
  %add132 = add i32 %xor131, %xor128
  %call133 = call fastcc i32 @rotl32(i32 noundef %add132, i32 noundef 13)
  %xor134 = xor i32 %call133, %xor68
  %add135 = add i32 %xor134, %xor131
  %call136 = call fastcc i32 @rotl32(i32 noundef %add135, i32 noundef 18)
  %xor137 = xor i32 %call136, %xor89
  %add138 = add i32 %xor101, %xor80
  %call139 = call fastcc i32 @rotl32(i32 noundef %add138, i32 noundef 7)
  %xor140 = xor i32 %call139, %xor62
  %add141 = add i32 %xor140, %xor101
  %call142 = call fastcc i32 @rotl32(i32 noundef %add141, i32 noundef 9)
  %xor143 = xor i32 %call142, %xor71
  %add144 = add i32 %xor143, %xor140
  %call145 = call fastcc i32 @rotl32(i32 noundef %add144, i32 noundef 13)
  %xor146 = xor i32 %call145, %xor80
  %add147 = add i32 %xor146, %xor143
  %call148 = call fastcc i32 @rotl32(i32 noundef %add147, i32 noundef 18)
  %xor149 = xor i32 %call148, %xor101
  %inc = add nuw nsw i32 %i.0.rewritten34, 1
  %exitcond.not = icmp eq i32 %inc, 10
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !17

for.end:                                          ; preds = %for.body
  store i32 %xor113, i32* %x0, align 4
  store i32 %xor140, i32* %x12, align 4
  store i32 %xor122, i32* %x4, align 4
  store i32 %xor131, i32* %x8, align 4
  store i32 %xor125, i32* %x5, align 4
  store i32 %xor104, i32* %x1, align 4
  store i32 %xor134, i32* %x9, align 4
  store i32 %xor143, i32* %x13, align 4
  store i32 %xor137, i32* %x10, align 4
  store i32 %xor116, i32* %x6, align 4
  store i32 %xor146, i32* %x14, align 4
  store i32 %xor107, i32* %x2, align 4
  store i32 %xor149, i32* %x15, align 4
  store i32 %xor128, i32* %x11, align 4
  store i32 %xor110, i32* %x3, align 4
  store i32 %xor119, i32* %x7, align 4
  %3 = load i8*, i8** %output.addr, align 8
  %add150 = add i32 %xor113, 1634760805
  call fastcc void @store32_le(i8* %3, i32 %add150)
  %4 = load i8*, i8** %output.addr, align 8
  %add.ptr151 = getelementptr inbounds i8, i8* %4, i64 4
  %5 = load i32, i32* %x1, align 4
  %6 = load i32, i32* %j1, align 4
  %add152 = add i32 %6, %5
  call fastcc void @store32_le(i8* nonnull %add.ptr151, i32 %add152)
  %7 = load i8*, i8** %output.addr, align 8
  %add.ptr153 = getelementptr inbounds i8, i8* %7, i64 8
  %8 = load i32, i32* %x2, align 4
  %9 = load i32, i32* %j2, align 4
  %add154 = add i32 %9, %8
  call fastcc void @store32_le(i8* nonnull %add.ptr153, i32 %add154)
  %10 = load i8*, i8** %output.addr, align 8
  %add.ptr155 = getelementptr inbounds i8, i8* %10, i64 12
  %11 = load i32, i32* %x3, align 4
  %12 = load i32, i32* %j3, align 4
  %add156 = add i32 %12, %11
  call fastcc void @store32_le(i8* nonnull %add.ptr155, i32 %add156)
  %13 = load i8*, i8** %output.addr, align 8
  %add.ptr157 = getelementptr inbounds i8, i8* %13, i64 16
  %14 = load i32, i32* %x4, align 4
  %15 = load i32, i32* %j4, align 4
  %add158 = add i32 %15, %14
  call fastcc void @store32_le(i8* nonnull %add.ptr157, i32 %add158)
  %16 = load i8*, i8** %output.addr, align 8
  %add.ptr159 = getelementptr inbounds i8, i8* %16, i64 20
  %17 = load i32, i32* %x5, align 4
  %18 = load i32, i32* %j5, align 4
  %add160 = add i32 %18, %17
  call fastcc void @store32_le(i8* nonnull %add.ptr159, i32 %add160)
  %19 = load i8*, i8** %output.addr, align 8
  %add.ptr161 = getelementptr inbounds i8, i8* %19, i64 24
  %20 = load i32, i32* %x6, align 4
  %21 = load i32, i32* %j6, align 4
  %add162 = add i32 %21, %20
  call fastcc void @store32_le(i8* nonnull %add.ptr161, i32 %add162)
  %22 = load i8*, i8** %output.addr, align 8
  %add.ptr163 = getelementptr inbounds i8, i8* %22, i64 28
  %23 = load i32, i32* %x7, align 4
  %24 = load i32, i32* %j7, align 4
  %add164 = add i32 %24, %23
  call fastcc void @store32_le(i8* nonnull %add.ptr163, i32 %add164)
  %25 = load i8*, i8** %output.addr, align 8
  %add.ptr165 = getelementptr inbounds i8, i8* %25, i64 32
  %26 = load i32, i32* %x8, align 4
  %27 = load i32, i32* %j8, align 4
  %add166 = add i32 %27, %26
  call fastcc void @store32_le(i8* nonnull %add.ptr165, i32 %add166)
  %28 = load i8*, i8** %output.addr, align 8
  %add.ptr167 = getelementptr inbounds i8, i8* %28, i64 36
  %29 = load i32, i32* %x9, align 4
  %30 = load i32, i32* %j9, align 4
  %add168 = add i32 %30, %29
  call fastcc void @store32_le(i8* nonnull %add.ptr167, i32 %add168)
  %31 = load i8*, i8** %output.addr, align 8
  %add.ptr169 = getelementptr inbounds i8, i8* %31, i64 40
  %32 = load i32, i32* %x10, align 4
  %33 = load i32, i32* %j10, align 4
  %add170 = add i32 %33, %32
  call fastcc void @store32_le(i8* nonnull %add.ptr169, i32 %add170)
  %34 = load i8*, i8** %output.addr, align 8
  %add.ptr171 = getelementptr inbounds i8, i8* %34, i64 44
  %35 = load i32, i32* %x11, align 4
  %36 = load i32, i32* %j11, align 4
  %add172 = add i32 %36, %35
  call fastcc void @store32_le(i8* nonnull %add.ptr171, i32 %add172)
  %37 = load i8*, i8** %output.addr, align 8
  %add.ptr173 = getelementptr inbounds i8, i8* %37, i64 48
  %38 = load i32, i32* %x12, align 4
  %39 = load i32, i32* %j12, align 4
  %add174 = add i32 %39, %38
  call fastcc void @store32_le(i8* nonnull %add.ptr173, i32 %add174)
  %40 = load i8*, i8** %output.addr, align 8
  %add.ptr175 = getelementptr inbounds i8, i8* %40, i64 52
  %41 = load i32, i32* %x13, align 4
  %42 = load i32, i32* %j13, align 4
  %add176 = add i32 %42, %41
  call fastcc void @store32_le(i8* nonnull %add.ptr175, i32 %add176)
  %43 = load i8*, i8** %output.addr, align 8
  %add.ptr177 = getelementptr inbounds i8, i8* %43, i64 56
  %44 = load i32, i32* %x14, align 4
  %45 = load i32, i32* %j14, align 4
  %add178 = add i32 %45, %44
  call fastcc void @store32_le(i8* nonnull %add.ptr177, i32 %add178)
  %46 = load i8*, i8** %output.addr, align 8
  %add.ptr179 = getelementptr inbounds i8, i8* %46, i64 60
  %47 = load i32, i32* %x15, align 4
  %48 = load i32, i32* %j15, align 4
  %add180 = add i32 %48, %47
  call fastcc void @store32_le(i8* nonnull %add.ptr179, i32 %add180)
  ret void
}

declare void @sodium_memzero(i8* noundef, i64 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly sspstrong uwtable willreturn
define internal fastcc i32 @load32_le(i8* %src.0.0.val) unnamed_addr #7 {
entry:
  %0 = load i8, i8* %src.0.0.val, align 1
  %conv = zext i8 %0 to i32
  %arrayidx1 = getelementptr inbounds i8, i8* %src.0.0.val, i64 1
  %1 = load i8, i8* %arrayidx1, align 1
  %conv2 = zext i8 %1 to i32
  %shl = shl nuw nsw i32 %conv2, 8
  %or = or i32 %shl, %conv
  %arrayidx3 = getelementptr inbounds i8, i8* %src.0.0.val, i64 2
  %2 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %2 to i32
  %shl5 = shl nuw nsw i32 %conv4, 16
  %or6 = or i32 %or, %shl5
  %arrayidx7 = getelementptr inbounds i8, i8* %src.0.0.val, i64 3
  %3 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %3 to i32
  %shl9 = shl nuw i32 %conv8, 24
  %or10 = or i32 %or6, %shl9
  ret i32 %or10
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone sspstrong uwtable willreturn
define internal fastcc i32 @rotl32(i32 noundef %x, i32 noundef %b) unnamed_addr #8 {
entry:
  %shl = shl i32 %x, %b
  %sub = sub nsw i32 32, %b
  %shr = lshr i32 %x, %sub
  %or = or i32 %shr, %shl
  ret i32 %or
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define internal fastcc void @store32_le(i8* %dst.0.0.val, i32 noundef %w) unnamed_addr #9 {
entry:
  %conv = trunc i32 %w to i8
  store i8 %conv, i8* %dst.0.0.val, align 1
  %shr = lshr i32 %w, 8
  %conv1 = trunc i32 %shr to i8
  %arrayidx2 = getelementptr inbounds i8, i8* %dst.0.0.val, i64 1
  store i8 %conv1, i8* %arrayidx2, align 1
  %shr3 = lshr i32 %w, 16
  %conv4 = trunc i32 %shr3 to i8
  %arrayidx5 = getelementptr inbounds i8, i8* %dst.0.0.val, i64 2
  store i8 %conv4, i8* %arrayidx5, align 1
  %shr6 = lshr i32 %w, 24
  %conv7 = trunc i32 %shr6 to i8
  %arrayidx8 = getelementptr inbounds i8, i8* %dst.0.0.val, i64 3
  store i8 %conv7, i8* %arrayidx8, align 1
  ret void
}

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
define dso_local void @_poly1305_blocks(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %m) #5 {
entry:
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i64 0, i32 1
  %m_buf = alloca i8*, align 8
  %hibit = alloca i64, align 8
  %r0 = alloca i64, align 8
  %r1 = alloca i64, align 8
  %r2 = alloca i64, align 8
  %h0 = alloca i64, align 8
  %h1 = alloca i64, align 8
  %h2 = alloca i64, align 8
  %s1 = alloca i64, align 8
  %s2 = alloca i64, align 8
  %t0 = alloca i64, align 8
  %t1 = alloca i64, align 8
  %d0 = alloca i128, align 16
  %d1 = alloca i128, align 16
  %d2 = alloca i128, align 16
  %c = alloca i64, align 8
  %m_buf1 = bitcast i8** %m_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %m_buf1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 12, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i64 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %m_buf, align 8
  %hibit2 = bitcast i64* %hibit to i8*
  call void @llvm.var.annotation(i8* nonnull %hibit2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 18, i8* null)
  %final = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 5
  %1 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %final, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 18, i8* null)
  %2 = load i8, i8* %1, align 8
  %cmp.not = icmp eq i8 %2, 0
  %cond = select i1 %cmp.not, i64 1099511627776, i64 0
  store i64 %cond, i64* %hibit, align 8
  %r04 = bitcast i64* %r0 to i8*
  call void @llvm.var.annotation(i8* nonnull %r04, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 20, i8* null)
  %3 = bitcast %struct.poly1305_state_internal_t* %state to i8*
  %4 = call i8* @llvm.ptr.annotation.p0i8(i8* %3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 13, i8* null)
  %arrayidx = bitcast i8* %4 to i64*
  %5 = load i64, i64* %arrayidx, align 8
  store i64 %5, i64* %r0, align 8
  %r15 = bitcast i64* %r1 to i8*
  call void @llvm.var.annotation(i8* nonnull %r15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 21, i8* null)
  %6 = call i8* @llvm.ptr.annotation.p0i8(i8* %3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 13, i8* null)
  %arrayidx7 = getelementptr inbounds i8, i8* %6, i64 8
  %7 = bitcast i8* %arrayidx7 to i64*
  %8 = load i64, i64* %7, align 8
  store i64 %8, i64* %r1, align 8
  %r28 = bitcast i64* %r2 to i8*
  call void @llvm.var.annotation(i8* nonnull %r28, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 22, i8* null)
  %9 = call i8* @llvm.ptr.annotation.p0i8(i8* %3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 13, i8* null)
  %arrayidx10 = getelementptr inbounds i8, i8* %9, i64 16
  %10 = bitcast i8* %arrayidx10 to i64*
  %11 = load i64, i64* %10, align 8
  store i64 %11, i64* %r2, align 8
  %h011 = bitcast i64* %h0 to i8*
  call void @llvm.var.annotation(i8* nonnull %h011, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 24, i8* null)
  %h = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 1
  %12 = bitcast [3 x i64]* %h to i8*
  %13 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 14, i8* null)
  %arrayidx12 = bitcast i8* %13 to i64*
  %14 = load i64, i64* %arrayidx12, align 8
  store i64 %14, i64* %h0, align 8
  %h113 = bitcast i64* %h1 to i8*
  call void @llvm.var.annotation(i8* nonnull %h113, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 25, i8* null)
  %15 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 14, i8* null)
  %arrayidx15 = getelementptr inbounds i8, i8* %15, i64 8
  %16 = bitcast i8* %arrayidx15 to i64*
  %17 = load i64, i64* %16, align 8
  store i64 %17, i64* %h1, align 8
  %h216 = bitcast i64* %h2 to i8*
  call void @llvm.var.annotation(i8* nonnull %h216, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 26, i8* null)
  %18 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 14, i8* null)
  %arrayidx18 = getelementptr inbounds i8, i8* %18, i64 16
  %19 = bitcast i8* %arrayidx18 to i64*
  %20 = load i64, i64* %19, align 8
  store i64 %20, i64* %h2, align 8
  %s119 = bitcast i64* %s1 to i8*
  call void @llvm.var.annotation(i8* nonnull %s119, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 28, i8* null)
  %mul = mul i64 %8, 20
  store i64 %mul, i64* %s1, align 8
  %s220 = bitcast i64* %s2 to i8*
  call void @llvm.var.annotation(i8* nonnull %s220, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 29, i8* null)
  %mul21 = mul i64 %11, 20
  store i64 %mul21, i64* %s2, align 8
  %21 = load i64, i64* %m.field0.length.ptr, align 8
  %cmp222.not = icmp ult i64 %21, 16
  br i1 %cmp222.not, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %div = lshr i64 %21, 4
  %t024 = bitcast i64* %t0 to i8*
  %t126 = bitcast i64* %t1 to i8*
  %d037 = bitcast i128* %d0 to i8*
  %conv39 = zext i64 %5 to i128
  %conv42 = zext i64 %mul21 to i128
  %conv46 = zext i64 %mul to i128
  %d149 = bitcast i128* %d1 to i8*
  %conv51 = zext i64 %8 to i128
  %d261 = bitcast i128* %d2 to i8*
  %conv63 = zext i64 %11 to i128
  %c73 = bitcast i64* %c to i8*
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %22 = phi i64 [ %20, %for.body.lr.ph ], [ %and89, %for.body ]
  %23 = phi i64 [ %17, %for.body.lr.ph ], [ %add94, %for.body ]
  %24 = phi i64 [ %14, %for.body.lr.ph ], [ %and93, %for.body ]
  %bindex.0.rewritten3 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  call void @llvm.var.annotation(i8* nonnull %t024, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 33, i8* null)
  %mul25 = shl i64 %bindex.0.rewritten3, 4
  %add.ptr = getelementptr inbounds i8, i8* %0, i64 %mul25
  %call = call fastcc i64 @load64_le(i8* %add.ptr)
  store i64 %call, i64* %t0, align 8
  call void @llvm.var.annotation(i8* nonnull %t126, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 34, i8* null)
  %add.ptr29 = getelementptr inbounds i8, i8* %add.ptr, i64 8
  %call30 = call fastcc i64 @load64_le(i8* nonnull %add.ptr29)
  store i64 %call30, i64* %t1, align 8
  %and = and i64 %call, 17592186044415
  %add = add i64 %24, %and
  %or = call i64 @llvm.fshl.i64(i64 %call30, i64 %call, i64 20)
  %and31 = and i64 %or, 17592186044415
  %add32 = add i64 %23, %and31
  %shr33 = lshr i64 %call30, 24
  %or35 = or i64 %shr33, %cond
  %add36 = add i64 %22, %or35
  call void @llvm.var.annotation(i8* nonnull %d037, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 43, i8* null)
  %conv38 = zext i64 %add to i128
  %mul40 = mul nuw i128 %conv38, %conv39
  %conv41 = zext i64 %add32 to i128
  %mul43 = mul nuw i128 %conv41, %conv42
  %add44 = add i128 %mul43, %mul40
  %conv45 = zext i64 %add36 to i128
  %mul47 = mul nuw i128 %conv45, %conv46
  %add48 = add i128 %add44, %mul47
  store i128 %add48, i128* %d0, align 16
  call void @llvm.var.annotation(i8* nonnull %d149, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 47, i8* null)
  %mul52 = mul nuw i128 %conv38, %conv51
  %mul55 = mul nuw i128 %conv41, %conv39
  %add56 = add i128 %mul55, %mul52
  %mul59 = mul nuw i128 %conv45, %conv42
  %add60 = add i128 %add56, %mul59
  call void @llvm.var.annotation(i8* nonnull %d261, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 51, i8* null)
  %mul64 = mul nuw i128 %conv38, %conv63
  %mul67 = mul nuw i128 %conv41, %conv51
  %add68 = add i128 %mul67, %mul64
  %mul71 = mul nuw i128 %conv45, %conv39
  %add72 = add i128 %add68, %mul71
  call void @llvm.var.annotation(i8* nonnull %c73, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 56, i8* null)
  %shr74 = lshr i128 %add48, 44
  %conv76 = trunc i128 %add48 to i64
  %and77 = and i64 %conv76, 17592186044415
  %conv78 = and i128 %shr74, 18446744073709551615
  %add79 = add i128 %conv78, %add60
  store i128 %add79, i128* %d1, align 16
  %shr80 = lshr i128 %add79, 44
  %conv82 = trunc i128 %add79 to i64
  %and83 = and i64 %conv82, 17592186044415
  %conv84 = and i128 %shr80, 18446744073709551615
  %add85 = add i128 %conv84, %add72
  store i128 %add85, i128* %d2, align 16
  %shr86 = lshr i128 %add85, 42
  %conv87 = trunc i128 %shr86 to i64
  %conv88 = trunc i128 %add85 to i64
  %and89 = and i64 %conv88, 4398046511103
  store i64 %and89, i64* %h2, align 8
  %mul90 = mul i64 %conv87, 5
  %add91 = add i64 %mul90, %and77
  %shr92 = lshr i64 %add91, 44
  store i64 %shr92, i64* %c, align 8
  %and93 = and i64 %add91, 17592186044415
  store i64 %and93, i64* %h0, align 8
  %add94 = add nuw nsw i64 %shr92, %and83
  store i64 %add94, i64* %h1, align 8
  %inc = add nuw nsw i64 %bindex.0.rewritten3, 1
  %exitcond.not = icmp eq i64 %inc, %div
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !18

for.end:                                          ; preds = %for.body, %entry
  %25 = phi i64 [ %14, %entry ], [ %and93, %for.body ]
  %26 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 14, i8* null)
  %arrayidx96 = bitcast i8* %26 to i64*
  store i64 %25, i64* %arrayidx96, align 8
  %27 = load i64, i64* %h1, align 8
  %28 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 14, i8* null)
  %arrayidx98 = getelementptr inbounds i8, i8* %28, i64 8
  %29 = bitcast i8* %arrayidx98 to i64*
  store i64 %27, i64* %29, align 8
  %30 = load i64, i64* %h2, align 8
  %31 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 14, i8* null)
  %arrayidx100 = getelementptr inbounds i8, i8* %31, i64 16
  %32 = bitcast i8* %arrayidx100 to i64*
  store i64 %30, i64* %32, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @_poly1305_update(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %m) #0 {
entry:
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i64 0, i32 1
  %m_buf = alloca i8*, align 8
  %w_state_buffer = alloca %struct.uint8ptr_wrapped_ty, align 8
  %w_view_m = alloca %struct.uint8ptr_wrapped_ty, align 8
  %m_buf1 = bitcast i8** %m_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %m_buf1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 106, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i64 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %m_buf, align 8
  %leftover = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 3
  %1 = load i64, i64* %leftover, align 8
  %cmp.not = icmp eq i64 %1, 0
  br i1 %cmp.not, label %if.end28, label %if.then

if.then:                                          ; preds = %entry
  %sub = sub i64 16, %1
  %2 = load i64, i64* %m.field0.length.ptr, align 8
  %cmp3 = icmp ugt i64 %sub, %2
  %spec.select = select i1 %cmp3, i64 %2, i64 %sub
  %cmp616.not = icmp eq i64 %spec.select, 0
  br i1 %cmp616.not, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %if.then
  %3 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 4, i64 0
  br label %for.body

for.body:                                         ; preds = %if.then13, %for.body.lr.ph
  %4 = phi i64 [ %1, %for.body.lr.ph ], [ %.pre21, %if.then13 ]
  %i.0.rewritten17 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %if.then13 ]
  %add = add i64 %4, %i.0.rewritten17
  %cmp8 = icmp ult i64 %add, 16
  br i1 %cmp8, label %if.then9, label %if.else

if.then9:                                         ; preds = %for.body
  %5 = load i64, i64* %m.field0.length.ptr, align 8
  %cmp12 = icmp ult i64 %i.0.rewritten17, %5
  br i1 %cmp12, label %if.then13, label %if.else14

if.else:                                          ; preds = %for.body
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4.9, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 123, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #15
  unreachable

if.then13:                                        ; preds = %if.then9
  %6 = load i8*, i8** %m_buf, align 8
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %i.0.rewritten17
  %7 = load i8, i8* %arrayidx, align 1
  %8 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 17, i8* null)
  %arrayidx16 = getelementptr inbounds i8, i8* %8, i64 %add
  store i8 %7, i8* %arrayidx16, align 1
  %inc = add nuw i64 %i.0.rewritten17, 1
  %exitcond.not = icmp eq i64 %inc, %spec.select
  %.pre21 = load i64, i64* %leftover, align 8
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !19

if.else14:                                        ; preds = %if.then9
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6.10, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 124, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #15
  unreachable

for.end:                                          ; preds = %if.then13, %if.then
  %9 = phi i64 [ %1, %if.then ], [ %.pre21, %if.then13 ]
  %add19 = add i64 %9, %spec.select
  store i64 %add19, i64* %leftover, align 8
  %cmp21 = icmp ult i64 %add19, 16
  br i1 %cmp21, label %if.end87, label %if.end23

if.end23:                                         ; preds = %for.end
  %len24 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i64 0, i32 1
  %call = call noalias dereferenceable_or_null(16) i8* @malloc(i64 noundef 16) #14
  %buf26 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i64 0, i32 0
  store i64 16, i64* %len24, align 8
  store i8* %call, i8** %buf26, align 8
  call void @_poly1305_blocks(%struct.poly1305_state_internal_t* noundef nonnull %state, %struct.uint8ptr_wrapped_ty* noundef nonnull %w_state_buffer)
  store i64 0, i64* %leftover, align 8
  br label %if.end28

if.end28:                                         ; preds = %if.end23, %entry
  %mindex.0.rewritten = phi i64 [ %spec.select, %if.end23 ], [ 0, %entry ]
  %10 = load i64, i64* %m.field0.length.ptr, align 8
  %sub30 = sub i64 %10, %mindex.0.rewritten
  %cmp31 = icmp ugt i64 %sub30, 15
  br i1 %cmp31, label %if.then32, label %if.end54

if.then32:                                        ; preds = %if.end28
  %and = and i64 %sub30, -16
  %add36 = add i64 %and, %mindex.0.rewritten
  %cmp37 = icmp ult i64 %mindex.0.rewritten, %add36
  br i1 %cmp37, label %if.then38, label %if.else39

if.then38:                                        ; preds = %if.then32
  %cmp43.not = icmp ugt i64 %add36, %10
  br i1 %cmp43.not, label %if.else45, label %if.then44

if.else39:                                        ; preds = %if.then32
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.7, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 154, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #15
  unreachable

if.then44:                                        ; preds = %if.then38
  %len47 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_view_m, i64 0, i32 1
  %call50 = call noalias i8* @malloc(i64 noundef %and) #14
  %buf51 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_view_m, i64 0, i32 0
  store i64 %and, i64* %len47, align 8
  store i8* %call50, i8** %buf51, align 8
  %11 = load i8*, i8** %m_buf, align 8
  %add.ptr = getelementptr inbounds i8, i8* %11, i64 %mindex.0.rewritten
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call50, i8* align 1 %add.ptr, i64 %and, i1 false)
  call void @_poly1305_blocks(%struct.poly1305_state_internal_t* noundef nonnull %state, %struct.uint8ptr_wrapped_ty* noundef nonnull %w_view_m)
  %.pre22 = load i64, i64* %m.field0.length.ptr, align 8
  br label %if.end54

if.else45:                                        ; preds = %if.then38
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.8, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 155, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #15
  unreachable

if.end54:                                         ; preds = %if.then44, %if.end28
  %12 = phi i64 [ %.pre22, %if.then44 ], [ %10, %if.end28 ]
  %mindex.1.rewritten = phi i64 [ %add36, %if.then44 ], [ %mindex.0.rewritten, %if.end28 ]
  %cmp56 = icmp ugt i64 %12, %mindex.1.rewritten
  br i1 %cmp56, label %if.then57, label %if.end87

if.then57:                                        ; preds = %if.end54
  %sub59 = sub i64 %12, %mindex.1.rewritten
  %cmp6218.not = icmp eq i64 %sub59, 0
  br i1 %cmp6218.not, label %for.end84, label %for.body63.lr.ph

for.body63.lr.ph:                                 ; preds = %if.then57
  %13 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 4, i64 0
  br label %for.body63

for.body63:                                       ; preds = %for.body63.lr.ph, %if.then74
  %i60.0.rewritten19 = phi i64 [ 0, %for.body63.lr.ph ], [ %inc83, %if.then74 ]
  %14 = load i64, i64* %leftover, align 8
  %add66 = add i64 %14, %i60.0.rewritten19
  %cmp67 = icmp ult i64 %add66, 16
  br i1 %cmp67, label %if.then68, label %if.else69

if.then68:                                        ; preds = %for.body63
  %add71 = add nuw i64 %i60.0.rewritten19, %mindex.1.rewritten
  %15 = load i64, i64* %m.field0.length.ptr, align 8
  %cmp73 = icmp ult i64 %add71, %15
  br i1 %cmp73, label %if.then74, label %if.else75

if.else69:                                        ; preds = %for.body63
  call void @__assert_fail(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.9, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 178, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #15
  unreachable

if.then74:                                        ; preds = %if.then68
  %16 = load i8*, i8** %m_buf, align 8
  %arrayidx78 = getelementptr inbounds i8, i8* %16, i64 %add71
  %17 = load i8, i8* %arrayidx78, align 1
  %18 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 17, i8* null)
  %arrayidx81 = getelementptr inbounds i8, i8* %18, i64 %add66
  store i8 %17, i8* %arrayidx81, align 1
  %inc83 = add nuw i64 %i60.0.rewritten19, 1
  %exitcond20.not = icmp eq i64 %inc83, %sub59
  br i1 %exitcond20.not, label %for.end84, label %for.body63, !llvm.loop !20

if.else75:                                        ; preds = %if.then68
  call void @__assert_fail(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 179, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #15
  unreachable

for.end84:                                        ; preds = %if.then74, %if.then57
  %19 = load i64, i64* %leftover, align 8
  %add86 = add i64 %19, %sub59
  store i64 %add86, i64* %leftover, align 8
  br label %if.end87

if.end87:                                         ; preds = %for.end, %for.end84, %if.end54
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @_crypto_onetimeauth_poly1305(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %out, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %m, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %key) #0 {
entry:
  %arg.wrapped1 = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %out, i64 0, i32 0
  %out.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %key, i64 0, i32 0
  %key.unwrapped = load i8*, i8** %1, align 8
  %out.addr = alloca i8*, align 8
  %key.addr = alloca i8*, align 8
  %state = alloca %struct.poly1305_state_internal_t, align 8
  store i8* %out.unwrapped, i8** %out.addr, align 8
  %out.addr1 = bitcast i8** %out.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %out.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 288, i8* null)
  store i8* %key.unwrapped, i8** %key.addr, align 8
  %key.addr2 = bitcast i8** %key.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %key.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 290, i8* null)
  %2 = bitcast %struct.poly1305_state_internal_t* %state to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(96) %2, i8 0, i64 96, i1 false)
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %key.unwrapped, i8** %arg.unwrapped, align 8
  call void @_poly1305_init(%struct.poly1305_state_internal_t* nonnull %state, %struct.uint8ptr_wrapped_ty* nonnull %arg.wrapped)
  call void @_poly1305_update(%struct.poly1305_state_internal_t* noundef nonnull %state, %struct.uint8ptr_wrapped_ty* noundef %m)
  %3 = load i8*, i8** %out.addr, align 8
  %arg.unwrapped2 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped1, i64 0, i32 0
  %arg.wrapped1.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped1, i64 0, i32 1
  store i64 0, i64* %arg.wrapped1.field0.length.ptr, align 8
  store i8* %3, i8** %arg.unwrapped2, align 8
  call void @_poly1305_finish(%struct.poly1305_state_internal_t* nonnull %state, %struct.uint8ptr_wrapped_ty* nonnull %arg.wrapped1)
  ret i32 0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @_crypto_onetimeauth_poly1305_verify(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %h, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %input, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %k) #0 {
entry:
  %h.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %h, i64 0, i32 1
  %h.field0.length = load i64, i64* %h.field0.length.ptr, align 8
  %arraydecay.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %h.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay3.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %h, i64 0, i32 0
  %h.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i64 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  %correct = alloca [16 x i8], align 16
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 312, i8* null)
  %correct2 = getelementptr inbounds [16 x i8], [16 x i8]* %correct, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %correct2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 315, i8* null)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %correct2, i8 0, i64 16, i1 false)
  %arraydecay.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, i64 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, i64 0, i32 1
  store i64 16, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i8* %correct2, i8** %arraydecay.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %k.unwrapped, i8** %arg.unwrapped, align 8
  %call = call i32 @_crypto_onetimeauth_poly1305(%struct.uint8ptr_wrapped_ty* nonnull %arraydecay.wrapped, %struct.uint8ptr_wrapped_ty* %input, %struct.uint8ptr_wrapped_ty* nonnull %arg.wrapped)
  %h.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %h.unwrapped.wrapped, i64 0, i32 0
  %h.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %h.unwrapped.wrapped, i64 0, i32 1
  store i64 %h.field0.length, i64* %h.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %h.unwrapped, i8** %h.unwrapped.unwrapped, align 8
  %arraydecay3.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay3.wrapped, i64 0, i32 0
  %arraydecay3.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay3.wrapped, i64 0, i32 1
  store i64 16, i64* %arraydecay3.wrapped.field0.length.ptr, align 8
  store i8* %correct2, i8** %arraydecay3.unwrapped, align 8
  %call4 = call i1 @_crypto_verify_16(%struct.uint8ptr_wrapped_ty* nonnull %h.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay3.wrapped)
  ret i1 %call4
}

; Function Attrs: mustprogress nofree noinline nosync nounwind sspstrong uwtable willreturn
define dso_local void @_poly1305_init(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %key) local_unnamed_addr #10 {
entry:
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %key, i64 0, i32 0
  %key.unwrapped = load i8*, i8** %0, align 8
  %key.addr = alloca i8*, align 8
  %t0 = alloca i64, align 8
  %t1 = alloca i64, align 8
  store i8* %key.unwrapped, i8** %key.addr, align 8
  %key.addr1 = bitcast i8** %key.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %key.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 77, i8* null)
  %t02 = bitcast i64* %t0 to i8*
  call void @llvm.var.annotation(i8* nonnull %t02, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 81, i8* null)
  %call = call fastcc i64 @load64_le(i8* %key.unwrapped)
  store i64 %call, i64* %t0, align 8
  %t13 = bitcast i64* %t1 to i8*
  call void @llvm.var.annotation(i8* nonnull %t13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 82, i8* null)
  %add.ptr = getelementptr inbounds i8, i8* %key.unwrapped, i64 8
  %call4 = call fastcc i64 @load64_le(i8* nonnull %add.ptr)
  store i64 %call4, i64* %t1, align 8
  %and = and i64 %call, 17575274610687
  %1 = bitcast %struct.poly1305_state_internal_t* %state to i8*
  %2 = call i8* @llvm.ptr.annotation.p0i8(i8* %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 13, i8* null)
  %arrayidx = bitcast i8* %2 to i64*
  store i64 %and, i64* %arrayidx, align 8
  %3 = load i64, i64* %t0, align 8
  %4 = load i64, i64* %t1, align 8
  %or = call i64 @llvm.fshl.i64(i64 %4, i64 %3, i64 20)
  %and5 = and i64 %or, 17592181915647
  %5 = call i8* @llvm.ptr.annotation.p0i8(i8* %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 13, i8* null)
  %arrayidx7 = getelementptr inbounds i8, i8* %5, i64 8
  %6 = bitcast i8* %arrayidx7 to i64*
  store i64 %and5, i64* %6, align 8
  %shr8 = lshr i64 %4, 24
  %and9 = and i64 %shr8, 68719475727
  %7 = call i8* @llvm.ptr.annotation.p0i8(i8* %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 13, i8* null)
  %arrayidx11 = getelementptr inbounds i8, i8* %7, i64 16
  %8 = bitcast i8* %arrayidx11 to i64*
  store i64 %and9, i64* %8, align 8
  %h = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 1
  %9 = bitcast [3 x i64]* %h to i8*
  %10 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 14, i8* null)
  %arrayidx12 = bitcast i8* %10 to i64*
  store i64 0, i64* %arrayidx12, align 8
  %11 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 14, i8* null)
  %arrayidx14 = getelementptr inbounds i8, i8* %11, i64 8
  %12 = bitcast i8* %arrayidx14 to i64*
  store i64 0, i64* %12, align 8
  %13 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 14, i8* null)
  %arrayidx16 = getelementptr inbounds i8, i8* %13, i64 16
  %14 = bitcast i8* %arrayidx16 to i64*
  store i64 0, i64* %14, align 8
  %15 = load i8*, i8** %key.addr, align 8
  %add.ptr17 = getelementptr inbounds i8, i8* %15, i64 16
  %call18 = call fastcc i64 @load64_le(i8* nonnull %add.ptr17)
  %pad = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 2
  %16 = bitcast [2 x i64]* %pad to i8*
  %17 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 15, i8* null)
  %arrayidx19 = bitcast i8* %17 to i64*
  store i64 %call18, i64* %arrayidx19, align 8
  %18 = load i8*, i8** %key.addr, align 8
  %add.ptr20 = getelementptr inbounds i8, i8* %18, i64 24
  %call21 = call fastcc i64 @load64_le(i8* nonnull %add.ptr20)
  %19 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 15, i8* null)
  %arrayidx23 = getelementptr inbounds i8, i8* %19, i64 8
  %20 = bitcast i8* %arrayidx23 to i64*
  store i64 %call21, i64* %20, align 8
  %leftover = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 3
  store i64 0, i64* %leftover, align 8
  %final = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 5
  %21 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %final, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 18, i8* null)
  store i8 0, i8* %21, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @_poly1305_finish(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %mac) local_unnamed_addr #0 {
entry:
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac, i64 0, i32 0
  %mac.unwrapped = load i8*, i8** %0, align 8
  %mac.addr = alloca i8*, align 8
  %w_state_buffer = alloca %struct.uint8ptr_wrapped_ty, align 8
  %h0 = alloca i64, align 8
  %h1 = alloca i64, align 8
  %h2 = alloca i64, align 8
  %c = alloca i64, align 8
  %g0 = alloca i64, align 8
  %g1 = alloca i64, align 8
  %g2 = alloca i64, align 8
  %t0 = alloca i64, align 8
  %t1 = alloca i64, align 8
  store i8* %mac.unwrapped, i8** %mac.addr, align 8
  %mac.addr1 = bitcast i8** %mac.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %mac.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 188, i8* null)
  %leftover = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 3
  %1 = load i64, i64* %leftover, align 8
  %cmp.not = icmp eq i64 %1, 0
  br i1 %cmp.not, label %if.end9, label %if.then

if.then:                                          ; preds = %entry
  %cmp3 = icmp ult i64 %1, 16
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then
  %2 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 4, i64 0
  %3 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 17, i8* null)
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %1
  store i8 1, i8* %arrayidx, align 1
  %cmp55.not = icmp eq i64 %1, 15
  br i1 %cmp55.not, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %if.then4
  %i.0.rewritten4 = add nuw nsw i64 %1, 1
  br label %for.body

if.else:                                          ; preds = %if.then
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.11, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 198, i8* noundef getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__._poly1305_finish, i64 0, i64 0)) #15
  unreachable

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.0.rewritten6 = phi i64 [ %i.0.rewritten, %for.body ], [ %i.0.rewritten4, %for.body.preheader ]
  %4 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 17, i8* null)
  %arrayidx7 = getelementptr inbounds i8, i8* %4, i64 %i.0.rewritten6
  store i8 0, i8* %arrayidx7, align 1
  %i.0.rewritten = add i64 %i.0.rewritten6, 1
  %exitcond.not = icmp eq i64 %i.0.rewritten, 16
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !21

for.end:                                          ; preds = %for.body, %if.then4
  %final = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 5
  %5 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %final, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 18, i8* null)
  store i8 1, i8* %5, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i64 0, i32 1
  %call = call noalias dereferenceable_or_null(16) i8* @malloc(i64 noundef 16) #14
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i64 0, i32 0
  store i64 16, i64* %len, align 8
  store i8* %call, i8** %buf, align 8
  call void @_poly1305_blocks(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef nonnull %w_state_buffer)
  br label %if.end9

if.end9:                                          ; preds = %for.end, %entry
  %h010 = bitcast i64* %h0 to i8*
  call void @llvm.var.annotation(i8* nonnull %h010, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 222, i8* null)
  %h = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 1
  %6 = bitcast [3 x i64]* %h to i8*
  %7 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 14, i8* null)
  %arrayidx11 = bitcast i8* %7 to i64*
  %8 = load i64, i64* %arrayidx11, align 8
  %h112 = bitcast i64* %h1 to i8*
  call void @llvm.var.annotation(i8* nonnull %h112, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 223, i8* null)
  %9 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 14, i8* null)
  %arrayidx14 = getelementptr inbounds i8, i8* %9, i64 8
  %10 = bitcast i8* %arrayidx14 to i64*
  %11 = load i64, i64* %10, align 8
  %h215 = bitcast i64* %h2 to i8*
  call void @llvm.var.annotation(i8* nonnull %h215, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 224, i8* null)
  %12 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 14, i8* null)
  %arrayidx17 = getelementptr inbounds i8, i8* %12, i64 16
  %13 = bitcast i8* %arrayidx17 to i64*
  %14 = load i64, i64* %13, align 8
  %c18 = bitcast i64* %c to i8*
  call void @llvm.var.annotation(i8* nonnull %c18, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 226, i8* null)
  %shr = lshr i64 %11, 44
  %and = and i64 %11, 17592186044415
  %add19 = add i64 %14, %shr
  %shr20 = lshr i64 %add19, 42
  %and21 = and i64 %add19, 4398046511103
  %mul22 = mul nuw nsw i64 %shr20, 5
  %add23 = add i64 %mul22, %8
  %shr24 = lshr i64 %add23, 44
  %and25 = and i64 %add23, 17592186044415
  %add26 = add nuw nsw i64 %shr24, %and
  %shr27 = lshr i64 %add26, 44
  %and28 = and i64 %add26, 17592186044415
  %add29 = add nuw nsw i64 %shr27, %and21
  %shr30 = lshr i64 %add29, 42
  %and31 = and i64 %add29, 4398046511103
  %mul32 = mul nuw nsw i64 %shr30, 5
  %add33 = add nuw nsw i64 %mul32, %and25
  %shr34 = lshr i64 %add33, 44
  %and35 = and i64 %add33, 17592186044415
  %add36 = add nuw nsw i64 %shr34, %and28
  %g037 = bitcast i64* %g0 to i8*
  call void @llvm.var.annotation(i8* nonnull %g037, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 246, i8* null)
  %add38 = add nuw nsw i64 %and35, 5
  %shr39 = lshr i64 %add38, 44
  %and40 = and i64 %add38, 17592186044415
  %g141 = bitcast i64* %g1 to i8*
  call void @llvm.var.annotation(i8* nonnull %g141, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 249, i8* null)
  %add42 = add nuw nsw i64 %shr39, %add36
  %shr43 = lshr i64 %add42, 44
  %and44 = and i64 %add42, 17592186044415
  %g245 = bitcast i64* %g2 to i8*
  call void @llvm.var.annotation(i8* nonnull %g245, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 252, i8* null)
  %add46 = or i64 %add29, -4398046511104
  %sub = add nsw i64 %add46, %shr43
  %shr47.neg = ashr i64 %sub, 63
  %shr47 = lshr i64 %sub, 63
  %sub48 = add nsw i64 %shr47, -1
  %and49 = and i64 %sub48, %and40
  store i64 %and49, i64* %g0, align 8
  %and50 = and i64 %sub48, %and44
  store i64 %and50, i64* %g1, align 8
  %and51 = and i64 %sub48, %sub
  store i64 %and51, i64* %g2, align 8
  store i64 %shr47.neg, i64* %c, align 8
  %and52 = and i64 %shr47.neg, %and35
  %or = or i64 %and49, %and52
  store i64 %or, i64* %h0, align 8
  %and53 = and i64 %shr47.neg, %add36
  %or54 = or i64 %and50, %and53
  store i64 %or54, i64* %h1, align 8
  %and55 = and i64 %shr47.neg, %and31
  %or56 = or i64 %and51, %and55
  store i64 %or56, i64* %h2, align 8
  %t057 = bitcast i64* %t0 to i8*
  call void @llvm.var.annotation(i8* nonnull %t057, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 265, i8* null)
  %pad = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i64 0, i32 2
  %15 = bitcast [2 x i64]* %pad to i8*
  %16 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 15, i8* null)
  %arrayidx58 = bitcast i8* %16 to i64*
  %17 = load i64, i64* %arrayidx58, align 8
  store i64 %17, i64* %t0, align 8
  %t159 = bitcast i64* %t1 to i8*
  call void @llvm.var.annotation(i8* nonnull %t159, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i64 0, i64 0), i32 266, i8* null)
  %18 = call i8* @llvm.ptr.annotation.p0i8(i8* nonnull %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i64 0, i64 0), i32 15, i8* null)
  %arrayidx61 = getelementptr inbounds i8, i8* %18, i64 8
  %19 = bitcast i8* %arrayidx61 to i64*
  %20 = load i64, i64* %19, align 8
  store i64 %20, i64* %t1, align 8
  %and62 = and i64 %17, 17592186044415
  %add63 = add nuw nsw i64 %and62, %or
  %shr64 = lshr i64 %add63, 44
  %and65 = and i64 %add63, 17592186044415
  %or67 = call i64 @llvm.fshl.i64(i64 %20, i64 %17, i64 20)
  %and68 = and i64 %or67, 17592186044415
  %add69 = add nuw nsw i64 %shr64, %or54
  %add70 = add nuw nsw i64 %add69, %and68
  %shr71 = lshr i64 %add70, 44
  store i64 %shr71, i64* %c, align 8
  %shr73 = lshr i64 %20, 24
  %add75 = add nsw i64 %shr73, %or56
  %add76 = add nsw i64 %add75, %shr71
  %and77 = and i64 %add76, 4398046511103
  store i64 %and77, i64* %h2, align 8
  %shl78 = shl i64 %add70, 44
  %or79 = or i64 %shl78, %and65
  store i64 %or79, i64* %h0, align 8
  %and72 = lshr i64 %add70, 20
  %shr80 = and i64 %and72, 16777215
  %shl81 = shl i64 %add76, 24
  %or82 = or i64 %shl81, %shr80
  store i64 %or82, i64* %h1, align 8
  %21 = load i8*, i8** %mac.addr, align 8
  call fastcc void @store64_le(i8* %21, i64 %or79)
  %22 = load i8*, i8** %mac.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %22, i64 8
  %23 = load i64, i64* %h1, align 8
  call fastcc void @store64_le(i8* nonnull %add.ptr, i64 %23)
  %24 = bitcast %struct.poly1305_state_internal_t* %state to i8*
  call void @sodium_memzero(i8* noundef %24, i64 noundef 96) #14
  ret void
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i8* @llvm.ptr.annotation.p0i8(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #11

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define internal fastcc void @store64_le(i8* %dst.0.0.val, i64 noundef %w) unnamed_addr #9 {
entry:
  %conv = trunc i64 %w to i8
  store i8 %conv, i8* %dst.0.0.val, align 1
  %shr = lshr i64 %w, 8
  %conv1 = trunc i64 %shr to i8
  %arrayidx2 = getelementptr inbounds i8, i8* %dst.0.0.val, i64 1
  store i8 %conv1, i8* %arrayidx2, align 1
  %shr3 = lshr i64 %w, 16
  %conv4 = trunc i64 %shr3 to i8
  %arrayidx5 = getelementptr inbounds i8, i8* %dst.0.0.val, i64 2
  store i8 %conv4, i8* %arrayidx5, align 1
  %shr6 = lshr i64 %w, 24
  %conv7 = trunc i64 %shr6 to i8
  %arrayidx8 = getelementptr inbounds i8, i8* %dst.0.0.val, i64 3
  store i8 %conv7, i8* %arrayidx8, align 1
  %shr9 = lshr i64 %w, 32
  %conv10 = trunc i64 %shr9 to i8
  %arrayidx11 = getelementptr inbounds i8, i8* %dst.0.0.val, i64 4
  store i8 %conv10, i8* %arrayidx11, align 1
  %shr12 = lshr i64 %w, 40
  %conv13 = trunc i64 %shr12 to i8
  %arrayidx14 = getelementptr inbounds i8, i8* %dst.0.0.val, i64 5
  store i8 %conv13, i8* %arrayidx14, align 1
  %shr15 = lshr i64 %w, 48
  %conv16 = trunc i64 %shr15 to i8
  %arrayidx17 = getelementptr inbounds i8, i8* %dst.0.0.val, i64 6
  store i8 %conv16, i8* %arrayidx17, align 1
  %shr18 = lshr i64 %w, 56
  %conv19 = trunc i64 %shr18 to i8
  %arrayidx20 = getelementptr inbounds i8, i8* %dst.0.0.val, i64 7
  store i8 %conv19, i8* %arrayidx20, align 1
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly sspstrong uwtable willreturn
define internal fastcc i64 @load64_le(i8* %src.0.0.val) unnamed_addr #7 {
entry:
  %0 = load i8, i8* %src.0.0.val, align 1
  %conv = zext i8 %0 to i64
  %arrayidx1 = getelementptr inbounds i8, i8* %src.0.0.val, i64 1
  %1 = load i8, i8* %arrayidx1, align 1
  %conv2 = zext i8 %1 to i64
  %shl = shl nuw nsw i64 %conv2, 8
  %or = or i64 %shl, %conv
  %arrayidx3 = getelementptr inbounds i8, i8* %src.0.0.val, i64 2
  %2 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %2 to i64
  %shl5 = shl nuw nsw i64 %conv4, 16
  %or6 = or i64 %or, %shl5
  %arrayidx7 = getelementptr inbounds i8, i8* %src.0.0.val, i64 3
  %3 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %3 to i64
  %shl9 = shl nuw nsw i64 %conv8, 24
  %or10 = or i64 %or6, %shl9
  %arrayidx11 = getelementptr inbounds i8, i8* %src.0.0.val, i64 4
  %4 = load i8, i8* %arrayidx11, align 1
  %conv12 = zext i8 %4 to i64
  %shl13 = shl nuw nsw i64 %conv12, 32
  %or14 = or i64 %or10, %shl13
  %arrayidx15 = getelementptr inbounds i8, i8* %src.0.0.val, i64 5
  %5 = load i8, i8* %arrayidx15, align 1
  %conv16 = zext i8 %5 to i64
  %shl17 = shl nuw nsw i64 %conv16, 40
  %or18 = or i64 %or14, %shl17
  %arrayidx19 = getelementptr inbounds i8, i8* %src.0.0.val, i64 6
  %6 = load i8, i8* %arrayidx19, align 1
  %conv20 = zext i8 %6 to i64
  %shl21 = shl nuw nsw i64 %conv20, 48
  %or22 = or i64 %or18, %shl21
  %arrayidx23 = getelementptr inbounds i8, i8* %src.0.0.val, i64 7
  %7 = load i8, i8* %arrayidx23, align 1
  %conv24 = zext i8 %7 to i64
  %shl25 = shl nuw i64 %conv24, 56
  %or26 = or i64 %or22, %shl25
  ret i64 %or26
}

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
define dso_local zeroext i1 @_crypto_verify_16(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %x, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %y) local_unnamed_addr #5 {
entry:
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %x, i64 0, i32 0
  %x.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %y, i64 0, i32 0
  %y.unwrapped = load i8*, i8** %1, align 8
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %x.addr1 = bitcast i8** %x.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %x.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1.14, i64 0, i64 0), i32 12, i8* null)
  %y.addr2 = bitcast i8** %y.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %y.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1.14, i64 0, i64 0), i32 13, i8* null)
  %shadow.sroa.0 = alloca i8, align 8
  store i8 0, i8* %shadow.sroa.0, align 8
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %cond.fold17 = phi i1 [ true, %entry ], [ %in.12, %for.body ]
  %exitpred.frozen1.rewritten16 = phi i1 [ false, %entry ], [ %6, %for.body ]
  %out.frozen.014 = phi i1 [ false, %entry ], [ %or.frozen, %for.body ]
  %or.frozen = or i1 %out.frozen.014, %cond.fold17
  %2 = select i1 %cond.fold17, i8* %x.unwrapped, i8* null
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 %indvars.iv
  %ctsel19 = select i1 %cond.fold17, i8* %arrayidx, i8* %shadow.sroa.0
  %3 = load i8, i8* %ctsel19, align 1
  %4 = select i1 %cond.fold17, i8* %y.unwrapped, i8* null
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %indvars.iv
  %ctsel22 = select i1 %cond.fold17, i8* %arrayidx4, i8* %shadow.sroa.0
  %5 = load i8, i8* %ctsel22, align 1
  %cmp6 = icmp ne i8 %3, %5
  %6 = or i1 %exitpred.frozen1.rewritten16, %cmp6
  %7 = xor i1 %6, true
  %in.12 = and i1 %cond.fold17, %7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 16
  br i1 %exitcond.not, label %if.then, label %for.body, !llvm.loop !22

if.then:                                          ; preds = %for.body
  %in.10 = and i1 %or.frozen, %6
  %not.in.10 = xor i1 %in.10, true
  ret i1 %not.in.10
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @__crypto_stream_xsalsa20(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %c, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %n, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %k) #0 {
entry:
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %arraydecay.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay2.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i64 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  %subkey = alloca [32 x i8], align 16
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 98, i8* null)
  %2 = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %2, i8 0, i64 32, i1 false)
  %arraydecay.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, i64 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i8* %2, i8** %arraydecay.unwrapped, align 8
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %k.unwrapped, i8** %arg.unwrapped, align 8
  call void @__crypto_core_hsalsa20(%struct.uint8ptr_wrapped_ty* nonnull %arraydecay.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %n.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arg.wrapped)
  %add.ptr = getelementptr inbounds i8, i8* %n.unwrapped, i64 16
  %add.ptr.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i64 0, i32 0
  %add.ptr.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i64 0, i32 1
  store i64 %n.field0.length, i64* %add.ptr.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr, i8** %add.ptr.unwrapped, align 8
  %arraydecay2.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay2.wrapped, i64 0, i32 0
  %arraydecay2.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay2.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay2.wrapped.field0.length.ptr, align 8
  store i8* %2, i8** %arraydecay2.unwrapped, align 8
  %call = call i32 @_crypto_stream_salsa20(%struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* nonnull %add.ptr.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay2.wrapped)
  call void @sodium_memzero(i8* noundef nonnull %2, i64 noundef 32) #14
  ret i32 0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @__crypto_stream_xsalsa20_xor_ic(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %c, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %m, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %n, i64 noundef %ic, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %k) #0 {
entry:
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %add.ptr.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay2.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i64 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  %subkey = alloca [32 x i8], align 16
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 118, i8* null)
  %2 = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %2, i8 0, i64 32, i1 false)
  %arraydecay.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, i64 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i8* %2, i8** %arraydecay.unwrapped, align 8
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %k.unwrapped, i8** %arg.unwrapped, align 8
  call void @__crypto_core_hsalsa20(%struct.uint8ptr_wrapped_ty* nonnull %arraydecay.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %n.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arg.wrapped)
  %add.ptr = getelementptr inbounds i8, i8* %n.unwrapped, i64 16
  %add.ptr.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i64 0, i32 0
  %add.ptr.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i64 0, i32 1
  store i64 %n.field0.length, i64* %add.ptr.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr, i8** %add.ptr.unwrapped, align 8
  %arraydecay2.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay2.wrapped, i64 0, i32 0
  %arraydecay2.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay2.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay2.wrapped.field0.length.ptr, align 8
  store i8* %2, i8** %arraydecay2.unwrapped, align 8
  %call = call i32 @_crypto_stream_salsa20_xor_ic(%struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* %m, %struct.uint8ptr_wrapped_ty* nonnull %add.ptr.wrapped, i64 %ic, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay2.wrapped)
  call void @sodium_memzero(i8* noundef nonnull %2, i64 noundef 32) #14
  ret i32 0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @__crypto_stream_xsalsa20_xor(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %c, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %m, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %n, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %k, i1 %entry.cond) #0 {
entry:
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i64 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 138, i8* null)
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %k.unwrapped, i8** %arg.unwrapped, align 8
  %call = call i32 @__crypto_stream_xsalsa20_xor_ic(%struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* %m, %struct.uint8ptr_wrapped_ty* nonnull %n.unwrapped.wrapped, i64 0, %struct.uint8ptr_wrapped_ty* nonnull %arg.wrapped)
  ret i32 0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @__crypto_secretbox_xsalsa20poly1305(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %c, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %m, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %n, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %k) #0 {
entry:
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i64 0, i32 1
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i64 0, i32 1
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay21.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay22.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i64 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  %c_buf = alloca i8*, align 8
  %cview = alloca [16 x i8], align 16
  %w_mview = alloca %struct.uint8ptr_wrapped_ty, align 8
  %kview = alloca [32 x i8], align 16
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 148, i8* null)
  %c_buf2 = bitcast i8** %c_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %c_buf2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 150, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i64 0, i32 0
  %2 = load i8*, i8** %buf, align 8
  store i8* %2, i8** %c_buf, align 8
  %3 = load i64, i64* %m.field0.length.ptr, align 8
  %cmp = icmp ult i64 %3, 32
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %4 = load i64, i64* %c.field0.length.ptr, align 8
  %cmp5 = icmp eq i64 %4, %3
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.end
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %k.unwrapped, i8** %arg.unwrapped, align 8
  %call = call i32 @__crypto_stream_xsalsa20_xor(%struct.uint8ptr_wrapped_ty* nonnull %c, %struct.uint8ptr_wrapped_ty* nonnull %m, %struct.uint8ptr_wrapped_ty* nonnull %n.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arg.wrapped, i1 undef)
  %cview8 = getelementptr inbounds [16 x i8], [16 x i8]* %cview, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %cview8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 159, i8* null)
  %5 = load i8*, i8** %c_buf, align 8
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %cview8, i8* noundef nonnull align 1 dereferenceable(16) %add.ptr, i64 16, i1 false)
  %6 = load i64, i64* %c.field0.length.ptr, align 8
  %sub = add i64 %6, -32
  %len10 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_mview, i64 0, i32 1
  %call12 = call noalias i8* @malloc(i64 noundef %sub) #14
  %buf13 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_mview, i64 0, i32 0
  store i64 %sub, i64* %len10, align 8
  store i8* %call12, i8** %buf13, align 8
  %add.ptr15 = getelementptr inbounds i8, i8* %5, i64 32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call12, i8* nonnull align 1 %add.ptr15, i64 %sub, i1 false)
  %kview18 = getelementptr inbounds [32 x i8], [32 x i8]* %kview, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %kview18, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 167, i8* null)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %kview18, i8* noundef nonnull align 1 dereferenceable(32) %5, i64 32, i1 false)
  %arraydecay21.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay21.wrapped, i64 0, i32 0
  %arraydecay21.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay21.wrapped, i64 0, i32 1
  store i64 16, i64* %arraydecay21.wrapped.field0.length.ptr, align 8
  store i8* %cview8, i8** %arraydecay21.unwrapped, align 8
  %arraydecay22.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay22.wrapped, i64 0, i32 0
  %arraydecay22.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay22.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay22.wrapped.field0.length.ptr, align 8
  store i8* %kview18, i8** %arraydecay22.unwrapped, align 8
  %call23 = call i32 @_crypto_onetimeauth_poly1305(%struct.uint8ptr_wrapped_ty* nonnull %arraydecay21.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %w_mview, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay22.wrapped)
  %7 = load i8*, i8** %buf, align 8
  %add.ptr25 = getelementptr inbounds i8, i8* %7, i64 16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(16) %add.ptr25, i8* noundef nonnull align 16 dereferenceable(16) %cview8, i64 16, i1 false)
  br label %for.body

if.else:                                          ; preds = %if.end
  call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4.20, i64 0, i64 0), i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5.21, i64 0, i64 0), i32 noundef 156, i8* noundef getelementptr inbounds ([110 x i8], [110 x i8]* @__PRETTY_FUNCTION__.__crypto_secretbox_xsalsa20poly1305, i64 0, i64 0)) #15
  unreachable

for.body:                                         ; preds = %if.then6, %for.body
  %i.0.rewritten4 = phi i64 [ 0, %if.then6 ], [ %inc, %for.body ]
  %8 = load i8*, i8** %buf, align 8
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %i.0.rewritten4
  store i8 0, i8* %arrayidx, align 1
  %inc = add nuw nsw i64 %i.0.rewritten4, 1
  %exitcond.not = icmp eq i64 %inc, 16
  br i1 %exitcond.not, label %return, label %for.body, !llvm.loop !23

return:                                           ; preds = %for.body, %entry
  %9 = xor i1 %cmp, true
  ret i1 %9
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @__crypto_secretbox_xsalsa20poly1305_open(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %m, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %c, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %n, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %k) #0 {
entry:
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i64 0, i32 1
  %m.field0.length = load i64, i64* %m.field0.length.ptr, align 8
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i64 0, i32 1
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %arraydecay24.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay25.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %n.unwrapped.wrapped33 = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped35 = alloca %struct.uint8ptr_wrapped_ty, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i64 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  %c_buf = alloca i8*, align 8
  %w_subkey = alloca %struct.uint8ptr_wrapped_ty, align 8
  %subkey = alloca [32 x i8], align 16
  %tmp1 = alloca [16 x i8], align 16
  %w_cview = alloca %struct.uint8ptr_wrapped_ty, align 8
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 190, i8* null)
  %c_buf2 = bitcast i8** %c_buf to i8*
  call void @llvm.var.annotation(i8* nonnull %c_buf2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 192, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i64 0, i32 0
  %2 = load i8*, i8** %buf, align 8
  store i8* %2, i8** %c_buf, align 8
  %cmp = icmp ult i64 %m.field0.length, 32
  %shadow.sroa.0 = alloca i8, align 8
  store i8 0, i8* %shadow.sroa.0, align 8
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %3 = load i64, i64* %c.field0.length.ptr, align 8
  %cmp5 = icmp eq i64 %3, %m.field0.length
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.end
  %len8 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_subkey, i64 0, i32 1
  %call = call noalias dereferenceable_or_null(32) i8* @calloc(i64 noundef 32, i64 noundef 1) #14
  %buf10 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_subkey, i64 0, i32 0
  store i64 32, i64* %len8, align 8
  store i8* %call, i8** %buf10, align 8
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %k.unwrapped, i8** %arg.unwrapped, align 8
  %call11 = call i32 @__crypto_stream_xsalsa20(%struct.uint8ptr_wrapped_ty* nonnull %w_subkey, %struct.uint8ptr_wrapped_ty* nonnull %n.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arg.wrapped)
  %subkey12 = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %subkey12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 205, i8* null)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %subkey12, i8* noundef nonnull align 1 dereferenceable(32) %call, i64 32, i1 false)
  %arraydecay14 = getelementptr inbounds [16 x i8], [16 x i8]* %tmp1, i64 0, i64 0
  %4 = load i8*, i8** %c_buf, align 8
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %arraydecay14, i8* noundef nonnull align 1 dereferenceable(16) %add.ptr, i64 16, i1 false)
  %5 = load i64, i64* %c.field0.length.ptr, align 8
  %sub = add i64 %5, -32
  %len16 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_cview, i64 0, i32 1
  %call18 = call noalias i8* @malloc(i64 noundef %sub) #14
  %buf19 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_cview, i64 0, i32 0
  store i64 %sub, i64* %len16, align 8
  store i8* %call18, i8** %buf19, align 8
  %6 = load i8*, i8** %buf, align 8
  %add.ptr22 = getelementptr inbounds i8, i8* %6, i64 32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %call18, i8* nonnull align 1 %add.ptr22, i64 %sub, i1 false)
  %arraydecay24.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay24.wrapped, i64 0, i32 0
  %arraydecay24.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay24.wrapped, i64 0, i32 1
  store i64 16, i64* %arraydecay24.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay14, i8** %arraydecay24.unwrapped, align 8
  %arraydecay25.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay25.wrapped, i64 0, i32 0
  %arraydecay25.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay25.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay25.wrapped.field0.length.ptr, align 8
  store i8* %subkey12, i8** %arraydecay25.unwrapped, align 8
  %call26 = call i1 @_crypto_onetimeauth_poly1305_verify(%struct.uint8ptr_wrapped_ty* nonnull %arraydecay24.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %w_cview, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay25.wrapped)
  %k.addr.val = load i8*, i8** %k.addr, align 8
  %n.unwrapped.unwrapped34 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped33, i64 0, i32 0
  %n.unwrapped.wrapped33.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped33, i64 0, i32 1
  %select.val. = select i1 %call26, i64 %n.field0.length, i64 undef
  store i64 %select.val., i64* %n.unwrapped.wrapped33.field0.length.ptr, align 8
  %select.val.40 = select i1 %call26, i8* %n.unwrapped, i8* undef
  store i8* %select.val.40, i8** %n.unwrapped.unwrapped34, align 8
  %arg.unwrapped36 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped35, i64 0, i32 0
  %arg.wrapped35.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped35, i64 0, i32 1
  store i64 0, i64* %arg.wrapped35.field0.length.ptr, align 8
  %select.val.44 = select i1 %call26, i8* %k.addr.val, i8* undef
  store i8* %select.val.44, i8** %arg.unwrapped36, align 8
  %call29 = call i32 @__crypto_stream_xsalsa20_xor(%struct.uint8ptr_wrapped_ty* nonnull %m, %struct.uint8ptr_wrapped_ty* nonnull %c, %struct.uint8ptr_wrapped_ty* nonnull %n.unwrapped.wrapped33, %struct.uint8ptr_wrapped_ty* nonnull %arg.wrapped35, i1 undef)
  %buf31 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i64 0, i32 0
  br label %for.body

if.else:                                          ; preds = %if.end
  call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4.20, i64 0, i64 0), i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5.21, i64 0, i64 0), i32 noundef 198, i8* noundef getelementptr inbounds ([115 x i8], [115 x i8]* @__PRETTY_FUNCTION__.__crypto_secretbox_xsalsa20poly1305_open, i64 0, i64 0)) #15
  unreachable

for.body:                                         ; preds = %if.then6, %for.body
  %indvars.iv = phi i64 [ 0, %if.then6 ], [ %indvars.iv.next, %for.body ]
  %7 = load i8*, i8** %buf31, align 8
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %indvars.iv
  %idx0.safe = icmp sgt i64 %m.field0.length, %indvars.iv
  %8 = or i1 %idx0.safe, %call26
  %ctsel46 = select i1 %8, i8* %arrayidx, i8* %shadow.sroa.0
  %9 = load i8, i8* %ctsel46, align 1
  %select.val.47 = select i1 %call26, i8 0, i8 %9
  store i8 %select.val.47, i8* %ctsel46, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 32
  br i1 %exitcond.not, label %return, label %for.body, !llvm.loop !24

return:                                           ; preds = %for.body, %entry
  %out.6.0 = phi i1 [ true, %entry ], [ %call26, %for.body ]
  %10 = xor i1 %cmp, true
  %phi.fold = select i1 %out.6.0, i1 %10, i1 false
  ret i1 %phi.fold
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @__crypto_secretbox(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %c, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %m, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %n, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %k) #0 {
entry:
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i64 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 240, i8* null)
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %k.unwrapped, i8** %arg.unwrapped, align 8
  %call = call i1 @__crypto_secretbox_xsalsa20poly1305(%struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* %m, %struct.uint8ptr_wrapped_ty* nonnull %n.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arg.wrapped)
  ret i1 %call
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @__crypto_secretbox_open(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %m, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %c, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %n, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %k) #0 {
entry:
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i64 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i64 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 250, i8* null)
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %k.unwrapped, i8** %arg.unwrapped, align 8
  %call = call i1 @__crypto_secretbox_xsalsa20poly1305_open(%struct.uint8ptr_wrapped_ty* %m, %struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* nonnull %n.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arg.wrapped)
  ret i1 %call
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare noalias noundef i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #11

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
define dso_local void @__crypto_core_hsalsa20(%struct.uint8ptr_wrapped_ty* nocapture noundef readonly %out, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %input, %struct.uint8ptr_wrapped_ty* nocapture noundef readonly %k) local_unnamed_addr #5 {
entry:
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %out, i64 0, i32 0
  %out.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %input, i64 0, i32 0
  %input.unwrapped = load i8*, i8** %1, align 8
  %2 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i64 0, i32 0
  %k.unwrapped = load i8*, i8** %2, align 8
  %out.addr = alloca i8*, align 8
  %input.addr = alloca i8*, align 8
  %k.addr = alloca i8*, align 8
  store i8* %out.unwrapped, i8** %out.addr, align 8
  %out.addr1 = bitcast i8** %out.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %out.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 27, i8* null)
  store i8* %input.unwrapped, i8** %input.addr, align 8
  %input.addr2 = bitcast i8** %input.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %input.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 28, i8* null)
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr3 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* nonnull %k.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i64 0, i64 0), i32 29, i8* null)
  %call = call fastcc i32 @load32_le.22(i8* %k.unwrapped)
  %add.ptr = getelementptr inbounds i8, i8* %k.unwrapped, i64 4
  %call4 = call fastcc i32 @load32_le.22(i8* nonnull %add.ptr)
  %add.ptr5 = getelementptr inbounds i8, i8* %k.unwrapped, i64 8
  %call6 = call fastcc i32 @load32_le.22(i8* nonnull %add.ptr5)
  %add.ptr7 = getelementptr inbounds i8, i8* %k.unwrapped, i64 12
  %call8 = call fastcc i32 @load32_le.22(i8* nonnull %add.ptr7)
  %add.ptr9 = getelementptr inbounds i8, i8* %k.unwrapped, i64 16
  %call10 = call fastcc i32 @load32_le.22(i8* nonnull %add.ptr9)
  %add.ptr11 = getelementptr inbounds i8, i8* %k.unwrapped, i64 20
  %call12 = call fastcc i32 @load32_le.22(i8* nonnull %add.ptr11)
  %add.ptr13 = getelementptr inbounds i8, i8* %k.unwrapped, i64 24
  %call14 = call fastcc i32 @load32_le.22(i8* nonnull %add.ptr13)
  %add.ptr15 = getelementptr inbounds i8, i8* %k.unwrapped, i64 28
  %call16 = call fastcc i32 @load32_le.22(i8* nonnull %add.ptr15)
  %call17 = call fastcc i32 @load32_le.22(i8* %input.unwrapped)
  %add.ptr18 = getelementptr inbounds i8, i8* %input.unwrapped, i64 4
  %call19 = call fastcc i32 @load32_le.22(i8* nonnull %add.ptr18)
  %add.ptr20 = getelementptr inbounds i8, i8* %input.unwrapped, i64 8
  %call21 = call fastcc i32 @load32_le.22(i8* nonnull %add.ptr20)
  %add.ptr22 = getelementptr inbounds i8, i8* %input.unwrapped, i64 12
  %call23 = call fastcc i32 @load32_le.22(i8* nonnull %add.ptr22)
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %x0.0.rewritten18 = phi i32 [ 1634760805, %entry ], [ %xor80, %for.body ]
  %x5.0.rewritten17 = phi i32 [ 857760878, %entry ], [ %xor92, %for.body ]
  %x10.0.rewritten16 = phi i32 [ 2036477234, %entry ], [ %xor104, %for.body ]
  %x15.0.rewritten15 = phi i32 [ 1797285236, %entry ], [ %xor116, %for.body ]
  %x1.0.rewritten14 = phi i32 [ %call, %entry ], [ %xor71, %for.body ]
  %x2.0.rewritten13 = phi i32 [ %call4, %entry ], [ %xor74, %for.body ]
  %x3.0.rewritten12 = phi i32 [ %call6, %entry ], [ %xor77, %for.body ]
  %x4.0.rewritten11 = phi i32 [ %call8, %entry ], [ %xor89, %for.body ]
  %x11.0.rewritten10 = phi i32 [ %call10, %entry ], [ %xor95, %for.body ]
  %x12.0.rewritten9 = phi i32 [ %call12, %entry ], [ %xor107, %for.body ]
  %x13.0.rewritten8 = phi i32 [ %call14, %entry ], [ %xor110, %for.body ]
  %x14.0.rewritten7 = phi i32 [ %call16, %entry ], [ %xor113, %for.body ]
  %x6.0.rewritten6 = phi i32 [ %call17, %entry ], [ %xor83, %for.body ]
  %x7.0.rewritten5 = phi i32 [ %call19, %entry ], [ %xor86, %for.body ]
  %x8.0.rewritten4 = phi i32 [ %call21, %entry ], [ %xor98, %for.body ]
  %x9.0.rewritten3 = phi i32 [ %call23, %entry ], [ %xor101, %for.body ]
  %i.0.rewritten2 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %add = add i32 %x0.0.rewritten18, %x12.0.rewritten9
  %shl = shl i32 %add, 7
  %xor = xor i32 %shl, %x4.0.rewritten11
  %add24 = add i32 %xor, %x0.0.rewritten18
  %shl25 = shl i32 %add24, 9
  %xor26 = xor i32 %shl25, %x8.0.rewritten4
  %add27 = add i32 %xor26, %xor
  %shl28 = shl i32 %add27, 13
  %xor29 = xor i32 %shl28, %x12.0.rewritten9
  %add30 = add i32 %xor29, %xor26
  %shl31 = shl i32 %add30, 18
  %xor32 = xor i32 %shl31, %x0.0.rewritten18
  %add33 = add i32 %x5.0.rewritten17, %x1.0.rewritten14
  %shl34 = shl i32 %add33, 7
  %xor35 = xor i32 %shl34, %x9.0.rewritten3
  %add36 = add i32 %xor35, %x5.0.rewritten17
  %shl37 = shl i32 %add36, 9
  %xor38 = xor i32 %shl37, %x13.0.rewritten8
  %add39 = add i32 %xor38, %xor35
  %shl40 = shl i32 %add39, 13
  %xor41 = xor i32 %shl40, %x1.0.rewritten14
  %add42 = add i32 %xor41, %xor38
  %shl43 = shl i32 %add42, 18
  %xor44 = xor i32 %shl43, %x5.0.rewritten17
  %add45 = add i32 %x10.0.rewritten16, %x6.0.rewritten6
  %shl46 = shl i32 %add45, 7
  %xor47 = xor i32 %shl46, %x14.0.rewritten7
  %add48 = add i32 %xor47, %x10.0.rewritten16
  %shl49 = shl i32 %add48, 9
  %xor50 = xor i32 %shl49, %x2.0.rewritten13
  %add51 = add i32 %xor50, %xor47
  %shl52 = shl i32 %add51, 13
  %xor53 = xor i32 %shl52, %x6.0.rewritten6
  %add54 = add i32 %xor53, %xor50
  %shl55 = shl i32 %add54, 18
  %xor56 = xor i32 %shl55, %x10.0.rewritten16
  %add57 = add i32 %x15.0.rewritten15, %x11.0.rewritten10
  %shl58 = shl i32 %add57, 7
  %xor59 = xor i32 %shl58, %x3.0.rewritten12
  %add60 = add i32 %xor59, %x15.0.rewritten15
  %shl61 = shl i32 %add60, 9
  %xor62 = xor i32 %shl61, %x7.0.rewritten5
  %add63 = add i32 %xor62, %xor59
  %shl64 = shl i32 %add63, 13
  %xor65 = xor i32 %shl64, %x11.0.rewritten10
  %add66 = add i32 %xor65, %xor62
  %shl67 = shl i32 %add66, 18
  %xor68 = xor i32 %shl67, %x15.0.rewritten15
  %add69 = add i32 %xor32, %xor59
  %shl70 = shl i32 %add69, 7
  %xor71 = xor i32 %shl70, %xor41
  %add72 = add i32 %xor71, %xor32
  %shl73 = shl i32 %add72, 9
  %xor74 = xor i32 %shl73, %xor50
  %add75 = add i32 %xor74, %xor71
  %shl76 = shl i32 %add75, 13
  %xor77 = xor i32 %shl76, %xor59
  %add78 = add i32 %xor77, %xor74
  %shl79 = shl i32 %add78, 18
  %xor80 = xor i32 %shl79, %xor32
  %add81 = add i32 %xor44, %xor
  %shl82 = shl i32 %add81, 7
  %xor83 = xor i32 %shl82, %xor53
  %add84 = add i32 %xor83, %xor44
  %shl85 = shl i32 %add84, 9
  %xor86 = xor i32 %shl85, %xor62
  %add87 = add i32 %xor86, %xor83
  %shl88 = shl i32 %add87, 13
  %xor89 = xor i32 %shl88, %xor
  %add90 = add i32 %xor89, %xor86
  %shl91 = shl i32 %add90, 18
  %xor92 = xor i32 %shl91, %xor44
  %add93 = add i32 %xor56, %xor35
  %shl94 = shl i32 %add93, 7
  %xor95 = xor i32 %shl94, %xor65
  %add96 = add i32 %xor95, %xor56
  %shl97 = shl i32 %add96, 9
  %xor98 = xor i32 %shl97, %xor26
  %add99 = add i32 %xor98, %xor95
  %shl100 = shl i32 %add99, 13
  %xor101 = xor i32 %shl100, %xor35
  %add102 = add i32 %xor101, %xor98
  %shl103 = shl i32 %add102, 18
  %xor104 = xor i32 %shl103, %xor56
  %add105 = add i32 %xor68, %xor47
  %shl106 = shl i32 %add105, 7
  %xor107 = xor i32 %shl106, %xor29
  %add108 = add i32 %xor107, %xor68
  %shl109 = shl i32 %add108, 9
  %xor110 = xor i32 %shl109, %xor38
  %add111 = add i32 %xor110, %xor107
  %shl112 = shl i32 %add111, 13
  %xor113 = xor i32 %shl112, %xor47
  %add114 = add i32 %xor113, %xor110
  %shl115 = shl i32 %add114, 18
  %xor116 = xor i32 %shl115, %xor68
  %inc = add nuw nsw i32 %i.0.rewritten2, 1
  %exitcond.not = icmp eq i32 %inc, 10
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !25

for.end:                                          ; preds = %for.body
  call fastcc void @store32_le.23(i8* %out.unwrapped, i32 %xor80)
  %3 = load i8*, i8** %out.addr, align 8
  %add.ptr117 = getelementptr inbounds i8, i8* %3, i64 4
  call fastcc void @store32_le.23(i8* nonnull %add.ptr117, i32 %xor92)
  %4 = load i8*, i8** %out.addr, align 8
  %add.ptr118 = getelementptr inbounds i8, i8* %4, i64 8
  call fastcc void @store32_le.23(i8* nonnull %add.ptr118, i32 %xor104)
  %5 = load i8*, i8** %out.addr, align 8
  %add.ptr119 = getelementptr inbounds i8, i8* %5, i64 12
  call fastcc void @store32_le.23(i8* nonnull %add.ptr119, i32 %xor116)
  %6 = load i8*, i8** %out.addr, align 8
  %add.ptr120 = getelementptr inbounds i8, i8* %6, i64 16
  call fastcc void @store32_le.23(i8* nonnull %add.ptr120, i32 %xor83)
  %7 = load i8*, i8** %out.addr, align 8
  %add.ptr121 = getelementptr inbounds i8, i8* %7, i64 20
  call fastcc void @store32_le.23(i8* nonnull %add.ptr121, i32 %xor86)
  %8 = load i8*, i8** %out.addr, align 8
  %add.ptr122 = getelementptr inbounds i8, i8* %8, i64 24
  call fastcc void @store32_le.23(i8* nonnull %add.ptr122, i32 %xor98)
  %9 = load i8*, i8** %out.addr, align 8
  %add.ptr123 = getelementptr inbounds i8, i8* %9, i64 28
  call fastcc void @store32_le.23(i8* nonnull %add.ptr123, i32 %xor101)
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly sspstrong uwtable willreturn
define internal fastcc i32 @load32_le.22(i8* %src.0.0.val) unnamed_addr #7 {
entry:
  %0 = load i8, i8* %src.0.0.val, align 1
  %conv = zext i8 %0 to i32
  %arrayidx1 = getelementptr inbounds i8, i8* %src.0.0.val, i64 1
  %1 = load i8, i8* %arrayidx1, align 1
  %conv2 = zext i8 %1 to i32
  %shl = shl nuw nsw i32 %conv2, 8
  %or = or i32 %shl, %conv
  %arrayidx3 = getelementptr inbounds i8, i8* %src.0.0.val, i64 2
  %2 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %2 to i32
  %shl5 = shl nuw nsw i32 %conv4, 16
  %or6 = or i32 %or, %shl5
  %arrayidx7 = getelementptr inbounds i8, i8* %src.0.0.val, i64 3
  %3 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %3 to i32
  %shl9 = shl nuw i32 %conv8, 24
  %or10 = or i32 %or6, %shl9
  ret i32 %or10
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define internal fastcc void @store32_le.23(i8* %dst.0.0.val, i32 noundef %w) unnamed_addr #9 {
entry:
  %conv = trunc i32 %w to i8
  store i8 %conv, i8* %dst.0.0.val, align 1
  %shr = lshr i32 %w, 8
  %conv1 = trunc i32 %shr to i8
  %arrayidx2 = getelementptr inbounds i8, i8* %dst.0.0.val, i64 1
  store i8 %conv1, i8* %arrayidx2, align 1
  %shr3 = lshr i32 %w, 16
  %conv4 = trunc i32 %shr3 to i8
  %arrayidx5 = getelementptr inbounds i8, i8* %dst.0.0.val, i64 2
  store i8 %conv4, i8* %arrayidx5, align 1
  %shr6 = lshr i32 %w, 24
  %conv7 = trunc i32 %shr6 to i8
  %arrayidx8 = getelementptr inbounds i8, i8* %dst.0.0.val, i64 3
  store i8 %conv7, i8* %arrayidx8, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %arraydecay51.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay52.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay48.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay49.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %c = alloca %struct.uint8ptr_wrapped_ty, align 8
  %m = alloca %struct.uint8ptr_wrapped_ty, align 8
  %nonce = alloca [24 x i8], align 16
  %data = alloca [32 x i8], align 16
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %_zzq_args24 = alloca [6 x i64], align 16
  %_zzq_result25 = alloca i64, align 8
  %_zzq_args37 = alloca [6 x i64], align 16
  %_zzq_result38 = alloca i64, align 8
  %r1 = alloca i8, align 1
  %r2 = alloca i8, align 1
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i64 0, i32 1
  %call = tail call noalias dereferenceable_or_null(163) i8* @malloc(i64 noundef 163) #14
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i64 0, i32 0
  store i64 163, i64* %len, align 8
  store i8* %call, i8** %buf, align 8
  %len2 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i64 0, i32 1
  %call5 = tail call noalias dereferenceable_or_null(163) i8* @malloc(i64 noundef 163) #14
  %buf6 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i64 0, i32 0
  store i64 163, i64* %len2, align 8
  store i8* %call5, i8** %buf6, align 8
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(32) %call5, i8 0, i64 32, i1 false)
  %add.ptr = getelementptr inbounds i8, i8* %call5, i64 32
  %call11 = tail call i64 @read(i32 noundef 0, i8* noundef nonnull %add.ptr, i64 noundef 131) #14
  %arraydecay = getelementptr inbounds [24 x i8], [24 x i8]* %nonce, i64 0, i64 0
  %call12 = call i64 @read(i32 noundef 0, i8* noundef nonnull %arraydecay, i64 noundef 24) #14
  %arraydecay13 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %call14 = call i64 @read(i32 noundef 0, i8* noundef nonnull %arraydecay13, i64 noundef 32) #14
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %0 = ptrtoint i8* %call to i64
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %0, i64* %arrayidx16, align 8
  %arrayidx19 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 163, i64* %arrayidx19, align 16
  %arrayidx20 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx20, align 8
  %arrayidx21 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx21, align 16
  %arrayidx22 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx22, align 8
  %1 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx, i64 0) #14, !srcloc !26
  store volatile i64 %1, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx26 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args24, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx26, align 16
  %2 = ptrtoint i8* %call5 to i64
  %arrayidx28 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args24, i64 0, i64 1
  store volatile i64 %2, i64* %arrayidx28, align 8
  %arrayidx31 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args24, i64 0, i64 2
  store volatile i64 163, i64* %arrayidx31, align 16
  %arrayidx32 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args24, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx32, align 8
  %arrayidx33 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args24, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx33, align 16
  %arrayidx34 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args24, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx34, align 8
  %3 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx26, i64 0) #14, !srcloc !27
  store volatile i64 %3, i64* %_zzq_result25, align 8
  %_zzq_result25.0._zzq_result25.0._zzq_result25.0. = load volatile i64, i64* %_zzq_result25, align 8
  %arrayidx39 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args37, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx39, align 16
  %4 = ptrtoint [32 x i8]* %data to i64
  %arrayidx41 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args37, i64 0, i64 1
  store volatile i64 %4, i64* %arrayidx41, align 8
  %arrayidx42 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args37, i64 0, i64 2
  store volatile i64 32, i64* %arrayidx42, align 16
  %arrayidx43 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args37, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx43, align 8
  %arrayidx44 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args37, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx44, align 16
  %arrayidx45 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args37, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx45, align 8
  %5 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx39, i64 0) #14, !srcloc !28
  store volatile i64 %5, i64* %_zzq_result38, align 8
  %_zzq_result38.0._zzq_result38.0._zzq_result38.0. = load volatile i64, i64* %_zzq_result38, align 8
  %arraydecay48.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay48.wrapped, i64 0, i32 0
  %arraydecay48.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay48.wrapped, i64 0, i32 1
  store i64 24, i64* %arraydecay48.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay, i8** %arraydecay48.unwrapped, align 8
  %arraydecay49.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay49.wrapped, i64 0, i32 0
  %arraydecay49.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay49.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay49.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay13, i8** %arraydecay49.unwrapped, align 8
  %call50 = call i1 @__crypto_secretbox(%struct.uint8ptr_wrapped_ty* nonnull %c, %struct.uint8ptr_wrapped_ty* nonnull %m, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay48.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay49.wrapped)
  %frombool = zext i1 %call50 to i8
  store i8 %frombool, i8* %r1, align 1
  %arraydecay51.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay51.wrapped, i64 0, i32 0
  %arraydecay51.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay51.wrapped, i64 0, i32 1
  store i64 24, i64* %arraydecay51.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay, i8** %arraydecay51.unwrapped, align 8
  %arraydecay52.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay52.wrapped, i64 0, i32 0
  %arraydecay52.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay52.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay52.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay13, i8** %arraydecay52.unwrapped, align 8
  %call53 = call i1 @__crypto_secretbox_open(%struct.uint8ptr_wrapped_ty* nonnull %m, %struct.uint8ptr_wrapped_ty* nonnull %c, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay51.wrapped, %struct.uint8ptr_wrapped_ty* nonnull %arraydecay52.wrapped)
  %frombool54 = zext i1 %call53 to i8
  store i8 %frombool54, i8* %r2, align 1
  %call55 = call i64 @write(i32 noundef 1, i8* noundef nonnull %r1, i64 noundef 1) #14
  %call56 = call i64 @write(i32 noundef 1, i8* noundef nonnull %r2, i64 noundef 1) #14
  ret i32 0
}

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #12

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #12

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.fshl.i64(i64, i64, i64) #13

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { nofree noinline nosync nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree noinline norecurse nosync nounwind readonly sspstrong uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nofree noinline norecurse nosync nounwind readnone sspstrong uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nofree noinline nosync nounwind sspstrong uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #14 = { nounwind }
attributes #15 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0}
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
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = !{i64 2148412567, i64 2148412603, i64 2148412671}
!27 = !{i64 2148414202, i64 2148414238, i64 2148414306}
!28 = !{i64 2148415798, i64 2148415834, i64 2148415902}

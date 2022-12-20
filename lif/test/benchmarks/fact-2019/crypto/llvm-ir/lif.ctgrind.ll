; ModuleID = 'llvm-ir/base.ctgrind.ll'
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
define dso_local i32 @_crypto_stream_salsa20(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %n, %struct.uint8ptr_wrapped_ty* noundef %k) #0 {
entry:
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %c.field0.length = load i64, i64* %c.field0.length.ptr, align 8
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %k.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 1
  %k.field0.length = load i64, i64* %k.field0.length.ptr, align 8
  %arraydecay38.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay39.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay40.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay11.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay12.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
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
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.9, align 1
  store i1 false, i1* %out.15, align 1
  store i1 false, i1* %out.17, align 1
  store i1 false, i1* %out.22, align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  %c_buf = alloca i8*, align 8
  %kcopy = alloca [32 x i8], align 16
  %input = alloca [16 x i8], align 16
  %u = alloca i32, align 4
  %block = alloca [64 x i8], align 16
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 114, i8* null)
  %c_buf2 = bitcast i8** %c_buf to i8*
  call void @llvm.var.annotation(i8* %c_buf2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 116, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %2 = load i8*, i8** %buf, align 8
  store i8* %2, i8** %c_buf, align 8
  %kcopy3 = bitcast [32 x i8]* %kcopy to i8*
  call void @llvm.var.annotation(i8* %kcopy3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 119, i8* null)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  %3 = load i8*, i8** %k.addr, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %3, i64 32, i1 false)
  %input4 = bitcast [16 x i8]* %input to i8*
  call void @llvm.var.annotation(i8* %input4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 122, i8* null)
  %4 = bitcast [16 x i8]* %input to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 16, i1 false)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %5 = load i1, i1* %out.9, align 1
  %6 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %6
  %cond.fold = or i1 %fwcond.and.fwtaken, %5
  store i1 %cond.fold, i1* %out.7, align 1
  %cmp = icmp ult i32 %i.0.rewritten, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i1, i1* %out.7, align 1
  %in. = and i1 %7, %cmp
  %cond.fold25 = or i1 false, %in.
  store i1 %cond.fold25, i1* %out.8, align 1
  %idxprom = zext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds i8, i8* %n.unwrapped, i64 %idxprom
  %8 = load i8, i8* %arrayidx, align 1
  %idxprom5 = zext i32 %i.0.rewritten to i64
  %arrayidx6 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom5
  store i8 %8, i8* %arrayidx6, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i1, i1* %out.8, align 1
  %cond.fold26 = or i1 false, %9
  store i1 %cond.fold26, i1* %out.9, align 1
  %inc = add i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %10 = load i1, i1* %out.7, align 1
  %11 = xor i1 %cmp, true
  %in.27 = and i1 %10, %11
  %cond.fold28 = or i1 false, %in.27
  store i1 %cond.fold28, i1* %out.10, align 1
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %12 = load i64, i64* %len, align 8
  %conv = trunc i64 %12 to i32
  %shr = lshr i32 %conv, 6
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc29, %for.end
  %j.0.rewritten = phi i32 [ 0, %for.end ], [ %inc30, %for.inc29 ]
  %fwedge.taken1.rewritten = phi i1 [ true, %for.end ], [ false, %for.inc29 ]
  %exitpred.frozen2.rewritten = phi i1 [ %cmp8, %for.inc29 ], [ false, %for.end ]
  %13 = load i1, i1* %out.17, align 1
  %14 = load i1, i1* %out.10, align 1
  %fwcond.and.fwtaken29 = and i1 %fwedge.taken1.rewritten, %14
  %cond.fold30 = or i1 %fwcond.and.fwtaken29, %13
  store i1 %cond.fold30, i1* %out.11, align 1
  %cmp8 = icmp ult i32 %j.0.rewritten, %shr
  br i1 %cmp8, label %for.body10, label %for.end31

for.body10:                                       ; preds = %for.cond7
  %15 = load i1, i1* %out.11, align 1
  %in.31 = and i1 %15, %cmp8
  %cond.fold32 = or i1 false, %in.31
  store i1 %cond.fold32, i1* %out.12, align 1
  %16 = load i8*, i8** %c_buf, align 8
  %mul = mul i32 %j.0.rewritten, 64
  %idx.ext = zext i32 %mul to i64
  %add.ptr = getelementptr inbounds i8, i8* %16, i64 %idx.ext
  %arraydecay11 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 0
  %arraydecay12 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  %add.ptr.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 0
  %add.ptr.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr, i8** %add.ptr.unwrapped, align 8
  %arraydecay11.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay11.wrapped, i32 0, i32 0
  %arraydecay11.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay11.wrapped, i32 0, i32 1
  store i64 16, i64* %arraydecay11.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay11, i8** %arraydecay11.unwrapped, align 8
  %arraydecay12.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay12.wrapped, i32 0, i32 0
  %arraydecay12.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay12.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay12.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay12, i8** %arraydecay12.unwrapped, align 8
  call void @_crypto_core_salsa20(%struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, %struct.uint8ptr_wrapped_ty* %arraydecay11.wrapped, %struct.uint8ptr_wrapped_ty* %arraydecay12.wrapped)
  %u13 = bitcast i32* %u to i8*
  call void @llvm.var.annotation(i8* %u13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 131, i8* null)
  store i32 1, i32* %u, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc26, %for.body10
  %i14.0.rewritten = phi i32 [ 8, %for.body10 ], [ %inc27, %for.inc26 ]
  %fwedge.taken3.rewritten = phi i1 [ true, %for.body10 ], [ false, %for.inc26 ]
  %exitpred.frozen4.rewritten = phi i1 [ %cmp16, %for.inc26 ], [ false, %for.body10 ]
  %17 = load i1, i1* %out.15, align 1
  %18 = load i1, i1* %out.12, align 1
  %fwcond.and.fwtaken33 = and i1 %fwedge.taken3.rewritten, %18
  %cond.fold34 = or i1 %fwcond.and.fwtaken33, %17
  store i1 %cond.fold34, i1* %out.13, align 1
  %cmp16 = icmp ult i32 %i14.0.rewritten, 16
  br i1 %cmp16, label %for.body18, label %for.end28

for.body18:                                       ; preds = %for.cond15
  %19 = load i1, i1* %out.13, align 1
  %in.35 = and i1 %19, %cmp16
  %cond.fold36 = or i1 false, %in.35
  store i1 %cond.fold36, i1* %out.14, align 1
  %idxprom19 = zext i32 %i14.0.rewritten to i64
  %arrayidx20 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom19
  %20 = load i8, i8* %arrayidx20, align 1
  %conv21 = zext i8 %20 to i32
  %21 = load i32, i32* %u, align 4
  %add = add i32 %21, %conv21
  store i32 %add, i32* %u, align 4
  %22 = load i32, i32* %u, align 4
  %conv22 = trunc i32 %22 to i8
  %idxprom23 = zext i32 %i14.0.rewritten to i64
  %arrayidx24 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom23
  store i8 %conv22, i8* %arrayidx24, align 1
  %23 = load i32, i32* %u, align 4
  %shr25 = lshr i32 %23, 8
  store i32 %shr25, i32* %u, align 4
  br label %for.inc26

for.inc26:                                        ; preds = %for.body18
  %24 = load i1, i1* %out.14, align 1
  %cond.fold37 = or i1 false, %24
  store i1 %cond.fold37, i1* %out.15, align 1
  %inc27 = add i32 %i14.0.rewritten, 1
  br label %for.cond15, !llvm.loop !8

for.end28:                                        ; preds = %for.cond15
  %25 = load i1, i1* %out.13, align 1
  %26 = xor i1 %cmp16, true
  %in.38 = and i1 %25, %26
  %cond.fold39 = or i1 false, %in.38
  store i1 %cond.fold39, i1* %out.16, align 1
  br label %for.inc29

for.inc29:                                        ; preds = %for.end28
  %27 = load i1, i1* %out.16, align 1
  %cond.fold40 = or i1 false, %27
  store i1 %cond.fold40, i1* %out.17, align 1
  %inc30 = add i32 %j.0.rewritten, 1
  br label %for.cond7, !llvm.loop !9

for.end31:                                        ; preds = %for.cond7
  %28 = load i1, i1* %out.11, align 1
  %29 = xor i1 %cmp8, true
  %in.41 = and i1 %28, %29
  %cond.fold42 = or i1 false, %in.41
  store i1 %cond.fold42, i1* %out.18, align 1
  %block32 = bitcast [64 x i8]* %block to i8*
  call void @llvm.var.annotation(i8* %block32, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 139, i8* null)
  %30 = bitcast [64 x i8]* %block to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %30, i8 0, i64 64, i1 false)
  %mul33 = mul i32 %shr, 64
  %conv34 = zext i32 %mul33 to i64
  %len35 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %31 = load i64, i64* %len35, align 8
  %cmp36 = icmp ult i64 %conv34, %31
  br i1 %cmp36, label %if.then, label %if.end

if.then:                                          ; preds = %for.end31
  %32 = load i1, i1* %out.18, align 1
  %in.43 = and i1 %32, %cmp36
  %cond.fold44 = or i1 false, %in.43
  store i1 %cond.fold44, i1* %out.19, align 1
  %arraydecay38 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 0
  %arraydecay39 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 0
  %arraydecay40 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  %arraydecay38.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay38.wrapped, i32 0, i32 0
  %arraydecay38.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay38.wrapped, i32 0, i32 1
  store i64 64, i64* %arraydecay38.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay38, i8** %arraydecay38.unwrapped, align 8
  %arraydecay39.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay39.wrapped, i32 0, i32 0
  %arraydecay39.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay39.wrapped, i32 0, i32 1
  store i64 16, i64* %arraydecay39.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay39, i8** %arraydecay39.unwrapped, align 8
  %arraydecay40.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay40.wrapped, i32 0, i32 0
  %arraydecay40.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay40.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay40.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay40, i8** %arraydecay40.unwrapped, align 8
  call void @_crypto_core_salsa20(%struct.uint8ptr_wrapped_ty* %arraydecay38.wrapped, %struct.uint8ptr_wrapped_ty* %arraydecay39.wrapped, %struct.uint8ptr_wrapped_ty* %arraydecay40.wrapped)
  %len41 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %33 = load i64, i64* %len41, align 8
  %mul42 = mul i32 %shr, 64
  %conv43 = zext i32 %mul42 to i64
  %sub = sub i64 %33, %conv43
  %conv44 = trunc i64 %sub to i32
  br label %for.cond46

for.cond46:                                       ; preds = %for.inc54, %if.then
  %i45.0.rewritten = phi i32 [ 0, %if.then ], [ %inc55, %for.inc54 ]
  %fwedge.taken5.rewritten = phi i1 [ true, %if.then ], [ false, %for.inc54 ]
  %exitpred.frozen6.rewritten = phi i1 [ %cmp47, %for.inc54 ], [ false, %if.then ]
  %34 = load i1, i1* %out.22, align 1
  %35 = load i1, i1* %out.19, align 1
  %fwcond.and.fwtaken45 = and i1 %fwedge.taken5.rewritten, %35
  %cond.fold46 = or i1 %fwcond.and.fwtaken45, %34
  store i1 %cond.fold46, i1* %out.20, align 1
  %cmp47 = icmp ult i32 %i45.0.rewritten, %conv44
  br i1 %cmp47, label %for.body49, label %for.end56

for.body49:                                       ; preds = %for.cond46
  %36 = load i1, i1* %out.20, align 1
  %in.47 = and i1 %36, %cmp47
  %cond.fold48 = or i1 false, %in.47
  store i1 %cond.fold48, i1* %out.21, align 1
  %idxprom50 = zext i32 %i45.0.rewritten to i64
  %arrayidx51 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 %idxprom50
  %37 = load i8, i8* %arrayidx51, align 1
  %38 = load i8*, i8** %c_buf, align 8
  %idxprom52 = zext i32 %i45.0.rewritten to i64
  %arrayidx53 = getelementptr inbounds i8, i8* %38, i64 %idxprom52
  store i8 %37, i8* %arrayidx53, align 1
  br label %for.inc54

for.inc54:                                        ; preds = %for.body49
  %39 = load i1, i1* %out.21, align 1
  %cond.fold49 = or i1 false, %39
  store i1 %cond.fold49, i1* %out.22, align 1
  %inc55 = add i32 %i45.0.rewritten, 1
  br label %for.cond46, !llvm.loop !10

for.end56:                                        ; preds = %for.cond46
  %40 = load i1, i1* %out.20, align 1
  %41 = xor i1 %cmp47, true
  %in.50 = and i1 %40, %41
  %cond.fold51 = or i1 false, %in.50
  store i1 %cond.fold51, i1* %out.23, align 1
  br label %if.end

if.end:                                           ; preds = %for.end56, %for.end31
  %42 = load i1, i1* %out.23, align 1
  %43 = load i1, i1* %out.18, align 1
  %44 = xor i1 %cmp36, true
  %in.52 = and i1 %43, %44
  %cond.fold53 = or i1 false, %in.52
  %cond.fold54 = or i1 %cond.fold53, %42
  store i1 %cond.fold54, i1* %out.24, align 1
  %arraydecay57 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 0
  call void @sodium_memzero(i8* noundef %arraydecay57, i64 noundef 64)
  %arraydecay58 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  call void @sodium_memzero(i8* noundef %arraydecay58, i64 noundef 32)
  ret i32 0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @_crypto_stream_salsa20_xor_ic(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, %struct.uint8ptr_wrapped_ty* noundef %n, i64 noundef %ic_val, %struct.uint8ptr_wrapped_ty* noundef %k) #0 {
entry:
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %c.field0.length = load i64, i64* %c.field0.length.ptr, align 8
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %m.field0.length = load i64, i64* %m.field0.length.ptr, align 8
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %k.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 1
  %k.field0.length = load i64, i64* %k.field0.length.ptr, align 8
  %arraydecay72.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay73.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay74.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay27.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay28.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay29.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
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
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.16, align 1
  store i1 false, i1* %out.20, align 1
  store i1 false, i1* %out.26, align 1
  store i1 false, i1* %out.30, align 1
  store i1 false, i1* %out.32, align 1
  store i1 false, i1* %out.37, align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 0
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
  call void @llvm.var.annotation(i8* %n.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 157, i8* null)
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr2 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 159, i8* null)
  %c_buf3 = bitcast i8** %c_buf to i8*
  call void @llvm.var.annotation(i8* %c_buf3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 162, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %2 = load i8*, i8** %buf, align 8
  store i8* %2, i8** %c_buf, align 8
  %m_buf4 = bitcast i8** %m_buf to i8*
  call void @llvm.var.annotation(i8* %m_buf4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 163, i8* null)
  %buf5 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %3 = load i8*, i8** %buf5, align 8
  store i8* %3, i8** %m_buf, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %4 = load i64, i64* %len, align 8
  %len6 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %5 = load i64, i64* %len6, align 8
  %cmp = icmp eq i64 %4, %5
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %6 = load i1, i1* %out., align 1
  %in. = and i1 %6, %cmp
  %cond.fold = or i1 false, %in.
  store i1 %cond.fold, i1* %out.11, align 1
  br label %if.end

if.else:                                          ; preds = %entry
  %7 = load i1, i1* %out., align 1
  %8 = xor i1 %cmp, true
  %in.40 = and i1 %7, %8
  %cond.fold41 = or i1 false, %in.40
  store i1 %cond.fold41, i1* %out.12, align 1
  call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), i32 noundef 166, i8* noundef getelementptr inbounds ([116 x i8], [116 x i8]* @__PRETTY_FUNCTION__._crypto_stream_salsa20_xor_ic, i64 0, i64 0)) #7
  unreachable

if.end:                                           ; preds = %if.then
  %9 = load i1, i1* %out.11, align 1
  %cond.fold42 = or i1 false, %9
  store i1 %cond.fold42, i1* %out.13, align 1
  %kcopy7 = bitcast [32 x i8]* %kcopy to i8*
  call void @llvm.var.annotation(i8* %kcopy7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 169, i8* null)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  %10 = load i8*, i8** %k.addr, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %10, i64 32, i1 false)
  %input8 = bitcast [16 x i8]* %input to i8*
  call void @llvm.var.annotation(i8* %input8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 172, i8* null)
  %11 = bitcast [16 x i8]* %input to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 16, i1 false)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0.rewritten = phi i32 [ 0, %if.end ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %if.end ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp9, %for.inc ], [ false, %if.end ]
  %12 = load i1, i1* %out.16, align 1
  %13 = load i1, i1* %out.13, align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %13
  %cond.fold43 = or i1 %fwcond.and.fwtaken, %12
  store i1 %cond.fold43, i1* %out.14, align 1
  %cmp9 = icmp ult i32 %i.0.rewritten, 8
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %14 = load i1, i1* %out.14, align 1
  %in.44 = and i1 %14, %cmp9
  %cond.fold45 = or i1 false, %in.44
  store i1 %cond.fold45, i1* %out.15, align 1
  %15 = load i8*, i8** %n.addr, align 8
  %idxprom = zext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds i8, i8* %15, i64 %idxprom
  %16 = load i8, i8* %arrayidx, align 1
  %idxprom10 = zext i32 %i.0.rewritten to i64
  %arrayidx11 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom10
  store i8 %16, i8* %arrayidx11, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i1, i1* %out.15, align 1
  %cond.fold46 = or i1 false, %17
  store i1 %cond.fold46, i1* %out.16, align 1
  %inc = add i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  %18 = load i1, i1* %out.14, align 1
  %19 = xor i1 %cmp9, true
  %in.47 = and i1 %18, %19
  %cond.fold48 = or i1 false, %in.47
  store i1 %cond.fold48, i1* %out.17, align 1
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc18, %for.end
  %i12.0.rewritten = phi i32 [ 8, %for.end ], [ %inc19, %for.inc18 ]
  %ic.0.rewritten = phi i64 [ %ic_val, %for.end ], [ %shr, %for.inc18 ]
  %fwedge.taken1.rewritten = phi i1 [ true, %for.end ], [ false, %for.inc18 ]
  %exitpred.frozen2.rewritten = phi i1 [ %cmp14, %for.inc18 ], [ false, %for.end ]
  %20 = load i1, i1* %out.20, align 1
  %21 = load i1, i1* %out.17, align 1
  %fwcond.and.fwtaken49 = and i1 %fwedge.taken1.rewritten, %21
  %cond.fold50 = or i1 %fwcond.and.fwtaken49, %20
  store i1 %cond.fold50, i1* %out.18, align 1
  %cmp14 = icmp ult i32 %i12.0.rewritten, 16
  br i1 %cmp14, label %for.body15, label %for.end20

for.body15:                                       ; preds = %for.cond13
  %22 = load i1, i1* %out.18, align 1
  %in.51 = and i1 %22, %cmp14
  %cond.fold52 = or i1 false, %in.51
  store i1 %cond.fold52, i1* %out.19, align 1
  %and = and i64 %ic.0.rewritten, 255
  %conv = trunc i64 %and to i8
  %idxprom16 = zext i32 %i12.0.rewritten to i64
  %arrayidx17 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom16
  store i8 %conv, i8* %arrayidx17, align 1
  %shr = lshr i64 %ic.0.rewritten, 8
  br label %for.inc18

for.inc18:                                        ; preds = %for.body15
  %23 = load i1, i1* %out.19, align 1
  %cond.fold53 = or i1 false, %23
  store i1 %cond.fold53, i1* %out.20, align 1
  %inc19 = add i32 %i12.0.rewritten, 1
  br label %for.cond13, !llvm.loop !12

for.end20:                                        ; preds = %for.cond13
  %24 = load i1, i1* %out.18, align 1
  %25 = xor i1 %cmp14, true
  %in.54 = and i1 %24, %25
  %cond.fold55 = or i1 false, %in.54
  store i1 %cond.fold55, i1* %out.21, align 1
  %len21 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %26 = load i64, i64* %len21, align 8
  %div = udiv i64 %26, 64
  %block22 = bitcast [64 x i8]* %block to i8*
  call void @llvm.var.annotation(i8* %block22, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 183, i8* null)
  %27 = bitcast [64 x i8]* %block to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %27, i8 0, i64 64, i1 false)
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc63, %for.end20
  %j.0.rewritten = phi i64 [ 0, %for.end20 ], [ %inc64, %for.inc63 ]
  %fwedge.taken3.rewritten = phi i1 [ true, %for.end20 ], [ false, %for.inc63 ]
  %exitpred.frozen4.rewritten = phi i1 [ %cmp24, %for.inc63 ], [ false, %for.end20 ]
  %28 = load i1, i1* %out.32, align 1
  %29 = load i1, i1* %out.21, align 1
  %fwcond.and.fwtaken56 = and i1 %fwedge.taken3.rewritten, %29
  %cond.fold57 = or i1 %fwcond.and.fwtaken56, %28
  store i1 %cond.fold57, i1* %out.22, align 1
  %cmp24 = icmp ult i64 %j.0.rewritten, %div
  br i1 %cmp24, label %for.body26, label %for.end65

for.body26:                                       ; preds = %for.cond23
  %30 = load i1, i1* %out.22, align 1
  %in.58 = and i1 %30, %cmp24
  %cond.fold59 = or i1 false, %in.58
  store i1 %cond.fold59, i1* %out.23, align 1
  %arraydecay27 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 0
  %arraydecay28 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 0
  %arraydecay29 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  %arraydecay27.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay27.wrapped, i32 0, i32 0
  %arraydecay27.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay27.wrapped, i32 0, i32 1
  store i64 64, i64* %arraydecay27.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay27, i8** %arraydecay27.unwrapped, align 8
  %arraydecay28.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay28.wrapped, i32 0, i32 0
  %arraydecay28.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay28.wrapped, i32 0, i32 1
  store i64 16, i64* %arraydecay28.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay28, i8** %arraydecay28.unwrapped, align 8
  %arraydecay29.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay29.wrapped, i32 0, i32 0
  %arraydecay29.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay29.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay29.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay29, i8** %arraydecay29.unwrapped, align 8
  call void @_crypto_core_salsa20(%struct.uint8ptr_wrapped_ty* %arraydecay27.wrapped, %struct.uint8ptr_wrapped_ty* %arraydecay28.wrapped, %struct.uint8ptr_wrapped_ty* %arraydecay29.wrapped)
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc44, %for.body26
  %i30.0.rewritten = phi i32 [ 0, %for.body26 ], [ %inc45, %for.inc44 ]
  %fwedge.taken5.rewritten = phi i1 [ true, %for.body26 ], [ false, %for.inc44 ]
  %exitpred.frozen6.rewritten = phi i1 [ %cmp32, %for.inc44 ], [ false, %for.body26 ]
  %31 = load i1, i1* %out.26, align 1
  %32 = load i1, i1* %out.23, align 1
  %fwcond.and.fwtaken60 = and i1 %fwedge.taken5.rewritten, %32
  %cond.fold61 = or i1 %fwcond.and.fwtaken60, %31
  store i1 %cond.fold61, i1* %out.24, align 1
  %cmp32 = icmp ult i32 %i30.0.rewritten, 64
  br i1 %cmp32, label %for.body34, label %for.end46

for.body34:                                       ; preds = %for.cond31
  %33 = load i1, i1* %out.24, align 1
  %in.62 = and i1 %33, %cmp32
  %cond.fold63 = or i1 false, %in.62
  store i1 %cond.fold63, i1* %out.25, align 1
  %34 = load i8*, i8** %m_buf, align 8
  %idxprom35 = zext i32 %i30.0.rewritten to i64
  %arrayidx36 = getelementptr inbounds i8, i8* %34, i64 %idxprom35
  %35 = load i8, i8* %arrayidx36, align 1
  %conv37 = zext i8 %35 to i32
  %idxprom38 = zext i32 %i30.0.rewritten to i64
  %arrayidx39 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 %idxprom38
  %36 = load i8, i8* %arrayidx39, align 1
  %conv40 = zext i8 %36 to i32
  %xor = xor i32 %conv37, %conv40
  %conv41 = trunc i32 %xor to i8
  %37 = load i8*, i8** %c_buf, align 8
  %idxprom42 = zext i32 %i30.0.rewritten to i64
  %arrayidx43 = getelementptr inbounds i8, i8* %37, i64 %idxprom42
  store i8 %conv41, i8* %arrayidx43, align 1
  br label %for.inc44

for.inc44:                                        ; preds = %for.body34
  %38 = load i1, i1* %out.25, align 1
  %cond.fold64 = or i1 false, %38
  store i1 %cond.fold64, i1* %out.26, align 1
  %inc45 = add i32 %i30.0.rewritten, 1
  br label %for.cond31, !llvm.loop !13

for.end46:                                        ; preds = %for.cond31
  %39 = load i1, i1* %out.24, align 1
  %40 = xor i1 %cmp32, true
  %in.65 = and i1 %39, %40
  %cond.fold66 = or i1 false, %in.65
  store i1 %cond.fold66, i1* %out.27, align 1
  %u47 = bitcast i32* %u to i8*
  call void @llvm.var.annotation(i8* %u47, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 191, i8* null)
  store i32 1, i32* %u, align 4
  br label %for.cond49

for.cond49:                                       ; preds = %for.inc60, %for.end46
  %i48.0.rewritten = phi i32 [ 8, %for.end46 ], [ %inc61, %for.inc60 ]
  %fwedge.taken7.rewritten = phi i1 [ true, %for.end46 ], [ false, %for.inc60 ]
  %exitpred.frozen8.rewritten = phi i1 [ %cmp50, %for.inc60 ], [ false, %for.end46 ]
  %41 = load i1, i1* %out.30, align 1
  %42 = load i1, i1* %out.27, align 1
  %fwcond.and.fwtaken67 = and i1 %fwedge.taken7.rewritten, %42
  %cond.fold68 = or i1 %fwcond.and.fwtaken67, %41
  store i1 %cond.fold68, i1* %out.28, align 1
  %cmp50 = icmp ult i32 %i48.0.rewritten, 16
  br i1 %cmp50, label %for.body52, label %for.end62

for.body52:                                       ; preds = %for.cond49
  %43 = load i1, i1* %out.28, align 1
  %in.69 = and i1 %43, %cmp50
  %cond.fold70 = or i1 false, %in.69
  store i1 %cond.fold70, i1* %out.29, align 1
  %idxprom53 = zext i32 %i48.0.rewritten to i64
  %arrayidx54 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom53
  %44 = load i8, i8* %arrayidx54, align 1
  %conv55 = zext i8 %44 to i32
  %45 = load i32, i32* %u, align 4
  %add = add i32 %45, %conv55
  store i32 %add, i32* %u, align 4
  %46 = load i32, i32* %u, align 4
  %conv56 = trunc i32 %46 to i8
  %idxprom57 = zext i32 %i48.0.rewritten to i64
  %arrayidx58 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 %idxprom57
  store i8 %conv56, i8* %arrayidx58, align 1
  %47 = load i32, i32* %u, align 4
  %shr59 = lshr i32 %47, 8
  store i32 %shr59, i32* %u, align 4
  br label %for.inc60

for.inc60:                                        ; preds = %for.body52
  %48 = load i1, i1* %out.29, align 1
  %cond.fold71 = or i1 false, %48
  store i1 %cond.fold71, i1* %out.30, align 1
  %inc61 = add i32 %i48.0.rewritten, 1
  br label %for.cond49, !llvm.loop !14

for.end62:                                        ; preds = %for.cond49
  %49 = load i1, i1* %out.28, align 1
  %50 = xor i1 %cmp50, true
  %in.72 = and i1 %49, %50
  %cond.fold73 = or i1 false, %in.72
  store i1 %cond.fold73, i1* %out.31, align 1
  br label %for.inc63

for.inc63:                                        ; preds = %for.end62
  %51 = load i1, i1* %out.31, align 1
  %cond.fold74 = or i1 false, %51
  store i1 %cond.fold74, i1* %out.32, align 1
  %inc64 = add i64 %j.0.rewritten, 1
  br label %for.cond23, !llvm.loop !15

for.end65:                                        ; preds = %for.cond23
  %52 = load i1, i1* %out.22, align 1
  %53 = xor i1 %cmp24, true
  %in.75 = and i1 %52, %53
  %cond.fold76 = or i1 false, %in.75
  store i1 %cond.fold76, i1* %out.33, align 1
  %mul = mul i64 %div, 64
  %len66 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %54 = load i64, i64* %len66, align 8
  %cmp67 = icmp ult i64 %mul, %54
  br i1 %cmp67, label %if.then69, label %if.end90

if.then69:                                        ; preds = %for.end65
  %55 = load i1, i1* %out.33, align 1
  %in.77 = and i1 %55, %cmp67
  %cond.fold78 = or i1 false, %in.77
  store i1 %cond.fold78, i1* %out.34, align 1
  %len70 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %56 = load i64, i64* %len70, align 8
  %mul71 = mul i64 %div, 64
  %sub = sub i64 %56, %mul71
  %arraydecay72 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 0
  %arraydecay73 = getelementptr inbounds [16 x i8], [16 x i8]* %input, i64 0, i64 0
  %arraydecay74 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  %arraydecay72.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay72.wrapped, i32 0, i32 0
  %arraydecay72.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay72.wrapped, i32 0, i32 1
  store i64 64, i64* %arraydecay72.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay72, i8** %arraydecay72.unwrapped, align 8
  %arraydecay73.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay73.wrapped, i32 0, i32 0
  %arraydecay73.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay73.wrapped, i32 0, i32 1
  store i64 16, i64* %arraydecay73.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay73, i8** %arraydecay73.unwrapped, align 8
  %arraydecay74.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay74.wrapped, i32 0, i32 0
  %arraydecay74.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay74.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay74.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay74, i8** %arraydecay74.unwrapped, align 8
  call void @_crypto_core_salsa20(%struct.uint8ptr_wrapped_ty* %arraydecay72.wrapped, %struct.uint8ptr_wrapped_ty* %arraydecay73.wrapped, %struct.uint8ptr_wrapped_ty* %arraydecay74.wrapped)
  br label %for.cond76

for.cond76:                                       ; preds = %for.inc87, %if.then69
  %i75.0.rewritten = phi i64 [ 0, %if.then69 ], [ %inc88, %for.inc87 ]
  %fwedge.taken9.rewritten = phi i1 [ true, %if.then69 ], [ false, %for.inc87 ]
  %exitpred.frozen10.rewritten = phi i1 [ %cmp77, %for.inc87 ], [ false, %if.then69 ]
  %57 = load i1, i1* %out.37, align 1
  %58 = load i1, i1* %out.34, align 1
  %fwcond.and.fwtaken79 = and i1 %fwedge.taken9.rewritten, %58
  %cond.fold80 = or i1 %fwcond.and.fwtaken79, %57
  store i1 %cond.fold80, i1* %out.35, align 1
  %cmp77 = icmp ult i64 %i75.0.rewritten, %sub
  br i1 %cmp77, label %for.body79, label %for.end89

for.body79:                                       ; preds = %for.cond76
  %59 = load i1, i1* %out.35, align 1
  %in.81 = and i1 %59, %cmp77
  %cond.fold82 = or i1 false, %in.81
  store i1 %cond.fold82, i1* %out.36, align 1
  %60 = load i8*, i8** %m_buf, align 8
  %arrayidx80 = getelementptr inbounds i8, i8* %60, i64 %i75.0.rewritten
  %61 = load i8, i8* %arrayidx80, align 1
  %conv81 = zext i8 %61 to i32
  %arrayidx82 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 %i75.0.rewritten
  %62 = load i8, i8* %arrayidx82, align 1
  %conv83 = zext i8 %62 to i32
  %xor84 = xor i32 %conv81, %conv83
  %conv85 = trunc i32 %xor84 to i8
  %63 = load i8*, i8** %c_buf, align 8
  %arrayidx86 = getelementptr inbounds i8, i8* %63, i64 %i75.0.rewritten
  store i8 %conv85, i8* %arrayidx86, align 1
  br label %for.inc87

for.inc87:                                        ; preds = %for.body79
  %64 = load i1, i1* %out.36, align 1
  %cond.fold83 = or i1 false, %64
  store i1 %cond.fold83, i1* %out.37, align 1
  %inc88 = add i64 %i75.0.rewritten, 1
  br label %for.cond76, !llvm.loop !16

for.end89:                                        ; preds = %for.cond76
  %65 = load i1, i1* %out.35, align 1
  %66 = xor i1 %cmp77, true
  %in.84 = and i1 %65, %66
  %cond.fold85 = or i1 false, %in.84
  store i1 %cond.fold85, i1* %out.38, align 1
  br label %if.end90

if.end90:                                         ; preds = %for.end89, %for.end65
  %67 = load i1, i1* %out.38, align 1
  %68 = load i1, i1* %out.33, align 1
  %69 = xor i1 %cmp67, true
  %in.86 = and i1 %68, %69
  %cond.fold87 = or i1 false, %in.86
  %cond.fold88 = or i1 %cond.fold87, %67
  store i1 %cond.fold88, i1* %out.39, align 1
  %arraydecay91 = getelementptr inbounds [64 x i8], [64 x i8]* %block, i64 0, i64 0
  call void @sodium_memzero(i8* noundef %arraydecay91, i64 noundef 64)
  %arraydecay92 = getelementptr inbounds [32 x i8], [32 x i8]* %kcopy, i64 0, i64 0
  call void @sodium_memzero(i8* noundef %arraydecay92, i64 noundef 32)
  %buf93 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %70 = load i8*, i8** %buf93, align 8
  %71 = load i8*, i8** %c_buf, align 8
  %len94 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %72 = load i64, i64* %len94, align 8
  %mul95 = mul i64 %72, 1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %70, i8* align 1 %71, i64 %mul95, i1 false)
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @_crypto_core_salsa20(%struct.uint8ptr_wrapped_ty* noundef %output, %struct.uint8ptr_wrapped_ty* noundef %input, %struct.uint8ptr_wrapped_ty* noundef %k) #0 {
entry:
  %output.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %output, i32 0, i32 1
  %output.field0.length = load i64, i64* %output.field0.length.ptr, align 8
  %input.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %input, i32 0, i32 1
  %input.field0.length = load i64, i64* %input.field0.length.ptr, align 8
  %k.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 1
  %k.field0.length = load i64, i64* %k.field0.length.ptr, align 8
  %add.ptr50.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr47.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr44.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped11 = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr31.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr28.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr25.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr22.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr19.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr16.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped9 = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr179.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr177.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr175.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr173.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr171.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr169.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr167.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr165.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr163.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr161.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr159.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr157.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr155.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr153.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr151.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.1 = alloca i1, align 1
  store i1 false, i1* %out.1, align 1
  %out.2 = alloca i1, align 1
  store i1 false, i1* %out.2, align 1
  %out.3 = alloca i1, align 1
  store i1 false, i1* %out.3, align 1
  %out.4 = alloca i1, align 1
  store i1 false, i1* %out.4, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.3, align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %output, i32 0, i32 0
  %output.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %input, i32 0, i32 0
  %input.unwrapped = load i8*, i8** %1, align 8
  %2 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 0
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
  call void @llvm.var.annotation(i8* %output.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 15, i8* null)
  store i8* %input.unwrapped, i8** %input.addr, align 8
  %input.addr2 = bitcast i8** %input.addr to i8*
  call void @llvm.var.annotation(i8* %input.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 16, i8* null)
  store i8* %k.unwrapped, i8** %k.addr, align 8
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
  %3 = load i32, i32* %x0, align 4
  store i32 %3, i32* %j0, align 4
  %j59 = bitcast i32* %j5 to i8*
  call void @llvm.var.annotation(i8* %j59, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 25, i8* null)
  %4 = load i32, i32* %x5, align 4
  store i32 %4, i32* %j5, align 4
  %j1010 = bitcast i32* %j10 to i8*
  call void @llvm.var.annotation(i8* %j1010, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 26, i8* null)
  %5 = load i32, i32* %x10, align 4
  store i32 %5, i32* %j10, align 4
  %j1511 = bitcast i32* %j15 to i8*
  call void @llvm.var.annotation(i8* %j1511, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 27, i8* null)
  %6 = load i32, i32* %x15, align 4
  store i32 %6, i32* %j15, align 4
  %x112 = bitcast i32* %x1 to i8*
  call void @llvm.var.annotation(i8* %x112, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 29, i8* null)
  %7 = load i8*, i8** %k.addr, align 8
  %arg.unwrapped10 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped9, i32 0, i32 0
  %arg.wrapped9.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped9, i32 0, i32 1
  store i64 0, i64* %arg.wrapped9.field0.length.ptr, align 8
  store i8* %7, i8** %arg.unwrapped10, align 8
  %call = call i32 @load32_le(%struct.uint8ptr_wrapped_ty* %arg.wrapped9)
  store i32 %call, i32* %x1, align 4
  %x213 = bitcast i32* %x2 to i8*
  call void @llvm.var.annotation(i8* %x213, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 30, i8* null)
  %8 = load i8*, i8** %k.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %8, i64 4
  %add.ptr.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 0
  %add.ptr.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr, i8** %add.ptr.unwrapped, align 8
  %call14 = call i32 @load32_le(%struct.uint8ptr_wrapped_ty* %add.ptr.wrapped)
  store i32 %call14, i32* %x2, align 4
  %x315 = bitcast i32* %x3 to i8*
  call void @llvm.var.annotation(i8* %x315, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 31, i8* null)
  %9 = load i8*, i8** %k.addr, align 8
  %add.ptr16 = getelementptr inbounds i8, i8* %9, i64 8
  %add.ptr16.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr16.wrapped, i32 0, i32 0
  %add.ptr16.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr16.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr16.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr16, i8** %add.ptr16.unwrapped, align 8
  %call17 = call i32 @load32_le(%struct.uint8ptr_wrapped_ty* %add.ptr16.wrapped)
  store i32 %call17, i32* %x3, align 4
  %x418 = bitcast i32* %x4 to i8*
  call void @llvm.var.annotation(i8* %x418, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 32, i8* null)
  %10 = load i8*, i8** %k.addr, align 8
  %add.ptr19 = getelementptr inbounds i8, i8* %10, i64 12
  %add.ptr19.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr19.wrapped, i32 0, i32 0
  %add.ptr19.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr19.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr19.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr19, i8** %add.ptr19.unwrapped, align 8
  %call20 = call i32 @load32_le(%struct.uint8ptr_wrapped_ty* %add.ptr19.wrapped)
  store i32 %call20, i32* %x4, align 4
  %x1121 = bitcast i32* %x11 to i8*
  call void @llvm.var.annotation(i8* %x1121, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 34, i8* null)
  %11 = load i8*, i8** %k.addr, align 8
  %add.ptr22 = getelementptr inbounds i8, i8* %11, i64 16
  %add.ptr22.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr22.wrapped, i32 0, i32 0
  %add.ptr22.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr22.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr22.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr22, i8** %add.ptr22.unwrapped, align 8
  %call23 = call i32 @load32_le(%struct.uint8ptr_wrapped_ty* %add.ptr22.wrapped)
  store i32 %call23, i32* %x11, align 4
  %x1224 = bitcast i32* %x12 to i8*
  call void @llvm.var.annotation(i8* %x1224, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 35, i8* null)
  %12 = load i8*, i8** %k.addr, align 8
  %add.ptr25 = getelementptr inbounds i8, i8* %12, i64 20
  %add.ptr25.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr25.wrapped, i32 0, i32 0
  %add.ptr25.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr25.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr25.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr25, i8** %add.ptr25.unwrapped, align 8
  %call26 = call i32 @load32_le(%struct.uint8ptr_wrapped_ty* %add.ptr25.wrapped)
  store i32 %call26, i32* %x12, align 4
  %x1327 = bitcast i32* %x13 to i8*
  call void @llvm.var.annotation(i8* %x1327, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 36, i8* null)
  %13 = load i8*, i8** %k.addr, align 8
  %add.ptr28 = getelementptr inbounds i8, i8* %13, i64 24
  %add.ptr28.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr28.wrapped, i32 0, i32 0
  %add.ptr28.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr28.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr28.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr28, i8** %add.ptr28.unwrapped, align 8
  %call29 = call i32 @load32_le(%struct.uint8ptr_wrapped_ty* %add.ptr28.wrapped)
  store i32 %call29, i32* %x13, align 4
  %x1430 = bitcast i32* %x14 to i8*
  call void @llvm.var.annotation(i8* %x1430, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 37, i8* null)
  %14 = load i8*, i8** %k.addr, align 8
  %add.ptr31 = getelementptr inbounds i8, i8* %14, i64 28
  %add.ptr31.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr31.wrapped, i32 0, i32 0
  %add.ptr31.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr31.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr31.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr31, i8** %add.ptr31.unwrapped, align 8
  %call32 = call i32 @load32_le(%struct.uint8ptr_wrapped_ty* %add.ptr31.wrapped)
  store i32 %call32, i32* %x14, align 4
  %j133 = bitcast i32* %j1 to i8*
  call void @llvm.var.annotation(i8* %j133, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 39, i8* null)
  %15 = load i32, i32* %x1, align 4
  store i32 %15, i32* %j1, align 4
  %j234 = bitcast i32* %j2 to i8*
  call void @llvm.var.annotation(i8* %j234, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 40, i8* null)
  %16 = load i32, i32* %x2, align 4
  store i32 %16, i32* %j2, align 4
  %j335 = bitcast i32* %j3 to i8*
  call void @llvm.var.annotation(i8* %j335, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 41, i8* null)
  %17 = load i32, i32* %x3, align 4
  store i32 %17, i32* %j3, align 4
  %j436 = bitcast i32* %j4 to i8*
  call void @llvm.var.annotation(i8* %j436, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 42, i8* null)
  %18 = load i32, i32* %x4, align 4
  store i32 %18, i32* %j4, align 4
  %j1137 = bitcast i32* %j11 to i8*
  call void @llvm.var.annotation(i8* %j1137, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 43, i8* null)
  %19 = load i32, i32* %x11, align 4
  store i32 %19, i32* %j11, align 4
  %j1238 = bitcast i32* %j12 to i8*
  call void @llvm.var.annotation(i8* %j1238, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 44, i8* null)
  %20 = load i32, i32* %x12, align 4
  store i32 %20, i32* %j12, align 4
  %j1339 = bitcast i32* %j13 to i8*
  call void @llvm.var.annotation(i8* %j1339, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 45, i8* null)
  %21 = load i32, i32* %x13, align 4
  store i32 %21, i32* %j13, align 4
  %j1440 = bitcast i32* %j14 to i8*
  call void @llvm.var.annotation(i8* %j1440, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 46, i8* null)
  %22 = load i32, i32* %x14, align 4
  store i32 %22, i32* %j14, align 4
  %x641 = bitcast i32* %x6 to i8*
  call void @llvm.var.annotation(i8* %x641, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 48, i8* null)
  %23 = load i8*, i8** %input.addr, align 8
  %arg.unwrapped12 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped11, i32 0, i32 0
  %arg.wrapped11.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped11, i32 0, i32 1
  store i64 0, i64* %arg.wrapped11.field0.length.ptr, align 8
  store i8* %23, i8** %arg.unwrapped12, align 8
  %call42 = call i32 @load32_le(%struct.uint8ptr_wrapped_ty* %arg.wrapped11)
  store i32 %call42, i32* %x6, align 4
  %x743 = bitcast i32* %x7 to i8*
  call void @llvm.var.annotation(i8* %x743, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 49, i8* null)
  %24 = load i8*, i8** %input.addr, align 8
  %add.ptr44 = getelementptr inbounds i8, i8* %24, i64 4
  %add.ptr44.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr44.wrapped, i32 0, i32 0
  %add.ptr44.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr44.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr44.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr44, i8** %add.ptr44.unwrapped, align 8
  %call45 = call i32 @load32_le(%struct.uint8ptr_wrapped_ty* %add.ptr44.wrapped)
  store i32 %call45, i32* %x7, align 4
  %x846 = bitcast i32* %x8 to i8*
  call void @llvm.var.annotation(i8* %x846, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 50, i8* null)
  %25 = load i8*, i8** %input.addr, align 8
  %add.ptr47 = getelementptr inbounds i8, i8* %25, i64 8
  %add.ptr47.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr47.wrapped, i32 0, i32 0
  %add.ptr47.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr47.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr47.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr47, i8** %add.ptr47.unwrapped, align 8
  %call48 = call i32 @load32_le(%struct.uint8ptr_wrapped_ty* %add.ptr47.wrapped)
  store i32 %call48, i32* %x8, align 4
  %x949 = bitcast i32* %x9 to i8*
  call void @llvm.var.annotation(i8* %x949, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 51, i8* null)
  %26 = load i8*, i8** %input.addr, align 8
  %add.ptr50 = getelementptr inbounds i8, i8* %26, i64 12
  %add.ptr50.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr50.wrapped, i32 0, i32 0
  %add.ptr50.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr50.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr50.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr50, i8** %add.ptr50.unwrapped, align 8
  %call51 = call i32 @load32_le(%struct.uint8ptr_wrapped_ty* %add.ptr50.wrapped)
  store i32 %call51, i32* %x9, align 4
  %j652 = bitcast i32* %j6 to i8*
  call void @llvm.var.annotation(i8* %j652, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 53, i8* null)
  %27 = load i32, i32* %x6, align 4
  store i32 %27, i32* %j6, align 4
  %j753 = bitcast i32* %j7 to i8*
  call void @llvm.var.annotation(i8* %j753, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 54, i8* null)
  %28 = load i32, i32* %x7, align 4
  store i32 %28, i32* %j7, align 4
  %j854 = bitcast i32* %j8 to i8*
  call void @llvm.var.annotation(i8* %j854, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 55, i8* null)
  %29 = load i32, i32* %x8, align 4
  store i32 %29, i32* %j8, align 4
  %j955 = bitcast i32* %j9 to i8*
  call void @llvm.var.annotation(i8* %j955, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 56, i8* null)
  %30 = load i32, i32* %x9, align 4
  store i32 %30, i32* %j9, align 4
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %31 = load i1, i1* %out.3, align 1
  %32 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %32
  %cond.fold = or i1 %fwcond.and.fwtaken, %31
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp ult i32 %i.0.rewritten, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %33 = load i1, i1* %out.1, align 1
  %in. = and i1 %33, %cmp
  %cond.fold5 = or i1 false, %in.
  store i1 %cond.fold5, i1* %out.2, align 1
  %34 = load i32, i32* %x0, align 4
  %35 = load i32, i32* %x12, align 4
  %add = add i32 %34, %35
  %call56 = call i32 @rotl32(i32 noundef %add, i32 noundef 7)
  %36 = load i32, i32* %x4, align 4
  %xor = xor i32 %36, %call56
  store i32 %xor, i32* %x4, align 4
  %37 = load i32, i32* %x4, align 4
  %38 = load i32, i32* %x0, align 4
  %add57 = add i32 %37, %38
  %call58 = call i32 @rotl32(i32 noundef %add57, i32 noundef 9)
  %39 = load i32, i32* %x8, align 4
  %xor59 = xor i32 %39, %call58
  store i32 %xor59, i32* %x8, align 4
  %40 = load i32, i32* %x8, align 4
  %41 = load i32, i32* %x4, align 4
  %add60 = add i32 %40, %41
  %call61 = call i32 @rotl32(i32 noundef %add60, i32 noundef 13)
  %42 = load i32, i32* %x12, align 4
  %xor62 = xor i32 %42, %call61
  store i32 %xor62, i32* %x12, align 4
  %43 = load i32, i32* %x12, align 4
  %44 = load i32, i32* %x8, align 4
  %add63 = add i32 %43, %44
  %call64 = call i32 @rotl32(i32 noundef %add63, i32 noundef 18)
  %45 = load i32, i32* %x0, align 4
  %xor65 = xor i32 %45, %call64
  store i32 %xor65, i32* %x0, align 4
  %46 = load i32, i32* %x5, align 4
  %47 = load i32, i32* %x1, align 4
  %add66 = add i32 %46, %47
  %call67 = call i32 @rotl32(i32 noundef %add66, i32 noundef 7)
  %48 = load i32, i32* %x9, align 4
  %xor68 = xor i32 %48, %call67
  store i32 %xor68, i32* %x9, align 4
  %49 = load i32, i32* %x9, align 4
  %50 = load i32, i32* %x5, align 4
  %add69 = add i32 %49, %50
  %call70 = call i32 @rotl32(i32 noundef %add69, i32 noundef 9)
  %51 = load i32, i32* %x13, align 4
  %xor71 = xor i32 %51, %call70
  store i32 %xor71, i32* %x13, align 4
  %52 = load i32, i32* %x13, align 4
  %53 = load i32, i32* %x9, align 4
  %add72 = add i32 %52, %53
  %call73 = call i32 @rotl32(i32 noundef %add72, i32 noundef 13)
  %54 = load i32, i32* %x1, align 4
  %xor74 = xor i32 %54, %call73
  store i32 %xor74, i32* %x1, align 4
  %55 = load i32, i32* %x1, align 4
  %56 = load i32, i32* %x13, align 4
  %add75 = add i32 %55, %56
  %call76 = call i32 @rotl32(i32 noundef %add75, i32 noundef 18)
  %57 = load i32, i32* %x5, align 4
  %xor77 = xor i32 %57, %call76
  store i32 %xor77, i32* %x5, align 4
  %58 = load i32, i32* %x10, align 4
  %59 = load i32, i32* %x6, align 4
  %add78 = add i32 %58, %59
  %call79 = call i32 @rotl32(i32 noundef %add78, i32 noundef 7)
  %60 = load i32, i32* %x14, align 4
  %xor80 = xor i32 %60, %call79
  store i32 %xor80, i32* %x14, align 4
  %61 = load i32, i32* %x14, align 4
  %62 = load i32, i32* %x10, align 4
  %add81 = add i32 %61, %62
  %call82 = call i32 @rotl32(i32 noundef %add81, i32 noundef 9)
  %63 = load i32, i32* %x2, align 4
  %xor83 = xor i32 %63, %call82
  store i32 %xor83, i32* %x2, align 4
  %64 = load i32, i32* %x2, align 4
  %65 = load i32, i32* %x14, align 4
  %add84 = add i32 %64, %65
  %call85 = call i32 @rotl32(i32 noundef %add84, i32 noundef 13)
  %66 = load i32, i32* %x6, align 4
  %xor86 = xor i32 %66, %call85
  store i32 %xor86, i32* %x6, align 4
  %67 = load i32, i32* %x6, align 4
  %68 = load i32, i32* %x2, align 4
  %add87 = add i32 %67, %68
  %call88 = call i32 @rotl32(i32 noundef %add87, i32 noundef 18)
  %69 = load i32, i32* %x10, align 4
  %xor89 = xor i32 %69, %call88
  store i32 %xor89, i32* %x10, align 4
  %70 = load i32, i32* %x15, align 4
  %71 = load i32, i32* %x11, align 4
  %add90 = add i32 %70, %71
  %call91 = call i32 @rotl32(i32 noundef %add90, i32 noundef 7)
  %72 = load i32, i32* %x3, align 4
  %xor92 = xor i32 %72, %call91
  store i32 %xor92, i32* %x3, align 4
  %73 = load i32, i32* %x3, align 4
  %74 = load i32, i32* %x15, align 4
  %add93 = add i32 %73, %74
  %call94 = call i32 @rotl32(i32 noundef %add93, i32 noundef 9)
  %75 = load i32, i32* %x7, align 4
  %xor95 = xor i32 %75, %call94
  store i32 %xor95, i32* %x7, align 4
  %76 = load i32, i32* %x7, align 4
  %77 = load i32, i32* %x3, align 4
  %add96 = add i32 %76, %77
  %call97 = call i32 @rotl32(i32 noundef %add96, i32 noundef 13)
  %78 = load i32, i32* %x11, align 4
  %xor98 = xor i32 %78, %call97
  store i32 %xor98, i32* %x11, align 4
  %79 = load i32, i32* %x11, align 4
  %80 = load i32, i32* %x7, align 4
  %add99 = add i32 %79, %80
  %call100 = call i32 @rotl32(i32 noundef %add99, i32 noundef 18)
  %81 = load i32, i32* %x15, align 4
  %xor101 = xor i32 %81, %call100
  store i32 %xor101, i32* %x15, align 4
  %82 = load i32, i32* %x0, align 4
  %83 = load i32, i32* %x3, align 4
  %add102 = add i32 %82, %83
  %call103 = call i32 @rotl32(i32 noundef %add102, i32 noundef 7)
  %84 = load i32, i32* %x1, align 4
  %xor104 = xor i32 %84, %call103
  store i32 %xor104, i32* %x1, align 4
  %85 = load i32, i32* %x1, align 4
  %86 = load i32, i32* %x0, align 4
  %add105 = add i32 %85, %86
  %call106 = call i32 @rotl32(i32 noundef %add105, i32 noundef 9)
  %87 = load i32, i32* %x2, align 4
  %xor107 = xor i32 %87, %call106
  store i32 %xor107, i32* %x2, align 4
  %88 = load i32, i32* %x2, align 4
  %89 = load i32, i32* %x1, align 4
  %add108 = add i32 %88, %89
  %call109 = call i32 @rotl32(i32 noundef %add108, i32 noundef 13)
  %90 = load i32, i32* %x3, align 4
  %xor110 = xor i32 %90, %call109
  store i32 %xor110, i32* %x3, align 4
  %91 = load i32, i32* %x3, align 4
  %92 = load i32, i32* %x2, align 4
  %add111 = add i32 %91, %92
  %call112 = call i32 @rotl32(i32 noundef %add111, i32 noundef 18)
  %93 = load i32, i32* %x0, align 4
  %xor113 = xor i32 %93, %call112
  store i32 %xor113, i32* %x0, align 4
  %94 = load i32, i32* %x5, align 4
  %95 = load i32, i32* %x4, align 4
  %add114 = add i32 %94, %95
  %call115 = call i32 @rotl32(i32 noundef %add114, i32 noundef 7)
  %96 = load i32, i32* %x6, align 4
  %xor116 = xor i32 %96, %call115
  store i32 %xor116, i32* %x6, align 4
  %97 = load i32, i32* %x6, align 4
  %98 = load i32, i32* %x5, align 4
  %add117 = add i32 %97, %98
  %call118 = call i32 @rotl32(i32 noundef %add117, i32 noundef 9)
  %99 = load i32, i32* %x7, align 4
  %xor119 = xor i32 %99, %call118
  store i32 %xor119, i32* %x7, align 4
  %100 = load i32, i32* %x7, align 4
  %101 = load i32, i32* %x6, align 4
  %add120 = add i32 %100, %101
  %call121 = call i32 @rotl32(i32 noundef %add120, i32 noundef 13)
  %102 = load i32, i32* %x4, align 4
  %xor122 = xor i32 %102, %call121
  store i32 %xor122, i32* %x4, align 4
  %103 = load i32, i32* %x4, align 4
  %104 = load i32, i32* %x7, align 4
  %add123 = add i32 %103, %104
  %call124 = call i32 @rotl32(i32 noundef %add123, i32 noundef 18)
  %105 = load i32, i32* %x5, align 4
  %xor125 = xor i32 %105, %call124
  store i32 %xor125, i32* %x5, align 4
  %106 = load i32, i32* %x10, align 4
  %107 = load i32, i32* %x9, align 4
  %add126 = add i32 %106, %107
  %call127 = call i32 @rotl32(i32 noundef %add126, i32 noundef 7)
  %108 = load i32, i32* %x11, align 4
  %xor128 = xor i32 %108, %call127
  store i32 %xor128, i32* %x11, align 4
  %109 = load i32, i32* %x11, align 4
  %110 = load i32, i32* %x10, align 4
  %add129 = add i32 %109, %110
  %call130 = call i32 @rotl32(i32 noundef %add129, i32 noundef 9)
  %111 = load i32, i32* %x8, align 4
  %xor131 = xor i32 %111, %call130
  store i32 %xor131, i32* %x8, align 4
  %112 = load i32, i32* %x8, align 4
  %113 = load i32, i32* %x11, align 4
  %add132 = add i32 %112, %113
  %call133 = call i32 @rotl32(i32 noundef %add132, i32 noundef 13)
  %114 = load i32, i32* %x9, align 4
  %xor134 = xor i32 %114, %call133
  store i32 %xor134, i32* %x9, align 4
  %115 = load i32, i32* %x9, align 4
  %116 = load i32, i32* %x8, align 4
  %add135 = add i32 %115, %116
  %call136 = call i32 @rotl32(i32 noundef %add135, i32 noundef 18)
  %117 = load i32, i32* %x10, align 4
  %xor137 = xor i32 %117, %call136
  store i32 %xor137, i32* %x10, align 4
  %118 = load i32, i32* %x15, align 4
  %119 = load i32, i32* %x14, align 4
  %add138 = add i32 %118, %119
  %call139 = call i32 @rotl32(i32 noundef %add138, i32 noundef 7)
  %120 = load i32, i32* %x12, align 4
  %xor140 = xor i32 %120, %call139
  store i32 %xor140, i32* %x12, align 4
  %121 = load i32, i32* %x12, align 4
  %122 = load i32, i32* %x15, align 4
  %add141 = add i32 %121, %122
  %call142 = call i32 @rotl32(i32 noundef %add141, i32 noundef 9)
  %123 = load i32, i32* %x13, align 4
  %xor143 = xor i32 %123, %call142
  store i32 %xor143, i32* %x13, align 4
  %124 = load i32, i32* %x13, align 4
  %125 = load i32, i32* %x12, align 4
  %add144 = add i32 %124, %125
  %call145 = call i32 @rotl32(i32 noundef %add144, i32 noundef 13)
  %126 = load i32, i32* %x14, align 4
  %xor146 = xor i32 %126, %call145
  store i32 %xor146, i32* %x14, align 4
  %127 = load i32, i32* %x14, align 4
  %128 = load i32, i32* %x13, align 4
  %add147 = add i32 %127, %128
  %call148 = call i32 @rotl32(i32 noundef %add147, i32 noundef 18)
  %129 = load i32, i32* %x15, align 4
  %xor149 = xor i32 %129, %call148
  store i32 %xor149, i32* %x15, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %130 = load i1, i1* %out.2, align 1
  %cond.fold6 = or i1 false, %130
  store i1 %cond.fold6, i1* %out.3, align 1
  %inc = add i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !17

for.end:                                          ; preds = %for.cond
  %131 = load i1, i1* %out.1, align 1
  %132 = xor i1 %cmp, true
  %in.7 = and i1 %131, %132
  %cond.fold8 = or i1 false, %in.7
  store i1 %cond.fold8, i1* %out.4, align 1
  %133 = load i8*, i8** %output.addr, align 8
  %134 = load i32, i32* %x0, align 4
  %135 = load i32, i32* %j0, align 4
  %add150 = add i32 %134, %135
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %133, i8** %arg.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 %add150)
  %136 = load i8*, i8** %output.addr, align 8
  %add.ptr151 = getelementptr inbounds i8, i8* %136, i64 4
  %137 = load i32, i32* %x1, align 4
  %138 = load i32, i32* %j1, align 4
  %add152 = add i32 %137, %138
  %add.ptr151.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr151.wrapped, i32 0, i32 0
  %add.ptr151.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr151.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr151.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr151, i8** %add.ptr151.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr151.wrapped, i32 %add152)
  %139 = load i8*, i8** %output.addr, align 8
  %add.ptr153 = getelementptr inbounds i8, i8* %139, i64 8
  %140 = load i32, i32* %x2, align 4
  %141 = load i32, i32* %j2, align 4
  %add154 = add i32 %140, %141
  %add.ptr153.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr153.wrapped, i32 0, i32 0
  %add.ptr153.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr153.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr153.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr153, i8** %add.ptr153.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr153.wrapped, i32 %add154)
  %142 = load i8*, i8** %output.addr, align 8
  %add.ptr155 = getelementptr inbounds i8, i8* %142, i64 12
  %143 = load i32, i32* %x3, align 4
  %144 = load i32, i32* %j3, align 4
  %add156 = add i32 %143, %144
  %add.ptr155.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr155.wrapped, i32 0, i32 0
  %add.ptr155.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr155.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr155.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr155, i8** %add.ptr155.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr155.wrapped, i32 %add156)
  %145 = load i8*, i8** %output.addr, align 8
  %add.ptr157 = getelementptr inbounds i8, i8* %145, i64 16
  %146 = load i32, i32* %x4, align 4
  %147 = load i32, i32* %j4, align 4
  %add158 = add i32 %146, %147
  %add.ptr157.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr157.wrapped, i32 0, i32 0
  %add.ptr157.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr157.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr157.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr157, i8** %add.ptr157.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr157.wrapped, i32 %add158)
  %148 = load i8*, i8** %output.addr, align 8
  %add.ptr159 = getelementptr inbounds i8, i8* %148, i64 20
  %149 = load i32, i32* %x5, align 4
  %150 = load i32, i32* %j5, align 4
  %add160 = add i32 %149, %150
  %add.ptr159.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr159.wrapped, i32 0, i32 0
  %add.ptr159.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr159.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr159.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr159, i8** %add.ptr159.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr159.wrapped, i32 %add160)
  %151 = load i8*, i8** %output.addr, align 8
  %add.ptr161 = getelementptr inbounds i8, i8* %151, i64 24
  %152 = load i32, i32* %x6, align 4
  %153 = load i32, i32* %j6, align 4
  %add162 = add i32 %152, %153
  %add.ptr161.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr161.wrapped, i32 0, i32 0
  %add.ptr161.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr161.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr161.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr161, i8** %add.ptr161.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr161.wrapped, i32 %add162)
  %154 = load i8*, i8** %output.addr, align 8
  %add.ptr163 = getelementptr inbounds i8, i8* %154, i64 28
  %155 = load i32, i32* %x7, align 4
  %156 = load i32, i32* %j7, align 4
  %add164 = add i32 %155, %156
  %add.ptr163.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr163.wrapped, i32 0, i32 0
  %add.ptr163.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr163.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr163.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr163, i8** %add.ptr163.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr163.wrapped, i32 %add164)
  %157 = load i8*, i8** %output.addr, align 8
  %add.ptr165 = getelementptr inbounds i8, i8* %157, i64 32
  %158 = load i32, i32* %x8, align 4
  %159 = load i32, i32* %j8, align 4
  %add166 = add i32 %158, %159
  %add.ptr165.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr165.wrapped, i32 0, i32 0
  %add.ptr165.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr165.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr165.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr165, i8** %add.ptr165.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr165.wrapped, i32 %add166)
  %160 = load i8*, i8** %output.addr, align 8
  %add.ptr167 = getelementptr inbounds i8, i8* %160, i64 36
  %161 = load i32, i32* %x9, align 4
  %162 = load i32, i32* %j9, align 4
  %add168 = add i32 %161, %162
  %add.ptr167.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr167.wrapped, i32 0, i32 0
  %add.ptr167.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr167.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr167.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr167, i8** %add.ptr167.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr167.wrapped, i32 %add168)
  %163 = load i8*, i8** %output.addr, align 8
  %add.ptr169 = getelementptr inbounds i8, i8* %163, i64 40
  %164 = load i32, i32* %x10, align 4
  %165 = load i32, i32* %j10, align 4
  %add170 = add i32 %164, %165
  %add.ptr169.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr169.wrapped, i32 0, i32 0
  %add.ptr169.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr169.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr169.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr169, i8** %add.ptr169.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr169.wrapped, i32 %add170)
  %166 = load i8*, i8** %output.addr, align 8
  %add.ptr171 = getelementptr inbounds i8, i8* %166, i64 44
  %167 = load i32, i32* %x11, align 4
  %168 = load i32, i32* %j11, align 4
  %add172 = add i32 %167, %168
  %add.ptr171.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr171.wrapped, i32 0, i32 0
  %add.ptr171.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr171.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr171.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr171, i8** %add.ptr171.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr171.wrapped, i32 %add172)
  %169 = load i8*, i8** %output.addr, align 8
  %add.ptr173 = getelementptr inbounds i8, i8* %169, i64 48
  %170 = load i32, i32* %x12, align 4
  %171 = load i32, i32* %j12, align 4
  %add174 = add i32 %170, %171
  %add.ptr173.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr173.wrapped, i32 0, i32 0
  %add.ptr173.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr173.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr173.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr173, i8** %add.ptr173.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr173.wrapped, i32 %add174)
  %172 = load i8*, i8** %output.addr, align 8
  %add.ptr175 = getelementptr inbounds i8, i8* %172, i64 52
  %173 = load i32, i32* %x13, align 4
  %174 = load i32, i32* %j13, align 4
  %add176 = add i32 %173, %174
  %add.ptr175.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr175.wrapped, i32 0, i32 0
  %add.ptr175.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr175.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr175.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr175, i8** %add.ptr175.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr175.wrapped, i32 %add176)
  %175 = load i8*, i8** %output.addr, align 8
  %add.ptr177 = getelementptr inbounds i8, i8* %175, i64 56
  %176 = load i32, i32* %x14, align 4
  %177 = load i32, i32* %j14, align 4
  %add178 = add i32 %176, %177
  %add.ptr177.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr177.wrapped, i32 0, i32 0
  %add.ptr177.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr177.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr177.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr177, i8** %add.ptr177.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr177.wrapped, i32 %add178)
  %178 = load i8*, i8** %output.addr, align 8
  %add.ptr179 = getelementptr inbounds i8, i8* %178, i64 60
  %179 = load i32, i32* %x15, align 4
  %180 = load i32, i32* %j15, align 4
  %add180 = add i32 %179, %180
  %add.ptr179.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr179.wrapped, i32 0, i32 0
  %add.ptr179.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr179.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr179.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr179, i8** %add.ptr179.unwrapped, align 8
  call void @store32_le(%struct.uint8ptr_wrapped_ty* %add.ptr179.wrapped, i32 %add180)
  ret void
}

declare void @sodium_memzero(i8* noundef, i64 noundef) #5

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @load32_le(%struct.uint8ptr_wrapped_ty* noundef %src) #0 {
entry:
  %src.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %src, i32 0, i32 1
  %src.field0.length = load i64, i64* %src.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %src, i32 0, i32 0
  %src.unwrapped = load i8*, i8** %0, align 8
  %arrayidx = getelementptr inbounds i8, i8* %src.unwrapped, i64 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %1 to i32
  %arrayidx1 = getelementptr inbounds i8, i8* %src.unwrapped, i64 1
  %2 = load i8, i8* %arrayidx1, align 1
  %conv2 = zext i8 %2 to i32
  %shl = shl i32 %conv2, 8
  %or = or i32 %conv, %shl
  %arrayidx3 = getelementptr inbounds i8, i8* %src.unwrapped, i64 2
  %3 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %3 to i32
  %shl5 = shl i32 %conv4, 16
  %or6 = or i32 %or, %shl5
  %arrayidx7 = getelementptr inbounds i8, i8* %src.unwrapped, i64 3
  %4 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %4 to i32
  %shl9 = shl i32 %conv8, 24
  %or10 = or i32 %or6, %shl9
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 %or10
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @rotl32(i32 noundef %x, i32 noundef %b) #0 {
entry:
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %shl = shl i32 %x, %b
  %sub = sub nsw i32 32, %b
  %shr = lshr i32 %x, %sub
  %or = or i32 %shl, %shr
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 %or
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @store32_le(%struct.uint8ptr_wrapped_ty* noundef %dst, i32 noundef %w) #0 {
entry:
  %dst.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %dst, i32 0, i32 1
  %dst.field0.length = load i64, i64* %dst.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %dst, i32 0, i32 0
  %dst.unwrapped = load i8*, i8** %0, align 8
  %conv = trunc i32 %w to i8
  %arrayidx = getelementptr inbounds i8, i8* %dst.unwrapped, i64 0
  store i8 %conv, i8* %arrayidx, align 1
  %shr = lshr i32 %w, 8
  %conv1 = trunc i32 %shr to i8
  %arrayidx2 = getelementptr inbounds i8, i8* %dst.unwrapped, i64 1
  store i8 %conv1, i8* %arrayidx2, align 1
  %shr3 = lshr i32 %shr, 8
  %conv4 = trunc i32 %shr3 to i8
  %arrayidx5 = getelementptr inbounds i8, i8* %dst.unwrapped, i64 2
  store i8 %conv4, i8* %arrayidx5, align 1
  %shr6 = lshr i32 %shr3, 8
  %conv7 = trunc i32 %shr6 to i8
  %arrayidx8 = getelementptr inbounds i8, i8* %dst.unwrapped, i64 3
  store i8 %conv7, i8* %arrayidx8, align 1
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @_poly1305_blocks(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %m) #0 {
entry:
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %m.field0.length = load i64, i64* %m.field0.length.ptr, align 8
  %add.ptr29.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.1 = alloca i1, align 1
  store i1 false, i1* %out.1, align 1
  %out.2 = alloca i1, align 1
  store i1 false, i1* %out.2, align 1
  %out.3 = alloca i1, align 1
  store i1 false, i1* %out.3, align 1
  %out.4 = alloca i1, align 1
  store i1 false, i1* %out.4, align 1
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
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.3, align 1
  %m_buf1 = bitcast i8** %m_buf to i8*
  call void @llvm.var.annotation(i8* %m_buf1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 12, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %m_buf, align 8
  %hibit2 = bitcast i64* %hibit to i8*
  call void @llvm.var.annotation(i8* %hibit2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 18, i8* null)
  %final = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 5
  %1 = call i8* @llvm.ptr.annotation.p0i8(i8* %final, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 18, i8* null)
  %2 = load i8, i8* %1, align 8
  %conv = zext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  %3 = zext i1 %cmp to i64
  %cond = select i1 %cmp, i64 0, i64 1099511627776
  store i64 %cond, i64* %hibit, align 8
  %r04 = bitcast i64* %r0 to i8*
  call void @llvm.var.annotation(i8* %r04, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 20, i8* null)
  %r = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 0
  %4 = bitcast [3 x i64]* %r to i8*
  %5 = call i8* @llvm.ptr.annotation.p0i8(i8* %4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 13, i8* null)
  %6 = bitcast i8* %5 to [3 x i64]*
  %arrayidx = getelementptr inbounds [3 x i64], [3 x i64]* %6, i64 0, i64 0
  %7 = load i64, i64* %arrayidx, align 8
  store i64 %7, i64* %r0, align 8
  %r15 = bitcast i64* %r1 to i8*
  call void @llvm.var.annotation(i8* %r15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 21, i8* null)
  %r6 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 0
  %8 = bitcast [3 x i64]* %r6 to i8*
  %9 = call i8* @llvm.ptr.annotation.p0i8(i8* %8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 13, i8* null)
  %10 = bitcast i8* %9 to [3 x i64]*
  %arrayidx7 = getelementptr inbounds [3 x i64], [3 x i64]* %10, i64 0, i64 1
  %11 = load i64, i64* %arrayidx7, align 8
  store i64 %11, i64* %r1, align 8
  %r28 = bitcast i64* %r2 to i8*
  call void @llvm.var.annotation(i8* %r28, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 22, i8* null)
  %r9 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 0
  %12 = bitcast [3 x i64]* %r9 to i8*
  %13 = call i8* @llvm.ptr.annotation.p0i8(i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 13, i8* null)
  %14 = bitcast i8* %13 to [3 x i64]*
  %arrayidx10 = getelementptr inbounds [3 x i64], [3 x i64]* %14, i64 0, i64 2
  %15 = load i64, i64* %arrayidx10, align 8
  store i64 %15, i64* %r2, align 8
  %h011 = bitcast i64* %h0 to i8*
  call void @llvm.var.annotation(i8* %h011, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 24, i8* null)
  %h = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %16 = bitcast [3 x i64]* %h to i8*
  %17 = call i8* @llvm.ptr.annotation.p0i8(i8* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 14, i8* null)
  %18 = bitcast i8* %17 to [3 x i64]*
  %arrayidx12 = getelementptr inbounds [3 x i64], [3 x i64]* %18, i64 0, i64 0
  %19 = load i64, i64* %arrayidx12, align 8
  store i64 %19, i64* %h0, align 8
  %h113 = bitcast i64* %h1 to i8*
  call void @llvm.var.annotation(i8* %h113, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 25, i8* null)
  %h14 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %20 = bitcast [3 x i64]* %h14 to i8*
  %21 = call i8* @llvm.ptr.annotation.p0i8(i8* %20, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 14, i8* null)
  %22 = bitcast i8* %21 to [3 x i64]*
  %arrayidx15 = getelementptr inbounds [3 x i64], [3 x i64]* %22, i64 0, i64 1
  %23 = load i64, i64* %arrayidx15, align 8
  store i64 %23, i64* %h1, align 8
  %h216 = bitcast i64* %h2 to i8*
  call void @llvm.var.annotation(i8* %h216, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 26, i8* null)
  %h17 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %24 = bitcast [3 x i64]* %h17 to i8*
  %25 = call i8* @llvm.ptr.annotation.p0i8(i8* %24, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 14, i8* null)
  %26 = bitcast i8* %25 to [3 x i64]*
  %arrayidx18 = getelementptr inbounds [3 x i64], [3 x i64]* %26, i64 0, i64 2
  %27 = load i64, i64* %arrayidx18, align 8
  store i64 %27, i64* %h2, align 8
  %s119 = bitcast i64* %s1 to i8*
  call void @llvm.var.annotation(i8* %s119, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 28, i8* null)
  %28 = load i64, i64* %r1, align 8
  %mul = mul i64 %28, 20
  store i64 %mul, i64* %s1, align 8
  %s220 = bitcast i64* %s2 to i8*
  call void @llvm.var.annotation(i8* %s220, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 29, i8* null)
  %29 = load i64, i64* %r2, align 8
  %mul21 = mul i64 %29, 20
  store i64 %mul21, i64* %s2, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %30 = load i64, i64* %len, align 8
  %div = udiv i64 %30, 16
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %bindex.0.rewritten = phi i64 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp22, %for.inc ], [ false, %entry ]
  %31 = load i1, i1* %out.3, align 1
  %32 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %32
  %cond.fold = or i1 %fwcond.and.fwtaken, %31
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp22 = icmp ult i64 %bindex.0.rewritten, %div
  br i1 %cmp22, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %33 = load i1, i1* %out.1, align 1
  %in. = and i1 %33, %cmp22
  %cond.fold5 = or i1 false, %in.
  store i1 %cond.fold5, i1* %out.2, align 1
  %t024 = bitcast i64* %t0 to i8*
  call void @llvm.var.annotation(i8* %t024, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 33, i8* null)
  %34 = load i8*, i8** %m_buf, align 8
  %mul25 = mul i64 %bindex.0.rewritten, 16
  %add.ptr = getelementptr inbounds i8, i8* %34, i64 %mul25
  %add.ptr.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 0
  %add.ptr.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr, i8** %add.ptr.unwrapped, align 8
  %call = call i64 @load64_le(%struct.uint8ptr_wrapped_ty* %add.ptr.wrapped)
  store i64 %call, i64* %t0, align 8
  %t126 = bitcast i64* %t1 to i8*
  call void @llvm.var.annotation(i8* %t126, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 34, i8* null)
  %35 = load i8*, i8** %m_buf, align 8
  %mul27 = mul i64 %bindex.0.rewritten, 16
  %add.ptr28 = getelementptr inbounds i8, i8* %35, i64 %mul27
  %add.ptr29 = getelementptr inbounds i8, i8* %add.ptr28, i64 8
  %add.ptr29.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr29.wrapped, i32 0, i32 0
  %add.ptr29.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr29.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr29.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr29, i8** %add.ptr29.unwrapped, align 8
  %call30 = call i64 @load64_le(%struct.uint8ptr_wrapped_ty* %add.ptr29.wrapped)
  store i64 %call30, i64* %t1, align 8
  %36 = load i64, i64* %t0, align 8
  %and = and i64 %36, 17592186044415
  %37 = load i64, i64* %h0, align 8
  %add = add i64 %37, %and
  store i64 %add, i64* %h0, align 8
  %38 = load i64, i64* %t0, align 8
  %shr = lshr i64 %38, 44
  %39 = load i64, i64* %t1, align 8
  %shl = shl i64 %39, 20
  %or = or i64 %shr, %shl
  %and31 = and i64 %or, 17592186044415
  %40 = load i64, i64* %h1, align 8
  %add32 = add i64 %40, %and31
  store i64 %add32, i64* %h1, align 8
  %41 = load i64, i64* %t1, align 8
  %shr33 = lshr i64 %41, 24
  %and34 = and i64 %shr33, 4398046511103
  %42 = load i64, i64* %hibit, align 8
  %or35 = or i64 %and34, %42
  %43 = load i64, i64* %h2, align 8
  %add36 = add i64 %43, %or35
  store i64 %add36, i64* %h2, align 8
  %d037 = bitcast i128* %d0 to i8*
  call void @llvm.var.annotation(i8* %d037, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 43, i8* null)
  %44 = load i64, i64* %h0, align 8
  %conv38 = zext i64 %44 to i128
  %45 = load i64, i64* %r0, align 8
  %conv39 = zext i64 %45 to i128
  %mul40 = mul i128 %conv38, %conv39
  %46 = load i64, i64* %h1, align 8
  %conv41 = zext i64 %46 to i128
  %47 = load i64, i64* %s2, align 8
  %conv42 = zext i64 %47 to i128
  %mul43 = mul i128 %conv41, %conv42
  %add44 = add i128 %mul40, %mul43
  %48 = load i64, i64* %h2, align 8
  %conv45 = zext i64 %48 to i128
  %49 = load i64, i64* %s1, align 8
  %conv46 = zext i64 %49 to i128
  %mul47 = mul i128 %conv45, %conv46
  %add48 = add i128 %add44, %mul47
  store i128 %add48, i128* %d0, align 16
  %d149 = bitcast i128* %d1 to i8*
  call void @llvm.var.annotation(i8* %d149, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 47, i8* null)
  %50 = load i64, i64* %h0, align 8
  %conv50 = zext i64 %50 to i128
  %51 = load i64, i64* %r1, align 8
  %conv51 = zext i64 %51 to i128
  %mul52 = mul i128 %conv50, %conv51
  %52 = load i64, i64* %h1, align 8
  %conv53 = zext i64 %52 to i128
  %53 = load i64, i64* %r0, align 8
  %conv54 = zext i64 %53 to i128
  %mul55 = mul i128 %conv53, %conv54
  %add56 = add i128 %mul52, %mul55
  %54 = load i64, i64* %h2, align 8
  %conv57 = zext i64 %54 to i128
  %55 = load i64, i64* %s2, align 8
  %conv58 = zext i64 %55 to i128
  %mul59 = mul i128 %conv57, %conv58
  %add60 = add i128 %add56, %mul59
  store i128 %add60, i128* %d1, align 16
  %d261 = bitcast i128* %d2 to i8*
  call void @llvm.var.annotation(i8* %d261, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 51, i8* null)
  %56 = load i64, i64* %h0, align 8
  %conv62 = zext i64 %56 to i128
  %57 = load i64, i64* %r2, align 8
  %conv63 = zext i64 %57 to i128
  %mul64 = mul i128 %conv62, %conv63
  %58 = load i64, i64* %h1, align 8
  %conv65 = zext i64 %58 to i128
  %59 = load i64, i64* %r1, align 8
  %conv66 = zext i64 %59 to i128
  %mul67 = mul i128 %conv65, %conv66
  %add68 = add i128 %mul64, %mul67
  %60 = load i64, i64* %h2, align 8
  %conv69 = zext i64 %60 to i128
  %61 = load i64, i64* %r0, align 8
  %conv70 = zext i64 %61 to i128
  %mul71 = mul i128 %conv69, %conv70
  %add72 = add i128 %add68, %mul71
  store i128 %add72, i128* %d2, align 16
  %c73 = bitcast i64* %c to i8*
  call void @llvm.var.annotation(i8* %c73, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 56, i8* null)
  %62 = load i128, i128* %d0, align 16
  %shr74 = lshr i128 %62, 44
  %conv75 = trunc i128 %shr74 to i64
  store i64 %conv75, i64* %c, align 8
  %63 = load i128, i128* %d0, align 16
  %conv76 = trunc i128 %63 to i64
  %and77 = and i64 %conv76, 17592186044415
  store i64 %and77, i64* %h0, align 8
  %64 = load i64, i64* %c, align 8
  %conv78 = zext i64 %64 to i128
  %65 = load i128, i128* %d1, align 16
  %add79 = add i128 %65, %conv78
  store i128 %add79, i128* %d1, align 16
  %66 = load i128, i128* %d1, align 16
  %shr80 = lshr i128 %66, 44
  %conv81 = trunc i128 %shr80 to i64
  store i64 %conv81, i64* %c, align 8
  %67 = load i128, i128* %d1, align 16
  %conv82 = trunc i128 %67 to i64
  %and83 = and i64 %conv82, 17592186044415
  store i64 %and83, i64* %h1, align 8
  %68 = load i64, i64* %c, align 8
  %conv84 = zext i64 %68 to i128
  %69 = load i128, i128* %d2, align 16
  %add85 = add i128 %69, %conv84
  store i128 %add85, i128* %d2, align 16
  %70 = load i128, i128* %d2, align 16
  %shr86 = lshr i128 %70, 42
  %conv87 = trunc i128 %shr86 to i64
  store i64 %conv87, i64* %c, align 8
  %71 = load i128, i128* %d2, align 16
  %conv88 = trunc i128 %71 to i64
  %and89 = and i64 %conv88, 4398046511103
  store i64 %and89, i64* %h2, align 8
  %72 = load i64, i64* %c, align 8
  %mul90 = mul i64 %72, 5
  %73 = load i64, i64* %h0, align 8
  %add91 = add i64 %73, %mul90
  store i64 %add91, i64* %h0, align 8
  %74 = load i64, i64* %h0, align 8
  %shr92 = lshr i64 %74, 44
  store i64 %shr92, i64* %c, align 8
  %75 = load i64, i64* %h0, align 8
  %and93 = and i64 %75, 17592186044415
  store i64 %and93, i64* %h0, align 8
  %76 = load i64, i64* %c, align 8
  %77 = load i64, i64* %h1, align 8
  %add94 = add i64 %77, %76
  store i64 %add94, i64* %h1, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %78 = load i1, i1* %out.2, align 1
  %cond.fold6 = or i1 false, %78
  store i1 %cond.fold6, i1* %out.3, align 1
  %inc = add i64 %bindex.0.rewritten, 1
  br label %for.cond, !llvm.loop !18

for.end:                                          ; preds = %for.cond
  %79 = load i1, i1* %out.1, align 1
  %80 = xor i1 %cmp22, true
  %in.7 = and i1 %79, %80
  %cond.fold8 = or i1 false, %in.7
  store i1 %cond.fold8, i1* %out.4, align 1
  %81 = load i64, i64* %h0, align 8
  %h95 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %82 = bitcast [3 x i64]* %h95 to i8*
  %83 = call i8* @llvm.ptr.annotation.p0i8(i8* %82, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 14, i8* null)
  %84 = bitcast i8* %83 to [3 x i64]*
  %arrayidx96 = getelementptr inbounds [3 x i64], [3 x i64]* %84, i64 0, i64 0
  store i64 %81, i64* %arrayidx96, align 8
  %85 = load i64, i64* %h1, align 8
  %h97 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %86 = bitcast [3 x i64]* %h97 to i8*
  %87 = call i8* @llvm.ptr.annotation.p0i8(i8* %86, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 14, i8* null)
  %88 = bitcast i8* %87 to [3 x i64]*
  %arrayidx98 = getelementptr inbounds [3 x i64], [3 x i64]* %88, i64 0, i64 1
  store i64 %85, i64* %arrayidx98, align 8
  %89 = load i64, i64* %h2, align 8
  %h99 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %90 = bitcast [3 x i64]* %h99 to i8*
  %91 = call i8* @llvm.ptr.annotation.p0i8(i8* %90, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 14, i8* null)
  %92 = bitcast i8* %91 to [3 x i64]*
  %arrayidx100 = getelementptr inbounds [3 x i64], [3 x i64]* %92, i64 0, i64 2
  store i64 %89, i64* %arrayidx100, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @_poly1305_update(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %m) #0 {
entry:
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %m.field0.length = load i64, i64* %m.field0.length.ptr, align 8
  %pred.alloca = alloca i1, align 1
  store i1 true, i1* %pred.alloca, align 1
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
  %m_buf = alloca i8*, align 8
  %w_state_buffer = alloca %struct.uint8ptr_wrapped_ty, align 8
  %w_view_m = alloca %struct.uint8ptr_wrapped_ty, align 8
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.18, align 1
  store i1 false, i1* %out.40, align 1
  %m_buf1 = bitcast i8** %m_buf to i8*
  call void @llvm.var.annotation(i8* %m_buf1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 106, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %m_buf, align 8
  %leftover = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %1 = load i64, i64* %leftover, align 8
  %cmp = icmp ne i64 %1, 0
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br i1 %cmp, label %if.then, label %if.end28

if.then:                                          ; preds = %entry
  %2 = load i1, i1* %out., align 1
  %in. = and i1 %2, %cmp
  %cond.fold = or i1 false, %in.
  store i1 %cond.fold, i1* %out.7, align 1
  %leftover2 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %3 = load i64, i64* %leftover2, align 8
  %sub = sub i64 16, %3
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %4 = load i64, i64* %len, align 8
  %cmp3 = icmp ugt i64 %sub, %4
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  %5 = load i1, i1* %out.7, align 1
  %in.44 = and i1 %5, %cmp3
  %cond.fold45 = or i1 false, %in.44
  store i1 %cond.fold45, i1* %out.8, align 1
  %len5 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %6 = load i64, i64* %len5, align 8
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  %want.0.rewritten = phi i64 [ %6, %if.then4 ], [ %sub, %if.then ]
  %7 = load i1, i1* %out.8, align 1
  %8 = load i1, i1* %out.7, align 1
  %9 = xor i1 %cmp3, true
  %in.46 = and i1 %8, %9
  %cond.fold47 = or i1 false, %7
  %cond.fold48 = or i1 %cond.fold47, %in.46
  store i1 %cond.fold48, i1* %out.9, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0.rewritten = phi i64 [ 0, %if.end ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %if.end ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp6, %for.inc ], [ false, %if.end ]
  %exitpred.frozen1.rewritten = phi i1 [ %cmp8, %for.inc ], [ false, %if.end ]
  %exitpred.frozen2.rewritten = phi i1 [ %cmp12, %for.inc ], [ false, %if.end ]
  %10 = load i1, i1* %out.18, align 1
  %11 = load i1, i1* %out.9, align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %11
  %cond.fold49 = or i1 %fwcond.and.fwtaken, %10
  store i1 %cond.fold49, i1* %out.10, align 1
  %cmp6 = icmp ult i64 %i.0.rewritten, %want.0.rewritten
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load i1, i1* %out.10, align 1
  %in.50 = and i1 %12, %cmp6
  %cond.fold51 = or i1 false, %in.50
  store i1 %cond.fold51, i1* %out.11, align 1
  %leftover7 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %13 = load i64, i64* %leftover7, align 8
  %add = add i64 %13, %i.0.rewritten
  %cmp8 = icmp ult i64 %add, 16
  br i1 %cmp8, label %if.then9, label %if.else

if.then9:                                         ; preds = %for.body
  %14 = load i1, i1* %out.11, align 1
  %in.52 = and i1 %14, %cmp8
  %cond.fold53 = or i1 false, %in.52
  store i1 %cond.fold53, i1* %out.12, align 1
  br label %if.end10

if.else:                                          ; preds = %for.body
  %15 = load i1, i1* %out.11, align 1
  %16 = xor i1 %cmp8, true
  %in.54 = and i1 %15, %16
  %cond.fold55 = or i1 false, %in.54
  store i1 %cond.fold55, i1* %out.13, align 1
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4.9, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 123, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #7
  br label %UnifiedUnreachableBlock

if.end10:                                         ; preds = %if.then9
  %17 = load i1, i1* %out.12, align 1
  %cond.fold56 = or i1 false, %17
  store i1 %cond.fold56, i1* %out.14, align 1
  %len11 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %18 = load i64, i64* %len11, align 8
  %cmp12 = icmp ult i64 %i.0.rewritten, %18
  br i1 %cmp12, label %if.then13, label %if.else14

if.then13:                                        ; preds = %if.end10
  %19 = load i1, i1* %out.14, align 1
  %in.57 = and i1 %19, %cmp12
  %cond.fold58 = or i1 false, %in.57
  store i1 %cond.fold58, i1* %out.15, align 1
  br label %if.end15

if.else14:                                        ; preds = %if.end10
  %20 = load i1, i1* %out.14, align 1
  %21 = xor i1 %cmp12, true
  %in.59 = and i1 %20, %21
  %cond.fold60 = or i1 false, %in.59
  store i1 %cond.fold60, i1* %out.16, align 1
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6.10, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 124, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #7
  br label %UnifiedUnreachableBlock

if.end15:                                         ; preds = %if.then13
  %22 = load i1, i1* %out.15, align 1
  %cond.fold61 = or i1 false, %22
  store i1 %cond.fold61, i1* %out.17, align 1
  %23 = load i8*, i8** %m_buf, align 8
  %arrayidx = getelementptr inbounds i8, i8* %23, i64 %i.0.rewritten
  %24 = load i8, i8* %arrayidx, align 1
  %buffer = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 4
  %25 = bitcast [16 x i8]* %buffer to i8*
  %26 = call i8* @llvm.ptr.annotation.p0i8(i8* %25, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 17, i8* null)
  %27 = bitcast i8* %26 to [16 x i8]*
  %arrayidx16 = getelementptr inbounds [16 x i8], [16 x i8]* %27, i64 0, i64 %add
  store i8 %24, i8* %arrayidx16, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end15
  %28 = load i1, i1* %out.17, align 1
  %cond.fold62 = or i1 false, %28
  store i1 %cond.fold62, i1* %out.18, align 1
  %inc = add i64 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !19

for.end:                                          ; preds = %for.cond
  %29 = load i1, i1* %out.10, align 1
  %30 = xor i1 %cmp6, true
  %in.63 = and i1 %29, %30
  %cond.fold64 = or i1 false, %in.63
  store i1 %cond.fold64, i1* %out.19, align 1
  %add17 = add i64 0, %want.0.rewritten
  %leftover18 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %31 = load i64, i64* %leftover18, align 8
  %add19 = add i64 %31, %want.0.rewritten
  store i64 %add19, i64* %leftover18, align 8
  %leftover20 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %32 = load i64, i64* %leftover20, align 8
  %cmp21 = icmp ult i64 %32, 16
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %for.end
  %33 = load i1, i1* %out.19, align 1
  %in.65 = and i1 %33, %cmp21
  %cond.fold66 = or i1 false, %in.65
  store i1 %cond.fold66, i1* %out.20, align 1
  br label %if.end87

if.end23:                                         ; preds = %for.end
  %34 = load i1, i1* %out.19, align 1
  %35 = xor i1 %cmp21, true
  %in.67 = and i1 %34, %35
  %cond.fold68 = or i1 false, %in.67
  store i1 %cond.fold68, i1* %out.21, align 1
  %len24 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 1
  store i64 16, i64* %len24, align 8
  %len25 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 1
  %36 = load i64, i64* %len25, align 8
  %mul = mul i64 %36, 1
  %call = call noalias i8* @malloc(i64 noundef %mul) #8
  %buf26 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 0
  %w_state_buffer.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 1
  store i64 %mul, i64* %w_state_buffer.field0.length.ptr, align 8
  store i8* %call, i8** %buf26, align 8
  call void @_poly1305_blocks(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %w_state_buffer)
  %leftover27 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  store i64 0, i64* %leftover27, align 8
  br label %if.end28

if.end28:                                         ; preds = %if.end23, %entry
  %mindex.0.rewritten = phi i64 [ %add17, %if.end23 ], [ 0, %entry ]
  %37 = load i1, i1* %out.21, align 1
  %38 = load i1, i1* %out., align 1
  %39 = xor i1 %cmp, true
  %in.69 = and i1 %38, %39
  %cond.fold70 = or i1 false, %37
  %cond.fold71 = or i1 %cond.fold70, %in.69
  store i1 %cond.fold71, i1* %out.22, align 1
  %len29 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %40 = load i64, i64* %len29, align 8
  %sub30 = sub i64 %40, %mindex.0.rewritten
  %cmp31 = icmp uge i64 %sub30, 16
  br i1 %cmp31, label %if.then32, label %if.end54

if.then32:                                        ; preds = %if.end28
  %41 = load i1, i1* %out.22, align 1
  %in.72 = and i1 %41, %cmp31
  %cond.fold73 = or i1 false, %in.72
  store i1 %cond.fold73, i1* %out.23, align 1
  %len34 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %42 = load i64, i64* %len34, align 8
  %sub35 = sub i64 %42, %mindex.0.rewritten
  %and = and i64 %sub35, -16
  %add36 = add i64 %mindex.0.rewritten, %and
  %cmp37 = icmp ult i64 %mindex.0.rewritten, %add36
  br i1 %cmp37, label %if.then38, label %if.else39

if.then38:                                        ; preds = %if.then32
  %43 = load i1, i1* %out.23, align 1
  %in.74 = and i1 %43, %cmp37
  %cond.fold75 = or i1 false, %in.74
  store i1 %cond.fold75, i1* %out.24, align 1
  br label %if.end40

if.else39:                                        ; preds = %if.then32
  %44 = load i1, i1* %out.23, align 1
  %45 = xor i1 %cmp37, true
  %in.76 = and i1 %44, %45
  %cond.fold77 = or i1 false, %in.76
  store i1 %cond.fold77, i1* %out.25, align 1
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.7, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 154, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #7
  br label %UnifiedUnreachableBlock

if.end40:                                         ; preds = %if.then38
  %46 = load i1, i1* %out.24, align 1
  %cond.fold78 = or i1 false, %46
  store i1 %cond.fold78, i1* %out.26, align 1
  %add41 = add i64 %mindex.0.rewritten, %and
  %len42 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %47 = load i64, i64* %len42, align 8
  %cmp43 = icmp ule i64 %add41, %47
  br i1 %cmp43, label %if.then44, label %if.else45

if.then44:                                        ; preds = %if.end40
  %48 = load i1, i1* %out.26, align 1
  %in.79 = and i1 %48, %cmp43
  %cond.fold80 = or i1 false, %in.79
  store i1 %cond.fold80, i1* %out.27, align 1
  br label %if.end46

if.else45:                                        ; preds = %if.end40
  %49 = load i1, i1* %out.26, align 1
  %50 = xor i1 %cmp43, true
  %in.81 = and i1 %49, %50
  %cond.fold82 = or i1 false, %in.81
  store i1 %cond.fold82, i1* %out.28, align 1
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.8, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 155, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #7
  br label %UnifiedUnreachableBlock

if.end46:                                         ; preds = %if.then44
  %51 = load i1, i1* %out.27, align 1
  %cond.fold83 = or i1 false, %51
  store i1 %cond.fold83, i1* %out.29, align 1
  %len47 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_view_m, i32 0, i32 1
  store i64 %and, i64* %len47, align 8
  %len48 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_view_m, i32 0, i32 1
  %52 = load i64, i64* %len48, align 8
  %mul49 = mul i64 %52, 1
  %call50 = call noalias i8* @malloc(i64 noundef %mul49) #8
  %buf51 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_view_m, i32 0, i32 0
  %w_view_m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_view_m, i32 0, i32 1
  store i64 %mul49, i64* %w_view_m.field0.length.ptr, align 8
  store i8* %call50, i8** %buf51, align 8
  %buf52 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_view_m, i32 0, i32 0
  %53 = load i8*, i8** %buf52, align 8
  %54 = load i8*, i8** %m_buf, align 8
  %add.ptr = getelementptr inbounds i8, i8* %54, i64 %mindex.0.rewritten
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %53, i8* align 1 %add.ptr, i64 %and, i1 false)
  call void @_poly1305_blocks(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %w_view_m)
  %add53 = add i64 %mindex.0.rewritten, %and
  br label %if.end54

if.end54:                                         ; preds = %if.end46, %if.end28
  %mindex.1.rewritten = phi i64 [ %add53, %if.end46 ], [ %mindex.0.rewritten, %if.end28 ]
  %55 = load i1, i1* %out.29, align 1
  %56 = load i1, i1* %out.22, align 1
  %57 = xor i1 %cmp31, true
  %in.84 = and i1 %56, %57
  %cond.fold85 = or i1 false, %55
  %cond.fold86 = or i1 %cond.fold85, %in.84
  store i1 %cond.fold86, i1* %out.30, align 1
  %len55 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %58 = load i64, i64* %len55, align 8
  %cmp56 = icmp ult i64 %mindex.1.rewritten, %58
  store i1 %cmp56, i1* %pred.alloca, align 1
  br i1 %cmp56, label %if.then57, label %if.end87

if.then57:                                        ; preds = %if.end54
  %59 = load i1, i1* %out.30, align 1
  %in.87 = and i1 %59, %cmp56
  %cond.fold88 = or i1 false, %in.87
  store i1 %cond.fold88, i1* %out.31, align 1
  %len58 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %60 = load i64, i64* %len58, align 8
  %sub59 = sub i64 %60, %mindex.1.rewritten
  br label %for.cond61

for.cond61:                                       ; preds = %for.inc82, %if.then57
  %i60.0.rewritten = phi i64 [ 0, %if.then57 ], [ %inc83, %for.inc82 ]
  %fwedge.taken3.rewritten = phi i1 [ true, %if.then57 ], [ false, %for.inc82 ]
  %exitpred.frozen4.rewritten = phi i1 [ %cmp62, %for.inc82 ], [ false, %if.then57 ]
  %exitpred.frozen5.rewritten = phi i1 [ %cmp67, %for.inc82 ], [ false, %if.then57 ]
  %exitpred.frozen6.rewritten = phi i1 [ %cmp73, %for.inc82 ], [ false, %if.then57 ]
  %61 = load i1, i1* %out.40, align 1
  %62 = load i1, i1* %out.31, align 1
  %fwcond.and.fwtaken89 = and i1 %fwedge.taken3.rewritten, %62
  %cond.fold90 = or i1 %fwcond.and.fwtaken89, %61
  store i1 %cond.fold90, i1* %out.32, align 1
  %cmp62 = icmp ult i64 %i60.0.rewritten, %sub59
  br i1 %cmp62, label %for.body63, label %for.end84

for.body63:                                       ; preds = %for.cond61
  %63 = load i1, i1* %out.32, align 1
  %in.91 = and i1 %63, %cmp62
  %cond.fold92 = or i1 false, %in.91
  store i1 %cond.fold92, i1* %out.33, align 1
  %leftover64 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %64 = load i64, i64* %leftover64, align 8
  %add66 = add i64 %64, %i60.0.rewritten
  %cmp67 = icmp ult i64 %add66, 16
  br i1 %cmp67, label %if.then68, label %if.else69

if.then68:                                        ; preds = %for.body63
  %65 = load i1, i1* %out.33, align 1
  %in.93 = and i1 %65, %cmp67
  %cond.fold94 = or i1 false, %in.93
  store i1 %cond.fold94, i1* %out.34, align 1
  br label %if.end70

if.else69:                                        ; preds = %for.body63
  %66 = load i1, i1* %out.33, align 1
  %67 = xor i1 %cmp67, true
  %in.95 = and i1 %66, %67
  %cond.fold96 = or i1 false, %in.95
  store i1 %cond.fold96, i1* %out.35, align 1
  call void @__assert_fail(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.9, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 178, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #7
  br label %UnifiedUnreachableBlock

if.end70:                                         ; preds = %if.then68
  %68 = load i1, i1* %out.34, align 1
  %cond.fold97 = or i1 false, %68
  store i1 %cond.fold97, i1* %out.36, align 1
  %add71 = add i64 %mindex.1.rewritten, %i60.0.rewritten
  %len72 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %69 = load i64, i64* %len72, align 8
  %cmp73 = icmp ult i64 %add71, %69
  br i1 %cmp73, label %if.then74, label %if.else75

if.then74:                                        ; preds = %if.end70
  %70 = load i1, i1* %out.36, align 1
  %in.98 = and i1 %70, %cmp73
  %cond.fold99 = or i1 false, %in.98
  store i1 %cond.fold99, i1* %out.37, align 1
  br label %if.end76

if.else75:                                        ; preds = %if.end70
  %71 = load i1, i1* %out.36, align 1
  %72 = xor i1 %cmp73, true
  %in.100 = and i1 %71, %72
  %cond.fold101 = or i1 false, %in.100
  store i1 %cond.fold101, i1* %out.38, align 1
  call void @__assert_fail(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 179, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #7
  br label %UnifiedUnreachableBlock

if.end76:                                         ; preds = %if.then74
  %73 = load i1, i1* %out.37, align 1
  %cond.fold102 = or i1 false, %73
  store i1 %cond.fold102, i1* %out.39, align 1
  %74 = load i8*, i8** %m_buf, align 8
  %add77 = add i64 %mindex.1.rewritten, %i60.0.rewritten
  %arrayidx78 = getelementptr inbounds i8, i8* %74, i64 %add77
  %75 = load i8, i8* %arrayidx78, align 1
  %buffer79 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 4
  %76 = bitcast [16 x i8]* %buffer79 to i8*
  %77 = call i8* @llvm.ptr.annotation.p0i8(i8* %76, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 17, i8* null)
  %78 = bitcast i8* %77 to [16 x i8]*
  %add80 = add i64 %64, %i60.0.rewritten
  %arrayidx81 = getelementptr inbounds [16 x i8], [16 x i8]* %78, i64 0, i64 %add80
  store i8 %75, i8* %arrayidx81, align 1
  br label %for.inc82

for.inc82:                                        ; preds = %if.end76
  %79 = load i1, i1* %out.39, align 1
  %cond.fold103 = or i1 false, %79
  store i1 %cond.fold103, i1* %out.40, align 1
  %inc83 = add i64 %i60.0.rewritten, 1
  br label %for.cond61, !llvm.loop !20

for.end84:                                        ; preds = %for.cond61
  %80 = load i1, i1* %out.32, align 1
  %81 = xor i1 %cmp62, true
  %in.104 = and i1 %80, %81
  %cond.fold105 = or i1 false, %in.104
  store i1 %cond.fold105, i1* %out.41, align 1
  %leftover85 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %82 = load i64, i64* %leftover85, align 8
  %add86 = add i64 %82, %sub59
  store i64 %add86, i64* %leftover85, align 8
  br label %if.end87

if.end87:                                         ; preds = %for.end84, %if.end54, %if.then22
  %pred.load = load i1, i1* %pred.alloca, align 1
  %83 = load i1, i1* %out.41, align 1
  %84 = load i1, i1* %out.30, align 1
  %85 = xor i1 %pred.load, true
  %in.106 = and i1 %84, %85
  %86 = load i1, i1* %out.20, align 1
  %cond.fold107 = or i1 false, %in.106
  %cond.fold108 = or i1 %cond.fold107, %86
  %cond.fold109 = or i1 %cond.fold108, %83
  store i1 %cond.fold109, i1* %out.42, align 1
  ret void

UnifiedUnreachableBlock:                          ; preds = %if.else75, %if.else69, %if.else45, %if.else39, %if.else14, %if.else
  %87 = load i1, i1* %out.38, align 1
  %88 = load i1, i1* %out.35, align 1
  %89 = load i1, i1* %out.28, align 1
  %90 = load i1, i1* %out.25, align 1
  %91 = load i1, i1* %out.16, align 1
  %92 = load i1, i1* %out.13, align 1
  %cond.fold110 = or i1 false, %92
  %cond.fold111 = or i1 %cond.fold110, %90
  %cond.fold112 = or i1 %cond.fold111, %89
  %cond.fold113 = or i1 %cond.fold112, %91
  %cond.fold114 = or i1 %cond.fold113, %88
  %cond.fold115 = or i1 %cond.fold114, %87
  store i1 %cond.fold115, i1* %out.43, align 1
  unreachable
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @_crypto_onetimeauth_poly1305(%struct.uint8ptr_wrapped_ty* noundef %out, %struct.uint8ptr_wrapped_ty* noundef %m, %struct.uint8ptr_wrapped_ty* noundef %key) #0 {
entry:
  %out.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %out, i32 0, i32 1
  %out.field0.length = load i64, i64* %out.field0.length.ptr, align 8
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %m.field0.length = load i64, i64* %m.field0.length.ptr, align 8
  %key.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %key, i32 0, i32 1
  %key.field0.length = load i64, i64* %key.field0.length.ptr, align 8
  %arg.wrapped1 = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %out, i32 0, i32 0
  %out.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %key, i32 0, i32 0
  %key.unwrapped = load i8*, i8** %1, align 8
  %out.addr = alloca i8*, align 8
  %key.addr = alloca i8*, align 8
  %state = alloca %struct.poly1305_state_internal_t, align 8
  store i8* %out.unwrapped, i8** %out.addr, align 8
  %out.addr1 = bitcast i8** %out.addr to i8*
  call void @llvm.var.annotation(i8* %out.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 288, i8* null)
  store i8* %key.unwrapped, i8** %key.addr, align 8
  %key.addr2 = bitcast i8** %key.addr to i8*
  call void @llvm.var.annotation(i8* %key.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 290, i8* null)
  %2 = bitcast %struct.poly1305_state_internal_t* %state to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %2, i8 0, i64 96, i1 false)
  %3 = load i8*, i8** %key.addr, align 8
  %arg.unwrapped2 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped1, i32 0, i32 0
  %arg.wrapped1.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped1, i32 0, i32 1
  store i64 0, i64* %arg.wrapped1.field0.length.ptr, align 8
  store i8* %3, i8** %arg.unwrapped2, align 8
  call void @_poly1305_init(%struct.poly1305_state_internal_t* %state, %struct.uint8ptr_wrapped_ty* %arg.wrapped1)
  call void @_poly1305_update(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %m)
  %4 = load i8*, i8** %out.addr, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %4, i8** %arg.unwrapped, align 8
  call void @_poly1305_finish(%struct.poly1305_state_internal_t* %state, %struct.uint8ptr_wrapped_ty* %arg.wrapped)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @_crypto_onetimeauth_poly1305_verify(%struct.uint8ptr_wrapped_ty* noundef %h, %struct.uint8ptr_wrapped_ty* noundef %input, %struct.uint8ptr_wrapped_ty* noundef %k) #0 {
entry:
  %h.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %h, i32 0, i32 1
  %h.field0.length = load i64, i64* %h.field0.length.ptr, align 8
  %input.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %input, i32 0, i32 1
  %input.field0.length = load i64, i64* %input.field0.length.ptr, align 8
  %k.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 1
  %k.field0.length = load i64, i64* %k.field0.length.ptr, align 8
  %h.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay3.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %h, i32 0, i32 0
  %h.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  %correct = alloca [16 x i8], align 16
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 312, i8* null)
  %correct2 = bitcast [16 x i8]* %correct to i8*
  call void @llvm.var.annotation(i8* %correct2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 315, i8* null)
  %2 = bitcast [16 x i8]* %correct to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 16, i1 false)
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %correct, i64 0, i64 0
  %3 = load i8*, i8** %k.addr, align 8
  %arraydecay.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, i32 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, i32 0, i32 1
  store i64 16, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay, i8** %arraydecay.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %3, i8** %arg.unwrapped, align 8
  %call = call i32 @_crypto_onetimeauth_poly1305(%struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, %struct.uint8ptr_wrapped_ty* %input, %struct.uint8ptr_wrapped_ty* %arg.wrapped)
  %arraydecay3 = getelementptr inbounds [16 x i8], [16 x i8]* %correct, i64 0, i64 0
  %h.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %h.unwrapped.wrapped, i32 0, i32 0
  %h.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %h.unwrapped.wrapped, i32 0, i32 1
  store i64 %h.field0.length, i64* %h.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %h.unwrapped, i8** %h.unwrapped.unwrapped, align 8
  %arraydecay3.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay3.wrapped, i32 0, i32 0
  %arraydecay3.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay3.wrapped, i32 0, i32 1
  store i64 16, i64* %arraydecay3.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay3, i8** %arraydecay3.unwrapped, align 8
  %call4 = call i1 @_crypto_verify_16(%struct.uint8ptr_wrapped_ty* %h.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* %arraydecay3.wrapped)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i1 %call4
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @_poly1305_init(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %key) #0 {
entry:
  %key.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %key, i32 0, i32 1
  %key.field0.length = load i64, i64* %key.field0.length.ptr, align 8
  %add.ptr20.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr17.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %key, i32 0, i32 0
  %key.unwrapped = load i8*, i8** %0, align 8
  %key.addr = alloca i8*, align 8
  %t0 = alloca i64, align 8
  %t1 = alloca i64, align 8
  store i8* %key.unwrapped, i8** %key.addr, align 8
  %key.addr1 = bitcast i8** %key.addr to i8*
  call void @llvm.var.annotation(i8* %key.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 77, i8* null)
  %t02 = bitcast i64* %t0 to i8*
  call void @llvm.var.annotation(i8* %t02, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 81, i8* null)
  %1 = load i8*, i8** %key.addr, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %1, i8** %arg.unwrapped, align 8
  %call = call i64 @load64_le(%struct.uint8ptr_wrapped_ty* %arg.wrapped)
  store i64 %call, i64* %t0, align 8
  %t13 = bitcast i64* %t1 to i8*
  call void @llvm.var.annotation(i8* %t13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 82, i8* null)
  %2 = load i8*, i8** %key.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 8
  %add.ptr.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 0
  %add.ptr.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr, i8** %add.ptr.unwrapped, align 8
  %call4 = call i64 @load64_le(%struct.uint8ptr_wrapped_ty* %add.ptr.wrapped)
  store i64 %call4, i64* %t1, align 8
  %3 = load i64, i64* %t0, align 8
  %and = and i64 %3, 17575274610687
  %r = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 0
  %4 = bitcast [3 x i64]* %r to i8*
  %5 = call i8* @llvm.ptr.annotation.p0i8(i8* %4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 13, i8* null)
  %6 = bitcast i8* %5 to [3 x i64]*
  %arrayidx = getelementptr inbounds [3 x i64], [3 x i64]* %6, i64 0, i64 0
  store i64 %and, i64* %arrayidx, align 8
  %7 = load i64, i64* %t0, align 8
  %shr = lshr i64 %7, 44
  %8 = load i64, i64* %t1, align 8
  %shl = shl i64 %8, 20
  %or = or i64 %shr, %shl
  %and5 = and i64 %or, 17592181915647
  %r6 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 0
  %9 = bitcast [3 x i64]* %r6 to i8*
  %10 = call i8* @llvm.ptr.annotation.p0i8(i8* %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 13, i8* null)
  %11 = bitcast i8* %10 to [3 x i64]*
  %arrayidx7 = getelementptr inbounds [3 x i64], [3 x i64]* %11, i64 0, i64 1
  store i64 %and5, i64* %arrayidx7, align 8
  %12 = load i64, i64* %t1, align 8
  %shr8 = lshr i64 %12, 24
  %and9 = and i64 %shr8, 68719475727
  %r10 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 0
  %13 = bitcast [3 x i64]* %r10 to i8*
  %14 = call i8* @llvm.ptr.annotation.p0i8(i8* %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 13, i8* null)
  %15 = bitcast i8* %14 to [3 x i64]*
  %arrayidx11 = getelementptr inbounds [3 x i64], [3 x i64]* %15, i64 0, i64 2
  store i64 %and9, i64* %arrayidx11, align 8
  %h = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %16 = bitcast [3 x i64]* %h to i8*
  %17 = call i8* @llvm.ptr.annotation.p0i8(i8* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 14, i8* null)
  %18 = bitcast i8* %17 to [3 x i64]*
  %arrayidx12 = getelementptr inbounds [3 x i64], [3 x i64]* %18, i64 0, i64 0
  store i64 0, i64* %arrayidx12, align 8
  %h13 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %19 = bitcast [3 x i64]* %h13 to i8*
  %20 = call i8* @llvm.ptr.annotation.p0i8(i8* %19, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 14, i8* null)
  %21 = bitcast i8* %20 to [3 x i64]*
  %arrayidx14 = getelementptr inbounds [3 x i64], [3 x i64]* %21, i64 0, i64 1
  store i64 0, i64* %arrayidx14, align 8
  %h15 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %22 = bitcast [3 x i64]* %h15 to i8*
  %23 = call i8* @llvm.ptr.annotation.p0i8(i8* %22, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 14, i8* null)
  %24 = bitcast i8* %23 to [3 x i64]*
  %arrayidx16 = getelementptr inbounds [3 x i64], [3 x i64]* %24, i64 0, i64 2
  store i64 0, i64* %arrayidx16, align 8
  %25 = load i8*, i8** %key.addr, align 8
  %add.ptr17 = getelementptr inbounds i8, i8* %25, i64 16
  %add.ptr17.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr17.wrapped, i32 0, i32 0
  %add.ptr17.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr17.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr17.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr17, i8** %add.ptr17.unwrapped, align 8
  %call18 = call i64 @load64_le(%struct.uint8ptr_wrapped_ty* %add.ptr17.wrapped)
  %pad = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 2
  %26 = bitcast [2 x i64]* %pad to i8*
  %27 = call i8* @llvm.ptr.annotation.p0i8(i8* %26, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 15, i8* null)
  %28 = bitcast i8* %27 to [2 x i64]*
  %arrayidx19 = getelementptr inbounds [2 x i64], [2 x i64]* %28, i64 0, i64 0
  store i64 %call18, i64* %arrayidx19, align 8
  %29 = load i8*, i8** %key.addr, align 8
  %add.ptr20 = getelementptr inbounds i8, i8* %29, i64 24
  %add.ptr20.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr20.wrapped, i32 0, i32 0
  %add.ptr20.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr20.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr20.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr20, i8** %add.ptr20.unwrapped, align 8
  %call21 = call i64 @load64_le(%struct.uint8ptr_wrapped_ty* %add.ptr20.wrapped)
  %pad22 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 2
  %30 = bitcast [2 x i64]* %pad22 to i8*
  %31 = call i8* @llvm.ptr.annotation.p0i8(i8* %30, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 15, i8* null)
  %32 = bitcast i8* %31 to [2 x i64]*
  %arrayidx23 = getelementptr inbounds [2 x i64], [2 x i64]* %32, i64 0, i64 1
  store i64 %call21, i64* %arrayidx23, align 8
  %leftover = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  store i64 0, i64* %leftover, align 8
  %final = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 5
  %33 = call i8* @llvm.ptr.annotation.p0i8(i8* %final, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 18, i8* null)
  store i8 0, i8* %33, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @_poly1305_finish(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %mac) #0 {
entry:
  %mac.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac, i32 0, i32 1
  %mac.field0.length = load i64, i64* %mac.field0.length.ptr, align 8
  %add.ptr.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.1 = alloca i1, align 1
  store i1 false, i1* %out.1, align 1
  %out.2 = alloca i1, align 1
  store i1 false, i1* %out.2, align 1
  %out.3 = alloca i1, align 1
  store i1 false, i1* %out.3, align 1
  %out.4 = alloca i1, align 1
  store i1 false, i1* %out.4, align 1
  %out.5 = alloca i1, align 1
  store i1 false, i1* %out.5, align 1
  %out.6 = alloca i1, align 1
  store i1 false, i1* %out.6, align 1
  %out.7 = alloca i1, align 1
  store i1 false, i1* %out.7, align 1
  %out.8 = alloca i1, align 1
  store i1 false, i1* %out.8, align 1
  %out.9 = alloca i1, align 1
  store i1 false, i1* %out.9, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.7, align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac, i32 0, i32 0
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
  call void @llvm.var.annotation(i8* %mac.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 188, i8* null)
  %leftover = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %1 = load i64, i64* %leftover, align 8
  %cmp = icmp ne i64 %1, 0
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br i1 %cmp, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %2 = load i1, i1* %out., align 1
  %in. = and i1 %2, %cmp
  %cond.fold = or i1 false, %in.
  store i1 %cond.fold, i1* %out.1, align 1
  %leftover2 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %3 = load i64, i64* %leftover2, align 8
  %cmp3 = icmp ult i64 %3, 16
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then
  %4 = load i1, i1* %out.1, align 1
  %in.10 = and i1 %4, %cmp3
  %cond.fold11 = or i1 false, %in.10
  store i1 %cond.fold11, i1* %out.2, align 1
  br label %if.end

if.else:                                          ; preds = %if.then
  %5 = load i1, i1* %out.1, align 1
  %6 = xor i1 %cmp3, true
  %in.12 = and i1 %5, %6
  %cond.fold13 = or i1 false, %in.12
  store i1 %cond.fold13, i1* %out.3, align 1
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.11, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5.7, i64 0, i64 0), i32 noundef 198, i8* noundef getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__._poly1305_finish, i64 0, i64 0)) #7
  unreachable

if.end:                                           ; preds = %if.then4
  %7 = load i1, i1* %out.2, align 1
  %cond.fold14 = or i1 false, %7
  store i1 %cond.fold14, i1* %out.4, align 1
  %buffer = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 4
  %8 = bitcast [16 x i8]* %buffer to i8*
  %9 = call i8* @llvm.ptr.annotation.p0i8(i8* %8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 17, i8* null)
  %10 = bitcast i8* %9 to [16 x i8]*
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %10, i64 0, i64 %3
  store i8 1, i8* %arrayidx, align 1
  %add = add i64 %3, 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0.rewritten = phi i64 [ %add, %if.end ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %if.end ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp5, %for.inc ], [ false, %if.end ]
  %11 = load i1, i1* %out.7, align 1
  %12 = load i1, i1* %out.4, align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %12
  %cond.fold15 = or i1 %fwcond.and.fwtaken, %11
  store i1 %cond.fold15, i1* %out.5, align 1
  %cmp5 = icmp ult i64 %i.0.rewritten, 16
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i1, i1* %out.5, align 1
  %in.16 = and i1 %13, %cmp5
  %cond.fold17 = or i1 false, %in.16
  store i1 %cond.fold17, i1* %out.6, align 1
  %buffer6 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 4
  %14 = bitcast [16 x i8]* %buffer6 to i8*
  %15 = call i8* @llvm.ptr.annotation.p0i8(i8* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 17, i8* null)
  %16 = bitcast i8* %15 to [16 x i8]*
  %arrayidx7 = getelementptr inbounds [16 x i8], [16 x i8]* %16, i64 0, i64 %i.0.rewritten
  store i8 0, i8* %arrayidx7, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i1, i1* %out.6, align 1
  %cond.fold18 = or i1 false, %17
  store i1 %cond.fold18, i1* %out.7, align 1
  %inc = add i64 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !21

for.end:                                          ; preds = %for.cond
  %18 = load i1, i1* %out.5, align 1
  %19 = xor i1 %cmp5, true
  %in.19 = and i1 %18, %19
  %cond.fold20 = or i1 false, %in.19
  store i1 %cond.fold20, i1* %out.8, align 1
  %final = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 5
  %20 = call i8* @llvm.ptr.annotation.p0i8(i8* %final, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 18, i8* null)
  store i8 1, i8* %20, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 1
  store i64 16, i64* %len, align 8
  %len8 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 1
  %21 = load i64, i64* %len8, align 8
  %mul = mul i64 %21, 1
  %call = call noalias i8* @malloc(i64 noundef %mul) #8
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 0
  %w_state_buffer.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 1
  store i64 %mul, i64* %w_state_buffer.field0.length.ptr, align 8
  store i8* %call, i8** %buf, align 8
  call void @_poly1305_blocks(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %w_state_buffer)
  br label %if.end9

if.end9:                                          ; preds = %for.end, %entry
  %22 = load i1, i1* %out.8, align 1
  %23 = load i1, i1* %out., align 1
  %24 = xor i1 %cmp, true
  %in.21 = and i1 %23, %24
  %cond.fold22 = or i1 false, %in.21
  %cond.fold23 = or i1 %cond.fold22, %22
  store i1 %cond.fold23, i1* %out.9, align 1
  %h010 = bitcast i64* %h0 to i8*
  call void @llvm.var.annotation(i8* %h010, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 222, i8* null)
  %h = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %25 = bitcast [3 x i64]* %h to i8*
  %26 = call i8* @llvm.ptr.annotation.p0i8(i8* %25, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 14, i8* null)
  %27 = bitcast i8* %26 to [3 x i64]*
  %arrayidx11 = getelementptr inbounds [3 x i64], [3 x i64]* %27, i64 0, i64 0
  %28 = load i64, i64* %arrayidx11, align 8
  store i64 %28, i64* %h0, align 8
  %h112 = bitcast i64* %h1 to i8*
  call void @llvm.var.annotation(i8* %h112, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 223, i8* null)
  %h13 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %29 = bitcast [3 x i64]* %h13 to i8*
  %30 = call i8* @llvm.ptr.annotation.p0i8(i8* %29, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 14, i8* null)
  %31 = bitcast i8* %30 to [3 x i64]*
  %arrayidx14 = getelementptr inbounds [3 x i64], [3 x i64]* %31, i64 0, i64 1
  %32 = load i64, i64* %arrayidx14, align 8
  store i64 %32, i64* %h1, align 8
  %h215 = bitcast i64* %h2 to i8*
  call void @llvm.var.annotation(i8* %h215, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 224, i8* null)
  %h16 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %33 = bitcast [3 x i64]* %h16 to i8*
  %34 = call i8* @llvm.ptr.annotation.p0i8(i8* %33, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 14, i8* null)
  %35 = bitcast i8* %34 to [3 x i64]*
  %arrayidx17 = getelementptr inbounds [3 x i64], [3 x i64]* %35, i64 0, i64 2
  %36 = load i64, i64* %arrayidx17, align 8
  store i64 %36, i64* %h2, align 8
  %c18 = bitcast i64* %c to i8*
  call void @llvm.var.annotation(i8* %c18, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 226, i8* null)
  %37 = load i64, i64* %h1, align 8
  %shr = lshr i64 %37, 44
  store i64 %shr, i64* %c, align 8
  %38 = load i64, i64* %h1, align 8
  %and = and i64 %38, 17592186044415
  store i64 %and, i64* %h1, align 8
  %39 = load i64, i64* %c, align 8
  %40 = load i64, i64* %h2, align 8
  %add19 = add i64 %40, %39
  store i64 %add19, i64* %h2, align 8
  %41 = load i64, i64* %h2, align 8
  %shr20 = lshr i64 %41, 42
  store i64 %shr20, i64* %c, align 8
  %42 = load i64, i64* %h2, align 8
  %and21 = and i64 %42, 4398046511103
  store i64 %and21, i64* %h2, align 8
  %43 = load i64, i64* %c, align 8
  %mul22 = mul i64 %43, 5
  %44 = load i64, i64* %h0, align 8
  %add23 = add i64 %44, %mul22
  store i64 %add23, i64* %h0, align 8
  %45 = load i64, i64* %h0, align 8
  %shr24 = lshr i64 %45, 44
  store i64 %shr24, i64* %c, align 8
  %46 = load i64, i64* %h0, align 8
  %and25 = and i64 %46, 17592186044415
  store i64 %and25, i64* %h0, align 8
  %47 = load i64, i64* %c, align 8
  %48 = load i64, i64* %h1, align 8
  %add26 = add i64 %48, %47
  store i64 %add26, i64* %h1, align 8
  %49 = load i64, i64* %h1, align 8
  %shr27 = lshr i64 %49, 44
  store i64 %shr27, i64* %c, align 8
  %50 = load i64, i64* %h1, align 8
  %and28 = and i64 %50, 17592186044415
  store i64 %and28, i64* %h1, align 8
  %51 = load i64, i64* %c, align 8
  %52 = load i64, i64* %h2, align 8
  %add29 = add i64 %52, %51
  store i64 %add29, i64* %h2, align 8
  %53 = load i64, i64* %h2, align 8
  %shr30 = lshr i64 %53, 42
  store i64 %shr30, i64* %c, align 8
  %54 = load i64, i64* %h2, align 8
  %and31 = and i64 %54, 4398046511103
  store i64 %and31, i64* %h2, align 8
  %55 = load i64, i64* %c, align 8
  %mul32 = mul i64 %55, 5
  %56 = load i64, i64* %h0, align 8
  %add33 = add i64 %56, %mul32
  store i64 %add33, i64* %h0, align 8
  %57 = load i64, i64* %h0, align 8
  %shr34 = lshr i64 %57, 44
  store i64 %shr34, i64* %c, align 8
  %58 = load i64, i64* %h0, align 8
  %and35 = and i64 %58, 17592186044415
  store i64 %and35, i64* %h0, align 8
  %59 = load i64, i64* %c, align 8
  %60 = load i64, i64* %h1, align 8
  %add36 = add i64 %60, %59
  store i64 %add36, i64* %h1, align 8
  %g037 = bitcast i64* %g0 to i8*
  call void @llvm.var.annotation(i8* %g037, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 246, i8* null)
  %61 = load i64, i64* %h0, align 8
  %add38 = add i64 %61, 5
  store i64 %add38, i64* %g0, align 8
  %62 = load i64, i64* %g0, align 8
  %shr39 = lshr i64 %62, 44
  store i64 %shr39, i64* %c, align 8
  %63 = load i64, i64* %g0, align 8
  %and40 = and i64 %63, 17592186044415
  store i64 %and40, i64* %g0, align 8
  %g141 = bitcast i64* %g1 to i8*
  call void @llvm.var.annotation(i8* %g141, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 249, i8* null)
  %64 = load i64, i64* %h1, align 8
  %65 = load i64, i64* %c, align 8
  %add42 = add i64 %64, %65
  store i64 %add42, i64* %g1, align 8
  %66 = load i64, i64* %g1, align 8
  %shr43 = lshr i64 %66, 44
  store i64 %shr43, i64* %c, align 8
  %67 = load i64, i64* %g1, align 8
  %and44 = and i64 %67, 17592186044415
  store i64 %and44, i64* %g1, align 8
  %g245 = bitcast i64* %g2 to i8*
  call void @llvm.var.annotation(i8* %g245, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 252, i8* null)
  %68 = load i64, i64* %h2, align 8
  %69 = load i64, i64* %c, align 8
  %add46 = add i64 %68, %69
  %sub = sub i64 %add46, 4398046511104
  store i64 %sub, i64* %g2, align 8
  %70 = load i64, i64* %g2, align 8
  %shr47 = lshr i64 %70, 63
  %sub48 = sub i64 %shr47, 1
  store i64 %sub48, i64* %c, align 8
  %71 = load i64, i64* %c, align 8
  %72 = load i64, i64* %g0, align 8
  %and49 = and i64 %72, %71
  store i64 %and49, i64* %g0, align 8
  %73 = load i64, i64* %c, align 8
  %74 = load i64, i64* %g1, align 8
  %and50 = and i64 %74, %73
  store i64 %and50, i64* %g1, align 8
  %75 = load i64, i64* %c, align 8
  %76 = load i64, i64* %g2, align 8
  %and51 = and i64 %76, %75
  store i64 %and51, i64* %g2, align 8
  %77 = load i64, i64* %c, align 8
  %neg = xor i64 %77, -1
  store i64 %neg, i64* %c, align 8
  %78 = load i64, i64* %h0, align 8
  %79 = load i64, i64* %c, align 8
  %and52 = and i64 %78, %79
  %80 = load i64, i64* %g0, align 8
  %or = or i64 %and52, %80
  store i64 %or, i64* %h0, align 8
  %81 = load i64, i64* %h1, align 8
  %82 = load i64, i64* %c, align 8
  %and53 = and i64 %81, %82
  %83 = load i64, i64* %g1, align 8
  %or54 = or i64 %and53, %83
  store i64 %or54, i64* %h1, align 8
  %84 = load i64, i64* %h2, align 8
  %85 = load i64, i64* %c, align 8
  %and55 = and i64 %84, %85
  %86 = load i64, i64* %g2, align 8
  %or56 = or i64 %and55, %86
  store i64 %or56, i64* %h2, align 8
  %t057 = bitcast i64* %t0 to i8*
  call void @llvm.var.annotation(i8* %t057, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 265, i8* null)
  %pad = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 2
  %87 = bitcast [2 x i64]* %pad to i8*
  %88 = call i8* @llvm.ptr.annotation.p0i8(i8* %87, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 15, i8* null)
  %89 = bitcast i8* %88 to [2 x i64]*
  %arrayidx58 = getelementptr inbounds [2 x i64], [2 x i64]* %89, i64 0, i64 0
  %90 = load i64, i64* %arrayidx58, align 8
  store i64 %90, i64* %t0, align 8
  %t159 = bitcast i64* %t1 to i8*
  call void @llvm.var.annotation(i8* %t159, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.3, i32 0, i32 0), i32 266, i8* null)
  %pad60 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 2
  %91 = bitcast [2 x i64]* %pad60 to i8*
  %92 = call i8* @llvm.ptr.annotation.p0i8(i8* %91, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2.8, i32 0, i32 0), i32 15, i8* null)
  %93 = bitcast i8* %92 to [2 x i64]*
  %arrayidx61 = getelementptr inbounds [2 x i64], [2 x i64]* %93, i64 0, i64 1
  %94 = load i64, i64* %arrayidx61, align 8
  store i64 %94, i64* %t1, align 8
  %95 = load i64, i64* %t0, align 8
  %and62 = and i64 %95, 17592186044415
  %96 = load i64, i64* %h0, align 8
  %add63 = add i64 %96, %and62
  store i64 %add63, i64* %h0, align 8
  %97 = load i64, i64* %h0, align 8
  %shr64 = lshr i64 %97, 44
  store i64 %shr64, i64* %c, align 8
  %98 = load i64, i64* %h0, align 8
  %and65 = and i64 %98, 17592186044415
  store i64 %and65, i64* %h0, align 8
  %99 = load i64, i64* %t0, align 8
  %shr66 = lshr i64 %99, 44
  %100 = load i64, i64* %t1, align 8
  %shl = shl i64 %100, 20
  %or67 = or i64 %shr66, %shl
  %and68 = and i64 %or67, 17592186044415
  %101 = load i64, i64* %c, align 8
  %add69 = add i64 %and68, %101
  %102 = load i64, i64* %h1, align 8
  %add70 = add i64 %102, %add69
  store i64 %add70, i64* %h1, align 8
  %103 = load i64, i64* %h1, align 8
  %shr71 = lshr i64 %103, 44
  store i64 %shr71, i64* %c, align 8
  %104 = load i64, i64* %h1, align 8
  %and72 = and i64 %104, 17592186044415
  store i64 %and72, i64* %h1, align 8
  %105 = load i64, i64* %t1, align 8
  %shr73 = lshr i64 %105, 24
  %and74 = and i64 %shr73, 4398046511103
  %106 = load i64, i64* %c, align 8
  %add75 = add i64 %and74, %106
  %107 = load i64, i64* %h2, align 8
  %add76 = add i64 %107, %add75
  store i64 %add76, i64* %h2, align 8
  %108 = load i64, i64* %h2, align 8
  %and77 = and i64 %108, 4398046511103
  store i64 %and77, i64* %h2, align 8
  %109 = load i64, i64* %h0, align 8
  %110 = load i64, i64* %h1, align 8
  %shl78 = shl i64 %110, 44
  %or79 = or i64 %109, %shl78
  store i64 %or79, i64* %h0, align 8
  %111 = load i64, i64* %h1, align 8
  %shr80 = lshr i64 %111, 20
  %112 = load i64, i64* %h2, align 8
  %shl81 = shl i64 %112, 24
  %or82 = or i64 %shr80, %shl81
  store i64 %or82, i64* %h1, align 8
  %113 = load i8*, i8** %mac.addr, align 8
  %114 = load i64, i64* %h0, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %113, i8** %arg.unwrapped, align 8
  call void @store64_le(%struct.uint8ptr_wrapped_ty* %arg.wrapped, i64 %114)
  %115 = load i8*, i8** %mac.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %115, i64 8
  %116 = load i64, i64* %h1, align 8
  %add.ptr.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 0
  %add.ptr.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr, i8** %add.ptr.unwrapped, align 8
  call void @store64_le(%struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i64 %116)
  %117 = bitcast %struct.poly1305_state_internal_t* %state to i8*
  call void @sodium_memzero(i8* noundef %117, i64 noundef 96)
  ret void
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare i8* @llvm.ptr.annotation.p0i8(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #6

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @store64_le(%struct.uint8ptr_wrapped_ty* noundef %dst, i64 noundef %w) #0 {
entry:
  %dst.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %dst, i32 0, i32 1
  %dst.field0.length = load i64, i64* %dst.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %dst, i32 0, i32 0
  %dst.unwrapped = load i8*, i8** %0, align 8
  %conv = trunc i64 %w to i8
  %arrayidx = getelementptr inbounds i8, i8* %dst.unwrapped, i64 0
  store i8 %conv, i8* %arrayidx, align 1
  %shr = lshr i64 %w, 8
  %conv1 = trunc i64 %shr to i8
  %arrayidx2 = getelementptr inbounds i8, i8* %dst.unwrapped, i64 1
  store i8 %conv1, i8* %arrayidx2, align 1
  %shr3 = lshr i64 %shr, 8
  %conv4 = trunc i64 %shr3 to i8
  %arrayidx5 = getelementptr inbounds i8, i8* %dst.unwrapped, i64 2
  store i8 %conv4, i8* %arrayidx5, align 1
  %shr6 = lshr i64 %shr3, 8
  %conv7 = trunc i64 %shr6 to i8
  %arrayidx8 = getelementptr inbounds i8, i8* %dst.unwrapped, i64 3
  store i8 %conv7, i8* %arrayidx8, align 1
  %shr9 = lshr i64 %shr6, 8
  %conv10 = trunc i64 %shr9 to i8
  %arrayidx11 = getelementptr inbounds i8, i8* %dst.unwrapped, i64 4
  store i8 %conv10, i8* %arrayidx11, align 1
  %shr12 = lshr i64 %shr9, 8
  %conv13 = trunc i64 %shr12 to i8
  %arrayidx14 = getelementptr inbounds i8, i8* %dst.unwrapped, i64 5
  store i8 %conv13, i8* %arrayidx14, align 1
  %shr15 = lshr i64 %shr12, 8
  %conv16 = trunc i64 %shr15 to i8
  %arrayidx17 = getelementptr inbounds i8, i8* %dst.unwrapped, i64 6
  store i8 %conv16, i8* %arrayidx17, align 1
  %shr18 = lshr i64 %shr15, 8
  %conv19 = trunc i64 %shr18 to i8
  %arrayidx20 = getelementptr inbounds i8, i8* %dst.unwrapped, i64 7
  store i8 %conv19, i8* %arrayidx20, align 1
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i64 @load64_le(%struct.uint8ptr_wrapped_ty* noundef %src) #0 {
entry:
  %src.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %src, i32 0, i32 1
  %src.field0.length = load i64, i64* %src.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %src, i32 0, i32 0
  %src.unwrapped = load i8*, i8** %0, align 8
  %arrayidx = getelementptr inbounds i8, i8* %src.unwrapped, i64 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %1 to i64
  %arrayidx1 = getelementptr inbounds i8, i8* %src.unwrapped, i64 1
  %2 = load i8, i8* %arrayidx1, align 1
  %conv2 = zext i8 %2 to i64
  %shl = shl i64 %conv2, 8
  %or = or i64 %conv, %shl
  %arrayidx3 = getelementptr inbounds i8, i8* %src.unwrapped, i64 2
  %3 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %3 to i64
  %shl5 = shl i64 %conv4, 16
  %or6 = or i64 %or, %shl5
  %arrayidx7 = getelementptr inbounds i8, i8* %src.unwrapped, i64 3
  %4 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %4 to i64
  %shl9 = shl i64 %conv8, 24
  %or10 = or i64 %or6, %shl9
  %arrayidx11 = getelementptr inbounds i8, i8* %src.unwrapped, i64 4
  %5 = load i8, i8* %arrayidx11, align 1
  %conv12 = zext i8 %5 to i64
  %shl13 = shl i64 %conv12, 32
  %or14 = or i64 %or10, %shl13
  %arrayidx15 = getelementptr inbounds i8, i8* %src.unwrapped, i64 5
  %6 = load i8, i8* %arrayidx15, align 1
  %conv16 = zext i8 %6 to i64
  %shl17 = shl i64 %conv16, 40
  %or18 = or i64 %or14, %shl17
  %arrayidx19 = getelementptr inbounds i8, i8* %src.unwrapped, i64 6
  %7 = load i8, i8* %arrayidx19, align 1
  %conv20 = zext i8 %7 to i64
  %shl21 = shl i64 %conv20, 48
  %or22 = or i64 %or18, %shl21
  %arrayidx23 = getelementptr inbounds i8, i8* %src.unwrapped, i64 7
  %8 = load i8, i8* %arrayidx23, align 1
  %conv24 = zext i8 %8 to i64
  %shl25 = shl i64 %conv24, 56
  %or26 = or i64 %or22, %shl25
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i64 %or26
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @_crypto_verify_16(%struct.uint8ptr_wrapped_ty* noundef %x, %struct.uint8ptr_wrapped_ty* noundef %y) #0 {
entry:
  %x.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %x, i32 0, i32 1
  %x.field0.length = load i64, i64* %x.field0.length.ptr, align 8
  %y.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %y, i32 0, i32 1
  %y.field0.length = load i64, i64* %y.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.2 = alloca i1, align 1
  store i1 false, i1* %out.2, align 1
  %out.3 = alloca i1, align 1
  store i1 false, i1* %out.3, align 1
  %out.frozen = alloca i1, align 1
  store i1 false, i1* %out.frozen, align 1
  %out.4 = alloca i1, align 1
  store i1 false, i1* %out.4, align 1
  %out.5 = alloca i1, align 1
  store i1 false, i1* %out.5, align 1
  %out.6 = alloca i1, align 1
  store i1 false, i1* %out.6, align 1
  %out.7 = alloca i1, align 1
  store i1 false, i1* %out.7, align 1
  %out.8 = alloca i1, align 1
  store i1 false, i1* %out.8, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.6, align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %x, i32 0, i32 0
  %x.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %y, i32 0, i32 0
  %y.unwrapped = load i8*, i8** %1, align 8
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  store i8* %x.unwrapped, i8** %x.addr, align 8
  %x.addr1 = bitcast i8** %x.addr to i8*
  call void @llvm.var.annotation(i8* %x.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1.14, i32 0, i32 0), i32 12, i8* null)
  store i8* %y.unwrapped, i8** %y.addr, align 8
  %y.addr2 = bitcast i8** %y.addr to i8*
  call void @llvm.var.annotation(i8* %y.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1.14, i32 0, i32 0), i32 13, i8* null)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %exitpred.frozen1.rewritten = phi i1 [ %17, %for.inc ], [ false, %entry ]
  %2 = load i1, i1* %out.6, align 1
  %3 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %3
  %cond.fold = or i1 %fwcond.and.fwtaken, %2
  store i1 %cond.fold, i1* %out.2, align 1
  %4 = load i1, i1* %out.2, align 1
  %cmp = icmp ult i32 %i.0.rewritten, 16
  br i1 %cmp, label %for.body, label %if.then

for.body:                                         ; preds = %for.cond
  %5 = load i1, i1* %out.2, align 1
  %in. = and i1 %5, %cmp
  %cond.fold9 = or i1 false, %in.
  store i1 %cond.fold9, i1* %out.3, align 1
  %6 = load i1, i1* %out.3, align 1
  %load.frozen = load i1, i1* %out.frozen, align 1
  %or.frozen = or i1 %load.frozen, %cond.fold9
  store i1 %or.frozen, i1* %out.frozen, align 1
  %7 = bitcast i64* %shadow to i8**
  %ctsel = select i1 %6, i8** %x.addr, i8** %7
  %8 = load i8*, i8** %ctsel, align 8
  %idxprom = zext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds i8, i8* %8, i64 %idxprom
  %idx0.safe = icmp slt i64 %idxprom, 0
  %9 = or i1 %6, %idx0.safe
  %10 = bitcast i64* %shadow to i8*
  %ctsel19 = select i1 %9, i8* %arrayidx, i8* %10
  %11 = load i8, i8* %ctsel19, align 1
  %conv = zext i8 %11 to i32
  %12 = bitcast i64* %shadow to i8**
  %ctsel20 = select i1 %6, i8** %y.addr, i8** %12
  %13 = load i8*, i8** %ctsel20, align 8
  %idxprom3 = zext i32 %i.0.rewritten to i64
  %arrayidx4 = getelementptr inbounds i8, i8* %13, i64 %idxprom3
  %idx0.safe21 = icmp slt i64 %idxprom3, 0
  %14 = or i1 %6, %idx0.safe21
  %15 = bitcast i64* %shadow to i8*
  %ctsel22 = select i1 %14, i8* %arrayidx4, i8* %15
  %16 = load i8, i8* %ctsel22, align 1
  %conv5 = zext i8 %16 to i32
  %cmp6 = icmp ne i32 %conv, %conv5
  %17 = or i1 %cmp6, %exitpred.frozen1.rewritten
  br label %if.end

if.then:                                          ; preds = %for.cond
  %18 = load i1, i1* %out.frozen, align 1
  %in.10 = and i1 %18, %exitpred.frozen1.rewritten
  %cond.fold11 = or i1 false, %in.10
  store i1 %cond.fold11, i1* %out.4, align 1
  %19 = load i1, i1* %out.4, align 1
  br label %for.end

if.end:                                           ; preds = %for.body
  %20 = load i1, i1* %out.3, align 1
  %21 = xor i1 %17, true
  %in.12 = and i1 %20, %21
  %cond.fold13 = or i1 false, %in.12
  store i1 %cond.fold13, i1* %out.5, align 1
  %22 = load i1, i1* %out.5, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %23 = load i1, i1* %out.5, align 1
  %cond.fold14 = or i1 false, %23
  store i1 %cond.fold14, i1* %out.6, align 1
  %24 = load i1, i1* %out.6, align 1
  %inc = add i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !22

for.end:                                          ; preds = %if.then
  %25 = load i1, i1* %out.2, align 1
  %26 = xor i1 %cmp, true
  %in.15 = and i1 %25, %26
  %cond.fold16 = or i1 false, %in.15
  store i1 %cond.fold16, i1* %out.7, align 1
  %27 = load i1, i1* %out.7, align 1
  br label %return

return:                                           ; preds = %for.end
  %retval.0.rewritten = phi i1 [ true, %for.end ]
  %28 = load i1, i1* %out.7, align 1
  %29 = load i1, i1* %out.4, align 1
  %phi.fold = select i1 %29, i1 false, i1 %retval.0.rewritten
  %cond.fold17 = or i1 false, %29
  %cond.fold18 = or i1 %cond.fold17, %28
  store i1 %cond.fold18, i1* %out.8, align 1
  ret i1 %phi.fold
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @__crypto_stream_xsalsa20(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %n, %struct.uint8ptr_wrapped_ty* noundef %k) #0 {
entry:
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %c.field0.length = load i64, i64* %c.field0.length.ptr, align 8
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %k.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 1
  %k.field0.length = load i64, i64* %k.field0.length.ptr, align 8
  %arraydecay.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay2.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  %subkey = alloca [32 x i8], align 16
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 98, i8* null)
  %2 = bitcast [32 x i8]* %subkey to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 32, i1 false)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  %3 = load i8*, i8** %k.addr, align 8
  %arraydecay.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, i32 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay, i8** %arraydecay.unwrapped, align 8
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %3, i8** %arg.unwrapped, align 8
  call void @__crypto_core_hsalsa20(%struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* %arg.wrapped)
  %add.ptr = getelementptr inbounds i8, i8* %n.unwrapped, i64 16
  %arraydecay2 = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  %add.ptr.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 0
  %add.ptr.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 1
  store i64 %n.field0.length, i64* %add.ptr.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr, i8** %add.ptr.unwrapped, align 8
  %arraydecay2.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay2.wrapped, i32 0, i32 0
  %arraydecay2.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay2.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay2.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay2, i8** %arraydecay2.unwrapped, align 8
  %call = call i32 @_crypto_stream_salsa20(%struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, %struct.uint8ptr_wrapped_ty* %arraydecay2.wrapped)
  %arraydecay3 = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  call void @sodium_memzero(i8* noundef %arraydecay3, i64 noundef 32)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 %call
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @__crypto_stream_xsalsa20_xor_ic(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, %struct.uint8ptr_wrapped_ty* noundef %n, i64 noundef %ic, %struct.uint8ptr_wrapped_ty* noundef %k) #0 {
entry:
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %c.field0.length = load i64, i64* %c.field0.length.ptr, align 8
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %m.field0.length = load i64, i64* %m.field0.length.ptr, align 8
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %k.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 1
  %k.field0.length = load i64, i64* %k.field0.length.ptr, align 8
  %add.ptr.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay2.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  %subkey = alloca [32 x i8], align 16
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 118, i8* null)
  %2 = bitcast [32 x i8]* %subkey to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 32, i1 false)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  %3 = load i8*, i8** %k.addr, align 8
  %arraydecay.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, i32 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay, i8** %arraydecay.unwrapped, align 8
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %3, i8** %arg.unwrapped, align 8
  call void @__crypto_core_hsalsa20(%struct.uint8ptr_wrapped_ty* %arraydecay.wrapped, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* %arg.wrapped)
  %add.ptr = getelementptr inbounds i8, i8* %n.unwrapped, i64 16
  %arraydecay2 = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  %add.ptr.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 0
  %add.ptr.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 1
  store i64 %n.field0.length, i64* %add.ptr.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr, i8** %add.ptr.unwrapped, align 8
  %arraydecay2.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay2.wrapped, i32 0, i32 0
  %arraydecay2.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay2.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay2.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay2, i8** %arraydecay2.unwrapped, align 8
  %call = call i32 @_crypto_stream_salsa20_xor_ic(%struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* %m, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i64 %ic, %struct.uint8ptr_wrapped_ty* %arraydecay2.wrapped)
  %arraydecay3 = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  call void @sodium_memzero(i8* noundef %arraydecay3, i64 noundef 32)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 %call
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @__crypto_stream_xsalsa20_xor(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, %struct.uint8ptr_wrapped_ty* noundef %n, %struct.uint8ptr_wrapped_ty* noundef %k, i1 %entry.cond) #0 {
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %c.field0.length = load i64, i64* %c.field0.length.ptr, align 8
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %m.field0.length = load i64, i64* %m.field0.length.ptr, align 8
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %k.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 1
  %k.field0.length = load i64, i64* %k.field0.length.ptr, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %entry

entry:                                            ; preds = %0
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 0
  %n.unwrapped = load i8*, i8** %1, align 8
  %2 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 0
  %k.unwrapped = load i8*, i8** %2, align 8
  %k.addr = alloca i8*, align 8
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 138, i8* null)
  %3 = load i8*, i8** %k.addr, align 8
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %3, i8** %arg.unwrapped, align 8
  %call = call i32 @__crypto_stream_xsalsa20_xor_ic(%struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* %m, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i64 0, %struct.uint8ptr_wrapped_ty* %arg.wrapped)
  ret i32 %call
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @__crypto_secretbox_xsalsa20poly1305(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, %struct.uint8ptr_wrapped_ty* noundef %n, %struct.uint8ptr_wrapped_ty* noundef %k) #0 {
entry:
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %c.field0.length = load i64, i64* %c.field0.length.ptr, align 8
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %m.field0.length = load i64, i64* %m.field0.length.ptr, align 8
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %k.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 1
  %k.field0.length = load i64, i64* %k.field0.length.ptr, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay21.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay22.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.1 = alloca i1, align 1
  store i1 false, i1* %out.1, align 1
  %out.2 = alloca i1, align 1
  store i1 false, i1* %out.2, align 1
  %out.3 = alloca i1, align 1
  store i1 false, i1* %out.3, align 1
  %out.4 = alloca i1, align 1
  store i1 false, i1* %out.4, align 1
  %out.5 = alloca i1, align 1
  store i1 false, i1* %out.5, align 1
  %out.6 = alloca i1, align 1
  store i1 false, i1* %out.6, align 1
  %out.7 = alloca i1, align 1
  store i1 false, i1* %out.7, align 1
  %out.8 = alloca i1, align 1
  store i1 false, i1* %out.8, align 1
  %out.9 = alloca i1, align 1
  store i1 false, i1* %out.9, align 1
  %out.10 = alloca i1, align 1
  store i1 false, i1* %out.10, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.8, align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  %c_buf = alloca i8*, align 8
  %cview = alloca [16 x i8], align 16
  %w_mview = alloca %struct.uint8ptr_wrapped_ty, align 8
  %kview = alloca [32 x i8], align 16
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 148, i8* null)
  %c_buf2 = bitcast i8** %c_buf to i8*
  call void @llvm.var.annotation(i8* %c_buf2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 150, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %2 = load i8*, i8** %buf, align 8
  store i8* %2, i8** %c_buf, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %3 = load i64, i64* %len, align 8
  %cmp = icmp ult i64 %3, 32
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i1, i1* %out., align 1
  %in. = and i1 %4, %cmp
  %cond.fold = or i1 false, %in.
  store i1 %cond.fold, i1* %out.1, align 1
  br label %return

if.end:                                           ; preds = %entry
  %5 = load i1, i1* %out., align 1
  %6 = xor i1 %cmp, true
  %in.11 = and i1 %5, %6
  %cond.fold12 = or i1 false, %in.11
  store i1 %cond.fold12, i1* %out.2, align 1
  %len3 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %7 = load i64, i64* %len3, align 8
  %len4 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %8 = load i64, i64* %len4, align 8
  %cmp5 = icmp eq i64 %7, %8
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.end
  %9 = load i1, i1* %out.2, align 1
  %in.13 = and i1 %9, %cmp5
  %cond.fold14 = or i1 false, %in.13
  store i1 %cond.fold14, i1* %out.3, align 1
  br label %if.end7

if.else:                                          ; preds = %if.end
  %10 = load i1, i1* %out.2, align 1
  %11 = xor i1 %cmp5, true
  %in.15 = and i1 %10, %11
  %cond.fold16 = or i1 false, %in.15
  store i1 %cond.fold16, i1* %out.4, align 1
  call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4.20, i64 0, i64 0), i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5.21, i64 0, i64 0), i32 noundef 156, i8* noundef getelementptr inbounds ([110 x i8], [110 x i8]* @__PRETTY_FUNCTION__.__crypto_secretbox_xsalsa20poly1305, i64 0, i64 0)) #7
  unreachable

if.end7:                                          ; preds = %if.then6
  %12 = load i1, i1* %out.3, align 1
  %cond.fold17 = or i1 false, %12
  store i1 %cond.fold17, i1* %out.5, align 1
  %13 = load i8*, i8** %k.addr, align 8
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %13, i8** %arg.unwrapped, align 8
  %cond.fold26 = or i1 false, %12
  %call = call i32 @__crypto_stream_xsalsa20_xor(%struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* %m, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i1 %cond.fold26)
  %cview8 = bitcast [16 x i8]* %cview to i8*
  call void @llvm.var.annotation(i8* %cview8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 159, i8* null)
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %cview, i64 0, i64 0
  %14 = load i8*, i8** %c_buf, align 8
  %add.ptr = getelementptr inbounds i8, i8* %14, i64 16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %add.ptr, i64 16, i1 false)
  %len9 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %15 = load i64, i64* %len9, align 8
  %sub = sub i64 %15, 32
  %len10 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_mview, i32 0, i32 1
  store i64 %sub, i64* %len10, align 8
  %len11 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_mview, i32 0, i32 1
  %16 = load i64, i64* %len11, align 8
  %mul = mul i64 %16, 1
  %call12 = call noalias i8* @malloc(i64 noundef %mul) #8
  %buf13 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_mview, i32 0, i32 0
  %w_mview.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_mview, i32 0, i32 1
  store i64 %mul, i64* %w_mview.field0.length.ptr, align 8
  store i8* %call12, i8** %buf13, align 8
  %buf14 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_mview, i32 0, i32 0
  %17 = load i8*, i8** %buf14, align 8
  %18 = load i8*, i8** %c_buf, align 8
  %add.ptr15 = getelementptr inbounds i8, i8* %18, i64 32
  %len16 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %19 = load i64, i64* %len16, align 8
  %sub17 = sub i64 %19, 32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %17, i8* align 1 %add.ptr15, i64 %sub17, i1 false)
  %kview18 = bitcast [32 x i8]* %kview to i8*
  call void @llvm.var.annotation(i8* %kview18, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 167, i8* null)
  %arraydecay19 = getelementptr inbounds [32 x i8], [32 x i8]* %kview, i64 0, i64 0
  %20 = load i8*, i8** %c_buf, align 8
  %add.ptr20 = getelementptr inbounds i8, i8* %20, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay19, i8* align 1 %add.ptr20, i64 32, i1 false)
  %arraydecay21 = getelementptr inbounds [16 x i8], [16 x i8]* %cview, i64 0, i64 0
  %arraydecay22 = getelementptr inbounds [32 x i8], [32 x i8]* %kview, i64 0, i64 0
  %arraydecay21.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay21.wrapped, i32 0, i32 0
  %arraydecay21.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay21.wrapped, i32 0, i32 1
  store i64 16, i64* %arraydecay21.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay21, i8** %arraydecay21.unwrapped, align 8
  %arraydecay22.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay22.wrapped, i32 0, i32 0
  %arraydecay22.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay22.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay22.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay22, i8** %arraydecay22.unwrapped, align 8
  %call23 = call i32 @_crypto_onetimeauth_poly1305(%struct.uint8ptr_wrapped_ty* %arraydecay21.wrapped, %struct.uint8ptr_wrapped_ty* %w_mview, %struct.uint8ptr_wrapped_ty* %arraydecay22.wrapped)
  %buf24 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %21 = load i8*, i8** %buf24, align 8
  %add.ptr25 = getelementptr inbounds i8, i8* %21, i64 16
  %arraydecay26 = getelementptr inbounds [16 x i8], [16 x i8]* %cview, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %add.ptr25, i8* align 16 %arraydecay26, i64 16, i1 false)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end7
  %i.0.rewritten = phi i64 [ 0, %if.end7 ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %if.end7 ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp27, %for.inc ], [ false, %if.end7 ]
  %22 = load i1, i1* %out.8, align 1
  %23 = load i1, i1* %out.5, align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %23
  %cond.fold18 = or i1 %fwcond.and.fwtaken, %22
  store i1 %cond.fold18, i1* %out.6, align 1
  %cmp27 = icmp ult i64 %i.0.rewritten, 16
  br i1 %cmp27, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %24 = load i1, i1* %out.6, align 1
  %in.19 = and i1 %24, %cmp27
  %cond.fold20 = or i1 false, %in.19
  store i1 %cond.fold20, i1* %out.7, align 1
  %buf28 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %25 = load i8*, i8** %buf28, align 8
  %arrayidx = getelementptr inbounds i8, i8* %25, i64 %i.0.rewritten
  store i8 0, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %26 = load i1, i1* %out.7, align 1
  %cond.fold21 = or i1 false, %26
  store i1 %cond.fold21, i1* %out.8, align 1
  %inc = add i64 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !23

for.end:                                          ; preds = %for.cond
  %27 = load i1, i1* %out.6, align 1
  %28 = xor i1 %cmp27, true
  %in.22 = and i1 %27, %28
  %cond.fold23 = or i1 false, %in.22
  store i1 %cond.fold23, i1* %out.9, align 1
  br label %return

return:                                           ; preds = %for.end, %if.then
  %retval.0.rewritten = phi i1 [ false, %if.then ], [ true, %for.end ]
  %29 = load i1, i1* %out.9, align 1
  %30 = load i1, i1* %out.1, align 1
  %cond.fold24 = or i1 false, %30
  %cond.fold25 = or i1 %cond.fold24, %29
  store i1 %cond.fold25, i1* %out.10, align 1
  ret i1 %retval.0.rewritten
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @__crypto_secretbox_xsalsa20poly1305_open(%struct.uint8ptr_wrapped_ty* noundef %m, %struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %n, %struct.uint8ptr_wrapped_ty* noundef %k) #0 {
entry:
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %m.field0.length = load i64, i64* %m.field0.length.ptr, align 8
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %c.field0.length = load i64, i64* %c.field0.length.ptr, align 8
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %k.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 1
  %k.field0.length = load i64, i64* %k.field0.length.ptr, align 8
  %arraydecay24.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay25.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %n.unwrapped.wrapped33 = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped35 = alloca %struct.uint8ptr_wrapped_ty, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.1 = alloca i1, align 1
  store i1 false, i1* %out.1, align 1
  %out.2 = alloca i1, align 1
  store i1 false, i1* %out.2, align 1
  %out.3 = alloca i1, align 1
  store i1 false, i1* %out.3, align 1
  %out.4 = alloca i1, align 1
  store i1 false, i1* %out.4, align 1
  %out.5 = alloca i1, align 1
  store i1 false, i1* %out.5, align 1
  %out.6 = alloca i1, align 1
  store i1 false, i1* %out.6, align 1
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
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.10, align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  %c_buf = alloca i8*, align 8
  %w_subkey = alloca %struct.uint8ptr_wrapped_ty, align 8
  %subkey = alloca [32 x i8], align 16
  %tmp1 = alloca [16 x i8], align 16
  %w_cview = alloca %struct.uint8ptr_wrapped_ty, align 8
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 190, i8* null)
  %c_buf2 = bitcast i8** %c_buf to i8*
  call void @llvm.var.annotation(i8* %c_buf2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 192, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %2 = load i8*, i8** %buf, align 8
  store i8* %2, i8** %c_buf, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %3 = load i64, i64* %len, align 8
  %cmp = icmp ult i64 %3, 32
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i1, i1* %out., align 1
  %in. = and i1 %4, %cmp
  %cond.fold = or i1 false, %in.
  store i1 %cond.fold, i1* %out.1, align 1
  br label %return

if.end:                                           ; preds = %entry
  %5 = load i1, i1* %out., align 1
  %6 = xor i1 %cmp, true
  %in.13 = and i1 %5, %6
  %cond.fold14 = or i1 false, %in.13
  store i1 %cond.fold14, i1* %out.2, align 1
  %len3 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %7 = load i64, i64* %len3, align 8
  %len4 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %8 = load i64, i64* %len4, align 8
  %cmp5 = icmp eq i64 %7, %8
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.end
  %9 = load i1, i1* %out.2, align 1
  %in.15 = and i1 %9, %cmp5
  %cond.fold16 = or i1 false, %in.15
  store i1 %cond.fold16, i1* %out.3, align 1
  br label %if.end7

if.else:                                          ; preds = %if.end
  %10 = load i1, i1* %out.2, align 1
  %11 = xor i1 %cmp5, true
  %in.17 = and i1 %10, %11
  %cond.fold18 = or i1 false, %in.17
  store i1 %cond.fold18, i1* %out.4, align 1
  call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4.20, i64 0, i64 0), i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5.21, i64 0, i64 0), i32 noundef 198, i8* noundef getelementptr inbounds ([115 x i8], [115 x i8]* @__PRETTY_FUNCTION__.__crypto_secretbox_xsalsa20poly1305_open, i64 0, i64 0)) #7
  unreachable

if.end7:                                          ; preds = %if.then6
  %12 = load i1, i1* %out.3, align 1
  %cond.fold19 = or i1 false, %12
  store i1 %cond.fold19, i1* %out.5, align 1
  %len8 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_subkey, i32 0, i32 1
  store i64 32, i64* %len8, align 8
  %len9 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_subkey, i32 0, i32 1
  %13 = load i64, i64* %len9, align 8
  %call = call noalias i8* @calloc(i64 noundef %13, i64 noundef 1) #8
  %buf10 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_subkey, i32 0, i32 0
  %w_subkey.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_subkey, i32 0, i32 1
  store i64 %13, i64* %w_subkey.field0.length.ptr, align 8
  store i8* %call, i8** %buf10, align 8
  %14 = load i8*, i8** %k.addr, align 8
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %14, i8** %arg.unwrapped, align 8
  %call11 = call i32 @__crypto_stream_xsalsa20(%struct.uint8ptr_wrapped_ty* %w_subkey, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* %arg.wrapped)
  %subkey12 = bitcast [32 x i8]* %subkey to i8*
  call void @llvm.var.annotation(i8* %subkey12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 205, i8* null)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  %buf13 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_subkey, i32 0, i32 0
  %15 = load i8*, i8** %buf13, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %15, i64 32, i1 false)
  %arraydecay14 = getelementptr inbounds [16 x i8], [16 x i8]* %tmp1, i64 0, i64 0
  %16 = load i8*, i8** %c_buf, align 8
  %add.ptr = getelementptr inbounds i8, i8* %16, i64 16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay14, i8* align 1 %add.ptr, i64 16, i1 false)
  %len15 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %17 = load i64, i64* %len15, align 8
  %sub = sub i64 %17, 32
  %len16 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_cview, i32 0, i32 1
  store i64 %sub, i64* %len16, align 8
  %len17 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_cview, i32 0, i32 1
  %18 = load i64, i64* %len17, align 8
  %mul = mul i64 %18, 1
  %call18 = call noalias i8* @malloc(i64 noundef %mul) #8
  %buf19 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_cview, i32 0, i32 0
  %w_cview.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_cview, i32 0, i32 1
  store i64 %mul, i64* %w_cview.field0.length.ptr, align 8
  store i8* %call18, i8** %buf19, align 8
  %buf20 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_cview, i32 0, i32 0
  %19 = load i8*, i8** %buf20, align 8
  %buf21 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %20 = load i8*, i8** %buf21, align 8
  %add.ptr22 = getelementptr inbounds i8, i8* %20, i64 32
  %len23 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_cview, i32 0, i32 1
  %21 = load i64, i64* %len23, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %19, i8* align 1 %add.ptr22, i64 %21, i1 false)
  %arraydecay24 = getelementptr inbounds [16 x i8], [16 x i8]* %tmp1, i64 0, i64 0
  %arraydecay25 = getelementptr inbounds [32 x i8], [32 x i8]* %subkey, i64 0, i64 0
  %arraydecay24.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay24.wrapped, i32 0, i32 0
  %arraydecay24.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay24.wrapped, i32 0, i32 1
  store i64 16, i64* %arraydecay24.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay24, i8** %arraydecay24.unwrapped, align 8
  %arraydecay25.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay25.wrapped, i32 0, i32 0
  %arraydecay25.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay25.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay25.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay25, i8** %arraydecay25.unwrapped, align 8
  %call26 = call i1 @_crypto_onetimeauth_poly1305_verify(%struct.uint8ptr_wrapped_ty* %arraydecay24.wrapped, %struct.uint8ptr_wrapped_ty* %w_cview, %struct.uint8ptr_wrapped_ty* %arraydecay25.wrapped)
  br label %if.then27

if.then27:                                        ; preds = %if.end7
  %22 = load i1, i1* %out.5, align 1
  %23 = xor i1 %call26, true
  %in.20 = and i1 %22, %23
  %cond.fold21 = or i1 false, %in.20
  store i1 %cond.fold21, i1* %out.6, align 1
  %24 = load i1, i1* %out.6, align 1
  br label %if.end28

if.end28:                                         ; preds = %if.then27
  %25 = load i1, i1* %out.5, align 1
  %in.22 = and i1 %25, %call26
  %cond.fold23 = or i1 false, %in.22
  store i1 %cond.fold23, i1* %out.7, align 1
  %26 = load i1, i1* %out.7, align 1
  %27 = bitcast i64* %shadow to i8**
  %ctsel = select i1 %26, i8** %k.addr, i8** %27
  %28 = load i8*, i8** %ctsel, align 8
  %n.unwrapped.unwrapped34 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped33, i32 0, i32 0
  %n.unwrapped.wrapped33.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped33, i32 0, i32 1
  %29 = or i1 %26, true
  %30 = bitcast i64* %shadow to i64*
  %ctsel38 = select i1 %29, i64* %n.unwrapped.wrapped33.field0.length.ptr, i64* %30
  %31 = load i64, i64* %ctsel38, align 8
  %select.val. = select i1 %26, i64 %n.field0.length, i64 %31
  store i64 %select.val., i64* %ctsel38, align 8
  %32 = or i1 %26, true
  %33 = bitcast i64* %shadow to i8**
  %ctsel39 = select i1 %32, i8** %n.unwrapped.unwrapped34, i8** %33
  %34 = load i8*, i8** %ctsel39, align 8
  %select.val.40 = select i1 %26, i8* %n.unwrapped, i8* %34
  store i8* %select.val.40, i8** %ctsel39, align 8
  %arg.unwrapped36 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped35, i32 0, i32 0
  %arg.wrapped35.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped35, i32 0, i32 1
  %35 = or i1 %26, true
  %36 = bitcast i64* %shadow to i64*
  %ctsel41 = select i1 %35, i64* %arg.wrapped35.field0.length.ptr, i64* %36
  %37 = load i64, i64* %ctsel41, align 8
  %select.val.42 = select i1 %26, i64 0, i64 %37
  store i64 %select.val.42, i64* %ctsel41, align 8
  %38 = or i1 %26, true
  %39 = bitcast i64* %shadow to i8**
  %ctsel43 = select i1 %38, i8** %arg.unwrapped36, i8** %39
  %40 = load i8*, i8** %ctsel43, align 8
  %select.val.44 = select i1 %26, i8* %28, i8* %40
  store i8* %select.val.44, i8** %ctsel43, align 8
  %cond.fold37 = or i1 false, %in.22
  %call29 = call i32 @__crypto_stream_xsalsa20_xor(%struct.uint8ptr_wrapped_ty* %m, %struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped33, %struct.uint8ptr_wrapped_ty* %arg.wrapped35, i1 %cond.fold37)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end28
  %i.0.rewritten = phi i32 [ 0, %if.end28 ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %if.end28 ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp30, %for.inc ], [ false, %if.end28 ]
  %41 = load i1, i1* %out.10, align 1
  %42 = load i1, i1* %out.7, align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %42
  %cond.fold24 = or i1 %fwcond.and.fwtaken, %41
  store i1 %cond.fold24, i1* %out.8, align 1
  %43 = load i1, i1* %out.8, align 1
  %cmp30 = icmp ult i32 %i.0.rewritten, 32
  br i1 %cmp30, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %44 = load i1, i1* %out.8, align 1
  %in.25 = and i1 %44, %cmp30
  %cond.fold26 = or i1 false, %in.25
  store i1 %cond.fold26, i1* %out.9, align 1
  %45 = load i1, i1* %out.9, align 1
  %buf31 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %46 = or i1 %45, true
  %47 = bitcast i64* %shadow to i8**
  %ctsel45 = select i1 %46, i8** %buf31, i8** %47
  %48 = load i8*, i8** %ctsel45, align 8
  %idxprom = zext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds i8, i8* %48, i64 %idxprom
  %idx0.safe = icmp slt i64 %idxprom, %m.field0.length
  %49 = or i1 %45, %idx0.safe
  %50 = bitcast i64* %shadow to i8*
  %ctsel46 = select i1 %49, i8* %arrayidx, i8* %50
  %51 = load i8, i8* %ctsel46, align 1
  %select.val.47 = select i1 %45, i8 0, i8 %51
  store i8 %select.val.47, i8* %ctsel46, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %52 = load i1, i1* %out.9, align 1
  %cond.fold27 = or i1 false, %52
  store i1 %cond.fold27, i1* %out.10, align 1
  %53 = load i1, i1* %out.10, align 1
  %inc = add i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !24

for.end:                                          ; preds = %for.cond
  %54 = load i1, i1* %out.8, align 1
  %55 = xor i1 %cmp30, true
  %in.28 = and i1 %54, %55
  %cond.fold29 = or i1 false, %in.28
  store i1 %cond.fold29, i1* %out.11, align 1
  %56 = load i1, i1* %out.11, align 1
  br label %return

return:                                           ; preds = %for.end, %if.then
  %retval.0.rewritten = phi i1 [ false, %if.then ], [ true, %for.end ]
  %57 = load i1, i1* %out.11, align 1
  %58 = load i1, i1* %out.6, align 1
  %phi.fold = select i1 %58, i1 false, i1 %retval.0.rewritten
  %59 = load i1, i1* %out.1, align 1
  %cond.fold30 = or i1 false, %57
  %cond.fold31 = or i1 %cond.fold30, %58
  %cond.fold32 = or i1 %cond.fold31, %59
  store i1 %cond.fold32, i1* %out.12, align 1
  ret i1 %phi.fold
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @__crypto_secretbox(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, %struct.uint8ptr_wrapped_ty* noundef %n, %struct.uint8ptr_wrapped_ty* noundef %k) #0 {
entry:
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %c.field0.length = load i64, i64* %c.field0.length.ptr, align 8
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %m.field0.length = load i64, i64* %m.field0.length.ptr, align 8
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %k.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 1
  %k.field0.length = load i64, i64* %k.field0.length.ptr, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 240, i8* null)
  %2 = load i8*, i8** %k.addr, align 8
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %2, i8** %arg.unwrapped, align 8
  %call = call i1 @__crypto_secretbox_xsalsa20poly1305(%struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* %m, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* %arg.wrapped)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i1 %call
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @__crypto_secretbox_open(%struct.uint8ptr_wrapped_ty* noundef %m, %struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %n, %struct.uint8ptr_wrapped_ty* noundef %k) #0 {
entry:
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %m.field0.length = load i64, i64* %m.field0.length.ptr, align 8
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %c.field0.length = load i64, i64* %c.field0.length.ptr, align 8
  %n.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 1
  %n.field0.length = load i64, i64* %n.field0.length.ptr, align 8
  %k.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 1
  %k.field0.length = load i64, i64* %k.field0.length.ptr, align 8
  %n.unwrapped.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n, i32 0, i32 0
  %n.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 0
  %k.unwrapped = load i8*, i8** %1, align 8
  %k.addr = alloca i8*, align 8
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 250, i8* null)
  %2 = load i8*, i8** %k.addr, align 8
  %n.unwrapped.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 0
  %n.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, i32 0, i32 1
  store i64 %n.field0.length, i64* %n.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %n.unwrapped, i8** %n.unwrapped.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %2, i8** %arg.unwrapped, align 8
  %call = call i1 @__crypto_secretbox_xsalsa20poly1305_open(%struct.uint8ptr_wrapped_ty* %m, %struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* %n.unwrapped.wrapped, %struct.uint8ptr_wrapped_ty* %arg.wrapped)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i1 %call
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) #6

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @__crypto_core_hsalsa20(%struct.uint8ptr_wrapped_ty* noundef %out, %struct.uint8ptr_wrapped_ty* noundef %input, %struct.uint8ptr_wrapped_ty* noundef %k) #0 {
entry:
  %out.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %out, i32 0, i32 1
  %out.field0.length = load i64, i64* %out.field0.length.ptr, align 8
  %input.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %input, i32 0, i32 1
  %input.field0.length = load i64, i64* %input.field0.length.ptr, align 8
  %k.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 1
  %k.field0.length = load i64, i64* %k.field0.length.ptr, align 8
  %add.ptr123.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr122.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr121.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr120.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr119.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr118.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr117.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped11 = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr22.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr20.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr18.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped9 = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr15.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr13.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr11.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr9.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr7.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr5.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %add.ptr.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arg.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.1 = alloca i1, align 1
  store i1 false, i1* %out.1, align 1
  %out.2 = alloca i1, align 1
  store i1 false, i1* %out.2, align 1
  %out.3 = alloca i1, align 1
  store i1 false, i1* %out.3, align 1
  %out.4 = alloca i1, align 1
  store i1 false, i1* %out.4, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.3, align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %out, i32 0, i32 0
  %out.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %input, i32 0, i32 0
  %input.unwrapped = load i8*, i8** %1, align 8
  %2 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %k, i32 0, i32 0
  %k.unwrapped = load i8*, i8** %2, align 8
  %out.addr = alloca i8*, align 8
  %input.addr = alloca i8*, align 8
  %k.addr = alloca i8*, align 8
  store i8* %out.unwrapped, i8** %out.addr, align 8
  %out.addr1 = bitcast i8** %out.addr to i8*
  call void @llvm.var.annotation(i8* %out.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 27, i8* null)
  store i8* %input.unwrapped, i8** %input.addr, align 8
  %input.addr2 = bitcast i8** %input.addr to i8*
  call void @llvm.var.annotation(i8* %input.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 28, i8* null)
  store i8* %k.unwrapped, i8** %k.addr, align 8
  %k.addr3 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.17, i32 0, i32 0), i32 29, i8* null)
  %3 = load i8*, i8** %k.addr, align 8
  %arg.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped, i32 0, i32 1
  store i64 0, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* %3, i8** %arg.unwrapped, align 8
  %call = call i32 @load32_le.22(%struct.uint8ptr_wrapped_ty* %arg.wrapped)
  %4 = load i8*, i8** %k.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 4
  %add.ptr.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 0
  %add.ptr.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr, i8** %add.ptr.unwrapped, align 8
  %call4 = call i32 @load32_le.22(%struct.uint8ptr_wrapped_ty* %add.ptr.wrapped)
  %5 = load i8*, i8** %k.addr, align 8
  %add.ptr5 = getelementptr inbounds i8, i8* %5, i64 8
  %add.ptr5.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr5.wrapped, i32 0, i32 0
  %add.ptr5.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr5.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr5.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr5, i8** %add.ptr5.unwrapped, align 8
  %call6 = call i32 @load32_le.22(%struct.uint8ptr_wrapped_ty* %add.ptr5.wrapped)
  %6 = load i8*, i8** %k.addr, align 8
  %add.ptr7 = getelementptr inbounds i8, i8* %6, i64 12
  %add.ptr7.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr7.wrapped, i32 0, i32 0
  %add.ptr7.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr7.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr7.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr7, i8** %add.ptr7.unwrapped, align 8
  %call8 = call i32 @load32_le.22(%struct.uint8ptr_wrapped_ty* %add.ptr7.wrapped)
  %7 = load i8*, i8** %k.addr, align 8
  %add.ptr9 = getelementptr inbounds i8, i8* %7, i64 16
  %add.ptr9.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr9.wrapped, i32 0, i32 0
  %add.ptr9.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr9.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr9.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr9, i8** %add.ptr9.unwrapped, align 8
  %call10 = call i32 @load32_le.22(%struct.uint8ptr_wrapped_ty* %add.ptr9.wrapped)
  %8 = load i8*, i8** %k.addr, align 8
  %add.ptr11 = getelementptr inbounds i8, i8* %8, i64 20
  %add.ptr11.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr11.wrapped, i32 0, i32 0
  %add.ptr11.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr11.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr11.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr11, i8** %add.ptr11.unwrapped, align 8
  %call12 = call i32 @load32_le.22(%struct.uint8ptr_wrapped_ty* %add.ptr11.wrapped)
  %9 = load i8*, i8** %k.addr, align 8
  %add.ptr13 = getelementptr inbounds i8, i8* %9, i64 24
  %add.ptr13.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr13.wrapped, i32 0, i32 0
  %add.ptr13.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr13.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr13.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr13, i8** %add.ptr13.unwrapped, align 8
  %call14 = call i32 @load32_le.22(%struct.uint8ptr_wrapped_ty* %add.ptr13.wrapped)
  %10 = load i8*, i8** %k.addr, align 8
  %add.ptr15 = getelementptr inbounds i8, i8* %10, i64 28
  %add.ptr15.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr15.wrapped, i32 0, i32 0
  %add.ptr15.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr15.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr15.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr15, i8** %add.ptr15.unwrapped, align 8
  %call16 = call i32 @load32_le.22(%struct.uint8ptr_wrapped_ty* %add.ptr15.wrapped)
  %11 = load i8*, i8** %input.addr, align 8
  %arg.unwrapped10 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped9, i32 0, i32 0
  %arg.wrapped9.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped9, i32 0, i32 1
  store i64 0, i64* %arg.wrapped9.field0.length.ptr, align 8
  store i8* %11, i8** %arg.unwrapped10, align 8
  %call17 = call i32 @load32_le.22(%struct.uint8ptr_wrapped_ty* %arg.wrapped9)
  %12 = load i8*, i8** %input.addr, align 8
  %add.ptr18 = getelementptr inbounds i8, i8* %12, i64 4
  %add.ptr18.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr18.wrapped, i32 0, i32 0
  %add.ptr18.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr18.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr18.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr18, i8** %add.ptr18.unwrapped, align 8
  %call19 = call i32 @load32_le.22(%struct.uint8ptr_wrapped_ty* %add.ptr18.wrapped)
  %13 = load i8*, i8** %input.addr, align 8
  %add.ptr20 = getelementptr inbounds i8, i8* %13, i64 8
  %add.ptr20.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr20.wrapped, i32 0, i32 0
  %add.ptr20.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr20.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr20.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr20, i8** %add.ptr20.unwrapped, align 8
  %call21 = call i32 @load32_le.22(%struct.uint8ptr_wrapped_ty* %add.ptr20.wrapped)
  %14 = load i8*, i8** %input.addr, align 8
  %add.ptr22 = getelementptr inbounds i8, i8* %14, i64 12
  %add.ptr22.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr22.wrapped, i32 0, i32 0
  %add.ptr22.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr22.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr22.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr22, i8** %add.ptr22.unwrapped, align 8
  %call23 = call i32 @load32_le.22(%struct.uint8ptr_wrapped_ty* %add.ptr22.wrapped)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %x9.0.rewritten = phi i32 [ %call23, %entry ], [ %xor101, %for.inc ]
  %x8.0.rewritten = phi i32 [ %call21, %entry ], [ %xor98, %for.inc ]
  %x7.0.rewritten = phi i32 [ %call19, %entry ], [ %xor86, %for.inc ]
  %x6.0.rewritten = phi i32 [ %call17, %entry ], [ %xor83, %for.inc ]
  %x14.0.rewritten = phi i32 [ %call16, %entry ], [ %xor113, %for.inc ]
  %x13.0.rewritten = phi i32 [ %call14, %entry ], [ %xor110, %for.inc ]
  %x12.0.rewritten = phi i32 [ %call12, %entry ], [ %xor107, %for.inc ]
  %x11.0.rewritten = phi i32 [ %call10, %entry ], [ %xor95, %for.inc ]
  %x4.0.rewritten = phi i32 [ %call8, %entry ], [ %xor89, %for.inc ]
  %x3.0.rewritten = phi i32 [ %call6, %entry ], [ %xor77, %for.inc ]
  %x2.0.rewritten = phi i32 [ %call4, %entry ], [ %xor74, %for.inc ]
  %x1.0.rewritten = phi i32 [ %call, %entry ], [ %xor71, %for.inc ]
  %x15.0.rewritten = phi i32 [ 1797285236, %entry ], [ %xor116, %for.inc ]
  %x10.0.rewritten = phi i32 [ 2036477234, %entry ], [ %xor104, %for.inc ]
  %x5.0.rewritten = phi i32 [ 857760878, %entry ], [ %xor92, %for.inc ]
  %x0.0.rewritten = phi i32 [ 1634760805, %entry ], [ %xor80, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %15 = load i1, i1* %out.3, align 1
  %16 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %16
  %cond.fold = or i1 %fwcond.and.fwtaken, %15
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp ult i32 %i.0.rewritten, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %17 = load i1, i1* %out.1, align 1
  %in. = and i1 %17, %cmp
  %cond.fold5 = or i1 false, %in.
  store i1 %cond.fold5, i1* %out.2, align 1
  %add = add i32 %x0.0.rewritten, %x12.0.rewritten
  %shl = shl i32 %add, 7
  %xor = xor i32 %x4.0.rewritten, %shl
  %add24 = add i32 %xor, %x0.0.rewritten
  %shl25 = shl i32 %add24, 9
  %xor26 = xor i32 %x8.0.rewritten, %shl25
  %add27 = add i32 %xor26, %xor
  %shl28 = shl i32 %add27, 13
  %xor29 = xor i32 %x12.0.rewritten, %shl28
  %add30 = add i32 %xor29, %xor26
  %shl31 = shl i32 %add30, 18
  %xor32 = xor i32 %x0.0.rewritten, %shl31
  %add33 = add i32 %x5.0.rewritten, %x1.0.rewritten
  %shl34 = shl i32 %add33, 7
  %xor35 = xor i32 %x9.0.rewritten, %shl34
  %add36 = add i32 %xor35, %x5.0.rewritten
  %shl37 = shl i32 %add36, 9
  %xor38 = xor i32 %x13.0.rewritten, %shl37
  %add39 = add i32 %xor38, %xor35
  %shl40 = shl i32 %add39, 13
  %xor41 = xor i32 %x1.0.rewritten, %shl40
  %add42 = add i32 %xor41, %xor38
  %shl43 = shl i32 %add42, 18
  %xor44 = xor i32 %x5.0.rewritten, %shl43
  %add45 = add i32 %x10.0.rewritten, %x6.0.rewritten
  %shl46 = shl i32 %add45, 7
  %xor47 = xor i32 %x14.0.rewritten, %shl46
  %add48 = add i32 %xor47, %x10.0.rewritten
  %shl49 = shl i32 %add48, 9
  %xor50 = xor i32 %x2.0.rewritten, %shl49
  %add51 = add i32 %xor50, %xor47
  %shl52 = shl i32 %add51, 13
  %xor53 = xor i32 %x6.0.rewritten, %shl52
  %add54 = add i32 %xor53, %xor50
  %shl55 = shl i32 %add54, 18
  %xor56 = xor i32 %x10.0.rewritten, %shl55
  %add57 = add i32 %x15.0.rewritten, %x11.0.rewritten
  %shl58 = shl i32 %add57, 7
  %xor59 = xor i32 %x3.0.rewritten, %shl58
  %add60 = add i32 %xor59, %x15.0.rewritten
  %shl61 = shl i32 %add60, 9
  %xor62 = xor i32 %x7.0.rewritten, %shl61
  %add63 = add i32 %xor62, %xor59
  %shl64 = shl i32 %add63, 13
  %xor65 = xor i32 %x11.0.rewritten, %shl64
  %add66 = add i32 %xor65, %xor62
  %shl67 = shl i32 %add66, 18
  %xor68 = xor i32 %x15.0.rewritten, %shl67
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
  %18 = load i1, i1* %out.2, align 1
  %cond.fold6 = or i1 false, %18
  store i1 %cond.fold6, i1* %out.3, align 1
  %inc = add i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !25

for.end:                                          ; preds = %for.cond
  %x9.0.lcssa.rewritten = phi i32 [ %x9.0.rewritten, %for.cond ]
  %x8.0.lcssa.rewritten = phi i32 [ %x8.0.rewritten, %for.cond ]
  %x7.0.lcssa.rewritten = phi i32 [ %x7.0.rewritten, %for.cond ]
  %x6.0.lcssa.rewritten = phi i32 [ %x6.0.rewritten, %for.cond ]
  %x15.0.lcssa.rewritten = phi i32 [ %x15.0.rewritten, %for.cond ]
  %x10.0.lcssa.rewritten = phi i32 [ %x10.0.rewritten, %for.cond ]
  %x5.0.lcssa.rewritten = phi i32 [ %x5.0.rewritten, %for.cond ]
  %x0.0.lcssa.rewritten = phi i32 [ %x0.0.rewritten, %for.cond ]
  %19 = load i1, i1* %out.1, align 1
  %20 = xor i1 %cmp, true
  %in.7 = and i1 %19, %20
  %cond.fold8 = or i1 false, %in.7
  store i1 %cond.fold8, i1* %out.4, align 1
  %21 = load i8*, i8** %out.addr, align 8
  %arg.unwrapped12 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped11, i32 0, i32 0
  %arg.wrapped11.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arg.wrapped11, i32 0, i32 1
  store i64 0, i64* %arg.wrapped11.field0.length.ptr, align 8
  store i8* %21, i8** %arg.unwrapped12, align 8
  call void @store32_le.23(%struct.uint8ptr_wrapped_ty* %arg.wrapped11, i32 %x0.0.lcssa.rewritten)
  %22 = load i8*, i8** %out.addr, align 8
  %add.ptr117 = getelementptr inbounds i8, i8* %22, i64 4
  %add.ptr117.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr117.wrapped, i32 0, i32 0
  %add.ptr117.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr117.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr117.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr117, i8** %add.ptr117.unwrapped, align 8
  call void @store32_le.23(%struct.uint8ptr_wrapped_ty* %add.ptr117.wrapped, i32 %x5.0.lcssa.rewritten)
  %23 = load i8*, i8** %out.addr, align 8
  %add.ptr118 = getelementptr inbounds i8, i8* %23, i64 8
  %add.ptr118.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr118.wrapped, i32 0, i32 0
  %add.ptr118.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr118.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr118.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr118, i8** %add.ptr118.unwrapped, align 8
  call void @store32_le.23(%struct.uint8ptr_wrapped_ty* %add.ptr118.wrapped, i32 %x10.0.lcssa.rewritten)
  %24 = load i8*, i8** %out.addr, align 8
  %add.ptr119 = getelementptr inbounds i8, i8* %24, i64 12
  %add.ptr119.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr119.wrapped, i32 0, i32 0
  %add.ptr119.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr119.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr119.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr119, i8** %add.ptr119.unwrapped, align 8
  call void @store32_le.23(%struct.uint8ptr_wrapped_ty* %add.ptr119.wrapped, i32 %x15.0.lcssa.rewritten)
  %25 = load i8*, i8** %out.addr, align 8
  %add.ptr120 = getelementptr inbounds i8, i8* %25, i64 16
  %add.ptr120.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr120.wrapped, i32 0, i32 0
  %add.ptr120.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr120.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr120.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr120, i8** %add.ptr120.unwrapped, align 8
  call void @store32_le.23(%struct.uint8ptr_wrapped_ty* %add.ptr120.wrapped, i32 %x6.0.lcssa.rewritten)
  %26 = load i8*, i8** %out.addr, align 8
  %add.ptr121 = getelementptr inbounds i8, i8* %26, i64 20
  %add.ptr121.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr121.wrapped, i32 0, i32 0
  %add.ptr121.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr121.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr121.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr121, i8** %add.ptr121.unwrapped, align 8
  call void @store32_le.23(%struct.uint8ptr_wrapped_ty* %add.ptr121.wrapped, i32 %x7.0.lcssa.rewritten)
  %27 = load i8*, i8** %out.addr, align 8
  %add.ptr122 = getelementptr inbounds i8, i8* %27, i64 24
  %add.ptr122.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr122.wrapped, i32 0, i32 0
  %add.ptr122.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr122.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr122.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr122, i8** %add.ptr122.unwrapped, align 8
  call void @store32_le.23(%struct.uint8ptr_wrapped_ty* %add.ptr122.wrapped, i32 %x8.0.lcssa.rewritten)
  %28 = load i8*, i8** %out.addr, align 8
  %add.ptr123 = getelementptr inbounds i8, i8* %28, i64 28
  %add.ptr123.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr123.wrapped, i32 0, i32 0
  %add.ptr123.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %add.ptr123.wrapped, i32 0, i32 1
  store i64 0, i64* %add.ptr123.wrapped.field0.length.ptr, align 8
  store i8* %add.ptr123, i8** %add.ptr123.unwrapped, align 8
  call void @store32_le.23(%struct.uint8ptr_wrapped_ty* %add.ptr123.wrapped, i32 %x9.0.lcssa.rewritten)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @load32_le.22(%struct.uint8ptr_wrapped_ty* noundef %src) #0 {
entry:
  %src.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %src, i32 0, i32 1
  %src.field0.length = load i64, i64* %src.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %src, i32 0, i32 0
  %src.unwrapped = load i8*, i8** %0, align 8
  %arrayidx = getelementptr inbounds i8, i8* %src.unwrapped, i64 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %1 to i32
  %arrayidx1 = getelementptr inbounds i8, i8* %src.unwrapped, i64 1
  %2 = load i8, i8* %arrayidx1, align 1
  %conv2 = zext i8 %2 to i32
  %shl = shl i32 %conv2, 8
  %or = or i32 %conv, %shl
  %arrayidx3 = getelementptr inbounds i8, i8* %src.unwrapped, i64 2
  %3 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %3 to i32
  %shl5 = shl i32 %conv4, 16
  %or6 = or i32 %or, %shl5
  %arrayidx7 = getelementptr inbounds i8, i8* %src.unwrapped, i64 3
  %4 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %4 to i32
  %shl9 = shl i32 %conv8, 24
  %or10 = or i32 %or6, %shl9
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 %or10
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @store32_le.23(%struct.uint8ptr_wrapped_ty* noundef %dst, i32 noundef %w) #0 {
entry:
  %dst.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %dst, i32 0, i32 1
  %dst.field0.length = load i64, i64* %dst.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %dst, i32 0, i32 0
  %dst.unwrapped = load i8*, i8** %0, align 8
  %conv = trunc i32 %w to i8
  %arrayidx = getelementptr inbounds i8, i8* %dst.unwrapped, i64 0
  store i8 %conv, i8* %arrayidx, align 1
  %shr = lshr i32 %w, 8
  %conv1 = trunc i32 %shr to i8
  %arrayidx2 = getelementptr inbounds i8, i8* %dst.unwrapped, i64 1
  store i8 %conv1, i8* %arrayidx2, align 1
  %shr3 = lshr i32 %shr, 8
  %conv4 = trunc i32 %shr3 to i8
  %arrayidx5 = getelementptr inbounds i8, i8* %dst.unwrapped, i64 2
  store i8 %conv4, i8* %arrayidx5, align 1
  %shr6 = lshr i32 %shr3, 8
  %conv7 = trunc i32 %shr6 to i8
  %arrayidx8 = getelementptr inbounds i8, i8* %dst.unwrapped, i64 3
  store i8 %conv7, i8* %arrayidx8, align 1
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %arraydecay51.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay52.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay48.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %arraydecay49.wrapped = alloca %struct.uint8ptr_wrapped_ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
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
  store i1 true, i1* %out., align 1
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  store i64 163, i64* %len, align 8
  %len1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %0 = load i64, i64* %len1, align 8
  %mul = mul i64 %0, 1
  %call = call noalias i8* @malloc(i64 noundef %mul) #8
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %c.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  store i64 %mul, i64* %c.field0.length.ptr, align 8
  store i8* %call, i8** %buf, align 8
  %len2 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  store i64 163, i64* %len2, align 8
  %len3 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %1 = load i64, i64* %len3, align 8
  %mul4 = mul i64 %1, 1
  %call5 = call noalias i8* @malloc(i64 noundef %mul4) #8
  %buf6 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %m.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  store i64 %mul4, i64* %m.field0.length.ptr, align 8
  store i8* %call5, i8** %buf6, align 8
  %buf7 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %2 = load i8*, i8** %buf7, align 8
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 32, i1 false)
  %buf8 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %3 = load i8*, i8** %buf8, align 8
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 32
  %len9 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %4 = load i64, i64* %len9, align 8
  %sub = sub i64 %4, 32
  %mul10 = mul i64 %sub, 1
  %call11 = call i64 @read(i32 noundef 0, i8* noundef %add.ptr, i64 noundef %mul10)
  %arraydecay = getelementptr inbounds [24 x i8], [24 x i8]* %nonce, i64 0, i64 0
  %call12 = call i64 @read(i32 noundef 0, i8* noundef %arraydecay, i64 noundef 24)
  %arraydecay13 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %call14 = call i64 @read(i32 noundef 0, i8* noundef %arraydecay13, i64 noundef 32)
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %buf15 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  %5 = load i8*, i8** %buf15, align 8
  %6 = ptrtoint i8* %5 to i64
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %6, i64* %arrayidx16, align 8
  %len17 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %7 = load i64, i64* %len17, align 8
  %mul18 = mul i64 1, %7
  %arrayidx19 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 %mul18, i64* %arrayidx19, align 16
  %arrayidx20 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx20, align 8
  %arrayidx21 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx21, align 16
  %arrayidx22 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx22, align 8
  %arrayidx23 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %8 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx23, i64 0) #8, !srcloc !26
  store volatile i64 %8, i64* %_zzq_result, align 8
  %9 = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx26 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args24, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx26, align 16
  %buf27 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %10 = load i8*, i8** %buf27, align 8
  %11 = ptrtoint i8* %10 to i64
  %arrayidx28 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args24, i64 0, i64 1
  store volatile i64 %11, i64* %arrayidx28, align 8
  %len29 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %12 = load i64, i64* %len29, align 8
  %mul30 = mul i64 1, %12
  %arrayidx31 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args24, i64 0, i64 2
  store volatile i64 %mul30, i64* %arrayidx31, align 16
  %arrayidx32 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args24, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx32, align 8
  %arrayidx33 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args24, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx33, align 16
  %arrayidx34 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args24, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx34, align 8
  %arrayidx35 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args24, i64 0, i64 0
  %13 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx35, i64 0) #8, !srcloc !27
  store volatile i64 %13, i64* %_zzq_result25, align 8
  %14 = load volatile i64, i64* %_zzq_result25, align 8
  %arrayidx39 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args37, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx39, align 16
  %arraydecay40 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %15 = ptrtoint i8* %arraydecay40 to i64
  %arrayidx41 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args37, i64 0, i64 1
  store volatile i64 %15, i64* %arrayidx41, align 8
  %arrayidx42 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args37, i64 0, i64 2
  store volatile i64 32, i64* %arrayidx42, align 16
  %arrayidx43 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args37, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx43, align 8
  %arrayidx44 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args37, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx44, align 16
  %arrayidx45 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args37, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx45, align 8
  %arrayidx46 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args37, i64 0, i64 0
  %16 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx46, i64 0) #8, !srcloc !28
  store volatile i64 %16, i64* %_zzq_result38, align 8
  %17 = load volatile i64, i64* %_zzq_result38, align 8
  %arraydecay48 = getelementptr inbounds [24 x i8], [24 x i8]* %nonce, i64 0, i64 0
  %arraydecay49 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %arraydecay48.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay48.wrapped, i32 0, i32 0
  %arraydecay48.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay48.wrapped, i32 0, i32 1
  store i64 24, i64* %arraydecay48.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay48, i8** %arraydecay48.unwrapped, align 8
  %arraydecay49.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay49.wrapped, i32 0, i32 0
  %arraydecay49.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay49.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay49.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay49, i8** %arraydecay49.unwrapped, align 8
  %call50 = call i1 @__crypto_secretbox(%struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* %m, %struct.uint8ptr_wrapped_ty* %arraydecay48.wrapped, %struct.uint8ptr_wrapped_ty* %arraydecay49.wrapped)
  %frombool = zext i1 %call50 to i8
  store i8 %frombool, i8* %r1, align 1
  %arraydecay51 = getelementptr inbounds [24 x i8], [24 x i8]* %nonce, i64 0, i64 0
  %arraydecay52 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %arraydecay51.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay51.wrapped, i32 0, i32 0
  %arraydecay51.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay51.wrapped, i32 0, i32 1
  store i64 24, i64* %arraydecay51.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay51, i8** %arraydecay51.unwrapped, align 8
  %arraydecay52.unwrapped = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay52.wrapped, i32 0, i32 0
  %arraydecay52.wrapped.field0.length.ptr = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %arraydecay52.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay52.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay52, i8** %arraydecay52.unwrapped, align 8
  %call53 = call i1 @__crypto_secretbox_open(%struct.uint8ptr_wrapped_ty* %m, %struct.uint8ptr_wrapped_ty* %c, %struct.uint8ptr_wrapped_ty* %arraydecay51.wrapped, %struct.uint8ptr_wrapped_ty* %arraydecay52.wrapped)
  %frombool54 = zext i1 %call53 to i8
  store i8 %frombool54, i8* %r2, align 1
  %call55 = call i64 @write(i32 noundef 1, i8* noundef %r1, i64 noundef 1)
  %call56 = call i64 @write(i32 noundef 1, i8* noundef %r2, i64 noundef 1)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 0
}

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #5

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #5

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind }

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

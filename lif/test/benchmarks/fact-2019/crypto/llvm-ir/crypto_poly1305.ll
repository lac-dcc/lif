; ModuleID = 'llvm-ir/crypto_poly1305.ll'
source_filename = "lib/crypto_poly1305.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.poly1305_state_internal_t = type { [3 x i64], [3 x i64], [2 x i64], i64, [16 x i8], i8 }
%struct.uint8ptr_wrapped_ty = type { i8*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [22 x i8] c"lib/crypto_poly1305.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [33 x i8] c"lib/../include/crypto_poly1305.h\00", section "llvm.metadata"
@.str.3 = private unnamed_addr constant [9 x i8] c"nowrap:1\00", section "llvm.metadata"
@.str.4 = private unnamed_addr constant [25 x i8] c"index < len_state_buffer\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"lib/crypto_poly1305.c\00", align 1
@__PRETTY_FUNCTION__._poly1305_update = private unnamed_addr constant [74 x i8] c"void _poly1305_update(poly1305_state_internal_t *, uint8ptr_wrapped_ty *)\00", align 1
@.str.6 = private unnamed_addr constant [11 x i8] c"i < m->len\00", align 1
@.str.7 = private unnamed_addr constant [25 x i8] c"_mindex < _mindex + want\00", align 1
@.str.8 = private unnamed_addr constant [25 x i8] c"_mindex + want <= m->len\00", align 1
@.str.9 = private unnamed_addr constant [33 x i8] c"_leftover + i < len_state_buffer\00", align 1
@.str.10 = private unnamed_addr constant [21 x i8] c"_mindex + i < m->len\00", align 1
@.str.11 = private unnamed_addr constant [25 x i8] c"start < len_state_buffer\00", align 1
@__PRETTY_FUNCTION__._poly1305_finish = private unnamed_addr constant [62 x i8] c"void _poly1305_finish(poly1305_state_internal_t *, uint8_t *)\00", align 1
@llvm.global.annotations = appending global [4 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (void (%struct.poly1305_state_internal_t*, %struct.uint8ptr_wrapped_ty*)* @_poly1305_blocks to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 8, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (void (%struct.poly1305_state_internal_t*, %struct.uint8ptr_wrapped_ty*)* @_poly1305_update to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 102, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 (i8*, %struct.uint8ptr_wrapped_ty*, i8*)* @_crypto_onetimeauth_poly1305 to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 287, i8* null }, { i8*, i8*, i8*, i32, i8* } { i8* bitcast (i1 (i8*, %struct.uint8ptr_wrapped_ty*, i8*)* @_crypto_onetimeauth_poly1305_verify to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 309, i8* null }], section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @_poly1305_blocks(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %m) #0 {
entry:
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
  call void @llvm.var.annotation(i8* %m_buf1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 12, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %m_buf, align 8
  %hibit2 = bitcast i64* %hibit to i8*
  call void @llvm.var.annotation(i8* %hibit2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 18, i8* null)
  %final = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 5
  %1 = call i8* @llvm.ptr.annotation.p0i8(i8* %final, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 18, i8* null)
  %2 = load i8, i8* %1, align 8
  %conv = zext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  %3 = zext i1 %cmp to i64
  %cond = select i1 %cmp, i64 0, i64 1099511627776
  store i64 %cond, i64* %hibit, align 8
  %r04 = bitcast i64* %r0 to i8*
  call void @llvm.var.annotation(i8* %r04, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 20, i8* null)
  %r = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 0
  %4 = bitcast [3 x i64]* %r to i8*
  %5 = call i8* @llvm.ptr.annotation.p0i8(i8* %4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 13, i8* null)
  %6 = bitcast i8* %5 to [3 x i64]*
  %arrayidx = getelementptr inbounds [3 x i64], [3 x i64]* %6, i64 0, i64 0
  %7 = load i64, i64* %arrayidx, align 8
  store i64 %7, i64* %r0, align 8
  %r15 = bitcast i64* %r1 to i8*
  call void @llvm.var.annotation(i8* %r15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 21, i8* null)
  %r6 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 0
  %8 = bitcast [3 x i64]* %r6 to i8*
  %9 = call i8* @llvm.ptr.annotation.p0i8(i8* %8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 13, i8* null)
  %10 = bitcast i8* %9 to [3 x i64]*
  %arrayidx7 = getelementptr inbounds [3 x i64], [3 x i64]* %10, i64 0, i64 1
  %11 = load i64, i64* %arrayidx7, align 8
  store i64 %11, i64* %r1, align 8
  %r28 = bitcast i64* %r2 to i8*
  call void @llvm.var.annotation(i8* %r28, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 22, i8* null)
  %r9 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 0
  %12 = bitcast [3 x i64]* %r9 to i8*
  %13 = call i8* @llvm.ptr.annotation.p0i8(i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 13, i8* null)
  %14 = bitcast i8* %13 to [3 x i64]*
  %arrayidx10 = getelementptr inbounds [3 x i64], [3 x i64]* %14, i64 0, i64 2
  %15 = load i64, i64* %arrayidx10, align 8
  store i64 %15, i64* %r2, align 8
  %h011 = bitcast i64* %h0 to i8*
  call void @llvm.var.annotation(i8* %h011, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 24, i8* null)
  %h = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %16 = bitcast [3 x i64]* %h to i8*
  %17 = call i8* @llvm.ptr.annotation.p0i8(i8* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 14, i8* null)
  %18 = bitcast i8* %17 to [3 x i64]*
  %arrayidx12 = getelementptr inbounds [3 x i64], [3 x i64]* %18, i64 0, i64 0
  %19 = load i64, i64* %arrayidx12, align 8
  store i64 %19, i64* %h0, align 8
  %h113 = bitcast i64* %h1 to i8*
  call void @llvm.var.annotation(i8* %h113, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 25, i8* null)
  %h14 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %20 = bitcast [3 x i64]* %h14 to i8*
  %21 = call i8* @llvm.ptr.annotation.p0i8(i8* %20, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 14, i8* null)
  %22 = bitcast i8* %21 to [3 x i64]*
  %arrayidx15 = getelementptr inbounds [3 x i64], [3 x i64]* %22, i64 0, i64 1
  %23 = load i64, i64* %arrayidx15, align 8
  store i64 %23, i64* %h1, align 8
  %h216 = bitcast i64* %h2 to i8*
  call void @llvm.var.annotation(i8* %h216, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 26, i8* null)
  %h17 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %24 = bitcast [3 x i64]* %h17 to i8*
  %25 = call i8* @llvm.ptr.annotation.p0i8(i8* %24, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 14, i8* null)
  %26 = bitcast i8* %25 to [3 x i64]*
  %arrayidx18 = getelementptr inbounds [3 x i64], [3 x i64]* %26, i64 0, i64 2
  %27 = load i64, i64* %arrayidx18, align 8
  store i64 %27, i64* %h2, align 8
  %s119 = bitcast i64* %s1 to i8*
  call void @llvm.var.annotation(i8* %s119, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 28, i8* null)
  %28 = load i64, i64* %r1, align 8
  %mul = mul i64 %28, 20
  store i64 %mul, i64* %s1, align 8
  %s220 = bitcast i64* %s2 to i8*
  call void @llvm.var.annotation(i8* %s220, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 29, i8* null)
  %29 = load i64, i64* %r2, align 8
  %mul21 = mul i64 %29, 20
  store i64 %mul21, i64* %s2, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %30 = load i64, i64* %len, align 8
  %div = udiv i64 %30, 16
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %bindex.0 = phi i64 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp22 = icmp ult i64 %bindex.0, %div
  br i1 %cmp22, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %t024 = bitcast i64* %t0 to i8*
  call void @llvm.var.annotation(i8* %t024, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 33, i8* null)
  %31 = load i8*, i8** %m_buf, align 8
  %mul25 = mul i64 %bindex.0, 16
  %add.ptr = getelementptr inbounds i8, i8* %31, i64 %mul25
  %call = call i64 @load64_le(i8* noundef %add.ptr)
  store i64 %call, i64* %t0, align 8
  %t126 = bitcast i64* %t1 to i8*
  call void @llvm.var.annotation(i8* %t126, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 34, i8* null)
  %32 = load i8*, i8** %m_buf, align 8
  %mul27 = mul i64 %bindex.0, 16
  %add.ptr28 = getelementptr inbounds i8, i8* %32, i64 %mul27
  %add.ptr29 = getelementptr inbounds i8, i8* %add.ptr28, i64 8
  %call30 = call i64 @load64_le(i8* noundef %add.ptr29)
  store i64 %call30, i64* %t1, align 8
  %33 = load i64, i64* %t0, align 8
  %and = and i64 %33, 17592186044415
  %34 = load i64, i64* %h0, align 8
  %add = add i64 %34, %and
  store i64 %add, i64* %h0, align 8
  %35 = load i64, i64* %t0, align 8
  %shr = lshr i64 %35, 44
  %36 = load i64, i64* %t1, align 8
  %shl = shl i64 %36, 20
  %or = or i64 %shr, %shl
  %and31 = and i64 %or, 17592186044415
  %37 = load i64, i64* %h1, align 8
  %add32 = add i64 %37, %and31
  store i64 %add32, i64* %h1, align 8
  %38 = load i64, i64* %t1, align 8
  %shr33 = lshr i64 %38, 24
  %and34 = and i64 %shr33, 4398046511103
  %39 = load i64, i64* %hibit, align 8
  %or35 = or i64 %and34, %39
  %40 = load i64, i64* %h2, align 8
  %add36 = add i64 %40, %or35
  store i64 %add36, i64* %h2, align 8
  %d037 = bitcast i128* %d0 to i8*
  call void @llvm.var.annotation(i8* %d037, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 43, i8* null)
  %41 = load i64, i64* %h0, align 8
  %conv38 = zext i64 %41 to i128
  %42 = load i64, i64* %r0, align 8
  %conv39 = zext i64 %42 to i128
  %mul40 = mul i128 %conv38, %conv39
  %43 = load i64, i64* %h1, align 8
  %conv41 = zext i64 %43 to i128
  %44 = load i64, i64* %s2, align 8
  %conv42 = zext i64 %44 to i128
  %mul43 = mul i128 %conv41, %conv42
  %add44 = add i128 %mul40, %mul43
  %45 = load i64, i64* %h2, align 8
  %conv45 = zext i64 %45 to i128
  %46 = load i64, i64* %s1, align 8
  %conv46 = zext i64 %46 to i128
  %mul47 = mul i128 %conv45, %conv46
  %add48 = add i128 %add44, %mul47
  store i128 %add48, i128* %d0, align 16
  %d149 = bitcast i128* %d1 to i8*
  call void @llvm.var.annotation(i8* %d149, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 47, i8* null)
  %47 = load i64, i64* %h0, align 8
  %conv50 = zext i64 %47 to i128
  %48 = load i64, i64* %r1, align 8
  %conv51 = zext i64 %48 to i128
  %mul52 = mul i128 %conv50, %conv51
  %49 = load i64, i64* %h1, align 8
  %conv53 = zext i64 %49 to i128
  %50 = load i64, i64* %r0, align 8
  %conv54 = zext i64 %50 to i128
  %mul55 = mul i128 %conv53, %conv54
  %add56 = add i128 %mul52, %mul55
  %51 = load i64, i64* %h2, align 8
  %conv57 = zext i64 %51 to i128
  %52 = load i64, i64* %s2, align 8
  %conv58 = zext i64 %52 to i128
  %mul59 = mul i128 %conv57, %conv58
  %add60 = add i128 %add56, %mul59
  store i128 %add60, i128* %d1, align 16
  %d261 = bitcast i128* %d2 to i8*
  call void @llvm.var.annotation(i8* %d261, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 51, i8* null)
  %53 = load i64, i64* %h0, align 8
  %conv62 = zext i64 %53 to i128
  %54 = load i64, i64* %r2, align 8
  %conv63 = zext i64 %54 to i128
  %mul64 = mul i128 %conv62, %conv63
  %55 = load i64, i64* %h1, align 8
  %conv65 = zext i64 %55 to i128
  %56 = load i64, i64* %r1, align 8
  %conv66 = zext i64 %56 to i128
  %mul67 = mul i128 %conv65, %conv66
  %add68 = add i128 %mul64, %mul67
  %57 = load i64, i64* %h2, align 8
  %conv69 = zext i64 %57 to i128
  %58 = load i64, i64* %r0, align 8
  %conv70 = zext i64 %58 to i128
  %mul71 = mul i128 %conv69, %conv70
  %add72 = add i128 %add68, %mul71
  store i128 %add72, i128* %d2, align 16
  %c73 = bitcast i64* %c to i8*
  call void @llvm.var.annotation(i8* %c73, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 56, i8* null)
  %59 = load i128, i128* %d0, align 16
  %shr74 = lshr i128 %59, 44
  %conv75 = trunc i128 %shr74 to i64
  store i64 %conv75, i64* %c, align 8
  %60 = load i128, i128* %d0, align 16
  %conv76 = trunc i128 %60 to i64
  %and77 = and i64 %conv76, 17592186044415
  store i64 %and77, i64* %h0, align 8
  %61 = load i64, i64* %c, align 8
  %conv78 = zext i64 %61 to i128
  %62 = load i128, i128* %d1, align 16
  %add79 = add i128 %62, %conv78
  store i128 %add79, i128* %d1, align 16
  %63 = load i128, i128* %d1, align 16
  %shr80 = lshr i128 %63, 44
  %conv81 = trunc i128 %shr80 to i64
  store i64 %conv81, i64* %c, align 8
  %64 = load i128, i128* %d1, align 16
  %conv82 = trunc i128 %64 to i64
  %and83 = and i64 %conv82, 17592186044415
  store i64 %and83, i64* %h1, align 8
  %65 = load i64, i64* %c, align 8
  %conv84 = zext i64 %65 to i128
  %66 = load i128, i128* %d2, align 16
  %add85 = add i128 %66, %conv84
  store i128 %add85, i128* %d2, align 16
  %67 = load i128, i128* %d2, align 16
  %shr86 = lshr i128 %67, 42
  %conv87 = trunc i128 %shr86 to i64
  store i64 %conv87, i64* %c, align 8
  %68 = load i128, i128* %d2, align 16
  %conv88 = trunc i128 %68 to i64
  %and89 = and i64 %conv88, 4398046511103
  store i64 %and89, i64* %h2, align 8
  %69 = load i64, i64* %c, align 8
  %mul90 = mul i64 %69, 5
  %70 = load i64, i64* %h0, align 8
  %add91 = add i64 %70, %mul90
  store i64 %add91, i64* %h0, align 8
  %71 = load i64, i64* %h0, align 8
  %shr92 = lshr i64 %71, 44
  store i64 %shr92, i64* %c, align 8
  %72 = load i64, i64* %h0, align 8
  %and93 = and i64 %72, 17592186044415
  store i64 %and93, i64* %h0, align 8
  %73 = load i64, i64* %c, align 8
  %74 = load i64, i64* %h1, align 8
  %add94 = add i64 %74, %73
  store i64 %add94, i64* %h1, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i64 %bindex.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %75 = load i64, i64* %h0, align 8
  %h95 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %76 = bitcast [3 x i64]* %h95 to i8*
  %77 = call i8* @llvm.ptr.annotation.p0i8(i8* %76, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 14, i8* null)
  %78 = bitcast i8* %77 to [3 x i64]*
  %arrayidx96 = getelementptr inbounds [3 x i64], [3 x i64]* %78, i64 0, i64 0
  store i64 %75, i64* %arrayidx96, align 8
  %79 = load i64, i64* %h1, align 8
  %h97 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %80 = bitcast [3 x i64]* %h97 to i8*
  %81 = call i8* @llvm.ptr.annotation.p0i8(i8* %80, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 14, i8* null)
  %82 = bitcast i8* %81 to [3 x i64]*
  %arrayidx98 = getelementptr inbounds [3 x i64], [3 x i64]* %82, i64 0, i64 1
  store i64 %79, i64* %arrayidx98, align 8
  %83 = load i64, i64* %h2, align 8
  %h99 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %84 = bitcast [3 x i64]* %h99 to i8*
  %85 = call i8* @llvm.ptr.annotation.p0i8(i8* %84, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 14, i8* null)
  %86 = bitcast i8* %85 to [3 x i64]*
  %arrayidx100 = getelementptr inbounds [3 x i64], [3 x i64]* %86, i64 0, i64 2
  store i64 %83, i64* %arrayidx100, align 8
  ret void
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare i8* @llvm.ptr.annotation.p0i8(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i64 @load64_le(i8* noundef %src) #0 {
entry:
  %arrayidx = getelementptr inbounds i8, i8* %src, i64 0
  %0 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %0 to i64
  %arrayidx1 = getelementptr inbounds i8, i8* %src, i64 1
  %1 = load i8, i8* %arrayidx1, align 1
  %conv2 = zext i8 %1 to i64
  %shl = shl i64 %conv2, 8
  %or = or i64 %conv, %shl
  %arrayidx3 = getelementptr inbounds i8, i8* %src, i64 2
  %2 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %2 to i64
  %shl5 = shl i64 %conv4, 16
  %or6 = or i64 %or, %shl5
  %arrayidx7 = getelementptr inbounds i8, i8* %src, i64 3
  %3 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %3 to i64
  %shl9 = shl i64 %conv8, 24
  %or10 = or i64 %or6, %shl9
  %arrayidx11 = getelementptr inbounds i8, i8* %src, i64 4
  %4 = load i8, i8* %arrayidx11, align 1
  %conv12 = zext i8 %4 to i64
  %shl13 = shl i64 %conv12, 32
  %or14 = or i64 %or10, %shl13
  %arrayidx15 = getelementptr inbounds i8, i8* %src, i64 5
  %5 = load i8, i8* %arrayidx15, align 1
  %conv16 = zext i8 %5 to i64
  %shl17 = shl i64 %conv16, 40
  %or18 = or i64 %or14, %shl17
  %arrayidx19 = getelementptr inbounds i8, i8* %src, i64 6
  %6 = load i8, i8* %arrayidx19, align 1
  %conv20 = zext i8 %6 to i64
  %shl21 = shl i64 %conv20, 48
  %or22 = or i64 %or18, %shl21
  %arrayidx23 = getelementptr inbounds i8, i8* %src, i64 7
  %7 = load i8, i8* %arrayidx23, align 1
  %conv24 = zext i8 %7 to i64
  %shl25 = shl i64 %conv24, 56
  %or26 = or i64 %or22, %shl25
  ret i64 %or26
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @_poly1305_init(%struct.poly1305_state_internal_t* noundef %state, i8* noundef %key) #0 {
entry:
  %key.addr = alloca i8*, align 8
  %t0 = alloca i64, align 8
  %t1 = alloca i64, align 8
  store i8* %key, i8** %key.addr, align 8
  %key.addr1 = bitcast i8** %key.addr to i8*
  call void @llvm.var.annotation(i8* %key.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 77, i8* null)
  %t02 = bitcast i64* %t0 to i8*
  call void @llvm.var.annotation(i8* %t02, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 81, i8* null)
  %0 = load i8*, i8** %key.addr, align 8
  %call = call i64 @load64_le(i8* noundef %0)
  store i64 %call, i64* %t0, align 8
  %t13 = bitcast i64* %t1 to i8*
  call void @llvm.var.annotation(i8* %t13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 82, i8* null)
  %1 = load i8*, i8** %key.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %1, i64 8
  %call4 = call i64 @load64_le(i8* noundef %add.ptr)
  store i64 %call4, i64* %t1, align 8
  %2 = load i64, i64* %t0, align 8
  %and = and i64 %2, 17575274610687
  %r = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 0
  %3 = bitcast [3 x i64]* %r to i8*
  %4 = call i8* @llvm.ptr.annotation.p0i8(i8* %3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 13, i8* null)
  %5 = bitcast i8* %4 to [3 x i64]*
  %arrayidx = getelementptr inbounds [3 x i64], [3 x i64]* %5, i64 0, i64 0
  store i64 %and, i64* %arrayidx, align 8
  %6 = load i64, i64* %t0, align 8
  %shr = lshr i64 %6, 44
  %7 = load i64, i64* %t1, align 8
  %shl = shl i64 %7, 20
  %or = or i64 %shr, %shl
  %and5 = and i64 %or, 17592181915647
  %r6 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 0
  %8 = bitcast [3 x i64]* %r6 to i8*
  %9 = call i8* @llvm.ptr.annotation.p0i8(i8* %8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 13, i8* null)
  %10 = bitcast i8* %9 to [3 x i64]*
  %arrayidx7 = getelementptr inbounds [3 x i64], [3 x i64]* %10, i64 0, i64 1
  store i64 %and5, i64* %arrayidx7, align 8
  %11 = load i64, i64* %t1, align 8
  %shr8 = lshr i64 %11, 24
  %and9 = and i64 %shr8, 68719475727
  %r10 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 0
  %12 = bitcast [3 x i64]* %r10 to i8*
  %13 = call i8* @llvm.ptr.annotation.p0i8(i8* %12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 13, i8* null)
  %14 = bitcast i8* %13 to [3 x i64]*
  %arrayidx11 = getelementptr inbounds [3 x i64], [3 x i64]* %14, i64 0, i64 2
  store i64 %and9, i64* %arrayidx11, align 8
  %h = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %15 = bitcast [3 x i64]* %h to i8*
  %16 = call i8* @llvm.ptr.annotation.p0i8(i8* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 14, i8* null)
  %17 = bitcast i8* %16 to [3 x i64]*
  %arrayidx12 = getelementptr inbounds [3 x i64], [3 x i64]* %17, i64 0, i64 0
  store i64 0, i64* %arrayidx12, align 8
  %h13 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %18 = bitcast [3 x i64]* %h13 to i8*
  %19 = call i8* @llvm.ptr.annotation.p0i8(i8* %18, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 14, i8* null)
  %20 = bitcast i8* %19 to [3 x i64]*
  %arrayidx14 = getelementptr inbounds [3 x i64], [3 x i64]* %20, i64 0, i64 1
  store i64 0, i64* %arrayidx14, align 8
  %h15 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %21 = bitcast [3 x i64]* %h15 to i8*
  %22 = call i8* @llvm.ptr.annotation.p0i8(i8* %21, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 14, i8* null)
  %23 = bitcast i8* %22 to [3 x i64]*
  %arrayidx16 = getelementptr inbounds [3 x i64], [3 x i64]* %23, i64 0, i64 2
  store i64 0, i64* %arrayidx16, align 8
  %24 = load i8*, i8** %key.addr, align 8
  %add.ptr17 = getelementptr inbounds i8, i8* %24, i64 16
  %call18 = call i64 @load64_le(i8* noundef %add.ptr17)
  %pad = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 2
  %25 = bitcast [2 x i64]* %pad to i8*
  %26 = call i8* @llvm.ptr.annotation.p0i8(i8* %25, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 15, i8* null)
  %27 = bitcast i8* %26 to [2 x i64]*
  %arrayidx19 = getelementptr inbounds [2 x i64], [2 x i64]* %27, i64 0, i64 0
  store i64 %call18, i64* %arrayidx19, align 8
  %28 = load i8*, i8** %key.addr, align 8
  %add.ptr20 = getelementptr inbounds i8, i8* %28, i64 24
  %call21 = call i64 @load64_le(i8* noundef %add.ptr20)
  %pad22 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 2
  %29 = bitcast [2 x i64]* %pad22 to i8*
  %30 = call i8* @llvm.ptr.annotation.p0i8(i8* %29, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 15, i8* null)
  %31 = bitcast i8* %30 to [2 x i64]*
  %arrayidx23 = getelementptr inbounds [2 x i64], [2 x i64]* %31, i64 0, i64 1
  store i64 %call21, i64* %arrayidx23, align 8
  %leftover = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  store i64 0, i64* %leftover, align 8
  %final = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 5
  %32 = call i8* @llvm.ptr.annotation.p0i8(i8* %final, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 18, i8* null)
  store i8 0, i8* %32, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @_poly1305_update(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %m) #0 {
entry:
  %m_buf = alloca i8*, align 8
  %w_state_buffer = alloca %struct.uint8ptr_wrapped_ty, align 8
  %w_view_m = alloca %struct.uint8ptr_wrapped_ty, align 8
  %m_buf1 = bitcast i8** %m_buf to i8*
  call void @llvm.var.annotation(i8* %m_buf1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 106, i8* null)
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %0 = load i8*, i8** %buf, align 8
  store i8* %0, i8** %m_buf, align 8
  %leftover = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %1 = load i64, i64* %leftover, align 8
  %cmp = icmp ne i64 %1, 0
  br i1 %cmp, label %if.then, label %if.end28

if.then:                                          ; preds = %entry
  %leftover2 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %2 = load i64, i64* %leftover2, align 8
  %sub = sub i64 16, %2
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %3 = load i64, i64* %len, align 8
  %cmp3 = icmp ugt i64 %sub, %3
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  %len5 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %4 = load i64, i64* %len5, align 8
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  %want.0 = phi i64 [ %4, %if.then4 ], [ %sub, %if.then ]
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i64 [ 0, %if.end ], [ %inc, %for.inc ]
  %cmp6 = icmp ult i64 %i.0, %want.0
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %leftover7 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %5 = load i64, i64* %leftover7, align 8
  %add = add i64 %5, %i.0
  %cmp8 = icmp ult i64 %add, 16
  br i1 %cmp8, label %if.then9, label %if.else

if.then9:                                         ; preds = %for.body
  br label %if.end10

if.else:                                          ; preds = %for.body
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), i32 noundef 123, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #7
  unreachable

if.end10:                                         ; preds = %if.then9
  %len11 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %6 = load i64, i64* %len11, align 8
  %cmp12 = icmp ult i64 %i.0, %6
  br i1 %cmp12, label %if.then13, label %if.else14

if.then13:                                        ; preds = %if.end10
  br label %if.end15

if.else14:                                        ; preds = %if.end10
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), i32 noundef 124, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #7
  unreachable

if.end15:                                         ; preds = %if.then13
  %7 = load i8*, i8** %m_buf, align 8
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %i.0
  %8 = load i8, i8* %arrayidx, align 1
  %buffer = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 4
  %9 = bitcast [16 x i8]* %buffer to i8*
  %10 = call i8* @llvm.ptr.annotation.p0i8(i8* %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 17, i8* null)
  %11 = bitcast i8* %10 to [16 x i8]*
  %arrayidx16 = getelementptr inbounds [16 x i8], [16 x i8]* %11, i64 0, i64 %add
  store i8 %8, i8* %arrayidx16, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end15
  %inc = add i64 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %add17 = add i64 0, %want.0
  %leftover18 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %12 = load i64, i64* %leftover18, align 8
  %add19 = add i64 %12, %want.0
  store i64 %add19, i64* %leftover18, align 8
  %leftover20 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %13 = load i64, i64* %leftover20, align 8
  %cmp21 = icmp ult i64 %13, 16
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %for.end
  br label %if.end87

if.end23:                                         ; preds = %for.end
  %len24 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 1
  store i64 16, i64* %len24, align 8
  %len25 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 1
  %14 = load i64, i64* %len25, align 8
  %mul = mul i64 %14, 1
  %call = call noalias i8* @malloc(i64 noundef %mul) #8
  %buf26 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 0
  store i8* %call, i8** %buf26, align 8
  call void @_poly1305_blocks(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %w_state_buffer)
  %leftover27 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  store i64 0, i64* %leftover27, align 8
  br label %if.end28

if.end28:                                         ; preds = %if.end23, %entry
  %mindex.0 = phi i64 [ %add17, %if.end23 ], [ 0, %entry ]
  %len29 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %15 = load i64, i64* %len29, align 8
  %sub30 = sub i64 %15, %mindex.0
  %cmp31 = icmp uge i64 %sub30, 16
  br i1 %cmp31, label %if.then32, label %if.end54

if.then32:                                        ; preds = %if.end28
  %len34 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %16 = load i64, i64* %len34, align 8
  %sub35 = sub i64 %16, %mindex.0
  %and = and i64 %sub35, -16
  %add36 = add i64 %mindex.0, %and
  %cmp37 = icmp ult i64 %mindex.0, %add36
  br i1 %cmp37, label %if.then38, label %if.else39

if.then38:                                        ; preds = %if.then32
  br label %if.end40

if.else39:                                        ; preds = %if.then32
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.7, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), i32 noundef 154, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #7
  unreachable

if.end40:                                         ; preds = %if.then38
  %add41 = add i64 %mindex.0, %and
  %len42 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %17 = load i64, i64* %len42, align 8
  %cmp43 = icmp ule i64 %add41, %17
  br i1 %cmp43, label %if.then44, label %if.else45

if.then44:                                        ; preds = %if.end40
  br label %if.end46

if.else45:                                        ; preds = %if.end40
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.8, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), i32 noundef 155, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #7
  unreachable

if.end46:                                         ; preds = %if.then44
  %len47 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_view_m, i32 0, i32 1
  store i64 %and, i64* %len47, align 8
  %len48 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_view_m, i32 0, i32 1
  %18 = load i64, i64* %len48, align 8
  %mul49 = mul i64 %18, 1
  %call50 = call noalias i8* @malloc(i64 noundef %mul49) #8
  %buf51 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_view_m, i32 0, i32 0
  store i8* %call50, i8** %buf51, align 8
  %buf52 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_view_m, i32 0, i32 0
  %19 = load i8*, i8** %buf52, align 8
  %20 = load i8*, i8** %m_buf, align 8
  %add.ptr = getelementptr inbounds i8, i8* %20, i64 %mindex.0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %19, i8* align 1 %add.ptr, i64 %and, i1 false)
  call void @_poly1305_blocks(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %w_view_m)
  %add53 = add i64 %mindex.0, %and
  br label %if.end54

if.end54:                                         ; preds = %if.end46, %if.end28
  %mindex.1 = phi i64 [ %add53, %if.end46 ], [ %mindex.0, %if.end28 ]
  %len55 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %21 = load i64, i64* %len55, align 8
  %cmp56 = icmp ult i64 %mindex.1, %21
  br i1 %cmp56, label %if.then57, label %if.end87

if.then57:                                        ; preds = %if.end54
  %len58 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %22 = load i64, i64* %len58, align 8
  %sub59 = sub i64 %22, %mindex.1
  br label %for.cond61

for.cond61:                                       ; preds = %for.inc82, %if.then57
  %i60.0 = phi i64 [ 0, %if.then57 ], [ %inc83, %for.inc82 ]
  %cmp62 = icmp ult i64 %i60.0, %sub59
  br i1 %cmp62, label %for.body63, label %for.end84

for.body63:                                       ; preds = %for.cond61
  %leftover64 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %23 = load i64, i64* %leftover64, align 8
  %add66 = add i64 %23, %i60.0
  %cmp67 = icmp ult i64 %add66, 16
  br i1 %cmp67, label %if.then68, label %if.else69

if.then68:                                        ; preds = %for.body63
  br label %if.end70

if.else69:                                        ; preds = %for.body63
  call void @__assert_fail(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.9, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), i32 noundef 178, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #7
  unreachable

if.end70:                                         ; preds = %if.then68
  %add71 = add i64 %mindex.1, %i60.0
  %len72 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %24 = load i64, i64* %len72, align 8
  %cmp73 = icmp ult i64 %add71, %24
  br i1 %cmp73, label %if.then74, label %if.else75

if.then74:                                        ; preds = %if.end70
  br label %if.end76

if.else75:                                        ; preds = %if.end70
  call void @__assert_fail(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), i32 noundef 179, i8* noundef getelementptr inbounds ([74 x i8], [74 x i8]* @__PRETTY_FUNCTION__._poly1305_update, i64 0, i64 0)) #7
  unreachable

if.end76:                                         ; preds = %if.then74
  %25 = load i8*, i8** %m_buf, align 8
  %add77 = add i64 %mindex.1, %i60.0
  %arrayidx78 = getelementptr inbounds i8, i8* %25, i64 %add77
  %26 = load i8, i8* %arrayidx78, align 1
  %buffer79 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 4
  %27 = bitcast [16 x i8]* %buffer79 to i8*
  %28 = call i8* @llvm.ptr.annotation.p0i8(i8* %27, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 17, i8* null)
  %29 = bitcast i8* %28 to [16 x i8]*
  %add80 = add i64 %23, %i60.0
  %arrayidx81 = getelementptr inbounds [16 x i8], [16 x i8]* %29, i64 0, i64 %add80
  store i8 %26, i8* %arrayidx81, align 1
  br label %for.inc82

for.inc82:                                        ; preds = %if.end76
  %inc83 = add i64 %i60.0, 1
  br label %for.cond61, !llvm.loop !9

for.end84:                                        ; preds = %for.cond61
  %leftover85 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %30 = load i64, i64* %leftover85, align 8
  %add86 = add i64 %30, %sub59
  store i64 %add86, i64* %leftover85, align 8
  br label %if.end87

if.end87:                                         ; preds = %for.end84, %if.end54, %if.then22
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @_poly1305_finish(%struct.poly1305_state_internal_t* noundef %state, i8* noundef %mac) #0 {
entry:
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
  store i8* %mac, i8** %mac.addr, align 8
  %mac.addr1 = bitcast i8** %mac.addr to i8*
  call void @llvm.var.annotation(i8* %mac.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 188, i8* null)
  %leftover = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %0 = load i64, i64* %leftover, align 8
  %cmp = icmp ne i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %leftover2 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 3
  %1 = load i64, i64* %leftover2, align 8
  %cmp3 = icmp ult i64 %1, 16
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then
  br label %if.end

if.else:                                          ; preds = %if.then
  call void @__assert_fail(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.11, i64 0, i64 0), i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), i32 noundef 198, i8* noundef getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__._poly1305_finish, i64 0, i64 0)) #7
  unreachable

if.end:                                           ; preds = %if.then4
  %buffer = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 4
  %2 = bitcast [16 x i8]* %buffer to i8*
  %3 = call i8* @llvm.ptr.annotation.p0i8(i8* %2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 17, i8* null)
  %4 = bitcast i8* %3 to [16 x i8]*
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %4, i64 0, i64 %1
  store i8 1, i8* %arrayidx, align 1
  %add = add i64 %1, 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i64 [ %add, %if.end ], [ %inc, %for.inc ]
  %cmp5 = icmp ult i64 %i.0, 16
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %buffer6 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 4
  %5 = bitcast [16 x i8]* %buffer6 to i8*
  %6 = call i8* @llvm.ptr.annotation.p0i8(i8* %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 17, i8* null)
  %7 = bitcast i8* %6 to [16 x i8]*
  %arrayidx7 = getelementptr inbounds [16 x i8], [16 x i8]* %7, i64 0, i64 %i.0
  store i8 0, i8* %arrayidx7, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i64 %i.0, 1
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  %final = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 5
  %8 = call i8* @llvm.ptr.annotation.p0i8(i8* %final, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 18, i8* null)
  store i8 1, i8* %8, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 1
  store i64 16, i64* %len, align 8
  %len8 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 1
  %9 = load i64, i64* %len8, align 8
  %mul = mul i64 %9, 1
  %call = call noalias i8* @malloc(i64 noundef %mul) #8
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %w_state_buffer, i32 0, i32 0
  store i8* %call, i8** %buf, align 8
  call void @_poly1305_blocks(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %w_state_buffer)
  br label %if.end9

if.end9:                                          ; preds = %for.end, %entry
  %h010 = bitcast i64* %h0 to i8*
  call void @llvm.var.annotation(i8* %h010, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 222, i8* null)
  %h = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %10 = bitcast [3 x i64]* %h to i8*
  %11 = call i8* @llvm.ptr.annotation.p0i8(i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 14, i8* null)
  %12 = bitcast i8* %11 to [3 x i64]*
  %arrayidx11 = getelementptr inbounds [3 x i64], [3 x i64]* %12, i64 0, i64 0
  %13 = load i64, i64* %arrayidx11, align 8
  store i64 %13, i64* %h0, align 8
  %h112 = bitcast i64* %h1 to i8*
  call void @llvm.var.annotation(i8* %h112, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 223, i8* null)
  %h13 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %14 = bitcast [3 x i64]* %h13 to i8*
  %15 = call i8* @llvm.ptr.annotation.p0i8(i8* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 14, i8* null)
  %16 = bitcast i8* %15 to [3 x i64]*
  %arrayidx14 = getelementptr inbounds [3 x i64], [3 x i64]* %16, i64 0, i64 1
  %17 = load i64, i64* %arrayidx14, align 8
  store i64 %17, i64* %h1, align 8
  %h215 = bitcast i64* %h2 to i8*
  call void @llvm.var.annotation(i8* %h215, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 224, i8* null)
  %h16 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 1
  %18 = bitcast [3 x i64]* %h16 to i8*
  %19 = call i8* @llvm.ptr.annotation.p0i8(i8* %18, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 14, i8* null)
  %20 = bitcast i8* %19 to [3 x i64]*
  %arrayidx17 = getelementptr inbounds [3 x i64], [3 x i64]* %20, i64 0, i64 2
  %21 = load i64, i64* %arrayidx17, align 8
  store i64 %21, i64* %h2, align 8
  %c18 = bitcast i64* %c to i8*
  call void @llvm.var.annotation(i8* %c18, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 226, i8* null)
  %22 = load i64, i64* %h1, align 8
  %shr = lshr i64 %22, 44
  store i64 %shr, i64* %c, align 8
  %23 = load i64, i64* %h1, align 8
  %and = and i64 %23, 17592186044415
  store i64 %and, i64* %h1, align 8
  %24 = load i64, i64* %c, align 8
  %25 = load i64, i64* %h2, align 8
  %add19 = add i64 %25, %24
  store i64 %add19, i64* %h2, align 8
  %26 = load i64, i64* %h2, align 8
  %shr20 = lshr i64 %26, 42
  store i64 %shr20, i64* %c, align 8
  %27 = load i64, i64* %h2, align 8
  %and21 = and i64 %27, 4398046511103
  store i64 %and21, i64* %h2, align 8
  %28 = load i64, i64* %c, align 8
  %mul22 = mul i64 %28, 5
  %29 = load i64, i64* %h0, align 8
  %add23 = add i64 %29, %mul22
  store i64 %add23, i64* %h0, align 8
  %30 = load i64, i64* %h0, align 8
  %shr24 = lshr i64 %30, 44
  store i64 %shr24, i64* %c, align 8
  %31 = load i64, i64* %h0, align 8
  %and25 = and i64 %31, 17592186044415
  store i64 %and25, i64* %h0, align 8
  %32 = load i64, i64* %c, align 8
  %33 = load i64, i64* %h1, align 8
  %add26 = add i64 %33, %32
  store i64 %add26, i64* %h1, align 8
  %34 = load i64, i64* %h1, align 8
  %shr27 = lshr i64 %34, 44
  store i64 %shr27, i64* %c, align 8
  %35 = load i64, i64* %h1, align 8
  %and28 = and i64 %35, 17592186044415
  store i64 %and28, i64* %h1, align 8
  %36 = load i64, i64* %c, align 8
  %37 = load i64, i64* %h2, align 8
  %add29 = add i64 %37, %36
  store i64 %add29, i64* %h2, align 8
  %38 = load i64, i64* %h2, align 8
  %shr30 = lshr i64 %38, 42
  store i64 %shr30, i64* %c, align 8
  %39 = load i64, i64* %h2, align 8
  %and31 = and i64 %39, 4398046511103
  store i64 %and31, i64* %h2, align 8
  %40 = load i64, i64* %c, align 8
  %mul32 = mul i64 %40, 5
  %41 = load i64, i64* %h0, align 8
  %add33 = add i64 %41, %mul32
  store i64 %add33, i64* %h0, align 8
  %42 = load i64, i64* %h0, align 8
  %shr34 = lshr i64 %42, 44
  store i64 %shr34, i64* %c, align 8
  %43 = load i64, i64* %h0, align 8
  %and35 = and i64 %43, 17592186044415
  store i64 %and35, i64* %h0, align 8
  %44 = load i64, i64* %c, align 8
  %45 = load i64, i64* %h1, align 8
  %add36 = add i64 %45, %44
  store i64 %add36, i64* %h1, align 8
  %g037 = bitcast i64* %g0 to i8*
  call void @llvm.var.annotation(i8* %g037, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 246, i8* null)
  %46 = load i64, i64* %h0, align 8
  %add38 = add i64 %46, 5
  store i64 %add38, i64* %g0, align 8
  %47 = load i64, i64* %g0, align 8
  %shr39 = lshr i64 %47, 44
  store i64 %shr39, i64* %c, align 8
  %48 = load i64, i64* %g0, align 8
  %and40 = and i64 %48, 17592186044415
  store i64 %and40, i64* %g0, align 8
  %g141 = bitcast i64* %g1 to i8*
  call void @llvm.var.annotation(i8* %g141, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 249, i8* null)
  %49 = load i64, i64* %h1, align 8
  %50 = load i64, i64* %c, align 8
  %add42 = add i64 %49, %50
  store i64 %add42, i64* %g1, align 8
  %51 = load i64, i64* %g1, align 8
  %shr43 = lshr i64 %51, 44
  store i64 %shr43, i64* %c, align 8
  %52 = load i64, i64* %g1, align 8
  %and44 = and i64 %52, 17592186044415
  store i64 %and44, i64* %g1, align 8
  %g245 = bitcast i64* %g2 to i8*
  call void @llvm.var.annotation(i8* %g245, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 252, i8* null)
  %53 = load i64, i64* %h2, align 8
  %54 = load i64, i64* %c, align 8
  %add46 = add i64 %53, %54
  %sub = sub i64 %add46, 4398046511104
  store i64 %sub, i64* %g2, align 8
  %55 = load i64, i64* %g2, align 8
  %shr47 = lshr i64 %55, 63
  %sub48 = sub i64 %shr47, 1
  store i64 %sub48, i64* %c, align 8
  %56 = load i64, i64* %c, align 8
  %57 = load i64, i64* %g0, align 8
  %and49 = and i64 %57, %56
  store i64 %and49, i64* %g0, align 8
  %58 = load i64, i64* %c, align 8
  %59 = load i64, i64* %g1, align 8
  %and50 = and i64 %59, %58
  store i64 %and50, i64* %g1, align 8
  %60 = load i64, i64* %c, align 8
  %61 = load i64, i64* %g2, align 8
  %and51 = and i64 %61, %60
  store i64 %and51, i64* %g2, align 8
  %62 = load i64, i64* %c, align 8
  %neg = xor i64 %62, -1
  store i64 %neg, i64* %c, align 8
  %63 = load i64, i64* %h0, align 8
  %64 = load i64, i64* %c, align 8
  %and52 = and i64 %63, %64
  %65 = load i64, i64* %g0, align 8
  %or = or i64 %and52, %65
  store i64 %or, i64* %h0, align 8
  %66 = load i64, i64* %h1, align 8
  %67 = load i64, i64* %c, align 8
  %and53 = and i64 %66, %67
  %68 = load i64, i64* %g1, align 8
  %or54 = or i64 %and53, %68
  store i64 %or54, i64* %h1, align 8
  %69 = load i64, i64* %h2, align 8
  %70 = load i64, i64* %c, align 8
  %and55 = and i64 %69, %70
  %71 = load i64, i64* %g2, align 8
  %or56 = or i64 %and55, %71
  store i64 %or56, i64* %h2, align 8
  %t057 = bitcast i64* %t0 to i8*
  call void @llvm.var.annotation(i8* %t057, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 265, i8* null)
  %pad = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 2
  %72 = bitcast [2 x i64]* %pad to i8*
  %73 = call i8* @llvm.ptr.annotation.p0i8(i8* %72, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 15, i8* null)
  %74 = bitcast i8* %73 to [2 x i64]*
  %arrayidx58 = getelementptr inbounds [2 x i64], [2 x i64]* %74, i64 0, i64 0
  %75 = load i64, i64* %arrayidx58, align 8
  store i64 %75, i64* %t0, align 8
  %t159 = bitcast i64* %t1 to i8*
  call void @llvm.var.annotation(i8* %t159, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 266, i8* null)
  %pad60 = getelementptr inbounds %struct.poly1305_state_internal_t, %struct.poly1305_state_internal_t* %state, i32 0, i32 2
  %76 = bitcast [2 x i64]* %pad60 to i8*
  %77 = call i8* @llvm.ptr.annotation.p0i8(i8* %76, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 15, i8* null)
  %78 = bitcast i8* %77 to [2 x i64]*
  %arrayidx61 = getelementptr inbounds [2 x i64], [2 x i64]* %78, i64 0, i64 1
  %79 = load i64, i64* %arrayidx61, align 8
  store i64 %79, i64* %t1, align 8
  %80 = load i64, i64* %t0, align 8
  %and62 = and i64 %80, 17592186044415
  %81 = load i64, i64* %h0, align 8
  %add63 = add i64 %81, %and62
  store i64 %add63, i64* %h0, align 8
  %82 = load i64, i64* %h0, align 8
  %shr64 = lshr i64 %82, 44
  store i64 %shr64, i64* %c, align 8
  %83 = load i64, i64* %h0, align 8
  %and65 = and i64 %83, 17592186044415
  store i64 %and65, i64* %h0, align 8
  %84 = load i64, i64* %t0, align 8
  %shr66 = lshr i64 %84, 44
  %85 = load i64, i64* %t1, align 8
  %shl = shl i64 %85, 20
  %or67 = or i64 %shr66, %shl
  %and68 = and i64 %or67, 17592186044415
  %86 = load i64, i64* %c, align 8
  %add69 = add i64 %and68, %86
  %87 = load i64, i64* %h1, align 8
  %add70 = add i64 %87, %add69
  store i64 %add70, i64* %h1, align 8
  %88 = load i64, i64* %h1, align 8
  %shr71 = lshr i64 %88, 44
  store i64 %shr71, i64* %c, align 8
  %89 = load i64, i64* %h1, align 8
  %and72 = and i64 %89, 17592186044415
  store i64 %and72, i64* %h1, align 8
  %90 = load i64, i64* %t1, align 8
  %shr73 = lshr i64 %90, 24
  %and74 = and i64 %shr73, 4398046511103
  %91 = load i64, i64* %c, align 8
  %add75 = add i64 %and74, %91
  %92 = load i64, i64* %h2, align 8
  %add76 = add i64 %92, %add75
  store i64 %add76, i64* %h2, align 8
  %93 = load i64, i64* %h2, align 8
  %and77 = and i64 %93, 4398046511103
  store i64 %and77, i64* %h2, align 8
  %94 = load i64, i64* %h0, align 8
  %95 = load i64, i64* %h1, align 8
  %shl78 = shl i64 %95, 44
  %or79 = or i64 %94, %shl78
  store i64 %or79, i64* %h0, align 8
  %96 = load i64, i64* %h1, align 8
  %shr80 = lshr i64 %96, 20
  %97 = load i64, i64* %h2, align 8
  %shl81 = shl i64 %97, 24
  %or82 = or i64 %shr80, %shl81
  store i64 %or82, i64* %h1, align 8
  %98 = load i8*, i8** %mac.addr, align 8
  %99 = load i64, i64* %h0, align 8
  call void @store64_le(i8* noundef %98, i64 noundef %99)
  %100 = load i8*, i8** %mac.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %100, i64 8
  %101 = load i64, i64* %h1, align 8
  call void @store64_le(i8* noundef %add.ptr, i64 noundef %101)
  %102 = bitcast %struct.poly1305_state_internal_t* %state to i8*
  call void @sodium_memzero(i8* noundef %102, i64 noundef 96)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @store64_le(i8* noundef %dst, i64 noundef %w) #0 {
entry:
  %conv = trunc i64 %w to i8
  %arrayidx = getelementptr inbounds i8, i8* %dst, i64 0
  store i8 %conv, i8* %arrayidx, align 1
  %shr = lshr i64 %w, 8
  %conv1 = trunc i64 %shr to i8
  %arrayidx2 = getelementptr inbounds i8, i8* %dst, i64 1
  store i8 %conv1, i8* %arrayidx2, align 1
  %shr3 = lshr i64 %shr, 8
  %conv4 = trunc i64 %shr3 to i8
  %arrayidx5 = getelementptr inbounds i8, i8* %dst, i64 2
  store i8 %conv4, i8* %arrayidx5, align 1
  %shr6 = lshr i64 %shr3, 8
  %conv7 = trunc i64 %shr6 to i8
  %arrayidx8 = getelementptr inbounds i8, i8* %dst, i64 3
  store i8 %conv7, i8* %arrayidx8, align 1
  %shr9 = lshr i64 %shr6, 8
  %conv10 = trunc i64 %shr9 to i8
  %arrayidx11 = getelementptr inbounds i8, i8* %dst, i64 4
  store i8 %conv10, i8* %arrayidx11, align 1
  %shr12 = lshr i64 %shr9, 8
  %conv13 = trunc i64 %shr12 to i8
  %arrayidx14 = getelementptr inbounds i8, i8* %dst, i64 5
  store i8 %conv13, i8* %arrayidx14, align 1
  %shr15 = lshr i64 %shr12, 8
  %conv16 = trunc i64 %shr15 to i8
  %arrayidx17 = getelementptr inbounds i8, i8* %dst, i64 6
  store i8 %conv16, i8* %arrayidx17, align 1
  %shr18 = lshr i64 %shr15, 8
  %conv19 = trunc i64 %shr18 to i8
  %arrayidx20 = getelementptr inbounds i8, i8* %dst, i64 7
  store i8 %conv19, i8* %arrayidx20, align 1
  ret void
}

declare void @sodium_memzero(i8* noundef, i64 noundef) #5

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @_crypto_onetimeauth_poly1305(i8* noundef %out, %struct.uint8ptr_wrapped_ty* noundef %m, i8* noundef %key) #0 {
entry:
  %out.addr = alloca i8*, align 8
  %key.addr = alloca i8*, align 8
  %state = alloca %struct.poly1305_state_internal_t, align 8
  store i8* %out, i8** %out.addr, align 8
  %out.addr1 = bitcast i8** %out.addr to i8*
  call void @llvm.var.annotation(i8* %out.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 288, i8* null)
  store i8* %key, i8** %key.addr, align 8
  %key.addr2 = bitcast i8** %key.addr to i8*
  call void @llvm.var.annotation(i8* %key.addr2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 290, i8* null)
  %0 = bitcast %struct.poly1305_state_internal_t* %state to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 96, i1 false)
  %1 = load i8*, i8** %key.addr, align 8
  call void @_poly1305_init(%struct.poly1305_state_internal_t* noundef %state, i8* noundef %1)
  call void @_poly1305_update(%struct.poly1305_state_internal_t* noundef %state, %struct.uint8ptr_wrapped_ty* noundef %m)
  %2 = load i8*, i8** %out.addr, align 8
  call void @_poly1305_finish(%struct.poly1305_state_internal_t* noundef %state, i8* noundef %2)
  ret i32 0
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i1 @_crypto_onetimeauth_poly1305_verify(i8* noundef %h, %struct.uint8ptr_wrapped_ty* noundef %input, i8* noundef %k) #0 {
entry:
  %k.addr = alloca i8*, align 8
  %correct = alloca [16 x i8], align 16
  store i8* %k, i8** %k.addr, align 8
  %k.addr1 = bitcast i8** %k.addr to i8*
  call void @llvm.var.annotation(i8* %k.addr1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 312, i8* null)
  %correct2 = bitcast [16 x i8]* %correct to i8*
  call void @llvm.var.annotation(i8* %correct2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 315, i8* null)
  %0 = bitcast [16 x i8]* %correct to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 16, i1 false)
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %correct, i64 0, i64 0
  %1 = load i8*, i8** %k.addr, align 8
  %call = call i32 @_crypto_onetimeauth_poly1305(i8* noundef %arraydecay, %struct.uint8ptr_wrapped_ty* noundef %input, i8* noundef %1)
  %arraydecay3 = getelementptr inbounds [16 x i8], [16 x i8]* %correct, i64 0, i64 0
  %call4 = call zeroext i1 @_crypto_verify_16(i8* noundef %h, i8* noundef %arraydecay3)
  ret i1 %call4
}

declare zeroext i1 @_crypto_verify_16(i8* noundef, i8* noundef) #5

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn writeonly }
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
!10 = distinct !{!10, !7}

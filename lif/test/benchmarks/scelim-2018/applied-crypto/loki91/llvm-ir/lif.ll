; ModuleID = 'llvm-ir/base.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sfn_desc = type { i16, i16 }
%i8ptr.wrapped.ty = type { i8*, i64 }
%struct.loki_ctx = type { [16 x i32] }
%i32ptr.wrapped.ty = type { i32*, i64 }

@P = dso_local global [32 x i8] c"\1F\17\0F\07\1E\16\0E\06\1D\15\0D\05\1C\14\0C\04\1B\13\0B\03\1A\12\0A\02\19\11\09\01\18\10\08\00", align 16
@sfn = dso_local global [17 x %struct.sfn_desc] [%struct.sfn_desc { i16 375, i16 31 }, %struct.sfn_desc { i16 379, i16 31 }, %struct.sfn_desc { i16 391, i16 31 }, %struct.sfn_desc { i16 395, i16 31 }, %struct.sfn_desc { i16 397, i16 31 }, %struct.sfn_desc { i16 415, i16 31 }, %struct.sfn_desc { i16 419, i16 31 }, %struct.sfn_desc { i16 425, i16 31 }, %struct.sfn_desc { i16 433, i16 31 }, %struct.sfn_desc { i16 445, i16 31 }, %struct.sfn_desc { i16 451, i16 31 }, %struct.sfn_desc { i16 463, i16 31 }, %struct.sfn_desc { i16 471, i16 31 }, %struct.sfn_desc { i16 477, i16 31 }, %struct.sfn_desc { i16 487, i16 31 }, %struct.sfn_desc { i16 499, i16 31 }, %struct.sfn_desc zeroinitializer], align 16
@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @setlokikey(%i8ptr.wrapped.ty* noundef %key, %struct.loki_ctx* noundef %c) #0 {
entry:
  %key.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %key, i32 0, i32 1
  %key.field0.length = load i64, i64* %key.field0.length.ptr, align 8
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
  %0 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %key, i32 0, i32 0
  %key.unwrapped = load i8*, i8** %0, align 8
  %1 = bitcast i8* %key.unwrapped to i32*
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0
  %2 = load i32, i32* %arrayidx, align 4
  %3 = bitcast i8* %key.unwrapped to i32*
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i64 1
  %4 = load i32, i32* %arrayidx1, align 4
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i64 [ 0, %entry ], [ %add20, %for.inc ]
  %KL.0.rewritten = phi i32 [ %2, %entry ], [ %or7, %for.inc ]
  %KR.0.rewritten = phi i32 [ %4, %entry ], [ %or19, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %5 = load i1, i1* %out.3, align 1
  %6 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %6
  %cond.fold = or i1 %fwcond.and.fwtaken, %5
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp ult i64 %i.0.rewritten, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i1, i1* %out.1, align 1
  %in. = and i1 %7, %cmp
  %cond.fold5 = or i1 false, %in.
  store i1 %cond.fold5, i1* %out.2, align 1
  %loki_subkeys = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [16 x i32], [16 x i32]* %loki_subkeys, i64 0, i64 %i.0.rewritten
  store i32 %KL.0.rewritten, i32* %arrayidx2, align 4
  %shl = shl i32 %KL.0.rewritten, 12
  %shr = ashr i32 %KL.0.rewritten, 20
  %or = or i32 %shl, %shr
  %loki_subkeys3 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i32 0, i32 0
  %add = add i64 %i.0.rewritten, 1
  %arrayidx4 = getelementptr inbounds [16 x i32], [16 x i32]* %loki_subkeys3, i64 0, i64 %add
  store i32 %or, i32* %arrayidx4, align 4
  %shl5 = shl i32 %or, 13
  %shr6 = ashr i32 %or, 19
  %or7 = or i32 %shl5, %shr6
  %loki_subkeys8 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i32 0, i32 0
  %add9 = add i64 %i.0.rewritten, 2
  %arrayidx10 = getelementptr inbounds [16 x i32], [16 x i32]* %loki_subkeys8, i64 0, i64 %add9
  store i32 %KR.0.rewritten, i32* %arrayidx10, align 4
  %shl11 = shl i32 %KR.0.rewritten, 12
  %shr12 = ashr i32 %KR.0.rewritten, 20
  %or13 = or i32 %shl11, %shr12
  %loki_subkeys14 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i32 0, i32 0
  %add15 = add i64 %i.0.rewritten, 3
  %arrayidx16 = getelementptr inbounds [16 x i32], [16 x i32]* %loki_subkeys14, i64 0, i64 %add15
  store i32 %or13, i32* %arrayidx16, align 4
  %shl17 = shl i32 %or13, 13
  %shr18 = ashr i32 %or13, 19
  %or19 = or i32 %shl17, %shr18
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i1, i1* %out.2, align 1
  %cond.fold6 = or i1 false, %8
  store i1 %cond.fold6, i1* %out.3, align 1
  %add20 = add i64 %i.0.rewritten, 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %9 = load i1, i1* %out.1, align 1
  %10 = xor i1 %cmp, true
  %in.7 = and i1 %9, %10
  %cond.fold8 = or i1 false, %in.7
  store i1 %cond.fold8, i1* %out.4, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @enloki(%struct.loki_ctx* noundef %c, %i8ptr.wrapped.ty* noundef %b) #0 {
entry:
  %b.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %b, i32 0, i32 1
  %b.field0.length = load i64, i64* %b.field0.length.ptr, align 8
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
  %0 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %b, i32 0, i32 0
  %b.unwrapped = load i8*, i8** %0, align 8
  %1 = bitcast i8* %b.unwrapped to i32*
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0
  %2 = load i32, i32* %arrayidx, align 4
  %3 = bitcast i8* %b.unwrapped to i32*
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i64 1
  %4 = load i32, i32* %arrayidx1, align 4
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i64 [ 0, %entry ], [ %add7, %for.inc ]
  %L.0.rewritten = phi i32 [ %2, %entry ], [ %xor, %for.inc ]
  %R.0.rewritten = phi i32 [ %4, %entry ], [ %xor6, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %5 = load i1, i1* %out.3, align 1
  %6 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %6
  %cond.fold = or i1 %fwcond.and.fwtaken, %5
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp ult i64 %i.0.rewritten, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i1, i1* %out.1, align 1
  %in. = and i1 %7, %cmp
  %cond.fold5 = or i1 false, %in.
  store i1 %cond.fold5, i1* %out.2, align 1
  %loki_subkeys = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [16 x i32], [16 x i32]* %loki_subkeys, i64 0, i64 %i.0.rewritten
  %8 = load i32, i32* %arrayidx2, align 4
  %call = call i32 @f(i32 noundef %R.0.rewritten, i32 noundef %8)
  %xor = xor i32 %L.0.rewritten, %call
  %loki_subkeys3 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i32 0, i32 0
  %add = add i64 %i.0.rewritten, 1
  %arrayidx4 = getelementptr inbounds [16 x i32], [16 x i32]* %loki_subkeys3, i64 0, i64 %add
  %9 = load i32, i32* %arrayidx4, align 4
  %call5 = call i32 @f(i32 noundef %xor, i32 noundef %9)
  %xor6 = xor i32 %R.0.rewritten, %call5
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i1, i1* %out.2, align 1
  %cond.fold6 = or i1 false, %10
  store i1 %cond.fold6, i1* %out.3, align 1
  %add7 = add i64 %i.0.rewritten, 2
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %L.0.lcssa.rewritten = phi i32 [ %L.0.rewritten, %for.cond ]
  %R.0.lcssa.rewritten = phi i32 [ %R.0.rewritten, %for.cond ]
  %11 = load i1, i1* %out.1, align 1
  %12 = xor i1 %cmp, true
  %in.7 = and i1 %11, %12
  %cond.fold8 = or i1 false, %in.7
  store i1 %cond.fold8, i1* %out.4, align 1
  %13 = bitcast i8* %b.unwrapped to i32*
  %arrayidx8 = getelementptr inbounds i32, i32* %13, i64 0
  store i32 %R.0.lcssa.rewritten, i32* %arrayidx8, align 4
  %14 = bitcast i8* %b.unwrapped to i32*
  %arrayidx9 = getelementptr inbounds i32, i32* %14, i64 1
  store i32 %L.0.lcssa.rewritten, i32* %arrayidx9, align 4
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @f(i32 noundef %r, i32 noundef %k) #0 {
entry:
  %b.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %c.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %arg.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i1 true, i1* %out., align 1
  %xor = xor i32 %r, %k
  %and = and i32 %xor, 4095
  %call = call signext i16 @s(i32 noundef %and)
  %conv = sext i16 %call to i32
  %shr = ashr i32 %xor, 8
  %and1 = and i32 %shr, 4095
  %call2 = call signext i16 @s(i32 noundef %and1)
  %conv3 = sext i16 %call2 to i32
  %shl = shl i32 %conv3, 8
  %or = or i32 %conv, %shl
  %shr4 = ashr i32 %xor, 16
  %and5 = and i32 %shr4, 4095
  %call6 = call signext i16 @s(i32 noundef %and5)
  %conv7 = sext i16 %call6 to i32
  %shl8 = shl i32 %conv7, 16
  %or9 = or i32 %or, %shl8
  %shr10 = ashr i32 %xor, 24
  %shl11 = shl i32 %xor, 8
  %or12 = or i32 %shr10, %shl11
  %and13 = and i32 %or12, 4095
  %call14 = call signext i16 @s(i32 noundef %and13)
  %conv15 = sext i16 %call14 to i32
  %shl16 = shl i32 %conv15, 24
  %or17 = or i32 %or9, %shl16
  store i32 %or17, i32* %b, align 4
  %b.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b.wrapped, i32 0, i32 0
  %b.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b.wrapped, i32 0, i32 1
  store i64 0, i64* %b.wrapped.field0.length.ptr, align 8
  store i32* %b, i32** %b.unwrapped, align 8
  %c.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %c.wrapped, i32 0, i32 0
  %c.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %c.wrapped, i32 0, i32 1
  store i64 0, i64* %c.wrapped.field0.length.ptr, align 8
  store i32* %c, i32** %c.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arg.wrapped, i32 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arg.wrapped, i32 0, i32 1
  store i64 32, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @P, i64 0, i64 0), i8** %arg.unwrapped, align 8
  call void @perm32(%i32ptr.wrapped.ty* %b.wrapped, %i32ptr.wrapped.ty* %c.wrapped, %i8ptr.wrapped.ty* %arg.wrapped)
  %0 = load i32, i32* %c, align 4
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 %0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local signext i16 @s(i32 noundef %i) #0 {
entry:
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %shr = ashr i32 %i, 8
  %and = and i32 %shr, 12
  %and1 = and i32 %i, 3
  %or = or i32 %and, %and1
  %conv = trunc i32 %or to i16
  %shr2 = ashr i32 %i, 2
  %and3 = and i32 %shr2, 255
  %conv4 = trunc i32 %and3 to i16
  %conv5 = sext i16 %conv4 to i32
  %conv6 = sext i16 %conv to i32
  %mul = mul nsw i32 %conv6, 17
  %xor = xor i32 %mul, 255
  %add = add nsw i32 %conv5, %xor
  %and7 = and i32 %add, 255
  %conv8 = trunc i32 %and7 to i16
  %idxprom = sext i16 %conv to i64
  %arrayidx = getelementptr inbounds [17 x %struct.sfn_desc], [17 x %struct.sfn_desc]* @sfn, i64 0, i64 %idxprom
  %exp = getelementptr inbounds %struct.sfn_desc, %struct.sfn_desc* %arrayidx, i32 0, i32 1
  %0 = load i16, i16* %exp, align 2
  %idxprom9 = sext i16 %conv to i64
  %arrayidx10 = getelementptr inbounds [17 x %struct.sfn_desc], [17 x %struct.sfn_desc]* @sfn, i64 0, i64 %idxprom9
  %gen = getelementptr inbounds %struct.sfn_desc, %struct.sfn_desc* %arrayidx10, i32 0, i32 0
  %1 = load i16, i16* %gen, align 4
  %call = call signext i16 @exp8(i16 noundef signext %conv8, i16 noundef signext %0, i16 noundef signext %1)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i16 %call
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @perm32(%i32ptr.wrapped.ty* noundef %in, %i32ptr.wrapped.ty* noundef %out, %i8ptr.wrapped.ty* noundef %perm) #0 {
entry:
  %in.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %in, i32 0, i32 1
  %in.field0.length = load i64, i64* %in.field0.length.ptr, align 8
  %out.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %out, i32 0, i32 1
  %out.field0.length = load i64, i64* %out.field0.length.ptr, align 8
  %perm.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %perm, i32 0, i32 1
  %perm.field0.length = load i64, i64* %perm.field0.length.ptr, align 8
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
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.5, align 1
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %in, i32 0, i32 0
  %in.unwrapped = load i32*, i32** %0, align 8
  %1 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %out, i32 0, i32 0
  %out.unwrapped = load i32*, i32** %1, align 8
  %2 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %perm, i32 0, i32 0
  %perm.unwrapped = load i8*, i8** %2, align 8
  store i32 0, i32* %out.unwrapped, align 4
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %mask.0.rewritten = phi i32 [ -2147483648, %entry ], [ %shr1, %for.inc ]
  %o.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %p.0.rewritten = phi i8* [ %perm.unwrapped, %entry ], [ %incdec.ptr, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %3 = load i1, i1* %out.5, align 1
  %4 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %4
  %cond.fold = or i1 %fwcond.and.fwtaken, %3
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp slt i32 %o.0.rewritten, 32
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i1, i1* %out.1, align 1
  %in. = and i1 %5, %cmp
  %cond.fold7 = or i1 false, %in.
  store i1 %cond.fold7, i1* %out.2, align 1
  %incdec.ptr = getelementptr inbounds i8, i8* %p.0.rewritten, i32 1
  %6 = load i8, i8* %p.0.rewritten, align 1
  %conv = sext i8 %6 to i32
  %7 = load i32, i32* %in.unwrapped, align 4
  %shr = ashr i32 %7, %conv
  %and = and i32 %shr, 1
  %tobool = icmp ne i32 %and, 0
  br label %if.then

if.then:                                          ; preds = %for.body
  %8 = load i1, i1* %out.2, align 1
  %in.8 = and i1 %8, %tobool
  %cond.fold9 = or i1 false, %in.8
  store i1 %cond.fold9, i1* %out.3, align 1
  %9 = load i1, i1* %out.3, align 1
  %10 = bitcast i64* %shadow to i32*
  %ctsel = select i1 %9, i32* %out.unwrapped, i32* %10
  %11 = load i32, i32* %ctsel, align 4
  %or = or i32 %11, %mask.0.rewritten
  %12 = bitcast i64* %shadow to i32*
  %ctsel16 = select i1 %9, i32* %out.unwrapped, i32* %12
  %13 = load i32, i32* %ctsel16, align 4
  %select.val. = select i1 %9, i32 %or, i32 %13
  store i32 %select.val., i32* %ctsel16, align 4
  br label %if.end

if.end:                                           ; preds = %if.then
  %14 = load i1, i1* %out.3, align 1
  %15 = load i1, i1* %out.2, align 1
  %16 = xor i1 %tobool, true
  %in.10 = and i1 %15, %16
  %cond.fold11 = or i1 false, %14
  %cond.fold12 = or i1 %cond.fold11, %in.10
  store i1 %cond.fold12, i1* %out.4, align 1
  %shr1 = ashr i32 %mask.0.rewritten, 1
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %17 = load i1, i1* %out.4, align 1
  %cond.fold13 = or i1 false, %17
  store i1 %cond.fold13, i1* %out.5, align 1
  %inc = add nsw i32 %o.0.rewritten, 1
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %18 = load i1, i1* %out.1, align 1
  %19 = xor i1 %cmp, true
  %in.14 = and i1 %18, %19
  %cond.fold15 = or i1 false, %in.14
  store i1 %cond.fold15, i1* %out.6, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local signext i16 @exp8(i16 noundef signext %base, i16 noundef signext %exponent, i16 noundef signext %gen) #0 {
entry:
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
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.6, align 1
  %conv = sext i16 %base to i32
  %cmp = icmp eq i32 %conv, 0
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %if.end

if.then:                                          ; preds = %while.end
  %0 = load i1, i1* %out., align 1
  %in. = and i1 %0, %cmp
  %cond.fold = or i1 false, %in.
  store i1 %cond.fold, i1* %out.1, align 1
  %1 = load i1, i1* %out.1, align 1
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i1, i1* %out., align 1
  %3 = xor i1 %cmp, true
  %in.9 = and i1 %2, %3
  %cond.fold10 = or i1 false, %in.9
  store i1 %cond.fold10, i1* %out.2, align 1
  %4 = load i1, i1* %out.2, align 1
  br label %while.cond

while.cond:                                       ; preds = %if.end9, %if.end
  %accum.0.rewritten = phi i16 [ %base, %if.end ], [ %call12, %if.end9 ]
  %exponent.addr.0.rewritten = phi i16 [ %exponent, %if.end ], [ %conv11, %if.end9 ]
  %result.0.rewritten = phi i16 [ 1, %if.end ], [ %result.1.rewritten, %if.end9 ]
  %fwedge.taken.rewritten = phi i1 [ true, %if.end ], [ false, %if.end9 ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp3, %if.end9 ], [ false, %if.end ]
  %5 = load i1, i1* %out.6, align 1
  %6 = load i1, i1* %out.2, align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %6
  %cond.fold11 = or i1 %fwcond.and.fwtaken, %5
  store i1 %cond.fold11, i1* %out.3, align 1
  %7 = load i1, i1* %out.3, align 1
  %conv2 = sext i16 %exponent.addr.0.rewritten to i32
  %cmp3 = icmp ne i32 %conv2, 0
  br i1 %cmp3, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i1, i1* %out.3, align 1
  %in.12 = and i1 %8, %cmp3
  %cond.fold13 = or i1 false, %in.12
  store i1 %cond.fold13, i1* %out.4, align 1
  %9 = load i1, i1* %out.4, align 1
  %conv5 = sext i16 %exponent.addr.0.rewritten to i32
  %and = and i32 %conv5, 1
  %cmp6 = icmp eq i32 %and, 1
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %while.body
  %10 = load i1, i1* %out.4, align 1
  %in.14 = and i1 %10, %cmp6
  %cond.fold15 = or i1 false, %in.14
  store i1 %cond.fold15, i1* %out.5, align 1
  %11 = load i1, i1* %out.5, align 1
  %cond.fold23 = or i1 false, %in.14
  %call = call i16 @mult8(i16 %result.0.rewritten, i16 %accum.0.rewritten, i16 %gen, i1 %cond.fold23)
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %while.body
  %result.1.rewritten = phi i16 [ %call, %if.then8 ], [ %result.0.rewritten, %while.body ]
  %12 = load i1, i1* %out.5, align 1
  %13 = load i1, i1* %out.4, align 1
  %14 = xor i1 %cmp6, true
  %in.16 = and i1 %13, %14
  %cond.fold17 = or i1 false, %12
  %cond.fold18 = or i1 %cond.fold17, %in.16
  store i1 %cond.fold18, i1* %out.6, align 1
  %15 = load i1, i1* %out.6, align 1
  %conv10 = sext i16 %exponent.addr.0.rewritten to i32
  %shr = ashr i32 %conv10, 1
  %conv11 = trunc i32 %shr to i16
  %cond.fold24 = or i1 false, %12
  %cond.fold25 = or i1 %cond.fold24, %in.16
  %call12 = call i16 @mult8(i16 %accum.0.rewritten, i16 %accum.0.rewritten, i16 %gen, i1 %cond.fold25)
  br label %while.cond, !llvm.loop !10

while.end:                                        ; preds = %while.cond
  %result.0.lcssa.rewritten = phi i16 [ %result.0.rewritten, %while.cond ]
  %16 = load i1, i1* %out.3, align 1
  %17 = xor i1 %cmp3, true
  %in.19 = and i1 %16, %17
  %cond.fold20 = or i1 false, %in.19
  store i1 %cond.fold20, i1* %out.7, align 1
  %18 = load i1, i1* %out.7, align 1
  br label %if.then

return:                                           ; preds = %if.then
  %retval.0.rewritten = phi i16 [ 0, %if.then ]
  %19 = load i1, i1* %out.7, align 1
  %phi.fold = select i1 %19, i16 %result.0.lcssa.rewritten, i16 %retval.0.rewritten
  %20 = load i1, i1* %out.1, align 1
  %cond.fold21 = or i1 false, %20
  %cond.fold22 = or i1 %cond.fold21, %19
  store i1 %cond.fold22, i1* %out.8, align 1
  ret i16 %phi.fold
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local signext i16 @mult8(i16 noundef signext %a, i16 noundef signext %b, i16 noundef signext %gen, i1 %entry.cond) #0 {
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %entry

entry:                                            ; preds = %0
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
  store i1 false, i1* %out.9, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %product.0.rewritten = phi i16 [ 0, %entry ], [ %phi.fold31, %for.inc ]
  %i.0.rewritten = phi i16 [ 32767, %entry ], [ %dec, %for.inc ]
  %b.addr.0.rewritten = phi i16 [ %b, %entry ], [ %phi.fold32, %for.inc ]
  %a.addr.0.rewritten = phi i16 [ %a, %entry ], [ %phi.fold33, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %1 = load i1, i1* %out.9, align 1
  %2 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %2
  %cond.fold = or i1 %fwcond.and.fwtaken, %1
  store i1 %cond.fold, i1* %out.1, align 1
  %conv = sext i16 %i.0.rewritten to i32
  %cmp = icmp sge i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i1, i1* %out.1, align 1
  %in. = and i1 %3, %cmp
  %cond.fold11 = or i1 false, %in.
  store i1 %cond.fold11, i1* %out.2, align 1
  %conv2 = sext i16 %b.addr.0.rewritten to i32
  %cmp3 = icmp eq i32 %conv2, 0
  br label %if.end

if.then:                                          ; preds = %if.end21
  %4 = load i1, i1* %out.2, align 1
  %in.12 = and i1 %4, %cmp3
  %cond.fold13 = or i1 false, %in.12
  store i1 %cond.fold13, i1* %out.3, align 1
  %5 = load i1, i1* %out.3, align 1
  br label %for.inc

if.end:                                           ; preds = %for.body
  %6 = load i1, i1* %out.2, align 1
  %7 = xor i1 %cmp3, true
  %in.14 = and i1 %6, %7
  %cond.fold15 = or i1 false, %in.14
  store i1 %cond.fold15, i1* %out.4, align 1
  %8 = load i1, i1* %out.4, align 1
  %conv5 = sext i16 %b.addr.0.rewritten to i32
  %and = and i32 %conv5, 1
  %tobool = icmp ne i32 %and, 0
  br label %if.then6

if.then6:                                         ; preds = %if.end
  %9 = load i1, i1* %out.4, align 1
  %in.16 = and i1 %9, %tobool
  %cond.fold17 = or i1 false, %in.16
  store i1 %cond.fold17, i1* %out.5, align 1
  %10 = load i1, i1* %out.5, align 1
  %conv7 = sext i16 %a.addr.0.rewritten to i32
  %conv8 = sext i16 %product.0.rewritten to i32
  %xor = xor i32 %conv8, %conv7
  %conv9 = trunc i32 %xor to i16
  br label %if.end10

if.end10:                                         ; preds = %if.then6
  %product.1.rewritten = phi i16 [ %conv9, %if.then6 ]
  %11 = load i1, i1* %out.5, align 1
  %12 = load i1, i1* %out.4, align 1
  %13 = xor i1 %tobool, true
  %in.18 = and i1 %12, %13
  %phi.fold = select i1 %in.18, i16 %product.0.rewritten, i16 %product.1.rewritten
  %cond.fold19 = or i1 false, %11
  %cond.fold20 = or i1 %cond.fold19, %in.18
  store i1 %cond.fold20, i1* %out.6, align 1
  %14 = load i1, i1* %out.6, align 1
  %conv11 = sext i16 %a.addr.0.rewritten to i32
  %shl = shl i32 %conv11, 1
  %conv12 = trunc i32 %shl to i16
  %conv13 = sext i16 %conv12 to i32
  %cmp14 = icmp sge i32 %conv13, 256
  br label %if.then16

if.then16:                                        ; preds = %if.end10
  %15 = load i1, i1* %out.6, align 1
  %in.21 = and i1 %15, %cmp14
  %cond.fold22 = or i1 false, %in.21
  store i1 %cond.fold22, i1* %out.7, align 1
  %16 = load i1, i1* %out.7, align 1
  %conv17 = sext i16 %gen to i32
  %conv18 = sext i16 %conv12 to i32
  %xor19 = xor i32 %conv18, %conv17
  %conv20 = trunc i32 %xor19 to i16
  br label %if.end21

if.end21:                                         ; preds = %if.then16
  %a.addr.1.rewritten = phi i16 [ %conv20, %if.then16 ]
  %17 = load i1, i1* %out.7, align 1
  %18 = load i1, i1* %out.6, align 1
  %19 = xor i1 %cmp14, true
  %in.23 = and i1 %18, %19
  %phi.fold30 = select i1 %in.23, i16 %conv12, i16 %a.addr.1.rewritten
  %cond.fold24 = or i1 false, %in.23
  %cond.fold25 = or i1 %cond.fold24, %17
  store i1 %cond.fold25, i1* %out.8, align 1
  %20 = load i1, i1* %out.8, align 1
  %conv22 = sext i16 %b.addr.0.rewritten to i32
  %shr = ashr i32 %conv22, 1
  %conv23 = trunc i32 %shr to i16
  br label %if.then

for.inc:                                          ; preds = %if.then
  %product.2.rewritten = phi i16 [ %product.0.rewritten, %if.then ]
  %b.addr.1.rewritten = phi i16 [ %b.addr.0.rewritten, %if.then ]
  %a.addr.2.rewritten = phi i16 [ %a.addr.0.rewritten, %if.then ]
  %21 = load i1, i1* %out.8, align 1
  %phi.fold33 = select i1 %21, i16 %phi.fold30, i16 %a.addr.2.rewritten
  %phi.fold32 = select i1 %21, i16 %conv23, i16 %b.addr.1.rewritten
  %phi.fold31 = select i1 %21, i16 %phi.fold, i16 %product.2.rewritten
  %22 = load i1, i1* %out.3, align 1
  %cond.fold26 = or i1 false, %21
  %cond.fold27 = or i1 %cond.fold26, %22
  store i1 %cond.fold27, i1* %out.9, align 1
  %dec = add i16 %i.0.rewritten, -1
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  %product.0.lcssa.rewritten = phi i16 [ %product.0.rewritten, %for.cond ]
  %23 = load i1, i1* %out.1, align 1
  %24 = xor i1 %cmp, true
  %in.28 = and i1 %23, %24
  %cond.fold29 = or i1 false, %in.28
  store i1 %cond.fold29, i1* %out.10, align 1
  ret i16 %product.0.lcssa.rewritten
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %arraydecay6.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay5.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %in = alloca [8 x i8], align 1
  %in_key = alloca [24 x i8], align 16
  %lc = alloca %struct.loki_ctx, align 4
  store i1 true, i1* %out., align 1
  %in1 = bitcast [8 x i8]* %in to i8*
  call void @llvm.var.annotation(i8* %in1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 20, i8* null)
  %in_key2 = bitcast [24 x i8]* %in_key to i8*
  call void @llvm.var.annotation(i8* %in_key2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 21, i8* null)
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  %call = call i64 @read(i32 noundef 0, i8* noundef %arraydecay, i64 noundef 8)
  %arraydecay3 = getelementptr inbounds [24 x i8], [24 x i8]* %in_key, i64 0, i64 0
  %call4 = call i64 @read(i32 noundef 0, i8* noundef %arraydecay3, i64 noundef 24)
  %arraydecay5 = getelementptr inbounds [24 x i8], [24 x i8]* %in_key, i64 0, i64 0
  %arraydecay5.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay5.wrapped, i32 0, i32 0
  %arraydecay5.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay5.wrapped, i32 0, i32 1
  store i64 24, i64* %arraydecay5.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay5, i8** %arraydecay5.unwrapped, align 8
  call void @setlokikey(%i8ptr.wrapped.ty* %arraydecay5.wrapped, %struct.loki_ctx* %lc)
  %arraydecay6 = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  %arraydecay6.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay6.wrapped, i32 0, i32 0
  %arraydecay6.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay6.wrapped, i32 0, i32 1
  store i64 8, i64* %arraydecay6.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay6, i8** %arraydecay6.unwrapped, align 8
  call void @enloki(%struct.loki_ctx* %lc, %i8ptr.wrapped.ty* %arraydecay6.wrapped)
  %arraydecay7 = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  %call8 = call i64 @write(i32 noundef 1, i8* noundef %arraydecay7, i64 noundef 8)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #2

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
!11 = distinct !{!11, !7}

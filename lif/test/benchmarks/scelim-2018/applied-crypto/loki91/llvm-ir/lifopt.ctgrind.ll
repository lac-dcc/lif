; ModuleID = 'llvm-ir/lif.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sfn_desc = type { i16, i16 }
%i8ptr.wrapped.ty = type { i8*, i64 }
%struct.loki_ctx = type { [16 x i32] }
%i32ptr.wrapped.ty = type { i32*, i64 }

@P = dso_local global [32 x i8] c"\1F\17\0F\07\1E\16\0E\06\1D\15\0D\05\1C\14\0C\04\1B\13\0B\03\1A\12\0A\02\19\11\09\01\18\10\08\00", align 16
@sfn = dso_local local_unnamed_addr global [17 x %struct.sfn_desc] [%struct.sfn_desc { i16 375, i16 31 }, %struct.sfn_desc { i16 379, i16 31 }, %struct.sfn_desc { i16 391, i16 31 }, %struct.sfn_desc { i16 395, i16 31 }, %struct.sfn_desc { i16 397, i16 31 }, %struct.sfn_desc { i16 415, i16 31 }, %struct.sfn_desc { i16 419, i16 31 }, %struct.sfn_desc { i16 425, i16 31 }, %struct.sfn_desc { i16 433, i16 31 }, %struct.sfn_desc { i16 445, i16 31 }, %struct.sfn_desc { i16 451, i16 31 }, %struct.sfn_desc { i16 463, i16 31 }, %struct.sfn_desc { i16 471, i16 31 }, %struct.sfn_desc { i16 477, i16 31 }, %struct.sfn_desc { i16 487, i16 31 }, %struct.sfn_desc { i16 499, i16 31 }, %struct.sfn_desc zeroinitializer], align 16
@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @setlokikey(%i8ptr.wrapped.ty* nocapture noundef readonly %key, %struct.loki_ctx* nocapture noundef writeonly %c) local_unnamed_addr #0 {
entry:
  %0 = bitcast %i8ptr.wrapped.ty* %key to i32**
  %key.unwrapped2 = load i32*, i32** %0, align 8
  %1 = load i32, i32* %key.unwrapped2, align 4
  %arrayidx1 = getelementptr inbounds i32, i32* %key.unwrapped2, i64 1
  %2 = load i32, i32* %arrayidx1, align 4
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %KR.0.rewritten5 = phi i32 [ %2, %entry ], [ %or19, %for.body ]
  %KL.0.rewritten4 = phi i32 [ %1, %entry ], [ %or7, %for.body ]
  %i.0.rewritten3 = phi i64 [ 0, %entry ], [ %add20, %for.body ]
  %arrayidx2 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i64 0, i32 0, i64 %i.0.rewritten3
  store i32 %KL.0.rewritten4, i32* %arrayidx2, align 4
  %shl = shl i32 %KL.0.rewritten4, 12
  %shr = ashr i32 %KL.0.rewritten4, 20
  %or = or i32 %shl, %shr
  %add = or i64 %i.0.rewritten3, 1
  %arrayidx4 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i64 0, i32 0, i64 %add
  store i32 %or, i32* %arrayidx4, align 4
  %shl5 = shl i32 %or, 13
  %shr6 = ashr i32 %or, 19
  %or7 = or i32 %shl5, %shr6
  %add9 = or i64 %i.0.rewritten3, 2
  %arrayidx10 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i64 0, i32 0, i64 %add9
  store i32 %KR.0.rewritten5, i32* %arrayidx10, align 4
  %shl11 = shl i32 %KR.0.rewritten5, 12
  %shr12 = ashr i32 %KR.0.rewritten5, 20
  %or13 = or i32 %shl11, %shr12
  %add15 = or i64 %i.0.rewritten3, 3
  %arrayidx16 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i64 0, i32 0, i64 %add15
  store i32 %or13, i32* %arrayidx16, align 4
  %shl17 = shl i32 %or13, 13
  %shr18 = ashr i32 %or13, 19
  %or19 = or i32 %shl17, %shr18
  %add20 = add nuw nsw i64 %i.0.rewritten3, 4
  %cmp = icmp ult i64 %i.0.rewritten3, 12
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !6

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @enloki(%struct.loki_ctx* nocapture noundef readonly %c, %i8ptr.wrapped.ty* nocapture noundef readonly %b) local_unnamed_addr #0 {
entry:
  %0 = bitcast %i8ptr.wrapped.ty* %b to i32**
  %b.unwrapped2 = load i32*, i32** %0, align 8
  %1 = load i32, i32* %b.unwrapped2, align 4
  %arrayidx1 = getelementptr inbounds i32, i32* %b.unwrapped2, i64 1
  %2 = load i32, i32* %arrayidx1, align 4
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %R.0.rewritten5 = phi i32 [ %2, %entry ], [ %xor6, %for.body ]
  %L.0.rewritten4 = phi i32 [ %1, %entry ], [ %xor, %for.body ]
  %i.0.rewritten3 = phi i64 [ 0, %entry ], [ %add7, %for.body ]
  %arrayidx2 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i64 0, i32 0, i64 %i.0.rewritten3
  %3 = load i32, i32* %arrayidx2, align 4
  %call = tail call i32 @f(i32 noundef %R.0.rewritten5, i32 noundef %3)
  %xor = xor i32 %call, %L.0.rewritten4
  %add = or i64 %i.0.rewritten3, 1
  %arrayidx4 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i64 0, i32 0, i64 %add
  %4 = load i32, i32* %arrayidx4, align 4
  %call5 = tail call i32 @f(i32 noundef %xor, i32 noundef %4)
  %xor6 = xor i32 %call5, %R.0.rewritten5
  %add7 = add nuw nsw i64 %i.0.rewritten3, 2
  %cmp = icmp ult i64 %i.0.rewritten3, 14
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !8

for.end:                                          ; preds = %for.body
  store i32 %xor6, i32* %b.unwrapped2, align 4
  store i32 %xor, i32* %arrayidx1, align 4
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local i32 @f(i32 noundef %r, i32 noundef %k) local_unnamed_addr #0 {
entry:
  %b.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %c.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %arg.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %xor = xor i32 %k, %r
  %and = and i32 %xor, 4095
  %call = tail call signext i16 @s(i32 noundef %and)
  %conv = sext i16 %call to i32
  %0 = lshr i32 %xor, 8
  %and1 = and i32 %0, 4095
  %call2 = tail call signext i16 @s(i32 noundef %and1)
  %conv3 = sext i16 %call2 to i32
  %shl = shl nsw i32 %conv3, 8
  %or = or i32 %shl, %conv
  %1 = lshr i32 %xor, 16
  %and5 = and i32 %1, 4095
  %call6 = tail call signext i16 @s(i32 noundef %and5)
  %conv71 = zext i16 %call6 to i32
  %shl8 = shl nuw i32 %conv71, 16
  %or9 = or i32 %or, %shl8
  %shr10 = ashr i32 %xor, 24
  %shl11 = shl i32 %xor, 8
  %or12 = or i32 %shr10, %shl11
  %and13 = and i32 %or12, 4095
  %call14 = tail call signext i16 @s(i32 noundef %and13)
  %conv152 = zext i16 %call14 to i32
  %shl16 = shl i32 %conv152, 24
  %or17 = or i32 %or9, %shl16
  store i32 %or17, i32* %b, align 4
  %b.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b.wrapped, i64 0, i32 0
  %b.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b.wrapped, i64 0, i32 1
  store i64 0, i64* %b.wrapped.field0.length.ptr, align 8
  store i32* %b, i32** %b.unwrapped, align 8
  %c.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %c.wrapped, i64 0, i32 0
  %c.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %c.wrapped, i64 0, i32 1
  store i64 0, i64* %c.wrapped.field0.length.ptr, align 8
  store i32* %c, i32** %c.unwrapped, align 8
  %arg.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arg.wrapped, i64 0, i32 0
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arg.wrapped, i64 0, i32 1
  store i64 32, i64* %arg.wrapped.field0.length.ptr, align 8
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @P, i64 0, i64 0), i8** %arg.unwrapped, align 8
  call void @perm32(%i32ptr.wrapped.ty* nonnull %b.wrapped, %i32ptr.wrapped.ty* nonnull %c.wrapped, %i8ptr.wrapped.ty* nonnull %arg.wrapped)
  %2 = load i32, i32* %c, align 4
  ret i32 %2
}

; Function Attrs: nofree noinline norecurse nosync nounwind readonly sspstrong uwtable
define dso_local signext i16 @s(i32 noundef %i) local_unnamed_addr #1 {
entry:
  %0 = lshr i32 %i, 8
  %and = and i32 %0, 12
  %and1 = and i32 %i, 3
  %or = or i32 %and, %and1
  %conv = zext i32 %or to i64
  %1 = lshr i32 %i, 2
  %mul = mul nuw nsw i32 %or, 17
  %xor = xor i32 %mul, -1
  %add = add nsw i32 %1, %xor
  %2 = trunc i32 %add to i16
  %conv8 = and i16 %2, 255
  %exp = getelementptr inbounds [17 x %struct.sfn_desc], [17 x %struct.sfn_desc]* @sfn, i64 0, i64 %conv, i32 1
  %3 = load i16, i16* %exp, align 2
  %gen = getelementptr inbounds [17 x %struct.sfn_desc], [17 x %struct.sfn_desc]* @sfn, i64 0, i64 %conv, i32 0
  %4 = load i16, i16* %gen, align 4
  %call = tail call signext i16 @exp8(i16 noundef signext %conv8, i16 noundef signext %3, i16 noundef signext %4)
  ret i16 %call
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @perm32(%i32ptr.wrapped.ty* nocapture noundef readonly %in, %i32ptr.wrapped.ty* nocapture noundef readonly %out, %i8ptr.wrapped.ty* nocapture noundef readonly %perm) local_unnamed_addr #0 {
entry:
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %in, i64 0, i32 0
  %in.unwrapped = load i32*, i32** %0, align 8
  %1 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %out, i64 0, i32 0
  %out.unwrapped = load i32*, i32** %1, align 8
  %2 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %perm, i64 0, i32 0
  %perm.unwrapped = load i8*, i8** %2, align 8
  store i32 0, i32* %out.unwrapped, align 4
  %shadow.sroa.0 = alloca i32, align 8
  store i32 0, i32* %shadow.sroa.0, align 8
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %p.0.rewritten8 = phi i8* [ %perm.unwrapped, %entry ], [ %incdec.ptr, %for.body ]
  %o.0.rewritten7 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %mask.0.rewritten6 = phi i32 [ -2147483648, %entry ], [ %shr1, %for.body ]
  %incdec.ptr = getelementptr inbounds i8, i8* %p.0.rewritten8, i64 1
  %3 = load i8, i8* %p.0.rewritten8, align 1
  %4 = load i32, i32* %in.unwrapped, align 4
  %conv4 = zext i8 %3 to i32
  %5 = shl nuw i32 1, %conv4
  %6 = and i32 %5, %4
  %tobool.not = icmp eq i32 %6, 0
  %ctsel = select i1 %tobool.not, i32* %shadow.sroa.0, i32* %out.unwrapped
  %7 = load i32, i32* %ctsel, align 4
  %or = select i1 %tobool.not, i32 0, i32 %mask.0.rewritten6
  %select.val. = or i32 %or, %7
  store i32 %select.val., i32* %ctsel, align 4
  %shr1 = ashr i32 %mask.0.rewritten6, 1
  %inc = add nuw nsw i32 %o.0.rewritten7, 1
  %exitcond.not = icmp eq i32 %inc, 32
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !9

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind readnone sspstrong uwtable
define dso_local signext i16 @exp8(i16 noundef signext %base, i16 noundef signext %exponent, i16 noundef signext %gen) local_unnamed_addr #2 {
entry:
  %cmp = icmp ne i16 %base, 0
  %cmp3.not12 = icmp eq i16 %exponent, 0
  br i1 %cmp3.not12, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %if.end9
  %cond.fold1117 = phi i1 [ %cond.fold18, %if.end9 ], [ %cmp, %entry ]
  %result.0.rewritten16 = phi i16 [ %result.1.rewritten, %if.end9 ], [ 1, %entry ]
  %exponent.addr.0.rewritten15 = phi i16 [ %shr, %if.end9 ], [ %exponent, %entry ]
  %accum.0.rewritten14 = phi i16 [ %call12, %if.end9 ], [ %base, %entry ]
  %out.5.013 = phi i1 [ %out.5.1, %if.end9 ], [ false, %entry ]
  %0 = and i16 %exponent.addr.0.rewritten15, 1
  %cmp6.not = icmp eq i16 %0, 0
  br i1 %cmp6.not, label %if.end9, label %if.then8

if.then8:                                         ; preds = %while.body
  %call = tail call i16 @mult8(i16 %result.0.rewritten16, i16 %accum.0.rewritten14, i16 %gen, i1 undef)
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %while.body
  %out.5.1 = phi i1 [ %cond.fold1117, %if.then8 ], [ %out.5.013, %while.body ]
  %result.1.rewritten = phi i16 [ %call, %if.then8 ], [ %result.0.rewritten16, %while.body ]
  %in.16 = and i1 %cmp6.not, %cond.fold1117
  %cond.fold18 = or i1 %in.16, %out.5.1
  %shr = ashr i16 %exponent.addr.0.rewritten15, 1
  %call12 = tail call i16 @mult8(i16 %accum.0.rewritten14, i16 %accum.0.rewritten14, i16 %gen, i1 undef)
  %cmp3.not = icmp ult i16 %exponent.addr.0.rewritten15, 2
  br i1 %cmp3.not, label %while.end, label %while.body, !llvm.loop !10

while.end:                                        ; preds = %if.end9, %entry
  %result.0.rewritten.lcssa = phi i16 [ 1, %entry ], [ %result.1.rewritten, %if.end9 ]
  %cond.fold11.lcssa = phi i1 [ %cmp, %entry ], [ %cond.fold18, %if.end9 ]
  %phi.fold = select i1 %cond.fold11.lcssa, i16 %result.0.rewritten.lcssa, i16 0
  ret i16 %phi.fold
}

; Function Attrs: nofree noinline norecurse nosync nounwind readnone sspstrong uwtable
define dso_local signext i16 @mult8(i16 noundef signext %a, i16 noundef signext %b, i16 noundef signext %gen, i1 %entry.cond) local_unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %a.addr.0.rewritten17 = phi i16 [ %a, %entry ], [ %phi.fold33, %for.body ]
  %b.addr.0.rewritten16 = phi i16 [ %b, %entry ], [ %phi.fold32, %for.body ]
  %i.0.rewritten15 = phi i16 [ 32767, %entry ], [ %dec, %for.body ]
  %product.0.rewritten14 = phi i16 [ 0, %entry ], [ %phi.fold31, %for.body ]
  %cmp3 = icmp ne i16 %b.addr.0.rewritten16, 0
  %0 = and i16 %b.addr.0.rewritten16, 1
  %tobool.not = icmp eq i16 %0, 0
  %in.18 = and i1 %cmp3, %tobool.not
  %xor11 = select i1 %in.18, i16 0, i16 %a.addr.0.rewritten17
  %shl = shl i16 %a.addr.0.rewritten17, 1
  %cmp14 = icmp slt i16 %shl, 256
  %in.23 = and i1 %cmp3, %cmp14
  %xor1912 = select i1 %in.23, i16 0, i16 %gen
  %phi.fold30 = xor i16 %xor1912, %shl
  %phi.fold33 = select i1 %cmp3, i16 %phi.fold30, i16 %a.addr.0.rewritten17
  %shr = zext i1 %cmp3 to i16
  %phi.fold32 = ashr i16 %b.addr.0.rewritten16, %shr
  %phi.fold = select i1 %cmp3, i16 %xor11, i16 0
  %phi.fold31 = xor i16 %phi.fold, %product.0.rewritten14
  %dec = add nsw i16 %i.0.rewritten15, -1
  %cmp.not = icmp eq i16 %i.0.rewritten15, 0
  br i1 %cmp.not, label %for.end, label %for.body, !llvm.loop !11

for.end:                                          ; preds = %for.body
  ret i16 %phi.fold31
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #3 {
entry:
  %arraydecay24.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay23.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %in = alloca [8 x i8], align 1
  %in_key = alloca [24 x i8], align 16
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %_zzq_args12 = alloca [6 x i64], align 16
  %_zzq_result13 = alloca i64, align 8
  %lc = alloca %struct.loki_ctx, align 4
  %in1 = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %in1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 20, i8* null)
  %in_key2 = getelementptr inbounds [24 x i8], [24 x i8]* %in_key, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %in_key2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 21, i8* null)
  %call = call i64 @read(i32 noundef 0, i8* noundef nonnull %in1, i64 noundef 8) #6
  %call4 = call i64 @read(i32 noundef 0, i8* noundef nonnull %in_key2, i64 noundef 24) #6
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %0 = ptrtoint [8 x i8]* %in to i64
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %0, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 3, i64* %arrayidx7, align 16
  %arrayidx8 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx9, align 16
  %arrayidx10 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx10, align 8
  %1 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx, i64 0) #6, !srcloc !12
  store volatile i64 %1, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx14 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx14, align 16
  %2 = ptrtoint [24 x i8]* %in_key to i64
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 1
  store volatile i64 %2, i64* %arrayidx16, align 8
  %arrayidx17 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 2
  store volatile i64 3, i64* %arrayidx17, align 16
  %arrayidx18 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx18, align 8
  %arrayidx19 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx19, align 16
  %arrayidx20 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx20, align 8
  %3 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx14, i64 0) #6, !srcloc !13
  store volatile i64 %3, i64* %_zzq_result13, align 8
  %_zzq_result13.0._zzq_result13.0._zzq_result13.0. = load volatile i64, i64* %_zzq_result13, align 8
  %arraydecay23.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay23.wrapped, i64 0, i32 0
  %arraydecay23.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay23.wrapped, i64 0, i32 1
  store i64 24, i64* %arraydecay23.wrapped.field0.length.ptr, align 8
  store i8* %in_key2, i8** %arraydecay23.unwrapped, align 8
  call void @setlokikey(%i8ptr.wrapped.ty* nonnull %arraydecay23.wrapped, %struct.loki_ctx* nonnull %lc)
  %arraydecay24.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay24.wrapped, i64 0, i32 0
  %arraydecay24.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay24.wrapped, i64 0, i32 1
  store i64 8, i64* %arraydecay24.wrapped.field0.length.ptr, align 8
  store i8* %in1, i8** %arraydecay24.unwrapped, align 8
  call void @enloki(%struct.loki_ctx* nonnull %lc, %i8ptr.wrapped.ty* nonnull %arraydecay24.wrapped)
  %call26 = call i64 @write(i32 noundef 1, i8* noundef nonnull %in1, i64 noundef 8) #6
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #4

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #5

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #5

attributes #0 = { nofree noinline norecurse nosync nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline norecurse nosync nounwind readonly sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree noinline norecurse nosync nounwind readnone sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #5 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

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
!12 = !{i64 2148336340, i64 2148336376, i64 2148336444}
!13 = !{i64 2148337912, i64 2148337948, i64 2148338016}

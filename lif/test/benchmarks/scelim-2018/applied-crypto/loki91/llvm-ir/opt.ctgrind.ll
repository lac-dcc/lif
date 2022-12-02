; ModuleID = 'llvm-ir/base.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sfn_desc = type { i16, i16 }
%struct.loki_ctx = type { [16 x i32] }

@P = dso_local global [32 x i8] c"\1F\17\0F\07\1E\16\0E\06\1D\15\0D\05\1C\14\0C\04\1B\13\0B\03\1A\12\0A\02\19\11\09\01\18\10\08\00", align 16
@sfn = dso_local local_unnamed_addr global [17 x %struct.sfn_desc] [%struct.sfn_desc { i16 375, i16 31 }, %struct.sfn_desc { i16 379, i16 31 }, %struct.sfn_desc { i16 391, i16 31 }, %struct.sfn_desc { i16 395, i16 31 }, %struct.sfn_desc { i16 397, i16 31 }, %struct.sfn_desc { i16 415, i16 31 }, %struct.sfn_desc { i16 419, i16 31 }, %struct.sfn_desc { i16 425, i16 31 }, %struct.sfn_desc { i16 433, i16 31 }, %struct.sfn_desc { i16 445, i16 31 }, %struct.sfn_desc { i16 451, i16 31 }, %struct.sfn_desc { i16 463, i16 31 }, %struct.sfn_desc { i16 471, i16 31 }, %struct.sfn_desc { i16 477, i16 31 }, %struct.sfn_desc { i16 487, i16 31 }, %struct.sfn_desc { i16 499, i16 31 }, %struct.sfn_desc zeroinitializer], align 16
@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @setlokikey(i8* nocapture noundef readonly %key, %struct.loki_ctx* nocapture noundef writeonly %c) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* %key to i32*
  %1 = load i32, i32* %0, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %key, i64 4
  %2 = bitcast i8* %arrayidx1 to i32*
  %3 = load i32, i32* %2, align 4
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %KR.03 = phi i32 [ %3, %entry ], [ %or19, %for.body ]
  %KL.02 = phi i32 [ %1, %entry ], [ %or7, %for.body ]
  %i.01 = phi i64 [ 0, %entry ], [ %add20, %for.body ]
  %arrayidx2 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i64 0, i32 0, i64 %i.01
  store i32 %KL.02, i32* %arrayidx2, align 4
  %shl = shl i32 %KL.02, 12
  %shr = ashr i32 %KL.02, 20
  %or = or i32 %shl, %shr
  %add = or i64 %i.01, 1
  %arrayidx4 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i64 0, i32 0, i64 %add
  store i32 %or, i32* %arrayidx4, align 4
  %shl5 = shl i32 %or, 13
  %shr6 = ashr i32 %or, 19
  %or7 = or i32 %shl5, %shr6
  %add9 = or i64 %i.01, 2
  %arrayidx10 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i64 0, i32 0, i64 %add9
  store i32 %KR.03, i32* %arrayidx10, align 4
  %shl11 = shl i32 %KR.03, 12
  %shr12 = ashr i32 %KR.03, 20
  %or13 = or i32 %shl11, %shr12
  %add15 = or i64 %i.01, 3
  %arrayidx16 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i64 0, i32 0, i64 %add15
  store i32 %or13, i32* %arrayidx16, align 4
  %shl17 = shl i32 %or13, 13
  %shr18 = ashr i32 %or13, 19
  %or19 = or i32 %shl17, %shr18
  %add20 = add nuw nsw i64 %i.01, 4
  %cmp = icmp ult i64 %i.01, 12
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !6

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @enloki(%struct.loki_ctx* nocapture noundef readonly %c, i8* nocapture noundef %b) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8* %b to i32*
  %1 = load i32, i32* %0, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %b, i64 4
  %2 = bitcast i8* %arrayidx1 to i32*
  %3 = load i32, i32* %2, align 4
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %R.03 = phi i32 [ %3, %entry ], [ %xor6, %for.body ]
  %L.02 = phi i32 [ %1, %entry ], [ %xor, %for.body ]
  %i.01 = phi i64 [ 0, %entry ], [ %add7, %for.body ]
  %arrayidx2 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i64 0, i32 0, i64 %i.01
  %4 = load i32, i32* %arrayidx2, align 4
  %call = tail call i32 @f(i32 noundef %R.03, i32 noundef %4)
  %xor = xor i32 %call, %L.02
  %add = or i64 %i.01, 1
  %arrayidx4 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i64 0, i32 0, i64 %add
  %5 = load i32, i32* %arrayidx4, align 4
  %call5 = tail call i32 @f(i32 noundef %xor, i32 noundef %5)
  %xor6 = xor i32 %call5, %R.03
  %add7 = add nuw nsw i64 %i.01, 2
  %cmp = icmp ult i64 %i.01, 14
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !8

for.end:                                          ; preds = %for.body
  store i32 %xor6, i32* %0, align 4
  store i32 %xor, i32* %2, align 4
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local i32 @f(i32 noundef %r, i32 noundef %k) local_unnamed_addr #0 {
entry:
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
  call void @perm32(i32* noundef nonnull %b, i32* noundef nonnull %c, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @P, i64 0, i64 0))
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
define dso_local void @perm32(i32* nocapture noundef readonly %in, i32* nocapture noundef %out, i8* nocapture noundef readonly %perm) local_unnamed_addr #0 {
entry:
  store i32 0, i32* %out, align 4
  %.pre6 = load i32, i32* %in, align 4
  br label %for.body

for.body:                                         ; preds = %entry, %if.end
  %0 = phi i32 [ 0, %entry ], [ %5, %if.end ]
  %1 = phi i32 [ %.pre6, %entry ], [ %6, %if.end ]
  %p.05 = phi i8* [ %perm, %entry ], [ %incdec.ptr, %if.end ]
  %o.04 = phi i32 [ 0, %entry ], [ %inc, %if.end ]
  %mask.03 = phi i32 [ -2147483648, %entry ], [ %shr1, %if.end ]
  %incdec.ptr = getelementptr inbounds i8, i8* %p.05, i64 1
  %2 = load i8, i8* %p.05, align 1
  %conv1 = zext i8 %2 to i32
  %3 = shl nuw i32 1, %conv1
  %4 = and i32 %3, %1
  %tobool.not = icmp eq i32 %4, 0
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %for.body
  %or = or i32 %0, %mask.03
  store i32 %or, i32* %out, align 4
  %.pre = load i32, i32* %in, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = phi i32 [ %or, %if.then ], [ %0, %for.body ]
  %6 = phi i32 [ %.pre, %if.then ], [ %1, %for.body ]
  %shr1 = ashr i32 %mask.03, 1
  %inc = add nuw nsw i32 %o.04, 1
  %exitcond.not = icmp eq i32 %inc, 32
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !9

for.end:                                          ; preds = %if.end
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind readnone sspstrong uwtable
define dso_local signext i16 @exp8(i16 noundef signext %base, i16 noundef signext %exponent, i16 noundef signext %gen) local_unnamed_addr #2 {
entry:
  %cmp = icmp eq i16 %base, 0
  br i1 %cmp, label %return, label %while.cond.preheader

while.cond.preheader:                             ; preds = %entry
  %cmp3.not2 = icmp eq i16 %exponent, 0
  br i1 %cmp3.not2, label %return, label %while.body

while.body:                                       ; preds = %while.cond.preheader, %if.end9
  %result.05 = phi i16 [ %result.1, %if.end9 ], [ 1, %while.cond.preheader ]
  %exponent.addr.04 = phi i16 [ %shr, %if.end9 ], [ %exponent, %while.cond.preheader ]
  %accum.03 = phi i16 [ %call12, %if.end9 ], [ %base, %while.cond.preheader ]
  %0 = and i16 %exponent.addr.04, 1
  %cmp6.not = icmp eq i16 %0, 0
  br i1 %cmp6.not, label %if.end9, label %if.then8

if.then8:                                         ; preds = %while.body
  %call = tail call signext i16 @mult8(i16 noundef signext %result.05, i16 noundef signext %accum.03, i16 noundef signext %gen)
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %while.body
  %result.1 = phi i16 [ %call, %if.then8 ], [ %result.05, %while.body ]
  %shr = ashr i16 %exponent.addr.04, 1
  %call12 = tail call signext i16 @mult8(i16 noundef signext %accum.03, i16 noundef signext %accum.03, i16 noundef signext %gen)
  %cmp3.not = icmp ult i16 %exponent.addr.04, 2
  br i1 %cmp3.not, label %return, label %while.body, !llvm.loop !10

return:                                           ; preds = %if.end9, %while.cond.preheader, %entry
  %retval.0 = phi i16 [ 0, %entry ], [ 1, %while.cond.preheader ], [ %result.1, %if.end9 ]
  ret i16 %retval.0
}

; Function Attrs: nofree noinline norecurse nosync nounwind readnone sspstrong uwtable
define dso_local signext i16 @mult8(i16 noundef signext %a, i16 noundef signext %b, i16 noundef signext %gen) local_unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %a.addr.07 = phi i16 [ %a, %entry ], [ %a.addr.2, %for.inc ]
  %b.addr.06 = phi i16 [ %b, %entry ], [ %b.addr.1, %for.inc ]
  %i.05 = phi i16 [ 32767, %entry ], [ %dec, %for.inc ]
  %product.04 = phi i16 [ 0, %entry ], [ %product.2, %for.inc ]
  %cmp3 = icmp eq i16 %b.addr.06, 0
  br i1 %cmp3, label %for.inc, label %if.end

if.end:                                           ; preds = %for.body
  %0 = and i16 %b.addr.06, 1
  %tobool.not = icmp eq i16 %0, 0
  %xor1 = select i1 %tobool.not, i16 0, i16 %a.addr.07
  %product.1 = xor i16 %xor1, %product.04
  %shl = shl i16 %a.addr.07, 1
  %cmp14 = icmp sgt i16 %shl, 255
  %xor192 = select i1 %cmp14, i16 %gen, i16 0
  %a.addr.1 = xor i16 %xor192, %shl
  %shr = ashr i16 %b.addr.06, 1
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.end
  %product.2 = phi i16 [ %product.1, %if.end ], [ %product.04, %for.body ]
  %b.addr.1 = phi i16 [ %shr, %if.end ], [ 0, %for.body ]
  %a.addr.2 = phi i16 [ %a.addr.1, %if.end ], [ %a.addr.07, %for.body ]
  %dec = add nsw i16 %i.05, -1
  %cmp.not = icmp eq i16 %i.05, 0
  br i1 %cmp.not, label %for.end, label %for.body, !llvm.loop !11

for.end:                                          ; preds = %for.inc
  ret i16 %product.2
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #3 {
entry:
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
  call void @setlokikey(i8* noundef nonnull %in_key2, %struct.loki_ctx* noundef nonnull %lc)
  call void @enloki(%struct.loki_ctx* noundef nonnull %lc, i8* noundef nonnull %in1)
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

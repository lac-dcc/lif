; ModuleID = 'llvm-ir/loki91.ll'
source_filename = "lib/loki91.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sfn_desc = type { i16, i16 }
%struct.loki_ctx = type { [16 x i32] }

@P = dso_local global [32 x i8] c"\1F\17\0F\07\1E\16\0E\06\1D\15\0D\05\1C\14\0C\04\1B\13\0B\03\1A\12\0A\02\19\11\09\01\18\10\08\00", align 16
@sfn = dso_local global [17 x %struct.sfn_desc] [%struct.sfn_desc { i16 375, i16 31 }, %struct.sfn_desc { i16 379, i16 31 }, %struct.sfn_desc { i16 391, i16 31 }, %struct.sfn_desc { i16 395, i16 31 }, %struct.sfn_desc { i16 397, i16 31 }, %struct.sfn_desc { i16 415, i16 31 }, %struct.sfn_desc { i16 419, i16 31 }, %struct.sfn_desc { i16 425, i16 31 }, %struct.sfn_desc { i16 433, i16 31 }, %struct.sfn_desc { i16 445, i16 31 }, %struct.sfn_desc { i16 451, i16 31 }, %struct.sfn_desc { i16 463, i16 31 }, %struct.sfn_desc { i16 471, i16 31 }, %struct.sfn_desc { i16 477, i16 31 }, %struct.sfn_desc { i16 487, i16 31 }, %struct.sfn_desc { i16 499, i16 31 }, %struct.sfn_desc zeroinitializer], align 16

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @setlokikey(i8* noundef %key, %struct.loki_ctx* noundef %c) #0 {
entry:
  %0 = bitcast i8* %key to i32*
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0
  %1 = load i32, i32* %arrayidx, align 4
  %2 = bitcast i8* %key to i32*
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 1
  %3 = load i32, i32* %arrayidx1, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %add20, %for.inc ]
  %KL.0 = phi i32 [ %1, %entry ], [ %or7, %for.inc ]
  %KR.0 = phi i32 [ %3, %entry ], [ %or19, %for.inc ]
  %cmp = icmp ult i64 %i.0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %loki_subkeys = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [16 x i32], [16 x i32]* %loki_subkeys, i64 0, i64 %i.0
  store i32 %KL.0, i32* %arrayidx2, align 4
  %shl = shl i32 %KL.0, 12
  %shr = ashr i32 %KL.0, 20
  %or = or i32 %shl, %shr
  %loki_subkeys3 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i32 0, i32 0
  %add = add i64 %i.0, 1
  %arrayidx4 = getelementptr inbounds [16 x i32], [16 x i32]* %loki_subkeys3, i64 0, i64 %add
  store i32 %or, i32* %arrayidx4, align 4
  %shl5 = shl i32 %or, 13
  %shr6 = ashr i32 %or, 19
  %or7 = or i32 %shl5, %shr6
  %loki_subkeys8 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i32 0, i32 0
  %add9 = add i64 %i.0, 2
  %arrayidx10 = getelementptr inbounds [16 x i32], [16 x i32]* %loki_subkeys8, i64 0, i64 %add9
  store i32 %KR.0, i32* %arrayidx10, align 4
  %shl11 = shl i32 %KR.0, 12
  %shr12 = ashr i32 %KR.0, 20
  %or13 = or i32 %shl11, %shr12
  %loki_subkeys14 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i32 0, i32 0
  %add15 = add i64 %i.0, 3
  %arrayidx16 = getelementptr inbounds [16 x i32], [16 x i32]* %loki_subkeys14, i64 0, i64 %add15
  store i32 %or13, i32* %arrayidx16, align 4
  %shl17 = shl i32 %or13, 13
  %shr18 = ashr i32 %or13, 19
  %or19 = or i32 %shl17, %shr18
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %add20 = add i64 %i.0, 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @enloki(%struct.loki_ctx* noundef %c, i8* noundef %b) #0 {
entry:
  %0 = bitcast i8* %b to i32*
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0
  %1 = load i32, i32* %arrayidx, align 4
  %2 = bitcast i8* %b to i32*
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i64 1
  %3 = load i32, i32* %arrayidx1, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %add7, %for.inc ]
  %L.0 = phi i32 [ %1, %entry ], [ %xor, %for.inc ]
  %R.0 = phi i32 [ %3, %entry ], [ %xor6, %for.inc ]
  %cmp = icmp ult i64 %i.0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %loki_subkeys = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [16 x i32], [16 x i32]* %loki_subkeys, i64 0, i64 %i.0
  %4 = load i32, i32* %arrayidx2, align 4
  %call = call i32 @f(i32 noundef %R.0, i32 noundef %4)
  %xor = xor i32 %L.0, %call
  %loki_subkeys3 = getelementptr inbounds %struct.loki_ctx, %struct.loki_ctx* %c, i32 0, i32 0
  %add = add i64 %i.0, 1
  %arrayidx4 = getelementptr inbounds [16 x i32], [16 x i32]* %loki_subkeys3, i64 0, i64 %add
  %5 = load i32, i32* %arrayidx4, align 4
  %call5 = call i32 @f(i32 noundef %xor, i32 noundef %5)
  %xor6 = xor i32 %R.0, %call5
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %add7 = add i64 %i.0, 2
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %6 = bitcast i8* %b to i32*
  %arrayidx8 = getelementptr inbounds i32, i32* %6, i64 0
  store i32 %R.0, i32* %arrayidx8, align 4
  %7 = bitcast i8* %b to i32*
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 1
  store i32 %L.0, i32* %arrayidx9, align 4
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @f(i32 noundef %r, i32 noundef %k) #0 {
entry:
  %b = alloca i32, align 4
  %c = alloca i32, align 4
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
  call void @perm32(i32* noundef %b, i32* noundef %c, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @P, i64 0, i64 0))
  %0 = load i32, i32* %c, align 4
  ret i32 %0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @perm32(i32* noundef %in, i32* noundef %out, i8* noundef %perm) #0 {
entry:
  store i32 0, i32* %out, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %mask.0 = phi i32 [ -2147483648, %entry ], [ %shr1, %for.inc ]
  %o.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %p.0 = phi i8* [ %perm, %entry ], [ %incdec.ptr, %for.inc ]
  %cmp = icmp slt i32 %o.0, 32
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %incdec.ptr = getelementptr inbounds i8, i8* %p.0, i32 1
  %0 = load i8, i8* %p.0, align 1
  %conv = sext i8 %0 to i32
  %1 = load i32, i32* %in, align 4
  %shr = ashr i32 %1, %conv
  %and = and i32 %shr, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %2 = load i32, i32* %out, align 4
  %or = or i32 %2, %mask.0
  store i32 %or, i32* %out, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %shr1 = ashr i32 %mask.0, 1
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %o.0, 1
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local signext i16 @s(i32 noundef %i) #0 {
entry:
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
  ret i16 %call
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local signext i16 @mult8(i16 noundef signext %a, i16 noundef signext %b, i16 noundef signext %gen) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %product.0 = phi i16 [ 0, %entry ], [ %product.2, %for.inc ]
  %i.0 = phi i16 [ 32767, %entry ], [ %dec, %for.inc ]
  %b.addr.0 = phi i16 [ %b, %entry ], [ %b.addr.1, %for.inc ]
  %a.addr.0 = phi i16 [ %a, %entry ], [ %a.addr.2, %for.inc ]
  %conv = sext i16 %i.0 to i32
  %cmp = icmp sge i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %conv2 = sext i16 %b.addr.0 to i32
  %cmp3 = icmp eq i32 %conv2, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.inc

if.end:                                           ; preds = %for.body
  %conv5 = sext i16 %b.addr.0 to i32
  %and = and i32 %conv5, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then6, label %if.end10

if.then6:                                         ; preds = %if.end
  %conv7 = sext i16 %a.addr.0 to i32
  %conv8 = sext i16 %product.0 to i32
  %xor = xor i32 %conv8, %conv7
  %conv9 = trunc i32 %xor to i16
  br label %if.end10

if.end10:                                         ; preds = %if.then6, %if.end
  %product.1 = phi i16 [ %conv9, %if.then6 ], [ %product.0, %if.end ]
  %conv11 = sext i16 %a.addr.0 to i32
  %shl = shl i32 %conv11, 1
  %conv12 = trunc i32 %shl to i16
  %conv13 = sext i16 %conv12 to i32
  %cmp14 = icmp sge i32 %conv13, 256
  br i1 %cmp14, label %if.then16, label %if.end21

if.then16:                                        ; preds = %if.end10
  %conv17 = sext i16 %gen to i32
  %conv18 = sext i16 %conv12 to i32
  %xor19 = xor i32 %conv18, %conv17
  %conv20 = trunc i32 %xor19 to i16
  br label %if.end21

if.end21:                                         ; preds = %if.then16, %if.end10
  %a.addr.1 = phi i16 [ %conv20, %if.then16 ], [ %conv12, %if.end10 ]
  %conv22 = sext i16 %b.addr.0 to i32
  %shr = ashr i32 %conv22, 1
  %conv23 = trunc i32 %shr to i16
  br label %for.inc

for.inc:                                          ; preds = %if.end21, %if.then
  %product.2 = phi i16 [ %product.0, %if.then ], [ %product.1, %if.end21 ]
  %b.addr.1 = phi i16 [ %b.addr.0, %if.then ], [ %conv23, %if.end21 ]
  %a.addr.2 = phi i16 [ %a.addr.0, %if.then ], [ %a.addr.1, %if.end21 ]
  %dec = add i16 %i.0, -1
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  ret i16 %product.0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local signext i16 @exp8(i16 noundef signext %base, i16 noundef signext %exponent, i16 noundef signext %gen) #0 {
entry:
  %conv = sext i16 %base to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end9, %if.end
  %accum.0 = phi i16 [ %base, %if.end ], [ %call12, %if.end9 ]
  %exponent.addr.0 = phi i16 [ %exponent, %if.end ], [ %conv11, %if.end9 ]
  %result.0 = phi i16 [ 1, %if.end ], [ %result.1, %if.end9 ]
  %conv2 = sext i16 %exponent.addr.0 to i32
  %cmp3 = icmp ne i32 %conv2, 0
  br i1 %cmp3, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %conv5 = sext i16 %exponent.addr.0 to i32
  %and = and i32 %conv5, 1
  %cmp6 = icmp eq i32 %and, 1
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %while.body
  %call = call signext i16 @mult8(i16 noundef signext %result.0, i16 noundef signext %accum.0, i16 noundef signext %gen)
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %while.body
  %result.1 = phi i16 [ %call, %if.then8 ], [ %result.0, %while.body ]
  %conv10 = sext i16 %exponent.addr.0 to i32
  %shr = ashr i32 %conv10, 1
  %conv11 = trunc i32 %shr to i16
  %call12 = call signext i16 @mult8(i16 noundef signext %accum.0, i16 noundef signext %accum.0, i16 noundef signext %gen)
  br label %while.cond, !llvm.loop !11

while.end:                                        ; preds = %while.cond
  br label %return

return:                                           ; preds = %while.end, %if.then
  %retval.0 = phi i16 [ 0, %if.then ], [ %result.0, %while.end ]
  ret i16 %retval.0
}

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
!11 = distinct !{!11, !7}

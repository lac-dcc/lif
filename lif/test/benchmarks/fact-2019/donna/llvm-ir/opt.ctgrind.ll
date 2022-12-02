; ModuleID = 'llvm-ir/base.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [21 x i8] c"lib/curve25519_c64.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.3 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"
@__const.main.basepoint = private unnamed_addr constant <{ i8, [31 x i8] }> <{ i8 9, [31 x i8] zeroinitializer }>, align 16

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly sspstrong uwtable willreturn
define dso_local i64 @load_limb(i8* nocapture noundef readonly %input) local_unnamed_addr #0 {
entry:
  %0 = load i8, i8* %input, align 1
  %conv = zext i8 %0 to i64
  %arrayidx1 = getelementptr inbounds i8, i8* %input, i64 1
  %1 = load i8, i8* %arrayidx1, align 1
  %conv2 = zext i8 %1 to i64
  %shl = shl nuw nsw i64 %conv2, 8
  %or = or i64 %shl, %conv
  %arrayidx3 = getelementptr inbounds i8, i8* %input, i64 2
  %2 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %2 to i64
  %shl5 = shl nuw nsw i64 %conv4, 16
  %or6 = or i64 %or, %shl5
  %arrayidx7 = getelementptr inbounds i8, i8* %input, i64 3
  %3 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %3 to i64
  %shl9 = shl nuw nsw i64 %conv8, 24
  %or10 = or i64 %or6, %shl9
  %arrayidx11 = getelementptr inbounds i8, i8* %input, i64 4
  %4 = load i8, i8* %arrayidx11, align 1
  %conv12 = zext i8 %4 to i64
  %shl13 = shl nuw nsw i64 %conv12, 32
  %or14 = or i64 %or10, %shl13
  %arrayidx15 = getelementptr inbounds i8, i8* %input, i64 5
  %5 = load i8, i8* %arrayidx15, align 1
  %conv16 = zext i8 %5 to i64
  %shl17 = shl nuw nsw i64 %conv16, 40
  %or18 = or i64 %or14, %shl17
  %arrayidx19 = getelementptr inbounds i8, i8* %input, i64 6
  %6 = load i8, i8* %arrayidx19, align 1
  %conv20 = zext i8 %6 to i64
  %shl21 = shl nuw nsw i64 %conv20, 48
  %or22 = or i64 %or18, %shl21
  %arrayidx23 = getelementptr inbounds i8, i8* %input, i64 7
  %7 = load i8, i8* %arrayidx23, align 1
  %conv24 = zext i8 %7 to i64
  %shl25 = shl nuw i64 %conv24, 56
  %or26 = or i64 %or22, %shl25
  ret i64 %or26
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define dso_local void @fexpand(i64* nocapture noundef writeonly %output, i8* nocapture noundef readonly %input) local_unnamed_addr #1 {
entry:
  %view = alloca i64, align 8
  %arraydecay = bitcast i64* %view to i8*
  %0 = bitcast i8* %input to i64*
  %1 = load i64, i64* %0, align 1
  store i64 %1, i64* %view, align 8
  %call = call i64 @load_limb(i8* noundef nonnull %arraydecay)
  %and = and i64 %call, 2251799813685247
  store i64 %and, i64* %output, align 8
  %arrayidx3 = getelementptr inbounds i8, i8* %input, i64 6
  %2 = bitcast i8* %arrayidx3 to i64*
  %3 = load i64, i64* %2, align 1
  store i64 %3, i64* %view, align 8
  %call5 = call i64 @load_limb(i8* noundef nonnull %arraydecay)
  %shr = lshr i64 %call5, 3
  %and6 = and i64 %shr, 2251799813685247
  %arrayidx7 = getelementptr inbounds i64, i64* %output, i64 1
  store i64 %and6, i64* %arrayidx7, align 8
  %arrayidx9 = getelementptr inbounds i8, i8* %input, i64 12
  %4 = bitcast i8* %arrayidx9 to i64*
  %5 = load i64, i64* %4, align 1
  store i64 %5, i64* %view, align 8
  %call11 = call i64 @load_limb(i8* noundef nonnull %arraydecay)
  %shr12 = lshr i64 %call11, 6
  %and13 = and i64 %shr12, 2251799813685247
  %arrayidx14 = getelementptr inbounds i64, i64* %output, i64 2
  store i64 %and13, i64* %arrayidx14, align 8
  %arrayidx16 = getelementptr inbounds i8, i8* %input, i64 19
  %6 = bitcast i8* %arrayidx16 to i64*
  %7 = load i64, i64* %6, align 1
  store i64 %7, i64* %view, align 8
  %call18 = call i64 @load_limb(i8* noundef nonnull %arraydecay)
  %shr19 = lshr i64 %call18, 1
  %and20 = and i64 %shr19, 2251799813685247
  %arrayidx21 = getelementptr inbounds i64, i64* %output, i64 3
  store i64 %and20, i64* %arrayidx21, align 8
  %arrayidx23 = getelementptr inbounds i8, i8* %input, i64 24
  %8 = bitcast i8* %arrayidx23 to i64*
  %9 = load i64, i64* %8, align 1
  store i64 %9, i64* %view, align 8
  %call25 = call i64 @load_limb(i8* noundef nonnull %arraydecay)
  %shr26 = lshr i64 %call25, 12
  %and27 = and i64 %shr26, 2251799813685247
  %arrayidx28 = getelementptr inbounds i64, i64* %output, i64 4
  store i64 %and27, i64* %arrayidx28, align 8
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define dso_local void @fsum(i64* nocapture noundef %output, i64* nocapture noundef readonly %input) local_unnamed_addr #1 {
entry:
  %0 = load i64, i64* %input, align 8
  %1 = load i64, i64* %output, align 8
  %add = add i64 %1, %0
  store i64 %add, i64* %output, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input, i64 1
  %2 = load i64, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %output, i64 1
  %3 = load i64, i64* %arrayidx3, align 8
  %add4 = add i64 %3, %2
  store i64 %add4, i64* %arrayidx3, align 8
  %arrayidx5 = getelementptr inbounds i64, i64* %input, i64 2
  %4 = load i64, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %output, i64 2
  %5 = load i64, i64* %arrayidx6, align 8
  %add7 = add i64 %5, %4
  store i64 %add7, i64* %arrayidx6, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %input, i64 3
  %6 = load i64, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds i64, i64* %output, i64 3
  %7 = load i64, i64* %arrayidx9, align 8
  %add10 = add i64 %7, %6
  store i64 %add10, i64* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds i64, i64* %input, i64 4
  %8 = load i64, i64* %arrayidx11, align 8
  %arrayidx12 = getelementptr inbounds i64, i64* %output, i64 4
  %9 = load i64, i64* %arrayidx12, align 8
  %add13 = add i64 %9, %8
  store i64 %add13, i64* %arrayidx12, align 8
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone sspstrong uwtable willreturn
define dso_local void @fdifference_backwards(i64* nocapture noundef %out, i64* nocapture noundef %input) local_unnamed_addr #3 {
entry:
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define dso_local void @fmul(i64* nocapture noundef writeonly %output, i64* nocapture noundef readonly %input2, i64* nocapture noundef readonly %input) local_unnamed_addr #1 {
entry:
  %0 = load i64, i64* %input, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %input, i64 1
  %1 = load i64, i64* %arrayidx1, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input, i64 2
  %2 = load i64, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %input, i64 3
  %3 = load i64, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %input, i64 4
  %4 = load i64, i64* %arrayidx4, align 8
  %5 = load i64, i64* %input2, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %input2, i64 1
  %6 = load i64, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds i64, i64* %input2, i64 2
  %7 = load i64, i64* %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %input2, i64 3
  %8 = load i64, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds i64, i64* %input2, i64 4
  %9 = load i64, i64* %arrayidx9, align 8
  %mul = mul i64 %5, %0
  %mul11 = mul i64 %6, %0
  %mul12 = mul i64 %5, %1
  %mul14 = mul i64 %7, %0
  %mul15 = mul i64 %5, %2
  %mul17 = mul i64 %6, %1
  %mul20 = mul i64 %8, %0
  %mul21 = mul i64 %5, %3
  %mul23 = mul i64 %7, %1
  %mul25 = mul i64 %6, %2
  %mul28 = mul i64 %9, %0
  %mul29 = mul i64 %5, %4
  %mul31 = mul i64 %6, %3
  %mul33 = mul i64 %8, %1
  %mul35 = mul i64 %7, %2
  %mul38 = mul i64 %4, 19
  %mul39 = mul i64 %1, 19
  %mul40 = mul i64 %2, 19
  %mul41 = mul i64 %3, 19
  %mul42 = mul i64 %6, %mul38
  %mul43 = mul i64 %mul39, %9
  %mul45 = mul i64 %8, %mul40
  %mul47 = mul i64 %7, %mul41
  %add44 = add i64 %mul42, %mul
  %add46 = add i64 %add44, %mul47
  %add48 = add i64 %add46, %mul45
  %add50 = add i64 %add48, %mul43
  %mul51 = mul i64 %7, %mul38
  %mul52 = mul i64 %9, %mul40
  %mul54 = mul i64 %8, %mul41
  %mul58 = mul i64 %8, %mul38
  %mul59 = mul i64 %9, %mul41
  %mul63 = mul i64 %9, %mul38
  %and = and i64 %add50, 2251799813685247
  %shr = lshr i64 %add50, 51
  %add53 = add i64 %mul11, %mul12
  %add55 = add i64 %add53, %mul51
  %add = add i64 %add55, %mul54
  %add57 = add i64 %add, %mul52
  %add69 = add i64 %add57, %shr
  %and71 = and i64 %add69, 2251799813685247
  %shr73 = lshr i64 %add69, 51
  %add60 = add i64 %mul17, %mul15
  %add16 = add i64 %add60, %mul14
  %add18 = add i64 %add16, %mul58
  %add62 = add i64 %add18, %mul59
  %add75 = add i64 %add62, %shr73
  %and77 = and i64 %add75, 2251799813685247
  %shr79 = lshr i64 %add75, 51
  %add22 = add i64 %mul25, %mul21
  %add24 = add i64 %add22, %mul23
  %add26 = add i64 %add24, %mul20
  %add65 = add i64 %add26, %mul63
  %add81 = add i64 %add65, %shr79
  %and83 = and i64 %add81, 2251799813685247
  %shr85 = lshr i64 %add81, 51
  %add30 = add i64 %mul31, %mul29
  %add32 = add i64 %add30, %mul35
  %add34 = add i64 %add32, %mul33
  %add36 = add i64 %add34, %mul28
  %add87 = add i64 %add36, %shr85
  %and89 = and i64 %add87, 2251799813685247
  %shr91 = lshr i64 %add87, 51
  %mul92 = mul nuw nsw i64 %shr91, 19
  %add93 = add nuw nsw i64 %mul92, %and
  %shr94 = lshr i64 %add93, 51
  %and95 = and i64 %add93, 2251799813685247
  %add96 = add nuw nsw i64 %shr94, %and71
  %shr97 = lshr i64 %add96, 51
  %and98 = and i64 %add96, 2251799813685247
  %add99 = add nuw nsw i64 %shr97, %and77
  store i64 %and95, i64* %output, align 8
  %arrayidx101 = getelementptr inbounds i64, i64* %output, i64 1
  store i64 %and98, i64* %arrayidx101, align 8
  %arrayidx102 = getelementptr inbounds i64, i64* %output, i64 2
  store i64 %add99, i64* %arrayidx102, align 8
  %arrayidx103 = getelementptr inbounds i64, i64* %output, i64 3
  store i64 %and83, i64* %arrayidx103, align 8
  %arrayidx104 = getelementptr inbounds i64, i64* %output, i64 4
  store i64 %and89, i64* %arrayidx104, align 8
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @fsquare_times(i64* nocapture noundef writeonly %output, i64* nocapture noundef readonly %input, i64 noundef %count) local_unnamed_addr #5 {
entry:
  %0 = load i64, i64* %input, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %input, i64 1
  %1 = load i64, i64* %arrayidx1, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input, i64 2
  %2 = load i64, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %input, i64 3
  %3 = load i64, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %input, i64 4
  %4 = load i64, i64* %arrayidx4, align 8
  %cmp17.not = icmp eq i64 %count, 0
  br i1 %cmp17.not, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.023 = phi i64 [ %inc, %for.body ], [ 0, %entry ]
  %r0.022 = phi i64 [ %and69, %for.body ], [ %0, %entry ]
  %r1.021 = phi i64 [ %and72, %for.body ], [ %1, %entry ]
  %r2.020 = phi i64 [ %add73, %for.body ], [ %2, %entry ]
  %r3.019 = phi i64 [ %and57, %for.body ], [ %3, %entry ]
  %r4.018 = phi i64 [ %and63, %for.body ], [ %4, %entry ]
  %mul = shl i64 %r0.022, 1
  %mul5 = shl i64 %r1.021, 1
  %mul8 = mul i64 %r4.018, 19
  %mul9 = mul i64 %r4.018, 38
  %mul10 = mul i64 %r0.022, %r0.022
  %mul11 = mul i64 %r1.021, %mul9
  %mul7 = mul i64 %r3.019, 38
  %mul12 = mul i64 %mul7, %r2.020
  %add = add i64 %mul12, %mul11
  %add13 = add i64 %add, %mul10
  %mul15 = mul i64 %mul, %r1.021
  %mul16 = mul i64 %r2.020, %mul9
  %mul18 = mul i64 %r3.019, 19
  %mul19 = mul i64 %mul18, %r3.019
  %mul22 = mul i64 %mul, %r2.020
  %mul23 = mul i64 %r1.021, %r1.021
  %mul25 = mul i64 %mul9, %r3.019
  %mul28 = mul i64 %mul, %r3.019
  %mul29 = mul i64 %mul5, %r2.020
  %mul31 = mul i64 %mul8, %r4.018
  %mul34 = mul i64 %mul, %r4.018
  %mul35 = mul i64 %mul5, %r3.019
  %mul37 = mul i64 %r2.020, %r2.020
  %and = and i64 %add13, 2251799813685247
  %shr = lshr i64 %add13, 51
  %add17 = add i64 %mul19, %mul16
  %add20 = add i64 %add17, %mul15
  %add43 = add i64 %add20, %shr
  %and45 = and i64 %add43, 2251799813685247
  %shr47 = lshr i64 %add43, 51
  %add24 = add i64 %mul23, %mul25
  %add26 = add i64 %add24, %mul22
  %add49 = add i64 %add26, %shr47
  %and51 = and i64 %add49, 2251799813685247
  %shr53 = lshr i64 %add49, 51
  %add30 = add i64 %mul29, %mul31
  %add32 = add i64 %add30, %mul28
  %add55 = add i64 %add32, %shr53
  %and57 = and i64 %add55, 2251799813685247
  %shr59 = lshr i64 %add55, 51
  %add36 = add i64 %mul35, %mul37
  %add38 = add i64 %add36, %mul34
  %add61 = add i64 %add38, %shr59
  %and63 = and i64 %add61, 2251799813685247
  %shr65 = lshr i64 %add61, 51
  %mul66 = mul nuw nsw i64 %shr65, 19
  %add67 = add nuw nsw i64 %mul66, %and
  %shr68 = lshr i64 %add67, 51
  %and69 = and i64 %add67, 2251799813685247
  %add70 = add nuw nsw i64 %shr68, %and45
  %shr71 = lshr i64 %add70, 51
  %and72 = and i64 %add70, 2251799813685247
  %add73 = add nuw nsw i64 %shr71, %and51
  %inc = add nuw i64 %i.023, 1
  %exitcond.not = icmp eq i64 %inc, %count
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !6

for.end:                                          ; preds = %for.body, %entry
  %r4.0.lcssa = phi i64 [ %4, %entry ], [ %and63, %for.body ]
  %r3.0.lcssa = phi i64 [ %3, %entry ], [ %and57, %for.body ]
  %r2.0.lcssa = phi i64 [ %2, %entry ], [ %add73, %for.body ]
  %r1.0.lcssa = phi i64 [ %1, %entry ], [ %and72, %for.body ]
  %r0.0.lcssa = phi i64 [ %0, %entry ], [ %and69, %for.body ]
  store i64 %r0.0.lcssa, i64* %output, align 8
  %arrayidx75 = getelementptr inbounds i64, i64* %output, i64 1
  store i64 %r1.0.lcssa, i64* %arrayidx75, align 8
  %arrayidx76 = getelementptr inbounds i64, i64* %output, i64 2
  store i64 %r2.0.lcssa, i64* %arrayidx76, align 8
  %arrayidx77 = getelementptr inbounds i64, i64* %output, i64 3
  store i64 %r3.0.lcssa, i64* %arrayidx77, align 8
  %arrayidx78 = getelementptr inbounds i64, i64* %output, i64 4
  store i64 %r4.0.lcssa, i64* %arrayidx78, align 8
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define dso_local void @fscalar_product(i64* nocapture noundef %output, i64* nocapture noundef readonly %input, i64 noundef %scalar) local_unnamed_addr #1 {
entry:
  %0 = load i64, i64* %input, align 8
  %mul = mul i64 %0, %scalar
  %and = and i64 %mul, 2251799813685247
  store i64 %and, i64* %output, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input, i64 1
  %1 = load i64, i64* %arrayidx2, align 8
  %mul3 = mul i64 %1, %scalar
  %shr = lshr i64 %mul, 51
  %add = add i64 %mul3, %shr
  %and4 = and i64 %add, 2251799813685247
  %arrayidx5 = getelementptr inbounds i64, i64* %output, i64 1
  store i64 %and4, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %input, i64 2
  %2 = load i64, i64* %arrayidx6, align 8
  %mul7 = mul i64 %2, %scalar
  %shr8 = lshr i64 %add, 51
  %add9 = add i64 %mul7, %shr8
  %and10 = and i64 %add9, 2251799813685247
  %arrayidx11 = getelementptr inbounds i64, i64* %output, i64 2
  store i64 %and10, i64* %arrayidx11, align 8
  %arrayidx12 = getelementptr inbounds i64, i64* %input, i64 3
  %3 = load i64, i64* %arrayidx12, align 8
  %mul13 = mul i64 %3, %scalar
  %shr14 = lshr i64 %add9, 51
  %add15 = add i64 %mul13, %shr14
  %and16 = and i64 %add15, 2251799813685247
  %arrayidx17 = getelementptr inbounds i64, i64* %output, i64 3
  store i64 %and16, i64* %arrayidx17, align 8
  %arrayidx18 = getelementptr inbounds i64, i64* %input, i64 4
  %4 = load i64, i64* %arrayidx18, align 8
  %mul19 = mul i64 %4, %scalar
  %shr20 = lshr i64 %add15, 51
  %add21 = add i64 %mul19, %shr20
  %and22 = and i64 %add21, 2251799813685247
  %arrayidx23 = getelementptr inbounds i64, i64* %output, i64 4
  store i64 %and22, i64* %arrayidx23, align 8
  %shr24 = lshr i64 %add21, 51
  %mul25 = mul nuw nsw i64 %shr24, 19
  %add27 = add nuw nsw i64 %mul25, %and
  store i64 %add27, i64* %output, align 8
  ret void
}

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
define dso_local void @fmonty(i64* nocapture noundef writeonly %x2, i64* nocapture noundef writeonly %z2, i64* nocapture noundef writeonly %x3, i64* nocapture noundef writeonly %z3, i64* nocapture noundef %x, i64* nocapture noundef readonly %z, i64* nocapture noundef %xprime, i64* nocapture noundef readonly %zprime, i64* nocapture noundef readonly %qmqp) local_unnamed_addr #6 {
entry:
  %zzz = alloca [5 x i64], align 16
  %xx = alloca [5 x i64], align 16
  %zz = alloca [5 x i64], align 16
  %xxprime = alloca [5 x i64], align 16
  %zzprime = alloca [5 x i64], align 16
  %zzzprime = alloca [5 x i64], align 16
  %0 = bitcast [5 x i64]* %zzz to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %0, i8 0, i64 40, i1 false)
  %1 = bitcast [5 x i64]* %xx to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %1, i8 0, i64 40, i1 false)
  %2 = bitcast [5 x i64]* %zz to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %2, i8 0, i64 40, i1 false)
  %3 = bitcast [5 x i64]* %xxprime to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %3, i8 0, i64 40, i1 false)
  %4 = bitcast [5 x i64]* %zzprime to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %4, i8 0, i64 40, i1 false)
  %5 = bitcast [5 x i64]* %zzzprime to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %5, i8 0, i64 40, i1 false)
  tail call void @fsum(i64* noundef %x, i64* noundef %z)
  tail call void @fsum(i64* noundef %xprime, i64* noundef %zprime)
  %arraydecay4 = getelementptr inbounds [5 x i64], [5 x i64]* %xxprime, i64 0, i64 0
  call void @fmul(i64* noundef nonnull %arraydecay4, i64* noundef %xprime, i64* noundef %z)
  %arraydecay5 = getelementptr inbounds [5 x i64], [5 x i64]* %zzprime, i64 0, i64 0
  call void @fmul(i64* noundef nonnull %arraydecay5, i64* noundef %x, i64* noundef %zprime)
  call void @fsum(i64* noundef nonnull %arraydecay4, i64* noundef nonnull %arraydecay5)
  call void @fsquare_times(i64* noundef %x3, i64* noundef nonnull %arraydecay4, i64 noundef 1)
  %arraydecay13 = getelementptr inbounds [5 x i64], [5 x i64]* %zzzprime, i64 0, i64 0
  call void @fsquare_times(i64* noundef nonnull %arraydecay13, i64* noundef nonnull %arraydecay5, i64 noundef 1)
  call void @fmul(i64* noundef %z3, i64* noundef nonnull %arraydecay13, i64* noundef %qmqp)
  %arraydecay16 = getelementptr inbounds [5 x i64], [5 x i64]* %xx, i64 0, i64 0
  call void @fsquare_times(i64* noundef nonnull %arraydecay16, i64* noundef %x, i64 noundef 1)
  %arraydecay17 = getelementptr inbounds [5 x i64], [5 x i64]* %zz, i64 0, i64 0
  call void @fsquare_times(i64* noundef nonnull %arraydecay17, i64* noundef %z, i64 noundef 1)
  call void @fmul(i64* noundef %x2, i64* noundef nonnull %arraydecay16, i64* noundef nonnull %arraydecay17)
  %arraydecay22 = getelementptr inbounds [5 x i64], [5 x i64]* %zzz, i64 0, i64 0
  call void @fscalar_product(i64* noundef nonnull %arraydecay22, i64* noundef nonnull %arraydecay17, i64 noundef 121665)
  call void @fsum(i64* noundef nonnull %arraydecay22, i64* noundef nonnull %arraydecay16)
  call void @fmul(i64* noundef %z2, i64* noundef nonnull %arraydecay17, i64* noundef nonnull %arraydecay22)
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @swap_conditional(i64* nocapture noundef %a, i64* nocapture noundef %b, i64 noundef %swapi) local_unnamed_addr #5 {
entry:
  %cmp = icmp eq i64 %swapi, 1
  br i1 %cmp, label %for.body, label %if.end

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i64, i64* %a, i64 %indvars.iv
  %0 = load i64, i64* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %b, i64 %indvars.iv
  %1 = load i64, i64* %arrayidx3, align 8
  store i64 %1, i64* %arrayidx, align 8
  store i64 %0, i64* %arrayidx3, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 5
  br i1 %exitcond.not, label %if.end, label %for.body, !llvm.loop !8

if.end:                                           ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
define dso_local void @cmult(i64* nocapture noundef writeonly %resultx, i64* nocapture noundef writeonly %resultz, i8* nocapture noundef readonly %n, i64* nocapture noundef readonly %q) local_unnamed_addr #6 {
entry:
  %q7 = bitcast i64* %q to i8*
  %a = alloca [5 x i64], align 16
  %a6 = bitcast [5 x i64]* %a to i8*
  %b = alloca [5 x i64], align 16
  %c = alloca [5 x i64], align 16
  %d = alloca [5 x i64], align 16
  %e = alloca [5 x i64], align 16
  %f = alloca [5 x i64], align 16
  %g = alloca [5 x i64], align 16
  %h = alloca [5 x i64], align 16
  %0 = bitcast [5 x i64]* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %0, i8 0, i64 40, i1 false)
  %1 = bitcast [5 x i64]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %1, i8 0, i64 40, i1 false)
  %2 = bitcast [5 x i64]* %d to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %2, i8 0, i64 40, i1 false)
  %3 = bitcast [5 x i64]* %e to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %3, i8 0, i64 40, i1 false)
  %4 = bitcast [5 x i64]* %f to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %4, i8 0, i64 40, i1 false)
  %5 = bitcast [5 x i64]* %g to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %5, i8 0, i64 40, i1 false)
  %6 = bitcast [5 x i64]* %h to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %6, i8 0, i64 40, i1 false)
  %arrayidx = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  store i64 1, i64* %arrayidx, align 16
  %arrayidx1 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  store i64 1, i64* %arrayidx1, align 16
  %arrayidx2 = getelementptr inbounds [5 x i64], [5 x i64]* %f, i64 0, i64 0
  store i64 1, i64* %arrayidx2, align 16
  %arrayidx3 = getelementptr inbounds [5 x i64], [5 x i64]* %h, i64 0, i64 0
  store i64 1, i64* %arrayidx3, align 16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %a6, i8* noundef nonnull align 8 dereferenceable(40) %q7, i64 40, i1 false)
  %arraydecay34 = getelementptr inbounds [5 x i64], [5 x i64]* %g, i64 0, i64 0
  %arraydecay35 = getelementptr inbounds [5 x i64], [5 x i64]* %e, i64 0, i64 0
  %arraydecay39 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 0
  %arraydecay40 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  br label %for.body10

for.body10:                                       ; preds = %entry, %for.inc55
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc55 ]
  %7 = sub nuw nsw i64 31, %indvars.iv
  %arrayidx12 = getelementptr inbounds i8, i8* %n, i64 %7
  %8 = load i8, i8* %arrayidx12, align 1
  br label %for.body15

for.body15:                                       ; preds = %for.body10, %if.end
  %j.03 = phi i32 [ 0, %for.body10 ], [ %inc53, %if.end ]
  %byte.02 = phi i8 [ %8, %for.body10 ], [ %shl, %if.end ]
  %9 = lshr i8 %byte.02, 7
  %10 = zext i8 %9 to i64
  %and = and i32 %j.03, 1
  %cmp17 = icmp eq i32 %and, 0
  br i1 %cmp17, label %if.then, label %if.else

if.then:                                          ; preds = %for.body15
  call void @swap_conditional(i64* noundef nonnull %arrayidx1, i64* noundef nonnull %arraydecay40, i64 noundef %10)
  call void @swap_conditional(i64* noundef nonnull %arraydecay39, i64* noundef nonnull %arrayidx, i64 noundef %10)
  call void @fmonty(i64* noundef nonnull %arraydecay34, i64* noundef nonnull %arrayidx3, i64* noundef nonnull %arraydecay35, i64* noundef nonnull %arrayidx2, i64* noundef nonnull %arrayidx1, i64* noundef nonnull %arraydecay39, i64* noundef nonnull %arraydecay40, i64* noundef nonnull %arrayidx, i64* noundef %q)
  call void @swap_conditional(i64* noundef nonnull %arraydecay34, i64* noundef nonnull %arraydecay35, i64 noundef %10)
  call void @swap_conditional(i64* noundef nonnull %arrayidx3, i64* noundef nonnull %arrayidx2, i64 noundef %10)
  br label %if.end

if.else:                                          ; preds = %for.body15
  call void @swap_conditional(i64* noundef nonnull %arraydecay34, i64* noundef nonnull %arraydecay35, i64 noundef %10)
  call void @swap_conditional(i64* noundef nonnull %arrayidx3, i64* noundef nonnull %arrayidx2, i64 noundef %10)
  call void @fmonty(i64* noundef nonnull %arrayidx1, i64* noundef nonnull %arraydecay39, i64* noundef nonnull %arraydecay40, i64* noundef nonnull %arrayidx, i64* noundef nonnull %arraydecay34, i64* noundef nonnull %arrayidx3, i64* noundef nonnull %arraydecay35, i64* noundef nonnull %arrayidx2, i64* noundef %q)
  call void @swap_conditional(i64* noundef nonnull %arrayidx1, i64* noundef nonnull %arraydecay40, i64 noundef %10)
  call void @swap_conditional(i64* noundef nonnull %arraydecay39, i64* noundef nonnull %arrayidx, i64 noundef %10)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %shl = shl i8 %byte.02, 1
  %inc53 = add nuw nsw i32 %j.03, 1
  %exitcond.not = icmp eq i32 %inc53, 8
  br i1 %exitcond.not, label %for.inc55, label %for.body15, !llvm.loop !9

for.inc55:                                        ; preds = %if.end
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond11.not = icmp eq i64 %indvars.iv.next, 32
  br i1 %exitcond11.not, label %for.body62, label %for.body10, !llvm.loop !10

for.body62:                                       ; preds = %for.inc55, %for.body62
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.body62 ], [ 0, %for.inc55 ]
  %arrayidx64 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 %indvars.iv14
  %11 = load i64, i64* %arrayidx64, align 8
  %arrayidx66 = getelementptr inbounds i64, i64* %resultx, i64 %indvars.iv14
  store i64 %11, i64* %arrayidx66, align 8
  %arrayidx68 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 %indvars.iv14
  %12 = load i64, i64* %arrayidx68, align 8
  %arrayidx70 = getelementptr inbounds i64, i64* %resultz, i64 %indvars.iv14
  store i64 %12, i64* %arrayidx70, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17.not = icmp eq i64 %indvars.iv.next15, 5
  br i1 %exitcond17.not, label %for.end73, label %for.body62, !llvm.loop !11

for.end73:                                        ; preds = %for.body62
  ret void
}

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
define dso_local void @crecip(i64* nocapture noundef writeonly %out, i64* nocapture noundef readonly %z) local_unnamed_addr #6 {
entry:
  %a = alloca [5 x i64], align 16
  %t0 = alloca [5 x i64], align 16
  %b = alloca [5 x i64], align 16
  %c = alloca [5 x i64], align 16
  %0 = bitcast [5 x i64]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %0, i8 0, i64 40, i1 false)
  %1 = bitcast [5 x i64]* %t0 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %1, i8 0, i64 40, i1 false)
  %2 = bitcast [5 x i64]* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %2, i8 0, i64 40, i1 false)
  %3 = bitcast [5 x i64]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %3, i8 0, i64 40, i1 false)
  %arraydecay = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  call void @fsquare_times(i64* noundef nonnull %arraydecay, i64* noundef %z, i64 noundef 1)
  %arraydecay1 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  call void @fsquare_times(i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay, i64 noundef 2)
  %arraydecay3 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  call void @fmul(i64* noundef nonnull %arraydecay3, i64* noundef nonnull %arraydecay1, i64* noundef %z)
  call void @fmul(i64* noundef nonnull %arraydecay, i64* noundef nonnull %arraydecay3, i64* noundef nonnull %arraydecay)
  call void @fsquare_times(i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay, i64 noundef 1)
  call void @fmul(i64* noundef nonnull %arraydecay3, i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay3)
  call void @fsquare_times(i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay3, i64 noundef 5)
  call void @fmul(i64* noundef nonnull %arraydecay3, i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay3)
  call void @fsquare_times(i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay3, i64 noundef 10)
  %arraydecay20 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  call void @fmul(i64* noundef nonnull %arraydecay20, i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay3)
  call void @fsquare_times(i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay20, i64 noundef 20)
  call void @fmul(i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay20)
  call void @fsquare_times(i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay1, i64 noundef 10)
  call void @fmul(i64* noundef nonnull %arraydecay3, i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay3)
  call void @fsquare_times(i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay3, i64 noundef 50)
  call void @fmul(i64* noundef nonnull %arraydecay20, i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay3)
  call void @fsquare_times(i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay20, i64 noundef 100)
  call void @fmul(i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay20)
  call void @fsquare_times(i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay1, i64 noundef 50)
  call void @fmul(i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay3)
  call void @fsquare_times(i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay1, i64 noundef 5)
  call void @fmul(i64* noundef %out, i64* noundef nonnull %arraydecay1, i64* noundef nonnull %arraydecay)
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn writeonly
define dso_local void @store_limb(i8* nocapture noundef writeonly %out, i64 noundef %input) local_unnamed_addr #7 {
entry:
  %conv = trunc i64 %input to i8
  store i8 %conv, i8* %out, align 1
  %shr = lshr i64 %input, 8
  %conv2 = trunc i64 %shr to i8
  %arrayidx3 = getelementptr inbounds i8, i8* %out, i64 1
  store i8 %conv2, i8* %arrayidx3, align 1
  %shr4 = lshr i64 %input, 16
  %conv6 = trunc i64 %shr4 to i8
  %arrayidx7 = getelementptr inbounds i8, i8* %out, i64 2
  store i8 %conv6, i8* %arrayidx7, align 1
  %shr8 = lshr i64 %input, 24
  %conv10 = trunc i64 %shr8 to i8
  %arrayidx11 = getelementptr inbounds i8, i8* %out, i64 3
  store i8 %conv10, i8* %arrayidx11, align 1
  %shr12 = lshr i64 %input, 32
  %conv14 = trunc i64 %shr12 to i8
  %arrayidx15 = getelementptr inbounds i8, i8* %out, i64 4
  store i8 %conv14, i8* %arrayidx15, align 1
  %shr16 = lshr i64 %input, 40
  %conv18 = trunc i64 %shr16 to i8
  %arrayidx19 = getelementptr inbounds i8, i8* %out, i64 5
  store i8 %conv18, i8* %arrayidx19, align 1
  %shr20 = lshr i64 %input, 48
  %conv22 = trunc i64 %shr20 to i8
  %arrayidx23 = getelementptr inbounds i8, i8* %out, i64 6
  store i8 %conv22, i8* %arrayidx23, align 1
  %shr24 = lshr i64 %input, 56
  %conv26 = trunc i64 %shr24 to i8
  %arrayidx27 = getelementptr inbounds i8, i8* %out, i64 7
  store i8 %conv26, i8* %arrayidx27, align 1
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define dso_local void @fcontract(i8* nocapture readnone %output, i64* nocapture noundef readonly %input) local_unnamed_addr #1 {
entry:
  %view = alloca i64, align 8
  %0 = load i64, i64* %input, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input, i64 1
  %1 = load i64, i64* %arrayidx2, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %input, i64 2
  %2 = load i64, i64* %arrayidx4, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %input, i64 3
  %3 = load i64, i64* %arrayidx6, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %input, i64 4
  %4 = load i64, i64* %arrayidx8, align 8
  %shr = lshr i64 %0, 51
  %add = add i64 %1, %shr
  %and = and i64 %0, 2251799813685247
  %shr14 = lshr i64 %add, 51
  %add16 = add i64 %shr14, %2
  %and18 = and i64 %add, 2251799813685247
  %shr20 = lshr i64 %add16, 51
  %add22 = add i64 %shr20, %3
  %and24 = and i64 %add16, 2251799813685247
  %shr26 = lshr i64 %add22, 51
  %add28 = add i64 %shr26, %4
  %and30 = and i64 %add22, 2251799813685247
  %shr32 = lshr i64 %add28, 51
  %mul = mul nuw nsw i64 %shr32, 19
  %add34 = add nuw nsw i64 %mul, %and
  %and36 = and i64 %add28, 2251799813685247
  %shr38 = lshr i64 %add34, 51
  %add40 = add nuw nsw i64 %shr38, %and18
  %and42 = and i64 %add34, 2251799813685247
  %shr44 = lshr i64 %add40, 51
  %add46 = add nuw nsw i64 %shr44, %and24
  %and48 = and i64 %add40, 2251799813685247
  %shr50 = lshr i64 %add46, 51
  %add52 = add nuw nsw i64 %shr50, %and30
  %and54 = and i64 %add46, 2251799813685247
  %shr56 = lshr i64 %add52, 51
  %add58 = add nuw nsw i64 %shr56, %and36
  %and60 = and i64 %add52, 2251799813685247
  %shr62 = lshr i64 %add58, 51
  %mul63 = mul nuw nsw i64 %shr62, 19
  %and67 = and i64 %add58, 2251799813685247
  %add65 = add nuw nsw i64 %and42, 19
  %add69 = add nuw nsw i64 %add65, %mul63
  %shr71 = lshr i64 %add69, 51
  %add73 = add nuw nsw i64 %shr71, %and48
  %and75 = and i64 %add69, 2251799813685247
  %shr77 = lshr i64 %add73, 51
  %add79 = add nuw nsw i64 %shr77, %and54
  %and81 = and i64 %add73, 2251799813685247
  %shr83 = lshr i64 %add79, 51
  %add85 = add nuw nsw i64 %shr83, %and60
  %and87 = and i64 %add79, 2251799813685247
  %shr89 = lshr i64 %add85, 51
  %add91 = add nuw nsw i64 %shr89, %and67
  %and93 = and i64 %add85, 2251799813685247
  %shr95 = lshr i64 %add91, 51
  %mul96 = mul nuw nsw i64 %shr95, 19
  %add98 = add nuw nsw i64 %and75, 2251799813685229
  %add102 = add nuw nsw i64 %add98, %mul96
  %add104 = add nuw nsw i64 %and81, 2251799813685247
  %add106 = add nuw nsw i64 %and87, 2251799813685247
  %add108 = add nuw nsw i64 %and93, 2251799813685247
  %add110 = add nuw nsw i64 %add91, 2251799813685247
  %shr112 = lshr i64 %add102, 51
  %add114 = add nuw nsw i64 %add104, %shr112
  %and116 = and i64 %add102, 2251799813685247
  %shr118 = lshr i64 %add114, 51
  %add120 = add nuw nsw i64 %add106, %shr118
  %shr124 = lshr i64 %add120, 51
  %add126 = add nuw nsw i64 %add108, %shr124
  %shr130 = lshr i64 %add126, 51
  %add132 = add nuw nsw i64 %add110, %shr130
  %arraydecay = bitcast i64* %view to i8*
  %shl = shl i64 %add114, 51
  %or = or i64 %shl, %and116
  call void @store_limb(i8* noundef nonnull %arraydecay, i64 noundef %or)
  %and122 = lshr i64 %add114, 13
  %shr144 = and i64 %and122, 274877906943
  %shl146 = shl i64 %add120, 38
  %or147 = or i64 %shl146, %shr144
  call void @store_limb(i8* noundef nonnull %arraydecay, i64 noundef %or147)
  %and128 = lshr i64 %add120, 26
  %shr152 = and i64 %and128, 33554431
  %shl154 = shl i64 %add126, 25
  %or155 = or i64 %shl154, %shr152
  call void @store_limb(i8* noundef nonnull %arraydecay, i64 noundef %or155)
  %and134 = lshr i64 %add126, 39
  %shr160 = and i64 %and134, 4095
  %and136 = shl i64 %add132, 12
  %shl162 = and i64 %and136, 9223372036854771712
  %or163 = or i64 %shl162, %shr160
  call void @store_limb(i8* noundef nonnull %arraydecay, i64 noundef %or163)
  ret void
}

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
define dso_local i32 @curve25519_donna(i8* nocapture readnone %mypublic, i8* nocapture noundef readonly %_secret, i8* nocapture noundef readonly %basepoint) local_unnamed_addr #6 {
entry:
  %bp = alloca [5 x i64], align 16
  %x = alloca [5 x i64], align 16
  %z = alloca [5 x i64], align 16
  %zmone = alloca [5 x i64], align 16
  %e = alloca [32 x i8], align 16
  %0 = bitcast [5 x i64]* %bp to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %0, i8 0, i64 40, i1 false)
  %1 = bitcast [5 x i64]* %x to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %1, i8 0, i64 40, i1 false)
  %2 = bitcast [5 x i64]* %z to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %2, i8 0, i64 40, i1 false)
  %3 = bitcast [5 x i64]* %zmone to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %3, i8 0, i64 40, i1 false)
  %e1 = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %e1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), i32 503, i8* null)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %e1, i8* noundef nonnull align 1 dereferenceable(32) %_secret, i64 32, i1 false)
  %4 = load i8, i8* %e1, align 16
  %5 = and i8 %4, -8
  store i8 %5, i8* %e1, align 16
  %arrayidx3 = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 31
  %6 = load i8, i8* %arrayidx3, align 1
  %7 = and i8 %6, 63
  %8 = or i8 %7, 64
  store i8 %8, i8* %arrayidx3, align 1
  %arraydecay10 = getelementptr inbounds [5 x i64], [5 x i64]* %bp, i64 0, i64 0
  call void @fexpand(i64* noundef nonnull %arraydecay10, i8* noundef %basepoint)
  %arraydecay11 = getelementptr inbounds [5 x i64], [5 x i64]* %x, i64 0, i64 0
  %arraydecay12 = getelementptr inbounds [5 x i64], [5 x i64]* %z, i64 0, i64 0
  call void @cmult(i64* noundef nonnull %arraydecay11, i64* noundef nonnull %arraydecay12, i8* noundef nonnull %e1, i64* noundef nonnull %arraydecay10)
  %arraydecay15 = getelementptr inbounds [5 x i64], [5 x i64]* %zmone, i64 0, i64 0
  call void @crecip(i64* noundef nonnull %arraydecay15, i64* noundef nonnull %arraydecay12)
  call void @fmul(i64* noundef nonnull %arraydecay12, i64* noundef nonnull %arraydecay11, i64* noundef nonnull %arraydecay15)
  call void @fcontract(i8* undef, i64* noundef nonnull %arraydecay12)
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #8

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #9 {
entry:
  %data = alloca [32 x i8], align 16
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %ret = alloca i8, align 1
  %basepoint = alloca [32 x i8], align 16
  %data1 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %data1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.3, i64 0, i64 0), i32 19, i8* null)
  %call = call i64 @read(i32 noundef 0, i8* noundef nonnull %data1, i64 noundef 32) #11
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %0 = ptrtoint [32 x i8]* %data to i64
  %arrayidx3 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %0, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 32, i64* %arrayidx4, align 16
  %arrayidx5 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx6, align 16
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx7, align 8
  %1 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx, i64 0) #11, !srcloc !12
  store volatile i64 %1, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  %2 = getelementptr inbounds [32 x i8], [32 x i8]* %basepoint, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %2, i8* noundef nonnull align 16 dereferenceable(32) getelementptr inbounds (<{ i8, [31 x i8] }>, <{ i8, [31 x i8] }>* @__const.main.basepoint, i64 0, i32 0), i64 32, i1 false)
  %call12 = call i32 @curve25519_donna(i8* undef, i8* noundef nonnull %data1, i8* noundef nonnull %2)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %data1, i8 0, i64 32, i1 false)
  store i8 0, i8* %ret, align 1
  %call18 = call i64 @write(i32 noundef 1, i8* noundef nonnull %ret, i64 noundef 1) #11
  ret i32 0
}

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #10

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #10

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind readonly sspstrong uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { mustprogress nofree noinline norecurse nosync nounwind readnone sspstrong uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { nofree noinline norecurse nosync nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree noinline nosync nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn writeonly "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #9 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = !{i64 2148207953, i64 2148207989, i64 2148208057}

; ModuleID = 'llvm-ir/lif.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%i8ptr.wrapped.ty = type { i8*, i64 }
%i64ptr.wrapped.ty = type { i64*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [21 x i8] c"lib/curve25519_c64.c\00", section "llvm.metadata"
@.str.2 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.3 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"
@__const.main.basepoint = private unnamed_addr constant <{ i8, [31 x i8] }> <{ i8 9, [31 x i8] zeroinitializer }>, align 16

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readonly sspstrong uwtable willreturn
define dso_local i64 @load_limb(%i8ptr.wrapped.ty* nocapture noundef readonly %input) local_unnamed_addr #0 {
entry:
  %0 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %input, i64 0, i32 0
  %input.unwrapped = load i8*, i8** %0, align 8
  %1 = load i8, i8* %input.unwrapped, align 1
  %conv = zext i8 %1 to i64
  %arrayidx1 = getelementptr inbounds i8, i8* %input.unwrapped, i64 1
  %2 = load i8, i8* %arrayidx1, align 1
  %conv2 = zext i8 %2 to i64
  %shl = shl nuw nsw i64 %conv2, 8
  %or = or i64 %shl, %conv
  %arrayidx3 = getelementptr inbounds i8, i8* %input.unwrapped, i64 2
  %3 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %3 to i64
  %shl5 = shl nuw nsw i64 %conv4, 16
  %or6 = or i64 %or, %shl5
  %arrayidx7 = getelementptr inbounds i8, i8* %input.unwrapped, i64 3
  %4 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %4 to i64
  %shl9 = shl nuw nsw i64 %conv8, 24
  %or10 = or i64 %or6, %shl9
  %arrayidx11 = getelementptr inbounds i8, i8* %input.unwrapped, i64 4
  %5 = load i8, i8* %arrayidx11, align 1
  %conv12 = zext i8 %5 to i64
  %shl13 = shl nuw nsw i64 %conv12, 32
  %or14 = or i64 %or10, %shl13
  %arrayidx15 = getelementptr inbounds i8, i8* %input.unwrapped, i64 5
  %6 = load i8, i8* %arrayidx15, align 1
  %conv16 = zext i8 %6 to i64
  %shl17 = shl nuw nsw i64 %conv16, 40
  %or18 = or i64 %or14, %shl17
  %arrayidx19 = getelementptr inbounds i8, i8* %input.unwrapped, i64 6
  %7 = load i8, i8* %arrayidx19, align 1
  %conv20 = zext i8 %7 to i64
  %shl21 = shl nuw nsw i64 %conv20, 48
  %or22 = or i64 %or18, %shl21
  %arrayidx23 = getelementptr inbounds i8, i8* %input.unwrapped, i64 7
  %8 = load i8, i8* %arrayidx23, align 1
  %conv24 = zext i8 %8 to i64
  %shl25 = shl nuw i64 %conv24, 56
  %or26 = or i64 %or22, %shl25
  ret i64 %or26
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define dso_local void @fexpand(%i64ptr.wrapped.ty* nocapture noundef readonly %output, %i8ptr.wrapped.ty* nocapture noundef readonly %input) local_unnamed_addr #1 {
entry:
  %arraydecay1.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay4.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay10.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay17.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay24.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i64 0, i32 0
  %output.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %input, i64 0, i32 0
  %input.unwrapped = load i8*, i8** %1, align 8
  %view = alloca i64, align 8
  %2 = bitcast i8* %input.unwrapped to i64*
  %3 = load i64, i64* %2, align 1
  store i64 %3, i64* %view, align 8
  %arraydecay1.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay1.wrapped, i64 0, i32 1
  store i64 8, i64* %arraydecay1.wrapped.field0.length.ptr, align 8
  %4 = bitcast %i8ptr.wrapped.ty* %arraydecay1.wrapped to i64**
  store i64* %view, i64** %4, align 8
  %call = call i64 @load_limb(%i8ptr.wrapped.ty* nonnull %arraydecay1.wrapped)
  %and = and i64 %call, 2251799813685247
  store i64 %and, i64* %output.unwrapped, align 8
  %arrayidx3 = getelementptr inbounds i8, i8* %input.unwrapped, i64 6
  %5 = bitcast i8* %arrayidx3 to i64*
  %6 = load i64, i64* %5, align 1
  store i64 %6, i64* %view, align 8
  %arraydecay4.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay4.wrapped, i64 0, i32 1
  store i64 8, i64* %arraydecay4.wrapped.field0.length.ptr, align 8
  %7 = bitcast %i8ptr.wrapped.ty* %arraydecay4.wrapped to i64**
  store i64* %view, i64** %7, align 8
  %call5 = call i64 @load_limb(%i8ptr.wrapped.ty* nonnull %arraydecay4.wrapped)
  %shr = lshr i64 %call5, 3
  %and6 = and i64 %shr, 2251799813685247
  %arrayidx7 = getelementptr inbounds i64, i64* %output.unwrapped, i64 1
  store i64 %and6, i64* %arrayidx7, align 8
  %arrayidx9 = getelementptr inbounds i8, i8* %input.unwrapped, i64 12
  %8 = bitcast i8* %arrayidx9 to i64*
  %9 = load i64, i64* %8, align 1
  store i64 %9, i64* %view, align 8
  %arraydecay10.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay10.wrapped, i64 0, i32 1
  store i64 8, i64* %arraydecay10.wrapped.field0.length.ptr, align 8
  %10 = bitcast %i8ptr.wrapped.ty* %arraydecay10.wrapped to i64**
  store i64* %view, i64** %10, align 8
  %call11 = call i64 @load_limb(%i8ptr.wrapped.ty* nonnull %arraydecay10.wrapped)
  %shr12 = lshr i64 %call11, 6
  %and13 = and i64 %shr12, 2251799813685247
  %arrayidx14 = getelementptr inbounds i64, i64* %output.unwrapped, i64 2
  store i64 %and13, i64* %arrayidx14, align 8
  %arrayidx16 = getelementptr inbounds i8, i8* %input.unwrapped, i64 19
  %11 = bitcast i8* %arrayidx16 to i64*
  %12 = load i64, i64* %11, align 1
  store i64 %12, i64* %view, align 8
  %arraydecay17.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay17.wrapped, i64 0, i32 1
  store i64 8, i64* %arraydecay17.wrapped.field0.length.ptr, align 8
  %13 = bitcast %i8ptr.wrapped.ty* %arraydecay17.wrapped to i64**
  store i64* %view, i64** %13, align 8
  %call18 = call i64 @load_limb(%i8ptr.wrapped.ty* nonnull %arraydecay17.wrapped)
  %shr19 = lshr i64 %call18, 1
  %and20 = and i64 %shr19, 2251799813685247
  %arrayidx21 = getelementptr inbounds i64, i64* %output.unwrapped, i64 3
  store i64 %and20, i64* %arrayidx21, align 8
  %arrayidx23 = getelementptr inbounds i8, i8* %input.unwrapped, i64 24
  %14 = bitcast i8* %arrayidx23 to i64*
  %15 = load i64, i64* %14, align 1
  store i64 %15, i64* %view, align 8
  %arraydecay24.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay24.wrapped, i64 0, i32 1
  store i64 8, i64* %arraydecay24.wrapped.field0.length.ptr, align 8
  %16 = bitcast %i8ptr.wrapped.ty* %arraydecay24.wrapped to i64**
  store i64* %view, i64** %16, align 8
  %call25 = call i64 @load_limb(%i8ptr.wrapped.ty* nonnull %arraydecay24.wrapped)
  %shr26 = lshr i64 %call25, 12
  %and27 = and i64 %shr26, 2251799813685247
  %arrayidx28 = getelementptr inbounds i64, i64* %output.unwrapped, i64 4
  store i64 %and27, i64* %arrayidx28, align 8
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define dso_local void @fsum(%i64ptr.wrapped.ty* nocapture noundef readonly %output, %i64ptr.wrapped.ty* nocapture noundef readonly %input) local_unnamed_addr #1 {
entry:
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i64 0, i32 0
  %output.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i64 0, i32 0
  %input.unwrapped = load i64*, i64** %1, align 8
  %2 = load i64, i64* %input.unwrapped, align 8
  %3 = load i64, i64* %output.unwrapped, align 8
  %add = add i64 %3, %2
  store i64 %add, i64* %output.unwrapped, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input.unwrapped, i64 1
  %4 = load i64, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %output.unwrapped, i64 1
  %5 = load i64, i64* %arrayidx3, align 8
  %add4 = add i64 %5, %4
  store i64 %add4, i64* %arrayidx3, align 8
  %arrayidx5 = getelementptr inbounds i64, i64* %input.unwrapped, i64 2
  %6 = load i64, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %output.unwrapped, i64 2
  %7 = load i64, i64* %arrayidx6, align 8
  %add7 = add i64 %7, %6
  store i64 %add7, i64* %arrayidx6, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %input.unwrapped, i64 3
  %8 = load i64, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds i64, i64* %output.unwrapped, i64 3
  %9 = load i64, i64* %arrayidx9, align 8
  %add10 = add i64 %9, %8
  store i64 %add10, i64* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds i64, i64* %input.unwrapped, i64 4
  %10 = load i64, i64* %arrayidx11, align 8
  %arrayidx12 = getelementptr inbounds i64, i64* %output.unwrapped, i64 4
  %11 = load i64, i64* %arrayidx12, align 8
  %add13 = add i64 %11, %10
  store i64 %add13, i64* %arrayidx12, align 8
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone sspstrong uwtable willreturn
define dso_local void @fdifference_backwards(%i64ptr.wrapped.ty* nocapture noundef %out, %i64ptr.wrapped.ty* nocapture noundef %input) local_unnamed_addr #3 {
entry:
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define dso_local void @fmul(%i64ptr.wrapped.ty* nocapture noundef readonly %output, %i64ptr.wrapped.ty* nocapture noundef readonly %input2, %i64ptr.wrapped.ty* nocapture noundef readonly %input) local_unnamed_addr #1 {
entry:
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i64 0, i32 0
  %output.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input2, i64 0, i32 0
  %input2.unwrapped = load i64*, i64** %1, align 8
  %2 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i64 0, i32 0
  %input.unwrapped = load i64*, i64** %2, align 8
  %3 = load i64, i64* %input.unwrapped, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %input.unwrapped, i64 1
  %4 = load i64, i64* %arrayidx1, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input.unwrapped, i64 2
  %5 = load i64, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %input.unwrapped, i64 3
  %6 = load i64, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %input.unwrapped, i64 4
  %7 = load i64, i64* %arrayidx4, align 8
  %8 = load i64, i64* %input2.unwrapped, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %input2.unwrapped, i64 1
  %9 = load i64, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds i64, i64* %input2.unwrapped, i64 2
  %10 = load i64, i64* %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %input2.unwrapped, i64 3
  %11 = load i64, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds i64, i64* %input2.unwrapped, i64 4
  %12 = load i64, i64* %arrayidx9, align 8
  %mul = mul i64 %8, %3
  %mul11 = mul i64 %9, %3
  %mul12 = mul i64 %8, %4
  %mul14 = mul i64 %10, %3
  %mul15 = mul i64 %8, %5
  %mul17 = mul i64 %9, %4
  %mul20 = mul i64 %11, %3
  %mul21 = mul i64 %8, %6
  %mul23 = mul i64 %10, %4
  %mul25 = mul i64 %9, %5
  %mul28 = mul i64 %12, %3
  %mul29 = mul i64 %8, %7
  %mul31 = mul i64 %9, %6
  %mul33 = mul i64 %11, %4
  %mul35 = mul i64 %10, %5
  %mul38 = mul i64 %7, 19
  %mul39 = mul i64 %4, 19
  %mul40 = mul i64 %5, 19
  %mul41 = mul i64 %6, 19
  %mul42 = mul i64 %9, %mul38
  %mul43 = mul i64 %mul39, %12
  %mul45 = mul i64 %11, %mul40
  %mul47 = mul i64 %10, %mul41
  %add44 = add i64 %mul42, %mul
  %add46 = add i64 %add44, %mul47
  %add48 = add i64 %add46, %mul45
  %add50 = add i64 %add48, %mul43
  %mul51 = mul i64 %10, %mul38
  %mul52 = mul i64 %12, %mul40
  %mul54 = mul i64 %11, %mul41
  %mul58 = mul i64 %11, %mul38
  %mul59 = mul i64 %12, %mul41
  %mul63 = mul i64 %12, %mul38
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
  store i64 %and95, i64* %output.unwrapped, align 8
  %arrayidx101 = getelementptr inbounds i64, i64* %output.unwrapped, i64 1
  store i64 %and98, i64* %arrayidx101, align 8
  %arrayidx102 = getelementptr inbounds i64, i64* %output.unwrapped, i64 2
  store i64 %add99, i64* %arrayidx102, align 8
  %arrayidx103 = getelementptr inbounds i64, i64* %output.unwrapped, i64 3
  store i64 %and83, i64* %arrayidx103, align 8
  %arrayidx104 = getelementptr inbounds i64, i64* %output.unwrapped, i64 4
  store i64 %and89, i64* %arrayidx104, align 8
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @fsquare_times(%i64ptr.wrapped.ty* nocapture noundef readonly %output, %i64ptr.wrapped.ty* nocapture noundef readonly %input, i64 noundef %count) local_unnamed_addr #5 {
entry:
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i64 0, i32 0
  %output.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i64 0, i32 0
  %input.unwrapped = load i64*, i64** %1, align 8
  %2 = load i64, i64* %input.unwrapped, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %input.unwrapped, i64 1
  %3 = load i64, i64* %arrayidx1, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input.unwrapped, i64 2
  %4 = load i64, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %input.unwrapped, i64 3
  %5 = load i64, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %input.unwrapped, i64 4
  %6 = load i64, i64* %arrayidx4, align 8
  %cmp18.not = icmp eq i64 %count, 0
  br i1 %cmp18.not, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.0.rewritten24 = phi i64 [ %inc, %for.body ], [ 0, %entry ]
  %r0.0.rewritten23 = phi i64 [ %and69, %for.body ], [ %2, %entry ]
  %r1.0.rewritten22 = phi i64 [ %and72, %for.body ], [ %3, %entry ]
  %r2.0.rewritten21 = phi i64 [ %add73, %for.body ], [ %4, %entry ]
  %r3.0.rewritten20 = phi i64 [ %and57, %for.body ], [ %5, %entry ]
  %r4.0.rewritten19 = phi i64 [ %and63, %for.body ], [ %6, %entry ]
  %mul = shl i64 %r0.0.rewritten23, 1
  %mul5 = shl i64 %r1.0.rewritten22, 1
  %mul8 = mul i64 %r4.0.rewritten19, 19
  %mul9 = mul i64 %r4.0.rewritten19, 38
  %mul10 = mul i64 %r0.0.rewritten23, %r0.0.rewritten23
  %mul11 = mul i64 %r1.0.rewritten22, %mul9
  %mul7 = mul i64 %r3.0.rewritten20, 38
  %mul12 = mul i64 %mul7, %r2.0.rewritten21
  %add = add i64 %mul12, %mul11
  %add13 = add i64 %add, %mul10
  %mul15 = mul i64 %mul, %r1.0.rewritten22
  %mul16 = mul i64 %r2.0.rewritten21, %mul9
  %mul18 = mul i64 %r3.0.rewritten20, 19
  %mul19 = mul i64 %mul18, %r3.0.rewritten20
  %mul22 = mul i64 %mul, %r2.0.rewritten21
  %mul23 = mul i64 %r1.0.rewritten22, %r1.0.rewritten22
  %mul25 = mul i64 %mul9, %r3.0.rewritten20
  %mul28 = mul i64 %mul, %r3.0.rewritten20
  %mul29 = mul i64 %mul5, %r2.0.rewritten21
  %mul31 = mul i64 %mul8, %r4.0.rewritten19
  %mul34 = mul i64 %mul, %r4.0.rewritten19
  %mul35 = mul i64 %mul5, %r3.0.rewritten20
  %mul37 = mul i64 %r2.0.rewritten21, %r2.0.rewritten21
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
  %inc = add nuw i64 %i.0.rewritten24, 1
  %exitcond.not = icmp eq i64 %inc, %count
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !6

for.end:                                          ; preds = %for.body, %entry
  %r4.0.rewritten.lcssa = phi i64 [ %6, %entry ], [ %and63, %for.body ]
  %r3.0.rewritten.lcssa = phi i64 [ %5, %entry ], [ %and57, %for.body ]
  %r2.0.rewritten.lcssa = phi i64 [ %4, %entry ], [ %add73, %for.body ]
  %r1.0.rewritten.lcssa = phi i64 [ %3, %entry ], [ %and72, %for.body ]
  %r0.0.rewritten.lcssa = phi i64 [ %2, %entry ], [ %and69, %for.body ]
  store i64 %r0.0.rewritten.lcssa, i64* %output.unwrapped, align 8
  %arrayidx75 = getelementptr inbounds i64, i64* %output.unwrapped, i64 1
  store i64 %r1.0.rewritten.lcssa, i64* %arrayidx75, align 8
  %arrayidx76 = getelementptr inbounds i64, i64* %output.unwrapped, i64 2
  store i64 %r2.0.rewritten.lcssa, i64* %arrayidx76, align 8
  %arrayidx77 = getelementptr inbounds i64, i64* %output.unwrapped, i64 3
  store i64 %r3.0.rewritten.lcssa, i64* %arrayidx77, align 8
  %arrayidx78 = getelementptr inbounds i64, i64* %output.unwrapped, i64 4
  store i64 %r4.0.rewritten.lcssa, i64* %arrayidx78, align 8
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define dso_local void @fscalar_product(%i64ptr.wrapped.ty* nocapture noundef readonly %output, %i64ptr.wrapped.ty* nocapture noundef readonly %input, i64 noundef %scalar) local_unnamed_addr #1 {
entry:
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %output, i64 0, i32 0
  %output.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i64 0, i32 0
  %input.unwrapped = load i64*, i64** %1, align 8
  %2 = load i64, i64* %input.unwrapped, align 8
  %mul = mul i64 %2, %scalar
  %and = and i64 %mul, 2251799813685247
  store i64 %and, i64* %output.unwrapped, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input.unwrapped, i64 1
  %3 = load i64, i64* %arrayidx2, align 8
  %mul3 = mul i64 %3, %scalar
  %shr = lshr i64 %mul, 51
  %add = add i64 %mul3, %shr
  %and4 = and i64 %add, 2251799813685247
  %arrayidx5 = getelementptr inbounds i64, i64* %output.unwrapped, i64 1
  store i64 %and4, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %input.unwrapped, i64 2
  %4 = load i64, i64* %arrayidx6, align 8
  %mul7 = mul i64 %4, %scalar
  %shr8 = lshr i64 %add, 51
  %add9 = add i64 %mul7, %shr8
  %and10 = and i64 %add9, 2251799813685247
  %arrayidx11 = getelementptr inbounds i64, i64* %output.unwrapped, i64 2
  store i64 %and10, i64* %arrayidx11, align 8
  %arrayidx12 = getelementptr inbounds i64, i64* %input.unwrapped, i64 3
  %5 = load i64, i64* %arrayidx12, align 8
  %mul13 = mul i64 %5, %scalar
  %shr14 = lshr i64 %add9, 51
  %add15 = add i64 %mul13, %shr14
  %and16 = and i64 %add15, 2251799813685247
  %arrayidx17 = getelementptr inbounds i64, i64* %output.unwrapped, i64 3
  store i64 %and16, i64* %arrayidx17, align 8
  %arrayidx18 = getelementptr inbounds i64, i64* %input.unwrapped, i64 4
  %6 = load i64, i64* %arrayidx18, align 8
  %mul19 = mul i64 %6, %scalar
  %shr20 = lshr i64 %add15, 51
  %add21 = add i64 %mul19, %shr20
  %and22 = and i64 %add21, 2251799813685247
  %arrayidx23 = getelementptr inbounds i64, i64* %output.unwrapped, i64 4
  store i64 %and22, i64* %arrayidx23, align 8
  %shr24 = lshr i64 %add21, 51
  %mul25 = mul nuw nsw i64 %shr24, 19
  %add27 = add nuw nsw i64 %mul25, %and
  store i64 %add27, i64* %output.unwrapped, align 8
  ret void
}

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
define dso_local void @fmonty(%i64ptr.wrapped.ty* nocapture noundef readonly %x2, %i64ptr.wrapped.ty* nocapture noundef readonly %z2, %i64ptr.wrapped.ty* nocapture noundef readonly %x3, %i64ptr.wrapped.ty* nocapture noundef readonly %z3, %i64ptr.wrapped.ty* nocapture noundef readonly %x, %i64ptr.wrapped.ty* nocapture noundef readonly %z, %i64ptr.wrapped.ty* nocapture noundef readonly %xprime, %i64ptr.wrapped.ty* nocapture noundef readonly %zprime, %i64ptr.wrapped.ty* nocapture noundef readonly %qmqp) local_unnamed_addr #6 {
entry:
  %x2.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x2, i64 0, i32 1
  %x2.field0.length = load i64, i64* %x2.field0.length.ptr, align 8
  %z2.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z2, i64 0, i32 1
  %z2.field0.length = load i64, i64* %z2.field0.length.ptr, align 8
  %x3.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x3, i64 0, i32 1
  %x3.field0.length = load i64, i64* %x3.field0.length.ptr, align 8
  %z3.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z3, i64 0, i32 1
  %z3.field0.length = load i64, i64* %z3.field0.length.ptr, align 8
  %x.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x, i64 0, i32 1
  %x.field0.length = load i64, i64* %x.field0.length.ptr, align 8
  %z.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z, i64 0, i32 1
  %z.field0.length = load i64, i64* %z.field0.length.ptr, align 8
  %xprime.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %xprime, i64 0, i32 1
  %xprime.field0.length = load i64, i64* %xprime.field0.length.ptr, align 8
  %zprime.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime, i64 0, i32 1
  %zprime.field0.length = load i64, i64* %zprime.field0.length.ptr, align 8
  %qmqp.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %qmqp, i64 0, i32 1
  %qmqp.field0.length = load i64, i64* %qmqp.field0.length.ptr, align 8
  %arraydecay4.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %xprime.unwrapped.wrapped21 = alloca %i64ptr.wrapped.ty, align 8
  %z.unwrapped.wrapped23 = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay5.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %x.unwrapped.wrapped17 = alloca %i64ptr.wrapped.ty, align 8
  %zprime.unwrapped.wrapped19 = alloca %i64ptr.wrapped.ty, align 8
  %z3.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay15.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %qmqp.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %x2.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay18.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay19.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %z2.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay26.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay27.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %x.unwrapped.wrapped13 = alloca %i64ptr.wrapped.ty, align 8
  %z.unwrapped.wrapped15 = alloca %i64ptr.wrapped.ty, align 8
  %xprime.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %zprime.unwrapped.wrapped11 = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay8.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay9.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay24.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay25.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %x3.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay12.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay13.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay14.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay16.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %x.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay17.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %z.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay22.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay23.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x2, i64 0, i32 0
  %x2.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z2, i64 0, i32 0
  %z2.unwrapped = load i64*, i64** %1, align 8
  %2 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x3, i64 0, i32 0
  %x3.unwrapped = load i64*, i64** %2, align 8
  %3 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z3, i64 0, i32 0
  %z3.unwrapped = load i64*, i64** %3, align 8
  %4 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x, i64 0, i32 0
  %x.unwrapped = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z, i64 0, i32 0
  %z.unwrapped = load i64*, i64** %5, align 8
  %6 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %xprime, i64 0, i32 0
  %xprime.unwrapped = load i64*, i64** %6, align 8
  %7 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime, i64 0, i32 0
  %zprime.unwrapped = load i64*, i64** %7, align 8
  %8 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %qmqp, i64 0, i32 0
  %qmqp.unwrapped = load i64*, i64** %8, align 8
  %zzz = alloca [5 x i64], align 16
  %xx = alloca [5 x i64], align 16
  %zz = alloca [5 x i64], align 16
  %xxprime = alloca [5 x i64], align 16
  %zzprime = alloca [5 x i64], align 16
  %zzzprime = alloca [5 x i64], align 16
  %9 = bitcast [5 x i64]* %zzz to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %9, i8 0, i64 40, i1 false)
  %10 = bitcast [5 x i64]* %xx to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %10, i8 0, i64 40, i1 false)
  %11 = bitcast [5 x i64]* %zz to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %11, i8 0, i64 40, i1 false)
  %12 = bitcast [5 x i64]* %xxprime to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %12, i8 0, i64 40, i1 false)
  %13 = bitcast [5 x i64]* %zzprime to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %13, i8 0, i64 40, i1 false)
  %14 = bitcast [5 x i64]* %zzzprime to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %14, i8 0, i64 40, i1 false)
  %x.unwrapped.unwrapped14 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x.unwrapped.wrapped13, i64 0, i32 0
  %x.unwrapped.wrapped13.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x.unwrapped.wrapped13, i64 0, i32 1
  store i64 %x.field0.length, i64* %x.unwrapped.wrapped13.field0.length.ptr, align 8
  store i64* %x.unwrapped, i64** %x.unwrapped.unwrapped14, align 8
  %z.unwrapped.unwrapped16 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped15, i64 0, i32 0
  %z.unwrapped.wrapped15.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped15, i64 0, i32 1
  store i64 %z.field0.length, i64* %z.unwrapped.wrapped15.field0.length.ptr, align 8
  store i64* %z.unwrapped, i64** %z.unwrapped.unwrapped16, align 8
  call void @fsum(%i64ptr.wrapped.ty* nonnull %x.unwrapped.wrapped13, %i64ptr.wrapped.ty* nonnull %z.unwrapped.wrapped15)
  %xprime.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %xprime.unwrapped.wrapped, i64 0, i32 0
  %xprime.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %xprime.unwrapped.wrapped, i64 0, i32 1
  store i64 %xprime.field0.length, i64* %xprime.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %xprime.unwrapped, i64** %xprime.unwrapped.unwrapped, align 8
  %zprime.unwrapped.unwrapped12 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime.unwrapped.wrapped11, i64 0, i32 0
  %zprime.unwrapped.wrapped11.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime.unwrapped.wrapped11, i64 0, i32 1
  store i64 %zprime.field0.length, i64* %zprime.unwrapped.wrapped11.field0.length.ptr, align 8
  store i64* %zprime.unwrapped, i64** %zprime.unwrapped.unwrapped12, align 8
  call void @fsum(%i64ptr.wrapped.ty* nonnull %xprime.unwrapped.wrapped, %i64ptr.wrapped.ty* nonnull %zprime.unwrapped.wrapped11)
  %arraydecay4 = getelementptr inbounds [5 x i64], [5 x i64]* %xxprime, i64 0, i64 0
  %arraydecay4.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay4.wrapped, i64 0, i32 0
  %arraydecay4.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay4.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay4.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay4, i64** %arraydecay4.unwrapped, align 8
  %xprime.unwrapped.unwrapped22 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %xprime.unwrapped.wrapped21, i64 0, i32 0
  %xprime.unwrapped.wrapped21.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %xprime.unwrapped.wrapped21, i64 0, i32 1
  store i64 %xprime.field0.length, i64* %xprime.unwrapped.wrapped21.field0.length.ptr, align 8
  store i64* %xprime.unwrapped, i64** %xprime.unwrapped.unwrapped22, align 8
  %z.unwrapped.unwrapped24 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped23, i64 0, i32 0
  %z.unwrapped.wrapped23.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped23, i64 0, i32 1
  store i64 %z.field0.length, i64* %z.unwrapped.wrapped23.field0.length.ptr, align 8
  store i64* %z.unwrapped, i64** %z.unwrapped.unwrapped24, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %arraydecay4.wrapped, %i64ptr.wrapped.ty* nonnull %xprime.unwrapped.wrapped21, %i64ptr.wrapped.ty* nonnull %z.unwrapped.wrapped23)
  %arraydecay5 = getelementptr inbounds [5 x i64], [5 x i64]* %zzprime, i64 0, i64 0
  %arraydecay5.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay5.wrapped, i64 0, i32 0
  %arraydecay5.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay5.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay5.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay5, i64** %arraydecay5.unwrapped, align 8
  %x.unwrapped.unwrapped18 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x.unwrapped.wrapped17, i64 0, i32 0
  %x.unwrapped.wrapped17.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x.unwrapped.wrapped17, i64 0, i32 1
  store i64 %x.field0.length, i64* %x.unwrapped.wrapped17.field0.length.ptr, align 8
  store i64* %x.unwrapped, i64** %x.unwrapped.unwrapped18, align 8
  %zprime.unwrapped.unwrapped20 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime.unwrapped.wrapped19, i64 0, i32 0
  %zprime.unwrapped.wrapped19.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %zprime.unwrapped.wrapped19, i64 0, i32 1
  store i64 %zprime.field0.length, i64* %zprime.unwrapped.wrapped19.field0.length.ptr, align 8
  store i64* %zprime.unwrapped, i64** %zprime.unwrapped.unwrapped20, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %arraydecay5.wrapped, %i64ptr.wrapped.ty* nonnull %x.unwrapped.wrapped17, %i64ptr.wrapped.ty* nonnull %zprime.unwrapped.wrapped19)
  %arraydecay8.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay8.wrapped, i64 0, i32 0
  %arraydecay8.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay8.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay8.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay4, i64** %arraydecay8.unwrapped, align 8
  %arraydecay9.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay9.wrapped, i64 0, i32 0
  %arraydecay9.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay9.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay9.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay5, i64** %arraydecay9.unwrapped, align 8
  call void @fsum(%i64ptr.wrapped.ty* nonnull %arraydecay8.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay9.wrapped)
  %x3.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x3.unwrapped.wrapped, i64 0, i32 0
  %x3.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x3.unwrapped.wrapped, i64 0, i32 1
  store i64 %x3.field0.length, i64* %x3.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %x3.unwrapped, i64** %x3.unwrapped.unwrapped, align 8
  %arraydecay12.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i64 0, i32 0
  %arraydecay12.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay12.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay4, i64** %arraydecay12.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %x3.unwrapped.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay12.wrapped, i64 1)
  %arraydecay13 = getelementptr inbounds [5 x i64], [5 x i64]* %zzzprime, i64 0, i64 0
  %arraydecay13.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay13.wrapped, i64 0, i32 0
  %arraydecay13.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay13.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay13.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay13, i64** %arraydecay13.unwrapped, align 8
  %arraydecay14.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i64 0, i32 0
  %arraydecay14.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay14.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay5, i64** %arraydecay14.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay13.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay14.wrapped, i64 1)
  %z3.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z3.unwrapped.wrapped, i64 0, i32 0
  %z3.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z3.unwrapped.wrapped, i64 0, i32 1
  store i64 %z3.field0.length, i64* %z3.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %z3.unwrapped, i64** %z3.unwrapped.unwrapped, align 8
  %arraydecay15.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay15.wrapped, i64 0, i32 0
  %arraydecay15.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay15.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay15.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay13, i64** %arraydecay15.unwrapped, align 8
  %qmqp.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %qmqp.unwrapped.wrapped, i64 0, i32 0
  %qmqp.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %qmqp.unwrapped.wrapped, i64 0, i32 1
  store i64 %qmqp.field0.length, i64* %qmqp.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %qmqp.unwrapped, i64** %qmqp.unwrapped.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %z3.unwrapped.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay15.wrapped, %i64ptr.wrapped.ty* nonnull %qmqp.unwrapped.wrapped)
  %arraydecay16 = getelementptr inbounds [5 x i64], [5 x i64]* %xx, i64 0, i64 0
  %arraydecay16.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay16.wrapped, i64 0, i32 0
  %arraydecay16.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay16.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay16.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay16, i64** %arraydecay16.unwrapped, align 8
  %x.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x.unwrapped.wrapped, i64 0, i32 0
  %x.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x.unwrapped.wrapped, i64 0, i32 1
  store i64 %x.field0.length, i64* %x.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %x.unwrapped, i64** %x.unwrapped.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay16.wrapped, %i64ptr.wrapped.ty* nonnull %x.unwrapped.wrapped, i64 1)
  %arraydecay17 = getelementptr inbounds [5 x i64], [5 x i64]* %zz, i64 0, i64 0
  %arraydecay17.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay17.wrapped, i64 0, i32 0
  %arraydecay17.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay17.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay17.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay17, i64** %arraydecay17.unwrapped, align 8
  %z.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped, i64 0, i32 0
  %z.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped, i64 0, i32 1
  store i64 %z.field0.length, i64* %z.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %z.unwrapped, i64** %z.unwrapped.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay17.wrapped, %i64ptr.wrapped.ty* nonnull %z.unwrapped.wrapped, i64 1)
  %x2.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x2.unwrapped.wrapped, i64 0, i32 0
  %x2.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %x2.unwrapped.wrapped, i64 0, i32 1
  store i64 %x2.field0.length, i64* %x2.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %x2.unwrapped, i64** %x2.unwrapped.unwrapped, align 8
  %arraydecay18.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay18.wrapped, i64 0, i32 0
  %arraydecay18.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay18.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay18.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay16, i64** %arraydecay18.unwrapped, align 8
  %arraydecay19.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i64 0, i32 0
  %arraydecay19.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay19.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay17, i64** %arraydecay19.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %x2.unwrapped.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay18.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay19.wrapped)
  %arraydecay22 = getelementptr inbounds [5 x i64], [5 x i64]* %zzz, i64 0, i64 0
  %arraydecay22.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay22.wrapped, i64 0, i32 0
  %arraydecay22.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay22.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay22.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay22, i64** %arraydecay22.unwrapped, align 8
  %arraydecay23.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay23.wrapped, i64 0, i32 0
  %arraydecay23.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay23.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay23.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay17, i64** %arraydecay23.unwrapped, align 8
  call void @fscalar_product(%i64ptr.wrapped.ty* nonnull %arraydecay22.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay23.wrapped, i64 121665)
  %arraydecay24.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i64 0, i32 0
  %arraydecay24.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay24.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay22, i64** %arraydecay24.unwrapped, align 8
  %arraydecay25.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay25.wrapped, i64 0, i32 0
  %arraydecay25.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay25.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay25.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay16, i64** %arraydecay25.unwrapped, align 8
  call void @fsum(%i64ptr.wrapped.ty* nonnull %arraydecay24.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay25.wrapped)
  %z2.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z2.unwrapped.wrapped, i64 0, i32 0
  %z2.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z2.unwrapped.wrapped, i64 0, i32 1
  store i64 %z2.field0.length, i64* %z2.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %z2.unwrapped, i64** %z2.unwrapped.unwrapped, align 8
  %arraydecay26.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i64 0, i32 0
  %arraydecay26.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay26.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay17, i64** %arraydecay26.unwrapped, align 8
  %arraydecay27.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay27.wrapped, i64 0, i32 0
  %arraydecay27.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay27.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay27.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay22, i64** %arraydecay27.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %z2.unwrapped.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay26.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay27.wrapped)
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @swap_conditional(%i64ptr.wrapped.ty* nocapture noundef readonly %a, %i64ptr.wrapped.ty* nocapture noundef readonly %b, i64 noundef %swapi) local_unnamed_addr #5 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %a, i64 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
  %b.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %b, i64 0, i32 1
  %b.field0.length = load i64, i64* %b.field0.length.ptr, align 8
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %a, i64 0, i32 0
  %a.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %b, i64 0, i32 0
  %b.unwrapped = load i64*, i64** %1, align 8
  %cmp = icmp eq i64 %swapi, 1
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i64, i64* %a.unwrapped, i64 %indvars.iv
  %idx0.safe = icmp sgt i64 %a.field0.length, %indvars.iv
  %2 = or i1 %idx0.safe, %cmp
  %ctsel = select i1 %2, i64* %arrayidx, i64* %shadow
  %3 = load i64, i64* %ctsel, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %b.unwrapped, i64 %indvars.iv
  %idx0.safe16 = icmp sgt i64 %b.field0.length, %indvars.iv
  %4 = or i1 %idx0.safe16, %cmp
  %ctsel17 = select i1 %4, i64* %arrayidx3, i64* %shadow
  %5 = load i64, i64* %ctsel17, align 8
  %select.val. = select i1 %cmp, i64 %5, i64 %3
  store i64 %select.val., i64* %ctsel, align 8
  %6 = load i64, i64* %ctsel17, align 8
  %select.val.22 = select i1 %cmp, i64 %3, i64 %6
  store i64 %select.val.22, i64* %ctsel17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 5
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !8

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
define dso_local void @cmult(%i64ptr.wrapped.ty* nocapture noundef readonly %resultx, %i64ptr.wrapped.ty* nocapture noundef readonly %resultz, %i8ptr.wrapped.ty* nocapture noundef readonly %n, %i64ptr.wrapped.ty* nocapture noundef readonly %q) local_unnamed_addr #6 {
entry:
  %q.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %q, i64 0, i32 1
  %q.field0.length = load i64, i64* %q.field0.length.ptr, align 8
  %arraydecay.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay19.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay20.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay21.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay30.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay31.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay32.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay33.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay34.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay35.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay36.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay37.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay46.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay47.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay48.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay49.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay22.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay23.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay24.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay25.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay26.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay27.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay28.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay29.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %q.unwrapped.wrapped57 = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay38.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay39.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay40.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay41.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay42.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay43.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay44.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay45.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %q.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %resultx, i64 0, i32 0
  %resultx.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %resultz, i64 0, i32 0
  %resultz.unwrapped = load i64*, i64** %1, align 8
  %2 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %n, i64 0, i32 0
  %n.unwrapped = load i8*, i8** %2, align 8
  %3 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %q, i64 0, i32 0
  %q.unwrapped = load i64*, i64** %3, align 8
  %a = alloca [5 x i64], align 16
  %b = alloca [5 x i64], align 16
  %c = alloca [5 x i64], align 16
  %d = alloca [5 x i64], align 16
  %e = alloca [5 x i64], align 16
  %f = alloca [5 x i64], align 16
  %g = alloca [5 x i64], align 16
  %h = alloca [5 x i64], align 16
  %4 = bitcast [5 x i64]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %4, i8 0, i64 40, i1 false)
  %5 = bitcast [5 x i64]* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %5, i8 0, i64 40, i1 false)
  %6 = bitcast [5 x i64]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %6, i8 0, i64 40, i1 false)
  %7 = bitcast [5 x i64]* %d to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %7, i8 0, i64 40, i1 false)
  %8 = bitcast [5 x i64]* %e to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %8, i8 0, i64 40, i1 false)
  %9 = bitcast [5 x i64]* %f to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %9, i8 0, i64 40, i1 false)
  %10 = bitcast [5 x i64]* %g to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %10, i8 0, i64 40, i1 false)
  %11 = bitcast [5 x i64]* %h to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %11, i8 0, i64 40, i1 false)
  %arrayidx = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  store i64 1, i64* %arrayidx, align 16
  %arrayidx1 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  store i64 1, i64* %arrayidx1, align 16
  %arrayidx2 = getelementptr inbounds [5 x i64], [5 x i64]* %f, i64 0, i64 0
  store i64 1, i64* %arrayidx2, align 16
  %arrayidx3 = getelementptr inbounds [5 x i64], [5 x i64]* %h, i64 0, i64 0
  store i64 1, i64* %arrayidx3, align 16
  br label %for.body

for.cond8.preheader:                              ; preds = %for.body
  %arraydecay34 = getelementptr inbounds [5 x i64], [5 x i64]* %g, i64 0, i64 0
  %arraydecay35 = getelementptr inbounds [5 x i64], [5 x i64]* %e, i64 0, i64 0
  %arraydecay34.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay34.wrapped, i64 0, i32 0
  %arraydecay34.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay34.wrapped, i64 0, i32 1
  %arraydecay35.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay35.wrapped, i64 0, i32 0
  %arraydecay35.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay35.wrapped, i64 0, i32 1
  %arraydecay36.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay36.wrapped, i64 0, i32 0
  %arraydecay36.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay36.wrapped, i64 0, i32 1
  %arraydecay37.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay37.wrapped, i64 0, i32 0
  %arraydecay37.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay37.wrapped, i64 0, i32 1
  %arraydecay39 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 0
  %arraydecay40 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay38.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay38.wrapped, i64 0, i32 0
  %arraydecay38.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay38.wrapped, i64 0, i32 1
  %arraydecay39.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay39.wrapped, i64 0, i32 0
  %arraydecay39.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay39.wrapped, i64 0, i32 1
  %arraydecay40.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay40.wrapped, i64 0, i32 0
  %arraydecay40.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay40.wrapped, i64 0, i32 1
  %arraydecay41.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay41.wrapped, i64 0, i32 0
  %arraydecay41.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay41.wrapped, i64 0, i32 1
  %arraydecay42.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay42.wrapped, i64 0, i32 0
  %arraydecay42.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay42.wrapped, i64 0, i32 1
  %arraydecay43.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay43.wrapped, i64 0, i32 0
  %arraydecay43.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay43.wrapped, i64 0, i32 1
  %arraydecay44.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay44.wrapped, i64 0, i32 0
  %arraydecay44.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay44.wrapped, i64 0, i32 1
  %arraydecay45.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay45.wrapped, i64 0, i32 0
  %arraydecay45.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay45.wrapped, i64 0, i32 1
  %q.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %q.unwrapped.wrapped, i64 0, i32 0
  %q.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %q.unwrapped.wrapped, i64 0, i32 1
  %arraydecay46.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay46.wrapped, i64 0, i32 0
  %arraydecay46.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay46.wrapped, i64 0, i32 1
  %arraydecay47.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay47.wrapped, i64 0, i32 0
  %arraydecay47.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay47.wrapped, i64 0, i32 1
  %arraydecay48.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay48.wrapped, i64 0, i32 0
  %arraydecay48.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay48.wrapped, i64 0, i32 1
  %arraydecay49.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay49.wrapped, i64 0, i32 0
  %arraydecay49.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay49.wrapped, i64 0, i32 1
  %arraydecay.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay.wrapped, i64 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay.wrapped, i64 0, i32 1
  %arraydecay19.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i64 0, i32 0
  %arraydecay19.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i64 0, i32 1
  %arraydecay20.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i64 0, i32 0
  %arraydecay20.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i64 0, i32 1
  %arraydecay21.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i64 0, i32 0
  %arraydecay21.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i64 0, i32 1
  %arraydecay22.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay22.wrapped, i64 0, i32 0
  %arraydecay22.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay22.wrapped, i64 0, i32 1
  %arraydecay23.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay23.wrapped, i64 0, i32 0
  %arraydecay23.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay23.wrapped, i64 0, i32 1
  %arraydecay24.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i64 0, i32 0
  %arraydecay24.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i64 0, i32 1
  %arraydecay25.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay25.wrapped, i64 0, i32 0
  %arraydecay25.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay25.wrapped, i64 0, i32 1
  %arraydecay26.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i64 0, i32 0
  %arraydecay26.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i64 0, i32 1
  %arraydecay27.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay27.wrapped, i64 0, i32 0
  %arraydecay27.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay27.wrapped, i64 0, i32 1
  %arraydecay28.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay28.wrapped, i64 0, i32 0
  %arraydecay28.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay28.wrapped, i64 0, i32 1
  %arraydecay29.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay29.wrapped, i64 0, i32 0
  %arraydecay29.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay29.wrapped, i64 0, i32 1
  %q.unwrapped.unwrapped58 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %q.unwrapped.wrapped57, i64 0, i32 0
  %q.unwrapped.wrapped57.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %q.unwrapped.wrapped57, i64 0, i32 1
  %arraydecay30.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay30.wrapped, i64 0, i32 0
  %arraydecay30.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay30.wrapped, i64 0, i32 1
  %arraydecay31.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay31.wrapped, i64 0, i32 0
  %arraydecay31.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay31.wrapped, i64 0, i32 1
  %arraydecay32.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay32.wrapped, i64 0, i32 0
  %arraydecay32.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay32.wrapped, i64 0, i32 1
  %arraydecay33.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay33.wrapped, i64 0, i32 0
  %arraydecay33.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay33.wrapped, i64 0, i32 1
  br label %for.body10

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx4 = getelementptr inbounds i64, i64* %q.unwrapped, i64 %indvars.iv
  %12 = load i64, i64* %arrayidx4, align 8
  %arrayidx6 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 %indvars.iv
  store i64 %12, i64* %arrayidx6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 5
  br i1 %exitcond.not, label %for.cond8.preheader, label %for.body, !llvm.loop !9

for.body10:                                       ; preds = %for.cond8.preheader, %for.end54
  %indvars.iv24 = phi i64 [ 0, %for.cond8.preheader ], [ %indvars.iv.next25, %for.end54 ]
  %13 = sub nuw nsw i64 31, %indvars.iv24
  %arrayidx12 = getelementptr inbounds i8, i8* %n.unwrapped, i64 %13
  %14 = load i8, i8* %arrayidx12, align 1
  br label %for.body15

for.body15:                                       ; preds = %for.body10, %if.end
  %j.0.rewritten12 = phi i32 [ 0, %for.body10 ], [ %inc53, %if.end ]
  %byte.0.rewritten11 = phi i8 [ %14, %for.body10 ], [ %shl, %if.end ]
  %15 = lshr i8 %byte.0.rewritten11, 7
  %16 = zext i8 %15 to i64
  %and = and i32 %j.0.rewritten12, 1
  %cmp17 = icmp eq i32 %and, 0
  br i1 %cmp17, label %if.then, label %if.else

if.then:                                          ; preds = %for.body15
  store i64 5, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx1, i64** %arraydecay.unwrapped, align 8
  store i64 5, i64* %arraydecay19.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay40, i64** %arraydecay19.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* nonnull %arraydecay.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay19.wrapped, i64 %16)
  store i64 5, i64* %arraydecay20.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay39, i64** %arraydecay20.unwrapped, align 8
  store i64 5, i64* %arraydecay21.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx, i64** %arraydecay21.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* nonnull %arraydecay20.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay21.wrapped, i64 %16)
  store i64 5, i64* %arraydecay22.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay34, i64** %arraydecay22.unwrapped, align 8
  store i64 5, i64* %arraydecay23.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx3, i64** %arraydecay23.unwrapped, align 8
  store i64 5, i64* %arraydecay24.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay35, i64** %arraydecay24.unwrapped, align 8
  store i64 5, i64* %arraydecay25.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx2, i64** %arraydecay25.unwrapped, align 8
  store i64 5, i64* %arraydecay26.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx1, i64** %arraydecay26.unwrapped, align 8
  store i64 5, i64* %arraydecay27.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay39, i64** %arraydecay27.unwrapped, align 8
  store i64 5, i64* %arraydecay28.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay40, i64** %arraydecay28.unwrapped, align 8
  store i64 5, i64* %arraydecay29.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx, i64** %arraydecay29.unwrapped, align 8
  store i64 %q.field0.length, i64* %q.unwrapped.wrapped57.field0.length.ptr, align 8
  store i64* %q.unwrapped, i64** %q.unwrapped.unwrapped58, align 8
  call void @fmonty(%i64ptr.wrapped.ty* nonnull %arraydecay22.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay23.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay24.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay25.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay26.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay27.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay28.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay29.wrapped, %i64ptr.wrapped.ty* nonnull %q.unwrapped.wrapped57)
  store i64 5, i64* %arraydecay30.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay34, i64** %arraydecay30.unwrapped, align 8
  store i64 5, i64* %arraydecay31.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay35, i64** %arraydecay31.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* nonnull %arraydecay30.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay31.wrapped, i64 %16)
  store i64 5, i64* %arraydecay32.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx3, i64** %arraydecay32.unwrapped, align 8
  store i64 5, i64* %arraydecay33.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx2, i64** %arraydecay33.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* nonnull %arraydecay32.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay33.wrapped, i64 %16)
  br label %if.end

if.else:                                          ; preds = %for.body15
  store i64 5, i64* %arraydecay34.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay34, i64** %arraydecay34.unwrapped, align 8
  store i64 5, i64* %arraydecay35.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay35, i64** %arraydecay35.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* nonnull %arraydecay34.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay35.wrapped, i64 %16)
  store i64 5, i64* %arraydecay36.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx3, i64** %arraydecay36.unwrapped, align 8
  store i64 5, i64* %arraydecay37.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx2, i64** %arraydecay37.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* nonnull %arraydecay36.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay37.wrapped, i64 %16)
  store i64 5, i64* %arraydecay38.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx1, i64** %arraydecay38.unwrapped, align 8
  store i64 5, i64* %arraydecay39.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay39, i64** %arraydecay39.unwrapped, align 8
  store i64 5, i64* %arraydecay40.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay40, i64** %arraydecay40.unwrapped, align 8
  store i64 5, i64* %arraydecay41.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx, i64** %arraydecay41.unwrapped, align 8
  store i64 5, i64* %arraydecay42.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay34, i64** %arraydecay42.unwrapped, align 8
  store i64 5, i64* %arraydecay43.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx3, i64** %arraydecay43.unwrapped, align 8
  store i64 5, i64* %arraydecay44.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay35, i64** %arraydecay44.unwrapped, align 8
  store i64 5, i64* %arraydecay45.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx2, i64** %arraydecay45.unwrapped, align 8
  store i64 %q.field0.length, i64* %q.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %q.unwrapped, i64** %q.unwrapped.unwrapped, align 8
  call void @fmonty(%i64ptr.wrapped.ty* nonnull %arraydecay38.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay39.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay40.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay41.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay42.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay43.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay44.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay45.wrapped, %i64ptr.wrapped.ty* nonnull %q.unwrapped.wrapped)
  store i64 5, i64* %arraydecay46.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx1, i64** %arraydecay46.unwrapped, align 8
  store i64 5, i64* %arraydecay47.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay40, i64** %arraydecay47.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* nonnull %arraydecay46.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay47.wrapped, i64 %16)
  store i64 5, i64* %arraydecay48.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay39, i64** %arraydecay48.unwrapped, align 8
  store i64 5, i64* %arraydecay49.wrapped.field0.length.ptr, align 8
  store i64* %arrayidx, i64** %arraydecay49.unwrapped, align 8
  call void @swap_conditional(%i64ptr.wrapped.ty* nonnull %arraydecay48.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay49.wrapped, i64 %16)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %shl = shl i8 %byte.0.rewritten11, 1
  %inc53 = add nuw nsw i32 %j.0.rewritten12, 1
  %exitcond23.not = icmp eq i32 %inc53, 8
  br i1 %exitcond23.not, label %for.end54, label %for.body15, !llvm.loop !10

for.end54:                                        ; preds = %if.end
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27.not = icmp eq i64 %indvars.iv.next25, 32
  br i1 %exitcond27.not, label %for.body62, label %for.body10, !llvm.loop !11

for.body62:                                       ; preds = %for.end54, %for.body62
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.body62 ], [ 0, %for.end54 ]
  %arrayidx64 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 %indvars.iv30
  %17 = load i64, i64* %arrayidx64, align 8
  %arrayidx66 = getelementptr inbounds i64, i64* %resultx.unwrapped, i64 %indvars.iv30
  store i64 %17, i64* %arrayidx66, align 8
  %arrayidx68 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 %indvars.iv30
  %18 = load i64, i64* %arrayidx68, align 8
  %arrayidx70 = getelementptr inbounds i64, i64* %resultz.unwrapped, i64 %indvars.iv30
  store i64 %18, i64* %arrayidx70, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33.not = icmp eq i64 %indvars.iv.next31, 5
  br i1 %exitcond33.not, label %for.end73, label %for.body62, !llvm.loop !12

for.end73:                                        ; preds = %for.body62
  ret void
}

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
define dso_local void @crecip(%i64ptr.wrapped.ty* nocapture noundef readonly %out, %i64ptr.wrapped.ty* nocapture noundef readonly %z) local_unnamed_addr #6 {
entry:
  %out.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %out, i64 0, i32 1
  %out.field0.length = load i64, i64* %out.field0.length.ptr, align 8
  %z.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z, i64 0, i32 1
  %z.field0.length = load i64, i64* %z.field0.length.ptr, align 8
  %arraydecay3.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay4.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %z.unwrapped.wrapped1 = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay5.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay6.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay7.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay10.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay11.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay12.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay15.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay16.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay17.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay20.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay21.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay22.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay25.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay26.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay27.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay30.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay31.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay32.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay35.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay36.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay37.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay40.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay41.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay42.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay45.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay46.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay47.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %out.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay50.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay51.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %z.unwrapped.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay1.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay2.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay8.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay9.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay13.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay14.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay18.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay19.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay23.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay24.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay28.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay29.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay33.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay34.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay38.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay39.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay43.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay44.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay48.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay49.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %out, i64 0, i32 0
  %out.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z, i64 0, i32 0
  %z.unwrapped = load i64*, i64** %1, align 8
  %a = alloca [5 x i64], align 16
  %t0 = alloca [5 x i64], align 16
  %b = alloca [5 x i64], align 16
  %c = alloca [5 x i64], align 16
  %2 = bitcast [5 x i64]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %2, i8 0, i64 40, i1 false)
  %3 = bitcast [5 x i64]* %t0 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %3, i8 0, i64 40, i1 false)
  %4 = bitcast [5 x i64]* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %4, i8 0, i64 40, i1 false)
  %5 = bitcast [5 x i64]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %5, i8 0, i64 40, i1 false)
  %arraydecay = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay.wrapped, i64 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay, i64** %arraydecay.unwrapped, align 8
  %z.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped, i64 0, i32 0
  %z.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped, i64 0, i32 1
  store i64 %z.field0.length, i64* %z.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %z.unwrapped, i64** %z.unwrapped.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay.wrapped, %i64ptr.wrapped.ty* nonnull %z.unwrapped.wrapped, i64 1)
  %arraydecay1 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay1.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay1.wrapped, i64 0, i32 0
  %arraydecay1.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay1.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay1.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay1.unwrapped, align 8
  %arraydecay2.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay2.wrapped, i64 0, i32 0
  %arraydecay2.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay2.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay2.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay, i64** %arraydecay2.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay1.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay2.wrapped, i64 2)
  %arraydecay3 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay3.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay3.wrapped, i64 0, i32 0
  %arraydecay3.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay3.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay3.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay3.unwrapped, align 8
  %arraydecay4.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay4.wrapped, i64 0, i32 0
  %arraydecay4.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay4.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay4.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay4.unwrapped, align 8
  %z.unwrapped.unwrapped2 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped1, i64 0, i32 0
  %z.unwrapped.wrapped1.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %z.unwrapped.wrapped1, i64 0, i32 1
  store i64 %z.field0.length, i64* %z.unwrapped.wrapped1.field0.length.ptr, align 8
  store i64* %z.unwrapped, i64** %z.unwrapped.unwrapped2, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %arraydecay3.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay4.wrapped, %i64ptr.wrapped.ty* nonnull %z.unwrapped.wrapped1)
  %arraydecay5.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay5.wrapped, i64 0, i32 0
  %arraydecay5.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay5.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay5.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay, i64** %arraydecay5.unwrapped, align 8
  %arraydecay6.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay6.wrapped, i64 0, i32 0
  %arraydecay6.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay6.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay6.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay6.unwrapped, align 8
  %arraydecay7.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay7.wrapped, i64 0, i32 0
  %arraydecay7.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay7.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay7.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay, i64** %arraydecay7.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %arraydecay5.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay6.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay7.wrapped)
  %arraydecay8.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay8.wrapped, i64 0, i32 0
  %arraydecay8.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay8.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay8.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay8.unwrapped, align 8
  %arraydecay9.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay9.wrapped, i64 0, i32 0
  %arraydecay9.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay9.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay9.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay, i64** %arraydecay9.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay8.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay9.wrapped, i64 1)
  %arraydecay10.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay10.wrapped, i64 0, i32 0
  %arraydecay10.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay10.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay10.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay10.unwrapped, align 8
  %arraydecay11.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay11.wrapped, i64 0, i32 0
  %arraydecay11.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay11.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay11.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay11.unwrapped, align 8
  %arraydecay12.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i64 0, i32 0
  %arraydecay12.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay12.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay12.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %arraydecay10.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay11.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay12.wrapped)
  %arraydecay13.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay13.wrapped, i64 0, i32 0
  %arraydecay13.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay13.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay13.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay13.unwrapped, align 8
  %arraydecay14.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i64 0, i32 0
  %arraydecay14.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay14.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay14.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay13.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay14.wrapped, i64 5)
  %arraydecay15.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay15.wrapped, i64 0, i32 0
  %arraydecay15.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay15.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay15.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay15.unwrapped, align 8
  %arraydecay16.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay16.wrapped, i64 0, i32 0
  %arraydecay16.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay16.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay16.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay16.unwrapped, align 8
  %arraydecay17.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay17.wrapped, i64 0, i32 0
  %arraydecay17.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay17.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay17.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay17.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %arraydecay15.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay16.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay17.wrapped)
  %arraydecay18.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay18.wrapped, i64 0, i32 0
  %arraydecay18.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay18.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay18.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay18.unwrapped, align 8
  %arraydecay19.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i64 0, i32 0
  %arraydecay19.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay19.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay19.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay18.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay19.wrapped, i64 10)
  %arraydecay20 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay20.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i64 0, i32 0
  %arraydecay20.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay20.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay20, i64** %arraydecay20.unwrapped, align 8
  %arraydecay21.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i64 0, i32 0
  %arraydecay21.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay21.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay21.unwrapped, align 8
  %arraydecay22.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay22.wrapped, i64 0, i32 0
  %arraydecay22.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay22.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay22.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay22.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %arraydecay20.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay21.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay22.wrapped)
  %arraydecay23.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay23.wrapped, i64 0, i32 0
  %arraydecay23.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay23.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay23.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay23.unwrapped, align 8
  %arraydecay24.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i64 0, i32 0
  %arraydecay24.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay24.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay20, i64** %arraydecay24.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay23.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay24.wrapped, i64 20)
  %arraydecay25.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay25.wrapped, i64 0, i32 0
  %arraydecay25.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay25.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay25.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay25.unwrapped, align 8
  %arraydecay26.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i64 0, i32 0
  %arraydecay26.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay26.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay26.unwrapped, align 8
  %arraydecay27.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay27.wrapped, i64 0, i32 0
  %arraydecay27.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay27.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay27.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay20, i64** %arraydecay27.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %arraydecay25.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay26.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay27.wrapped)
  %arraydecay28.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay28.wrapped, i64 0, i32 0
  %arraydecay28.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay28.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay28.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay28.unwrapped, align 8
  %arraydecay29.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay29.wrapped, i64 0, i32 0
  %arraydecay29.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay29.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay29.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay29.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay28.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay29.wrapped, i64 10)
  %arraydecay30.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay30.wrapped, i64 0, i32 0
  %arraydecay30.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay30.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay30.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay30.unwrapped, align 8
  %arraydecay31.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay31.wrapped, i64 0, i32 0
  %arraydecay31.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay31.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay31.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay31.unwrapped, align 8
  %arraydecay32.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay32.wrapped, i64 0, i32 0
  %arraydecay32.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay32.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay32.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay32.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %arraydecay30.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay31.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay32.wrapped)
  %arraydecay33.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay33.wrapped, i64 0, i32 0
  %arraydecay33.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay33.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay33.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay33.unwrapped, align 8
  %arraydecay34.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay34.wrapped, i64 0, i32 0
  %arraydecay34.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay34.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay34.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay34.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay33.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay34.wrapped, i64 50)
  %arraydecay35.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay35.wrapped, i64 0, i32 0
  %arraydecay35.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay35.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay35.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay20, i64** %arraydecay35.unwrapped, align 8
  %arraydecay36.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay36.wrapped, i64 0, i32 0
  %arraydecay36.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay36.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay36.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay36.unwrapped, align 8
  %arraydecay37.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay37.wrapped, i64 0, i32 0
  %arraydecay37.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay37.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay37.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay37.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %arraydecay35.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay36.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay37.wrapped)
  %arraydecay38.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay38.wrapped, i64 0, i32 0
  %arraydecay38.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay38.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay38.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay38.unwrapped, align 8
  %arraydecay39.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay39.wrapped, i64 0, i32 0
  %arraydecay39.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay39.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay39.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay20, i64** %arraydecay39.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay38.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay39.wrapped, i64 100)
  %arraydecay40.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay40.wrapped, i64 0, i32 0
  %arraydecay40.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay40.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay40.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay40.unwrapped, align 8
  %arraydecay41.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay41.wrapped, i64 0, i32 0
  %arraydecay41.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay41.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay41.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay41.unwrapped, align 8
  %arraydecay42.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay42.wrapped, i64 0, i32 0
  %arraydecay42.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay42.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay42.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay20, i64** %arraydecay42.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %arraydecay40.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay41.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay42.wrapped)
  %arraydecay43.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay43.wrapped, i64 0, i32 0
  %arraydecay43.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay43.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay43.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay43.unwrapped, align 8
  %arraydecay44.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay44.wrapped, i64 0, i32 0
  %arraydecay44.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay44.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay44.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay44.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay43.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay44.wrapped, i64 50)
  %arraydecay45.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay45.wrapped, i64 0, i32 0
  %arraydecay45.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay45.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay45.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay45.unwrapped, align 8
  %arraydecay46.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay46.wrapped, i64 0, i32 0
  %arraydecay46.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay46.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay46.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay46.unwrapped, align 8
  %arraydecay47.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay47.wrapped, i64 0, i32 0
  %arraydecay47.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay47.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay47.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay3, i64** %arraydecay47.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %arraydecay45.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay46.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay47.wrapped)
  %arraydecay48.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay48.wrapped, i64 0, i32 0
  %arraydecay48.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay48.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay48.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay48.unwrapped, align 8
  %arraydecay49.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay49.wrapped, i64 0, i32 0
  %arraydecay49.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay49.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay49.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay49.unwrapped, align 8
  call void @fsquare_times(%i64ptr.wrapped.ty* nonnull %arraydecay48.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay49.wrapped, i64 5)
  %out.unwrapped.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %out.unwrapped.wrapped, i64 0, i32 0
  %out.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %out.unwrapped.wrapped, i64 0, i32 1
  store i64 %out.field0.length, i64* %out.unwrapped.wrapped.field0.length.ptr, align 8
  store i64* %out.unwrapped, i64** %out.unwrapped.unwrapped, align 8
  %arraydecay50.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay50.wrapped, i64 0, i32 0
  %arraydecay50.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay50.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay50.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay1, i64** %arraydecay50.unwrapped, align 8
  %arraydecay51.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay51.wrapped, i64 0, i32 0
  %arraydecay51.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay51.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay51.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay, i64** %arraydecay51.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %out.unwrapped.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay50.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay51.wrapped)
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define dso_local void @store_limb(%i8ptr.wrapped.ty* nocapture noundef readonly %out, i64 noundef %input) local_unnamed_addr #1 {
entry:
  %0 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %out, i64 0, i32 0
  %out.unwrapped = load i8*, i8** %0, align 8
  %conv = trunc i64 %input to i8
  store i8 %conv, i8* %out.unwrapped, align 1
  %shr = lshr i64 %input, 8
  %conv2 = trunc i64 %shr to i8
  %arrayidx3 = getelementptr inbounds i8, i8* %out.unwrapped, i64 1
  store i8 %conv2, i8* %arrayidx3, align 1
  %shr4 = lshr i64 %input, 16
  %conv6 = trunc i64 %shr4 to i8
  %arrayidx7 = getelementptr inbounds i8, i8* %out.unwrapped, i64 2
  store i8 %conv6, i8* %arrayidx7, align 1
  %shr8 = lshr i64 %input, 24
  %conv10 = trunc i64 %shr8 to i8
  %arrayidx11 = getelementptr inbounds i8, i8* %out.unwrapped, i64 3
  store i8 %conv10, i8* %arrayidx11, align 1
  %shr12 = lshr i64 %input, 32
  %conv14 = trunc i64 %shr12 to i8
  %arrayidx15 = getelementptr inbounds i8, i8* %out.unwrapped, i64 4
  store i8 %conv14, i8* %arrayidx15, align 1
  %shr16 = lshr i64 %input, 40
  %conv18 = trunc i64 %shr16 to i8
  %arrayidx19 = getelementptr inbounds i8, i8* %out.unwrapped, i64 5
  store i8 %conv18, i8* %arrayidx19, align 1
  %shr20 = lshr i64 %input, 48
  %conv22 = trunc i64 %shr20 to i8
  %arrayidx23 = getelementptr inbounds i8, i8* %out.unwrapped, i64 6
  store i8 %conv22, i8* %arrayidx23, align 1
  %shr24 = lshr i64 %input, 56
  %conv26 = trunc i64 %shr24 to i8
  %arrayidx27 = getelementptr inbounds i8, i8* %out.unwrapped, i64 7
  store i8 %conv26, i8* %arrayidx27, align 1
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define dso_local void @fcontract(%i8ptr.wrapped.ty* nocapture noundef readnone %output, %i64ptr.wrapped.ty* nocapture noundef readonly %input) local_unnamed_addr #1 {
entry:
  %arraydecay137.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay142.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay150.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay158.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %input, i64 0, i32 0
  %input.unwrapped = load i64*, i64** %0, align 8
  %view = alloca i64, align 8
  %1 = load i64, i64* %input.unwrapped, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input.unwrapped, i64 1
  %2 = load i64, i64* %arrayidx2, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %input.unwrapped, i64 2
  %3 = load i64, i64* %arrayidx4, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %input.unwrapped, i64 3
  %4 = load i64, i64* %arrayidx6, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %input.unwrapped, i64 4
  %5 = load i64, i64* %arrayidx8, align 8
  %shr = lshr i64 %1, 51
  %add = add i64 %2, %shr
  %and = and i64 %1, 2251799813685247
  %shr14 = lshr i64 %add, 51
  %add16 = add i64 %shr14, %3
  %and18 = and i64 %add, 2251799813685247
  %shr20 = lshr i64 %add16, 51
  %add22 = add i64 %shr20, %4
  %and24 = and i64 %add16, 2251799813685247
  %shr26 = lshr i64 %add22, 51
  %add28 = add i64 %shr26, %5
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
  store i64 %1, i64* %view, align 8
  %shl = shl i64 %add114, 51
  %or = or i64 %shl, %and116
  %arraydecay137.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay137.wrapped, i64 0, i32 1
  store i64 8, i64* %arraydecay137.wrapped.field0.length.ptr, align 8
  %6 = bitcast %i8ptr.wrapped.ty* %arraydecay137.wrapped to i64**
  store i64* %view, i64** %6, align 8
  call void @store_limb(%i8ptr.wrapped.ty* nonnull %arraydecay137.wrapped, i64 %or)
  %arrayidx141 = getelementptr inbounds i64, i64* %input.unwrapped, i64 8
  %7 = load i64, i64* %arrayidx141, align 8
  store i64 %7, i64* %view, align 8
  %and122 = lshr i64 %add114, 13
  %shr144 = and i64 %and122, 274877906943
  %shl146 = shl i64 %add120, 38
  %or147 = or i64 %shl146, %shr144
  %arraydecay142.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay142.wrapped, i64 0, i32 1
  store i64 8, i64* %arraydecay142.wrapped.field0.length.ptr, align 8
  %8 = bitcast %i8ptr.wrapped.ty* %arraydecay142.wrapped to i64**
  store i64* %view, i64** %8, align 8
  call void @store_limb(%i8ptr.wrapped.ty* nonnull %arraydecay142.wrapped, i64 %or147)
  %arrayidx149 = getelementptr inbounds i64, i64* %input.unwrapped, i64 16
  %9 = load i64, i64* %arrayidx149, align 8
  store i64 %9, i64* %view, align 8
  %and128 = lshr i64 %add120, 26
  %shr152 = and i64 %and128, 33554431
  %shl154 = shl i64 %add126, 25
  %or155 = or i64 %shl154, %shr152
  %arraydecay150.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay150.wrapped, i64 0, i32 1
  store i64 8, i64* %arraydecay150.wrapped.field0.length.ptr, align 8
  %10 = bitcast %i8ptr.wrapped.ty* %arraydecay150.wrapped to i64**
  store i64* %view, i64** %10, align 8
  call void @store_limb(%i8ptr.wrapped.ty* nonnull %arraydecay150.wrapped, i64 %or155)
  %arrayidx157 = getelementptr inbounds i64, i64* %input.unwrapped, i64 24
  %11 = load i64, i64* %arrayidx157, align 8
  store i64 %11, i64* %view, align 8
  %and134 = lshr i64 %add126, 39
  %shr160 = and i64 %and134, 4095
  %and136 = shl i64 %add132, 12
  %shl162 = and i64 %and136, 9223372036854771712
  %or163 = or i64 %shl162, %shr160
  %arraydecay158.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay158.wrapped, i64 0, i32 1
  store i64 8, i64* %arraydecay158.wrapped.field0.length.ptr, align 8
  %12 = bitcast %i8ptr.wrapped.ty* %arraydecay158.wrapped to i64**
  store i64* %view, i64** %12, align 8
  call void @store_limb(%i8ptr.wrapped.ty* nonnull %arraydecay158.wrapped, i64 %or163)
  ret void
}

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
define dso_local i32 @curve25519_donna(%i8ptr.wrapped.ty* nocapture noundef readonly %mypublic, %i8ptr.wrapped.ty* nocapture noundef readonly %_secret, %i8ptr.wrapped.ty* nocapture noundef readonly %basepoint) local_unnamed_addr #6 {
entry:
  %basepoint.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %basepoint, i64 0, i32 1
  %basepoint.field0.length = load i64, i64* %basepoint.field0.length.ptr, align 8
  %arraydecay17.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay18.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay19.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay10.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %basepoint.unwrapped.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %mypublic.unwrapped.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay20.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay11.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay12.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay13.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay14.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay15.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay16.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %0 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %_secret, i64 0, i32 0
  %_secret.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %basepoint, i64 0, i32 0
  %basepoint.unwrapped = load i8*, i8** %1, align 8
  %bp = alloca [5 x i64], align 16
  %x = alloca [5 x i64], align 16
  %z = alloca [5 x i64], align 16
  %zmone = alloca [5 x i64], align 16
  %e = alloca [32 x i8], align 16
  %2 = bitcast [5 x i64]* %bp to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %2, i8 0, i64 40, i1 false)
  %3 = bitcast [5 x i64]* %x to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %3, i8 0, i64 40, i1 false)
  %4 = bitcast [5 x i64]* %z to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %4, i8 0, i64 40, i1 false)
  %5 = bitcast [5 x i64]* %zmone to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(40) %5, i8 0, i64 40, i1 false)
  %e1 = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %e1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), i32 503, i8* null)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %e1, i8* noundef nonnull align 1 dereferenceable(32) %_secret.unwrapped, i64 32, i1 false)
  %6 = load i8, i8* %e1, align 16
  %7 = and i8 %6, -8
  store i8 %7, i8* %e1, align 16
  %arrayidx3 = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 31
  %8 = load i8, i8* %arrayidx3, align 1
  %9 = and i8 %8, 63
  %10 = or i8 %9, 64
  store i8 %10, i8* %arrayidx3, align 1
  %arraydecay10 = getelementptr inbounds [5 x i64], [5 x i64]* %bp, i64 0, i64 0
  %arraydecay10.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay10.wrapped, i64 0, i32 0
  %arraydecay10.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay10.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay10.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay10, i64** %arraydecay10.unwrapped, align 8
  %basepoint.unwrapped.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %basepoint.unwrapped.wrapped, i64 0, i32 0
  %basepoint.unwrapped.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %basepoint.unwrapped.wrapped, i64 0, i32 1
  store i64 %basepoint.field0.length, i64* %basepoint.unwrapped.wrapped.field0.length.ptr, align 8
  store i8* %basepoint.unwrapped, i8** %basepoint.unwrapped.unwrapped, align 8
  call void @fexpand(%i64ptr.wrapped.ty* nonnull %arraydecay10.wrapped, %i8ptr.wrapped.ty* nonnull %basepoint.unwrapped.wrapped)
  %arraydecay11 = getelementptr inbounds [5 x i64], [5 x i64]* %x, i64 0, i64 0
  %arraydecay12 = getelementptr inbounds [5 x i64], [5 x i64]* %z, i64 0, i64 0
  %arraydecay11.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay11.wrapped, i64 0, i32 0
  %arraydecay11.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay11.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay11.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay11, i64** %arraydecay11.unwrapped, align 8
  %arraydecay12.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i64 0, i32 0
  %arraydecay12.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay12.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay12, i64** %arraydecay12.unwrapped, align 8
  %arraydecay13.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay13.wrapped, i64 0, i32 0
  %arraydecay13.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay13.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay13.wrapped.field0.length.ptr, align 8
  store i8* %e1, i8** %arraydecay13.unwrapped, align 8
  %arraydecay14.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i64 0, i32 0
  %arraydecay14.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay14.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay14.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay10, i64** %arraydecay14.unwrapped, align 8
  call void @cmult(%i64ptr.wrapped.ty* nonnull %arraydecay11.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay12.wrapped, %i8ptr.wrapped.ty* nonnull %arraydecay13.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay14.wrapped)
  %arraydecay15 = getelementptr inbounds [5 x i64], [5 x i64]* %zmone, i64 0, i64 0
  %arraydecay15.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay15.wrapped, i64 0, i32 0
  %arraydecay15.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay15.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay15.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay15, i64** %arraydecay15.unwrapped, align 8
  %arraydecay16.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay16.wrapped, i64 0, i32 0
  %arraydecay16.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay16.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay16.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay12, i64** %arraydecay16.unwrapped, align 8
  call void @crecip(%i64ptr.wrapped.ty* nonnull %arraydecay15.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay16.wrapped)
  %arraydecay17.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay17.wrapped, i64 0, i32 0
  %arraydecay17.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay17.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay17.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay12, i64** %arraydecay17.unwrapped, align 8
  %arraydecay18.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay18.wrapped, i64 0, i32 0
  %arraydecay18.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay18.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay18.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay11, i64** %arraydecay18.unwrapped, align 8
  %arraydecay19.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i64 0, i32 0
  %arraydecay19.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay19.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay19.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay15, i64** %arraydecay19.unwrapped, align 8
  call void @fmul(%i64ptr.wrapped.ty* nonnull %arraydecay17.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay18.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay19.wrapped)
  %arraydecay20.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i64 0, i32 0
  %arraydecay20.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay20.wrapped, i64 0, i32 1
  store i64 5, i64* %arraydecay20.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay12, i64** %arraydecay20.unwrapped, align 8
  call void @fcontract(%i8ptr.wrapped.ty* nonnull %mypublic.unwrapped.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay20.wrapped)
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #7

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #8 {
entry:
  %arraydecay9.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay10.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay11.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %data = alloca [32 x i8], align 16
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %out = alloca [32 x i8], align 16
  %ret = alloca i8, align 1
  %basepoint = alloca [32 x i8], align 16
  %data1 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %data1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.3, i64 0, i64 0), i32 19, i8* null)
  %call = call i64 @read(i32 noundef 0, i8* noundef nonnull %data1, i64 noundef 32) #10
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
  %1 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx, i64 0) #10, !srcloc !13
  store volatile i64 %1, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  %2 = getelementptr inbounds [32 x i8], [32 x i8]* %out, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %2, i8 0, i64 32, i1 false)
  %3 = getelementptr inbounds [32 x i8], [32 x i8]* %basepoint, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %3, i8* noundef nonnull align 16 dereferenceable(32) getelementptr inbounds (<{ i8, [31 x i8] }>, <{ i8, [31 x i8] }>* @__const.main.basepoint, i64 0, i32 0), i64 32, i1 false)
  %arraydecay9.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay9.wrapped, i64 0, i32 0
  %arraydecay9.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay9.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay9.wrapped.field0.length.ptr, align 8
  store i8* %2, i8** %arraydecay9.unwrapped, align 8
  %arraydecay10.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay10.wrapped, i64 0, i32 0
  %arraydecay10.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay10.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay10.wrapped.field0.length.ptr, align 8
  store i8* %data1, i8** %arraydecay10.unwrapped, align 8
  %arraydecay11.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay11.wrapped, i64 0, i32 0
  %arraydecay11.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay11.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay11.wrapped.field0.length.ptr, align 8
  store i8* %3, i8** %arraydecay11.unwrapped, align 8
  %call12 = call i32 @curve25519_donna(%i8ptr.wrapped.ty* nonnull %arraydecay9.wrapped, %i8ptr.wrapped.ty* nonnull %arraydecay10.wrapped, %i8ptr.wrapped.ty* nonnull %arraydecay11.wrapped)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(32) %data1, i8* noundef nonnull align 16 dereferenceable(32) %2, i64 32, i1 false)
  %4 = load i8, i8* %2, align 16
  store i8 %4, i8* %ret, align 1
  %call18 = call i64 @write(i32 noundef 1, i8* noundef nonnull %ret, i64 noundef 1) #10
  ret i32 0
}

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #9

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #9

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind readonly sspstrong uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { mustprogress nofree noinline norecurse nosync nounwind readnone sspstrong uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { nofree noinline norecurse nosync nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree noinline nosync nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #8 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nounwind }

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
!12 = distinct !{!12, !7}
!13 = !{i64 2148207953, i64 2148207989, i64 2148208057}

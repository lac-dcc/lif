; ModuleID = 'llvm-ir/curve25519_c64.ll'
source_filename = "lib/curve25519_c64.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [21 x i8] c"lib/curve25519_c64.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i64 @load_limb(i8* noundef %input) #0 {
entry:
  %arrayidx = getelementptr inbounds i8, i8* %input, i64 0
  %0 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %0 to i64
  %arrayidx1 = getelementptr inbounds i8, i8* %input, i64 1
  %1 = load i8, i8* %arrayidx1, align 1
  %conv2 = zext i8 %1 to i64
  %shl = shl i64 %conv2, 8
  %or = or i64 %conv, %shl
  %arrayidx3 = getelementptr inbounds i8, i8* %input, i64 2
  %2 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %2 to i64
  %shl5 = shl i64 %conv4, 16
  %or6 = or i64 %or, %shl5
  %arrayidx7 = getelementptr inbounds i8, i8* %input, i64 3
  %3 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %3 to i64
  %shl9 = shl i64 %conv8, 24
  %or10 = or i64 %or6, %shl9
  %arrayidx11 = getelementptr inbounds i8, i8* %input, i64 4
  %4 = load i8, i8* %arrayidx11, align 1
  %conv12 = zext i8 %4 to i64
  %shl13 = shl i64 %conv12, 32
  %or14 = or i64 %or10, %shl13
  %arrayidx15 = getelementptr inbounds i8, i8* %input, i64 5
  %5 = load i8, i8* %arrayidx15, align 1
  %conv16 = zext i8 %5 to i64
  %shl17 = shl i64 %conv16, 40
  %or18 = or i64 %or14, %shl17
  %arrayidx19 = getelementptr inbounds i8, i8* %input, i64 6
  %6 = load i8, i8* %arrayidx19, align 1
  %conv20 = zext i8 %6 to i64
  %shl21 = shl i64 %conv20, 48
  %or22 = or i64 %or18, %shl21
  %arrayidx23 = getelementptr inbounds i8, i8* %input, i64 7
  %7 = load i8, i8* %arrayidx23, align 1
  %conv24 = zext i8 %7 to i64
  %shl25 = shl i64 %conv24, 56
  %or26 = or i64 %or22, %shl25
  ret i64 %or26
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fexpand(i64* noundef %output, i8* noundef %input) #0 {
entry:
  %view = alloca [8 x i8], align 1
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay, i8* align 1 %input, i64 8, i1 false)
  %arraydecay1 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %call = call i64 @load_limb(i8* noundef %arraydecay1)
  %and = and i64 %call, 2251799813685247
  %arrayidx = getelementptr inbounds i64, i64* %output, i64 0
  store i64 %and, i64* %arrayidx, align 8
  %arraydecay2 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx3 = getelementptr inbounds i8, i8* %input, i64 6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay2, i8* align 1 %arrayidx3, i64 8, i1 false)
  %arraydecay4 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %call5 = call i64 @load_limb(i8* noundef %arraydecay4)
  %shr = lshr i64 %call5, 3
  %and6 = and i64 %shr, 2251799813685247
  %arrayidx7 = getelementptr inbounds i64, i64* %output, i64 1
  store i64 %and6, i64* %arrayidx7, align 8
  %arraydecay8 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx9 = getelementptr inbounds i8, i8* %input, i64 12
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay8, i8* align 1 %arrayidx9, i64 8, i1 false)
  %arraydecay10 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %call11 = call i64 @load_limb(i8* noundef %arraydecay10)
  %shr12 = lshr i64 %call11, 6
  %and13 = and i64 %shr12, 2251799813685247
  %arrayidx14 = getelementptr inbounds i64, i64* %output, i64 2
  store i64 %and13, i64* %arrayidx14, align 8
  %arraydecay15 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx16 = getelementptr inbounds i8, i8* %input, i64 19
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay15, i8* align 1 %arrayidx16, i64 8, i1 false)
  %arraydecay17 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %call18 = call i64 @load_limb(i8* noundef %arraydecay17)
  %shr19 = lshr i64 %call18, 1
  %and20 = and i64 %shr19, 2251799813685247
  %arrayidx21 = getelementptr inbounds i64, i64* %output, i64 3
  store i64 %and20, i64* %arrayidx21, align 8
  %arraydecay22 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx23 = getelementptr inbounds i8, i8* %input, i64 24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay22, i8* align 1 %arrayidx23, i64 8, i1 false)
  %arraydecay24 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %call25 = call i64 @load_limb(i8* noundef %arraydecay24)
  %shr26 = lshr i64 %call25, 12
  %and27 = and i64 %shr26, 2251799813685247
  %arrayidx28 = getelementptr inbounds i64, i64* %output, i64 4
  store i64 %and27, i64* %arrayidx28, align 8
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fsum(i64* noundef %output, i64* noundef %input) #0 {
entry:
  %arrayidx = getelementptr inbounds i64, i64* %input, i64 0
  %0 = load i64, i64* %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %output, i64 0
  %1 = load i64, i64* %arrayidx1, align 8
  %add = add i64 %1, %0
  store i64 %add, i64* %arrayidx1, align 8
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

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fdifference_backwards(i64* noundef %out, i64* noundef %input) #0 {
entry:
  %arrayidx = getelementptr inbounds i64, i64* %input, i64 0
  %0 = load i64, i64* %arrayidx, align 8
  %add = add i64 %0, poison
  %arrayidx1 = getelementptr inbounds i64, i64* %out, i64 0
  %1 = load i64, i64* %arrayidx1, align 8
  %sub = sub i64 %add, %1
  %arrayidx2 = getelementptr inbounds i64, i64* %out, i64 0
  store i64 %sub, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %input, i64 1
  %2 = load i64, i64* %arrayidx3, align 8
  %add4 = add i64 %2, poison
  %arrayidx5 = getelementptr inbounds i64, i64* %out, i64 1
  %3 = load i64, i64* %arrayidx5, align 8
  %sub6 = sub i64 %add4, %3
  %arrayidx7 = getelementptr inbounds i64, i64* %out, i64 1
  store i64 %sub6, i64* %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %input, i64 2
  %4 = load i64, i64* %arrayidx8, align 8
  %add9 = add i64 %4, poison
  %arrayidx10 = getelementptr inbounds i64, i64* %out, i64 2
  %5 = load i64, i64* %arrayidx10, align 8
  %sub11 = sub i64 %add9, %5
  %arrayidx12 = getelementptr inbounds i64, i64* %out, i64 2
  store i64 %sub11, i64* %arrayidx12, align 8
  %arrayidx13 = getelementptr inbounds i64, i64* %input, i64 3
  %6 = load i64, i64* %arrayidx13, align 8
  %add14 = add i64 %6, poison
  %arrayidx15 = getelementptr inbounds i64, i64* %out, i64 3
  %7 = load i64, i64* %arrayidx15, align 8
  %sub16 = sub i64 %add14, %7
  %arrayidx17 = getelementptr inbounds i64, i64* %out, i64 3
  store i64 %sub16, i64* %arrayidx17, align 8
  %arrayidx18 = getelementptr inbounds i64, i64* %input, i64 4
  %8 = load i64, i64* %arrayidx18, align 8
  %add19 = add i64 %8, poison
  %arrayidx20 = getelementptr inbounds i64, i64* %out, i64 4
  %9 = load i64, i64* %arrayidx20, align 8
  %sub21 = sub i64 %add19, %9
  %arrayidx22 = getelementptr inbounds i64, i64* %out, i64 4
  store i64 %sub21, i64* %arrayidx22, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fmul(i64* noundef %output, i64* noundef %input2, i64* noundef %input) #0 {
entry:
  %t = alloca [5 x i64], align 16
  %0 = bitcast [5 x i64]* %t to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false)
  %arrayidx = getelementptr inbounds i64, i64* %input, i64 0
  %1 = load i64, i64* %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %input, i64 1
  %2 = load i64, i64* %arrayidx1, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input, i64 2
  %3 = load i64, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %input, i64 3
  %4 = load i64, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %input, i64 4
  %5 = load i64, i64* %arrayidx4, align 8
  %arrayidx5 = getelementptr inbounds i64, i64* %input2, i64 0
  %6 = load i64, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %input2, i64 1
  %7 = load i64, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds i64, i64* %input2, i64 2
  %8 = load i64, i64* %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %input2, i64 3
  %9 = load i64, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds i64, i64* %input2, i64 4
  %10 = load i64, i64* %arrayidx9, align 8
  %mul = mul i64 %1, %6
  %arrayidx10 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  store i64 %mul, i64* %arrayidx10, align 16
  %mul11 = mul i64 %1, %7
  %mul12 = mul i64 %2, %6
  %add = add i64 %mul11, %mul12
  %arrayidx13 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  store i64 %add, i64* %arrayidx13, align 8
  %mul14 = mul i64 %1, %8
  %mul15 = mul i64 %3, %6
  %add16 = add i64 %mul14, %mul15
  %mul17 = mul i64 %2, %7
  %add18 = add i64 %add16, %mul17
  %arrayidx19 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  store i64 %add18, i64* %arrayidx19, align 16
  %mul20 = mul i64 %1, %9
  %mul21 = mul i64 %4, %6
  %add22 = add i64 %mul20, %mul21
  %mul23 = mul i64 %2, %8
  %add24 = add i64 %add22, %mul23
  %mul25 = mul i64 %3, %7
  %add26 = add i64 %add24, %mul25
  %arrayidx27 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  store i64 %add26, i64* %arrayidx27, align 8
  %mul28 = mul i64 %1, %10
  %mul29 = mul i64 %5, %6
  %add30 = add i64 %mul28, %mul29
  %mul31 = mul i64 %4, %7
  %add32 = add i64 %add30, %mul31
  %mul33 = mul i64 %2, %9
  %add34 = add i64 %add32, %mul33
  %mul35 = mul i64 %3, %8
  %add36 = add i64 %add34, %mul35
  %arrayidx37 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  store i64 %add36, i64* %arrayidx37, align 16
  %mul38 = mul i64 %5, 19
  %mul39 = mul i64 %2, 19
  %mul40 = mul i64 %3, 19
  %mul41 = mul i64 %4, 19
  %mul42 = mul i64 %mul38, %7
  %mul43 = mul i64 %mul39, %10
  %add44 = add i64 %mul42, %mul43
  %mul45 = mul i64 %mul40, %9
  %add46 = add i64 %add44, %mul45
  %mul47 = mul i64 %mul41, %8
  %add48 = add i64 %add46, %mul47
  %arrayidx49 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %11 = load i64, i64* %arrayidx49, align 16
  %add50 = add i64 %11, %add48
  store i64 %add50, i64* %arrayidx49, align 16
  %mul51 = mul i64 %mul38, %8
  %mul52 = mul i64 %mul40, %10
  %add53 = add i64 %mul51, %mul52
  %mul54 = mul i64 %mul41, %9
  %add55 = add i64 %add53, %mul54
  %arrayidx56 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %12 = load i64, i64* %arrayidx56, align 8
  %add57 = add i64 %12, %add55
  store i64 %add57, i64* %arrayidx56, align 8
  %mul58 = mul i64 %mul38, %9
  %mul59 = mul i64 %mul41, %10
  %add60 = add i64 %mul58, %mul59
  %arrayidx61 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %13 = load i64, i64* %arrayidx61, align 16
  %add62 = add i64 %13, %add60
  store i64 %add62, i64* %arrayidx61, align 16
  %mul63 = mul i64 %mul38, %10
  %arrayidx64 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %14 = load i64, i64* %arrayidx64, align 8
  %add65 = add i64 %14, %mul63
  store i64 %add65, i64* %arrayidx64, align 8
  %arrayidx66 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %15 = load i64, i64* %arrayidx66, align 16
  %and = and i64 %15, 2251799813685247
  %arrayidx67 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %16 = load i64, i64* %arrayidx67, align 16
  %shr = lshr i64 %16, 51
  %arrayidx68 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %17 = load i64, i64* %arrayidx68, align 8
  %add69 = add i64 %17, %shr
  store i64 %add69, i64* %arrayidx68, align 8
  %arrayidx70 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %18 = load i64, i64* %arrayidx70, align 8
  %and71 = and i64 %18, 2251799813685247
  %arrayidx72 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %19 = load i64, i64* %arrayidx72, align 8
  %shr73 = lshr i64 %19, 51
  %arrayidx74 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %20 = load i64, i64* %arrayidx74, align 16
  %add75 = add i64 %20, %shr73
  store i64 %add75, i64* %arrayidx74, align 16
  %arrayidx76 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %21 = load i64, i64* %arrayidx76, align 16
  %and77 = and i64 %21, 2251799813685247
  %arrayidx78 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %22 = load i64, i64* %arrayidx78, align 16
  %shr79 = lshr i64 %22, 51
  %arrayidx80 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %23 = load i64, i64* %arrayidx80, align 8
  %add81 = add i64 %23, %shr79
  store i64 %add81, i64* %arrayidx80, align 8
  %arrayidx82 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %24 = load i64, i64* %arrayidx82, align 8
  %and83 = and i64 %24, 2251799813685247
  %arrayidx84 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %25 = load i64, i64* %arrayidx84, align 8
  %shr85 = lshr i64 %25, 51
  %arrayidx86 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %26 = load i64, i64* %arrayidx86, align 16
  %add87 = add i64 %26, %shr85
  store i64 %add87, i64* %arrayidx86, align 16
  %arrayidx88 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %27 = load i64, i64* %arrayidx88, align 16
  %and89 = and i64 %27, 2251799813685247
  %arrayidx90 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %28 = load i64, i64* %arrayidx90, align 16
  %shr91 = lshr i64 %28, 51
  %mul92 = mul i64 %shr91, 19
  %add93 = add i64 %and, %mul92
  %shr94 = lshr i64 %add93, 51
  %and95 = and i64 %add93, 2251799813685247
  %add96 = add i64 %and71, %shr94
  %shr97 = lshr i64 %add96, 51
  %and98 = and i64 %add96, 2251799813685247
  %add99 = add i64 %and77, %shr97
  %arrayidx100 = getelementptr inbounds i64, i64* %output, i64 0
  store i64 %and95, i64* %arrayidx100, align 8
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

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fsquare_times(i64* noundef %output, i64* noundef %input, i64 noundef %count) #0 {
entry:
  %t = alloca [5 x i64], align 16
  %0 = bitcast [5 x i64]* %t to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false)
  %arrayidx = getelementptr inbounds i64, i64* %input, i64 0
  %1 = load i64, i64* %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %input, i64 1
  %2 = load i64, i64* %arrayidx1, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %input, i64 2
  %3 = load i64, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %input, i64 3
  %4 = load i64, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %input, i64 4
  %5 = load i64, i64* %arrayidx4, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %r4.0 = phi i64 [ %5, %entry ], [ %and63, %for.inc ]
  %r3.0 = phi i64 [ %4, %entry ], [ %and57, %for.inc ]
  %r2.0 = phi i64 [ %3, %entry ], [ %add73, %for.inc ]
  %r1.0 = phi i64 [ %2, %entry ], [ %and72, %for.inc ]
  %r0.0 = phi i64 [ %1, %entry ], [ %and69, %for.inc ]
  %i.0 = phi i64 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp ult i64 %i.0, %count
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %mul = mul i64 %r0.0, 2
  %mul5 = mul i64 %r1.0, 2
  %mul6 = mul i64 %r2.0, 2
  %mul7 = mul i64 %mul6, 19
  %mul8 = mul i64 %r4.0, 19
  %mul9 = mul i64 %mul8, 2
  %mul10 = mul i64 %r0.0, %r0.0
  %mul11 = mul i64 %mul9, %r1.0
  %add = add i64 %mul10, %mul11
  %mul12 = mul i64 %mul7, %r3.0
  %add13 = add i64 %add, %mul12
  %arrayidx14 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  store i64 %add13, i64* %arrayidx14, align 16
  %mul15 = mul i64 %mul, %r1.0
  %mul16 = mul i64 %mul9, %r2.0
  %add17 = add i64 %mul15, %mul16
  %mul18 = mul i64 %r3.0, 19
  %mul19 = mul i64 %r3.0, %mul18
  %add20 = add i64 %add17, %mul19
  %arrayidx21 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  store i64 %add20, i64* %arrayidx21, align 8
  %mul22 = mul i64 %mul, %r2.0
  %mul23 = mul i64 %r1.0, %r1.0
  %add24 = add i64 %mul22, %mul23
  %mul25 = mul i64 %mul9, %r3.0
  %add26 = add i64 %add24, %mul25
  %arrayidx27 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  store i64 %add26, i64* %arrayidx27, align 16
  %mul28 = mul i64 %mul, %r3.0
  %mul29 = mul i64 %mul5, %r2.0
  %add30 = add i64 %mul28, %mul29
  %mul31 = mul i64 %r4.0, %mul8
  %add32 = add i64 %add30, %mul31
  %arrayidx33 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  store i64 %add32, i64* %arrayidx33, align 8
  %mul34 = mul i64 %mul, %r4.0
  %mul35 = mul i64 %mul5, %r3.0
  %add36 = add i64 %mul34, %mul35
  %mul37 = mul i64 %r2.0, %r2.0
  %add38 = add i64 %add36, %mul37
  %arrayidx39 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  store i64 %add38, i64* %arrayidx39, align 16
  %arrayidx40 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %6 = load i64, i64* %arrayidx40, align 16
  %and = and i64 %6, 2251799813685247
  %arrayidx41 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %7 = load i64, i64* %arrayidx41, align 16
  %shr = lshr i64 %7, 51
  %arrayidx42 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %8 = load i64, i64* %arrayidx42, align 8
  %add43 = add i64 %8, %shr
  store i64 %add43, i64* %arrayidx42, align 8
  %arrayidx44 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %9 = load i64, i64* %arrayidx44, align 8
  %and45 = and i64 %9, 2251799813685247
  %arrayidx46 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %10 = load i64, i64* %arrayidx46, align 8
  %shr47 = lshr i64 %10, 51
  %arrayidx48 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %11 = load i64, i64* %arrayidx48, align 16
  %add49 = add i64 %11, %shr47
  store i64 %add49, i64* %arrayidx48, align 16
  %arrayidx50 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %12 = load i64, i64* %arrayidx50, align 16
  %and51 = and i64 %12, 2251799813685247
  %arrayidx52 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %13 = load i64, i64* %arrayidx52, align 16
  %shr53 = lshr i64 %13, 51
  %arrayidx54 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %14 = load i64, i64* %arrayidx54, align 8
  %add55 = add i64 %14, %shr53
  store i64 %add55, i64* %arrayidx54, align 8
  %arrayidx56 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %15 = load i64, i64* %arrayidx56, align 8
  %and57 = and i64 %15, 2251799813685247
  %arrayidx58 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %16 = load i64, i64* %arrayidx58, align 8
  %shr59 = lshr i64 %16, 51
  %arrayidx60 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %17 = load i64, i64* %arrayidx60, align 16
  %add61 = add i64 %17, %shr59
  store i64 %add61, i64* %arrayidx60, align 16
  %arrayidx62 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %18 = load i64, i64* %arrayidx62, align 16
  %and63 = and i64 %18, 2251799813685247
  %arrayidx64 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %19 = load i64, i64* %arrayidx64, align 16
  %shr65 = lshr i64 %19, 51
  %mul66 = mul i64 %shr65, 19
  %add67 = add i64 %and, %mul66
  %shr68 = lshr i64 %add67, 51
  %and69 = and i64 %add67, 2251799813685247
  %add70 = add i64 %and45, %shr68
  %shr71 = lshr i64 %add70, 51
  %and72 = and i64 %add70, 2251799813685247
  %add73 = add i64 %and51, %shr71
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i64 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %arrayidx74 = getelementptr inbounds i64, i64* %output, i64 0
  store i64 %r0.0, i64* %arrayidx74, align 8
  %arrayidx75 = getelementptr inbounds i64, i64* %output, i64 1
  store i64 %r1.0, i64* %arrayidx75, align 8
  %arrayidx76 = getelementptr inbounds i64, i64* %output, i64 2
  store i64 %r2.0, i64* %arrayidx76, align 8
  %arrayidx77 = getelementptr inbounds i64, i64* %output, i64 3
  store i64 %r3.0, i64* %arrayidx77, align 8
  %arrayidx78 = getelementptr inbounds i64, i64* %output, i64 4
  store i64 %r4.0, i64* %arrayidx78, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fscalar_product(i64* noundef %output, i64* noundef %input, i64 noundef %scalar) #0 {
entry:
  %arrayidx = getelementptr inbounds i64, i64* %input, i64 0
  %0 = load i64, i64* %arrayidx, align 8
  %mul = mul i64 %0, %scalar
  %and = and i64 %mul, 2251799813685247
  %arrayidx1 = getelementptr inbounds i64, i64* %output, i64 0
  store i64 %and, i64* %arrayidx1, align 8
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
  %mul25 = mul i64 %shr24, 19
  %arrayidx26 = getelementptr inbounds i64, i64* %output, i64 0
  %5 = load i64, i64* %arrayidx26, align 8
  %add27 = add i64 %5, %mul25
  store i64 %add27, i64* %arrayidx26, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fmonty(i64* noundef %x2, i64* noundef %z2, i64* noundef %x3, i64* noundef %z3, i64* noundef %x, i64* noundef %z, i64* noundef %xprime, i64* noundef %zprime, i64* noundef %qmqp) #0 {
entry:
  %origx = alloca [5 x i64], align 16
  %origxprime = alloca [5 x i64], align 16
  %zzz = alloca [5 x i64], align 16
  %xx = alloca [5 x i64], align 16
  %zz = alloca [5 x i64], align 16
  %xxprime = alloca [5 x i64], align 16
  %zzprime = alloca [5 x i64], align 16
  %zzzprime = alloca [5 x i64], align 16
  %arraydecay = getelementptr inbounds [5 x i64], [5 x i64]* %origx, i64 0, i64 0
  %0 = bitcast i64* %arraydecay to i8*
  %1 = bitcast i64* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 8 %1, i64 5, i1 false)
  %arraydecay1 = getelementptr inbounds [5 x i64], [5 x i64]* %origxprime, i64 0, i64 0
  %2 = bitcast i64* %arraydecay1 to i8*
  %3 = bitcast i64* %xprime to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 8 %3, i64 5, i1 false)
  %4 = bitcast [5 x i64]* %zzz to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false)
  %5 = bitcast [5 x i64]* %xx to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 40, i1 false)
  %6 = bitcast [5 x i64]* %zz to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false)
  %7 = bitcast [5 x i64]* %xxprime to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false)
  %8 = bitcast [5 x i64]* %zzprime to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 40, i1 false)
  %9 = bitcast [5 x i64]* %zzzprime to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %9, i8 0, i64 40, i1 false)
  call void @fsum(i64* noundef %x, i64* noundef %z)
  %arraydecay2 = getelementptr inbounds [5 x i64], [5 x i64]* %origx, i64 0, i64 0
  call void @fdifference_backwards(i64* noundef %z, i64* noundef %arraydecay2)
  call void @fsum(i64* noundef %xprime, i64* noundef %zprime)
  %arraydecay3 = getelementptr inbounds [5 x i64], [5 x i64]* %origxprime, i64 0, i64 0
  call void @fdifference_backwards(i64* noundef %zprime, i64* noundef %arraydecay3)
  %arraydecay4 = getelementptr inbounds [5 x i64], [5 x i64]* %xxprime, i64 0, i64 0
  call void @fmul(i64* noundef %arraydecay4, i64* noundef %xprime, i64* noundef %z)
  %arraydecay5 = getelementptr inbounds [5 x i64], [5 x i64]* %zzprime, i64 0, i64 0
  call void @fmul(i64* noundef %arraydecay5, i64* noundef %x, i64* noundef %zprime)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp ult i32 %i.0, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = zext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds [5 x i64], [5 x i64]* %xxprime, i64 0, i64 %idxprom
  %10 = load i64, i64* %arrayidx, align 8
  %idxprom6 = zext i32 %i.0 to i64
  %arrayidx7 = getelementptr inbounds [5 x i64], [5 x i64]* %origxprime, i64 0, i64 %idxprom6
  store i64 %10, i64* %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %arraydecay8 = getelementptr inbounds [5 x i64], [5 x i64]* %xxprime, i64 0, i64 0
  %arraydecay9 = getelementptr inbounds [5 x i64], [5 x i64]* %zzprime, i64 0, i64 0
  call void @fsum(i64* noundef %arraydecay8, i64* noundef %arraydecay9)
  %arraydecay10 = getelementptr inbounds [5 x i64], [5 x i64]* %zzprime, i64 0, i64 0
  %arraydecay11 = getelementptr inbounds [5 x i64], [5 x i64]* %origxprime, i64 0, i64 0
  call void @fdifference_backwards(i64* noundef %arraydecay10, i64* noundef %arraydecay11)
  %arraydecay12 = getelementptr inbounds [5 x i64], [5 x i64]* %xxprime, i64 0, i64 0
  call void @fsquare_times(i64* noundef %x3, i64* noundef %arraydecay12, i64 noundef 1)
  %arraydecay13 = getelementptr inbounds [5 x i64], [5 x i64]* %zzzprime, i64 0, i64 0
  %arraydecay14 = getelementptr inbounds [5 x i64], [5 x i64]* %zzprime, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay13, i64* noundef %arraydecay14, i64 noundef 1)
  %arraydecay15 = getelementptr inbounds [5 x i64], [5 x i64]* %zzzprime, i64 0, i64 0
  call void @fmul(i64* noundef %z3, i64* noundef %arraydecay15, i64* noundef %qmqp)
  %arraydecay16 = getelementptr inbounds [5 x i64], [5 x i64]* %xx, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay16, i64* noundef %x, i64 noundef 1)
  %arraydecay17 = getelementptr inbounds [5 x i64], [5 x i64]* %zz, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay17, i64* noundef %z, i64 noundef 1)
  %arraydecay18 = getelementptr inbounds [5 x i64], [5 x i64]* %xx, i64 0, i64 0
  %arraydecay19 = getelementptr inbounds [5 x i64], [5 x i64]* %zz, i64 0, i64 0
  call void @fmul(i64* noundef %x2, i64* noundef %arraydecay18, i64* noundef %arraydecay19)
  %arraydecay20 = getelementptr inbounds [5 x i64], [5 x i64]* %zz, i64 0, i64 0
  %arraydecay21 = getelementptr inbounds [5 x i64], [5 x i64]* %xx, i64 0, i64 0
  call void @fdifference_backwards(i64* noundef %arraydecay20, i64* noundef %arraydecay21)
  %arraydecay22 = getelementptr inbounds [5 x i64], [5 x i64]* %zzz, i64 0, i64 0
  %arraydecay23 = getelementptr inbounds [5 x i64], [5 x i64]* %zz, i64 0, i64 0
  call void @fscalar_product(i64* noundef %arraydecay22, i64* noundef %arraydecay23, i64 noundef 121665)
  %arraydecay24 = getelementptr inbounds [5 x i64], [5 x i64]* %zzz, i64 0, i64 0
  %arraydecay25 = getelementptr inbounds [5 x i64], [5 x i64]* %xx, i64 0, i64 0
  call void @fsum(i64* noundef %arraydecay24, i64* noundef %arraydecay25)
  %arraydecay26 = getelementptr inbounds [5 x i64], [5 x i64]* %zz, i64 0, i64 0
  %arraydecay27 = getelementptr inbounds [5 x i64], [5 x i64]* %zzz, i64 0, i64 0
  call void @fmul(i64* noundef %z2, i64* noundef %arraydecay26, i64* noundef %arraydecay27)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @swap_conditional(i64* noundef %a, i64* noundef %b, i64 noundef %swapi) #0 {
entry:
  %cmp = icmp eq i64 %swapi, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %i.0 = phi i32 [ 0, %if.then ], [ %inc, %for.inc ]
  %cmp1 = icmp ult i32 %i.0, 5
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = zext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i64, i64* %a, i64 %idxprom
  %0 = load i64, i64* %arrayidx, align 8
  %idxprom2 = zext i32 %i.0 to i64
  %arrayidx3 = getelementptr inbounds i64, i64* %b, i64 %idxprom2
  %1 = load i64, i64* %arrayidx3, align 8
  %idxprom4 = zext i32 %i.0 to i64
  %arrayidx5 = getelementptr inbounds i64, i64* %a, i64 %idxprom4
  store i64 %1, i64* %arrayidx5, align 8
  %idxprom6 = zext i32 %i.0 to i64
  %arrayidx7 = getelementptr inbounds i64, i64* %b, i64 %idxprom6
  store i64 %0, i64* %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @cmult(i64* noundef %resultx, i64* noundef %resultz, i8* noundef %n, i64* noundef %q) #0 {
entry:
  %a = alloca [5 x i64], align 16
  %b = alloca [5 x i64], align 16
  %c = alloca [5 x i64], align 16
  %d = alloca [5 x i64], align 16
  %e = alloca [5 x i64], align 16
  %f = alloca [5 x i64], align 16
  %g = alloca [5 x i64], align 16
  %h = alloca [5 x i64], align 16
  %0 = bitcast [5 x i64]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false)
  %1 = bitcast [5 x i64]* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false)
  %2 = bitcast [5 x i64]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false)
  %3 = bitcast [5 x i64]* %d to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false)
  %4 = bitcast [5 x i64]* %e to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false)
  %5 = bitcast [5 x i64]* %f to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 40, i1 false)
  %6 = bitcast [5 x i64]* %g to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false)
  %7 = bitcast [5 x i64]* %h to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false)
  %arrayidx = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  store i64 1, i64* %arrayidx, align 16
  %arrayidx1 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  store i64 1, i64* %arrayidx1, align 16
  %arrayidx2 = getelementptr inbounds [5 x i64], [5 x i64]* %f, i64 0, i64 0
  store i64 1, i64* %arrayidx2, align 16
  %arrayidx3 = getelementptr inbounds [5 x i64], [5 x i64]* %h, i64 0, i64 0
  store i64 1, i64* %arrayidx3, align 16
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp ult i32 %i.0, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = zext i32 %i.0 to i64
  %arrayidx4 = getelementptr inbounds i64, i64* %q, i64 %idxprom
  %8 = load i64, i64* %arrayidx4, align 8
  %idxprom5 = zext i32 %i.0 to i64
  %arrayidx6 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 %idxprom5
  store i64 %8, i64* %arrayidx6, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc55, %for.end
  %i7.0 = phi i32 [ 0, %for.end ], [ %inc56, %for.inc55 ]
  %cmp9 = icmp ult i32 %i7.0, 32
  br i1 %cmp9, label %for.body10, label %for.end57

for.body10:                                       ; preds = %for.cond8
  %sub = sub i32 31, %i7.0
  %idxprom11 = zext i32 %sub to i64
  %arrayidx12 = getelementptr inbounds i8, i8* %n, i64 %idxprom11
  %9 = load i8, i8* %arrayidx12, align 1
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc52, %for.body10
  %byte.0 = phi i8 [ %9, %for.body10 ], [ %conv51, %for.inc52 ]
  %j.0 = phi i32 [ 0, %for.body10 ], [ %inc53, %for.inc52 ]
  %cmp14 = icmp ult i32 %j.0, 8
  br i1 %cmp14, label %for.body15, label %for.end54

for.body15:                                       ; preds = %for.cond13
  %conv = zext i8 %byte.0 to i32
  %shr = ashr i32 %conv, 7
  %conv16 = sext i32 %shr to i64
  %and = and i32 %j.0, 1
  %cmp17 = icmp eq i32 %and, 0
  br i1 %cmp17, label %if.then, label %if.else

if.then:                                          ; preds = %for.body15
  %arraydecay = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay19 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  call void @swap_conditional(i64* noundef %arraydecay, i64* noundef %arraydecay19, i64 noundef %conv16)
  %arraydecay20 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 0
  %arraydecay21 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  call void @swap_conditional(i64* noundef %arraydecay20, i64* noundef %arraydecay21, i64 noundef %conv16)
  %arraydecay22 = getelementptr inbounds [5 x i64], [5 x i64]* %g, i64 0, i64 0
  %arraydecay23 = getelementptr inbounds [5 x i64], [5 x i64]* %h, i64 0, i64 0
  %arraydecay24 = getelementptr inbounds [5 x i64], [5 x i64]* %e, i64 0, i64 0
  %arraydecay25 = getelementptr inbounds [5 x i64], [5 x i64]* %f, i64 0, i64 0
  %arraydecay26 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay27 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 0
  %arraydecay28 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay29 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  call void @fmonty(i64* noundef %arraydecay22, i64* noundef %arraydecay23, i64* noundef %arraydecay24, i64* noundef %arraydecay25, i64* noundef %arraydecay26, i64* noundef %arraydecay27, i64* noundef %arraydecay28, i64* noundef %arraydecay29, i64* noundef %q)
  %arraydecay30 = getelementptr inbounds [5 x i64], [5 x i64]* %g, i64 0, i64 0
  %arraydecay31 = getelementptr inbounds [5 x i64], [5 x i64]* %e, i64 0, i64 0
  call void @swap_conditional(i64* noundef %arraydecay30, i64* noundef %arraydecay31, i64 noundef %conv16)
  %arraydecay32 = getelementptr inbounds [5 x i64], [5 x i64]* %h, i64 0, i64 0
  %arraydecay33 = getelementptr inbounds [5 x i64], [5 x i64]* %f, i64 0, i64 0
  call void @swap_conditional(i64* noundef %arraydecay32, i64* noundef %arraydecay33, i64 noundef %conv16)
  br label %if.end

if.else:                                          ; preds = %for.body15
  %arraydecay34 = getelementptr inbounds [5 x i64], [5 x i64]* %g, i64 0, i64 0
  %arraydecay35 = getelementptr inbounds [5 x i64], [5 x i64]* %e, i64 0, i64 0
  call void @swap_conditional(i64* noundef %arraydecay34, i64* noundef %arraydecay35, i64 noundef %conv16)
  %arraydecay36 = getelementptr inbounds [5 x i64], [5 x i64]* %h, i64 0, i64 0
  %arraydecay37 = getelementptr inbounds [5 x i64], [5 x i64]* %f, i64 0, i64 0
  call void @swap_conditional(i64* noundef %arraydecay36, i64* noundef %arraydecay37, i64 noundef %conv16)
  %arraydecay38 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay39 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 0
  %arraydecay40 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay41 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay42 = getelementptr inbounds [5 x i64], [5 x i64]* %g, i64 0, i64 0
  %arraydecay43 = getelementptr inbounds [5 x i64], [5 x i64]* %h, i64 0, i64 0
  %arraydecay44 = getelementptr inbounds [5 x i64], [5 x i64]* %e, i64 0, i64 0
  %arraydecay45 = getelementptr inbounds [5 x i64], [5 x i64]* %f, i64 0, i64 0
  call void @fmonty(i64* noundef %arraydecay38, i64* noundef %arraydecay39, i64* noundef %arraydecay40, i64* noundef %arraydecay41, i64* noundef %arraydecay42, i64* noundef %arraydecay43, i64* noundef %arraydecay44, i64* noundef %arraydecay45, i64* noundef %q)
  %arraydecay46 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay47 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  call void @swap_conditional(i64* noundef %arraydecay46, i64* noundef %arraydecay47, i64 noundef %conv16)
  %arraydecay48 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 0
  %arraydecay49 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  call void @swap_conditional(i64* noundef %arraydecay48, i64* noundef %arraydecay49, i64 noundef %conv16)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %conv50 = zext i8 %byte.0 to i32
  %shl = shl i32 %conv50, 1
  %conv51 = trunc i32 %shl to i8
  br label %for.inc52

for.inc52:                                        ; preds = %if.end
  %inc53 = add i32 %j.0, 1
  br label %for.cond13, !llvm.loop !11

for.end54:                                        ; preds = %for.cond13
  br label %for.inc55

for.inc55:                                        ; preds = %for.end54
  %inc56 = add i32 %i7.0, 1
  br label %for.cond8, !llvm.loop !12

for.end57:                                        ; preds = %for.cond8
  br label %for.cond59

for.cond59:                                       ; preds = %for.inc71, %for.end57
  %i58.0 = phi i32 [ 0, %for.end57 ], [ %inc72, %for.inc71 ]
  %cmp60 = icmp ult i32 %i58.0, 5
  br i1 %cmp60, label %for.body62, label %for.end73

for.body62:                                       ; preds = %for.cond59
  %idxprom63 = zext i32 %i58.0 to i64
  %arrayidx64 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 %idxprom63
  %10 = load i64, i64* %arrayidx64, align 8
  %idxprom65 = zext i32 %i58.0 to i64
  %arrayidx66 = getelementptr inbounds i64, i64* %resultx, i64 %idxprom65
  store i64 %10, i64* %arrayidx66, align 8
  %idxprom67 = zext i32 %i58.0 to i64
  %arrayidx68 = getelementptr inbounds [5 x i64], [5 x i64]* %d, i64 0, i64 %idxprom67
  %11 = load i64, i64* %arrayidx68, align 8
  %idxprom69 = zext i32 %i58.0 to i64
  %arrayidx70 = getelementptr inbounds i64, i64* %resultz, i64 %idxprom69
  store i64 %11, i64* %arrayidx70, align 8
  br label %for.inc71

for.inc71:                                        ; preds = %for.body62
  %inc72 = add i32 %i58.0, 1
  br label %for.cond59, !llvm.loop !13

for.end73:                                        ; preds = %for.cond59
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @crecip(i64* noundef %out, i64* noundef %z) #0 {
entry:
  %a = alloca [5 x i64], align 16
  %t0 = alloca [5 x i64], align 16
  %b = alloca [5 x i64], align 16
  %c = alloca [5 x i64], align 16
  %0 = bitcast [5 x i64]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false)
  %1 = bitcast [5 x i64]* %t0 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false)
  %2 = bitcast [5 x i64]* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false)
  %3 = bitcast [5 x i64]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false)
  %arraydecay = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay, i64* noundef %z, i64 noundef 1)
  %arraydecay1 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay2 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay1, i64* noundef %arraydecay2, i64 noundef 2)
  %arraydecay3 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay4 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  call void @fmul(i64* noundef %arraydecay3, i64* noundef %arraydecay4, i64* noundef %z)
  %arraydecay5 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  %arraydecay6 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay7 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  call void @fmul(i64* noundef %arraydecay5, i64* noundef %arraydecay6, i64* noundef %arraydecay7)
  %arraydecay8 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay9 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay8, i64* noundef %arraydecay9, i64 noundef 1)
  %arraydecay10 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay11 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay12 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  call void @fmul(i64* noundef %arraydecay10, i64* noundef %arraydecay11, i64* noundef %arraydecay12)
  %arraydecay13 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay14 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay13, i64* noundef %arraydecay14, i64 noundef 5)
  %arraydecay15 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay16 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay17 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  call void @fmul(i64* noundef %arraydecay15, i64* noundef %arraydecay16, i64* noundef %arraydecay17)
  %arraydecay18 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay19 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay18, i64* noundef %arraydecay19, i64 noundef 10)
  %arraydecay20 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay21 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay22 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  call void @fmul(i64* noundef %arraydecay20, i64* noundef %arraydecay21, i64* noundef %arraydecay22)
  %arraydecay23 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay24 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay23, i64* noundef %arraydecay24, i64 noundef 20)
  %arraydecay25 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay26 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay27 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  call void @fmul(i64* noundef %arraydecay25, i64* noundef %arraydecay26, i64* noundef %arraydecay27)
  %arraydecay28 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay29 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay28, i64* noundef %arraydecay29, i64 noundef 10)
  %arraydecay30 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  %arraydecay31 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay32 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  call void @fmul(i64* noundef %arraydecay30, i64* noundef %arraydecay31, i64* noundef %arraydecay32)
  %arraydecay33 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay34 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay33, i64* noundef %arraydecay34, i64 noundef 50)
  %arraydecay35 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  %arraydecay36 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay37 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  call void @fmul(i64* noundef %arraydecay35, i64* noundef %arraydecay36, i64* noundef %arraydecay37)
  %arraydecay38 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay39 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay38, i64* noundef %arraydecay39, i64 noundef 100)
  %arraydecay40 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay41 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay42 = getelementptr inbounds [5 x i64], [5 x i64]* %c, i64 0, i64 0
  call void @fmul(i64* noundef %arraydecay40, i64* noundef %arraydecay41, i64* noundef %arraydecay42)
  %arraydecay43 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay44 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay43, i64* noundef %arraydecay44, i64 noundef 50)
  %arraydecay45 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay46 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay47 = getelementptr inbounds [5 x i64], [5 x i64]* %b, i64 0, i64 0
  call void @fmul(i64* noundef %arraydecay45, i64* noundef %arraydecay46, i64* noundef %arraydecay47)
  %arraydecay48 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay49 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  call void @fsquare_times(i64* noundef %arraydecay48, i64* noundef %arraydecay49, i64 noundef 5)
  %arraydecay50 = getelementptr inbounds [5 x i64], [5 x i64]* %t0, i64 0, i64 0
  %arraydecay51 = getelementptr inbounds [5 x i64], [5 x i64]* %a, i64 0, i64 0
  call void @fmul(i64* noundef %out, i64* noundef %arraydecay50, i64* noundef %arraydecay51)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @store_limb(i8* noundef %out, i64 noundef %input) #0 {
entry:
  %and = and i64 %input, 255
  %conv = trunc i64 %and to i8
  %arrayidx = getelementptr inbounds i8, i8* %out, i64 0
  store i8 %conv, i8* %arrayidx, align 1
  %shr = lshr i64 %input, 8
  %and1 = and i64 %shr, 255
  %conv2 = trunc i64 %and1 to i8
  %arrayidx3 = getelementptr inbounds i8, i8* %out, i64 1
  store i8 %conv2, i8* %arrayidx3, align 1
  %shr4 = lshr i64 %input, 16
  %and5 = and i64 %shr4, 255
  %conv6 = trunc i64 %and5 to i8
  %arrayidx7 = getelementptr inbounds i8, i8* %out, i64 2
  store i8 %conv6, i8* %arrayidx7, align 1
  %shr8 = lshr i64 %input, 24
  %and9 = and i64 %shr8, 255
  %conv10 = trunc i64 %and9 to i8
  %arrayidx11 = getelementptr inbounds i8, i8* %out, i64 3
  store i8 %conv10, i8* %arrayidx11, align 1
  %shr12 = lshr i64 %input, 32
  %and13 = and i64 %shr12, 255
  %conv14 = trunc i64 %and13 to i8
  %arrayidx15 = getelementptr inbounds i8, i8* %out, i64 4
  store i8 %conv14, i8* %arrayidx15, align 1
  %shr16 = lshr i64 %input, 40
  %and17 = and i64 %shr16, 255
  %conv18 = trunc i64 %and17 to i8
  %arrayidx19 = getelementptr inbounds i8, i8* %out, i64 5
  store i8 %conv18, i8* %arrayidx19, align 1
  %shr20 = lshr i64 %input, 48
  %and21 = and i64 %shr20, 255
  %conv22 = trunc i64 %and21 to i8
  %arrayidx23 = getelementptr inbounds i8, i8* %out, i64 6
  store i8 %conv22, i8* %arrayidx23, align 1
  %shr24 = lshr i64 %input, 56
  %and25 = and i64 %shr24, 255
  %conv26 = trunc i64 %and25 to i8
  %arrayidx27 = getelementptr inbounds i8, i8* %out, i64 7
  store i8 %conv26, i8* %arrayidx27, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @fcontract(i8* noundef %output, i64* noundef %input) #0 {
entry:
  %t = alloca [5 x i64], align 16
  %view = alloca [8 x i8], align 1
  %0 = bitcast [5 x i64]* %t to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false)
  %arrayidx = getelementptr inbounds i64, i64* %input, i64 0
  %1 = load i64, i64* %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  store i64 %1, i64* %arrayidx1, align 16
  %arrayidx2 = getelementptr inbounds i64, i64* %input, i64 1
  %2 = load i64, i64* %arrayidx2, align 8
  %arrayidx3 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  store i64 %2, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %input, i64 2
  %3 = load i64, i64* %arrayidx4, align 8
  %arrayidx5 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  store i64 %3, i64* %arrayidx5, align 16
  %arrayidx6 = getelementptr inbounds i64, i64* %input, i64 3
  %4 = load i64, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  store i64 %4, i64* %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %input, i64 4
  %5 = load i64, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  store i64 %5, i64* %arrayidx9, align 16
  %arrayidx10 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %6 = load i64, i64* %arrayidx10, align 16
  %shr = lshr i64 %6, 51
  %arrayidx11 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %7 = load i64, i64* %arrayidx11, align 8
  %add = add i64 %7, %shr
  store i64 %add, i64* %arrayidx11, align 8
  %arrayidx12 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %8 = load i64, i64* %arrayidx12, align 16
  %and = and i64 %8, 2251799813685247
  store i64 %and, i64* %arrayidx12, align 16
  %arrayidx13 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %9 = load i64, i64* %arrayidx13, align 8
  %shr14 = lshr i64 %9, 51
  %arrayidx15 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %10 = load i64, i64* %arrayidx15, align 16
  %add16 = add i64 %10, %shr14
  store i64 %add16, i64* %arrayidx15, align 16
  %arrayidx17 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %11 = load i64, i64* %arrayidx17, align 8
  %and18 = and i64 %11, 2251799813685247
  store i64 %and18, i64* %arrayidx17, align 8
  %arrayidx19 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %12 = load i64, i64* %arrayidx19, align 16
  %shr20 = lshr i64 %12, 51
  %arrayidx21 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %13 = load i64, i64* %arrayidx21, align 8
  %add22 = add i64 %13, %shr20
  store i64 %add22, i64* %arrayidx21, align 8
  %arrayidx23 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %14 = load i64, i64* %arrayidx23, align 16
  %and24 = and i64 %14, 2251799813685247
  store i64 %and24, i64* %arrayidx23, align 16
  %arrayidx25 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %15 = load i64, i64* %arrayidx25, align 8
  %shr26 = lshr i64 %15, 51
  %arrayidx27 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %16 = load i64, i64* %arrayidx27, align 16
  %add28 = add i64 %16, %shr26
  store i64 %add28, i64* %arrayidx27, align 16
  %arrayidx29 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %17 = load i64, i64* %arrayidx29, align 8
  %and30 = and i64 %17, 2251799813685247
  store i64 %and30, i64* %arrayidx29, align 8
  %arrayidx31 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %18 = load i64, i64* %arrayidx31, align 16
  %shr32 = lshr i64 %18, 51
  %mul = mul i64 19, %shr32
  %arrayidx33 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %19 = load i64, i64* %arrayidx33, align 16
  %add34 = add i64 %19, %mul
  store i64 %add34, i64* %arrayidx33, align 16
  %arrayidx35 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %20 = load i64, i64* %arrayidx35, align 16
  %and36 = and i64 %20, 2251799813685247
  store i64 %and36, i64* %arrayidx35, align 16
  %arrayidx37 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %21 = load i64, i64* %arrayidx37, align 16
  %shr38 = lshr i64 %21, 51
  %arrayidx39 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %22 = load i64, i64* %arrayidx39, align 8
  %add40 = add i64 %22, %shr38
  store i64 %add40, i64* %arrayidx39, align 8
  %arrayidx41 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %23 = load i64, i64* %arrayidx41, align 16
  %and42 = and i64 %23, 2251799813685247
  store i64 %and42, i64* %arrayidx41, align 16
  %arrayidx43 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %24 = load i64, i64* %arrayidx43, align 8
  %shr44 = lshr i64 %24, 51
  %arrayidx45 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %25 = load i64, i64* %arrayidx45, align 16
  %add46 = add i64 %25, %shr44
  store i64 %add46, i64* %arrayidx45, align 16
  %arrayidx47 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %26 = load i64, i64* %arrayidx47, align 8
  %and48 = and i64 %26, 2251799813685247
  store i64 %and48, i64* %arrayidx47, align 8
  %arrayidx49 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %27 = load i64, i64* %arrayidx49, align 16
  %shr50 = lshr i64 %27, 51
  %arrayidx51 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %28 = load i64, i64* %arrayidx51, align 8
  %add52 = add i64 %28, %shr50
  store i64 %add52, i64* %arrayidx51, align 8
  %arrayidx53 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %29 = load i64, i64* %arrayidx53, align 16
  %and54 = and i64 %29, 2251799813685247
  store i64 %and54, i64* %arrayidx53, align 16
  %arrayidx55 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %30 = load i64, i64* %arrayidx55, align 8
  %shr56 = lshr i64 %30, 51
  %arrayidx57 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %31 = load i64, i64* %arrayidx57, align 16
  %add58 = add i64 %31, %shr56
  store i64 %add58, i64* %arrayidx57, align 16
  %arrayidx59 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %32 = load i64, i64* %arrayidx59, align 8
  %and60 = and i64 %32, 2251799813685247
  store i64 %and60, i64* %arrayidx59, align 8
  %arrayidx61 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %33 = load i64, i64* %arrayidx61, align 16
  %shr62 = lshr i64 %33, 51
  %mul63 = mul i64 19, %shr62
  %arrayidx64 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %34 = load i64, i64* %arrayidx64, align 16
  %add65 = add i64 %34, %mul63
  store i64 %add65, i64* %arrayidx64, align 16
  %arrayidx66 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %35 = load i64, i64* %arrayidx66, align 16
  %and67 = and i64 %35, 2251799813685247
  store i64 %and67, i64* %arrayidx66, align 16
  %arrayidx68 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %36 = load i64, i64* %arrayidx68, align 16
  %add69 = add i64 %36, 19
  store i64 %add69, i64* %arrayidx68, align 16
  %arrayidx70 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %37 = load i64, i64* %arrayidx70, align 16
  %shr71 = lshr i64 %37, 51
  %arrayidx72 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %38 = load i64, i64* %arrayidx72, align 8
  %add73 = add i64 %38, %shr71
  store i64 %add73, i64* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %39 = load i64, i64* %arrayidx74, align 16
  %and75 = and i64 %39, 2251799813685247
  store i64 %and75, i64* %arrayidx74, align 16
  %arrayidx76 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %40 = load i64, i64* %arrayidx76, align 8
  %shr77 = lshr i64 %40, 51
  %arrayidx78 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %41 = load i64, i64* %arrayidx78, align 16
  %add79 = add i64 %41, %shr77
  store i64 %add79, i64* %arrayidx78, align 16
  %arrayidx80 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %42 = load i64, i64* %arrayidx80, align 8
  %and81 = and i64 %42, 2251799813685247
  store i64 %and81, i64* %arrayidx80, align 8
  %arrayidx82 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %43 = load i64, i64* %arrayidx82, align 16
  %shr83 = lshr i64 %43, 51
  %arrayidx84 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %44 = load i64, i64* %arrayidx84, align 8
  %add85 = add i64 %44, %shr83
  store i64 %add85, i64* %arrayidx84, align 8
  %arrayidx86 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %45 = load i64, i64* %arrayidx86, align 16
  %and87 = and i64 %45, 2251799813685247
  store i64 %and87, i64* %arrayidx86, align 16
  %arrayidx88 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %46 = load i64, i64* %arrayidx88, align 8
  %shr89 = lshr i64 %46, 51
  %arrayidx90 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %47 = load i64, i64* %arrayidx90, align 16
  %add91 = add i64 %47, %shr89
  store i64 %add91, i64* %arrayidx90, align 16
  %arrayidx92 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %48 = load i64, i64* %arrayidx92, align 8
  %and93 = and i64 %48, 2251799813685247
  store i64 %and93, i64* %arrayidx92, align 8
  %arrayidx94 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %49 = load i64, i64* %arrayidx94, align 16
  %shr95 = lshr i64 %49, 51
  %mul96 = mul i64 19, %shr95
  %arrayidx97 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %50 = load i64, i64* %arrayidx97, align 16
  %add98 = add i64 %50, %mul96
  store i64 %add98, i64* %arrayidx97, align 16
  %arrayidx99 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %51 = load i64, i64* %arrayidx99, align 16
  %and100 = and i64 %51, 2251799813685247
  store i64 %and100, i64* %arrayidx99, align 16
  %arrayidx101 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %52 = load i64, i64* %arrayidx101, align 16
  %add102 = add i64 %52, 2251799813685229
  store i64 %add102, i64* %arrayidx101, align 16
  %arrayidx103 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %53 = load i64, i64* %arrayidx103, align 8
  %add104 = add i64 %53, 2251799813685247
  store i64 %add104, i64* %arrayidx103, align 8
  %arrayidx105 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %54 = load i64, i64* %arrayidx105, align 16
  %add106 = add i64 %54, 2251799813685247
  store i64 %add106, i64* %arrayidx105, align 16
  %arrayidx107 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %55 = load i64, i64* %arrayidx107, align 8
  %add108 = add i64 %55, 2251799813685247
  store i64 %add108, i64* %arrayidx107, align 8
  %arrayidx109 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %56 = load i64, i64* %arrayidx109, align 16
  %add110 = add i64 %56, 2251799813685247
  store i64 %add110, i64* %arrayidx109, align 16
  %arrayidx111 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %57 = load i64, i64* %arrayidx111, align 16
  %shr112 = lshr i64 %57, 51
  %arrayidx113 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %58 = load i64, i64* %arrayidx113, align 8
  %add114 = add i64 %58, %shr112
  store i64 %add114, i64* %arrayidx113, align 8
  %arrayidx115 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %59 = load i64, i64* %arrayidx115, align 16
  %and116 = and i64 %59, 2251799813685247
  store i64 %and116, i64* %arrayidx115, align 16
  %arrayidx117 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %60 = load i64, i64* %arrayidx117, align 8
  %shr118 = lshr i64 %60, 51
  %arrayidx119 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %61 = load i64, i64* %arrayidx119, align 16
  %add120 = add i64 %61, %shr118
  store i64 %add120, i64* %arrayidx119, align 16
  %arrayidx121 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %62 = load i64, i64* %arrayidx121, align 8
  %and122 = and i64 %62, 2251799813685247
  store i64 %and122, i64* %arrayidx121, align 8
  %arrayidx123 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %63 = load i64, i64* %arrayidx123, align 16
  %shr124 = lshr i64 %63, 51
  %arrayidx125 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %64 = load i64, i64* %arrayidx125, align 8
  %add126 = add i64 %64, %shr124
  store i64 %add126, i64* %arrayidx125, align 8
  %arrayidx127 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %65 = load i64, i64* %arrayidx127, align 16
  %and128 = and i64 %65, 2251799813685247
  store i64 %and128, i64* %arrayidx127, align 16
  %arrayidx129 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %66 = load i64, i64* %arrayidx129, align 8
  %shr130 = lshr i64 %66, 51
  %arrayidx131 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %67 = load i64, i64* %arrayidx131, align 16
  %add132 = add i64 %67, %shr130
  store i64 %add132, i64* %arrayidx131, align 16
  %arrayidx133 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %68 = load i64, i64* %arrayidx133, align 8
  %and134 = and i64 %68, 2251799813685247
  store i64 %and134, i64* %arrayidx133, align 8
  %arrayidx135 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %69 = load i64, i64* %arrayidx135, align 16
  %and136 = and i64 %69, 2251799813685247
  store i64 %and136, i64* %arrayidx135, align 16
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %70 = bitcast i64* %input to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay, i8* align 8 %70, i64 8, i1 false)
  %arraydecay137 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx138 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 0
  %71 = load i64, i64* %arrayidx138, align 16
  %arrayidx139 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %72 = load i64, i64* %arrayidx139, align 8
  %shl = shl i64 %72, 51
  %or = or i64 %71, %shl
  call void @store_limb(i8* noundef %arraydecay137, i64 noundef %or)
  %arraydecay140 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx141 = getelementptr inbounds i64, i64* %input, i64 8
  %73 = bitcast i64* %arrayidx141 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay140, i8* align 8 %73, i64 8, i1 false)
  %arraydecay142 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx143 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 1
  %74 = load i64, i64* %arrayidx143, align 8
  %shr144 = lshr i64 %74, 13
  %arrayidx145 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %75 = load i64, i64* %arrayidx145, align 16
  %shl146 = shl i64 %75, 38
  %or147 = or i64 %shr144, %shl146
  call void @store_limb(i8* noundef %arraydecay142, i64 noundef %or147)
  %arraydecay148 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx149 = getelementptr inbounds i64, i64* %input, i64 16
  %76 = bitcast i64* %arrayidx149 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay148, i8* align 8 %76, i64 8, i1 false)
  %arraydecay150 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx151 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 2
  %77 = load i64, i64* %arrayidx151, align 16
  %shr152 = lshr i64 %77, 26
  %arrayidx153 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %78 = load i64, i64* %arrayidx153, align 8
  %shl154 = shl i64 %78, 25
  %or155 = or i64 %shr152, %shl154
  call void @store_limb(i8* noundef %arraydecay150, i64 noundef %or155)
  %arraydecay156 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx157 = getelementptr inbounds i64, i64* %input, i64 24
  %79 = bitcast i64* %arrayidx157 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay156, i8* align 8 %79, i64 8, i1 false)
  %arraydecay158 = getelementptr inbounds [8 x i8], [8 x i8]* %view, i64 0, i64 0
  %arrayidx159 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 3
  %80 = load i64, i64* %arrayidx159, align 8
  %shr160 = lshr i64 %80, 39
  %arrayidx161 = getelementptr inbounds [5 x i64], [5 x i64]* %t, i64 0, i64 4
  %81 = load i64, i64* %arrayidx161, align 16
  %shl162 = shl i64 %81, 12
  %or163 = or i64 %shr160, %shl162
  call void @store_limb(i8* noundef %arraydecay158, i64 noundef %or163)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @curve25519_donna(i8* noundef %mypublic, i8* noundef %_secret, i8* noundef %basepoint) #0 {
entry:
  %bp = alloca [5 x i64], align 16
  %x = alloca [5 x i64], align 16
  %z = alloca [5 x i64], align 16
  %zmone = alloca [5 x i64], align 16
  %e = alloca [32 x i8], align 16
  %0 = bitcast [5 x i64]* %bp to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false)
  %1 = bitcast [5 x i64]* %x to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false)
  %2 = bitcast [5 x i64]* %z to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false)
  %3 = bitcast [5 x i64]* %zmone to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false)
  %e1 = bitcast [32 x i8]* %e to i8*
  call void @llvm.var.annotation(i8* %e1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0), i32 503, i8* null)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %_secret, i64 32, i1 false)
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 0
  %4 = load i8, i8* %arrayidx, align 16
  %conv = zext i8 %4 to i32
  %and = and i32 %conv, 248
  %conv2 = trunc i32 %and to i8
  store i8 %conv2, i8* %arrayidx, align 16
  %arrayidx3 = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 31
  %5 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %5 to i32
  %and5 = and i32 %conv4, 127
  %conv6 = trunc i32 %and5 to i8
  store i8 %conv6, i8* %arrayidx3, align 1
  %arrayidx7 = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 31
  %6 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %6 to i32
  %or = or i32 %conv8, 64
  %conv9 = trunc i32 %or to i8
  store i8 %conv9, i8* %arrayidx7, align 1
  %arraydecay10 = getelementptr inbounds [5 x i64], [5 x i64]* %bp, i64 0, i64 0
  call void @fexpand(i64* noundef %arraydecay10, i8* noundef %basepoint)
  %arraydecay11 = getelementptr inbounds [5 x i64], [5 x i64]* %x, i64 0, i64 0
  %arraydecay12 = getelementptr inbounds [5 x i64], [5 x i64]* %z, i64 0, i64 0
  %arraydecay13 = getelementptr inbounds [32 x i8], [32 x i8]* %e, i64 0, i64 0
  %arraydecay14 = getelementptr inbounds [5 x i64], [5 x i64]* %bp, i64 0, i64 0
  call void @cmult(i64* noundef %arraydecay11, i64* noundef %arraydecay12, i8* noundef %arraydecay13, i64* noundef %arraydecay14)
  %arraydecay15 = getelementptr inbounds [5 x i64], [5 x i64]* %zmone, i64 0, i64 0
  %arraydecay16 = getelementptr inbounds [5 x i64], [5 x i64]* %z, i64 0, i64 0
  call void @crecip(i64* noundef %arraydecay15, i64* noundef %arraydecay16)
  %arraydecay17 = getelementptr inbounds [5 x i64], [5 x i64]* %z, i64 0, i64 0
  %arraydecay18 = getelementptr inbounds [5 x i64], [5 x i64]* %x, i64 0, i64 0
  %arraydecay19 = getelementptr inbounds [5 x i64], [5 x i64]* %zmone, i64 0, i64 0
  call void @fmul(i64* noundef %arraydecay17, i64* noundef %arraydecay18, i64* noundef %arraydecay19)
  %arraydecay20 = getelementptr inbounds [5 x i64], [5 x i64]* %z, i64 0, i64 0
  call void @fcontract(i8* noundef %mypublic, i64* noundef %arraydecay20)
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #3

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { inaccessiblememonly nofree nosync nounwind willreturn }

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
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}

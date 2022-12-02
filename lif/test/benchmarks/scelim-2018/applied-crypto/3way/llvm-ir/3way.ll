; ModuleID = 'llvm-ir/3way.ll'
source_filename = "lib/3way.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.twy_ctx = type { [3 x i32], [3 x i32], [12 x i32], [12 x i32] }

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @mu(i32* noundef %a) #0 {
entry:
  %b = alloca [3 x i32], align 4
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  store i32 0, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  store i32 0, i32* %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  store i32 0, i32* %arrayidx2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 32
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %0 = load i32, i32* %arrayidx3, align 4
  %shl = shl i32 %0, 1
  store i32 %shl, i32* %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %1 = load i32, i32* %arrayidx4, align 4
  %shl5 = shl i32 %1, 1
  store i32 %shl5, i32* %arrayidx4, align 4
  %arrayidx6 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %2 = load i32, i32* %arrayidx6, align 4
  %shl7 = shl i32 %2, 1
  store i32 %shl7, i32* %arrayidx6, align 4
  %arrayidx8 = getelementptr inbounds i32, i32* %a, i64 0
  %3 = load i32, i32* %arrayidx8, align 4
  %and = and i32 %3, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %4 = load i32, i32* %arrayidx9, align 4
  %or = or i32 %4, 1
  store i32 %or, i32* %arrayidx9, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %arrayidx10 = getelementptr inbounds i32, i32* %a, i64 1
  %5 = load i32, i32* %arrayidx10, align 4
  %and11 = and i32 %5, 1
  %tobool12 = icmp ne i32 %and11, 0
  br i1 %tobool12, label %if.then13, label %if.end16

if.then13:                                        ; preds = %if.end
  %arrayidx14 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %6 = load i32, i32* %arrayidx14, align 4
  %or15 = or i32 %6, 1
  store i32 %or15, i32* %arrayidx14, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then13, %if.end
  %arrayidx17 = getelementptr inbounds i32, i32* %a, i64 2
  %7 = load i32, i32* %arrayidx17, align 4
  %and18 = and i32 %7, 1
  %tobool19 = icmp ne i32 %and18, 0
  br i1 %tobool19, label %if.then20, label %if.end23

if.then20:                                        ; preds = %if.end16
  %arrayidx21 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %8 = load i32, i32* %arrayidx21, align 4
  %or22 = or i32 %8, 1
  store i32 %or22, i32* %arrayidx21, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then20, %if.end16
  %arrayidx24 = getelementptr inbounds i32, i32* %a, i64 0
  %9 = load i32, i32* %arrayidx24, align 4
  %shr = ashr i32 %9, 1
  store i32 %shr, i32* %arrayidx24, align 4
  %arrayidx25 = getelementptr inbounds i32, i32* %a, i64 1
  %10 = load i32, i32* %arrayidx25, align 4
  %shr26 = ashr i32 %10, 1
  store i32 %shr26, i32* %arrayidx25, align 4
  %arrayidx27 = getelementptr inbounds i32, i32* %a, i64 2
  %11 = load i32, i32* %arrayidx27, align 4
  %shr28 = ashr i32 %11, 1
  store i32 %shr28, i32* %arrayidx27, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end23
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %arrayidx29 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %12 = load i32, i32* %arrayidx29, align 4
  %arrayidx30 = getelementptr inbounds i32, i32* %a, i64 0
  store i32 %12, i32* %arrayidx30, align 4
  %arrayidx31 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %13 = load i32, i32* %arrayidx31, align 4
  %arrayidx32 = getelementptr inbounds i32, i32* %a, i64 1
  store i32 %13, i32* %arrayidx32, align 4
  %arrayidx33 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %14 = load i32, i32* %arrayidx33, align 4
  %arrayidx34 = getelementptr inbounds i32, i32* %a, i64 2
  store i32 %14, i32* %arrayidx34, align 4
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @gamma(i32* noundef %a) #0 {
entry:
  %b = alloca [3 x i32], align 4
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 0
  %0 = load i32, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i32, i32* %a, i64 1
  %1 = load i32, i32* %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds i32, i32* %a, i64 2
  %2 = load i32, i32* %arrayidx2, align 4
  %neg = xor i32 %2, -1
  %or = or i32 %1, %neg
  %xor = xor i32 %0, %or
  %arrayidx3 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  store i32 %xor, i32* %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds i32, i32* %a, i64 1
  %3 = load i32, i32* %arrayidx4, align 4
  %arrayidx5 = getelementptr inbounds i32, i32* %a, i64 2
  %4 = load i32, i32* %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds i32, i32* %a, i64 0
  %5 = load i32, i32* %arrayidx6, align 4
  %neg7 = xor i32 %5, -1
  %or8 = or i32 %4, %neg7
  %xor9 = xor i32 %3, %or8
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  store i32 %xor9, i32* %arrayidx10, align 4
  %arrayidx11 = getelementptr inbounds i32, i32* %a, i64 2
  %6 = load i32, i32* %arrayidx11, align 4
  %arrayidx12 = getelementptr inbounds i32, i32* %a, i64 0
  %7 = load i32, i32* %arrayidx12, align 4
  %arrayidx13 = getelementptr inbounds i32, i32* %a, i64 1
  %8 = load i32, i32* %arrayidx13, align 4
  %neg14 = xor i32 %8, -1
  %or15 = or i32 %7, %neg14
  %xor16 = xor i32 %6, %or15
  %arrayidx17 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  store i32 %xor16, i32* %arrayidx17, align 4
  %arrayidx18 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %9 = load i32, i32* %arrayidx18, align 4
  %arrayidx19 = getelementptr inbounds i32, i32* %a, i64 0
  store i32 %9, i32* %arrayidx19, align 4
  %arrayidx20 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %10 = load i32, i32* %arrayidx20, align 4
  %arrayidx21 = getelementptr inbounds i32, i32* %a, i64 1
  store i32 %10, i32* %arrayidx21, align 4
  %arrayidx22 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %11 = load i32, i32* %arrayidx22, align 4
  %arrayidx23 = getelementptr inbounds i32, i32* %a, i64 2
  store i32 %11, i32* %arrayidx23, align 4
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @theta(i32* noundef %a) #0 {
entry:
  %b = alloca [3 x i32], align 4
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 0
  %0 = load i32, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i32, i32* %a, i64 0
  %1 = load i32, i32* %arrayidx1, align 4
  %shr = ashr i32 %1, 16
  %xor = xor i32 %0, %shr
  %arrayidx2 = getelementptr inbounds i32, i32* %a, i64 1
  %2 = load i32, i32* %arrayidx2, align 4
  %shl = shl i32 %2, 16
  %xor3 = xor i32 %xor, %shl
  %arrayidx4 = getelementptr inbounds i32, i32* %a, i64 1
  %3 = load i32, i32* %arrayidx4, align 4
  %shr5 = ashr i32 %3, 16
  %xor6 = xor i32 %xor3, %shr5
  %arrayidx7 = getelementptr inbounds i32, i32* %a, i64 2
  %4 = load i32, i32* %arrayidx7, align 4
  %shl8 = shl i32 %4, 16
  %xor9 = xor i32 %xor6, %shl8
  %arrayidx10 = getelementptr inbounds i32, i32* %a, i64 1
  %5 = load i32, i32* %arrayidx10, align 4
  %shr11 = ashr i32 %5, 24
  %xor12 = xor i32 %xor9, %shr11
  %arrayidx13 = getelementptr inbounds i32, i32* %a, i64 2
  %6 = load i32, i32* %arrayidx13, align 4
  %shl14 = shl i32 %6, 8
  %xor15 = xor i32 %xor12, %shl14
  %arrayidx16 = getelementptr inbounds i32, i32* %a, i64 2
  %7 = load i32, i32* %arrayidx16, align 4
  %shr17 = ashr i32 %7, 8
  %xor18 = xor i32 %xor15, %shr17
  %arrayidx19 = getelementptr inbounds i32, i32* %a, i64 0
  %8 = load i32, i32* %arrayidx19, align 4
  %shl20 = shl i32 %8, 24
  %xor21 = xor i32 %xor18, %shl20
  %arrayidx22 = getelementptr inbounds i32, i32* %a, i64 2
  %9 = load i32, i32* %arrayidx22, align 4
  %shr23 = ashr i32 %9, 16
  %xor24 = xor i32 %xor21, %shr23
  %arrayidx25 = getelementptr inbounds i32, i32* %a, i64 0
  %10 = load i32, i32* %arrayidx25, align 4
  %shl26 = shl i32 %10, 16
  %xor27 = xor i32 %xor24, %shl26
  %arrayidx28 = getelementptr inbounds i32, i32* %a, i64 2
  %11 = load i32, i32* %arrayidx28, align 4
  %shr29 = ashr i32 %11, 24
  %xor30 = xor i32 %xor27, %shr29
  %arrayidx31 = getelementptr inbounds i32, i32* %a, i64 0
  %12 = load i32, i32* %arrayidx31, align 4
  %shl32 = shl i32 %12, 8
  %xor33 = xor i32 %xor30, %shl32
  %arrayidx34 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  store i32 %xor33, i32* %arrayidx34, align 4
  %arrayidx35 = getelementptr inbounds i32, i32* %a, i64 1
  %13 = load i32, i32* %arrayidx35, align 4
  %arrayidx36 = getelementptr inbounds i32, i32* %a, i64 1
  %14 = load i32, i32* %arrayidx36, align 4
  %shr37 = ashr i32 %14, 16
  %xor38 = xor i32 %13, %shr37
  %arrayidx39 = getelementptr inbounds i32, i32* %a, i64 2
  %15 = load i32, i32* %arrayidx39, align 4
  %shl40 = shl i32 %15, 16
  %xor41 = xor i32 %xor38, %shl40
  %arrayidx42 = getelementptr inbounds i32, i32* %a, i64 2
  %16 = load i32, i32* %arrayidx42, align 4
  %shr43 = ashr i32 %16, 16
  %xor44 = xor i32 %xor41, %shr43
  %arrayidx45 = getelementptr inbounds i32, i32* %a, i64 0
  %17 = load i32, i32* %arrayidx45, align 4
  %shl46 = shl i32 %17, 16
  %xor47 = xor i32 %xor44, %shl46
  %arrayidx48 = getelementptr inbounds i32, i32* %a, i64 2
  %18 = load i32, i32* %arrayidx48, align 4
  %shr49 = ashr i32 %18, 24
  %xor50 = xor i32 %xor47, %shr49
  %arrayidx51 = getelementptr inbounds i32, i32* %a, i64 0
  %19 = load i32, i32* %arrayidx51, align 4
  %shl52 = shl i32 %19, 8
  %xor53 = xor i32 %xor50, %shl52
  %arrayidx54 = getelementptr inbounds i32, i32* %a, i64 0
  %20 = load i32, i32* %arrayidx54, align 4
  %shr55 = ashr i32 %20, 8
  %xor56 = xor i32 %xor53, %shr55
  %arrayidx57 = getelementptr inbounds i32, i32* %a, i64 1
  %21 = load i32, i32* %arrayidx57, align 4
  %shl58 = shl i32 %21, 24
  %xor59 = xor i32 %xor56, %shl58
  %arrayidx60 = getelementptr inbounds i32, i32* %a, i64 0
  %22 = load i32, i32* %arrayidx60, align 4
  %shr61 = ashr i32 %22, 16
  %xor62 = xor i32 %xor59, %shr61
  %arrayidx63 = getelementptr inbounds i32, i32* %a, i64 1
  %23 = load i32, i32* %arrayidx63, align 4
  %shl64 = shl i32 %23, 16
  %xor65 = xor i32 %xor62, %shl64
  %arrayidx66 = getelementptr inbounds i32, i32* %a, i64 0
  %24 = load i32, i32* %arrayidx66, align 4
  %shr67 = ashr i32 %24, 24
  %xor68 = xor i32 %xor65, %shr67
  %arrayidx69 = getelementptr inbounds i32, i32* %a, i64 1
  %25 = load i32, i32* %arrayidx69, align 4
  %shl70 = shl i32 %25, 8
  %xor71 = xor i32 %xor68, %shl70
  %arrayidx72 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  store i32 %xor71, i32* %arrayidx72, align 4
  %arrayidx73 = getelementptr inbounds i32, i32* %a, i64 2
  %26 = load i32, i32* %arrayidx73, align 4
  %arrayidx74 = getelementptr inbounds i32, i32* %a, i64 2
  %27 = load i32, i32* %arrayidx74, align 4
  %shr75 = ashr i32 %27, 16
  %xor76 = xor i32 %26, %shr75
  %arrayidx77 = getelementptr inbounds i32, i32* %a, i64 0
  %28 = load i32, i32* %arrayidx77, align 4
  %shl78 = shl i32 %28, 16
  %xor79 = xor i32 %xor76, %shl78
  %arrayidx80 = getelementptr inbounds i32, i32* %a, i64 0
  %29 = load i32, i32* %arrayidx80, align 4
  %shr81 = ashr i32 %29, 16
  %xor82 = xor i32 %xor79, %shr81
  %arrayidx83 = getelementptr inbounds i32, i32* %a, i64 1
  %30 = load i32, i32* %arrayidx83, align 4
  %shl84 = shl i32 %30, 16
  %xor85 = xor i32 %xor82, %shl84
  %arrayidx86 = getelementptr inbounds i32, i32* %a, i64 0
  %31 = load i32, i32* %arrayidx86, align 4
  %shr87 = ashr i32 %31, 24
  %xor88 = xor i32 %xor85, %shr87
  %arrayidx89 = getelementptr inbounds i32, i32* %a, i64 1
  %32 = load i32, i32* %arrayidx89, align 4
  %shl90 = shl i32 %32, 8
  %xor91 = xor i32 %xor88, %shl90
  %arrayidx92 = getelementptr inbounds i32, i32* %a, i64 1
  %33 = load i32, i32* %arrayidx92, align 4
  %shr93 = ashr i32 %33, 8
  %xor94 = xor i32 %xor91, %shr93
  %arrayidx95 = getelementptr inbounds i32, i32* %a, i64 2
  %34 = load i32, i32* %arrayidx95, align 4
  %shl96 = shl i32 %34, 24
  %xor97 = xor i32 %xor94, %shl96
  %arrayidx98 = getelementptr inbounds i32, i32* %a, i64 1
  %35 = load i32, i32* %arrayidx98, align 4
  %shr99 = ashr i32 %35, 16
  %xor100 = xor i32 %xor97, %shr99
  %arrayidx101 = getelementptr inbounds i32, i32* %a, i64 2
  %36 = load i32, i32* %arrayidx101, align 4
  %shl102 = shl i32 %36, 16
  %xor103 = xor i32 %xor100, %shl102
  %arrayidx104 = getelementptr inbounds i32, i32* %a, i64 1
  %37 = load i32, i32* %arrayidx104, align 4
  %shr105 = ashr i32 %37, 24
  %xor106 = xor i32 %xor103, %shr105
  %arrayidx107 = getelementptr inbounds i32, i32* %a, i64 2
  %38 = load i32, i32* %arrayidx107, align 4
  %shl108 = shl i32 %38, 8
  %xor109 = xor i32 %xor106, %shl108
  %arrayidx110 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  store i32 %xor109, i32* %arrayidx110, align 4
  %arrayidx111 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %39 = load i32, i32* %arrayidx111, align 4
  %arrayidx112 = getelementptr inbounds i32, i32* %a, i64 0
  store i32 %39, i32* %arrayidx112, align 4
  %arrayidx113 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %40 = load i32, i32* %arrayidx113, align 4
  %arrayidx114 = getelementptr inbounds i32, i32* %a, i64 1
  store i32 %40, i32* %arrayidx114, align 4
  %arrayidx115 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %41 = load i32, i32* %arrayidx115, align 4
  %arrayidx116 = getelementptr inbounds i32, i32* %a, i64 2
  store i32 %41, i32* %arrayidx116, align 4
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @pi_1(i32* noundef %a) #0 {
entry:
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 0
  %0 = load i32, i32* %arrayidx, align 4
  %shr = ashr i32 %0, 10
  %arrayidx1 = getelementptr inbounds i32, i32* %a, i64 0
  %1 = load i32, i32* %arrayidx1, align 4
  %shl = shl i32 %1, 22
  %xor = xor i32 %shr, %shl
  %arrayidx2 = getelementptr inbounds i32, i32* %a, i64 0
  store i32 %xor, i32* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds i32, i32* %a, i64 2
  %2 = load i32, i32* %arrayidx3, align 4
  %shl4 = shl i32 %2, 1
  %arrayidx5 = getelementptr inbounds i32, i32* %a, i64 2
  %3 = load i32, i32* %arrayidx5, align 4
  %shr6 = ashr i32 %3, 31
  %xor7 = xor i32 %shl4, %shr6
  %arrayidx8 = getelementptr inbounds i32, i32* %a, i64 2
  store i32 %xor7, i32* %arrayidx8, align 4
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @pi_2(i32* noundef %a) #0 {
entry:
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 0
  %0 = load i32, i32* %arrayidx, align 4
  %shl = shl i32 %0, 1
  %arrayidx1 = getelementptr inbounds i32, i32* %a, i64 0
  %1 = load i32, i32* %arrayidx1, align 4
  %shr = ashr i32 %1, 31
  %xor = xor i32 %shl, %shr
  %arrayidx2 = getelementptr inbounds i32, i32* %a, i64 0
  store i32 %xor, i32* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds i32, i32* %a, i64 2
  %2 = load i32, i32* %arrayidx3, align 4
  %shr4 = ashr i32 %2, 10
  %arrayidx5 = getelementptr inbounds i32, i32* %a, i64 2
  %3 = load i32, i32* %arrayidx5, align 4
  %shl6 = shl i32 %3, 22
  %xor7 = xor i32 %shr4, %shl6
  %arrayidx8 = getelementptr inbounds i32, i32* %a, i64 2
  store i32 %xor7, i32* %arrayidx8, align 4
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @rho(i32* noundef %a) #0 {
entry:
  call void @theta(i32* noundef %a)
  call void @pi_1(i32* noundef %a)
  call void @gamma(i32* noundef %a)
  call void @pi_2(i32* noundef %a)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @rndcon_gen(i32 noundef %strt, i32* noundef %rtab) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %strt.addr.0 = phi i32 [ %strt, %entry ], [ %strt.addr.1, %for.inc ]
  %cmp = icmp sle i32 %i.0, 11
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, i32* %rtab, i64 %idxprom
  store i32 %strt.addr.0, i32* %arrayidx, align 4
  %shl = shl i32 %strt.addr.0, 1
  %and = and i32 %shl, 65536
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %xor = xor i32 %shl, 69649
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %strt.addr.1 = phi i32 [ %xor, %if.then ], [ %shl, %for.body ]
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @encrypt(%struct.twy_ctx* noundef %c, i32* noundef %a) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 11
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %k = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %k, i64 0, i64 0
  %0 = load i32, i32* %arrayidx, align 4
  %ercon = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 2
  %idxprom = sext i32 %i.0 to i64
  %arrayidx1 = getelementptr inbounds [12 x i32], [12 x i32]* %ercon, i64 0, i64 %idxprom
  %1 = load i32, i32* %arrayidx1, align 4
  %shl = shl i32 %1, 16
  %xor = xor i32 %0, %shl
  %arrayidx2 = getelementptr inbounds i32, i32* %a, i64 0
  %2 = load i32, i32* %arrayidx2, align 4
  %xor3 = xor i32 %2, %xor
  store i32 %xor3, i32* %arrayidx2, align 4
  %k4 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* %k4, i64 0, i64 1
  %3 = load i32, i32* %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds i32, i32* %a, i64 1
  %4 = load i32, i32* %arrayidx6, align 4
  %xor7 = xor i32 %4, %3
  store i32 %xor7, i32* %arrayidx6, align 4
  %k8 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %k8, i64 0, i64 2
  %5 = load i32, i32* %arrayidx9, align 4
  %ercon10 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 2
  %idxprom11 = sext i32 %i.0 to i64
  %arrayidx12 = getelementptr inbounds [12 x i32], [12 x i32]* %ercon10, i64 0, i64 %idxprom11
  %6 = load i32, i32* %arrayidx12, align 4
  %xor13 = xor i32 %5, %6
  %arrayidx14 = getelementptr inbounds i32, i32* %a, i64 2
  %7 = load i32, i32* %arrayidx14, align 4
  %xor15 = xor i32 %7, %xor13
  store i32 %xor15, i32* %arrayidx14, align 4
  call void @rho(i32* noundef %a)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %k16 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx17 = getelementptr inbounds [3 x i32], [3 x i32]* %k16, i64 0, i64 0
  %8 = load i32, i32* %arrayidx17, align 4
  %ercon18 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 2
  %arrayidx19 = getelementptr inbounds [12 x i32], [12 x i32]* %ercon18, i64 0, i64 11
  %9 = load i32, i32* %arrayidx19, align 4
  %shl20 = shl i32 %9, 16
  %xor21 = xor i32 %8, %shl20
  %arrayidx22 = getelementptr inbounds i32, i32* %a, i64 0
  %10 = load i32, i32* %arrayidx22, align 4
  %xor23 = xor i32 %10, %xor21
  store i32 %xor23, i32* %arrayidx22, align 4
  %k24 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx25 = getelementptr inbounds [3 x i32], [3 x i32]* %k24, i64 0, i64 1
  %11 = load i32, i32* %arrayidx25, align 4
  %arrayidx26 = getelementptr inbounds i32, i32* %a, i64 1
  %12 = load i32, i32* %arrayidx26, align 4
  %xor27 = xor i32 %12, %11
  store i32 %xor27, i32* %arrayidx26, align 4
  %k28 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx29 = getelementptr inbounds [3 x i32], [3 x i32]* %k28, i64 0, i64 2
  %13 = load i32, i32* %arrayidx29, align 4
  %ercon30 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 2
  %arrayidx31 = getelementptr inbounds [12 x i32], [12 x i32]* %ercon30, i64 0, i64 11
  %14 = load i32, i32* %arrayidx31, align 4
  %xor32 = xor i32 %13, %14
  %arrayidx33 = getelementptr inbounds i32, i32* %a, i64 2
  %15 = load i32, i32* %arrayidx33, align 4
  %xor34 = xor i32 %15, %xor32
  store i32 %xor34, i32* %arrayidx33, align 4
  call void @theta(i32* noundef %a)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @twy_key(i32* noundef %key, %struct.twy_ctx* noundef %c) #0 {
entry:
  %arrayidx = getelementptr inbounds i32, i32* %key, i64 0
  %0 = load i32, i32* %arrayidx, align 4
  %k = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx1 = getelementptr inbounds [3 x i32], [3 x i32]* %k, i64 0, i64 0
  store i32 %0, i32* %arrayidx1, align 4
  %ki = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 1
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %ki, i64 0, i64 0
  store i32 %0, i32* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds i32, i32* %key, i64 1
  %1 = load i32, i32* %arrayidx3, align 4
  %k4 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* %k4, i64 0, i64 1
  store i32 %1, i32* %arrayidx5, align 4
  %ki6 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 1
  %arrayidx7 = getelementptr inbounds [3 x i32], [3 x i32]* %ki6, i64 0, i64 1
  store i32 %1, i32* %arrayidx7, align 4
  %arrayidx8 = getelementptr inbounds i32, i32* %key, i64 2
  %2 = load i32, i32* %arrayidx8, align 4
  %k9 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 0
  %arrayidx10 = getelementptr inbounds [3 x i32], [3 x i32]* %k9, i64 0, i64 2
  store i32 %2, i32* %arrayidx10, align 4
  %ki11 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 1
  %arrayidx12 = getelementptr inbounds [3 x i32], [3 x i32]* %ki11, i64 0, i64 2
  store i32 %2, i32* %arrayidx12, align 4
  %ki13 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 1
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %ki13, i64 0, i64 0
  call void @theta(i32* noundef %arraydecay)
  %ki14 = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 1
  %arraydecay15 = getelementptr inbounds [3 x i32], [3 x i32]* %ki14, i64 0, i64 0
  call void @mu(i32* noundef %arraydecay15)
  %ercon = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 2
  %arraydecay16 = getelementptr inbounds [12 x i32], [12 x i32]* %ercon, i64 0, i64 0
  call void @rndcon_gen(i32 noundef 2827, i32* noundef %arraydecay16)
  %drcon = getelementptr inbounds %struct.twy_ctx, %struct.twy_ctx* %c, i32 0, i32 3
  %arraydecay17 = getelementptr inbounds [12 x i32], [12 x i32]* %drcon, i64 0, i64 0
  call void @rndcon_gen(i32 noundef 45489, i32* noundef %arraydecay17)
  ret void
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

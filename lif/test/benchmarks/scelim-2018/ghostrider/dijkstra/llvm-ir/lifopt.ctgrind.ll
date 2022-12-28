; ModuleID = 'llvm-ir/lif.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"[16 x i32]ptr.wrapped.ty" = type { [16 x i32]*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [15 x i8] c"lib/dijkstra.c\00", section "llvm.metadata"
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32* @x to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.4, i32 0, i32 0), i32 16, i8* null }], section "llvm.metadata"
@x = dso_local global i32 0, align 4
@.str.3 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.4 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @dijkstra(i32 noundef %n, i32 noundef %s, i32 noundef %t, %"[16 x i32]ptr.wrapped.ty"* nocapture noundef readonly %e) local_unnamed_addr #0 {
entry:
  %pred.alloca68 = alloca i1, align 1
  store i1 true, i1* %pred.alloca68, align 1
  %pred.alloca50 = alloca i1, align 1
  store i1 true, i1* %pred.alloca50, align 1
  %pred.alloca = alloca i1, align 1
  store i1 false, i1* %pred.alloca, align 1
  %0 = getelementptr inbounds %"[16 x i32]ptr.wrapped.ty", %"[16 x i32]ptr.wrapped.ty"* %e, i64 0, i32 0
  %e.unwrapped = load [16 x i32]*, [16 x i32]** %0, align 8
  %vis = alloca [16 x i32], align 16
  %dis = alloca [16 x i32], align 16
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %_zzq_args10 = alloca [6 x i64], align 16
  %_zzq_result11 = alloca i64, align 8
  %vis1 = bitcast [16 x i32]* %vis to i8*
  call void @llvm.var.annotation(i8* nonnull %vis1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 10, i8* null)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) %vis1, i8 0, i64 64, i1 false)
  %dis2 = bitcast [16 x i32]* %dis to i8*
  call void @llvm.var.annotation(i8* nonnull %dis2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 11, i8* null)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) %dis2, i8 0, i64 64, i1 false)
  %idxprom = sext i32 %s to i64
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom
  store i32 1, i32* %arrayidx, align 4
  %arrayidx3 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx3, align 16
  %1 = ptrtoint [16 x i32]* %vis to i64
  %arrayidx4 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %1, i64* %arrayidx4, align 8
  %arrayidx5 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 64, i64* %arrayidx5, align 16
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx7, align 16
  %arrayidx8 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx8, align 8
  %2 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx3, i64 0) #4, !srcloc !6
  store volatile i64 %2, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx12 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx12, align 16
  %3 = ptrtoint [16 x i32]* %dis to i64
  %arrayidx14 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 1
  store volatile i64 %3, i64* %arrayidx14, align 8
  %arrayidx15 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 2
  store volatile i64 64, i64* %arrayidx15, align 16
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx16, align 8
  %arrayidx17 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx17, align 16
  %arrayidx18 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx18, align 8
  %4 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx12, i64 0) #4, !srcloc !7
  store volatile i64 %4, i64* %_zzq_result11, align 8
  %_zzq_result11.0._zzq_result11.0._zzq_result11.0. = load volatile i64, i64* %_zzq_result11, align 8
  %shadow.sroa.0 = alloca i32, align 8
  store i32 0, i32* %shadow.sroa.0, align 8
  %cmp22 = icmp sgt i32 %n, 0
  br i1 %cmp22, label %for.body.preheader, label %for.end81

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 8
  br i1 %min.iters.check, label %for.body.preheader67, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %scevgep = getelementptr [16 x i32], [16 x i32]* %dis, i64 0, i64 %wide.trip.count
  %scevgep62 = getelementptr [16 x i32], [16 x i32]* %e.unwrapped, i64 %idxprom, i64 0
  %scevgep64 = getelementptr [16 x i32], [16 x i32]* %e.unwrapped, i64 %idxprom, i64 %wide.trip.count
  %5 = bitcast i32* %scevgep64 to [16 x i32]*
  %bound0 = icmp ult [16 x i32]* %dis, %5
  %bound1 = icmp ult i32* %scevgep62, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.preheader67, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %wide.trip.count, 4294967288
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %6 = getelementptr inbounds [16 x i32], [16 x i32]* %e.unwrapped, i64 %idxprom, i64 %index
  %7 = bitcast i32* %6 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %7, align 4, !alias.scope !8
  %8 = getelementptr inbounds i32, i32* %6, i64 4
  %9 = bitcast i32* %8 to <4 x i32>*
  %wide.load66 = load <4 x i32>, <4 x i32>* %9, align 4, !alias.scope !8
  %10 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %index
  %11 = bitcast i32* %10 to <4 x i32>*
  store <4 x i32> %wide.load, <4 x i32>* %11, align 16, !alias.scope !11, !noalias !8
  %12 = getelementptr inbounds i32, i32* %10, i64 4
  %13 = bitcast i32* %12 to <4 x i32>*
  store <4 x i32> %wide.load66, <4 x i32>* %13, align 16, !alias.scope !11, !noalias !8
  %index.next = add nuw i64 %index, 8
  %14 = icmp eq i64 %index.next, %n.vec
  br i1 %14, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond28.preheader, label %for.body.preheader67

for.body.preheader67:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond28.preheader:                             ; preds = %for.body, %middle.block
  br i1 %cmp22, label %for.cond31.preheader.lr.ph, label %for.end81

for.cond31.preheader.lr.ph:                       ; preds = %for.cond28.preheader
  %x.val = load i32, i32* @x, align 4
  %wide.trip.count50 = zext i32 %n to i64
  %shadow.sroa.0.0.sroa_cast57 = bitcast i32* %shadow.sroa.0 to i1*
  %wide.trip.count54 = zext i32 %n to i64
  %shadow.sroa.0.0.sroa_cast59 = bitcast i32* %shadow.sroa.0 to i1*
  br label %for.body33.preheader

for.body:                                         ; preds = %for.body.preheader67, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader67 ]
  %arrayidx24 = getelementptr inbounds [16 x i32], [16 x i32]* %e.unwrapped, i64 %idxprom, i64 %indvars.iv
  %15 = load i32, i32* %arrayidx24, align 4
  %arrayidx26 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %indvars.iv
  store i32 %15, i32* %arrayidx26, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond28.preheader, label %for.body, !llvm.loop !16

for.body33.preheader:                             ; preds = %for.end78, %for.cond31.preheader.lr.ph
  %cond.fold3544 = phi i1 [ true, %for.cond31.preheader.lr.ph ], [ %cond.fold74, %for.end78 ]
  %i27.0.rewritten43 = phi i32 [ 0, %for.cond31.preheader.lr.ph ], [ %inc80, %for.end78 ]
  %bestj.0.rewritten42 = phi i32 [ -1, %for.cond31.preheader.lr.ph ], [ %phi.fold113, %for.end78 ]
  %out.26.041 = phi i1 [ false, %for.cond31.preheader.lr.ph ], [ %cond.fold74, %for.end78 ]
  %out.19.040 = phi i1 [ false, %for.cond31.preheader.lr.ph ], [ %cond.fold56, %for.end78 ]
  %cond.fold3925 = or i1 %out.19.040, %cond.fold3544
  br label %for.body33

for.body50.lr.ph:                                 ; preds = %for.body33
  %cond.fold6133 = or i1 %out.26.041, %cond.fold56
  %idxprom55 = sext i32 %phi.fold113 to i64
  %arrayidx56 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom55
  %idx1.safe92 = icmp slt i32 %phi.fold113, 16
  br label %for.body50

for.body33:                                       ; preds = %for.body33.preheader, %for.body33
  %indvars.iv48 = phi i64 [ 0, %for.body33.preheader ], [ %indvars.iv.next49, %for.body33 ]
  %cond.fold3929 = phi i1 [ %cond.fold3925, %for.body33.preheader ], [ %cond.fold56, %for.body33 ]
  %bestj.1.rewritten27 = phi i32 [ %bestj.0.rewritten42, %for.body33.preheader ], [ %phi.fold113, %for.body33 ]
  %arrayidx35 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %indvars.iv48
  %16 = load i32, i32* %arrayidx35, align 4
  %tobool = icmp ne i32 %16, 0
  %17 = xor i1 %tobool, true
  %in.42 = and i1 %cond.fold3929, %17
  %cmp36 = icmp slt i32 %bestj.1.rewritten27, 0
  %18 = xor i1 %cmp36, true
  %in.44 = and i1 %in.42, %18
  %arrayidx38 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %indvars.iv48
  %idx1.safe82 = icmp ult i64 %indvars.iv48, 16
  %19 = or i1 %idx1.safe82, %in.44
  %ctsel84 = select i1 %19, i32* %arrayidx38, i32* %shadow.sroa.0
  %20 = load i32, i32* %ctsel84, align 4
  %idxprom39 = sext i32 %bestj.1.rewritten27 to i64
  %arrayidx40 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom39
  %idx1.safe85 = icmp slt i32 %bestj.1.rewritten27, 16
  %21 = or i1 %idx1.safe85, %in.44
  %ctsel87 = select i1 %21, i32* %arrayidx40, i32* %shadow.sroa.0
  %22 = load i32, i32* %ctsel87, align 4
  %cmp41 = icmp slt i32 %20, %22
  %ctsel88 = select i1 %in.44, i1* %pred.alloca, i1* %shadow.sroa.0.0.sroa_cast57
  %23 = load i1, i1* %ctsel88, align 1
  %select.val.89 = select i1 %in.44, i1 %cmp41, i1 %23
  store i1 %select.val.89, i1* %ctsel88, align 1
  %ctsel90 = select i1 %in.44, i1* %pred.alloca50, i1* %shadow.sroa.0.0.sroa_cast57
  %24 = load i1, i1* %ctsel90, align 1
  %select.val.91 = select i1 %in.44, i1 %cmp41, i1 %24
  store i1 %select.val.91, i1* %ctsel90, align 1
  %pred.alloca.0.pred.alloca.0.pred.alloca.0.pred.load = load i1, i1* %pred.alloca, align 1
  %in.46 = and i1 %in.44, %pred.alloca.0.pred.alloca.0.pred.alloca.0.pred.load
  %in.47 = and i1 %cmp36, %in.42
  %cond.fold49 = or i1 %in.47, %in.46
  %shadow.sroa.0.0.shadow.sroa.0.0.shadow.sroa.0.val = load i32, i32* %shadow.sroa.0, align 8
  %25 = select i1 %cond.fold49, i32 %x.val, i32 %shadow.sroa.0.0.shadow.sroa.0.0.shadow.sroa.0.val
  %26 = trunc i64 %indvars.iv48 to i32
  %add = add nsw i32 %25, %26
  %idxprom42 = sext i32 %add to i64
  %arrayidx43 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom42
  %idx1.safe = icmp slt i32 %add, 16
  %27 = or i1 %cond.fold49, %idx1.safe
  %ctsel81 = select i1 %27, i32* %arrayidx43, i32* %shadow.sroa.0
  %28 = load i32, i32* %ctsel81, align 4
  %select.val. = select i1 %cond.fold49, i32 1, i32 %28
  store i32 %select.val., i32* %ctsel81, align 4
  %pred.alloca50.0.pred.alloca50.0.pred.alloca50.0.pred.load51 = load i1, i1* %pred.alloca50, align 1
  %29 = xor i1 %pred.alloca50.0.pred.alloca50.0.pred.alloca50.0.pred.load51, true
  %in.52 = and i1 %in.44, %29
  %in.53 = and i1 %cond.fold3929, %tobool
  %30 = select i1 %in.52, i1 true, i1 %in.53
  %phi.fold113 = select i1 %30, i32 %bestj.1.rewritten27, i32 %add
  %cond.fold55 = or i1 %in.53, %in.52
  %cond.fold56 = or i1 %cond.fold49, %cond.fold55
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51.not = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51.not, label %for.body50.lr.ph, label %for.body33, !llvm.loop !17

for.body50:                                       ; preds = %for.body50.lr.ph, %for.body50
  %indvars.iv52 = phi i64 [ 0, %for.body50.lr.ph ], [ %indvars.iv.next53, %for.body50 ]
  %cond.fold6136 = phi i1 [ %cond.fold6133, %for.body50.lr.ph ], [ %cond.fold74, %for.body50 ]
  %arrayidx52 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %indvars.iv52
  %31 = load i32, i32* %arrayidx52, align 4
  %tobool53 = icmp ne i32 %31, 0
  %32 = xor i1 %tobool53, true
  %in.64 = and i1 %cond.fold6136, %32
  %33 = or i1 %idx1.safe92, %in.64
  %ctsel94 = select i1 %33, i32* %arrayidx56, i32* %shadow.sroa.0
  %34 = load i32, i32* %ctsel94, align 4
  %arrayidx60 = getelementptr inbounds [16 x i32], [16 x i32]* %e.unwrapped, i64 %idxprom55, i64 %indvars.iv52
  %idx1.safe95 = icmp ult i64 %indvars.iv52, 16
  %35 = or i1 %idx1.safe95, %in.64
  %ctsel97 = select i1 %35, i32* %arrayidx60, i32* %shadow.sroa.0
  %36 = load i32, i32* %ctsel97, align 4
  %add61 = add nsw i32 %36, %34
  %arrayidx63 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %indvars.iv52
  %ctsel100 = select i1 %35, i32* %arrayidx63, i32* %shadow.sroa.0
  %37 = load i32, i32* %ctsel100, align 4
  %cmp64 = icmp slt i32 %add61, %37
  %ctsel101 = select i1 %in.64, i1* %pred.alloca68, i1* %shadow.sroa.0.0.sroa_cast59
  %38 = load i1, i1* %ctsel101, align 1
  %select.val.102 = select i1 %in.64, i1 %cmp64, i1 %38
  store i1 %select.val.102, i1* %ctsel101, align 1
  %in.66 = and i1 %in.64, %cmp64
  %39 = or i1 %idx1.safe92, %in.66
  %ctsel105 = select i1 %39, i32* %arrayidx56, i32* %shadow.sroa.0
  %40 = load i32, i32* %ctsel105, align 4
  %41 = or i1 %idx1.safe95, %in.66
  %ctsel108 = select i1 %41, i32* %arrayidx60, i32* %shadow.sroa.0
  %42 = load i32, i32* %ctsel108, align 4
  %add72 = add nsw i32 %42, %40
  %ctsel111 = select i1 %41, i32* %arrayidx63, i32* %shadow.sroa.0
  %43 = load i32, i32* %ctsel111, align 4
  %select.val.112 = select i1 %in.66, i32 %add72, i32 %43
  store i32 %select.val.112, i32* %ctsel111, align 4
  %pred.alloca68.0.pred.alloca68.0.pred.alloca68.0.pred.load69 = load i1, i1* %pred.alloca68, align 1
  %44 = xor i1 %pred.alloca68.0.pred.alloca68.0.pred.alloca68.0.pred.load69, true
  %in.70 = and i1 %in.64, %44
  %in.71 = and i1 %cond.fold6136, %tobool53
  %cond.fold73 = or i1 %in.71, %in.66
  %cond.fold74 = or i1 %cond.fold73, %in.70
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55.not = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55.not, label %for.end78, label %for.body50, !llvm.loop !18

for.end78:                                        ; preds = %for.body50
  %inc80 = add nuw nsw i32 %i27.0.rewritten43, 1
  %exitcond56.not = icmp eq i32 %inc80, %n
  br i1 %exitcond56.not, label %for.end81, label %for.body33.preheader, !llvm.loop !19

for.end81:                                        ; preds = %for.end78, %entry, %for.cond28.preheader
  %idxprom82 = sext i32 %t to i64
  %arrayidx83 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom82
  %45 = load i32, i32* %arrayidx83, align 4
  ret i32 %45
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %arraydecay42.wrapped = alloca %"[16 x i32]ptr.wrapped.ty", align 8
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %in = alloca [16 x [16 x i32]], align 16
  %_zzq_args22 = alloca [6 x i64], align 16
  %_zzq_result23 = alloca i64, align 8
  %_zzq_args32 = alloca [6 x i64], align 16
  %_zzq_result33 = alloca i64, align 8
  %r = alloca i32, align 4
  %call = tail call i64 @read(i32 noundef 0, i8* noundef bitcast (i32* @x to i8*), i64 noundef 4) #4
  %0 = load i32, i32* @x, align 4
  %sub = and i32 %0, -256
  store i32 %sub, i32* @x, align 4
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %conv2 = sext i32 %sub to i64
  %arrayidx3 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %conv2, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 4, i64* %arrayidx4, align 16
  %arrayidx5 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx6, align 16
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx7, align 8
  %1 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx, i64 0) #4, !srcloc !20
  store volatile i64 %1, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  %in9 = bitcast [16 x [16 x i32]]* %in to i8*
  call void @llvm.var.annotation(i8* nonnull %in9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.4, i64 0, i64 0), i32 25, i8* null)
  br label %for.cond11.preheader

for.cond11.preheader:                             ; preds = %entry, %for.end
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.end ]
  br label %for.body14

for.body14:                                       ; preds = %for.cond11.preheader, %for.body14
  %indvars.iv = phi i64 [ 0, %for.cond11.preheader ], [ %indvars.iv.next, %for.body14 ]
  %arrayidx17 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %in, i64 0, i64 %indvars.iv11, i64 %indvars.iv
  %2 = bitcast i32* %arrayidx17 to i8*
  %call18 = call i64 @read(i32 noundef 0, i8* noundef nonnull %2, i64 noundef 4) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 16
  br i1 %exitcond.not, label %for.end, label %for.body14, !llvm.loop !21

for.end:                                          ; preds = %for.body14
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13.not = icmp eq i64 %indvars.iv.next12, 16
  br i1 %exitcond13.not, label %for.end21, label %for.cond11.preheader, !llvm.loop !22

for.end21:                                        ; preds = %for.end
  %arrayidx24 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args22, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx24, align 16
  %arrayidx25 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args22, i64 0, i64 1
  store volatile i64 ptrtoint (i32* @x to i64), i64* %arrayidx25, align 8
  %arrayidx26 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args22, i64 0, i64 2
  store volatile i64 4, i64* %arrayidx26, align 16
  %arrayidx27 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args22, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx27, align 8
  %arrayidx28 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args22, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx28, align 16
  %arrayidx29 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args22, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx29, align 8
  %3 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx24, i64 0) #4, !srcloc !23
  store volatile i64 %3, i64* %_zzq_result23, align 8
  %_zzq_result23.0._zzq_result23.0._zzq_result23.0. = load volatile i64, i64* %_zzq_result23, align 8
  %arrayidx34 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx34, align 16
  %arraydecay = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %in, i64 0, i64 0
  %4 = ptrtoint [16 x [16 x i32]]* %in to i64
  %arrayidx35 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 1
  store volatile i64 %4, i64* %arrayidx35, align 8
  %arrayidx36 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 2
  store volatile i64 1024, i64* %arrayidx36, align 16
  %arrayidx37 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx37, align 8
  %arrayidx38 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx38, align 16
  %arrayidx39 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx39, align 8
  %5 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx34, i64 0) #4, !srcloc !24
  store volatile i64 %5, i64* %_zzq_result33, align 8
  %_zzq_result33.0._zzq_result33.0._zzq_result33.0. = load volatile i64, i64* %_zzq_result33, align 8
  %arraydecay42.unwrapped = getelementptr inbounds %"[16 x i32]ptr.wrapped.ty", %"[16 x i32]ptr.wrapped.ty"* %arraydecay42.wrapped, i64 0, i32 0
  %arraydecay42.wrapped.field0.length.ptr = getelementptr inbounds %"[16 x i32]ptr.wrapped.ty", %"[16 x i32]ptr.wrapped.ty"* %arraydecay42.wrapped, i64 0, i32 1
  store i64 256, i64* %arraydecay42.wrapped.field0.length.ptr, align 8
  store [16 x i32]* %arraydecay, [16 x i32]** %arraydecay42.unwrapped, align 8
  %call43 = call i32 @dijkstra(i32 16, i32 0, i32 15, %"[16 x i32]ptr.wrapped.ty"* nonnull %arraydecay42.wrapped)
  store i32 %call43, i32* %r, align 4
  %6 = bitcast i32* %r to i8*
  %call44 = call i64 @write(i32 noundef 1, i8* noundef nonnull %6, i64 noundef 4) #4
  ret i32 0
}

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #3

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 14.0.6"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{i64 2147941460, i64 2147941496, i64 2147941564}
!7 = !{i64 2147943071, i64 2147943107, i64 2147943175}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!"llvm.loop.isvectorized", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !14}
!20 = !{i64 2148115033, i64 2148115069, i64 2148115137}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !14}
!23 = !{i64 2148116671, i64 2148116707, i64 2148116775}
!24 = !{i64 2148118297, i64 2148118333, i64 2148118401}

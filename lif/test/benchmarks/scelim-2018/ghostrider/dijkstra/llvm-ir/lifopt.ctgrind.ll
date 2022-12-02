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

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
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
  %vis1 = bitcast [16 x i32]* %vis to i8*
  call void @llvm.var.annotation(i8* nonnull %vis1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 10, i8* null)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) %vis1, i8 0, i64 64, i1 false)
  %dis2 = bitcast [16 x i32]* %dis to i8*
  call void @llvm.var.annotation(i8* nonnull %dis2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 11, i8* null)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) %dis2, i8 0, i64 64, i1 false)
  %idxprom = sext i32 %s to i64
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom
  store i32 1, i32* %arrayidx, align 4
  %shadow.sroa.0 = alloca i32, align 8
  store i32 0, i32* %shadow.sroa.0, align 8
  %cmp22 = icmp sgt i32 %n, 0
  br i1 %cmp22, label %for.body.preheader, label %for.end63

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 8
  br i1 %min.iters.check, label %for.body.preheader67, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %scevgep = getelementptr [16 x i32], [16 x i32]* %dis, i64 0, i64 %wide.trip.count
  %scevgep62 = getelementptr [16 x i32], [16 x i32]* %e.unwrapped, i64 %idxprom, i64 0
  %scevgep64 = getelementptr [16 x i32], [16 x i32]* %e.unwrapped, i64 %idxprom, i64 %wide.trip.count
  %1 = bitcast i32* %scevgep64 to [16 x i32]*
  %bound0 = icmp ult [16 x i32]* %dis, %1
  %bound1 = icmp ult i32* %scevgep62, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.preheader67, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %wide.trip.count, 4294967288
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %2 = getelementptr inbounds [16 x i32], [16 x i32]* %e.unwrapped, i64 %idxprom, i64 %index
  %3 = bitcast i32* %2 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %3, align 4, !alias.scope !6
  %4 = getelementptr inbounds i32, i32* %2, i64 4
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load66 = load <4 x i32>, <4 x i32>* %5, align 4, !alias.scope !6
  %6 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %index
  %7 = bitcast i32* %6 to <4 x i32>*
  store <4 x i32> %wide.load, <4 x i32>* %7, align 16, !alias.scope !9, !noalias !6
  %8 = getelementptr inbounds i32, i32* %6, i64 4
  %9 = bitcast i32* %8 to <4 x i32>*
  store <4 x i32> %wide.load66, <4 x i32>* %9, align 16, !alias.scope !9, !noalias !6
  %index.next = add nuw i64 %index, 8
  %10 = icmp eq i64 %index.next, %n.vec
  br i1 %10, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond10.preheader, label %for.body.preheader67

for.body.preheader67:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond10.preheader:                             ; preds = %for.body, %middle.block
  br i1 %cmp22, label %for.cond13.preheader.lr.ph, label %for.end63

for.cond13.preheader.lr.ph:                       ; preds = %for.cond10.preheader
  %x.val = load i32, i32* @x, align 4
  %wide.trip.count50 = zext i32 %n to i64
  %shadow.sroa.0.0.sroa_cast57 = bitcast i32* %shadow.sroa.0 to i1*
  %wide.trip.count54 = zext i32 %n to i64
  %shadow.sroa.0.0.sroa_cast59 = bitcast i32* %shadow.sroa.0 to i1*
  br label %for.body15.preheader

for.body:                                         ; preds = %for.body.preheader67, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader67 ]
  %arrayidx6 = getelementptr inbounds [16 x i32], [16 x i32]* %e.unwrapped, i64 %idxprom, i64 %indvars.iv
  %11 = load i32, i32* %arrayidx6, align 4
  %arrayidx8 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %indvars.iv
  store i32 %11, i32* %arrayidx8, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond10.preheader, label %for.body, !llvm.loop !14

for.body15.preheader:                             ; preds = %for.end60, %for.cond13.preheader.lr.ph
  %cond.fold3544 = phi i1 [ true, %for.cond13.preheader.lr.ph ], [ %cond.fold74, %for.end60 ]
  %i9.0.rewritten43 = phi i32 [ 0, %for.cond13.preheader.lr.ph ], [ %inc62, %for.end60 ]
  %bestj.0.rewritten42 = phi i32 [ -1, %for.cond13.preheader.lr.ph ], [ %phi.fold113, %for.end60 ]
  %out.26.041 = phi i1 [ false, %for.cond13.preheader.lr.ph ], [ %cond.fold74, %for.end60 ]
  %out.19.040 = phi i1 [ false, %for.cond13.preheader.lr.ph ], [ %cond.fold56, %for.end60 ]
  %cond.fold3925 = or i1 %out.19.040, %cond.fold3544
  br label %for.body15

for.body32.lr.ph:                                 ; preds = %for.body15
  %cond.fold6133 = or i1 %out.26.041, %cond.fold56
  %idxprom37 = sext i32 %phi.fold113 to i64
  %arrayidx38 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom37
  %idx1.safe92 = icmp slt i32 %phi.fold113, 16
  br label %for.body32

for.body15:                                       ; preds = %for.body15.preheader, %for.body15
  %indvars.iv48 = phi i64 [ 0, %for.body15.preheader ], [ %indvars.iv.next49, %for.body15 ]
  %cond.fold3929 = phi i1 [ %cond.fold3925, %for.body15.preheader ], [ %cond.fold56, %for.body15 ]
  %bestj.1.rewritten27 = phi i32 [ %bestj.0.rewritten42, %for.body15.preheader ], [ %phi.fold113, %for.body15 ]
  %arrayidx17 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %indvars.iv48
  %12 = load i32, i32* %arrayidx17, align 4
  %tobool = icmp ne i32 %12, 0
  %13 = xor i1 %tobool, true
  %in.42 = and i1 %cond.fold3929, %13
  %cmp18 = icmp slt i32 %bestj.1.rewritten27, 0
  %14 = xor i1 %cmp18, true
  %in.44 = and i1 %in.42, %14
  %arrayidx20 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %indvars.iv48
  %idx1.safe82 = icmp ult i64 %indvars.iv48, 16
  %15 = or i1 %idx1.safe82, %in.44
  %ctsel84 = select i1 %15, i32* %arrayidx20, i32* %shadow.sroa.0
  %16 = load i32, i32* %ctsel84, align 4
  %idxprom21 = sext i32 %bestj.1.rewritten27 to i64
  %arrayidx22 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom21
  %idx1.safe85 = icmp slt i32 %bestj.1.rewritten27, 16
  %17 = or i1 %idx1.safe85, %in.44
  %ctsel87 = select i1 %17, i32* %arrayidx22, i32* %shadow.sroa.0
  %18 = load i32, i32* %ctsel87, align 4
  %cmp23 = icmp slt i32 %16, %18
  %ctsel88 = select i1 %in.44, i1* %pred.alloca, i1* %shadow.sroa.0.0.sroa_cast57
  %19 = load i1, i1* %ctsel88, align 1
  %select.val.89 = select i1 %in.44, i1 %cmp23, i1 %19
  store i1 %select.val.89, i1* %ctsel88, align 1
  %ctsel90 = select i1 %in.44, i1* %pred.alloca50, i1* %shadow.sroa.0.0.sroa_cast57
  %20 = load i1, i1* %ctsel90, align 1
  %select.val.91 = select i1 %in.44, i1 %cmp23, i1 %20
  store i1 %select.val.91, i1* %ctsel90, align 1
  %pred.alloca.0.pred.alloca.0.pred.alloca.0.pred.load = load i1, i1* %pred.alloca, align 1
  %in.46 = and i1 %in.44, %pred.alloca.0.pred.alloca.0.pred.alloca.0.pred.load
  %in.47 = and i1 %cmp18, %in.42
  %cond.fold49 = or i1 %in.47, %in.46
  %shadow.sroa.0.0.shadow.sroa.0.0.shadow.sroa.0.val = load i32, i32* %shadow.sroa.0, align 8
  %21 = select i1 %cond.fold49, i32 %x.val, i32 %shadow.sroa.0.0.shadow.sroa.0.0.shadow.sroa.0.val
  %22 = trunc i64 %indvars.iv48 to i32
  %add = add nsw i32 %21, %22
  %idxprom24 = sext i32 %add to i64
  %arrayidx25 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom24
  %idx1.safe = icmp slt i32 %add, 16
  %23 = or i1 %cond.fold49, %idx1.safe
  %ctsel81 = select i1 %23, i32* %arrayidx25, i32* %shadow.sroa.0
  %24 = load i32, i32* %ctsel81, align 4
  %select.val. = select i1 %cond.fold49, i32 1, i32 %24
  store i32 %select.val., i32* %ctsel81, align 4
  %pred.alloca50.0.pred.alloca50.0.pred.alloca50.0.pred.load51 = load i1, i1* %pred.alloca50, align 1
  %25 = xor i1 %pred.alloca50.0.pred.alloca50.0.pred.alloca50.0.pred.load51, true
  %in.52 = and i1 %in.44, %25
  %in.53 = and i1 %cond.fold3929, %tobool
  %26 = select i1 %in.52, i1 true, i1 %in.53
  %phi.fold113 = select i1 %26, i32 %bestj.1.rewritten27, i32 %add
  %cond.fold55 = or i1 %cond.fold49, %in.52
  %cond.fold56 = or i1 %in.53, %cond.fold55
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51.not = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51.not, label %for.body32.lr.ph, label %for.body15, !llvm.loop !15

for.body32:                                       ; preds = %for.body32.lr.ph, %for.body32
  %indvars.iv52 = phi i64 [ 0, %for.body32.lr.ph ], [ %indvars.iv.next53, %for.body32 ]
  %cond.fold6136 = phi i1 [ %cond.fold6133, %for.body32.lr.ph ], [ %cond.fold74, %for.body32 ]
  %arrayidx34 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %indvars.iv52
  %27 = load i32, i32* %arrayidx34, align 4
  %tobool35 = icmp ne i32 %27, 0
  %28 = xor i1 %tobool35, true
  %in.64 = and i1 %cond.fold6136, %28
  %29 = or i1 %idx1.safe92, %in.64
  %ctsel94 = select i1 %29, i32* %arrayidx38, i32* %shadow.sroa.0
  %30 = load i32, i32* %ctsel94, align 4
  %arrayidx42 = getelementptr inbounds [16 x i32], [16 x i32]* %e.unwrapped, i64 %idxprom37, i64 %indvars.iv52
  %idx1.safe95 = icmp ult i64 %indvars.iv52, 16
  %31 = or i1 %idx1.safe95, %in.64
  %ctsel97 = select i1 %31, i32* %arrayidx42, i32* %shadow.sroa.0
  %32 = load i32, i32* %ctsel97, align 4
  %add43 = add nsw i32 %32, %30
  %arrayidx45 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %indvars.iv52
  %ctsel100 = select i1 %31, i32* %arrayidx45, i32* %shadow.sroa.0
  %33 = load i32, i32* %ctsel100, align 4
  %cmp46 = icmp slt i32 %add43, %33
  %ctsel101 = select i1 %in.64, i1* %pred.alloca68, i1* %shadow.sroa.0.0.sroa_cast59
  %34 = load i1, i1* %ctsel101, align 1
  %select.val.102 = select i1 %in.64, i1 %cmp46, i1 %34
  store i1 %select.val.102, i1* %ctsel101, align 1
  %in.66 = and i1 %in.64, %cmp46
  %35 = or i1 %idx1.safe92, %in.66
  %ctsel105 = select i1 %35, i32* %arrayidx38, i32* %shadow.sroa.0
  %36 = load i32, i32* %ctsel105, align 4
  %37 = or i1 %idx1.safe95, %in.66
  %ctsel108 = select i1 %37, i32* %arrayidx42, i32* %shadow.sroa.0
  %38 = load i32, i32* %ctsel108, align 4
  %add54 = add nsw i32 %38, %36
  %ctsel111 = select i1 %37, i32* %arrayidx45, i32* %shadow.sroa.0
  %39 = load i32, i32* %ctsel111, align 4
  %select.val.112 = select i1 %in.66, i32 %add54, i32 %39
  store i32 %select.val.112, i32* %ctsel111, align 4
  %pred.alloca68.0.pred.alloca68.0.pred.alloca68.0.pred.load69 = load i1, i1* %pred.alloca68, align 1
  %40 = xor i1 %pred.alloca68.0.pred.alloca68.0.pred.alloca68.0.pred.load69, true
  %in.70 = and i1 %in.64, %40
  %in.71 = and i1 %cond.fold6136, %tobool35
  %cond.fold73 = or i1 %in.71, %in.70
  %cond.fold74 = or i1 %in.66, %cond.fold73
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55.not = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55.not, label %for.end60, label %for.body32, !llvm.loop !16

for.end60:                                        ; preds = %for.body32
  %inc62 = add nuw nsw i32 %i9.0.rewritten43, 1
  %exitcond56.not = icmp eq i32 %inc62, %n
  br i1 %exitcond56.not, label %for.end63, label %for.body15.preheader, !llvm.loop !17

for.end63:                                        ; preds = %for.end60, %entry, %for.cond10.preheader
  %idxprom64 = sext i32 %t to i64
  %arrayidx65 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom64
  %41 = load i32, i32* %arrayidx65, align 4
  ret i32 %41
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #3 {
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
  %call = tail call i64 @read(i32 noundef 0, i8* noundef bitcast (i32* @x to i8*), i64 noundef 4) #5
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
  %1 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx, i64 0) #5, !srcloc !18
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
  %call18 = call i64 @read(i32 noundef 0, i8* noundef nonnull %2, i64 noundef 4) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 16
  br i1 %exitcond.not, label %for.end, label %for.body14, !llvm.loop !19

for.end:                                          ; preds = %for.body14
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13.not = icmp eq i64 %indvars.iv.next12, 16
  br i1 %exitcond13.not, label %for.end21, label %for.cond11.preheader, !llvm.loop !20

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
  %3 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx24, i64 0) #5, !srcloc !21
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
  %5 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx34, i64 0) #5, !srcloc !22
  store volatile i64 %5, i64* %_zzq_result33, align 8
  %_zzq_result33.0._zzq_result33.0._zzq_result33.0. = load volatile i64, i64* %_zzq_result33, align 8
  %arraydecay42.unwrapped = getelementptr inbounds %"[16 x i32]ptr.wrapped.ty", %"[16 x i32]ptr.wrapped.ty"* %arraydecay42.wrapped, i64 0, i32 0
  %arraydecay42.wrapped.field0.length.ptr = getelementptr inbounds %"[16 x i32]ptr.wrapped.ty", %"[16 x i32]ptr.wrapped.ty"* %arraydecay42.wrapped, i64 0, i32 1
  store i64 256, i64* %arraydecay42.wrapped.field0.length.ptr, align 8
  store [16 x i32]* %arraydecay, [16 x i32]** %arraydecay42.unwrapped, align 8
  %call43 = call i32 @dijkstra(i32 16, i32 0, i32 15, %"[16 x i32]ptr.wrapped.ty"* nonnull %arraydecay42.wrapped)
  store i32 %call43, i32* %r, align 4
  %6 = bitcast i32* %r to i8*
  %call44 = call i64 @write(i32 noundef 1, i8* noundef nonnull %6, i64 noundef 4) #5
  ret i32 0
}

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #4

attributes #0 = { nofree noinline nosync nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 14.0.6"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.isvectorized", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
!18 = !{i64 2148115033, i64 2148115069, i64 2148115137}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
!21 = !{i64 2148116671, i64 2148116707, i64 2148116775}
!22 = !{i64 2148118297, i64 2148118333, i64 2148118401}

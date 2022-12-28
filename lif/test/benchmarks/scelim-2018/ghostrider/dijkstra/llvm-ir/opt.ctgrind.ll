; ModuleID = 'llvm-ir/base.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [15 x i8] c"lib/dijkstra.c\00", section "llvm.metadata"
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32* @x to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.4, i32 0, i32 0), i32 16, i8* null }], section "llvm.metadata"
@x = dso_local global i32 0, align 4
@.str.3 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.4 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @dijkstra(i32 noundef %n, i32 noundef %s, i32 noundef %t, [16 x i32]* nocapture noundef readonly %e) local_unnamed_addr #0 {
entry:
  %vis = alloca [16 x i32], align 16
  %dis = alloca [16 x i32], align 16
  %dis33 = bitcast [16 x i32]* %dis to i8*
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %_zzq_args10 = alloca [6 x i64], align 16
  %_zzq_result11 = alloca i64, align 8
  %vis1 = bitcast [16 x i32]* %vis to i8*
  call void @llvm.var.annotation(i8* nonnull %vis1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 10, i8* null)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) %vis1, i8 0, i64 64, i1 false)
  call void @llvm.var.annotation(i8* nonnull %dis33, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 11, i8* null)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) %dis33, i8 0, i64 64, i1 false)
  %idxprom = sext i32 %s to i64
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom
  store i32 1, i32* %arrayidx, align 4
  %arrayidx3 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx3, align 16
  %0 = ptrtoint [16 x i32]* %vis to i64
  %arrayidx4 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %0, i64* %arrayidx4, align 8
  %arrayidx5 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 64, i64* %arrayidx5, align 16
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx7, align 16
  %arrayidx8 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx8, align 8
  %1 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx3, i64 0) #5, !srcloc !6
  store volatile i64 %1, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx12 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx12, align 16
  %2 = ptrtoint [16 x i32]* %dis to i64
  %arrayidx14 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 1
  store volatile i64 %2, i64* %arrayidx14, align 8
  %arrayidx15 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 2
  store volatile i64 64, i64* %arrayidx15, align 16
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx16, align 8
  %arrayidx17 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx17, align 16
  %arrayidx18 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx18, align 8
  %3 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx12, i64 0) #5, !srcloc !7
  store volatile i64 %3, i64* %_zzq_result11, align 8
  %_zzq_result11.0._zzq_result11.0._zzq_result11.0. = load volatile i64, i64* %_zzq_result11, align 8
  %cmp2 = icmp sgt i32 %n, 0
  br i1 %cmp2, label %for.cond31.preheader.lr.ph, label %for.end81

for.cond31.preheader.lr.ph:                       ; preds = %entry
  %scevgep = getelementptr [16 x i32], [16 x i32]* %e, i64 %idxprom, i64 0
  %scevgep34 = bitcast i32* %scevgep to i8*
  %4 = zext i32 %n to i64
  %5 = shl nuw nsw i64 %4, 2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %dis33, i8* align 4 %scevgep34, i64 %5, i1 false)
  %6 = load i32, i32* @x, align 4
  %7 = sext i32 %6 to i64
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond31.preheader.us.us

for.cond31.preheader.us.us:                       ; preds = %for.cond31.preheader.lr.ph, %for.cond48.for.inc79_crit_edge.us.us
  %i27.011.us.us = phi i32 [ %inc80.us.us, %for.cond48.for.inc79_crit_edge.us.us ], [ 0, %for.cond31.preheader.lr.ph ]
  %bestj.010.us.us = phi i32 [ %bestj.2.us.us, %for.cond48.for.inc79_crit_edge.us.us ], [ -1, %for.cond31.preheader.lr.ph ]
  br label %for.body33.us.us

for.body50.us.us:                                 ; preds = %for.cond31.for.cond48.preheader_crit_edge.us.us, %for.inc76.us.us
  %indvars.iv38 = phi i64 [ 0, %for.cond31.for.cond48.preheader_crit_edge.us.us ], [ %indvars.iv.next39, %for.inc76.us.us ]
  %arrayidx52.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %indvars.iv38
  %8 = load i32, i32* %arrayidx52.us.us, align 4
  %tobool53.not.us.us = icmp eq i32 %8, 0
  br i1 %tobool53.not.us.us, label %land.lhs.true54.us.us, label %for.inc76.us.us

land.lhs.true54.us.us:                            ; preds = %for.body50.us.us
  %9 = load i32, i32* %arrayidx56.us.us, align 4
  %arrayidx60.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %e, i64 %idxprom55.us.us, i64 %indvars.iv38
  %10 = load i32, i32* %arrayidx60.us.us, align 4
  %add61.us.us = add nsw i32 %10, %9
  %arrayidx63.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %indvars.iv38
  %11 = load i32, i32* %arrayidx63.us.us, align 4
  %cmp64.us.us = icmp slt i32 %add61.us.us, %11
  br i1 %cmp64.us.us, label %if.then65.us.us, label %for.inc76.us.us

if.then65.us.us:                                  ; preds = %land.lhs.true54.us.us
  store i32 %add61.us.us, i32* %arrayidx63.us.us, align 4
  br label %for.inc76.us.us

for.inc76.us.us:                                  ; preds = %if.then65.us.us, %land.lhs.true54.us.us, %for.body50.us.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond42.not = icmp eq i64 %indvars.iv.next39, %wide.trip.count
  br i1 %exitcond42.not, label %for.cond48.for.inc79_crit_edge.us.us, label %for.body50.us.us, !llvm.loop !8

for.body33.us.us:                                 ; preds = %for.inc44.us.us, %for.cond31.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc44.us.us ], [ 0, %for.cond31.preheader.us.us ]
  %bestj.15.us.us = phi i32 [ %bestj.2.us.us, %for.inc44.us.us ], [ %bestj.010.us.us, %for.cond31.preheader.us.us ]
  %arrayidx35.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %indvars.iv
  %12 = load i32, i32* %arrayidx35.us.us, align 4
  %tobool.not.us.us = icmp eq i32 %12, 0
  br i1 %tobool.not.us.us, label %land.lhs.true.us.us, label %for.inc44.us.us

land.lhs.true.us.us:                              ; preds = %for.body33.us.us
  %cmp36.us.us = icmp slt i32 %bestj.15.us.us, 0
  br i1 %cmp36.us.us, label %if.then.us.us, label %lor.lhs.false.us.us

lor.lhs.false.us.us:                              ; preds = %land.lhs.true.us.us
  %arrayidx38.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %indvars.iv
  %13 = load i32, i32* %arrayidx38.us.us, align 4
  %idxprom391.us.us = zext i32 %bestj.15.us.us to i64
  %arrayidx40.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom391.us.us
  %14 = load i32, i32* %arrayidx40.us.us, align 4
  %cmp41.us.us = icmp slt i32 %13, %14
  br i1 %cmp41.us.us, label %if.then.us.us, label %for.inc44.us.us

if.then.us.us:                                    ; preds = %lor.lhs.false.us.us, %land.lhs.true.us.us
  %15 = add nsw i64 %indvars.iv, %7
  %arrayidx43.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %15
  store i32 1, i32* %arrayidx43.us.us, align 4
  %16 = trunc i64 %15 to i32
  br label %for.inc44.us.us

for.inc44.us.us:                                  ; preds = %if.then.us.us, %lor.lhs.false.us.us, %for.body33.us.us
  %bestj.2.us.us = phi i32 [ %bestj.15.us.us, %for.body33.us.us ], [ %16, %if.then.us.us ], [ %bestj.15.us.us, %lor.lhs.false.us.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond31.for.cond48.preheader_crit_edge.us.us, label %for.body33.us.us, !llvm.loop !10

for.cond31.for.cond48.preheader_crit_edge.us.us:  ; preds = %for.inc44.us.us
  %idxprom55.us.us = sext i32 %bestj.2.us.us to i64
  %arrayidx56.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom55.us.us
  br label %for.body50.us.us

for.cond48.for.inc79_crit_edge.us.us:             ; preds = %for.inc76.us.us
  %inc80.us.us = add nuw nsw i32 %i27.011.us.us, 1
  %exitcond43.not = icmp eq i32 %inc80.us.us, %n
  br i1 %exitcond43.not, label %for.end81, label %for.cond31.preheader.us.us, !llvm.loop !11

for.end81:                                        ; preds = %for.cond48.for.inc79_crit_edge.us.us, %entry
  %idxprom82 = sext i32 %t to i64
  %arrayidx83 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom82
  %17 = load i32, i32* %arrayidx83, align 4
  ret i32 %17
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
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
  %1 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx, i64 0) #5, !srcloc !12
  store volatile i64 %1, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  %in9 = bitcast [16 x [16 x i32]]* %in to i8*
  call void @llvm.var.annotation(i8* nonnull %in9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.4, i64 0, i64 0), i32 25, i8* null)
  br label %for.cond11.preheader

for.cond11.preheader:                             ; preds = %entry, %for.inc19
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.inc19 ]
  br label %for.body14

for.body14:                                       ; preds = %for.cond11.preheader, %for.body14
  %indvars.iv = phi i64 [ 0, %for.cond11.preheader ], [ %indvars.iv.next, %for.body14 ]
  %arrayidx17 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %in, i64 0, i64 %indvars.iv4, i64 %indvars.iv
  %2 = bitcast i32* %arrayidx17 to i8*
  %call18 = call i64 @read(i32 noundef 0, i8* noundef nonnull %2, i64 noundef 4) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 16
  br i1 %exitcond.not, label %for.inc19, label %for.body14, !llvm.loop !13

for.inc19:                                        ; preds = %for.body14
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond7.not = icmp eq i64 %indvars.iv.next5, 16
  br i1 %exitcond7.not, label %for.end21, label %for.cond11.preheader, !llvm.loop !14

for.end21:                                        ; preds = %for.inc19
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
  %3 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx24, i64 0) #5, !srcloc !15
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
  %5 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx34, i64 0) #5, !srcloc !16
  store volatile i64 %5, i64* %_zzq_result33, align 8
  %_zzq_result33.0._zzq_result33.0._zzq_result33.0. = load volatile i64, i64* %_zzq_result33, align 8
  %call43 = call i32 @dijkstra(i32 noundef 16, i32 noundef 0, i32 noundef 15, [16 x i32]* noundef nonnull %arraydecay)
  store i32 %call43, i32* %r, align 4
  %6 = bitcast i32* %r to i8*
  %call44 = call i64 @write(i32 noundef 1, i8* noundef nonnull %6, i64 noundef 4) #5
  ret i32 0
}

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

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
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = !{i64 2148115033, i64 2148115069, i64 2148115137}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9}
!15 = !{i64 2148116671, i64 2148116707, i64 2148116775}
!16 = !{i64 2148118297, i64 2148118333, i64 2148118401}

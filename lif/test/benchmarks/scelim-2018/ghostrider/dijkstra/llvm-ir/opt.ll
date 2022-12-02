; ModuleID = 'llvm-ir/base.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [15 x i8] c"lib/dijkstra.c\00", section "llvm.metadata"
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32* @x to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.4, i32 0, i32 0), i32 16, i8* null }], section "llvm.metadata"
@x = dso_local global i32 0, align 4
@.str.3 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.4 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: nofree noinline nosync nounwind sspstrong uwtable
define dso_local i32 @dijkstra(i32 noundef %n, i32 noundef %s, i32 noundef %t, [16 x i32]* nocapture noundef readonly %e) local_unnamed_addr #0 {
entry:
  %vis = alloca [16 x i32], align 16
  %dis = alloca [16 x i32], align 16
  %dis33 = bitcast [16 x i32]* %dis to i8*
  %vis1 = bitcast [16 x i32]* %vis to i8*
  call void @llvm.var.annotation(i8* nonnull %vis1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 10, i8* null)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) %vis1, i8 0, i64 64, i1 false)
  call void @llvm.var.annotation(i8* nonnull %dis33, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i32 11, i8* null)
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(64) %dis33, i8 0, i64 64, i1 false)
  %idxprom = sext i32 %s to i64
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom
  store i32 1, i32* %arrayidx, align 4
  %cmp2 = icmp sgt i32 %n, 0
  br i1 %cmp2, label %for.cond13.preheader.lr.ph, label %for.end63

for.cond13.preheader.lr.ph:                       ; preds = %entry
  %scevgep = getelementptr [16 x i32], [16 x i32]* %e, i64 %idxprom, i64 0
  %scevgep34 = bitcast i32* %scevgep to i8*
  %0 = zext i32 %n to i64
  %1 = shl nuw nsw i64 %0, 2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %dis33, i8* align 4 %scevgep34, i64 %1, i1 false)
  %2 = load i32, i32* @x, align 4
  %3 = sext i32 %2 to i64
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond13.preheader.us.us

for.cond13.preheader.us.us:                       ; preds = %for.cond13.preheader.lr.ph, %for.cond30.for.inc61_crit_edge.us.us
  %i9.011.us.us = phi i32 [ %inc62.us.us, %for.cond30.for.inc61_crit_edge.us.us ], [ 0, %for.cond13.preheader.lr.ph ]
  %bestj.010.us.us = phi i32 [ %bestj.2.us.us, %for.cond30.for.inc61_crit_edge.us.us ], [ -1, %for.cond13.preheader.lr.ph ]
  br label %for.body15.us.us

for.body32.us.us:                                 ; preds = %for.cond13.for.cond30.preheader_crit_edge.us.us, %for.inc58.us.us
  %indvars.iv38 = phi i64 [ 0, %for.cond13.for.cond30.preheader_crit_edge.us.us ], [ %indvars.iv.next39, %for.inc58.us.us ]
  %arrayidx34.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %indvars.iv38
  %4 = load i32, i32* %arrayidx34.us.us, align 4
  %tobool35.not.us.us = icmp eq i32 %4, 0
  br i1 %tobool35.not.us.us, label %land.lhs.true36.us.us, label %for.inc58.us.us

land.lhs.true36.us.us:                            ; preds = %for.body32.us.us
  %5 = load i32, i32* %arrayidx38.us.us, align 4
  %arrayidx42.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %e, i64 %idxprom37.us.us, i64 %indvars.iv38
  %6 = load i32, i32* %arrayidx42.us.us, align 4
  %add43.us.us = add nsw i32 %6, %5
  %arrayidx45.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %indvars.iv38
  %7 = load i32, i32* %arrayidx45.us.us, align 4
  %cmp46.us.us = icmp slt i32 %add43.us.us, %7
  br i1 %cmp46.us.us, label %if.then47.us.us, label %for.inc58.us.us

if.then47.us.us:                                  ; preds = %land.lhs.true36.us.us
  store i32 %add43.us.us, i32* %arrayidx45.us.us, align 4
  br label %for.inc58.us.us

for.inc58.us.us:                                  ; preds = %if.then47.us.us, %land.lhs.true36.us.us, %for.body32.us.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond42.not = icmp eq i64 %indvars.iv.next39, %wide.trip.count
  br i1 %exitcond42.not, label %for.cond30.for.inc61_crit_edge.us.us, label %for.body32.us.us, !llvm.loop !6

for.body15.us.us:                                 ; preds = %for.inc26.us.us, %for.cond13.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc26.us.us ], [ 0, %for.cond13.preheader.us.us ]
  %bestj.15.us.us = phi i32 [ %bestj.2.us.us, %for.inc26.us.us ], [ %bestj.010.us.us, %for.cond13.preheader.us.us ]
  %arrayidx17.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %indvars.iv
  %8 = load i32, i32* %arrayidx17.us.us, align 4
  %tobool.not.us.us = icmp eq i32 %8, 0
  br i1 %tobool.not.us.us, label %land.lhs.true.us.us, label %for.inc26.us.us

land.lhs.true.us.us:                              ; preds = %for.body15.us.us
  %cmp18.us.us = icmp slt i32 %bestj.15.us.us, 0
  br i1 %cmp18.us.us, label %if.then.us.us, label %lor.lhs.false.us.us

lor.lhs.false.us.us:                              ; preds = %land.lhs.true.us.us
  %arrayidx20.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %indvars.iv
  %9 = load i32, i32* %arrayidx20.us.us, align 4
  %idxprom211.us.us = zext i32 %bestj.15.us.us to i64
  %arrayidx22.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom211.us.us
  %10 = load i32, i32* %arrayidx22.us.us, align 4
  %cmp23.us.us = icmp slt i32 %9, %10
  br i1 %cmp23.us.us, label %if.then.us.us, label %for.inc26.us.us

if.then.us.us:                                    ; preds = %lor.lhs.false.us.us, %land.lhs.true.us.us
  %11 = add nsw i64 %indvars.iv, %3
  %arrayidx25.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %11
  store i32 1, i32* %arrayidx25.us.us, align 4
  %12 = trunc i64 %11 to i32
  br label %for.inc26.us.us

for.inc26.us.us:                                  ; preds = %if.then.us.us, %lor.lhs.false.us.us, %for.body15.us.us
  %bestj.2.us.us = phi i32 [ %bestj.15.us.us, %for.body15.us.us ], [ %12, %if.then.us.us ], [ %bestj.15.us.us, %lor.lhs.false.us.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond13.for.cond30.preheader_crit_edge.us.us, label %for.body15.us.us, !llvm.loop !8

for.cond13.for.cond30.preheader_crit_edge.us.us:  ; preds = %for.inc26.us.us
  %idxprom37.us.us = sext i32 %bestj.2.us.us to i64
  %arrayidx38.us.us = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom37.us.us
  br label %for.body32.us.us

for.cond30.for.inc61_crit_edge.us.us:             ; preds = %for.inc58.us.us
  %inc62.us.us = add nuw nsw i32 %i9.011.us.us, 1
  %exitcond43.not = icmp eq i32 %inc62.us.us, %n
  br i1 %exitcond43.not, label %for.end63, label %for.cond13.preheader.us.us, !llvm.loop !9

for.end63:                                        ; preds = %for.cond30.for.inc61_crit_edge.us.us, %entry
  %idxprom64 = sext i32 %t to i64
  %arrayidx65 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom64
  %13 = load i32, i32* %arrayidx65, align 4
  ret i32 %13
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nofree noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #3 {
entry:
  %in = alloca [16 x [16 x i32]], align 16
  %r = alloca i32, align 4
  %call = tail call i64 @read(i32 noundef 0, i8* noundef bitcast (i32* @x to i8*), i64 noundef 4) #6
  %0 = load i32, i32* @x, align 4
  %sub = and i32 %0, -256
  store i32 %sub, i32* @x, align 4
  %in2 = bitcast [16 x [16 x i32]]* %in to i8*
  call void @llvm.var.annotation(i8* nonnull %in2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.4, i64 0, i64 0), i32 25, i8* null)
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %entry, %for.inc11
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.inc11 ]
  br label %for.body7

for.body7:                                        ; preds = %for.cond4.preheader, %for.body7
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next, %for.body7 ]
  %arrayidx9 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %in, i64 0, i64 %indvars.iv4, i64 %indvars.iv
  %1 = bitcast i32* %arrayidx9 to i8*
  %call10 = call i64 @read(i32 noundef 0, i8* noundef nonnull %1, i64 noundef 4) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 16
  br i1 %exitcond.not, label %for.inc11, label %for.body7, !llvm.loop !10

for.inc11:                                        ; preds = %for.body7
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond7.not = icmp eq i64 %indvars.iv.next5, 16
  br i1 %exitcond7.not, label %for.end13, label %for.cond4.preheader, !llvm.loop !11

for.end13:                                        ; preds = %for.inc11
  %arraydecay = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %in, i64 0, i64 0
  %call14 = call i32 @dijkstra(i32 noundef 16, i32 noundef 0, i32 noundef 15, [16 x i32]* noundef nonnull %arraydecay)
  store i32 %call14, i32* %r, align 4
  %2 = bitcast i32* %r to i8*
  %call15 = call i64 @write(i32 noundef 1, i8* noundef nonnull %2, i64 noundef 4) #6
  ret i32 0
}

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

attributes #0 = { nofree noinline nosync nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { nofree noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
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

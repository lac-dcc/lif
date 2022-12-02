; ModuleID = 'llvm-ir/base.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @log_redactor(i8** nocapture noundef readonly %log, i8* nocapture noundef readonly %pattern, i32 noundef %L0, i32 noundef %L1, i32 noundef %P) local_unnamed_addr #0 {
entry:
  %cmp10.not = icmp eq i32 %L0, 0
  br i1 %cmp10.not, label %for.end50, label %for.cond1.preheader.lr.ph

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add i32 %L1, 1
  %add = sub i32 %sub, %P
  %cmp24.not = icmp eq i32 %add, 0
  %cmp228.not41 = icmp eq i32 %L1, 0
  br i1 %cmp24.not, label %for.end50, label %for.cond1.preheader.lr.ph.split.us

for.cond1.preheader.lr.ph.split.us:               ; preds = %for.cond1.preheader.lr.ph
  %cmp13 = icmp eq i32 %P, 0
  br i1 %cmp13, label %for.cond1.preheader.lr.ph.split.us.split, label %for.cond1.preheader.us.us.preheader

for.cond1.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.lr.ph.split.us
  %wide.trip.count55 = zext i32 %L0 to i64
  %wide.trip.count = zext i32 %P to i64
  %wide.trip.count50 = zext i32 %L1 to i64
  br label %for.cond1.preheader.us.us

for.cond1.preheader.us.us:                        ; preds = %for.cond1.preheader.us.us.preheader, %for.inc48.us.us
  %indvars.iv52 = phi i64 [ 0, %for.cond1.preheader.us.us.preheader ], [ %indvars.iv.next53, %for.inc48.us.us ]
  %arrayidx6.us.us = getelementptr inbounds i8*, i8** %log, i64 %indvars.iv52
  %0 = load i8*, i8** %arrayidx6.us.us, align 8
  br label %while.cond.preheader.us.us.us

for.body24.us.us:                                 ; preds = %for.cond1.for.end_crit_edge.split.us.us.us, %for.inc45.us.us.for.body24.us.us_crit_edge
  %1 = phi i8* [ %.pre, %for.inc45.us.us.for.body24.us.us_crit_edge ], [ %0, %for.cond1.for.end_crit_edge.split.us.us.us ]
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.inc45.us.us.for.body24.us.us_crit_edge ], [ 0, %for.cond1.for.end_crit_edge.split.us.us.us ]
  %arrayidx28.us.us = getelementptr inbounds i8, i8* %1, i64 %indvars.iv47
  %2 = load i8, i8* %arrayidx28.us.us, align 1
  %3 = add i8 %2, -48
  %4 = icmp ult i8 %3, 10
  br i1 %4, label %if.then39.us.us, label %for.inc45.us.us

if.then39.us.us:                                  ; preds = %for.body24.us.us
  store i8 42, i8* %arrayidx28.us.us, align 1
  br label %for.inc45.us.us

for.inc45.us.us:                                  ; preds = %if.then39.us.us, %for.body24.us.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond51.not = icmp eq i64 %indvars.iv.next48, %wide.trip.count50
  br i1 %exitcond51.not, label %for.inc48.us.us, label %for.inc45.us.us.for.body24.us.us_crit_edge, !llvm.loop !6

for.inc45.us.us.for.body24.us.us_crit_edge:       ; preds = %for.inc45.us.us
  %.pre = load i8*, i8** %arrayidx6.us.us, align 8
  br label %for.body24.us.us

for.inc48.us.us:                                  ; preds = %for.inc45.us.us, %for.cond1.for.end_crit_edge.split.us.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond56.not = icmp eq i64 %indvars.iv.next53, %wide.trip.count55
  br i1 %exitcond56.not, label %for.end50, label %for.cond1.preheader.us.us, !llvm.loop !8

while.cond.preheader.us.us.us:                    ; preds = %while.end.us.us.us, %for.cond1.preheader.us.us
  %j.06.us.us.us = phi i32 [ 0, %for.cond1.preheader.us.us ], [ %inc17.us.us.us, %while.end.us.us.us ]
  %found.05.us.us.us = phi i32 [ 0, %for.cond1.preheader.us.us ], [ %spec.select.us.us.us, %while.end.us.us.us ]
  br label %while.body.us.us.us

while.body.us.us.us:                              ; preds = %if.end.us.us.us, %while.cond.preheader.us.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us.us.us ], [ 0, %while.cond.preheader.us.us.us ]
  %arrayidx.us.us.us = getelementptr inbounds i8, i8* %pattern, i64 %indvars.iv
  %5 = load i8, i8* %arrayidx.us.us.us, align 1
  %6 = trunc i64 %indvars.iv to i32
  %add7.us.us.us = add i32 %j.06.us.us.us, %6
  %idxprom8.us.us.us = zext i32 %add7.us.us.us to i64
  %arrayidx9.us.us.us = getelementptr inbounds i8, i8* %0, i64 %idxprom8.us.us.us
  %7 = load i8, i8* %arrayidx9.us.us.us, align 1
  %cmp11.not.us.us.us = icmp eq i8 %5, %7
  br i1 %cmp11.not.us.us.us, label %if.end.us.us.us, label %while.end.us.us.us.split.loop.exit69

while.end.us.us.us.split.loop.exit69:             ; preds = %while.body.us.us.us
  %8 = trunc i64 %indvars.iv to i32
  br label %while.end.us.us.us

while.end.us.us.us:                               ; preds = %if.end.us.us.us, %while.end.us.us.us.split.loop.exit69
  %k.0.lcssa.us.us.us = phi i32 [ %8, %while.end.us.us.us.split.loop.exit69 ], [ %P, %if.end.us.us.us ]
  %cmp13.us.us.us = icmp eq i32 %k.0.lcssa.us.us.us, %P
  %spec.select.us.us.us = select i1 %cmp13.us.us.us, i32 1, i32 %found.05.us.us.us
  %inc17.us.us.us = add nuw i32 %j.06.us.us.us, 1
  %exitcond46.not = icmp eq i32 %inc17.us.us.us, %add
  br i1 %exitcond46.not, label %for.cond1.for.end_crit_edge.split.us.us.us, label %while.cond.preheader.us.us.us, !llvm.loop !9

if.end.us.us.us:                                  ; preds = %while.body.us.us.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %while.end.us.us.us, label %while.body.us.us.us, !llvm.loop !10

for.cond1.for.end_crit_edge.split.us.us.us:       ; preds = %while.end.us.us.us
  %tobool.not.us.us = icmp eq i32 %spec.select.us.us.us, 0
  %brmerge = or i1 %tobool.not.us.us, %cmp228.not41
  br i1 %brmerge, label %for.inc48.us.us, label %for.body24.us.us

for.cond1.preheader.lr.ph.split.us.split:         ; preds = %for.cond1.preheader.lr.ph.split.us
  br i1 %cmp228.not41, label %for.end50, label %for.cond1.preheader.us.us21.preheader

for.cond1.preheader.us.us21.preheader:            ; preds = %for.cond1.preheader.lr.ph.split.us.split
  %wide.trip.count66 = zext i32 %L0 to i64
  %wide.trip.count61 = zext i32 %L1 to i64
  br label %for.cond21.preheader.us.us34

for.body24.us.us23:                               ; preds = %for.cond21.preheader.us.us34, %for.inc45.us.us28
  %indvars.iv58 = phi i64 [ 0, %for.cond21.preheader.us.us34 ], [ %indvars.iv.next59, %for.inc45.us.us28 ]
  %9 = load i8*, i8** %arrayidx26.us.us39, align 8
  %arrayidx28.us.us26 = getelementptr inbounds i8, i8* %9, i64 %indvars.iv58
  %10 = load i8, i8* %arrayidx28.us.us26, align 1
  %11 = add i8 %10, -48
  %12 = icmp ult i8 %11, 10
  br i1 %12, label %if.then39.us.us27, label %for.inc45.us.us28

if.then39.us.us27:                                ; preds = %for.body24.us.us23
  store i8 42, i8* %arrayidx28.us.us26, align 1
  br label %for.inc45.us.us28

for.inc45.us.us28:                                ; preds = %if.then39.us.us27, %for.body24.us.us23
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond62.not = icmp eq i64 %indvars.iv.next59, %wide.trip.count61
  br i1 %exitcond62.not, label %for.inc48.us.us31, label %for.body24.us.us23, !llvm.loop !6

for.inc48.us.us31:                                ; preds = %for.inc45.us.us28
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond67.not = icmp eq i64 %indvars.iv.next64, %wide.trip.count66
  br i1 %exitcond67.not, label %for.end50, label %for.cond21.preheader.us.us34, !llvm.loop !8

for.cond21.preheader.us.us34:                     ; preds = %for.inc48.us.us31, %for.cond1.preheader.us.us21.preheader
  %indvars.iv63 = phi i64 [ 0, %for.cond1.preheader.us.us21.preheader ], [ %indvars.iv.next64, %for.inc48.us.us31 ]
  %arrayidx26.us.us39 = getelementptr inbounds i8*, i8** %log, i64 %indvars.iv63
  br label %for.body24.us.us23

for.end50:                                        ; preds = %for.inc48.us.us, %for.inc48.us.us31, %for.cond1.preheader.lr.ph.split.us.split, %for.cond1.preheader.lr.ph, %entry
  ret void
}

; Function Attrs: nofree noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  %vla3 = alloca [3 x i8*], align 16
  %vla1 = bitcast [3 x i8*]* %vla3 to i8*
  call void @llvm.var.annotation(i8* nonnull %vla1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 25, i8* null)
  %vla24 = alloca [4 x i8], align 16
  %vla24.sub = getelementptr inbounds [4 x i8], [4 x i8]* %vla24, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %vla24.sub, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 26, i8* null)
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %call = call noalias dereferenceable_or_null(10) i8* @malloc(i64 noundef 10) #5
  %arrayidx = getelementptr inbounds [3 x i8*], [3 x i8*]* %vla3, i64 0, i64 %indvars.iv
  store i8* %call, i8** %arrayidx, align 8
  %call5 = call i64 @read(i32 noundef 0, i8* noundef %call, i64 noundef 10) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 3
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !11

for.end:                                          ; preds = %for.body
  %vla3.sub = getelementptr inbounds [3 x i8*], [3 x i8*]* %vla3, i64 0, i64 0
  %call6 = call i64 @read(i32 noundef 0, i8* noundef nonnull %vla24.sub, i64 noundef 4) #5
  call void @log_redactor(i8** noundef nonnull %vla3.sub, i8* noundef nonnull %vla24.sub, i32 noundef 3, i32 noundef 10, i32 noundef 4)
  br label %for.body9

for.body9:                                        ; preds = %for.end, %for.body9
  %indvars.iv8 = phi i64 [ 0, %for.end ], [ %indvars.iv.next9, %for.body9 ]
  %arrayidx11 = getelementptr inbounds [3 x i8*], [3 x i8*]* %vla3, i64 0, i64 %indvars.iv8
  %0 = load i8*, i8** %arrayidx11, align 8
  %call12 = call i64 @write(i32 noundef 1, i8* noundef %0, i64 noundef 10) #5
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11.not = icmp eq i64 %indvars.iv.next9, 3
  br i1 %exitcond11.not, label %for.end15, label %for.body9, !llvm.loop !12

for.end15:                                        ; preds = %for.body9
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #4

attributes #0 = { nofree noinline norecurse nosync nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}

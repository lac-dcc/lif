; ModuleID = 'llvm-ir/lif.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"i32*ptr.wrapped.ty" = type { i32**, i64 }
%i32ptr.wrapped.ty = type { i32*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: nofree noinline norecurse nosync nounwind readonly sspstrong uwtable
define dso_local i32 @comp(%"i32*ptr.wrapped.ty"* nocapture noundef readonly %a, %i32ptr.wrapped.ty* nocapture noundef readonly %b, i32 noundef %n, i32 noundef %m) local_unnamed_addr #0 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %"i32*ptr.wrapped.ty", %"i32*ptr.wrapped.ty"* %a, i64 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
  %b.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b, i64 0, i32 1
  %b.field0.length = load i64, i64* %b.field0.length.ptr, align 8
  %0 = getelementptr inbounds %"i32*ptr.wrapped.ty", %"i32*ptr.wrapped.ty"* %a, i64 0, i32 0
  %a.unwrapped = load i32**, i32*** %0, align 8
  %1 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b, i64 0, i32 0
  %b.unwrapped = load i32*, i32** %1, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  %cmp33 = icmp sgt i32 %n, 0
  br i1 %cmp33, label %while.cond.preheader.lr.ph, label %if.then8

while.cond.preheader.lr.ph:                       ; preds = %entry
  %cmp123 = icmp sgt i32 %m, 0
  br i1 %cmp123, label %while.cond.preheader.us.preheader, label %while.cond.preheader.lr.ph.split

while.cond.preheader.us.preheader:                ; preds = %while.cond.preheader.lr.ph
  %wide.trip.count49 = zext i32 %n to i64
  %wide.trip.count = zext i32 %m to i64
  %shadow.0.sroa_cast = bitcast i64* %shadow to i32**
  %shadow.0.sroa_cast51 = bitcast i64* %shadow to i32*
  br label %while.cond.preheader.us

while.cond.preheader.us:                          ; preds = %while.cond.preheader.us.preheader, %while.cond.if.then_crit_edge.us
  %indvars.iv47 = phi i64 [ 0, %while.cond.preheader.us.preheader ], [ %indvars.iv.next48, %while.cond.if.then_crit_edge.us ]
  %cond.fold40.us = phi i1 [ true, %while.cond.preheader.us.preheader ], [ %in.38.us, %while.cond.if.then_crit_edge.us ]
  %exitpred.frozen1.rewritten39.us = phi i1 [ false, %while.cond.preheader.us.preheader ], [ %10, %while.cond.if.then_crit_edge.us ]
  %out.frozen14.036.us = phi i1 [ false, %while.cond.preheader.us.preheader ], [ %or.frozen35.us, %while.cond.if.then_crit_edge.us ]
  %out.11.035.us = phi i1 [ false, %while.cond.preheader.us.preheader ], [ %in.27.us, %while.cond.if.then_crit_edge.us ]
  %out.frozen.034.us = phi i1 [ false, %while.cond.preheader.us.preheader ], [ %or.frozen.us, %while.cond.if.then_crit_edge.us ]
  %cond.fold2222.us = or i1 %out.11.035.us, %cond.fold40.us
  %arrayidx.us = getelementptr inbounds i32*, i32** %a.unwrapped, i64 %indvars.iv47
  %idx0.safe.us = icmp sgt i64 %a.field0.length, %indvars.iv47
  br label %while.body.us

while.body.us:                                    ; preds = %while.cond.preheader.us, %while.body.us
  %indvars.iv = phi i64 [ 0, %while.cond.preheader.us ], [ %indvars.iv.next, %while.body.us ]
  %cond.fold2227.us = phi i1 [ %cond.fold2222.us, %while.cond.preheader.us ], [ %in.27.us, %while.body.us ]
  %exitpred.frozen4.rewritten26.us = phi i1 [ false, %while.cond.preheader.us ], [ %8, %while.body.us ]
  %out.frozen.124.us = phi i1 [ %out.frozen.034.us, %while.cond.preheader.us ], [ %or.frozen.us, %while.body.us ]
  %or.frozen.us = or i1 %out.frozen.124.us, %cond.fold2227.us
  %2 = or i1 %idx0.safe.us, %cond.fold2227.us
  %ctsel.us = select i1 %2, i32** %arrayidx.us, i32** %shadow.0.sroa_cast
  %3 = load i32*, i32** %ctsel.us, align 8
  %arrayidx3.us = getelementptr inbounds i32, i32* %3, i64 %indvars.iv
  %idx0.safe45.us = icmp sgt i64 %a.field0.length, %indvars.iv
  %4 = or i1 %idx0.safe45.us, %cond.fold2227.us
  %ctsel46.us = select i1 %4, i32* %arrayidx3.us, i32* %shadow.0.sroa_cast51
  %5 = load i32, i32* %ctsel46.us, align 4
  %arrayidx5.us = getelementptr inbounds i32, i32* %b.unwrapped, i64 %indvars.iv
  %idx0.safe47.us = icmp sgt i64 %b.field0.length, %indvars.iv
  %6 = or i1 %idx0.safe47.us, %cond.fold2227.us
  %ctsel48.us = select i1 %6, i32* %arrayidx5.us, i32* %shadow.0.sroa_cast51
  %7 = load i32, i32* %ctsel48.us, align 4
  %cmp6.us = icmp ne i32 %5, %7
  %8 = or i1 %exitpred.frozen4.rewritten26.us, %cmp6.us
  %9 = xor i1 %8, true
  %in.27.us = and i1 %cond.fold2227.us, %9
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond46.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond46.not, label %while.cond.if.then_crit_edge.us, label %while.body.us, !llvm.loop !6

while.cond.if.then_crit_edge.us:                  ; preds = %while.body.us
  %in.25.us = and i1 %or.frozen.us, %8
  %cond.fold33.us = or i1 %in.27.us, %in.25.us
  %or.frozen35.us = or i1 %out.frozen14.036.us, %cond.fold33.us
  %cmp7.us = xor i1 %in.25.us, true
  %10 = or i1 %exitpred.frozen1.rewritten39.us, %cmp7.us
  %11 = xor i1 %10, true
  %in.38.us = and i1 %cond.fold33.us, %11
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50.not = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond50.not, label %if.then8, label %while.cond.preheader.us, !llvm.loop !8

while.cond.preheader.lr.ph.split:                 ; preds = %while.cond.preheader.lr.ph
  %cmp7 = icmp eq i32 %m, 0
  %12 = xor i1 %cmp7, true
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %while.cond.preheader.lr.ph.split, %while.cond.preheader
  %cond.fold40 = phi i1 [ true, %while.cond.preheader.lr.ph.split ], [ %12, %while.cond.preheader ]
  %i.0.rewritten37 = phi i32 [ 0, %while.cond.preheader.lr.ph.split ], [ %inc10, %while.cond.preheader ]
  %out.frozen14.036 = phi i1 [ false, %while.cond.preheader.lr.ph.split ], [ %or.frozen35, %while.cond.preheader ]
  %or.frozen35 = or i1 %out.frozen14.036, %cond.fold40
  %inc10 = add nuw nsw i32 %i.0.rewritten37, 1
  %exitcond.not = icmp eq i32 %inc10, %n
  br i1 %exitcond.not, label %if.then8, label %while.cond.preheader, !llvm.loop !8

if.then8:                                         ; preds = %while.cond.preheader, %while.cond.if.then_crit_edge.us, %entry
  %out.frozen14.0.lcssa = phi i1 [ false, %entry ], [ %or.frozen35.us, %while.cond.if.then_crit_edge.us ], [ %or.frozen35, %while.cond.preheader ]
  %exitpred.frozen1.rewritten.lcssa = phi i1 [ false, %entry ], [ %10, %while.cond.if.then_crit_edge.us ], [ %cmp7, %while.cond.preheader ]
  %in.36 = and i1 %out.frozen14.0.lcssa, %exitpred.frozen1.rewritten.lcssa
  %phi.fold49 = zext i1 %in.36 to i32
  ret i32 %phi.fold49
}

; Function Attrs: nofree noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  %arg.wrapped = alloca %"i32*ptr.wrapped.ty", align 8
  %arg.wrapped22 = alloca %i32ptr.wrapped.ty, align 8
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %b = alloca i32*, align 8
  %r = alloca i32, align 4
  %0 = bitcast i32* %n to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef nonnull %0, i64 noundef 4) #5
  %1 = bitcast i32* %m to i8*
  %call1 = call i64 @read(i32 noundef 0, i8* noundef nonnull %1, i64 noundef 4) #5
  %call2 = tail call noalias dereferenceable_or_null(40) i8* @malloc(i64 noundef 40) #5
  %2 = bitcast i8* %call2 to i32**
  %3 = load i32, i32* %n, align 4
  %conv = sext i32 %3 to i64
  %mul = shl nsw i64 %conv, 2
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %call3 = tail call noalias i8* @malloc(i64 noundef %mul) #5
  %arrayidx = getelementptr inbounds i32*, i32** %2, i64 %indvars.iv
  %4 = bitcast i32** %arrayidx to i8**
  store i8* %call3, i8** %4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 5
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !9

for.end:                                          ; preds = %for.body
  %b4 = bitcast i32** %b to i8*
  call void @llvm.var.annotation(i8* nonnull %b4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 30, i8* null)
  %call7 = call noalias i8* @malloc(i64 noundef %mul) #5
  %5 = bitcast i32** %b to i8**
  store i8* %call7, i8** %5, align 8
  br label %for.body12

for.body12:                                       ; preds = %for.end, %for.body12
  %indvars.iv6 = phi i64 [ 0, %for.end ], [ %indvars.iv.next7, %for.body12 ]
  %arrayidx14 = getelementptr inbounds i32*, i32** %2, i64 %indvars.iv6
  %6 = bitcast i32** %arrayidx14 to i8**
  %7 = load i8*, i8** %6, align 8
  %call17 = call i64 @read(i32 noundef 0, i8* noundef %7, i64 noundef %mul) #5
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9.not = icmp eq i64 %indvars.iv.next7, 5
  br i1 %exitcond9.not, label %for.end20, label %for.body12, !llvm.loop !10

for.end20:                                        ; preds = %for.body12
  %8 = load i8*, i8** %5, align 8
  %call23 = call i64 @read(i32 noundef 0, i8* noundef %8, i64 noundef %mul) #5
  %9 = load i32*, i32** %b, align 8
  %10 = load i32, i32* %m, align 4
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %"i32*ptr.wrapped.ty", %"i32*ptr.wrapped.ty"* %arg.wrapped, i64 0, i32 1
  store i64 5, i64* %arg.wrapped.field0.length.ptr, align 8
  %11 = bitcast %"i32*ptr.wrapped.ty"* %arg.wrapped to i8**
  store i8* %call2, i8** %11, align 8
  %arg.unwrapped23 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arg.wrapped22, i64 0, i32 0
  %arg.wrapped22.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arg.wrapped22, i64 0, i32 1
  store i64 0, i64* %arg.wrapped22.field0.length.ptr, align 8
  store i32* %9, i32** %arg.unwrapped23, align 8
  %call24 = call i32 @comp(%"i32*ptr.wrapped.ty"* nonnull %arg.wrapped, %i32ptr.wrapped.ty* nonnull %arg.wrapped22, i32 5, i32 %10)
  store i32 %call24, i32* %r, align 4
  %12 = bitcast i32* %r to i8*
  %call25 = call i64 @write(i32 noundef 1, i8* noundef nonnull %12, i64 noundef 4) #5
  ret i32 0
}

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #4

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #2

attributes #0 = { nofree noinline norecurse nosync nounwind readonly sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
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

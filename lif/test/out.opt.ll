; ModuleID = 'out.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i32*, i32 }
%struct.S.extended.ty = type { i32*, i32, i64 }
%i32ptr.wrapped.ty = type { i32*, i64 }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@s = dso_local local_unnamed_addr global %struct.S zeroinitializer, align 8
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree noinline norecurse nosync nounwind readonly sspstrong uwtable
define dso_local i32 @comp(%struct.S.extended.ty* nocapture readonly %a, %i32ptr.wrapped.ty* nocapture readonly %b, i32 %n) local_unnamed_addr #0 {
entry:
  %b.wrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b, i64 0, i32 0
  %b.unwrapped = load i32*, i32** %b.wrapped, align 8
  %field.length.ptr = getelementptr inbounds %struct.S.extended.ty, %struct.S.extended.ty* %a, i64 0, i32 2
  %field.length = load i64, i64* %field.length.ptr, align 8
  %field.length.ptr19 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b, i64 0, i32 1
  %field.length20 = load i64, i64* %field.length.ptr19, align 8
  %shadow = alloca i64, align 8
  %p = getelementptr inbounds %struct.S.extended.ty, %struct.S.extended.ty* %a, i64 0, i32 0
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  %shadow.0.sroa_cast = bitcast i64* %shadow to i32**
  %shadow.0.sroa_cast15 = bitcast i64* %shadow to i32*
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %cond.fold14 = phi i1 [ true, %for.body.preheader ], [ %in.12, %for.body ]
  %exitpred.freezed1.rewritten13 = phi i1 [ false, %for.body.preheader ], [ %5, %for.body ]
  %out.3.011 = phi i1 [ undef, %for.body.preheader ], [ %cond.fold14, %for.body ]
  %ctsel = select i1 %out.3.011, i32** %p, i32** %shadow.0.sroa_cast
  %0 = load i32*, i32** %ctsel, align 8
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %idx.safe = icmp sgt i64 %field.length, %indvars.iv
  %1 = or i1 %out.3.011, %idx.safe
  %ctsel21 = select i1 %1, i32* %arrayidx, i32* %shadow.0.sroa_cast15
  %2 = load i32, i32* %ctsel21, align 4
  %arrayidx2 = getelementptr inbounds i32, i32* %b.unwrapped, i64 %indvars.iv
  %idx.safe22 = icmp sgt i64 %field.length20, %indvars.iv
  %3 = or i1 %out.3.011, %idx.safe22
  %ctsel23 = select i1 %3, i32* %arrayidx2, i32* %shadow.0.sroa_cast15
  %4 = load i32, i32* %ctsel23, align 4
  %cmp3 = icmp ne i32 %2, %4
  %5 = or i1 %exitpred.freezed1.rewritten13, %cmp3
  %6 = xor i1 %5, true
  %in.12 = and i1 %cond.fold14, %6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.end.loopexit, label %for.body, !llvm.loop !6

for.end.loopexit:                                 ; preds = %for.body
  %phi.cast = zext i1 %in.12 to i32
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %cond.fold.lcssa = phi i32 [ 1, %entry ], [ %phi.cast, %for.end.loopexit ]
  ret i32 %cond.fold.lcssa
}

; Function Attrs: nofree noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  %s.wrapped = alloca %struct.S.extended.ty, align 8
  %arg.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %n)
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %m)
  %0 = load i32, i32* %n, align 4
  %conv = sext i32 %0 to i64
  %mul = shl nsw i64 %conv, 2
  %call2 = call noalias align 16 i8* @malloc(i64 %mul) #4
  store i8* %call2, i8** bitcast (%struct.S* @s to i8**), align 8
  %call5 = call noalias align 16 i8* @malloc(i64 %mul) #4
  %1 = bitcast i8* %call5 to i32*
  %cmp1 = icmp sgt i32 %0, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end18

for.body.preheader:                               ; preds = %entry
  %call78 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %call2)
  %2 = load i32, i32* %n, align 4
  %cmp9 = icmp sgt i32 %2, 1
  br i1 %cmp9, label %for.body.for.body_crit_edge, label %for.cond9.preheader, !llvm.loop !8

for.cond9.preheader:                              ; preds = %for.body.for.body_crit_edge, %for.body.preheader
  %.lcssa = phi i32 [ %2, %for.body.preheader ], [ %3, %for.body.for.body_crit_edge ]
  %cmp103 = icmp sgt i32 %.lcssa, 0
  br i1 %cmp103, label %for.body12, label %for.end18

for.body.for.body_crit_edge:                      ; preds = %for.body.preheader, %for.body.for.body_crit_edge
  %indvars.iv.next10 = phi i64 [ %indvars.iv.next, %for.body.for.body_crit_edge ], [ 1, %for.body.preheader ]
  %.pre = load i32*, i32** getelementptr inbounds (%struct.S, %struct.S* @s, i64 0, i32 0), align 8
  %arrayidx = getelementptr inbounds i32, i32* %.pre, i64 %indvars.iv.next10
  %call7 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %arrayidx)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv.next10, 1
  %3 = load i32, i32* %n, align 4
  %4 = sext i32 %3 to i64
  %cmp = icmp slt i64 %indvars.iv.next, %4
  br i1 %cmp, label %for.body.for.body_crit_edge, label %for.cond9.preheader, !llvm.loop !8

for.body12:                                       ; preds = %for.cond9.preheader, %for.body12
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %for.body12 ], [ 0, %for.cond9.preheader ]
  %arrayidx14 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv5
  %call15 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %arrayidx14)
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %5 = load i32, i32* %n, align 4
  %6 = sext i32 %5 to i64
  %cmp10 = icmp slt i64 %indvars.iv.next6, %6
  br i1 %cmp10, label %for.body12, label %for.end18, !llvm.loop !9

for.end18:                                        ; preds = %for.body12, %entry, %for.cond9.preheader
  %7 = load i32, i32* %m, align 4
  %8 = load i32*, i32** getelementptr inbounds (%struct.S, %struct.S* @s, i64 0, i32 0), align 8
  %arg.field.length.ptr = getelementptr inbounds %struct.S.extended.ty, %struct.S.extended.ty* %s.wrapped, i64 0, i32 2
  store i64 %conv, i64* %arg.field.length.ptr, align 8
  %s.field.unwrapped = getelementptr inbounds %struct.S.extended.ty, %struct.S.extended.ty* %s.wrapped, i64 0, i32 0
  store i32* %8, i32** %s.field.unwrapped, align 8
  %arg.field.length.ptr1 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arg.wrapped, i64 0, i32 1
  store i64 %conv, i64* %arg.field.length.ptr1, align 8
  %9 = bitcast %i32ptr.wrapped.ty* %arg.wrapped to i8**
  store i8* %call5, i8** %9, align 8
  %call19 = call i32 @comp(%struct.S.extended.ty* nonnull %s.wrapped, %i32ptr.wrapped.ty* nonnull %arg.wrapped, i32 %7)
  %call20 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %call19)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @__isoc99_scanf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare noalias noundef align 16 i8* @malloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

attributes #0 = { nofree noinline norecurse nosync nounwind readonly sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 13.0.0"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}

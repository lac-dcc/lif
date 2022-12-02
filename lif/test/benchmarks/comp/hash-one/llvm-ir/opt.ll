; ModuleID = 'llvm-ir/base.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: nofree noinline norecurse nosync nounwind readonly sspstrong uwtable
define dso_local i32 @comp(i32* nocapture noundef readonly %a, i32* nocapture noundef readonly %b, i32 noundef %n) local_unnamed_addr #0 {
entry:
  %cmp2 = icmp sgt i32 %n, 0
  br i1 %cmp2, label %for.body.preheader, label %for.end21

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.cond5.preheader:                              ; preds = %for.inc
  br i1 %cmp2, label %for.body7.preheader, label %for.end21

for.body7.preheader:                              ; preds = %for.cond5.preheader
  %wide.trip.count13 = zext i32 %n to i64
  br label %for.body7

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %ha.03 = phi i32 [ 1, %for.body.preheader ], [ %ha.1, %for.inc ]
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx, align 4
  %tobool.not = icmp eq i32 %0, 0
  br i1 %tobool.not, label %if.else, label %if.then

if.then:                                          ; preds = %for.body
  %mul = mul nsw i32 %0, %ha.03
  %rem = srem i32 %mul, 1024
  br label %for.inc

if.else:                                          ; preds = %for.body
  %inc = add nsw i32 %ha.03, 1
  br label %for.inc

for.inc:                                          ; preds = %if.then, %if.else
  %ha.1 = phi i32 [ %rem, %if.then ], [ %inc, %if.else ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond5.preheader, label %for.body, !llvm.loop !6

for.body7:                                        ; preds = %for.body7.preheader, %for.inc19
  %indvars.iv10 = phi i64 [ 0, %for.body7.preheader ], [ %indvars.iv.next11, %for.inc19 ]
  %hb.06 = phi i32 [ 1, %for.body7.preheader ], [ %hb.1, %for.inc19 ]
  %arrayidx9 = getelementptr inbounds i32, i32* %b, i64 %indvars.iv10
  %1 = load i32, i32* %arrayidx9, align 4
  %tobool10.not = icmp eq i32 %1, 0
  br i1 %tobool10.not, label %if.else16, label %if.then11

if.then11:                                        ; preds = %for.body7
  %mul14 = mul nsw i32 %1, %hb.06
  %rem15 = srem i32 %mul14, 1024
  br label %for.inc19

if.else16:                                        ; preds = %for.body7
  %inc17 = add nsw i32 %hb.06, 1
  br label %for.inc19

for.inc19:                                        ; preds = %if.then11, %if.else16
  %hb.1 = phi i32 [ %rem15, %if.then11 ], [ %inc17, %if.else16 ]
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond14.not = icmp eq i64 %indvars.iv.next11, %wide.trip.count13
  br i1 %exitcond14.not, label %for.end21, label %for.body7, !llvm.loop !8

for.end21:                                        ; preds = %for.inc19, %entry, %for.cond5.preheader
  %ha.0.lcssa16 = phi i32 [ %ha.1, %for.cond5.preheader ], [ 1, %entry ], [ %ha.1, %for.inc19 ]
  %hb.0.lcssa = phi i32 [ 1, %for.cond5.preheader ], [ 1, %entry ], [ %hb.1, %for.inc19 ]
  %cmp22 = icmp eq i32 %ha.0.lcssa16, %hb.0.lcssa
  %. = zext i1 %cmp22 to i32
  ret i32 %.
}

; Function Attrs: nofree noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %b = alloca i32*, align 8
  %r = alloca i32, align 4
  %0 = bitcast i32* %n to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef nonnull %0, i64 noundef 4) #5
  %1 = bitcast i32* %m to i8*
  %call1 = call i64 @read(i32 noundef 0, i8* noundef nonnull %1, i64 noundef 4) #5
  %2 = load i32, i32* %n, align 4
  %conv = sext i32 %2 to i64
  %mul = shl nsw i64 %conv, 2
  %call2 = tail call noalias i8* @malloc(i64 noundef %mul) #5
  %3 = bitcast i8* %call2 to i32*
  %b3 = bitcast i32** %b to i8*
  call void @llvm.var.annotation(i8* nonnull %b3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 28, i8* null)
  %call6 = call noalias i8* @malloc(i64 noundef %mul) #5
  %4 = bitcast i32** %b to i8**
  store i8* %call6, i8** %4, align 8
  %call9 = call i64 @read(i32 noundef 0, i8* noundef %call2, i64 noundef %mul) #5
  %5 = load i8*, i8** %4, align 8
  %call12 = call i64 @read(i32 noundef 0, i8* noundef %5, i64 noundef %mul) #5
  %6 = load i32*, i32** %b, align 8
  %7 = load i32, i32* %m, align 4
  %call13 = call i32 @comp(i32* noundef %3, i32* noundef %6, i32 noundef %7)
  store i32 %call13, i32* %r, align 4
  %8 = bitcast i32* %r to i8*
  %call14 = call i64 @write(i32 noundef 1, i8* noundef nonnull %8, i64 noundef 4) #5
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

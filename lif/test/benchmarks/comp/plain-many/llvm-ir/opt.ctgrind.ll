; ModuleID = 'llvm-ir/base.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: nofree noinline norecurse nosync nounwind readonly sspstrong uwtable
define dso_local i32 @comp(i32** nocapture noundef readonly %a, i32* nocapture noundef readonly %b, i32 noundef %n, i32 noundef %m) local_unnamed_addr #0 {
entry:
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %while.cond.preheader.lr.ph, label %return

while.cond.preheader.lr.ph:                       ; preds = %entry
  %cmp11 = icmp sgt i32 %m, 0
  br i1 %cmp11, label %while.cond.preheader.us.preheader, label %while.cond.preheader.lr.ph.split

while.cond.preheader.us.preheader:                ; preds = %while.cond.preheader.lr.ph
  %wide.trip.count14 = zext i32 %n to i64
  %wide.trip.count = zext i32 %m to i64
  br label %while.cond.preheader.us

while.cond.preheader.us:                          ; preds = %while.cond.preheader.us.preheader, %for.cond.us
  %indvars.iv11 = phi i64 [ 0, %while.cond.preheader.us.preheader ], [ %indvars.iv.next12, %for.cond.us ]
  %arrayidx.us = getelementptr inbounds i32*, i32** %a, i64 %indvars.iv11
  %0 = load i32*, i32** %arrayidx.us, align 8
  br label %while.body.us

while.body.us:                                    ; preds = %while.cond.preheader.us, %if.else.us
  %indvars.iv = phi i64 [ 0, %while.cond.preheader.us ], [ %indvars.iv.next, %if.else.us ]
  %arrayidx3.us = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %1 = load i32, i32* %arrayidx3.us, align 4
  %arrayidx5.us = getelementptr inbounds i32, i32* %b, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx5.us, align 4
  %cmp6.not.us = icmp eq i32 %1, %2
  br i1 %cmp6.not.us, label %if.else.us, label %while.end.us

while.end.us:                                     ; preds = %while.body.us
  %3 = trunc i64 %indvars.iv to i32
  %cmp7.us = icmp eq i32 %3, %m
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br i1 %cmp7.us, label %return, label %for.cond.us

if.else.us:                                       ; preds = %while.body.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %return, label %while.body.us, !llvm.loop !6

for.cond.us:                                      ; preds = %while.end.us
  %exitcond15.not = icmp eq i64 %indvars.iv.next12, %wide.trip.count14
  br i1 %exitcond15.not, label %return, label %while.cond.preheader.us, !llvm.loop !8

while.cond.preheader.lr.ph.split:                 ; preds = %while.cond.preheader.lr.ph
  %cmp7 = icmp eq i32 %m, 0
  %spec.select = zext i1 %cmp7 to i32
  br label %return

return:                                           ; preds = %while.end.us, %for.cond.us, %if.else.us, %while.cond.preheader.lr.ph.split, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ %spec.select, %while.cond.preheader.lr.ph.split ], [ 1, %if.else.us ], [ 0, %for.cond.us ], [ 1, %while.end.us ]
  ret i32 %retval.0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %b = alloca i32*, align 8
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
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
  %indvars.iv4 = phi i64 [ 0, %for.end ], [ %indvars.iv.next5, %for.body12 ]
  %arrayidx14 = getelementptr inbounds i32*, i32** %2, i64 %indvars.iv4
  %6 = bitcast i32** %arrayidx14 to i8**
  %7 = load i8*, i8** %6, align 8
  %call17 = call i64 @read(i32 noundef 0, i8* noundef %7, i64 noundef %mul) #5
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond7.not = icmp eq i64 %indvars.iv.next5, 5
  br i1 %exitcond7.not, label %for.end20, label %for.body12, !llvm.loop !10

for.end20:                                        ; preds = %for.body12
  %8 = load i8*, i8** %5, align 8
  %call23 = call i64 @read(i32 noundef 0, i8* noundef %8, i64 noundef %mul) #5
  %arrayidx24 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx24, align 16
  %9 = load i32*, i32** %b, align 8
  %10 = ptrtoint i32* %9 to i64
  %arrayidx25 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %10, i64* %arrayidx25, align 8
  %arrayidx28 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 %mul, i64* %arrayidx28, align 16
  %arrayidx29 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx29, align 8
  %arrayidx30 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx30, align 16
  %arrayidx31 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx31, align 8
  %11 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx24, i64 0) #5, !srcloc !11
  store volatile i64 %11, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  %12 = load i32*, i32** %b, align 8
  %13 = load i32, i32* %m, align 4
  %call33 = call i32 @comp(i32** noundef nonnull %2, i32* noundef %12, i32 noundef 5, i32 noundef %13)
  store i32 %call33, i32* %r, align 4
  %14 = bitcast i32* %r to i8*
  %call34 = call i64 @write(i32 noundef 1, i8* noundef nonnull %14, i64 noundef 4) #5
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
attributes #1 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!11 = !{i64 2148289948, i64 2148289984, i64 2148290052}

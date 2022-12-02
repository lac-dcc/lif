; ModuleID = 'llvm-ir/lif.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%i32ptr.wrapped.ty = type { i32*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: nofree noinline norecurse nosync nounwind readonly sspstrong uwtable
define dso_local i32 @comp(%i32ptr.wrapped.ty* nocapture noundef readonly %a, %i32ptr.wrapped.ty* nocapture noundef readonly %b, i32 noundef %n) local_unnamed_addr #0 {
entry:
  %b.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b, i64 0, i32 1
  %b.field0.length = load i64, i64* %b.field0.length.ptr, align 8
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i64 0, i32 0
  %a.unwrapped = load i32*, i32** %0, align 8
  %1 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %b, i64 0, i32 0
  %b.unwrapped = load i32*, i32** %1, align 8
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.body.preheader, label %for.end21

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.cond5.preheader:                              ; preds = %if.end
  br i1 %cmp10, label %for.body7.lr.ph, label %for.end21

for.body7.lr.ph:                                  ; preds = %for.cond5.preheader
  %wide.trip.count26 = zext i32 %n to i64
  br label %for.body7

for.body:                                         ; preds = %for.body.preheader, %if.end
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %if.end ]
  %cond.fold15 = phi i1 [ true, %for.body.preheader ], [ %cond.fold26, %if.end ]
  %ha.0.rewritten13 = phi i32 [ 1, %for.body.preheader ], [ %ha.1.rewritten, %if.end ]
  %out.6.012 = phi i1 [ false, %for.body.preheader ], [ %out.6.1, %if.end ]
  %out.5.011 = phi i1 [ false, %for.body.preheader ], [ %out.5.1, %if.end ]
  %arrayidx = getelementptr inbounds i32, i32* %a.unwrapped, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx, align 4
  %tobool.not = icmp eq i32 %2, 0
  br i1 %tobool.not, label %if.else, label %if.then

if.then:                                          ; preds = %for.body
  %mul = mul nsw i32 %2, %ha.0.rewritten13
  %rem = srem i32 %mul, 1024
  br label %if.end

if.else:                                          ; preds = %for.body
  %inc = add nsw i32 %ha.0.rewritten13, 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %out.5.1 = phi i1 [ %cond.fold15, %if.then ], [ %out.5.011, %if.else ]
  %out.6.1 = phi i1 [ %out.6.012, %if.then ], [ %cond.fold15, %if.else ]
  %ha.1.rewritten = phi i32 [ %rem, %if.then ], [ %inc, %if.else ]
  %cond.fold26 = or i1 %out.5.1, %out.6.1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond5.preheader, label %for.body, !llvm.loop !6

for.body7:                                        ; preds = %for.body7.lr.ph, %for.body7
  %indvars.iv23 = phi i64 [ 0, %for.body7.lr.ph ], [ %indvars.iv.next24, %for.body7 ]
  %hb.0.rewritten18 = phi i32 [ 1, %for.body7.lr.ph ], [ %phi.fold, %for.body7 ]
  %arrayidx9 = getelementptr inbounds i32, i32* %b.unwrapped, i64 %indvars.iv23
  %3 = load i32, i32* %arrayidx9, align 4
  %tobool10 = icmp ne i32 %3, 0
  %4 = xor i1 %tobool10, true
  %in.36 = and i1 %cond.fold26, %4
  %inc17 = add nsw i32 %hb.0.rewritten18, 1
  %in.34 = and i1 %cond.fold26, %tobool10
  %idx0.safe = icmp sgt i64 %b.field0.length, %indvars.iv23
  %5 = or i1 %idx0.safe, %in.34
  %6 = select i1 %5, i32 %3, i32 0
  %mul14 = mul nsw i32 %6, %hb.0.rewritten18
  %rem15 = srem i32 %mul14, 1024
  %phi.fold = select i1 %in.36, i32 %inc17, i32 %rem15
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27.not = icmp eq i64 %indvars.iv.next24, %wide.trip.count26
  br i1 %exitcond27.not, label %for.end21, label %for.body7, !llvm.loop !8

for.end21:                                        ; preds = %for.body7, %entry, %for.cond5.preheader
  %cond.fold.lcssa31 = phi i1 [ %cond.fold26, %for.cond5.preheader ], [ true, %entry ], [ %cond.fold26, %for.body7 ]
  %ha.0.rewritten.lcssa30 = phi i32 [ %ha.1.rewritten, %for.cond5.preheader ], [ 1, %entry ], [ %ha.1.rewritten, %for.body7 ]
  %hb.0.rewritten.lcssa = phi i32 [ 1, %for.cond5.preheader ], [ 1, %entry ], [ %phi.fold, %for.body7 ]
  %cmp22 = icmp ne i32 %ha.0.rewritten.lcssa30, %hb.0.rewritten.lcssa
  %in.45 = and i1 %cmp22, %cond.fold.lcssa31
  %not.in.45 = xor i1 %in.45, true
  %phi.fold49 = zext i1 %not.in.45 to i32
  ret i32 %phi.fold49
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  %arg.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %arg.wrapped1 = alloca %i32ptr.wrapped.ty, align 8
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
  %2 = load i32, i32* %n, align 4
  %conv = sext i32 %2 to i64
  %mul = shl nsw i64 %conv, 2
  %call2 = tail call noalias i8* @malloc(i64 noundef %mul) #5
  %b3 = bitcast i32** %b to i8*
  call void @llvm.var.annotation(i8* nonnull %b3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 28, i8* null)
  %call6 = call noalias i8* @malloc(i64 noundef %mul) #5
  %3 = bitcast i32** %b to i8**
  store i8* %call6, i8** %3, align 8
  %call9 = call i64 @read(i32 noundef 0, i8* noundef %call2, i64 noundef %mul) #5
  %4 = load i8*, i8** %3, align 8
  %call12 = call i64 @read(i32 noundef 0, i8* noundef %4, i64 noundef %mul) #5
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %5 = load i32*, i32** %b, align 8
  %6 = ptrtoint i32* %5 to i64
  %arrayidx13 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %6, i64* %arrayidx13, align 8
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 %mul, i64* %arrayidx16, align 16
  %arrayidx17 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx17, align 8
  %arrayidx18 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx18, align 16
  %arrayidx19 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx19, align 8
  %7 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx, i64 0) #5, !srcloc !9
  store volatile i64 %7, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  %8 = load i32*, i32** %b, align 8
  %9 = load i32, i32* %m, align 4
  %arg.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arg.wrapped, i64 0, i32 1
  store i64 %conv, i64* %arg.wrapped.field0.length.ptr, align 8
  %10 = bitcast %i32ptr.wrapped.ty* %arg.wrapped to i8**
  store i8* %call2, i8** %10, align 8
  %arg.unwrapped2 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arg.wrapped1, i64 0, i32 0
  %arg.wrapped1.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arg.wrapped1, i64 0, i32 1
  store i64 0, i64* %arg.wrapped1.field0.length.ptr, align 8
  store i32* %8, i32** %arg.unwrapped2, align 8
  %call21 = call i32 @comp(%i32ptr.wrapped.ty* nonnull %arg.wrapped, %i32ptr.wrapped.ty* nonnull %arg.wrapped1, i32 %9)
  store i32 %call21, i32* %r, align 4
  %11 = bitcast i32* %r to i8*
  %call22 = call i64 @write(i32 noundef 1, i8* noundef nonnull %11, i64 noundef 4) #5
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
!9 = !{i64 2148289819, i64 2148289855, i64 2148289923}

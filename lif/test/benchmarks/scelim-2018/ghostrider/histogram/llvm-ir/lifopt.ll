; ModuleID = 'llvm-ir/lif.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%i32ptr.wrapped.ty = type { i32*, i64 }

@foo = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define dso_local void @histogram(%i32ptr.wrapped.ty* nocapture noundef readonly %a, %i32ptr.wrapped.ty* nocapture noundef readonly %c) local_unnamed_addr #0 {
entry:
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i64 0, i32 0
  %a.unwrapped = load i32*, i32** %0, align 8
  %1 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %c, i64 0, i32 0
  %c.unwrapped = load i32*, i32** %1, align 8
  %c.unwrapped8 = bitcast i32* %c.unwrapped to i8*
  %shadow.sroa.0 = alloca i32, align 8
  store i32 0, i32* %shadow.sroa.0, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(4000) %c.unwrapped8, i8 0, i64 4000, i1 false)
  br label %for.body3

for.body3:                                        ; preds = %entry, %for.body3
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds i32, i32* %a.unwrapped, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx5, align 4
  %cmp6 = icmp sgt i32 %2, 0
  %3 = srem i32 %2, 1000
  %rem8 = sub nsw i32 0, %3
  %ctsel = select i1 %cmp6, i32* @foo, i32* %shadow.sroa.0
  %4 = load volatile i32, i32* %ctsel, align 4
  %inc7 = zext i1 %cmp6 to i32
  %select.val. = add nsw i32 %4, %inc7
  store volatile i32 %select.val., i32* %ctsel, align 4
  %phi.fold = select i1 %cmp6, i32 %3, i32 %rem8
  %idxprom9 = sext i32 %phi.fold to i64
  %arrayidx10 = getelementptr inbounds i32, i32* %c.unwrapped, i64 %idxprom9
  %5 = load i32, i32* %arrayidx10, align 4
  %add = add nsw i32 %5, 1
  store i32 %add, i32* %arrayidx10, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond.not, label %for.end15, label %for.body3, !llvm.loop !6

for.end15:                                        ; preds = %for.body3
  ret void
}

; Function Attrs: nofree noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  %arraydecay.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %arraydecay2.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %in = alloca [1000 x i32], align 16
  %out = alloca [1000 x i32], align 16
  %in1 = bitcast [1000 x i32]* %in to i8*
  call void @llvm.var.annotation(i8* nonnull %in1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 18, i8* null)
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds [1000 x i32], [1000 x i32]* %in, i64 0, i64 %indvars.iv
  %0 = bitcast i32* %arrayidx to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef nonnull %0, i64 noundef 4) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !8

for.end:                                          ; preds = %for.body
  %arraydecay = getelementptr inbounds [1000 x i32], [1000 x i32]* %in, i64 0, i64 0
  %arraydecay2 = getelementptr inbounds [1000 x i32], [1000 x i32]* %out, i64 0, i64 0
  %arraydecay.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay.wrapped, i64 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay.wrapped, i64 0, i32 1
  store i64 1000, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i32* %arraydecay, i32** %arraydecay.unwrapped, align 8
  %arraydecay2.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay2.wrapped, i64 0, i32 0
  %arraydecay2.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay2.wrapped, i64 0, i32 1
  store i64 1000, i64* %arraydecay2.wrapped.field0.length.ptr, align 8
  store i32* %arraydecay2, i32** %arraydecay2.unwrapped, align 8
  call void @histogram(%i32ptr.wrapped.ty* nonnull %arraydecay.wrapped, %i32ptr.wrapped.ty* nonnull %arraydecay2.wrapped)
  %1 = bitcast [1000 x i32]* %out to i8*
  %call4 = call i64 @write(i32 noundef 1, i8* noundef nonnull %1, i64 noundef 4000) #5
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #2

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { nofree noinline norecurse nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
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

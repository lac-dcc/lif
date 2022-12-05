; ModuleID = 'llvm-ir/lif.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%i32ptr.wrapped.ty = type { i32*, i64 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.2 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @histogram(%i32ptr.wrapped.ty* nocapture noundef readonly %a, %i32ptr.wrapped.ty* nocapture noundef readonly %c) local_unnamed_addr #0 {
entry:
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i64 0, i32 0
  %a.unwrapped = load i32*, i32** %0, align 8
  %1 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %c, i64 0, i32 0
  %c.unwrapped = load i32*, i32** %1, align 8
  %c.unwrapped8 = bitcast i32* %c.unwrapped to i8*
  %foo = alloca i32, align 4
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %shadow.sroa.0 = alloca i32, align 8
  store i32 0, i32* %shadow.sroa.0, align 8
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(4000) %c.unwrapped8, i8 0, i64 4000, i1 false)
  %arrayidx9 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %2 = ptrtoint i32* %foo to i64
  %arrayidx10 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  %arrayidx11 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  %arrayidx12 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  %arrayidx13 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  %arrayidx14 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  br label %for.body3

for.body3:                                        ; preds = %entry, %for.body3
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds i32, i32* %a.unwrapped, i64 %indvars.iv
  %3 = load i32, i32* %arrayidx5, align 4
  store i32 0, i32* %foo, align 4
  %cmp6 = icmp sgt i32 %3, 0
  %4 = srem i32 %3, 1000
  %rem8 = sub nsw i32 0, %4
  %ctsel = select i1 %cmp6, i32* %foo, i32* %shadow.sroa.0
  %5 = load i32, i32* %ctsel, align 4
  %inc7 = zext i1 %cmp6 to i32
  %select.val. = add nsw i32 %5, %inc7
  store i32 %select.val., i32* %ctsel, align 4
  %phi.fold = select i1 %cmp6, i32 %4, i32 %rem8
  store volatile i64 1296236546, i64* %arrayidx9, align 16
  store volatile i64 %2, i64* %arrayidx10, align 8
  store volatile i64 4, i64* %arrayidx11, align 16
  store volatile i64 0, i64* %arrayidx12, align 8
  store volatile i64 0, i64* %arrayidx13, align 16
  store volatile i64 0, i64* %arrayidx14, align 8
  %6 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx9, i64 0) #5, !srcloc !6
  store volatile i64 %6, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  %7 = load i32, i32* %foo, align 4
  %call = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %7)
  %idxprom16 = sext i32 %phi.fold to i64
  %arrayidx17 = getelementptr inbounds i32, i32* %c.unwrapped, i64 %idxprom16
  %8 = load i32, i32* %arrayidx17, align 4
  %add = add nsw i32 %8, 1
  store i32 %add, i32* %arrayidx17, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond.not, label %for.end22, label %for.body3, !llvm.loop !7

for.end22:                                        ; preds = %for.body3
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
entry:
  %arraydecay.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %arraydecay2.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %in = alloca [1000 x i32], align 16
  %out = alloca [1000 x i32], align 16
  %in1 = bitcast [1000 x i32]* %in to i8*
  call void @llvm.var.annotation(i8* nonnull %in1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.2, i64 0, i64 0), i32 18, i8* null)
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds [1000 x i32], [1000 x i32]* %in, i64 0, i64 %indvars.iv
  %0 = bitcast i32* %arrayidx to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef nonnull %0, i64 noundef 4) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !9

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

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!6 = !{i64 2148084668, i64 2148084704, i64 2148084772}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}

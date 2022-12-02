; ModuleID = 'llvm-ir/base.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @mu(i32* nocapture noundef %a) local_unnamed_addr #0 {
entry:
  %arrayidx10 = getelementptr inbounds i32, i32* %a, i64 1
  %arrayidx17 = getelementptr inbounds i32, i32* %a, i64 2
  %a.promoted = load i32, i32* %a, align 4
  %arrayidx10.promoted = load i32, i32* %arrayidx10, align 4
  %arrayidx17.promoted = load i32, i32* %arrayidx17, align 4
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.016 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %b.sroa.0.015 = phi i32 [ 0, %entry ], [ %2, %for.body ]
  %b.sroa.6.014 = phi i32 [ 0, %entry ], [ %1, %for.body ]
  %b.sroa.12.013 = phi i32 [ 0, %entry ], [ %0, %for.body ]
  %shr712 = phi i32 [ %a.promoted, %entry ], [ %shr, %for.body ]
  %shr26811 = phi i32 [ %arrayidx10.promoted, %entry ], [ %shr26, %for.body ]
  %shr28910 = phi i32 [ %arrayidx17.promoted, %entry ], [ %shr28, %for.body ]
  %shl = shl i32 %b.sroa.0.015, 1
  %shl5 = shl i32 %b.sroa.6.014, 1
  %shl7 = shl i32 %b.sroa.12.013, 1
  %and = and i32 %shr712, 1
  %0 = or i32 %and, %shl7
  %and11 = and i32 %shr26811, 1
  %1 = or i32 %and11, %shl5
  %and18 = and i32 %shr28910, 1
  %2 = or i32 %and18, %shl
  %shr = ashr i32 %shr712, 1
  %shr26 = ashr i32 %shr26811, 1
  %shr28 = ashr i32 %shr28910, 1
  %inc = add nuw nsw i32 %i.016, 1
  %exitcond.not = icmp eq i32 %inc, 32
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !6

for.end:                                          ; preds = %for.body
  store i32 %2, i32* %a, align 4
  store i32 %1, i32* %arrayidx10, align 4
  store i32 %0, i32* %arrayidx17, align 4
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  %a = alloca [3 x i32], align 4
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %a1 = bitcast [3 x i32]* %a to i8*
  call void @llvm.var.annotation(i8* nonnull %a1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 19, i8* null)
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0
  %call = call i64 @read(i32 noundef 0, i8* noundef nonnull %a1, i64 noundef 12) #4
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %0 = ptrtoint [3 x i32]* %a to i64
  %arrayidx3 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %0, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 12, i64* %arrayidx4, align 16
  %arrayidx5 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx6, align 16
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx7, align 8
  %1 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* nonnull %arrayidx, i64 0) #4, !srcloc !8
  store volatile i64 %1, i64* %_zzq_result, align 8
  %_zzq_result.0._zzq_result.0._zzq_result.0. = load volatile i64, i64* %_zzq_result, align 8
  call void @mu(i32* noundef nonnull %arraydecay)
  %call11 = call i64 @write(i32 noundef 1, i8* noundef nonnull %a1, i64 noundef 12) #4
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #2

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #3

attributes #0 = { nofree noinline norecurse nosync nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
!8 = !{i64 2148182272, i64 2148182308, i64 2148182376}

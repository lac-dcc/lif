; ModuleID = 'llvm-ir/main.ctgrind.ll'
source_filename = "src/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %a = alloca [3 x i32], align 4
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %a1 = bitcast [3 x i32]* %a to i8*
  call void @llvm.var.annotation(i8* %a1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 19, i8* null)
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0
  %0 = bitcast i32* %arraydecay to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef %0, i64 noundef 12)
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %arraydecay2 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0
  %1 = ptrtoint i32* %arraydecay2 to i64
  %arrayidx3 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %1, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 12, i64* %arrayidx4, align 16
  %arrayidx5 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx6, align 16
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %2 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx8, i64 0) #3, !srcloc !6
  store volatile i64 %2, i64* %_zzq_result, align 8
  %3 = load volatile i64, i64* %_zzq_result, align 8
  %arraydecay9 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0
  call void @mu(i32* noundef %arraydecay9)
  %arraydecay10 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0
  %4 = bitcast i32* %arraydecay10 to i8*
  %call11 = call i64 @write(i32 noundef 1, i8* noundef %4, i64 noundef 12)
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #2

declare void @mu(i32* noundef) #2

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.6"}
!6 = !{i64 2148182272, i64 2148182308, i64 2148182376}

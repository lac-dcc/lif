; ModuleID = 'llvm-ir/main.ctgrind.ll'
source_filename = "src/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.des_ctx = type { [32 x i64], [32 x i64] }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %in_key = alloca [32 x i8], align 16
  %in = alloca [8 x i8], align 1
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %_zzq_args12 = alloca [6 x i64], align 16
  %_zzq_result13 = alloca i64, align 8
  %out = alloca [8 x i8], align 1
  %dc = alloca %struct.des_ctx, align 8
  %work = alloca [2 x i64], align 16
  %in_key1 = bitcast [32 x i8]* %in_key to i8*
  call void @llvm.var.annotation(i8* %in_key1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 21, i8* null)
  %in2 = bitcast [8 x i8]* %in to i8*
  call void @llvm.var.annotation(i8* %in2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 22, i8* null)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %in_key, i64 0, i64 0
  %call = call i64 @read(i32 noundef 0, i8* noundef %arraydecay, i64 noundef 32)
  %arraydecay3 = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  %call4 = call i64 @read(i32 noundef 0, i8* noundef %arraydecay3, i64 noundef 8)
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %arraydecay5 = getelementptr inbounds [32 x i8], [32 x i8]* %in_key, i64 0, i64 0
  %0 = ptrtoint i8* %arraydecay5 to i64
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %0, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 3, i64* %arrayidx7, align 16
  %arrayidx8 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx9, align 16
  %arrayidx10 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx10, align 8
  %arrayidx11 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %1 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx11, i64 0) #4, !srcloc !6
  store volatile i64 %1, i64* %_zzq_result, align 8
  %2 = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx14 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx14, align 16
  %arraydecay15 = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  %3 = ptrtoint i8* %arraydecay15 to i64
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 1
  store volatile i64 %3, i64* %arrayidx16, align 8
  %arrayidx17 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 2
  store volatile i64 3, i64* %arrayidx17, align 16
  %arrayidx18 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx18, align 8
  %arrayidx19 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx19, align 16
  %arrayidx20 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx20, align 8
  %arrayidx21 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 0
  %4 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx21, i64 0) #4, !srcloc !7
  store volatile i64 %4, i64* %_zzq_result13, align 8
  %5 = load volatile i64, i64* %_zzq_result13, align 8
  %6 = bitcast [8 x i8]* %out to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %6, i8 0, i64 8, i1 false)
  %7 = bitcast [2 x i64]* %work to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 16, i1 false)
  %arraydecay23 = getelementptr inbounds [32 x i8], [32 x i8]* %in_key, i64 0, i64 0
  call void @deskey(i8* noundef %arraydecay23, i16 noundef signext 0)
  %ek = getelementptr inbounds %struct.des_ctx, %struct.des_ctx* %dc, i32 0, i32 0
  %arraydecay24 = getelementptr inbounds [32 x i64], [32 x i64]* %ek, i64 0, i64 0
  call void @cpkey(i64* noundef %arraydecay24)
  %arraydecay25 = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  %arraydecay26 = getelementptr inbounds [2 x i64], [2 x i64]* %work, i64 0, i64 0
  call void @scrunch(i8* noundef %arraydecay25, i64* noundef %arraydecay26)
  %ek27 = getelementptr inbounds %struct.des_ctx, %struct.des_ctx* %dc, i32 0, i32 0
  %arraydecay28 = getelementptr inbounds [32 x i64], [32 x i64]* %ek27, i64 0, i64 0
  %arraydecay29 = getelementptr inbounds [2 x i64], [2 x i64]* %work, i64 0, i64 0
  call void @desfunc(i64* noundef %arraydecay28, i64* noundef %arraydecay29)
  %arraydecay30 = getelementptr inbounds [2 x i64], [2 x i64]* %work, i64 0, i64 0
  %arraydecay31 = getelementptr inbounds [8 x i8], [8 x i8]* %out, i64 0, i64 0
  call void @unscrun(i64* noundef %arraydecay30, i8* noundef %arraydecay31)
  %arraydecay32 = getelementptr inbounds [8 x i8], [8 x i8]* %out, i64 0, i64 0
  %call33 = call i64 @write(i32 noundef 1, i8* noundef %arraydecay32, i64 noundef 8)
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @deskey(i8* noundef, i16 noundef signext) #2

declare void @cpkey(i64* noundef) #2

declare void @scrunch(i8* noundef, i64* noundef) #2

declare void @desfunc(i64* noundef, i64* noundef) #2

declare void @unscrun(i64* noundef, i8* noundef) #2

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.6"}
!6 = !{i64 2148337303, i64 2148337339, i64 2148337407}
!7 = !{i64 2148338863, i64 2148338899, i64 2148338967}

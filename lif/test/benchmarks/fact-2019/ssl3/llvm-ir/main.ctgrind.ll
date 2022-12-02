; ModuleID = 'llvm-ir/main.ctgrind.ll'
source_filename = "src/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.uint8ptr_wrapped_ty = type { i8*, i64 }
%struct.SHAstate_st = type { i32, i32, i32, i32, i32, i32, i32, [16 x i32], i32 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %md_state = alloca %struct.uint8ptr_wrapped_ty, align 8
  %mac_out = alloca %struct.uint8ptr_wrapped_ty, align 8
  %header = alloca %struct.uint8ptr_wrapped_ty, align 8
  %data = alloca %struct.uint8ptr_wrapped_ty, align 8
  %data_plus_mac_size = alloca i64, align 8
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %_zzq_args43 = alloca [6 x i64], align 16
  %_zzq_result44 = alloca i64, align 8
  %_zzq_args56 = alloca [6 x i64], align 16
  %_zzq_result57 = alloca i64, align 8
  %_zzq_args69 = alloca [6 x i64], align 16
  %_zzq_result70 = alloca i64, align 8
  %_zzq_args82 = alloca [6 x i64], align 16
  %_zzq_result83 = alloca i64, align 8
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 1
  store i64 96, i64* %len, align 8
  %len1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 1
  store i64 20, i64* %len1, align 8
  %add = add i64 20, 40
  %add2 = add i64 %add, 8
  %add3 = add i64 %add2, 1
  %add4 = add i64 %add3, 2
  %len5 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  store i64 %add4, i64* %len5, align 8
  %len6 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  store i64 128, i64* %len6, align 8
  %len7 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 1
  %0 = load i64, i64* %len7, align 8
  %mul = mul i64 %0, 1
  %call = call noalias i8* @malloc(i64 noundef %mul) #4
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 0
  store i8* %call, i8** %buf, align 8
  %len8 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 1
  %1 = load i64, i64* %len8, align 8
  %mul9 = mul i64 %1, 1
  %call10 = call noalias i8* @malloc(i64 noundef %mul9) #4
  %buf11 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 0
  store i8* %call10, i8** %buf11, align 8
  %len12 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %2 = load i64, i64* %len12, align 8
  %mul13 = mul i64 %2, 1
  %call14 = call noalias i8* @malloc(i64 noundef %mul13) #4
  %buf15 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 0
  store i8* %call14, i8** %buf15, align 8
  %len16 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %3 = load i64, i64* %len16, align 8
  %mul17 = mul i64 %3, 1
  %call18 = call noalias i8* @malloc(i64 noundef %mul17) #4
  %buf19 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 0
  store i8* %call18, i8** %buf19, align 8
  %buf20 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 0
  %4 = load i8*, i8** %buf20, align 8
  %5 = bitcast i8* %4 to %struct.SHAstate_st*
  %call21 = call i32 @SHA1_Init(%struct.SHAstate_st* noundef %5)
  %buf22 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 0
  %6 = load i8*, i8** %buf22, align 8
  %len23 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %7 = load i64, i64* %len23, align 8
  %mul24 = mul i64 %7, 1
  %call25 = call i64 @read(i32 noundef 0, i8* noundef %6, i64 noundef %mul24)
  %buf26 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 0
  %8 = load i8*, i8** %buf26, align 8
  %len27 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %9 = load i64, i64* %len27, align 8
  %mul28 = mul i64 %9, 1
  %call29 = call i64 @read(i32 noundef 0, i8* noundef %8, i64 noundef %mul28)
  %data_plus_mac_size30 = bitcast i64* %data_plus_mac_size to i8*
  call void @llvm.var.annotation(i8* %data_plus_mac_size30, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 52, i8* null)
  %len31 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %10 = load i64, i64* %len31, align 8
  %buf32 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 0
  %11 = load i8*, i8** %buf32, align 8
  %arrayidx = getelementptr inbounds i8, i8* %11, i64 127
  %12 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %12 to i64
  %sub = sub i64 %10, %conv
  store i64 %sub, i64* %data_plus_mac_size, align 8
  %arrayidx33 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx33, align 16
  %buf34 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 0
  %13 = load i8*, i8** %buf34, align 8
  %14 = ptrtoint i8* %13 to i64
  %arrayidx35 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %14, i64* %arrayidx35, align 8
  %len36 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %md_state, i32 0, i32 1
  %15 = load i64, i64* %len36, align 8
  %mul37 = mul i64 1, %15
  %arrayidx38 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 %mul37, i64* %arrayidx38, align 16
  %arrayidx39 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx39, align 8
  %arrayidx40 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx40, align 16
  %arrayidx41 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx41, align 8
  %arrayidx42 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %16 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx42, i64 0) #4, !srcloc !6
  store volatile i64 %16, i64* %_zzq_result, align 8
  %17 = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx45 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx45, align 16
  %buf46 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 0
  %18 = load i8*, i8** %buf46, align 8
  %19 = ptrtoint i8* %18 to i64
  %arrayidx47 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 1
  store volatile i64 %19, i64* %arrayidx47, align 8
  %len48 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 1
  %20 = load i64, i64* %len48, align 8
  %mul49 = mul i64 1, %20
  %arrayidx50 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 2
  store volatile i64 %mul49, i64* %arrayidx50, align 16
  %arrayidx51 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx51, align 8
  %arrayidx52 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx52, align 16
  %arrayidx53 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx53, align 8
  %arrayidx54 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args43, i64 0, i64 0
  %21 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx54, i64 0) #4, !srcloc !7
  store volatile i64 %21, i64* %_zzq_result44, align 8
  %22 = load volatile i64, i64* %_zzq_result44, align 8
  %arrayidx58 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx58, align 16
  %buf59 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 0
  %23 = load i8*, i8** %buf59, align 8
  %24 = ptrtoint i8* %23 to i64
  %arrayidx60 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 1
  store volatile i64 %24, i64* %arrayidx60, align 8
  %len61 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %header, i32 0, i32 1
  %25 = load i64, i64* %len61, align 8
  %mul62 = mul i64 1, %25
  %arrayidx63 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 2
  store volatile i64 %mul62, i64* %arrayidx63, align 16
  %arrayidx64 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx64, align 8
  %arrayidx65 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx65, align 16
  %arrayidx66 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx66, align 8
  %arrayidx67 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args56, i64 0, i64 0
  %26 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx67, i64 0) #4, !srcloc !8
  store volatile i64 %26, i64* %_zzq_result57, align 8
  %27 = load volatile i64, i64* %_zzq_result57, align 8
  %arrayidx71 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx71, align 16
  %buf72 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 0
  %28 = load i8*, i8** %buf72, align 8
  %29 = ptrtoint i8* %28 to i64
  %arrayidx73 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 1
  store volatile i64 %29, i64* %arrayidx73, align 8
  %len74 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %data, i32 0, i32 1
  %30 = load i64, i64* %len74, align 8
  %mul75 = mul i64 1, %30
  %arrayidx76 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 2
  store volatile i64 %mul75, i64* %arrayidx76, align 16
  %arrayidx77 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx77, align 8
  %arrayidx78 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx78, align 16
  %arrayidx79 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx79, align 8
  %arrayidx80 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args69, i64 0, i64 0
  %31 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx80, i64 0) #4, !srcloc !9
  store volatile i64 %31, i64* %_zzq_result70, align 8
  %32 = load volatile i64, i64* %_zzq_result70, align 8
  %arrayidx84 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx84, align 16
  %33 = ptrtoint i64* %data_plus_mac_size to i64
  %arrayidx85 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 1
  store volatile i64 %33, i64* %arrayidx85, align 8
  %arrayidx86 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 2
  store volatile i64 1, i64* %arrayidx86, align 16
  %arrayidx87 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx87, align 8
  %arrayidx88 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx88, align 16
  %arrayidx89 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx89, align 8
  %arrayidx90 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args82, i64 0, i64 0
  %34 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx90, i64 0) #4, !srcloc !10
  store volatile i64 %34, i64* %_zzq_result83, align 8
  %35 = load volatile i64, i64* %_zzq_result83, align 8
  %36 = load i64, i64* %data_plus_mac_size, align 8
  %call92 = call i32 @__ssl3_cbc_digest_record(%struct.uint8ptr_wrapped_ty* noundef %md_state, %struct.uint8ptr_wrapped_ty* noundef %mac_out, %struct.uint8ptr_wrapped_ty* noundef %header, %struct.uint8ptr_wrapped_ty* noundef %data, i64 noundef %36)
  %buf93 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 0
  %37 = load i8*, i8** %buf93, align 8
  %len94 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 1
  %38 = load i64, i64* %len94, align 8
  %mul95 = mul i64 %38, 1
  %call96 = call i64 @write(i32 noundef 1, i8* noundef %37, i64 noundef %mul95)
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #1

declare i32 @SHA1_Init(%struct.SHAstate_st* noundef) #2

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #2

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #3

declare i32 @__ssl3_cbc_digest_record(%struct.uint8ptr_wrapped_ty* noundef, %struct.uint8ptr_wrapped_ty* noundef, %struct.uint8ptr_wrapped_ty* noundef, %struct.uint8ptr_wrapped_ty* noundef, i64 noundef) #2

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.6"}
!6 = !{i64 2148384488, i64 2148384524, i64 2148384592}
!7 = !{i64 2148386159, i64 2148386195, i64 2148386263}
!8 = !{i64 2148387824, i64 2148387860, i64 2148387928}
!9 = !{i64 2148389477, i64 2148389513, i64 2148389581}
!10 = !{i64 2148391142, i64 2148391178, i64 2148391246}

; ModuleID = 'llvm-ir/main.ll'
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
  %13 = load i64, i64* %data_plus_mac_size, align 8
  %call33 = call i32 @__ssl3_cbc_digest_record(%struct.uint8ptr_wrapped_ty* noundef %md_state, %struct.uint8ptr_wrapped_ty* noundef %mac_out, %struct.uint8ptr_wrapped_ty* noundef %header, %struct.uint8ptr_wrapped_ty* noundef %data, i64 noundef %13)
  %buf34 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 0
  %14 = load i8*, i8** %buf34, align 8
  %len35 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %mac_out, i32 0, i32 1
  %15 = load i64, i64* %len35, align 8
  %mul36 = mul i64 %15, 1
  %call37 = call i64 @write(i32 noundef 1, i8* noundef %14, i64 noundef %mul36)
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

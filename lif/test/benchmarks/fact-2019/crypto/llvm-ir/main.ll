; ModuleID = 'llvm-ir/main.ll'
source_filename = "src/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.uint8ptr_wrapped_ty = type { i8*, i64 }

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %c = alloca %struct.uint8ptr_wrapped_ty, align 8
  %m = alloca %struct.uint8ptr_wrapped_ty, align 8
  %nonce = alloca [24 x i8], align 16
  %data = alloca [32 x i8], align 16
  %r1 = alloca i8, align 1
  %r2 = alloca i8, align 1
  %len = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  store i64 163, i64* %len, align 8
  %len1 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 1
  %0 = load i64, i64* %len1, align 8
  %mul = mul i64 %0, 1
  %call = call noalias i8* @malloc(i64 noundef %mul) #4
  %buf = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %c, i32 0, i32 0
  store i8* %call, i8** %buf, align 8
  %len2 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  store i64 163, i64* %len2, align 8
  %len3 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %1 = load i64, i64* %len3, align 8
  %mul4 = mul i64 %1, 1
  %call5 = call noalias i8* @malloc(i64 noundef %mul4) #4
  %buf6 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  store i8* %call5, i8** %buf6, align 8
  %buf7 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %2 = load i8*, i8** %buf7, align 8
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 0, i64 32, i1 false)
  %buf8 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 0
  %3 = load i8*, i8** %buf8, align 8
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 32
  %len9 = getelementptr inbounds %struct.uint8ptr_wrapped_ty, %struct.uint8ptr_wrapped_ty* %m, i32 0, i32 1
  %4 = load i64, i64* %len9, align 8
  %sub = sub i64 %4, 32
  %mul10 = mul i64 %sub, 1
  %call11 = call i64 @read(i32 noundef 0, i8* noundef %add.ptr, i64 noundef %mul10)
  %arraydecay = getelementptr inbounds [24 x i8], [24 x i8]* %nonce, i64 0, i64 0
  %call12 = call i64 @read(i32 noundef 0, i8* noundef %arraydecay, i64 noundef 24)
  %arraydecay13 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %call14 = call i64 @read(i32 noundef 0, i8* noundef %arraydecay13, i64 noundef 32)
  %arraydecay15 = getelementptr inbounds [24 x i8], [24 x i8]* %nonce, i64 0, i64 0
  %arraydecay16 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %call17 = call zeroext i1 @__crypto_secretbox(%struct.uint8ptr_wrapped_ty* noundef %c, %struct.uint8ptr_wrapped_ty* noundef %m, i8* noundef %arraydecay15, i8* noundef %arraydecay16)
  %frombool = zext i1 %call17 to i8
  store i8 %frombool, i8* %r1, align 1
  %arraydecay18 = getelementptr inbounds [24 x i8], [24 x i8]* %nonce, i64 0, i64 0
  %arraydecay19 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %call20 = call zeroext i1 @__crypto_secretbox_open(%struct.uint8ptr_wrapped_ty* noundef %m, %struct.uint8ptr_wrapped_ty* noundef %c, i8* noundef %arraydecay18, i8* noundef %arraydecay19)
  %frombool21 = zext i1 %call20 to i8
  store i8 %frombool21, i8* %r2, align 1
  %call22 = call i64 @write(i32 noundef 1, i8* noundef %r1, i64 noundef 1)
  %call23 = call i64 @write(i32 noundef 1, i8* noundef %r2, i64 noundef 1)
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #3

declare zeroext i1 @__crypto_secretbox(%struct.uint8ptr_wrapped_ty* noundef, %struct.uint8ptr_wrapped_ty* noundef, i8* noundef, i8* noundef) #3

declare zeroext i1 @__crypto_secretbox_open(%struct.uint8ptr_wrapped_ty* noundef, %struct.uint8ptr_wrapped_ty* noundef, i8* noundef, i8* noundef) #3

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #3

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.6"}

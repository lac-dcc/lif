; ModuleID = 'llvm-ir/main.ll'
source_filename = "src/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.cast5_ctx = type { [16 x i32], [16 x i8], i32 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %in_key = alloca [32 x i8], align 16
  %in = alloca [64 x i8], align 16
  %ctx = alloca %struct.cast5_ctx, align 4
  %out = alloca [64 x i8], align 16
  %in_key1 = bitcast [32 x i8]* %in_key to i8*
  call void @llvm.var.annotation(i8* %in_key1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 22, i8* null)
  %in2 = bitcast [64 x i8]* %in to i8*
  call void @llvm.var.annotation(i8* %in2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 23, i8* null)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %in_key, i64 0, i64 0
  %call = call i64 @read(i32 noundef 0, i8* noundef %arraydecay, i64 noundef 32)
  %arraydecay3 = getelementptr inbounds [64 x i8], [64 x i8]* %in, i64 0, i64 0
  %call4 = call i64 @read(i32 noundef 0, i8* noundef %arraydecay3, i64 noundef 64)
  %0 = bitcast [64 x i8]* %out to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 64, i1 false)
  %arraydecay5 = getelementptr inbounds [32 x i8], [32 x i8]* %in_key, i64 0, i64 0
  %call6 = call i32 @cast5_setkey(i8* noundef %arraydecay5, %struct.cast5_ctx* noundef %ctx, i32 noundef 16)
  %arraydecay7 = getelementptr inbounds [64 x i8], [64 x i8]* %out, i64 0, i64 0
  %arraydecay8 = getelementptr inbounds [64 x i8], [64 x i8]* %in, i64 0, i64 0
  %rr = getelementptr inbounds %struct.cast5_ctx, %struct.cast5_ctx* %ctx, i32 0, i32 2
  %1 = load i32, i32* %rr, align 4
  call void @cast5_encrypt(%struct.cast5_ctx* noundef %ctx, i8* noundef %arraydecay7, i8* noundef %arraydecay8, i32 noundef %1)
  %arraydecay9 = getelementptr inbounds [64 x i8], [64 x i8]* %out, i64 0, i64 0
  %call10 = call i64 @write(i32 noundef 1, i8* noundef %arraydecay9, i64 noundef 64)
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @cast5_setkey(i8* noundef, %struct.cast5_ctx* noundef, i32 noundef) #2

declare void @cast5_encrypt(%struct.cast5_ctx* noundef, i8* noundef, i8* noundef, i32 noundef) #2

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.6"}

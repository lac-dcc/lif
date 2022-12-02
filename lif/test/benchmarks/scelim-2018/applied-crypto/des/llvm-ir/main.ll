; ModuleID = 'llvm-ir/main.ll'
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
  %0 = bitcast [8 x i8]* %out to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 8, i1 false)
  %1 = bitcast [2 x i64]* %work to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 16, i1 false)
  %arraydecay5 = getelementptr inbounds [32 x i8], [32 x i8]* %in_key, i64 0, i64 0
  call void @deskey(i8* noundef %arraydecay5, i16 noundef signext 0)
  %ek = getelementptr inbounds %struct.des_ctx, %struct.des_ctx* %dc, i32 0, i32 0
  %arraydecay6 = getelementptr inbounds [32 x i64], [32 x i64]* %ek, i64 0, i64 0
  call void @cpkey(i64* noundef %arraydecay6)
  %arraydecay7 = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  %arraydecay8 = getelementptr inbounds [2 x i64], [2 x i64]* %work, i64 0, i64 0
  call void @scrunch(i8* noundef %arraydecay7, i64* noundef %arraydecay8)
  %ek9 = getelementptr inbounds %struct.des_ctx, %struct.des_ctx* %dc, i32 0, i32 0
  %arraydecay10 = getelementptr inbounds [32 x i64], [32 x i64]* %ek9, i64 0, i64 0
  %arraydecay11 = getelementptr inbounds [2 x i64], [2 x i64]* %work, i64 0, i64 0
  call void @desfunc(i64* noundef %arraydecay10, i64* noundef %arraydecay11)
  %arraydecay12 = getelementptr inbounds [2 x i64], [2 x i64]* %work, i64 0, i64 0
  %arraydecay13 = getelementptr inbounds [8 x i8], [8 x i8]* %out, i64 0, i64 0
  call void @unscrun(i64* noundef %arraydecay12, i8* noundef %arraydecay13)
  %arraydecay14 = getelementptr inbounds [8 x i8], [8 x i8]* %out, i64 0, i64 0
  %call15 = call i64 @write(i32 noundef 1, i8* noundef %arraydecay14, i64 noundef 8)
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

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.6"}

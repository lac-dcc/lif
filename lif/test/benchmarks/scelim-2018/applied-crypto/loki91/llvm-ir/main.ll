; ModuleID = 'llvm-ir/main.ll'
source_filename = "src/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.loki_ctx = type { [16 x i32] }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %in = alloca [8 x i8], align 1
  %in_key = alloca [24 x i8], align 16
  %lc = alloca %struct.loki_ctx, align 4
  %in1 = bitcast [8 x i8]* %in to i8*
  call void @llvm.var.annotation(i8* %in1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 20, i8* null)
  %in_key2 = bitcast [24 x i8]* %in_key to i8*
  call void @llvm.var.annotation(i8* %in_key2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 21, i8* null)
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  %call = call i64 @read(i32 noundef 0, i8* noundef %arraydecay, i64 noundef 8)
  %arraydecay3 = getelementptr inbounds [24 x i8], [24 x i8]* %in_key, i64 0, i64 0
  %call4 = call i64 @read(i32 noundef 0, i8* noundef %arraydecay3, i64 noundef 24)
  %arraydecay5 = getelementptr inbounds [24 x i8], [24 x i8]* %in_key, i64 0, i64 0
  call void @setlokikey(i8* noundef %arraydecay5, %struct.loki_ctx* noundef %lc)
  %arraydecay6 = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  call void @enloki(%struct.loki_ctx* noundef %lc, i8* noundef %arraydecay6)
  %arraydecay7 = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  %call8 = call i64 @write(i32 noundef 1, i8* noundef %arraydecay7, i64 noundef 8)
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #2

declare void @setlokikey(i8* noundef, %struct.loki_ctx* noundef) #2

declare void @enloki(%struct.loki_ctx* noundef, i8* noundef) #2

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.6"}

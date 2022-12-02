; ModuleID = 'llvm-ir/main.ll'
source_filename = "src/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"
@__const.main.basepoint = private unnamed_addr constant <{ i8, [31 x i8] }> <{ i8 9, [31 x i8] zeroinitializer }>, align 16

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %data = alloca [32 x i8], align 16
  %out = alloca [32 x i8], align 16
  %ret = alloca i8, align 1
  %basepoint = alloca [32 x i8], align 16
  %data1 = bitcast [32 x i8]* %data to i8*
  call void @llvm.var.annotation(i8* %data1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 19, i8* null)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %call = call i64 @read(i32 noundef 0, i8* noundef %arraydecay, i64 noundef 32)
  %0 = bitcast [32 x i8]* %out to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 32, i1 false)
  store i8 0, i8* %ret, align 1
  %1 = bitcast [32 x i8]* %basepoint to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 getelementptr inbounds (<{ i8, [31 x i8] }>, <{ i8, [31 x i8] }>* @__const.main.basepoint, i32 0, i32 0), i64 32, i1 false)
  %arraydecay2 = getelementptr inbounds [32 x i8], [32 x i8]* %out, i64 0, i64 0
  %arraydecay3 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %arraydecay4 = getelementptr inbounds [32 x i8], [32 x i8]* %basepoint, i64 0, i64 0
  %call5 = call i32 @curve25519_donna(i8* noundef %arraydecay2, i8* noundef %arraydecay3, i8* noundef %arraydecay4)
  %arraydecay6 = getelementptr inbounds [32 x i8], [32 x i8]* %data, i64 0, i64 0
  %arraydecay7 = getelementptr inbounds [32 x i8], [32 x i8]* %out, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 16 %arraydecay7, i64 32, i1 false)
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* %out, i64 0, i64 0
  %2 = load i8, i8* %arrayidx, align 16
  %conv = zext i8 %2 to i32
  %3 = load i8, i8* %ret, align 1
  %conv8 = zext i8 %3 to i32
  %xor = xor i32 %conv8, %conv
  %conv9 = trunc i32 %xor to i8
  store i8 %conv9, i8* %ret, align 1
  %call10 = call i64 @write(i32 noundef 1, i8* noundef %ret, i64 noundef 1)
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare i32 @curve25519_donna(i8* noundef, i8* noundef, i8* noundef) #2

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.6"}

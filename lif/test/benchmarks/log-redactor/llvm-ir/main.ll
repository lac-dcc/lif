; ModuleID = 'llvm-ir/main.ll'
source_filename = "src/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = call i8* @llvm.stacksave()
  %vla = alloca i8*, i64 3, align 16
  %vla1 = bitcast i8** %vla to i8*
  call void @llvm.var.annotation(i8* %vla1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 25, i8* null)
  %vla2 = alloca i8, i64 4, align 16
  call void @llvm.var.annotation(i8* %vla2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 26, i8* null)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp ult i32 %i.0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call noalias i8* @malloc(i64 noundef 10) #5
  %idxprom = zext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8*, i8** %vla, i64 %idxprom
  store i8* %call, i8** %arrayidx, align 8
  %idxprom3 = zext i32 %i.0 to i64
  %arrayidx4 = getelementptr inbounds i8*, i8** %vla, i64 %idxprom3
  %1 = load i8*, i8** %arrayidx4, align 8
  %call5 = call i64 @read(i32 noundef 0, i8* noundef %1, i64 noundef 10)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %call6 = call i64 @read(i32 noundef 0, i8* noundef %vla2, i64 noundef 4)
  call void @log_redactor(i8** noundef %vla, i8* noundef %vla2, i32 noundef 3, i32 noundef 10, i32 noundef 4)
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc13, %for.end
  %j.0 = phi i32 [ 0, %for.end ], [ %inc14, %for.inc13 ]
  %cmp8 = icmp ult i32 %j.0, 3
  br i1 %cmp8, label %for.body9, label %for.end15

for.body9:                                        ; preds = %for.cond7
  %idxprom10 = zext i32 %j.0 to i64
  %arrayidx11 = getelementptr inbounds i8*, i8** %vla, i64 %idxprom10
  %2 = load i8*, i8** %arrayidx11, align 8
  %call12 = call i64 @write(i32 noundef 1, i8* noundef %2, i64 noundef 10)
  br label %for.inc13

for.inc13:                                        ; preds = %for.body9
  %inc14 = add i32 %j.0, 1
  br label %for.cond7, !llvm.loop !8

for.end15:                                        ; preds = %for.cond7
  call void @llvm.stackrestore(i8* %0)
  ret i32 0
}

; Function Attrs: nofree nosync nounwind willreturn
declare i8* @llvm.stacksave() #1

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #4

declare void @log_redactor(i8** noundef, i8* noundef, i32 noundef, i32 noundef, i32 noundef) #4

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.stackrestore(i8*) #1

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}

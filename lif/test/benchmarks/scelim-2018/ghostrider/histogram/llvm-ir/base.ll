; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @histogram(i32* noundef %a, i32* noundef %c) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 1000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, i32* %c, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc12, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc13, %for.inc12 ]
  %cmp2 = icmp slt i32 %i.1, 1000
  br i1 %cmp2, label %for.body3, label %for.end14

for.body3:                                        ; preds = %for.cond1
  %idxprom4 = sext i32 %i.1 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %a, i64 %idxprom4
  %0 = load i32, i32* %arrayidx5, align 4
  %cmp6 = icmp sgt i32 %0, 0
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %for.body3
  %rem = srem i32 %0, 1000
  br label %if.end

if.else:                                          ; preds = %for.body3
  %sub = sub nsw i32 0, %0
  %rem7 = srem i32 %sub, 1000
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %t.0 = phi i32 [ %rem, %if.then ], [ %rem7, %if.else ]
  %idxprom8 = sext i32 %t.0 to i64
  %arrayidx9 = getelementptr inbounds i32, i32* %c, i64 %idxprom8
  %1 = load i32, i32* %arrayidx9, align 4
  %add = add nsw i32 %1, 1
  %idxprom10 = sext i32 %t.0 to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %c, i64 %idxprom10
  store i32 %add, i32* %arrayidx11, align 4
  br label %for.inc12

for.inc12:                                        ; preds = %if.end
  %inc13 = add nsw i32 %i.1, 1
  br label %for.cond1, !llvm.loop !8

for.end14:                                        ; preds = %for.cond1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %in = alloca [1000 x i32], align 16
  %out = alloca [1000 x i32], align 16
  %in1 = bitcast [1000 x i32]* %in to i8*
  call void @llvm.var.annotation(i8* %in1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 18, i8* null)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 1000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds [1000 x i32], [1000 x i32]* %in, i64 0, i64 %idxprom
  %0 = bitcast i32* %arrayidx to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef %0, i64 noundef 4)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [1000 x i32], [1000 x i32]* %in, i64 0, i64 0
  %arraydecay2 = getelementptr inbounds [1000 x i32], [1000 x i32]* %out, i64 0, i64 0
  call void @histogram(i32* noundef %arraydecay, i32* noundef %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1000 x i32], [1000 x i32]* %out, i64 0, i64 0
  %1 = bitcast i32* %arraydecay3 to i8*
  %call4 = call i64 @write(i32 noundef 1, i8* noundef %1, i64 noundef 4000)
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #2

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 14.0.6"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}

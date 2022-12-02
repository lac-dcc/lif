; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @log_redactor(i8** noundef %log, i8* noundef %pattern, i32 noundef %L0, i32 noundef %L1, i32 noundef %P) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc48, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc49, %for.inc48 ]
  %cmp = icmp ult i32 %i.0, %L0
  br i1 %cmp, label %for.body, label %for.end50

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %found.0 = phi i32 [ 0, %for.body ], [ %found.1, %for.inc ]
  %j.0 = phi i32 [ 0, %for.body ], [ %inc17, %for.inc ]
  %sub = sub nsw i32 %L1, %P
  %add = add nsw i32 %sub, 1
  %cmp2 = icmp ult i32 %j.0, %add
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  br label %while.cond

while.cond:                                       ; preds = %if.end, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %inc, %if.end ]
  %cmp4 = icmp ult i32 %k.0, %P
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %idxprom = zext i32 %k.0 to i64
  %arrayidx = getelementptr inbounds i8, i8* %pattern, i64 %idxprom
  %0 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %0 to i32
  %idxprom5 = zext i32 %i.0 to i64
  %arrayidx6 = getelementptr inbounds i8*, i8** %log, i64 %idxprom5
  %1 = load i8*, i8** %arrayidx6, align 8
  %add7 = add i32 %j.0, %k.0
  %idxprom8 = zext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds i8, i8* %1, i64 %idxprom8
  %2 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %2 to i32
  %cmp11 = icmp ne i32 %conv, %conv10
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %inc = add i32 %k.0, 1
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %if.then, %while.cond
  %cmp13 = icmp eq i32 %k.0, %P
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %while.end
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %while.end
  %found.1 = phi i32 [ 1, %if.then15 ], [ %found.0, %while.end ]
  br label %for.inc

for.inc:                                          ; preds = %if.end16
  %inc17 = add i32 %j.0, 1
  br label %for.cond1, !llvm.loop !8

for.end:                                          ; preds = %for.cond1
  %tobool = icmp ne i32 %found.0, 0
  br i1 %tobool, label %if.end19, label %if.then18

if.then18:                                        ; preds = %for.end
  br label %for.inc48

if.end19:                                         ; preds = %for.end
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc45, %if.end19
  %j20.0 = phi i32 [ 0, %if.end19 ], [ %inc46, %for.inc45 ]
  %cmp22 = icmp ult i32 %j20.0, %L1
  br i1 %cmp22, label %for.body24, label %for.end47

for.body24:                                       ; preds = %for.cond21
  %idxprom25 = zext i32 %i.0 to i64
  %arrayidx26 = getelementptr inbounds i8*, i8** %log, i64 %idxprom25
  %3 = load i8*, i8** %arrayidx26, align 8
  %idxprom27 = zext i32 %j20.0 to i64
  %arrayidx28 = getelementptr inbounds i8, i8* %3, i64 %idxprom27
  %4 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %4 to i32
  %cmp30 = icmp sge i32 %conv29, 48
  br i1 %cmp30, label %land.lhs.true, label %if.end44

land.lhs.true:                                    ; preds = %for.body24
  %idxprom32 = zext i32 %i.0 to i64
  %arrayidx33 = getelementptr inbounds i8*, i8** %log, i64 %idxprom32
  %5 = load i8*, i8** %arrayidx33, align 8
  %idxprom34 = zext i32 %j20.0 to i64
  %arrayidx35 = getelementptr inbounds i8, i8* %5, i64 %idxprom34
  %6 = load i8, i8* %arrayidx35, align 1
  %conv36 = sext i8 %6 to i32
  %cmp37 = icmp sle i32 %conv36, 57
  br i1 %cmp37, label %if.then39, label %if.end44

if.then39:                                        ; preds = %land.lhs.true
  %idxprom40 = zext i32 %i.0 to i64
  %arrayidx41 = getelementptr inbounds i8*, i8** %log, i64 %idxprom40
  %7 = load i8*, i8** %arrayidx41, align 8
  %idxprom42 = zext i32 %j20.0 to i64
  %arrayidx43 = getelementptr inbounds i8, i8* %7, i64 %idxprom42
  store i8 42, i8* %arrayidx43, align 1
  br label %if.end44

if.end44:                                         ; preds = %if.then39, %land.lhs.true, %for.body24
  br label %for.inc45

for.inc45:                                        ; preds = %if.end44
  %inc46 = add i32 %j20.0, 1
  br label %for.cond21, !llvm.loop !9

for.end47:                                        ; preds = %for.cond21
  br label %for.inc48

for.inc48:                                        ; preds = %for.end47, %if.then18
  %inc49 = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !10

for.end50:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %_zzq_args14 = alloca [6 x i64], align 16
  %_zzq_result15 = alloca i64, align 8
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
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  %call6 = call i64 @read(i32 noundef 0, i8* noundef %vla2, i64 noundef 4)
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx7, align 16
  %2 = ptrtoint i8* %vla2 to i64
  %arrayidx8 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %2, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 4, i64* %arrayidx9, align 16
  %arrayidx10 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx10, align 8
  %arrayidx11 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx11, align 16
  %arrayidx12 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx12, align 8
  %arrayidx13 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %3 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx13, i64 0) #5, !srcloc !12
  store volatile i64 %3, i64* %_zzq_result, align 8
  %4 = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx16, align 16
  %5 = ptrtoint i8** %vla to i64
  %arrayidx17 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 1
  store volatile i64 %5, i64* %arrayidx17, align 8
  %arrayidx18 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 2
  store volatile i64 30, i64* %arrayidx18, align 16
  %arrayidx19 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx19, align 8
  %arrayidx20 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx20, align 16
  %arrayidx21 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx21, align 8
  %arrayidx22 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 0
  %6 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx22, i64 0) #5, !srcloc !13
  store volatile i64 %6, i64* %_zzq_result15, align 8
  %7 = load volatile i64, i64* %_zzq_result15, align 8
  call void @log_redactor(i8** noundef %vla, i8* noundef %vla2, i32 noundef 3, i32 noundef 10, i32 noundef 4)
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc30, %for.end
  %j.0 = phi i32 [ 0, %for.end ], [ %inc31, %for.inc30 ]
  %cmp25 = icmp ult i32 %j.0, 3
  br i1 %cmp25, label %for.body26, label %for.end32

for.body26:                                       ; preds = %for.cond24
  %idxprom27 = zext i32 %j.0 to i64
  %arrayidx28 = getelementptr inbounds i8*, i8** %vla, i64 %idxprom27
  %8 = load i8*, i8** %arrayidx28, align 8
  %call29 = call i64 @write(i32 noundef 1, i8* noundef %8, i64 noundef 10)
  br label %for.inc30

for.inc30:                                        ; preds = %for.body26
  %inc31 = add i32 %j.0, 1
  br label %for.cond24, !llvm.loop !14

for.end32:                                        ; preds = %for.cond24
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

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.stackrestore(i8*) #1

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = !{i64 2148240186, i64 2148240222, i64 2148240290}
!13 = !{i64 2148241812, i64 2148241848, i64 2148241916}
!14 = distinct !{!14, !7}

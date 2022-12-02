; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @comp(i32* noundef %a, i32* noundef %b, i32 noundef %n) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %ha.0 = phi i32 [ 1, %entry ], [ %ha.1, %for.inc ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc3, %for.inc ]
  %cmp = icmp slt i32 %i.0, %n
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %idxprom1 = sext i32 %i.0 to i64
  %arrayidx2 = getelementptr inbounds i32, i32* %a, i64 %idxprom1
  %1 = load i32, i32* %arrayidx2, align 4
  %mul = mul nsw i32 %ha.0, %1
  %rem = srem i32 %mul, 1024
  br label %if.end

if.else:                                          ; preds = %for.body
  %inc = add nsw i32 %ha.0, 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %ha.1 = phi i32 [ %rem, %if.then ], [ %inc, %if.else ]
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %inc3 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc19, %for.end
  %hb.0 = phi i32 [ 1, %for.end ], [ %hb.1, %for.inc19 ]
  %i4.0 = phi i32 [ 0, %for.end ], [ %inc20, %for.inc19 ]
  %cmp6 = icmp slt i32 %i4.0, %n
  br i1 %cmp6, label %for.body7, label %for.end21

for.body7:                                        ; preds = %for.cond5
  %idxprom8 = sext i32 %i4.0 to i64
  %arrayidx9 = getelementptr inbounds i32, i32* %b, i64 %idxprom8
  %2 = load i32, i32* %arrayidx9, align 4
  %tobool10 = icmp ne i32 %2, 0
  br i1 %tobool10, label %if.then11, label %if.else16

if.then11:                                        ; preds = %for.body7
  %idxprom12 = sext i32 %i4.0 to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %b, i64 %idxprom12
  %3 = load i32, i32* %arrayidx13, align 4
  %mul14 = mul nsw i32 %hb.0, %3
  %rem15 = srem i32 %mul14, 1024
  br label %if.end18

if.else16:                                        ; preds = %for.body7
  %inc17 = add nsw i32 %hb.0, 1
  br label %if.end18

if.end18:                                         ; preds = %if.else16, %if.then11
  %hb.1 = phi i32 [ %rem15, %if.then11 ], [ %inc17, %if.else16 ]
  br label %for.inc19

for.inc19:                                        ; preds = %if.end18
  %inc20 = add nsw i32 %i4.0, 1
  br label %for.cond5, !llvm.loop !8

for.end21:                                        ; preds = %for.cond5
  %cmp22 = icmp eq i32 %ha.0, %hb.0
  br i1 %cmp22, label %if.then23, label %if.else24

if.then23:                                        ; preds = %for.end21
  br label %return

if.else24:                                        ; preds = %for.end21
  br label %return

return:                                           ; preds = %if.else24, %if.then23
  %retval.0 = phi i32 [ 1, %if.then23 ], [ 0, %if.else24 ]
  ret i32 %retval.0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %b = alloca i32*, align 8
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %r = alloca i32, align 4
  %0 = bitcast i32* %n to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef %0, i64 noundef 4)
  %1 = bitcast i32* %m to i8*
  %call1 = call i64 @read(i32 noundef 0, i8* noundef %1, i64 noundef 4)
  %2 = load i32, i32* %n, align 4
  %conv = sext i32 %2 to i64
  %mul = mul i64 %conv, 4
  %call2 = call noalias i8* @malloc(i64 noundef %mul) #4
  %3 = bitcast i8* %call2 to i32*
  %b3 = bitcast i32** %b to i8*
  call void @llvm.var.annotation(i8* %b3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 28, i8* null)
  %4 = load i32, i32* %n, align 4
  %conv4 = sext i32 %4 to i64
  %mul5 = mul i64 %conv4, 4
  %call6 = call noalias i8* @malloc(i64 noundef %mul5) #4
  %5 = bitcast i8* %call6 to i32*
  store i32* %5, i32** %b, align 8
  %6 = bitcast i32* %3 to i8*
  %7 = load i32, i32* %n, align 4
  %conv7 = sext i32 %7 to i64
  %mul8 = mul i64 4, %conv7
  %call9 = call i64 @read(i32 noundef 0, i8* noundef %6, i64 noundef %mul8)
  %8 = load i32*, i32** %b, align 8
  %9 = bitcast i32* %8 to i8*
  %10 = load i32, i32* %n, align 4
  %conv10 = sext i32 %10 to i64
  %mul11 = mul i64 4, %conv10
  %call12 = call i64 @read(i32 noundef 0, i8* noundef %9, i64 noundef %mul11)
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %11 = load i32*, i32** %b, align 8
  %12 = ptrtoint i32* %11 to i64
  %arrayidx13 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %12, i64* %arrayidx13, align 8
  %13 = load i32, i32* %n, align 4
  %conv14 = sext i32 %13 to i64
  %mul15 = mul i64 4, %conv14
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 %mul15, i64* %arrayidx16, align 16
  %arrayidx17 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx17, align 8
  %arrayidx18 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx18, align 16
  %arrayidx19 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx19, align 8
  %arrayidx20 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %14 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx20, i64 0) #4, !srcloc !9
  store volatile i64 %14, i64* %_zzq_result, align 8
  %15 = load volatile i64, i64* %_zzq_result, align 8
  %16 = load i32*, i32** %b, align 8
  %17 = load i32, i32* %m, align 4
  %call21 = call i32 @comp(i32* noundef %3, i32* noundef %16, i32 noundef %17)
  store i32 %call21, i32* %r, align 4
  %18 = bitcast i32* %r to i8*
  %call22 = call i64 @write(i32 noundef 1, i8* noundef %18, i64 noundef 4)
  ret i32 0
}

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #3

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #1

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #4 = { nounwind }

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
!9 = !{i64 2148289819, i64 2148289855, i64 2148289923}

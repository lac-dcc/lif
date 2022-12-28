; ModuleID = 'llvm-ir/base.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%i32ptr.wrapped.ty = type { i32*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @mu(%i32ptr.wrapped.ty* noundef %a) #0 {
entry:
  %a.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 1
  %a.field0.length = load i64, i64* %a.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.1 = alloca i1, align 1
  store i1 false, i1* %out.1, align 1
  %out.2 = alloca i1, align 1
  store i1 false, i1* %out.2, align 1
  %out.3 = alloca i1, align 1
  store i1 false, i1* %out.3, align 1
  %out.4 = alloca i1, align 1
  store i1 false, i1* %out.4, align 1
  %out.5 = alloca i1, align 1
  store i1 false, i1* %out.5, align 1
  %out.6 = alloca i1, align 1
  store i1 false, i1* %out.6, align 1
  %out.7 = alloca i1, align 1
  store i1 false, i1* %out.7, align 1
  %out.8 = alloca i1, align 1
  store i1 false, i1* %out.8, align 1
  %out.9 = alloca i1, align 1
  store i1 false, i1* %out.9, align 1
  %out.10 = alloca i1, align 1
  store i1 false, i1* %out.10, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.9, align 1
  %0 = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %a, i32 0, i32 0
  %a.unwrapped = load i32*, i32** %0, align 8
  %b = alloca [3 x i32], align 4
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  store i32 0, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  store i32 0, i32* %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  store i32 0, i32* %arrayidx2, align 4
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %1 = load i1, i1* %out.9, align 1
  %2 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %2
  %cond.fold = or i1 %fwcond.and.fwtaken, %1
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp slt i32 %i.0.rewritten, 32
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i1, i1* %out.1, align 1
  %in. = and i1 %3, %cmp
  %cond.fold11 = or i1 false, %in.
  store i1 %cond.fold11, i1* %out.2, align 1
  %arrayidx3 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %4 = load i32, i32* %arrayidx3, align 4
  %shl = shl i32 %4, 1
  store i32 %shl, i32* %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %5 = load i32, i32* %arrayidx4, align 4
  %shl5 = shl i32 %5, 1
  store i32 %shl5, i32* %arrayidx4, align 4
  %arrayidx6 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %6 = load i32, i32* %arrayidx6, align 4
  %shl7 = shl i32 %6, 1
  store i32 %shl7, i32* %arrayidx6, align 4
  %arrayidx8 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %7 = load i32, i32* %arrayidx8, align 4
  %and = and i32 %7, 1
  %tobool = icmp ne i32 %and, 0
  br label %if.then

if.then:                                          ; preds = %for.body
  %8 = load i1, i1* %out.2, align 1
  %in.12 = and i1 %8, %tobool
  %cond.fold13 = or i1 false, %in.12
  store i1 %cond.fold13, i1* %out.3, align 1
  %9 = load i1, i1* %out.3, align 1
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %idx1.safe = icmp slt i64 2, 3
  %access.safe = and i1 true, %idx1.safe
  %10 = or i1 %9, %access.safe
  %11 = bitcast i64* %shadow to i32*
  %ctsel = select i1 %10, i32* %arrayidx9, i32* %11
  %12 = load i32, i32* %ctsel, align 4
  %or = or i32 %12, 1
  %idx1.safe30 = icmp slt i64 2, 3
  %access.safe31 = and i1 true, %idx1.safe30
  %13 = or i1 %9, %access.safe31
  %14 = bitcast i64* %shadow to i32*
  %ctsel32 = select i1 %13, i32* %arrayidx9, i32* %14
  %15 = load i32, i32* %ctsel32, align 4
  %select.val. = select i1 %9, i32 %or, i32 %15
  store i32 %select.val., i32* %ctsel32, align 4
  br label %if.end

if.end:                                           ; preds = %if.then
  %16 = load i1, i1* %out.3, align 1
  %17 = load i1, i1* %out.2, align 1
  %18 = xor i1 %tobool, true
  %in.14 = and i1 %17, %18
  %cond.fold15 = or i1 false, %16
  %cond.fold16 = or i1 %cond.fold15, %in.14
  store i1 %cond.fold16, i1* %out.4, align 1
  %arrayidx10 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %19 = load i32, i32* %arrayidx10, align 4
  %and11 = and i32 %19, 1
  %tobool12 = icmp ne i32 %and11, 0
  br label %if.then13

if.then13:                                        ; preds = %if.end
  %20 = load i1, i1* %out.4, align 1
  %in.17 = and i1 %20, %tobool12
  %cond.fold18 = or i1 false, %in.17
  store i1 %cond.fold18, i1* %out.5, align 1
  %21 = load i1, i1* %out.5, align 1
  %arrayidx14 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %idx1.safe33 = icmp slt i64 1, 3
  %access.safe34 = and i1 true, %idx1.safe33
  %22 = or i1 %21, %access.safe34
  %23 = bitcast i64* %shadow to i32*
  %ctsel35 = select i1 %22, i32* %arrayidx14, i32* %23
  %24 = load i32, i32* %ctsel35, align 4
  %or15 = or i32 %24, 1
  %idx1.safe36 = icmp slt i64 1, 3
  %access.safe37 = and i1 true, %idx1.safe36
  %25 = or i1 %21, %access.safe37
  %26 = bitcast i64* %shadow to i32*
  %ctsel38 = select i1 %25, i32* %arrayidx14, i32* %26
  %27 = load i32, i32* %ctsel38, align 4
  %select.val.39 = select i1 %21, i32 %or15, i32 %27
  store i32 %select.val.39, i32* %ctsel38, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then13
  %28 = load i1, i1* %out.5, align 1
  %29 = load i1, i1* %out.4, align 1
  %30 = xor i1 %tobool12, true
  %in.19 = and i1 %29, %30
  %cond.fold20 = or i1 false, %28
  %cond.fold21 = or i1 %cond.fold20, %in.19
  store i1 %cond.fold21, i1* %out.6, align 1
  %arrayidx17 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %31 = load i32, i32* %arrayidx17, align 4
  %and18 = and i32 %31, 1
  %tobool19 = icmp ne i32 %and18, 0
  br label %if.then20

if.then20:                                        ; preds = %if.end16
  %32 = load i1, i1* %out.6, align 1
  %in.22 = and i1 %32, %tobool19
  %cond.fold23 = or i1 false, %in.22
  store i1 %cond.fold23, i1* %out.7, align 1
  %33 = load i1, i1* %out.7, align 1
  %arrayidx21 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %idx1.safe40 = icmp slt i64 0, 3
  %access.safe41 = and i1 true, %idx1.safe40
  %34 = or i1 %33, %access.safe41
  %35 = bitcast i64* %shadow to i32*
  %ctsel42 = select i1 %34, i32* %arrayidx21, i32* %35
  %36 = load i32, i32* %ctsel42, align 4
  %or22 = or i32 %36, 1
  %idx1.safe43 = icmp slt i64 0, 3
  %access.safe44 = and i1 true, %idx1.safe43
  %37 = or i1 %33, %access.safe44
  %38 = bitcast i64* %shadow to i32*
  %ctsel45 = select i1 %37, i32* %arrayidx21, i32* %38
  %39 = load i32, i32* %ctsel45, align 4
  %select.val.46 = select i1 %33, i32 %or22, i32 %39
  store i32 %select.val.46, i32* %ctsel45, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then20
  %40 = load i1, i1* %out.7, align 1
  %41 = load i1, i1* %out.6, align 1
  %42 = xor i1 %tobool19, true
  %in.24 = and i1 %41, %42
  %cond.fold25 = or i1 false, %40
  %cond.fold26 = or i1 %cond.fold25, %in.24
  store i1 %cond.fold26, i1* %out.8, align 1
  %arrayidx24 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  %43 = load i32, i32* %arrayidx24, align 4
  %shr = ashr i32 %43, 1
  store i32 %shr, i32* %arrayidx24, align 4
  %arrayidx25 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  %44 = load i32, i32* %arrayidx25, align 4
  %shr26 = ashr i32 %44, 1
  store i32 %shr26, i32* %arrayidx25, align 4
  %arrayidx27 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  %45 = load i32, i32* %arrayidx27, align 4
  %shr28 = ashr i32 %45, 1
  store i32 %shr28, i32* %arrayidx27, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end23
  %46 = load i1, i1* %out.8, align 1
  %cond.fold27 = or i1 false, %46
  store i1 %cond.fold27, i1* %out.9, align 1
  %inc = add nsw i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %47 = load i1, i1* %out.1, align 1
  %48 = xor i1 %cmp, true
  %in.28 = and i1 %47, %48
  %cond.fold29 = or i1 false, %in.28
  store i1 %cond.fold29, i1* %out.10, align 1
  %arrayidx29 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0
  %49 = load i32, i32* %arrayidx29, align 4
  %arrayidx30 = getelementptr inbounds i32, i32* %a.unwrapped, i64 0
  store i32 %49, i32* %arrayidx30, align 4
  %arrayidx31 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 1
  %50 = load i32, i32* %arrayidx31, align 4
  %arrayidx32 = getelementptr inbounds i32, i32* %a.unwrapped, i64 1
  store i32 %50, i32* %arrayidx32, align 4
  %arrayidx33 = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 2
  %51 = load i32, i32* %arrayidx33, align 4
  %arrayidx34 = getelementptr inbounds i32, i32* %a.unwrapped, i64 2
  store i32 %51, i32* %arrayidx34, align 4
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %arraydecay9.wrapped = alloca %i32ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %a = alloca [3 x i32], align 4
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  store i1 true, i1* %out., align 1
  %a1 = bitcast [3 x i32]* %a to i8*
  call void @llvm.var.annotation(i8* %a1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 19, i8* null)
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0
  %0 = bitcast i32* %arraydecay to i8*
  %call = call i64 @read(i32 noundef 0, i8* noundef %0, i64 noundef 12)
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %arraydecay2 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0
  %1 = ptrtoint i32* %arraydecay2 to i64
  %arrayidx3 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %1, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 12, i64* %arrayidx4, align 16
  %arrayidx5 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx6, align 16
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %2 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx8, i64 0) #3, !srcloc !8
  store volatile i64 %2, i64* %_zzq_result, align 8
  %3 = load volatile i64, i64* %_zzq_result, align 8
  %arraydecay9 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0
  %arraydecay9.unwrapped = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay9.wrapped, i32 0, i32 0
  %arraydecay9.wrapped.field0.length.ptr = getelementptr inbounds %i32ptr.wrapped.ty, %i32ptr.wrapped.ty* %arraydecay9.wrapped, i32 0, i32 1
  store i64 3, i64* %arraydecay9.wrapped.field0.length.ptr, align 8
  store i32* %arraydecay9, i32** %arraydecay9.unwrapped, align 8
  call void @mu(%i32ptr.wrapped.ty* %arraydecay9.wrapped)
  %arraydecay10 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0
  %4 = bitcast i32* %arraydecay10 to i8*
  %call11 = call i64 @write(i32 noundef 1, i8* noundef %4, i64 noundef 12)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #2

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
!8 = !{i64 2148182272, i64 2148182308, i64 2148182376}

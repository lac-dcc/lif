; ModuleID = 'llvm-ir/base.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"[16 x i32]ptr.wrapped.ty" = type { [16 x i32]*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [15 x i8] c"lib/dijkstra.c\00", section "llvm.metadata"
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32* @x to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.4, i32 0, i32 0), i32 16, i8* null }], section "llvm.metadata"
@x = dso_local global i32 0, align 4
@.str.3 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.4 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @dijkstra(i32 noundef %n, i32 noundef %s, i32 noundef %t, %"[16 x i32]ptr.wrapped.ty"* noundef %e) #0 {
entry:
  %e.field0.length.ptr = getelementptr inbounds %"[16 x i32]ptr.wrapped.ty", %"[16 x i32]ptr.wrapped.ty"* %e, i32 0, i32 1
  %e.field0.length = load i64, i64* %e.field0.length.ptr, align 8
  %pred.alloca68 = alloca i1, align 1
  store i1 true, i1* %pred.alloca68, align 1
  %pred.alloca50 = alloca i1, align 1
  store i1 true, i1* %pred.alloca50, align 1
  %pred.alloca = alloca i1, align 1
  store i1 false, i1* %pred.alloca, align 1
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.7 = alloca i1, align 1
  store i1 false, i1* %out.7, align 1
  %out.8 = alloca i1, align 1
  store i1 false, i1* %out.8, align 1
  %out.9 = alloca i1, align 1
  store i1 false, i1* %out.9, align 1
  %out.10 = alloca i1, align 1
  store i1 false, i1* %out.10, align 1
  %out.11 = alloca i1, align 1
  store i1 false, i1* %out.11, align 1
  %out.12 = alloca i1, align 1
  store i1 false, i1* %out.12, align 1
  %out.13 = alloca i1, align 1
  store i1 false, i1* %out.13, align 1
  %out.14 = alloca i1, align 1
  store i1 false, i1* %out.14, align 1
  %out.15 = alloca i1, align 1
  store i1 false, i1* %out.15, align 1
  %out.16 = alloca i1, align 1
  store i1 false, i1* %out.16, align 1
  %out.17 = alloca i1, align 1
  store i1 false, i1* %out.17, align 1
  %out.18 = alloca i1, align 1
  store i1 false, i1* %out.18, align 1
  %out.19 = alloca i1, align 1
  store i1 false, i1* %out.19, align 1
  %out.20 = alloca i1, align 1
  store i1 false, i1* %out.20, align 1
  %out.21 = alloca i1, align 1
  store i1 false, i1* %out.21, align 1
  %out.22 = alloca i1, align 1
  store i1 false, i1* %out.22, align 1
  %out.23 = alloca i1, align 1
  store i1 false, i1* %out.23, align 1
  %out.24 = alloca i1, align 1
  store i1 false, i1* %out.24, align 1
  %out.25 = alloca i1, align 1
  store i1 false, i1* %out.25, align 1
  %out.26 = alloca i1, align 1
  store i1 false, i1* %out.26, align 1
  %out.27 = alloca i1, align 1
  store i1 false, i1* %out.27, align 1
  %out.28 = alloca i1, align 1
  store i1 false, i1* %out.28, align 1
  %out.29 = alloca i1, align 1
  store i1 false, i1* %out.29, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.9, align 1
  store i1 false, i1* %out.19, align 1
  store i1 false, i1* %out.26, align 1
  store i1 false, i1* %out.28, align 1
  %0 = getelementptr inbounds %"[16 x i32]ptr.wrapped.ty", %"[16 x i32]ptr.wrapped.ty"* %e, i32 0, i32 0
  %e.unwrapped = load [16 x i32]*, [16 x i32]** %0, align 8
  %vis = alloca [16 x i32], align 16
  %dis = alloca [16 x i32], align 16
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %_zzq_args10 = alloca [6 x i64], align 16
  %_zzq_result11 = alloca i64, align 8
  %vis1 = bitcast [16 x i32]* %vis to i8*
  call void @llvm.var.annotation(i8* %vis1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i32 10, i8* null)
  %1 = bitcast [16 x i32]* %vis to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 64, i1 false)
  %dis2 = bitcast [16 x i32]* %dis to i8*
  call void @llvm.var.annotation(i8* %dis2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i32 11, i8* null)
  %2 = bitcast [16 x i32]* %dis to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 64, i1 false)
  %idxprom = sext i32 %s to i64
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom
  store i32 1, i32* %arrayidx, align 4
  %arrayidx3 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx3, align 16
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 0
  %3 = ptrtoint i32* %arraydecay to i64
  %arrayidx4 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %3, i64* %arrayidx4, align 8
  %arrayidx5 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 64, i64* %arrayidx5, align 16
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx7, align 16
  %arrayidx8 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %4 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx9, i64 0) #4, !srcloc !6
  store volatile i64 %4, i64* %_zzq_result, align 8
  %5 = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx12 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx12, align 16
  %arraydecay13 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 0
  %6 = ptrtoint i32* %arraydecay13 to i64
  %arrayidx14 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 1
  store volatile i64 %6, i64* %arrayidx14, align 8
  %arrayidx15 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 2
  store volatile i64 64, i64* %arrayidx15, align 16
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx16, align 8
  %arrayidx17 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx17, align 16
  %arrayidx18 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx18, align 8
  %arrayidx19 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 0
  %7 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx19, i64 0) #4, !srcloc !7
  store volatile i64 %7, i64* %_zzq_result11, align 8
  %8 = load volatile i64, i64* %_zzq_result11, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %9 = load i1, i1* %out.9, align 1
  %10 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %10
  %cond.fold = or i1 %fwcond.and.fwtaken, %9
  store i1 %cond.fold, i1* %out.7, align 1
  %cmp = icmp slt i32 %i.0.rewritten, %n
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i1, i1* %out.7, align 1
  %in. = and i1 %11, %cmp
  %cond.fold30 = or i1 false, %in.
  store i1 %cond.fold30, i1* %out.8, align 1
  %idxprom21 = sext i32 %s to i64
  %arrayidx22 = getelementptr inbounds [16 x i32], [16 x i32]* %e.unwrapped, i64 %idxprom21
  %idxprom23 = sext i32 %i.0.rewritten to i64
  %arrayidx24 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx22, i64 0, i64 %idxprom23
  %12 = load i32, i32* %arrayidx24, align 4
  %idxprom25 = sext i32 %i.0.rewritten to i64
  %arrayidx26 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom25
  store i32 %12, i32* %arrayidx26, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i1, i1* %out.8, align 1
  %cond.fold31 = or i1 false, %13
  store i1 %cond.fold31, i1* %out.9, align 1
  %inc = add nsw i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %14 = load i1, i1* %out.7, align 1
  %15 = xor i1 %cmp, true
  %in.32 = and i1 %14, %15
  %cond.fold33 = or i1 false, %in.32
  store i1 %cond.fold33, i1* %out.10, align 1
  br label %for.cond28

for.cond28:                                       ; preds = %for.inc79, %for.end
  %bestj.0.rewritten = phi i32 [ -1, %for.end ], [ %bestj.1.lcssa.rewritten, %for.inc79 ]
  %i27.0.rewritten = phi i32 [ 0, %for.end ], [ %inc80, %for.inc79 ]
  %fwedge.taken1.rewritten = phi i1 [ true, %for.end ], [ false, %for.inc79 ]
  %exitpred.frozen2.rewritten = phi i1 [ %cmp29, %for.inc79 ], [ false, %for.end ]
  %16 = load i1, i1* %out.28, align 1
  %17 = load i1, i1* %out.10, align 1
  %fwcond.and.fwtaken34 = and i1 %fwedge.taken1.rewritten, %17
  %cond.fold35 = or i1 %fwcond.and.fwtaken34, %16
  store i1 %cond.fold35, i1* %out.11, align 1
  %cmp29 = icmp slt i32 %i27.0.rewritten, %n
  br i1 %cmp29, label %for.body30, label %for.end81

for.body30:                                       ; preds = %for.cond28
  %18 = load i1, i1* %out.11, align 1
  %in.36 = and i1 %18, %cmp29
  %cond.fold37 = or i1 false, %in.36
  store i1 %cond.fold37, i1* %out.12, align 1
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc44, %for.body30
  %bestj.1.rewritten = phi i32 [ %bestj.0.rewritten, %for.body30 ], [ %phi.fold113, %for.inc44 ]
  %j.0.rewritten = phi i32 [ 0, %for.body30 ], [ %inc45, %for.inc44 ]
  %fwedge.taken3.rewritten = phi i1 [ true, %for.body30 ], [ false, %for.inc44 ]
  %exitpred.frozen4.rewritten = phi i1 [ %cmp32, %for.inc44 ], [ false, %for.body30 ]
  %19 = load i1, i1* %out.19, align 1
  %20 = load i1, i1* %out.12, align 1
  %fwcond.and.fwtaken38 = and i1 %fwedge.taken3.rewritten, %20
  %cond.fold39 = or i1 %fwcond.and.fwtaken38, %19
  store i1 %cond.fold39, i1* %out.13, align 1
  %cmp32 = icmp slt i32 %j.0.rewritten, %n
  br i1 %cmp32, label %for.body33, label %for.end46

for.body33:                                       ; preds = %for.cond31
  %21 = load i1, i1* %out.13, align 1
  %in.40 = and i1 %21, %cmp32
  %cond.fold41 = or i1 false, %in.40
  store i1 %cond.fold41, i1* %out.14, align 1
  %idxprom34 = sext i32 %j.0.rewritten to i64
  %arrayidx35 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom34
  %22 = load i32, i32* %arrayidx35, align 4
  %tobool = icmp ne i32 %22, 0
  br label %land.lhs.true

land.lhs.true:                                    ; preds = %for.body33
  %23 = load i1, i1* %out.14, align 1
  %24 = xor i1 %tobool, true
  %in.42 = and i1 %23, %24
  %cond.fold43 = or i1 false, %in.42
  store i1 %cond.fold43, i1* %out.15, align 1
  %25 = load i1, i1* %out.15, align 1
  %cmp36 = icmp slt i32 %bestj.1.rewritten, 0
  br label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %26 = load i1, i1* %out.15, align 1
  %27 = xor i1 %cmp36, true
  %in.44 = and i1 %26, %27
  %cond.fold45 = or i1 false, %in.44
  store i1 %cond.fold45, i1* %out.16, align 1
  %28 = load i1, i1* %out.16, align 1
  %idxprom37 = sext i32 %j.0.rewritten to i64
  %arrayidx38 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom37
  %idx1.safe82 = icmp slt i64 %idxprom37, 16
  %access.safe83 = and i1 true, %idx1.safe82
  %29 = or i1 %28, %access.safe83
  %30 = bitcast i64* %shadow to i32*
  %ctsel84 = select i1 %29, i32* %arrayidx38, i32* %30
  %31 = load i32, i32* %ctsel84, align 4
  %idxprom39 = sext i32 %bestj.1.rewritten to i64
  %arrayidx40 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom39
  %idx1.safe85 = icmp slt i64 %idxprom39, 16
  %access.safe86 = and i1 true, %idx1.safe85
  %32 = or i1 %28, %access.safe86
  %33 = bitcast i64* %shadow to i32*
  %ctsel87 = select i1 %32, i32* %arrayidx40, i32* %33
  %34 = load i32, i32* %ctsel87, align 4
  %cmp41 = icmp slt i32 %31, %34
  %35 = bitcast i64* %shadow to i1*
  %ctsel88 = select i1 %28, i1* %pred.alloca, i1* %35
  %36 = load i1, i1* %ctsel88, align 1
  %select.val.89 = select i1 %28, i1 %cmp41, i1 %36
  store i1 %select.val.89, i1* %ctsel88, align 1
  %37 = bitcast i64* %shadow to i1*
  %ctsel90 = select i1 %28, i1* %pred.alloca50, i1* %37
  %38 = load i1, i1* %ctsel90, align 1
  %select.val.91 = select i1 %28, i1 %cmp41, i1 %38
  store i1 %select.val.91, i1* %ctsel90, align 1
  br label %if.then

if.then:                                          ; preds = %lor.lhs.false
  %pred.load = load i1, i1* %pred.alloca, align 1
  %39 = load i1, i1* %out.16, align 1
  %in.46 = and i1 %39, %pred.load
  %40 = load i1, i1* %out.15, align 1
  %in.47 = and i1 %40, %cmp36
  %cond.fold48 = or i1 false, %in.47
  %cond.fold49 = or i1 %cond.fold48, %in.46
  store i1 %cond.fold49, i1* %out.17, align 1
  %41 = load i1, i1* %out.17, align 1
  %42 = bitcast i64* %shadow to i32*
  %ctsel = select i1 %41, i32* @x, i32* %42
  %43 = load i32, i32* %ctsel, align 4
  %add = add nsw i32 %j.0.rewritten, %43
  %idxprom42 = sext i32 %add to i64
  %arrayidx43 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom42
  %idx1.safe = icmp slt i64 %idxprom42, 16
  %access.safe = and i1 true, %idx1.safe
  %44 = or i1 %41, %access.safe
  %45 = bitcast i64* %shadow to i32*
  %ctsel81 = select i1 %44, i32* %arrayidx43, i32* %45
  %46 = load i32, i32* %ctsel81, align 4
  %select.val. = select i1 %41, i32 1, i32 %46
  store i32 %select.val., i32* %ctsel81, align 4
  br label %if.end

if.end:                                           ; preds = %if.then
  %bestj.2.rewritten = phi i32 [ %add, %if.then ]
  %pred.load51 = load i1, i1* %pred.alloca50, align 1
  %47 = load i1, i1* %out.17, align 1
  %48 = load i1, i1* %out.16, align 1
  %49 = xor i1 %pred.load51, true
  %in.52 = and i1 %48, %49
  %50 = load i1, i1* %out.14, align 1
  %in.53 = and i1 %50, %tobool
  %phi.fold = select i1 %in.53, i32 %bestj.1.rewritten, i32 %bestj.2.rewritten
  %phi.fold113 = select i1 %in.52, i32 %bestj.1.rewritten, i32 %phi.fold
  %cond.fold54 = or i1 false, %in.52
  %cond.fold55 = or i1 %cond.fold54, %in.53
  %cond.fold56 = or i1 %cond.fold55, %47
  store i1 %cond.fold56, i1* %out.18, align 1
  br label %for.inc44

for.inc44:                                        ; preds = %if.end
  %51 = load i1, i1* %out.18, align 1
  %cond.fold57 = or i1 false, %51
  store i1 %cond.fold57, i1* %out.19, align 1
  %inc45 = add nsw i32 %j.0.rewritten, 1
  br label %for.cond31, !llvm.loop !10

for.end46:                                        ; preds = %for.cond31
  %bestj.1.lcssa.rewritten = phi i32 [ %bestj.1.rewritten, %for.cond31 ]
  %52 = load i1, i1* %out.13, align 1
  %53 = xor i1 %cmp32, true
  %in.58 = and i1 %52, %53
  %cond.fold59 = or i1 false, %in.58
  store i1 %cond.fold59, i1* %out.20, align 1
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc76, %for.end46
  %j47.0.rewritten = phi i32 [ 0, %for.end46 ], [ %inc77, %for.inc76 ]
  %fwedge.taken5.rewritten = phi i1 [ true, %for.end46 ], [ false, %for.inc76 ]
  %exitpred.frozen6.rewritten = phi i1 [ %cmp49, %for.inc76 ], [ false, %for.end46 ]
  %54 = load i1, i1* %out.26, align 1
  %55 = load i1, i1* %out.20, align 1
  %fwcond.and.fwtaken60 = and i1 %fwedge.taken5.rewritten, %55
  %cond.fold61 = or i1 %fwcond.and.fwtaken60, %54
  store i1 %cond.fold61, i1* %out.21, align 1
  %cmp49 = icmp slt i32 %j47.0.rewritten, %n
  br i1 %cmp49, label %for.body50, label %for.end78

for.body50:                                       ; preds = %for.cond48
  %56 = load i1, i1* %out.21, align 1
  %in.62 = and i1 %56, %cmp49
  %cond.fold63 = or i1 false, %in.62
  store i1 %cond.fold63, i1* %out.22, align 1
  %idxprom51 = sext i32 %j47.0.rewritten to i64
  %arrayidx52 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom51
  %57 = load i32, i32* %arrayidx52, align 4
  %tobool53 = icmp ne i32 %57, 0
  br label %land.lhs.true54

land.lhs.true54:                                  ; preds = %for.body50
  %58 = load i1, i1* %out.22, align 1
  %59 = xor i1 %tobool53, true
  %in.64 = and i1 %58, %59
  %cond.fold65 = or i1 false, %in.64
  store i1 %cond.fold65, i1* %out.23, align 1
  %60 = load i1, i1* %out.23, align 1
  %idxprom55 = sext i32 %bestj.1.lcssa.rewritten to i64
  %arrayidx56 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom55
  %idx1.safe92 = icmp slt i64 %idxprom55, 16
  %access.safe93 = and i1 true, %idx1.safe92
  %61 = or i1 %60, %access.safe93
  %62 = bitcast i64* %shadow to i32*
  %ctsel94 = select i1 %61, i32* %arrayidx56, i32* %62
  %63 = load i32, i32* %ctsel94, align 4
  %idxprom57 = sext i32 %bestj.1.lcssa.rewritten to i64
  %arrayidx58 = getelementptr inbounds [16 x i32], [16 x i32]* %e.unwrapped, i64 %idxprom57
  %idxprom59 = sext i32 %j47.0.rewritten to i64
  %arrayidx60 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx58, i64 0, i64 %idxprom59
  %idx1.safe95 = icmp slt i64 %idxprom59, 16
  %access.safe96 = and i1 true, %idx1.safe95
  %64 = or i1 %60, %access.safe96
  %65 = bitcast i64* %shadow to i32*
  %ctsel97 = select i1 %64, i32* %arrayidx60, i32* %65
  %66 = load i32, i32* %ctsel97, align 4
  %add61 = add nsw i32 %63, %66
  %idxprom62 = sext i32 %j47.0.rewritten to i64
  %arrayidx63 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom62
  %idx1.safe98 = icmp slt i64 %idxprom62, 16
  %access.safe99 = and i1 true, %idx1.safe98
  %67 = or i1 %60, %access.safe99
  %68 = bitcast i64* %shadow to i32*
  %ctsel100 = select i1 %67, i32* %arrayidx63, i32* %68
  %69 = load i32, i32* %ctsel100, align 4
  %cmp64 = icmp slt i32 %add61, %69
  %70 = bitcast i64* %shadow to i1*
  %ctsel101 = select i1 %60, i1* %pred.alloca68, i1* %70
  %71 = load i1, i1* %ctsel101, align 1
  %select.val.102 = select i1 %60, i1 %cmp64, i1 %71
  store i1 %select.val.102, i1* %ctsel101, align 1
  br label %if.then65

if.then65:                                        ; preds = %land.lhs.true54
  %72 = load i1, i1* %out.23, align 1
  %in.66 = and i1 %72, %cmp64
  %cond.fold67 = or i1 false, %in.66
  store i1 %cond.fold67, i1* %out.24, align 1
  %73 = load i1, i1* %out.24, align 1
  %idxprom66 = sext i32 %bestj.1.lcssa.rewritten to i64
  %arrayidx67 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom66
  %idx1.safe103 = icmp slt i64 %idxprom66, 16
  %access.safe104 = and i1 true, %idx1.safe103
  %74 = or i1 %73, %access.safe104
  %75 = bitcast i64* %shadow to i32*
  %ctsel105 = select i1 %74, i32* %arrayidx67, i32* %75
  %76 = load i32, i32* %ctsel105, align 4
  %idxprom68 = sext i32 %bestj.1.lcssa.rewritten to i64
  %arrayidx69 = getelementptr inbounds [16 x i32], [16 x i32]* %e.unwrapped, i64 %idxprom68
  %idxprom70 = sext i32 %j47.0.rewritten to i64
  %arrayidx71 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx69, i64 0, i64 %idxprom70
  %idx1.safe106 = icmp slt i64 %idxprom70, 16
  %access.safe107 = and i1 true, %idx1.safe106
  %77 = or i1 %73, %access.safe107
  %78 = bitcast i64* %shadow to i32*
  %ctsel108 = select i1 %77, i32* %arrayidx71, i32* %78
  %79 = load i32, i32* %ctsel108, align 4
  %add72 = add nsw i32 %76, %79
  %idxprom73 = sext i32 %j47.0.rewritten to i64
  %arrayidx74 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom73
  %idx1.safe109 = icmp slt i64 %idxprom73, 16
  %access.safe110 = and i1 true, %idx1.safe109
  %80 = or i1 %73, %access.safe110
  %81 = bitcast i64* %shadow to i32*
  %ctsel111 = select i1 %80, i32* %arrayidx74, i32* %81
  %82 = load i32, i32* %ctsel111, align 4
  %select.val.112 = select i1 %73, i32 %add72, i32 %82
  store i32 %select.val.112, i32* %ctsel111, align 4
  br label %if.end75

if.end75:                                         ; preds = %if.then65
  %pred.load69 = load i1, i1* %pred.alloca68, align 1
  %83 = load i1, i1* %out.24, align 1
  %84 = load i1, i1* %out.23, align 1
  %85 = xor i1 %pred.load69, true
  %in.70 = and i1 %84, %85
  %86 = load i1, i1* %out.22, align 1
  %in.71 = and i1 %86, %tobool53
  %cond.fold72 = or i1 false, %83
  %cond.fold73 = or i1 %cond.fold72, %in.71
  %cond.fold74 = or i1 %cond.fold73, %in.70
  store i1 %cond.fold74, i1* %out.25, align 1
  br label %for.inc76

for.inc76:                                        ; preds = %if.end75
  %87 = load i1, i1* %out.25, align 1
  %cond.fold75 = or i1 false, %87
  store i1 %cond.fold75, i1* %out.26, align 1
  %inc77 = add nsw i32 %j47.0.rewritten, 1
  br label %for.cond48, !llvm.loop !11

for.end78:                                        ; preds = %for.cond48
  %88 = load i1, i1* %out.21, align 1
  %89 = xor i1 %cmp49, true
  %in.76 = and i1 %88, %89
  %cond.fold77 = or i1 false, %in.76
  store i1 %cond.fold77, i1* %out.27, align 1
  br label %for.inc79

for.inc79:                                        ; preds = %for.end78
  %90 = load i1, i1* %out.27, align 1
  %cond.fold78 = or i1 false, %90
  store i1 %cond.fold78, i1* %out.28, align 1
  %inc80 = add nsw i32 %i27.0.rewritten, 1
  br label %for.cond28, !llvm.loop !12

for.end81:                                        ; preds = %for.cond28
  %91 = load i1, i1* %out.11, align 1
  %92 = xor i1 %cmp29, true
  %in.79 = and i1 %91, %92
  %cond.fold80 = or i1 false, %in.79
  store i1 %cond.fold80, i1* %out.29, align 1
  %idxprom82 = sext i32 %t to i64
  %arrayidx83 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom82
  %93 = load i32, i32* %arrayidx83, align 4
  ret i32 %93
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %arraydecay42.wrapped = alloca %"[16 x i32]ptr.wrapped.ty", align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
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
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %in = alloca [16 x [16 x i32]], align 16
  %_zzq_args22 = alloca [6 x i64], align 16
  %_zzq_result23 = alloca i64, align 8
  %_zzq_args32 = alloca [6 x i64], align 16
  %_zzq_result33 = alloca i64, align 8
  %r = alloca i32, align 4
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.7, align 1
  store i1 false, i1* %out.9, align 1
  %call = call i64 @read(i32 noundef 0, i8* noundef bitcast (i32* @x to i8*), i64 noundef 4)
  %0 = load i32, i32* @x, align 4
  %conv = trunc i32 %0 to i8
  %conv1 = zext i8 %conv to i32
  %1 = load i32, i32* @x, align 4
  %sub = sub nsw i32 %1, %conv1
  store i32 %sub, i32* @x, align 4
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %2 = load i32, i32* @x, align 4
  %conv2 = sext i32 %2 to i64
  %arrayidx3 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %conv2, i64* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 4, i64* %arrayidx4, align 16
  %arrayidx5 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx6, align 16
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx7, align 8
  %arrayidx8 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %3 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx8, i64 0) #4, !srcloc !13
  store volatile i64 %3, i64* %_zzq_result, align 8
  %4 = load volatile i64, i64* %_zzq_result, align 8
  %in9 = bitcast [16 x [16 x i32]]* %in to i8*
  call void @llvm.var.annotation(i8* %in9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.4, i32 0, i32 0), i32 25, i8* null)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc19 ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc19 ], [ false, %entry ]
  %5 = load i1, i1* %out.9, align 1
  %6 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %6
  %cond.fold = or i1 %fwcond.and.fwtaken, %5
  store i1 %cond.fold, i1* %out.3, align 1
  %cmp = icmp slt i32 %i.0.rewritten, 16
  br i1 %cmp, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  %7 = load i1, i1* %out.3, align 1
  %in. = and i1 %7, %cmp
  %cond.fold11 = or i1 false, %in.
  store i1 %cond.fold11, i1* %out.4, align 1
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc, %for.body
  %j.0.rewritten = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %fwedge.taken1.rewritten = phi i1 [ true, %for.body ], [ false, %for.inc ]
  %exitpred.frozen2.rewritten = phi i1 [ %cmp12, %for.inc ], [ false, %for.body ]
  %8 = load i1, i1* %out.7, align 1
  %9 = load i1, i1* %out.4, align 1
  %fwcond.and.fwtaken12 = and i1 %fwedge.taken1.rewritten, %9
  %cond.fold13 = or i1 %fwcond.and.fwtaken12, %8
  store i1 %cond.fold13, i1* %out.5, align 1
  %cmp12 = icmp slt i32 %j.0.rewritten, 16
  br i1 %cmp12, label %for.body14, label %for.end

for.body14:                                       ; preds = %for.cond11
  %10 = load i1, i1* %out.5, align 1
  %in.14 = and i1 %10, %cmp12
  %cond.fold15 = or i1 false, %in.14
  store i1 %cond.fold15, i1* %out.6, align 1
  %idxprom = sext i32 %i.0.rewritten to i64
  %arrayidx15 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %in, i64 0, i64 %idxprom
  %idxprom16 = sext i32 %j.0.rewritten to i64
  %arrayidx17 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx15, i64 0, i64 %idxprom16
  %11 = bitcast i32* %arrayidx17 to i8*
  %call18 = call i64 @read(i32 noundef 0, i8* noundef %11, i64 noundef 4)
  br label %for.inc

for.inc:                                          ; preds = %for.body14
  %12 = load i1, i1* %out.6, align 1
  %cond.fold16 = or i1 false, %12
  store i1 %cond.fold16, i1* %out.7, align 1
  %inc = add nsw i32 %j.0.rewritten, 1
  br label %for.cond11, !llvm.loop !14

for.end:                                          ; preds = %for.cond11
  %13 = load i1, i1* %out.5, align 1
  %14 = xor i1 %cmp12, true
  %in.17 = and i1 %13, %14
  %cond.fold18 = or i1 false, %in.17
  store i1 %cond.fold18, i1* %out.8, align 1
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %15 = load i1, i1* %out.8, align 1
  %cond.fold19 = or i1 false, %15
  store i1 %cond.fold19, i1* %out.9, align 1
  %inc20 = add nsw i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !15

for.end21:                                        ; preds = %for.cond
  %16 = load i1, i1* %out.3, align 1
  %17 = xor i1 %cmp, true
  %in.20 = and i1 %16, %17
  %cond.fold21 = or i1 false, %in.20
  store i1 %cond.fold21, i1* %out.10, align 1
  %arrayidx24 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args22, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx24, align 16
  %arrayidx25 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args22, i64 0, i64 1
  store volatile i64 ptrtoint (i32* @x to i64), i64* %arrayidx25, align 8
  %arrayidx26 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args22, i64 0, i64 2
  store volatile i64 4, i64* %arrayidx26, align 16
  %arrayidx27 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args22, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx27, align 8
  %arrayidx28 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args22, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx28, align 16
  %arrayidx29 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args22, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx29, align 8
  %arrayidx30 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args22, i64 0, i64 0
  %18 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx30, i64 0) #4, !srcloc !16
  store volatile i64 %18, i64* %_zzq_result23, align 8
  %19 = load volatile i64, i64* %_zzq_result23, align 8
  %arrayidx34 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx34, align 16
  %arraydecay = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %in, i64 0, i64 0
  %20 = ptrtoint [16 x i32]* %arraydecay to i64
  %arrayidx35 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 1
  store volatile i64 %20, i64* %arrayidx35, align 8
  %arrayidx36 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 2
  store volatile i64 1024, i64* %arrayidx36, align 16
  %arrayidx37 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx37, align 8
  %arrayidx38 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx38, align 16
  %arrayidx39 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx39, align 8
  %arrayidx40 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 0
  %21 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx40, i64 0) #4, !srcloc !17
  store volatile i64 %21, i64* %_zzq_result33, align 8
  %22 = load volatile i64, i64* %_zzq_result33, align 8
  %arraydecay42 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %in, i64 0, i64 0
  %arraydecay42.unwrapped = getelementptr inbounds %"[16 x i32]ptr.wrapped.ty", %"[16 x i32]ptr.wrapped.ty"* %arraydecay42.wrapped, i32 0, i32 0
  %arraydecay42.wrapped.field0.length.ptr = getelementptr inbounds %"[16 x i32]ptr.wrapped.ty", %"[16 x i32]ptr.wrapped.ty"* %arraydecay42.wrapped, i32 0, i32 1
  store i64 256, i64* %arraydecay42.wrapped.field0.length.ptr, align 8
  store [16 x i32]* %arraydecay42, [16 x i32]** %arraydecay42.unwrapped, align 8
  %call43 = call i32 @dijkstra(i32 16, i32 0, i32 15, %"[16 x i32]ptr.wrapped.ty"* %arraydecay42.wrapped)
  store i32 %call43, i32* %r, align 4
  %23 = bitcast i32* %r to i8*
  %call44 = call i64 @write(i32 noundef 1, i8* noundef %23, i64 noundef 4)
  ret i32 0
}

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #3

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #3

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 14.0.6"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{i64 2147941460, i64 2147941496, i64 2147941564}
!7 = !{i64 2147943071, i64 2147943107, i64 2147943175}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
!13 = !{i64 2148115033, i64 2148115069, i64 2148115137}
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !9}
!16 = !{i64 2148116671, i64 2148116707, i64 2148116775}
!17 = !{i64 2148118297, i64 2148118333, i64 2148118401}

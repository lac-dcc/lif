; ModuleID = 'llvm-ir/base.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"i8*ptr.wrapped.ty" = type { i8**, i64 }
%i8ptr.wrapped.ty = type { i8*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @log_redactor(%"i8*ptr.wrapped.ty"* noundef %log, %i8ptr.wrapped.ty* noundef %pattern, i32 noundef %L0, i32 noundef %L1, i32 noundef %P) #0 {
entry:
  %log.field0.length.ptr = getelementptr inbounds %"i8*ptr.wrapped.ty", %"i8*ptr.wrapped.ty"* %log, i32 0, i32 1
  %log.field0.length = load i64, i64* %log.field0.length.ptr, align 8
  %pattern.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %pattern, i32 0, i32 1
  %pattern.field0.length = load i64, i64* %pattern.field0.length.ptr, align 8
  %pred.alloca = alloca i1, align 1
  store i1 true, i1* %pred.alloca, align 1
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
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
  %out.frozen = alloca i1, align 1
  store i1 false, i1* %out.frozen, align 1
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
  %out.30 = alloca i1, align 1
  store i1 false, i1* %out.30, align 1
  %out.31 = alloca i1, align 1
  store i1 false, i1* %out.31, align 1
  %out.32 = alloca i1, align 1
  store i1 false, i1* %out.32, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.15, align 1
  store i1 false, i1* %out.20, align 1
  store i1 false, i1* %out.29, align 1
  store i1 false, i1* %out.31, align 1
  %0 = getelementptr inbounds %"i8*ptr.wrapped.ty", %"i8*ptr.wrapped.ty"* %log, i32 0, i32 0
  %log.unwrapped = load i8**, i8*** %0, align 8
  %1 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %pattern, i32 0, i32 0
  %pattern.unwrapped = load i8*, i8** %1, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc48, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc49, %for.inc48 ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc48 ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc48 ], [ false, %entry ]
  %2 = load i1, i1* %out.31, align 1
  %3 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %3
  %cond.fold = or i1 %fwcond.and.fwtaken, %2
  store i1 %cond.fold, i1* %out.8, align 1
  %cmp = icmp ult i32 %i.0.rewritten, %L0
  br i1 %cmp, label %for.body, label %for.end50

for.body:                                         ; preds = %for.cond
  %4 = load i1, i1* %out.8, align 1
  %in. = and i1 %4, %cmp
  %cond.fold33 = or i1 false, %in.
  store i1 %cond.fold33, i1* %out.9, align 1
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %found.0.rewritten = phi i32 [ 0, %for.body ], [ %phi.fold100, %for.inc ]
  %j.0.rewritten = phi i32 [ 0, %for.body ], [ %inc17, %for.inc ]
  %fwedge.taken1.rewritten = phi i1 [ true, %for.body ], [ false, %for.inc ]
  %exitpred.frozen2.rewritten = phi i1 [ %cmp2, %for.inc ], [ false, %for.body ]
  %5 = load i1, i1* %out.20, align 1
  %6 = load i1, i1* %out.9, align 1
  %fwcond.and.fwtaken34 = and i1 %fwedge.taken1.rewritten, %6
  %cond.fold35 = or i1 %fwcond.and.fwtaken34, %5
  store i1 %cond.fold35, i1* %out.10, align 1
  %sub = sub nsw i32 %L1, %P
  %add = add nsw i32 %sub, 1
  %cmp2 = icmp ult i32 %j.0.rewritten, %add
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %7 = load i1, i1* %out.10, align 1
  %in.36 = and i1 %7, %cmp2
  %cond.fold37 = or i1 false, %in.36
  store i1 %cond.fold37, i1* %out.11, align 1
  br label %while.cond

while.cond:                                       ; preds = %if.end, %for.body3
  %k.0.rewritten = phi i32 [ 0, %for.body3 ], [ %inc, %if.end ]
  %fwedge.taken3.rewritten = phi i1 [ true, %for.body3 ], [ false, %if.end ]
  %exitpred.frozen4.rewritten = phi i1 [ %cmp4, %if.end ], [ false, %for.body3 ]
  %exitpred.frozen5.rewritten = phi i1 [ %22, %if.end ], [ false, %for.body3 ]
  %incval.phi = phi i32 [ %k.0.rewritten, %if.end ], [ undef, %for.body3 ]
  %8 = load i1, i1* %out.15, align 1
  %9 = load i1, i1* %out.11, align 1
  %fwcond.and.fwtaken38 = and i1 %fwedge.taken3.rewritten, %9
  %cond.fold39 = or i1 %fwcond.and.fwtaken38, %8
  store i1 %cond.fold39, i1* %out.12, align 1
  %10 = load i1, i1* %out.12, align 1
  %cmp4 = icmp ult i32 %k.0.rewritten, %P
  br i1 %cmp4, label %while.body, label %if.then

while.body:                                       ; preds = %while.cond
  %11 = load i1, i1* %out.12, align 1
  %in.40 = and i1 %11, %cmp4
  %cond.fold41 = or i1 false, %in.40
  store i1 %cond.fold41, i1* %out.13, align 1
  %12 = load i1, i1* %out.13, align 1
  %load.frozen = load i1, i1* %out.frozen, align 1
  %or.frozen = or i1 %load.frozen, %cond.fold41
  store i1 %or.frozen, i1* %out.frozen, align 1
  %idxprom = zext i32 %k.0.rewritten to i64
  %arrayidx = getelementptr inbounds i8, i8* %pattern.unwrapped, i64 %idxprom
  %idx0.safe = icmp slt i64 %idxprom, %pattern.field0.length
  %13 = or i1 %12, %idx0.safe
  %14 = bitcast i64* %shadow to i8*
  %ctsel = select i1 %13, i8* %arrayidx, i8* %14
  %15 = load i8, i8* %ctsel, align 1
  %conv = sext i8 %15 to i32
  %idxprom5 = zext i32 %i.0.rewritten to i64
  %arrayidx6 = getelementptr inbounds i8*, i8** %log.unwrapped, i64 %idxprom5
  %idx0.safe82 = icmp slt i64 %idxprom5, %log.field0.length
  %16 = or i1 %12, %idx0.safe82
  %17 = bitcast i64* %shadow to i8**
  %ctsel83 = select i1 %16, i8** %arrayidx6, i8** %17
  %18 = load i8*, i8** %ctsel83, align 8
  %add7 = add i32 %j.0.rewritten, %k.0.rewritten
  %idxprom8 = zext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds i8, i8* %18, i64 %idxprom8
  %idx0.safe84 = icmp slt i64 %idxprom8, %log.field0.length
  %19 = or i1 %12, %idx0.safe84
  %20 = bitcast i64* %shadow to i8*
  %ctsel85 = select i1 %19, i8* %arrayidx9, i8* %20
  %21 = load i8, i8* %ctsel85, align 1
  %conv10 = sext i8 %21 to i32
  %cmp11 = icmp ne i32 %conv, %conv10
  %22 = or i1 %cmp11, %exitpred.frozen5.rewritten
  br label %if.end

if.then:                                          ; preds = %while.cond
  %k.0.lcssa1.rewritten = phi i32 [ %incval.phi, %while.cond ]
  %23 = load i1, i1* %out.frozen, align 1
  %in.42 = and i1 %23, %exitpred.frozen5.rewritten
  %cond.fold43 = or i1 false, %in.42
  store i1 %cond.fold43, i1* %out.14, align 1
  %24 = load i1, i1* %out.14, align 1
  br label %while.end.loopexit

if.end:                                           ; preds = %while.body
  %25 = load i1, i1* %out.13, align 1
  %26 = xor i1 %22, true
  %in.44 = and i1 %25, %26
  %cond.fold45 = or i1 false, %in.44
  store i1 %cond.fold45, i1* %out.15, align 1
  %27 = load i1, i1* %out.15, align 1
  %inc = add i32 %k.0.rewritten, 1
  br label %while.cond, !llvm.loop !6

while.end.loopexit:                               ; preds = %if.then
  %k.0.lcssa.rewritten = phi i32 [ %k.0.rewritten, %if.then ]
  %28 = load i1, i1* %out.12, align 1
  %29 = xor i1 %cmp4, true
  %in.46 = and i1 %28, %29
  %cond.fold47 = or i1 false, %in.46
  store i1 %cond.fold47, i1* %out.16, align 1
  %30 = load i1, i1* %out.16, align 1
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit
  %k.02.rewritten = phi i32 [ %k.0.lcssa.rewritten, %while.end.loopexit ]
  %31 = load i1, i1* %out.16, align 1
  %32 = load i1, i1* %out.14, align 1
  %phi.fold = select i1 %32, i32 %k.0.lcssa1.rewritten, i32 %k.02.rewritten
  %cond.fold48 = or i1 false, %31
  %cond.fold49 = or i1 %cond.fold48, %32
  store i1 %cond.fold49, i1* %out.17, align 1
  %cmp13 = icmp eq i32 %phi.fold, %P
  br label %if.then15

if.then15:                                        ; preds = %while.end
  %33 = load i1, i1* %out.17, align 1
  %in.50 = and i1 %33, %cmp13
  %cond.fold51 = or i1 false, %in.50
  store i1 %cond.fold51, i1* %out.18, align 1
  %34 = load i1, i1* %out.18, align 1
  br label %if.end16

if.end16:                                         ; preds = %if.then15
  %found.1.rewritten = phi i32 [ 1, %if.then15 ]
  %35 = load i1, i1* %out.18, align 1
  %36 = load i1, i1* %out.17, align 1
  %37 = xor i1 %cmp13, true
  %in.52 = and i1 %36, %37
  %phi.fold100 = select i1 %in.52, i32 %found.0.rewritten, i32 %found.1.rewritten
  %cond.fold53 = or i1 false, %in.52
  %cond.fold54 = or i1 %cond.fold53, %35
  store i1 %cond.fold54, i1* %out.19, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end16
  %38 = load i1, i1* %out.19, align 1
  %cond.fold55 = or i1 false, %38
  store i1 %cond.fold55, i1* %out.20, align 1
  %inc17 = add i32 %j.0.rewritten, 1
  br label %for.cond1, !llvm.loop !8

for.end:                                          ; preds = %for.cond1
  %found.0.lcssa.rewritten = phi i32 [ %found.0.rewritten, %for.cond1 ]
  %39 = load i1, i1* %out.10, align 1
  %40 = xor i1 %cmp2, true
  %in.56 = and i1 %39, %40
  %cond.fold57 = or i1 false, %in.56
  store i1 %cond.fold57, i1* %out.21, align 1
  %tobool = icmp ne i32 %found.0.lcssa.rewritten, 0
  br label %if.then18

if.then18:                                        ; preds = %for.end
  %41 = load i1, i1* %out.21, align 1
  %42 = xor i1 %tobool, true
  %in.58 = and i1 %41, %42
  %cond.fold59 = or i1 false, %in.58
  store i1 %cond.fold59, i1* %out.22, align 1
  %43 = load i1, i1* %out.22, align 1
  br label %if.end19

if.end19:                                         ; preds = %if.then18
  %44 = load i1, i1* %out.21, align 1
  %in.60 = and i1 %44, %tobool
  %cond.fold61 = or i1 false, %in.60
  store i1 %cond.fold61, i1* %out.23, align 1
  %45 = load i1, i1* %out.23, align 1
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc45, %if.end19
  %j20.0.rewritten = phi i32 [ 0, %if.end19 ], [ %inc46, %for.inc45 ]
  %fwedge.taken6.rewritten = phi i1 [ true, %if.end19 ], [ false, %for.inc45 ]
  %exitpred.frozen7.rewritten = phi i1 [ %cmp22, %for.inc45 ], [ false, %if.end19 ]
  %46 = load i1, i1* %out.29, align 1
  %47 = load i1, i1* %out.23, align 1
  %fwcond.and.fwtaken62 = and i1 %fwedge.taken6.rewritten, %47
  %cond.fold63 = or i1 %fwcond.and.fwtaken62, %46
  store i1 %cond.fold63, i1* %out.24, align 1
  %48 = load i1, i1* %out.24, align 1
  %cmp22 = icmp ult i32 %j20.0.rewritten, %L1
  br i1 %cmp22, label %for.body24, label %for.end47

for.body24:                                       ; preds = %for.cond21
  %49 = load i1, i1* %out.24, align 1
  %in.64 = and i1 %49, %cmp22
  %cond.fold65 = or i1 false, %in.64
  store i1 %cond.fold65, i1* %out.25, align 1
  %50 = load i1, i1* %out.25, align 1
  %idxprom25 = zext i32 %i.0.rewritten to i64
  %arrayidx26 = getelementptr inbounds i8*, i8** %log.unwrapped, i64 %idxprom25
  %idx0.safe86 = icmp slt i64 %idxprom25, %log.field0.length
  %51 = or i1 %50, %idx0.safe86
  %52 = bitcast i64* %shadow to i8**
  %ctsel87 = select i1 %51, i8** %arrayidx26, i8** %52
  %53 = load i8*, i8** %ctsel87, align 8
  %idxprom27 = zext i32 %j20.0.rewritten to i64
  %arrayidx28 = getelementptr inbounds i8, i8* %53, i64 %idxprom27
  %idx0.safe88 = icmp slt i64 %idxprom27, %log.field0.length
  %54 = or i1 %50, %idx0.safe88
  %55 = bitcast i64* %shadow to i8*
  %ctsel89 = select i1 %54, i8* %arrayidx28, i8* %55
  %56 = load i8, i8* %ctsel89, align 1
  %conv29 = sext i8 %56 to i32
  %cmp30 = icmp sge i32 %conv29, 48
  br label %land.lhs.true

land.lhs.true:                                    ; preds = %for.body24
  %57 = load i1, i1* %out.25, align 1
  %in.66 = and i1 %57, %cmp30
  %cond.fold67 = or i1 false, %in.66
  store i1 %cond.fold67, i1* %out.26, align 1
  %58 = load i1, i1* %out.26, align 1
  %idxprom32 = zext i32 %i.0.rewritten to i64
  %arrayidx33 = getelementptr inbounds i8*, i8** %log.unwrapped, i64 %idxprom32
  %idx0.safe90 = icmp slt i64 %idxprom32, %log.field0.length
  %59 = or i1 %58, %idx0.safe90
  %60 = bitcast i64* %shadow to i8**
  %ctsel91 = select i1 %59, i8** %arrayidx33, i8** %60
  %61 = load i8*, i8** %ctsel91, align 8
  %idxprom34 = zext i32 %j20.0.rewritten to i64
  %arrayidx35 = getelementptr inbounds i8, i8* %61, i64 %idxprom34
  %idx0.safe92 = icmp slt i64 %idxprom34, %log.field0.length
  %62 = or i1 %58, %idx0.safe92
  %63 = bitcast i64* %shadow to i8*
  %ctsel93 = select i1 %62, i8* %arrayidx35, i8* %63
  %64 = load i8, i8* %ctsel93, align 1
  %conv36 = sext i8 %64 to i32
  %cmp37 = icmp sle i32 %conv36, 57
  %65 = bitcast i64* %shadow to i1*
  %ctsel94 = select i1 %58, i1* %pred.alloca, i1* %65
  %66 = load i1, i1* %ctsel94, align 1
  %select.val. = select i1 %58, i1 %cmp37, i1 %66
  store i1 %select.val., i1* %ctsel94, align 1
  br label %if.then39

if.then39:                                        ; preds = %land.lhs.true
  %67 = load i1, i1* %out.26, align 1
  %in.68 = and i1 %67, %cmp37
  %cond.fold69 = or i1 false, %in.68
  store i1 %cond.fold69, i1* %out.27, align 1
  %68 = load i1, i1* %out.27, align 1
  %idxprom40 = zext i32 %i.0.rewritten to i64
  %arrayidx41 = getelementptr inbounds i8*, i8** %log.unwrapped, i64 %idxprom40
  %idx0.safe95 = icmp slt i64 %idxprom40, %log.field0.length
  %69 = or i1 %68, %idx0.safe95
  %70 = bitcast i64* %shadow to i8**
  %ctsel96 = select i1 %69, i8** %arrayidx41, i8** %70
  %71 = load i8*, i8** %ctsel96, align 8
  %idxprom42 = zext i32 %j20.0.rewritten to i64
  %arrayidx43 = getelementptr inbounds i8, i8* %71, i64 %idxprom42
  %idx0.safe97 = icmp slt i64 %idxprom42, %log.field0.length
  %72 = or i1 %68, %idx0.safe97
  %73 = bitcast i64* %shadow to i8*
  %ctsel98 = select i1 %72, i8* %arrayidx43, i8* %73
  %74 = load i8, i8* %ctsel98, align 1
  %select.val.99 = select i1 %68, i8 42, i8 %74
  store i8 %select.val.99, i8* %ctsel98, align 1
  br label %if.end44

if.end44:                                         ; preds = %if.then39
  %pred.load = load i1, i1* %pred.alloca, align 1
  %75 = load i1, i1* %out.27, align 1
  %76 = load i1, i1* %out.26, align 1
  %77 = xor i1 %pred.load, true
  %in.70 = and i1 %76, %77
  %78 = load i1, i1* %out.25, align 1
  %79 = xor i1 %cmp30, true
  %in.71 = and i1 %78, %79
  %cond.fold72 = or i1 false, %in.71
  %cond.fold73 = or i1 %cond.fold72, %75
  %cond.fold74 = or i1 %cond.fold73, %in.70
  store i1 %cond.fold74, i1* %out.28, align 1
  %80 = load i1, i1* %out.28, align 1
  br label %for.inc45

for.inc45:                                        ; preds = %if.end44
  %81 = load i1, i1* %out.28, align 1
  %cond.fold75 = or i1 false, %81
  store i1 %cond.fold75, i1* %out.29, align 1
  %82 = load i1, i1* %out.29, align 1
  %inc46 = add i32 %j20.0.rewritten, 1
  br label %for.cond21, !llvm.loop !9

for.end47:                                        ; preds = %for.cond21
  %83 = load i1, i1* %out.24, align 1
  %84 = xor i1 %cmp22, true
  %in.76 = and i1 %83, %84
  %cond.fold77 = or i1 false, %in.76
  store i1 %cond.fold77, i1* %out.30, align 1
  %85 = load i1, i1* %out.30, align 1
  br label %for.inc48

for.inc48:                                        ; preds = %for.end47
  %86 = load i1, i1* %out.30, align 1
  %87 = load i1, i1* %out.22, align 1
  %cond.fold78 = or i1 false, %86
  %cond.fold79 = or i1 %cond.fold78, %87
  store i1 %cond.fold79, i1* %out.31, align 1
  %inc49 = add i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !10

for.end50:                                        ; preds = %for.cond
  %88 = load i1, i1* %out.8, align 1
  %89 = xor i1 %cmp, true
  %in.80 = and i1 %88, %89
  %cond.fold81 = or i1 false, %in.80
  store i1 %cond.fold81, i1* %out.32, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %vla.wrapped = alloca %"i8*ptr.wrapped.ty", align 8
  %vla2.wrapped = alloca %i8ptr.wrapped.ty, align 8
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
  %_zzq_args14 = alloca [6 x i64], align 16
  %_zzq_result15 = alloca i64, align 8
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.5, align 1
  store i1 false, i1* %out.9, align 1
  %0 = call i8* @llvm.stacksave()
  %vla = alloca i8*, i64 3, align 16
  %vla1 = bitcast i8** %vla to i8*
  call void @llvm.var.annotation(i8* %vla1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 25, i8* null)
  %vla2 = alloca i8, i64 4, align 16
  call void @llvm.var.annotation(i8* %vla2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 26, i8* null)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %1 = load i1, i1* %out.5, align 1
  %2 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %2
  %cond.fold = or i1 %fwcond.and.fwtaken, %1
  store i1 %cond.fold, i1* %out.3, align 1
  %cmp = icmp ult i32 %i.0.rewritten, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i1, i1* %out.3, align 1
  %in. = and i1 %3, %cmp
  %cond.fold11 = or i1 false, %in.
  store i1 %cond.fold11, i1* %out.4, align 1
  %call = call noalias i8* @malloc(i64 noundef 10) #5
  %idxprom = zext i32 %i.0.rewritten to i64
  %arrayidx = getelementptr inbounds i8*, i8** %vla, i64 %idxprom
  store i8* %call, i8** %arrayidx, align 8
  %idxprom3 = zext i32 %i.0.rewritten to i64
  %arrayidx4 = getelementptr inbounds i8*, i8** %vla, i64 %idxprom3
  %4 = load i8*, i8** %arrayidx4, align 8
  %call5 = call i64 @read(i32 noundef 0, i8* noundef %4, i64 noundef 10)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i1, i1* %out.4, align 1
  %cond.fold12 = or i1 false, %5
  store i1 %cond.fold12, i1* %out.5, align 1
  %inc = add i32 %i.0.rewritten, 1
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  %6 = load i1, i1* %out.3, align 1
  %7 = xor i1 %cmp, true
  %in.13 = and i1 %6, %7
  %cond.fold14 = or i1 false, %in.13
  store i1 %cond.fold14, i1* %out.6, align 1
  %call6 = call i64 @read(i32 noundef 0, i8* noundef %vla2, i64 noundef 4)
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx7, align 16
  %8 = ptrtoint i8* %vla2 to i64
  %arrayidx8 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %8, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 4, i64* %arrayidx9, align 16
  %arrayidx10 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx10, align 8
  %arrayidx11 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx11, align 16
  %arrayidx12 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx12, align 8
  %arrayidx13 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %9 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx13, i64 0) #5, !srcloc !12
  store volatile i64 %9, i64* %_zzq_result, align 8
  %10 = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx16, align 16
  %11 = ptrtoint i8** %vla to i64
  %arrayidx17 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 1
  store volatile i64 %11, i64* %arrayidx17, align 8
  %arrayidx18 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 2
  store volatile i64 30, i64* %arrayidx18, align 16
  %arrayidx19 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx19, align 8
  %arrayidx20 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx20, align 16
  %arrayidx21 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx21, align 8
  %arrayidx22 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args14, i64 0, i64 0
  %12 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx22, i64 0) #5, !srcloc !13
  store volatile i64 %12, i64* %_zzq_result15, align 8
  %13 = load volatile i64, i64* %_zzq_result15, align 8
  %vla.unwrapped = getelementptr inbounds %"i8*ptr.wrapped.ty", %"i8*ptr.wrapped.ty"* %vla.wrapped, i32 0, i32 0
  %vla.wrapped.field0.length.ptr = getelementptr inbounds %"i8*ptr.wrapped.ty", %"i8*ptr.wrapped.ty"* %vla.wrapped, i32 0, i32 1
  store i64 0, i64* %vla.wrapped.field0.length.ptr, align 8
  store i8** %vla, i8*** %vla.unwrapped, align 8
  %vla2.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %vla2.wrapped, i32 0, i32 0
  %vla2.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %vla2.wrapped, i32 0, i32 1
  store i64 0, i64* %vla2.wrapped.field0.length.ptr, align 8
  store i8* %vla2, i8** %vla2.unwrapped, align 8
  call void @log_redactor(%"i8*ptr.wrapped.ty"* %vla.wrapped, %i8ptr.wrapped.ty* %vla2.wrapped, i32 3, i32 10, i32 4)
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc30, %for.end
  %j.0.rewritten = phi i32 [ 0, %for.end ], [ %inc31, %for.inc30 ]
  %fwedge.taken1.rewritten = phi i1 [ true, %for.end ], [ false, %for.inc30 ]
  %exitpred.frozen2.rewritten = phi i1 [ %cmp25, %for.inc30 ], [ false, %for.end ]
  %14 = load i1, i1* %out.9, align 1
  %15 = load i1, i1* %out.6, align 1
  %fwcond.and.fwtaken15 = and i1 %fwedge.taken1.rewritten, %15
  %cond.fold16 = or i1 %fwcond.and.fwtaken15, %14
  store i1 %cond.fold16, i1* %out.7, align 1
  %cmp25 = icmp ult i32 %j.0.rewritten, 3
  br i1 %cmp25, label %for.body26, label %for.end32

for.body26:                                       ; preds = %for.cond24
  %16 = load i1, i1* %out.7, align 1
  %in.17 = and i1 %16, %cmp25
  %cond.fold18 = or i1 false, %in.17
  store i1 %cond.fold18, i1* %out.8, align 1
  %idxprom27 = zext i32 %j.0.rewritten to i64
  %arrayidx28 = getelementptr inbounds i8*, i8** %vla, i64 %idxprom27
  %17 = load i8*, i8** %arrayidx28, align 8
  %call29 = call i64 @write(i32 noundef 1, i8* noundef %17, i64 noundef 10)
  br label %for.inc30

for.inc30:                                        ; preds = %for.body26
  %18 = load i1, i1* %out.8, align 1
  %cond.fold19 = or i1 false, %18
  store i1 %cond.fold19, i1* %out.9, align 1
  %inc31 = add i32 %j.0.rewritten, 1
  br label %for.cond24, !llvm.loop !14

for.end32:                                        ; preds = %for.cond24
  %19 = load i1, i1* %out.7, align 1
  %20 = xor i1 %cmp25, true
  %in.20 = and i1 %19, %20
  %cond.fold21 = or i1 false, %in.20
  store i1 %cond.fold21, i1* %out.10, align 1
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

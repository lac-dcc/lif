; ModuleID = 'llvm-ir/lif.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"i8*ptr.wrapped.ty" = type { i8**, i64 }
%i8ptr.wrapped.ty = type { i8*, i64 }

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @log_redactor(%"i8*ptr.wrapped.ty"* nocapture noundef readonly %log, %i8ptr.wrapped.ty* nocapture noundef readonly %pattern, i32 noundef %L0, i32 noundef %L1, i32 noundef %P) local_unnamed_addr #0 {
entry:
  %log.field0.length.ptr = getelementptr inbounds %"i8*ptr.wrapped.ty", %"i8*ptr.wrapped.ty"* %log, i64 0, i32 1
  %log.field0.length = load i64, i64* %log.field0.length.ptr, align 8
  %pattern.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %pattern, i64 0, i32 1
  %pattern.field0.length = load i64, i64* %pattern.field0.length.ptr, align 8
  %pred.alloca = alloca i1, align 1
  store i1 true, i1* %pred.alloca, align 1
  %0 = getelementptr inbounds %"i8*ptr.wrapped.ty", %"i8*ptr.wrapped.ty"* %log, i64 0, i32 0
  %log.unwrapped = load i8**, i8*** %0, align 8
  %1 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %pattern, i64 0, i32 0
  %pattern.unwrapped = load i8*, i8** %1, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  %cmp79.not = icmp eq i32 %L0, 0
  br i1 %cmp79.not, label %for.end50, label %for.cond1.preheader.lr.ph

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add i32 %L1, 1
  %add = sub i32 %sub, %P
  %cmp257.not = icmp eq i32 %add, 0
  %cmp445.not = icmp eq i32 %P, 0
  %cmp2275.not = icmp eq i32 %L1, 0
  %wide.trip.count97 = zext i32 %L0 to i64
  %wide.trip.count = zext i32 %P to i64
  %shadow.0.sroa_cast102 = bitcast i64* %shadow to i8*
  %shadow.0.sroa_cast = bitcast i64* %shadow to i8**
  %wide.trip.count93 = zext i32 %L1 to i64
  %shadow.0.sroa_cast99 = bitcast i64* %shadow to i8**
  %shadow.0.sroa_cast104 = bitcast i64* %shadow to i8*
  %shadow.0.sroa_cast107 = bitcast i64* %shadow to i1*
  %min.iters.check = icmp ult i32 %add, 8
  %min.iters.check110 = icmp ult i32 %add, 32
  %n.vec = and i32 %add, -32
  %cmp.n = icmp eq i32 %add, %n.vec
  %n.vec.remaining = and i32 %add, 24
  %min.epilog.iters.check = icmp eq i32 %n.vec.remaining, 0
  %n.vec116 = and i32 %add, -8
  %cmp.n117 = icmp eq i32 %add, %n.vec116
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.end47
  %indvars.iv95 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next96, %for.end47 ]
  %cond.fold87 = phi i1 [ true, %for.cond1.preheader.lr.ph ], [ %cond.fold79, %for.end47 ]
  %out.29.083 = phi i1 [ false, %for.cond1.preheader.lr.ph ], [ %out.29.1.lcssa, %for.end47 ]
  %out.20.082 = phi i1 [ false, %for.cond1.preheader.lr.ph ], [ %out.20.1.lcssa, %for.end47 ]
  %out.15.081 = phi i1 [ false, %for.cond1.preheader.lr.ph ], [ %out.15.1.lcssa, %for.end47 ]
  %out.frozen.080 = phi i1 [ false, %for.cond1.preheader.lr.ph ], [ %out.frozen.1.lcssa, %for.end47 ]
  %cond.fold3556 = or i1 %out.20.082, %cond.fold87
  br i1 %cmp257.not, label %for.end, label %while.cond.preheader.lr.ph

while.cond.preheader.lr.ph:                       ; preds = %for.cond1.preheader
  %arrayidx6 = getelementptr inbounds i8*, i8** %log.unwrapped, i64 %indvars.iv95
  %idx0.safe82 = icmp sgt i64 %log.field0.length, %indvars.iv95
  br i1 %cmp445.not, label %iter.check, label %while.cond.preheader.us

iter.check:                                       ; preds = %while.cond.preheader.lr.ph
  br i1 %min.iters.check, label %while.cond.preheader.preheader, label %vector.main.loop.iter.check

vector.main.loop.iter.check:                      ; preds = %iter.check
  br i1 %min.iters.check110, label %vec.epilog.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %2 = insertelement <16 x i1> <i1 poison, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false>, i1 %cond.fold3556, i64 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i32 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %index.next = add nuw i32 %index, 32
  %3 = icmp eq i32 %index.next, %n.vec
  br i1 %3, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %4 = insertelement <16 x i1> poison, i1 %out.15.081, i64 0
  %5 = shufflevector <16 x i1> %4, <16 x i1> poison, <16 x i32> zeroinitializer
  %bin.rdx = or <16 x i1> %5, %2
  %6 = bitcast <16 x i1> %bin.rdx to i16
  %7 = icmp ne i16 %6, 0
  br i1 %cmp.n, label %for.end, label %vec.epilog.iter.check

vec.epilog.iter.check:                            ; preds = %middle.block
  br i1 %min.epilog.iters.check, label %while.cond.preheader.preheader, label %vec.epilog.ph

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %bc.merge.rdx = phi i1 [ %cond.fold3556, %vector.main.loop.iter.check ], [ %7, %vec.epilog.iter.check ]
  %vec.epilog.resume.val = phi i32 [ 0, %vector.main.loop.iter.check ], [ %n.vec, %vec.epilog.iter.check ]
  %8 = insertelement <8 x i1> <i1 poison, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false>, i1 %bc.merge.rdx, i64 0
  %broadcast.splatinsert120 = insertelement <8 x i1> poison, i1 %out.15.081, i64 0
  %broadcast.splat121 = shufflevector <8 x i1> %broadcast.splatinsert120, <8 x i1> poison, <8 x i32> zeroinitializer
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index118 = phi i32 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next122, %vec.epilog.vector.body ]
  %index.next122 = add nuw i32 %index118, 8
  %9 = icmp eq i32 %index.next122, %n.vec116
  br i1 %9, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !llvm.loop !9

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %10 = or <8 x i1> %8, %broadcast.splat121
  %11 = bitcast <8 x i1> %10 to i8
  %12 = icmp ne i8 %11, 0
  br i1 %cmp.n117, label %for.end, label %while.cond.preheader.preheader

while.cond.preheader.preheader:                   ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %cond.fold3563.ph = phi i1 [ %cond.fold3556, %iter.check ], [ %7, %vec.epilog.iter.check ], [ %12, %vec.epilog.middle.block ]
  %j.0.rewritten61.ph = phi i32 [ 0, %iter.check ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec116, %vec.epilog.middle.block ]
  br label %while.cond.preheader

while.cond.preheader.us:                          ; preds = %while.cond.preheader.lr.ph, %while.cond.if.then_crit_edge.us
  %cond.fold3563.us = phi i1 [ %cond.fold49.us, %while.cond.if.then_crit_edge.us ], [ %cond.fold3556, %while.cond.preheader.lr.ph ]
  %j.0.rewritten61.us = phi i32 [ %inc17.us, %while.cond.if.then_crit_edge.us ], [ 0, %while.cond.preheader.lr.ph ]
  %found.0.rewritten60.us = phi i32 [ %phi.fold100.us, %while.cond.if.then_crit_edge.us ], [ 0, %while.cond.preheader.lr.ph ]
  %out.15.159.us = phi i1 [ %in.44.us, %while.cond.if.then_crit_edge.us ], [ %out.15.081, %while.cond.preheader.lr.ph ]
  %out.frozen.158.us = phi i1 [ %or.frozen.us, %while.cond.if.then_crit_edge.us ], [ %out.frozen.080, %while.cond.preheader.lr.ph ]
  %cond.fold3944.us = or i1 %out.15.159.us, %cond.fold3563.us
  br label %while.body.us

while.body.us:                                    ; preds = %while.cond.preheader.us, %while.body.us
  %indvars.iv = phi i64 [ 0, %while.cond.preheader.us ], [ %indvars.iv.next, %while.body.us ]
  %cond.fold3949.us = phi i1 [ %cond.fold3944.us, %while.cond.preheader.us ], [ %in.44.us, %while.body.us ]
  %exitpred.frozen5.rewritten48.us = phi i1 [ false, %while.cond.preheader.us ], [ %20, %while.body.us ]
  %out.frozen.246.us = phi i1 [ %out.frozen.158.us, %while.cond.preheader.us ], [ %or.frozen.us, %while.body.us ]
  %or.frozen.us = or i1 %out.frozen.246.us, %cond.fold3949.us
  %arrayidx.us = getelementptr inbounds i8, i8* %pattern.unwrapped, i64 %indvars.iv
  %idx0.safe.us = icmp sgt i64 %pattern.field0.length, %indvars.iv
  %13 = or i1 %idx0.safe.us, %cond.fold3949.us
  %ctsel.us = select i1 %13, i8* %arrayidx.us, i8* %shadow.0.sroa_cast102
  %14 = load i8, i8* %ctsel.us, align 1
  %15 = or i1 %idx0.safe82, %cond.fold3949.us
  %ctsel83.us = select i1 %15, i8** %arrayidx6, i8** %shadow.0.sroa_cast
  %16 = load i8*, i8** %ctsel83.us, align 8
  %17 = trunc i64 %indvars.iv to i32
  %add7.us = add i32 %j.0.rewritten61.us, %17
  %idxprom8.us = zext i32 %add7.us to i64
  %arrayidx9.us = getelementptr inbounds i8, i8* %16, i64 %idxprom8.us
  %idx0.safe84.us = icmp sgt i64 %log.field0.length, %idxprom8.us
  %18 = or i1 %cond.fold3949.us, %idx0.safe84.us
  %ctsel85.us = select i1 %18, i8* %arrayidx9.us, i8* %shadow.0.sroa_cast102
  %19 = load i8, i8* %ctsel85.us, align 1
  %cmp11.us = icmp ne i8 %14, %19
  %20 = or i1 %exitpred.frozen5.rewritten48.us, %cmp11.us
  %21 = xor i1 %20, true
  %in.44.us = and i1 %cond.fold3949.us, %21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %while.cond.if.then_crit_edge.us, label %while.body.us, !llvm.loop !11

while.cond.if.then_crit_edge.us:                  ; preds = %while.body.us
  %in.42.us = and i1 %or.frozen.us, %20
  %cond.fold49.us = or i1 %in.42.us, %in.44.us
  %phi.fold100.us = select i1 %in.42.us, i32 %found.0.rewritten60.us, i32 1
  %inc17.us = add nuw i32 %j.0.rewritten61.us, 1
  %exitcond89.not = icmp eq i32 %inc17.us, %add
  br i1 %exitcond89.not, label %for.end, label %while.cond.preheader.us, !llvm.loop !12

while.cond.preheader:                             ; preds = %while.cond.preheader.preheader, %while.cond.preheader
  %cond.fold3563 = phi i1 [ %cond.fold3944, %while.cond.preheader ], [ %cond.fold3563.ph, %while.cond.preheader.preheader ]
  %j.0.rewritten61 = phi i32 [ %inc17, %while.cond.preheader ], [ %j.0.rewritten61.ph, %while.cond.preheader.preheader ]
  %cond.fold3944 = or i1 %out.15.081, %cond.fold3563
  %inc17 = add nuw i32 %j.0.rewritten61, 1
  %exitcond90.not = icmp eq i32 %inc17, %add
  br i1 %exitcond90.not, label %for.end, label %while.cond.preheader, !llvm.loop !13

for.end:                                          ; preds = %while.cond.if.then_crit_edge.us, %while.cond.preheader, %middle.block, %vec.epilog.middle.block, %for.cond1.preheader
  %out.frozen.1.lcssa = phi i1 [ %out.frozen.080, %for.cond1.preheader ], [ %out.frozen.080, %vec.epilog.middle.block ], [ %out.frozen.080, %middle.block ], [ %out.frozen.080, %while.cond.preheader ], [ %or.frozen.us, %while.cond.if.then_crit_edge.us ]
  %out.15.1.lcssa = phi i1 [ %out.15.081, %for.cond1.preheader ], [ %out.15.081, %vec.epilog.middle.block ], [ %out.15.081, %middle.block ], [ %out.15.081, %while.cond.preheader ], [ %in.44.us, %while.cond.if.then_crit_edge.us ]
  %out.20.1.lcssa = phi i1 [ %out.20.082, %for.cond1.preheader ], [ %12, %vec.epilog.middle.block ], [ %7, %middle.block ], [ %cond.fold3944, %while.cond.preheader ], [ %cond.fold49.us, %while.cond.if.then_crit_edge.us ]
  %found.0.rewritten.lcssa = phi i32 [ 0, %for.cond1.preheader ], [ 1, %vec.epilog.middle.block ], [ 1, %middle.block ], [ 1, %while.cond.preheader ], [ %phi.fold100.us, %while.cond.if.then_crit_edge.us ]
  %cond.fold35.lcssa = phi i1 [ %cond.fold3556, %for.cond1.preheader ], [ %12, %vec.epilog.middle.block ], [ %7, %middle.block ], [ %cond.fold3944, %while.cond.preheader ], [ %cond.fold49.us, %while.cond.if.then_crit_edge.us ]
  %tobool = icmp ne i32 %found.0.rewritten.lcssa, 0
  %22 = xor i1 %tobool, true
  %in.58 = and i1 %cond.fold35.lcssa, %22
  %in.60 = and i1 %tobool, %cond.fold35.lcssa
  %cond.fold6374 = or i1 %out.29.083, %in.60
  br i1 %cmp2275.not, label %for.end47, label %for.body24.lr.ph

for.body24.lr.ph:                                 ; preds = %for.end
  %arrayidx26 = getelementptr inbounds i8*, i8** %log.unwrapped, i64 %indvars.iv95
  %idx0.safe86 = icmp sgt i64 %log.field0.length, %indvars.iv95
  br label %for.body24

for.body24:                                       ; preds = %for.body24.lr.ph, %for.body24
  %indvars.iv91 = phi i64 [ 0, %for.body24.lr.ph ], [ %indvars.iv.next92, %for.body24 ]
  %cond.fold6377 = phi i1 [ %cond.fold6374, %for.body24.lr.ph ], [ %cond.fold74, %for.body24 ]
  %23 = or i1 %idx0.safe86, %cond.fold6377
  %ctsel87 = select i1 %23, i8** %arrayidx26, i8** %shadow.0.sroa_cast99
  %24 = load i8*, i8** %ctsel87, align 8
  %arrayidx28 = getelementptr inbounds i8, i8* %24, i64 %indvars.iv91
  %idx0.safe88 = icmp sgt i64 %log.field0.length, %indvars.iv91
  %25 = or i1 %idx0.safe88, %cond.fold6377
  %ctsel89 = select i1 %25, i8* %arrayidx28, i8* %shadow.0.sroa_cast104
  %26 = load i8, i8* %ctsel89, align 1
  %cmp30 = icmp sgt i8 %26, 47
  %in.66 = and i1 %cond.fold6377, %cmp30
  %27 = or i1 %idx0.safe86, %in.66
  %ctsel91 = select i1 %27, i8** %arrayidx26, i8** %shadow.0.sroa_cast99
  %28 = load i8*, i8** %ctsel91, align 8
  %arrayidx35 = getelementptr inbounds i8, i8* %28, i64 %indvars.iv91
  %29 = or i1 %idx0.safe88, %in.66
  %ctsel93 = select i1 %29, i8* %arrayidx35, i8* %shadow.0.sroa_cast104
  %30 = load i8, i8* %ctsel93, align 1
  %cmp37 = icmp slt i8 %30, 58
  %ctsel94 = select i1 %in.66, i1* %pred.alloca, i1* %shadow.0.sroa_cast107
  %31 = load i1, i1* %ctsel94, align 1
  %select.val. = select i1 %in.66, i1 %cmp37, i1 %31
  store i1 %select.val., i1* %ctsel94, align 1
  %in.68 = and i1 %in.66, %cmp37
  %32 = or i1 %idx0.safe86, %in.68
  %ctsel96 = select i1 %32, i8** %arrayidx26, i8** %shadow.0.sroa_cast99
  %33 = load i8*, i8** %ctsel96, align 8
  %arrayidx43 = getelementptr inbounds i8, i8* %33, i64 %indvars.iv91
  %34 = or i1 %idx0.safe88, %in.68
  %ctsel98 = select i1 %34, i8* %arrayidx43, i8* %shadow.0.sroa_cast104
  %35 = load i8, i8* %ctsel98, align 1
  %select.val.99 = select i1 %in.68, i8 42, i8 %35
  store i8 %select.val.99, i8* %ctsel98, align 1
  %pred.alloca.0.pred.alloca.0.pred.alloca.0.pred.load = load i1, i1* %pred.alloca, align 1
  %36 = xor i1 %pred.alloca.0.pred.alloca.0.pred.alloca.0.pred.load, true
  %in.70 = and i1 %in.66, %36
  %37 = xor i1 %cmp30, true
  %in.71 = and i1 %cond.fold6377, %37
  %cond.fold73 = or i1 %in.68, %in.70
  %cond.fold74 = or i1 %in.71, %cond.fold73
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94.not = icmp eq i64 %indvars.iv.next92, %wide.trip.count93
  br i1 %exitcond94.not, label %for.end47, label %for.body24, !llvm.loop !14

for.end47:                                        ; preds = %for.body24, %for.end
  %out.29.1.lcssa = phi i1 [ %out.29.083, %for.end ], [ %cond.fold74, %for.body24 ]
  %cond.fold63.lcssa = phi i1 [ %cond.fold6374, %for.end ], [ %cond.fold74, %for.body24 ]
  %cond.fold79 = or i1 %in.58, %cond.fold63.lcssa
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond98.not = icmp eq i64 %indvars.iv.next96, %wide.trip.count97
  br i1 %exitcond98.not, label %for.end50, label %for.cond1.preheader, !llvm.loop !15

for.end50:                                        ; preds = %for.end47, %entry
  ret void
}

; Function Attrs: nofree noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
entry:
  %vla.wrapped = alloca %"i8*ptr.wrapped.ty", align 8
  %vla2.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %vla3 = alloca [3 x i8*], align 16
  %vla1 = bitcast [3 x i8*]* %vla3 to i8*
  call void @llvm.var.annotation(i8* nonnull %vla1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 25, i8* null)
  %vla24 = alloca [4 x i8], align 16
  %vla24.sub = getelementptr inbounds [4 x i8], [4 x i8]* %vla24, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %vla24.sub, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 26, i8* null)
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %call = call noalias dereferenceable_or_null(10) i8* @malloc(i64 noundef 10) #5
  %arrayidx = getelementptr inbounds [3 x i8*], [3 x i8*]* %vla3, i64 0, i64 %indvars.iv
  store i8* %call, i8** %arrayidx, align 8
  %call5 = call i64 @read(i32 noundef 0, i8* noundef %call, i64 noundef 10) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 3
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !16

for.end:                                          ; preds = %for.body
  %vla3.sub = getelementptr inbounds [3 x i8*], [3 x i8*]* %vla3, i64 0, i64 0
  %call6 = call i64 @read(i32 noundef 0, i8* noundef nonnull %vla24.sub, i64 noundef 4) #5
  %vla.unwrapped = getelementptr inbounds %"i8*ptr.wrapped.ty", %"i8*ptr.wrapped.ty"* %vla.wrapped, i64 0, i32 0
  %vla.wrapped.field0.length.ptr = getelementptr inbounds %"i8*ptr.wrapped.ty", %"i8*ptr.wrapped.ty"* %vla.wrapped, i64 0, i32 1
  store i64 0, i64* %vla.wrapped.field0.length.ptr, align 8
  store i8** %vla3.sub, i8*** %vla.unwrapped, align 8
  %vla2.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %vla2.wrapped, i64 0, i32 0
  %vla2.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %vla2.wrapped, i64 0, i32 1
  store i64 0, i64* %vla2.wrapped.field0.length.ptr, align 8
  store i8* %vla24.sub, i8** %vla2.unwrapped, align 8
  call void @log_redactor(%"i8*ptr.wrapped.ty"* nonnull %vla.wrapped, %i8ptr.wrapped.ty* nonnull %vla2.wrapped, i32 3, i32 10, i32 4)
  br label %for.body9

for.body9:                                        ; preds = %for.end, %for.body9
  %indvars.iv8 = phi i64 [ 0, %for.end ], [ %indvars.iv.next9, %for.body9 ]
  %arrayidx11 = getelementptr inbounds [3 x i8*], [3 x i8*]* %vla3, i64 0, i64 %indvars.iv8
  %0 = load i8*, i8** %arrayidx11, align 8
  %call12 = call i64 @write(i32 noundef 1, i8* noundef %0, i64 noundef 10) #5
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11.not = icmp eq i64 %indvars.iv.next9, 3
  br i1 %exitcond11.not, label %for.end15, label %for.body9, !llvm.loop !17

for.end15:                                        ; preds = %for.body9
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #4

attributes #0 = { nofree noinline norecurse nosync nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 14.0.6"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = distinct !{!9, !7, !8, !10}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7, !10, !8}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}

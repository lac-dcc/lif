; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [15 x i8] c"lib/dijkstra.c\00", section "llvm.metadata"
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32* @x to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.4, i32 0, i32 0), i32 16, i8* null }], section "llvm.metadata"
@x = dso_local global i32 0, align 4
@.str.3 = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1.4 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @dijkstra(i32 noundef %n, i32 noundef %s, i32 noundef %t, [16 x i32]* noundef %e) #0 {
entry:
  %vis = alloca [16 x i32], align 16
  %dis = alloca [16 x i32], align 16
  %vis1 = bitcast [16 x i32]* %vis to i8*
  call void @llvm.var.annotation(i8* %vis1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i32 10, i8* null)
  %0 = bitcast [16 x i32]* %vis to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 64, i1 false)
  %dis2 = bitcast [16 x i32]* %dis to i8*
  call void @llvm.var.annotation(i8* %dis2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i32 11, i8* null)
  %1 = bitcast [16 x i32]* %dis to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 64, i1 false)
  %idxprom = sext i32 %s to i64
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom
  store i32 1, i32* %arrayidx, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, %n
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom3 = sext i32 %s to i64
  %arrayidx4 = getelementptr inbounds [16 x i32], [16 x i32]* %e, i64 %idxprom3
  %idxprom5 = sext i32 %i.0 to i64
  %arrayidx6 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx4, i64 0, i64 %idxprom5
  %2 = load i32, i32* %arrayidx6, align 4
  %idxprom7 = sext i32 %i.0 to i64
  %arrayidx8 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom7
  store i32 %2, i32* %arrayidx8, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc61, %for.end
  %bestj.0 = phi i32 [ -1, %for.end ], [ %bestj.1, %for.inc61 ]
  %i9.0 = phi i32 [ 0, %for.end ], [ %inc62, %for.inc61 ]
  %cmp11 = icmp slt i32 %i9.0, %n
  br i1 %cmp11, label %for.body12, label %for.end63

for.body12:                                       ; preds = %for.cond10
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc26, %for.body12
  %bestj.1 = phi i32 [ %bestj.0, %for.body12 ], [ %bestj.2, %for.inc26 ]
  %j.0 = phi i32 [ 0, %for.body12 ], [ %inc27, %for.inc26 ]
  %cmp14 = icmp slt i32 %j.0, %n
  br i1 %cmp14, label %for.body15, label %for.end28

for.body15:                                       ; preds = %for.cond13
  %idxprom16 = sext i32 %j.0 to i64
  %arrayidx17 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom16
  %3 = load i32, i32* %arrayidx17, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %for.body15
  %cmp18 = icmp slt i32 %bestj.1, 0
  br i1 %cmp18, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %idxprom19 = sext i32 %j.0 to i64
  %arrayidx20 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom19
  %4 = load i32, i32* %arrayidx20, align 4
  %idxprom21 = sext i32 %bestj.1 to i64
  %arrayidx22 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom21
  %5 = load i32, i32* %arrayidx22, align 4
  %cmp23 = icmp slt i32 %4, %5
  br i1 %cmp23, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %6 = load i32, i32* @x, align 4
  %add = add nsw i32 %j.0, %6
  %idxprom24 = sext i32 %add to i64
  %arrayidx25 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom24
  store i32 1, i32* %arrayidx25, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false, %for.body15
  %bestj.2 = phi i32 [ %bestj.1, %for.body15 ], [ %add, %if.then ], [ %bestj.1, %lor.lhs.false ]
  br label %for.inc26

for.inc26:                                        ; preds = %if.end
  %inc27 = add nsw i32 %j.0, 1
  br label %for.cond13, !llvm.loop !8

for.end28:                                        ; preds = %for.cond13
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc58, %for.end28
  %j29.0 = phi i32 [ 0, %for.end28 ], [ %inc59, %for.inc58 ]
  %cmp31 = icmp slt i32 %j29.0, %n
  br i1 %cmp31, label %for.body32, label %for.end60

for.body32:                                       ; preds = %for.cond30
  %idxprom33 = sext i32 %j29.0 to i64
  %arrayidx34 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom33
  %7 = load i32, i32* %arrayidx34, align 4
  %tobool35 = icmp ne i32 %7, 0
  br i1 %tobool35, label %if.end57, label %land.lhs.true36

land.lhs.true36:                                  ; preds = %for.body32
  %idxprom37 = sext i32 %bestj.1 to i64
  %arrayidx38 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom37
  %8 = load i32, i32* %arrayidx38, align 4
  %idxprom39 = sext i32 %bestj.1 to i64
  %arrayidx40 = getelementptr inbounds [16 x i32], [16 x i32]* %e, i64 %idxprom39
  %idxprom41 = sext i32 %j29.0 to i64
  %arrayidx42 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx40, i64 0, i64 %idxprom41
  %9 = load i32, i32* %arrayidx42, align 4
  %add43 = add nsw i32 %8, %9
  %idxprom44 = sext i32 %j29.0 to i64
  %arrayidx45 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom44
  %10 = load i32, i32* %arrayidx45, align 4
  %cmp46 = icmp slt i32 %add43, %10
  br i1 %cmp46, label %if.then47, label %if.end57

if.then47:                                        ; preds = %land.lhs.true36
  %idxprom48 = sext i32 %bestj.1 to i64
  %arrayidx49 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom48
  %11 = load i32, i32* %arrayidx49, align 4
  %idxprom50 = sext i32 %bestj.1 to i64
  %arrayidx51 = getelementptr inbounds [16 x i32], [16 x i32]* %e, i64 %idxprom50
  %idxprom52 = sext i32 %j29.0 to i64
  %arrayidx53 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx51, i64 0, i64 %idxprom52
  %12 = load i32, i32* %arrayidx53, align 4
  %add54 = add nsw i32 %11, %12
  %idxprom55 = sext i32 %j29.0 to i64
  %arrayidx56 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom55
  store i32 %add54, i32* %arrayidx56, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.then47, %land.lhs.true36, %for.body32
  br label %for.inc58

for.inc58:                                        ; preds = %if.end57
  %inc59 = add nsw i32 %j29.0, 1
  br label %for.cond30, !llvm.loop !9

for.end60:                                        ; preds = %for.cond30
  br label %for.inc61

for.inc61:                                        ; preds = %for.end60
  %inc62 = add nsw i32 %i9.0, 1
  br label %for.cond10, !llvm.loop !10

for.end63:                                        ; preds = %for.cond10
  %idxprom64 = sext i32 %t to i64
  %arrayidx65 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom64
  %13 = load i32, i32* %arrayidx65, align 4
  ret i32 %13
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %in = alloca [16 x [16 x i32]], align 16
  %_zzq_args22 = alloca [6 x i64], align 16
  %_zzq_result23 = alloca i64, align 8
  %_zzq_args32 = alloca [6 x i64], align 16
  %_zzq_result33 = alloca i64, align 8
  %r = alloca i32, align 4
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
  %3 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx8, i64 0) #4, !srcloc !11
  store volatile i64 %3, i64* %_zzq_result, align 8
  %4 = load volatile i64, i64* %_zzq_result, align 8
  %in9 = bitcast [16 x [16 x i32]]* %in to i8*
  call void @llvm.var.annotation(i8* %in9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1.4, i32 0, i32 0), i32 25, i8* null)
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ]
  %cmp = icmp slt i32 %i.0, 16
  br i1 %cmp, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp12 = icmp slt i32 %j.0, 16
  br i1 %cmp12, label %for.body14, label %for.end

for.body14:                                       ; preds = %for.cond11
  %idxprom = sext i32 %i.0 to i64
  %arrayidx15 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %in, i64 0, i64 %idxprom
  %idxprom16 = sext i32 %j.0 to i64
  %arrayidx17 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx15, i64 0, i64 %idxprom16
  %5 = bitcast i32* %arrayidx17 to i8*
  %call18 = call i64 @read(i32 noundef 0, i8* noundef %5, i64 noundef 4)
  br label %for.inc

for.inc:                                          ; preds = %for.body14
  %inc = add nsw i32 %j.0, 1
  br label %for.cond11, !llvm.loop !12

for.end:                                          ; preds = %for.cond11
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %inc20 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !13

for.end21:                                        ; preds = %for.cond
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
  %6 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx30, i64 0) #4, !srcloc !14
  store volatile i64 %6, i64* %_zzq_result23, align 8
  %7 = load volatile i64, i64* %_zzq_result23, align 8
  %arrayidx34 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx34, align 16
  %arraydecay = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %in, i64 0, i64 0
  %8 = ptrtoint [16 x i32]* %arraydecay to i64
  %arrayidx35 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 1
  store volatile i64 %8, i64* %arrayidx35, align 8
  %arrayidx36 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 2
  store volatile i64 1024, i64* %arrayidx36, align 16
  %arrayidx37 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx37, align 8
  %arrayidx38 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx38, align 16
  %arrayidx39 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx39, align 8
  %arrayidx40 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args32, i64 0, i64 0
  %9 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx40, i64 0) #4, !srcloc !15
  store volatile i64 %9, i64* %_zzq_result33, align 8
  %10 = load volatile i64, i64* %_zzq_result33, align 8
  %arraydecay42 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %in, i64 0, i64 0
  %call43 = call i32 @dijkstra(i32 noundef 16, i32 noundef 0, i32 noundef 15, [16 x i32]* noundef %arraydecay42)
  store i32 %call43, i32* %r, align 4
  %11 = bitcast i32* %r to i8*
  %call44 = call i64 @write(i32 noundef 1, i8* noundef %11, i64 noundef 4)
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = !{i64 2148115033, i64 2148115069, i64 2148115137}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = !{i64 2148116671, i64 2148116707, i64 2148116775}
!15 = !{i64 2148118297, i64 2148118333, i64 2148118401}

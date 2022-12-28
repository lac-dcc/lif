; ModuleID = 'llvm-ir/dijkstra.ctgrind.ll'
source_filename = "lib/dijkstra.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [15 x i8] c"lib/dijkstra.c\00", section "llvm.metadata"
@x = external global i32, align 4

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @dijkstra(i32 noundef %n, i32 noundef %s, i32 noundef %t, [16 x i32]* noundef %e) #0 {
entry:
  %vis = alloca [16 x i32], align 16
  %dis = alloca [16 x i32], align 16
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %_zzq_args10 = alloca [6 x i64], align 16
  %_zzq_result11 = alloca i64, align 8
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
  %arrayidx3 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx3, align 16
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 0
  %2 = ptrtoint i32* %arraydecay to i64
  %arrayidx4 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %2, i64* %arrayidx4, align 8
  %arrayidx5 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 64, i64* %arrayidx5, align 16
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx7, align 16
  %arrayidx8 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %3 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx9, i64 0) #3, !srcloc !6
  store volatile i64 %3, i64* %_zzq_result, align 8
  %4 = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx12 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx12, align 16
  %arraydecay13 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 0
  %5 = ptrtoint i32* %arraydecay13 to i64
  %arrayidx14 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 1
  store volatile i64 %5, i64* %arrayidx14, align 8
  %arrayidx15 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 2
  store volatile i64 64, i64* %arrayidx15, align 16
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx16, align 8
  %arrayidx17 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx17, align 16
  %arrayidx18 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx18, align 8
  %arrayidx19 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args10, i64 0, i64 0
  %6 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx19, i64 0) #3, !srcloc !7
  store volatile i64 %6, i64* %_zzq_result11, align 8
  %7 = load volatile i64, i64* %_zzq_result11, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, %n
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom21 = sext i32 %s to i64
  %arrayidx22 = getelementptr inbounds [16 x i32], [16 x i32]* %e, i64 %idxprom21
  %idxprom23 = sext i32 %i.0 to i64
  %arrayidx24 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx22, i64 0, i64 %idxprom23
  %8 = load i32, i32* %arrayidx24, align 4
  %idxprom25 = sext i32 %i.0 to i64
  %arrayidx26 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom25
  store i32 %8, i32* %arrayidx26, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  br label %for.cond28

for.cond28:                                       ; preds = %for.inc79, %for.end
  %bestj.0 = phi i32 [ -1, %for.end ], [ %bestj.1, %for.inc79 ]
  %i27.0 = phi i32 [ 0, %for.end ], [ %inc80, %for.inc79 ]
  %cmp29 = icmp slt i32 %i27.0, %n
  br i1 %cmp29, label %for.body30, label %for.end81

for.body30:                                       ; preds = %for.cond28
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc44, %for.body30
  %bestj.1 = phi i32 [ %bestj.0, %for.body30 ], [ %bestj.2, %for.inc44 ]
  %j.0 = phi i32 [ 0, %for.body30 ], [ %inc45, %for.inc44 ]
  %cmp32 = icmp slt i32 %j.0, %n
  br i1 %cmp32, label %for.body33, label %for.end46

for.body33:                                       ; preds = %for.cond31
  %idxprom34 = sext i32 %j.0 to i64
  %arrayidx35 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom34
  %9 = load i32, i32* %arrayidx35, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %for.body33
  %cmp36 = icmp slt i32 %bestj.1, 0
  br i1 %cmp36, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %idxprom37 = sext i32 %j.0 to i64
  %arrayidx38 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom37
  %10 = load i32, i32* %arrayidx38, align 4
  %idxprom39 = sext i32 %bestj.1 to i64
  %arrayidx40 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom39
  %11 = load i32, i32* %arrayidx40, align 4
  %cmp41 = icmp slt i32 %10, %11
  br i1 %cmp41, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %12 = load i32, i32* @x, align 4
  %add = add nsw i32 %j.0, %12
  %idxprom42 = sext i32 %add to i64
  %arrayidx43 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom42
  store i32 1, i32* %arrayidx43, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false, %for.body33
  %bestj.2 = phi i32 [ %bestj.1, %for.body33 ], [ %add, %if.then ], [ %bestj.1, %lor.lhs.false ]
  br label %for.inc44

for.inc44:                                        ; preds = %if.end
  %inc45 = add nsw i32 %j.0, 1
  br label %for.cond31, !llvm.loop !10

for.end46:                                        ; preds = %for.cond31
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc76, %for.end46
  %j47.0 = phi i32 [ 0, %for.end46 ], [ %inc77, %for.inc76 ]
  %cmp49 = icmp slt i32 %j47.0, %n
  br i1 %cmp49, label %for.body50, label %for.end78

for.body50:                                       ; preds = %for.cond48
  %idxprom51 = sext i32 %j47.0 to i64
  %arrayidx52 = getelementptr inbounds [16 x i32], [16 x i32]* %vis, i64 0, i64 %idxprom51
  %13 = load i32, i32* %arrayidx52, align 4
  %tobool53 = icmp ne i32 %13, 0
  br i1 %tobool53, label %if.end75, label %land.lhs.true54

land.lhs.true54:                                  ; preds = %for.body50
  %idxprom55 = sext i32 %bestj.1 to i64
  %arrayidx56 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom55
  %14 = load i32, i32* %arrayidx56, align 4
  %idxprom57 = sext i32 %bestj.1 to i64
  %arrayidx58 = getelementptr inbounds [16 x i32], [16 x i32]* %e, i64 %idxprom57
  %idxprom59 = sext i32 %j47.0 to i64
  %arrayidx60 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx58, i64 0, i64 %idxprom59
  %15 = load i32, i32* %arrayidx60, align 4
  %add61 = add nsw i32 %14, %15
  %idxprom62 = sext i32 %j47.0 to i64
  %arrayidx63 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom62
  %16 = load i32, i32* %arrayidx63, align 4
  %cmp64 = icmp slt i32 %add61, %16
  br i1 %cmp64, label %if.then65, label %if.end75

if.then65:                                        ; preds = %land.lhs.true54
  %idxprom66 = sext i32 %bestj.1 to i64
  %arrayidx67 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom66
  %17 = load i32, i32* %arrayidx67, align 4
  %idxprom68 = sext i32 %bestj.1 to i64
  %arrayidx69 = getelementptr inbounds [16 x i32], [16 x i32]* %e, i64 %idxprom68
  %idxprom70 = sext i32 %j47.0 to i64
  %arrayidx71 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx69, i64 0, i64 %idxprom70
  %18 = load i32, i32* %arrayidx71, align 4
  %add72 = add nsw i32 %17, %18
  %idxprom73 = sext i32 %j47.0 to i64
  %arrayidx74 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom73
  store i32 %add72, i32* %arrayidx74, align 4
  br label %if.end75

if.end75:                                         ; preds = %if.then65, %land.lhs.true54, %for.body50
  br label %for.inc76

for.inc76:                                        ; preds = %if.end75
  %inc77 = add nsw i32 %j47.0, 1
  br label %for.cond48, !llvm.loop !11

for.end78:                                        ; preds = %for.cond48
  br label %for.inc79

for.inc79:                                        ; preds = %for.end78
  %inc80 = add nsw i32 %i27.0, 1
  br label %for.cond28, !llvm.loop !12

for.end81:                                        ; preds = %for.cond28
  %idxprom82 = sext i32 %t to i64
  %arrayidx83 = getelementptr inbounds [16 x i32], [16 x i32]* %dis, i64 0, i64 %idxprom82
  %19 = load i32, i32* %arrayidx83, align 4
  ret i32 %19
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 14.0.6"}
!6 = !{i64 2147941460, i64 2147941496, i64 2147941564}
!7 = !{i64 2147943071, i64 2147943107, i64 2147943175}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}

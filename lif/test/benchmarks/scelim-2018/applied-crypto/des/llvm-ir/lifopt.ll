; ModuleID = 'llvm-ir/lif.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%i8ptr.wrapped.ty = type { i8*, i64 }
%i64ptr.wrapped.ty = type { i64*, i64 }
%struct.des_ctx = type { [32 x i64], [32 x i64] }

@KnL = dso_local global [32 x i64] zeroinitializer, align 16
@KnR = dso_local local_unnamed_addr global [32 x i64] zeroinitializer, align 16
@Kn3 = dso_local local_unnamed_addr global [32 x i64] zeroinitializer, align 16
@Df_Key = dso_local local_unnamed_addr global [24 x i8] c"\01#Eg\89\AB\CD\EF\FE\DC\BA\98vT2\10\89\AB\CD\EF\01#Eg", align 16
@bytebit = dso_local local_unnamed_addr global [8 x i16] [i16 128, i16 64, i16 32, i16 16, i16 8, i16 4, i16 2, i16 1], align 16
@bigbyte = dso_local local_unnamed_addr global [24 x i64] [i64 8388608, i64 4194304, i64 2097152, i64 1048576, i64 524288, i64 262144, i64 131072, i64 65536, i64 32768, i64 16384, i64 8192, i64 4096, i64 2048, i64 1024, i64 512, i64 256, i64 128, i64 64, i64 32, i64 16, i64 8, i64 4, i64 2, i64 1], align 16
@pc1 = dso_local local_unnamed_addr global [56 x i8] c"80( \18\10\08\0091)!\19\11\09\01:2*\22\1A\12\0A\02;3+#>6.&\1E\16\0E\06=5-%\1D\15\0D\05<4,$\1C\14\0C\04\1B\13\0B\03", align 16
@totrot = dso_local local_unnamed_addr global [16 x i8] c"\01\02\04\06\08\0A\0C\0E\0F\11\13\15\17\19\1B\1C", align 16
@pc2 = dso_local local_unnamed_addr global [48 x i8] c"\0D\10\0A\17\00\04\02\1B\0E\05\14\09\16\12\0B\03\19\07\0F\06\1A\13\0C\01(3\1E$.6\1D'2, /+0&7!4-)1#\1C\1F", align 16
@SP1 = dso_local local_unnamed_addr global [64 x i64] [i64 16843776, i64 0, i64 65536, i64 16843780, i64 16842756, i64 66564, i64 4, i64 65536, i64 1024, i64 16843776, i64 16843780, i64 1024, i64 16778244, i64 16842756, i64 16777216, i64 4, i64 1028, i64 16778240, i64 16778240, i64 66560, i64 66560, i64 16842752, i64 16842752, i64 16778244, i64 65540, i64 16777220, i64 16777220, i64 65540, i64 0, i64 1028, i64 66564, i64 16777216, i64 65536, i64 16843780, i64 4, i64 16842752, i64 16843776, i64 16777216, i64 16777216, i64 1024, i64 16842756, i64 65536, i64 66560, i64 16777220, i64 1024, i64 4, i64 16778244, i64 66564, i64 16843780, i64 65540, i64 16842752, i64 16778244, i64 16777220, i64 1028, i64 66564, i64 16843776, i64 1028, i64 16778240, i64 16778240, i64 0, i64 65540, i64 66560, i64 0, i64 16842756], align 16
@SP2 = dso_local local_unnamed_addr global [64 x i64] [i64 2148565024, i64 2147516416, i64 32768, i64 1081376, i64 1048576, i64 32, i64 2148532256, i64 2147516448, i64 2147483680, i64 2148565024, i64 2148564992, i64 2147483648, i64 2147516416, i64 1048576, i64 32, i64 2148532256, i64 1081344, i64 1048608, i64 2147516448, i64 0, i64 2147483648, i64 32768, i64 1081376, i64 2148532224, i64 1048608, i64 2147483680, i64 0, i64 1081344, i64 32800, i64 2148564992, i64 2148532224, i64 32800, i64 0, i64 1081376, i64 2148532256, i64 1048576, i64 2147516448, i64 2148532224, i64 2148564992, i64 32768, i64 2148532224, i64 2147516416, i64 32, i64 2148565024, i64 1081376, i64 32, i64 32768, i64 2147483648, i64 32800, i64 2148564992, i64 1048576, i64 2147483680, i64 1048608, i64 2147516448, i64 2147483680, i64 1048608, i64 1081344, i64 0, i64 2147516416, i64 32800, i64 2147483648, i64 2148532256, i64 2148565024, i64 1081344], align 16
@SP3 = dso_local local_unnamed_addr global [64 x i64] [i64 520, i64 134349312, i64 0, i64 134348808, i64 134218240, i64 0, i64 131592, i64 134218240, i64 131080, i64 134217736, i64 134217736, i64 131072, i64 134349320, i64 131080, i64 134348800, i64 520, i64 134217728, i64 8, i64 134349312, i64 512, i64 131584, i64 134348800, i64 134348808, i64 131592, i64 134218248, i64 131584, i64 131072, i64 134218248, i64 8, i64 134349320, i64 512, i64 134217728, i64 134349312, i64 134217728, i64 131080, i64 520, i64 131072, i64 134349312, i64 134218240, i64 0, i64 512, i64 131080, i64 134349320, i64 134218240, i64 134217736, i64 512, i64 0, i64 134348808, i64 134218248, i64 131072, i64 134217728, i64 134349320, i64 8, i64 131592, i64 131584, i64 134217736, i64 134348800, i64 134218248, i64 520, i64 134348800, i64 131592, i64 8, i64 134348808, i64 131584], align 16
@SP4 = dso_local local_unnamed_addr global [64 x i64] [i64 8396801, i64 8321, i64 8321, i64 128, i64 8396928, i64 8388737, i64 8388609, i64 8193, i64 0, i64 8396800, i64 8396800, i64 8396929, i64 129, i64 0, i64 8388736, i64 8388609, i64 1, i64 8192, i64 8388608, i64 8396801, i64 128, i64 8388608, i64 8193, i64 8320, i64 8388737, i64 1, i64 8320, i64 8388736, i64 8192, i64 8396928, i64 8396929, i64 129, i64 8388736, i64 8388609, i64 8396800, i64 8396929, i64 129, i64 0, i64 0, i64 8396800, i64 8320, i64 8388736, i64 8388737, i64 1, i64 8396801, i64 8321, i64 8321, i64 128, i64 8396929, i64 129, i64 1, i64 8192, i64 8388609, i64 8193, i64 8396928, i64 8388737, i64 8193, i64 8320, i64 8388608, i64 8396801, i64 128, i64 8388608, i64 8192, i64 8396928], align 16
@SP5 = dso_local local_unnamed_addr global [64 x i64] [i64 256, i64 34078976, i64 34078720, i64 1107296512, i64 524288, i64 256, i64 1073741824, i64 34078720, i64 1074266368, i64 524288, i64 33554688, i64 1074266368, i64 1107296512, i64 1107820544, i64 524544, i64 1073741824, i64 33554432, i64 1074266112, i64 1074266112, i64 0, i64 1073742080, i64 1107820800, i64 1107820800, i64 33554688, i64 1107820544, i64 1073742080, i64 0, i64 1107296256, i64 34078976, i64 33554432, i64 1107296256, i64 524544, i64 524288, i64 1107296512, i64 256, i64 33554432, i64 1073741824, i64 34078720, i64 1107296512, i64 1074266368, i64 33554688, i64 1073741824, i64 1107820544, i64 34078976, i64 1074266368, i64 256, i64 33554432, i64 1107820544, i64 1107820800, i64 524544, i64 1107296256, i64 1107820800, i64 34078720, i64 0, i64 1074266112, i64 1107296256, i64 524544, i64 33554688, i64 1073742080, i64 524288, i64 0, i64 1074266112, i64 34078976, i64 1073742080], align 16
@SP6 = dso_local local_unnamed_addr global [64 x i64] [i64 536870928, i64 541065216, i64 16384, i64 541081616, i64 541065216, i64 16, i64 541081616, i64 4194304, i64 536887296, i64 4210704, i64 4194304, i64 536870928, i64 4194320, i64 536887296, i64 536870912, i64 16400, i64 0, i64 4194320, i64 536887312, i64 16384, i64 4210688, i64 536887312, i64 16, i64 541065232, i64 541065232, i64 0, i64 4210704, i64 541081600, i64 16400, i64 4210688, i64 541081600, i64 536870912, i64 536887296, i64 16, i64 541065232, i64 4210688, i64 541081616, i64 4194304, i64 16400, i64 536870928, i64 4194304, i64 536887296, i64 536870912, i64 16400, i64 536870928, i64 541081616, i64 4210688, i64 541065216, i64 4210704, i64 541081600, i64 0, i64 541065232, i64 16, i64 16384, i64 541065216, i64 4210704, i64 16384, i64 4194320, i64 536887312, i64 0, i64 541081600, i64 536870912, i64 4194320, i64 536887312], align 16
@SP7 = dso_local local_unnamed_addr global [64 x i64] [i64 2097152, i64 69206018, i64 67110914, i64 0, i64 2048, i64 67110914, i64 2099202, i64 69208064, i64 69208066, i64 2097152, i64 0, i64 67108866, i64 2, i64 67108864, i64 69206018, i64 2050, i64 67110912, i64 2099202, i64 2097154, i64 67110912, i64 67108866, i64 69206016, i64 69208064, i64 2097154, i64 69206016, i64 2048, i64 2050, i64 69208066, i64 2099200, i64 2, i64 67108864, i64 2099200, i64 67108864, i64 2099200, i64 2097152, i64 67110914, i64 67110914, i64 69206018, i64 69206018, i64 2, i64 2097154, i64 67108864, i64 67110912, i64 2097152, i64 69208064, i64 2050, i64 2099202, i64 69208064, i64 2050, i64 67108866, i64 69208066, i64 69206016, i64 2099200, i64 0, i64 2, i64 69208066, i64 0, i64 2099202, i64 69206016, i64 2048, i64 67108866, i64 67110912, i64 2048, i64 2097154], align 16
@SP8 = dso_local local_unnamed_addr global [64 x i64] [i64 268439616, i64 4096, i64 262144, i64 268701760, i64 268435456, i64 268439616, i64 64, i64 268435456, i64 262208, i64 268697600, i64 268701760, i64 266240, i64 268701696, i64 266304, i64 4096, i64 64, i64 268697600, i64 268435520, i64 268439552, i64 4160, i64 266240, i64 262208, i64 268697664, i64 268701696, i64 4160, i64 0, i64 0, i64 268697664, i64 268435520, i64 268439552, i64 266304, i64 262144, i64 266304, i64 262144, i64 268701696, i64 4096, i64 64, i64 268697664, i64 4096, i64 266304, i64 268439552, i64 64, i64 268435520, i64 268697600, i64 268697664, i64 268435456, i64 262144, i64 268439616, i64 0, i64 268701760, i64 262208, i64 268435520, i64 268697600, i64 268439552, i64 268439616, i64 0, i64 268701760, i64 266240, i64 266240, i64 4160, i64 4160, i64 262208, i64 268435456, i64 268701696], align 16
@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @deskey(%i8ptr.wrapped.ty* nocapture noundef readonly %key, i16 noundef signext %edf) local_unnamed_addr #0 {
entry:
  %arraydecay.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %0 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %key, i64 0, i32 0
  %key.unwrapped = load i8*, i8** %0, align 8
  %pc1m = alloca [56 x i8], align 16
  %pcr = alloca [56 x i8], align 16
  %kn = alloca [32 x i64], align 16
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.body

for.cond11.preheader:                             ; preds = %for.body
  %cmp16 = icmp eq i16 %edf, 1
  br label %for.body14

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds [56 x i8], [56 x i8]* @pc1, i64 0, i64 %indvars.iv
  %1 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %1 to i32
  %and = and i32 %conv, 7
  %2 = lshr i32 %conv, 3
  %3 = zext i32 %2 to i64
  %arrayidx2 = getelementptr inbounds i8, i8* %key.unwrapped, i64 %3
  %4 = load i8, i8* %arrayidx2, align 1
  %conv3 = zext i8 %4 to i32
  %5 = zext i32 %and to i64
  %arrayidx5 = getelementptr inbounds [8 x i16], [8 x i16]* @bytebit, i64 0, i64 %5
  %6 = load i16, i16* %arrayidx5, align 2
  %conv6 = zext i16 %6 to i32
  %and7 = and i32 %conv6, %conv3
  %tobool.not = icmp ne i32 %and7, 0
  %conv8 = zext i1 %tobool.not to i8
  %arrayidx10 = getelementptr inbounds [56 x i8], [56 x i8]* %pc1m, i64 0, i64 %indvars.iv
  store i8 %conv8, i8* %arrayidx10, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 56
  br i1 %exitcond.not, label %for.cond11.preheader, label %for.body, !llvm.loop !6

for.body14:                                       ; preds = %for.cond11.preheader, %for.end103
  %indvars.iv60 = phi i64 [ 0, %for.cond11.preheader ], [ %indvars.iv.next61, %for.end103 ]
  %cond.fold4743 = phi i1 [ true, %for.cond11.preheader ], [ %cond.fold8330, %for.end103 ]
  %i.0.rewritten42 = phi i32 [ 0, %for.cond11.preheader ], [ %inc105, %for.end103 ]
  %out.38.041 = phi i1 [ false, %for.cond11.preheader ], [ %cond.fold8330, %for.end103 ]
  %out.30.040 = phi i1 [ false, %for.cond11.preheader ], [ %cond.fold78, %for.end103 ]
  %out.28.039 = phi i1 [ false, %for.cond11.preheader ], [ %out.28.2, %for.end103 ]
  %out.27.038 = phi i1 [ false, %for.cond11.preheader ], [ %out.27.2, %for.end103 ]
  %out.23.037 = phi i1 [ false, %for.cond11.preheader ], [ %cond.fold65, %for.end103 ]
  %out.21.036 = phi i1 [ false, %for.cond11.preheader ], [ %out.21.2, %for.end103 ]
  %out.20.035 = phi i1 [ false, %for.cond11.preheader ], [ %out.20.2, %for.end103 ]
  %out.16.034 = phi i1 [ false, %for.cond11.preheader ], [ %out.16.1, %for.end103 ]
  %out.15.033 = phi i1 [ false, %for.cond11.preheader ], [ %out.15.1, %for.end103 ]
  %sub = sub nuw nsw i32 15, %i.0.rewritten42
  %out.15.1 = select i1 %cmp16, i1 %cond.fold4743, i1 %out.15.033
  %out.16.1 = select i1 %cmp16, i1 %out.16.034, i1 %cond.fold4743
  %7 = trunc i64 %indvars.iv60 to i32
  %m.0.rewritten.in = select i1 %cmp16, i32 %sub, i32 %7
  %m.0.rewritten = shl nuw nsw i32 %m.0.rewritten.in, 1
  %cond.fold55 = or i1 %out.16.1, %out.15.1
  %add = or i32 %m.0.rewritten, 1
  %idxprom19 = sext i32 %add to i64
  %arrayidx20 = getelementptr inbounds [32 x i64], [32 x i64]* %kn, i64 0, i64 %idxprom19
  store i64 0, i64* %arrayidx20, align 8
  %idxprom2113 = zext i32 %m.0.rewritten to i64
  %arrayidx22 = getelementptr inbounds [32 x i64], [32 x i64]* %kn, i64 0, i64 %idxprom2113
  store i64 0, i64* %arrayidx22, align 16
  %arrayidx28 = getelementptr inbounds [16 x i8], [16 x i8]* @totrot, i64 0, i64 %indvars.iv60
  %8 = load i8, i8* %arrayidx28, align 1
  %cond.fold5716 = or i1 %out.23.037, %cond.fold55
  %9 = zext i8 %8 to i64
  br label %for.body26

for.cond48.preheader:                             ; preds = %for.body26
  %cond.fold7023 = or i1 %out.30.040, %cond.fold65
  br label %for.body51

for.body26:                                       ; preds = %for.body14, %for.body26
  %indvars.iv45 = phi i64 [ 0, %for.body14 ], [ %indvars.iv.next46, %for.body26 ]
  %cond.fold5721 = phi i1 [ %cond.fold5716, %for.body14 ], [ %cond.fold65, %for.body26 ]
  %out.21.118 = phi i1 [ %out.21.036, %for.body14 ], [ %out.21.2, %for.body26 ]
  %out.20.117 = phi i1 [ %out.20.035, %for.body14 ], [ %out.20.2, %for.body26 ]
  %10 = add nuw nsw i64 %indvars.iv45, %9
  %cmp31 = icmp ult i64 %10, 28
  %11 = add nuw i64 %10, 4294967268
  %12 = and i64 %11, 4294967295
  %.pn = select i1 %cmp31, i64 %10, i64 %12
  %out.20.2 = select i1 %cmp31, i1 %cond.fold5721, i1 %out.20.117
  %out.21.2 = select i1 %cmp31, i1 %out.21.118, i1 %cond.fold5721
  %.sink.in = getelementptr inbounds [56 x i8], [56 x i8]* %pc1m, i64 0, i64 %.pn
  %.sink = load i8, i8* %.sink.in, align 1
  %13 = getelementptr inbounds [56 x i8], [56 x i8]* %pcr, i64 0, i64 %indvars.iv45
  store i8 %.sink, i8* %13, align 1
  %cond.fold65 = or i1 %out.20.2, %out.21.2
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond49.not = icmp eq i64 %indvars.iv.next46, 28
  br i1 %exitcond49.not, label %for.cond48.preheader, label %for.body26, !llvm.loop !8

for.cond73.preheader:                             ; preds = %for.body51
  %idx1.safe102 = icmp slt i32 %m.0.rewritten.in, 16
  %idx1.safe111 = icmp slt i32 %add, 32
  %cond.fold8330 = or i1 %out.38.041, %cond.fold78
  br label %for.body76

for.body51:                                       ; preds = %for.cond48.preheader, %for.body51
  %indvars.iv50 = phi i64 [ 28, %for.cond48.preheader ], [ %indvars.iv.next51, %for.body51 ]
  %cond.fold7028 = phi i1 [ %cond.fold7023, %for.cond48.preheader ], [ %cond.fold78, %for.body51 ]
  %out.28.125 = phi i1 [ %out.28.039, %for.cond48.preheader ], [ %out.28.2, %for.body51 ]
  %out.27.124 = phi i1 [ %out.27.038, %for.cond48.preheader ], [ %out.27.2, %for.body51 ]
  %14 = add nuw nsw i64 %indvars.iv50, %9
  %cmp56 = icmp ult i64 %14, 56
  %15 = add nsw i64 %14, -28
  %.pn65 = select i1 %cmp56, i64 %14, i64 %15
  %out.27.2 = select i1 %cmp56, i1 %cond.fold7028, i1 %out.27.124
  %out.28.2 = select i1 %cmp56, i1 %out.28.125, i1 %cond.fold7028
  %.sink64.in = getelementptr inbounds [56 x i8], [56 x i8]* %pc1m, i64 0, i64 %.pn65
  %.sink64 = load i8, i8* %.sink64.in, align 1
  %16 = getelementptr inbounds [56 x i8], [56 x i8]* %pcr, i64 0, i64 %indvars.iv50
  store i8 %.sink64, i8* %16, align 1
  %cond.fold78 = or i1 %out.27.2, %out.28.2
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond54.not = icmp eq i64 %indvars.iv.next51, 56
  br i1 %exitcond54.not, label %for.cond73.preheader, label %for.body51, !llvm.loop !9

for.body76:                                       ; preds = %for.cond73.preheader, %for.body76
  %indvars.iv55 = phi i64 [ 0, %for.cond73.preheader ], [ %indvars.iv.next56, %for.body76 ]
  %arrayidx78 = getelementptr inbounds [48 x i8], [48 x i8]* @pc2, i64 0, i64 %indvars.iv55
  %17 = load i8, i8* %arrayidx78, align 1
  %idxprom79 = zext i8 %17 to i64
  %arrayidx80 = getelementptr inbounds [56 x i8], [56 x i8]* %pcr, i64 0, i64 %idxprom79
  %18 = load i8, i8* %arrayidx80, align 1
  %tobool81 = icmp ne i8 %18, 0
  %in.86 = and i1 %cond.fold8330, %tobool81
  %arrayidx84 = getelementptr inbounds [24 x i64], [24 x i64]* @bigbyte, i64 0, i64 %indvars.iv55
  %19 = load i64, i64* %arrayidx84, align 8
  %20 = or i1 %idx1.safe102, %in.86
  %ctsel104 = select i1 %20, i64* %arrayidx22, i64* %shadow
  %21 = load i64, i64* %ctsel104, align 8
  %or = select i1 %in.86, i64 %19, i64 0
  %select.val. = or i64 %or, %21
  store i64 %select.val., i64* %ctsel104, align 8
  %22 = add nuw nsw i64 %indvars.iv55, 24
  %arrayidx90 = getelementptr inbounds [48 x i8], [48 x i8]* @pc2, i64 0, i64 %22
  %23 = load i8, i8* %arrayidx90, align 1
  %idxprom91 = zext i8 %23 to i64
  %arrayidx92 = getelementptr inbounds [56 x i8], [56 x i8]* %pcr, i64 0, i64 %idxprom91
  %24 = load i8, i8* %arrayidx92, align 1
  %tobool93 = icmp ne i8 %24, 0
  %in.91 = and i1 %cond.fold8330, %tobool93
  %25 = or i1 %idx1.safe111, %in.91
  %ctsel113 = select i1 %25, i64* %arrayidx20, i64* %shadow
  %26 = load i64, i64* %ctsel113, align 8
  %or99 = select i1 %in.91, i64 %19, i64 0
  %select.val.117 = or i64 %or99, %26
  store i64 %select.val.117, i64* %ctsel113, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond59.not = icmp eq i64 %indvars.iv.next56, 24
  br i1 %exitcond59.not, label %for.end103, label %for.body76, !llvm.loop !10

for.end103:                                       ; preds = %for.body76
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %inc105 = add nuw nsw i32 %i.0.rewritten42, 1
  %exitcond63.not = icmp eq i64 %indvars.iv.next61, 16
  br i1 %exitcond63.not, label %for.end106, label %for.body14, !llvm.loop !11

for.end106:                                       ; preds = %for.end103
  %arraydecay = getelementptr inbounds [32 x i64], [32 x i64]* %kn, i64 0, i64 0
  %arraydecay.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay.wrapped, i64 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay, i64** %arraydecay.unwrapped, align 8
  call void @cookey(%i64ptr.wrapped.ty* nonnull %arraydecay.wrapped)
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @cookey(%i64ptr.wrapped.ty* nocapture noundef readonly %raw1) local_unnamed_addr #0 {
entry:
  %arraydecay21.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %raw1, i64 0, i32 0
  %raw1.unwrapped = load i64*, i64** %0, align 8
  %dough = alloca [32 x i64], align 16
  %arraydecay = getelementptr inbounds [32 x i64], [32 x i64]* %dough, i64 0, i64 0
  %scevgep = getelementptr inbounds [32 x i64], [32 x i64]* %dough, i64 1, i64 0
  %scevgep8 = getelementptr i64, i64* %raw1.unwrapped, i64 32
  %1 = bitcast i64* %scevgep8 to [32 x i64]*
  %bound0 = icmp ult [32 x i64]* %dough, %1
  %bound1 = icmp ult i64* %raw1.unwrapped, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body, label %vector.body

vector.body:                                      ; preds = %entry, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %entry ]
  %2 = shl i64 %index, 1
  %next.gep = getelementptr i64, i64* %raw1.unwrapped, i64 %2
  %3 = shl i64 %index, 1
  %next.gep14 = getelementptr [32 x i64], [32 x i64]* %dough, i64 0, i64 %3
  %4 = bitcast i64* %next.gep to <4 x i64>*
  %wide.vec = load <4 x i64>, <4 x i64>* %4, align 8
  %strided.vec = shufflevector <4 x i64> %wide.vec, <4 x i64> poison, <2 x i32> <i32 0, i32 2>
  %strided.vec15 = shufflevector <4 x i64> %wide.vec, <4 x i64> poison, <2 x i32> <i32 1, i32 3>
  %5 = shl <2 x i64> %strided.vec, <i64 6, i64 6>
  %6 = and <2 x i64> %5, <i64 1056964608, i64 1056964608>
  %7 = shl <2 x i64> %strided.vec, <i64 10, i64 10>
  %8 = and <2 x i64> %7, <i64 4128768, i64 4128768>
  %9 = or <2 x i64> %8, %6
  %10 = lshr <2 x i64> %strided.vec15, <i64 10, i64 10>
  %11 = and <2 x i64> %10, <i64 16128, i64 16128>
  %12 = or <2 x i64> %11, %9
  %13 = lshr <2 x i64> %strided.vec15, <i64 6, i64 6>
  %14 = and <2 x i64> %13, <i64 63, i64 63>
  %15 = or <2 x i64> %14, %12
  %16 = bitcast i64* %next.gep to <4 x i64>*
  %wide.vec16 = load <4 x i64>, <4 x i64>* %16, align 8
  %strided.vec17 = shufflevector <4 x i64> %wide.vec16, <4 x i64> poison, <2 x i32> <i32 0, i32 2>
  %strided.vec18 = shufflevector <4 x i64> %wide.vec16, <4 x i64> poison, <2 x i32> <i32 1, i32 3>
  %17 = shl <2 x i64> %strided.vec17, <i64 12, i64 12>
  %18 = and <2 x i64> %17, <i64 1056964608, i64 1056964608>
  %19 = shl <2 x i64> %strided.vec17, <i64 16, i64 16>
  %20 = and <2 x i64> %19, <i64 4128768, i64 4128768>
  %21 = or <2 x i64> %20, %18
  %22 = lshr <2 x i64> %strided.vec18, <i64 4, i64 4>
  %23 = and <2 x i64> %22, <i64 16128, i64 16128>
  %24 = or <2 x i64> %23, %21
  %25 = and <2 x i64> %strided.vec18, <i64 63, i64 63>
  %26 = or <2 x i64> %24, %25
  %27 = bitcast i64* %next.gep14 to <4 x i64>*
  %interleaved.vec = shufflevector <2 x i64> %15, <2 x i64> %26, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x i64> %interleaved.vec, <4 x i64>* %27, align 16
  %index.next = add nuw i64 %index, 2
  %28 = icmp eq i64 %index.next, 16
  br i1 %28, label %for.end, label %vector.body, !llvm.loop !12

for.body:                                         ; preds = %entry, %for.body
  %raw1.addr.0.rewritten4 = phi i64* [ %incdec.ptr20, %for.body ], [ %raw1.unwrapped, %entry ]
  %cook.0.rewritten3 = phi i64* [ %incdec.ptr18, %for.body ], [ %arraydecay, %entry ]
  %i.0.rewritten2 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %incdec.ptr = getelementptr inbounds i64, i64* %raw1.addr.0.rewritten4, i64 1
  %29 = load i64, i64* %raw1.addr.0.rewritten4, align 8
  %and = shl i64 %29, 6
  %shl = and i64 %and, 1056964608
  %and1 = shl i64 %29, 10
  %shl2 = and i64 %and1, 4128768
  %or = or i64 %shl2, %shl
  %30 = load i64, i64* %incdec.ptr, align 8
  %and3 = lshr i64 %30, 10
  %shr = and i64 %and3, 16128
  %or4 = or i64 %shr, %or
  %and5 = lshr i64 %30, 6
  %shr6 = and i64 %and5, 63
  %incdec.ptr7 = getelementptr inbounds i64, i64* %cook.0.rewritten3, i64 1
  %or8 = or i64 %shr6, %or4
  store i64 %or8, i64* %cook.0.rewritten3, align 8
  %31 = load i64, i64* %raw1.addr.0.rewritten4, align 8
  %and9 = shl i64 %31, 12
  %shl10 = and i64 %and9, 1056964608
  %and11 = shl i64 %31, 16
  %shl12 = and i64 %and11, 4128768
  %or13 = or i64 %shl12, %shl10
  %32 = load i64, i64* %incdec.ptr, align 8
  %and14 = lshr i64 %32, 4
  %shr15 = and i64 %and14, 16128
  %or16 = or i64 %shr15, %or13
  %and17 = and i64 %32, 63
  %incdec.ptr18 = getelementptr inbounds i64, i64* %cook.0.rewritten3, i64 2
  %or19 = or i64 %or16, %and17
  store i64 %or19, i64* %incdec.ptr7, align 8
  %inc = add nuw nsw i32 %i.0.rewritten2, 1
  %incdec.ptr20 = getelementptr inbounds i64, i64* %raw1.addr.0.rewritten4, i64 2
  %exitcond.not = icmp eq i32 %inc, 16
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !14

for.end:                                          ; preds = %vector.body, %for.body
  %arraydecay21.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i64 0, i32 0
  %arraydecay21.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay21.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay, i64** %arraydecay21.unwrapped, align 8
  call void @usekey(%i64ptr.wrapped.ty* nonnull %arraydecay21.wrapped)
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @usekey(%i64ptr.wrapped.ty* nocapture noundef readonly %from) local_unnamed_addr #0 {
entry:
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %from, i64 0, i32 0
  %from.unwrapped = load i64*, i64** %0, align 8
  %umax9 = call i64 @llvm.umax.i64(i64 add (i64 ptrtoint ([32 x i64]* @KnL to i64), i64 256), i64 add (i64 ptrtoint ([32 x i64]* @KnL to i64), i64 8))
  %1 = add i64 %umax9, xor (i64 ptrtoint ([32 x i64]* @KnL to i64), i64 -1)
  %2 = lshr i64 %1, 3
  %3 = add nuw nsw i64 %2, 1
  %min.iters.check = icmp eq i64 %1, 7
  br i1 %min.iters.check, label %while.body.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %entry
  %umax = call i64 @llvm.umax.i64(i64 add (i64 ptrtoint ([32 x i64]* @KnL to i64), i64 256), i64 add (i64 ptrtoint ([32 x i64]* @KnL to i64), i64 8))
  %4 = add i64 %umax, xor (i64 ptrtoint ([32 x i64]* @KnL to i64), i64 -1)
  %5 = lshr i64 %4, 3
  %6 = add nuw nsw i64 %5, 1
  %scevgep = getelementptr [32 x i64], [32 x i64]* @KnL, i64 0, i64 %6
  %scevgep7 = getelementptr i64, i64* %from.unwrapped, i64 %6
  %bound0 = icmp ugt i64* %scevgep7, getelementptr inbounds ([32 x i64], [32 x i64]* @KnL, i64 0, i64 0)
  %bound1 = icmp ult i64* %from.unwrapped, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %while.body.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %3, 4611686018427387902
  %ind.end = getelementptr i64, i64* %from.unwrapped, i64 %n.vec
  %ind.end11 = getelementptr [32 x i64], [32 x i64]* @KnL, i64 0, i64 %n.vec
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %next.gep = getelementptr i64, i64* %from.unwrapped, i64 %index
  %next.gep12 = getelementptr [32 x i64], [32 x i64]* @KnL, i64 0, i64 %index
  %7 = bitcast i64* %next.gep to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %7, align 8, !alias.scope !15
  %8 = bitcast i64* %next.gep12 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %8, align 16, !alias.scope !18, !noalias !15
  %index.next = add nuw i64 %index, 2
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %3, %n.vec
  br i1 %cmp.n, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %vector.memcheck, %entry, %middle.block
  %from.addr.0.rewritten3.ph = phi i64* [ %from.unwrapped, %vector.memcheck ], [ %from.unwrapped, %entry ], [ %ind.end, %middle.block ]
  %to.0.rewritten2.ph = phi i64* [ getelementptr inbounds ([32 x i64], [32 x i64]* @KnL, i64 0, i64 0), %vector.memcheck ], [ getelementptr inbounds ([32 x i64], [32 x i64]* @KnL, i64 0, i64 0), %entry ], [ %ind.end11, %middle.block ]
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %from.addr.0.rewritten3 = phi i64* [ %incdec.ptr, %while.body ], [ %from.addr.0.rewritten3.ph, %while.body.preheader ]
  %to.0.rewritten2 = phi i64* [ %incdec.ptr1, %while.body ], [ %to.0.rewritten2.ph, %while.body.preheader ]
  %incdec.ptr = getelementptr inbounds i64, i64* %from.addr.0.rewritten3, i64 1
  %10 = load i64, i64* %from.addr.0.rewritten3, align 8
  %incdec.ptr1 = getelementptr inbounds i64, i64* %to.0.rewritten2, i64 1
  store i64 %10, i64* %to.0.rewritten2, align 8
  %cmp = icmp ult i64* %incdec.ptr1, getelementptr inbounds ([32 x i64], [32 x i64]* @KnL, i64 1, i64 0)
  br i1 %cmp, label %while.body, label %while.end, !llvm.loop !21

while.end:                                        ; preds = %while.body, %middle.block
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @cpkey(%i64ptr.wrapped.ty* nocapture noundef readonly %into) local_unnamed_addr #0 {
entry:
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %into, i64 0, i32 0
  %into.unwrapped = load i64*, i64** %0, align 8
  %umax9 = call i64 @llvm.umax.i64(i64 add (i64 ptrtoint ([32 x i64]* @KnL to i64), i64 256), i64 add (i64 ptrtoint ([32 x i64]* @KnL to i64), i64 8))
  %1 = add i64 %umax9, xor (i64 ptrtoint ([32 x i64]* @KnL to i64), i64 -1)
  %2 = lshr i64 %1, 3
  %3 = add nuw nsw i64 %2, 1
  %min.iters.check = icmp eq i64 %1, 7
  br i1 %min.iters.check, label %while.body.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %entry
  %umax = call i64 @llvm.umax.i64(i64 add (i64 ptrtoint ([32 x i64]* @KnL to i64), i64 256), i64 add (i64 ptrtoint ([32 x i64]* @KnL to i64), i64 8))
  %4 = add i64 %umax, xor (i64 ptrtoint ([32 x i64]* @KnL to i64), i64 -1)
  %5 = lshr i64 %4, 3
  %6 = add nuw nsw i64 %5, 1
  %scevgep = getelementptr i64, i64* %into.unwrapped, i64 %6
  %scevgep7 = getelementptr [32 x i64], [32 x i64]* @KnL, i64 0, i64 %6
  %bound0 = icmp ult i64* %into.unwrapped, %scevgep7
  %bound1 = icmp ugt i64* %scevgep, getelementptr inbounds ([32 x i64], [32 x i64]* @KnL, i64 0, i64 0)
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %while.body.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %3, 4611686018427387902
  %ind.end = getelementptr i64, i64* %into.unwrapped, i64 %n.vec
  %ind.end11 = getelementptr [32 x i64], [32 x i64]* @KnL, i64 0, i64 %n.vec
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %next.gep = getelementptr i64, i64* %into.unwrapped, i64 %index
  %next.gep12 = getelementptr [32 x i64], [32 x i64]* @KnL, i64 0, i64 %index
  %7 = bitcast i64* %next.gep12 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %7, align 16, !alias.scope !22
  %8 = bitcast i64* %next.gep to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %8, align 8, !alias.scope !25, !noalias !22
  %index.next = add nuw i64 %index, 2
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !27

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %3, %n.vec
  br i1 %cmp.n, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %vector.memcheck, %entry, %middle.block
  %into.addr.0.rewritten3.ph = phi i64* [ %into.unwrapped, %vector.memcheck ], [ %into.unwrapped, %entry ], [ %ind.end, %middle.block ]
  %from.0.rewritten2.ph = phi i64* [ getelementptr inbounds ([32 x i64], [32 x i64]* @KnL, i64 0, i64 0), %vector.memcheck ], [ getelementptr inbounds ([32 x i64], [32 x i64]* @KnL, i64 0, i64 0), %entry ], [ %ind.end11, %middle.block ]
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %into.addr.0.rewritten3 = phi i64* [ %incdec.ptr1, %while.body ], [ %into.addr.0.rewritten3.ph, %while.body.preheader ]
  %from.0.rewritten2 = phi i64* [ %incdec.ptr, %while.body ], [ %from.0.rewritten2.ph, %while.body.preheader ]
  %incdec.ptr = getelementptr inbounds i64, i64* %from.0.rewritten2, i64 1
  %10 = load i64, i64* %from.0.rewritten2, align 8
  %incdec.ptr1 = getelementptr inbounds i64, i64* %into.addr.0.rewritten3, i64 1
  store i64 %10, i64* %into.addr.0.rewritten3, align 8
  %cmp = icmp ult i64* %incdec.ptr, getelementptr inbounds ([32 x i64], [32 x i64]* @KnL, i64 1, i64 0)
  br i1 %cmp, label %while.body, label %while.end, !llvm.loop !28

while.end:                                        ; preds = %while.body, %middle.block
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define dso_local void @scrunch(%i8ptr.wrapped.ty* nocapture noundef readonly %outof, %i64ptr.wrapped.ty* nocapture noundef readonly %into) local_unnamed_addr #1 {
entry:
  %0 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %outof, i64 0, i32 0
  %outof.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %into, i64 0, i32 0
  %into.unwrapped = load i64*, i64** %1, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %outof.unwrapped, i64 1
  %2 = load i8, i8* %outof.unwrapped, align 1
  %conv = zext i8 %2 to i64
  %shl = shl nuw nsw i64 %conv, 24
  store i64 %shl, i64* %into.unwrapped, align 8
  %incdec.ptr1 = getelementptr inbounds i8, i8* %outof.unwrapped, i64 2
  %3 = load i8, i8* %incdec.ptr, align 1
  %conv2 = zext i8 %3 to i64
  %shl4 = shl nuw nsw i64 %conv2, 16
  %or = or i64 %shl4, %shl
  store i64 %or, i64* %into.unwrapped, align 8
  %incdec.ptr5 = getelementptr inbounds i8, i8* %outof.unwrapped, i64 3
  %4 = load i8, i8* %incdec.ptr1, align 1
  %conv6 = zext i8 %4 to i64
  %shl8 = shl nuw nsw i64 %conv6, 8
  %or9 = or i64 %shl8, %or
  store i64 %or9, i64* %into.unwrapped, align 8
  %incdec.ptr10 = getelementptr inbounds i8, i8* %outof.unwrapped, i64 4
  %5 = load i8, i8* %incdec.ptr5, align 1
  %conv11 = zext i8 %5 to i64
  %incdec.ptr13 = getelementptr inbounds i64, i64* %into.unwrapped, i64 1
  %or14 = or i64 %or9, %conv11
  store i64 %or14, i64* %into.unwrapped, align 8
  %incdec.ptr15 = getelementptr inbounds i8, i8* %outof.unwrapped, i64 5
  %6 = load i8, i8* %incdec.ptr10, align 1
  %conv16 = zext i8 %6 to i64
  %shl18 = shl nuw nsw i64 %conv16, 24
  store i64 %shl18, i64* %incdec.ptr13, align 8
  %incdec.ptr19 = getelementptr inbounds i8, i8* %outof.unwrapped, i64 6
  %7 = load i8, i8* %incdec.ptr15, align 1
  %conv20 = zext i8 %7 to i64
  %shl22 = shl nuw nsw i64 %conv20, 16
  %or23 = or i64 %shl22, %shl18
  store i64 %or23, i64* %incdec.ptr13, align 8
  %incdec.ptr24 = getelementptr inbounds i8, i8* %outof.unwrapped, i64 7
  %8 = load i8, i8* %incdec.ptr19, align 1
  %conv25 = zext i8 %8 to i64
  %shl27 = shl nuw nsw i64 %conv25, 8
  %or28 = or i64 %shl27, %or23
  store i64 %or28, i64* %incdec.ptr13, align 8
  %9 = load i8, i8* %incdec.ptr24, align 1
  %conv29 = zext i8 %9 to i64
  %or31 = or i64 %or28, %conv29
  store i64 %or31, i64* %incdec.ptr13, align 8
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn
define dso_local void @unscrun(%i64ptr.wrapped.ty* nocapture noundef readonly %outof, %i8ptr.wrapped.ty* nocapture noundef readonly %into) local_unnamed_addr #1 {
entry:
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %outof, i64 0, i32 0
  %outof.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %into, i64 0, i32 0
  %into.unwrapped = load i8*, i8** %1, align 8
  %2 = load i64, i64* %outof.unwrapped, align 8
  %shr = lshr i64 %2, 24
  %conv = trunc i64 %shr to i8
  %incdec.ptr = getelementptr inbounds i8, i8* %into.unwrapped, i64 1
  store i8 %conv, i8* %into.unwrapped, align 1
  %3 = load i64, i64* %outof.unwrapped, align 8
  %shr1 = lshr i64 %3, 16
  %conv3 = trunc i64 %shr1 to i8
  %incdec.ptr4 = getelementptr inbounds i8, i8* %into.unwrapped, i64 2
  store i8 %conv3, i8* %incdec.ptr, align 1
  %4 = load i64, i64* %outof.unwrapped, align 8
  %shr5 = lshr i64 %4, 8
  %conv7 = trunc i64 %shr5 to i8
  %incdec.ptr8 = getelementptr inbounds i8, i8* %into.unwrapped, i64 3
  store i8 %conv7, i8* %incdec.ptr4, align 1
  %incdec.ptr9 = getelementptr inbounds i64, i64* %outof.unwrapped, i64 1
  %5 = load i64, i64* %outof.unwrapped, align 8
  %conv11 = trunc i64 %5 to i8
  %incdec.ptr12 = getelementptr inbounds i8, i8* %into.unwrapped, i64 4
  store i8 %conv11, i8* %incdec.ptr8, align 1
  %6 = load i64, i64* %incdec.ptr9, align 8
  %shr13 = lshr i64 %6, 24
  %conv15 = trunc i64 %shr13 to i8
  %incdec.ptr16 = getelementptr inbounds i8, i8* %into.unwrapped, i64 5
  store i8 %conv15, i8* %incdec.ptr12, align 1
  %7 = load i64, i64* %incdec.ptr9, align 8
  %shr17 = lshr i64 %7, 16
  %conv19 = trunc i64 %shr17 to i8
  %incdec.ptr20 = getelementptr inbounds i8, i8* %into.unwrapped, i64 6
  store i8 %conv19, i8* %incdec.ptr16, align 1
  %8 = load i64, i64* %incdec.ptr9, align 8
  %shr21 = lshr i64 %8, 8
  %conv23 = trunc i64 %shr21 to i8
  %incdec.ptr24 = getelementptr inbounds i8, i8* %into.unwrapped, i64 7
  store i8 %conv23, i8* %incdec.ptr20, align 1
  %9 = load i64, i64* %incdec.ptr9, align 8
  %conv26 = trunc i64 %9 to i8
  store i8 %conv26, i8* %incdec.ptr24, align 1
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong uwtable
define dso_local void @desfunc(%i64ptr.wrapped.ty* nocapture noundef readonly %keys, %i64ptr.wrapped.ty* nocapture noundef readonly %block) local_unnamed_addr #0 {
entry:
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %keys, i64 0, i32 0
  %keys.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %block, i64 0, i32 0
  %block.unwrapped = load i64*, i64** %1, align 8
  %2 = load i64, i64* %block.unwrapped, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %block.unwrapped, i64 1
  %3 = load i64, i64* %arrayidx1, align 8
  %shr = lshr i64 %2, 4
  %xor = xor i64 %shr, %3
  %and = and i64 %xor, 252645135
  %xor2 = xor i64 %and, %3
  %shl = shl nuw nsw i64 %and, 4
  %xor3 = xor i64 %shl, %2
  %shr4 = lshr i64 %xor3, 16
  %xor5 = xor i64 %shr4, %xor2
  %and6 = and i64 %xor5, 65535
  %xor7 = xor i64 %and6, %xor2
  %shl8 = shl nuw nsw i64 %and6, 16
  %xor9 = xor i64 %shl8, %xor3
  %shr10 = lshr i64 %xor7, 2
  %xor11 = xor i64 %shr10, %xor9
  %and12 = and i64 %xor11, 858993459
  %xor13 = xor i64 %and12, %xor9
  %shl14 = shl nuw nsw i64 %and12, 2
  %xor15 = xor i64 %shl14, %xor7
  %shr16 = lshr i64 %xor15, 8
  %xor17 = xor i64 %shr16, %xor13
  %and18 = and i64 %xor17, 16711935
  %xor19 = xor i64 %and18, %xor13
  %shl20 = shl nuw nsw i64 %and18, 8
  %xor21 = xor i64 %shl20, %xor15
  %shl22 = shl i64 %xor21, 1
  %shr23 = lshr i64 %xor21, 31
  %and24 = and i64 %shr23, 1
  %shl22.masked = and i64 %shl22, 4294967294
  %and25 = or i64 %shl22.masked, %and24
  %xor26 = xor i64 %shl22, %xor19
  %and27 = and i64 %xor26, 2863311530
  %xor28 = xor i64 %and27, %xor19
  %xor29 = xor i64 %and25, %and27
  %shl30 = shl i64 %xor28, 1
  %shr31 = lshr i64 %xor28, 31
  %and32 = and i64 %shr31, 1
  %shl30.masked = and i64 %shl30, 4294967294
  %and34 = or i64 %shl30.masked, %and32
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %keys.addr.0.rewritten5 = phi i64* [ %keys.unwrapped, %entry ], [ %incdec.ptr90, %for.body ]
  %round.0.rewritten4 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %right.0.rewritten3 = phi i64 [ %xor29, %entry ], [ %xor107, %for.body ]
  %leftt.0.rewritten2 = phi i64 [ %and34, %entry ], [ %xor70, %for.body ]
  %shl35 = shl i64 %right.0.rewritten3, 28
  %shr36 = lshr i64 %right.0.rewritten3, 4
  %or37 = or i64 %shl35, %shr36
  %incdec.ptr = getelementptr inbounds i64, i64* %keys.addr.0.rewritten5, i64 1
  %4 = load i64, i64* %keys.addr.0.rewritten5, align 8
  %xor38 = xor i64 %4, %or37
  %and39 = and i64 %xor38, 63
  %arrayidx40 = getelementptr inbounds [64 x i64], [64 x i64]* @SP7, i64 0, i64 %and39
  %5 = load i64, i64* %arrayidx40, align 8
  %shr41 = lshr i64 %xor38, 8
  %and42 = and i64 %shr41, 63
  %arrayidx43 = getelementptr inbounds [64 x i64], [64 x i64]* @SP5, i64 0, i64 %and42
  %6 = load i64, i64* %arrayidx43, align 8
  %or44 = or i64 %6, %5
  %shr45 = lshr i64 %xor38, 16
  %and46 = and i64 %shr45, 63
  %arrayidx47 = getelementptr inbounds [64 x i64], [64 x i64]* @SP3, i64 0, i64 %and46
  %7 = load i64, i64* %arrayidx47, align 8
  %or48 = or i64 %or44, %7
  %shr49 = lshr i64 %xor38, 24
  %and50 = and i64 %shr49, 63
  %arrayidx51 = getelementptr inbounds [64 x i64], [64 x i64]* @SP1, i64 0, i64 %and50
  %8 = load i64, i64* %arrayidx51, align 8
  %or52 = or i64 %or48, %8
  %incdec.ptr53 = getelementptr inbounds i64, i64* %keys.addr.0.rewritten5, i64 2
  %9 = load i64, i64* %incdec.ptr, align 8
  %xor54 = xor i64 %9, %right.0.rewritten3
  %and55 = and i64 %xor54, 63
  %arrayidx56 = getelementptr inbounds [64 x i64], [64 x i64]* @SP8, i64 0, i64 %and55
  %10 = load i64, i64* %arrayidx56, align 8
  %or57 = or i64 %or52, %10
  %shr58 = lshr i64 %xor54, 8
  %and59 = and i64 %shr58, 63
  %arrayidx60 = getelementptr inbounds [64 x i64], [64 x i64]* @SP6, i64 0, i64 %and59
  %11 = load i64, i64* %arrayidx60, align 8
  %or61 = or i64 %or57, %11
  %shr62 = lshr i64 %xor54, 16
  %and63 = and i64 %shr62, 63
  %arrayidx64 = getelementptr inbounds [64 x i64], [64 x i64]* @SP4, i64 0, i64 %and63
  %12 = load i64, i64* %arrayidx64, align 8
  %or65 = or i64 %or61, %12
  %shr66 = lshr i64 %xor54, 24
  %and67 = and i64 %shr66, 63
  %arrayidx68 = getelementptr inbounds [64 x i64], [64 x i64]* @SP2, i64 0, i64 %and67
  %13 = load i64, i64* %arrayidx68, align 8
  %or69 = or i64 %or65, %13
  %xor70 = xor i64 %or69, %leftt.0.rewritten2
  %shl71 = shl i64 %xor70, 28
  %shr72 = lshr i64 %xor70, 4
  %or73 = or i64 %shl71, %shr72
  %incdec.ptr74 = getelementptr inbounds i64, i64* %keys.addr.0.rewritten5, i64 3
  %14 = load i64, i64* %incdec.ptr53, align 8
  %xor75 = xor i64 %or73, %14
  %and76 = and i64 %xor75, 63
  %arrayidx77 = getelementptr inbounds [64 x i64], [64 x i64]* @SP7, i64 0, i64 %and76
  %15 = load i64, i64* %arrayidx77, align 8
  %shr78 = lshr i64 %xor75, 8
  %and79 = and i64 %shr78, 63
  %arrayidx80 = getelementptr inbounds [64 x i64], [64 x i64]* @SP5, i64 0, i64 %and79
  %16 = load i64, i64* %arrayidx80, align 8
  %or81 = or i64 %16, %15
  %shr82 = lshr i64 %xor75, 16
  %and83 = and i64 %shr82, 63
  %arrayidx84 = getelementptr inbounds [64 x i64], [64 x i64]* @SP3, i64 0, i64 %and83
  %17 = load i64, i64* %arrayidx84, align 8
  %or85 = or i64 %or81, %17
  %shr86 = lshr i64 %xor75, 24
  %and87 = and i64 %shr86, 63
  %arrayidx88 = getelementptr inbounds [64 x i64], [64 x i64]* @SP1, i64 0, i64 %and87
  %18 = load i64, i64* %arrayidx88, align 8
  %or89 = or i64 %or85, %18
  %incdec.ptr90 = getelementptr inbounds i64, i64* %keys.addr.0.rewritten5, i64 4
  %19 = load i64, i64* %incdec.ptr74, align 8
  %xor91 = xor i64 %19, %xor70
  %and92 = and i64 %xor91, 63
  %arrayidx93 = getelementptr inbounds [64 x i64], [64 x i64]* @SP8, i64 0, i64 %and92
  %20 = load i64, i64* %arrayidx93, align 8
  %or94 = or i64 %or89, %20
  %shr95 = lshr i64 %xor91, 8
  %and96 = and i64 %shr95, 63
  %arrayidx97 = getelementptr inbounds [64 x i64], [64 x i64]* @SP6, i64 0, i64 %and96
  %21 = load i64, i64* %arrayidx97, align 8
  %or98 = or i64 %or94, %21
  %shr99 = lshr i64 %xor91, 16
  %and100 = and i64 %shr99, 63
  %arrayidx101 = getelementptr inbounds [64 x i64], [64 x i64]* @SP4, i64 0, i64 %and100
  %22 = load i64, i64* %arrayidx101, align 8
  %or102 = or i64 %or98, %22
  %shr103 = lshr i64 %xor91, 24
  %and104 = and i64 %shr103, 63
  %arrayidx105 = getelementptr inbounds [64 x i64], [64 x i64]* @SP2, i64 0, i64 %and104
  %23 = load i64, i64* %arrayidx105, align 8
  %or106 = or i64 %or102, %23
  %xor107 = xor i64 %or106, %right.0.rewritten3
  %inc = add nuw nsw i32 %round.0.rewritten4, 1
  %exitcond.not = icmp eq i32 %inc, 8
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !29

for.end:                                          ; preds = %for.body
  %shl108 = shl i64 %xor107, 31
  %shr109 = lshr i64 %xor107, 1
  %or110 = or i64 %shl108, %shr109
  %xor111 = xor i64 %or110, %xor70
  %and112 = and i64 %xor111, 2863311530
  %xor113 = xor i64 %and112, %xor70
  %xor114 = xor i64 %and112, %or110
  %shl115 = shl i64 %xor113, 31
  %shr116 = lshr i64 %xor113, 1
  %or117 = or i64 %shl115, %shr116
  %shr118 = lshr i64 %or117, 8
  %xor119 = xor i64 %shr118, %xor114
  %and120 = and i64 %xor119, 16711935
  %xor121 = xor i64 %and120, %xor114
  %shl122 = shl nuw nsw i64 %and120, 8
  %xor123 = xor i64 %shl122, %or117
  %shr124 = lshr i64 %xor123, 2
  %xor125 = xor i64 %shr124, %xor121
  %and126 = and i64 %xor125, 858993459
  %xor127 = xor i64 %and126, %xor121
  %shl128 = shl nuw nsw i64 %and126, 2
  %xor129 = xor i64 %shl128, %xor123
  %shr130 = lshr i64 %xor127, 16
  %xor131 = xor i64 %shr130, %xor129
  %and132 = and i64 %xor131, 65535
  %xor133 = xor i64 %and132, %xor129
  %shl134 = shl nuw nsw i64 %and132, 16
  %xor135 = xor i64 %shl134, %xor127
  %shr136 = lshr i64 %xor135, 4
  %xor137 = xor i64 %shr136, %xor133
  %and138 = and i64 %xor137, 252645135
  %xor139 = xor i64 %and138, %xor133
  %shl140 = shl nuw nsw i64 %and138, 4
  %xor141 = xor i64 %shl140, %xor135
  store i64 %xor141, i64* %block.unwrapped, align 8
  store i64 %xor139, i64* %arrayidx1, align 8
  ret void
}

; Function Attrs: nofree noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
entry:
  %arraydecay7.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay8.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay6.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay12.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay13.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay5.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay10.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay11.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %in_key = alloca [32 x i8], align 16
  %in = alloca [8 x i8], align 1
  %out = alloca i64, align 8
  %dc = alloca %struct.des_ctx, align 8
  %work = alloca [2 x i64], align 16
  %in_key1 = getelementptr inbounds [32 x i8], [32 x i8]* %in_key, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %in_key1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 21, i8* null)
  %in2 = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  call void @llvm.var.annotation(i8* nonnull %in2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 22, i8* null)
  %call = call i64 @read(i32 noundef 0, i8* noundef nonnull %in_key1, i64 noundef 32) #7
  %call4 = call i64 @read(i32 noundef 0, i8* noundef nonnull %in2, i64 noundef 8) #7
  store i64 0, i64* %out, align 8
  %0 = bitcast [2 x i64]* %work to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %0, i8 0, i64 16, i1 false)
  %arraydecay5.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay5.wrapped, i64 0, i32 0
  %arraydecay5.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay5.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay5.wrapped.field0.length.ptr, align 8
  store i8* %in_key1, i8** %arraydecay5.unwrapped, align 8
  call void @deskey(%i8ptr.wrapped.ty* nonnull %arraydecay5.wrapped, i16 0)
  %arraydecay6 = getelementptr inbounds %struct.des_ctx, %struct.des_ctx* %dc, i64 0, i32 0, i64 0
  %arraydecay6.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay6.wrapped, i64 0, i32 0
  %arraydecay6.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay6.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay6.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay6, i64** %arraydecay6.unwrapped, align 8
  call void @cpkey(%i64ptr.wrapped.ty* nonnull %arraydecay6.wrapped)
  %arraydecay8 = getelementptr inbounds [2 x i64], [2 x i64]* %work, i64 0, i64 0
  %arraydecay7.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay7.wrapped, i64 0, i32 0
  %arraydecay7.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay7.wrapped, i64 0, i32 1
  store i64 8, i64* %arraydecay7.wrapped.field0.length.ptr, align 8
  store i8* %in2, i8** %arraydecay7.unwrapped, align 8
  %arraydecay8.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay8.wrapped, i64 0, i32 0
  %arraydecay8.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay8.wrapped, i64 0, i32 1
  store i64 2, i64* %arraydecay8.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay8, i64** %arraydecay8.unwrapped, align 8
  call void @scrunch(%i8ptr.wrapped.ty* nonnull %arraydecay7.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay8.wrapped)
  %arraydecay10.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay10.wrapped, i64 0, i32 0
  %arraydecay10.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay10.wrapped, i64 0, i32 1
  store i64 32, i64* %arraydecay10.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay6, i64** %arraydecay10.unwrapped, align 8
  %arraydecay11.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay11.wrapped, i64 0, i32 0
  %arraydecay11.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay11.wrapped, i64 0, i32 1
  store i64 2, i64* %arraydecay11.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay8, i64** %arraydecay11.unwrapped, align 8
  call void @desfunc(%i64ptr.wrapped.ty* nonnull %arraydecay10.wrapped, %i64ptr.wrapped.ty* nonnull %arraydecay11.wrapped)
  %arraydecay13 = bitcast i64* %out to i8*
  %arraydecay12.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i64 0, i32 0
  %arraydecay12.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay12.wrapped, i64 0, i32 1
  store i64 2, i64* %arraydecay12.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay8, i64** %arraydecay12.unwrapped, align 8
  %arraydecay13.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay13.wrapped, i64 0, i32 1
  store i64 8, i64* %arraydecay13.wrapped.field0.length.ptr, align 8
  %1 = bitcast %i8ptr.wrapped.ty* %arraydecay13.wrapped to i64**
  store i64* %out, i64** %1, align 8
  call void @unscrun(%i64ptr.wrapped.ty* nonnull %arraydecay12.wrapped, %i8ptr.wrapped.ty* nonnull %arraydecay13.wrapped)
  %call15 = call i64 @write(i32 noundef 1, i8* noundef nonnull %arraydecay13, i64 noundef 8) #7
  ret i32 0
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #3

; Function Attrs: nofree
declare noundef i64 @read(i32 noundef, i8* nocapture noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nofree
declare noundef i64 @write(i32 noundef, i8* nocapture noundef readonly, i64 noundef) local_unnamed_addr #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umax.i64(i64, i64) #6

attributes #0 = { nofree noinline norecurse nosync nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind sspstrong uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nofree "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #6 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #7 = { nounwind }

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
!12 = distinct !{!12, !7, !13}
!13 = !{!"llvm.loop.isvectorized", i32 1}
!14 = distinct !{!14, !7, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !7, !13}
!21 = distinct !{!21, !7, !13}
!22 = !{!23}
!23 = distinct !{!23, !24}
!24 = distinct !{!24, !"LVerDomain"}
!25 = !{!26}
!26 = distinct !{!26, !24}
!27 = distinct !{!27, !7, !13}
!28 = distinct !{!28, !7, !13}
!29 = distinct !{!29, !7}

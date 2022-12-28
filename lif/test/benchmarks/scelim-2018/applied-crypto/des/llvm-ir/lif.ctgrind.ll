; ModuleID = 'llvm-ir/base.ctgrind.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%i8ptr.wrapped.ty = type { i8*, i64 }
%i64ptr.wrapped.ty = type { i64*, i64 }
%struct.des_ctx = type { [32 x i64], [32 x i64] }

@KnL = dso_local global [32 x i64] zeroinitializer, align 16
@KnR = dso_local global [32 x i64] zeroinitializer, align 16
@Kn3 = dso_local global [32 x i64] zeroinitializer, align 16
@Df_Key = dso_local global [24 x i8] c"\01#Eg\89\AB\CD\EF\FE\DC\BA\98vT2\10\89\AB\CD\EF\01#Eg", align 16
@bytebit = dso_local global [8 x i16] [i16 128, i16 64, i16 32, i16 16, i16 8, i16 4, i16 2, i16 1], align 16
@bigbyte = dso_local global [24 x i64] [i64 8388608, i64 4194304, i64 2097152, i64 1048576, i64 524288, i64 262144, i64 131072, i64 65536, i64 32768, i64 16384, i64 8192, i64 4096, i64 2048, i64 1024, i64 512, i64 256, i64 128, i64 64, i64 32, i64 16, i64 8, i64 4, i64 2, i64 1], align 16
@pc1 = dso_local global [56 x i8] c"80( \18\10\08\0091)!\19\11\09\01:2*\22\1A\12\0A\02;3+#>6.&\1E\16\0E\06=5-%\1D\15\0D\05<4,$\1C\14\0C\04\1B\13\0B\03", align 16
@totrot = dso_local global [16 x i8] c"\01\02\04\06\08\0A\0C\0E\0F\11\13\15\17\19\1B\1C", align 16
@pc2 = dso_local global [48 x i8] c"\0D\10\0A\17\00\04\02\1B\0E\05\14\09\16\12\0B\03\19\07\0F\06\1A\13\0C\01(3\1E$.6\1D'2, /+0&7!4-)1#\1C\1F", align 16
@SP1 = dso_local global [64 x i64] [i64 16843776, i64 0, i64 65536, i64 16843780, i64 16842756, i64 66564, i64 4, i64 65536, i64 1024, i64 16843776, i64 16843780, i64 1024, i64 16778244, i64 16842756, i64 16777216, i64 4, i64 1028, i64 16778240, i64 16778240, i64 66560, i64 66560, i64 16842752, i64 16842752, i64 16778244, i64 65540, i64 16777220, i64 16777220, i64 65540, i64 0, i64 1028, i64 66564, i64 16777216, i64 65536, i64 16843780, i64 4, i64 16842752, i64 16843776, i64 16777216, i64 16777216, i64 1024, i64 16842756, i64 65536, i64 66560, i64 16777220, i64 1024, i64 4, i64 16778244, i64 66564, i64 16843780, i64 65540, i64 16842752, i64 16778244, i64 16777220, i64 1028, i64 66564, i64 16843776, i64 1028, i64 16778240, i64 16778240, i64 0, i64 65540, i64 66560, i64 0, i64 16842756], align 16
@SP2 = dso_local global [64 x i64] [i64 2148565024, i64 2147516416, i64 32768, i64 1081376, i64 1048576, i64 32, i64 2148532256, i64 2147516448, i64 2147483680, i64 2148565024, i64 2148564992, i64 2147483648, i64 2147516416, i64 1048576, i64 32, i64 2148532256, i64 1081344, i64 1048608, i64 2147516448, i64 0, i64 2147483648, i64 32768, i64 1081376, i64 2148532224, i64 1048608, i64 2147483680, i64 0, i64 1081344, i64 32800, i64 2148564992, i64 2148532224, i64 32800, i64 0, i64 1081376, i64 2148532256, i64 1048576, i64 2147516448, i64 2148532224, i64 2148564992, i64 32768, i64 2148532224, i64 2147516416, i64 32, i64 2148565024, i64 1081376, i64 32, i64 32768, i64 2147483648, i64 32800, i64 2148564992, i64 1048576, i64 2147483680, i64 1048608, i64 2147516448, i64 2147483680, i64 1048608, i64 1081344, i64 0, i64 2147516416, i64 32800, i64 2147483648, i64 2148532256, i64 2148565024, i64 1081344], align 16
@SP3 = dso_local global [64 x i64] [i64 520, i64 134349312, i64 0, i64 134348808, i64 134218240, i64 0, i64 131592, i64 134218240, i64 131080, i64 134217736, i64 134217736, i64 131072, i64 134349320, i64 131080, i64 134348800, i64 520, i64 134217728, i64 8, i64 134349312, i64 512, i64 131584, i64 134348800, i64 134348808, i64 131592, i64 134218248, i64 131584, i64 131072, i64 134218248, i64 8, i64 134349320, i64 512, i64 134217728, i64 134349312, i64 134217728, i64 131080, i64 520, i64 131072, i64 134349312, i64 134218240, i64 0, i64 512, i64 131080, i64 134349320, i64 134218240, i64 134217736, i64 512, i64 0, i64 134348808, i64 134218248, i64 131072, i64 134217728, i64 134349320, i64 8, i64 131592, i64 131584, i64 134217736, i64 134348800, i64 134218248, i64 520, i64 134348800, i64 131592, i64 8, i64 134348808, i64 131584], align 16
@SP4 = dso_local global [64 x i64] [i64 8396801, i64 8321, i64 8321, i64 128, i64 8396928, i64 8388737, i64 8388609, i64 8193, i64 0, i64 8396800, i64 8396800, i64 8396929, i64 129, i64 0, i64 8388736, i64 8388609, i64 1, i64 8192, i64 8388608, i64 8396801, i64 128, i64 8388608, i64 8193, i64 8320, i64 8388737, i64 1, i64 8320, i64 8388736, i64 8192, i64 8396928, i64 8396929, i64 129, i64 8388736, i64 8388609, i64 8396800, i64 8396929, i64 129, i64 0, i64 0, i64 8396800, i64 8320, i64 8388736, i64 8388737, i64 1, i64 8396801, i64 8321, i64 8321, i64 128, i64 8396929, i64 129, i64 1, i64 8192, i64 8388609, i64 8193, i64 8396928, i64 8388737, i64 8193, i64 8320, i64 8388608, i64 8396801, i64 128, i64 8388608, i64 8192, i64 8396928], align 16
@SP5 = dso_local global [64 x i64] [i64 256, i64 34078976, i64 34078720, i64 1107296512, i64 524288, i64 256, i64 1073741824, i64 34078720, i64 1074266368, i64 524288, i64 33554688, i64 1074266368, i64 1107296512, i64 1107820544, i64 524544, i64 1073741824, i64 33554432, i64 1074266112, i64 1074266112, i64 0, i64 1073742080, i64 1107820800, i64 1107820800, i64 33554688, i64 1107820544, i64 1073742080, i64 0, i64 1107296256, i64 34078976, i64 33554432, i64 1107296256, i64 524544, i64 524288, i64 1107296512, i64 256, i64 33554432, i64 1073741824, i64 34078720, i64 1107296512, i64 1074266368, i64 33554688, i64 1073741824, i64 1107820544, i64 34078976, i64 1074266368, i64 256, i64 33554432, i64 1107820544, i64 1107820800, i64 524544, i64 1107296256, i64 1107820800, i64 34078720, i64 0, i64 1074266112, i64 1107296256, i64 524544, i64 33554688, i64 1073742080, i64 524288, i64 0, i64 1074266112, i64 34078976, i64 1073742080], align 16
@SP6 = dso_local global [64 x i64] [i64 536870928, i64 541065216, i64 16384, i64 541081616, i64 541065216, i64 16, i64 541081616, i64 4194304, i64 536887296, i64 4210704, i64 4194304, i64 536870928, i64 4194320, i64 536887296, i64 536870912, i64 16400, i64 0, i64 4194320, i64 536887312, i64 16384, i64 4210688, i64 536887312, i64 16, i64 541065232, i64 541065232, i64 0, i64 4210704, i64 541081600, i64 16400, i64 4210688, i64 541081600, i64 536870912, i64 536887296, i64 16, i64 541065232, i64 4210688, i64 541081616, i64 4194304, i64 16400, i64 536870928, i64 4194304, i64 536887296, i64 536870912, i64 16400, i64 536870928, i64 541081616, i64 4210688, i64 541065216, i64 4210704, i64 541081600, i64 0, i64 541065232, i64 16, i64 16384, i64 541065216, i64 4210704, i64 16384, i64 4194320, i64 536887312, i64 0, i64 541081600, i64 536870912, i64 4194320, i64 536887312], align 16
@SP7 = dso_local global [64 x i64] [i64 2097152, i64 69206018, i64 67110914, i64 0, i64 2048, i64 67110914, i64 2099202, i64 69208064, i64 69208066, i64 2097152, i64 0, i64 67108866, i64 2, i64 67108864, i64 69206018, i64 2050, i64 67110912, i64 2099202, i64 2097154, i64 67110912, i64 67108866, i64 69206016, i64 69208064, i64 2097154, i64 69206016, i64 2048, i64 2050, i64 69208066, i64 2099200, i64 2, i64 67108864, i64 2099200, i64 67108864, i64 2099200, i64 2097152, i64 67110914, i64 67110914, i64 69206018, i64 69206018, i64 2, i64 2097154, i64 67108864, i64 67110912, i64 2097152, i64 69208064, i64 2050, i64 2099202, i64 69208064, i64 2050, i64 67108866, i64 69208066, i64 69206016, i64 2099200, i64 0, i64 2, i64 69208066, i64 0, i64 2099202, i64 69206016, i64 2048, i64 67108866, i64 67110912, i64 2048, i64 2097154], align 16
@SP8 = dso_local global [64 x i64] [i64 268439616, i64 4096, i64 262144, i64 268701760, i64 268435456, i64 268439616, i64 64, i64 268435456, i64 262208, i64 268697600, i64 268701760, i64 266240, i64 268701696, i64 266304, i64 4096, i64 64, i64 268697600, i64 268435520, i64 268439552, i64 4160, i64 266240, i64 262208, i64 268697664, i64 268701696, i64 4160, i64 0, i64 0, i64 268697664, i64 268435520, i64 268439552, i64 266304, i64 262144, i64 266304, i64 262144, i64 268701696, i64 4096, i64 64, i64 268697664, i64 4096, i64 266304, i64 268439552, i64 64, i64 268435520, i64 268697600, i64 268697664, i64 268435456, i64 262144, i64 268439616, i64 0, i64 268701760, i64 262208, i64 268435520, i64 268697600, i64 268439552, i64 268439616, i64 0, i64 268701760, i64 266240, i64 266240, i64 4160, i64 4160, i64 262208, i64 268435456, i64 268701696], align 16
@.str = private unnamed_addr constant [7 x i8] c"secret\00", section "llvm.metadata"
@.str.1 = private unnamed_addr constant [11 x i8] c"src/main.c\00", section "llvm.metadata"

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @deskey(%i8ptr.wrapped.ty* noundef %key, i16 noundef signext %edf) #0 {
entry:
  %key.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %key, i32 0, i32 1
  %key.field0.length = load i64, i64* %key.field0.length.ptr, align 8
  %arraydecay.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
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
  %out.30 = alloca i1, align 1
  store i1 false, i1* %out.30, align 1
  %out.31 = alloca i1, align 1
  store i1 false, i1* %out.31, align 1
  %out.32 = alloca i1, align 1
  store i1 false, i1* %out.32, align 1
  %out.33 = alloca i1, align 1
  store i1 false, i1* %out.33, align 1
  %out.34 = alloca i1, align 1
  store i1 false, i1* %out.34, align 1
  %out.35 = alloca i1, align 1
  store i1 false, i1* %out.35, align 1
  %out.36 = alloca i1, align 1
  store i1 false, i1* %out.36, align 1
  %out.37 = alloca i1, align 1
  store i1 false, i1* %out.37, align 1
  %out.38 = alloca i1, align 1
  store i1 false, i1* %out.38, align 1
  %out.39 = alloca i1, align 1
  store i1 false, i1* %out.39, align 1
  %out.40 = alloca i1, align 1
  store i1 false, i1* %out.40, align 1
  %out.41 = alloca i1, align 1
  store i1 false, i1* %out.41, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.11, align 1
  store i1 false, i1* %out.23, align 1
  store i1 false, i1* %out.30, align 1
  store i1 false, i1* %out.38, align 1
  store i1 false, i1* %out.40, align 1
  %0 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %key, i32 0, i32 0
  %key.unwrapped = load i8*, i8** %0, align 8
  %pc1m = alloca [56 x i8], align 16
  %pcr = alloca [56 x i8], align 16
  %kn = alloca [32 x i64], align 16
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %j.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %1 = load i1, i1* %out.11, align 1
  %2 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %2
  %cond.fold = or i1 %fwcond.and.fwtaken, %1
  store i1 %cond.fold, i1* %out.9, align 1
  %cmp = icmp slt i32 %j.0.rewritten, 56
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i1, i1* %out.9, align 1
  %in. = and i1 %3, %cmp
  %cond.fold42 = or i1 false, %in.
  store i1 %cond.fold42, i1* %out.10, align 1
  %idxprom = sext i32 %j.0.rewritten to i64
  %arrayidx = getelementptr inbounds [56 x i8], [56 x i8]* @pc1, i64 0, i64 %idxprom
  %4 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %4 to i32
  %and = and i32 %conv, 7
  %shr = ashr i32 %conv, 3
  %idxprom1 = sext i32 %shr to i64
  %arrayidx2 = getelementptr inbounds i8, i8* %key.unwrapped, i64 %idxprom1
  %5 = load i8, i8* %arrayidx2, align 1
  %conv3 = zext i8 %5 to i32
  %idxprom4 = sext i32 %and to i64
  %arrayidx5 = getelementptr inbounds [8 x i16], [8 x i16]* @bytebit, i64 0, i64 %idxprom4
  %6 = load i16, i16* %arrayidx5, align 2
  %conv6 = zext i16 %6 to i32
  %and7 = and i32 %conv3, %conv6
  %tobool = icmp ne i32 %and7, 0
  %7 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i32 1, i32 0
  %conv8 = trunc i32 %cond to i8
  %idxprom9 = sext i32 %j.0.rewritten to i64
  %arrayidx10 = getelementptr inbounds [56 x i8], [56 x i8]* %pc1m, i64 0, i64 %idxprom9
  store i8 %conv8, i8* %arrayidx10, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i1, i1* %out.10, align 1
  %cond.fold43 = or i1 false, %8
  store i1 %cond.fold43, i1* %out.11, align 1
  %inc = add nsw i32 %j.0.rewritten, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %9 = load i1, i1* %out.9, align 1
  %10 = xor i1 %cmp, true
  %in.44 = and i1 %9, %10
  %cond.fold45 = or i1 false, %in.44
  store i1 %cond.fold45, i1* %out.12, align 1
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc104, %for.end
  %i.0.rewritten = phi i32 [ 0, %for.end ], [ %inc105, %for.inc104 ]
  %fwedge.taken1.rewritten = phi i1 [ true, %for.end ], [ false, %for.inc104 ]
  %exitpred.frozen2.rewritten = phi i1 [ %cmp12, %for.inc104 ], [ false, %for.end ]
  %11 = load i1, i1* %out.40, align 1
  %12 = load i1, i1* %out.12, align 1
  %fwcond.and.fwtaken46 = and i1 %fwedge.taken1.rewritten, %12
  %cond.fold47 = or i1 %fwcond.and.fwtaken46, %11
  store i1 %cond.fold47, i1* %out.13, align 1
  %cmp12 = icmp slt i32 %i.0.rewritten, 16
  br i1 %cmp12, label %for.body14, label %for.end106

for.body14:                                       ; preds = %for.cond11
  %13 = load i1, i1* %out.13, align 1
  %in.48 = and i1 %13, %cmp12
  %cond.fold49 = or i1 false, %in.48
  store i1 %cond.fold49, i1* %out.14, align 1
  %conv15 = sext i16 %edf to i32
  %cmp16 = icmp eq i32 %conv15, 1
  br i1 %cmp16, label %if.then, label %if.else

if.then:                                          ; preds = %for.body14
  %14 = load i1, i1* %out.14, align 1
  %in.50 = and i1 %14, %cmp16
  %cond.fold51 = or i1 false, %in.50
  store i1 %cond.fold51, i1* %out.15, align 1
  %sub = sub nsw i32 15, %i.0.rewritten
  %shl = shl i32 %sub, 1
  br label %if.end

if.else:                                          ; preds = %for.body14
  %15 = load i1, i1* %out.14, align 1
  %16 = xor i1 %cmp16, true
  %in.52 = and i1 %15, %16
  %cond.fold53 = or i1 false, %in.52
  store i1 %cond.fold53, i1* %out.16, align 1
  %shl18 = shl i32 %i.0.rewritten, 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %m.0.rewritten = phi i32 [ %shl, %if.then ], [ %shl18, %if.else ]
  %17 = load i1, i1* %out.16, align 1
  %18 = load i1, i1* %out.15, align 1
  %cond.fold54 = or i1 false, %18
  %cond.fold55 = or i1 %cond.fold54, %17
  store i1 %cond.fold55, i1* %out.17, align 1
  %add = add nsw i32 %m.0.rewritten, 1
  %idxprom19 = sext i32 %add to i64
  %arrayidx20 = getelementptr inbounds [32 x i64], [32 x i64]* %kn, i64 0, i64 %idxprom19
  store i64 0, i64* %arrayidx20, align 8
  %idxprom21 = sext i32 %m.0.rewritten to i64
  %arrayidx22 = getelementptr inbounds [32 x i64], [32 x i64]* %kn, i64 0, i64 %idxprom21
  store i64 0, i64* %arrayidx22, align 8
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc45, %if.end
  %j.1.rewritten = phi i32 [ 0, %if.end ], [ %inc46, %for.inc45 ]
  %fwedge.taken3.rewritten = phi i1 [ true, %if.end ], [ false, %for.inc45 ]
  %exitpred.frozen4.rewritten = phi i1 [ %cmp24, %for.inc45 ], [ false, %if.end ]
  %19 = load i1, i1* %out.23, align 1
  %20 = load i1, i1* %out.17, align 1
  %fwcond.and.fwtaken56 = and i1 %fwedge.taken3.rewritten, %20
  %cond.fold57 = or i1 %fwcond.and.fwtaken56, %19
  store i1 %cond.fold57, i1* %out.18, align 1
  %cmp24 = icmp slt i32 %j.1.rewritten, 28
  br i1 %cmp24, label %for.body26, label %for.end47

for.body26:                                       ; preds = %for.cond23
  %21 = load i1, i1* %out.18, align 1
  %in.58 = and i1 %21, %cmp24
  %cond.fold59 = or i1 false, %in.58
  store i1 %cond.fold59, i1* %out.19, align 1
  %idxprom27 = sext i32 %i.0.rewritten to i64
  %arrayidx28 = getelementptr inbounds [16 x i8], [16 x i8]* @totrot, i64 0, i64 %idxprom27
  %22 = load i8, i8* %arrayidx28, align 1
  %conv29 = zext i8 %22 to i32
  %add30 = add nsw i32 %j.1.rewritten, %conv29
  %cmp31 = icmp slt i32 %add30, 28
  br i1 %cmp31, label %if.then33, label %if.else38

if.then33:                                        ; preds = %for.body26
  %23 = load i1, i1* %out.19, align 1
  %in.60 = and i1 %23, %cmp31
  %cond.fold61 = or i1 false, %in.60
  store i1 %cond.fold61, i1* %out.20, align 1
  %idxprom34 = sext i32 %add30 to i64
  %arrayidx35 = getelementptr inbounds [56 x i8], [56 x i8]* %pc1m, i64 0, i64 %idxprom34
  %24 = load i8, i8* %arrayidx35, align 1
  %idxprom36 = sext i32 %j.1.rewritten to i64
  %arrayidx37 = getelementptr inbounds [56 x i8], [56 x i8]* %pcr, i64 0, i64 %idxprom36
  store i8 %24, i8* %arrayidx37, align 1
  br label %if.end44

if.else38:                                        ; preds = %for.body26
  %25 = load i1, i1* %out.19, align 1
  %26 = xor i1 %cmp31, true
  %in.62 = and i1 %25, %26
  %cond.fold63 = or i1 false, %in.62
  store i1 %cond.fold63, i1* %out.21, align 1
  %sub39 = sub nsw i32 %add30, 28
  %idxprom40 = sext i32 %sub39 to i64
  %arrayidx41 = getelementptr inbounds [56 x i8], [56 x i8]* %pc1m, i64 0, i64 %idxprom40
  %27 = load i8, i8* %arrayidx41, align 1
  %idxprom42 = sext i32 %j.1.rewritten to i64
  %arrayidx43 = getelementptr inbounds [56 x i8], [56 x i8]* %pcr, i64 0, i64 %idxprom42
  store i8 %27, i8* %arrayidx43, align 1
  br label %if.end44

if.end44:                                         ; preds = %if.else38, %if.then33
  %28 = load i1, i1* %out.21, align 1
  %29 = load i1, i1* %out.20, align 1
  %cond.fold64 = or i1 false, %28
  %cond.fold65 = or i1 %cond.fold64, %29
  store i1 %cond.fold65, i1* %out.22, align 1
  br label %for.inc45

for.inc45:                                        ; preds = %if.end44
  %30 = load i1, i1* %out.22, align 1
  %cond.fold66 = or i1 false, %30
  store i1 %cond.fold66, i1* %out.23, align 1
  %inc46 = add nsw i32 %j.1.rewritten, 1
  br label %for.cond23, !llvm.loop !8

for.end47:                                        ; preds = %for.cond23
  %31 = load i1, i1* %out.18, align 1
  %32 = xor i1 %cmp24, true
  %in.67 = and i1 %31, %32
  %cond.fold68 = or i1 false, %in.67
  store i1 %cond.fold68, i1* %out.24, align 1
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc70, %for.end47
  %j.2.rewritten = phi i32 [ 28, %for.end47 ], [ %inc71, %for.inc70 ]
  %fwedge.taken5.rewritten = phi i1 [ true, %for.end47 ], [ false, %for.inc70 ]
  %exitpred.frozen6.rewritten = phi i1 [ %cmp49, %for.inc70 ], [ false, %for.end47 ]
  %33 = load i1, i1* %out.30, align 1
  %34 = load i1, i1* %out.24, align 1
  %fwcond.and.fwtaken69 = and i1 %fwedge.taken5.rewritten, %34
  %cond.fold70 = or i1 %fwcond.and.fwtaken69, %33
  store i1 %cond.fold70, i1* %out.25, align 1
  %cmp49 = icmp slt i32 %j.2.rewritten, 56
  br i1 %cmp49, label %for.body51, label %for.end72

for.body51:                                       ; preds = %for.cond48
  %35 = load i1, i1* %out.25, align 1
  %in.71 = and i1 %35, %cmp49
  %cond.fold72 = or i1 false, %in.71
  store i1 %cond.fold72, i1* %out.26, align 1
  %idxprom52 = sext i32 %i.0.rewritten to i64
  %arrayidx53 = getelementptr inbounds [16 x i8], [16 x i8]* @totrot, i64 0, i64 %idxprom52
  %36 = load i8, i8* %arrayidx53, align 1
  %conv54 = zext i8 %36 to i32
  %add55 = add nsw i32 %j.2.rewritten, %conv54
  %cmp56 = icmp slt i32 %add55, 56
  br i1 %cmp56, label %if.then58, label %if.else63

if.then58:                                        ; preds = %for.body51
  %37 = load i1, i1* %out.26, align 1
  %in.73 = and i1 %37, %cmp56
  %cond.fold74 = or i1 false, %in.73
  store i1 %cond.fold74, i1* %out.27, align 1
  %idxprom59 = sext i32 %add55 to i64
  %arrayidx60 = getelementptr inbounds [56 x i8], [56 x i8]* %pc1m, i64 0, i64 %idxprom59
  %38 = load i8, i8* %arrayidx60, align 1
  %idxprom61 = sext i32 %j.2.rewritten to i64
  %arrayidx62 = getelementptr inbounds [56 x i8], [56 x i8]* %pcr, i64 0, i64 %idxprom61
  store i8 %38, i8* %arrayidx62, align 1
  br label %if.end69

if.else63:                                        ; preds = %for.body51
  %39 = load i1, i1* %out.26, align 1
  %40 = xor i1 %cmp56, true
  %in.75 = and i1 %39, %40
  %cond.fold76 = or i1 false, %in.75
  store i1 %cond.fold76, i1* %out.28, align 1
  %sub64 = sub nsw i32 %add55, 28
  %idxprom65 = sext i32 %sub64 to i64
  %arrayidx66 = getelementptr inbounds [56 x i8], [56 x i8]* %pc1m, i64 0, i64 %idxprom65
  %41 = load i8, i8* %arrayidx66, align 1
  %idxprom67 = sext i32 %j.2.rewritten to i64
  %arrayidx68 = getelementptr inbounds [56 x i8], [56 x i8]* %pcr, i64 0, i64 %idxprom67
  store i8 %41, i8* %arrayidx68, align 1
  br label %if.end69

if.end69:                                         ; preds = %if.else63, %if.then58
  %42 = load i1, i1* %out.28, align 1
  %43 = load i1, i1* %out.27, align 1
  %cond.fold77 = or i1 false, %43
  %cond.fold78 = or i1 %cond.fold77, %42
  store i1 %cond.fold78, i1* %out.29, align 1
  br label %for.inc70

for.inc70:                                        ; preds = %if.end69
  %44 = load i1, i1* %out.29, align 1
  %cond.fold79 = or i1 false, %44
  store i1 %cond.fold79, i1* %out.30, align 1
  %inc71 = add nsw i32 %j.2.rewritten, 1
  br label %for.cond48, !llvm.loop !9

for.end72:                                        ; preds = %for.cond48
  %45 = load i1, i1* %out.25, align 1
  %46 = xor i1 %cmp49, true
  %in.80 = and i1 %45, %46
  %cond.fold81 = or i1 false, %in.80
  store i1 %cond.fold81, i1* %out.31, align 1
  br label %for.cond73

for.cond73:                                       ; preds = %for.inc101, %for.end72
  %j.3.rewritten = phi i32 [ 0, %for.end72 ], [ %inc102, %for.inc101 ]
  %fwedge.taken7.rewritten = phi i1 [ true, %for.end72 ], [ false, %for.inc101 ]
  %exitpred.frozen8.rewritten = phi i1 [ %cmp74, %for.inc101 ], [ false, %for.end72 ]
  %47 = load i1, i1* %out.38, align 1
  %48 = load i1, i1* %out.31, align 1
  %fwcond.and.fwtaken82 = and i1 %fwedge.taken7.rewritten, %48
  %cond.fold83 = or i1 %fwcond.and.fwtaken82, %47
  store i1 %cond.fold83, i1* %out.32, align 1
  %cmp74 = icmp slt i32 %j.3.rewritten, 24
  br i1 %cmp74, label %for.body76, label %for.end103

for.body76:                                       ; preds = %for.cond73
  %49 = load i1, i1* %out.32, align 1
  %in.84 = and i1 %49, %cmp74
  %cond.fold85 = or i1 false, %in.84
  store i1 %cond.fold85, i1* %out.33, align 1
  %idxprom77 = sext i32 %j.3.rewritten to i64
  %arrayidx78 = getelementptr inbounds [48 x i8], [48 x i8]* @pc2, i64 0, i64 %idxprom77
  %50 = load i8, i8* %arrayidx78, align 1
  %idxprom79 = zext i8 %50 to i64
  %arrayidx80 = getelementptr inbounds [56 x i8], [56 x i8]* %pcr, i64 0, i64 %idxprom79
  %51 = load i8, i8* %arrayidx80, align 1
  %tobool81 = icmp ne i8 %51, 0
  br label %if.then82

if.then82:                                        ; preds = %for.body76
  %52 = load i1, i1* %out.33, align 1
  %in.86 = and i1 %52, %tobool81
  %cond.fold87 = or i1 false, %in.86
  store i1 %cond.fold87, i1* %out.34, align 1
  %53 = load i1, i1* %out.34, align 1
  %idxprom83 = sext i32 %j.3.rewritten to i64
  %arrayidx84 = getelementptr inbounds [24 x i64], [24 x i64]* @bigbyte, i64 0, i64 %idxprom83
  %idx1.safe = icmp slt i64 %idxprom83, 24
  %access.safe = and i1 true, %idx1.safe
  %54 = or i1 %53, %access.safe
  %55 = bitcast i64* %shadow to i64*
  %ctsel = select i1 %54, i64* %arrayidx84, i64* %55
  %56 = load i64, i64* %ctsel, align 8
  %idxprom85 = sext i32 %m.0.rewritten to i64
  %arrayidx86 = getelementptr inbounds [32 x i64], [32 x i64]* %kn, i64 0, i64 %idxprom85
  %idx1.safe102 = icmp slt i64 %idxprom85, 32
  %access.safe103 = and i1 true, %idx1.safe102
  %57 = or i1 %53, %access.safe103
  %58 = bitcast i64* %shadow to i64*
  %ctsel104 = select i1 %57, i64* %arrayidx86, i64* %58
  %59 = load i64, i64* %ctsel104, align 8
  %or = or i64 %59, %56
  %idx1.safe105 = icmp slt i64 %idxprom85, 32
  %access.safe106 = and i1 true, %idx1.safe105
  %60 = or i1 %53, %access.safe106
  %61 = bitcast i64* %shadow to i64*
  %ctsel107 = select i1 %60, i64* %arrayidx86, i64* %61
  %62 = load i64, i64* %ctsel107, align 8
  %select.val. = select i1 %53, i64 %or, i64 %62
  store i64 %select.val., i64* %ctsel107, align 8
  br label %if.end87

if.end87:                                         ; preds = %if.then82
  %63 = load i1, i1* %out.34, align 1
  %64 = load i1, i1* %out.33, align 1
  %65 = xor i1 %tobool81, true
  %in.88 = and i1 %64, %65
  %cond.fold89 = or i1 false, %63
  %cond.fold90 = or i1 %cond.fold89, %in.88
  store i1 %cond.fold90, i1* %out.35, align 1
  %add88 = add nsw i32 %j.3.rewritten, 24
  %idxprom89 = sext i32 %add88 to i64
  %arrayidx90 = getelementptr inbounds [48 x i8], [48 x i8]* @pc2, i64 0, i64 %idxprom89
  %66 = load i8, i8* %arrayidx90, align 1
  %idxprom91 = zext i8 %66 to i64
  %arrayidx92 = getelementptr inbounds [56 x i8], [56 x i8]* %pcr, i64 0, i64 %idxprom91
  %67 = load i8, i8* %arrayidx92, align 1
  %tobool93 = icmp ne i8 %67, 0
  br label %if.then94

if.then94:                                        ; preds = %if.end87
  %68 = load i1, i1* %out.35, align 1
  %in.91 = and i1 %68, %tobool93
  %cond.fold92 = or i1 false, %in.91
  store i1 %cond.fold92, i1* %out.36, align 1
  %69 = load i1, i1* %out.36, align 1
  %idxprom95 = sext i32 %j.3.rewritten to i64
  %arrayidx96 = getelementptr inbounds [24 x i64], [24 x i64]* @bigbyte, i64 0, i64 %idxprom95
  %idx1.safe108 = icmp slt i64 %idxprom95, 24
  %access.safe109 = and i1 true, %idx1.safe108
  %70 = or i1 %69, %access.safe109
  %71 = bitcast i64* %shadow to i64*
  %ctsel110 = select i1 %70, i64* %arrayidx96, i64* %71
  %72 = load i64, i64* %ctsel110, align 8
  %idxprom97 = sext i32 %add to i64
  %arrayidx98 = getelementptr inbounds [32 x i64], [32 x i64]* %kn, i64 0, i64 %idxprom97
  %idx1.safe111 = icmp slt i64 %idxprom97, 32
  %access.safe112 = and i1 true, %idx1.safe111
  %73 = or i1 %69, %access.safe112
  %74 = bitcast i64* %shadow to i64*
  %ctsel113 = select i1 %73, i64* %arrayidx98, i64* %74
  %75 = load i64, i64* %ctsel113, align 8
  %or99 = or i64 %75, %72
  %idx1.safe114 = icmp slt i64 %idxprom97, 32
  %access.safe115 = and i1 true, %idx1.safe114
  %76 = or i1 %69, %access.safe115
  %77 = bitcast i64* %shadow to i64*
  %ctsel116 = select i1 %76, i64* %arrayidx98, i64* %77
  %78 = load i64, i64* %ctsel116, align 8
  %select.val.117 = select i1 %69, i64 %or99, i64 %78
  store i64 %select.val.117, i64* %ctsel116, align 8
  br label %if.end100

if.end100:                                        ; preds = %if.then94
  %79 = load i1, i1* %out.36, align 1
  %80 = load i1, i1* %out.35, align 1
  %81 = xor i1 %tobool93, true
  %in.93 = and i1 %80, %81
  %cond.fold94 = or i1 false, %in.93
  %cond.fold95 = or i1 %cond.fold94, %79
  store i1 %cond.fold95, i1* %out.37, align 1
  br label %for.inc101

for.inc101:                                       ; preds = %if.end100
  %82 = load i1, i1* %out.37, align 1
  %cond.fold96 = or i1 false, %82
  store i1 %cond.fold96, i1* %out.38, align 1
  %inc102 = add nsw i32 %j.3.rewritten, 1
  br label %for.cond73, !llvm.loop !10

for.end103:                                       ; preds = %for.cond73
  %83 = load i1, i1* %out.32, align 1
  %84 = xor i1 %cmp74, true
  %in.97 = and i1 %83, %84
  %cond.fold98 = or i1 false, %in.97
  store i1 %cond.fold98, i1* %out.39, align 1
  br label %for.inc104

for.inc104:                                       ; preds = %for.end103
  %85 = load i1, i1* %out.39, align 1
  %cond.fold99 = or i1 false, %85
  store i1 %cond.fold99, i1* %out.40, align 1
  %inc105 = add nsw i32 %i.0.rewritten, 1
  br label %for.cond11, !llvm.loop !11

for.end106:                                       ; preds = %for.cond11
  %86 = load i1, i1* %out.13, align 1
  %87 = xor i1 %cmp12, true
  %in.100 = and i1 %86, %87
  %cond.fold101 = or i1 false, %in.100
  store i1 %cond.fold101, i1* %out.41, align 1
  %arraydecay = getelementptr inbounds [32 x i64], [32 x i64]* %kn, i64 0, i64 0
  %arraydecay.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay.wrapped, i32 0, i32 0
  %arraydecay.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay, i64** %arraydecay.unwrapped, align 8
  call void @cookey(%i64ptr.wrapped.ty* %arraydecay.wrapped)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @cookey(%i64ptr.wrapped.ty* noundef %raw1) #0 {
entry:
  %raw1.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %raw1, i32 0, i32 1
  %raw1.field0.length = load i64, i64* %raw1.field0.length.ptr, align 8
  %arraydecay21.wrapped = alloca %i64ptr.wrapped.ty, align 8
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
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.3, align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %raw1, i32 0, i32 0
  %raw1.unwrapped = load i64*, i64** %0, align 8
  %dough = alloca [32 x i64], align 16
  %arraydecay = getelementptr inbounds [32 x i64], [32 x i64]* %dough, i64 0, i64 0
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cook.0.rewritten = phi i64* [ %arraydecay, %entry ], [ %incdec.ptr18, %for.inc ]
  %raw1.addr.0.rewritten = phi i64* [ %raw1.unwrapped, %entry ], [ %incdec.ptr20, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %1 = load i1, i1* %out.3, align 1
  %2 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %2
  %cond.fold = or i1 %fwcond.and.fwtaken, %1
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp slt i32 %i.0.rewritten, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i1, i1* %out.1, align 1
  %in. = and i1 %3, %cmp
  %cond.fold5 = or i1 false, %in.
  store i1 %cond.fold5, i1* %out.2, align 1
  %incdec.ptr = getelementptr inbounds i64, i64* %raw1.addr.0.rewritten, i32 1
  %4 = load i64, i64* %raw1.addr.0.rewritten, align 8
  %and = and i64 %4, 16515072
  %shl = shl i64 %and, 6
  store i64 %shl, i64* %cook.0.rewritten, align 8
  %5 = load i64, i64* %raw1.addr.0.rewritten, align 8
  %and1 = and i64 %5, 4032
  %shl2 = shl i64 %and1, 10
  %6 = load i64, i64* %cook.0.rewritten, align 8
  %or = or i64 %6, %shl2
  store i64 %or, i64* %cook.0.rewritten, align 8
  %7 = load i64, i64* %incdec.ptr, align 8
  %and3 = and i64 %7, 16515072
  %shr = lshr i64 %and3, 10
  %8 = load i64, i64* %cook.0.rewritten, align 8
  %or4 = or i64 %8, %shr
  store i64 %or4, i64* %cook.0.rewritten, align 8
  %9 = load i64, i64* %incdec.ptr, align 8
  %and5 = and i64 %9, 4032
  %shr6 = lshr i64 %and5, 6
  %incdec.ptr7 = getelementptr inbounds i64, i64* %cook.0.rewritten, i32 1
  %10 = load i64, i64* %cook.0.rewritten, align 8
  %or8 = or i64 %10, %shr6
  store i64 %or8, i64* %cook.0.rewritten, align 8
  %11 = load i64, i64* %raw1.addr.0.rewritten, align 8
  %and9 = and i64 %11, 258048
  %shl10 = shl i64 %and9, 12
  store i64 %shl10, i64* %incdec.ptr7, align 8
  %12 = load i64, i64* %raw1.addr.0.rewritten, align 8
  %and11 = and i64 %12, 63
  %shl12 = shl i64 %and11, 16
  %13 = load i64, i64* %incdec.ptr7, align 8
  %or13 = or i64 %13, %shl12
  store i64 %or13, i64* %incdec.ptr7, align 8
  %14 = load i64, i64* %incdec.ptr, align 8
  %and14 = and i64 %14, 258048
  %shr15 = lshr i64 %and14, 4
  %15 = load i64, i64* %incdec.ptr7, align 8
  %or16 = or i64 %15, %shr15
  store i64 %or16, i64* %incdec.ptr7, align 8
  %16 = load i64, i64* %incdec.ptr, align 8
  %and17 = and i64 %16, 63
  %incdec.ptr18 = getelementptr inbounds i64, i64* %incdec.ptr7, i32 1
  %17 = load i64, i64* %incdec.ptr7, align 8
  %or19 = or i64 %17, %and17
  store i64 %or19, i64* %incdec.ptr7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i1, i1* %out.2, align 1
  %cond.fold6 = or i1 false, %18
  store i1 %cond.fold6, i1* %out.3, align 1
  %inc = add nsw i32 %i.0.rewritten, 1
  %incdec.ptr20 = getelementptr inbounds i64, i64* %incdec.ptr, i32 1
  br label %for.cond, !llvm.loop !12

for.end:                                          ; preds = %for.cond
  %19 = load i1, i1* %out.1, align 1
  %20 = xor i1 %cmp, true
  %in.7 = and i1 %19, %20
  %cond.fold8 = or i1 false, %in.7
  store i1 %cond.fold8, i1* %out.4, align 1
  %arraydecay21 = getelementptr inbounds [32 x i64], [32 x i64]* %dough, i64 0, i64 0
  %arraydecay21.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i32 0, i32 0
  %arraydecay21.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay21.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay21.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay21, i64** %arraydecay21.unwrapped, align 8
  call void @usekey(%i64ptr.wrapped.ty* %arraydecay21.wrapped)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @usekey(%i64ptr.wrapped.ty* noundef %from) #0 {
entry:
  %from.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %from, i32 0, i32 1
  %from.field0.length = load i64, i64* %from.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.1 = alloca i1, align 1
  store i1 false, i1* %out.1, align 1
  %out.2 = alloca i1, align 1
  store i1 false, i1* %out.2, align 1
  %out.3 = alloca i1, align 1
  store i1 false, i1* %out.3, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.2, align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %from, i32 0, i32 0
  %from.unwrapped = load i64*, i64** %0, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %to.0.rewritten = phi i64* [ getelementptr inbounds ([32 x i64], [32 x i64]* @KnL, i64 0, i64 0), %entry ], [ %incdec.ptr1, %while.body ]
  %from.addr.0.rewritten = phi i64* [ %from.unwrapped, %entry ], [ %incdec.ptr, %while.body ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %while.body ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %while.body ], [ false, %entry ]
  %1 = load i1, i1* %out.2, align 1
  %2 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %2
  %cond.fold = or i1 %fwcond.and.fwtaken, %1
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp ult i64* %to.0.rewritten, getelementptr inbounds ([32 x i64], [32 x i64]* @KnL, i64 1, i64 0)
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i1, i1* %out.1, align 1
  %in. = and i1 %3, %cmp
  %cond.fold4 = or i1 false, %in.
  store i1 %cond.fold4, i1* %out.2, align 1
  %incdec.ptr = getelementptr inbounds i64, i64* %from.addr.0.rewritten, i32 1
  %4 = load i64, i64* %from.addr.0.rewritten, align 8
  %incdec.ptr1 = getelementptr inbounds i64, i64* %to.0.rewritten, i32 1
  store i64 %4, i64* %to.0.rewritten, align 8
  br label %while.cond, !llvm.loop !13

while.end:                                        ; preds = %while.cond
  %5 = load i1, i1* %out.1, align 1
  %6 = xor i1 %cmp, true
  %in.5 = and i1 %5, %6
  %cond.fold6 = or i1 false, %in.5
  store i1 %cond.fold6, i1* %out.3, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @cpkey(%i64ptr.wrapped.ty* noundef %into) #0 {
entry:
  %into.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %into, i32 0, i32 1
  %into.field0.length = load i64, i64* %into.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %out.1 = alloca i1, align 1
  store i1 false, i1* %out.1, align 1
  %out.2 = alloca i1, align 1
  store i1 false, i1* %out.2, align 1
  %out.3 = alloca i1, align 1
  store i1 false, i1* %out.3, align 1
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.2, align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %into, i32 0, i32 0
  %into.unwrapped = load i64*, i64** %0, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %from.0.rewritten = phi i64* [ getelementptr inbounds ([32 x i64], [32 x i64]* @KnL, i64 0, i64 0), %entry ], [ %incdec.ptr, %while.body ]
  %into.addr.0.rewritten = phi i64* [ %into.unwrapped, %entry ], [ %incdec.ptr1, %while.body ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %while.body ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %while.body ], [ false, %entry ]
  %1 = load i1, i1* %out.2, align 1
  %2 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %2
  %cond.fold = or i1 %fwcond.and.fwtaken, %1
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp ult i64* %from.0.rewritten, getelementptr inbounds ([32 x i64], [32 x i64]* @KnL, i64 1, i64 0)
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i1, i1* %out.1, align 1
  %in. = and i1 %3, %cmp
  %cond.fold4 = or i1 false, %in.
  store i1 %cond.fold4, i1* %out.2, align 1
  %incdec.ptr = getelementptr inbounds i64, i64* %from.0.rewritten, i32 1
  %4 = load i64, i64* %from.0.rewritten, align 8
  %incdec.ptr1 = getelementptr inbounds i64, i64* %into.addr.0.rewritten, i32 1
  store i64 %4, i64* %into.addr.0.rewritten, align 8
  br label %while.cond, !llvm.loop !14

while.end:                                        ; preds = %while.cond
  %5 = load i1, i1* %out.1, align 1
  %6 = xor i1 %cmp, true
  %in.5 = and i1 %5, %6
  %cond.fold6 = or i1 false, %in.5
  store i1 %cond.fold6, i1* %out.3, align 1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @scrunch(%i8ptr.wrapped.ty* noundef %outof, %i64ptr.wrapped.ty* noundef %into) #0 {
entry:
  %outof.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %outof, i32 0, i32 1
  %outof.field0.length = load i64, i64* %outof.field0.length.ptr, align 8
  %into.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %into, i32 0, i32 1
  %into.field0.length = load i64, i64* %into.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %outof, i32 0, i32 0
  %outof.unwrapped = load i8*, i8** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %into, i32 0, i32 0
  %into.unwrapped = load i64*, i64** %1, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %outof.unwrapped, i32 1
  %2 = load i8, i8* %outof.unwrapped, align 1
  %conv = zext i8 %2 to i64
  %and = and i64 %conv, 255
  %shl = shl i64 %and, 24
  store i64 %shl, i64* %into.unwrapped, align 8
  %incdec.ptr1 = getelementptr inbounds i8, i8* %incdec.ptr, i32 1
  %3 = load i8, i8* %incdec.ptr, align 1
  %conv2 = zext i8 %3 to i64
  %and3 = and i64 %conv2, 255
  %shl4 = shl i64 %and3, 16
  %4 = load i64, i64* %into.unwrapped, align 8
  %or = or i64 %4, %shl4
  store i64 %or, i64* %into.unwrapped, align 8
  %incdec.ptr5 = getelementptr inbounds i8, i8* %incdec.ptr1, i32 1
  %5 = load i8, i8* %incdec.ptr1, align 1
  %conv6 = zext i8 %5 to i64
  %and7 = and i64 %conv6, 255
  %shl8 = shl i64 %and7, 8
  %6 = load i64, i64* %into.unwrapped, align 8
  %or9 = or i64 %6, %shl8
  store i64 %or9, i64* %into.unwrapped, align 8
  %incdec.ptr10 = getelementptr inbounds i8, i8* %incdec.ptr5, i32 1
  %7 = load i8, i8* %incdec.ptr5, align 1
  %conv11 = zext i8 %7 to i64
  %and12 = and i64 %conv11, 255
  %incdec.ptr13 = getelementptr inbounds i64, i64* %into.unwrapped, i32 1
  %8 = load i64, i64* %into.unwrapped, align 8
  %or14 = or i64 %8, %and12
  store i64 %or14, i64* %into.unwrapped, align 8
  %incdec.ptr15 = getelementptr inbounds i8, i8* %incdec.ptr10, i32 1
  %9 = load i8, i8* %incdec.ptr10, align 1
  %conv16 = zext i8 %9 to i64
  %and17 = and i64 %conv16, 255
  %shl18 = shl i64 %and17, 24
  store i64 %shl18, i64* %incdec.ptr13, align 8
  %incdec.ptr19 = getelementptr inbounds i8, i8* %incdec.ptr15, i32 1
  %10 = load i8, i8* %incdec.ptr15, align 1
  %conv20 = zext i8 %10 to i64
  %and21 = and i64 %conv20, 255
  %shl22 = shl i64 %and21, 16
  %11 = load i64, i64* %incdec.ptr13, align 8
  %or23 = or i64 %11, %shl22
  store i64 %or23, i64* %incdec.ptr13, align 8
  %incdec.ptr24 = getelementptr inbounds i8, i8* %incdec.ptr19, i32 1
  %12 = load i8, i8* %incdec.ptr19, align 1
  %conv25 = zext i8 %12 to i64
  %and26 = and i64 %conv25, 255
  %shl27 = shl i64 %and26, 8
  %13 = load i64, i64* %incdec.ptr13, align 8
  %or28 = or i64 %13, %shl27
  store i64 %or28, i64* %incdec.ptr13, align 8
  %14 = load i8, i8* %incdec.ptr24, align 1
  %conv29 = zext i8 %14 to i64
  %and30 = and i64 %conv29, 255
  %15 = load i64, i64* %incdec.ptr13, align 8
  %or31 = or i64 %15, %and30
  store i64 %or31, i64* %incdec.ptr13, align 8
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @unscrun(%i64ptr.wrapped.ty* noundef %outof, %i8ptr.wrapped.ty* noundef %into) #0 {
entry:
  %outof.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %outof, i32 0, i32 1
  %outof.field0.length = load i64, i64* %outof.field0.length.ptr, align 8
  %into.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %into, i32 0, i32 1
  %into.field0.length = load i64, i64* %into.field0.length.ptr, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  store i1 true, i1* %out., align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %outof, i32 0, i32 0
  %outof.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %into, i32 0, i32 0
  %into.unwrapped = load i8*, i8** %1, align 8
  %2 = load i64, i64* %outof.unwrapped, align 8
  %shr = lshr i64 %2, 24
  %and = and i64 %shr, 255
  %conv = trunc i64 %and to i8
  %incdec.ptr = getelementptr inbounds i8, i8* %into.unwrapped, i32 1
  store i8 %conv, i8* %into.unwrapped, align 1
  %3 = load i64, i64* %outof.unwrapped, align 8
  %shr1 = lshr i64 %3, 16
  %and2 = and i64 %shr1, 255
  %conv3 = trunc i64 %and2 to i8
  %incdec.ptr4 = getelementptr inbounds i8, i8* %incdec.ptr, i32 1
  store i8 %conv3, i8* %incdec.ptr, align 1
  %4 = load i64, i64* %outof.unwrapped, align 8
  %shr5 = lshr i64 %4, 8
  %and6 = and i64 %shr5, 255
  %conv7 = trunc i64 %and6 to i8
  %incdec.ptr8 = getelementptr inbounds i8, i8* %incdec.ptr4, i32 1
  store i8 %conv7, i8* %incdec.ptr4, align 1
  %incdec.ptr9 = getelementptr inbounds i64, i64* %outof.unwrapped, i32 1
  %5 = load i64, i64* %outof.unwrapped, align 8
  %and10 = and i64 %5, 255
  %conv11 = trunc i64 %and10 to i8
  %incdec.ptr12 = getelementptr inbounds i8, i8* %incdec.ptr8, i32 1
  store i8 %conv11, i8* %incdec.ptr8, align 1
  %6 = load i64, i64* %incdec.ptr9, align 8
  %shr13 = lshr i64 %6, 24
  %and14 = and i64 %shr13, 255
  %conv15 = trunc i64 %and14 to i8
  %incdec.ptr16 = getelementptr inbounds i8, i8* %incdec.ptr12, i32 1
  store i8 %conv15, i8* %incdec.ptr12, align 1
  %7 = load i64, i64* %incdec.ptr9, align 8
  %shr17 = lshr i64 %7, 16
  %and18 = and i64 %shr17, 255
  %conv19 = trunc i64 %and18 to i8
  %incdec.ptr20 = getelementptr inbounds i8, i8* %incdec.ptr16, i32 1
  store i8 %conv19, i8* %incdec.ptr16, align 1
  %8 = load i64, i64* %incdec.ptr9, align 8
  %shr21 = lshr i64 %8, 8
  %and22 = and i64 %shr21, 255
  %conv23 = trunc i64 %and22 to i8
  %incdec.ptr24 = getelementptr inbounds i8, i8* %incdec.ptr20, i32 1
  store i8 %conv23, i8* %incdec.ptr20, align 1
  %9 = load i64, i64* %incdec.ptr9, align 8
  %and25 = and i64 %9, 255
  %conv26 = trunc i64 %and25 to i8
  store i8 %conv26, i8* %incdec.ptr24, align 1
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @desfunc(%i64ptr.wrapped.ty* noundef %keys, %i64ptr.wrapped.ty* noundef %block) #0 {
entry:
  %keys.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %keys, i32 0, i32 1
  %keys.field0.length = load i64, i64* %keys.field0.length.ptr, align 8
  %block.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %block, i32 0, i32 1
  %block.field0.length = load i64, i64* %block.field0.length.ptr, align 8
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
  store i1 true, i1* %out., align 1
  store i1 false, i1* %out.3, align 1
  %0 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %keys, i32 0, i32 0
  %keys.unwrapped = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %block, i32 0, i32 0
  %block.unwrapped = load i64*, i64** %1, align 8
  %arrayidx = getelementptr inbounds i64, i64* %block.unwrapped, i64 0
  %2 = load i64, i64* %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %block.unwrapped, i64 1
  %3 = load i64, i64* %arrayidx1, align 8
  %shr = lshr i64 %2, 4
  %xor = xor i64 %shr, %3
  %and = and i64 %xor, 252645135
  %xor2 = xor i64 %3, %and
  %shl = shl i64 %and, 4
  %xor3 = xor i64 %2, %shl
  %shr4 = lshr i64 %xor3, 16
  %xor5 = xor i64 %shr4, %xor2
  %and6 = and i64 %xor5, 65535
  %xor7 = xor i64 %xor2, %and6
  %shl8 = shl i64 %and6, 16
  %xor9 = xor i64 %xor3, %shl8
  %shr10 = lshr i64 %xor7, 2
  %xor11 = xor i64 %shr10, %xor9
  %and12 = and i64 %xor11, 858993459
  %xor13 = xor i64 %xor9, %and12
  %shl14 = shl i64 %and12, 2
  %xor15 = xor i64 %xor7, %shl14
  %shr16 = lshr i64 %xor15, 8
  %xor17 = xor i64 %shr16, %xor13
  %and18 = and i64 %xor17, 16711935
  %xor19 = xor i64 %xor13, %and18
  %shl20 = shl i64 %and18, 8
  %xor21 = xor i64 %xor15, %shl20
  %shl22 = shl i64 %xor21, 1
  %shr23 = lshr i64 %xor21, 31
  %and24 = and i64 %shr23, 1
  %or = or i64 %shl22, %and24
  %and25 = and i64 %or, 4294967295
  %xor26 = xor i64 %xor19, %and25
  %and27 = and i64 %xor26, 2863311530
  %xor28 = xor i64 %xor19, %and27
  %xor29 = xor i64 %and25, %and27
  %shl30 = shl i64 %xor28, 1
  %shr31 = lshr i64 %xor28, 31
  %and32 = and i64 %shr31, 1
  %or33 = or i64 %shl30, %and32
  %and34 = and i64 %or33, 4294967295
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %leftt.0.rewritten = phi i64 [ %and34, %entry ], [ %xor70, %for.inc ]
  %right.0.rewritten = phi i64 [ %xor29, %entry ], [ %xor107, %for.inc ]
  %round.0.rewritten = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %keys.addr.0.rewritten = phi i64* [ %keys.unwrapped, %entry ], [ %incdec.ptr90, %for.inc ]
  %fwedge.taken.rewritten = phi i1 [ true, %entry ], [ false, %for.inc ]
  %exitpred.frozen.rewritten = phi i1 [ %cmp, %for.inc ], [ false, %entry ]
  %4 = load i1, i1* %out.3, align 1
  %5 = load i1, i1* %out., align 1
  %fwcond.and.fwtaken = and i1 %fwedge.taken.rewritten, %5
  %cond.fold = or i1 %fwcond.and.fwtaken, %4
  store i1 %cond.fold, i1* %out.1, align 1
  %cmp = icmp slt i32 %round.0.rewritten, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i1, i1* %out.1, align 1
  %in. = and i1 %6, %cmp
  %cond.fold5 = or i1 false, %in.
  store i1 %cond.fold5, i1* %out.2, align 1
  %shl35 = shl i64 %right.0.rewritten, 28
  %shr36 = lshr i64 %right.0.rewritten, 4
  %or37 = or i64 %shl35, %shr36
  %incdec.ptr = getelementptr inbounds i64, i64* %keys.addr.0.rewritten, i32 1
  %7 = load i64, i64* %keys.addr.0.rewritten, align 8
  %xor38 = xor i64 %or37, %7
  %and39 = and i64 %xor38, 63
  %arrayidx40 = getelementptr inbounds [64 x i64], [64 x i64]* @SP7, i64 0, i64 %and39
  %8 = load i64, i64* %arrayidx40, align 8
  %shr41 = lshr i64 %xor38, 8
  %and42 = and i64 %shr41, 63
  %arrayidx43 = getelementptr inbounds [64 x i64], [64 x i64]* @SP5, i64 0, i64 %and42
  %9 = load i64, i64* %arrayidx43, align 8
  %or44 = or i64 %8, %9
  %shr45 = lshr i64 %xor38, 16
  %and46 = and i64 %shr45, 63
  %arrayidx47 = getelementptr inbounds [64 x i64], [64 x i64]* @SP3, i64 0, i64 %and46
  %10 = load i64, i64* %arrayidx47, align 8
  %or48 = or i64 %or44, %10
  %shr49 = lshr i64 %xor38, 24
  %and50 = and i64 %shr49, 63
  %arrayidx51 = getelementptr inbounds [64 x i64], [64 x i64]* @SP1, i64 0, i64 %and50
  %11 = load i64, i64* %arrayidx51, align 8
  %or52 = or i64 %or48, %11
  %incdec.ptr53 = getelementptr inbounds i64, i64* %incdec.ptr, i32 1
  %12 = load i64, i64* %incdec.ptr, align 8
  %xor54 = xor i64 %right.0.rewritten, %12
  %and55 = and i64 %xor54, 63
  %arrayidx56 = getelementptr inbounds [64 x i64], [64 x i64]* @SP8, i64 0, i64 %and55
  %13 = load i64, i64* %arrayidx56, align 8
  %or57 = or i64 %or52, %13
  %shr58 = lshr i64 %xor54, 8
  %and59 = and i64 %shr58, 63
  %arrayidx60 = getelementptr inbounds [64 x i64], [64 x i64]* @SP6, i64 0, i64 %and59
  %14 = load i64, i64* %arrayidx60, align 8
  %or61 = or i64 %or57, %14
  %shr62 = lshr i64 %xor54, 16
  %and63 = and i64 %shr62, 63
  %arrayidx64 = getelementptr inbounds [64 x i64], [64 x i64]* @SP4, i64 0, i64 %and63
  %15 = load i64, i64* %arrayidx64, align 8
  %or65 = or i64 %or61, %15
  %shr66 = lshr i64 %xor54, 24
  %and67 = and i64 %shr66, 63
  %arrayidx68 = getelementptr inbounds [64 x i64], [64 x i64]* @SP2, i64 0, i64 %and67
  %16 = load i64, i64* %arrayidx68, align 8
  %or69 = or i64 %or65, %16
  %xor70 = xor i64 %leftt.0.rewritten, %or69
  %shl71 = shl i64 %xor70, 28
  %shr72 = lshr i64 %xor70, 4
  %or73 = or i64 %shl71, %shr72
  %incdec.ptr74 = getelementptr inbounds i64, i64* %incdec.ptr53, i32 1
  %17 = load i64, i64* %incdec.ptr53, align 8
  %xor75 = xor i64 %or73, %17
  %and76 = and i64 %xor75, 63
  %arrayidx77 = getelementptr inbounds [64 x i64], [64 x i64]* @SP7, i64 0, i64 %and76
  %18 = load i64, i64* %arrayidx77, align 8
  %shr78 = lshr i64 %xor75, 8
  %and79 = and i64 %shr78, 63
  %arrayidx80 = getelementptr inbounds [64 x i64], [64 x i64]* @SP5, i64 0, i64 %and79
  %19 = load i64, i64* %arrayidx80, align 8
  %or81 = or i64 %18, %19
  %shr82 = lshr i64 %xor75, 16
  %and83 = and i64 %shr82, 63
  %arrayidx84 = getelementptr inbounds [64 x i64], [64 x i64]* @SP3, i64 0, i64 %and83
  %20 = load i64, i64* %arrayidx84, align 8
  %or85 = or i64 %or81, %20
  %shr86 = lshr i64 %xor75, 24
  %and87 = and i64 %shr86, 63
  %arrayidx88 = getelementptr inbounds [64 x i64], [64 x i64]* @SP1, i64 0, i64 %and87
  %21 = load i64, i64* %arrayidx88, align 8
  %or89 = or i64 %or85, %21
  %incdec.ptr90 = getelementptr inbounds i64, i64* %incdec.ptr74, i32 1
  %22 = load i64, i64* %incdec.ptr74, align 8
  %xor91 = xor i64 %xor70, %22
  %and92 = and i64 %xor91, 63
  %arrayidx93 = getelementptr inbounds [64 x i64], [64 x i64]* @SP8, i64 0, i64 %and92
  %23 = load i64, i64* %arrayidx93, align 8
  %or94 = or i64 %or89, %23
  %shr95 = lshr i64 %xor91, 8
  %and96 = and i64 %shr95, 63
  %arrayidx97 = getelementptr inbounds [64 x i64], [64 x i64]* @SP6, i64 0, i64 %and96
  %24 = load i64, i64* %arrayidx97, align 8
  %or98 = or i64 %or94, %24
  %shr99 = lshr i64 %xor91, 16
  %and100 = and i64 %shr99, 63
  %arrayidx101 = getelementptr inbounds [64 x i64], [64 x i64]* @SP4, i64 0, i64 %and100
  %25 = load i64, i64* %arrayidx101, align 8
  %or102 = or i64 %or98, %25
  %shr103 = lshr i64 %xor91, 24
  %and104 = and i64 %shr103, 63
  %arrayidx105 = getelementptr inbounds [64 x i64], [64 x i64]* @SP2, i64 0, i64 %and104
  %26 = load i64, i64* %arrayidx105, align 8
  %or106 = or i64 %or102, %26
  %xor107 = xor i64 %right.0.rewritten, %or106
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %27 = load i1, i1* %out.2, align 1
  %cond.fold6 = or i1 false, %27
  store i1 %cond.fold6, i1* %out.3, align 1
  %inc = add nsw i32 %round.0.rewritten, 1
  br label %for.cond, !llvm.loop !15

for.end:                                          ; preds = %for.cond
  %leftt.0.lcssa.rewritten = phi i64 [ %leftt.0.rewritten, %for.cond ]
  %right.0.lcssa.rewritten = phi i64 [ %right.0.rewritten, %for.cond ]
  %28 = load i1, i1* %out.1, align 1
  %29 = xor i1 %cmp, true
  %in.7 = and i1 %28, %29
  %cond.fold8 = or i1 false, %in.7
  store i1 %cond.fold8, i1* %out.4, align 1
  %shl108 = shl i64 %right.0.lcssa.rewritten, 31
  %shr109 = lshr i64 %right.0.lcssa.rewritten, 1
  %or110 = or i64 %shl108, %shr109
  %xor111 = xor i64 %leftt.0.lcssa.rewritten, %or110
  %and112 = and i64 %xor111, 2863311530
  %xor113 = xor i64 %leftt.0.lcssa.rewritten, %and112
  %xor114 = xor i64 %or110, %and112
  %shl115 = shl i64 %xor113, 31
  %shr116 = lshr i64 %xor113, 1
  %or117 = or i64 %shl115, %shr116
  %shr118 = lshr i64 %or117, 8
  %xor119 = xor i64 %shr118, %xor114
  %and120 = and i64 %xor119, 16711935
  %xor121 = xor i64 %xor114, %and120
  %shl122 = shl i64 %and120, 8
  %xor123 = xor i64 %or117, %shl122
  %shr124 = lshr i64 %xor123, 2
  %xor125 = xor i64 %shr124, %xor121
  %and126 = and i64 %xor125, 858993459
  %xor127 = xor i64 %xor121, %and126
  %shl128 = shl i64 %and126, 2
  %xor129 = xor i64 %xor123, %shl128
  %shr130 = lshr i64 %xor127, 16
  %xor131 = xor i64 %shr130, %xor129
  %and132 = and i64 %xor131, 65535
  %xor133 = xor i64 %xor129, %and132
  %shl134 = shl i64 %and132, 16
  %xor135 = xor i64 %xor127, %shl134
  %shr136 = lshr i64 %xor135, 4
  %xor137 = xor i64 %shr136, %xor133
  %and138 = and i64 %xor137, 252645135
  %xor139 = xor i64 %xor133, %and138
  %shl140 = shl i64 %and138, 4
  %xor141 = xor i64 %xor135, %shl140
  %incdec.ptr142 = getelementptr inbounds i64, i64* %block.unwrapped, i32 1
  store i64 %xor141, i64* %block.unwrapped, align 8
  store i64 %xor139, i64* %incdec.ptr142, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
entry:
  %arraydecay30.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay31.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay23.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay24.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay25.wrapped = alloca %i8ptr.wrapped.ty, align 8
  %arraydecay26.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay28.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %arraydecay29.wrapped = alloca %i64ptr.wrapped.ty, align 8
  %out. = alloca i1, align 1
  store i1 false, i1* %out., align 1
  %in_key = alloca [32 x i8], align 16
  %in = alloca [8 x i8], align 1
  %_zzq_args = alloca [6 x i64], align 16
  %_zzq_result = alloca i64, align 8
  %_zzq_args12 = alloca [6 x i64], align 16
  %_zzq_result13 = alloca i64, align 8
  %out = alloca [8 x i8], align 1
  %dc = alloca %struct.des_ctx, align 8
  %work = alloca [2 x i64], align 16
  store i1 true, i1* %out., align 1
  %in_key1 = bitcast [32 x i8]* %in_key to i8*
  call void @llvm.var.annotation(i8* %in_key1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 21, i8* null)
  %in2 = bitcast [8 x i8]* %in to i8*
  call void @llvm.var.annotation(i8* %in2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 22, i8* null)
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %in_key, i64 0, i64 0
  %call = call i64 @read(i32 noundef 0, i8* noundef %arraydecay, i64 noundef 32)
  %arraydecay3 = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  %call4 = call i64 @read(i32 noundef 0, i8* noundef %arraydecay3, i64 noundef 8)
  %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx, align 16
  %arraydecay5 = getelementptr inbounds [32 x i8], [32 x i8]* %in_key, i64 0, i64 0
  %0 = ptrtoint i8* %arraydecay5 to i64
  %arrayidx6 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 1
  store volatile i64 %0, i64* %arrayidx6, align 8
  %arrayidx7 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 2
  store volatile i64 3, i64* %arrayidx7, align 16
  %arrayidx8 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx8, align 8
  %arrayidx9 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx9, align 16
  %arrayidx10 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx10, align 8
  %arrayidx11 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args, i64 0, i64 0
  %1 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx11, i64 0) #4, !srcloc !16
  store volatile i64 %1, i64* %_zzq_result, align 8
  %2 = load volatile i64, i64* %_zzq_result, align 8
  %arrayidx14 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 0
  store volatile i64 1296236545, i64* %arrayidx14, align 16
  %arraydecay15 = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  %3 = ptrtoint i8* %arraydecay15 to i64
  %arrayidx16 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 1
  store volatile i64 %3, i64* %arrayidx16, align 8
  %arrayidx17 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 2
  store volatile i64 3, i64* %arrayidx17, align 16
  %arrayidx18 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 3
  store volatile i64 0, i64* %arrayidx18, align 8
  %arrayidx19 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 4
  store volatile i64 0, i64* %arrayidx19, align 16
  %arrayidx20 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 5
  store volatile i64 0, i64* %arrayidx20, align 8
  %arrayidx21 = getelementptr inbounds [6 x i64], [6 x i64]* %_zzq_args12, i64 0, i64 0
  %4 = call i64 asm sideeffect "rolq $$3,  %rdi ; rolq $$13, %rdi\0A\09rolq $$61, %rdi ; rolq $$51, %rdi\0A\09xchgq %rbx,%rbx", "={dx},{ax},0,~{cc},~{memory},~{dirflag},~{fpsr},~{flags}"(i64* %arrayidx21, i64 0) #4, !srcloc !17
  store volatile i64 %4, i64* %_zzq_result13, align 8
  %5 = load volatile i64, i64* %_zzq_result13, align 8
  %6 = bitcast [8 x i8]* %out to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %6, i8 0, i64 8, i1 false)
  %7 = bitcast [2 x i64]* %work to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 16, i1 false)
  %arraydecay23 = getelementptr inbounds [32 x i8], [32 x i8]* %in_key, i64 0, i64 0
  %arraydecay23.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay23.wrapped, i32 0, i32 0
  %arraydecay23.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay23.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay23.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay23, i8** %arraydecay23.unwrapped, align 8
  call void @deskey(%i8ptr.wrapped.ty* %arraydecay23.wrapped, i16 0)
  %ek = getelementptr inbounds %struct.des_ctx, %struct.des_ctx* %dc, i32 0, i32 0
  %arraydecay24 = getelementptr inbounds [32 x i64], [32 x i64]* %ek, i64 0, i64 0
  %arraydecay24.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i32 0, i32 0
  %arraydecay24.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay24.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay24.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay24, i64** %arraydecay24.unwrapped, align 8
  call void @cpkey(%i64ptr.wrapped.ty* %arraydecay24.wrapped)
  %arraydecay25 = getelementptr inbounds [8 x i8], [8 x i8]* %in, i64 0, i64 0
  %arraydecay26 = getelementptr inbounds [2 x i64], [2 x i64]* %work, i64 0, i64 0
  %arraydecay25.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay25.wrapped, i32 0, i32 0
  %arraydecay25.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay25.wrapped, i32 0, i32 1
  store i64 8, i64* %arraydecay25.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay25, i8** %arraydecay25.unwrapped, align 8
  %arraydecay26.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i32 0, i32 0
  %arraydecay26.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay26.wrapped, i32 0, i32 1
  store i64 2, i64* %arraydecay26.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay26, i64** %arraydecay26.unwrapped, align 8
  call void @scrunch(%i8ptr.wrapped.ty* %arraydecay25.wrapped, %i64ptr.wrapped.ty* %arraydecay26.wrapped)
  %ek27 = getelementptr inbounds %struct.des_ctx, %struct.des_ctx* %dc, i32 0, i32 0
  %arraydecay28 = getelementptr inbounds [32 x i64], [32 x i64]* %ek27, i64 0, i64 0
  %arraydecay29 = getelementptr inbounds [2 x i64], [2 x i64]* %work, i64 0, i64 0
  %arraydecay28.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay28.wrapped, i32 0, i32 0
  %arraydecay28.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay28.wrapped, i32 0, i32 1
  store i64 32, i64* %arraydecay28.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay28, i64** %arraydecay28.unwrapped, align 8
  %arraydecay29.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay29.wrapped, i32 0, i32 0
  %arraydecay29.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay29.wrapped, i32 0, i32 1
  store i64 2, i64* %arraydecay29.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay29, i64** %arraydecay29.unwrapped, align 8
  call void @desfunc(%i64ptr.wrapped.ty* %arraydecay28.wrapped, %i64ptr.wrapped.ty* %arraydecay29.wrapped)
  %arraydecay30 = getelementptr inbounds [2 x i64], [2 x i64]* %work, i64 0, i64 0
  %arraydecay31 = getelementptr inbounds [8 x i8], [8 x i8]* %out, i64 0, i64 0
  %arraydecay30.unwrapped = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay30.wrapped, i32 0, i32 0
  %arraydecay30.wrapped.field0.length.ptr = getelementptr inbounds %i64ptr.wrapped.ty, %i64ptr.wrapped.ty* %arraydecay30.wrapped, i32 0, i32 1
  store i64 2, i64* %arraydecay30.wrapped.field0.length.ptr, align 8
  store i64* %arraydecay30, i64** %arraydecay30.unwrapped, align 8
  %arraydecay31.unwrapped = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay31.wrapped, i32 0, i32 0
  %arraydecay31.wrapped.field0.length.ptr = getelementptr inbounds %i8ptr.wrapped.ty, %i8ptr.wrapped.ty* %arraydecay31.wrapped, i32 0, i32 1
  store i64 8, i64* %arraydecay31.wrapped.field0.length.ptr, align 8
  store i8* %arraydecay31, i8** %arraydecay31.unwrapped, align 8
  call void @unscrun(%i64ptr.wrapped.ty* %arraydecay30.wrapped, %i8ptr.wrapped.ty* %arraydecay31.wrapped)
  %arraydecay32 = getelementptr inbounds [8 x i8], [8 x i8]* %out, i64 0, i64 0
  %call33 = call i64 @write(i32 noundef 1, i8* noundef %arraydecay32, i64 noundef 8)
  %shadow = alloca i64, align 8
  store i64 0, i64* %shadow, align 8
  ret i32 0
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #1

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
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
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = !{i64 2148337303, i64 2148337339, i64 2148337407}
!17 = !{i64 2148338863, i64 2148338899, i64 2148338967}

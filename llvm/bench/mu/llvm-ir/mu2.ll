; ModuleID = 'mu/llvm-ir/mu2.ll'
source_filename = "mu/sources/mu2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.a = private unnamed_addr constant [3 x i32] [i32 1, i32 3, i32 5], align 4
@.str = private unnamed_addr constant [10 x i8] c"%d\09%d\09%d\0A\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @mu(i32* %0) #0 !dbg !9 {
  %2 = alloca [3 x i32], align 4
  call void @llvm.dbg.value(metadata i32* %0, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [3 x i32]* %2, metadata !20, metadata !DIExpression()), !dbg !24
  %3 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !25
  store i32 0, i32* %3, align 4, !dbg !26
  %4 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !27
  store i32 0, i32* %4, align 4, !dbg !28
  %5 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !29
  store i32 0, i32* %5, align 4, !dbg !30
  call void @llvm.dbg.value(metadata i32 0, metadata !31, metadata !DIExpression()), !dbg !19
  %6 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !19
  %7 = load i32, i32* %6, align 4, !dbg !19
  br label %8, !dbg !32

8:                                                ; preds = %1
  call void @llvm.dbg.value(metadata i32 0, metadata !31, metadata !DIExpression()), !dbg !19
  %9 = shl i32 %7, 1, !dbg !34
  store i32 %9, i32* %6, align 4, !dbg !34
  %10 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %11 = load i32, i32* %10, align 4, !dbg !38
  %12 = shl i32 %11, 1, !dbg !38
  store i32 %12, i32* %10, align 4, !dbg !38
  %13 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %14 = load i32, i32* %13, align 4, !dbg !40
  %15 = shl i32 %14, 1, !dbg !40
  store i32 %15, i32* %13, align 4, !dbg !40
  %16 = load i32, i32* %0, align 4, !dbg !41
  %17 = and i32 %16, 1, !dbg !43
  %18 = icmp ne i32 %17, 0, !dbg !43
  br i1 %18, label %19, label %23, !dbg !44

19:                                               ; preds = %8
  %20 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %21 = load i32, i32* %20, align 4, !dbg !46
  %22 = or i32 %21, 1, !dbg !46
  store i32 %22, i32* %20, align 4, !dbg !46
  br label %23, !dbg !45

23:                                               ; preds = %19, %8
  %24 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %25 = load i32, i32* %24, align 4, !dbg !47
  %26 = and i32 %25, 1, !dbg !49
  %27 = icmp ne i32 %26, 0, !dbg !49
  br i1 %27, label %28, label %32, !dbg !50

28:                                               ; preds = %23
  %29 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %30 = load i32, i32* %29, align 4, !dbg !52
  %31 = or i32 %30, 1, !dbg !52
  store i32 %31, i32* %29, align 4, !dbg !52
  br label %32, !dbg !51

32:                                               ; preds = %28, %23
  %33 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %34 = load i32, i32* %33, align 4, !dbg !53
  %35 = and i32 %34, 1, !dbg !55
  %36 = icmp ne i32 %35, 0, !dbg !55
  br i1 %36, label %37, label %41, !dbg !56

37:                                               ; preds = %32
  %38 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %39 = load i32, i32* %38, align 4, !dbg !58
  %40 = or i32 %39, 1, !dbg !58
  store i32 %40, i32* %38, align 4, !dbg !58
  br label %41, !dbg !57

41:                                               ; preds = %37, %32
  %42 = load i32, i32* %0, align 4, !dbg !59
  %43 = ashr i32 %42, 1, !dbg !59
  store i32 %43, i32* %0, align 4, !dbg !59
  %44 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %45 = load i32, i32* %44, align 4, !dbg !61
  %46 = ashr i32 %45, 1, !dbg !61
  store i32 %46, i32* %44, align 4, !dbg !61
  %47 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %48 = load i32, i32* %47, align 4, !dbg !63
  %49 = ashr i32 %48, 1, !dbg !63
  store i32 %49, i32* %47, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 1, metadata !31, metadata !DIExpression()), !dbg !19
  %50 = load i32, i32* %6, align 4, !dbg !19
  %51 = shl i32 %50, 1, !dbg !34
  store i32 %51, i32* %6, align 4, !dbg !34
  %52 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %53 = load i32, i32* %52, align 4, !dbg !38
  %54 = shl i32 %53, 1, !dbg !38
  store i32 %54, i32* %52, align 4, !dbg !38
  %55 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %56 = load i32, i32* %55, align 4, !dbg !40
  %57 = shl i32 %56, 1, !dbg !40
  store i32 %57, i32* %55, align 4, !dbg !40
  %58 = load i32, i32* %0, align 4, !dbg !41
  %59 = and i32 %58, 1, !dbg !43
  %60 = icmp ne i32 %59, 0, !dbg !43
  br i1 %60, label %61, label %65, !dbg !44

61:                                               ; preds = %41
  %62 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %63 = load i32, i32* %62, align 4, !dbg !46
  %64 = or i32 %63, 1, !dbg !46
  store i32 %64, i32* %62, align 4, !dbg !46
  br label %65, !dbg !45

65:                                               ; preds = %61, %41
  %66 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %67 = load i32, i32* %66, align 4, !dbg !47
  %68 = and i32 %67, 1, !dbg !49
  %69 = icmp ne i32 %68, 0, !dbg !49
  br i1 %69, label %70, label %74, !dbg !50

70:                                               ; preds = %65
  %71 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %72 = load i32, i32* %71, align 4, !dbg !52
  %73 = or i32 %72, 1, !dbg !52
  store i32 %73, i32* %71, align 4, !dbg !52
  br label %74, !dbg !51

74:                                               ; preds = %70, %65
  %75 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %76 = load i32, i32* %75, align 4, !dbg !53
  %77 = and i32 %76, 1, !dbg !55
  %78 = icmp ne i32 %77, 0, !dbg !55
  br i1 %78, label %79, label %83, !dbg !56

79:                                               ; preds = %74
  %80 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %81 = load i32, i32* %80, align 4, !dbg !58
  %82 = or i32 %81, 1, !dbg !58
  store i32 %82, i32* %80, align 4, !dbg !58
  br label %83, !dbg !57

83:                                               ; preds = %79, %74
  %84 = load i32, i32* %0, align 4, !dbg !59
  %85 = ashr i32 %84, 1, !dbg !59
  store i32 %85, i32* %0, align 4, !dbg !59
  %86 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %87 = load i32, i32* %86, align 4, !dbg !61
  %88 = ashr i32 %87, 1, !dbg !61
  store i32 %88, i32* %86, align 4, !dbg !61
  %89 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %90 = load i32, i32* %89, align 4, !dbg !63
  %91 = ashr i32 %90, 1, !dbg !63
  store i32 %91, i32* %89, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 2, metadata !31, metadata !DIExpression()), !dbg !19
  %92 = load i32, i32* %6, align 4, !dbg !19
  %93 = shl i32 %92, 1, !dbg !34
  store i32 %93, i32* %6, align 4, !dbg !34
  %94 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %95 = load i32, i32* %94, align 4, !dbg !38
  %96 = shl i32 %95, 1, !dbg !38
  store i32 %96, i32* %94, align 4, !dbg !38
  %97 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %98 = load i32, i32* %97, align 4, !dbg !40
  %99 = shl i32 %98, 1, !dbg !40
  store i32 %99, i32* %97, align 4, !dbg !40
  %100 = load i32, i32* %0, align 4, !dbg !41
  %101 = and i32 %100, 1, !dbg !43
  %102 = icmp ne i32 %101, 0, !dbg !43
  br i1 %102, label %103, label %107, !dbg !44

103:                                              ; preds = %83
  %104 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %105 = load i32, i32* %104, align 4, !dbg !46
  %106 = or i32 %105, 1, !dbg !46
  store i32 %106, i32* %104, align 4, !dbg !46
  br label %107, !dbg !45

107:                                              ; preds = %103, %83
  %108 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %109 = load i32, i32* %108, align 4, !dbg !47
  %110 = and i32 %109, 1, !dbg !49
  %111 = icmp ne i32 %110, 0, !dbg !49
  br i1 %111, label %112, label %116, !dbg !50

112:                                              ; preds = %107
  %113 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %114 = load i32, i32* %113, align 4, !dbg !52
  %115 = or i32 %114, 1, !dbg !52
  store i32 %115, i32* %113, align 4, !dbg !52
  br label %116, !dbg !51

116:                                              ; preds = %112, %107
  %117 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %118 = load i32, i32* %117, align 4, !dbg !53
  %119 = and i32 %118, 1, !dbg !55
  %120 = icmp ne i32 %119, 0, !dbg !55
  br i1 %120, label %121, label %125, !dbg !56

121:                                              ; preds = %116
  %122 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %123 = load i32, i32* %122, align 4, !dbg !58
  %124 = or i32 %123, 1, !dbg !58
  store i32 %124, i32* %122, align 4, !dbg !58
  br label %125, !dbg !57

125:                                              ; preds = %121, %116
  %126 = load i32, i32* %0, align 4, !dbg !59
  %127 = ashr i32 %126, 1, !dbg !59
  store i32 %127, i32* %0, align 4, !dbg !59
  %128 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %129 = load i32, i32* %128, align 4, !dbg !61
  %130 = ashr i32 %129, 1, !dbg !61
  store i32 %130, i32* %128, align 4, !dbg !61
  %131 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %132 = load i32, i32* %131, align 4, !dbg !63
  %133 = ashr i32 %132, 1, !dbg !63
  store i32 %133, i32* %131, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 3, metadata !31, metadata !DIExpression()), !dbg !19
  %134 = load i32, i32* %6, align 4, !dbg !19
  %135 = shl i32 %134, 1, !dbg !34
  store i32 %135, i32* %6, align 4, !dbg !34
  %136 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %137 = load i32, i32* %136, align 4, !dbg !38
  %138 = shl i32 %137, 1, !dbg !38
  store i32 %138, i32* %136, align 4, !dbg !38
  %139 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %140 = load i32, i32* %139, align 4, !dbg !40
  %141 = shl i32 %140, 1, !dbg !40
  store i32 %141, i32* %139, align 4, !dbg !40
  %142 = load i32, i32* %0, align 4, !dbg !41
  %143 = and i32 %142, 1, !dbg !43
  %144 = icmp ne i32 %143, 0, !dbg !43
  br i1 %144, label %145, label %149, !dbg !44

145:                                              ; preds = %125
  %146 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %147 = load i32, i32* %146, align 4, !dbg !46
  %148 = or i32 %147, 1, !dbg !46
  store i32 %148, i32* %146, align 4, !dbg !46
  br label %149, !dbg !45

149:                                              ; preds = %145, %125
  %150 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %151 = load i32, i32* %150, align 4, !dbg !47
  %152 = and i32 %151, 1, !dbg !49
  %153 = icmp ne i32 %152, 0, !dbg !49
  br i1 %153, label %154, label %158, !dbg !50

154:                                              ; preds = %149
  %155 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %156 = load i32, i32* %155, align 4, !dbg !52
  %157 = or i32 %156, 1, !dbg !52
  store i32 %157, i32* %155, align 4, !dbg !52
  br label %158, !dbg !51

158:                                              ; preds = %154, %149
  %159 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %160 = load i32, i32* %159, align 4, !dbg !53
  %161 = and i32 %160, 1, !dbg !55
  %162 = icmp ne i32 %161, 0, !dbg !55
  br i1 %162, label %163, label %167, !dbg !56

163:                                              ; preds = %158
  %164 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %165 = load i32, i32* %164, align 4, !dbg !58
  %166 = or i32 %165, 1, !dbg !58
  store i32 %166, i32* %164, align 4, !dbg !58
  br label %167, !dbg !57

167:                                              ; preds = %163, %158
  %168 = load i32, i32* %0, align 4, !dbg !59
  %169 = ashr i32 %168, 1, !dbg !59
  store i32 %169, i32* %0, align 4, !dbg !59
  %170 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %171 = load i32, i32* %170, align 4, !dbg !61
  %172 = ashr i32 %171, 1, !dbg !61
  store i32 %172, i32* %170, align 4, !dbg !61
  %173 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %174 = load i32, i32* %173, align 4, !dbg !63
  %175 = ashr i32 %174, 1, !dbg !63
  store i32 %175, i32* %173, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 4, metadata !31, metadata !DIExpression()), !dbg !19
  %176 = load i32, i32* %6, align 4, !dbg !19
  %177 = shl i32 %176, 1, !dbg !34
  store i32 %177, i32* %6, align 4, !dbg !34
  %178 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %179 = load i32, i32* %178, align 4, !dbg !38
  %180 = shl i32 %179, 1, !dbg !38
  store i32 %180, i32* %178, align 4, !dbg !38
  %181 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %182 = load i32, i32* %181, align 4, !dbg !40
  %183 = shl i32 %182, 1, !dbg !40
  store i32 %183, i32* %181, align 4, !dbg !40
  %184 = load i32, i32* %0, align 4, !dbg !41
  %185 = and i32 %184, 1, !dbg !43
  %186 = icmp ne i32 %185, 0, !dbg !43
  br i1 %186, label %187, label %191, !dbg !44

187:                                              ; preds = %167
  %188 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %189 = load i32, i32* %188, align 4, !dbg !46
  %190 = or i32 %189, 1, !dbg !46
  store i32 %190, i32* %188, align 4, !dbg !46
  br label %191, !dbg !45

191:                                              ; preds = %187, %167
  %192 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %193 = load i32, i32* %192, align 4, !dbg !47
  %194 = and i32 %193, 1, !dbg !49
  %195 = icmp ne i32 %194, 0, !dbg !49
  br i1 %195, label %196, label %200, !dbg !50

196:                                              ; preds = %191
  %197 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %198 = load i32, i32* %197, align 4, !dbg !52
  %199 = or i32 %198, 1, !dbg !52
  store i32 %199, i32* %197, align 4, !dbg !52
  br label %200, !dbg !51

200:                                              ; preds = %196, %191
  %201 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %202 = load i32, i32* %201, align 4, !dbg !53
  %203 = and i32 %202, 1, !dbg !55
  %204 = icmp ne i32 %203, 0, !dbg !55
  br i1 %204, label %205, label %209, !dbg !56

205:                                              ; preds = %200
  %206 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %207 = load i32, i32* %206, align 4, !dbg !58
  %208 = or i32 %207, 1, !dbg !58
  store i32 %208, i32* %206, align 4, !dbg !58
  br label %209, !dbg !57

209:                                              ; preds = %205, %200
  %210 = load i32, i32* %0, align 4, !dbg !59
  %211 = ashr i32 %210, 1, !dbg !59
  store i32 %211, i32* %0, align 4, !dbg !59
  %212 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %213 = load i32, i32* %212, align 4, !dbg !61
  %214 = ashr i32 %213, 1, !dbg !61
  store i32 %214, i32* %212, align 4, !dbg !61
  %215 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %216 = load i32, i32* %215, align 4, !dbg !63
  %217 = ashr i32 %216, 1, !dbg !63
  store i32 %217, i32* %215, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 5, metadata !31, metadata !DIExpression()), !dbg !19
  %218 = load i32, i32* %6, align 4, !dbg !19
  %219 = shl i32 %218, 1, !dbg !34
  store i32 %219, i32* %6, align 4, !dbg !34
  %220 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %221 = load i32, i32* %220, align 4, !dbg !38
  %222 = shl i32 %221, 1, !dbg !38
  store i32 %222, i32* %220, align 4, !dbg !38
  %223 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %224 = load i32, i32* %223, align 4, !dbg !40
  %225 = shl i32 %224, 1, !dbg !40
  store i32 %225, i32* %223, align 4, !dbg !40
  %226 = load i32, i32* %0, align 4, !dbg !41
  %227 = and i32 %226, 1, !dbg !43
  %228 = icmp ne i32 %227, 0, !dbg !43
  br i1 %228, label %229, label %233, !dbg !44

229:                                              ; preds = %209
  %230 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %231 = load i32, i32* %230, align 4, !dbg !46
  %232 = or i32 %231, 1, !dbg !46
  store i32 %232, i32* %230, align 4, !dbg !46
  br label %233, !dbg !45

233:                                              ; preds = %229, %209
  %234 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %235 = load i32, i32* %234, align 4, !dbg !47
  %236 = and i32 %235, 1, !dbg !49
  %237 = icmp ne i32 %236, 0, !dbg !49
  br i1 %237, label %238, label %242, !dbg !50

238:                                              ; preds = %233
  %239 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %240 = load i32, i32* %239, align 4, !dbg !52
  %241 = or i32 %240, 1, !dbg !52
  store i32 %241, i32* %239, align 4, !dbg !52
  br label %242, !dbg !51

242:                                              ; preds = %238, %233
  %243 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %244 = load i32, i32* %243, align 4, !dbg !53
  %245 = and i32 %244, 1, !dbg !55
  %246 = icmp ne i32 %245, 0, !dbg !55
  br i1 %246, label %247, label %251, !dbg !56

247:                                              ; preds = %242
  %248 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %249 = load i32, i32* %248, align 4, !dbg !58
  %250 = or i32 %249, 1, !dbg !58
  store i32 %250, i32* %248, align 4, !dbg !58
  br label %251, !dbg !57

251:                                              ; preds = %247, %242
  %252 = load i32, i32* %0, align 4, !dbg !59
  %253 = ashr i32 %252, 1, !dbg !59
  store i32 %253, i32* %0, align 4, !dbg !59
  %254 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %255 = load i32, i32* %254, align 4, !dbg !61
  %256 = ashr i32 %255, 1, !dbg !61
  store i32 %256, i32* %254, align 4, !dbg !61
  %257 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %258 = load i32, i32* %257, align 4, !dbg !63
  %259 = ashr i32 %258, 1, !dbg !63
  store i32 %259, i32* %257, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 6, metadata !31, metadata !DIExpression()), !dbg !19
  %260 = load i32, i32* %6, align 4, !dbg !19
  %261 = shl i32 %260, 1, !dbg !34
  store i32 %261, i32* %6, align 4, !dbg !34
  %262 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %263 = load i32, i32* %262, align 4, !dbg !38
  %264 = shl i32 %263, 1, !dbg !38
  store i32 %264, i32* %262, align 4, !dbg !38
  %265 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %266 = load i32, i32* %265, align 4, !dbg !40
  %267 = shl i32 %266, 1, !dbg !40
  store i32 %267, i32* %265, align 4, !dbg !40
  %268 = load i32, i32* %0, align 4, !dbg !41
  %269 = and i32 %268, 1, !dbg !43
  %270 = icmp ne i32 %269, 0, !dbg !43
  br i1 %270, label %271, label %275, !dbg !44

271:                                              ; preds = %251
  %272 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %273 = load i32, i32* %272, align 4, !dbg !46
  %274 = or i32 %273, 1, !dbg !46
  store i32 %274, i32* %272, align 4, !dbg !46
  br label %275, !dbg !45

275:                                              ; preds = %271, %251
  %276 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %277 = load i32, i32* %276, align 4, !dbg !47
  %278 = and i32 %277, 1, !dbg !49
  %279 = icmp ne i32 %278, 0, !dbg !49
  br i1 %279, label %280, label %284, !dbg !50

280:                                              ; preds = %275
  %281 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %282 = load i32, i32* %281, align 4, !dbg !52
  %283 = or i32 %282, 1, !dbg !52
  store i32 %283, i32* %281, align 4, !dbg !52
  br label %284, !dbg !51

284:                                              ; preds = %280, %275
  %285 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %286 = load i32, i32* %285, align 4, !dbg !53
  %287 = and i32 %286, 1, !dbg !55
  %288 = icmp ne i32 %287, 0, !dbg !55
  br i1 %288, label %289, label %293, !dbg !56

289:                                              ; preds = %284
  %290 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %291 = load i32, i32* %290, align 4, !dbg !58
  %292 = or i32 %291, 1, !dbg !58
  store i32 %292, i32* %290, align 4, !dbg !58
  br label %293, !dbg !57

293:                                              ; preds = %289, %284
  %294 = load i32, i32* %0, align 4, !dbg !59
  %295 = ashr i32 %294, 1, !dbg !59
  store i32 %295, i32* %0, align 4, !dbg !59
  %296 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %297 = load i32, i32* %296, align 4, !dbg !61
  %298 = ashr i32 %297, 1, !dbg !61
  store i32 %298, i32* %296, align 4, !dbg !61
  %299 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %300 = load i32, i32* %299, align 4, !dbg !63
  %301 = ashr i32 %300, 1, !dbg !63
  store i32 %301, i32* %299, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 7, metadata !31, metadata !DIExpression()), !dbg !19
  %302 = load i32, i32* %6, align 4, !dbg !19
  %303 = shl i32 %302, 1, !dbg !34
  store i32 %303, i32* %6, align 4, !dbg !34
  %304 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %305 = load i32, i32* %304, align 4, !dbg !38
  %306 = shl i32 %305, 1, !dbg !38
  store i32 %306, i32* %304, align 4, !dbg !38
  %307 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %308 = load i32, i32* %307, align 4, !dbg !40
  %309 = shl i32 %308, 1, !dbg !40
  store i32 %309, i32* %307, align 4, !dbg !40
  %310 = load i32, i32* %0, align 4, !dbg !41
  %311 = and i32 %310, 1, !dbg !43
  %312 = icmp ne i32 %311, 0, !dbg !43
  br i1 %312, label %313, label %317, !dbg !44

313:                                              ; preds = %293
  %314 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %315 = load i32, i32* %314, align 4, !dbg !46
  %316 = or i32 %315, 1, !dbg !46
  store i32 %316, i32* %314, align 4, !dbg !46
  br label %317, !dbg !45

317:                                              ; preds = %313, %293
  %318 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %319 = load i32, i32* %318, align 4, !dbg !47
  %320 = and i32 %319, 1, !dbg !49
  %321 = icmp ne i32 %320, 0, !dbg !49
  br i1 %321, label %322, label %326, !dbg !50

322:                                              ; preds = %317
  %323 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %324 = load i32, i32* %323, align 4, !dbg !52
  %325 = or i32 %324, 1, !dbg !52
  store i32 %325, i32* %323, align 4, !dbg !52
  br label %326, !dbg !51

326:                                              ; preds = %322, %317
  %327 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %328 = load i32, i32* %327, align 4, !dbg !53
  %329 = and i32 %328, 1, !dbg !55
  %330 = icmp ne i32 %329, 0, !dbg !55
  br i1 %330, label %331, label %335, !dbg !56

331:                                              ; preds = %326
  %332 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %333 = load i32, i32* %332, align 4, !dbg !58
  %334 = or i32 %333, 1, !dbg !58
  store i32 %334, i32* %332, align 4, !dbg !58
  br label %335, !dbg !57

335:                                              ; preds = %331, %326
  %336 = load i32, i32* %0, align 4, !dbg !59
  %337 = ashr i32 %336, 1, !dbg !59
  store i32 %337, i32* %0, align 4, !dbg !59
  %338 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %339 = load i32, i32* %338, align 4, !dbg !61
  %340 = ashr i32 %339, 1, !dbg !61
  store i32 %340, i32* %338, align 4, !dbg !61
  %341 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %342 = load i32, i32* %341, align 4, !dbg !63
  %343 = ashr i32 %342, 1, !dbg !63
  store i32 %343, i32* %341, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 8, metadata !31, metadata !DIExpression()), !dbg !19
  %344 = load i32, i32* %6, align 4, !dbg !19
  %345 = shl i32 %344, 1, !dbg !34
  store i32 %345, i32* %6, align 4, !dbg !34
  %346 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %347 = load i32, i32* %346, align 4, !dbg !38
  %348 = shl i32 %347, 1, !dbg !38
  store i32 %348, i32* %346, align 4, !dbg !38
  %349 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %350 = load i32, i32* %349, align 4, !dbg !40
  %351 = shl i32 %350, 1, !dbg !40
  store i32 %351, i32* %349, align 4, !dbg !40
  %352 = load i32, i32* %0, align 4, !dbg !41
  %353 = and i32 %352, 1, !dbg !43
  %354 = icmp ne i32 %353, 0, !dbg !43
  br i1 %354, label %355, label %359, !dbg !44

355:                                              ; preds = %335
  %356 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %357 = load i32, i32* %356, align 4, !dbg !46
  %358 = or i32 %357, 1, !dbg !46
  store i32 %358, i32* %356, align 4, !dbg !46
  br label %359, !dbg !45

359:                                              ; preds = %355, %335
  %360 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %361 = load i32, i32* %360, align 4, !dbg !47
  %362 = and i32 %361, 1, !dbg !49
  %363 = icmp ne i32 %362, 0, !dbg !49
  br i1 %363, label %364, label %368, !dbg !50

364:                                              ; preds = %359
  %365 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %366 = load i32, i32* %365, align 4, !dbg !52
  %367 = or i32 %366, 1, !dbg !52
  store i32 %367, i32* %365, align 4, !dbg !52
  br label %368, !dbg !51

368:                                              ; preds = %364, %359
  %369 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %370 = load i32, i32* %369, align 4, !dbg !53
  %371 = and i32 %370, 1, !dbg !55
  %372 = icmp ne i32 %371, 0, !dbg !55
  br i1 %372, label %373, label %377, !dbg !56

373:                                              ; preds = %368
  %374 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %375 = load i32, i32* %374, align 4, !dbg !58
  %376 = or i32 %375, 1, !dbg !58
  store i32 %376, i32* %374, align 4, !dbg !58
  br label %377, !dbg !57

377:                                              ; preds = %373, %368
  %378 = load i32, i32* %0, align 4, !dbg !59
  %379 = ashr i32 %378, 1, !dbg !59
  store i32 %379, i32* %0, align 4, !dbg !59
  %380 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %381 = load i32, i32* %380, align 4, !dbg !61
  %382 = ashr i32 %381, 1, !dbg !61
  store i32 %382, i32* %380, align 4, !dbg !61
  %383 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %384 = load i32, i32* %383, align 4, !dbg !63
  %385 = ashr i32 %384, 1, !dbg !63
  store i32 %385, i32* %383, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 9, metadata !31, metadata !DIExpression()), !dbg !19
  %386 = load i32, i32* %6, align 4, !dbg !19
  %387 = shl i32 %386, 1, !dbg !34
  store i32 %387, i32* %6, align 4, !dbg !34
  %388 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %389 = load i32, i32* %388, align 4, !dbg !38
  %390 = shl i32 %389, 1, !dbg !38
  store i32 %390, i32* %388, align 4, !dbg !38
  %391 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %392 = load i32, i32* %391, align 4, !dbg !40
  %393 = shl i32 %392, 1, !dbg !40
  store i32 %393, i32* %391, align 4, !dbg !40
  %394 = load i32, i32* %0, align 4, !dbg !41
  %395 = and i32 %394, 1, !dbg !43
  %396 = icmp ne i32 %395, 0, !dbg !43
  br i1 %396, label %397, label %401, !dbg !44

397:                                              ; preds = %377
  %398 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %399 = load i32, i32* %398, align 4, !dbg !46
  %400 = or i32 %399, 1, !dbg !46
  store i32 %400, i32* %398, align 4, !dbg !46
  br label %401, !dbg !45

401:                                              ; preds = %397, %377
  %402 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %403 = load i32, i32* %402, align 4, !dbg !47
  %404 = and i32 %403, 1, !dbg !49
  %405 = icmp ne i32 %404, 0, !dbg !49
  br i1 %405, label %406, label %410, !dbg !50

406:                                              ; preds = %401
  %407 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %408 = load i32, i32* %407, align 4, !dbg !52
  %409 = or i32 %408, 1, !dbg !52
  store i32 %409, i32* %407, align 4, !dbg !52
  br label %410, !dbg !51

410:                                              ; preds = %406, %401
  %411 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %412 = load i32, i32* %411, align 4, !dbg !53
  %413 = and i32 %412, 1, !dbg !55
  %414 = icmp ne i32 %413, 0, !dbg !55
  br i1 %414, label %415, label %419, !dbg !56

415:                                              ; preds = %410
  %416 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %417 = load i32, i32* %416, align 4, !dbg !58
  %418 = or i32 %417, 1, !dbg !58
  store i32 %418, i32* %416, align 4, !dbg !58
  br label %419, !dbg !57

419:                                              ; preds = %415, %410
  %420 = load i32, i32* %0, align 4, !dbg !59
  %421 = ashr i32 %420, 1, !dbg !59
  store i32 %421, i32* %0, align 4, !dbg !59
  %422 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %423 = load i32, i32* %422, align 4, !dbg !61
  %424 = ashr i32 %423, 1, !dbg !61
  store i32 %424, i32* %422, align 4, !dbg !61
  %425 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %426 = load i32, i32* %425, align 4, !dbg !63
  %427 = ashr i32 %426, 1, !dbg !63
  store i32 %427, i32* %425, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 10, metadata !31, metadata !DIExpression()), !dbg !19
  %428 = load i32, i32* %6, align 4, !dbg !19
  %429 = shl i32 %428, 1, !dbg !34
  store i32 %429, i32* %6, align 4, !dbg !34
  %430 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %431 = load i32, i32* %430, align 4, !dbg !38
  %432 = shl i32 %431, 1, !dbg !38
  store i32 %432, i32* %430, align 4, !dbg !38
  %433 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %434 = load i32, i32* %433, align 4, !dbg !40
  %435 = shl i32 %434, 1, !dbg !40
  store i32 %435, i32* %433, align 4, !dbg !40
  %436 = load i32, i32* %0, align 4, !dbg !41
  %437 = and i32 %436, 1, !dbg !43
  %438 = icmp ne i32 %437, 0, !dbg !43
  br i1 %438, label %439, label %443, !dbg !44

439:                                              ; preds = %419
  %440 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %441 = load i32, i32* %440, align 4, !dbg !46
  %442 = or i32 %441, 1, !dbg !46
  store i32 %442, i32* %440, align 4, !dbg !46
  br label %443, !dbg !45

443:                                              ; preds = %439, %419
  %444 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %445 = load i32, i32* %444, align 4, !dbg !47
  %446 = and i32 %445, 1, !dbg !49
  %447 = icmp ne i32 %446, 0, !dbg !49
  br i1 %447, label %448, label %452, !dbg !50

448:                                              ; preds = %443
  %449 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %450 = load i32, i32* %449, align 4, !dbg !52
  %451 = or i32 %450, 1, !dbg !52
  store i32 %451, i32* %449, align 4, !dbg !52
  br label %452, !dbg !51

452:                                              ; preds = %448, %443
  %453 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %454 = load i32, i32* %453, align 4, !dbg !53
  %455 = and i32 %454, 1, !dbg !55
  %456 = icmp ne i32 %455, 0, !dbg !55
  br i1 %456, label %457, label %461, !dbg !56

457:                                              ; preds = %452
  %458 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %459 = load i32, i32* %458, align 4, !dbg !58
  %460 = or i32 %459, 1, !dbg !58
  store i32 %460, i32* %458, align 4, !dbg !58
  br label %461, !dbg !57

461:                                              ; preds = %457, %452
  %462 = load i32, i32* %0, align 4, !dbg !59
  %463 = ashr i32 %462, 1, !dbg !59
  store i32 %463, i32* %0, align 4, !dbg !59
  %464 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %465 = load i32, i32* %464, align 4, !dbg !61
  %466 = ashr i32 %465, 1, !dbg !61
  store i32 %466, i32* %464, align 4, !dbg !61
  %467 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %468 = load i32, i32* %467, align 4, !dbg !63
  %469 = ashr i32 %468, 1, !dbg !63
  store i32 %469, i32* %467, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 11, metadata !31, metadata !DIExpression()), !dbg !19
  %470 = load i32, i32* %6, align 4, !dbg !19
  %471 = shl i32 %470, 1, !dbg !34
  store i32 %471, i32* %6, align 4, !dbg !34
  %472 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %473 = load i32, i32* %472, align 4, !dbg !38
  %474 = shl i32 %473, 1, !dbg !38
  store i32 %474, i32* %472, align 4, !dbg !38
  %475 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %476 = load i32, i32* %475, align 4, !dbg !40
  %477 = shl i32 %476, 1, !dbg !40
  store i32 %477, i32* %475, align 4, !dbg !40
  %478 = load i32, i32* %0, align 4, !dbg !41
  %479 = and i32 %478, 1, !dbg !43
  %480 = icmp ne i32 %479, 0, !dbg !43
  br i1 %480, label %481, label %485, !dbg !44

481:                                              ; preds = %461
  %482 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %483 = load i32, i32* %482, align 4, !dbg !46
  %484 = or i32 %483, 1, !dbg !46
  store i32 %484, i32* %482, align 4, !dbg !46
  br label %485, !dbg !45

485:                                              ; preds = %481, %461
  %486 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %487 = load i32, i32* %486, align 4, !dbg !47
  %488 = and i32 %487, 1, !dbg !49
  %489 = icmp ne i32 %488, 0, !dbg !49
  br i1 %489, label %490, label %494, !dbg !50

490:                                              ; preds = %485
  %491 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %492 = load i32, i32* %491, align 4, !dbg !52
  %493 = or i32 %492, 1, !dbg !52
  store i32 %493, i32* %491, align 4, !dbg !52
  br label %494, !dbg !51

494:                                              ; preds = %490, %485
  %495 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %496 = load i32, i32* %495, align 4, !dbg !53
  %497 = and i32 %496, 1, !dbg !55
  %498 = icmp ne i32 %497, 0, !dbg !55
  br i1 %498, label %499, label %503, !dbg !56

499:                                              ; preds = %494
  %500 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %501 = load i32, i32* %500, align 4, !dbg !58
  %502 = or i32 %501, 1, !dbg !58
  store i32 %502, i32* %500, align 4, !dbg !58
  br label %503, !dbg !57

503:                                              ; preds = %499, %494
  %504 = load i32, i32* %0, align 4, !dbg !59
  %505 = ashr i32 %504, 1, !dbg !59
  store i32 %505, i32* %0, align 4, !dbg !59
  %506 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %507 = load i32, i32* %506, align 4, !dbg !61
  %508 = ashr i32 %507, 1, !dbg !61
  store i32 %508, i32* %506, align 4, !dbg !61
  %509 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %510 = load i32, i32* %509, align 4, !dbg !63
  %511 = ashr i32 %510, 1, !dbg !63
  store i32 %511, i32* %509, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 12, metadata !31, metadata !DIExpression()), !dbg !19
  %512 = load i32, i32* %6, align 4, !dbg !19
  %513 = shl i32 %512, 1, !dbg !34
  store i32 %513, i32* %6, align 4, !dbg !34
  %514 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %515 = load i32, i32* %514, align 4, !dbg !38
  %516 = shl i32 %515, 1, !dbg !38
  store i32 %516, i32* %514, align 4, !dbg !38
  %517 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %518 = load i32, i32* %517, align 4, !dbg !40
  %519 = shl i32 %518, 1, !dbg !40
  store i32 %519, i32* %517, align 4, !dbg !40
  %520 = load i32, i32* %0, align 4, !dbg !41
  %521 = and i32 %520, 1, !dbg !43
  %522 = icmp ne i32 %521, 0, !dbg !43
  br i1 %522, label %523, label %527, !dbg !44

523:                                              ; preds = %503
  %524 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %525 = load i32, i32* %524, align 4, !dbg !46
  %526 = or i32 %525, 1, !dbg !46
  store i32 %526, i32* %524, align 4, !dbg !46
  br label %527, !dbg !45

527:                                              ; preds = %523, %503
  %528 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %529 = load i32, i32* %528, align 4, !dbg !47
  %530 = and i32 %529, 1, !dbg !49
  %531 = icmp ne i32 %530, 0, !dbg !49
  br i1 %531, label %532, label %536, !dbg !50

532:                                              ; preds = %527
  %533 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %534 = load i32, i32* %533, align 4, !dbg !52
  %535 = or i32 %534, 1, !dbg !52
  store i32 %535, i32* %533, align 4, !dbg !52
  br label %536, !dbg !51

536:                                              ; preds = %532, %527
  %537 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %538 = load i32, i32* %537, align 4, !dbg !53
  %539 = and i32 %538, 1, !dbg !55
  %540 = icmp ne i32 %539, 0, !dbg !55
  br i1 %540, label %541, label %545, !dbg !56

541:                                              ; preds = %536
  %542 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %543 = load i32, i32* %542, align 4, !dbg !58
  %544 = or i32 %543, 1, !dbg !58
  store i32 %544, i32* %542, align 4, !dbg !58
  br label %545, !dbg !57

545:                                              ; preds = %541, %536
  %546 = load i32, i32* %0, align 4, !dbg !59
  %547 = ashr i32 %546, 1, !dbg !59
  store i32 %547, i32* %0, align 4, !dbg !59
  %548 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %549 = load i32, i32* %548, align 4, !dbg !61
  %550 = ashr i32 %549, 1, !dbg !61
  store i32 %550, i32* %548, align 4, !dbg !61
  %551 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %552 = load i32, i32* %551, align 4, !dbg !63
  %553 = ashr i32 %552, 1, !dbg !63
  store i32 %553, i32* %551, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 13, metadata !31, metadata !DIExpression()), !dbg !19
  %554 = load i32, i32* %6, align 4, !dbg !19
  %555 = shl i32 %554, 1, !dbg !34
  store i32 %555, i32* %6, align 4, !dbg !34
  %556 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %557 = load i32, i32* %556, align 4, !dbg !38
  %558 = shl i32 %557, 1, !dbg !38
  store i32 %558, i32* %556, align 4, !dbg !38
  %559 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %560 = load i32, i32* %559, align 4, !dbg !40
  %561 = shl i32 %560, 1, !dbg !40
  store i32 %561, i32* %559, align 4, !dbg !40
  %562 = load i32, i32* %0, align 4, !dbg !41
  %563 = and i32 %562, 1, !dbg !43
  %564 = icmp ne i32 %563, 0, !dbg !43
  br i1 %564, label %565, label %569, !dbg !44

565:                                              ; preds = %545
  %566 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %567 = load i32, i32* %566, align 4, !dbg !46
  %568 = or i32 %567, 1, !dbg !46
  store i32 %568, i32* %566, align 4, !dbg !46
  br label %569, !dbg !45

569:                                              ; preds = %565, %545
  %570 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %571 = load i32, i32* %570, align 4, !dbg !47
  %572 = and i32 %571, 1, !dbg !49
  %573 = icmp ne i32 %572, 0, !dbg !49
  br i1 %573, label %574, label %578, !dbg !50

574:                                              ; preds = %569
  %575 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %576 = load i32, i32* %575, align 4, !dbg !52
  %577 = or i32 %576, 1, !dbg !52
  store i32 %577, i32* %575, align 4, !dbg !52
  br label %578, !dbg !51

578:                                              ; preds = %574, %569
  %579 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %580 = load i32, i32* %579, align 4, !dbg !53
  %581 = and i32 %580, 1, !dbg !55
  %582 = icmp ne i32 %581, 0, !dbg !55
  br i1 %582, label %583, label %587, !dbg !56

583:                                              ; preds = %578
  %584 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %585 = load i32, i32* %584, align 4, !dbg !58
  %586 = or i32 %585, 1, !dbg !58
  store i32 %586, i32* %584, align 4, !dbg !58
  br label %587, !dbg !57

587:                                              ; preds = %583, %578
  %588 = load i32, i32* %0, align 4, !dbg !59
  %589 = ashr i32 %588, 1, !dbg !59
  store i32 %589, i32* %0, align 4, !dbg !59
  %590 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %591 = load i32, i32* %590, align 4, !dbg !61
  %592 = ashr i32 %591, 1, !dbg !61
  store i32 %592, i32* %590, align 4, !dbg !61
  %593 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %594 = load i32, i32* %593, align 4, !dbg !63
  %595 = ashr i32 %594, 1, !dbg !63
  store i32 %595, i32* %593, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 14, metadata !31, metadata !DIExpression()), !dbg !19
  %596 = load i32, i32* %6, align 4, !dbg !19
  %597 = shl i32 %596, 1, !dbg !34
  store i32 %597, i32* %6, align 4, !dbg !34
  %598 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %599 = load i32, i32* %598, align 4, !dbg !38
  %600 = shl i32 %599, 1, !dbg !38
  store i32 %600, i32* %598, align 4, !dbg !38
  %601 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %602 = load i32, i32* %601, align 4, !dbg !40
  %603 = shl i32 %602, 1, !dbg !40
  store i32 %603, i32* %601, align 4, !dbg !40
  %604 = load i32, i32* %0, align 4, !dbg !41
  %605 = and i32 %604, 1, !dbg !43
  %606 = icmp ne i32 %605, 0, !dbg !43
  br i1 %606, label %607, label %611, !dbg !44

607:                                              ; preds = %587
  %608 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %609 = load i32, i32* %608, align 4, !dbg !46
  %610 = or i32 %609, 1, !dbg !46
  store i32 %610, i32* %608, align 4, !dbg !46
  br label %611, !dbg !45

611:                                              ; preds = %607, %587
  %612 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %613 = load i32, i32* %612, align 4, !dbg !47
  %614 = and i32 %613, 1, !dbg !49
  %615 = icmp ne i32 %614, 0, !dbg !49
  br i1 %615, label %616, label %620, !dbg !50

616:                                              ; preds = %611
  %617 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %618 = load i32, i32* %617, align 4, !dbg !52
  %619 = or i32 %618, 1, !dbg !52
  store i32 %619, i32* %617, align 4, !dbg !52
  br label %620, !dbg !51

620:                                              ; preds = %616, %611
  %621 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %622 = load i32, i32* %621, align 4, !dbg !53
  %623 = and i32 %622, 1, !dbg !55
  %624 = icmp ne i32 %623, 0, !dbg !55
  br i1 %624, label %625, label %629, !dbg !56

625:                                              ; preds = %620
  %626 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %627 = load i32, i32* %626, align 4, !dbg !58
  %628 = or i32 %627, 1, !dbg !58
  store i32 %628, i32* %626, align 4, !dbg !58
  br label %629, !dbg !57

629:                                              ; preds = %625, %620
  %630 = load i32, i32* %0, align 4, !dbg !59
  %631 = ashr i32 %630, 1, !dbg !59
  store i32 %631, i32* %0, align 4, !dbg !59
  %632 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %633 = load i32, i32* %632, align 4, !dbg !61
  %634 = ashr i32 %633, 1, !dbg !61
  store i32 %634, i32* %632, align 4, !dbg !61
  %635 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %636 = load i32, i32* %635, align 4, !dbg !63
  %637 = ashr i32 %636, 1, !dbg !63
  store i32 %637, i32* %635, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 15, metadata !31, metadata !DIExpression()), !dbg !19
  %638 = load i32, i32* %6, align 4, !dbg !19
  %639 = shl i32 %638, 1, !dbg !34
  store i32 %639, i32* %6, align 4, !dbg !34
  %640 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %641 = load i32, i32* %640, align 4, !dbg !38
  %642 = shl i32 %641, 1, !dbg !38
  store i32 %642, i32* %640, align 4, !dbg !38
  %643 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %644 = load i32, i32* %643, align 4, !dbg !40
  %645 = shl i32 %644, 1, !dbg !40
  store i32 %645, i32* %643, align 4, !dbg !40
  %646 = load i32, i32* %0, align 4, !dbg !41
  %647 = and i32 %646, 1, !dbg !43
  %648 = icmp ne i32 %647, 0, !dbg !43
  br i1 %648, label %649, label %653, !dbg !44

649:                                              ; preds = %629
  %650 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %651 = load i32, i32* %650, align 4, !dbg !46
  %652 = or i32 %651, 1, !dbg !46
  store i32 %652, i32* %650, align 4, !dbg !46
  br label %653, !dbg !45

653:                                              ; preds = %649, %629
  %654 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %655 = load i32, i32* %654, align 4, !dbg !47
  %656 = and i32 %655, 1, !dbg !49
  %657 = icmp ne i32 %656, 0, !dbg !49
  br i1 %657, label %658, label %662, !dbg !50

658:                                              ; preds = %653
  %659 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %660 = load i32, i32* %659, align 4, !dbg !52
  %661 = or i32 %660, 1, !dbg !52
  store i32 %661, i32* %659, align 4, !dbg !52
  br label %662, !dbg !51

662:                                              ; preds = %658, %653
  %663 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %664 = load i32, i32* %663, align 4, !dbg !53
  %665 = and i32 %664, 1, !dbg !55
  %666 = icmp ne i32 %665, 0, !dbg !55
  br i1 %666, label %667, label %671, !dbg !56

667:                                              ; preds = %662
  %668 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %669 = load i32, i32* %668, align 4, !dbg !58
  %670 = or i32 %669, 1, !dbg !58
  store i32 %670, i32* %668, align 4, !dbg !58
  br label %671, !dbg !57

671:                                              ; preds = %667, %662
  %672 = load i32, i32* %0, align 4, !dbg !59
  %673 = ashr i32 %672, 1, !dbg !59
  store i32 %673, i32* %0, align 4, !dbg !59
  %674 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %675 = load i32, i32* %674, align 4, !dbg !61
  %676 = ashr i32 %675, 1, !dbg !61
  store i32 %676, i32* %674, align 4, !dbg !61
  %677 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %678 = load i32, i32* %677, align 4, !dbg !63
  %679 = ashr i32 %678, 1, !dbg !63
  store i32 %679, i32* %677, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 16, metadata !31, metadata !DIExpression()), !dbg !19
  %680 = load i32, i32* %6, align 4, !dbg !19
  %681 = shl i32 %680, 1, !dbg !34
  store i32 %681, i32* %6, align 4, !dbg !34
  %682 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %683 = load i32, i32* %682, align 4, !dbg !38
  %684 = shl i32 %683, 1, !dbg !38
  store i32 %684, i32* %682, align 4, !dbg !38
  %685 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %686 = load i32, i32* %685, align 4, !dbg !40
  %687 = shl i32 %686, 1, !dbg !40
  store i32 %687, i32* %685, align 4, !dbg !40
  %688 = load i32, i32* %0, align 4, !dbg !41
  %689 = and i32 %688, 1, !dbg !43
  %690 = icmp ne i32 %689, 0, !dbg !43
  br i1 %690, label %691, label %695, !dbg !44

691:                                              ; preds = %671
  %692 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %693 = load i32, i32* %692, align 4, !dbg !46
  %694 = or i32 %693, 1, !dbg !46
  store i32 %694, i32* %692, align 4, !dbg !46
  br label %695, !dbg !45

695:                                              ; preds = %691, %671
  %696 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %697 = load i32, i32* %696, align 4, !dbg !47
  %698 = and i32 %697, 1, !dbg !49
  %699 = icmp ne i32 %698, 0, !dbg !49
  br i1 %699, label %700, label %704, !dbg !50

700:                                              ; preds = %695
  %701 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %702 = load i32, i32* %701, align 4, !dbg !52
  %703 = or i32 %702, 1, !dbg !52
  store i32 %703, i32* %701, align 4, !dbg !52
  br label %704, !dbg !51

704:                                              ; preds = %700, %695
  %705 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %706 = load i32, i32* %705, align 4, !dbg !53
  %707 = and i32 %706, 1, !dbg !55
  %708 = icmp ne i32 %707, 0, !dbg !55
  br i1 %708, label %709, label %713, !dbg !56

709:                                              ; preds = %704
  %710 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %711 = load i32, i32* %710, align 4, !dbg !58
  %712 = or i32 %711, 1, !dbg !58
  store i32 %712, i32* %710, align 4, !dbg !58
  br label %713, !dbg !57

713:                                              ; preds = %709, %704
  %714 = load i32, i32* %0, align 4, !dbg !59
  %715 = ashr i32 %714, 1, !dbg !59
  store i32 %715, i32* %0, align 4, !dbg !59
  %716 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %717 = load i32, i32* %716, align 4, !dbg !61
  %718 = ashr i32 %717, 1, !dbg !61
  store i32 %718, i32* %716, align 4, !dbg !61
  %719 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %720 = load i32, i32* %719, align 4, !dbg !63
  %721 = ashr i32 %720, 1, !dbg !63
  store i32 %721, i32* %719, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 17, metadata !31, metadata !DIExpression()), !dbg !19
  %722 = load i32, i32* %6, align 4, !dbg !19
  %723 = shl i32 %722, 1, !dbg !34
  store i32 %723, i32* %6, align 4, !dbg !34
  %724 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %725 = load i32, i32* %724, align 4, !dbg !38
  %726 = shl i32 %725, 1, !dbg !38
  store i32 %726, i32* %724, align 4, !dbg !38
  %727 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %728 = load i32, i32* %727, align 4, !dbg !40
  %729 = shl i32 %728, 1, !dbg !40
  store i32 %729, i32* %727, align 4, !dbg !40
  %730 = load i32, i32* %0, align 4, !dbg !41
  %731 = and i32 %730, 1, !dbg !43
  %732 = icmp ne i32 %731, 0, !dbg !43
  br i1 %732, label %733, label %737, !dbg !44

733:                                              ; preds = %713
  %734 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %735 = load i32, i32* %734, align 4, !dbg !46
  %736 = or i32 %735, 1, !dbg !46
  store i32 %736, i32* %734, align 4, !dbg !46
  br label %737, !dbg !45

737:                                              ; preds = %733, %713
  %738 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %739 = load i32, i32* %738, align 4, !dbg !47
  %740 = and i32 %739, 1, !dbg !49
  %741 = icmp ne i32 %740, 0, !dbg !49
  br i1 %741, label %742, label %746, !dbg !50

742:                                              ; preds = %737
  %743 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %744 = load i32, i32* %743, align 4, !dbg !52
  %745 = or i32 %744, 1, !dbg !52
  store i32 %745, i32* %743, align 4, !dbg !52
  br label %746, !dbg !51

746:                                              ; preds = %742, %737
  %747 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %748 = load i32, i32* %747, align 4, !dbg !53
  %749 = and i32 %748, 1, !dbg !55
  %750 = icmp ne i32 %749, 0, !dbg !55
  br i1 %750, label %751, label %755, !dbg !56

751:                                              ; preds = %746
  %752 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %753 = load i32, i32* %752, align 4, !dbg !58
  %754 = or i32 %753, 1, !dbg !58
  store i32 %754, i32* %752, align 4, !dbg !58
  br label %755, !dbg !57

755:                                              ; preds = %751, %746
  %756 = load i32, i32* %0, align 4, !dbg !59
  %757 = ashr i32 %756, 1, !dbg !59
  store i32 %757, i32* %0, align 4, !dbg !59
  %758 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %759 = load i32, i32* %758, align 4, !dbg !61
  %760 = ashr i32 %759, 1, !dbg !61
  store i32 %760, i32* %758, align 4, !dbg !61
  %761 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %762 = load i32, i32* %761, align 4, !dbg !63
  %763 = ashr i32 %762, 1, !dbg !63
  store i32 %763, i32* %761, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 18, metadata !31, metadata !DIExpression()), !dbg !19
  %764 = load i32, i32* %6, align 4, !dbg !19
  %765 = shl i32 %764, 1, !dbg !34
  store i32 %765, i32* %6, align 4, !dbg !34
  %766 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %767 = load i32, i32* %766, align 4, !dbg !38
  %768 = shl i32 %767, 1, !dbg !38
  store i32 %768, i32* %766, align 4, !dbg !38
  %769 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %770 = load i32, i32* %769, align 4, !dbg !40
  %771 = shl i32 %770, 1, !dbg !40
  store i32 %771, i32* %769, align 4, !dbg !40
  %772 = load i32, i32* %0, align 4, !dbg !41
  %773 = and i32 %772, 1, !dbg !43
  %774 = icmp ne i32 %773, 0, !dbg !43
  br i1 %774, label %775, label %779, !dbg !44

775:                                              ; preds = %755
  %776 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %777 = load i32, i32* %776, align 4, !dbg !46
  %778 = or i32 %777, 1, !dbg !46
  store i32 %778, i32* %776, align 4, !dbg !46
  br label %779, !dbg !45

779:                                              ; preds = %775, %755
  %780 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %781 = load i32, i32* %780, align 4, !dbg !47
  %782 = and i32 %781, 1, !dbg !49
  %783 = icmp ne i32 %782, 0, !dbg !49
  br i1 %783, label %784, label %788, !dbg !50

784:                                              ; preds = %779
  %785 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %786 = load i32, i32* %785, align 4, !dbg !52
  %787 = or i32 %786, 1, !dbg !52
  store i32 %787, i32* %785, align 4, !dbg !52
  br label %788, !dbg !51

788:                                              ; preds = %784, %779
  %789 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %790 = load i32, i32* %789, align 4, !dbg !53
  %791 = and i32 %790, 1, !dbg !55
  %792 = icmp ne i32 %791, 0, !dbg !55
  br i1 %792, label %793, label %797, !dbg !56

793:                                              ; preds = %788
  %794 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %795 = load i32, i32* %794, align 4, !dbg !58
  %796 = or i32 %795, 1, !dbg !58
  store i32 %796, i32* %794, align 4, !dbg !58
  br label %797, !dbg !57

797:                                              ; preds = %793, %788
  %798 = load i32, i32* %0, align 4, !dbg !59
  %799 = ashr i32 %798, 1, !dbg !59
  store i32 %799, i32* %0, align 4, !dbg !59
  %800 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %801 = load i32, i32* %800, align 4, !dbg !61
  %802 = ashr i32 %801, 1, !dbg !61
  store i32 %802, i32* %800, align 4, !dbg !61
  %803 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %804 = load i32, i32* %803, align 4, !dbg !63
  %805 = ashr i32 %804, 1, !dbg !63
  store i32 %805, i32* %803, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 19, metadata !31, metadata !DIExpression()), !dbg !19
  %806 = load i32, i32* %6, align 4, !dbg !19
  %807 = shl i32 %806, 1, !dbg !34
  store i32 %807, i32* %6, align 4, !dbg !34
  %808 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %809 = load i32, i32* %808, align 4, !dbg !38
  %810 = shl i32 %809, 1, !dbg !38
  store i32 %810, i32* %808, align 4, !dbg !38
  %811 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %812 = load i32, i32* %811, align 4, !dbg !40
  %813 = shl i32 %812, 1, !dbg !40
  store i32 %813, i32* %811, align 4, !dbg !40
  %814 = load i32, i32* %0, align 4, !dbg !41
  %815 = and i32 %814, 1, !dbg !43
  %816 = icmp ne i32 %815, 0, !dbg !43
  br i1 %816, label %817, label %821, !dbg !44

817:                                              ; preds = %797
  %818 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %819 = load i32, i32* %818, align 4, !dbg !46
  %820 = or i32 %819, 1, !dbg !46
  store i32 %820, i32* %818, align 4, !dbg !46
  br label %821, !dbg !45

821:                                              ; preds = %817, %797
  %822 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %823 = load i32, i32* %822, align 4, !dbg !47
  %824 = and i32 %823, 1, !dbg !49
  %825 = icmp ne i32 %824, 0, !dbg !49
  br i1 %825, label %826, label %830, !dbg !50

826:                                              ; preds = %821
  %827 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %828 = load i32, i32* %827, align 4, !dbg !52
  %829 = or i32 %828, 1, !dbg !52
  store i32 %829, i32* %827, align 4, !dbg !52
  br label %830, !dbg !51

830:                                              ; preds = %826, %821
  %831 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %832 = load i32, i32* %831, align 4, !dbg !53
  %833 = and i32 %832, 1, !dbg !55
  %834 = icmp ne i32 %833, 0, !dbg !55
  br i1 %834, label %835, label %839, !dbg !56

835:                                              ; preds = %830
  %836 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %837 = load i32, i32* %836, align 4, !dbg !58
  %838 = or i32 %837, 1, !dbg !58
  store i32 %838, i32* %836, align 4, !dbg !58
  br label %839, !dbg !57

839:                                              ; preds = %835, %830
  %840 = load i32, i32* %0, align 4, !dbg !59
  %841 = ashr i32 %840, 1, !dbg !59
  store i32 %841, i32* %0, align 4, !dbg !59
  %842 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %843 = load i32, i32* %842, align 4, !dbg !61
  %844 = ashr i32 %843, 1, !dbg !61
  store i32 %844, i32* %842, align 4, !dbg !61
  %845 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %846 = load i32, i32* %845, align 4, !dbg !63
  %847 = ashr i32 %846, 1, !dbg !63
  store i32 %847, i32* %845, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 20, metadata !31, metadata !DIExpression()), !dbg !19
  %848 = load i32, i32* %6, align 4, !dbg !19
  %849 = shl i32 %848, 1, !dbg !34
  store i32 %849, i32* %6, align 4, !dbg !34
  %850 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %851 = load i32, i32* %850, align 4, !dbg !38
  %852 = shl i32 %851, 1, !dbg !38
  store i32 %852, i32* %850, align 4, !dbg !38
  %853 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %854 = load i32, i32* %853, align 4, !dbg !40
  %855 = shl i32 %854, 1, !dbg !40
  store i32 %855, i32* %853, align 4, !dbg !40
  %856 = load i32, i32* %0, align 4, !dbg !41
  %857 = and i32 %856, 1, !dbg !43
  %858 = icmp ne i32 %857, 0, !dbg !43
  br i1 %858, label %859, label %863, !dbg !44

859:                                              ; preds = %839
  %860 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %861 = load i32, i32* %860, align 4, !dbg !46
  %862 = or i32 %861, 1, !dbg !46
  store i32 %862, i32* %860, align 4, !dbg !46
  br label %863, !dbg !45

863:                                              ; preds = %859, %839
  %864 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %865 = load i32, i32* %864, align 4, !dbg !47
  %866 = and i32 %865, 1, !dbg !49
  %867 = icmp ne i32 %866, 0, !dbg !49
  br i1 %867, label %868, label %872, !dbg !50

868:                                              ; preds = %863
  %869 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %870 = load i32, i32* %869, align 4, !dbg !52
  %871 = or i32 %870, 1, !dbg !52
  store i32 %871, i32* %869, align 4, !dbg !52
  br label %872, !dbg !51

872:                                              ; preds = %868, %863
  %873 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %874 = load i32, i32* %873, align 4, !dbg !53
  %875 = and i32 %874, 1, !dbg !55
  %876 = icmp ne i32 %875, 0, !dbg !55
  br i1 %876, label %877, label %881, !dbg !56

877:                                              ; preds = %872
  %878 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %879 = load i32, i32* %878, align 4, !dbg !58
  %880 = or i32 %879, 1, !dbg !58
  store i32 %880, i32* %878, align 4, !dbg !58
  br label %881, !dbg !57

881:                                              ; preds = %877, %872
  %882 = load i32, i32* %0, align 4, !dbg !59
  %883 = ashr i32 %882, 1, !dbg !59
  store i32 %883, i32* %0, align 4, !dbg !59
  %884 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %885 = load i32, i32* %884, align 4, !dbg !61
  %886 = ashr i32 %885, 1, !dbg !61
  store i32 %886, i32* %884, align 4, !dbg !61
  %887 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %888 = load i32, i32* %887, align 4, !dbg !63
  %889 = ashr i32 %888, 1, !dbg !63
  store i32 %889, i32* %887, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 21, metadata !31, metadata !DIExpression()), !dbg !19
  %890 = load i32, i32* %6, align 4, !dbg !19
  %891 = shl i32 %890, 1, !dbg !34
  store i32 %891, i32* %6, align 4, !dbg !34
  %892 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %893 = load i32, i32* %892, align 4, !dbg !38
  %894 = shl i32 %893, 1, !dbg !38
  store i32 %894, i32* %892, align 4, !dbg !38
  %895 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %896 = load i32, i32* %895, align 4, !dbg !40
  %897 = shl i32 %896, 1, !dbg !40
  store i32 %897, i32* %895, align 4, !dbg !40
  %898 = load i32, i32* %0, align 4, !dbg !41
  %899 = and i32 %898, 1, !dbg !43
  %900 = icmp ne i32 %899, 0, !dbg !43
  br i1 %900, label %901, label %905, !dbg !44

901:                                              ; preds = %881
  %902 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %903 = load i32, i32* %902, align 4, !dbg !46
  %904 = or i32 %903, 1, !dbg !46
  store i32 %904, i32* %902, align 4, !dbg !46
  br label %905, !dbg !45

905:                                              ; preds = %901, %881
  %906 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %907 = load i32, i32* %906, align 4, !dbg !47
  %908 = and i32 %907, 1, !dbg !49
  %909 = icmp ne i32 %908, 0, !dbg !49
  br i1 %909, label %910, label %914, !dbg !50

910:                                              ; preds = %905
  %911 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %912 = load i32, i32* %911, align 4, !dbg !52
  %913 = or i32 %912, 1, !dbg !52
  store i32 %913, i32* %911, align 4, !dbg !52
  br label %914, !dbg !51

914:                                              ; preds = %910, %905
  %915 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %916 = load i32, i32* %915, align 4, !dbg !53
  %917 = and i32 %916, 1, !dbg !55
  %918 = icmp ne i32 %917, 0, !dbg !55
  br i1 %918, label %919, label %923, !dbg !56

919:                                              ; preds = %914
  %920 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %921 = load i32, i32* %920, align 4, !dbg !58
  %922 = or i32 %921, 1, !dbg !58
  store i32 %922, i32* %920, align 4, !dbg !58
  br label %923, !dbg !57

923:                                              ; preds = %919, %914
  %924 = load i32, i32* %0, align 4, !dbg !59
  %925 = ashr i32 %924, 1, !dbg !59
  store i32 %925, i32* %0, align 4, !dbg !59
  %926 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %927 = load i32, i32* %926, align 4, !dbg !61
  %928 = ashr i32 %927, 1, !dbg !61
  store i32 %928, i32* %926, align 4, !dbg !61
  %929 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %930 = load i32, i32* %929, align 4, !dbg !63
  %931 = ashr i32 %930, 1, !dbg !63
  store i32 %931, i32* %929, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 22, metadata !31, metadata !DIExpression()), !dbg !19
  %932 = load i32, i32* %6, align 4, !dbg !19
  %933 = shl i32 %932, 1, !dbg !34
  store i32 %933, i32* %6, align 4, !dbg !34
  %934 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %935 = load i32, i32* %934, align 4, !dbg !38
  %936 = shl i32 %935, 1, !dbg !38
  store i32 %936, i32* %934, align 4, !dbg !38
  %937 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %938 = load i32, i32* %937, align 4, !dbg !40
  %939 = shl i32 %938, 1, !dbg !40
  store i32 %939, i32* %937, align 4, !dbg !40
  %940 = load i32, i32* %0, align 4, !dbg !41
  %941 = and i32 %940, 1, !dbg !43
  %942 = icmp ne i32 %941, 0, !dbg !43
  br i1 %942, label %943, label %947, !dbg !44

943:                                              ; preds = %923
  %944 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %945 = load i32, i32* %944, align 4, !dbg !46
  %946 = or i32 %945, 1, !dbg !46
  store i32 %946, i32* %944, align 4, !dbg !46
  br label %947, !dbg !45

947:                                              ; preds = %943, %923
  %948 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %949 = load i32, i32* %948, align 4, !dbg !47
  %950 = and i32 %949, 1, !dbg !49
  %951 = icmp ne i32 %950, 0, !dbg !49
  br i1 %951, label %952, label %956, !dbg !50

952:                                              ; preds = %947
  %953 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %954 = load i32, i32* %953, align 4, !dbg !52
  %955 = or i32 %954, 1, !dbg !52
  store i32 %955, i32* %953, align 4, !dbg !52
  br label %956, !dbg !51

956:                                              ; preds = %952, %947
  %957 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %958 = load i32, i32* %957, align 4, !dbg !53
  %959 = and i32 %958, 1, !dbg !55
  %960 = icmp ne i32 %959, 0, !dbg !55
  br i1 %960, label %961, label %965, !dbg !56

961:                                              ; preds = %956
  %962 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %963 = load i32, i32* %962, align 4, !dbg !58
  %964 = or i32 %963, 1, !dbg !58
  store i32 %964, i32* %962, align 4, !dbg !58
  br label %965, !dbg !57

965:                                              ; preds = %961, %956
  %966 = load i32, i32* %0, align 4, !dbg !59
  %967 = ashr i32 %966, 1, !dbg !59
  store i32 %967, i32* %0, align 4, !dbg !59
  %968 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %969 = load i32, i32* %968, align 4, !dbg !61
  %970 = ashr i32 %969, 1, !dbg !61
  store i32 %970, i32* %968, align 4, !dbg !61
  %971 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %972 = load i32, i32* %971, align 4, !dbg !63
  %973 = ashr i32 %972, 1, !dbg !63
  store i32 %973, i32* %971, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 23, metadata !31, metadata !DIExpression()), !dbg !19
  %974 = load i32, i32* %6, align 4, !dbg !19
  %975 = shl i32 %974, 1, !dbg !34
  store i32 %975, i32* %6, align 4, !dbg !34
  %976 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %977 = load i32, i32* %976, align 4, !dbg !38
  %978 = shl i32 %977, 1, !dbg !38
  store i32 %978, i32* %976, align 4, !dbg !38
  %979 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %980 = load i32, i32* %979, align 4, !dbg !40
  %981 = shl i32 %980, 1, !dbg !40
  store i32 %981, i32* %979, align 4, !dbg !40
  %982 = load i32, i32* %0, align 4, !dbg !41
  %983 = and i32 %982, 1, !dbg !43
  %984 = icmp ne i32 %983, 0, !dbg !43
  br i1 %984, label %985, label %989, !dbg !44

985:                                              ; preds = %965
  %986 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %987 = load i32, i32* %986, align 4, !dbg !46
  %988 = or i32 %987, 1, !dbg !46
  store i32 %988, i32* %986, align 4, !dbg !46
  br label %989, !dbg !45

989:                                              ; preds = %985, %965
  %990 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %991 = load i32, i32* %990, align 4, !dbg !47
  %992 = and i32 %991, 1, !dbg !49
  %993 = icmp ne i32 %992, 0, !dbg !49
  br i1 %993, label %994, label %998, !dbg !50

994:                                              ; preds = %989
  %995 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %996 = load i32, i32* %995, align 4, !dbg !52
  %997 = or i32 %996, 1, !dbg !52
  store i32 %997, i32* %995, align 4, !dbg !52
  br label %998, !dbg !51

998:                                              ; preds = %994, %989
  %999 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %1000 = load i32, i32* %999, align 4, !dbg !53
  %1001 = and i32 %1000, 1, !dbg !55
  %1002 = icmp ne i32 %1001, 0, !dbg !55
  br i1 %1002, label %1003, label %1007, !dbg !56

1003:                                             ; preds = %998
  %1004 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %1005 = load i32, i32* %1004, align 4, !dbg !58
  %1006 = or i32 %1005, 1, !dbg !58
  store i32 %1006, i32* %1004, align 4, !dbg !58
  br label %1007, !dbg !57

1007:                                             ; preds = %1003, %998
  %1008 = load i32, i32* %0, align 4, !dbg !59
  %1009 = ashr i32 %1008, 1, !dbg !59
  store i32 %1009, i32* %0, align 4, !dbg !59
  %1010 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %1011 = load i32, i32* %1010, align 4, !dbg !61
  %1012 = ashr i32 %1011, 1, !dbg !61
  store i32 %1012, i32* %1010, align 4, !dbg !61
  %1013 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %1014 = load i32, i32* %1013, align 4, !dbg !63
  %1015 = ashr i32 %1014, 1, !dbg !63
  store i32 %1015, i32* %1013, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 24, metadata !31, metadata !DIExpression()), !dbg !19
  %1016 = load i32, i32* %6, align 4, !dbg !19
  %1017 = shl i32 %1016, 1, !dbg !34
  store i32 %1017, i32* %6, align 4, !dbg !34
  %1018 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %1019 = load i32, i32* %1018, align 4, !dbg !38
  %1020 = shl i32 %1019, 1, !dbg !38
  store i32 %1020, i32* %1018, align 4, !dbg !38
  %1021 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %1022 = load i32, i32* %1021, align 4, !dbg !40
  %1023 = shl i32 %1022, 1, !dbg !40
  store i32 %1023, i32* %1021, align 4, !dbg !40
  %1024 = load i32, i32* %0, align 4, !dbg !41
  %1025 = and i32 %1024, 1, !dbg !43
  %1026 = icmp ne i32 %1025, 0, !dbg !43
  br i1 %1026, label %1027, label %1031, !dbg !44

1027:                                             ; preds = %1007
  %1028 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %1029 = load i32, i32* %1028, align 4, !dbg !46
  %1030 = or i32 %1029, 1, !dbg !46
  store i32 %1030, i32* %1028, align 4, !dbg !46
  br label %1031, !dbg !45

1031:                                             ; preds = %1027, %1007
  %1032 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %1033 = load i32, i32* %1032, align 4, !dbg !47
  %1034 = and i32 %1033, 1, !dbg !49
  %1035 = icmp ne i32 %1034, 0, !dbg !49
  br i1 %1035, label %1036, label %1040, !dbg !50

1036:                                             ; preds = %1031
  %1037 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %1038 = load i32, i32* %1037, align 4, !dbg !52
  %1039 = or i32 %1038, 1, !dbg !52
  store i32 %1039, i32* %1037, align 4, !dbg !52
  br label %1040, !dbg !51

1040:                                             ; preds = %1036, %1031
  %1041 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %1042 = load i32, i32* %1041, align 4, !dbg !53
  %1043 = and i32 %1042, 1, !dbg !55
  %1044 = icmp ne i32 %1043, 0, !dbg !55
  br i1 %1044, label %1045, label %1049, !dbg !56

1045:                                             ; preds = %1040
  %1046 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %1047 = load i32, i32* %1046, align 4, !dbg !58
  %1048 = or i32 %1047, 1, !dbg !58
  store i32 %1048, i32* %1046, align 4, !dbg !58
  br label %1049, !dbg !57

1049:                                             ; preds = %1045, %1040
  %1050 = load i32, i32* %0, align 4, !dbg !59
  %1051 = ashr i32 %1050, 1, !dbg !59
  store i32 %1051, i32* %0, align 4, !dbg !59
  %1052 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %1053 = load i32, i32* %1052, align 4, !dbg !61
  %1054 = ashr i32 %1053, 1, !dbg !61
  store i32 %1054, i32* %1052, align 4, !dbg !61
  %1055 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %1056 = load i32, i32* %1055, align 4, !dbg !63
  %1057 = ashr i32 %1056, 1, !dbg !63
  store i32 %1057, i32* %1055, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 25, metadata !31, metadata !DIExpression()), !dbg !19
  %1058 = load i32, i32* %6, align 4, !dbg !19
  %1059 = shl i32 %1058, 1, !dbg !34
  store i32 %1059, i32* %6, align 4, !dbg !34
  %1060 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %1061 = load i32, i32* %1060, align 4, !dbg !38
  %1062 = shl i32 %1061, 1, !dbg !38
  store i32 %1062, i32* %1060, align 4, !dbg !38
  %1063 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %1064 = load i32, i32* %1063, align 4, !dbg !40
  %1065 = shl i32 %1064, 1, !dbg !40
  store i32 %1065, i32* %1063, align 4, !dbg !40
  %1066 = load i32, i32* %0, align 4, !dbg !41
  %1067 = and i32 %1066, 1, !dbg !43
  %1068 = icmp ne i32 %1067, 0, !dbg !43
  br i1 %1068, label %1069, label %1073, !dbg !44

1069:                                             ; preds = %1049
  %1070 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %1071 = load i32, i32* %1070, align 4, !dbg !46
  %1072 = or i32 %1071, 1, !dbg !46
  store i32 %1072, i32* %1070, align 4, !dbg !46
  br label %1073, !dbg !45

1073:                                             ; preds = %1069, %1049
  %1074 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %1075 = load i32, i32* %1074, align 4, !dbg !47
  %1076 = and i32 %1075, 1, !dbg !49
  %1077 = icmp ne i32 %1076, 0, !dbg !49
  br i1 %1077, label %1078, label %1082, !dbg !50

1078:                                             ; preds = %1073
  %1079 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %1080 = load i32, i32* %1079, align 4, !dbg !52
  %1081 = or i32 %1080, 1, !dbg !52
  store i32 %1081, i32* %1079, align 4, !dbg !52
  br label %1082, !dbg !51

1082:                                             ; preds = %1078, %1073
  %1083 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %1084 = load i32, i32* %1083, align 4, !dbg !53
  %1085 = and i32 %1084, 1, !dbg !55
  %1086 = icmp ne i32 %1085, 0, !dbg !55
  br i1 %1086, label %1087, label %1091, !dbg !56

1087:                                             ; preds = %1082
  %1088 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %1089 = load i32, i32* %1088, align 4, !dbg !58
  %1090 = or i32 %1089, 1, !dbg !58
  store i32 %1090, i32* %1088, align 4, !dbg !58
  br label %1091, !dbg !57

1091:                                             ; preds = %1087, %1082
  %1092 = load i32, i32* %0, align 4, !dbg !59
  %1093 = ashr i32 %1092, 1, !dbg !59
  store i32 %1093, i32* %0, align 4, !dbg !59
  %1094 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %1095 = load i32, i32* %1094, align 4, !dbg !61
  %1096 = ashr i32 %1095, 1, !dbg !61
  store i32 %1096, i32* %1094, align 4, !dbg !61
  %1097 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %1098 = load i32, i32* %1097, align 4, !dbg !63
  %1099 = ashr i32 %1098, 1, !dbg !63
  store i32 %1099, i32* %1097, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 26, metadata !31, metadata !DIExpression()), !dbg !19
  %1100 = load i32, i32* %6, align 4, !dbg !19
  %1101 = shl i32 %1100, 1, !dbg !34
  store i32 %1101, i32* %6, align 4, !dbg !34
  %1102 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %1103 = load i32, i32* %1102, align 4, !dbg !38
  %1104 = shl i32 %1103, 1, !dbg !38
  store i32 %1104, i32* %1102, align 4, !dbg !38
  %1105 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %1106 = load i32, i32* %1105, align 4, !dbg !40
  %1107 = shl i32 %1106, 1, !dbg !40
  store i32 %1107, i32* %1105, align 4, !dbg !40
  %1108 = load i32, i32* %0, align 4, !dbg !41
  %1109 = and i32 %1108, 1, !dbg !43
  %1110 = icmp ne i32 %1109, 0, !dbg !43
  br i1 %1110, label %1111, label %1115, !dbg !44

1111:                                             ; preds = %1091
  %1112 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %1113 = load i32, i32* %1112, align 4, !dbg !46
  %1114 = or i32 %1113, 1, !dbg !46
  store i32 %1114, i32* %1112, align 4, !dbg !46
  br label %1115, !dbg !45

1115:                                             ; preds = %1111, %1091
  %1116 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %1117 = load i32, i32* %1116, align 4, !dbg !47
  %1118 = and i32 %1117, 1, !dbg !49
  %1119 = icmp ne i32 %1118, 0, !dbg !49
  br i1 %1119, label %1120, label %1124, !dbg !50

1120:                                             ; preds = %1115
  %1121 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %1122 = load i32, i32* %1121, align 4, !dbg !52
  %1123 = or i32 %1122, 1, !dbg !52
  store i32 %1123, i32* %1121, align 4, !dbg !52
  br label %1124, !dbg !51

1124:                                             ; preds = %1120, %1115
  %1125 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %1126 = load i32, i32* %1125, align 4, !dbg !53
  %1127 = and i32 %1126, 1, !dbg !55
  %1128 = icmp ne i32 %1127, 0, !dbg !55
  br i1 %1128, label %1129, label %1133, !dbg !56

1129:                                             ; preds = %1124
  %1130 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %1131 = load i32, i32* %1130, align 4, !dbg !58
  %1132 = or i32 %1131, 1, !dbg !58
  store i32 %1132, i32* %1130, align 4, !dbg !58
  br label %1133, !dbg !57

1133:                                             ; preds = %1129, %1124
  %1134 = load i32, i32* %0, align 4, !dbg !59
  %1135 = ashr i32 %1134, 1, !dbg !59
  store i32 %1135, i32* %0, align 4, !dbg !59
  %1136 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %1137 = load i32, i32* %1136, align 4, !dbg !61
  %1138 = ashr i32 %1137, 1, !dbg !61
  store i32 %1138, i32* %1136, align 4, !dbg !61
  %1139 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %1140 = load i32, i32* %1139, align 4, !dbg !63
  %1141 = ashr i32 %1140, 1, !dbg !63
  store i32 %1141, i32* %1139, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 27, metadata !31, metadata !DIExpression()), !dbg !19
  %1142 = load i32, i32* %6, align 4, !dbg !19
  %1143 = shl i32 %1142, 1, !dbg !34
  store i32 %1143, i32* %6, align 4, !dbg !34
  %1144 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %1145 = load i32, i32* %1144, align 4, !dbg !38
  %1146 = shl i32 %1145, 1, !dbg !38
  store i32 %1146, i32* %1144, align 4, !dbg !38
  %1147 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %1148 = load i32, i32* %1147, align 4, !dbg !40
  %1149 = shl i32 %1148, 1, !dbg !40
  store i32 %1149, i32* %1147, align 4, !dbg !40
  %1150 = load i32, i32* %0, align 4, !dbg !41
  %1151 = and i32 %1150, 1, !dbg !43
  %1152 = icmp ne i32 %1151, 0, !dbg !43
  br i1 %1152, label %1153, label %1157, !dbg !44

1153:                                             ; preds = %1133
  %1154 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %1155 = load i32, i32* %1154, align 4, !dbg !46
  %1156 = or i32 %1155, 1, !dbg !46
  store i32 %1156, i32* %1154, align 4, !dbg !46
  br label %1157, !dbg !45

1157:                                             ; preds = %1153, %1133
  %1158 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %1159 = load i32, i32* %1158, align 4, !dbg !47
  %1160 = and i32 %1159, 1, !dbg !49
  %1161 = icmp ne i32 %1160, 0, !dbg !49
  br i1 %1161, label %1162, label %1166, !dbg !50

1162:                                             ; preds = %1157
  %1163 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %1164 = load i32, i32* %1163, align 4, !dbg !52
  %1165 = or i32 %1164, 1, !dbg !52
  store i32 %1165, i32* %1163, align 4, !dbg !52
  br label %1166, !dbg !51

1166:                                             ; preds = %1162, %1157
  %1167 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %1168 = load i32, i32* %1167, align 4, !dbg !53
  %1169 = and i32 %1168, 1, !dbg !55
  %1170 = icmp ne i32 %1169, 0, !dbg !55
  br i1 %1170, label %1171, label %1175, !dbg !56

1171:                                             ; preds = %1166
  %1172 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %1173 = load i32, i32* %1172, align 4, !dbg !58
  %1174 = or i32 %1173, 1, !dbg !58
  store i32 %1174, i32* %1172, align 4, !dbg !58
  br label %1175, !dbg !57

1175:                                             ; preds = %1171, %1166
  %1176 = load i32, i32* %0, align 4, !dbg !59
  %1177 = ashr i32 %1176, 1, !dbg !59
  store i32 %1177, i32* %0, align 4, !dbg !59
  %1178 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %1179 = load i32, i32* %1178, align 4, !dbg !61
  %1180 = ashr i32 %1179, 1, !dbg !61
  store i32 %1180, i32* %1178, align 4, !dbg !61
  %1181 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %1182 = load i32, i32* %1181, align 4, !dbg !63
  %1183 = ashr i32 %1182, 1, !dbg !63
  store i32 %1183, i32* %1181, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 28, metadata !31, metadata !DIExpression()), !dbg !19
  %1184 = load i32, i32* %6, align 4, !dbg !19
  %1185 = shl i32 %1184, 1, !dbg !34
  store i32 %1185, i32* %6, align 4, !dbg !34
  %1186 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %1187 = load i32, i32* %1186, align 4, !dbg !38
  %1188 = shl i32 %1187, 1, !dbg !38
  store i32 %1188, i32* %1186, align 4, !dbg !38
  %1189 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %1190 = load i32, i32* %1189, align 4, !dbg !40
  %1191 = shl i32 %1190, 1, !dbg !40
  store i32 %1191, i32* %1189, align 4, !dbg !40
  %1192 = load i32, i32* %0, align 4, !dbg !41
  %1193 = and i32 %1192, 1, !dbg !43
  %1194 = icmp ne i32 %1193, 0, !dbg !43
  br i1 %1194, label %1195, label %1199, !dbg !44

1195:                                             ; preds = %1175
  %1196 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %1197 = load i32, i32* %1196, align 4, !dbg !46
  %1198 = or i32 %1197, 1, !dbg !46
  store i32 %1198, i32* %1196, align 4, !dbg !46
  br label %1199, !dbg !45

1199:                                             ; preds = %1195, %1175
  %1200 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %1201 = load i32, i32* %1200, align 4, !dbg !47
  %1202 = and i32 %1201, 1, !dbg !49
  %1203 = icmp ne i32 %1202, 0, !dbg !49
  br i1 %1203, label %1204, label %1208, !dbg !50

1204:                                             ; preds = %1199
  %1205 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %1206 = load i32, i32* %1205, align 4, !dbg !52
  %1207 = or i32 %1206, 1, !dbg !52
  store i32 %1207, i32* %1205, align 4, !dbg !52
  br label %1208, !dbg !51

1208:                                             ; preds = %1204, %1199
  %1209 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %1210 = load i32, i32* %1209, align 4, !dbg !53
  %1211 = and i32 %1210, 1, !dbg !55
  %1212 = icmp ne i32 %1211, 0, !dbg !55
  br i1 %1212, label %1213, label %1217, !dbg !56

1213:                                             ; preds = %1208
  %1214 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %1215 = load i32, i32* %1214, align 4, !dbg !58
  %1216 = or i32 %1215, 1, !dbg !58
  store i32 %1216, i32* %1214, align 4, !dbg !58
  br label %1217, !dbg !57

1217:                                             ; preds = %1213, %1208
  %1218 = load i32, i32* %0, align 4, !dbg !59
  %1219 = ashr i32 %1218, 1, !dbg !59
  store i32 %1219, i32* %0, align 4, !dbg !59
  %1220 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %1221 = load i32, i32* %1220, align 4, !dbg !61
  %1222 = ashr i32 %1221, 1, !dbg !61
  store i32 %1222, i32* %1220, align 4, !dbg !61
  %1223 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %1224 = load i32, i32* %1223, align 4, !dbg !63
  %1225 = ashr i32 %1224, 1, !dbg !63
  store i32 %1225, i32* %1223, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 29, metadata !31, metadata !DIExpression()), !dbg !19
  %1226 = load i32, i32* %6, align 4, !dbg !19
  %1227 = shl i32 %1226, 1, !dbg !34
  store i32 %1227, i32* %6, align 4, !dbg !34
  %1228 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %1229 = load i32, i32* %1228, align 4, !dbg !38
  %1230 = shl i32 %1229, 1, !dbg !38
  store i32 %1230, i32* %1228, align 4, !dbg !38
  %1231 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %1232 = load i32, i32* %1231, align 4, !dbg !40
  %1233 = shl i32 %1232, 1, !dbg !40
  store i32 %1233, i32* %1231, align 4, !dbg !40
  %1234 = load i32, i32* %0, align 4, !dbg !41
  %1235 = and i32 %1234, 1, !dbg !43
  %1236 = icmp ne i32 %1235, 0, !dbg !43
  br i1 %1236, label %1237, label %1241, !dbg !44

1237:                                             ; preds = %1217
  %1238 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %1239 = load i32, i32* %1238, align 4, !dbg !46
  %1240 = or i32 %1239, 1, !dbg !46
  store i32 %1240, i32* %1238, align 4, !dbg !46
  br label %1241, !dbg !45

1241:                                             ; preds = %1237, %1217
  %1242 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %1243 = load i32, i32* %1242, align 4, !dbg !47
  %1244 = and i32 %1243, 1, !dbg !49
  %1245 = icmp ne i32 %1244, 0, !dbg !49
  br i1 %1245, label %1246, label %1250, !dbg !50

1246:                                             ; preds = %1241
  %1247 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %1248 = load i32, i32* %1247, align 4, !dbg !52
  %1249 = or i32 %1248, 1, !dbg !52
  store i32 %1249, i32* %1247, align 4, !dbg !52
  br label %1250, !dbg !51

1250:                                             ; preds = %1246, %1241
  %1251 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %1252 = load i32, i32* %1251, align 4, !dbg !53
  %1253 = and i32 %1252, 1, !dbg !55
  %1254 = icmp ne i32 %1253, 0, !dbg !55
  br i1 %1254, label %1255, label %1259, !dbg !56

1255:                                             ; preds = %1250
  %1256 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %1257 = load i32, i32* %1256, align 4, !dbg !58
  %1258 = or i32 %1257, 1, !dbg !58
  store i32 %1258, i32* %1256, align 4, !dbg !58
  br label %1259, !dbg !57

1259:                                             ; preds = %1255, %1250
  %1260 = load i32, i32* %0, align 4, !dbg !59
  %1261 = ashr i32 %1260, 1, !dbg !59
  store i32 %1261, i32* %0, align 4, !dbg !59
  %1262 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %1263 = load i32, i32* %1262, align 4, !dbg !61
  %1264 = ashr i32 %1263, 1, !dbg !61
  store i32 %1264, i32* %1262, align 4, !dbg !61
  %1265 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %1266 = load i32, i32* %1265, align 4, !dbg !63
  %1267 = ashr i32 %1266, 1, !dbg !63
  store i32 %1267, i32* %1265, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 30, metadata !31, metadata !DIExpression()), !dbg !19
  %1268 = load i32, i32* %6, align 4, !dbg !19
  %1269 = shl i32 %1268, 1, !dbg !34
  store i32 %1269, i32* %6, align 4, !dbg !34
  %1270 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %1271 = load i32, i32* %1270, align 4, !dbg !38
  %1272 = shl i32 %1271, 1, !dbg !38
  store i32 %1272, i32* %1270, align 4, !dbg !38
  %1273 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %1274 = load i32, i32* %1273, align 4, !dbg !40
  %1275 = shl i32 %1274, 1, !dbg !40
  store i32 %1275, i32* %1273, align 4, !dbg !40
  %1276 = load i32, i32* %0, align 4, !dbg !41
  %1277 = and i32 %1276, 1, !dbg !43
  %1278 = icmp ne i32 %1277, 0, !dbg !43
  br i1 %1278, label %1279, label %1283, !dbg !44

1279:                                             ; preds = %1259
  %1280 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %1281 = load i32, i32* %1280, align 4, !dbg !46
  %1282 = or i32 %1281, 1, !dbg !46
  store i32 %1282, i32* %1280, align 4, !dbg !46
  br label %1283, !dbg !45

1283:                                             ; preds = %1279, %1259
  %1284 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %1285 = load i32, i32* %1284, align 4, !dbg !47
  %1286 = and i32 %1285, 1, !dbg !49
  %1287 = icmp ne i32 %1286, 0, !dbg !49
  br i1 %1287, label %1288, label %1292, !dbg !50

1288:                                             ; preds = %1283
  %1289 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %1290 = load i32, i32* %1289, align 4, !dbg !52
  %1291 = or i32 %1290, 1, !dbg !52
  store i32 %1291, i32* %1289, align 4, !dbg !52
  br label %1292, !dbg !51

1292:                                             ; preds = %1288, %1283
  %1293 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %1294 = load i32, i32* %1293, align 4, !dbg !53
  %1295 = and i32 %1294, 1, !dbg !55
  %1296 = icmp ne i32 %1295, 0, !dbg !55
  br i1 %1296, label %1297, label %1301, !dbg !56

1297:                                             ; preds = %1292
  %1298 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %1299 = load i32, i32* %1298, align 4, !dbg !58
  %1300 = or i32 %1299, 1, !dbg !58
  store i32 %1300, i32* %1298, align 4, !dbg !58
  br label %1301, !dbg !57

1301:                                             ; preds = %1297, %1292
  %1302 = load i32, i32* %0, align 4, !dbg !59
  %1303 = ashr i32 %1302, 1, !dbg !59
  store i32 %1303, i32* %0, align 4, !dbg !59
  %1304 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %1305 = load i32, i32* %1304, align 4, !dbg !61
  %1306 = ashr i32 %1305, 1, !dbg !61
  store i32 %1306, i32* %1304, align 4, !dbg !61
  %1307 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %1308 = load i32, i32* %1307, align 4, !dbg !63
  %1309 = ashr i32 %1308, 1, !dbg !63
  store i32 %1309, i32* %1307, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 31, metadata !31, metadata !DIExpression()), !dbg !19
  %1310 = load i32, i32* %6, align 4, !dbg !19
  %1311 = shl i32 %1310, 1, !dbg !34
  store i32 %1311, i32* %6, align 4, !dbg !34
  %1312 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !37
  %1313 = load i32, i32* %1312, align 4, !dbg !38
  %1314 = shl i32 %1313, 1, !dbg !38
  store i32 %1314, i32* %1312, align 4, !dbg !38
  %1315 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !39
  %1316 = load i32, i32* %1315, align 4, !dbg !40
  %1317 = shl i32 %1316, 1, !dbg !40
  store i32 %1317, i32* %1315, align 4, !dbg !40
  %1318 = load i32, i32* %0, align 4, !dbg !41
  %1319 = and i32 %1318, 1, !dbg !43
  %1320 = icmp ne i32 %1319, 0, !dbg !43
  br i1 %1320, label %1321, label %1325, !dbg !44

1321:                                             ; preds = %1301
  %1322 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !45
  %1323 = load i32, i32* %1322, align 4, !dbg !46
  %1324 = or i32 %1323, 1, !dbg !46
  store i32 %1324, i32* %1322, align 4, !dbg !46
  br label %1325, !dbg !45

1325:                                             ; preds = %1321, %1301
  %1326 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !47
  %1327 = load i32, i32* %1326, align 4, !dbg !47
  %1328 = and i32 %1327, 1, !dbg !49
  %1329 = icmp ne i32 %1328, 0, !dbg !49
  br i1 %1329, label %1330, label %1334, !dbg !50

1330:                                             ; preds = %1325
  %1331 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !51
  %1332 = load i32, i32* %1331, align 4, !dbg !52
  %1333 = or i32 %1332, 1, !dbg !52
  store i32 %1333, i32* %1331, align 4, !dbg !52
  br label %1334, !dbg !51

1334:                                             ; preds = %1330, %1325
  %1335 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !53
  %1336 = load i32, i32* %1335, align 4, !dbg !53
  %1337 = and i32 %1336, 1, !dbg !55
  %1338 = icmp ne i32 %1337, 0, !dbg !55
  br i1 %1338, label %1339, label %1343, !dbg !56

1339:                                             ; preds = %1334
  %1340 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0, !dbg !57
  %1341 = load i32, i32* %1340, align 4, !dbg !58
  %1342 = or i32 %1341, 1, !dbg !58
  store i32 %1342, i32* %1340, align 4, !dbg !58
  br label %1343, !dbg !57

1343:                                             ; preds = %1339, %1334
  %1344 = load i32, i32* %0, align 4, !dbg !59
  %1345 = ashr i32 %1344, 1, !dbg !59
  store i32 %1345, i32* %0, align 4, !dbg !59
  %1346 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !60
  %1347 = load i32, i32* %1346, align 4, !dbg !61
  %1348 = ashr i32 %1347, 1, !dbg !61
  store i32 %1348, i32* %1346, align 4, !dbg !61
  %1349 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !62
  %1350 = load i32, i32* %1349, align 4, !dbg !63
  %1351 = ashr i32 %1350, 1, !dbg !63
  store i32 %1351, i32* %1349, align 4, !dbg !63
  call void @llvm.dbg.value(metadata i32 32, metadata !31, metadata !DIExpression()), !dbg !19
  %1352 = load i32, i32* %6, align 4, !dbg !19
  store i32 %1352, i32* %0, align 4, !dbg !64
  %1353 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1, !dbg !65
  %1354 = load i32, i32* %1353, align 4, !dbg !65
  %1355 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !66
  store i32 %1354, i32* %1355, align 4, !dbg !67
  %1356 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2, !dbg !68
  %1357 = load i32, i32* %1356, align 4, !dbg !68
  %1358 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !69
  store i32 %1357, i32* %1358, align 4, !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 !dbg !72 {
  %1 = alloca [3 x i32], align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %1, metadata !75, metadata !DIExpression()), !dbg !77
  %2 = bitcast [3 x i32]* %1 to i8*, !dbg !77
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 4 bitcast ([3 x i32]* @__const.main.a to i8*), i64 12, i1 false), !dbg !77
  %3 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 0, !dbg !78
  call void @mu(i32* %3), !dbg !79
  %4 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 0, !dbg !80
  %5 = load i32, i32* %4, align 4, !dbg !80
  %6 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 1, !dbg !81
  %7 = load i32, i32* %6, align 4, !dbg !81
  %8 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 2, !dbg !82
  %9 = load i32, i32* %8, align 4, !dbg !82
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %5, i32 %7, i32 %9), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "mu/sources/mu2.c", directory: "/home/luigi/dev/ufmg/static-analysis/side-channel/lif/llvm/bench")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"PIE Level", i32 2}
!8 = !{!"clang version 10.0.0 "}
!9 = distinct !DISubprogram(name: "mu", scope: !1, file: !1, line: 4, type: !10, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !14, line: 26, baseType: !15)
!14 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "")
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !16, line: 41, baseType: !17)
!16 = !DIFile(filename: "/usr/include/bits/types.h", directory: "")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 4, type: !12)
!19 = !DILocation(line: 0, scope: !9)
!20 = !DILocalVariable(name: "b", scope: !9, file: !1, line: 6, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 96, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 3)
!24 = !DILocation(line: 6, column: 13, scope: !9)
!25 = !DILocation(line: 7, column: 19, scope: !9)
!26 = !DILocation(line: 7, column: 24, scope: !9)
!27 = !DILocation(line: 7, column: 12, scope: !9)
!28 = !DILocation(line: 7, column: 17, scope: !9)
!29 = !DILocation(line: 7, column: 5, scope: !9)
!30 = !DILocation(line: 7, column: 10, scope: !9)
!31 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 5, type: !17)
!32 = !DILocation(line: 8, column: 5, scope: !33)
!33 = distinct !DILexicalBlock(scope: !9, file: !1, line: 8, column: 5)
!34 = !DILocation(line: 9, column: 14, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !1, line: 8, column: 30)
!36 = distinct !DILexicalBlock(scope: !33, file: !1, line: 8, column: 5)
!37 = !DILocation(line: 10, column: 9, scope: !35)
!38 = !DILocation(line: 10, column: 14, scope: !35)
!39 = !DILocation(line: 11, column: 9, scope: !35)
!40 = !DILocation(line: 11, column: 14, scope: !35)
!41 = !DILocation(line: 12, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !35, file: !1, line: 12, column: 13)
!43 = !DILocation(line: 12, column: 18, scope: !42)
!44 = !DILocation(line: 12, column: 13, scope: !35)
!45 = !DILocation(line: 12, column: 23, scope: !42)
!46 = !DILocation(line: 12, column: 28, scope: !42)
!47 = !DILocation(line: 13, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !35, file: !1, line: 13, column: 13)
!49 = !DILocation(line: 13, column: 18, scope: !48)
!50 = !DILocation(line: 13, column: 13, scope: !35)
!51 = !DILocation(line: 13, column: 23, scope: !48)
!52 = !DILocation(line: 13, column: 28, scope: !48)
!53 = !DILocation(line: 14, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !35, file: !1, line: 14, column: 13)
!55 = !DILocation(line: 14, column: 18, scope: !54)
!56 = !DILocation(line: 14, column: 13, scope: !35)
!57 = !DILocation(line: 14, column: 23, scope: !54)
!58 = !DILocation(line: 14, column: 28, scope: !54)
!59 = !DILocation(line: 15, column: 14, scope: !35)
!60 = !DILocation(line: 16, column: 9, scope: !35)
!61 = !DILocation(line: 16, column: 14, scope: !35)
!62 = !DILocation(line: 17, column: 9, scope: !35)
!63 = !DILocation(line: 17, column: 14, scope: !35)
!64 = !DILocation(line: 19, column: 10, scope: !9)
!65 = !DILocation(line: 20, column: 12, scope: !9)
!66 = !DILocation(line: 20, column: 5, scope: !9)
!67 = !DILocation(line: 20, column: 10, scope: !9)
!68 = !DILocation(line: 21, column: 12, scope: !9)
!69 = !DILocation(line: 21, column: 5, scope: !9)
!70 = !DILocation(line: 21, column: 10, scope: !9)
!71 = !DILocation(line: 22, column: 1, scope: !9)
!72 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 24, type: !73, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!17}
!75 = !DILocalVariable(name: "a", scope: !72, file: !1, line: 25, type: !76)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 96, elements: !22)
!77 = !DILocation(line: 25, column: 9, scope: !72)
!78 = !DILocation(line: 26, column: 8, scope: !72)
!79 = !DILocation(line: 26, column: 5, scope: !72)
!80 = !DILocation(line: 27, column: 28, scope: !72)
!81 = !DILocation(line: 27, column: 34, scope: !72)
!82 = !DILocation(line: 27, column: 40, scope: !72)
!83 = !DILocation(line: 27, column: 5, scope: !72)
!84 = !DILocation(line: 28, column: 1, scope: !72)

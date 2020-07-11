; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"%d\09%d\09%d\0A\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [3 x i32], align 4
  %2 = bitcast [3 x i32]* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 12, i1 false)
  %3 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 0
  call void @mu(i32* %3)
  %4 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 0
  %5 = load i32, i32* %4, align 4
  %6 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 1
  %7 = load i32, i32* %6, align 4
  %8 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 2
  %9 = load i32, i32* %8, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %5, i32 %7, i32 %9)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @mu(i32* %0) #0 {
  %2 = alloca [3 x i32], align 4
  %3 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  store i32 0, i32* %5, align 4
  %6 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %7 = load i32, i32* %6, align 4
  %8 = shl i32 %7, 1
  store i32 %8, i32* %6, align 4
  %9 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %10 = load i32, i32* %9, align 4
  %11 = shl i32 %10, 1
  store i32 %11, i32* %9, align 4
  %12 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %13 = load i32, i32* %12, align 4
  %14 = shl i32 %13, 1
  store i32 %14, i32* %12, align 4
  %15 = load i32, i32* %0, align 4
  %16 = and i32 %15, 1
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %22

18:                                               ; preds = %1
  %19 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %20 = load i32, i32* %19, align 4
  %21 = or i32 %20, 1
  store i32 %21, i32* %19, align 4
  br label %22

22:                                               ; preds = %18, %1
  %23 = getelementptr inbounds i32, i32* %0, i64 1
  %24 = load i32, i32* %23, align 4
  %25 = and i32 %24, 1
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %31

27:                                               ; preds = %22
  %28 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %29 = load i32, i32* %28, align 4
  %30 = or i32 %29, 1
  store i32 %30, i32* %28, align 4
  br label %31

31:                                               ; preds = %27, %22
  %32 = getelementptr inbounds i32, i32* %0, i64 2
  %33 = load i32, i32* %32, align 4
  %34 = and i32 %33, 1
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %40

36:                                               ; preds = %31
  %37 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %38 = load i32, i32* %37, align 4
  %39 = or i32 %38, 1
  store i32 %39, i32* %37, align 4
  br label %40

40:                                               ; preds = %36, %31
  %41 = load i32, i32* %0, align 4
  %42 = ashr i32 %41, 1
  store i32 %42, i32* %0, align 4
  %43 = getelementptr inbounds i32, i32* %0, i64 1
  %44 = load i32, i32* %43, align 4
  %45 = ashr i32 %44, 1
  store i32 %45, i32* %43, align 4
  %46 = getelementptr inbounds i32, i32* %0, i64 2
  %47 = load i32, i32* %46, align 4
  %48 = ashr i32 %47, 1
  store i32 %48, i32* %46, align 4
  %49 = load i32, i32* %6, align 4
  %50 = shl i32 %49, 1
  store i32 %50, i32* %6, align 4
  %51 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %52 = load i32, i32* %51, align 4
  %53 = shl i32 %52, 1
  store i32 %53, i32* %51, align 4
  %54 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %55 = load i32, i32* %54, align 4
  %56 = shl i32 %55, 1
  store i32 %56, i32* %54, align 4
  %57 = load i32, i32* %0, align 4
  %58 = and i32 %57, 1
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %64

60:                                               ; preds = %40
  %61 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %62 = load i32, i32* %61, align 4
  %63 = or i32 %62, 1
  store i32 %63, i32* %61, align 4
  br label %64

64:                                               ; preds = %60, %40
  %65 = getelementptr inbounds i32, i32* %0, i64 1
  %66 = load i32, i32* %65, align 4
  %67 = and i32 %66, 1
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %73

69:                                               ; preds = %64
  %70 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %71 = load i32, i32* %70, align 4
  %72 = or i32 %71, 1
  store i32 %72, i32* %70, align 4
  br label %73

73:                                               ; preds = %69, %64
  %74 = getelementptr inbounds i32, i32* %0, i64 2
  %75 = load i32, i32* %74, align 4
  %76 = and i32 %75, 1
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %82

78:                                               ; preds = %73
  %79 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %80 = load i32, i32* %79, align 4
  %81 = or i32 %80, 1
  store i32 %81, i32* %79, align 4
  br label %82

82:                                               ; preds = %78, %73
  %83 = load i32, i32* %0, align 4
  %84 = ashr i32 %83, 1
  store i32 %84, i32* %0, align 4
  %85 = getelementptr inbounds i32, i32* %0, i64 1
  %86 = load i32, i32* %85, align 4
  %87 = ashr i32 %86, 1
  store i32 %87, i32* %85, align 4
  %88 = getelementptr inbounds i32, i32* %0, i64 2
  %89 = load i32, i32* %88, align 4
  %90 = ashr i32 %89, 1
  store i32 %90, i32* %88, align 4
  %91 = load i32, i32* %6, align 4
  %92 = shl i32 %91, 1
  store i32 %92, i32* %6, align 4
  %93 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %94 = load i32, i32* %93, align 4
  %95 = shl i32 %94, 1
  store i32 %95, i32* %93, align 4
  %96 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %97 = load i32, i32* %96, align 4
  %98 = shl i32 %97, 1
  store i32 %98, i32* %96, align 4
  %99 = load i32, i32* %0, align 4
  %100 = and i32 %99, 1
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %102, label %106

102:                                              ; preds = %82
  %103 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %104 = load i32, i32* %103, align 4
  %105 = or i32 %104, 1
  store i32 %105, i32* %103, align 4
  br label %106

106:                                              ; preds = %102, %82
  %107 = getelementptr inbounds i32, i32* %0, i64 1
  %108 = load i32, i32* %107, align 4
  %109 = and i32 %108, 1
  %110 = icmp ne i32 %109, 0
  br i1 %110, label %111, label %115

111:                                              ; preds = %106
  %112 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %113 = load i32, i32* %112, align 4
  %114 = or i32 %113, 1
  store i32 %114, i32* %112, align 4
  br label %115

115:                                              ; preds = %111, %106
  %116 = getelementptr inbounds i32, i32* %0, i64 2
  %117 = load i32, i32* %116, align 4
  %118 = and i32 %117, 1
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %120, label %124

120:                                              ; preds = %115
  %121 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %122 = load i32, i32* %121, align 4
  %123 = or i32 %122, 1
  store i32 %123, i32* %121, align 4
  br label %124

124:                                              ; preds = %120, %115
  %125 = load i32, i32* %0, align 4
  %126 = ashr i32 %125, 1
  store i32 %126, i32* %0, align 4
  %127 = getelementptr inbounds i32, i32* %0, i64 1
  %128 = load i32, i32* %127, align 4
  %129 = ashr i32 %128, 1
  store i32 %129, i32* %127, align 4
  %130 = getelementptr inbounds i32, i32* %0, i64 2
  %131 = load i32, i32* %130, align 4
  %132 = ashr i32 %131, 1
  store i32 %132, i32* %130, align 4
  %133 = load i32, i32* %6, align 4
  %134 = shl i32 %133, 1
  store i32 %134, i32* %6, align 4
  %135 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %136 = load i32, i32* %135, align 4
  %137 = shl i32 %136, 1
  store i32 %137, i32* %135, align 4
  %138 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %139 = load i32, i32* %138, align 4
  %140 = shl i32 %139, 1
  store i32 %140, i32* %138, align 4
  %141 = load i32, i32* %0, align 4
  %142 = and i32 %141, 1
  %143 = icmp ne i32 %142, 0
  br i1 %143, label %144, label %148

144:                                              ; preds = %124
  %145 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %146 = load i32, i32* %145, align 4
  %147 = or i32 %146, 1
  store i32 %147, i32* %145, align 4
  br label %148

148:                                              ; preds = %144, %124
  %149 = getelementptr inbounds i32, i32* %0, i64 1
  %150 = load i32, i32* %149, align 4
  %151 = and i32 %150, 1
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %153, label %157

153:                                              ; preds = %148
  %154 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %155 = load i32, i32* %154, align 4
  %156 = or i32 %155, 1
  store i32 %156, i32* %154, align 4
  br label %157

157:                                              ; preds = %153, %148
  %158 = getelementptr inbounds i32, i32* %0, i64 2
  %159 = load i32, i32* %158, align 4
  %160 = and i32 %159, 1
  %161 = icmp ne i32 %160, 0
  br i1 %161, label %162, label %166

162:                                              ; preds = %157
  %163 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %164 = load i32, i32* %163, align 4
  %165 = or i32 %164, 1
  store i32 %165, i32* %163, align 4
  br label %166

166:                                              ; preds = %162, %157
  %167 = load i32, i32* %0, align 4
  %168 = ashr i32 %167, 1
  store i32 %168, i32* %0, align 4
  %169 = getelementptr inbounds i32, i32* %0, i64 1
  %170 = load i32, i32* %169, align 4
  %171 = ashr i32 %170, 1
  store i32 %171, i32* %169, align 4
  %172 = getelementptr inbounds i32, i32* %0, i64 2
  %173 = load i32, i32* %172, align 4
  %174 = ashr i32 %173, 1
  store i32 %174, i32* %172, align 4
  %175 = load i32, i32* %6, align 4
  %176 = shl i32 %175, 1
  store i32 %176, i32* %6, align 4
  %177 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %178 = load i32, i32* %177, align 4
  %179 = shl i32 %178, 1
  store i32 %179, i32* %177, align 4
  %180 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %181 = load i32, i32* %180, align 4
  %182 = shl i32 %181, 1
  store i32 %182, i32* %180, align 4
  %183 = load i32, i32* %0, align 4
  %184 = and i32 %183, 1
  %185 = icmp ne i32 %184, 0
  br i1 %185, label %186, label %190

186:                                              ; preds = %166
  %187 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %188 = load i32, i32* %187, align 4
  %189 = or i32 %188, 1
  store i32 %189, i32* %187, align 4
  br label %190

190:                                              ; preds = %186, %166
  %191 = getelementptr inbounds i32, i32* %0, i64 1
  %192 = load i32, i32* %191, align 4
  %193 = and i32 %192, 1
  %194 = icmp ne i32 %193, 0
  br i1 %194, label %195, label %199

195:                                              ; preds = %190
  %196 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %197 = load i32, i32* %196, align 4
  %198 = or i32 %197, 1
  store i32 %198, i32* %196, align 4
  br label %199

199:                                              ; preds = %195, %190
  %200 = getelementptr inbounds i32, i32* %0, i64 2
  %201 = load i32, i32* %200, align 4
  %202 = and i32 %201, 1
  %203 = icmp ne i32 %202, 0
  br i1 %203, label %204, label %208

204:                                              ; preds = %199
  %205 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %206 = load i32, i32* %205, align 4
  %207 = or i32 %206, 1
  store i32 %207, i32* %205, align 4
  br label %208

208:                                              ; preds = %204, %199
  %209 = load i32, i32* %0, align 4
  %210 = ashr i32 %209, 1
  store i32 %210, i32* %0, align 4
  %211 = getelementptr inbounds i32, i32* %0, i64 1
  %212 = load i32, i32* %211, align 4
  %213 = ashr i32 %212, 1
  store i32 %213, i32* %211, align 4
  %214 = getelementptr inbounds i32, i32* %0, i64 2
  %215 = load i32, i32* %214, align 4
  %216 = ashr i32 %215, 1
  store i32 %216, i32* %214, align 4
  %217 = load i32, i32* %6, align 4
  %218 = shl i32 %217, 1
  store i32 %218, i32* %6, align 4
  %219 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %220 = load i32, i32* %219, align 4
  %221 = shl i32 %220, 1
  store i32 %221, i32* %219, align 4
  %222 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %223 = load i32, i32* %222, align 4
  %224 = shl i32 %223, 1
  store i32 %224, i32* %222, align 4
  %225 = load i32, i32* %0, align 4
  %226 = and i32 %225, 1
  %227 = icmp ne i32 %226, 0
  br i1 %227, label %228, label %232

228:                                              ; preds = %208
  %229 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %230 = load i32, i32* %229, align 4
  %231 = or i32 %230, 1
  store i32 %231, i32* %229, align 4
  br label %232

232:                                              ; preds = %228, %208
  %233 = getelementptr inbounds i32, i32* %0, i64 1
  %234 = load i32, i32* %233, align 4
  %235 = and i32 %234, 1
  %236 = icmp ne i32 %235, 0
  br i1 %236, label %237, label %241

237:                                              ; preds = %232
  %238 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %239 = load i32, i32* %238, align 4
  %240 = or i32 %239, 1
  store i32 %240, i32* %238, align 4
  br label %241

241:                                              ; preds = %237, %232
  %242 = getelementptr inbounds i32, i32* %0, i64 2
  %243 = load i32, i32* %242, align 4
  %244 = and i32 %243, 1
  %245 = icmp ne i32 %244, 0
  br i1 %245, label %246, label %250

246:                                              ; preds = %241
  %247 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %248 = load i32, i32* %247, align 4
  %249 = or i32 %248, 1
  store i32 %249, i32* %247, align 4
  br label %250

250:                                              ; preds = %246, %241
  %251 = load i32, i32* %0, align 4
  %252 = ashr i32 %251, 1
  store i32 %252, i32* %0, align 4
  %253 = getelementptr inbounds i32, i32* %0, i64 1
  %254 = load i32, i32* %253, align 4
  %255 = ashr i32 %254, 1
  store i32 %255, i32* %253, align 4
  %256 = getelementptr inbounds i32, i32* %0, i64 2
  %257 = load i32, i32* %256, align 4
  %258 = ashr i32 %257, 1
  store i32 %258, i32* %256, align 4
  %259 = load i32, i32* %6, align 4
  %260 = shl i32 %259, 1
  store i32 %260, i32* %6, align 4
  %261 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %262 = load i32, i32* %261, align 4
  %263 = shl i32 %262, 1
  store i32 %263, i32* %261, align 4
  %264 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %265 = load i32, i32* %264, align 4
  %266 = shl i32 %265, 1
  store i32 %266, i32* %264, align 4
  %267 = load i32, i32* %0, align 4
  %268 = and i32 %267, 1
  %269 = icmp ne i32 %268, 0
  br i1 %269, label %270, label %274

270:                                              ; preds = %250
  %271 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %272 = load i32, i32* %271, align 4
  %273 = or i32 %272, 1
  store i32 %273, i32* %271, align 4
  br label %274

274:                                              ; preds = %270, %250
  %275 = getelementptr inbounds i32, i32* %0, i64 1
  %276 = load i32, i32* %275, align 4
  %277 = and i32 %276, 1
  %278 = icmp ne i32 %277, 0
  br i1 %278, label %279, label %283

279:                                              ; preds = %274
  %280 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %281 = load i32, i32* %280, align 4
  %282 = or i32 %281, 1
  store i32 %282, i32* %280, align 4
  br label %283

283:                                              ; preds = %279, %274
  %284 = getelementptr inbounds i32, i32* %0, i64 2
  %285 = load i32, i32* %284, align 4
  %286 = and i32 %285, 1
  %287 = icmp ne i32 %286, 0
  br i1 %287, label %288, label %292

288:                                              ; preds = %283
  %289 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %290 = load i32, i32* %289, align 4
  %291 = or i32 %290, 1
  store i32 %291, i32* %289, align 4
  br label %292

292:                                              ; preds = %288, %283
  %293 = load i32, i32* %0, align 4
  %294 = ashr i32 %293, 1
  store i32 %294, i32* %0, align 4
  %295 = getelementptr inbounds i32, i32* %0, i64 1
  %296 = load i32, i32* %295, align 4
  %297 = ashr i32 %296, 1
  store i32 %297, i32* %295, align 4
  %298 = getelementptr inbounds i32, i32* %0, i64 2
  %299 = load i32, i32* %298, align 4
  %300 = ashr i32 %299, 1
  store i32 %300, i32* %298, align 4
  %301 = load i32, i32* %6, align 4
  %302 = shl i32 %301, 1
  store i32 %302, i32* %6, align 4
  %303 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %304 = load i32, i32* %303, align 4
  %305 = shl i32 %304, 1
  store i32 %305, i32* %303, align 4
  %306 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %307 = load i32, i32* %306, align 4
  %308 = shl i32 %307, 1
  store i32 %308, i32* %306, align 4
  %309 = load i32, i32* %0, align 4
  %310 = and i32 %309, 1
  %311 = icmp ne i32 %310, 0
  br i1 %311, label %312, label %316

312:                                              ; preds = %292
  %313 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %314 = load i32, i32* %313, align 4
  %315 = or i32 %314, 1
  store i32 %315, i32* %313, align 4
  br label %316

316:                                              ; preds = %312, %292
  %317 = getelementptr inbounds i32, i32* %0, i64 1
  %318 = load i32, i32* %317, align 4
  %319 = and i32 %318, 1
  %320 = icmp ne i32 %319, 0
  br i1 %320, label %321, label %325

321:                                              ; preds = %316
  %322 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %323 = load i32, i32* %322, align 4
  %324 = or i32 %323, 1
  store i32 %324, i32* %322, align 4
  br label %325

325:                                              ; preds = %321, %316
  %326 = getelementptr inbounds i32, i32* %0, i64 2
  %327 = load i32, i32* %326, align 4
  %328 = and i32 %327, 1
  %329 = icmp ne i32 %328, 0
  br i1 %329, label %330, label %334

330:                                              ; preds = %325
  %331 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %332 = load i32, i32* %331, align 4
  %333 = or i32 %332, 1
  store i32 %333, i32* %331, align 4
  br label %334

334:                                              ; preds = %330, %325
  %335 = load i32, i32* %0, align 4
  %336 = ashr i32 %335, 1
  store i32 %336, i32* %0, align 4
  %337 = getelementptr inbounds i32, i32* %0, i64 1
  %338 = load i32, i32* %337, align 4
  %339 = ashr i32 %338, 1
  store i32 %339, i32* %337, align 4
  %340 = getelementptr inbounds i32, i32* %0, i64 2
  %341 = load i32, i32* %340, align 4
  %342 = ashr i32 %341, 1
  store i32 %342, i32* %340, align 4
  %343 = load i32, i32* %6, align 4
  %344 = shl i32 %343, 1
  store i32 %344, i32* %6, align 4
  %345 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %346 = load i32, i32* %345, align 4
  %347 = shl i32 %346, 1
  store i32 %347, i32* %345, align 4
  %348 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %349 = load i32, i32* %348, align 4
  %350 = shl i32 %349, 1
  store i32 %350, i32* %348, align 4
  %351 = load i32, i32* %0, align 4
  %352 = and i32 %351, 1
  %353 = icmp ne i32 %352, 0
  br i1 %353, label %354, label %358

354:                                              ; preds = %334
  %355 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %356 = load i32, i32* %355, align 4
  %357 = or i32 %356, 1
  store i32 %357, i32* %355, align 4
  br label %358

358:                                              ; preds = %354, %334
  %359 = getelementptr inbounds i32, i32* %0, i64 1
  %360 = load i32, i32* %359, align 4
  %361 = and i32 %360, 1
  %362 = icmp ne i32 %361, 0
  br i1 %362, label %363, label %367

363:                                              ; preds = %358
  %364 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %365 = load i32, i32* %364, align 4
  %366 = or i32 %365, 1
  store i32 %366, i32* %364, align 4
  br label %367

367:                                              ; preds = %363, %358
  %368 = getelementptr inbounds i32, i32* %0, i64 2
  %369 = load i32, i32* %368, align 4
  %370 = and i32 %369, 1
  %371 = icmp ne i32 %370, 0
  br i1 %371, label %372, label %376

372:                                              ; preds = %367
  %373 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %374 = load i32, i32* %373, align 4
  %375 = or i32 %374, 1
  store i32 %375, i32* %373, align 4
  br label %376

376:                                              ; preds = %372, %367
  %377 = load i32, i32* %0, align 4
  %378 = ashr i32 %377, 1
  store i32 %378, i32* %0, align 4
  %379 = getelementptr inbounds i32, i32* %0, i64 1
  %380 = load i32, i32* %379, align 4
  %381 = ashr i32 %380, 1
  store i32 %381, i32* %379, align 4
  %382 = getelementptr inbounds i32, i32* %0, i64 2
  %383 = load i32, i32* %382, align 4
  %384 = ashr i32 %383, 1
  store i32 %384, i32* %382, align 4
  %385 = load i32, i32* %6, align 4
  %386 = shl i32 %385, 1
  store i32 %386, i32* %6, align 4
  %387 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %388 = load i32, i32* %387, align 4
  %389 = shl i32 %388, 1
  store i32 %389, i32* %387, align 4
  %390 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %391 = load i32, i32* %390, align 4
  %392 = shl i32 %391, 1
  store i32 %392, i32* %390, align 4
  %393 = load i32, i32* %0, align 4
  %394 = and i32 %393, 1
  %395 = icmp ne i32 %394, 0
  br i1 %395, label %396, label %400

396:                                              ; preds = %376
  %397 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %398 = load i32, i32* %397, align 4
  %399 = or i32 %398, 1
  store i32 %399, i32* %397, align 4
  br label %400

400:                                              ; preds = %396, %376
  %401 = getelementptr inbounds i32, i32* %0, i64 1
  %402 = load i32, i32* %401, align 4
  %403 = and i32 %402, 1
  %404 = icmp ne i32 %403, 0
  br i1 %404, label %405, label %409

405:                                              ; preds = %400
  %406 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %407 = load i32, i32* %406, align 4
  %408 = or i32 %407, 1
  store i32 %408, i32* %406, align 4
  br label %409

409:                                              ; preds = %405, %400
  %410 = getelementptr inbounds i32, i32* %0, i64 2
  %411 = load i32, i32* %410, align 4
  %412 = and i32 %411, 1
  %413 = icmp ne i32 %412, 0
  br i1 %413, label %414, label %418

414:                                              ; preds = %409
  %415 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %416 = load i32, i32* %415, align 4
  %417 = or i32 %416, 1
  store i32 %417, i32* %415, align 4
  br label %418

418:                                              ; preds = %414, %409
  %419 = load i32, i32* %0, align 4
  %420 = ashr i32 %419, 1
  store i32 %420, i32* %0, align 4
  %421 = getelementptr inbounds i32, i32* %0, i64 1
  %422 = load i32, i32* %421, align 4
  %423 = ashr i32 %422, 1
  store i32 %423, i32* %421, align 4
  %424 = getelementptr inbounds i32, i32* %0, i64 2
  %425 = load i32, i32* %424, align 4
  %426 = ashr i32 %425, 1
  store i32 %426, i32* %424, align 4
  %427 = load i32, i32* %6, align 4
  %428 = shl i32 %427, 1
  store i32 %428, i32* %6, align 4
  %429 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %430 = load i32, i32* %429, align 4
  %431 = shl i32 %430, 1
  store i32 %431, i32* %429, align 4
  %432 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %433 = load i32, i32* %432, align 4
  %434 = shl i32 %433, 1
  store i32 %434, i32* %432, align 4
  %435 = load i32, i32* %0, align 4
  %436 = and i32 %435, 1
  %437 = icmp ne i32 %436, 0
  br i1 %437, label %438, label %442

438:                                              ; preds = %418
  %439 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %440 = load i32, i32* %439, align 4
  %441 = or i32 %440, 1
  store i32 %441, i32* %439, align 4
  br label %442

442:                                              ; preds = %438, %418
  %443 = getelementptr inbounds i32, i32* %0, i64 1
  %444 = load i32, i32* %443, align 4
  %445 = and i32 %444, 1
  %446 = icmp ne i32 %445, 0
  br i1 %446, label %447, label %451

447:                                              ; preds = %442
  %448 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %449 = load i32, i32* %448, align 4
  %450 = or i32 %449, 1
  store i32 %450, i32* %448, align 4
  br label %451

451:                                              ; preds = %447, %442
  %452 = getelementptr inbounds i32, i32* %0, i64 2
  %453 = load i32, i32* %452, align 4
  %454 = and i32 %453, 1
  %455 = icmp ne i32 %454, 0
  br i1 %455, label %456, label %460

456:                                              ; preds = %451
  %457 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %458 = load i32, i32* %457, align 4
  %459 = or i32 %458, 1
  store i32 %459, i32* %457, align 4
  br label %460

460:                                              ; preds = %456, %451
  %461 = load i32, i32* %0, align 4
  %462 = ashr i32 %461, 1
  store i32 %462, i32* %0, align 4
  %463 = getelementptr inbounds i32, i32* %0, i64 1
  %464 = load i32, i32* %463, align 4
  %465 = ashr i32 %464, 1
  store i32 %465, i32* %463, align 4
  %466 = getelementptr inbounds i32, i32* %0, i64 2
  %467 = load i32, i32* %466, align 4
  %468 = ashr i32 %467, 1
  store i32 %468, i32* %466, align 4
  %469 = load i32, i32* %6, align 4
  %470 = shl i32 %469, 1
  store i32 %470, i32* %6, align 4
  %471 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %472 = load i32, i32* %471, align 4
  %473 = shl i32 %472, 1
  store i32 %473, i32* %471, align 4
  %474 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %475 = load i32, i32* %474, align 4
  %476 = shl i32 %475, 1
  store i32 %476, i32* %474, align 4
  %477 = load i32, i32* %0, align 4
  %478 = and i32 %477, 1
  %479 = icmp ne i32 %478, 0
  br i1 %479, label %480, label %484

480:                                              ; preds = %460
  %481 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %482 = load i32, i32* %481, align 4
  %483 = or i32 %482, 1
  store i32 %483, i32* %481, align 4
  br label %484

484:                                              ; preds = %480, %460
  %485 = getelementptr inbounds i32, i32* %0, i64 1
  %486 = load i32, i32* %485, align 4
  %487 = and i32 %486, 1
  %488 = icmp ne i32 %487, 0
  br i1 %488, label %489, label %493

489:                                              ; preds = %484
  %490 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %491 = load i32, i32* %490, align 4
  %492 = or i32 %491, 1
  store i32 %492, i32* %490, align 4
  br label %493

493:                                              ; preds = %489, %484
  %494 = getelementptr inbounds i32, i32* %0, i64 2
  %495 = load i32, i32* %494, align 4
  %496 = and i32 %495, 1
  %497 = icmp ne i32 %496, 0
  br i1 %497, label %498, label %502

498:                                              ; preds = %493
  %499 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %500 = load i32, i32* %499, align 4
  %501 = or i32 %500, 1
  store i32 %501, i32* %499, align 4
  br label %502

502:                                              ; preds = %498, %493
  %503 = load i32, i32* %0, align 4
  %504 = ashr i32 %503, 1
  store i32 %504, i32* %0, align 4
  %505 = getelementptr inbounds i32, i32* %0, i64 1
  %506 = load i32, i32* %505, align 4
  %507 = ashr i32 %506, 1
  store i32 %507, i32* %505, align 4
  %508 = getelementptr inbounds i32, i32* %0, i64 2
  %509 = load i32, i32* %508, align 4
  %510 = ashr i32 %509, 1
  store i32 %510, i32* %508, align 4
  %511 = load i32, i32* %6, align 4
  %512 = shl i32 %511, 1
  store i32 %512, i32* %6, align 4
  %513 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %514 = load i32, i32* %513, align 4
  %515 = shl i32 %514, 1
  store i32 %515, i32* %513, align 4
  %516 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %517 = load i32, i32* %516, align 4
  %518 = shl i32 %517, 1
  store i32 %518, i32* %516, align 4
  %519 = load i32, i32* %0, align 4
  %520 = and i32 %519, 1
  %521 = icmp ne i32 %520, 0
  br i1 %521, label %522, label %526

522:                                              ; preds = %502
  %523 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %524 = load i32, i32* %523, align 4
  %525 = or i32 %524, 1
  store i32 %525, i32* %523, align 4
  br label %526

526:                                              ; preds = %522, %502
  %527 = getelementptr inbounds i32, i32* %0, i64 1
  %528 = load i32, i32* %527, align 4
  %529 = and i32 %528, 1
  %530 = icmp ne i32 %529, 0
  br i1 %530, label %531, label %535

531:                                              ; preds = %526
  %532 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %533 = load i32, i32* %532, align 4
  %534 = or i32 %533, 1
  store i32 %534, i32* %532, align 4
  br label %535

535:                                              ; preds = %531, %526
  %536 = getelementptr inbounds i32, i32* %0, i64 2
  %537 = load i32, i32* %536, align 4
  %538 = and i32 %537, 1
  %539 = icmp ne i32 %538, 0
  br i1 %539, label %540, label %544

540:                                              ; preds = %535
  %541 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %542 = load i32, i32* %541, align 4
  %543 = or i32 %542, 1
  store i32 %543, i32* %541, align 4
  br label %544

544:                                              ; preds = %540, %535
  %545 = load i32, i32* %0, align 4
  %546 = ashr i32 %545, 1
  store i32 %546, i32* %0, align 4
  %547 = getelementptr inbounds i32, i32* %0, i64 1
  %548 = load i32, i32* %547, align 4
  %549 = ashr i32 %548, 1
  store i32 %549, i32* %547, align 4
  %550 = getelementptr inbounds i32, i32* %0, i64 2
  %551 = load i32, i32* %550, align 4
  %552 = ashr i32 %551, 1
  store i32 %552, i32* %550, align 4
  %553 = load i32, i32* %6, align 4
  %554 = shl i32 %553, 1
  store i32 %554, i32* %6, align 4
  %555 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %556 = load i32, i32* %555, align 4
  %557 = shl i32 %556, 1
  store i32 %557, i32* %555, align 4
  %558 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %559 = load i32, i32* %558, align 4
  %560 = shl i32 %559, 1
  store i32 %560, i32* %558, align 4
  %561 = load i32, i32* %0, align 4
  %562 = and i32 %561, 1
  %563 = icmp ne i32 %562, 0
  br i1 %563, label %564, label %568

564:                                              ; preds = %544
  %565 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %566 = load i32, i32* %565, align 4
  %567 = or i32 %566, 1
  store i32 %567, i32* %565, align 4
  br label %568

568:                                              ; preds = %564, %544
  %569 = getelementptr inbounds i32, i32* %0, i64 1
  %570 = load i32, i32* %569, align 4
  %571 = and i32 %570, 1
  %572 = icmp ne i32 %571, 0
  br i1 %572, label %573, label %577

573:                                              ; preds = %568
  %574 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %575 = load i32, i32* %574, align 4
  %576 = or i32 %575, 1
  store i32 %576, i32* %574, align 4
  br label %577

577:                                              ; preds = %573, %568
  %578 = getelementptr inbounds i32, i32* %0, i64 2
  %579 = load i32, i32* %578, align 4
  %580 = and i32 %579, 1
  %581 = icmp ne i32 %580, 0
  br i1 %581, label %582, label %586

582:                                              ; preds = %577
  %583 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %584 = load i32, i32* %583, align 4
  %585 = or i32 %584, 1
  store i32 %585, i32* %583, align 4
  br label %586

586:                                              ; preds = %582, %577
  %587 = load i32, i32* %0, align 4
  %588 = ashr i32 %587, 1
  store i32 %588, i32* %0, align 4
  %589 = getelementptr inbounds i32, i32* %0, i64 1
  %590 = load i32, i32* %589, align 4
  %591 = ashr i32 %590, 1
  store i32 %591, i32* %589, align 4
  %592 = getelementptr inbounds i32, i32* %0, i64 2
  %593 = load i32, i32* %592, align 4
  %594 = ashr i32 %593, 1
  store i32 %594, i32* %592, align 4
  %595 = load i32, i32* %6, align 4
  %596 = shl i32 %595, 1
  store i32 %596, i32* %6, align 4
  %597 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %598 = load i32, i32* %597, align 4
  %599 = shl i32 %598, 1
  store i32 %599, i32* %597, align 4
  %600 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %601 = load i32, i32* %600, align 4
  %602 = shl i32 %601, 1
  store i32 %602, i32* %600, align 4
  %603 = load i32, i32* %0, align 4
  %604 = and i32 %603, 1
  %605 = icmp ne i32 %604, 0
  br i1 %605, label %606, label %610

606:                                              ; preds = %586
  %607 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %608 = load i32, i32* %607, align 4
  %609 = or i32 %608, 1
  store i32 %609, i32* %607, align 4
  br label %610

610:                                              ; preds = %606, %586
  %611 = getelementptr inbounds i32, i32* %0, i64 1
  %612 = load i32, i32* %611, align 4
  %613 = and i32 %612, 1
  %614 = icmp ne i32 %613, 0
  br i1 %614, label %615, label %619

615:                                              ; preds = %610
  %616 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %617 = load i32, i32* %616, align 4
  %618 = or i32 %617, 1
  store i32 %618, i32* %616, align 4
  br label %619

619:                                              ; preds = %615, %610
  %620 = getelementptr inbounds i32, i32* %0, i64 2
  %621 = load i32, i32* %620, align 4
  %622 = and i32 %621, 1
  %623 = icmp ne i32 %622, 0
  br i1 %623, label %624, label %628

624:                                              ; preds = %619
  %625 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %626 = load i32, i32* %625, align 4
  %627 = or i32 %626, 1
  store i32 %627, i32* %625, align 4
  br label %628

628:                                              ; preds = %624, %619
  %629 = load i32, i32* %0, align 4
  %630 = ashr i32 %629, 1
  store i32 %630, i32* %0, align 4
  %631 = getelementptr inbounds i32, i32* %0, i64 1
  %632 = load i32, i32* %631, align 4
  %633 = ashr i32 %632, 1
  store i32 %633, i32* %631, align 4
  %634 = getelementptr inbounds i32, i32* %0, i64 2
  %635 = load i32, i32* %634, align 4
  %636 = ashr i32 %635, 1
  store i32 %636, i32* %634, align 4
  %637 = load i32, i32* %6, align 4
  %638 = shl i32 %637, 1
  store i32 %638, i32* %6, align 4
  %639 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %640 = load i32, i32* %639, align 4
  %641 = shl i32 %640, 1
  store i32 %641, i32* %639, align 4
  %642 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %643 = load i32, i32* %642, align 4
  %644 = shl i32 %643, 1
  store i32 %644, i32* %642, align 4
  %645 = load i32, i32* %0, align 4
  %646 = and i32 %645, 1
  %647 = icmp ne i32 %646, 0
  br i1 %647, label %648, label %652

648:                                              ; preds = %628
  %649 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %650 = load i32, i32* %649, align 4
  %651 = or i32 %650, 1
  store i32 %651, i32* %649, align 4
  br label %652

652:                                              ; preds = %648, %628
  %653 = getelementptr inbounds i32, i32* %0, i64 1
  %654 = load i32, i32* %653, align 4
  %655 = and i32 %654, 1
  %656 = icmp ne i32 %655, 0
  br i1 %656, label %657, label %661

657:                                              ; preds = %652
  %658 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %659 = load i32, i32* %658, align 4
  %660 = or i32 %659, 1
  store i32 %660, i32* %658, align 4
  br label %661

661:                                              ; preds = %657, %652
  %662 = getelementptr inbounds i32, i32* %0, i64 2
  %663 = load i32, i32* %662, align 4
  %664 = and i32 %663, 1
  %665 = icmp ne i32 %664, 0
  br i1 %665, label %666, label %670

666:                                              ; preds = %661
  %667 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %668 = load i32, i32* %667, align 4
  %669 = or i32 %668, 1
  store i32 %669, i32* %667, align 4
  br label %670

670:                                              ; preds = %666, %661
  %671 = load i32, i32* %0, align 4
  %672 = ashr i32 %671, 1
  store i32 %672, i32* %0, align 4
  %673 = getelementptr inbounds i32, i32* %0, i64 1
  %674 = load i32, i32* %673, align 4
  %675 = ashr i32 %674, 1
  store i32 %675, i32* %673, align 4
  %676 = getelementptr inbounds i32, i32* %0, i64 2
  %677 = load i32, i32* %676, align 4
  %678 = ashr i32 %677, 1
  store i32 %678, i32* %676, align 4
  %679 = load i32, i32* %6, align 4
  %680 = shl i32 %679, 1
  store i32 %680, i32* %6, align 4
  %681 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %682 = load i32, i32* %681, align 4
  %683 = shl i32 %682, 1
  store i32 %683, i32* %681, align 4
  %684 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %685 = load i32, i32* %684, align 4
  %686 = shl i32 %685, 1
  store i32 %686, i32* %684, align 4
  %687 = load i32, i32* %0, align 4
  %688 = and i32 %687, 1
  %689 = icmp ne i32 %688, 0
  br i1 %689, label %690, label %694

690:                                              ; preds = %670
  %691 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %692 = load i32, i32* %691, align 4
  %693 = or i32 %692, 1
  store i32 %693, i32* %691, align 4
  br label %694

694:                                              ; preds = %690, %670
  %695 = getelementptr inbounds i32, i32* %0, i64 1
  %696 = load i32, i32* %695, align 4
  %697 = and i32 %696, 1
  %698 = icmp ne i32 %697, 0
  br i1 %698, label %699, label %703

699:                                              ; preds = %694
  %700 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %701 = load i32, i32* %700, align 4
  %702 = or i32 %701, 1
  store i32 %702, i32* %700, align 4
  br label %703

703:                                              ; preds = %699, %694
  %704 = getelementptr inbounds i32, i32* %0, i64 2
  %705 = load i32, i32* %704, align 4
  %706 = and i32 %705, 1
  %707 = icmp ne i32 %706, 0
  br i1 %707, label %708, label %712

708:                                              ; preds = %703
  %709 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %710 = load i32, i32* %709, align 4
  %711 = or i32 %710, 1
  store i32 %711, i32* %709, align 4
  br label %712

712:                                              ; preds = %708, %703
  %713 = load i32, i32* %0, align 4
  %714 = ashr i32 %713, 1
  store i32 %714, i32* %0, align 4
  %715 = getelementptr inbounds i32, i32* %0, i64 1
  %716 = load i32, i32* %715, align 4
  %717 = ashr i32 %716, 1
  store i32 %717, i32* %715, align 4
  %718 = getelementptr inbounds i32, i32* %0, i64 2
  %719 = load i32, i32* %718, align 4
  %720 = ashr i32 %719, 1
  store i32 %720, i32* %718, align 4
  %721 = load i32, i32* %6, align 4
  %722 = shl i32 %721, 1
  store i32 %722, i32* %6, align 4
  %723 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %724 = load i32, i32* %723, align 4
  %725 = shl i32 %724, 1
  store i32 %725, i32* %723, align 4
  %726 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %727 = load i32, i32* %726, align 4
  %728 = shl i32 %727, 1
  store i32 %728, i32* %726, align 4
  %729 = load i32, i32* %0, align 4
  %730 = and i32 %729, 1
  %731 = icmp ne i32 %730, 0
  br i1 %731, label %732, label %736

732:                                              ; preds = %712
  %733 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %734 = load i32, i32* %733, align 4
  %735 = or i32 %734, 1
  store i32 %735, i32* %733, align 4
  br label %736

736:                                              ; preds = %732, %712
  %737 = getelementptr inbounds i32, i32* %0, i64 1
  %738 = load i32, i32* %737, align 4
  %739 = and i32 %738, 1
  %740 = icmp ne i32 %739, 0
  br i1 %740, label %741, label %745

741:                                              ; preds = %736
  %742 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %743 = load i32, i32* %742, align 4
  %744 = or i32 %743, 1
  store i32 %744, i32* %742, align 4
  br label %745

745:                                              ; preds = %741, %736
  %746 = getelementptr inbounds i32, i32* %0, i64 2
  %747 = load i32, i32* %746, align 4
  %748 = and i32 %747, 1
  %749 = icmp ne i32 %748, 0
  br i1 %749, label %750, label %754

750:                                              ; preds = %745
  %751 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %752 = load i32, i32* %751, align 4
  %753 = or i32 %752, 1
  store i32 %753, i32* %751, align 4
  br label %754

754:                                              ; preds = %750, %745
  %755 = load i32, i32* %0, align 4
  %756 = ashr i32 %755, 1
  store i32 %756, i32* %0, align 4
  %757 = getelementptr inbounds i32, i32* %0, i64 1
  %758 = load i32, i32* %757, align 4
  %759 = ashr i32 %758, 1
  store i32 %759, i32* %757, align 4
  %760 = getelementptr inbounds i32, i32* %0, i64 2
  %761 = load i32, i32* %760, align 4
  %762 = ashr i32 %761, 1
  store i32 %762, i32* %760, align 4
  %763 = load i32, i32* %6, align 4
  %764 = shl i32 %763, 1
  store i32 %764, i32* %6, align 4
  %765 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %766 = load i32, i32* %765, align 4
  %767 = shl i32 %766, 1
  store i32 %767, i32* %765, align 4
  %768 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %769 = load i32, i32* %768, align 4
  %770 = shl i32 %769, 1
  store i32 %770, i32* %768, align 4
  %771 = load i32, i32* %0, align 4
  %772 = and i32 %771, 1
  %773 = icmp ne i32 %772, 0
  br i1 %773, label %774, label %778

774:                                              ; preds = %754
  %775 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %776 = load i32, i32* %775, align 4
  %777 = or i32 %776, 1
  store i32 %777, i32* %775, align 4
  br label %778

778:                                              ; preds = %774, %754
  %779 = getelementptr inbounds i32, i32* %0, i64 1
  %780 = load i32, i32* %779, align 4
  %781 = and i32 %780, 1
  %782 = icmp ne i32 %781, 0
  br i1 %782, label %783, label %787

783:                                              ; preds = %778
  %784 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %785 = load i32, i32* %784, align 4
  %786 = or i32 %785, 1
  store i32 %786, i32* %784, align 4
  br label %787

787:                                              ; preds = %783, %778
  %788 = getelementptr inbounds i32, i32* %0, i64 2
  %789 = load i32, i32* %788, align 4
  %790 = and i32 %789, 1
  %791 = icmp ne i32 %790, 0
  br i1 %791, label %792, label %796

792:                                              ; preds = %787
  %793 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %794 = load i32, i32* %793, align 4
  %795 = or i32 %794, 1
  store i32 %795, i32* %793, align 4
  br label %796

796:                                              ; preds = %792, %787
  %797 = load i32, i32* %0, align 4
  %798 = ashr i32 %797, 1
  store i32 %798, i32* %0, align 4
  %799 = getelementptr inbounds i32, i32* %0, i64 1
  %800 = load i32, i32* %799, align 4
  %801 = ashr i32 %800, 1
  store i32 %801, i32* %799, align 4
  %802 = getelementptr inbounds i32, i32* %0, i64 2
  %803 = load i32, i32* %802, align 4
  %804 = ashr i32 %803, 1
  store i32 %804, i32* %802, align 4
  %805 = load i32, i32* %6, align 4
  %806 = shl i32 %805, 1
  store i32 %806, i32* %6, align 4
  %807 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %808 = load i32, i32* %807, align 4
  %809 = shl i32 %808, 1
  store i32 %809, i32* %807, align 4
  %810 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %811 = load i32, i32* %810, align 4
  %812 = shl i32 %811, 1
  store i32 %812, i32* %810, align 4
  %813 = load i32, i32* %0, align 4
  %814 = and i32 %813, 1
  %815 = icmp ne i32 %814, 0
  br i1 %815, label %816, label %820

816:                                              ; preds = %796
  %817 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %818 = load i32, i32* %817, align 4
  %819 = or i32 %818, 1
  store i32 %819, i32* %817, align 4
  br label %820

820:                                              ; preds = %816, %796
  %821 = getelementptr inbounds i32, i32* %0, i64 1
  %822 = load i32, i32* %821, align 4
  %823 = and i32 %822, 1
  %824 = icmp ne i32 %823, 0
  br i1 %824, label %825, label %829

825:                                              ; preds = %820
  %826 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %827 = load i32, i32* %826, align 4
  %828 = or i32 %827, 1
  store i32 %828, i32* %826, align 4
  br label %829

829:                                              ; preds = %825, %820
  %830 = getelementptr inbounds i32, i32* %0, i64 2
  %831 = load i32, i32* %830, align 4
  %832 = and i32 %831, 1
  %833 = icmp ne i32 %832, 0
  br i1 %833, label %834, label %838

834:                                              ; preds = %829
  %835 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %836 = load i32, i32* %835, align 4
  %837 = or i32 %836, 1
  store i32 %837, i32* %835, align 4
  br label %838

838:                                              ; preds = %834, %829
  %839 = load i32, i32* %0, align 4
  %840 = ashr i32 %839, 1
  store i32 %840, i32* %0, align 4
  %841 = getelementptr inbounds i32, i32* %0, i64 1
  %842 = load i32, i32* %841, align 4
  %843 = ashr i32 %842, 1
  store i32 %843, i32* %841, align 4
  %844 = getelementptr inbounds i32, i32* %0, i64 2
  %845 = load i32, i32* %844, align 4
  %846 = ashr i32 %845, 1
  store i32 %846, i32* %844, align 4
  %847 = load i32, i32* %6, align 4
  %848 = shl i32 %847, 1
  store i32 %848, i32* %6, align 4
  %849 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %850 = load i32, i32* %849, align 4
  %851 = shl i32 %850, 1
  store i32 %851, i32* %849, align 4
  %852 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %853 = load i32, i32* %852, align 4
  %854 = shl i32 %853, 1
  store i32 %854, i32* %852, align 4
  %855 = load i32, i32* %0, align 4
  %856 = and i32 %855, 1
  %857 = icmp ne i32 %856, 0
  br i1 %857, label %858, label %862

858:                                              ; preds = %838
  %859 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %860 = load i32, i32* %859, align 4
  %861 = or i32 %860, 1
  store i32 %861, i32* %859, align 4
  br label %862

862:                                              ; preds = %858, %838
  %863 = getelementptr inbounds i32, i32* %0, i64 1
  %864 = load i32, i32* %863, align 4
  %865 = and i32 %864, 1
  %866 = icmp ne i32 %865, 0
  br i1 %866, label %867, label %871

867:                                              ; preds = %862
  %868 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %869 = load i32, i32* %868, align 4
  %870 = or i32 %869, 1
  store i32 %870, i32* %868, align 4
  br label %871

871:                                              ; preds = %867, %862
  %872 = getelementptr inbounds i32, i32* %0, i64 2
  %873 = load i32, i32* %872, align 4
  %874 = and i32 %873, 1
  %875 = icmp ne i32 %874, 0
  br i1 %875, label %876, label %880

876:                                              ; preds = %871
  %877 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %878 = load i32, i32* %877, align 4
  %879 = or i32 %878, 1
  store i32 %879, i32* %877, align 4
  br label %880

880:                                              ; preds = %876, %871
  %881 = load i32, i32* %0, align 4
  %882 = ashr i32 %881, 1
  store i32 %882, i32* %0, align 4
  %883 = getelementptr inbounds i32, i32* %0, i64 1
  %884 = load i32, i32* %883, align 4
  %885 = ashr i32 %884, 1
  store i32 %885, i32* %883, align 4
  %886 = getelementptr inbounds i32, i32* %0, i64 2
  %887 = load i32, i32* %886, align 4
  %888 = ashr i32 %887, 1
  store i32 %888, i32* %886, align 4
  %889 = load i32, i32* %6, align 4
  %890 = shl i32 %889, 1
  store i32 %890, i32* %6, align 4
  %891 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %892 = load i32, i32* %891, align 4
  %893 = shl i32 %892, 1
  store i32 %893, i32* %891, align 4
  %894 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %895 = load i32, i32* %894, align 4
  %896 = shl i32 %895, 1
  store i32 %896, i32* %894, align 4
  %897 = load i32, i32* %0, align 4
  %898 = and i32 %897, 1
  %899 = icmp ne i32 %898, 0
  br i1 %899, label %900, label %904

900:                                              ; preds = %880
  %901 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %902 = load i32, i32* %901, align 4
  %903 = or i32 %902, 1
  store i32 %903, i32* %901, align 4
  br label %904

904:                                              ; preds = %900, %880
  %905 = getelementptr inbounds i32, i32* %0, i64 1
  %906 = load i32, i32* %905, align 4
  %907 = and i32 %906, 1
  %908 = icmp ne i32 %907, 0
  br i1 %908, label %909, label %913

909:                                              ; preds = %904
  %910 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %911 = load i32, i32* %910, align 4
  %912 = or i32 %911, 1
  store i32 %912, i32* %910, align 4
  br label %913

913:                                              ; preds = %909, %904
  %914 = getelementptr inbounds i32, i32* %0, i64 2
  %915 = load i32, i32* %914, align 4
  %916 = and i32 %915, 1
  %917 = icmp ne i32 %916, 0
  br i1 %917, label %918, label %922

918:                                              ; preds = %913
  %919 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %920 = load i32, i32* %919, align 4
  %921 = or i32 %920, 1
  store i32 %921, i32* %919, align 4
  br label %922

922:                                              ; preds = %918, %913
  %923 = load i32, i32* %0, align 4
  %924 = ashr i32 %923, 1
  store i32 %924, i32* %0, align 4
  %925 = getelementptr inbounds i32, i32* %0, i64 1
  %926 = load i32, i32* %925, align 4
  %927 = ashr i32 %926, 1
  store i32 %927, i32* %925, align 4
  %928 = getelementptr inbounds i32, i32* %0, i64 2
  %929 = load i32, i32* %928, align 4
  %930 = ashr i32 %929, 1
  store i32 %930, i32* %928, align 4
  %931 = load i32, i32* %6, align 4
  %932 = shl i32 %931, 1
  store i32 %932, i32* %6, align 4
  %933 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %934 = load i32, i32* %933, align 4
  %935 = shl i32 %934, 1
  store i32 %935, i32* %933, align 4
  %936 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %937 = load i32, i32* %936, align 4
  %938 = shl i32 %937, 1
  store i32 %938, i32* %936, align 4
  %939 = load i32, i32* %0, align 4
  %940 = and i32 %939, 1
  %941 = icmp ne i32 %940, 0
  br i1 %941, label %942, label %946

942:                                              ; preds = %922
  %943 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %944 = load i32, i32* %943, align 4
  %945 = or i32 %944, 1
  store i32 %945, i32* %943, align 4
  br label %946

946:                                              ; preds = %942, %922
  %947 = getelementptr inbounds i32, i32* %0, i64 1
  %948 = load i32, i32* %947, align 4
  %949 = and i32 %948, 1
  %950 = icmp ne i32 %949, 0
  br i1 %950, label %951, label %955

951:                                              ; preds = %946
  %952 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %953 = load i32, i32* %952, align 4
  %954 = or i32 %953, 1
  store i32 %954, i32* %952, align 4
  br label %955

955:                                              ; preds = %951, %946
  %956 = getelementptr inbounds i32, i32* %0, i64 2
  %957 = load i32, i32* %956, align 4
  %958 = and i32 %957, 1
  %959 = icmp ne i32 %958, 0
  br i1 %959, label %960, label %964

960:                                              ; preds = %955
  %961 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %962 = load i32, i32* %961, align 4
  %963 = or i32 %962, 1
  store i32 %963, i32* %961, align 4
  br label %964

964:                                              ; preds = %960, %955
  %965 = load i32, i32* %0, align 4
  %966 = ashr i32 %965, 1
  store i32 %966, i32* %0, align 4
  %967 = getelementptr inbounds i32, i32* %0, i64 1
  %968 = load i32, i32* %967, align 4
  %969 = ashr i32 %968, 1
  store i32 %969, i32* %967, align 4
  %970 = getelementptr inbounds i32, i32* %0, i64 2
  %971 = load i32, i32* %970, align 4
  %972 = ashr i32 %971, 1
  store i32 %972, i32* %970, align 4
  %973 = load i32, i32* %6, align 4
  %974 = shl i32 %973, 1
  store i32 %974, i32* %6, align 4
  %975 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %976 = load i32, i32* %975, align 4
  %977 = shl i32 %976, 1
  store i32 %977, i32* %975, align 4
  %978 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %979 = load i32, i32* %978, align 4
  %980 = shl i32 %979, 1
  store i32 %980, i32* %978, align 4
  %981 = load i32, i32* %0, align 4
  %982 = and i32 %981, 1
  %983 = icmp ne i32 %982, 0
  br i1 %983, label %984, label %988

984:                                              ; preds = %964
  %985 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %986 = load i32, i32* %985, align 4
  %987 = or i32 %986, 1
  store i32 %987, i32* %985, align 4
  br label %988

988:                                              ; preds = %984, %964
  %989 = getelementptr inbounds i32, i32* %0, i64 1
  %990 = load i32, i32* %989, align 4
  %991 = and i32 %990, 1
  %992 = icmp ne i32 %991, 0
  br i1 %992, label %993, label %997

993:                                              ; preds = %988
  %994 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %995 = load i32, i32* %994, align 4
  %996 = or i32 %995, 1
  store i32 %996, i32* %994, align 4
  br label %997

997:                                              ; preds = %993, %988
  %998 = getelementptr inbounds i32, i32* %0, i64 2
  %999 = load i32, i32* %998, align 4
  %1000 = and i32 %999, 1
  %1001 = icmp ne i32 %1000, 0
  br i1 %1001, label %1002, label %1006

1002:                                             ; preds = %997
  %1003 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %1004 = load i32, i32* %1003, align 4
  %1005 = or i32 %1004, 1
  store i32 %1005, i32* %1003, align 4
  br label %1006

1006:                                             ; preds = %1002, %997
  %1007 = load i32, i32* %0, align 4
  %1008 = ashr i32 %1007, 1
  store i32 %1008, i32* %0, align 4
  %1009 = getelementptr inbounds i32, i32* %0, i64 1
  %1010 = load i32, i32* %1009, align 4
  %1011 = ashr i32 %1010, 1
  store i32 %1011, i32* %1009, align 4
  %1012 = getelementptr inbounds i32, i32* %0, i64 2
  %1013 = load i32, i32* %1012, align 4
  %1014 = ashr i32 %1013, 1
  store i32 %1014, i32* %1012, align 4
  %1015 = load i32, i32* %6, align 4
  %1016 = shl i32 %1015, 1
  store i32 %1016, i32* %6, align 4
  %1017 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1018 = load i32, i32* %1017, align 4
  %1019 = shl i32 %1018, 1
  store i32 %1019, i32* %1017, align 4
  %1020 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1021 = load i32, i32* %1020, align 4
  %1022 = shl i32 %1021, 1
  store i32 %1022, i32* %1020, align 4
  %1023 = load i32, i32* %0, align 4
  %1024 = and i32 %1023, 1
  %1025 = icmp ne i32 %1024, 0
  br i1 %1025, label %1026, label %1030

1026:                                             ; preds = %1006
  %1027 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1028 = load i32, i32* %1027, align 4
  %1029 = or i32 %1028, 1
  store i32 %1029, i32* %1027, align 4
  br label %1030

1030:                                             ; preds = %1026, %1006
  %1031 = getelementptr inbounds i32, i32* %0, i64 1
  %1032 = load i32, i32* %1031, align 4
  %1033 = and i32 %1032, 1
  %1034 = icmp ne i32 %1033, 0
  br i1 %1034, label %1035, label %1039

1035:                                             ; preds = %1030
  %1036 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1037 = load i32, i32* %1036, align 4
  %1038 = or i32 %1037, 1
  store i32 %1038, i32* %1036, align 4
  br label %1039

1039:                                             ; preds = %1035, %1030
  %1040 = getelementptr inbounds i32, i32* %0, i64 2
  %1041 = load i32, i32* %1040, align 4
  %1042 = and i32 %1041, 1
  %1043 = icmp ne i32 %1042, 0
  br i1 %1043, label %1044, label %1048

1044:                                             ; preds = %1039
  %1045 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %1046 = load i32, i32* %1045, align 4
  %1047 = or i32 %1046, 1
  store i32 %1047, i32* %1045, align 4
  br label %1048

1048:                                             ; preds = %1044, %1039
  %1049 = load i32, i32* %0, align 4
  %1050 = ashr i32 %1049, 1
  store i32 %1050, i32* %0, align 4
  %1051 = getelementptr inbounds i32, i32* %0, i64 1
  %1052 = load i32, i32* %1051, align 4
  %1053 = ashr i32 %1052, 1
  store i32 %1053, i32* %1051, align 4
  %1054 = getelementptr inbounds i32, i32* %0, i64 2
  %1055 = load i32, i32* %1054, align 4
  %1056 = ashr i32 %1055, 1
  store i32 %1056, i32* %1054, align 4
  %1057 = load i32, i32* %6, align 4
  %1058 = shl i32 %1057, 1
  store i32 %1058, i32* %6, align 4
  %1059 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1060 = load i32, i32* %1059, align 4
  %1061 = shl i32 %1060, 1
  store i32 %1061, i32* %1059, align 4
  %1062 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1063 = load i32, i32* %1062, align 4
  %1064 = shl i32 %1063, 1
  store i32 %1064, i32* %1062, align 4
  %1065 = load i32, i32* %0, align 4
  %1066 = and i32 %1065, 1
  %1067 = icmp ne i32 %1066, 0
  br i1 %1067, label %1068, label %1072

1068:                                             ; preds = %1048
  %1069 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1070 = load i32, i32* %1069, align 4
  %1071 = or i32 %1070, 1
  store i32 %1071, i32* %1069, align 4
  br label %1072

1072:                                             ; preds = %1068, %1048
  %1073 = getelementptr inbounds i32, i32* %0, i64 1
  %1074 = load i32, i32* %1073, align 4
  %1075 = and i32 %1074, 1
  %1076 = icmp ne i32 %1075, 0
  br i1 %1076, label %1077, label %1081

1077:                                             ; preds = %1072
  %1078 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1079 = load i32, i32* %1078, align 4
  %1080 = or i32 %1079, 1
  store i32 %1080, i32* %1078, align 4
  br label %1081

1081:                                             ; preds = %1077, %1072
  %1082 = getelementptr inbounds i32, i32* %0, i64 2
  %1083 = load i32, i32* %1082, align 4
  %1084 = and i32 %1083, 1
  %1085 = icmp ne i32 %1084, 0
  br i1 %1085, label %1086, label %1090

1086:                                             ; preds = %1081
  %1087 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %1088 = load i32, i32* %1087, align 4
  %1089 = or i32 %1088, 1
  store i32 %1089, i32* %1087, align 4
  br label %1090

1090:                                             ; preds = %1086, %1081
  %1091 = load i32, i32* %0, align 4
  %1092 = ashr i32 %1091, 1
  store i32 %1092, i32* %0, align 4
  %1093 = getelementptr inbounds i32, i32* %0, i64 1
  %1094 = load i32, i32* %1093, align 4
  %1095 = ashr i32 %1094, 1
  store i32 %1095, i32* %1093, align 4
  %1096 = getelementptr inbounds i32, i32* %0, i64 2
  %1097 = load i32, i32* %1096, align 4
  %1098 = ashr i32 %1097, 1
  store i32 %1098, i32* %1096, align 4
  %1099 = load i32, i32* %6, align 4
  %1100 = shl i32 %1099, 1
  store i32 %1100, i32* %6, align 4
  %1101 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1102 = load i32, i32* %1101, align 4
  %1103 = shl i32 %1102, 1
  store i32 %1103, i32* %1101, align 4
  %1104 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1105 = load i32, i32* %1104, align 4
  %1106 = shl i32 %1105, 1
  store i32 %1106, i32* %1104, align 4
  %1107 = load i32, i32* %0, align 4
  %1108 = and i32 %1107, 1
  %1109 = icmp ne i32 %1108, 0
  br i1 %1109, label %1110, label %1114

1110:                                             ; preds = %1090
  %1111 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1112 = load i32, i32* %1111, align 4
  %1113 = or i32 %1112, 1
  store i32 %1113, i32* %1111, align 4
  br label %1114

1114:                                             ; preds = %1110, %1090
  %1115 = getelementptr inbounds i32, i32* %0, i64 1
  %1116 = load i32, i32* %1115, align 4
  %1117 = and i32 %1116, 1
  %1118 = icmp ne i32 %1117, 0
  br i1 %1118, label %1119, label %1123

1119:                                             ; preds = %1114
  %1120 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1121 = load i32, i32* %1120, align 4
  %1122 = or i32 %1121, 1
  store i32 %1122, i32* %1120, align 4
  br label %1123

1123:                                             ; preds = %1119, %1114
  %1124 = getelementptr inbounds i32, i32* %0, i64 2
  %1125 = load i32, i32* %1124, align 4
  %1126 = and i32 %1125, 1
  %1127 = icmp ne i32 %1126, 0
  br i1 %1127, label %1128, label %1132

1128:                                             ; preds = %1123
  %1129 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %1130 = load i32, i32* %1129, align 4
  %1131 = or i32 %1130, 1
  store i32 %1131, i32* %1129, align 4
  br label %1132

1132:                                             ; preds = %1128, %1123
  %1133 = load i32, i32* %0, align 4
  %1134 = ashr i32 %1133, 1
  store i32 %1134, i32* %0, align 4
  %1135 = getelementptr inbounds i32, i32* %0, i64 1
  %1136 = load i32, i32* %1135, align 4
  %1137 = ashr i32 %1136, 1
  store i32 %1137, i32* %1135, align 4
  %1138 = getelementptr inbounds i32, i32* %0, i64 2
  %1139 = load i32, i32* %1138, align 4
  %1140 = ashr i32 %1139, 1
  store i32 %1140, i32* %1138, align 4
  %1141 = load i32, i32* %6, align 4
  %1142 = shl i32 %1141, 1
  store i32 %1142, i32* %6, align 4
  %1143 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1144 = load i32, i32* %1143, align 4
  %1145 = shl i32 %1144, 1
  store i32 %1145, i32* %1143, align 4
  %1146 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1147 = load i32, i32* %1146, align 4
  %1148 = shl i32 %1147, 1
  store i32 %1148, i32* %1146, align 4
  %1149 = load i32, i32* %0, align 4
  %1150 = and i32 %1149, 1
  %1151 = icmp ne i32 %1150, 0
  br i1 %1151, label %1152, label %1156

1152:                                             ; preds = %1132
  %1153 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1154 = load i32, i32* %1153, align 4
  %1155 = or i32 %1154, 1
  store i32 %1155, i32* %1153, align 4
  br label %1156

1156:                                             ; preds = %1152, %1132
  %1157 = getelementptr inbounds i32, i32* %0, i64 1
  %1158 = load i32, i32* %1157, align 4
  %1159 = and i32 %1158, 1
  %1160 = icmp ne i32 %1159, 0
  br i1 %1160, label %1161, label %1165

1161:                                             ; preds = %1156
  %1162 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1163 = load i32, i32* %1162, align 4
  %1164 = or i32 %1163, 1
  store i32 %1164, i32* %1162, align 4
  br label %1165

1165:                                             ; preds = %1161, %1156
  %1166 = getelementptr inbounds i32, i32* %0, i64 2
  %1167 = load i32, i32* %1166, align 4
  %1168 = and i32 %1167, 1
  %1169 = icmp ne i32 %1168, 0
  br i1 %1169, label %1170, label %1174

1170:                                             ; preds = %1165
  %1171 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %1172 = load i32, i32* %1171, align 4
  %1173 = or i32 %1172, 1
  store i32 %1173, i32* %1171, align 4
  br label %1174

1174:                                             ; preds = %1170, %1165
  %1175 = load i32, i32* %0, align 4
  %1176 = ashr i32 %1175, 1
  store i32 %1176, i32* %0, align 4
  %1177 = getelementptr inbounds i32, i32* %0, i64 1
  %1178 = load i32, i32* %1177, align 4
  %1179 = ashr i32 %1178, 1
  store i32 %1179, i32* %1177, align 4
  %1180 = getelementptr inbounds i32, i32* %0, i64 2
  %1181 = load i32, i32* %1180, align 4
  %1182 = ashr i32 %1181, 1
  store i32 %1182, i32* %1180, align 4
  %1183 = load i32, i32* %6, align 4
  %1184 = shl i32 %1183, 1
  store i32 %1184, i32* %6, align 4
  %1185 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1186 = load i32, i32* %1185, align 4
  %1187 = shl i32 %1186, 1
  store i32 %1187, i32* %1185, align 4
  %1188 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1189 = load i32, i32* %1188, align 4
  %1190 = shl i32 %1189, 1
  store i32 %1190, i32* %1188, align 4
  %1191 = load i32, i32* %0, align 4
  %1192 = and i32 %1191, 1
  %1193 = icmp ne i32 %1192, 0
  br i1 %1193, label %1194, label %1198

1194:                                             ; preds = %1174
  %1195 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1196 = load i32, i32* %1195, align 4
  %1197 = or i32 %1196, 1
  store i32 %1197, i32* %1195, align 4
  br label %1198

1198:                                             ; preds = %1194, %1174
  %1199 = getelementptr inbounds i32, i32* %0, i64 1
  %1200 = load i32, i32* %1199, align 4
  %1201 = and i32 %1200, 1
  %1202 = icmp ne i32 %1201, 0
  br i1 %1202, label %1203, label %1207

1203:                                             ; preds = %1198
  %1204 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1205 = load i32, i32* %1204, align 4
  %1206 = or i32 %1205, 1
  store i32 %1206, i32* %1204, align 4
  br label %1207

1207:                                             ; preds = %1203, %1198
  %1208 = getelementptr inbounds i32, i32* %0, i64 2
  %1209 = load i32, i32* %1208, align 4
  %1210 = and i32 %1209, 1
  %1211 = icmp ne i32 %1210, 0
  br i1 %1211, label %1212, label %1216

1212:                                             ; preds = %1207
  %1213 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %1214 = load i32, i32* %1213, align 4
  %1215 = or i32 %1214, 1
  store i32 %1215, i32* %1213, align 4
  br label %1216

1216:                                             ; preds = %1212, %1207
  %1217 = load i32, i32* %0, align 4
  %1218 = ashr i32 %1217, 1
  store i32 %1218, i32* %0, align 4
  %1219 = getelementptr inbounds i32, i32* %0, i64 1
  %1220 = load i32, i32* %1219, align 4
  %1221 = ashr i32 %1220, 1
  store i32 %1221, i32* %1219, align 4
  %1222 = getelementptr inbounds i32, i32* %0, i64 2
  %1223 = load i32, i32* %1222, align 4
  %1224 = ashr i32 %1223, 1
  store i32 %1224, i32* %1222, align 4
  %1225 = load i32, i32* %6, align 4
  %1226 = shl i32 %1225, 1
  store i32 %1226, i32* %6, align 4
  %1227 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1228 = load i32, i32* %1227, align 4
  %1229 = shl i32 %1228, 1
  store i32 %1229, i32* %1227, align 4
  %1230 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1231 = load i32, i32* %1230, align 4
  %1232 = shl i32 %1231, 1
  store i32 %1232, i32* %1230, align 4
  %1233 = load i32, i32* %0, align 4
  %1234 = and i32 %1233, 1
  %1235 = icmp ne i32 %1234, 0
  br i1 %1235, label %1236, label %1240

1236:                                             ; preds = %1216
  %1237 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1238 = load i32, i32* %1237, align 4
  %1239 = or i32 %1238, 1
  store i32 %1239, i32* %1237, align 4
  br label %1240

1240:                                             ; preds = %1236, %1216
  %1241 = getelementptr inbounds i32, i32* %0, i64 1
  %1242 = load i32, i32* %1241, align 4
  %1243 = and i32 %1242, 1
  %1244 = icmp ne i32 %1243, 0
  br i1 %1244, label %1245, label %1249

1245:                                             ; preds = %1240
  %1246 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1247 = load i32, i32* %1246, align 4
  %1248 = or i32 %1247, 1
  store i32 %1248, i32* %1246, align 4
  br label %1249

1249:                                             ; preds = %1245, %1240
  %1250 = getelementptr inbounds i32, i32* %0, i64 2
  %1251 = load i32, i32* %1250, align 4
  %1252 = and i32 %1251, 1
  %1253 = icmp ne i32 %1252, 0
  br i1 %1253, label %1254, label %1258

1254:                                             ; preds = %1249
  %1255 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %1256 = load i32, i32* %1255, align 4
  %1257 = or i32 %1256, 1
  store i32 %1257, i32* %1255, align 4
  br label %1258

1258:                                             ; preds = %1254, %1249
  %1259 = load i32, i32* %0, align 4
  %1260 = ashr i32 %1259, 1
  store i32 %1260, i32* %0, align 4
  %1261 = getelementptr inbounds i32, i32* %0, i64 1
  %1262 = load i32, i32* %1261, align 4
  %1263 = ashr i32 %1262, 1
  store i32 %1263, i32* %1261, align 4
  %1264 = getelementptr inbounds i32, i32* %0, i64 2
  %1265 = load i32, i32* %1264, align 4
  %1266 = ashr i32 %1265, 1
  store i32 %1266, i32* %1264, align 4
  %1267 = load i32, i32* %6, align 4
  %1268 = shl i32 %1267, 1
  store i32 %1268, i32* %6, align 4
  %1269 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1270 = load i32, i32* %1269, align 4
  %1271 = shl i32 %1270, 1
  store i32 %1271, i32* %1269, align 4
  %1272 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1273 = load i32, i32* %1272, align 4
  %1274 = shl i32 %1273, 1
  store i32 %1274, i32* %1272, align 4
  %1275 = load i32, i32* %0, align 4
  %1276 = and i32 %1275, 1
  %1277 = icmp ne i32 %1276, 0
  br i1 %1277, label %1278, label %1282

1278:                                             ; preds = %1258
  %1279 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1280 = load i32, i32* %1279, align 4
  %1281 = or i32 %1280, 1
  store i32 %1281, i32* %1279, align 4
  br label %1282

1282:                                             ; preds = %1278, %1258
  %1283 = getelementptr inbounds i32, i32* %0, i64 1
  %1284 = load i32, i32* %1283, align 4
  %1285 = and i32 %1284, 1
  %1286 = icmp ne i32 %1285, 0
  br i1 %1286, label %1287, label %1291

1287:                                             ; preds = %1282
  %1288 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1289 = load i32, i32* %1288, align 4
  %1290 = or i32 %1289, 1
  store i32 %1290, i32* %1288, align 4
  br label %1291

1291:                                             ; preds = %1287, %1282
  %1292 = getelementptr inbounds i32, i32* %0, i64 2
  %1293 = load i32, i32* %1292, align 4
  %1294 = and i32 %1293, 1
  %1295 = icmp ne i32 %1294, 0
  br i1 %1295, label %1296, label %1300

1296:                                             ; preds = %1291
  %1297 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %1298 = load i32, i32* %1297, align 4
  %1299 = or i32 %1298, 1
  store i32 %1299, i32* %1297, align 4
  br label %1300

1300:                                             ; preds = %1296, %1291
  %1301 = load i32, i32* %0, align 4
  %1302 = ashr i32 %1301, 1
  store i32 %1302, i32* %0, align 4
  %1303 = getelementptr inbounds i32, i32* %0, i64 1
  %1304 = load i32, i32* %1303, align 4
  %1305 = ashr i32 %1304, 1
  store i32 %1305, i32* %1303, align 4
  %1306 = getelementptr inbounds i32, i32* %0, i64 2
  %1307 = load i32, i32* %1306, align 4
  %1308 = ashr i32 %1307, 1
  store i32 %1308, i32* %1306, align 4
  %1309 = load i32, i32* %6, align 4
  %1310 = shl i32 %1309, 1
  store i32 %1310, i32* %6, align 4
  %1311 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1312 = load i32, i32* %1311, align 4
  %1313 = shl i32 %1312, 1
  store i32 %1313, i32* %1311, align 4
  %1314 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1315 = load i32, i32* %1314, align 4
  %1316 = shl i32 %1315, 1
  store i32 %1316, i32* %1314, align 4
  %1317 = load i32, i32* %0, align 4
  %1318 = and i32 %1317, 1
  %1319 = icmp ne i32 %1318, 0
  br i1 %1319, label %1320, label %1324

1320:                                             ; preds = %1300
  %1321 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1322 = load i32, i32* %1321, align 4
  %1323 = or i32 %1322, 1
  store i32 %1323, i32* %1321, align 4
  br label %1324

1324:                                             ; preds = %1320, %1300
  %1325 = getelementptr inbounds i32, i32* %0, i64 1
  %1326 = load i32, i32* %1325, align 4
  %1327 = and i32 %1326, 1
  %1328 = icmp ne i32 %1327, 0
  br i1 %1328, label %1329, label %1333

1329:                                             ; preds = %1324
  %1330 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1331 = load i32, i32* %1330, align 4
  %1332 = or i32 %1331, 1
  store i32 %1332, i32* %1330, align 4
  br label %1333

1333:                                             ; preds = %1329, %1324
  %1334 = getelementptr inbounds i32, i32* %0, i64 2
  %1335 = load i32, i32* %1334, align 4
  %1336 = and i32 %1335, 1
  %1337 = icmp ne i32 %1336, 0
  br i1 %1337, label %1338, label %1342

1338:                                             ; preds = %1333
  %1339 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 0
  %1340 = load i32, i32* %1339, align 4
  %1341 = or i32 %1340, 1
  store i32 %1341, i32* %1339, align 4
  br label %1342

1342:                                             ; preds = %1338, %1333
  %1343 = load i32, i32* %0, align 4
  %1344 = ashr i32 %1343, 1
  store i32 %1344, i32* %0, align 4
  %1345 = getelementptr inbounds i32, i32* %0, i64 1
  %1346 = load i32, i32* %1345, align 4
  %1347 = ashr i32 %1346, 1
  store i32 %1347, i32* %1345, align 4
  %1348 = getelementptr inbounds i32, i32* %0, i64 2
  %1349 = load i32, i32* %1348, align 4
  %1350 = ashr i32 %1349, 1
  store i32 %1350, i32* %1348, align 4
  %1351 = load i32, i32* %6, align 4
  store i32 %1351, i32* %0, align 4
  %1352 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 1
  %1353 = load i32, i32* %1352, align 4
  %1354 = getelementptr inbounds i32, i32* %0, i64 1
  store i32 %1353, i32* %1354, align 4
  %1355 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 0, i64 2
  %1356 = load i32, i32* %1355, align 4
  %1357 = getelementptr inbounds i32, i32* %0, i64 2
  store i32 %1356, i32* %1357, align 4
  ret void
}

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}

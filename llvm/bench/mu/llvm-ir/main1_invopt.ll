; ModuleID = 'mu/llvm-ir/main1.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"%d\09%d\09%d\0A\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [3 x i32], align 4
  %2 = bitcast [3 x i32]* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(12) %2, i8 0, i64 12, i1 false)
  %3 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 0
  call void @mu(i32* nonnull %3, i64 3) #4
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 1
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 2
  %8 = load i32, i32* %7, align 4
  %9 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %4, i32 %6, i32 %8)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree norecurse nounwind
define void @mu(i32* %0, i64 %N) local_unnamed_addr #3 {
  %2 = load i32, i32* %0, align 4
  %3 = getelementptr inbounds i32, i32* %0, i64 1
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr inbounds i32, i32* %0, i64 2
  %6 = load i32, i32* %5, align 4
  %7 = ashr i32 %2, 1
  store i32 %7, i32* %0, align 4
  %8 = load i32, i32* %3, align 4
  %9 = ashr i32 %8, 1
  store i32 %9, i32* %3, align 4
  %10 = load i32, i32* %5, align 4
  %11 = ashr i32 %10, 1
  store i32 %11, i32* %5, align 4
  %12 = shl i32 %6, 1
  %13 = and i32 %12, 2
  %14 = shl i32 %4, 1
  %15 = and i32 %14, 2
  %16 = shl i32 %2, 1
  %17 = and i32 %16, 2
  %18 = load i32, i32* %0, align 4
  %19 = and i32 %18, 1
  %20 = or i32 %19, %17
  %21 = load i32, i32* %3, align 4
  %22 = and i32 %21, 1
  %23 = or i32 %22, %15
  %24 = and i32 %11, 1
  %25 = or i32 %24, %13
  %26 = ashr i32 %18, 1
  store i32 %26, i32* %0, align 4
  %27 = load i32, i32* %3, align 4
  %28 = ashr i32 %27, 1
  store i32 %28, i32* %3, align 4
  %29 = load i32, i32* %5, align 4
  %30 = ashr i32 %29, 1
  store i32 %30, i32* %5, align 4
  %31 = load i32, i32* %0, align 4
  %32 = load i32, i32* %3, align 4
  %33 = ashr i32 %31, 1
  store i32 %33, i32* %0, align 4
  %34 = load i32, i32* %3, align 4
  %35 = ashr i32 %34, 1
  store i32 %35, i32* %3, align 4
  %36 = load i32, i32* %5, align 4
  %37 = ashr i32 %36, 1
  store i32 %37, i32* %5, align 4
  %38 = shl nuw nsw i32 %25, 2
  %39 = and i32 %29, 2
  %40 = or i32 %39, %38
  %41 = shl nuw nsw i32 %23, 2
  %42 = shl i32 %32, 1
  %43 = and i32 %42, 2
  %44 = or i32 %43, %41
  %45 = shl nuw nsw i32 %20, 2
  %46 = shl i32 %31, 1
  %47 = and i32 %46, 2
  %48 = or i32 %47, %45
  %49 = load i32, i32* %0, align 4
  %50 = and i32 %49, 1
  %51 = or i32 %48, %50
  %52 = load i32, i32* %3, align 4
  %53 = and i32 %52, 1
  %54 = or i32 %44, %53
  %55 = and i32 %37, 1
  %56 = or i32 %40, %55
  %57 = ashr i32 %49, 1
  store i32 %57, i32* %0, align 4
  %58 = load i32, i32* %3, align 4
  %59 = ashr i32 %58, 1
  store i32 %59, i32* %3, align 4
  %60 = load i32, i32* %5, align 4
  %61 = ashr i32 %60, 1
  store i32 %61, i32* %5, align 4
  %62 = load i32, i32* %0, align 4
  %63 = load i32, i32* %3, align 4
  %64 = ashr i32 %62, 1
  store i32 %64, i32* %0, align 4
  %65 = load i32, i32* %3, align 4
  %66 = ashr i32 %65, 1
  store i32 %66, i32* %3, align 4
  %67 = load i32, i32* %5, align 4
  %68 = ashr i32 %67, 1
  store i32 %68, i32* %5, align 4
  %69 = shl nuw nsw i32 %56, 2
  %70 = and i32 %60, 2
  %71 = or i32 %70, %69
  %72 = shl nuw nsw i32 %54, 2
  %73 = shl i32 %63, 1
  %74 = and i32 %73, 2
  %75 = or i32 %74, %72
  %76 = shl nuw nsw i32 %51, 2
  %77 = shl i32 %62, 1
  %78 = and i32 %77, 2
  %79 = or i32 %78, %76
  %80 = load i32, i32* %0, align 4
  %81 = and i32 %80, 1
  %82 = or i32 %79, %81
  %83 = load i32, i32* %3, align 4
  %84 = and i32 %83, 1
  %85 = or i32 %75, %84
  %86 = and i32 %68, 1
  %87 = or i32 %71, %86
  %88 = ashr i32 %80, 1
  store i32 %88, i32* %0, align 4
  %89 = load i32, i32* %3, align 4
  %90 = ashr i32 %89, 1
  store i32 %90, i32* %3, align 4
  %91 = load i32, i32* %5, align 4
  %92 = ashr i32 %91, 1
  store i32 %92, i32* %5, align 4
  %93 = load i32, i32* %0, align 4
  %94 = load i32, i32* %3, align 4
  %95 = ashr i32 %93, 1
  store i32 %95, i32* %0, align 4
  %96 = load i32, i32* %3, align 4
  %97 = ashr i32 %96, 1
  store i32 %97, i32* %3, align 4
  %98 = load i32, i32* %5, align 4
  %99 = ashr i32 %98, 1
  store i32 %99, i32* %5, align 4
  %100 = shl i32 %87, 2
  %101 = and i32 %91, 2
  %102 = or i32 %101, %100
  %103 = shl i32 %85, 2
  %104 = shl i32 %94, 1
  %105 = and i32 %104, 2
  %106 = or i32 %105, %103
  %107 = shl i32 %82, 2
  %108 = shl i32 %93, 1
  %109 = and i32 %108, 2
  %110 = or i32 %109, %107
  %111 = load i32, i32* %0, align 4
  %112 = and i32 %111, 1
  %113 = or i32 %110, %112
  %114 = load i32, i32* %3, align 4
  %115 = and i32 %114, 1
  %116 = or i32 %106, %115
  %117 = and i32 %99, 1
  %118 = or i32 %102, %117
  %119 = ashr i32 %111, 1
  store i32 %119, i32* %0, align 4
  %120 = load i32, i32* %3, align 4
  %121 = ashr i32 %120, 1
  store i32 %121, i32* %3, align 4
  %122 = load i32, i32* %5, align 4
  %123 = ashr i32 %122, 1
  store i32 %123, i32* %5, align 4
  %124 = load i32, i32* %0, align 4
  %125 = load i32, i32* %3, align 4
  %126 = ashr i32 %124, 1
  store i32 %126, i32* %0, align 4
  %127 = load i32, i32* %3, align 4
  %128 = ashr i32 %127, 1
  store i32 %128, i32* %3, align 4
  %129 = load i32, i32* %5, align 4
  %130 = ashr i32 %129, 1
  store i32 %130, i32* %5, align 4
  %131 = shl i32 %118, 2
  %132 = and i32 %122, 2
  %133 = or i32 %132, %131
  %134 = shl i32 %116, 2
  %135 = shl i32 %125, 1
  %136 = and i32 %135, 2
  %137 = or i32 %136, %134
  %138 = shl i32 %113, 2
  %139 = shl i32 %124, 1
  %140 = and i32 %139, 2
  %141 = or i32 %140, %138
  %142 = load i32, i32* %0, align 4
  %143 = and i32 %142, 1
  %144 = or i32 %141, %143
  %145 = load i32, i32* %3, align 4
  %146 = and i32 %145, 1
  %147 = or i32 %137, %146
  %148 = and i32 %130, 1
  %149 = or i32 %133, %148
  %150 = ashr i32 %142, 1
  store i32 %150, i32* %0, align 4
  %151 = load i32, i32* %3, align 4
  %152 = ashr i32 %151, 1
  store i32 %152, i32* %3, align 4
  %153 = load i32, i32* %5, align 4
  %154 = ashr i32 %153, 1
  store i32 %154, i32* %5, align 4
  %155 = load i32, i32* %0, align 4
  %156 = load i32, i32* %3, align 4
  %157 = ashr i32 %155, 1
  store i32 %157, i32* %0, align 4
  %158 = load i32, i32* %3, align 4
  %159 = ashr i32 %158, 1
  store i32 %159, i32* %3, align 4
  %160 = load i32, i32* %5, align 4
  %161 = ashr i32 %160, 1
  store i32 %161, i32* %5, align 4
  %162 = shl i32 %149, 2
  %163 = and i32 %153, 2
  %164 = or i32 %163, %162
  %165 = shl i32 %147, 2
  %166 = shl i32 %156, 1
  %167 = and i32 %166, 2
  %168 = or i32 %167, %165
  %169 = shl i32 %144, 2
  %170 = shl i32 %155, 1
  %171 = and i32 %170, 2
  %172 = or i32 %171, %169
  %173 = load i32, i32* %0, align 4
  %174 = and i32 %173, 1
  %175 = or i32 %172, %174
  %176 = load i32, i32* %3, align 4
  %177 = and i32 %176, 1
  %178 = or i32 %168, %177
  %179 = and i32 %161, 1
  %180 = or i32 %164, %179
  %181 = ashr i32 %173, 1
  store i32 %181, i32* %0, align 4
  %182 = load i32, i32* %3, align 4
  %183 = ashr i32 %182, 1
  store i32 %183, i32* %3, align 4
  %184 = load i32, i32* %5, align 4
  %185 = ashr i32 %184, 1
  store i32 %185, i32* %5, align 4
  %186 = load i32, i32* %0, align 4
  %187 = load i32, i32* %3, align 4
  %188 = ashr i32 %186, 1
  store i32 %188, i32* %0, align 4
  %189 = load i32, i32* %3, align 4
  %190 = ashr i32 %189, 1
  store i32 %190, i32* %3, align 4
  %191 = load i32, i32* %5, align 4
  %192 = ashr i32 %191, 1
  store i32 %192, i32* %5, align 4
  %193 = shl i32 %180, 2
  %194 = and i32 %184, 2
  %195 = or i32 %194, %193
  %196 = shl i32 %178, 2
  %197 = shl i32 %187, 1
  %198 = and i32 %197, 2
  %199 = or i32 %198, %196
  %200 = shl i32 %175, 2
  %201 = shl i32 %186, 1
  %202 = and i32 %201, 2
  %203 = or i32 %202, %200
  %204 = load i32, i32* %0, align 4
  %205 = and i32 %204, 1
  %206 = or i32 %203, %205
  %207 = load i32, i32* %3, align 4
  %208 = and i32 %207, 1
  %209 = or i32 %199, %208
  %210 = and i32 %192, 1
  %211 = or i32 %195, %210
  %212 = ashr i32 %204, 1
  store i32 %212, i32* %0, align 4
  %213 = load i32, i32* %3, align 4
  %214 = ashr i32 %213, 1
  store i32 %214, i32* %3, align 4
  %215 = load i32, i32* %5, align 4
  %216 = ashr i32 %215, 1
  store i32 %216, i32* %5, align 4
  %217 = load i32, i32* %0, align 4
  %218 = load i32, i32* %3, align 4
  %219 = ashr i32 %217, 1
  store i32 %219, i32* %0, align 4
  %220 = load i32, i32* %3, align 4
  %221 = ashr i32 %220, 1
  store i32 %221, i32* %3, align 4
  %222 = load i32, i32* %5, align 4
  %223 = ashr i32 %222, 1
  store i32 %223, i32* %5, align 4
  %224 = shl i32 %211, 2
  %225 = and i32 %215, 2
  %226 = or i32 %225, %224
  %227 = shl i32 %209, 2
  %228 = shl i32 %218, 1
  %229 = and i32 %228, 2
  %230 = or i32 %229, %227
  %231 = shl i32 %206, 2
  %232 = shl i32 %217, 1
  %233 = and i32 %232, 2
  %234 = or i32 %233, %231
  %235 = load i32, i32* %0, align 4
  %236 = and i32 %235, 1
  %237 = or i32 %234, %236
  %238 = load i32, i32* %3, align 4
  %239 = and i32 %238, 1
  %240 = or i32 %230, %239
  %241 = and i32 %223, 1
  %242 = or i32 %226, %241
  %243 = ashr i32 %235, 1
  store i32 %243, i32* %0, align 4
  %244 = load i32, i32* %3, align 4
  %245 = ashr i32 %244, 1
  store i32 %245, i32* %3, align 4
  %246 = load i32, i32* %5, align 4
  %247 = ashr i32 %246, 1
  store i32 %247, i32* %5, align 4
  %248 = load i32, i32* %0, align 4
  %249 = load i32, i32* %3, align 4
  %250 = ashr i32 %248, 1
  store i32 %250, i32* %0, align 4
  %251 = load i32, i32* %3, align 4
  %252 = ashr i32 %251, 1
  store i32 %252, i32* %3, align 4
  %253 = load i32, i32* %5, align 4
  %254 = ashr i32 %253, 1
  store i32 %254, i32* %5, align 4
  %255 = shl i32 %242, 2
  %256 = and i32 %246, 2
  %257 = or i32 %256, %255
  %258 = shl i32 %240, 2
  %259 = shl i32 %249, 1
  %260 = and i32 %259, 2
  %261 = or i32 %260, %258
  %262 = shl i32 %237, 2
  %263 = shl i32 %248, 1
  %264 = and i32 %263, 2
  %265 = or i32 %264, %262
  %266 = load i32, i32* %0, align 4
  %267 = and i32 %266, 1
  %268 = or i32 %265, %267
  %269 = load i32, i32* %3, align 4
  %270 = and i32 %269, 1
  %271 = or i32 %261, %270
  %272 = and i32 %254, 1
  %273 = or i32 %257, %272
  %274 = ashr i32 %266, 1
  store i32 %274, i32* %0, align 4
  %275 = load i32, i32* %3, align 4
  %276 = ashr i32 %275, 1
  store i32 %276, i32* %3, align 4
  %277 = load i32, i32* %5, align 4
  %278 = ashr i32 %277, 1
  store i32 %278, i32* %5, align 4
  %279 = load i32, i32* %0, align 4
  %280 = load i32, i32* %3, align 4
  %281 = ashr i32 %279, 1
  store i32 %281, i32* %0, align 4
  %282 = load i32, i32* %3, align 4
  %283 = ashr i32 %282, 1
  store i32 %283, i32* %3, align 4
  %284 = load i32, i32* %5, align 4
  %285 = ashr i32 %284, 1
  store i32 %285, i32* %5, align 4
  %286 = shl i32 %273, 2
  %287 = and i32 %277, 2
  %288 = or i32 %287, %286
  %289 = shl i32 %271, 2
  %290 = shl i32 %280, 1
  %291 = and i32 %290, 2
  %292 = or i32 %291, %289
  %293 = shl i32 %268, 2
  %294 = shl i32 %279, 1
  %295 = and i32 %294, 2
  %296 = or i32 %295, %293
  %297 = load i32, i32* %0, align 4
  %298 = and i32 %297, 1
  %299 = or i32 %296, %298
  %300 = load i32, i32* %3, align 4
  %301 = and i32 %300, 1
  %302 = or i32 %292, %301
  %303 = and i32 %285, 1
  %304 = or i32 %288, %303
  %305 = ashr i32 %297, 1
  store i32 %305, i32* %0, align 4
  %306 = load i32, i32* %3, align 4
  %307 = ashr i32 %306, 1
  store i32 %307, i32* %3, align 4
  %308 = load i32, i32* %5, align 4
  %309 = ashr i32 %308, 1
  store i32 %309, i32* %5, align 4
  %310 = load i32, i32* %0, align 4
  %311 = load i32, i32* %3, align 4
  %312 = ashr i32 %310, 1
  store i32 %312, i32* %0, align 4
  %313 = load i32, i32* %3, align 4
  %314 = ashr i32 %313, 1
  store i32 %314, i32* %3, align 4
  %315 = load i32, i32* %5, align 4
  %316 = ashr i32 %315, 1
  store i32 %316, i32* %5, align 4
  %317 = shl i32 %304, 2
  %318 = and i32 %308, 2
  %319 = or i32 %318, %317
  %320 = shl i32 %302, 2
  %321 = shl i32 %311, 1
  %322 = and i32 %321, 2
  %323 = or i32 %322, %320
  %324 = shl i32 %299, 2
  %325 = shl i32 %310, 1
  %326 = and i32 %325, 2
  %327 = or i32 %326, %324
  %328 = load i32, i32* %0, align 4
  %329 = and i32 %328, 1
  %330 = or i32 %327, %329
  %331 = load i32, i32* %3, align 4
  %332 = and i32 %331, 1
  %333 = or i32 %323, %332
  %334 = and i32 %316, 1
  %335 = or i32 %319, %334
  %336 = ashr i32 %328, 1
  store i32 %336, i32* %0, align 4
  %337 = load i32, i32* %3, align 4
  %338 = ashr i32 %337, 1
  store i32 %338, i32* %3, align 4
  %339 = load i32, i32* %5, align 4
  %340 = ashr i32 %339, 1
  store i32 %340, i32* %5, align 4
  %341 = load i32, i32* %0, align 4
  %342 = load i32, i32* %3, align 4
  %343 = ashr i32 %341, 1
  store i32 %343, i32* %0, align 4
  %344 = load i32, i32* %3, align 4
  %345 = ashr i32 %344, 1
  store i32 %345, i32* %3, align 4
  %346 = load i32, i32* %5, align 4
  %347 = ashr i32 %346, 1
  store i32 %347, i32* %5, align 4
  %348 = shl i32 %335, 2
  %349 = and i32 %339, 2
  %350 = or i32 %349, %348
  %351 = shl i32 %333, 2
  %352 = shl i32 %342, 1
  %353 = and i32 %352, 2
  %354 = or i32 %353, %351
  %355 = shl i32 %330, 2
  %356 = shl i32 %341, 1
  %357 = and i32 %356, 2
  %358 = or i32 %357, %355
  %359 = load i32, i32* %0, align 4
  %360 = and i32 %359, 1
  %361 = or i32 %358, %360
  %362 = load i32, i32* %3, align 4
  %363 = and i32 %362, 1
  %364 = or i32 %354, %363
  %365 = and i32 %347, 1
  %366 = or i32 %350, %365
  %367 = ashr i32 %359, 1
  store i32 %367, i32* %0, align 4
  %368 = load i32, i32* %3, align 4
  %369 = ashr i32 %368, 1
  store i32 %369, i32* %3, align 4
  %370 = load i32, i32* %5, align 4
  %371 = ashr i32 %370, 1
  store i32 %371, i32* %5, align 4
  %372 = load i32, i32* %0, align 4
  %373 = load i32, i32* %3, align 4
  %374 = ashr i32 %372, 1
  store i32 %374, i32* %0, align 4
  %375 = load i32, i32* %3, align 4
  %376 = ashr i32 %375, 1
  store i32 %376, i32* %3, align 4
  %377 = load i32, i32* %5, align 4
  %378 = ashr i32 %377, 1
  store i32 %378, i32* %5, align 4
  %379 = shl i32 %366, 2
  %380 = and i32 %370, 2
  %381 = or i32 %380, %379
  %382 = shl i32 %364, 2
  %383 = shl i32 %373, 1
  %384 = and i32 %383, 2
  %385 = or i32 %384, %382
  %386 = shl i32 %361, 2
  %387 = shl i32 %372, 1
  %388 = and i32 %387, 2
  %389 = or i32 %388, %386
  %390 = load i32, i32* %0, align 4
  %391 = and i32 %390, 1
  %392 = or i32 %389, %391
  %393 = load i32, i32* %3, align 4
  %394 = and i32 %393, 1
  %395 = or i32 %385, %394
  %396 = and i32 %378, 1
  %397 = or i32 %381, %396
  %398 = ashr i32 %390, 1
  store i32 %398, i32* %0, align 4
  %399 = load i32, i32* %3, align 4
  %400 = ashr i32 %399, 1
  store i32 %400, i32* %3, align 4
  %401 = load i32, i32* %5, align 4
  %402 = ashr i32 %401, 1
  store i32 %402, i32* %5, align 4
  %403 = load i32, i32* %0, align 4
  %404 = load i32, i32* %3, align 4
  %405 = ashr i32 %403, 1
  store i32 %405, i32* %0, align 4
  %406 = load i32, i32* %3, align 4
  %407 = ashr i32 %406, 1
  store i32 %407, i32* %3, align 4
  %408 = load i32, i32* %5, align 4
  %409 = ashr i32 %408, 1
  store i32 %409, i32* %5, align 4
  %410 = shl i32 %397, 2
  %411 = and i32 %401, 2
  %412 = or i32 %411, %410
  %413 = shl i32 %395, 2
  %414 = shl i32 %404, 1
  %415 = and i32 %414, 2
  %416 = or i32 %415, %413
  %417 = shl i32 %392, 2
  %418 = shl i32 %403, 1
  %419 = and i32 %418, 2
  %420 = or i32 %419, %417
  %421 = load i32, i32* %0, align 4
  %422 = and i32 %421, 1
  %423 = or i32 %420, %422
  %424 = load i32, i32* %3, align 4
  %425 = and i32 %424, 1
  %426 = or i32 %416, %425
  %427 = and i32 %409, 1
  %428 = or i32 %412, %427
  %429 = ashr i32 %421, 1
  store i32 %429, i32* %0, align 4
  %430 = load i32, i32* %3, align 4
  %431 = ashr i32 %430, 1
  store i32 %431, i32* %3, align 4
  %432 = load i32, i32* %5, align 4
  %433 = ashr i32 %432, 1
  store i32 %433, i32* %5, align 4
  %434 = load i32, i32* %0, align 4
  %435 = load i32, i32* %3, align 4
  %436 = ashr i32 %434, 1
  store i32 %436, i32* %0, align 4
  %437 = load i32, i32* %3, align 4
  %438 = ashr i32 %437, 1
  store i32 %438, i32* %3, align 4
  %439 = load i32, i32* %5, align 4
  %440 = ashr i32 %439, 1
  store i32 %440, i32* %5, align 4
  %441 = shl i32 %428, 2
  %442 = and i32 %432, 2
  %443 = or i32 %442, %441
  %444 = shl i32 %426, 2
  %445 = shl i32 %435, 1
  %446 = and i32 %445, 2
  %447 = or i32 %446, %444
  %448 = shl i32 %423, 2
  %449 = shl i32 %434, 1
  %450 = and i32 %449, 2
  %451 = or i32 %450, %448
  %452 = load i32, i32* %0, align 4
  %453 = and i32 %452, 1
  %454 = or i32 %451, %453
  %455 = load i32, i32* %3, align 4
  %456 = and i32 %455, 1
  %457 = or i32 %447, %456
  %458 = and i32 %440, 1
  %459 = or i32 %443, %458
  %460 = ashr i32 %452, 1
  store i32 %460, i32* %0, align 4
  %461 = load i32, i32* %3, align 4
  %462 = ashr i32 %461, 1
  store i32 %462, i32* %3, align 4
  %463 = load i32, i32* %5, align 4
  %464 = ashr i32 %463, 1
  store i32 %464, i32* %5, align 4
  %465 = load i32, i32* %0, align 4
  %466 = load i32, i32* %3, align 4
  %467 = ashr i32 %465, 1
  store i32 %467, i32* %0, align 4
  %468 = load i32, i32* %3, align 4
  %469 = ashr i32 %468, 1
  store i32 %469, i32* %3, align 4
  %470 = load i32, i32* %5, align 4
  %471 = ashr i32 %470, 1
  store i32 %471, i32* %5, align 4
  %472 = shl i32 %459, 2
  %473 = and i32 %463, 2
  %474 = or i32 %473, %472
  %475 = shl i32 %457, 2
  %476 = shl i32 %466, 1
  %477 = and i32 %476, 2
  %478 = or i32 %477, %475
  %479 = shl i32 %454, 2
  %480 = shl i32 %465, 1
  %481 = and i32 %480, 2
  %482 = or i32 %481, %479
  %483 = load i32, i32* %0, align 4
  %484 = and i32 %483, 1
  %485 = or i32 %482, %484
  %486 = load i32, i32* %3, align 4
  %487 = and i32 %486, 1
  %488 = or i32 %478, %487
  %489 = and i32 %471, 1
  %490 = or i32 %474, %489
  %491 = ashr i32 %483, 1
  store i32 %491, i32* %0, align 4
  %492 = load i32, i32* %3, align 4
  %493 = ashr i32 %492, 1
  store i32 %493, i32* %3, align 4
  %494 = load i32, i32* %5, align 4
  %495 = ashr i32 %494, 1
  store i32 %495, i32* %5, align 4
  store i32 %490, i32* %0, align 4
  store i32 %488, i32* %3, align 4
  store i32 %485, i32* %5, align 4
  ret void
}

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree norecurse nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}

; ModuleID = 'mu/llvm-ir/main2.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.a = private unnamed_addr constant [3 x i32] [i32 1, i32 3, i32 5], align 4
@.str = private unnamed_addr constant [10 x i8] c"%d\09%d\09%d\0A\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [3 x i32], align 4
  %2 = bitcast [3 x i32]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(12) %2, i8* nonnull align 4 dereferenceable(12) bitcast ([3 x i32]* @__const.main.a to i8*), i64 12, i1 false)
  %3 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 0
  call void @mu(i32* nonnull %3)
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 1
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds [3 x i32], [3 x i32]* %1, i64 0, i64 2
  %8 = load i32, i32* %7, align 4
  %9 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %4, i32 %6, i32 %8)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree noinline norecurse nounwind sspstrong uwtable
define dso_local void @mu(i32* %0) local_unnamed_addr #3 {
  %2 = load i32, i32* %0, align 4
  %3 = shl i32 %2, 2
  %4 = and i32 %3, 4
  %5 = getelementptr inbounds i32, i32* %0, i64 1
  %6 = load i32, i32* %5, align 4
  %7 = shl i32 %6, 2
  %8 = and i32 %7, 4
  %9 = getelementptr inbounds i32, i32* %0, i64 2
  %10 = load i32, i32* %9, align 4
  %11 = shl i32 %10, 2
  %12 = and i32 %11, 4
  %13 = ashr i32 %2, 1
  store i32 %13, i32* %0, align 4
  %14 = ashr i32 %6, 1
  store i32 %14, i32* %5, align 4
  %15 = ashr i32 %10, 1
  store i32 %15, i32* %9, align 4
  %16 = and i32 %2, 2
  %17 = or i32 %4, %16
  %18 = and i32 %6, 2
  %19 = or i32 %8, %18
  %20 = and i32 %10, 2
  %21 = or i32 %12, %20
  %22 = ashr i32 %2, 2
  store i32 %22, i32* %0, align 4
  %23 = ashr i32 %6, 2
  store i32 %23, i32* %5, align 4
  %24 = ashr i32 %10, 2
  store i32 %24, i32* %9, align 4
  %25 = ashr i32 %2, 3
  store i32 %25, i32* %0, align 4
  %26 = ashr i32 %6, 3
  store i32 %26, i32* %5, align 4
  %27 = ashr i32 %10, 3
  store i32 %27, i32* %9, align 4
  %28 = ashr i32 %2, 4
  store i32 %28, i32* %0, align 4
  %29 = ashr i32 %6, 4
  store i32 %29, i32* %5, align 4
  %30 = ashr i32 %10, 4
  store i32 %30, i32* %9, align 4
  %.mask = and i32 %10, 4
  %31 = lshr i32 %10, 2
  %32 = and i32 %31, 2
  %.mask240 = and i32 %6, 4
  %33 = lshr i32 %6, 2
  %34 = and i32 %33, 2
  %.mask241 = and i32 %2, 4
  %35 = lshr i32 %2, 2
  %36 = and i32 %35, 2
  %37 = lshr i32 %2, 4
  %38 = and i32 %37, 1
  %39 = or i32 %36, %.mask241
  %40 = or i32 %39, %38
  %41 = lshr i32 %6, 4
  %42 = and i32 %41, 1
  %43 = or i32 %34, %.mask240
  %44 = or i32 %43, %42
  %45 = lshr i32 %10, 4
  %46 = and i32 %45, 1
  %47 = or i32 %32, %.mask
  %48 = or i32 %47, %46
  %49 = ashr i32 %2, 5
  store i32 %49, i32* %0, align 4
  %50 = ashr i32 %6, 5
  store i32 %50, i32* %5, align 4
  %51 = ashr i32 %10, 5
  store i32 %51, i32* %9, align 4
  %52 = ashr i32 %2, 6
  store i32 %52, i32* %0, align 4
  %53 = ashr i32 %6, 6
  store i32 %53, i32* %5, align 4
  %54 = ashr i32 %10, 6
  store i32 %54, i32* %9, align 4
  %55 = shl nuw nsw i32 %21, 4
  %56 = shl nuw nsw i32 %48, 2
  %57 = or i32 %55, %56
  %58 = lshr i32 %10, 4
  %59 = and i32 %58, 2
  %60 = shl nuw nsw i32 %19, 4
  %61 = shl nuw nsw i32 %44, 2
  %62 = or i32 %60, %61
  %63 = lshr i32 %6, 4
  %64 = and i32 %63, 2
  %65 = shl nuw nsw i32 %17, 4
  %66 = shl nuw nsw i32 %40, 2
  %67 = or i32 %65, %66
  %68 = lshr i32 %2, 4
  %69 = and i32 %68, 2
  %70 = lshr i32 %2, 6
  %71 = and i32 %70, 1
  %72 = or i32 %71, %69
  %73 = or i32 %72, %67
  %74 = lshr i32 %6, 6
  %75 = and i32 %74, 1
  %76 = or i32 %75, %64
  %77 = or i32 %76, %62
  %78 = lshr i32 %10, 6
  %79 = and i32 %78, 1
  %80 = or i32 %79, %59
  %81 = or i32 %80, %57
  %82 = ashr i32 %2, 7
  store i32 %82, i32* %0, align 4
  %83 = ashr i32 %6, 7
  store i32 %83, i32* %5, align 4
  %84 = ashr i32 %10, 7
  store i32 %84, i32* %9, align 4
  %85 = ashr i32 %2, 8
  store i32 %85, i32* %0, align 4
  %86 = ashr i32 %6, 8
  store i32 %86, i32* %5, align 4
  %87 = ashr i32 %10, 8
  store i32 %87, i32* %9, align 4
  %88 = lshr i32 %10, 6
  %89 = and i32 %88, 2
  %90 = lshr i32 %6, 6
  %91 = and i32 %90, 2
  %92 = lshr i32 %2, 6
  %93 = and i32 %92, 2
  %94 = lshr i32 %2, 8
  %95 = and i32 %94, 1
  %96 = or i32 %95, %93
  %97 = lshr i32 %6, 8
  %98 = and i32 %97, 1
  %99 = or i32 %98, %91
  %100 = lshr i32 %10, 8
  %101 = and i32 %100, 1
  %102 = or i32 %101, %89
  %103 = ashr i32 %2, 9
  store i32 %103, i32* %0, align 4
  %104 = ashr i32 %6, 9
  store i32 %104, i32* %5, align 4
  %105 = ashr i32 %10, 9
  store i32 %105, i32* %9, align 4
  %106 = ashr i32 %2, 10
  store i32 %106, i32* %0, align 4
  %107 = ashr i32 %6, 10
  store i32 %107, i32* %5, align 4
  %108 = ashr i32 %10, 10
  store i32 %108, i32* %9, align 4
  %109 = shl nuw nsw i32 %81, 4
  %110 = shl nuw nsw i32 %102, 2
  %111 = or i32 %109, %110
  %112 = lshr i32 %10, 8
  %113 = and i32 %112, 2
  %114 = shl nuw nsw i32 %77, 4
  %115 = shl nuw nsw i32 %99, 2
  %116 = or i32 %114, %115
  %117 = lshr i32 %6, 8
  %118 = and i32 %117, 2
  %119 = shl nuw nsw i32 %73, 4
  %120 = shl nuw nsw i32 %96, 2
  %121 = or i32 %119, %120
  %122 = lshr i32 %2, 8
  %123 = and i32 %122, 2
  %124 = lshr i32 %2, 10
  %125 = and i32 %124, 1
  %126 = or i32 %125, %123
  %127 = or i32 %126, %121
  %128 = lshr i32 %6, 10
  %129 = and i32 %128, 1
  %130 = or i32 %129, %118
  %131 = or i32 %130, %116
  %132 = lshr i32 %10, 10
  %133 = and i32 %132, 1
  %134 = or i32 %133, %113
  %135 = or i32 %134, %111
  %136 = ashr i32 %2, 11
  store i32 %136, i32* %0, align 4
  %137 = ashr i32 %6, 11
  store i32 %137, i32* %5, align 4
  %138 = ashr i32 %10, 11
  store i32 %138, i32* %9, align 4
  %139 = ashr i32 %2, 12
  store i32 %139, i32* %0, align 4
  %140 = ashr i32 %6, 12
  store i32 %140, i32* %5, align 4
  %141 = ashr i32 %10, 12
  store i32 %141, i32* %9, align 4
  %142 = lshr i32 %10, 10
  %143 = and i32 %142, 2
  %144 = lshr i32 %6, 10
  %145 = and i32 %144, 2
  %146 = lshr i32 %2, 10
  %147 = and i32 %146, 2
  %148 = lshr i32 %2, 12
  %149 = and i32 %148, 1
  %150 = or i32 %149, %147
  %151 = lshr i32 %6, 12
  %152 = and i32 %151, 1
  %153 = or i32 %152, %145
  %154 = lshr i32 %10, 12
  %155 = and i32 %154, 1
  %156 = or i32 %155, %143
  %157 = ashr i32 %2, 13
  store i32 %157, i32* %0, align 4
  %158 = ashr i32 %6, 13
  store i32 %158, i32* %5, align 4
  %159 = ashr i32 %10, 13
  store i32 %159, i32* %9, align 4
  %160 = ashr i32 %2, 14
  store i32 %160, i32* %0, align 4
  %161 = ashr i32 %6, 14
  store i32 %161, i32* %5, align 4
  %162 = ashr i32 %10, 14
  store i32 %162, i32* %9, align 4
  %163 = shl i32 %135, 4
  %164 = shl nuw nsw i32 %156, 2
  %165 = or i32 %163, %164
  %166 = lshr i32 %10, 12
  %167 = and i32 %166, 2
  %168 = shl i32 %131, 4
  %169 = shl nuw nsw i32 %153, 2
  %170 = or i32 %168, %169
  %171 = lshr i32 %6, 12
  %172 = and i32 %171, 2
  %173 = shl i32 %127, 4
  %174 = shl nuw nsw i32 %150, 2
  %175 = or i32 %173, %174
  %176 = lshr i32 %2, 12
  %177 = and i32 %176, 2
  %178 = lshr i32 %2, 14
  %179 = and i32 %178, 1
  %180 = or i32 %179, %177
  %181 = or i32 %180, %175
  %182 = lshr i32 %6, 14
  %183 = and i32 %182, 1
  %184 = or i32 %183, %172
  %185 = or i32 %184, %170
  %186 = lshr i32 %10, 14
  %187 = and i32 %186, 1
  %188 = or i32 %187, %167
  %189 = or i32 %188, %165
  %190 = ashr i32 %2, 15
  store i32 %190, i32* %0, align 4
  %191 = ashr i32 %6, 15
  store i32 %191, i32* %5, align 4
  %192 = ashr i32 %10, 15
  store i32 %192, i32* %9, align 4
  %193 = ashr i32 %2, 16
  store i32 %193, i32* %0, align 4
  %194 = ashr i32 %6, 16
  store i32 %194, i32* %5, align 4
  %195 = ashr i32 %10, 16
  store i32 %195, i32* %9, align 4
  %196 = lshr i32 %10, 14
  %197 = and i32 %196, 2
  %198 = lshr i32 %6, 14
  %199 = and i32 %198, 2
  %200 = lshr i32 %2, 14
  %201 = and i32 %200, 2
  %202 = lshr i32 %2, 16
  %203 = and i32 %202, 1
  %204 = or i32 %203, %201
  %205 = lshr i32 %6, 16
  %206 = and i32 %205, 1
  %207 = or i32 %206, %199
  %208 = lshr i32 %10, 16
  %209 = and i32 %208, 1
  %210 = or i32 %209, %197
  %211 = ashr i32 %2, 17
  store i32 %211, i32* %0, align 4
  %212 = ashr i32 %6, 17
  store i32 %212, i32* %5, align 4
  %213 = ashr i32 %10, 17
  store i32 %213, i32* %9, align 4
  %214 = ashr i32 %2, 18
  store i32 %214, i32* %0, align 4
  %215 = ashr i32 %6, 18
  store i32 %215, i32* %5, align 4
  %216 = ashr i32 %10, 18
  store i32 %216, i32* %9, align 4
  %217 = shl i32 %189, 4
  %218 = shl nuw nsw i32 %210, 2
  %219 = or i32 %217, %218
  %220 = lshr i32 %10, 16
  %221 = and i32 %220, 2
  %222 = shl i32 %185, 4
  %223 = shl nuw nsw i32 %207, 2
  %224 = or i32 %222, %223
  %225 = lshr i32 %6, 16
  %226 = and i32 %225, 2
  %227 = shl i32 %181, 4
  %228 = shl nuw nsw i32 %204, 2
  %229 = or i32 %227, %228
  %230 = lshr i32 %2, 16
  %231 = and i32 %230, 2
  %232 = lshr i32 %2, 18
  %233 = and i32 %232, 1
  %234 = or i32 %233, %231
  %235 = or i32 %234, %229
  %236 = lshr i32 %6, 18
  %237 = and i32 %236, 1
  %238 = or i32 %237, %226
  %239 = or i32 %238, %224
  %240 = lshr i32 %10, 18
  %241 = and i32 %240, 1
  %242 = or i32 %241, %221
  %243 = or i32 %242, %219
  %244 = ashr i32 %2, 19
  store i32 %244, i32* %0, align 4
  %245 = ashr i32 %6, 19
  store i32 %245, i32* %5, align 4
  %246 = ashr i32 %10, 19
  store i32 %246, i32* %9, align 4
  %247 = ashr i32 %2, 20
  store i32 %247, i32* %0, align 4
  %248 = ashr i32 %6, 20
  store i32 %248, i32* %5, align 4
  %249 = ashr i32 %10, 20
  store i32 %249, i32* %9, align 4
  %250 = lshr i32 %10, 18
  %251 = and i32 %250, 2
  %252 = lshr i32 %6, 18
  %253 = and i32 %252, 2
  %254 = lshr i32 %2, 18
  %255 = and i32 %254, 2
  %256 = lshr i32 %2, 20
  %257 = and i32 %256, 1
  %258 = or i32 %257, %255
  %259 = lshr i32 %6, 20
  %260 = and i32 %259, 1
  %261 = or i32 %260, %253
  %262 = lshr i32 %10, 20
  %263 = and i32 %262, 1
  %264 = or i32 %263, %251
  %265 = ashr i32 %2, 21
  store i32 %265, i32* %0, align 4
  %266 = ashr i32 %6, 21
  store i32 %266, i32* %5, align 4
  %267 = ashr i32 %10, 21
  store i32 %267, i32* %9, align 4
  %268 = ashr i32 %2, 22
  store i32 %268, i32* %0, align 4
  %269 = ashr i32 %6, 22
  store i32 %269, i32* %5, align 4
  %270 = ashr i32 %10, 22
  store i32 %270, i32* %9, align 4
  %271 = shl i32 %243, 4
  %272 = shl nuw nsw i32 %264, 2
  %273 = or i32 %271, %272
  %274 = lshr i32 %10, 20
  %275 = and i32 %274, 2
  %276 = shl i32 %239, 4
  %277 = shl nuw nsw i32 %261, 2
  %278 = or i32 %276, %277
  %279 = lshr i32 %6, 20
  %280 = and i32 %279, 2
  %281 = shl i32 %235, 4
  %282 = shl nuw nsw i32 %258, 2
  %283 = or i32 %281, %282
  %284 = lshr i32 %2, 20
  %285 = and i32 %284, 2
  %286 = lshr i32 %2, 22
  %287 = and i32 %286, 1
  %288 = or i32 %287, %285
  %289 = or i32 %288, %283
  %290 = lshr i32 %6, 22
  %291 = and i32 %290, 1
  %292 = or i32 %291, %280
  %293 = or i32 %292, %278
  %294 = lshr i32 %10, 22
  %295 = and i32 %294, 1
  %296 = or i32 %295, %275
  %297 = or i32 %296, %273
  %298 = ashr i32 %2, 23
  store i32 %298, i32* %0, align 4
  %299 = ashr i32 %6, 23
  store i32 %299, i32* %5, align 4
  %300 = ashr i32 %10, 23
  store i32 %300, i32* %9, align 4
  %301 = ashr i32 %2, 24
  store i32 %301, i32* %0, align 4
  %302 = ashr i32 %6, 24
  store i32 %302, i32* %5, align 4
  %303 = ashr i32 %10, 24
  store i32 %303, i32* %9, align 4
  %304 = lshr i32 %10, 22
  %305 = and i32 %304, 2
  %306 = lshr i32 %6, 22
  %307 = and i32 %306, 2
  %308 = lshr i32 %2, 22
  %309 = and i32 %308, 2
  %310 = lshr i32 %2, 24
  %311 = and i32 %310, 1
  %312 = or i32 %311, %309
  %313 = lshr i32 %6, 24
  %314 = and i32 %313, 1
  %315 = or i32 %314, %307
  %316 = lshr i32 %10, 24
  %317 = and i32 %316, 1
  %318 = or i32 %317, %305
  %319 = ashr i32 %2, 25
  store i32 %319, i32* %0, align 4
  %320 = ashr i32 %6, 25
  store i32 %320, i32* %5, align 4
  %321 = ashr i32 %10, 25
  store i32 %321, i32* %9, align 4
  %322 = ashr i32 %2, 26
  store i32 %322, i32* %0, align 4
  %323 = ashr i32 %6, 26
  store i32 %323, i32* %5, align 4
  %324 = ashr i32 %10, 26
  store i32 %324, i32* %9, align 4
  %325 = shl i32 %297, 4
  %326 = shl nuw nsw i32 %318, 2
  %327 = or i32 %325, %326
  %328 = lshr i32 %10, 24
  %329 = and i32 %328, 2
  %330 = shl i32 %293, 4
  %331 = shl nuw nsw i32 %315, 2
  %332 = or i32 %330, %331
  %333 = lshr i32 %6, 24
  %334 = and i32 %333, 2
  %335 = shl i32 %289, 4
  %336 = shl nuw nsw i32 %312, 2
  %337 = or i32 %335, %336
  %338 = lshr i32 %2, 24
  %339 = and i32 %338, 2
  %340 = lshr i32 %2, 26
  %341 = and i32 %340, 1
  %342 = or i32 %341, %339
  %343 = or i32 %342, %337
  %344 = lshr i32 %6, 26
  %345 = and i32 %344, 1
  %346 = or i32 %345, %334
  %347 = or i32 %346, %332
  %348 = lshr i32 %10, 26
  %349 = and i32 %348, 1
  %350 = or i32 %349, %329
  %351 = or i32 %350, %327
  %352 = ashr i32 %2, 27
  store i32 %352, i32* %0, align 4
  %353 = ashr i32 %6, 27
  store i32 %353, i32* %5, align 4
  %354 = ashr i32 %10, 27
  store i32 %354, i32* %9, align 4
  %355 = ashr i32 %2, 28
  store i32 %355, i32* %0, align 4
  %356 = ashr i32 %6, 28
  store i32 %356, i32* %5, align 4
  %357 = ashr i32 %10, 28
  store i32 %357, i32* %9, align 4
  %358 = lshr i32 %10, 26
  %359 = and i32 %358, 2
  %360 = lshr i32 %6, 26
  %361 = and i32 %360, 2
  %362 = lshr i32 %2, 26
  %363 = and i32 %362, 2
  %364 = lshr i32 %2, 28
  %365 = and i32 %364, 1
  %366 = or i32 %365, %363
  %367 = lshr i32 %6, 28
  %368 = and i32 %367, 1
  %369 = or i32 %368, %361
  %370 = lshr i32 %10, 28
  %371 = and i32 %370, 1
  %372 = or i32 %371, %359
  %373 = ashr i32 %2, 29
  store i32 %373, i32* %0, align 4
  %374 = ashr i32 %6, 29
  store i32 %374, i32* %5, align 4
  %375 = ashr i32 %10, 29
  store i32 %375, i32* %9, align 4
  %376 = ashr i32 %2, 30
  store i32 %376, i32* %0, align 4
  %377 = ashr i32 %6, 30
  store i32 %377, i32* %5, align 4
  %378 = ashr i32 %10, 30
  store i32 %378, i32* %9, align 4
  %379 = shl i32 %351, 4
  %380 = shl nuw nsw i32 %372, 2
  %381 = or i32 %379, %380
  %382 = lshr i32 %10, 28
  %383 = and i32 %382, 2
  %384 = shl i32 %347, 4
  %385 = shl nuw nsw i32 %369, 2
  %386 = or i32 %384, %385
  %387 = lshr i32 %6, 28
  %388 = and i32 %387, 2
  %389 = shl i32 %343, 4
  %390 = shl nuw nsw i32 %366, 2
  %391 = or i32 %389, %390
  %392 = lshr i32 %2, 28
  %393 = and i32 %392, 2
  %394 = lshr i32 %2, 30
  %395 = and i32 %394, 1
  %396 = or i32 %395, %393
  %397 = or i32 %396, %391
  %398 = lshr i32 %6, 30
  %399 = and i32 %398, 1
  %400 = or i32 %399, %388
  %401 = or i32 %400, %386
  %402 = lshr i32 %10, 30
  %403 = and i32 %402, 1
  %404 = or i32 %403, %383
  %405 = or i32 %404, %381
  %406 = ashr i32 %2, 31
  store i32 %406, i32* %0, align 4
  %407 = ashr i32 %6, 31
  store i32 %407, i32* %5, align 4
  %408 = ashr i32 %10, 31
  store i32 %408, i32* %9, align 4
  %409 = shl i32 %405, 1
  %410 = shl i32 %401, 1
  %411 = shl i32 %397, 1
  %.lobit = lshr i32 %2, 31
  %.sroa.260.31 = or i32 %411, %.lobit
  %.lobit242 = lshr i32 %6, 31
  %spec.select239 = or i32 %410, %.lobit242
  %.lobit243 = lshr i32 %10, 31
  %.sroa.0.31 = or i32 %409, %.lobit243
  store i32 %406, i32* %0, align 4
  store i32 %407, i32* %5, align 4
  store i32 %408, i32* %9, align 4
  store i32 %.sroa.0.31, i32* %0, align 4
  store i32 %spec.select239, i32* %5, align 4
  store i32 %.sroa.260.31, i32* %9, align 4
  ret void
}

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree noinline norecurse nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}

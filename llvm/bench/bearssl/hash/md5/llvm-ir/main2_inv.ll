; ModuleID = 'bearssl/hash/md5/llvm-ir/main2.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.br_md5_context = type { %struct.br_hash_class_*, [64 x i8], i64, [4 x i32] }
%struct.br_hash_class_ = type { i64, i32, void (%struct.br_hash_class_**)*, void (%struct.br_hash_class_**, i8*, i64)*, void (%struct.br_hash_class_**, i8*)*, i64 (%struct.br_hash_class_**, i8*)*, void (%struct.br_hash_class_**, i8*, i64)* }
%union.br_union_u64 = type { i64 }
%union.br_union_u32 = type { i32 }

@__const.main.input_data = private unnamed_addr constant [16 x i8] c"\F3\\\B3\E3z)O-\F5\89\A3@=5w\A4", align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@key = dso_local global [64 x i32] zeroinitializer, align 16
@chunk_size = dso_local constant i64 16, align 8
@number_measurements = dso_local constant i64 100000, align 8
@ctx = common dso_local global %struct.br_md5_context zeroinitializer, align 8
@br_md5_IV = dso_local constant [4 x i32] [i32 1732584193, i32 -271733879, i32 -1732584194, i32 271733878], align 16
@br_md5_vtable = dso_local constant %struct.br_hash_class_ { i64 96, i32 319295489, void (%struct.br_hash_class_**)* bitcast (void (%struct.br_md5_context*, i64)* @br_md5_init to void (%struct.br_hash_class_**)*), void (%struct.br_hash_class_**, i8*, i64)* bitcast (void (%struct.br_md5_context*, i64, i8*, i64, i64)* @br_md5_update to void (%struct.br_hash_class_**, i8*, i64)*), void (%struct.br_hash_class_**, i8*)* bitcast (void (%struct.br_md5_context*, i64, i8*, i64)* @br_md5_out to void (%struct.br_hash_class_**, i8*)*), i64 (%struct.br_hash_class_**, i8*)* bitcast (i64 (%struct.br_md5_context*, i64, i8*, i64)* @br_md5_state to i64 (%struct.br_hash_class_**, i8*)*), void (%struct.br_hash_class_**, i8*, i64)* bitcast (void (%struct.br_md5_context*, i64, i8*, i64, i64)* @br_md5_set_state to void (%struct.br_hash_class_**, i8*, i64)*) }, align 8
@.str.17 = private unnamed_addr constant [10 x i8] c"xlen >= 0\00", align 1
@.str.1 = private unnamed_addr constant [34 x i8] c"bearssl/hash/md5/sources/random.c\00", align 1
@__PRETTY_FUNCTION__.randombytes = private unnamed_addr constant [36 x i8] c"void randombytes(uint8_t *, size_t)\00", align 1
@randombytes.fd = internal global i32 -1, align 4
@.str.2 = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [16 x i8], align 16
  store i32 0, i32* %1, align 4
  call void @init_dut()
  %3 = bitcast [16 x i8]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 getelementptr inbounds ([16 x i8], [16 x i8]* @__const.main.input_data, i32 0, i32 0), i64 16, i1 false)
  %4 = getelementptr inbounds [16 x i8], [16 x i8]* %2, i64 0, i64 0
  %5 = sext i8 16 to i64
  %6 = call i8 @do_one_computation(i8* %4, i64 %5)
  %7 = zext i8 %6 to i32
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %7)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(i8*, ...) #2

define i8 @do_one_computation(i8* %0, i64 %N) {
  %2 = alloca [64 x i32], align 16
  %3 = bitcast [64 x i32]* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 256, i1 false)
  %4 = bitcast i8* %3 to <{ i32, [63 x i32] }>*
  %5 = getelementptr inbounds <{ i32, [63 x i32] }>, <{ i32, [63 x i32] }>* %4, i32 0, i32 0
  store i32 10, i32* %5, align 16
  %6 = getelementptr inbounds [64 x i32], [64 x i32]* %2, i64 0, i64 0
  %7 = sext i32 64 to i64
  call void @br_md5_round(i8* %0, i64 %N, i32* %6, i64 %7)
  call void @br_md5_update(%struct.br_md5_context* @ctx, i64 1, i8* %0, i64 %N, i64 32)
  %8 = getelementptr inbounds i8, i8* %0, i64 0
  %9 = load i8, i8* %8, align 1
  ret i8 %9
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @init_dut() #0 {
  call void @br_md5_init(%struct.br_md5_context* @ctx, i64 1)
  ret void
}

define void @prepare_inputs(i8* %0, i64 %N, i8* %1, i64 %N1) {
  call void @randombytes(i8* %0, i64 %N, i64 1600000)
  br label %3

3:                                                ; preds = %13753, %2
  %.01 = phi i64 [ 0, %2 ], [ %13754, %13753 ]
  %4 = call zeroext i8 @randombit()
  %5 = getelementptr inbounds i8, i8* %1, i64 %.01
  store i8 %4, i8* %5, align 1
  %6 = getelementptr inbounds i8, i8* %1, i64 %.01
  %7 = load i8, i8* %6, align 1
  %8 = zext i8 %7 to i32
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %13

10:                                               ; preds = %3
  %11 = mul nuw nsw i64 %.01, 16
  %12 = getelementptr inbounds i8, i8* %0, i64 %11
  call void @llvm.memset.p0i8.i64(i8* align 1 %12, i8 0, i64 16, i1 false)
  br label %13

13:                                               ; preds = %10, %3
  %14 = add nuw nsw i64 %.01, 1
  %15 = call zeroext i8 @randombit()
  %16 = getelementptr inbounds i8, i8* %1, i64 %14
  store i8 %15, i8* %16, align 1
  %17 = getelementptr inbounds i8, i8* %1, i64 %14
  %18 = load i8, i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %22, label %25

21:                                               ; preds = %13753
  ret void

22:                                               ; preds = %13
  %23 = mul nuw nsw i64 %14, 16
  %24 = getelementptr inbounds i8, i8* %0, i64 %23
  call void @llvm.memset.p0i8.i64(i8* align 1 %24, i8 0, i64 16, i1 false)
  br label %25

25:                                               ; preds = %22, %13
  %26 = add nuw nsw i64 %14, 1
  %27 = call zeroext i8 @randombit()
  %28 = getelementptr inbounds i8, i8* %1, i64 %26
  store i8 %27, i8* %28, align 1
  %29 = getelementptr inbounds i8, i8* %1, i64 %26
  %30 = load i8, i8* %29, align 1
  %31 = zext i8 %30 to i32
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %36

33:                                               ; preds = %25
  %34 = mul nuw nsw i64 %26, 16
  %35 = getelementptr inbounds i8, i8* %0, i64 %34
  call void @llvm.memset.p0i8.i64(i8* align 1 %35, i8 0, i64 16, i1 false)
  br label %36

36:                                               ; preds = %33, %25
  %37 = add nuw nsw i64 %26, 1
  %38 = call zeroext i8 @randombit()
  %39 = getelementptr inbounds i8, i8* %1, i64 %37
  store i8 %38, i8* %39, align 1
  %40 = getelementptr inbounds i8, i8* %1, i64 %37
  %41 = load i8, i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %47

44:                                               ; preds = %36
  %45 = mul nuw nsw i64 %37, 16
  %46 = getelementptr inbounds i8, i8* %0, i64 %45
  call void @llvm.memset.p0i8.i64(i8* align 1 %46, i8 0, i64 16, i1 false)
  br label %47

47:                                               ; preds = %44, %36
  %48 = add nuw nsw i64 %37, 1
  %49 = call zeroext i8 @randombit()
  %50 = getelementptr inbounds i8, i8* %1, i64 %48
  store i8 %49, i8* %50, align 1
  %51 = getelementptr inbounds i8, i8* %1, i64 %48
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %58

55:                                               ; preds = %47
  %56 = mul nuw nsw i64 %48, 16
  %57 = getelementptr inbounds i8, i8* %0, i64 %56
  call void @llvm.memset.p0i8.i64(i8* align 1 %57, i8 0, i64 16, i1 false)
  br label %58

58:                                               ; preds = %55, %47
  %59 = add nuw nsw i64 %48, 1
  %60 = call zeroext i8 @randombit()
  %61 = getelementptr inbounds i8, i8* %1, i64 %59
  store i8 %60, i8* %61, align 1
  %62 = getelementptr inbounds i8, i8* %1, i64 %59
  %63 = load i8, i8* %62, align 1
  %64 = zext i8 %63 to i32
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %69

66:                                               ; preds = %58
  %67 = mul nuw nsw i64 %59, 16
  %68 = getelementptr inbounds i8, i8* %0, i64 %67
  call void @llvm.memset.p0i8.i64(i8* align 1 %68, i8 0, i64 16, i1 false)
  br label %69

69:                                               ; preds = %66, %58
  %70 = add nuw nsw i64 %59, 1
  %71 = call zeroext i8 @randombit()
  %72 = getelementptr inbounds i8, i8* %1, i64 %70
  store i8 %71, i8* %72, align 1
  %73 = getelementptr inbounds i8, i8* %1, i64 %70
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %80

77:                                               ; preds = %69
  %78 = mul nuw nsw i64 %70, 16
  %79 = getelementptr inbounds i8, i8* %0, i64 %78
  call void @llvm.memset.p0i8.i64(i8* align 1 %79, i8 0, i64 16, i1 false)
  br label %80

80:                                               ; preds = %77, %69
  %81 = add nuw nsw i64 %70, 1
  %82 = call zeroext i8 @randombit()
  %83 = getelementptr inbounds i8, i8* %1, i64 %81
  store i8 %82, i8* %83, align 1
  %84 = getelementptr inbounds i8, i8* %1, i64 %81
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %91

88:                                               ; preds = %80
  %89 = mul nuw nsw i64 %81, 16
  %90 = getelementptr inbounds i8, i8* %0, i64 %89
  call void @llvm.memset.p0i8.i64(i8* align 1 %90, i8 0, i64 16, i1 false)
  br label %91

91:                                               ; preds = %88, %80
  %92 = add nuw nsw i64 %81, 1
  %93 = call zeroext i8 @randombit()
  %94 = getelementptr inbounds i8, i8* %1, i64 %92
  store i8 %93, i8* %94, align 1
  %95 = getelementptr inbounds i8, i8* %1, i64 %92
  %96 = load i8, i8* %95, align 1
  %97 = zext i8 %96 to i32
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %102

99:                                               ; preds = %91
  %100 = mul nuw nsw i64 %92, 16
  %101 = getelementptr inbounds i8, i8* %0, i64 %100
  call void @llvm.memset.p0i8.i64(i8* align 1 %101, i8 0, i64 16, i1 false)
  br label %102

102:                                              ; preds = %99, %91
  %103 = add nuw nsw i64 %92, 1
  %104 = call zeroext i8 @randombit()
  %105 = getelementptr inbounds i8, i8* %1, i64 %103
  store i8 %104, i8* %105, align 1
  %106 = getelementptr inbounds i8, i8* %1, i64 %103
  %107 = load i8, i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %113

110:                                              ; preds = %102
  %111 = mul nuw nsw i64 %103, 16
  %112 = getelementptr inbounds i8, i8* %0, i64 %111
  call void @llvm.memset.p0i8.i64(i8* align 1 %112, i8 0, i64 16, i1 false)
  br label %113

113:                                              ; preds = %110, %102
  %114 = add nuw nsw i64 %103, 1
  %115 = call zeroext i8 @randombit()
  %116 = getelementptr inbounds i8, i8* %1, i64 %114
  store i8 %115, i8* %116, align 1
  %117 = getelementptr inbounds i8, i8* %1, i64 %114
  %118 = load i8, i8* %117, align 1
  %119 = zext i8 %118 to i32
  %120 = icmp eq i32 %119, 0
  br i1 %120, label %121, label %124

121:                                              ; preds = %113
  %122 = mul nuw nsw i64 %114, 16
  %123 = getelementptr inbounds i8, i8* %0, i64 %122
  call void @llvm.memset.p0i8.i64(i8* align 1 %123, i8 0, i64 16, i1 false)
  br label %124

124:                                              ; preds = %121, %113
  %125 = add nuw nsw i64 %114, 1
  %126 = call zeroext i8 @randombit()
  %127 = getelementptr inbounds i8, i8* %1, i64 %125
  store i8 %126, i8* %127, align 1
  %128 = getelementptr inbounds i8, i8* %1, i64 %125
  %129 = load i8, i8* %128, align 1
  %130 = zext i8 %129 to i32
  %131 = icmp eq i32 %130, 0
  br i1 %131, label %132, label %135

132:                                              ; preds = %124
  %133 = mul nuw nsw i64 %125, 16
  %134 = getelementptr inbounds i8, i8* %0, i64 %133
  call void @llvm.memset.p0i8.i64(i8* align 1 %134, i8 0, i64 16, i1 false)
  br label %135

135:                                              ; preds = %132, %124
  %136 = add nuw nsw i64 %125, 1
  %137 = call zeroext i8 @randombit()
  %138 = getelementptr inbounds i8, i8* %1, i64 %136
  store i8 %137, i8* %138, align 1
  %139 = getelementptr inbounds i8, i8* %1, i64 %136
  %140 = load i8, i8* %139, align 1
  %141 = zext i8 %140 to i32
  %142 = icmp eq i32 %141, 0
  br i1 %142, label %143, label %146

143:                                              ; preds = %135
  %144 = mul nuw nsw i64 %136, 16
  %145 = getelementptr inbounds i8, i8* %0, i64 %144
  call void @llvm.memset.p0i8.i64(i8* align 1 %145, i8 0, i64 16, i1 false)
  br label %146

146:                                              ; preds = %143, %135
  %147 = add nuw nsw i64 %136, 1
  %148 = call zeroext i8 @randombit()
  %149 = getelementptr inbounds i8, i8* %1, i64 %147
  store i8 %148, i8* %149, align 1
  %150 = getelementptr inbounds i8, i8* %1, i64 %147
  %151 = load i8, i8* %150, align 1
  %152 = zext i8 %151 to i32
  %153 = icmp eq i32 %152, 0
  br i1 %153, label %154, label %157

154:                                              ; preds = %146
  %155 = mul nuw nsw i64 %147, 16
  %156 = getelementptr inbounds i8, i8* %0, i64 %155
  call void @llvm.memset.p0i8.i64(i8* align 1 %156, i8 0, i64 16, i1 false)
  br label %157

157:                                              ; preds = %154, %146
  %158 = add nuw nsw i64 %147, 1
  %159 = call zeroext i8 @randombit()
  %160 = getelementptr inbounds i8, i8* %1, i64 %158
  store i8 %159, i8* %160, align 1
  %161 = getelementptr inbounds i8, i8* %1, i64 %158
  %162 = load i8, i8* %161, align 1
  %163 = zext i8 %162 to i32
  %164 = icmp eq i32 %163, 0
  br i1 %164, label %165, label %168

165:                                              ; preds = %157
  %166 = mul nuw nsw i64 %158, 16
  %167 = getelementptr inbounds i8, i8* %0, i64 %166
  call void @llvm.memset.p0i8.i64(i8* align 1 %167, i8 0, i64 16, i1 false)
  br label %168

168:                                              ; preds = %165, %157
  %169 = add nuw nsw i64 %158, 1
  %170 = call zeroext i8 @randombit()
  %171 = getelementptr inbounds i8, i8* %1, i64 %169
  store i8 %170, i8* %171, align 1
  %172 = getelementptr inbounds i8, i8* %1, i64 %169
  %173 = load i8, i8* %172, align 1
  %174 = zext i8 %173 to i32
  %175 = icmp eq i32 %174, 0
  br i1 %175, label %176, label %179

176:                                              ; preds = %168
  %177 = mul nuw nsw i64 %169, 16
  %178 = getelementptr inbounds i8, i8* %0, i64 %177
  call void @llvm.memset.p0i8.i64(i8* align 1 %178, i8 0, i64 16, i1 false)
  br label %179

179:                                              ; preds = %176, %168
  %180 = add nuw nsw i64 %169, 1
  %181 = call zeroext i8 @randombit()
  %182 = getelementptr inbounds i8, i8* %1, i64 %180
  store i8 %181, i8* %182, align 1
  %183 = getelementptr inbounds i8, i8* %1, i64 %180
  %184 = load i8, i8* %183, align 1
  %185 = zext i8 %184 to i32
  %186 = icmp eq i32 %185, 0
  br i1 %186, label %187, label %190

187:                                              ; preds = %179
  %188 = mul nuw nsw i64 %180, 16
  %189 = getelementptr inbounds i8, i8* %0, i64 %188
  call void @llvm.memset.p0i8.i64(i8* align 1 %189, i8 0, i64 16, i1 false)
  br label %190

190:                                              ; preds = %187, %179
  %191 = add nuw nsw i64 %180, 1
  %192 = call zeroext i8 @randombit()
  %193 = getelementptr inbounds i8, i8* %1, i64 %191
  store i8 %192, i8* %193, align 1
  %194 = getelementptr inbounds i8, i8* %1, i64 %191
  %195 = load i8, i8* %194, align 1
  %196 = zext i8 %195 to i32
  %197 = icmp eq i32 %196, 0
  br i1 %197, label %198, label %201

198:                                              ; preds = %190
  %199 = mul nuw nsw i64 %191, 16
  %200 = getelementptr inbounds i8, i8* %0, i64 %199
  call void @llvm.memset.p0i8.i64(i8* align 1 %200, i8 0, i64 16, i1 false)
  br label %201

201:                                              ; preds = %198, %190
  %202 = add nuw nsw i64 %191, 1
  %203 = call zeroext i8 @randombit()
  %204 = getelementptr inbounds i8, i8* %1, i64 %202
  store i8 %203, i8* %204, align 1
  %205 = getelementptr inbounds i8, i8* %1, i64 %202
  %206 = load i8, i8* %205, align 1
  %207 = zext i8 %206 to i32
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %209, label %212

209:                                              ; preds = %201
  %210 = mul nuw nsw i64 %202, 16
  %211 = getelementptr inbounds i8, i8* %0, i64 %210
  call void @llvm.memset.p0i8.i64(i8* align 1 %211, i8 0, i64 16, i1 false)
  br label %212

212:                                              ; preds = %209, %201
  %213 = add nuw nsw i64 %202, 1
  %214 = call zeroext i8 @randombit()
  %215 = getelementptr inbounds i8, i8* %1, i64 %213
  store i8 %214, i8* %215, align 1
  %216 = getelementptr inbounds i8, i8* %1, i64 %213
  %217 = load i8, i8* %216, align 1
  %218 = zext i8 %217 to i32
  %219 = icmp eq i32 %218, 0
  br i1 %219, label %220, label %223

220:                                              ; preds = %212
  %221 = mul nuw nsw i64 %213, 16
  %222 = getelementptr inbounds i8, i8* %0, i64 %221
  call void @llvm.memset.p0i8.i64(i8* align 1 %222, i8 0, i64 16, i1 false)
  br label %223

223:                                              ; preds = %220, %212
  %224 = add nuw nsw i64 %213, 1
  %225 = call zeroext i8 @randombit()
  %226 = getelementptr inbounds i8, i8* %1, i64 %224
  store i8 %225, i8* %226, align 1
  %227 = getelementptr inbounds i8, i8* %1, i64 %224
  %228 = load i8, i8* %227, align 1
  %229 = zext i8 %228 to i32
  %230 = icmp eq i32 %229, 0
  br i1 %230, label %231, label %234

231:                                              ; preds = %223
  %232 = mul nuw nsw i64 %224, 16
  %233 = getelementptr inbounds i8, i8* %0, i64 %232
  call void @llvm.memset.p0i8.i64(i8* align 1 %233, i8 0, i64 16, i1 false)
  br label %234

234:                                              ; preds = %231, %223
  %235 = add nuw nsw i64 %224, 1
  %236 = call zeroext i8 @randombit()
  %237 = getelementptr inbounds i8, i8* %1, i64 %235
  store i8 %236, i8* %237, align 1
  %238 = getelementptr inbounds i8, i8* %1, i64 %235
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = icmp eq i32 %240, 0
  br i1 %241, label %242, label %245

242:                                              ; preds = %234
  %243 = mul nuw nsw i64 %235, 16
  %244 = getelementptr inbounds i8, i8* %0, i64 %243
  call void @llvm.memset.p0i8.i64(i8* align 1 %244, i8 0, i64 16, i1 false)
  br label %245

245:                                              ; preds = %242, %234
  %246 = add nuw nsw i64 %235, 1
  %247 = call zeroext i8 @randombit()
  %248 = getelementptr inbounds i8, i8* %1, i64 %246
  store i8 %247, i8* %248, align 1
  %249 = getelementptr inbounds i8, i8* %1, i64 %246
  %250 = load i8, i8* %249, align 1
  %251 = zext i8 %250 to i32
  %252 = icmp eq i32 %251, 0
  br i1 %252, label %253, label %256

253:                                              ; preds = %245
  %254 = mul nuw nsw i64 %246, 16
  %255 = getelementptr inbounds i8, i8* %0, i64 %254
  call void @llvm.memset.p0i8.i64(i8* align 1 %255, i8 0, i64 16, i1 false)
  br label %256

256:                                              ; preds = %253, %245
  %257 = add nuw nsw i64 %246, 1
  %258 = call zeroext i8 @randombit()
  %259 = getelementptr inbounds i8, i8* %1, i64 %257
  store i8 %258, i8* %259, align 1
  %260 = getelementptr inbounds i8, i8* %1, i64 %257
  %261 = load i8, i8* %260, align 1
  %262 = zext i8 %261 to i32
  %263 = icmp eq i32 %262, 0
  br i1 %263, label %264, label %267

264:                                              ; preds = %256
  %265 = mul nuw nsw i64 %257, 16
  %266 = getelementptr inbounds i8, i8* %0, i64 %265
  call void @llvm.memset.p0i8.i64(i8* align 1 %266, i8 0, i64 16, i1 false)
  br label %267

267:                                              ; preds = %264, %256
  %268 = add nuw nsw i64 %257, 1
  %269 = call zeroext i8 @randombit()
  %270 = getelementptr inbounds i8, i8* %1, i64 %268
  store i8 %269, i8* %270, align 1
  %271 = getelementptr inbounds i8, i8* %1, i64 %268
  %272 = load i8, i8* %271, align 1
  %273 = zext i8 %272 to i32
  %274 = icmp eq i32 %273, 0
  br i1 %274, label %275, label %278

275:                                              ; preds = %267
  %276 = mul nuw nsw i64 %268, 16
  %277 = getelementptr inbounds i8, i8* %0, i64 %276
  call void @llvm.memset.p0i8.i64(i8* align 1 %277, i8 0, i64 16, i1 false)
  br label %278

278:                                              ; preds = %275, %267
  %279 = add nuw nsw i64 %268, 1
  %280 = call zeroext i8 @randombit()
  %281 = getelementptr inbounds i8, i8* %1, i64 %279
  store i8 %280, i8* %281, align 1
  %282 = getelementptr inbounds i8, i8* %1, i64 %279
  %283 = load i8, i8* %282, align 1
  %284 = zext i8 %283 to i32
  %285 = icmp eq i32 %284, 0
  br i1 %285, label %286, label %289

286:                                              ; preds = %278
  %287 = mul nuw nsw i64 %279, 16
  %288 = getelementptr inbounds i8, i8* %0, i64 %287
  call void @llvm.memset.p0i8.i64(i8* align 1 %288, i8 0, i64 16, i1 false)
  br label %289

289:                                              ; preds = %286, %278
  %290 = add nuw nsw i64 %279, 1
  %291 = call zeroext i8 @randombit()
  %292 = getelementptr inbounds i8, i8* %1, i64 %290
  store i8 %291, i8* %292, align 1
  %293 = getelementptr inbounds i8, i8* %1, i64 %290
  %294 = load i8, i8* %293, align 1
  %295 = zext i8 %294 to i32
  %296 = icmp eq i32 %295, 0
  br i1 %296, label %297, label %300

297:                                              ; preds = %289
  %298 = mul nuw nsw i64 %290, 16
  %299 = getelementptr inbounds i8, i8* %0, i64 %298
  call void @llvm.memset.p0i8.i64(i8* align 1 %299, i8 0, i64 16, i1 false)
  br label %300

300:                                              ; preds = %297, %289
  %301 = add nuw nsw i64 %290, 1
  %302 = call zeroext i8 @randombit()
  %303 = getelementptr inbounds i8, i8* %1, i64 %301
  store i8 %302, i8* %303, align 1
  %304 = getelementptr inbounds i8, i8* %1, i64 %301
  %305 = load i8, i8* %304, align 1
  %306 = zext i8 %305 to i32
  %307 = icmp eq i32 %306, 0
  br i1 %307, label %308, label %311

308:                                              ; preds = %300
  %309 = mul nuw nsw i64 %301, 16
  %310 = getelementptr inbounds i8, i8* %0, i64 %309
  call void @llvm.memset.p0i8.i64(i8* align 1 %310, i8 0, i64 16, i1 false)
  br label %311

311:                                              ; preds = %308, %300
  %312 = add nuw nsw i64 %301, 1
  %313 = call zeroext i8 @randombit()
  %314 = getelementptr inbounds i8, i8* %1, i64 %312
  store i8 %313, i8* %314, align 1
  %315 = getelementptr inbounds i8, i8* %1, i64 %312
  %316 = load i8, i8* %315, align 1
  %317 = zext i8 %316 to i32
  %318 = icmp eq i32 %317, 0
  br i1 %318, label %319, label %322

319:                                              ; preds = %311
  %320 = mul nuw nsw i64 %312, 16
  %321 = getelementptr inbounds i8, i8* %0, i64 %320
  call void @llvm.memset.p0i8.i64(i8* align 1 %321, i8 0, i64 16, i1 false)
  br label %322

322:                                              ; preds = %319, %311
  %323 = add nuw nsw i64 %312, 1
  %324 = call zeroext i8 @randombit()
  %325 = getelementptr inbounds i8, i8* %1, i64 %323
  store i8 %324, i8* %325, align 1
  %326 = getelementptr inbounds i8, i8* %1, i64 %323
  %327 = load i8, i8* %326, align 1
  %328 = zext i8 %327 to i32
  %329 = icmp eq i32 %328, 0
  br i1 %329, label %330, label %333

330:                                              ; preds = %322
  %331 = mul nuw nsw i64 %323, 16
  %332 = getelementptr inbounds i8, i8* %0, i64 %331
  call void @llvm.memset.p0i8.i64(i8* align 1 %332, i8 0, i64 16, i1 false)
  br label %333

333:                                              ; preds = %330, %322
  %334 = add nuw nsw i64 %323, 1
  %335 = call zeroext i8 @randombit()
  %336 = getelementptr inbounds i8, i8* %1, i64 %334
  store i8 %335, i8* %336, align 1
  %337 = getelementptr inbounds i8, i8* %1, i64 %334
  %338 = load i8, i8* %337, align 1
  %339 = zext i8 %338 to i32
  %340 = icmp eq i32 %339, 0
  br i1 %340, label %341, label %344

341:                                              ; preds = %333
  %342 = mul nuw nsw i64 %334, 16
  %343 = getelementptr inbounds i8, i8* %0, i64 %342
  call void @llvm.memset.p0i8.i64(i8* align 1 %343, i8 0, i64 16, i1 false)
  br label %344

344:                                              ; preds = %341, %333
  %345 = add nuw nsw i64 %334, 1
  %346 = call zeroext i8 @randombit()
  %347 = getelementptr inbounds i8, i8* %1, i64 %345
  store i8 %346, i8* %347, align 1
  %348 = getelementptr inbounds i8, i8* %1, i64 %345
  %349 = load i8, i8* %348, align 1
  %350 = zext i8 %349 to i32
  %351 = icmp eq i32 %350, 0
  br i1 %351, label %352, label %355

352:                                              ; preds = %344
  %353 = mul nuw nsw i64 %345, 16
  %354 = getelementptr inbounds i8, i8* %0, i64 %353
  call void @llvm.memset.p0i8.i64(i8* align 1 %354, i8 0, i64 16, i1 false)
  br label %355

355:                                              ; preds = %352, %344
  %356 = add nuw nsw i64 %345, 1
  %357 = call zeroext i8 @randombit()
  %358 = getelementptr inbounds i8, i8* %1, i64 %356
  store i8 %357, i8* %358, align 1
  %359 = getelementptr inbounds i8, i8* %1, i64 %356
  %360 = load i8, i8* %359, align 1
  %361 = zext i8 %360 to i32
  %362 = icmp eq i32 %361, 0
  br i1 %362, label %363, label %366

363:                                              ; preds = %355
  %364 = mul nuw nsw i64 %356, 16
  %365 = getelementptr inbounds i8, i8* %0, i64 %364
  call void @llvm.memset.p0i8.i64(i8* align 1 %365, i8 0, i64 16, i1 false)
  br label %366

366:                                              ; preds = %363, %355
  %367 = add nuw nsw i64 %356, 1
  %368 = call zeroext i8 @randombit()
  %369 = getelementptr inbounds i8, i8* %1, i64 %367
  store i8 %368, i8* %369, align 1
  %370 = getelementptr inbounds i8, i8* %1, i64 %367
  %371 = load i8, i8* %370, align 1
  %372 = zext i8 %371 to i32
  %373 = icmp eq i32 %372, 0
  br i1 %373, label %374, label %377

374:                                              ; preds = %366
  %375 = mul nuw nsw i64 %367, 16
  %376 = getelementptr inbounds i8, i8* %0, i64 %375
  call void @llvm.memset.p0i8.i64(i8* align 1 %376, i8 0, i64 16, i1 false)
  br label %377

377:                                              ; preds = %374, %366
  %378 = add nuw nsw i64 %367, 1
  %379 = call zeroext i8 @randombit()
  %380 = getelementptr inbounds i8, i8* %1, i64 %378
  store i8 %379, i8* %380, align 1
  %381 = getelementptr inbounds i8, i8* %1, i64 %378
  %382 = load i8, i8* %381, align 1
  %383 = zext i8 %382 to i32
  %384 = icmp eq i32 %383, 0
  br i1 %384, label %385, label %388

385:                                              ; preds = %377
  %386 = mul nuw nsw i64 %378, 16
  %387 = getelementptr inbounds i8, i8* %0, i64 %386
  call void @llvm.memset.p0i8.i64(i8* align 1 %387, i8 0, i64 16, i1 false)
  br label %388

388:                                              ; preds = %385, %377
  %389 = add nuw nsw i64 %378, 1
  %390 = call zeroext i8 @randombit()
  %391 = getelementptr inbounds i8, i8* %1, i64 %389
  store i8 %390, i8* %391, align 1
  %392 = getelementptr inbounds i8, i8* %1, i64 %389
  %393 = load i8, i8* %392, align 1
  %394 = zext i8 %393 to i32
  %395 = icmp eq i32 %394, 0
  br i1 %395, label %396, label %399

396:                                              ; preds = %388
  %397 = mul nuw nsw i64 %389, 16
  %398 = getelementptr inbounds i8, i8* %0, i64 %397
  call void @llvm.memset.p0i8.i64(i8* align 1 %398, i8 0, i64 16, i1 false)
  br label %399

399:                                              ; preds = %396, %388
  %400 = add nuw nsw i64 %389, 1
  %401 = call zeroext i8 @randombit()
  %402 = getelementptr inbounds i8, i8* %1, i64 %400
  store i8 %401, i8* %402, align 1
  %403 = getelementptr inbounds i8, i8* %1, i64 %400
  %404 = load i8, i8* %403, align 1
  %405 = zext i8 %404 to i32
  %406 = icmp eq i32 %405, 0
  br i1 %406, label %407, label %410

407:                                              ; preds = %399
  %408 = mul nuw nsw i64 %400, 16
  %409 = getelementptr inbounds i8, i8* %0, i64 %408
  call void @llvm.memset.p0i8.i64(i8* align 1 %409, i8 0, i64 16, i1 false)
  br label %410

410:                                              ; preds = %407, %399
  %411 = add nuw nsw i64 %400, 1
  %412 = call zeroext i8 @randombit()
  %413 = getelementptr inbounds i8, i8* %1, i64 %411
  store i8 %412, i8* %413, align 1
  %414 = getelementptr inbounds i8, i8* %1, i64 %411
  %415 = load i8, i8* %414, align 1
  %416 = zext i8 %415 to i32
  %417 = icmp eq i32 %416, 0
  br i1 %417, label %418, label %421

418:                                              ; preds = %410
  %419 = mul nuw nsw i64 %411, 16
  %420 = getelementptr inbounds i8, i8* %0, i64 %419
  call void @llvm.memset.p0i8.i64(i8* align 1 %420, i8 0, i64 16, i1 false)
  br label %421

421:                                              ; preds = %418, %410
  %422 = add nuw nsw i64 %411, 1
  %423 = call zeroext i8 @randombit()
  %424 = getelementptr inbounds i8, i8* %1, i64 %422
  store i8 %423, i8* %424, align 1
  %425 = getelementptr inbounds i8, i8* %1, i64 %422
  %426 = load i8, i8* %425, align 1
  %427 = zext i8 %426 to i32
  %428 = icmp eq i32 %427, 0
  br i1 %428, label %429, label %432

429:                                              ; preds = %421
  %430 = mul nuw nsw i64 %422, 16
  %431 = getelementptr inbounds i8, i8* %0, i64 %430
  call void @llvm.memset.p0i8.i64(i8* align 1 %431, i8 0, i64 16, i1 false)
  br label %432

432:                                              ; preds = %429, %421
  %433 = add nuw nsw i64 %422, 1
  %434 = call zeroext i8 @randombit()
  %435 = getelementptr inbounds i8, i8* %1, i64 %433
  store i8 %434, i8* %435, align 1
  %436 = getelementptr inbounds i8, i8* %1, i64 %433
  %437 = load i8, i8* %436, align 1
  %438 = zext i8 %437 to i32
  %439 = icmp eq i32 %438, 0
  br i1 %439, label %440, label %443

440:                                              ; preds = %432
  %441 = mul nuw nsw i64 %433, 16
  %442 = getelementptr inbounds i8, i8* %0, i64 %441
  call void @llvm.memset.p0i8.i64(i8* align 1 %442, i8 0, i64 16, i1 false)
  br label %443

443:                                              ; preds = %440, %432
  %444 = add nuw nsw i64 %433, 1
  %445 = call zeroext i8 @randombit()
  %446 = getelementptr inbounds i8, i8* %1, i64 %444
  store i8 %445, i8* %446, align 1
  %447 = getelementptr inbounds i8, i8* %1, i64 %444
  %448 = load i8, i8* %447, align 1
  %449 = zext i8 %448 to i32
  %450 = icmp eq i32 %449, 0
  br i1 %450, label %451, label %454

451:                                              ; preds = %443
  %452 = mul nuw nsw i64 %444, 16
  %453 = getelementptr inbounds i8, i8* %0, i64 %452
  call void @llvm.memset.p0i8.i64(i8* align 1 %453, i8 0, i64 16, i1 false)
  br label %454

454:                                              ; preds = %451, %443
  %455 = add nuw nsw i64 %444, 1
  %456 = call zeroext i8 @randombit()
  %457 = getelementptr inbounds i8, i8* %1, i64 %455
  store i8 %456, i8* %457, align 1
  %458 = getelementptr inbounds i8, i8* %1, i64 %455
  %459 = load i8, i8* %458, align 1
  %460 = zext i8 %459 to i32
  %461 = icmp eq i32 %460, 0
  br i1 %461, label %462, label %465

462:                                              ; preds = %454
  %463 = mul nuw nsw i64 %455, 16
  %464 = getelementptr inbounds i8, i8* %0, i64 %463
  call void @llvm.memset.p0i8.i64(i8* align 1 %464, i8 0, i64 16, i1 false)
  br label %465

465:                                              ; preds = %462, %454
  %466 = add nuw nsw i64 %455, 1
  %467 = call zeroext i8 @randombit()
  %468 = getelementptr inbounds i8, i8* %1, i64 %466
  store i8 %467, i8* %468, align 1
  %469 = getelementptr inbounds i8, i8* %1, i64 %466
  %470 = load i8, i8* %469, align 1
  %471 = zext i8 %470 to i32
  %472 = icmp eq i32 %471, 0
  br i1 %472, label %473, label %476

473:                                              ; preds = %465
  %474 = mul nuw nsw i64 %466, 16
  %475 = getelementptr inbounds i8, i8* %0, i64 %474
  call void @llvm.memset.p0i8.i64(i8* align 1 %475, i8 0, i64 16, i1 false)
  br label %476

476:                                              ; preds = %473, %465
  %477 = add nuw nsw i64 %466, 1
  %478 = call zeroext i8 @randombit()
  %479 = getelementptr inbounds i8, i8* %1, i64 %477
  store i8 %478, i8* %479, align 1
  %480 = getelementptr inbounds i8, i8* %1, i64 %477
  %481 = load i8, i8* %480, align 1
  %482 = zext i8 %481 to i32
  %483 = icmp eq i32 %482, 0
  br i1 %483, label %484, label %487

484:                                              ; preds = %476
  %485 = mul nuw nsw i64 %477, 16
  %486 = getelementptr inbounds i8, i8* %0, i64 %485
  call void @llvm.memset.p0i8.i64(i8* align 1 %486, i8 0, i64 16, i1 false)
  br label %487

487:                                              ; preds = %484, %476
  %488 = add nuw nsw i64 %477, 1
  %489 = call zeroext i8 @randombit()
  %490 = getelementptr inbounds i8, i8* %1, i64 %488
  store i8 %489, i8* %490, align 1
  %491 = getelementptr inbounds i8, i8* %1, i64 %488
  %492 = load i8, i8* %491, align 1
  %493 = zext i8 %492 to i32
  %494 = icmp eq i32 %493, 0
  br i1 %494, label %495, label %498

495:                                              ; preds = %487
  %496 = mul nuw nsw i64 %488, 16
  %497 = getelementptr inbounds i8, i8* %0, i64 %496
  call void @llvm.memset.p0i8.i64(i8* align 1 %497, i8 0, i64 16, i1 false)
  br label %498

498:                                              ; preds = %495, %487
  %499 = add nuw nsw i64 %488, 1
  %500 = call zeroext i8 @randombit()
  %501 = getelementptr inbounds i8, i8* %1, i64 %499
  store i8 %500, i8* %501, align 1
  %502 = getelementptr inbounds i8, i8* %1, i64 %499
  %503 = load i8, i8* %502, align 1
  %504 = zext i8 %503 to i32
  %505 = icmp eq i32 %504, 0
  br i1 %505, label %506, label %509

506:                                              ; preds = %498
  %507 = mul nuw nsw i64 %499, 16
  %508 = getelementptr inbounds i8, i8* %0, i64 %507
  call void @llvm.memset.p0i8.i64(i8* align 1 %508, i8 0, i64 16, i1 false)
  br label %509

509:                                              ; preds = %506, %498
  %510 = add nuw nsw i64 %499, 1
  %511 = call zeroext i8 @randombit()
  %512 = getelementptr inbounds i8, i8* %1, i64 %510
  store i8 %511, i8* %512, align 1
  %513 = getelementptr inbounds i8, i8* %1, i64 %510
  %514 = load i8, i8* %513, align 1
  %515 = zext i8 %514 to i32
  %516 = icmp eq i32 %515, 0
  br i1 %516, label %517, label %520

517:                                              ; preds = %509
  %518 = mul nuw nsw i64 %510, 16
  %519 = getelementptr inbounds i8, i8* %0, i64 %518
  call void @llvm.memset.p0i8.i64(i8* align 1 %519, i8 0, i64 16, i1 false)
  br label %520

520:                                              ; preds = %517, %509
  %521 = add nuw nsw i64 %510, 1
  %522 = call zeroext i8 @randombit()
  %523 = getelementptr inbounds i8, i8* %1, i64 %521
  store i8 %522, i8* %523, align 1
  %524 = getelementptr inbounds i8, i8* %1, i64 %521
  %525 = load i8, i8* %524, align 1
  %526 = zext i8 %525 to i32
  %527 = icmp eq i32 %526, 0
  br i1 %527, label %528, label %531

528:                                              ; preds = %520
  %529 = mul nuw nsw i64 %521, 16
  %530 = getelementptr inbounds i8, i8* %0, i64 %529
  call void @llvm.memset.p0i8.i64(i8* align 1 %530, i8 0, i64 16, i1 false)
  br label %531

531:                                              ; preds = %528, %520
  %532 = add nuw nsw i64 %521, 1
  %533 = call zeroext i8 @randombit()
  %534 = getelementptr inbounds i8, i8* %1, i64 %532
  store i8 %533, i8* %534, align 1
  %535 = getelementptr inbounds i8, i8* %1, i64 %532
  %536 = load i8, i8* %535, align 1
  %537 = zext i8 %536 to i32
  %538 = icmp eq i32 %537, 0
  br i1 %538, label %539, label %542

539:                                              ; preds = %531
  %540 = mul nuw nsw i64 %532, 16
  %541 = getelementptr inbounds i8, i8* %0, i64 %540
  call void @llvm.memset.p0i8.i64(i8* align 1 %541, i8 0, i64 16, i1 false)
  br label %542

542:                                              ; preds = %539, %531
  %543 = add nuw nsw i64 %532, 1
  %544 = call zeroext i8 @randombit()
  %545 = getelementptr inbounds i8, i8* %1, i64 %543
  store i8 %544, i8* %545, align 1
  %546 = getelementptr inbounds i8, i8* %1, i64 %543
  %547 = load i8, i8* %546, align 1
  %548 = zext i8 %547 to i32
  %549 = icmp eq i32 %548, 0
  br i1 %549, label %550, label %553

550:                                              ; preds = %542
  %551 = mul nuw nsw i64 %543, 16
  %552 = getelementptr inbounds i8, i8* %0, i64 %551
  call void @llvm.memset.p0i8.i64(i8* align 1 %552, i8 0, i64 16, i1 false)
  br label %553

553:                                              ; preds = %550, %542
  %554 = add nuw nsw i64 %543, 1
  %555 = call zeroext i8 @randombit()
  %556 = getelementptr inbounds i8, i8* %1, i64 %554
  store i8 %555, i8* %556, align 1
  %557 = getelementptr inbounds i8, i8* %1, i64 %554
  %558 = load i8, i8* %557, align 1
  %559 = zext i8 %558 to i32
  %560 = icmp eq i32 %559, 0
  br i1 %560, label %561, label %564

561:                                              ; preds = %553
  %562 = mul nuw nsw i64 %554, 16
  %563 = getelementptr inbounds i8, i8* %0, i64 %562
  call void @llvm.memset.p0i8.i64(i8* align 1 %563, i8 0, i64 16, i1 false)
  br label %564

564:                                              ; preds = %561, %553
  %565 = add nuw nsw i64 %554, 1
  %566 = call zeroext i8 @randombit()
  %567 = getelementptr inbounds i8, i8* %1, i64 %565
  store i8 %566, i8* %567, align 1
  %568 = getelementptr inbounds i8, i8* %1, i64 %565
  %569 = load i8, i8* %568, align 1
  %570 = zext i8 %569 to i32
  %571 = icmp eq i32 %570, 0
  br i1 %571, label %572, label %575

572:                                              ; preds = %564
  %573 = mul nuw nsw i64 %565, 16
  %574 = getelementptr inbounds i8, i8* %0, i64 %573
  call void @llvm.memset.p0i8.i64(i8* align 1 %574, i8 0, i64 16, i1 false)
  br label %575

575:                                              ; preds = %572, %564
  %576 = add nuw nsw i64 %565, 1
  %577 = call zeroext i8 @randombit()
  %578 = getelementptr inbounds i8, i8* %1, i64 %576
  store i8 %577, i8* %578, align 1
  %579 = getelementptr inbounds i8, i8* %1, i64 %576
  %580 = load i8, i8* %579, align 1
  %581 = zext i8 %580 to i32
  %582 = icmp eq i32 %581, 0
  br i1 %582, label %583, label %586

583:                                              ; preds = %575
  %584 = mul nuw nsw i64 %576, 16
  %585 = getelementptr inbounds i8, i8* %0, i64 %584
  call void @llvm.memset.p0i8.i64(i8* align 1 %585, i8 0, i64 16, i1 false)
  br label %586

586:                                              ; preds = %583, %575
  %587 = add nuw nsw i64 %576, 1
  %588 = call zeroext i8 @randombit()
  %589 = getelementptr inbounds i8, i8* %1, i64 %587
  store i8 %588, i8* %589, align 1
  %590 = getelementptr inbounds i8, i8* %1, i64 %587
  %591 = load i8, i8* %590, align 1
  %592 = zext i8 %591 to i32
  %593 = icmp eq i32 %592, 0
  br i1 %593, label %594, label %597

594:                                              ; preds = %586
  %595 = mul nuw nsw i64 %587, 16
  %596 = getelementptr inbounds i8, i8* %0, i64 %595
  call void @llvm.memset.p0i8.i64(i8* align 1 %596, i8 0, i64 16, i1 false)
  br label %597

597:                                              ; preds = %594, %586
  %598 = add nuw nsw i64 %587, 1
  %599 = call zeroext i8 @randombit()
  %600 = getelementptr inbounds i8, i8* %1, i64 %598
  store i8 %599, i8* %600, align 1
  %601 = getelementptr inbounds i8, i8* %1, i64 %598
  %602 = load i8, i8* %601, align 1
  %603 = zext i8 %602 to i32
  %604 = icmp eq i32 %603, 0
  br i1 %604, label %605, label %608

605:                                              ; preds = %597
  %606 = mul nuw nsw i64 %598, 16
  %607 = getelementptr inbounds i8, i8* %0, i64 %606
  call void @llvm.memset.p0i8.i64(i8* align 1 %607, i8 0, i64 16, i1 false)
  br label %608

608:                                              ; preds = %605, %597
  %609 = add nuw nsw i64 %598, 1
  %610 = call zeroext i8 @randombit()
  %611 = getelementptr inbounds i8, i8* %1, i64 %609
  store i8 %610, i8* %611, align 1
  %612 = getelementptr inbounds i8, i8* %1, i64 %609
  %613 = load i8, i8* %612, align 1
  %614 = zext i8 %613 to i32
  %615 = icmp eq i32 %614, 0
  br i1 %615, label %616, label %619

616:                                              ; preds = %608
  %617 = mul nuw nsw i64 %609, 16
  %618 = getelementptr inbounds i8, i8* %0, i64 %617
  call void @llvm.memset.p0i8.i64(i8* align 1 %618, i8 0, i64 16, i1 false)
  br label %619

619:                                              ; preds = %616, %608
  %620 = add nuw nsw i64 %609, 1
  %621 = call zeroext i8 @randombit()
  %622 = getelementptr inbounds i8, i8* %1, i64 %620
  store i8 %621, i8* %622, align 1
  %623 = getelementptr inbounds i8, i8* %1, i64 %620
  %624 = load i8, i8* %623, align 1
  %625 = zext i8 %624 to i32
  %626 = icmp eq i32 %625, 0
  br i1 %626, label %627, label %630

627:                                              ; preds = %619
  %628 = mul nuw nsw i64 %620, 16
  %629 = getelementptr inbounds i8, i8* %0, i64 %628
  call void @llvm.memset.p0i8.i64(i8* align 1 %629, i8 0, i64 16, i1 false)
  br label %630

630:                                              ; preds = %627, %619
  %631 = add nuw nsw i64 %620, 1
  %632 = call zeroext i8 @randombit()
  %633 = getelementptr inbounds i8, i8* %1, i64 %631
  store i8 %632, i8* %633, align 1
  %634 = getelementptr inbounds i8, i8* %1, i64 %631
  %635 = load i8, i8* %634, align 1
  %636 = zext i8 %635 to i32
  %637 = icmp eq i32 %636, 0
  br i1 %637, label %638, label %641

638:                                              ; preds = %630
  %639 = mul nuw nsw i64 %631, 16
  %640 = getelementptr inbounds i8, i8* %0, i64 %639
  call void @llvm.memset.p0i8.i64(i8* align 1 %640, i8 0, i64 16, i1 false)
  br label %641

641:                                              ; preds = %638, %630
  %642 = add nuw nsw i64 %631, 1
  %643 = call zeroext i8 @randombit()
  %644 = getelementptr inbounds i8, i8* %1, i64 %642
  store i8 %643, i8* %644, align 1
  %645 = getelementptr inbounds i8, i8* %1, i64 %642
  %646 = load i8, i8* %645, align 1
  %647 = zext i8 %646 to i32
  %648 = icmp eq i32 %647, 0
  br i1 %648, label %649, label %652

649:                                              ; preds = %641
  %650 = mul nuw nsw i64 %642, 16
  %651 = getelementptr inbounds i8, i8* %0, i64 %650
  call void @llvm.memset.p0i8.i64(i8* align 1 %651, i8 0, i64 16, i1 false)
  br label %652

652:                                              ; preds = %649, %641
  %653 = add nuw nsw i64 %642, 1
  %654 = call zeroext i8 @randombit()
  %655 = getelementptr inbounds i8, i8* %1, i64 %653
  store i8 %654, i8* %655, align 1
  %656 = getelementptr inbounds i8, i8* %1, i64 %653
  %657 = load i8, i8* %656, align 1
  %658 = zext i8 %657 to i32
  %659 = icmp eq i32 %658, 0
  br i1 %659, label %660, label %663

660:                                              ; preds = %652
  %661 = mul nuw nsw i64 %653, 16
  %662 = getelementptr inbounds i8, i8* %0, i64 %661
  call void @llvm.memset.p0i8.i64(i8* align 1 %662, i8 0, i64 16, i1 false)
  br label %663

663:                                              ; preds = %660, %652
  %664 = add nuw nsw i64 %653, 1
  %665 = call zeroext i8 @randombit()
  %666 = getelementptr inbounds i8, i8* %1, i64 %664
  store i8 %665, i8* %666, align 1
  %667 = getelementptr inbounds i8, i8* %1, i64 %664
  %668 = load i8, i8* %667, align 1
  %669 = zext i8 %668 to i32
  %670 = icmp eq i32 %669, 0
  br i1 %670, label %671, label %674

671:                                              ; preds = %663
  %672 = mul nuw nsw i64 %664, 16
  %673 = getelementptr inbounds i8, i8* %0, i64 %672
  call void @llvm.memset.p0i8.i64(i8* align 1 %673, i8 0, i64 16, i1 false)
  br label %674

674:                                              ; preds = %671, %663
  %675 = add nuw nsw i64 %664, 1
  %676 = call zeroext i8 @randombit()
  %677 = getelementptr inbounds i8, i8* %1, i64 %675
  store i8 %676, i8* %677, align 1
  %678 = getelementptr inbounds i8, i8* %1, i64 %675
  %679 = load i8, i8* %678, align 1
  %680 = zext i8 %679 to i32
  %681 = icmp eq i32 %680, 0
  br i1 %681, label %682, label %685

682:                                              ; preds = %674
  %683 = mul nuw nsw i64 %675, 16
  %684 = getelementptr inbounds i8, i8* %0, i64 %683
  call void @llvm.memset.p0i8.i64(i8* align 1 %684, i8 0, i64 16, i1 false)
  br label %685

685:                                              ; preds = %682, %674
  %686 = add nuw nsw i64 %675, 1
  %687 = call zeroext i8 @randombit()
  %688 = getelementptr inbounds i8, i8* %1, i64 %686
  store i8 %687, i8* %688, align 1
  %689 = getelementptr inbounds i8, i8* %1, i64 %686
  %690 = load i8, i8* %689, align 1
  %691 = zext i8 %690 to i32
  %692 = icmp eq i32 %691, 0
  br i1 %692, label %693, label %696

693:                                              ; preds = %685
  %694 = mul nuw nsw i64 %686, 16
  %695 = getelementptr inbounds i8, i8* %0, i64 %694
  call void @llvm.memset.p0i8.i64(i8* align 1 %695, i8 0, i64 16, i1 false)
  br label %696

696:                                              ; preds = %693, %685
  %697 = add nuw nsw i64 %686, 1
  %698 = call zeroext i8 @randombit()
  %699 = getelementptr inbounds i8, i8* %1, i64 %697
  store i8 %698, i8* %699, align 1
  %700 = getelementptr inbounds i8, i8* %1, i64 %697
  %701 = load i8, i8* %700, align 1
  %702 = zext i8 %701 to i32
  %703 = icmp eq i32 %702, 0
  br i1 %703, label %704, label %707

704:                                              ; preds = %696
  %705 = mul nuw nsw i64 %697, 16
  %706 = getelementptr inbounds i8, i8* %0, i64 %705
  call void @llvm.memset.p0i8.i64(i8* align 1 %706, i8 0, i64 16, i1 false)
  br label %707

707:                                              ; preds = %704, %696
  %708 = add nuw nsw i64 %697, 1
  %709 = call zeroext i8 @randombit()
  %710 = getelementptr inbounds i8, i8* %1, i64 %708
  store i8 %709, i8* %710, align 1
  %711 = getelementptr inbounds i8, i8* %1, i64 %708
  %712 = load i8, i8* %711, align 1
  %713 = zext i8 %712 to i32
  %714 = icmp eq i32 %713, 0
  br i1 %714, label %715, label %718

715:                                              ; preds = %707
  %716 = mul nuw nsw i64 %708, 16
  %717 = getelementptr inbounds i8, i8* %0, i64 %716
  call void @llvm.memset.p0i8.i64(i8* align 1 %717, i8 0, i64 16, i1 false)
  br label %718

718:                                              ; preds = %715, %707
  %719 = add nuw nsw i64 %708, 1
  %720 = call zeroext i8 @randombit()
  %721 = getelementptr inbounds i8, i8* %1, i64 %719
  store i8 %720, i8* %721, align 1
  %722 = getelementptr inbounds i8, i8* %1, i64 %719
  %723 = load i8, i8* %722, align 1
  %724 = zext i8 %723 to i32
  %725 = icmp eq i32 %724, 0
  br i1 %725, label %726, label %729

726:                                              ; preds = %718
  %727 = mul nuw nsw i64 %719, 16
  %728 = getelementptr inbounds i8, i8* %0, i64 %727
  call void @llvm.memset.p0i8.i64(i8* align 1 %728, i8 0, i64 16, i1 false)
  br label %729

729:                                              ; preds = %726, %718
  %730 = add nuw nsw i64 %719, 1
  %731 = call zeroext i8 @randombit()
  %732 = getelementptr inbounds i8, i8* %1, i64 %730
  store i8 %731, i8* %732, align 1
  %733 = getelementptr inbounds i8, i8* %1, i64 %730
  %734 = load i8, i8* %733, align 1
  %735 = zext i8 %734 to i32
  %736 = icmp eq i32 %735, 0
  br i1 %736, label %737, label %740

737:                                              ; preds = %729
  %738 = mul nuw nsw i64 %730, 16
  %739 = getelementptr inbounds i8, i8* %0, i64 %738
  call void @llvm.memset.p0i8.i64(i8* align 1 %739, i8 0, i64 16, i1 false)
  br label %740

740:                                              ; preds = %737, %729
  %741 = add nuw nsw i64 %730, 1
  %742 = call zeroext i8 @randombit()
  %743 = getelementptr inbounds i8, i8* %1, i64 %741
  store i8 %742, i8* %743, align 1
  %744 = getelementptr inbounds i8, i8* %1, i64 %741
  %745 = load i8, i8* %744, align 1
  %746 = zext i8 %745 to i32
  %747 = icmp eq i32 %746, 0
  br i1 %747, label %748, label %751

748:                                              ; preds = %740
  %749 = mul nuw nsw i64 %741, 16
  %750 = getelementptr inbounds i8, i8* %0, i64 %749
  call void @llvm.memset.p0i8.i64(i8* align 1 %750, i8 0, i64 16, i1 false)
  br label %751

751:                                              ; preds = %748, %740
  %752 = add nuw nsw i64 %741, 1
  %753 = call zeroext i8 @randombit()
  %754 = getelementptr inbounds i8, i8* %1, i64 %752
  store i8 %753, i8* %754, align 1
  %755 = getelementptr inbounds i8, i8* %1, i64 %752
  %756 = load i8, i8* %755, align 1
  %757 = zext i8 %756 to i32
  %758 = icmp eq i32 %757, 0
  br i1 %758, label %759, label %762

759:                                              ; preds = %751
  %760 = mul nuw nsw i64 %752, 16
  %761 = getelementptr inbounds i8, i8* %0, i64 %760
  call void @llvm.memset.p0i8.i64(i8* align 1 %761, i8 0, i64 16, i1 false)
  br label %762

762:                                              ; preds = %759, %751
  %763 = add nuw nsw i64 %752, 1
  %764 = call zeroext i8 @randombit()
  %765 = getelementptr inbounds i8, i8* %1, i64 %763
  store i8 %764, i8* %765, align 1
  %766 = getelementptr inbounds i8, i8* %1, i64 %763
  %767 = load i8, i8* %766, align 1
  %768 = zext i8 %767 to i32
  %769 = icmp eq i32 %768, 0
  br i1 %769, label %770, label %773

770:                                              ; preds = %762
  %771 = mul nuw nsw i64 %763, 16
  %772 = getelementptr inbounds i8, i8* %0, i64 %771
  call void @llvm.memset.p0i8.i64(i8* align 1 %772, i8 0, i64 16, i1 false)
  br label %773

773:                                              ; preds = %770, %762
  %774 = add nuw nsw i64 %763, 1
  %775 = call zeroext i8 @randombit()
  %776 = getelementptr inbounds i8, i8* %1, i64 %774
  store i8 %775, i8* %776, align 1
  %777 = getelementptr inbounds i8, i8* %1, i64 %774
  %778 = load i8, i8* %777, align 1
  %779 = zext i8 %778 to i32
  %780 = icmp eq i32 %779, 0
  br i1 %780, label %781, label %784

781:                                              ; preds = %773
  %782 = mul nuw nsw i64 %774, 16
  %783 = getelementptr inbounds i8, i8* %0, i64 %782
  call void @llvm.memset.p0i8.i64(i8* align 1 %783, i8 0, i64 16, i1 false)
  br label %784

784:                                              ; preds = %781, %773
  %785 = add nuw nsw i64 %774, 1
  %786 = call zeroext i8 @randombit()
  %787 = getelementptr inbounds i8, i8* %1, i64 %785
  store i8 %786, i8* %787, align 1
  %788 = getelementptr inbounds i8, i8* %1, i64 %785
  %789 = load i8, i8* %788, align 1
  %790 = zext i8 %789 to i32
  %791 = icmp eq i32 %790, 0
  br i1 %791, label %792, label %795

792:                                              ; preds = %784
  %793 = mul nuw nsw i64 %785, 16
  %794 = getelementptr inbounds i8, i8* %0, i64 %793
  call void @llvm.memset.p0i8.i64(i8* align 1 %794, i8 0, i64 16, i1 false)
  br label %795

795:                                              ; preds = %792, %784
  %796 = add nuw nsw i64 %785, 1
  %797 = call zeroext i8 @randombit()
  %798 = getelementptr inbounds i8, i8* %1, i64 %796
  store i8 %797, i8* %798, align 1
  %799 = getelementptr inbounds i8, i8* %1, i64 %796
  %800 = load i8, i8* %799, align 1
  %801 = zext i8 %800 to i32
  %802 = icmp eq i32 %801, 0
  br i1 %802, label %803, label %806

803:                                              ; preds = %795
  %804 = mul nuw nsw i64 %796, 16
  %805 = getelementptr inbounds i8, i8* %0, i64 %804
  call void @llvm.memset.p0i8.i64(i8* align 1 %805, i8 0, i64 16, i1 false)
  br label %806

806:                                              ; preds = %803, %795
  %807 = add nuw nsw i64 %796, 1
  %808 = call zeroext i8 @randombit()
  %809 = getelementptr inbounds i8, i8* %1, i64 %807
  store i8 %808, i8* %809, align 1
  %810 = getelementptr inbounds i8, i8* %1, i64 %807
  %811 = load i8, i8* %810, align 1
  %812 = zext i8 %811 to i32
  %813 = icmp eq i32 %812, 0
  br i1 %813, label %814, label %817

814:                                              ; preds = %806
  %815 = mul nuw nsw i64 %807, 16
  %816 = getelementptr inbounds i8, i8* %0, i64 %815
  call void @llvm.memset.p0i8.i64(i8* align 1 %816, i8 0, i64 16, i1 false)
  br label %817

817:                                              ; preds = %814, %806
  %818 = add nuw nsw i64 %807, 1
  %819 = call zeroext i8 @randombit()
  %820 = getelementptr inbounds i8, i8* %1, i64 %818
  store i8 %819, i8* %820, align 1
  %821 = getelementptr inbounds i8, i8* %1, i64 %818
  %822 = load i8, i8* %821, align 1
  %823 = zext i8 %822 to i32
  %824 = icmp eq i32 %823, 0
  br i1 %824, label %825, label %828

825:                                              ; preds = %817
  %826 = mul nuw nsw i64 %818, 16
  %827 = getelementptr inbounds i8, i8* %0, i64 %826
  call void @llvm.memset.p0i8.i64(i8* align 1 %827, i8 0, i64 16, i1 false)
  br label %828

828:                                              ; preds = %825, %817
  %829 = add nuw nsw i64 %818, 1
  %830 = call zeroext i8 @randombit()
  %831 = getelementptr inbounds i8, i8* %1, i64 %829
  store i8 %830, i8* %831, align 1
  %832 = getelementptr inbounds i8, i8* %1, i64 %829
  %833 = load i8, i8* %832, align 1
  %834 = zext i8 %833 to i32
  %835 = icmp eq i32 %834, 0
  br i1 %835, label %836, label %839

836:                                              ; preds = %828
  %837 = mul nuw nsw i64 %829, 16
  %838 = getelementptr inbounds i8, i8* %0, i64 %837
  call void @llvm.memset.p0i8.i64(i8* align 1 %838, i8 0, i64 16, i1 false)
  br label %839

839:                                              ; preds = %836, %828
  %840 = add nuw nsw i64 %829, 1
  %841 = call zeroext i8 @randombit()
  %842 = getelementptr inbounds i8, i8* %1, i64 %840
  store i8 %841, i8* %842, align 1
  %843 = getelementptr inbounds i8, i8* %1, i64 %840
  %844 = load i8, i8* %843, align 1
  %845 = zext i8 %844 to i32
  %846 = icmp eq i32 %845, 0
  br i1 %846, label %847, label %850

847:                                              ; preds = %839
  %848 = mul nuw nsw i64 %840, 16
  %849 = getelementptr inbounds i8, i8* %0, i64 %848
  call void @llvm.memset.p0i8.i64(i8* align 1 %849, i8 0, i64 16, i1 false)
  br label %850

850:                                              ; preds = %847, %839
  %851 = add nuw nsw i64 %840, 1
  %852 = call zeroext i8 @randombit()
  %853 = getelementptr inbounds i8, i8* %1, i64 %851
  store i8 %852, i8* %853, align 1
  %854 = getelementptr inbounds i8, i8* %1, i64 %851
  %855 = load i8, i8* %854, align 1
  %856 = zext i8 %855 to i32
  %857 = icmp eq i32 %856, 0
  br i1 %857, label %858, label %861

858:                                              ; preds = %850
  %859 = mul nuw nsw i64 %851, 16
  %860 = getelementptr inbounds i8, i8* %0, i64 %859
  call void @llvm.memset.p0i8.i64(i8* align 1 %860, i8 0, i64 16, i1 false)
  br label %861

861:                                              ; preds = %858, %850
  %862 = add nuw nsw i64 %851, 1
  %863 = call zeroext i8 @randombit()
  %864 = getelementptr inbounds i8, i8* %1, i64 %862
  store i8 %863, i8* %864, align 1
  %865 = getelementptr inbounds i8, i8* %1, i64 %862
  %866 = load i8, i8* %865, align 1
  %867 = zext i8 %866 to i32
  %868 = icmp eq i32 %867, 0
  br i1 %868, label %869, label %872

869:                                              ; preds = %861
  %870 = mul nuw nsw i64 %862, 16
  %871 = getelementptr inbounds i8, i8* %0, i64 %870
  call void @llvm.memset.p0i8.i64(i8* align 1 %871, i8 0, i64 16, i1 false)
  br label %872

872:                                              ; preds = %869, %861
  %873 = add nuw nsw i64 %862, 1
  %874 = call zeroext i8 @randombit()
  %875 = getelementptr inbounds i8, i8* %1, i64 %873
  store i8 %874, i8* %875, align 1
  %876 = getelementptr inbounds i8, i8* %1, i64 %873
  %877 = load i8, i8* %876, align 1
  %878 = zext i8 %877 to i32
  %879 = icmp eq i32 %878, 0
  br i1 %879, label %880, label %883

880:                                              ; preds = %872
  %881 = mul nuw nsw i64 %873, 16
  %882 = getelementptr inbounds i8, i8* %0, i64 %881
  call void @llvm.memset.p0i8.i64(i8* align 1 %882, i8 0, i64 16, i1 false)
  br label %883

883:                                              ; preds = %880, %872
  %884 = add nuw nsw i64 %873, 1
  %885 = call zeroext i8 @randombit()
  %886 = getelementptr inbounds i8, i8* %1, i64 %884
  store i8 %885, i8* %886, align 1
  %887 = getelementptr inbounds i8, i8* %1, i64 %884
  %888 = load i8, i8* %887, align 1
  %889 = zext i8 %888 to i32
  %890 = icmp eq i32 %889, 0
  br i1 %890, label %891, label %894

891:                                              ; preds = %883
  %892 = mul nuw nsw i64 %884, 16
  %893 = getelementptr inbounds i8, i8* %0, i64 %892
  call void @llvm.memset.p0i8.i64(i8* align 1 %893, i8 0, i64 16, i1 false)
  br label %894

894:                                              ; preds = %891, %883
  %895 = add nuw nsw i64 %884, 1
  %896 = call zeroext i8 @randombit()
  %897 = getelementptr inbounds i8, i8* %1, i64 %895
  store i8 %896, i8* %897, align 1
  %898 = getelementptr inbounds i8, i8* %1, i64 %895
  %899 = load i8, i8* %898, align 1
  %900 = zext i8 %899 to i32
  %901 = icmp eq i32 %900, 0
  br i1 %901, label %902, label %905

902:                                              ; preds = %894
  %903 = mul nuw nsw i64 %895, 16
  %904 = getelementptr inbounds i8, i8* %0, i64 %903
  call void @llvm.memset.p0i8.i64(i8* align 1 %904, i8 0, i64 16, i1 false)
  br label %905

905:                                              ; preds = %902, %894
  %906 = add nuw nsw i64 %895, 1
  %907 = call zeroext i8 @randombit()
  %908 = getelementptr inbounds i8, i8* %1, i64 %906
  store i8 %907, i8* %908, align 1
  %909 = getelementptr inbounds i8, i8* %1, i64 %906
  %910 = load i8, i8* %909, align 1
  %911 = zext i8 %910 to i32
  %912 = icmp eq i32 %911, 0
  br i1 %912, label %913, label %916

913:                                              ; preds = %905
  %914 = mul nuw nsw i64 %906, 16
  %915 = getelementptr inbounds i8, i8* %0, i64 %914
  call void @llvm.memset.p0i8.i64(i8* align 1 %915, i8 0, i64 16, i1 false)
  br label %916

916:                                              ; preds = %913, %905
  %917 = add nuw nsw i64 %906, 1
  %918 = call zeroext i8 @randombit()
  %919 = getelementptr inbounds i8, i8* %1, i64 %917
  store i8 %918, i8* %919, align 1
  %920 = getelementptr inbounds i8, i8* %1, i64 %917
  %921 = load i8, i8* %920, align 1
  %922 = zext i8 %921 to i32
  %923 = icmp eq i32 %922, 0
  br i1 %923, label %924, label %927

924:                                              ; preds = %916
  %925 = mul nuw nsw i64 %917, 16
  %926 = getelementptr inbounds i8, i8* %0, i64 %925
  call void @llvm.memset.p0i8.i64(i8* align 1 %926, i8 0, i64 16, i1 false)
  br label %927

927:                                              ; preds = %924, %916
  %928 = add nuw nsw i64 %917, 1
  %929 = call zeroext i8 @randombit()
  %930 = getelementptr inbounds i8, i8* %1, i64 %928
  store i8 %929, i8* %930, align 1
  %931 = getelementptr inbounds i8, i8* %1, i64 %928
  %932 = load i8, i8* %931, align 1
  %933 = zext i8 %932 to i32
  %934 = icmp eq i32 %933, 0
  br i1 %934, label %935, label %938

935:                                              ; preds = %927
  %936 = mul nuw nsw i64 %928, 16
  %937 = getelementptr inbounds i8, i8* %0, i64 %936
  call void @llvm.memset.p0i8.i64(i8* align 1 %937, i8 0, i64 16, i1 false)
  br label %938

938:                                              ; preds = %935, %927
  %939 = add nuw nsw i64 %928, 1
  %940 = call zeroext i8 @randombit()
  %941 = getelementptr inbounds i8, i8* %1, i64 %939
  store i8 %940, i8* %941, align 1
  %942 = getelementptr inbounds i8, i8* %1, i64 %939
  %943 = load i8, i8* %942, align 1
  %944 = zext i8 %943 to i32
  %945 = icmp eq i32 %944, 0
  br i1 %945, label %946, label %949

946:                                              ; preds = %938
  %947 = mul nuw nsw i64 %939, 16
  %948 = getelementptr inbounds i8, i8* %0, i64 %947
  call void @llvm.memset.p0i8.i64(i8* align 1 %948, i8 0, i64 16, i1 false)
  br label %949

949:                                              ; preds = %946, %938
  %950 = add nuw nsw i64 %939, 1
  %951 = call zeroext i8 @randombit()
  %952 = getelementptr inbounds i8, i8* %1, i64 %950
  store i8 %951, i8* %952, align 1
  %953 = getelementptr inbounds i8, i8* %1, i64 %950
  %954 = load i8, i8* %953, align 1
  %955 = zext i8 %954 to i32
  %956 = icmp eq i32 %955, 0
  br i1 %956, label %957, label %960

957:                                              ; preds = %949
  %958 = mul nuw nsw i64 %950, 16
  %959 = getelementptr inbounds i8, i8* %0, i64 %958
  call void @llvm.memset.p0i8.i64(i8* align 1 %959, i8 0, i64 16, i1 false)
  br label %960

960:                                              ; preds = %957, %949
  %961 = add nuw nsw i64 %950, 1
  %962 = call zeroext i8 @randombit()
  %963 = getelementptr inbounds i8, i8* %1, i64 %961
  store i8 %962, i8* %963, align 1
  %964 = getelementptr inbounds i8, i8* %1, i64 %961
  %965 = load i8, i8* %964, align 1
  %966 = zext i8 %965 to i32
  %967 = icmp eq i32 %966, 0
  br i1 %967, label %968, label %971

968:                                              ; preds = %960
  %969 = mul nuw nsw i64 %961, 16
  %970 = getelementptr inbounds i8, i8* %0, i64 %969
  call void @llvm.memset.p0i8.i64(i8* align 1 %970, i8 0, i64 16, i1 false)
  br label %971

971:                                              ; preds = %968, %960
  %972 = add nuw nsw i64 %961, 1
  %973 = call zeroext i8 @randombit()
  %974 = getelementptr inbounds i8, i8* %1, i64 %972
  store i8 %973, i8* %974, align 1
  %975 = getelementptr inbounds i8, i8* %1, i64 %972
  %976 = load i8, i8* %975, align 1
  %977 = zext i8 %976 to i32
  %978 = icmp eq i32 %977, 0
  br i1 %978, label %979, label %982

979:                                              ; preds = %971
  %980 = mul nuw nsw i64 %972, 16
  %981 = getelementptr inbounds i8, i8* %0, i64 %980
  call void @llvm.memset.p0i8.i64(i8* align 1 %981, i8 0, i64 16, i1 false)
  br label %982

982:                                              ; preds = %979, %971
  %983 = add nuw nsw i64 %972, 1
  %984 = call zeroext i8 @randombit()
  %985 = getelementptr inbounds i8, i8* %1, i64 %983
  store i8 %984, i8* %985, align 1
  %986 = getelementptr inbounds i8, i8* %1, i64 %983
  %987 = load i8, i8* %986, align 1
  %988 = zext i8 %987 to i32
  %989 = icmp eq i32 %988, 0
  br i1 %989, label %990, label %993

990:                                              ; preds = %982
  %991 = mul nuw nsw i64 %983, 16
  %992 = getelementptr inbounds i8, i8* %0, i64 %991
  call void @llvm.memset.p0i8.i64(i8* align 1 %992, i8 0, i64 16, i1 false)
  br label %993

993:                                              ; preds = %990, %982
  %994 = add nuw nsw i64 %983, 1
  %995 = call zeroext i8 @randombit()
  %996 = getelementptr inbounds i8, i8* %1, i64 %994
  store i8 %995, i8* %996, align 1
  %997 = getelementptr inbounds i8, i8* %1, i64 %994
  %998 = load i8, i8* %997, align 1
  %999 = zext i8 %998 to i32
  %1000 = icmp eq i32 %999, 0
  br i1 %1000, label %1001, label %1004

1001:                                             ; preds = %993
  %1002 = mul nuw nsw i64 %994, 16
  %1003 = getelementptr inbounds i8, i8* %0, i64 %1002
  call void @llvm.memset.p0i8.i64(i8* align 1 %1003, i8 0, i64 16, i1 false)
  br label %1004

1004:                                             ; preds = %1001, %993
  %1005 = add nuw nsw i64 %994, 1
  %1006 = call zeroext i8 @randombit()
  %1007 = getelementptr inbounds i8, i8* %1, i64 %1005
  store i8 %1006, i8* %1007, align 1
  %1008 = getelementptr inbounds i8, i8* %1, i64 %1005
  %1009 = load i8, i8* %1008, align 1
  %1010 = zext i8 %1009 to i32
  %1011 = icmp eq i32 %1010, 0
  br i1 %1011, label %1012, label %1015

1012:                                             ; preds = %1004
  %1013 = mul nuw nsw i64 %1005, 16
  %1014 = getelementptr inbounds i8, i8* %0, i64 %1013
  call void @llvm.memset.p0i8.i64(i8* align 1 %1014, i8 0, i64 16, i1 false)
  br label %1015

1015:                                             ; preds = %1012, %1004
  %1016 = add nuw nsw i64 %1005, 1
  %1017 = call zeroext i8 @randombit()
  %1018 = getelementptr inbounds i8, i8* %1, i64 %1016
  store i8 %1017, i8* %1018, align 1
  %1019 = getelementptr inbounds i8, i8* %1, i64 %1016
  %1020 = load i8, i8* %1019, align 1
  %1021 = zext i8 %1020 to i32
  %1022 = icmp eq i32 %1021, 0
  br i1 %1022, label %1023, label %1026

1023:                                             ; preds = %1015
  %1024 = mul nuw nsw i64 %1016, 16
  %1025 = getelementptr inbounds i8, i8* %0, i64 %1024
  call void @llvm.memset.p0i8.i64(i8* align 1 %1025, i8 0, i64 16, i1 false)
  br label %1026

1026:                                             ; preds = %1023, %1015
  %1027 = add nuw nsw i64 %1016, 1
  %1028 = call zeroext i8 @randombit()
  %1029 = getelementptr inbounds i8, i8* %1, i64 %1027
  store i8 %1028, i8* %1029, align 1
  %1030 = getelementptr inbounds i8, i8* %1, i64 %1027
  %1031 = load i8, i8* %1030, align 1
  %1032 = zext i8 %1031 to i32
  %1033 = icmp eq i32 %1032, 0
  br i1 %1033, label %1034, label %1037

1034:                                             ; preds = %1026
  %1035 = mul nuw nsw i64 %1027, 16
  %1036 = getelementptr inbounds i8, i8* %0, i64 %1035
  call void @llvm.memset.p0i8.i64(i8* align 1 %1036, i8 0, i64 16, i1 false)
  br label %1037

1037:                                             ; preds = %1034, %1026
  %1038 = add nuw nsw i64 %1027, 1
  %1039 = call zeroext i8 @randombit()
  %1040 = getelementptr inbounds i8, i8* %1, i64 %1038
  store i8 %1039, i8* %1040, align 1
  %1041 = getelementptr inbounds i8, i8* %1, i64 %1038
  %1042 = load i8, i8* %1041, align 1
  %1043 = zext i8 %1042 to i32
  %1044 = icmp eq i32 %1043, 0
  br i1 %1044, label %1045, label %1048

1045:                                             ; preds = %1037
  %1046 = mul nuw nsw i64 %1038, 16
  %1047 = getelementptr inbounds i8, i8* %0, i64 %1046
  call void @llvm.memset.p0i8.i64(i8* align 1 %1047, i8 0, i64 16, i1 false)
  br label %1048

1048:                                             ; preds = %1045, %1037
  %1049 = add nuw nsw i64 %1038, 1
  %1050 = call zeroext i8 @randombit()
  %1051 = getelementptr inbounds i8, i8* %1, i64 %1049
  store i8 %1050, i8* %1051, align 1
  %1052 = getelementptr inbounds i8, i8* %1, i64 %1049
  %1053 = load i8, i8* %1052, align 1
  %1054 = zext i8 %1053 to i32
  %1055 = icmp eq i32 %1054, 0
  br i1 %1055, label %1056, label %1059

1056:                                             ; preds = %1048
  %1057 = mul nuw nsw i64 %1049, 16
  %1058 = getelementptr inbounds i8, i8* %0, i64 %1057
  call void @llvm.memset.p0i8.i64(i8* align 1 %1058, i8 0, i64 16, i1 false)
  br label %1059

1059:                                             ; preds = %1056, %1048
  %1060 = add nuw nsw i64 %1049, 1
  %1061 = call zeroext i8 @randombit()
  %1062 = getelementptr inbounds i8, i8* %1, i64 %1060
  store i8 %1061, i8* %1062, align 1
  %1063 = getelementptr inbounds i8, i8* %1, i64 %1060
  %1064 = load i8, i8* %1063, align 1
  %1065 = zext i8 %1064 to i32
  %1066 = icmp eq i32 %1065, 0
  br i1 %1066, label %1067, label %1070

1067:                                             ; preds = %1059
  %1068 = mul nuw nsw i64 %1060, 16
  %1069 = getelementptr inbounds i8, i8* %0, i64 %1068
  call void @llvm.memset.p0i8.i64(i8* align 1 %1069, i8 0, i64 16, i1 false)
  br label %1070

1070:                                             ; preds = %1067, %1059
  %1071 = add nuw nsw i64 %1060, 1
  %1072 = call zeroext i8 @randombit()
  %1073 = getelementptr inbounds i8, i8* %1, i64 %1071
  store i8 %1072, i8* %1073, align 1
  %1074 = getelementptr inbounds i8, i8* %1, i64 %1071
  %1075 = load i8, i8* %1074, align 1
  %1076 = zext i8 %1075 to i32
  %1077 = icmp eq i32 %1076, 0
  br i1 %1077, label %1078, label %1081

1078:                                             ; preds = %1070
  %1079 = mul nuw nsw i64 %1071, 16
  %1080 = getelementptr inbounds i8, i8* %0, i64 %1079
  call void @llvm.memset.p0i8.i64(i8* align 1 %1080, i8 0, i64 16, i1 false)
  br label %1081

1081:                                             ; preds = %1078, %1070
  %1082 = add nuw nsw i64 %1071, 1
  %1083 = call zeroext i8 @randombit()
  %1084 = getelementptr inbounds i8, i8* %1, i64 %1082
  store i8 %1083, i8* %1084, align 1
  %1085 = getelementptr inbounds i8, i8* %1, i64 %1082
  %1086 = load i8, i8* %1085, align 1
  %1087 = zext i8 %1086 to i32
  %1088 = icmp eq i32 %1087, 0
  br i1 %1088, label %1089, label %1092

1089:                                             ; preds = %1081
  %1090 = mul nuw nsw i64 %1082, 16
  %1091 = getelementptr inbounds i8, i8* %0, i64 %1090
  call void @llvm.memset.p0i8.i64(i8* align 1 %1091, i8 0, i64 16, i1 false)
  br label %1092

1092:                                             ; preds = %1089, %1081
  %1093 = add nuw nsw i64 %1082, 1
  %1094 = call zeroext i8 @randombit()
  %1095 = getelementptr inbounds i8, i8* %1, i64 %1093
  store i8 %1094, i8* %1095, align 1
  %1096 = getelementptr inbounds i8, i8* %1, i64 %1093
  %1097 = load i8, i8* %1096, align 1
  %1098 = zext i8 %1097 to i32
  %1099 = icmp eq i32 %1098, 0
  br i1 %1099, label %1100, label %1103

1100:                                             ; preds = %1092
  %1101 = mul nuw nsw i64 %1093, 16
  %1102 = getelementptr inbounds i8, i8* %0, i64 %1101
  call void @llvm.memset.p0i8.i64(i8* align 1 %1102, i8 0, i64 16, i1 false)
  br label %1103

1103:                                             ; preds = %1100, %1092
  %1104 = add nuw nsw i64 %1093, 1
  %1105 = call zeroext i8 @randombit()
  %1106 = getelementptr inbounds i8, i8* %1, i64 %1104
  store i8 %1105, i8* %1106, align 1
  %1107 = getelementptr inbounds i8, i8* %1, i64 %1104
  %1108 = load i8, i8* %1107, align 1
  %1109 = zext i8 %1108 to i32
  %1110 = icmp eq i32 %1109, 0
  br i1 %1110, label %1111, label %1114

1111:                                             ; preds = %1103
  %1112 = mul nuw nsw i64 %1104, 16
  %1113 = getelementptr inbounds i8, i8* %0, i64 %1112
  call void @llvm.memset.p0i8.i64(i8* align 1 %1113, i8 0, i64 16, i1 false)
  br label %1114

1114:                                             ; preds = %1111, %1103
  %1115 = add nuw nsw i64 %1104, 1
  %1116 = call zeroext i8 @randombit()
  %1117 = getelementptr inbounds i8, i8* %1, i64 %1115
  store i8 %1116, i8* %1117, align 1
  %1118 = getelementptr inbounds i8, i8* %1, i64 %1115
  %1119 = load i8, i8* %1118, align 1
  %1120 = zext i8 %1119 to i32
  %1121 = icmp eq i32 %1120, 0
  br i1 %1121, label %1122, label %1125

1122:                                             ; preds = %1114
  %1123 = mul nuw nsw i64 %1115, 16
  %1124 = getelementptr inbounds i8, i8* %0, i64 %1123
  call void @llvm.memset.p0i8.i64(i8* align 1 %1124, i8 0, i64 16, i1 false)
  br label %1125

1125:                                             ; preds = %1122, %1114
  %1126 = add nuw nsw i64 %1115, 1
  %1127 = call zeroext i8 @randombit()
  %1128 = getelementptr inbounds i8, i8* %1, i64 %1126
  store i8 %1127, i8* %1128, align 1
  %1129 = getelementptr inbounds i8, i8* %1, i64 %1126
  %1130 = load i8, i8* %1129, align 1
  %1131 = zext i8 %1130 to i32
  %1132 = icmp eq i32 %1131, 0
  br i1 %1132, label %1133, label %1136

1133:                                             ; preds = %1125
  %1134 = mul nuw nsw i64 %1126, 16
  %1135 = getelementptr inbounds i8, i8* %0, i64 %1134
  call void @llvm.memset.p0i8.i64(i8* align 1 %1135, i8 0, i64 16, i1 false)
  br label %1136

1136:                                             ; preds = %1133, %1125
  %1137 = add nuw nsw i64 %1126, 1
  %1138 = call zeroext i8 @randombit()
  %1139 = getelementptr inbounds i8, i8* %1, i64 %1137
  store i8 %1138, i8* %1139, align 1
  %1140 = getelementptr inbounds i8, i8* %1, i64 %1137
  %1141 = load i8, i8* %1140, align 1
  %1142 = zext i8 %1141 to i32
  %1143 = icmp eq i32 %1142, 0
  br i1 %1143, label %1144, label %1147

1144:                                             ; preds = %1136
  %1145 = mul nuw nsw i64 %1137, 16
  %1146 = getelementptr inbounds i8, i8* %0, i64 %1145
  call void @llvm.memset.p0i8.i64(i8* align 1 %1146, i8 0, i64 16, i1 false)
  br label %1147

1147:                                             ; preds = %1144, %1136
  %1148 = add nuw nsw i64 %1137, 1
  %1149 = call zeroext i8 @randombit()
  %1150 = getelementptr inbounds i8, i8* %1, i64 %1148
  store i8 %1149, i8* %1150, align 1
  %1151 = getelementptr inbounds i8, i8* %1, i64 %1148
  %1152 = load i8, i8* %1151, align 1
  %1153 = zext i8 %1152 to i32
  %1154 = icmp eq i32 %1153, 0
  br i1 %1154, label %1155, label %1158

1155:                                             ; preds = %1147
  %1156 = mul nuw nsw i64 %1148, 16
  %1157 = getelementptr inbounds i8, i8* %0, i64 %1156
  call void @llvm.memset.p0i8.i64(i8* align 1 %1157, i8 0, i64 16, i1 false)
  br label %1158

1158:                                             ; preds = %1155, %1147
  %1159 = add nuw nsw i64 %1148, 1
  %1160 = call zeroext i8 @randombit()
  %1161 = getelementptr inbounds i8, i8* %1, i64 %1159
  store i8 %1160, i8* %1161, align 1
  %1162 = getelementptr inbounds i8, i8* %1, i64 %1159
  %1163 = load i8, i8* %1162, align 1
  %1164 = zext i8 %1163 to i32
  %1165 = icmp eq i32 %1164, 0
  br i1 %1165, label %1166, label %1169

1166:                                             ; preds = %1158
  %1167 = mul nuw nsw i64 %1159, 16
  %1168 = getelementptr inbounds i8, i8* %0, i64 %1167
  call void @llvm.memset.p0i8.i64(i8* align 1 %1168, i8 0, i64 16, i1 false)
  br label %1169

1169:                                             ; preds = %1166, %1158
  %1170 = add nuw nsw i64 %1159, 1
  %1171 = call zeroext i8 @randombit()
  %1172 = getelementptr inbounds i8, i8* %1, i64 %1170
  store i8 %1171, i8* %1172, align 1
  %1173 = getelementptr inbounds i8, i8* %1, i64 %1170
  %1174 = load i8, i8* %1173, align 1
  %1175 = zext i8 %1174 to i32
  %1176 = icmp eq i32 %1175, 0
  br i1 %1176, label %1177, label %1180

1177:                                             ; preds = %1169
  %1178 = mul nuw nsw i64 %1170, 16
  %1179 = getelementptr inbounds i8, i8* %0, i64 %1178
  call void @llvm.memset.p0i8.i64(i8* align 1 %1179, i8 0, i64 16, i1 false)
  br label %1180

1180:                                             ; preds = %1177, %1169
  %1181 = add nuw nsw i64 %1170, 1
  %1182 = call zeroext i8 @randombit()
  %1183 = getelementptr inbounds i8, i8* %1, i64 %1181
  store i8 %1182, i8* %1183, align 1
  %1184 = getelementptr inbounds i8, i8* %1, i64 %1181
  %1185 = load i8, i8* %1184, align 1
  %1186 = zext i8 %1185 to i32
  %1187 = icmp eq i32 %1186, 0
  br i1 %1187, label %1188, label %1191

1188:                                             ; preds = %1180
  %1189 = mul nuw nsw i64 %1181, 16
  %1190 = getelementptr inbounds i8, i8* %0, i64 %1189
  call void @llvm.memset.p0i8.i64(i8* align 1 %1190, i8 0, i64 16, i1 false)
  br label %1191

1191:                                             ; preds = %1188, %1180
  %1192 = add nuw nsw i64 %1181, 1
  %1193 = call zeroext i8 @randombit()
  %1194 = getelementptr inbounds i8, i8* %1, i64 %1192
  store i8 %1193, i8* %1194, align 1
  %1195 = getelementptr inbounds i8, i8* %1, i64 %1192
  %1196 = load i8, i8* %1195, align 1
  %1197 = zext i8 %1196 to i32
  %1198 = icmp eq i32 %1197, 0
  br i1 %1198, label %1199, label %1202

1199:                                             ; preds = %1191
  %1200 = mul nuw nsw i64 %1192, 16
  %1201 = getelementptr inbounds i8, i8* %0, i64 %1200
  call void @llvm.memset.p0i8.i64(i8* align 1 %1201, i8 0, i64 16, i1 false)
  br label %1202

1202:                                             ; preds = %1199, %1191
  %1203 = add nuw nsw i64 %1192, 1
  %1204 = call zeroext i8 @randombit()
  %1205 = getelementptr inbounds i8, i8* %1, i64 %1203
  store i8 %1204, i8* %1205, align 1
  %1206 = getelementptr inbounds i8, i8* %1, i64 %1203
  %1207 = load i8, i8* %1206, align 1
  %1208 = zext i8 %1207 to i32
  %1209 = icmp eq i32 %1208, 0
  br i1 %1209, label %1210, label %1213

1210:                                             ; preds = %1202
  %1211 = mul nuw nsw i64 %1203, 16
  %1212 = getelementptr inbounds i8, i8* %0, i64 %1211
  call void @llvm.memset.p0i8.i64(i8* align 1 %1212, i8 0, i64 16, i1 false)
  br label %1213

1213:                                             ; preds = %1210, %1202
  %1214 = add nuw nsw i64 %1203, 1
  %1215 = call zeroext i8 @randombit()
  %1216 = getelementptr inbounds i8, i8* %1, i64 %1214
  store i8 %1215, i8* %1216, align 1
  %1217 = getelementptr inbounds i8, i8* %1, i64 %1214
  %1218 = load i8, i8* %1217, align 1
  %1219 = zext i8 %1218 to i32
  %1220 = icmp eq i32 %1219, 0
  br i1 %1220, label %1221, label %1224

1221:                                             ; preds = %1213
  %1222 = mul nuw nsw i64 %1214, 16
  %1223 = getelementptr inbounds i8, i8* %0, i64 %1222
  call void @llvm.memset.p0i8.i64(i8* align 1 %1223, i8 0, i64 16, i1 false)
  br label %1224

1224:                                             ; preds = %1221, %1213
  %1225 = add nuw nsw i64 %1214, 1
  %1226 = call zeroext i8 @randombit()
  %1227 = getelementptr inbounds i8, i8* %1, i64 %1225
  store i8 %1226, i8* %1227, align 1
  %1228 = getelementptr inbounds i8, i8* %1, i64 %1225
  %1229 = load i8, i8* %1228, align 1
  %1230 = zext i8 %1229 to i32
  %1231 = icmp eq i32 %1230, 0
  br i1 %1231, label %1232, label %1235

1232:                                             ; preds = %1224
  %1233 = mul nuw nsw i64 %1225, 16
  %1234 = getelementptr inbounds i8, i8* %0, i64 %1233
  call void @llvm.memset.p0i8.i64(i8* align 1 %1234, i8 0, i64 16, i1 false)
  br label %1235

1235:                                             ; preds = %1232, %1224
  %1236 = add nuw nsw i64 %1225, 1
  %1237 = call zeroext i8 @randombit()
  %1238 = getelementptr inbounds i8, i8* %1, i64 %1236
  store i8 %1237, i8* %1238, align 1
  %1239 = getelementptr inbounds i8, i8* %1, i64 %1236
  %1240 = load i8, i8* %1239, align 1
  %1241 = zext i8 %1240 to i32
  %1242 = icmp eq i32 %1241, 0
  br i1 %1242, label %1243, label %1246

1243:                                             ; preds = %1235
  %1244 = mul nuw nsw i64 %1236, 16
  %1245 = getelementptr inbounds i8, i8* %0, i64 %1244
  call void @llvm.memset.p0i8.i64(i8* align 1 %1245, i8 0, i64 16, i1 false)
  br label %1246

1246:                                             ; preds = %1243, %1235
  %1247 = add nuw nsw i64 %1236, 1
  %1248 = call zeroext i8 @randombit()
  %1249 = getelementptr inbounds i8, i8* %1, i64 %1247
  store i8 %1248, i8* %1249, align 1
  %1250 = getelementptr inbounds i8, i8* %1, i64 %1247
  %1251 = load i8, i8* %1250, align 1
  %1252 = zext i8 %1251 to i32
  %1253 = icmp eq i32 %1252, 0
  br i1 %1253, label %1254, label %1257

1254:                                             ; preds = %1246
  %1255 = mul nuw nsw i64 %1247, 16
  %1256 = getelementptr inbounds i8, i8* %0, i64 %1255
  call void @llvm.memset.p0i8.i64(i8* align 1 %1256, i8 0, i64 16, i1 false)
  br label %1257

1257:                                             ; preds = %1254, %1246
  %1258 = add nuw nsw i64 %1247, 1
  %1259 = call zeroext i8 @randombit()
  %1260 = getelementptr inbounds i8, i8* %1, i64 %1258
  store i8 %1259, i8* %1260, align 1
  %1261 = getelementptr inbounds i8, i8* %1, i64 %1258
  %1262 = load i8, i8* %1261, align 1
  %1263 = zext i8 %1262 to i32
  %1264 = icmp eq i32 %1263, 0
  br i1 %1264, label %1265, label %1268

1265:                                             ; preds = %1257
  %1266 = mul nuw nsw i64 %1258, 16
  %1267 = getelementptr inbounds i8, i8* %0, i64 %1266
  call void @llvm.memset.p0i8.i64(i8* align 1 %1267, i8 0, i64 16, i1 false)
  br label %1268

1268:                                             ; preds = %1265, %1257
  %1269 = add nuw nsw i64 %1258, 1
  %1270 = call zeroext i8 @randombit()
  %1271 = getelementptr inbounds i8, i8* %1, i64 %1269
  store i8 %1270, i8* %1271, align 1
  %1272 = getelementptr inbounds i8, i8* %1, i64 %1269
  %1273 = load i8, i8* %1272, align 1
  %1274 = zext i8 %1273 to i32
  %1275 = icmp eq i32 %1274, 0
  br i1 %1275, label %1276, label %1279

1276:                                             ; preds = %1268
  %1277 = mul nuw nsw i64 %1269, 16
  %1278 = getelementptr inbounds i8, i8* %0, i64 %1277
  call void @llvm.memset.p0i8.i64(i8* align 1 %1278, i8 0, i64 16, i1 false)
  br label %1279

1279:                                             ; preds = %1276, %1268
  %1280 = add nuw nsw i64 %1269, 1
  %1281 = call zeroext i8 @randombit()
  %1282 = getelementptr inbounds i8, i8* %1, i64 %1280
  store i8 %1281, i8* %1282, align 1
  %1283 = getelementptr inbounds i8, i8* %1, i64 %1280
  %1284 = load i8, i8* %1283, align 1
  %1285 = zext i8 %1284 to i32
  %1286 = icmp eq i32 %1285, 0
  br i1 %1286, label %1287, label %1290

1287:                                             ; preds = %1279
  %1288 = mul nuw nsw i64 %1280, 16
  %1289 = getelementptr inbounds i8, i8* %0, i64 %1288
  call void @llvm.memset.p0i8.i64(i8* align 1 %1289, i8 0, i64 16, i1 false)
  br label %1290

1290:                                             ; preds = %1287, %1279
  %1291 = add nuw nsw i64 %1280, 1
  %1292 = call zeroext i8 @randombit()
  %1293 = getelementptr inbounds i8, i8* %1, i64 %1291
  store i8 %1292, i8* %1293, align 1
  %1294 = getelementptr inbounds i8, i8* %1, i64 %1291
  %1295 = load i8, i8* %1294, align 1
  %1296 = zext i8 %1295 to i32
  %1297 = icmp eq i32 %1296, 0
  br i1 %1297, label %1298, label %1301

1298:                                             ; preds = %1290
  %1299 = mul nuw nsw i64 %1291, 16
  %1300 = getelementptr inbounds i8, i8* %0, i64 %1299
  call void @llvm.memset.p0i8.i64(i8* align 1 %1300, i8 0, i64 16, i1 false)
  br label %1301

1301:                                             ; preds = %1298, %1290
  %1302 = add nuw nsw i64 %1291, 1
  %1303 = call zeroext i8 @randombit()
  %1304 = getelementptr inbounds i8, i8* %1, i64 %1302
  store i8 %1303, i8* %1304, align 1
  %1305 = getelementptr inbounds i8, i8* %1, i64 %1302
  %1306 = load i8, i8* %1305, align 1
  %1307 = zext i8 %1306 to i32
  %1308 = icmp eq i32 %1307, 0
  br i1 %1308, label %1309, label %1312

1309:                                             ; preds = %1301
  %1310 = mul nuw nsw i64 %1302, 16
  %1311 = getelementptr inbounds i8, i8* %0, i64 %1310
  call void @llvm.memset.p0i8.i64(i8* align 1 %1311, i8 0, i64 16, i1 false)
  br label %1312

1312:                                             ; preds = %1309, %1301
  %1313 = add nuw nsw i64 %1302, 1
  %1314 = call zeroext i8 @randombit()
  %1315 = getelementptr inbounds i8, i8* %1, i64 %1313
  store i8 %1314, i8* %1315, align 1
  %1316 = getelementptr inbounds i8, i8* %1, i64 %1313
  %1317 = load i8, i8* %1316, align 1
  %1318 = zext i8 %1317 to i32
  %1319 = icmp eq i32 %1318, 0
  br i1 %1319, label %1320, label %1323

1320:                                             ; preds = %1312
  %1321 = mul nuw nsw i64 %1313, 16
  %1322 = getelementptr inbounds i8, i8* %0, i64 %1321
  call void @llvm.memset.p0i8.i64(i8* align 1 %1322, i8 0, i64 16, i1 false)
  br label %1323

1323:                                             ; preds = %1320, %1312
  %1324 = add nuw nsw i64 %1313, 1
  %1325 = call zeroext i8 @randombit()
  %1326 = getelementptr inbounds i8, i8* %1, i64 %1324
  store i8 %1325, i8* %1326, align 1
  %1327 = getelementptr inbounds i8, i8* %1, i64 %1324
  %1328 = load i8, i8* %1327, align 1
  %1329 = zext i8 %1328 to i32
  %1330 = icmp eq i32 %1329, 0
  br i1 %1330, label %1331, label %1334

1331:                                             ; preds = %1323
  %1332 = mul nuw nsw i64 %1324, 16
  %1333 = getelementptr inbounds i8, i8* %0, i64 %1332
  call void @llvm.memset.p0i8.i64(i8* align 1 %1333, i8 0, i64 16, i1 false)
  br label %1334

1334:                                             ; preds = %1331, %1323
  %1335 = add nuw nsw i64 %1324, 1
  %1336 = call zeroext i8 @randombit()
  %1337 = getelementptr inbounds i8, i8* %1, i64 %1335
  store i8 %1336, i8* %1337, align 1
  %1338 = getelementptr inbounds i8, i8* %1, i64 %1335
  %1339 = load i8, i8* %1338, align 1
  %1340 = zext i8 %1339 to i32
  %1341 = icmp eq i32 %1340, 0
  br i1 %1341, label %1342, label %1345

1342:                                             ; preds = %1334
  %1343 = mul nuw nsw i64 %1335, 16
  %1344 = getelementptr inbounds i8, i8* %0, i64 %1343
  call void @llvm.memset.p0i8.i64(i8* align 1 %1344, i8 0, i64 16, i1 false)
  br label %1345

1345:                                             ; preds = %1342, %1334
  %1346 = add nuw nsw i64 %1335, 1
  %1347 = call zeroext i8 @randombit()
  %1348 = getelementptr inbounds i8, i8* %1, i64 %1346
  store i8 %1347, i8* %1348, align 1
  %1349 = getelementptr inbounds i8, i8* %1, i64 %1346
  %1350 = load i8, i8* %1349, align 1
  %1351 = zext i8 %1350 to i32
  %1352 = icmp eq i32 %1351, 0
  br i1 %1352, label %1353, label %1356

1353:                                             ; preds = %1345
  %1354 = mul nuw nsw i64 %1346, 16
  %1355 = getelementptr inbounds i8, i8* %0, i64 %1354
  call void @llvm.memset.p0i8.i64(i8* align 1 %1355, i8 0, i64 16, i1 false)
  br label %1356

1356:                                             ; preds = %1353, %1345
  %1357 = add nuw nsw i64 %1346, 1
  %1358 = call zeroext i8 @randombit()
  %1359 = getelementptr inbounds i8, i8* %1, i64 %1357
  store i8 %1358, i8* %1359, align 1
  %1360 = getelementptr inbounds i8, i8* %1, i64 %1357
  %1361 = load i8, i8* %1360, align 1
  %1362 = zext i8 %1361 to i32
  %1363 = icmp eq i32 %1362, 0
  br i1 %1363, label %1364, label %1367

1364:                                             ; preds = %1356
  %1365 = mul nuw nsw i64 %1357, 16
  %1366 = getelementptr inbounds i8, i8* %0, i64 %1365
  call void @llvm.memset.p0i8.i64(i8* align 1 %1366, i8 0, i64 16, i1 false)
  br label %1367

1367:                                             ; preds = %1364, %1356
  %1368 = add nuw nsw i64 %1357, 1
  %1369 = call zeroext i8 @randombit()
  %1370 = getelementptr inbounds i8, i8* %1, i64 %1368
  store i8 %1369, i8* %1370, align 1
  %1371 = getelementptr inbounds i8, i8* %1, i64 %1368
  %1372 = load i8, i8* %1371, align 1
  %1373 = zext i8 %1372 to i32
  %1374 = icmp eq i32 %1373, 0
  br i1 %1374, label %1375, label %1378

1375:                                             ; preds = %1367
  %1376 = mul nuw nsw i64 %1368, 16
  %1377 = getelementptr inbounds i8, i8* %0, i64 %1376
  call void @llvm.memset.p0i8.i64(i8* align 1 %1377, i8 0, i64 16, i1 false)
  br label %1378

1378:                                             ; preds = %1375, %1367
  %1379 = add nuw nsw i64 %1368, 1
  %1380 = call zeroext i8 @randombit()
  %1381 = getelementptr inbounds i8, i8* %1, i64 %1379
  store i8 %1380, i8* %1381, align 1
  %1382 = getelementptr inbounds i8, i8* %1, i64 %1379
  %1383 = load i8, i8* %1382, align 1
  %1384 = zext i8 %1383 to i32
  %1385 = icmp eq i32 %1384, 0
  br i1 %1385, label %1386, label %1389

1386:                                             ; preds = %1378
  %1387 = mul nuw nsw i64 %1379, 16
  %1388 = getelementptr inbounds i8, i8* %0, i64 %1387
  call void @llvm.memset.p0i8.i64(i8* align 1 %1388, i8 0, i64 16, i1 false)
  br label %1389

1389:                                             ; preds = %1386, %1378
  %1390 = add nuw nsw i64 %1379, 1
  %1391 = call zeroext i8 @randombit()
  %1392 = getelementptr inbounds i8, i8* %1, i64 %1390
  store i8 %1391, i8* %1392, align 1
  %1393 = getelementptr inbounds i8, i8* %1, i64 %1390
  %1394 = load i8, i8* %1393, align 1
  %1395 = zext i8 %1394 to i32
  %1396 = icmp eq i32 %1395, 0
  br i1 %1396, label %1397, label %1400

1397:                                             ; preds = %1389
  %1398 = mul nuw nsw i64 %1390, 16
  %1399 = getelementptr inbounds i8, i8* %0, i64 %1398
  call void @llvm.memset.p0i8.i64(i8* align 1 %1399, i8 0, i64 16, i1 false)
  br label %1400

1400:                                             ; preds = %1397, %1389
  %1401 = add nuw nsw i64 %1390, 1
  %1402 = call zeroext i8 @randombit()
  %1403 = getelementptr inbounds i8, i8* %1, i64 %1401
  store i8 %1402, i8* %1403, align 1
  %1404 = getelementptr inbounds i8, i8* %1, i64 %1401
  %1405 = load i8, i8* %1404, align 1
  %1406 = zext i8 %1405 to i32
  %1407 = icmp eq i32 %1406, 0
  br i1 %1407, label %1408, label %1411

1408:                                             ; preds = %1400
  %1409 = mul nuw nsw i64 %1401, 16
  %1410 = getelementptr inbounds i8, i8* %0, i64 %1409
  call void @llvm.memset.p0i8.i64(i8* align 1 %1410, i8 0, i64 16, i1 false)
  br label %1411

1411:                                             ; preds = %1408, %1400
  %1412 = add nuw nsw i64 %1401, 1
  %1413 = call zeroext i8 @randombit()
  %1414 = getelementptr inbounds i8, i8* %1, i64 %1412
  store i8 %1413, i8* %1414, align 1
  %1415 = getelementptr inbounds i8, i8* %1, i64 %1412
  %1416 = load i8, i8* %1415, align 1
  %1417 = zext i8 %1416 to i32
  %1418 = icmp eq i32 %1417, 0
  br i1 %1418, label %1419, label %1422

1419:                                             ; preds = %1411
  %1420 = mul nuw nsw i64 %1412, 16
  %1421 = getelementptr inbounds i8, i8* %0, i64 %1420
  call void @llvm.memset.p0i8.i64(i8* align 1 %1421, i8 0, i64 16, i1 false)
  br label %1422

1422:                                             ; preds = %1419, %1411
  %1423 = add nuw nsw i64 %1412, 1
  %1424 = call zeroext i8 @randombit()
  %1425 = getelementptr inbounds i8, i8* %1, i64 %1423
  store i8 %1424, i8* %1425, align 1
  %1426 = getelementptr inbounds i8, i8* %1, i64 %1423
  %1427 = load i8, i8* %1426, align 1
  %1428 = zext i8 %1427 to i32
  %1429 = icmp eq i32 %1428, 0
  br i1 %1429, label %1430, label %1433

1430:                                             ; preds = %1422
  %1431 = mul nuw nsw i64 %1423, 16
  %1432 = getelementptr inbounds i8, i8* %0, i64 %1431
  call void @llvm.memset.p0i8.i64(i8* align 1 %1432, i8 0, i64 16, i1 false)
  br label %1433

1433:                                             ; preds = %1430, %1422
  %1434 = add nuw nsw i64 %1423, 1
  %1435 = call zeroext i8 @randombit()
  %1436 = getelementptr inbounds i8, i8* %1, i64 %1434
  store i8 %1435, i8* %1436, align 1
  %1437 = getelementptr inbounds i8, i8* %1, i64 %1434
  %1438 = load i8, i8* %1437, align 1
  %1439 = zext i8 %1438 to i32
  %1440 = icmp eq i32 %1439, 0
  br i1 %1440, label %1441, label %1444

1441:                                             ; preds = %1433
  %1442 = mul nuw nsw i64 %1434, 16
  %1443 = getelementptr inbounds i8, i8* %0, i64 %1442
  call void @llvm.memset.p0i8.i64(i8* align 1 %1443, i8 0, i64 16, i1 false)
  br label %1444

1444:                                             ; preds = %1441, %1433
  %1445 = add nuw nsw i64 %1434, 1
  %1446 = call zeroext i8 @randombit()
  %1447 = getelementptr inbounds i8, i8* %1, i64 %1445
  store i8 %1446, i8* %1447, align 1
  %1448 = getelementptr inbounds i8, i8* %1, i64 %1445
  %1449 = load i8, i8* %1448, align 1
  %1450 = zext i8 %1449 to i32
  %1451 = icmp eq i32 %1450, 0
  br i1 %1451, label %1452, label %1455

1452:                                             ; preds = %1444
  %1453 = mul nuw nsw i64 %1445, 16
  %1454 = getelementptr inbounds i8, i8* %0, i64 %1453
  call void @llvm.memset.p0i8.i64(i8* align 1 %1454, i8 0, i64 16, i1 false)
  br label %1455

1455:                                             ; preds = %1452, %1444
  %1456 = add nuw nsw i64 %1445, 1
  %1457 = call zeroext i8 @randombit()
  %1458 = getelementptr inbounds i8, i8* %1, i64 %1456
  store i8 %1457, i8* %1458, align 1
  %1459 = getelementptr inbounds i8, i8* %1, i64 %1456
  %1460 = load i8, i8* %1459, align 1
  %1461 = zext i8 %1460 to i32
  %1462 = icmp eq i32 %1461, 0
  br i1 %1462, label %1463, label %1466

1463:                                             ; preds = %1455
  %1464 = mul nuw nsw i64 %1456, 16
  %1465 = getelementptr inbounds i8, i8* %0, i64 %1464
  call void @llvm.memset.p0i8.i64(i8* align 1 %1465, i8 0, i64 16, i1 false)
  br label %1466

1466:                                             ; preds = %1463, %1455
  %1467 = add nuw nsw i64 %1456, 1
  %1468 = call zeroext i8 @randombit()
  %1469 = getelementptr inbounds i8, i8* %1, i64 %1467
  store i8 %1468, i8* %1469, align 1
  %1470 = getelementptr inbounds i8, i8* %1, i64 %1467
  %1471 = load i8, i8* %1470, align 1
  %1472 = zext i8 %1471 to i32
  %1473 = icmp eq i32 %1472, 0
  br i1 %1473, label %1474, label %1477

1474:                                             ; preds = %1466
  %1475 = mul nuw nsw i64 %1467, 16
  %1476 = getelementptr inbounds i8, i8* %0, i64 %1475
  call void @llvm.memset.p0i8.i64(i8* align 1 %1476, i8 0, i64 16, i1 false)
  br label %1477

1477:                                             ; preds = %1474, %1466
  %1478 = add nuw nsw i64 %1467, 1
  %1479 = call zeroext i8 @randombit()
  %1480 = getelementptr inbounds i8, i8* %1, i64 %1478
  store i8 %1479, i8* %1480, align 1
  %1481 = getelementptr inbounds i8, i8* %1, i64 %1478
  %1482 = load i8, i8* %1481, align 1
  %1483 = zext i8 %1482 to i32
  %1484 = icmp eq i32 %1483, 0
  br i1 %1484, label %1485, label %1488

1485:                                             ; preds = %1477
  %1486 = mul nuw nsw i64 %1478, 16
  %1487 = getelementptr inbounds i8, i8* %0, i64 %1486
  call void @llvm.memset.p0i8.i64(i8* align 1 %1487, i8 0, i64 16, i1 false)
  br label %1488

1488:                                             ; preds = %1485, %1477
  %1489 = add nuw nsw i64 %1478, 1
  %1490 = call zeroext i8 @randombit()
  %1491 = getelementptr inbounds i8, i8* %1, i64 %1489
  store i8 %1490, i8* %1491, align 1
  %1492 = getelementptr inbounds i8, i8* %1, i64 %1489
  %1493 = load i8, i8* %1492, align 1
  %1494 = zext i8 %1493 to i32
  %1495 = icmp eq i32 %1494, 0
  br i1 %1495, label %1496, label %1499

1496:                                             ; preds = %1488
  %1497 = mul nuw nsw i64 %1489, 16
  %1498 = getelementptr inbounds i8, i8* %0, i64 %1497
  call void @llvm.memset.p0i8.i64(i8* align 1 %1498, i8 0, i64 16, i1 false)
  br label %1499

1499:                                             ; preds = %1496, %1488
  %1500 = add nuw nsw i64 %1489, 1
  %1501 = call zeroext i8 @randombit()
  %1502 = getelementptr inbounds i8, i8* %1, i64 %1500
  store i8 %1501, i8* %1502, align 1
  %1503 = getelementptr inbounds i8, i8* %1, i64 %1500
  %1504 = load i8, i8* %1503, align 1
  %1505 = zext i8 %1504 to i32
  %1506 = icmp eq i32 %1505, 0
  br i1 %1506, label %1507, label %1510

1507:                                             ; preds = %1499
  %1508 = mul nuw nsw i64 %1500, 16
  %1509 = getelementptr inbounds i8, i8* %0, i64 %1508
  call void @llvm.memset.p0i8.i64(i8* align 1 %1509, i8 0, i64 16, i1 false)
  br label %1510

1510:                                             ; preds = %1507, %1499
  %1511 = add nuw nsw i64 %1500, 1
  %1512 = call zeroext i8 @randombit()
  %1513 = getelementptr inbounds i8, i8* %1, i64 %1511
  store i8 %1512, i8* %1513, align 1
  %1514 = getelementptr inbounds i8, i8* %1, i64 %1511
  %1515 = load i8, i8* %1514, align 1
  %1516 = zext i8 %1515 to i32
  %1517 = icmp eq i32 %1516, 0
  br i1 %1517, label %1518, label %1521

1518:                                             ; preds = %1510
  %1519 = mul nuw nsw i64 %1511, 16
  %1520 = getelementptr inbounds i8, i8* %0, i64 %1519
  call void @llvm.memset.p0i8.i64(i8* align 1 %1520, i8 0, i64 16, i1 false)
  br label %1521

1521:                                             ; preds = %1518, %1510
  %1522 = add nuw nsw i64 %1511, 1
  %1523 = call zeroext i8 @randombit()
  %1524 = getelementptr inbounds i8, i8* %1, i64 %1522
  store i8 %1523, i8* %1524, align 1
  %1525 = getelementptr inbounds i8, i8* %1, i64 %1522
  %1526 = load i8, i8* %1525, align 1
  %1527 = zext i8 %1526 to i32
  %1528 = icmp eq i32 %1527, 0
  br i1 %1528, label %1529, label %1532

1529:                                             ; preds = %1521
  %1530 = mul nuw nsw i64 %1522, 16
  %1531 = getelementptr inbounds i8, i8* %0, i64 %1530
  call void @llvm.memset.p0i8.i64(i8* align 1 %1531, i8 0, i64 16, i1 false)
  br label %1532

1532:                                             ; preds = %1529, %1521
  %1533 = add nuw nsw i64 %1522, 1
  %1534 = call zeroext i8 @randombit()
  %1535 = getelementptr inbounds i8, i8* %1, i64 %1533
  store i8 %1534, i8* %1535, align 1
  %1536 = getelementptr inbounds i8, i8* %1, i64 %1533
  %1537 = load i8, i8* %1536, align 1
  %1538 = zext i8 %1537 to i32
  %1539 = icmp eq i32 %1538, 0
  br i1 %1539, label %1540, label %1543

1540:                                             ; preds = %1532
  %1541 = mul nuw nsw i64 %1533, 16
  %1542 = getelementptr inbounds i8, i8* %0, i64 %1541
  call void @llvm.memset.p0i8.i64(i8* align 1 %1542, i8 0, i64 16, i1 false)
  br label %1543

1543:                                             ; preds = %1540, %1532
  %1544 = add nuw nsw i64 %1533, 1
  %1545 = call zeroext i8 @randombit()
  %1546 = getelementptr inbounds i8, i8* %1, i64 %1544
  store i8 %1545, i8* %1546, align 1
  %1547 = getelementptr inbounds i8, i8* %1, i64 %1544
  %1548 = load i8, i8* %1547, align 1
  %1549 = zext i8 %1548 to i32
  %1550 = icmp eq i32 %1549, 0
  br i1 %1550, label %1551, label %1554

1551:                                             ; preds = %1543
  %1552 = mul nuw nsw i64 %1544, 16
  %1553 = getelementptr inbounds i8, i8* %0, i64 %1552
  call void @llvm.memset.p0i8.i64(i8* align 1 %1553, i8 0, i64 16, i1 false)
  br label %1554

1554:                                             ; preds = %1551, %1543
  %1555 = add nuw nsw i64 %1544, 1
  %1556 = call zeroext i8 @randombit()
  %1557 = getelementptr inbounds i8, i8* %1, i64 %1555
  store i8 %1556, i8* %1557, align 1
  %1558 = getelementptr inbounds i8, i8* %1, i64 %1555
  %1559 = load i8, i8* %1558, align 1
  %1560 = zext i8 %1559 to i32
  %1561 = icmp eq i32 %1560, 0
  br i1 %1561, label %1562, label %1565

1562:                                             ; preds = %1554
  %1563 = mul nuw nsw i64 %1555, 16
  %1564 = getelementptr inbounds i8, i8* %0, i64 %1563
  call void @llvm.memset.p0i8.i64(i8* align 1 %1564, i8 0, i64 16, i1 false)
  br label %1565

1565:                                             ; preds = %1562, %1554
  %1566 = add nuw nsw i64 %1555, 1
  %1567 = call zeroext i8 @randombit()
  %1568 = getelementptr inbounds i8, i8* %1, i64 %1566
  store i8 %1567, i8* %1568, align 1
  %1569 = getelementptr inbounds i8, i8* %1, i64 %1566
  %1570 = load i8, i8* %1569, align 1
  %1571 = zext i8 %1570 to i32
  %1572 = icmp eq i32 %1571, 0
  br i1 %1572, label %1573, label %1576

1573:                                             ; preds = %1565
  %1574 = mul nuw nsw i64 %1566, 16
  %1575 = getelementptr inbounds i8, i8* %0, i64 %1574
  call void @llvm.memset.p0i8.i64(i8* align 1 %1575, i8 0, i64 16, i1 false)
  br label %1576

1576:                                             ; preds = %1573, %1565
  %1577 = add nuw nsw i64 %1566, 1
  %1578 = call zeroext i8 @randombit()
  %1579 = getelementptr inbounds i8, i8* %1, i64 %1577
  store i8 %1578, i8* %1579, align 1
  %1580 = getelementptr inbounds i8, i8* %1, i64 %1577
  %1581 = load i8, i8* %1580, align 1
  %1582 = zext i8 %1581 to i32
  %1583 = icmp eq i32 %1582, 0
  br i1 %1583, label %1584, label %1587

1584:                                             ; preds = %1576
  %1585 = mul nuw nsw i64 %1577, 16
  %1586 = getelementptr inbounds i8, i8* %0, i64 %1585
  call void @llvm.memset.p0i8.i64(i8* align 1 %1586, i8 0, i64 16, i1 false)
  br label %1587

1587:                                             ; preds = %1584, %1576
  %1588 = add nuw nsw i64 %1577, 1
  %1589 = call zeroext i8 @randombit()
  %1590 = getelementptr inbounds i8, i8* %1, i64 %1588
  store i8 %1589, i8* %1590, align 1
  %1591 = getelementptr inbounds i8, i8* %1, i64 %1588
  %1592 = load i8, i8* %1591, align 1
  %1593 = zext i8 %1592 to i32
  %1594 = icmp eq i32 %1593, 0
  br i1 %1594, label %1595, label %1598

1595:                                             ; preds = %1587
  %1596 = mul nuw nsw i64 %1588, 16
  %1597 = getelementptr inbounds i8, i8* %0, i64 %1596
  call void @llvm.memset.p0i8.i64(i8* align 1 %1597, i8 0, i64 16, i1 false)
  br label %1598

1598:                                             ; preds = %1595, %1587
  %1599 = add nuw nsw i64 %1588, 1
  %1600 = call zeroext i8 @randombit()
  %1601 = getelementptr inbounds i8, i8* %1, i64 %1599
  store i8 %1600, i8* %1601, align 1
  %1602 = getelementptr inbounds i8, i8* %1, i64 %1599
  %1603 = load i8, i8* %1602, align 1
  %1604 = zext i8 %1603 to i32
  %1605 = icmp eq i32 %1604, 0
  br i1 %1605, label %1606, label %1609

1606:                                             ; preds = %1598
  %1607 = mul nuw nsw i64 %1599, 16
  %1608 = getelementptr inbounds i8, i8* %0, i64 %1607
  call void @llvm.memset.p0i8.i64(i8* align 1 %1608, i8 0, i64 16, i1 false)
  br label %1609

1609:                                             ; preds = %1606, %1598
  %1610 = add nuw nsw i64 %1599, 1
  %1611 = call zeroext i8 @randombit()
  %1612 = getelementptr inbounds i8, i8* %1, i64 %1610
  store i8 %1611, i8* %1612, align 1
  %1613 = getelementptr inbounds i8, i8* %1, i64 %1610
  %1614 = load i8, i8* %1613, align 1
  %1615 = zext i8 %1614 to i32
  %1616 = icmp eq i32 %1615, 0
  br i1 %1616, label %1617, label %1620

1617:                                             ; preds = %1609
  %1618 = mul nuw nsw i64 %1610, 16
  %1619 = getelementptr inbounds i8, i8* %0, i64 %1618
  call void @llvm.memset.p0i8.i64(i8* align 1 %1619, i8 0, i64 16, i1 false)
  br label %1620

1620:                                             ; preds = %1617, %1609
  %1621 = add nuw nsw i64 %1610, 1
  %1622 = call zeroext i8 @randombit()
  %1623 = getelementptr inbounds i8, i8* %1, i64 %1621
  store i8 %1622, i8* %1623, align 1
  %1624 = getelementptr inbounds i8, i8* %1, i64 %1621
  %1625 = load i8, i8* %1624, align 1
  %1626 = zext i8 %1625 to i32
  %1627 = icmp eq i32 %1626, 0
  br i1 %1627, label %1628, label %1631

1628:                                             ; preds = %1620
  %1629 = mul nuw nsw i64 %1621, 16
  %1630 = getelementptr inbounds i8, i8* %0, i64 %1629
  call void @llvm.memset.p0i8.i64(i8* align 1 %1630, i8 0, i64 16, i1 false)
  br label %1631

1631:                                             ; preds = %1628, %1620
  %1632 = add nuw nsw i64 %1621, 1
  %1633 = call zeroext i8 @randombit()
  %1634 = getelementptr inbounds i8, i8* %1, i64 %1632
  store i8 %1633, i8* %1634, align 1
  %1635 = getelementptr inbounds i8, i8* %1, i64 %1632
  %1636 = load i8, i8* %1635, align 1
  %1637 = zext i8 %1636 to i32
  %1638 = icmp eq i32 %1637, 0
  br i1 %1638, label %1639, label %1642

1639:                                             ; preds = %1631
  %1640 = mul nuw nsw i64 %1632, 16
  %1641 = getelementptr inbounds i8, i8* %0, i64 %1640
  call void @llvm.memset.p0i8.i64(i8* align 1 %1641, i8 0, i64 16, i1 false)
  br label %1642

1642:                                             ; preds = %1639, %1631
  %1643 = add nuw nsw i64 %1632, 1
  %1644 = call zeroext i8 @randombit()
  %1645 = getelementptr inbounds i8, i8* %1, i64 %1643
  store i8 %1644, i8* %1645, align 1
  %1646 = getelementptr inbounds i8, i8* %1, i64 %1643
  %1647 = load i8, i8* %1646, align 1
  %1648 = zext i8 %1647 to i32
  %1649 = icmp eq i32 %1648, 0
  br i1 %1649, label %1650, label %1653

1650:                                             ; preds = %1642
  %1651 = mul nuw nsw i64 %1643, 16
  %1652 = getelementptr inbounds i8, i8* %0, i64 %1651
  call void @llvm.memset.p0i8.i64(i8* align 1 %1652, i8 0, i64 16, i1 false)
  br label %1653

1653:                                             ; preds = %1650, %1642
  %1654 = add nuw nsw i64 %1643, 1
  %1655 = call zeroext i8 @randombit()
  %1656 = getelementptr inbounds i8, i8* %1, i64 %1654
  store i8 %1655, i8* %1656, align 1
  %1657 = getelementptr inbounds i8, i8* %1, i64 %1654
  %1658 = load i8, i8* %1657, align 1
  %1659 = zext i8 %1658 to i32
  %1660 = icmp eq i32 %1659, 0
  br i1 %1660, label %1661, label %1664

1661:                                             ; preds = %1653
  %1662 = mul nuw nsw i64 %1654, 16
  %1663 = getelementptr inbounds i8, i8* %0, i64 %1662
  call void @llvm.memset.p0i8.i64(i8* align 1 %1663, i8 0, i64 16, i1 false)
  br label %1664

1664:                                             ; preds = %1661, %1653
  %1665 = add nuw nsw i64 %1654, 1
  %1666 = call zeroext i8 @randombit()
  %1667 = getelementptr inbounds i8, i8* %1, i64 %1665
  store i8 %1666, i8* %1667, align 1
  %1668 = getelementptr inbounds i8, i8* %1, i64 %1665
  %1669 = load i8, i8* %1668, align 1
  %1670 = zext i8 %1669 to i32
  %1671 = icmp eq i32 %1670, 0
  br i1 %1671, label %1672, label %1675

1672:                                             ; preds = %1664
  %1673 = mul nuw nsw i64 %1665, 16
  %1674 = getelementptr inbounds i8, i8* %0, i64 %1673
  call void @llvm.memset.p0i8.i64(i8* align 1 %1674, i8 0, i64 16, i1 false)
  br label %1675

1675:                                             ; preds = %1672, %1664
  %1676 = add nuw nsw i64 %1665, 1
  %1677 = call zeroext i8 @randombit()
  %1678 = getelementptr inbounds i8, i8* %1, i64 %1676
  store i8 %1677, i8* %1678, align 1
  %1679 = getelementptr inbounds i8, i8* %1, i64 %1676
  %1680 = load i8, i8* %1679, align 1
  %1681 = zext i8 %1680 to i32
  %1682 = icmp eq i32 %1681, 0
  br i1 %1682, label %1683, label %1686

1683:                                             ; preds = %1675
  %1684 = mul nuw nsw i64 %1676, 16
  %1685 = getelementptr inbounds i8, i8* %0, i64 %1684
  call void @llvm.memset.p0i8.i64(i8* align 1 %1685, i8 0, i64 16, i1 false)
  br label %1686

1686:                                             ; preds = %1683, %1675
  %1687 = add nuw nsw i64 %1676, 1
  %1688 = call zeroext i8 @randombit()
  %1689 = getelementptr inbounds i8, i8* %1, i64 %1687
  store i8 %1688, i8* %1689, align 1
  %1690 = getelementptr inbounds i8, i8* %1, i64 %1687
  %1691 = load i8, i8* %1690, align 1
  %1692 = zext i8 %1691 to i32
  %1693 = icmp eq i32 %1692, 0
  br i1 %1693, label %1694, label %1697

1694:                                             ; preds = %1686
  %1695 = mul nuw nsw i64 %1687, 16
  %1696 = getelementptr inbounds i8, i8* %0, i64 %1695
  call void @llvm.memset.p0i8.i64(i8* align 1 %1696, i8 0, i64 16, i1 false)
  br label %1697

1697:                                             ; preds = %1694, %1686
  %1698 = add nuw nsw i64 %1687, 1
  %1699 = call zeroext i8 @randombit()
  %1700 = getelementptr inbounds i8, i8* %1, i64 %1698
  store i8 %1699, i8* %1700, align 1
  %1701 = getelementptr inbounds i8, i8* %1, i64 %1698
  %1702 = load i8, i8* %1701, align 1
  %1703 = zext i8 %1702 to i32
  %1704 = icmp eq i32 %1703, 0
  br i1 %1704, label %1705, label %1708

1705:                                             ; preds = %1697
  %1706 = mul nuw nsw i64 %1698, 16
  %1707 = getelementptr inbounds i8, i8* %0, i64 %1706
  call void @llvm.memset.p0i8.i64(i8* align 1 %1707, i8 0, i64 16, i1 false)
  br label %1708

1708:                                             ; preds = %1705, %1697
  %1709 = add nuw nsw i64 %1698, 1
  %1710 = call zeroext i8 @randombit()
  %1711 = getelementptr inbounds i8, i8* %1, i64 %1709
  store i8 %1710, i8* %1711, align 1
  %1712 = getelementptr inbounds i8, i8* %1, i64 %1709
  %1713 = load i8, i8* %1712, align 1
  %1714 = zext i8 %1713 to i32
  %1715 = icmp eq i32 %1714, 0
  br i1 %1715, label %1716, label %1719

1716:                                             ; preds = %1708
  %1717 = mul nuw nsw i64 %1709, 16
  %1718 = getelementptr inbounds i8, i8* %0, i64 %1717
  call void @llvm.memset.p0i8.i64(i8* align 1 %1718, i8 0, i64 16, i1 false)
  br label %1719

1719:                                             ; preds = %1716, %1708
  %1720 = add nuw nsw i64 %1709, 1
  %1721 = call zeroext i8 @randombit()
  %1722 = getelementptr inbounds i8, i8* %1, i64 %1720
  store i8 %1721, i8* %1722, align 1
  %1723 = getelementptr inbounds i8, i8* %1, i64 %1720
  %1724 = load i8, i8* %1723, align 1
  %1725 = zext i8 %1724 to i32
  %1726 = icmp eq i32 %1725, 0
  br i1 %1726, label %1727, label %1730

1727:                                             ; preds = %1719
  %1728 = mul nuw nsw i64 %1720, 16
  %1729 = getelementptr inbounds i8, i8* %0, i64 %1728
  call void @llvm.memset.p0i8.i64(i8* align 1 %1729, i8 0, i64 16, i1 false)
  br label %1730

1730:                                             ; preds = %1727, %1719
  %1731 = add nuw nsw i64 %1720, 1
  %1732 = call zeroext i8 @randombit()
  %1733 = getelementptr inbounds i8, i8* %1, i64 %1731
  store i8 %1732, i8* %1733, align 1
  %1734 = getelementptr inbounds i8, i8* %1, i64 %1731
  %1735 = load i8, i8* %1734, align 1
  %1736 = zext i8 %1735 to i32
  %1737 = icmp eq i32 %1736, 0
  br i1 %1737, label %1738, label %1741

1738:                                             ; preds = %1730
  %1739 = mul nuw nsw i64 %1731, 16
  %1740 = getelementptr inbounds i8, i8* %0, i64 %1739
  call void @llvm.memset.p0i8.i64(i8* align 1 %1740, i8 0, i64 16, i1 false)
  br label %1741

1741:                                             ; preds = %1738, %1730
  %1742 = add nuw nsw i64 %1731, 1
  %1743 = call zeroext i8 @randombit()
  %1744 = getelementptr inbounds i8, i8* %1, i64 %1742
  store i8 %1743, i8* %1744, align 1
  %1745 = getelementptr inbounds i8, i8* %1, i64 %1742
  %1746 = load i8, i8* %1745, align 1
  %1747 = zext i8 %1746 to i32
  %1748 = icmp eq i32 %1747, 0
  br i1 %1748, label %1749, label %1752

1749:                                             ; preds = %1741
  %1750 = mul nuw nsw i64 %1742, 16
  %1751 = getelementptr inbounds i8, i8* %0, i64 %1750
  call void @llvm.memset.p0i8.i64(i8* align 1 %1751, i8 0, i64 16, i1 false)
  br label %1752

1752:                                             ; preds = %1749, %1741
  %1753 = add nuw nsw i64 %1742, 1
  %1754 = call zeroext i8 @randombit()
  %1755 = getelementptr inbounds i8, i8* %1, i64 %1753
  store i8 %1754, i8* %1755, align 1
  %1756 = getelementptr inbounds i8, i8* %1, i64 %1753
  %1757 = load i8, i8* %1756, align 1
  %1758 = zext i8 %1757 to i32
  %1759 = icmp eq i32 %1758, 0
  br i1 %1759, label %1760, label %1763

1760:                                             ; preds = %1752
  %1761 = mul nuw nsw i64 %1753, 16
  %1762 = getelementptr inbounds i8, i8* %0, i64 %1761
  call void @llvm.memset.p0i8.i64(i8* align 1 %1762, i8 0, i64 16, i1 false)
  br label %1763

1763:                                             ; preds = %1760, %1752
  %1764 = add nuw nsw i64 %1753, 1
  %1765 = call zeroext i8 @randombit()
  %1766 = getelementptr inbounds i8, i8* %1, i64 %1764
  store i8 %1765, i8* %1766, align 1
  %1767 = getelementptr inbounds i8, i8* %1, i64 %1764
  %1768 = load i8, i8* %1767, align 1
  %1769 = zext i8 %1768 to i32
  %1770 = icmp eq i32 %1769, 0
  br i1 %1770, label %1771, label %1774

1771:                                             ; preds = %1763
  %1772 = mul nuw nsw i64 %1764, 16
  %1773 = getelementptr inbounds i8, i8* %0, i64 %1772
  call void @llvm.memset.p0i8.i64(i8* align 1 %1773, i8 0, i64 16, i1 false)
  br label %1774

1774:                                             ; preds = %1771, %1763
  %1775 = add nuw nsw i64 %1764, 1
  %1776 = call zeroext i8 @randombit()
  %1777 = getelementptr inbounds i8, i8* %1, i64 %1775
  store i8 %1776, i8* %1777, align 1
  %1778 = getelementptr inbounds i8, i8* %1, i64 %1775
  %1779 = load i8, i8* %1778, align 1
  %1780 = zext i8 %1779 to i32
  %1781 = icmp eq i32 %1780, 0
  br i1 %1781, label %1782, label %1785

1782:                                             ; preds = %1774
  %1783 = mul nuw nsw i64 %1775, 16
  %1784 = getelementptr inbounds i8, i8* %0, i64 %1783
  call void @llvm.memset.p0i8.i64(i8* align 1 %1784, i8 0, i64 16, i1 false)
  br label %1785

1785:                                             ; preds = %1782, %1774
  %1786 = add nuw nsw i64 %1775, 1
  %1787 = call zeroext i8 @randombit()
  %1788 = getelementptr inbounds i8, i8* %1, i64 %1786
  store i8 %1787, i8* %1788, align 1
  %1789 = getelementptr inbounds i8, i8* %1, i64 %1786
  %1790 = load i8, i8* %1789, align 1
  %1791 = zext i8 %1790 to i32
  %1792 = icmp eq i32 %1791, 0
  br i1 %1792, label %1793, label %1796

1793:                                             ; preds = %1785
  %1794 = mul nuw nsw i64 %1786, 16
  %1795 = getelementptr inbounds i8, i8* %0, i64 %1794
  call void @llvm.memset.p0i8.i64(i8* align 1 %1795, i8 0, i64 16, i1 false)
  br label %1796

1796:                                             ; preds = %1793, %1785
  %1797 = add nuw nsw i64 %1786, 1
  %1798 = call zeroext i8 @randombit()
  %1799 = getelementptr inbounds i8, i8* %1, i64 %1797
  store i8 %1798, i8* %1799, align 1
  %1800 = getelementptr inbounds i8, i8* %1, i64 %1797
  %1801 = load i8, i8* %1800, align 1
  %1802 = zext i8 %1801 to i32
  %1803 = icmp eq i32 %1802, 0
  br i1 %1803, label %1804, label %1807

1804:                                             ; preds = %1796
  %1805 = mul nuw nsw i64 %1797, 16
  %1806 = getelementptr inbounds i8, i8* %0, i64 %1805
  call void @llvm.memset.p0i8.i64(i8* align 1 %1806, i8 0, i64 16, i1 false)
  br label %1807

1807:                                             ; preds = %1804, %1796
  %1808 = add nuw nsw i64 %1797, 1
  %1809 = call zeroext i8 @randombit()
  %1810 = getelementptr inbounds i8, i8* %1, i64 %1808
  store i8 %1809, i8* %1810, align 1
  %1811 = getelementptr inbounds i8, i8* %1, i64 %1808
  %1812 = load i8, i8* %1811, align 1
  %1813 = zext i8 %1812 to i32
  %1814 = icmp eq i32 %1813, 0
  br i1 %1814, label %1815, label %1818

1815:                                             ; preds = %1807
  %1816 = mul nuw nsw i64 %1808, 16
  %1817 = getelementptr inbounds i8, i8* %0, i64 %1816
  call void @llvm.memset.p0i8.i64(i8* align 1 %1817, i8 0, i64 16, i1 false)
  br label %1818

1818:                                             ; preds = %1815, %1807
  %1819 = add nuw nsw i64 %1808, 1
  %1820 = call zeroext i8 @randombit()
  %1821 = getelementptr inbounds i8, i8* %1, i64 %1819
  store i8 %1820, i8* %1821, align 1
  %1822 = getelementptr inbounds i8, i8* %1, i64 %1819
  %1823 = load i8, i8* %1822, align 1
  %1824 = zext i8 %1823 to i32
  %1825 = icmp eq i32 %1824, 0
  br i1 %1825, label %1826, label %1829

1826:                                             ; preds = %1818
  %1827 = mul nuw nsw i64 %1819, 16
  %1828 = getelementptr inbounds i8, i8* %0, i64 %1827
  call void @llvm.memset.p0i8.i64(i8* align 1 %1828, i8 0, i64 16, i1 false)
  br label %1829

1829:                                             ; preds = %1826, %1818
  %1830 = add nuw nsw i64 %1819, 1
  %1831 = call zeroext i8 @randombit()
  %1832 = getelementptr inbounds i8, i8* %1, i64 %1830
  store i8 %1831, i8* %1832, align 1
  %1833 = getelementptr inbounds i8, i8* %1, i64 %1830
  %1834 = load i8, i8* %1833, align 1
  %1835 = zext i8 %1834 to i32
  %1836 = icmp eq i32 %1835, 0
  br i1 %1836, label %1837, label %1840

1837:                                             ; preds = %1829
  %1838 = mul nuw nsw i64 %1830, 16
  %1839 = getelementptr inbounds i8, i8* %0, i64 %1838
  call void @llvm.memset.p0i8.i64(i8* align 1 %1839, i8 0, i64 16, i1 false)
  br label %1840

1840:                                             ; preds = %1837, %1829
  %1841 = add nuw nsw i64 %1830, 1
  %1842 = call zeroext i8 @randombit()
  %1843 = getelementptr inbounds i8, i8* %1, i64 %1841
  store i8 %1842, i8* %1843, align 1
  %1844 = getelementptr inbounds i8, i8* %1, i64 %1841
  %1845 = load i8, i8* %1844, align 1
  %1846 = zext i8 %1845 to i32
  %1847 = icmp eq i32 %1846, 0
  br i1 %1847, label %1848, label %1851

1848:                                             ; preds = %1840
  %1849 = mul nuw nsw i64 %1841, 16
  %1850 = getelementptr inbounds i8, i8* %0, i64 %1849
  call void @llvm.memset.p0i8.i64(i8* align 1 %1850, i8 0, i64 16, i1 false)
  br label %1851

1851:                                             ; preds = %1848, %1840
  %1852 = add nuw nsw i64 %1841, 1
  %1853 = call zeroext i8 @randombit()
  %1854 = getelementptr inbounds i8, i8* %1, i64 %1852
  store i8 %1853, i8* %1854, align 1
  %1855 = getelementptr inbounds i8, i8* %1, i64 %1852
  %1856 = load i8, i8* %1855, align 1
  %1857 = zext i8 %1856 to i32
  %1858 = icmp eq i32 %1857, 0
  br i1 %1858, label %1859, label %1862

1859:                                             ; preds = %1851
  %1860 = mul nuw nsw i64 %1852, 16
  %1861 = getelementptr inbounds i8, i8* %0, i64 %1860
  call void @llvm.memset.p0i8.i64(i8* align 1 %1861, i8 0, i64 16, i1 false)
  br label %1862

1862:                                             ; preds = %1859, %1851
  %1863 = add nuw nsw i64 %1852, 1
  %1864 = call zeroext i8 @randombit()
  %1865 = getelementptr inbounds i8, i8* %1, i64 %1863
  store i8 %1864, i8* %1865, align 1
  %1866 = getelementptr inbounds i8, i8* %1, i64 %1863
  %1867 = load i8, i8* %1866, align 1
  %1868 = zext i8 %1867 to i32
  %1869 = icmp eq i32 %1868, 0
  br i1 %1869, label %1870, label %1873

1870:                                             ; preds = %1862
  %1871 = mul nuw nsw i64 %1863, 16
  %1872 = getelementptr inbounds i8, i8* %0, i64 %1871
  call void @llvm.memset.p0i8.i64(i8* align 1 %1872, i8 0, i64 16, i1 false)
  br label %1873

1873:                                             ; preds = %1870, %1862
  %1874 = add nuw nsw i64 %1863, 1
  %1875 = call zeroext i8 @randombit()
  %1876 = getelementptr inbounds i8, i8* %1, i64 %1874
  store i8 %1875, i8* %1876, align 1
  %1877 = getelementptr inbounds i8, i8* %1, i64 %1874
  %1878 = load i8, i8* %1877, align 1
  %1879 = zext i8 %1878 to i32
  %1880 = icmp eq i32 %1879, 0
  br i1 %1880, label %1881, label %1884

1881:                                             ; preds = %1873
  %1882 = mul nuw nsw i64 %1874, 16
  %1883 = getelementptr inbounds i8, i8* %0, i64 %1882
  call void @llvm.memset.p0i8.i64(i8* align 1 %1883, i8 0, i64 16, i1 false)
  br label %1884

1884:                                             ; preds = %1881, %1873
  %1885 = add nuw nsw i64 %1874, 1
  %1886 = call zeroext i8 @randombit()
  %1887 = getelementptr inbounds i8, i8* %1, i64 %1885
  store i8 %1886, i8* %1887, align 1
  %1888 = getelementptr inbounds i8, i8* %1, i64 %1885
  %1889 = load i8, i8* %1888, align 1
  %1890 = zext i8 %1889 to i32
  %1891 = icmp eq i32 %1890, 0
  br i1 %1891, label %1892, label %1895

1892:                                             ; preds = %1884
  %1893 = mul nuw nsw i64 %1885, 16
  %1894 = getelementptr inbounds i8, i8* %0, i64 %1893
  call void @llvm.memset.p0i8.i64(i8* align 1 %1894, i8 0, i64 16, i1 false)
  br label %1895

1895:                                             ; preds = %1892, %1884
  %1896 = add nuw nsw i64 %1885, 1
  %1897 = call zeroext i8 @randombit()
  %1898 = getelementptr inbounds i8, i8* %1, i64 %1896
  store i8 %1897, i8* %1898, align 1
  %1899 = getelementptr inbounds i8, i8* %1, i64 %1896
  %1900 = load i8, i8* %1899, align 1
  %1901 = zext i8 %1900 to i32
  %1902 = icmp eq i32 %1901, 0
  br i1 %1902, label %1903, label %1906

1903:                                             ; preds = %1895
  %1904 = mul nuw nsw i64 %1896, 16
  %1905 = getelementptr inbounds i8, i8* %0, i64 %1904
  call void @llvm.memset.p0i8.i64(i8* align 1 %1905, i8 0, i64 16, i1 false)
  br label %1906

1906:                                             ; preds = %1903, %1895
  %1907 = add nuw nsw i64 %1896, 1
  %1908 = call zeroext i8 @randombit()
  %1909 = getelementptr inbounds i8, i8* %1, i64 %1907
  store i8 %1908, i8* %1909, align 1
  %1910 = getelementptr inbounds i8, i8* %1, i64 %1907
  %1911 = load i8, i8* %1910, align 1
  %1912 = zext i8 %1911 to i32
  %1913 = icmp eq i32 %1912, 0
  br i1 %1913, label %1914, label %1917

1914:                                             ; preds = %1906
  %1915 = mul nuw nsw i64 %1907, 16
  %1916 = getelementptr inbounds i8, i8* %0, i64 %1915
  call void @llvm.memset.p0i8.i64(i8* align 1 %1916, i8 0, i64 16, i1 false)
  br label %1917

1917:                                             ; preds = %1914, %1906
  %1918 = add nuw nsw i64 %1907, 1
  %1919 = call zeroext i8 @randombit()
  %1920 = getelementptr inbounds i8, i8* %1, i64 %1918
  store i8 %1919, i8* %1920, align 1
  %1921 = getelementptr inbounds i8, i8* %1, i64 %1918
  %1922 = load i8, i8* %1921, align 1
  %1923 = zext i8 %1922 to i32
  %1924 = icmp eq i32 %1923, 0
  br i1 %1924, label %1925, label %1928

1925:                                             ; preds = %1917
  %1926 = mul nuw nsw i64 %1918, 16
  %1927 = getelementptr inbounds i8, i8* %0, i64 %1926
  call void @llvm.memset.p0i8.i64(i8* align 1 %1927, i8 0, i64 16, i1 false)
  br label %1928

1928:                                             ; preds = %1925, %1917
  %1929 = add nuw nsw i64 %1918, 1
  %1930 = call zeroext i8 @randombit()
  %1931 = getelementptr inbounds i8, i8* %1, i64 %1929
  store i8 %1930, i8* %1931, align 1
  %1932 = getelementptr inbounds i8, i8* %1, i64 %1929
  %1933 = load i8, i8* %1932, align 1
  %1934 = zext i8 %1933 to i32
  %1935 = icmp eq i32 %1934, 0
  br i1 %1935, label %1936, label %1939

1936:                                             ; preds = %1928
  %1937 = mul nuw nsw i64 %1929, 16
  %1938 = getelementptr inbounds i8, i8* %0, i64 %1937
  call void @llvm.memset.p0i8.i64(i8* align 1 %1938, i8 0, i64 16, i1 false)
  br label %1939

1939:                                             ; preds = %1936, %1928
  %1940 = add nuw nsw i64 %1929, 1
  %1941 = call zeroext i8 @randombit()
  %1942 = getelementptr inbounds i8, i8* %1, i64 %1940
  store i8 %1941, i8* %1942, align 1
  %1943 = getelementptr inbounds i8, i8* %1, i64 %1940
  %1944 = load i8, i8* %1943, align 1
  %1945 = zext i8 %1944 to i32
  %1946 = icmp eq i32 %1945, 0
  br i1 %1946, label %1947, label %1950

1947:                                             ; preds = %1939
  %1948 = mul nuw nsw i64 %1940, 16
  %1949 = getelementptr inbounds i8, i8* %0, i64 %1948
  call void @llvm.memset.p0i8.i64(i8* align 1 %1949, i8 0, i64 16, i1 false)
  br label %1950

1950:                                             ; preds = %1947, %1939
  %1951 = add nuw nsw i64 %1940, 1
  %1952 = call zeroext i8 @randombit()
  %1953 = getelementptr inbounds i8, i8* %1, i64 %1951
  store i8 %1952, i8* %1953, align 1
  %1954 = getelementptr inbounds i8, i8* %1, i64 %1951
  %1955 = load i8, i8* %1954, align 1
  %1956 = zext i8 %1955 to i32
  %1957 = icmp eq i32 %1956, 0
  br i1 %1957, label %1958, label %1961

1958:                                             ; preds = %1950
  %1959 = mul nuw nsw i64 %1951, 16
  %1960 = getelementptr inbounds i8, i8* %0, i64 %1959
  call void @llvm.memset.p0i8.i64(i8* align 1 %1960, i8 0, i64 16, i1 false)
  br label %1961

1961:                                             ; preds = %1958, %1950
  %1962 = add nuw nsw i64 %1951, 1
  %1963 = call zeroext i8 @randombit()
  %1964 = getelementptr inbounds i8, i8* %1, i64 %1962
  store i8 %1963, i8* %1964, align 1
  %1965 = getelementptr inbounds i8, i8* %1, i64 %1962
  %1966 = load i8, i8* %1965, align 1
  %1967 = zext i8 %1966 to i32
  %1968 = icmp eq i32 %1967, 0
  br i1 %1968, label %1969, label %1972

1969:                                             ; preds = %1961
  %1970 = mul nuw nsw i64 %1962, 16
  %1971 = getelementptr inbounds i8, i8* %0, i64 %1970
  call void @llvm.memset.p0i8.i64(i8* align 1 %1971, i8 0, i64 16, i1 false)
  br label %1972

1972:                                             ; preds = %1969, %1961
  %1973 = add nuw nsw i64 %1962, 1
  %1974 = call zeroext i8 @randombit()
  %1975 = getelementptr inbounds i8, i8* %1, i64 %1973
  store i8 %1974, i8* %1975, align 1
  %1976 = getelementptr inbounds i8, i8* %1, i64 %1973
  %1977 = load i8, i8* %1976, align 1
  %1978 = zext i8 %1977 to i32
  %1979 = icmp eq i32 %1978, 0
  br i1 %1979, label %1980, label %1983

1980:                                             ; preds = %1972
  %1981 = mul nuw nsw i64 %1973, 16
  %1982 = getelementptr inbounds i8, i8* %0, i64 %1981
  call void @llvm.memset.p0i8.i64(i8* align 1 %1982, i8 0, i64 16, i1 false)
  br label %1983

1983:                                             ; preds = %1980, %1972
  %1984 = add nuw nsw i64 %1973, 1
  %1985 = call zeroext i8 @randombit()
  %1986 = getelementptr inbounds i8, i8* %1, i64 %1984
  store i8 %1985, i8* %1986, align 1
  %1987 = getelementptr inbounds i8, i8* %1, i64 %1984
  %1988 = load i8, i8* %1987, align 1
  %1989 = zext i8 %1988 to i32
  %1990 = icmp eq i32 %1989, 0
  br i1 %1990, label %1991, label %1994

1991:                                             ; preds = %1983
  %1992 = mul nuw nsw i64 %1984, 16
  %1993 = getelementptr inbounds i8, i8* %0, i64 %1992
  call void @llvm.memset.p0i8.i64(i8* align 1 %1993, i8 0, i64 16, i1 false)
  br label %1994

1994:                                             ; preds = %1991, %1983
  %1995 = add nuw nsw i64 %1984, 1
  %1996 = call zeroext i8 @randombit()
  %1997 = getelementptr inbounds i8, i8* %1, i64 %1995
  store i8 %1996, i8* %1997, align 1
  %1998 = getelementptr inbounds i8, i8* %1, i64 %1995
  %1999 = load i8, i8* %1998, align 1
  %2000 = zext i8 %1999 to i32
  %2001 = icmp eq i32 %2000, 0
  br i1 %2001, label %2002, label %2005

2002:                                             ; preds = %1994
  %2003 = mul nuw nsw i64 %1995, 16
  %2004 = getelementptr inbounds i8, i8* %0, i64 %2003
  call void @llvm.memset.p0i8.i64(i8* align 1 %2004, i8 0, i64 16, i1 false)
  br label %2005

2005:                                             ; preds = %2002, %1994
  %2006 = add nuw nsw i64 %1995, 1
  %2007 = call zeroext i8 @randombit()
  %2008 = getelementptr inbounds i8, i8* %1, i64 %2006
  store i8 %2007, i8* %2008, align 1
  %2009 = getelementptr inbounds i8, i8* %1, i64 %2006
  %2010 = load i8, i8* %2009, align 1
  %2011 = zext i8 %2010 to i32
  %2012 = icmp eq i32 %2011, 0
  br i1 %2012, label %2013, label %2016

2013:                                             ; preds = %2005
  %2014 = mul nuw nsw i64 %2006, 16
  %2015 = getelementptr inbounds i8, i8* %0, i64 %2014
  call void @llvm.memset.p0i8.i64(i8* align 1 %2015, i8 0, i64 16, i1 false)
  br label %2016

2016:                                             ; preds = %2013, %2005
  %2017 = add nuw nsw i64 %2006, 1
  %2018 = call zeroext i8 @randombit()
  %2019 = getelementptr inbounds i8, i8* %1, i64 %2017
  store i8 %2018, i8* %2019, align 1
  %2020 = getelementptr inbounds i8, i8* %1, i64 %2017
  %2021 = load i8, i8* %2020, align 1
  %2022 = zext i8 %2021 to i32
  %2023 = icmp eq i32 %2022, 0
  br i1 %2023, label %2024, label %2027

2024:                                             ; preds = %2016
  %2025 = mul nuw nsw i64 %2017, 16
  %2026 = getelementptr inbounds i8, i8* %0, i64 %2025
  call void @llvm.memset.p0i8.i64(i8* align 1 %2026, i8 0, i64 16, i1 false)
  br label %2027

2027:                                             ; preds = %2024, %2016
  %2028 = add nuw nsw i64 %2017, 1
  %2029 = call zeroext i8 @randombit()
  %2030 = getelementptr inbounds i8, i8* %1, i64 %2028
  store i8 %2029, i8* %2030, align 1
  %2031 = getelementptr inbounds i8, i8* %1, i64 %2028
  %2032 = load i8, i8* %2031, align 1
  %2033 = zext i8 %2032 to i32
  %2034 = icmp eq i32 %2033, 0
  br i1 %2034, label %2035, label %2038

2035:                                             ; preds = %2027
  %2036 = mul nuw nsw i64 %2028, 16
  %2037 = getelementptr inbounds i8, i8* %0, i64 %2036
  call void @llvm.memset.p0i8.i64(i8* align 1 %2037, i8 0, i64 16, i1 false)
  br label %2038

2038:                                             ; preds = %2035, %2027
  %2039 = add nuw nsw i64 %2028, 1
  %2040 = call zeroext i8 @randombit()
  %2041 = getelementptr inbounds i8, i8* %1, i64 %2039
  store i8 %2040, i8* %2041, align 1
  %2042 = getelementptr inbounds i8, i8* %1, i64 %2039
  %2043 = load i8, i8* %2042, align 1
  %2044 = zext i8 %2043 to i32
  %2045 = icmp eq i32 %2044, 0
  br i1 %2045, label %2046, label %2049

2046:                                             ; preds = %2038
  %2047 = mul nuw nsw i64 %2039, 16
  %2048 = getelementptr inbounds i8, i8* %0, i64 %2047
  call void @llvm.memset.p0i8.i64(i8* align 1 %2048, i8 0, i64 16, i1 false)
  br label %2049

2049:                                             ; preds = %2046, %2038
  %2050 = add nuw nsw i64 %2039, 1
  %2051 = call zeroext i8 @randombit()
  %2052 = getelementptr inbounds i8, i8* %1, i64 %2050
  store i8 %2051, i8* %2052, align 1
  %2053 = getelementptr inbounds i8, i8* %1, i64 %2050
  %2054 = load i8, i8* %2053, align 1
  %2055 = zext i8 %2054 to i32
  %2056 = icmp eq i32 %2055, 0
  br i1 %2056, label %2057, label %2060

2057:                                             ; preds = %2049
  %2058 = mul nuw nsw i64 %2050, 16
  %2059 = getelementptr inbounds i8, i8* %0, i64 %2058
  call void @llvm.memset.p0i8.i64(i8* align 1 %2059, i8 0, i64 16, i1 false)
  br label %2060

2060:                                             ; preds = %2057, %2049
  %2061 = add nuw nsw i64 %2050, 1
  %2062 = call zeroext i8 @randombit()
  %2063 = getelementptr inbounds i8, i8* %1, i64 %2061
  store i8 %2062, i8* %2063, align 1
  %2064 = getelementptr inbounds i8, i8* %1, i64 %2061
  %2065 = load i8, i8* %2064, align 1
  %2066 = zext i8 %2065 to i32
  %2067 = icmp eq i32 %2066, 0
  br i1 %2067, label %2068, label %2071

2068:                                             ; preds = %2060
  %2069 = mul nuw nsw i64 %2061, 16
  %2070 = getelementptr inbounds i8, i8* %0, i64 %2069
  call void @llvm.memset.p0i8.i64(i8* align 1 %2070, i8 0, i64 16, i1 false)
  br label %2071

2071:                                             ; preds = %2068, %2060
  %2072 = add nuw nsw i64 %2061, 1
  %2073 = call zeroext i8 @randombit()
  %2074 = getelementptr inbounds i8, i8* %1, i64 %2072
  store i8 %2073, i8* %2074, align 1
  %2075 = getelementptr inbounds i8, i8* %1, i64 %2072
  %2076 = load i8, i8* %2075, align 1
  %2077 = zext i8 %2076 to i32
  %2078 = icmp eq i32 %2077, 0
  br i1 %2078, label %2079, label %2082

2079:                                             ; preds = %2071
  %2080 = mul nuw nsw i64 %2072, 16
  %2081 = getelementptr inbounds i8, i8* %0, i64 %2080
  call void @llvm.memset.p0i8.i64(i8* align 1 %2081, i8 0, i64 16, i1 false)
  br label %2082

2082:                                             ; preds = %2079, %2071
  %2083 = add nuw nsw i64 %2072, 1
  %2084 = call zeroext i8 @randombit()
  %2085 = getelementptr inbounds i8, i8* %1, i64 %2083
  store i8 %2084, i8* %2085, align 1
  %2086 = getelementptr inbounds i8, i8* %1, i64 %2083
  %2087 = load i8, i8* %2086, align 1
  %2088 = zext i8 %2087 to i32
  %2089 = icmp eq i32 %2088, 0
  br i1 %2089, label %2090, label %2093

2090:                                             ; preds = %2082
  %2091 = mul nuw nsw i64 %2083, 16
  %2092 = getelementptr inbounds i8, i8* %0, i64 %2091
  call void @llvm.memset.p0i8.i64(i8* align 1 %2092, i8 0, i64 16, i1 false)
  br label %2093

2093:                                             ; preds = %2090, %2082
  %2094 = add nuw nsw i64 %2083, 1
  %2095 = call zeroext i8 @randombit()
  %2096 = getelementptr inbounds i8, i8* %1, i64 %2094
  store i8 %2095, i8* %2096, align 1
  %2097 = getelementptr inbounds i8, i8* %1, i64 %2094
  %2098 = load i8, i8* %2097, align 1
  %2099 = zext i8 %2098 to i32
  %2100 = icmp eq i32 %2099, 0
  br i1 %2100, label %2101, label %2104

2101:                                             ; preds = %2093
  %2102 = mul nuw nsw i64 %2094, 16
  %2103 = getelementptr inbounds i8, i8* %0, i64 %2102
  call void @llvm.memset.p0i8.i64(i8* align 1 %2103, i8 0, i64 16, i1 false)
  br label %2104

2104:                                             ; preds = %2101, %2093
  %2105 = add nuw nsw i64 %2094, 1
  %2106 = call zeroext i8 @randombit()
  %2107 = getelementptr inbounds i8, i8* %1, i64 %2105
  store i8 %2106, i8* %2107, align 1
  %2108 = getelementptr inbounds i8, i8* %1, i64 %2105
  %2109 = load i8, i8* %2108, align 1
  %2110 = zext i8 %2109 to i32
  %2111 = icmp eq i32 %2110, 0
  br i1 %2111, label %2112, label %2115

2112:                                             ; preds = %2104
  %2113 = mul nuw nsw i64 %2105, 16
  %2114 = getelementptr inbounds i8, i8* %0, i64 %2113
  call void @llvm.memset.p0i8.i64(i8* align 1 %2114, i8 0, i64 16, i1 false)
  br label %2115

2115:                                             ; preds = %2112, %2104
  %2116 = add nuw nsw i64 %2105, 1
  %2117 = call zeroext i8 @randombit()
  %2118 = getelementptr inbounds i8, i8* %1, i64 %2116
  store i8 %2117, i8* %2118, align 1
  %2119 = getelementptr inbounds i8, i8* %1, i64 %2116
  %2120 = load i8, i8* %2119, align 1
  %2121 = zext i8 %2120 to i32
  %2122 = icmp eq i32 %2121, 0
  br i1 %2122, label %2123, label %2126

2123:                                             ; preds = %2115
  %2124 = mul nuw nsw i64 %2116, 16
  %2125 = getelementptr inbounds i8, i8* %0, i64 %2124
  call void @llvm.memset.p0i8.i64(i8* align 1 %2125, i8 0, i64 16, i1 false)
  br label %2126

2126:                                             ; preds = %2123, %2115
  %2127 = add nuw nsw i64 %2116, 1
  %2128 = call zeroext i8 @randombit()
  %2129 = getelementptr inbounds i8, i8* %1, i64 %2127
  store i8 %2128, i8* %2129, align 1
  %2130 = getelementptr inbounds i8, i8* %1, i64 %2127
  %2131 = load i8, i8* %2130, align 1
  %2132 = zext i8 %2131 to i32
  %2133 = icmp eq i32 %2132, 0
  br i1 %2133, label %2134, label %2137

2134:                                             ; preds = %2126
  %2135 = mul nuw nsw i64 %2127, 16
  %2136 = getelementptr inbounds i8, i8* %0, i64 %2135
  call void @llvm.memset.p0i8.i64(i8* align 1 %2136, i8 0, i64 16, i1 false)
  br label %2137

2137:                                             ; preds = %2134, %2126
  %2138 = add nuw nsw i64 %2127, 1
  %2139 = call zeroext i8 @randombit()
  %2140 = getelementptr inbounds i8, i8* %1, i64 %2138
  store i8 %2139, i8* %2140, align 1
  %2141 = getelementptr inbounds i8, i8* %1, i64 %2138
  %2142 = load i8, i8* %2141, align 1
  %2143 = zext i8 %2142 to i32
  %2144 = icmp eq i32 %2143, 0
  br i1 %2144, label %2145, label %2148

2145:                                             ; preds = %2137
  %2146 = mul nuw nsw i64 %2138, 16
  %2147 = getelementptr inbounds i8, i8* %0, i64 %2146
  call void @llvm.memset.p0i8.i64(i8* align 1 %2147, i8 0, i64 16, i1 false)
  br label %2148

2148:                                             ; preds = %2145, %2137
  %2149 = add nuw nsw i64 %2138, 1
  %2150 = call zeroext i8 @randombit()
  %2151 = getelementptr inbounds i8, i8* %1, i64 %2149
  store i8 %2150, i8* %2151, align 1
  %2152 = getelementptr inbounds i8, i8* %1, i64 %2149
  %2153 = load i8, i8* %2152, align 1
  %2154 = zext i8 %2153 to i32
  %2155 = icmp eq i32 %2154, 0
  br i1 %2155, label %2156, label %2159

2156:                                             ; preds = %2148
  %2157 = mul nuw nsw i64 %2149, 16
  %2158 = getelementptr inbounds i8, i8* %0, i64 %2157
  call void @llvm.memset.p0i8.i64(i8* align 1 %2158, i8 0, i64 16, i1 false)
  br label %2159

2159:                                             ; preds = %2156, %2148
  %2160 = add nuw nsw i64 %2149, 1
  %2161 = call zeroext i8 @randombit()
  %2162 = getelementptr inbounds i8, i8* %1, i64 %2160
  store i8 %2161, i8* %2162, align 1
  %2163 = getelementptr inbounds i8, i8* %1, i64 %2160
  %2164 = load i8, i8* %2163, align 1
  %2165 = zext i8 %2164 to i32
  %2166 = icmp eq i32 %2165, 0
  br i1 %2166, label %2167, label %2170

2167:                                             ; preds = %2159
  %2168 = mul nuw nsw i64 %2160, 16
  %2169 = getelementptr inbounds i8, i8* %0, i64 %2168
  call void @llvm.memset.p0i8.i64(i8* align 1 %2169, i8 0, i64 16, i1 false)
  br label %2170

2170:                                             ; preds = %2167, %2159
  %2171 = add nuw nsw i64 %2160, 1
  %2172 = call zeroext i8 @randombit()
  %2173 = getelementptr inbounds i8, i8* %1, i64 %2171
  store i8 %2172, i8* %2173, align 1
  %2174 = getelementptr inbounds i8, i8* %1, i64 %2171
  %2175 = load i8, i8* %2174, align 1
  %2176 = zext i8 %2175 to i32
  %2177 = icmp eq i32 %2176, 0
  br i1 %2177, label %2178, label %2181

2178:                                             ; preds = %2170
  %2179 = mul nuw nsw i64 %2171, 16
  %2180 = getelementptr inbounds i8, i8* %0, i64 %2179
  call void @llvm.memset.p0i8.i64(i8* align 1 %2180, i8 0, i64 16, i1 false)
  br label %2181

2181:                                             ; preds = %2178, %2170
  %2182 = add nuw nsw i64 %2171, 1
  %2183 = call zeroext i8 @randombit()
  %2184 = getelementptr inbounds i8, i8* %1, i64 %2182
  store i8 %2183, i8* %2184, align 1
  %2185 = getelementptr inbounds i8, i8* %1, i64 %2182
  %2186 = load i8, i8* %2185, align 1
  %2187 = zext i8 %2186 to i32
  %2188 = icmp eq i32 %2187, 0
  br i1 %2188, label %2189, label %2192

2189:                                             ; preds = %2181
  %2190 = mul nuw nsw i64 %2182, 16
  %2191 = getelementptr inbounds i8, i8* %0, i64 %2190
  call void @llvm.memset.p0i8.i64(i8* align 1 %2191, i8 0, i64 16, i1 false)
  br label %2192

2192:                                             ; preds = %2189, %2181
  %2193 = add nuw nsw i64 %2182, 1
  %2194 = call zeroext i8 @randombit()
  %2195 = getelementptr inbounds i8, i8* %1, i64 %2193
  store i8 %2194, i8* %2195, align 1
  %2196 = getelementptr inbounds i8, i8* %1, i64 %2193
  %2197 = load i8, i8* %2196, align 1
  %2198 = zext i8 %2197 to i32
  %2199 = icmp eq i32 %2198, 0
  br i1 %2199, label %2200, label %2203

2200:                                             ; preds = %2192
  %2201 = mul nuw nsw i64 %2193, 16
  %2202 = getelementptr inbounds i8, i8* %0, i64 %2201
  call void @llvm.memset.p0i8.i64(i8* align 1 %2202, i8 0, i64 16, i1 false)
  br label %2203

2203:                                             ; preds = %2200, %2192
  %2204 = add nuw nsw i64 %2193, 1
  %2205 = call zeroext i8 @randombit()
  %2206 = getelementptr inbounds i8, i8* %1, i64 %2204
  store i8 %2205, i8* %2206, align 1
  %2207 = getelementptr inbounds i8, i8* %1, i64 %2204
  %2208 = load i8, i8* %2207, align 1
  %2209 = zext i8 %2208 to i32
  %2210 = icmp eq i32 %2209, 0
  br i1 %2210, label %2211, label %2214

2211:                                             ; preds = %2203
  %2212 = mul nuw nsw i64 %2204, 16
  %2213 = getelementptr inbounds i8, i8* %0, i64 %2212
  call void @llvm.memset.p0i8.i64(i8* align 1 %2213, i8 0, i64 16, i1 false)
  br label %2214

2214:                                             ; preds = %2211, %2203
  %2215 = add nuw nsw i64 %2204, 1
  %2216 = call zeroext i8 @randombit()
  %2217 = getelementptr inbounds i8, i8* %1, i64 %2215
  store i8 %2216, i8* %2217, align 1
  %2218 = getelementptr inbounds i8, i8* %1, i64 %2215
  %2219 = load i8, i8* %2218, align 1
  %2220 = zext i8 %2219 to i32
  %2221 = icmp eq i32 %2220, 0
  br i1 %2221, label %2222, label %2225

2222:                                             ; preds = %2214
  %2223 = mul nuw nsw i64 %2215, 16
  %2224 = getelementptr inbounds i8, i8* %0, i64 %2223
  call void @llvm.memset.p0i8.i64(i8* align 1 %2224, i8 0, i64 16, i1 false)
  br label %2225

2225:                                             ; preds = %2222, %2214
  %2226 = add nuw nsw i64 %2215, 1
  %2227 = call zeroext i8 @randombit()
  %2228 = getelementptr inbounds i8, i8* %1, i64 %2226
  store i8 %2227, i8* %2228, align 1
  %2229 = getelementptr inbounds i8, i8* %1, i64 %2226
  %2230 = load i8, i8* %2229, align 1
  %2231 = zext i8 %2230 to i32
  %2232 = icmp eq i32 %2231, 0
  br i1 %2232, label %2233, label %2236

2233:                                             ; preds = %2225
  %2234 = mul nuw nsw i64 %2226, 16
  %2235 = getelementptr inbounds i8, i8* %0, i64 %2234
  call void @llvm.memset.p0i8.i64(i8* align 1 %2235, i8 0, i64 16, i1 false)
  br label %2236

2236:                                             ; preds = %2233, %2225
  %2237 = add nuw nsw i64 %2226, 1
  %2238 = call zeroext i8 @randombit()
  %2239 = getelementptr inbounds i8, i8* %1, i64 %2237
  store i8 %2238, i8* %2239, align 1
  %2240 = getelementptr inbounds i8, i8* %1, i64 %2237
  %2241 = load i8, i8* %2240, align 1
  %2242 = zext i8 %2241 to i32
  %2243 = icmp eq i32 %2242, 0
  br i1 %2243, label %2244, label %2247

2244:                                             ; preds = %2236
  %2245 = mul nuw nsw i64 %2237, 16
  %2246 = getelementptr inbounds i8, i8* %0, i64 %2245
  call void @llvm.memset.p0i8.i64(i8* align 1 %2246, i8 0, i64 16, i1 false)
  br label %2247

2247:                                             ; preds = %2244, %2236
  %2248 = add nuw nsw i64 %2237, 1
  %2249 = call zeroext i8 @randombit()
  %2250 = getelementptr inbounds i8, i8* %1, i64 %2248
  store i8 %2249, i8* %2250, align 1
  %2251 = getelementptr inbounds i8, i8* %1, i64 %2248
  %2252 = load i8, i8* %2251, align 1
  %2253 = zext i8 %2252 to i32
  %2254 = icmp eq i32 %2253, 0
  br i1 %2254, label %2255, label %2258

2255:                                             ; preds = %2247
  %2256 = mul nuw nsw i64 %2248, 16
  %2257 = getelementptr inbounds i8, i8* %0, i64 %2256
  call void @llvm.memset.p0i8.i64(i8* align 1 %2257, i8 0, i64 16, i1 false)
  br label %2258

2258:                                             ; preds = %2255, %2247
  %2259 = add nuw nsw i64 %2248, 1
  %2260 = call zeroext i8 @randombit()
  %2261 = getelementptr inbounds i8, i8* %1, i64 %2259
  store i8 %2260, i8* %2261, align 1
  %2262 = getelementptr inbounds i8, i8* %1, i64 %2259
  %2263 = load i8, i8* %2262, align 1
  %2264 = zext i8 %2263 to i32
  %2265 = icmp eq i32 %2264, 0
  br i1 %2265, label %2266, label %2269

2266:                                             ; preds = %2258
  %2267 = mul nuw nsw i64 %2259, 16
  %2268 = getelementptr inbounds i8, i8* %0, i64 %2267
  call void @llvm.memset.p0i8.i64(i8* align 1 %2268, i8 0, i64 16, i1 false)
  br label %2269

2269:                                             ; preds = %2266, %2258
  %2270 = add nuw nsw i64 %2259, 1
  %2271 = call zeroext i8 @randombit()
  %2272 = getelementptr inbounds i8, i8* %1, i64 %2270
  store i8 %2271, i8* %2272, align 1
  %2273 = getelementptr inbounds i8, i8* %1, i64 %2270
  %2274 = load i8, i8* %2273, align 1
  %2275 = zext i8 %2274 to i32
  %2276 = icmp eq i32 %2275, 0
  br i1 %2276, label %2277, label %2280

2277:                                             ; preds = %2269
  %2278 = mul nuw nsw i64 %2270, 16
  %2279 = getelementptr inbounds i8, i8* %0, i64 %2278
  call void @llvm.memset.p0i8.i64(i8* align 1 %2279, i8 0, i64 16, i1 false)
  br label %2280

2280:                                             ; preds = %2277, %2269
  %2281 = add nuw nsw i64 %2270, 1
  %2282 = call zeroext i8 @randombit()
  %2283 = getelementptr inbounds i8, i8* %1, i64 %2281
  store i8 %2282, i8* %2283, align 1
  %2284 = getelementptr inbounds i8, i8* %1, i64 %2281
  %2285 = load i8, i8* %2284, align 1
  %2286 = zext i8 %2285 to i32
  %2287 = icmp eq i32 %2286, 0
  br i1 %2287, label %2288, label %2291

2288:                                             ; preds = %2280
  %2289 = mul nuw nsw i64 %2281, 16
  %2290 = getelementptr inbounds i8, i8* %0, i64 %2289
  call void @llvm.memset.p0i8.i64(i8* align 1 %2290, i8 0, i64 16, i1 false)
  br label %2291

2291:                                             ; preds = %2288, %2280
  %2292 = add nuw nsw i64 %2281, 1
  %2293 = call zeroext i8 @randombit()
  %2294 = getelementptr inbounds i8, i8* %1, i64 %2292
  store i8 %2293, i8* %2294, align 1
  %2295 = getelementptr inbounds i8, i8* %1, i64 %2292
  %2296 = load i8, i8* %2295, align 1
  %2297 = zext i8 %2296 to i32
  %2298 = icmp eq i32 %2297, 0
  br i1 %2298, label %2299, label %2302

2299:                                             ; preds = %2291
  %2300 = mul nuw nsw i64 %2292, 16
  %2301 = getelementptr inbounds i8, i8* %0, i64 %2300
  call void @llvm.memset.p0i8.i64(i8* align 1 %2301, i8 0, i64 16, i1 false)
  br label %2302

2302:                                             ; preds = %2299, %2291
  %2303 = add nuw nsw i64 %2292, 1
  %2304 = call zeroext i8 @randombit()
  %2305 = getelementptr inbounds i8, i8* %1, i64 %2303
  store i8 %2304, i8* %2305, align 1
  %2306 = getelementptr inbounds i8, i8* %1, i64 %2303
  %2307 = load i8, i8* %2306, align 1
  %2308 = zext i8 %2307 to i32
  %2309 = icmp eq i32 %2308, 0
  br i1 %2309, label %2310, label %2313

2310:                                             ; preds = %2302
  %2311 = mul nuw nsw i64 %2303, 16
  %2312 = getelementptr inbounds i8, i8* %0, i64 %2311
  call void @llvm.memset.p0i8.i64(i8* align 1 %2312, i8 0, i64 16, i1 false)
  br label %2313

2313:                                             ; preds = %2310, %2302
  %2314 = add nuw nsw i64 %2303, 1
  %2315 = call zeroext i8 @randombit()
  %2316 = getelementptr inbounds i8, i8* %1, i64 %2314
  store i8 %2315, i8* %2316, align 1
  %2317 = getelementptr inbounds i8, i8* %1, i64 %2314
  %2318 = load i8, i8* %2317, align 1
  %2319 = zext i8 %2318 to i32
  %2320 = icmp eq i32 %2319, 0
  br i1 %2320, label %2321, label %2324

2321:                                             ; preds = %2313
  %2322 = mul nuw nsw i64 %2314, 16
  %2323 = getelementptr inbounds i8, i8* %0, i64 %2322
  call void @llvm.memset.p0i8.i64(i8* align 1 %2323, i8 0, i64 16, i1 false)
  br label %2324

2324:                                             ; preds = %2321, %2313
  %2325 = add nuw nsw i64 %2314, 1
  %2326 = call zeroext i8 @randombit()
  %2327 = getelementptr inbounds i8, i8* %1, i64 %2325
  store i8 %2326, i8* %2327, align 1
  %2328 = getelementptr inbounds i8, i8* %1, i64 %2325
  %2329 = load i8, i8* %2328, align 1
  %2330 = zext i8 %2329 to i32
  %2331 = icmp eq i32 %2330, 0
  br i1 %2331, label %2332, label %2335

2332:                                             ; preds = %2324
  %2333 = mul nuw nsw i64 %2325, 16
  %2334 = getelementptr inbounds i8, i8* %0, i64 %2333
  call void @llvm.memset.p0i8.i64(i8* align 1 %2334, i8 0, i64 16, i1 false)
  br label %2335

2335:                                             ; preds = %2332, %2324
  %2336 = add nuw nsw i64 %2325, 1
  %2337 = call zeroext i8 @randombit()
  %2338 = getelementptr inbounds i8, i8* %1, i64 %2336
  store i8 %2337, i8* %2338, align 1
  %2339 = getelementptr inbounds i8, i8* %1, i64 %2336
  %2340 = load i8, i8* %2339, align 1
  %2341 = zext i8 %2340 to i32
  %2342 = icmp eq i32 %2341, 0
  br i1 %2342, label %2343, label %2346

2343:                                             ; preds = %2335
  %2344 = mul nuw nsw i64 %2336, 16
  %2345 = getelementptr inbounds i8, i8* %0, i64 %2344
  call void @llvm.memset.p0i8.i64(i8* align 1 %2345, i8 0, i64 16, i1 false)
  br label %2346

2346:                                             ; preds = %2343, %2335
  %2347 = add nuw nsw i64 %2336, 1
  %2348 = call zeroext i8 @randombit()
  %2349 = getelementptr inbounds i8, i8* %1, i64 %2347
  store i8 %2348, i8* %2349, align 1
  %2350 = getelementptr inbounds i8, i8* %1, i64 %2347
  %2351 = load i8, i8* %2350, align 1
  %2352 = zext i8 %2351 to i32
  %2353 = icmp eq i32 %2352, 0
  br i1 %2353, label %2354, label %2357

2354:                                             ; preds = %2346
  %2355 = mul nuw nsw i64 %2347, 16
  %2356 = getelementptr inbounds i8, i8* %0, i64 %2355
  call void @llvm.memset.p0i8.i64(i8* align 1 %2356, i8 0, i64 16, i1 false)
  br label %2357

2357:                                             ; preds = %2354, %2346
  %2358 = add nuw nsw i64 %2347, 1
  %2359 = call zeroext i8 @randombit()
  %2360 = getelementptr inbounds i8, i8* %1, i64 %2358
  store i8 %2359, i8* %2360, align 1
  %2361 = getelementptr inbounds i8, i8* %1, i64 %2358
  %2362 = load i8, i8* %2361, align 1
  %2363 = zext i8 %2362 to i32
  %2364 = icmp eq i32 %2363, 0
  br i1 %2364, label %2365, label %2368

2365:                                             ; preds = %2357
  %2366 = mul nuw nsw i64 %2358, 16
  %2367 = getelementptr inbounds i8, i8* %0, i64 %2366
  call void @llvm.memset.p0i8.i64(i8* align 1 %2367, i8 0, i64 16, i1 false)
  br label %2368

2368:                                             ; preds = %2365, %2357
  %2369 = add nuw nsw i64 %2358, 1
  %2370 = call zeroext i8 @randombit()
  %2371 = getelementptr inbounds i8, i8* %1, i64 %2369
  store i8 %2370, i8* %2371, align 1
  %2372 = getelementptr inbounds i8, i8* %1, i64 %2369
  %2373 = load i8, i8* %2372, align 1
  %2374 = zext i8 %2373 to i32
  %2375 = icmp eq i32 %2374, 0
  br i1 %2375, label %2376, label %2379

2376:                                             ; preds = %2368
  %2377 = mul nuw nsw i64 %2369, 16
  %2378 = getelementptr inbounds i8, i8* %0, i64 %2377
  call void @llvm.memset.p0i8.i64(i8* align 1 %2378, i8 0, i64 16, i1 false)
  br label %2379

2379:                                             ; preds = %2376, %2368
  %2380 = add nuw nsw i64 %2369, 1
  %2381 = call zeroext i8 @randombit()
  %2382 = getelementptr inbounds i8, i8* %1, i64 %2380
  store i8 %2381, i8* %2382, align 1
  %2383 = getelementptr inbounds i8, i8* %1, i64 %2380
  %2384 = load i8, i8* %2383, align 1
  %2385 = zext i8 %2384 to i32
  %2386 = icmp eq i32 %2385, 0
  br i1 %2386, label %2387, label %2390

2387:                                             ; preds = %2379
  %2388 = mul nuw nsw i64 %2380, 16
  %2389 = getelementptr inbounds i8, i8* %0, i64 %2388
  call void @llvm.memset.p0i8.i64(i8* align 1 %2389, i8 0, i64 16, i1 false)
  br label %2390

2390:                                             ; preds = %2387, %2379
  %2391 = add nuw nsw i64 %2380, 1
  %2392 = call zeroext i8 @randombit()
  %2393 = getelementptr inbounds i8, i8* %1, i64 %2391
  store i8 %2392, i8* %2393, align 1
  %2394 = getelementptr inbounds i8, i8* %1, i64 %2391
  %2395 = load i8, i8* %2394, align 1
  %2396 = zext i8 %2395 to i32
  %2397 = icmp eq i32 %2396, 0
  br i1 %2397, label %2398, label %2401

2398:                                             ; preds = %2390
  %2399 = mul nuw nsw i64 %2391, 16
  %2400 = getelementptr inbounds i8, i8* %0, i64 %2399
  call void @llvm.memset.p0i8.i64(i8* align 1 %2400, i8 0, i64 16, i1 false)
  br label %2401

2401:                                             ; preds = %2398, %2390
  %2402 = add nuw nsw i64 %2391, 1
  %2403 = call zeroext i8 @randombit()
  %2404 = getelementptr inbounds i8, i8* %1, i64 %2402
  store i8 %2403, i8* %2404, align 1
  %2405 = getelementptr inbounds i8, i8* %1, i64 %2402
  %2406 = load i8, i8* %2405, align 1
  %2407 = zext i8 %2406 to i32
  %2408 = icmp eq i32 %2407, 0
  br i1 %2408, label %2409, label %2412

2409:                                             ; preds = %2401
  %2410 = mul nuw nsw i64 %2402, 16
  %2411 = getelementptr inbounds i8, i8* %0, i64 %2410
  call void @llvm.memset.p0i8.i64(i8* align 1 %2411, i8 0, i64 16, i1 false)
  br label %2412

2412:                                             ; preds = %2409, %2401
  %2413 = add nuw nsw i64 %2402, 1
  %2414 = call zeroext i8 @randombit()
  %2415 = getelementptr inbounds i8, i8* %1, i64 %2413
  store i8 %2414, i8* %2415, align 1
  %2416 = getelementptr inbounds i8, i8* %1, i64 %2413
  %2417 = load i8, i8* %2416, align 1
  %2418 = zext i8 %2417 to i32
  %2419 = icmp eq i32 %2418, 0
  br i1 %2419, label %2420, label %2423

2420:                                             ; preds = %2412
  %2421 = mul nuw nsw i64 %2413, 16
  %2422 = getelementptr inbounds i8, i8* %0, i64 %2421
  call void @llvm.memset.p0i8.i64(i8* align 1 %2422, i8 0, i64 16, i1 false)
  br label %2423

2423:                                             ; preds = %2420, %2412
  %2424 = add nuw nsw i64 %2413, 1
  %2425 = call zeroext i8 @randombit()
  %2426 = getelementptr inbounds i8, i8* %1, i64 %2424
  store i8 %2425, i8* %2426, align 1
  %2427 = getelementptr inbounds i8, i8* %1, i64 %2424
  %2428 = load i8, i8* %2427, align 1
  %2429 = zext i8 %2428 to i32
  %2430 = icmp eq i32 %2429, 0
  br i1 %2430, label %2431, label %2434

2431:                                             ; preds = %2423
  %2432 = mul nuw nsw i64 %2424, 16
  %2433 = getelementptr inbounds i8, i8* %0, i64 %2432
  call void @llvm.memset.p0i8.i64(i8* align 1 %2433, i8 0, i64 16, i1 false)
  br label %2434

2434:                                             ; preds = %2431, %2423
  %2435 = add nuw nsw i64 %2424, 1
  %2436 = call zeroext i8 @randombit()
  %2437 = getelementptr inbounds i8, i8* %1, i64 %2435
  store i8 %2436, i8* %2437, align 1
  %2438 = getelementptr inbounds i8, i8* %1, i64 %2435
  %2439 = load i8, i8* %2438, align 1
  %2440 = zext i8 %2439 to i32
  %2441 = icmp eq i32 %2440, 0
  br i1 %2441, label %2442, label %2445

2442:                                             ; preds = %2434
  %2443 = mul nuw nsw i64 %2435, 16
  %2444 = getelementptr inbounds i8, i8* %0, i64 %2443
  call void @llvm.memset.p0i8.i64(i8* align 1 %2444, i8 0, i64 16, i1 false)
  br label %2445

2445:                                             ; preds = %2442, %2434
  %2446 = add nuw nsw i64 %2435, 1
  %2447 = call zeroext i8 @randombit()
  %2448 = getelementptr inbounds i8, i8* %1, i64 %2446
  store i8 %2447, i8* %2448, align 1
  %2449 = getelementptr inbounds i8, i8* %1, i64 %2446
  %2450 = load i8, i8* %2449, align 1
  %2451 = zext i8 %2450 to i32
  %2452 = icmp eq i32 %2451, 0
  br i1 %2452, label %2453, label %2456

2453:                                             ; preds = %2445
  %2454 = mul nuw nsw i64 %2446, 16
  %2455 = getelementptr inbounds i8, i8* %0, i64 %2454
  call void @llvm.memset.p0i8.i64(i8* align 1 %2455, i8 0, i64 16, i1 false)
  br label %2456

2456:                                             ; preds = %2453, %2445
  %2457 = add nuw nsw i64 %2446, 1
  %2458 = call zeroext i8 @randombit()
  %2459 = getelementptr inbounds i8, i8* %1, i64 %2457
  store i8 %2458, i8* %2459, align 1
  %2460 = getelementptr inbounds i8, i8* %1, i64 %2457
  %2461 = load i8, i8* %2460, align 1
  %2462 = zext i8 %2461 to i32
  %2463 = icmp eq i32 %2462, 0
  br i1 %2463, label %2464, label %2467

2464:                                             ; preds = %2456
  %2465 = mul nuw nsw i64 %2457, 16
  %2466 = getelementptr inbounds i8, i8* %0, i64 %2465
  call void @llvm.memset.p0i8.i64(i8* align 1 %2466, i8 0, i64 16, i1 false)
  br label %2467

2467:                                             ; preds = %2464, %2456
  %2468 = add nuw nsw i64 %2457, 1
  %2469 = call zeroext i8 @randombit()
  %2470 = getelementptr inbounds i8, i8* %1, i64 %2468
  store i8 %2469, i8* %2470, align 1
  %2471 = getelementptr inbounds i8, i8* %1, i64 %2468
  %2472 = load i8, i8* %2471, align 1
  %2473 = zext i8 %2472 to i32
  %2474 = icmp eq i32 %2473, 0
  br i1 %2474, label %2475, label %2478

2475:                                             ; preds = %2467
  %2476 = mul nuw nsw i64 %2468, 16
  %2477 = getelementptr inbounds i8, i8* %0, i64 %2476
  call void @llvm.memset.p0i8.i64(i8* align 1 %2477, i8 0, i64 16, i1 false)
  br label %2478

2478:                                             ; preds = %2475, %2467
  %2479 = add nuw nsw i64 %2468, 1
  %2480 = call zeroext i8 @randombit()
  %2481 = getelementptr inbounds i8, i8* %1, i64 %2479
  store i8 %2480, i8* %2481, align 1
  %2482 = getelementptr inbounds i8, i8* %1, i64 %2479
  %2483 = load i8, i8* %2482, align 1
  %2484 = zext i8 %2483 to i32
  %2485 = icmp eq i32 %2484, 0
  br i1 %2485, label %2486, label %2489

2486:                                             ; preds = %2478
  %2487 = mul nuw nsw i64 %2479, 16
  %2488 = getelementptr inbounds i8, i8* %0, i64 %2487
  call void @llvm.memset.p0i8.i64(i8* align 1 %2488, i8 0, i64 16, i1 false)
  br label %2489

2489:                                             ; preds = %2486, %2478
  %2490 = add nuw nsw i64 %2479, 1
  %2491 = call zeroext i8 @randombit()
  %2492 = getelementptr inbounds i8, i8* %1, i64 %2490
  store i8 %2491, i8* %2492, align 1
  %2493 = getelementptr inbounds i8, i8* %1, i64 %2490
  %2494 = load i8, i8* %2493, align 1
  %2495 = zext i8 %2494 to i32
  %2496 = icmp eq i32 %2495, 0
  br i1 %2496, label %2497, label %2500

2497:                                             ; preds = %2489
  %2498 = mul nuw nsw i64 %2490, 16
  %2499 = getelementptr inbounds i8, i8* %0, i64 %2498
  call void @llvm.memset.p0i8.i64(i8* align 1 %2499, i8 0, i64 16, i1 false)
  br label %2500

2500:                                             ; preds = %2497, %2489
  %2501 = add nuw nsw i64 %2490, 1
  %2502 = call zeroext i8 @randombit()
  %2503 = getelementptr inbounds i8, i8* %1, i64 %2501
  store i8 %2502, i8* %2503, align 1
  %2504 = getelementptr inbounds i8, i8* %1, i64 %2501
  %2505 = load i8, i8* %2504, align 1
  %2506 = zext i8 %2505 to i32
  %2507 = icmp eq i32 %2506, 0
  br i1 %2507, label %2508, label %2511

2508:                                             ; preds = %2500
  %2509 = mul nuw nsw i64 %2501, 16
  %2510 = getelementptr inbounds i8, i8* %0, i64 %2509
  call void @llvm.memset.p0i8.i64(i8* align 1 %2510, i8 0, i64 16, i1 false)
  br label %2511

2511:                                             ; preds = %2508, %2500
  %2512 = add nuw nsw i64 %2501, 1
  %2513 = call zeroext i8 @randombit()
  %2514 = getelementptr inbounds i8, i8* %1, i64 %2512
  store i8 %2513, i8* %2514, align 1
  %2515 = getelementptr inbounds i8, i8* %1, i64 %2512
  %2516 = load i8, i8* %2515, align 1
  %2517 = zext i8 %2516 to i32
  %2518 = icmp eq i32 %2517, 0
  br i1 %2518, label %2519, label %2522

2519:                                             ; preds = %2511
  %2520 = mul nuw nsw i64 %2512, 16
  %2521 = getelementptr inbounds i8, i8* %0, i64 %2520
  call void @llvm.memset.p0i8.i64(i8* align 1 %2521, i8 0, i64 16, i1 false)
  br label %2522

2522:                                             ; preds = %2519, %2511
  %2523 = add nuw nsw i64 %2512, 1
  %2524 = call zeroext i8 @randombit()
  %2525 = getelementptr inbounds i8, i8* %1, i64 %2523
  store i8 %2524, i8* %2525, align 1
  %2526 = getelementptr inbounds i8, i8* %1, i64 %2523
  %2527 = load i8, i8* %2526, align 1
  %2528 = zext i8 %2527 to i32
  %2529 = icmp eq i32 %2528, 0
  br i1 %2529, label %2530, label %2533

2530:                                             ; preds = %2522
  %2531 = mul nuw nsw i64 %2523, 16
  %2532 = getelementptr inbounds i8, i8* %0, i64 %2531
  call void @llvm.memset.p0i8.i64(i8* align 1 %2532, i8 0, i64 16, i1 false)
  br label %2533

2533:                                             ; preds = %2530, %2522
  %2534 = add nuw nsw i64 %2523, 1
  %2535 = call zeroext i8 @randombit()
  %2536 = getelementptr inbounds i8, i8* %1, i64 %2534
  store i8 %2535, i8* %2536, align 1
  %2537 = getelementptr inbounds i8, i8* %1, i64 %2534
  %2538 = load i8, i8* %2537, align 1
  %2539 = zext i8 %2538 to i32
  %2540 = icmp eq i32 %2539, 0
  br i1 %2540, label %2541, label %2544

2541:                                             ; preds = %2533
  %2542 = mul nuw nsw i64 %2534, 16
  %2543 = getelementptr inbounds i8, i8* %0, i64 %2542
  call void @llvm.memset.p0i8.i64(i8* align 1 %2543, i8 0, i64 16, i1 false)
  br label %2544

2544:                                             ; preds = %2541, %2533
  %2545 = add nuw nsw i64 %2534, 1
  %2546 = call zeroext i8 @randombit()
  %2547 = getelementptr inbounds i8, i8* %1, i64 %2545
  store i8 %2546, i8* %2547, align 1
  %2548 = getelementptr inbounds i8, i8* %1, i64 %2545
  %2549 = load i8, i8* %2548, align 1
  %2550 = zext i8 %2549 to i32
  %2551 = icmp eq i32 %2550, 0
  br i1 %2551, label %2552, label %2555

2552:                                             ; preds = %2544
  %2553 = mul nuw nsw i64 %2545, 16
  %2554 = getelementptr inbounds i8, i8* %0, i64 %2553
  call void @llvm.memset.p0i8.i64(i8* align 1 %2554, i8 0, i64 16, i1 false)
  br label %2555

2555:                                             ; preds = %2552, %2544
  %2556 = add nuw nsw i64 %2545, 1
  %2557 = call zeroext i8 @randombit()
  %2558 = getelementptr inbounds i8, i8* %1, i64 %2556
  store i8 %2557, i8* %2558, align 1
  %2559 = getelementptr inbounds i8, i8* %1, i64 %2556
  %2560 = load i8, i8* %2559, align 1
  %2561 = zext i8 %2560 to i32
  %2562 = icmp eq i32 %2561, 0
  br i1 %2562, label %2563, label %2566

2563:                                             ; preds = %2555
  %2564 = mul nuw nsw i64 %2556, 16
  %2565 = getelementptr inbounds i8, i8* %0, i64 %2564
  call void @llvm.memset.p0i8.i64(i8* align 1 %2565, i8 0, i64 16, i1 false)
  br label %2566

2566:                                             ; preds = %2563, %2555
  %2567 = add nuw nsw i64 %2556, 1
  %2568 = call zeroext i8 @randombit()
  %2569 = getelementptr inbounds i8, i8* %1, i64 %2567
  store i8 %2568, i8* %2569, align 1
  %2570 = getelementptr inbounds i8, i8* %1, i64 %2567
  %2571 = load i8, i8* %2570, align 1
  %2572 = zext i8 %2571 to i32
  %2573 = icmp eq i32 %2572, 0
  br i1 %2573, label %2574, label %2577

2574:                                             ; preds = %2566
  %2575 = mul nuw nsw i64 %2567, 16
  %2576 = getelementptr inbounds i8, i8* %0, i64 %2575
  call void @llvm.memset.p0i8.i64(i8* align 1 %2576, i8 0, i64 16, i1 false)
  br label %2577

2577:                                             ; preds = %2574, %2566
  %2578 = add nuw nsw i64 %2567, 1
  %2579 = call zeroext i8 @randombit()
  %2580 = getelementptr inbounds i8, i8* %1, i64 %2578
  store i8 %2579, i8* %2580, align 1
  %2581 = getelementptr inbounds i8, i8* %1, i64 %2578
  %2582 = load i8, i8* %2581, align 1
  %2583 = zext i8 %2582 to i32
  %2584 = icmp eq i32 %2583, 0
  br i1 %2584, label %2585, label %2588

2585:                                             ; preds = %2577
  %2586 = mul nuw nsw i64 %2578, 16
  %2587 = getelementptr inbounds i8, i8* %0, i64 %2586
  call void @llvm.memset.p0i8.i64(i8* align 1 %2587, i8 0, i64 16, i1 false)
  br label %2588

2588:                                             ; preds = %2585, %2577
  %2589 = add nuw nsw i64 %2578, 1
  %2590 = call zeroext i8 @randombit()
  %2591 = getelementptr inbounds i8, i8* %1, i64 %2589
  store i8 %2590, i8* %2591, align 1
  %2592 = getelementptr inbounds i8, i8* %1, i64 %2589
  %2593 = load i8, i8* %2592, align 1
  %2594 = zext i8 %2593 to i32
  %2595 = icmp eq i32 %2594, 0
  br i1 %2595, label %2596, label %2599

2596:                                             ; preds = %2588
  %2597 = mul nuw nsw i64 %2589, 16
  %2598 = getelementptr inbounds i8, i8* %0, i64 %2597
  call void @llvm.memset.p0i8.i64(i8* align 1 %2598, i8 0, i64 16, i1 false)
  br label %2599

2599:                                             ; preds = %2596, %2588
  %2600 = add nuw nsw i64 %2589, 1
  %2601 = call zeroext i8 @randombit()
  %2602 = getelementptr inbounds i8, i8* %1, i64 %2600
  store i8 %2601, i8* %2602, align 1
  %2603 = getelementptr inbounds i8, i8* %1, i64 %2600
  %2604 = load i8, i8* %2603, align 1
  %2605 = zext i8 %2604 to i32
  %2606 = icmp eq i32 %2605, 0
  br i1 %2606, label %2607, label %2610

2607:                                             ; preds = %2599
  %2608 = mul nuw nsw i64 %2600, 16
  %2609 = getelementptr inbounds i8, i8* %0, i64 %2608
  call void @llvm.memset.p0i8.i64(i8* align 1 %2609, i8 0, i64 16, i1 false)
  br label %2610

2610:                                             ; preds = %2607, %2599
  %2611 = add nuw nsw i64 %2600, 1
  %2612 = call zeroext i8 @randombit()
  %2613 = getelementptr inbounds i8, i8* %1, i64 %2611
  store i8 %2612, i8* %2613, align 1
  %2614 = getelementptr inbounds i8, i8* %1, i64 %2611
  %2615 = load i8, i8* %2614, align 1
  %2616 = zext i8 %2615 to i32
  %2617 = icmp eq i32 %2616, 0
  br i1 %2617, label %2618, label %2621

2618:                                             ; preds = %2610
  %2619 = mul nuw nsw i64 %2611, 16
  %2620 = getelementptr inbounds i8, i8* %0, i64 %2619
  call void @llvm.memset.p0i8.i64(i8* align 1 %2620, i8 0, i64 16, i1 false)
  br label %2621

2621:                                             ; preds = %2618, %2610
  %2622 = add nuw nsw i64 %2611, 1
  %2623 = call zeroext i8 @randombit()
  %2624 = getelementptr inbounds i8, i8* %1, i64 %2622
  store i8 %2623, i8* %2624, align 1
  %2625 = getelementptr inbounds i8, i8* %1, i64 %2622
  %2626 = load i8, i8* %2625, align 1
  %2627 = zext i8 %2626 to i32
  %2628 = icmp eq i32 %2627, 0
  br i1 %2628, label %2629, label %2632

2629:                                             ; preds = %2621
  %2630 = mul nuw nsw i64 %2622, 16
  %2631 = getelementptr inbounds i8, i8* %0, i64 %2630
  call void @llvm.memset.p0i8.i64(i8* align 1 %2631, i8 0, i64 16, i1 false)
  br label %2632

2632:                                             ; preds = %2629, %2621
  %2633 = add nuw nsw i64 %2622, 1
  %2634 = call zeroext i8 @randombit()
  %2635 = getelementptr inbounds i8, i8* %1, i64 %2633
  store i8 %2634, i8* %2635, align 1
  %2636 = getelementptr inbounds i8, i8* %1, i64 %2633
  %2637 = load i8, i8* %2636, align 1
  %2638 = zext i8 %2637 to i32
  %2639 = icmp eq i32 %2638, 0
  br i1 %2639, label %2640, label %2643

2640:                                             ; preds = %2632
  %2641 = mul nuw nsw i64 %2633, 16
  %2642 = getelementptr inbounds i8, i8* %0, i64 %2641
  call void @llvm.memset.p0i8.i64(i8* align 1 %2642, i8 0, i64 16, i1 false)
  br label %2643

2643:                                             ; preds = %2640, %2632
  %2644 = add nuw nsw i64 %2633, 1
  %2645 = call zeroext i8 @randombit()
  %2646 = getelementptr inbounds i8, i8* %1, i64 %2644
  store i8 %2645, i8* %2646, align 1
  %2647 = getelementptr inbounds i8, i8* %1, i64 %2644
  %2648 = load i8, i8* %2647, align 1
  %2649 = zext i8 %2648 to i32
  %2650 = icmp eq i32 %2649, 0
  br i1 %2650, label %2651, label %2654

2651:                                             ; preds = %2643
  %2652 = mul nuw nsw i64 %2644, 16
  %2653 = getelementptr inbounds i8, i8* %0, i64 %2652
  call void @llvm.memset.p0i8.i64(i8* align 1 %2653, i8 0, i64 16, i1 false)
  br label %2654

2654:                                             ; preds = %2651, %2643
  %2655 = add nuw nsw i64 %2644, 1
  %2656 = call zeroext i8 @randombit()
  %2657 = getelementptr inbounds i8, i8* %1, i64 %2655
  store i8 %2656, i8* %2657, align 1
  %2658 = getelementptr inbounds i8, i8* %1, i64 %2655
  %2659 = load i8, i8* %2658, align 1
  %2660 = zext i8 %2659 to i32
  %2661 = icmp eq i32 %2660, 0
  br i1 %2661, label %2662, label %2665

2662:                                             ; preds = %2654
  %2663 = mul nuw nsw i64 %2655, 16
  %2664 = getelementptr inbounds i8, i8* %0, i64 %2663
  call void @llvm.memset.p0i8.i64(i8* align 1 %2664, i8 0, i64 16, i1 false)
  br label %2665

2665:                                             ; preds = %2662, %2654
  %2666 = add nuw nsw i64 %2655, 1
  %2667 = call zeroext i8 @randombit()
  %2668 = getelementptr inbounds i8, i8* %1, i64 %2666
  store i8 %2667, i8* %2668, align 1
  %2669 = getelementptr inbounds i8, i8* %1, i64 %2666
  %2670 = load i8, i8* %2669, align 1
  %2671 = zext i8 %2670 to i32
  %2672 = icmp eq i32 %2671, 0
  br i1 %2672, label %2673, label %2676

2673:                                             ; preds = %2665
  %2674 = mul nuw nsw i64 %2666, 16
  %2675 = getelementptr inbounds i8, i8* %0, i64 %2674
  call void @llvm.memset.p0i8.i64(i8* align 1 %2675, i8 0, i64 16, i1 false)
  br label %2676

2676:                                             ; preds = %2673, %2665
  %2677 = add nuw nsw i64 %2666, 1
  %2678 = call zeroext i8 @randombit()
  %2679 = getelementptr inbounds i8, i8* %1, i64 %2677
  store i8 %2678, i8* %2679, align 1
  %2680 = getelementptr inbounds i8, i8* %1, i64 %2677
  %2681 = load i8, i8* %2680, align 1
  %2682 = zext i8 %2681 to i32
  %2683 = icmp eq i32 %2682, 0
  br i1 %2683, label %2684, label %2687

2684:                                             ; preds = %2676
  %2685 = mul nuw nsw i64 %2677, 16
  %2686 = getelementptr inbounds i8, i8* %0, i64 %2685
  call void @llvm.memset.p0i8.i64(i8* align 1 %2686, i8 0, i64 16, i1 false)
  br label %2687

2687:                                             ; preds = %2684, %2676
  %2688 = add nuw nsw i64 %2677, 1
  %2689 = call zeroext i8 @randombit()
  %2690 = getelementptr inbounds i8, i8* %1, i64 %2688
  store i8 %2689, i8* %2690, align 1
  %2691 = getelementptr inbounds i8, i8* %1, i64 %2688
  %2692 = load i8, i8* %2691, align 1
  %2693 = zext i8 %2692 to i32
  %2694 = icmp eq i32 %2693, 0
  br i1 %2694, label %2695, label %2698

2695:                                             ; preds = %2687
  %2696 = mul nuw nsw i64 %2688, 16
  %2697 = getelementptr inbounds i8, i8* %0, i64 %2696
  call void @llvm.memset.p0i8.i64(i8* align 1 %2697, i8 0, i64 16, i1 false)
  br label %2698

2698:                                             ; preds = %2695, %2687
  %2699 = add nuw nsw i64 %2688, 1
  %2700 = call zeroext i8 @randombit()
  %2701 = getelementptr inbounds i8, i8* %1, i64 %2699
  store i8 %2700, i8* %2701, align 1
  %2702 = getelementptr inbounds i8, i8* %1, i64 %2699
  %2703 = load i8, i8* %2702, align 1
  %2704 = zext i8 %2703 to i32
  %2705 = icmp eq i32 %2704, 0
  br i1 %2705, label %2706, label %2709

2706:                                             ; preds = %2698
  %2707 = mul nuw nsw i64 %2699, 16
  %2708 = getelementptr inbounds i8, i8* %0, i64 %2707
  call void @llvm.memset.p0i8.i64(i8* align 1 %2708, i8 0, i64 16, i1 false)
  br label %2709

2709:                                             ; preds = %2706, %2698
  %2710 = add nuw nsw i64 %2699, 1
  %2711 = call zeroext i8 @randombit()
  %2712 = getelementptr inbounds i8, i8* %1, i64 %2710
  store i8 %2711, i8* %2712, align 1
  %2713 = getelementptr inbounds i8, i8* %1, i64 %2710
  %2714 = load i8, i8* %2713, align 1
  %2715 = zext i8 %2714 to i32
  %2716 = icmp eq i32 %2715, 0
  br i1 %2716, label %2717, label %2720

2717:                                             ; preds = %2709
  %2718 = mul nuw nsw i64 %2710, 16
  %2719 = getelementptr inbounds i8, i8* %0, i64 %2718
  call void @llvm.memset.p0i8.i64(i8* align 1 %2719, i8 0, i64 16, i1 false)
  br label %2720

2720:                                             ; preds = %2717, %2709
  %2721 = add nuw nsw i64 %2710, 1
  %2722 = call zeroext i8 @randombit()
  %2723 = getelementptr inbounds i8, i8* %1, i64 %2721
  store i8 %2722, i8* %2723, align 1
  %2724 = getelementptr inbounds i8, i8* %1, i64 %2721
  %2725 = load i8, i8* %2724, align 1
  %2726 = zext i8 %2725 to i32
  %2727 = icmp eq i32 %2726, 0
  br i1 %2727, label %2728, label %2731

2728:                                             ; preds = %2720
  %2729 = mul nuw nsw i64 %2721, 16
  %2730 = getelementptr inbounds i8, i8* %0, i64 %2729
  call void @llvm.memset.p0i8.i64(i8* align 1 %2730, i8 0, i64 16, i1 false)
  br label %2731

2731:                                             ; preds = %2728, %2720
  %2732 = add nuw nsw i64 %2721, 1
  %2733 = call zeroext i8 @randombit()
  %2734 = getelementptr inbounds i8, i8* %1, i64 %2732
  store i8 %2733, i8* %2734, align 1
  %2735 = getelementptr inbounds i8, i8* %1, i64 %2732
  %2736 = load i8, i8* %2735, align 1
  %2737 = zext i8 %2736 to i32
  %2738 = icmp eq i32 %2737, 0
  br i1 %2738, label %2739, label %2742

2739:                                             ; preds = %2731
  %2740 = mul nuw nsw i64 %2732, 16
  %2741 = getelementptr inbounds i8, i8* %0, i64 %2740
  call void @llvm.memset.p0i8.i64(i8* align 1 %2741, i8 0, i64 16, i1 false)
  br label %2742

2742:                                             ; preds = %2739, %2731
  %2743 = add nuw nsw i64 %2732, 1
  %2744 = call zeroext i8 @randombit()
  %2745 = getelementptr inbounds i8, i8* %1, i64 %2743
  store i8 %2744, i8* %2745, align 1
  %2746 = getelementptr inbounds i8, i8* %1, i64 %2743
  %2747 = load i8, i8* %2746, align 1
  %2748 = zext i8 %2747 to i32
  %2749 = icmp eq i32 %2748, 0
  br i1 %2749, label %2750, label %2753

2750:                                             ; preds = %2742
  %2751 = mul nuw nsw i64 %2743, 16
  %2752 = getelementptr inbounds i8, i8* %0, i64 %2751
  call void @llvm.memset.p0i8.i64(i8* align 1 %2752, i8 0, i64 16, i1 false)
  br label %2753

2753:                                             ; preds = %2750, %2742
  %2754 = add nuw nsw i64 %2743, 1
  %2755 = call zeroext i8 @randombit()
  %2756 = getelementptr inbounds i8, i8* %1, i64 %2754
  store i8 %2755, i8* %2756, align 1
  %2757 = getelementptr inbounds i8, i8* %1, i64 %2754
  %2758 = load i8, i8* %2757, align 1
  %2759 = zext i8 %2758 to i32
  %2760 = icmp eq i32 %2759, 0
  br i1 %2760, label %2761, label %2764

2761:                                             ; preds = %2753
  %2762 = mul nuw nsw i64 %2754, 16
  %2763 = getelementptr inbounds i8, i8* %0, i64 %2762
  call void @llvm.memset.p0i8.i64(i8* align 1 %2763, i8 0, i64 16, i1 false)
  br label %2764

2764:                                             ; preds = %2761, %2753
  %2765 = add nuw nsw i64 %2754, 1
  %2766 = call zeroext i8 @randombit()
  %2767 = getelementptr inbounds i8, i8* %1, i64 %2765
  store i8 %2766, i8* %2767, align 1
  %2768 = getelementptr inbounds i8, i8* %1, i64 %2765
  %2769 = load i8, i8* %2768, align 1
  %2770 = zext i8 %2769 to i32
  %2771 = icmp eq i32 %2770, 0
  br i1 %2771, label %2772, label %2775

2772:                                             ; preds = %2764
  %2773 = mul nuw nsw i64 %2765, 16
  %2774 = getelementptr inbounds i8, i8* %0, i64 %2773
  call void @llvm.memset.p0i8.i64(i8* align 1 %2774, i8 0, i64 16, i1 false)
  br label %2775

2775:                                             ; preds = %2772, %2764
  %2776 = add nuw nsw i64 %2765, 1
  %2777 = call zeroext i8 @randombit()
  %2778 = getelementptr inbounds i8, i8* %1, i64 %2776
  store i8 %2777, i8* %2778, align 1
  %2779 = getelementptr inbounds i8, i8* %1, i64 %2776
  %2780 = load i8, i8* %2779, align 1
  %2781 = zext i8 %2780 to i32
  %2782 = icmp eq i32 %2781, 0
  br i1 %2782, label %2783, label %2786

2783:                                             ; preds = %2775
  %2784 = mul nuw nsw i64 %2776, 16
  %2785 = getelementptr inbounds i8, i8* %0, i64 %2784
  call void @llvm.memset.p0i8.i64(i8* align 1 %2785, i8 0, i64 16, i1 false)
  br label %2786

2786:                                             ; preds = %2783, %2775
  %2787 = add nuw nsw i64 %2776, 1
  %2788 = call zeroext i8 @randombit()
  %2789 = getelementptr inbounds i8, i8* %1, i64 %2787
  store i8 %2788, i8* %2789, align 1
  %2790 = getelementptr inbounds i8, i8* %1, i64 %2787
  %2791 = load i8, i8* %2790, align 1
  %2792 = zext i8 %2791 to i32
  %2793 = icmp eq i32 %2792, 0
  br i1 %2793, label %2794, label %2797

2794:                                             ; preds = %2786
  %2795 = mul nuw nsw i64 %2787, 16
  %2796 = getelementptr inbounds i8, i8* %0, i64 %2795
  call void @llvm.memset.p0i8.i64(i8* align 1 %2796, i8 0, i64 16, i1 false)
  br label %2797

2797:                                             ; preds = %2794, %2786
  %2798 = add nuw nsw i64 %2787, 1
  %2799 = call zeroext i8 @randombit()
  %2800 = getelementptr inbounds i8, i8* %1, i64 %2798
  store i8 %2799, i8* %2800, align 1
  %2801 = getelementptr inbounds i8, i8* %1, i64 %2798
  %2802 = load i8, i8* %2801, align 1
  %2803 = zext i8 %2802 to i32
  %2804 = icmp eq i32 %2803, 0
  br i1 %2804, label %2805, label %2808

2805:                                             ; preds = %2797
  %2806 = mul nuw nsw i64 %2798, 16
  %2807 = getelementptr inbounds i8, i8* %0, i64 %2806
  call void @llvm.memset.p0i8.i64(i8* align 1 %2807, i8 0, i64 16, i1 false)
  br label %2808

2808:                                             ; preds = %2805, %2797
  %2809 = add nuw nsw i64 %2798, 1
  %2810 = call zeroext i8 @randombit()
  %2811 = getelementptr inbounds i8, i8* %1, i64 %2809
  store i8 %2810, i8* %2811, align 1
  %2812 = getelementptr inbounds i8, i8* %1, i64 %2809
  %2813 = load i8, i8* %2812, align 1
  %2814 = zext i8 %2813 to i32
  %2815 = icmp eq i32 %2814, 0
  br i1 %2815, label %2816, label %2819

2816:                                             ; preds = %2808
  %2817 = mul nuw nsw i64 %2809, 16
  %2818 = getelementptr inbounds i8, i8* %0, i64 %2817
  call void @llvm.memset.p0i8.i64(i8* align 1 %2818, i8 0, i64 16, i1 false)
  br label %2819

2819:                                             ; preds = %2816, %2808
  %2820 = add nuw nsw i64 %2809, 1
  %2821 = call zeroext i8 @randombit()
  %2822 = getelementptr inbounds i8, i8* %1, i64 %2820
  store i8 %2821, i8* %2822, align 1
  %2823 = getelementptr inbounds i8, i8* %1, i64 %2820
  %2824 = load i8, i8* %2823, align 1
  %2825 = zext i8 %2824 to i32
  %2826 = icmp eq i32 %2825, 0
  br i1 %2826, label %2827, label %2830

2827:                                             ; preds = %2819
  %2828 = mul nuw nsw i64 %2820, 16
  %2829 = getelementptr inbounds i8, i8* %0, i64 %2828
  call void @llvm.memset.p0i8.i64(i8* align 1 %2829, i8 0, i64 16, i1 false)
  br label %2830

2830:                                             ; preds = %2827, %2819
  %2831 = add nuw nsw i64 %2820, 1
  %2832 = call zeroext i8 @randombit()
  %2833 = getelementptr inbounds i8, i8* %1, i64 %2831
  store i8 %2832, i8* %2833, align 1
  %2834 = getelementptr inbounds i8, i8* %1, i64 %2831
  %2835 = load i8, i8* %2834, align 1
  %2836 = zext i8 %2835 to i32
  %2837 = icmp eq i32 %2836, 0
  br i1 %2837, label %2838, label %2841

2838:                                             ; preds = %2830
  %2839 = mul nuw nsw i64 %2831, 16
  %2840 = getelementptr inbounds i8, i8* %0, i64 %2839
  call void @llvm.memset.p0i8.i64(i8* align 1 %2840, i8 0, i64 16, i1 false)
  br label %2841

2841:                                             ; preds = %2838, %2830
  %2842 = add nuw nsw i64 %2831, 1
  %2843 = call zeroext i8 @randombit()
  %2844 = getelementptr inbounds i8, i8* %1, i64 %2842
  store i8 %2843, i8* %2844, align 1
  %2845 = getelementptr inbounds i8, i8* %1, i64 %2842
  %2846 = load i8, i8* %2845, align 1
  %2847 = zext i8 %2846 to i32
  %2848 = icmp eq i32 %2847, 0
  br i1 %2848, label %2849, label %2852

2849:                                             ; preds = %2841
  %2850 = mul nuw nsw i64 %2842, 16
  %2851 = getelementptr inbounds i8, i8* %0, i64 %2850
  call void @llvm.memset.p0i8.i64(i8* align 1 %2851, i8 0, i64 16, i1 false)
  br label %2852

2852:                                             ; preds = %2849, %2841
  %2853 = add nuw nsw i64 %2842, 1
  %2854 = call zeroext i8 @randombit()
  %2855 = getelementptr inbounds i8, i8* %1, i64 %2853
  store i8 %2854, i8* %2855, align 1
  %2856 = getelementptr inbounds i8, i8* %1, i64 %2853
  %2857 = load i8, i8* %2856, align 1
  %2858 = zext i8 %2857 to i32
  %2859 = icmp eq i32 %2858, 0
  br i1 %2859, label %2860, label %2863

2860:                                             ; preds = %2852
  %2861 = mul nuw nsw i64 %2853, 16
  %2862 = getelementptr inbounds i8, i8* %0, i64 %2861
  call void @llvm.memset.p0i8.i64(i8* align 1 %2862, i8 0, i64 16, i1 false)
  br label %2863

2863:                                             ; preds = %2860, %2852
  %2864 = add nuw nsw i64 %2853, 1
  %2865 = call zeroext i8 @randombit()
  %2866 = getelementptr inbounds i8, i8* %1, i64 %2864
  store i8 %2865, i8* %2866, align 1
  %2867 = getelementptr inbounds i8, i8* %1, i64 %2864
  %2868 = load i8, i8* %2867, align 1
  %2869 = zext i8 %2868 to i32
  %2870 = icmp eq i32 %2869, 0
  br i1 %2870, label %2871, label %2874

2871:                                             ; preds = %2863
  %2872 = mul nuw nsw i64 %2864, 16
  %2873 = getelementptr inbounds i8, i8* %0, i64 %2872
  call void @llvm.memset.p0i8.i64(i8* align 1 %2873, i8 0, i64 16, i1 false)
  br label %2874

2874:                                             ; preds = %2871, %2863
  %2875 = add nuw nsw i64 %2864, 1
  %2876 = call zeroext i8 @randombit()
  %2877 = getelementptr inbounds i8, i8* %1, i64 %2875
  store i8 %2876, i8* %2877, align 1
  %2878 = getelementptr inbounds i8, i8* %1, i64 %2875
  %2879 = load i8, i8* %2878, align 1
  %2880 = zext i8 %2879 to i32
  %2881 = icmp eq i32 %2880, 0
  br i1 %2881, label %2882, label %2885

2882:                                             ; preds = %2874
  %2883 = mul nuw nsw i64 %2875, 16
  %2884 = getelementptr inbounds i8, i8* %0, i64 %2883
  call void @llvm.memset.p0i8.i64(i8* align 1 %2884, i8 0, i64 16, i1 false)
  br label %2885

2885:                                             ; preds = %2882, %2874
  %2886 = add nuw nsw i64 %2875, 1
  %2887 = call zeroext i8 @randombit()
  %2888 = getelementptr inbounds i8, i8* %1, i64 %2886
  store i8 %2887, i8* %2888, align 1
  %2889 = getelementptr inbounds i8, i8* %1, i64 %2886
  %2890 = load i8, i8* %2889, align 1
  %2891 = zext i8 %2890 to i32
  %2892 = icmp eq i32 %2891, 0
  br i1 %2892, label %2893, label %2896

2893:                                             ; preds = %2885
  %2894 = mul nuw nsw i64 %2886, 16
  %2895 = getelementptr inbounds i8, i8* %0, i64 %2894
  call void @llvm.memset.p0i8.i64(i8* align 1 %2895, i8 0, i64 16, i1 false)
  br label %2896

2896:                                             ; preds = %2893, %2885
  %2897 = add nuw nsw i64 %2886, 1
  %2898 = call zeroext i8 @randombit()
  %2899 = getelementptr inbounds i8, i8* %1, i64 %2897
  store i8 %2898, i8* %2899, align 1
  %2900 = getelementptr inbounds i8, i8* %1, i64 %2897
  %2901 = load i8, i8* %2900, align 1
  %2902 = zext i8 %2901 to i32
  %2903 = icmp eq i32 %2902, 0
  br i1 %2903, label %2904, label %2907

2904:                                             ; preds = %2896
  %2905 = mul nuw nsw i64 %2897, 16
  %2906 = getelementptr inbounds i8, i8* %0, i64 %2905
  call void @llvm.memset.p0i8.i64(i8* align 1 %2906, i8 0, i64 16, i1 false)
  br label %2907

2907:                                             ; preds = %2904, %2896
  %2908 = add nuw nsw i64 %2897, 1
  %2909 = call zeroext i8 @randombit()
  %2910 = getelementptr inbounds i8, i8* %1, i64 %2908
  store i8 %2909, i8* %2910, align 1
  %2911 = getelementptr inbounds i8, i8* %1, i64 %2908
  %2912 = load i8, i8* %2911, align 1
  %2913 = zext i8 %2912 to i32
  %2914 = icmp eq i32 %2913, 0
  br i1 %2914, label %2915, label %2918

2915:                                             ; preds = %2907
  %2916 = mul nuw nsw i64 %2908, 16
  %2917 = getelementptr inbounds i8, i8* %0, i64 %2916
  call void @llvm.memset.p0i8.i64(i8* align 1 %2917, i8 0, i64 16, i1 false)
  br label %2918

2918:                                             ; preds = %2915, %2907
  %2919 = add nuw nsw i64 %2908, 1
  %2920 = call zeroext i8 @randombit()
  %2921 = getelementptr inbounds i8, i8* %1, i64 %2919
  store i8 %2920, i8* %2921, align 1
  %2922 = getelementptr inbounds i8, i8* %1, i64 %2919
  %2923 = load i8, i8* %2922, align 1
  %2924 = zext i8 %2923 to i32
  %2925 = icmp eq i32 %2924, 0
  br i1 %2925, label %2926, label %2929

2926:                                             ; preds = %2918
  %2927 = mul nuw nsw i64 %2919, 16
  %2928 = getelementptr inbounds i8, i8* %0, i64 %2927
  call void @llvm.memset.p0i8.i64(i8* align 1 %2928, i8 0, i64 16, i1 false)
  br label %2929

2929:                                             ; preds = %2926, %2918
  %2930 = add nuw nsw i64 %2919, 1
  %2931 = call zeroext i8 @randombit()
  %2932 = getelementptr inbounds i8, i8* %1, i64 %2930
  store i8 %2931, i8* %2932, align 1
  %2933 = getelementptr inbounds i8, i8* %1, i64 %2930
  %2934 = load i8, i8* %2933, align 1
  %2935 = zext i8 %2934 to i32
  %2936 = icmp eq i32 %2935, 0
  br i1 %2936, label %2937, label %2940

2937:                                             ; preds = %2929
  %2938 = mul nuw nsw i64 %2930, 16
  %2939 = getelementptr inbounds i8, i8* %0, i64 %2938
  call void @llvm.memset.p0i8.i64(i8* align 1 %2939, i8 0, i64 16, i1 false)
  br label %2940

2940:                                             ; preds = %2937, %2929
  %2941 = add nuw nsw i64 %2930, 1
  %2942 = call zeroext i8 @randombit()
  %2943 = getelementptr inbounds i8, i8* %1, i64 %2941
  store i8 %2942, i8* %2943, align 1
  %2944 = getelementptr inbounds i8, i8* %1, i64 %2941
  %2945 = load i8, i8* %2944, align 1
  %2946 = zext i8 %2945 to i32
  %2947 = icmp eq i32 %2946, 0
  br i1 %2947, label %2948, label %2951

2948:                                             ; preds = %2940
  %2949 = mul nuw nsw i64 %2941, 16
  %2950 = getelementptr inbounds i8, i8* %0, i64 %2949
  call void @llvm.memset.p0i8.i64(i8* align 1 %2950, i8 0, i64 16, i1 false)
  br label %2951

2951:                                             ; preds = %2948, %2940
  %2952 = add nuw nsw i64 %2941, 1
  %2953 = call zeroext i8 @randombit()
  %2954 = getelementptr inbounds i8, i8* %1, i64 %2952
  store i8 %2953, i8* %2954, align 1
  %2955 = getelementptr inbounds i8, i8* %1, i64 %2952
  %2956 = load i8, i8* %2955, align 1
  %2957 = zext i8 %2956 to i32
  %2958 = icmp eq i32 %2957, 0
  br i1 %2958, label %2959, label %2962

2959:                                             ; preds = %2951
  %2960 = mul nuw nsw i64 %2952, 16
  %2961 = getelementptr inbounds i8, i8* %0, i64 %2960
  call void @llvm.memset.p0i8.i64(i8* align 1 %2961, i8 0, i64 16, i1 false)
  br label %2962

2962:                                             ; preds = %2959, %2951
  %2963 = add nuw nsw i64 %2952, 1
  %2964 = call zeroext i8 @randombit()
  %2965 = getelementptr inbounds i8, i8* %1, i64 %2963
  store i8 %2964, i8* %2965, align 1
  %2966 = getelementptr inbounds i8, i8* %1, i64 %2963
  %2967 = load i8, i8* %2966, align 1
  %2968 = zext i8 %2967 to i32
  %2969 = icmp eq i32 %2968, 0
  br i1 %2969, label %2970, label %2973

2970:                                             ; preds = %2962
  %2971 = mul nuw nsw i64 %2963, 16
  %2972 = getelementptr inbounds i8, i8* %0, i64 %2971
  call void @llvm.memset.p0i8.i64(i8* align 1 %2972, i8 0, i64 16, i1 false)
  br label %2973

2973:                                             ; preds = %2970, %2962
  %2974 = add nuw nsw i64 %2963, 1
  %2975 = call zeroext i8 @randombit()
  %2976 = getelementptr inbounds i8, i8* %1, i64 %2974
  store i8 %2975, i8* %2976, align 1
  %2977 = getelementptr inbounds i8, i8* %1, i64 %2974
  %2978 = load i8, i8* %2977, align 1
  %2979 = zext i8 %2978 to i32
  %2980 = icmp eq i32 %2979, 0
  br i1 %2980, label %2981, label %2984

2981:                                             ; preds = %2973
  %2982 = mul nuw nsw i64 %2974, 16
  %2983 = getelementptr inbounds i8, i8* %0, i64 %2982
  call void @llvm.memset.p0i8.i64(i8* align 1 %2983, i8 0, i64 16, i1 false)
  br label %2984

2984:                                             ; preds = %2981, %2973
  %2985 = add nuw nsw i64 %2974, 1
  %2986 = call zeroext i8 @randombit()
  %2987 = getelementptr inbounds i8, i8* %1, i64 %2985
  store i8 %2986, i8* %2987, align 1
  %2988 = getelementptr inbounds i8, i8* %1, i64 %2985
  %2989 = load i8, i8* %2988, align 1
  %2990 = zext i8 %2989 to i32
  %2991 = icmp eq i32 %2990, 0
  br i1 %2991, label %2992, label %2995

2992:                                             ; preds = %2984
  %2993 = mul nuw nsw i64 %2985, 16
  %2994 = getelementptr inbounds i8, i8* %0, i64 %2993
  call void @llvm.memset.p0i8.i64(i8* align 1 %2994, i8 0, i64 16, i1 false)
  br label %2995

2995:                                             ; preds = %2992, %2984
  %2996 = add nuw nsw i64 %2985, 1
  %2997 = call zeroext i8 @randombit()
  %2998 = getelementptr inbounds i8, i8* %1, i64 %2996
  store i8 %2997, i8* %2998, align 1
  %2999 = getelementptr inbounds i8, i8* %1, i64 %2996
  %3000 = load i8, i8* %2999, align 1
  %3001 = zext i8 %3000 to i32
  %3002 = icmp eq i32 %3001, 0
  br i1 %3002, label %3003, label %3006

3003:                                             ; preds = %2995
  %3004 = mul nuw nsw i64 %2996, 16
  %3005 = getelementptr inbounds i8, i8* %0, i64 %3004
  call void @llvm.memset.p0i8.i64(i8* align 1 %3005, i8 0, i64 16, i1 false)
  br label %3006

3006:                                             ; preds = %3003, %2995
  %3007 = add nuw nsw i64 %2996, 1
  %3008 = call zeroext i8 @randombit()
  %3009 = getelementptr inbounds i8, i8* %1, i64 %3007
  store i8 %3008, i8* %3009, align 1
  %3010 = getelementptr inbounds i8, i8* %1, i64 %3007
  %3011 = load i8, i8* %3010, align 1
  %3012 = zext i8 %3011 to i32
  %3013 = icmp eq i32 %3012, 0
  br i1 %3013, label %3014, label %3017

3014:                                             ; preds = %3006
  %3015 = mul nuw nsw i64 %3007, 16
  %3016 = getelementptr inbounds i8, i8* %0, i64 %3015
  call void @llvm.memset.p0i8.i64(i8* align 1 %3016, i8 0, i64 16, i1 false)
  br label %3017

3017:                                             ; preds = %3014, %3006
  %3018 = add nuw nsw i64 %3007, 1
  %3019 = call zeroext i8 @randombit()
  %3020 = getelementptr inbounds i8, i8* %1, i64 %3018
  store i8 %3019, i8* %3020, align 1
  %3021 = getelementptr inbounds i8, i8* %1, i64 %3018
  %3022 = load i8, i8* %3021, align 1
  %3023 = zext i8 %3022 to i32
  %3024 = icmp eq i32 %3023, 0
  br i1 %3024, label %3025, label %3028

3025:                                             ; preds = %3017
  %3026 = mul nuw nsw i64 %3018, 16
  %3027 = getelementptr inbounds i8, i8* %0, i64 %3026
  call void @llvm.memset.p0i8.i64(i8* align 1 %3027, i8 0, i64 16, i1 false)
  br label %3028

3028:                                             ; preds = %3025, %3017
  %3029 = add nuw nsw i64 %3018, 1
  %3030 = call zeroext i8 @randombit()
  %3031 = getelementptr inbounds i8, i8* %1, i64 %3029
  store i8 %3030, i8* %3031, align 1
  %3032 = getelementptr inbounds i8, i8* %1, i64 %3029
  %3033 = load i8, i8* %3032, align 1
  %3034 = zext i8 %3033 to i32
  %3035 = icmp eq i32 %3034, 0
  br i1 %3035, label %3036, label %3039

3036:                                             ; preds = %3028
  %3037 = mul nuw nsw i64 %3029, 16
  %3038 = getelementptr inbounds i8, i8* %0, i64 %3037
  call void @llvm.memset.p0i8.i64(i8* align 1 %3038, i8 0, i64 16, i1 false)
  br label %3039

3039:                                             ; preds = %3036, %3028
  %3040 = add nuw nsw i64 %3029, 1
  %3041 = call zeroext i8 @randombit()
  %3042 = getelementptr inbounds i8, i8* %1, i64 %3040
  store i8 %3041, i8* %3042, align 1
  %3043 = getelementptr inbounds i8, i8* %1, i64 %3040
  %3044 = load i8, i8* %3043, align 1
  %3045 = zext i8 %3044 to i32
  %3046 = icmp eq i32 %3045, 0
  br i1 %3046, label %3047, label %3050

3047:                                             ; preds = %3039
  %3048 = mul nuw nsw i64 %3040, 16
  %3049 = getelementptr inbounds i8, i8* %0, i64 %3048
  call void @llvm.memset.p0i8.i64(i8* align 1 %3049, i8 0, i64 16, i1 false)
  br label %3050

3050:                                             ; preds = %3047, %3039
  %3051 = add nuw nsw i64 %3040, 1
  %3052 = call zeroext i8 @randombit()
  %3053 = getelementptr inbounds i8, i8* %1, i64 %3051
  store i8 %3052, i8* %3053, align 1
  %3054 = getelementptr inbounds i8, i8* %1, i64 %3051
  %3055 = load i8, i8* %3054, align 1
  %3056 = zext i8 %3055 to i32
  %3057 = icmp eq i32 %3056, 0
  br i1 %3057, label %3058, label %3061

3058:                                             ; preds = %3050
  %3059 = mul nuw nsw i64 %3051, 16
  %3060 = getelementptr inbounds i8, i8* %0, i64 %3059
  call void @llvm.memset.p0i8.i64(i8* align 1 %3060, i8 0, i64 16, i1 false)
  br label %3061

3061:                                             ; preds = %3058, %3050
  %3062 = add nuw nsw i64 %3051, 1
  %3063 = call zeroext i8 @randombit()
  %3064 = getelementptr inbounds i8, i8* %1, i64 %3062
  store i8 %3063, i8* %3064, align 1
  %3065 = getelementptr inbounds i8, i8* %1, i64 %3062
  %3066 = load i8, i8* %3065, align 1
  %3067 = zext i8 %3066 to i32
  %3068 = icmp eq i32 %3067, 0
  br i1 %3068, label %3069, label %3072

3069:                                             ; preds = %3061
  %3070 = mul nuw nsw i64 %3062, 16
  %3071 = getelementptr inbounds i8, i8* %0, i64 %3070
  call void @llvm.memset.p0i8.i64(i8* align 1 %3071, i8 0, i64 16, i1 false)
  br label %3072

3072:                                             ; preds = %3069, %3061
  %3073 = add nuw nsw i64 %3062, 1
  %3074 = call zeroext i8 @randombit()
  %3075 = getelementptr inbounds i8, i8* %1, i64 %3073
  store i8 %3074, i8* %3075, align 1
  %3076 = getelementptr inbounds i8, i8* %1, i64 %3073
  %3077 = load i8, i8* %3076, align 1
  %3078 = zext i8 %3077 to i32
  %3079 = icmp eq i32 %3078, 0
  br i1 %3079, label %3080, label %3083

3080:                                             ; preds = %3072
  %3081 = mul nuw nsw i64 %3073, 16
  %3082 = getelementptr inbounds i8, i8* %0, i64 %3081
  call void @llvm.memset.p0i8.i64(i8* align 1 %3082, i8 0, i64 16, i1 false)
  br label %3083

3083:                                             ; preds = %3080, %3072
  %3084 = add nuw nsw i64 %3073, 1
  %3085 = call zeroext i8 @randombit()
  %3086 = getelementptr inbounds i8, i8* %1, i64 %3084
  store i8 %3085, i8* %3086, align 1
  %3087 = getelementptr inbounds i8, i8* %1, i64 %3084
  %3088 = load i8, i8* %3087, align 1
  %3089 = zext i8 %3088 to i32
  %3090 = icmp eq i32 %3089, 0
  br i1 %3090, label %3091, label %3094

3091:                                             ; preds = %3083
  %3092 = mul nuw nsw i64 %3084, 16
  %3093 = getelementptr inbounds i8, i8* %0, i64 %3092
  call void @llvm.memset.p0i8.i64(i8* align 1 %3093, i8 0, i64 16, i1 false)
  br label %3094

3094:                                             ; preds = %3091, %3083
  %3095 = add nuw nsw i64 %3084, 1
  %3096 = call zeroext i8 @randombit()
  %3097 = getelementptr inbounds i8, i8* %1, i64 %3095
  store i8 %3096, i8* %3097, align 1
  %3098 = getelementptr inbounds i8, i8* %1, i64 %3095
  %3099 = load i8, i8* %3098, align 1
  %3100 = zext i8 %3099 to i32
  %3101 = icmp eq i32 %3100, 0
  br i1 %3101, label %3102, label %3105

3102:                                             ; preds = %3094
  %3103 = mul nuw nsw i64 %3095, 16
  %3104 = getelementptr inbounds i8, i8* %0, i64 %3103
  call void @llvm.memset.p0i8.i64(i8* align 1 %3104, i8 0, i64 16, i1 false)
  br label %3105

3105:                                             ; preds = %3102, %3094
  %3106 = add nuw nsw i64 %3095, 1
  %3107 = call zeroext i8 @randombit()
  %3108 = getelementptr inbounds i8, i8* %1, i64 %3106
  store i8 %3107, i8* %3108, align 1
  %3109 = getelementptr inbounds i8, i8* %1, i64 %3106
  %3110 = load i8, i8* %3109, align 1
  %3111 = zext i8 %3110 to i32
  %3112 = icmp eq i32 %3111, 0
  br i1 %3112, label %3113, label %3116

3113:                                             ; preds = %3105
  %3114 = mul nuw nsw i64 %3106, 16
  %3115 = getelementptr inbounds i8, i8* %0, i64 %3114
  call void @llvm.memset.p0i8.i64(i8* align 1 %3115, i8 0, i64 16, i1 false)
  br label %3116

3116:                                             ; preds = %3113, %3105
  %3117 = add nuw nsw i64 %3106, 1
  %3118 = call zeroext i8 @randombit()
  %3119 = getelementptr inbounds i8, i8* %1, i64 %3117
  store i8 %3118, i8* %3119, align 1
  %3120 = getelementptr inbounds i8, i8* %1, i64 %3117
  %3121 = load i8, i8* %3120, align 1
  %3122 = zext i8 %3121 to i32
  %3123 = icmp eq i32 %3122, 0
  br i1 %3123, label %3124, label %3127

3124:                                             ; preds = %3116
  %3125 = mul nuw nsw i64 %3117, 16
  %3126 = getelementptr inbounds i8, i8* %0, i64 %3125
  call void @llvm.memset.p0i8.i64(i8* align 1 %3126, i8 0, i64 16, i1 false)
  br label %3127

3127:                                             ; preds = %3124, %3116
  %3128 = add nuw nsw i64 %3117, 1
  %3129 = call zeroext i8 @randombit()
  %3130 = getelementptr inbounds i8, i8* %1, i64 %3128
  store i8 %3129, i8* %3130, align 1
  %3131 = getelementptr inbounds i8, i8* %1, i64 %3128
  %3132 = load i8, i8* %3131, align 1
  %3133 = zext i8 %3132 to i32
  %3134 = icmp eq i32 %3133, 0
  br i1 %3134, label %3135, label %3138

3135:                                             ; preds = %3127
  %3136 = mul nuw nsw i64 %3128, 16
  %3137 = getelementptr inbounds i8, i8* %0, i64 %3136
  call void @llvm.memset.p0i8.i64(i8* align 1 %3137, i8 0, i64 16, i1 false)
  br label %3138

3138:                                             ; preds = %3135, %3127
  %3139 = add nuw nsw i64 %3128, 1
  %3140 = call zeroext i8 @randombit()
  %3141 = getelementptr inbounds i8, i8* %1, i64 %3139
  store i8 %3140, i8* %3141, align 1
  %3142 = getelementptr inbounds i8, i8* %1, i64 %3139
  %3143 = load i8, i8* %3142, align 1
  %3144 = zext i8 %3143 to i32
  %3145 = icmp eq i32 %3144, 0
  br i1 %3145, label %3146, label %3149

3146:                                             ; preds = %3138
  %3147 = mul nuw nsw i64 %3139, 16
  %3148 = getelementptr inbounds i8, i8* %0, i64 %3147
  call void @llvm.memset.p0i8.i64(i8* align 1 %3148, i8 0, i64 16, i1 false)
  br label %3149

3149:                                             ; preds = %3146, %3138
  %3150 = add nuw nsw i64 %3139, 1
  %3151 = call zeroext i8 @randombit()
  %3152 = getelementptr inbounds i8, i8* %1, i64 %3150
  store i8 %3151, i8* %3152, align 1
  %3153 = getelementptr inbounds i8, i8* %1, i64 %3150
  %3154 = load i8, i8* %3153, align 1
  %3155 = zext i8 %3154 to i32
  %3156 = icmp eq i32 %3155, 0
  br i1 %3156, label %3157, label %3160

3157:                                             ; preds = %3149
  %3158 = mul nuw nsw i64 %3150, 16
  %3159 = getelementptr inbounds i8, i8* %0, i64 %3158
  call void @llvm.memset.p0i8.i64(i8* align 1 %3159, i8 0, i64 16, i1 false)
  br label %3160

3160:                                             ; preds = %3157, %3149
  %3161 = add nuw nsw i64 %3150, 1
  %3162 = call zeroext i8 @randombit()
  %3163 = getelementptr inbounds i8, i8* %1, i64 %3161
  store i8 %3162, i8* %3163, align 1
  %3164 = getelementptr inbounds i8, i8* %1, i64 %3161
  %3165 = load i8, i8* %3164, align 1
  %3166 = zext i8 %3165 to i32
  %3167 = icmp eq i32 %3166, 0
  br i1 %3167, label %3168, label %3171

3168:                                             ; preds = %3160
  %3169 = mul nuw nsw i64 %3161, 16
  %3170 = getelementptr inbounds i8, i8* %0, i64 %3169
  call void @llvm.memset.p0i8.i64(i8* align 1 %3170, i8 0, i64 16, i1 false)
  br label %3171

3171:                                             ; preds = %3168, %3160
  %3172 = add nuw nsw i64 %3161, 1
  %3173 = call zeroext i8 @randombit()
  %3174 = getelementptr inbounds i8, i8* %1, i64 %3172
  store i8 %3173, i8* %3174, align 1
  %3175 = getelementptr inbounds i8, i8* %1, i64 %3172
  %3176 = load i8, i8* %3175, align 1
  %3177 = zext i8 %3176 to i32
  %3178 = icmp eq i32 %3177, 0
  br i1 %3178, label %3179, label %3182

3179:                                             ; preds = %3171
  %3180 = mul nuw nsw i64 %3172, 16
  %3181 = getelementptr inbounds i8, i8* %0, i64 %3180
  call void @llvm.memset.p0i8.i64(i8* align 1 %3181, i8 0, i64 16, i1 false)
  br label %3182

3182:                                             ; preds = %3179, %3171
  %3183 = add nuw nsw i64 %3172, 1
  %3184 = call zeroext i8 @randombit()
  %3185 = getelementptr inbounds i8, i8* %1, i64 %3183
  store i8 %3184, i8* %3185, align 1
  %3186 = getelementptr inbounds i8, i8* %1, i64 %3183
  %3187 = load i8, i8* %3186, align 1
  %3188 = zext i8 %3187 to i32
  %3189 = icmp eq i32 %3188, 0
  br i1 %3189, label %3190, label %3193

3190:                                             ; preds = %3182
  %3191 = mul nuw nsw i64 %3183, 16
  %3192 = getelementptr inbounds i8, i8* %0, i64 %3191
  call void @llvm.memset.p0i8.i64(i8* align 1 %3192, i8 0, i64 16, i1 false)
  br label %3193

3193:                                             ; preds = %3190, %3182
  %3194 = add nuw nsw i64 %3183, 1
  %3195 = call zeroext i8 @randombit()
  %3196 = getelementptr inbounds i8, i8* %1, i64 %3194
  store i8 %3195, i8* %3196, align 1
  %3197 = getelementptr inbounds i8, i8* %1, i64 %3194
  %3198 = load i8, i8* %3197, align 1
  %3199 = zext i8 %3198 to i32
  %3200 = icmp eq i32 %3199, 0
  br i1 %3200, label %3201, label %3204

3201:                                             ; preds = %3193
  %3202 = mul nuw nsw i64 %3194, 16
  %3203 = getelementptr inbounds i8, i8* %0, i64 %3202
  call void @llvm.memset.p0i8.i64(i8* align 1 %3203, i8 0, i64 16, i1 false)
  br label %3204

3204:                                             ; preds = %3201, %3193
  %3205 = add nuw nsw i64 %3194, 1
  %3206 = call zeroext i8 @randombit()
  %3207 = getelementptr inbounds i8, i8* %1, i64 %3205
  store i8 %3206, i8* %3207, align 1
  %3208 = getelementptr inbounds i8, i8* %1, i64 %3205
  %3209 = load i8, i8* %3208, align 1
  %3210 = zext i8 %3209 to i32
  %3211 = icmp eq i32 %3210, 0
  br i1 %3211, label %3212, label %3215

3212:                                             ; preds = %3204
  %3213 = mul nuw nsw i64 %3205, 16
  %3214 = getelementptr inbounds i8, i8* %0, i64 %3213
  call void @llvm.memset.p0i8.i64(i8* align 1 %3214, i8 0, i64 16, i1 false)
  br label %3215

3215:                                             ; preds = %3212, %3204
  %3216 = add nuw nsw i64 %3205, 1
  %3217 = call zeroext i8 @randombit()
  %3218 = getelementptr inbounds i8, i8* %1, i64 %3216
  store i8 %3217, i8* %3218, align 1
  %3219 = getelementptr inbounds i8, i8* %1, i64 %3216
  %3220 = load i8, i8* %3219, align 1
  %3221 = zext i8 %3220 to i32
  %3222 = icmp eq i32 %3221, 0
  br i1 %3222, label %3223, label %3226

3223:                                             ; preds = %3215
  %3224 = mul nuw nsw i64 %3216, 16
  %3225 = getelementptr inbounds i8, i8* %0, i64 %3224
  call void @llvm.memset.p0i8.i64(i8* align 1 %3225, i8 0, i64 16, i1 false)
  br label %3226

3226:                                             ; preds = %3223, %3215
  %3227 = add nuw nsw i64 %3216, 1
  %3228 = call zeroext i8 @randombit()
  %3229 = getelementptr inbounds i8, i8* %1, i64 %3227
  store i8 %3228, i8* %3229, align 1
  %3230 = getelementptr inbounds i8, i8* %1, i64 %3227
  %3231 = load i8, i8* %3230, align 1
  %3232 = zext i8 %3231 to i32
  %3233 = icmp eq i32 %3232, 0
  br i1 %3233, label %3234, label %3237

3234:                                             ; preds = %3226
  %3235 = mul nuw nsw i64 %3227, 16
  %3236 = getelementptr inbounds i8, i8* %0, i64 %3235
  call void @llvm.memset.p0i8.i64(i8* align 1 %3236, i8 0, i64 16, i1 false)
  br label %3237

3237:                                             ; preds = %3234, %3226
  %3238 = add nuw nsw i64 %3227, 1
  %3239 = call zeroext i8 @randombit()
  %3240 = getelementptr inbounds i8, i8* %1, i64 %3238
  store i8 %3239, i8* %3240, align 1
  %3241 = getelementptr inbounds i8, i8* %1, i64 %3238
  %3242 = load i8, i8* %3241, align 1
  %3243 = zext i8 %3242 to i32
  %3244 = icmp eq i32 %3243, 0
  br i1 %3244, label %3245, label %3248

3245:                                             ; preds = %3237
  %3246 = mul nuw nsw i64 %3238, 16
  %3247 = getelementptr inbounds i8, i8* %0, i64 %3246
  call void @llvm.memset.p0i8.i64(i8* align 1 %3247, i8 0, i64 16, i1 false)
  br label %3248

3248:                                             ; preds = %3245, %3237
  %3249 = add nuw nsw i64 %3238, 1
  %3250 = call zeroext i8 @randombit()
  %3251 = getelementptr inbounds i8, i8* %1, i64 %3249
  store i8 %3250, i8* %3251, align 1
  %3252 = getelementptr inbounds i8, i8* %1, i64 %3249
  %3253 = load i8, i8* %3252, align 1
  %3254 = zext i8 %3253 to i32
  %3255 = icmp eq i32 %3254, 0
  br i1 %3255, label %3256, label %3259

3256:                                             ; preds = %3248
  %3257 = mul nuw nsw i64 %3249, 16
  %3258 = getelementptr inbounds i8, i8* %0, i64 %3257
  call void @llvm.memset.p0i8.i64(i8* align 1 %3258, i8 0, i64 16, i1 false)
  br label %3259

3259:                                             ; preds = %3256, %3248
  %3260 = add nuw nsw i64 %3249, 1
  %3261 = call zeroext i8 @randombit()
  %3262 = getelementptr inbounds i8, i8* %1, i64 %3260
  store i8 %3261, i8* %3262, align 1
  %3263 = getelementptr inbounds i8, i8* %1, i64 %3260
  %3264 = load i8, i8* %3263, align 1
  %3265 = zext i8 %3264 to i32
  %3266 = icmp eq i32 %3265, 0
  br i1 %3266, label %3267, label %3270

3267:                                             ; preds = %3259
  %3268 = mul nuw nsw i64 %3260, 16
  %3269 = getelementptr inbounds i8, i8* %0, i64 %3268
  call void @llvm.memset.p0i8.i64(i8* align 1 %3269, i8 0, i64 16, i1 false)
  br label %3270

3270:                                             ; preds = %3267, %3259
  %3271 = add nuw nsw i64 %3260, 1
  %3272 = call zeroext i8 @randombit()
  %3273 = getelementptr inbounds i8, i8* %1, i64 %3271
  store i8 %3272, i8* %3273, align 1
  %3274 = getelementptr inbounds i8, i8* %1, i64 %3271
  %3275 = load i8, i8* %3274, align 1
  %3276 = zext i8 %3275 to i32
  %3277 = icmp eq i32 %3276, 0
  br i1 %3277, label %3278, label %3281

3278:                                             ; preds = %3270
  %3279 = mul nuw nsw i64 %3271, 16
  %3280 = getelementptr inbounds i8, i8* %0, i64 %3279
  call void @llvm.memset.p0i8.i64(i8* align 1 %3280, i8 0, i64 16, i1 false)
  br label %3281

3281:                                             ; preds = %3278, %3270
  %3282 = add nuw nsw i64 %3271, 1
  %3283 = call zeroext i8 @randombit()
  %3284 = getelementptr inbounds i8, i8* %1, i64 %3282
  store i8 %3283, i8* %3284, align 1
  %3285 = getelementptr inbounds i8, i8* %1, i64 %3282
  %3286 = load i8, i8* %3285, align 1
  %3287 = zext i8 %3286 to i32
  %3288 = icmp eq i32 %3287, 0
  br i1 %3288, label %3289, label %3292

3289:                                             ; preds = %3281
  %3290 = mul nuw nsw i64 %3282, 16
  %3291 = getelementptr inbounds i8, i8* %0, i64 %3290
  call void @llvm.memset.p0i8.i64(i8* align 1 %3291, i8 0, i64 16, i1 false)
  br label %3292

3292:                                             ; preds = %3289, %3281
  %3293 = add nuw nsw i64 %3282, 1
  %3294 = call zeroext i8 @randombit()
  %3295 = getelementptr inbounds i8, i8* %1, i64 %3293
  store i8 %3294, i8* %3295, align 1
  %3296 = getelementptr inbounds i8, i8* %1, i64 %3293
  %3297 = load i8, i8* %3296, align 1
  %3298 = zext i8 %3297 to i32
  %3299 = icmp eq i32 %3298, 0
  br i1 %3299, label %3300, label %3303

3300:                                             ; preds = %3292
  %3301 = mul nuw nsw i64 %3293, 16
  %3302 = getelementptr inbounds i8, i8* %0, i64 %3301
  call void @llvm.memset.p0i8.i64(i8* align 1 %3302, i8 0, i64 16, i1 false)
  br label %3303

3303:                                             ; preds = %3300, %3292
  %3304 = add nuw nsw i64 %3293, 1
  %3305 = call zeroext i8 @randombit()
  %3306 = getelementptr inbounds i8, i8* %1, i64 %3304
  store i8 %3305, i8* %3306, align 1
  %3307 = getelementptr inbounds i8, i8* %1, i64 %3304
  %3308 = load i8, i8* %3307, align 1
  %3309 = zext i8 %3308 to i32
  %3310 = icmp eq i32 %3309, 0
  br i1 %3310, label %3311, label %3314

3311:                                             ; preds = %3303
  %3312 = mul nuw nsw i64 %3304, 16
  %3313 = getelementptr inbounds i8, i8* %0, i64 %3312
  call void @llvm.memset.p0i8.i64(i8* align 1 %3313, i8 0, i64 16, i1 false)
  br label %3314

3314:                                             ; preds = %3311, %3303
  %3315 = add nuw nsw i64 %3304, 1
  %3316 = call zeroext i8 @randombit()
  %3317 = getelementptr inbounds i8, i8* %1, i64 %3315
  store i8 %3316, i8* %3317, align 1
  %3318 = getelementptr inbounds i8, i8* %1, i64 %3315
  %3319 = load i8, i8* %3318, align 1
  %3320 = zext i8 %3319 to i32
  %3321 = icmp eq i32 %3320, 0
  br i1 %3321, label %3322, label %3325

3322:                                             ; preds = %3314
  %3323 = mul nuw nsw i64 %3315, 16
  %3324 = getelementptr inbounds i8, i8* %0, i64 %3323
  call void @llvm.memset.p0i8.i64(i8* align 1 %3324, i8 0, i64 16, i1 false)
  br label %3325

3325:                                             ; preds = %3322, %3314
  %3326 = add nuw nsw i64 %3315, 1
  %3327 = call zeroext i8 @randombit()
  %3328 = getelementptr inbounds i8, i8* %1, i64 %3326
  store i8 %3327, i8* %3328, align 1
  %3329 = getelementptr inbounds i8, i8* %1, i64 %3326
  %3330 = load i8, i8* %3329, align 1
  %3331 = zext i8 %3330 to i32
  %3332 = icmp eq i32 %3331, 0
  br i1 %3332, label %3333, label %3336

3333:                                             ; preds = %3325
  %3334 = mul nuw nsw i64 %3326, 16
  %3335 = getelementptr inbounds i8, i8* %0, i64 %3334
  call void @llvm.memset.p0i8.i64(i8* align 1 %3335, i8 0, i64 16, i1 false)
  br label %3336

3336:                                             ; preds = %3333, %3325
  %3337 = add nuw nsw i64 %3326, 1
  %3338 = call zeroext i8 @randombit()
  %3339 = getelementptr inbounds i8, i8* %1, i64 %3337
  store i8 %3338, i8* %3339, align 1
  %3340 = getelementptr inbounds i8, i8* %1, i64 %3337
  %3341 = load i8, i8* %3340, align 1
  %3342 = zext i8 %3341 to i32
  %3343 = icmp eq i32 %3342, 0
  br i1 %3343, label %3344, label %3347

3344:                                             ; preds = %3336
  %3345 = mul nuw nsw i64 %3337, 16
  %3346 = getelementptr inbounds i8, i8* %0, i64 %3345
  call void @llvm.memset.p0i8.i64(i8* align 1 %3346, i8 0, i64 16, i1 false)
  br label %3347

3347:                                             ; preds = %3344, %3336
  %3348 = add nuw nsw i64 %3337, 1
  %3349 = call zeroext i8 @randombit()
  %3350 = getelementptr inbounds i8, i8* %1, i64 %3348
  store i8 %3349, i8* %3350, align 1
  %3351 = getelementptr inbounds i8, i8* %1, i64 %3348
  %3352 = load i8, i8* %3351, align 1
  %3353 = zext i8 %3352 to i32
  %3354 = icmp eq i32 %3353, 0
  br i1 %3354, label %3355, label %3358

3355:                                             ; preds = %3347
  %3356 = mul nuw nsw i64 %3348, 16
  %3357 = getelementptr inbounds i8, i8* %0, i64 %3356
  call void @llvm.memset.p0i8.i64(i8* align 1 %3357, i8 0, i64 16, i1 false)
  br label %3358

3358:                                             ; preds = %3355, %3347
  %3359 = add nuw nsw i64 %3348, 1
  %3360 = call zeroext i8 @randombit()
  %3361 = getelementptr inbounds i8, i8* %1, i64 %3359
  store i8 %3360, i8* %3361, align 1
  %3362 = getelementptr inbounds i8, i8* %1, i64 %3359
  %3363 = load i8, i8* %3362, align 1
  %3364 = zext i8 %3363 to i32
  %3365 = icmp eq i32 %3364, 0
  br i1 %3365, label %3366, label %3369

3366:                                             ; preds = %3358
  %3367 = mul nuw nsw i64 %3359, 16
  %3368 = getelementptr inbounds i8, i8* %0, i64 %3367
  call void @llvm.memset.p0i8.i64(i8* align 1 %3368, i8 0, i64 16, i1 false)
  br label %3369

3369:                                             ; preds = %3366, %3358
  %3370 = add nuw nsw i64 %3359, 1
  %3371 = call zeroext i8 @randombit()
  %3372 = getelementptr inbounds i8, i8* %1, i64 %3370
  store i8 %3371, i8* %3372, align 1
  %3373 = getelementptr inbounds i8, i8* %1, i64 %3370
  %3374 = load i8, i8* %3373, align 1
  %3375 = zext i8 %3374 to i32
  %3376 = icmp eq i32 %3375, 0
  br i1 %3376, label %3377, label %3380

3377:                                             ; preds = %3369
  %3378 = mul nuw nsw i64 %3370, 16
  %3379 = getelementptr inbounds i8, i8* %0, i64 %3378
  call void @llvm.memset.p0i8.i64(i8* align 1 %3379, i8 0, i64 16, i1 false)
  br label %3380

3380:                                             ; preds = %3377, %3369
  %3381 = add nuw nsw i64 %3370, 1
  %3382 = call zeroext i8 @randombit()
  %3383 = getelementptr inbounds i8, i8* %1, i64 %3381
  store i8 %3382, i8* %3383, align 1
  %3384 = getelementptr inbounds i8, i8* %1, i64 %3381
  %3385 = load i8, i8* %3384, align 1
  %3386 = zext i8 %3385 to i32
  %3387 = icmp eq i32 %3386, 0
  br i1 %3387, label %3388, label %3391

3388:                                             ; preds = %3380
  %3389 = mul nuw nsw i64 %3381, 16
  %3390 = getelementptr inbounds i8, i8* %0, i64 %3389
  call void @llvm.memset.p0i8.i64(i8* align 1 %3390, i8 0, i64 16, i1 false)
  br label %3391

3391:                                             ; preds = %3388, %3380
  %3392 = add nuw nsw i64 %3381, 1
  %3393 = call zeroext i8 @randombit()
  %3394 = getelementptr inbounds i8, i8* %1, i64 %3392
  store i8 %3393, i8* %3394, align 1
  %3395 = getelementptr inbounds i8, i8* %1, i64 %3392
  %3396 = load i8, i8* %3395, align 1
  %3397 = zext i8 %3396 to i32
  %3398 = icmp eq i32 %3397, 0
  br i1 %3398, label %3399, label %3402

3399:                                             ; preds = %3391
  %3400 = mul nuw nsw i64 %3392, 16
  %3401 = getelementptr inbounds i8, i8* %0, i64 %3400
  call void @llvm.memset.p0i8.i64(i8* align 1 %3401, i8 0, i64 16, i1 false)
  br label %3402

3402:                                             ; preds = %3399, %3391
  %3403 = add nuw nsw i64 %3392, 1
  %3404 = call zeroext i8 @randombit()
  %3405 = getelementptr inbounds i8, i8* %1, i64 %3403
  store i8 %3404, i8* %3405, align 1
  %3406 = getelementptr inbounds i8, i8* %1, i64 %3403
  %3407 = load i8, i8* %3406, align 1
  %3408 = zext i8 %3407 to i32
  %3409 = icmp eq i32 %3408, 0
  br i1 %3409, label %3410, label %3413

3410:                                             ; preds = %3402
  %3411 = mul nuw nsw i64 %3403, 16
  %3412 = getelementptr inbounds i8, i8* %0, i64 %3411
  call void @llvm.memset.p0i8.i64(i8* align 1 %3412, i8 0, i64 16, i1 false)
  br label %3413

3413:                                             ; preds = %3410, %3402
  %3414 = add nuw nsw i64 %3403, 1
  %3415 = call zeroext i8 @randombit()
  %3416 = getelementptr inbounds i8, i8* %1, i64 %3414
  store i8 %3415, i8* %3416, align 1
  %3417 = getelementptr inbounds i8, i8* %1, i64 %3414
  %3418 = load i8, i8* %3417, align 1
  %3419 = zext i8 %3418 to i32
  %3420 = icmp eq i32 %3419, 0
  br i1 %3420, label %3421, label %3424

3421:                                             ; preds = %3413
  %3422 = mul nuw nsw i64 %3414, 16
  %3423 = getelementptr inbounds i8, i8* %0, i64 %3422
  call void @llvm.memset.p0i8.i64(i8* align 1 %3423, i8 0, i64 16, i1 false)
  br label %3424

3424:                                             ; preds = %3421, %3413
  %3425 = add nuw nsw i64 %3414, 1
  %3426 = call zeroext i8 @randombit()
  %3427 = getelementptr inbounds i8, i8* %1, i64 %3425
  store i8 %3426, i8* %3427, align 1
  %3428 = getelementptr inbounds i8, i8* %1, i64 %3425
  %3429 = load i8, i8* %3428, align 1
  %3430 = zext i8 %3429 to i32
  %3431 = icmp eq i32 %3430, 0
  br i1 %3431, label %3432, label %3435

3432:                                             ; preds = %3424
  %3433 = mul nuw nsw i64 %3425, 16
  %3434 = getelementptr inbounds i8, i8* %0, i64 %3433
  call void @llvm.memset.p0i8.i64(i8* align 1 %3434, i8 0, i64 16, i1 false)
  br label %3435

3435:                                             ; preds = %3432, %3424
  %3436 = add nuw nsw i64 %3425, 1
  %3437 = call zeroext i8 @randombit()
  %3438 = getelementptr inbounds i8, i8* %1, i64 %3436
  store i8 %3437, i8* %3438, align 1
  %3439 = getelementptr inbounds i8, i8* %1, i64 %3436
  %3440 = load i8, i8* %3439, align 1
  %3441 = zext i8 %3440 to i32
  %3442 = icmp eq i32 %3441, 0
  br i1 %3442, label %3443, label %3446

3443:                                             ; preds = %3435
  %3444 = mul nuw nsw i64 %3436, 16
  %3445 = getelementptr inbounds i8, i8* %0, i64 %3444
  call void @llvm.memset.p0i8.i64(i8* align 1 %3445, i8 0, i64 16, i1 false)
  br label %3446

3446:                                             ; preds = %3443, %3435
  %3447 = add nuw nsw i64 %3436, 1
  %3448 = call zeroext i8 @randombit()
  %3449 = getelementptr inbounds i8, i8* %1, i64 %3447
  store i8 %3448, i8* %3449, align 1
  %3450 = getelementptr inbounds i8, i8* %1, i64 %3447
  %3451 = load i8, i8* %3450, align 1
  %3452 = zext i8 %3451 to i32
  %3453 = icmp eq i32 %3452, 0
  br i1 %3453, label %3454, label %3457

3454:                                             ; preds = %3446
  %3455 = mul nuw nsw i64 %3447, 16
  %3456 = getelementptr inbounds i8, i8* %0, i64 %3455
  call void @llvm.memset.p0i8.i64(i8* align 1 %3456, i8 0, i64 16, i1 false)
  br label %3457

3457:                                             ; preds = %3454, %3446
  %3458 = add nuw nsw i64 %3447, 1
  %3459 = call zeroext i8 @randombit()
  %3460 = getelementptr inbounds i8, i8* %1, i64 %3458
  store i8 %3459, i8* %3460, align 1
  %3461 = getelementptr inbounds i8, i8* %1, i64 %3458
  %3462 = load i8, i8* %3461, align 1
  %3463 = zext i8 %3462 to i32
  %3464 = icmp eq i32 %3463, 0
  br i1 %3464, label %3465, label %3468

3465:                                             ; preds = %3457
  %3466 = mul nuw nsw i64 %3458, 16
  %3467 = getelementptr inbounds i8, i8* %0, i64 %3466
  call void @llvm.memset.p0i8.i64(i8* align 1 %3467, i8 0, i64 16, i1 false)
  br label %3468

3468:                                             ; preds = %3465, %3457
  %3469 = add nuw nsw i64 %3458, 1
  %3470 = call zeroext i8 @randombit()
  %3471 = getelementptr inbounds i8, i8* %1, i64 %3469
  store i8 %3470, i8* %3471, align 1
  %3472 = getelementptr inbounds i8, i8* %1, i64 %3469
  %3473 = load i8, i8* %3472, align 1
  %3474 = zext i8 %3473 to i32
  %3475 = icmp eq i32 %3474, 0
  br i1 %3475, label %3476, label %3479

3476:                                             ; preds = %3468
  %3477 = mul nuw nsw i64 %3469, 16
  %3478 = getelementptr inbounds i8, i8* %0, i64 %3477
  call void @llvm.memset.p0i8.i64(i8* align 1 %3478, i8 0, i64 16, i1 false)
  br label %3479

3479:                                             ; preds = %3476, %3468
  %3480 = add nuw nsw i64 %3469, 1
  %3481 = call zeroext i8 @randombit()
  %3482 = getelementptr inbounds i8, i8* %1, i64 %3480
  store i8 %3481, i8* %3482, align 1
  %3483 = getelementptr inbounds i8, i8* %1, i64 %3480
  %3484 = load i8, i8* %3483, align 1
  %3485 = zext i8 %3484 to i32
  %3486 = icmp eq i32 %3485, 0
  br i1 %3486, label %3487, label %3490

3487:                                             ; preds = %3479
  %3488 = mul nuw nsw i64 %3480, 16
  %3489 = getelementptr inbounds i8, i8* %0, i64 %3488
  call void @llvm.memset.p0i8.i64(i8* align 1 %3489, i8 0, i64 16, i1 false)
  br label %3490

3490:                                             ; preds = %3487, %3479
  %3491 = add nuw nsw i64 %3480, 1
  %3492 = call zeroext i8 @randombit()
  %3493 = getelementptr inbounds i8, i8* %1, i64 %3491
  store i8 %3492, i8* %3493, align 1
  %3494 = getelementptr inbounds i8, i8* %1, i64 %3491
  %3495 = load i8, i8* %3494, align 1
  %3496 = zext i8 %3495 to i32
  %3497 = icmp eq i32 %3496, 0
  br i1 %3497, label %3498, label %3501

3498:                                             ; preds = %3490
  %3499 = mul nuw nsw i64 %3491, 16
  %3500 = getelementptr inbounds i8, i8* %0, i64 %3499
  call void @llvm.memset.p0i8.i64(i8* align 1 %3500, i8 0, i64 16, i1 false)
  br label %3501

3501:                                             ; preds = %3498, %3490
  %3502 = add nuw nsw i64 %3491, 1
  %3503 = call zeroext i8 @randombit()
  %3504 = getelementptr inbounds i8, i8* %1, i64 %3502
  store i8 %3503, i8* %3504, align 1
  %3505 = getelementptr inbounds i8, i8* %1, i64 %3502
  %3506 = load i8, i8* %3505, align 1
  %3507 = zext i8 %3506 to i32
  %3508 = icmp eq i32 %3507, 0
  br i1 %3508, label %3509, label %3512

3509:                                             ; preds = %3501
  %3510 = mul nuw nsw i64 %3502, 16
  %3511 = getelementptr inbounds i8, i8* %0, i64 %3510
  call void @llvm.memset.p0i8.i64(i8* align 1 %3511, i8 0, i64 16, i1 false)
  br label %3512

3512:                                             ; preds = %3509, %3501
  %3513 = add nuw nsw i64 %3502, 1
  %3514 = call zeroext i8 @randombit()
  %3515 = getelementptr inbounds i8, i8* %1, i64 %3513
  store i8 %3514, i8* %3515, align 1
  %3516 = getelementptr inbounds i8, i8* %1, i64 %3513
  %3517 = load i8, i8* %3516, align 1
  %3518 = zext i8 %3517 to i32
  %3519 = icmp eq i32 %3518, 0
  br i1 %3519, label %3520, label %3523

3520:                                             ; preds = %3512
  %3521 = mul nuw nsw i64 %3513, 16
  %3522 = getelementptr inbounds i8, i8* %0, i64 %3521
  call void @llvm.memset.p0i8.i64(i8* align 1 %3522, i8 0, i64 16, i1 false)
  br label %3523

3523:                                             ; preds = %3520, %3512
  %3524 = add nuw nsw i64 %3513, 1
  %3525 = call zeroext i8 @randombit()
  %3526 = getelementptr inbounds i8, i8* %1, i64 %3524
  store i8 %3525, i8* %3526, align 1
  %3527 = getelementptr inbounds i8, i8* %1, i64 %3524
  %3528 = load i8, i8* %3527, align 1
  %3529 = zext i8 %3528 to i32
  %3530 = icmp eq i32 %3529, 0
  br i1 %3530, label %3531, label %3534

3531:                                             ; preds = %3523
  %3532 = mul nuw nsw i64 %3524, 16
  %3533 = getelementptr inbounds i8, i8* %0, i64 %3532
  call void @llvm.memset.p0i8.i64(i8* align 1 %3533, i8 0, i64 16, i1 false)
  br label %3534

3534:                                             ; preds = %3531, %3523
  %3535 = add nuw nsw i64 %3524, 1
  %3536 = call zeroext i8 @randombit()
  %3537 = getelementptr inbounds i8, i8* %1, i64 %3535
  store i8 %3536, i8* %3537, align 1
  %3538 = getelementptr inbounds i8, i8* %1, i64 %3535
  %3539 = load i8, i8* %3538, align 1
  %3540 = zext i8 %3539 to i32
  %3541 = icmp eq i32 %3540, 0
  br i1 %3541, label %3542, label %3545

3542:                                             ; preds = %3534
  %3543 = mul nuw nsw i64 %3535, 16
  %3544 = getelementptr inbounds i8, i8* %0, i64 %3543
  call void @llvm.memset.p0i8.i64(i8* align 1 %3544, i8 0, i64 16, i1 false)
  br label %3545

3545:                                             ; preds = %3542, %3534
  %3546 = add nuw nsw i64 %3535, 1
  %3547 = call zeroext i8 @randombit()
  %3548 = getelementptr inbounds i8, i8* %1, i64 %3546
  store i8 %3547, i8* %3548, align 1
  %3549 = getelementptr inbounds i8, i8* %1, i64 %3546
  %3550 = load i8, i8* %3549, align 1
  %3551 = zext i8 %3550 to i32
  %3552 = icmp eq i32 %3551, 0
  br i1 %3552, label %3553, label %3556

3553:                                             ; preds = %3545
  %3554 = mul nuw nsw i64 %3546, 16
  %3555 = getelementptr inbounds i8, i8* %0, i64 %3554
  call void @llvm.memset.p0i8.i64(i8* align 1 %3555, i8 0, i64 16, i1 false)
  br label %3556

3556:                                             ; preds = %3553, %3545
  %3557 = add nuw nsw i64 %3546, 1
  %3558 = call zeroext i8 @randombit()
  %3559 = getelementptr inbounds i8, i8* %1, i64 %3557
  store i8 %3558, i8* %3559, align 1
  %3560 = getelementptr inbounds i8, i8* %1, i64 %3557
  %3561 = load i8, i8* %3560, align 1
  %3562 = zext i8 %3561 to i32
  %3563 = icmp eq i32 %3562, 0
  br i1 %3563, label %3564, label %3567

3564:                                             ; preds = %3556
  %3565 = mul nuw nsw i64 %3557, 16
  %3566 = getelementptr inbounds i8, i8* %0, i64 %3565
  call void @llvm.memset.p0i8.i64(i8* align 1 %3566, i8 0, i64 16, i1 false)
  br label %3567

3567:                                             ; preds = %3564, %3556
  %3568 = add nuw nsw i64 %3557, 1
  %3569 = call zeroext i8 @randombit()
  %3570 = getelementptr inbounds i8, i8* %1, i64 %3568
  store i8 %3569, i8* %3570, align 1
  %3571 = getelementptr inbounds i8, i8* %1, i64 %3568
  %3572 = load i8, i8* %3571, align 1
  %3573 = zext i8 %3572 to i32
  %3574 = icmp eq i32 %3573, 0
  br i1 %3574, label %3575, label %3578

3575:                                             ; preds = %3567
  %3576 = mul nuw nsw i64 %3568, 16
  %3577 = getelementptr inbounds i8, i8* %0, i64 %3576
  call void @llvm.memset.p0i8.i64(i8* align 1 %3577, i8 0, i64 16, i1 false)
  br label %3578

3578:                                             ; preds = %3575, %3567
  %3579 = add nuw nsw i64 %3568, 1
  %3580 = call zeroext i8 @randombit()
  %3581 = getelementptr inbounds i8, i8* %1, i64 %3579
  store i8 %3580, i8* %3581, align 1
  %3582 = getelementptr inbounds i8, i8* %1, i64 %3579
  %3583 = load i8, i8* %3582, align 1
  %3584 = zext i8 %3583 to i32
  %3585 = icmp eq i32 %3584, 0
  br i1 %3585, label %3586, label %3589

3586:                                             ; preds = %3578
  %3587 = mul nuw nsw i64 %3579, 16
  %3588 = getelementptr inbounds i8, i8* %0, i64 %3587
  call void @llvm.memset.p0i8.i64(i8* align 1 %3588, i8 0, i64 16, i1 false)
  br label %3589

3589:                                             ; preds = %3586, %3578
  %3590 = add nuw nsw i64 %3579, 1
  %3591 = call zeroext i8 @randombit()
  %3592 = getelementptr inbounds i8, i8* %1, i64 %3590
  store i8 %3591, i8* %3592, align 1
  %3593 = getelementptr inbounds i8, i8* %1, i64 %3590
  %3594 = load i8, i8* %3593, align 1
  %3595 = zext i8 %3594 to i32
  %3596 = icmp eq i32 %3595, 0
  br i1 %3596, label %3597, label %3600

3597:                                             ; preds = %3589
  %3598 = mul nuw nsw i64 %3590, 16
  %3599 = getelementptr inbounds i8, i8* %0, i64 %3598
  call void @llvm.memset.p0i8.i64(i8* align 1 %3599, i8 0, i64 16, i1 false)
  br label %3600

3600:                                             ; preds = %3597, %3589
  %3601 = add nuw nsw i64 %3590, 1
  %3602 = call zeroext i8 @randombit()
  %3603 = getelementptr inbounds i8, i8* %1, i64 %3601
  store i8 %3602, i8* %3603, align 1
  %3604 = getelementptr inbounds i8, i8* %1, i64 %3601
  %3605 = load i8, i8* %3604, align 1
  %3606 = zext i8 %3605 to i32
  %3607 = icmp eq i32 %3606, 0
  br i1 %3607, label %3608, label %3611

3608:                                             ; preds = %3600
  %3609 = mul nuw nsw i64 %3601, 16
  %3610 = getelementptr inbounds i8, i8* %0, i64 %3609
  call void @llvm.memset.p0i8.i64(i8* align 1 %3610, i8 0, i64 16, i1 false)
  br label %3611

3611:                                             ; preds = %3608, %3600
  %3612 = add nuw nsw i64 %3601, 1
  %3613 = call zeroext i8 @randombit()
  %3614 = getelementptr inbounds i8, i8* %1, i64 %3612
  store i8 %3613, i8* %3614, align 1
  %3615 = getelementptr inbounds i8, i8* %1, i64 %3612
  %3616 = load i8, i8* %3615, align 1
  %3617 = zext i8 %3616 to i32
  %3618 = icmp eq i32 %3617, 0
  br i1 %3618, label %3619, label %3622

3619:                                             ; preds = %3611
  %3620 = mul nuw nsw i64 %3612, 16
  %3621 = getelementptr inbounds i8, i8* %0, i64 %3620
  call void @llvm.memset.p0i8.i64(i8* align 1 %3621, i8 0, i64 16, i1 false)
  br label %3622

3622:                                             ; preds = %3619, %3611
  %3623 = add nuw nsw i64 %3612, 1
  %3624 = call zeroext i8 @randombit()
  %3625 = getelementptr inbounds i8, i8* %1, i64 %3623
  store i8 %3624, i8* %3625, align 1
  %3626 = getelementptr inbounds i8, i8* %1, i64 %3623
  %3627 = load i8, i8* %3626, align 1
  %3628 = zext i8 %3627 to i32
  %3629 = icmp eq i32 %3628, 0
  br i1 %3629, label %3630, label %3633

3630:                                             ; preds = %3622
  %3631 = mul nuw nsw i64 %3623, 16
  %3632 = getelementptr inbounds i8, i8* %0, i64 %3631
  call void @llvm.memset.p0i8.i64(i8* align 1 %3632, i8 0, i64 16, i1 false)
  br label %3633

3633:                                             ; preds = %3630, %3622
  %3634 = add nuw nsw i64 %3623, 1
  %3635 = call zeroext i8 @randombit()
  %3636 = getelementptr inbounds i8, i8* %1, i64 %3634
  store i8 %3635, i8* %3636, align 1
  %3637 = getelementptr inbounds i8, i8* %1, i64 %3634
  %3638 = load i8, i8* %3637, align 1
  %3639 = zext i8 %3638 to i32
  %3640 = icmp eq i32 %3639, 0
  br i1 %3640, label %3641, label %3644

3641:                                             ; preds = %3633
  %3642 = mul nuw nsw i64 %3634, 16
  %3643 = getelementptr inbounds i8, i8* %0, i64 %3642
  call void @llvm.memset.p0i8.i64(i8* align 1 %3643, i8 0, i64 16, i1 false)
  br label %3644

3644:                                             ; preds = %3641, %3633
  %3645 = add nuw nsw i64 %3634, 1
  %3646 = call zeroext i8 @randombit()
  %3647 = getelementptr inbounds i8, i8* %1, i64 %3645
  store i8 %3646, i8* %3647, align 1
  %3648 = getelementptr inbounds i8, i8* %1, i64 %3645
  %3649 = load i8, i8* %3648, align 1
  %3650 = zext i8 %3649 to i32
  %3651 = icmp eq i32 %3650, 0
  br i1 %3651, label %3652, label %3655

3652:                                             ; preds = %3644
  %3653 = mul nuw nsw i64 %3645, 16
  %3654 = getelementptr inbounds i8, i8* %0, i64 %3653
  call void @llvm.memset.p0i8.i64(i8* align 1 %3654, i8 0, i64 16, i1 false)
  br label %3655

3655:                                             ; preds = %3652, %3644
  %3656 = add nuw nsw i64 %3645, 1
  %3657 = call zeroext i8 @randombit()
  %3658 = getelementptr inbounds i8, i8* %1, i64 %3656
  store i8 %3657, i8* %3658, align 1
  %3659 = getelementptr inbounds i8, i8* %1, i64 %3656
  %3660 = load i8, i8* %3659, align 1
  %3661 = zext i8 %3660 to i32
  %3662 = icmp eq i32 %3661, 0
  br i1 %3662, label %3663, label %3666

3663:                                             ; preds = %3655
  %3664 = mul nuw nsw i64 %3656, 16
  %3665 = getelementptr inbounds i8, i8* %0, i64 %3664
  call void @llvm.memset.p0i8.i64(i8* align 1 %3665, i8 0, i64 16, i1 false)
  br label %3666

3666:                                             ; preds = %3663, %3655
  %3667 = add nuw nsw i64 %3656, 1
  %3668 = call zeroext i8 @randombit()
  %3669 = getelementptr inbounds i8, i8* %1, i64 %3667
  store i8 %3668, i8* %3669, align 1
  %3670 = getelementptr inbounds i8, i8* %1, i64 %3667
  %3671 = load i8, i8* %3670, align 1
  %3672 = zext i8 %3671 to i32
  %3673 = icmp eq i32 %3672, 0
  br i1 %3673, label %3674, label %3677

3674:                                             ; preds = %3666
  %3675 = mul nuw nsw i64 %3667, 16
  %3676 = getelementptr inbounds i8, i8* %0, i64 %3675
  call void @llvm.memset.p0i8.i64(i8* align 1 %3676, i8 0, i64 16, i1 false)
  br label %3677

3677:                                             ; preds = %3674, %3666
  %3678 = add nuw nsw i64 %3667, 1
  %3679 = call zeroext i8 @randombit()
  %3680 = getelementptr inbounds i8, i8* %1, i64 %3678
  store i8 %3679, i8* %3680, align 1
  %3681 = getelementptr inbounds i8, i8* %1, i64 %3678
  %3682 = load i8, i8* %3681, align 1
  %3683 = zext i8 %3682 to i32
  %3684 = icmp eq i32 %3683, 0
  br i1 %3684, label %3685, label %3688

3685:                                             ; preds = %3677
  %3686 = mul nuw nsw i64 %3678, 16
  %3687 = getelementptr inbounds i8, i8* %0, i64 %3686
  call void @llvm.memset.p0i8.i64(i8* align 1 %3687, i8 0, i64 16, i1 false)
  br label %3688

3688:                                             ; preds = %3685, %3677
  %3689 = add nuw nsw i64 %3678, 1
  %3690 = call zeroext i8 @randombit()
  %3691 = getelementptr inbounds i8, i8* %1, i64 %3689
  store i8 %3690, i8* %3691, align 1
  %3692 = getelementptr inbounds i8, i8* %1, i64 %3689
  %3693 = load i8, i8* %3692, align 1
  %3694 = zext i8 %3693 to i32
  %3695 = icmp eq i32 %3694, 0
  br i1 %3695, label %3696, label %3699

3696:                                             ; preds = %3688
  %3697 = mul nuw nsw i64 %3689, 16
  %3698 = getelementptr inbounds i8, i8* %0, i64 %3697
  call void @llvm.memset.p0i8.i64(i8* align 1 %3698, i8 0, i64 16, i1 false)
  br label %3699

3699:                                             ; preds = %3696, %3688
  %3700 = add nuw nsw i64 %3689, 1
  %3701 = call zeroext i8 @randombit()
  %3702 = getelementptr inbounds i8, i8* %1, i64 %3700
  store i8 %3701, i8* %3702, align 1
  %3703 = getelementptr inbounds i8, i8* %1, i64 %3700
  %3704 = load i8, i8* %3703, align 1
  %3705 = zext i8 %3704 to i32
  %3706 = icmp eq i32 %3705, 0
  br i1 %3706, label %3707, label %3710

3707:                                             ; preds = %3699
  %3708 = mul nuw nsw i64 %3700, 16
  %3709 = getelementptr inbounds i8, i8* %0, i64 %3708
  call void @llvm.memset.p0i8.i64(i8* align 1 %3709, i8 0, i64 16, i1 false)
  br label %3710

3710:                                             ; preds = %3707, %3699
  %3711 = add nuw nsw i64 %3700, 1
  %3712 = call zeroext i8 @randombit()
  %3713 = getelementptr inbounds i8, i8* %1, i64 %3711
  store i8 %3712, i8* %3713, align 1
  %3714 = getelementptr inbounds i8, i8* %1, i64 %3711
  %3715 = load i8, i8* %3714, align 1
  %3716 = zext i8 %3715 to i32
  %3717 = icmp eq i32 %3716, 0
  br i1 %3717, label %3718, label %3721

3718:                                             ; preds = %3710
  %3719 = mul nuw nsw i64 %3711, 16
  %3720 = getelementptr inbounds i8, i8* %0, i64 %3719
  call void @llvm.memset.p0i8.i64(i8* align 1 %3720, i8 0, i64 16, i1 false)
  br label %3721

3721:                                             ; preds = %3718, %3710
  %3722 = add nuw nsw i64 %3711, 1
  %3723 = call zeroext i8 @randombit()
  %3724 = getelementptr inbounds i8, i8* %1, i64 %3722
  store i8 %3723, i8* %3724, align 1
  %3725 = getelementptr inbounds i8, i8* %1, i64 %3722
  %3726 = load i8, i8* %3725, align 1
  %3727 = zext i8 %3726 to i32
  %3728 = icmp eq i32 %3727, 0
  br i1 %3728, label %3729, label %3732

3729:                                             ; preds = %3721
  %3730 = mul nuw nsw i64 %3722, 16
  %3731 = getelementptr inbounds i8, i8* %0, i64 %3730
  call void @llvm.memset.p0i8.i64(i8* align 1 %3731, i8 0, i64 16, i1 false)
  br label %3732

3732:                                             ; preds = %3729, %3721
  %3733 = add nuw nsw i64 %3722, 1
  %3734 = call zeroext i8 @randombit()
  %3735 = getelementptr inbounds i8, i8* %1, i64 %3733
  store i8 %3734, i8* %3735, align 1
  %3736 = getelementptr inbounds i8, i8* %1, i64 %3733
  %3737 = load i8, i8* %3736, align 1
  %3738 = zext i8 %3737 to i32
  %3739 = icmp eq i32 %3738, 0
  br i1 %3739, label %3740, label %3743

3740:                                             ; preds = %3732
  %3741 = mul nuw nsw i64 %3733, 16
  %3742 = getelementptr inbounds i8, i8* %0, i64 %3741
  call void @llvm.memset.p0i8.i64(i8* align 1 %3742, i8 0, i64 16, i1 false)
  br label %3743

3743:                                             ; preds = %3740, %3732
  %3744 = add nuw nsw i64 %3733, 1
  %3745 = call zeroext i8 @randombit()
  %3746 = getelementptr inbounds i8, i8* %1, i64 %3744
  store i8 %3745, i8* %3746, align 1
  %3747 = getelementptr inbounds i8, i8* %1, i64 %3744
  %3748 = load i8, i8* %3747, align 1
  %3749 = zext i8 %3748 to i32
  %3750 = icmp eq i32 %3749, 0
  br i1 %3750, label %3751, label %3754

3751:                                             ; preds = %3743
  %3752 = mul nuw nsw i64 %3744, 16
  %3753 = getelementptr inbounds i8, i8* %0, i64 %3752
  call void @llvm.memset.p0i8.i64(i8* align 1 %3753, i8 0, i64 16, i1 false)
  br label %3754

3754:                                             ; preds = %3751, %3743
  %3755 = add nuw nsw i64 %3744, 1
  %3756 = call zeroext i8 @randombit()
  %3757 = getelementptr inbounds i8, i8* %1, i64 %3755
  store i8 %3756, i8* %3757, align 1
  %3758 = getelementptr inbounds i8, i8* %1, i64 %3755
  %3759 = load i8, i8* %3758, align 1
  %3760 = zext i8 %3759 to i32
  %3761 = icmp eq i32 %3760, 0
  br i1 %3761, label %3762, label %3765

3762:                                             ; preds = %3754
  %3763 = mul nuw nsw i64 %3755, 16
  %3764 = getelementptr inbounds i8, i8* %0, i64 %3763
  call void @llvm.memset.p0i8.i64(i8* align 1 %3764, i8 0, i64 16, i1 false)
  br label %3765

3765:                                             ; preds = %3762, %3754
  %3766 = add nuw nsw i64 %3755, 1
  %3767 = call zeroext i8 @randombit()
  %3768 = getelementptr inbounds i8, i8* %1, i64 %3766
  store i8 %3767, i8* %3768, align 1
  %3769 = getelementptr inbounds i8, i8* %1, i64 %3766
  %3770 = load i8, i8* %3769, align 1
  %3771 = zext i8 %3770 to i32
  %3772 = icmp eq i32 %3771, 0
  br i1 %3772, label %3773, label %3776

3773:                                             ; preds = %3765
  %3774 = mul nuw nsw i64 %3766, 16
  %3775 = getelementptr inbounds i8, i8* %0, i64 %3774
  call void @llvm.memset.p0i8.i64(i8* align 1 %3775, i8 0, i64 16, i1 false)
  br label %3776

3776:                                             ; preds = %3773, %3765
  %3777 = add nuw nsw i64 %3766, 1
  %3778 = call zeroext i8 @randombit()
  %3779 = getelementptr inbounds i8, i8* %1, i64 %3777
  store i8 %3778, i8* %3779, align 1
  %3780 = getelementptr inbounds i8, i8* %1, i64 %3777
  %3781 = load i8, i8* %3780, align 1
  %3782 = zext i8 %3781 to i32
  %3783 = icmp eq i32 %3782, 0
  br i1 %3783, label %3784, label %3787

3784:                                             ; preds = %3776
  %3785 = mul nuw nsw i64 %3777, 16
  %3786 = getelementptr inbounds i8, i8* %0, i64 %3785
  call void @llvm.memset.p0i8.i64(i8* align 1 %3786, i8 0, i64 16, i1 false)
  br label %3787

3787:                                             ; preds = %3784, %3776
  %3788 = add nuw nsw i64 %3777, 1
  %3789 = call zeroext i8 @randombit()
  %3790 = getelementptr inbounds i8, i8* %1, i64 %3788
  store i8 %3789, i8* %3790, align 1
  %3791 = getelementptr inbounds i8, i8* %1, i64 %3788
  %3792 = load i8, i8* %3791, align 1
  %3793 = zext i8 %3792 to i32
  %3794 = icmp eq i32 %3793, 0
  br i1 %3794, label %3795, label %3798

3795:                                             ; preds = %3787
  %3796 = mul nuw nsw i64 %3788, 16
  %3797 = getelementptr inbounds i8, i8* %0, i64 %3796
  call void @llvm.memset.p0i8.i64(i8* align 1 %3797, i8 0, i64 16, i1 false)
  br label %3798

3798:                                             ; preds = %3795, %3787
  %3799 = add nuw nsw i64 %3788, 1
  %3800 = call zeroext i8 @randombit()
  %3801 = getelementptr inbounds i8, i8* %1, i64 %3799
  store i8 %3800, i8* %3801, align 1
  %3802 = getelementptr inbounds i8, i8* %1, i64 %3799
  %3803 = load i8, i8* %3802, align 1
  %3804 = zext i8 %3803 to i32
  %3805 = icmp eq i32 %3804, 0
  br i1 %3805, label %3806, label %3809

3806:                                             ; preds = %3798
  %3807 = mul nuw nsw i64 %3799, 16
  %3808 = getelementptr inbounds i8, i8* %0, i64 %3807
  call void @llvm.memset.p0i8.i64(i8* align 1 %3808, i8 0, i64 16, i1 false)
  br label %3809

3809:                                             ; preds = %3806, %3798
  %3810 = add nuw nsw i64 %3799, 1
  %3811 = call zeroext i8 @randombit()
  %3812 = getelementptr inbounds i8, i8* %1, i64 %3810
  store i8 %3811, i8* %3812, align 1
  %3813 = getelementptr inbounds i8, i8* %1, i64 %3810
  %3814 = load i8, i8* %3813, align 1
  %3815 = zext i8 %3814 to i32
  %3816 = icmp eq i32 %3815, 0
  br i1 %3816, label %3817, label %3820

3817:                                             ; preds = %3809
  %3818 = mul nuw nsw i64 %3810, 16
  %3819 = getelementptr inbounds i8, i8* %0, i64 %3818
  call void @llvm.memset.p0i8.i64(i8* align 1 %3819, i8 0, i64 16, i1 false)
  br label %3820

3820:                                             ; preds = %3817, %3809
  %3821 = add nuw nsw i64 %3810, 1
  %3822 = call zeroext i8 @randombit()
  %3823 = getelementptr inbounds i8, i8* %1, i64 %3821
  store i8 %3822, i8* %3823, align 1
  %3824 = getelementptr inbounds i8, i8* %1, i64 %3821
  %3825 = load i8, i8* %3824, align 1
  %3826 = zext i8 %3825 to i32
  %3827 = icmp eq i32 %3826, 0
  br i1 %3827, label %3828, label %3831

3828:                                             ; preds = %3820
  %3829 = mul nuw nsw i64 %3821, 16
  %3830 = getelementptr inbounds i8, i8* %0, i64 %3829
  call void @llvm.memset.p0i8.i64(i8* align 1 %3830, i8 0, i64 16, i1 false)
  br label %3831

3831:                                             ; preds = %3828, %3820
  %3832 = add nuw nsw i64 %3821, 1
  %3833 = call zeroext i8 @randombit()
  %3834 = getelementptr inbounds i8, i8* %1, i64 %3832
  store i8 %3833, i8* %3834, align 1
  %3835 = getelementptr inbounds i8, i8* %1, i64 %3832
  %3836 = load i8, i8* %3835, align 1
  %3837 = zext i8 %3836 to i32
  %3838 = icmp eq i32 %3837, 0
  br i1 %3838, label %3839, label %3842

3839:                                             ; preds = %3831
  %3840 = mul nuw nsw i64 %3832, 16
  %3841 = getelementptr inbounds i8, i8* %0, i64 %3840
  call void @llvm.memset.p0i8.i64(i8* align 1 %3841, i8 0, i64 16, i1 false)
  br label %3842

3842:                                             ; preds = %3839, %3831
  %3843 = add nuw nsw i64 %3832, 1
  %3844 = call zeroext i8 @randombit()
  %3845 = getelementptr inbounds i8, i8* %1, i64 %3843
  store i8 %3844, i8* %3845, align 1
  %3846 = getelementptr inbounds i8, i8* %1, i64 %3843
  %3847 = load i8, i8* %3846, align 1
  %3848 = zext i8 %3847 to i32
  %3849 = icmp eq i32 %3848, 0
  br i1 %3849, label %3850, label %3853

3850:                                             ; preds = %3842
  %3851 = mul nuw nsw i64 %3843, 16
  %3852 = getelementptr inbounds i8, i8* %0, i64 %3851
  call void @llvm.memset.p0i8.i64(i8* align 1 %3852, i8 0, i64 16, i1 false)
  br label %3853

3853:                                             ; preds = %3850, %3842
  %3854 = add nuw nsw i64 %3843, 1
  %3855 = call zeroext i8 @randombit()
  %3856 = getelementptr inbounds i8, i8* %1, i64 %3854
  store i8 %3855, i8* %3856, align 1
  %3857 = getelementptr inbounds i8, i8* %1, i64 %3854
  %3858 = load i8, i8* %3857, align 1
  %3859 = zext i8 %3858 to i32
  %3860 = icmp eq i32 %3859, 0
  br i1 %3860, label %3861, label %3864

3861:                                             ; preds = %3853
  %3862 = mul nuw nsw i64 %3854, 16
  %3863 = getelementptr inbounds i8, i8* %0, i64 %3862
  call void @llvm.memset.p0i8.i64(i8* align 1 %3863, i8 0, i64 16, i1 false)
  br label %3864

3864:                                             ; preds = %3861, %3853
  %3865 = add nuw nsw i64 %3854, 1
  %3866 = call zeroext i8 @randombit()
  %3867 = getelementptr inbounds i8, i8* %1, i64 %3865
  store i8 %3866, i8* %3867, align 1
  %3868 = getelementptr inbounds i8, i8* %1, i64 %3865
  %3869 = load i8, i8* %3868, align 1
  %3870 = zext i8 %3869 to i32
  %3871 = icmp eq i32 %3870, 0
  br i1 %3871, label %3872, label %3875

3872:                                             ; preds = %3864
  %3873 = mul nuw nsw i64 %3865, 16
  %3874 = getelementptr inbounds i8, i8* %0, i64 %3873
  call void @llvm.memset.p0i8.i64(i8* align 1 %3874, i8 0, i64 16, i1 false)
  br label %3875

3875:                                             ; preds = %3872, %3864
  %3876 = add nuw nsw i64 %3865, 1
  %3877 = call zeroext i8 @randombit()
  %3878 = getelementptr inbounds i8, i8* %1, i64 %3876
  store i8 %3877, i8* %3878, align 1
  %3879 = getelementptr inbounds i8, i8* %1, i64 %3876
  %3880 = load i8, i8* %3879, align 1
  %3881 = zext i8 %3880 to i32
  %3882 = icmp eq i32 %3881, 0
  br i1 %3882, label %3883, label %3886

3883:                                             ; preds = %3875
  %3884 = mul nuw nsw i64 %3876, 16
  %3885 = getelementptr inbounds i8, i8* %0, i64 %3884
  call void @llvm.memset.p0i8.i64(i8* align 1 %3885, i8 0, i64 16, i1 false)
  br label %3886

3886:                                             ; preds = %3883, %3875
  %3887 = add nuw nsw i64 %3876, 1
  %3888 = call zeroext i8 @randombit()
  %3889 = getelementptr inbounds i8, i8* %1, i64 %3887
  store i8 %3888, i8* %3889, align 1
  %3890 = getelementptr inbounds i8, i8* %1, i64 %3887
  %3891 = load i8, i8* %3890, align 1
  %3892 = zext i8 %3891 to i32
  %3893 = icmp eq i32 %3892, 0
  br i1 %3893, label %3894, label %3897

3894:                                             ; preds = %3886
  %3895 = mul nuw nsw i64 %3887, 16
  %3896 = getelementptr inbounds i8, i8* %0, i64 %3895
  call void @llvm.memset.p0i8.i64(i8* align 1 %3896, i8 0, i64 16, i1 false)
  br label %3897

3897:                                             ; preds = %3894, %3886
  %3898 = add nuw nsw i64 %3887, 1
  %3899 = call zeroext i8 @randombit()
  %3900 = getelementptr inbounds i8, i8* %1, i64 %3898
  store i8 %3899, i8* %3900, align 1
  %3901 = getelementptr inbounds i8, i8* %1, i64 %3898
  %3902 = load i8, i8* %3901, align 1
  %3903 = zext i8 %3902 to i32
  %3904 = icmp eq i32 %3903, 0
  br i1 %3904, label %3905, label %3908

3905:                                             ; preds = %3897
  %3906 = mul nuw nsw i64 %3898, 16
  %3907 = getelementptr inbounds i8, i8* %0, i64 %3906
  call void @llvm.memset.p0i8.i64(i8* align 1 %3907, i8 0, i64 16, i1 false)
  br label %3908

3908:                                             ; preds = %3905, %3897
  %3909 = add nuw nsw i64 %3898, 1
  %3910 = call zeroext i8 @randombit()
  %3911 = getelementptr inbounds i8, i8* %1, i64 %3909
  store i8 %3910, i8* %3911, align 1
  %3912 = getelementptr inbounds i8, i8* %1, i64 %3909
  %3913 = load i8, i8* %3912, align 1
  %3914 = zext i8 %3913 to i32
  %3915 = icmp eq i32 %3914, 0
  br i1 %3915, label %3916, label %3919

3916:                                             ; preds = %3908
  %3917 = mul nuw nsw i64 %3909, 16
  %3918 = getelementptr inbounds i8, i8* %0, i64 %3917
  call void @llvm.memset.p0i8.i64(i8* align 1 %3918, i8 0, i64 16, i1 false)
  br label %3919

3919:                                             ; preds = %3916, %3908
  %3920 = add nuw nsw i64 %3909, 1
  %3921 = call zeroext i8 @randombit()
  %3922 = getelementptr inbounds i8, i8* %1, i64 %3920
  store i8 %3921, i8* %3922, align 1
  %3923 = getelementptr inbounds i8, i8* %1, i64 %3920
  %3924 = load i8, i8* %3923, align 1
  %3925 = zext i8 %3924 to i32
  %3926 = icmp eq i32 %3925, 0
  br i1 %3926, label %3927, label %3930

3927:                                             ; preds = %3919
  %3928 = mul nuw nsw i64 %3920, 16
  %3929 = getelementptr inbounds i8, i8* %0, i64 %3928
  call void @llvm.memset.p0i8.i64(i8* align 1 %3929, i8 0, i64 16, i1 false)
  br label %3930

3930:                                             ; preds = %3927, %3919
  %3931 = add nuw nsw i64 %3920, 1
  %3932 = call zeroext i8 @randombit()
  %3933 = getelementptr inbounds i8, i8* %1, i64 %3931
  store i8 %3932, i8* %3933, align 1
  %3934 = getelementptr inbounds i8, i8* %1, i64 %3931
  %3935 = load i8, i8* %3934, align 1
  %3936 = zext i8 %3935 to i32
  %3937 = icmp eq i32 %3936, 0
  br i1 %3937, label %3938, label %3941

3938:                                             ; preds = %3930
  %3939 = mul nuw nsw i64 %3931, 16
  %3940 = getelementptr inbounds i8, i8* %0, i64 %3939
  call void @llvm.memset.p0i8.i64(i8* align 1 %3940, i8 0, i64 16, i1 false)
  br label %3941

3941:                                             ; preds = %3938, %3930
  %3942 = add nuw nsw i64 %3931, 1
  %3943 = call zeroext i8 @randombit()
  %3944 = getelementptr inbounds i8, i8* %1, i64 %3942
  store i8 %3943, i8* %3944, align 1
  %3945 = getelementptr inbounds i8, i8* %1, i64 %3942
  %3946 = load i8, i8* %3945, align 1
  %3947 = zext i8 %3946 to i32
  %3948 = icmp eq i32 %3947, 0
  br i1 %3948, label %3949, label %3952

3949:                                             ; preds = %3941
  %3950 = mul nuw nsw i64 %3942, 16
  %3951 = getelementptr inbounds i8, i8* %0, i64 %3950
  call void @llvm.memset.p0i8.i64(i8* align 1 %3951, i8 0, i64 16, i1 false)
  br label %3952

3952:                                             ; preds = %3949, %3941
  %3953 = add nuw nsw i64 %3942, 1
  %3954 = call zeroext i8 @randombit()
  %3955 = getelementptr inbounds i8, i8* %1, i64 %3953
  store i8 %3954, i8* %3955, align 1
  %3956 = getelementptr inbounds i8, i8* %1, i64 %3953
  %3957 = load i8, i8* %3956, align 1
  %3958 = zext i8 %3957 to i32
  %3959 = icmp eq i32 %3958, 0
  br i1 %3959, label %3960, label %3963

3960:                                             ; preds = %3952
  %3961 = mul nuw nsw i64 %3953, 16
  %3962 = getelementptr inbounds i8, i8* %0, i64 %3961
  call void @llvm.memset.p0i8.i64(i8* align 1 %3962, i8 0, i64 16, i1 false)
  br label %3963

3963:                                             ; preds = %3960, %3952
  %3964 = add nuw nsw i64 %3953, 1
  %3965 = call zeroext i8 @randombit()
  %3966 = getelementptr inbounds i8, i8* %1, i64 %3964
  store i8 %3965, i8* %3966, align 1
  %3967 = getelementptr inbounds i8, i8* %1, i64 %3964
  %3968 = load i8, i8* %3967, align 1
  %3969 = zext i8 %3968 to i32
  %3970 = icmp eq i32 %3969, 0
  br i1 %3970, label %3971, label %3974

3971:                                             ; preds = %3963
  %3972 = mul nuw nsw i64 %3964, 16
  %3973 = getelementptr inbounds i8, i8* %0, i64 %3972
  call void @llvm.memset.p0i8.i64(i8* align 1 %3973, i8 0, i64 16, i1 false)
  br label %3974

3974:                                             ; preds = %3971, %3963
  %3975 = add nuw nsw i64 %3964, 1
  %3976 = call zeroext i8 @randombit()
  %3977 = getelementptr inbounds i8, i8* %1, i64 %3975
  store i8 %3976, i8* %3977, align 1
  %3978 = getelementptr inbounds i8, i8* %1, i64 %3975
  %3979 = load i8, i8* %3978, align 1
  %3980 = zext i8 %3979 to i32
  %3981 = icmp eq i32 %3980, 0
  br i1 %3981, label %3982, label %3985

3982:                                             ; preds = %3974
  %3983 = mul nuw nsw i64 %3975, 16
  %3984 = getelementptr inbounds i8, i8* %0, i64 %3983
  call void @llvm.memset.p0i8.i64(i8* align 1 %3984, i8 0, i64 16, i1 false)
  br label %3985

3985:                                             ; preds = %3982, %3974
  %3986 = add nuw nsw i64 %3975, 1
  %3987 = call zeroext i8 @randombit()
  %3988 = getelementptr inbounds i8, i8* %1, i64 %3986
  store i8 %3987, i8* %3988, align 1
  %3989 = getelementptr inbounds i8, i8* %1, i64 %3986
  %3990 = load i8, i8* %3989, align 1
  %3991 = zext i8 %3990 to i32
  %3992 = icmp eq i32 %3991, 0
  br i1 %3992, label %3993, label %3996

3993:                                             ; preds = %3985
  %3994 = mul nuw nsw i64 %3986, 16
  %3995 = getelementptr inbounds i8, i8* %0, i64 %3994
  call void @llvm.memset.p0i8.i64(i8* align 1 %3995, i8 0, i64 16, i1 false)
  br label %3996

3996:                                             ; preds = %3993, %3985
  %3997 = add nuw nsw i64 %3986, 1
  %3998 = call zeroext i8 @randombit()
  %3999 = getelementptr inbounds i8, i8* %1, i64 %3997
  store i8 %3998, i8* %3999, align 1
  %4000 = getelementptr inbounds i8, i8* %1, i64 %3997
  %4001 = load i8, i8* %4000, align 1
  %4002 = zext i8 %4001 to i32
  %4003 = icmp eq i32 %4002, 0
  br i1 %4003, label %4004, label %4007

4004:                                             ; preds = %3996
  %4005 = mul nuw nsw i64 %3997, 16
  %4006 = getelementptr inbounds i8, i8* %0, i64 %4005
  call void @llvm.memset.p0i8.i64(i8* align 1 %4006, i8 0, i64 16, i1 false)
  br label %4007

4007:                                             ; preds = %4004, %3996
  %4008 = add nuw nsw i64 %3997, 1
  %4009 = call zeroext i8 @randombit()
  %4010 = getelementptr inbounds i8, i8* %1, i64 %4008
  store i8 %4009, i8* %4010, align 1
  %4011 = getelementptr inbounds i8, i8* %1, i64 %4008
  %4012 = load i8, i8* %4011, align 1
  %4013 = zext i8 %4012 to i32
  %4014 = icmp eq i32 %4013, 0
  br i1 %4014, label %4015, label %4018

4015:                                             ; preds = %4007
  %4016 = mul nuw nsw i64 %4008, 16
  %4017 = getelementptr inbounds i8, i8* %0, i64 %4016
  call void @llvm.memset.p0i8.i64(i8* align 1 %4017, i8 0, i64 16, i1 false)
  br label %4018

4018:                                             ; preds = %4015, %4007
  %4019 = add nuw nsw i64 %4008, 1
  %4020 = call zeroext i8 @randombit()
  %4021 = getelementptr inbounds i8, i8* %1, i64 %4019
  store i8 %4020, i8* %4021, align 1
  %4022 = getelementptr inbounds i8, i8* %1, i64 %4019
  %4023 = load i8, i8* %4022, align 1
  %4024 = zext i8 %4023 to i32
  %4025 = icmp eq i32 %4024, 0
  br i1 %4025, label %4026, label %4029

4026:                                             ; preds = %4018
  %4027 = mul nuw nsw i64 %4019, 16
  %4028 = getelementptr inbounds i8, i8* %0, i64 %4027
  call void @llvm.memset.p0i8.i64(i8* align 1 %4028, i8 0, i64 16, i1 false)
  br label %4029

4029:                                             ; preds = %4026, %4018
  %4030 = add nuw nsw i64 %4019, 1
  %4031 = call zeroext i8 @randombit()
  %4032 = getelementptr inbounds i8, i8* %1, i64 %4030
  store i8 %4031, i8* %4032, align 1
  %4033 = getelementptr inbounds i8, i8* %1, i64 %4030
  %4034 = load i8, i8* %4033, align 1
  %4035 = zext i8 %4034 to i32
  %4036 = icmp eq i32 %4035, 0
  br i1 %4036, label %4037, label %4040

4037:                                             ; preds = %4029
  %4038 = mul nuw nsw i64 %4030, 16
  %4039 = getelementptr inbounds i8, i8* %0, i64 %4038
  call void @llvm.memset.p0i8.i64(i8* align 1 %4039, i8 0, i64 16, i1 false)
  br label %4040

4040:                                             ; preds = %4037, %4029
  %4041 = add nuw nsw i64 %4030, 1
  %4042 = call zeroext i8 @randombit()
  %4043 = getelementptr inbounds i8, i8* %1, i64 %4041
  store i8 %4042, i8* %4043, align 1
  %4044 = getelementptr inbounds i8, i8* %1, i64 %4041
  %4045 = load i8, i8* %4044, align 1
  %4046 = zext i8 %4045 to i32
  %4047 = icmp eq i32 %4046, 0
  br i1 %4047, label %4048, label %4051

4048:                                             ; preds = %4040
  %4049 = mul nuw nsw i64 %4041, 16
  %4050 = getelementptr inbounds i8, i8* %0, i64 %4049
  call void @llvm.memset.p0i8.i64(i8* align 1 %4050, i8 0, i64 16, i1 false)
  br label %4051

4051:                                             ; preds = %4048, %4040
  %4052 = add nuw nsw i64 %4041, 1
  %4053 = call zeroext i8 @randombit()
  %4054 = getelementptr inbounds i8, i8* %1, i64 %4052
  store i8 %4053, i8* %4054, align 1
  %4055 = getelementptr inbounds i8, i8* %1, i64 %4052
  %4056 = load i8, i8* %4055, align 1
  %4057 = zext i8 %4056 to i32
  %4058 = icmp eq i32 %4057, 0
  br i1 %4058, label %4059, label %4062

4059:                                             ; preds = %4051
  %4060 = mul nuw nsw i64 %4052, 16
  %4061 = getelementptr inbounds i8, i8* %0, i64 %4060
  call void @llvm.memset.p0i8.i64(i8* align 1 %4061, i8 0, i64 16, i1 false)
  br label %4062

4062:                                             ; preds = %4059, %4051
  %4063 = add nuw nsw i64 %4052, 1
  %4064 = call zeroext i8 @randombit()
  %4065 = getelementptr inbounds i8, i8* %1, i64 %4063
  store i8 %4064, i8* %4065, align 1
  %4066 = getelementptr inbounds i8, i8* %1, i64 %4063
  %4067 = load i8, i8* %4066, align 1
  %4068 = zext i8 %4067 to i32
  %4069 = icmp eq i32 %4068, 0
  br i1 %4069, label %4070, label %4073

4070:                                             ; preds = %4062
  %4071 = mul nuw nsw i64 %4063, 16
  %4072 = getelementptr inbounds i8, i8* %0, i64 %4071
  call void @llvm.memset.p0i8.i64(i8* align 1 %4072, i8 0, i64 16, i1 false)
  br label %4073

4073:                                             ; preds = %4070, %4062
  %4074 = add nuw nsw i64 %4063, 1
  %4075 = call zeroext i8 @randombit()
  %4076 = getelementptr inbounds i8, i8* %1, i64 %4074
  store i8 %4075, i8* %4076, align 1
  %4077 = getelementptr inbounds i8, i8* %1, i64 %4074
  %4078 = load i8, i8* %4077, align 1
  %4079 = zext i8 %4078 to i32
  %4080 = icmp eq i32 %4079, 0
  br i1 %4080, label %4081, label %4084

4081:                                             ; preds = %4073
  %4082 = mul nuw nsw i64 %4074, 16
  %4083 = getelementptr inbounds i8, i8* %0, i64 %4082
  call void @llvm.memset.p0i8.i64(i8* align 1 %4083, i8 0, i64 16, i1 false)
  br label %4084

4084:                                             ; preds = %4081, %4073
  %4085 = add nuw nsw i64 %4074, 1
  %4086 = call zeroext i8 @randombit()
  %4087 = getelementptr inbounds i8, i8* %1, i64 %4085
  store i8 %4086, i8* %4087, align 1
  %4088 = getelementptr inbounds i8, i8* %1, i64 %4085
  %4089 = load i8, i8* %4088, align 1
  %4090 = zext i8 %4089 to i32
  %4091 = icmp eq i32 %4090, 0
  br i1 %4091, label %4092, label %4095

4092:                                             ; preds = %4084
  %4093 = mul nuw nsw i64 %4085, 16
  %4094 = getelementptr inbounds i8, i8* %0, i64 %4093
  call void @llvm.memset.p0i8.i64(i8* align 1 %4094, i8 0, i64 16, i1 false)
  br label %4095

4095:                                             ; preds = %4092, %4084
  %4096 = add nuw nsw i64 %4085, 1
  %4097 = call zeroext i8 @randombit()
  %4098 = getelementptr inbounds i8, i8* %1, i64 %4096
  store i8 %4097, i8* %4098, align 1
  %4099 = getelementptr inbounds i8, i8* %1, i64 %4096
  %4100 = load i8, i8* %4099, align 1
  %4101 = zext i8 %4100 to i32
  %4102 = icmp eq i32 %4101, 0
  br i1 %4102, label %4103, label %4106

4103:                                             ; preds = %4095
  %4104 = mul nuw nsw i64 %4096, 16
  %4105 = getelementptr inbounds i8, i8* %0, i64 %4104
  call void @llvm.memset.p0i8.i64(i8* align 1 %4105, i8 0, i64 16, i1 false)
  br label %4106

4106:                                             ; preds = %4103, %4095
  %4107 = add nuw nsw i64 %4096, 1
  %4108 = call zeroext i8 @randombit()
  %4109 = getelementptr inbounds i8, i8* %1, i64 %4107
  store i8 %4108, i8* %4109, align 1
  %4110 = getelementptr inbounds i8, i8* %1, i64 %4107
  %4111 = load i8, i8* %4110, align 1
  %4112 = zext i8 %4111 to i32
  %4113 = icmp eq i32 %4112, 0
  br i1 %4113, label %4114, label %4117

4114:                                             ; preds = %4106
  %4115 = mul nuw nsw i64 %4107, 16
  %4116 = getelementptr inbounds i8, i8* %0, i64 %4115
  call void @llvm.memset.p0i8.i64(i8* align 1 %4116, i8 0, i64 16, i1 false)
  br label %4117

4117:                                             ; preds = %4114, %4106
  %4118 = add nuw nsw i64 %4107, 1
  %4119 = call zeroext i8 @randombit()
  %4120 = getelementptr inbounds i8, i8* %1, i64 %4118
  store i8 %4119, i8* %4120, align 1
  %4121 = getelementptr inbounds i8, i8* %1, i64 %4118
  %4122 = load i8, i8* %4121, align 1
  %4123 = zext i8 %4122 to i32
  %4124 = icmp eq i32 %4123, 0
  br i1 %4124, label %4125, label %4128

4125:                                             ; preds = %4117
  %4126 = mul nuw nsw i64 %4118, 16
  %4127 = getelementptr inbounds i8, i8* %0, i64 %4126
  call void @llvm.memset.p0i8.i64(i8* align 1 %4127, i8 0, i64 16, i1 false)
  br label %4128

4128:                                             ; preds = %4125, %4117
  %4129 = add nuw nsw i64 %4118, 1
  %4130 = call zeroext i8 @randombit()
  %4131 = getelementptr inbounds i8, i8* %1, i64 %4129
  store i8 %4130, i8* %4131, align 1
  %4132 = getelementptr inbounds i8, i8* %1, i64 %4129
  %4133 = load i8, i8* %4132, align 1
  %4134 = zext i8 %4133 to i32
  %4135 = icmp eq i32 %4134, 0
  br i1 %4135, label %4136, label %4139

4136:                                             ; preds = %4128
  %4137 = mul nuw nsw i64 %4129, 16
  %4138 = getelementptr inbounds i8, i8* %0, i64 %4137
  call void @llvm.memset.p0i8.i64(i8* align 1 %4138, i8 0, i64 16, i1 false)
  br label %4139

4139:                                             ; preds = %4136, %4128
  %4140 = add nuw nsw i64 %4129, 1
  %4141 = call zeroext i8 @randombit()
  %4142 = getelementptr inbounds i8, i8* %1, i64 %4140
  store i8 %4141, i8* %4142, align 1
  %4143 = getelementptr inbounds i8, i8* %1, i64 %4140
  %4144 = load i8, i8* %4143, align 1
  %4145 = zext i8 %4144 to i32
  %4146 = icmp eq i32 %4145, 0
  br i1 %4146, label %4147, label %4150

4147:                                             ; preds = %4139
  %4148 = mul nuw nsw i64 %4140, 16
  %4149 = getelementptr inbounds i8, i8* %0, i64 %4148
  call void @llvm.memset.p0i8.i64(i8* align 1 %4149, i8 0, i64 16, i1 false)
  br label %4150

4150:                                             ; preds = %4147, %4139
  %4151 = add nuw nsw i64 %4140, 1
  %4152 = call zeroext i8 @randombit()
  %4153 = getelementptr inbounds i8, i8* %1, i64 %4151
  store i8 %4152, i8* %4153, align 1
  %4154 = getelementptr inbounds i8, i8* %1, i64 %4151
  %4155 = load i8, i8* %4154, align 1
  %4156 = zext i8 %4155 to i32
  %4157 = icmp eq i32 %4156, 0
  br i1 %4157, label %4158, label %4161

4158:                                             ; preds = %4150
  %4159 = mul nuw nsw i64 %4151, 16
  %4160 = getelementptr inbounds i8, i8* %0, i64 %4159
  call void @llvm.memset.p0i8.i64(i8* align 1 %4160, i8 0, i64 16, i1 false)
  br label %4161

4161:                                             ; preds = %4158, %4150
  %4162 = add nuw nsw i64 %4151, 1
  %4163 = call zeroext i8 @randombit()
  %4164 = getelementptr inbounds i8, i8* %1, i64 %4162
  store i8 %4163, i8* %4164, align 1
  %4165 = getelementptr inbounds i8, i8* %1, i64 %4162
  %4166 = load i8, i8* %4165, align 1
  %4167 = zext i8 %4166 to i32
  %4168 = icmp eq i32 %4167, 0
  br i1 %4168, label %4169, label %4172

4169:                                             ; preds = %4161
  %4170 = mul nuw nsw i64 %4162, 16
  %4171 = getelementptr inbounds i8, i8* %0, i64 %4170
  call void @llvm.memset.p0i8.i64(i8* align 1 %4171, i8 0, i64 16, i1 false)
  br label %4172

4172:                                             ; preds = %4169, %4161
  %4173 = add nuw nsw i64 %4162, 1
  %4174 = call zeroext i8 @randombit()
  %4175 = getelementptr inbounds i8, i8* %1, i64 %4173
  store i8 %4174, i8* %4175, align 1
  %4176 = getelementptr inbounds i8, i8* %1, i64 %4173
  %4177 = load i8, i8* %4176, align 1
  %4178 = zext i8 %4177 to i32
  %4179 = icmp eq i32 %4178, 0
  br i1 %4179, label %4180, label %4183

4180:                                             ; preds = %4172
  %4181 = mul nuw nsw i64 %4173, 16
  %4182 = getelementptr inbounds i8, i8* %0, i64 %4181
  call void @llvm.memset.p0i8.i64(i8* align 1 %4182, i8 0, i64 16, i1 false)
  br label %4183

4183:                                             ; preds = %4180, %4172
  %4184 = add nuw nsw i64 %4173, 1
  %4185 = call zeroext i8 @randombit()
  %4186 = getelementptr inbounds i8, i8* %1, i64 %4184
  store i8 %4185, i8* %4186, align 1
  %4187 = getelementptr inbounds i8, i8* %1, i64 %4184
  %4188 = load i8, i8* %4187, align 1
  %4189 = zext i8 %4188 to i32
  %4190 = icmp eq i32 %4189, 0
  br i1 %4190, label %4191, label %4194

4191:                                             ; preds = %4183
  %4192 = mul nuw nsw i64 %4184, 16
  %4193 = getelementptr inbounds i8, i8* %0, i64 %4192
  call void @llvm.memset.p0i8.i64(i8* align 1 %4193, i8 0, i64 16, i1 false)
  br label %4194

4194:                                             ; preds = %4191, %4183
  %4195 = add nuw nsw i64 %4184, 1
  %4196 = call zeroext i8 @randombit()
  %4197 = getelementptr inbounds i8, i8* %1, i64 %4195
  store i8 %4196, i8* %4197, align 1
  %4198 = getelementptr inbounds i8, i8* %1, i64 %4195
  %4199 = load i8, i8* %4198, align 1
  %4200 = zext i8 %4199 to i32
  %4201 = icmp eq i32 %4200, 0
  br i1 %4201, label %4202, label %4205

4202:                                             ; preds = %4194
  %4203 = mul nuw nsw i64 %4195, 16
  %4204 = getelementptr inbounds i8, i8* %0, i64 %4203
  call void @llvm.memset.p0i8.i64(i8* align 1 %4204, i8 0, i64 16, i1 false)
  br label %4205

4205:                                             ; preds = %4202, %4194
  %4206 = add nuw nsw i64 %4195, 1
  %4207 = call zeroext i8 @randombit()
  %4208 = getelementptr inbounds i8, i8* %1, i64 %4206
  store i8 %4207, i8* %4208, align 1
  %4209 = getelementptr inbounds i8, i8* %1, i64 %4206
  %4210 = load i8, i8* %4209, align 1
  %4211 = zext i8 %4210 to i32
  %4212 = icmp eq i32 %4211, 0
  br i1 %4212, label %4213, label %4216

4213:                                             ; preds = %4205
  %4214 = mul nuw nsw i64 %4206, 16
  %4215 = getelementptr inbounds i8, i8* %0, i64 %4214
  call void @llvm.memset.p0i8.i64(i8* align 1 %4215, i8 0, i64 16, i1 false)
  br label %4216

4216:                                             ; preds = %4213, %4205
  %4217 = add nuw nsw i64 %4206, 1
  %4218 = call zeroext i8 @randombit()
  %4219 = getelementptr inbounds i8, i8* %1, i64 %4217
  store i8 %4218, i8* %4219, align 1
  %4220 = getelementptr inbounds i8, i8* %1, i64 %4217
  %4221 = load i8, i8* %4220, align 1
  %4222 = zext i8 %4221 to i32
  %4223 = icmp eq i32 %4222, 0
  br i1 %4223, label %4224, label %4227

4224:                                             ; preds = %4216
  %4225 = mul nuw nsw i64 %4217, 16
  %4226 = getelementptr inbounds i8, i8* %0, i64 %4225
  call void @llvm.memset.p0i8.i64(i8* align 1 %4226, i8 0, i64 16, i1 false)
  br label %4227

4227:                                             ; preds = %4224, %4216
  %4228 = add nuw nsw i64 %4217, 1
  %4229 = call zeroext i8 @randombit()
  %4230 = getelementptr inbounds i8, i8* %1, i64 %4228
  store i8 %4229, i8* %4230, align 1
  %4231 = getelementptr inbounds i8, i8* %1, i64 %4228
  %4232 = load i8, i8* %4231, align 1
  %4233 = zext i8 %4232 to i32
  %4234 = icmp eq i32 %4233, 0
  br i1 %4234, label %4235, label %4238

4235:                                             ; preds = %4227
  %4236 = mul nuw nsw i64 %4228, 16
  %4237 = getelementptr inbounds i8, i8* %0, i64 %4236
  call void @llvm.memset.p0i8.i64(i8* align 1 %4237, i8 0, i64 16, i1 false)
  br label %4238

4238:                                             ; preds = %4235, %4227
  %4239 = add nuw nsw i64 %4228, 1
  %4240 = call zeroext i8 @randombit()
  %4241 = getelementptr inbounds i8, i8* %1, i64 %4239
  store i8 %4240, i8* %4241, align 1
  %4242 = getelementptr inbounds i8, i8* %1, i64 %4239
  %4243 = load i8, i8* %4242, align 1
  %4244 = zext i8 %4243 to i32
  %4245 = icmp eq i32 %4244, 0
  br i1 %4245, label %4246, label %4249

4246:                                             ; preds = %4238
  %4247 = mul nuw nsw i64 %4239, 16
  %4248 = getelementptr inbounds i8, i8* %0, i64 %4247
  call void @llvm.memset.p0i8.i64(i8* align 1 %4248, i8 0, i64 16, i1 false)
  br label %4249

4249:                                             ; preds = %4246, %4238
  %4250 = add nuw nsw i64 %4239, 1
  %4251 = call zeroext i8 @randombit()
  %4252 = getelementptr inbounds i8, i8* %1, i64 %4250
  store i8 %4251, i8* %4252, align 1
  %4253 = getelementptr inbounds i8, i8* %1, i64 %4250
  %4254 = load i8, i8* %4253, align 1
  %4255 = zext i8 %4254 to i32
  %4256 = icmp eq i32 %4255, 0
  br i1 %4256, label %4257, label %4260

4257:                                             ; preds = %4249
  %4258 = mul nuw nsw i64 %4250, 16
  %4259 = getelementptr inbounds i8, i8* %0, i64 %4258
  call void @llvm.memset.p0i8.i64(i8* align 1 %4259, i8 0, i64 16, i1 false)
  br label %4260

4260:                                             ; preds = %4257, %4249
  %4261 = add nuw nsw i64 %4250, 1
  %4262 = call zeroext i8 @randombit()
  %4263 = getelementptr inbounds i8, i8* %1, i64 %4261
  store i8 %4262, i8* %4263, align 1
  %4264 = getelementptr inbounds i8, i8* %1, i64 %4261
  %4265 = load i8, i8* %4264, align 1
  %4266 = zext i8 %4265 to i32
  %4267 = icmp eq i32 %4266, 0
  br i1 %4267, label %4268, label %4271

4268:                                             ; preds = %4260
  %4269 = mul nuw nsw i64 %4261, 16
  %4270 = getelementptr inbounds i8, i8* %0, i64 %4269
  call void @llvm.memset.p0i8.i64(i8* align 1 %4270, i8 0, i64 16, i1 false)
  br label %4271

4271:                                             ; preds = %4268, %4260
  %4272 = add nuw nsw i64 %4261, 1
  %4273 = call zeroext i8 @randombit()
  %4274 = getelementptr inbounds i8, i8* %1, i64 %4272
  store i8 %4273, i8* %4274, align 1
  %4275 = getelementptr inbounds i8, i8* %1, i64 %4272
  %4276 = load i8, i8* %4275, align 1
  %4277 = zext i8 %4276 to i32
  %4278 = icmp eq i32 %4277, 0
  br i1 %4278, label %4279, label %4282

4279:                                             ; preds = %4271
  %4280 = mul nuw nsw i64 %4272, 16
  %4281 = getelementptr inbounds i8, i8* %0, i64 %4280
  call void @llvm.memset.p0i8.i64(i8* align 1 %4281, i8 0, i64 16, i1 false)
  br label %4282

4282:                                             ; preds = %4279, %4271
  %4283 = add nuw nsw i64 %4272, 1
  %4284 = call zeroext i8 @randombit()
  %4285 = getelementptr inbounds i8, i8* %1, i64 %4283
  store i8 %4284, i8* %4285, align 1
  %4286 = getelementptr inbounds i8, i8* %1, i64 %4283
  %4287 = load i8, i8* %4286, align 1
  %4288 = zext i8 %4287 to i32
  %4289 = icmp eq i32 %4288, 0
  br i1 %4289, label %4290, label %4293

4290:                                             ; preds = %4282
  %4291 = mul nuw nsw i64 %4283, 16
  %4292 = getelementptr inbounds i8, i8* %0, i64 %4291
  call void @llvm.memset.p0i8.i64(i8* align 1 %4292, i8 0, i64 16, i1 false)
  br label %4293

4293:                                             ; preds = %4290, %4282
  %4294 = add nuw nsw i64 %4283, 1
  %4295 = call zeroext i8 @randombit()
  %4296 = getelementptr inbounds i8, i8* %1, i64 %4294
  store i8 %4295, i8* %4296, align 1
  %4297 = getelementptr inbounds i8, i8* %1, i64 %4294
  %4298 = load i8, i8* %4297, align 1
  %4299 = zext i8 %4298 to i32
  %4300 = icmp eq i32 %4299, 0
  br i1 %4300, label %4301, label %4304

4301:                                             ; preds = %4293
  %4302 = mul nuw nsw i64 %4294, 16
  %4303 = getelementptr inbounds i8, i8* %0, i64 %4302
  call void @llvm.memset.p0i8.i64(i8* align 1 %4303, i8 0, i64 16, i1 false)
  br label %4304

4304:                                             ; preds = %4301, %4293
  %4305 = add nuw nsw i64 %4294, 1
  %4306 = call zeroext i8 @randombit()
  %4307 = getelementptr inbounds i8, i8* %1, i64 %4305
  store i8 %4306, i8* %4307, align 1
  %4308 = getelementptr inbounds i8, i8* %1, i64 %4305
  %4309 = load i8, i8* %4308, align 1
  %4310 = zext i8 %4309 to i32
  %4311 = icmp eq i32 %4310, 0
  br i1 %4311, label %4312, label %4315

4312:                                             ; preds = %4304
  %4313 = mul nuw nsw i64 %4305, 16
  %4314 = getelementptr inbounds i8, i8* %0, i64 %4313
  call void @llvm.memset.p0i8.i64(i8* align 1 %4314, i8 0, i64 16, i1 false)
  br label %4315

4315:                                             ; preds = %4312, %4304
  %4316 = add nuw nsw i64 %4305, 1
  %4317 = call zeroext i8 @randombit()
  %4318 = getelementptr inbounds i8, i8* %1, i64 %4316
  store i8 %4317, i8* %4318, align 1
  %4319 = getelementptr inbounds i8, i8* %1, i64 %4316
  %4320 = load i8, i8* %4319, align 1
  %4321 = zext i8 %4320 to i32
  %4322 = icmp eq i32 %4321, 0
  br i1 %4322, label %4323, label %4326

4323:                                             ; preds = %4315
  %4324 = mul nuw nsw i64 %4316, 16
  %4325 = getelementptr inbounds i8, i8* %0, i64 %4324
  call void @llvm.memset.p0i8.i64(i8* align 1 %4325, i8 0, i64 16, i1 false)
  br label %4326

4326:                                             ; preds = %4323, %4315
  %4327 = add nuw nsw i64 %4316, 1
  %4328 = call zeroext i8 @randombit()
  %4329 = getelementptr inbounds i8, i8* %1, i64 %4327
  store i8 %4328, i8* %4329, align 1
  %4330 = getelementptr inbounds i8, i8* %1, i64 %4327
  %4331 = load i8, i8* %4330, align 1
  %4332 = zext i8 %4331 to i32
  %4333 = icmp eq i32 %4332, 0
  br i1 %4333, label %4334, label %4337

4334:                                             ; preds = %4326
  %4335 = mul nuw nsw i64 %4327, 16
  %4336 = getelementptr inbounds i8, i8* %0, i64 %4335
  call void @llvm.memset.p0i8.i64(i8* align 1 %4336, i8 0, i64 16, i1 false)
  br label %4337

4337:                                             ; preds = %4334, %4326
  %4338 = add nuw nsw i64 %4327, 1
  %4339 = call zeroext i8 @randombit()
  %4340 = getelementptr inbounds i8, i8* %1, i64 %4338
  store i8 %4339, i8* %4340, align 1
  %4341 = getelementptr inbounds i8, i8* %1, i64 %4338
  %4342 = load i8, i8* %4341, align 1
  %4343 = zext i8 %4342 to i32
  %4344 = icmp eq i32 %4343, 0
  br i1 %4344, label %4345, label %4348

4345:                                             ; preds = %4337
  %4346 = mul nuw nsw i64 %4338, 16
  %4347 = getelementptr inbounds i8, i8* %0, i64 %4346
  call void @llvm.memset.p0i8.i64(i8* align 1 %4347, i8 0, i64 16, i1 false)
  br label %4348

4348:                                             ; preds = %4345, %4337
  %4349 = add nuw nsw i64 %4338, 1
  %4350 = call zeroext i8 @randombit()
  %4351 = getelementptr inbounds i8, i8* %1, i64 %4349
  store i8 %4350, i8* %4351, align 1
  %4352 = getelementptr inbounds i8, i8* %1, i64 %4349
  %4353 = load i8, i8* %4352, align 1
  %4354 = zext i8 %4353 to i32
  %4355 = icmp eq i32 %4354, 0
  br i1 %4355, label %4356, label %4359

4356:                                             ; preds = %4348
  %4357 = mul nuw nsw i64 %4349, 16
  %4358 = getelementptr inbounds i8, i8* %0, i64 %4357
  call void @llvm.memset.p0i8.i64(i8* align 1 %4358, i8 0, i64 16, i1 false)
  br label %4359

4359:                                             ; preds = %4356, %4348
  %4360 = add nuw nsw i64 %4349, 1
  %4361 = call zeroext i8 @randombit()
  %4362 = getelementptr inbounds i8, i8* %1, i64 %4360
  store i8 %4361, i8* %4362, align 1
  %4363 = getelementptr inbounds i8, i8* %1, i64 %4360
  %4364 = load i8, i8* %4363, align 1
  %4365 = zext i8 %4364 to i32
  %4366 = icmp eq i32 %4365, 0
  br i1 %4366, label %4367, label %4370

4367:                                             ; preds = %4359
  %4368 = mul nuw nsw i64 %4360, 16
  %4369 = getelementptr inbounds i8, i8* %0, i64 %4368
  call void @llvm.memset.p0i8.i64(i8* align 1 %4369, i8 0, i64 16, i1 false)
  br label %4370

4370:                                             ; preds = %4367, %4359
  %4371 = add nuw nsw i64 %4360, 1
  %4372 = call zeroext i8 @randombit()
  %4373 = getelementptr inbounds i8, i8* %1, i64 %4371
  store i8 %4372, i8* %4373, align 1
  %4374 = getelementptr inbounds i8, i8* %1, i64 %4371
  %4375 = load i8, i8* %4374, align 1
  %4376 = zext i8 %4375 to i32
  %4377 = icmp eq i32 %4376, 0
  br i1 %4377, label %4378, label %4381

4378:                                             ; preds = %4370
  %4379 = mul nuw nsw i64 %4371, 16
  %4380 = getelementptr inbounds i8, i8* %0, i64 %4379
  call void @llvm.memset.p0i8.i64(i8* align 1 %4380, i8 0, i64 16, i1 false)
  br label %4381

4381:                                             ; preds = %4378, %4370
  %4382 = add nuw nsw i64 %4371, 1
  %4383 = call zeroext i8 @randombit()
  %4384 = getelementptr inbounds i8, i8* %1, i64 %4382
  store i8 %4383, i8* %4384, align 1
  %4385 = getelementptr inbounds i8, i8* %1, i64 %4382
  %4386 = load i8, i8* %4385, align 1
  %4387 = zext i8 %4386 to i32
  %4388 = icmp eq i32 %4387, 0
  br i1 %4388, label %4389, label %4392

4389:                                             ; preds = %4381
  %4390 = mul nuw nsw i64 %4382, 16
  %4391 = getelementptr inbounds i8, i8* %0, i64 %4390
  call void @llvm.memset.p0i8.i64(i8* align 1 %4391, i8 0, i64 16, i1 false)
  br label %4392

4392:                                             ; preds = %4389, %4381
  %4393 = add nuw nsw i64 %4382, 1
  %4394 = call zeroext i8 @randombit()
  %4395 = getelementptr inbounds i8, i8* %1, i64 %4393
  store i8 %4394, i8* %4395, align 1
  %4396 = getelementptr inbounds i8, i8* %1, i64 %4393
  %4397 = load i8, i8* %4396, align 1
  %4398 = zext i8 %4397 to i32
  %4399 = icmp eq i32 %4398, 0
  br i1 %4399, label %4400, label %4403

4400:                                             ; preds = %4392
  %4401 = mul nuw nsw i64 %4393, 16
  %4402 = getelementptr inbounds i8, i8* %0, i64 %4401
  call void @llvm.memset.p0i8.i64(i8* align 1 %4402, i8 0, i64 16, i1 false)
  br label %4403

4403:                                             ; preds = %4400, %4392
  %4404 = add nuw nsw i64 %4393, 1
  %4405 = call zeroext i8 @randombit()
  %4406 = getelementptr inbounds i8, i8* %1, i64 %4404
  store i8 %4405, i8* %4406, align 1
  %4407 = getelementptr inbounds i8, i8* %1, i64 %4404
  %4408 = load i8, i8* %4407, align 1
  %4409 = zext i8 %4408 to i32
  %4410 = icmp eq i32 %4409, 0
  br i1 %4410, label %4411, label %4414

4411:                                             ; preds = %4403
  %4412 = mul nuw nsw i64 %4404, 16
  %4413 = getelementptr inbounds i8, i8* %0, i64 %4412
  call void @llvm.memset.p0i8.i64(i8* align 1 %4413, i8 0, i64 16, i1 false)
  br label %4414

4414:                                             ; preds = %4411, %4403
  %4415 = add nuw nsw i64 %4404, 1
  %4416 = call zeroext i8 @randombit()
  %4417 = getelementptr inbounds i8, i8* %1, i64 %4415
  store i8 %4416, i8* %4417, align 1
  %4418 = getelementptr inbounds i8, i8* %1, i64 %4415
  %4419 = load i8, i8* %4418, align 1
  %4420 = zext i8 %4419 to i32
  %4421 = icmp eq i32 %4420, 0
  br i1 %4421, label %4422, label %4425

4422:                                             ; preds = %4414
  %4423 = mul nuw nsw i64 %4415, 16
  %4424 = getelementptr inbounds i8, i8* %0, i64 %4423
  call void @llvm.memset.p0i8.i64(i8* align 1 %4424, i8 0, i64 16, i1 false)
  br label %4425

4425:                                             ; preds = %4422, %4414
  %4426 = add nuw nsw i64 %4415, 1
  %4427 = call zeroext i8 @randombit()
  %4428 = getelementptr inbounds i8, i8* %1, i64 %4426
  store i8 %4427, i8* %4428, align 1
  %4429 = getelementptr inbounds i8, i8* %1, i64 %4426
  %4430 = load i8, i8* %4429, align 1
  %4431 = zext i8 %4430 to i32
  %4432 = icmp eq i32 %4431, 0
  br i1 %4432, label %4433, label %4436

4433:                                             ; preds = %4425
  %4434 = mul nuw nsw i64 %4426, 16
  %4435 = getelementptr inbounds i8, i8* %0, i64 %4434
  call void @llvm.memset.p0i8.i64(i8* align 1 %4435, i8 0, i64 16, i1 false)
  br label %4436

4436:                                             ; preds = %4433, %4425
  %4437 = add nuw nsw i64 %4426, 1
  %4438 = call zeroext i8 @randombit()
  %4439 = getelementptr inbounds i8, i8* %1, i64 %4437
  store i8 %4438, i8* %4439, align 1
  %4440 = getelementptr inbounds i8, i8* %1, i64 %4437
  %4441 = load i8, i8* %4440, align 1
  %4442 = zext i8 %4441 to i32
  %4443 = icmp eq i32 %4442, 0
  br i1 %4443, label %4444, label %4447

4444:                                             ; preds = %4436
  %4445 = mul nuw nsw i64 %4437, 16
  %4446 = getelementptr inbounds i8, i8* %0, i64 %4445
  call void @llvm.memset.p0i8.i64(i8* align 1 %4446, i8 0, i64 16, i1 false)
  br label %4447

4447:                                             ; preds = %4444, %4436
  %4448 = add nuw nsw i64 %4437, 1
  %4449 = call zeroext i8 @randombit()
  %4450 = getelementptr inbounds i8, i8* %1, i64 %4448
  store i8 %4449, i8* %4450, align 1
  %4451 = getelementptr inbounds i8, i8* %1, i64 %4448
  %4452 = load i8, i8* %4451, align 1
  %4453 = zext i8 %4452 to i32
  %4454 = icmp eq i32 %4453, 0
  br i1 %4454, label %4455, label %4458

4455:                                             ; preds = %4447
  %4456 = mul nuw nsw i64 %4448, 16
  %4457 = getelementptr inbounds i8, i8* %0, i64 %4456
  call void @llvm.memset.p0i8.i64(i8* align 1 %4457, i8 0, i64 16, i1 false)
  br label %4458

4458:                                             ; preds = %4455, %4447
  %4459 = add nuw nsw i64 %4448, 1
  %4460 = call zeroext i8 @randombit()
  %4461 = getelementptr inbounds i8, i8* %1, i64 %4459
  store i8 %4460, i8* %4461, align 1
  %4462 = getelementptr inbounds i8, i8* %1, i64 %4459
  %4463 = load i8, i8* %4462, align 1
  %4464 = zext i8 %4463 to i32
  %4465 = icmp eq i32 %4464, 0
  br i1 %4465, label %4466, label %4469

4466:                                             ; preds = %4458
  %4467 = mul nuw nsw i64 %4459, 16
  %4468 = getelementptr inbounds i8, i8* %0, i64 %4467
  call void @llvm.memset.p0i8.i64(i8* align 1 %4468, i8 0, i64 16, i1 false)
  br label %4469

4469:                                             ; preds = %4466, %4458
  %4470 = add nuw nsw i64 %4459, 1
  %4471 = call zeroext i8 @randombit()
  %4472 = getelementptr inbounds i8, i8* %1, i64 %4470
  store i8 %4471, i8* %4472, align 1
  %4473 = getelementptr inbounds i8, i8* %1, i64 %4470
  %4474 = load i8, i8* %4473, align 1
  %4475 = zext i8 %4474 to i32
  %4476 = icmp eq i32 %4475, 0
  br i1 %4476, label %4477, label %4480

4477:                                             ; preds = %4469
  %4478 = mul nuw nsw i64 %4470, 16
  %4479 = getelementptr inbounds i8, i8* %0, i64 %4478
  call void @llvm.memset.p0i8.i64(i8* align 1 %4479, i8 0, i64 16, i1 false)
  br label %4480

4480:                                             ; preds = %4477, %4469
  %4481 = add nuw nsw i64 %4470, 1
  %4482 = call zeroext i8 @randombit()
  %4483 = getelementptr inbounds i8, i8* %1, i64 %4481
  store i8 %4482, i8* %4483, align 1
  %4484 = getelementptr inbounds i8, i8* %1, i64 %4481
  %4485 = load i8, i8* %4484, align 1
  %4486 = zext i8 %4485 to i32
  %4487 = icmp eq i32 %4486, 0
  br i1 %4487, label %4488, label %4491

4488:                                             ; preds = %4480
  %4489 = mul nuw nsw i64 %4481, 16
  %4490 = getelementptr inbounds i8, i8* %0, i64 %4489
  call void @llvm.memset.p0i8.i64(i8* align 1 %4490, i8 0, i64 16, i1 false)
  br label %4491

4491:                                             ; preds = %4488, %4480
  %4492 = add nuw nsw i64 %4481, 1
  %4493 = call zeroext i8 @randombit()
  %4494 = getelementptr inbounds i8, i8* %1, i64 %4492
  store i8 %4493, i8* %4494, align 1
  %4495 = getelementptr inbounds i8, i8* %1, i64 %4492
  %4496 = load i8, i8* %4495, align 1
  %4497 = zext i8 %4496 to i32
  %4498 = icmp eq i32 %4497, 0
  br i1 %4498, label %4499, label %4502

4499:                                             ; preds = %4491
  %4500 = mul nuw nsw i64 %4492, 16
  %4501 = getelementptr inbounds i8, i8* %0, i64 %4500
  call void @llvm.memset.p0i8.i64(i8* align 1 %4501, i8 0, i64 16, i1 false)
  br label %4502

4502:                                             ; preds = %4499, %4491
  %4503 = add nuw nsw i64 %4492, 1
  %4504 = call zeroext i8 @randombit()
  %4505 = getelementptr inbounds i8, i8* %1, i64 %4503
  store i8 %4504, i8* %4505, align 1
  %4506 = getelementptr inbounds i8, i8* %1, i64 %4503
  %4507 = load i8, i8* %4506, align 1
  %4508 = zext i8 %4507 to i32
  %4509 = icmp eq i32 %4508, 0
  br i1 %4509, label %4510, label %4513

4510:                                             ; preds = %4502
  %4511 = mul nuw nsw i64 %4503, 16
  %4512 = getelementptr inbounds i8, i8* %0, i64 %4511
  call void @llvm.memset.p0i8.i64(i8* align 1 %4512, i8 0, i64 16, i1 false)
  br label %4513

4513:                                             ; preds = %4510, %4502
  %4514 = add nuw nsw i64 %4503, 1
  %4515 = call zeroext i8 @randombit()
  %4516 = getelementptr inbounds i8, i8* %1, i64 %4514
  store i8 %4515, i8* %4516, align 1
  %4517 = getelementptr inbounds i8, i8* %1, i64 %4514
  %4518 = load i8, i8* %4517, align 1
  %4519 = zext i8 %4518 to i32
  %4520 = icmp eq i32 %4519, 0
  br i1 %4520, label %4521, label %4524

4521:                                             ; preds = %4513
  %4522 = mul nuw nsw i64 %4514, 16
  %4523 = getelementptr inbounds i8, i8* %0, i64 %4522
  call void @llvm.memset.p0i8.i64(i8* align 1 %4523, i8 0, i64 16, i1 false)
  br label %4524

4524:                                             ; preds = %4521, %4513
  %4525 = add nuw nsw i64 %4514, 1
  %4526 = call zeroext i8 @randombit()
  %4527 = getelementptr inbounds i8, i8* %1, i64 %4525
  store i8 %4526, i8* %4527, align 1
  %4528 = getelementptr inbounds i8, i8* %1, i64 %4525
  %4529 = load i8, i8* %4528, align 1
  %4530 = zext i8 %4529 to i32
  %4531 = icmp eq i32 %4530, 0
  br i1 %4531, label %4532, label %4535

4532:                                             ; preds = %4524
  %4533 = mul nuw nsw i64 %4525, 16
  %4534 = getelementptr inbounds i8, i8* %0, i64 %4533
  call void @llvm.memset.p0i8.i64(i8* align 1 %4534, i8 0, i64 16, i1 false)
  br label %4535

4535:                                             ; preds = %4532, %4524
  %4536 = add nuw nsw i64 %4525, 1
  %4537 = call zeroext i8 @randombit()
  %4538 = getelementptr inbounds i8, i8* %1, i64 %4536
  store i8 %4537, i8* %4538, align 1
  %4539 = getelementptr inbounds i8, i8* %1, i64 %4536
  %4540 = load i8, i8* %4539, align 1
  %4541 = zext i8 %4540 to i32
  %4542 = icmp eq i32 %4541, 0
  br i1 %4542, label %4543, label %4546

4543:                                             ; preds = %4535
  %4544 = mul nuw nsw i64 %4536, 16
  %4545 = getelementptr inbounds i8, i8* %0, i64 %4544
  call void @llvm.memset.p0i8.i64(i8* align 1 %4545, i8 0, i64 16, i1 false)
  br label %4546

4546:                                             ; preds = %4543, %4535
  %4547 = add nuw nsw i64 %4536, 1
  %4548 = call zeroext i8 @randombit()
  %4549 = getelementptr inbounds i8, i8* %1, i64 %4547
  store i8 %4548, i8* %4549, align 1
  %4550 = getelementptr inbounds i8, i8* %1, i64 %4547
  %4551 = load i8, i8* %4550, align 1
  %4552 = zext i8 %4551 to i32
  %4553 = icmp eq i32 %4552, 0
  br i1 %4553, label %4554, label %4557

4554:                                             ; preds = %4546
  %4555 = mul nuw nsw i64 %4547, 16
  %4556 = getelementptr inbounds i8, i8* %0, i64 %4555
  call void @llvm.memset.p0i8.i64(i8* align 1 %4556, i8 0, i64 16, i1 false)
  br label %4557

4557:                                             ; preds = %4554, %4546
  %4558 = add nuw nsw i64 %4547, 1
  %4559 = call zeroext i8 @randombit()
  %4560 = getelementptr inbounds i8, i8* %1, i64 %4558
  store i8 %4559, i8* %4560, align 1
  %4561 = getelementptr inbounds i8, i8* %1, i64 %4558
  %4562 = load i8, i8* %4561, align 1
  %4563 = zext i8 %4562 to i32
  %4564 = icmp eq i32 %4563, 0
  br i1 %4564, label %4565, label %4568

4565:                                             ; preds = %4557
  %4566 = mul nuw nsw i64 %4558, 16
  %4567 = getelementptr inbounds i8, i8* %0, i64 %4566
  call void @llvm.memset.p0i8.i64(i8* align 1 %4567, i8 0, i64 16, i1 false)
  br label %4568

4568:                                             ; preds = %4565, %4557
  %4569 = add nuw nsw i64 %4558, 1
  %4570 = call zeroext i8 @randombit()
  %4571 = getelementptr inbounds i8, i8* %1, i64 %4569
  store i8 %4570, i8* %4571, align 1
  %4572 = getelementptr inbounds i8, i8* %1, i64 %4569
  %4573 = load i8, i8* %4572, align 1
  %4574 = zext i8 %4573 to i32
  %4575 = icmp eq i32 %4574, 0
  br i1 %4575, label %4576, label %4579

4576:                                             ; preds = %4568
  %4577 = mul nuw nsw i64 %4569, 16
  %4578 = getelementptr inbounds i8, i8* %0, i64 %4577
  call void @llvm.memset.p0i8.i64(i8* align 1 %4578, i8 0, i64 16, i1 false)
  br label %4579

4579:                                             ; preds = %4576, %4568
  %4580 = add nuw nsw i64 %4569, 1
  %4581 = call zeroext i8 @randombit()
  %4582 = getelementptr inbounds i8, i8* %1, i64 %4580
  store i8 %4581, i8* %4582, align 1
  %4583 = getelementptr inbounds i8, i8* %1, i64 %4580
  %4584 = load i8, i8* %4583, align 1
  %4585 = zext i8 %4584 to i32
  %4586 = icmp eq i32 %4585, 0
  br i1 %4586, label %4587, label %4590

4587:                                             ; preds = %4579
  %4588 = mul nuw nsw i64 %4580, 16
  %4589 = getelementptr inbounds i8, i8* %0, i64 %4588
  call void @llvm.memset.p0i8.i64(i8* align 1 %4589, i8 0, i64 16, i1 false)
  br label %4590

4590:                                             ; preds = %4587, %4579
  %4591 = add nuw nsw i64 %4580, 1
  %4592 = call zeroext i8 @randombit()
  %4593 = getelementptr inbounds i8, i8* %1, i64 %4591
  store i8 %4592, i8* %4593, align 1
  %4594 = getelementptr inbounds i8, i8* %1, i64 %4591
  %4595 = load i8, i8* %4594, align 1
  %4596 = zext i8 %4595 to i32
  %4597 = icmp eq i32 %4596, 0
  br i1 %4597, label %4598, label %4601

4598:                                             ; preds = %4590
  %4599 = mul nuw nsw i64 %4591, 16
  %4600 = getelementptr inbounds i8, i8* %0, i64 %4599
  call void @llvm.memset.p0i8.i64(i8* align 1 %4600, i8 0, i64 16, i1 false)
  br label %4601

4601:                                             ; preds = %4598, %4590
  %4602 = add nuw nsw i64 %4591, 1
  %4603 = call zeroext i8 @randombit()
  %4604 = getelementptr inbounds i8, i8* %1, i64 %4602
  store i8 %4603, i8* %4604, align 1
  %4605 = getelementptr inbounds i8, i8* %1, i64 %4602
  %4606 = load i8, i8* %4605, align 1
  %4607 = zext i8 %4606 to i32
  %4608 = icmp eq i32 %4607, 0
  br i1 %4608, label %4609, label %4612

4609:                                             ; preds = %4601
  %4610 = mul nuw nsw i64 %4602, 16
  %4611 = getelementptr inbounds i8, i8* %0, i64 %4610
  call void @llvm.memset.p0i8.i64(i8* align 1 %4611, i8 0, i64 16, i1 false)
  br label %4612

4612:                                             ; preds = %4609, %4601
  %4613 = add nuw nsw i64 %4602, 1
  %4614 = call zeroext i8 @randombit()
  %4615 = getelementptr inbounds i8, i8* %1, i64 %4613
  store i8 %4614, i8* %4615, align 1
  %4616 = getelementptr inbounds i8, i8* %1, i64 %4613
  %4617 = load i8, i8* %4616, align 1
  %4618 = zext i8 %4617 to i32
  %4619 = icmp eq i32 %4618, 0
  br i1 %4619, label %4620, label %4623

4620:                                             ; preds = %4612
  %4621 = mul nuw nsw i64 %4613, 16
  %4622 = getelementptr inbounds i8, i8* %0, i64 %4621
  call void @llvm.memset.p0i8.i64(i8* align 1 %4622, i8 0, i64 16, i1 false)
  br label %4623

4623:                                             ; preds = %4620, %4612
  %4624 = add nuw nsw i64 %4613, 1
  %4625 = call zeroext i8 @randombit()
  %4626 = getelementptr inbounds i8, i8* %1, i64 %4624
  store i8 %4625, i8* %4626, align 1
  %4627 = getelementptr inbounds i8, i8* %1, i64 %4624
  %4628 = load i8, i8* %4627, align 1
  %4629 = zext i8 %4628 to i32
  %4630 = icmp eq i32 %4629, 0
  br i1 %4630, label %4631, label %4634

4631:                                             ; preds = %4623
  %4632 = mul nuw nsw i64 %4624, 16
  %4633 = getelementptr inbounds i8, i8* %0, i64 %4632
  call void @llvm.memset.p0i8.i64(i8* align 1 %4633, i8 0, i64 16, i1 false)
  br label %4634

4634:                                             ; preds = %4631, %4623
  %4635 = add nuw nsw i64 %4624, 1
  %4636 = call zeroext i8 @randombit()
  %4637 = getelementptr inbounds i8, i8* %1, i64 %4635
  store i8 %4636, i8* %4637, align 1
  %4638 = getelementptr inbounds i8, i8* %1, i64 %4635
  %4639 = load i8, i8* %4638, align 1
  %4640 = zext i8 %4639 to i32
  %4641 = icmp eq i32 %4640, 0
  br i1 %4641, label %4642, label %4645

4642:                                             ; preds = %4634
  %4643 = mul nuw nsw i64 %4635, 16
  %4644 = getelementptr inbounds i8, i8* %0, i64 %4643
  call void @llvm.memset.p0i8.i64(i8* align 1 %4644, i8 0, i64 16, i1 false)
  br label %4645

4645:                                             ; preds = %4642, %4634
  %4646 = add nuw nsw i64 %4635, 1
  %4647 = call zeroext i8 @randombit()
  %4648 = getelementptr inbounds i8, i8* %1, i64 %4646
  store i8 %4647, i8* %4648, align 1
  %4649 = getelementptr inbounds i8, i8* %1, i64 %4646
  %4650 = load i8, i8* %4649, align 1
  %4651 = zext i8 %4650 to i32
  %4652 = icmp eq i32 %4651, 0
  br i1 %4652, label %4653, label %4656

4653:                                             ; preds = %4645
  %4654 = mul nuw nsw i64 %4646, 16
  %4655 = getelementptr inbounds i8, i8* %0, i64 %4654
  call void @llvm.memset.p0i8.i64(i8* align 1 %4655, i8 0, i64 16, i1 false)
  br label %4656

4656:                                             ; preds = %4653, %4645
  %4657 = add nuw nsw i64 %4646, 1
  %4658 = call zeroext i8 @randombit()
  %4659 = getelementptr inbounds i8, i8* %1, i64 %4657
  store i8 %4658, i8* %4659, align 1
  %4660 = getelementptr inbounds i8, i8* %1, i64 %4657
  %4661 = load i8, i8* %4660, align 1
  %4662 = zext i8 %4661 to i32
  %4663 = icmp eq i32 %4662, 0
  br i1 %4663, label %4664, label %4667

4664:                                             ; preds = %4656
  %4665 = mul nuw nsw i64 %4657, 16
  %4666 = getelementptr inbounds i8, i8* %0, i64 %4665
  call void @llvm.memset.p0i8.i64(i8* align 1 %4666, i8 0, i64 16, i1 false)
  br label %4667

4667:                                             ; preds = %4664, %4656
  %4668 = add nuw nsw i64 %4657, 1
  %4669 = call zeroext i8 @randombit()
  %4670 = getelementptr inbounds i8, i8* %1, i64 %4668
  store i8 %4669, i8* %4670, align 1
  %4671 = getelementptr inbounds i8, i8* %1, i64 %4668
  %4672 = load i8, i8* %4671, align 1
  %4673 = zext i8 %4672 to i32
  %4674 = icmp eq i32 %4673, 0
  br i1 %4674, label %4675, label %4678

4675:                                             ; preds = %4667
  %4676 = mul nuw nsw i64 %4668, 16
  %4677 = getelementptr inbounds i8, i8* %0, i64 %4676
  call void @llvm.memset.p0i8.i64(i8* align 1 %4677, i8 0, i64 16, i1 false)
  br label %4678

4678:                                             ; preds = %4675, %4667
  %4679 = add nuw nsw i64 %4668, 1
  %4680 = call zeroext i8 @randombit()
  %4681 = getelementptr inbounds i8, i8* %1, i64 %4679
  store i8 %4680, i8* %4681, align 1
  %4682 = getelementptr inbounds i8, i8* %1, i64 %4679
  %4683 = load i8, i8* %4682, align 1
  %4684 = zext i8 %4683 to i32
  %4685 = icmp eq i32 %4684, 0
  br i1 %4685, label %4686, label %4689

4686:                                             ; preds = %4678
  %4687 = mul nuw nsw i64 %4679, 16
  %4688 = getelementptr inbounds i8, i8* %0, i64 %4687
  call void @llvm.memset.p0i8.i64(i8* align 1 %4688, i8 0, i64 16, i1 false)
  br label %4689

4689:                                             ; preds = %4686, %4678
  %4690 = add nuw nsw i64 %4679, 1
  %4691 = call zeroext i8 @randombit()
  %4692 = getelementptr inbounds i8, i8* %1, i64 %4690
  store i8 %4691, i8* %4692, align 1
  %4693 = getelementptr inbounds i8, i8* %1, i64 %4690
  %4694 = load i8, i8* %4693, align 1
  %4695 = zext i8 %4694 to i32
  %4696 = icmp eq i32 %4695, 0
  br i1 %4696, label %4697, label %4700

4697:                                             ; preds = %4689
  %4698 = mul nuw nsw i64 %4690, 16
  %4699 = getelementptr inbounds i8, i8* %0, i64 %4698
  call void @llvm.memset.p0i8.i64(i8* align 1 %4699, i8 0, i64 16, i1 false)
  br label %4700

4700:                                             ; preds = %4697, %4689
  %4701 = add nuw nsw i64 %4690, 1
  %4702 = call zeroext i8 @randombit()
  %4703 = getelementptr inbounds i8, i8* %1, i64 %4701
  store i8 %4702, i8* %4703, align 1
  %4704 = getelementptr inbounds i8, i8* %1, i64 %4701
  %4705 = load i8, i8* %4704, align 1
  %4706 = zext i8 %4705 to i32
  %4707 = icmp eq i32 %4706, 0
  br i1 %4707, label %4708, label %4711

4708:                                             ; preds = %4700
  %4709 = mul nuw nsw i64 %4701, 16
  %4710 = getelementptr inbounds i8, i8* %0, i64 %4709
  call void @llvm.memset.p0i8.i64(i8* align 1 %4710, i8 0, i64 16, i1 false)
  br label %4711

4711:                                             ; preds = %4708, %4700
  %4712 = add nuw nsw i64 %4701, 1
  %4713 = call zeroext i8 @randombit()
  %4714 = getelementptr inbounds i8, i8* %1, i64 %4712
  store i8 %4713, i8* %4714, align 1
  %4715 = getelementptr inbounds i8, i8* %1, i64 %4712
  %4716 = load i8, i8* %4715, align 1
  %4717 = zext i8 %4716 to i32
  %4718 = icmp eq i32 %4717, 0
  br i1 %4718, label %4719, label %4722

4719:                                             ; preds = %4711
  %4720 = mul nuw nsw i64 %4712, 16
  %4721 = getelementptr inbounds i8, i8* %0, i64 %4720
  call void @llvm.memset.p0i8.i64(i8* align 1 %4721, i8 0, i64 16, i1 false)
  br label %4722

4722:                                             ; preds = %4719, %4711
  %4723 = add nuw nsw i64 %4712, 1
  %4724 = call zeroext i8 @randombit()
  %4725 = getelementptr inbounds i8, i8* %1, i64 %4723
  store i8 %4724, i8* %4725, align 1
  %4726 = getelementptr inbounds i8, i8* %1, i64 %4723
  %4727 = load i8, i8* %4726, align 1
  %4728 = zext i8 %4727 to i32
  %4729 = icmp eq i32 %4728, 0
  br i1 %4729, label %4730, label %4733

4730:                                             ; preds = %4722
  %4731 = mul nuw nsw i64 %4723, 16
  %4732 = getelementptr inbounds i8, i8* %0, i64 %4731
  call void @llvm.memset.p0i8.i64(i8* align 1 %4732, i8 0, i64 16, i1 false)
  br label %4733

4733:                                             ; preds = %4730, %4722
  %4734 = add nuw nsw i64 %4723, 1
  %4735 = call zeroext i8 @randombit()
  %4736 = getelementptr inbounds i8, i8* %1, i64 %4734
  store i8 %4735, i8* %4736, align 1
  %4737 = getelementptr inbounds i8, i8* %1, i64 %4734
  %4738 = load i8, i8* %4737, align 1
  %4739 = zext i8 %4738 to i32
  %4740 = icmp eq i32 %4739, 0
  br i1 %4740, label %4741, label %4744

4741:                                             ; preds = %4733
  %4742 = mul nuw nsw i64 %4734, 16
  %4743 = getelementptr inbounds i8, i8* %0, i64 %4742
  call void @llvm.memset.p0i8.i64(i8* align 1 %4743, i8 0, i64 16, i1 false)
  br label %4744

4744:                                             ; preds = %4741, %4733
  %4745 = add nuw nsw i64 %4734, 1
  %4746 = call zeroext i8 @randombit()
  %4747 = getelementptr inbounds i8, i8* %1, i64 %4745
  store i8 %4746, i8* %4747, align 1
  %4748 = getelementptr inbounds i8, i8* %1, i64 %4745
  %4749 = load i8, i8* %4748, align 1
  %4750 = zext i8 %4749 to i32
  %4751 = icmp eq i32 %4750, 0
  br i1 %4751, label %4752, label %4755

4752:                                             ; preds = %4744
  %4753 = mul nuw nsw i64 %4745, 16
  %4754 = getelementptr inbounds i8, i8* %0, i64 %4753
  call void @llvm.memset.p0i8.i64(i8* align 1 %4754, i8 0, i64 16, i1 false)
  br label %4755

4755:                                             ; preds = %4752, %4744
  %4756 = add nuw nsw i64 %4745, 1
  %4757 = call zeroext i8 @randombit()
  %4758 = getelementptr inbounds i8, i8* %1, i64 %4756
  store i8 %4757, i8* %4758, align 1
  %4759 = getelementptr inbounds i8, i8* %1, i64 %4756
  %4760 = load i8, i8* %4759, align 1
  %4761 = zext i8 %4760 to i32
  %4762 = icmp eq i32 %4761, 0
  br i1 %4762, label %4763, label %4766

4763:                                             ; preds = %4755
  %4764 = mul nuw nsw i64 %4756, 16
  %4765 = getelementptr inbounds i8, i8* %0, i64 %4764
  call void @llvm.memset.p0i8.i64(i8* align 1 %4765, i8 0, i64 16, i1 false)
  br label %4766

4766:                                             ; preds = %4763, %4755
  %4767 = add nuw nsw i64 %4756, 1
  %4768 = call zeroext i8 @randombit()
  %4769 = getelementptr inbounds i8, i8* %1, i64 %4767
  store i8 %4768, i8* %4769, align 1
  %4770 = getelementptr inbounds i8, i8* %1, i64 %4767
  %4771 = load i8, i8* %4770, align 1
  %4772 = zext i8 %4771 to i32
  %4773 = icmp eq i32 %4772, 0
  br i1 %4773, label %4774, label %4777

4774:                                             ; preds = %4766
  %4775 = mul nuw nsw i64 %4767, 16
  %4776 = getelementptr inbounds i8, i8* %0, i64 %4775
  call void @llvm.memset.p0i8.i64(i8* align 1 %4776, i8 0, i64 16, i1 false)
  br label %4777

4777:                                             ; preds = %4774, %4766
  %4778 = add nuw nsw i64 %4767, 1
  %4779 = call zeroext i8 @randombit()
  %4780 = getelementptr inbounds i8, i8* %1, i64 %4778
  store i8 %4779, i8* %4780, align 1
  %4781 = getelementptr inbounds i8, i8* %1, i64 %4778
  %4782 = load i8, i8* %4781, align 1
  %4783 = zext i8 %4782 to i32
  %4784 = icmp eq i32 %4783, 0
  br i1 %4784, label %4785, label %4788

4785:                                             ; preds = %4777
  %4786 = mul nuw nsw i64 %4778, 16
  %4787 = getelementptr inbounds i8, i8* %0, i64 %4786
  call void @llvm.memset.p0i8.i64(i8* align 1 %4787, i8 0, i64 16, i1 false)
  br label %4788

4788:                                             ; preds = %4785, %4777
  %4789 = add nuw nsw i64 %4778, 1
  %4790 = call zeroext i8 @randombit()
  %4791 = getelementptr inbounds i8, i8* %1, i64 %4789
  store i8 %4790, i8* %4791, align 1
  %4792 = getelementptr inbounds i8, i8* %1, i64 %4789
  %4793 = load i8, i8* %4792, align 1
  %4794 = zext i8 %4793 to i32
  %4795 = icmp eq i32 %4794, 0
  br i1 %4795, label %4796, label %4799

4796:                                             ; preds = %4788
  %4797 = mul nuw nsw i64 %4789, 16
  %4798 = getelementptr inbounds i8, i8* %0, i64 %4797
  call void @llvm.memset.p0i8.i64(i8* align 1 %4798, i8 0, i64 16, i1 false)
  br label %4799

4799:                                             ; preds = %4796, %4788
  %4800 = add nuw nsw i64 %4789, 1
  %4801 = call zeroext i8 @randombit()
  %4802 = getelementptr inbounds i8, i8* %1, i64 %4800
  store i8 %4801, i8* %4802, align 1
  %4803 = getelementptr inbounds i8, i8* %1, i64 %4800
  %4804 = load i8, i8* %4803, align 1
  %4805 = zext i8 %4804 to i32
  %4806 = icmp eq i32 %4805, 0
  br i1 %4806, label %4807, label %4810

4807:                                             ; preds = %4799
  %4808 = mul nuw nsw i64 %4800, 16
  %4809 = getelementptr inbounds i8, i8* %0, i64 %4808
  call void @llvm.memset.p0i8.i64(i8* align 1 %4809, i8 0, i64 16, i1 false)
  br label %4810

4810:                                             ; preds = %4807, %4799
  %4811 = add nuw nsw i64 %4800, 1
  %4812 = call zeroext i8 @randombit()
  %4813 = getelementptr inbounds i8, i8* %1, i64 %4811
  store i8 %4812, i8* %4813, align 1
  %4814 = getelementptr inbounds i8, i8* %1, i64 %4811
  %4815 = load i8, i8* %4814, align 1
  %4816 = zext i8 %4815 to i32
  %4817 = icmp eq i32 %4816, 0
  br i1 %4817, label %4818, label %4821

4818:                                             ; preds = %4810
  %4819 = mul nuw nsw i64 %4811, 16
  %4820 = getelementptr inbounds i8, i8* %0, i64 %4819
  call void @llvm.memset.p0i8.i64(i8* align 1 %4820, i8 0, i64 16, i1 false)
  br label %4821

4821:                                             ; preds = %4818, %4810
  %4822 = add nuw nsw i64 %4811, 1
  %4823 = call zeroext i8 @randombit()
  %4824 = getelementptr inbounds i8, i8* %1, i64 %4822
  store i8 %4823, i8* %4824, align 1
  %4825 = getelementptr inbounds i8, i8* %1, i64 %4822
  %4826 = load i8, i8* %4825, align 1
  %4827 = zext i8 %4826 to i32
  %4828 = icmp eq i32 %4827, 0
  br i1 %4828, label %4829, label %4832

4829:                                             ; preds = %4821
  %4830 = mul nuw nsw i64 %4822, 16
  %4831 = getelementptr inbounds i8, i8* %0, i64 %4830
  call void @llvm.memset.p0i8.i64(i8* align 1 %4831, i8 0, i64 16, i1 false)
  br label %4832

4832:                                             ; preds = %4829, %4821
  %4833 = add nuw nsw i64 %4822, 1
  %4834 = call zeroext i8 @randombit()
  %4835 = getelementptr inbounds i8, i8* %1, i64 %4833
  store i8 %4834, i8* %4835, align 1
  %4836 = getelementptr inbounds i8, i8* %1, i64 %4833
  %4837 = load i8, i8* %4836, align 1
  %4838 = zext i8 %4837 to i32
  %4839 = icmp eq i32 %4838, 0
  br i1 %4839, label %4840, label %4843

4840:                                             ; preds = %4832
  %4841 = mul nuw nsw i64 %4833, 16
  %4842 = getelementptr inbounds i8, i8* %0, i64 %4841
  call void @llvm.memset.p0i8.i64(i8* align 1 %4842, i8 0, i64 16, i1 false)
  br label %4843

4843:                                             ; preds = %4840, %4832
  %4844 = add nuw nsw i64 %4833, 1
  %4845 = call zeroext i8 @randombit()
  %4846 = getelementptr inbounds i8, i8* %1, i64 %4844
  store i8 %4845, i8* %4846, align 1
  %4847 = getelementptr inbounds i8, i8* %1, i64 %4844
  %4848 = load i8, i8* %4847, align 1
  %4849 = zext i8 %4848 to i32
  %4850 = icmp eq i32 %4849, 0
  br i1 %4850, label %4851, label %4854

4851:                                             ; preds = %4843
  %4852 = mul nuw nsw i64 %4844, 16
  %4853 = getelementptr inbounds i8, i8* %0, i64 %4852
  call void @llvm.memset.p0i8.i64(i8* align 1 %4853, i8 0, i64 16, i1 false)
  br label %4854

4854:                                             ; preds = %4851, %4843
  %4855 = add nuw nsw i64 %4844, 1
  %4856 = call zeroext i8 @randombit()
  %4857 = getelementptr inbounds i8, i8* %1, i64 %4855
  store i8 %4856, i8* %4857, align 1
  %4858 = getelementptr inbounds i8, i8* %1, i64 %4855
  %4859 = load i8, i8* %4858, align 1
  %4860 = zext i8 %4859 to i32
  %4861 = icmp eq i32 %4860, 0
  br i1 %4861, label %4862, label %4865

4862:                                             ; preds = %4854
  %4863 = mul nuw nsw i64 %4855, 16
  %4864 = getelementptr inbounds i8, i8* %0, i64 %4863
  call void @llvm.memset.p0i8.i64(i8* align 1 %4864, i8 0, i64 16, i1 false)
  br label %4865

4865:                                             ; preds = %4862, %4854
  %4866 = add nuw nsw i64 %4855, 1
  %4867 = call zeroext i8 @randombit()
  %4868 = getelementptr inbounds i8, i8* %1, i64 %4866
  store i8 %4867, i8* %4868, align 1
  %4869 = getelementptr inbounds i8, i8* %1, i64 %4866
  %4870 = load i8, i8* %4869, align 1
  %4871 = zext i8 %4870 to i32
  %4872 = icmp eq i32 %4871, 0
  br i1 %4872, label %4873, label %4876

4873:                                             ; preds = %4865
  %4874 = mul nuw nsw i64 %4866, 16
  %4875 = getelementptr inbounds i8, i8* %0, i64 %4874
  call void @llvm.memset.p0i8.i64(i8* align 1 %4875, i8 0, i64 16, i1 false)
  br label %4876

4876:                                             ; preds = %4873, %4865
  %4877 = add nuw nsw i64 %4866, 1
  %4878 = call zeroext i8 @randombit()
  %4879 = getelementptr inbounds i8, i8* %1, i64 %4877
  store i8 %4878, i8* %4879, align 1
  %4880 = getelementptr inbounds i8, i8* %1, i64 %4877
  %4881 = load i8, i8* %4880, align 1
  %4882 = zext i8 %4881 to i32
  %4883 = icmp eq i32 %4882, 0
  br i1 %4883, label %4884, label %4887

4884:                                             ; preds = %4876
  %4885 = mul nuw nsw i64 %4877, 16
  %4886 = getelementptr inbounds i8, i8* %0, i64 %4885
  call void @llvm.memset.p0i8.i64(i8* align 1 %4886, i8 0, i64 16, i1 false)
  br label %4887

4887:                                             ; preds = %4884, %4876
  %4888 = add nuw nsw i64 %4877, 1
  %4889 = call zeroext i8 @randombit()
  %4890 = getelementptr inbounds i8, i8* %1, i64 %4888
  store i8 %4889, i8* %4890, align 1
  %4891 = getelementptr inbounds i8, i8* %1, i64 %4888
  %4892 = load i8, i8* %4891, align 1
  %4893 = zext i8 %4892 to i32
  %4894 = icmp eq i32 %4893, 0
  br i1 %4894, label %4895, label %4898

4895:                                             ; preds = %4887
  %4896 = mul nuw nsw i64 %4888, 16
  %4897 = getelementptr inbounds i8, i8* %0, i64 %4896
  call void @llvm.memset.p0i8.i64(i8* align 1 %4897, i8 0, i64 16, i1 false)
  br label %4898

4898:                                             ; preds = %4895, %4887
  %4899 = add nuw nsw i64 %4888, 1
  %4900 = call zeroext i8 @randombit()
  %4901 = getelementptr inbounds i8, i8* %1, i64 %4899
  store i8 %4900, i8* %4901, align 1
  %4902 = getelementptr inbounds i8, i8* %1, i64 %4899
  %4903 = load i8, i8* %4902, align 1
  %4904 = zext i8 %4903 to i32
  %4905 = icmp eq i32 %4904, 0
  br i1 %4905, label %4906, label %4909

4906:                                             ; preds = %4898
  %4907 = mul nuw nsw i64 %4899, 16
  %4908 = getelementptr inbounds i8, i8* %0, i64 %4907
  call void @llvm.memset.p0i8.i64(i8* align 1 %4908, i8 0, i64 16, i1 false)
  br label %4909

4909:                                             ; preds = %4906, %4898
  %4910 = add nuw nsw i64 %4899, 1
  %4911 = call zeroext i8 @randombit()
  %4912 = getelementptr inbounds i8, i8* %1, i64 %4910
  store i8 %4911, i8* %4912, align 1
  %4913 = getelementptr inbounds i8, i8* %1, i64 %4910
  %4914 = load i8, i8* %4913, align 1
  %4915 = zext i8 %4914 to i32
  %4916 = icmp eq i32 %4915, 0
  br i1 %4916, label %4917, label %4920

4917:                                             ; preds = %4909
  %4918 = mul nuw nsw i64 %4910, 16
  %4919 = getelementptr inbounds i8, i8* %0, i64 %4918
  call void @llvm.memset.p0i8.i64(i8* align 1 %4919, i8 0, i64 16, i1 false)
  br label %4920

4920:                                             ; preds = %4917, %4909
  %4921 = add nuw nsw i64 %4910, 1
  %4922 = call zeroext i8 @randombit()
  %4923 = getelementptr inbounds i8, i8* %1, i64 %4921
  store i8 %4922, i8* %4923, align 1
  %4924 = getelementptr inbounds i8, i8* %1, i64 %4921
  %4925 = load i8, i8* %4924, align 1
  %4926 = zext i8 %4925 to i32
  %4927 = icmp eq i32 %4926, 0
  br i1 %4927, label %4928, label %4931

4928:                                             ; preds = %4920
  %4929 = mul nuw nsw i64 %4921, 16
  %4930 = getelementptr inbounds i8, i8* %0, i64 %4929
  call void @llvm.memset.p0i8.i64(i8* align 1 %4930, i8 0, i64 16, i1 false)
  br label %4931

4931:                                             ; preds = %4928, %4920
  %4932 = add nuw nsw i64 %4921, 1
  %4933 = call zeroext i8 @randombit()
  %4934 = getelementptr inbounds i8, i8* %1, i64 %4932
  store i8 %4933, i8* %4934, align 1
  %4935 = getelementptr inbounds i8, i8* %1, i64 %4932
  %4936 = load i8, i8* %4935, align 1
  %4937 = zext i8 %4936 to i32
  %4938 = icmp eq i32 %4937, 0
  br i1 %4938, label %4939, label %4942

4939:                                             ; preds = %4931
  %4940 = mul nuw nsw i64 %4932, 16
  %4941 = getelementptr inbounds i8, i8* %0, i64 %4940
  call void @llvm.memset.p0i8.i64(i8* align 1 %4941, i8 0, i64 16, i1 false)
  br label %4942

4942:                                             ; preds = %4939, %4931
  %4943 = add nuw nsw i64 %4932, 1
  %4944 = call zeroext i8 @randombit()
  %4945 = getelementptr inbounds i8, i8* %1, i64 %4943
  store i8 %4944, i8* %4945, align 1
  %4946 = getelementptr inbounds i8, i8* %1, i64 %4943
  %4947 = load i8, i8* %4946, align 1
  %4948 = zext i8 %4947 to i32
  %4949 = icmp eq i32 %4948, 0
  br i1 %4949, label %4950, label %4953

4950:                                             ; preds = %4942
  %4951 = mul nuw nsw i64 %4943, 16
  %4952 = getelementptr inbounds i8, i8* %0, i64 %4951
  call void @llvm.memset.p0i8.i64(i8* align 1 %4952, i8 0, i64 16, i1 false)
  br label %4953

4953:                                             ; preds = %4950, %4942
  %4954 = add nuw nsw i64 %4943, 1
  %4955 = call zeroext i8 @randombit()
  %4956 = getelementptr inbounds i8, i8* %1, i64 %4954
  store i8 %4955, i8* %4956, align 1
  %4957 = getelementptr inbounds i8, i8* %1, i64 %4954
  %4958 = load i8, i8* %4957, align 1
  %4959 = zext i8 %4958 to i32
  %4960 = icmp eq i32 %4959, 0
  br i1 %4960, label %4961, label %4964

4961:                                             ; preds = %4953
  %4962 = mul nuw nsw i64 %4954, 16
  %4963 = getelementptr inbounds i8, i8* %0, i64 %4962
  call void @llvm.memset.p0i8.i64(i8* align 1 %4963, i8 0, i64 16, i1 false)
  br label %4964

4964:                                             ; preds = %4961, %4953
  %4965 = add nuw nsw i64 %4954, 1
  %4966 = call zeroext i8 @randombit()
  %4967 = getelementptr inbounds i8, i8* %1, i64 %4965
  store i8 %4966, i8* %4967, align 1
  %4968 = getelementptr inbounds i8, i8* %1, i64 %4965
  %4969 = load i8, i8* %4968, align 1
  %4970 = zext i8 %4969 to i32
  %4971 = icmp eq i32 %4970, 0
  br i1 %4971, label %4972, label %4975

4972:                                             ; preds = %4964
  %4973 = mul nuw nsw i64 %4965, 16
  %4974 = getelementptr inbounds i8, i8* %0, i64 %4973
  call void @llvm.memset.p0i8.i64(i8* align 1 %4974, i8 0, i64 16, i1 false)
  br label %4975

4975:                                             ; preds = %4972, %4964
  %4976 = add nuw nsw i64 %4965, 1
  %4977 = call zeroext i8 @randombit()
  %4978 = getelementptr inbounds i8, i8* %1, i64 %4976
  store i8 %4977, i8* %4978, align 1
  %4979 = getelementptr inbounds i8, i8* %1, i64 %4976
  %4980 = load i8, i8* %4979, align 1
  %4981 = zext i8 %4980 to i32
  %4982 = icmp eq i32 %4981, 0
  br i1 %4982, label %4983, label %4986

4983:                                             ; preds = %4975
  %4984 = mul nuw nsw i64 %4976, 16
  %4985 = getelementptr inbounds i8, i8* %0, i64 %4984
  call void @llvm.memset.p0i8.i64(i8* align 1 %4985, i8 0, i64 16, i1 false)
  br label %4986

4986:                                             ; preds = %4983, %4975
  %4987 = add nuw nsw i64 %4976, 1
  %4988 = call zeroext i8 @randombit()
  %4989 = getelementptr inbounds i8, i8* %1, i64 %4987
  store i8 %4988, i8* %4989, align 1
  %4990 = getelementptr inbounds i8, i8* %1, i64 %4987
  %4991 = load i8, i8* %4990, align 1
  %4992 = zext i8 %4991 to i32
  %4993 = icmp eq i32 %4992, 0
  br i1 %4993, label %4994, label %4997

4994:                                             ; preds = %4986
  %4995 = mul nuw nsw i64 %4987, 16
  %4996 = getelementptr inbounds i8, i8* %0, i64 %4995
  call void @llvm.memset.p0i8.i64(i8* align 1 %4996, i8 0, i64 16, i1 false)
  br label %4997

4997:                                             ; preds = %4994, %4986
  %4998 = add nuw nsw i64 %4987, 1
  %4999 = call zeroext i8 @randombit()
  %5000 = getelementptr inbounds i8, i8* %1, i64 %4998
  store i8 %4999, i8* %5000, align 1
  %5001 = getelementptr inbounds i8, i8* %1, i64 %4998
  %5002 = load i8, i8* %5001, align 1
  %5003 = zext i8 %5002 to i32
  %5004 = icmp eq i32 %5003, 0
  br i1 %5004, label %5005, label %5008

5005:                                             ; preds = %4997
  %5006 = mul nuw nsw i64 %4998, 16
  %5007 = getelementptr inbounds i8, i8* %0, i64 %5006
  call void @llvm.memset.p0i8.i64(i8* align 1 %5007, i8 0, i64 16, i1 false)
  br label %5008

5008:                                             ; preds = %5005, %4997
  %5009 = add nuw nsw i64 %4998, 1
  %5010 = call zeroext i8 @randombit()
  %5011 = getelementptr inbounds i8, i8* %1, i64 %5009
  store i8 %5010, i8* %5011, align 1
  %5012 = getelementptr inbounds i8, i8* %1, i64 %5009
  %5013 = load i8, i8* %5012, align 1
  %5014 = zext i8 %5013 to i32
  %5015 = icmp eq i32 %5014, 0
  br i1 %5015, label %5016, label %5019

5016:                                             ; preds = %5008
  %5017 = mul nuw nsw i64 %5009, 16
  %5018 = getelementptr inbounds i8, i8* %0, i64 %5017
  call void @llvm.memset.p0i8.i64(i8* align 1 %5018, i8 0, i64 16, i1 false)
  br label %5019

5019:                                             ; preds = %5016, %5008
  %5020 = add nuw nsw i64 %5009, 1
  %5021 = call zeroext i8 @randombit()
  %5022 = getelementptr inbounds i8, i8* %1, i64 %5020
  store i8 %5021, i8* %5022, align 1
  %5023 = getelementptr inbounds i8, i8* %1, i64 %5020
  %5024 = load i8, i8* %5023, align 1
  %5025 = zext i8 %5024 to i32
  %5026 = icmp eq i32 %5025, 0
  br i1 %5026, label %5027, label %5030

5027:                                             ; preds = %5019
  %5028 = mul nuw nsw i64 %5020, 16
  %5029 = getelementptr inbounds i8, i8* %0, i64 %5028
  call void @llvm.memset.p0i8.i64(i8* align 1 %5029, i8 0, i64 16, i1 false)
  br label %5030

5030:                                             ; preds = %5027, %5019
  %5031 = add nuw nsw i64 %5020, 1
  %5032 = call zeroext i8 @randombit()
  %5033 = getelementptr inbounds i8, i8* %1, i64 %5031
  store i8 %5032, i8* %5033, align 1
  %5034 = getelementptr inbounds i8, i8* %1, i64 %5031
  %5035 = load i8, i8* %5034, align 1
  %5036 = zext i8 %5035 to i32
  %5037 = icmp eq i32 %5036, 0
  br i1 %5037, label %5038, label %5041

5038:                                             ; preds = %5030
  %5039 = mul nuw nsw i64 %5031, 16
  %5040 = getelementptr inbounds i8, i8* %0, i64 %5039
  call void @llvm.memset.p0i8.i64(i8* align 1 %5040, i8 0, i64 16, i1 false)
  br label %5041

5041:                                             ; preds = %5038, %5030
  %5042 = add nuw nsw i64 %5031, 1
  %5043 = call zeroext i8 @randombit()
  %5044 = getelementptr inbounds i8, i8* %1, i64 %5042
  store i8 %5043, i8* %5044, align 1
  %5045 = getelementptr inbounds i8, i8* %1, i64 %5042
  %5046 = load i8, i8* %5045, align 1
  %5047 = zext i8 %5046 to i32
  %5048 = icmp eq i32 %5047, 0
  br i1 %5048, label %5049, label %5052

5049:                                             ; preds = %5041
  %5050 = mul nuw nsw i64 %5042, 16
  %5051 = getelementptr inbounds i8, i8* %0, i64 %5050
  call void @llvm.memset.p0i8.i64(i8* align 1 %5051, i8 0, i64 16, i1 false)
  br label %5052

5052:                                             ; preds = %5049, %5041
  %5053 = add nuw nsw i64 %5042, 1
  %5054 = call zeroext i8 @randombit()
  %5055 = getelementptr inbounds i8, i8* %1, i64 %5053
  store i8 %5054, i8* %5055, align 1
  %5056 = getelementptr inbounds i8, i8* %1, i64 %5053
  %5057 = load i8, i8* %5056, align 1
  %5058 = zext i8 %5057 to i32
  %5059 = icmp eq i32 %5058, 0
  br i1 %5059, label %5060, label %5063

5060:                                             ; preds = %5052
  %5061 = mul nuw nsw i64 %5053, 16
  %5062 = getelementptr inbounds i8, i8* %0, i64 %5061
  call void @llvm.memset.p0i8.i64(i8* align 1 %5062, i8 0, i64 16, i1 false)
  br label %5063

5063:                                             ; preds = %5060, %5052
  %5064 = add nuw nsw i64 %5053, 1
  %5065 = call zeroext i8 @randombit()
  %5066 = getelementptr inbounds i8, i8* %1, i64 %5064
  store i8 %5065, i8* %5066, align 1
  %5067 = getelementptr inbounds i8, i8* %1, i64 %5064
  %5068 = load i8, i8* %5067, align 1
  %5069 = zext i8 %5068 to i32
  %5070 = icmp eq i32 %5069, 0
  br i1 %5070, label %5071, label %5074

5071:                                             ; preds = %5063
  %5072 = mul nuw nsw i64 %5064, 16
  %5073 = getelementptr inbounds i8, i8* %0, i64 %5072
  call void @llvm.memset.p0i8.i64(i8* align 1 %5073, i8 0, i64 16, i1 false)
  br label %5074

5074:                                             ; preds = %5071, %5063
  %5075 = add nuw nsw i64 %5064, 1
  %5076 = call zeroext i8 @randombit()
  %5077 = getelementptr inbounds i8, i8* %1, i64 %5075
  store i8 %5076, i8* %5077, align 1
  %5078 = getelementptr inbounds i8, i8* %1, i64 %5075
  %5079 = load i8, i8* %5078, align 1
  %5080 = zext i8 %5079 to i32
  %5081 = icmp eq i32 %5080, 0
  br i1 %5081, label %5082, label %5085

5082:                                             ; preds = %5074
  %5083 = mul nuw nsw i64 %5075, 16
  %5084 = getelementptr inbounds i8, i8* %0, i64 %5083
  call void @llvm.memset.p0i8.i64(i8* align 1 %5084, i8 0, i64 16, i1 false)
  br label %5085

5085:                                             ; preds = %5082, %5074
  %5086 = add nuw nsw i64 %5075, 1
  %5087 = call zeroext i8 @randombit()
  %5088 = getelementptr inbounds i8, i8* %1, i64 %5086
  store i8 %5087, i8* %5088, align 1
  %5089 = getelementptr inbounds i8, i8* %1, i64 %5086
  %5090 = load i8, i8* %5089, align 1
  %5091 = zext i8 %5090 to i32
  %5092 = icmp eq i32 %5091, 0
  br i1 %5092, label %5093, label %5096

5093:                                             ; preds = %5085
  %5094 = mul nuw nsw i64 %5086, 16
  %5095 = getelementptr inbounds i8, i8* %0, i64 %5094
  call void @llvm.memset.p0i8.i64(i8* align 1 %5095, i8 0, i64 16, i1 false)
  br label %5096

5096:                                             ; preds = %5093, %5085
  %5097 = add nuw nsw i64 %5086, 1
  %5098 = call zeroext i8 @randombit()
  %5099 = getelementptr inbounds i8, i8* %1, i64 %5097
  store i8 %5098, i8* %5099, align 1
  %5100 = getelementptr inbounds i8, i8* %1, i64 %5097
  %5101 = load i8, i8* %5100, align 1
  %5102 = zext i8 %5101 to i32
  %5103 = icmp eq i32 %5102, 0
  br i1 %5103, label %5104, label %5107

5104:                                             ; preds = %5096
  %5105 = mul nuw nsw i64 %5097, 16
  %5106 = getelementptr inbounds i8, i8* %0, i64 %5105
  call void @llvm.memset.p0i8.i64(i8* align 1 %5106, i8 0, i64 16, i1 false)
  br label %5107

5107:                                             ; preds = %5104, %5096
  %5108 = add nuw nsw i64 %5097, 1
  %5109 = call zeroext i8 @randombit()
  %5110 = getelementptr inbounds i8, i8* %1, i64 %5108
  store i8 %5109, i8* %5110, align 1
  %5111 = getelementptr inbounds i8, i8* %1, i64 %5108
  %5112 = load i8, i8* %5111, align 1
  %5113 = zext i8 %5112 to i32
  %5114 = icmp eq i32 %5113, 0
  br i1 %5114, label %5115, label %5118

5115:                                             ; preds = %5107
  %5116 = mul nuw nsw i64 %5108, 16
  %5117 = getelementptr inbounds i8, i8* %0, i64 %5116
  call void @llvm.memset.p0i8.i64(i8* align 1 %5117, i8 0, i64 16, i1 false)
  br label %5118

5118:                                             ; preds = %5115, %5107
  %5119 = add nuw nsw i64 %5108, 1
  %5120 = call zeroext i8 @randombit()
  %5121 = getelementptr inbounds i8, i8* %1, i64 %5119
  store i8 %5120, i8* %5121, align 1
  %5122 = getelementptr inbounds i8, i8* %1, i64 %5119
  %5123 = load i8, i8* %5122, align 1
  %5124 = zext i8 %5123 to i32
  %5125 = icmp eq i32 %5124, 0
  br i1 %5125, label %5126, label %5129

5126:                                             ; preds = %5118
  %5127 = mul nuw nsw i64 %5119, 16
  %5128 = getelementptr inbounds i8, i8* %0, i64 %5127
  call void @llvm.memset.p0i8.i64(i8* align 1 %5128, i8 0, i64 16, i1 false)
  br label %5129

5129:                                             ; preds = %5126, %5118
  %5130 = add nuw nsw i64 %5119, 1
  %5131 = call zeroext i8 @randombit()
  %5132 = getelementptr inbounds i8, i8* %1, i64 %5130
  store i8 %5131, i8* %5132, align 1
  %5133 = getelementptr inbounds i8, i8* %1, i64 %5130
  %5134 = load i8, i8* %5133, align 1
  %5135 = zext i8 %5134 to i32
  %5136 = icmp eq i32 %5135, 0
  br i1 %5136, label %5137, label %5140

5137:                                             ; preds = %5129
  %5138 = mul nuw nsw i64 %5130, 16
  %5139 = getelementptr inbounds i8, i8* %0, i64 %5138
  call void @llvm.memset.p0i8.i64(i8* align 1 %5139, i8 0, i64 16, i1 false)
  br label %5140

5140:                                             ; preds = %5137, %5129
  %5141 = add nuw nsw i64 %5130, 1
  %5142 = call zeroext i8 @randombit()
  %5143 = getelementptr inbounds i8, i8* %1, i64 %5141
  store i8 %5142, i8* %5143, align 1
  %5144 = getelementptr inbounds i8, i8* %1, i64 %5141
  %5145 = load i8, i8* %5144, align 1
  %5146 = zext i8 %5145 to i32
  %5147 = icmp eq i32 %5146, 0
  br i1 %5147, label %5148, label %5151

5148:                                             ; preds = %5140
  %5149 = mul nuw nsw i64 %5141, 16
  %5150 = getelementptr inbounds i8, i8* %0, i64 %5149
  call void @llvm.memset.p0i8.i64(i8* align 1 %5150, i8 0, i64 16, i1 false)
  br label %5151

5151:                                             ; preds = %5148, %5140
  %5152 = add nuw nsw i64 %5141, 1
  %5153 = call zeroext i8 @randombit()
  %5154 = getelementptr inbounds i8, i8* %1, i64 %5152
  store i8 %5153, i8* %5154, align 1
  %5155 = getelementptr inbounds i8, i8* %1, i64 %5152
  %5156 = load i8, i8* %5155, align 1
  %5157 = zext i8 %5156 to i32
  %5158 = icmp eq i32 %5157, 0
  br i1 %5158, label %5159, label %5162

5159:                                             ; preds = %5151
  %5160 = mul nuw nsw i64 %5152, 16
  %5161 = getelementptr inbounds i8, i8* %0, i64 %5160
  call void @llvm.memset.p0i8.i64(i8* align 1 %5161, i8 0, i64 16, i1 false)
  br label %5162

5162:                                             ; preds = %5159, %5151
  %5163 = add nuw nsw i64 %5152, 1
  %5164 = call zeroext i8 @randombit()
  %5165 = getelementptr inbounds i8, i8* %1, i64 %5163
  store i8 %5164, i8* %5165, align 1
  %5166 = getelementptr inbounds i8, i8* %1, i64 %5163
  %5167 = load i8, i8* %5166, align 1
  %5168 = zext i8 %5167 to i32
  %5169 = icmp eq i32 %5168, 0
  br i1 %5169, label %5170, label %5173

5170:                                             ; preds = %5162
  %5171 = mul nuw nsw i64 %5163, 16
  %5172 = getelementptr inbounds i8, i8* %0, i64 %5171
  call void @llvm.memset.p0i8.i64(i8* align 1 %5172, i8 0, i64 16, i1 false)
  br label %5173

5173:                                             ; preds = %5170, %5162
  %5174 = add nuw nsw i64 %5163, 1
  %5175 = call zeroext i8 @randombit()
  %5176 = getelementptr inbounds i8, i8* %1, i64 %5174
  store i8 %5175, i8* %5176, align 1
  %5177 = getelementptr inbounds i8, i8* %1, i64 %5174
  %5178 = load i8, i8* %5177, align 1
  %5179 = zext i8 %5178 to i32
  %5180 = icmp eq i32 %5179, 0
  br i1 %5180, label %5181, label %5184

5181:                                             ; preds = %5173
  %5182 = mul nuw nsw i64 %5174, 16
  %5183 = getelementptr inbounds i8, i8* %0, i64 %5182
  call void @llvm.memset.p0i8.i64(i8* align 1 %5183, i8 0, i64 16, i1 false)
  br label %5184

5184:                                             ; preds = %5181, %5173
  %5185 = add nuw nsw i64 %5174, 1
  %5186 = call zeroext i8 @randombit()
  %5187 = getelementptr inbounds i8, i8* %1, i64 %5185
  store i8 %5186, i8* %5187, align 1
  %5188 = getelementptr inbounds i8, i8* %1, i64 %5185
  %5189 = load i8, i8* %5188, align 1
  %5190 = zext i8 %5189 to i32
  %5191 = icmp eq i32 %5190, 0
  br i1 %5191, label %5192, label %5195

5192:                                             ; preds = %5184
  %5193 = mul nuw nsw i64 %5185, 16
  %5194 = getelementptr inbounds i8, i8* %0, i64 %5193
  call void @llvm.memset.p0i8.i64(i8* align 1 %5194, i8 0, i64 16, i1 false)
  br label %5195

5195:                                             ; preds = %5192, %5184
  %5196 = add nuw nsw i64 %5185, 1
  %5197 = call zeroext i8 @randombit()
  %5198 = getelementptr inbounds i8, i8* %1, i64 %5196
  store i8 %5197, i8* %5198, align 1
  %5199 = getelementptr inbounds i8, i8* %1, i64 %5196
  %5200 = load i8, i8* %5199, align 1
  %5201 = zext i8 %5200 to i32
  %5202 = icmp eq i32 %5201, 0
  br i1 %5202, label %5203, label %5206

5203:                                             ; preds = %5195
  %5204 = mul nuw nsw i64 %5196, 16
  %5205 = getelementptr inbounds i8, i8* %0, i64 %5204
  call void @llvm.memset.p0i8.i64(i8* align 1 %5205, i8 0, i64 16, i1 false)
  br label %5206

5206:                                             ; preds = %5203, %5195
  %5207 = add nuw nsw i64 %5196, 1
  %5208 = call zeroext i8 @randombit()
  %5209 = getelementptr inbounds i8, i8* %1, i64 %5207
  store i8 %5208, i8* %5209, align 1
  %5210 = getelementptr inbounds i8, i8* %1, i64 %5207
  %5211 = load i8, i8* %5210, align 1
  %5212 = zext i8 %5211 to i32
  %5213 = icmp eq i32 %5212, 0
  br i1 %5213, label %5214, label %5217

5214:                                             ; preds = %5206
  %5215 = mul nuw nsw i64 %5207, 16
  %5216 = getelementptr inbounds i8, i8* %0, i64 %5215
  call void @llvm.memset.p0i8.i64(i8* align 1 %5216, i8 0, i64 16, i1 false)
  br label %5217

5217:                                             ; preds = %5214, %5206
  %5218 = add nuw nsw i64 %5207, 1
  %5219 = call zeroext i8 @randombit()
  %5220 = getelementptr inbounds i8, i8* %1, i64 %5218
  store i8 %5219, i8* %5220, align 1
  %5221 = getelementptr inbounds i8, i8* %1, i64 %5218
  %5222 = load i8, i8* %5221, align 1
  %5223 = zext i8 %5222 to i32
  %5224 = icmp eq i32 %5223, 0
  br i1 %5224, label %5225, label %5228

5225:                                             ; preds = %5217
  %5226 = mul nuw nsw i64 %5218, 16
  %5227 = getelementptr inbounds i8, i8* %0, i64 %5226
  call void @llvm.memset.p0i8.i64(i8* align 1 %5227, i8 0, i64 16, i1 false)
  br label %5228

5228:                                             ; preds = %5225, %5217
  %5229 = add nuw nsw i64 %5218, 1
  %5230 = call zeroext i8 @randombit()
  %5231 = getelementptr inbounds i8, i8* %1, i64 %5229
  store i8 %5230, i8* %5231, align 1
  %5232 = getelementptr inbounds i8, i8* %1, i64 %5229
  %5233 = load i8, i8* %5232, align 1
  %5234 = zext i8 %5233 to i32
  %5235 = icmp eq i32 %5234, 0
  br i1 %5235, label %5236, label %5239

5236:                                             ; preds = %5228
  %5237 = mul nuw nsw i64 %5229, 16
  %5238 = getelementptr inbounds i8, i8* %0, i64 %5237
  call void @llvm.memset.p0i8.i64(i8* align 1 %5238, i8 0, i64 16, i1 false)
  br label %5239

5239:                                             ; preds = %5236, %5228
  %5240 = add nuw nsw i64 %5229, 1
  %5241 = call zeroext i8 @randombit()
  %5242 = getelementptr inbounds i8, i8* %1, i64 %5240
  store i8 %5241, i8* %5242, align 1
  %5243 = getelementptr inbounds i8, i8* %1, i64 %5240
  %5244 = load i8, i8* %5243, align 1
  %5245 = zext i8 %5244 to i32
  %5246 = icmp eq i32 %5245, 0
  br i1 %5246, label %5247, label %5250

5247:                                             ; preds = %5239
  %5248 = mul nuw nsw i64 %5240, 16
  %5249 = getelementptr inbounds i8, i8* %0, i64 %5248
  call void @llvm.memset.p0i8.i64(i8* align 1 %5249, i8 0, i64 16, i1 false)
  br label %5250

5250:                                             ; preds = %5247, %5239
  %5251 = add nuw nsw i64 %5240, 1
  %5252 = call zeroext i8 @randombit()
  %5253 = getelementptr inbounds i8, i8* %1, i64 %5251
  store i8 %5252, i8* %5253, align 1
  %5254 = getelementptr inbounds i8, i8* %1, i64 %5251
  %5255 = load i8, i8* %5254, align 1
  %5256 = zext i8 %5255 to i32
  %5257 = icmp eq i32 %5256, 0
  br i1 %5257, label %5258, label %5261

5258:                                             ; preds = %5250
  %5259 = mul nuw nsw i64 %5251, 16
  %5260 = getelementptr inbounds i8, i8* %0, i64 %5259
  call void @llvm.memset.p0i8.i64(i8* align 1 %5260, i8 0, i64 16, i1 false)
  br label %5261

5261:                                             ; preds = %5258, %5250
  %5262 = add nuw nsw i64 %5251, 1
  %5263 = call zeroext i8 @randombit()
  %5264 = getelementptr inbounds i8, i8* %1, i64 %5262
  store i8 %5263, i8* %5264, align 1
  %5265 = getelementptr inbounds i8, i8* %1, i64 %5262
  %5266 = load i8, i8* %5265, align 1
  %5267 = zext i8 %5266 to i32
  %5268 = icmp eq i32 %5267, 0
  br i1 %5268, label %5269, label %5272

5269:                                             ; preds = %5261
  %5270 = mul nuw nsw i64 %5262, 16
  %5271 = getelementptr inbounds i8, i8* %0, i64 %5270
  call void @llvm.memset.p0i8.i64(i8* align 1 %5271, i8 0, i64 16, i1 false)
  br label %5272

5272:                                             ; preds = %5269, %5261
  %5273 = add nuw nsw i64 %5262, 1
  %5274 = call zeroext i8 @randombit()
  %5275 = getelementptr inbounds i8, i8* %1, i64 %5273
  store i8 %5274, i8* %5275, align 1
  %5276 = getelementptr inbounds i8, i8* %1, i64 %5273
  %5277 = load i8, i8* %5276, align 1
  %5278 = zext i8 %5277 to i32
  %5279 = icmp eq i32 %5278, 0
  br i1 %5279, label %5280, label %5283

5280:                                             ; preds = %5272
  %5281 = mul nuw nsw i64 %5273, 16
  %5282 = getelementptr inbounds i8, i8* %0, i64 %5281
  call void @llvm.memset.p0i8.i64(i8* align 1 %5282, i8 0, i64 16, i1 false)
  br label %5283

5283:                                             ; preds = %5280, %5272
  %5284 = add nuw nsw i64 %5273, 1
  %5285 = call zeroext i8 @randombit()
  %5286 = getelementptr inbounds i8, i8* %1, i64 %5284
  store i8 %5285, i8* %5286, align 1
  %5287 = getelementptr inbounds i8, i8* %1, i64 %5284
  %5288 = load i8, i8* %5287, align 1
  %5289 = zext i8 %5288 to i32
  %5290 = icmp eq i32 %5289, 0
  br i1 %5290, label %5291, label %5294

5291:                                             ; preds = %5283
  %5292 = mul nuw nsw i64 %5284, 16
  %5293 = getelementptr inbounds i8, i8* %0, i64 %5292
  call void @llvm.memset.p0i8.i64(i8* align 1 %5293, i8 0, i64 16, i1 false)
  br label %5294

5294:                                             ; preds = %5291, %5283
  %5295 = add nuw nsw i64 %5284, 1
  %5296 = call zeroext i8 @randombit()
  %5297 = getelementptr inbounds i8, i8* %1, i64 %5295
  store i8 %5296, i8* %5297, align 1
  %5298 = getelementptr inbounds i8, i8* %1, i64 %5295
  %5299 = load i8, i8* %5298, align 1
  %5300 = zext i8 %5299 to i32
  %5301 = icmp eq i32 %5300, 0
  br i1 %5301, label %5302, label %5305

5302:                                             ; preds = %5294
  %5303 = mul nuw nsw i64 %5295, 16
  %5304 = getelementptr inbounds i8, i8* %0, i64 %5303
  call void @llvm.memset.p0i8.i64(i8* align 1 %5304, i8 0, i64 16, i1 false)
  br label %5305

5305:                                             ; preds = %5302, %5294
  %5306 = add nuw nsw i64 %5295, 1
  %5307 = call zeroext i8 @randombit()
  %5308 = getelementptr inbounds i8, i8* %1, i64 %5306
  store i8 %5307, i8* %5308, align 1
  %5309 = getelementptr inbounds i8, i8* %1, i64 %5306
  %5310 = load i8, i8* %5309, align 1
  %5311 = zext i8 %5310 to i32
  %5312 = icmp eq i32 %5311, 0
  br i1 %5312, label %5313, label %5316

5313:                                             ; preds = %5305
  %5314 = mul nuw nsw i64 %5306, 16
  %5315 = getelementptr inbounds i8, i8* %0, i64 %5314
  call void @llvm.memset.p0i8.i64(i8* align 1 %5315, i8 0, i64 16, i1 false)
  br label %5316

5316:                                             ; preds = %5313, %5305
  %5317 = add nuw nsw i64 %5306, 1
  %5318 = call zeroext i8 @randombit()
  %5319 = getelementptr inbounds i8, i8* %1, i64 %5317
  store i8 %5318, i8* %5319, align 1
  %5320 = getelementptr inbounds i8, i8* %1, i64 %5317
  %5321 = load i8, i8* %5320, align 1
  %5322 = zext i8 %5321 to i32
  %5323 = icmp eq i32 %5322, 0
  br i1 %5323, label %5324, label %5327

5324:                                             ; preds = %5316
  %5325 = mul nuw nsw i64 %5317, 16
  %5326 = getelementptr inbounds i8, i8* %0, i64 %5325
  call void @llvm.memset.p0i8.i64(i8* align 1 %5326, i8 0, i64 16, i1 false)
  br label %5327

5327:                                             ; preds = %5324, %5316
  %5328 = add nuw nsw i64 %5317, 1
  %5329 = call zeroext i8 @randombit()
  %5330 = getelementptr inbounds i8, i8* %1, i64 %5328
  store i8 %5329, i8* %5330, align 1
  %5331 = getelementptr inbounds i8, i8* %1, i64 %5328
  %5332 = load i8, i8* %5331, align 1
  %5333 = zext i8 %5332 to i32
  %5334 = icmp eq i32 %5333, 0
  br i1 %5334, label %5335, label %5338

5335:                                             ; preds = %5327
  %5336 = mul nuw nsw i64 %5328, 16
  %5337 = getelementptr inbounds i8, i8* %0, i64 %5336
  call void @llvm.memset.p0i8.i64(i8* align 1 %5337, i8 0, i64 16, i1 false)
  br label %5338

5338:                                             ; preds = %5335, %5327
  %5339 = add nuw nsw i64 %5328, 1
  %5340 = call zeroext i8 @randombit()
  %5341 = getelementptr inbounds i8, i8* %1, i64 %5339
  store i8 %5340, i8* %5341, align 1
  %5342 = getelementptr inbounds i8, i8* %1, i64 %5339
  %5343 = load i8, i8* %5342, align 1
  %5344 = zext i8 %5343 to i32
  %5345 = icmp eq i32 %5344, 0
  br i1 %5345, label %5346, label %5349

5346:                                             ; preds = %5338
  %5347 = mul nuw nsw i64 %5339, 16
  %5348 = getelementptr inbounds i8, i8* %0, i64 %5347
  call void @llvm.memset.p0i8.i64(i8* align 1 %5348, i8 0, i64 16, i1 false)
  br label %5349

5349:                                             ; preds = %5346, %5338
  %5350 = add nuw nsw i64 %5339, 1
  %5351 = call zeroext i8 @randombit()
  %5352 = getelementptr inbounds i8, i8* %1, i64 %5350
  store i8 %5351, i8* %5352, align 1
  %5353 = getelementptr inbounds i8, i8* %1, i64 %5350
  %5354 = load i8, i8* %5353, align 1
  %5355 = zext i8 %5354 to i32
  %5356 = icmp eq i32 %5355, 0
  br i1 %5356, label %5357, label %5360

5357:                                             ; preds = %5349
  %5358 = mul nuw nsw i64 %5350, 16
  %5359 = getelementptr inbounds i8, i8* %0, i64 %5358
  call void @llvm.memset.p0i8.i64(i8* align 1 %5359, i8 0, i64 16, i1 false)
  br label %5360

5360:                                             ; preds = %5357, %5349
  %5361 = add nuw nsw i64 %5350, 1
  %5362 = call zeroext i8 @randombit()
  %5363 = getelementptr inbounds i8, i8* %1, i64 %5361
  store i8 %5362, i8* %5363, align 1
  %5364 = getelementptr inbounds i8, i8* %1, i64 %5361
  %5365 = load i8, i8* %5364, align 1
  %5366 = zext i8 %5365 to i32
  %5367 = icmp eq i32 %5366, 0
  br i1 %5367, label %5368, label %5371

5368:                                             ; preds = %5360
  %5369 = mul nuw nsw i64 %5361, 16
  %5370 = getelementptr inbounds i8, i8* %0, i64 %5369
  call void @llvm.memset.p0i8.i64(i8* align 1 %5370, i8 0, i64 16, i1 false)
  br label %5371

5371:                                             ; preds = %5368, %5360
  %5372 = add nuw nsw i64 %5361, 1
  %5373 = call zeroext i8 @randombit()
  %5374 = getelementptr inbounds i8, i8* %1, i64 %5372
  store i8 %5373, i8* %5374, align 1
  %5375 = getelementptr inbounds i8, i8* %1, i64 %5372
  %5376 = load i8, i8* %5375, align 1
  %5377 = zext i8 %5376 to i32
  %5378 = icmp eq i32 %5377, 0
  br i1 %5378, label %5379, label %5382

5379:                                             ; preds = %5371
  %5380 = mul nuw nsw i64 %5372, 16
  %5381 = getelementptr inbounds i8, i8* %0, i64 %5380
  call void @llvm.memset.p0i8.i64(i8* align 1 %5381, i8 0, i64 16, i1 false)
  br label %5382

5382:                                             ; preds = %5379, %5371
  %5383 = add nuw nsw i64 %5372, 1
  %5384 = call zeroext i8 @randombit()
  %5385 = getelementptr inbounds i8, i8* %1, i64 %5383
  store i8 %5384, i8* %5385, align 1
  %5386 = getelementptr inbounds i8, i8* %1, i64 %5383
  %5387 = load i8, i8* %5386, align 1
  %5388 = zext i8 %5387 to i32
  %5389 = icmp eq i32 %5388, 0
  br i1 %5389, label %5390, label %5393

5390:                                             ; preds = %5382
  %5391 = mul nuw nsw i64 %5383, 16
  %5392 = getelementptr inbounds i8, i8* %0, i64 %5391
  call void @llvm.memset.p0i8.i64(i8* align 1 %5392, i8 0, i64 16, i1 false)
  br label %5393

5393:                                             ; preds = %5390, %5382
  %5394 = add nuw nsw i64 %5383, 1
  %5395 = call zeroext i8 @randombit()
  %5396 = getelementptr inbounds i8, i8* %1, i64 %5394
  store i8 %5395, i8* %5396, align 1
  %5397 = getelementptr inbounds i8, i8* %1, i64 %5394
  %5398 = load i8, i8* %5397, align 1
  %5399 = zext i8 %5398 to i32
  %5400 = icmp eq i32 %5399, 0
  br i1 %5400, label %5401, label %5404

5401:                                             ; preds = %5393
  %5402 = mul nuw nsw i64 %5394, 16
  %5403 = getelementptr inbounds i8, i8* %0, i64 %5402
  call void @llvm.memset.p0i8.i64(i8* align 1 %5403, i8 0, i64 16, i1 false)
  br label %5404

5404:                                             ; preds = %5401, %5393
  %5405 = add nuw nsw i64 %5394, 1
  %5406 = call zeroext i8 @randombit()
  %5407 = getelementptr inbounds i8, i8* %1, i64 %5405
  store i8 %5406, i8* %5407, align 1
  %5408 = getelementptr inbounds i8, i8* %1, i64 %5405
  %5409 = load i8, i8* %5408, align 1
  %5410 = zext i8 %5409 to i32
  %5411 = icmp eq i32 %5410, 0
  br i1 %5411, label %5412, label %5415

5412:                                             ; preds = %5404
  %5413 = mul nuw nsw i64 %5405, 16
  %5414 = getelementptr inbounds i8, i8* %0, i64 %5413
  call void @llvm.memset.p0i8.i64(i8* align 1 %5414, i8 0, i64 16, i1 false)
  br label %5415

5415:                                             ; preds = %5412, %5404
  %5416 = add nuw nsw i64 %5405, 1
  %5417 = call zeroext i8 @randombit()
  %5418 = getelementptr inbounds i8, i8* %1, i64 %5416
  store i8 %5417, i8* %5418, align 1
  %5419 = getelementptr inbounds i8, i8* %1, i64 %5416
  %5420 = load i8, i8* %5419, align 1
  %5421 = zext i8 %5420 to i32
  %5422 = icmp eq i32 %5421, 0
  br i1 %5422, label %5423, label %5426

5423:                                             ; preds = %5415
  %5424 = mul nuw nsw i64 %5416, 16
  %5425 = getelementptr inbounds i8, i8* %0, i64 %5424
  call void @llvm.memset.p0i8.i64(i8* align 1 %5425, i8 0, i64 16, i1 false)
  br label %5426

5426:                                             ; preds = %5423, %5415
  %5427 = add nuw nsw i64 %5416, 1
  %5428 = call zeroext i8 @randombit()
  %5429 = getelementptr inbounds i8, i8* %1, i64 %5427
  store i8 %5428, i8* %5429, align 1
  %5430 = getelementptr inbounds i8, i8* %1, i64 %5427
  %5431 = load i8, i8* %5430, align 1
  %5432 = zext i8 %5431 to i32
  %5433 = icmp eq i32 %5432, 0
  br i1 %5433, label %5434, label %5437

5434:                                             ; preds = %5426
  %5435 = mul nuw nsw i64 %5427, 16
  %5436 = getelementptr inbounds i8, i8* %0, i64 %5435
  call void @llvm.memset.p0i8.i64(i8* align 1 %5436, i8 0, i64 16, i1 false)
  br label %5437

5437:                                             ; preds = %5434, %5426
  %5438 = add nuw nsw i64 %5427, 1
  %5439 = call zeroext i8 @randombit()
  %5440 = getelementptr inbounds i8, i8* %1, i64 %5438
  store i8 %5439, i8* %5440, align 1
  %5441 = getelementptr inbounds i8, i8* %1, i64 %5438
  %5442 = load i8, i8* %5441, align 1
  %5443 = zext i8 %5442 to i32
  %5444 = icmp eq i32 %5443, 0
  br i1 %5444, label %5445, label %5448

5445:                                             ; preds = %5437
  %5446 = mul nuw nsw i64 %5438, 16
  %5447 = getelementptr inbounds i8, i8* %0, i64 %5446
  call void @llvm.memset.p0i8.i64(i8* align 1 %5447, i8 0, i64 16, i1 false)
  br label %5448

5448:                                             ; preds = %5445, %5437
  %5449 = add nuw nsw i64 %5438, 1
  %5450 = call zeroext i8 @randombit()
  %5451 = getelementptr inbounds i8, i8* %1, i64 %5449
  store i8 %5450, i8* %5451, align 1
  %5452 = getelementptr inbounds i8, i8* %1, i64 %5449
  %5453 = load i8, i8* %5452, align 1
  %5454 = zext i8 %5453 to i32
  %5455 = icmp eq i32 %5454, 0
  br i1 %5455, label %5456, label %5459

5456:                                             ; preds = %5448
  %5457 = mul nuw nsw i64 %5449, 16
  %5458 = getelementptr inbounds i8, i8* %0, i64 %5457
  call void @llvm.memset.p0i8.i64(i8* align 1 %5458, i8 0, i64 16, i1 false)
  br label %5459

5459:                                             ; preds = %5456, %5448
  %5460 = add nuw nsw i64 %5449, 1
  %5461 = call zeroext i8 @randombit()
  %5462 = getelementptr inbounds i8, i8* %1, i64 %5460
  store i8 %5461, i8* %5462, align 1
  %5463 = getelementptr inbounds i8, i8* %1, i64 %5460
  %5464 = load i8, i8* %5463, align 1
  %5465 = zext i8 %5464 to i32
  %5466 = icmp eq i32 %5465, 0
  br i1 %5466, label %5467, label %5470

5467:                                             ; preds = %5459
  %5468 = mul nuw nsw i64 %5460, 16
  %5469 = getelementptr inbounds i8, i8* %0, i64 %5468
  call void @llvm.memset.p0i8.i64(i8* align 1 %5469, i8 0, i64 16, i1 false)
  br label %5470

5470:                                             ; preds = %5467, %5459
  %5471 = add nuw nsw i64 %5460, 1
  %5472 = call zeroext i8 @randombit()
  %5473 = getelementptr inbounds i8, i8* %1, i64 %5471
  store i8 %5472, i8* %5473, align 1
  %5474 = getelementptr inbounds i8, i8* %1, i64 %5471
  %5475 = load i8, i8* %5474, align 1
  %5476 = zext i8 %5475 to i32
  %5477 = icmp eq i32 %5476, 0
  br i1 %5477, label %5478, label %5481

5478:                                             ; preds = %5470
  %5479 = mul nuw nsw i64 %5471, 16
  %5480 = getelementptr inbounds i8, i8* %0, i64 %5479
  call void @llvm.memset.p0i8.i64(i8* align 1 %5480, i8 0, i64 16, i1 false)
  br label %5481

5481:                                             ; preds = %5478, %5470
  %5482 = add nuw nsw i64 %5471, 1
  %5483 = call zeroext i8 @randombit()
  %5484 = getelementptr inbounds i8, i8* %1, i64 %5482
  store i8 %5483, i8* %5484, align 1
  %5485 = getelementptr inbounds i8, i8* %1, i64 %5482
  %5486 = load i8, i8* %5485, align 1
  %5487 = zext i8 %5486 to i32
  %5488 = icmp eq i32 %5487, 0
  br i1 %5488, label %5489, label %5492

5489:                                             ; preds = %5481
  %5490 = mul nuw nsw i64 %5482, 16
  %5491 = getelementptr inbounds i8, i8* %0, i64 %5490
  call void @llvm.memset.p0i8.i64(i8* align 1 %5491, i8 0, i64 16, i1 false)
  br label %5492

5492:                                             ; preds = %5489, %5481
  %5493 = add nuw nsw i64 %5482, 1
  %5494 = call zeroext i8 @randombit()
  %5495 = getelementptr inbounds i8, i8* %1, i64 %5493
  store i8 %5494, i8* %5495, align 1
  %5496 = getelementptr inbounds i8, i8* %1, i64 %5493
  %5497 = load i8, i8* %5496, align 1
  %5498 = zext i8 %5497 to i32
  %5499 = icmp eq i32 %5498, 0
  br i1 %5499, label %5500, label %5503

5500:                                             ; preds = %5492
  %5501 = mul nuw nsw i64 %5493, 16
  %5502 = getelementptr inbounds i8, i8* %0, i64 %5501
  call void @llvm.memset.p0i8.i64(i8* align 1 %5502, i8 0, i64 16, i1 false)
  br label %5503

5503:                                             ; preds = %5500, %5492
  %5504 = add nuw nsw i64 %5493, 1
  %5505 = call zeroext i8 @randombit()
  %5506 = getelementptr inbounds i8, i8* %1, i64 %5504
  store i8 %5505, i8* %5506, align 1
  %5507 = getelementptr inbounds i8, i8* %1, i64 %5504
  %5508 = load i8, i8* %5507, align 1
  %5509 = zext i8 %5508 to i32
  %5510 = icmp eq i32 %5509, 0
  br i1 %5510, label %5511, label %5514

5511:                                             ; preds = %5503
  %5512 = mul nuw nsw i64 %5504, 16
  %5513 = getelementptr inbounds i8, i8* %0, i64 %5512
  call void @llvm.memset.p0i8.i64(i8* align 1 %5513, i8 0, i64 16, i1 false)
  br label %5514

5514:                                             ; preds = %5511, %5503
  %5515 = add nuw nsw i64 %5504, 1
  %5516 = call zeroext i8 @randombit()
  %5517 = getelementptr inbounds i8, i8* %1, i64 %5515
  store i8 %5516, i8* %5517, align 1
  %5518 = getelementptr inbounds i8, i8* %1, i64 %5515
  %5519 = load i8, i8* %5518, align 1
  %5520 = zext i8 %5519 to i32
  %5521 = icmp eq i32 %5520, 0
  br i1 %5521, label %5522, label %5525

5522:                                             ; preds = %5514
  %5523 = mul nuw nsw i64 %5515, 16
  %5524 = getelementptr inbounds i8, i8* %0, i64 %5523
  call void @llvm.memset.p0i8.i64(i8* align 1 %5524, i8 0, i64 16, i1 false)
  br label %5525

5525:                                             ; preds = %5522, %5514
  %5526 = add nuw nsw i64 %5515, 1
  %5527 = call zeroext i8 @randombit()
  %5528 = getelementptr inbounds i8, i8* %1, i64 %5526
  store i8 %5527, i8* %5528, align 1
  %5529 = getelementptr inbounds i8, i8* %1, i64 %5526
  %5530 = load i8, i8* %5529, align 1
  %5531 = zext i8 %5530 to i32
  %5532 = icmp eq i32 %5531, 0
  br i1 %5532, label %5533, label %5536

5533:                                             ; preds = %5525
  %5534 = mul nuw nsw i64 %5526, 16
  %5535 = getelementptr inbounds i8, i8* %0, i64 %5534
  call void @llvm.memset.p0i8.i64(i8* align 1 %5535, i8 0, i64 16, i1 false)
  br label %5536

5536:                                             ; preds = %5533, %5525
  %5537 = add nuw nsw i64 %5526, 1
  %5538 = call zeroext i8 @randombit()
  %5539 = getelementptr inbounds i8, i8* %1, i64 %5537
  store i8 %5538, i8* %5539, align 1
  %5540 = getelementptr inbounds i8, i8* %1, i64 %5537
  %5541 = load i8, i8* %5540, align 1
  %5542 = zext i8 %5541 to i32
  %5543 = icmp eq i32 %5542, 0
  br i1 %5543, label %5544, label %5547

5544:                                             ; preds = %5536
  %5545 = mul nuw nsw i64 %5537, 16
  %5546 = getelementptr inbounds i8, i8* %0, i64 %5545
  call void @llvm.memset.p0i8.i64(i8* align 1 %5546, i8 0, i64 16, i1 false)
  br label %5547

5547:                                             ; preds = %5544, %5536
  %5548 = add nuw nsw i64 %5537, 1
  %5549 = call zeroext i8 @randombit()
  %5550 = getelementptr inbounds i8, i8* %1, i64 %5548
  store i8 %5549, i8* %5550, align 1
  %5551 = getelementptr inbounds i8, i8* %1, i64 %5548
  %5552 = load i8, i8* %5551, align 1
  %5553 = zext i8 %5552 to i32
  %5554 = icmp eq i32 %5553, 0
  br i1 %5554, label %5555, label %5558

5555:                                             ; preds = %5547
  %5556 = mul nuw nsw i64 %5548, 16
  %5557 = getelementptr inbounds i8, i8* %0, i64 %5556
  call void @llvm.memset.p0i8.i64(i8* align 1 %5557, i8 0, i64 16, i1 false)
  br label %5558

5558:                                             ; preds = %5555, %5547
  %5559 = add nuw nsw i64 %5548, 1
  %5560 = call zeroext i8 @randombit()
  %5561 = getelementptr inbounds i8, i8* %1, i64 %5559
  store i8 %5560, i8* %5561, align 1
  %5562 = getelementptr inbounds i8, i8* %1, i64 %5559
  %5563 = load i8, i8* %5562, align 1
  %5564 = zext i8 %5563 to i32
  %5565 = icmp eq i32 %5564, 0
  br i1 %5565, label %5566, label %5569

5566:                                             ; preds = %5558
  %5567 = mul nuw nsw i64 %5559, 16
  %5568 = getelementptr inbounds i8, i8* %0, i64 %5567
  call void @llvm.memset.p0i8.i64(i8* align 1 %5568, i8 0, i64 16, i1 false)
  br label %5569

5569:                                             ; preds = %5566, %5558
  %5570 = add nuw nsw i64 %5559, 1
  %5571 = call zeroext i8 @randombit()
  %5572 = getelementptr inbounds i8, i8* %1, i64 %5570
  store i8 %5571, i8* %5572, align 1
  %5573 = getelementptr inbounds i8, i8* %1, i64 %5570
  %5574 = load i8, i8* %5573, align 1
  %5575 = zext i8 %5574 to i32
  %5576 = icmp eq i32 %5575, 0
  br i1 %5576, label %5577, label %5580

5577:                                             ; preds = %5569
  %5578 = mul nuw nsw i64 %5570, 16
  %5579 = getelementptr inbounds i8, i8* %0, i64 %5578
  call void @llvm.memset.p0i8.i64(i8* align 1 %5579, i8 0, i64 16, i1 false)
  br label %5580

5580:                                             ; preds = %5577, %5569
  %5581 = add nuw nsw i64 %5570, 1
  %5582 = call zeroext i8 @randombit()
  %5583 = getelementptr inbounds i8, i8* %1, i64 %5581
  store i8 %5582, i8* %5583, align 1
  %5584 = getelementptr inbounds i8, i8* %1, i64 %5581
  %5585 = load i8, i8* %5584, align 1
  %5586 = zext i8 %5585 to i32
  %5587 = icmp eq i32 %5586, 0
  br i1 %5587, label %5588, label %5591

5588:                                             ; preds = %5580
  %5589 = mul nuw nsw i64 %5581, 16
  %5590 = getelementptr inbounds i8, i8* %0, i64 %5589
  call void @llvm.memset.p0i8.i64(i8* align 1 %5590, i8 0, i64 16, i1 false)
  br label %5591

5591:                                             ; preds = %5588, %5580
  %5592 = add nuw nsw i64 %5581, 1
  %5593 = call zeroext i8 @randombit()
  %5594 = getelementptr inbounds i8, i8* %1, i64 %5592
  store i8 %5593, i8* %5594, align 1
  %5595 = getelementptr inbounds i8, i8* %1, i64 %5592
  %5596 = load i8, i8* %5595, align 1
  %5597 = zext i8 %5596 to i32
  %5598 = icmp eq i32 %5597, 0
  br i1 %5598, label %5599, label %5602

5599:                                             ; preds = %5591
  %5600 = mul nuw nsw i64 %5592, 16
  %5601 = getelementptr inbounds i8, i8* %0, i64 %5600
  call void @llvm.memset.p0i8.i64(i8* align 1 %5601, i8 0, i64 16, i1 false)
  br label %5602

5602:                                             ; preds = %5599, %5591
  %5603 = add nuw nsw i64 %5592, 1
  %5604 = call zeroext i8 @randombit()
  %5605 = getelementptr inbounds i8, i8* %1, i64 %5603
  store i8 %5604, i8* %5605, align 1
  %5606 = getelementptr inbounds i8, i8* %1, i64 %5603
  %5607 = load i8, i8* %5606, align 1
  %5608 = zext i8 %5607 to i32
  %5609 = icmp eq i32 %5608, 0
  br i1 %5609, label %5610, label %5613

5610:                                             ; preds = %5602
  %5611 = mul nuw nsw i64 %5603, 16
  %5612 = getelementptr inbounds i8, i8* %0, i64 %5611
  call void @llvm.memset.p0i8.i64(i8* align 1 %5612, i8 0, i64 16, i1 false)
  br label %5613

5613:                                             ; preds = %5610, %5602
  %5614 = add nuw nsw i64 %5603, 1
  %5615 = call zeroext i8 @randombit()
  %5616 = getelementptr inbounds i8, i8* %1, i64 %5614
  store i8 %5615, i8* %5616, align 1
  %5617 = getelementptr inbounds i8, i8* %1, i64 %5614
  %5618 = load i8, i8* %5617, align 1
  %5619 = zext i8 %5618 to i32
  %5620 = icmp eq i32 %5619, 0
  br i1 %5620, label %5621, label %5624

5621:                                             ; preds = %5613
  %5622 = mul nuw nsw i64 %5614, 16
  %5623 = getelementptr inbounds i8, i8* %0, i64 %5622
  call void @llvm.memset.p0i8.i64(i8* align 1 %5623, i8 0, i64 16, i1 false)
  br label %5624

5624:                                             ; preds = %5621, %5613
  %5625 = add nuw nsw i64 %5614, 1
  %5626 = call zeroext i8 @randombit()
  %5627 = getelementptr inbounds i8, i8* %1, i64 %5625
  store i8 %5626, i8* %5627, align 1
  %5628 = getelementptr inbounds i8, i8* %1, i64 %5625
  %5629 = load i8, i8* %5628, align 1
  %5630 = zext i8 %5629 to i32
  %5631 = icmp eq i32 %5630, 0
  br i1 %5631, label %5632, label %5635

5632:                                             ; preds = %5624
  %5633 = mul nuw nsw i64 %5625, 16
  %5634 = getelementptr inbounds i8, i8* %0, i64 %5633
  call void @llvm.memset.p0i8.i64(i8* align 1 %5634, i8 0, i64 16, i1 false)
  br label %5635

5635:                                             ; preds = %5632, %5624
  %5636 = add nuw nsw i64 %5625, 1
  %5637 = call zeroext i8 @randombit()
  %5638 = getelementptr inbounds i8, i8* %1, i64 %5636
  store i8 %5637, i8* %5638, align 1
  %5639 = getelementptr inbounds i8, i8* %1, i64 %5636
  %5640 = load i8, i8* %5639, align 1
  %5641 = zext i8 %5640 to i32
  %5642 = icmp eq i32 %5641, 0
  br i1 %5642, label %5643, label %5646

5643:                                             ; preds = %5635
  %5644 = mul nuw nsw i64 %5636, 16
  %5645 = getelementptr inbounds i8, i8* %0, i64 %5644
  call void @llvm.memset.p0i8.i64(i8* align 1 %5645, i8 0, i64 16, i1 false)
  br label %5646

5646:                                             ; preds = %5643, %5635
  %5647 = add nuw nsw i64 %5636, 1
  %5648 = call zeroext i8 @randombit()
  %5649 = getelementptr inbounds i8, i8* %1, i64 %5647
  store i8 %5648, i8* %5649, align 1
  %5650 = getelementptr inbounds i8, i8* %1, i64 %5647
  %5651 = load i8, i8* %5650, align 1
  %5652 = zext i8 %5651 to i32
  %5653 = icmp eq i32 %5652, 0
  br i1 %5653, label %5654, label %5657

5654:                                             ; preds = %5646
  %5655 = mul nuw nsw i64 %5647, 16
  %5656 = getelementptr inbounds i8, i8* %0, i64 %5655
  call void @llvm.memset.p0i8.i64(i8* align 1 %5656, i8 0, i64 16, i1 false)
  br label %5657

5657:                                             ; preds = %5654, %5646
  %5658 = add nuw nsw i64 %5647, 1
  %5659 = call zeroext i8 @randombit()
  %5660 = getelementptr inbounds i8, i8* %1, i64 %5658
  store i8 %5659, i8* %5660, align 1
  %5661 = getelementptr inbounds i8, i8* %1, i64 %5658
  %5662 = load i8, i8* %5661, align 1
  %5663 = zext i8 %5662 to i32
  %5664 = icmp eq i32 %5663, 0
  br i1 %5664, label %5665, label %5668

5665:                                             ; preds = %5657
  %5666 = mul nuw nsw i64 %5658, 16
  %5667 = getelementptr inbounds i8, i8* %0, i64 %5666
  call void @llvm.memset.p0i8.i64(i8* align 1 %5667, i8 0, i64 16, i1 false)
  br label %5668

5668:                                             ; preds = %5665, %5657
  %5669 = add nuw nsw i64 %5658, 1
  %5670 = call zeroext i8 @randombit()
  %5671 = getelementptr inbounds i8, i8* %1, i64 %5669
  store i8 %5670, i8* %5671, align 1
  %5672 = getelementptr inbounds i8, i8* %1, i64 %5669
  %5673 = load i8, i8* %5672, align 1
  %5674 = zext i8 %5673 to i32
  %5675 = icmp eq i32 %5674, 0
  br i1 %5675, label %5676, label %5679

5676:                                             ; preds = %5668
  %5677 = mul nuw nsw i64 %5669, 16
  %5678 = getelementptr inbounds i8, i8* %0, i64 %5677
  call void @llvm.memset.p0i8.i64(i8* align 1 %5678, i8 0, i64 16, i1 false)
  br label %5679

5679:                                             ; preds = %5676, %5668
  %5680 = add nuw nsw i64 %5669, 1
  %5681 = call zeroext i8 @randombit()
  %5682 = getelementptr inbounds i8, i8* %1, i64 %5680
  store i8 %5681, i8* %5682, align 1
  %5683 = getelementptr inbounds i8, i8* %1, i64 %5680
  %5684 = load i8, i8* %5683, align 1
  %5685 = zext i8 %5684 to i32
  %5686 = icmp eq i32 %5685, 0
  br i1 %5686, label %5687, label %5690

5687:                                             ; preds = %5679
  %5688 = mul nuw nsw i64 %5680, 16
  %5689 = getelementptr inbounds i8, i8* %0, i64 %5688
  call void @llvm.memset.p0i8.i64(i8* align 1 %5689, i8 0, i64 16, i1 false)
  br label %5690

5690:                                             ; preds = %5687, %5679
  %5691 = add nuw nsw i64 %5680, 1
  %5692 = call zeroext i8 @randombit()
  %5693 = getelementptr inbounds i8, i8* %1, i64 %5691
  store i8 %5692, i8* %5693, align 1
  %5694 = getelementptr inbounds i8, i8* %1, i64 %5691
  %5695 = load i8, i8* %5694, align 1
  %5696 = zext i8 %5695 to i32
  %5697 = icmp eq i32 %5696, 0
  br i1 %5697, label %5698, label %5701

5698:                                             ; preds = %5690
  %5699 = mul nuw nsw i64 %5691, 16
  %5700 = getelementptr inbounds i8, i8* %0, i64 %5699
  call void @llvm.memset.p0i8.i64(i8* align 1 %5700, i8 0, i64 16, i1 false)
  br label %5701

5701:                                             ; preds = %5698, %5690
  %5702 = add nuw nsw i64 %5691, 1
  %5703 = call zeroext i8 @randombit()
  %5704 = getelementptr inbounds i8, i8* %1, i64 %5702
  store i8 %5703, i8* %5704, align 1
  %5705 = getelementptr inbounds i8, i8* %1, i64 %5702
  %5706 = load i8, i8* %5705, align 1
  %5707 = zext i8 %5706 to i32
  %5708 = icmp eq i32 %5707, 0
  br i1 %5708, label %5709, label %5712

5709:                                             ; preds = %5701
  %5710 = mul nuw nsw i64 %5702, 16
  %5711 = getelementptr inbounds i8, i8* %0, i64 %5710
  call void @llvm.memset.p0i8.i64(i8* align 1 %5711, i8 0, i64 16, i1 false)
  br label %5712

5712:                                             ; preds = %5709, %5701
  %5713 = add nuw nsw i64 %5702, 1
  %5714 = call zeroext i8 @randombit()
  %5715 = getelementptr inbounds i8, i8* %1, i64 %5713
  store i8 %5714, i8* %5715, align 1
  %5716 = getelementptr inbounds i8, i8* %1, i64 %5713
  %5717 = load i8, i8* %5716, align 1
  %5718 = zext i8 %5717 to i32
  %5719 = icmp eq i32 %5718, 0
  br i1 %5719, label %5720, label %5723

5720:                                             ; preds = %5712
  %5721 = mul nuw nsw i64 %5713, 16
  %5722 = getelementptr inbounds i8, i8* %0, i64 %5721
  call void @llvm.memset.p0i8.i64(i8* align 1 %5722, i8 0, i64 16, i1 false)
  br label %5723

5723:                                             ; preds = %5720, %5712
  %5724 = add nuw nsw i64 %5713, 1
  %5725 = call zeroext i8 @randombit()
  %5726 = getelementptr inbounds i8, i8* %1, i64 %5724
  store i8 %5725, i8* %5726, align 1
  %5727 = getelementptr inbounds i8, i8* %1, i64 %5724
  %5728 = load i8, i8* %5727, align 1
  %5729 = zext i8 %5728 to i32
  %5730 = icmp eq i32 %5729, 0
  br i1 %5730, label %5731, label %5734

5731:                                             ; preds = %5723
  %5732 = mul nuw nsw i64 %5724, 16
  %5733 = getelementptr inbounds i8, i8* %0, i64 %5732
  call void @llvm.memset.p0i8.i64(i8* align 1 %5733, i8 0, i64 16, i1 false)
  br label %5734

5734:                                             ; preds = %5731, %5723
  %5735 = add nuw nsw i64 %5724, 1
  %5736 = call zeroext i8 @randombit()
  %5737 = getelementptr inbounds i8, i8* %1, i64 %5735
  store i8 %5736, i8* %5737, align 1
  %5738 = getelementptr inbounds i8, i8* %1, i64 %5735
  %5739 = load i8, i8* %5738, align 1
  %5740 = zext i8 %5739 to i32
  %5741 = icmp eq i32 %5740, 0
  br i1 %5741, label %5742, label %5745

5742:                                             ; preds = %5734
  %5743 = mul nuw nsw i64 %5735, 16
  %5744 = getelementptr inbounds i8, i8* %0, i64 %5743
  call void @llvm.memset.p0i8.i64(i8* align 1 %5744, i8 0, i64 16, i1 false)
  br label %5745

5745:                                             ; preds = %5742, %5734
  %5746 = add nuw nsw i64 %5735, 1
  %5747 = call zeroext i8 @randombit()
  %5748 = getelementptr inbounds i8, i8* %1, i64 %5746
  store i8 %5747, i8* %5748, align 1
  %5749 = getelementptr inbounds i8, i8* %1, i64 %5746
  %5750 = load i8, i8* %5749, align 1
  %5751 = zext i8 %5750 to i32
  %5752 = icmp eq i32 %5751, 0
  br i1 %5752, label %5753, label %5756

5753:                                             ; preds = %5745
  %5754 = mul nuw nsw i64 %5746, 16
  %5755 = getelementptr inbounds i8, i8* %0, i64 %5754
  call void @llvm.memset.p0i8.i64(i8* align 1 %5755, i8 0, i64 16, i1 false)
  br label %5756

5756:                                             ; preds = %5753, %5745
  %5757 = add nuw nsw i64 %5746, 1
  %5758 = call zeroext i8 @randombit()
  %5759 = getelementptr inbounds i8, i8* %1, i64 %5757
  store i8 %5758, i8* %5759, align 1
  %5760 = getelementptr inbounds i8, i8* %1, i64 %5757
  %5761 = load i8, i8* %5760, align 1
  %5762 = zext i8 %5761 to i32
  %5763 = icmp eq i32 %5762, 0
  br i1 %5763, label %5764, label %5767

5764:                                             ; preds = %5756
  %5765 = mul nuw nsw i64 %5757, 16
  %5766 = getelementptr inbounds i8, i8* %0, i64 %5765
  call void @llvm.memset.p0i8.i64(i8* align 1 %5766, i8 0, i64 16, i1 false)
  br label %5767

5767:                                             ; preds = %5764, %5756
  %5768 = add nuw nsw i64 %5757, 1
  %5769 = call zeroext i8 @randombit()
  %5770 = getelementptr inbounds i8, i8* %1, i64 %5768
  store i8 %5769, i8* %5770, align 1
  %5771 = getelementptr inbounds i8, i8* %1, i64 %5768
  %5772 = load i8, i8* %5771, align 1
  %5773 = zext i8 %5772 to i32
  %5774 = icmp eq i32 %5773, 0
  br i1 %5774, label %5775, label %5778

5775:                                             ; preds = %5767
  %5776 = mul nuw nsw i64 %5768, 16
  %5777 = getelementptr inbounds i8, i8* %0, i64 %5776
  call void @llvm.memset.p0i8.i64(i8* align 1 %5777, i8 0, i64 16, i1 false)
  br label %5778

5778:                                             ; preds = %5775, %5767
  %5779 = add nuw nsw i64 %5768, 1
  %5780 = call zeroext i8 @randombit()
  %5781 = getelementptr inbounds i8, i8* %1, i64 %5779
  store i8 %5780, i8* %5781, align 1
  %5782 = getelementptr inbounds i8, i8* %1, i64 %5779
  %5783 = load i8, i8* %5782, align 1
  %5784 = zext i8 %5783 to i32
  %5785 = icmp eq i32 %5784, 0
  br i1 %5785, label %5786, label %5789

5786:                                             ; preds = %5778
  %5787 = mul nuw nsw i64 %5779, 16
  %5788 = getelementptr inbounds i8, i8* %0, i64 %5787
  call void @llvm.memset.p0i8.i64(i8* align 1 %5788, i8 0, i64 16, i1 false)
  br label %5789

5789:                                             ; preds = %5786, %5778
  %5790 = add nuw nsw i64 %5779, 1
  %5791 = call zeroext i8 @randombit()
  %5792 = getelementptr inbounds i8, i8* %1, i64 %5790
  store i8 %5791, i8* %5792, align 1
  %5793 = getelementptr inbounds i8, i8* %1, i64 %5790
  %5794 = load i8, i8* %5793, align 1
  %5795 = zext i8 %5794 to i32
  %5796 = icmp eq i32 %5795, 0
  br i1 %5796, label %5797, label %5800

5797:                                             ; preds = %5789
  %5798 = mul nuw nsw i64 %5790, 16
  %5799 = getelementptr inbounds i8, i8* %0, i64 %5798
  call void @llvm.memset.p0i8.i64(i8* align 1 %5799, i8 0, i64 16, i1 false)
  br label %5800

5800:                                             ; preds = %5797, %5789
  %5801 = add nuw nsw i64 %5790, 1
  %5802 = call zeroext i8 @randombit()
  %5803 = getelementptr inbounds i8, i8* %1, i64 %5801
  store i8 %5802, i8* %5803, align 1
  %5804 = getelementptr inbounds i8, i8* %1, i64 %5801
  %5805 = load i8, i8* %5804, align 1
  %5806 = zext i8 %5805 to i32
  %5807 = icmp eq i32 %5806, 0
  br i1 %5807, label %5808, label %5811

5808:                                             ; preds = %5800
  %5809 = mul nuw nsw i64 %5801, 16
  %5810 = getelementptr inbounds i8, i8* %0, i64 %5809
  call void @llvm.memset.p0i8.i64(i8* align 1 %5810, i8 0, i64 16, i1 false)
  br label %5811

5811:                                             ; preds = %5808, %5800
  %5812 = add nuw nsw i64 %5801, 1
  %5813 = call zeroext i8 @randombit()
  %5814 = getelementptr inbounds i8, i8* %1, i64 %5812
  store i8 %5813, i8* %5814, align 1
  %5815 = getelementptr inbounds i8, i8* %1, i64 %5812
  %5816 = load i8, i8* %5815, align 1
  %5817 = zext i8 %5816 to i32
  %5818 = icmp eq i32 %5817, 0
  br i1 %5818, label %5819, label %5822

5819:                                             ; preds = %5811
  %5820 = mul nuw nsw i64 %5812, 16
  %5821 = getelementptr inbounds i8, i8* %0, i64 %5820
  call void @llvm.memset.p0i8.i64(i8* align 1 %5821, i8 0, i64 16, i1 false)
  br label %5822

5822:                                             ; preds = %5819, %5811
  %5823 = add nuw nsw i64 %5812, 1
  %5824 = call zeroext i8 @randombit()
  %5825 = getelementptr inbounds i8, i8* %1, i64 %5823
  store i8 %5824, i8* %5825, align 1
  %5826 = getelementptr inbounds i8, i8* %1, i64 %5823
  %5827 = load i8, i8* %5826, align 1
  %5828 = zext i8 %5827 to i32
  %5829 = icmp eq i32 %5828, 0
  br i1 %5829, label %5830, label %5833

5830:                                             ; preds = %5822
  %5831 = mul nuw nsw i64 %5823, 16
  %5832 = getelementptr inbounds i8, i8* %0, i64 %5831
  call void @llvm.memset.p0i8.i64(i8* align 1 %5832, i8 0, i64 16, i1 false)
  br label %5833

5833:                                             ; preds = %5830, %5822
  %5834 = add nuw nsw i64 %5823, 1
  %5835 = call zeroext i8 @randombit()
  %5836 = getelementptr inbounds i8, i8* %1, i64 %5834
  store i8 %5835, i8* %5836, align 1
  %5837 = getelementptr inbounds i8, i8* %1, i64 %5834
  %5838 = load i8, i8* %5837, align 1
  %5839 = zext i8 %5838 to i32
  %5840 = icmp eq i32 %5839, 0
  br i1 %5840, label %5841, label %5844

5841:                                             ; preds = %5833
  %5842 = mul nuw nsw i64 %5834, 16
  %5843 = getelementptr inbounds i8, i8* %0, i64 %5842
  call void @llvm.memset.p0i8.i64(i8* align 1 %5843, i8 0, i64 16, i1 false)
  br label %5844

5844:                                             ; preds = %5841, %5833
  %5845 = add nuw nsw i64 %5834, 1
  %5846 = call zeroext i8 @randombit()
  %5847 = getelementptr inbounds i8, i8* %1, i64 %5845
  store i8 %5846, i8* %5847, align 1
  %5848 = getelementptr inbounds i8, i8* %1, i64 %5845
  %5849 = load i8, i8* %5848, align 1
  %5850 = zext i8 %5849 to i32
  %5851 = icmp eq i32 %5850, 0
  br i1 %5851, label %5852, label %5855

5852:                                             ; preds = %5844
  %5853 = mul nuw nsw i64 %5845, 16
  %5854 = getelementptr inbounds i8, i8* %0, i64 %5853
  call void @llvm.memset.p0i8.i64(i8* align 1 %5854, i8 0, i64 16, i1 false)
  br label %5855

5855:                                             ; preds = %5852, %5844
  %5856 = add nuw nsw i64 %5845, 1
  %5857 = call zeroext i8 @randombit()
  %5858 = getelementptr inbounds i8, i8* %1, i64 %5856
  store i8 %5857, i8* %5858, align 1
  %5859 = getelementptr inbounds i8, i8* %1, i64 %5856
  %5860 = load i8, i8* %5859, align 1
  %5861 = zext i8 %5860 to i32
  %5862 = icmp eq i32 %5861, 0
  br i1 %5862, label %5863, label %5866

5863:                                             ; preds = %5855
  %5864 = mul nuw nsw i64 %5856, 16
  %5865 = getelementptr inbounds i8, i8* %0, i64 %5864
  call void @llvm.memset.p0i8.i64(i8* align 1 %5865, i8 0, i64 16, i1 false)
  br label %5866

5866:                                             ; preds = %5863, %5855
  %5867 = add nuw nsw i64 %5856, 1
  %5868 = call zeroext i8 @randombit()
  %5869 = getelementptr inbounds i8, i8* %1, i64 %5867
  store i8 %5868, i8* %5869, align 1
  %5870 = getelementptr inbounds i8, i8* %1, i64 %5867
  %5871 = load i8, i8* %5870, align 1
  %5872 = zext i8 %5871 to i32
  %5873 = icmp eq i32 %5872, 0
  br i1 %5873, label %5874, label %5877

5874:                                             ; preds = %5866
  %5875 = mul nuw nsw i64 %5867, 16
  %5876 = getelementptr inbounds i8, i8* %0, i64 %5875
  call void @llvm.memset.p0i8.i64(i8* align 1 %5876, i8 0, i64 16, i1 false)
  br label %5877

5877:                                             ; preds = %5874, %5866
  %5878 = add nuw nsw i64 %5867, 1
  %5879 = call zeroext i8 @randombit()
  %5880 = getelementptr inbounds i8, i8* %1, i64 %5878
  store i8 %5879, i8* %5880, align 1
  %5881 = getelementptr inbounds i8, i8* %1, i64 %5878
  %5882 = load i8, i8* %5881, align 1
  %5883 = zext i8 %5882 to i32
  %5884 = icmp eq i32 %5883, 0
  br i1 %5884, label %5885, label %5888

5885:                                             ; preds = %5877
  %5886 = mul nuw nsw i64 %5878, 16
  %5887 = getelementptr inbounds i8, i8* %0, i64 %5886
  call void @llvm.memset.p0i8.i64(i8* align 1 %5887, i8 0, i64 16, i1 false)
  br label %5888

5888:                                             ; preds = %5885, %5877
  %5889 = add nuw nsw i64 %5878, 1
  %5890 = call zeroext i8 @randombit()
  %5891 = getelementptr inbounds i8, i8* %1, i64 %5889
  store i8 %5890, i8* %5891, align 1
  %5892 = getelementptr inbounds i8, i8* %1, i64 %5889
  %5893 = load i8, i8* %5892, align 1
  %5894 = zext i8 %5893 to i32
  %5895 = icmp eq i32 %5894, 0
  br i1 %5895, label %5896, label %5899

5896:                                             ; preds = %5888
  %5897 = mul nuw nsw i64 %5889, 16
  %5898 = getelementptr inbounds i8, i8* %0, i64 %5897
  call void @llvm.memset.p0i8.i64(i8* align 1 %5898, i8 0, i64 16, i1 false)
  br label %5899

5899:                                             ; preds = %5896, %5888
  %5900 = add nuw nsw i64 %5889, 1
  %5901 = call zeroext i8 @randombit()
  %5902 = getelementptr inbounds i8, i8* %1, i64 %5900
  store i8 %5901, i8* %5902, align 1
  %5903 = getelementptr inbounds i8, i8* %1, i64 %5900
  %5904 = load i8, i8* %5903, align 1
  %5905 = zext i8 %5904 to i32
  %5906 = icmp eq i32 %5905, 0
  br i1 %5906, label %5907, label %5910

5907:                                             ; preds = %5899
  %5908 = mul nuw nsw i64 %5900, 16
  %5909 = getelementptr inbounds i8, i8* %0, i64 %5908
  call void @llvm.memset.p0i8.i64(i8* align 1 %5909, i8 0, i64 16, i1 false)
  br label %5910

5910:                                             ; preds = %5907, %5899
  %5911 = add nuw nsw i64 %5900, 1
  %5912 = call zeroext i8 @randombit()
  %5913 = getelementptr inbounds i8, i8* %1, i64 %5911
  store i8 %5912, i8* %5913, align 1
  %5914 = getelementptr inbounds i8, i8* %1, i64 %5911
  %5915 = load i8, i8* %5914, align 1
  %5916 = zext i8 %5915 to i32
  %5917 = icmp eq i32 %5916, 0
  br i1 %5917, label %5918, label %5921

5918:                                             ; preds = %5910
  %5919 = mul nuw nsw i64 %5911, 16
  %5920 = getelementptr inbounds i8, i8* %0, i64 %5919
  call void @llvm.memset.p0i8.i64(i8* align 1 %5920, i8 0, i64 16, i1 false)
  br label %5921

5921:                                             ; preds = %5918, %5910
  %5922 = add nuw nsw i64 %5911, 1
  %5923 = call zeroext i8 @randombit()
  %5924 = getelementptr inbounds i8, i8* %1, i64 %5922
  store i8 %5923, i8* %5924, align 1
  %5925 = getelementptr inbounds i8, i8* %1, i64 %5922
  %5926 = load i8, i8* %5925, align 1
  %5927 = zext i8 %5926 to i32
  %5928 = icmp eq i32 %5927, 0
  br i1 %5928, label %5929, label %5932

5929:                                             ; preds = %5921
  %5930 = mul nuw nsw i64 %5922, 16
  %5931 = getelementptr inbounds i8, i8* %0, i64 %5930
  call void @llvm.memset.p0i8.i64(i8* align 1 %5931, i8 0, i64 16, i1 false)
  br label %5932

5932:                                             ; preds = %5929, %5921
  %5933 = add nuw nsw i64 %5922, 1
  %5934 = call zeroext i8 @randombit()
  %5935 = getelementptr inbounds i8, i8* %1, i64 %5933
  store i8 %5934, i8* %5935, align 1
  %5936 = getelementptr inbounds i8, i8* %1, i64 %5933
  %5937 = load i8, i8* %5936, align 1
  %5938 = zext i8 %5937 to i32
  %5939 = icmp eq i32 %5938, 0
  br i1 %5939, label %5940, label %5943

5940:                                             ; preds = %5932
  %5941 = mul nuw nsw i64 %5933, 16
  %5942 = getelementptr inbounds i8, i8* %0, i64 %5941
  call void @llvm.memset.p0i8.i64(i8* align 1 %5942, i8 0, i64 16, i1 false)
  br label %5943

5943:                                             ; preds = %5940, %5932
  %5944 = add nuw nsw i64 %5933, 1
  %5945 = call zeroext i8 @randombit()
  %5946 = getelementptr inbounds i8, i8* %1, i64 %5944
  store i8 %5945, i8* %5946, align 1
  %5947 = getelementptr inbounds i8, i8* %1, i64 %5944
  %5948 = load i8, i8* %5947, align 1
  %5949 = zext i8 %5948 to i32
  %5950 = icmp eq i32 %5949, 0
  br i1 %5950, label %5951, label %5954

5951:                                             ; preds = %5943
  %5952 = mul nuw nsw i64 %5944, 16
  %5953 = getelementptr inbounds i8, i8* %0, i64 %5952
  call void @llvm.memset.p0i8.i64(i8* align 1 %5953, i8 0, i64 16, i1 false)
  br label %5954

5954:                                             ; preds = %5951, %5943
  %5955 = add nuw nsw i64 %5944, 1
  %5956 = call zeroext i8 @randombit()
  %5957 = getelementptr inbounds i8, i8* %1, i64 %5955
  store i8 %5956, i8* %5957, align 1
  %5958 = getelementptr inbounds i8, i8* %1, i64 %5955
  %5959 = load i8, i8* %5958, align 1
  %5960 = zext i8 %5959 to i32
  %5961 = icmp eq i32 %5960, 0
  br i1 %5961, label %5962, label %5965

5962:                                             ; preds = %5954
  %5963 = mul nuw nsw i64 %5955, 16
  %5964 = getelementptr inbounds i8, i8* %0, i64 %5963
  call void @llvm.memset.p0i8.i64(i8* align 1 %5964, i8 0, i64 16, i1 false)
  br label %5965

5965:                                             ; preds = %5962, %5954
  %5966 = add nuw nsw i64 %5955, 1
  %5967 = call zeroext i8 @randombit()
  %5968 = getelementptr inbounds i8, i8* %1, i64 %5966
  store i8 %5967, i8* %5968, align 1
  %5969 = getelementptr inbounds i8, i8* %1, i64 %5966
  %5970 = load i8, i8* %5969, align 1
  %5971 = zext i8 %5970 to i32
  %5972 = icmp eq i32 %5971, 0
  br i1 %5972, label %5973, label %5976

5973:                                             ; preds = %5965
  %5974 = mul nuw nsw i64 %5966, 16
  %5975 = getelementptr inbounds i8, i8* %0, i64 %5974
  call void @llvm.memset.p0i8.i64(i8* align 1 %5975, i8 0, i64 16, i1 false)
  br label %5976

5976:                                             ; preds = %5973, %5965
  %5977 = add nuw nsw i64 %5966, 1
  %5978 = call zeroext i8 @randombit()
  %5979 = getelementptr inbounds i8, i8* %1, i64 %5977
  store i8 %5978, i8* %5979, align 1
  %5980 = getelementptr inbounds i8, i8* %1, i64 %5977
  %5981 = load i8, i8* %5980, align 1
  %5982 = zext i8 %5981 to i32
  %5983 = icmp eq i32 %5982, 0
  br i1 %5983, label %5984, label %5987

5984:                                             ; preds = %5976
  %5985 = mul nuw nsw i64 %5977, 16
  %5986 = getelementptr inbounds i8, i8* %0, i64 %5985
  call void @llvm.memset.p0i8.i64(i8* align 1 %5986, i8 0, i64 16, i1 false)
  br label %5987

5987:                                             ; preds = %5984, %5976
  %5988 = add nuw nsw i64 %5977, 1
  %5989 = call zeroext i8 @randombit()
  %5990 = getelementptr inbounds i8, i8* %1, i64 %5988
  store i8 %5989, i8* %5990, align 1
  %5991 = getelementptr inbounds i8, i8* %1, i64 %5988
  %5992 = load i8, i8* %5991, align 1
  %5993 = zext i8 %5992 to i32
  %5994 = icmp eq i32 %5993, 0
  br i1 %5994, label %5995, label %5998

5995:                                             ; preds = %5987
  %5996 = mul nuw nsw i64 %5988, 16
  %5997 = getelementptr inbounds i8, i8* %0, i64 %5996
  call void @llvm.memset.p0i8.i64(i8* align 1 %5997, i8 0, i64 16, i1 false)
  br label %5998

5998:                                             ; preds = %5995, %5987
  %5999 = add nuw nsw i64 %5988, 1
  %6000 = call zeroext i8 @randombit()
  %6001 = getelementptr inbounds i8, i8* %1, i64 %5999
  store i8 %6000, i8* %6001, align 1
  %6002 = getelementptr inbounds i8, i8* %1, i64 %5999
  %6003 = load i8, i8* %6002, align 1
  %6004 = zext i8 %6003 to i32
  %6005 = icmp eq i32 %6004, 0
  br i1 %6005, label %6006, label %6009

6006:                                             ; preds = %5998
  %6007 = mul nuw nsw i64 %5999, 16
  %6008 = getelementptr inbounds i8, i8* %0, i64 %6007
  call void @llvm.memset.p0i8.i64(i8* align 1 %6008, i8 0, i64 16, i1 false)
  br label %6009

6009:                                             ; preds = %6006, %5998
  %6010 = add nuw nsw i64 %5999, 1
  %6011 = call zeroext i8 @randombit()
  %6012 = getelementptr inbounds i8, i8* %1, i64 %6010
  store i8 %6011, i8* %6012, align 1
  %6013 = getelementptr inbounds i8, i8* %1, i64 %6010
  %6014 = load i8, i8* %6013, align 1
  %6015 = zext i8 %6014 to i32
  %6016 = icmp eq i32 %6015, 0
  br i1 %6016, label %6017, label %6020

6017:                                             ; preds = %6009
  %6018 = mul nuw nsw i64 %6010, 16
  %6019 = getelementptr inbounds i8, i8* %0, i64 %6018
  call void @llvm.memset.p0i8.i64(i8* align 1 %6019, i8 0, i64 16, i1 false)
  br label %6020

6020:                                             ; preds = %6017, %6009
  %6021 = add nuw nsw i64 %6010, 1
  %6022 = call zeroext i8 @randombit()
  %6023 = getelementptr inbounds i8, i8* %1, i64 %6021
  store i8 %6022, i8* %6023, align 1
  %6024 = getelementptr inbounds i8, i8* %1, i64 %6021
  %6025 = load i8, i8* %6024, align 1
  %6026 = zext i8 %6025 to i32
  %6027 = icmp eq i32 %6026, 0
  br i1 %6027, label %6028, label %6031

6028:                                             ; preds = %6020
  %6029 = mul nuw nsw i64 %6021, 16
  %6030 = getelementptr inbounds i8, i8* %0, i64 %6029
  call void @llvm.memset.p0i8.i64(i8* align 1 %6030, i8 0, i64 16, i1 false)
  br label %6031

6031:                                             ; preds = %6028, %6020
  %6032 = add nuw nsw i64 %6021, 1
  %6033 = call zeroext i8 @randombit()
  %6034 = getelementptr inbounds i8, i8* %1, i64 %6032
  store i8 %6033, i8* %6034, align 1
  %6035 = getelementptr inbounds i8, i8* %1, i64 %6032
  %6036 = load i8, i8* %6035, align 1
  %6037 = zext i8 %6036 to i32
  %6038 = icmp eq i32 %6037, 0
  br i1 %6038, label %6039, label %6042

6039:                                             ; preds = %6031
  %6040 = mul nuw nsw i64 %6032, 16
  %6041 = getelementptr inbounds i8, i8* %0, i64 %6040
  call void @llvm.memset.p0i8.i64(i8* align 1 %6041, i8 0, i64 16, i1 false)
  br label %6042

6042:                                             ; preds = %6039, %6031
  %6043 = add nuw nsw i64 %6032, 1
  %6044 = call zeroext i8 @randombit()
  %6045 = getelementptr inbounds i8, i8* %1, i64 %6043
  store i8 %6044, i8* %6045, align 1
  %6046 = getelementptr inbounds i8, i8* %1, i64 %6043
  %6047 = load i8, i8* %6046, align 1
  %6048 = zext i8 %6047 to i32
  %6049 = icmp eq i32 %6048, 0
  br i1 %6049, label %6050, label %6053

6050:                                             ; preds = %6042
  %6051 = mul nuw nsw i64 %6043, 16
  %6052 = getelementptr inbounds i8, i8* %0, i64 %6051
  call void @llvm.memset.p0i8.i64(i8* align 1 %6052, i8 0, i64 16, i1 false)
  br label %6053

6053:                                             ; preds = %6050, %6042
  %6054 = add nuw nsw i64 %6043, 1
  %6055 = call zeroext i8 @randombit()
  %6056 = getelementptr inbounds i8, i8* %1, i64 %6054
  store i8 %6055, i8* %6056, align 1
  %6057 = getelementptr inbounds i8, i8* %1, i64 %6054
  %6058 = load i8, i8* %6057, align 1
  %6059 = zext i8 %6058 to i32
  %6060 = icmp eq i32 %6059, 0
  br i1 %6060, label %6061, label %6064

6061:                                             ; preds = %6053
  %6062 = mul nuw nsw i64 %6054, 16
  %6063 = getelementptr inbounds i8, i8* %0, i64 %6062
  call void @llvm.memset.p0i8.i64(i8* align 1 %6063, i8 0, i64 16, i1 false)
  br label %6064

6064:                                             ; preds = %6061, %6053
  %6065 = add nuw nsw i64 %6054, 1
  %6066 = call zeroext i8 @randombit()
  %6067 = getelementptr inbounds i8, i8* %1, i64 %6065
  store i8 %6066, i8* %6067, align 1
  %6068 = getelementptr inbounds i8, i8* %1, i64 %6065
  %6069 = load i8, i8* %6068, align 1
  %6070 = zext i8 %6069 to i32
  %6071 = icmp eq i32 %6070, 0
  br i1 %6071, label %6072, label %6075

6072:                                             ; preds = %6064
  %6073 = mul nuw nsw i64 %6065, 16
  %6074 = getelementptr inbounds i8, i8* %0, i64 %6073
  call void @llvm.memset.p0i8.i64(i8* align 1 %6074, i8 0, i64 16, i1 false)
  br label %6075

6075:                                             ; preds = %6072, %6064
  %6076 = add nuw nsw i64 %6065, 1
  %6077 = call zeroext i8 @randombit()
  %6078 = getelementptr inbounds i8, i8* %1, i64 %6076
  store i8 %6077, i8* %6078, align 1
  %6079 = getelementptr inbounds i8, i8* %1, i64 %6076
  %6080 = load i8, i8* %6079, align 1
  %6081 = zext i8 %6080 to i32
  %6082 = icmp eq i32 %6081, 0
  br i1 %6082, label %6083, label %6086

6083:                                             ; preds = %6075
  %6084 = mul nuw nsw i64 %6076, 16
  %6085 = getelementptr inbounds i8, i8* %0, i64 %6084
  call void @llvm.memset.p0i8.i64(i8* align 1 %6085, i8 0, i64 16, i1 false)
  br label %6086

6086:                                             ; preds = %6083, %6075
  %6087 = add nuw nsw i64 %6076, 1
  %6088 = call zeroext i8 @randombit()
  %6089 = getelementptr inbounds i8, i8* %1, i64 %6087
  store i8 %6088, i8* %6089, align 1
  %6090 = getelementptr inbounds i8, i8* %1, i64 %6087
  %6091 = load i8, i8* %6090, align 1
  %6092 = zext i8 %6091 to i32
  %6093 = icmp eq i32 %6092, 0
  br i1 %6093, label %6094, label %6097

6094:                                             ; preds = %6086
  %6095 = mul nuw nsw i64 %6087, 16
  %6096 = getelementptr inbounds i8, i8* %0, i64 %6095
  call void @llvm.memset.p0i8.i64(i8* align 1 %6096, i8 0, i64 16, i1 false)
  br label %6097

6097:                                             ; preds = %6094, %6086
  %6098 = add nuw nsw i64 %6087, 1
  %6099 = call zeroext i8 @randombit()
  %6100 = getelementptr inbounds i8, i8* %1, i64 %6098
  store i8 %6099, i8* %6100, align 1
  %6101 = getelementptr inbounds i8, i8* %1, i64 %6098
  %6102 = load i8, i8* %6101, align 1
  %6103 = zext i8 %6102 to i32
  %6104 = icmp eq i32 %6103, 0
  br i1 %6104, label %6105, label %6108

6105:                                             ; preds = %6097
  %6106 = mul nuw nsw i64 %6098, 16
  %6107 = getelementptr inbounds i8, i8* %0, i64 %6106
  call void @llvm.memset.p0i8.i64(i8* align 1 %6107, i8 0, i64 16, i1 false)
  br label %6108

6108:                                             ; preds = %6105, %6097
  %6109 = add nuw nsw i64 %6098, 1
  %6110 = call zeroext i8 @randombit()
  %6111 = getelementptr inbounds i8, i8* %1, i64 %6109
  store i8 %6110, i8* %6111, align 1
  %6112 = getelementptr inbounds i8, i8* %1, i64 %6109
  %6113 = load i8, i8* %6112, align 1
  %6114 = zext i8 %6113 to i32
  %6115 = icmp eq i32 %6114, 0
  br i1 %6115, label %6116, label %6119

6116:                                             ; preds = %6108
  %6117 = mul nuw nsw i64 %6109, 16
  %6118 = getelementptr inbounds i8, i8* %0, i64 %6117
  call void @llvm.memset.p0i8.i64(i8* align 1 %6118, i8 0, i64 16, i1 false)
  br label %6119

6119:                                             ; preds = %6116, %6108
  %6120 = add nuw nsw i64 %6109, 1
  %6121 = call zeroext i8 @randombit()
  %6122 = getelementptr inbounds i8, i8* %1, i64 %6120
  store i8 %6121, i8* %6122, align 1
  %6123 = getelementptr inbounds i8, i8* %1, i64 %6120
  %6124 = load i8, i8* %6123, align 1
  %6125 = zext i8 %6124 to i32
  %6126 = icmp eq i32 %6125, 0
  br i1 %6126, label %6127, label %6130

6127:                                             ; preds = %6119
  %6128 = mul nuw nsw i64 %6120, 16
  %6129 = getelementptr inbounds i8, i8* %0, i64 %6128
  call void @llvm.memset.p0i8.i64(i8* align 1 %6129, i8 0, i64 16, i1 false)
  br label %6130

6130:                                             ; preds = %6127, %6119
  %6131 = add nuw nsw i64 %6120, 1
  %6132 = call zeroext i8 @randombit()
  %6133 = getelementptr inbounds i8, i8* %1, i64 %6131
  store i8 %6132, i8* %6133, align 1
  %6134 = getelementptr inbounds i8, i8* %1, i64 %6131
  %6135 = load i8, i8* %6134, align 1
  %6136 = zext i8 %6135 to i32
  %6137 = icmp eq i32 %6136, 0
  br i1 %6137, label %6138, label %6141

6138:                                             ; preds = %6130
  %6139 = mul nuw nsw i64 %6131, 16
  %6140 = getelementptr inbounds i8, i8* %0, i64 %6139
  call void @llvm.memset.p0i8.i64(i8* align 1 %6140, i8 0, i64 16, i1 false)
  br label %6141

6141:                                             ; preds = %6138, %6130
  %6142 = add nuw nsw i64 %6131, 1
  %6143 = call zeroext i8 @randombit()
  %6144 = getelementptr inbounds i8, i8* %1, i64 %6142
  store i8 %6143, i8* %6144, align 1
  %6145 = getelementptr inbounds i8, i8* %1, i64 %6142
  %6146 = load i8, i8* %6145, align 1
  %6147 = zext i8 %6146 to i32
  %6148 = icmp eq i32 %6147, 0
  br i1 %6148, label %6149, label %6152

6149:                                             ; preds = %6141
  %6150 = mul nuw nsw i64 %6142, 16
  %6151 = getelementptr inbounds i8, i8* %0, i64 %6150
  call void @llvm.memset.p0i8.i64(i8* align 1 %6151, i8 0, i64 16, i1 false)
  br label %6152

6152:                                             ; preds = %6149, %6141
  %6153 = add nuw nsw i64 %6142, 1
  %6154 = call zeroext i8 @randombit()
  %6155 = getelementptr inbounds i8, i8* %1, i64 %6153
  store i8 %6154, i8* %6155, align 1
  %6156 = getelementptr inbounds i8, i8* %1, i64 %6153
  %6157 = load i8, i8* %6156, align 1
  %6158 = zext i8 %6157 to i32
  %6159 = icmp eq i32 %6158, 0
  br i1 %6159, label %6160, label %6163

6160:                                             ; preds = %6152
  %6161 = mul nuw nsw i64 %6153, 16
  %6162 = getelementptr inbounds i8, i8* %0, i64 %6161
  call void @llvm.memset.p0i8.i64(i8* align 1 %6162, i8 0, i64 16, i1 false)
  br label %6163

6163:                                             ; preds = %6160, %6152
  %6164 = add nuw nsw i64 %6153, 1
  %6165 = call zeroext i8 @randombit()
  %6166 = getelementptr inbounds i8, i8* %1, i64 %6164
  store i8 %6165, i8* %6166, align 1
  %6167 = getelementptr inbounds i8, i8* %1, i64 %6164
  %6168 = load i8, i8* %6167, align 1
  %6169 = zext i8 %6168 to i32
  %6170 = icmp eq i32 %6169, 0
  br i1 %6170, label %6171, label %6174

6171:                                             ; preds = %6163
  %6172 = mul nuw nsw i64 %6164, 16
  %6173 = getelementptr inbounds i8, i8* %0, i64 %6172
  call void @llvm.memset.p0i8.i64(i8* align 1 %6173, i8 0, i64 16, i1 false)
  br label %6174

6174:                                             ; preds = %6171, %6163
  %6175 = add nuw nsw i64 %6164, 1
  %6176 = call zeroext i8 @randombit()
  %6177 = getelementptr inbounds i8, i8* %1, i64 %6175
  store i8 %6176, i8* %6177, align 1
  %6178 = getelementptr inbounds i8, i8* %1, i64 %6175
  %6179 = load i8, i8* %6178, align 1
  %6180 = zext i8 %6179 to i32
  %6181 = icmp eq i32 %6180, 0
  br i1 %6181, label %6182, label %6185

6182:                                             ; preds = %6174
  %6183 = mul nuw nsw i64 %6175, 16
  %6184 = getelementptr inbounds i8, i8* %0, i64 %6183
  call void @llvm.memset.p0i8.i64(i8* align 1 %6184, i8 0, i64 16, i1 false)
  br label %6185

6185:                                             ; preds = %6182, %6174
  %6186 = add nuw nsw i64 %6175, 1
  %6187 = call zeroext i8 @randombit()
  %6188 = getelementptr inbounds i8, i8* %1, i64 %6186
  store i8 %6187, i8* %6188, align 1
  %6189 = getelementptr inbounds i8, i8* %1, i64 %6186
  %6190 = load i8, i8* %6189, align 1
  %6191 = zext i8 %6190 to i32
  %6192 = icmp eq i32 %6191, 0
  br i1 %6192, label %6193, label %6196

6193:                                             ; preds = %6185
  %6194 = mul nuw nsw i64 %6186, 16
  %6195 = getelementptr inbounds i8, i8* %0, i64 %6194
  call void @llvm.memset.p0i8.i64(i8* align 1 %6195, i8 0, i64 16, i1 false)
  br label %6196

6196:                                             ; preds = %6193, %6185
  %6197 = add nuw nsw i64 %6186, 1
  %6198 = call zeroext i8 @randombit()
  %6199 = getelementptr inbounds i8, i8* %1, i64 %6197
  store i8 %6198, i8* %6199, align 1
  %6200 = getelementptr inbounds i8, i8* %1, i64 %6197
  %6201 = load i8, i8* %6200, align 1
  %6202 = zext i8 %6201 to i32
  %6203 = icmp eq i32 %6202, 0
  br i1 %6203, label %6204, label %6207

6204:                                             ; preds = %6196
  %6205 = mul nuw nsw i64 %6197, 16
  %6206 = getelementptr inbounds i8, i8* %0, i64 %6205
  call void @llvm.memset.p0i8.i64(i8* align 1 %6206, i8 0, i64 16, i1 false)
  br label %6207

6207:                                             ; preds = %6204, %6196
  %6208 = add nuw nsw i64 %6197, 1
  %6209 = call zeroext i8 @randombit()
  %6210 = getelementptr inbounds i8, i8* %1, i64 %6208
  store i8 %6209, i8* %6210, align 1
  %6211 = getelementptr inbounds i8, i8* %1, i64 %6208
  %6212 = load i8, i8* %6211, align 1
  %6213 = zext i8 %6212 to i32
  %6214 = icmp eq i32 %6213, 0
  br i1 %6214, label %6215, label %6218

6215:                                             ; preds = %6207
  %6216 = mul nuw nsw i64 %6208, 16
  %6217 = getelementptr inbounds i8, i8* %0, i64 %6216
  call void @llvm.memset.p0i8.i64(i8* align 1 %6217, i8 0, i64 16, i1 false)
  br label %6218

6218:                                             ; preds = %6215, %6207
  %6219 = add nuw nsw i64 %6208, 1
  %6220 = call zeroext i8 @randombit()
  %6221 = getelementptr inbounds i8, i8* %1, i64 %6219
  store i8 %6220, i8* %6221, align 1
  %6222 = getelementptr inbounds i8, i8* %1, i64 %6219
  %6223 = load i8, i8* %6222, align 1
  %6224 = zext i8 %6223 to i32
  %6225 = icmp eq i32 %6224, 0
  br i1 %6225, label %6226, label %6229

6226:                                             ; preds = %6218
  %6227 = mul nuw nsw i64 %6219, 16
  %6228 = getelementptr inbounds i8, i8* %0, i64 %6227
  call void @llvm.memset.p0i8.i64(i8* align 1 %6228, i8 0, i64 16, i1 false)
  br label %6229

6229:                                             ; preds = %6226, %6218
  %6230 = add nuw nsw i64 %6219, 1
  %6231 = call zeroext i8 @randombit()
  %6232 = getelementptr inbounds i8, i8* %1, i64 %6230
  store i8 %6231, i8* %6232, align 1
  %6233 = getelementptr inbounds i8, i8* %1, i64 %6230
  %6234 = load i8, i8* %6233, align 1
  %6235 = zext i8 %6234 to i32
  %6236 = icmp eq i32 %6235, 0
  br i1 %6236, label %6237, label %6240

6237:                                             ; preds = %6229
  %6238 = mul nuw nsw i64 %6230, 16
  %6239 = getelementptr inbounds i8, i8* %0, i64 %6238
  call void @llvm.memset.p0i8.i64(i8* align 1 %6239, i8 0, i64 16, i1 false)
  br label %6240

6240:                                             ; preds = %6237, %6229
  %6241 = add nuw nsw i64 %6230, 1
  %6242 = call zeroext i8 @randombit()
  %6243 = getelementptr inbounds i8, i8* %1, i64 %6241
  store i8 %6242, i8* %6243, align 1
  %6244 = getelementptr inbounds i8, i8* %1, i64 %6241
  %6245 = load i8, i8* %6244, align 1
  %6246 = zext i8 %6245 to i32
  %6247 = icmp eq i32 %6246, 0
  br i1 %6247, label %6248, label %6251

6248:                                             ; preds = %6240
  %6249 = mul nuw nsw i64 %6241, 16
  %6250 = getelementptr inbounds i8, i8* %0, i64 %6249
  call void @llvm.memset.p0i8.i64(i8* align 1 %6250, i8 0, i64 16, i1 false)
  br label %6251

6251:                                             ; preds = %6248, %6240
  %6252 = add nuw nsw i64 %6241, 1
  %6253 = call zeroext i8 @randombit()
  %6254 = getelementptr inbounds i8, i8* %1, i64 %6252
  store i8 %6253, i8* %6254, align 1
  %6255 = getelementptr inbounds i8, i8* %1, i64 %6252
  %6256 = load i8, i8* %6255, align 1
  %6257 = zext i8 %6256 to i32
  %6258 = icmp eq i32 %6257, 0
  br i1 %6258, label %6259, label %6262

6259:                                             ; preds = %6251
  %6260 = mul nuw nsw i64 %6252, 16
  %6261 = getelementptr inbounds i8, i8* %0, i64 %6260
  call void @llvm.memset.p0i8.i64(i8* align 1 %6261, i8 0, i64 16, i1 false)
  br label %6262

6262:                                             ; preds = %6259, %6251
  %6263 = add nuw nsw i64 %6252, 1
  %6264 = call zeroext i8 @randombit()
  %6265 = getelementptr inbounds i8, i8* %1, i64 %6263
  store i8 %6264, i8* %6265, align 1
  %6266 = getelementptr inbounds i8, i8* %1, i64 %6263
  %6267 = load i8, i8* %6266, align 1
  %6268 = zext i8 %6267 to i32
  %6269 = icmp eq i32 %6268, 0
  br i1 %6269, label %6270, label %6273

6270:                                             ; preds = %6262
  %6271 = mul nuw nsw i64 %6263, 16
  %6272 = getelementptr inbounds i8, i8* %0, i64 %6271
  call void @llvm.memset.p0i8.i64(i8* align 1 %6272, i8 0, i64 16, i1 false)
  br label %6273

6273:                                             ; preds = %6270, %6262
  %6274 = add nuw nsw i64 %6263, 1
  %6275 = call zeroext i8 @randombit()
  %6276 = getelementptr inbounds i8, i8* %1, i64 %6274
  store i8 %6275, i8* %6276, align 1
  %6277 = getelementptr inbounds i8, i8* %1, i64 %6274
  %6278 = load i8, i8* %6277, align 1
  %6279 = zext i8 %6278 to i32
  %6280 = icmp eq i32 %6279, 0
  br i1 %6280, label %6281, label %6284

6281:                                             ; preds = %6273
  %6282 = mul nuw nsw i64 %6274, 16
  %6283 = getelementptr inbounds i8, i8* %0, i64 %6282
  call void @llvm.memset.p0i8.i64(i8* align 1 %6283, i8 0, i64 16, i1 false)
  br label %6284

6284:                                             ; preds = %6281, %6273
  %6285 = add nuw nsw i64 %6274, 1
  %6286 = call zeroext i8 @randombit()
  %6287 = getelementptr inbounds i8, i8* %1, i64 %6285
  store i8 %6286, i8* %6287, align 1
  %6288 = getelementptr inbounds i8, i8* %1, i64 %6285
  %6289 = load i8, i8* %6288, align 1
  %6290 = zext i8 %6289 to i32
  %6291 = icmp eq i32 %6290, 0
  br i1 %6291, label %6292, label %6295

6292:                                             ; preds = %6284
  %6293 = mul nuw nsw i64 %6285, 16
  %6294 = getelementptr inbounds i8, i8* %0, i64 %6293
  call void @llvm.memset.p0i8.i64(i8* align 1 %6294, i8 0, i64 16, i1 false)
  br label %6295

6295:                                             ; preds = %6292, %6284
  %6296 = add nuw nsw i64 %6285, 1
  %6297 = call zeroext i8 @randombit()
  %6298 = getelementptr inbounds i8, i8* %1, i64 %6296
  store i8 %6297, i8* %6298, align 1
  %6299 = getelementptr inbounds i8, i8* %1, i64 %6296
  %6300 = load i8, i8* %6299, align 1
  %6301 = zext i8 %6300 to i32
  %6302 = icmp eq i32 %6301, 0
  br i1 %6302, label %6303, label %6306

6303:                                             ; preds = %6295
  %6304 = mul nuw nsw i64 %6296, 16
  %6305 = getelementptr inbounds i8, i8* %0, i64 %6304
  call void @llvm.memset.p0i8.i64(i8* align 1 %6305, i8 0, i64 16, i1 false)
  br label %6306

6306:                                             ; preds = %6303, %6295
  %6307 = add nuw nsw i64 %6296, 1
  %6308 = call zeroext i8 @randombit()
  %6309 = getelementptr inbounds i8, i8* %1, i64 %6307
  store i8 %6308, i8* %6309, align 1
  %6310 = getelementptr inbounds i8, i8* %1, i64 %6307
  %6311 = load i8, i8* %6310, align 1
  %6312 = zext i8 %6311 to i32
  %6313 = icmp eq i32 %6312, 0
  br i1 %6313, label %6314, label %6317

6314:                                             ; preds = %6306
  %6315 = mul nuw nsw i64 %6307, 16
  %6316 = getelementptr inbounds i8, i8* %0, i64 %6315
  call void @llvm.memset.p0i8.i64(i8* align 1 %6316, i8 0, i64 16, i1 false)
  br label %6317

6317:                                             ; preds = %6314, %6306
  %6318 = add nuw nsw i64 %6307, 1
  %6319 = call zeroext i8 @randombit()
  %6320 = getelementptr inbounds i8, i8* %1, i64 %6318
  store i8 %6319, i8* %6320, align 1
  %6321 = getelementptr inbounds i8, i8* %1, i64 %6318
  %6322 = load i8, i8* %6321, align 1
  %6323 = zext i8 %6322 to i32
  %6324 = icmp eq i32 %6323, 0
  br i1 %6324, label %6325, label %6328

6325:                                             ; preds = %6317
  %6326 = mul nuw nsw i64 %6318, 16
  %6327 = getelementptr inbounds i8, i8* %0, i64 %6326
  call void @llvm.memset.p0i8.i64(i8* align 1 %6327, i8 0, i64 16, i1 false)
  br label %6328

6328:                                             ; preds = %6325, %6317
  %6329 = add nuw nsw i64 %6318, 1
  %6330 = call zeroext i8 @randombit()
  %6331 = getelementptr inbounds i8, i8* %1, i64 %6329
  store i8 %6330, i8* %6331, align 1
  %6332 = getelementptr inbounds i8, i8* %1, i64 %6329
  %6333 = load i8, i8* %6332, align 1
  %6334 = zext i8 %6333 to i32
  %6335 = icmp eq i32 %6334, 0
  br i1 %6335, label %6336, label %6339

6336:                                             ; preds = %6328
  %6337 = mul nuw nsw i64 %6329, 16
  %6338 = getelementptr inbounds i8, i8* %0, i64 %6337
  call void @llvm.memset.p0i8.i64(i8* align 1 %6338, i8 0, i64 16, i1 false)
  br label %6339

6339:                                             ; preds = %6336, %6328
  %6340 = add nuw nsw i64 %6329, 1
  %6341 = call zeroext i8 @randombit()
  %6342 = getelementptr inbounds i8, i8* %1, i64 %6340
  store i8 %6341, i8* %6342, align 1
  %6343 = getelementptr inbounds i8, i8* %1, i64 %6340
  %6344 = load i8, i8* %6343, align 1
  %6345 = zext i8 %6344 to i32
  %6346 = icmp eq i32 %6345, 0
  br i1 %6346, label %6347, label %6350

6347:                                             ; preds = %6339
  %6348 = mul nuw nsw i64 %6340, 16
  %6349 = getelementptr inbounds i8, i8* %0, i64 %6348
  call void @llvm.memset.p0i8.i64(i8* align 1 %6349, i8 0, i64 16, i1 false)
  br label %6350

6350:                                             ; preds = %6347, %6339
  %6351 = add nuw nsw i64 %6340, 1
  %6352 = call zeroext i8 @randombit()
  %6353 = getelementptr inbounds i8, i8* %1, i64 %6351
  store i8 %6352, i8* %6353, align 1
  %6354 = getelementptr inbounds i8, i8* %1, i64 %6351
  %6355 = load i8, i8* %6354, align 1
  %6356 = zext i8 %6355 to i32
  %6357 = icmp eq i32 %6356, 0
  br i1 %6357, label %6358, label %6361

6358:                                             ; preds = %6350
  %6359 = mul nuw nsw i64 %6351, 16
  %6360 = getelementptr inbounds i8, i8* %0, i64 %6359
  call void @llvm.memset.p0i8.i64(i8* align 1 %6360, i8 0, i64 16, i1 false)
  br label %6361

6361:                                             ; preds = %6358, %6350
  %6362 = add nuw nsw i64 %6351, 1
  %6363 = call zeroext i8 @randombit()
  %6364 = getelementptr inbounds i8, i8* %1, i64 %6362
  store i8 %6363, i8* %6364, align 1
  %6365 = getelementptr inbounds i8, i8* %1, i64 %6362
  %6366 = load i8, i8* %6365, align 1
  %6367 = zext i8 %6366 to i32
  %6368 = icmp eq i32 %6367, 0
  br i1 %6368, label %6369, label %6372

6369:                                             ; preds = %6361
  %6370 = mul nuw nsw i64 %6362, 16
  %6371 = getelementptr inbounds i8, i8* %0, i64 %6370
  call void @llvm.memset.p0i8.i64(i8* align 1 %6371, i8 0, i64 16, i1 false)
  br label %6372

6372:                                             ; preds = %6369, %6361
  %6373 = add nuw nsw i64 %6362, 1
  %6374 = call zeroext i8 @randombit()
  %6375 = getelementptr inbounds i8, i8* %1, i64 %6373
  store i8 %6374, i8* %6375, align 1
  %6376 = getelementptr inbounds i8, i8* %1, i64 %6373
  %6377 = load i8, i8* %6376, align 1
  %6378 = zext i8 %6377 to i32
  %6379 = icmp eq i32 %6378, 0
  br i1 %6379, label %6380, label %6383

6380:                                             ; preds = %6372
  %6381 = mul nuw nsw i64 %6373, 16
  %6382 = getelementptr inbounds i8, i8* %0, i64 %6381
  call void @llvm.memset.p0i8.i64(i8* align 1 %6382, i8 0, i64 16, i1 false)
  br label %6383

6383:                                             ; preds = %6380, %6372
  %6384 = add nuw nsw i64 %6373, 1
  %6385 = call zeroext i8 @randombit()
  %6386 = getelementptr inbounds i8, i8* %1, i64 %6384
  store i8 %6385, i8* %6386, align 1
  %6387 = getelementptr inbounds i8, i8* %1, i64 %6384
  %6388 = load i8, i8* %6387, align 1
  %6389 = zext i8 %6388 to i32
  %6390 = icmp eq i32 %6389, 0
  br i1 %6390, label %6391, label %6394

6391:                                             ; preds = %6383
  %6392 = mul nuw nsw i64 %6384, 16
  %6393 = getelementptr inbounds i8, i8* %0, i64 %6392
  call void @llvm.memset.p0i8.i64(i8* align 1 %6393, i8 0, i64 16, i1 false)
  br label %6394

6394:                                             ; preds = %6391, %6383
  %6395 = add nuw nsw i64 %6384, 1
  %6396 = call zeroext i8 @randombit()
  %6397 = getelementptr inbounds i8, i8* %1, i64 %6395
  store i8 %6396, i8* %6397, align 1
  %6398 = getelementptr inbounds i8, i8* %1, i64 %6395
  %6399 = load i8, i8* %6398, align 1
  %6400 = zext i8 %6399 to i32
  %6401 = icmp eq i32 %6400, 0
  br i1 %6401, label %6402, label %6405

6402:                                             ; preds = %6394
  %6403 = mul nuw nsw i64 %6395, 16
  %6404 = getelementptr inbounds i8, i8* %0, i64 %6403
  call void @llvm.memset.p0i8.i64(i8* align 1 %6404, i8 0, i64 16, i1 false)
  br label %6405

6405:                                             ; preds = %6402, %6394
  %6406 = add nuw nsw i64 %6395, 1
  %6407 = call zeroext i8 @randombit()
  %6408 = getelementptr inbounds i8, i8* %1, i64 %6406
  store i8 %6407, i8* %6408, align 1
  %6409 = getelementptr inbounds i8, i8* %1, i64 %6406
  %6410 = load i8, i8* %6409, align 1
  %6411 = zext i8 %6410 to i32
  %6412 = icmp eq i32 %6411, 0
  br i1 %6412, label %6413, label %6416

6413:                                             ; preds = %6405
  %6414 = mul nuw nsw i64 %6406, 16
  %6415 = getelementptr inbounds i8, i8* %0, i64 %6414
  call void @llvm.memset.p0i8.i64(i8* align 1 %6415, i8 0, i64 16, i1 false)
  br label %6416

6416:                                             ; preds = %6413, %6405
  %6417 = add nuw nsw i64 %6406, 1
  %6418 = call zeroext i8 @randombit()
  %6419 = getelementptr inbounds i8, i8* %1, i64 %6417
  store i8 %6418, i8* %6419, align 1
  %6420 = getelementptr inbounds i8, i8* %1, i64 %6417
  %6421 = load i8, i8* %6420, align 1
  %6422 = zext i8 %6421 to i32
  %6423 = icmp eq i32 %6422, 0
  br i1 %6423, label %6424, label %6427

6424:                                             ; preds = %6416
  %6425 = mul nuw nsw i64 %6417, 16
  %6426 = getelementptr inbounds i8, i8* %0, i64 %6425
  call void @llvm.memset.p0i8.i64(i8* align 1 %6426, i8 0, i64 16, i1 false)
  br label %6427

6427:                                             ; preds = %6424, %6416
  %6428 = add nuw nsw i64 %6417, 1
  %6429 = call zeroext i8 @randombit()
  %6430 = getelementptr inbounds i8, i8* %1, i64 %6428
  store i8 %6429, i8* %6430, align 1
  %6431 = getelementptr inbounds i8, i8* %1, i64 %6428
  %6432 = load i8, i8* %6431, align 1
  %6433 = zext i8 %6432 to i32
  %6434 = icmp eq i32 %6433, 0
  br i1 %6434, label %6435, label %6438

6435:                                             ; preds = %6427
  %6436 = mul nuw nsw i64 %6428, 16
  %6437 = getelementptr inbounds i8, i8* %0, i64 %6436
  call void @llvm.memset.p0i8.i64(i8* align 1 %6437, i8 0, i64 16, i1 false)
  br label %6438

6438:                                             ; preds = %6435, %6427
  %6439 = add nuw nsw i64 %6428, 1
  %6440 = call zeroext i8 @randombit()
  %6441 = getelementptr inbounds i8, i8* %1, i64 %6439
  store i8 %6440, i8* %6441, align 1
  %6442 = getelementptr inbounds i8, i8* %1, i64 %6439
  %6443 = load i8, i8* %6442, align 1
  %6444 = zext i8 %6443 to i32
  %6445 = icmp eq i32 %6444, 0
  br i1 %6445, label %6446, label %6449

6446:                                             ; preds = %6438
  %6447 = mul nuw nsw i64 %6439, 16
  %6448 = getelementptr inbounds i8, i8* %0, i64 %6447
  call void @llvm.memset.p0i8.i64(i8* align 1 %6448, i8 0, i64 16, i1 false)
  br label %6449

6449:                                             ; preds = %6446, %6438
  %6450 = add nuw nsw i64 %6439, 1
  %6451 = call zeroext i8 @randombit()
  %6452 = getelementptr inbounds i8, i8* %1, i64 %6450
  store i8 %6451, i8* %6452, align 1
  %6453 = getelementptr inbounds i8, i8* %1, i64 %6450
  %6454 = load i8, i8* %6453, align 1
  %6455 = zext i8 %6454 to i32
  %6456 = icmp eq i32 %6455, 0
  br i1 %6456, label %6457, label %6460

6457:                                             ; preds = %6449
  %6458 = mul nuw nsw i64 %6450, 16
  %6459 = getelementptr inbounds i8, i8* %0, i64 %6458
  call void @llvm.memset.p0i8.i64(i8* align 1 %6459, i8 0, i64 16, i1 false)
  br label %6460

6460:                                             ; preds = %6457, %6449
  %6461 = add nuw nsw i64 %6450, 1
  %6462 = call zeroext i8 @randombit()
  %6463 = getelementptr inbounds i8, i8* %1, i64 %6461
  store i8 %6462, i8* %6463, align 1
  %6464 = getelementptr inbounds i8, i8* %1, i64 %6461
  %6465 = load i8, i8* %6464, align 1
  %6466 = zext i8 %6465 to i32
  %6467 = icmp eq i32 %6466, 0
  br i1 %6467, label %6468, label %6471

6468:                                             ; preds = %6460
  %6469 = mul nuw nsw i64 %6461, 16
  %6470 = getelementptr inbounds i8, i8* %0, i64 %6469
  call void @llvm.memset.p0i8.i64(i8* align 1 %6470, i8 0, i64 16, i1 false)
  br label %6471

6471:                                             ; preds = %6468, %6460
  %6472 = add nuw nsw i64 %6461, 1
  %6473 = call zeroext i8 @randombit()
  %6474 = getelementptr inbounds i8, i8* %1, i64 %6472
  store i8 %6473, i8* %6474, align 1
  %6475 = getelementptr inbounds i8, i8* %1, i64 %6472
  %6476 = load i8, i8* %6475, align 1
  %6477 = zext i8 %6476 to i32
  %6478 = icmp eq i32 %6477, 0
  br i1 %6478, label %6479, label %6482

6479:                                             ; preds = %6471
  %6480 = mul nuw nsw i64 %6472, 16
  %6481 = getelementptr inbounds i8, i8* %0, i64 %6480
  call void @llvm.memset.p0i8.i64(i8* align 1 %6481, i8 0, i64 16, i1 false)
  br label %6482

6482:                                             ; preds = %6479, %6471
  %6483 = add nuw nsw i64 %6472, 1
  %6484 = call zeroext i8 @randombit()
  %6485 = getelementptr inbounds i8, i8* %1, i64 %6483
  store i8 %6484, i8* %6485, align 1
  %6486 = getelementptr inbounds i8, i8* %1, i64 %6483
  %6487 = load i8, i8* %6486, align 1
  %6488 = zext i8 %6487 to i32
  %6489 = icmp eq i32 %6488, 0
  br i1 %6489, label %6490, label %6493

6490:                                             ; preds = %6482
  %6491 = mul nuw nsw i64 %6483, 16
  %6492 = getelementptr inbounds i8, i8* %0, i64 %6491
  call void @llvm.memset.p0i8.i64(i8* align 1 %6492, i8 0, i64 16, i1 false)
  br label %6493

6493:                                             ; preds = %6490, %6482
  %6494 = add nuw nsw i64 %6483, 1
  %6495 = call zeroext i8 @randombit()
  %6496 = getelementptr inbounds i8, i8* %1, i64 %6494
  store i8 %6495, i8* %6496, align 1
  %6497 = getelementptr inbounds i8, i8* %1, i64 %6494
  %6498 = load i8, i8* %6497, align 1
  %6499 = zext i8 %6498 to i32
  %6500 = icmp eq i32 %6499, 0
  br i1 %6500, label %6501, label %6504

6501:                                             ; preds = %6493
  %6502 = mul nuw nsw i64 %6494, 16
  %6503 = getelementptr inbounds i8, i8* %0, i64 %6502
  call void @llvm.memset.p0i8.i64(i8* align 1 %6503, i8 0, i64 16, i1 false)
  br label %6504

6504:                                             ; preds = %6501, %6493
  %6505 = add nuw nsw i64 %6494, 1
  %6506 = call zeroext i8 @randombit()
  %6507 = getelementptr inbounds i8, i8* %1, i64 %6505
  store i8 %6506, i8* %6507, align 1
  %6508 = getelementptr inbounds i8, i8* %1, i64 %6505
  %6509 = load i8, i8* %6508, align 1
  %6510 = zext i8 %6509 to i32
  %6511 = icmp eq i32 %6510, 0
  br i1 %6511, label %6512, label %6515

6512:                                             ; preds = %6504
  %6513 = mul nuw nsw i64 %6505, 16
  %6514 = getelementptr inbounds i8, i8* %0, i64 %6513
  call void @llvm.memset.p0i8.i64(i8* align 1 %6514, i8 0, i64 16, i1 false)
  br label %6515

6515:                                             ; preds = %6512, %6504
  %6516 = add nuw nsw i64 %6505, 1
  %6517 = call zeroext i8 @randombit()
  %6518 = getelementptr inbounds i8, i8* %1, i64 %6516
  store i8 %6517, i8* %6518, align 1
  %6519 = getelementptr inbounds i8, i8* %1, i64 %6516
  %6520 = load i8, i8* %6519, align 1
  %6521 = zext i8 %6520 to i32
  %6522 = icmp eq i32 %6521, 0
  br i1 %6522, label %6523, label %6526

6523:                                             ; preds = %6515
  %6524 = mul nuw nsw i64 %6516, 16
  %6525 = getelementptr inbounds i8, i8* %0, i64 %6524
  call void @llvm.memset.p0i8.i64(i8* align 1 %6525, i8 0, i64 16, i1 false)
  br label %6526

6526:                                             ; preds = %6523, %6515
  %6527 = add nuw nsw i64 %6516, 1
  %6528 = call zeroext i8 @randombit()
  %6529 = getelementptr inbounds i8, i8* %1, i64 %6527
  store i8 %6528, i8* %6529, align 1
  %6530 = getelementptr inbounds i8, i8* %1, i64 %6527
  %6531 = load i8, i8* %6530, align 1
  %6532 = zext i8 %6531 to i32
  %6533 = icmp eq i32 %6532, 0
  br i1 %6533, label %6534, label %6537

6534:                                             ; preds = %6526
  %6535 = mul nuw nsw i64 %6527, 16
  %6536 = getelementptr inbounds i8, i8* %0, i64 %6535
  call void @llvm.memset.p0i8.i64(i8* align 1 %6536, i8 0, i64 16, i1 false)
  br label %6537

6537:                                             ; preds = %6534, %6526
  %6538 = add nuw nsw i64 %6527, 1
  %6539 = call zeroext i8 @randombit()
  %6540 = getelementptr inbounds i8, i8* %1, i64 %6538
  store i8 %6539, i8* %6540, align 1
  %6541 = getelementptr inbounds i8, i8* %1, i64 %6538
  %6542 = load i8, i8* %6541, align 1
  %6543 = zext i8 %6542 to i32
  %6544 = icmp eq i32 %6543, 0
  br i1 %6544, label %6545, label %6548

6545:                                             ; preds = %6537
  %6546 = mul nuw nsw i64 %6538, 16
  %6547 = getelementptr inbounds i8, i8* %0, i64 %6546
  call void @llvm.memset.p0i8.i64(i8* align 1 %6547, i8 0, i64 16, i1 false)
  br label %6548

6548:                                             ; preds = %6545, %6537
  %6549 = add nuw nsw i64 %6538, 1
  %6550 = call zeroext i8 @randombit()
  %6551 = getelementptr inbounds i8, i8* %1, i64 %6549
  store i8 %6550, i8* %6551, align 1
  %6552 = getelementptr inbounds i8, i8* %1, i64 %6549
  %6553 = load i8, i8* %6552, align 1
  %6554 = zext i8 %6553 to i32
  %6555 = icmp eq i32 %6554, 0
  br i1 %6555, label %6556, label %6559

6556:                                             ; preds = %6548
  %6557 = mul nuw nsw i64 %6549, 16
  %6558 = getelementptr inbounds i8, i8* %0, i64 %6557
  call void @llvm.memset.p0i8.i64(i8* align 1 %6558, i8 0, i64 16, i1 false)
  br label %6559

6559:                                             ; preds = %6556, %6548
  %6560 = add nuw nsw i64 %6549, 1
  %6561 = call zeroext i8 @randombit()
  %6562 = getelementptr inbounds i8, i8* %1, i64 %6560
  store i8 %6561, i8* %6562, align 1
  %6563 = getelementptr inbounds i8, i8* %1, i64 %6560
  %6564 = load i8, i8* %6563, align 1
  %6565 = zext i8 %6564 to i32
  %6566 = icmp eq i32 %6565, 0
  br i1 %6566, label %6567, label %6570

6567:                                             ; preds = %6559
  %6568 = mul nuw nsw i64 %6560, 16
  %6569 = getelementptr inbounds i8, i8* %0, i64 %6568
  call void @llvm.memset.p0i8.i64(i8* align 1 %6569, i8 0, i64 16, i1 false)
  br label %6570

6570:                                             ; preds = %6567, %6559
  %6571 = add nuw nsw i64 %6560, 1
  %6572 = call zeroext i8 @randombit()
  %6573 = getelementptr inbounds i8, i8* %1, i64 %6571
  store i8 %6572, i8* %6573, align 1
  %6574 = getelementptr inbounds i8, i8* %1, i64 %6571
  %6575 = load i8, i8* %6574, align 1
  %6576 = zext i8 %6575 to i32
  %6577 = icmp eq i32 %6576, 0
  br i1 %6577, label %6578, label %6581

6578:                                             ; preds = %6570
  %6579 = mul nuw nsw i64 %6571, 16
  %6580 = getelementptr inbounds i8, i8* %0, i64 %6579
  call void @llvm.memset.p0i8.i64(i8* align 1 %6580, i8 0, i64 16, i1 false)
  br label %6581

6581:                                             ; preds = %6578, %6570
  %6582 = add nuw nsw i64 %6571, 1
  %6583 = call zeroext i8 @randombit()
  %6584 = getelementptr inbounds i8, i8* %1, i64 %6582
  store i8 %6583, i8* %6584, align 1
  %6585 = getelementptr inbounds i8, i8* %1, i64 %6582
  %6586 = load i8, i8* %6585, align 1
  %6587 = zext i8 %6586 to i32
  %6588 = icmp eq i32 %6587, 0
  br i1 %6588, label %6589, label %6592

6589:                                             ; preds = %6581
  %6590 = mul nuw nsw i64 %6582, 16
  %6591 = getelementptr inbounds i8, i8* %0, i64 %6590
  call void @llvm.memset.p0i8.i64(i8* align 1 %6591, i8 0, i64 16, i1 false)
  br label %6592

6592:                                             ; preds = %6589, %6581
  %6593 = add nuw nsw i64 %6582, 1
  %6594 = call zeroext i8 @randombit()
  %6595 = getelementptr inbounds i8, i8* %1, i64 %6593
  store i8 %6594, i8* %6595, align 1
  %6596 = getelementptr inbounds i8, i8* %1, i64 %6593
  %6597 = load i8, i8* %6596, align 1
  %6598 = zext i8 %6597 to i32
  %6599 = icmp eq i32 %6598, 0
  br i1 %6599, label %6600, label %6603

6600:                                             ; preds = %6592
  %6601 = mul nuw nsw i64 %6593, 16
  %6602 = getelementptr inbounds i8, i8* %0, i64 %6601
  call void @llvm.memset.p0i8.i64(i8* align 1 %6602, i8 0, i64 16, i1 false)
  br label %6603

6603:                                             ; preds = %6600, %6592
  %6604 = add nuw nsw i64 %6593, 1
  %6605 = call zeroext i8 @randombit()
  %6606 = getelementptr inbounds i8, i8* %1, i64 %6604
  store i8 %6605, i8* %6606, align 1
  %6607 = getelementptr inbounds i8, i8* %1, i64 %6604
  %6608 = load i8, i8* %6607, align 1
  %6609 = zext i8 %6608 to i32
  %6610 = icmp eq i32 %6609, 0
  br i1 %6610, label %6611, label %6614

6611:                                             ; preds = %6603
  %6612 = mul nuw nsw i64 %6604, 16
  %6613 = getelementptr inbounds i8, i8* %0, i64 %6612
  call void @llvm.memset.p0i8.i64(i8* align 1 %6613, i8 0, i64 16, i1 false)
  br label %6614

6614:                                             ; preds = %6611, %6603
  %6615 = add nuw nsw i64 %6604, 1
  %6616 = call zeroext i8 @randombit()
  %6617 = getelementptr inbounds i8, i8* %1, i64 %6615
  store i8 %6616, i8* %6617, align 1
  %6618 = getelementptr inbounds i8, i8* %1, i64 %6615
  %6619 = load i8, i8* %6618, align 1
  %6620 = zext i8 %6619 to i32
  %6621 = icmp eq i32 %6620, 0
  br i1 %6621, label %6622, label %6625

6622:                                             ; preds = %6614
  %6623 = mul nuw nsw i64 %6615, 16
  %6624 = getelementptr inbounds i8, i8* %0, i64 %6623
  call void @llvm.memset.p0i8.i64(i8* align 1 %6624, i8 0, i64 16, i1 false)
  br label %6625

6625:                                             ; preds = %6622, %6614
  %6626 = add nuw nsw i64 %6615, 1
  %6627 = call zeroext i8 @randombit()
  %6628 = getelementptr inbounds i8, i8* %1, i64 %6626
  store i8 %6627, i8* %6628, align 1
  %6629 = getelementptr inbounds i8, i8* %1, i64 %6626
  %6630 = load i8, i8* %6629, align 1
  %6631 = zext i8 %6630 to i32
  %6632 = icmp eq i32 %6631, 0
  br i1 %6632, label %6633, label %6636

6633:                                             ; preds = %6625
  %6634 = mul nuw nsw i64 %6626, 16
  %6635 = getelementptr inbounds i8, i8* %0, i64 %6634
  call void @llvm.memset.p0i8.i64(i8* align 1 %6635, i8 0, i64 16, i1 false)
  br label %6636

6636:                                             ; preds = %6633, %6625
  %6637 = add nuw nsw i64 %6626, 1
  %6638 = call zeroext i8 @randombit()
  %6639 = getelementptr inbounds i8, i8* %1, i64 %6637
  store i8 %6638, i8* %6639, align 1
  %6640 = getelementptr inbounds i8, i8* %1, i64 %6637
  %6641 = load i8, i8* %6640, align 1
  %6642 = zext i8 %6641 to i32
  %6643 = icmp eq i32 %6642, 0
  br i1 %6643, label %6644, label %6647

6644:                                             ; preds = %6636
  %6645 = mul nuw nsw i64 %6637, 16
  %6646 = getelementptr inbounds i8, i8* %0, i64 %6645
  call void @llvm.memset.p0i8.i64(i8* align 1 %6646, i8 0, i64 16, i1 false)
  br label %6647

6647:                                             ; preds = %6644, %6636
  %6648 = add nuw nsw i64 %6637, 1
  %6649 = call zeroext i8 @randombit()
  %6650 = getelementptr inbounds i8, i8* %1, i64 %6648
  store i8 %6649, i8* %6650, align 1
  %6651 = getelementptr inbounds i8, i8* %1, i64 %6648
  %6652 = load i8, i8* %6651, align 1
  %6653 = zext i8 %6652 to i32
  %6654 = icmp eq i32 %6653, 0
  br i1 %6654, label %6655, label %6658

6655:                                             ; preds = %6647
  %6656 = mul nuw nsw i64 %6648, 16
  %6657 = getelementptr inbounds i8, i8* %0, i64 %6656
  call void @llvm.memset.p0i8.i64(i8* align 1 %6657, i8 0, i64 16, i1 false)
  br label %6658

6658:                                             ; preds = %6655, %6647
  %6659 = add nuw nsw i64 %6648, 1
  %6660 = call zeroext i8 @randombit()
  %6661 = getelementptr inbounds i8, i8* %1, i64 %6659
  store i8 %6660, i8* %6661, align 1
  %6662 = getelementptr inbounds i8, i8* %1, i64 %6659
  %6663 = load i8, i8* %6662, align 1
  %6664 = zext i8 %6663 to i32
  %6665 = icmp eq i32 %6664, 0
  br i1 %6665, label %6666, label %6669

6666:                                             ; preds = %6658
  %6667 = mul nuw nsw i64 %6659, 16
  %6668 = getelementptr inbounds i8, i8* %0, i64 %6667
  call void @llvm.memset.p0i8.i64(i8* align 1 %6668, i8 0, i64 16, i1 false)
  br label %6669

6669:                                             ; preds = %6666, %6658
  %6670 = add nuw nsw i64 %6659, 1
  %6671 = call zeroext i8 @randombit()
  %6672 = getelementptr inbounds i8, i8* %1, i64 %6670
  store i8 %6671, i8* %6672, align 1
  %6673 = getelementptr inbounds i8, i8* %1, i64 %6670
  %6674 = load i8, i8* %6673, align 1
  %6675 = zext i8 %6674 to i32
  %6676 = icmp eq i32 %6675, 0
  br i1 %6676, label %6677, label %6680

6677:                                             ; preds = %6669
  %6678 = mul nuw nsw i64 %6670, 16
  %6679 = getelementptr inbounds i8, i8* %0, i64 %6678
  call void @llvm.memset.p0i8.i64(i8* align 1 %6679, i8 0, i64 16, i1 false)
  br label %6680

6680:                                             ; preds = %6677, %6669
  %6681 = add nuw nsw i64 %6670, 1
  %6682 = call zeroext i8 @randombit()
  %6683 = getelementptr inbounds i8, i8* %1, i64 %6681
  store i8 %6682, i8* %6683, align 1
  %6684 = getelementptr inbounds i8, i8* %1, i64 %6681
  %6685 = load i8, i8* %6684, align 1
  %6686 = zext i8 %6685 to i32
  %6687 = icmp eq i32 %6686, 0
  br i1 %6687, label %6688, label %6691

6688:                                             ; preds = %6680
  %6689 = mul nuw nsw i64 %6681, 16
  %6690 = getelementptr inbounds i8, i8* %0, i64 %6689
  call void @llvm.memset.p0i8.i64(i8* align 1 %6690, i8 0, i64 16, i1 false)
  br label %6691

6691:                                             ; preds = %6688, %6680
  %6692 = add nuw nsw i64 %6681, 1
  %6693 = call zeroext i8 @randombit()
  %6694 = getelementptr inbounds i8, i8* %1, i64 %6692
  store i8 %6693, i8* %6694, align 1
  %6695 = getelementptr inbounds i8, i8* %1, i64 %6692
  %6696 = load i8, i8* %6695, align 1
  %6697 = zext i8 %6696 to i32
  %6698 = icmp eq i32 %6697, 0
  br i1 %6698, label %6699, label %6702

6699:                                             ; preds = %6691
  %6700 = mul nuw nsw i64 %6692, 16
  %6701 = getelementptr inbounds i8, i8* %0, i64 %6700
  call void @llvm.memset.p0i8.i64(i8* align 1 %6701, i8 0, i64 16, i1 false)
  br label %6702

6702:                                             ; preds = %6699, %6691
  %6703 = add nuw nsw i64 %6692, 1
  %6704 = call zeroext i8 @randombit()
  %6705 = getelementptr inbounds i8, i8* %1, i64 %6703
  store i8 %6704, i8* %6705, align 1
  %6706 = getelementptr inbounds i8, i8* %1, i64 %6703
  %6707 = load i8, i8* %6706, align 1
  %6708 = zext i8 %6707 to i32
  %6709 = icmp eq i32 %6708, 0
  br i1 %6709, label %6710, label %6713

6710:                                             ; preds = %6702
  %6711 = mul nuw nsw i64 %6703, 16
  %6712 = getelementptr inbounds i8, i8* %0, i64 %6711
  call void @llvm.memset.p0i8.i64(i8* align 1 %6712, i8 0, i64 16, i1 false)
  br label %6713

6713:                                             ; preds = %6710, %6702
  %6714 = add nuw nsw i64 %6703, 1
  %6715 = call zeroext i8 @randombit()
  %6716 = getelementptr inbounds i8, i8* %1, i64 %6714
  store i8 %6715, i8* %6716, align 1
  %6717 = getelementptr inbounds i8, i8* %1, i64 %6714
  %6718 = load i8, i8* %6717, align 1
  %6719 = zext i8 %6718 to i32
  %6720 = icmp eq i32 %6719, 0
  br i1 %6720, label %6721, label %6724

6721:                                             ; preds = %6713
  %6722 = mul nuw nsw i64 %6714, 16
  %6723 = getelementptr inbounds i8, i8* %0, i64 %6722
  call void @llvm.memset.p0i8.i64(i8* align 1 %6723, i8 0, i64 16, i1 false)
  br label %6724

6724:                                             ; preds = %6721, %6713
  %6725 = add nuw nsw i64 %6714, 1
  %6726 = call zeroext i8 @randombit()
  %6727 = getelementptr inbounds i8, i8* %1, i64 %6725
  store i8 %6726, i8* %6727, align 1
  %6728 = getelementptr inbounds i8, i8* %1, i64 %6725
  %6729 = load i8, i8* %6728, align 1
  %6730 = zext i8 %6729 to i32
  %6731 = icmp eq i32 %6730, 0
  br i1 %6731, label %6732, label %6735

6732:                                             ; preds = %6724
  %6733 = mul nuw nsw i64 %6725, 16
  %6734 = getelementptr inbounds i8, i8* %0, i64 %6733
  call void @llvm.memset.p0i8.i64(i8* align 1 %6734, i8 0, i64 16, i1 false)
  br label %6735

6735:                                             ; preds = %6732, %6724
  %6736 = add nuw nsw i64 %6725, 1
  %6737 = call zeroext i8 @randombit()
  %6738 = getelementptr inbounds i8, i8* %1, i64 %6736
  store i8 %6737, i8* %6738, align 1
  %6739 = getelementptr inbounds i8, i8* %1, i64 %6736
  %6740 = load i8, i8* %6739, align 1
  %6741 = zext i8 %6740 to i32
  %6742 = icmp eq i32 %6741, 0
  br i1 %6742, label %6743, label %6746

6743:                                             ; preds = %6735
  %6744 = mul nuw nsw i64 %6736, 16
  %6745 = getelementptr inbounds i8, i8* %0, i64 %6744
  call void @llvm.memset.p0i8.i64(i8* align 1 %6745, i8 0, i64 16, i1 false)
  br label %6746

6746:                                             ; preds = %6743, %6735
  %6747 = add nuw nsw i64 %6736, 1
  %6748 = call zeroext i8 @randombit()
  %6749 = getelementptr inbounds i8, i8* %1, i64 %6747
  store i8 %6748, i8* %6749, align 1
  %6750 = getelementptr inbounds i8, i8* %1, i64 %6747
  %6751 = load i8, i8* %6750, align 1
  %6752 = zext i8 %6751 to i32
  %6753 = icmp eq i32 %6752, 0
  br i1 %6753, label %6754, label %6757

6754:                                             ; preds = %6746
  %6755 = mul nuw nsw i64 %6747, 16
  %6756 = getelementptr inbounds i8, i8* %0, i64 %6755
  call void @llvm.memset.p0i8.i64(i8* align 1 %6756, i8 0, i64 16, i1 false)
  br label %6757

6757:                                             ; preds = %6754, %6746
  %6758 = add nuw nsw i64 %6747, 1
  %6759 = call zeroext i8 @randombit()
  %6760 = getelementptr inbounds i8, i8* %1, i64 %6758
  store i8 %6759, i8* %6760, align 1
  %6761 = getelementptr inbounds i8, i8* %1, i64 %6758
  %6762 = load i8, i8* %6761, align 1
  %6763 = zext i8 %6762 to i32
  %6764 = icmp eq i32 %6763, 0
  br i1 %6764, label %6765, label %6768

6765:                                             ; preds = %6757
  %6766 = mul nuw nsw i64 %6758, 16
  %6767 = getelementptr inbounds i8, i8* %0, i64 %6766
  call void @llvm.memset.p0i8.i64(i8* align 1 %6767, i8 0, i64 16, i1 false)
  br label %6768

6768:                                             ; preds = %6765, %6757
  %6769 = add nuw nsw i64 %6758, 1
  %6770 = call zeroext i8 @randombit()
  %6771 = getelementptr inbounds i8, i8* %1, i64 %6769
  store i8 %6770, i8* %6771, align 1
  %6772 = getelementptr inbounds i8, i8* %1, i64 %6769
  %6773 = load i8, i8* %6772, align 1
  %6774 = zext i8 %6773 to i32
  %6775 = icmp eq i32 %6774, 0
  br i1 %6775, label %6776, label %6779

6776:                                             ; preds = %6768
  %6777 = mul nuw nsw i64 %6769, 16
  %6778 = getelementptr inbounds i8, i8* %0, i64 %6777
  call void @llvm.memset.p0i8.i64(i8* align 1 %6778, i8 0, i64 16, i1 false)
  br label %6779

6779:                                             ; preds = %6776, %6768
  %6780 = add nuw nsw i64 %6769, 1
  %6781 = call zeroext i8 @randombit()
  %6782 = getelementptr inbounds i8, i8* %1, i64 %6780
  store i8 %6781, i8* %6782, align 1
  %6783 = getelementptr inbounds i8, i8* %1, i64 %6780
  %6784 = load i8, i8* %6783, align 1
  %6785 = zext i8 %6784 to i32
  %6786 = icmp eq i32 %6785, 0
  br i1 %6786, label %6787, label %6790

6787:                                             ; preds = %6779
  %6788 = mul nuw nsw i64 %6780, 16
  %6789 = getelementptr inbounds i8, i8* %0, i64 %6788
  call void @llvm.memset.p0i8.i64(i8* align 1 %6789, i8 0, i64 16, i1 false)
  br label %6790

6790:                                             ; preds = %6787, %6779
  %6791 = add nuw nsw i64 %6780, 1
  %6792 = call zeroext i8 @randombit()
  %6793 = getelementptr inbounds i8, i8* %1, i64 %6791
  store i8 %6792, i8* %6793, align 1
  %6794 = getelementptr inbounds i8, i8* %1, i64 %6791
  %6795 = load i8, i8* %6794, align 1
  %6796 = zext i8 %6795 to i32
  %6797 = icmp eq i32 %6796, 0
  br i1 %6797, label %6798, label %6801

6798:                                             ; preds = %6790
  %6799 = mul nuw nsw i64 %6791, 16
  %6800 = getelementptr inbounds i8, i8* %0, i64 %6799
  call void @llvm.memset.p0i8.i64(i8* align 1 %6800, i8 0, i64 16, i1 false)
  br label %6801

6801:                                             ; preds = %6798, %6790
  %6802 = add nuw nsw i64 %6791, 1
  %6803 = call zeroext i8 @randombit()
  %6804 = getelementptr inbounds i8, i8* %1, i64 %6802
  store i8 %6803, i8* %6804, align 1
  %6805 = getelementptr inbounds i8, i8* %1, i64 %6802
  %6806 = load i8, i8* %6805, align 1
  %6807 = zext i8 %6806 to i32
  %6808 = icmp eq i32 %6807, 0
  br i1 %6808, label %6809, label %6812

6809:                                             ; preds = %6801
  %6810 = mul nuw nsw i64 %6802, 16
  %6811 = getelementptr inbounds i8, i8* %0, i64 %6810
  call void @llvm.memset.p0i8.i64(i8* align 1 %6811, i8 0, i64 16, i1 false)
  br label %6812

6812:                                             ; preds = %6809, %6801
  %6813 = add nuw nsw i64 %6802, 1
  %6814 = call zeroext i8 @randombit()
  %6815 = getelementptr inbounds i8, i8* %1, i64 %6813
  store i8 %6814, i8* %6815, align 1
  %6816 = getelementptr inbounds i8, i8* %1, i64 %6813
  %6817 = load i8, i8* %6816, align 1
  %6818 = zext i8 %6817 to i32
  %6819 = icmp eq i32 %6818, 0
  br i1 %6819, label %6820, label %6823

6820:                                             ; preds = %6812
  %6821 = mul nuw nsw i64 %6813, 16
  %6822 = getelementptr inbounds i8, i8* %0, i64 %6821
  call void @llvm.memset.p0i8.i64(i8* align 1 %6822, i8 0, i64 16, i1 false)
  br label %6823

6823:                                             ; preds = %6820, %6812
  %6824 = add nuw nsw i64 %6813, 1
  %6825 = call zeroext i8 @randombit()
  %6826 = getelementptr inbounds i8, i8* %1, i64 %6824
  store i8 %6825, i8* %6826, align 1
  %6827 = getelementptr inbounds i8, i8* %1, i64 %6824
  %6828 = load i8, i8* %6827, align 1
  %6829 = zext i8 %6828 to i32
  %6830 = icmp eq i32 %6829, 0
  br i1 %6830, label %6831, label %6834

6831:                                             ; preds = %6823
  %6832 = mul nuw nsw i64 %6824, 16
  %6833 = getelementptr inbounds i8, i8* %0, i64 %6832
  call void @llvm.memset.p0i8.i64(i8* align 1 %6833, i8 0, i64 16, i1 false)
  br label %6834

6834:                                             ; preds = %6831, %6823
  %6835 = add nuw nsw i64 %6824, 1
  %6836 = call zeroext i8 @randombit()
  %6837 = getelementptr inbounds i8, i8* %1, i64 %6835
  store i8 %6836, i8* %6837, align 1
  %6838 = getelementptr inbounds i8, i8* %1, i64 %6835
  %6839 = load i8, i8* %6838, align 1
  %6840 = zext i8 %6839 to i32
  %6841 = icmp eq i32 %6840, 0
  br i1 %6841, label %6842, label %6845

6842:                                             ; preds = %6834
  %6843 = mul nuw nsw i64 %6835, 16
  %6844 = getelementptr inbounds i8, i8* %0, i64 %6843
  call void @llvm.memset.p0i8.i64(i8* align 1 %6844, i8 0, i64 16, i1 false)
  br label %6845

6845:                                             ; preds = %6842, %6834
  %6846 = add nuw nsw i64 %6835, 1
  %6847 = call zeroext i8 @randombit()
  %6848 = getelementptr inbounds i8, i8* %1, i64 %6846
  store i8 %6847, i8* %6848, align 1
  %6849 = getelementptr inbounds i8, i8* %1, i64 %6846
  %6850 = load i8, i8* %6849, align 1
  %6851 = zext i8 %6850 to i32
  %6852 = icmp eq i32 %6851, 0
  br i1 %6852, label %6853, label %6856

6853:                                             ; preds = %6845
  %6854 = mul nuw nsw i64 %6846, 16
  %6855 = getelementptr inbounds i8, i8* %0, i64 %6854
  call void @llvm.memset.p0i8.i64(i8* align 1 %6855, i8 0, i64 16, i1 false)
  br label %6856

6856:                                             ; preds = %6853, %6845
  %6857 = add nuw nsw i64 %6846, 1
  %6858 = call zeroext i8 @randombit()
  %6859 = getelementptr inbounds i8, i8* %1, i64 %6857
  store i8 %6858, i8* %6859, align 1
  %6860 = getelementptr inbounds i8, i8* %1, i64 %6857
  %6861 = load i8, i8* %6860, align 1
  %6862 = zext i8 %6861 to i32
  %6863 = icmp eq i32 %6862, 0
  br i1 %6863, label %6864, label %6867

6864:                                             ; preds = %6856
  %6865 = mul nuw nsw i64 %6857, 16
  %6866 = getelementptr inbounds i8, i8* %0, i64 %6865
  call void @llvm.memset.p0i8.i64(i8* align 1 %6866, i8 0, i64 16, i1 false)
  br label %6867

6867:                                             ; preds = %6864, %6856
  %6868 = add nuw nsw i64 %6857, 1
  %6869 = call zeroext i8 @randombit()
  %6870 = getelementptr inbounds i8, i8* %1, i64 %6868
  store i8 %6869, i8* %6870, align 1
  %6871 = getelementptr inbounds i8, i8* %1, i64 %6868
  %6872 = load i8, i8* %6871, align 1
  %6873 = zext i8 %6872 to i32
  %6874 = icmp eq i32 %6873, 0
  br i1 %6874, label %6875, label %6878

6875:                                             ; preds = %6867
  %6876 = mul nuw nsw i64 %6868, 16
  %6877 = getelementptr inbounds i8, i8* %0, i64 %6876
  call void @llvm.memset.p0i8.i64(i8* align 1 %6877, i8 0, i64 16, i1 false)
  br label %6878

6878:                                             ; preds = %6875, %6867
  %6879 = add nuw nsw i64 %6868, 1
  %6880 = call zeroext i8 @randombit()
  %6881 = getelementptr inbounds i8, i8* %1, i64 %6879
  store i8 %6880, i8* %6881, align 1
  %6882 = getelementptr inbounds i8, i8* %1, i64 %6879
  %6883 = load i8, i8* %6882, align 1
  %6884 = zext i8 %6883 to i32
  %6885 = icmp eq i32 %6884, 0
  br i1 %6885, label %6886, label %6889

6886:                                             ; preds = %6878
  %6887 = mul nuw nsw i64 %6879, 16
  %6888 = getelementptr inbounds i8, i8* %0, i64 %6887
  call void @llvm.memset.p0i8.i64(i8* align 1 %6888, i8 0, i64 16, i1 false)
  br label %6889

6889:                                             ; preds = %6886, %6878
  %6890 = add nuw nsw i64 %6879, 1
  %6891 = call zeroext i8 @randombit()
  %6892 = getelementptr inbounds i8, i8* %1, i64 %6890
  store i8 %6891, i8* %6892, align 1
  %6893 = getelementptr inbounds i8, i8* %1, i64 %6890
  %6894 = load i8, i8* %6893, align 1
  %6895 = zext i8 %6894 to i32
  %6896 = icmp eq i32 %6895, 0
  br i1 %6896, label %6897, label %6900

6897:                                             ; preds = %6889
  %6898 = mul nuw nsw i64 %6890, 16
  %6899 = getelementptr inbounds i8, i8* %0, i64 %6898
  call void @llvm.memset.p0i8.i64(i8* align 1 %6899, i8 0, i64 16, i1 false)
  br label %6900

6900:                                             ; preds = %6897, %6889
  %6901 = add nuw nsw i64 %6890, 1
  %6902 = call zeroext i8 @randombit()
  %6903 = getelementptr inbounds i8, i8* %1, i64 %6901
  store i8 %6902, i8* %6903, align 1
  %6904 = getelementptr inbounds i8, i8* %1, i64 %6901
  %6905 = load i8, i8* %6904, align 1
  %6906 = zext i8 %6905 to i32
  %6907 = icmp eq i32 %6906, 0
  br i1 %6907, label %6908, label %6911

6908:                                             ; preds = %6900
  %6909 = mul nuw nsw i64 %6901, 16
  %6910 = getelementptr inbounds i8, i8* %0, i64 %6909
  call void @llvm.memset.p0i8.i64(i8* align 1 %6910, i8 0, i64 16, i1 false)
  br label %6911

6911:                                             ; preds = %6908, %6900
  %6912 = add nuw nsw i64 %6901, 1
  %6913 = call zeroext i8 @randombit()
  %6914 = getelementptr inbounds i8, i8* %1, i64 %6912
  store i8 %6913, i8* %6914, align 1
  %6915 = getelementptr inbounds i8, i8* %1, i64 %6912
  %6916 = load i8, i8* %6915, align 1
  %6917 = zext i8 %6916 to i32
  %6918 = icmp eq i32 %6917, 0
  br i1 %6918, label %6919, label %6922

6919:                                             ; preds = %6911
  %6920 = mul nuw nsw i64 %6912, 16
  %6921 = getelementptr inbounds i8, i8* %0, i64 %6920
  call void @llvm.memset.p0i8.i64(i8* align 1 %6921, i8 0, i64 16, i1 false)
  br label %6922

6922:                                             ; preds = %6919, %6911
  %6923 = add nuw nsw i64 %6912, 1
  %6924 = call zeroext i8 @randombit()
  %6925 = getelementptr inbounds i8, i8* %1, i64 %6923
  store i8 %6924, i8* %6925, align 1
  %6926 = getelementptr inbounds i8, i8* %1, i64 %6923
  %6927 = load i8, i8* %6926, align 1
  %6928 = zext i8 %6927 to i32
  %6929 = icmp eq i32 %6928, 0
  br i1 %6929, label %6930, label %6933

6930:                                             ; preds = %6922
  %6931 = mul nuw nsw i64 %6923, 16
  %6932 = getelementptr inbounds i8, i8* %0, i64 %6931
  call void @llvm.memset.p0i8.i64(i8* align 1 %6932, i8 0, i64 16, i1 false)
  br label %6933

6933:                                             ; preds = %6930, %6922
  %6934 = add nuw nsw i64 %6923, 1
  %6935 = call zeroext i8 @randombit()
  %6936 = getelementptr inbounds i8, i8* %1, i64 %6934
  store i8 %6935, i8* %6936, align 1
  %6937 = getelementptr inbounds i8, i8* %1, i64 %6934
  %6938 = load i8, i8* %6937, align 1
  %6939 = zext i8 %6938 to i32
  %6940 = icmp eq i32 %6939, 0
  br i1 %6940, label %6941, label %6944

6941:                                             ; preds = %6933
  %6942 = mul nuw nsw i64 %6934, 16
  %6943 = getelementptr inbounds i8, i8* %0, i64 %6942
  call void @llvm.memset.p0i8.i64(i8* align 1 %6943, i8 0, i64 16, i1 false)
  br label %6944

6944:                                             ; preds = %6941, %6933
  %6945 = add nuw nsw i64 %6934, 1
  %6946 = call zeroext i8 @randombit()
  %6947 = getelementptr inbounds i8, i8* %1, i64 %6945
  store i8 %6946, i8* %6947, align 1
  %6948 = getelementptr inbounds i8, i8* %1, i64 %6945
  %6949 = load i8, i8* %6948, align 1
  %6950 = zext i8 %6949 to i32
  %6951 = icmp eq i32 %6950, 0
  br i1 %6951, label %6952, label %6955

6952:                                             ; preds = %6944
  %6953 = mul nuw nsw i64 %6945, 16
  %6954 = getelementptr inbounds i8, i8* %0, i64 %6953
  call void @llvm.memset.p0i8.i64(i8* align 1 %6954, i8 0, i64 16, i1 false)
  br label %6955

6955:                                             ; preds = %6952, %6944
  %6956 = add nuw nsw i64 %6945, 1
  %6957 = call zeroext i8 @randombit()
  %6958 = getelementptr inbounds i8, i8* %1, i64 %6956
  store i8 %6957, i8* %6958, align 1
  %6959 = getelementptr inbounds i8, i8* %1, i64 %6956
  %6960 = load i8, i8* %6959, align 1
  %6961 = zext i8 %6960 to i32
  %6962 = icmp eq i32 %6961, 0
  br i1 %6962, label %6963, label %6966

6963:                                             ; preds = %6955
  %6964 = mul nuw nsw i64 %6956, 16
  %6965 = getelementptr inbounds i8, i8* %0, i64 %6964
  call void @llvm.memset.p0i8.i64(i8* align 1 %6965, i8 0, i64 16, i1 false)
  br label %6966

6966:                                             ; preds = %6963, %6955
  %6967 = add nuw nsw i64 %6956, 1
  %6968 = call zeroext i8 @randombit()
  %6969 = getelementptr inbounds i8, i8* %1, i64 %6967
  store i8 %6968, i8* %6969, align 1
  %6970 = getelementptr inbounds i8, i8* %1, i64 %6967
  %6971 = load i8, i8* %6970, align 1
  %6972 = zext i8 %6971 to i32
  %6973 = icmp eq i32 %6972, 0
  br i1 %6973, label %6974, label %6977

6974:                                             ; preds = %6966
  %6975 = mul nuw nsw i64 %6967, 16
  %6976 = getelementptr inbounds i8, i8* %0, i64 %6975
  call void @llvm.memset.p0i8.i64(i8* align 1 %6976, i8 0, i64 16, i1 false)
  br label %6977

6977:                                             ; preds = %6974, %6966
  %6978 = add nuw nsw i64 %6967, 1
  %6979 = call zeroext i8 @randombit()
  %6980 = getelementptr inbounds i8, i8* %1, i64 %6978
  store i8 %6979, i8* %6980, align 1
  %6981 = getelementptr inbounds i8, i8* %1, i64 %6978
  %6982 = load i8, i8* %6981, align 1
  %6983 = zext i8 %6982 to i32
  %6984 = icmp eq i32 %6983, 0
  br i1 %6984, label %6985, label %6988

6985:                                             ; preds = %6977
  %6986 = mul nuw nsw i64 %6978, 16
  %6987 = getelementptr inbounds i8, i8* %0, i64 %6986
  call void @llvm.memset.p0i8.i64(i8* align 1 %6987, i8 0, i64 16, i1 false)
  br label %6988

6988:                                             ; preds = %6985, %6977
  %6989 = add nuw nsw i64 %6978, 1
  %6990 = call zeroext i8 @randombit()
  %6991 = getelementptr inbounds i8, i8* %1, i64 %6989
  store i8 %6990, i8* %6991, align 1
  %6992 = getelementptr inbounds i8, i8* %1, i64 %6989
  %6993 = load i8, i8* %6992, align 1
  %6994 = zext i8 %6993 to i32
  %6995 = icmp eq i32 %6994, 0
  br i1 %6995, label %6996, label %6999

6996:                                             ; preds = %6988
  %6997 = mul nuw nsw i64 %6989, 16
  %6998 = getelementptr inbounds i8, i8* %0, i64 %6997
  call void @llvm.memset.p0i8.i64(i8* align 1 %6998, i8 0, i64 16, i1 false)
  br label %6999

6999:                                             ; preds = %6996, %6988
  %7000 = add nuw nsw i64 %6989, 1
  %7001 = call zeroext i8 @randombit()
  %7002 = getelementptr inbounds i8, i8* %1, i64 %7000
  store i8 %7001, i8* %7002, align 1
  %7003 = getelementptr inbounds i8, i8* %1, i64 %7000
  %7004 = load i8, i8* %7003, align 1
  %7005 = zext i8 %7004 to i32
  %7006 = icmp eq i32 %7005, 0
  br i1 %7006, label %7007, label %7010

7007:                                             ; preds = %6999
  %7008 = mul nuw nsw i64 %7000, 16
  %7009 = getelementptr inbounds i8, i8* %0, i64 %7008
  call void @llvm.memset.p0i8.i64(i8* align 1 %7009, i8 0, i64 16, i1 false)
  br label %7010

7010:                                             ; preds = %7007, %6999
  %7011 = add nuw nsw i64 %7000, 1
  %7012 = call zeroext i8 @randombit()
  %7013 = getelementptr inbounds i8, i8* %1, i64 %7011
  store i8 %7012, i8* %7013, align 1
  %7014 = getelementptr inbounds i8, i8* %1, i64 %7011
  %7015 = load i8, i8* %7014, align 1
  %7016 = zext i8 %7015 to i32
  %7017 = icmp eq i32 %7016, 0
  br i1 %7017, label %7018, label %7021

7018:                                             ; preds = %7010
  %7019 = mul nuw nsw i64 %7011, 16
  %7020 = getelementptr inbounds i8, i8* %0, i64 %7019
  call void @llvm.memset.p0i8.i64(i8* align 1 %7020, i8 0, i64 16, i1 false)
  br label %7021

7021:                                             ; preds = %7018, %7010
  %7022 = add nuw nsw i64 %7011, 1
  %7023 = call zeroext i8 @randombit()
  %7024 = getelementptr inbounds i8, i8* %1, i64 %7022
  store i8 %7023, i8* %7024, align 1
  %7025 = getelementptr inbounds i8, i8* %1, i64 %7022
  %7026 = load i8, i8* %7025, align 1
  %7027 = zext i8 %7026 to i32
  %7028 = icmp eq i32 %7027, 0
  br i1 %7028, label %7029, label %7032

7029:                                             ; preds = %7021
  %7030 = mul nuw nsw i64 %7022, 16
  %7031 = getelementptr inbounds i8, i8* %0, i64 %7030
  call void @llvm.memset.p0i8.i64(i8* align 1 %7031, i8 0, i64 16, i1 false)
  br label %7032

7032:                                             ; preds = %7029, %7021
  %7033 = add nuw nsw i64 %7022, 1
  %7034 = call zeroext i8 @randombit()
  %7035 = getelementptr inbounds i8, i8* %1, i64 %7033
  store i8 %7034, i8* %7035, align 1
  %7036 = getelementptr inbounds i8, i8* %1, i64 %7033
  %7037 = load i8, i8* %7036, align 1
  %7038 = zext i8 %7037 to i32
  %7039 = icmp eq i32 %7038, 0
  br i1 %7039, label %7040, label %7043

7040:                                             ; preds = %7032
  %7041 = mul nuw nsw i64 %7033, 16
  %7042 = getelementptr inbounds i8, i8* %0, i64 %7041
  call void @llvm.memset.p0i8.i64(i8* align 1 %7042, i8 0, i64 16, i1 false)
  br label %7043

7043:                                             ; preds = %7040, %7032
  %7044 = add nuw nsw i64 %7033, 1
  %7045 = call zeroext i8 @randombit()
  %7046 = getelementptr inbounds i8, i8* %1, i64 %7044
  store i8 %7045, i8* %7046, align 1
  %7047 = getelementptr inbounds i8, i8* %1, i64 %7044
  %7048 = load i8, i8* %7047, align 1
  %7049 = zext i8 %7048 to i32
  %7050 = icmp eq i32 %7049, 0
  br i1 %7050, label %7051, label %7054

7051:                                             ; preds = %7043
  %7052 = mul nuw nsw i64 %7044, 16
  %7053 = getelementptr inbounds i8, i8* %0, i64 %7052
  call void @llvm.memset.p0i8.i64(i8* align 1 %7053, i8 0, i64 16, i1 false)
  br label %7054

7054:                                             ; preds = %7051, %7043
  %7055 = add nuw nsw i64 %7044, 1
  %7056 = call zeroext i8 @randombit()
  %7057 = getelementptr inbounds i8, i8* %1, i64 %7055
  store i8 %7056, i8* %7057, align 1
  %7058 = getelementptr inbounds i8, i8* %1, i64 %7055
  %7059 = load i8, i8* %7058, align 1
  %7060 = zext i8 %7059 to i32
  %7061 = icmp eq i32 %7060, 0
  br i1 %7061, label %7062, label %7065

7062:                                             ; preds = %7054
  %7063 = mul nuw nsw i64 %7055, 16
  %7064 = getelementptr inbounds i8, i8* %0, i64 %7063
  call void @llvm.memset.p0i8.i64(i8* align 1 %7064, i8 0, i64 16, i1 false)
  br label %7065

7065:                                             ; preds = %7062, %7054
  %7066 = add nuw nsw i64 %7055, 1
  %7067 = call zeroext i8 @randombit()
  %7068 = getelementptr inbounds i8, i8* %1, i64 %7066
  store i8 %7067, i8* %7068, align 1
  %7069 = getelementptr inbounds i8, i8* %1, i64 %7066
  %7070 = load i8, i8* %7069, align 1
  %7071 = zext i8 %7070 to i32
  %7072 = icmp eq i32 %7071, 0
  br i1 %7072, label %7073, label %7076

7073:                                             ; preds = %7065
  %7074 = mul nuw nsw i64 %7066, 16
  %7075 = getelementptr inbounds i8, i8* %0, i64 %7074
  call void @llvm.memset.p0i8.i64(i8* align 1 %7075, i8 0, i64 16, i1 false)
  br label %7076

7076:                                             ; preds = %7073, %7065
  %7077 = add nuw nsw i64 %7066, 1
  %7078 = call zeroext i8 @randombit()
  %7079 = getelementptr inbounds i8, i8* %1, i64 %7077
  store i8 %7078, i8* %7079, align 1
  %7080 = getelementptr inbounds i8, i8* %1, i64 %7077
  %7081 = load i8, i8* %7080, align 1
  %7082 = zext i8 %7081 to i32
  %7083 = icmp eq i32 %7082, 0
  br i1 %7083, label %7084, label %7087

7084:                                             ; preds = %7076
  %7085 = mul nuw nsw i64 %7077, 16
  %7086 = getelementptr inbounds i8, i8* %0, i64 %7085
  call void @llvm.memset.p0i8.i64(i8* align 1 %7086, i8 0, i64 16, i1 false)
  br label %7087

7087:                                             ; preds = %7084, %7076
  %7088 = add nuw nsw i64 %7077, 1
  %7089 = call zeroext i8 @randombit()
  %7090 = getelementptr inbounds i8, i8* %1, i64 %7088
  store i8 %7089, i8* %7090, align 1
  %7091 = getelementptr inbounds i8, i8* %1, i64 %7088
  %7092 = load i8, i8* %7091, align 1
  %7093 = zext i8 %7092 to i32
  %7094 = icmp eq i32 %7093, 0
  br i1 %7094, label %7095, label %7098

7095:                                             ; preds = %7087
  %7096 = mul nuw nsw i64 %7088, 16
  %7097 = getelementptr inbounds i8, i8* %0, i64 %7096
  call void @llvm.memset.p0i8.i64(i8* align 1 %7097, i8 0, i64 16, i1 false)
  br label %7098

7098:                                             ; preds = %7095, %7087
  %7099 = add nuw nsw i64 %7088, 1
  %7100 = call zeroext i8 @randombit()
  %7101 = getelementptr inbounds i8, i8* %1, i64 %7099
  store i8 %7100, i8* %7101, align 1
  %7102 = getelementptr inbounds i8, i8* %1, i64 %7099
  %7103 = load i8, i8* %7102, align 1
  %7104 = zext i8 %7103 to i32
  %7105 = icmp eq i32 %7104, 0
  br i1 %7105, label %7106, label %7109

7106:                                             ; preds = %7098
  %7107 = mul nuw nsw i64 %7099, 16
  %7108 = getelementptr inbounds i8, i8* %0, i64 %7107
  call void @llvm.memset.p0i8.i64(i8* align 1 %7108, i8 0, i64 16, i1 false)
  br label %7109

7109:                                             ; preds = %7106, %7098
  %7110 = add nuw nsw i64 %7099, 1
  %7111 = call zeroext i8 @randombit()
  %7112 = getelementptr inbounds i8, i8* %1, i64 %7110
  store i8 %7111, i8* %7112, align 1
  %7113 = getelementptr inbounds i8, i8* %1, i64 %7110
  %7114 = load i8, i8* %7113, align 1
  %7115 = zext i8 %7114 to i32
  %7116 = icmp eq i32 %7115, 0
  br i1 %7116, label %7117, label %7120

7117:                                             ; preds = %7109
  %7118 = mul nuw nsw i64 %7110, 16
  %7119 = getelementptr inbounds i8, i8* %0, i64 %7118
  call void @llvm.memset.p0i8.i64(i8* align 1 %7119, i8 0, i64 16, i1 false)
  br label %7120

7120:                                             ; preds = %7117, %7109
  %7121 = add nuw nsw i64 %7110, 1
  %7122 = call zeroext i8 @randombit()
  %7123 = getelementptr inbounds i8, i8* %1, i64 %7121
  store i8 %7122, i8* %7123, align 1
  %7124 = getelementptr inbounds i8, i8* %1, i64 %7121
  %7125 = load i8, i8* %7124, align 1
  %7126 = zext i8 %7125 to i32
  %7127 = icmp eq i32 %7126, 0
  br i1 %7127, label %7128, label %7131

7128:                                             ; preds = %7120
  %7129 = mul nuw nsw i64 %7121, 16
  %7130 = getelementptr inbounds i8, i8* %0, i64 %7129
  call void @llvm.memset.p0i8.i64(i8* align 1 %7130, i8 0, i64 16, i1 false)
  br label %7131

7131:                                             ; preds = %7128, %7120
  %7132 = add nuw nsw i64 %7121, 1
  %7133 = call zeroext i8 @randombit()
  %7134 = getelementptr inbounds i8, i8* %1, i64 %7132
  store i8 %7133, i8* %7134, align 1
  %7135 = getelementptr inbounds i8, i8* %1, i64 %7132
  %7136 = load i8, i8* %7135, align 1
  %7137 = zext i8 %7136 to i32
  %7138 = icmp eq i32 %7137, 0
  br i1 %7138, label %7139, label %7142

7139:                                             ; preds = %7131
  %7140 = mul nuw nsw i64 %7132, 16
  %7141 = getelementptr inbounds i8, i8* %0, i64 %7140
  call void @llvm.memset.p0i8.i64(i8* align 1 %7141, i8 0, i64 16, i1 false)
  br label %7142

7142:                                             ; preds = %7139, %7131
  %7143 = add nuw nsw i64 %7132, 1
  %7144 = call zeroext i8 @randombit()
  %7145 = getelementptr inbounds i8, i8* %1, i64 %7143
  store i8 %7144, i8* %7145, align 1
  %7146 = getelementptr inbounds i8, i8* %1, i64 %7143
  %7147 = load i8, i8* %7146, align 1
  %7148 = zext i8 %7147 to i32
  %7149 = icmp eq i32 %7148, 0
  br i1 %7149, label %7150, label %7153

7150:                                             ; preds = %7142
  %7151 = mul nuw nsw i64 %7143, 16
  %7152 = getelementptr inbounds i8, i8* %0, i64 %7151
  call void @llvm.memset.p0i8.i64(i8* align 1 %7152, i8 0, i64 16, i1 false)
  br label %7153

7153:                                             ; preds = %7150, %7142
  %7154 = add nuw nsw i64 %7143, 1
  %7155 = call zeroext i8 @randombit()
  %7156 = getelementptr inbounds i8, i8* %1, i64 %7154
  store i8 %7155, i8* %7156, align 1
  %7157 = getelementptr inbounds i8, i8* %1, i64 %7154
  %7158 = load i8, i8* %7157, align 1
  %7159 = zext i8 %7158 to i32
  %7160 = icmp eq i32 %7159, 0
  br i1 %7160, label %7161, label %7164

7161:                                             ; preds = %7153
  %7162 = mul nuw nsw i64 %7154, 16
  %7163 = getelementptr inbounds i8, i8* %0, i64 %7162
  call void @llvm.memset.p0i8.i64(i8* align 1 %7163, i8 0, i64 16, i1 false)
  br label %7164

7164:                                             ; preds = %7161, %7153
  %7165 = add nuw nsw i64 %7154, 1
  %7166 = call zeroext i8 @randombit()
  %7167 = getelementptr inbounds i8, i8* %1, i64 %7165
  store i8 %7166, i8* %7167, align 1
  %7168 = getelementptr inbounds i8, i8* %1, i64 %7165
  %7169 = load i8, i8* %7168, align 1
  %7170 = zext i8 %7169 to i32
  %7171 = icmp eq i32 %7170, 0
  br i1 %7171, label %7172, label %7175

7172:                                             ; preds = %7164
  %7173 = mul nuw nsw i64 %7165, 16
  %7174 = getelementptr inbounds i8, i8* %0, i64 %7173
  call void @llvm.memset.p0i8.i64(i8* align 1 %7174, i8 0, i64 16, i1 false)
  br label %7175

7175:                                             ; preds = %7172, %7164
  %7176 = add nuw nsw i64 %7165, 1
  %7177 = call zeroext i8 @randombit()
  %7178 = getelementptr inbounds i8, i8* %1, i64 %7176
  store i8 %7177, i8* %7178, align 1
  %7179 = getelementptr inbounds i8, i8* %1, i64 %7176
  %7180 = load i8, i8* %7179, align 1
  %7181 = zext i8 %7180 to i32
  %7182 = icmp eq i32 %7181, 0
  br i1 %7182, label %7183, label %7186

7183:                                             ; preds = %7175
  %7184 = mul nuw nsw i64 %7176, 16
  %7185 = getelementptr inbounds i8, i8* %0, i64 %7184
  call void @llvm.memset.p0i8.i64(i8* align 1 %7185, i8 0, i64 16, i1 false)
  br label %7186

7186:                                             ; preds = %7183, %7175
  %7187 = add nuw nsw i64 %7176, 1
  %7188 = call zeroext i8 @randombit()
  %7189 = getelementptr inbounds i8, i8* %1, i64 %7187
  store i8 %7188, i8* %7189, align 1
  %7190 = getelementptr inbounds i8, i8* %1, i64 %7187
  %7191 = load i8, i8* %7190, align 1
  %7192 = zext i8 %7191 to i32
  %7193 = icmp eq i32 %7192, 0
  br i1 %7193, label %7194, label %7197

7194:                                             ; preds = %7186
  %7195 = mul nuw nsw i64 %7187, 16
  %7196 = getelementptr inbounds i8, i8* %0, i64 %7195
  call void @llvm.memset.p0i8.i64(i8* align 1 %7196, i8 0, i64 16, i1 false)
  br label %7197

7197:                                             ; preds = %7194, %7186
  %7198 = add nuw nsw i64 %7187, 1
  %7199 = call zeroext i8 @randombit()
  %7200 = getelementptr inbounds i8, i8* %1, i64 %7198
  store i8 %7199, i8* %7200, align 1
  %7201 = getelementptr inbounds i8, i8* %1, i64 %7198
  %7202 = load i8, i8* %7201, align 1
  %7203 = zext i8 %7202 to i32
  %7204 = icmp eq i32 %7203, 0
  br i1 %7204, label %7205, label %7208

7205:                                             ; preds = %7197
  %7206 = mul nuw nsw i64 %7198, 16
  %7207 = getelementptr inbounds i8, i8* %0, i64 %7206
  call void @llvm.memset.p0i8.i64(i8* align 1 %7207, i8 0, i64 16, i1 false)
  br label %7208

7208:                                             ; preds = %7205, %7197
  %7209 = add nuw nsw i64 %7198, 1
  %7210 = call zeroext i8 @randombit()
  %7211 = getelementptr inbounds i8, i8* %1, i64 %7209
  store i8 %7210, i8* %7211, align 1
  %7212 = getelementptr inbounds i8, i8* %1, i64 %7209
  %7213 = load i8, i8* %7212, align 1
  %7214 = zext i8 %7213 to i32
  %7215 = icmp eq i32 %7214, 0
  br i1 %7215, label %7216, label %7219

7216:                                             ; preds = %7208
  %7217 = mul nuw nsw i64 %7209, 16
  %7218 = getelementptr inbounds i8, i8* %0, i64 %7217
  call void @llvm.memset.p0i8.i64(i8* align 1 %7218, i8 0, i64 16, i1 false)
  br label %7219

7219:                                             ; preds = %7216, %7208
  %7220 = add nuw nsw i64 %7209, 1
  %7221 = call zeroext i8 @randombit()
  %7222 = getelementptr inbounds i8, i8* %1, i64 %7220
  store i8 %7221, i8* %7222, align 1
  %7223 = getelementptr inbounds i8, i8* %1, i64 %7220
  %7224 = load i8, i8* %7223, align 1
  %7225 = zext i8 %7224 to i32
  %7226 = icmp eq i32 %7225, 0
  br i1 %7226, label %7227, label %7230

7227:                                             ; preds = %7219
  %7228 = mul nuw nsw i64 %7220, 16
  %7229 = getelementptr inbounds i8, i8* %0, i64 %7228
  call void @llvm.memset.p0i8.i64(i8* align 1 %7229, i8 0, i64 16, i1 false)
  br label %7230

7230:                                             ; preds = %7227, %7219
  %7231 = add nuw nsw i64 %7220, 1
  %7232 = call zeroext i8 @randombit()
  %7233 = getelementptr inbounds i8, i8* %1, i64 %7231
  store i8 %7232, i8* %7233, align 1
  %7234 = getelementptr inbounds i8, i8* %1, i64 %7231
  %7235 = load i8, i8* %7234, align 1
  %7236 = zext i8 %7235 to i32
  %7237 = icmp eq i32 %7236, 0
  br i1 %7237, label %7238, label %7241

7238:                                             ; preds = %7230
  %7239 = mul nuw nsw i64 %7231, 16
  %7240 = getelementptr inbounds i8, i8* %0, i64 %7239
  call void @llvm.memset.p0i8.i64(i8* align 1 %7240, i8 0, i64 16, i1 false)
  br label %7241

7241:                                             ; preds = %7238, %7230
  %7242 = add nuw nsw i64 %7231, 1
  %7243 = call zeroext i8 @randombit()
  %7244 = getelementptr inbounds i8, i8* %1, i64 %7242
  store i8 %7243, i8* %7244, align 1
  %7245 = getelementptr inbounds i8, i8* %1, i64 %7242
  %7246 = load i8, i8* %7245, align 1
  %7247 = zext i8 %7246 to i32
  %7248 = icmp eq i32 %7247, 0
  br i1 %7248, label %7249, label %7252

7249:                                             ; preds = %7241
  %7250 = mul nuw nsw i64 %7242, 16
  %7251 = getelementptr inbounds i8, i8* %0, i64 %7250
  call void @llvm.memset.p0i8.i64(i8* align 1 %7251, i8 0, i64 16, i1 false)
  br label %7252

7252:                                             ; preds = %7249, %7241
  %7253 = add nuw nsw i64 %7242, 1
  %7254 = call zeroext i8 @randombit()
  %7255 = getelementptr inbounds i8, i8* %1, i64 %7253
  store i8 %7254, i8* %7255, align 1
  %7256 = getelementptr inbounds i8, i8* %1, i64 %7253
  %7257 = load i8, i8* %7256, align 1
  %7258 = zext i8 %7257 to i32
  %7259 = icmp eq i32 %7258, 0
  br i1 %7259, label %7260, label %7263

7260:                                             ; preds = %7252
  %7261 = mul nuw nsw i64 %7253, 16
  %7262 = getelementptr inbounds i8, i8* %0, i64 %7261
  call void @llvm.memset.p0i8.i64(i8* align 1 %7262, i8 0, i64 16, i1 false)
  br label %7263

7263:                                             ; preds = %7260, %7252
  %7264 = add nuw nsw i64 %7253, 1
  %7265 = call zeroext i8 @randombit()
  %7266 = getelementptr inbounds i8, i8* %1, i64 %7264
  store i8 %7265, i8* %7266, align 1
  %7267 = getelementptr inbounds i8, i8* %1, i64 %7264
  %7268 = load i8, i8* %7267, align 1
  %7269 = zext i8 %7268 to i32
  %7270 = icmp eq i32 %7269, 0
  br i1 %7270, label %7271, label %7274

7271:                                             ; preds = %7263
  %7272 = mul nuw nsw i64 %7264, 16
  %7273 = getelementptr inbounds i8, i8* %0, i64 %7272
  call void @llvm.memset.p0i8.i64(i8* align 1 %7273, i8 0, i64 16, i1 false)
  br label %7274

7274:                                             ; preds = %7271, %7263
  %7275 = add nuw nsw i64 %7264, 1
  %7276 = call zeroext i8 @randombit()
  %7277 = getelementptr inbounds i8, i8* %1, i64 %7275
  store i8 %7276, i8* %7277, align 1
  %7278 = getelementptr inbounds i8, i8* %1, i64 %7275
  %7279 = load i8, i8* %7278, align 1
  %7280 = zext i8 %7279 to i32
  %7281 = icmp eq i32 %7280, 0
  br i1 %7281, label %7282, label %7285

7282:                                             ; preds = %7274
  %7283 = mul nuw nsw i64 %7275, 16
  %7284 = getelementptr inbounds i8, i8* %0, i64 %7283
  call void @llvm.memset.p0i8.i64(i8* align 1 %7284, i8 0, i64 16, i1 false)
  br label %7285

7285:                                             ; preds = %7282, %7274
  %7286 = add nuw nsw i64 %7275, 1
  %7287 = call zeroext i8 @randombit()
  %7288 = getelementptr inbounds i8, i8* %1, i64 %7286
  store i8 %7287, i8* %7288, align 1
  %7289 = getelementptr inbounds i8, i8* %1, i64 %7286
  %7290 = load i8, i8* %7289, align 1
  %7291 = zext i8 %7290 to i32
  %7292 = icmp eq i32 %7291, 0
  br i1 %7292, label %7293, label %7296

7293:                                             ; preds = %7285
  %7294 = mul nuw nsw i64 %7286, 16
  %7295 = getelementptr inbounds i8, i8* %0, i64 %7294
  call void @llvm.memset.p0i8.i64(i8* align 1 %7295, i8 0, i64 16, i1 false)
  br label %7296

7296:                                             ; preds = %7293, %7285
  %7297 = add nuw nsw i64 %7286, 1
  %7298 = call zeroext i8 @randombit()
  %7299 = getelementptr inbounds i8, i8* %1, i64 %7297
  store i8 %7298, i8* %7299, align 1
  %7300 = getelementptr inbounds i8, i8* %1, i64 %7297
  %7301 = load i8, i8* %7300, align 1
  %7302 = zext i8 %7301 to i32
  %7303 = icmp eq i32 %7302, 0
  br i1 %7303, label %7304, label %7307

7304:                                             ; preds = %7296
  %7305 = mul nuw nsw i64 %7297, 16
  %7306 = getelementptr inbounds i8, i8* %0, i64 %7305
  call void @llvm.memset.p0i8.i64(i8* align 1 %7306, i8 0, i64 16, i1 false)
  br label %7307

7307:                                             ; preds = %7304, %7296
  %7308 = add nuw nsw i64 %7297, 1
  %7309 = call zeroext i8 @randombit()
  %7310 = getelementptr inbounds i8, i8* %1, i64 %7308
  store i8 %7309, i8* %7310, align 1
  %7311 = getelementptr inbounds i8, i8* %1, i64 %7308
  %7312 = load i8, i8* %7311, align 1
  %7313 = zext i8 %7312 to i32
  %7314 = icmp eq i32 %7313, 0
  br i1 %7314, label %7315, label %7318

7315:                                             ; preds = %7307
  %7316 = mul nuw nsw i64 %7308, 16
  %7317 = getelementptr inbounds i8, i8* %0, i64 %7316
  call void @llvm.memset.p0i8.i64(i8* align 1 %7317, i8 0, i64 16, i1 false)
  br label %7318

7318:                                             ; preds = %7315, %7307
  %7319 = add nuw nsw i64 %7308, 1
  %7320 = call zeroext i8 @randombit()
  %7321 = getelementptr inbounds i8, i8* %1, i64 %7319
  store i8 %7320, i8* %7321, align 1
  %7322 = getelementptr inbounds i8, i8* %1, i64 %7319
  %7323 = load i8, i8* %7322, align 1
  %7324 = zext i8 %7323 to i32
  %7325 = icmp eq i32 %7324, 0
  br i1 %7325, label %7326, label %7329

7326:                                             ; preds = %7318
  %7327 = mul nuw nsw i64 %7319, 16
  %7328 = getelementptr inbounds i8, i8* %0, i64 %7327
  call void @llvm.memset.p0i8.i64(i8* align 1 %7328, i8 0, i64 16, i1 false)
  br label %7329

7329:                                             ; preds = %7326, %7318
  %7330 = add nuw nsw i64 %7319, 1
  %7331 = call zeroext i8 @randombit()
  %7332 = getelementptr inbounds i8, i8* %1, i64 %7330
  store i8 %7331, i8* %7332, align 1
  %7333 = getelementptr inbounds i8, i8* %1, i64 %7330
  %7334 = load i8, i8* %7333, align 1
  %7335 = zext i8 %7334 to i32
  %7336 = icmp eq i32 %7335, 0
  br i1 %7336, label %7337, label %7340

7337:                                             ; preds = %7329
  %7338 = mul nuw nsw i64 %7330, 16
  %7339 = getelementptr inbounds i8, i8* %0, i64 %7338
  call void @llvm.memset.p0i8.i64(i8* align 1 %7339, i8 0, i64 16, i1 false)
  br label %7340

7340:                                             ; preds = %7337, %7329
  %7341 = add nuw nsw i64 %7330, 1
  %7342 = call zeroext i8 @randombit()
  %7343 = getelementptr inbounds i8, i8* %1, i64 %7341
  store i8 %7342, i8* %7343, align 1
  %7344 = getelementptr inbounds i8, i8* %1, i64 %7341
  %7345 = load i8, i8* %7344, align 1
  %7346 = zext i8 %7345 to i32
  %7347 = icmp eq i32 %7346, 0
  br i1 %7347, label %7348, label %7351

7348:                                             ; preds = %7340
  %7349 = mul nuw nsw i64 %7341, 16
  %7350 = getelementptr inbounds i8, i8* %0, i64 %7349
  call void @llvm.memset.p0i8.i64(i8* align 1 %7350, i8 0, i64 16, i1 false)
  br label %7351

7351:                                             ; preds = %7348, %7340
  %7352 = add nuw nsw i64 %7341, 1
  %7353 = call zeroext i8 @randombit()
  %7354 = getelementptr inbounds i8, i8* %1, i64 %7352
  store i8 %7353, i8* %7354, align 1
  %7355 = getelementptr inbounds i8, i8* %1, i64 %7352
  %7356 = load i8, i8* %7355, align 1
  %7357 = zext i8 %7356 to i32
  %7358 = icmp eq i32 %7357, 0
  br i1 %7358, label %7359, label %7362

7359:                                             ; preds = %7351
  %7360 = mul nuw nsw i64 %7352, 16
  %7361 = getelementptr inbounds i8, i8* %0, i64 %7360
  call void @llvm.memset.p0i8.i64(i8* align 1 %7361, i8 0, i64 16, i1 false)
  br label %7362

7362:                                             ; preds = %7359, %7351
  %7363 = add nuw nsw i64 %7352, 1
  %7364 = call zeroext i8 @randombit()
  %7365 = getelementptr inbounds i8, i8* %1, i64 %7363
  store i8 %7364, i8* %7365, align 1
  %7366 = getelementptr inbounds i8, i8* %1, i64 %7363
  %7367 = load i8, i8* %7366, align 1
  %7368 = zext i8 %7367 to i32
  %7369 = icmp eq i32 %7368, 0
  br i1 %7369, label %7370, label %7373

7370:                                             ; preds = %7362
  %7371 = mul nuw nsw i64 %7363, 16
  %7372 = getelementptr inbounds i8, i8* %0, i64 %7371
  call void @llvm.memset.p0i8.i64(i8* align 1 %7372, i8 0, i64 16, i1 false)
  br label %7373

7373:                                             ; preds = %7370, %7362
  %7374 = add nuw nsw i64 %7363, 1
  %7375 = call zeroext i8 @randombit()
  %7376 = getelementptr inbounds i8, i8* %1, i64 %7374
  store i8 %7375, i8* %7376, align 1
  %7377 = getelementptr inbounds i8, i8* %1, i64 %7374
  %7378 = load i8, i8* %7377, align 1
  %7379 = zext i8 %7378 to i32
  %7380 = icmp eq i32 %7379, 0
  br i1 %7380, label %7381, label %7384

7381:                                             ; preds = %7373
  %7382 = mul nuw nsw i64 %7374, 16
  %7383 = getelementptr inbounds i8, i8* %0, i64 %7382
  call void @llvm.memset.p0i8.i64(i8* align 1 %7383, i8 0, i64 16, i1 false)
  br label %7384

7384:                                             ; preds = %7381, %7373
  %7385 = add nuw nsw i64 %7374, 1
  %7386 = call zeroext i8 @randombit()
  %7387 = getelementptr inbounds i8, i8* %1, i64 %7385
  store i8 %7386, i8* %7387, align 1
  %7388 = getelementptr inbounds i8, i8* %1, i64 %7385
  %7389 = load i8, i8* %7388, align 1
  %7390 = zext i8 %7389 to i32
  %7391 = icmp eq i32 %7390, 0
  br i1 %7391, label %7392, label %7395

7392:                                             ; preds = %7384
  %7393 = mul nuw nsw i64 %7385, 16
  %7394 = getelementptr inbounds i8, i8* %0, i64 %7393
  call void @llvm.memset.p0i8.i64(i8* align 1 %7394, i8 0, i64 16, i1 false)
  br label %7395

7395:                                             ; preds = %7392, %7384
  %7396 = add nuw nsw i64 %7385, 1
  %7397 = call zeroext i8 @randombit()
  %7398 = getelementptr inbounds i8, i8* %1, i64 %7396
  store i8 %7397, i8* %7398, align 1
  %7399 = getelementptr inbounds i8, i8* %1, i64 %7396
  %7400 = load i8, i8* %7399, align 1
  %7401 = zext i8 %7400 to i32
  %7402 = icmp eq i32 %7401, 0
  br i1 %7402, label %7403, label %7406

7403:                                             ; preds = %7395
  %7404 = mul nuw nsw i64 %7396, 16
  %7405 = getelementptr inbounds i8, i8* %0, i64 %7404
  call void @llvm.memset.p0i8.i64(i8* align 1 %7405, i8 0, i64 16, i1 false)
  br label %7406

7406:                                             ; preds = %7403, %7395
  %7407 = add nuw nsw i64 %7396, 1
  %7408 = call zeroext i8 @randombit()
  %7409 = getelementptr inbounds i8, i8* %1, i64 %7407
  store i8 %7408, i8* %7409, align 1
  %7410 = getelementptr inbounds i8, i8* %1, i64 %7407
  %7411 = load i8, i8* %7410, align 1
  %7412 = zext i8 %7411 to i32
  %7413 = icmp eq i32 %7412, 0
  br i1 %7413, label %7414, label %7417

7414:                                             ; preds = %7406
  %7415 = mul nuw nsw i64 %7407, 16
  %7416 = getelementptr inbounds i8, i8* %0, i64 %7415
  call void @llvm.memset.p0i8.i64(i8* align 1 %7416, i8 0, i64 16, i1 false)
  br label %7417

7417:                                             ; preds = %7414, %7406
  %7418 = add nuw nsw i64 %7407, 1
  %7419 = call zeroext i8 @randombit()
  %7420 = getelementptr inbounds i8, i8* %1, i64 %7418
  store i8 %7419, i8* %7420, align 1
  %7421 = getelementptr inbounds i8, i8* %1, i64 %7418
  %7422 = load i8, i8* %7421, align 1
  %7423 = zext i8 %7422 to i32
  %7424 = icmp eq i32 %7423, 0
  br i1 %7424, label %7425, label %7428

7425:                                             ; preds = %7417
  %7426 = mul nuw nsw i64 %7418, 16
  %7427 = getelementptr inbounds i8, i8* %0, i64 %7426
  call void @llvm.memset.p0i8.i64(i8* align 1 %7427, i8 0, i64 16, i1 false)
  br label %7428

7428:                                             ; preds = %7425, %7417
  %7429 = add nuw nsw i64 %7418, 1
  %7430 = call zeroext i8 @randombit()
  %7431 = getelementptr inbounds i8, i8* %1, i64 %7429
  store i8 %7430, i8* %7431, align 1
  %7432 = getelementptr inbounds i8, i8* %1, i64 %7429
  %7433 = load i8, i8* %7432, align 1
  %7434 = zext i8 %7433 to i32
  %7435 = icmp eq i32 %7434, 0
  br i1 %7435, label %7436, label %7439

7436:                                             ; preds = %7428
  %7437 = mul nuw nsw i64 %7429, 16
  %7438 = getelementptr inbounds i8, i8* %0, i64 %7437
  call void @llvm.memset.p0i8.i64(i8* align 1 %7438, i8 0, i64 16, i1 false)
  br label %7439

7439:                                             ; preds = %7436, %7428
  %7440 = add nuw nsw i64 %7429, 1
  %7441 = call zeroext i8 @randombit()
  %7442 = getelementptr inbounds i8, i8* %1, i64 %7440
  store i8 %7441, i8* %7442, align 1
  %7443 = getelementptr inbounds i8, i8* %1, i64 %7440
  %7444 = load i8, i8* %7443, align 1
  %7445 = zext i8 %7444 to i32
  %7446 = icmp eq i32 %7445, 0
  br i1 %7446, label %7447, label %7450

7447:                                             ; preds = %7439
  %7448 = mul nuw nsw i64 %7440, 16
  %7449 = getelementptr inbounds i8, i8* %0, i64 %7448
  call void @llvm.memset.p0i8.i64(i8* align 1 %7449, i8 0, i64 16, i1 false)
  br label %7450

7450:                                             ; preds = %7447, %7439
  %7451 = add nuw nsw i64 %7440, 1
  %7452 = call zeroext i8 @randombit()
  %7453 = getelementptr inbounds i8, i8* %1, i64 %7451
  store i8 %7452, i8* %7453, align 1
  %7454 = getelementptr inbounds i8, i8* %1, i64 %7451
  %7455 = load i8, i8* %7454, align 1
  %7456 = zext i8 %7455 to i32
  %7457 = icmp eq i32 %7456, 0
  br i1 %7457, label %7458, label %7461

7458:                                             ; preds = %7450
  %7459 = mul nuw nsw i64 %7451, 16
  %7460 = getelementptr inbounds i8, i8* %0, i64 %7459
  call void @llvm.memset.p0i8.i64(i8* align 1 %7460, i8 0, i64 16, i1 false)
  br label %7461

7461:                                             ; preds = %7458, %7450
  %7462 = add nuw nsw i64 %7451, 1
  %7463 = call zeroext i8 @randombit()
  %7464 = getelementptr inbounds i8, i8* %1, i64 %7462
  store i8 %7463, i8* %7464, align 1
  %7465 = getelementptr inbounds i8, i8* %1, i64 %7462
  %7466 = load i8, i8* %7465, align 1
  %7467 = zext i8 %7466 to i32
  %7468 = icmp eq i32 %7467, 0
  br i1 %7468, label %7469, label %7472

7469:                                             ; preds = %7461
  %7470 = mul nuw nsw i64 %7462, 16
  %7471 = getelementptr inbounds i8, i8* %0, i64 %7470
  call void @llvm.memset.p0i8.i64(i8* align 1 %7471, i8 0, i64 16, i1 false)
  br label %7472

7472:                                             ; preds = %7469, %7461
  %7473 = add nuw nsw i64 %7462, 1
  %7474 = call zeroext i8 @randombit()
  %7475 = getelementptr inbounds i8, i8* %1, i64 %7473
  store i8 %7474, i8* %7475, align 1
  %7476 = getelementptr inbounds i8, i8* %1, i64 %7473
  %7477 = load i8, i8* %7476, align 1
  %7478 = zext i8 %7477 to i32
  %7479 = icmp eq i32 %7478, 0
  br i1 %7479, label %7480, label %7483

7480:                                             ; preds = %7472
  %7481 = mul nuw nsw i64 %7473, 16
  %7482 = getelementptr inbounds i8, i8* %0, i64 %7481
  call void @llvm.memset.p0i8.i64(i8* align 1 %7482, i8 0, i64 16, i1 false)
  br label %7483

7483:                                             ; preds = %7480, %7472
  %7484 = add nuw nsw i64 %7473, 1
  %7485 = call zeroext i8 @randombit()
  %7486 = getelementptr inbounds i8, i8* %1, i64 %7484
  store i8 %7485, i8* %7486, align 1
  %7487 = getelementptr inbounds i8, i8* %1, i64 %7484
  %7488 = load i8, i8* %7487, align 1
  %7489 = zext i8 %7488 to i32
  %7490 = icmp eq i32 %7489, 0
  br i1 %7490, label %7491, label %7494

7491:                                             ; preds = %7483
  %7492 = mul nuw nsw i64 %7484, 16
  %7493 = getelementptr inbounds i8, i8* %0, i64 %7492
  call void @llvm.memset.p0i8.i64(i8* align 1 %7493, i8 0, i64 16, i1 false)
  br label %7494

7494:                                             ; preds = %7491, %7483
  %7495 = add nuw nsw i64 %7484, 1
  %7496 = call zeroext i8 @randombit()
  %7497 = getelementptr inbounds i8, i8* %1, i64 %7495
  store i8 %7496, i8* %7497, align 1
  %7498 = getelementptr inbounds i8, i8* %1, i64 %7495
  %7499 = load i8, i8* %7498, align 1
  %7500 = zext i8 %7499 to i32
  %7501 = icmp eq i32 %7500, 0
  br i1 %7501, label %7502, label %7505

7502:                                             ; preds = %7494
  %7503 = mul nuw nsw i64 %7495, 16
  %7504 = getelementptr inbounds i8, i8* %0, i64 %7503
  call void @llvm.memset.p0i8.i64(i8* align 1 %7504, i8 0, i64 16, i1 false)
  br label %7505

7505:                                             ; preds = %7502, %7494
  %7506 = add nuw nsw i64 %7495, 1
  %7507 = call zeroext i8 @randombit()
  %7508 = getelementptr inbounds i8, i8* %1, i64 %7506
  store i8 %7507, i8* %7508, align 1
  %7509 = getelementptr inbounds i8, i8* %1, i64 %7506
  %7510 = load i8, i8* %7509, align 1
  %7511 = zext i8 %7510 to i32
  %7512 = icmp eq i32 %7511, 0
  br i1 %7512, label %7513, label %7516

7513:                                             ; preds = %7505
  %7514 = mul nuw nsw i64 %7506, 16
  %7515 = getelementptr inbounds i8, i8* %0, i64 %7514
  call void @llvm.memset.p0i8.i64(i8* align 1 %7515, i8 0, i64 16, i1 false)
  br label %7516

7516:                                             ; preds = %7513, %7505
  %7517 = add nuw nsw i64 %7506, 1
  %7518 = call zeroext i8 @randombit()
  %7519 = getelementptr inbounds i8, i8* %1, i64 %7517
  store i8 %7518, i8* %7519, align 1
  %7520 = getelementptr inbounds i8, i8* %1, i64 %7517
  %7521 = load i8, i8* %7520, align 1
  %7522 = zext i8 %7521 to i32
  %7523 = icmp eq i32 %7522, 0
  br i1 %7523, label %7524, label %7527

7524:                                             ; preds = %7516
  %7525 = mul nuw nsw i64 %7517, 16
  %7526 = getelementptr inbounds i8, i8* %0, i64 %7525
  call void @llvm.memset.p0i8.i64(i8* align 1 %7526, i8 0, i64 16, i1 false)
  br label %7527

7527:                                             ; preds = %7524, %7516
  %7528 = add nuw nsw i64 %7517, 1
  %7529 = call zeroext i8 @randombit()
  %7530 = getelementptr inbounds i8, i8* %1, i64 %7528
  store i8 %7529, i8* %7530, align 1
  %7531 = getelementptr inbounds i8, i8* %1, i64 %7528
  %7532 = load i8, i8* %7531, align 1
  %7533 = zext i8 %7532 to i32
  %7534 = icmp eq i32 %7533, 0
  br i1 %7534, label %7535, label %7538

7535:                                             ; preds = %7527
  %7536 = mul nuw nsw i64 %7528, 16
  %7537 = getelementptr inbounds i8, i8* %0, i64 %7536
  call void @llvm.memset.p0i8.i64(i8* align 1 %7537, i8 0, i64 16, i1 false)
  br label %7538

7538:                                             ; preds = %7535, %7527
  %7539 = add nuw nsw i64 %7528, 1
  %7540 = call zeroext i8 @randombit()
  %7541 = getelementptr inbounds i8, i8* %1, i64 %7539
  store i8 %7540, i8* %7541, align 1
  %7542 = getelementptr inbounds i8, i8* %1, i64 %7539
  %7543 = load i8, i8* %7542, align 1
  %7544 = zext i8 %7543 to i32
  %7545 = icmp eq i32 %7544, 0
  br i1 %7545, label %7546, label %7549

7546:                                             ; preds = %7538
  %7547 = mul nuw nsw i64 %7539, 16
  %7548 = getelementptr inbounds i8, i8* %0, i64 %7547
  call void @llvm.memset.p0i8.i64(i8* align 1 %7548, i8 0, i64 16, i1 false)
  br label %7549

7549:                                             ; preds = %7546, %7538
  %7550 = add nuw nsw i64 %7539, 1
  %7551 = call zeroext i8 @randombit()
  %7552 = getelementptr inbounds i8, i8* %1, i64 %7550
  store i8 %7551, i8* %7552, align 1
  %7553 = getelementptr inbounds i8, i8* %1, i64 %7550
  %7554 = load i8, i8* %7553, align 1
  %7555 = zext i8 %7554 to i32
  %7556 = icmp eq i32 %7555, 0
  br i1 %7556, label %7557, label %7560

7557:                                             ; preds = %7549
  %7558 = mul nuw nsw i64 %7550, 16
  %7559 = getelementptr inbounds i8, i8* %0, i64 %7558
  call void @llvm.memset.p0i8.i64(i8* align 1 %7559, i8 0, i64 16, i1 false)
  br label %7560

7560:                                             ; preds = %7557, %7549
  %7561 = add nuw nsw i64 %7550, 1
  %7562 = call zeroext i8 @randombit()
  %7563 = getelementptr inbounds i8, i8* %1, i64 %7561
  store i8 %7562, i8* %7563, align 1
  %7564 = getelementptr inbounds i8, i8* %1, i64 %7561
  %7565 = load i8, i8* %7564, align 1
  %7566 = zext i8 %7565 to i32
  %7567 = icmp eq i32 %7566, 0
  br i1 %7567, label %7568, label %7571

7568:                                             ; preds = %7560
  %7569 = mul nuw nsw i64 %7561, 16
  %7570 = getelementptr inbounds i8, i8* %0, i64 %7569
  call void @llvm.memset.p0i8.i64(i8* align 1 %7570, i8 0, i64 16, i1 false)
  br label %7571

7571:                                             ; preds = %7568, %7560
  %7572 = add nuw nsw i64 %7561, 1
  %7573 = call zeroext i8 @randombit()
  %7574 = getelementptr inbounds i8, i8* %1, i64 %7572
  store i8 %7573, i8* %7574, align 1
  %7575 = getelementptr inbounds i8, i8* %1, i64 %7572
  %7576 = load i8, i8* %7575, align 1
  %7577 = zext i8 %7576 to i32
  %7578 = icmp eq i32 %7577, 0
  br i1 %7578, label %7579, label %7582

7579:                                             ; preds = %7571
  %7580 = mul nuw nsw i64 %7572, 16
  %7581 = getelementptr inbounds i8, i8* %0, i64 %7580
  call void @llvm.memset.p0i8.i64(i8* align 1 %7581, i8 0, i64 16, i1 false)
  br label %7582

7582:                                             ; preds = %7579, %7571
  %7583 = add nuw nsw i64 %7572, 1
  %7584 = call zeroext i8 @randombit()
  %7585 = getelementptr inbounds i8, i8* %1, i64 %7583
  store i8 %7584, i8* %7585, align 1
  %7586 = getelementptr inbounds i8, i8* %1, i64 %7583
  %7587 = load i8, i8* %7586, align 1
  %7588 = zext i8 %7587 to i32
  %7589 = icmp eq i32 %7588, 0
  br i1 %7589, label %7590, label %7593

7590:                                             ; preds = %7582
  %7591 = mul nuw nsw i64 %7583, 16
  %7592 = getelementptr inbounds i8, i8* %0, i64 %7591
  call void @llvm.memset.p0i8.i64(i8* align 1 %7592, i8 0, i64 16, i1 false)
  br label %7593

7593:                                             ; preds = %7590, %7582
  %7594 = add nuw nsw i64 %7583, 1
  %7595 = call zeroext i8 @randombit()
  %7596 = getelementptr inbounds i8, i8* %1, i64 %7594
  store i8 %7595, i8* %7596, align 1
  %7597 = getelementptr inbounds i8, i8* %1, i64 %7594
  %7598 = load i8, i8* %7597, align 1
  %7599 = zext i8 %7598 to i32
  %7600 = icmp eq i32 %7599, 0
  br i1 %7600, label %7601, label %7604

7601:                                             ; preds = %7593
  %7602 = mul nuw nsw i64 %7594, 16
  %7603 = getelementptr inbounds i8, i8* %0, i64 %7602
  call void @llvm.memset.p0i8.i64(i8* align 1 %7603, i8 0, i64 16, i1 false)
  br label %7604

7604:                                             ; preds = %7601, %7593
  %7605 = add nuw nsw i64 %7594, 1
  %7606 = call zeroext i8 @randombit()
  %7607 = getelementptr inbounds i8, i8* %1, i64 %7605
  store i8 %7606, i8* %7607, align 1
  %7608 = getelementptr inbounds i8, i8* %1, i64 %7605
  %7609 = load i8, i8* %7608, align 1
  %7610 = zext i8 %7609 to i32
  %7611 = icmp eq i32 %7610, 0
  br i1 %7611, label %7612, label %7615

7612:                                             ; preds = %7604
  %7613 = mul nuw nsw i64 %7605, 16
  %7614 = getelementptr inbounds i8, i8* %0, i64 %7613
  call void @llvm.memset.p0i8.i64(i8* align 1 %7614, i8 0, i64 16, i1 false)
  br label %7615

7615:                                             ; preds = %7612, %7604
  %7616 = add nuw nsw i64 %7605, 1
  %7617 = call zeroext i8 @randombit()
  %7618 = getelementptr inbounds i8, i8* %1, i64 %7616
  store i8 %7617, i8* %7618, align 1
  %7619 = getelementptr inbounds i8, i8* %1, i64 %7616
  %7620 = load i8, i8* %7619, align 1
  %7621 = zext i8 %7620 to i32
  %7622 = icmp eq i32 %7621, 0
  br i1 %7622, label %7623, label %7626

7623:                                             ; preds = %7615
  %7624 = mul nuw nsw i64 %7616, 16
  %7625 = getelementptr inbounds i8, i8* %0, i64 %7624
  call void @llvm.memset.p0i8.i64(i8* align 1 %7625, i8 0, i64 16, i1 false)
  br label %7626

7626:                                             ; preds = %7623, %7615
  %7627 = add nuw nsw i64 %7616, 1
  %7628 = call zeroext i8 @randombit()
  %7629 = getelementptr inbounds i8, i8* %1, i64 %7627
  store i8 %7628, i8* %7629, align 1
  %7630 = getelementptr inbounds i8, i8* %1, i64 %7627
  %7631 = load i8, i8* %7630, align 1
  %7632 = zext i8 %7631 to i32
  %7633 = icmp eq i32 %7632, 0
  br i1 %7633, label %7634, label %7637

7634:                                             ; preds = %7626
  %7635 = mul nuw nsw i64 %7627, 16
  %7636 = getelementptr inbounds i8, i8* %0, i64 %7635
  call void @llvm.memset.p0i8.i64(i8* align 1 %7636, i8 0, i64 16, i1 false)
  br label %7637

7637:                                             ; preds = %7634, %7626
  %7638 = add nuw nsw i64 %7627, 1
  %7639 = call zeroext i8 @randombit()
  %7640 = getelementptr inbounds i8, i8* %1, i64 %7638
  store i8 %7639, i8* %7640, align 1
  %7641 = getelementptr inbounds i8, i8* %1, i64 %7638
  %7642 = load i8, i8* %7641, align 1
  %7643 = zext i8 %7642 to i32
  %7644 = icmp eq i32 %7643, 0
  br i1 %7644, label %7645, label %7648

7645:                                             ; preds = %7637
  %7646 = mul nuw nsw i64 %7638, 16
  %7647 = getelementptr inbounds i8, i8* %0, i64 %7646
  call void @llvm.memset.p0i8.i64(i8* align 1 %7647, i8 0, i64 16, i1 false)
  br label %7648

7648:                                             ; preds = %7645, %7637
  %7649 = add nuw nsw i64 %7638, 1
  %7650 = call zeroext i8 @randombit()
  %7651 = getelementptr inbounds i8, i8* %1, i64 %7649
  store i8 %7650, i8* %7651, align 1
  %7652 = getelementptr inbounds i8, i8* %1, i64 %7649
  %7653 = load i8, i8* %7652, align 1
  %7654 = zext i8 %7653 to i32
  %7655 = icmp eq i32 %7654, 0
  br i1 %7655, label %7656, label %7659

7656:                                             ; preds = %7648
  %7657 = mul nuw nsw i64 %7649, 16
  %7658 = getelementptr inbounds i8, i8* %0, i64 %7657
  call void @llvm.memset.p0i8.i64(i8* align 1 %7658, i8 0, i64 16, i1 false)
  br label %7659

7659:                                             ; preds = %7656, %7648
  %7660 = add nuw nsw i64 %7649, 1
  %7661 = call zeroext i8 @randombit()
  %7662 = getelementptr inbounds i8, i8* %1, i64 %7660
  store i8 %7661, i8* %7662, align 1
  %7663 = getelementptr inbounds i8, i8* %1, i64 %7660
  %7664 = load i8, i8* %7663, align 1
  %7665 = zext i8 %7664 to i32
  %7666 = icmp eq i32 %7665, 0
  br i1 %7666, label %7667, label %7670

7667:                                             ; preds = %7659
  %7668 = mul nuw nsw i64 %7660, 16
  %7669 = getelementptr inbounds i8, i8* %0, i64 %7668
  call void @llvm.memset.p0i8.i64(i8* align 1 %7669, i8 0, i64 16, i1 false)
  br label %7670

7670:                                             ; preds = %7667, %7659
  %7671 = add nuw nsw i64 %7660, 1
  %7672 = call zeroext i8 @randombit()
  %7673 = getelementptr inbounds i8, i8* %1, i64 %7671
  store i8 %7672, i8* %7673, align 1
  %7674 = getelementptr inbounds i8, i8* %1, i64 %7671
  %7675 = load i8, i8* %7674, align 1
  %7676 = zext i8 %7675 to i32
  %7677 = icmp eq i32 %7676, 0
  br i1 %7677, label %7678, label %7681

7678:                                             ; preds = %7670
  %7679 = mul nuw nsw i64 %7671, 16
  %7680 = getelementptr inbounds i8, i8* %0, i64 %7679
  call void @llvm.memset.p0i8.i64(i8* align 1 %7680, i8 0, i64 16, i1 false)
  br label %7681

7681:                                             ; preds = %7678, %7670
  %7682 = add nuw nsw i64 %7671, 1
  %7683 = call zeroext i8 @randombit()
  %7684 = getelementptr inbounds i8, i8* %1, i64 %7682
  store i8 %7683, i8* %7684, align 1
  %7685 = getelementptr inbounds i8, i8* %1, i64 %7682
  %7686 = load i8, i8* %7685, align 1
  %7687 = zext i8 %7686 to i32
  %7688 = icmp eq i32 %7687, 0
  br i1 %7688, label %7689, label %7692

7689:                                             ; preds = %7681
  %7690 = mul nuw nsw i64 %7682, 16
  %7691 = getelementptr inbounds i8, i8* %0, i64 %7690
  call void @llvm.memset.p0i8.i64(i8* align 1 %7691, i8 0, i64 16, i1 false)
  br label %7692

7692:                                             ; preds = %7689, %7681
  %7693 = add nuw nsw i64 %7682, 1
  %7694 = call zeroext i8 @randombit()
  %7695 = getelementptr inbounds i8, i8* %1, i64 %7693
  store i8 %7694, i8* %7695, align 1
  %7696 = getelementptr inbounds i8, i8* %1, i64 %7693
  %7697 = load i8, i8* %7696, align 1
  %7698 = zext i8 %7697 to i32
  %7699 = icmp eq i32 %7698, 0
  br i1 %7699, label %7700, label %7703

7700:                                             ; preds = %7692
  %7701 = mul nuw nsw i64 %7693, 16
  %7702 = getelementptr inbounds i8, i8* %0, i64 %7701
  call void @llvm.memset.p0i8.i64(i8* align 1 %7702, i8 0, i64 16, i1 false)
  br label %7703

7703:                                             ; preds = %7700, %7692
  %7704 = add nuw nsw i64 %7693, 1
  %7705 = call zeroext i8 @randombit()
  %7706 = getelementptr inbounds i8, i8* %1, i64 %7704
  store i8 %7705, i8* %7706, align 1
  %7707 = getelementptr inbounds i8, i8* %1, i64 %7704
  %7708 = load i8, i8* %7707, align 1
  %7709 = zext i8 %7708 to i32
  %7710 = icmp eq i32 %7709, 0
  br i1 %7710, label %7711, label %7714

7711:                                             ; preds = %7703
  %7712 = mul nuw nsw i64 %7704, 16
  %7713 = getelementptr inbounds i8, i8* %0, i64 %7712
  call void @llvm.memset.p0i8.i64(i8* align 1 %7713, i8 0, i64 16, i1 false)
  br label %7714

7714:                                             ; preds = %7711, %7703
  %7715 = add nuw nsw i64 %7704, 1
  %7716 = call zeroext i8 @randombit()
  %7717 = getelementptr inbounds i8, i8* %1, i64 %7715
  store i8 %7716, i8* %7717, align 1
  %7718 = getelementptr inbounds i8, i8* %1, i64 %7715
  %7719 = load i8, i8* %7718, align 1
  %7720 = zext i8 %7719 to i32
  %7721 = icmp eq i32 %7720, 0
  br i1 %7721, label %7722, label %7725

7722:                                             ; preds = %7714
  %7723 = mul nuw nsw i64 %7715, 16
  %7724 = getelementptr inbounds i8, i8* %0, i64 %7723
  call void @llvm.memset.p0i8.i64(i8* align 1 %7724, i8 0, i64 16, i1 false)
  br label %7725

7725:                                             ; preds = %7722, %7714
  %7726 = add nuw nsw i64 %7715, 1
  %7727 = call zeroext i8 @randombit()
  %7728 = getelementptr inbounds i8, i8* %1, i64 %7726
  store i8 %7727, i8* %7728, align 1
  %7729 = getelementptr inbounds i8, i8* %1, i64 %7726
  %7730 = load i8, i8* %7729, align 1
  %7731 = zext i8 %7730 to i32
  %7732 = icmp eq i32 %7731, 0
  br i1 %7732, label %7733, label %7736

7733:                                             ; preds = %7725
  %7734 = mul nuw nsw i64 %7726, 16
  %7735 = getelementptr inbounds i8, i8* %0, i64 %7734
  call void @llvm.memset.p0i8.i64(i8* align 1 %7735, i8 0, i64 16, i1 false)
  br label %7736

7736:                                             ; preds = %7733, %7725
  %7737 = add nuw nsw i64 %7726, 1
  %7738 = call zeroext i8 @randombit()
  %7739 = getelementptr inbounds i8, i8* %1, i64 %7737
  store i8 %7738, i8* %7739, align 1
  %7740 = getelementptr inbounds i8, i8* %1, i64 %7737
  %7741 = load i8, i8* %7740, align 1
  %7742 = zext i8 %7741 to i32
  %7743 = icmp eq i32 %7742, 0
  br i1 %7743, label %7744, label %7747

7744:                                             ; preds = %7736
  %7745 = mul nuw nsw i64 %7737, 16
  %7746 = getelementptr inbounds i8, i8* %0, i64 %7745
  call void @llvm.memset.p0i8.i64(i8* align 1 %7746, i8 0, i64 16, i1 false)
  br label %7747

7747:                                             ; preds = %7744, %7736
  %7748 = add nuw nsw i64 %7737, 1
  %7749 = call zeroext i8 @randombit()
  %7750 = getelementptr inbounds i8, i8* %1, i64 %7748
  store i8 %7749, i8* %7750, align 1
  %7751 = getelementptr inbounds i8, i8* %1, i64 %7748
  %7752 = load i8, i8* %7751, align 1
  %7753 = zext i8 %7752 to i32
  %7754 = icmp eq i32 %7753, 0
  br i1 %7754, label %7755, label %7758

7755:                                             ; preds = %7747
  %7756 = mul nuw nsw i64 %7748, 16
  %7757 = getelementptr inbounds i8, i8* %0, i64 %7756
  call void @llvm.memset.p0i8.i64(i8* align 1 %7757, i8 0, i64 16, i1 false)
  br label %7758

7758:                                             ; preds = %7755, %7747
  %7759 = add nuw nsw i64 %7748, 1
  %7760 = call zeroext i8 @randombit()
  %7761 = getelementptr inbounds i8, i8* %1, i64 %7759
  store i8 %7760, i8* %7761, align 1
  %7762 = getelementptr inbounds i8, i8* %1, i64 %7759
  %7763 = load i8, i8* %7762, align 1
  %7764 = zext i8 %7763 to i32
  %7765 = icmp eq i32 %7764, 0
  br i1 %7765, label %7766, label %7769

7766:                                             ; preds = %7758
  %7767 = mul nuw nsw i64 %7759, 16
  %7768 = getelementptr inbounds i8, i8* %0, i64 %7767
  call void @llvm.memset.p0i8.i64(i8* align 1 %7768, i8 0, i64 16, i1 false)
  br label %7769

7769:                                             ; preds = %7766, %7758
  %7770 = add nuw nsw i64 %7759, 1
  %7771 = call zeroext i8 @randombit()
  %7772 = getelementptr inbounds i8, i8* %1, i64 %7770
  store i8 %7771, i8* %7772, align 1
  %7773 = getelementptr inbounds i8, i8* %1, i64 %7770
  %7774 = load i8, i8* %7773, align 1
  %7775 = zext i8 %7774 to i32
  %7776 = icmp eq i32 %7775, 0
  br i1 %7776, label %7777, label %7780

7777:                                             ; preds = %7769
  %7778 = mul nuw nsw i64 %7770, 16
  %7779 = getelementptr inbounds i8, i8* %0, i64 %7778
  call void @llvm.memset.p0i8.i64(i8* align 1 %7779, i8 0, i64 16, i1 false)
  br label %7780

7780:                                             ; preds = %7777, %7769
  %7781 = add nuw nsw i64 %7770, 1
  %7782 = call zeroext i8 @randombit()
  %7783 = getelementptr inbounds i8, i8* %1, i64 %7781
  store i8 %7782, i8* %7783, align 1
  %7784 = getelementptr inbounds i8, i8* %1, i64 %7781
  %7785 = load i8, i8* %7784, align 1
  %7786 = zext i8 %7785 to i32
  %7787 = icmp eq i32 %7786, 0
  br i1 %7787, label %7788, label %7791

7788:                                             ; preds = %7780
  %7789 = mul nuw nsw i64 %7781, 16
  %7790 = getelementptr inbounds i8, i8* %0, i64 %7789
  call void @llvm.memset.p0i8.i64(i8* align 1 %7790, i8 0, i64 16, i1 false)
  br label %7791

7791:                                             ; preds = %7788, %7780
  %7792 = add nuw nsw i64 %7781, 1
  %7793 = call zeroext i8 @randombit()
  %7794 = getelementptr inbounds i8, i8* %1, i64 %7792
  store i8 %7793, i8* %7794, align 1
  %7795 = getelementptr inbounds i8, i8* %1, i64 %7792
  %7796 = load i8, i8* %7795, align 1
  %7797 = zext i8 %7796 to i32
  %7798 = icmp eq i32 %7797, 0
  br i1 %7798, label %7799, label %7802

7799:                                             ; preds = %7791
  %7800 = mul nuw nsw i64 %7792, 16
  %7801 = getelementptr inbounds i8, i8* %0, i64 %7800
  call void @llvm.memset.p0i8.i64(i8* align 1 %7801, i8 0, i64 16, i1 false)
  br label %7802

7802:                                             ; preds = %7799, %7791
  %7803 = add nuw nsw i64 %7792, 1
  %7804 = call zeroext i8 @randombit()
  %7805 = getelementptr inbounds i8, i8* %1, i64 %7803
  store i8 %7804, i8* %7805, align 1
  %7806 = getelementptr inbounds i8, i8* %1, i64 %7803
  %7807 = load i8, i8* %7806, align 1
  %7808 = zext i8 %7807 to i32
  %7809 = icmp eq i32 %7808, 0
  br i1 %7809, label %7810, label %7813

7810:                                             ; preds = %7802
  %7811 = mul nuw nsw i64 %7803, 16
  %7812 = getelementptr inbounds i8, i8* %0, i64 %7811
  call void @llvm.memset.p0i8.i64(i8* align 1 %7812, i8 0, i64 16, i1 false)
  br label %7813

7813:                                             ; preds = %7810, %7802
  %7814 = add nuw nsw i64 %7803, 1
  %7815 = call zeroext i8 @randombit()
  %7816 = getelementptr inbounds i8, i8* %1, i64 %7814
  store i8 %7815, i8* %7816, align 1
  %7817 = getelementptr inbounds i8, i8* %1, i64 %7814
  %7818 = load i8, i8* %7817, align 1
  %7819 = zext i8 %7818 to i32
  %7820 = icmp eq i32 %7819, 0
  br i1 %7820, label %7821, label %7824

7821:                                             ; preds = %7813
  %7822 = mul nuw nsw i64 %7814, 16
  %7823 = getelementptr inbounds i8, i8* %0, i64 %7822
  call void @llvm.memset.p0i8.i64(i8* align 1 %7823, i8 0, i64 16, i1 false)
  br label %7824

7824:                                             ; preds = %7821, %7813
  %7825 = add nuw nsw i64 %7814, 1
  %7826 = call zeroext i8 @randombit()
  %7827 = getelementptr inbounds i8, i8* %1, i64 %7825
  store i8 %7826, i8* %7827, align 1
  %7828 = getelementptr inbounds i8, i8* %1, i64 %7825
  %7829 = load i8, i8* %7828, align 1
  %7830 = zext i8 %7829 to i32
  %7831 = icmp eq i32 %7830, 0
  br i1 %7831, label %7832, label %7835

7832:                                             ; preds = %7824
  %7833 = mul nuw nsw i64 %7825, 16
  %7834 = getelementptr inbounds i8, i8* %0, i64 %7833
  call void @llvm.memset.p0i8.i64(i8* align 1 %7834, i8 0, i64 16, i1 false)
  br label %7835

7835:                                             ; preds = %7832, %7824
  %7836 = add nuw nsw i64 %7825, 1
  %7837 = call zeroext i8 @randombit()
  %7838 = getelementptr inbounds i8, i8* %1, i64 %7836
  store i8 %7837, i8* %7838, align 1
  %7839 = getelementptr inbounds i8, i8* %1, i64 %7836
  %7840 = load i8, i8* %7839, align 1
  %7841 = zext i8 %7840 to i32
  %7842 = icmp eq i32 %7841, 0
  br i1 %7842, label %7843, label %7846

7843:                                             ; preds = %7835
  %7844 = mul nuw nsw i64 %7836, 16
  %7845 = getelementptr inbounds i8, i8* %0, i64 %7844
  call void @llvm.memset.p0i8.i64(i8* align 1 %7845, i8 0, i64 16, i1 false)
  br label %7846

7846:                                             ; preds = %7843, %7835
  %7847 = add nuw nsw i64 %7836, 1
  %7848 = call zeroext i8 @randombit()
  %7849 = getelementptr inbounds i8, i8* %1, i64 %7847
  store i8 %7848, i8* %7849, align 1
  %7850 = getelementptr inbounds i8, i8* %1, i64 %7847
  %7851 = load i8, i8* %7850, align 1
  %7852 = zext i8 %7851 to i32
  %7853 = icmp eq i32 %7852, 0
  br i1 %7853, label %7854, label %7857

7854:                                             ; preds = %7846
  %7855 = mul nuw nsw i64 %7847, 16
  %7856 = getelementptr inbounds i8, i8* %0, i64 %7855
  call void @llvm.memset.p0i8.i64(i8* align 1 %7856, i8 0, i64 16, i1 false)
  br label %7857

7857:                                             ; preds = %7854, %7846
  %7858 = add nuw nsw i64 %7847, 1
  %7859 = call zeroext i8 @randombit()
  %7860 = getelementptr inbounds i8, i8* %1, i64 %7858
  store i8 %7859, i8* %7860, align 1
  %7861 = getelementptr inbounds i8, i8* %1, i64 %7858
  %7862 = load i8, i8* %7861, align 1
  %7863 = zext i8 %7862 to i32
  %7864 = icmp eq i32 %7863, 0
  br i1 %7864, label %7865, label %7868

7865:                                             ; preds = %7857
  %7866 = mul nuw nsw i64 %7858, 16
  %7867 = getelementptr inbounds i8, i8* %0, i64 %7866
  call void @llvm.memset.p0i8.i64(i8* align 1 %7867, i8 0, i64 16, i1 false)
  br label %7868

7868:                                             ; preds = %7865, %7857
  %7869 = add nuw nsw i64 %7858, 1
  %7870 = call zeroext i8 @randombit()
  %7871 = getelementptr inbounds i8, i8* %1, i64 %7869
  store i8 %7870, i8* %7871, align 1
  %7872 = getelementptr inbounds i8, i8* %1, i64 %7869
  %7873 = load i8, i8* %7872, align 1
  %7874 = zext i8 %7873 to i32
  %7875 = icmp eq i32 %7874, 0
  br i1 %7875, label %7876, label %7879

7876:                                             ; preds = %7868
  %7877 = mul nuw nsw i64 %7869, 16
  %7878 = getelementptr inbounds i8, i8* %0, i64 %7877
  call void @llvm.memset.p0i8.i64(i8* align 1 %7878, i8 0, i64 16, i1 false)
  br label %7879

7879:                                             ; preds = %7876, %7868
  %7880 = add nuw nsw i64 %7869, 1
  %7881 = call zeroext i8 @randombit()
  %7882 = getelementptr inbounds i8, i8* %1, i64 %7880
  store i8 %7881, i8* %7882, align 1
  %7883 = getelementptr inbounds i8, i8* %1, i64 %7880
  %7884 = load i8, i8* %7883, align 1
  %7885 = zext i8 %7884 to i32
  %7886 = icmp eq i32 %7885, 0
  br i1 %7886, label %7887, label %7890

7887:                                             ; preds = %7879
  %7888 = mul nuw nsw i64 %7880, 16
  %7889 = getelementptr inbounds i8, i8* %0, i64 %7888
  call void @llvm.memset.p0i8.i64(i8* align 1 %7889, i8 0, i64 16, i1 false)
  br label %7890

7890:                                             ; preds = %7887, %7879
  %7891 = add nuw nsw i64 %7880, 1
  %7892 = call zeroext i8 @randombit()
  %7893 = getelementptr inbounds i8, i8* %1, i64 %7891
  store i8 %7892, i8* %7893, align 1
  %7894 = getelementptr inbounds i8, i8* %1, i64 %7891
  %7895 = load i8, i8* %7894, align 1
  %7896 = zext i8 %7895 to i32
  %7897 = icmp eq i32 %7896, 0
  br i1 %7897, label %7898, label %7901

7898:                                             ; preds = %7890
  %7899 = mul nuw nsw i64 %7891, 16
  %7900 = getelementptr inbounds i8, i8* %0, i64 %7899
  call void @llvm.memset.p0i8.i64(i8* align 1 %7900, i8 0, i64 16, i1 false)
  br label %7901

7901:                                             ; preds = %7898, %7890
  %7902 = add nuw nsw i64 %7891, 1
  %7903 = call zeroext i8 @randombit()
  %7904 = getelementptr inbounds i8, i8* %1, i64 %7902
  store i8 %7903, i8* %7904, align 1
  %7905 = getelementptr inbounds i8, i8* %1, i64 %7902
  %7906 = load i8, i8* %7905, align 1
  %7907 = zext i8 %7906 to i32
  %7908 = icmp eq i32 %7907, 0
  br i1 %7908, label %7909, label %7912

7909:                                             ; preds = %7901
  %7910 = mul nuw nsw i64 %7902, 16
  %7911 = getelementptr inbounds i8, i8* %0, i64 %7910
  call void @llvm.memset.p0i8.i64(i8* align 1 %7911, i8 0, i64 16, i1 false)
  br label %7912

7912:                                             ; preds = %7909, %7901
  %7913 = add nuw nsw i64 %7902, 1
  %7914 = call zeroext i8 @randombit()
  %7915 = getelementptr inbounds i8, i8* %1, i64 %7913
  store i8 %7914, i8* %7915, align 1
  %7916 = getelementptr inbounds i8, i8* %1, i64 %7913
  %7917 = load i8, i8* %7916, align 1
  %7918 = zext i8 %7917 to i32
  %7919 = icmp eq i32 %7918, 0
  br i1 %7919, label %7920, label %7923

7920:                                             ; preds = %7912
  %7921 = mul nuw nsw i64 %7913, 16
  %7922 = getelementptr inbounds i8, i8* %0, i64 %7921
  call void @llvm.memset.p0i8.i64(i8* align 1 %7922, i8 0, i64 16, i1 false)
  br label %7923

7923:                                             ; preds = %7920, %7912
  %7924 = add nuw nsw i64 %7913, 1
  %7925 = call zeroext i8 @randombit()
  %7926 = getelementptr inbounds i8, i8* %1, i64 %7924
  store i8 %7925, i8* %7926, align 1
  %7927 = getelementptr inbounds i8, i8* %1, i64 %7924
  %7928 = load i8, i8* %7927, align 1
  %7929 = zext i8 %7928 to i32
  %7930 = icmp eq i32 %7929, 0
  br i1 %7930, label %7931, label %7934

7931:                                             ; preds = %7923
  %7932 = mul nuw nsw i64 %7924, 16
  %7933 = getelementptr inbounds i8, i8* %0, i64 %7932
  call void @llvm.memset.p0i8.i64(i8* align 1 %7933, i8 0, i64 16, i1 false)
  br label %7934

7934:                                             ; preds = %7931, %7923
  %7935 = add nuw nsw i64 %7924, 1
  %7936 = call zeroext i8 @randombit()
  %7937 = getelementptr inbounds i8, i8* %1, i64 %7935
  store i8 %7936, i8* %7937, align 1
  %7938 = getelementptr inbounds i8, i8* %1, i64 %7935
  %7939 = load i8, i8* %7938, align 1
  %7940 = zext i8 %7939 to i32
  %7941 = icmp eq i32 %7940, 0
  br i1 %7941, label %7942, label %7945

7942:                                             ; preds = %7934
  %7943 = mul nuw nsw i64 %7935, 16
  %7944 = getelementptr inbounds i8, i8* %0, i64 %7943
  call void @llvm.memset.p0i8.i64(i8* align 1 %7944, i8 0, i64 16, i1 false)
  br label %7945

7945:                                             ; preds = %7942, %7934
  %7946 = add nuw nsw i64 %7935, 1
  %7947 = call zeroext i8 @randombit()
  %7948 = getelementptr inbounds i8, i8* %1, i64 %7946
  store i8 %7947, i8* %7948, align 1
  %7949 = getelementptr inbounds i8, i8* %1, i64 %7946
  %7950 = load i8, i8* %7949, align 1
  %7951 = zext i8 %7950 to i32
  %7952 = icmp eq i32 %7951, 0
  br i1 %7952, label %7953, label %7956

7953:                                             ; preds = %7945
  %7954 = mul nuw nsw i64 %7946, 16
  %7955 = getelementptr inbounds i8, i8* %0, i64 %7954
  call void @llvm.memset.p0i8.i64(i8* align 1 %7955, i8 0, i64 16, i1 false)
  br label %7956

7956:                                             ; preds = %7953, %7945
  %7957 = add nuw nsw i64 %7946, 1
  %7958 = call zeroext i8 @randombit()
  %7959 = getelementptr inbounds i8, i8* %1, i64 %7957
  store i8 %7958, i8* %7959, align 1
  %7960 = getelementptr inbounds i8, i8* %1, i64 %7957
  %7961 = load i8, i8* %7960, align 1
  %7962 = zext i8 %7961 to i32
  %7963 = icmp eq i32 %7962, 0
  br i1 %7963, label %7964, label %7967

7964:                                             ; preds = %7956
  %7965 = mul nuw nsw i64 %7957, 16
  %7966 = getelementptr inbounds i8, i8* %0, i64 %7965
  call void @llvm.memset.p0i8.i64(i8* align 1 %7966, i8 0, i64 16, i1 false)
  br label %7967

7967:                                             ; preds = %7964, %7956
  %7968 = add nuw nsw i64 %7957, 1
  %7969 = call zeroext i8 @randombit()
  %7970 = getelementptr inbounds i8, i8* %1, i64 %7968
  store i8 %7969, i8* %7970, align 1
  %7971 = getelementptr inbounds i8, i8* %1, i64 %7968
  %7972 = load i8, i8* %7971, align 1
  %7973 = zext i8 %7972 to i32
  %7974 = icmp eq i32 %7973, 0
  br i1 %7974, label %7975, label %7978

7975:                                             ; preds = %7967
  %7976 = mul nuw nsw i64 %7968, 16
  %7977 = getelementptr inbounds i8, i8* %0, i64 %7976
  call void @llvm.memset.p0i8.i64(i8* align 1 %7977, i8 0, i64 16, i1 false)
  br label %7978

7978:                                             ; preds = %7975, %7967
  %7979 = add nuw nsw i64 %7968, 1
  %7980 = call zeroext i8 @randombit()
  %7981 = getelementptr inbounds i8, i8* %1, i64 %7979
  store i8 %7980, i8* %7981, align 1
  %7982 = getelementptr inbounds i8, i8* %1, i64 %7979
  %7983 = load i8, i8* %7982, align 1
  %7984 = zext i8 %7983 to i32
  %7985 = icmp eq i32 %7984, 0
  br i1 %7985, label %7986, label %7989

7986:                                             ; preds = %7978
  %7987 = mul nuw nsw i64 %7979, 16
  %7988 = getelementptr inbounds i8, i8* %0, i64 %7987
  call void @llvm.memset.p0i8.i64(i8* align 1 %7988, i8 0, i64 16, i1 false)
  br label %7989

7989:                                             ; preds = %7986, %7978
  %7990 = add nuw nsw i64 %7979, 1
  %7991 = call zeroext i8 @randombit()
  %7992 = getelementptr inbounds i8, i8* %1, i64 %7990
  store i8 %7991, i8* %7992, align 1
  %7993 = getelementptr inbounds i8, i8* %1, i64 %7990
  %7994 = load i8, i8* %7993, align 1
  %7995 = zext i8 %7994 to i32
  %7996 = icmp eq i32 %7995, 0
  br i1 %7996, label %7997, label %8000

7997:                                             ; preds = %7989
  %7998 = mul nuw nsw i64 %7990, 16
  %7999 = getelementptr inbounds i8, i8* %0, i64 %7998
  call void @llvm.memset.p0i8.i64(i8* align 1 %7999, i8 0, i64 16, i1 false)
  br label %8000

8000:                                             ; preds = %7997, %7989
  %8001 = add nuw nsw i64 %7990, 1
  %8002 = call zeroext i8 @randombit()
  %8003 = getelementptr inbounds i8, i8* %1, i64 %8001
  store i8 %8002, i8* %8003, align 1
  %8004 = getelementptr inbounds i8, i8* %1, i64 %8001
  %8005 = load i8, i8* %8004, align 1
  %8006 = zext i8 %8005 to i32
  %8007 = icmp eq i32 %8006, 0
  br i1 %8007, label %8008, label %8011

8008:                                             ; preds = %8000
  %8009 = mul nuw nsw i64 %8001, 16
  %8010 = getelementptr inbounds i8, i8* %0, i64 %8009
  call void @llvm.memset.p0i8.i64(i8* align 1 %8010, i8 0, i64 16, i1 false)
  br label %8011

8011:                                             ; preds = %8008, %8000
  %8012 = add nuw nsw i64 %8001, 1
  %8013 = call zeroext i8 @randombit()
  %8014 = getelementptr inbounds i8, i8* %1, i64 %8012
  store i8 %8013, i8* %8014, align 1
  %8015 = getelementptr inbounds i8, i8* %1, i64 %8012
  %8016 = load i8, i8* %8015, align 1
  %8017 = zext i8 %8016 to i32
  %8018 = icmp eq i32 %8017, 0
  br i1 %8018, label %8019, label %8022

8019:                                             ; preds = %8011
  %8020 = mul nuw nsw i64 %8012, 16
  %8021 = getelementptr inbounds i8, i8* %0, i64 %8020
  call void @llvm.memset.p0i8.i64(i8* align 1 %8021, i8 0, i64 16, i1 false)
  br label %8022

8022:                                             ; preds = %8019, %8011
  %8023 = add nuw nsw i64 %8012, 1
  %8024 = call zeroext i8 @randombit()
  %8025 = getelementptr inbounds i8, i8* %1, i64 %8023
  store i8 %8024, i8* %8025, align 1
  %8026 = getelementptr inbounds i8, i8* %1, i64 %8023
  %8027 = load i8, i8* %8026, align 1
  %8028 = zext i8 %8027 to i32
  %8029 = icmp eq i32 %8028, 0
  br i1 %8029, label %8030, label %8033

8030:                                             ; preds = %8022
  %8031 = mul nuw nsw i64 %8023, 16
  %8032 = getelementptr inbounds i8, i8* %0, i64 %8031
  call void @llvm.memset.p0i8.i64(i8* align 1 %8032, i8 0, i64 16, i1 false)
  br label %8033

8033:                                             ; preds = %8030, %8022
  %8034 = add nuw nsw i64 %8023, 1
  %8035 = call zeroext i8 @randombit()
  %8036 = getelementptr inbounds i8, i8* %1, i64 %8034
  store i8 %8035, i8* %8036, align 1
  %8037 = getelementptr inbounds i8, i8* %1, i64 %8034
  %8038 = load i8, i8* %8037, align 1
  %8039 = zext i8 %8038 to i32
  %8040 = icmp eq i32 %8039, 0
  br i1 %8040, label %8041, label %8044

8041:                                             ; preds = %8033
  %8042 = mul nuw nsw i64 %8034, 16
  %8043 = getelementptr inbounds i8, i8* %0, i64 %8042
  call void @llvm.memset.p0i8.i64(i8* align 1 %8043, i8 0, i64 16, i1 false)
  br label %8044

8044:                                             ; preds = %8041, %8033
  %8045 = add nuw nsw i64 %8034, 1
  %8046 = call zeroext i8 @randombit()
  %8047 = getelementptr inbounds i8, i8* %1, i64 %8045
  store i8 %8046, i8* %8047, align 1
  %8048 = getelementptr inbounds i8, i8* %1, i64 %8045
  %8049 = load i8, i8* %8048, align 1
  %8050 = zext i8 %8049 to i32
  %8051 = icmp eq i32 %8050, 0
  br i1 %8051, label %8052, label %8055

8052:                                             ; preds = %8044
  %8053 = mul nuw nsw i64 %8045, 16
  %8054 = getelementptr inbounds i8, i8* %0, i64 %8053
  call void @llvm.memset.p0i8.i64(i8* align 1 %8054, i8 0, i64 16, i1 false)
  br label %8055

8055:                                             ; preds = %8052, %8044
  %8056 = add nuw nsw i64 %8045, 1
  %8057 = call zeroext i8 @randombit()
  %8058 = getelementptr inbounds i8, i8* %1, i64 %8056
  store i8 %8057, i8* %8058, align 1
  %8059 = getelementptr inbounds i8, i8* %1, i64 %8056
  %8060 = load i8, i8* %8059, align 1
  %8061 = zext i8 %8060 to i32
  %8062 = icmp eq i32 %8061, 0
  br i1 %8062, label %8063, label %8066

8063:                                             ; preds = %8055
  %8064 = mul nuw nsw i64 %8056, 16
  %8065 = getelementptr inbounds i8, i8* %0, i64 %8064
  call void @llvm.memset.p0i8.i64(i8* align 1 %8065, i8 0, i64 16, i1 false)
  br label %8066

8066:                                             ; preds = %8063, %8055
  %8067 = add nuw nsw i64 %8056, 1
  %8068 = call zeroext i8 @randombit()
  %8069 = getelementptr inbounds i8, i8* %1, i64 %8067
  store i8 %8068, i8* %8069, align 1
  %8070 = getelementptr inbounds i8, i8* %1, i64 %8067
  %8071 = load i8, i8* %8070, align 1
  %8072 = zext i8 %8071 to i32
  %8073 = icmp eq i32 %8072, 0
  br i1 %8073, label %8074, label %8077

8074:                                             ; preds = %8066
  %8075 = mul nuw nsw i64 %8067, 16
  %8076 = getelementptr inbounds i8, i8* %0, i64 %8075
  call void @llvm.memset.p0i8.i64(i8* align 1 %8076, i8 0, i64 16, i1 false)
  br label %8077

8077:                                             ; preds = %8074, %8066
  %8078 = add nuw nsw i64 %8067, 1
  %8079 = call zeroext i8 @randombit()
  %8080 = getelementptr inbounds i8, i8* %1, i64 %8078
  store i8 %8079, i8* %8080, align 1
  %8081 = getelementptr inbounds i8, i8* %1, i64 %8078
  %8082 = load i8, i8* %8081, align 1
  %8083 = zext i8 %8082 to i32
  %8084 = icmp eq i32 %8083, 0
  br i1 %8084, label %8085, label %8088

8085:                                             ; preds = %8077
  %8086 = mul nuw nsw i64 %8078, 16
  %8087 = getelementptr inbounds i8, i8* %0, i64 %8086
  call void @llvm.memset.p0i8.i64(i8* align 1 %8087, i8 0, i64 16, i1 false)
  br label %8088

8088:                                             ; preds = %8085, %8077
  %8089 = add nuw nsw i64 %8078, 1
  %8090 = call zeroext i8 @randombit()
  %8091 = getelementptr inbounds i8, i8* %1, i64 %8089
  store i8 %8090, i8* %8091, align 1
  %8092 = getelementptr inbounds i8, i8* %1, i64 %8089
  %8093 = load i8, i8* %8092, align 1
  %8094 = zext i8 %8093 to i32
  %8095 = icmp eq i32 %8094, 0
  br i1 %8095, label %8096, label %8099

8096:                                             ; preds = %8088
  %8097 = mul nuw nsw i64 %8089, 16
  %8098 = getelementptr inbounds i8, i8* %0, i64 %8097
  call void @llvm.memset.p0i8.i64(i8* align 1 %8098, i8 0, i64 16, i1 false)
  br label %8099

8099:                                             ; preds = %8096, %8088
  %8100 = add nuw nsw i64 %8089, 1
  %8101 = call zeroext i8 @randombit()
  %8102 = getelementptr inbounds i8, i8* %1, i64 %8100
  store i8 %8101, i8* %8102, align 1
  %8103 = getelementptr inbounds i8, i8* %1, i64 %8100
  %8104 = load i8, i8* %8103, align 1
  %8105 = zext i8 %8104 to i32
  %8106 = icmp eq i32 %8105, 0
  br i1 %8106, label %8107, label %8110

8107:                                             ; preds = %8099
  %8108 = mul nuw nsw i64 %8100, 16
  %8109 = getelementptr inbounds i8, i8* %0, i64 %8108
  call void @llvm.memset.p0i8.i64(i8* align 1 %8109, i8 0, i64 16, i1 false)
  br label %8110

8110:                                             ; preds = %8107, %8099
  %8111 = add nuw nsw i64 %8100, 1
  %8112 = call zeroext i8 @randombit()
  %8113 = getelementptr inbounds i8, i8* %1, i64 %8111
  store i8 %8112, i8* %8113, align 1
  %8114 = getelementptr inbounds i8, i8* %1, i64 %8111
  %8115 = load i8, i8* %8114, align 1
  %8116 = zext i8 %8115 to i32
  %8117 = icmp eq i32 %8116, 0
  br i1 %8117, label %8118, label %8121

8118:                                             ; preds = %8110
  %8119 = mul nuw nsw i64 %8111, 16
  %8120 = getelementptr inbounds i8, i8* %0, i64 %8119
  call void @llvm.memset.p0i8.i64(i8* align 1 %8120, i8 0, i64 16, i1 false)
  br label %8121

8121:                                             ; preds = %8118, %8110
  %8122 = add nuw nsw i64 %8111, 1
  %8123 = call zeroext i8 @randombit()
  %8124 = getelementptr inbounds i8, i8* %1, i64 %8122
  store i8 %8123, i8* %8124, align 1
  %8125 = getelementptr inbounds i8, i8* %1, i64 %8122
  %8126 = load i8, i8* %8125, align 1
  %8127 = zext i8 %8126 to i32
  %8128 = icmp eq i32 %8127, 0
  br i1 %8128, label %8129, label %8132

8129:                                             ; preds = %8121
  %8130 = mul nuw nsw i64 %8122, 16
  %8131 = getelementptr inbounds i8, i8* %0, i64 %8130
  call void @llvm.memset.p0i8.i64(i8* align 1 %8131, i8 0, i64 16, i1 false)
  br label %8132

8132:                                             ; preds = %8129, %8121
  %8133 = add nuw nsw i64 %8122, 1
  %8134 = call zeroext i8 @randombit()
  %8135 = getelementptr inbounds i8, i8* %1, i64 %8133
  store i8 %8134, i8* %8135, align 1
  %8136 = getelementptr inbounds i8, i8* %1, i64 %8133
  %8137 = load i8, i8* %8136, align 1
  %8138 = zext i8 %8137 to i32
  %8139 = icmp eq i32 %8138, 0
  br i1 %8139, label %8140, label %8143

8140:                                             ; preds = %8132
  %8141 = mul nuw nsw i64 %8133, 16
  %8142 = getelementptr inbounds i8, i8* %0, i64 %8141
  call void @llvm.memset.p0i8.i64(i8* align 1 %8142, i8 0, i64 16, i1 false)
  br label %8143

8143:                                             ; preds = %8140, %8132
  %8144 = add nuw nsw i64 %8133, 1
  %8145 = call zeroext i8 @randombit()
  %8146 = getelementptr inbounds i8, i8* %1, i64 %8144
  store i8 %8145, i8* %8146, align 1
  %8147 = getelementptr inbounds i8, i8* %1, i64 %8144
  %8148 = load i8, i8* %8147, align 1
  %8149 = zext i8 %8148 to i32
  %8150 = icmp eq i32 %8149, 0
  br i1 %8150, label %8151, label %8154

8151:                                             ; preds = %8143
  %8152 = mul nuw nsw i64 %8144, 16
  %8153 = getelementptr inbounds i8, i8* %0, i64 %8152
  call void @llvm.memset.p0i8.i64(i8* align 1 %8153, i8 0, i64 16, i1 false)
  br label %8154

8154:                                             ; preds = %8151, %8143
  %8155 = add nuw nsw i64 %8144, 1
  %8156 = call zeroext i8 @randombit()
  %8157 = getelementptr inbounds i8, i8* %1, i64 %8155
  store i8 %8156, i8* %8157, align 1
  %8158 = getelementptr inbounds i8, i8* %1, i64 %8155
  %8159 = load i8, i8* %8158, align 1
  %8160 = zext i8 %8159 to i32
  %8161 = icmp eq i32 %8160, 0
  br i1 %8161, label %8162, label %8165

8162:                                             ; preds = %8154
  %8163 = mul nuw nsw i64 %8155, 16
  %8164 = getelementptr inbounds i8, i8* %0, i64 %8163
  call void @llvm.memset.p0i8.i64(i8* align 1 %8164, i8 0, i64 16, i1 false)
  br label %8165

8165:                                             ; preds = %8162, %8154
  %8166 = add nuw nsw i64 %8155, 1
  %8167 = call zeroext i8 @randombit()
  %8168 = getelementptr inbounds i8, i8* %1, i64 %8166
  store i8 %8167, i8* %8168, align 1
  %8169 = getelementptr inbounds i8, i8* %1, i64 %8166
  %8170 = load i8, i8* %8169, align 1
  %8171 = zext i8 %8170 to i32
  %8172 = icmp eq i32 %8171, 0
  br i1 %8172, label %8173, label %8176

8173:                                             ; preds = %8165
  %8174 = mul nuw nsw i64 %8166, 16
  %8175 = getelementptr inbounds i8, i8* %0, i64 %8174
  call void @llvm.memset.p0i8.i64(i8* align 1 %8175, i8 0, i64 16, i1 false)
  br label %8176

8176:                                             ; preds = %8173, %8165
  %8177 = add nuw nsw i64 %8166, 1
  %8178 = call zeroext i8 @randombit()
  %8179 = getelementptr inbounds i8, i8* %1, i64 %8177
  store i8 %8178, i8* %8179, align 1
  %8180 = getelementptr inbounds i8, i8* %1, i64 %8177
  %8181 = load i8, i8* %8180, align 1
  %8182 = zext i8 %8181 to i32
  %8183 = icmp eq i32 %8182, 0
  br i1 %8183, label %8184, label %8187

8184:                                             ; preds = %8176
  %8185 = mul nuw nsw i64 %8177, 16
  %8186 = getelementptr inbounds i8, i8* %0, i64 %8185
  call void @llvm.memset.p0i8.i64(i8* align 1 %8186, i8 0, i64 16, i1 false)
  br label %8187

8187:                                             ; preds = %8184, %8176
  %8188 = add nuw nsw i64 %8177, 1
  %8189 = call zeroext i8 @randombit()
  %8190 = getelementptr inbounds i8, i8* %1, i64 %8188
  store i8 %8189, i8* %8190, align 1
  %8191 = getelementptr inbounds i8, i8* %1, i64 %8188
  %8192 = load i8, i8* %8191, align 1
  %8193 = zext i8 %8192 to i32
  %8194 = icmp eq i32 %8193, 0
  br i1 %8194, label %8195, label %8198

8195:                                             ; preds = %8187
  %8196 = mul nuw nsw i64 %8188, 16
  %8197 = getelementptr inbounds i8, i8* %0, i64 %8196
  call void @llvm.memset.p0i8.i64(i8* align 1 %8197, i8 0, i64 16, i1 false)
  br label %8198

8198:                                             ; preds = %8195, %8187
  %8199 = add nuw nsw i64 %8188, 1
  %8200 = call zeroext i8 @randombit()
  %8201 = getelementptr inbounds i8, i8* %1, i64 %8199
  store i8 %8200, i8* %8201, align 1
  %8202 = getelementptr inbounds i8, i8* %1, i64 %8199
  %8203 = load i8, i8* %8202, align 1
  %8204 = zext i8 %8203 to i32
  %8205 = icmp eq i32 %8204, 0
  br i1 %8205, label %8206, label %8209

8206:                                             ; preds = %8198
  %8207 = mul nuw nsw i64 %8199, 16
  %8208 = getelementptr inbounds i8, i8* %0, i64 %8207
  call void @llvm.memset.p0i8.i64(i8* align 1 %8208, i8 0, i64 16, i1 false)
  br label %8209

8209:                                             ; preds = %8206, %8198
  %8210 = add nuw nsw i64 %8199, 1
  %8211 = call zeroext i8 @randombit()
  %8212 = getelementptr inbounds i8, i8* %1, i64 %8210
  store i8 %8211, i8* %8212, align 1
  %8213 = getelementptr inbounds i8, i8* %1, i64 %8210
  %8214 = load i8, i8* %8213, align 1
  %8215 = zext i8 %8214 to i32
  %8216 = icmp eq i32 %8215, 0
  br i1 %8216, label %8217, label %8220

8217:                                             ; preds = %8209
  %8218 = mul nuw nsw i64 %8210, 16
  %8219 = getelementptr inbounds i8, i8* %0, i64 %8218
  call void @llvm.memset.p0i8.i64(i8* align 1 %8219, i8 0, i64 16, i1 false)
  br label %8220

8220:                                             ; preds = %8217, %8209
  %8221 = add nuw nsw i64 %8210, 1
  %8222 = call zeroext i8 @randombit()
  %8223 = getelementptr inbounds i8, i8* %1, i64 %8221
  store i8 %8222, i8* %8223, align 1
  %8224 = getelementptr inbounds i8, i8* %1, i64 %8221
  %8225 = load i8, i8* %8224, align 1
  %8226 = zext i8 %8225 to i32
  %8227 = icmp eq i32 %8226, 0
  br i1 %8227, label %8228, label %8231

8228:                                             ; preds = %8220
  %8229 = mul nuw nsw i64 %8221, 16
  %8230 = getelementptr inbounds i8, i8* %0, i64 %8229
  call void @llvm.memset.p0i8.i64(i8* align 1 %8230, i8 0, i64 16, i1 false)
  br label %8231

8231:                                             ; preds = %8228, %8220
  %8232 = add nuw nsw i64 %8221, 1
  %8233 = call zeroext i8 @randombit()
  %8234 = getelementptr inbounds i8, i8* %1, i64 %8232
  store i8 %8233, i8* %8234, align 1
  %8235 = getelementptr inbounds i8, i8* %1, i64 %8232
  %8236 = load i8, i8* %8235, align 1
  %8237 = zext i8 %8236 to i32
  %8238 = icmp eq i32 %8237, 0
  br i1 %8238, label %8239, label %8242

8239:                                             ; preds = %8231
  %8240 = mul nuw nsw i64 %8232, 16
  %8241 = getelementptr inbounds i8, i8* %0, i64 %8240
  call void @llvm.memset.p0i8.i64(i8* align 1 %8241, i8 0, i64 16, i1 false)
  br label %8242

8242:                                             ; preds = %8239, %8231
  %8243 = add nuw nsw i64 %8232, 1
  %8244 = call zeroext i8 @randombit()
  %8245 = getelementptr inbounds i8, i8* %1, i64 %8243
  store i8 %8244, i8* %8245, align 1
  %8246 = getelementptr inbounds i8, i8* %1, i64 %8243
  %8247 = load i8, i8* %8246, align 1
  %8248 = zext i8 %8247 to i32
  %8249 = icmp eq i32 %8248, 0
  br i1 %8249, label %8250, label %8253

8250:                                             ; preds = %8242
  %8251 = mul nuw nsw i64 %8243, 16
  %8252 = getelementptr inbounds i8, i8* %0, i64 %8251
  call void @llvm.memset.p0i8.i64(i8* align 1 %8252, i8 0, i64 16, i1 false)
  br label %8253

8253:                                             ; preds = %8250, %8242
  %8254 = add nuw nsw i64 %8243, 1
  %8255 = call zeroext i8 @randombit()
  %8256 = getelementptr inbounds i8, i8* %1, i64 %8254
  store i8 %8255, i8* %8256, align 1
  %8257 = getelementptr inbounds i8, i8* %1, i64 %8254
  %8258 = load i8, i8* %8257, align 1
  %8259 = zext i8 %8258 to i32
  %8260 = icmp eq i32 %8259, 0
  br i1 %8260, label %8261, label %8264

8261:                                             ; preds = %8253
  %8262 = mul nuw nsw i64 %8254, 16
  %8263 = getelementptr inbounds i8, i8* %0, i64 %8262
  call void @llvm.memset.p0i8.i64(i8* align 1 %8263, i8 0, i64 16, i1 false)
  br label %8264

8264:                                             ; preds = %8261, %8253
  %8265 = add nuw nsw i64 %8254, 1
  %8266 = call zeroext i8 @randombit()
  %8267 = getelementptr inbounds i8, i8* %1, i64 %8265
  store i8 %8266, i8* %8267, align 1
  %8268 = getelementptr inbounds i8, i8* %1, i64 %8265
  %8269 = load i8, i8* %8268, align 1
  %8270 = zext i8 %8269 to i32
  %8271 = icmp eq i32 %8270, 0
  br i1 %8271, label %8272, label %8275

8272:                                             ; preds = %8264
  %8273 = mul nuw nsw i64 %8265, 16
  %8274 = getelementptr inbounds i8, i8* %0, i64 %8273
  call void @llvm.memset.p0i8.i64(i8* align 1 %8274, i8 0, i64 16, i1 false)
  br label %8275

8275:                                             ; preds = %8272, %8264
  %8276 = add nuw nsw i64 %8265, 1
  %8277 = call zeroext i8 @randombit()
  %8278 = getelementptr inbounds i8, i8* %1, i64 %8276
  store i8 %8277, i8* %8278, align 1
  %8279 = getelementptr inbounds i8, i8* %1, i64 %8276
  %8280 = load i8, i8* %8279, align 1
  %8281 = zext i8 %8280 to i32
  %8282 = icmp eq i32 %8281, 0
  br i1 %8282, label %8283, label %8286

8283:                                             ; preds = %8275
  %8284 = mul nuw nsw i64 %8276, 16
  %8285 = getelementptr inbounds i8, i8* %0, i64 %8284
  call void @llvm.memset.p0i8.i64(i8* align 1 %8285, i8 0, i64 16, i1 false)
  br label %8286

8286:                                             ; preds = %8283, %8275
  %8287 = add nuw nsw i64 %8276, 1
  %8288 = call zeroext i8 @randombit()
  %8289 = getelementptr inbounds i8, i8* %1, i64 %8287
  store i8 %8288, i8* %8289, align 1
  %8290 = getelementptr inbounds i8, i8* %1, i64 %8287
  %8291 = load i8, i8* %8290, align 1
  %8292 = zext i8 %8291 to i32
  %8293 = icmp eq i32 %8292, 0
  br i1 %8293, label %8294, label %8297

8294:                                             ; preds = %8286
  %8295 = mul nuw nsw i64 %8287, 16
  %8296 = getelementptr inbounds i8, i8* %0, i64 %8295
  call void @llvm.memset.p0i8.i64(i8* align 1 %8296, i8 0, i64 16, i1 false)
  br label %8297

8297:                                             ; preds = %8294, %8286
  %8298 = add nuw nsw i64 %8287, 1
  %8299 = call zeroext i8 @randombit()
  %8300 = getelementptr inbounds i8, i8* %1, i64 %8298
  store i8 %8299, i8* %8300, align 1
  %8301 = getelementptr inbounds i8, i8* %1, i64 %8298
  %8302 = load i8, i8* %8301, align 1
  %8303 = zext i8 %8302 to i32
  %8304 = icmp eq i32 %8303, 0
  br i1 %8304, label %8305, label %8308

8305:                                             ; preds = %8297
  %8306 = mul nuw nsw i64 %8298, 16
  %8307 = getelementptr inbounds i8, i8* %0, i64 %8306
  call void @llvm.memset.p0i8.i64(i8* align 1 %8307, i8 0, i64 16, i1 false)
  br label %8308

8308:                                             ; preds = %8305, %8297
  %8309 = add nuw nsw i64 %8298, 1
  %8310 = call zeroext i8 @randombit()
  %8311 = getelementptr inbounds i8, i8* %1, i64 %8309
  store i8 %8310, i8* %8311, align 1
  %8312 = getelementptr inbounds i8, i8* %1, i64 %8309
  %8313 = load i8, i8* %8312, align 1
  %8314 = zext i8 %8313 to i32
  %8315 = icmp eq i32 %8314, 0
  br i1 %8315, label %8316, label %8319

8316:                                             ; preds = %8308
  %8317 = mul nuw nsw i64 %8309, 16
  %8318 = getelementptr inbounds i8, i8* %0, i64 %8317
  call void @llvm.memset.p0i8.i64(i8* align 1 %8318, i8 0, i64 16, i1 false)
  br label %8319

8319:                                             ; preds = %8316, %8308
  %8320 = add nuw nsw i64 %8309, 1
  %8321 = call zeroext i8 @randombit()
  %8322 = getelementptr inbounds i8, i8* %1, i64 %8320
  store i8 %8321, i8* %8322, align 1
  %8323 = getelementptr inbounds i8, i8* %1, i64 %8320
  %8324 = load i8, i8* %8323, align 1
  %8325 = zext i8 %8324 to i32
  %8326 = icmp eq i32 %8325, 0
  br i1 %8326, label %8327, label %8330

8327:                                             ; preds = %8319
  %8328 = mul nuw nsw i64 %8320, 16
  %8329 = getelementptr inbounds i8, i8* %0, i64 %8328
  call void @llvm.memset.p0i8.i64(i8* align 1 %8329, i8 0, i64 16, i1 false)
  br label %8330

8330:                                             ; preds = %8327, %8319
  %8331 = add nuw nsw i64 %8320, 1
  %8332 = call zeroext i8 @randombit()
  %8333 = getelementptr inbounds i8, i8* %1, i64 %8331
  store i8 %8332, i8* %8333, align 1
  %8334 = getelementptr inbounds i8, i8* %1, i64 %8331
  %8335 = load i8, i8* %8334, align 1
  %8336 = zext i8 %8335 to i32
  %8337 = icmp eq i32 %8336, 0
  br i1 %8337, label %8338, label %8341

8338:                                             ; preds = %8330
  %8339 = mul nuw nsw i64 %8331, 16
  %8340 = getelementptr inbounds i8, i8* %0, i64 %8339
  call void @llvm.memset.p0i8.i64(i8* align 1 %8340, i8 0, i64 16, i1 false)
  br label %8341

8341:                                             ; preds = %8338, %8330
  %8342 = add nuw nsw i64 %8331, 1
  %8343 = call zeroext i8 @randombit()
  %8344 = getelementptr inbounds i8, i8* %1, i64 %8342
  store i8 %8343, i8* %8344, align 1
  %8345 = getelementptr inbounds i8, i8* %1, i64 %8342
  %8346 = load i8, i8* %8345, align 1
  %8347 = zext i8 %8346 to i32
  %8348 = icmp eq i32 %8347, 0
  br i1 %8348, label %8349, label %8352

8349:                                             ; preds = %8341
  %8350 = mul nuw nsw i64 %8342, 16
  %8351 = getelementptr inbounds i8, i8* %0, i64 %8350
  call void @llvm.memset.p0i8.i64(i8* align 1 %8351, i8 0, i64 16, i1 false)
  br label %8352

8352:                                             ; preds = %8349, %8341
  %8353 = add nuw nsw i64 %8342, 1
  %8354 = call zeroext i8 @randombit()
  %8355 = getelementptr inbounds i8, i8* %1, i64 %8353
  store i8 %8354, i8* %8355, align 1
  %8356 = getelementptr inbounds i8, i8* %1, i64 %8353
  %8357 = load i8, i8* %8356, align 1
  %8358 = zext i8 %8357 to i32
  %8359 = icmp eq i32 %8358, 0
  br i1 %8359, label %8360, label %8363

8360:                                             ; preds = %8352
  %8361 = mul nuw nsw i64 %8353, 16
  %8362 = getelementptr inbounds i8, i8* %0, i64 %8361
  call void @llvm.memset.p0i8.i64(i8* align 1 %8362, i8 0, i64 16, i1 false)
  br label %8363

8363:                                             ; preds = %8360, %8352
  %8364 = add nuw nsw i64 %8353, 1
  %8365 = call zeroext i8 @randombit()
  %8366 = getelementptr inbounds i8, i8* %1, i64 %8364
  store i8 %8365, i8* %8366, align 1
  %8367 = getelementptr inbounds i8, i8* %1, i64 %8364
  %8368 = load i8, i8* %8367, align 1
  %8369 = zext i8 %8368 to i32
  %8370 = icmp eq i32 %8369, 0
  br i1 %8370, label %8371, label %8374

8371:                                             ; preds = %8363
  %8372 = mul nuw nsw i64 %8364, 16
  %8373 = getelementptr inbounds i8, i8* %0, i64 %8372
  call void @llvm.memset.p0i8.i64(i8* align 1 %8373, i8 0, i64 16, i1 false)
  br label %8374

8374:                                             ; preds = %8371, %8363
  %8375 = add nuw nsw i64 %8364, 1
  %8376 = call zeroext i8 @randombit()
  %8377 = getelementptr inbounds i8, i8* %1, i64 %8375
  store i8 %8376, i8* %8377, align 1
  %8378 = getelementptr inbounds i8, i8* %1, i64 %8375
  %8379 = load i8, i8* %8378, align 1
  %8380 = zext i8 %8379 to i32
  %8381 = icmp eq i32 %8380, 0
  br i1 %8381, label %8382, label %8385

8382:                                             ; preds = %8374
  %8383 = mul nuw nsw i64 %8375, 16
  %8384 = getelementptr inbounds i8, i8* %0, i64 %8383
  call void @llvm.memset.p0i8.i64(i8* align 1 %8384, i8 0, i64 16, i1 false)
  br label %8385

8385:                                             ; preds = %8382, %8374
  %8386 = add nuw nsw i64 %8375, 1
  %8387 = call zeroext i8 @randombit()
  %8388 = getelementptr inbounds i8, i8* %1, i64 %8386
  store i8 %8387, i8* %8388, align 1
  %8389 = getelementptr inbounds i8, i8* %1, i64 %8386
  %8390 = load i8, i8* %8389, align 1
  %8391 = zext i8 %8390 to i32
  %8392 = icmp eq i32 %8391, 0
  br i1 %8392, label %8393, label %8396

8393:                                             ; preds = %8385
  %8394 = mul nuw nsw i64 %8386, 16
  %8395 = getelementptr inbounds i8, i8* %0, i64 %8394
  call void @llvm.memset.p0i8.i64(i8* align 1 %8395, i8 0, i64 16, i1 false)
  br label %8396

8396:                                             ; preds = %8393, %8385
  %8397 = add nuw nsw i64 %8386, 1
  %8398 = call zeroext i8 @randombit()
  %8399 = getelementptr inbounds i8, i8* %1, i64 %8397
  store i8 %8398, i8* %8399, align 1
  %8400 = getelementptr inbounds i8, i8* %1, i64 %8397
  %8401 = load i8, i8* %8400, align 1
  %8402 = zext i8 %8401 to i32
  %8403 = icmp eq i32 %8402, 0
  br i1 %8403, label %8404, label %8407

8404:                                             ; preds = %8396
  %8405 = mul nuw nsw i64 %8397, 16
  %8406 = getelementptr inbounds i8, i8* %0, i64 %8405
  call void @llvm.memset.p0i8.i64(i8* align 1 %8406, i8 0, i64 16, i1 false)
  br label %8407

8407:                                             ; preds = %8404, %8396
  %8408 = add nuw nsw i64 %8397, 1
  %8409 = call zeroext i8 @randombit()
  %8410 = getelementptr inbounds i8, i8* %1, i64 %8408
  store i8 %8409, i8* %8410, align 1
  %8411 = getelementptr inbounds i8, i8* %1, i64 %8408
  %8412 = load i8, i8* %8411, align 1
  %8413 = zext i8 %8412 to i32
  %8414 = icmp eq i32 %8413, 0
  br i1 %8414, label %8415, label %8418

8415:                                             ; preds = %8407
  %8416 = mul nuw nsw i64 %8408, 16
  %8417 = getelementptr inbounds i8, i8* %0, i64 %8416
  call void @llvm.memset.p0i8.i64(i8* align 1 %8417, i8 0, i64 16, i1 false)
  br label %8418

8418:                                             ; preds = %8415, %8407
  %8419 = add nuw nsw i64 %8408, 1
  %8420 = call zeroext i8 @randombit()
  %8421 = getelementptr inbounds i8, i8* %1, i64 %8419
  store i8 %8420, i8* %8421, align 1
  %8422 = getelementptr inbounds i8, i8* %1, i64 %8419
  %8423 = load i8, i8* %8422, align 1
  %8424 = zext i8 %8423 to i32
  %8425 = icmp eq i32 %8424, 0
  br i1 %8425, label %8426, label %8429

8426:                                             ; preds = %8418
  %8427 = mul nuw nsw i64 %8419, 16
  %8428 = getelementptr inbounds i8, i8* %0, i64 %8427
  call void @llvm.memset.p0i8.i64(i8* align 1 %8428, i8 0, i64 16, i1 false)
  br label %8429

8429:                                             ; preds = %8426, %8418
  %8430 = add nuw nsw i64 %8419, 1
  %8431 = call zeroext i8 @randombit()
  %8432 = getelementptr inbounds i8, i8* %1, i64 %8430
  store i8 %8431, i8* %8432, align 1
  %8433 = getelementptr inbounds i8, i8* %1, i64 %8430
  %8434 = load i8, i8* %8433, align 1
  %8435 = zext i8 %8434 to i32
  %8436 = icmp eq i32 %8435, 0
  br i1 %8436, label %8437, label %8440

8437:                                             ; preds = %8429
  %8438 = mul nuw nsw i64 %8430, 16
  %8439 = getelementptr inbounds i8, i8* %0, i64 %8438
  call void @llvm.memset.p0i8.i64(i8* align 1 %8439, i8 0, i64 16, i1 false)
  br label %8440

8440:                                             ; preds = %8437, %8429
  %8441 = add nuw nsw i64 %8430, 1
  %8442 = call zeroext i8 @randombit()
  %8443 = getelementptr inbounds i8, i8* %1, i64 %8441
  store i8 %8442, i8* %8443, align 1
  %8444 = getelementptr inbounds i8, i8* %1, i64 %8441
  %8445 = load i8, i8* %8444, align 1
  %8446 = zext i8 %8445 to i32
  %8447 = icmp eq i32 %8446, 0
  br i1 %8447, label %8448, label %8451

8448:                                             ; preds = %8440
  %8449 = mul nuw nsw i64 %8441, 16
  %8450 = getelementptr inbounds i8, i8* %0, i64 %8449
  call void @llvm.memset.p0i8.i64(i8* align 1 %8450, i8 0, i64 16, i1 false)
  br label %8451

8451:                                             ; preds = %8448, %8440
  %8452 = add nuw nsw i64 %8441, 1
  %8453 = call zeroext i8 @randombit()
  %8454 = getelementptr inbounds i8, i8* %1, i64 %8452
  store i8 %8453, i8* %8454, align 1
  %8455 = getelementptr inbounds i8, i8* %1, i64 %8452
  %8456 = load i8, i8* %8455, align 1
  %8457 = zext i8 %8456 to i32
  %8458 = icmp eq i32 %8457, 0
  br i1 %8458, label %8459, label %8462

8459:                                             ; preds = %8451
  %8460 = mul nuw nsw i64 %8452, 16
  %8461 = getelementptr inbounds i8, i8* %0, i64 %8460
  call void @llvm.memset.p0i8.i64(i8* align 1 %8461, i8 0, i64 16, i1 false)
  br label %8462

8462:                                             ; preds = %8459, %8451
  %8463 = add nuw nsw i64 %8452, 1
  %8464 = call zeroext i8 @randombit()
  %8465 = getelementptr inbounds i8, i8* %1, i64 %8463
  store i8 %8464, i8* %8465, align 1
  %8466 = getelementptr inbounds i8, i8* %1, i64 %8463
  %8467 = load i8, i8* %8466, align 1
  %8468 = zext i8 %8467 to i32
  %8469 = icmp eq i32 %8468, 0
  br i1 %8469, label %8470, label %8473

8470:                                             ; preds = %8462
  %8471 = mul nuw nsw i64 %8463, 16
  %8472 = getelementptr inbounds i8, i8* %0, i64 %8471
  call void @llvm.memset.p0i8.i64(i8* align 1 %8472, i8 0, i64 16, i1 false)
  br label %8473

8473:                                             ; preds = %8470, %8462
  %8474 = add nuw nsw i64 %8463, 1
  %8475 = call zeroext i8 @randombit()
  %8476 = getelementptr inbounds i8, i8* %1, i64 %8474
  store i8 %8475, i8* %8476, align 1
  %8477 = getelementptr inbounds i8, i8* %1, i64 %8474
  %8478 = load i8, i8* %8477, align 1
  %8479 = zext i8 %8478 to i32
  %8480 = icmp eq i32 %8479, 0
  br i1 %8480, label %8481, label %8484

8481:                                             ; preds = %8473
  %8482 = mul nuw nsw i64 %8474, 16
  %8483 = getelementptr inbounds i8, i8* %0, i64 %8482
  call void @llvm.memset.p0i8.i64(i8* align 1 %8483, i8 0, i64 16, i1 false)
  br label %8484

8484:                                             ; preds = %8481, %8473
  %8485 = add nuw nsw i64 %8474, 1
  %8486 = call zeroext i8 @randombit()
  %8487 = getelementptr inbounds i8, i8* %1, i64 %8485
  store i8 %8486, i8* %8487, align 1
  %8488 = getelementptr inbounds i8, i8* %1, i64 %8485
  %8489 = load i8, i8* %8488, align 1
  %8490 = zext i8 %8489 to i32
  %8491 = icmp eq i32 %8490, 0
  br i1 %8491, label %8492, label %8495

8492:                                             ; preds = %8484
  %8493 = mul nuw nsw i64 %8485, 16
  %8494 = getelementptr inbounds i8, i8* %0, i64 %8493
  call void @llvm.memset.p0i8.i64(i8* align 1 %8494, i8 0, i64 16, i1 false)
  br label %8495

8495:                                             ; preds = %8492, %8484
  %8496 = add nuw nsw i64 %8485, 1
  %8497 = call zeroext i8 @randombit()
  %8498 = getelementptr inbounds i8, i8* %1, i64 %8496
  store i8 %8497, i8* %8498, align 1
  %8499 = getelementptr inbounds i8, i8* %1, i64 %8496
  %8500 = load i8, i8* %8499, align 1
  %8501 = zext i8 %8500 to i32
  %8502 = icmp eq i32 %8501, 0
  br i1 %8502, label %8503, label %8506

8503:                                             ; preds = %8495
  %8504 = mul nuw nsw i64 %8496, 16
  %8505 = getelementptr inbounds i8, i8* %0, i64 %8504
  call void @llvm.memset.p0i8.i64(i8* align 1 %8505, i8 0, i64 16, i1 false)
  br label %8506

8506:                                             ; preds = %8503, %8495
  %8507 = add nuw nsw i64 %8496, 1
  %8508 = call zeroext i8 @randombit()
  %8509 = getelementptr inbounds i8, i8* %1, i64 %8507
  store i8 %8508, i8* %8509, align 1
  %8510 = getelementptr inbounds i8, i8* %1, i64 %8507
  %8511 = load i8, i8* %8510, align 1
  %8512 = zext i8 %8511 to i32
  %8513 = icmp eq i32 %8512, 0
  br i1 %8513, label %8514, label %8517

8514:                                             ; preds = %8506
  %8515 = mul nuw nsw i64 %8507, 16
  %8516 = getelementptr inbounds i8, i8* %0, i64 %8515
  call void @llvm.memset.p0i8.i64(i8* align 1 %8516, i8 0, i64 16, i1 false)
  br label %8517

8517:                                             ; preds = %8514, %8506
  %8518 = add nuw nsw i64 %8507, 1
  %8519 = call zeroext i8 @randombit()
  %8520 = getelementptr inbounds i8, i8* %1, i64 %8518
  store i8 %8519, i8* %8520, align 1
  %8521 = getelementptr inbounds i8, i8* %1, i64 %8518
  %8522 = load i8, i8* %8521, align 1
  %8523 = zext i8 %8522 to i32
  %8524 = icmp eq i32 %8523, 0
  br i1 %8524, label %8525, label %8528

8525:                                             ; preds = %8517
  %8526 = mul nuw nsw i64 %8518, 16
  %8527 = getelementptr inbounds i8, i8* %0, i64 %8526
  call void @llvm.memset.p0i8.i64(i8* align 1 %8527, i8 0, i64 16, i1 false)
  br label %8528

8528:                                             ; preds = %8525, %8517
  %8529 = add nuw nsw i64 %8518, 1
  %8530 = call zeroext i8 @randombit()
  %8531 = getelementptr inbounds i8, i8* %1, i64 %8529
  store i8 %8530, i8* %8531, align 1
  %8532 = getelementptr inbounds i8, i8* %1, i64 %8529
  %8533 = load i8, i8* %8532, align 1
  %8534 = zext i8 %8533 to i32
  %8535 = icmp eq i32 %8534, 0
  br i1 %8535, label %8536, label %8539

8536:                                             ; preds = %8528
  %8537 = mul nuw nsw i64 %8529, 16
  %8538 = getelementptr inbounds i8, i8* %0, i64 %8537
  call void @llvm.memset.p0i8.i64(i8* align 1 %8538, i8 0, i64 16, i1 false)
  br label %8539

8539:                                             ; preds = %8536, %8528
  %8540 = add nuw nsw i64 %8529, 1
  %8541 = call zeroext i8 @randombit()
  %8542 = getelementptr inbounds i8, i8* %1, i64 %8540
  store i8 %8541, i8* %8542, align 1
  %8543 = getelementptr inbounds i8, i8* %1, i64 %8540
  %8544 = load i8, i8* %8543, align 1
  %8545 = zext i8 %8544 to i32
  %8546 = icmp eq i32 %8545, 0
  br i1 %8546, label %8547, label %8550

8547:                                             ; preds = %8539
  %8548 = mul nuw nsw i64 %8540, 16
  %8549 = getelementptr inbounds i8, i8* %0, i64 %8548
  call void @llvm.memset.p0i8.i64(i8* align 1 %8549, i8 0, i64 16, i1 false)
  br label %8550

8550:                                             ; preds = %8547, %8539
  %8551 = add nuw nsw i64 %8540, 1
  %8552 = call zeroext i8 @randombit()
  %8553 = getelementptr inbounds i8, i8* %1, i64 %8551
  store i8 %8552, i8* %8553, align 1
  %8554 = getelementptr inbounds i8, i8* %1, i64 %8551
  %8555 = load i8, i8* %8554, align 1
  %8556 = zext i8 %8555 to i32
  %8557 = icmp eq i32 %8556, 0
  br i1 %8557, label %8558, label %8561

8558:                                             ; preds = %8550
  %8559 = mul nuw nsw i64 %8551, 16
  %8560 = getelementptr inbounds i8, i8* %0, i64 %8559
  call void @llvm.memset.p0i8.i64(i8* align 1 %8560, i8 0, i64 16, i1 false)
  br label %8561

8561:                                             ; preds = %8558, %8550
  %8562 = add nuw nsw i64 %8551, 1
  %8563 = call zeroext i8 @randombit()
  %8564 = getelementptr inbounds i8, i8* %1, i64 %8562
  store i8 %8563, i8* %8564, align 1
  %8565 = getelementptr inbounds i8, i8* %1, i64 %8562
  %8566 = load i8, i8* %8565, align 1
  %8567 = zext i8 %8566 to i32
  %8568 = icmp eq i32 %8567, 0
  br i1 %8568, label %8569, label %8572

8569:                                             ; preds = %8561
  %8570 = mul nuw nsw i64 %8562, 16
  %8571 = getelementptr inbounds i8, i8* %0, i64 %8570
  call void @llvm.memset.p0i8.i64(i8* align 1 %8571, i8 0, i64 16, i1 false)
  br label %8572

8572:                                             ; preds = %8569, %8561
  %8573 = add nuw nsw i64 %8562, 1
  %8574 = call zeroext i8 @randombit()
  %8575 = getelementptr inbounds i8, i8* %1, i64 %8573
  store i8 %8574, i8* %8575, align 1
  %8576 = getelementptr inbounds i8, i8* %1, i64 %8573
  %8577 = load i8, i8* %8576, align 1
  %8578 = zext i8 %8577 to i32
  %8579 = icmp eq i32 %8578, 0
  br i1 %8579, label %8580, label %8583

8580:                                             ; preds = %8572
  %8581 = mul nuw nsw i64 %8573, 16
  %8582 = getelementptr inbounds i8, i8* %0, i64 %8581
  call void @llvm.memset.p0i8.i64(i8* align 1 %8582, i8 0, i64 16, i1 false)
  br label %8583

8583:                                             ; preds = %8580, %8572
  %8584 = add nuw nsw i64 %8573, 1
  %8585 = call zeroext i8 @randombit()
  %8586 = getelementptr inbounds i8, i8* %1, i64 %8584
  store i8 %8585, i8* %8586, align 1
  %8587 = getelementptr inbounds i8, i8* %1, i64 %8584
  %8588 = load i8, i8* %8587, align 1
  %8589 = zext i8 %8588 to i32
  %8590 = icmp eq i32 %8589, 0
  br i1 %8590, label %8591, label %8594

8591:                                             ; preds = %8583
  %8592 = mul nuw nsw i64 %8584, 16
  %8593 = getelementptr inbounds i8, i8* %0, i64 %8592
  call void @llvm.memset.p0i8.i64(i8* align 1 %8593, i8 0, i64 16, i1 false)
  br label %8594

8594:                                             ; preds = %8591, %8583
  %8595 = add nuw nsw i64 %8584, 1
  %8596 = call zeroext i8 @randombit()
  %8597 = getelementptr inbounds i8, i8* %1, i64 %8595
  store i8 %8596, i8* %8597, align 1
  %8598 = getelementptr inbounds i8, i8* %1, i64 %8595
  %8599 = load i8, i8* %8598, align 1
  %8600 = zext i8 %8599 to i32
  %8601 = icmp eq i32 %8600, 0
  br i1 %8601, label %8602, label %8605

8602:                                             ; preds = %8594
  %8603 = mul nuw nsw i64 %8595, 16
  %8604 = getelementptr inbounds i8, i8* %0, i64 %8603
  call void @llvm.memset.p0i8.i64(i8* align 1 %8604, i8 0, i64 16, i1 false)
  br label %8605

8605:                                             ; preds = %8602, %8594
  %8606 = add nuw nsw i64 %8595, 1
  %8607 = call zeroext i8 @randombit()
  %8608 = getelementptr inbounds i8, i8* %1, i64 %8606
  store i8 %8607, i8* %8608, align 1
  %8609 = getelementptr inbounds i8, i8* %1, i64 %8606
  %8610 = load i8, i8* %8609, align 1
  %8611 = zext i8 %8610 to i32
  %8612 = icmp eq i32 %8611, 0
  br i1 %8612, label %8613, label %8616

8613:                                             ; preds = %8605
  %8614 = mul nuw nsw i64 %8606, 16
  %8615 = getelementptr inbounds i8, i8* %0, i64 %8614
  call void @llvm.memset.p0i8.i64(i8* align 1 %8615, i8 0, i64 16, i1 false)
  br label %8616

8616:                                             ; preds = %8613, %8605
  %8617 = add nuw nsw i64 %8606, 1
  %8618 = call zeroext i8 @randombit()
  %8619 = getelementptr inbounds i8, i8* %1, i64 %8617
  store i8 %8618, i8* %8619, align 1
  %8620 = getelementptr inbounds i8, i8* %1, i64 %8617
  %8621 = load i8, i8* %8620, align 1
  %8622 = zext i8 %8621 to i32
  %8623 = icmp eq i32 %8622, 0
  br i1 %8623, label %8624, label %8627

8624:                                             ; preds = %8616
  %8625 = mul nuw nsw i64 %8617, 16
  %8626 = getelementptr inbounds i8, i8* %0, i64 %8625
  call void @llvm.memset.p0i8.i64(i8* align 1 %8626, i8 0, i64 16, i1 false)
  br label %8627

8627:                                             ; preds = %8624, %8616
  %8628 = add nuw nsw i64 %8617, 1
  %8629 = call zeroext i8 @randombit()
  %8630 = getelementptr inbounds i8, i8* %1, i64 %8628
  store i8 %8629, i8* %8630, align 1
  %8631 = getelementptr inbounds i8, i8* %1, i64 %8628
  %8632 = load i8, i8* %8631, align 1
  %8633 = zext i8 %8632 to i32
  %8634 = icmp eq i32 %8633, 0
  br i1 %8634, label %8635, label %8638

8635:                                             ; preds = %8627
  %8636 = mul nuw nsw i64 %8628, 16
  %8637 = getelementptr inbounds i8, i8* %0, i64 %8636
  call void @llvm.memset.p0i8.i64(i8* align 1 %8637, i8 0, i64 16, i1 false)
  br label %8638

8638:                                             ; preds = %8635, %8627
  %8639 = add nuw nsw i64 %8628, 1
  %8640 = call zeroext i8 @randombit()
  %8641 = getelementptr inbounds i8, i8* %1, i64 %8639
  store i8 %8640, i8* %8641, align 1
  %8642 = getelementptr inbounds i8, i8* %1, i64 %8639
  %8643 = load i8, i8* %8642, align 1
  %8644 = zext i8 %8643 to i32
  %8645 = icmp eq i32 %8644, 0
  br i1 %8645, label %8646, label %8649

8646:                                             ; preds = %8638
  %8647 = mul nuw nsw i64 %8639, 16
  %8648 = getelementptr inbounds i8, i8* %0, i64 %8647
  call void @llvm.memset.p0i8.i64(i8* align 1 %8648, i8 0, i64 16, i1 false)
  br label %8649

8649:                                             ; preds = %8646, %8638
  %8650 = add nuw nsw i64 %8639, 1
  %8651 = call zeroext i8 @randombit()
  %8652 = getelementptr inbounds i8, i8* %1, i64 %8650
  store i8 %8651, i8* %8652, align 1
  %8653 = getelementptr inbounds i8, i8* %1, i64 %8650
  %8654 = load i8, i8* %8653, align 1
  %8655 = zext i8 %8654 to i32
  %8656 = icmp eq i32 %8655, 0
  br i1 %8656, label %8657, label %8660

8657:                                             ; preds = %8649
  %8658 = mul nuw nsw i64 %8650, 16
  %8659 = getelementptr inbounds i8, i8* %0, i64 %8658
  call void @llvm.memset.p0i8.i64(i8* align 1 %8659, i8 0, i64 16, i1 false)
  br label %8660

8660:                                             ; preds = %8657, %8649
  %8661 = add nuw nsw i64 %8650, 1
  %8662 = call zeroext i8 @randombit()
  %8663 = getelementptr inbounds i8, i8* %1, i64 %8661
  store i8 %8662, i8* %8663, align 1
  %8664 = getelementptr inbounds i8, i8* %1, i64 %8661
  %8665 = load i8, i8* %8664, align 1
  %8666 = zext i8 %8665 to i32
  %8667 = icmp eq i32 %8666, 0
  br i1 %8667, label %8668, label %8671

8668:                                             ; preds = %8660
  %8669 = mul nuw nsw i64 %8661, 16
  %8670 = getelementptr inbounds i8, i8* %0, i64 %8669
  call void @llvm.memset.p0i8.i64(i8* align 1 %8670, i8 0, i64 16, i1 false)
  br label %8671

8671:                                             ; preds = %8668, %8660
  %8672 = add nuw nsw i64 %8661, 1
  %8673 = call zeroext i8 @randombit()
  %8674 = getelementptr inbounds i8, i8* %1, i64 %8672
  store i8 %8673, i8* %8674, align 1
  %8675 = getelementptr inbounds i8, i8* %1, i64 %8672
  %8676 = load i8, i8* %8675, align 1
  %8677 = zext i8 %8676 to i32
  %8678 = icmp eq i32 %8677, 0
  br i1 %8678, label %8679, label %8682

8679:                                             ; preds = %8671
  %8680 = mul nuw nsw i64 %8672, 16
  %8681 = getelementptr inbounds i8, i8* %0, i64 %8680
  call void @llvm.memset.p0i8.i64(i8* align 1 %8681, i8 0, i64 16, i1 false)
  br label %8682

8682:                                             ; preds = %8679, %8671
  %8683 = add nuw nsw i64 %8672, 1
  %8684 = call zeroext i8 @randombit()
  %8685 = getelementptr inbounds i8, i8* %1, i64 %8683
  store i8 %8684, i8* %8685, align 1
  %8686 = getelementptr inbounds i8, i8* %1, i64 %8683
  %8687 = load i8, i8* %8686, align 1
  %8688 = zext i8 %8687 to i32
  %8689 = icmp eq i32 %8688, 0
  br i1 %8689, label %8690, label %8693

8690:                                             ; preds = %8682
  %8691 = mul nuw nsw i64 %8683, 16
  %8692 = getelementptr inbounds i8, i8* %0, i64 %8691
  call void @llvm.memset.p0i8.i64(i8* align 1 %8692, i8 0, i64 16, i1 false)
  br label %8693

8693:                                             ; preds = %8690, %8682
  %8694 = add nuw nsw i64 %8683, 1
  %8695 = call zeroext i8 @randombit()
  %8696 = getelementptr inbounds i8, i8* %1, i64 %8694
  store i8 %8695, i8* %8696, align 1
  %8697 = getelementptr inbounds i8, i8* %1, i64 %8694
  %8698 = load i8, i8* %8697, align 1
  %8699 = zext i8 %8698 to i32
  %8700 = icmp eq i32 %8699, 0
  br i1 %8700, label %8701, label %8704

8701:                                             ; preds = %8693
  %8702 = mul nuw nsw i64 %8694, 16
  %8703 = getelementptr inbounds i8, i8* %0, i64 %8702
  call void @llvm.memset.p0i8.i64(i8* align 1 %8703, i8 0, i64 16, i1 false)
  br label %8704

8704:                                             ; preds = %8701, %8693
  %8705 = add nuw nsw i64 %8694, 1
  %8706 = call zeroext i8 @randombit()
  %8707 = getelementptr inbounds i8, i8* %1, i64 %8705
  store i8 %8706, i8* %8707, align 1
  %8708 = getelementptr inbounds i8, i8* %1, i64 %8705
  %8709 = load i8, i8* %8708, align 1
  %8710 = zext i8 %8709 to i32
  %8711 = icmp eq i32 %8710, 0
  br i1 %8711, label %8712, label %8715

8712:                                             ; preds = %8704
  %8713 = mul nuw nsw i64 %8705, 16
  %8714 = getelementptr inbounds i8, i8* %0, i64 %8713
  call void @llvm.memset.p0i8.i64(i8* align 1 %8714, i8 0, i64 16, i1 false)
  br label %8715

8715:                                             ; preds = %8712, %8704
  %8716 = add nuw nsw i64 %8705, 1
  %8717 = call zeroext i8 @randombit()
  %8718 = getelementptr inbounds i8, i8* %1, i64 %8716
  store i8 %8717, i8* %8718, align 1
  %8719 = getelementptr inbounds i8, i8* %1, i64 %8716
  %8720 = load i8, i8* %8719, align 1
  %8721 = zext i8 %8720 to i32
  %8722 = icmp eq i32 %8721, 0
  br i1 %8722, label %8723, label %8726

8723:                                             ; preds = %8715
  %8724 = mul nuw nsw i64 %8716, 16
  %8725 = getelementptr inbounds i8, i8* %0, i64 %8724
  call void @llvm.memset.p0i8.i64(i8* align 1 %8725, i8 0, i64 16, i1 false)
  br label %8726

8726:                                             ; preds = %8723, %8715
  %8727 = add nuw nsw i64 %8716, 1
  %8728 = call zeroext i8 @randombit()
  %8729 = getelementptr inbounds i8, i8* %1, i64 %8727
  store i8 %8728, i8* %8729, align 1
  %8730 = getelementptr inbounds i8, i8* %1, i64 %8727
  %8731 = load i8, i8* %8730, align 1
  %8732 = zext i8 %8731 to i32
  %8733 = icmp eq i32 %8732, 0
  br i1 %8733, label %8734, label %8737

8734:                                             ; preds = %8726
  %8735 = mul nuw nsw i64 %8727, 16
  %8736 = getelementptr inbounds i8, i8* %0, i64 %8735
  call void @llvm.memset.p0i8.i64(i8* align 1 %8736, i8 0, i64 16, i1 false)
  br label %8737

8737:                                             ; preds = %8734, %8726
  %8738 = add nuw nsw i64 %8727, 1
  %8739 = call zeroext i8 @randombit()
  %8740 = getelementptr inbounds i8, i8* %1, i64 %8738
  store i8 %8739, i8* %8740, align 1
  %8741 = getelementptr inbounds i8, i8* %1, i64 %8738
  %8742 = load i8, i8* %8741, align 1
  %8743 = zext i8 %8742 to i32
  %8744 = icmp eq i32 %8743, 0
  br i1 %8744, label %8745, label %8748

8745:                                             ; preds = %8737
  %8746 = mul nuw nsw i64 %8738, 16
  %8747 = getelementptr inbounds i8, i8* %0, i64 %8746
  call void @llvm.memset.p0i8.i64(i8* align 1 %8747, i8 0, i64 16, i1 false)
  br label %8748

8748:                                             ; preds = %8745, %8737
  %8749 = add nuw nsw i64 %8738, 1
  %8750 = call zeroext i8 @randombit()
  %8751 = getelementptr inbounds i8, i8* %1, i64 %8749
  store i8 %8750, i8* %8751, align 1
  %8752 = getelementptr inbounds i8, i8* %1, i64 %8749
  %8753 = load i8, i8* %8752, align 1
  %8754 = zext i8 %8753 to i32
  %8755 = icmp eq i32 %8754, 0
  br i1 %8755, label %8756, label %8759

8756:                                             ; preds = %8748
  %8757 = mul nuw nsw i64 %8749, 16
  %8758 = getelementptr inbounds i8, i8* %0, i64 %8757
  call void @llvm.memset.p0i8.i64(i8* align 1 %8758, i8 0, i64 16, i1 false)
  br label %8759

8759:                                             ; preds = %8756, %8748
  %8760 = add nuw nsw i64 %8749, 1
  %8761 = call zeroext i8 @randombit()
  %8762 = getelementptr inbounds i8, i8* %1, i64 %8760
  store i8 %8761, i8* %8762, align 1
  %8763 = getelementptr inbounds i8, i8* %1, i64 %8760
  %8764 = load i8, i8* %8763, align 1
  %8765 = zext i8 %8764 to i32
  %8766 = icmp eq i32 %8765, 0
  br i1 %8766, label %8767, label %8770

8767:                                             ; preds = %8759
  %8768 = mul nuw nsw i64 %8760, 16
  %8769 = getelementptr inbounds i8, i8* %0, i64 %8768
  call void @llvm.memset.p0i8.i64(i8* align 1 %8769, i8 0, i64 16, i1 false)
  br label %8770

8770:                                             ; preds = %8767, %8759
  %8771 = add nuw nsw i64 %8760, 1
  %8772 = call zeroext i8 @randombit()
  %8773 = getelementptr inbounds i8, i8* %1, i64 %8771
  store i8 %8772, i8* %8773, align 1
  %8774 = getelementptr inbounds i8, i8* %1, i64 %8771
  %8775 = load i8, i8* %8774, align 1
  %8776 = zext i8 %8775 to i32
  %8777 = icmp eq i32 %8776, 0
  br i1 %8777, label %8778, label %8781

8778:                                             ; preds = %8770
  %8779 = mul nuw nsw i64 %8771, 16
  %8780 = getelementptr inbounds i8, i8* %0, i64 %8779
  call void @llvm.memset.p0i8.i64(i8* align 1 %8780, i8 0, i64 16, i1 false)
  br label %8781

8781:                                             ; preds = %8778, %8770
  %8782 = add nuw nsw i64 %8771, 1
  %8783 = call zeroext i8 @randombit()
  %8784 = getelementptr inbounds i8, i8* %1, i64 %8782
  store i8 %8783, i8* %8784, align 1
  %8785 = getelementptr inbounds i8, i8* %1, i64 %8782
  %8786 = load i8, i8* %8785, align 1
  %8787 = zext i8 %8786 to i32
  %8788 = icmp eq i32 %8787, 0
  br i1 %8788, label %8789, label %8792

8789:                                             ; preds = %8781
  %8790 = mul nuw nsw i64 %8782, 16
  %8791 = getelementptr inbounds i8, i8* %0, i64 %8790
  call void @llvm.memset.p0i8.i64(i8* align 1 %8791, i8 0, i64 16, i1 false)
  br label %8792

8792:                                             ; preds = %8789, %8781
  %8793 = add nuw nsw i64 %8782, 1
  %8794 = call zeroext i8 @randombit()
  %8795 = getelementptr inbounds i8, i8* %1, i64 %8793
  store i8 %8794, i8* %8795, align 1
  %8796 = getelementptr inbounds i8, i8* %1, i64 %8793
  %8797 = load i8, i8* %8796, align 1
  %8798 = zext i8 %8797 to i32
  %8799 = icmp eq i32 %8798, 0
  br i1 %8799, label %8800, label %8803

8800:                                             ; preds = %8792
  %8801 = mul nuw nsw i64 %8793, 16
  %8802 = getelementptr inbounds i8, i8* %0, i64 %8801
  call void @llvm.memset.p0i8.i64(i8* align 1 %8802, i8 0, i64 16, i1 false)
  br label %8803

8803:                                             ; preds = %8800, %8792
  %8804 = add nuw nsw i64 %8793, 1
  %8805 = call zeroext i8 @randombit()
  %8806 = getelementptr inbounds i8, i8* %1, i64 %8804
  store i8 %8805, i8* %8806, align 1
  %8807 = getelementptr inbounds i8, i8* %1, i64 %8804
  %8808 = load i8, i8* %8807, align 1
  %8809 = zext i8 %8808 to i32
  %8810 = icmp eq i32 %8809, 0
  br i1 %8810, label %8811, label %8814

8811:                                             ; preds = %8803
  %8812 = mul nuw nsw i64 %8804, 16
  %8813 = getelementptr inbounds i8, i8* %0, i64 %8812
  call void @llvm.memset.p0i8.i64(i8* align 1 %8813, i8 0, i64 16, i1 false)
  br label %8814

8814:                                             ; preds = %8811, %8803
  %8815 = add nuw nsw i64 %8804, 1
  %8816 = call zeroext i8 @randombit()
  %8817 = getelementptr inbounds i8, i8* %1, i64 %8815
  store i8 %8816, i8* %8817, align 1
  %8818 = getelementptr inbounds i8, i8* %1, i64 %8815
  %8819 = load i8, i8* %8818, align 1
  %8820 = zext i8 %8819 to i32
  %8821 = icmp eq i32 %8820, 0
  br i1 %8821, label %8822, label %8825

8822:                                             ; preds = %8814
  %8823 = mul nuw nsw i64 %8815, 16
  %8824 = getelementptr inbounds i8, i8* %0, i64 %8823
  call void @llvm.memset.p0i8.i64(i8* align 1 %8824, i8 0, i64 16, i1 false)
  br label %8825

8825:                                             ; preds = %8822, %8814
  %8826 = add nuw nsw i64 %8815, 1
  %8827 = call zeroext i8 @randombit()
  %8828 = getelementptr inbounds i8, i8* %1, i64 %8826
  store i8 %8827, i8* %8828, align 1
  %8829 = getelementptr inbounds i8, i8* %1, i64 %8826
  %8830 = load i8, i8* %8829, align 1
  %8831 = zext i8 %8830 to i32
  %8832 = icmp eq i32 %8831, 0
  br i1 %8832, label %8833, label %8836

8833:                                             ; preds = %8825
  %8834 = mul nuw nsw i64 %8826, 16
  %8835 = getelementptr inbounds i8, i8* %0, i64 %8834
  call void @llvm.memset.p0i8.i64(i8* align 1 %8835, i8 0, i64 16, i1 false)
  br label %8836

8836:                                             ; preds = %8833, %8825
  %8837 = add nuw nsw i64 %8826, 1
  %8838 = call zeroext i8 @randombit()
  %8839 = getelementptr inbounds i8, i8* %1, i64 %8837
  store i8 %8838, i8* %8839, align 1
  %8840 = getelementptr inbounds i8, i8* %1, i64 %8837
  %8841 = load i8, i8* %8840, align 1
  %8842 = zext i8 %8841 to i32
  %8843 = icmp eq i32 %8842, 0
  br i1 %8843, label %8844, label %8847

8844:                                             ; preds = %8836
  %8845 = mul nuw nsw i64 %8837, 16
  %8846 = getelementptr inbounds i8, i8* %0, i64 %8845
  call void @llvm.memset.p0i8.i64(i8* align 1 %8846, i8 0, i64 16, i1 false)
  br label %8847

8847:                                             ; preds = %8844, %8836
  %8848 = add nuw nsw i64 %8837, 1
  %8849 = call zeroext i8 @randombit()
  %8850 = getelementptr inbounds i8, i8* %1, i64 %8848
  store i8 %8849, i8* %8850, align 1
  %8851 = getelementptr inbounds i8, i8* %1, i64 %8848
  %8852 = load i8, i8* %8851, align 1
  %8853 = zext i8 %8852 to i32
  %8854 = icmp eq i32 %8853, 0
  br i1 %8854, label %8855, label %8858

8855:                                             ; preds = %8847
  %8856 = mul nuw nsw i64 %8848, 16
  %8857 = getelementptr inbounds i8, i8* %0, i64 %8856
  call void @llvm.memset.p0i8.i64(i8* align 1 %8857, i8 0, i64 16, i1 false)
  br label %8858

8858:                                             ; preds = %8855, %8847
  %8859 = add nuw nsw i64 %8848, 1
  %8860 = call zeroext i8 @randombit()
  %8861 = getelementptr inbounds i8, i8* %1, i64 %8859
  store i8 %8860, i8* %8861, align 1
  %8862 = getelementptr inbounds i8, i8* %1, i64 %8859
  %8863 = load i8, i8* %8862, align 1
  %8864 = zext i8 %8863 to i32
  %8865 = icmp eq i32 %8864, 0
  br i1 %8865, label %8866, label %8869

8866:                                             ; preds = %8858
  %8867 = mul nuw nsw i64 %8859, 16
  %8868 = getelementptr inbounds i8, i8* %0, i64 %8867
  call void @llvm.memset.p0i8.i64(i8* align 1 %8868, i8 0, i64 16, i1 false)
  br label %8869

8869:                                             ; preds = %8866, %8858
  %8870 = add nuw nsw i64 %8859, 1
  %8871 = call zeroext i8 @randombit()
  %8872 = getelementptr inbounds i8, i8* %1, i64 %8870
  store i8 %8871, i8* %8872, align 1
  %8873 = getelementptr inbounds i8, i8* %1, i64 %8870
  %8874 = load i8, i8* %8873, align 1
  %8875 = zext i8 %8874 to i32
  %8876 = icmp eq i32 %8875, 0
  br i1 %8876, label %8877, label %8880

8877:                                             ; preds = %8869
  %8878 = mul nuw nsw i64 %8870, 16
  %8879 = getelementptr inbounds i8, i8* %0, i64 %8878
  call void @llvm.memset.p0i8.i64(i8* align 1 %8879, i8 0, i64 16, i1 false)
  br label %8880

8880:                                             ; preds = %8877, %8869
  %8881 = add nuw nsw i64 %8870, 1
  %8882 = call zeroext i8 @randombit()
  %8883 = getelementptr inbounds i8, i8* %1, i64 %8881
  store i8 %8882, i8* %8883, align 1
  %8884 = getelementptr inbounds i8, i8* %1, i64 %8881
  %8885 = load i8, i8* %8884, align 1
  %8886 = zext i8 %8885 to i32
  %8887 = icmp eq i32 %8886, 0
  br i1 %8887, label %8888, label %8891

8888:                                             ; preds = %8880
  %8889 = mul nuw nsw i64 %8881, 16
  %8890 = getelementptr inbounds i8, i8* %0, i64 %8889
  call void @llvm.memset.p0i8.i64(i8* align 1 %8890, i8 0, i64 16, i1 false)
  br label %8891

8891:                                             ; preds = %8888, %8880
  %8892 = add nuw nsw i64 %8881, 1
  %8893 = call zeroext i8 @randombit()
  %8894 = getelementptr inbounds i8, i8* %1, i64 %8892
  store i8 %8893, i8* %8894, align 1
  %8895 = getelementptr inbounds i8, i8* %1, i64 %8892
  %8896 = load i8, i8* %8895, align 1
  %8897 = zext i8 %8896 to i32
  %8898 = icmp eq i32 %8897, 0
  br i1 %8898, label %8899, label %8902

8899:                                             ; preds = %8891
  %8900 = mul nuw nsw i64 %8892, 16
  %8901 = getelementptr inbounds i8, i8* %0, i64 %8900
  call void @llvm.memset.p0i8.i64(i8* align 1 %8901, i8 0, i64 16, i1 false)
  br label %8902

8902:                                             ; preds = %8899, %8891
  %8903 = add nuw nsw i64 %8892, 1
  %8904 = call zeroext i8 @randombit()
  %8905 = getelementptr inbounds i8, i8* %1, i64 %8903
  store i8 %8904, i8* %8905, align 1
  %8906 = getelementptr inbounds i8, i8* %1, i64 %8903
  %8907 = load i8, i8* %8906, align 1
  %8908 = zext i8 %8907 to i32
  %8909 = icmp eq i32 %8908, 0
  br i1 %8909, label %8910, label %8913

8910:                                             ; preds = %8902
  %8911 = mul nuw nsw i64 %8903, 16
  %8912 = getelementptr inbounds i8, i8* %0, i64 %8911
  call void @llvm.memset.p0i8.i64(i8* align 1 %8912, i8 0, i64 16, i1 false)
  br label %8913

8913:                                             ; preds = %8910, %8902
  %8914 = add nuw nsw i64 %8903, 1
  %8915 = call zeroext i8 @randombit()
  %8916 = getelementptr inbounds i8, i8* %1, i64 %8914
  store i8 %8915, i8* %8916, align 1
  %8917 = getelementptr inbounds i8, i8* %1, i64 %8914
  %8918 = load i8, i8* %8917, align 1
  %8919 = zext i8 %8918 to i32
  %8920 = icmp eq i32 %8919, 0
  br i1 %8920, label %8921, label %8924

8921:                                             ; preds = %8913
  %8922 = mul nuw nsw i64 %8914, 16
  %8923 = getelementptr inbounds i8, i8* %0, i64 %8922
  call void @llvm.memset.p0i8.i64(i8* align 1 %8923, i8 0, i64 16, i1 false)
  br label %8924

8924:                                             ; preds = %8921, %8913
  %8925 = add nuw nsw i64 %8914, 1
  %8926 = call zeroext i8 @randombit()
  %8927 = getelementptr inbounds i8, i8* %1, i64 %8925
  store i8 %8926, i8* %8927, align 1
  %8928 = getelementptr inbounds i8, i8* %1, i64 %8925
  %8929 = load i8, i8* %8928, align 1
  %8930 = zext i8 %8929 to i32
  %8931 = icmp eq i32 %8930, 0
  br i1 %8931, label %8932, label %8935

8932:                                             ; preds = %8924
  %8933 = mul nuw nsw i64 %8925, 16
  %8934 = getelementptr inbounds i8, i8* %0, i64 %8933
  call void @llvm.memset.p0i8.i64(i8* align 1 %8934, i8 0, i64 16, i1 false)
  br label %8935

8935:                                             ; preds = %8932, %8924
  %8936 = add nuw nsw i64 %8925, 1
  %8937 = call zeroext i8 @randombit()
  %8938 = getelementptr inbounds i8, i8* %1, i64 %8936
  store i8 %8937, i8* %8938, align 1
  %8939 = getelementptr inbounds i8, i8* %1, i64 %8936
  %8940 = load i8, i8* %8939, align 1
  %8941 = zext i8 %8940 to i32
  %8942 = icmp eq i32 %8941, 0
  br i1 %8942, label %8943, label %8946

8943:                                             ; preds = %8935
  %8944 = mul nuw nsw i64 %8936, 16
  %8945 = getelementptr inbounds i8, i8* %0, i64 %8944
  call void @llvm.memset.p0i8.i64(i8* align 1 %8945, i8 0, i64 16, i1 false)
  br label %8946

8946:                                             ; preds = %8943, %8935
  %8947 = add nuw nsw i64 %8936, 1
  %8948 = call zeroext i8 @randombit()
  %8949 = getelementptr inbounds i8, i8* %1, i64 %8947
  store i8 %8948, i8* %8949, align 1
  %8950 = getelementptr inbounds i8, i8* %1, i64 %8947
  %8951 = load i8, i8* %8950, align 1
  %8952 = zext i8 %8951 to i32
  %8953 = icmp eq i32 %8952, 0
  br i1 %8953, label %8954, label %8957

8954:                                             ; preds = %8946
  %8955 = mul nuw nsw i64 %8947, 16
  %8956 = getelementptr inbounds i8, i8* %0, i64 %8955
  call void @llvm.memset.p0i8.i64(i8* align 1 %8956, i8 0, i64 16, i1 false)
  br label %8957

8957:                                             ; preds = %8954, %8946
  %8958 = add nuw nsw i64 %8947, 1
  %8959 = call zeroext i8 @randombit()
  %8960 = getelementptr inbounds i8, i8* %1, i64 %8958
  store i8 %8959, i8* %8960, align 1
  %8961 = getelementptr inbounds i8, i8* %1, i64 %8958
  %8962 = load i8, i8* %8961, align 1
  %8963 = zext i8 %8962 to i32
  %8964 = icmp eq i32 %8963, 0
  br i1 %8964, label %8965, label %8968

8965:                                             ; preds = %8957
  %8966 = mul nuw nsw i64 %8958, 16
  %8967 = getelementptr inbounds i8, i8* %0, i64 %8966
  call void @llvm.memset.p0i8.i64(i8* align 1 %8967, i8 0, i64 16, i1 false)
  br label %8968

8968:                                             ; preds = %8965, %8957
  %8969 = add nuw nsw i64 %8958, 1
  %8970 = call zeroext i8 @randombit()
  %8971 = getelementptr inbounds i8, i8* %1, i64 %8969
  store i8 %8970, i8* %8971, align 1
  %8972 = getelementptr inbounds i8, i8* %1, i64 %8969
  %8973 = load i8, i8* %8972, align 1
  %8974 = zext i8 %8973 to i32
  %8975 = icmp eq i32 %8974, 0
  br i1 %8975, label %8976, label %8979

8976:                                             ; preds = %8968
  %8977 = mul nuw nsw i64 %8969, 16
  %8978 = getelementptr inbounds i8, i8* %0, i64 %8977
  call void @llvm.memset.p0i8.i64(i8* align 1 %8978, i8 0, i64 16, i1 false)
  br label %8979

8979:                                             ; preds = %8976, %8968
  %8980 = add nuw nsw i64 %8969, 1
  %8981 = call zeroext i8 @randombit()
  %8982 = getelementptr inbounds i8, i8* %1, i64 %8980
  store i8 %8981, i8* %8982, align 1
  %8983 = getelementptr inbounds i8, i8* %1, i64 %8980
  %8984 = load i8, i8* %8983, align 1
  %8985 = zext i8 %8984 to i32
  %8986 = icmp eq i32 %8985, 0
  br i1 %8986, label %8987, label %8990

8987:                                             ; preds = %8979
  %8988 = mul nuw nsw i64 %8980, 16
  %8989 = getelementptr inbounds i8, i8* %0, i64 %8988
  call void @llvm.memset.p0i8.i64(i8* align 1 %8989, i8 0, i64 16, i1 false)
  br label %8990

8990:                                             ; preds = %8987, %8979
  %8991 = add nuw nsw i64 %8980, 1
  %8992 = call zeroext i8 @randombit()
  %8993 = getelementptr inbounds i8, i8* %1, i64 %8991
  store i8 %8992, i8* %8993, align 1
  %8994 = getelementptr inbounds i8, i8* %1, i64 %8991
  %8995 = load i8, i8* %8994, align 1
  %8996 = zext i8 %8995 to i32
  %8997 = icmp eq i32 %8996, 0
  br i1 %8997, label %8998, label %9001

8998:                                             ; preds = %8990
  %8999 = mul nuw nsw i64 %8991, 16
  %9000 = getelementptr inbounds i8, i8* %0, i64 %8999
  call void @llvm.memset.p0i8.i64(i8* align 1 %9000, i8 0, i64 16, i1 false)
  br label %9001

9001:                                             ; preds = %8998, %8990
  %9002 = add nuw nsw i64 %8991, 1
  %9003 = call zeroext i8 @randombit()
  %9004 = getelementptr inbounds i8, i8* %1, i64 %9002
  store i8 %9003, i8* %9004, align 1
  %9005 = getelementptr inbounds i8, i8* %1, i64 %9002
  %9006 = load i8, i8* %9005, align 1
  %9007 = zext i8 %9006 to i32
  %9008 = icmp eq i32 %9007, 0
  br i1 %9008, label %9009, label %9012

9009:                                             ; preds = %9001
  %9010 = mul nuw nsw i64 %9002, 16
  %9011 = getelementptr inbounds i8, i8* %0, i64 %9010
  call void @llvm.memset.p0i8.i64(i8* align 1 %9011, i8 0, i64 16, i1 false)
  br label %9012

9012:                                             ; preds = %9009, %9001
  %9013 = add nuw nsw i64 %9002, 1
  %9014 = call zeroext i8 @randombit()
  %9015 = getelementptr inbounds i8, i8* %1, i64 %9013
  store i8 %9014, i8* %9015, align 1
  %9016 = getelementptr inbounds i8, i8* %1, i64 %9013
  %9017 = load i8, i8* %9016, align 1
  %9018 = zext i8 %9017 to i32
  %9019 = icmp eq i32 %9018, 0
  br i1 %9019, label %9020, label %9023

9020:                                             ; preds = %9012
  %9021 = mul nuw nsw i64 %9013, 16
  %9022 = getelementptr inbounds i8, i8* %0, i64 %9021
  call void @llvm.memset.p0i8.i64(i8* align 1 %9022, i8 0, i64 16, i1 false)
  br label %9023

9023:                                             ; preds = %9020, %9012
  %9024 = add nuw nsw i64 %9013, 1
  %9025 = call zeroext i8 @randombit()
  %9026 = getelementptr inbounds i8, i8* %1, i64 %9024
  store i8 %9025, i8* %9026, align 1
  %9027 = getelementptr inbounds i8, i8* %1, i64 %9024
  %9028 = load i8, i8* %9027, align 1
  %9029 = zext i8 %9028 to i32
  %9030 = icmp eq i32 %9029, 0
  br i1 %9030, label %9031, label %9034

9031:                                             ; preds = %9023
  %9032 = mul nuw nsw i64 %9024, 16
  %9033 = getelementptr inbounds i8, i8* %0, i64 %9032
  call void @llvm.memset.p0i8.i64(i8* align 1 %9033, i8 0, i64 16, i1 false)
  br label %9034

9034:                                             ; preds = %9031, %9023
  %9035 = add nuw nsw i64 %9024, 1
  %9036 = call zeroext i8 @randombit()
  %9037 = getelementptr inbounds i8, i8* %1, i64 %9035
  store i8 %9036, i8* %9037, align 1
  %9038 = getelementptr inbounds i8, i8* %1, i64 %9035
  %9039 = load i8, i8* %9038, align 1
  %9040 = zext i8 %9039 to i32
  %9041 = icmp eq i32 %9040, 0
  br i1 %9041, label %9042, label %9045

9042:                                             ; preds = %9034
  %9043 = mul nuw nsw i64 %9035, 16
  %9044 = getelementptr inbounds i8, i8* %0, i64 %9043
  call void @llvm.memset.p0i8.i64(i8* align 1 %9044, i8 0, i64 16, i1 false)
  br label %9045

9045:                                             ; preds = %9042, %9034
  %9046 = add nuw nsw i64 %9035, 1
  %9047 = call zeroext i8 @randombit()
  %9048 = getelementptr inbounds i8, i8* %1, i64 %9046
  store i8 %9047, i8* %9048, align 1
  %9049 = getelementptr inbounds i8, i8* %1, i64 %9046
  %9050 = load i8, i8* %9049, align 1
  %9051 = zext i8 %9050 to i32
  %9052 = icmp eq i32 %9051, 0
  br i1 %9052, label %9053, label %9056

9053:                                             ; preds = %9045
  %9054 = mul nuw nsw i64 %9046, 16
  %9055 = getelementptr inbounds i8, i8* %0, i64 %9054
  call void @llvm.memset.p0i8.i64(i8* align 1 %9055, i8 0, i64 16, i1 false)
  br label %9056

9056:                                             ; preds = %9053, %9045
  %9057 = add nuw nsw i64 %9046, 1
  %9058 = call zeroext i8 @randombit()
  %9059 = getelementptr inbounds i8, i8* %1, i64 %9057
  store i8 %9058, i8* %9059, align 1
  %9060 = getelementptr inbounds i8, i8* %1, i64 %9057
  %9061 = load i8, i8* %9060, align 1
  %9062 = zext i8 %9061 to i32
  %9063 = icmp eq i32 %9062, 0
  br i1 %9063, label %9064, label %9067

9064:                                             ; preds = %9056
  %9065 = mul nuw nsw i64 %9057, 16
  %9066 = getelementptr inbounds i8, i8* %0, i64 %9065
  call void @llvm.memset.p0i8.i64(i8* align 1 %9066, i8 0, i64 16, i1 false)
  br label %9067

9067:                                             ; preds = %9064, %9056
  %9068 = add nuw nsw i64 %9057, 1
  %9069 = call zeroext i8 @randombit()
  %9070 = getelementptr inbounds i8, i8* %1, i64 %9068
  store i8 %9069, i8* %9070, align 1
  %9071 = getelementptr inbounds i8, i8* %1, i64 %9068
  %9072 = load i8, i8* %9071, align 1
  %9073 = zext i8 %9072 to i32
  %9074 = icmp eq i32 %9073, 0
  br i1 %9074, label %9075, label %9078

9075:                                             ; preds = %9067
  %9076 = mul nuw nsw i64 %9068, 16
  %9077 = getelementptr inbounds i8, i8* %0, i64 %9076
  call void @llvm.memset.p0i8.i64(i8* align 1 %9077, i8 0, i64 16, i1 false)
  br label %9078

9078:                                             ; preds = %9075, %9067
  %9079 = add nuw nsw i64 %9068, 1
  %9080 = call zeroext i8 @randombit()
  %9081 = getelementptr inbounds i8, i8* %1, i64 %9079
  store i8 %9080, i8* %9081, align 1
  %9082 = getelementptr inbounds i8, i8* %1, i64 %9079
  %9083 = load i8, i8* %9082, align 1
  %9084 = zext i8 %9083 to i32
  %9085 = icmp eq i32 %9084, 0
  br i1 %9085, label %9086, label %9089

9086:                                             ; preds = %9078
  %9087 = mul nuw nsw i64 %9079, 16
  %9088 = getelementptr inbounds i8, i8* %0, i64 %9087
  call void @llvm.memset.p0i8.i64(i8* align 1 %9088, i8 0, i64 16, i1 false)
  br label %9089

9089:                                             ; preds = %9086, %9078
  %9090 = add nuw nsw i64 %9079, 1
  %9091 = call zeroext i8 @randombit()
  %9092 = getelementptr inbounds i8, i8* %1, i64 %9090
  store i8 %9091, i8* %9092, align 1
  %9093 = getelementptr inbounds i8, i8* %1, i64 %9090
  %9094 = load i8, i8* %9093, align 1
  %9095 = zext i8 %9094 to i32
  %9096 = icmp eq i32 %9095, 0
  br i1 %9096, label %9097, label %9100

9097:                                             ; preds = %9089
  %9098 = mul nuw nsw i64 %9090, 16
  %9099 = getelementptr inbounds i8, i8* %0, i64 %9098
  call void @llvm.memset.p0i8.i64(i8* align 1 %9099, i8 0, i64 16, i1 false)
  br label %9100

9100:                                             ; preds = %9097, %9089
  %9101 = add nuw nsw i64 %9090, 1
  %9102 = call zeroext i8 @randombit()
  %9103 = getelementptr inbounds i8, i8* %1, i64 %9101
  store i8 %9102, i8* %9103, align 1
  %9104 = getelementptr inbounds i8, i8* %1, i64 %9101
  %9105 = load i8, i8* %9104, align 1
  %9106 = zext i8 %9105 to i32
  %9107 = icmp eq i32 %9106, 0
  br i1 %9107, label %9108, label %9111

9108:                                             ; preds = %9100
  %9109 = mul nuw nsw i64 %9101, 16
  %9110 = getelementptr inbounds i8, i8* %0, i64 %9109
  call void @llvm.memset.p0i8.i64(i8* align 1 %9110, i8 0, i64 16, i1 false)
  br label %9111

9111:                                             ; preds = %9108, %9100
  %9112 = add nuw nsw i64 %9101, 1
  %9113 = call zeroext i8 @randombit()
  %9114 = getelementptr inbounds i8, i8* %1, i64 %9112
  store i8 %9113, i8* %9114, align 1
  %9115 = getelementptr inbounds i8, i8* %1, i64 %9112
  %9116 = load i8, i8* %9115, align 1
  %9117 = zext i8 %9116 to i32
  %9118 = icmp eq i32 %9117, 0
  br i1 %9118, label %9119, label %9122

9119:                                             ; preds = %9111
  %9120 = mul nuw nsw i64 %9112, 16
  %9121 = getelementptr inbounds i8, i8* %0, i64 %9120
  call void @llvm.memset.p0i8.i64(i8* align 1 %9121, i8 0, i64 16, i1 false)
  br label %9122

9122:                                             ; preds = %9119, %9111
  %9123 = add nuw nsw i64 %9112, 1
  %9124 = call zeroext i8 @randombit()
  %9125 = getelementptr inbounds i8, i8* %1, i64 %9123
  store i8 %9124, i8* %9125, align 1
  %9126 = getelementptr inbounds i8, i8* %1, i64 %9123
  %9127 = load i8, i8* %9126, align 1
  %9128 = zext i8 %9127 to i32
  %9129 = icmp eq i32 %9128, 0
  br i1 %9129, label %9130, label %9133

9130:                                             ; preds = %9122
  %9131 = mul nuw nsw i64 %9123, 16
  %9132 = getelementptr inbounds i8, i8* %0, i64 %9131
  call void @llvm.memset.p0i8.i64(i8* align 1 %9132, i8 0, i64 16, i1 false)
  br label %9133

9133:                                             ; preds = %9130, %9122
  %9134 = add nuw nsw i64 %9123, 1
  %9135 = call zeroext i8 @randombit()
  %9136 = getelementptr inbounds i8, i8* %1, i64 %9134
  store i8 %9135, i8* %9136, align 1
  %9137 = getelementptr inbounds i8, i8* %1, i64 %9134
  %9138 = load i8, i8* %9137, align 1
  %9139 = zext i8 %9138 to i32
  %9140 = icmp eq i32 %9139, 0
  br i1 %9140, label %9141, label %9144

9141:                                             ; preds = %9133
  %9142 = mul nuw nsw i64 %9134, 16
  %9143 = getelementptr inbounds i8, i8* %0, i64 %9142
  call void @llvm.memset.p0i8.i64(i8* align 1 %9143, i8 0, i64 16, i1 false)
  br label %9144

9144:                                             ; preds = %9141, %9133
  %9145 = add nuw nsw i64 %9134, 1
  %9146 = call zeroext i8 @randombit()
  %9147 = getelementptr inbounds i8, i8* %1, i64 %9145
  store i8 %9146, i8* %9147, align 1
  %9148 = getelementptr inbounds i8, i8* %1, i64 %9145
  %9149 = load i8, i8* %9148, align 1
  %9150 = zext i8 %9149 to i32
  %9151 = icmp eq i32 %9150, 0
  br i1 %9151, label %9152, label %9155

9152:                                             ; preds = %9144
  %9153 = mul nuw nsw i64 %9145, 16
  %9154 = getelementptr inbounds i8, i8* %0, i64 %9153
  call void @llvm.memset.p0i8.i64(i8* align 1 %9154, i8 0, i64 16, i1 false)
  br label %9155

9155:                                             ; preds = %9152, %9144
  %9156 = add nuw nsw i64 %9145, 1
  %9157 = call zeroext i8 @randombit()
  %9158 = getelementptr inbounds i8, i8* %1, i64 %9156
  store i8 %9157, i8* %9158, align 1
  %9159 = getelementptr inbounds i8, i8* %1, i64 %9156
  %9160 = load i8, i8* %9159, align 1
  %9161 = zext i8 %9160 to i32
  %9162 = icmp eq i32 %9161, 0
  br i1 %9162, label %9163, label %9166

9163:                                             ; preds = %9155
  %9164 = mul nuw nsw i64 %9156, 16
  %9165 = getelementptr inbounds i8, i8* %0, i64 %9164
  call void @llvm.memset.p0i8.i64(i8* align 1 %9165, i8 0, i64 16, i1 false)
  br label %9166

9166:                                             ; preds = %9163, %9155
  %9167 = add nuw nsw i64 %9156, 1
  %9168 = call zeroext i8 @randombit()
  %9169 = getelementptr inbounds i8, i8* %1, i64 %9167
  store i8 %9168, i8* %9169, align 1
  %9170 = getelementptr inbounds i8, i8* %1, i64 %9167
  %9171 = load i8, i8* %9170, align 1
  %9172 = zext i8 %9171 to i32
  %9173 = icmp eq i32 %9172, 0
  br i1 %9173, label %9174, label %9177

9174:                                             ; preds = %9166
  %9175 = mul nuw nsw i64 %9167, 16
  %9176 = getelementptr inbounds i8, i8* %0, i64 %9175
  call void @llvm.memset.p0i8.i64(i8* align 1 %9176, i8 0, i64 16, i1 false)
  br label %9177

9177:                                             ; preds = %9174, %9166
  %9178 = add nuw nsw i64 %9167, 1
  %9179 = call zeroext i8 @randombit()
  %9180 = getelementptr inbounds i8, i8* %1, i64 %9178
  store i8 %9179, i8* %9180, align 1
  %9181 = getelementptr inbounds i8, i8* %1, i64 %9178
  %9182 = load i8, i8* %9181, align 1
  %9183 = zext i8 %9182 to i32
  %9184 = icmp eq i32 %9183, 0
  br i1 %9184, label %9185, label %9188

9185:                                             ; preds = %9177
  %9186 = mul nuw nsw i64 %9178, 16
  %9187 = getelementptr inbounds i8, i8* %0, i64 %9186
  call void @llvm.memset.p0i8.i64(i8* align 1 %9187, i8 0, i64 16, i1 false)
  br label %9188

9188:                                             ; preds = %9185, %9177
  %9189 = add nuw nsw i64 %9178, 1
  %9190 = call zeroext i8 @randombit()
  %9191 = getelementptr inbounds i8, i8* %1, i64 %9189
  store i8 %9190, i8* %9191, align 1
  %9192 = getelementptr inbounds i8, i8* %1, i64 %9189
  %9193 = load i8, i8* %9192, align 1
  %9194 = zext i8 %9193 to i32
  %9195 = icmp eq i32 %9194, 0
  br i1 %9195, label %9196, label %9199

9196:                                             ; preds = %9188
  %9197 = mul nuw nsw i64 %9189, 16
  %9198 = getelementptr inbounds i8, i8* %0, i64 %9197
  call void @llvm.memset.p0i8.i64(i8* align 1 %9198, i8 0, i64 16, i1 false)
  br label %9199

9199:                                             ; preds = %9196, %9188
  %9200 = add nuw nsw i64 %9189, 1
  %9201 = call zeroext i8 @randombit()
  %9202 = getelementptr inbounds i8, i8* %1, i64 %9200
  store i8 %9201, i8* %9202, align 1
  %9203 = getelementptr inbounds i8, i8* %1, i64 %9200
  %9204 = load i8, i8* %9203, align 1
  %9205 = zext i8 %9204 to i32
  %9206 = icmp eq i32 %9205, 0
  br i1 %9206, label %9207, label %9210

9207:                                             ; preds = %9199
  %9208 = mul nuw nsw i64 %9200, 16
  %9209 = getelementptr inbounds i8, i8* %0, i64 %9208
  call void @llvm.memset.p0i8.i64(i8* align 1 %9209, i8 0, i64 16, i1 false)
  br label %9210

9210:                                             ; preds = %9207, %9199
  %9211 = add nuw nsw i64 %9200, 1
  %9212 = call zeroext i8 @randombit()
  %9213 = getelementptr inbounds i8, i8* %1, i64 %9211
  store i8 %9212, i8* %9213, align 1
  %9214 = getelementptr inbounds i8, i8* %1, i64 %9211
  %9215 = load i8, i8* %9214, align 1
  %9216 = zext i8 %9215 to i32
  %9217 = icmp eq i32 %9216, 0
  br i1 %9217, label %9218, label %9221

9218:                                             ; preds = %9210
  %9219 = mul nuw nsw i64 %9211, 16
  %9220 = getelementptr inbounds i8, i8* %0, i64 %9219
  call void @llvm.memset.p0i8.i64(i8* align 1 %9220, i8 0, i64 16, i1 false)
  br label %9221

9221:                                             ; preds = %9218, %9210
  %9222 = add nuw nsw i64 %9211, 1
  %9223 = call zeroext i8 @randombit()
  %9224 = getelementptr inbounds i8, i8* %1, i64 %9222
  store i8 %9223, i8* %9224, align 1
  %9225 = getelementptr inbounds i8, i8* %1, i64 %9222
  %9226 = load i8, i8* %9225, align 1
  %9227 = zext i8 %9226 to i32
  %9228 = icmp eq i32 %9227, 0
  br i1 %9228, label %9229, label %9232

9229:                                             ; preds = %9221
  %9230 = mul nuw nsw i64 %9222, 16
  %9231 = getelementptr inbounds i8, i8* %0, i64 %9230
  call void @llvm.memset.p0i8.i64(i8* align 1 %9231, i8 0, i64 16, i1 false)
  br label %9232

9232:                                             ; preds = %9229, %9221
  %9233 = add nuw nsw i64 %9222, 1
  %9234 = call zeroext i8 @randombit()
  %9235 = getelementptr inbounds i8, i8* %1, i64 %9233
  store i8 %9234, i8* %9235, align 1
  %9236 = getelementptr inbounds i8, i8* %1, i64 %9233
  %9237 = load i8, i8* %9236, align 1
  %9238 = zext i8 %9237 to i32
  %9239 = icmp eq i32 %9238, 0
  br i1 %9239, label %9240, label %9243

9240:                                             ; preds = %9232
  %9241 = mul nuw nsw i64 %9233, 16
  %9242 = getelementptr inbounds i8, i8* %0, i64 %9241
  call void @llvm.memset.p0i8.i64(i8* align 1 %9242, i8 0, i64 16, i1 false)
  br label %9243

9243:                                             ; preds = %9240, %9232
  %9244 = add nuw nsw i64 %9233, 1
  %9245 = call zeroext i8 @randombit()
  %9246 = getelementptr inbounds i8, i8* %1, i64 %9244
  store i8 %9245, i8* %9246, align 1
  %9247 = getelementptr inbounds i8, i8* %1, i64 %9244
  %9248 = load i8, i8* %9247, align 1
  %9249 = zext i8 %9248 to i32
  %9250 = icmp eq i32 %9249, 0
  br i1 %9250, label %9251, label %9254

9251:                                             ; preds = %9243
  %9252 = mul nuw nsw i64 %9244, 16
  %9253 = getelementptr inbounds i8, i8* %0, i64 %9252
  call void @llvm.memset.p0i8.i64(i8* align 1 %9253, i8 0, i64 16, i1 false)
  br label %9254

9254:                                             ; preds = %9251, %9243
  %9255 = add nuw nsw i64 %9244, 1
  %9256 = call zeroext i8 @randombit()
  %9257 = getelementptr inbounds i8, i8* %1, i64 %9255
  store i8 %9256, i8* %9257, align 1
  %9258 = getelementptr inbounds i8, i8* %1, i64 %9255
  %9259 = load i8, i8* %9258, align 1
  %9260 = zext i8 %9259 to i32
  %9261 = icmp eq i32 %9260, 0
  br i1 %9261, label %9262, label %9265

9262:                                             ; preds = %9254
  %9263 = mul nuw nsw i64 %9255, 16
  %9264 = getelementptr inbounds i8, i8* %0, i64 %9263
  call void @llvm.memset.p0i8.i64(i8* align 1 %9264, i8 0, i64 16, i1 false)
  br label %9265

9265:                                             ; preds = %9262, %9254
  %9266 = add nuw nsw i64 %9255, 1
  %9267 = call zeroext i8 @randombit()
  %9268 = getelementptr inbounds i8, i8* %1, i64 %9266
  store i8 %9267, i8* %9268, align 1
  %9269 = getelementptr inbounds i8, i8* %1, i64 %9266
  %9270 = load i8, i8* %9269, align 1
  %9271 = zext i8 %9270 to i32
  %9272 = icmp eq i32 %9271, 0
  br i1 %9272, label %9273, label %9276

9273:                                             ; preds = %9265
  %9274 = mul nuw nsw i64 %9266, 16
  %9275 = getelementptr inbounds i8, i8* %0, i64 %9274
  call void @llvm.memset.p0i8.i64(i8* align 1 %9275, i8 0, i64 16, i1 false)
  br label %9276

9276:                                             ; preds = %9273, %9265
  %9277 = add nuw nsw i64 %9266, 1
  %9278 = call zeroext i8 @randombit()
  %9279 = getelementptr inbounds i8, i8* %1, i64 %9277
  store i8 %9278, i8* %9279, align 1
  %9280 = getelementptr inbounds i8, i8* %1, i64 %9277
  %9281 = load i8, i8* %9280, align 1
  %9282 = zext i8 %9281 to i32
  %9283 = icmp eq i32 %9282, 0
  br i1 %9283, label %9284, label %9287

9284:                                             ; preds = %9276
  %9285 = mul nuw nsw i64 %9277, 16
  %9286 = getelementptr inbounds i8, i8* %0, i64 %9285
  call void @llvm.memset.p0i8.i64(i8* align 1 %9286, i8 0, i64 16, i1 false)
  br label %9287

9287:                                             ; preds = %9284, %9276
  %9288 = add nuw nsw i64 %9277, 1
  %9289 = call zeroext i8 @randombit()
  %9290 = getelementptr inbounds i8, i8* %1, i64 %9288
  store i8 %9289, i8* %9290, align 1
  %9291 = getelementptr inbounds i8, i8* %1, i64 %9288
  %9292 = load i8, i8* %9291, align 1
  %9293 = zext i8 %9292 to i32
  %9294 = icmp eq i32 %9293, 0
  br i1 %9294, label %9295, label %9298

9295:                                             ; preds = %9287
  %9296 = mul nuw nsw i64 %9288, 16
  %9297 = getelementptr inbounds i8, i8* %0, i64 %9296
  call void @llvm.memset.p0i8.i64(i8* align 1 %9297, i8 0, i64 16, i1 false)
  br label %9298

9298:                                             ; preds = %9295, %9287
  %9299 = add nuw nsw i64 %9288, 1
  %9300 = call zeroext i8 @randombit()
  %9301 = getelementptr inbounds i8, i8* %1, i64 %9299
  store i8 %9300, i8* %9301, align 1
  %9302 = getelementptr inbounds i8, i8* %1, i64 %9299
  %9303 = load i8, i8* %9302, align 1
  %9304 = zext i8 %9303 to i32
  %9305 = icmp eq i32 %9304, 0
  br i1 %9305, label %9306, label %9309

9306:                                             ; preds = %9298
  %9307 = mul nuw nsw i64 %9299, 16
  %9308 = getelementptr inbounds i8, i8* %0, i64 %9307
  call void @llvm.memset.p0i8.i64(i8* align 1 %9308, i8 0, i64 16, i1 false)
  br label %9309

9309:                                             ; preds = %9306, %9298
  %9310 = add nuw nsw i64 %9299, 1
  %9311 = call zeroext i8 @randombit()
  %9312 = getelementptr inbounds i8, i8* %1, i64 %9310
  store i8 %9311, i8* %9312, align 1
  %9313 = getelementptr inbounds i8, i8* %1, i64 %9310
  %9314 = load i8, i8* %9313, align 1
  %9315 = zext i8 %9314 to i32
  %9316 = icmp eq i32 %9315, 0
  br i1 %9316, label %9317, label %9320

9317:                                             ; preds = %9309
  %9318 = mul nuw nsw i64 %9310, 16
  %9319 = getelementptr inbounds i8, i8* %0, i64 %9318
  call void @llvm.memset.p0i8.i64(i8* align 1 %9319, i8 0, i64 16, i1 false)
  br label %9320

9320:                                             ; preds = %9317, %9309
  %9321 = add nuw nsw i64 %9310, 1
  %9322 = call zeroext i8 @randombit()
  %9323 = getelementptr inbounds i8, i8* %1, i64 %9321
  store i8 %9322, i8* %9323, align 1
  %9324 = getelementptr inbounds i8, i8* %1, i64 %9321
  %9325 = load i8, i8* %9324, align 1
  %9326 = zext i8 %9325 to i32
  %9327 = icmp eq i32 %9326, 0
  br i1 %9327, label %9328, label %9331

9328:                                             ; preds = %9320
  %9329 = mul nuw nsw i64 %9321, 16
  %9330 = getelementptr inbounds i8, i8* %0, i64 %9329
  call void @llvm.memset.p0i8.i64(i8* align 1 %9330, i8 0, i64 16, i1 false)
  br label %9331

9331:                                             ; preds = %9328, %9320
  %9332 = add nuw nsw i64 %9321, 1
  %9333 = call zeroext i8 @randombit()
  %9334 = getelementptr inbounds i8, i8* %1, i64 %9332
  store i8 %9333, i8* %9334, align 1
  %9335 = getelementptr inbounds i8, i8* %1, i64 %9332
  %9336 = load i8, i8* %9335, align 1
  %9337 = zext i8 %9336 to i32
  %9338 = icmp eq i32 %9337, 0
  br i1 %9338, label %9339, label %9342

9339:                                             ; preds = %9331
  %9340 = mul nuw nsw i64 %9332, 16
  %9341 = getelementptr inbounds i8, i8* %0, i64 %9340
  call void @llvm.memset.p0i8.i64(i8* align 1 %9341, i8 0, i64 16, i1 false)
  br label %9342

9342:                                             ; preds = %9339, %9331
  %9343 = add nuw nsw i64 %9332, 1
  %9344 = call zeroext i8 @randombit()
  %9345 = getelementptr inbounds i8, i8* %1, i64 %9343
  store i8 %9344, i8* %9345, align 1
  %9346 = getelementptr inbounds i8, i8* %1, i64 %9343
  %9347 = load i8, i8* %9346, align 1
  %9348 = zext i8 %9347 to i32
  %9349 = icmp eq i32 %9348, 0
  br i1 %9349, label %9350, label %9353

9350:                                             ; preds = %9342
  %9351 = mul nuw nsw i64 %9343, 16
  %9352 = getelementptr inbounds i8, i8* %0, i64 %9351
  call void @llvm.memset.p0i8.i64(i8* align 1 %9352, i8 0, i64 16, i1 false)
  br label %9353

9353:                                             ; preds = %9350, %9342
  %9354 = add nuw nsw i64 %9343, 1
  %9355 = call zeroext i8 @randombit()
  %9356 = getelementptr inbounds i8, i8* %1, i64 %9354
  store i8 %9355, i8* %9356, align 1
  %9357 = getelementptr inbounds i8, i8* %1, i64 %9354
  %9358 = load i8, i8* %9357, align 1
  %9359 = zext i8 %9358 to i32
  %9360 = icmp eq i32 %9359, 0
  br i1 %9360, label %9361, label %9364

9361:                                             ; preds = %9353
  %9362 = mul nuw nsw i64 %9354, 16
  %9363 = getelementptr inbounds i8, i8* %0, i64 %9362
  call void @llvm.memset.p0i8.i64(i8* align 1 %9363, i8 0, i64 16, i1 false)
  br label %9364

9364:                                             ; preds = %9361, %9353
  %9365 = add nuw nsw i64 %9354, 1
  %9366 = call zeroext i8 @randombit()
  %9367 = getelementptr inbounds i8, i8* %1, i64 %9365
  store i8 %9366, i8* %9367, align 1
  %9368 = getelementptr inbounds i8, i8* %1, i64 %9365
  %9369 = load i8, i8* %9368, align 1
  %9370 = zext i8 %9369 to i32
  %9371 = icmp eq i32 %9370, 0
  br i1 %9371, label %9372, label %9375

9372:                                             ; preds = %9364
  %9373 = mul nuw nsw i64 %9365, 16
  %9374 = getelementptr inbounds i8, i8* %0, i64 %9373
  call void @llvm.memset.p0i8.i64(i8* align 1 %9374, i8 0, i64 16, i1 false)
  br label %9375

9375:                                             ; preds = %9372, %9364
  %9376 = add nuw nsw i64 %9365, 1
  %9377 = call zeroext i8 @randombit()
  %9378 = getelementptr inbounds i8, i8* %1, i64 %9376
  store i8 %9377, i8* %9378, align 1
  %9379 = getelementptr inbounds i8, i8* %1, i64 %9376
  %9380 = load i8, i8* %9379, align 1
  %9381 = zext i8 %9380 to i32
  %9382 = icmp eq i32 %9381, 0
  br i1 %9382, label %9383, label %9386

9383:                                             ; preds = %9375
  %9384 = mul nuw nsw i64 %9376, 16
  %9385 = getelementptr inbounds i8, i8* %0, i64 %9384
  call void @llvm.memset.p0i8.i64(i8* align 1 %9385, i8 0, i64 16, i1 false)
  br label %9386

9386:                                             ; preds = %9383, %9375
  %9387 = add nuw nsw i64 %9376, 1
  %9388 = call zeroext i8 @randombit()
  %9389 = getelementptr inbounds i8, i8* %1, i64 %9387
  store i8 %9388, i8* %9389, align 1
  %9390 = getelementptr inbounds i8, i8* %1, i64 %9387
  %9391 = load i8, i8* %9390, align 1
  %9392 = zext i8 %9391 to i32
  %9393 = icmp eq i32 %9392, 0
  br i1 %9393, label %9394, label %9397

9394:                                             ; preds = %9386
  %9395 = mul nuw nsw i64 %9387, 16
  %9396 = getelementptr inbounds i8, i8* %0, i64 %9395
  call void @llvm.memset.p0i8.i64(i8* align 1 %9396, i8 0, i64 16, i1 false)
  br label %9397

9397:                                             ; preds = %9394, %9386
  %9398 = add nuw nsw i64 %9387, 1
  %9399 = call zeroext i8 @randombit()
  %9400 = getelementptr inbounds i8, i8* %1, i64 %9398
  store i8 %9399, i8* %9400, align 1
  %9401 = getelementptr inbounds i8, i8* %1, i64 %9398
  %9402 = load i8, i8* %9401, align 1
  %9403 = zext i8 %9402 to i32
  %9404 = icmp eq i32 %9403, 0
  br i1 %9404, label %9405, label %9408

9405:                                             ; preds = %9397
  %9406 = mul nuw nsw i64 %9398, 16
  %9407 = getelementptr inbounds i8, i8* %0, i64 %9406
  call void @llvm.memset.p0i8.i64(i8* align 1 %9407, i8 0, i64 16, i1 false)
  br label %9408

9408:                                             ; preds = %9405, %9397
  %9409 = add nuw nsw i64 %9398, 1
  %9410 = call zeroext i8 @randombit()
  %9411 = getelementptr inbounds i8, i8* %1, i64 %9409
  store i8 %9410, i8* %9411, align 1
  %9412 = getelementptr inbounds i8, i8* %1, i64 %9409
  %9413 = load i8, i8* %9412, align 1
  %9414 = zext i8 %9413 to i32
  %9415 = icmp eq i32 %9414, 0
  br i1 %9415, label %9416, label %9419

9416:                                             ; preds = %9408
  %9417 = mul nuw nsw i64 %9409, 16
  %9418 = getelementptr inbounds i8, i8* %0, i64 %9417
  call void @llvm.memset.p0i8.i64(i8* align 1 %9418, i8 0, i64 16, i1 false)
  br label %9419

9419:                                             ; preds = %9416, %9408
  %9420 = add nuw nsw i64 %9409, 1
  %9421 = call zeroext i8 @randombit()
  %9422 = getelementptr inbounds i8, i8* %1, i64 %9420
  store i8 %9421, i8* %9422, align 1
  %9423 = getelementptr inbounds i8, i8* %1, i64 %9420
  %9424 = load i8, i8* %9423, align 1
  %9425 = zext i8 %9424 to i32
  %9426 = icmp eq i32 %9425, 0
  br i1 %9426, label %9427, label %9430

9427:                                             ; preds = %9419
  %9428 = mul nuw nsw i64 %9420, 16
  %9429 = getelementptr inbounds i8, i8* %0, i64 %9428
  call void @llvm.memset.p0i8.i64(i8* align 1 %9429, i8 0, i64 16, i1 false)
  br label %9430

9430:                                             ; preds = %9427, %9419
  %9431 = add nuw nsw i64 %9420, 1
  %9432 = call zeroext i8 @randombit()
  %9433 = getelementptr inbounds i8, i8* %1, i64 %9431
  store i8 %9432, i8* %9433, align 1
  %9434 = getelementptr inbounds i8, i8* %1, i64 %9431
  %9435 = load i8, i8* %9434, align 1
  %9436 = zext i8 %9435 to i32
  %9437 = icmp eq i32 %9436, 0
  br i1 %9437, label %9438, label %9441

9438:                                             ; preds = %9430
  %9439 = mul nuw nsw i64 %9431, 16
  %9440 = getelementptr inbounds i8, i8* %0, i64 %9439
  call void @llvm.memset.p0i8.i64(i8* align 1 %9440, i8 0, i64 16, i1 false)
  br label %9441

9441:                                             ; preds = %9438, %9430
  %9442 = add nuw nsw i64 %9431, 1
  %9443 = call zeroext i8 @randombit()
  %9444 = getelementptr inbounds i8, i8* %1, i64 %9442
  store i8 %9443, i8* %9444, align 1
  %9445 = getelementptr inbounds i8, i8* %1, i64 %9442
  %9446 = load i8, i8* %9445, align 1
  %9447 = zext i8 %9446 to i32
  %9448 = icmp eq i32 %9447, 0
  br i1 %9448, label %9449, label %9452

9449:                                             ; preds = %9441
  %9450 = mul nuw nsw i64 %9442, 16
  %9451 = getelementptr inbounds i8, i8* %0, i64 %9450
  call void @llvm.memset.p0i8.i64(i8* align 1 %9451, i8 0, i64 16, i1 false)
  br label %9452

9452:                                             ; preds = %9449, %9441
  %9453 = add nuw nsw i64 %9442, 1
  %9454 = call zeroext i8 @randombit()
  %9455 = getelementptr inbounds i8, i8* %1, i64 %9453
  store i8 %9454, i8* %9455, align 1
  %9456 = getelementptr inbounds i8, i8* %1, i64 %9453
  %9457 = load i8, i8* %9456, align 1
  %9458 = zext i8 %9457 to i32
  %9459 = icmp eq i32 %9458, 0
  br i1 %9459, label %9460, label %9463

9460:                                             ; preds = %9452
  %9461 = mul nuw nsw i64 %9453, 16
  %9462 = getelementptr inbounds i8, i8* %0, i64 %9461
  call void @llvm.memset.p0i8.i64(i8* align 1 %9462, i8 0, i64 16, i1 false)
  br label %9463

9463:                                             ; preds = %9460, %9452
  %9464 = add nuw nsw i64 %9453, 1
  %9465 = call zeroext i8 @randombit()
  %9466 = getelementptr inbounds i8, i8* %1, i64 %9464
  store i8 %9465, i8* %9466, align 1
  %9467 = getelementptr inbounds i8, i8* %1, i64 %9464
  %9468 = load i8, i8* %9467, align 1
  %9469 = zext i8 %9468 to i32
  %9470 = icmp eq i32 %9469, 0
  br i1 %9470, label %9471, label %9474

9471:                                             ; preds = %9463
  %9472 = mul nuw nsw i64 %9464, 16
  %9473 = getelementptr inbounds i8, i8* %0, i64 %9472
  call void @llvm.memset.p0i8.i64(i8* align 1 %9473, i8 0, i64 16, i1 false)
  br label %9474

9474:                                             ; preds = %9471, %9463
  %9475 = add nuw nsw i64 %9464, 1
  %9476 = call zeroext i8 @randombit()
  %9477 = getelementptr inbounds i8, i8* %1, i64 %9475
  store i8 %9476, i8* %9477, align 1
  %9478 = getelementptr inbounds i8, i8* %1, i64 %9475
  %9479 = load i8, i8* %9478, align 1
  %9480 = zext i8 %9479 to i32
  %9481 = icmp eq i32 %9480, 0
  br i1 %9481, label %9482, label %9485

9482:                                             ; preds = %9474
  %9483 = mul nuw nsw i64 %9475, 16
  %9484 = getelementptr inbounds i8, i8* %0, i64 %9483
  call void @llvm.memset.p0i8.i64(i8* align 1 %9484, i8 0, i64 16, i1 false)
  br label %9485

9485:                                             ; preds = %9482, %9474
  %9486 = add nuw nsw i64 %9475, 1
  %9487 = call zeroext i8 @randombit()
  %9488 = getelementptr inbounds i8, i8* %1, i64 %9486
  store i8 %9487, i8* %9488, align 1
  %9489 = getelementptr inbounds i8, i8* %1, i64 %9486
  %9490 = load i8, i8* %9489, align 1
  %9491 = zext i8 %9490 to i32
  %9492 = icmp eq i32 %9491, 0
  br i1 %9492, label %9493, label %9496

9493:                                             ; preds = %9485
  %9494 = mul nuw nsw i64 %9486, 16
  %9495 = getelementptr inbounds i8, i8* %0, i64 %9494
  call void @llvm.memset.p0i8.i64(i8* align 1 %9495, i8 0, i64 16, i1 false)
  br label %9496

9496:                                             ; preds = %9493, %9485
  %9497 = add nuw nsw i64 %9486, 1
  %9498 = call zeroext i8 @randombit()
  %9499 = getelementptr inbounds i8, i8* %1, i64 %9497
  store i8 %9498, i8* %9499, align 1
  %9500 = getelementptr inbounds i8, i8* %1, i64 %9497
  %9501 = load i8, i8* %9500, align 1
  %9502 = zext i8 %9501 to i32
  %9503 = icmp eq i32 %9502, 0
  br i1 %9503, label %9504, label %9507

9504:                                             ; preds = %9496
  %9505 = mul nuw nsw i64 %9497, 16
  %9506 = getelementptr inbounds i8, i8* %0, i64 %9505
  call void @llvm.memset.p0i8.i64(i8* align 1 %9506, i8 0, i64 16, i1 false)
  br label %9507

9507:                                             ; preds = %9504, %9496
  %9508 = add nuw nsw i64 %9497, 1
  %9509 = call zeroext i8 @randombit()
  %9510 = getelementptr inbounds i8, i8* %1, i64 %9508
  store i8 %9509, i8* %9510, align 1
  %9511 = getelementptr inbounds i8, i8* %1, i64 %9508
  %9512 = load i8, i8* %9511, align 1
  %9513 = zext i8 %9512 to i32
  %9514 = icmp eq i32 %9513, 0
  br i1 %9514, label %9515, label %9518

9515:                                             ; preds = %9507
  %9516 = mul nuw nsw i64 %9508, 16
  %9517 = getelementptr inbounds i8, i8* %0, i64 %9516
  call void @llvm.memset.p0i8.i64(i8* align 1 %9517, i8 0, i64 16, i1 false)
  br label %9518

9518:                                             ; preds = %9515, %9507
  %9519 = add nuw nsw i64 %9508, 1
  %9520 = call zeroext i8 @randombit()
  %9521 = getelementptr inbounds i8, i8* %1, i64 %9519
  store i8 %9520, i8* %9521, align 1
  %9522 = getelementptr inbounds i8, i8* %1, i64 %9519
  %9523 = load i8, i8* %9522, align 1
  %9524 = zext i8 %9523 to i32
  %9525 = icmp eq i32 %9524, 0
  br i1 %9525, label %9526, label %9529

9526:                                             ; preds = %9518
  %9527 = mul nuw nsw i64 %9519, 16
  %9528 = getelementptr inbounds i8, i8* %0, i64 %9527
  call void @llvm.memset.p0i8.i64(i8* align 1 %9528, i8 0, i64 16, i1 false)
  br label %9529

9529:                                             ; preds = %9526, %9518
  %9530 = add nuw nsw i64 %9519, 1
  %9531 = call zeroext i8 @randombit()
  %9532 = getelementptr inbounds i8, i8* %1, i64 %9530
  store i8 %9531, i8* %9532, align 1
  %9533 = getelementptr inbounds i8, i8* %1, i64 %9530
  %9534 = load i8, i8* %9533, align 1
  %9535 = zext i8 %9534 to i32
  %9536 = icmp eq i32 %9535, 0
  br i1 %9536, label %9537, label %9540

9537:                                             ; preds = %9529
  %9538 = mul nuw nsw i64 %9530, 16
  %9539 = getelementptr inbounds i8, i8* %0, i64 %9538
  call void @llvm.memset.p0i8.i64(i8* align 1 %9539, i8 0, i64 16, i1 false)
  br label %9540

9540:                                             ; preds = %9537, %9529
  %9541 = add nuw nsw i64 %9530, 1
  %9542 = call zeroext i8 @randombit()
  %9543 = getelementptr inbounds i8, i8* %1, i64 %9541
  store i8 %9542, i8* %9543, align 1
  %9544 = getelementptr inbounds i8, i8* %1, i64 %9541
  %9545 = load i8, i8* %9544, align 1
  %9546 = zext i8 %9545 to i32
  %9547 = icmp eq i32 %9546, 0
  br i1 %9547, label %9548, label %9551

9548:                                             ; preds = %9540
  %9549 = mul nuw nsw i64 %9541, 16
  %9550 = getelementptr inbounds i8, i8* %0, i64 %9549
  call void @llvm.memset.p0i8.i64(i8* align 1 %9550, i8 0, i64 16, i1 false)
  br label %9551

9551:                                             ; preds = %9548, %9540
  %9552 = add nuw nsw i64 %9541, 1
  %9553 = call zeroext i8 @randombit()
  %9554 = getelementptr inbounds i8, i8* %1, i64 %9552
  store i8 %9553, i8* %9554, align 1
  %9555 = getelementptr inbounds i8, i8* %1, i64 %9552
  %9556 = load i8, i8* %9555, align 1
  %9557 = zext i8 %9556 to i32
  %9558 = icmp eq i32 %9557, 0
  br i1 %9558, label %9559, label %9562

9559:                                             ; preds = %9551
  %9560 = mul nuw nsw i64 %9552, 16
  %9561 = getelementptr inbounds i8, i8* %0, i64 %9560
  call void @llvm.memset.p0i8.i64(i8* align 1 %9561, i8 0, i64 16, i1 false)
  br label %9562

9562:                                             ; preds = %9559, %9551
  %9563 = add nuw nsw i64 %9552, 1
  %9564 = call zeroext i8 @randombit()
  %9565 = getelementptr inbounds i8, i8* %1, i64 %9563
  store i8 %9564, i8* %9565, align 1
  %9566 = getelementptr inbounds i8, i8* %1, i64 %9563
  %9567 = load i8, i8* %9566, align 1
  %9568 = zext i8 %9567 to i32
  %9569 = icmp eq i32 %9568, 0
  br i1 %9569, label %9570, label %9573

9570:                                             ; preds = %9562
  %9571 = mul nuw nsw i64 %9563, 16
  %9572 = getelementptr inbounds i8, i8* %0, i64 %9571
  call void @llvm.memset.p0i8.i64(i8* align 1 %9572, i8 0, i64 16, i1 false)
  br label %9573

9573:                                             ; preds = %9570, %9562
  %9574 = add nuw nsw i64 %9563, 1
  %9575 = call zeroext i8 @randombit()
  %9576 = getelementptr inbounds i8, i8* %1, i64 %9574
  store i8 %9575, i8* %9576, align 1
  %9577 = getelementptr inbounds i8, i8* %1, i64 %9574
  %9578 = load i8, i8* %9577, align 1
  %9579 = zext i8 %9578 to i32
  %9580 = icmp eq i32 %9579, 0
  br i1 %9580, label %9581, label %9584

9581:                                             ; preds = %9573
  %9582 = mul nuw nsw i64 %9574, 16
  %9583 = getelementptr inbounds i8, i8* %0, i64 %9582
  call void @llvm.memset.p0i8.i64(i8* align 1 %9583, i8 0, i64 16, i1 false)
  br label %9584

9584:                                             ; preds = %9581, %9573
  %9585 = add nuw nsw i64 %9574, 1
  %9586 = call zeroext i8 @randombit()
  %9587 = getelementptr inbounds i8, i8* %1, i64 %9585
  store i8 %9586, i8* %9587, align 1
  %9588 = getelementptr inbounds i8, i8* %1, i64 %9585
  %9589 = load i8, i8* %9588, align 1
  %9590 = zext i8 %9589 to i32
  %9591 = icmp eq i32 %9590, 0
  br i1 %9591, label %9592, label %9595

9592:                                             ; preds = %9584
  %9593 = mul nuw nsw i64 %9585, 16
  %9594 = getelementptr inbounds i8, i8* %0, i64 %9593
  call void @llvm.memset.p0i8.i64(i8* align 1 %9594, i8 0, i64 16, i1 false)
  br label %9595

9595:                                             ; preds = %9592, %9584
  %9596 = add nuw nsw i64 %9585, 1
  %9597 = call zeroext i8 @randombit()
  %9598 = getelementptr inbounds i8, i8* %1, i64 %9596
  store i8 %9597, i8* %9598, align 1
  %9599 = getelementptr inbounds i8, i8* %1, i64 %9596
  %9600 = load i8, i8* %9599, align 1
  %9601 = zext i8 %9600 to i32
  %9602 = icmp eq i32 %9601, 0
  br i1 %9602, label %9603, label %9606

9603:                                             ; preds = %9595
  %9604 = mul nuw nsw i64 %9596, 16
  %9605 = getelementptr inbounds i8, i8* %0, i64 %9604
  call void @llvm.memset.p0i8.i64(i8* align 1 %9605, i8 0, i64 16, i1 false)
  br label %9606

9606:                                             ; preds = %9603, %9595
  %9607 = add nuw nsw i64 %9596, 1
  %9608 = call zeroext i8 @randombit()
  %9609 = getelementptr inbounds i8, i8* %1, i64 %9607
  store i8 %9608, i8* %9609, align 1
  %9610 = getelementptr inbounds i8, i8* %1, i64 %9607
  %9611 = load i8, i8* %9610, align 1
  %9612 = zext i8 %9611 to i32
  %9613 = icmp eq i32 %9612, 0
  br i1 %9613, label %9614, label %9617

9614:                                             ; preds = %9606
  %9615 = mul nuw nsw i64 %9607, 16
  %9616 = getelementptr inbounds i8, i8* %0, i64 %9615
  call void @llvm.memset.p0i8.i64(i8* align 1 %9616, i8 0, i64 16, i1 false)
  br label %9617

9617:                                             ; preds = %9614, %9606
  %9618 = add nuw nsw i64 %9607, 1
  %9619 = call zeroext i8 @randombit()
  %9620 = getelementptr inbounds i8, i8* %1, i64 %9618
  store i8 %9619, i8* %9620, align 1
  %9621 = getelementptr inbounds i8, i8* %1, i64 %9618
  %9622 = load i8, i8* %9621, align 1
  %9623 = zext i8 %9622 to i32
  %9624 = icmp eq i32 %9623, 0
  br i1 %9624, label %9625, label %9628

9625:                                             ; preds = %9617
  %9626 = mul nuw nsw i64 %9618, 16
  %9627 = getelementptr inbounds i8, i8* %0, i64 %9626
  call void @llvm.memset.p0i8.i64(i8* align 1 %9627, i8 0, i64 16, i1 false)
  br label %9628

9628:                                             ; preds = %9625, %9617
  %9629 = add nuw nsw i64 %9618, 1
  %9630 = call zeroext i8 @randombit()
  %9631 = getelementptr inbounds i8, i8* %1, i64 %9629
  store i8 %9630, i8* %9631, align 1
  %9632 = getelementptr inbounds i8, i8* %1, i64 %9629
  %9633 = load i8, i8* %9632, align 1
  %9634 = zext i8 %9633 to i32
  %9635 = icmp eq i32 %9634, 0
  br i1 %9635, label %9636, label %9639

9636:                                             ; preds = %9628
  %9637 = mul nuw nsw i64 %9629, 16
  %9638 = getelementptr inbounds i8, i8* %0, i64 %9637
  call void @llvm.memset.p0i8.i64(i8* align 1 %9638, i8 0, i64 16, i1 false)
  br label %9639

9639:                                             ; preds = %9636, %9628
  %9640 = add nuw nsw i64 %9629, 1
  %9641 = call zeroext i8 @randombit()
  %9642 = getelementptr inbounds i8, i8* %1, i64 %9640
  store i8 %9641, i8* %9642, align 1
  %9643 = getelementptr inbounds i8, i8* %1, i64 %9640
  %9644 = load i8, i8* %9643, align 1
  %9645 = zext i8 %9644 to i32
  %9646 = icmp eq i32 %9645, 0
  br i1 %9646, label %9647, label %9650

9647:                                             ; preds = %9639
  %9648 = mul nuw nsw i64 %9640, 16
  %9649 = getelementptr inbounds i8, i8* %0, i64 %9648
  call void @llvm.memset.p0i8.i64(i8* align 1 %9649, i8 0, i64 16, i1 false)
  br label %9650

9650:                                             ; preds = %9647, %9639
  %9651 = add nuw nsw i64 %9640, 1
  %9652 = call zeroext i8 @randombit()
  %9653 = getelementptr inbounds i8, i8* %1, i64 %9651
  store i8 %9652, i8* %9653, align 1
  %9654 = getelementptr inbounds i8, i8* %1, i64 %9651
  %9655 = load i8, i8* %9654, align 1
  %9656 = zext i8 %9655 to i32
  %9657 = icmp eq i32 %9656, 0
  br i1 %9657, label %9658, label %9661

9658:                                             ; preds = %9650
  %9659 = mul nuw nsw i64 %9651, 16
  %9660 = getelementptr inbounds i8, i8* %0, i64 %9659
  call void @llvm.memset.p0i8.i64(i8* align 1 %9660, i8 0, i64 16, i1 false)
  br label %9661

9661:                                             ; preds = %9658, %9650
  %9662 = add nuw nsw i64 %9651, 1
  %9663 = call zeroext i8 @randombit()
  %9664 = getelementptr inbounds i8, i8* %1, i64 %9662
  store i8 %9663, i8* %9664, align 1
  %9665 = getelementptr inbounds i8, i8* %1, i64 %9662
  %9666 = load i8, i8* %9665, align 1
  %9667 = zext i8 %9666 to i32
  %9668 = icmp eq i32 %9667, 0
  br i1 %9668, label %9669, label %9672

9669:                                             ; preds = %9661
  %9670 = mul nuw nsw i64 %9662, 16
  %9671 = getelementptr inbounds i8, i8* %0, i64 %9670
  call void @llvm.memset.p0i8.i64(i8* align 1 %9671, i8 0, i64 16, i1 false)
  br label %9672

9672:                                             ; preds = %9669, %9661
  %9673 = add nuw nsw i64 %9662, 1
  %9674 = call zeroext i8 @randombit()
  %9675 = getelementptr inbounds i8, i8* %1, i64 %9673
  store i8 %9674, i8* %9675, align 1
  %9676 = getelementptr inbounds i8, i8* %1, i64 %9673
  %9677 = load i8, i8* %9676, align 1
  %9678 = zext i8 %9677 to i32
  %9679 = icmp eq i32 %9678, 0
  br i1 %9679, label %9680, label %9683

9680:                                             ; preds = %9672
  %9681 = mul nuw nsw i64 %9673, 16
  %9682 = getelementptr inbounds i8, i8* %0, i64 %9681
  call void @llvm.memset.p0i8.i64(i8* align 1 %9682, i8 0, i64 16, i1 false)
  br label %9683

9683:                                             ; preds = %9680, %9672
  %9684 = add nuw nsw i64 %9673, 1
  %9685 = call zeroext i8 @randombit()
  %9686 = getelementptr inbounds i8, i8* %1, i64 %9684
  store i8 %9685, i8* %9686, align 1
  %9687 = getelementptr inbounds i8, i8* %1, i64 %9684
  %9688 = load i8, i8* %9687, align 1
  %9689 = zext i8 %9688 to i32
  %9690 = icmp eq i32 %9689, 0
  br i1 %9690, label %9691, label %9694

9691:                                             ; preds = %9683
  %9692 = mul nuw nsw i64 %9684, 16
  %9693 = getelementptr inbounds i8, i8* %0, i64 %9692
  call void @llvm.memset.p0i8.i64(i8* align 1 %9693, i8 0, i64 16, i1 false)
  br label %9694

9694:                                             ; preds = %9691, %9683
  %9695 = add nuw nsw i64 %9684, 1
  %9696 = call zeroext i8 @randombit()
  %9697 = getelementptr inbounds i8, i8* %1, i64 %9695
  store i8 %9696, i8* %9697, align 1
  %9698 = getelementptr inbounds i8, i8* %1, i64 %9695
  %9699 = load i8, i8* %9698, align 1
  %9700 = zext i8 %9699 to i32
  %9701 = icmp eq i32 %9700, 0
  br i1 %9701, label %9702, label %9705

9702:                                             ; preds = %9694
  %9703 = mul nuw nsw i64 %9695, 16
  %9704 = getelementptr inbounds i8, i8* %0, i64 %9703
  call void @llvm.memset.p0i8.i64(i8* align 1 %9704, i8 0, i64 16, i1 false)
  br label %9705

9705:                                             ; preds = %9702, %9694
  %9706 = add nuw nsw i64 %9695, 1
  %9707 = call zeroext i8 @randombit()
  %9708 = getelementptr inbounds i8, i8* %1, i64 %9706
  store i8 %9707, i8* %9708, align 1
  %9709 = getelementptr inbounds i8, i8* %1, i64 %9706
  %9710 = load i8, i8* %9709, align 1
  %9711 = zext i8 %9710 to i32
  %9712 = icmp eq i32 %9711, 0
  br i1 %9712, label %9713, label %9716

9713:                                             ; preds = %9705
  %9714 = mul nuw nsw i64 %9706, 16
  %9715 = getelementptr inbounds i8, i8* %0, i64 %9714
  call void @llvm.memset.p0i8.i64(i8* align 1 %9715, i8 0, i64 16, i1 false)
  br label %9716

9716:                                             ; preds = %9713, %9705
  %9717 = add nuw nsw i64 %9706, 1
  %9718 = call zeroext i8 @randombit()
  %9719 = getelementptr inbounds i8, i8* %1, i64 %9717
  store i8 %9718, i8* %9719, align 1
  %9720 = getelementptr inbounds i8, i8* %1, i64 %9717
  %9721 = load i8, i8* %9720, align 1
  %9722 = zext i8 %9721 to i32
  %9723 = icmp eq i32 %9722, 0
  br i1 %9723, label %9724, label %9727

9724:                                             ; preds = %9716
  %9725 = mul nuw nsw i64 %9717, 16
  %9726 = getelementptr inbounds i8, i8* %0, i64 %9725
  call void @llvm.memset.p0i8.i64(i8* align 1 %9726, i8 0, i64 16, i1 false)
  br label %9727

9727:                                             ; preds = %9724, %9716
  %9728 = add nuw nsw i64 %9717, 1
  %9729 = call zeroext i8 @randombit()
  %9730 = getelementptr inbounds i8, i8* %1, i64 %9728
  store i8 %9729, i8* %9730, align 1
  %9731 = getelementptr inbounds i8, i8* %1, i64 %9728
  %9732 = load i8, i8* %9731, align 1
  %9733 = zext i8 %9732 to i32
  %9734 = icmp eq i32 %9733, 0
  br i1 %9734, label %9735, label %9738

9735:                                             ; preds = %9727
  %9736 = mul nuw nsw i64 %9728, 16
  %9737 = getelementptr inbounds i8, i8* %0, i64 %9736
  call void @llvm.memset.p0i8.i64(i8* align 1 %9737, i8 0, i64 16, i1 false)
  br label %9738

9738:                                             ; preds = %9735, %9727
  %9739 = add nuw nsw i64 %9728, 1
  %9740 = call zeroext i8 @randombit()
  %9741 = getelementptr inbounds i8, i8* %1, i64 %9739
  store i8 %9740, i8* %9741, align 1
  %9742 = getelementptr inbounds i8, i8* %1, i64 %9739
  %9743 = load i8, i8* %9742, align 1
  %9744 = zext i8 %9743 to i32
  %9745 = icmp eq i32 %9744, 0
  br i1 %9745, label %9746, label %9749

9746:                                             ; preds = %9738
  %9747 = mul nuw nsw i64 %9739, 16
  %9748 = getelementptr inbounds i8, i8* %0, i64 %9747
  call void @llvm.memset.p0i8.i64(i8* align 1 %9748, i8 0, i64 16, i1 false)
  br label %9749

9749:                                             ; preds = %9746, %9738
  %9750 = add nuw nsw i64 %9739, 1
  %9751 = call zeroext i8 @randombit()
  %9752 = getelementptr inbounds i8, i8* %1, i64 %9750
  store i8 %9751, i8* %9752, align 1
  %9753 = getelementptr inbounds i8, i8* %1, i64 %9750
  %9754 = load i8, i8* %9753, align 1
  %9755 = zext i8 %9754 to i32
  %9756 = icmp eq i32 %9755, 0
  br i1 %9756, label %9757, label %9760

9757:                                             ; preds = %9749
  %9758 = mul nuw nsw i64 %9750, 16
  %9759 = getelementptr inbounds i8, i8* %0, i64 %9758
  call void @llvm.memset.p0i8.i64(i8* align 1 %9759, i8 0, i64 16, i1 false)
  br label %9760

9760:                                             ; preds = %9757, %9749
  %9761 = add nuw nsw i64 %9750, 1
  %9762 = call zeroext i8 @randombit()
  %9763 = getelementptr inbounds i8, i8* %1, i64 %9761
  store i8 %9762, i8* %9763, align 1
  %9764 = getelementptr inbounds i8, i8* %1, i64 %9761
  %9765 = load i8, i8* %9764, align 1
  %9766 = zext i8 %9765 to i32
  %9767 = icmp eq i32 %9766, 0
  br i1 %9767, label %9768, label %9771

9768:                                             ; preds = %9760
  %9769 = mul nuw nsw i64 %9761, 16
  %9770 = getelementptr inbounds i8, i8* %0, i64 %9769
  call void @llvm.memset.p0i8.i64(i8* align 1 %9770, i8 0, i64 16, i1 false)
  br label %9771

9771:                                             ; preds = %9768, %9760
  %9772 = add nuw nsw i64 %9761, 1
  %9773 = call zeroext i8 @randombit()
  %9774 = getelementptr inbounds i8, i8* %1, i64 %9772
  store i8 %9773, i8* %9774, align 1
  %9775 = getelementptr inbounds i8, i8* %1, i64 %9772
  %9776 = load i8, i8* %9775, align 1
  %9777 = zext i8 %9776 to i32
  %9778 = icmp eq i32 %9777, 0
  br i1 %9778, label %9779, label %9782

9779:                                             ; preds = %9771
  %9780 = mul nuw nsw i64 %9772, 16
  %9781 = getelementptr inbounds i8, i8* %0, i64 %9780
  call void @llvm.memset.p0i8.i64(i8* align 1 %9781, i8 0, i64 16, i1 false)
  br label %9782

9782:                                             ; preds = %9779, %9771
  %9783 = add nuw nsw i64 %9772, 1
  %9784 = call zeroext i8 @randombit()
  %9785 = getelementptr inbounds i8, i8* %1, i64 %9783
  store i8 %9784, i8* %9785, align 1
  %9786 = getelementptr inbounds i8, i8* %1, i64 %9783
  %9787 = load i8, i8* %9786, align 1
  %9788 = zext i8 %9787 to i32
  %9789 = icmp eq i32 %9788, 0
  br i1 %9789, label %9790, label %9793

9790:                                             ; preds = %9782
  %9791 = mul nuw nsw i64 %9783, 16
  %9792 = getelementptr inbounds i8, i8* %0, i64 %9791
  call void @llvm.memset.p0i8.i64(i8* align 1 %9792, i8 0, i64 16, i1 false)
  br label %9793

9793:                                             ; preds = %9790, %9782
  %9794 = add nuw nsw i64 %9783, 1
  %9795 = call zeroext i8 @randombit()
  %9796 = getelementptr inbounds i8, i8* %1, i64 %9794
  store i8 %9795, i8* %9796, align 1
  %9797 = getelementptr inbounds i8, i8* %1, i64 %9794
  %9798 = load i8, i8* %9797, align 1
  %9799 = zext i8 %9798 to i32
  %9800 = icmp eq i32 %9799, 0
  br i1 %9800, label %9801, label %9804

9801:                                             ; preds = %9793
  %9802 = mul nuw nsw i64 %9794, 16
  %9803 = getelementptr inbounds i8, i8* %0, i64 %9802
  call void @llvm.memset.p0i8.i64(i8* align 1 %9803, i8 0, i64 16, i1 false)
  br label %9804

9804:                                             ; preds = %9801, %9793
  %9805 = add nuw nsw i64 %9794, 1
  %9806 = call zeroext i8 @randombit()
  %9807 = getelementptr inbounds i8, i8* %1, i64 %9805
  store i8 %9806, i8* %9807, align 1
  %9808 = getelementptr inbounds i8, i8* %1, i64 %9805
  %9809 = load i8, i8* %9808, align 1
  %9810 = zext i8 %9809 to i32
  %9811 = icmp eq i32 %9810, 0
  br i1 %9811, label %9812, label %9815

9812:                                             ; preds = %9804
  %9813 = mul nuw nsw i64 %9805, 16
  %9814 = getelementptr inbounds i8, i8* %0, i64 %9813
  call void @llvm.memset.p0i8.i64(i8* align 1 %9814, i8 0, i64 16, i1 false)
  br label %9815

9815:                                             ; preds = %9812, %9804
  %9816 = add nuw nsw i64 %9805, 1
  %9817 = call zeroext i8 @randombit()
  %9818 = getelementptr inbounds i8, i8* %1, i64 %9816
  store i8 %9817, i8* %9818, align 1
  %9819 = getelementptr inbounds i8, i8* %1, i64 %9816
  %9820 = load i8, i8* %9819, align 1
  %9821 = zext i8 %9820 to i32
  %9822 = icmp eq i32 %9821, 0
  br i1 %9822, label %9823, label %9826

9823:                                             ; preds = %9815
  %9824 = mul nuw nsw i64 %9816, 16
  %9825 = getelementptr inbounds i8, i8* %0, i64 %9824
  call void @llvm.memset.p0i8.i64(i8* align 1 %9825, i8 0, i64 16, i1 false)
  br label %9826

9826:                                             ; preds = %9823, %9815
  %9827 = add nuw nsw i64 %9816, 1
  %9828 = call zeroext i8 @randombit()
  %9829 = getelementptr inbounds i8, i8* %1, i64 %9827
  store i8 %9828, i8* %9829, align 1
  %9830 = getelementptr inbounds i8, i8* %1, i64 %9827
  %9831 = load i8, i8* %9830, align 1
  %9832 = zext i8 %9831 to i32
  %9833 = icmp eq i32 %9832, 0
  br i1 %9833, label %9834, label %9837

9834:                                             ; preds = %9826
  %9835 = mul nuw nsw i64 %9827, 16
  %9836 = getelementptr inbounds i8, i8* %0, i64 %9835
  call void @llvm.memset.p0i8.i64(i8* align 1 %9836, i8 0, i64 16, i1 false)
  br label %9837

9837:                                             ; preds = %9834, %9826
  %9838 = add nuw nsw i64 %9827, 1
  %9839 = call zeroext i8 @randombit()
  %9840 = getelementptr inbounds i8, i8* %1, i64 %9838
  store i8 %9839, i8* %9840, align 1
  %9841 = getelementptr inbounds i8, i8* %1, i64 %9838
  %9842 = load i8, i8* %9841, align 1
  %9843 = zext i8 %9842 to i32
  %9844 = icmp eq i32 %9843, 0
  br i1 %9844, label %9845, label %9848

9845:                                             ; preds = %9837
  %9846 = mul nuw nsw i64 %9838, 16
  %9847 = getelementptr inbounds i8, i8* %0, i64 %9846
  call void @llvm.memset.p0i8.i64(i8* align 1 %9847, i8 0, i64 16, i1 false)
  br label %9848

9848:                                             ; preds = %9845, %9837
  %9849 = add nuw nsw i64 %9838, 1
  %9850 = call zeroext i8 @randombit()
  %9851 = getelementptr inbounds i8, i8* %1, i64 %9849
  store i8 %9850, i8* %9851, align 1
  %9852 = getelementptr inbounds i8, i8* %1, i64 %9849
  %9853 = load i8, i8* %9852, align 1
  %9854 = zext i8 %9853 to i32
  %9855 = icmp eq i32 %9854, 0
  br i1 %9855, label %9856, label %9859

9856:                                             ; preds = %9848
  %9857 = mul nuw nsw i64 %9849, 16
  %9858 = getelementptr inbounds i8, i8* %0, i64 %9857
  call void @llvm.memset.p0i8.i64(i8* align 1 %9858, i8 0, i64 16, i1 false)
  br label %9859

9859:                                             ; preds = %9856, %9848
  %9860 = add nuw nsw i64 %9849, 1
  %9861 = call zeroext i8 @randombit()
  %9862 = getelementptr inbounds i8, i8* %1, i64 %9860
  store i8 %9861, i8* %9862, align 1
  %9863 = getelementptr inbounds i8, i8* %1, i64 %9860
  %9864 = load i8, i8* %9863, align 1
  %9865 = zext i8 %9864 to i32
  %9866 = icmp eq i32 %9865, 0
  br i1 %9866, label %9867, label %9870

9867:                                             ; preds = %9859
  %9868 = mul nuw nsw i64 %9860, 16
  %9869 = getelementptr inbounds i8, i8* %0, i64 %9868
  call void @llvm.memset.p0i8.i64(i8* align 1 %9869, i8 0, i64 16, i1 false)
  br label %9870

9870:                                             ; preds = %9867, %9859
  %9871 = add nuw nsw i64 %9860, 1
  %9872 = call zeroext i8 @randombit()
  %9873 = getelementptr inbounds i8, i8* %1, i64 %9871
  store i8 %9872, i8* %9873, align 1
  %9874 = getelementptr inbounds i8, i8* %1, i64 %9871
  %9875 = load i8, i8* %9874, align 1
  %9876 = zext i8 %9875 to i32
  %9877 = icmp eq i32 %9876, 0
  br i1 %9877, label %9878, label %9881

9878:                                             ; preds = %9870
  %9879 = mul nuw nsw i64 %9871, 16
  %9880 = getelementptr inbounds i8, i8* %0, i64 %9879
  call void @llvm.memset.p0i8.i64(i8* align 1 %9880, i8 0, i64 16, i1 false)
  br label %9881

9881:                                             ; preds = %9878, %9870
  %9882 = add nuw nsw i64 %9871, 1
  %9883 = call zeroext i8 @randombit()
  %9884 = getelementptr inbounds i8, i8* %1, i64 %9882
  store i8 %9883, i8* %9884, align 1
  %9885 = getelementptr inbounds i8, i8* %1, i64 %9882
  %9886 = load i8, i8* %9885, align 1
  %9887 = zext i8 %9886 to i32
  %9888 = icmp eq i32 %9887, 0
  br i1 %9888, label %9889, label %9892

9889:                                             ; preds = %9881
  %9890 = mul nuw nsw i64 %9882, 16
  %9891 = getelementptr inbounds i8, i8* %0, i64 %9890
  call void @llvm.memset.p0i8.i64(i8* align 1 %9891, i8 0, i64 16, i1 false)
  br label %9892

9892:                                             ; preds = %9889, %9881
  %9893 = add nuw nsw i64 %9882, 1
  %9894 = call zeroext i8 @randombit()
  %9895 = getelementptr inbounds i8, i8* %1, i64 %9893
  store i8 %9894, i8* %9895, align 1
  %9896 = getelementptr inbounds i8, i8* %1, i64 %9893
  %9897 = load i8, i8* %9896, align 1
  %9898 = zext i8 %9897 to i32
  %9899 = icmp eq i32 %9898, 0
  br i1 %9899, label %9900, label %9903

9900:                                             ; preds = %9892
  %9901 = mul nuw nsw i64 %9893, 16
  %9902 = getelementptr inbounds i8, i8* %0, i64 %9901
  call void @llvm.memset.p0i8.i64(i8* align 1 %9902, i8 0, i64 16, i1 false)
  br label %9903

9903:                                             ; preds = %9900, %9892
  %9904 = add nuw nsw i64 %9893, 1
  %9905 = call zeroext i8 @randombit()
  %9906 = getelementptr inbounds i8, i8* %1, i64 %9904
  store i8 %9905, i8* %9906, align 1
  %9907 = getelementptr inbounds i8, i8* %1, i64 %9904
  %9908 = load i8, i8* %9907, align 1
  %9909 = zext i8 %9908 to i32
  %9910 = icmp eq i32 %9909, 0
  br i1 %9910, label %9911, label %9914

9911:                                             ; preds = %9903
  %9912 = mul nuw nsw i64 %9904, 16
  %9913 = getelementptr inbounds i8, i8* %0, i64 %9912
  call void @llvm.memset.p0i8.i64(i8* align 1 %9913, i8 0, i64 16, i1 false)
  br label %9914

9914:                                             ; preds = %9911, %9903
  %9915 = add nuw nsw i64 %9904, 1
  %9916 = call zeroext i8 @randombit()
  %9917 = getelementptr inbounds i8, i8* %1, i64 %9915
  store i8 %9916, i8* %9917, align 1
  %9918 = getelementptr inbounds i8, i8* %1, i64 %9915
  %9919 = load i8, i8* %9918, align 1
  %9920 = zext i8 %9919 to i32
  %9921 = icmp eq i32 %9920, 0
  br i1 %9921, label %9922, label %9925

9922:                                             ; preds = %9914
  %9923 = mul nuw nsw i64 %9915, 16
  %9924 = getelementptr inbounds i8, i8* %0, i64 %9923
  call void @llvm.memset.p0i8.i64(i8* align 1 %9924, i8 0, i64 16, i1 false)
  br label %9925

9925:                                             ; preds = %9922, %9914
  %9926 = add nuw nsw i64 %9915, 1
  %9927 = call zeroext i8 @randombit()
  %9928 = getelementptr inbounds i8, i8* %1, i64 %9926
  store i8 %9927, i8* %9928, align 1
  %9929 = getelementptr inbounds i8, i8* %1, i64 %9926
  %9930 = load i8, i8* %9929, align 1
  %9931 = zext i8 %9930 to i32
  %9932 = icmp eq i32 %9931, 0
  br i1 %9932, label %9933, label %9936

9933:                                             ; preds = %9925
  %9934 = mul nuw nsw i64 %9926, 16
  %9935 = getelementptr inbounds i8, i8* %0, i64 %9934
  call void @llvm.memset.p0i8.i64(i8* align 1 %9935, i8 0, i64 16, i1 false)
  br label %9936

9936:                                             ; preds = %9933, %9925
  %9937 = add nuw nsw i64 %9926, 1
  %9938 = call zeroext i8 @randombit()
  %9939 = getelementptr inbounds i8, i8* %1, i64 %9937
  store i8 %9938, i8* %9939, align 1
  %9940 = getelementptr inbounds i8, i8* %1, i64 %9937
  %9941 = load i8, i8* %9940, align 1
  %9942 = zext i8 %9941 to i32
  %9943 = icmp eq i32 %9942, 0
  br i1 %9943, label %9944, label %9947

9944:                                             ; preds = %9936
  %9945 = mul nuw nsw i64 %9937, 16
  %9946 = getelementptr inbounds i8, i8* %0, i64 %9945
  call void @llvm.memset.p0i8.i64(i8* align 1 %9946, i8 0, i64 16, i1 false)
  br label %9947

9947:                                             ; preds = %9944, %9936
  %9948 = add nuw nsw i64 %9937, 1
  %9949 = call zeroext i8 @randombit()
  %9950 = getelementptr inbounds i8, i8* %1, i64 %9948
  store i8 %9949, i8* %9950, align 1
  %9951 = getelementptr inbounds i8, i8* %1, i64 %9948
  %9952 = load i8, i8* %9951, align 1
  %9953 = zext i8 %9952 to i32
  %9954 = icmp eq i32 %9953, 0
  br i1 %9954, label %9955, label %9958

9955:                                             ; preds = %9947
  %9956 = mul nuw nsw i64 %9948, 16
  %9957 = getelementptr inbounds i8, i8* %0, i64 %9956
  call void @llvm.memset.p0i8.i64(i8* align 1 %9957, i8 0, i64 16, i1 false)
  br label %9958

9958:                                             ; preds = %9955, %9947
  %9959 = add nuw nsw i64 %9948, 1
  %9960 = call zeroext i8 @randombit()
  %9961 = getelementptr inbounds i8, i8* %1, i64 %9959
  store i8 %9960, i8* %9961, align 1
  %9962 = getelementptr inbounds i8, i8* %1, i64 %9959
  %9963 = load i8, i8* %9962, align 1
  %9964 = zext i8 %9963 to i32
  %9965 = icmp eq i32 %9964, 0
  br i1 %9965, label %9966, label %9969

9966:                                             ; preds = %9958
  %9967 = mul nuw nsw i64 %9959, 16
  %9968 = getelementptr inbounds i8, i8* %0, i64 %9967
  call void @llvm.memset.p0i8.i64(i8* align 1 %9968, i8 0, i64 16, i1 false)
  br label %9969

9969:                                             ; preds = %9966, %9958
  %9970 = add nuw nsw i64 %9959, 1
  %9971 = call zeroext i8 @randombit()
  %9972 = getelementptr inbounds i8, i8* %1, i64 %9970
  store i8 %9971, i8* %9972, align 1
  %9973 = getelementptr inbounds i8, i8* %1, i64 %9970
  %9974 = load i8, i8* %9973, align 1
  %9975 = zext i8 %9974 to i32
  %9976 = icmp eq i32 %9975, 0
  br i1 %9976, label %9977, label %9980

9977:                                             ; preds = %9969
  %9978 = mul nuw nsw i64 %9970, 16
  %9979 = getelementptr inbounds i8, i8* %0, i64 %9978
  call void @llvm.memset.p0i8.i64(i8* align 1 %9979, i8 0, i64 16, i1 false)
  br label %9980

9980:                                             ; preds = %9977, %9969
  %9981 = add nuw nsw i64 %9970, 1
  %9982 = call zeroext i8 @randombit()
  %9983 = getelementptr inbounds i8, i8* %1, i64 %9981
  store i8 %9982, i8* %9983, align 1
  %9984 = getelementptr inbounds i8, i8* %1, i64 %9981
  %9985 = load i8, i8* %9984, align 1
  %9986 = zext i8 %9985 to i32
  %9987 = icmp eq i32 %9986, 0
  br i1 %9987, label %9988, label %9991

9988:                                             ; preds = %9980
  %9989 = mul nuw nsw i64 %9981, 16
  %9990 = getelementptr inbounds i8, i8* %0, i64 %9989
  call void @llvm.memset.p0i8.i64(i8* align 1 %9990, i8 0, i64 16, i1 false)
  br label %9991

9991:                                             ; preds = %9988, %9980
  %9992 = add nuw nsw i64 %9981, 1
  %9993 = call zeroext i8 @randombit()
  %9994 = getelementptr inbounds i8, i8* %1, i64 %9992
  store i8 %9993, i8* %9994, align 1
  %9995 = getelementptr inbounds i8, i8* %1, i64 %9992
  %9996 = load i8, i8* %9995, align 1
  %9997 = zext i8 %9996 to i32
  %9998 = icmp eq i32 %9997, 0
  br i1 %9998, label %9999, label %10002

9999:                                             ; preds = %9991
  %10000 = mul nuw nsw i64 %9992, 16
  %10001 = getelementptr inbounds i8, i8* %0, i64 %10000
  call void @llvm.memset.p0i8.i64(i8* align 1 %10001, i8 0, i64 16, i1 false)
  br label %10002

10002:                                            ; preds = %9999, %9991
  %10003 = add nuw nsw i64 %9992, 1
  %10004 = call zeroext i8 @randombit()
  %10005 = getelementptr inbounds i8, i8* %1, i64 %10003
  store i8 %10004, i8* %10005, align 1
  %10006 = getelementptr inbounds i8, i8* %1, i64 %10003
  %10007 = load i8, i8* %10006, align 1
  %10008 = zext i8 %10007 to i32
  %10009 = icmp eq i32 %10008, 0
  br i1 %10009, label %10010, label %10013

10010:                                            ; preds = %10002
  %10011 = mul nuw nsw i64 %10003, 16
  %10012 = getelementptr inbounds i8, i8* %0, i64 %10011
  call void @llvm.memset.p0i8.i64(i8* align 1 %10012, i8 0, i64 16, i1 false)
  br label %10013

10013:                                            ; preds = %10010, %10002
  %10014 = add nuw nsw i64 %10003, 1
  %10015 = call zeroext i8 @randombit()
  %10016 = getelementptr inbounds i8, i8* %1, i64 %10014
  store i8 %10015, i8* %10016, align 1
  %10017 = getelementptr inbounds i8, i8* %1, i64 %10014
  %10018 = load i8, i8* %10017, align 1
  %10019 = zext i8 %10018 to i32
  %10020 = icmp eq i32 %10019, 0
  br i1 %10020, label %10021, label %10024

10021:                                            ; preds = %10013
  %10022 = mul nuw nsw i64 %10014, 16
  %10023 = getelementptr inbounds i8, i8* %0, i64 %10022
  call void @llvm.memset.p0i8.i64(i8* align 1 %10023, i8 0, i64 16, i1 false)
  br label %10024

10024:                                            ; preds = %10021, %10013
  %10025 = add nuw nsw i64 %10014, 1
  %10026 = call zeroext i8 @randombit()
  %10027 = getelementptr inbounds i8, i8* %1, i64 %10025
  store i8 %10026, i8* %10027, align 1
  %10028 = getelementptr inbounds i8, i8* %1, i64 %10025
  %10029 = load i8, i8* %10028, align 1
  %10030 = zext i8 %10029 to i32
  %10031 = icmp eq i32 %10030, 0
  br i1 %10031, label %10032, label %10035

10032:                                            ; preds = %10024
  %10033 = mul nuw nsw i64 %10025, 16
  %10034 = getelementptr inbounds i8, i8* %0, i64 %10033
  call void @llvm.memset.p0i8.i64(i8* align 1 %10034, i8 0, i64 16, i1 false)
  br label %10035

10035:                                            ; preds = %10032, %10024
  %10036 = add nuw nsw i64 %10025, 1
  %10037 = call zeroext i8 @randombit()
  %10038 = getelementptr inbounds i8, i8* %1, i64 %10036
  store i8 %10037, i8* %10038, align 1
  %10039 = getelementptr inbounds i8, i8* %1, i64 %10036
  %10040 = load i8, i8* %10039, align 1
  %10041 = zext i8 %10040 to i32
  %10042 = icmp eq i32 %10041, 0
  br i1 %10042, label %10043, label %10046

10043:                                            ; preds = %10035
  %10044 = mul nuw nsw i64 %10036, 16
  %10045 = getelementptr inbounds i8, i8* %0, i64 %10044
  call void @llvm.memset.p0i8.i64(i8* align 1 %10045, i8 0, i64 16, i1 false)
  br label %10046

10046:                                            ; preds = %10043, %10035
  %10047 = add nuw nsw i64 %10036, 1
  %10048 = call zeroext i8 @randombit()
  %10049 = getelementptr inbounds i8, i8* %1, i64 %10047
  store i8 %10048, i8* %10049, align 1
  %10050 = getelementptr inbounds i8, i8* %1, i64 %10047
  %10051 = load i8, i8* %10050, align 1
  %10052 = zext i8 %10051 to i32
  %10053 = icmp eq i32 %10052, 0
  br i1 %10053, label %10054, label %10057

10054:                                            ; preds = %10046
  %10055 = mul nuw nsw i64 %10047, 16
  %10056 = getelementptr inbounds i8, i8* %0, i64 %10055
  call void @llvm.memset.p0i8.i64(i8* align 1 %10056, i8 0, i64 16, i1 false)
  br label %10057

10057:                                            ; preds = %10054, %10046
  %10058 = add nuw nsw i64 %10047, 1
  %10059 = call zeroext i8 @randombit()
  %10060 = getelementptr inbounds i8, i8* %1, i64 %10058
  store i8 %10059, i8* %10060, align 1
  %10061 = getelementptr inbounds i8, i8* %1, i64 %10058
  %10062 = load i8, i8* %10061, align 1
  %10063 = zext i8 %10062 to i32
  %10064 = icmp eq i32 %10063, 0
  br i1 %10064, label %10065, label %10068

10065:                                            ; preds = %10057
  %10066 = mul nuw nsw i64 %10058, 16
  %10067 = getelementptr inbounds i8, i8* %0, i64 %10066
  call void @llvm.memset.p0i8.i64(i8* align 1 %10067, i8 0, i64 16, i1 false)
  br label %10068

10068:                                            ; preds = %10065, %10057
  %10069 = add nuw nsw i64 %10058, 1
  %10070 = call zeroext i8 @randombit()
  %10071 = getelementptr inbounds i8, i8* %1, i64 %10069
  store i8 %10070, i8* %10071, align 1
  %10072 = getelementptr inbounds i8, i8* %1, i64 %10069
  %10073 = load i8, i8* %10072, align 1
  %10074 = zext i8 %10073 to i32
  %10075 = icmp eq i32 %10074, 0
  br i1 %10075, label %10076, label %10079

10076:                                            ; preds = %10068
  %10077 = mul nuw nsw i64 %10069, 16
  %10078 = getelementptr inbounds i8, i8* %0, i64 %10077
  call void @llvm.memset.p0i8.i64(i8* align 1 %10078, i8 0, i64 16, i1 false)
  br label %10079

10079:                                            ; preds = %10076, %10068
  %10080 = add nuw nsw i64 %10069, 1
  %10081 = call zeroext i8 @randombit()
  %10082 = getelementptr inbounds i8, i8* %1, i64 %10080
  store i8 %10081, i8* %10082, align 1
  %10083 = getelementptr inbounds i8, i8* %1, i64 %10080
  %10084 = load i8, i8* %10083, align 1
  %10085 = zext i8 %10084 to i32
  %10086 = icmp eq i32 %10085, 0
  br i1 %10086, label %10087, label %10090

10087:                                            ; preds = %10079
  %10088 = mul nuw nsw i64 %10080, 16
  %10089 = getelementptr inbounds i8, i8* %0, i64 %10088
  call void @llvm.memset.p0i8.i64(i8* align 1 %10089, i8 0, i64 16, i1 false)
  br label %10090

10090:                                            ; preds = %10087, %10079
  %10091 = add nuw nsw i64 %10080, 1
  %10092 = call zeroext i8 @randombit()
  %10093 = getelementptr inbounds i8, i8* %1, i64 %10091
  store i8 %10092, i8* %10093, align 1
  %10094 = getelementptr inbounds i8, i8* %1, i64 %10091
  %10095 = load i8, i8* %10094, align 1
  %10096 = zext i8 %10095 to i32
  %10097 = icmp eq i32 %10096, 0
  br i1 %10097, label %10098, label %10101

10098:                                            ; preds = %10090
  %10099 = mul nuw nsw i64 %10091, 16
  %10100 = getelementptr inbounds i8, i8* %0, i64 %10099
  call void @llvm.memset.p0i8.i64(i8* align 1 %10100, i8 0, i64 16, i1 false)
  br label %10101

10101:                                            ; preds = %10098, %10090
  %10102 = add nuw nsw i64 %10091, 1
  %10103 = call zeroext i8 @randombit()
  %10104 = getelementptr inbounds i8, i8* %1, i64 %10102
  store i8 %10103, i8* %10104, align 1
  %10105 = getelementptr inbounds i8, i8* %1, i64 %10102
  %10106 = load i8, i8* %10105, align 1
  %10107 = zext i8 %10106 to i32
  %10108 = icmp eq i32 %10107, 0
  br i1 %10108, label %10109, label %10112

10109:                                            ; preds = %10101
  %10110 = mul nuw nsw i64 %10102, 16
  %10111 = getelementptr inbounds i8, i8* %0, i64 %10110
  call void @llvm.memset.p0i8.i64(i8* align 1 %10111, i8 0, i64 16, i1 false)
  br label %10112

10112:                                            ; preds = %10109, %10101
  %10113 = add nuw nsw i64 %10102, 1
  %10114 = call zeroext i8 @randombit()
  %10115 = getelementptr inbounds i8, i8* %1, i64 %10113
  store i8 %10114, i8* %10115, align 1
  %10116 = getelementptr inbounds i8, i8* %1, i64 %10113
  %10117 = load i8, i8* %10116, align 1
  %10118 = zext i8 %10117 to i32
  %10119 = icmp eq i32 %10118, 0
  br i1 %10119, label %10120, label %10123

10120:                                            ; preds = %10112
  %10121 = mul nuw nsw i64 %10113, 16
  %10122 = getelementptr inbounds i8, i8* %0, i64 %10121
  call void @llvm.memset.p0i8.i64(i8* align 1 %10122, i8 0, i64 16, i1 false)
  br label %10123

10123:                                            ; preds = %10120, %10112
  %10124 = add nuw nsw i64 %10113, 1
  %10125 = call zeroext i8 @randombit()
  %10126 = getelementptr inbounds i8, i8* %1, i64 %10124
  store i8 %10125, i8* %10126, align 1
  %10127 = getelementptr inbounds i8, i8* %1, i64 %10124
  %10128 = load i8, i8* %10127, align 1
  %10129 = zext i8 %10128 to i32
  %10130 = icmp eq i32 %10129, 0
  br i1 %10130, label %10131, label %10134

10131:                                            ; preds = %10123
  %10132 = mul nuw nsw i64 %10124, 16
  %10133 = getelementptr inbounds i8, i8* %0, i64 %10132
  call void @llvm.memset.p0i8.i64(i8* align 1 %10133, i8 0, i64 16, i1 false)
  br label %10134

10134:                                            ; preds = %10131, %10123
  %10135 = add nuw nsw i64 %10124, 1
  %10136 = call zeroext i8 @randombit()
  %10137 = getelementptr inbounds i8, i8* %1, i64 %10135
  store i8 %10136, i8* %10137, align 1
  %10138 = getelementptr inbounds i8, i8* %1, i64 %10135
  %10139 = load i8, i8* %10138, align 1
  %10140 = zext i8 %10139 to i32
  %10141 = icmp eq i32 %10140, 0
  br i1 %10141, label %10142, label %10145

10142:                                            ; preds = %10134
  %10143 = mul nuw nsw i64 %10135, 16
  %10144 = getelementptr inbounds i8, i8* %0, i64 %10143
  call void @llvm.memset.p0i8.i64(i8* align 1 %10144, i8 0, i64 16, i1 false)
  br label %10145

10145:                                            ; preds = %10142, %10134
  %10146 = add nuw nsw i64 %10135, 1
  %10147 = call zeroext i8 @randombit()
  %10148 = getelementptr inbounds i8, i8* %1, i64 %10146
  store i8 %10147, i8* %10148, align 1
  %10149 = getelementptr inbounds i8, i8* %1, i64 %10146
  %10150 = load i8, i8* %10149, align 1
  %10151 = zext i8 %10150 to i32
  %10152 = icmp eq i32 %10151, 0
  br i1 %10152, label %10153, label %10156

10153:                                            ; preds = %10145
  %10154 = mul nuw nsw i64 %10146, 16
  %10155 = getelementptr inbounds i8, i8* %0, i64 %10154
  call void @llvm.memset.p0i8.i64(i8* align 1 %10155, i8 0, i64 16, i1 false)
  br label %10156

10156:                                            ; preds = %10153, %10145
  %10157 = add nuw nsw i64 %10146, 1
  %10158 = call zeroext i8 @randombit()
  %10159 = getelementptr inbounds i8, i8* %1, i64 %10157
  store i8 %10158, i8* %10159, align 1
  %10160 = getelementptr inbounds i8, i8* %1, i64 %10157
  %10161 = load i8, i8* %10160, align 1
  %10162 = zext i8 %10161 to i32
  %10163 = icmp eq i32 %10162, 0
  br i1 %10163, label %10164, label %10167

10164:                                            ; preds = %10156
  %10165 = mul nuw nsw i64 %10157, 16
  %10166 = getelementptr inbounds i8, i8* %0, i64 %10165
  call void @llvm.memset.p0i8.i64(i8* align 1 %10166, i8 0, i64 16, i1 false)
  br label %10167

10167:                                            ; preds = %10164, %10156
  %10168 = add nuw nsw i64 %10157, 1
  %10169 = call zeroext i8 @randombit()
  %10170 = getelementptr inbounds i8, i8* %1, i64 %10168
  store i8 %10169, i8* %10170, align 1
  %10171 = getelementptr inbounds i8, i8* %1, i64 %10168
  %10172 = load i8, i8* %10171, align 1
  %10173 = zext i8 %10172 to i32
  %10174 = icmp eq i32 %10173, 0
  br i1 %10174, label %10175, label %10178

10175:                                            ; preds = %10167
  %10176 = mul nuw nsw i64 %10168, 16
  %10177 = getelementptr inbounds i8, i8* %0, i64 %10176
  call void @llvm.memset.p0i8.i64(i8* align 1 %10177, i8 0, i64 16, i1 false)
  br label %10178

10178:                                            ; preds = %10175, %10167
  %10179 = add nuw nsw i64 %10168, 1
  %10180 = call zeroext i8 @randombit()
  %10181 = getelementptr inbounds i8, i8* %1, i64 %10179
  store i8 %10180, i8* %10181, align 1
  %10182 = getelementptr inbounds i8, i8* %1, i64 %10179
  %10183 = load i8, i8* %10182, align 1
  %10184 = zext i8 %10183 to i32
  %10185 = icmp eq i32 %10184, 0
  br i1 %10185, label %10186, label %10189

10186:                                            ; preds = %10178
  %10187 = mul nuw nsw i64 %10179, 16
  %10188 = getelementptr inbounds i8, i8* %0, i64 %10187
  call void @llvm.memset.p0i8.i64(i8* align 1 %10188, i8 0, i64 16, i1 false)
  br label %10189

10189:                                            ; preds = %10186, %10178
  %10190 = add nuw nsw i64 %10179, 1
  %10191 = call zeroext i8 @randombit()
  %10192 = getelementptr inbounds i8, i8* %1, i64 %10190
  store i8 %10191, i8* %10192, align 1
  %10193 = getelementptr inbounds i8, i8* %1, i64 %10190
  %10194 = load i8, i8* %10193, align 1
  %10195 = zext i8 %10194 to i32
  %10196 = icmp eq i32 %10195, 0
  br i1 %10196, label %10197, label %10200

10197:                                            ; preds = %10189
  %10198 = mul nuw nsw i64 %10190, 16
  %10199 = getelementptr inbounds i8, i8* %0, i64 %10198
  call void @llvm.memset.p0i8.i64(i8* align 1 %10199, i8 0, i64 16, i1 false)
  br label %10200

10200:                                            ; preds = %10197, %10189
  %10201 = add nuw nsw i64 %10190, 1
  %10202 = call zeroext i8 @randombit()
  %10203 = getelementptr inbounds i8, i8* %1, i64 %10201
  store i8 %10202, i8* %10203, align 1
  %10204 = getelementptr inbounds i8, i8* %1, i64 %10201
  %10205 = load i8, i8* %10204, align 1
  %10206 = zext i8 %10205 to i32
  %10207 = icmp eq i32 %10206, 0
  br i1 %10207, label %10208, label %10211

10208:                                            ; preds = %10200
  %10209 = mul nuw nsw i64 %10201, 16
  %10210 = getelementptr inbounds i8, i8* %0, i64 %10209
  call void @llvm.memset.p0i8.i64(i8* align 1 %10210, i8 0, i64 16, i1 false)
  br label %10211

10211:                                            ; preds = %10208, %10200
  %10212 = add nuw nsw i64 %10201, 1
  %10213 = call zeroext i8 @randombit()
  %10214 = getelementptr inbounds i8, i8* %1, i64 %10212
  store i8 %10213, i8* %10214, align 1
  %10215 = getelementptr inbounds i8, i8* %1, i64 %10212
  %10216 = load i8, i8* %10215, align 1
  %10217 = zext i8 %10216 to i32
  %10218 = icmp eq i32 %10217, 0
  br i1 %10218, label %10219, label %10222

10219:                                            ; preds = %10211
  %10220 = mul nuw nsw i64 %10212, 16
  %10221 = getelementptr inbounds i8, i8* %0, i64 %10220
  call void @llvm.memset.p0i8.i64(i8* align 1 %10221, i8 0, i64 16, i1 false)
  br label %10222

10222:                                            ; preds = %10219, %10211
  %10223 = add nuw nsw i64 %10212, 1
  %10224 = call zeroext i8 @randombit()
  %10225 = getelementptr inbounds i8, i8* %1, i64 %10223
  store i8 %10224, i8* %10225, align 1
  %10226 = getelementptr inbounds i8, i8* %1, i64 %10223
  %10227 = load i8, i8* %10226, align 1
  %10228 = zext i8 %10227 to i32
  %10229 = icmp eq i32 %10228, 0
  br i1 %10229, label %10230, label %10233

10230:                                            ; preds = %10222
  %10231 = mul nuw nsw i64 %10223, 16
  %10232 = getelementptr inbounds i8, i8* %0, i64 %10231
  call void @llvm.memset.p0i8.i64(i8* align 1 %10232, i8 0, i64 16, i1 false)
  br label %10233

10233:                                            ; preds = %10230, %10222
  %10234 = add nuw nsw i64 %10223, 1
  %10235 = call zeroext i8 @randombit()
  %10236 = getelementptr inbounds i8, i8* %1, i64 %10234
  store i8 %10235, i8* %10236, align 1
  %10237 = getelementptr inbounds i8, i8* %1, i64 %10234
  %10238 = load i8, i8* %10237, align 1
  %10239 = zext i8 %10238 to i32
  %10240 = icmp eq i32 %10239, 0
  br i1 %10240, label %10241, label %10244

10241:                                            ; preds = %10233
  %10242 = mul nuw nsw i64 %10234, 16
  %10243 = getelementptr inbounds i8, i8* %0, i64 %10242
  call void @llvm.memset.p0i8.i64(i8* align 1 %10243, i8 0, i64 16, i1 false)
  br label %10244

10244:                                            ; preds = %10241, %10233
  %10245 = add nuw nsw i64 %10234, 1
  %10246 = call zeroext i8 @randombit()
  %10247 = getelementptr inbounds i8, i8* %1, i64 %10245
  store i8 %10246, i8* %10247, align 1
  %10248 = getelementptr inbounds i8, i8* %1, i64 %10245
  %10249 = load i8, i8* %10248, align 1
  %10250 = zext i8 %10249 to i32
  %10251 = icmp eq i32 %10250, 0
  br i1 %10251, label %10252, label %10255

10252:                                            ; preds = %10244
  %10253 = mul nuw nsw i64 %10245, 16
  %10254 = getelementptr inbounds i8, i8* %0, i64 %10253
  call void @llvm.memset.p0i8.i64(i8* align 1 %10254, i8 0, i64 16, i1 false)
  br label %10255

10255:                                            ; preds = %10252, %10244
  %10256 = add nuw nsw i64 %10245, 1
  %10257 = call zeroext i8 @randombit()
  %10258 = getelementptr inbounds i8, i8* %1, i64 %10256
  store i8 %10257, i8* %10258, align 1
  %10259 = getelementptr inbounds i8, i8* %1, i64 %10256
  %10260 = load i8, i8* %10259, align 1
  %10261 = zext i8 %10260 to i32
  %10262 = icmp eq i32 %10261, 0
  br i1 %10262, label %10263, label %10266

10263:                                            ; preds = %10255
  %10264 = mul nuw nsw i64 %10256, 16
  %10265 = getelementptr inbounds i8, i8* %0, i64 %10264
  call void @llvm.memset.p0i8.i64(i8* align 1 %10265, i8 0, i64 16, i1 false)
  br label %10266

10266:                                            ; preds = %10263, %10255
  %10267 = add nuw nsw i64 %10256, 1
  %10268 = call zeroext i8 @randombit()
  %10269 = getelementptr inbounds i8, i8* %1, i64 %10267
  store i8 %10268, i8* %10269, align 1
  %10270 = getelementptr inbounds i8, i8* %1, i64 %10267
  %10271 = load i8, i8* %10270, align 1
  %10272 = zext i8 %10271 to i32
  %10273 = icmp eq i32 %10272, 0
  br i1 %10273, label %10274, label %10277

10274:                                            ; preds = %10266
  %10275 = mul nuw nsw i64 %10267, 16
  %10276 = getelementptr inbounds i8, i8* %0, i64 %10275
  call void @llvm.memset.p0i8.i64(i8* align 1 %10276, i8 0, i64 16, i1 false)
  br label %10277

10277:                                            ; preds = %10274, %10266
  %10278 = add nuw nsw i64 %10267, 1
  %10279 = call zeroext i8 @randombit()
  %10280 = getelementptr inbounds i8, i8* %1, i64 %10278
  store i8 %10279, i8* %10280, align 1
  %10281 = getelementptr inbounds i8, i8* %1, i64 %10278
  %10282 = load i8, i8* %10281, align 1
  %10283 = zext i8 %10282 to i32
  %10284 = icmp eq i32 %10283, 0
  br i1 %10284, label %10285, label %10288

10285:                                            ; preds = %10277
  %10286 = mul nuw nsw i64 %10278, 16
  %10287 = getelementptr inbounds i8, i8* %0, i64 %10286
  call void @llvm.memset.p0i8.i64(i8* align 1 %10287, i8 0, i64 16, i1 false)
  br label %10288

10288:                                            ; preds = %10285, %10277
  %10289 = add nuw nsw i64 %10278, 1
  %10290 = call zeroext i8 @randombit()
  %10291 = getelementptr inbounds i8, i8* %1, i64 %10289
  store i8 %10290, i8* %10291, align 1
  %10292 = getelementptr inbounds i8, i8* %1, i64 %10289
  %10293 = load i8, i8* %10292, align 1
  %10294 = zext i8 %10293 to i32
  %10295 = icmp eq i32 %10294, 0
  br i1 %10295, label %10296, label %10299

10296:                                            ; preds = %10288
  %10297 = mul nuw nsw i64 %10289, 16
  %10298 = getelementptr inbounds i8, i8* %0, i64 %10297
  call void @llvm.memset.p0i8.i64(i8* align 1 %10298, i8 0, i64 16, i1 false)
  br label %10299

10299:                                            ; preds = %10296, %10288
  %10300 = add nuw nsw i64 %10289, 1
  %10301 = call zeroext i8 @randombit()
  %10302 = getelementptr inbounds i8, i8* %1, i64 %10300
  store i8 %10301, i8* %10302, align 1
  %10303 = getelementptr inbounds i8, i8* %1, i64 %10300
  %10304 = load i8, i8* %10303, align 1
  %10305 = zext i8 %10304 to i32
  %10306 = icmp eq i32 %10305, 0
  br i1 %10306, label %10307, label %10310

10307:                                            ; preds = %10299
  %10308 = mul nuw nsw i64 %10300, 16
  %10309 = getelementptr inbounds i8, i8* %0, i64 %10308
  call void @llvm.memset.p0i8.i64(i8* align 1 %10309, i8 0, i64 16, i1 false)
  br label %10310

10310:                                            ; preds = %10307, %10299
  %10311 = add nuw nsw i64 %10300, 1
  %10312 = call zeroext i8 @randombit()
  %10313 = getelementptr inbounds i8, i8* %1, i64 %10311
  store i8 %10312, i8* %10313, align 1
  %10314 = getelementptr inbounds i8, i8* %1, i64 %10311
  %10315 = load i8, i8* %10314, align 1
  %10316 = zext i8 %10315 to i32
  %10317 = icmp eq i32 %10316, 0
  br i1 %10317, label %10318, label %10321

10318:                                            ; preds = %10310
  %10319 = mul nuw nsw i64 %10311, 16
  %10320 = getelementptr inbounds i8, i8* %0, i64 %10319
  call void @llvm.memset.p0i8.i64(i8* align 1 %10320, i8 0, i64 16, i1 false)
  br label %10321

10321:                                            ; preds = %10318, %10310
  %10322 = add nuw nsw i64 %10311, 1
  %10323 = call zeroext i8 @randombit()
  %10324 = getelementptr inbounds i8, i8* %1, i64 %10322
  store i8 %10323, i8* %10324, align 1
  %10325 = getelementptr inbounds i8, i8* %1, i64 %10322
  %10326 = load i8, i8* %10325, align 1
  %10327 = zext i8 %10326 to i32
  %10328 = icmp eq i32 %10327, 0
  br i1 %10328, label %10329, label %10332

10329:                                            ; preds = %10321
  %10330 = mul nuw nsw i64 %10322, 16
  %10331 = getelementptr inbounds i8, i8* %0, i64 %10330
  call void @llvm.memset.p0i8.i64(i8* align 1 %10331, i8 0, i64 16, i1 false)
  br label %10332

10332:                                            ; preds = %10329, %10321
  %10333 = add nuw nsw i64 %10322, 1
  %10334 = call zeroext i8 @randombit()
  %10335 = getelementptr inbounds i8, i8* %1, i64 %10333
  store i8 %10334, i8* %10335, align 1
  %10336 = getelementptr inbounds i8, i8* %1, i64 %10333
  %10337 = load i8, i8* %10336, align 1
  %10338 = zext i8 %10337 to i32
  %10339 = icmp eq i32 %10338, 0
  br i1 %10339, label %10340, label %10343

10340:                                            ; preds = %10332
  %10341 = mul nuw nsw i64 %10333, 16
  %10342 = getelementptr inbounds i8, i8* %0, i64 %10341
  call void @llvm.memset.p0i8.i64(i8* align 1 %10342, i8 0, i64 16, i1 false)
  br label %10343

10343:                                            ; preds = %10340, %10332
  %10344 = add nuw nsw i64 %10333, 1
  %10345 = call zeroext i8 @randombit()
  %10346 = getelementptr inbounds i8, i8* %1, i64 %10344
  store i8 %10345, i8* %10346, align 1
  %10347 = getelementptr inbounds i8, i8* %1, i64 %10344
  %10348 = load i8, i8* %10347, align 1
  %10349 = zext i8 %10348 to i32
  %10350 = icmp eq i32 %10349, 0
  br i1 %10350, label %10351, label %10354

10351:                                            ; preds = %10343
  %10352 = mul nuw nsw i64 %10344, 16
  %10353 = getelementptr inbounds i8, i8* %0, i64 %10352
  call void @llvm.memset.p0i8.i64(i8* align 1 %10353, i8 0, i64 16, i1 false)
  br label %10354

10354:                                            ; preds = %10351, %10343
  %10355 = add nuw nsw i64 %10344, 1
  %10356 = call zeroext i8 @randombit()
  %10357 = getelementptr inbounds i8, i8* %1, i64 %10355
  store i8 %10356, i8* %10357, align 1
  %10358 = getelementptr inbounds i8, i8* %1, i64 %10355
  %10359 = load i8, i8* %10358, align 1
  %10360 = zext i8 %10359 to i32
  %10361 = icmp eq i32 %10360, 0
  br i1 %10361, label %10362, label %10365

10362:                                            ; preds = %10354
  %10363 = mul nuw nsw i64 %10355, 16
  %10364 = getelementptr inbounds i8, i8* %0, i64 %10363
  call void @llvm.memset.p0i8.i64(i8* align 1 %10364, i8 0, i64 16, i1 false)
  br label %10365

10365:                                            ; preds = %10362, %10354
  %10366 = add nuw nsw i64 %10355, 1
  %10367 = call zeroext i8 @randombit()
  %10368 = getelementptr inbounds i8, i8* %1, i64 %10366
  store i8 %10367, i8* %10368, align 1
  %10369 = getelementptr inbounds i8, i8* %1, i64 %10366
  %10370 = load i8, i8* %10369, align 1
  %10371 = zext i8 %10370 to i32
  %10372 = icmp eq i32 %10371, 0
  br i1 %10372, label %10373, label %10376

10373:                                            ; preds = %10365
  %10374 = mul nuw nsw i64 %10366, 16
  %10375 = getelementptr inbounds i8, i8* %0, i64 %10374
  call void @llvm.memset.p0i8.i64(i8* align 1 %10375, i8 0, i64 16, i1 false)
  br label %10376

10376:                                            ; preds = %10373, %10365
  %10377 = add nuw nsw i64 %10366, 1
  %10378 = call zeroext i8 @randombit()
  %10379 = getelementptr inbounds i8, i8* %1, i64 %10377
  store i8 %10378, i8* %10379, align 1
  %10380 = getelementptr inbounds i8, i8* %1, i64 %10377
  %10381 = load i8, i8* %10380, align 1
  %10382 = zext i8 %10381 to i32
  %10383 = icmp eq i32 %10382, 0
  br i1 %10383, label %10384, label %10387

10384:                                            ; preds = %10376
  %10385 = mul nuw nsw i64 %10377, 16
  %10386 = getelementptr inbounds i8, i8* %0, i64 %10385
  call void @llvm.memset.p0i8.i64(i8* align 1 %10386, i8 0, i64 16, i1 false)
  br label %10387

10387:                                            ; preds = %10384, %10376
  %10388 = add nuw nsw i64 %10377, 1
  %10389 = call zeroext i8 @randombit()
  %10390 = getelementptr inbounds i8, i8* %1, i64 %10388
  store i8 %10389, i8* %10390, align 1
  %10391 = getelementptr inbounds i8, i8* %1, i64 %10388
  %10392 = load i8, i8* %10391, align 1
  %10393 = zext i8 %10392 to i32
  %10394 = icmp eq i32 %10393, 0
  br i1 %10394, label %10395, label %10398

10395:                                            ; preds = %10387
  %10396 = mul nuw nsw i64 %10388, 16
  %10397 = getelementptr inbounds i8, i8* %0, i64 %10396
  call void @llvm.memset.p0i8.i64(i8* align 1 %10397, i8 0, i64 16, i1 false)
  br label %10398

10398:                                            ; preds = %10395, %10387
  %10399 = add nuw nsw i64 %10388, 1
  %10400 = call zeroext i8 @randombit()
  %10401 = getelementptr inbounds i8, i8* %1, i64 %10399
  store i8 %10400, i8* %10401, align 1
  %10402 = getelementptr inbounds i8, i8* %1, i64 %10399
  %10403 = load i8, i8* %10402, align 1
  %10404 = zext i8 %10403 to i32
  %10405 = icmp eq i32 %10404, 0
  br i1 %10405, label %10406, label %10409

10406:                                            ; preds = %10398
  %10407 = mul nuw nsw i64 %10399, 16
  %10408 = getelementptr inbounds i8, i8* %0, i64 %10407
  call void @llvm.memset.p0i8.i64(i8* align 1 %10408, i8 0, i64 16, i1 false)
  br label %10409

10409:                                            ; preds = %10406, %10398
  %10410 = add nuw nsw i64 %10399, 1
  %10411 = call zeroext i8 @randombit()
  %10412 = getelementptr inbounds i8, i8* %1, i64 %10410
  store i8 %10411, i8* %10412, align 1
  %10413 = getelementptr inbounds i8, i8* %1, i64 %10410
  %10414 = load i8, i8* %10413, align 1
  %10415 = zext i8 %10414 to i32
  %10416 = icmp eq i32 %10415, 0
  br i1 %10416, label %10417, label %10420

10417:                                            ; preds = %10409
  %10418 = mul nuw nsw i64 %10410, 16
  %10419 = getelementptr inbounds i8, i8* %0, i64 %10418
  call void @llvm.memset.p0i8.i64(i8* align 1 %10419, i8 0, i64 16, i1 false)
  br label %10420

10420:                                            ; preds = %10417, %10409
  %10421 = add nuw nsw i64 %10410, 1
  %10422 = call zeroext i8 @randombit()
  %10423 = getelementptr inbounds i8, i8* %1, i64 %10421
  store i8 %10422, i8* %10423, align 1
  %10424 = getelementptr inbounds i8, i8* %1, i64 %10421
  %10425 = load i8, i8* %10424, align 1
  %10426 = zext i8 %10425 to i32
  %10427 = icmp eq i32 %10426, 0
  br i1 %10427, label %10428, label %10431

10428:                                            ; preds = %10420
  %10429 = mul nuw nsw i64 %10421, 16
  %10430 = getelementptr inbounds i8, i8* %0, i64 %10429
  call void @llvm.memset.p0i8.i64(i8* align 1 %10430, i8 0, i64 16, i1 false)
  br label %10431

10431:                                            ; preds = %10428, %10420
  %10432 = add nuw nsw i64 %10421, 1
  %10433 = call zeroext i8 @randombit()
  %10434 = getelementptr inbounds i8, i8* %1, i64 %10432
  store i8 %10433, i8* %10434, align 1
  %10435 = getelementptr inbounds i8, i8* %1, i64 %10432
  %10436 = load i8, i8* %10435, align 1
  %10437 = zext i8 %10436 to i32
  %10438 = icmp eq i32 %10437, 0
  br i1 %10438, label %10439, label %10442

10439:                                            ; preds = %10431
  %10440 = mul nuw nsw i64 %10432, 16
  %10441 = getelementptr inbounds i8, i8* %0, i64 %10440
  call void @llvm.memset.p0i8.i64(i8* align 1 %10441, i8 0, i64 16, i1 false)
  br label %10442

10442:                                            ; preds = %10439, %10431
  %10443 = add nuw nsw i64 %10432, 1
  %10444 = call zeroext i8 @randombit()
  %10445 = getelementptr inbounds i8, i8* %1, i64 %10443
  store i8 %10444, i8* %10445, align 1
  %10446 = getelementptr inbounds i8, i8* %1, i64 %10443
  %10447 = load i8, i8* %10446, align 1
  %10448 = zext i8 %10447 to i32
  %10449 = icmp eq i32 %10448, 0
  br i1 %10449, label %10450, label %10453

10450:                                            ; preds = %10442
  %10451 = mul nuw nsw i64 %10443, 16
  %10452 = getelementptr inbounds i8, i8* %0, i64 %10451
  call void @llvm.memset.p0i8.i64(i8* align 1 %10452, i8 0, i64 16, i1 false)
  br label %10453

10453:                                            ; preds = %10450, %10442
  %10454 = add nuw nsw i64 %10443, 1
  %10455 = call zeroext i8 @randombit()
  %10456 = getelementptr inbounds i8, i8* %1, i64 %10454
  store i8 %10455, i8* %10456, align 1
  %10457 = getelementptr inbounds i8, i8* %1, i64 %10454
  %10458 = load i8, i8* %10457, align 1
  %10459 = zext i8 %10458 to i32
  %10460 = icmp eq i32 %10459, 0
  br i1 %10460, label %10461, label %10464

10461:                                            ; preds = %10453
  %10462 = mul nuw nsw i64 %10454, 16
  %10463 = getelementptr inbounds i8, i8* %0, i64 %10462
  call void @llvm.memset.p0i8.i64(i8* align 1 %10463, i8 0, i64 16, i1 false)
  br label %10464

10464:                                            ; preds = %10461, %10453
  %10465 = add nuw nsw i64 %10454, 1
  %10466 = call zeroext i8 @randombit()
  %10467 = getelementptr inbounds i8, i8* %1, i64 %10465
  store i8 %10466, i8* %10467, align 1
  %10468 = getelementptr inbounds i8, i8* %1, i64 %10465
  %10469 = load i8, i8* %10468, align 1
  %10470 = zext i8 %10469 to i32
  %10471 = icmp eq i32 %10470, 0
  br i1 %10471, label %10472, label %10475

10472:                                            ; preds = %10464
  %10473 = mul nuw nsw i64 %10465, 16
  %10474 = getelementptr inbounds i8, i8* %0, i64 %10473
  call void @llvm.memset.p0i8.i64(i8* align 1 %10474, i8 0, i64 16, i1 false)
  br label %10475

10475:                                            ; preds = %10472, %10464
  %10476 = add nuw nsw i64 %10465, 1
  %10477 = call zeroext i8 @randombit()
  %10478 = getelementptr inbounds i8, i8* %1, i64 %10476
  store i8 %10477, i8* %10478, align 1
  %10479 = getelementptr inbounds i8, i8* %1, i64 %10476
  %10480 = load i8, i8* %10479, align 1
  %10481 = zext i8 %10480 to i32
  %10482 = icmp eq i32 %10481, 0
  br i1 %10482, label %10483, label %10486

10483:                                            ; preds = %10475
  %10484 = mul nuw nsw i64 %10476, 16
  %10485 = getelementptr inbounds i8, i8* %0, i64 %10484
  call void @llvm.memset.p0i8.i64(i8* align 1 %10485, i8 0, i64 16, i1 false)
  br label %10486

10486:                                            ; preds = %10483, %10475
  %10487 = add nuw nsw i64 %10476, 1
  %10488 = call zeroext i8 @randombit()
  %10489 = getelementptr inbounds i8, i8* %1, i64 %10487
  store i8 %10488, i8* %10489, align 1
  %10490 = getelementptr inbounds i8, i8* %1, i64 %10487
  %10491 = load i8, i8* %10490, align 1
  %10492 = zext i8 %10491 to i32
  %10493 = icmp eq i32 %10492, 0
  br i1 %10493, label %10494, label %10497

10494:                                            ; preds = %10486
  %10495 = mul nuw nsw i64 %10487, 16
  %10496 = getelementptr inbounds i8, i8* %0, i64 %10495
  call void @llvm.memset.p0i8.i64(i8* align 1 %10496, i8 0, i64 16, i1 false)
  br label %10497

10497:                                            ; preds = %10494, %10486
  %10498 = add nuw nsw i64 %10487, 1
  %10499 = call zeroext i8 @randombit()
  %10500 = getelementptr inbounds i8, i8* %1, i64 %10498
  store i8 %10499, i8* %10500, align 1
  %10501 = getelementptr inbounds i8, i8* %1, i64 %10498
  %10502 = load i8, i8* %10501, align 1
  %10503 = zext i8 %10502 to i32
  %10504 = icmp eq i32 %10503, 0
  br i1 %10504, label %10505, label %10508

10505:                                            ; preds = %10497
  %10506 = mul nuw nsw i64 %10498, 16
  %10507 = getelementptr inbounds i8, i8* %0, i64 %10506
  call void @llvm.memset.p0i8.i64(i8* align 1 %10507, i8 0, i64 16, i1 false)
  br label %10508

10508:                                            ; preds = %10505, %10497
  %10509 = add nuw nsw i64 %10498, 1
  %10510 = call zeroext i8 @randombit()
  %10511 = getelementptr inbounds i8, i8* %1, i64 %10509
  store i8 %10510, i8* %10511, align 1
  %10512 = getelementptr inbounds i8, i8* %1, i64 %10509
  %10513 = load i8, i8* %10512, align 1
  %10514 = zext i8 %10513 to i32
  %10515 = icmp eq i32 %10514, 0
  br i1 %10515, label %10516, label %10519

10516:                                            ; preds = %10508
  %10517 = mul nuw nsw i64 %10509, 16
  %10518 = getelementptr inbounds i8, i8* %0, i64 %10517
  call void @llvm.memset.p0i8.i64(i8* align 1 %10518, i8 0, i64 16, i1 false)
  br label %10519

10519:                                            ; preds = %10516, %10508
  %10520 = add nuw nsw i64 %10509, 1
  %10521 = call zeroext i8 @randombit()
  %10522 = getelementptr inbounds i8, i8* %1, i64 %10520
  store i8 %10521, i8* %10522, align 1
  %10523 = getelementptr inbounds i8, i8* %1, i64 %10520
  %10524 = load i8, i8* %10523, align 1
  %10525 = zext i8 %10524 to i32
  %10526 = icmp eq i32 %10525, 0
  br i1 %10526, label %10527, label %10530

10527:                                            ; preds = %10519
  %10528 = mul nuw nsw i64 %10520, 16
  %10529 = getelementptr inbounds i8, i8* %0, i64 %10528
  call void @llvm.memset.p0i8.i64(i8* align 1 %10529, i8 0, i64 16, i1 false)
  br label %10530

10530:                                            ; preds = %10527, %10519
  %10531 = add nuw nsw i64 %10520, 1
  %10532 = call zeroext i8 @randombit()
  %10533 = getelementptr inbounds i8, i8* %1, i64 %10531
  store i8 %10532, i8* %10533, align 1
  %10534 = getelementptr inbounds i8, i8* %1, i64 %10531
  %10535 = load i8, i8* %10534, align 1
  %10536 = zext i8 %10535 to i32
  %10537 = icmp eq i32 %10536, 0
  br i1 %10537, label %10538, label %10541

10538:                                            ; preds = %10530
  %10539 = mul nuw nsw i64 %10531, 16
  %10540 = getelementptr inbounds i8, i8* %0, i64 %10539
  call void @llvm.memset.p0i8.i64(i8* align 1 %10540, i8 0, i64 16, i1 false)
  br label %10541

10541:                                            ; preds = %10538, %10530
  %10542 = add nuw nsw i64 %10531, 1
  %10543 = call zeroext i8 @randombit()
  %10544 = getelementptr inbounds i8, i8* %1, i64 %10542
  store i8 %10543, i8* %10544, align 1
  %10545 = getelementptr inbounds i8, i8* %1, i64 %10542
  %10546 = load i8, i8* %10545, align 1
  %10547 = zext i8 %10546 to i32
  %10548 = icmp eq i32 %10547, 0
  br i1 %10548, label %10549, label %10552

10549:                                            ; preds = %10541
  %10550 = mul nuw nsw i64 %10542, 16
  %10551 = getelementptr inbounds i8, i8* %0, i64 %10550
  call void @llvm.memset.p0i8.i64(i8* align 1 %10551, i8 0, i64 16, i1 false)
  br label %10552

10552:                                            ; preds = %10549, %10541
  %10553 = add nuw nsw i64 %10542, 1
  %10554 = call zeroext i8 @randombit()
  %10555 = getelementptr inbounds i8, i8* %1, i64 %10553
  store i8 %10554, i8* %10555, align 1
  %10556 = getelementptr inbounds i8, i8* %1, i64 %10553
  %10557 = load i8, i8* %10556, align 1
  %10558 = zext i8 %10557 to i32
  %10559 = icmp eq i32 %10558, 0
  br i1 %10559, label %10560, label %10563

10560:                                            ; preds = %10552
  %10561 = mul nuw nsw i64 %10553, 16
  %10562 = getelementptr inbounds i8, i8* %0, i64 %10561
  call void @llvm.memset.p0i8.i64(i8* align 1 %10562, i8 0, i64 16, i1 false)
  br label %10563

10563:                                            ; preds = %10560, %10552
  %10564 = add nuw nsw i64 %10553, 1
  %10565 = call zeroext i8 @randombit()
  %10566 = getelementptr inbounds i8, i8* %1, i64 %10564
  store i8 %10565, i8* %10566, align 1
  %10567 = getelementptr inbounds i8, i8* %1, i64 %10564
  %10568 = load i8, i8* %10567, align 1
  %10569 = zext i8 %10568 to i32
  %10570 = icmp eq i32 %10569, 0
  br i1 %10570, label %10571, label %10574

10571:                                            ; preds = %10563
  %10572 = mul nuw nsw i64 %10564, 16
  %10573 = getelementptr inbounds i8, i8* %0, i64 %10572
  call void @llvm.memset.p0i8.i64(i8* align 1 %10573, i8 0, i64 16, i1 false)
  br label %10574

10574:                                            ; preds = %10571, %10563
  %10575 = add nuw nsw i64 %10564, 1
  %10576 = call zeroext i8 @randombit()
  %10577 = getelementptr inbounds i8, i8* %1, i64 %10575
  store i8 %10576, i8* %10577, align 1
  %10578 = getelementptr inbounds i8, i8* %1, i64 %10575
  %10579 = load i8, i8* %10578, align 1
  %10580 = zext i8 %10579 to i32
  %10581 = icmp eq i32 %10580, 0
  br i1 %10581, label %10582, label %10585

10582:                                            ; preds = %10574
  %10583 = mul nuw nsw i64 %10575, 16
  %10584 = getelementptr inbounds i8, i8* %0, i64 %10583
  call void @llvm.memset.p0i8.i64(i8* align 1 %10584, i8 0, i64 16, i1 false)
  br label %10585

10585:                                            ; preds = %10582, %10574
  %10586 = add nuw nsw i64 %10575, 1
  %10587 = call zeroext i8 @randombit()
  %10588 = getelementptr inbounds i8, i8* %1, i64 %10586
  store i8 %10587, i8* %10588, align 1
  %10589 = getelementptr inbounds i8, i8* %1, i64 %10586
  %10590 = load i8, i8* %10589, align 1
  %10591 = zext i8 %10590 to i32
  %10592 = icmp eq i32 %10591, 0
  br i1 %10592, label %10593, label %10596

10593:                                            ; preds = %10585
  %10594 = mul nuw nsw i64 %10586, 16
  %10595 = getelementptr inbounds i8, i8* %0, i64 %10594
  call void @llvm.memset.p0i8.i64(i8* align 1 %10595, i8 0, i64 16, i1 false)
  br label %10596

10596:                                            ; preds = %10593, %10585
  %10597 = add nuw nsw i64 %10586, 1
  %10598 = call zeroext i8 @randombit()
  %10599 = getelementptr inbounds i8, i8* %1, i64 %10597
  store i8 %10598, i8* %10599, align 1
  %10600 = getelementptr inbounds i8, i8* %1, i64 %10597
  %10601 = load i8, i8* %10600, align 1
  %10602 = zext i8 %10601 to i32
  %10603 = icmp eq i32 %10602, 0
  br i1 %10603, label %10604, label %10607

10604:                                            ; preds = %10596
  %10605 = mul nuw nsw i64 %10597, 16
  %10606 = getelementptr inbounds i8, i8* %0, i64 %10605
  call void @llvm.memset.p0i8.i64(i8* align 1 %10606, i8 0, i64 16, i1 false)
  br label %10607

10607:                                            ; preds = %10604, %10596
  %10608 = add nuw nsw i64 %10597, 1
  %10609 = call zeroext i8 @randombit()
  %10610 = getelementptr inbounds i8, i8* %1, i64 %10608
  store i8 %10609, i8* %10610, align 1
  %10611 = getelementptr inbounds i8, i8* %1, i64 %10608
  %10612 = load i8, i8* %10611, align 1
  %10613 = zext i8 %10612 to i32
  %10614 = icmp eq i32 %10613, 0
  br i1 %10614, label %10615, label %10618

10615:                                            ; preds = %10607
  %10616 = mul nuw nsw i64 %10608, 16
  %10617 = getelementptr inbounds i8, i8* %0, i64 %10616
  call void @llvm.memset.p0i8.i64(i8* align 1 %10617, i8 0, i64 16, i1 false)
  br label %10618

10618:                                            ; preds = %10615, %10607
  %10619 = add nuw nsw i64 %10608, 1
  %10620 = call zeroext i8 @randombit()
  %10621 = getelementptr inbounds i8, i8* %1, i64 %10619
  store i8 %10620, i8* %10621, align 1
  %10622 = getelementptr inbounds i8, i8* %1, i64 %10619
  %10623 = load i8, i8* %10622, align 1
  %10624 = zext i8 %10623 to i32
  %10625 = icmp eq i32 %10624, 0
  br i1 %10625, label %10626, label %10629

10626:                                            ; preds = %10618
  %10627 = mul nuw nsw i64 %10619, 16
  %10628 = getelementptr inbounds i8, i8* %0, i64 %10627
  call void @llvm.memset.p0i8.i64(i8* align 1 %10628, i8 0, i64 16, i1 false)
  br label %10629

10629:                                            ; preds = %10626, %10618
  %10630 = add nuw nsw i64 %10619, 1
  %10631 = call zeroext i8 @randombit()
  %10632 = getelementptr inbounds i8, i8* %1, i64 %10630
  store i8 %10631, i8* %10632, align 1
  %10633 = getelementptr inbounds i8, i8* %1, i64 %10630
  %10634 = load i8, i8* %10633, align 1
  %10635 = zext i8 %10634 to i32
  %10636 = icmp eq i32 %10635, 0
  br i1 %10636, label %10637, label %10640

10637:                                            ; preds = %10629
  %10638 = mul nuw nsw i64 %10630, 16
  %10639 = getelementptr inbounds i8, i8* %0, i64 %10638
  call void @llvm.memset.p0i8.i64(i8* align 1 %10639, i8 0, i64 16, i1 false)
  br label %10640

10640:                                            ; preds = %10637, %10629
  %10641 = add nuw nsw i64 %10630, 1
  %10642 = call zeroext i8 @randombit()
  %10643 = getelementptr inbounds i8, i8* %1, i64 %10641
  store i8 %10642, i8* %10643, align 1
  %10644 = getelementptr inbounds i8, i8* %1, i64 %10641
  %10645 = load i8, i8* %10644, align 1
  %10646 = zext i8 %10645 to i32
  %10647 = icmp eq i32 %10646, 0
  br i1 %10647, label %10648, label %10651

10648:                                            ; preds = %10640
  %10649 = mul nuw nsw i64 %10641, 16
  %10650 = getelementptr inbounds i8, i8* %0, i64 %10649
  call void @llvm.memset.p0i8.i64(i8* align 1 %10650, i8 0, i64 16, i1 false)
  br label %10651

10651:                                            ; preds = %10648, %10640
  %10652 = add nuw nsw i64 %10641, 1
  %10653 = call zeroext i8 @randombit()
  %10654 = getelementptr inbounds i8, i8* %1, i64 %10652
  store i8 %10653, i8* %10654, align 1
  %10655 = getelementptr inbounds i8, i8* %1, i64 %10652
  %10656 = load i8, i8* %10655, align 1
  %10657 = zext i8 %10656 to i32
  %10658 = icmp eq i32 %10657, 0
  br i1 %10658, label %10659, label %10662

10659:                                            ; preds = %10651
  %10660 = mul nuw nsw i64 %10652, 16
  %10661 = getelementptr inbounds i8, i8* %0, i64 %10660
  call void @llvm.memset.p0i8.i64(i8* align 1 %10661, i8 0, i64 16, i1 false)
  br label %10662

10662:                                            ; preds = %10659, %10651
  %10663 = add nuw nsw i64 %10652, 1
  %10664 = call zeroext i8 @randombit()
  %10665 = getelementptr inbounds i8, i8* %1, i64 %10663
  store i8 %10664, i8* %10665, align 1
  %10666 = getelementptr inbounds i8, i8* %1, i64 %10663
  %10667 = load i8, i8* %10666, align 1
  %10668 = zext i8 %10667 to i32
  %10669 = icmp eq i32 %10668, 0
  br i1 %10669, label %10670, label %10673

10670:                                            ; preds = %10662
  %10671 = mul nuw nsw i64 %10663, 16
  %10672 = getelementptr inbounds i8, i8* %0, i64 %10671
  call void @llvm.memset.p0i8.i64(i8* align 1 %10672, i8 0, i64 16, i1 false)
  br label %10673

10673:                                            ; preds = %10670, %10662
  %10674 = add nuw nsw i64 %10663, 1
  %10675 = call zeroext i8 @randombit()
  %10676 = getelementptr inbounds i8, i8* %1, i64 %10674
  store i8 %10675, i8* %10676, align 1
  %10677 = getelementptr inbounds i8, i8* %1, i64 %10674
  %10678 = load i8, i8* %10677, align 1
  %10679 = zext i8 %10678 to i32
  %10680 = icmp eq i32 %10679, 0
  br i1 %10680, label %10681, label %10684

10681:                                            ; preds = %10673
  %10682 = mul nuw nsw i64 %10674, 16
  %10683 = getelementptr inbounds i8, i8* %0, i64 %10682
  call void @llvm.memset.p0i8.i64(i8* align 1 %10683, i8 0, i64 16, i1 false)
  br label %10684

10684:                                            ; preds = %10681, %10673
  %10685 = add nuw nsw i64 %10674, 1
  %10686 = call zeroext i8 @randombit()
  %10687 = getelementptr inbounds i8, i8* %1, i64 %10685
  store i8 %10686, i8* %10687, align 1
  %10688 = getelementptr inbounds i8, i8* %1, i64 %10685
  %10689 = load i8, i8* %10688, align 1
  %10690 = zext i8 %10689 to i32
  %10691 = icmp eq i32 %10690, 0
  br i1 %10691, label %10692, label %10695

10692:                                            ; preds = %10684
  %10693 = mul nuw nsw i64 %10685, 16
  %10694 = getelementptr inbounds i8, i8* %0, i64 %10693
  call void @llvm.memset.p0i8.i64(i8* align 1 %10694, i8 0, i64 16, i1 false)
  br label %10695

10695:                                            ; preds = %10692, %10684
  %10696 = add nuw nsw i64 %10685, 1
  %10697 = call zeroext i8 @randombit()
  %10698 = getelementptr inbounds i8, i8* %1, i64 %10696
  store i8 %10697, i8* %10698, align 1
  %10699 = getelementptr inbounds i8, i8* %1, i64 %10696
  %10700 = load i8, i8* %10699, align 1
  %10701 = zext i8 %10700 to i32
  %10702 = icmp eq i32 %10701, 0
  br i1 %10702, label %10703, label %10706

10703:                                            ; preds = %10695
  %10704 = mul nuw nsw i64 %10696, 16
  %10705 = getelementptr inbounds i8, i8* %0, i64 %10704
  call void @llvm.memset.p0i8.i64(i8* align 1 %10705, i8 0, i64 16, i1 false)
  br label %10706

10706:                                            ; preds = %10703, %10695
  %10707 = add nuw nsw i64 %10696, 1
  %10708 = call zeroext i8 @randombit()
  %10709 = getelementptr inbounds i8, i8* %1, i64 %10707
  store i8 %10708, i8* %10709, align 1
  %10710 = getelementptr inbounds i8, i8* %1, i64 %10707
  %10711 = load i8, i8* %10710, align 1
  %10712 = zext i8 %10711 to i32
  %10713 = icmp eq i32 %10712, 0
  br i1 %10713, label %10714, label %10717

10714:                                            ; preds = %10706
  %10715 = mul nuw nsw i64 %10707, 16
  %10716 = getelementptr inbounds i8, i8* %0, i64 %10715
  call void @llvm.memset.p0i8.i64(i8* align 1 %10716, i8 0, i64 16, i1 false)
  br label %10717

10717:                                            ; preds = %10714, %10706
  %10718 = add nuw nsw i64 %10707, 1
  %10719 = call zeroext i8 @randombit()
  %10720 = getelementptr inbounds i8, i8* %1, i64 %10718
  store i8 %10719, i8* %10720, align 1
  %10721 = getelementptr inbounds i8, i8* %1, i64 %10718
  %10722 = load i8, i8* %10721, align 1
  %10723 = zext i8 %10722 to i32
  %10724 = icmp eq i32 %10723, 0
  br i1 %10724, label %10725, label %10728

10725:                                            ; preds = %10717
  %10726 = mul nuw nsw i64 %10718, 16
  %10727 = getelementptr inbounds i8, i8* %0, i64 %10726
  call void @llvm.memset.p0i8.i64(i8* align 1 %10727, i8 0, i64 16, i1 false)
  br label %10728

10728:                                            ; preds = %10725, %10717
  %10729 = add nuw nsw i64 %10718, 1
  %10730 = call zeroext i8 @randombit()
  %10731 = getelementptr inbounds i8, i8* %1, i64 %10729
  store i8 %10730, i8* %10731, align 1
  %10732 = getelementptr inbounds i8, i8* %1, i64 %10729
  %10733 = load i8, i8* %10732, align 1
  %10734 = zext i8 %10733 to i32
  %10735 = icmp eq i32 %10734, 0
  br i1 %10735, label %10736, label %10739

10736:                                            ; preds = %10728
  %10737 = mul nuw nsw i64 %10729, 16
  %10738 = getelementptr inbounds i8, i8* %0, i64 %10737
  call void @llvm.memset.p0i8.i64(i8* align 1 %10738, i8 0, i64 16, i1 false)
  br label %10739

10739:                                            ; preds = %10736, %10728
  %10740 = add nuw nsw i64 %10729, 1
  %10741 = call zeroext i8 @randombit()
  %10742 = getelementptr inbounds i8, i8* %1, i64 %10740
  store i8 %10741, i8* %10742, align 1
  %10743 = getelementptr inbounds i8, i8* %1, i64 %10740
  %10744 = load i8, i8* %10743, align 1
  %10745 = zext i8 %10744 to i32
  %10746 = icmp eq i32 %10745, 0
  br i1 %10746, label %10747, label %10750

10747:                                            ; preds = %10739
  %10748 = mul nuw nsw i64 %10740, 16
  %10749 = getelementptr inbounds i8, i8* %0, i64 %10748
  call void @llvm.memset.p0i8.i64(i8* align 1 %10749, i8 0, i64 16, i1 false)
  br label %10750

10750:                                            ; preds = %10747, %10739
  %10751 = add nuw nsw i64 %10740, 1
  %10752 = call zeroext i8 @randombit()
  %10753 = getelementptr inbounds i8, i8* %1, i64 %10751
  store i8 %10752, i8* %10753, align 1
  %10754 = getelementptr inbounds i8, i8* %1, i64 %10751
  %10755 = load i8, i8* %10754, align 1
  %10756 = zext i8 %10755 to i32
  %10757 = icmp eq i32 %10756, 0
  br i1 %10757, label %10758, label %10761

10758:                                            ; preds = %10750
  %10759 = mul nuw nsw i64 %10751, 16
  %10760 = getelementptr inbounds i8, i8* %0, i64 %10759
  call void @llvm.memset.p0i8.i64(i8* align 1 %10760, i8 0, i64 16, i1 false)
  br label %10761

10761:                                            ; preds = %10758, %10750
  %10762 = add nuw nsw i64 %10751, 1
  %10763 = call zeroext i8 @randombit()
  %10764 = getelementptr inbounds i8, i8* %1, i64 %10762
  store i8 %10763, i8* %10764, align 1
  %10765 = getelementptr inbounds i8, i8* %1, i64 %10762
  %10766 = load i8, i8* %10765, align 1
  %10767 = zext i8 %10766 to i32
  %10768 = icmp eq i32 %10767, 0
  br i1 %10768, label %10769, label %10772

10769:                                            ; preds = %10761
  %10770 = mul nuw nsw i64 %10762, 16
  %10771 = getelementptr inbounds i8, i8* %0, i64 %10770
  call void @llvm.memset.p0i8.i64(i8* align 1 %10771, i8 0, i64 16, i1 false)
  br label %10772

10772:                                            ; preds = %10769, %10761
  %10773 = add nuw nsw i64 %10762, 1
  %10774 = call zeroext i8 @randombit()
  %10775 = getelementptr inbounds i8, i8* %1, i64 %10773
  store i8 %10774, i8* %10775, align 1
  %10776 = getelementptr inbounds i8, i8* %1, i64 %10773
  %10777 = load i8, i8* %10776, align 1
  %10778 = zext i8 %10777 to i32
  %10779 = icmp eq i32 %10778, 0
  br i1 %10779, label %10780, label %10783

10780:                                            ; preds = %10772
  %10781 = mul nuw nsw i64 %10773, 16
  %10782 = getelementptr inbounds i8, i8* %0, i64 %10781
  call void @llvm.memset.p0i8.i64(i8* align 1 %10782, i8 0, i64 16, i1 false)
  br label %10783

10783:                                            ; preds = %10780, %10772
  %10784 = add nuw nsw i64 %10773, 1
  %10785 = call zeroext i8 @randombit()
  %10786 = getelementptr inbounds i8, i8* %1, i64 %10784
  store i8 %10785, i8* %10786, align 1
  %10787 = getelementptr inbounds i8, i8* %1, i64 %10784
  %10788 = load i8, i8* %10787, align 1
  %10789 = zext i8 %10788 to i32
  %10790 = icmp eq i32 %10789, 0
  br i1 %10790, label %10791, label %10794

10791:                                            ; preds = %10783
  %10792 = mul nuw nsw i64 %10784, 16
  %10793 = getelementptr inbounds i8, i8* %0, i64 %10792
  call void @llvm.memset.p0i8.i64(i8* align 1 %10793, i8 0, i64 16, i1 false)
  br label %10794

10794:                                            ; preds = %10791, %10783
  %10795 = add nuw nsw i64 %10784, 1
  %10796 = call zeroext i8 @randombit()
  %10797 = getelementptr inbounds i8, i8* %1, i64 %10795
  store i8 %10796, i8* %10797, align 1
  %10798 = getelementptr inbounds i8, i8* %1, i64 %10795
  %10799 = load i8, i8* %10798, align 1
  %10800 = zext i8 %10799 to i32
  %10801 = icmp eq i32 %10800, 0
  br i1 %10801, label %10802, label %10805

10802:                                            ; preds = %10794
  %10803 = mul nuw nsw i64 %10795, 16
  %10804 = getelementptr inbounds i8, i8* %0, i64 %10803
  call void @llvm.memset.p0i8.i64(i8* align 1 %10804, i8 0, i64 16, i1 false)
  br label %10805

10805:                                            ; preds = %10802, %10794
  %10806 = add nuw nsw i64 %10795, 1
  %10807 = call zeroext i8 @randombit()
  %10808 = getelementptr inbounds i8, i8* %1, i64 %10806
  store i8 %10807, i8* %10808, align 1
  %10809 = getelementptr inbounds i8, i8* %1, i64 %10806
  %10810 = load i8, i8* %10809, align 1
  %10811 = zext i8 %10810 to i32
  %10812 = icmp eq i32 %10811, 0
  br i1 %10812, label %10813, label %10816

10813:                                            ; preds = %10805
  %10814 = mul nuw nsw i64 %10806, 16
  %10815 = getelementptr inbounds i8, i8* %0, i64 %10814
  call void @llvm.memset.p0i8.i64(i8* align 1 %10815, i8 0, i64 16, i1 false)
  br label %10816

10816:                                            ; preds = %10813, %10805
  %10817 = add nuw nsw i64 %10806, 1
  %10818 = call zeroext i8 @randombit()
  %10819 = getelementptr inbounds i8, i8* %1, i64 %10817
  store i8 %10818, i8* %10819, align 1
  %10820 = getelementptr inbounds i8, i8* %1, i64 %10817
  %10821 = load i8, i8* %10820, align 1
  %10822 = zext i8 %10821 to i32
  %10823 = icmp eq i32 %10822, 0
  br i1 %10823, label %10824, label %10827

10824:                                            ; preds = %10816
  %10825 = mul nuw nsw i64 %10817, 16
  %10826 = getelementptr inbounds i8, i8* %0, i64 %10825
  call void @llvm.memset.p0i8.i64(i8* align 1 %10826, i8 0, i64 16, i1 false)
  br label %10827

10827:                                            ; preds = %10824, %10816
  %10828 = add nuw nsw i64 %10817, 1
  %10829 = call zeroext i8 @randombit()
  %10830 = getelementptr inbounds i8, i8* %1, i64 %10828
  store i8 %10829, i8* %10830, align 1
  %10831 = getelementptr inbounds i8, i8* %1, i64 %10828
  %10832 = load i8, i8* %10831, align 1
  %10833 = zext i8 %10832 to i32
  %10834 = icmp eq i32 %10833, 0
  br i1 %10834, label %10835, label %10838

10835:                                            ; preds = %10827
  %10836 = mul nuw nsw i64 %10828, 16
  %10837 = getelementptr inbounds i8, i8* %0, i64 %10836
  call void @llvm.memset.p0i8.i64(i8* align 1 %10837, i8 0, i64 16, i1 false)
  br label %10838

10838:                                            ; preds = %10835, %10827
  %10839 = add nuw nsw i64 %10828, 1
  %10840 = call zeroext i8 @randombit()
  %10841 = getelementptr inbounds i8, i8* %1, i64 %10839
  store i8 %10840, i8* %10841, align 1
  %10842 = getelementptr inbounds i8, i8* %1, i64 %10839
  %10843 = load i8, i8* %10842, align 1
  %10844 = zext i8 %10843 to i32
  %10845 = icmp eq i32 %10844, 0
  br i1 %10845, label %10846, label %10849

10846:                                            ; preds = %10838
  %10847 = mul nuw nsw i64 %10839, 16
  %10848 = getelementptr inbounds i8, i8* %0, i64 %10847
  call void @llvm.memset.p0i8.i64(i8* align 1 %10848, i8 0, i64 16, i1 false)
  br label %10849

10849:                                            ; preds = %10846, %10838
  %10850 = add nuw nsw i64 %10839, 1
  %10851 = call zeroext i8 @randombit()
  %10852 = getelementptr inbounds i8, i8* %1, i64 %10850
  store i8 %10851, i8* %10852, align 1
  %10853 = getelementptr inbounds i8, i8* %1, i64 %10850
  %10854 = load i8, i8* %10853, align 1
  %10855 = zext i8 %10854 to i32
  %10856 = icmp eq i32 %10855, 0
  br i1 %10856, label %10857, label %10860

10857:                                            ; preds = %10849
  %10858 = mul nuw nsw i64 %10850, 16
  %10859 = getelementptr inbounds i8, i8* %0, i64 %10858
  call void @llvm.memset.p0i8.i64(i8* align 1 %10859, i8 0, i64 16, i1 false)
  br label %10860

10860:                                            ; preds = %10857, %10849
  %10861 = add nuw nsw i64 %10850, 1
  %10862 = call zeroext i8 @randombit()
  %10863 = getelementptr inbounds i8, i8* %1, i64 %10861
  store i8 %10862, i8* %10863, align 1
  %10864 = getelementptr inbounds i8, i8* %1, i64 %10861
  %10865 = load i8, i8* %10864, align 1
  %10866 = zext i8 %10865 to i32
  %10867 = icmp eq i32 %10866, 0
  br i1 %10867, label %10868, label %10871

10868:                                            ; preds = %10860
  %10869 = mul nuw nsw i64 %10861, 16
  %10870 = getelementptr inbounds i8, i8* %0, i64 %10869
  call void @llvm.memset.p0i8.i64(i8* align 1 %10870, i8 0, i64 16, i1 false)
  br label %10871

10871:                                            ; preds = %10868, %10860
  %10872 = add nuw nsw i64 %10861, 1
  %10873 = call zeroext i8 @randombit()
  %10874 = getelementptr inbounds i8, i8* %1, i64 %10872
  store i8 %10873, i8* %10874, align 1
  %10875 = getelementptr inbounds i8, i8* %1, i64 %10872
  %10876 = load i8, i8* %10875, align 1
  %10877 = zext i8 %10876 to i32
  %10878 = icmp eq i32 %10877, 0
  br i1 %10878, label %10879, label %10882

10879:                                            ; preds = %10871
  %10880 = mul nuw nsw i64 %10872, 16
  %10881 = getelementptr inbounds i8, i8* %0, i64 %10880
  call void @llvm.memset.p0i8.i64(i8* align 1 %10881, i8 0, i64 16, i1 false)
  br label %10882

10882:                                            ; preds = %10879, %10871
  %10883 = add nuw nsw i64 %10872, 1
  %10884 = call zeroext i8 @randombit()
  %10885 = getelementptr inbounds i8, i8* %1, i64 %10883
  store i8 %10884, i8* %10885, align 1
  %10886 = getelementptr inbounds i8, i8* %1, i64 %10883
  %10887 = load i8, i8* %10886, align 1
  %10888 = zext i8 %10887 to i32
  %10889 = icmp eq i32 %10888, 0
  br i1 %10889, label %10890, label %10893

10890:                                            ; preds = %10882
  %10891 = mul nuw nsw i64 %10883, 16
  %10892 = getelementptr inbounds i8, i8* %0, i64 %10891
  call void @llvm.memset.p0i8.i64(i8* align 1 %10892, i8 0, i64 16, i1 false)
  br label %10893

10893:                                            ; preds = %10890, %10882
  %10894 = add nuw nsw i64 %10883, 1
  %10895 = call zeroext i8 @randombit()
  %10896 = getelementptr inbounds i8, i8* %1, i64 %10894
  store i8 %10895, i8* %10896, align 1
  %10897 = getelementptr inbounds i8, i8* %1, i64 %10894
  %10898 = load i8, i8* %10897, align 1
  %10899 = zext i8 %10898 to i32
  %10900 = icmp eq i32 %10899, 0
  br i1 %10900, label %10901, label %10904

10901:                                            ; preds = %10893
  %10902 = mul nuw nsw i64 %10894, 16
  %10903 = getelementptr inbounds i8, i8* %0, i64 %10902
  call void @llvm.memset.p0i8.i64(i8* align 1 %10903, i8 0, i64 16, i1 false)
  br label %10904

10904:                                            ; preds = %10901, %10893
  %10905 = add nuw nsw i64 %10894, 1
  %10906 = call zeroext i8 @randombit()
  %10907 = getelementptr inbounds i8, i8* %1, i64 %10905
  store i8 %10906, i8* %10907, align 1
  %10908 = getelementptr inbounds i8, i8* %1, i64 %10905
  %10909 = load i8, i8* %10908, align 1
  %10910 = zext i8 %10909 to i32
  %10911 = icmp eq i32 %10910, 0
  br i1 %10911, label %10912, label %10915

10912:                                            ; preds = %10904
  %10913 = mul nuw nsw i64 %10905, 16
  %10914 = getelementptr inbounds i8, i8* %0, i64 %10913
  call void @llvm.memset.p0i8.i64(i8* align 1 %10914, i8 0, i64 16, i1 false)
  br label %10915

10915:                                            ; preds = %10912, %10904
  %10916 = add nuw nsw i64 %10905, 1
  %10917 = call zeroext i8 @randombit()
  %10918 = getelementptr inbounds i8, i8* %1, i64 %10916
  store i8 %10917, i8* %10918, align 1
  %10919 = getelementptr inbounds i8, i8* %1, i64 %10916
  %10920 = load i8, i8* %10919, align 1
  %10921 = zext i8 %10920 to i32
  %10922 = icmp eq i32 %10921, 0
  br i1 %10922, label %10923, label %10926

10923:                                            ; preds = %10915
  %10924 = mul nuw nsw i64 %10916, 16
  %10925 = getelementptr inbounds i8, i8* %0, i64 %10924
  call void @llvm.memset.p0i8.i64(i8* align 1 %10925, i8 0, i64 16, i1 false)
  br label %10926

10926:                                            ; preds = %10923, %10915
  %10927 = add nuw nsw i64 %10916, 1
  %10928 = call zeroext i8 @randombit()
  %10929 = getelementptr inbounds i8, i8* %1, i64 %10927
  store i8 %10928, i8* %10929, align 1
  %10930 = getelementptr inbounds i8, i8* %1, i64 %10927
  %10931 = load i8, i8* %10930, align 1
  %10932 = zext i8 %10931 to i32
  %10933 = icmp eq i32 %10932, 0
  br i1 %10933, label %10934, label %10937

10934:                                            ; preds = %10926
  %10935 = mul nuw nsw i64 %10927, 16
  %10936 = getelementptr inbounds i8, i8* %0, i64 %10935
  call void @llvm.memset.p0i8.i64(i8* align 1 %10936, i8 0, i64 16, i1 false)
  br label %10937

10937:                                            ; preds = %10934, %10926
  %10938 = add nuw nsw i64 %10927, 1
  %10939 = call zeroext i8 @randombit()
  %10940 = getelementptr inbounds i8, i8* %1, i64 %10938
  store i8 %10939, i8* %10940, align 1
  %10941 = getelementptr inbounds i8, i8* %1, i64 %10938
  %10942 = load i8, i8* %10941, align 1
  %10943 = zext i8 %10942 to i32
  %10944 = icmp eq i32 %10943, 0
  br i1 %10944, label %10945, label %10948

10945:                                            ; preds = %10937
  %10946 = mul nuw nsw i64 %10938, 16
  %10947 = getelementptr inbounds i8, i8* %0, i64 %10946
  call void @llvm.memset.p0i8.i64(i8* align 1 %10947, i8 0, i64 16, i1 false)
  br label %10948

10948:                                            ; preds = %10945, %10937
  %10949 = add nuw nsw i64 %10938, 1
  %10950 = call zeroext i8 @randombit()
  %10951 = getelementptr inbounds i8, i8* %1, i64 %10949
  store i8 %10950, i8* %10951, align 1
  %10952 = getelementptr inbounds i8, i8* %1, i64 %10949
  %10953 = load i8, i8* %10952, align 1
  %10954 = zext i8 %10953 to i32
  %10955 = icmp eq i32 %10954, 0
  br i1 %10955, label %10956, label %10959

10956:                                            ; preds = %10948
  %10957 = mul nuw nsw i64 %10949, 16
  %10958 = getelementptr inbounds i8, i8* %0, i64 %10957
  call void @llvm.memset.p0i8.i64(i8* align 1 %10958, i8 0, i64 16, i1 false)
  br label %10959

10959:                                            ; preds = %10956, %10948
  %10960 = add nuw nsw i64 %10949, 1
  %10961 = call zeroext i8 @randombit()
  %10962 = getelementptr inbounds i8, i8* %1, i64 %10960
  store i8 %10961, i8* %10962, align 1
  %10963 = getelementptr inbounds i8, i8* %1, i64 %10960
  %10964 = load i8, i8* %10963, align 1
  %10965 = zext i8 %10964 to i32
  %10966 = icmp eq i32 %10965, 0
  br i1 %10966, label %10967, label %10970

10967:                                            ; preds = %10959
  %10968 = mul nuw nsw i64 %10960, 16
  %10969 = getelementptr inbounds i8, i8* %0, i64 %10968
  call void @llvm.memset.p0i8.i64(i8* align 1 %10969, i8 0, i64 16, i1 false)
  br label %10970

10970:                                            ; preds = %10967, %10959
  %10971 = add nuw nsw i64 %10960, 1
  %10972 = call zeroext i8 @randombit()
  %10973 = getelementptr inbounds i8, i8* %1, i64 %10971
  store i8 %10972, i8* %10973, align 1
  %10974 = getelementptr inbounds i8, i8* %1, i64 %10971
  %10975 = load i8, i8* %10974, align 1
  %10976 = zext i8 %10975 to i32
  %10977 = icmp eq i32 %10976, 0
  br i1 %10977, label %10978, label %10981

10978:                                            ; preds = %10970
  %10979 = mul nuw nsw i64 %10971, 16
  %10980 = getelementptr inbounds i8, i8* %0, i64 %10979
  call void @llvm.memset.p0i8.i64(i8* align 1 %10980, i8 0, i64 16, i1 false)
  br label %10981

10981:                                            ; preds = %10978, %10970
  %10982 = add nuw nsw i64 %10971, 1
  %10983 = call zeroext i8 @randombit()
  %10984 = getelementptr inbounds i8, i8* %1, i64 %10982
  store i8 %10983, i8* %10984, align 1
  %10985 = getelementptr inbounds i8, i8* %1, i64 %10982
  %10986 = load i8, i8* %10985, align 1
  %10987 = zext i8 %10986 to i32
  %10988 = icmp eq i32 %10987, 0
  br i1 %10988, label %10989, label %10992

10989:                                            ; preds = %10981
  %10990 = mul nuw nsw i64 %10982, 16
  %10991 = getelementptr inbounds i8, i8* %0, i64 %10990
  call void @llvm.memset.p0i8.i64(i8* align 1 %10991, i8 0, i64 16, i1 false)
  br label %10992

10992:                                            ; preds = %10989, %10981
  %10993 = add nuw nsw i64 %10982, 1
  %10994 = call zeroext i8 @randombit()
  %10995 = getelementptr inbounds i8, i8* %1, i64 %10993
  store i8 %10994, i8* %10995, align 1
  %10996 = getelementptr inbounds i8, i8* %1, i64 %10993
  %10997 = load i8, i8* %10996, align 1
  %10998 = zext i8 %10997 to i32
  %10999 = icmp eq i32 %10998, 0
  br i1 %10999, label %11000, label %11003

11000:                                            ; preds = %10992
  %11001 = mul nuw nsw i64 %10993, 16
  %11002 = getelementptr inbounds i8, i8* %0, i64 %11001
  call void @llvm.memset.p0i8.i64(i8* align 1 %11002, i8 0, i64 16, i1 false)
  br label %11003

11003:                                            ; preds = %11000, %10992
  %11004 = add nuw nsw i64 %10993, 1
  %11005 = call zeroext i8 @randombit()
  %11006 = getelementptr inbounds i8, i8* %1, i64 %11004
  store i8 %11005, i8* %11006, align 1
  %11007 = getelementptr inbounds i8, i8* %1, i64 %11004
  %11008 = load i8, i8* %11007, align 1
  %11009 = zext i8 %11008 to i32
  %11010 = icmp eq i32 %11009, 0
  br i1 %11010, label %11011, label %11014

11011:                                            ; preds = %11003
  %11012 = mul nuw nsw i64 %11004, 16
  %11013 = getelementptr inbounds i8, i8* %0, i64 %11012
  call void @llvm.memset.p0i8.i64(i8* align 1 %11013, i8 0, i64 16, i1 false)
  br label %11014

11014:                                            ; preds = %11011, %11003
  %11015 = add nuw nsw i64 %11004, 1
  %11016 = call zeroext i8 @randombit()
  %11017 = getelementptr inbounds i8, i8* %1, i64 %11015
  store i8 %11016, i8* %11017, align 1
  %11018 = getelementptr inbounds i8, i8* %1, i64 %11015
  %11019 = load i8, i8* %11018, align 1
  %11020 = zext i8 %11019 to i32
  %11021 = icmp eq i32 %11020, 0
  br i1 %11021, label %11022, label %11025

11022:                                            ; preds = %11014
  %11023 = mul nuw nsw i64 %11015, 16
  %11024 = getelementptr inbounds i8, i8* %0, i64 %11023
  call void @llvm.memset.p0i8.i64(i8* align 1 %11024, i8 0, i64 16, i1 false)
  br label %11025

11025:                                            ; preds = %11022, %11014
  %11026 = add nuw nsw i64 %11015, 1
  %11027 = call zeroext i8 @randombit()
  %11028 = getelementptr inbounds i8, i8* %1, i64 %11026
  store i8 %11027, i8* %11028, align 1
  %11029 = getelementptr inbounds i8, i8* %1, i64 %11026
  %11030 = load i8, i8* %11029, align 1
  %11031 = zext i8 %11030 to i32
  %11032 = icmp eq i32 %11031, 0
  br i1 %11032, label %11033, label %11036

11033:                                            ; preds = %11025
  %11034 = mul nuw nsw i64 %11026, 16
  %11035 = getelementptr inbounds i8, i8* %0, i64 %11034
  call void @llvm.memset.p0i8.i64(i8* align 1 %11035, i8 0, i64 16, i1 false)
  br label %11036

11036:                                            ; preds = %11033, %11025
  %11037 = add nuw nsw i64 %11026, 1
  %11038 = call zeroext i8 @randombit()
  %11039 = getelementptr inbounds i8, i8* %1, i64 %11037
  store i8 %11038, i8* %11039, align 1
  %11040 = getelementptr inbounds i8, i8* %1, i64 %11037
  %11041 = load i8, i8* %11040, align 1
  %11042 = zext i8 %11041 to i32
  %11043 = icmp eq i32 %11042, 0
  br i1 %11043, label %11044, label %11047

11044:                                            ; preds = %11036
  %11045 = mul nuw nsw i64 %11037, 16
  %11046 = getelementptr inbounds i8, i8* %0, i64 %11045
  call void @llvm.memset.p0i8.i64(i8* align 1 %11046, i8 0, i64 16, i1 false)
  br label %11047

11047:                                            ; preds = %11044, %11036
  %11048 = add nuw nsw i64 %11037, 1
  %11049 = call zeroext i8 @randombit()
  %11050 = getelementptr inbounds i8, i8* %1, i64 %11048
  store i8 %11049, i8* %11050, align 1
  %11051 = getelementptr inbounds i8, i8* %1, i64 %11048
  %11052 = load i8, i8* %11051, align 1
  %11053 = zext i8 %11052 to i32
  %11054 = icmp eq i32 %11053, 0
  br i1 %11054, label %11055, label %11058

11055:                                            ; preds = %11047
  %11056 = mul nuw nsw i64 %11048, 16
  %11057 = getelementptr inbounds i8, i8* %0, i64 %11056
  call void @llvm.memset.p0i8.i64(i8* align 1 %11057, i8 0, i64 16, i1 false)
  br label %11058

11058:                                            ; preds = %11055, %11047
  %11059 = add nuw nsw i64 %11048, 1
  %11060 = call zeroext i8 @randombit()
  %11061 = getelementptr inbounds i8, i8* %1, i64 %11059
  store i8 %11060, i8* %11061, align 1
  %11062 = getelementptr inbounds i8, i8* %1, i64 %11059
  %11063 = load i8, i8* %11062, align 1
  %11064 = zext i8 %11063 to i32
  %11065 = icmp eq i32 %11064, 0
  br i1 %11065, label %11066, label %11069

11066:                                            ; preds = %11058
  %11067 = mul nuw nsw i64 %11059, 16
  %11068 = getelementptr inbounds i8, i8* %0, i64 %11067
  call void @llvm.memset.p0i8.i64(i8* align 1 %11068, i8 0, i64 16, i1 false)
  br label %11069

11069:                                            ; preds = %11066, %11058
  %11070 = add nuw nsw i64 %11059, 1
  %11071 = call zeroext i8 @randombit()
  %11072 = getelementptr inbounds i8, i8* %1, i64 %11070
  store i8 %11071, i8* %11072, align 1
  %11073 = getelementptr inbounds i8, i8* %1, i64 %11070
  %11074 = load i8, i8* %11073, align 1
  %11075 = zext i8 %11074 to i32
  %11076 = icmp eq i32 %11075, 0
  br i1 %11076, label %11077, label %11080

11077:                                            ; preds = %11069
  %11078 = mul nuw nsw i64 %11070, 16
  %11079 = getelementptr inbounds i8, i8* %0, i64 %11078
  call void @llvm.memset.p0i8.i64(i8* align 1 %11079, i8 0, i64 16, i1 false)
  br label %11080

11080:                                            ; preds = %11077, %11069
  %11081 = add nuw nsw i64 %11070, 1
  %11082 = call zeroext i8 @randombit()
  %11083 = getelementptr inbounds i8, i8* %1, i64 %11081
  store i8 %11082, i8* %11083, align 1
  %11084 = getelementptr inbounds i8, i8* %1, i64 %11081
  %11085 = load i8, i8* %11084, align 1
  %11086 = zext i8 %11085 to i32
  %11087 = icmp eq i32 %11086, 0
  br i1 %11087, label %11088, label %11091

11088:                                            ; preds = %11080
  %11089 = mul nuw nsw i64 %11081, 16
  %11090 = getelementptr inbounds i8, i8* %0, i64 %11089
  call void @llvm.memset.p0i8.i64(i8* align 1 %11090, i8 0, i64 16, i1 false)
  br label %11091

11091:                                            ; preds = %11088, %11080
  %11092 = add nuw nsw i64 %11081, 1
  %11093 = call zeroext i8 @randombit()
  %11094 = getelementptr inbounds i8, i8* %1, i64 %11092
  store i8 %11093, i8* %11094, align 1
  %11095 = getelementptr inbounds i8, i8* %1, i64 %11092
  %11096 = load i8, i8* %11095, align 1
  %11097 = zext i8 %11096 to i32
  %11098 = icmp eq i32 %11097, 0
  br i1 %11098, label %11099, label %11102

11099:                                            ; preds = %11091
  %11100 = mul nuw nsw i64 %11092, 16
  %11101 = getelementptr inbounds i8, i8* %0, i64 %11100
  call void @llvm.memset.p0i8.i64(i8* align 1 %11101, i8 0, i64 16, i1 false)
  br label %11102

11102:                                            ; preds = %11099, %11091
  %11103 = add nuw nsw i64 %11092, 1
  %11104 = call zeroext i8 @randombit()
  %11105 = getelementptr inbounds i8, i8* %1, i64 %11103
  store i8 %11104, i8* %11105, align 1
  %11106 = getelementptr inbounds i8, i8* %1, i64 %11103
  %11107 = load i8, i8* %11106, align 1
  %11108 = zext i8 %11107 to i32
  %11109 = icmp eq i32 %11108, 0
  br i1 %11109, label %11110, label %11113

11110:                                            ; preds = %11102
  %11111 = mul nuw nsw i64 %11103, 16
  %11112 = getelementptr inbounds i8, i8* %0, i64 %11111
  call void @llvm.memset.p0i8.i64(i8* align 1 %11112, i8 0, i64 16, i1 false)
  br label %11113

11113:                                            ; preds = %11110, %11102
  %11114 = add nuw nsw i64 %11103, 1
  %11115 = call zeroext i8 @randombit()
  %11116 = getelementptr inbounds i8, i8* %1, i64 %11114
  store i8 %11115, i8* %11116, align 1
  %11117 = getelementptr inbounds i8, i8* %1, i64 %11114
  %11118 = load i8, i8* %11117, align 1
  %11119 = zext i8 %11118 to i32
  %11120 = icmp eq i32 %11119, 0
  br i1 %11120, label %11121, label %11124

11121:                                            ; preds = %11113
  %11122 = mul nuw nsw i64 %11114, 16
  %11123 = getelementptr inbounds i8, i8* %0, i64 %11122
  call void @llvm.memset.p0i8.i64(i8* align 1 %11123, i8 0, i64 16, i1 false)
  br label %11124

11124:                                            ; preds = %11121, %11113
  %11125 = add nuw nsw i64 %11114, 1
  %11126 = call zeroext i8 @randombit()
  %11127 = getelementptr inbounds i8, i8* %1, i64 %11125
  store i8 %11126, i8* %11127, align 1
  %11128 = getelementptr inbounds i8, i8* %1, i64 %11125
  %11129 = load i8, i8* %11128, align 1
  %11130 = zext i8 %11129 to i32
  %11131 = icmp eq i32 %11130, 0
  br i1 %11131, label %11132, label %11135

11132:                                            ; preds = %11124
  %11133 = mul nuw nsw i64 %11125, 16
  %11134 = getelementptr inbounds i8, i8* %0, i64 %11133
  call void @llvm.memset.p0i8.i64(i8* align 1 %11134, i8 0, i64 16, i1 false)
  br label %11135

11135:                                            ; preds = %11132, %11124
  %11136 = add nuw nsw i64 %11125, 1
  %11137 = call zeroext i8 @randombit()
  %11138 = getelementptr inbounds i8, i8* %1, i64 %11136
  store i8 %11137, i8* %11138, align 1
  %11139 = getelementptr inbounds i8, i8* %1, i64 %11136
  %11140 = load i8, i8* %11139, align 1
  %11141 = zext i8 %11140 to i32
  %11142 = icmp eq i32 %11141, 0
  br i1 %11142, label %11143, label %11146

11143:                                            ; preds = %11135
  %11144 = mul nuw nsw i64 %11136, 16
  %11145 = getelementptr inbounds i8, i8* %0, i64 %11144
  call void @llvm.memset.p0i8.i64(i8* align 1 %11145, i8 0, i64 16, i1 false)
  br label %11146

11146:                                            ; preds = %11143, %11135
  %11147 = add nuw nsw i64 %11136, 1
  %11148 = call zeroext i8 @randombit()
  %11149 = getelementptr inbounds i8, i8* %1, i64 %11147
  store i8 %11148, i8* %11149, align 1
  %11150 = getelementptr inbounds i8, i8* %1, i64 %11147
  %11151 = load i8, i8* %11150, align 1
  %11152 = zext i8 %11151 to i32
  %11153 = icmp eq i32 %11152, 0
  br i1 %11153, label %11154, label %11157

11154:                                            ; preds = %11146
  %11155 = mul nuw nsw i64 %11147, 16
  %11156 = getelementptr inbounds i8, i8* %0, i64 %11155
  call void @llvm.memset.p0i8.i64(i8* align 1 %11156, i8 0, i64 16, i1 false)
  br label %11157

11157:                                            ; preds = %11154, %11146
  %11158 = add nuw nsw i64 %11147, 1
  %11159 = call zeroext i8 @randombit()
  %11160 = getelementptr inbounds i8, i8* %1, i64 %11158
  store i8 %11159, i8* %11160, align 1
  %11161 = getelementptr inbounds i8, i8* %1, i64 %11158
  %11162 = load i8, i8* %11161, align 1
  %11163 = zext i8 %11162 to i32
  %11164 = icmp eq i32 %11163, 0
  br i1 %11164, label %11165, label %11168

11165:                                            ; preds = %11157
  %11166 = mul nuw nsw i64 %11158, 16
  %11167 = getelementptr inbounds i8, i8* %0, i64 %11166
  call void @llvm.memset.p0i8.i64(i8* align 1 %11167, i8 0, i64 16, i1 false)
  br label %11168

11168:                                            ; preds = %11165, %11157
  %11169 = add nuw nsw i64 %11158, 1
  %11170 = call zeroext i8 @randombit()
  %11171 = getelementptr inbounds i8, i8* %1, i64 %11169
  store i8 %11170, i8* %11171, align 1
  %11172 = getelementptr inbounds i8, i8* %1, i64 %11169
  %11173 = load i8, i8* %11172, align 1
  %11174 = zext i8 %11173 to i32
  %11175 = icmp eq i32 %11174, 0
  br i1 %11175, label %11176, label %11179

11176:                                            ; preds = %11168
  %11177 = mul nuw nsw i64 %11169, 16
  %11178 = getelementptr inbounds i8, i8* %0, i64 %11177
  call void @llvm.memset.p0i8.i64(i8* align 1 %11178, i8 0, i64 16, i1 false)
  br label %11179

11179:                                            ; preds = %11176, %11168
  %11180 = add nuw nsw i64 %11169, 1
  %11181 = call zeroext i8 @randombit()
  %11182 = getelementptr inbounds i8, i8* %1, i64 %11180
  store i8 %11181, i8* %11182, align 1
  %11183 = getelementptr inbounds i8, i8* %1, i64 %11180
  %11184 = load i8, i8* %11183, align 1
  %11185 = zext i8 %11184 to i32
  %11186 = icmp eq i32 %11185, 0
  br i1 %11186, label %11187, label %11190

11187:                                            ; preds = %11179
  %11188 = mul nuw nsw i64 %11180, 16
  %11189 = getelementptr inbounds i8, i8* %0, i64 %11188
  call void @llvm.memset.p0i8.i64(i8* align 1 %11189, i8 0, i64 16, i1 false)
  br label %11190

11190:                                            ; preds = %11187, %11179
  %11191 = add nuw nsw i64 %11180, 1
  %11192 = call zeroext i8 @randombit()
  %11193 = getelementptr inbounds i8, i8* %1, i64 %11191
  store i8 %11192, i8* %11193, align 1
  %11194 = getelementptr inbounds i8, i8* %1, i64 %11191
  %11195 = load i8, i8* %11194, align 1
  %11196 = zext i8 %11195 to i32
  %11197 = icmp eq i32 %11196, 0
  br i1 %11197, label %11198, label %11201

11198:                                            ; preds = %11190
  %11199 = mul nuw nsw i64 %11191, 16
  %11200 = getelementptr inbounds i8, i8* %0, i64 %11199
  call void @llvm.memset.p0i8.i64(i8* align 1 %11200, i8 0, i64 16, i1 false)
  br label %11201

11201:                                            ; preds = %11198, %11190
  %11202 = add nuw nsw i64 %11191, 1
  %11203 = call zeroext i8 @randombit()
  %11204 = getelementptr inbounds i8, i8* %1, i64 %11202
  store i8 %11203, i8* %11204, align 1
  %11205 = getelementptr inbounds i8, i8* %1, i64 %11202
  %11206 = load i8, i8* %11205, align 1
  %11207 = zext i8 %11206 to i32
  %11208 = icmp eq i32 %11207, 0
  br i1 %11208, label %11209, label %11212

11209:                                            ; preds = %11201
  %11210 = mul nuw nsw i64 %11202, 16
  %11211 = getelementptr inbounds i8, i8* %0, i64 %11210
  call void @llvm.memset.p0i8.i64(i8* align 1 %11211, i8 0, i64 16, i1 false)
  br label %11212

11212:                                            ; preds = %11209, %11201
  %11213 = add nuw nsw i64 %11202, 1
  %11214 = call zeroext i8 @randombit()
  %11215 = getelementptr inbounds i8, i8* %1, i64 %11213
  store i8 %11214, i8* %11215, align 1
  %11216 = getelementptr inbounds i8, i8* %1, i64 %11213
  %11217 = load i8, i8* %11216, align 1
  %11218 = zext i8 %11217 to i32
  %11219 = icmp eq i32 %11218, 0
  br i1 %11219, label %11220, label %11223

11220:                                            ; preds = %11212
  %11221 = mul nuw nsw i64 %11213, 16
  %11222 = getelementptr inbounds i8, i8* %0, i64 %11221
  call void @llvm.memset.p0i8.i64(i8* align 1 %11222, i8 0, i64 16, i1 false)
  br label %11223

11223:                                            ; preds = %11220, %11212
  %11224 = add nuw nsw i64 %11213, 1
  %11225 = call zeroext i8 @randombit()
  %11226 = getelementptr inbounds i8, i8* %1, i64 %11224
  store i8 %11225, i8* %11226, align 1
  %11227 = getelementptr inbounds i8, i8* %1, i64 %11224
  %11228 = load i8, i8* %11227, align 1
  %11229 = zext i8 %11228 to i32
  %11230 = icmp eq i32 %11229, 0
  br i1 %11230, label %11231, label %11234

11231:                                            ; preds = %11223
  %11232 = mul nuw nsw i64 %11224, 16
  %11233 = getelementptr inbounds i8, i8* %0, i64 %11232
  call void @llvm.memset.p0i8.i64(i8* align 1 %11233, i8 0, i64 16, i1 false)
  br label %11234

11234:                                            ; preds = %11231, %11223
  %11235 = add nuw nsw i64 %11224, 1
  %11236 = call zeroext i8 @randombit()
  %11237 = getelementptr inbounds i8, i8* %1, i64 %11235
  store i8 %11236, i8* %11237, align 1
  %11238 = getelementptr inbounds i8, i8* %1, i64 %11235
  %11239 = load i8, i8* %11238, align 1
  %11240 = zext i8 %11239 to i32
  %11241 = icmp eq i32 %11240, 0
  br i1 %11241, label %11242, label %11245

11242:                                            ; preds = %11234
  %11243 = mul nuw nsw i64 %11235, 16
  %11244 = getelementptr inbounds i8, i8* %0, i64 %11243
  call void @llvm.memset.p0i8.i64(i8* align 1 %11244, i8 0, i64 16, i1 false)
  br label %11245

11245:                                            ; preds = %11242, %11234
  %11246 = add nuw nsw i64 %11235, 1
  %11247 = call zeroext i8 @randombit()
  %11248 = getelementptr inbounds i8, i8* %1, i64 %11246
  store i8 %11247, i8* %11248, align 1
  %11249 = getelementptr inbounds i8, i8* %1, i64 %11246
  %11250 = load i8, i8* %11249, align 1
  %11251 = zext i8 %11250 to i32
  %11252 = icmp eq i32 %11251, 0
  br i1 %11252, label %11253, label %11256

11253:                                            ; preds = %11245
  %11254 = mul nuw nsw i64 %11246, 16
  %11255 = getelementptr inbounds i8, i8* %0, i64 %11254
  call void @llvm.memset.p0i8.i64(i8* align 1 %11255, i8 0, i64 16, i1 false)
  br label %11256

11256:                                            ; preds = %11253, %11245
  %11257 = add nuw nsw i64 %11246, 1
  %11258 = call zeroext i8 @randombit()
  %11259 = getelementptr inbounds i8, i8* %1, i64 %11257
  store i8 %11258, i8* %11259, align 1
  %11260 = getelementptr inbounds i8, i8* %1, i64 %11257
  %11261 = load i8, i8* %11260, align 1
  %11262 = zext i8 %11261 to i32
  %11263 = icmp eq i32 %11262, 0
  br i1 %11263, label %11264, label %11267

11264:                                            ; preds = %11256
  %11265 = mul nuw nsw i64 %11257, 16
  %11266 = getelementptr inbounds i8, i8* %0, i64 %11265
  call void @llvm.memset.p0i8.i64(i8* align 1 %11266, i8 0, i64 16, i1 false)
  br label %11267

11267:                                            ; preds = %11264, %11256
  %11268 = add nuw nsw i64 %11257, 1
  %11269 = call zeroext i8 @randombit()
  %11270 = getelementptr inbounds i8, i8* %1, i64 %11268
  store i8 %11269, i8* %11270, align 1
  %11271 = getelementptr inbounds i8, i8* %1, i64 %11268
  %11272 = load i8, i8* %11271, align 1
  %11273 = zext i8 %11272 to i32
  %11274 = icmp eq i32 %11273, 0
  br i1 %11274, label %11275, label %11278

11275:                                            ; preds = %11267
  %11276 = mul nuw nsw i64 %11268, 16
  %11277 = getelementptr inbounds i8, i8* %0, i64 %11276
  call void @llvm.memset.p0i8.i64(i8* align 1 %11277, i8 0, i64 16, i1 false)
  br label %11278

11278:                                            ; preds = %11275, %11267
  %11279 = add nuw nsw i64 %11268, 1
  %11280 = call zeroext i8 @randombit()
  %11281 = getelementptr inbounds i8, i8* %1, i64 %11279
  store i8 %11280, i8* %11281, align 1
  %11282 = getelementptr inbounds i8, i8* %1, i64 %11279
  %11283 = load i8, i8* %11282, align 1
  %11284 = zext i8 %11283 to i32
  %11285 = icmp eq i32 %11284, 0
  br i1 %11285, label %11286, label %11289

11286:                                            ; preds = %11278
  %11287 = mul nuw nsw i64 %11279, 16
  %11288 = getelementptr inbounds i8, i8* %0, i64 %11287
  call void @llvm.memset.p0i8.i64(i8* align 1 %11288, i8 0, i64 16, i1 false)
  br label %11289

11289:                                            ; preds = %11286, %11278
  %11290 = add nuw nsw i64 %11279, 1
  %11291 = call zeroext i8 @randombit()
  %11292 = getelementptr inbounds i8, i8* %1, i64 %11290
  store i8 %11291, i8* %11292, align 1
  %11293 = getelementptr inbounds i8, i8* %1, i64 %11290
  %11294 = load i8, i8* %11293, align 1
  %11295 = zext i8 %11294 to i32
  %11296 = icmp eq i32 %11295, 0
  br i1 %11296, label %11297, label %11300

11297:                                            ; preds = %11289
  %11298 = mul nuw nsw i64 %11290, 16
  %11299 = getelementptr inbounds i8, i8* %0, i64 %11298
  call void @llvm.memset.p0i8.i64(i8* align 1 %11299, i8 0, i64 16, i1 false)
  br label %11300

11300:                                            ; preds = %11297, %11289
  %11301 = add nuw nsw i64 %11290, 1
  %11302 = call zeroext i8 @randombit()
  %11303 = getelementptr inbounds i8, i8* %1, i64 %11301
  store i8 %11302, i8* %11303, align 1
  %11304 = getelementptr inbounds i8, i8* %1, i64 %11301
  %11305 = load i8, i8* %11304, align 1
  %11306 = zext i8 %11305 to i32
  %11307 = icmp eq i32 %11306, 0
  br i1 %11307, label %11308, label %11311

11308:                                            ; preds = %11300
  %11309 = mul nuw nsw i64 %11301, 16
  %11310 = getelementptr inbounds i8, i8* %0, i64 %11309
  call void @llvm.memset.p0i8.i64(i8* align 1 %11310, i8 0, i64 16, i1 false)
  br label %11311

11311:                                            ; preds = %11308, %11300
  %11312 = add nuw nsw i64 %11301, 1
  %11313 = call zeroext i8 @randombit()
  %11314 = getelementptr inbounds i8, i8* %1, i64 %11312
  store i8 %11313, i8* %11314, align 1
  %11315 = getelementptr inbounds i8, i8* %1, i64 %11312
  %11316 = load i8, i8* %11315, align 1
  %11317 = zext i8 %11316 to i32
  %11318 = icmp eq i32 %11317, 0
  br i1 %11318, label %11319, label %11322

11319:                                            ; preds = %11311
  %11320 = mul nuw nsw i64 %11312, 16
  %11321 = getelementptr inbounds i8, i8* %0, i64 %11320
  call void @llvm.memset.p0i8.i64(i8* align 1 %11321, i8 0, i64 16, i1 false)
  br label %11322

11322:                                            ; preds = %11319, %11311
  %11323 = add nuw nsw i64 %11312, 1
  %11324 = call zeroext i8 @randombit()
  %11325 = getelementptr inbounds i8, i8* %1, i64 %11323
  store i8 %11324, i8* %11325, align 1
  %11326 = getelementptr inbounds i8, i8* %1, i64 %11323
  %11327 = load i8, i8* %11326, align 1
  %11328 = zext i8 %11327 to i32
  %11329 = icmp eq i32 %11328, 0
  br i1 %11329, label %11330, label %11333

11330:                                            ; preds = %11322
  %11331 = mul nuw nsw i64 %11323, 16
  %11332 = getelementptr inbounds i8, i8* %0, i64 %11331
  call void @llvm.memset.p0i8.i64(i8* align 1 %11332, i8 0, i64 16, i1 false)
  br label %11333

11333:                                            ; preds = %11330, %11322
  %11334 = add nuw nsw i64 %11323, 1
  %11335 = call zeroext i8 @randombit()
  %11336 = getelementptr inbounds i8, i8* %1, i64 %11334
  store i8 %11335, i8* %11336, align 1
  %11337 = getelementptr inbounds i8, i8* %1, i64 %11334
  %11338 = load i8, i8* %11337, align 1
  %11339 = zext i8 %11338 to i32
  %11340 = icmp eq i32 %11339, 0
  br i1 %11340, label %11341, label %11344

11341:                                            ; preds = %11333
  %11342 = mul nuw nsw i64 %11334, 16
  %11343 = getelementptr inbounds i8, i8* %0, i64 %11342
  call void @llvm.memset.p0i8.i64(i8* align 1 %11343, i8 0, i64 16, i1 false)
  br label %11344

11344:                                            ; preds = %11341, %11333
  %11345 = add nuw nsw i64 %11334, 1
  %11346 = call zeroext i8 @randombit()
  %11347 = getelementptr inbounds i8, i8* %1, i64 %11345
  store i8 %11346, i8* %11347, align 1
  %11348 = getelementptr inbounds i8, i8* %1, i64 %11345
  %11349 = load i8, i8* %11348, align 1
  %11350 = zext i8 %11349 to i32
  %11351 = icmp eq i32 %11350, 0
  br i1 %11351, label %11352, label %11355

11352:                                            ; preds = %11344
  %11353 = mul nuw nsw i64 %11345, 16
  %11354 = getelementptr inbounds i8, i8* %0, i64 %11353
  call void @llvm.memset.p0i8.i64(i8* align 1 %11354, i8 0, i64 16, i1 false)
  br label %11355

11355:                                            ; preds = %11352, %11344
  %11356 = add nuw nsw i64 %11345, 1
  %11357 = call zeroext i8 @randombit()
  %11358 = getelementptr inbounds i8, i8* %1, i64 %11356
  store i8 %11357, i8* %11358, align 1
  %11359 = getelementptr inbounds i8, i8* %1, i64 %11356
  %11360 = load i8, i8* %11359, align 1
  %11361 = zext i8 %11360 to i32
  %11362 = icmp eq i32 %11361, 0
  br i1 %11362, label %11363, label %11366

11363:                                            ; preds = %11355
  %11364 = mul nuw nsw i64 %11356, 16
  %11365 = getelementptr inbounds i8, i8* %0, i64 %11364
  call void @llvm.memset.p0i8.i64(i8* align 1 %11365, i8 0, i64 16, i1 false)
  br label %11366

11366:                                            ; preds = %11363, %11355
  %11367 = add nuw nsw i64 %11356, 1
  %11368 = call zeroext i8 @randombit()
  %11369 = getelementptr inbounds i8, i8* %1, i64 %11367
  store i8 %11368, i8* %11369, align 1
  %11370 = getelementptr inbounds i8, i8* %1, i64 %11367
  %11371 = load i8, i8* %11370, align 1
  %11372 = zext i8 %11371 to i32
  %11373 = icmp eq i32 %11372, 0
  br i1 %11373, label %11374, label %11377

11374:                                            ; preds = %11366
  %11375 = mul nuw nsw i64 %11367, 16
  %11376 = getelementptr inbounds i8, i8* %0, i64 %11375
  call void @llvm.memset.p0i8.i64(i8* align 1 %11376, i8 0, i64 16, i1 false)
  br label %11377

11377:                                            ; preds = %11374, %11366
  %11378 = add nuw nsw i64 %11367, 1
  %11379 = call zeroext i8 @randombit()
  %11380 = getelementptr inbounds i8, i8* %1, i64 %11378
  store i8 %11379, i8* %11380, align 1
  %11381 = getelementptr inbounds i8, i8* %1, i64 %11378
  %11382 = load i8, i8* %11381, align 1
  %11383 = zext i8 %11382 to i32
  %11384 = icmp eq i32 %11383, 0
  br i1 %11384, label %11385, label %11388

11385:                                            ; preds = %11377
  %11386 = mul nuw nsw i64 %11378, 16
  %11387 = getelementptr inbounds i8, i8* %0, i64 %11386
  call void @llvm.memset.p0i8.i64(i8* align 1 %11387, i8 0, i64 16, i1 false)
  br label %11388

11388:                                            ; preds = %11385, %11377
  %11389 = add nuw nsw i64 %11378, 1
  %11390 = call zeroext i8 @randombit()
  %11391 = getelementptr inbounds i8, i8* %1, i64 %11389
  store i8 %11390, i8* %11391, align 1
  %11392 = getelementptr inbounds i8, i8* %1, i64 %11389
  %11393 = load i8, i8* %11392, align 1
  %11394 = zext i8 %11393 to i32
  %11395 = icmp eq i32 %11394, 0
  br i1 %11395, label %11396, label %11399

11396:                                            ; preds = %11388
  %11397 = mul nuw nsw i64 %11389, 16
  %11398 = getelementptr inbounds i8, i8* %0, i64 %11397
  call void @llvm.memset.p0i8.i64(i8* align 1 %11398, i8 0, i64 16, i1 false)
  br label %11399

11399:                                            ; preds = %11396, %11388
  %11400 = add nuw nsw i64 %11389, 1
  %11401 = call zeroext i8 @randombit()
  %11402 = getelementptr inbounds i8, i8* %1, i64 %11400
  store i8 %11401, i8* %11402, align 1
  %11403 = getelementptr inbounds i8, i8* %1, i64 %11400
  %11404 = load i8, i8* %11403, align 1
  %11405 = zext i8 %11404 to i32
  %11406 = icmp eq i32 %11405, 0
  br i1 %11406, label %11407, label %11410

11407:                                            ; preds = %11399
  %11408 = mul nuw nsw i64 %11400, 16
  %11409 = getelementptr inbounds i8, i8* %0, i64 %11408
  call void @llvm.memset.p0i8.i64(i8* align 1 %11409, i8 0, i64 16, i1 false)
  br label %11410

11410:                                            ; preds = %11407, %11399
  %11411 = add nuw nsw i64 %11400, 1
  %11412 = call zeroext i8 @randombit()
  %11413 = getelementptr inbounds i8, i8* %1, i64 %11411
  store i8 %11412, i8* %11413, align 1
  %11414 = getelementptr inbounds i8, i8* %1, i64 %11411
  %11415 = load i8, i8* %11414, align 1
  %11416 = zext i8 %11415 to i32
  %11417 = icmp eq i32 %11416, 0
  br i1 %11417, label %11418, label %11421

11418:                                            ; preds = %11410
  %11419 = mul nuw nsw i64 %11411, 16
  %11420 = getelementptr inbounds i8, i8* %0, i64 %11419
  call void @llvm.memset.p0i8.i64(i8* align 1 %11420, i8 0, i64 16, i1 false)
  br label %11421

11421:                                            ; preds = %11418, %11410
  %11422 = add nuw nsw i64 %11411, 1
  %11423 = call zeroext i8 @randombit()
  %11424 = getelementptr inbounds i8, i8* %1, i64 %11422
  store i8 %11423, i8* %11424, align 1
  %11425 = getelementptr inbounds i8, i8* %1, i64 %11422
  %11426 = load i8, i8* %11425, align 1
  %11427 = zext i8 %11426 to i32
  %11428 = icmp eq i32 %11427, 0
  br i1 %11428, label %11429, label %11432

11429:                                            ; preds = %11421
  %11430 = mul nuw nsw i64 %11422, 16
  %11431 = getelementptr inbounds i8, i8* %0, i64 %11430
  call void @llvm.memset.p0i8.i64(i8* align 1 %11431, i8 0, i64 16, i1 false)
  br label %11432

11432:                                            ; preds = %11429, %11421
  %11433 = add nuw nsw i64 %11422, 1
  %11434 = call zeroext i8 @randombit()
  %11435 = getelementptr inbounds i8, i8* %1, i64 %11433
  store i8 %11434, i8* %11435, align 1
  %11436 = getelementptr inbounds i8, i8* %1, i64 %11433
  %11437 = load i8, i8* %11436, align 1
  %11438 = zext i8 %11437 to i32
  %11439 = icmp eq i32 %11438, 0
  br i1 %11439, label %11440, label %11443

11440:                                            ; preds = %11432
  %11441 = mul nuw nsw i64 %11433, 16
  %11442 = getelementptr inbounds i8, i8* %0, i64 %11441
  call void @llvm.memset.p0i8.i64(i8* align 1 %11442, i8 0, i64 16, i1 false)
  br label %11443

11443:                                            ; preds = %11440, %11432
  %11444 = add nuw nsw i64 %11433, 1
  %11445 = call zeroext i8 @randombit()
  %11446 = getelementptr inbounds i8, i8* %1, i64 %11444
  store i8 %11445, i8* %11446, align 1
  %11447 = getelementptr inbounds i8, i8* %1, i64 %11444
  %11448 = load i8, i8* %11447, align 1
  %11449 = zext i8 %11448 to i32
  %11450 = icmp eq i32 %11449, 0
  br i1 %11450, label %11451, label %11454

11451:                                            ; preds = %11443
  %11452 = mul nuw nsw i64 %11444, 16
  %11453 = getelementptr inbounds i8, i8* %0, i64 %11452
  call void @llvm.memset.p0i8.i64(i8* align 1 %11453, i8 0, i64 16, i1 false)
  br label %11454

11454:                                            ; preds = %11451, %11443
  %11455 = add nuw nsw i64 %11444, 1
  %11456 = call zeroext i8 @randombit()
  %11457 = getelementptr inbounds i8, i8* %1, i64 %11455
  store i8 %11456, i8* %11457, align 1
  %11458 = getelementptr inbounds i8, i8* %1, i64 %11455
  %11459 = load i8, i8* %11458, align 1
  %11460 = zext i8 %11459 to i32
  %11461 = icmp eq i32 %11460, 0
  br i1 %11461, label %11462, label %11465

11462:                                            ; preds = %11454
  %11463 = mul nuw nsw i64 %11455, 16
  %11464 = getelementptr inbounds i8, i8* %0, i64 %11463
  call void @llvm.memset.p0i8.i64(i8* align 1 %11464, i8 0, i64 16, i1 false)
  br label %11465

11465:                                            ; preds = %11462, %11454
  %11466 = add nuw nsw i64 %11455, 1
  %11467 = call zeroext i8 @randombit()
  %11468 = getelementptr inbounds i8, i8* %1, i64 %11466
  store i8 %11467, i8* %11468, align 1
  %11469 = getelementptr inbounds i8, i8* %1, i64 %11466
  %11470 = load i8, i8* %11469, align 1
  %11471 = zext i8 %11470 to i32
  %11472 = icmp eq i32 %11471, 0
  br i1 %11472, label %11473, label %11476

11473:                                            ; preds = %11465
  %11474 = mul nuw nsw i64 %11466, 16
  %11475 = getelementptr inbounds i8, i8* %0, i64 %11474
  call void @llvm.memset.p0i8.i64(i8* align 1 %11475, i8 0, i64 16, i1 false)
  br label %11476

11476:                                            ; preds = %11473, %11465
  %11477 = add nuw nsw i64 %11466, 1
  %11478 = call zeroext i8 @randombit()
  %11479 = getelementptr inbounds i8, i8* %1, i64 %11477
  store i8 %11478, i8* %11479, align 1
  %11480 = getelementptr inbounds i8, i8* %1, i64 %11477
  %11481 = load i8, i8* %11480, align 1
  %11482 = zext i8 %11481 to i32
  %11483 = icmp eq i32 %11482, 0
  br i1 %11483, label %11484, label %11487

11484:                                            ; preds = %11476
  %11485 = mul nuw nsw i64 %11477, 16
  %11486 = getelementptr inbounds i8, i8* %0, i64 %11485
  call void @llvm.memset.p0i8.i64(i8* align 1 %11486, i8 0, i64 16, i1 false)
  br label %11487

11487:                                            ; preds = %11484, %11476
  %11488 = add nuw nsw i64 %11477, 1
  %11489 = call zeroext i8 @randombit()
  %11490 = getelementptr inbounds i8, i8* %1, i64 %11488
  store i8 %11489, i8* %11490, align 1
  %11491 = getelementptr inbounds i8, i8* %1, i64 %11488
  %11492 = load i8, i8* %11491, align 1
  %11493 = zext i8 %11492 to i32
  %11494 = icmp eq i32 %11493, 0
  br i1 %11494, label %11495, label %11498

11495:                                            ; preds = %11487
  %11496 = mul nuw nsw i64 %11488, 16
  %11497 = getelementptr inbounds i8, i8* %0, i64 %11496
  call void @llvm.memset.p0i8.i64(i8* align 1 %11497, i8 0, i64 16, i1 false)
  br label %11498

11498:                                            ; preds = %11495, %11487
  %11499 = add nuw nsw i64 %11488, 1
  %11500 = call zeroext i8 @randombit()
  %11501 = getelementptr inbounds i8, i8* %1, i64 %11499
  store i8 %11500, i8* %11501, align 1
  %11502 = getelementptr inbounds i8, i8* %1, i64 %11499
  %11503 = load i8, i8* %11502, align 1
  %11504 = zext i8 %11503 to i32
  %11505 = icmp eq i32 %11504, 0
  br i1 %11505, label %11506, label %11509

11506:                                            ; preds = %11498
  %11507 = mul nuw nsw i64 %11499, 16
  %11508 = getelementptr inbounds i8, i8* %0, i64 %11507
  call void @llvm.memset.p0i8.i64(i8* align 1 %11508, i8 0, i64 16, i1 false)
  br label %11509

11509:                                            ; preds = %11506, %11498
  %11510 = add nuw nsw i64 %11499, 1
  %11511 = call zeroext i8 @randombit()
  %11512 = getelementptr inbounds i8, i8* %1, i64 %11510
  store i8 %11511, i8* %11512, align 1
  %11513 = getelementptr inbounds i8, i8* %1, i64 %11510
  %11514 = load i8, i8* %11513, align 1
  %11515 = zext i8 %11514 to i32
  %11516 = icmp eq i32 %11515, 0
  br i1 %11516, label %11517, label %11520

11517:                                            ; preds = %11509
  %11518 = mul nuw nsw i64 %11510, 16
  %11519 = getelementptr inbounds i8, i8* %0, i64 %11518
  call void @llvm.memset.p0i8.i64(i8* align 1 %11519, i8 0, i64 16, i1 false)
  br label %11520

11520:                                            ; preds = %11517, %11509
  %11521 = add nuw nsw i64 %11510, 1
  %11522 = call zeroext i8 @randombit()
  %11523 = getelementptr inbounds i8, i8* %1, i64 %11521
  store i8 %11522, i8* %11523, align 1
  %11524 = getelementptr inbounds i8, i8* %1, i64 %11521
  %11525 = load i8, i8* %11524, align 1
  %11526 = zext i8 %11525 to i32
  %11527 = icmp eq i32 %11526, 0
  br i1 %11527, label %11528, label %11531

11528:                                            ; preds = %11520
  %11529 = mul nuw nsw i64 %11521, 16
  %11530 = getelementptr inbounds i8, i8* %0, i64 %11529
  call void @llvm.memset.p0i8.i64(i8* align 1 %11530, i8 0, i64 16, i1 false)
  br label %11531

11531:                                            ; preds = %11528, %11520
  %11532 = add nuw nsw i64 %11521, 1
  %11533 = call zeroext i8 @randombit()
  %11534 = getelementptr inbounds i8, i8* %1, i64 %11532
  store i8 %11533, i8* %11534, align 1
  %11535 = getelementptr inbounds i8, i8* %1, i64 %11532
  %11536 = load i8, i8* %11535, align 1
  %11537 = zext i8 %11536 to i32
  %11538 = icmp eq i32 %11537, 0
  br i1 %11538, label %11539, label %11542

11539:                                            ; preds = %11531
  %11540 = mul nuw nsw i64 %11532, 16
  %11541 = getelementptr inbounds i8, i8* %0, i64 %11540
  call void @llvm.memset.p0i8.i64(i8* align 1 %11541, i8 0, i64 16, i1 false)
  br label %11542

11542:                                            ; preds = %11539, %11531
  %11543 = add nuw nsw i64 %11532, 1
  %11544 = call zeroext i8 @randombit()
  %11545 = getelementptr inbounds i8, i8* %1, i64 %11543
  store i8 %11544, i8* %11545, align 1
  %11546 = getelementptr inbounds i8, i8* %1, i64 %11543
  %11547 = load i8, i8* %11546, align 1
  %11548 = zext i8 %11547 to i32
  %11549 = icmp eq i32 %11548, 0
  br i1 %11549, label %11550, label %11553

11550:                                            ; preds = %11542
  %11551 = mul nuw nsw i64 %11543, 16
  %11552 = getelementptr inbounds i8, i8* %0, i64 %11551
  call void @llvm.memset.p0i8.i64(i8* align 1 %11552, i8 0, i64 16, i1 false)
  br label %11553

11553:                                            ; preds = %11550, %11542
  %11554 = add nuw nsw i64 %11543, 1
  %11555 = call zeroext i8 @randombit()
  %11556 = getelementptr inbounds i8, i8* %1, i64 %11554
  store i8 %11555, i8* %11556, align 1
  %11557 = getelementptr inbounds i8, i8* %1, i64 %11554
  %11558 = load i8, i8* %11557, align 1
  %11559 = zext i8 %11558 to i32
  %11560 = icmp eq i32 %11559, 0
  br i1 %11560, label %11561, label %11564

11561:                                            ; preds = %11553
  %11562 = mul nuw nsw i64 %11554, 16
  %11563 = getelementptr inbounds i8, i8* %0, i64 %11562
  call void @llvm.memset.p0i8.i64(i8* align 1 %11563, i8 0, i64 16, i1 false)
  br label %11564

11564:                                            ; preds = %11561, %11553
  %11565 = add nuw nsw i64 %11554, 1
  %11566 = call zeroext i8 @randombit()
  %11567 = getelementptr inbounds i8, i8* %1, i64 %11565
  store i8 %11566, i8* %11567, align 1
  %11568 = getelementptr inbounds i8, i8* %1, i64 %11565
  %11569 = load i8, i8* %11568, align 1
  %11570 = zext i8 %11569 to i32
  %11571 = icmp eq i32 %11570, 0
  br i1 %11571, label %11572, label %11575

11572:                                            ; preds = %11564
  %11573 = mul nuw nsw i64 %11565, 16
  %11574 = getelementptr inbounds i8, i8* %0, i64 %11573
  call void @llvm.memset.p0i8.i64(i8* align 1 %11574, i8 0, i64 16, i1 false)
  br label %11575

11575:                                            ; preds = %11572, %11564
  %11576 = add nuw nsw i64 %11565, 1
  %11577 = call zeroext i8 @randombit()
  %11578 = getelementptr inbounds i8, i8* %1, i64 %11576
  store i8 %11577, i8* %11578, align 1
  %11579 = getelementptr inbounds i8, i8* %1, i64 %11576
  %11580 = load i8, i8* %11579, align 1
  %11581 = zext i8 %11580 to i32
  %11582 = icmp eq i32 %11581, 0
  br i1 %11582, label %11583, label %11586

11583:                                            ; preds = %11575
  %11584 = mul nuw nsw i64 %11576, 16
  %11585 = getelementptr inbounds i8, i8* %0, i64 %11584
  call void @llvm.memset.p0i8.i64(i8* align 1 %11585, i8 0, i64 16, i1 false)
  br label %11586

11586:                                            ; preds = %11583, %11575
  %11587 = add nuw nsw i64 %11576, 1
  %11588 = call zeroext i8 @randombit()
  %11589 = getelementptr inbounds i8, i8* %1, i64 %11587
  store i8 %11588, i8* %11589, align 1
  %11590 = getelementptr inbounds i8, i8* %1, i64 %11587
  %11591 = load i8, i8* %11590, align 1
  %11592 = zext i8 %11591 to i32
  %11593 = icmp eq i32 %11592, 0
  br i1 %11593, label %11594, label %11597

11594:                                            ; preds = %11586
  %11595 = mul nuw nsw i64 %11587, 16
  %11596 = getelementptr inbounds i8, i8* %0, i64 %11595
  call void @llvm.memset.p0i8.i64(i8* align 1 %11596, i8 0, i64 16, i1 false)
  br label %11597

11597:                                            ; preds = %11594, %11586
  %11598 = add nuw nsw i64 %11587, 1
  %11599 = call zeroext i8 @randombit()
  %11600 = getelementptr inbounds i8, i8* %1, i64 %11598
  store i8 %11599, i8* %11600, align 1
  %11601 = getelementptr inbounds i8, i8* %1, i64 %11598
  %11602 = load i8, i8* %11601, align 1
  %11603 = zext i8 %11602 to i32
  %11604 = icmp eq i32 %11603, 0
  br i1 %11604, label %11605, label %11608

11605:                                            ; preds = %11597
  %11606 = mul nuw nsw i64 %11598, 16
  %11607 = getelementptr inbounds i8, i8* %0, i64 %11606
  call void @llvm.memset.p0i8.i64(i8* align 1 %11607, i8 0, i64 16, i1 false)
  br label %11608

11608:                                            ; preds = %11605, %11597
  %11609 = add nuw nsw i64 %11598, 1
  %11610 = call zeroext i8 @randombit()
  %11611 = getelementptr inbounds i8, i8* %1, i64 %11609
  store i8 %11610, i8* %11611, align 1
  %11612 = getelementptr inbounds i8, i8* %1, i64 %11609
  %11613 = load i8, i8* %11612, align 1
  %11614 = zext i8 %11613 to i32
  %11615 = icmp eq i32 %11614, 0
  br i1 %11615, label %11616, label %11619

11616:                                            ; preds = %11608
  %11617 = mul nuw nsw i64 %11609, 16
  %11618 = getelementptr inbounds i8, i8* %0, i64 %11617
  call void @llvm.memset.p0i8.i64(i8* align 1 %11618, i8 0, i64 16, i1 false)
  br label %11619

11619:                                            ; preds = %11616, %11608
  %11620 = add nuw nsw i64 %11609, 1
  %11621 = call zeroext i8 @randombit()
  %11622 = getelementptr inbounds i8, i8* %1, i64 %11620
  store i8 %11621, i8* %11622, align 1
  %11623 = getelementptr inbounds i8, i8* %1, i64 %11620
  %11624 = load i8, i8* %11623, align 1
  %11625 = zext i8 %11624 to i32
  %11626 = icmp eq i32 %11625, 0
  br i1 %11626, label %11627, label %11630

11627:                                            ; preds = %11619
  %11628 = mul nuw nsw i64 %11620, 16
  %11629 = getelementptr inbounds i8, i8* %0, i64 %11628
  call void @llvm.memset.p0i8.i64(i8* align 1 %11629, i8 0, i64 16, i1 false)
  br label %11630

11630:                                            ; preds = %11627, %11619
  %11631 = add nuw nsw i64 %11620, 1
  %11632 = call zeroext i8 @randombit()
  %11633 = getelementptr inbounds i8, i8* %1, i64 %11631
  store i8 %11632, i8* %11633, align 1
  %11634 = getelementptr inbounds i8, i8* %1, i64 %11631
  %11635 = load i8, i8* %11634, align 1
  %11636 = zext i8 %11635 to i32
  %11637 = icmp eq i32 %11636, 0
  br i1 %11637, label %11638, label %11641

11638:                                            ; preds = %11630
  %11639 = mul nuw nsw i64 %11631, 16
  %11640 = getelementptr inbounds i8, i8* %0, i64 %11639
  call void @llvm.memset.p0i8.i64(i8* align 1 %11640, i8 0, i64 16, i1 false)
  br label %11641

11641:                                            ; preds = %11638, %11630
  %11642 = add nuw nsw i64 %11631, 1
  %11643 = call zeroext i8 @randombit()
  %11644 = getelementptr inbounds i8, i8* %1, i64 %11642
  store i8 %11643, i8* %11644, align 1
  %11645 = getelementptr inbounds i8, i8* %1, i64 %11642
  %11646 = load i8, i8* %11645, align 1
  %11647 = zext i8 %11646 to i32
  %11648 = icmp eq i32 %11647, 0
  br i1 %11648, label %11649, label %11652

11649:                                            ; preds = %11641
  %11650 = mul nuw nsw i64 %11642, 16
  %11651 = getelementptr inbounds i8, i8* %0, i64 %11650
  call void @llvm.memset.p0i8.i64(i8* align 1 %11651, i8 0, i64 16, i1 false)
  br label %11652

11652:                                            ; preds = %11649, %11641
  %11653 = add nuw nsw i64 %11642, 1
  %11654 = call zeroext i8 @randombit()
  %11655 = getelementptr inbounds i8, i8* %1, i64 %11653
  store i8 %11654, i8* %11655, align 1
  %11656 = getelementptr inbounds i8, i8* %1, i64 %11653
  %11657 = load i8, i8* %11656, align 1
  %11658 = zext i8 %11657 to i32
  %11659 = icmp eq i32 %11658, 0
  br i1 %11659, label %11660, label %11663

11660:                                            ; preds = %11652
  %11661 = mul nuw nsw i64 %11653, 16
  %11662 = getelementptr inbounds i8, i8* %0, i64 %11661
  call void @llvm.memset.p0i8.i64(i8* align 1 %11662, i8 0, i64 16, i1 false)
  br label %11663

11663:                                            ; preds = %11660, %11652
  %11664 = add nuw nsw i64 %11653, 1
  %11665 = call zeroext i8 @randombit()
  %11666 = getelementptr inbounds i8, i8* %1, i64 %11664
  store i8 %11665, i8* %11666, align 1
  %11667 = getelementptr inbounds i8, i8* %1, i64 %11664
  %11668 = load i8, i8* %11667, align 1
  %11669 = zext i8 %11668 to i32
  %11670 = icmp eq i32 %11669, 0
  br i1 %11670, label %11671, label %11674

11671:                                            ; preds = %11663
  %11672 = mul nuw nsw i64 %11664, 16
  %11673 = getelementptr inbounds i8, i8* %0, i64 %11672
  call void @llvm.memset.p0i8.i64(i8* align 1 %11673, i8 0, i64 16, i1 false)
  br label %11674

11674:                                            ; preds = %11671, %11663
  %11675 = add nuw nsw i64 %11664, 1
  %11676 = call zeroext i8 @randombit()
  %11677 = getelementptr inbounds i8, i8* %1, i64 %11675
  store i8 %11676, i8* %11677, align 1
  %11678 = getelementptr inbounds i8, i8* %1, i64 %11675
  %11679 = load i8, i8* %11678, align 1
  %11680 = zext i8 %11679 to i32
  %11681 = icmp eq i32 %11680, 0
  br i1 %11681, label %11682, label %11685

11682:                                            ; preds = %11674
  %11683 = mul nuw nsw i64 %11675, 16
  %11684 = getelementptr inbounds i8, i8* %0, i64 %11683
  call void @llvm.memset.p0i8.i64(i8* align 1 %11684, i8 0, i64 16, i1 false)
  br label %11685

11685:                                            ; preds = %11682, %11674
  %11686 = add nuw nsw i64 %11675, 1
  %11687 = call zeroext i8 @randombit()
  %11688 = getelementptr inbounds i8, i8* %1, i64 %11686
  store i8 %11687, i8* %11688, align 1
  %11689 = getelementptr inbounds i8, i8* %1, i64 %11686
  %11690 = load i8, i8* %11689, align 1
  %11691 = zext i8 %11690 to i32
  %11692 = icmp eq i32 %11691, 0
  br i1 %11692, label %11693, label %11696

11693:                                            ; preds = %11685
  %11694 = mul nuw nsw i64 %11686, 16
  %11695 = getelementptr inbounds i8, i8* %0, i64 %11694
  call void @llvm.memset.p0i8.i64(i8* align 1 %11695, i8 0, i64 16, i1 false)
  br label %11696

11696:                                            ; preds = %11693, %11685
  %11697 = add nuw nsw i64 %11686, 1
  %11698 = call zeroext i8 @randombit()
  %11699 = getelementptr inbounds i8, i8* %1, i64 %11697
  store i8 %11698, i8* %11699, align 1
  %11700 = getelementptr inbounds i8, i8* %1, i64 %11697
  %11701 = load i8, i8* %11700, align 1
  %11702 = zext i8 %11701 to i32
  %11703 = icmp eq i32 %11702, 0
  br i1 %11703, label %11704, label %11707

11704:                                            ; preds = %11696
  %11705 = mul nuw nsw i64 %11697, 16
  %11706 = getelementptr inbounds i8, i8* %0, i64 %11705
  call void @llvm.memset.p0i8.i64(i8* align 1 %11706, i8 0, i64 16, i1 false)
  br label %11707

11707:                                            ; preds = %11704, %11696
  %11708 = add nuw nsw i64 %11697, 1
  %11709 = call zeroext i8 @randombit()
  %11710 = getelementptr inbounds i8, i8* %1, i64 %11708
  store i8 %11709, i8* %11710, align 1
  %11711 = getelementptr inbounds i8, i8* %1, i64 %11708
  %11712 = load i8, i8* %11711, align 1
  %11713 = zext i8 %11712 to i32
  %11714 = icmp eq i32 %11713, 0
  br i1 %11714, label %11715, label %11718

11715:                                            ; preds = %11707
  %11716 = mul nuw nsw i64 %11708, 16
  %11717 = getelementptr inbounds i8, i8* %0, i64 %11716
  call void @llvm.memset.p0i8.i64(i8* align 1 %11717, i8 0, i64 16, i1 false)
  br label %11718

11718:                                            ; preds = %11715, %11707
  %11719 = add nuw nsw i64 %11708, 1
  %11720 = call zeroext i8 @randombit()
  %11721 = getelementptr inbounds i8, i8* %1, i64 %11719
  store i8 %11720, i8* %11721, align 1
  %11722 = getelementptr inbounds i8, i8* %1, i64 %11719
  %11723 = load i8, i8* %11722, align 1
  %11724 = zext i8 %11723 to i32
  %11725 = icmp eq i32 %11724, 0
  br i1 %11725, label %11726, label %11729

11726:                                            ; preds = %11718
  %11727 = mul nuw nsw i64 %11719, 16
  %11728 = getelementptr inbounds i8, i8* %0, i64 %11727
  call void @llvm.memset.p0i8.i64(i8* align 1 %11728, i8 0, i64 16, i1 false)
  br label %11729

11729:                                            ; preds = %11726, %11718
  %11730 = add nuw nsw i64 %11719, 1
  %11731 = call zeroext i8 @randombit()
  %11732 = getelementptr inbounds i8, i8* %1, i64 %11730
  store i8 %11731, i8* %11732, align 1
  %11733 = getelementptr inbounds i8, i8* %1, i64 %11730
  %11734 = load i8, i8* %11733, align 1
  %11735 = zext i8 %11734 to i32
  %11736 = icmp eq i32 %11735, 0
  br i1 %11736, label %11737, label %11740

11737:                                            ; preds = %11729
  %11738 = mul nuw nsw i64 %11730, 16
  %11739 = getelementptr inbounds i8, i8* %0, i64 %11738
  call void @llvm.memset.p0i8.i64(i8* align 1 %11739, i8 0, i64 16, i1 false)
  br label %11740

11740:                                            ; preds = %11737, %11729
  %11741 = add nuw nsw i64 %11730, 1
  %11742 = call zeroext i8 @randombit()
  %11743 = getelementptr inbounds i8, i8* %1, i64 %11741
  store i8 %11742, i8* %11743, align 1
  %11744 = getelementptr inbounds i8, i8* %1, i64 %11741
  %11745 = load i8, i8* %11744, align 1
  %11746 = zext i8 %11745 to i32
  %11747 = icmp eq i32 %11746, 0
  br i1 %11747, label %11748, label %11751

11748:                                            ; preds = %11740
  %11749 = mul nuw nsw i64 %11741, 16
  %11750 = getelementptr inbounds i8, i8* %0, i64 %11749
  call void @llvm.memset.p0i8.i64(i8* align 1 %11750, i8 0, i64 16, i1 false)
  br label %11751

11751:                                            ; preds = %11748, %11740
  %11752 = add nuw nsw i64 %11741, 1
  %11753 = call zeroext i8 @randombit()
  %11754 = getelementptr inbounds i8, i8* %1, i64 %11752
  store i8 %11753, i8* %11754, align 1
  %11755 = getelementptr inbounds i8, i8* %1, i64 %11752
  %11756 = load i8, i8* %11755, align 1
  %11757 = zext i8 %11756 to i32
  %11758 = icmp eq i32 %11757, 0
  br i1 %11758, label %11759, label %11762

11759:                                            ; preds = %11751
  %11760 = mul nuw nsw i64 %11752, 16
  %11761 = getelementptr inbounds i8, i8* %0, i64 %11760
  call void @llvm.memset.p0i8.i64(i8* align 1 %11761, i8 0, i64 16, i1 false)
  br label %11762

11762:                                            ; preds = %11759, %11751
  %11763 = add nuw nsw i64 %11752, 1
  %11764 = call zeroext i8 @randombit()
  %11765 = getelementptr inbounds i8, i8* %1, i64 %11763
  store i8 %11764, i8* %11765, align 1
  %11766 = getelementptr inbounds i8, i8* %1, i64 %11763
  %11767 = load i8, i8* %11766, align 1
  %11768 = zext i8 %11767 to i32
  %11769 = icmp eq i32 %11768, 0
  br i1 %11769, label %11770, label %11773

11770:                                            ; preds = %11762
  %11771 = mul nuw nsw i64 %11763, 16
  %11772 = getelementptr inbounds i8, i8* %0, i64 %11771
  call void @llvm.memset.p0i8.i64(i8* align 1 %11772, i8 0, i64 16, i1 false)
  br label %11773

11773:                                            ; preds = %11770, %11762
  %11774 = add nuw nsw i64 %11763, 1
  %11775 = call zeroext i8 @randombit()
  %11776 = getelementptr inbounds i8, i8* %1, i64 %11774
  store i8 %11775, i8* %11776, align 1
  %11777 = getelementptr inbounds i8, i8* %1, i64 %11774
  %11778 = load i8, i8* %11777, align 1
  %11779 = zext i8 %11778 to i32
  %11780 = icmp eq i32 %11779, 0
  br i1 %11780, label %11781, label %11784

11781:                                            ; preds = %11773
  %11782 = mul nuw nsw i64 %11774, 16
  %11783 = getelementptr inbounds i8, i8* %0, i64 %11782
  call void @llvm.memset.p0i8.i64(i8* align 1 %11783, i8 0, i64 16, i1 false)
  br label %11784

11784:                                            ; preds = %11781, %11773
  %11785 = add nuw nsw i64 %11774, 1
  %11786 = call zeroext i8 @randombit()
  %11787 = getelementptr inbounds i8, i8* %1, i64 %11785
  store i8 %11786, i8* %11787, align 1
  %11788 = getelementptr inbounds i8, i8* %1, i64 %11785
  %11789 = load i8, i8* %11788, align 1
  %11790 = zext i8 %11789 to i32
  %11791 = icmp eq i32 %11790, 0
  br i1 %11791, label %11792, label %11795

11792:                                            ; preds = %11784
  %11793 = mul nuw nsw i64 %11785, 16
  %11794 = getelementptr inbounds i8, i8* %0, i64 %11793
  call void @llvm.memset.p0i8.i64(i8* align 1 %11794, i8 0, i64 16, i1 false)
  br label %11795

11795:                                            ; preds = %11792, %11784
  %11796 = add nuw nsw i64 %11785, 1
  %11797 = call zeroext i8 @randombit()
  %11798 = getelementptr inbounds i8, i8* %1, i64 %11796
  store i8 %11797, i8* %11798, align 1
  %11799 = getelementptr inbounds i8, i8* %1, i64 %11796
  %11800 = load i8, i8* %11799, align 1
  %11801 = zext i8 %11800 to i32
  %11802 = icmp eq i32 %11801, 0
  br i1 %11802, label %11803, label %11806

11803:                                            ; preds = %11795
  %11804 = mul nuw nsw i64 %11796, 16
  %11805 = getelementptr inbounds i8, i8* %0, i64 %11804
  call void @llvm.memset.p0i8.i64(i8* align 1 %11805, i8 0, i64 16, i1 false)
  br label %11806

11806:                                            ; preds = %11803, %11795
  %11807 = add nuw nsw i64 %11796, 1
  %11808 = call zeroext i8 @randombit()
  %11809 = getelementptr inbounds i8, i8* %1, i64 %11807
  store i8 %11808, i8* %11809, align 1
  %11810 = getelementptr inbounds i8, i8* %1, i64 %11807
  %11811 = load i8, i8* %11810, align 1
  %11812 = zext i8 %11811 to i32
  %11813 = icmp eq i32 %11812, 0
  br i1 %11813, label %11814, label %11817

11814:                                            ; preds = %11806
  %11815 = mul nuw nsw i64 %11807, 16
  %11816 = getelementptr inbounds i8, i8* %0, i64 %11815
  call void @llvm.memset.p0i8.i64(i8* align 1 %11816, i8 0, i64 16, i1 false)
  br label %11817

11817:                                            ; preds = %11814, %11806
  %11818 = add nuw nsw i64 %11807, 1
  %11819 = call zeroext i8 @randombit()
  %11820 = getelementptr inbounds i8, i8* %1, i64 %11818
  store i8 %11819, i8* %11820, align 1
  %11821 = getelementptr inbounds i8, i8* %1, i64 %11818
  %11822 = load i8, i8* %11821, align 1
  %11823 = zext i8 %11822 to i32
  %11824 = icmp eq i32 %11823, 0
  br i1 %11824, label %11825, label %11828

11825:                                            ; preds = %11817
  %11826 = mul nuw nsw i64 %11818, 16
  %11827 = getelementptr inbounds i8, i8* %0, i64 %11826
  call void @llvm.memset.p0i8.i64(i8* align 1 %11827, i8 0, i64 16, i1 false)
  br label %11828

11828:                                            ; preds = %11825, %11817
  %11829 = add nuw nsw i64 %11818, 1
  %11830 = call zeroext i8 @randombit()
  %11831 = getelementptr inbounds i8, i8* %1, i64 %11829
  store i8 %11830, i8* %11831, align 1
  %11832 = getelementptr inbounds i8, i8* %1, i64 %11829
  %11833 = load i8, i8* %11832, align 1
  %11834 = zext i8 %11833 to i32
  %11835 = icmp eq i32 %11834, 0
  br i1 %11835, label %11836, label %11839

11836:                                            ; preds = %11828
  %11837 = mul nuw nsw i64 %11829, 16
  %11838 = getelementptr inbounds i8, i8* %0, i64 %11837
  call void @llvm.memset.p0i8.i64(i8* align 1 %11838, i8 0, i64 16, i1 false)
  br label %11839

11839:                                            ; preds = %11836, %11828
  %11840 = add nuw nsw i64 %11829, 1
  %11841 = call zeroext i8 @randombit()
  %11842 = getelementptr inbounds i8, i8* %1, i64 %11840
  store i8 %11841, i8* %11842, align 1
  %11843 = getelementptr inbounds i8, i8* %1, i64 %11840
  %11844 = load i8, i8* %11843, align 1
  %11845 = zext i8 %11844 to i32
  %11846 = icmp eq i32 %11845, 0
  br i1 %11846, label %11847, label %11850

11847:                                            ; preds = %11839
  %11848 = mul nuw nsw i64 %11840, 16
  %11849 = getelementptr inbounds i8, i8* %0, i64 %11848
  call void @llvm.memset.p0i8.i64(i8* align 1 %11849, i8 0, i64 16, i1 false)
  br label %11850

11850:                                            ; preds = %11847, %11839
  %11851 = add nuw nsw i64 %11840, 1
  %11852 = call zeroext i8 @randombit()
  %11853 = getelementptr inbounds i8, i8* %1, i64 %11851
  store i8 %11852, i8* %11853, align 1
  %11854 = getelementptr inbounds i8, i8* %1, i64 %11851
  %11855 = load i8, i8* %11854, align 1
  %11856 = zext i8 %11855 to i32
  %11857 = icmp eq i32 %11856, 0
  br i1 %11857, label %11858, label %11861

11858:                                            ; preds = %11850
  %11859 = mul nuw nsw i64 %11851, 16
  %11860 = getelementptr inbounds i8, i8* %0, i64 %11859
  call void @llvm.memset.p0i8.i64(i8* align 1 %11860, i8 0, i64 16, i1 false)
  br label %11861

11861:                                            ; preds = %11858, %11850
  %11862 = add nuw nsw i64 %11851, 1
  %11863 = call zeroext i8 @randombit()
  %11864 = getelementptr inbounds i8, i8* %1, i64 %11862
  store i8 %11863, i8* %11864, align 1
  %11865 = getelementptr inbounds i8, i8* %1, i64 %11862
  %11866 = load i8, i8* %11865, align 1
  %11867 = zext i8 %11866 to i32
  %11868 = icmp eq i32 %11867, 0
  br i1 %11868, label %11869, label %11872

11869:                                            ; preds = %11861
  %11870 = mul nuw nsw i64 %11862, 16
  %11871 = getelementptr inbounds i8, i8* %0, i64 %11870
  call void @llvm.memset.p0i8.i64(i8* align 1 %11871, i8 0, i64 16, i1 false)
  br label %11872

11872:                                            ; preds = %11869, %11861
  %11873 = add nuw nsw i64 %11862, 1
  %11874 = call zeroext i8 @randombit()
  %11875 = getelementptr inbounds i8, i8* %1, i64 %11873
  store i8 %11874, i8* %11875, align 1
  %11876 = getelementptr inbounds i8, i8* %1, i64 %11873
  %11877 = load i8, i8* %11876, align 1
  %11878 = zext i8 %11877 to i32
  %11879 = icmp eq i32 %11878, 0
  br i1 %11879, label %11880, label %11883

11880:                                            ; preds = %11872
  %11881 = mul nuw nsw i64 %11873, 16
  %11882 = getelementptr inbounds i8, i8* %0, i64 %11881
  call void @llvm.memset.p0i8.i64(i8* align 1 %11882, i8 0, i64 16, i1 false)
  br label %11883

11883:                                            ; preds = %11880, %11872
  %11884 = add nuw nsw i64 %11873, 1
  %11885 = call zeroext i8 @randombit()
  %11886 = getelementptr inbounds i8, i8* %1, i64 %11884
  store i8 %11885, i8* %11886, align 1
  %11887 = getelementptr inbounds i8, i8* %1, i64 %11884
  %11888 = load i8, i8* %11887, align 1
  %11889 = zext i8 %11888 to i32
  %11890 = icmp eq i32 %11889, 0
  br i1 %11890, label %11891, label %11894

11891:                                            ; preds = %11883
  %11892 = mul nuw nsw i64 %11884, 16
  %11893 = getelementptr inbounds i8, i8* %0, i64 %11892
  call void @llvm.memset.p0i8.i64(i8* align 1 %11893, i8 0, i64 16, i1 false)
  br label %11894

11894:                                            ; preds = %11891, %11883
  %11895 = add nuw nsw i64 %11884, 1
  %11896 = call zeroext i8 @randombit()
  %11897 = getelementptr inbounds i8, i8* %1, i64 %11895
  store i8 %11896, i8* %11897, align 1
  %11898 = getelementptr inbounds i8, i8* %1, i64 %11895
  %11899 = load i8, i8* %11898, align 1
  %11900 = zext i8 %11899 to i32
  %11901 = icmp eq i32 %11900, 0
  br i1 %11901, label %11902, label %11905

11902:                                            ; preds = %11894
  %11903 = mul nuw nsw i64 %11895, 16
  %11904 = getelementptr inbounds i8, i8* %0, i64 %11903
  call void @llvm.memset.p0i8.i64(i8* align 1 %11904, i8 0, i64 16, i1 false)
  br label %11905

11905:                                            ; preds = %11902, %11894
  %11906 = add nuw nsw i64 %11895, 1
  %11907 = call zeroext i8 @randombit()
  %11908 = getelementptr inbounds i8, i8* %1, i64 %11906
  store i8 %11907, i8* %11908, align 1
  %11909 = getelementptr inbounds i8, i8* %1, i64 %11906
  %11910 = load i8, i8* %11909, align 1
  %11911 = zext i8 %11910 to i32
  %11912 = icmp eq i32 %11911, 0
  br i1 %11912, label %11913, label %11916

11913:                                            ; preds = %11905
  %11914 = mul nuw nsw i64 %11906, 16
  %11915 = getelementptr inbounds i8, i8* %0, i64 %11914
  call void @llvm.memset.p0i8.i64(i8* align 1 %11915, i8 0, i64 16, i1 false)
  br label %11916

11916:                                            ; preds = %11913, %11905
  %11917 = add nuw nsw i64 %11906, 1
  %11918 = call zeroext i8 @randombit()
  %11919 = getelementptr inbounds i8, i8* %1, i64 %11917
  store i8 %11918, i8* %11919, align 1
  %11920 = getelementptr inbounds i8, i8* %1, i64 %11917
  %11921 = load i8, i8* %11920, align 1
  %11922 = zext i8 %11921 to i32
  %11923 = icmp eq i32 %11922, 0
  br i1 %11923, label %11924, label %11927

11924:                                            ; preds = %11916
  %11925 = mul nuw nsw i64 %11917, 16
  %11926 = getelementptr inbounds i8, i8* %0, i64 %11925
  call void @llvm.memset.p0i8.i64(i8* align 1 %11926, i8 0, i64 16, i1 false)
  br label %11927

11927:                                            ; preds = %11924, %11916
  %11928 = add nuw nsw i64 %11917, 1
  %11929 = call zeroext i8 @randombit()
  %11930 = getelementptr inbounds i8, i8* %1, i64 %11928
  store i8 %11929, i8* %11930, align 1
  %11931 = getelementptr inbounds i8, i8* %1, i64 %11928
  %11932 = load i8, i8* %11931, align 1
  %11933 = zext i8 %11932 to i32
  %11934 = icmp eq i32 %11933, 0
  br i1 %11934, label %11935, label %11938

11935:                                            ; preds = %11927
  %11936 = mul nuw nsw i64 %11928, 16
  %11937 = getelementptr inbounds i8, i8* %0, i64 %11936
  call void @llvm.memset.p0i8.i64(i8* align 1 %11937, i8 0, i64 16, i1 false)
  br label %11938

11938:                                            ; preds = %11935, %11927
  %11939 = add nuw nsw i64 %11928, 1
  %11940 = call zeroext i8 @randombit()
  %11941 = getelementptr inbounds i8, i8* %1, i64 %11939
  store i8 %11940, i8* %11941, align 1
  %11942 = getelementptr inbounds i8, i8* %1, i64 %11939
  %11943 = load i8, i8* %11942, align 1
  %11944 = zext i8 %11943 to i32
  %11945 = icmp eq i32 %11944, 0
  br i1 %11945, label %11946, label %11949

11946:                                            ; preds = %11938
  %11947 = mul nuw nsw i64 %11939, 16
  %11948 = getelementptr inbounds i8, i8* %0, i64 %11947
  call void @llvm.memset.p0i8.i64(i8* align 1 %11948, i8 0, i64 16, i1 false)
  br label %11949

11949:                                            ; preds = %11946, %11938
  %11950 = add nuw nsw i64 %11939, 1
  %11951 = call zeroext i8 @randombit()
  %11952 = getelementptr inbounds i8, i8* %1, i64 %11950
  store i8 %11951, i8* %11952, align 1
  %11953 = getelementptr inbounds i8, i8* %1, i64 %11950
  %11954 = load i8, i8* %11953, align 1
  %11955 = zext i8 %11954 to i32
  %11956 = icmp eq i32 %11955, 0
  br i1 %11956, label %11957, label %11960

11957:                                            ; preds = %11949
  %11958 = mul nuw nsw i64 %11950, 16
  %11959 = getelementptr inbounds i8, i8* %0, i64 %11958
  call void @llvm.memset.p0i8.i64(i8* align 1 %11959, i8 0, i64 16, i1 false)
  br label %11960

11960:                                            ; preds = %11957, %11949
  %11961 = add nuw nsw i64 %11950, 1
  %11962 = call zeroext i8 @randombit()
  %11963 = getelementptr inbounds i8, i8* %1, i64 %11961
  store i8 %11962, i8* %11963, align 1
  %11964 = getelementptr inbounds i8, i8* %1, i64 %11961
  %11965 = load i8, i8* %11964, align 1
  %11966 = zext i8 %11965 to i32
  %11967 = icmp eq i32 %11966, 0
  br i1 %11967, label %11968, label %11971

11968:                                            ; preds = %11960
  %11969 = mul nuw nsw i64 %11961, 16
  %11970 = getelementptr inbounds i8, i8* %0, i64 %11969
  call void @llvm.memset.p0i8.i64(i8* align 1 %11970, i8 0, i64 16, i1 false)
  br label %11971

11971:                                            ; preds = %11968, %11960
  %11972 = add nuw nsw i64 %11961, 1
  %11973 = call zeroext i8 @randombit()
  %11974 = getelementptr inbounds i8, i8* %1, i64 %11972
  store i8 %11973, i8* %11974, align 1
  %11975 = getelementptr inbounds i8, i8* %1, i64 %11972
  %11976 = load i8, i8* %11975, align 1
  %11977 = zext i8 %11976 to i32
  %11978 = icmp eq i32 %11977, 0
  br i1 %11978, label %11979, label %11982

11979:                                            ; preds = %11971
  %11980 = mul nuw nsw i64 %11972, 16
  %11981 = getelementptr inbounds i8, i8* %0, i64 %11980
  call void @llvm.memset.p0i8.i64(i8* align 1 %11981, i8 0, i64 16, i1 false)
  br label %11982

11982:                                            ; preds = %11979, %11971
  %11983 = add nuw nsw i64 %11972, 1
  %11984 = call zeroext i8 @randombit()
  %11985 = getelementptr inbounds i8, i8* %1, i64 %11983
  store i8 %11984, i8* %11985, align 1
  %11986 = getelementptr inbounds i8, i8* %1, i64 %11983
  %11987 = load i8, i8* %11986, align 1
  %11988 = zext i8 %11987 to i32
  %11989 = icmp eq i32 %11988, 0
  br i1 %11989, label %11990, label %11993

11990:                                            ; preds = %11982
  %11991 = mul nuw nsw i64 %11983, 16
  %11992 = getelementptr inbounds i8, i8* %0, i64 %11991
  call void @llvm.memset.p0i8.i64(i8* align 1 %11992, i8 0, i64 16, i1 false)
  br label %11993

11993:                                            ; preds = %11990, %11982
  %11994 = add nuw nsw i64 %11983, 1
  %11995 = call zeroext i8 @randombit()
  %11996 = getelementptr inbounds i8, i8* %1, i64 %11994
  store i8 %11995, i8* %11996, align 1
  %11997 = getelementptr inbounds i8, i8* %1, i64 %11994
  %11998 = load i8, i8* %11997, align 1
  %11999 = zext i8 %11998 to i32
  %12000 = icmp eq i32 %11999, 0
  br i1 %12000, label %12001, label %12004

12001:                                            ; preds = %11993
  %12002 = mul nuw nsw i64 %11994, 16
  %12003 = getelementptr inbounds i8, i8* %0, i64 %12002
  call void @llvm.memset.p0i8.i64(i8* align 1 %12003, i8 0, i64 16, i1 false)
  br label %12004

12004:                                            ; preds = %12001, %11993
  %12005 = add nuw nsw i64 %11994, 1
  %12006 = call zeroext i8 @randombit()
  %12007 = getelementptr inbounds i8, i8* %1, i64 %12005
  store i8 %12006, i8* %12007, align 1
  %12008 = getelementptr inbounds i8, i8* %1, i64 %12005
  %12009 = load i8, i8* %12008, align 1
  %12010 = zext i8 %12009 to i32
  %12011 = icmp eq i32 %12010, 0
  br i1 %12011, label %12012, label %12015

12012:                                            ; preds = %12004
  %12013 = mul nuw nsw i64 %12005, 16
  %12014 = getelementptr inbounds i8, i8* %0, i64 %12013
  call void @llvm.memset.p0i8.i64(i8* align 1 %12014, i8 0, i64 16, i1 false)
  br label %12015

12015:                                            ; preds = %12012, %12004
  %12016 = add nuw nsw i64 %12005, 1
  %12017 = call zeroext i8 @randombit()
  %12018 = getelementptr inbounds i8, i8* %1, i64 %12016
  store i8 %12017, i8* %12018, align 1
  %12019 = getelementptr inbounds i8, i8* %1, i64 %12016
  %12020 = load i8, i8* %12019, align 1
  %12021 = zext i8 %12020 to i32
  %12022 = icmp eq i32 %12021, 0
  br i1 %12022, label %12023, label %12026

12023:                                            ; preds = %12015
  %12024 = mul nuw nsw i64 %12016, 16
  %12025 = getelementptr inbounds i8, i8* %0, i64 %12024
  call void @llvm.memset.p0i8.i64(i8* align 1 %12025, i8 0, i64 16, i1 false)
  br label %12026

12026:                                            ; preds = %12023, %12015
  %12027 = add nuw nsw i64 %12016, 1
  %12028 = call zeroext i8 @randombit()
  %12029 = getelementptr inbounds i8, i8* %1, i64 %12027
  store i8 %12028, i8* %12029, align 1
  %12030 = getelementptr inbounds i8, i8* %1, i64 %12027
  %12031 = load i8, i8* %12030, align 1
  %12032 = zext i8 %12031 to i32
  %12033 = icmp eq i32 %12032, 0
  br i1 %12033, label %12034, label %12037

12034:                                            ; preds = %12026
  %12035 = mul nuw nsw i64 %12027, 16
  %12036 = getelementptr inbounds i8, i8* %0, i64 %12035
  call void @llvm.memset.p0i8.i64(i8* align 1 %12036, i8 0, i64 16, i1 false)
  br label %12037

12037:                                            ; preds = %12034, %12026
  %12038 = add nuw nsw i64 %12027, 1
  %12039 = call zeroext i8 @randombit()
  %12040 = getelementptr inbounds i8, i8* %1, i64 %12038
  store i8 %12039, i8* %12040, align 1
  %12041 = getelementptr inbounds i8, i8* %1, i64 %12038
  %12042 = load i8, i8* %12041, align 1
  %12043 = zext i8 %12042 to i32
  %12044 = icmp eq i32 %12043, 0
  br i1 %12044, label %12045, label %12048

12045:                                            ; preds = %12037
  %12046 = mul nuw nsw i64 %12038, 16
  %12047 = getelementptr inbounds i8, i8* %0, i64 %12046
  call void @llvm.memset.p0i8.i64(i8* align 1 %12047, i8 0, i64 16, i1 false)
  br label %12048

12048:                                            ; preds = %12045, %12037
  %12049 = add nuw nsw i64 %12038, 1
  %12050 = call zeroext i8 @randombit()
  %12051 = getelementptr inbounds i8, i8* %1, i64 %12049
  store i8 %12050, i8* %12051, align 1
  %12052 = getelementptr inbounds i8, i8* %1, i64 %12049
  %12053 = load i8, i8* %12052, align 1
  %12054 = zext i8 %12053 to i32
  %12055 = icmp eq i32 %12054, 0
  br i1 %12055, label %12056, label %12059

12056:                                            ; preds = %12048
  %12057 = mul nuw nsw i64 %12049, 16
  %12058 = getelementptr inbounds i8, i8* %0, i64 %12057
  call void @llvm.memset.p0i8.i64(i8* align 1 %12058, i8 0, i64 16, i1 false)
  br label %12059

12059:                                            ; preds = %12056, %12048
  %12060 = add nuw nsw i64 %12049, 1
  %12061 = call zeroext i8 @randombit()
  %12062 = getelementptr inbounds i8, i8* %1, i64 %12060
  store i8 %12061, i8* %12062, align 1
  %12063 = getelementptr inbounds i8, i8* %1, i64 %12060
  %12064 = load i8, i8* %12063, align 1
  %12065 = zext i8 %12064 to i32
  %12066 = icmp eq i32 %12065, 0
  br i1 %12066, label %12067, label %12070

12067:                                            ; preds = %12059
  %12068 = mul nuw nsw i64 %12060, 16
  %12069 = getelementptr inbounds i8, i8* %0, i64 %12068
  call void @llvm.memset.p0i8.i64(i8* align 1 %12069, i8 0, i64 16, i1 false)
  br label %12070

12070:                                            ; preds = %12067, %12059
  %12071 = add nuw nsw i64 %12060, 1
  %12072 = call zeroext i8 @randombit()
  %12073 = getelementptr inbounds i8, i8* %1, i64 %12071
  store i8 %12072, i8* %12073, align 1
  %12074 = getelementptr inbounds i8, i8* %1, i64 %12071
  %12075 = load i8, i8* %12074, align 1
  %12076 = zext i8 %12075 to i32
  %12077 = icmp eq i32 %12076, 0
  br i1 %12077, label %12078, label %12081

12078:                                            ; preds = %12070
  %12079 = mul nuw nsw i64 %12071, 16
  %12080 = getelementptr inbounds i8, i8* %0, i64 %12079
  call void @llvm.memset.p0i8.i64(i8* align 1 %12080, i8 0, i64 16, i1 false)
  br label %12081

12081:                                            ; preds = %12078, %12070
  %12082 = add nuw nsw i64 %12071, 1
  %12083 = call zeroext i8 @randombit()
  %12084 = getelementptr inbounds i8, i8* %1, i64 %12082
  store i8 %12083, i8* %12084, align 1
  %12085 = getelementptr inbounds i8, i8* %1, i64 %12082
  %12086 = load i8, i8* %12085, align 1
  %12087 = zext i8 %12086 to i32
  %12088 = icmp eq i32 %12087, 0
  br i1 %12088, label %12089, label %12092

12089:                                            ; preds = %12081
  %12090 = mul nuw nsw i64 %12082, 16
  %12091 = getelementptr inbounds i8, i8* %0, i64 %12090
  call void @llvm.memset.p0i8.i64(i8* align 1 %12091, i8 0, i64 16, i1 false)
  br label %12092

12092:                                            ; preds = %12089, %12081
  %12093 = add nuw nsw i64 %12082, 1
  %12094 = call zeroext i8 @randombit()
  %12095 = getelementptr inbounds i8, i8* %1, i64 %12093
  store i8 %12094, i8* %12095, align 1
  %12096 = getelementptr inbounds i8, i8* %1, i64 %12093
  %12097 = load i8, i8* %12096, align 1
  %12098 = zext i8 %12097 to i32
  %12099 = icmp eq i32 %12098, 0
  br i1 %12099, label %12100, label %12103

12100:                                            ; preds = %12092
  %12101 = mul nuw nsw i64 %12093, 16
  %12102 = getelementptr inbounds i8, i8* %0, i64 %12101
  call void @llvm.memset.p0i8.i64(i8* align 1 %12102, i8 0, i64 16, i1 false)
  br label %12103

12103:                                            ; preds = %12100, %12092
  %12104 = add nuw nsw i64 %12093, 1
  %12105 = call zeroext i8 @randombit()
  %12106 = getelementptr inbounds i8, i8* %1, i64 %12104
  store i8 %12105, i8* %12106, align 1
  %12107 = getelementptr inbounds i8, i8* %1, i64 %12104
  %12108 = load i8, i8* %12107, align 1
  %12109 = zext i8 %12108 to i32
  %12110 = icmp eq i32 %12109, 0
  br i1 %12110, label %12111, label %12114

12111:                                            ; preds = %12103
  %12112 = mul nuw nsw i64 %12104, 16
  %12113 = getelementptr inbounds i8, i8* %0, i64 %12112
  call void @llvm.memset.p0i8.i64(i8* align 1 %12113, i8 0, i64 16, i1 false)
  br label %12114

12114:                                            ; preds = %12111, %12103
  %12115 = add nuw nsw i64 %12104, 1
  %12116 = call zeroext i8 @randombit()
  %12117 = getelementptr inbounds i8, i8* %1, i64 %12115
  store i8 %12116, i8* %12117, align 1
  %12118 = getelementptr inbounds i8, i8* %1, i64 %12115
  %12119 = load i8, i8* %12118, align 1
  %12120 = zext i8 %12119 to i32
  %12121 = icmp eq i32 %12120, 0
  br i1 %12121, label %12122, label %12125

12122:                                            ; preds = %12114
  %12123 = mul nuw nsw i64 %12115, 16
  %12124 = getelementptr inbounds i8, i8* %0, i64 %12123
  call void @llvm.memset.p0i8.i64(i8* align 1 %12124, i8 0, i64 16, i1 false)
  br label %12125

12125:                                            ; preds = %12122, %12114
  %12126 = add nuw nsw i64 %12115, 1
  %12127 = call zeroext i8 @randombit()
  %12128 = getelementptr inbounds i8, i8* %1, i64 %12126
  store i8 %12127, i8* %12128, align 1
  %12129 = getelementptr inbounds i8, i8* %1, i64 %12126
  %12130 = load i8, i8* %12129, align 1
  %12131 = zext i8 %12130 to i32
  %12132 = icmp eq i32 %12131, 0
  br i1 %12132, label %12133, label %12136

12133:                                            ; preds = %12125
  %12134 = mul nuw nsw i64 %12126, 16
  %12135 = getelementptr inbounds i8, i8* %0, i64 %12134
  call void @llvm.memset.p0i8.i64(i8* align 1 %12135, i8 0, i64 16, i1 false)
  br label %12136

12136:                                            ; preds = %12133, %12125
  %12137 = add nuw nsw i64 %12126, 1
  %12138 = call zeroext i8 @randombit()
  %12139 = getelementptr inbounds i8, i8* %1, i64 %12137
  store i8 %12138, i8* %12139, align 1
  %12140 = getelementptr inbounds i8, i8* %1, i64 %12137
  %12141 = load i8, i8* %12140, align 1
  %12142 = zext i8 %12141 to i32
  %12143 = icmp eq i32 %12142, 0
  br i1 %12143, label %12144, label %12147

12144:                                            ; preds = %12136
  %12145 = mul nuw nsw i64 %12137, 16
  %12146 = getelementptr inbounds i8, i8* %0, i64 %12145
  call void @llvm.memset.p0i8.i64(i8* align 1 %12146, i8 0, i64 16, i1 false)
  br label %12147

12147:                                            ; preds = %12144, %12136
  %12148 = add nuw nsw i64 %12137, 1
  %12149 = call zeroext i8 @randombit()
  %12150 = getelementptr inbounds i8, i8* %1, i64 %12148
  store i8 %12149, i8* %12150, align 1
  %12151 = getelementptr inbounds i8, i8* %1, i64 %12148
  %12152 = load i8, i8* %12151, align 1
  %12153 = zext i8 %12152 to i32
  %12154 = icmp eq i32 %12153, 0
  br i1 %12154, label %12155, label %12158

12155:                                            ; preds = %12147
  %12156 = mul nuw nsw i64 %12148, 16
  %12157 = getelementptr inbounds i8, i8* %0, i64 %12156
  call void @llvm.memset.p0i8.i64(i8* align 1 %12157, i8 0, i64 16, i1 false)
  br label %12158

12158:                                            ; preds = %12155, %12147
  %12159 = add nuw nsw i64 %12148, 1
  %12160 = call zeroext i8 @randombit()
  %12161 = getelementptr inbounds i8, i8* %1, i64 %12159
  store i8 %12160, i8* %12161, align 1
  %12162 = getelementptr inbounds i8, i8* %1, i64 %12159
  %12163 = load i8, i8* %12162, align 1
  %12164 = zext i8 %12163 to i32
  %12165 = icmp eq i32 %12164, 0
  br i1 %12165, label %12166, label %12169

12166:                                            ; preds = %12158
  %12167 = mul nuw nsw i64 %12159, 16
  %12168 = getelementptr inbounds i8, i8* %0, i64 %12167
  call void @llvm.memset.p0i8.i64(i8* align 1 %12168, i8 0, i64 16, i1 false)
  br label %12169

12169:                                            ; preds = %12166, %12158
  %12170 = add nuw nsw i64 %12159, 1
  %12171 = call zeroext i8 @randombit()
  %12172 = getelementptr inbounds i8, i8* %1, i64 %12170
  store i8 %12171, i8* %12172, align 1
  %12173 = getelementptr inbounds i8, i8* %1, i64 %12170
  %12174 = load i8, i8* %12173, align 1
  %12175 = zext i8 %12174 to i32
  %12176 = icmp eq i32 %12175, 0
  br i1 %12176, label %12177, label %12180

12177:                                            ; preds = %12169
  %12178 = mul nuw nsw i64 %12170, 16
  %12179 = getelementptr inbounds i8, i8* %0, i64 %12178
  call void @llvm.memset.p0i8.i64(i8* align 1 %12179, i8 0, i64 16, i1 false)
  br label %12180

12180:                                            ; preds = %12177, %12169
  %12181 = add nuw nsw i64 %12170, 1
  %12182 = call zeroext i8 @randombit()
  %12183 = getelementptr inbounds i8, i8* %1, i64 %12181
  store i8 %12182, i8* %12183, align 1
  %12184 = getelementptr inbounds i8, i8* %1, i64 %12181
  %12185 = load i8, i8* %12184, align 1
  %12186 = zext i8 %12185 to i32
  %12187 = icmp eq i32 %12186, 0
  br i1 %12187, label %12188, label %12191

12188:                                            ; preds = %12180
  %12189 = mul nuw nsw i64 %12181, 16
  %12190 = getelementptr inbounds i8, i8* %0, i64 %12189
  call void @llvm.memset.p0i8.i64(i8* align 1 %12190, i8 0, i64 16, i1 false)
  br label %12191

12191:                                            ; preds = %12188, %12180
  %12192 = add nuw nsw i64 %12181, 1
  %12193 = call zeroext i8 @randombit()
  %12194 = getelementptr inbounds i8, i8* %1, i64 %12192
  store i8 %12193, i8* %12194, align 1
  %12195 = getelementptr inbounds i8, i8* %1, i64 %12192
  %12196 = load i8, i8* %12195, align 1
  %12197 = zext i8 %12196 to i32
  %12198 = icmp eq i32 %12197, 0
  br i1 %12198, label %12199, label %12202

12199:                                            ; preds = %12191
  %12200 = mul nuw nsw i64 %12192, 16
  %12201 = getelementptr inbounds i8, i8* %0, i64 %12200
  call void @llvm.memset.p0i8.i64(i8* align 1 %12201, i8 0, i64 16, i1 false)
  br label %12202

12202:                                            ; preds = %12199, %12191
  %12203 = add nuw nsw i64 %12192, 1
  %12204 = call zeroext i8 @randombit()
  %12205 = getelementptr inbounds i8, i8* %1, i64 %12203
  store i8 %12204, i8* %12205, align 1
  %12206 = getelementptr inbounds i8, i8* %1, i64 %12203
  %12207 = load i8, i8* %12206, align 1
  %12208 = zext i8 %12207 to i32
  %12209 = icmp eq i32 %12208, 0
  br i1 %12209, label %12210, label %12213

12210:                                            ; preds = %12202
  %12211 = mul nuw nsw i64 %12203, 16
  %12212 = getelementptr inbounds i8, i8* %0, i64 %12211
  call void @llvm.memset.p0i8.i64(i8* align 1 %12212, i8 0, i64 16, i1 false)
  br label %12213

12213:                                            ; preds = %12210, %12202
  %12214 = add nuw nsw i64 %12203, 1
  %12215 = call zeroext i8 @randombit()
  %12216 = getelementptr inbounds i8, i8* %1, i64 %12214
  store i8 %12215, i8* %12216, align 1
  %12217 = getelementptr inbounds i8, i8* %1, i64 %12214
  %12218 = load i8, i8* %12217, align 1
  %12219 = zext i8 %12218 to i32
  %12220 = icmp eq i32 %12219, 0
  br i1 %12220, label %12221, label %12224

12221:                                            ; preds = %12213
  %12222 = mul nuw nsw i64 %12214, 16
  %12223 = getelementptr inbounds i8, i8* %0, i64 %12222
  call void @llvm.memset.p0i8.i64(i8* align 1 %12223, i8 0, i64 16, i1 false)
  br label %12224

12224:                                            ; preds = %12221, %12213
  %12225 = add nuw nsw i64 %12214, 1
  %12226 = call zeroext i8 @randombit()
  %12227 = getelementptr inbounds i8, i8* %1, i64 %12225
  store i8 %12226, i8* %12227, align 1
  %12228 = getelementptr inbounds i8, i8* %1, i64 %12225
  %12229 = load i8, i8* %12228, align 1
  %12230 = zext i8 %12229 to i32
  %12231 = icmp eq i32 %12230, 0
  br i1 %12231, label %12232, label %12235

12232:                                            ; preds = %12224
  %12233 = mul nuw nsw i64 %12225, 16
  %12234 = getelementptr inbounds i8, i8* %0, i64 %12233
  call void @llvm.memset.p0i8.i64(i8* align 1 %12234, i8 0, i64 16, i1 false)
  br label %12235

12235:                                            ; preds = %12232, %12224
  %12236 = add nuw nsw i64 %12225, 1
  %12237 = call zeroext i8 @randombit()
  %12238 = getelementptr inbounds i8, i8* %1, i64 %12236
  store i8 %12237, i8* %12238, align 1
  %12239 = getelementptr inbounds i8, i8* %1, i64 %12236
  %12240 = load i8, i8* %12239, align 1
  %12241 = zext i8 %12240 to i32
  %12242 = icmp eq i32 %12241, 0
  br i1 %12242, label %12243, label %12246

12243:                                            ; preds = %12235
  %12244 = mul nuw nsw i64 %12236, 16
  %12245 = getelementptr inbounds i8, i8* %0, i64 %12244
  call void @llvm.memset.p0i8.i64(i8* align 1 %12245, i8 0, i64 16, i1 false)
  br label %12246

12246:                                            ; preds = %12243, %12235
  %12247 = add nuw nsw i64 %12236, 1
  %12248 = call zeroext i8 @randombit()
  %12249 = getelementptr inbounds i8, i8* %1, i64 %12247
  store i8 %12248, i8* %12249, align 1
  %12250 = getelementptr inbounds i8, i8* %1, i64 %12247
  %12251 = load i8, i8* %12250, align 1
  %12252 = zext i8 %12251 to i32
  %12253 = icmp eq i32 %12252, 0
  br i1 %12253, label %12254, label %12257

12254:                                            ; preds = %12246
  %12255 = mul nuw nsw i64 %12247, 16
  %12256 = getelementptr inbounds i8, i8* %0, i64 %12255
  call void @llvm.memset.p0i8.i64(i8* align 1 %12256, i8 0, i64 16, i1 false)
  br label %12257

12257:                                            ; preds = %12254, %12246
  %12258 = add nuw nsw i64 %12247, 1
  %12259 = call zeroext i8 @randombit()
  %12260 = getelementptr inbounds i8, i8* %1, i64 %12258
  store i8 %12259, i8* %12260, align 1
  %12261 = getelementptr inbounds i8, i8* %1, i64 %12258
  %12262 = load i8, i8* %12261, align 1
  %12263 = zext i8 %12262 to i32
  %12264 = icmp eq i32 %12263, 0
  br i1 %12264, label %12265, label %12268

12265:                                            ; preds = %12257
  %12266 = mul nuw nsw i64 %12258, 16
  %12267 = getelementptr inbounds i8, i8* %0, i64 %12266
  call void @llvm.memset.p0i8.i64(i8* align 1 %12267, i8 0, i64 16, i1 false)
  br label %12268

12268:                                            ; preds = %12265, %12257
  %12269 = add nuw nsw i64 %12258, 1
  %12270 = call zeroext i8 @randombit()
  %12271 = getelementptr inbounds i8, i8* %1, i64 %12269
  store i8 %12270, i8* %12271, align 1
  %12272 = getelementptr inbounds i8, i8* %1, i64 %12269
  %12273 = load i8, i8* %12272, align 1
  %12274 = zext i8 %12273 to i32
  %12275 = icmp eq i32 %12274, 0
  br i1 %12275, label %12276, label %12279

12276:                                            ; preds = %12268
  %12277 = mul nuw nsw i64 %12269, 16
  %12278 = getelementptr inbounds i8, i8* %0, i64 %12277
  call void @llvm.memset.p0i8.i64(i8* align 1 %12278, i8 0, i64 16, i1 false)
  br label %12279

12279:                                            ; preds = %12276, %12268
  %12280 = add nuw nsw i64 %12269, 1
  %12281 = call zeroext i8 @randombit()
  %12282 = getelementptr inbounds i8, i8* %1, i64 %12280
  store i8 %12281, i8* %12282, align 1
  %12283 = getelementptr inbounds i8, i8* %1, i64 %12280
  %12284 = load i8, i8* %12283, align 1
  %12285 = zext i8 %12284 to i32
  %12286 = icmp eq i32 %12285, 0
  br i1 %12286, label %12287, label %12290

12287:                                            ; preds = %12279
  %12288 = mul nuw nsw i64 %12280, 16
  %12289 = getelementptr inbounds i8, i8* %0, i64 %12288
  call void @llvm.memset.p0i8.i64(i8* align 1 %12289, i8 0, i64 16, i1 false)
  br label %12290

12290:                                            ; preds = %12287, %12279
  %12291 = add nuw nsw i64 %12280, 1
  %12292 = call zeroext i8 @randombit()
  %12293 = getelementptr inbounds i8, i8* %1, i64 %12291
  store i8 %12292, i8* %12293, align 1
  %12294 = getelementptr inbounds i8, i8* %1, i64 %12291
  %12295 = load i8, i8* %12294, align 1
  %12296 = zext i8 %12295 to i32
  %12297 = icmp eq i32 %12296, 0
  br i1 %12297, label %12298, label %12301

12298:                                            ; preds = %12290
  %12299 = mul nuw nsw i64 %12291, 16
  %12300 = getelementptr inbounds i8, i8* %0, i64 %12299
  call void @llvm.memset.p0i8.i64(i8* align 1 %12300, i8 0, i64 16, i1 false)
  br label %12301

12301:                                            ; preds = %12298, %12290
  %12302 = add nuw nsw i64 %12291, 1
  %12303 = call zeroext i8 @randombit()
  %12304 = getelementptr inbounds i8, i8* %1, i64 %12302
  store i8 %12303, i8* %12304, align 1
  %12305 = getelementptr inbounds i8, i8* %1, i64 %12302
  %12306 = load i8, i8* %12305, align 1
  %12307 = zext i8 %12306 to i32
  %12308 = icmp eq i32 %12307, 0
  br i1 %12308, label %12309, label %12312

12309:                                            ; preds = %12301
  %12310 = mul nuw nsw i64 %12302, 16
  %12311 = getelementptr inbounds i8, i8* %0, i64 %12310
  call void @llvm.memset.p0i8.i64(i8* align 1 %12311, i8 0, i64 16, i1 false)
  br label %12312

12312:                                            ; preds = %12309, %12301
  %12313 = add nuw nsw i64 %12302, 1
  %12314 = call zeroext i8 @randombit()
  %12315 = getelementptr inbounds i8, i8* %1, i64 %12313
  store i8 %12314, i8* %12315, align 1
  %12316 = getelementptr inbounds i8, i8* %1, i64 %12313
  %12317 = load i8, i8* %12316, align 1
  %12318 = zext i8 %12317 to i32
  %12319 = icmp eq i32 %12318, 0
  br i1 %12319, label %12320, label %12323

12320:                                            ; preds = %12312
  %12321 = mul nuw nsw i64 %12313, 16
  %12322 = getelementptr inbounds i8, i8* %0, i64 %12321
  call void @llvm.memset.p0i8.i64(i8* align 1 %12322, i8 0, i64 16, i1 false)
  br label %12323

12323:                                            ; preds = %12320, %12312
  %12324 = add nuw nsw i64 %12313, 1
  %12325 = call zeroext i8 @randombit()
  %12326 = getelementptr inbounds i8, i8* %1, i64 %12324
  store i8 %12325, i8* %12326, align 1
  %12327 = getelementptr inbounds i8, i8* %1, i64 %12324
  %12328 = load i8, i8* %12327, align 1
  %12329 = zext i8 %12328 to i32
  %12330 = icmp eq i32 %12329, 0
  br i1 %12330, label %12331, label %12334

12331:                                            ; preds = %12323
  %12332 = mul nuw nsw i64 %12324, 16
  %12333 = getelementptr inbounds i8, i8* %0, i64 %12332
  call void @llvm.memset.p0i8.i64(i8* align 1 %12333, i8 0, i64 16, i1 false)
  br label %12334

12334:                                            ; preds = %12331, %12323
  %12335 = add nuw nsw i64 %12324, 1
  %12336 = call zeroext i8 @randombit()
  %12337 = getelementptr inbounds i8, i8* %1, i64 %12335
  store i8 %12336, i8* %12337, align 1
  %12338 = getelementptr inbounds i8, i8* %1, i64 %12335
  %12339 = load i8, i8* %12338, align 1
  %12340 = zext i8 %12339 to i32
  %12341 = icmp eq i32 %12340, 0
  br i1 %12341, label %12342, label %12345

12342:                                            ; preds = %12334
  %12343 = mul nuw nsw i64 %12335, 16
  %12344 = getelementptr inbounds i8, i8* %0, i64 %12343
  call void @llvm.memset.p0i8.i64(i8* align 1 %12344, i8 0, i64 16, i1 false)
  br label %12345

12345:                                            ; preds = %12342, %12334
  %12346 = add nuw nsw i64 %12335, 1
  %12347 = call zeroext i8 @randombit()
  %12348 = getelementptr inbounds i8, i8* %1, i64 %12346
  store i8 %12347, i8* %12348, align 1
  %12349 = getelementptr inbounds i8, i8* %1, i64 %12346
  %12350 = load i8, i8* %12349, align 1
  %12351 = zext i8 %12350 to i32
  %12352 = icmp eq i32 %12351, 0
  br i1 %12352, label %12353, label %12356

12353:                                            ; preds = %12345
  %12354 = mul nuw nsw i64 %12346, 16
  %12355 = getelementptr inbounds i8, i8* %0, i64 %12354
  call void @llvm.memset.p0i8.i64(i8* align 1 %12355, i8 0, i64 16, i1 false)
  br label %12356

12356:                                            ; preds = %12353, %12345
  %12357 = add nuw nsw i64 %12346, 1
  %12358 = call zeroext i8 @randombit()
  %12359 = getelementptr inbounds i8, i8* %1, i64 %12357
  store i8 %12358, i8* %12359, align 1
  %12360 = getelementptr inbounds i8, i8* %1, i64 %12357
  %12361 = load i8, i8* %12360, align 1
  %12362 = zext i8 %12361 to i32
  %12363 = icmp eq i32 %12362, 0
  br i1 %12363, label %12364, label %12367

12364:                                            ; preds = %12356
  %12365 = mul nuw nsw i64 %12357, 16
  %12366 = getelementptr inbounds i8, i8* %0, i64 %12365
  call void @llvm.memset.p0i8.i64(i8* align 1 %12366, i8 0, i64 16, i1 false)
  br label %12367

12367:                                            ; preds = %12364, %12356
  %12368 = add nuw nsw i64 %12357, 1
  %12369 = call zeroext i8 @randombit()
  %12370 = getelementptr inbounds i8, i8* %1, i64 %12368
  store i8 %12369, i8* %12370, align 1
  %12371 = getelementptr inbounds i8, i8* %1, i64 %12368
  %12372 = load i8, i8* %12371, align 1
  %12373 = zext i8 %12372 to i32
  %12374 = icmp eq i32 %12373, 0
  br i1 %12374, label %12375, label %12378

12375:                                            ; preds = %12367
  %12376 = mul nuw nsw i64 %12368, 16
  %12377 = getelementptr inbounds i8, i8* %0, i64 %12376
  call void @llvm.memset.p0i8.i64(i8* align 1 %12377, i8 0, i64 16, i1 false)
  br label %12378

12378:                                            ; preds = %12375, %12367
  %12379 = add nuw nsw i64 %12368, 1
  %12380 = call zeroext i8 @randombit()
  %12381 = getelementptr inbounds i8, i8* %1, i64 %12379
  store i8 %12380, i8* %12381, align 1
  %12382 = getelementptr inbounds i8, i8* %1, i64 %12379
  %12383 = load i8, i8* %12382, align 1
  %12384 = zext i8 %12383 to i32
  %12385 = icmp eq i32 %12384, 0
  br i1 %12385, label %12386, label %12389

12386:                                            ; preds = %12378
  %12387 = mul nuw nsw i64 %12379, 16
  %12388 = getelementptr inbounds i8, i8* %0, i64 %12387
  call void @llvm.memset.p0i8.i64(i8* align 1 %12388, i8 0, i64 16, i1 false)
  br label %12389

12389:                                            ; preds = %12386, %12378
  %12390 = add nuw nsw i64 %12379, 1
  %12391 = call zeroext i8 @randombit()
  %12392 = getelementptr inbounds i8, i8* %1, i64 %12390
  store i8 %12391, i8* %12392, align 1
  %12393 = getelementptr inbounds i8, i8* %1, i64 %12390
  %12394 = load i8, i8* %12393, align 1
  %12395 = zext i8 %12394 to i32
  %12396 = icmp eq i32 %12395, 0
  br i1 %12396, label %12397, label %12400

12397:                                            ; preds = %12389
  %12398 = mul nuw nsw i64 %12390, 16
  %12399 = getelementptr inbounds i8, i8* %0, i64 %12398
  call void @llvm.memset.p0i8.i64(i8* align 1 %12399, i8 0, i64 16, i1 false)
  br label %12400

12400:                                            ; preds = %12397, %12389
  %12401 = add nuw nsw i64 %12390, 1
  %12402 = call zeroext i8 @randombit()
  %12403 = getelementptr inbounds i8, i8* %1, i64 %12401
  store i8 %12402, i8* %12403, align 1
  %12404 = getelementptr inbounds i8, i8* %1, i64 %12401
  %12405 = load i8, i8* %12404, align 1
  %12406 = zext i8 %12405 to i32
  %12407 = icmp eq i32 %12406, 0
  br i1 %12407, label %12408, label %12411

12408:                                            ; preds = %12400
  %12409 = mul nuw nsw i64 %12401, 16
  %12410 = getelementptr inbounds i8, i8* %0, i64 %12409
  call void @llvm.memset.p0i8.i64(i8* align 1 %12410, i8 0, i64 16, i1 false)
  br label %12411

12411:                                            ; preds = %12408, %12400
  %12412 = add nuw nsw i64 %12401, 1
  %12413 = call zeroext i8 @randombit()
  %12414 = getelementptr inbounds i8, i8* %1, i64 %12412
  store i8 %12413, i8* %12414, align 1
  %12415 = getelementptr inbounds i8, i8* %1, i64 %12412
  %12416 = load i8, i8* %12415, align 1
  %12417 = zext i8 %12416 to i32
  %12418 = icmp eq i32 %12417, 0
  br i1 %12418, label %12419, label %12422

12419:                                            ; preds = %12411
  %12420 = mul nuw nsw i64 %12412, 16
  %12421 = getelementptr inbounds i8, i8* %0, i64 %12420
  call void @llvm.memset.p0i8.i64(i8* align 1 %12421, i8 0, i64 16, i1 false)
  br label %12422

12422:                                            ; preds = %12419, %12411
  %12423 = add nuw nsw i64 %12412, 1
  %12424 = call zeroext i8 @randombit()
  %12425 = getelementptr inbounds i8, i8* %1, i64 %12423
  store i8 %12424, i8* %12425, align 1
  %12426 = getelementptr inbounds i8, i8* %1, i64 %12423
  %12427 = load i8, i8* %12426, align 1
  %12428 = zext i8 %12427 to i32
  %12429 = icmp eq i32 %12428, 0
  br i1 %12429, label %12430, label %12433

12430:                                            ; preds = %12422
  %12431 = mul nuw nsw i64 %12423, 16
  %12432 = getelementptr inbounds i8, i8* %0, i64 %12431
  call void @llvm.memset.p0i8.i64(i8* align 1 %12432, i8 0, i64 16, i1 false)
  br label %12433

12433:                                            ; preds = %12430, %12422
  %12434 = add nuw nsw i64 %12423, 1
  %12435 = call zeroext i8 @randombit()
  %12436 = getelementptr inbounds i8, i8* %1, i64 %12434
  store i8 %12435, i8* %12436, align 1
  %12437 = getelementptr inbounds i8, i8* %1, i64 %12434
  %12438 = load i8, i8* %12437, align 1
  %12439 = zext i8 %12438 to i32
  %12440 = icmp eq i32 %12439, 0
  br i1 %12440, label %12441, label %12444

12441:                                            ; preds = %12433
  %12442 = mul nuw nsw i64 %12434, 16
  %12443 = getelementptr inbounds i8, i8* %0, i64 %12442
  call void @llvm.memset.p0i8.i64(i8* align 1 %12443, i8 0, i64 16, i1 false)
  br label %12444

12444:                                            ; preds = %12441, %12433
  %12445 = add nuw nsw i64 %12434, 1
  %12446 = call zeroext i8 @randombit()
  %12447 = getelementptr inbounds i8, i8* %1, i64 %12445
  store i8 %12446, i8* %12447, align 1
  %12448 = getelementptr inbounds i8, i8* %1, i64 %12445
  %12449 = load i8, i8* %12448, align 1
  %12450 = zext i8 %12449 to i32
  %12451 = icmp eq i32 %12450, 0
  br i1 %12451, label %12452, label %12455

12452:                                            ; preds = %12444
  %12453 = mul nuw nsw i64 %12445, 16
  %12454 = getelementptr inbounds i8, i8* %0, i64 %12453
  call void @llvm.memset.p0i8.i64(i8* align 1 %12454, i8 0, i64 16, i1 false)
  br label %12455

12455:                                            ; preds = %12452, %12444
  %12456 = add nuw nsw i64 %12445, 1
  %12457 = call zeroext i8 @randombit()
  %12458 = getelementptr inbounds i8, i8* %1, i64 %12456
  store i8 %12457, i8* %12458, align 1
  %12459 = getelementptr inbounds i8, i8* %1, i64 %12456
  %12460 = load i8, i8* %12459, align 1
  %12461 = zext i8 %12460 to i32
  %12462 = icmp eq i32 %12461, 0
  br i1 %12462, label %12463, label %12466

12463:                                            ; preds = %12455
  %12464 = mul nuw nsw i64 %12456, 16
  %12465 = getelementptr inbounds i8, i8* %0, i64 %12464
  call void @llvm.memset.p0i8.i64(i8* align 1 %12465, i8 0, i64 16, i1 false)
  br label %12466

12466:                                            ; preds = %12463, %12455
  %12467 = add nuw nsw i64 %12456, 1
  %12468 = call zeroext i8 @randombit()
  %12469 = getelementptr inbounds i8, i8* %1, i64 %12467
  store i8 %12468, i8* %12469, align 1
  %12470 = getelementptr inbounds i8, i8* %1, i64 %12467
  %12471 = load i8, i8* %12470, align 1
  %12472 = zext i8 %12471 to i32
  %12473 = icmp eq i32 %12472, 0
  br i1 %12473, label %12474, label %12477

12474:                                            ; preds = %12466
  %12475 = mul nuw nsw i64 %12467, 16
  %12476 = getelementptr inbounds i8, i8* %0, i64 %12475
  call void @llvm.memset.p0i8.i64(i8* align 1 %12476, i8 0, i64 16, i1 false)
  br label %12477

12477:                                            ; preds = %12474, %12466
  %12478 = add nuw nsw i64 %12467, 1
  %12479 = call zeroext i8 @randombit()
  %12480 = getelementptr inbounds i8, i8* %1, i64 %12478
  store i8 %12479, i8* %12480, align 1
  %12481 = getelementptr inbounds i8, i8* %1, i64 %12478
  %12482 = load i8, i8* %12481, align 1
  %12483 = zext i8 %12482 to i32
  %12484 = icmp eq i32 %12483, 0
  br i1 %12484, label %12485, label %12488

12485:                                            ; preds = %12477
  %12486 = mul nuw nsw i64 %12478, 16
  %12487 = getelementptr inbounds i8, i8* %0, i64 %12486
  call void @llvm.memset.p0i8.i64(i8* align 1 %12487, i8 0, i64 16, i1 false)
  br label %12488

12488:                                            ; preds = %12485, %12477
  %12489 = add nuw nsw i64 %12478, 1
  %12490 = call zeroext i8 @randombit()
  %12491 = getelementptr inbounds i8, i8* %1, i64 %12489
  store i8 %12490, i8* %12491, align 1
  %12492 = getelementptr inbounds i8, i8* %1, i64 %12489
  %12493 = load i8, i8* %12492, align 1
  %12494 = zext i8 %12493 to i32
  %12495 = icmp eq i32 %12494, 0
  br i1 %12495, label %12496, label %12499

12496:                                            ; preds = %12488
  %12497 = mul nuw nsw i64 %12489, 16
  %12498 = getelementptr inbounds i8, i8* %0, i64 %12497
  call void @llvm.memset.p0i8.i64(i8* align 1 %12498, i8 0, i64 16, i1 false)
  br label %12499

12499:                                            ; preds = %12496, %12488
  %12500 = add nuw nsw i64 %12489, 1
  %12501 = call zeroext i8 @randombit()
  %12502 = getelementptr inbounds i8, i8* %1, i64 %12500
  store i8 %12501, i8* %12502, align 1
  %12503 = getelementptr inbounds i8, i8* %1, i64 %12500
  %12504 = load i8, i8* %12503, align 1
  %12505 = zext i8 %12504 to i32
  %12506 = icmp eq i32 %12505, 0
  br i1 %12506, label %12507, label %12510

12507:                                            ; preds = %12499
  %12508 = mul nuw nsw i64 %12500, 16
  %12509 = getelementptr inbounds i8, i8* %0, i64 %12508
  call void @llvm.memset.p0i8.i64(i8* align 1 %12509, i8 0, i64 16, i1 false)
  br label %12510

12510:                                            ; preds = %12507, %12499
  %12511 = add nuw nsw i64 %12500, 1
  %12512 = call zeroext i8 @randombit()
  %12513 = getelementptr inbounds i8, i8* %1, i64 %12511
  store i8 %12512, i8* %12513, align 1
  %12514 = getelementptr inbounds i8, i8* %1, i64 %12511
  %12515 = load i8, i8* %12514, align 1
  %12516 = zext i8 %12515 to i32
  %12517 = icmp eq i32 %12516, 0
  br i1 %12517, label %12518, label %12521

12518:                                            ; preds = %12510
  %12519 = mul nuw nsw i64 %12511, 16
  %12520 = getelementptr inbounds i8, i8* %0, i64 %12519
  call void @llvm.memset.p0i8.i64(i8* align 1 %12520, i8 0, i64 16, i1 false)
  br label %12521

12521:                                            ; preds = %12518, %12510
  %12522 = add nuw nsw i64 %12511, 1
  %12523 = call zeroext i8 @randombit()
  %12524 = getelementptr inbounds i8, i8* %1, i64 %12522
  store i8 %12523, i8* %12524, align 1
  %12525 = getelementptr inbounds i8, i8* %1, i64 %12522
  %12526 = load i8, i8* %12525, align 1
  %12527 = zext i8 %12526 to i32
  %12528 = icmp eq i32 %12527, 0
  br i1 %12528, label %12529, label %12532

12529:                                            ; preds = %12521
  %12530 = mul nuw nsw i64 %12522, 16
  %12531 = getelementptr inbounds i8, i8* %0, i64 %12530
  call void @llvm.memset.p0i8.i64(i8* align 1 %12531, i8 0, i64 16, i1 false)
  br label %12532

12532:                                            ; preds = %12529, %12521
  %12533 = add nuw nsw i64 %12522, 1
  %12534 = call zeroext i8 @randombit()
  %12535 = getelementptr inbounds i8, i8* %1, i64 %12533
  store i8 %12534, i8* %12535, align 1
  %12536 = getelementptr inbounds i8, i8* %1, i64 %12533
  %12537 = load i8, i8* %12536, align 1
  %12538 = zext i8 %12537 to i32
  %12539 = icmp eq i32 %12538, 0
  br i1 %12539, label %12540, label %12543

12540:                                            ; preds = %12532
  %12541 = mul nuw nsw i64 %12533, 16
  %12542 = getelementptr inbounds i8, i8* %0, i64 %12541
  call void @llvm.memset.p0i8.i64(i8* align 1 %12542, i8 0, i64 16, i1 false)
  br label %12543

12543:                                            ; preds = %12540, %12532
  %12544 = add nuw nsw i64 %12533, 1
  %12545 = call zeroext i8 @randombit()
  %12546 = getelementptr inbounds i8, i8* %1, i64 %12544
  store i8 %12545, i8* %12546, align 1
  %12547 = getelementptr inbounds i8, i8* %1, i64 %12544
  %12548 = load i8, i8* %12547, align 1
  %12549 = zext i8 %12548 to i32
  %12550 = icmp eq i32 %12549, 0
  br i1 %12550, label %12551, label %12554

12551:                                            ; preds = %12543
  %12552 = mul nuw nsw i64 %12544, 16
  %12553 = getelementptr inbounds i8, i8* %0, i64 %12552
  call void @llvm.memset.p0i8.i64(i8* align 1 %12553, i8 0, i64 16, i1 false)
  br label %12554

12554:                                            ; preds = %12551, %12543
  %12555 = add nuw nsw i64 %12544, 1
  %12556 = call zeroext i8 @randombit()
  %12557 = getelementptr inbounds i8, i8* %1, i64 %12555
  store i8 %12556, i8* %12557, align 1
  %12558 = getelementptr inbounds i8, i8* %1, i64 %12555
  %12559 = load i8, i8* %12558, align 1
  %12560 = zext i8 %12559 to i32
  %12561 = icmp eq i32 %12560, 0
  br i1 %12561, label %12562, label %12565

12562:                                            ; preds = %12554
  %12563 = mul nuw nsw i64 %12555, 16
  %12564 = getelementptr inbounds i8, i8* %0, i64 %12563
  call void @llvm.memset.p0i8.i64(i8* align 1 %12564, i8 0, i64 16, i1 false)
  br label %12565

12565:                                            ; preds = %12562, %12554
  %12566 = add nuw nsw i64 %12555, 1
  %12567 = call zeroext i8 @randombit()
  %12568 = getelementptr inbounds i8, i8* %1, i64 %12566
  store i8 %12567, i8* %12568, align 1
  %12569 = getelementptr inbounds i8, i8* %1, i64 %12566
  %12570 = load i8, i8* %12569, align 1
  %12571 = zext i8 %12570 to i32
  %12572 = icmp eq i32 %12571, 0
  br i1 %12572, label %12573, label %12576

12573:                                            ; preds = %12565
  %12574 = mul nuw nsw i64 %12566, 16
  %12575 = getelementptr inbounds i8, i8* %0, i64 %12574
  call void @llvm.memset.p0i8.i64(i8* align 1 %12575, i8 0, i64 16, i1 false)
  br label %12576

12576:                                            ; preds = %12573, %12565
  %12577 = add nuw nsw i64 %12566, 1
  %12578 = call zeroext i8 @randombit()
  %12579 = getelementptr inbounds i8, i8* %1, i64 %12577
  store i8 %12578, i8* %12579, align 1
  %12580 = getelementptr inbounds i8, i8* %1, i64 %12577
  %12581 = load i8, i8* %12580, align 1
  %12582 = zext i8 %12581 to i32
  %12583 = icmp eq i32 %12582, 0
  br i1 %12583, label %12584, label %12587

12584:                                            ; preds = %12576
  %12585 = mul nuw nsw i64 %12577, 16
  %12586 = getelementptr inbounds i8, i8* %0, i64 %12585
  call void @llvm.memset.p0i8.i64(i8* align 1 %12586, i8 0, i64 16, i1 false)
  br label %12587

12587:                                            ; preds = %12584, %12576
  %12588 = add nuw nsw i64 %12577, 1
  %12589 = call zeroext i8 @randombit()
  %12590 = getelementptr inbounds i8, i8* %1, i64 %12588
  store i8 %12589, i8* %12590, align 1
  %12591 = getelementptr inbounds i8, i8* %1, i64 %12588
  %12592 = load i8, i8* %12591, align 1
  %12593 = zext i8 %12592 to i32
  %12594 = icmp eq i32 %12593, 0
  br i1 %12594, label %12595, label %12598

12595:                                            ; preds = %12587
  %12596 = mul nuw nsw i64 %12588, 16
  %12597 = getelementptr inbounds i8, i8* %0, i64 %12596
  call void @llvm.memset.p0i8.i64(i8* align 1 %12597, i8 0, i64 16, i1 false)
  br label %12598

12598:                                            ; preds = %12595, %12587
  %12599 = add nuw nsw i64 %12588, 1
  %12600 = call zeroext i8 @randombit()
  %12601 = getelementptr inbounds i8, i8* %1, i64 %12599
  store i8 %12600, i8* %12601, align 1
  %12602 = getelementptr inbounds i8, i8* %1, i64 %12599
  %12603 = load i8, i8* %12602, align 1
  %12604 = zext i8 %12603 to i32
  %12605 = icmp eq i32 %12604, 0
  br i1 %12605, label %12606, label %12609

12606:                                            ; preds = %12598
  %12607 = mul nuw nsw i64 %12599, 16
  %12608 = getelementptr inbounds i8, i8* %0, i64 %12607
  call void @llvm.memset.p0i8.i64(i8* align 1 %12608, i8 0, i64 16, i1 false)
  br label %12609

12609:                                            ; preds = %12606, %12598
  %12610 = add nuw nsw i64 %12599, 1
  %12611 = call zeroext i8 @randombit()
  %12612 = getelementptr inbounds i8, i8* %1, i64 %12610
  store i8 %12611, i8* %12612, align 1
  %12613 = getelementptr inbounds i8, i8* %1, i64 %12610
  %12614 = load i8, i8* %12613, align 1
  %12615 = zext i8 %12614 to i32
  %12616 = icmp eq i32 %12615, 0
  br i1 %12616, label %12617, label %12620

12617:                                            ; preds = %12609
  %12618 = mul nuw nsw i64 %12610, 16
  %12619 = getelementptr inbounds i8, i8* %0, i64 %12618
  call void @llvm.memset.p0i8.i64(i8* align 1 %12619, i8 0, i64 16, i1 false)
  br label %12620

12620:                                            ; preds = %12617, %12609
  %12621 = add nuw nsw i64 %12610, 1
  %12622 = call zeroext i8 @randombit()
  %12623 = getelementptr inbounds i8, i8* %1, i64 %12621
  store i8 %12622, i8* %12623, align 1
  %12624 = getelementptr inbounds i8, i8* %1, i64 %12621
  %12625 = load i8, i8* %12624, align 1
  %12626 = zext i8 %12625 to i32
  %12627 = icmp eq i32 %12626, 0
  br i1 %12627, label %12628, label %12631

12628:                                            ; preds = %12620
  %12629 = mul nuw nsw i64 %12621, 16
  %12630 = getelementptr inbounds i8, i8* %0, i64 %12629
  call void @llvm.memset.p0i8.i64(i8* align 1 %12630, i8 0, i64 16, i1 false)
  br label %12631

12631:                                            ; preds = %12628, %12620
  %12632 = add nuw nsw i64 %12621, 1
  %12633 = call zeroext i8 @randombit()
  %12634 = getelementptr inbounds i8, i8* %1, i64 %12632
  store i8 %12633, i8* %12634, align 1
  %12635 = getelementptr inbounds i8, i8* %1, i64 %12632
  %12636 = load i8, i8* %12635, align 1
  %12637 = zext i8 %12636 to i32
  %12638 = icmp eq i32 %12637, 0
  br i1 %12638, label %12639, label %12642

12639:                                            ; preds = %12631
  %12640 = mul nuw nsw i64 %12632, 16
  %12641 = getelementptr inbounds i8, i8* %0, i64 %12640
  call void @llvm.memset.p0i8.i64(i8* align 1 %12641, i8 0, i64 16, i1 false)
  br label %12642

12642:                                            ; preds = %12639, %12631
  %12643 = add nuw nsw i64 %12632, 1
  %12644 = call zeroext i8 @randombit()
  %12645 = getelementptr inbounds i8, i8* %1, i64 %12643
  store i8 %12644, i8* %12645, align 1
  %12646 = getelementptr inbounds i8, i8* %1, i64 %12643
  %12647 = load i8, i8* %12646, align 1
  %12648 = zext i8 %12647 to i32
  %12649 = icmp eq i32 %12648, 0
  br i1 %12649, label %12650, label %12653

12650:                                            ; preds = %12642
  %12651 = mul nuw nsw i64 %12643, 16
  %12652 = getelementptr inbounds i8, i8* %0, i64 %12651
  call void @llvm.memset.p0i8.i64(i8* align 1 %12652, i8 0, i64 16, i1 false)
  br label %12653

12653:                                            ; preds = %12650, %12642
  %12654 = add nuw nsw i64 %12643, 1
  %12655 = call zeroext i8 @randombit()
  %12656 = getelementptr inbounds i8, i8* %1, i64 %12654
  store i8 %12655, i8* %12656, align 1
  %12657 = getelementptr inbounds i8, i8* %1, i64 %12654
  %12658 = load i8, i8* %12657, align 1
  %12659 = zext i8 %12658 to i32
  %12660 = icmp eq i32 %12659, 0
  br i1 %12660, label %12661, label %12664

12661:                                            ; preds = %12653
  %12662 = mul nuw nsw i64 %12654, 16
  %12663 = getelementptr inbounds i8, i8* %0, i64 %12662
  call void @llvm.memset.p0i8.i64(i8* align 1 %12663, i8 0, i64 16, i1 false)
  br label %12664

12664:                                            ; preds = %12661, %12653
  %12665 = add nuw nsw i64 %12654, 1
  %12666 = call zeroext i8 @randombit()
  %12667 = getelementptr inbounds i8, i8* %1, i64 %12665
  store i8 %12666, i8* %12667, align 1
  %12668 = getelementptr inbounds i8, i8* %1, i64 %12665
  %12669 = load i8, i8* %12668, align 1
  %12670 = zext i8 %12669 to i32
  %12671 = icmp eq i32 %12670, 0
  br i1 %12671, label %12672, label %12675

12672:                                            ; preds = %12664
  %12673 = mul nuw nsw i64 %12665, 16
  %12674 = getelementptr inbounds i8, i8* %0, i64 %12673
  call void @llvm.memset.p0i8.i64(i8* align 1 %12674, i8 0, i64 16, i1 false)
  br label %12675

12675:                                            ; preds = %12672, %12664
  %12676 = add nuw nsw i64 %12665, 1
  %12677 = call zeroext i8 @randombit()
  %12678 = getelementptr inbounds i8, i8* %1, i64 %12676
  store i8 %12677, i8* %12678, align 1
  %12679 = getelementptr inbounds i8, i8* %1, i64 %12676
  %12680 = load i8, i8* %12679, align 1
  %12681 = zext i8 %12680 to i32
  %12682 = icmp eq i32 %12681, 0
  br i1 %12682, label %12683, label %12686

12683:                                            ; preds = %12675
  %12684 = mul nuw nsw i64 %12676, 16
  %12685 = getelementptr inbounds i8, i8* %0, i64 %12684
  call void @llvm.memset.p0i8.i64(i8* align 1 %12685, i8 0, i64 16, i1 false)
  br label %12686

12686:                                            ; preds = %12683, %12675
  %12687 = add nuw nsw i64 %12676, 1
  %12688 = call zeroext i8 @randombit()
  %12689 = getelementptr inbounds i8, i8* %1, i64 %12687
  store i8 %12688, i8* %12689, align 1
  %12690 = getelementptr inbounds i8, i8* %1, i64 %12687
  %12691 = load i8, i8* %12690, align 1
  %12692 = zext i8 %12691 to i32
  %12693 = icmp eq i32 %12692, 0
  br i1 %12693, label %12694, label %12697

12694:                                            ; preds = %12686
  %12695 = mul nuw nsw i64 %12687, 16
  %12696 = getelementptr inbounds i8, i8* %0, i64 %12695
  call void @llvm.memset.p0i8.i64(i8* align 1 %12696, i8 0, i64 16, i1 false)
  br label %12697

12697:                                            ; preds = %12694, %12686
  %12698 = add nuw nsw i64 %12687, 1
  %12699 = call zeroext i8 @randombit()
  %12700 = getelementptr inbounds i8, i8* %1, i64 %12698
  store i8 %12699, i8* %12700, align 1
  %12701 = getelementptr inbounds i8, i8* %1, i64 %12698
  %12702 = load i8, i8* %12701, align 1
  %12703 = zext i8 %12702 to i32
  %12704 = icmp eq i32 %12703, 0
  br i1 %12704, label %12705, label %12708

12705:                                            ; preds = %12697
  %12706 = mul nuw nsw i64 %12698, 16
  %12707 = getelementptr inbounds i8, i8* %0, i64 %12706
  call void @llvm.memset.p0i8.i64(i8* align 1 %12707, i8 0, i64 16, i1 false)
  br label %12708

12708:                                            ; preds = %12705, %12697
  %12709 = add nuw nsw i64 %12698, 1
  %12710 = call zeroext i8 @randombit()
  %12711 = getelementptr inbounds i8, i8* %1, i64 %12709
  store i8 %12710, i8* %12711, align 1
  %12712 = getelementptr inbounds i8, i8* %1, i64 %12709
  %12713 = load i8, i8* %12712, align 1
  %12714 = zext i8 %12713 to i32
  %12715 = icmp eq i32 %12714, 0
  br i1 %12715, label %12716, label %12719

12716:                                            ; preds = %12708
  %12717 = mul nuw nsw i64 %12709, 16
  %12718 = getelementptr inbounds i8, i8* %0, i64 %12717
  call void @llvm.memset.p0i8.i64(i8* align 1 %12718, i8 0, i64 16, i1 false)
  br label %12719

12719:                                            ; preds = %12716, %12708
  %12720 = add nuw nsw i64 %12709, 1
  %12721 = call zeroext i8 @randombit()
  %12722 = getelementptr inbounds i8, i8* %1, i64 %12720
  store i8 %12721, i8* %12722, align 1
  %12723 = getelementptr inbounds i8, i8* %1, i64 %12720
  %12724 = load i8, i8* %12723, align 1
  %12725 = zext i8 %12724 to i32
  %12726 = icmp eq i32 %12725, 0
  br i1 %12726, label %12727, label %12730

12727:                                            ; preds = %12719
  %12728 = mul nuw nsw i64 %12720, 16
  %12729 = getelementptr inbounds i8, i8* %0, i64 %12728
  call void @llvm.memset.p0i8.i64(i8* align 1 %12729, i8 0, i64 16, i1 false)
  br label %12730

12730:                                            ; preds = %12727, %12719
  %12731 = add nuw nsw i64 %12720, 1
  %12732 = call zeroext i8 @randombit()
  %12733 = getelementptr inbounds i8, i8* %1, i64 %12731
  store i8 %12732, i8* %12733, align 1
  %12734 = getelementptr inbounds i8, i8* %1, i64 %12731
  %12735 = load i8, i8* %12734, align 1
  %12736 = zext i8 %12735 to i32
  %12737 = icmp eq i32 %12736, 0
  br i1 %12737, label %12738, label %12741

12738:                                            ; preds = %12730
  %12739 = mul nuw nsw i64 %12731, 16
  %12740 = getelementptr inbounds i8, i8* %0, i64 %12739
  call void @llvm.memset.p0i8.i64(i8* align 1 %12740, i8 0, i64 16, i1 false)
  br label %12741

12741:                                            ; preds = %12738, %12730
  %12742 = add nuw nsw i64 %12731, 1
  %12743 = call zeroext i8 @randombit()
  %12744 = getelementptr inbounds i8, i8* %1, i64 %12742
  store i8 %12743, i8* %12744, align 1
  %12745 = getelementptr inbounds i8, i8* %1, i64 %12742
  %12746 = load i8, i8* %12745, align 1
  %12747 = zext i8 %12746 to i32
  %12748 = icmp eq i32 %12747, 0
  br i1 %12748, label %12749, label %12752

12749:                                            ; preds = %12741
  %12750 = mul nuw nsw i64 %12742, 16
  %12751 = getelementptr inbounds i8, i8* %0, i64 %12750
  call void @llvm.memset.p0i8.i64(i8* align 1 %12751, i8 0, i64 16, i1 false)
  br label %12752

12752:                                            ; preds = %12749, %12741
  %12753 = add nuw nsw i64 %12742, 1
  %12754 = call zeroext i8 @randombit()
  %12755 = getelementptr inbounds i8, i8* %1, i64 %12753
  store i8 %12754, i8* %12755, align 1
  %12756 = getelementptr inbounds i8, i8* %1, i64 %12753
  %12757 = load i8, i8* %12756, align 1
  %12758 = zext i8 %12757 to i32
  %12759 = icmp eq i32 %12758, 0
  br i1 %12759, label %12760, label %12763

12760:                                            ; preds = %12752
  %12761 = mul nuw nsw i64 %12753, 16
  %12762 = getelementptr inbounds i8, i8* %0, i64 %12761
  call void @llvm.memset.p0i8.i64(i8* align 1 %12762, i8 0, i64 16, i1 false)
  br label %12763

12763:                                            ; preds = %12760, %12752
  %12764 = add nuw nsw i64 %12753, 1
  %12765 = call zeroext i8 @randombit()
  %12766 = getelementptr inbounds i8, i8* %1, i64 %12764
  store i8 %12765, i8* %12766, align 1
  %12767 = getelementptr inbounds i8, i8* %1, i64 %12764
  %12768 = load i8, i8* %12767, align 1
  %12769 = zext i8 %12768 to i32
  %12770 = icmp eq i32 %12769, 0
  br i1 %12770, label %12771, label %12774

12771:                                            ; preds = %12763
  %12772 = mul nuw nsw i64 %12764, 16
  %12773 = getelementptr inbounds i8, i8* %0, i64 %12772
  call void @llvm.memset.p0i8.i64(i8* align 1 %12773, i8 0, i64 16, i1 false)
  br label %12774

12774:                                            ; preds = %12771, %12763
  %12775 = add nuw nsw i64 %12764, 1
  %12776 = call zeroext i8 @randombit()
  %12777 = getelementptr inbounds i8, i8* %1, i64 %12775
  store i8 %12776, i8* %12777, align 1
  %12778 = getelementptr inbounds i8, i8* %1, i64 %12775
  %12779 = load i8, i8* %12778, align 1
  %12780 = zext i8 %12779 to i32
  %12781 = icmp eq i32 %12780, 0
  br i1 %12781, label %12782, label %12785

12782:                                            ; preds = %12774
  %12783 = mul nuw nsw i64 %12775, 16
  %12784 = getelementptr inbounds i8, i8* %0, i64 %12783
  call void @llvm.memset.p0i8.i64(i8* align 1 %12784, i8 0, i64 16, i1 false)
  br label %12785

12785:                                            ; preds = %12782, %12774
  %12786 = add nuw nsw i64 %12775, 1
  %12787 = call zeroext i8 @randombit()
  %12788 = getelementptr inbounds i8, i8* %1, i64 %12786
  store i8 %12787, i8* %12788, align 1
  %12789 = getelementptr inbounds i8, i8* %1, i64 %12786
  %12790 = load i8, i8* %12789, align 1
  %12791 = zext i8 %12790 to i32
  %12792 = icmp eq i32 %12791, 0
  br i1 %12792, label %12793, label %12796

12793:                                            ; preds = %12785
  %12794 = mul nuw nsw i64 %12786, 16
  %12795 = getelementptr inbounds i8, i8* %0, i64 %12794
  call void @llvm.memset.p0i8.i64(i8* align 1 %12795, i8 0, i64 16, i1 false)
  br label %12796

12796:                                            ; preds = %12793, %12785
  %12797 = add nuw nsw i64 %12786, 1
  %12798 = call zeroext i8 @randombit()
  %12799 = getelementptr inbounds i8, i8* %1, i64 %12797
  store i8 %12798, i8* %12799, align 1
  %12800 = getelementptr inbounds i8, i8* %1, i64 %12797
  %12801 = load i8, i8* %12800, align 1
  %12802 = zext i8 %12801 to i32
  %12803 = icmp eq i32 %12802, 0
  br i1 %12803, label %12804, label %12807

12804:                                            ; preds = %12796
  %12805 = mul nuw nsw i64 %12797, 16
  %12806 = getelementptr inbounds i8, i8* %0, i64 %12805
  call void @llvm.memset.p0i8.i64(i8* align 1 %12806, i8 0, i64 16, i1 false)
  br label %12807

12807:                                            ; preds = %12804, %12796
  %12808 = add nuw nsw i64 %12797, 1
  %12809 = call zeroext i8 @randombit()
  %12810 = getelementptr inbounds i8, i8* %1, i64 %12808
  store i8 %12809, i8* %12810, align 1
  %12811 = getelementptr inbounds i8, i8* %1, i64 %12808
  %12812 = load i8, i8* %12811, align 1
  %12813 = zext i8 %12812 to i32
  %12814 = icmp eq i32 %12813, 0
  br i1 %12814, label %12815, label %12818

12815:                                            ; preds = %12807
  %12816 = mul nuw nsw i64 %12808, 16
  %12817 = getelementptr inbounds i8, i8* %0, i64 %12816
  call void @llvm.memset.p0i8.i64(i8* align 1 %12817, i8 0, i64 16, i1 false)
  br label %12818

12818:                                            ; preds = %12815, %12807
  %12819 = add nuw nsw i64 %12808, 1
  %12820 = call zeroext i8 @randombit()
  %12821 = getelementptr inbounds i8, i8* %1, i64 %12819
  store i8 %12820, i8* %12821, align 1
  %12822 = getelementptr inbounds i8, i8* %1, i64 %12819
  %12823 = load i8, i8* %12822, align 1
  %12824 = zext i8 %12823 to i32
  %12825 = icmp eq i32 %12824, 0
  br i1 %12825, label %12826, label %12829

12826:                                            ; preds = %12818
  %12827 = mul nuw nsw i64 %12819, 16
  %12828 = getelementptr inbounds i8, i8* %0, i64 %12827
  call void @llvm.memset.p0i8.i64(i8* align 1 %12828, i8 0, i64 16, i1 false)
  br label %12829

12829:                                            ; preds = %12826, %12818
  %12830 = add nuw nsw i64 %12819, 1
  %12831 = call zeroext i8 @randombit()
  %12832 = getelementptr inbounds i8, i8* %1, i64 %12830
  store i8 %12831, i8* %12832, align 1
  %12833 = getelementptr inbounds i8, i8* %1, i64 %12830
  %12834 = load i8, i8* %12833, align 1
  %12835 = zext i8 %12834 to i32
  %12836 = icmp eq i32 %12835, 0
  br i1 %12836, label %12837, label %12840

12837:                                            ; preds = %12829
  %12838 = mul nuw nsw i64 %12830, 16
  %12839 = getelementptr inbounds i8, i8* %0, i64 %12838
  call void @llvm.memset.p0i8.i64(i8* align 1 %12839, i8 0, i64 16, i1 false)
  br label %12840

12840:                                            ; preds = %12837, %12829
  %12841 = add nuw nsw i64 %12830, 1
  %12842 = call zeroext i8 @randombit()
  %12843 = getelementptr inbounds i8, i8* %1, i64 %12841
  store i8 %12842, i8* %12843, align 1
  %12844 = getelementptr inbounds i8, i8* %1, i64 %12841
  %12845 = load i8, i8* %12844, align 1
  %12846 = zext i8 %12845 to i32
  %12847 = icmp eq i32 %12846, 0
  br i1 %12847, label %12848, label %12851

12848:                                            ; preds = %12840
  %12849 = mul nuw nsw i64 %12841, 16
  %12850 = getelementptr inbounds i8, i8* %0, i64 %12849
  call void @llvm.memset.p0i8.i64(i8* align 1 %12850, i8 0, i64 16, i1 false)
  br label %12851

12851:                                            ; preds = %12848, %12840
  %12852 = add nuw nsw i64 %12841, 1
  %12853 = call zeroext i8 @randombit()
  %12854 = getelementptr inbounds i8, i8* %1, i64 %12852
  store i8 %12853, i8* %12854, align 1
  %12855 = getelementptr inbounds i8, i8* %1, i64 %12852
  %12856 = load i8, i8* %12855, align 1
  %12857 = zext i8 %12856 to i32
  %12858 = icmp eq i32 %12857, 0
  br i1 %12858, label %12859, label %12862

12859:                                            ; preds = %12851
  %12860 = mul nuw nsw i64 %12852, 16
  %12861 = getelementptr inbounds i8, i8* %0, i64 %12860
  call void @llvm.memset.p0i8.i64(i8* align 1 %12861, i8 0, i64 16, i1 false)
  br label %12862

12862:                                            ; preds = %12859, %12851
  %12863 = add nuw nsw i64 %12852, 1
  %12864 = call zeroext i8 @randombit()
  %12865 = getelementptr inbounds i8, i8* %1, i64 %12863
  store i8 %12864, i8* %12865, align 1
  %12866 = getelementptr inbounds i8, i8* %1, i64 %12863
  %12867 = load i8, i8* %12866, align 1
  %12868 = zext i8 %12867 to i32
  %12869 = icmp eq i32 %12868, 0
  br i1 %12869, label %12870, label %12873

12870:                                            ; preds = %12862
  %12871 = mul nuw nsw i64 %12863, 16
  %12872 = getelementptr inbounds i8, i8* %0, i64 %12871
  call void @llvm.memset.p0i8.i64(i8* align 1 %12872, i8 0, i64 16, i1 false)
  br label %12873

12873:                                            ; preds = %12870, %12862
  %12874 = add nuw nsw i64 %12863, 1
  %12875 = call zeroext i8 @randombit()
  %12876 = getelementptr inbounds i8, i8* %1, i64 %12874
  store i8 %12875, i8* %12876, align 1
  %12877 = getelementptr inbounds i8, i8* %1, i64 %12874
  %12878 = load i8, i8* %12877, align 1
  %12879 = zext i8 %12878 to i32
  %12880 = icmp eq i32 %12879, 0
  br i1 %12880, label %12881, label %12884

12881:                                            ; preds = %12873
  %12882 = mul nuw nsw i64 %12874, 16
  %12883 = getelementptr inbounds i8, i8* %0, i64 %12882
  call void @llvm.memset.p0i8.i64(i8* align 1 %12883, i8 0, i64 16, i1 false)
  br label %12884

12884:                                            ; preds = %12881, %12873
  %12885 = add nuw nsw i64 %12874, 1
  %12886 = call zeroext i8 @randombit()
  %12887 = getelementptr inbounds i8, i8* %1, i64 %12885
  store i8 %12886, i8* %12887, align 1
  %12888 = getelementptr inbounds i8, i8* %1, i64 %12885
  %12889 = load i8, i8* %12888, align 1
  %12890 = zext i8 %12889 to i32
  %12891 = icmp eq i32 %12890, 0
  br i1 %12891, label %12892, label %12895

12892:                                            ; preds = %12884
  %12893 = mul nuw nsw i64 %12885, 16
  %12894 = getelementptr inbounds i8, i8* %0, i64 %12893
  call void @llvm.memset.p0i8.i64(i8* align 1 %12894, i8 0, i64 16, i1 false)
  br label %12895

12895:                                            ; preds = %12892, %12884
  %12896 = add nuw nsw i64 %12885, 1
  %12897 = call zeroext i8 @randombit()
  %12898 = getelementptr inbounds i8, i8* %1, i64 %12896
  store i8 %12897, i8* %12898, align 1
  %12899 = getelementptr inbounds i8, i8* %1, i64 %12896
  %12900 = load i8, i8* %12899, align 1
  %12901 = zext i8 %12900 to i32
  %12902 = icmp eq i32 %12901, 0
  br i1 %12902, label %12903, label %12906

12903:                                            ; preds = %12895
  %12904 = mul nuw nsw i64 %12896, 16
  %12905 = getelementptr inbounds i8, i8* %0, i64 %12904
  call void @llvm.memset.p0i8.i64(i8* align 1 %12905, i8 0, i64 16, i1 false)
  br label %12906

12906:                                            ; preds = %12903, %12895
  %12907 = add nuw nsw i64 %12896, 1
  %12908 = call zeroext i8 @randombit()
  %12909 = getelementptr inbounds i8, i8* %1, i64 %12907
  store i8 %12908, i8* %12909, align 1
  %12910 = getelementptr inbounds i8, i8* %1, i64 %12907
  %12911 = load i8, i8* %12910, align 1
  %12912 = zext i8 %12911 to i32
  %12913 = icmp eq i32 %12912, 0
  br i1 %12913, label %12914, label %12917

12914:                                            ; preds = %12906
  %12915 = mul nuw nsw i64 %12907, 16
  %12916 = getelementptr inbounds i8, i8* %0, i64 %12915
  call void @llvm.memset.p0i8.i64(i8* align 1 %12916, i8 0, i64 16, i1 false)
  br label %12917

12917:                                            ; preds = %12914, %12906
  %12918 = add nuw nsw i64 %12907, 1
  %12919 = call zeroext i8 @randombit()
  %12920 = getelementptr inbounds i8, i8* %1, i64 %12918
  store i8 %12919, i8* %12920, align 1
  %12921 = getelementptr inbounds i8, i8* %1, i64 %12918
  %12922 = load i8, i8* %12921, align 1
  %12923 = zext i8 %12922 to i32
  %12924 = icmp eq i32 %12923, 0
  br i1 %12924, label %12925, label %12928

12925:                                            ; preds = %12917
  %12926 = mul nuw nsw i64 %12918, 16
  %12927 = getelementptr inbounds i8, i8* %0, i64 %12926
  call void @llvm.memset.p0i8.i64(i8* align 1 %12927, i8 0, i64 16, i1 false)
  br label %12928

12928:                                            ; preds = %12925, %12917
  %12929 = add nuw nsw i64 %12918, 1
  %12930 = call zeroext i8 @randombit()
  %12931 = getelementptr inbounds i8, i8* %1, i64 %12929
  store i8 %12930, i8* %12931, align 1
  %12932 = getelementptr inbounds i8, i8* %1, i64 %12929
  %12933 = load i8, i8* %12932, align 1
  %12934 = zext i8 %12933 to i32
  %12935 = icmp eq i32 %12934, 0
  br i1 %12935, label %12936, label %12939

12936:                                            ; preds = %12928
  %12937 = mul nuw nsw i64 %12929, 16
  %12938 = getelementptr inbounds i8, i8* %0, i64 %12937
  call void @llvm.memset.p0i8.i64(i8* align 1 %12938, i8 0, i64 16, i1 false)
  br label %12939

12939:                                            ; preds = %12936, %12928
  %12940 = add nuw nsw i64 %12929, 1
  %12941 = call zeroext i8 @randombit()
  %12942 = getelementptr inbounds i8, i8* %1, i64 %12940
  store i8 %12941, i8* %12942, align 1
  %12943 = getelementptr inbounds i8, i8* %1, i64 %12940
  %12944 = load i8, i8* %12943, align 1
  %12945 = zext i8 %12944 to i32
  %12946 = icmp eq i32 %12945, 0
  br i1 %12946, label %12947, label %12950

12947:                                            ; preds = %12939
  %12948 = mul nuw nsw i64 %12940, 16
  %12949 = getelementptr inbounds i8, i8* %0, i64 %12948
  call void @llvm.memset.p0i8.i64(i8* align 1 %12949, i8 0, i64 16, i1 false)
  br label %12950

12950:                                            ; preds = %12947, %12939
  %12951 = add nuw nsw i64 %12940, 1
  %12952 = call zeroext i8 @randombit()
  %12953 = getelementptr inbounds i8, i8* %1, i64 %12951
  store i8 %12952, i8* %12953, align 1
  %12954 = getelementptr inbounds i8, i8* %1, i64 %12951
  %12955 = load i8, i8* %12954, align 1
  %12956 = zext i8 %12955 to i32
  %12957 = icmp eq i32 %12956, 0
  br i1 %12957, label %12958, label %12961

12958:                                            ; preds = %12950
  %12959 = mul nuw nsw i64 %12951, 16
  %12960 = getelementptr inbounds i8, i8* %0, i64 %12959
  call void @llvm.memset.p0i8.i64(i8* align 1 %12960, i8 0, i64 16, i1 false)
  br label %12961

12961:                                            ; preds = %12958, %12950
  %12962 = add nuw nsw i64 %12951, 1
  %12963 = call zeroext i8 @randombit()
  %12964 = getelementptr inbounds i8, i8* %1, i64 %12962
  store i8 %12963, i8* %12964, align 1
  %12965 = getelementptr inbounds i8, i8* %1, i64 %12962
  %12966 = load i8, i8* %12965, align 1
  %12967 = zext i8 %12966 to i32
  %12968 = icmp eq i32 %12967, 0
  br i1 %12968, label %12969, label %12972

12969:                                            ; preds = %12961
  %12970 = mul nuw nsw i64 %12962, 16
  %12971 = getelementptr inbounds i8, i8* %0, i64 %12970
  call void @llvm.memset.p0i8.i64(i8* align 1 %12971, i8 0, i64 16, i1 false)
  br label %12972

12972:                                            ; preds = %12969, %12961
  %12973 = add nuw nsw i64 %12962, 1
  %12974 = call zeroext i8 @randombit()
  %12975 = getelementptr inbounds i8, i8* %1, i64 %12973
  store i8 %12974, i8* %12975, align 1
  %12976 = getelementptr inbounds i8, i8* %1, i64 %12973
  %12977 = load i8, i8* %12976, align 1
  %12978 = zext i8 %12977 to i32
  %12979 = icmp eq i32 %12978, 0
  br i1 %12979, label %12980, label %12983

12980:                                            ; preds = %12972
  %12981 = mul nuw nsw i64 %12973, 16
  %12982 = getelementptr inbounds i8, i8* %0, i64 %12981
  call void @llvm.memset.p0i8.i64(i8* align 1 %12982, i8 0, i64 16, i1 false)
  br label %12983

12983:                                            ; preds = %12980, %12972
  %12984 = add nuw nsw i64 %12973, 1
  %12985 = call zeroext i8 @randombit()
  %12986 = getelementptr inbounds i8, i8* %1, i64 %12984
  store i8 %12985, i8* %12986, align 1
  %12987 = getelementptr inbounds i8, i8* %1, i64 %12984
  %12988 = load i8, i8* %12987, align 1
  %12989 = zext i8 %12988 to i32
  %12990 = icmp eq i32 %12989, 0
  br i1 %12990, label %12991, label %12994

12991:                                            ; preds = %12983
  %12992 = mul nuw nsw i64 %12984, 16
  %12993 = getelementptr inbounds i8, i8* %0, i64 %12992
  call void @llvm.memset.p0i8.i64(i8* align 1 %12993, i8 0, i64 16, i1 false)
  br label %12994

12994:                                            ; preds = %12991, %12983
  %12995 = add nuw nsw i64 %12984, 1
  %12996 = call zeroext i8 @randombit()
  %12997 = getelementptr inbounds i8, i8* %1, i64 %12995
  store i8 %12996, i8* %12997, align 1
  %12998 = getelementptr inbounds i8, i8* %1, i64 %12995
  %12999 = load i8, i8* %12998, align 1
  %13000 = zext i8 %12999 to i32
  %13001 = icmp eq i32 %13000, 0
  br i1 %13001, label %13002, label %13005

13002:                                            ; preds = %12994
  %13003 = mul nuw nsw i64 %12995, 16
  %13004 = getelementptr inbounds i8, i8* %0, i64 %13003
  call void @llvm.memset.p0i8.i64(i8* align 1 %13004, i8 0, i64 16, i1 false)
  br label %13005

13005:                                            ; preds = %13002, %12994
  %13006 = add nuw nsw i64 %12995, 1
  %13007 = call zeroext i8 @randombit()
  %13008 = getelementptr inbounds i8, i8* %1, i64 %13006
  store i8 %13007, i8* %13008, align 1
  %13009 = getelementptr inbounds i8, i8* %1, i64 %13006
  %13010 = load i8, i8* %13009, align 1
  %13011 = zext i8 %13010 to i32
  %13012 = icmp eq i32 %13011, 0
  br i1 %13012, label %13013, label %13016

13013:                                            ; preds = %13005
  %13014 = mul nuw nsw i64 %13006, 16
  %13015 = getelementptr inbounds i8, i8* %0, i64 %13014
  call void @llvm.memset.p0i8.i64(i8* align 1 %13015, i8 0, i64 16, i1 false)
  br label %13016

13016:                                            ; preds = %13013, %13005
  %13017 = add nuw nsw i64 %13006, 1
  %13018 = call zeroext i8 @randombit()
  %13019 = getelementptr inbounds i8, i8* %1, i64 %13017
  store i8 %13018, i8* %13019, align 1
  %13020 = getelementptr inbounds i8, i8* %1, i64 %13017
  %13021 = load i8, i8* %13020, align 1
  %13022 = zext i8 %13021 to i32
  %13023 = icmp eq i32 %13022, 0
  br i1 %13023, label %13024, label %13027

13024:                                            ; preds = %13016
  %13025 = mul nuw nsw i64 %13017, 16
  %13026 = getelementptr inbounds i8, i8* %0, i64 %13025
  call void @llvm.memset.p0i8.i64(i8* align 1 %13026, i8 0, i64 16, i1 false)
  br label %13027

13027:                                            ; preds = %13024, %13016
  %13028 = add nuw nsw i64 %13017, 1
  %13029 = call zeroext i8 @randombit()
  %13030 = getelementptr inbounds i8, i8* %1, i64 %13028
  store i8 %13029, i8* %13030, align 1
  %13031 = getelementptr inbounds i8, i8* %1, i64 %13028
  %13032 = load i8, i8* %13031, align 1
  %13033 = zext i8 %13032 to i32
  %13034 = icmp eq i32 %13033, 0
  br i1 %13034, label %13035, label %13038

13035:                                            ; preds = %13027
  %13036 = mul nuw nsw i64 %13028, 16
  %13037 = getelementptr inbounds i8, i8* %0, i64 %13036
  call void @llvm.memset.p0i8.i64(i8* align 1 %13037, i8 0, i64 16, i1 false)
  br label %13038

13038:                                            ; preds = %13035, %13027
  %13039 = add nuw nsw i64 %13028, 1
  %13040 = call zeroext i8 @randombit()
  %13041 = getelementptr inbounds i8, i8* %1, i64 %13039
  store i8 %13040, i8* %13041, align 1
  %13042 = getelementptr inbounds i8, i8* %1, i64 %13039
  %13043 = load i8, i8* %13042, align 1
  %13044 = zext i8 %13043 to i32
  %13045 = icmp eq i32 %13044, 0
  br i1 %13045, label %13046, label %13049

13046:                                            ; preds = %13038
  %13047 = mul nuw nsw i64 %13039, 16
  %13048 = getelementptr inbounds i8, i8* %0, i64 %13047
  call void @llvm.memset.p0i8.i64(i8* align 1 %13048, i8 0, i64 16, i1 false)
  br label %13049

13049:                                            ; preds = %13046, %13038
  %13050 = add nuw nsw i64 %13039, 1
  %13051 = call zeroext i8 @randombit()
  %13052 = getelementptr inbounds i8, i8* %1, i64 %13050
  store i8 %13051, i8* %13052, align 1
  %13053 = getelementptr inbounds i8, i8* %1, i64 %13050
  %13054 = load i8, i8* %13053, align 1
  %13055 = zext i8 %13054 to i32
  %13056 = icmp eq i32 %13055, 0
  br i1 %13056, label %13057, label %13060

13057:                                            ; preds = %13049
  %13058 = mul nuw nsw i64 %13050, 16
  %13059 = getelementptr inbounds i8, i8* %0, i64 %13058
  call void @llvm.memset.p0i8.i64(i8* align 1 %13059, i8 0, i64 16, i1 false)
  br label %13060

13060:                                            ; preds = %13057, %13049
  %13061 = add nuw nsw i64 %13050, 1
  %13062 = call zeroext i8 @randombit()
  %13063 = getelementptr inbounds i8, i8* %1, i64 %13061
  store i8 %13062, i8* %13063, align 1
  %13064 = getelementptr inbounds i8, i8* %1, i64 %13061
  %13065 = load i8, i8* %13064, align 1
  %13066 = zext i8 %13065 to i32
  %13067 = icmp eq i32 %13066, 0
  br i1 %13067, label %13068, label %13071

13068:                                            ; preds = %13060
  %13069 = mul nuw nsw i64 %13061, 16
  %13070 = getelementptr inbounds i8, i8* %0, i64 %13069
  call void @llvm.memset.p0i8.i64(i8* align 1 %13070, i8 0, i64 16, i1 false)
  br label %13071

13071:                                            ; preds = %13068, %13060
  %13072 = add nuw nsw i64 %13061, 1
  %13073 = call zeroext i8 @randombit()
  %13074 = getelementptr inbounds i8, i8* %1, i64 %13072
  store i8 %13073, i8* %13074, align 1
  %13075 = getelementptr inbounds i8, i8* %1, i64 %13072
  %13076 = load i8, i8* %13075, align 1
  %13077 = zext i8 %13076 to i32
  %13078 = icmp eq i32 %13077, 0
  br i1 %13078, label %13079, label %13082

13079:                                            ; preds = %13071
  %13080 = mul nuw nsw i64 %13072, 16
  %13081 = getelementptr inbounds i8, i8* %0, i64 %13080
  call void @llvm.memset.p0i8.i64(i8* align 1 %13081, i8 0, i64 16, i1 false)
  br label %13082

13082:                                            ; preds = %13079, %13071
  %13083 = add nuw nsw i64 %13072, 1
  %13084 = call zeroext i8 @randombit()
  %13085 = getelementptr inbounds i8, i8* %1, i64 %13083
  store i8 %13084, i8* %13085, align 1
  %13086 = getelementptr inbounds i8, i8* %1, i64 %13083
  %13087 = load i8, i8* %13086, align 1
  %13088 = zext i8 %13087 to i32
  %13089 = icmp eq i32 %13088, 0
  br i1 %13089, label %13090, label %13093

13090:                                            ; preds = %13082
  %13091 = mul nuw nsw i64 %13083, 16
  %13092 = getelementptr inbounds i8, i8* %0, i64 %13091
  call void @llvm.memset.p0i8.i64(i8* align 1 %13092, i8 0, i64 16, i1 false)
  br label %13093

13093:                                            ; preds = %13090, %13082
  %13094 = add nuw nsw i64 %13083, 1
  %13095 = call zeroext i8 @randombit()
  %13096 = getelementptr inbounds i8, i8* %1, i64 %13094
  store i8 %13095, i8* %13096, align 1
  %13097 = getelementptr inbounds i8, i8* %1, i64 %13094
  %13098 = load i8, i8* %13097, align 1
  %13099 = zext i8 %13098 to i32
  %13100 = icmp eq i32 %13099, 0
  br i1 %13100, label %13101, label %13104

13101:                                            ; preds = %13093
  %13102 = mul nuw nsw i64 %13094, 16
  %13103 = getelementptr inbounds i8, i8* %0, i64 %13102
  call void @llvm.memset.p0i8.i64(i8* align 1 %13103, i8 0, i64 16, i1 false)
  br label %13104

13104:                                            ; preds = %13101, %13093
  %13105 = add nuw nsw i64 %13094, 1
  %13106 = call zeroext i8 @randombit()
  %13107 = getelementptr inbounds i8, i8* %1, i64 %13105
  store i8 %13106, i8* %13107, align 1
  %13108 = getelementptr inbounds i8, i8* %1, i64 %13105
  %13109 = load i8, i8* %13108, align 1
  %13110 = zext i8 %13109 to i32
  %13111 = icmp eq i32 %13110, 0
  br i1 %13111, label %13112, label %13115

13112:                                            ; preds = %13104
  %13113 = mul nuw nsw i64 %13105, 16
  %13114 = getelementptr inbounds i8, i8* %0, i64 %13113
  call void @llvm.memset.p0i8.i64(i8* align 1 %13114, i8 0, i64 16, i1 false)
  br label %13115

13115:                                            ; preds = %13112, %13104
  %13116 = add nuw nsw i64 %13105, 1
  %13117 = call zeroext i8 @randombit()
  %13118 = getelementptr inbounds i8, i8* %1, i64 %13116
  store i8 %13117, i8* %13118, align 1
  %13119 = getelementptr inbounds i8, i8* %1, i64 %13116
  %13120 = load i8, i8* %13119, align 1
  %13121 = zext i8 %13120 to i32
  %13122 = icmp eq i32 %13121, 0
  br i1 %13122, label %13123, label %13126

13123:                                            ; preds = %13115
  %13124 = mul nuw nsw i64 %13116, 16
  %13125 = getelementptr inbounds i8, i8* %0, i64 %13124
  call void @llvm.memset.p0i8.i64(i8* align 1 %13125, i8 0, i64 16, i1 false)
  br label %13126

13126:                                            ; preds = %13123, %13115
  %13127 = add nuw nsw i64 %13116, 1
  %13128 = call zeroext i8 @randombit()
  %13129 = getelementptr inbounds i8, i8* %1, i64 %13127
  store i8 %13128, i8* %13129, align 1
  %13130 = getelementptr inbounds i8, i8* %1, i64 %13127
  %13131 = load i8, i8* %13130, align 1
  %13132 = zext i8 %13131 to i32
  %13133 = icmp eq i32 %13132, 0
  br i1 %13133, label %13134, label %13137

13134:                                            ; preds = %13126
  %13135 = mul nuw nsw i64 %13127, 16
  %13136 = getelementptr inbounds i8, i8* %0, i64 %13135
  call void @llvm.memset.p0i8.i64(i8* align 1 %13136, i8 0, i64 16, i1 false)
  br label %13137

13137:                                            ; preds = %13134, %13126
  %13138 = add nuw nsw i64 %13127, 1
  %13139 = call zeroext i8 @randombit()
  %13140 = getelementptr inbounds i8, i8* %1, i64 %13138
  store i8 %13139, i8* %13140, align 1
  %13141 = getelementptr inbounds i8, i8* %1, i64 %13138
  %13142 = load i8, i8* %13141, align 1
  %13143 = zext i8 %13142 to i32
  %13144 = icmp eq i32 %13143, 0
  br i1 %13144, label %13145, label %13148

13145:                                            ; preds = %13137
  %13146 = mul nuw nsw i64 %13138, 16
  %13147 = getelementptr inbounds i8, i8* %0, i64 %13146
  call void @llvm.memset.p0i8.i64(i8* align 1 %13147, i8 0, i64 16, i1 false)
  br label %13148

13148:                                            ; preds = %13145, %13137
  %13149 = add nuw nsw i64 %13138, 1
  %13150 = call zeroext i8 @randombit()
  %13151 = getelementptr inbounds i8, i8* %1, i64 %13149
  store i8 %13150, i8* %13151, align 1
  %13152 = getelementptr inbounds i8, i8* %1, i64 %13149
  %13153 = load i8, i8* %13152, align 1
  %13154 = zext i8 %13153 to i32
  %13155 = icmp eq i32 %13154, 0
  br i1 %13155, label %13156, label %13159

13156:                                            ; preds = %13148
  %13157 = mul nuw nsw i64 %13149, 16
  %13158 = getelementptr inbounds i8, i8* %0, i64 %13157
  call void @llvm.memset.p0i8.i64(i8* align 1 %13158, i8 0, i64 16, i1 false)
  br label %13159

13159:                                            ; preds = %13156, %13148
  %13160 = add nuw nsw i64 %13149, 1
  %13161 = call zeroext i8 @randombit()
  %13162 = getelementptr inbounds i8, i8* %1, i64 %13160
  store i8 %13161, i8* %13162, align 1
  %13163 = getelementptr inbounds i8, i8* %1, i64 %13160
  %13164 = load i8, i8* %13163, align 1
  %13165 = zext i8 %13164 to i32
  %13166 = icmp eq i32 %13165, 0
  br i1 %13166, label %13167, label %13170

13167:                                            ; preds = %13159
  %13168 = mul nuw nsw i64 %13160, 16
  %13169 = getelementptr inbounds i8, i8* %0, i64 %13168
  call void @llvm.memset.p0i8.i64(i8* align 1 %13169, i8 0, i64 16, i1 false)
  br label %13170

13170:                                            ; preds = %13167, %13159
  %13171 = add nuw nsw i64 %13160, 1
  %13172 = call zeroext i8 @randombit()
  %13173 = getelementptr inbounds i8, i8* %1, i64 %13171
  store i8 %13172, i8* %13173, align 1
  %13174 = getelementptr inbounds i8, i8* %1, i64 %13171
  %13175 = load i8, i8* %13174, align 1
  %13176 = zext i8 %13175 to i32
  %13177 = icmp eq i32 %13176, 0
  br i1 %13177, label %13178, label %13181

13178:                                            ; preds = %13170
  %13179 = mul nuw nsw i64 %13171, 16
  %13180 = getelementptr inbounds i8, i8* %0, i64 %13179
  call void @llvm.memset.p0i8.i64(i8* align 1 %13180, i8 0, i64 16, i1 false)
  br label %13181

13181:                                            ; preds = %13178, %13170
  %13182 = add nuw nsw i64 %13171, 1
  %13183 = call zeroext i8 @randombit()
  %13184 = getelementptr inbounds i8, i8* %1, i64 %13182
  store i8 %13183, i8* %13184, align 1
  %13185 = getelementptr inbounds i8, i8* %1, i64 %13182
  %13186 = load i8, i8* %13185, align 1
  %13187 = zext i8 %13186 to i32
  %13188 = icmp eq i32 %13187, 0
  br i1 %13188, label %13189, label %13192

13189:                                            ; preds = %13181
  %13190 = mul nuw nsw i64 %13182, 16
  %13191 = getelementptr inbounds i8, i8* %0, i64 %13190
  call void @llvm.memset.p0i8.i64(i8* align 1 %13191, i8 0, i64 16, i1 false)
  br label %13192

13192:                                            ; preds = %13189, %13181
  %13193 = add nuw nsw i64 %13182, 1
  %13194 = call zeroext i8 @randombit()
  %13195 = getelementptr inbounds i8, i8* %1, i64 %13193
  store i8 %13194, i8* %13195, align 1
  %13196 = getelementptr inbounds i8, i8* %1, i64 %13193
  %13197 = load i8, i8* %13196, align 1
  %13198 = zext i8 %13197 to i32
  %13199 = icmp eq i32 %13198, 0
  br i1 %13199, label %13200, label %13203

13200:                                            ; preds = %13192
  %13201 = mul nuw nsw i64 %13193, 16
  %13202 = getelementptr inbounds i8, i8* %0, i64 %13201
  call void @llvm.memset.p0i8.i64(i8* align 1 %13202, i8 0, i64 16, i1 false)
  br label %13203

13203:                                            ; preds = %13200, %13192
  %13204 = add nuw nsw i64 %13193, 1
  %13205 = call zeroext i8 @randombit()
  %13206 = getelementptr inbounds i8, i8* %1, i64 %13204
  store i8 %13205, i8* %13206, align 1
  %13207 = getelementptr inbounds i8, i8* %1, i64 %13204
  %13208 = load i8, i8* %13207, align 1
  %13209 = zext i8 %13208 to i32
  %13210 = icmp eq i32 %13209, 0
  br i1 %13210, label %13211, label %13214

13211:                                            ; preds = %13203
  %13212 = mul nuw nsw i64 %13204, 16
  %13213 = getelementptr inbounds i8, i8* %0, i64 %13212
  call void @llvm.memset.p0i8.i64(i8* align 1 %13213, i8 0, i64 16, i1 false)
  br label %13214

13214:                                            ; preds = %13211, %13203
  %13215 = add nuw nsw i64 %13204, 1
  %13216 = call zeroext i8 @randombit()
  %13217 = getelementptr inbounds i8, i8* %1, i64 %13215
  store i8 %13216, i8* %13217, align 1
  %13218 = getelementptr inbounds i8, i8* %1, i64 %13215
  %13219 = load i8, i8* %13218, align 1
  %13220 = zext i8 %13219 to i32
  %13221 = icmp eq i32 %13220, 0
  br i1 %13221, label %13222, label %13225

13222:                                            ; preds = %13214
  %13223 = mul nuw nsw i64 %13215, 16
  %13224 = getelementptr inbounds i8, i8* %0, i64 %13223
  call void @llvm.memset.p0i8.i64(i8* align 1 %13224, i8 0, i64 16, i1 false)
  br label %13225

13225:                                            ; preds = %13222, %13214
  %13226 = add nuw nsw i64 %13215, 1
  %13227 = call zeroext i8 @randombit()
  %13228 = getelementptr inbounds i8, i8* %1, i64 %13226
  store i8 %13227, i8* %13228, align 1
  %13229 = getelementptr inbounds i8, i8* %1, i64 %13226
  %13230 = load i8, i8* %13229, align 1
  %13231 = zext i8 %13230 to i32
  %13232 = icmp eq i32 %13231, 0
  br i1 %13232, label %13233, label %13236

13233:                                            ; preds = %13225
  %13234 = mul nuw nsw i64 %13226, 16
  %13235 = getelementptr inbounds i8, i8* %0, i64 %13234
  call void @llvm.memset.p0i8.i64(i8* align 1 %13235, i8 0, i64 16, i1 false)
  br label %13236

13236:                                            ; preds = %13233, %13225
  %13237 = add nuw nsw i64 %13226, 1
  %13238 = call zeroext i8 @randombit()
  %13239 = getelementptr inbounds i8, i8* %1, i64 %13237
  store i8 %13238, i8* %13239, align 1
  %13240 = getelementptr inbounds i8, i8* %1, i64 %13237
  %13241 = load i8, i8* %13240, align 1
  %13242 = zext i8 %13241 to i32
  %13243 = icmp eq i32 %13242, 0
  br i1 %13243, label %13244, label %13247

13244:                                            ; preds = %13236
  %13245 = mul nuw nsw i64 %13237, 16
  %13246 = getelementptr inbounds i8, i8* %0, i64 %13245
  call void @llvm.memset.p0i8.i64(i8* align 1 %13246, i8 0, i64 16, i1 false)
  br label %13247

13247:                                            ; preds = %13244, %13236
  %13248 = add nuw nsw i64 %13237, 1
  %13249 = call zeroext i8 @randombit()
  %13250 = getelementptr inbounds i8, i8* %1, i64 %13248
  store i8 %13249, i8* %13250, align 1
  %13251 = getelementptr inbounds i8, i8* %1, i64 %13248
  %13252 = load i8, i8* %13251, align 1
  %13253 = zext i8 %13252 to i32
  %13254 = icmp eq i32 %13253, 0
  br i1 %13254, label %13255, label %13258

13255:                                            ; preds = %13247
  %13256 = mul nuw nsw i64 %13248, 16
  %13257 = getelementptr inbounds i8, i8* %0, i64 %13256
  call void @llvm.memset.p0i8.i64(i8* align 1 %13257, i8 0, i64 16, i1 false)
  br label %13258

13258:                                            ; preds = %13255, %13247
  %13259 = add nuw nsw i64 %13248, 1
  %13260 = call zeroext i8 @randombit()
  %13261 = getelementptr inbounds i8, i8* %1, i64 %13259
  store i8 %13260, i8* %13261, align 1
  %13262 = getelementptr inbounds i8, i8* %1, i64 %13259
  %13263 = load i8, i8* %13262, align 1
  %13264 = zext i8 %13263 to i32
  %13265 = icmp eq i32 %13264, 0
  br i1 %13265, label %13266, label %13269

13266:                                            ; preds = %13258
  %13267 = mul nuw nsw i64 %13259, 16
  %13268 = getelementptr inbounds i8, i8* %0, i64 %13267
  call void @llvm.memset.p0i8.i64(i8* align 1 %13268, i8 0, i64 16, i1 false)
  br label %13269

13269:                                            ; preds = %13266, %13258
  %13270 = add nuw nsw i64 %13259, 1
  %13271 = call zeroext i8 @randombit()
  %13272 = getelementptr inbounds i8, i8* %1, i64 %13270
  store i8 %13271, i8* %13272, align 1
  %13273 = getelementptr inbounds i8, i8* %1, i64 %13270
  %13274 = load i8, i8* %13273, align 1
  %13275 = zext i8 %13274 to i32
  %13276 = icmp eq i32 %13275, 0
  br i1 %13276, label %13277, label %13280

13277:                                            ; preds = %13269
  %13278 = mul nuw nsw i64 %13270, 16
  %13279 = getelementptr inbounds i8, i8* %0, i64 %13278
  call void @llvm.memset.p0i8.i64(i8* align 1 %13279, i8 0, i64 16, i1 false)
  br label %13280

13280:                                            ; preds = %13277, %13269
  %13281 = add nuw nsw i64 %13270, 1
  %13282 = call zeroext i8 @randombit()
  %13283 = getelementptr inbounds i8, i8* %1, i64 %13281
  store i8 %13282, i8* %13283, align 1
  %13284 = getelementptr inbounds i8, i8* %1, i64 %13281
  %13285 = load i8, i8* %13284, align 1
  %13286 = zext i8 %13285 to i32
  %13287 = icmp eq i32 %13286, 0
  br i1 %13287, label %13288, label %13291

13288:                                            ; preds = %13280
  %13289 = mul nuw nsw i64 %13281, 16
  %13290 = getelementptr inbounds i8, i8* %0, i64 %13289
  call void @llvm.memset.p0i8.i64(i8* align 1 %13290, i8 0, i64 16, i1 false)
  br label %13291

13291:                                            ; preds = %13288, %13280
  %13292 = add nuw nsw i64 %13281, 1
  %13293 = call zeroext i8 @randombit()
  %13294 = getelementptr inbounds i8, i8* %1, i64 %13292
  store i8 %13293, i8* %13294, align 1
  %13295 = getelementptr inbounds i8, i8* %1, i64 %13292
  %13296 = load i8, i8* %13295, align 1
  %13297 = zext i8 %13296 to i32
  %13298 = icmp eq i32 %13297, 0
  br i1 %13298, label %13299, label %13302

13299:                                            ; preds = %13291
  %13300 = mul nuw nsw i64 %13292, 16
  %13301 = getelementptr inbounds i8, i8* %0, i64 %13300
  call void @llvm.memset.p0i8.i64(i8* align 1 %13301, i8 0, i64 16, i1 false)
  br label %13302

13302:                                            ; preds = %13299, %13291
  %13303 = add nuw nsw i64 %13292, 1
  %13304 = call zeroext i8 @randombit()
  %13305 = getelementptr inbounds i8, i8* %1, i64 %13303
  store i8 %13304, i8* %13305, align 1
  %13306 = getelementptr inbounds i8, i8* %1, i64 %13303
  %13307 = load i8, i8* %13306, align 1
  %13308 = zext i8 %13307 to i32
  %13309 = icmp eq i32 %13308, 0
  br i1 %13309, label %13310, label %13313

13310:                                            ; preds = %13302
  %13311 = mul nuw nsw i64 %13303, 16
  %13312 = getelementptr inbounds i8, i8* %0, i64 %13311
  call void @llvm.memset.p0i8.i64(i8* align 1 %13312, i8 0, i64 16, i1 false)
  br label %13313

13313:                                            ; preds = %13310, %13302
  %13314 = add nuw nsw i64 %13303, 1
  %13315 = call zeroext i8 @randombit()
  %13316 = getelementptr inbounds i8, i8* %1, i64 %13314
  store i8 %13315, i8* %13316, align 1
  %13317 = getelementptr inbounds i8, i8* %1, i64 %13314
  %13318 = load i8, i8* %13317, align 1
  %13319 = zext i8 %13318 to i32
  %13320 = icmp eq i32 %13319, 0
  br i1 %13320, label %13321, label %13324

13321:                                            ; preds = %13313
  %13322 = mul nuw nsw i64 %13314, 16
  %13323 = getelementptr inbounds i8, i8* %0, i64 %13322
  call void @llvm.memset.p0i8.i64(i8* align 1 %13323, i8 0, i64 16, i1 false)
  br label %13324

13324:                                            ; preds = %13321, %13313
  %13325 = add nuw nsw i64 %13314, 1
  %13326 = call zeroext i8 @randombit()
  %13327 = getelementptr inbounds i8, i8* %1, i64 %13325
  store i8 %13326, i8* %13327, align 1
  %13328 = getelementptr inbounds i8, i8* %1, i64 %13325
  %13329 = load i8, i8* %13328, align 1
  %13330 = zext i8 %13329 to i32
  %13331 = icmp eq i32 %13330, 0
  br i1 %13331, label %13332, label %13335

13332:                                            ; preds = %13324
  %13333 = mul nuw nsw i64 %13325, 16
  %13334 = getelementptr inbounds i8, i8* %0, i64 %13333
  call void @llvm.memset.p0i8.i64(i8* align 1 %13334, i8 0, i64 16, i1 false)
  br label %13335

13335:                                            ; preds = %13332, %13324
  %13336 = add nuw nsw i64 %13325, 1
  %13337 = call zeroext i8 @randombit()
  %13338 = getelementptr inbounds i8, i8* %1, i64 %13336
  store i8 %13337, i8* %13338, align 1
  %13339 = getelementptr inbounds i8, i8* %1, i64 %13336
  %13340 = load i8, i8* %13339, align 1
  %13341 = zext i8 %13340 to i32
  %13342 = icmp eq i32 %13341, 0
  br i1 %13342, label %13343, label %13346

13343:                                            ; preds = %13335
  %13344 = mul nuw nsw i64 %13336, 16
  %13345 = getelementptr inbounds i8, i8* %0, i64 %13344
  call void @llvm.memset.p0i8.i64(i8* align 1 %13345, i8 0, i64 16, i1 false)
  br label %13346

13346:                                            ; preds = %13343, %13335
  %13347 = add nuw nsw i64 %13336, 1
  %13348 = call zeroext i8 @randombit()
  %13349 = getelementptr inbounds i8, i8* %1, i64 %13347
  store i8 %13348, i8* %13349, align 1
  %13350 = getelementptr inbounds i8, i8* %1, i64 %13347
  %13351 = load i8, i8* %13350, align 1
  %13352 = zext i8 %13351 to i32
  %13353 = icmp eq i32 %13352, 0
  br i1 %13353, label %13354, label %13357

13354:                                            ; preds = %13346
  %13355 = mul nuw nsw i64 %13347, 16
  %13356 = getelementptr inbounds i8, i8* %0, i64 %13355
  call void @llvm.memset.p0i8.i64(i8* align 1 %13356, i8 0, i64 16, i1 false)
  br label %13357

13357:                                            ; preds = %13354, %13346
  %13358 = add nuw nsw i64 %13347, 1
  %13359 = call zeroext i8 @randombit()
  %13360 = getelementptr inbounds i8, i8* %1, i64 %13358
  store i8 %13359, i8* %13360, align 1
  %13361 = getelementptr inbounds i8, i8* %1, i64 %13358
  %13362 = load i8, i8* %13361, align 1
  %13363 = zext i8 %13362 to i32
  %13364 = icmp eq i32 %13363, 0
  br i1 %13364, label %13365, label %13368

13365:                                            ; preds = %13357
  %13366 = mul nuw nsw i64 %13358, 16
  %13367 = getelementptr inbounds i8, i8* %0, i64 %13366
  call void @llvm.memset.p0i8.i64(i8* align 1 %13367, i8 0, i64 16, i1 false)
  br label %13368

13368:                                            ; preds = %13365, %13357
  %13369 = add nuw nsw i64 %13358, 1
  %13370 = call zeroext i8 @randombit()
  %13371 = getelementptr inbounds i8, i8* %1, i64 %13369
  store i8 %13370, i8* %13371, align 1
  %13372 = getelementptr inbounds i8, i8* %1, i64 %13369
  %13373 = load i8, i8* %13372, align 1
  %13374 = zext i8 %13373 to i32
  %13375 = icmp eq i32 %13374, 0
  br i1 %13375, label %13376, label %13379

13376:                                            ; preds = %13368
  %13377 = mul nuw nsw i64 %13369, 16
  %13378 = getelementptr inbounds i8, i8* %0, i64 %13377
  call void @llvm.memset.p0i8.i64(i8* align 1 %13378, i8 0, i64 16, i1 false)
  br label %13379

13379:                                            ; preds = %13376, %13368
  %13380 = add nuw nsw i64 %13369, 1
  %13381 = call zeroext i8 @randombit()
  %13382 = getelementptr inbounds i8, i8* %1, i64 %13380
  store i8 %13381, i8* %13382, align 1
  %13383 = getelementptr inbounds i8, i8* %1, i64 %13380
  %13384 = load i8, i8* %13383, align 1
  %13385 = zext i8 %13384 to i32
  %13386 = icmp eq i32 %13385, 0
  br i1 %13386, label %13387, label %13390

13387:                                            ; preds = %13379
  %13388 = mul nuw nsw i64 %13380, 16
  %13389 = getelementptr inbounds i8, i8* %0, i64 %13388
  call void @llvm.memset.p0i8.i64(i8* align 1 %13389, i8 0, i64 16, i1 false)
  br label %13390

13390:                                            ; preds = %13387, %13379
  %13391 = add nuw nsw i64 %13380, 1
  %13392 = call zeroext i8 @randombit()
  %13393 = getelementptr inbounds i8, i8* %1, i64 %13391
  store i8 %13392, i8* %13393, align 1
  %13394 = getelementptr inbounds i8, i8* %1, i64 %13391
  %13395 = load i8, i8* %13394, align 1
  %13396 = zext i8 %13395 to i32
  %13397 = icmp eq i32 %13396, 0
  br i1 %13397, label %13398, label %13401

13398:                                            ; preds = %13390
  %13399 = mul nuw nsw i64 %13391, 16
  %13400 = getelementptr inbounds i8, i8* %0, i64 %13399
  call void @llvm.memset.p0i8.i64(i8* align 1 %13400, i8 0, i64 16, i1 false)
  br label %13401

13401:                                            ; preds = %13398, %13390
  %13402 = add nuw nsw i64 %13391, 1
  %13403 = call zeroext i8 @randombit()
  %13404 = getelementptr inbounds i8, i8* %1, i64 %13402
  store i8 %13403, i8* %13404, align 1
  %13405 = getelementptr inbounds i8, i8* %1, i64 %13402
  %13406 = load i8, i8* %13405, align 1
  %13407 = zext i8 %13406 to i32
  %13408 = icmp eq i32 %13407, 0
  br i1 %13408, label %13409, label %13412

13409:                                            ; preds = %13401
  %13410 = mul nuw nsw i64 %13402, 16
  %13411 = getelementptr inbounds i8, i8* %0, i64 %13410
  call void @llvm.memset.p0i8.i64(i8* align 1 %13411, i8 0, i64 16, i1 false)
  br label %13412

13412:                                            ; preds = %13409, %13401
  %13413 = add nuw nsw i64 %13402, 1
  %13414 = call zeroext i8 @randombit()
  %13415 = getelementptr inbounds i8, i8* %1, i64 %13413
  store i8 %13414, i8* %13415, align 1
  %13416 = getelementptr inbounds i8, i8* %1, i64 %13413
  %13417 = load i8, i8* %13416, align 1
  %13418 = zext i8 %13417 to i32
  %13419 = icmp eq i32 %13418, 0
  br i1 %13419, label %13420, label %13423

13420:                                            ; preds = %13412
  %13421 = mul nuw nsw i64 %13413, 16
  %13422 = getelementptr inbounds i8, i8* %0, i64 %13421
  call void @llvm.memset.p0i8.i64(i8* align 1 %13422, i8 0, i64 16, i1 false)
  br label %13423

13423:                                            ; preds = %13420, %13412
  %13424 = add nuw nsw i64 %13413, 1
  %13425 = call zeroext i8 @randombit()
  %13426 = getelementptr inbounds i8, i8* %1, i64 %13424
  store i8 %13425, i8* %13426, align 1
  %13427 = getelementptr inbounds i8, i8* %1, i64 %13424
  %13428 = load i8, i8* %13427, align 1
  %13429 = zext i8 %13428 to i32
  %13430 = icmp eq i32 %13429, 0
  br i1 %13430, label %13431, label %13434

13431:                                            ; preds = %13423
  %13432 = mul nuw nsw i64 %13424, 16
  %13433 = getelementptr inbounds i8, i8* %0, i64 %13432
  call void @llvm.memset.p0i8.i64(i8* align 1 %13433, i8 0, i64 16, i1 false)
  br label %13434

13434:                                            ; preds = %13431, %13423
  %13435 = add nuw nsw i64 %13424, 1
  %13436 = call zeroext i8 @randombit()
  %13437 = getelementptr inbounds i8, i8* %1, i64 %13435
  store i8 %13436, i8* %13437, align 1
  %13438 = getelementptr inbounds i8, i8* %1, i64 %13435
  %13439 = load i8, i8* %13438, align 1
  %13440 = zext i8 %13439 to i32
  %13441 = icmp eq i32 %13440, 0
  br i1 %13441, label %13442, label %13445

13442:                                            ; preds = %13434
  %13443 = mul nuw nsw i64 %13435, 16
  %13444 = getelementptr inbounds i8, i8* %0, i64 %13443
  call void @llvm.memset.p0i8.i64(i8* align 1 %13444, i8 0, i64 16, i1 false)
  br label %13445

13445:                                            ; preds = %13442, %13434
  %13446 = add nuw nsw i64 %13435, 1
  %13447 = call zeroext i8 @randombit()
  %13448 = getelementptr inbounds i8, i8* %1, i64 %13446
  store i8 %13447, i8* %13448, align 1
  %13449 = getelementptr inbounds i8, i8* %1, i64 %13446
  %13450 = load i8, i8* %13449, align 1
  %13451 = zext i8 %13450 to i32
  %13452 = icmp eq i32 %13451, 0
  br i1 %13452, label %13453, label %13456

13453:                                            ; preds = %13445
  %13454 = mul nuw nsw i64 %13446, 16
  %13455 = getelementptr inbounds i8, i8* %0, i64 %13454
  call void @llvm.memset.p0i8.i64(i8* align 1 %13455, i8 0, i64 16, i1 false)
  br label %13456

13456:                                            ; preds = %13453, %13445
  %13457 = add nuw nsw i64 %13446, 1
  %13458 = call zeroext i8 @randombit()
  %13459 = getelementptr inbounds i8, i8* %1, i64 %13457
  store i8 %13458, i8* %13459, align 1
  %13460 = getelementptr inbounds i8, i8* %1, i64 %13457
  %13461 = load i8, i8* %13460, align 1
  %13462 = zext i8 %13461 to i32
  %13463 = icmp eq i32 %13462, 0
  br i1 %13463, label %13464, label %13467

13464:                                            ; preds = %13456
  %13465 = mul nuw nsw i64 %13457, 16
  %13466 = getelementptr inbounds i8, i8* %0, i64 %13465
  call void @llvm.memset.p0i8.i64(i8* align 1 %13466, i8 0, i64 16, i1 false)
  br label %13467

13467:                                            ; preds = %13464, %13456
  %13468 = add nuw nsw i64 %13457, 1
  %13469 = call zeroext i8 @randombit()
  %13470 = getelementptr inbounds i8, i8* %1, i64 %13468
  store i8 %13469, i8* %13470, align 1
  %13471 = getelementptr inbounds i8, i8* %1, i64 %13468
  %13472 = load i8, i8* %13471, align 1
  %13473 = zext i8 %13472 to i32
  %13474 = icmp eq i32 %13473, 0
  br i1 %13474, label %13475, label %13478

13475:                                            ; preds = %13467
  %13476 = mul nuw nsw i64 %13468, 16
  %13477 = getelementptr inbounds i8, i8* %0, i64 %13476
  call void @llvm.memset.p0i8.i64(i8* align 1 %13477, i8 0, i64 16, i1 false)
  br label %13478

13478:                                            ; preds = %13475, %13467
  %13479 = add nuw nsw i64 %13468, 1
  %13480 = call zeroext i8 @randombit()
  %13481 = getelementptr inbounds i8, i8* %1, i64 %13479
  store i8 %13480, i8* %13481, align 1
  %13482 = getelementptr inbounds i8, i8* %1, i64 %13479
  %13483 = load i8, i8* %13482, align 1
  %13484 = zext i8 %13483 to i32
  %13485 = icmp eq i32 %13484, 0
  br i1 %13485, label %13486, label %13489

13486:                                            ; preds = %13478
  %13487 = mul nuw nsw i64 %13479, 16
  %13488 = getelementptr inbounds i8, i8* %0, i64 %13487
  call void @llvm.memset.p0i8.i64(i8* align 1 %13488, i8 0, i64 16, i1 false)
  br label %13489

13489:                                            ; preds = %13486, %13478
  %13490 = add nuw nsw i64 %13479, 1
  %13491 = call zeroext i8 @randombit()
  %13492 = getelementptr inbounds i8, i8* %1, i64 %13490
  store i8 %13491, i8* %13492, align 1
  %13493 = getelementptr inbounds i8, i8* %1, i64 %13490
  %13494 = load i8, i8* %13493, align 1
  %13495 = zext i8 %13494 to i32
  %13496 = icmp eq i32 %13495, 0
  br i1 %13496, label %13497, label %13500

13497:                                            ; preds = %13489
  %13498 = mul nuw nsw i64 %13490, 16
  %13499 = getelementptr inbounds i8, i8* %0, i64 %13498
  call void @llvm.memset.p0i8.i64(i8* align 1 %13499, i8 0, i64 16, i1 false)
  br label %13500

13500:                                            ; preds = %13497, %13489
  %13501 = add nuw nsw i64 %13490, 1
  %13502 = call zeroext i8 @randombit()
  %13503 = getelementptr inbounds i8, i8* %1, i64 %13501
  store i8 %13502, i8* %13503, align 1
  %13504 = getelementptr inbounds i8, i8* %1, i64 %13501
  %13505 = load i8, i8* %13504, align 1
  %13506 = zext i8 %13505 to i32
  %13507 = icmp eq i32 %13506, 0
  br i1 %13507, label %13508, label %13511

13508:                                            ; preds = %13500
  %13509 = mul nuw nsw i64 %13501, 16
  %13510 = getelementptr inbounds i8, i8* %0, i64 %13509
  call void @llvm.memset.p0i8.i64(i8* align 1 %13510, i8 0, i64 16, i1 false)
  br label %13511

13511:                                            ; preds = %13508, %13500
  %13512 = add nuw nsw i64 %13501, 1
  %13513 = call zeroext i8 @randombit()
  %13514 = getelementptr inbounds i8, i8* %1, i64 %13512
  store i8 %13513, i8* %13514, align 1
  %13515 = getelementptr inbounds i8, i8* %1, i64 %13512
  %13516 = load i8, i8* %13515, align 1
  %13517 = zext i8 %13516 to i32
  %13518 = icmp eq i32 %13517, 0
  br i1 %13518, label %13519, label %13522

13519:                                            ; preds = %13511
  %13520 = mul nuw nsw i64 %13512, 16
  %13521 = getelementptr inbounds i8, i8* %0, i64 %13520
  call void @llvm.memset.p0i8.i64(i8* align 1 %13521, i8 0, i64 16, i1 false)
  br label %13522

13522:                                            ; preds = %13519, %13511
  %13523 = add nuw nsw i64 %13512, 1
  %13524 = call zeroext i8 @randombit()
  %13525 = getelementptr inbounds i8, i8* %1, i64 %13523
  store i8 %13524, i8* %13525, align 1
  %13526 = getelementptr inbounds i8, i8* %1, i64 %13523
  %13527 = load i8, i8* %13526, align 1
  %13528 = zext i8 %13527 to i32
  %13529 = icmp eq i32 %13528, 0
  br i1 %13529, label %13530, label %13533

13530:                                            ; preds = %13522
  %13531 = mul nuw nsw i64 %13523, 16
  %13532 = getelementptr inbounds i8, i8* %0, i64 %13531
  call void @llvm.memset.p0i8.i64(i8* align 1 %13532, i8 0, i64 16, i1 false)
  br label %13533

13533:                                            ; preds = %13530, %13522
  %13534 = add nuw nsw i64 %13523, 1
  %13535 = call zeroext i8 @randombit()
  %13536 = getelementptr inbounds i8, i8* %1, i64 %13534
  store i8 %13535, i8* %13536, align 1
  %13537 = getelementptr inbounds i8, i8* %1, i64 %13534
  %13538 = load i8, i8* %13537, align 1
  %13539 = zext i8 %13538 to i32
  %13540 = icmp eq i32 %13539, 0
  br i1 %13540, label %13541, label %13544

13541:                                            ; preds = %13533
  %13542 = mul nuw nsw i64 %13534, 16
  %13543 = getelementptr inbounds i8, i8* %0, i64 %13542
  call void @llvm.memset.p0i8.i64(i8* align 1 %13543, i8 0, i64 16, i1 false)
  br label %13544

13544:                                            ; preds = %13541, %13533
  %13545 = add nuw nsw i64 %13534, 1
  %13546 = call zeroext i8 @randombit()
  %13547 = getelementptr inbounds i8, i8* %1, i64 %13545
  store i8 %13546, i8* %13547, align 1
  %13548 = getelementptr inbounds i8, i8* %1, i64 %13545
  %13549 = load i8, i8* %13548, align 1
  %13550 = zext i8 %13549 to i32
  %13551 = icmp eq i32 %13550, 0
  br i1 %13551, label %13552, label %13555

13552:                                            ; preds = %13544
  %13553 = mul nuw nsw i64 %13545, 16
  %13554 = getelementptr inbounds i8, i8* %0, i64 %13553
  call void @llvm.memset.p0i8.i64(i8* align 1 %13554, i8 0, i64 16, i1 false)
  br label %13555

13555:                                            ; preds = %13552, %13544
  %13556 = add nuw nsw i64 %13545, 1
  %13557 = call zeroext i8 @randombit()
  %13558 = getelementptr inbounds i8, i8* %1, i64 %13556
  store i8 %13557, i8* %13558, align 1
  %13559 = getelementptr inbounds i8, i8* %1, i64 %13556
  %13560 = load i8, i8* %13559, align 1
  %13561 = zext i8 %13560 to i32
  %13562 = icmp eq i32 %13561, 0
  br i1 %13562, label %13563, label %13566

13563:                                            ; preds = %13555
  %13564 = mul nuw nsw i64 %13556, 16
  %13565 = getelementptr inbounds i8, i8* %0, i64 %13564
  call void @llvm.memset.p0i8.i64(i8* align 1 %13565, i8 0, i64 16, i1 false)
  br label %13566

13566:                                            ; preds = %13563, %13555
  %13567 = add nuw nsw i64 %13556, 1
  %13568 = call zeroext i8 @randombit()
  %13569 = getelementptr inbounds i8, i8* %1, i64 %13567
  store i8 %13568, i8* %13569, align 1
  %13570 = getelementptr inbounds i8, i8* %1, i64 %13567
  %13571 = load i8, i8* %13570, align 1
  %13572 = zext i8 %13571 to i32
  %13573 = icmp eq i32 %13572, 0
  br i1 %13573, label %13574, label %13577

13574:                                            ; preds = %13566
  %13575 = mul nuw nsw i64 %13567, 16
  %13576 = getelementptr inbounds i8, i8* %0, i64 %13575
  call void @llvm.memset.p0i8.i64(i8* align 1 %13576, i8 0, i64 16, i1 false)
  br label %13577

13577:                                            ; preds = %13574, %13566
  %13578 = add nuw nsw i64 %13567, 1
  %13579 = call zeroext i8 @randombit()
  %13580 = getelementptr inbounds i8, i8* %1, i64 %13578
  store i8 %13579, i8* %13580, align 1
  %13581 = getelementptr inbounds i8, i8* %1, i64 %13578
  %13582 = load i8, i8* %13581, align 1
  %13583 = zext i8 %13582 to i32
  %13584 = icmp eq i32 %13583, 0
  br i1 %13584, label %13585, label %13588

13585:                                            ; preds = %13577
  %13586 = mul nuw nsw i64 %13578, 16
  %13587 = getelementptr inbounds i8, i8* %0, i64 %13586
  call void @llvm.memset.p0i8.i64(i8* align 1 %13587, i8 0, i64 16, i1 false)
  br label %13588

13588:                                            ; preds = %13585, %13577
  %13589 = add nuw nsw i64 %13578, 1
  %13590 = call zeroext i8 @randombit()
  %13591 = getelementptr inbounds i8, i8* %1, i64 %13589
  store i8 %13590, i8* %13591, align 1
  %13592 = getelementptr inbounds i8, i8* %1, i64 %13589
  %13593 = load i8, i8* %13592, align 1
  %13594 = zext i8 %13593 to i32
  %13595 = icmp eq i32 %13594, 0
  br i1 %13595, label %13596, label %13599

13596:                                            ; preds = %13588
  %13597 = mul nuw nsw i64 %13589, 16
  %13598 = getelementptr inbounds i8, i8* %0, i64 %13597
  call void @llvm.memset.p0i8.i64(i8* align 1 %13598, i8 0, i64 16, i1 false)
  br label %13599

13599:                                            ; preds = %13596, %13588
  %13600 = add nuw nsw i64 %13589, 1
  %13601 = call zeroext i8 @randombit()
  %13602 = getelementptr inbounds i8, i8* %1, i64 %13600
  store i8 %13601, i8* %13602, align 1
  %13603 = getelementptr inbounds i8, i8* %1, i64 %13600
  %13604 = load i8, i8* %13603, align 1
  %13605 = zext i8 %13604 to i32
  %13606 = icmp eq i32 %13605, 0
  br i1 %13606, label %13607, label %13610

13607:                                            ; preds = %13599
  %13608 = mul nuw nsw i64 %13600, 16
  %13609 = getelementptr inbounds i8, i8* %0, i64 %13608
  call void @llvm.memset.p0i8.i64(i8* align 1 %13609, i8 0, i64 16, i1 false)
  br label %13610

13610:                                            ; preds = %13607, %13599
  %13611 = add nuw nsw i64 %13600, 1
  %13612 = call zeroext i8 @randombit()
  %13613 = getelementptr inbounds i8, i8* %1, i64 %13611
  store i8 %13612, i8* %13613, align 1
  %13614 = getelementptr inbounds i8, i8* %1, i64 %13611
  %13615 = load i8, i8* %13614, align 1
  %13616 = zext i8 %13615 to i32
  %13617 = icmp eq i32 %13616, 0
  br i1 %13617, label %13618, label %13621

13618:                                            ; preds = %13610
  %13619 = mul nuw nsw i64 %13611, 16
  %13620 = getelementptr inbounds i8, i8* %0, i64 %13619
  call void @llvm.memset.p0i8.i64(i8* align 1 %13620, i8 0, i64 16, i1 false)
  br label %13621

13621:                                            ; preds = %13618, %13610
  %13622 = add nuw nsw i64 %13611, 1
  %13623 = call zeroext i8 @randombit()
  %13624 = getelementptr inbounds i8, i8* %1, i64 %13622
  store i8 %13623, i8* %13624, align 1
  %13625 = getelementptr inbounds i8, i8* %1, i64 %13622
  %13626 = load i8, i8* %13625, align 1
  %13627 = zext i8 %13626 to i32
  %13628 = icmp eq i32 %13627, 0
  br i1 %13628, label %13629, label %13632

13629:                                            ; preds = %13621
  %13630 = mul nuw nsw i64 %13622, 16
  %13631 = getelementptr inbounds i8, i8* %0, i64 %13630
  call void @llvm.memset.p0i8.i64(i8* align 1 %13631, i8 0, i64 16, i1 false)
  br label %13632

13632:                                            ; preds = %13629, %13621
  %13633 = add nuw nsw i64 %13622, 1
  %13634 = call zeroext i8 @randombit()
  %13635 = getelementptr inbounds i8, i8* %1, i64 %13633
  store i8 %13634, i8* %13635, align 1
  %13636 = getelementptr inbounds i8, i8* %1, i64 %13633
  %13637 = load i8, i8* %13636, align 1
  %13638 = zext i8 %13637 to i32
  %13639 = icmp eq i32 %13638, 0
  br i1 %13639, label %13640, label %13643

13640:                                            ; preds = %13632
  %13641 = mul nuw nsw i64 %13633, 16
  %13642 = getelementptr inbounds i8, i8* %0, i64 %13641
  call void @llvm.memset.p0i8.i64(i8* align 1 %13642, i8 0, i64 16, i1 false)
  br label %13643

13643:                                            ; preds = %13640, %13632
  %13644 = add nuw nsw i64 %13633, 1
  %13645 = call zeroext i8 @randombit()
  %13646 = getelementptr inbounds i8, i8* %1, i64 %13644
  store i8 %13645, i8* %13646, align 1
  %13647 = getelementptr inbounds i8, i8* %1, i64 %13644
  %13648 = load i8, i8* %13647, align 1
  %13649 = zext i8 %13648 to i32
  %13650 = icmp eq i32 %13649, 0
  br i1 %13650, label %13651, label %13654

13651:                                            ; preds = %13643
  %13652 = mul nuw nsw i64 %13644, 16
  %13653 = getelementptr inbounds i8, i8* %0, i64 %13652
  call void @llvm.memset.p0i8.i64(i8* align 1 %13653, i8 0, i64 16, i1 false)
  br label %13654

13654:                                            ; preds = %13651, %13643
  %13655 = add nuw nsw i64 %13644, 1
  %13656 = call zeroext i8 @randombit()
  %13657 = getelementptr inbounds i8, i8* %1, i64 %13655
  store i8 %13656, i8* %13657, align 1
  %13658 = getelementptr inbounds i8, i8* %1, i64 %13655
  %13659 = load i8, i8* %13658, align 1
  %13660 = zext i8 %13659 to i32
  %13661 = icmp eq i32 %13660, 0
  br i1 %13661, label %13662, label %13665

13662:                                            ; preds = %13654
  %13663 = mul nuw nsw i64 %13655, 16
  %13664 = getelementptr inbounds i8, i8* %0, i64 %13663
  call void @llvm.memset.p0i8.i64(i8* align 1 %13664, i8 0, i64 16, i1 false)
  br label %13665

13665:                                            ; preds = %13662, %13654
  %13666 = add nuw nsw i64 %13655, 1
  %13667 = call zeroext i8 @randombit()
  %13668 = getelementptr inbounds i8, i8* %1, i64 %13666
  store i8 %13667, i8* %13668, align 1
  %13669 = getelementptr inbounds i8, i8* %1, i64 %13666
  %13670 = load i8, i8* %13669, align 1
  %13671 = zext i8 %13670 to i32
  %13672 = icmp eq i32 %13671, 0
  br i1 %13672, label %13673, label %13676

13673:                                            ; preds = %13665
  %13674 = mul nuw nsw i64 %13666, 16
  %13675 = getelementptr inbounds i8, i8* %0, i64 %13674
  call void @llvm.memset.p0i8.i64(i8* align 1 %13675, i8 0, i64 16, i1 false)
  br label %13676

13676:                                            ; preds = %13673, %13665
  %13677 = add nuw nsw i64 %13666, 1
  %13678 = call zeroext i8 @randombit()
  %13679 = getelementptr inbounds i8, i8* %1, i64 %13677
  store i8 %13678, i8* %13679, align 1
  %13680 = getelementptr inbounds i8, i8* %1, i64 %13677
  %13681 = load i8, i8* %13680, align 1
  %13682 = zext i8 %13681 to i32
  %13683 = icmp eq i32 %13682, 0
  br i1 %13683, label %13684, label %13687

13684:                                            ; preds = %13676
  %13685 = mul nuw nsw i64 %13677, 16
  %13686 = getelementptr inbounds i8, i8* %0, i64 %13685
  call void @llvm.memset.p0i8.i64(i8* align 1 %13686, i8 0, i64 16, i1 false)
  br label %13687

13687:                                            ; preds = %13684, %13676
  %13688 = add nuw nsw i64 %13677, 1
  %13689 = call zeroext i8 @randombit()
  %13690 = getelementptr inbounds i8, i8* %1, i64 %13688
  store i8 %13689, i8* %13690, align 1
  %13691 = getelementptr inbounds i8, i8* %1, i64 %13688
  %13692 = load i8, i8* %13691, align 1
  %13693 = zext i8 %13692 to i32
  %13694 = icmp eq i32 %13693, 0
  br i1 %13694, label %13695, label %13698

13695:                                            ; preds = %13687
  %13696 = mul nuw nsw i64 %13688, 16
  %13697 = getelementptr inbounds i8, i8* %0, i64 %13696
  call void @llvm.memset.p0i8.i64(i8* align 1 %13697, i8 0, i64 16, i1 false)
  br label %13698

13698:                                            ; preds = %13695, %13687
  %13699 = add nuw nsw i64 %13688, 1
  %13700 = call zeroext i8 @randombit()
  %13701 = getelementptr inbounds i8, i8* %1, i64 %13699
  store i8 %13700, i8* %13701, align 1
  %13702 = getelementptr inbounds i8, i8* %1, i64 %13699
  %13703 = load i8, i8* %13702, align 1
  %13704 = zext i8 %13703 to i32
  %13705 = icmp eq i32 %13704, 0
  br i1 %13705, label %13706, label %13709

13706:                                            ; preds = %13698
  %13707 = mul nuw nsw i64 %13699, 16
  %13708 = getelementptr inbounds i8, i8* %0, i64 %13707
  call void @llvm.memset.p0i8.i64(i8* align 1 %13708, i8 0, i64 16, i1 false)
  br label %13709

13709:                                            ; preds = %13706, %13698
  %13710 = add nuw nsw i64 %13699, 1
  %13711 = call zeroext i8 @randombit()
  %13712 = getelementptr inbounds i8, i8* %1, i64 %13710
  store i8 %13711, i8* %13712, align 1
  %13713 = getelementptr inbounds i8, i8* %1, i64 %13710
  %13714 = load i8, i8* %13713, align 1
  %13715 = zext i8 %13714 to i32
  %13716 = icmp eq i32 %13715, 0
  br i1 %13716, label %13717, label %13720

13717:                                            ; preds = %13709
  %13718 = mul nuw nsw i64 %13710, 16
  %13719 = getelementptr inbounds i8, i8* %0, i64 %13718
  call void @llvm.memset.p0i8.i64(i8* align 1 %13719, i8 0, i64 16, i1 false)
  br label %13720

13720:                                            ; preds = %13717, %13709
  %13721 = add nuw nsw i64 %13710, 1
  %13722 = call zeroext i8 @randombit()
  %13723 = getelementptr inbounds i8, i8* %1, i64 %13721
  store i8 %13722, i8* %13723, align 1
  %13724 = getelementptr inbounds i8, i8* %1, i64 %13721
  %13725 = load i8, i8* %13724, align 1
  %13726 = zext i8 %13725 to i32
  %13727 = icmp eq i32 %13726, 0
  br i1 %13727, label %13728, label %13731

13728:                                            ; preds = %13720
  %13729 = mul nuw nsw i64 %13721, 16
  %13730 = getelementptr inbounds i8, i8* %0, i64 %13729
  call void @llvm.memset.p0i8.i64(i8* align 1 %13730, i8 0, i64 16, i1 false)
  br label %13731

13731:                                            ; preds = %13728, %13720
  %13732 = add nuw nsw i64 %13721, 1
  %13733 = call zeroext i8 @randombit()
  %13734 = getelementptr inbounds i8, i8* %1, i64 %13732
  store i8 %13733, i8* %13734, align 1
  %13735 = getelementptr inbounds i8, i8* %1, i64 %13732
  %13736 = load i8, i8* %13735, align 1
  %13737 = zext i8 %13736 to i32
  %13738 = icmp eq i32 %13737, 0
  br i1 %13738, label %13739, label %13742

13739:                                            ; preds = %13731
  %13740 = mul nuw nsw i64 %13732, 16
  %13741 = getelementptr inbounds i8, i8* %0, i64 %13740
  call void @llvm.memset.p0i8.i64(i8* align 1 %13741, i8 0, i64 16, i1 false)
  br label %13742

13742:                                            ; preds = %13739, %13731
  %13743 = add nuw nsw i64 %13732, 1
  %13744 = call zeroext i8 @randombit()
  %13745 = getelementptr inbounds i8, i8* %1, i64 %13743
  store i8 %13744, i8* %13745, align 1
  %13746 = getelementptr inbounds i8, i8* %1, i64 %13743
  %13747 = load i8, i8* %13746, align 1
  %13748 = zext i8 %13747 to i32
  %13749 = icmp eq i32 %13748, 0
  br i1 %13749, label %13750, label %13753

13750:                                            ; preds = %13742
  %13751 = mul nuw nsw i64 %13743, 16
  %13752 = getelementptr inbounds i8, i8* %0, i64 %13751
  call void @llvm.memset.p0i8.i64(i8* align 1 %13752, i8 0, i64 16, i1 false)
  br label %13753

13753:                                            ; preds = %13750, %13742
  %13754 = add nuw nsw i64 %13743, 1
  %exitcond.1249 = icmp ne i64 %13754, 100000
  br i1 %exitcond.1249, label %3, label %21, !llvm.loop !4
}

define void @br_md5_init(%struct.br_md5_context* %0, i64 %N) {
  %2 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 0
  store %struct.br_hash_class_* @br_md5_vtable, %struct.br_hash_class_** %2, align 8
  %3 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 3
  %4 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 0
  %5 = bitcast i32* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* align 16 bitcast ([4 x i32]* @br_md5_IV to i8*), i64 16, i1 false)
  %6 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  store i64 0, i64* %6, align 8
  ret void
}

define void @br_md5_update(%struct.br_md5_context* %0, i64 %N, i8* %1, i64 %N1, i64 %2) {
  %4 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  %5 = load i64, i64* %4, align 8
  %6 = and i64 %5, 63
  %7 = icmp ugt i64 %2, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  br label %.lr.ph

.lr.ph:                                           ; preds = %165, %.lr.ph.preheader
  %.016 = phi i64 [ %.1.7, %165 ], [ %6, %.lr.ph.preheader ]
  %.025 = phi i64 [ %155, %165 ], [ %2, %.lr.ph.preheader ]
  %.034 = phi i8* [ %154, %165 ], [ %1, %.lr.ph.preheader ]
  %8 = sub i64 64, %.016
  %9 = icmp ugt i64 %8, %.025
  %spec.select = select i1 %9, i64 %.025, i64 %8
  %10 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %11 = getelementptr inbounds [64 x i8], [64 x i8]* %10, i64 0, i64 0
  %12 = getelementptr inbounds i8, i8* %11, i64 %.016
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %12, i8* align 1 %.034, i64 %spec.select, i1 false)
  %13 = add i64 %.016, %spec.select
  %14 = getelementptr inbounds i8, i8* %.034, i64 %spec.select
  %15 = sub i64 %.025, %spec.select
  %16 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  %17 = load i64, i64* %16, align 8
  %18 = add i64 %17, %spec.select
  store i64 %18, i64* %16, align 8
  %19 = icmp eq i64 %13, 64
  br i1 %19, label %20, label %25

20:                                               ; preds = %.lr.ph
  %21 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %22 = getelementptr inbounds [64 x i8], [64 x i8]* %21, i64 0, i64 0
  %23 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 3
  %24 = getelementptr inbounds [4 x i32], [4 x i32]* %23, i64 0, i64 0
  call void @br_md5_round(i8* %22, i64 %N, i32* %24, i64 %N)
  br label %25

25:                                               ; preds = %20, %.lr.ph
  %.1 = phi i64 [ 0, %20 ], [ %13, %.lr.ph ]
  %26 = icmp ugt i64 %15, 0
  br i1 %26, label %27, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %165, %145, %125, %105, %85, %65, %45, %25
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void

27:                                               ; preds = %25
  %28 = sub i64 64, %.1
  %29 = icmp ugt i64 %28, %15
  %spec.select.1 = select i1 %29, i64 %15, i64 %28
  %30 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %31 = getelementptr inbounds [64 x i8], [64 x i8]* %30, i64 0, i64 0
  %32 = getelementptr inbounds i8, i8* %31, i64 %.1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %32, i8* align 1 %14, i64 %spec.select.1, i1 false)
  %33 = add i64 %.1, %spec.select.1
  %34 = getelementptr inbounds i8, i8* %14, i64 %spec.select.1
  %35 = sub i64 %15, %spec.select.1
  %36 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  %37 = load i64, i64* %36, align 8
  %38 = add i64 %37, %spec.select.1
  store i64 %38, i64* %36, align 8
  %39 = icmp eq i64 %33, 64
  br i1 %39, label %40, label %45

40:                                               ; preds = %27
  %41 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %42 = getelementptr inbounds [64 x i8], [64 x i8]* %41, i64 0, i64 0
  %43 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 3
  %44 = getelementptr inbounds [4 x i32], [4 x i32]* %43, i64 0, i64 0
  call void @br_md5_round(i8* %42, i64 %N, i32* %44, i64 %N)
  br label %45

45:                                               ; preds = %40, %27
  %.1.1 = phi i64 [ 0, %40 ], [ %33, %27 ]
  %46 = icmp ugt i64 %35, 0
  br i1 %46, label %47, label %._crit_edge.loopexit

47:                                               ; preds = %45
  %48 = sub i64 64, %.1.1
  %49 = icmp ugt i64 %48, %35
  %spec.select.2 = select i1 %49, i64 %35, i64 %48
  %50 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %51 = getelementptr inbounds [64 x i8], [64 x i8]* %50, i64 0, i64 0
  %52 = getelementptr inbounds i8, i8* %51, i64 %.1.1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %52, i8* align 1 %34, i64 %spec.select.2, i1 false)
  %53 = add i64 %.1.1, %spec.select.2
  %54 = getelementptr inbounds i8, i8* %34, i64 %spec.select.2
  %55 = sub i64 %35, %spec.select.2
  %56 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  %57 = load i64, i64* %56, align 8
  %58 = add i64 %57, %spec.select.2
  store i64 %58, i64* %56, align 8
  %59 = icmp eq i64 %53, 64
  br i1 %59, label %60, label %65

60:                                               ; preds = %47
  %61 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %62 = getelementptr inbounds [64 x i8], [64 x i8]* %61, i64 0, i64 0
  %63 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 3
  %64 = getelementptr inbounds [4 x i32], [4 x i32]* %63, i64 0, i64 0
  call void @br_md5_round(i8* %62, i64 %N, i32* %64, i64 %N)
  br label %65

65:                                               ; preds = %60, %47
  %.1.2 = phi i64 [ 0, %60 ], [ %53, %47 ]
  %66 = icmp ugt i64 %55, 0
  br i1 %66, label %67, label %._crit_edge.loopexit

67:                                               ; preds = %65
  %68 = sub i64 64, %.1.2
  %69 = icmp ugt i64 %68, %55
  %spec.select.3 = select i1 %69, i64 %55, i64 %68
  %70 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %71 = getelementptr inbounds [64 x i8], [64 x i8]* %70, i64 0, i64 0
  %72 = getelementptr inbounds i8, i8* %71, i64 %.1.2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %72, i8* align 1 %54, i64 %spec.select.3, i1 false)
  %73 = add i64 %.1.2, %spec.select.3
  %74 = getelementptr inbounds i8, i8* %54, i64 %spec.select.3
  %75 = sub i64 %55, %spec.select.3
  %76 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  %77 = load i64, i64* %76, align 8
  %78 = add i64 %77, %spec.select.3
  store i64 %78, i64* %76, align 8
  %79 = icmp eq i64 %73, 64
  br i1 %79, label %80, label %85

80:                                               ; preds = %67
  %81 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %82 = getelementptr inbounds [64 x i8], [64 x i8]* %81, i64 0, i64 0
  %83 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 3
  %84 = getelementptr inbounds [4 x i32], [4 x i32]* %83, i64 0, i64 0
  call void @br_md5_round(i8* %82, i64 %N, i32* %84, i64 %N)
  br label %85

85:                                               ; preds = %80, %67
  %.1.3 = phi i64 [ 0, %80 ], [ %73, %67 ]
  %86 = icmp ugt i64 %75, 0
  br i1 %86, label %87, label %._crit_edge.loopexit

87:                                               ; preds = %85
  %88 = sub i64 64, %.1.3
  %89 = icmp ugt i64 %88, %75
  %spec.select.4 = select i1 %89, i64 %75, i64 %88
  %90 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %91 = getelementptr inbounds [64 x i8], [64 x i8]* %90, i64 0, i64 0
  %92 = getelementptr inbounds i8, i8* %91, i64 %.1.3
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %92, i8* align 1 %74, i64 %spec.select.4, i1 false)
  %93 = add i64 %.1.3, %spec.select.4
  %94 = getelementptr inbounds i8, i8* %74, i64 %spec.select.4
  %95 = sub i64 %75, %spec.select.4
  %96 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  %97 = load i64, i64* %96, align 8
  %98 = add i64 %97, %spec.select.4
  store i64 %98, i64* %96, align 8
  %99 = icmp eq i64 %93, 64
  br i1 %99, label %100, label %105

100:                                              ; preds = %87
  %101 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %102 = getelementptr inbounds [64 x i8], [64 x i8]* %101, i64 0, i64 0
  %103 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 3
  %104 = getelementptr inbounds [4 x i32], [4 x i32]* %103, i64 0, i64 0
  call void @br_md5_round(i8* %102, i64 %N, i32* %104, i64 %N)
  br label %105

105:                                              ; preds = %100, %87
  %.1.4 = phi i64 [ 0, %100 ], [ %93, %87 ]
  %106 = icmp ugt i64 %95, 0
  br i1 %106, label %107, label %._crit_edge.loopexit

107:                                              ; preds = %105
  %108 = sub i64 64, %.1.4
  %109 = icmp ugt i64 %108, %95
  %spec.select.5 = select i1 %109, i64 %95, i64 %108
  %110 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %111 = getelementptr inbounds [64 x i8], [64 x i8]* %110, i64 0, i64 0
  %112 = getelementptr inbounds i8, i8* %111, i64 %.1.4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %112, i8* align 1 %94, i64 %spec.select.5, i1 false)
  %113 = add i64 %.1.4, %spec.select.5
  %114 = getelementptr inbounds i8, i8* %94, i64 %spec.select.5
  %115 = sub i64 %95, %spec.select.5
  %116 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  %117 = load i64, i64* %116, align 8
  %118 = add i64 %117, %spec.select.5
  store i64 %118, i64* %116, align 8
  %119 = icmp eq i64 %113, 64
  br i1 %119, label %120, label %125

120:                                              ; preds = %107
  %121 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %122 = getelementptr inbounds [64 x i8], [64 x i8]* %121, i64 0, i64 0
  %123 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 3
  %124 = getelementptr inbounds [4 x i32], [4 x i32]* %123, i64 0, i64 0
  call void @br_md5_round(i8* %122, i64 %N, i32* %124, i64 %N)
  br label %125

125:                                              ; preds = %120, %107
  %.1.5 = phi i64 [ 0, %120 ], [ %113, %107 ]
  %126 = icmp ugt i64 %115, 0
  br i1 %126, label %127, label %._crit_edge.loopexit

127:                                              ; preds = %125
  %128 = sub i64 64, %.1.5
  %129 = icmp ugt i64 %128, %115
  %spec.select.6 = select i1 %129, i64 %115, i64 %128
  %130 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %131 = getelementptr inbounds [64 x i8], [64 x i8]* %130, i64 0, i64 0
  %132 = getelementptr inbounds i8, i8* %131, i64 %.1.5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %132, i8* align 1 %114, i64 %spec.select.6, i1 false)
  %133 = add i64 %.1.5, %spec.select.6
  %134 = getelementptr inbounds i8, i8* %114, i64 %spec.select.6
  %135 = sub i64 %115, %spec.select.6
  %136 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  %137 = load i64, i64* %136, align 8
  %138 = add i64 %137, %spec.select.6
  store i64 %138, i64* %136, align 8
  %139 = icmp eq i64 %133, 64
  br i1 %139, label %140, label %145

140:                                              ; preds = %127
  %141 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %142 = getelementptr inbounds [64 x i8], [64 x i8]* %141, i64 0, i64 0
  %143 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 3
  %144 = getelementptr inbounds [4 x i32], [4 x i32]* %143, i64 0, i64 0
  call void @br_md5_round(i8* %142, i64 %N, i32* %144, i64 %N)
  br label %145

145:                                              ; preds = %140, %127
  %.1.6 = phi i64 [ 0, %140 ], [ %133, %127 ]
  %146 = icmp ugt i64 %135, 0
  br i1 %146, label %147, label %._crit_edge.loopexit

147:                                              ; preds = %145
  %148 = sub i64 64, %.1.6
  %149 = icmp ugt i64 %148, %135
  %spec.select.7 = select i1 %149, i64 %135, i64 %148
  %150 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %151 = getelementptr inbounds [64 x i8], [64 x i8]* %150, i64 0, i64 0
  %152 = getelementptr inbounds i8, i8* %151, i64 %.1.6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %152, i8* align 1 %134, i64 %spec.select.7, i1 false)
  %153 = add i64 %.1.6, %spec.select.7
  %154 = getelementptr inbounds i8, i8* %134, i64 %spec.select.7
  %155 = sub i64 %135, %spec.select.7
  %156 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  %157 = load i64, i64* %156, align 8
  %158 = add i64 %157, %spec.select.7
  store i64 %158, i64* %156, align 8
  %159 = icmp eq i64 %153, 64
  br i1 %159, label %160, label %165

160:                                              ; preds = %147
  %161 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %162 = getelementptr inbounds [64 x i8], [64 x i8]* %161, i64 0, i64 0
  %163 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 3
  %164 = getelementptr inbounds [4 x i32], [4 x i32]* %163, i64 0, i64 0
  call void @br_md5_round(i8* %162, i64 %N, i32* %164, i64 %N)
  br label %165

165:                                              ; preds = %160, %147
  %.1.7 = phi i64 [ 0, %160 ], [ %153, %147 ]
  %166 = icmp ugt i64 %155, 0
  br i1 %166, label %.lr.ph, label %._crit_edge.loopexit, !llvm.loop !6
}

define void @br_md5_out(%struct.br_md5_context* %0, i64 %N, i8* %1, i64 %N1) {
  %3 = alloca [64 x i8], align 16
  %4 = alloca [4 x i32], align 16
  %5 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  %6 = load i64, i64* %5, align 8
  %7 = and i64 %6, 63
  %8 = getelementptr inbounds [64 x i8], [64 x i8]* %3, i64 0, i64 0
  %9 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 1
  %10 = getelementptr inbounds [64 x i8], [64 x i8]* %9, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 8 %10, i64 %7, i1 false)
  %11 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 0
  %12 = bitcast i32* %11 to i8*
  %13 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 3
  %14 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 0
  %15 = bitcast i32* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %12, i8* align 8 %15, i64 16, i1 false)
  %16 = add i64 %7, 1
  %17 = getelementptr inbounds [64 x i8], [64 x i8]* %3, i64 0, i64 %7
  store i8 -128, i8* %17, align 1
  %18 = icmp ugt i64 %16, 56
  %19 = getelementptr inbounds [64 x i8], [64 x i8]* %3, i64 0, i64 0
  %20 = getelementptr inbounds i8, i8* %19, i64 %16
  br i1 %18, label %21, label %28

21:                                               ; preds = %2
  %22 = sub i64 64, %16
  call void @llvm.memset.p0i8.i64(i8* align 1 %20, i8 0, i64 %22, i1 false)
  %23 = getelementptr inbounds [64 x i8], [64 x i8]* %3, i64 0, i64 0
  %24 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 0
  %25 = sext i8 64 to i64
  %26 = sext i32 4 to i64
  call void @br_md5_round(i8* %23, i64 %25, i32* %24, i64 %26)
  %27 = getelementptr inbounds [64 x i8], [64 x i8]* %3, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* align 16 %27, i8 0, i64 56, i1 false)
  br label %30

28:                                               ; preds = %2
  %29 = sub i64 56, %16
  call void @llvm.memset.p0i8.i64(i8* align 1 %20, i8 0, i64 %29, i1 false)
  br label %30

30:                                               ; preds = %28, %21
  %31 = getelementptr inbounds [64 x i8], [64 x i8]* %3, i64 0, i64 0
  %32 = getelementptr inbounds i8, i8* %31, i64 56
  %33 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  %34 = load i64, i64* %33, align 8
  %35 = shl i64 %34, 3
  %36 = sext i8 64 to i64
  call void @br_enc64le(i8* %32, i64 %36, i64 %35)
  %37 = getelementptr inbounds [64 x i8], [64 x i8]* %3, i64 0, i64 0
  %38 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 0
  %39 = sext i8 64 to i64
  %40 = sext i32 4 to i64
  call void @br_md5_round(i8* %37, i64 %39, i32* %38, i64 %40)
  %41 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 0
  %42 = sext i32 4 to i64
  call void @br_range_enc32le(i8* %1, i64 %N1, i32* %41, i64 %42, i64 4)
  ret void
}

define i64 @br_md5_state(%struct.br_md5_context* %0, i64 %N, i8* %1, i64 %N1) {
  %3 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 3
  %4 = getelementptr inbounds [4 x i32], [4 x i32]* %3, i64 0, i64 0
  call void @br_range_enc32le(i8* %1, i64 %N1, i32* %4, i64 %N, i64 4)
  %5 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  %6 = load i64, i64* %5, align 8
  ret i64 %6
}

define void @br_md5_set_state(%struct.br_md5_context* %0, i64 %N, i8* %1, i64 %N1, i64 %2) {
  %4 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 3
  %5 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 0
  call void @br_range_dec32le(i32* %5, i64 %N, i64 4, i8* %1, i64 %N1, i1 true)
  %6 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i32 0, i32 2
  store i64 %2, i64* %6, align 8
  ret void
}

define void @br_md5_round(i8* %0, i64 %N, i32* %1, i64 %N1) {
.preheader18:
  %out. = alloca i1
  store i1 true, i1* %out.
  %2 = alloca [16 x i32], align 16
  %3 = getelementptr inbounds i32, i32* %1, i64 0
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr inbounds i32, i32* %1, i64 1
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds i32, i32* %1, i64 2
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr inbounds i32, i32* %1, i64 3
  %10 = load i32, i32* %9, align 4
  %11 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 0
  %12 = sext i32 16 to i64
  call void @br_range_dec32le(i32* %11, i64 %12, i64 16, i8* %0, i64 %N, i1 true)
  %13 = xor i32 %8, %10
  %14 = and i32 %13, %6
  %15 = xor i32 %14, %10
  %16 = add i32 %4, %15
  %17 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 0
  %18 = load i32, i32* %17, align 4
  %19 = add i32 %16, %18
  %20 = add i32 %19, -680876936
  %21 = shl i32 %20, 7
  %22 = xor i32 %8, %10
  %23 = and i32 %22, %6
  %24 = xor i32 %23, %10
  %25 = add i32 %4, %24
  %26 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 0
  %27 = load i32, i32* %26, align 4
  %28 = add i32 %25, %27
  %29 = add i32 %28, -680876936
  %30 = lshr i32 %29, 25
  %31 = or i32 %21, %30
  %32 = add i32 %6, %31
  %33 = xor i32 %6, %8
  %34 = and i32 %33, %32
  %35 = xor i32 %34, %8
  %36 = add i32 %10, %35
  %37 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 1
  %38 = load i32, i32* %37, align 4
  %39 = add i32 %36, %38
  %40 = add i32 %39, -389564586
  %41 = shl i32 %40, 12
  %42 = xor i32 %6, %8
  %43 = and i32 %42, %32
  %44 = xor i32 %43, %8
  %45 = add i32 %10, %44
  %46 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 1
  %47 = load i32, i32* %46, align 4
  %48 = add i32 %45, %47
  %49 = add i32 %48, -389564586
  %50 = lshr i32 %49, 20
  %51 = or i32 %41, %50
  %52 = add i32 %32, %51
  %53 = xor i32 %32, %6
  %54 = and i32 %53, %52
  %55 = xor i32 %54, %6
  %56 = add i32 %8, %55
  %57 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 2
  %58 = load i32, i32* %57, align 4
  %59 = add i32 %56, %58
  %60 = add i32 %59, 606105819
  %61 = shl i32 %60, 17
  %62 = xor i32 %32, %6
  %63 = and i32 %62, %52
  %64 = xor i32 %63, %6
  %65 = add i32 %8, %64
  %66 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 2
  %67 = load i32, i32* %66, align 4
  %68 = add i32 %65, %67
  %69 = add i32 %68, 606105819
  %70 = lshr i32 %69, 15
  %71 = or i32 %61, %70
  %72 = add i32 %52, %71
  %73 = xor i32 %52, %32
  %74 = and i32 %73, %72
  %75 = xor i32 %74, %32
  %76 = add i32 %6, %75
  %77 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 3
  %78 = load i32, i32* %77, align 4
  %79 = add i32 %76, %78
  %80 = add i32 %79, -1044525330
  %81 = shl i32 %80, 22
  %82 = xor i32 %52, %32
  %83 = and i32 %82, %72
  %84 = xor i32 %83, %32
  %85 = add i32 %6, %84
  %86 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 3
  %87 = load i32, i32* %86, align 4
  %88 = add i32 %85, %87
  %89 = add i32 %88, -1044525330
  %90 = lshr i32 %89, 10
  %91 = or i32 %81, %90
  %92 = add i32 %72, %91
  %93 = xor i32 %72, %52
  %94 = and i32 %93, %92
  %95 = xor i32 %94, %52
  %96 = add i32 %32, %95
  %97 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 4
  %98 = load i32, i32* %97, align 4
  %99 = add i32 %96, %98
  %100 = add i32 %99, -176418897
  %101 = shl i32 %100, 7
  %102 = xor i32 %72, %52
  %103 = and i32 %102, %92
  %104 = xor i32 %103, %52
  %105 = add i32 %32, %104
  %106 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 4
  %107 = load i32, i32* %106, align 4
  %108 = add i32 %105, %107
  %109 = add i32 %108, -176418897
  %110 = lshr i32 %109, 25
  %111 = or i32 %101, %110
  %112 = add i32 %92, %111
  %113 = xor i32 %92, %72
  %114 = and i32 %113, %112
  %115 = xor i32 %114, %72
  %116 = add i32 %52, %115
  %117 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 5
  %118 = load i32, i32* %117, align 4
  %119 = add i32 %116, %118
  %120 = add i32 %119, 1200080426
  %121 = shl i32 %120, 12
  %122 = xor i32 %92, %72
  %123 = and i32 %122, %112
  %124 = xor i32 %123, %72
  %125 = add i32 %52, %124
  %126 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 5
  %127 = load i32, i32* %126, align 4
  %128 = add i32 %125, %127
  %129 = add i32 %128, 1200080426
  %130 = lshr i32 %129, 20
  %131 = or i32 %121, %130
  %132 = add i32 %112, %131
  %133 = xor i32 %112, %92
  %134 = and i32 %133, %132
  %135 = xor i32 %134, %92
  %136 = add i32 %72, %135
  %137 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 6
  %138 = load i32, i32* %137, align 4
  %139 = add i32 %136, %138
  %140 = add i32 %139, -1473231341
  %141 = shl i32 %140, 17
  %142 = xor i32 %112, %92
  %143 = and i32 %142, %132
  %144 = xor i32 %143, %92
  %145 = add i32 %72, %144
  %146 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 6
  %147 = load i32, i32* %146, align 4
  %148 = add i32 %145, %147
  %149 = add i32 %148, -1473231341
  %150 = lshr i32 %149, 15
  %151 = or i32 %141, %150
  %152 = add i32 %132, %151
  %153 = xor i32 %132, %112
  %154 = and i32 %153, %152
  %155 = xor i32 %154, %112
  %156 = add i32 %92, %155
  %157 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 7
  %158 = load i32, i32* %157, align 4
  %159 = add i32 %156, %158
  %160 = add i32 %159, -45705983
  %161 = shl i32 %160, 22
  %162 = xor i32 %132, %112
  %163 = and i32 %162, %152
  %164 = xor i32 %163, %112
  %165 = add i32 %92, %164
  %166 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 7
  %167 = load i32, i32* %166, align 4
  %168 = add i32 %165, %167
  %169 = add i32 %168, -45705983
  %170 = lshr i32 %169, 10
  %171 = or i32 %161, %170
  %172 = add i32 %152, %171
  %173 = xor i32 %152, %132
  %174 = and i32 %173, %172
  %175 = xor i32 %174, %132
  %176 = add i32 %112, %175
  %177 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 8
  %178 = load i32, i32* %177, align 4
  %179 = add i32 %176, %178
  %180 = add i32 %179, 1770035416
  %181 = shl i32 %180, 7
  %182 = xor i32 %152, %132
  %183 = and i32 %182, %172
  %184 = xor i32 %183, %132
  %185 = add i32 %112, %184
  %186 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 8
  %187 = load i32, i32* %186, align 4
  %188 = add i32 %185, %187
  %189 = add i32 %188, 1770035416
  %190 = lshr i32 %189, 25
  %191 = or i32 %181, %190
  %192 = add i32 %172, %191
  %193 = xor i32 %172, %152
  %194 = and i32 %193, %192
  %195 = xor i32 %194, %152
  %196 = add i32 %132, %195
  %197 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 9
  %198 = load i32, i32* %197, align 4
  %199 = add i32 %196, %198
  %200 = add i32 %199, -1958414417
  %201 = shl i32 %200, 12
  %202 = xor i32 %172, %152
  %203 = and i32 %202, %192
  %204 = xor i32 %203, %152
  %205 = add i32 %132, %204
  %206 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 9
  %207 = load i32, i32* %206, align 4
  %208 = add i32 %205, %207
  %209 = add i32 %208, -1958414417
  %210 = lshr i32 %209, 20
  %211 = or i32 %201, %210
  %212 = add i32 %192, %211
  %213 = xor i32 %192, %172
  %214 = and i32 %213, %212
  %215 = xor i32 %214, %172
  %216 = add i32 %152, %215
  %217 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 10
  %218 = load i32, i32* %217, align 4
  %219 = add i32 %216, %218
  %220 = add i32 %219, -42063
  %221 = shl i32 %220, 17
  %222 = xor i32 %192, %172
  %223 = and i32 %222, %212
  %224 = xor i32 %223, %172
  %225 = add i32 %152, %224
  %226 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 10
  %227 = load i32, i32* %226, align 4
  %228 = add i32 %225, %227
  %229 = add i32 %228, -42063
  %230 = lshr i32 %229, 15
  %231 = or i32 %221, %230
  %232 = add i32 %212, %231
  %233 = xor i32 %212, %192
  %234 = and i32 %233, %232
  %235 = xor i32 %234, %192
  %236 = add i32 %172, %235
  %237 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 11
  %238 = load i32, i32* %237, align 4
  %239 = add i32 %236, %238
  %240 = add i32 %239, -1990404162
  %241 = shl i32 %240, 22
  %242 = xor i32 %212, %192
  %243 = and i32 %242, %232
  %244 = xor i32 %243, %192
  %245 = add i32 %172, %244
  %246 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 11
  %247 = load i32, i32* %246, align 4
  %248 = add i32 %245, %247
  %249 = add i32 %248, -1990404162
  %250 = lshr i32 %249, 10
  %251 = or i32 %241, %250
  %252 = add i32 %232, %251
  %253 = xor i32 %232, %212
  %254 = and i32 %253, %252
  %255 = xor i32 %254, %212
  %256 = add i32 %192, %255
  %257 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 12
  %258 = load i32, i32* %257, align 4
  %259 = add i32 %256, %258
  %260 = add i32 %259, 1804603682
  %261 = shl i32 %260, 7
  %262 = xor i32 %232, %212
  %263 = and i32 %262, %252
  %264 = xor i32 %263, %212
  %265 = add i32 %192, %264
  %266 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 12
  %267 = load i32, i32* %266, align 4
  %268 = add i32 %265, %267
  %269 = add i32 %268, 1804603682
  %270 = lshr i32 %269, 25
  %271 = or i32 %261, %270
  %272 = add i32 %252, %271
  %273 = xor i32 %252, %232
  %274 = and i32 %273, %272
  %275 = xor i32 %274, %232
  %276 = add i32 %212, %275
  %277 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 13
  %278 = load i32, i32* %277, align 4
  %279 = add i32 %276, %278
  %280 = add i32 %279, -40341101
  %281 = shl i32 %280, 12
  %282 = xor i32 %252, %232
  %283 = and i32 %282, %272
  %284 = xor i32 %283, %232
  %285 = add i32 %212, %284
  %286 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 13
  %287 = load i32, i32* %286, align 4
  %288 = add i32 %285, %287
  %289 = add i32 %288, -40341101
  %290 = lshr i32 %289, 20
  %291 = or i32 %281, %290
  %292 = add i32 %272, %291
  %293 = xor i32 %272, %252
  %294 = and i32 %293, %292
  %295 = xor i32 %294, %252
  %296 = add i32 %232, %295
  %297 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 14
  %298 = load i32, i32* %297, align 4
  %299 = add i32 %296, %298
  %300 = add i32 %299, -1502002290
  %301 = shl i32 %300, 17
  %302 = xor i32 %272, %252
  %303 = and i32 %302, %292
  %304 = xor i32 %303, %252
  %305 = add i32 %232, %304
  %306 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 14
  %307 = load i32, i32* %306, align 4
  %308 = add i32 %305, %307
  %309 = add i32 %308, -1502002290
  %310 = lshr i32 %309, 15
  %311 = or i32 %301, %310
  %312 = add i32 %292, %311
  %313 = xor i32 %292, %272
  %314 = and i32 %313, %312
  %315 = xor i32 %314, %272
  %316 = add i32 %252, %315
  %317 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 15
  %318 = load i32, i32* %317, align 4
  %319 = add i32 %316, %318
  %320 = add i32 %319, 1236535329
  %321 = shl i32 %320, 22
  %322 = xor i32 %292, %272
  %323 = and i32 %322, %312
  %324 = xor i32 %323, %272
  %325 = add i32 %252, %324
  %326 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 15
  %327 = load i32, i32* %326, align 4
  %328 = add i32 %325, %327
  %329 = add i32 %328, 1236535329
  %330 = lshr i32 %329, 10
  %331 = or i32 %321, %330
  %332 = add i32 %312, %331
  %333 = xor i32 %312, %332
  %334 = and i32 %333, %292
  %335 = xor i32 %334, %312
  %336 = add i32 %272, %335
  %337 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 1
  %338 = load i32, i32* %337, align 4
  %339 = add i32 %336, %338
  %340 = add i32 %339, -165796510
  %341 = shl i32 %340, 5
  %342 = xor i32 %312, %332
  %343 = and i32 %342, %292
  %344 = xor i32 %343, %312
  %345 = add i32 %272, %344
  %346 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 1
  %347 = load i32, i32* %346, align 4
  %348 = add i32 %345, %347
  %349 = add i32 %348, -165796510
  %350 = lshr i32 %349, 27
  %351 = or i32 %341, %350
  %352 = add i32 %332, %351
  %353 = xor i32 %332, %352
  %354 = and i32 %353, %312
  %355 = xor i32 %354, %332
  %356 = add i32 %292, %355
  %357 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 6
  %358 = load i32, i32* %357, align 4
  %359 = add i32 %356, %358
  %360 = add i32 %359, -1069501632
  %361 = shl i32 %360, 9
  %362 = xor i32 %332, %352
  %363 = and i32 %362, %312
  %364 = xor i32 %363, %332
  %365 = add i32 %292, %364
  %366 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 6
  %367 = load i32, i32* %366, align 4
  %368 = add i32 %365, %367
  %369 = add i32 %368, -1069501632
  %370 = lshr i32 %369, 23
  %371 = or i32 %361, %370
  %372 = add i32 %352, %371
  %373 = xor i32 %352, %372
  %374 = and i32 %373, %332
  %375 = xor i32 %374, %352
  %376 = add i32 %312, %375
  %377 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 11
  %378 = load i32, i32* %377, align 4
  %379 = add i32 %376, %378
  %380 = add i32 %379, 643717713
  %381 = shl i32 %380, 14
  %382 = xor i32 %352, %372
  %383 = and i32 %382, %332
  %384 = xor i32 %383, %352
  %385 = add i32 %312, %384
  %386 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 11
  %387 = load i32, i32* %386, align 4
  %388 = add i32 %385, %387
  %389 = add i32 %388, 643717713
  %390 = lshr i32 %389, 18
  %391 = or i32 %381, %390
  %392 = add i32 %372, %391
  %393 = xor i32 %372, %392
  %394 = and i32 %393, %352
  %395 = xor i32 %394, %372
  %396 = add i32 %332, %395
  %397 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 0
  %398 = load i32, i32* %397, align 4
  %399 = add i32 %396, %398
  %400 = add i32 %399, -373897302
  %401 = shl i32 %400, 20
  %402 = xor i32 %372, %392
  %403 = and i32 %402, %352
  %404 = xor i32 %403, %372
  %405 = add i32 %332, %404
  %406 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 0
  %407 = load i32, i32* %406, align 4
  %408 = add i32 %405, %407
  %409 = add i32 %408, -373897302
  %410 = lshr i32 %409, 12
  %411 = or i32 %401, %410
  %412 = add i32 %392, %411
  %413 = xor i32 %392, %412
  %414 = and i32 %413, %372
  %415 = xor i32 %414, %392
  %416 = add i32 %352, %415
  %417 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 5
  %418 = load i32, i32* %417, align 4
  %419 = add i32 %416, %418
  %420 = add i32 %419, -701558691
  %421 = shl i32 %420, 5
  %422 = xor i32 %392, %412
  %423 = and i32 %422, %372
  %424 = xor i32 %423, %392
  %425 = add i32 %352, %424
  %426 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 5
  %427 = load i32, i32* %426, align 4
  %428 = add i32 %425, %427
  %429 = add i32 %428, -701558691
  %430 = lshr i32 %429, 27
  %431 = or i32 %421, %430
  %432 = add i32 %412, %431
  %433 = xor i32 %412, %432
  %434 = and i32 %433, %392
  %435 = xor i32 %434, %412
  %436 = add i32 %372, %435
  %437 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 10
  %438 = load i32, i32* %437, align 4
  %439 = add i32 %436, %438
  %440 = add i32 %439, 38016083
  %441 = shl i32 %440, 9
  %442 = xor i32 %412, %432
  %443 = and i32 %442, %392
  %444 = xor i32 %443, %412
  %445 = add i32 %372, %444
  %446 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 10
  %447 = load i32, i32* %446, align 4
  %448 = add i32 %445, %447
  %449 = add i32 %448, 38016083
  %450 = lshr i32 %449, 23
  %451 = or i32 %441, %450
  %452 = add i32 %432, %451
  %453 = xor i32 %432, %452
  %454 = and i32 %453, %412
  %455 = xor i32 %454, %432
  %456 = add i32 %392, %455
  %457 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 15
  %458 = load i32, i32* %457, align 4
  %459 = add i32 %456, %458
  %460 = add i32 %459, -660478335
  %461 = shl i32 %460, 14
  %462 = xor i32 %432, %452
  %463 = and i32 %462, %412
  %464 = xor i32 %463, %432
  %465 = add i32 %392, %464
  %466 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 15
  %467 = load i32, i32* %466, align 4
  %468 = add i32 %465, %467
  %469 = add i32 %468, -660478335
  %470 = lshr i32 %469, 18
  %471 = or i32 %461, %470
  %472 = add i32 %452, %471
  %473 = xor i32 %452, %472
  %474 = and i32 %473, %432
  %475 = xor i32 %474, %452
  %476 = add i32 %412, %475
  %477 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 4
  %478 = load i32, i32* %477, align 4
  %479 = add i32 %476, %478
  %480 = add i32 %479, -405537848
  %481 = shl i32 %480, 20
  %482 = xor i32 %452, %472
  %483 = and i32 %482, %432
  %484 = xor i32 %483, %452
  %485 = add i32 %412, %484
  %486 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 4
  %487 = load i32, i32* %486, align 4
  %488 = add i32 %485, %487
  %489 = add i32 %488, -405537848
  %490 = lshr i32 %489, 12
  %491 = or i32 %481, %490
  %492 = add i32 %472, %491
  %493 = xor i32 %472, %492
  %494 = and i32 %493, %452
  %495 = xor i32 %494, %472
  %496 = add i32 %432, %495
  %497 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 9
  %498 = load i32, i32* %497, align 4
  %499 = add i32 %496, %498
  %500 = add i32 %499, 568446438
  %501 = shl i32 %500, 5
  %502 = xor i32 %472, %492
  %503 = and i32 %502, %452
  %504 = xor i32 %503, %472
  %505 = add i32 %432, %504
  %506 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 9
  %507 = load i32, i32* %506, align 4
  %508 = add i32 %505, %507
  %509 = add i32 %508, 568446438
  %510 = lshr i32 %509, 27
  %511 = or i32 %501, %510
  %512 = add i32 %492, %511
  %513 = xor i32 %492, %512
  %514 = and i32 %513, %472
  %515 = xor i32 %514, %492
  %516 = add i32 %452, %515
  %517 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 14
  %518 = load i32, i32* %517, align 4
  %519 = add i32 %516, %518
  %520 = add i32 %519, -1019803690
  %521 = shl i32 %520, 9
  %522 = xor i32 %492, %512
  %523 = and i32 %522, %472
  %524 = xor i32 %523, %492
  %525 = add i32 %452, %524
  %526 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 14
  %527 = load i32, i32* %526, align 4
  %528 = add i32 %525, %527
  %529 = add i32 %528, -1019803690
  %530 = lshr i32 %529, 23
  %531 = or i32 %521, %530
  %532 = add i32 %512, %531
  %533 = xor i32 %512, %532
  %534 = and i32 %533, %492
  %535 = xor i32 %534, %512
  %536 = add i32 %472, %535
  %537 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 3
  %538 = load i32, i32* %537, align 4
  %539 = add i32 %536, %538
  %540 = add i32 %539, -187363961
  %541 = shl i32 %540, 14
  %542 = xor i32 %512, %532
  %543 = and i32 %542, %492
  %544 = xor i32 %543, %512
  %545 = add i32 %472, %544
  %546 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 3
  %547 = load i32, i32* %546, align 4
  %548 = add i32 %545, %547
  %549 = add i32 %548, -187363961
  %550 = lshr i32 %549, 18
  %551 = or i32 %541, %550
  %552 = add i32 %532, %551
  %553 = xor i32 %532, %552
  %554 = and i32 %553, %512
  %555 = xor i32 %554, %532
  %556 = add i32 %492, %555
  %557 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 8
  %558 = load i32, i32* %557, align 4
  %559 = add i32 %556, %558
  %560 = add i32 %559, 1163531501
  %561 = shl i32 %560, 20
  %562 = xor i32 %532, %552
  %563 = and i32 %562, %512
  %564 = xor i32 %563, %532
  %565 = add i32 %492, %564
  %566 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 8
  %567 = load i32, i32* %566, align 4
  %568 = add i32 %565, %567
  %569 = add i32 %568, 1163531501
  %570 = lshr i32 %569, 12
  %571 = or i32 %561, %570
  %572 = add i32 %552, %571
  %573 = xor i32 %552, %572
  %574 = and i32 %573, %532
  %575 = xor i32 %574, %552
  %576 = add i32 %512, %575
  %577 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 13
  %578 = load i32, i32* %577, align 4
  %579 = add i32 %576, %578
  %580 = add i32 %579, -1444681467
  %581 = shl i32 %580, 5
  %582 = xor i32 %552, %572
  %583 = and i32 %582, %532
  %584 = xor i32 %583, %552
  %585 = add i32 %512, %584
  %586 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 13
  %587 = load i32, i32* %586, align 4
  %588 = add i32 %585, %587
  %589 = add i32 %588, -1444681467
  %590 = lshr i32 %589, 27
  %591 = or i32 %581, %590
  %592 = add i32 %572, %591
  %593 = xor i32 %572, %592
  %594 = and i32 %593, %552
  %595 = xor i32 %594, %572
  %596 = add i32 %532, %595
  %597 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 2
  %598 = load i32, i32* %597, align 4
  %599 = add i32 %596, %598
  %600 = add i32 %599, -51403784
  %601 = shl i32 %600, 9
  %602 = xor i32 %572, %592
  %603 = and i32 %602, %552
  %604 = xor i32 %603, %572
  %605 = add i32 %532, %604
  %606 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 2
  %607 = load i32, i32* %606, align 4
  %608 = add i32 %605, %607
  %609 = add i32 %608, -51403784
  %610 = lshr i32 %609, 23
  %611 = or i32 %601, %610
  %612 = add i32 %592, %611
  %613 = xor i32 %592, %612
  %614 = and i32 %613, %572
  %615 = xor i32 %614, %592
  %616 = add i32 %552, %615
  %617 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 7
  %618 = load i32, i32* %617, align 4
  %619 = add i32 %616, %618
  %620 = add i32 %619, 1735328473
  %621 = shl i32 %620, 14
  %622 = xor i32 %592, %612
  %623 = and i32 %622, %572
  %624 = xor i32 %623, %592
  %625 = add i32 %552, %624
  %626 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 7
  %627 = load i32, i32* %626, align 4
  %628 = add i32 %625, %627
  %629 = add i32 %628, 1735328473
  %630 = lshr i32 %629, 18
  %631 = or i32 %621, %630
  %632 = add i32 %612, %631
  %633 = xor i32 %612, %632
  %634 = and i32 %633, %592
  %635 = xor i32 %634, %612
  %636 = add i32 %572, %635
  %637 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 12
  %638 = load i32, i32* %637, align 4
  %639 = add i32 %636, %638
  %640 = add i32 %639, -1926607734
  %641 = shl i32 %640, 20
  %642 = xor i32 %612, %632
  %643 = and i32 %642, %592
  %644 = xor i32 %643, %612
  %645 = add i32 %572, %644
  %646 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 12
  %647 = load i32, i32* %646, align 4
  %648 = add i32 %645, %647
  %649 = add i32 %648, -1926607734
  %650 = lshr i32 %649, 12
  %651 = or i32 %641, %650
  %652 = add i32 %632, %651
  %653 = xor i32 %652, %632
  %654 = xor i32 %653, %612
  %655 = add i32 %592, %654
  %656 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 5
  %657 = load i32, i32* %656, align 4
  %658 = add i32 %655, %657
  %659 = add i32 %658, -378558
  %660 = shl i32 %659, 4
  %661 = xor i32 %652, %632
  %662 = xor i32 %661, %612
  %663 = add i32 %592, %662
  %664 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 5
  %665 = load i32, i32* %664, align 4
  %666 = add i32 %663, %665
  %667 = add i32 %666, -378558
  %668 = lshr i32 %667, 28
  %669 = or i32 %660, %668
  %670 = add i32 %652, %669
  %671 = xor i32 %670, %652
  %672 = xor i32 %671, %632
  %673 = add i32 %612, %672
  %674 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 8
  %675 = load i32, i32* %674, align 4
  %676 = add i32 %673, %675
  %677 = add i32 %676, -2022574463
  %678 = shl i32 %677, 11
  %679 = xor i32 %670, %652
  %680 = xor i32 %679, %632
  %681 = add i32 %612, %680
  %682 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 8
  %683 = load i32, i32* %682, align 4
  %684 = add i32 %681, %683
  %685 = add i32 %684, -2022574463
  %686 = lshr i32 %685, 21
  %687 = or i32 %678, %686
  %688 = add i32 %670, %687
  %689 = xor i32 %688, %670
  %690 = xor i32 %689, %652
  %691 = add i32 %632, %690
  %692 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 11
  %693 = load i32, i32* %692, align 4
  %694 = add i32 %691, %693
  %695 = add i32 %694, 1839030562
  %696 = shl i32 %695, 16
  %697 = xor i32 %688, %670
  %698 = xor i32 %697, %652
  %699 = add i32 %632, %698
  %700 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 11
  %701 = load i32, i32* %700, align 4
  %702 = add i32 %699, %701
  %703 = add i32 %702, 1839030562
  %704 = lshr i32 %703, 16
  %705 = or i32 %696, %704
  %706 = add i32 %688, %705
  %707 = xor i32 %706, %688
  %708 = xor i32 %707, %670
  %709 = add i32 %652, %708
  %710 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 14
  %711 = load i32, i32* %710, align 4
  %712 = add i32 %709, %711
  %713 = add i32 %712, -35309556
  %714 = shl i32 %713, 23
  %715 = xor i32 %706, %688
  %716 = xor i32 %715, %670
  %717 = add i32 %652, %716
  %718 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 14
  %719 = load i32, i32* %718, align 4
  %720 = add i32 %717, %719
  %721 = add i32 %720, -35309556
  %722 = lshr i32 %721, 9
  %723 = or i32 %714, %722
  %724 = add i32 %706, %723
  %725 = xor i32 %724, %706
  %726 = xor i32 %725, %688
  %727 = add i32 %670, %726
  %728 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 1
  %729 = load i32, i32* %728, align 4
  %730 = add i32 %727, %729
  %731 = add i32 %730, -1530992060
  %732 = shl i32 %731, 4
  %733 = xor i32 %724, %706
  %734 = xor i32 %733, %688
  %735 = add i32 %670, %734
  %736 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 1
  %737 = load i32, i32* %736, align 4
  %738 = add i32 %735, %737
  %739 = add i32 %738, -1530992060
  %740 = lshr i32 %739, 28
  %741 = or i32 %732, %740
  %742 = add i32 %724, %741
  %743 = xor i32 %742, %724
  %744 = xor i32 %743, %706
  %745 = add i32 %688, %744
  %746 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 4
  %747 = load i32, i32* %746, align 4
  %748 = add i32 %745, %747
  %749 = add i32 %748, 1272893353
  %750 = shl i32 %749, 11
  %751 = xor i32 %742, %724
  %752 = xor i32 %751, %706
  %753 = add i32 %688, %752
  %754 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 4
  %755 = load i32, i32* %754, align 4
  %756 = add i32 %753, %755
  %757 = add i32 %756, 1272893353
  %758 = lshr i32 %757, 21
  %759 = or i32 %750, %758
  %760 = add i32 %742, %759
  %761 = xor i32 %760, %742
  %762 = xor i32 %761, %724
  %763 = add i32 %706, %762
  %764 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 7
  %765 = load i32, i32* %764, align 4
  %766 = add i32 %763, %765
  %767 = add i32 %766, -155497632
  %768 = shl i32 %767, 16
  %769 = xor i32 %760, %742
  %770 = xor i32 %769, %724
  %771 = add i32 %706, %770
  %772 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 7
  %773 = load i32, i32* %772, align 4
  %774 = add i32 %771, %773
  %775 = add i32 %774, -155497632
  %776 = lshr i32 %775, 16
  %777 = or i32 %768, %776
  %778 = add i32 %760, %777
  %779 = xor i32 %778, %760
  %780 = xor i32 %779, %742
  %781 = add i32 %724, %780
  %782 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 10
  %783 = load i32, i32* %782, align 4
  %784 = add i32 %781, %783
  %785 = add i32 %784, -1094730640
  %786 = shl i32 %785, 23
  %787 = xor i32 %778, %760
  %788 = xor i32 %787, %742
  %789 = add i32 %724, %788
  %790 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 10
  %791 = load i32, i32* %790, align 4
  %792 = add i32 %789, %791
  %793 = add i32 %792, -1094730640
  %794 = lshr i32 %793, 9
  %795 = or i32 %786, %794
  %796 = add i32 %778, %795
  %797 = xor i32 %796, %778
  %798 = xor i32 %797, %760
  %799 = add i32 %742, %798
  %800 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 13
  %801 = load i32, i32* %800, align 4
  %802 = add i32 %799, %801
  %803 = add i32 %802, 681279174
  %804 = shl i32 %803, 4
  %805 = xor i32 %796, %778
  %806 = xor i32 %805, %760
  %807 = add i32 %742, %806
  %808 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 13
  %809 = load i32, i32* %808, align 4
  %810 = add i32 %807, %809
  %811 = add i32 %810, 681279174
  %812 = lshr i32 %811, 28
  %813 = or i32 %804, %812
  %814 = add i32 %796, %813
  %815 = xor i32 %814, %796
  %816 = xor i32 %815, %778
  %817 = add i32 %760, %816
  %818 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 0
  %819 = load i32, i32* %818, align 4
  %820 = add i32 %817, %819
  %821 = add i32 %820, -358537222
  %822 = shl i32 %821, 11
  %823 = xor i32 %814, %796
  %824 = xor i32 %823, %778
  %825 = add i32 %760, %824
  %826 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 0
  %827 = load i32, i32* %826, align 4
  %828 = add i32 %825, %827
  %829 = add i32 %828, -358537222
  %830 = lshr i32 %829, 21
  %831 = or i32 %822, %830
  %832 = add i32 %814, %831
  %833 = xor i32 %832, %814
  %834 = xor i32 %833, %796
  %835 = add i32 %778, %834
  %836 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 3
  %837 = load i32, i32* %836, align 4
  %838 = add i32 %835, %837
  %839 = add i32 %838, -722521979
  %840 = shl i32 %839, 16
  %841 = xor i32 %832, %814
  %842 = xor i32 %841, %796
  %843 = add i32 %778, %842
  %844 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 3
  %845 = load i32, i32* %844, align 4
  %846 = add i32 %843, %845
  %847 = add i32 %846, -722521979
  %848 = lshr i32 %847, 16
  %849 = or i32 %840, %848
  %850 = add i32 %832, %849
  %851 = xor i32 %850, %832
  %852 = xor i32 %851, %814
  %853 = add i32 %796, %852
  %854 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 6
  %855 = load i32, i32* %854, align 4
  %856 = add i32 %853, %855
  %857 = add i32 %856, 76029189
  %858 = shl i32 %857, 23
  %859 = xor i32 %850, %832
  %860 = xor i32 %859, %814
  %861 = add i32 %796, %860
  %862 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 6
  %863 = load i32, i32* %862, align 4
  %864 = add i32 %861, %863
  %865 = add i32 %864, 76029189
  %866 = lshr i32 %865, 9
  %867 = or i32 %858, %866
  %868 = add i32 %850, %867
  %869 = xor i32 %868, %850
  %870 = xor i32 %869, %832
  %871 = add i32 %814, %870
  %872 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 9
  %873 = load i32, i32* %872, align 4
  %874 = add i32 %871, %873
  %875 = add i32 %874, -640364487
  %876 = shl i32 %875, 4
  %877 = xor i32 %868, %850
  %878 = xor i32 %877, %832
  %879 = add i32 %814, %878
  %880 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 9
  %881 = load i32, i32* %880, align 4
  %882 = add i32 %879, %881
  %883 = add i32 %882, -640364487
  %884 = lshr i32 %883, 28
  %885 = or i32 %876, %884
  %886 = add i32 %868, %885
  %887 = xor i32 %886, %868
  %888 = xor i32 %887, %850
  %889 = add i32 %832, %888
  %890 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 12
  %891 = load i32, i32* %890, align 4
  %892 = add i32 %889, %891
  %893 = add i32 %892, -421815835
  %894 = shl i32 %893, 11
  %895 = xor i32 %886, %868
  %896 = xor i32 %895, %850
  %897 = add i32 %832, %896
  %898 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 12
  %899 = load i32, i32* %898, align 4
  %900 = add i32 %897, %899
  %901 = add i32 %900, -421815835
  %902 = lshr i32 %901, 21
  %903 = or i32 %894, %902
  %904 = add i32 %886, %903
  %905 = xor i32 %904, %886
  %906 = xor i32 %905, %868
  %907 = add i32 %850, %906
  %908 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 15
  %909 = load i32, i32* %908, align 4
  %910 = add i32 %907, %909
  %911 = add i32 %910, 530742520
  %912 = shl i32 %911, 16
  %913 = xor i32 %904, %886
  %914 = xor i32 %913, %868
  %915 = add i32 %850, %914
  %916 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 15
  %917 = load i32, i32* %916, align 4
  %918 = add i32 %915, %917
  %919 = add i32 %918, 530742520
  %920 = lshr i32 %919, 16
  %921 = or i32 %912, %920
  %922 = add i32 %904, %921
  %923 = xor i32 %922, %904
  %924 = xor i32 %923, %886
  %925 = add i32 %868, %924
  %926 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 2
  %927 = load i32, i32* %926, align 4
  %928 = add i32 %925, %927
  %929 = add i32 %928, -995338651
  %930 = shl i32 %929, 23
  %931 = xor i32 %922, %904
  %932 = xor i32 %931, %886
  %933 = add i32 %868, %932
  %934 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 2
  %935 = load i32, i32* %934, align 4
  %936 = add i32 %933, %935
  %937 = add i32 %936, -995338651
  %938 = lshr i32 %937, 9
  %939 = or i32 %930, %938
  %940 = add i32 %922, %939
  %941 = xor i32 %904, -1
  %942 = or i32 %940, %941
  %943 = xor i32 %922, %942
  %944 = add i32 %886, %943
  %945 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 0
  %946 = load i32, i32* %945, align 4
  %947 = add i32 %944, %946
  %948 = add i32 %947, -198630844
  %949 = shl i32 %948, 6
  %950 = xor i32 %904, -1
  %951 = or i32 %940, %950
  %952 = xor i32 %922, %951
  %953 = add i32 %886, %952
  %954 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 0
  %955 = load i32, i32* %954, align 4
  %956 = add i32 %953, %955
  %957 = add i32 %956, -198630844
  %958 = lshr i32 %957, 26
  %959 = or i32 %949, %958
  %960 = add i32 %940, %959
  %961 = xor i32 %922, -1
  %962 = or i32 %960, %961
  %963 = xor i32 %940, %962
  %964 = add i32 %904, %963
  %965 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 7
  %966 = load i32, i32* %965, align 4
  %967 = add i32 %964, %966
  %968 = add i32 %967, 1126891415
  %969 = shl i32 %968, 10
  %970 = xor i32 %922, -1
  %971 = or i32 %960, %970
  %972 = xor i32 %940, %971
  %973 = add i32 %904, %972
  %974 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 7
  %975 = load i32, i32* %974, align 4
  %976 = add i32 %973, %975
  %977 = add i32 %976, 1126891415
  %978 = lshr i32 %977, 22
  %979 = or i32 %969, %978
  %980 = add i32 %960, %979
  %981 = xor i32 %940, -1
  %982 = or i32 %980, %981
  %983 = xor i32 %960, %982
  %984 = add i32 %922, %983
  %985 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 14
  %986 = load i32, i32* %985, align 4
  %987 = add i32 %984, %986
  %988 = add i32 %987, -1416354905
  %989 = shl i32 %988, 15
  %990 = xor i32 %940, -1
  %991 = or i32 %980, %990
  %992 = xor i32 %960, %991
  %993 = add i32 %922, %992
  %994 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 14
  %995 = load i32, i32* %994, align 4
  %996 = add i32 %993, %995
  %997 = add i32 %996, -1416354905
  %998 = lshr i32 %997, 17
  %999 = or i32 %989, %998
  %1000 = add i32 %980, %999
  %1001 = xor i32 %960, -1
  %1002 = or i32 %1000, %1001
  %1003 = xor i32 %980, %1002
  %1004 = add i32 %940, %1003
  %1005 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 5
  %1006 = load i32, i32* %1005, align 4
  %1007 = add i32 %1004, %1006
  %1008 = add i32 %1007, -57434055
  %1009 = shl i32 %1008, 21
  %1010 = xor i32 %960, -1
  %1011 = or i32 %1000, %1010
  %1012 = xor i32 %980, %1011
  %1013 = add i32 %940, %1012
  %1014 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 5
  %1015 = load i32, i32* %1014, align 4
  %1016 = add i32 %1013, %1015
  %1017 = add i32 %1016, -57434055
  %1018 = lshr i32 %1017, 11
  %1019 = or i32 %1009, %1018
  %1020 = add i32 %1000, %1019
  %1021 = xor i32 %980, -1
  %1022 = or i32 %1020, %1021
  %1023 = xor i32 %1000, %1022
  %1024 = add i32 %960, %1023
  %1025 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 12
  %1026 = load i32, i32* %1025, align 4
  %1027 = add i32 %1024, %1026
  %1028 = add i32 %1027, 1700485571
  %1029 = shl i32 %1028, 6
  %1030 = xor i32 %980, -1
  %1031 = or i32 %1020, %1030
  %1032 = xor i32 %1000, %1031
  %1033 = add i32 %960, %1032
  %1034 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 12
  %1035 = load i32, i32* %1034, align 4
  %1036 = add i32 %1033, %1035
  %1037 = add i32 %1036, 1700485571
  %1038 = lshr i32 %1037, 26
  %1039 = or i32 %1029, %1038
  %1040 = add i32 %1020, %1039
  %1041 = xor i32 %1000, -1
  %1042 = or i32 %1040, %1041
  %1043 = xor i32 %1020, %1042
  %1044 = add i32 %980, %1043
  %1045 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 3
  %1046 = load i32, i32* %1045, align 4
  %1047 = add i32 %1044, %1046
  %1048 = add i32 %1047, -1894986606
  %1049 = shl i32 %1048, 10
  %1050 = xor i32 %1000, -1
  %1051 = or i32 %1040, %1050
  %1052 = xor i32 %1020, %1051
  %1053 = add i32 %980, %1052
  %1054 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 3
  %1055 = load i32, i32* %1054, align 4
  %1056 = add i32 %1053, %1055
  %1057 = add i32 %1056, -1894986606
  %1058 = lshr i32 %1057, 22
  %1059 = or i32 %1049, %1058
  %1060 = add i32 %1040, %1059
  %1061 = xor i32 %1020, -1
  %1062 = or i32 %1060, %1061
  %1063 = xor i32 %1040, %1062
  %1064 = add i32 %1000, %1063
  %1065 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 10
  %1066 = load i32, i32* %1065, align 4
  %1067 = add i32 %1064, %1066
  %1068 = add i32 %1067, -1051523
  %1069 = shl i32 %1068, 15
  %1070 = xor i32 %1020, -1
  %1071 = or i32 %1060, %1070
  %1072 = xor i32 %1040, %1071
  %1073 = add i32 %1000, %1072
  %1074 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 10
  %1075 = load i32, i32* %1074, align 4
  %1076 = add i32 %1073, %1075
  %1077 = add i32 %1076, -1051523
  %1078 = lshr i32 %1077, 17
  %1079 = or i32 %1069, %1078
  %1080 = add i32 %1060, %1079
  %1081 = xor i32 %1040, -1
  %1082 = or i32 %1080, %1081
  %1083 = xor i32 %1060, %1082
  %1084 = add i32 %1020, %1083
  %1085 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 1
  %1086 = load i32, i32* %1085, align 4
  %1087 = add i32 %1084, %1086
  %1088 = add i32 %1087, -2054922799
  %1089 = shl i32 %1088, 21
  %1090 = xor i32 %1040, -1
  %1091 = or i32 %1080, %1090
  %1092 = xor i32 %1060, %1091
  %1093 = add i32 %1020, %1092
  %1094 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 1
  %1095 = load i32, i32* %1094, align 4
  %1096 = add i32 %1093, %1095
  %1097 = add i32 %1096, -2054922799
  %1098 = lshr i32 %1097, 11
  %1099 = or i32 %1089, %1098
  %1100 = add i32 %1080, %1099
  %1101 = xor i32 %1060, -1
  %1102 = or i32 %1100, %1101
  %1103 = xor i32 %1080, %1102
  %1104 = add i32 %1040, %1103
  %1105 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 8
  %1106 = load i32, i32* %1105, align 4
  %1107 = add i32 %1104, %1106
  %1108 = add i32 %1107, 1873313359
  %1109 = shl i32 %1108, 6
  %1110 = xor i32 %1060, -1
  %1111 = or i32 %1100, %1110
  %1112 = xor i32 %1080, %1111
  %1113 = add i32 %1040, %1112
  %1114 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 8
  %1115 = load i32, i32* %1114, align 4
  %1116 = add i32 %1113, %1115
  %1117 = add i32 %1116, 1873313359
  %1118 = lshr i32 %1117, 26
  %1119 = or i32 %1109, %1118
  %1120 = add i32 %1100, %1119
  %1121 = xor i32 %1080, -1
  %1122 = or i32 %1120, %1121
  %1123 = xor i32 %1100, %1122
  %1124 = add i32 %1060, %1123
  %1125 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 15
  %1126 = load i32, i32* %1125, align 4
  %1127 = add i32 %1124, %1126
  %1128 = add i32 %1127, -30611744
  %1129 = shl i32 %1128, 10
  %1130 = xor i32 %1080, -1
  %1131 = or i32 %1120, %1130
  %1132 = xor i32 %1100, %1131
  %1133 = add i32 %1060, %1132
  %1134 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 15
  %1135 = load i32, i32* %1134, align 4
  %1136 = add i32 %1133, %1135
  %1137 = add i32 %1136, -30611744
  %1138 = lshr i32 %1137, 22
  %1139 = or i32 %1129, %1138
  %1140 = add i32 %1120, %1139
  %1141 = xor i32 %1100, -1
  %1142 = or i32 %1140, %1141
  %1143 = xor i32 %1120, %1142
  %1144 = add i32 %1080, %1143
  %1145 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 6
  %1146 = load i32, i32* %1145, align 4
  %1147 = add i32 %1144, %1146
  %1148 = add i32 %1147, -1560198380
  %1149 = shl i32 %1148, 15
  %1150 = xor i32 %1100, -1
  %1151 = or i32 %1140, %1150
  %1152 = xor i32 %1120, %1151
  %1153 = add i32 %1080, %1152
  %1154 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 6
  %1155 = load i32, i32* %1154, align 4
  %1156 = add i32 %1153, %1155
  %1157 = add i32 %1156, -1560198380
  %1158 = lshr i32 %1157, 17
  %1159 = or i32 %1149, %1158
  %1160 = add i32 %1140, %1159
  %1161 = xor i32 %1120, -1
  %1162 = or i32 %1160, %1161
  %1163 = xor i32 %1140, %1162
  %1164 = add i32 %1100, %1163
  %1165 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 13
  %1166 = load i32, i32* %1165, align 4
  %1167 = add i32 %1164, %1166
  %1168 = add i32 %1167, 1309151649
  %1169 = shl i32 %1168, 21
  %1170 = xor i32 %1120, -1
  %1171 = or i32 %1160, %1170
  %1172 = xor i32 %1140, %1171
  %1173 = add i32 %1100, %1172
  %1174 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 13
  %1175 = load i32, i32* %1174, align 4
  %1176 = add i32 %1173, %1175
  %1177 = add i32 %1176, 1309151649
  %1178 = lshr i32 %1177, 11
  %1179 = or i32 %1169, %1178
  %1180 = add i32 %1160, %1179
  %1181 = xor i32 %1140, -1
  %1182 = or i32 %1180, %1181
  %1183 = xor i32 %1160, %1182
  %1184 = add i32 %1120, %1183
  %1185 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 4
  %1186 = load i32, i32* %1185, align 4
  %1187 = add i32 %1184, %1186
  %1188 = add i32 %1187, -145523070
  %1189 = shl i32 %1188, 6
  %1190 = xor i32 %1140, -1
  %1191 = or i32 %1180, %1190
  %1192 = xor i32 %1160, %1191
  %1193 = add i32 %1120, %1192
  %1194 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 4
  %1195 = load i32, i32* %1194, align 4
  %1196 = add i32 %1193, %1195
  %1197 = add i32 %1196, -145523070
  %1198 = lshr i32 %1197, 26
  %1199 = or i32 %1189, %1198
  %1200 = add i32 %1180, %1199
  %1201 = xor i32 %1160, -1
  %1202 = or i32 %1200, %1201
  %1203 = xor i32 %1180, %1202
  %1204 = add i32 %1140, %1203
  %1205 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 11
  %1206 = load i32, i32* %1205, align 4
  %1207 = add i32 %1204, %1206
  %1208 = add i32 %1207, -1120210379
  %1209 = shl i32 %1208, 10
  %1210 = xor i32 %1160, -1
  %1211 = or i32 %1200, %1210
  %1212 = xor i32 %1180, %1211
  %1213 = add i32 %1140, %1212
  %1214 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 11
  %1215 = load i32, i32* %1214, align 4
  %1216 = add i32 %1213, %1215
  %1217 = add i32 %1216, -1120210379
  %1218 = lshr i32 %1217, 22
  %1219 = or i32 %1209, %1218
  %1220 = add i32 %1200, %1219
  %1221 = xor i32 %1180, -1
  %1222 = or i32 %1220, %1221
  %1223 = xor i32 %1200, %1222
  %1224 = add i32 %1160, %1223
  %1225 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 2
  %1226 = load i32, i32* %1225, align 4
  %1227 = add i32 %1224, %1226
  %1228 = add i32 %1227, 718787259
  %1229 = shl i32 %1228, 15
  %1230 = xor i32 %1180, -1
  %1231 = or i32 %1220, %1230
  %1232 = xor i32 %1200, %1231
  %1233 = add i32 %1160, %1232
  %1234 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 2
  %1235 = load i32, i32* %1234, align 4
  %1236 = add i32 %1233, %1235
  %1237 = add i32 %1236, 718787259
  %1238 = lshr i32 %1237, 17
  %1239 = or i32 %1229, %1238
  %1240 = add i32 %1220, %1239
  %1241 = xor i32 %1200, -1
  %1242 = or i32 %1240, %1241
  %1243 = xor i32 %1220, %1242
  %1244 = add i32 %1180, %1243
  %1245 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 9
  %1246 = load i32, i32* %1245, align 4
  %1247 = add i32 %1244, %1246
  %1248 = add i32 %1247, -343485551
  %1249 = shl i32 %1248, 21
  %1250 = xor i32 %1200, -1
  %1251 = or i32 %1240, %1250
  %1252 = xor i32 %1220, %1251
  %1253 = add i32 %1180, %1252
  %1254 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i64 0, i64 9
  %1255 = load i32, i32* %1254, align 4
  %1256 = add i32 %1253, %1255
  %1257 = add i32 %1256, -343485551
  %1258 = lshr i32 %1257, 11
  %1259 = or i32 %1249, %1258
  %1260 = add i32 %1240, %1259
  %1261 = load i32, i32* %1, align 4
  %1262 = add i32 %1261, %1200
  store i32 %1262, i32* %1, align 4
  %1263 = getelementptr inbounds i32, i32* %1, i64 1
  %1264 = load i32, i32* %1263, align 4
  %1265 = add i32 %1264, %1260
  store i32 %1265, i32* %1263, align 4
  %1266 = getelementptr inbounds i32, i32* %1, i64 2
  %1267 = load i32, i32* %1266, align 4
  %1268 = add i32 %1267, %1240
  store i32 %1268, i32* %1266, align 4
  %1269 = getelementptr inbounds i32, i32* %1, i64 3
  %1270 = load i32, i32* %1269, align 4
  %1271 = add i32 %1270, %1220
  store i32 %1271, i32* %1269, align 4
  %shadow = alloca i64
  ret void
}

define internal void @br_enc64le(i8* %0, i64 %N, i64 %1) {
  %3 = bitcast i8* %0 to %union.br_union_u64*
  %4 = bitcast %union.br_union_u64* %3 to i64*
  store i64 %1, i64* %4, align 8
  ret void
}

define void @br_range_enc32le(i8* %0, i64 %N, i32* %1, i64 %N1, i64 %2) {
  %4 = add i64 %2, -1
  %5 = icmp ugt i64 %2, 0
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %xtraiter = and i64 %2, 7
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.preheader.preheader, label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader, %.prol.preheader.preheader
  %.04.prol = phi i8* [ %8, %.prol.preheader ], [ %0, %.prol.preheader.preheader ]
  %.013.prol = phi i32* [ %6, %.prol.preheader ], [ %1, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %6 = getelementptr inbounds i32, i32* %.013.prol, i32 1
  %7 = load i32, i32* %.013.prol, align 4
  call void @br_enc32le(i8* %.04.prol, i64 %N, i32 %7)
  %8 = getelementptr inbounds i8, i8* %.04.prol, i64 4
  %prol.iter.sub = sub nsw i64 %prol.iter, 1
  %prol.iter.cmp = icmp ne i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.preheader, label %.prol.loopexit.loopexit, !llvm.loop !7

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %.04.unr.ph = phi i8* [ %8, %.prol.preheader ]
  %9 = phi i64 [ %N, %.prol.preheader ]
  %.013.unr.ph = phi i32* [ %6, %.prol.preheader ]
  %10 = phi i64 [ %N1, %.prol.preheader ]
  %11 = add i64 %2, -1
  %12 = sub i64 %11, %xtraiter
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.unr = phi i64 [ %4, %.lr.ph ], [ %12, %.prol.loopexit.loopexit ]
  %.04.unr = phi i8* [ %0, %.lr.ph ], [ %.04.unr.ph, %.prol.loopexit.loopexit ]
  %.013.unr = phi i32* [ %1, %.lr.ph ], [ %.013.unr.ph, %.prol.loopexit.loopexit ]
  %13 = icmp ult i64 %4, 7
  br i1 %13, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader
  %14 = phi i64 [ %48, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %.04 = phi i8* [ %47, %.lr.ph.new ], [ %.04.unr, %.lr.ph.new.preheader ]
  %15 = phi i64 [ %N, %.lr.ph.new.preheader ], [ %N, %.lr.ph.new ]
  %.013 = phi i32* [ %45, %.lr.ph.new ], [ %.013.unr, %.lr.ph.new.preheader ]
  %16 = phi i64 [ %N1, %.lr.ph.new.preheader ], [ %N1, %.lr.ph.new ]
  %17 = getelementptr inbounds i32, i32* %.013, i32 1
  %18 = load i32, i32* %.013, align 4
  call void @br_enc32le(i8* %.04, i64 %15, i32 %18)
  %19 = getelementptr inbounds i8, i8* %.04, i64 4
  %20 = add i64 %14, -1
  %21 = getelementptr inbounds i32, i32* %17, i32 1
  %22 = load i32, i32* %17, align 4
  call void @br_enc32le(i8* %19, i64 %15, i32 %22)
  %23 = getelementptr inbounds i8, i8* %19, i64 4
  %24 = add i64 %20, -1
  %25 = getelementptr inbounds i32, i32* %21, i32 1
  %26 = load i32, i32* %21, align 4
  call void @br_enc32le(i8* %23, i64 %15, i32 %26)
  %27 = getelementptr inbounds i8, i8* %23, i64 4
  %28 = add i64 %24, -1
  %29 = getelementptr inbounds i32, i32* %25, i32 1
  %30 = load i32, i32* %25, align 4
  call void @br_enc32le(i8* %27, i64 %15, i32 %30)
  %31 = getelementptr inbounds i8, i8* %27, i64 4
  %32 = add i64 %28, -1
  %33 = getelementptr inbounds i32, i32* %29, i32 1
  %34 = load i32, i32* %29, align 4
  call void @br_enc32le(i8* %31, i64 %15, i32 %34)
  %35 = getelementptr inbounds i8, i8* %31, i64 4
  %36 = add i64 %32, -1
  %37 = getelementptr inbounds i32, i32* %33, i32 1
  %38 = load i32, i32* %33, align 4
  call void @br_enc32le(i8* %35, i64 %15, i32 %38)
  %39 = getelementptr inbounds i8, i8* %35, i64 4
  %40 = add i64 %36, -1
  %41 = getelementptr inbounds i32, i32* %37, i32 1
  %42 = load i32, i32* %37, align 4
  call void @br_enc32le(i8* %39, i64 %15, i32 %42)
  %43 = getelementptr inbounds i8, i8* %39, i64 4
  %44 = add i64 %40, -1
  %45 = getelementptr inbounds i32, i32* %41, i32 1
  %46 = load i32, i32* %41, align 4
  call void @br_enc32le(i8* %43, i64 %15, i32 %46)
  %47 = getelementptr inbounds i8, i8* %43, i64 4
  %48 = add i64 %44, -1
  %49 = icmp ugt i64 %44, 0
  br i1 %49, label %.lr.ph.new, label %._crit_edge.loopexit, !llvm.loop !8

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %3
  ret void
}

define internal void @br_enc32le(i8* %0, i64 %N, i32 %1) {
  %3 = bitcast i8* %0 to %union.br_union_u32*
  %4 = bitcast %union.br_union_u32* %3 to i32*
  store i32 %1, i32* %4, align 4
  ret void
}

define void @br_range_dec32le(i32* %0, i64 %N, i64 %1, i8* %2, i64 %N1, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %4 = call i32 @br_dec32le(i8* %2, i64 %N1, i1 %.cond)
  %5 = getelementptr inbounds i32, i32* %0, i32 1
  %6 = load i1, i1* %out.
  %7 = load i32, i32* %0
  %select.val. = select i1 %6, i32 %4, i32 %7
  store i32 %select.val., i32* %0, align 4
  %8 = getelementptr inbounds i8, i8* %2, i64 4
  %9 = call i32 @br_dec32le(i8* %8, i64 %N1, i1 %.cond)
  %10 = getelementptr inbounds i32, i32* %5, i32 1
  %11 = load i1, i1* %out.
  %12 = sext i32 1 to i64
  %13 = icmp slt i64 %12, %N
  %14 = bitcast i64* %shadow to i32*
  %safe. = or i1 %11, %13
  %select.ptr. = select i1 %safe., i32* %5, i32* %14
  %15 = load i32, i32* %5
  %select.val.2 = select i1 %11, i32 %9, i32 %15
  store i32 %select.val.2, i32* %select.ptr., align 4
  %16 = getelementptr inbounds i8, i8* %8, i64 4
  %17 = call i32 @br_dec32le(i8* %16, i64 %N1, i1 %.cond)
  %18 = getelementptr inbounds i32, i32* %10, i32 1
  %19 = load i1, i1* %out.
  %20 = sext i32 1 to i64
  %21 = icmp slt i64 %20, %N
  %22 = bitcast i64* %shadow to i32*
  %safe.3 = or i1 %19, %21
  %select.ptr.4 = select i1 %safe.3, i32* %10, i32* %22
  %23 = load i32, i32* %10
  %select.val.5 = select i1 %19, i32 %17, i32 %23
  store i32 %select.val.5, i32* %select.ptr.4, align 4
  %24 = getelementptr inbounds i8, i8* %16, i64 4
  %25 = call i32 @br_dec32le(i8* %24, i64 %N1, i1 %.cond)
  %26 = getelementptr inbounds i32, i32* %18, i32 1
  %27 = load i1, i1* %out.
  %28 = sext i32 1 to i64
  %29 = icmp slt i64 %28, %N
  %30 = bitcast i64* %shadow to i32*
  %safe.6 = or i1 %27, %29
  %select.ptr.7 = select i1 %safe.6, i32* %18, i32* %30
  %31 = load i32, i32* %18
  %select.val.8 = select i1 %27, i32 %25, i32 %31
  store i32 %select.val.8, i32* %select.ptr.7, align 4
  %32 = getelementptr inbounds i8, i8* %24, i64 4
  %33 = call i32 @br_dec32le(i8* %32, i64 %N1, i1 %.cond)
  %34 = getelementptr inbounds i32, i32* %26, i32 1
  %35 = load i1, i1* %out.
  %36 = sext i32 1 to i64
  %37 = icmp slt i64 %36, %N
  %38 = bitcast i64* %shadow to i32*
  %safe.9 = or i1 %35, %37
  %select.ptr.10 = select i1 %safe.9, i32* %26, i32* %38
  %39 = load i32, i32* %26
  %select.val.11 = select i1 %35, i32 %33, i32 %39
  store i32 %select.val.11, i32* %select.ptr.10, align 4
  %40 = getelementptr inbounds i8, i8* %32, i64 4
  %41 = call i32 @br_dec32le(i8* %40, i64 %N1, i1 %.cond)
  %42 = getelementptr inbounds i32, i32* %34, i32 1
  %43 = load i1, i1* %out.
  %44 = sext i32 1 to i64
  %45 = icmp slt i64 %44, %N
  %46 = bitcast i64* %shadow to i32*
  %safe.12 = or i1 %43, %45
  %select.ptr.13 = select i1 %safe.12, i32* %34, i32* %46
  %47 = load i32, i32* %34
  %select.val.14 = select i1 %43, i32 %41, i32 %47
  store i32 %select.val.14, i32* %select.ptr.13, align 4
  %48 = getelementptr inbounds i8, i8* %40, i64 4
  %49 = call i32 @br_dec32le(i8* %48, i64 %N1, i1 %.cond)
  %50 = getelementptr inbounds i32, i32* %42, i32 1
  %51 = load i1, i1* %out.
  %52 = sext i32 1 to i64
  %53 = icmp slt i64 %52, %N
  %54 = bitcast i64* %shadow to i32*
  %safe.15 = or i1 %51, %53
  %select.ptr.16 = select i1 %safe.15, i32* %42, i32* %54
  %55 = load i32, i32* %42
  %select.val.17 = select i1 %51, i32 %49, i32 %55
  store i32 %select.val.17, i32* %select.ptr.16, align 4
  %56 = getelementptr inbounds i8, i8* %48, i64 4
  %57 = call i32 @br_dec32le(i8* %56, i64 %N1, i1 %.cond)
  %58 = getelementptr inbounds i32, i32* %50, i32 1
  %59 = load i1, i1* %out.
  %60 = sext i32 1 to i64
  %61 = icmp slt i64 %60, %N
  %62 = bitcast i64* %shadow to i32*
  %safe.18 = or i1 %59, %61
  %select.ptr.19 = select i1 %safe.18, i32* %50, i32* %62
  %63 = load i32, i32* %50
  %select.val.20 = select i1 %59, i32 %57, i32 %63
  store i32 %select.val.20, i32* %select.ptr.19, align 4
  %64 = getelementptr inbounds i8, i8* %56, i64 4
  %65 = call i32 @br_dec32le(i8* %64, i64 %N1, i1 %.cond)
  %66 = getelementptr inbounds i32, i32* %58, i32 1
  %67 = load i1, i1* %out.
  %68 = sext i32 1 to i64
  %69 = icmp slt i64 %68, %N
  %70 = bitcast i64* %shadow to i32*
  %safe.21 = or i1 %67, %69
  %select.ptr.22 = select i1 %safe.21, i32* %58, i32* %70
  %71 = load i32, i32* %58
  %select.val.23 = select i1 %67, i32 %65, i32 %71
  store i32 %select.val.23, i32* %select.ptr.22, align 4
  %72 = getelementptr inbounds i8, i8* %64, i64 4
  %73 = call i32 @br_dec32le(i8* %72, i64 %N1, i1 %.cond)
  %74 = getelementptr inbounds i32, i32* %66, i32 1
  %75 = load i1, i1* %out.
  %76 = sext i32 1 to i64
  %77 = icmp slt i64 %76, %N
  %78 = bitcast i64* %shadow to i32*
  %safe.24 = or i1 %75, %77
  %select.ptr.25 = select i1 %safe.24, i32* %66, i32* %78
  %79 = load i32, i32* %66
  %select.val.26 = select i1 %75, i32 %73, i32 %79
  store i32 %select.val.26, i32* %select.ptr.25, align 4
  %80 = getelementptr inbounds i8, i8* %72, i64 4
  %81 = call i32 @br_dec32le(i8* %80, i64 %N1, i1 %.cond)
  %82 = getelementptr inbounds i32, i32* %74, i32 1
  %83 = load i1, i1* %out.
  %84 = sext i32 1 to i64
  %85 = icmp slt i64 %84, %N
  %86 = bitcast i64* %shadow to i32*
  %safe.27 = or i1 %83, %85
  %select.ptr.28 = select i1 %safe.27, i32* %74, i32* %86
  %87 = load i32, i32* %74
  %select.val.29 = select i1 %83, i32 %81, i32 %87
  store i32 %select.val.29, i32* %select.ptr.28, align 4
  %88 = getelementptr inbounds i8, i8* %80, i64 4
  %89 = call i32 @br_dec32le(i8* %88, i64 %N1, i1 %.cond)
  %90 = getelementptr inbounds i32, i32* %82, i32 1
  %91 = load i1, i1* %out.
  %92 = sext i32 1 to i64
  %93 = icmp slt i64 %92, %N
  %94 = bitcast i64* %shadow to i32*
  %safe.30 = or i1 %91, %93
  %select.ptr.31 = select i1 %safe.30, i32* %82, i32* %94
  %95 = load i32, i32* %82
  %select.val.32 = select i1 %91, i32 %89, i32 %95
  store i32 %select.val.32, i32* %select.ptr.31, align 4
  %96 = getelementptr inbounds i8, i8* %88, i64 4
  %97 = call i32 @br_dec32le(i8* %96, i64 %N1, i1 %.cond)
  %98 = getelementptr inbounds i32, i32* %90, i32 1
  %99 = load i1, i1* %out.
  %100 = sext i32 1 to i64
  %101 = icmp slt i64 %100, %N
  %102 = bitcast i64* %shadow to i32*
  %safe.33 = or i1 %99, %101
  %select.ptr.34 = select i1 %safe.33, i32* %90, i32* %102
  %103 = load i32, i32* %90
  %select.val.35 = select i1 %99, i32 %97, i32 %103
  store i32 %select.val.35, i32* %select.ptr.34, align 4
  %104 = getelementptr inbounds i8, i8* %96, i64 4
  %105 = call i32 @br_dec32le(i8* %104, i64 %N1, i1 %.cond)
  %106 = getelementptr inbounds i32, i32* %98, i32 1
  %107 = load i1, i1* %out.
  %108 = sext i32 1 to i64
  %109 = icmp slt i64 %108, %N
  %110 = bitcast i64* %shadow to i32*
  %safe.36 = or i1 %107, %109
  %select.ptr.37 = select i1 %safe.36, i32* %98, i32* %110
  %111 = load i32, i32* %98
  %select.val.38 = select i1 %107, i32 %105, i32 %111
  store i32 %select.val.38, i32* %select.ptr.37, align 4
  %112 = getelementptr inbounds i8, i8* %104, i64 4
  %113 = call i32 @br_dec32le(i8* %112, i64 %N1, i1 %.cond)
  %114 = getelementptr inbounds i32, i32* %106, i32 1
  %115 = load i1, i1* %out.
  %116 = sext i32 1 to i64
  %117 = icmp slt i64 %116, %N
  %118 = bitcast i64* %shadow to i32*
  %safe.39 = or i1 %115, %117
  %select.ptr.40 = select i1 %safe.39, i32* %106, i32* %118
  %119 = load i32, i32* %106
  %select.val.41 = select i1 %115, i32 %113, i32 %119
  store i32 %select.val.41, i32* %select.ptr.40, align 4
  %120 = getelementptr inbounds i8, i8* %112, i64 4
  %121 = call i32 @br_dec32le(i8* %120, i64 %N1, i1 %.cond)
  %122 = load i1, i1* %out.
  %123 = sext i32 1 to i64
  %124 = icmp slt i64 %123, %N
  %125 = bitcast i64* %shadow to i32*
  %safe.42 = or i1 %122, %124
  %select.ptr.43 = select i1 %safe.42, i32* %114, i32* %125
  %126 = load i32, i32* %114
  %select.val.44 = select i1 %122, i32 %121, i32 %126
  store i32 %select.val.44, i32* %select.ptr.43, align 4
  ret void
}

define internal i32 @br_dec32le(i8* %0, i64 %N, i1 %.cond) {
  %shadow = alloca i64
  %out. = alloca i1
  store i1 %.cond, i1* %out.
  %2 = bitcast i8* %0 to %union.br_union_u32*
  %3 = bitcast %union.br_union_u32* %2 to i32*
  %4 = load i1, i1* %out.
  %5 = load i32, i32* %3, align 4
  ret i32 %5
}

define void @randombytes(i8* %0, i64 %N, i64 %1) {
  %3 = icmp sge i64 %1, 0
  br i1 %3, label %5, label %4

4:                                                ; preds = %2
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.17, i64 0, i64 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__PRETTY_FUNCTION__.randombytes, i64 0, i64 0)) #4
  unreachable

5:                                                ; preds = %2
  %6 = load i32, i32* @randombytes.fd, align 4
  %7 = icmp eq i32 %6, -1
  br i1 %7, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %5
  %8 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %8, i32* @randombytes.fd, align 4
  %9 = load i32, i32* @randombytes.fd, align 4
  %10 = icmp ne i32 %9, -1
  br i1 %10, label %.loopexit, label %.lr.ph7.preheader

.lr.ph7.preheader:                                ; preds = %.preheader
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %106, %.lr.ph7.preheader
  %11 = call i32 @sleep(i32 1)
  %12 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %12, i32* @randombytes.fd, align 4
  %13 = load i32, i32* @randombytes.fd, align 4
  %14 = icmp ne i32 %13, -1
  br i1 %14, label %.loopexit.loopexit, label %76

.loopexit.loopexit:                               ; preds = %106, %101, %96, %91, %86, %81, %76, %.lr.ph7
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %5
  %15 = icmp sgt i64 %1, 0
  br i1 %15, label %.lr.ph.preheader, label %.outer._crit_edge

.lr.ph.preheader:                                 ; preds = %.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.outer, %.lr.ph.preheader
  %16 = phi i1 [ %26, %.outer ], [ %15, %.lr.ph.preheader ]
  %.0.ph6 = phi i8* [ %24, %.outer ], [ %0, %.lr.ph.preheader ]
  %.01.ph5 = phi i64 [ %25, %.outer ], [ %1, %.lr.ph.preheader ]
  br label %17

17:                                               ; preds = %74, %.lr.ph
  %18 = icmp slt i64 %.01.ph5, 1048576
  %.01. = select i1 %18, i64 %.01.ph5, i64 1048576
  %19 = load i32, i32* @randombytes.fd, align 4
  %20 = call i64 @read(i32 %19, i8* %.0.ph6, i64 %.01.)
  %21 = icmp slt i64 %20, 1
  br i1 %21, label %22, label %.outer

22:                                               ; preds = %17
  %23 = call i32 @sleep(i32 1)
  br i1 %16, label %27, label %.outer._crit_edge.loopexit

.outer:                                           ; preds = %69, %62, %55, %48, %41, %34, %27, %17
  %.lcssa = phi i64 [ %20, %17 ], [ %30, %27 ], [ %37, %34 ], [ %44, %41 ], [ %51, %48 ], [ %58, %55 ], [ %65, %62 ], [ %72, %69 ]
  %24 = getelementptr inbounds i8, i8* %.0.ph6, i64 %.lcssa
  %25 = sub nsw i64 %.01.ph5, %.lcssa
  %26 = icmp sgt i64 %25, 0
  br i1 %26, label %.lr.ph, label %.outer._crit_edge.loopexit1

.outer._crit_edge.loopexit:                       ; preds = %74, %67, %60, %53, %46, %39, %32, %22
  br label %.outer._crit_edge

.outer._crit_edge.loopexit1:                      ; preds = %.outer
  br label %.outer._crit_edge

.outer._crit_edge:                                ; preds = %.outer._crit_edge.loopexit1, %.outer._crit_edge.loopexit, %.loopexit
  ret void

27:                                               ; preds = %22
  %28 = icmp slt i64 %.01.ph5, 1048576
  %.01..1 = select i1 %28, i64 %.01.ph5, i64 1048576
  %29 = load i32, i32* @randombytes.fd, align 4
  %30 = call i64 @read(i32 %29, i8* %.0.ph6, i64 %.01..1)
  %31 = icmp slt i64 %30, 1
  br i1 %31, label %32, label %.outer

32:                                               ; preds = %27
  %33 = call i32 @sleep(i32 1)
  br i1 %16, label %34, label %.outer._crit_edge.loopexit

34:                                               ; preds = %32
  %35 = icmp slt i64 %.01.ph5, 1048576
  %.01..2 = select i1 %35, i64 %.01.ph5, i64 1048576
  %36 = load i32, i32* @randombytes.fd, align 4
  %37 = call i64 @read(i32 %36, i8* %.0.ph6, i64 %.01..2)
  %38 = icmp slt i64 %37, 1
  br i1 %38, label %39, label %.outer

39:                                               ; preds = %34
  %40 = call i32 @sleep(i32 1)
  br i1 %16, label %41, label %.outer._crit_edge.loopexit

41:                                               ; preds = %39
  %42 = icmp slt i64 %.01.ph5, 1048576
  %.01..3 = select i1 %42, i64 %.01.ph5, i64 1048576
  %43 = load i32, i32* @randombytes.fd, align 4
  %44 = call i64 @read(i32 %43, i8* %.0.ph6, i64 %.01..3)
  %45 = icmp slt i64 %44, 1
  br i1 %45, label %46, label %.outer

46:                                               ; preds = %41
  %47 = call i32 @sleep(i32 1)
  br i1 %16, label %48, label %.outer._crit_edge.loopexit

48:                                               ; preds = %46
  %49 = icmp slt i64 %.01.ph5, 1048576
  %.01..4 = select i1 %49, i64 %.01.ph5, i64 1048576
  %50 = load i32, i32* @randombytes.fd, align 4
  %51 = call i64 @read(i32 %50, i8* %.0.ph6, i64 %.01..4)
  %52 = icmp slt i64 %51, 1
  br i1 %52, label %53, label %.outer

53:                                               ; preds = %48
  %54 = call i32 @sleep(i32 1)
  br i1 %16, label %55, label %.outer._crit_edge.loopexit

55:                                               ; preds = %53
  %56 = icmp slt i64 %.01.ph5, 1048576
  %.01..5 = select i1 %56, i64 %.01.ph5, i64 1048576
  %57 = load i32, i32* @randombytes.fd, align 4
  %58 = call i64 @read(i32 %57, i8* %.0.ph6, i64 %.01..5)
  %59 = icmp slt i64 %58, 1
  br i1 %59, label %60, label %.outer

60:                                               ; preds = %55
  %61 = call i32 @sleep(i32 1)
  br i1 %16, label %62, label %.outer._crit_edge.loopexit

62:                                               ; preds = %60
  %63 = icmp slt i64 %.01.ph5, 1048576
  %.01..6 = select i1 %63, i64 %.01.ph5, i64 1048576
  %64 = load i32, i32* @randombytes.fd, align 4
  %65 = call i64 @read(i32 %64, i8* %.0.ph6, i64 %.01..6)
  %66 = icmp slt i64 %65, 1
  br i1 %66, label %67, label %.outer

67:                                               ; preds = %62
  %68 = call i32 @sleep(i32 1)
  br i1 %16, label %69, label %.outer._crit_edge.loopexit

69:                                               ; preds = %67
  %70 = icmp slt i64 %.01.ph5, 1048576
  %.01..7 = select i1 %70, i64 %.01.ph5, i64 1048576
  %71 = load i32, i32* @randombytes.fd, align 4
  %72 = call i64 @read(i32 %71, i8* %.0.ph6, i64 %.01..7)
  %73 = icmp slt i64 %72, 1
  br i1 %73, label %74, label %.outer

74:                                               ; preds = %69
  %75 = call i32 @sleep(i32 1)
  br i1 %16, label %17, label %.outer._crit_edge.loopexit, !llvm.loop !9

76:                                               ; preds = %.lr.ph7
  %77 = call i32 @sleep(i32 1)
  %78 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %78, i32* @randombytes.fd, align 4
  %79 = load i32, i32* @randombytes.fd, align 4
  %80 = icmp ne i32 %79, -1
  br i1 %80, label %.loopexit.loopexit, label %81

81:                                               ; preds = %76
  %82 = call i32 @sleep(i32 1)
  %83 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %83, i32* @randombytes.fd, align 4
  %84 = load i32, i32* @randombytes.fd, align 4
  %85 = icmp ne i32 %84, -1
  br i1 %85, label %.loopexit.loopexit, label %86

86:                                               ; preds = %81
  %87 = call i32 @sleep(i32 1)
  %88 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %88, i32* @randombytes.fd, align 4
  %89 = load i32, i32* @randombytes.fd, align 4
  %90 = icmp ne i32 %89, -1
  br i1 %90, label %.loopexit.loopexit, label %91

91:                                               ; preds = %86
  %92 = call i32 @sleep(i32 1)
  %93 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %93, i32* @randombytes.fd, align 4
  %94 = load i32, i32* @randombytes.fd, align 4
  %95 = icmp ne i32 %94, -1
  br i1 %95, label %.loopexit.loopexit, label %96

96:                                               ; preds = %91
  %97 = call i32 @sleep(i32 1)
  %98 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %98, i32* @randombytes.fd, align 4
  %99 = load i32, i32* @randombytes.fd, align 4
  %100 = icmp ne i32 %99, -1
  br i1 %100, label %.loopexit.loopexit, label %101

101:                                              ; preds = %96
  %102 = call i32 @sleep(i32 1)
  %103 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %103, i32* @randombytes.fd, align 4
  %104 = load i32, i32* @randombytes.fd, align 4
  %105 = icmp ne i32 %104, -1
  br i1 %105, label %.loopexit.loopexit, label %106

106:                                              ; preds = %101
  %107 = call i32 @sleep(i32 1)
  %108 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %108, i32* @randombytes.fd, align 4
  %109 = load i32, i32* @randombytes.fd, align 4
  %110 = icmp ne i32 %109, -1
  br i1 %110, label %.loopexit.loopexit, label %.lr.ph7, !llvm.loop !10
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

declare i32 @open(i8*, i32, ...) #2

declare i32 @sleep(i32) #2

declare i64 @read(i32, i8*, i64) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i8 @randombit() #0 {
  %1 = alloca i8, align 1
  store i8 0, i8* %1, align 1
  %2 = sext i32 1 to i64
  call void @randombytes(i8* %1, i64 %2, i64 1)
  %3 = load i8, i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = and i32 %4, 1
  %6 = trunc i32 %5 to i8
  ret i8 %6
}

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 10.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = distinct !{!6, !5}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = distinct !{!9, !5}
!10 = distinct !{!10, !5}

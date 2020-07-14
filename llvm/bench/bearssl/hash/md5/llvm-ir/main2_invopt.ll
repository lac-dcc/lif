; ModuleID = 'bearssl/hash/md5/llvm-ir/main2.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.br_md5_context = type { %struct.br_hash_class_*, [64 x i8], i64, [4 x i32] }
%struct.br_hash_class_ = type { i64, i32, void (%struct.br_hash_class_**)*, void (%struct.br_hash_class_**, i8*, i64)*, void (%struct.br_hash_class_**, i8*)*, i64 (%struct.br_hash_class_**, i8*)*, void (%struct.br_hash_class_**, i8*, i64)* }

@__const.main.input_data = private unnamed_addr constant [16 x i8] c"\F3\\\B3\E3z)O-\F5\89\A3@=5w\A4", align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@key = dso_local local_unnamed_addr global [64 x i32] zeroinitializer, align 16
@chunk_size = dso_local local_unnamed_addr constant i64 16, align 8
@number_measurements = dso_local local_unnamed_addr constant i64 100000, align 8
@ctx = common dso_local global %struct.br_md5_context zeroinitializer, align 8
@br_md5_IV = dso_local local_unnamed_addr constant [4 x i32] [i32 1732584193, i32 -271733879, i32 -1732584194, i32 271733878], align 16
@br_md5_vtable = dso_local constant %struct.br_hash_class_ { i64 96, i32 319295489, void (%struct.br_hash_class_**)* bitcast (void (%struct.br_md5_context*, i64)* @br_md5_init to void (%struct.br_hash_class_**)*), void (%struct.br_hash_class_**, i8*, i64)* bitcast (void (%struct.br_md5_context*, i64, i8*, i64, i64)* @br_md5_update to void (%struct.br_hash_class_**, i8*, i64)*), void (%struct.br_hash_class_**, i8*)* bitcast (void (%struct.br_md5_context*, i64, i8*, i64)* @br_md5_out to void (%struct.br_hash_class_**, i8*)*), i64 (%struct.br_hash_class_**, i8*)* bitcast (i64 (%struct.br_md5_context*, i64, i8*, i64)* @br_md5_state to i64 (%struct.br_hash_class_**, i8*)*), void (%struct.br_hash_class_**, i8*, i64)* bitcast (void (%struct.br_md5_context*, i64, i8*, i64, i64)* @br_md5_set_state to void (%struct.br_hash_class_**, i8*, i64)*) }, align 8
@.str.17 = private unnamed_addr constant [10 x i8] c"xlen >= 0\00", align 1
@.str.1 = private unnamed_addr constant [34 x i8] c"bearssl/hash/md5/sources/random.c\00", align 1
@__PRETTY_FUNCTION__.randombytes = private unnamed_addr constant [36 x i8] c"void randombytes(uint8_t *, size_t)\00", align 1
@randombytes.fd = internal unnamed_addr global i32 -1, align 4
@.str.2 = private unnamed_addr constant [13 x i8] c"/dev/urandom\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [16 x i8], align 16
  call void @init_dut()
  %2 = getelementptr inbounds [16 x i8], [16 x i8]* %1, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(16) %2, i8* nonnull align 16 dereferenceable(16) getelementptr inbounds ([16 x i8], [16 x i8]* @__const.main.input_data, i64 0, i64 0), i64 16, i1 false)
  %3 = call i8 @do_one_computation(i8* nonnull %2, i64 16) #3
  %4 = zext i8 %3 to i32
  %5 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %4)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
define i8 @do_one_computation(i8* nocapture readonly %0, i64 %N) local_unnamed_addr #3 {
  %2 = alloca [64 x i32], align 16
  %3 = bitcast [64 x i32]* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(256) %3, i8 0, i64 256, i1 false)
  %4 = getelementptr inbounds [64 x i32], [64 x i32]* %2, i64 0, i64 0
  store i32 10, i32* %4, align 16
  call void @br_md5_round(i8* %0, i64 %N, i32* nonnull %4, i64 undef)
  call void @br_md5_update(%struct.br_md5_context* nonnull @ctx, i64 1, i8* %0, i64 undef, i64 32)
  %5 = load i8, i8* %0, align 1
  ret i8 %5
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @init_dut() local_unnamed_addr #0 {
  call void @br_md5_init(%struct.br_md5_context* nonnull @ctx, i64 undef) #3
  ret void
}

define void @prepare_inputs(i8* %0, i64 %N, i8* %1, i64 %N1) local_unnamed_addr {
  call void @randombytes(i8* %0, i64 undef, i64 1600000)
  br label %3

3:                                                ; preds = %10003, %2
  %.01 = phi i64 [ 0, %2 ], [ %10004, %10003 ]
  %4 = call zeroext i8 @randombit()
  %5 = getelementptr inbounds i8, i8* %1, i64 %.01
  store i8 %4, i8* %5, align 1
  %6 = icmp eq i8 %4, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %3
  %8 = shl nuw nsw i64 %.01, 4
  %9 = getelementptr inbounds i8, i8* %0, i64 %8
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9, i8 0, i64 16, i1 false)
  br label %10

10:                                               ; preds = %7, %3
  %11 = or i64 %.01, 1
  %12 = call zeroext i8 @randombit()
  %13 = getelementptr inbounds i8, i8* %1, i64 %11
  store i8 %12, i8* %13, align 1
  %14 = icmp eq i8 %12, 0
  br i1 %14, label %16, label %19

15:                                               ; preds = %10003
  ret void

16:                                               ; preds = %10
  %17 = shl nuw nsw i64 %11, 4
  %18 = getelementptr inbounds i8, i8* %0, i64 %17
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %18, i8 0, i64 16, i1 false)
  br label %19

19:                                               ; preds = %16, %10
  %20 = add nuw nsw i64 %.01, 2
  %21 = call zeroext i8 @randombit()
  %22 = getelementptr inbounds i8, i8* %1, i64 %20
  store i8 %21, i8* %22, align 1
  %23 = icmp eq i8 %21, 0
  br i1 %23, label %24, label %27

24:                                               ; preds = %19
  %25 = shl nuw nsw i64 %20, 4
  %26 = getelementptr inbounds i8, i8* %0, i64 %25
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %26, i8 0, i64 16, i1 false)
  br label %27

27:                                               ; preds = %24, %19
  %28 = add nuw nsw i64 %.01, 3
  %29 = call zeroext i8 @randombit()
  %30 = getelementptr inbounds i8, i8* %1, i64 %28
  store i8 %29, i8* %30, align 1
  %31 = icmp eq i8 %29, 0
  br i1 %31, label %32, label %35

32:                                               ; preds = %27
  %33 = shl nuw nsw i64 %28, 4
  %34 = getelementptr inbounds i8, i8* %0, i64 %33
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %34, i8 0, i64 16, i1 false)
  br label %35

35:                                               ; preds = %32, %27
  %36 = add nuw nsw i64 %.01, 4
  %37 = call zeroext i8 @randombit()
  %38 = getelementptr inbounds i8, i8* %1, i64 %36
  store i8 %37, i8* %38, align 1
  %39 = icmp eq i8 %37, 0
  br i1 %39, label %40, label %43

40:                                               ; preds = %35
  %41 = shl nuw nsw i64 %36, 4
  %42 = getelementptr inbounds i8, i8* %0, i64 %41
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %42, i8 0, i64 16, i1 false)
  br label %43

43:                                               ; preds = %40, %35
  %44 = add nuw nsw i64 %.01, 5
  %45 = call zeroext i8 @randombit()
  %46 = getelementptr inbounds i8, i8* %1, i64 %44
  store i8 %45, i8* %46, align 1
  %47 = icmp eq i8 %45, 0
  br i1 %47, label %48, label %51

48:                                               ; preds = %43
  %49 = shl nuw nsw i64 %44, 4
  %50 = getelementptr inbounds i8, i8* %0, i64 %49
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %50, i8 0, i64 16, i1 false)
  br label %51

51:                                               ; preds = %48, %43
  %52 = add nuw nsw i64 %.01, 6
  %53 = call zeroext i8 @randombit()
  %54 = getelementptr inbounds i8, i8* %1, i64 %52
  store i8 %53, i8* %54, align 1
  %55 = icmp eq i8 %53, 0
  br i1 %55, label %56, label %59

56:                                               ; preds = %51
  %57 = shl nuw nsw i64 %52, 4
  %58 = getelementptr inbounds i8, i8* %0, i64 %57
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %58, i8 0, i64 16, i1 false)
  br label %59

59:                                               ; preds = %56, %51
  %60 = add nuw nsw i64 %.01, 7
  %61 = call zeroext i8 @randombit()
  %62 = getelementptr inbounds i8, i8* %1, i64 %60
  store i8 %61, i8* %62, align 1
  %63 = icmp eq i8 %61, 0
  br i1 %63, label %64, label %67

64:                                               ; preds = %59
  %65 = shl nuw nsw i64 %60, 4
  %66 = getelementptr inbounds i8, i8* %0, i64 %65
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %66, i8 0, i64 16, i1 false)
  br label %67

67:                                               ; preds = %64, %59
  %68 = add nuw nsw i64 %.01, 8
  %69 = call zeroext i8 @randombit()
  %70 = getelementptr inbounds i8, i8* %1, i64 %68
  store i8 %69, i8* %70, align 1
  %71 = icmp eq i8 %69, 0
  br i1 %71, label %72, label %75

72:                                               ; preds = %67
  %73 = shl nuw nsw i64 %68, 4
  %74 = getelementptr inbounds i8, i8* %0, i64 %73
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %74, i8 0, i64 16, i1 false)
  br label %75

75:                                               ; preds = %72, %67
  %76 = add nuw nsw i64 %.01, 9
  %77 = call zeroext i8 @randombit()
  %78 = getelementptr inbounds i8, i8* %1, i64 %76
  store i8 %77, i8* %78, align 1
  %79 = icmp eq i8 %77, 0
  br i1 %79, label %80, label %83

80:                                               ; preds = %75
  %81 = shl nuw nsw i64 %76, 4
  %82 = getelementptr inbounds i8, i8* %0, i64 %81
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %82, i8 0, i64 16, i1 false)
  br label %83

83:                                               ; preds = %80, %75
  %84 = add nuw nsw i64 %.01, 10
  %85 = call zeroext i8 @randombit()
  %86 = getelementptr inbounds i8, i8* %1, i64 %84
  store i8 %85, i8* %86, align 1
  %87 = icmp eq i8 %85, 0
  br i1 %87, label %88, label %91

88:                                               ; preds = %83
  %89 = shl nuw nsw i64 %84, 4
  %90 = getelementptr inbounds i8, i8* %0, i64 %89
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %90, i8 0, i64 16, i1 false)
  br label %91

91:                                               ; preds = %88, %83
  %92 = add nuw nsw i64 %.01, 11
  %93 = call zeroext i8 @randombit()
  %94 = getelementptr inbounds i8, i8* %1, i64 %92
  store i8 %93, i8* %94, align 1
  %95 = icmp eq i8 %93, 0
  br i1 %95, label %96, label %99

96:                                               ; preds = %91
  %97 = shl nuw nsw i64 %92, 4
  %98 = getelementptr inbounds i8, i8* %0, i64 %97
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %98, i8 0, i64 16, i1 false)
  br label %99

99:                                               ; preds = %96, %91
  %100 = add nuw nsw i64 %.01, 12
  %101 = call zeroext i8 @randombit()
  %102 = getelementptr inbounds i8, i8* %1, i64 %100
  store i8 %101, i8* %102, align 1
  %103 = icmp eq i8 %101, 0
  br i1 %103, label %104, label %107

104:                                              ; preds = %99
  %105 = shl nuw nsw i64 %100, 4
  %106 = getelementptr inbounds i8, i8* %0, i64 %105
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %106, i8 0, i64 16, i1 false)
  br label %107

107:                                              ; preds = %104, %99
  %108 = add nuw nsw i64 %.01, 13
  %109 = call zeroext i8 @randombit()
  %110 = getelementptr inbounds i8, i8* %1, i64 %108
  store i8 %109, i8* %110, align 1
  %111 = icmp eq i8 %109, 0
  br i1 %111, label %112, label %115

112:                                              ; preds = %107
  %113 = shl nuw nsw i64 %108, 4
  %114 = getelementptr inbounds i8, i8* %0, i64 %113
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %114, i8 0, i64 16, i1 false)
  br label %115

115:                                              ; preds = %112, %107
  %116 = add nuw nsw i64 %.01, 14
  %117 = call zeroext i8 @randombit()
  %118 = getelementptr inbounds i8, i8* %1, i64 %116
  store i8 %117, i8* %118, align 1
  %119 = icmp eq i8 %117, 0
  br i1 %119, label %120, label %123

120:                                              ; preds = %115
  %121 = shl nuw nsw i64 %116, 4
  %122 = getelementptr inbounds i8, i8* %0, i64 %121
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %122, i8 0, i64 16, i1 false)
  br label %123

123:                                              ; preds = %120, %115
  %124 = add nuw nsw i64 %.01, 15
  %125 = call zeroext i8 @randombit()
  %126 = getelementptr inbounds i8, i8* %1, i64 %124
  store i8 %125, i8* %126, align 1
  %127 = icmp eq i8 %125, 0
  br i1 %127, label %128, label %131

128:                                              ; preds = %123
  %129 = shl nuw nsw i64 %124, 4
  %130 = getelementptr inbounds i8, i8* %0, i64 %129
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %130, i8 0, i64 16, i1 false)
  br label %131

131:                                              ; preds = %128, %123
  %132 = add nuw nsw i64 %.01, 16
  %133 = call zeroext i8 @randombit()
  %134 = getelementptr inbounds i8, i8* %1, i64 %132
  store i8 %133, i8* %134, align 1
  %135 = icmp eq i8 %133, 0
  br i1 %135, label %136, label %139

136:                                              ; preds = %131
  %137 = shl nuw nsw i64 %132, 4
  %138 = getelementptr inbounds i8, i8* %0, i64 %137
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %138, i8 0, i64 16, i1 false)
  br label %139

139:                                              ; preds = %136, %131
  %140 = add nuw nsw i64 %.01, 17
  %141 = call zeroext i8 @randombit()
  %142 = getelementptr inbounds i8, i8* %1, i64 %140
  store i8 %141, i8* %142, align 1
  %143 = icmp eq i8 %141, 0
  br i1 %143, label %144, label %147

144:                                              ; preds = %139
  %145 = shl nuw nsw i64 %140, 4
  %146 = getelementptr inbounds i8, i8* %0, i64 %145
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %146, i8 0, i64 16, i1 false)
  br label %147

147:                                              ; preds = %144, %139
  %148 = add nuw nsw i64 %.01, 18
  %149 = call zeroext i8 @randombit()
  %150 = getelementptr inbounds i8, i8* %1, i64 %148
  store i8 %149, i8* %150, align 1
  %151 = icmp eq i8 %149, 0
  br i1 %151, label %152, label %155

152:                                              ; preds = %147
  %153 = shl nuw nsw i64 %148, 4
  %154 = getelementptr inbounds i8, i8* %0, i64 %153
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %154, i8 0, i64 16, i1 false)
  br label %155

155:                                              ; preds = %152, %147
  %156 = add nuw nsw i64 %.01, 19
  %157 = call zeroext i8 @randombit()
  %158 = getelementptr inbounds i8, i8* %1, i64 %156
  store i8 %157, i8* %158, align 1
  %159 = icmp eq i8 %157, 0
  br i1 %159, label %160, label %163

160:                                              ; preds = %155
  %161 = shl nuw nsw i64 %156, 4
  %162 = getelementptr inbounds i8, i8* %0, i64 %161
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %162, i8 0, i64 16, i1 false)
  br label %163

163:                                              ; preds = %160, %155
  %164 = add nuw nsw i64 %.01, 20
  %165 = call zeroext i8 @randombit()
  %166 = getelementptr inbounds i8, i8* %1, i64 %164
  store i8 %165, i8* %166, align 1
  %167 = icmp eq i8 %165, 0
  br i1 %167, label %168, label %171

168:                                              ; preds = %163
  %169 = shl nuw nsw i64 %164, 4
  %170 = getelementptr inbounds i8, i8* %0, i64 %169
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %170, i8 0, i64 16, i1 false)
  br label %171

171:                                              ; preds = %168, %163
  %172 = add nuw nsw i64 %.01, 21
  %173 = call zeroext i8 @randombit()
  %174 = getelementptr inbounds i8, i8* %1, i64 %172
  store i8 %173, i8* %174, align 1
  %175 = icmp eq i8 %173, 0
  br i1 %175, label %176, label %179

176:                                              ; preds = %171
  %177 = shl nuw nsw i64 %172, 4
  %178 = getelementptr inbounds i8, i8* %0, i64 %177
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %178, i8 0, i64 16, i1 false)
  br label %179

179:                                              ; preds = %176, %171
  %180 = add nuw nsw i64 %.01, 22
  %181 = call zeroext i8 @randombit()
  %182 = getelementptr inbounds i8, i8* %1, i64 %180
  store i8 %181, i8* %182, align 1
  %183 = icmp eq i8 %181, 0
  br i1 %183, label %184, label %187

184:                                              ; preds = %179
  %185 = shl nuw nsw i64 %180, 4
  %186 = getelementptr inbounds i8, i8* %0, i64 %185
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %186, i8 0, i64 16, i1 false)
  br label %187

187:                                              ; preds = %184, %179
  %188 = add nuw nsw i64 %.01, 23
  %189 = call zeroext i8 @randombit()
  %190 = getelementptr inbounds i8, i8* %1, i64 %188
  store i8 %189, i8* %190, align 1
  %191 = icmp eq i8 %189, 0
  br i1 %191, label %192, label %195

192:                                              ; preds = %187
  %193 = shl nuw nsw i64 %188, 4
  %194 = getelementptr inbounds i8, i8* %0, i64 %193
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %194, i8 0, i64 16, i1 false)
  br label %195

195:                                              ; preds = %192, %187
  %196 = add nuw nsw i64 %.01, 24
  %197 = call zeroext i8 @randombit()
  %198 = getelementptr inbounds i8, i8* %1, i64 %196
  store i8 %197, i8* %198, align 1
  %199 = icmp eq i8 %197, 0
  br i1 %199, label %200, label %203

200:                                              ; preds = %195
  %201 = shl nuw nsw i64 %196, 4
  %202 = getelementptr inbounds i8, i8* %0, i64 %201
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %202, i8 0, i64 16, i1 false)
  br label %203

203:                                              ; preds = %200, %195
  %204 = add nuw nsw i64 %.01, 25
  %205 = call zeroext i8 @randombit()
  %206 = getelementptr inbounds i8, i8* %1, i64 %204
  store i8 %205, i8* %206, align 1
  %207 = icmp eq i8 %205, 0
  br i1 %207, label %208, label %211

208:                                              ; preds = %203
  %209 = shl nuw nsw i64 %204, 4
  %210 = getelementptr inbounds i8, i8* %0, i64 %209
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %210, i8 0, i64 16, i1 false)
  br label %211

211:                                              ; preds = %208, %203
  %212 = add nuw nsw i64 %.01, 26
  %213 = call zeroext i8 @randombit()
  %214 = getelementptr inbounds i8, i8* %1, i64 %212
  store i8 %213, i8* %214, align 1
  %215 = icmp eq i8 %213, 0
  br i1 %215, label %216, label %219

216:                                              ; preds = %211
  %217 = shl nuw nsw i64 %212, 4
  %218 = getelementptr inbounds i8, i8* %0, i64 %217
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %218, i8 0, i64 16, i1 false)
  br label %219

219:                                              ; preds = %216, %211
  %220 = add nuw nsw i64 %.01, 27
  %221 = call zeroext i8 @randombit()
  %222 = getelementptr inbounds i8, i8* %1, i64 %220
  store i8 %221, i8* %222, align 1
  %223 = icmp eq i8 %221, 0
  br i1 %223, label %224, label %227

224:                                              ; preds = %219
  %225 = shl nuw nsw i64 %220, 4
  %226 = getelementptr inbounds i8, i8* %0, i64 %225
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %226, i8 0, i64 16, i1 false)
  br label %227

227:                                              ; preds = %224, %219
  %228 = add nuw nsw i64 %.01, 28
  %229 = call zeroext i8 @randombit()
  %230 = getelementptr inbounds i8, i8* %1, i64 %228
  store i8 %229, i8* %230, align 1
  %231 = icmp eq i8 %229, 0
  br i1 %231, label %232, label %235

232:                                              ; preds = %227
  %233 = shl nuw nsw i64 %228, 4
  %234 = getelementptr inbounds i8, i8* %0, i64 %233
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %234, i8 0, i64 16, i1 false)
  br label %235

235:                                              ; preds = %232, %227
  %236 = add nuw nsw i64 %.01, 29
  %237 = call zeroext i8 @randombit()
  %238 = getelementptr inbounds i8, i8* %1, i64 %236
  store i8 %237, i8* %238, align 1
  %239 = icmp eq i8 %237, 0
  br i1 %239, label %240, label %243

240:                                              ; preds = %235
  %241 = shl nuw nsw i64 %236, 4
  %242 = getelementptr inbounds i8, i8* %0, i64 %241
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %242, i8 0, i64 16, i1 false)
  br label %243

243:                                              ; preds = %240, %235
  %244 = add nuw nsw i64 %.01, 30
  %245 = call zeroext i8 @randombit()
  %246 = getelementptr inbounds i8, i8* %1, i64 %244
  store i8 %245, i8* %246, align 1
  %247 = icmp eq i8 %245, 0
  br i1 %247, label %248, label %251

248:                                              ; preds = %243
  %249 = shl nuw nsw i64 %244, 4
  %250 = getelementptr inbounds i8, i8* %0, i64 %249
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %250, i8 0, i64 16, i1 false)
  br label %251

251:                                              ; preds = %248, %243
  %252 = add nuw nsw i64 %.01, 31
  %253 = call zeroext i8 @randombit()
  %254 = getelementptr inbounds i8, i8* %1, i64 %252
  store i8 %253, i8* %254, align 1
  %255 = icmp eq i8 %253, 0
  br i1 %255, label %256, label %259

256:                                              ; preds = %251
  %257 = shl nuw nsw i64 %252, 4
  %258 = getelementptr inbounds i8, i8* %0, i64 %257
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %258, i8 0, i64 16, i1 false)
  br label %259

259:                                              ; preds = %256, %251
  %260 = add nuw nsw i64 %.01, 32
  %261 = call zeroext i8 @randombit()
  %262 = getelementptr inbounds i8, i8* %1, i64 %260
  store i8 %261, i8* %262, align 1
  %263 = icmp eq i8 %261, 0
  br i1 %263, label %264, label %267

264:                                              ; preds = %259
  %265 = shl nuw nsw i64 %260, 4
  %266 = getelementptr inbounds i8, i8* %0, i64 %265
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %266, i8 0, i64 16, i1 false)
  br label %267

267:                                              ; preds = %264, %259
  %268 = add nuw nsw i64 %.01, 33
  %269 = call zeroext i8 @randombit()
  %270 = getelementptr inbounds i8, i8* %1, i64 %268
  store i8 %269, i8* %270, align 1
  %271 = icmp eq i8 %269, 0
  br i1 %271, label %272, label %275

272:                                              ; preds = %267
  %273 = shl nuw nsw i64 %268, 4
  %274 = getelementptr inbounds i8, i8* %0, i64 %273
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %274, i8 0, i64 16, i1 false)
  br label %275

275:                                              ; preds = %272, %267
  %276 = add nuw nsw i64 %.01, 34
  %277 = call zeroext i8 @randombit()
  %278 = getelementptr inbounds i8, i8* %1, i64 %276
  store i8 %277, i8* %278, align 1
  %279 = icmp eq i8 %277, 0
  br i1 %279, label %280, label %283

280:                                              ; preds = %275
  %281 = shl nuw nsw i64 %276, 4
  %282 = getelementptr inbounds i8, i8* %0, i64 %281
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %282, i8 0, i64 16, i1 false)
  br label %283

283:                                              ; preds = %280, %275
  %284 = add nuw nsw i64 %.01, 35
  %285 = call zeroext i8 @randombit()
  %286 = getelementptr inbounds i8, i8* %1, i64 %284
  store i8 %285, i8* %286, align 1
  %287 = icmp eq i8 %285, 0
  br i1 %287, label %288, label %291

288:                                              ; preds = %283
  %289 = shl nuw nsw i64 %284, 4
  %290 = getelementptr inbounds i8, i8* %0, i64 %289
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %290, i8 0, i64 16, i1 false)
  br label %291

291:                                              ; preds = %288, %283
  %292 = add nuw nsw i64 %.01, 36
  %293 = call zeroext i8 @randombit()
  %294 = getelementptr inbounds i8, i8* %1, i64 %292
  store i8 %293, i8* %294, align 1
  %295 = icmp eq i8 %293, 0
  br i1 %295, label %296, label %299

296:                                              ; preds = %291
  %297 = shl nuw nsw i64 %292, 4
  %298 = getelementptr inbounds i8, i8* %0, i64 %297
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %298, i8 0, i64 16, i1 false)
  br label %299

299:                                              ; preds = %296, %291
  %300 = add nuw nsw i64 %.01, 37
  %301 = call zeroext i8 @randombit()
  %302 = getelementptr inbounds i8, i8* %1, i64 %300
  store i8 %301, i8* %302, align 1
  %303 = icmp eq i8 %301, 0
  br i1 %303, label %304, label %307

304:                                              ; preds = %299
  %305 = shl nuw nsw i64 %300, 4
  %306 = getelementptr inbounds i8, i8* %0, i64 %305
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %306, i8 0, i64 16, i1 false)
  br label %307

307:                                              ; preds = %304, %299
  %308 = add nuw nsw i64 %.01, 38
  %309 = call zeroext i8 @randombit()
  %310 = getelementptr inbounds i8, i8* %1, i64 %308
  store i8 %309, i8* %310, align 1
  %311 = icmp eq i8 %309, 0
  br i1 %311, label %312, label %315

312:                                              ; preds = %307
  %313 = shl nuw nsw i64 %308, 4
  %314 = getelementptr inbounds i8, i8* %0, i64 %313
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %314, i8 0, i64 16, i1 false)
  br label %315

315:                                              ; preds = %312, %307
  %316 = add nuw nsw i64 %.01, 39
  %317 = call zeroext i8 @randombit()
  %318 = getelementptr inbounds i8, i8* %1, i64 %316
  store i8 %317, i8* %318, align 1
  %319 = icmp eq i8 %317, 0
  br i1 %319, label %320, label %323

320:                                              ; preds = %315
  %321 = shl nuw nsw i64 %316, 4
  %322 = getelementptr inbounds i8, i8* %0, i64 %321
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %322, i8 0, i64 16, i1 false)
  br label %323

323:                                              ; preds = %320, %315
  %324 = add nuw nsw i64 %.01, 40
  %325 = call zeroext i8 @randombit()
  %326 = getelementptr inbounds i8, i8* %1, i64 %324
  store i8 %325, i8* %326, align 1
  %327 = icmp eq i8 %325, 0
  br i1 %327, label %328, label %331

328:                                              ; preds = %323
  %329 = shl nuw nsw i64 %324, 4
  %330 = getelementptr inbounds i8, i8* %0, i64 %329
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %330, i8 0, i64 16, i1 false)
  br label %331

331:                                              ; preds = %328, %323
  %332 = add nuw nsw i64 %.01, 41
  %333 = call zeroext i8 @randombit()
  %334 = getelementptr inbounds i8, i8* %1, i64 %332
  store i8 %333, i8* %334, align 1
  %335 = icmp eq i8 %333, 0
  br i1 %335, label %336, label %339

336:                                              ; preds = %331
  %337 = shl nuw nsw i64 %332, 4
  %338 = getelementptr inbounds i8, i8* %0, i64 %337
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %338, i8 0, i64 16, i1 false)
  br label %339

339:                                              ; preds = %336, %331
  %340 = add nuw nsw i64 %.01, 42
  %341 = call zeroext i8 @randombit()
  %342 = getelementptr inbounds i8, i8* %1, i64 %340
  store i8 %341, i8* %342, align 1
  %343 = icmp eq i8 %341, 0
  br i1 %343, label %344, label %347

344:                                              ; preds = %339
  %345 = shl nuw nsw i64 %340, 4
  %346 = getelementptr inbounds i8, i8* %0, i64 %345
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %346, i8 0, i64 16, i1 false)
  br label %347

347:                                              ; preds = %344, %339
  %348 = add nuw nsw i64 %.01, 43
  %349 = call zeroext i8 @randombit()
  %350 = getelementptr inbounds i8, i8* %1, i64 %348
  store i8 %349, i8* %350, align 1
  %351 = icmp eq i8 %349, 0
  br i1 %351, label %352, label %355

352:                                              ; preds = %347
  %353 = shl nuw nsw i64 %348, 4
  %354 = getelementptr inbounds i8, i8* %0, i64 %353
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %354, i8 0, i64 16, i1 false)
  br label %355

355:                                              ; preds = %352, %347
  %356 = add nuw nsw i64 %.01, 44
  %357 = call zeroext i8 @randombit()
  %358 = getelementptr inbounds i8, i8* %1, i64 %356
  store i8 %357, i8* %358, align 1
  %359 = icmp eq i8 %357, 0
  br i1 %359, label %360, label %363

360:                                              ; preds = %355
  %361 = shl nuw nsw i64 %356, 4
  %362 = getelementptr inbounds i8, i8* %0, i64 %361
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %362, i8 0, i64 16, i1 false)
  br label %363

363:                                              ; preds = %360, %355
  %364 = add nuw nsw i64 %.01, 45
  %365 = call zeroext i8 @randombit()
  %366 = getelementptr inbounds i8, i8* %1, i64 %364
  store i8 %365, i8* %366, align 1
  %367 = icmp eq i8 %365, 0
  br i1 %367, label %368, label %371

368:                                              ; preds = %363
  %369 = shl nuw nsw i64 %364, 4
  %370 = getelementptr inbounds i8, i8* %0, i64 %369
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %370, i8 0, i64 16, i1 false)
  br label %371

371:                                              ; preds = %368, %363
  %372 = add nuw nsw i64 %.01, 46
  %373 = call zeroext i8 @randombit()
  %374 = getelementptr inbounds i8, i8* %1, i64 %372
  store i8 %373, i8* %374, align 1
  %375 = icmp eq i8 %373, 0
  br i1 %375, label %376, label %379

376:                                              ; preds = %371
  %377 = shl nuw nsw i64 %372, 4
  %378 = getelementptr inbounds i8, i8* %0, i64 %377
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %378, i8 0, i64 16, i1 false)
  br label %379

379:                                              ; preds = %376, %371
  %380 = add nuw nsw i64 %.01, 47
  %381 = call zeroext i8 @randombit()
  %382 = getelementptr inbounds i8, i8* %1, i64 %380
  store i8 %381, i8* %382, align 1
  %383 = icmp eq i8 %381, 0
  br i1 %383, label %384, label %387

384:                                              ; preds = %379
  %385 = shl nuw nsw i64 %380, 4
  %386 = getelementptr inbounds i8, i8* %0, i64 %385
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %386, i8 0, i64 16, i1 false)
  br label %387

387:                                              ; preds = %384, %379
  %388 = add nuw nsw i64 %.01, 48
  %389 = call zeroext i8 @randombit()
  %390 = getelementptr inbounds i8, i8* %1, i64 %388
  store i8 %389, i8* %390, align 1
  %391 = icmp eq i8 %389, 0
  br i1 %391, label %392, label %395

392:                                              ; preds = %387
  %393 = shl nuw nsw i64 %388, 4
  %394 = getelementptr inbounds i8, i8* %0, i64 %393
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %394, i8 0, i64 16, i1 false)
  br label %395

395:                                              ; preds = %392, %387
  %396 = add nuw nsw i64 %.01, 49
  %397 = call zeroext i8 @randombit()
  %398 = getelementptr inbounds i8, i8* %1, i64 %396
  store i8 %397, i8* %398, align 1
  %399 = icmp eq i8 %397, 0
  br i1 %399, label %400, label %403

400:                                              ; preds = %395
  %401 = shl nuw nsw i64 %396, 4
  %402 = getelementptr inbounds i8, i8* %0, i64 %401
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %402, i8 0, i64 16, i1 false)
  br label %403

403:                                              ; preds = %400, %395
  %404 = add nuw nsw i64 %.01, 50
  %405 = call zeroext i8 @randombit()
  %406 = getelementptr inbounds i8, i8* %1, i64 %404
  store i8 %405, i8* %406, align 1
  %407 = icmp eq i8 %405, 0
  br i1 %407, label %408, label %411

408:                                              ; preds = %403
  %409 = shl nuw nsw i64 %404, 4
  %410 = getelementptr inbounds i8, i8* %0, i64 %409
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %410, i8 0, i64 16, i1 false)
  br label %411

411:                                              ; preds = %408, %403
  %412 = add nuw nsw i64 %.01, 51
  %413 = call zeroext i8 @randombit()
  %414 = getelementptr inbounds i8, i8* %1, i64 %412
  store i8 %413, i8* %414, align 1
  %415 = icmp eq i8 %413, 0
  br i1 %415, label %416, label %419

416:                                              ; preds = %411
  %417 = shl nuw nsw i64 %412, 4
  %418 = getelementptr inbounds i8, i8* %0, i64 %417
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %418, i8 0, i64 16, i1 false)
  br label %419

419:                                              ; preds = %416, %411
  %420 = add nuw nsw i64 %.01, 52
  %421 = call zeroext i8 @randombit()
  %422 = getelementptr inbounds i8, i8* %1, i64 %420
  store i8 %421, i8* %422, align 1
  %423 = icmp eq i8 %421, 0
  br i1 %423, label %424, label %427

424:                                              ; preds = %419
  %425 = shl nuw nsw i64 %420, 4
  %426 = getelementptr inbounds i8, i8* %0, i64 %425
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %426, i8 0, i64 16, i1 false)
  br label %427

427:                                              ; preds = %424, %419
  %428 = add nuw nsw i64 %.01, 53
  %429 = call zeroext i8 @randombit()
  %430 = getelementptr inbounds i8, i8* %1, i64 %428
  store i8 %429, i8* %430, align 1
  %431 = icmp eq i8 %429, 0
  br i1 %431, label %432, label %435

432:                                              ; preds = %427
  %433 = shl nuw nsw i64 %428, 4
  %434 = getelementptr inbounds i8, i8* %0, i64 %433
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %434, i8 0, i64 16, i1 false)
  br label %435

435:                                              ; preds = %432, %427
  %436 = add nuw nsw i64 %.01, 54
  %437 = call zeroext i8 @randombit()
  %438 = getelementptr inbounds i8, i8* %1, i64 %436
  store i8 %437, i8* %438, align 1
  %439 = icmp eq i8 %437, 0
  br i1 %439, label %440, label %443

440:                                              ; preds = %435
  %441 = shl nuw nsw i64 %436, 4
  %442 = getelementptr inbounds i8, i8* %0, i64 %441
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %442, i8 0, i64 16, i1 false)
  br label %443

443:                                              ; preds = %440, %435
  %444 = add nuw nsw i64 %.01, 55
  %445 = call zeroext i8 @randombit()
  %446 = getelementptr inbounds i8, i8* %1, i64 %444
  store i8 %445, i8* %446, align 1
  %447 = icmp eq i8 %445, 0
  br i1 %447, label %448, label %451

448:                                              ; preds = %443
  %449 = shl nuw nsw i64 %444, 4
  %450 = getelementptr inbounds i8, i8* %0, i64 %449
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %450, i8 0, i64 16, i1 false)
  br label %451

451:                                              ; preds = %448, %443
  %452 = add nuw nsw i64 %.01, 56
  %453 = call zeroext i8 @randombit()
  %454 = getelementptr inbounds i8, i8* %1, i64 %452
  store i8 %453, i8* %454, align 1
  %455 = icmp eq i8 %453, 0
  br i1 %455, label %456, label %459

456:                                              ; preds = %451
  %457 = shl nuw nsw i64 %452, 4
  %458 = getelementptr inbounds i8, i8* %0, i64 %457
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %458, i8 0, i64 16, i1 false)
  br label %459

459:                                              ; preds = %456, %451
  %460 = add nuw nsw i64 %.01, 57
  %461 = call zeroext i8 @randombit()
  %462 = getelementptr inbounds i8, i8* %1, i64 %460
  store i8 %461, i8* %462, align 1
  %463 = icmp eq i8 %461, 0
  br i1 %463, label %464, label %467

464:                                              ; preds = %459
  %465 = shl nuw nsw i64 %460, 4
  %466 = getelementptr inbounds i8, i8* %0, i64 %465
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %466, i8 0, i64 16, i1 false)
  br label %467

467:                                              ; preds = %464, %459
  %468 = add nuw nsw i64 %.01, 58
  %469 = call zeroext i8 @randombit()
  %470 = getelementptr inbounds i8, i8* %1, i64 %468
  store i8 %469, i8* %470, align 1
  %471 = icmp eq i8 %469, 0
  br i1 %471, label %472, label %475

472:                                              ; preds = %467
  %473 = shl nuw nsw i64 %468, 4
  %474 = getelementptr inbounds i8, i8* %0, i64 %473
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %474, i8 0, i64 16, i1 false)
  br label %475

475:                                              ; preds = %472, %467
  %476 = add nuw nsw i64 %.01, 59
  %477 = call zeroext i8 @randombit()
  %478 = getelementptr inbounds i8, i8* %1, i64 %476
  store i8 %477, i8* %478, align 1
  %479 = icmp eq i8 %477, 0
  br i1 %479, label %480, label %483

480:                                              ; preds = %475
  %481 = shl nuw nsw i64 %476, 4
  %482 = getelementptr inbounds i8, i8* %0, i64 %481
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %482, i8 0, i64 16, i1 false)
  br label %483

483:                                              ; preds = %480, %475
  %484 = add nuw nsw i64 %.01, 60
  %485 = call zeroext i8 @randombit()
  %486 = getelementptr inbounds i8, i8* %1, i64 %484
  store i8 %485, i8* %486, align 1
  %487 = icmp eq i8 %485, 0
  br i1 %487, label %488, label %491

488:                                              ; preds = %483
  %489 = shl nuw nsw i64 %484, 4
  %490 = getelementptr inbounds i8, i8* %0, i64 %489
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %490, i8 0, i64 16, i1 false)
  br label %491

491:                                              ; preds = %488, %483
  %492 = add nuw nsw i64 %.01, 61
  %493 = call zeroext i8 @randombit()
  %494 = getelementptr inbounds i8, i8* %1, i64 %492
  store i8 %493, i8* %494, align 1
  %495 = icmp eq i8 %493, 0
  br i1 %495, label %496, label %499

496:                                              ; preds = %491
  %497 = shl nuw nsw i64 %492, 4
  %498 = getelementptr inbounds i8, i8* %0, i64 %497
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %498, i8 0, i64 16, i1 false)
  br label %499

499:                                              ; preds = %496, %491
  %500 = add nuw nsw i64 %.01, 62
  %501 = call zeroext i8 @randombit()
  %502 = getelementptr inbounds i8, i8* %1, i64 %500
  store i8 %501, i8* %502, align 1
  %503 = icmp eq i8 %501, 0
  br i1 %503, label %504, label %507

504:                                              ; preds = %499
  %505 = shl nuw nsw i64 %500, 4
  %506 = getelementptr inbounds i8, i8* %0, i64 %505
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %506, i8 0, i64 16, i1 false)
  br label %507

507:                                              ; preds = %504, %499
  %508 = add nuw nsw i64 %.01, 63
  %509 = call zeroext i8 @randombit()
  %510 = getelementptr inbounds i8, i8* %1, i64 %508
  store i8 %509, i8* %510, align 1
  %511 = icmp eq i8 %509, 0
  br i1 %511, label %512, label %515

512:                                              ; preds = %507
  %513 = shl nuw nsw i64 %508, 4
  %514 = getelementptr inbounds i8, i8* %0, i64 %513
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %514, i8 0, i64 16, i1 false)
  br label %515

515:                                              ; preds = %512, %507
  %516 = add nuw nsw i64 %.01, 64
  %517 = call zeroext i8 @randombit()
  %518 = getelementptr inbounds i8, i8* %1, i64 %516
  store i8 %517, i8* %518, align 1
  %519 = icmp eq i8 %517, 0
  br i1 %519, label %520, label %523

520:                                              ; preds = %515
  %521 = shl nuw nsw i64 %516, 4
  %522 = getelementptr inbounds i8, i8* %0, i64 %521
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %522, i8 0, i64 16, i1 false)
  br label %523

523:                                              ; preds = %520, %515
  %524 = add nuw nsw i64 %.01, 65
  %525 = call zeroext i8 @randombit()
  %526 = getelementptr inbounds i8, i8* %1, i64 %524
  store i8 %525, i8* %526, align 1
  %527 = icmp eq i8 %525, 0
  br i1 %527, label %528, label %531

528:                                              ; preds = %523
  %529 = shl nuw nsw i64 %524, 4
  %530 = getelementptr inbounds i8, i8* %0, i64 %529
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %530, i8 0, i64 16, i1 false)
  br label %531

531:                                              ; preds = %528, %523
  %532 = add nuw nsw i64 %.01, 66
  %533 = call zeroext i8 @randombit()
  %534 = getelementptr inbounds i8, i8* %1, i64 %532
  store i8 %533, i8* %534, align 1
  %535 = icmp eq i8 %533, 0
  br i1 %535, label %536, label %539

536:                                              ; preds = %531
  %537 = shl nuw nsw i64 %532, 4
  %538 = getelementptr inbounds i8, i8* %0, i64 %537
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %538, i8 0, i64 16, i1 false)
  br label %539

539:                                              ; preds = %536, %531
  %540 = add nuw nsw i64 %.01, 67
  %541 = call zeroext i8 @randombit()
  %542 = getelementptr inbounds i8, i8* %1, i64 %540
  store i8 %541, i8* %542, align 1
  %543 = icmp eq i8 %541, 0
  br i1 %543, label %544, label %547

544:                                              ; preds = %539
  %545 = shl nuw nsw i64 %540, 4
  %546 = getelementptr inbounds i8, i8* %0, i64 %545
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %546, i8 0, i64 16, i1 false)
  br label %547

547:                                              ; preds = %544, %539
  %548 = add nuw nsw i64 %.01, 68
  %549 = call zeroext i8 @randombit()
  %550 = getelementptr inbounds i8, i8* %1, i64 %548
  store i8 %549, i8* %550, align 1
  %551 = icmp eq i8 %549, 0
  br i1 %551, label %552, label %555

552:                                              ; preds = %547
  %553 = shl nuw nsw i64 %548, 4
  %554 = getelementptr inbounds i8, i8* %0, i64 %553
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %554, i8 0, i64 16, i1 false)
  br label %555

555:                                              ; preds = %552, %547
  %556 = add nuw nsw i64 %.01, 69
  %557 = call zeroext i8 @randombit()
  %558 = getelementptr inbounds i8, i8* %1, i64 %556
  store i8 %557, i8* %558, align 1
  %559 = icmp eq i8 %557, 0
  br i1 %559, label %560, label %563

560:                                              ; preds = %555
  %561 = shl nuw nsw i64 %556, 4
  %562 = getelementptr inbounds i8, i8* %0, i64 %561
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %562, i8 0, i64 16, i1 false)
  br label %563

563:                                              ; preds = %560, %555
  %564 = add nuw nsw i64 %.01, 70
  %565 = call zeroext i8 @randombit()
  %566 = getelementptr inbounds i8, i8* %1, i64 %564
  store i8 %565, i8* %566, align 1
  %567 = icmp eq i8 %565, 0
  br i1 %567, label %568, label %571

568:                                              ; preds = %563
  %569 = shl nuw nsw i64 %564, 4
  %570 = getelementptr inbounds i8, i8* %0, i64 %569
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %570, i8 0, i64 16, i1 false)
  br label %571

571:                                              ; preds = %568, %563
  %572 = add nuw nsw i64 %.01, 71
  %573 = call zeroext i8 @randombit()
  %574 = getelementptr inbounds i8, i8* %1, i64 %572
  store i8 %573, i8* %574, align 1
  %575 = icmp eq i8 %573, 0
  br i1 %575, label %576, label %579

576:                                              ; preds = %571
  %577 = shl nuw nsw i64 %572, 4
  %578 = getelementptr inbounds i8, i8* %0, i64 %577
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %578, i8 0, i64 16, i1 false)
  br label %579

579:                                              ; preds = %576, %571
  %580 = add nuw nsw i64 %.01, 72
  %581 = call zeroext i8 @randombit()
  %582 = getelementptr inbounds i8, i8* %1, i64 %580
  store i8 %581, i8* %582, align 1
  %583 = icmp eq i8 %581, 0
  br i1 %583, label %584, label %587

584:                                              ; preds = %579
  %585 = shl nuw nsw i64 %580, 4
  %586 = getelementptr inbounds i8, i8* %0, i64 %585
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %586, i8 0, i64 16, i1 false)
  br label %587

587:                                              ; preds = %584, %579
  %588 = add nuw nsw i64 %.01, 73
  %589 = call zeroext i8 @randombit()
  %590 = getelementptr inbounds i8, i8* %1, i64 %588
  store i8 %589, i8* %590, align 1
  %591 = icmp eq i8 %589, 0
  br i1 %591, label %592, label %595

592:                                              ; preds = %587
  %593 = shl nuw nsw i64 %588, 4
  %594 = getelementptr inbounds i8, i8* %0, i64 %593
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %594, i8 0, i64 16, i1 false)
  br label %595

595:                                              ; preds = %592, %587
  %596 = add nuw nsw i64 %.01, 74
  %597 = call zeroext i8 @randombit()
  %598 = getelementptr inbounds i8, i8* %1, i64 %596
  store i8 %597, i8* %598, align 1
  %599 = icmp eq i8 %597, 0
  br i1 %599, label %600, label %603

600:                                              ; preds = %595
  %601 = shl nuw nsw i64 %596, 4
  %602 = getelementptr inbounds i8, i8* %0, i64 %601
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %602, i8 0, i64 16, i1 false)
  br label %603

603:                                              ; preds = %600, %595
  %604 = add nuw nsw i64 %.01, 75
  %605 = call zeroext i8 @randombit()
  %606 = getelementptr inbounds i8, i8* %1, i64 %604
  store i8 %605, i8* %606, align 1
  %607 = icmp eq i8 %605, 0
  br i1 %607, label %608, label %611

608:                                              ; preds = %603
  %609 = shl nuw nsw i64 %604, 4
  %610 = getelementptr inbounds i8, i8* %0, i64 %609
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %610, i8 0, i64 16, i1 false)
  br label %611

611:                                              ; preds = %608, %603
  %612 = add nuw nsw i64 %.01, 76
  %613 = call zeroext i8 @randombit()
  %614 = getelementptr inbounds i8, i8* %1, i64 %612
  store i8 %613, i8* %614, align 1
  %615 = icmp eq i8 %613, 0
  br i1 %615, label %616, label %619

616:                                              ; preds = %611
  %617 = shl nuw nsw i64 %612, 4
  %618 = getelementptr inbounds i8, i8* %0, i64 %617
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %618, i8 0, i64 16, i1 false)
  br label %619

619:                                              ; preds = %616, %611
  %620 = add nuw nsw i64 %.01, 77
  %621 = call zeroext i8 @randombit()
  %622 = getelementptr inbounds i8, i8* %1, i64 %620
  store i8 %621, i8* %622, align 1
  %623 = icmp eq i8 %621, 0
  br i1 %623, label %624, label %627

624:                                              ; preds = %619
  %625 = shl nuw nsw i64 %620, 4
  %626 = getelementptr inbounds i8, i8* %0, i64 %625
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %626, i8 0, i64 16, i1 false)
  br label %627

627:                                              ; preds = %624, %619
  %628 = add nuw nsw i64 %.01, 78
  %629 = call zeroext i8 @randombit()
  %630 = getelementptr inbounds i8, i8* %1, i64 %628
  store i8 %629, i8* %630, align 1
  %631 = icmp eq i8 %629, 0
  br i1 %631, label %632, label %635

632:                                              ; preds = %627
  %633 = shl nuw nsw i64 %628, 4
  %634 = getelementptr inbounds i8, i8* %0, i64 %633
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %634, i8 0, i64 16, i1 false)
  br label %635

635:                                              ; preds = %632, %627
  %636 = add nuw nsw i64 %.01, 79
  %637 = call zeroext i8 @randombit()
  %638 = getelementptr inbounds i8, i8* %1, i64 %636
  store i8 %637, i8* %638, align 1
  %639 = icmp eq i8 %637, 0
  br i1 %639, label %640, label %643

640:                                              ; preds = %635
  %641 = shl nuw nsw i64 %636, 4
  %642 = getelementptr inbounds i8, i8* %0, i64 %641
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %642, i8 0, i64 16, i1 false)
  br label %643

643:                                              ; preds = %640, %635
  %644 = add nuw nsw i64 %.01, 80
  %645 = call zeroext i8 @randombit()
  %646 = getelementptr inbounds i8, i8* %1, i64 %644
  store i8 %645, i8* %646, align 1
  %647 = icmp eq i8 %645, 0
  br i1 %647, label %648, label %651

648:                                              ; preds = %643
  %649 = shl nuw nsw i64 %644, 4
  %650 = getelementptr inbounds i8, i8* %0, i64 %649
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %650, i8 0, i64 16, i1 false)
  br label %651

651:                                              ; preds = %648, %643
  %652 = add nuw nsw i64 %.01, 81
  %653 = call zeroext i8 @randombit()
  %654 = getelementptr inbounds i8, i8* %1, i64 %652
  store i8 %653, i8* %654, align 1
  %655 = icmp eq i8 %653, 0
  br i1 %655, label %656, label %659

656:                                              ; preds = %651
  %657 = shl nuw nsw i64 %652, 4
  %658 = getelementptr inbounds i8, i8* %0, i64 %657
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %658, i8 0, i64 16, i1 false)
  br label %659

659:                                              ; preds = %656, %651
  %660 = add nuw nsw i64 %.01, 82
  %661 = call zeroext i8 @randombit()
  %662 = getelementptr inbounds i8, i8* %1, i64 %660
  store i8 %661, i8* %662, align 1
  %663 = icmp eq i8 %661, 0
  br i1 %663, label %664, label %667

664:                                              ; preds = %659
  %665 = shl nuw nsw i64 %660, 4
  %666 = getelementptr inbounds i8, i8* %0, i64 %665
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %666, i8 0, i64 16, i1 false)
  br label %667

667:                                              ; preds = %664, %659
  %668 = add nuw nsw i64 %.01, 83
  %669 = call zeroext i8 @randombit()
  %670 = getelementptr inbounds i8, i8* %1, i64 %668
  store i8 %669, i8* %670, align 1
  %671 = icmp eq i8 %669, 0
  br i1 %671, label %672, label %675

672:                                              ; preds = %667
  %673 = shl nuw nsw i64 %668, 4
  %674 = getelementptr inbounds i8, i8* %0, i64 %673
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %674, i8 0, i64 16, i1 false)
  br label %675

675:                                              ; preds = %672, %667
  %676 = add nuw nsw i64 %.01, 84
  %677 = call zeroext i8 @randombit()
  %678 = getelementptr inbounds i8, i8* %1, i64 %676
  store i8 %677, i8* %678, align 1
  %679 = icmp eq i8 %677, 0
  br i1 %679, label %680, label %683

680:                                              ; preds = %675
  %681 = shl nuw nsw i64 %676, 4
  %682 = getelementptr inbounds i8, i8* %0, i64 %681
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %682, i8 0, i64 16, i1 false)
  br label %683

683:                                              ; preds = %680, %675
  %684 = add nuw nsw i64 %.01, 85
  %685 = call zeroext i8 @randombit()
  %686 = getelementptr inbounds i8, i8* %1, i64 %684
  store i8 %685, i8* %686, align 1
  %687 = icmp eq i8 %685, 0
  br i1 %687, label %688, label %691

688:                                              ; preds = %683
  %689 = shl nuw nsw i64 %684, 4
  %690 = getelementptr inbounds i8, i8* %0, i64 %689
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %690, i8 0, i64 16, i1 false)
  br label %691

691:                                              ; preds = %688, %683
  %692 = add nuw nsw i64 %.01, 86
  %693 = call zeroext i8 @randombit()
  %694 = getelementptr inbounds i8, i8* %1, i64 %692
  store i8 %693, i8* %694, align 1
  %695 = icmp eq i8 %693, 0
  br i1 %695, label %696, label %699

696:                                              ; preds = %691
  %697 = shl nuw nsw i64 %692, 4
  %698 = getelementptr inbounds i8, i8* %0, i64 %697
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %698, i8 0, i64 16, i1 false)
  br label %699

699:                                              ; preds = %696, %691
  %700 = add nuw nsw i64 %.01, 87
  %701 = call zeroext i8 @randombit()
  %702 = getelementptr inbounds i8, i8* %1, i64 %700
  store i8 %701, i8* %702, align 1
  %703 = icmp eq i8 %701, 0
  br i1 %703, label %704, label %707

704:                                              ; preds = %699
  %705 = shl nuw nsw i64 %700, 4
  %706 = getelementptr inbounds i8, i8* %0, i64 %705
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %706, i8 0, i64 16, i1 false)
  br label %707

707:                                              ; preds = %704, %699
  %708 = add nuw nsw i64 %.01, 88
  %709 = call zeroext i8 @randombit()
  %710 = getelementptr inbounds i8, i8* %1, i64 %708
  store i8 %709, i8* %710, align 1
  %711 = icmp eq i8 %709, 0
  br i1 %711, label %712, label %715

712:                                              ; preds = %707
  %713 = shl nuw nsw i64 %708, 4
  %714 = getelementptr inbounds i8, i8* %0, i64 %713
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %714, i8 0, i64 16, i1 false)
  br label %715

715:                                              ; preds = %712, %707
  %716 = add nuw nsw i64 %.01, 89
  %717 = call zeroext i8 @randombit()
  %718 = getelementptr inbounds i8, i8* %1, i64 %716
  store i8 %717, i8* %718, align 1
  %719 = icmp eq i8 %717, 0
  br i1 %719, label %720, label %723

720:                                              ; preds = %715
  %721 = shl nuw nsw i64 %716, 4
  %722 = getelementptr inbounds i8, i8* %0, i64 %721
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %722, i8 0, i64 16, i1 false)
  br label %723

723:                                              ; preds = %720, %715
  %724 = add nuw nsw i64 %.01, 90
  %725 = call zeroext i8 @randombit()
  %726 = getelementptr inbounds i8, i8* %1, i64 %724
  store i8 %725, i8* %726, align 1
  %727 = icmp eq i8 %725, 0
  br i1 %727, label %728, label %731

728:                                              ; preds = %723
  %729 = shl nuw nsw i64 %724, 4
  %730 = getelementptr inbounds i8, i8* %0, i64 %729
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %730, i8 0, i64 16, i1 false)
  br label %731

731:                                              ; preds = %728, %723
  %732 = add nuw nsw i64 %.01, 91
  %733 = call zeroext i8 @randombit()
  %734 = getelementptr inbounds i8, i8* %1, i64 %732
  store i8 %733, i8* %734, align 1
  %735 = icmp eq i8 %733, 0
  br i1 %735, label %736, label %739

736:                                              ; preds = %731
  %737 = shl nuw nsw i64 %732, 4
  %738 = getelementptr inbounds i8, i8* %0, i64 %737
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %738, i8 0, i64 16, i1 false)
  br label %739

739:                                              ; preds = %736, %731
  %740 = add nuw nsw i64 %.01, 92
  %741 = call zeroext i8 @randombit()
  %742 = getelementptr inbounds i8, i8* %1, i64 %740
  store i8 %741, i8* %742, align 1
  %743 = icmp eq i8 %741, 0
  br i1 %743, label %744, label %747

744:                                              ; preds = %739
  %745 = shl nuw nsw i64 %740, 4
  %746 = getelementptr inbounds i8, i8* %0, i64 %745
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %746, i8 0, i64 16, i1 false)
  br label %747

747:                                              ; preds = %744, %739
  %748 = add nuw nsw i64 %.01, 93
  %749 = call zeroext i8 @randombit()
  %750 = getelementptr inbounds i8, i8* %1, i64 %748
  store i8 %749, i8* %750, align 1
  %751 = icmp eq i8 %749, 0
  br i1 %751, label %752, label %755

752:                                              ; preds = %747
  %753 = shl nuw nsw i64 %748, 4
  %754 = getelementptr inbounds i8, i8* %0, i64 %753
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %754, i8 0, i64 16, i1 false)
  br label %755

755:                                              ; preds = %752, %747
  %756 = add nuw nsw i64 %.01, 94
  %757 = call zeroext i8 @randombit()
  %758 = getelementptr inbounds i8, i8* %1, i64 %756
  store i8 %757, i8* %758, align 1
  %759 = icmp eq i8 %757, 0
  br i1 %759, label %760, label %763

760:                                              ; preds = %755
  %761 = shl nuw nsw i64 %756, 4
  %762 = getelementptr inbounds i8, i8* %0, i64 %761
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %762, i8 0, i64 16, i1 false)
  br label %763

763:                                              ; preds = %760, %755
  %764 = add nuw nsw i64 %.01, 95
  %765 = call zeroext i8 @randombit()
  %766 = getelementptr inbounds i8, i8* %1, i64 %764
  store i8 %765, i8* %766, align 1
  %767 = icmp eq i8 %765, 0
  br i1 %767, label %768, label %771

768:                                              ; preds = %763
  %769 = shl nuw nsw i64 %764, 4
  %770 = getelementptr inbounds i8, i8* %0, i64 %769
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %770, i8 0, i64 16, i1 false)
  br label %771

771:                                              ; preds = %768, %763
  %772 = add nuw nsw i64 %.01, 96
  %773 = call zeroext i8 @randombit()
  %774 = getelementptr inbounds i8, i8* %1, i64 %772
  store i8 %773, i8* %774, align 1
  %775 = icmp eq i8 %773, 0
  br i1 %775, label %776, label %779

776:                                              ; preds = %771
  %777 = shl nuw nsw i64 %772, 4
  %778 = getelementptr inbounds i8, i8* %0, i64 %777
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %778, i8 0, i64 16, i1 false)
  br label %779

779:                                              ; preds = %776, %771
  %780 = add nuw nsw i64 %.01, 97
  %781 = call zeroext i8 @randombit()
  %782 = getelementptr inbounds i8, i8* %1, i64 %780
  store i8 %781, i8* %782, align 1
  %783 = icmp eq i8 %781, 0
  br i1 %783, label %784, label %787

784:                                              ; preds = %779
  %785 = shl nuw nsw i64 %780, 4
  %786 = getelementptr inbounds i8, i8* %0, i64 %785
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %786, i8 0, i64 16, i1 false)
  br label %787

787:                                              ; preds = %784, %779
  %788 = add nuw nsw i64 %.01, 98
  %789 = call zeroext i8 @randombit()
  %790 = getelementptr inbounds i8, i8* %1, i64 %788
  store i8 %789, i8* %790, align 1
  %791 = icmp eq i8 %789, 0
  br i1 %791, label %792, label %795

792:                                              ; preds = %787
  %793 = shl nuw nsw i64 %788, 4
  %794 = getelementptr inbounds i8, i8* %0, i64 %793
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %794, i8 0, i64 16, i1 false)
  br label %795

795:                                              ; preds = %792, %787
  %796 = add nuw nsw i64 %.01, 99
  %797 = call zeroext i8 @randombit()
  %798 = getelementptr inbounds i8, i8* %1, i64 %796
  store i8 %797, i8* %798, align 1
  %799 = icmp eq i8 %797, 0
  br i1 %799, label %800, label %803

800:                                              ; preds = %795
  %801 = shl nuw nsw i64 %796, 4
  %802 = getelementptr inbounds i8, i8* %0, i64 %801
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %802, i8 0, i64 16, i1 false)
  br label %803

803:                                              ; preds = %800, %795
  %804 = add nuw nsw i64 %.01, 100
  %805 = call zeroext i8 @randombit()
  %806 = getelementptr inbounds i8, i8* %1, i64 %804
  store i8 %805, i8* %806, align 1
  %807 = icmp eq i8 %805, 0
  br i1 %807, label %808, label %811

808:                                              ; preds = %803
  %809 = shl nuw nsw i64 %804, 4
  %810 = getelementptr inbounds i8, i8* %0, i64 %809
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %810, i8 0, i64 16, i1 false)
  br label %811

811:                                              ; preds = %808, %803
  %812 = add nuw nsw i64 %.01, 101
  %813 = call zeroext i8 @randombit()
  %814 = getelementptr inbounds i8, i8* %1, i64 %812
  store i8 %813, i8* %814, align 1
  %815 = icmp eq i8 %813, 0
  br i1 %815, label %816, label %819

816:                                              ; preds = %811
  %817 = shl nuw nsw i64 %812, 4
  %818 = getelementptr inbounds i8, i8* %0, i64 %817
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %818, i8 0, i64 16, i1 false)
  br label %819

819:                                              ; preds = %816, %811
  %820 = add nuw nsw i64 %.01, 102
  %821 = call zeroext i8 @randombit()
  %822 = getelementptr inbounds i8, i8* %1, i64 %820
  store i8 %821, i8* %822, align 1
  %823 = icmp eq i8 %821, 0
  br i1 %823, label %824, label %827

824:                                              ; preds = %819
  %825 = shl nuw nsw i64 %820, 4
  %826 = getelementptr inbounds i8, i8* %0, i64 %825
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %826, i8 0, i64 16, i1 false)
  br label %827

827:                                              ; preds = %824, %819
  %828 = add nuw nsw i64 %.01, 103
  %829 = call zeroext i8 @randombit()
  %830 = getelementptr inbounds i8, i8* %1, i64 %828
  store i8 %829, i8* %830, align 1
  %831 = icmp eq i8 %829, 0
  br i1 %831, label %832, label %835

832:                                              ; preds = %827
  %833 = shl nuw nsw i64 %828, 4
  %834 = getelementptr inbounds i8, i8* %0, i64 %833
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %834, i8 0, i64 16, i1 false)
  br label %835

835:                                              ; preds = %832, %827
  %836 = add nuw nsw i64 %.01, 104
  %837 = call zeroext i8 @randombit()
  %838 = getelementptr inbounds i8, i8* %1, i64 %836
  store i8 %837, i8* %838, align 1
  %839 = icmp eq i8 %837, 0
  br i1 %839, label %840, label %843

840:                                              ; preds = %835
  %841 = shl nuw nsw i64 %836, 4
  %842 = getelementptr inbounds i8, i8* %0, i64 %841
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %842, i8 0, i64 16, i1 false)
  br label %843

843:                                              ; preds = %840, %835
  %844 = add nuw nsw i64 %.01, 105
  %845 = call zeroext i8 @randombit()
  %846 = getelementptr inbounds i8, i8* %1, i64 %844
  store i8 %845, i8* %846, align 1
  %847 = icmp eq i8 %845, 0
  br i1 %847, label %848, label %851

848:                                              ; preds = %843
  %849 = shl nuw nsw i64 %844, 4
  %850 = getelementptr inbounds i8, i8* %0, i64 %849
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %850, i8 0, i64 16, i1 false)
  br label %851

851:                                              ; preds = %848, %843
  %852 = add nuw nsw i64 %.01, 106
  %853 = call zeroext i8 @randombit()
  %854 = getelementptr inbounds i8, i8* %1, i64 %852
  store i8 %853, i8* %854, align 1
  %855 = icmp eq i8 %853, 0
  br i1 %855, label %856, label %859

856:                                              ; preds = %851
  %857 = shl nuw nsw i64 %852, 4
  %858 = getelementptr inbounds i8, i8* %0, i64 %857
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %858, i8 0, i64 16, i1 false)
  br label %859

859:                                              ; preds = %856, %851
  %860 = add nuw nsw i64 %.01, 107
  %861 = call zeroext i8 @randombit()
  %862 = getelementptr inbounds i8, i8* %1, i64 %860
  store i8 %861, i8* %862, align 1
  %863 = icmp eq i8 %861, 0
  br i1 %863, label %864, label %867

864:                                              ; preds = %859
  %865 = shl nuw nsw i64 %860, 4
  %866 = getelementptr inbounds i8, i8* %0, i64 %865
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %866, i8 0, i64 16, i1 false)
  br label %867

867:                                              ; preds = %864, %859
  %868 = add nuw nsw i64 %.01, 108
  %869 = call zeroext i8 @randombit()
  %870 = getelementptr inbounds i8, i8* %1, i64 %868
  store i8 %869, i8* %870, align 1
  %871 = icmp eq i8 %869, 0
  br i1 %871, label %872, label %875

872:                                              ; preds = %867
  %873 = shl nuw nsw i64 %868, 4
  %874 = getelementptr inbounds i8, i8* %0, i64 %873
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %874, i8 0, i64 16, i1 false)
  br label %875

875:                                              ; preds = %872, %867
  %876 = add nuw nsw i64 %.01, 109
  %877 = call zeroext i8 @randombit()
  %878 = getelementptr inbounds i8, i8* %1, i64 %876
  store i8 %877, i8* %878, align 1
  %879 = icmp eq i8 %877, 0
  br i1 %879, label %880, label %883

880:                                              ; preds = %875
  %881 = shl nuw nsw i64 %876, 4
  %882 = getelementptr inbounds i8, i8* %0, i64 %881
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %882, i8 0, i64 16, i1 false)
  br label %883

883:                                              ; preds = %880, %875
  %884 = add nuw nsw i64 %.01, 110
  %885 = call zeroext i8 @randombit()
  %886 = getelementptr inbounds i8, i8* %1, i64 %884
  store i8 %885, i8* %886, align 1
  %887 = icmp eq i8 %885, 0
  br i1 %887, label %888, label %891

888:                                              ; preds = %883
  %889 = shl nuw nsw i64 %884, 4
  %890 = getelementptr inbounds i8, i8* %0, i64 %889
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %890, i8 0, i64 16, i1 false)
  br label %891

891:                                              ; preds = %888, %883
  %892 = add nuw nsw i64 %.01, 111
  %893 = call zeroext i8 @randombit()
  %894 = getelementptr inbounds i8, i8* %1, i64 %892
  store i8 %893, i8* %894, align 1
  %895 = icmp eq i8 %893, 0
  br i1 %895, label %896, label %899

896:                                              ; preds = %891
  %897 = shl nuw nsw i64 %892, 4
  %898 = getelementptr inbounds i8, i8* %0, i64 %897
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %898, i8 0, i64 16, i1 false)
  br label %899

899:                                              ; preds = %896, %891
  %900 = add nuw nsw i64 %.01, 112
  %901 = call zeroext i8 @randombit()
  %902 = getelementptr inbounds i8, i8* %1, i64 %900
  store i8 %901, i8* %902, align 1
  %903 = icmp eq i8 %901, 0
  br i1 %903, label %904, label %907

904:                                              ; preds = %899
  %905 = shl nuw nsw i64 %900, 4
  %906 = getelementptr inbounds i8, i8* %0, i64 %905
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %906, i8 0, i64 16, i1 false)
  br label %907

907:                                              ; preds = %904, %899
  %908 = add nuw nsw i64 %.01, 113
  %909 = call zeroext i8 @randombit()
  %910 = getelementptr inbounds i8, i8* %1, i64 %908
  store i8 %909, i8* %910, align 1
  %911 = icmp eq i8 %909, 0
  br i1 %911, label %912, label %915

912:                                              ; preds = %907
  %913 = shl nuw nsw i64 %908, 4
  %914 = getelementptr inbounds i8, i8* %0, i64 %913
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %914, i8 0, i64 16, i1 false)
  br label %915

915:                                              ; preds = %912, %907
  %916 = add nuw nsw i64 %.01, 114
  %917 = call zeroext i8 @randombit()
  %918 = getelementptr inbounds i8, i8* %1, i64 %916
  store i8 %917, i8* %918, align 1
  %919 = icmp eq i8 %917, 0
  br i1 %919, label %920, label %923

920:                                              ; preds = %915
  %921 = shl nuw nsw i64 %916, 4
  %922 = getelementptr inbounds i8, i8* %0, i64 %921
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %922, i8 0, i64 16, i1 false)
  br label %923

923:                                              ; preds = %920, %915
  %924 = add nuw nsw i64 %.01, 115
  %925 = call zeroext i8 @randombit()
  %926 = getelementptr inbounds i8, i8* %1, i64 %924
  store i8 %925, i8* %926, align 1
  %927 = icmp eq i8 %925, 0
  br i1 %927, label %928, label %931

928:                                              ; preds = %923
  %929 = shl nuw nsw i64 %924, 4
  %930 = getelementptr inbounds i8, i8* %0, i64 %929
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %930, i8 0, i64 16, i1 false)
  br label %931

931:                                              ; preds = %928, %923
  %932 = add nuw nsw i64 %.01, 116
  %933 = call zeroext i8 @randombit()
  %934 = getelementptr inbounds i8, i8* %1, i64 %932
  store i8 %933, i8* %934, align 1
  %935 = icmp eq i8 %933, 0
  br i1 %935, label %936, label %939

936:                                              ; preds = %931
  %937 = shl nuw nsw i64 %932, 4
  %938 = getelementptr inbounds i8, i8* %0, i64 %937
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %938, i8 0, i64 16, i1 false)
  br label %939

939:                                              ; preds = %936, %931
  %940 = add nuw nsw i64 %.01, 117
  %941 = call zeroext i8 @randombit()
  %942 = getelementptr inbounds i8, i8* %1, i64 %940
  store i8 %941, i8* %942, align 1
  %943 = icmp eq i8 %941, 0
  br i1 %943, label %944, label %947

944:                                              ; preds = %939
  %945 = shl nuw nsw i64 %940, 4
  %946 = getelementptr inbounds i8, i8* %0, i64 %945
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %946, i8 0, i64 16, i1 false)
  br label %947

947:                                              ; preds = %944, %939
  %948 = add nuw nsw i64 %.01, 118
  %949 = call zeroext i8 @randombit()
  %950 = getelementptr inbounds i8, i8* %1, i64 %948
  store i8 %949, i8* %950, align 1
  %951 = icmp eq i8 %949, 0
  br i1 %951, label %952, label %955

952:                                              ; preds = %947
  %953 = shl nuw nsw i64 %948, 4
  %954 = getelementptr inbounds i8, i8* %0, i64 %953
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %954, i8 0, i64 16, i1 false)
  br label %955

955:                                              ; preds = %952, %947
  %956 = add nuw nsw i64 %.01, 119
  %957 = call zeroext i8 @randombit()
  %958 = getelementptr inbounds i8, i8* %1, i64 %956
  store i8 %957, i8* %958, align 1
  %959 = icmp eq i8 %957, 0
  br i1 %959, label %960, label %963

960:                                              ; preds = %955
  %961 = shl nuw nsw i64 %956, 4
  %962 = getelementptr inbounds i8, i8* %0, i64 %961
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %962, i8 0, i64 16, i1 false)
  br label %963

963:                                              ; preds = %960, %955
  %964 = add nuw nsw i64 %.01, 120
  %965 = call zeroext i8 @randombit()
  %966 = getelementptr inbounds i8, i8* %1, i64 %964
  store i8 %965, i8* %966, align 1
  %967 = icmp eq i8 %965, 0
  br i1 %967, label %968, label %971

968:                                              ; preds = %963
  %969 = shl nuw nsw i64 %964, 4
  %970 = getelementptr inbounds i8, i8* %0, i64 %969
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %970, i8 0, i64 16, i1 false)
  br label %971

971:                                              ; preds = %968, %963
  %972 = add nuw nsw i64 %.01, 121
  %973 = call zeroext i8 @randombit()
  %974 = getelementptr inbounds i8, i8* %1, i64 %972
  store i8 %973, i8* %974, align 1
  %975 = icmp eq i8 %973, 0
  br i1 %975, label %976, label %979

976:                                              ; preds = %971
  %977 = shl nuw nsw i64 %972, 4
  %978 = getelementptr inbounds i8, i8* %0, i64 %977
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %978, i8 0, i64 16, i1 false)
  br label %979

979:                                              ; preds = %976, %971
  %980 = add nuw nsw i64 %.01, 122
  %981 = call zeroext i8 @randombit()
  %982 = getelementptr inbounds i8, i8* %1, i64 %980
  store i8 %981, i8* %982, align 1
  %983 = icmp eq i8 %981, 0
  br i1 %983, label %984, label %987

984:                                              ; preds = %979
  %985 = shl nuw nsw i64 %980, 4
  %986 = getelementptr inbounds i8, i8* %0, i64 %985
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %986, i8 0, i64 16, i1 false)
  br label %987

987:                                              ; preds = %984, %979
  %988 = add nuw nsw i64 %.01, 123
  %989 = call zeroext i8 @randombit()
  %990 = getelementptr inbounds i8, i8* %1, i64 %988
  store i8 %989, i8* %990, align 1
  %991 = icmp eq i8 %989, 0
  br i1 %991, label %992, label %995

992:                                              ; preds = %987
  %993 = shl nuw nsw i64 %988, 4
  %994 = getelementptr inbounds i8, i8* %0, i64 %993
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %994, i8 0, i64 16, i1 false)
  br label %995

995:                                              ; preds = %992, %987
  %996 = add nuw nsw i64 %.01, 124
  %997 = call zeroext i8 @randombit()
  %998 = getelementptr inbounds i8, i8* %1, i64 %996
  store i8 %997, i8* %998, align 1
  %999 = icmp eq i8 %997, 0
  br i1 %999, label %1000, label %1003

1000:                                             ; preds = %995
  %1001 = shl nuw nsw i64 %996, 4
  %1002 = getelementptr inbounds i8, i8* %0, i64 %1001
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1002, i8 0, i64 16, i1 false)
  br label %1003

1003:                                             ; preds = %1000, %995
  %1004 = add nuw nsw i64 %.01, 125
  %1005 = call zeroext i8 @randombit()
  %1006 = getelementptr inbounds i8, i8* %1, i64 %1004
  store i8 %1005, i8* %1006, align 1
  %1007 = icmp eq i8 %1005, 0
  br i1 %1007, label %1008, label %1011

1008:                                             ; preds = %1003
  %1009 = shl nuw nsw i64 %1004, 4
  %1010 = getelementptr inbounds i8, i8* %0, i64 %1009
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1010, i8 0, i64 16, i1 false)
  br label %1011

1011:                                             ; preds = %1008, %1003
  %1012 = add nuw nsw i64 %.01, 126
  %1013 = call zeroext i8 @randombit()
  %1014 = getelementptr inbounds i8, i8* %1, i64 %1012
  store i8 %1013, i8* %1014, align 1
  %1015 = icmp eq i8 %1013, 0
  br i1 %1015, label %1016, label %1019

1016:                                             ; preds = %1011
  %1017 = shl nuw nsw i64 %1012, 4
  %1018 = getelementptr inbounds i8, i8* %0, i64 %1017
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1018, i8 0, i64 16, i1 false)
  br label %1019

1019:                                             ; preds = %1016, %1011
  %1020 = add nuw nsw i64 %.01, 127
  %1021 = call zeroext i8 @randombit()
  %1022 = getelementptr inbounds i8, i8* %1, i64 %1020
  store i8 %1021, i8* %1022, align 1
  %1023 = icmp eq i8 %1021, 0
  br i1 %1023, label %1024, label %1027

1024:                                             ; preds = %1019
  %1025 = shl nuw nsw i64 %1020, 4
  %1026 = getelementptr inbounds i8, i8* %0, i64 %1025
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1026, i8 0, i64 16, i1 false)
  br label %1027

1027:                                             ; preds = %1024, %1019
  %1028 = add nuw nsw i64 %.01, 128
  %1029 = call zeroext i8 @randombit()
  %1030 = getelementptr inbounds i8, i8* %1, i64 %1028
  store i8 %1029, i8* %1030, align 1
  %1031 = icmp eq i8 %1029, 0
  br i1 %1031, label %1032, label %1035

1032:                                             ; preds = %1027
  %1033 = shl nuw nsw i64 %1028, 4
  %1034 = getelementptr inbounds i8, i8* %0, i64 %1033
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1034, i8 0, i64 16, i1 false)
  br label %1035

1035:                                             ; preds = %1032, %1027
  %1036 = add nuw nsw i64 %.01, 129
  %1037 = call zeroext i8 @randombit()
  %1038 = getelementptr inbounds i8, i8* %1, i64 %1036
  store i8 %1037, i8* %1038, align 1
  %1039 = icmp eq i8 %1037, 0
  br i1 %1039, label %1040, label %1043

1040:                                             ; preds = %1035
  %1041 = shl nuw nsw i64 %1036, 4
  %1042 = getelementptr inbounds i8, i8* %0, i64 %1041
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1042, i8 0, i64 16, i1 false)
  br label %1043

1043:                                             ; preds = %1040, %1035
  %1044 = add nuw nsw i64 %.01, 130
  %1045 = call zeroext i8 @randombit()
  %1046 = getelementptr inbounds i8, i8* %1, i64 %1044
  store i8 %1045, i8* %1046, align 1
  %1047 = icmp eq i8 %1045, 0
  br i1 %1047, label %1048, label %1051

1048:                                             ; preds = %1043
  %1049 = shl nuw nsw i64 %1044, 4
  %1050 = getelementptr inbounds i8, i8* %0, i64 %1049
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1050, i8 0, i64 16, i1 false)
  br label %1051

1051:                                             ; preds = %1048, %1043
  %1052 = add nuw nsw i64 %.01, 131
  %1053 = call zeroext i8 @randombit()
  %1054 = getelementptr inbounds i8, i8* %1, i64 %1052
  store i8 %1053, i8* %1054, align 1
  %1055 = icmp eq i8 %1053, 0
  br i1 %1055, label %1056, label %1059

1056:                                             ; preds = %1051
  %1057 = shl nuw nsw i64 %1052, 4
  %1058 = getelementptr inbounds i8, i8* %0, i64 %1057
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1058, i8 0, i64 16, i1 false)
  br label %1059

1059:                                             ; preds = %1056, %1051
  %1060 = add nuw nsw i64 %.01, 132
  %1061 = call zeroext i8 @randombit()
  %1062 = getelementptr inbounds i8, i8* %1, i64 %1060
  store i8 %1061, i8* %1062, align 1
  %1063 = icmp eq i8 %1061, 0
  br i1 %1063, label %1064, label %1067

1064:                                             ; preds = %1059
  %1065 = shl nuw nsw i64 %1060, 4
  %1066 = getelementptr inbounds i8, i8* %0, i64 %1065
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1066, i8 0, i64 16, i1 false)
  br label %1067

1067:                                             ; preds = %1064, %1059
  %1068 = add nuw nsw i64 %.01, 133
  %1069 = call zeroext i8 @randombit()
  %1070 = getelementptr inbounds i8, i8* %1, i64 %1068
  store i8 %1069, i8* %1070, align 1
  %1071 = icmp eq i8 %1069, 0
  br i1 %1071, label %1072, label %1075

1072:                                             ; preds = %1067
  %1073 = shl nuw nsw i64 %1068, 4
  %1074 = getelementptr inbounds i8, i8* %0, i64 %1073
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1074, i8 0, i64 16, i1 false)
  br label %1075

1075:                                             ; preds = %1072, %1067
  %1076 = add nuw nsw i64 %.01, 134
  %1077 = call zeroext i8 @randombit()
  %1078 = getelementptr inbounds i8, i8* %1, i64 %1076
  store i8 %1077, i8* %1078, align 1
  %1079 = icmp eq i8 %1077, 0
  br i1 %1079, label %1080, label %1083

1080:                                             ; preds = %1075
  %1081 = shl nuw nsw i64 %1076, 4
  %1082 = getelementptr inbounds i8, i8* %0, i64 %1081
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1082, i8 0, i64 16, i1 false)
  br label %1083

1083:                                             ; preds = %1080, %1075
  %1084 = add nuw nsw i64 %.01, 135
  %1085 = call zeroext i8 @randombit()
  %1086 = getelementptr inbounds i8, i8* %1, i64 %1084
  store i8 %1085, i8* %1086, align 1
  %1087 = icmp eq i8 %1085, 0
  br i1 %1087, label %1088, label %1091

1088:                                             ; preds = %1083
  %1089 = shl nuw nsw i64 %1084, 4
  %1090 = getelementptr inbounds i8, i8* %0, i64 %1089
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1090, i8 0, i64 16, i1 false)
  br label %1091

1091:                                             ; preds = %1088, %1083
  %1092 = add nuw nsw i64 %.01, 136
  %1093 = call zeroext i8 @randombit()
  %1094 = getelementptr inbounds i8, i8* %1, i64 %1092
  store i8 %1093, i8* %1094, align 1
  %1095 = icmp eq i8 %1093, 0
  br i1 %1095, label %1096, label %1099

1096:                                             ; preds = %1091
  %1097 = shl nuw nsw i64 %1092, 4
  %1098 = getelementptr inbounds i8, i8* %0, i64 %1097
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1098, i8 0, i64 16, i1 false)
  br label %1099

1099:                                             ; preds = %1096, %1091
  %1100 = add nuw nsw i64 %.01, 137
  %1101 = call zeroext i8 @randombit()
  %1102 = getelementptr inbounds i8, i8* %1, i64 %1100
  store i8 %1101, i8* %1102, align 1
  %1103 = icmp eq i8 %1101, 0
  br i1 %1103, label %1104, label %1107

1104:                                             ; preds = %1099
  %1105 = shl nuw nsw i64 %1100, 4
  %1106 = getelementptr inbounds i8, i8* %0, i64 %1105
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1106, i8 0, i64 16, i1 false)
  br label %1107

1107:                                             ; preds = %1104, %1099
  %1108 = add nuw nsw i64 %.01, 138
  %1109 = call zeroext i8 @randombit()
  %1110 = getelementptr inbounds i8, i8* %1, i64 %1108
  store i8 %1109, i8* %1110, align 1
  %1111 = icmp eq i8 %1109, 0
  br i1 %1111, label %1112, label %1115

1112:                                             ; preds = %1107
  %1113 = shl nuw nsw i64 %1108, 4
  %1114 = getelementptr inbounds i8, i8* %0, i64 %1113
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1114, i8 0, i64 16, i1 false)
  br label %1115

1115:                                             ; preds = %1112, %1107
  %1116 = add nuw nsw i64 %.01, 139
  %1117 = call zeroext i8 @randombit()
  %1118 = getelementptr inbounds i8, i8* %1, i64 %1116
  store i8 %1117, i8* %1118, align 1
  %1119 = icmp eq i8 %1117, 0
  br i1 %1119, label %1120, label %1123

1120:                                             ; preds = %1115
  %1121 = shl nuw nsw i64 %1116, 4
  %1122 = getelementptr inbounds i8, i8* %0, i64 %1121
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1122, i8 0, i64 16, i1 false)
  br label %1123

1123:                                             ; preds = %1120, %1115
  %1124 = add nuw nsw i64 %.01, 140
  %1125 = call zeroext i8 @randombit()
  %1126 = getelementptr inbounds i8, i8* %1, i64 %1124
  store i8 %1125, i8* %1126, align 1
  %1127 = icmp eq i8 %1125, 0
  br i1 %1127, label %1128, label %1131

1128:                                             ; preds = %1123
  %1129 = shl nuw nsw i64 %1124, 4
  %1130 = getelementptr inbounds i8, i8* %0, i64 %1129
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1130, i8 0, i64 16, i1 false)
  br label %1131

1131:                                             ; preds = %1128, %1123
  %1132 = add nuw nsw i64 %.01, 141
  %1133 = call zeroext i8 @randombit()
  %1134 = getelementptr inbounds i8, i8* %1, i64 %1132
  store i8 %1133, i8* %1134, align 1
  %1135 = icmp eq i8 %1133, 0
  br i1 %1135, label %1136, label %1139

1136:                                             ; preds = %1131
  %1137 = shl nuw nsw i64 %1132, 4
  %1138 = getelementptr inbounds i8, i8* %0, i64 %1137
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1138, i8 0, i64 16, i1 false)
  br label %1139

1139:                                             ; preds = %1136, %1131
  %1140 = add nuw nsw i64 %.01, 142
  %1141 = call zeroext i8 @randombit()
  %1142 = getelementptr inbounds i8, i8* %1, i64 %1140
  store i8 %1141, i8* %1142, align 1
  %1143 = icmp eq i8 %1141, 0
  br i1 %1143, label %1144, label %1147

1144:                                             ; preds = %1139
  %1145 = shl nuw nsw i64 %1140, 4
  %1146 = getelementptr inbounds i8, i8* %0, i64 %1145
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1146, i8 0, i64 16, i1 false)
  br label %1147

1147:                                             ; preds = %1144, %1139
  %1148 = add nuw nsw i64 %.01, 143
  %1149 = call zeroext i8 @randombit()
  %1150 = getelementptr inbounds i8, i8* %1, i64 %1148
  store i8 %1149, i8* %1150, align 1
  %1151 = icmp eq i8 %1149, 0
  br i1 %1151, label %1152, label %1155

1152:                                             ; preds = %1147
  %1153 = shl nuw nsw i64 %1148, 4
  %1154 = getelementptr inbounds i8, i8* %0, i64 %1153
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1154, i8 0, i64 16, i1 false)
  br label %1155

1155:                                             ; preds = %1152, %1147
  %1156 = add nuw nsw i64 %.01, 144
  %1157 = call zeroext i8 @randombit()
  %1158 = getelementptr inbounds i8, i8* %1, i64 %1156
  store i8 %1157, i8* %1158, align 1
  %1159 = icmp eq i8 %1157, 0
  br i1 %1159, label %1160, label %1163

1160:                                             ; preds = %1155
  %1161 = shl nuw nsw i64 %1156, 4
  %1162 = getelementptr inbounds i8, i8* %0, i64 %1161
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1162, i8 0, i64 16, i1 false)
  br label %1163

1163:                                             ; preds = %1160, %1155
  %1164 = add nuw nsw i64 %.01, 145
  %1165 = call zeroext i8 @randombit()
  %1166 = getelementptr inbounds i8, i8* %1, i64 %1164
  store i8 %1165, i8* %1166, align 1
  %1167 = icmp eq i8 %1165, 0
  br i1 %1167, label %1168, label %1171

1168:                                             ; preds = %1163
  %1169 = shl nuw nsw i64 %1164, 4
  %1170 = getelementptr inbounds i8, i8* %0, i64 %1169
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1170, i8 0, i64 16, i1 false)
  br label %1171

1171:                                             ; preds = %1168, %1163
  %1172 = add nuw nsw i64 %.01, 146
  %1173 = call zeroext i8 @randombit()
  %1174 = getelementptr inbounds i8, i8* %1, i64 %1172
  store i8 %1173, i8* %1174, align 1
  %1175 = icmp eq i8 %1173, 0
  br i1 %1175, label %1176, label %1179

1176:                                             ; preds = %1171
  %1177 = shl nuw nsw i64 %1172, 4
  %1178 = getelementptr inbounds i8, i8* %0, i64 %1177
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1178, i8 0, i64 16, i1 false)
  br label %1179

1179:                                             ; preds = %1176, %1171
  %1180 = add nuw nsw i64 %.01, 147
  %1181 = call zeroext i8 @randombit()
  %1182 = getelementptr inbounds i8, i8* %1, i64 %1180
  store i8 %1181, i8* %1182, align 1
  %1183 = icmp eq i8 %1181, 0
  br i1 %1183, label %1184, label %1187

1184:                                             ; preds = %1179
  %1185 = shl nuw nsw i64 %1180, 4
  %1186 = getelementptr inbounds i8, i8* %0, i64 %1185
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1186, i8 0, i64 16, i1 false)
  br label %1187

1187:                                             ; preds = %1184, %1179
  %1188 = add nuw nsw i64 %.01, 148
  %1189 = call zeroext i8 @randombit()
  %1190 = getelementptr inbounds i8, i8* %1, i64 %1188
  store i8 %1189, i8* %1190, align 1
  %1191 = icmp eq i8 %1189, 0
  br i1 %1191, label %1192, label %1195

1192:                                             ; preds = %1187
  %1193 = shl nuw nsw i64 %1188, 4
  %1194 = getelementptr inbounds i8, i8* %0, i64 %1193
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1194, i8 0, i64 16, i1 false)
  br label %1195

1195:                                             ; preds = %1192, %1187
  %1196 = add nuw nsw i64 %.01, 149
  %1197 = call zeroext i8 @randombit()
  %1198 = getelementptr inbounds i8, i8* %1, i64 %1196
  store i8 %1197, i8* %1198, align 1
  %1199 = icmp eq i8 %1197, 0
  br i1 %1199, label %1200, label %1203

1200:                                             ; preds = %1195
  %1201 = shl nuw nsw i64 %1196, 4
  %1202 = getelementptr inbounds i8, i8* %0, i64 %1201
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1202, i8 0, i64 16, i1 false)
  br label %1203

1203:                                             ; preds = %1200, %1195
  %1204 = add nuw nsw i64 %.01, 150
  %1205 = call zeroext i8 @randombit()
  %1206 = getelementptr inbounds i8, i8* %1, i64 %1204
  store i8 %1205, i8* %1206, align 1
  %1207 = icmp eq i8 %1205, 0
  br i1 %1207, label %1208, label %1211

1208:                                             ; preds = %1203
  %1209 = shl nuw nsw i64 %1204, 4
  %1210 = getelementptr inbounds i8, i8* %0, i64 %1209
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1210, i8 0, i64 16, i1 false)
  br label %1211

1211:                                             ; preds = %1208, %1203
  %1212 = add nuw nsw i64 %.01, 151
  %1213 = call zeroext i8 @randombit()
  %1214 = getelementptr inbounds i8, i8* %1, i64 %1212
  store i8 %1213, i8* %1214, align 1
  %1215 = icmp eq i8 %1213, 0
  br i1 %1215, label %1216, label %1219

1216:                                             ; preds = %1211
  %1217 = shl nuw nsw i64 %1212, 4
  %1218 = getelementptr inbounds i8, i8* %0, i64 %1217
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1218, i8 0, i64 16, i1 false)
  br label %1219

1219:                                             ; preds = %1216, %1211
  %1220 = add nuw nsw i64 %.01, 152
  %1221 = call zeroext i8 @randombit()
  %1222 = getelementptr inbounds i8, i8* %1, i64 %1220
  store i8 %1221, i8* %1222, align 1
  %1223 = icmp eq i8 %1221, 0
  br i1 %1223, label %1224, label %1227

1224:                                             ; preds = %1219
  %1225 = shl nuw nsw i64 %1220, 4
  %1226 = getelementptr inbounds i8, i8* %0, i64 %1225
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1226, i8 0, i64 16, i1 false)
  br label %1227

1227:                                             ; preds = %1224, %1219
  %1228 = add nuw nsw i64 %.01, 153
  %1229 = call zeroext i8 @randombit()
  %1230 = getelementptr inbounds i8, i8* %1, i64 %1228
  store i8 %1229, i8* %1230, align 1
  %1231 = icmp eq i8 %1229, 0
  br i1 %1231, label %1232, label %1235

1232:                                             ; preds = %1227
  %1233 = shl nuw nsw i64 %1228, 4
  %1234 = getelementptr inbounds i8, i8* %0, i64 %1233
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1234, i8 0, i64 16, i1 false)
  br label %1235

1235:                                             ; preds = %1232, %1227
  %1236 = add nuw nsw i64 %.01, 154
  %1237 = call zeroext i8 @randombit()
  %1238 = getelementptr inbounds i8, i8* %1, i64 %1236
  store i8 %1237, i8* %1238, align 1
  %1239 = icmp eq i8 %1237, 0
  br i1 %1239, label %1240, label %1243

1240:                                             ; preds = %1235
  %1241 = shl nuw nsw i64 %1236, 4
  %1242 = getelementptr inbounds i8, i8* %0, i64 %1241
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1242, i8 0, i64 16, i1 false)
  br label %1243

1243:                                             ; preds = %1240, %1235
  %1244 = add nuw nsw i64 %.01, 155
  %1245 = call zeroext i8 @randombit()
  %1246 = getelementptr inbounds i8, i8* %1, i64 %1244
  store i8 %1245, i8* %1246, align 1
  %1247 = icmp eq i8 %1245, 0
  br i1 %1247, label %1248, label %1251

1248:                                             ; preds = %1243
  %1249 = shl nuw nsw i64 %1244, 4
  %1250 = getelementptr inbounds i8, i8* %0, i64 %1249
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1250, i8 0, i64 16, i1 false)
  br label %1251

1251:                                             ; preds = %1248, %1243
  %1252 = add nuw nsw i64 %.01, 156
  %1253 = call zeroext i8 @randombit()
  %1254 = getelementptr inbounds i8, i8* %1, i64 %1252
  store i8 %1253, i8* %1254, align 1
  %1255 = icmp eq i8 %1253, 0
  br i1 %1255, label %1256, label %1259

1256:                                             ; preds = %1251
  %1257 = shl nuw nsw i64 %1252, 4
  %1258 = getelementptr inbounds i8, i8* %0, i64 %1257
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1258, i8 0, i64 16, i1 false)
  br label %1259

1259:                                             ; preds = %1256, %1251
  %1260 = add nuw nsw i64 %.01, 157
  %1261 = call zeroext i8 @randombit()
  %1262 = getelementptr inbounds i8, i8* %1, i64 %1260
  store i8 %1261, i8* %1262, align 1
  %1263 = icmp eq i8 %1261, 0
  br i1 %1263, label %1264, label %1267

1264:                                             ; preds = %1259
  %1265 = shl nuw nsw i64 %1260, 4
  %1266 = getelementptr inbounds i8, i8* %0, i64 %1265
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1266, i8 0, i64 16, i1 false)
  br label %1267

1267:                                             ; preds = %1264, %1259
  %1268 = add nuw nsw i64 %.01, 158
  %1269 = call zeroext i8 @randombit()
  %1270 = getelementptr inbounds i8, i8* %1, i64 %1268
  store i8 %1269, i8* %1270, align 1
  %1271 = icmp eq i8 %1269, 0
  br i1 %1271, label %1272, label %1275

1272:                                             ; preds = %1267
  %1273 = shl nuw nsw i64 %1268, 4
  %1274 = getelementptr inbounds i8, i8* %0, i64 %1273
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1274, i8 0, i64 16, i1 false)
  br label %1275

1275:                                             ; preds = %1272, %1267
  %1276 = add nuw nsw i64 %.01, 159
  %1277 = call zeroext i8 @randombit()
  %1278 = getelementptr inbounds i8, i8* %1, i64 %1276
  store i8 %1277, i8* %1278, align 1
  %1279 = icmp eq i8 %1277, 0
  br i1 %1279, label %1280, label %1283

1280:                                             ; preds = %1275
  %1281 = shl nuw nsw i64 %1276, 4
  %1282 = getelementptr inbounds i8, i8* %0, i64 %1281
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1282, i8 0, i64 16, i1 false)
  br label %1283

1283:                                             ; preds = %1280, %1275
  %1284 = add nuw nsw i64 %.01, 160
  %1285 = call zeroext i8 @randombit()
  %1286 = getelementptr inbounds i8, i8* %1, i64 %1284
  store i8 %1285, i8* %1286, align 1
  %1287 = icmp eq i8 %1285, 0
  br i1 %1287, label %1288, label %1291

1288:                                             ; preds = %1283
  %1289 = shl nuw nsw i64 %1284, 4
  %1290 = getelementptr inbounds i8, i8* %0, i64 %1289
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1290, i8 0, i64 16, i1 false)
  br label %1291

1291:                                             ; preds = %1288, %1283
  %1292 = add nuw nsw i64 %.01, 161
  %1293 = call zeroext i8 @randombit()
  %1294 = getelementptr inbounds i8, i8* %1, i64 %1292
  store i8 %1293, i8* %1294, align 1
  %1295 = icmp eq i8 %1293, 0
  br i1 %1295, label %1296, label %1299

1296:                                             ; preds = %1291
  %1297 = shl nuw nsw i64 %1292, 4
  %1298 = getelementptr inbounds i8, i8* %0, i64 %1297
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1298, i8 0, i64 16, i1 false)
  br label %1299

1299:                                             ; preds = %1296, %1291
  %1300 = add nuw nsw i64 %.01, 162
  %1301 = call zeroext i8 @randombit()
  %1302 = getelementptr inbounds i8, i8* %1, i64 %1300
  store i8 %1301, i8* %1302, align 1
  %1303 = icmp eq i8 %1301, 0
  br i1 %1303, label %1304, label %1307

1304:                                             ; preds = %1299
  %1305 = shl nuw nsw i64 %1300, 4
  %1306 = getelementptr inbounds i8, i8* %0, i64 %1305
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1306, i8 0, i64 16, i1 false)
  br label %1307

1307:                                             ; preds = %1304, %1299
  %1308 = add nuw nsw i64 %.01, 163
  %1309 = call zeroext i8 @randombit()
  %1310 = getelementptr inbounds i8, i8* %1, i64 %1308
  store i8 %1309, i8* %1310, align 1
  %1311 = icmp eq i8 %1309, 0
  br i1 %1311, label %1312, label %1315

1312:                                             ; preds = %1307
  %1313 = shl nuw nsw i64 %1308, 4
  %1314 = getelementptr inbounds i8, i8* %0, i64 %1313
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1314, i8 0, i64 16, i1 false)
  br label %1315

1315:                                             ; preds = %1312, %1307
  %1316 = add nuw nsw i64 %.01, 164
  %1317 = call zeroext i8 @randombit()
  %1318 = getelementptr inbounds i8, i8* %1, i64 %1316
  store i8 %1317, i8* %1318, align 1
  %1319 = icmp eq i8 %1317, 0
  br i1 %1319, label %1320, label %1323

1320:                                             ; preds = %1315
  %1321 = shl nuw nsw i64 %1316, 4
  %1322 = getelementptr inbounds i8, i8* %0, i64 %1321
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1322, i8 0, i64 16, i1 false)
  br label %1323

1323:                                             ; preds = %1320, %1315
  %1324 = add nuw nsw i64 %.01, 165
  %1325 = call zeroext i8 @randombit()
  %1326 = getelementptr inbounds i8, i8* %1, i64 %1324
  store i8 %1325, i8* %1326, align 1
  %1327 = icmp eq i8 %1325, 0
  br i1 %1327, label %1328, label %1331

1328:                                             ; preds = %1323
  %1329 = shl nuw nsw i64 %1324, 4
  %1330 = getelementptr inbounds i8, i8* %0, i64 %1329
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1330, i8 0, i64 16, i1 false)
  br label %1331

1331:                                             ; preds = %1328, %1323
  %1332 = add nuw nsw i64 %.01, 166
  %1333 = call zeroext i8 @randombit()
  %1334 = getelementptr inbounds i8, i8* %1, i64 %1332
  store i8 %1333, i8* %1334, align 1
  %1335 = icmp eq i8 %1333, 0
  br i1 %1335, label %1336, label %1339

1336:                                             ; preds = %1331
  %1337 = shl nuw nsw i64 %1332, 4
  %1338 = getelementptr inbounds i8, i8* %0, i64 %1337
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1338, i8 0, i64 16, i1 false)
  br label %1339

1339:                                             ; preds = %1336, %1331
  %1340 = add nuw nsw i64 %.01, 167
  %1341 = call zeroext i8 @randombit()
  %1342 = getelementptr inbounds i8, i8* %1, i64 %1340
  store i8 %1341, i8* %1342, align 1
  %1343 = icmp eq i8 %1341, 0
  br i1 %1343, label %1344, label %1347

1344:                                             ; preds = %1339
  %1345 = shl nuw nsw i64 %1340, 4
  %1346 = getelementptr inbounds i8, i8* %0, i64 %1345
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1346, i8 0, i64 16, i1 false)
  br label %1347

1347:                                             ; preds = %1344, %1339
  %1348 = add nuw nsw i64 %.01, 168
  %1349 = call zeroext i8 @randombit()
  %1350 = getelementptr inbounds i8, i8* %1, i64 %1348
  store i8 %1349, i8* %1350, align 1
  %1351 = icmp eq i8 %1349, 0
  br i1 %1351, label %1352, label %1355

1352:                                             ; preds = %1347
  %1353 = shl nuw nsw i64 %1348, 4
  %1354 = getelementptr inbounds i8, i8* %0, i64 %1353
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1354, i8 0, i64 16, i1 false)
  br label %1355

1355:                                             ; preds = %1352, %1347
  %1356 = add nuw nsw i64 %.01, 169
  %1357 = call zeroext i8 @randombit()
  %1358 = getelementptr inbounds i8, i8* %1, i64 %1356
  store i8 %1357, i8* %1358, align 1
  %1359 = icmp eq i8 %1357, 0
  br i1 %1359, label %1360, label %1363

1360:                                             ; preds = %1355
  %1361 = shl nuw nsw i64 %1356, 4
  %1362 = getelementptr inbounds i8, i8* %0, i64 %1361
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1362, i8 0, i64 16, i1 false)
  br label %1363

1363:                                             ; preds = %1360, %1355
  %1364 = add nuw nsw i64 %.01, 170
  %1365 = call zeroext i8 @randombit()
  %1366 = getelementptr inbounds i8, i8* %1, i64 %1364
  store i8 %1365, i8* %1366, align 1
  %1367 = icmp eq i8 %1365, 0
  br i1 %1367, label %1368, label %1371

1368:                                             ; preds = %1363
  %1369 = shl nuw nsw i64 %1364, 4
  %1370 = getelementptr inbounds i8, i8* %0, i64 %1369
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1370, i8 0, i64 16, i1 false)
  br label %1371

1371:                                             ; preds = %1368, %1363
  %1372 = add nuw nsw i64 %.01, 171
  %1373 = call zeroext i8 @randombit()
  %1374 = getelementptr inbounds i8, i8* %1, i64 %1372
  store i8 %1373, i8* %1374, align 1
  %1375 = icmp eq i8 %1373, 0
  br i1 %1375, label %1376, label %1379

1376:                                             ; preds = %1371
  %1377 = shl nuw nsw i64 %1372, 4
  %1378 = getelementptr inbounds i8, i8* %0, i64 %1377
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1378, i8 0, i64 16, i1 false)
  br label %1379

1379:                                             ; preds = %1376, %1371
  %1380 = add nuw nsw i64 %.01, 172
  %1381 = call zeroext i8 @randombit()
  %1382 = getelementptr inbounds i8, i8* %1, i64 %1380
  store i8 %1381, i8* %1382, align 1
  %1383 = icmp eq i8 %1381, 0
  br i1 %1383, label %1384, label %1387

1384:                                             ; preds = %1379
  %1385 = shl nuw nsw i64 %1380, 4
  %1386 = getelementptr inbounds i8, i8* %0, i64 %1385
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1386, i8 0, i64 16, i1 false)
  br label %1387

1387:                                             ; preds = %1384, %1379
  %1388 = add nuw nsw i64 %.01, 173
  %1389 = call zeroext i8 @randombit()
  %1390 = getelementptr inbounds i8, i8* %1, i64 %1388
  store i8 %1389, i8* %1390, align 1
  %1391 = icmp eq i8 %1389, 0
  br i1 %1391, label %1392, label %1395

1392:                                             ; preds = %1387
  %1393 = shl nuw nsw i64 %1388, 4
  %1394 = getelementptr inbounds i8, i8* %0, i64 %1393
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1394, i8 0, i64 16, i1 false)
  br label %1395

1395:                                             ; preds = %1392, %1387
  %1396 = add nuw nsw i64 %.01, 174
  %1397 = call zeroext i8 @randombit()
  %1398 = getelementptr inbounds i8, i8* %1, i64 %1396
  store i8 %1397, i8* %1398, align 1
  %1399 = icmp eq i8 %1397, 0
  br i1 %1399, label %1400, label %1403

1400:                                             ; preds = %1395
  %1401 = shl nuw nsw i64 %1396, 4
  %1402 = getelementptr inbounds i8, i8* %0, i64 %1401
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1402, i8 0, i64 16, i1 false)
  br label %1403

1403:                                             ; preds = %1400, %1395
  %1404 = add nuw nsw i64 %.01, 175
  %1405 = call zeroext i8 @randombit()
  %1406 = getelementptr inbounds i8, i8* %1, i64 %1404
  store i8 %1405, i8* %1406, align 1
  %1407 = icmp eq i8 %1405, 0
  br i1 %1407, label %1408, label %1411

1408:                                             ; preds = %1403
  %1409 = shl nuw nsw i64 %1404, 4
  %1410 = getelementptr inbounds i8, i8* %0, i64 %1409
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1410, i8 0, i64 16, i1 false)
  br label %1411

1411:                                             ; preds = %1408, %1403
  %1412 = add nuw nsw i64 %.01, 176
  %1413 = call zeroext i8 @randombit()
  %1414 = getelementptr inbounds i8, i8* %1, i64 %1412
  store i8 %1413, i8* %1414, align 1
  %1415 = icmp eq i8 %1413, 0
  br i1 %1415, label %1416, label %1419

1416:                                             ; preds = %1411
  %1417 = shl nuw nsw i64 %1412, 4
  %1418 = getelementptr inbounds i8, i8* %0, i64 %1417
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1418, i8 0, i64 16, i1 false)
  br label %1419

1419:                                             ; preds = %1416, %1411
  %1420 = add nuw nsw i64 %.01, 177
  %1421 = call zeroext i8 @randombit()
  %1422 = getelementptr inbounds i8, i8* %1, i64 %1420
  store i8 %1421, i8* %1422, align 1
  %1423 = icmp eq i8 %1421, 0
  br i1 %1423, label %1424, label %1427

1424:                                             ; preds = %1419
  %1425 = shl nuw nsw i64 %1420, 4
  %1426 = getelementptr inbounds i8, i8* %0, i64 %1425
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1426, i8 0, i64 16, i1 false)
  br label %1427

1427:                                             ; preds = %1424, %1419
  %1428 = add nuw nsw i64 %.01, 178
  %1429 = call zeroext i8 @randombit()
  %1430 = getelementptr inbounds i8, i8* %1, i64 %1428
  store i8 %1429, i8* %1430, align 1
  %1431 = icmp eq i8 %1429, 0
  br i1 %1431, label %1432, label %1435

1432:                                             ; preds = %1427
  %1433 = shl nuw nsw i64 %1428, 4
  %1434 = getelementptr inbounds i8, i8* %0, i64 %1433
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1434, i8 0, i64 16, i1 false)
  br label %1435

1435:                                             ; preds = %1432, %1427
  %1436 = add nuw nsw i64 %.01, 179
  %1437 = call zeroext i8 @randombit()
  %1438 = getelementptr inbounds i8, i8* %1, i64 %1436
  store i8 %1437, i8* %1438, align 1
  %1439 = icmp eq i8 %1437, 0
  br i1 %1439, label %1440, label %1443

1440:                                             ; preds = %1435
  %1441 = shl nuw nsw i64 %1436, 4
  %1442 = getelementptr inbounds i8, i8* %0, i64 %1441
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1442, i8 0, i64 16, i1 false)
  br label %1443

1443:                                             ; preds = %1440, %1435
  %1444 = add nuw nsw i64 %.01, 180
  %1445 = call zeroext i8 @randombit()
  %1446 = getelementptr inbounds i8, i8* %1, i64 %1444
  store i8 %1445, i8* %1446, align 1
  %1447 = icmp eq i8 %1445, 0
  br i1 %1447, label %1448, label %1451

1448:                                             ; preds = %1443
  %1449 = shl nuw nsw i64 %1444, 4
  %1450 = getelementptr inbounds i8, i8* %0, i64 %1449
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1450, i8 0, i64 16, i1 false)
  br label %1451

1451:                                             ; preds = %1448, %1443
  %1452 = add nuw nsw i64 %.01, 181
  %1453 = call zeroext i8 @randombit()
  %1454 = getelementptr inbounds i8, i8* %1, i64 %1452
  store i8 %1453, i8* %1454, align 1
  %1455 = icmp eq i8 %1453, 0
  br i1 %1455, label %1456, label %1459

1456:                                             ; preds = %1451
  %1457 = shl nuw nsw i64 %1452, 4
  %1458 = getelementptr inbounds i8, i8* %0, i64 %1457
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1458, i8 0, i64 16, i1 false)
  br label %1459

1459:                                             ; preds = %1456, %1451
  %1460 = add nuw nsw i64 %.01, 182
  %1461 = call zeroext i8 @randombit()
  %1462 = getelementptr inbounds i8, i8* %1, i64 %1460
  store i8 %1461, i8* %1462, align 1
  %1463 = icmp eq i8 %1461, 0
  br i1 %1463, label %1464, label %1467

1464:                                             ; preds = %1459
  %1465 = shl nuw nsw i64 %1460, 4
  %1466 = getelementptr inbounds i8, i8* %0, i64 %1465
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1466, i8 0, i64 16, i1 false)
  br label %1467

1467:                                             ; preds = %1464, %1459
  %1468 = add nuw nsw i64 %.01, 183
  %1469 = call zeroext i8 @randombit()
  %1470 = getelementptr inbounds i8, i8* %1, i64 %1468
  store i8 %1469, i8* %1470, align 1
  %1471 = icmp eq i8 %1469, 0
  br i1 %1471, label %1472, label %1475

1472:                                             ; preds = %1467
  %1473 = shl nuw nsw i64 %1468, 4
  %1474 = getelementptr inbounds i8, i8* %0, i64 %1473
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1474, i8 0, i64 16, i1 false)
  br label %1475

1475:                                             ; preds = %1472, %1467
  %1476 = add nuw nsw i64 %.01, 184
  %1477 = call zeroext i8 @randombit()
  %1478 = getelementptr inbounds i8, i8* %1, i64 %1476
  store i8 %1477, i8* %1478, align 1
  %1479 = icmp eq i8 %1477, 0
  br i1 %1479, label %1480, label %1483

1480:                                             ; preds = %1475
  %1481 = shl nuw nsw i64 %1476, 4
  %1482 = getelementptr inbounds i8, i8* %0, i64 %1481
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1482, i8 0, i64 16, i1 false)
  br label %1483

1483:                                             ; preds = %1480, %1475
  %1484 = add nuw nsw i64 %.01, 185
  %1485 = call zeroext i8 @randombit()
  %1486 = getelementptr inbounds i8, i8* %1, i64 %1484
  store i8 %1485, i8* %1486, align 1
  %1487 = icmp eq i8 %1485, 0
  br i1 %1487, label %1488, label %1491

1488:                                             ; preds = %1483
  %1489 = shl nuw nsw i64 %1484, 4
  %1490 = getelementptr inbounds i8, i8* %0, i64 %1489
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1490, i8 0, i64 16, i1 false)
  br label %1491

1491:                                             ; preds = %1488, %1483
  %1492 = add nuw nsw i64 %.01, 186
  %1493 = call zeroext i8 @randombit()
  %1494 = getelementptr inbounds i8, i8* %1, i64 %1492
  store i8 %1493, i8* %1494, align 1
  %1495 = icmp eq i8 %1493, 0
  br i1 %1495, label %1496, label %1499

1496:                                             ; preds = %1491
  %1497 = shl nuw nsw i64 %1492, 4
  %1498 = getelementptr inbounds i8, i8* %0, i64 %1497
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1498, i8 0, i64 16, i1 false)
  br label %1499

1499:                                             ; preds = %1496, %1491
  %1500 = add nuw nsw i64 %.01, 187
  %1501 = call zeroext i8 @randombit()
  %1502 = getelementptr inbounds i8, i8* %1, i64 %1500
  store i8 %1501, i8* %1502, align 1
  %1503 = icmp eq i8 %1501, 0
  br i1 %1503, label %1504, label %1507

1504:                                             ; preds = %1499
  %1505 = shl nuw nsw i64 %1500, 4
  %1506 = getelementptr inbounds i8, i8* %0, i64 %1505
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1506, i8 0, i64 16, i1 false)
  br label %1507

1507:                                             ; preds = %1504, %1499
  %1508 = add nuw nsw i64 %.01, 188
  %1509 = call zeroext i8 @randombit()
  %1510 = getelementptr inbounds i8, i8* %1, i64 %1508
  store i8 %1509, i8* %1510, align 1
  %1511 = icmp eq i8 %1509, 0
  br i1 %1511, label %1512, label %1515

1512:                                             ; preds = %1507
  %1513 = shl nuw nsw i64 %1508, 4
  %1514 = getelementptr inbounds i8, i8* %0, i64 %1513
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1514, i8 0, i64 16, i1 false)
  br label %1515

1515:                                             ; preds = %1512, %1507
  %1516 = add nuw nsw i64 %.01, 189
  %1517 = call zeroext i8 @randombit()
  %1518 = getelementptr inbounds i8, i8* %1, i64 %1516
  store i8 %1517, i8* %1518, align 1
  %1519 = icmp eq i8 %1517, 0
  br i1 %1519, label %1520, label %1523

1520:                                             ; preds = %1515
  %1521 = shl nuw nsw i64 %1516, 4
  %1522 = getelementptr inbounds i8, i8* %0, i64 %1521
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1522, i8 0, i64 16, i1 false)
  br label %1523

1523:                                             ; preds = %1520, %1515
  %1524 = add nuw nsw i64 %.01, 190
  %1525 = call zeroext i8 @randombit()
  %1526 = getelementptr inbounds i8, i8* %1, i64 %1524
  store i8 %1525, i8* %1526, align 1
  %1527 = icmp eq i8 %1525, 0
  br i1 %1527, label %1528, label %1531

1528:                                             ; preds = %1523
  %1529 = shl nuw nsw i64 %1524, 4
  %1530 = getelementptr inbounds i8, i8* %0, i64 %1529
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1530, i8 0, i64 16, i1 false)
  br label %1531

1531:                                             ; preds = %1528, %1523
  %1532 = add nuw nsw i64 %.01, 191
  %1533 = call zeroext i8 @randombit()
  %1534 = getelementptr inbounds i8, i8* %1, i64 %1532
  store i8 %1533, i8* %1534, align 1
  %1535 = icmp eq i8 %1533, 0
  br i1 %1535, label %1536, label %1539

1536:                                             ; preds = %1531
  %1537 = shl nuw nsw i64 %1532, 4
  %1538 = getelementptr inbounds i8, i8* %0, i64 %1537
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1538, i8 0, i64 16, i1 false)
  br label %1539

1539:                                             ; preds = %1536, %1531
  %1540 = add nuw nsw i64 %.01, 192
  %1541 = call zeroext i8 @randombit()
  %1542 = getelementptr inbounds i8, i8* %1, i64 %1540
  store i8 %1541, i8* %1542, align 1
  %1543 = icmp eq i8 %1541, 0
  br i1 %1543, label %1544, label %1547

1544:                                             ; preds = %1539
  %1545 = shl nuw nsw i64 %1540, 4
  %1546 = getelementptr inbounds i8, i8* %0, i64 %1545
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1546, i8 0, i64 16, i1 false)
  br label %1547

1547:                                             ; preds = %1544, %1539
  %1548 = add nuw nsw i64 %.01, 193
  %1549 = call zeroext i8 @randombit()
  %1550 = getelementptr inbounds i8, i8* %1, i64 %1548
  store i8 %1549, i8* %1550, align 1
  %1551 = icmp eq i8 %1549, 0
  br i1 %1551, label %1552, label %1555

1552:                                             ; preds = %1547
  %1553 = shl nuw nsw i64 %1548, 4
  %1554 = getelementptr inbounds i8, i8* %0, i64 %1553
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1554, i8 0, i64 16, i1 false)
  br label %1555

1555:                                             ; preds = %1552, %1547
  %1556 = add nuw nsw i64 %.01, 194
  %1557 = call zeroext i8 @randombit()
  %1558 = getelementptr inbounds i8, i8* %1, i64 %1556
  store i8 %1557, i8* %1558, align 1
  %1559 = icmp eq i8 %1557, 0
  br i1 %1559, label %1560, label %1563

1560:                                             ; preds = %1555
  %1561 = shl nuw nsw i64 %1556, 4
  %1562 = getelementptr inbounds i8, i8* %0, i64 %1561
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1562, i8 0, i64 16, i1 false)
  br label %1563

1563:                                             ; preds = %1560, %1555
  %1564 = add nuw nsw i64 %.01, 195
  %1565 = call zeroext i8 @randombit()
  %1566 = getelementptr inbounds i8, i8* %1, i64 %1564
  store i8 %1565, i8* %1566, align 1
  %1567 = icmp eq i8 %1565, 0
  br i1 %1567, label %1568, label %1571

1568:                                             ; preds = %1563
  %1569 = shl nuw nsw i64 %1564, 4
  %1570 = getelementptr inbounds i8, i8* %0, i64 %1569
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1570, i8 0, i64 16, i1 false)
  br label %1571

1571:                                             ; preds = %1568, %1563
  %1572 = add nuw nsw i64 %.01, 196
  %1573 = call zeroext i8 @randombit()
  %1574 = getelementptr inbounds i8, i8* %1, i64 %1572
  store i8 %1573, i8* %1574, align 1
  %1575 = icmp eq i8 %1573, 0
  br i1 %1575, label %1576, label %1579

1576:                                             ; preds = %1571
  %1577 = shl nuw nsw i64 %1572, 4
  %1578 = getelementptr inbounds i8, i8* %0, i64 %1577
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1578, i8 0, i64 16, i1 false)
  br label %1579

1579:                                             ; preds = %1576, %1571
  %1580 = add nuw nsw i64 %.01, 197
  %1581 = call zeroext i8 @randombit()
  %1582 = getelementptr inbounds i8, i8* %1, i64 %1580
  store i8 %1581, i8* %1582, align 1
  %1583 = icmp eq i8 %1581, 0
  br i1 %1583, label %1584, label %1587

1584:                                             ; preds = %1579
  %1585 = shl nuw nsw i64 %1580, 4
  %1586 = getelementptr inbounds i8, i8* %0, i64 %1585
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1586, i8 0, i64 16, i1 false)
  br label %1587

1587:                                             ; preds = %1584, %1579
  %1588 = add nuw nsw i64 %.01, 198
  %1589 = call zeroext i8 @randombit()
  %1590 = getelementptr inbounds i8, i8* %1, i64 %1588
  store i8 %1589, i8* %1590, align 1
  %1591 = icmp eq i8 %1589, 0
  br i1 %1591, label %1592, label %1595

1592:                                             ; preds = %1587
  %1593 = shl nuw nsw i64 %1588, 4
  %1594 = getelementptr inbounds i8, i8* %0, i64 %1593
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1594, i8 0, i64 16, i1 false)
  br label %1595

1595:                                             ; preds = %1592, %1587
  %1596 = add nuw nsw i64 %.01, 199
  %1597 = call zeroext i8 @randombit()
  %1598 = getelementptr inbounds i8, i8* %1, i64 %1596
  store i8 %1597, i8* %1598, align 1
  %1599 = icmp eq i8 %1597, 0
  br i1 %1599, label %1600, label %1603

1600:                                             ; preds = %1595
  %1601 = shl nuw nsw i64 %1596, 4
  %1602 = getelementptr inbounds i8, i8* %0, i64 %1601
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1602, i8 0, i64 16, i1 false)
  br label %1603

1603:                                             ; preds = %1600, %1595
  %1604 = add nuw nsw i64 %.01, 200
  %1605 = call zeroext i8 @randombit()
  %1606 = getelementptr inbounds i8, i8* %1, i64 %1604
  store i8 %1605, i8* %1606, align 1
  %1607 = icmp eq i8 %1605, 0
  br i1 %1607, label %1608, label %1611

1608:                                             ; preds = %1603
  %1609 = shl nuw nsw i64 %1604, 4
  %1610 = getelementptr inbounds i8, i8* %0, i64 %1609
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1610, i8 0, i64 16, i1 false)
  br label %1611

1611:                                             ; preds = %1608, %1603
  %1612 = add nuw nsw i64 %.01, 201
  %1613 = call zeroext i8 @randombit()
  %1614 = getelementptr inbounds i8, i8* %1, i64 %1612
  store i8 %1613, i8* %1614, align 1
  %1615 = icmp eq i8 %1613, 0
  br i1 %1615, label %1616, label %1619

1616:                                             ; preds = %1611
  %1617 = shl nuw nsw i64 %1612, 4
  %1618 = getelementptr inbounds i8, i8* %0, i64 %1617
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1618, i8 0, i64 16, i1 false)
  br label %1619

1619:                                             ; preds = %1616, %1611
  %1620 = add nuw nsw i64 %.01, 202
  %1621 = call zeroext i8 @randombit()
  %1622 = getelementptr inbounds i8, i8* %1, i64 %1620
  store i8 %1621, i8* %1622, align 1
  %1623 = icmp eq i8 %1621, 0
  br i1 %1623, label %1624, label %1627

1624:                                             ; preds = %1619
  %1625 = shl nuw nsw i64 %1620, 4
  %1626 = getelementptr inbounds i8, i8* %0, i64 %1625
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1626, i8 0, i64 16, i1 false)
  br label %1627

1627:                                             ; preds = %1624, %1619
  %1628 = add nuw nsw i64 %.01, 203
  %1629 = call zeroext i8 @randombit()
  %1630 = getelementptr inbounds i8, i8* %1, i64 %1628
  store i8 %1629, i8* %1630, align 1
  %1631 = icmp eq i8 %1629, 0
  br i1 %1631, label %1632, label %1635

1632:                                             ; preds = %1627
  %1633 = shl nuw nsw i64 %1628, 4
  %1634 = getelementptr inbounds i8, i8* %0, i64 %1633
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1634, i8 0, i64 16, i1 false)
  br label %1635

1635:                                             ; preds = %1632, %1627
  %1636 = add nuw nsw i64 %.01, 204
  %1637 = call zeroext i8 @randombit()
  %1638 = getelementptr inbounds i8, i8* %1, i64 %1636
  store i8 %1637, i8* %1638, align 1
  %1639 = icmp eq i8 %1637, 0
  br i1 %1639, label %1640, label %1643

1640:                                             ; preds = %1635
  %1641 = shl nuw nsw i64 %1636, 4
  %1642 = getelementptr inbounds i8, i8* %0, i64 %1641
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1642, i8 0, i64 16, i1 false)
  br label %1643

1643:                                             ; preds = %1640, %1635
  %1644 = add nuw nsw i64 %.01, 205
  %1645 = call zeroext i8 @randombit()
  %1646 = getelementptr inbounds i8, i8* %1, i64 %1644
  store i8 %1645, i8* %1646, align 1
  %1647 = icmp eq i8 %1645, 0
  br i1 %1647, label %1648, label %1651

1648:                                             ; preds = %1643
  %1649 = shl nuw nsw i64 %1644, 4
  %1650 = getelementptr inbounds i8, i8* %0, i64 %1649
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1650, i8 0, i64 16, i1 false)
  br label %1651

1651:                                             ; preds = %1648, %1643
  %1652 = add nuw nsw i64 %.01, 206
  %1653 = call zeroext i8 @randombit()
  %1654 = getelementptr inbounds i8, i8* %1, i64 %1652
  store i8 %1653, i8* %1654, align 1
  %1655 = icmp eq i8 %1653, 0
  br i1 %1655, label %1656, label %1659

1656:                                             ; preds = %1651
  %1657 = shl nuw nsw i64 %1652, 4
  %1658 = getelementptr inbounds i8, i8* %0, i64 %1657
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1658, i8 0, i64 16, i1 false)
  br label %1659

1659:                                             ; preds = %1656, %1651
  %1660 = add nuw nsw i64 %.01, 207
  %1661 = call zeroext i8 @randombit()
  %1662 = getelementptr inbounds i8, i8* %1, i64 %1660
  store i8 %1661, i8* %1662, align 1
  %1663 = icmp eq i8 %1661, 0
  br i1 %1663, label %1664, label %1667

1664:                                             ; preds = %1659
  %1665 = shl nuw nsw i64 %1660, 4
  %1666 = getelementptr inbounds i8, i8* %0, i64 %1665
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1666, i8 0, i64 16, i1 false)
  br label %1667

1667:                                             ; preds = %1664, %1659
  %1668 = add nuw nsw i64 %.01, 208
  %1669 = call zeroext i8 @randombit()
  %1670 = getelementptr inbounds i8, i8* %1, i64 %1668
  store i8 %1669, i8* %1670, align 1
  %1671 = icmp eq i8 %1669, 0
  br i1 %1671, label %1672, label %1675

1672:                                             ; preds = %1667
  %1673 = shl nuw nsw i64 %1668, 4
  %1674 = getelementptr inbounds i8, i8* %0, i64 %1673
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1674, i8 0, i64 16, i1 false)
  br label %1675

1675:                                             ; preds = %1672, %1667
  %1676 = add nuw nsw i64 %.01, 209
  %1677 = call zeroext i8 @randombit()
  %1678 = getelementptr inbounds i8, i8* %1, i64 %1676
  store i8 %1677, i8* %1678, align 1
  %1679 = icmp eq i8 %1677, 0
  br i1 %1679, label %1680, label %1683

1680:                                             ; preds = %1675
  %1681 = shl nuw nsw i64 %1676, 4
  %1682 = getelementptr inbounds i8, i8* %0, i64 %1681
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1682, i8 0, i64 16, i1 false)
  br label %1683

1683:                                             ; preds = %1680, %1675
  %1684 = add nuw nsw i64 %.01, 210
  %1685 = call zeroext i8 @randombit()
  %1686 = getelementptr inbounds i8, i8* %1, i64 %1684
  store i8 %1685, i8* %1686, align 1
  %1687 = icmp eq i8 %1685, 0
  br i1 %1687, label %1688, label %1691

1688:                                             ; preds = %1683
  %1689 = shl nuw nsw i64 %1684, 4
  %1690 = getelementptr inbounds i8, i8* %0, i64 %1689
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1690, i8 0, i64 16, i1 false)
  br label %1691

1691:                                             ; preds = %1688, %1683
  %1692 = add nuw nsw i64 %.01, 211
  %1693 = call zeroext i8 @randombit()
  %1694 = getelementptr inbounds i8, i8* %1, i64 %1692
  store i8 %1693, i8* %1694, align 1
  %1695 = icmp eq i8 %1693, 0
  br i1 %1695, label %1696, label %1699

1696:                                             ; preds = %1691
  %1697 = shl nuw nsw i64 %1692, 4
  %1698 = getelementptr inbounds i8, i8* %0, i64 %1697
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1698, i8 0, i64 16, i1 false)
  br label %1699

1699:                                             ; preds = %1696, %1691
  %1700 = add nuw nsw i64 %.01, 212
  %1701 = call zeroext i8 @randombit()
  %1702 = getelementptr inbounds i8, i8* %1, i64 %1700
  store i8 %1701, i8* %1702, align 1
  %1703 = icmp eq i8 %1701, 0
  br i1 %1703, label %1704, label %1707

1704:                                             ; preds = %1699
  %1705 = shl nuw nsw i64 %1700, 4
  %1706 = getelementptr inbounds i8, i8* %0, i64 %1705
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1706, i8 0, i64 16, i1 false)
  br label %1707

1707:                                             ; preds = %1704, %1699
  %1708 = add nuw nsw i64 %.01, 213
  %1709 = call zeroext i8 @randombit()
  %1710 = getelementptr inbounds i8, i8* %1, i64 %1708
  store i8 %1709, i8* %1710, align 1
  %1711 = icmp eq i8 %1709, 0
  br i1 %1711, label %1712, label %1715

1712:                                             ; preds = %1707
  %1713 = shl nuw nsw i64 %1708, 4
  %1714 = getelementptr inbounds i8, i8* %0, i64 %1713
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1714, i8 0, i64 16, i1 false)
  br label %1715

1715:                                             ; preds = %1712, %1707
  %1716 = add nuw nsw i64 %.01, 214
  %1717 = call zeroext i8 @randombit()
  %1718 = getelementptr inbounds i8, i8* %1, i64 %1716
  store i8 %1717, i8* %1718, align 1
  %1719 = icmp eq i8 %1717, 0
  br i1 %1719, label %1720, label %1723

1720:                                             ; preds = %1715
  %1721 = shl nuw nsw i64 %1716, 4
  %1722 = getelementptr inbounds i8, i8* %0, i64 %1721
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1722, i8 0, i64 16, i1 false)
  br label %1723

1723:                                             ; preds = %1720, %1715
  %1724 = add nuw nsw i64 %.01, 215
  %1725 = call zeroext i8 @randombit()
  %1726 = getelementptr inbounds i8, i8* %1, i64 %1724
  store i8 %1725, i8* %1726, align 1
  %1727 = icmp eq i8 %1725, 0
  br i1 %1727, label %1728, label %1731

1728:                                             ; preds = %1723
  %1729 = shl nuw nsw i64 %1724, 4
  %1730 = getelementptr inbounds i8, i8* %0, i64 %1729
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1730, i8 0, i64 16, i1 false)
  br label %1731

1731:                                             ; preds = %1728, %1723
  %1732 = add nuw nsw i64 %.01, 216
  %1733 = call zeroext i8 @randombit()
  %1734 = getelementptr inbounds i8, i8* %1, i64 %1732
  store i8 %1733, i8* %1734, align 1
  %1735 = icmp eq i8 %1733, 0
  br i1 %1735, label %1736, label %1739

1736:                                             ; preds = %1731
  %1737 = shl nuw nsw i64 %1732, 4
  %1738 = getelementptr inbounds i8, i8* %0, i64 %1737
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1738, i8 0, i64 16, i1 false)
  br label %1739

1739:                                             ; preds = %1736, %1731
  %1740 = add nuw nsw i64 %.01, 217
  %1741 = call zeroext i8 @randombit()
  %1742 = getelementptr inbounds i8, i8* %1, i64 %1740
  store i8 %1741, i8* %1742, align 1
  %1743 = icmp eq i8 %1741, 0
  br i1 %1743, label %1744, label %1747

1744:                                             ; preds = %1739
  %1745 = shl nuw nsw i64 %1740, 4
  %1746 = getelementptr inbounds i8, i8* %0, i64 %1745
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1746, i8 0, i64 16, i1 false)
  br label %1747

1747:                                             ; preds = %1744, %1739
  %1748 = add nuw nsw i64 %.01, 218
  %1749 = call zeroext i8 @randombit()
  %1750 = getelementptr inbounds i8, i8* %1, i64 %1748
  store i8 %1749, i8* %1750, align 1
  %1751 = icmp eq i8 %1749, 0
  br i1 %1751, label %1752, label %1755

1752:                                             ; preds = %1747
  %1753 = shl nuw nsw i64 %1748, 4
  %1754 = getelementptr inbounds i8, i8* %0, i64 %1753
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1754, i8 0, i64 16, i1 false)
  br label %1755

1755:                                             ; preds = %1752, %1747
  %1756 = add nuw nsw i64 %.01, 219
  %1757 = call zeroext i8 @randombit()
  %1758 = getelementptr inbounds i8, i8* %1, i64 %1756
  store i8 %1757, i8* %1758, align 1
  %1759 = icmp eq i8 %1757, 0
  br i1 %1759, label %1760, label %1763

1760:                                             ; preds = %1755
  %1761 = shl nuw nsw i64 %1756, 4
  %1762 = getelementptr inbounds i8, i8* %0, i64 %1761
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1762, i8 0, i64 16, i1 false)
  br label %1763

1763:                                             ; preds = %1760, %1755
  %1764 = add nuw nsw i64 %.01, 220
  %1765 = call zeroext i8 @randombit()
  %1766 = getelementptr inbounds i8, i8* %1, i64 %1764
  store i8 %1765, i8* %1766, align 1
  %1767 = icmp eq i8 %1765, 0
  br i1 %1767, label %1768, label %1771

1768:                                             ; preds = %1763
  %1769 = shl nuw nsw i64 %1764, 4
  %1770 = getelementptr inbounds i8, i8* %0, i64 %1769
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1770, i8 0, i64 16, i1 false)
  br label %1771

1771:                                             ; preds = %1768, %1763
  %1772 = add nuw nsw i64 %.01, 221
  %1773 = call zeroext i8 @randombit()
  %1774 = getelementptr inbounds i8, i8* %1, i64 %1772
  store i8 %1773, i8* %1774, align 1
  %1775 = icmp eq i8 %1773, 0
  br i1 %1775, label %1776, label %1779

1776:                                             ; preds = %1771
  %1777 = shl nuw nsw i64 %1772, 4
  %1778 = getelementptr inbounds i8, i8* %0, i64 %1777
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1778, i8 0, i64 16, i1 false)
  br label %1779

1779:                                             ; preds = %1776, %1771
  %1780 = add nuw nsw i64 %.01, 222
  %1781 = call zeroext i8 @randombit()
  %1782 = getelementptr inbounds i8, i8* %1, i64 %1780
  store i8 %1781, i8* %1782, align 1
  %1783 = icmp eq i8 %1781, 0
  br i1 %1783, label %1784, label %1787

1784:                                             ; preds = %1779
  %1785 = shl nuw nsw i64 %1780, 4
  %1786 = getelementptr inbounds i8, i8* %0, i64 %1785
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1786, i8 0, i64 16, i1 false)
  br label %1787

1787:                                             ; preds = %1784, %1779
  %1788 = add nuw nsw i64 %.01, 223
  %1789 = call zeroext i8 @randombit()
  %1790 = getelementptr inbounds i8, i8* %1, i64 %1788
  store i8 %1789, i8* %1790, align 1
  %1791 = icmp eq i8 %1789, 0
  br i1 %1791, label %1792, label %1795

1792:                                             ; preds = %1787
  %1793 = shl nuw nsw i64 %1788, 4
  %1794 = getelementptr inbounds i8, i8* %0, i64 %1793
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1794, i8 0, i64 16, i1 false)
  br label %1795

1795:                                             ; preds = %1792, %1787
  %1796 = add nuw nsw i64 %.01, 224
  %1797 = call zeroext i8 @randombit()
  %1798 = getelementptr inbounds i8, i8* %1, i64 %1796
  store i8 %1797, i8* %1798, align 1
  %1799 = icmp eq i8 %1797, 0
  br i1 %1799, label %1800, label %1803

1800:                                             ; preds = %1795
  %1801 = shl nuw nsw i64 %1796, 4
  %1802 = getelementptr inbounds i8, i8* %0, i64 %1801
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1802, i8 0, i64 16, i1 false)
  br label %1803

1803:                                             ; preds = %1800, %1795
  %1804 = add nuw nsw i64 %.01, 225
  %1805 = call zeroext i8 @randombit()
  %1806 = getelementptr inbounds i8, i8* %1, i64 %1804
  store i8 %1805, i8* %1806, align 1
  %1807 = icmp eq i8 %1805, 0
  br i1 %1807, label %1808, label %1811

1808:                                             ; preds = %1803
  %1809 = shl nuw nsw i64 %1804, 4
  %1810 = getelementptr inbounds i8, i8* %0, i64 %1809
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1810, i8 0, i64 16, i1 false)
  br label %1811

1811:                                             ; preds = %1808, %1803
  %1812 = add nuw nsw i64 %.01, 226
  %1813 = call zeroext i8 @randombit()
  %1814 = getelementptr inbounds i8, i8* %1, i64 %1812
  store i8 %1813, i8* %1814, align 1
  %1815 = icmp eq i8 %1813, 0
  br i1 %1815, label %1816, label %1819

1816:                                             ; preds = %1811
  %1817 = shl nuw nsw i64 %1812, 4
  %1818 = getelementptr inbounds i8, i8* %0, i64 %1817
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1818, i8 0, i64 16, i1 false)
  br label %1819

1819:                                             ; preds = %1816, %1811
  %1820 = add nuw nsw i64 %.01, 227
  %1821 = call zeroext i8 @randombit()
  %1822 = getelementptr inbounds i8, i8* %1, i64 %1820
  store i8 %1821, i8* %1822, align 1
  %1823 = icmp eq i8 %1821, 0
  br i1 %1823, label %1824, label %1827

1824:                                             ; preds = %1819
  %1825 = shl nuw nsw i64 %1820, 4
  %1826 = getelementptr inbounds i8, i8* %0, i64 %1825
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1826, i8 0, i64 16, i1 false)
  br label %1827

1827:                                             ; preds = %1824, %1819
  %1828 = add nuw nsw i64 %.01, 228
  %1829 = call zeroext i8 @randombit()
  %1830 = getelementptr inbounds i8, i8* %1, i64 %1828
  store i8 %1829, i8* %1830, align 1
  %1831 = icmp eq i8 %1829, 0
  br i1 %1831, label %1832, label %1835

1832:                                             ; preds = %1827
  %1833 = shl nuw nsw i64 %1828, 4
  %1834 = getelementptr inbounds i8, i8* %0, i64 %1833
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1834, i8 0, i64 16, i1 false)
  br label %1835

1835:                                             ; preds = %1832, %1827
  %1836 = add nuw nsw i64 %.01, 229
  %1837 = call zeroext i8 @randombit()
  %1838 = getelementptr inbounds i8, i8* %1, i64 %1836
  store i8 %1837, i8* %1838, align 1
  %1839 = icmp eq i8 %1837, 0
  br i1 %1839, label %1840, label %1843

1840:                                             ; preds = %1835
  %1841 = shl nuw nsw i64 %1836, 4
  %1842 = getelementptr inbounds i8, i8* %0, i64 %1841
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1842, i8 0, i64 16, i1 false)
  br label %1843

1843:                                             ; preds = %1840, %1835
  %1844 = add nuw nsw i64 %.01, 230
  %1845 = call zeroext i8 @randombit()
  %1846 = getelementptr inbounds i8, i8* %1, i64 %1844
  store i8 %1845, i8* %1846, align 1
  %1847 = icmp eq i8 %1845, 0
  br i1 %1847, label %1848, label %1851

1848:                                             ; preds = %1843
  %1849 = shl nuw nsw i64 %1844, 4
  %1850 = getelementptr inbounds i8, i8* %0, i64 %1849
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1850, i8 0, i64 16, i1 false)
  br label %1851

1851:                                             ; preds = %1848, %1843
  %1852 = add nuw nsw i64 %.01, 231
  %1853 = call zeroext i8 @randombit()
  %1854 = getelementptr inbounds i8, i8* %1, i64 %1852
  store i8 %1853, i8* %1854, align 1
  %1855 = icmp eq i8 %1853, 0
  br i1 %1855, label %1856, label %1859

1856:                                             ; preds = %1851
  %1857 = shl nuw nsw i64 %1852, 4
  %1858 = getelementptr inbounds i8, i8* %0, i64 %1857
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1858, i8 0, i64 16, i1 false)
  br label %1859

1859:                                             ; preds = %1856, %1851
  %1860 = add nuw nsw i64 %.01, 232
  %1861 = call zeroext i8 @randombit()
  %1862 = getelementptr inbounds i8, i8* %1, i64 %1860
  store i8 %1861, i8* %1862, align 1
  %1863 = icmp eq i8 %1861, 0
  br i1 %1863, label %1864, label %1867

1864:                                             ; preds = %1859
  %1865 = shl nuw nsw i64 %1860, 4
  %1866 = getelementptr inbounds i8, i8* %0, i64 %1865
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1866, i8 0, i64 16, i1 false)
  br label %1867

1867:                                             ; preds = %1864, %1859
  %1868 = add nuw nsw i64 %.01, 233
  %1869 = call zeroext i8 @randombit()
  %1870 = getelementptr inbounds i8, i8* %1, i64 %1868
  store i8 %1869, i8* %1870, align 1
  %1871 = icmp eq i8 %1869, 0
  br i1 %1871, label %1872, label %1875

1872:                                             ; preds = %1867
  %1873 = shl nuw nsw i64 %1868, 4
  %1874 = getelementptr inbounds i8, i8* %0, i64 %1873
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1874, i8 0, i64 16, i1 false)
  br label %1875

1875:                                             ; preds = %1872, %1867
  %1876 = add nuw nsw i64 %.01, 234
  %1877 = call zeroext i8 @randombit()
  %1878 = getelementptr inbounds i8, i8* %1, i64 %1876
  store i8 %1877, i8* %1878, align 1
  %1879 = icmp eq i8 %1877, 0
  br i1 %1879, label %1880, label %1883

1880:                                             ; preds = %1875
  %1881 = shl nuw nsw i64 %1876, 4
  %1882 = getelementptr inbounds i8, i8* %0, i64 %1881
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1882, i8 0, i64 16, i1 false)
  br label %1883

1883:                                             ; preds = %1880, %1875
  %1884 = add nuw nsw i64 %.01, 235
  %1885 = call zeroext i8 @randombit()
  %1886 = getelementptr inbounds i8, i8* %1, i64 %1884
  store i8 %1885, i8* %1886, align 1
  %1887 = icmp eq i8 %1885, 0
  br i1 %1887, label %1888, label %1891

1888:                                             ; preds = %1883
  %1889 = shl nuw nsw i64 %1884, 4
  %1890 = getelementptr inbounds i8, i8* %0, i64 %1889
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1890, i8 0, i64 16, i1 false)
  br label %1891

1891:                                             ; preds = %1888, %1883
  %1892 = add nuw nsw i64 %.01, 236
  %1893 = call zeroext i8 @randombit()
  %1894 = getelementptr inbounds i8, i8* %1, i64 %1892
  store i8 %1893, i8* %1894, align 1
  %1895 = icmp eq i8 %1893, 0
  br i1 %1895, label %1896, label %1899

1896:                                             ; preds = %1891
  %1897 = shl nuw nsw i64 %1892, 4
  %1898 = getelementptr inbounds i8, i8* %0, i64 %1897
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1898, i8 0, i64 16, i1 false)
  br label %1899

1899:                                             ; preds = %1896, %1891
  %1900 = add nuw nsw i64 %.01, 237
  %1901 = call zeroext i8 @randombit()
  %1902 = getelementptr inbounds i8, i8* %1, i64 %1900
  store i8 %1901, i8* %1902, align 1
  %1903 = icmp eq i8 %1901, 0
  br i1 %1903, label %1904, label %1907

1904:                                             ; preds = %1899
  %1905 = shl nuw nsw i64 %1900, 4
  %1906 = getelementptr inbounds i8, i8* %0, i64 %1905
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1906, i8 0, i64 16, i1 false)
  br label %1907

1907:                                             ; preds = %1904, %1899
  %1908 = add nuw nsw i64 %.01, 238
  %1909 = call zeroext i8 @randombit()
  %1910 = getelementptr inbounds i8, i8* %1, i64 %1908
  store i8 %1909, i8* %1910, align 1
  %1911 = icmp eq i8 %1909, 0
  br i1 %1911, label %1912, label %1915

1912:                                             ; preds = %1907
  %1913 = shl nuw nsw i64 %1908, 4
  %1914 = getelementptr inbounds i8, i8* %0, i64 %1913
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1914, i8 0, i64 16, i1 false)
  br label %1915

1915:                                             ; preds = %1912, %1907
  %1916 = add nuw nsw i64 %.01, 239
  %1917 = call zeroext i8 @randombit()
  %1918 = getelementptr inbounds i8, i8* %1, i64 %1916
  store i8 %1917, i8* %1918, align 1
  %1919 = icmp eq i8 %1917, 0
  br i1 %1919, label %1920, label %1923

1920:                                             ; preds = %1915
  %1921 = shl nuw nsw i64 %1916, 4
  %1922 = getelementptr inbounds i8, i8* %0, i64 %1921
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1922, i8 0, i64 16, i1 false)
  br label %1923

1923:                                             ; preds = %1920, %1915
  %1924 = add nuw nsw i64 %.01, 240
  %1925 = call zeroext i8 @randombit()
  %1926 = getelementptr inbounds i8, i8* %1, i64 %1924
  store i8 %1925, i8* %1926, align 1
  %1927 = icmp eq i8 %1925, 0
  br i1 %1927, label %1928, label %1931

1928:                                             ; preds = %1923
  %1929 = shl nuw nsw i64 %1924, 4
  %1930 = getelementptr inbounds i8, i8* %0, i64 %1929
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1930, i8 0, i64 16, i1 false)
  br label %1931

1931:                                             ; preds = %1928, %1923
  %1932 = add nuw nsw i64 %.01, 241
  %1933 = call zeroext i8 @randombit()
  %1934 = getelementptr inbounds i8, i8* %1, i64 %1932
  store i8 %1933, i8* %1934, align 1
  %1935 = icmp eq i8 %1933, 0
  br i1 %1935, label %1936, label %1939

1936:                                             ; preds = %1931
  %1937 = shl nuw nsw i64 %1932, 4
  %1938 = getelementptr inbounds i8, i8* %0, i64 %1937
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1938, i8 0, i64 16, i1 false)
  br label %1939

1939:                                             ; preds = %1936, %1931
  %1940 = add nuw nsw i64 %.01, 242
  %1941 = call zeroext i8 @randombit()
  %1942 = getelementptr inbounds i8, i8* %1, i64 %1940
  store i8 %1941, i8* %1942, align 1
  %1943 = icmp eq i8 %1941, 0
  br i1 %1943, label %1944, label %1947

1944:                                             ; preds = %1939
  %1945 = shl nuw nsw i64 %1940, 4
  %1946 = getelementptr inbounds i8, i8* %0, i64 %1945
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1946, i8 0, i64 16, i1 false)
  br label %1947

1947:                                             ; preds = %1944, %1939
  %1948 = add nuw nsw i64 %.01, 243
  %1949 = call zeroext i8 @randombit()
  %1950 = getelementptr inbounds i8, i8* %1, i64 %1948
  store i8 %1949, i8* %1950, align 1
  %1951 = icmp eq i8 %1949, 0
  br i1 %1951, label %1952, label %1955

1952:                                             ; preds = %1947
  %1953 = shl nuw nsw i64 %1948, 4
  %1954 = getelementptr inbounds i8, i8* %0, i64 %1953
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1954, i8 0, i64 16, i1 false)
  br label %1955

1955:                                             ; preds = %1952, %1947
  %1956 = add nuw nsw i64 %.01, 244
  %1957 = call zeroext i8 @randombit()
  %1958 = getelementptr inbounds i8, i8* %1, i64 %1956
  store i8 %1957, i8* %1958, align 1
  %1959 = icmp eq i8 %1957, 0
  br i1 %1959, label %1960, label %1963

1960:                                             ; preds = %1955
  %1961 = shl nuw nsw i64 %1956, 4
  %1962 = getelementptr inbounds i8, i8* %0, i64 %1961
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1962, i8 0, i64 16, i1 false)
  br label %1963

1963:                                             ; preds = %1960, %1955
  %1964 = add nuw nsw i64 %.01, 245
  %1965 = call zeroext i8 @randombit()
  %1966 = getelementptr inbounds i8, i8* %1, i64 %1964
  store i8 %1965, i8* %1966, align 1
  %1967 = icmp eq i8 %1965, 0
  br i1 %1967, label %1968, label %1971

1968:                                             ; preds = %1963
  %1969 = shl nuw nsw i64 %1964, 4
  %1970 = getelementptr inbounds i8, i8* %0, i64 %1969
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1970, i8 0, i64 16, i1 false)
  br label %1971

1971:                                             ; preds = %1968, %1963
  %1972 = add nuw nsw i64 %.01, 246
  %1973 = call zeroext i8 @randombit()
  %1974 = getelementptr inbounds i8, i8* %1, i64 %1972
  store i8 %1973, i8* %1974, align 1
  %1975 = icmp eq i8 %1973, 0
  br i1 %1975, label %1976, label %1979

1976:                                             ; preds = %1971
  %1977 = shl nuw nsw i64 %1972, 4
  %1978 = getelementptr inbounds i8, i8* %0, i64 %1977
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1978, i8 0, i64 16, i1 false)
  br label %1979

1979:                                             ; preds = %1976, %1971
  %1980 = add nuw nsw i64 %.01, 247
  %1981 = call zeroext i8 @randombit()
  %1982 = getelementptr inbounds i8, i8* %1, i64 %1980
  store i8 %1981, i8* %1982, align 1
  %1983 = icmp eq i8 %1981, 0
  br i1 %1983, label %1984, label %1987

1984:                                             ; preds = %1979
  %1985 = shl nuw nsw i64 %1980, 4
  %1986 = getelementptr inbounds i8, i8* %0, i64 %1985
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1986, i8 0, i64 16, i1 false)
  br label %1987

1987:                                             ; preds = %1984, %1979
  %1988 = add nuw nsw i64 %.01, 248
  %1989 = call zeroext i8 @randombit()
  %1990 = getelementptr inbounds i8, i8* %1, i64 %1988
  store i8 %1989, i8* %1990, align 1
  %1991 = icmp eq i8 %1989, 0
  br i1 %1991, label %1992, label %1995

1992:                                             ; preds = %1987
  %1993 = shl nuw nsw i64 %1988, 4
  %1994 = getelementptr inbounds i8, i8* %0, i64 %1993
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %1994, i8 0, i64 16, i1 false)
  br label %1995

1995:                                             ; preds = %1992, %1987
  %1996 = add nuw nsw i64 %.01, 249
  %1997 = call zeroext i8 @randombit()
  %1998 = getelementptr inbounds i8, i8* %1, i64 %1996
  store i8 %1997, i8* %1998, align 1
  %1999 = icmp eq i8 %1997, 0
  br i1 %1999, label %2000, label %2003

2000:                                             ; preds = %1995
  %2001 = shl nuw nsw i64 %1996, 4
  %2002 = getelementptr inbounds i8, i8* %0, i64 %2001
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2002, i8 0, i64 16, i1 false)
  br label %2003

2003:                                             ; preds = %2000, %1995
  %2004 = add nuw nsw i64 %.01, 250
  %2005 = call zeroext i8 @randombit()
  %2006 = getelementptr inbounds i8, i8* %1, i64 %2004
  store i8 %2005, i8* %2006, align 1
  %2007 = icmp eq i8 %2005, 0
  br i1 %2007, label %2008, label %2011

2008:                                             ; preds = %2003
  %2009 = shl nuw nsw i64 %2004, 4
  %2010 = getelementptr inbounds i8, i8* %0, i64 %2009
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2010, i8 0, i64 16, i1 false)
  br label %2011

2011:                                             ; preds = %2008, %2003
  %2012 = add nuw nsw i64 %.01, 251
  %2013 = call zeroext i8 @randombit()
  %2014 = getelementptr inbounds i8, i8* %1, i64 %2012
  store i8 %2013, i8* %2014, align 1
  %2015 = icmp eq i8 %2013, 0
  br i1 %2015, label %2016, label %2019

2016:                                             ; preds = %2011
  %2017 = shl nuw nsw i64 %2012, 4
  %2018 = getelementptr inbounds i8, i8* %0, i64 %2017
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2018, i8 0, i64 16, i1 false)
  br label %2019

2019:                                             ; preds = %2016, %2011
  %2020 = add nuw nsw i64 %.01, 252
  %2021 = call zeroext i8 @randombit()
  %2022 = getelementptr inbounds i8, i8* %1, i64 %2020
  store i8 %2021, i8* %2022, align 1
  %2023 = icmp eq i8 %2021, 0
  br i1 %2023, label %2024, label %2027

2024:                                             ; preds = %2019
  %2025 = shl nuw nsw i64 %2020, 4
  %2026 = getelementptr inbounds i8, i8* %0, i64 %2025
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2026, i8 0, i64 16, i1 false)
  br label %2027

2027:                                             ; preds = %2024, %2019
  %2028 = add nuw nsw i64 %.01, 253
  %2029 = call zeroext i8 @randombit()
  %2030 = getelementptr inbounds i8, i8* %1, i64 %2028
  store i8 %2029, i8* %2030, align 1
  %2031 = icmp eq i8 %2029, 0
  br i1 %2031, label %2032, label %2035

2032:                                             ; preds = %2027
  %2033 = shl nuw nsw i64 %2028, 4
  %2034 = getelementptr inbounds i8, i8* %0, i64 %2033
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2034, i8 0, i64 16, i1 false)
  br label %2035

2035:                                             ; preds = %2032, %2027
  %2036 = add nuw nsw i64 %.01, 254
  %2037 = call zeroext i8 @randombit()
  %2038 = getelementptr inbounds i8, i8* %1, i64 %2036
  store i8 %2037, i8* %2038, align 1
  %2039 = icmp eq i8 %2037, 0
  br i1 %2039, label %2040, label %2043

2040:                                             ; preds = %2035
  %2041 = shl nuw nsw i64 %2036, 4
  %2042 = getelementptr inbounds i8, i8* %0, i64 %2041
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2042, i8 0, i64 16, i1 false)
  br label %2043

2043:                                             ; preds = %2040, %2035
  %2044 = add nuw nsw i64 %.01, 255
  %2045 = call zeroext i8 @randombit()
  %2046 = getelementptr inbounds i8, i8* %1, i64 %2044
  store i8 %2045, i8* %2046, align 1
  %2047 = icmp eq i8 %2045, 0
  br i1 %2047, label %2048, label %2051

2048:                                             ; preds = %2043
  %2049 = shl nuw nsw i64 %2044, 4
  %2050 = getelementptr inbounds i8, i8* %0, i64 %2049
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2050, i8 0, i64 16, i1 false)
  br label %2051

2051:                                             ; preds = %2048, %2043
  %2052 = add nuw nsw i64 %.01, 256
  %2053 = call zeroext i8 @randombit()
  %2054 = getelementptr inbounds i8, i8* %1, i64 %2052
  store i8 %2053, i8* %2054, align 1
  %2055 = icmp eq i8 %2053, 0
  br i1 %2055, label %2056, label %2059

2056:                                             ; preds = %2051
  %2057 = shl nuw nsw i64 %2052, 4
  %2058 = getelementptr inbounds i8, i8* %0, i64 %2057
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2058, i8 0, i64 16, i1 false)
  br label %2059

2059:                                             ; preds = %2056, %2051
  %2060 = add nuw nsw i64 %.01, 257
  %2061 = call zeroext i8 @randombit()
  %2062 = getelementptr inbounds i8, i8* %1, i64 %2060
  store i8 %2061, i8* %2062, align 1
  %2063 = icmp eq i8 %2061, 0
  br i1 %2063, label %2064, label %2067

2064:                                             ; preds = %2059
  %2065 = shl nuw nsw i64 %2060, 4
  %2066 = getelementptr inbounds i8, i8* %0, i64 %2065
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2066, i8 0, i64 16, i1 false)
  br label %2067

2067:                                             ; preds = %2064, %2059
  %2068 = add nuw nsw i64 %.01, 258
  %2069 = call zeroext i8 @randombit()
  %2070 = getelementptr inbounds i8, i8* %1, i64 %2068
  store i8 %2069, i8* %2070, align 1
  %2071 = icmp eq i8 %2069, 0
  br i1 %2071, label %2072, label %2075

2072:                                             ; preds = %2067
  %2073 = shl nuw nsw i64 %2068, 4
  %2074 = getelementptr inbounds i8, i8* %0, i64 %2073
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2074, i8 0, i64 16, i1 false)
  br label %2075

2075:                                             ; preds = %2072, %2067
  %2076 = add nuw nsw i64 %.01, 259
  %2077 = call zeroext i8 @randombit()
  %2078 = getelementptr inbounds i8, i8* %1, i64 %2076
  store i8 %2077, i8* %2078, align 1
  %2079 = icmp eq i8 %2077, 0
  br i1 %2079, label %2080, label %2083

2080:                                             ; preds = %2075
  %2081 = shl nuw nsw i64 %2076, 4
  %2082 = getelementptr inbounds i8, i8* %0, i64 %2081
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2082, i8 0, i64 16, i1 false)
  br label %2083

2083:                                             ; preds = %2080, %2075
  %2084 = add nuw nsw i64 %.01, 260
  %2085 = call zeroext i8 @randombit()
  %2086 = getelementptr inbounds i8, i8* %1, i64 %2084
  store i8 %2085, i8* %2086, align 1
  %2087 = icmp eq i8 %2085, 0
  br i1 %2087, label %2088, label %2091

2088:                                             ; preds = %2083
  %2089 = shl nuw nsw i64 %2084, 4
  %2090 = getelementptr inbounds i8, i8* %0, i64 %2089
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2090, i8 0, i64 16, i1 false)
  br label %2091

2091:                                             ; preds = %2088, %2083
  %2092 = add nuw nsw i64 %.01, 261
  %2093 = call zeroext i8 @randombit()
  %2094 = getelementptr inbounds i8, i8* %1, i64 %2092
  store i8 %2093, i8* %2094, align 1
  %2095 = icmp eq i8 %2093, 0
  br i1 %2095, label %2096, label %2099

2096:                                             ; preds = %2091
  %2097 = shl nuw nsw i64 %2092, 4
  %2098 = getelementptr inbounds i8, i8* %0, i64 %2097
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2098, i8 0, i64 16, i1 false)
  br label %2099

2099:                                             ; preds = %2096, %2091
  %2100 = add nuw nsw i64 %.01, 262
  %2101 = call zeroext i8 @randombit()
  %2102 = getelementptr inbounds i8, i8* %1, i64 %2100
  store i8 %2101, i8* %2102, align 1
  %2103 = icmp eq i8 %2101, 0
  br i1 %2103, label %2104, label %2107

2104:                                             ; preds = %2099
  %2105 = shl nuw nsw i64 %2100, 4
  %2106 = getelementptr inbounds i8, i8* %0, i64 %2105
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2106, i8 0, i64 16, i1 false)
  br label %2107

2107:                                             ; preds = %2104, %2099
  %2108 = add nuw nsw i64 %.01, 263
  %2109 = call zeroext i8 @randombit()
  %2110 = getelementptr inbounds i8, i8* %1, i64 %2108
  store i8 %2109, i8* %2110, align 1
  %2111 = icmp eq i8 %2109, 0
  br i1 %2111, label %2112, label %2115

2112:                                             ; preds = %2107
  %2113 = shl nuw nsw i64 %2108, 4
  %2114 = getelementptr inbounds i8, i8* %0, i64 %2113
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2114, i8 0, i64 16, i1 false)
  br label %2115

2115:                                             ; preds = %2112, %2107
  %2116 = add nuw nsw i64 %.01, 264
  %2117 = call zeroext i8 @randombit()
  %2118 = getelementptr inbounds i8, i8* %1, i64 %2116
  store i8 %2117, i8* %2118, align 1
  %2119 = icmp eq i8 %2117, 0
  br i1 %2119, label %2120, label %2123

2120:                                             ; preds = %2115
  %2121 = shl nuw nsw i64 %2116, 4
  %2122 = getelementptr inbounds i8, i8* %0, i64 %2121
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2122, i8 0, i64 16, i1 false)
  br label %2123

2123:                                             ; preds = %2120, %2115
  %2124 = add nuw nsw i64 %.01, 265
  %2125 = call zeroext i8 @randombit()
  %2126 = getelementptr inbounds i8, i8* %1, i64 %2124
  store i8 %2125, i8* %2126, align 1
  %2127 = icmp eq i8 %2125, 0
  br i1 %2127, label %2128, label %2131

2128:                                             ; preds = %2123
  %2129 = shl nuw nsw i64 %2124, 4
  %2130 = getelementptr inbounds i8, i8* %0, i64 %2129
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2130, i8 0, i64 16, i1 false)
  br label %2131

2131:                                             ; preds = %2128, %2123
  %2132 = add nuw nsw i64 %.01, 266
  %2133 = call zeroext i8 @randombit()
  %2134 = getelementptr inbounds i8, i8* %1, i64 %2132
  store i8 %2133, i8* %2134, align 1
  %2135 = icmp eq i8 %2133, 0
  br i1 %2135, label %2136, label %2139

2136:                                             ; preds = %2131
  %2137 = shl nuw nsw i64 %2132, 4
  %2138 = getelementptr inbounds i8, i8* %0, i64 %2137
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2138, i8 0, i64 16, i1 false)
  br label %2139

2139:                                             ; preds = %2136, %2131
  %2140 = add nuw nsw i64 %.01, 267
  %2141 = call zeroext i8 @randombit()
  %2142 = getelementptr inbounds i8, i8* %1, i64 %2140
  store i8 %2141, i8* %2142, align 1
  %2143 = icmp eq i8 %2141, 0
  br i1 %2143, label %2144, label %2147

2144:                                             ; preds = %2139
  %2145 = shl nuw nsw i64 %2140, 4
  %2146 = getelementptr inbounds i8, i8* %0, i64 %2145
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2146, i8 0, i64 16, i1 false)
  br label %2147

2147:                                             ; preds = %2144, %2139
  %2148 = add nuw nsw i64 %.01, 268
  %2149 = call zeroext i8 @randombit()
  %2150 = getelementptr inbounds i8, i8* %1, i64 %2148
  store i8 %2149, i8* %2150, align 1
  %2151 = icmp eq i8 %2149, 0
  br i1 %2151, label %2152, label %2155

2152:                                             ; preds = %2147
  %2153 = shl nuw nsw i64 %2148, 4
  %2154 = getelementptr inbounds i8, i8* %0, i64 %2153
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2154, i8 0, i64 16, i1 false)
  br label %2155

2155:                                             ; preds = %2152, %2147
  %2156 = add nuw nsw i64 %.01, 269
  %2157 = call zeroext i8 @randombit()
  %2158 = getelementptr inbounds i8, i8* %1, i64 %2156
  store i8 %2157, i8* %2158, align 1
  %2159 = icmp eq i8 %2157, 0
  br i1 %2159, label %2160, label %2163

2160:                                             ; preds = %2155
  %2161 = shl nuw nsw i64 %2156, 4
  %2162 = getelementptr inbounds i8, i8* %0, i64 %2161
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2162, i8 0, i64 16, i1 false)
  br label %2163

2163:                                             ; preds = %2160, %2155
  %2164 = add nuw nsw i64 %.01, 270
  %2165 = call zeroext i8 @randombit()
  %2166 = getelementptr inbounds i8, i8* %1, i64 %2164
  store i8 %2165, i8* %2166, align 1
  %2167 = icmp eq i8 %2165, 0
  br i1 %2167, label %2168, label %2171

2168:                                             ; preds = %2163
  %2169 = shl nuw nsw i64 %2164, 4
  %2170 = getelementptr inbounds i8, i8* %0, i64 %2169
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2170, i8 0, i64 16, i1 false)
  br label %2171

2171:                                             ; preds = %2168, %2163
  %2172 = add nuw nsw i64 %.01, 271
  %2173 = call zeroext i8 @randombit()
  %2174 = getelementptr inbounds i8, i8* %1, i64 %2172
  store i8 %2173, i8* %2174, align 1
  %2175 = icmp eq i8 %2173, 0
  br i1 %2175, label %2176, label %2179

2176:                                             ; preds = %2171
  %2177 = shl nuw nsw i64 %2172, 4
  %2178 = getelementptr inbounds i8, i8* %0, i64 %2177
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2178, i8 0, i64 16, i1 false)
  br label %2179

2179:                                             ; preds = %2176, %2171
  %2180 = add nuw nsw i64 %.01, 272
  %2181 = call zeroext i8 @randombit()
  %2182 = getelementptr inbounds i8, i8* %1, i64 %2180
  store i8 %2181, i8* %2182, align 1
  %2183 = icmp eq i8 %2181, 0
  br i1 %2183, label %2184, label %2187

2184:                                             ; preds = %2179
  %2185 = shl nuw nsw i64 %2180, 4
  %2186 = getelementptr inbounds i8, i8* %0, i64 %2185
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2186, i8 0, i64 16, i1 false)
  br label %2187

2187:                                             ; preds = %2184, %2179
  %2188 = add nuw nsw i64 %.01, 273
  %2189 = call zeroext i8 @randombit()
  %2190 = getelementptr inbounds i8, i8* %1, i64 %2188
  store i8 %2189, i8* %2190, align 1
  %2191 = icmp eq i8 %2189, 0
  br i1 %2191, label %2192, label %2195

2192:                                             ; preds = %2187
  %2193 = shl nuw nsw i64 %2188, 4
  %2194 = getelementptr inbounds i8, i8* %0, i64 %2193
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2194, i8 0, i64 16, i1 false)
  br label %2195

2195:                                             ; preds = %2192, %2187
  %2196 = add nuw nsw i64 %.01, 274
  %2197 = call zeroext i8 @randombit()
  %2198 = getelementptr inbounds i8, i8* %1, i64 %2196
  store i8 %2197, i8* %2198, align 1
  %2199 = icmp eq i8 %2197, 0
  br i1 %2199, label %2200, label %2203

2200:                                             ; preds = %2195
  %2201 = shl nuw nsw i64 %2196, 4
  %2202 = getelementptr inbounds i8, i8* %0, i64 %2201
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2202, i8 0, i64 16, i1 false)
  br label %2203

2203:                                             ; preds = %2200, %2195
  %2204 = add nuw nsw i64 %.01, 275
  %2205 = call zeroext i8 @randombit()
  %2206 = getelementptr inbounds i8, i8* %1, i64 %2204
  store i8 %2205, i8* %2206, align 1
  %2207 = icmp eq i8 %2205, 0
  br i1 %2207, label %2208, label %2211

2208:                                             ; preds = %2203
  %2209 = shl nuw nsw i64 %2204, 4
  %2210 = getelementptr inbounds i8, i8* %0, i64 %2209
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2210, i8 0, i64 16, i1 false)
  br label %2211

2211:                                             ; preds = %2208, %2203
  %2212 = add nuw nsw i64 %.01, 276
  %2213 = call zeroext i8 @randombit()
  %2214 = getelementptr inbounds i8, i8* %1, i64 %2212
  store i8 %2213, i8* %2214, align 1
  %2215 = icmp eq i8 %2213, 0
  br i1 %2215, label %2216, label %2219

2216:                                             ; preds = %2211
  %2217 = shl nuw nsw i64 %2212, 4
  %2218 = getelementptr inbounds i8, i8* %0, i64 %2217
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2218, i8 0, i64 16, i1 false)
  br label %2219

2219:                                             ; preds = %2216, %2211
  %2220 = add nuw nsw i64 %.01, 277
  %2221 = call zeroext i8 @randombit()
  %2222 = getelementptr inbounds i8, i8* %1, i64 %2220
  store i8 %2221, i8* %2222, align 1
  %2223 = icmp eq i8 %2221, 0
  br i1 %2223, label %2224, label %2227

2224:                                             ; preds = %2219
  %2225 = shl nuw nsw i64 %2220, 4
  %2226 = getelementptr inbounds i8, i8* %0, i64 %2225
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2226, i8 0, i64 16, i1 false)
  br label %2227

2227:                                             ; preds = %2224, %2219
  %2228 = add nuw nsw i64 %.01, 278
  %2229 = call zeroext i8 @randombit()
  %2230 = getelementptr inbounds i8, i8* %1, i64 %2228
  store i8 %2229, i8* %2230, align 1
  %2231 = icmp eq i8 %2229, 0
  br i1 %2231, label %2232, label %2235

2232:                                             ; preds = %2227
  %2233 = shl nuw nsw i64 %2228, 4
  %2234 = getelementptr inbounds i8, i8* %0, i64 %2233
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2234, i8 0, i64 16, i1 false)
  br label %2235

2235:                                             ; preds = %2232, %2227
  %2236 = add nuw nsw i64 %.01, 279
  %2237 = call zeroext i8 @randombit()
  %2238 = getelementptr inbounds i8, i8* %1, i64 %2236
  store i8 %2237, i8* %2238, align 1
  %2239 = icmp eq i8 %2237, 0
  br i1 %2239, label %2240, label %2243

2240:                                             ; preds = %2235
  %2241 = shl nuw nsw i64 %2236, 4
  %2242 = getelementptr inbounds i8, i8* %0, i64 %2241
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2242, i8 0, i64 16, i1 false)
  br label %2243

2243:                                             ; preds = %2240, %2235
  %2244 = add nuw nsw i64 %.01, 280
  %2245 = call zeroext i8 @randombit()
  %2246 = getelementptr inbounds i8, i8* %1, i64 %2244
  store i8 %2245, i8* %2246, align 1
  %2247 = icmp eq i8 %2245, 0
  br i1 %2247, label %2248, label %2251

2248:                                             ; preds = %2243
  %2249 = shl nuw nsw i64 %2244, 4
  %2250 = getelementptr inbounds i8, i8* %0, i64 %2249
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2250, i8 0, i64 16, i1 false)
  br label %2251

2251:                                             ; preds = %2248, %2243
  %2252 = add nuw nsw i64 %.01, 281
  %2253 = call zeroext i8 @randombit()
  %2254 = getelementptr inbounds i8, i8* %1, i64 %2252
  store i8 %2253, i8* %2254, align 1
  %2255 = icmp eq i8 %2253, 0
  br i1 %2255, label %2256, label %2259

2256:                                             ; preds = %2251
  %2257 = shl nuw nsw i64 %2252, 4
  %2258 = getelementptr inbounds i8, i8* %0, i64 %2257
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2258, i8 0, i64 16, i1 false)
  br label %2259

2259:                                             ; preds = %2256, %2251
  %2260 = add nuw nsw i64 %.01, 282
  %2261 = call zeroext i8 @randombit()
  %2262 = getelementptr inbounds i8, i8* %1, i64 %2260
  store i8 %2261, i8* %2262, align 1
  %2263 = icmp eq i8 %2261, 0
  br i1 %2263, label %2264, label %2267

2264:                                             ; preds = %2259
  %2265 = shl nuw nsw i64 %2260, 4
  %2266 = getelementptr inbounds i8, i8* %0, i64 %2265
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2266, i8 0, i64 16, i1 false)
  br label %2267

2267:                                             ; preds = %2264, %2259
  %2268 = add nuw nsw i64 %.01, 283
  %2269 = call zeroext i8 @randombit()
  %2270 = getelementptr inbounds i8, i8* %1, i64 %2268
  store i8 %2269, i8* %2270, align 1
  %2271 = icmp eq i8 %2269, 0
  br i1 %2271, label %2272, label %2275

2272:                                             ; preds = %2267
  %2273 = shl nuw nsw i64 %2268, 4
  %2274 = getelementptr inbounds i8, i8* %0, i64 %2273
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2274, i8 0, i64 16, i1 false)
  br label %2275

2275:                                             ; preds = %2272, %2267
  %2276 = add nuw nsw i64 %.01, 284
  %2277 = call zeroext i8 @randombit()
  %2278 = getelementptr inbounds i8, i8* %1, i64 %2276
  store i8 %2277, i8* %2278, align 1
  %2279 = icmp eq i8 %2277, 0
  br i1 %2279, label %2280, label %2283

2280:                                             ; preds = %2275
  %2281 = shl nuw nsw i64 %2276, 4
  %2282 = getelementptr inbounds i8, i8* %0, i64 %2281
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2282, i8 0, i64 16, i1 false)
  br label %2283

2283:                                             ; preds = %2280, %2275
  %2284 = add nuw nsw i64 %.01, 285
  %2285 = call zeroext i8 @randombit()
  %2286 = getelementptr inbounds i8, i8* %1, i64 %2284
  store i8 %2285, i8* %2286, align 1
  %2287 = icmp eq i8 %2285, 0
  br i1 %2287, label %2288, label %2291

2288:                                             ; preds = %2283
  %2289 = shl nuw nsw i64 %2284, 4
  %2290 = getelementptr inbounds i8, i8* %0, i64 %2289
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2290, i8 0, i64 16, i1 false)
  br label %2291

2291:                                             ; preds = %2288, %2283
  %2292 = add nuw nsw i64 %.01, 286
  %2293 = call zeroext i8 @randombit()
  %2294 = getelementptr inbounds i8, i8* %1, i64 %2292
  store i8 %2293, i8* %2294, align 1
  %2295 = icmp eq i8 %2293, 0
  br i1 %2295, label %2296, label %2299

2296:                                             ; preds = %2291
  %2297 = shl nuw nsw i64 %2292, 4
  %2298 = getelementptr inbounds i8, i8* %0, i64 %2297
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2298, i8 0, i64 16, i1 false)
  br label %2299

2299:                                             ; preds = %2296, %2291
  %2300 = add nuw nsw i64 %.01, 287
  %2301 = call zeroext i8 @randombit()
  %2302 = getelementptr inbounds i8, i8* %1, i64 %2300
  store i8 %2301, i8* %2302, align 1
  %2303 = icmp eq i8 %2301, 0
  br i1 %2303, label %2304, label %2307

2304:                                             ; preds = %2299
  %2305 = shl nuw nsw i64 %2300, 4
  %2306 = getelementptr inbounds i8, i8* %0, i64 %2305
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2306, i8 0, i64 16, i1 false)
  br label %2307

2307:                                             ; preds = %2304, %2299
  %2308 = add nuw nsw i64 %.01, 288
  %2309 = call zeroext i8 @randombit()
  %2310 = getelementptr inbounds i8, i8* %1, i64 %2308
  store i8 %2309, i8* %2310, align 1
  %2311 = icmp eq i8 %2309, 0
  br i1 %2311, label %2312, label %2315

2312:                                             ; preds = %2307
  %2313 = shl nuw nsw i64 %2308, 4
  %2314 = getelementptr inbounds i8, i8* %0, i64 %2313
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2314, i8 0, i64 16, i1 false)
  br label %2315

2315:                                             ; preds = %2312, %2307
  %2316 = add nuw nsw i64 %.01, 289
  %2317 = call zeroext i8 @randombit()
  %2318 = getelementptr inbounds i8, i8* %1, i64 %2316
  store i8 %2317, i8* %2318, align 1
  %2319 = icmp eq i8 %2317, 0
  br i1 %2319, label %2320, label %2323

2320:                                             ; preds = %2315
  %2321 = shl nuw nsw i64 %2316, 4
  %2322 = getelementptr inbounds i8, i8* %0, i64 %2321
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2322, i8 0, i64 16, i1 false)
  br label %2323

2323:                                             ; preds = %2320, %2315
  %2324 = add nuw nsw i64 %.01, 290
  %2325 = call zeroext i8 @randombit()
  %2326 = getelementptr inbounds i8, i8* %1, i64 %2324
  store i8 %2325, i8* %2326, align 1
  %2327 = icmp eq i8 %2325, 0
  br i1 %2327, label %2328, label %2331

2328:                                             ; preds = %2323
  %2329 = shl nuw nsw i64 %2324, 4
  %2330 = getelementptr inbounds i8, i8* %0, i64 %2329
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2330, i8 0, i64 16, i1 false)
  br label %2331

2331:                                             ; preds = %2328, %2323
  %2332 = add nuw nsw i64 %.01, 291
  %2333 = call zeroext i8 @randombit()
  %2334 = getelementptr inbounds i8, i8* %1, i64 %2332
  store i8 %2333, i8* %2334, align 1
  %2335 = icmp eq i8 %2333, 0
  br i1 %2335, label %2336, label %2339

2336:                                             ; preds = %2331
  %2337 = shl nuw nsw i64 %2332, 4
  %2338 = getelementptr inbounds i8, i8* %0, i64 %2337
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2338, i8 0, i64 16, i1 false)
  br label %2339

2339:                                             ; preds = %2336, %2331
  %2340 = add nuw nsw i64 %.01, 292
  %2341 = call zeroext i8 @randombit()
  %2342 = getelementptr inbounds i8, i8* %1, i64 %2340
  store i8 %2341, i8* %2342, align 1
  %2343 = icmp eq i8 %2341, 0
  br i1 %2343, label %2344, label %2347

2344:                                             ; preds = %2339
  %2345 = shl nuw nsw i64 %2340, 4
  %2346 = getelementptr inbounds i8, i8* %0, i64 %2345
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2346, i8 0, i64 16, i1 false)
  br label %2347

2347:                                             ; preds = %2344, %2339
  %2348 = add nuw nsw i64 %.01, 293
  %2349 = call zeroext i8 @randombit()
  %2350 = getelementptr inbounds i8, i8* %1, i64 %2348
  store i8 %2349, i8* %2350, align 1
  %2351 = icmp eq i8 %2349, 0
  br i1 %2351, label %2352, label %2355

2352:                                             ; preds = %2347
  %2353 = shl nuw nsw i64 %2348, 4
  %2354 = getelementptr inbounds i8, i8* %0, i64 %2353
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2354, i8 0, i64 16, i1 false)
  br label %2355

2355:                                             ; preds = %2352, %2347
  %2356 = add nuw nsw i64 %.01, 294
  %2357 = call zeroext i8 @randombit()
  %2358 = getelementptr inbounds i8, i8* %1, i64 %2356
  store i8 %2357, i8* %2358, align 1
  %2359 = icmp eq i8 %2357, 0
  br i1 %2359, label %2360, label %2363

2360:                                             ; preds = %2355
  %2361 = shl nuw nsw i64 %2356, 4
  %2362 = getelementptr inbounds i8, i8* %0, i64 %2361
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2362, i8 0, i64 16, i1 false)
  br label %2363

2363:                                             ; preds = %2360, %2355
  %2364 = add nuw nsw i64 %.01, 295
  %2365 = call zeroext i8 @randombit()
  %2366 = getelementptr inbounds i8, i8* %1, i64 %2364
  store i8 %2365, i8* %2366, align 1
  %2367 = icmp eq i8 %2365, 0
  br i1 %2367, label %2368, label %2371

2368:                                             ; preds = %2363
  %2369 = shl nuw nsw i64 %2364, 4
  %2370 = getelementptr inbounds i8, i8* %0, i64 %2369
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2370, i8 0, i64 16, i1 false)
  br label %2371

2371:                                             ; preds = %2368, %2363
  %2372 = add nuw nsw i64 %.01, 296
  %2373 = call zeroext i8 @randombit()
  %2374 = getelementptr inbounds i8, i8* %1, i64 %2372
  store i8 %2373, i8* %2374, align 1
  %2375 = icmp eq i8 %2373, 0
  br i1 %2375, label %2376, label %2379

2376:                                             ; preds = %2371
  %2377 = shl nuw nsw i64 %2372, 4
  %2378 = getelementptr inbounds i8, i8* %0, i64 %2377
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2378, i8 0, i64 16, i1 false)
  br label %2379

2379:                                             ; preds = %2376, %2371
  %2380 = add nuw nsw i64 %.01, 297
  %2381 = call zeroext i8 @randombit()
  %2382 = getelementptr inbounds i8, i8* %1, i64 %2380
  store i8 %2381, i8* %2382, align 1
  %2383 = icmp eq i8 %2381, 0
  br i1 %2383, label %2384, label %2387

2384:                                             ; preds = %2379
  %2385 = shl nuw nsw i64 %2380, 4
  %2386 = getelementptr inbounds i8, i8* %0, i64 %2385
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2386, i8 0, i64 16, i1 false)
  br label %2387

2387:                                             ; preds = %2384, %2379
  %2388 = add nuw nsw i64 %.01, 298
  %2389 = call zeroext i8 @randombit()
  %2390 = getelementptr inbounds i8, i8* %1, i64 %2388
  store i8 %2389, i8* %2390, align 1
  %2391 = icmp eq i8 %2389, 0
  br i1 %2391, label %2392, label %2395

2392:                                             ; preds = %2387
  %2393 = shl nuw nsw i64 %2388, 4
  %2394 = getelementptr inbounds i8, i8* %0, i64 %2393
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2394, i8 0, i64 16, i1 false)
  br label %2395

2395:                                             ; preds = %2392, %2387
  %2396 = add nuw nsw i64 %.01, 299
  %2397 = call zeroext i8 @randombit()
  %2398 = getelementptr inbounds i8, i8* %1, i64 %2396
  store i8 %2397, i8* %2398, align 1
  %2399 = icmp eq i8 %2397, 0
  br i1 %2399, label %2400, label %2403

2400:                                             ; preds = %2395
  %2401 = shl nuw nsw i64 %2396, 4
  %2402 = getelementptr inbounds i8, i8* %0, i64 %2401
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2402, i8 0, i64 16, i1 false)
  br label %2403

2403:                                             ; preds = %2400, %2395
  %2404 = add nuw nsw i64 %.01, 300
  %2405 = call zeroext i8 @randombit()
  %2406 = getelementptr inbounds i8, i8* %1, i64 %2404
  store i8 %2405, i8* %2406, align 1
  %2407 = icmp eq i8 %2405, 0
  br i1 %2407, label %2408, label %2411

2408:                                             ; preds = %2403
  %2409 = shl nuw nsw i64 %2404, 4
  %2410 = getelementptr inbounds i8, i8* %0, i64 %2409
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2410, i8 0, i64 16, i1 false)
  br label %2411

2411:                                             ; preds = %2408, %2403
  %2412 = add nuw nsw i64 %.01, 301
  %2413 = call zeroext i8 @randombit()
  %2414 = getelementptr inbounds i8, i8* %1, i64 %2412
  store i8 %2413, i8* %2414, align 1
  %2415 = icmp eq i8 %2413, 0
  br i1 %2415, label %2416, label %2419

2416:                                             ; preds = %2411
  %2417 = shl nuw nsw i64 %2412, 4
  %2418 = getelementptr inbounds i8, i8* %0, i64 %2417
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2418, i8 0, i64 16, i1 false)
  br label %2419

2419:                                             ; preds = %2416, %2411
  %2420 = add nuw nsw i64 %.01, 302
  %2421 = call zeroext i8 @randombit()
  %2422 = getelementptr inbounds i8, i8* %1, i64 %2420
  store i8 %2421, i8* %2422, align 1
  %2423 = icmp eq i8 %2421, 0
  br i1 %2423, label %2424, label %2427

2424:                                             ; preds = %2419
  %2425 = shl nuw nsw i64 %2420, 4
  %2426 = getelementptr inbounds i8, i8* %0, i64 %2425
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2426, i8 0, i64 16, i1 false)
  br label %2427

2427:                                             ; preds = %2424, %2419
  %2428 = add nuw nsw i64 %.01, 303
  %2429 = call zeroext i8 @randombit()
  %2430 = getelementptr inbounds i8, i8* %1, i64 %2428
  store i8 %2429, i8* %2430, align 1
  %2431 = icmp eq i8 %2429, 0
  br i1 %2431, label %2432, label %2435

2432:                                             ; preds = %2427
  %2433 = shl nuw nsw i64 %2428, 4
  %2434 = getelementptr inbounds i8, i8* %0, i64 %2433
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2434, i8 0, i64 16, i1 false)
  br label %2435

2435:                                             ; preds = %2432, %2427
  %2436 = add nuw nsw i64 %.01, 304
  %2437 = call zeroext i8 @randombit()
  %2438 = getelementptr inbounds i8, i8* %1, i64 %2436
  store i8 %2437, i8* %2438, align 1
  %2439 = icmp eq i8 %2437, 0
  br i1 %2439, label %2440, label %2443

2440:                                             ; preds = %2435
  %2441 = shl nuw nsw i64 %2436, 4
  %2442 = getelementptr inbounds i8, i8* %0, i64 %2441
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2442, i8 0, i64 16, i1 false)
  br label %2443

2443:                                             ; preds = %2440, %2435
  %2444 = add nuw nsw i64 %.01, 305
  %2445 = call zeroext i8 @randombit()
  %2446 = getelementptr inbounds i8, i8* %1, i64 %2444
  store i8 %2445, i8* %2446, align 1
  %2447 = icmp eq i8 %2445, 0
  br i1 %2447, label %2448, label %2451

2448:                                             ; preds = %2443
  %2449 = shl nuw nsw i64 %2444, 4
  %2450 = getelementptr inbounds i8, i8* %0, i64 %2449
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2450, i8 0, i64 16, i1 false)
  br label %2451

2451:                                             ; preds = %2448, %2443
  %2452 = add nuw nsw i64 %.01, 306
  %2453 = call zeroext i8 @randombit()
  %2454 = getelementptr inbounds i8, i8* %1, i64 %2452
  store i8 %2453, i8* %2454, align 1
  %2455 = icmp eq i8 %2453, 0
  br i1 %2455, label %2456, label %2459

2456:                                             ; preds = %2451
  %2457 = shl nuw nsw i64 %2452, 4
  %2458 = getelementptr inbounds i8, i8* %0, i64 %2457
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2458, i8 0, i64 16, i1 false)
  br label %2459

2459:                                             ; preds = %2456, %2451
  %2460 = add nuw nsw i64 %.01, 307
  %2461 = call zeroext i8 @randombit()
  %2462 = getelementptr inbounds i8, i8* %1, i64 %2460
  store i8 %2461, i8* %2462, align 1
  %2463 = icmp eq i8 %2461, 0
  br i1 %2463, label %2464, label %2467

2464:                                             ; preds = %2459
  %2465 = shl nuw nsw i64 %2460, 4
  %2466 = getelementptr inbounds i8, i8* %0, i64 %2465
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2466, i8 0, i64 16, i1 false)
  br label %2467

2467:                                             ; preds = %2464, %2459
  %2468 = add nuw nsw i64 %.01, 308
  %2469 = call zeroext i8 @randombit()
  %2470 = getelementptr inbounds i8, i8* %1, i64 %2468
  store i8 %2469, i8* %2470, align 1
  %2471 = icmp eq i8 %2469, 0
  br i1 %2471, label %2472, label %2475

2472:                                             ; preds = %2467
  %2473 = shl nuw nsw i64 %2468, 4
  %2474 = getelementptr inbounds i8, i8* %0, i64 %2473
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2474, i8 0, i64 16, i1 false)
  br label %2475

2475:                                             ; preds = %2472, %2467
  %2476 = add nuw nsw i64 %.01, 309
  %2477 = call zeroext i8 @randombit()
  %2478 = getelementptr inbounds i8, i8* %1, i64 %2476
  store i8 %2477, i8* %2478, align 1
  %2479 = icmp eq i8 %2477, 0
  br i1 %2479, label %2480, label %2483

2480:                                             ; preds = %2475
  %2481 = shl nuw nsw i64 %2476, 4
  %2482 = getelementptr inbounds i8, i8* %0, i64 %2481
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2482, i8 0, i64 16, i1 false)
  br label %2483

2483:                                             ; preds = %2480, %2475
  %2484 = add nuw nsw i64 %.01, 310
  %2485 = call zeroext i8 @randombit()
  %2486 = getelementptr inbounds i8, i8* %1, i64 %2484
  store i8 %2485, i8* %2486, align 1
  %2487 = icmp eq i8 %2485, 0
  br i1 %2487, label %2488, label %2491

2488:                                             ; preds = %2483
  %2489 = shl nuw nsw i64 %2484, 4
  %2490 = getelementptr inbounds i8, i8* %0, i64 %2489
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2490, i8 0, i64 16, i1 false)
  br label %2491

2491:                                             ; preds = %2488, %2483
  %2492 = add nuw nsw i64 %.01, 311
  %2493 = call zeroext i8 @randombit()
  %2494 = getelementptr inbounds i8, i8* %1, i64 %2492
  store i8 %2493, i8* %2494, align 1
  %2495 = icmp eq i8 %2493, 0
  br i1 %2495, label %2496, label %2499

2496:                                             ; preds = %2491
  %2497 = shl nuw nsw i64 %2492, 4
  %2498 = getelementptr inbounds i8, i8* %0, i64 %2497
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2498, i8 0, i64 16, i1 false)
  br label %2499

2499:                                             ; preds = %2496, %2491
  %2500 = add nuw nsw i64 %.01, 312
  %2501 = call zeroext i8 @randombit()
  %2502 = getelementptr inbounds i8, i8* %1, i64 %2500
  store i8 %2501, i8* %2502, align 1
  %2503 = icmp eq i8 %2501, 0
  br i1 %2503, label %2504, label %2507

2504:                                             ; preds = %2499
  %2505 = shl nuw nsw i64 %2500, 4
  %2506 = getelementptr inbounds i8, i8* %0, i64 %2505
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2506, i8 0, i64 16, i1 false)
  br label %2507

2507:                                             ; preds = %2504, %2499
  %2508 = add nuw nsw i64 %.01, 313
  %2509 = call zeroext i8 @randombit()
  %2510 = getelementptr inbounds i8, i8* %1, i64 %2508
  store i8 %2509, i8* %2510, align 1
  %2511 = icmp eq i8 %2509, 0
  br i1 %2511, label %2512, label %2515

2512:                                             ; preds = %2507
  %2513 = shl nuw nsw i64 %2508, 4
  %2514 = getelementptr inbounds i8, i8* %0, i64 %2513
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2514, i8 0, i64 16, i1 false)
  br label %2515

2515:                                             ; preds = %2512, %2507
  %2516 = add nuw nsw i64 %.01, 314
  %2517 = call zeroext i8 @randombit()
  %2518 = getelementptr inbounds i8, i8* %1, i64 %2516
  store i8 %2517, i8* %2518, align 1
  %2519 = icmp eq i8 %2517, 0
  br i1 %2519, label %2520, label %2523

2520:                                             ; preds = %2515
  %2521 = shl nuw nsw i64 %2516, 4
  %2522 = getelementptr inbounds i8, i8* %0, i64 %2521
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2522, i8 0, i64 16, i1 false)
  br label %2523

2523:                                             ; preds = %2520, %2515
  %2524 = add nuw nsw i64 %.01, 315
  %2525 = call zeroext i8 @randombit()
  %2526 = getelementptr inbounds i8, i8* %1, i64 %2524
  store i8 %2525, i8* %2526, align 1
  %2527 = icmp eq i8 %2525, 0
  br i1 %2527, label %2528, label %2531

2528:                                             ; preds = %2523
  %2529 = shl nuw nsw i64 %2524, 4
  %2530 = getelementptr inbounds i8, i8* %0, i64 %2529
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2530, i8 0, i64 16, i1 false)
  br label %2531

2531:                                             ; preds = %2528, %2523
  %2532 = add nuw nsw i64 %.01, 316
  %2533 = call zeroext i8 @randombit()
  %2534 = getelementptr inbounds i8, i8* %1, i64 %2532
  store i8 %2533, i8* %2534, align 1
  %2535 = icmp eq i8 %2533, 0
  br i1 %2535, label %2536, label %2539

2536:                                             ; preds = %2531
  %2537 = shl nuw nsw i64 %2532, 4
  %2538 = getelementptr inbounds i8, i8* %0, i64 %2537
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2538, i8 0, i64 16, i1 false)
  br label %2539

2539:                                             ; preds = %2536, %2531
  %2540 = add nuw nsw i64 %.01, 317
  %2541 = call zeroext i8 @randombit()
  %2542 = getelementptr inbounds i8, i8* %1, i64 %2540
  store i8 %2541, i8* %2542, align 1
  %2543 = icmp eq i8 %2541, 0
  br i1 %2543, label %2544, label %2547

2544:                                             ; preds = %2539
  %2545 = shl nuw nsw i64 %2540, 4
  %2546 = getelementptr inbounds i8, i8* %0, i64 %2545
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2546, i8 0, i64 16, i1 false)
  br label %2547

2547:                                             ; preds = %2544, %2539
  %2548 = add nuw nsw i64 %.01, 318
  %2549 = call zeroext i8 @randombit()
  %2550 = getelementptr inbounds i8, i8* %1, i64 %2548
  store i8 %2549, i8* %2550, align 1
  %2551 = icmp eq i8 %2549, 0
  br i1 %2551, label %2552, label %2555

2552:                                             ; preds = %2547
  %2553 = shl nuw nsw i64 %2548, 4
  %2554 = getelementptr inbounds i8, i8* %0, i64 %2553
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2554, i8 0, i64 16, i1 false)
  br label %2555

2555:                                             ; preds = %2552, %2547
  %2556 = add nuw nsw i64 %.01, 319
  %2557 = call zeroext i8 @randombit()
  %2558 = getelementptr inbounds i8, i8* %1, i64 %2556
  store i8 %2557, i8* %2558, align 1
  %2559 = icmp eq i8 %2557, 0
  br i1 %2559, label %2560, label %2563

2560:                                             ; preds = %2555
  %2561 = shl nuw nsw i64 %2556, 4
  %2562 = getelementptr inbounds i8, i8* %0, i64 %2561
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2562, i8 0, i64 16, i1 false)
  br label %2563

2563:                                             ; preds = %2560, %2555
  %2564 = add nuw nsw i64 %.01, 320
  %2565 = call zeroext i8 @randombit()
  %2566 = getelementptr inbounds i8, i8* %1, i64 %2564
  store i8 %2565, i8* %2566, align 1
  %2567 = icmp eq i8 %2565, 0
  br i1 %2567, label %2568, label %2571

2568:                                             ; preds = %2563
  %2569 = shl nuw nsw i64 %2564, 4
  %2570 = getelementptr inbounds i8, i8* %0, i64 %2569
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2570, i8 0, i64 16, i1 false)
  br label %2571

2571:                                             ; preds = %2568, %2563
  %2572 = add nuw nsw i64 %.01, 321
  %2573 = call zeroext i8 @randombit()
  %2574 = getelementptr inbounds i8, i8* %1, i64 %2572
  store i8 %2573, i8* %2574, align 1
  %2575 = icmp eq i8 %2573, 0
  br i1 %2575, label %2576, label %2579

2576:                                             ; preds = %2571
  %2577 = shl nuw nsw i64 %2572, 4
  %2578 = getelementptr inbounds i8, i8* %0, i64 %2577
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2578, i8 0, i64 16, i1 false)
  br label %2579

2579:                                             ; preds = %2576, %2571
  %2580 = add nuw nsw i64 %.01, 322
  %2581 = call zeroext i8 @randombit()
  %2582 = getelementptr inbounds i8, i8* %1, i64 %2580
  store i8 %2581, i8* %2582, align 1
  %2583 = icmp eq i8 %2581, 0
  br i1 %2583, label %2584, label %2587

2584:                                             ; preds = %2579
  %2585 = shl nuw nsw i64 %2580, 4
  %2586 = getelementptr inbounds i8, i8* %0, i64 %2585
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2586, i8 0, i64 16, i1 false)
  br label %2587

2587:                                             ; preds = %2584, %2579
  %2588 = add nuw nsw i64 %.01, 323
  %2589 = call zeroext i8 @randombit()
  %2590 = getelementptr inbounds i8, i8* %1, i64 %2588
  store i8 %2589, i8* %2590, align 1
  %2591 = icmp eq i8 %2589, 0
  br i1 %2591, label %2592, label %2595

2592:                                             ; preds = %2587
  %2593 = shl nuw nsw i64 %2588, 4
  %2594 = getelementptr inbounds i8, i8* %0, i64 %2593
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2594, i8 0, i64 16, i1 false)
  br label %2595

2595:                                             ; preds = %2592, %2587
  %2596 = add nuw nsw i64 %.01, 324
  %2597 = call zeroext i8 @randombit()
  %2598 = getelementptr inbounds i8, i8* %1, i64 %2596
  store i8 %2597, i8* %2598, align 1
  %2599 = icmp eq i8 %2597, 0
  br i1 %2599, label %2600, label %2603

2600:                                             ; preds = %2595
  %2601 = shl nuw nsw i64 %2596, 4
  %2602 = getelementptr inbounds i8, i8* %0, i64 %2601
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2602, i8 0, i64 16, i1 false)
  br label %2603

2603:                                             ; preds = %2600, %2595
  %2604 = add nuw nsw i64 %.01, 325
  %2605 = call zeroext i8 @randombit()
  %2606 = getelementptr inbounds i8, i8* %1, i64 %2604
  store i8 %2605, i8* %2606, align 1
  %2607 = icmp eq i8 %2605, 0
  br i1 %2607, label %2608, label %2611

2608:                                             ; preds = %2603
  %2609 = shl nuw nsw i64 %2604, 4
  %2610 = getelementptr inbounds i8, i8* %0, i64 %2609
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2610, i8 0, i64 16, i1 false)
  br label %2611

2611:                                             ; preds = %2608, %2603
  %2612 = add nuw nsw i64 %.01, 326
  %2613 = call zeroext i8 @randombit()
  %2614 = getelementptr inbounds i8, i8* %1, i64 %2612
  store i8 %2613, i8* %2614, align 1
  %2615 = icmp eq i8 %2613, 0
  br i1 %2615, label %2616, label %2619

2616:                                             ; preds = %2611
  %2617 = shl nuw nsw i64 %2612, 4
  %2618 = getelementptr inbounds i8, i8* %0, i64 %2617
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2618, i8 0, i64 16, i1 false)
  br label %2619

2619:                                             ; preds = %2616, %2611
  %2620 = add nuw nsw i64 %.01, 327
  %2621 = call zeroext i8 @randombit()
  %2622 = getelementptr inbounds i8, i8* %1, i64 %2620
  store i8 %2621, i8* %2622, align 1
  %2623 = icmp eq i8 %2621, 0
  br i1 %2623, label %2624, label %2627

2624:                                             ; preds = %2619
  %2625 = shl nuw nsw i64 %2620, 4
  %2626 = getelementptr inbounds i8, i8* %0, i64 %2625
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2626, i8 0, i64 16, i1 false)
  br label %2627

2627:                                             ; preds = %2624, %2619
  %2628 = add nuw nsw i64 %.01, 328
  %2629 = call zeroext i8 @randombit()
  %2630 = getelementptr inbounds i8, i8* %1, i64 %2628
  store i8 %2629, i8* %2630, align 1
  %2631 = icmp eq i8 %2629, 0
  br i1 %2631, label %2632, label %2635

2632:                                             ; preds = %2627
  %2633 = shl nuw nsw i64 %2628, 4
  %2634 = getelementptr inbounds i8, i8* %0, i64 %2633
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2634, i8 0, i64 16, i1 false)
  br label %2635

2635:                                             ; preds = %2632, %2627
  %2636 = add nuw nsw i64 %.01, 329
  %2637 = call zeroext i8 @randombit()
  %2638 = getelementptr inbounds i8, i8* %1, i64 %2636
  store i8 %2637, i8* %2638, align 1
  %2639 = icmp eq i8 %2637, 0
  br i1 %2639, label %2640, label %2643

2640:                                             ; preds = %2635
  %2641 = shl nuw nsw i64 %2636, 4
  %2642 = getelementptr inbounds i8, i8* %0, i64 %2641
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2642, i8 0, i64 16, i1 false)
  br label %2643

2643:                                             ; preds = %2640, %2635
  %2644 = add nuw nsw i64 %.01, 330
  %2645 = call zeroext i8 @randombit()
  %2646 = getelementptr inbounds i8, i8* %1, i64 %2644
  store i8 %2645, i8* %2646, align 1
  %2647 = icmp eq i8 %2645, 0
  br i1 %2647, label %2648, label %2651

2648:                                             ; preds = %2643
  %2649 = shl nuw nsw i64 %2644, 4
  %2650 = getelementptr inbounds i8, i8* %0, i64 %2649
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2650, i8 0, i64 16, i1 false)
  br label %2651

2651:                                             ; preds = %2648, %2643
  %2652 = add nuw nsw i64 %.01, 331
  %2653 = call zeroext i8 @randombit()
  %2654 = getelementptr inbounds i8, i8* %1, i64 %2652
  store i8 %2653, i8* %2654, align 1
  %2655 = icmp eq i8 %2653, 0
  br i1 %2655, label %2656, label %2659

2656:                                             ; preds = %2651
  %2657 = shl nuw nsw i64 %2652, 4
  %2658 = getelementptr inbounds i8, i8* %0, i64 %2657
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2658, i8 0, i64 16, i1 false)
  br label %2659

2659:                                             ; preds = %2656, %2651
  %2660 = add nuw nsw i64 %.01, 332
  %2661 = call zeroext i8 @randombit()
  %2662 = getelementptr inbounds i8, i8* %1, i64 %2660
  store i8 %2661, i8* %2662, align 1
  %2663 = icmp eq i8 %2661, 0
  br i1 %2663, label %2664, label %2667

2664:                                             ; preds = %2659
  %2665 = shl nuw nsw i64 %2660, 4
  %2666 = getelementptr inbounds i8, i8* %0, i64 %2665
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2666, i8 0, i64 16, i1 false)
  br label %2667

2667:                                             ; preds = %2664, %2659
  %2668 = add nuw nsw i64 %.01, 333
  %2669 = call zeroext i8 @randombit()
  %2670 = getelementptr inbounds i8, i8* %1, i64 %2668
  store i8 %2669, i8* %2670, align 1
  %2671 = icmp eq i8 %2669, 0
  br i1 %2671, label %2672, label %2675

2672:                                             ; preds = %2667
  %2673 = shl nuw nsw i64 %2668, 4
  %2674 = getelementptr inbounds i8, i8* %0, i64 %2673
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2674, i8 0, i64 16, i1 false)
  br label %2675

2675:                                             ; preds = %2672, %2667
  %2676 = add nuw nsw i64 %.01, 334
  %2677 = call zeroext i8 @randombit()
  %2678 = getelementptr inbounds i8, i8* %1, i64 %2676
  store i8 %2677, i8* %2678, align 1
  %2679 = icmp eq i8 %2677, 0
  br i1 %2679, label %2680, label %2683

2680:                                             ; preds = %2675
  %2681 = shl nuw nsw i64 %2676, 4
  %2682 = getelementptr inbounds i8, i8* %0, i64 %2681
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2682, i8 0, i64 16, i1 false)
  br label %2683

2683:                                             ; preds = %2680, %2675
  %2684 = add nuw nsw i64 %.01, 335
  %2685 = call zeroext i8 @randombit()
  %2686 = getelementptr inbounds i8, i8* %1, i64 %2684
  store i8 %2685, i8* %2686, align 1
  %2687 = icmp eq i8 %2685, 0
  br i1 %2687, label %2688, label %2691

2688:                                             ; preds = %2683
  %2689 = shl nuw nsw i64 %2684, 4
  %2690 = getelementptr inbounds i8, i8* %0, i64 %2689
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2690, i8 0, i64 16, i1 false)
  br label %2691

2691:                                             ; preds = %2688, %2683
  %2692 = add nuw nsw i64 %.01, 336
  %2693 = call zeroext i8 @randombit()
  %2694 = getelementptr inbounds i8, i8* %1, i64 %2692
  store i8 %2693, i8* %2694, align 1
  %2695 = icmp eq i8 %2693, 0
  br i1 %2695, label %2696, label %2699

2696:                                             ; preds = %2691
  %2697 = shl nuw nsw i64 %2692, 4
  %2698 = getelementptr inbounds i8, i8* %0, i64 %2697
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2698, i8 0, i64 16, i1 false)
  br label %2699

2699:                                             ; preds = %2696, %2691
  %2700 = add nuw nsw i64 %.01, 337
  %2701 = call zeroext i8 @randombit()
  %2702 = getelementptr inbounds i8, i8* %1, i64 %2700
  store i8 %2701, i8* %2702, align 1
  %2703 = icmp eq i8 %2701, 0
  br i1 %2703, label %2704, label %2707

2704:                                             ; preds = %2699
  %2705 = shl nuw nsw i64 %2700, 4
  %2706 = getelementptr inbounds i8, i8* %0, i64 %2705
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2706, i8 0, i64 16, i1 false)
  br label %2707

2707:                                             ; preds = %2704, %2699
  %2708 = add nuw nsw i64 %.01, 338
  %2709 = call zeroext i8 @randombit()
  %2710 = getelementptr inbounds i8, i8* %1, i64 %2708
  store i8 %2709, i8* %2710, align 1
  %2711 = icmp eq i8 %2709, 0
  br i1 %2711, label %2712, label %2715

2712:                                             ; preds = %2707
  %2713 = shl nuw nsw i64 %2708, 4
  %2714 = getelementptr inbounds i8, i8* %0, i64 %2713
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2714, i8 0, i64 16, i1 false)
  br label %2715

2715:                                             ; preds = %2712, %2707
  %2716 = add nuw nsw i64 %.01, 339
  %2717 = call zeroext i8 @randombit()
  %2718 = getelementptr inbounds i8, i8* %1, i64 %2716
  store i8 %2717, i8* %2718, align 1
  %2719 = icmp eq i8 %2717, 0
  br i1 %2719, label %2720, label %2723

2720:                                             ; preds = %2715
  %2721 = shl nuw nsw i64 %2716, 4
  %2722 = getelementptr inbounds i8, i8* %0, i64 %2721
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2722, i8 0, i64 16, i1 false)
  br label %2723

2723:                                             ; preds = %2720, %2715
  %2724 = add nuw nsw i64 %.01, 340
  %2725 = call zeroext i8 @randombit()
  %2726 = getelementptr inbounds i8, i8* %1, i64 %2724
  store i8 %2725, i8* %2726, align 1
  %2727 = icmp eq i8 %2725, 0
  br i1 %2727, label %2728, label %2731

2728:                                             ; preds = %2723
  %2729 = shl nuw nsw i64 %2724, 4
  %2730 = getelementptr inbounds i8, i8* %0, i64 %2729
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2730, i8 0, i64 16, i1 false)
  br label %2731

2731:                                             ; preds = %2728, %2723
  %2732 = add nuw nsw i64 %.01, 341
  %2733 = call zeroext i8 @randombit()
  %2734 = getelementptr inbounds i8, i8* %1, i64 %2732
  store i8 %2733, i8* %2734, align 1
  %2735 = icmp eq i8 %2733, 0
  br i1 %2735, label %2736, label %2739

2736:                                             ; preds = %2731
  %2737 = shl nuw nsw i64 %2732, 4
  %2738 = getelementptr inbounds i8, i8* %0, i64 %2737
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2738, i8 0, i64 16, i1 false)
  br label %2739

2739:                                             ; preds = %2736, %2731
  %2740 = add nuw nsw i64 %.01, 342
  %2741 = call zeroext i8 @randombit()
  %2742 = getelementptr inbounds i8, i8* %1, i64 %2740
  store i8 %2741, i8* %2742, align 1
  %2743 = icmp eq i8 %2741, 0
  br i1 %2743, label %2744, label %2747

2744:                                             ; preds = %2739
  %2745 = shl nuw nsw i64 %2740, 4
  %2746 = getelementptr inbounds i8, i8* %0, i64 %2745
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2746, i8 0, i64 16, i1 false)
  br label %2747

2747:                                             ; preds = %2744, %2739
  %2748 = add nuw nsw i64 %.01, 343
  %2749 = call zeroext i8 @randombit()
  %2750 = getelementptr inbounds i8, i8* %1, i64 %2748
  store i8 %2749, i8* %2750, align 1
  %2751 = icmp eq i8 %2749, 0
  br i1 %2751, label %2752, label %2755

2752:                                             ; preds = %2747
  %2753 = shl nuw nsw i64 %2748, 4
  %2754 = getelementptr inbounds i8, i8* %0, i64 %2753
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2754, i8 0, i64 16, i1 false)
  br label %2755

2755:                                             ; preds = %2752, %2747
  %2756 = add nuw nsw i64 %.01, 344
  %2757 = call zeroext i8 @randombit()
  %2758 = getelementptr inbounds i8, i8* %1, i64 %2756
  store i8 %2757, i8* %2758, align 1
  %2759 = icmp eq i8 %2757, 0
  br i1 %2759, label %2760, label %2763

2760:                                             ; preds = %2755
  %2761 = shl nuw nsw i64 %2756, 4
  %2762 = getelementptr inbounds i8, i8* %0, i64 %2761
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2762, i8 0, i64 16, i1 false)
  br label %2763

2763:                                             ; preds = %2760, %2755
  %2764 = add nuw nsw i64 %.01, 345
  %2765 = call zeroext i8 @randombit()
  %2766 = getelementptr inbounds i8, i8* %1, i64 %2764
  store i8 %2765, i8* %2766, align 1
  %2767 = icmp eq i8 %2765, 0
  br i1 %2767, label %2768, label %2771

2768:                                             ; preds = %2763
  %2769 = shl nuw nsw i64 %2764, 4
  %2770 = getelementptr inbounds i8, i8* %0, i64 %2769
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2770, i8 0, i64 16, i1 false)
  br label %2771

2771:                                             ; preds = %2768, %2763
  %2772 = add nuw nsw i64 %.01, 346
  %2773 = call zeroext i8 @randombit()
  %2774 = getelementptr inbounds i8, i8* %1, i64 %2772
  store i8 %2773, i8* %2774, align 1
  %2775 = icmp eq i8 %2773, 0
  br i1 %2775, label %2776, label %2779

2776:                                             ; preds = %2771
  %2777 = shl nuw nsw i64 %2772, 4
  %2778 = getelementptr inbounds i8, i8* %0, i64 %2777
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2778, i8 0, i64 16, i1 false)
  br label %2779

2779:                                             ; preds = %2776, %2771
  %2780 = add nuw nsw i64 %.01, 347
  %2781 = call zeroext i8 @randombit()
  %2782 = getelementptr inbounds i8, i8* %1, i64 %2780
  store i8 %2781, i8* %2782, align 1
  %2783 = icmp eq i8 %2781, 0
  br i1 %2783, label %2784, label %2787

2784:                                             ; preds = %2779
  %2785 = shl nuw nsw i64 %2780, 4
  %2786 = getelementptr inbounds i8, i8* %0, i64 %2785
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2786, i8 0, i64 16, i1 false)
  br label %2787

2787:                                             ; preds = %2784, %2779
  %2788 = add nuw nsw i64 %.01, 348
  %2789 = call zeroext i8 @randombit()
  %2790 = getelementptr inbounds i8, i8* %1, i64 %2788
  store i8 %2789, i8* %2790, align 1
  %2791 = icmp eq i8 %2789, 0
  br i1 %2791, label %2792, label %2795

2792:                                             ; preds = %2787
  %2793 = shl nuw nsw i64 %2788, 4
  %2794 = getelementptr inbounds i8, i8* %0, i64 %2793
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2794, i8 0, i64 16, i1 false)
  br label %2795

2795:                                             ; preds = %2792, %2787
  %2796 = add nuw nsw i64 %.01, 349
  %2797 = call zeroext i8 @randombit()
  %2798 = getelementptr inbounds i8, i8* %1, i64 %2796
  store i8 %2797, i8* %2798, align 1
  %2799 = icmp eq i8 %2797, 0
  br i1 %2799, label %2800, label %2803

2800:                                             ; preds = %2795
  %2801 = shl nuw nsw i64 %2796, 4
  %2802 = getelementptr inbounds i8, i8* %0, i64 %2801
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2802, i8 0, i64 16, i1 false)
  br label %2803

2803:                                             ; preds = %2800, %2795
  %2804 = add nuw nsw i64 %.01, 350
  %2805 = call zeroext i8 @randombit()
  %2806 = getelementptr inbounds i8, i8* %1, i64 %2804
  store i8 %2805, i8* %2806, align 1
  %2807 = icmp eq i8 %2805, 0
  br i1 %2807, label %2808, label %2811

2808:                                             ; preds = %2803
  %2809 = shl nuw nsw i64 %2804, 4
  %2810 = getelementptr inbounds i8, i8* %0, i64 %2809
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2810, i8 0, i64 16, i1 false)
  br label %2811

2811:                                             ; preds = %2808, %2803
  %2812 = add nuw nsw i64 %.01, 351
  %2813 = call zeroext i8 @randombit()
  %2814 = getelementptr inbounds i8, i8* %1, i64 %2812
  store i8 %2813, i8* %2814, align 1
  %2815 = icmp eq i8 %2813, 0
  br i1 %2815, label %2816, label %2819

2816:                                             ; preds = %2811
  %2817 = shl nuw nsw i64 %2812, 4
  %2818 = getelementptr inbounds i8, i8* %0, i64 %2817
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2818, i8 0, i64 16, i1 false)
  br label %2819

2819:                                             ; preds = %2816, %2811
  %2820 = add nuw nsw i64 %.01, 352
  %2821 = call zeroext i8 @randombit()
  %2822 = getelementptr inbounds i8, i8* %1, i64 %2820
  store i8 %2821, i8* %2822, align 1
  %2823 = icmp eq i8 %2821, 0
  br i1 %2823, label %2824, label %2827

2824:                                             ; preds = %2819
  %2825 = shl nuw nsw i64 %2820, 4
  %2826 = getelementptr inbounds i8, i8* %0, i64 %2825
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2826, i8 0, i64 16, i1 false)
  br label %2827

2827:                                             ; preds = %2824, %2819
  %2828 = add nuw nsw i64 %.01, 353
  %2829 = call zeroext i8 @randombit()
  %2830 = getelementptr inbounds i8, i8* %1, i64 %2828
  store i8 %2829, i8* %2830, align 1
  %2831 = icmp eq i8 %2829, 0
  br i1 %2831, label %2832, label %2835

2832:                                             ; preds = %2827
  %2833 = shl nuw nsw i64 %2828, 4
  %2834 = getelementptr inbounds i8, i8* %0, i64 %2833
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2834, i8 0, i64 16, i1 false)
  br label %2835

2835:                                             ; preds = %2832, %2827
  %2836 = add nuw nsw i64 %.01, 354
  %2837 = call zeroext i8 @randombit()
  %2838 = getelementptr inbounds i8, i8* %1, i64 %2836
  store i8 %2837, i8* %2838, align 1
  %2839 = icmp eq i8 %2837, 0
  br i1 %2839, label %2840, label %2843

2840:                                             ; preds = %2835
  %2841 = shl nuw nsw i64 %2836, 4
  %2842 = getelementptr inbounds i8, i8* %0, i64 %2841
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2842, i8 0, i64 16, i1 false)
  br label %2843

2843:                                             ; preds = %2840, %2835
  %2844 = add nuw nsw i64 %.01, 355
  %2845 = call zeroext i8 @randombit()
  %2846 = getelementptr inbounds i8, i8* %1, i64 %2844
  store i8 %2845, i8* %2846, align 1
  %2847 = icmp eq i8 %2845, 0
  br i1 %2847, label %2848, label %2851

2848:                                             ; preds = %2843
  %2849 = shl nuw nsw i64 %2844, 4
  %2850 = getelementptr inbounds i8, i8* %0, i64 %2849
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2850, i8 0, i64 16, i1 false)
  br label %2851

2851:                                             ; preds = %2848, %2843
  %2852 = add nuw nsw i64 %.01, 356
  %2853 = call zeroext i8 @randombit()
  %2854 = getelementptr inbounds i8, i8* %1, i64 %2852
  store i8 %2853, i8* %2854, align 1
  %2855 = icmp eq i8 %2853, 0
  br i1 %2855, label %2856, label %2859

2856:                                             ; preds = %2851
  %2857 = shl nuw nsw i64 %2852, 4
  %2858 = getelementptr inbounds i8, i8* %0, i64 %2857
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2858, i8 0, i64 16, i1 false)
  br label %2859

2859:                                             ; preds = %2856, %2851
  %2860 = add nuw nsw i64 %.01, 357
  %2861 = call zeroext i8 @randombit()
  %2862 = getelementptr inbounds i8, i8* %1, i64 %2860
  store i8 %2861, i8* %2862, align 1
  %2863 = icmp eq i8 %2861, 0
  br i1 %2863, label %2864, label %2867

2864:                                             ; preds = %2859
  %2865 = shl nuw nsw i64 %2860, 4
  %2866 = getelementptr inbounds i8, i8* %0, i64 %2865
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2866, i8 0, i64 16, i1 false)
  br label %2867

2867:                                             ; preds = %2864, %2859
  %2868 = add nuw nsw i64 %.01, 358
  %2869 = call zeroext i8 @randombit()
  %2870 = getelementptr inbounds i8, i8* %1, i64 %2868
  store i8 %2869, i8* %2870, align 1
  %2871 = icmp eq i8 %2869, 0
  br i1 %2871, label %2872, label %2875

2872:                                             ; preds = %2867
  %2873 = shl nuw nsw i64 %2868, 4
  %2874 = getelementptr inbounds i8, i8* %0, i64 %2873
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2874, i8 0, i64 16, i1 false)
  br label %2875

2875:                                             ; preds = %2872, %2867
  %2876 = add nuw nsw i64 %.01, 359
  %2877 = call zeroext i8 @randombit()
  %2878 = getelementptr inbounds i8, i8* %1, i64 %2876
  store i8 %2877, i8* %2878, align 1
  %2879 = icmp eq i8 %2877, 0
  br i1 %2879, label %2880, label %2883

2880:                                             ; preds = %2875
  %2881 = shl nuw nsw i64 %2876, 4
  %2882 = getelementptr inbounds i8, i8* %0, i64 %2881
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2882, i8 0, i64 16, i1 false)
  br label %2883

2883:                                             ; preds = %2880, %2875
  %2884 = add nuw nsw i64 %.01, 360
  %2885 = call zeroext i8 @randombit()
  %2886 = getelementptr inbounds i8, i8* %1, i64 %2884
  store i8 %2885, i8* %2886, align 1
  %2887 = icmp eq i8 %2885, 0
  br i1 %2887, label %2888, label %2891

2888:                                             ; preds = %2883
  %2889 = shl nuw nsw i64 %2884, 4
  %2890 = getelementptr inbounds i8, i8* %0, i64 %2889
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2890, i8 0, i64 16, i1 false)
  br label %2891

2891:                                             ; preds = %2888, %2883
  %2892 = add nuw nsw i64 %.01, 361
  %2893 = call zeroext i8 @randombit()
  %2894 = getelementptr inbounds i8, i8* %1, i64 %2892
  store i8 %2893, i8* %2894, align 1
  %2895 = icmp eq i8 %2893, 0
  br i1 %2895, label %2896, label %2899

2896:                                             ; preds = %2891
  %2897 = shl nuw nsw i64 %2892, 4
  %2898 = getelementptr inbounds i8, i8* %0, i64 %2897
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2898, i8 0, i64 16, i1 false)
  br label %2899

2899:                                             ; preds = %2896, %2891
  %2900 = add nuw nsw i64 %.01, 362
  %2901 = call zeroext i8 @randombit()
  %2902 = getelementptr inbounds i8, i8* %1, i64 %2900
  store i8 %2901, i8* %2902, align 1
  %2903 = icmp eq i8 %2901, 0
  br i1 %2903, label %2904, label %2907

2904:                                             ; preds = %2899
  %2905 = shl nuw nsw i64 %2900, 4
  %2906 = getelementptr inbounds i8, i8* %0, i64 %2905
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2906, i8 0, i64 16, i1 false)
  br label %2907

2907:                                             ; preds = %2904, %2899
  %2908 = add nuw nsw i64 %.01, 363
  %2909 = call zeroext i8 @randombit()
  %2910 = getelementptr inbounds i8, i8* %1, i64 %2908
  store i8 %2909, i8* %2910, align 1
  %2911 = icmp eq i8 %2909, 0
  br i1 %2911, label %2912, label %2915

2912:                                             ; preds = %2907
  %2913 = shl nuw nsw i64 %2908, 4
  %2914 = getelementptr inbounds i8, i8* %0, i64 %2913
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2914, i8 0, i64 16, i1 false)
  br label %2915

2915:                                             ; preds = %2912, %2907
  %2916 = add nuw nsw i64 %.01, 364
  %2917 = call zeroext i8 @randombit()
  %2918 = getelementptr inbounds i8, i8* %1, i64 %2916
  store i8 %2917, i8* %2918, align 1
  %2919 = icmp eq i8 %2917, 0
  br i1 %2919, label %2920, label %2923

2920:                                             ; preds = %2915
  %2921 = shl nuw nsw i64 %2916, 4
  %2922 = getelementptr inbounds i8, i8* %0, i64 %2921
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2922, i8 0, i64 16, i1 false)
  br label %2923

2923:                                             ; preds = %2920, %2915
  %2924 = add nuw nsw i64 %.01, 365
  %2925 = call zeroext i8 @randombit()
  %2926 = getelementptr inbounds i8, i8* %1, i64 %2924
  store i8 %2925, i8* %2926, align 1
  %2927 = icmp eq i8 %2925, 0
  br i1 %2927, label %2928, label %2931

2928:                                             ; preds = %2923
  %2929 = shl nuw nsw i64 %2924, 4
  %2930 = getelementptr inbounds i8, i8* %0, i64 %2929
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2930, i8 0, i64 16, i1 false)
  br label %2931

2931:                                             ; preds = %2928, %2923
  %2932 = add nuw nsw i64 %.01, 366
  %2933 = call zeroext i8 @randombit()
  %2934 = getelementptr inbounds i8, i8* %1, i64 %2932
  store i8 %2933, i8* %2934, align 1
  %2935 = icmp eq i8 %2933, 0
  br i1 %2935, label %2936, label %2939

2936:                                             ; preds = %2931
  %2937 = shl nuw nsw i64 %2932, 4
  %2938 = getelementptr inbounds i8, i8* %0, i64 %2937
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2938, i8 0, i64 16, i1 false)
  br label %2939

2939:                                             ; preds = %2936, %2931
  %2940 = add nuw nsw i64 %.01, 367
  %2941 = call zeroext i8 @randombit()
  %2942 = getelementptr inbounds i8, i8* %1, i64 %2940
  store i8 %2941, i8* %2942, align 1
  %2943 = icmp eq i8 %2941, 0
  br i1 %2943, label %2944, label %2947

2944:                                             ; preds = %2939
  %2945 = shl nuw nsw i64 %2940, 4
  %2946 = getelementptr inbounds i8, i8* %0, i64 %2945
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2946, i8 0, i64 16, i1 false)
  br label %2947

2947:                                             ; preds = %2944, %2939
  %2948 = add nuw nsw i64 %.01, 368
  %2949 = call zeroext i8 @randombit()
  %2950 = getelementptr inbounds i8, i8* %1, i64 %2948
  store i8 %2949, i8* %2950, align 1
  %2951 = icmp eq i8 %2949, 0
  br i1 %2951, label %2952, label %2955

2952:                                             ; preds = %2947
  %2953 = shl nuw nsw i64 %2948, 4
  %2954 = getelementptr inbounds i8, i8* %0, i64 %2953
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2954, i8 0, i64 16, i1 false)
  br label %2955

2955:                                             ; preds = %2952, %2947
  %2956 = add nuw nsw i64 %.01, 369
  %2957 = call zeroext i8 @randombit()
  %2958 = getelementptr inbounds i8, i8* %1, i64 %2956
  store i8 %2957, i8* %2958, align 1
  %2959 = icmp eq i8 %2957, 0
  br i1 %2959, label %2960, label %2963

2960:                                             ; preds = %2955
  %2961 = shl nuw nsw i64 %2956, 4
  %2962 = getelementptr inbounds i8, i8* %0, i64 %2961
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2962, i8 0, i64 16, i1 false)
  br label %2963

2963:                                             ; preds = %2960, %2955
  %2964 = add nuw nsw i64 %.01, 370
  %2965 = call zeroext i8 @randombit()
  %2966 = getelementptr inbounds i8, i8* %1, i64 %2964
  store i8 %2965, i8* %2966, align 1
  %2967 = icmp eq i8 %2965, 0
  br i1 %2967, label %2968, label %2971

2968:                                             ; preds = %2963
  %2969 = shl nuw nsw i64 %2964, 4
  %2970 = getelementptr inbounds i8, i8* %0, i64 %2969
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2970, i8 0, i64 16, i1 false)
  br label %2971

2971:                                             ; preds = %2968, %2963
  %2972 = add nuw nsw i64 %.01, 371
  %2973 = call zeroext i8 @randombit()
  %2974 = getelementptr inbounds i8, i8* %1, i64 %2972
  store i8 %2973, i8* %2974, align 1
  %2975 = icmp eq i8 %2973, 0
  br i1 %2975, label %2976, label %2979

2976:                                             ; preds = %2971
  %2977 = shl nuw nsw i64 %2972, 4
  %2978 = getelementptr inbounds i8, i8* %0, i64 %2977
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2978, i8 0, i64 16, i1 false)
  br label %2979

2979:                                             ; preds = %2976, %2971
  %2980 = add nuw nsw i64 %.01, 372
  %2981 = call zeroext i8 @randombit()
  %2982 = getelementptr inbounds i8, i8* %1, i64 %2980
  store i8 %2981, i8* %2982, align 1
  %2983 = icmp eq i8 %2981, 0
  br i1 %2983, label %2984, label %2987

2984:                                             ; preds = %2979
  %2985 = shl nuw nsw i64 %2980, 4
  %2986 = getelementptr inbounds i8, i8* %0, i64 %2985
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2986, i8 0, i64 16, i1 false)
  br label %2987

2987:                                             ; preds = %2984, %2979
  %2988 = add nuw nsw i64 %.01, 373
  %2989 = call zeroext i8 @randombit()
  %2990 = getelementptr inbounds i8, i8* %1, i64 %2988
  store i8 %2989, i8* %2990, align 1
  %2991 = icmp eq i8 %2989, 0
  br i1 %2991, label %2992, label %2995

2992:                                             ; preds = %2987
  %2993 = shl nuw nsw i64 %2988, 4
  %2994 = getelementptr inbounds i8, i8* %0, i64 %2993
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %2994, i8 0, i64 16, i1 false)
  br label %2995

2995:                                             ; preds = %2992, %2987
  %2996 = add nuw nsw i64 %.01, 374
  %2997 = call zeroext i8 @randombit()
  %2998 = getelementptr inbounds i8, i8* %1, i64 %2996
  store i8 %2997, i8* %2998, align 1
  %2999 = icmp eq i8 %2997, 0
  br i1 %2999, label %3000, label %3003

3000:                                             ; preds = %2995
  %3001 = shl nuw nsw i64 %2996, 4
  %3002 = getelementptr inbounds i8, i8* %0, i64 %3001
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3002, i8 0, i64 16, i1 false)
  br label %3003

3003:                                             ; preds = %3000, %2995
  %3004 = add nuw nsw i64 %.01, 375
  %3005 = call zeroext i8 @randombit()
  %3006 = getelementptr inbounds i8, i8* %1, i64 %3004
  store i8 %3005, i8* %3006, align 1
  %3007 = icmp eq i8 %3005, 0
  br i1 %3007, label %3008, label %3011

3008:                                             ; preds = %3003
  %3009 = shl nuw nsw i64 %3004, 4
  %3010 = getelementptr inbounds i8, i8* %0, i64 %3009
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3010, i8 0, i64 16, i1 false)
  br label %3011

3011:                                             ; preds = %3008, %3003
  %3012 = add nuw nsw i64 %.01, 376
  %3013 = call zeroext i8 @randombit()
  %3014 = getelementptr inbounds i8, i8* %1, i64 %3012
  store i8 %3013, i8* %3014, align 1
  %3015 = icmp eq i8 %3013, 0
  br i1 %3015, label %3016, label %3019

3016:                                             ; preds = %3011
  %3017 = shl nuw nsw i64 %3012, 4
  %3018 = getelementptr inbounds i8, i8* %0, i64 %3017
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3018, i8 0, i64 16, i1 false)
  br label %3019

3019:                                             ; preds = %3016, %3011
  %3020 = add nuw nsw i64 %.01, 377
  %3021 = call zeroext i8 @randombit()
  %3022 = getelementptr inbounds i8, i8* %1, i64 %3020
  store i8 %3021, i8* %3022, align 1
  %3023 = icmp eq i8 %3021, 0
  br i1 %3023, label %3024, label %3027

3024:                                             ; preds = %3019
  %3025 = shl nuw nsw i64 %3020, 4
  %3026 = getelementptr inbounds i8, i8* %0, i64 %3025
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3026, i8 0, i64 16, i1 false)
  br label %3027

3027:                                             ; preds = %3024, %3019
  %3028 = add nuw nsw i64 %.01, 378
  %3029 = call zeroext i8 @randombit()
  %3030 = getelementptr inbounds i8, i8* %1, i64 %3028
  store i8 %3029, i8* %3030, align 1
  %3031 = icmp eq i8 %3029, 0
  br i1 %3031, label %3032, label %3035

3032:                                             ; preds = %3027
  %3033 = shl nuw nsw i64 %3028, 4
  %3034 = getelementptr inbounds i8, i8* %0, i64 %3033
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3034, i8 0, i64 16, i1 false)
  br label %3035

3035:                                             ; preds = %3032, %3027
  %3036 = add nuw nsw i64 %.01, 379
  %3037 = call zeroext i8 @randombit()
  %3038 = getelementptr inbounds i8, i8* %1, i64 %3036
  store i8 %3037, i8* %3038, align 1
  %3039 = icmp eq i8 %3037, 0
  br i1 %3039, label %3040, label %3043

3040:                                             ; preds = %3035
  %3041 = shl nuw nsw i64 %3036, 4
  %3042 = getelementptr inbounds i8, i8* %0, i64 %3041
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3042, i8 0, i64 16, i1 false)
  br label %3043

3043:                                             ; preds = %3040, %3035
  %3044 = add nuw nsw i64 %.01, 380
  %3045 = call zeroext i8 @randombit()
  %3046 = getelementptr inbounds i8, i8* %1, i64 %3044
  store i8 %3045, i8* %3046, align 1
  %3047 = icmp eq i8 %3045, 0
  br i1 %3047, label %3048, label %3051

3048:                                             ; preds = %3043
  %3049 = shl nuw nsw i64 %3044, 4
  %3050 = getelementptr inbounds i8, i8* %0, i64 %3049
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3050, i8 0, i64 16, i1 false)
  br label %3051

3051:                                             ; preds = %3048, %3043
  %3052 = add nuw nsw i64 %.01, 381
  %3053 = call zeroext i8 @randombit()
  %3054 = getelementptr inbounds i8, i8* %1, i64 %3052
  store i8 %3053, i8* %3054, align 1
  %3055 = icmp eq i8 %3053, 0
  br i1 %3055, label %3056, label %3059

3056:                                             ; preds = %3051
  %3057 = shl nuw nsw i64 %3052, 4
  %3058 = getelementptr inbounds i8, i8* %0, i64 %3057
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3058, i8 0, i64 16, i1 false)
  br label %3059

3059:                                             ; preds = %3056, %3051
  %3060 = add nuw nsw i64 %.01, 382
  %3061 = call zeroext i8 @randombit()
  %3062 = getelementptr inbounds i8, i8* %1, i64 %3060
  store i8 %3061, i8* %3062, align 1
  %3063 = icmp eq i8 %3061, 0
  br i1 %3063, label %3064, label %3067

3064:                                             ; preds = %3059
  %3065 = shl nuw nsw i64 %3060, 4
  %3066 = getelementptr inbounds i8, i8* %0, i64 %3065
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3066, i8 0, i64 16, i1 false)
  br label %3067

3067:                                             ; preds = %3064, %3059
  %3068 = add nuw nsw i64 %.01, 383
  %3069 = call zeroext i8 @randombit()
  %3070 = getelementptr inbounds i8, i8* %1, i64 %3068
  store i8 %3069, i8* %3070, align 1
  %3071 = icmp eq i8 %3069, 0
  br i1 %3071, label %3072, label %3075

3072:                                             ; preds = %3067
  %3073 = shl nuw nsw i64 %3068, 4
  %3074 = getelementptr inbounds i8, i8* %0, i64 %3073
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3074, i8 0, i64 16, i1 false)
  br label %3075

3075:                                             ; preds = %3072, %3067
  %3076 = add nuw nsw i64 %.01, 384
  %3077 = call zeroext i8 @randombit()
  %3078 = getelementptr inbounds i8, i8* %1, i64 %3076
  store i8 %3077, i8* %3078, align 1
  %3079 = icmp eq i8 %3077, 0
  br i1 %3079, label %3080, label %3083

3080:                                             ; preds = %3075
  %3081 = shl nuw nsw i64 %3076, 4
  %3082 = getelementptr inbounds i8, i8* %0, i64 %3081
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3082, i8 0, i64 16, i1 false)
  br label %3083

3083:                                             ; preds = %3080, %3075
  %3084 = add nuw nsw i64 %.01, 385
  %3085 = call zeroext i8 @randombit()
  %3086 = getelementptr inbounds i8, i8* %1, i64 %3084
  store i8 %3085, i8* %3086, align 1
  %3087 = icmp eq i8 %3085, 0
  br i1 %3087, label %3088, label %3091

3088:                                             ; preds = %3083
  %3089 = shl nuw nsw i64 %3084, 4
  %3090 = getelementptr inbounds i8, i8* %0, i64 %3089
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3090, i8 0, i64 16, i1 false)
  br label %3091

3091:                                             ; preds = %3088, %3083
  %3092 = add nuw nsw i64 %.01, 386
  %3093 = call zeroext i8 @randombit()
  %3094 = getelementptr inbounds i8, i8* %1, i64 %3092
  store i8 %3093, i8* %3094, align 1
  %3095 = icmp eq i8 %3093, 0
  br i1 %3095, label %3096, label %3099

3096:                                             ; preds = %3091
  %3097 = shl nuw nsw i64 %3092, 4
  %3098 = getelementptr inbounds i8, i8* %0, i64 %3097
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3098, i8 0, i64 16, i1 false)
  br label %3099

3099:                                             ; preds = %3096, %3091
  %3100 = add nuw nsw i64 %.01, 387
  %3101 = call zeroext i8 @randombit()
  %3102 = getelementptr inbounds i8, i8* %1, i64 %3100
  store i8 %3101, i8* %3102, align 1
  %3103 = icmp eq i8 %3101, 0
  br i1 %3103, label %3104, label %3107

3104:                                             ; preds = %3099
  %3105 = shl nuw nsw i64 %3100, 4
  %3106 = getelementptr inbounds i8, i8* %0, i64 %3105
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3106, i8 0, i64 16, i1 false)
  br label %3107

3107:                                             ; preds = %3104, %3099
  %3108 = add nuw nsw i64 %.01, 388
  %3109 = call zeroext i8 @randombit()
  %3110 = getelementptr inbounds i8, i8* %1, i64 %3108
  store i8 %3109, i8* %3110, align 1
  %3111 = icmp eq i8 %3109, 0
  br i1 %3111, label %3112, label %3115

3112:                                             ; preds = %3107
  %3113 = shl nuw nsw i64 %3108, 4
  %3114 = getelementptr inbounds i8, i8* %0, i64 %3113
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3114, i8 0, i64 16, i1 false)
  br label %3115

3115:                                             ; preds = %3112, %3107
  %3116 = add nuw nsw i64 %.01, 389
  %3117 = call zeroext i8 @randombit()
  %3118 = getelementptr inbounds i8, i8* %1, i64 %3116
  store i8 %3117, i8* %3118, align 1
  %3119 = icmp eq i8 %3117, 0
  br i1 %3119, label %3120, label %3123

3120:                                             ; preds = %3115
  %3121 = shl nuw nsw i64 %3116, 4
  %3122 = getelementptr inbounds i8, i8* %0, i64 %3121
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3122, i8 0, i64 16, i1 false)
  br label %3123

3123:                                             ; preds = %3120, %3115
  %3124 = add nuw nsw i64 %.01, 390
  %3125 = call zeroext i8 @randombit()
  %3126 = getelementptr inbounds i8, i8* %1, i64 %3124
  store i8 %3125, i8* %3126, align 1
  %3127 = icmp eq i8 %3125, 0
  br i1 %3127, label %3128, label %3131

3128:                                             ; preds = %3123
  %3129 = shl nuw nsw i64 %3124, 4
  %3130 = getelementptr inbounds i8, i8* %0, i64 %3129
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3130, i8 0, i64 16, i1 false)
  br label %3131

3131:                                             ; preds = %3128, %3123
  %3132 = add nuw nsw i64 %.01, 391
  %3133 = call zeroext i8 @randombit()
  %3134 = getelementptr inbounds i8, i8* %1, i64 %3132
  store i8 %3133, i8* %3134, align 1
  %3135 = icmp eq i8 %3133, 0
  br i1 %3135, label %3136, label %3139

3136:                                             ; preds = %3131
  %3137 = shl nuw nsw i64 %3132, 4
  %3138 = getelementptr inbounds i8, i8* %0, i64 %3137
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3138, i8 0, i64 16, i1 false)
  br label %3139

3139:                                             ; preds = %3136, %3131
  %3140 = add nuw nsw i64 %.01, 392
  %3141 = call zeroext i8 @randombit()
  %3142 = getelementptr inbounds i8, i8* %1, i64 %3140
  store i8 %3141, i8* %3142, align 1
  %3143 = icmp eq i8 %3141, 0
  br i1 %3143, label %3144, label %3147

3144:                                             ; preds = %3139
  %3145 = shl nuw nsw i64 %3140, 4
  %3146 = getelementptr inbounds i8, i8* %0, i64 %3145
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3146, i8 0, i64 16, i1 false)
  br label %3147

3147:                                             ; preds = %3144, %3139
  %3148 = add nuw nsw i64 %.01, 393
  %3149 = call zeroext i8 @randombit()
  %3150 = getelementptr inbounds i8, i8* %1, i64 %3148
  store i8 %3149, i8* %3150, align 1
  %3151 = icmp eq i8 %3149, 0
  br i1 %3151, label %3152, label %3155

3152:                                             ; preds = %3147
  %3153 = shl nuw nsw i64 %3148, 4
  %3154 = getelementptr inbounds i8, i8* %0, i64 %3153
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3154, i8 0, i64 16, i1 false)
  br label %3155

3155:                                             ; preds = %3152, %3147
  %3156 = add nuw nsw i64 %.01, 394
  %3157 = call zeroext i8 @randombit()
  %3158 = getelementptr inbounds i8, i8* %1, i64 %3156
  store i8 %3157, i8* %3158, align 1
  %3159 = icmp eq i8 %3157, 0
  br i1 %3159, label %3160, label %3163

3160:                                             ; preds = %3155
  %3161 = shl nuw nsw i64 %3156, 4
  %3162 = getelementptr inbounds i8, i8* %0, i64 %3161
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3162, i8 0, i64 16, i1 false)
  br label %3163

3163:                                             ; preds = %3160, %3155
  %3164 = add nuw nsw i64 %.01, 395
  %3165 = call zeroext i8 @randombit()
  %3166 = getelementptr inbounds i8, i8* %1, i64 %3164
  store i8 %3165, i8* %3166, align 1
  %3167 = icmp eq i8 %3165, 0
  br i1 %3167, label %3168, label %3171

3168:                                             ; preds = %3163
  %3169 = shl nuw nsw i64 %3164, 4
  %3170 = getelementptr inbounds i8, i8* %0, i64 %3169
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3170, i8 0, i64 16, i1 false)
  br label %3171

3171:                                             ; preds = %3168, %3163
  %3172 = add nuw nsw i64 %.01, 396
  %3173 = call zeroext i8 @randombit()
  %3174 = getelementptr inbounds i8, i8* %1, i64 %3172
  store i8 %3173, i8* %3174, align 1
  %3175 = icmp eq i8 %3173, 0
  br i1 %3175, label %3176, label %3179

3176:                                             ; preds = %3171
  %3177 = shl nuw nsw i64 %3172, 4
  %3178 = getelementptr inbounds i8, i8* %0, i64 %3177
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3178, i8 0, i64 16, i1 false)
  br label %3179

3179:                                             ; preds = %3176, %3171
  %3180 = add nuw nsw i64 %.01, 397
  %3181 = call zeroext i8 @randombit()
  %3182 = getelementptr inbounds i8, i8* %1, i64 %3180
  store i8 %3181, i8* %3182, align 1
  %3183 = icmp eq i8 %3181, 0
  br i1 %3183, label %3184, label %3187

3184:                                             ; preds = %3179
  %3185 = shl nuw nsw i64 %3180, 4
  %3186 = getelementptr inbounds i8, i8* %0, i64 %3185
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3186, i8 0, i64 16, i1 false)
  br label %3187

3187:                                             ; preds = %3184, %3179
  %3188 = add nuw nsw i64 %.01, 398
  %3189 = call zeroext i8 @randombit()
  %3190 = getelementptr inbounds i8, i8* %1, i64 %3188
  store i8 %3189, i8* %3190, align 1
  %3191 = icmp eq i8 %3189, 0
  br i1 %3191, label %3192, label %3195

3192:                                             ; preds = %3187
  %3193 = shl nuw nsw i64 %3188, 4
  %3194 = getelementptr inbounds i8, i8* %0, i64 %3193
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3194, i8 0, i64 16, i1 false)
  br label %3195

3195:                                             ; preds = %3192, %3187
  %3196 = add nuw nsw i64 %.01, 399
  %3197 = call zeroext i8 @randombit()
  %3198 = getelementptr inbounds i8, i8* %1, i64 %3196
  store i8 %3197, i8* %3198, align 1
  %3199 = icmp eq i8 %3197, 0
  br i1 %3199, label %3200, label %3203

3200:                                             ; preds = %3195
  %3201 = shl nuw nsw i64 %3196, 4
  %3202 = getelementptr inbounds i8, i8* %0, i64 %3201
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3202, i8 0, i64 16, i1 false)
  br label %3203

3203:                                             ; preds = %3200, %3195
  %3204 = add nuw nsw i64 %.01, 400
  %3205 = call zeroext i8 @randombit()
  %3206 = getelementptr inbounds i8, i8* %1, i64 %3204
  store i8 %3205, i8* %3206, align 1
  %3207 = icmp eq i8 %3205, 0
  br i1 %3207, label %3208, label %3211

3208:                                             ; preds = %3203
  %3209 = shl nuw nsw i64 %3204, 4
  %3210 = getelementptr inbounds i8, i8* %0, i64 %3209
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3210, i8 0, i64 16, i1 false)
  br label %3211

3211:                                             ; preds = %3208, %3203
  %3212 = add nuw nsw i64 %.01, 401
  %3213 = call zeroext i8 @randombit()
  %3214 = getelementptr inbounds i8, i8* %1, i64 %3212
  store i8 %3213, i8* %3214, align 1
  %3215 = icmp eq i8 %3213, 0
  br i1 %3215, label %3216, label %3219

3216:                                             ; preds = %3211
  %3217 = shl nuw nsw i64 %3212, 4
  %3218 = getelementptr inbounds i8, i8* %0, i64 %3217
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3218, i8 0, i64 16, i1 false)
  br label %3219

3219:                                             ; preds = %3216, %3211
  %3220 = add nuw nsw i64 %.01, 402
  %3221 = call zeroext i8 @randombit()
  %3222 = getelementptr inbounds i8, i8* %1, i64 %3220
  store i8 %3221, i8* %3222, align 1
  %3223 = icmp eq i8 %3221, 0
  br i1 %3223, label %3224, label %3227

3224:                                             ; preds = %3219
  %3225 = shl nuw nsw i64 %3220, 4
  %3226 = getelementptr inbounds i8, i8* %0, i64 %3225
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3226, i8 0, i64 16, i1 false)
  br label %3227

3227:                                             ; preds = %3224, %3219
  %3228 = add nuw nsw i64 %.01, 403
  %3229 = call zeroext i8 @randombit()
  %3230 = getelementptr inbounds i8, i8* %1, i64 %3228
  store i8 %3229, i8* %3230, align 1
  %3231 = icmp eq i8 %3229, 0
  br i1 %3231, label %3232, label %3235

3232:                                             ; preds = %3227
  %3233 = shl nuw nsw i64 %3228, 4
  %3234 = getelementptr inbounds i8, i8* %0, i64 %3233
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3234, i8 0, i64 16, i1 false)
  br label %3235

3235:                                             ; preds = %3232, %3227
  %3236 = add nuw nsw i64 %.01, 404
  %3237 = call zeroext i8 @randombit()
  %3238 = getelementptr inbounds i8, i8* %1, i64 %3236
  store i8 %3237, i8* %3238, align 1
  %3239 = icmp eq i8 %3237, 0
  br i1 %3239, label %3240, label %3243

3240:                                             ; preds = %3235
  %3241 = shl nuw nsw i64 %3236, 4
  %3242 = getelementptr inbounds i8, i8* %0, i64 %3241
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3242, i8 0, i64 16, i1 false)
  br label %3243

3243:                                             ; preds = %3240, %3235
  %3244 = add nuw nsw i64 %.01, 405
  %3245 = call zeroext i8 @randombit()
  %3246 = getelementptr inbounds i8, i8* %1, i64 %3244
  store i8 %3245, i8* %3246, align 1
  %3247 = icmp eq i8 %3245, 0
  br i1 %3247, label %3248, label %3251

3248:                                             ; preds = %3243
  %3249 = shl nuw nsw i64 %3244, 4
  %3250 = getelementptr inbounds i8, i8* %0, i64 %3249
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3250, i8 0, i64 16, i1 false)
  br label %3251

3251:                                             ; preds = %3248, %3243
  %3252 = add nuw nsw i64 %.01, 406
  %3253 = call zeroext i8 @randombit()
  %3254 = getelementptr inbounds i8, i8* %1, i64 %3252
  store i8 %3253, i8* %3254, align 1
  %3255 = icmp eq i8 %3253, 0
  br i1 %3255, label %3256, label %3259

3256:                                             ; preds = %3251
  %3257 = shl nuw nsw i64 %3252, 4
  %3258 = getelementptr inbounds i8, i8* %0, i64 %3257
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3258, i8 0, i64 16, i1 false)
  br label %3259

3259:                                             ; preds = %3256, %3251
  %3260 = add nuw nsw i64 %.01, 407
  %3261 = call zeroext i8 @randombit()
  %3262 = getelementptr inbounds i8, i8* %1, i64 %3260
  store i8 %3261, i8* %3262, align 1
  %3263 = icmp eq i8 %3261, 0
  br i1 %3263, label %3264, label %3267

3264:                                             ; preds = %3259
  %3265 = shl nuw nsw i64 %3260, 4
  %3266 = getelementptr inbounds i8, i8* %0, i64 %3265
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3266, i8 0, i64 16, i1 false)
  br label %3267

3267:                                             ; preds = %3264, %3259
  %3268 = add nuw nsw i64 %.01, 408
  %3269 = call zeroext i8 @randombit()
  %3270 = getelementptr inbounds i8, i8* %1, i64 %3268
  store i8 %3269, i8* %3270, align 1
  %3271 = icmp eq i8 %3269, 0
  br i1 %3271, label %3272, label %3275

3272:                                             ; preds = %3267
  %3273 = shl nuw nsw i64 %3268, 4
  %3274 = getelementptr inbounds i8, i8* %0, i64 %3273
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3274, i8 0, i64 16, i1 false)
  br label %3275

3275:                                             ; preds = %3272, %3267
  %3276 = add nuw nsw i64 %.01, 409
  %3277 = call zeroext i8 @randombit()
  %3278 = getelementptr inbounds i8, i8* %1, i64 %3276
  store i8 %3277, i8* %3278, align 1
  %3279 = icmp eq i8 %3277, 0
  br i1 %3279, label %3280, label %3283

3280:                                             ; preds = %3275
  %3281 = shl nuw nsw i64 %3276, 4
  %3282 = getelementptr inbounds i8, i8* %0, i64 %3281
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3282, i8 0, i64 16, i1 false)
  br label %3283

3283:                                             ; preds = %3280, %3275
  %3284 = add nuw nsw i64 %.01, 410
  %3285 = call zeroext i8 @randombit()
  %3286 = getelementptr inbounds i8, i8* %1, i64 %3284
  store i8 %3285, i8* %3286, align 1
  %3287 = icmp eq i8 %3285, 0
  br i1 %3287, label %3288, label %3291

3288:                                             ; preds = %3283
  %3289 = shl nuw nsw i64 %3284, 4
  %3290 = getelementptr inbounds i8, i8* %0, i64 %3289
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3290, i8 0, i64 16, i1 false)
  br label %3291

3291:                                             ; preds = %3288, %3283
  %3292 = add nuw nsw i64 %.01, 411
  %3293 = call zeroext i8 @randombit()
  %3294 = getelementptr inbounds i8, i8* %1, i64 %3292
  store i8 %3293, i8* %3294, align 1
  %3295 = icmp eq i8 %3293, 0
  br i1 %3295, label %3296, label %3299

3296:                                             ; preds = %3291
  %3297 = shl nuw nsw i64 %3292, 4
  %3298 = getelementptr inbounds i8, i8* %0, i64 %3297
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3298, i8 0, i64 16, i1 false)
  br label %3299

3299:                                             ; preds = %3296, %3291
  %3300 = add nuw nsw i64 %.01, 412
  %3301 = call zeroext i8 @randombit()
  %3302 = getelementptr inbounds i8, i8* %1, i64 %3300
  store i8 %3301, i8* %3302, align 1
  %3303 = icmp eq i8 %3301, 0
  br i1 %3303, label %3304, label %3307

3304:                                             ; preds = %3299
  %3305 = shl nuw nsw i64 %3300, 4
  %3306 = getelementptr inbounds i8, i8* %0, i64 %3305
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3306, i8 0, i64 16, i1 false)
  br label %3307

3307:                                             ; preds = %3304, %3299
  %3308 = add nuw nsw i64 %.01, 413
  %3309 = call zeroext i8 @randombit()
  %3310 = getelementptr inbounds i8, i8* %1, i64 %3308
  store i8 %3309, i8* %3310, align 1
  %3311 = icmp eq i8 %3309, 0
  br i1 %3311, label %3312, label %3315

3312:                                             ; preds = %3307
  %3313 = shl nuw nsw i64 %3308, 4
  %3314 = getelementptr inbounds i8, i8* %0, i64 %3313
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3314, i8 0, i64 16, i1 false)
  br label %3315

3315:                                             ; preds = %3312, %3307
  %3316 = add nuw nsw i64 %.01, 414
  %3317 = call zeroext i8 @randombit()
  %3318 = getelementptr inbounds i8, i8* %1, i64 %3316
  store i8 %3317, i8* %3318, align 1
  %3319 = icmp eq i8 %3317, 0
  br i1 %3319, label %3320, label %3323

3320:                                             ; preds = %3315
  %3321 = shl nuw nsw i64 %3316, 4
  %3322 = getelementptr inbounds i8, i8* %0, i64 %3321
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3322, i8 0, i64 16, i1 false)
  br label %3323

3323:                                             ; preds = %3320, %3315
  %3324 = add nuw nsw i64 %.01, 415
  %3325 = call zeroext i8 @randombit()
  %3326 = getelementptr inbounds i8, i8* %1, i64 %3324
  store i8 %3325, i8* %3326, align 1
  %3327 = icmp eq i8 %3325, 0
  br i1 %3327, label %3328, label %3331

3328:                                             ; preds = %3323
  %3329 = shl nuw nsw i64 %3324, 4
  %3330 = getelementptr inbounds i8, i8* %0, i64 %3329
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3330, i8 0, i64 16, i1 false)
  br label %3331

3331:                                             ; preds = %3328, %3323
  %3332 = add nuw nsw i64 %.01, 416
  %3333 = call zeroext i8 @randombit()
  %3334 = getelementptr inbounds i8, i8* %1, i64 %3332
  store i8 %3333, i8* %3334, align 1
  %3335 = icmp eq i8 %3333, 0
  br i1 %3335, label %3336, label %3339

3336:                                             ; preds = %3331
  %3337 = shl nuw nsw i64 %3332, 4
  %3338 = getelementptr inbounds i8, i8* %0, i64 %3337
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3338, i8 0, i64 16, i1 false)
  br label %3339

3339:                                             ; preds = %3336, %3331
  %3340 = add nuw nsw i64 %.01, 417
  %3341 = call zeroext i8 @randombit()
  %3342 = getelementptr inbounds i8, i8* %1, i64 %3340
  store i8 %3341, i8* %3342, align 1
  %3343 = icmp eq i8 %3341, 0
  br i1 %3343, label %3344, label %3347

3344:                                             ; preds = %3339
  %3345 = shl nuw nsw i64 %3340, 4
  %3346 = getelementptr inbounds i8, i8* %0, i64 %3345
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3346, i8 0, i64 16, i1 false)
  br label %3347

3347:                                             ; preds = %3344, %3339
  %3348 = add nuw nsw i64 %.01, 418
  %3349 = call zeroext i8 @randombit()
  %3350 = getelementptr inbounds i8, i8* %1, i64 %3348
  store i8 %3349, i8* %3350, align 1
  %3351 = icmp eq i8 %3349, 0
  br i1 %3351, label %3352, label %3355

3352:                                             ; preds = %3347
  %3353 = shl nuw nsw i64 %3348, 4
  %3354 = getelementptr inbounds i8, i8* %0, i64 %3353
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3354, i8 0, i64 16, i1 false)
  br label %3355

3355:                                             ; preds = %3352, %3347
  %3356 = add nuw nsw i64 %.01, 419
  %3357 = call zeroext i8 @randombit()
  %3358 = getelementptr inbounds i8, i8* %1, i64 %3356
  store i8 %3357, i8* %3358, align 1
  %3359 = icmp eq i8 %3357, 0
  br i1 %3359, label %3360, label %3363

3360:                                             ; preds = %3355
  %3361 = shl nuw nsw i64 %3356, 4
  %3362 = getelementptr inbounds i8, i8* %0, i64 %3361
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3362, i8 0, i64 16, i1 false)
  br label %3363

3363:                                             ; preds = %3360, %3355
  %3364 = add nuw nsw i64 %.01, 420
  %3365 = call zeroext i8 @randombit()
  %3366 = getelementptr inbounds i8, i8* %1, i64 %3364
  store i8 %3365, i8* %3366, align 1
  %3367 = icmp eq i8 %3365, 0
  br i1 %3367, label %3368, label %3371

3368:                                             ; preds = %3363
  %3369 = shl nuw nsw i64 %3364, 4
  %3370 = getelementptr inbounds i8, i8* %0, i64 %3369
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3370, i8 0, i64 16, i1 false)
  br label %3371

3371:                                             ; preds = %3368, %3363
  %3372 = add nuw nsw i64 %.01, 421
  %3373 = call zeroext i8 @randombit()
  %3374 = getelementptr inbounds i8, i8* %1, i64 %3372
  store i8 %3373, i8* %3374, align 1
  %3375 = icmp eq i8 %3373, 0
  br i1 %3375, label %3376, label %3379

3376:                                             ; preds = %3371
  %3377 = shl nuw nsw i64 %3372, 4
  %3378 = getelementptr inbounds i8, i8* %0, i64 %3377
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3378, i8 0, i64 16, i1 false)
  br label %3379

3379:                                             ; preds = %3376, %3371
  %3380 = add nuw nsw i64 %.01, 422
  %3381 = call zeroext i8 @randombit()
  %3382 = getelementptr inbounds i8, i8* %1, i64 %3380
  store i8 %3381, i8* %3382, align 1
  %3383 = icmp eq i8 %3381, 0
  br i1 %3383, label %3384, label %3387

3384:                                             ; preds = %3379
  %3385 = shl nuw nsw i64 %3380, 4
  %3386 = getelementptr inbounds i8, i8* %0, i64 %3385
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3386, i8 0, i64 16, i1 false)
  br label %3387

3387:                                             ; preds = %3384, %3379
  %3388 = add nuw nsw i64 %.01, 423
  %3389 = call zeroext i8 @randombit()
  %3390 = getelementptr inbounds i8, i8* %1, i64 %3388
  store i8 %3389, i8* %3390, align 1
  %3391 = icmp eq i8 %3389, 0
  br i1 %3391, label %3392, label %3395

3392:                                             ; preds = %3387
  %3393 = shl nuw nsw i64 %3388, 4
  %3394 = getelementptr inbounds i8, i8* %0, i64 %3393
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3394, i8 0, i64 16, i1 false)
  br label %3395

3395:                                             ; preds = %3392, %3387
  %3396 = add nuw nsw i64 %.01, 424
  %3397 = call zeroext i8 @randombit()
  %3398 = getelementptr inbounds i8, i8* %1, i64 %3396
  store i8 %3397, i8* %3398, align 1
  %3399 = icmp eq i8 %3397, 0
  br i1 %3399, label %3400, label %3403

3400:                                             ; preds = %3395
  %3401 = shl nuw nsw i64 %3396, 4
  %3402 = getelementptr inbounds i8, i8* %0, i64 %3401
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3402, i8 0, i64 16, i1 false)
  br label %3403

3403:                                             ; preds = %3400, %3395
  %3404 = add nuw nsw i64 %.01, 425
  %3405 = call zeroext i8 @randombit()
  %3406 = getelementptr inbounds i8, i8* %1, i64 %3404
  store i8 %3405, i8* %3406, align 1
  %3407 = icmp eq i8 %3405, 0
  br i1 %3407, label %3408, label %3411

3408:                                             ; preds = %3403
  %3409 = shl nuw nsw i64 %3404, 4
  %3410 = getelementptr inbounds i8, i8* %0, i64 %3409
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3410, i8 0, i64 16, i1 false)
  br label %3411

3411:                                             ; preds = %3408, %3403
  %3412 = add nuw nsw i64 %.01, 426
  %3413 = call zeroext i8 @randombit()
  %3414 = getelementptr inbounds i8, i8* %1, i64 %3412
  store i8 %3413, i8* %3414, align 1
  %3415 = icmp eq i8 %3413, 0
  br i1 %3415, label %3416, label %3419

3416:                                             ; preds = %3411
  %3417 = shl nuw nsw i64 %3412, 4
  %3418 = getelementptr inbounds i8, i8* %0, i64 %3417
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3418, i8 0, i64 16, i1 false)
  br label %3419

3419:                                             ; preds = %3416, %3411
  %3420 = add nuw nsw i64 %.01, 427
  %3421 = call zeroext i8 @randombit()
  %3422 = getelementptr inbounds i8, i8* %1, i64 %3420
  store i8 %3421, i8* %3422, align 1
  %3423 = icmp eq i8 %3421, 0
  br i1 %3423, label %3424, label %3427

3424:                                             ; preds = %3419
  %3425 = shl nuw nsw i64 %3420, 4
  %3426 = getelementptr inbounds i8, i8* %0, i64 %3425
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3426, i8 0, i64 16, i1 false)
  br label %3427

3427:                                             ; preds = %3424, %3419
  %3428 = add nuw nsw i64 %.01, 428
  %3429 = call zeroext i8 @randombit()
  %3430 = getelementptr inbounds i8, i8* %1, i64 %3428
  store i8 %3429, i8* %3430, align 1
  %3431 = icmp eq i8 %3429, 0
  br i1 %3431, label %3432, label %3435

3432:                                             ; preds = %3427
  %3433 = shl nuw nsw i64 %3428, 4
  %3434 = getelementptr inbounds i8, i8* %0, i64 %3433
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3434, i8 0, i64 16, i1 false)
  br label %3435

3435:                                             ; preds = %3432, %3427
  %3436 = add nuw nsw i64 %.01, 429
  %3437 = call zeroext i8 @randombit()
  %3438 = getelementptr inbounds i8, i8* %1, i64 %3436
  store i8 %3437, i8* %3438, align 1
  %3439 = icmp eq i8 %3437, 0
  br i1 %3439, label %3440, label %3443

3440:                                             ; preds = %3435
  %3441 = shl nuw nsw i64 %3436, 4
  %3442 = getelementptr inbounds i8, i8* %0, i64 %3441
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3442, i8 0, i64 16, i1 false)
  br label %3443

3443:                                             ; preds = %3440, %3435
  %3444 = add nuw nsw i64 %.01, 430
  %3445 = call zeroext i8 @randombit()
  %3446 = getelementptr inbounds i8, i8* %1, i64 %3444
  store i8 %3445, i8* %3446, align 1
  %3447 = icmp eq i8 %3445, 0
  br i1 %3447, label %3448, label %3451

3448:                                             ; preds = %3443
  %3449 = shl nuw nsw i64 %3444, 4
  %3450 = getelementptr inbounds i8, i8* %0, i64 %3449
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3450, i8 0, i64 16, i1 false)
  br label %3451

3451:                                             ; preds = %3448, %3443
  %3452 = add nuw nsw i64 %.01, 431
  %3453 = call zeroext i8 @randombit()
  %3454 = getelementptr inbounds i8, i8* %1, i64 %3452
  store i8 %3453, i8* %3454, align 1
  %3455 = icmp eq i8 %3453, 0
  br i1 %3455, label %3456, label %3459

3456:                                             ; preds = %3451
  %3457 = shl nuw nsw i64 %3452, 4
  %3458 = getelementptr inbounds i8, i8* %0, i64 %3457
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3458, i8 0, i64 16, i1 false)
  br label %3459

3459:                                             ; preds = %3456, %3451
  %3460 = add nuw nsw i64 %.01, 432
  %3461 = call zeroext i8 @randombit()
  %3462 = getelementptr inbounds i8, i8* %1, i64 %3460
  store i8 %3461, i8* %3462, align 1
  %3463 = icmp eq i8 %3461, 0
  br i1 %3463, label %3464, label %3467

3464:                                             ; preds = %3459
  %3465 = shl nuw nsw i64 %3460, 4
  %3466 = getelementptr inbounds i8, i8* %0, i64 %3465
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3466, i8 0, i64 16, i1 false)
  br label %3467

3467:                                             ; preds = %3464, %3459
  %3468 = add nuw nsw i64 %.01, 433
  %3469 = call zeroext i8 @randombit()
  %3470 = getelementptr inbounds i8, i8* %1, i64 %3468
  store i8 %3469, i8* %3470, align 1
  %3471 = icmp eq i8 %3469, 0
  br i1 %3471, label %3472, label %3475

3472:                                             ; preds = %3467
  %3473 = shl nuw nsw i64 %3468, 4
  %3474 = getelementptr inbounds i8, i8* %0, i64 %3473
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3474, i8 0, i64 16, i1 false)
  br label %3475

3475:                                             ; preds = %3472, %3467
  %3476 = add nuw nsw i64 %.01, 434
  %3477 = call zeroext i8 @randombit()
  %3478 = getelementptr inbounds i8, i8* %1, i64 %3476
  store i8 %3477, i8* %3478, align 1
  %3479 = icmp eq i8 %3477, 0
  br i1 %3479, label %3480, label %3483

3480:                                             ; preds = %3475
  %3481 = shl nuw nsw i64 %3476, 4
  %3482 = getelementptr inbounds i8, i8* %0, i64 %3481
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3482, i8 0, i64 16, i1 false)
  br label %3483

3483:                                             ; preds = %3480, %3475
  %3484 = add nuw nsw i64 %.01, 435
  %3485 = call zeroext i8 @randombit()
  %3486 = getelementptr inbounds i8, i8* %1, i64 %3484
  store i8 %3485, i8* %3486, align 1
  %3487 = icmp eq i8 %3485, 0
  br i1 %3487, label %3488, label %3491

3488:                                             ; preds = %3483
  %3489 = shl nuw nsw i64 %3484, 4
  %3490 = getelementptr inbounds i8, i8* %0, i64 %3489
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3490, i8 0, i64 16, i1 false)
  br label %3491

3491:                                             ; preds = %3488, %3483
  %3492 = add nuw nsw i64 %.01, 436
  %3493 = call zeroext i8 @randombit()
  %3494 = getelementptr inbounds i8, i8* %1, i64 %3492
  store i8 %3493, i8* %3494, align 1
  %3495 = icmp eq i8 %3493, 0
  br i1 %3495, label %3496, label %3499

3496:                                             ; preds = %3491
  %3497 = shl nuw nsw i64 %3492, 4
  %3498 = getelementptr inbounds i8, i8* %0, i64 %3497
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3498, i8 0, i64 16, i1 false)
  br label %3499

3499:                                             ; preds = %3496, %3491
  %3500 = add nuw nsw i64 %.01, 437
  %3501 = call zeroext i8 @randombit()
  %3502 = getelementptr inbounds i8, i8* %1, i64 %3500
  store i8 %3501, i8* %3502, align 1
  %3503 = icmp eq i8 %3501, 0
  br i1 %3503, label %3504, label %3507

3504:                                             ; preds = %3499
  %3505 = shl nuw nsw i64 %3500, 4
  %3506 = getelementptr inbounds i8, i8* %0, i64 %3505
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3506, i8 0, i64 16, i1 false)
  br label %3507

3507:                                             ; preds = %3504, %3499
  %3508 = add nuw nsw i64 %.01, 438
  %3509 = call zeroext i8 @randombit()
  %3510 = getelementptr inbounds i8, i8* %1, i64 %3508
  store i8 %3509, i8* %3510, align 1
  %3511 = icmp eq i8 %3509, 0
  br i1 %3511, label %3512, label %3515

3512:                                             ; preds = %3507
  %3513 = shl nuw nsw i64 %3508, 4
  %3514 = getelementptr inbounds i8, i8* %0, i64 %3513
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3514, i8 0, i64 16, i1 false)
  br label %3515

3515:                                             ; preds = %3512, %3507
  %3516 = add nuw nsw i64 %.01, 439
  %3517 = call zeroext i8 @randombit()
  %3518 = getelementptr inbounds i8, i8* %1, i64 %3516
  store i8 %3517, i8* %3518, align 1
  %3519 = icmp eq i8 %3517, 0
  br i1 %3519, label %3520, label %3523

3520:                                             ; preds = %3515
  %3521 = shl nuw nsw i64 %3516, 4
  %3522 = getelementptr inbounds i8, i8* %0, i64 %3521
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3522, i8 0, i64 16, i1 false)
  br label %3523

3523:                                             ; preds = %3520, %3515
  %3524 = add nuw nsw i64 %.01, 440
  %3525 = call zeroext i8 @randombit()
  %3526 = getelementptr inbounds i8, i8* %1, i64 %3524
  store i8 %3525, i8* %3526, align 1
  %3527 = icmp eq i8 %3525, 0
  br i1 %3527, label %3528, label %3531

3528:                                             ; preds = %3523
  %3529 = shl nuw nsw i64 %3524, 4
  %3530 = getelementptr inbounds i8, i8* %0, i64 %3529
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3530, i8 0, i64 16, i1 false)
  br label %3531

3531:                                             ; preds = %3528, %3523
  %3532 = add nuw nsw i64 %.01, 441
  %3533 = call zeroext i8 @randombit()
  %3534 = getelementptr inbounds i8, i8* %1, i64 %3532
  store i8 %3533, i8* %3534, align 1
  %3535 = icmp eq i8 %3533, 0
  br i1 %3535, label %3536, label %3539

3536:                                             ; preds = %3531
  %3537 = shl nuw nsw i64 %3532, 4
  %3538 = getelementptr inbounds i8, i8* %0, i64 %3537
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3538, i8 0, i64 16, i1 false)
  br label %3539

3539:                                             ; preds = %3536, %3531
  %3540 = add nuw nsw i64 %.01, 442
  %3541 = call zeroext i8 @randombit()
  %3542 = getelementptr inbounds i8, i8* %1, i64 %3540
  store i8 %3541, i8* %3542, align 1
  %3543 = icmp eq i8 %3541, 0
  br i1 %3543, label %3544, label %3547

3544:                                             ; preds = %3539
  %3545 = shl nuw nsw i64 %3540, 4
  %3546 = getelementptr inbounds i8, i8* %0, i64 %3545
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3546, i8 0, i64 16, i1 false)
  br label %3547

3547:                                             ; preds = %3544, %3539
  %3548 = add nuw nsw i64 %.01, 443
  %3549 = call zeroext i8 @randombit()
  %3550 = getelementptr inbounds i8, i8* %1, i64 %3548
  store i8 %3549, i8* %3550, align 1
  %3551 = icmp eq i8 %3549, 0
  br i1 %3551, label %3552, label %3555

3552:                                             ; preds = %3547
  %3553 = shl nuw nsw i64 %3548, 4
  %3554 = getelementptr inbounds i8, i8* %0, i64 %3553
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3554, i8 0, i64 16, i1 false)
  br label %3555

3555:                                             ; preds = %3552, %3547
  %3556 = add nuw nsw i64 %.01, 444
  %3557 = call zeroext i8 @randombit()
  %3558 = getelementptr inbounds i8, i8* %1, i64 %3556
  store i8 %3557, i8* %3558, align 1
  %3559 = icmp eq i8 %3557, 0
  br i1 %3559, label %3560, label %3563

3560:                                             ; preds = %3555
  %3561 = shl nuw nsw i64 %3556, 4
  %3562 = getelementptr inbounds i8, i8* %0, i64 %3561
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3562, i8 0, i64 16, i1 false)
  br label %3563

3563:                                             ; preds = %3560, %3555
  %3564 = add nuw nsw i64 %.01, 445
  %3565 = call zeroext i8 @randombit()
  %3566 = getelementptr inbounds i8, i8* %1, i64 %3564
  store i8 %3565, i8* %3566, align 1
  %3567 = icmp eq i8 %3565, 0
  br i1 %3567, label %3568, label %3571

3568:                                             ; preds = %3563
  %3569 = shl nuw nsw i64 %3564, 4
  %3570 = getelementptr inbounds i8, i8* %0, i64 %3569
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3570, i8 0, i64 16, i1 false)
  br label %3571

3571:                                             ; preds = %3568, %3563
  %3572 = add nuw nsw i64 %.01, 446
  %3573 = call zeroext i8 @randombit()
  %3574 = getelementptr inbounds i8, i8* %1, i64 %3572
  store i8 %3573, i8* %3574, align 1
  %3575 = icmp eq i8 %3573, 0
  br i1 %3575, label %3576, label %3579

3576:                                             ; preds = %3571
  %3577 = shl nuw nsw i64 %3572, 4
  %3578 = getelementptr inbounds i8, i8* %0, i64 %3577
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3578, i8 0, i64 16, i1 false)
  br label %3579

3579:                                             ; preds = %3576, %3571
  %3580 = add nuw nsw i64 %.01, 447
  %3581 = call zeroext i8 @randombit()
  %3582 = getelementptr inbounds i8, i8* %1, i64 %3580
  store i8 %3581, i8* %3582, align 1
  %3583 = icmp eq i8 %3581, 0
  br i1 %3583, label %3584, label %3587

3584:                                             ; preds = %3579
  %3585 = shl nuw nsw i64 %3580, 4
  %3586 = getelementptr inbounds i8, i8* %0, i64 %3585
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3586, i8 0, i64 16, i1 false)
  br label %3587

3587:                                             ; preds = %3584, %3579
  %3588 = add nuw nsw i64 %.01, 448
  %3589 = call zeroext i8 @randombit()
  %3590 = getelementptr inbounds i8, i8* %1, i64 %3588
  store i8 %3589, i8* %3590, align 1
  %3591 = icmp eq i8 %3589, 0
  br i1 %3591, label %3592, label %3595

3592:                                             ; preds = %3587
  %3593 = shl nuw nsw i64 %3588, 4
  %3594 = getelementptr inbounds i8, i8* %0, i64 %3593
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3594, i8 0, i64 16, i1 false)
  br label %3595

3595:                                             ; preds = %3592, %3587
  %3596 = add nuw nsw i64 %.01, 449
  %3597 = call zeroext i8 @randombit()
  %3598 = getelementptr inbounds i8, i8* %1, i64 %3596
  store i8 %3597, i8* %3598, align 1
  %3599 = icmp eq i8 %3597, 0
  br i1 %3599, label %3600, label %3603

3600:                                             ; preds = %3595
  %3601 = shl nuw nsw i64 %3596, 4
  %3602 = getelementptr inbounds i8, i8* %0, i64 %3601
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3602, i8 0, i64 16, i1 false)
  br label %3603

3603:                                             ; preds = %3600, %3595
  %3604 = add nuw nsw i64 %.01, 450
  %3605 = call zeroext i8 @randombit()
  %3606 = getelementptr inbounds i8, i8* %1, i64 %3604
  store i8 %3605, i8* %3606, align 1
  %3607 = icmp eq i8 %3605, 0
  br i1 %3607, label %3608, label %3611

3608:                                             ; preds = %3603
  %3609 = shl nuw nsw i64 %3604, 4
  %3610 = getelementptr inbounds i8, i8* %0, i64 %3609
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3610, i8 0, i64 16, i1 false)
  br label %3611

3611:                                             ; preds = %3608, %3603
  %3612 = add nuw nsw i64 %.01, 451
  %3613 = call zeroext i8 @randombit()
  %3614 = getelementptr inbounds i8, i8* %1, i64 %3612
  store i8 %3613, i8* %3614, align 1
  %3615 = icmp eq i8 %3613, 0
  br i1 %3615, label %3616, label %3619

3616:                                             ; preds = %3611
  %3617 = shl nuw nsw i64 %3612, 4
  %3618 = getelementptr inbounds i8, i8* %0, i64 %3617
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3618, i8 0, i64 16, i1 false)
  br label %3619

3619:                                             ; preds = %3616, %3611
  %3620 = add nuw nsw i64 %.01, 452
  %3621 = call zeroext i8 @randombit()
  %3622 = getelementptr inbounds i8, i8* %1, i64 %3620
  store i8 %3621, i8* %3622, align 1
  %3623 = icmp eq i8 %3621, 0
  br i1 %3623, label %3624, label %3627

3624:                                             ; preds = %3619
  %3625 = shl nuw nsw i64 %3620, 4
  %3626 = getelementptr inbounds i8, i8* %0, i64 %3625
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3626, i8 0, i64 16, i1 false)
  br label %3627

3627:                                             ; preds = %3624, %3619
  %3628 = add nuw nsw i64 %.01, 453
  %3629 = call zeroext i8 @randombit()
  %3630 = getelementptr inbounds i8, i8* %1, i64 %3628
  store i8 %3629, i8* %3630, align 1
  %3631 = icmp eq i8 %3629, 0
  br i1 %3631, label %3632, label %3635

3632:                                             ; preds = %3627
  %3633 = shl nuw nsw i64 %3628, 4
  %3634 = getelementptr inbounds i8, i8* %0, i64 %3633
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3634, i8 0, i64 16, i1 false)
  br label %3635

3635:                                             ; preds = %3632, %3627
  %3636 = add nuw nsw i64 %.01, 454
  %3637 = call zeroext i8 @randombit()
  %3638 = getelementptr inbounds i8, i8* %1, i64 %3636
  store i8 %3637, i8* %3638, align 1
  %3639 = icmp eq i8 %3637, 0
  br i1 %3639, label %3640, label %3643

3640:                                             ; preds = %3635
  %3641 = shl nuw nsw i64 %3636, 4
  %3642 = getelementptr inbounds i8, i8* %0, i64 %3641
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3642, i8 0, i64 16, i1 false)
  br label %3643

3643:                                             ; preds = %3640, %3635
  %3644 = add nuw nsw i64 %.01, 455
  %3645 = call zeroext i8 @randombit()
  %3646 = getelementptr inbounds i8, i8* %1, i64 %3644
  store i8 %3645, i8* %3646, align 1
  %3647 = icmp eq i8 %3645, 0
  br i1 %3647, label %3648, label %3651

3648:                                             ; preds = %3643
  %3649 = shl nuw nsw i64 %3644, 4
  %3650 = getelementptr inbounds i8, i8* %0, i64 %3649
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3650, i8 0, i64 16, i1 false)
  br label %3651

3651:                                             ; preds = %3648, %3643
  %3652 = add nuw nsw i64 %.01, 456
  %3653 = call zeroext i8 @randombit()
  %3654 = getelementptr inbounds i8, i8* %1, i64 %3652
  store i8 %3653, i8* %3654, align 1
  %3655 = icmp eq i8 %3653, 0
  br i1 %3655, label %3656, label %3659

3656:                                             ; preds = %3651
  %3657 = shl nuw nsw i64 %3652, 4
  %3658 = getelementptr inbounds i8, i8* %0, i64 %3657
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3658, i8 0, i64 16, i1 false)
  br label %3659

3659:                                             ; preds = %3656, %3651
  %3660 = add nuw nsw i64 %.01, 457
  %3661 = call zeroext i8 @randombit()
  %3662 = getelementptr inbounds i8, i8* %1, i64 %3660
  store i8 %3661, i8* %3662, align 1
  %3663 = icmp eq i8 %3661, 0
  br i1 %3663, label %3664, label %3667

3664:                                             ; preds = %3659
  %3665 = shl nuw nsw i64 %3660, 4
  %3666 = getelementptr inbounds i8, i8* %0, i64 %3665
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3666, i8 0, i64 16, i1 false)
  br label %3667

3667:                                             ; preds = %3664, %3659
  %3668 = add nuw nsw i64 %.01, 458
  %3669 = call zeroext i8 @randombit()
  %3670 = getelementptr inbounds i8, i8* %1, i64 %3668
  store i8 %3669, i8* %3670, align 1
  %3671 = icmp eq i8 %3669, 0
  br i1 %3671, label %3672, label %3675

3672:                                             ; preds = %3667
  %3673 = shl nuw nsw i64 %3668, 4
  %3674 = getelementptr inbounds i8, i8* %0, i64 %3673
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3674, i8 0, i64 16, i1 false)
  br label %3675

3675:                                             ; preds = %3672, %3667
  %3676 = add nuw nsw i64 %.01, 459
  %3677 = call zeroext i8 @randombit()
  %3678 = getelementptr inbounds i8, i8* %1, i64 %3676
  store i8 %3677, i8* %3678, align 1
  %3679 = icmp eq i8 %3677, 0
  br i1 %3679, label %3680, label %3683

3680:                                             ; preds = %3675
  %3681 = shl nuw nsw i64 %3676, 4
  %3682 = getelementptr inbounds i8, i8* %0, i64 %3681
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3682, i8 0, i64 16, i1 false)
  br label %3683

3683:                                             ; preds = %3680, %3675
  %3684 = add nuw nsw i64 %.01, 460
  %3685 = call zeroext i8 @randombit()
  %3686 = getelementptr inbounds i8, i8* %1, i64 %3684
  store i8 %3685, i8* %3686, align 1
  %3687 = icmp eq i8 %3685, 0
  br i1 %3687, label %3688, label %3691

3688:                                             ; preds = %3683
  %3689 = shl nuw nsw i64 %3684, 4
  %3690 = getelementptr inbounds i8, i8* %0, i64 %3689
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3690, i8 0, i64 16, i1 false)
  br label %3691

3691:                                             ; preds = %3688, %3683
  %3692 = add nuw nsw i64 %.01, 461
  %3693 = call zeroext i8 @randombit()
  %3694 = getelementptr inbounds i8, i8* %1, i64 %3692
  store i8 %3693, i8* %3694, align 1
  %3695 = icmp eq i8 %3693, 0
  br i1 %3695, label %3696, label %3699

3696:                                             ; preds = %3691
  %3697 = shl nuw nsw i64 %3692, 4
  %3698 = getelementptr inbounds i8, i8* %0, i64 %3697
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3698, i8 0, i64 16, i1 false)
  br label %3699

3699:                                             ; preds = %3696, %3691
  %3700 = add nuw nsw i64 %.01, 462
  %3701 = call zeroext i8 @randombit()
  %3702 = getelementptr inbounds i8, i8* %1, i64 %3700
  store i8 %3701, i8* %3702, align 1
  %3703 = icmp eq i8 %3701, 0
  br i1 %3703, label %3704, label %3707

3704:                                             ; preds = %3699
  %3705 = shl nuw nsw i64 %3700, 4
  %3706 = getelementptr inbounds i8, i8* %0, i64 %3705
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3706, i8 0, i64 16, i1 false)
  br label %3707

3707:                                             ; preds = %3704, %3699
  %3708 = add nuw nsw i64 %.01, 463
  %3709 = call zeroext i8 @randombit()
  %3710 = getelementptr inbounds i8, i8* %1, i64 %3708
  store i8 %3709, i8* %3710, align 1
  %3711 = icmp eq i8 %3709, 0
  br i1 %3711, label %3712, label %3715

3712:                                             ; preds = %3707
  %3713 = shl nuw nsw i64 %3708, 4
  %3714 = getelementptr inbounds i8, i8* %0, i64 %3713
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3714, i8 0, i64 16, i1 false)
  br label %3715

3715:                                             ; preds = %3712, %3707
  %3716 = add nuw nsw i64 %.01, 464
  %3717 = call zeroext i8 @randombit()
  %3718 = getelementptr inbounds i8, i8* %1, i64 %3716
  store i8 %3717, i8* %3718, align 1
  %3719 = icmp eq i8 %3717, 0
  br i1 %3719, label %3720, label %3723

3720:                                             ; preds = %3715
  %3721 = shl nuw nsw i64 %3716, 4
  %3722 = getelementptr inbounds i8, i8* %0, i64 %3721
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3722, i8 0, i64 16, i1 false)
  br label %3723

3723:                                             ; preds = %3720, %3715
  %3724 = add nuw nsw i64 %.01, 465
  %3725 = call zeroext i8 @randombit()
  %3726 = getelementptr inbounds i8, i8* %1, i64 %3724
  store i8 %3725, i8* %3726, align 1
  %3727 = icmp eq i8 %3725, 0
  br i1 %3727, label %3728, label %3731

3728:                                             ; preds = %3723
  %3729 = shl nuw nsw i64 %3724, 4
  %3730 = getelementptr inbounds i8, i8* %0, i64 %3729
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3730, i8 0, i64 16, i1 false)
  br label %3731

3731:                                             ; preds = %3728, %3723
  %3732 = add nuw nsw i64 %.01, 466
  %3733 = call zeroext i8 @randombit()
  %3734 = getelementptr inbounds i8, i8* %1, i64 %3732
  store i8 %3733, i8* %3734, align 1
  %3735 = icmp eq i8 %3733, 0
  br i1 %3735, label %3736, label %3739

3736:                                             ; preds = %3731
  %3737 = shl nuw nsw i64 %3732, 4
  %3738 = getelementptr inbounds i8, i8* %0, i64 %3737
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3738, i8 0, i64 16, i1 false)
  br label %3739

3739:                                             ; preds = %3736, %3731
  %3740 = add nuw nsw i64 %.01, 467
  %3741 = call zeroext i8 @randombit()
  %3742 = getelementptr inbounds i8, i8* %1, i64 %3740
  store i8 %3741, i8* %3742, align 1
  %3743 = icmp eq i8 %3741, 0
  br i1 %3743, label %3744, label %3747

3744:                                             ; preds = %3739
  %3745 = shl nuw nsw i64 %3740, 4
  %3746 = getelementptr inbounds i8, i8* %0, i64 %3745
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3746, i8 0, i64 16, i1 false)
  br label %3747

3747:                                             ; preds = %3744, %3739
  %3748 = add nuw nsw i64 %.01, 468
  %3749 = call zeroext i8 @randombit()
  %3750 = getelementptr inbounds i8, i8* %1, i64 %3748
  store i8 %3749, i8* %3750, align 1
  %3751 = icmp eq i8 %3749, 0
  br i1 %3751, label %3752, label %3755

3752:                                             ; preds = %3747
  %3753 = shl nuw nsw i64 %3748, 4
  %3754 = getelementptr inbounds i8, i8* %0, i64 %3753
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3754, i8 0, i64 16, i1 false)
  br label %3755

3755:                                             ; preds = %3752, %3747
  %3756 = add nuw nsw i64 %.01, 469
  %3757 = call zeroext i8 @randombit()
  %3758 = getelementptr inbounds i8, i8* %1, i64 %3756
  store i8 %3757, i8* %3758, align 1
  %3759 = icmp eq i8 %3757, 0
  br i1 %3759, label %3760, label %3763

3760:                                             ; preds = %3755
  %3761 = shl nuw nsw i64 %3756, 4
  %3762 = getelementptr inbounds i8, i8* %0, i64 %3761
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3762, i8 0, i64 16, i1 false)
  br label %3763

3763:                                             ; preds = %3760, %3755
  %3764 = add nuw nsw i64 %.01, 470
  %3765 = call zeroext i8 @randombit()
  %3766 = getelementptr inbounds i8, i8* %1, i64 %3764
  store i8 %3765, i8* %3766, align 1
  %3767 = icmp eq i8 %3765, 0
  br i1 %3767, label %3768, label %3771

3768:                                             ; preds = %3763
  %3769 = shl nuw nsw i64 %3764, 4
  %3770 = getelementptr inbounds i8, i8* %0, i64 %3769
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3770, i8 0, i64 16, i1 false)
  br label %3771

3771:                                             ; preds = %3768, %3763
  %3772 = add nuw nsw i64 %.01, 471
  %3773 = call zeroext i8 @randombit()
  %3774 = getelementptr inbounds i8, i8* %1, i64 %3772
  store i8 %3773, i8* %3774, align 1
  %3775 = icmp eq i8 %3773, 0
  br i1 %3775, label %3776, label %3779

3776:                                             ; preds = %3771
  %3777 = shl nuw nsw i64 %3772, 4
  %3778 = getelementptr inbounds i8, i8* %0, i64 %3777
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3778, i8 0, i64 16, i1 false)
  br label %3779

3779:                                             ; preds = %3776, %3771
  %3780 = add nuw nsw i64 %.01, 472
  %3781 = call zeroext i8 @randombit()
  %3782 = getelementptr inbounds i8, i8* %1, i64 %3780
  store i8 %3781, i8* %3782, align 1
  %3783 = icmp eq i8 %3781, 0
  br i1 %3783, label %3784, label %3787

3784:                                             ; preds = %3779
  %3785 = shl nuw nsw i64 %3780, 4
  %3786 = getelementptr inbounds i8, i8* %0, i64 %3785
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3786, i8 0, i64 16, i1 false)
  br label %3787

3787:                                             ; preds = %3784, %3779
  %3788 = add nuw nsw i64 %.01, 473
  %3789 = call zeroext i8 @randombit()
  %3790 = getelementptr inbounds i8, i8* %1, i64 %3788
  store i8 %3789, i8* %3790, align 1
  %3791 = icmp eq i8 %3789, 0
  br i1 %3791, label %3792, label %3795

3792:                                             ; preds = %3787
  %3793 = shl nuw nsw i64 %3788, 4
  %3794 = getelementptr inbounds i8, i8* %0, i64 %3793
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3794, i8 0, i64 16, i1 false)
  br label %3795

3795:                                             ; preds = %3792, %3787
  %3796 = add nuw nsw i64 %.01, 474
  %3797 = call zeroext i8 @randombit()
  %3798 = getelementptr inbounds i8, i8* %1, i64 %3796
  store i8 %3797, i8* %3798, align 1
  %3799 = icmp eq i8 %3797, 0
  br i1 %3799, label %3800, label %3803

3800:                                             ; preds = %3795
  %3801 = shl nuw nsw i64 %3796, 4
  %3802 = getelementptr inbounds i8, i8* %0, i64 %3801
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3802, i8 0, i64 16, i1 false)
  br label %3803

3803:                                             ; preds = %3800, %3795
  %3804 = add nuw nsw i64 %.01, 475
  %3805 = call zeroext i8 @randombit()
  %3806 = getelementptr inbounds i8, i8* %1, i64 %3804
  store i8 %3805, i8* %3806, align 1
  %3807 = icmp eq i8 %3805, 0
  br i1 %3807, label %3808, label %3811

3808:                                             ; preds = %3803
  %3809 = shl nuw nsw i64 %3804, 4
  %3810 = getelementptr inbounds i8, i8* %0, i64 %3809
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3810, i8 0, i64 16, i1 false)
  br label %3811

3811:                                             ; preds = %3808, %3803
  %3812 = add nuw nsw i64 %.01, 476
  %3813 = call zeroext i8 @randombit()
  %3814 = getelementptr inbounds i8, i8* %1, i64 %3812
  store i8 %3813, i8* %3814, align 1
  %3815 = icmp eq i8 %3813, 0
  br i1 %3815, label %3816, label %3819

3816:                                             ; preds = %3811
  %3817 = shl nuw nsw i64 %3812, 4
  %3818 = getelementptr inbounds i8, i8* %0, i64 %3817
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3818, i8 0, i64 16, i1 false)
  br label %3819

3819:                                             ; preds = %3816, %3811
  %3820 = add nuw nsw i64 %.01, 477
  %3821 = call zeroext i8 @randombit()
  %3822 = getelementptr inbounds i8, i8* %1, i64 %3820
  store i8 %3821, i8* %3822, align 1
  %3823 = icmp eq i8 %3821, 0
  br i1 %3823, label %3824, label %3827

3824:                                             ; preds = %3819
  %3825 = shl nuw nsw i64 %3820, 4
  %3826 = getelementptr inbounds i8, i8* %0, i64 %3825
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3826, i8 0, i64 16, i1 false)
  br label %3827

3827:                                             ; preds = %3824, %3819
  %3828 = add nuw nsw i64 %.01, 478
  %3829 = call zeroext i8 @randombit()
  %3830 = getelementptr inbounds i8, i8* %1, i64 %3828
  store i8 %3829, i8* %3830, align 1
  %3831 = icmp eq i8 %3829, 0
  br i1 %3831, label %3832, label %3835

3832:                                             ; preds = %3827
  %3833 = shl nuw nsw i64 %3828, 4
  %3834 = getelementptr inbounds i8, i8* %0, i64 %3833
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3834, i8 0, i64 16, i1 false)
  br label %3835

3835:                                             ; preds = %3832, %3827
  %3836 = add nuw nsw i64 %.01, 479
  %3837 = call zeroext i8 @randombit()
  %3838 = getelementptr inbounds i8, i8* %1, i64 %3836
  store i8 %3837, i8* %3838, align 1
  %3839 = icmp eq i8 %3837, 0
  br i1 %3839, label %3840, label %3843

3840:                                             ; preds = %3835
  %3841 = shl nuw nsw i64 %3836, 4
  %3842 = getelementptr inbounds i8, i8* %0, i64 %3841
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3842, i8 0, i64 16, i1 false)
  br label %3843

3843:                                             ; preds = %3840, %3835
  %3844 = add nuw nsw i64 %.01, 480
  %3845 = call zeroext i8 @randombit()
  %3846 = getelementptr inbounds i8, i8* %1, i64 %3844
  store i8 %3845, i8* %3846, align 1
  %3847 = icmp eq i8 %3845, 0
  br i1 %3847, label %3848, label %3851

3848:                                             ; preds = %3843
  %3849 = shl nuw nsw i64 %3844, 4
  %3850 = getelementptr inbounds i8, i8* %0, i64 %3849
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3850, i8 0, i64 16, i1 false)
  br label %3851

3851:                                             ; preds = %3848, %3843
  %3852 = add nuw nsw i64 %.01, 481
  %3853 = call zeroext i8 @randombit()
  %3854 = getelementptr inbounds i8, i8* %1, i64 %3852
  store i8 %3853, i8* %3854, align 1
  %3855 = icmp eq i8 %3853, 0
  br i1 %3855, label %3856, label %3859

3856:                                             ; preds = %3851
  %3857 = shl nuw nsw i64 %3852, 4
  %3858 = getelementptr inbounds i8, i8* %0, i64 %3857
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3858, i8 0, i64 16, i1 false)
  br label %3859

3859:                                             ; preds = %3856, %3851
  %3860 = add nuw nsw i64 %.01, 482
  %3861 = call zeroext i8 @randombit()
  %3862 = getelementptr inbounds i8, i8* %1, i64 %3860
  store i8 %3861, i8* %3862, align 1
  %3863 = icmp eq i8 %3861, 0
  br i1 %3863, label %3864, label %3867

3864:                                             ; preds = %3859
  %3865 = shl nuw nsw i64 %3860, 4
  %3866 = getelementptr inbounds i8, i8* %0, i64 %3865
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3866, i8 0, i64 16, i1 false)
  br label %3867

3867:                                             ; preds = %3864, %3859
  %3868 = add nuw nsw i64 %.01, 483
  %3869 = call zeroext i8 @randombit()
  %3870 = getelementptr inbounds i8, i8* %1, i64 %3868
  store i8 %3869, i8* %3870, align 1
  %3871 = icmp eq i8 %3869, 0
  br i1 %3871, label %3872, label %3875

3872:                                             ; preds = %3867
  %3873 = shl nuw nsw i64 %3868, 4
  %3874 = getelementptr inbounds i8, i8* %0, i64 %3873
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3874, i8 0, i64 16, i1 false)
  br label %3875

3875:                                             ; preds = %3872, %3867
  %3876 = add nuw nsw i64 %.01, 484
  %3877 = call zeroext i8 @randombit()
  %3878 = getelementptr inbounds i8, i8* %1, i64 %3876
  store i8 %3877, i8* %3878, align 1
  %3879 = icmp eq i8 %3877, 0
  br i1 %3879, label %3880, label %3883

3880:                                             ; preds = %3875
  %3881 = shl nuw nsw i64 %3876, 4
  %3882 = getelementptr inbounds i8, i8* %0, i64 %3881
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3882, i8 0, i64 16, i1 false)
  br label %3883

3883:                                             ; preds = %3880, %3875
  %3884 = add nuw nsw i64 %.01, 485
  %3885 = call zeroext i8 @randombit()
  %3886 = getelementptr inbounds i8, i8* %1, i64 %3884
  store i8 %3885, i8* %3886, align 1
  %3887 = icmp eq i8 %3885, 0
  br i1 %3887, label %3888, label %3891

3888:                                             ; preds = %3883
  %3889 = shl nuw nsw i64 %3884, 4
  %3890 = getelementptr inbounds i8, i8* %0, i64 %3889
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3890, i8 0, i64 16, i1 false)
  br label %3891

3891:                                             ; preds = %3888, %3883
  %3892 = add nuw nsw i64 %.01, 486
  %3893 = call zeroext i8 @randombit()
  %3894 = getelementptr inbounds i8, i8* %1, i64 %3892
  store i8 %3893, i8* %3894, align 1
  %3895 = icmp eq i8 %3893, 0
  br i1 %3895, label %3896, label %3899

3896:                                             ; preds = %3891
  %3897 = shl nuw nsw i64 %3892, 4
  %3898 = getelementptr inbounds i8, i8* %0, i64 %3897
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3898, i8 0, i64 16, i1 false)
  br label %3899

3899:                                             ; preds = %3896, %3891
  %3900 = add nuw nsw i64 %.01, 487
  %3901 = call zeroext i8 @randombit()
  %3902 = getelementptr inbounds i8, i8* %1, i64 %3900
  store i8 %3901, i8* %3902, align 1
  %3903 = icmp eq i8 %3901, 0
  br i1 %3903, label %3904, label %3907

3904:                                             ; preds = %3899
  %3905 = shl nuw nsw i64 %3900, 4
  %3906 = getelementptr inbounds i8, i8* %0, i64 %3905
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3906, i8 0, i64 16, i1 false)
  br label %3907

3907:                                             ; preds = %3904, %3899
  %3908 = add nuw nsw i64 %.01, 488
  %3909 = call zeroext i8 @randombit()
  %3910 = getelementptr inbounds i8, i8* %1, i64 %3908
  store i8 %3909, i8* %3910, align 1
  %3911 = icmp eq i8 %3909, 0
  br i1 %3911, label %3912, label %3915

3912:                                             ; preds = %3907
  %3913 = shl nuw nsw i64 %3908, 4
  %3914 = getelementptr inbounds i8, i8* %0, i64 %3913
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3914, i8 0, i64 16, i1 false)
  br label %3915

3915:                                             ; preds = %3912, %3907
  %3916 = add nuw nsw i64 %.01, 489
  %3917 = call zeroext i8 @randombit()
  %3918 = getelementptr inbounds i8, i8* %1, i64 %3916
  store i8 %3917, i8* %3918, align 1
  %3919 = icmp eq i8 %3917, 0
  br i1 %3919, label %3920, label %3923

3920:                                             ; preds = %3915
  %3921 = shl nuw nsw i64 %3916, 4
  %3922 = getelementptr inbounds i8, i8* %0, i64 %3921
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3922, i8 0, i64 16, i1 false)
  br label %3923

3923:                                             ; preds = %3920, %3915
  %3924 = add nuw nsw i64 %.01, 490
  %3925 = call zeroext i8 @randombit()
  %3926 = getelementptr inbounds i8, i8* %1, i64 %3924
  store i8 %3925, i8* %3926, align 1
  %3927 = icmp eq i8 %3925, 0
  br i1 %3927, label %3928, label %3931

3928:                                             ; preds = %3923
  %3929 = shl nuw nsw i64 %3924, 4
  %3930 = getelementptr inbounds i8, i8* %0, i64 %3929
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3930, i8 0, i64 16, i1 false)
  br label %3931

3931:                                             ; preds = %3928, %3923
  %3932 = add nuw nsw i64 %.01, 491
  %3933 = call zeroext i8 @randombit()
  %3934 = getelementptr inbounds i8, i8* %1, i64 %3932
  store i8 %3933, i8* %3934, align 1
  %3935 = icmp eq i8 %3933, 0
  br i1 %3935, label %3936, label %3939

3936:                                             ; preds = %3931
  %3937 = shl nuw nsw i64 %3932, 4
  %3938 = getelementptr inbounds i8, i8* %0, i64 %3937
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3938, i8 0, i64 16, i1 false)
  br label %3939

3939:                                             ; preds = %3936, %3931
  %3940 = add nuw nsw i64 %.01, 492
  %3941 = call zeroext i8 @randombit()
  %3942 = getelementptr inbounds i8, i8* %1, i64 %3940
  store i8 %3941, i8* %3942, align 1
  %3943 = icmp eq i8 %3941, 0
  br i1 %3943, label %3944, label %3947

3944:                                             ; preds = %3939
  %3945 = shl nuw nsw i64 %3940, 4
  %3946 = getelementptr inbounds i8, i8* %0, i64 %3945
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3946, i8 0, i64 16, i1 false)
  br label %3947

3947:                                             ; preds = %3944, %3939
  %3948 = add nuw nsw i64 %.01, 493
  %3949 = call zeroext i8 @randombit()
  %3950 = getelementptr inbounds i8, i8* %1, i64 %3948
  store i8 %3949, i8* %3950, align 1
  %3951 = icmp eq i8 %3949, 0
  br i1 %3951, label %3952, label %3955

3952:                                             ; preds = %3947
  %3953 = shl nuw nsw i64 %3948, 4
  %3954 = getelementptr inbounds i8, i8* %0, i64 %3953
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3954, i8 0, i64 16, i1 false)
  br label %3955

3955:                                             ; preds = %3952, %3947
  %3956 = add nuw nsw i64 %.01, 494
  %3957 = call zeroext i8 @randombit()
  %3958 = getelementptr inbounds i8, i8* %1, i64 %3956
  store i8 %3957, i8* %3958, align 1
  %3959 = icmp eq i8 %3957, 0
  br i1 %3959, label %3960, label %3963

3960:                                             ; preds = %3955
  %3961 = shl nuw nsw i64 %3956, 4
  %3962 = getelementptr inbounds i8, i8* %0, i64 %3961
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3962, i8 0, i64 16, i1 false)
  br label %3963

3963:                                             ; preds = %3960, %3955
  %3964 = add nuw nsw i64 %.01, 495
  %3965 = call zeroext i8 @randombit()
  %3966 = getelementptr inbounds i8, i8* %1, i64 %3964
  store i8 %3965, i8* %3966, align 1
  %3967 = icmp eq i8 %3965, 0
  br i1 %3967, label %3968, label %3971

3968:                                             ; preds = %3963
  %3969 = shl nuw nsw i64 %3964, 4
  %3970 = getelementptr inbounds i8, i8* %0, i64 %3969
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3970, i8 0, i64 16, i1 false)
  br label %3971

3971:                                             ; preds = %3968, %3963
  %3972 = add nuw nsw i64 %.01, 496
  %3973 = call zeroext i8 @randombit()
  %3974 = getelementptr inbounds i8, i8* %1, i64 %3972
  store i8 %3973, i8* %3974, align 1
  %3975 = icmp eq i8 %3973, 0
  br i1 %3975, label %3976, label %3979

3976:                                             ; preds = %3971
  %3977 = shl nuw nsw i64 %3972, 4
  %3978 = getelementptr inbounds i8, i8* %0, i64 %3977
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3978, i8 0, i64 16, i1 false)
  br label %3979

3979:                                             ; preds = %3976, %3971
  %3980 = add nuw nsw i64 %.01, 497
  %3981 = call zeroext i8 @randombit()
  %3982 = getelementptr inbounds i8, i8* %1, i64 %3980
  store i8 %3981, i8* %3982, align 1
  %3983 = icmp eq i8 %3981, 0
  br i1 %3983, label %3984, label %3987

3984:                                             ; preds = %3979
  %3985 = shl nuw nsw i64 %3980, 4
  %3986 = getelementptr inbounds i8, i8* %0, i64 %3985
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3986, i8 0, i64 16, i1 false)
  br label %3987

3987:                                             ; preds = %3984, %3979
  %3988 = add nuw nsw i64 %.01, 498
  %3989 = call zeroext i8 @randombit()
  %3990 = getelementptr inbounds i8, i8* %1, i64 %3988
  store i8 %3989, i8* %3990, align 1
  %3991 = icmp eq i8 %3989, 0
  br i1 %3991, label %3992, label %3995

3992:                                             ; preds = %3987
  %3993 = shl nuw nsw i64 %3988, 4
  %3994 = getelementptr inbounds i8, i8* %0, i64 %3993
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %3994, i8 0, i64 16, i1 false)
  br label %3995

3995:                                             ; preds = %3992, %3987
  %3996 = add nuw nsw i64 %.01, 499
  %3997 = call zeroext i8 @randombit()
  %3998 = getelementptr inbounds i8, i8* %1, i64 %3996
  store i8 %3997, i8* %3998, align 1
  %3999 = icmp eq i8 %3997, 0
  br i1 %3999, label %4000, label %4003

4000:                                             ; preds = %3995
  %4001 = shl nuw nsw i64 %3996, 4
  %4002 = getelementptr inbounds i8, i8* %0, i64 %4001
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4002, i8 0, i64 16, i1 false)
  br label %4003

4003:                                             ; preds = %4000, %3995
  %4004 = add nuw nsw i64 %.01, 500
  %4005 = call zeroext i8 @randombit()
  %4006 = getelementptr inbounds i8, i8* %1, i64 %4004
  store i8 %4005, i8* %4006, align 1
  %4007 = icmp eq i8 %4005, 0
  br i1 %4007, label %4008, label %4011

4008:                                             ; preds = %4003
  %4009 = shl nuw nsw i64 %4004, 4
  %4010 = getelementptr inbounds i8, i8* %0, i64 %4009
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4010, i8 0, i64 16, i1 false)
  br label %4011

4011:                                             ; preds = %4008, %4003
  %4012 = add nuw nsw i64 %.01, 501
  %4013 = call zeroext i8 @randombit()
  %4014 = getelementptr inbounds i8, i8* %1, i64 %4012
  store i8 %4013, i8* %4014, align 1
  %4015 = icmp eq i8 %4013, 0
  br i1 %4015, label %4016, label %4019

4016:                                             ; preds = %4011
  %4017 = shl nuw nsw i64 %4012, 4
  %4018 = getelementptr inbounds i8, i8* %0, i64 %4017
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4018, i8 0, i64 16, i1 false)
  br label %4019

4019:                                             ; preds = %4016, %4011
  %4020 = add nuw nsw i64 %.01, 502
  %4021 = call zeroext i8 @randombit()
  %4022 = getelementptr inbounds i8, i8* %1, i64 %4020
  store i8 %4021, i8* %4022, align 1
  %4023 = icmp eq i8 %4021, 0
  br i1 %4023, label %4024, label %4027

4024:                                             ; preds = %4019
  %4025 = shl nuw nsw i64 %4020, 4
  %4026 = getelementptr inbounds i8, i8* %0, i64 %4025
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4026, i8 0, i64 16, i1 false)
  br label %4027

4027:                                             ; preds = %4024, %4019
  %4028 = add nuw nsw i64 %.01, 503
  %4029 = call zeroext i8 @randombit()
  %4030 = getelementptr inbounds i8, i8* %1, i64 %4028
  store i8 %4029, i8* %4030, align 1
  %4031 = icmp eq i8 %4029, 0
  br i1 %4031, label %4032, label %4035

4032:                                             ; preds = %4027
  %4033 = shl nuw nsw i64 %4028, 4
  %4034 = getelementptr inbounds i8, i8* %0, i64 %4033
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4034, i8 0, i64 16, i1 false)
  br label %4035

4035:                                             ; preds = %4032, %4027
  %4036 = add nuw nsw i64 %.01, 504
  %4037 = call zeroext i8 @randombit()
  %4038 = getelementptr inbounds i8, i8* %1, i64 %4036
  store i8 %4037, i8* %4038, align 1
  %4039 = icmp eq i8 %4037, 0
  br i1 %4039, label %4040, label %4043

4040:                                             ; preds = %4035
  %4041 = shl nuw nsw i64 %4036, 4
  %4042 = getelementptr inbounds i8, i8* %0, i64 %4041
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4042, i8 0, i64 16, i1 false)
  br label %4043

4043:                                             ; preds = %4040, %4035
  %4044 = add nuw nsw i64 %.01, 505
  %4045 = call zeroext i8 @randombit()
  %4046 = getelementptr inbounds i8, i8* %1, i64 %4044
  store i8 %4045, i8* %4046, align 1
  %4047 = icmp eq i8 %4045, 0
  br i1 %4047, label %4048, label %4051

4048:                                             ; preds = %4043
  %4049 = shl nuw nsw i64 %4044, 4
  %4050 = getelementptr inbounds i8, i8* %0, i64 %4049
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4050, i8 0, i64 16, i1 false)
  br label %4051

4051:                                             ; preds = %4048, %4043
  %4052 = add nuw nsw i64 %.01, 506
  %4053 = call zeroext i8 @randombit()
  %4054 = getelementptr inbounds i8, i8* %1, i64 %4052
  store i8 %4053, i8* %4054, align 1
  %4055 = icmp eq i8 %4053, 0
  br i1 %4055, label %4056, label %4059

4056:                                             ; preds = %4051
  %4057 = shl nuw nsw i64 %4052, 4
  %4058 = getelementptr inbounds i8, i8* %0, i64 %4057
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4058, i8 0, i64 16, i1 false)
  br label %4059

4059:                                             ; preds = %4056, %4051
  %4060 = add nuw nsw i64 %.01, 507
  %4061 = call zeroext i8 @randombit()
  %4062 = getelementptr inbounds i8, i8* %1, i64 %4060
  store i8 %4061, i8* %4062, align 1
  %4063 = icmp eq i8 %4061, 0
  br i1 %4063, label %4064, label %4067

4064:                                             ; preds = %4059
  %4065 = shl nuw nsw i64 %4060, 4
  %4066 = getelementptr inbounds i8, i8* %0, i64 %4065
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4066, i8 0, i64 16, i1 false)
  br label %4067

4067:                                             ; preds = %4064, %4059
  %4068 = add nuw nsw i64 %.01, 508
  %4069 = call zeroext i8 @randombit()
  %4070 = getelementptr inbounds i8, i8* %1, i64 %4068
  store i8 %4069, i8* %4070, align 1
  %4071 = icmp eq i8 %4069, 0
  br i1 %4071, label %4072, label %4075

4072:                                             ; preds = %4067
  %4073 = shl nuw nsw i64 %4068, 4
  %4074 = getelementptr inbounds i8, i8* %0, i64 %4073
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4074, i8 0, i64 16, i1 false)
  br label %4075

4075:                                             ; preds = %4072, %4067
  %4076 = add nuw nsw i64 %.01, 509
  %4077 = call zeroext i8 @randombit()
  %4078 = getelementptr inbounds i8, i8* %1, i64 %4076
  store i8 %4077, i8* %4078, align 1
  %4079 = icmp eq i8 %4077, 0
  br i1 %4079, label %4080, label %4083

4080:                                             ; preds = %4075
  %4081 = shl nuw nsw i64 %4076, 4
  %4082 = getelementptr inbounds i8, i8* %0, i64 %4081
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4082, i8 0, i64 16, i1 false)
  br label %4083

4083:                                             ; preds = %4080, %4075
  %4084 = add nuw nsw i64 %.01, 510
  %4085 = call zeroext i8 @randombit()
  %4086 = getelementptr inbounds i8, i8* %1, i64 %4084
  store i8 %4085, i8* %4086, align 1
  %4087 = icmp eq i8 %4085, 0
  br i1 %4087, label %4088, label %4091

4088:                                             ; preds = %4083
  %4089 = shl nuw nsw i64 %4084, 4
  %4090 = getelementptr inbounds i8, i8* %0, i64 %4089
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4090, i8 0, i64 16, i1 false)
  br label %4091

4091:                                             ; preds = %4088, %4083
  %4092 = add nuw nsw i64 %.01, 511
  %4093 = call zeroext i8 @randombit()
  %4094 = getelementptr inbounds i8, i8* %1, i64 %4092
  store i8 %4093, i8* %4094, align 1
  %4095 = icmp eq i8 %4093, 0
  br i1 %4095, label %4096, label %4099

4096:                                             ; preds = %4091
  %4097 = shl nuw nsw i64 %4092, 4
  %4098 = getelementptr inbounds i8, i8* %0, i64 %4097
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4098, i8 0, i64 16, i1 false)
  br label %4099

4099:                                             ; preds = %4096, %4091
  %4100 = add nuw nsw i64 %.01, 512
  %4101 = call zeroext i8 @randombit()
  %4102 = getelementptr inbounds i8, i8* %1, i64 %4100
  store i8 %4101, i8* %4102, align 1
  %4103 = icmp eq i8 %4101, 0
  br i1 %4103, label %4104, label %4107

4104:                                             ; preds = %4099
  %4105 = shl nuw nsw i64 %4100, 4
  %4106 = getelementptr inbounds i8, i8* %0, i64 %4105
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4106, i8 0, i64 16, i1 false)
  br label %4107

4107:                                             ; preds = %4104, %4099
  %4108 = add nuw nsw i64 %.01, 513
  %4109 = call zeroext i8 @randombit()
  %4110 = getelementptr inbounds i8, i8* %1, i64 %4108
  store i8 %4109, i8* %4110, align 1
  %4111 = icmp eq i8 %4109, 0
  br i1 %4111, label %4112, label %4115

4112:                                             ; preds = %4107
  %4113 = shl nuw nsw i64 %4108, 4
  %4114 = getelementptr inbounds i8, i8* %0, i64 %4113
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4114, i8 0, i64 16, i1 false)
  br label %4115

4115:                                             ; preds = %4112, %4107
  %4116 = add nuw nsw i64 %.01, 514
  %4117 = call zeroext i8 @randombit()
  %4118 = getelementptr inbounds i8, i8* %1, i64 %4116
  store i8 %4117, i8* %4118, align 1
  %4119 = icmp eq i8 %4117, 0
  br i1 %4119, label %4120, label %4123

4120:                                             ; preds = %4115
  %4121 = shl nuw nsw i64 %4116, 4
  %4122 = getelementptr inbounds i8, i8* %0, i64 %4121
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4122, i8 0, i64 16, i1 false)
  br label %4123

4123:                                             ; preds = %4120, %4115
  %4124 = add nuw nsw i64 %.01, 515
  %4125 = call zeroext i8 @randombit()
  %4126 = getelementptr inbounds i8, i8* %1, i64 %4124
  store i8 %4125, i8* %4126, align 1
  %4127 = icmp eq i8 %4125, 0
  br i1 %4127, label %4128, label %4131

4128:                                             ; preds = %4123
  %4129 = shl nuw nsw i64 %4124, 4
  %4130 = getelementptr inbounds i8, i8* %0, i64 %4129
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4130, i8 0, i64 16, i1 false)
  br label %4131

4131:                                             ; preds = %4128, %4123
  %4132 = add nuw nsw i64 %.01, 516
  %4133 = call zeroext i8 @randombit()
  %4134 = getelementptr inbounds i8, i8* %1, i64 %4132
  store i8 %4133, i8* %4134, align 1
  %4135 = icmp eq i8 %4133, 0
  br i1 %4135, label %4136, label %4139

4136:                                             ; preds = %4131
  %4137 = shl nuw nsw i64 %4132, 4
  %4138 = getelementptr inbounds i8, i8* %0, i64 %4137
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4138, i8 0, i64 16, i1 false)
  br label %4139

4139:                                             ; preds = %4136, %4131
  %4140 = add nuw nsw i64 %.01, 517
  %4141 = call zeroext i8 @randombit()
  %4142 = getelementptr inbounds i8, i8* %1, i64 %4140
  store i8 %4141, i8* %4142, align 1
  %4143 = icmp eq i8 %4141, 0
  br i1 %4143, label %4144, label %4147

4144:                                             ; preds = %4139
  %4145 = shl nuw nsw i64 %4140, 4
  %4146 = getelementptr inbounds i8, i8* %0, i64 %4145
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4146, i8 0, i64 16, i1 false)
  br label %4147

4147:                                             ; preds = %4144, %4139
  %4148 = add nuw nsw i64 %.01, 518
  %4149 = call zeroext i8 @randombit()
  %4150 = getelementptr inbounds i8, i8* %1, i64 %4148
  store i8 %4149, i8* %4150, align 1
  %4151 = icmp eq i8 %4149, 0
  br i1 %4151, label %4152, label %4155

4152:                                             ; preds = %4147
  %4153 = shl nuw nsw i64 %4148, 4
  %4154 = getelementptr inbounds i8, i8* %0, i64 %4153
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4154, i8 0, i64 16, i1 false)
  br label %4155

4155:                                             ; preds = %4152, %4147
  %4156 = add nuw nsw i64 %.01, 519
  %4157 = call zeroext i8 @randombit()
  %4158 = getelementptr inbounds i8, i8* %1, i64 %4156
  store i8 %4157, i8* %4158, align 1
  %4159 = icmp eq i8 %4157, 0
  br i1 %4159, label %4160, label %4163

4160:                                             ; preds = %4155
  %4161 = shl nuw nsw i64 %4156, 4
  %4162 = getelementptr inbounds i8, i8* %0, i64 %4161
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4162, i8 0, i64 16, i1 false)
  br label %4163

4163:                                             ; preds = %4160, %4155
  %4164 = add nuw nsw i64 %.01, 520
  %4165 = call zeroext i8 @randombit()
  %4166 = getelementptr inbounds i8, i8* %1, i64 %4164
  store i8 %4165, i8* %4166, align 1
  %4167 = icmp eq i8 %4165, 0
  br i1 %4167, label %4168, label %4171

4168:                                             ; preds = %4163
  %4169 = shl nuw nsw i64 %4164, 4
  %4170 = getelementptr inbounds i8, i8* %0, i64 %4169
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4170, i8 0, i64 16, i1 false)
  br label %4171

4171:                                             ; preds = %4168, %4163
  %4172 = add nuw nsw i64 %.01, 521
  %4173 = call zeroext i8 @randombit()
  %4174 = getelementptr inbounds i8, i8* %1, i64 %4172
  store i8 %4173, i8* %4174, align 1
  %4175 = icmp eq i8 %4173, 0
  br i1 %4175, label %4176, label %4179

4176:                                             ; preds = %4171
  %4177 = shl nuw nsw i64 %4172, 4
  %4178 = getelementptr inbounds i8, i8* %0, i64 %4177
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4178, i8 0, i64 16, i1 false)
  br label %4179

4179:                                             ; preds = %4176, %4171
  %4180 = add nuw nsw i64 %.01, 522
  %4181 = call zeroext i8 @randombit()
  %4182 = getelementptr inbounds i8, i8* %1, i64 %4180
  store i8 %4181, i8* %4182, align 1
  %4183 = icmp eq i8 %4181, 0
  br i1 %4183, label %4184, label %4187

4184:                                             ; preds = %4179
  %4185 = shl nuw nsw i64 %4180, 4
  %4186 = getelementptr inbounds i8, i8* %0, i64 %4185
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4186, i8 0, i64 16, i1 false)
  br label %4187

4187:                                             ; preds = %4184, %4179
  %4188 = add nuw nsw i64 %.01, 523
  %4189 = call zeroext i8 @randombit()
  %4190 = getelementptr inbounds i8, i8* %1, i64 %4188
  store i8 %4189, i8* %4190, align 1
  %4191 = icmp eq i8 %4189, 0
  br i1 %4191, label %4192, label %4195

4192:                                             ; preds = %4187
  %4193 = shl nuw nsw i64 %4188, 4
  %4194 = getelementptr inbounds i8, i8* %0, i64 %4193
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4194, i8 0, i64 16, i1 false)
  br label %4195

4195:                                             ; preds = %4192, %4187
  %4196 = add nuw nsw i64 %.01, 524
  %4197 = call zeroext i8 @randombit()
  %4198 = getelementptr inbounds i8, i8* %1, i64 %4196
  store i8 %4197, i8* %4198, align 1
  %4199 = icmp eq i8 %4197, 0
  br i1 %4199, label %4200, label %4203

4200:                                             ; preds = %4195
  %4201 = shl nuw nsw i64 %4196, 4
  %4202 = getelementptr inbounds i8, i8* %0, i64 %4201
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4202, i8 0, i64 16, i1 false)
  br label %4203

4203:                                             ; preds = %4200, %4195
  %4204 = add nuw nsw i64 %.01, 525
  %4205 = call zeroext i8 @randombit()
  %4206 = getelementptr inbounds i8, i8* %1, i64 %4204
  store i8 %4205, i8* %4206, align 1
  %4207 = icmp eq i8 %4205, 0
  br i1 %4207, label %4208, label %4211

4208:                                             ; preds = %4203
  %4209 = shl nuw nsw i64 %4204, 4
  %4210 = getelementptr inbounds i8, i8* %0, i64 %4209
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4210, i8 0, i64 16, i1 false)
  br label %4211

4211:                                             ; preds = %4208, %4203
  %4212 = add nuw nsw i64 %.01, 526
  %4213 = call zeroext i8 @randombit()
  %4214 = getelementptr inbounds i8, i8* %1, i64 %4212
  store i8 %4213, i8* %4214, align 1
  %4215 = icmp eq i8 %4213, 0
  br i1 %4215, label %4216, label %4219

4216:                                             ; preds = %4211
  %4217 = shl nuw nsw i64 %4212, 4
  %4218 = getelementptr inbounds i8, i8* %0, i64 %4217
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4218, i8 0, i64 16, i1 false)
  br label %4219

4219:                                             ; preds = %4216, %4211
  %4220 = add nuw nsw i64 %.01, 527
  %4221 = call zeroext i8 @randombit()
  %4222 = getelementptr inbounds i8, i8* %1, i64 %4220
  store i8 %4221, i8* %4222, align 1
  %4223 = icmp eq i8 %4221, 0
  br i1 %4223, label %4224, label %4227

4224:                                             ; preds = %4219
  %4225 = shl nuw nsw i64 %4220, 4
  %4226 = getelementptr inbounds i8, i8* %0, i64 %4225
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4226, i8 0, i64 16, i1 false)
  br label %4227

4227:                                             ; preds = %4224, %4219
  %4228 = add nuw nsw i64 %.01, 528
  %4229 = call zeroext i8 @randombit()
  %4230 = getelementptr inbounds i8, i8* %1, i64 %4228
  store i8 %4229, i8* %4230, align 1
  %4231 = icmp eq i8 %4229, 0
  br i1 %4231, label %4232, label %4235

4232:                                             ; preds = %4227
  %4233 = shl nuw nsw i64 %4228, 4
  %4234 = getelementptr inbounds i8, i8* %0, i64 %4233
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4234, i8 0, i64 16, i1 false)
  br label %4235

4235:                                             ; preds = %4232, %4227
  %4236 = add nuw nsw i64 %.01, 529
  %4237 = call zeroext i8 @randombit()
  %4238 = getelementptr inbounds i8, i8* %1, i64 %4236
  store i8 %4237, i8* %4238, align 1
  %4239 = icmp eq i8 %4237, 0
  br i1 %4239, label %4240, label %4243

4240:                                             ; preds = %4235
  %4241 = shl nuw nsw i64 %4236, 4
  %4242 = getelementptr inbounds i8, i8* %0, i64 %4241
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4242, i8 0, i64 16, i1 false)
  br label %4243

4243:                                             ; preds = %4240, %4235
  %4244 = add nuw nsw i64 %.01, 530
  %4245 = call zeroext i8 @randombit()
  %4246 = getelementptr inbounds i8, i8* %1, i64 %4244
  store i8 %4245, i8* %4246, align 1
  %4247 = icmp eq i8 %4245, 0
  br i1 %4247, label %4248, label %4251

4248:                                             ; preds = %4243
  %4249 = shl nuw nsw i64 %4244, 4
  %4250 = getelementptr inbounds i8, i8* %0, i64 %4249
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4250, i8 0, i64 16, i1 false)
  br label %4251

4251:                                             ; preds = %4248, %4243
  %4252 = add nuw nsw i64 %.01, 531
  %4253 = call zeroext i8 @randombit()
  %4254 = getelementptr inbounds i8, i8* %1, i64 %4252
  store i8 %4253, i8* %4254, align 1
  %4255 = icmp eq i8 %4253, 0
  br i1 %4255, label %4256, label %4259

4256:                                             ; preds = %4251
  %4257 = shl nuw nsw i64 %4252, 4
  %4258 = getelementptr inbounds i8, i8* %0, i64 %4257
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4258, i8 0, i64 16, i1 false)
  br label %4259

4259:                                             ; preds = %4256, %4251
  %4260 = add nuw nsw i64 %.01, 532
  %4261 = call zeroext i8 @randombit()
  %4262 = getelementptr inbounds i8, i8* %1, i64 %4260
  store i8 %4261, i8* %4262, align 1
  %4263 = icmp eq i8 %4261, 0
  br i1 %4263, label %4264, label %4267

4264:                                             ; preds = %4259
  %4265 = shl nuw nsw i64 %4260, 4
  %4266 = getelementptr inbounds i8, i8* %0, i64 %4265
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4266, i8 0, i64 16, i1 false)
  br label %4267

4267:                                             ; preds = %4264, %4259
  %4268 = add nuw nsw i64 %.01, 533
  %4269 = call zeroext i8 @randombit()
  %4270 = getelementptr inbounds i8, i8* %1, i64 %4268
  store i8 %4269, i8* %4270, align 1
  %4271 = icmp eq i8 %4269, 0
  br i1 %4271, label %4272, label %4275

4272:                                             ; preds = %4267
  %4273 = shl nuw nsw i64 %4268, 4
  %4274 = getelementptr inbounds i8, i8* %0, i64 %4273
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4274, i8 0, i64 16, i1 false)
  br label %4275

4275:                                             ; preds = %4272, %4267
  %4276 = add nuw nsw i64 %.01, 534
  %4277 = call zeroext i8 @randombit()
  %4278 = getelementptr inbounds i8, i8* %1, i64 %4276
  store i8 %4277, i8* %4278, align 1
  %4279 = icmp eq i8 %4277, 0
  br i1 %4279, label %4280, label %4283

4280:                                             ; preds = %4275
  %4281 = shl nuw nsw i64 %4276, 4
  %4282 = getelementptr inbounds i8, i8* %0, i64 %4281
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4282, i8 0, i64 16, i1 false)
  br label %4283

4283:                                             ; preds = %4280, %4275
  %4284 = add nuw nsw i64 %.01, 535
  %4285 = call zeroext i8 @randombit()
  %4286 = getelementptr inbounds i8, i8* %1, i64 %4284
  store i8 %4285, i8* %4286, align 1
  %4287 = icmp eq i8 %4285, 0
  br i1 %4287, label %4288, label %4291

4288:                                             ; preds = %4283
  %4289 = shl nuw nsw i64 %4284, 4
  %4290 = getelementptr inbounds i8, i8* %0, i64 %4289
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4290, i8 0, i64 16, i1 false)
  br label %4291

4291:                                             ; preds = %4288, %4283
  %4292 = add nuw nsw i64 %.01, 536
  %4293 = call zeroext i8 @randombit()
  %4294 = getelementptr inbounds i8, i8* %1, i64 %4292
  store i8 %4293, i8* %4294, align 1
  %4295 = icmp eq i8 %4293, 0
  br i1 %4295, label %4296, label %4299

4296:                                             ; preds = %4291
  %4297 = shl nuw nsw i64 %4292, 4
  %4298 = getelementptr inbounds i8, i8* %0, i64 %4297
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4298, i8 0, i64 16, i1 false)
  br label %4299

4299:                                             ; preds = %4296, %4291
  %4300 = add nuw nsw i64 %.01, 537
  %4301 = call zeroext i8 @randombit()
  %4302 = getelementptr inbounds i8, i8* %1, i64 %4300
  store i8 %4301, i8* %4302, align 1
  %4303 = icmp eq i8 %4301, 0
  br i1 %4303, label %4304, label %4307

4304:                                             ; preds = %4299
  %4305 = shl nuw nsw i64 %4300, 4
  %4306 = getelementptr inbounds i8, i8* %0, i64 %4305
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4306, i8 0, i64 16, i1 false)
  br label %4307

4307:                                             ; preds = %4304, %4299
  %4308 = add nuw nsw i64 %.01, 538
  %4309 = call zeroext i8 @randombit()
  %4310 = getelementptr inbounds i8, i8* %1, i64 %4308
  store i8 %4309, i8* %4310, align 1
  %4311 = icmp eq i8 %4309, 0
  br i1 %4311, label %4312, label %4315

4312:                                             ; preds = %4307
  %4313 = shl nuw nsw i64 %4308, 4
  %4314 = getelementptr inbounds i8, i8* %0, i64 %4313
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4314, i8 0, i64 16, i1 false)
  br label %4315

4315:                                             ; preds = %4312, %4307
  %4316 = add nuw nsw i64 %.01, 539
  %4317 = call zeroext i8 @randombit()
  %4318 = getelementptr inbounds i8, i8* %1, i64 %4316
  store i8 %4317, i8* %4318, align 1
  %4319 = icmp eq i8 %4317, 0
  br i1 %4319, label %4320, label %4323

4320:                                             ; preds = %4315
  %4321 = shl nuw nsw i64 %4316, 4
  %4322 = getelementptr inbounds i8, i8* %0, i64 %4321
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4322, i8 0, i64 16, i1 false)
  br label %4323

4323:                                             ; preds = %4320, %4315
  %4324 = add nuw nsw i64 %.01, 540
  %4325 = call zeroext i8 @randombit()
  %4326 = getelementptr inbounds i8, i8* %1, i64 %4324
  store i8 %4325, i8* %4326, align 1
  %4327 = icmp eq i8 %4325, 0
  br i1 %4327, label %4328, label %4331

4328:                                             ; preds = %4323
  %4329 = shl nuw nsw i64 %4324, 4
  %4330 = getelementptr inbounds i8, i8* %0, i64 %4329
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4330, i8 0, i64 16, i1 false)
  br label %4331

4331:                                             ; preds = %4328, %4323
  %4332 = add nuw nsw i64 %.01, 541
  %4333 = call zeroext i8 @randombit()
  %4334 = getelementptr inbounds i8, i8* %1, i64 %4332
  store i8 %4333, i8* %4334, align 1
  %4335 = icmp eq i8 %4333, 0
  br i1 %4335, label %4336, label %4339

4336:                                             ; preds = %4331
  %4337 = shl nuw nsw i64 %4332, 4
  %4338 = getelementptr inbounds i8, i8* %0, i64 %4337
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4338, i8 0, i64 16, i1 false)
  br label %4339

4339:                                             ; preds = %4336, %4331
  %4340 = add nuw nsw i64 %.01, 542
  %4341 = call zeroext i8 @randombit()
  %4342 = getelementptr inbounds i8, i8* %1, i64 %4340
  store i8 %4341, i8* %4342, align 1
  %4343 = icmp eq i8 %4341, 0
  br i1 %4343, label %4344, label %4347

4344:                                             ; preds = %4339
  %4345 = shl nuw nsw i64 %4340, 4
  %4346 = getelementptr inbounds i8, i8* %0, i64 %4345
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4346, i8 0, i64 16, i1 false)
  br label %4347

4347:                                             ; preds = %4344, %4339
  %4348 = add nuw nsw i64 %.01, 543
  %4349 = call zeroext i8 @randombit()
  %4350 = getelementptr inbounds i8, i8* %1, i64 %4348
  store i8 %4349, i8* %4350, align 1
  %4351 = icmp eq i8 %4349, 0
  br i1 %4351, label %4352, label %4355

4352:                                             ; preds = %4347
  %4353 = shl nuw nsw i64 %4348, 4
  %4354 = getelementptr inbounds i8, i8* %0, i64 %4353
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4354, i8 0, i64 16, i1 false)
  br label %4355

4355:                                             ; preds = %4352, %4347
  %4356 = add nuw nsw i64 %.01, 544
  %4357 = call zeroext i8 @randombit()
  %4358 = getelementptr inbounds i8, i8* %1, i64 %4356
  store i8 %4357, i8* %4358, align 1
  %4359 = icmp eq i8 %4357, 0
  br i1 %4359, label %4360, label %4363

4360:                                             ; preds = %4355
  %4361 = shl nuw nsw i64 %4356, 4
  %4362 = getelementptr inbounds i8, i8* %0, i64 %4361
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4362, i8 0, i64 16, i1 false)
  br label %4363

4363:                                             ; preds = %4360, %4355
  %4364 = add nuw nsw i64 %.01, 545
  %4365 = call zeroext i8 @randombit()
  %4366 = getelementptr inbounds i8, i8* %1, i64 %4364
  store i8 %4365, i8* %4366, align 1
  %4367 = icmp eq i8 %4365, 0
  br i1 %4367, label %4368, label %4371

4368:                                             ; preds = %4363
  %4369 = shl nuw nsw i64 %4364, 4
  %4370 = getelementptr inbounds i8, i8* %0, i64 %4369
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4370, i8 0, i64 16, i1 false)
  br label %4371

4371:                                             ; preds = %4368, %4363
  %4372 = add nuw nsw i64 %.01, 546
  %4373 = call zeroext i8 @randombit()
  %4374 = getelementptr inbounds i8, i8* %1, i64 %4372
  store i8 %4373, i8* %4374, align 1
  %4375 = icmp eq i8 %4373, 0
  br i1 %4375, label %4376, label %4379

4376:                                             ; preds = %4371
  %4377 = shl nuw nsw i64 %4372, 4
  %4378 = getelementptr inbounds i8, i8* %0, i64 %4377
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4378, i8 0, i64 16, i1 false)
  br label %4379

4379:                                             ; preds = %4376, %4371
  %4380 = add nuw nsw i64 %.01, 547
  %4381 = call zeroext i8 @randombit()
  %4382 = getelementptr inbounds i8, i8* %1, i64 %4380
  store i8 %4381, i8* %4382, align 1
  %4383 = icmp eq i8 %4381, 0
  br i1 %4383, label %4384, label %4387

4384:                                             ; preds = %4379
  %4385 = shl nuw nsw i64 %4380, 4
  %4386 = getelementptr inbounds i8, i8* %0, i64 %4385
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4386, i8 0, i64 16, i1 false)
  br label %4387

4387:                                             ; preds = %4384, %4379
  %4388 = add nuw nsw i64 %.01, 548
  %4389 = call zeroext i8 @randombit()
  %4390 = getelementptr inbounds i8, i8* %1, i64 %4388
  store i8 %4389, i8* %4390, align 1
  %4391 = icmp eq i8 %4389, 0
  br i1 %4391, label %4392, label %4395

4392:                                             ; preds = %4387
  %4393 = shl nuw nsw i64 %4388, 4
  %4394 = getelementptr inbounds i8, i8* %0, i64 %4393
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4394, i8 0, i64 16, i1 false)
  br label %4395

4395:                                             ; preds = %4392, %4387
  %4396 = add nuw nsw i64 %.01, 549
  %4397 = call zeroext i8 @randombit()
  %4398 = getelementptr inbounds i8, i8* %1, i64 %4396
  store i8 %4397, i8* %4398, align 1
  %4399 = icmp eq i8 %4397, 0
  br i1 %4399, label %4400, label %4403

4400:                                             ; preds = %4395
  %4401 = shl nuw nsw i64 %4396, 4
  %4402 = getelementptr inbounds i8, i8* %0, i64 %4401
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4402, i8 0, i64 16, i1 false)
  br label %4403

4403:                                             ; preds = %4400, %4395
  %4404 = add nuw nsw i64 %.01, 550
  %4405 = call zeroext i8 @randombit()
  %4406 = getelementptr inbounds i8, i8* %1, i64 %4404
  store i8 %4405, i8* %4406, align 1
  %4407 = icmp eq i8 %4405, 0
  br i1 %4407, label %4408, label %4411

4408:                                             ; preds = %4403
  %4409 = shl nuw nsw i64 %4404, 4
  %4410 = getelementptr inbounds i8, i8* %0, i64 %4409
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4410, i8 0, i64 16, i1 false)
  br label %4411

4411:                                             ; preds = %4408, %4403
  %4412 = add nuw nsw i64 %.01, 551
  %4413 = call zeroext i8 @randombit()
  %4414 = getelementptr inbounds i8, i8* %1, i64 %4412
  store i8 %4413, i8* %4414, align 1
  %4415 = icmp eq i8 %4413, 0
  br i1 %4415, label %4416, label %4419

4416:                                             ; preds = %4411
  %4417 = shl nuw nsw i64 %4412, 4
  %4418 = getelementptr inbounds i8, i8* %0, i64 %4417
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4418, i8 0, i64 16, i1 false)
  br label %4419

4419:                                             ; preds = %4416, %4411
  %4420 = add nuw nsw i64 %.01, 552
  %4421 = call zeroext i8 @randombit()
  %4422 = getelementptr inbounds i8, i8* %1, i64 %4420
  store i8 %4421, i8* %4422, align 1
  %4423 = icmp eq i8 %4421, 0
  br i1 %4423, label %4424, label %4427

4424:                                             ; preds = %4419
  %4425 = shl nuw nsw i64 %4420, 4
  %4426 = getelementptr inbounds i8, i8* %0, i64 %4425
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4426, i8 0, i64 16, i1 false)
  br label %4427

4427:                                             ; preds = %4424, %4419
  %4428 = add nuw nsw i64 %.01, 553
  %4429 = call zeroext i8 @randombit()
  %4430 = getelementptr inbounds i8, i8* %1, i64 %4428
  store i8 %4429, i8* %4430, align 1
  %4431 = icmp eq i8 %4429, 0
  br i1 %4431, label %4432, label %4435

4432:                                             ; preds = %4427
  %4433 = shl nuw nsw i64 %4428, 4
  %4434 = getelementptr inbounds i8, i8* %0, i64 %4433
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4434, i8 0, i64 16, i1 false)
  br label %4435

4435:                                             ; preds = %4432, %4427
  %4436 = add nuw nsw i64 %.01, 554
  %4437 = call zeroext i8 @randombit()
  %4438 = getelementptr inbounds i8, i8* %1, i64 %4436
  store i8 %4437, i8* %4438, align 1
  %4439 = icmp eq i8 %4437, 0
  br i1 %4439, label %4440, label %4443

4440:                                             ; preds = %4435
  %4441 = shl nuw nsw i64 %4436, 4
  %4442 = getelementptr inbounds i8, i8* %0, i64 %4441
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4442, i8 0, i64 16, i1 false)
  br label %4443

4443:                                             ; preds = %4440, %4435
  %4444 = add nuw nsw i64 %.01, 555
  %4445 = call zeroext i8 @randombit()
  %4446 = getelementptr inbounds i8, i8* %1, i64 %4444
  store i8 %4445, i8* %4446, align 1
  %4447 = icmp eq i8 %4445, 0
  br i1 %4447, label %4448, label %4451

4448:                                             ; preds = %4443
  %4449 = shl nuw nsw i64 %4444, 4
  %4450 = getelementptr inbounds i8, i8* %0, i64 %4449
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4450, i8 0, i64 16, i1 false)
  br label %4451

4451:                                             ; preds = %4448, %4443
  %4452 = add nuw nsw i64 %.01, 556
  %4453 = call zeroext i8 @randombit()
  %4454 = getelementptr inbounds i8, i8* %1, i64 %4452
  store i8 %4453, i8* %4454, align 1
  %4455 = icmp eq i8 %4453, 0
  br i1 %4455, label %4456, label %4459

4456:                                             ; preds = %4451
  %4457 = shl nuw nsw i64 %4452, 4
  %4458 = getelementptr inbounds i8, i8* %0, i64 %4457
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4458, i8 0, i64 16, i1 false)
  br label %4459

4459:                                             ; preds = %4456, %4451
  %4460 = add nuw nsw i64 %.01, 557
  %4461 = call zeroext i8 @randombit()
  %4462 = getelementptr inbounds i8, i8* %1, i64 %4460
  store i8 %4461, i8* %4462, align 1
  %4463 = icmp eq i8 %4461, 0
  br i1 %4463, label %4464, label %4467

4464:                                             ; preds = %4459
  %4465 = shl nuw nsw i64 %4460, 4
  %4466 = getelementptr inbounds i8, i8* %0, i64 %4465
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4466, i8 0, i64 16, i1 false)
  br label %4467

4467:                                             ; preds = %4464, %4459
  %4468 = add nuw nsw i64 %.01, 558
  %4469 = call zeroext i8 @randombit()
  %4470 = getelementptr inbounds i8, i8* %1, i64 %4468
  store i8 %4469, i8* %4470, align 1
  %4471 = icmp eq i8 %4469, 0
  br i1 %4471, label %4472, label %4475

4472:                                             ; preds = %4467
  %4473 = shl nuw nsw i64 %4468, 4
  %4474 = getelementptr inbounds i8, i8* %0, i64 %4473
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4474, i8 0, i64 16, i1 false)
  br label %4475

4475:                                             ; preds = %4472, %4467
  %4476 = add nuw nsw i64 %.01, 559
  %4477 = call zeroext i8 @randombit()
  %4478 = getelementptr inbounds i8, i8* %1, i64 %4476
  store i8 %4477, i8* %4478, align 1
  %4479 = icmp eq i8 %4477, 0
  br i1 %4479, label %4480, label %4483

4480:                                             ; preds = %4475
  %4481 = shl nuw nsw i64 %4476, 4
  %4482 = getelementptr inbounds i8, i8* %0, i64 %4481
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4482, i8 0, i64 16, i1 false)
  br label %4483

4483:                                             ; preds = %4480, %4475
  %4484 = add nuw nsw i64 %.01, 560
  %4485 = call zeroext i8 @randombit()
  %4486 = getelementptr inbounds i8, i8* %1, i64 %4484
  store i8 %4485, i8* %4486, align 1
  %4487 = icmp eq i8 %4485, 0
  br i1 %4487, label %4488, label %4491

4488:                                             ; preds = %4483
  %4489 = shl nuw nsw i64 %4484, 4
  %4490 = getelementptr inbounds i8, i8* %0, i64 %4489
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4490, i8 0, i64 16, i1 false)
  br label %4491

4491:                                             ; preds = %4488, %4483
  %4492 = add nuw nsw i64 %.01, 561
  %4493 = call zeroext i8 @randombit()
  %4494 = getelementptr inbounds i8, i8* %1, i64 %4492
  store i8 %4493, i8* %4494, align 1
  %4495 = icmp eq i8 %4493, 0
  br i1 %4495, label %4496, label %4499

4496:                                             ; preds = %4491
  %4497 = shl nuw nsw i64 %4492, 4
  %4498 = getelementptr inbounds i8, i8* %0, i64 %4497
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4498, i8 0, i64 16, i1 false)
  br label %4499

4499:                                             ; preds = %4496, %4491
  %4500 = add nuw nsw i64 %.01, 562
  %4501 = call zeroext i8 @randombit()
  %4502 = getelementptr inbounds i8, i8* %1, i64 %4500
  store i8 %4501, i8* %4502, align 1
  %4503 = icmp eq i8 %4501, 0
  br i1 %4503, label %4504, label %4507

4504:                                             ; preds = %4499
  %4505 = shl nuw nsw i64 %4500, 4
  %4506 = getelementptr inbounds i8, i8* %0, i64 %4505
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4506, i8 0, i64 16, i1 false)
  br label %4507

4507:                                             ; preds = %4504, %4499
  %4508 = add nuw nsw i64 %.01, 563
  %4509 = call zeroext i8 @randombit()
  %4510 = getelementptr inbounds i8, i8* %1, i64 %4508
  store i8 %4509, i8* %4510, align 1
  %4511 = icmp eq i8 %4509, 0
  br i1 %4511, label %4512, label %4515

4512:                                             ; preds = %4507
  %4513 = shl nuw nsw i64 %4508, 4
  %4514 = getelementptr inbounds i8, i8* %0, i64 %4513
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4514, i8 0, i64 16, i1 false)
  br label %4515

4515:                                             ; preds = %4512, %4507
  %4516 = add nuw nsw i64 %.01, 564
  %4517 = call zeroext i8 @randombit()
  %4518 = getelementptr inbounds i8, i8* %1, i64 %4516
  store i8 %4517, i8* %4518, align 1
  %4519 = icmp eq i8 %4517, 0
  br i1 %4519, label %4520, label %4523

4520:                                             ; preds = %4515
  %4521 = shl nuw nsw i64 %4516, 4
  %4522 = getelementptr inbounds i8, i8* %0, i64 %4521
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4522, i8 0, i64 16, i1 false)
  br label %4523

4523:                                             ; preds = %4520, %4515
  %4524 = add nuw nsw i64 %.01, 565
  %4525 = call zeroext i8 @randombit()
  %4526 = getelementptr inbounds i8, i8* %1, i64 %4524
  store i8 %4525, i8* %4526, align 1
  %4527 = icmp eq i8 %4525, 0
  br i1 %4527, label %4528, label %4531

4528:                                             ; preds = %4523
  %4529 = shl nuw nsw i64 %4524, 4
  %4530 = getelementptr inbounds i8, i8* %0, i64 %4529
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4530, i8 0, i64 16, i1 false)
  br label %4531

4531:                                             ; preds = %4528, %4523
  %4532 = add nuw nsw i64 %.01, 566
  %4533 = call zeroext i8 @randombit()
  %4534 = getelementptr inbounds i8, i8* %1, i64 %4532
  store i8 %4533, i8* %4534, align 1
  %4535 = icmp eq i8 %4533, 0
  br i1 %4535, label %4536, label %4539

4536:                                             ; preds = %4531
  %4537 = shl nuw nsw i64 %4532, 4
  %4538 = getelementptr inbounds i8, i8* %0, i64 %4537
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4538, i8 0, i64 16, i1 false)
  br label %4539

4539:                                             ; preds = %4536, %4531
  %4540 = add nuw nsw i64 %.01, 567
  %4541 = call zeroext i8 @randombit()
  %4542 = getelementptr inbounds i8, i8* %1, i64 %4540
  store i8 %4541, i8* %4542, align 1
  %4543 = icmp eq i8 %4541, 0
  br i1 %4543, label %4544, label %4547

4544:                                             ; preds = %4539
  %4545 = shl nuw nsw i64 %4540, 4
  %4546 = getelementptr inbounds i8, i8* %0, i64 %4545
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4546, i8 0, i64 16, i1 false)
  br label %4547

4547:                                             ; preds = %4544, %4539
  %4548 = add nuw nsw i64 %.01, 568
  %4549 = call zeroext i8 @randombit()
  %4550 = getelementptr inbounds i8, i8* %1, i64 %4548
  store i8 %4549, i8* %4550, align 1
  %4551 = icmp eq i8 %4549, 0
  br i1 %4551, label %4552, label %4555

4552:                                             ; preds = %4547
  %4553 = shl nuw nsw i64 %4548, 4
  %4554 = getelementptr inbounds i8, i8* %0, i64 %4553
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4554, i8 0, i64 16, i1 false)
  br label %4555

4555:                                             ; preds = %4552, %4547
  %4556 = add nuw nsw i64 %.01, 569
  %4557 = call zeroext i8 @randombit()
  %4558 = getelementptr inbounds i8, i8* %1, i64 %4556
  store i8 %4557, i8* %4558, align 1
  %4559 = icmp eq i8 %4557, 0
  br i1 %4559, label %4560, label %4563

4560:                                             ; preds = %4555
  %4561 = shl nuw nsw i64 %4556, 4
  %4562 = getelementptr inbounds i8, i8* %0, i64 %4561
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4562, i8 0, i64 16, i1 false)
  br label %4563

4563:                                             ; preds = %4560, %4555
  %4564 = add nuw nsw i64 %.01, 570
  %4565 = call zeroext i8 @randombit()
  %4566 = getelementptr inbounds i8, i8* %1, i64 %4564
  store i8 %4565, i8* %4566, align 1
  %4567 = icmp eq i8 %4565, 0
  br i1 %4567, label %4568, label %4571

4568:                                             ; preds = %4563
  %4569 = shl nuw nsw i64 %4564, 4
  %4570 = getelementptr inbounds i8, i8* %0, i64 %4569
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4570, i8 0, i64 16, i1 false)
  br label %4571

4571:                                             ; preds = %4568, %4563
  %4572 = add nuw nsw i64 %.01, 571
  %4573 = call zeroext i8 @randombit()
  %4574 = getelementptr inbounds i8, i8* %1, i64 %4572
  store i8 %4573, i8* %4574, align 1
  %4575 = icmp eq i8 %4573, 0
  br i1 %4575, label %4576, label %4579

4576:                                             ; preds = %4571
  %4577 = shl nuw nsw i64 %4572, 4
  %4578 = getelementptr inbounds i8, i8* %0, i64 %4577
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4578, i8 0, i64 16, i1 false)
  br label %4579

4579:                                             ; preds = %4576, %4571
  %4580 = add nuw nsw i64 %.01, 572
  %4581 = call zeroext i8 @randombit()
  %4582 = getelementptr inbounds i8, i8* %1, i64 %4580
  store i8 %4581, i8* %4582, align 1
  %4583 = icmp eq i8 %4581, 0
  br i1 %4583, label %4584, label %4587

4584:                                             ; preds = %4579
  %4585 = shl nuw nsw i64 %4580, 4
  %4586 = getelementptr inbounds i8, i8* %0, i64 %4585
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4586, i8 0, i64 16, i1 false)
  br label %4587

4587:                                             ; preds = %4584, %4579
  %4588 = add nuw nsw i64 %.01, 573
  %4589 = call zeroext i8 @randombit()
  %4590 = getelementptr inbounds i8, i8* %1, i64 %4588
  store i8 %4589, i8* %4590, align 1
  %4591 = icmp eq i8 %4589, 0
  br i1 %4591, label %4592, label %4595

4592:                                             ; preds = %4587
  %4593 = shl nuw nsw i64 %4588, 4
  %4594 = getelementptr inbounds i8, i8* %0, i64 %4593
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4594, i8 0, i64 16, i1 false)
  br label %4595

4595:                                             ; preds = %4592, %4587
  %4596 = add nuw nsw i64 %.01, 574
  %4597 = call zeroext i8 @randombit()
  %4598 = getelementptr inbounds i8, i8* %1, i64 %4596
  store i8 %4597, i8* %4598, align 1
  %4599 = icmp eq i8 %4597, 0
  br i1 %4599, label %4600, label %4603

4600:                                             ; preds = %4595
  %4601 = shl nuw nsw i64 %4596, 4
  %4602 = getelementptr inbounds i8, i8* %0, i64 %4601
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4602, i8 0, i64 16, i1 false)
  br label %4603

4603:                                             ; preds = %4600, %4595
  %4604 = add nuw nsw i64 %.01, 575
  %4605 = call zeroext i8 @randombit()
  %4606 = getelementptr inbounds i8, i8* %1, i64 %4604
  store i8 %4605, i8* %4606, align 1
  %4607 = icmp eq i8 %4605, 0
  br i1 %4607, label %4608, label %4611

4608:                                             ; preds = %4603
  %4609 = shl nuw nsw i64 %4604, 4
  %4610 = getelementptr inbounds i8, i8* %0, i64 %4609
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4610, i8 0, i64 16, i1 false)
  br label %4611

4611:                                             ; preds = %4608, %4603
  %4612 = add nuw nsw i64 %.01, 576
  %4613 = call zeroext i8 @randombit()
  %4614 = getelementptr inbounds i8, i8* %1, i64 %4612
  store i8 %4613, i8* %4614, align 1
  %4615 = icmp eq i8 %4613, 0
  br i1 %4615, label %4616, label %4619

4616:                                             ; preds = %4611
  %4617 = shl nuw nsw i64 %4612, 4
  %4618 = getelementptr inbounds i8, i8* %0, i64 %4617
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4618, i8 0, i64 16, i1 false)
  br label %4619

4619:                                             ; preds = %4616, %4611
  %4620 = add nuw nsw i64 %.01, 577
  %4621 = call zeroext i8 @randombit()
  %4622 = getelementptr inbounds i8, i8* %1, i64 %4620
  store i8 %4621, i8* %4622, align 1
  %4623 = icmp eq i8 %4621, 0
  br i1 %4623, label %4624, label %4627

4624:                                             ; preds = %4619
  %4625 = shl nuw nsw i64 %4620, 4
  %4626 = getelementptr inbounds i8, i8* %0, i64 %4625
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4626, i8 0, i64 16, i1 false)
  br label %4627

4627:                                             ; preds = %4624, %4619
  %4628 = add nuw nsw i64 %.01, 578
  %4629 = call zeroext i8 @randombit()
  %4630 = getelementptr inbounds i8, i8* %1, i64 %4628
  store i8 %4629, i8* %4630, align 1
  %4631 = icmp eq i8 %4629, 0
  br i1 %4631, label %4632, label %4635

4632:                                             ; preds = %4627
  %4633 = shl nuw nsw i64 %4628, 4
  %4634 = getelementptr inbounds i8, i8* %0, i64 %4633
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4634, i8 0, i64 16, i1 false)
  br label %4635

4635:                                             ; preds = %4632, %4627
  %4636 = add nuw nsw i64 %.01, 579
  %4637 = call zeroext i8 @randombit()
  %4638 = getelementptr inbounds i8, i8* %1, i64 %4636
  store i8 %4637, i8* %4638, align 1
  %4639 = icmp eq i8 %4637, 0
  br i1 %4639, label %4640, label %4643

4640:                                             ; preds = %4635
  %4641 = shl nuw nsw i64 %4636, 4
  %4642 = getelementptr inbounds i8, i8* %0, i64 %4641
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4642, i8 0, i64 16, i1 false)
  br label %4643

4643:                                             ; preds = %4640, %4635
  %4644 = add nuw nsw i64 %.01, 580
  %4645 = call zeroext i8 @randombit()
  %4646 = getelementptr inbounds i8, i8* %1, i64 %4644
  store i8 %4645, i8* %4646, align 1
  %4647 = icmp eq i8 %4645, 0
  br i1 %4647, label %4648, label %4651

4648:                                             ; preds = %4643
  %4649 = shl nuw nsw i64 %4644, 4
  %4650 = getelementptr inbounds i8, i8* %0, i64 %4649
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4650, i8 0, i64 16, i1 false)
  br label %4651

4651:                                             ; preds = %4648, %4643
  %4652 = add nuw nsw i64 %.01, 581
  %4653 = call zeroext i8 @randombit()
  %4654 = getelementptr inbounds i8, i8* %1, i64 %4652
  store i8 %4653, i8* %4654, align 1
  %4655 = icmp eq i8 %4653, 0
  br i1 %4655, label %4656, label %4659

4656:                                             ; preds = %4651
  %4657 = shl nuw nsw i64 %4652, 4
  %4658 = getelementptr inbounds i8, i8* %0, i64 %4657
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4658, i8 0, i64 16, i1 false)
  br label %4659

4659:                                             ; preds = %4656, %4651
  %4660 = add nuw nsw i64 %.01, 582
  %4661 = call zeroext i8 @randombit()
  %4662 = getelementptr inbounds i8, i8* %1, i64 %4660
  store i8 %4661, i8* %4662, align 1
  %4663 = icmp eq i8 %4661, 0
  br i1 %4663, label %4664, label %4667

4664:                                             ; preds = %4659
  %4665 = shl nuw nsw i64 %4660, 4
  %4666 = getelementptr inbounds i8, i8* %0, i64 %4665
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4666, i8 0, i64 16, i1 false)
  br label %4667

4667:                                             ; preds = %4664, %4659
  %4668 = add nuw nsw i64 %.01, 583
  %4669 = call zeroext i8 @randombit()
  %4670 = getelementptr inbounds i8, i8* %1, i64 %4668
  store i8 %4669, i8* %4670, align 1
  %4671 = icmp eq i8 %4669, 0
  br i1 %4671, label %4672, label %4675

4672:                                             ; preds = %4667
  %4673 = shl nuw nsw i64 %4668, 4
  %4674 = getelementptr inbounds i8, i8* %0, i64 %4673
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4674, i8 0, i64 16, i1 false)
  br label %4675

4675:                                             ; preds = %4672, %4667
  %4676 = add nuw nsw i64 %.01, 584
  %4677 = call zeroext i8 @randombit()
  %4678 = getelementptr inbounds i8, i8* %1, i64 %4676
  store i8 %4677, i8* %4678, align 1
  %4679 = icmp eq i8 %4677, 0
  br i1 %4679, label %4680, label %4683

4680:                                             ; preds = %4675
  %4681 = shl nuw nsw i64 %4676, 4
  %4682 = getelementptr inbounds i8, i8* %0, i64 %4681
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4682, i8 0, i64 16, i1 false)
  br label %4683

4683:                                             ; preds = %4680, %4675
  %4684 = add nuw nsw i64 %.01, 585
  %4685 = call zeroext i8 @randombit()
  %4686 = getelementptr inbounds i8, i8* %1, i64 %4684
  store i8 %4685, i8* %4686, align 1
  %4687 = icmp eq i8 %4685, 0
  br i1 %4687, label %4688, label %4691

4688:                                             ; preds = %4683
  %4689 = shl nuw nsw i64 %4684, 4
  %4690 = getelementptr inbounds i8, i8* %0, i64 %4689
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4690, i8 0, i64 16, i1 false)
  br label %4691

4691:                                             ; preds = %4688, %4683
  %4692 = add nuw nsw i64 %.01, 586
  %4693 = call zeroext i8 @randombit()
  %4694 = getelementptr inbounds i8, i8* %1, i64 %4692
  store i8 %4693, i8* %4694, align 1
  %4695 = icmp eq i8 %4693, 0
  br i1 %4695, label %4696, label %4699

4696:                                             ; preds = %4691
  %4697 = shl nuw nsw i64 %4692, 4
  %4698 = getelementptr inbounds i8, i8* %0, i64 %4697
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4698, i8 0, i64 16, i1 false)
  br label %4699

4699:                                             ; preds = %4696, %4691
  %4700 = add nuw nsw i64 %.01, 587
  %4701 = call zeroext i8 @randombit()
  %4702 = getelementptr inbounds i8, i8* %1, i64 %4700
  store i8 %4701, i8* %4702, align 1
  %4703 = icmp eq i8 %4701, 0
  br i1 %4703, label %4704, label %4707

4704:                                             ; preds = %4699
  %4705 = shl nuw nsw i64 %4700, 4
  %4706 = getelementptr inbounds i8, i8* %0, i64 %4705
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4706, i8 0, i64 16, i1 false)
  br label %4707

4707:                                             ; preds = %4704, %4699
  %4708 = add nuw nsw i64 %.01, 588
  %4709 = call zeroext i8 @randombit()
  %4710 = getelementptr inbounds i8, i8* %1, i64 %4708
  store i8 %4709, i8* %4710, align 1
  %4711 = icmp eq i8 %4709, 0
  br i1 %4711, label %4712, label %4715

4712:                                             ; preds = %4707
  %4713 = shl nuw nsw i64 %4708, 4
  %4714 = getelementptr inbounds i8, i8* %0, i64 %4713
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4714, i8 0, i64 16, i1 false)
  br label %4715

4715:                                             ; preds = %4712, %4707
  %4716 = add nuw nsw i64 %.01, 589
  %4717 = call zeroext i8 @randombit()
  %4718 = getelementptr inbounds i8, i8* %1, i64 %4716
  store i8 %4717, i8* %4718, align 1
  %4719 = icmp eq i8 %4717, 0
  br i1 %4719, label %4720, label %4723

4720:                                             ; preds = %4715
  %4721 = shl nuw nsw i64 %4716, 4
  %4722 = getelementptr inbounds i8, i8* %0, i64 %4721
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4722, i8 0, i64 16, i1 false)
  br label %4723

4723:                                             ; preds = %4720, %4715
  %4724 = add nuw nsw i64 %.01, 590
  %4725 = call zeroext i8 @randombit()
  %4726 = getelementptr inbounds i8, i8* %1, i64 %4724
  store i8 %4725, i8* %4726, align 1
  %4727 = icmp eq i8 %4725, 0
  br i1 %4727, label %4728, label %4731

4728:                                             ; preds = %4723
  %4729 = shl nuw nsw i64 %4724, 4
  %4730 = getelementptr inbounds i8, i8* %0, i64 %4729
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4730, i8 0, i64 16, i1 false)
  br label %4731

4731:                                             ; preds = %4728, %4723
  %4732 = add nuw nsw i64 %.01, 591
  %4733 = call zeroext i8 @randombit()
  %4734 = getelementptr inbounds i8, i8* %1, i64 %4732
  store i8 %4733, i8* %4734, align 1
  %4735 = icmp eq i8 %4733, 0
  br i1 %4735, label %4736, label %4739

4736:                                             ; preds = %4731
  %4737 = shl nuw nsw i64 %4732, 4
  %4738 = getelementptr inbounds i8, i8* %0, i64 %4737
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4738, i8 0, i64 16, i1 false)
  br label %4739

4739:                                             ; preds = %4736, %4731
  %4740 = add nuw nsw i64 %.01, 592
  %4741 = call zeroext i8 @randombit()
  %4742 = getelementptr inbounds i8, i8* %1, i64 %4740
  store i8 %4741, i8* %4742, align 1
  %4743 = icmp eq i8 %4741, 0
  br i1 %4743, label %4744, label %4747

4744:                                             ; preds = %4739
  %4745 = shl nuw nsw i64 %4740, 4
  %4746 = getelementptr inbounds i8, i8* %0, i64 %4745
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4746, i8 0, i64 16, i1 false)
  br label %4747

4747:                                             ; preds = %4744, %4739
  %4748 = add nuw nsw i64 %.01, 593
  %4749 = call zeroext i8 @randombit()
  %4750 = getelementptr inbounds i8, i8* %1, i64 %4748
  store i8 %4749, i8* %4750, align 1
  %4751 = icmp eq i8 %4749, 0
  br i1 %4751, label %4752, label %4755

4752:                                             ; preds = %4747
  %4753 = shl nuw nsw i64 %4748, 4
  %4754 = getelementptr inbounds i8, i8* %0, i64 %4753
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4754, i8 0, i64 16, i1 false)
  br label %4755

4755:                                             ; preds = %4752, %4747
  %4756 = add nuw nsw i64 %.01, 594
  %4757 = call zeroext i8 @randombit()
  %4758 = getelementptr inbounds i8, i8* %1, i64 %4756
  store i8 %4757, i8* %4758, align 1
  %4759 = icmp eq i8 %4757, 0
  br i1 %4759, label %4760, label %4763

4760:                                             ; preds = %4755
  %4761 = shl nuw nsw i64 %4756, 4
  %4762 = getelementptr inbounds i8, i8* %0, i64 %4761
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4762, i8 0, i64 16, i1 false)
  br label %4763

4763:                                             ; preds = %4760, %4755
  %4764 = add nuw nsw i64 %.01, 595
  %4765 = call zeroext i8 @randombit()
  %4766 = getelementptr inbounds i8, i8* %1, i64 %4764
  store i8 %4765, i8* %4766, align 1
  %4767 = icmp eq i8 %4765, 0
  br i1 %4767, label %4768, label %4771

4768:                                             ; preds = %4763
  %4769 = shl nuw nsw i64 %4764, 4
  %4770 = getelementptr inbounds i8, i8* %0, i64 %4769
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4770, i8 0, i64 16, i1 false)
  br label %4771

4771:                                             ; preds = %4768, %4763
  %4772 = add nuw nsw i64 %.01, 596
  %4773 = call zeroext i8 @randombit()
  %4774 = getelementptr inbounds i8, i8* %1, i64 %4772
  store i8 %4773, i8* %4774, align 1
  %4775 = icmp eq i8 %4773, 0
  br i1 %4775, label %4776, label %4779

4776:                                             ; preds = %4771
  %4777 = shl nuw nsw i64 %4772, 4
  %4778 = getelementptr inbounds i8, i8* %0, i64 %4777
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4778, i8 0, i64 16, i1 false)
  br label %4779

4779:                                             ; preds = %4776, %4771
  %4780 = add nuw nsw i64 %.01, 597
  %4781 = call zeroext i8 @randombit()
  %4782 = getelementptr inbounds i8, i8* %1, i64 %4780
  store i8 %4781, i8* %4782, align 1
  %4783 = icmp eq i8 %4781, 0
  br i1 %4783, label %4784, label %4787

4784:                                             ; preds = %4779
  %4785 = shl nuw nsw i64 %4780, 4
  %4786 = getelementptr inbounds i8, i8* %0, i64 %4785
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4786, i8 0, i64 16, i1 false)
  br label %4787

4787:                                             ; preds = %4784, %4779
  %4788 = add nuw nsw i64 %.01, 598
  %4789 = call zeroext i8 @randombit()
  %4790 = getelementptr inbounds i8, i8* %1, i64 %4788
  store i8 %4789, i8* %4790, align 1
  %4791 = icmp eq i8 %4789, 0
  br i1 %4791, label %4792, label %4795

4792:                                             ; preds = %4787
  %4793 = shl nuw nsw i64 %4788, 4
  %4794 = getelementptr inbounds i8, i8* %0, i64 %4793
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4794, i8 0, i64 16, i1 false)
  br label %4795

4795:                                             ; preds = %4792, %4787
  %4796 = add nuw nsw i64 %.01, 599
  %4797 = call zeroext i8 @randombit()
  %4798 = getelementptr inbounds i8, i8* %1, i64 %4796
  store i8 %4797, i8* %4798, align 1
  %4799 = icmp eq i8 %4797, 0
  br i1 %4799, label %4800, label %4803

4800:                                             ; preds = %4795
  %4801 = shl nuw nsw i64 %4796, 4
  %4802 = getelementptr inbounds i8, i8* %0, i64 %4801
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4802, i8 0, i64 16, i1 false)
  br label %4803

4803:                                             ; preds = %4800, %4795
  %4804 = add nuw nsw i64 %.01, 600
  %4805 = call zeroext i8 @randombit()
  %4806 = getelementptr inbounds i8, i8* %1, i64 %4804
  store i8 %4805, i8* %4806, align 1
  %4807 = icmp eq i8 %4805, 0
  br i1 %4807, label %4808, label %4811

4808:                                             ; preds = %4803
  %4809 = shl nuw nsw i64 %4804, 4
  %4810 = getelementptr inbounds i8, i8* %0, i64 %4809
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4810, i8 0, i64 16, i1 false)
  br label %4811

4811:                                             ; preds = %4808, %4803
  %4812 = add nuw nsw i64 %.01, 601
  %4813 = call zeroext i8 @randombit()
  %4814 = getelementptr inbounds i8, i8* %1, i64 %4812
  store i8 %4813, i8* %4814, align 1
  %4815 = icmp eq i8 %4813, 0
  br i1 %4815, label %4816, label %4819

4816:                                             ; preds = %4811
  %4817 = shl nuw nsw i64 %4812, 4
  %4818 = getelementptr inbounds i8, i8* %0, i64 %4817
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4818, i8 0, i64 16, i1 false)
  br label %4819

4819:                                             ; preds = %4816, %4811
  %4820 = add nuw nsw i64 %.01, 602
  %4821 = call zeroext i8 @randombit()
  %4822 = getelementptr inbounds i8, i8* %1, i64 %4820
  store i8 %4821, i8* %4822, align 1
  %4823 = icmp eq i8 %4821, 0
  br i1 %4823, label %4824, label %4827

4824:                                             ; preds = %4819
  %4825 = shl nuw nsw i64 %4820, 4
  %4826 = getelementptr inbounds i8, i8* %0, i64 %4825
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4826, i8 0, i64 16, i1 false)
  br label %4827

4827:                                             ; preds = %4824, %4819
  %4828 = add nuw nsw i64 %.01, 603
  %4829 = call zeroext i8 @randombit()
  %4830 = getelementptr inbounds i8, i8* %1, i64 %4828
  store i8 %4829, i8* %4830, align 1
  %4831 = icmp eq i8 %4829, 0
  br i1 %4831, label %4832, label %4835

4832:                                             ; preds = %4827
  %4833 = shl nuw nsw i64 %4828, 4
  %4834 = getelementptr inbounds i8, i8* %0, i64 %4833
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4834, i8 0, i64 16, i1 false)
  br label %4835

4835:                                             ; preds = %4832, %4827
  %4836 = add nuw nsw i64 %.01, 604
  %4837 = call zeroext i8 @randombit()
  %4838 = getelementptr inbounds i8, i8* %1, i64 %4836
  store i8 %4837, i8* %4838, align 1
  %4839 = icmp eq i8 %4837, 0
  br i1 %4839, label %4840, label %4843

4840:                                             ; preds = %4835
  %4841 = shl nuw nsw i64 %4836, 4
  %4842 = getelementptr inbounds i8, i8* %0, i64 %4841
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4842, i8 0, i64 16, i1 false)
  br label %4843

4843:                                             ; preds = %4840, %4835
  %4844 = add nuw nsw i64 %.01, 605
  %4845 = call zeroext i8 @randombit()
  %4846 = getelementptr inbounds i8, i8* %1, i64 %4844
  store i8 %4845, i8* %4846, align 1
  %4847 = icmp eq i8 %4845, 0
  br i1 %4847, label %4848, label %4851

4848:                                             ; preds = %4843
  %4849 = shl nuw nsw i64 %4844, 4
  %4850 = getelementptr inbounds i8, i8* %0, i64 %4849
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4850, i8 0, i64 16, i1 false)
  br label %4851

4851:                                             ; preds = %4848, %4843
  %4852 = add nuw nsw i64 %.01, 606
  %4853 = call zeroext i8 @randombit()
  %4854 = getelementptr inbounds i8, i8* %1, i64 %4852
  store i8 %4853, i8* %4854, align 1
  %4855 = icmp eq i8 %4853, 0
  br i1 %4855, label %4856, label %4859

4856:                                             ; preds = %4851
  %4857 = shl nuw nsw i64 %4852, 4
  %4858 = getelementptr inbounds i8, i8* %0, i64 %4857
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4858, i8 0, i64 16, i1 false)
  br label %4859

4859:                                             ; preds = %4856, %4851
  %4860 = add nuw nsw i64 %.01, 607
  %4861 = call zeroext i8 @randombit()
  %4862 = getelementptr inbounds i8, i8* %1, i64 %4860
  store i8 %4861, i8* %4862, align 1
  %4863 = icmp eq i8 %4861, 0
  br i1 %4863, label %4864, label %4867

4864:                                             ; preds = %4859
  %4865 = shl nuw nsw i64 %4860, 4
  %4866 = getelementptr inbounds i8, i8* %0, i64 %4865
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4866, i8 0, i64 16, i1 false)
  br label %4867

4867:                                             ; preds = %4864, %4859
  %4868 = add nuw nsw i64 %.01, 608
  %4869 = call zeroext i8 @randombit()
  %4870 = getelementptr inbounds i8, i8* %1, i64 %4868
  store i8 %4869, i8* %4870, align 1
  %4871 = icmp eq i8 %4869, 0
  br i1 %4871, label %4872, label %4875

4872:                                             ; preds = %4867
  %4873 = shl nuw nsw i64 %4868, 4
  %4874 = getelementptr inbounds i8, i8* %0, i64 %4873
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4874, i8 0, i64 16, i1 false)
  br label %4875

4875:                                             ; preds = %4872, %4867
  %4876 = add nuw nsw i64 %.01, 609
  %4877 = call zeroext i8 @randombit()
  %4878 = getelementptr inbounds i8, i8* %1, i64 %4876
  store i8 %4877, i8* %4878, align 1
  %4879 = icmp eq i8 %4877, 0
  br i1 %4879, label %4880, label %4883

4880:                                             ; preds = %4875
  %4881 = shl nuw nsw i64 %4876, 4
  %4882 = getelementptr inbounds i8, i8* %0, i64 %4881
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4882, i8 0, i64 16, i1 false)
  br label %4883

4883:                                             ; preds = %4880, %4875
  %4884 = add nuw nsw i64 %.01, 610
  %4885 = call zeroext i8 @randombit()
  %4886 = getelementptr inbounds i8, i8* %1, i64 %4884
  store i8 %4885, i8* %4886, align 1
  %4887 = icmp eq i8 %4885, 0
  br i1 %4887, label %4888, label %4891

4888:                                             ; preds = %4883
  %4889 = shl nuw nsw i64 %4884, 4
  %4890 = getelementptr inbounds i8, i8* %0, i64 %4889
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4890, i8 0, i64 16, i1 false)
  br label %4891

4891:                                             ; preds = %4888, %4883
  %4892 = add nuw nsw i64 %.01, 611
  %4893 = call zeroext i8 @randombit()
  %4894 = getelementptr inbounds i8, i8* %1, i64 %4892
  store i8 %4893, i8* %4894, align 1
  %4895 = icmp eq i8 %4893, 0
  br i1 %4895, label %4896, label %4899

4896:                                             ; preds = %4891
  %4897 = shl nuw nsw i64 %4892, 4
  %4898 = getelementptr inbounds i8, i8* %0, i64 %4897
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4898, i8 0, i64 16, i1 false)
  br label %4899

4899:                                             ; preds = %4896, %4891
  %4900 = add nuw nsw i64 %.01, 612
  %4901 = call zeroext i8 @randombit()
  %4902 = getelementptr inbounds i8, i8* %1, i64 %4900
  store i8 %4901, i8* %4902, align 1
  %4903 = icmp eq i8 %4901, 0
  br i1 %4903, label %4904, label %4907

4904:                                             ; preds = %4899
  %4905 = shl nuw nsw i64 %4900, 4
  %4906 = getelementptr inbounds i8, i8* %0, i64 %4905
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4906, i8 0, i64 16, i1 false)
  br label %4907

4907:                                             ; preds = %4904, %4899
  %4908 = add nuw nsw i64 %.01, 613
  %4909 = call zeroext i8 @randombit()
  %4910 = getelementptr inbounds i8, i8* %1, i64 %4908
  store i8 %4909, i8* %4910, align 1
  %4911 = icmp eq i8 %4909, 0
  br i1 %4911, label %4912, label %4915

4912:                                             ; preds = %4907
  %4913 = shl nuw nsw i64 %4908, 4
  %4914 = getelementptr inbounds i8, i8* %0, i64 %4913
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4914, i8 0, i64 16, i1 false)
  br label %4915

4915:                                             ; preds = %4912, %4907
  %4916 = add nuw nsw i64 %.01, 614
  %4917 = call zeroext i8 @randombit()
  %4918 = getelementptr inbounds i8, i8* %1, i64 %4916
  store i8 %4917, i8* %4918, align 1
  %4919 = icmp eq i8 %4917, 0
  br i1 %4919, label %4920, label %4923

4920:                                             ; preds = %4915
  %4921 = shl nuw nsw i64 %4916, 4
  %4922 = getelementptr inbounds i8, i8* %0, i64 %4921
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4922, i8 0, i64 16, i1 false)
  br label %4923

4923:                                             ; preds = %4920, %4915
  %4924 = add nuw nsw i64 %.01, 615
  %4925 = call zeroext i8 @randombit()
  %4926 = getelementptr inbounds i8, i8* %1, i64 %4924
  store i8 %4925, i8* %4926, align 1
  %4927 = icmp eq i8 %4925, 0
  br i1 %4927, label %4928, label %4931

4928:                                             ; preds = %4923
  %4929 = shl nuw nsw i64 %4924, 4
  %4930 = getelementptr inbounds i8, i8* %0, i64 %4929
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4930, i8 0, i64 16, i1 false)
  br label %4931

4931:                                             ; preds = %4928, %4923
  %4932 = add nuw nsw i64 %.01, 616
  %4933 = call zeroext i8 @randombit()
  %4934 = getelementptr inbounds i8, i8* %1, i64 %4932
  store i8 %4933, i8* %4934, align 1
  %4935 = icmp eq i8 %4933, 0
  br i1 %4935, label %4936, label %4939

4936:                                             ; preds = %4931
  %4937 = shl nuw nsw i64 %4932, 4
  %4938 = getelementptr inbounds i8, i8* %0, i64 %4937
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4938, i8 0, i64 16, i1 false)
  br label %4939

4939:                                             ; preds = %4936, %4931
  %4940 = add nuw nsw i64 %.01, 617
  %4941 = call zeroext i8 @randombit()
  %4942 = getelementptr inbounds i8, i8* %1, i64 %4940
  store i8 %4941, i8* %4942, align 1
  %4943 = icmp eq i8 %4941, 0
  br i1 %4943, label %4944, label %4947

4944:                                             ; preds = %4939
  %4945 = shl nuw nsw i64 %4940, 4
  %4946 = getelementptr inbounds i8, i8* %0, i64 %4945
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4946, i8 0, i64 16, i1 false)
  br label %4947

4947:                                             ; preds = %4944, %4939
  %4948 = add nuw nsw i64 %.01, 618
  %4949 = call zeroext i8 @randombit()
  %4950 = getelementptr inbounds i8, i8* %1, i64 %4948
  store i8 %4949, i8* %4950, align 1
  %4951 = icmp eq i8 %4949, 0
  br i1 %4951, label %4952, label %4955

4952:                                             ; preds = %4947
  %4953 = shl nuw nsw i64 %4948, 4
  %4954 = getelementptr inbounds i8, i8* %0, i64 %4953
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4954, i8 0, i64 16, i1 false)
  br label %4955

4955:                                             ; preds = %4952, %4947
  %4956 = add nuw nsw i64 %.01, 619
  %4957 = call zeroext i8 @randombit()
  %4958 = getelementptr inbounds i8, i8* %1, i64 %4956
  store i8 %4957, i8* %4958, align 1
  %4959 = icmp eq i8 %4957, 0
  br i1 %4959, label %4960, label %4963

4960:                                             ; preds = %4955
  %4961 = shl nuw nsw i64 %4956, 4
  %4962 = getelementptr inbounds i8, i8* %0, i64 %4961
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4962, i8 0, i64 16, i1 false)
  br label %4963

4963:                                             ; preds = %4960, %4955
  %4964 = add nuw nsw i64 %.01, 620
  %4965 = call zeroext i8 @randombit()
  %4966 = getelementptr inbounds i8, i8* %1, i64 %4964
  store i8 %4965, i8* %4966, align 1
  %4967 = icmp eq i8 %4965, 0
  br i1 %4967, label %4968, label %4971

4968:                                             ; preds = %4963
  %4969 = shl nuw nsw i64 %4964, 4
  %4970 = getelementptr inbounds i8, i8* %0, i64 %4969
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4970, i8 0, i64 16, i1 false)
  br label %4971

4971:                                             ; preds = %4968, %4963
  %4972 = add nuw nsw i64 %.01, 621
  %4973 = call zeroext i8 @randombit()
  %4974 = getelementptr inbounds i8, i8* %1, i64 %4972
  store i8 %4973, i8* %4974, align 1
  %4975 = icmp eq i8 %4973, 0
  br i1 %4975, label %4976, label %4979

4976:                                             ; preds = %4971
  %4977 = shl nuw nsw i64 %4972, 4
  %4978 = getelementptr inbounds i8, i8* %0, i64 %4977
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4978, i8 0, i64 16, i1 false)
  br label %4979

4979:                                             ; preds = %4976, %4971
  %4980 = add nuw nsw i64 %.01, 622
  %4981 = call zeroext i8 @randombit()
  %4982 = getelementptr inbounds i8, i8* %1, i64 %4980
  store i8 %4981, i8* %4982, align 1
  %4983 = icmp eq i8 %4981, 0
  br i1 %4983, label %4984, label %4987

4984:                                             ; preds = %4979
  %4985 = shl nuw nsw i64 %4980, 4
  %4986 = getelementptr inbounds i8, i8* %0, i64 %4985
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4986, i8 0, i64 16, i1 false)
  br label %4987

4987:                                             ; preds = %4984, %4979
  %4988 = add nuw nsw i64 %.01, 623
  %4989 = call zeroext i8 @randombit()
  %4990 = getelementptr inbounds i8, i8* %1, i64 %4988
  store i8 %4989, i8* %4990, align 1
  %4991 = icmp eq i8 %4989, 0
  br i1 %4991, label %4992, label %4995

4992:                                             ; preds = %4987
  %4993 = shl nuw nsw i64 %4988, 4
  %4994 = getelementptr inbounds i8, i8* %0, i64 %4993
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %4994, i8 0, i64 16, i1 false)
  br label %4995

4995:                                             ; preds = %4992, %4987
  %4996 = add nuw nsw i64 %.01, 624
  %4997 = call zeroext i8 @randombit()
  %4998 = getelementptr inbounds i8, i8* %1, i64 %4996
  store i8 %4997, i8* %4998, align 1
  %4999 = icmp eq i8 %4997, 0
  br i1 %4999, label %5000, label %5003

5000:                                             ; preds = %4995
  %5001 = shl nuw nsw i64 %4996, 4
  %5002 = getelementptr inbounds i8, i8* %0, i64 %5001
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5002, i8 0, i64 16, i1 false)
  br label %5003

5003:                                             ; preds = %5000, %4995
  %5004 = add nuw nsw i64 %.01, 625
  %5005 = call zeroext i8 @randombit()
  %5006 = getelementptr inbounds i8, i8* %1, i64 %5004
  store i8 %5005, i8* %5006, align 1
  %5007 = icmp eq i8 %5005, 0
  br i1 %5007, label %5008, label %5011

5008:                                             ; preds = %5003
  %5009 = shl nuw nsw i64 %5004, 4
  %5010 = getelementptr inbounds i8, i8* %0, i64 %5009
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5010, i8 0, i64 16, i1 false)
  br label %5011

5011:                                             ; preds = %5008, %5003
  %5012 = add nuw nsw i64 %.01, 626
  %5013 = call zeroext i8 @randombit()
  %5014 = getelementptr inbounds i8, i8* %1, i64 %5012
  store i8 %5013, i8* %5014, align 1
  %5015 = icmp eq i8 %5013, 0
  br i1 %5015, label %5016, label %5019

5016:                                             ; preds = %5011
  %5017 = shl nuw nsw i64 %5012, 4
  %5018 = getelementptr inbounds i8, i8* %0, i64 %5017
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5018, i8 0, i64 16, i1 false)
  br label %5019

5019:                                             ; preds = %5016, %5011
  %5020 = add nuw nsw i64 %.01, 627
  %5021 = call zeroext i8 @randombit()
  %5022 = getelementptr inbounds i8, i8* %1, i64 %5020
  store i8 %5021, i8* %5022, align 1
  %5023 = icmp eq i8 %5021, 0
  br i1 %5023, label %5024, label %5027

5024:                                             ; preds = %5019
  %5025 = shl nuw nsw i64 %5020, 4
  %5026 = getelementptr inbounds i8, i8* %0, i64 %5025
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5026, i8 0, i64 16, i1 false)
  br label %5027

5027:                                             ; preds = %5024, %5019
  %5028 = add nuw nsw i64 %.01, 628
  %5029 = call zeroext i8 @randombit()
  %5030 = getelementptr inbounds i8, i8* %1, i64 %5028
  store i8 %5029, i8* %5030, align 1
  %5031 = icmp eq i8 %5029, 0
  br i1 %5031, label %5032, label %5035

5032:                                             ; preds = %5027
  %5033 = shl nuw nsw i64 %5028, 4
  %5034 = getelementptr inbounds i8, i8* %0, i64 %5033
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5034, i8 0, i64 16, i1 false)
  br label %5035

5035:                                             ; preds = %5032, %5027
  %5036 = add nuw nsw i64 %.01, 629
  %5037 = call zeroext i8 @randombit()
  %5038 = getelementptr inbounds i8, i8* %1, i64 %5036
  store i8 %5037, i8* %5038, align 1
  %5039 = icmp eq i8 %5037, 0
  br i1 %5039, label %5040, label %5043

5040:                                             ; preds = %5035
  %5041 = shl nuw nsw i64 %5036, 4
  %5042 = getelementptr inbounds i8, i8* %0, i64 %5041
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5042, i8 0, i64 16, i1 false)
  br label %5043

5043:                                             ; preds = %5040, %5035
  %5044 = add nuw nsw i64 %.01, 630
  %5045 = call zeroext i8 @randombit()
  %5046 = getelementptr inbounds i8, i8* %1, i64 %5044
  store i8 %5045, i8* %5046, align 1
  %5047 = icmp eq i8 %5045, 0
  br i1 %5047, label %5048, label %5051

5048:                                             ; preds = %5043
  %5049 = shl nuw nsw i64 %5044, 4
  %5050 = getelementptr inbounds i8, i8* %0, i64 %5049
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5050, i8 0, i64 16, i1 false)
  br label %5051

5051:                                             ; preds = %5048, %5043
  %5052 = add nuw nsw i64 %.01, 631
  %5053 = call zeroext i8 @randombit()
  %5054 = getelementptr inbounds i8, i8* %1, i64 %5052
  store i8 %5053, i8* %5054, align 1
  %5055 = icmp eq i8 %5053, 0
  br i1 %5055, label %5056, label %5059

5056:                                             ; preds = %5051
  %5057 = shl nuw nsw i64 %5052, 4
  %5058 = getelementptr inbounds i8, i8* %0, i64 %5057
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5058, i8 0, i64 16, i1 false)
  br label %5059

5059:                                             ; preds = %5056, %5051
  %5060 = add nuw nsw i64 %.01, 632
  %5061 = call zeroext i8 @randombit()
  %5062 = getelementptr inbounds i8, i8* %1, i64 %5060
  store i8 %5061, i8* %5062, align 1
  %5063 = icmp eq i8 %5061, 0
  br i1 %5063, label %5064, label %5067

5064:                                             ; preds = %5059
  %5065 = shl nuw nsw i64 %5060, 4
  %5066 = getelementptr inbounds i8, i8* %0, i64 %5065
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5066, i8 0, i64 16, i1 false)
  br label %5067

5067:                                             ; preds = %5064, %5059
  %5068 = add nuw nsw i64 %.01, 633
  %5069 = call zeroext i8 @randombit()
  %5070 = getelementptr inbounds i8, i8* %1, i64 %5068
  store i8 %5069, i8* %5070, align 1
  %5071 = icmp eq i8 %5069, 0
  br i1 %5071, label %5072, label %5075

5072:                                             ; preds = %5067
  %5073 = shl nuw nsw i64 %5068, 4
  %5074 = getelementptr inbounds i8, i8* %0, i64 %5073
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5074, i8 0, i64 16, i1 false)
  br label %5075

5075:                                             ; preds = %5072, %5067
  %5076 = add nuw nsw i64 %.01, 634
  %5077 = call zeroext i8 @randombit()
  %5078 = getelementptr inbounds i8, i8* %1, i64 %5076
  store i8 %5077, i8* %5078, align 1
  %5079 = icmp eq i8 %5077, 0
  br i1 %5079, label %5080, label %5083

5080:                                             ; preds = %5075
  %5081 = shl nuw nsw i64 %5076, 4
  %5082 = getelementptr inbounds i8, i8* %0, i64 %5081
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5082, i8 0, i64 16, i1 false)
  br label %5083

5083:                                             ; preds = %5080, %5075
  %5084 = add nuw nsw i64 %.01, 635
  %5085 = call zeroext i8 @randombit()
  %5086 = getelementptr inbounds i8, i8* %1, i64 %5084
  store i8 %5085, i8* %5086, align 1
  %5087 = icmp eq i8 %5085, 0
  br i1 %5087, label %5088, label %5091

5088:                                             ; preds = %5083
  %5089 = shl nuw nsw i64 %5084, 4
  %5090 = getelementptr inbounds i8, i8* %0, i64 %5089
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5090, i8 0, i64 16, i1 false)
  br label %5091

5091:                                             ; preds = %5088, %5083
  %5092 = add nuw nsw i64 %.01, 636
  %5093 = call zeroext i8 @randombit()
  %5094 = getelementptr inbounds i8, i8* %1, i64 %5092
  store i8 %5093, i8* %5094, align 1
  %5095 = icmp eq i8 %5093, 0
  br i1 %5095, label %5096, label %5099

5096:                                             ; preds = %5091
  %5097 = shl nuw nsw i64 %5092, 4
  %5098 = getelementptr inbounds i8, i8* %0, i64 %5097
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5098, i8 0, i64 16, i1 false)
  br label %5099

5099:                                             ; preds = %5096, %5091
  %5100 = add nuw nsw i64 %.01, 637
  %5101 = call zeroext i8 @randombit()
  %5102 = getelementptr inbounds i8, i8* %1, i64 %5100
  store i8 %5101, i8* %5102, align 1
  %5103 = icmp eq i8 %5101, 0
  br i1 %5103, label %5104, label %5107

5104:                                             ; preds = %5099
  %5105 = shl nuw nsw i64 %5100, 4
  %5106 = getelementptr inbounds i8, i8* %0, i64 %5105
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5106, i8 0, i64 16, i1 false)
  br label %5107

5107:                                             ; preds = %5104, %5099
  %5108 = add nuw nsw i64 %.01, 638
  %5109 = call zeroext i8 @randombit()
  %5110 = getelementptr inbounds i8, i8* %1, i64 %5108
  store i8 %5109, i8* %5110, align 1
  %5111 = icmp eq i8 %5109, 0
  br i1 %5111, label %5112, label %5115

5112:                                             ; preds = %5107
  %5113 = shl nuw nsw i64 %5108, 4
  %5114 = getelementptr inbounds i8, i8* %0, i64 %5113
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5114, i8 0, i64 16, i1 false)
  br label %5115

5115:                                             ; preds = %5112, %5107
  %5116 = add nuw nsw i64 %.01, 639
  %5117 = call zeroext i8 @randombit()
  %5118 = getelementptr inbounds i8, i8* %1, i64 %5116
  store i8 %5117, i8* %5118, align 1
  %5119 = icmp eq i8 %5117, 0
  br i1 %5119, label %5120, label %5123

5120:                                             ; preds = %5115
  %5121 = shl nuw nsw i64 %5116, 4
  %5122 = getelementptr inbounds i8, i8* %0, i64 %5121
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5122, i8 0, i64 16, i1 false)
  br label %5123

5123:                                             ; preds = %5120, %5115
  %5124 = add nuw nsw i64 %.01, 640
  %5125 = call zeroext i8 @randombit()
  %5126 = getelementptr inbounds i8, i8* %1, i64 %5124
  store i8 %5125, i8* %5126, align 1
  %5127 = icmp eq i8 %5125, 0
  br i1 %5127, label %5128, label %5131

5128:                                             ; preds = %5123
  %5129 = shl nuw nsw i64 %5124, 4
  %5130 = getelementptr inbounds i8, i8* %0, i64 %5129
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5130, i8 0, i64 16, i1 false)
  br label %5131

5131:                                             ; preds = %5128, %5123
  %5132 = add nuw nsw i64 %.01, 641
  %5133 = call zeroext i8 @randombit()
  %5134 = getelementptr inbounds i8, i8* %1, i64 %5132
  store i8 %5133, i8* %5134, align 1
  %5135 = icmp eq i8 %5133, 0
  br i1 %5135, label %5136, label %5139

5136:                                             ; preds = %5131
  %5137 = shl nuw nsw i64 %5132, 4
  %5138 = getelementptr inbounds i8, i8* %0, i64 %5137
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5138, i8 0, i64 16, i1 false)
  br label %5139

5139:                                             ; preds = %5136, %5131
  %5140 = add nuw nsw i64 %.01, 642
  %5141 = call zeroext i8 @randombit()
  %5142 = getelementptr inbounds i8, i8* %1, i64 %5140
  store i8 %5141, i8* %5142, align 1
  %5143 = icmp eq i8 %5141, 0
  br i1 %5143, label %5144, label %5147

5144:                                             ; preds = %5139
  %5145 = shl nuw nsw i64 %5140, 4
  %5146 = getelementptr inbounds i8, i8* %0, i64 %5145
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5146, i8 0, i64 16, i1 false)
  br label %5147

5147:                                             ; preds = %5144, %5139
  %5148 = add nuw nsw i64 %.01, 643
  %5149 = call zeroext i8 @randombit()
  %5150 = getelementptr inbounds i8, i8* %1, i64 %5148
  store i8 %5149, i8* %5150, align 1
  %5151 = icmp eq i8 %5149, 0
  br i1 %5151, label %5152, label %5155

5152:                                             ; preds = %5147
  %5153 = shl nuw nsw i64 %5148, 4
  %5154 = getelementptr inbounds i8, i8* %0, i64 %5153
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5154, i8 0, i64 16, i1 false)
  br label %5155

5155:                                             ; preds = %5152, %5147
  %5156 = add nuw nsw i64 %.01, 644
  %5157 = call zeroext i8 @randombit()
  %5158 = getelementptr inbounds i8, i8* %1, i64 %5156
  store i8 %5157, i8* %5158, align 1
  %5159 = icmp eq i8 %5157, 0
  br i1 %5159, label %5160, label %5163

5160:                                             ; preds = %5155
  %5161 = shl nuw nsw i64 %5156, 4
  %5162 = getelementptr inbounds i8, i8* %0, i64 %5161
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5162, i8 0, i64 16, i1 false)
  br label %5163

5163:                                             ; preds = %5160, %5155
  %5164 = add nuw nsw i64 %.01, 645
  %5165 = call zeroext i8 @randombit()
  %5166 = getelementptr inbounds i8, i8* %1, i64 %5164
  store i8 %5165, i8* %5166, align 1
  %5167 = icmp eq i8 %5165, 0
  br i1 %5167, label %5168, label %5171

5168:                                             ; preds = %5163
  %5169 = shl nuw nsw i64 %5164, 4
  %5170 = getelementptr inbounds i8, i8* %0, i64 %5169
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5170, i8 0, i64 16, i1 false)
  br label %5171

5171:                                             ; preds = %5168, %5163
  %5172 = add nuw nsw i64 %.01, 646
  %5173 = call zeroext i8 @randombit()
  %5174 = getelementptr inbounds i8, i8* %1, i64 %5172
  store i8 %5173, i8* %5174, align 1
  %5175 = icmp eq i8 %5173, 0
  br i1 %5175, label %5176, label %5179

5176:                                             ; preds = %5171
  %5177 = shl nuw nsw i64 %5172, 4
  %5178 = getelementptr inbounds i8, i8* %0, i64 %5177
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5178, i8 0, i64 16, i1 false)
  br label %5179

5179:                                             ; preds = %5176, %5171
  %5180 = add nuw nsw i64 %.01, 647
  %5181 = call zeroext i8 @randombit()
  %5182 = getelementptr inbounds i8, i8* %1, i64 %5180
  store i8 %5181, i8* %5182, align 1
  %5183 = icmp eq i8 %5181, 0
  br i1 %5183, label %5184, label %5187

5184:                                             ; preds = %5179
  %5185 = shl nuw nsw i64 %5180, 4
  %5186 = getelementptr inbounds i8, i8* %0, i64 %5185
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5186, i8 0, i64 16, i1 false)
  br label %5187

5187:                                             ; preds = %5184, %5179
  %5188 = add nuw nsw i64 %.01, 648
  %5189 = call zeroext i8 @randombit()
  %5190 = getelementptr inbounds i8, i8* %1, i64 %5188
  store i8 %5189, i8* %5190, align 1
  %5191 = icmp eq i8 %5189, 0
  br i1 %5191, label %5192, label %5195

5192:                                             ; preds = %5187
  %5193 = shl nuw nsw i64 %5188, 4
  %5194 = getelementptr inbounds i8, i8* %0, i64 %5193
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5194, i8 0, i64 16, i1 false)
  br label %5195

5195:                                             ; preds = %5192, %5187
  %5196 = add nuw nsw i64 %.01, 649
  %5197 = call zeroext i8 @randombit()
  %5198 = getelementptr inbounds i8, i8* %1, i64 %5196
  store i8 %5197, i8* %5198, align 1
  %5199 = icmp eq i8 %5197, 0
  br i1 %5199, label %5200, label %5203

5200:                                             ; preds = %5195
  %5201 = shl nuw nsw i64 %5196, 4
  %5202 = getelementptr inbounds i8, i8* %0, i64 %5201
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5202, i8 0, i64 16, i1 false)
  br label %5203

5203:                                             ; preds = %5200, %5195
  %5204 = add nuw nsw i64 %.01, 650
  %5205 = call zeroext i8 @randombit()
  %5206 = getelementptr inbounds i8, i8* %1, i64 %5204
  store i8 %5205, i8* %5206, align 1
  %5207 = icmp eq i8 %5205, 0
  br i1 %5207, label %5208, label %5211

5208:                                             ; preds = %5203
  %5209 = shl nuw nsw i64 %5204, 4
  %5210 = getelementptr inbounds i8, i8* %0, i64 %5209
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5210, i8 0, i64 16, i1 false)
  br label %5211

5211:                                             ; preds = %5208, %5203
  %5212 = add nuw nsw i64 %.01, 651
  %5213 = call zeroext i8 @randombit()
  %5214 = getelementptr inbounds i8, i8* %1, i64 %5212
  store i8 %5213, i8* %5214, align 1
  %5215 = icmp eq i8 %5213, 0
  br i1 %5215, label %5216, label %5219

5216:                                             ; preds = %5211
  %5217 = shl nuw nsw i64 %5212, 4
  %5218 = getelementptr inbounds i8, i8* %0, i64 %5217
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5218, i8 0, i64 16, i1 false)
  br label %5219

5219:                                             ; preds = %5216, %5211
  %5220 = add nuw nsw i64 %.01, 652
  %5221 = call zeroext i8 @randombit()
  %5222 = getelementptr inbounds i8, i8* %1, i64 %5220
  store i8 %5221, i8* %5222, align 1
  %5223 = icmp eq i8 %5221, 0
  br i1 %5223, label %5224, label %5227

5224:                                             ; preds = %5219
  %5225 = shl nuw nsw i64 %5220, 4
  %5226 = getelementptr inbounds i8, i8* %0, i64 %5225
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5226, i8 0, i64 16, i1 false)
  br label %5227

5227:                                             ; preds = %5224, %5219
  %5228 = add nuw nsw i64 %.01, 653
  %5229 = call zeroext i8 @randombit()
  %5230 = getelementptr inbounds i8, i8* %1, i64 %5228
  store i8 %5229, i8* %5230, align 1
  %5231 = icmp eq i8 %5229, 0
  br i1 %5231, label %5232, label %5235

5232:                                             ; preds = %5227
  %5233 = shl nuw nsw i64 %5228, 4
  %5234 = getelementptr inbounds i8, i8* %0, i64 %5233
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5234, i8 0, i64 16, i1 false)
  br label %5235

5235:                                             ; preds = %5232, %5227
  %5236 = add nuw nsw i64 %.01, 654
  %5237 = call zeroext i8 @randombit()
  %5238 = getelementptr inbounds i8, i8* %1, i64 %5236
  store i8 %5237, i8* %5238, align 1
  %5239 = icmp eq i8 %5237, 0
  br i1 %5239, label %5240, label %5243

5240:                                             ; preds = %5235
  %5241 = shl nuw nsw i64 %5236, 4
  %5242 = getelementptr inbounds i8, i8* %0, i64 %5241
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5242, i8 0, i64 16, i1 false)
  br label %5243

5243:                                             ; preds = %5240, %5235
  %5244 = add nuw nsw i64 %.01, 655
  %5245 = call zeroext i8 @randombit()
  %5246 = getelementptr inbounds i8, i8* %1, i64 %5244
  store i8 %5245, i8* %5246, align 1
  %5247 = icmp eq i8 %5245, 0
  br i1 %5247, label %5248, label %5251

5248:                                             ; preds = %5243
  %5249 = shl nuw nsw i64 %5244, 4
  %5250 = getelementptr inbounds i8, i8* %0, i64 %5249
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5250, i8 0, i64 16, i1 false)
  br label %5251

5251:                                             ; preds = %5248, %5243
  %5252 = add nuw nsw i64 %.01, 656
  %5253 = call zeroext i8 @randombit()
  %5254 = getelementptr inbounds i8, i8* %1, i64 %5252
  store i8 %5253, i8* %5254, align 1
  %5255 = icmp eq i8 %5253, 0
  br i1 %5255, label %5256, label %5259

5256:                                             ; preds = %5251
  %5257 = shl nuw nsw i64 %5252, 4
  %5258 = getelementptr inbounds i8, i8* %0, i64 %5257
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5258, i8 0, i64 16, i1 false)
  br label %5259

5259:                                             ; preds = %5256, %5251
  %5260 = add nuw nsw i64 %.01, 657
  %5261 = call zeroext i8 @randombit()
  %5262 = getelementptr inbounds i8, i8* %1, i64 %5260
  store i8 %5261, i8* %5262, align 1
  %5263 = icmp eq i8 %5261, 0
  br i1 %5263, label %5264, label %5267

5264:                                             ; preds = %5259
  %5265 = shl nuw nsw i64 %5260, 4
  %5266 = getelementptr inbounds i8, i8* %0, i64 %5265
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5266, i8 0, i64 16, i1 false)
  br label %5267

5267:                                             ; preds = %5264, %5259
  %5268 = add nuw nsw i64 %.01, 658
  %5269 = call zeroext i8 @randombit()
  %5270 = getelementptr inbounds i8, i8* %1, i64 %5268
  store i8 %5269, i8* %5270, align 1
  %5271 = icmp eq i8 %5269, 0
  br i1 %5271, label %5272, label %5275

5272:                                             ; preds = %5267
  %5273 = shl nuw nsw i64 %5268, 4
  %5274 = getelementptr inbounds i8, i8* %0, i64 %5273
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5274, i8 0, i64 16, i1 false)
  br label %5275

5275:                                             ; preds = %5272, %5267
  %5276 = add nuw nsw i64 %.01, 659
  %5277 = call zeroext i8 @randombit()
  %5278 = getelementptr inbounds i8, i8* %1, i64 %5276
  store i8 %5277, i8* %5278, align 1
  %5279 = icmp eq i8 %5277, 0
  br i1 %5279, label %5280, label %5283

5280:                                             ; preds = %5275
  %5281 = shl nuw nsw i64 %5276, 4
  %5282 = getelementptr inbounds i8, i8* %0, i64 %5281
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5282, i8 0, i64 16, i1 false)
  br label %5283

5283:                                             ; preds = %5280, %5275
  %5284 = add nuw nsw i64 %.01, 660
  %5285 = call zeroext i8 @randombit()
  %5286 = getelementptr inbounds i8, i8* %1, i64 %5284
  store i8 %5285, i8* %5286, align 1
  %5287 = icmp eq i8 %5285, 0
  br i1 %5287, label %5288, label %5291

5288:                                             ; preds = %5283
  %5289 = shl nuw nsw i64 %5284, 4
  %5290 = getelementptr inbounds i8, i8* %0, i64 %5289
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5290, i8 0, i64 16, i1 false)
  br label %5291

5291:                                             ; preds = %5288, %5283
  %5292 = add nuw nsw i64 %.01, 661
  %5293 = call zeroext i8 @randombit()
  %5294 = getelementptr inbounds i8, i8* %1, i64 %5292
  store i8 %5293, i8* %5294, align 1
  %5295 = icmp eq i8 %5293, 0
  br i1 %5295, label %5296, label %5299

5296:                                             ; preds = %5291
  %5297 = shl nuw nsw i64 %5292, 4
  %5298 = getelementptr inbounds i8, i8* %0, i64 %5297
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5298, i8 0, i64 16, i1 false)
  br label %5299

5299:                                             ; preds = %5296, %5291
  %5300 = add nuw nsw i64 %.01, 662
  %5301 = call zeroext i8 @randombit()
  %5302 = getelementptr inbounds i8, i8* %1, i64 %5300
  store i8 %5301, i8* %5302, align 1
  %5303 = icmp eq i8 %5301, 0
  br i1 %5303, label %5304, label %5307

5304:                                             ; preds = %5299
  %5305 = shl nuw nsw i64 %5300, 4
  %5306 = getelementptr inbounds i8, i8* %0, i64 %5305
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5306, i8 0, i64 16, i1 false)
  br label %5307

5307:                                             ; preds = %5304, %5299
  %5308 = add nuw nsw i64 %.01, 663
  %5309 = call zeroext i8 @randombit()
  %5310 = getelementptr inbounds i8, i8* %1, i64 %5308
  store i8 %5309, i8* %5310, align 1
  %5311 = icmp eq i8 %5309, 0
  br i1 %5311, label %5312, label %5315

5312:                                             ; preds = %5307
  %5313 = shl nuw nsw i64 %5308, 4
  %5314 = getelementptr inbounds i8, i8* %0, i64 %5313
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5314, i8 0, i64 16, i1 false)
  br label %5315

5315:                                             ; preds = %5312, %5307
  %5316 = add nuw nsw i64 %.01, 664
  %5317 = call zeroext i8 @randombit()
  %5318 = getelementptr inbounds i8, i8* %1, i64 %5316
  store i8 %5317, i8* %5318, align 1
  %5319 = icmp eq i8 %5317, 0
  br i1 %5319, label %5320, label %5323

5320:                                             ; preds = %5315
  %5321 = shl nuw nsw i64 %5316, 4
  %5322 = getelementptr inbounds i8, i8* %0, i64 %5321
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5322, i8 0, i64 16, i1 false)
  br label %5323

5323:                                             ; preds = %5320, %5315
  %5324 = add nuw nsw i64 %.01, 665
  %5325 = call zeroext i8 @randombit()
  %5326 = getelementptr inbounds i8, i8* %1, i64 %5324
  store i8 %5325, i8* %5326, align 1
  %5327 = icmp eq i8 %5325, 0
  br i1 %5327, label %5328, label %5331

5328:                                             ; preds = %5323
  %5329 = shl nuw nsw i64 %5324, 4
  %5330 = getelementptr inbounds i8, i8* %0, i64 %5329
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5330, i8 0, i64 16, i1 false)
  br label %5331

5331:                                             ; preds = %5328, %5323
  %5332 = add nuw nsw i64 %.01, 666
  %5333 = call zeroext i8 @randombit()
  %5334 = getelementptr inbounds i8, i8* %1, i64 %5332
  store i8 %5333, i8* %5334, align 1
  %5335 = icmp eq i8 %5333, 0
  br i1 %5335, label %5336, label %5339

5336:                                             ; preds = %5331
  %5337 = shl nuw nsw i64 %5332, 4
  %5338 = getelementptr inbounds i8, i8* %0, i64 %5337
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5338, i8 0, i64 16, i1 false)
  br label %5339

5339:                                             ; preds = %5336, %5331
  %5340 = add nuw nsw i64 %.01, 667
  %5341 = call zeroext i8 @randombit()
  %5342 = getelementptr inbounds i8, i8* %1, i64 %5340
  store i8 %5341, i8* %5342, align 1
  %5343 = icmp eq i8 %5341, 0
  br i1 %5343, label %5344, label %5347

5344:                                             ; preds = %5339
  %5345 = shl nuw nsw i64 %5340, 4
  %5346 = getelementptr inbounds i8, i8* %0, i64 %5345
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5346, i8 0, i64 16, i1 false)
  br label %5347

5347:                                             ; preds = %5344, %5339
  %5348 = add nuw nsw i64 %.01, 668
  %5349 = call zeroext i8 @randombit()
  %5350 = getelementptr inbounds i8, i8* %1, i64 %5348
  store i8 %5349, i8* %5350, align 1
  %5351 = icmp eq i8 %5349, 0
  br i1 %5351, label %5352, label %5355

5352:                                             ; preds = %5347
  %5353 = shl nuw nsw i64 %5348, 4
  %5354 = getelementptr inbounds i8, i8* %0, i64 %5353
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5354, i8 0, i64 16, i1 false)
  br label %5355

5355:                                             ; preds = %5352, %5347
  %5356 = add nuw nsw i64 %.01, 669
  %5357 = call zeroext i8 @randombit()
  %5358 = getelementptr inbounds i8, i8* %1, i64 %5356
  store i8 %5357, i8* %5358, align 1
  %5359 = icmp eq i8 %5357, 0
  br i1 %5359, label %5360, label %5363

5360:                                             ; preds = %5355
  %5361 = shl nuw nsw i64 %5356, 4
  %5362 = getelementptr inbounds i8, i8* %0, i64 %5361
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5362, i8 0, i64 16, i1 false)
  br label %5363

5363:                                             ; preds = %5360, %5355
  %5364 = add nuw nsw i64 %.01, 670
  %5365 = call zeroext i8 @randombit()
  %5366 = getelementptr inbounds i8, i8* %1, i64 %5364
  store i8 %5365, i8* %5366, align 1
  %5367 = icmp eq i8 %5365, 0
  br i1 %5367, label %5368, label %5371

5368:                                             ; preds = %5363
  %5369 = shl nuw nsw i64 %5364, 4
  %5370 = getelementptr inbounds i8, i8* %0, i64 %5369
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5370, i8 0, i64 16, i1 false)
  br label %5371

5371:                                             ; preds = %5368, %5363
  %5372 = add nuw nsw i64 %.01, 671
  %5373 = call zeroext i8 @randombit()
  %5374 = getelementptr inbounds i8, i8* %1, i64 %5372
  store i8 %5373, i8* %5374, align 1
  %5375 = icmp eq i8 %5373, 0
  br i1 %5375, label %5376, label %5379

5376:                                             ; preds = %5371
  %5377 = shl nuw nsw i64 %5372, 4
  %5378 = getelementptr inbounds i8, i8* %0, i64 %5377
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5378, i8 0, i64 16, i1 false)
  br label %5379

5379:                                             ; preds = %5376, %5371
  %5380 = add nuw nsw i64 %.01, 672
  %5381 = call zeroext i8 @randombit()
  %5382 = getelementptr inbounds i8, i8* %1, i64 %5380
  store i8 %5381, i8* %5382, align 1
  %5383 = icmp eq i8 %5381, 0
  br i1 %5383, label %5384, label %5387

5384:                                             ; preds = %5379
  %5385 = shl nuw nsw i64 %5380, 4
  %5386 = getelementptr inbounds i8, i8* %0, i64 %5385
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5386, i8 0, i64 16, i1 false)
  br label %5387

5387:                                             ; preds = %5384, %5379
  %5388 = add nuw nsw i64 %.01, 673
  %5389 = call zeroext i8 @randombit()
  %5390 = getelementptr inbounds i8, i8* %1, i64 %5388
  store i8 %5389, i8* %5390, align 1
  %5391 = icmp eq i8 %5389, 0
  br i1 %5391, label %5392, label %5395

5392:                                             ; preds = %5387
  %5393 = shl nuw nsw i64 %5388, 4
  %5394 = getelementptr inbounds i8, i8* %0, i64 %5393
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5394, i8 0, i64 16, i1 false)
  br label %5395

5395:                                             ; preds = %5392, %5387
  %5396 = add nuw nsw i64 %.01, 674
  %5397 = call zeroext i8 @randombit()
  %5398 = getelementptr inbounds i8, i8* %1, i64 %5396
  store i8 %5397, i8* %5398, align 1
  %5399 = icmp eq i8 %5397, 0
  br i1 %5399, label %5400, label %5403

5400:                                             ; preds = %5395
  %5401 = shl nuw nsw i64 %5396, 4
  %5402 = getelementptr inbounds i8, i8* %0, i64 %5401
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5402, i8 0, i64 16, i1 false)
  br label %5403

5403:                                             ; preds = %5400, %5395
  %5404 = add nuw nsw i64 %.01, 675
  %5405 = call zeroext i8 @randombit()
  %5406 = getelementptr inbounds i8, i8* %1, i64 %5404
  store i8 %5405, i8* %5406, align 1
  %5407 = icmp eq i8 %5405, 0
  br i1 %5407, label %5408, label %5411

5408:                                             ; preds = %5403
  %5409 = shl nuw nsw i64 %5404, 4
  %5410 = getelementptr inbounds i8, i8* %0, i64 %5409
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5410, i8 0, i64 16, i1 false)
  br label %5411

5411:                                             ; preds = %5408, %5403
  %5412 = add nuw nsw i64 %.01, 676
  %5413 = call zeroext i8 @randombit()
  %5414 = getelementptr inbounds i8, i8* %1, i64 %5412
  store i8 %5413, i8* %5414, align 1
  %5415 = icmp eq i8 %5413, 0
  br i1 %5415, label %5416, label %5419

5416:                                             ; preds = %5411
  %5417 = shl nuw nsw i64 %5412, 4
  %5418 = getelementptr inbounds i8, i8* %0, i64 %5417
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5418, i8 0, i64 16, i1 false)
  br label %5419

5419:                                             ; preds = %5416, %5411
  %5420 = add nuw nsw i64 %.01, 677
  %5421 = call zeroext i8 @randombit()
  %5422 = getelementptr inbounds i8, i8* %1, i64 %5420
  store i8 %5421, i8* %5422, align 1
  %5423 = icmp eq i8 %5421, 0
  br i1 %5423, label %5424, label %5427

5424:                                             ; preds = %5419
  %5425 = shl nuw nsw i64 %5420, 4
  %5426 = getelementptr inbounds i8, i8* %0, i64 %5425
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5426, i8 0, i64 16, i1 false)
  br label %5427

5427:                                             ; preds = %5424, %5419
  %5428 = add nuw nsw i64 %.01, 678
  %5429 = call zeroext i8 @randombit()
  %5430 = getelementptr inbounds i8, i8* %1, i64 %5428
  store i8 %5429, i8* %5430, align 1
  %5431 = icmp eq i8 %5429, 0
  br i1 %5431, label %5432, label %5435

5432:                                             ; preds = %5427
  %5433 = shl nuw nsw i64 %5428, 4
  %5434 = getelementptr inbounds i8, i8* %0, i64 %5433
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5434, i8 0, i64 16, i1 false)
  br label %5435

5435:                                             ; preds = %5432, %5427
  %5436 = add nuw nsw i64 %.01, 679
  %5437 = call zeroext i8 @randombit()
  %5438 = getelementptr inbounds i8, i8* %1, i64 %5436
  store i8 %5437, i8* %5438, align 1
  %5439 = icmp eq i8 %5437, 0
  br i1 %5439, label %5440, label %5443

5440:                                             ; preds = %5435
  %5441 = shl nuw nsw i64 %5436, 4
  %5442 = getelementptr inbounds i8, i8* %0, i64 %5441
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5442, i8 0, i64 16, i1 false)
  br label %5443

5443:                                             ; preds = %5440, %5435
  %5444 = add nuw nsw i64 %.01, 680
  %5445 = call zeroext i8 @randombit()
  %5446 = getelementptr inbounds i8, i8* %1, i64 %5444
  store i8 %5445, i8* %5446, align 1
  %5447 = icmp eq i8 %5445, 0
  br i1 %5447, label %5448, label %5451

5448:                                             ; preds = %5443
  %5449 = shl nuw nsw i64 %5444, 4
  %5450 = getelementptr inbounds i8, i8* %0, i64 %5449
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5450, i8 0, i64 16, i1 false)
  br label %5451

5451:                                             ; preds = %5448, %5443
  %5452 = add nuw nsw i64 %.01, 681
  %5453 = call zeroext i8 @randombit()
  %5454 = getelementptr inbounds i8, i8* %1, i64 %5452
  store i8 %5453, i8* %5454, align 1
  %5455 = icmp eq i8 %5453, 0
  br i1 %5455, label %5456, label %5459

5456:                                             ; preds = %5451
  %5457 = shl nuw nsw i64 %5452, 4
  %5458 = getelementptr inbounds i8, i8* %0, i64 %5457
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5458, i8 0, i64 16, i1 false)
  br label %5459

5459:                                             ; preds = %5456, %5451
  %5460 = add nuw nsw i64 %.01, 682
  %5461 = call zeroext i8 @randombit()
  %5462 = getelementptr inbounds i8, i8* %1, i64 %5460
  store i8 %5461, i8* %5462, align 1
  %5463 = icmp eq i8 %5461, 0
  br i1 %5463, label %5464, label %5467

5464:                                             ; preds = %5459
  %5465 = shl nuw nsw i64 %5460, 4
  %5466 = getelementptr inbounds i8, i8* %0, i64 %5465
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5466, i8 0, i64 16, i1 false)
  br label %5467

5467:                                             ; preds = %5464, %5459
  %5468 = add nuw nsw i64 %.01, 683
  %5469 = call zeroext i8 @randombit()
  %5470 = getelementptr inbounds i8, i8* %1, i64 %5468
  store i8 %5469, i8* %5470, align 1
  %5471 = icmp eq i8 %5469, 0
  br i1 %5471, label %5472, label %5475

5472:                                             ; preds = %5467
  %5473 = shl nuw nsw i64 %5468, 4
  %5474 = getelementptr inbounds i8, i8* %0, i64 %5473
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5474, i8 0, i64 16, i1 false)
  br label %5475

5475:                                             ; preds = %5472, %5467
  %5476 = add nuw nsw i64 %.01, 684
  %5477 = call zeroext i8 @randombit()
  %5478 = getelementptr inbounds i8, i8* %1, i64 %5476
  store i8 %5477, i8* %5478, align 1
  %5479 = icmp eq i8 %5477, 0
  br i1 %5479, label %5480, label %5483

5480:                                             ; preds = %5475
  %5481 = shl nuw nsw i64 %5476, 4
  %5482 = getelementptr inbounds i8, i8* %0, i64 %5481
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5482, i8 0, i64 16, i1 false)
  br label %5483

5483:                                             ; preds = %5480, %5475
  %5484 = add nuw nsw i64 %.01, 685
  %5485 = call zeroext i8 @randombit()
  %5486 = getelementptr inbounds i8, i8* %1, i64 %5484
  store i8 %5485, i8* %5486, align 1
  %5487 = icmp eq i8 %5485, 0
  br i1 %5487, label %5488, label %5491

5488:                                             ; preds = %5483
  %5489 = shl nuw nsw i64 %5484, 4
  %5490 = getelementptr inbounds i8, i8* %0, i64 %5489
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5490, i8 0, i64 16, i1 false)
  br label %5491

5491:                                             ; preds = %5488, %5483
  %5492 = add nuw nsw i64 %.01, 686
  %5493 = call zeroext i8 @randombit()
  %5494 = getelementptr inbounds i8, i8* %1, i64 %5492
  store i8 %5493, i8* %5494, align 1
  %5495 = icmp eq i8 %5493, 0
  br i1 %5495, label %5496, label %5499

5496:                                             ; preds = %5491
  %5497 = shl nuw nsw i64 %5492, 4
  %5498 = getelementptr inbounds i8, i8* %0, i64 %5497
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5498, i8 0, i64 16, i1 false)
  br label %5499

5499:                                             ; preds = %5496, %5491
  %5500 = add nuw nsw i64 %.01, 687
  %5501 = call zeroext i8 @randombit()
  %5502 = getelementptr inbounds i8, i8* %1, i64 %5500
  store i8 %5501, i8* %5502, align 1
  %5503 = icmp eq i8 %5501, 0
  br i1 %5503, label %5504, label %5507

5504:                                             ; preds = %5499
  %5505 = shl nuw nsw i64 %5500, 4
  %5506 = getelementptr inbounds i8, i8* %0, i64 %5505
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5506, i8 0, i64 16, i1 false)
  br label %5507

5507:                                             ; preds = %5504, %5499
  %5508 = add nuw nsw i64 %.01, 688
  %5509 = call zeroext i8 @randombit()
  %5510 = getelementptr inbounds i8, i8* %1, i64 %5508
  store i8 %5509, i8* %5510, align 1
  %5511 = icmp eq i8 %5509, 0
  br i1 %5511, label %5512, label %5515

5512:                                             ; preds = %5507
  %5513 = shl nuw nsw i64 %5508, 4
  %5514 = getelementptr inbounds i8, i8* %0, i64 %5513
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5514, i8 0, i64 16, i1 false)
  br label %5515

5515:                                             ; preds = %5512, %5507
  %5516 = add nuw nsw i64 %.01, 689
  %5517 = call zeroext i8 @randombit()
  %5518 = getelementptr inbounds i8, i8* %1, i64 %5516
  store i8 %5517, i8* %5518, align 1
  %5519 = icmp eq i8 %5517, 0
  br i1 %5519, label %5520, label %5523

5520:                                             ; preds = %5515
  %5521 = shl nuw nsw i64 %5516, 4
  %5522 = getelementptr inbounds i8, i8* %0, i64 %5521
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5522, i8 0, i64 16, i1 false)
  br label %5523

5523:                                             ; preds = %5520, %5515
  %5524 = add nuw nsw i64 %.01, 690
  %5525 = call zeroext i8 @randombit()
  %5526 = getelementptr inbounds i8, i8* %1, i64 %5524
  store i8 %5525, i8* %5526, align 1
  %5527 = icmp eq i8 %5525, 0
  br i1 %5527, label %5528, label %5531

5528:                                             ; preds = %5523
  %5529 = shl nuw nsw i64 %5524, 4
  %5530 = getelementptr inbounds i8, i8* %0, i64 %5529
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5530, i8 0, i64 16, i1 false)
  br label %5531

5531:                                             ; preds = %5528, %5523
  %5532 = add nuw nsw i64 %.01, 691
  %5533 = call zeroext i8 @randombit()
  %5534 = getelementptr inbounds i8, i8* %1, i64 %5532
  store i8 %5533, i8* %5534, align 1
  %5535 = icmp eq i8 %5533, 0
  br i1 %5535, label %5536, label %5539

5536:                                             ; preds = %5531
  %5537 = shl nuw nsw i64 %5532, 4
  %5538 = getelementptr inbounds i8, i8* %0, i64 %5537
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5538, i8 0, i64 16, i1 false)
  br label %5539

5539:                                             ; preds = %5536, %5531
  %5540 = add nuw nsw i64 %.01, 692
  %5541 = call zeroext i8 @randombit()
  %5542 = getelementptr inbounds i8, i8* %1, i64 %5540
  store i8 %5541, i8* %5542, align 1
  %5543 = icmp eq i8 %5541, 0
  br i1 %5543, label %5544, label %5547

5544:                                             ; preds = %5539
  %5545 = shl nuw nsw i64 %5540, 4
  %5546 = getelementptr inbounds i8, i8* %0, i64 %5545
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5546, i8 0, i64 16, i1 false)
  br label %5547

5547:                                             ; preds = %5544, %5539
  %5548 = add nuw nsw i64 %.01, 693
  %5549 = call zeroext i8 @randombit()
  %5550 = getelementptr inbounds i8, i8* %1, i64 %5548
  store i8 %5549, i8* %5550, align 1
  %5551 = icmp eq i8 %5549, 0
  br i1 %5551, label %5552, label %5555

5552:                                             ; preds = %5547
  %5553 = shl nuw nsw i64 %5548, 4
  %5554 = getelementptr inbounds i8, i8* %0, i64 %5553
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5554, i8 0, i64 16, i1 false)
  br label %5555

5555:                                             ; preds = %5552, %5547
  %5556 = add nuw nsw i64 %.01, 694
  %5557 = call zeroext i8 @randombit()
  %5558 = getelementptr inbounds i8, i8* %1, i64 %5556
  store i8 %5557, i8* %5558, align 1
  %5559 = icmp eq i8 %5557, 0
  br i1 %5559, label %5560, label %5563

5560:                                             ; preds = %5555
  %5561 = shl nuw nsw i64 %5556, 4
  %5562 = getelementptr inbounds i8, i8* %0, i64 %5561
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5562, i8 0, i64 16, i1 false)
  br label %5563

5563:                                             ; preds = %5560, %5555
  %5564 = add nuw nsw i64 %.01, 695
  %5565 = call zeroext i8 @randombit()
  %5566 = getelementptr inbounds i8, i8* %1, i64 %5564
  store i8 %5565, i8* %5566, align 1
  %5567 = icmp eq i8 %5565, 0
  br i1 %5567, label %5568, label %5571

5568:                                             ; preds = %5563
  %5569 = shl nuw nsw i64 %5564, 4
  %5570 = getelementptr inbounds i8, i8* %0, i64 %5569
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5570, i8 0, i64 16, i1 false)
  br label %5571

5571:                                             ; preds = %5568, %5563
  %5572 = add nuw nsw i64 %.01, 696
  %5573 = call zeroext i8 @randombit()
  %5574 = getelementptr inbounds i8, i8* %1, i64 %5572
  store i8 %5573, i8* %5574, align 1
  %5575 = icmp eq i8 %5573, 0
  br i1 %5575, label %5576, label %5579

5576:                                             ; preds = %5571
  %5577 = shl nuw nsw i64 %5572, 4
  %5578 = getelementptr inbounds i8, i8* %0, i64 %5577
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5578, i8 0, i64 16, i1 false)
  br label %5579

5579:                                             ; preds = %5576, %5571
  %5580 = add nuw nsw i64 %.01, 697
  %5581 = call zeroext i8 @randombit()
  %5582 = getelementptr inbounds i8, i8* %1, i64 %5580
  store i8 %5581, i8* %5582, align 1
  %5583 = icmp eq i8 %5581, 0
  br i1 %5583, label %5584, label %5587

5584:                                             ; preds = %5579
  %5585 = shl nuw nsw i64 %5580, 4
  %5586 = getelementptr inbounds i8, i8* %0, i64 %5585
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5586, i8 0, i64 16, i1 false)
  br label %5587

5587:                                             ; preds = %5584, %5579
  %5588 = add nuw nsw i64 %.01, 698
  %5589 = call zeroext i8 @randombit()
  %5590 = getelementptr inbounds i8, i8* %1, i64 %5588
  store i8 %5589, i8* %5590, align 1
  %5591 = icmp eq i8 %5589, 0
  br i1 %5591, label %5592, label %5595

5592:                                             ; preds = %5587
  %5593 = shl nuw nsw i64 %5588, 4
  %5594 = getelementptr inbounds i8, i8* %0, i64 %5593
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5594, i8 0, i64 16, i1 false)
  br label %5595

5595:                                             ; preds = %5592, %5587
  %5596 = add nuw nsw i64 %.01, 699
  %5597 = call zeroext i8 @randombit()
  %5598 = getelementptr inbounds i8, i8* %1, i64 %5596
  store i8 %5597, i8* %5598, align 1
  %5599 = icmp eq i8 %5597, 0
  br i1 %5599, label %5600, label %5603

5600:                                             ; preds = %5595
  %5601 = shl nuw nsw i64 %5596, 4
  %5602 = getelementptr inbounds i8, i8* %0, i64 %5601
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5602, i8 0, i64 16, i1 false)
  br label %5603

5603:                                             ; preds = %5600, %5595
  %5604 = add nuw nsw i64 %.01, 700
  %5605 = call zeroext i8 @randombit()
  %5606 = getelementptr inbounds i8, i8* %1, i64 %5604
  store i8 %5605, i8* %5606, align 1
  %5607 = icmp eq i8 %5605, 0
  br i1 %5607, label %5608, label %5611

5608:                                             ; preds = %5603
  %5609 = shl nuw nsw i64 %5604, 4
  %5610 = getelementptr inbounds i8, i8* %0, i64 %5609
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5610, i8 0, i64 16, i1 false)
  br label %5611

5611:                                             ; preds = %5608, %5603
  %5612 = add nuw nsw i64 %.01, 701
  %5613 = call zeroext i8 @randombit()
  %5614 = getelementptr inbounds i8, i8* %1, i64 %5612
  store i8 %5613, i8* %5614, align 1
  %5615 = icmp eq i8 %5613, 0
  br i1 %5615, label %5616, label %5619

5616:                                             ; preds = %5611
  %5617 = shl nuw nsw i64 %5612, 4
  %5618 = getelementptr inbounds i8, i8* %0, i64 %5617
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5618, i8 0, i64 16, i1 false)
  br label %5619

5619:                                             ; preds = %5616, %5611
  %5620 = add nuw nsw i64 %.01, 702
  %5621 = call zeroext i8 @randombit()
  %5622 = getelementptr inbounds i8, i8* %1, i64 %5620
  store i8 %5621, i8* %5622, align 1
  %5623 = icmp eq i8 %5621, 0
  br i1 %5623, label %5624, label %5627

5624:                                             ; preds = %5619
  %5625 = shl nuw nsw i64 %5620, 4
  %5626 = getelementptr inbounds i8, i8* %0, i64 %5625
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5626, i8 0, i64 16, i1 false)
  br label %5627

5627:                                             ; preds = %5624, %5619
  %5628 = add nuw nsw i64 %.01, 703
  %5629 = call zeroext i8 @randombit()
  %5630 = getelementptr inbounds i8, i8* %1, i64 %5628
  store i8 %5629, i8* %5630, align 1
  %5631 = icmp eq i8 %5629, 0
  br i1 %5631, label %5632, label %5635

5632:                                             ; preds = %5627
  %5633 = shl nuw nsw i64 %5628, 4
  %5634 = getelementptr inbounds i8, i8* %0, i64 %5633
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5634, i8 0, i64 16, i1 false)
  br label %5635

5635:                                             ; preds = %5632, %5627
  %5636 = add nuw nsw i64 %.01, 704
  %5637 = call zeroext i8 @randombit()
  %5638 = getelementptr inbounds i8, i8* %1, i64 %5636
  store i8 %5637, i8* %5638, align 1
  %5639 = icmp eq i8 %5637, 0
  br i1 %5639, label %5640, label %5643

5640:                                             ; preds = %5635
  %5641 = shl nuw nsw i64 %5636, 4
  %5642 = getelementptr inbounds i8, i8* %0, i64 %5641
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5642, i8 0, i64 16, i1 false)
  br label %5643

5643:                                             ; preds = %5640, %5635
  %5644 = add nuw nsw i64 %.01, 705
  %5645 = call zeroext i8 @randombit()
  %5646 = getelementptr inbounds i8, i8* %1, i64 %5644
  store i8 %5645, i8* %5646, align 1
  %5647 = icmp eq i8 %5645, 0
  br i1 %5647, label %5648, label %5651

5648:                                             ; preds = %5643
  %5649 = shl nuw nsw i64 %5644, 4
  %5650 = getelementptr inbounds i8, i8* %0, i64 %5649
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5650, i8 0, i64 16, i1 false)
  br label %5651

5651:                                             ; preds = %5648, %5643
  %5652 = add nuw nsw i64 %.01, 706
  %5653 = call zeroext i8 @randombit()
  %5654 = getelementptr inbounds i8, i8* %1, i64 %5652
  store i8 %5653, i8* %5654, align 1
  %5655 = icmp eq i8 %5653, 0
  br i1 %5655, label %5656, label %5659

5656:                                             ; preds = %5651
  %5657 = shl nuw nsw i64 %5652, 4
  %5658 = getelementptr inbounds i8, i8* %0, i64 %5657
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5658, i8 0, i64 16, i1 false)
  br label %5659

5659:                                             ; preds = %5656, %5651
  %5660 = add nuw nsw i64 %.01, 707
  %5661 = call zeroext i8 @randombit()
  %5662 = getelementptr inbounds i8, i8* %1, i64 %5660
  store i8 %5661, i8* %5662, align 1
  %5663 = icmp eq i8 %5661, 0
  br i1 %5663, label %5664, label %5667

5664:                                             ; preds = %5659
  %5665 = shl nuw nsw i64 %5660, 4
  %5666 = getelementptr inbounds i8, i8* %0, i64 %5665
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5666, i8 0, i64 16, i1 false)
  br label %5667

5667:                                             ; preds = %5664, %5659
  %5668 = add nuw nsw i64 %.01, 708
  %5669 = call zeroext i8 @randombit()
  %5670 = getelementptr inbounds i8, i8* %1, i64 %5668
  store i8 %5669, i8* %5670, align 1
  %5671 = icmp eq i8 %5669, 0
  br i1 %5671, label %5672, label %5675

5672:                                             ; preds = %5667
  %5673 = shl nuw nsw i64 %5668, 4
  %5674 = getelementptr inbounds i8, i8* %0, i64 %5673
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5674, i8 0, i64 16, i1 false)
  br label %5675

5675:                                             ; preds = %5672, %5667
  %5676 = add nuw nsw i64 %.01, 709
  %5677 = call zeroext i8 @randombit()
  %5678 = getelementptr inbounds i8, i8* %1, i64 %5676
  store i8 %5677, i8* %5678, align 1
  %5679 = icmp eq i8 %5677, 0
  br i1 %5679, label %5680, label %5683

5680:                                             ; preds = %5675
  %5681 = shl nuw nsw i64 %5676, 4
  %5682 = getelementptr inbounds i8, i8* %0, i64 %5681
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5682, i8 0, i64 16, i1 false)
  br label %5683

5683:                                             ; preds = %5680, %5675
  %5684 = add nuw nsw i64 %.01, 710
  %5685 = call zeroext i8 @randombit()
  %5686 = getelementptr inbounds i8, i8* %1, i64 %5684
  store i8 %5685, i8* %5686, align 1
  %5687 = icmp eq i8 %5685, 0
  br i1 %5687, label %5688, label %5691

5688:                                             ; preds = %5683
  %5689 = shl nuw nsw i64 %5684, 4
  %5690 = getelementptr inbounds i8, i8* %0, i64 %5689
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5690, i8 0, i64 16, i1 false)
  br label %5691

5691:                                             ; preds = %5688, %5683
  %5692 = add nuw nsw i64 %.01, 711
  %5693 = call zeroext i8 @randombit()
  %5694 = getelementptr inbounds i8, i8* %1, i64 %5692
  store i8 %5693, i8* %5694, align 1
  %5695 = icmp eq i8 %5693, 0
  br i1 %5695, label %5696, label %5699

5696:                                             ; preds = %5691
  %5697 = shl nuw nsw i64 %5692, 4
  %5698 = getelementptr inbounds i8, i8* %0, i64 %5697
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5698, i8 0, i64 16, i1 false)
  br label %5699

5699:                                             ; preds = %5696, %5691
  %5700 = add nuw nsw i64 %.01, 712
  %5701 = call zeroext i8 @randombit()
  %5702 = getelementptr inbounds i8, i8* %1, i64 %5700
  store i8 %5701, i8* %5702, align 1
  %5703 = icmp eq i8 %5701, 0
  br i1 %5703, label %5704, label %5707

5704:                                             ; preds = %5699
  %5705 = shl nuw nsw i64 %5700, 4
  %5706 = getelementptr inbounds i8, i8* %0, i64 %5705
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5706, i8 0, i64 16, i1 false)
  br label %5707

5707:                                             ; preds = %5704, %5699
  %5708 = add nuw nsw i64 %.01, 713
  %5709 = call zeroext i8 @randombit()
  %5710 = getelementptr inbounds i8, i8* %1, i64 %5708
  store i8 %5709, i8* %5710, align 1
  %5711 = icmp eq i8 %5709, 0
  br i1 %5711, label %5712, label %5715

5712:                                             ; preds = %5707
  %5713 = shl nuw nsw i64 %5708, 4
  %5714 = getelementptr inbounds i8, i8* %0, i64 %5713
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5714, i8 0, i64 16, i1 false)
  br label %5715

5715:                                             ; preds = %5712, %5707
  %5716 = add nuw nsw i64 %.01, 714
  %5717 = call zeroext i8 @randombit()
  %5718 = getelementptr inbounds i8, i8* %1, i64 %5716
  store i8 %5717, i8* %5718, align 1
  %5719 = icmp eq i8 %5717, 0
  br i1 %5719, label %5720, label %5723

5720:                                             ; preds = %5715
  %5721 = shl nuw nsw i64 %5716, 4
  %5722 = getelementptr inbounds i8, i8* %0, i64 %5721
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5722, i8 0, i64 16, i1 false)
  br label %5723

5723:                                             ; preds = %5720, %5715
  %5724 = add nuw nsw i64 %.01, 715
  %5725 = call zeroext i8 @randombit()
  %5726 = getelementptr inbounds i8, i8* %1, i64 %5724
  store i8 %5725, i8* %5726, align 1
  %5727 = icmp eq i8 %5725, 0
  br i1 %5727, label %5728, label %5731

5728:                                             ; preds = %5723
  %5729 = shl nuw nsw i64 %5724, 4
  %5730 = getelementptr inbounds i8, i8* %0, i64 %5729
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5730, i8 0, i64 16, i1 false)
  br label %5731

5731:                                             ; preds = %5728, %5723
  %5732 = add nuw nsw i64 %.01, 716
  %5733 = call zeroext i8 @randombit()
  %5734 = getelementptr inbounds i8, i8* %1, i64 %5732
  store i8 %5733, i8* %5734, align 1
  %5735 = icmp eq i8 %5733, 0
  br i1 %5735, label %5736, label %5739

5736:                                             ; preds = %5731
  %5737 = shl nuw nsw i64 %5732, 4
  %5738 = getelementptr inbounds i8, i8* %0, i64 %5737
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5738, i8 0, i64 16, i1 false)
  br label %5739

5739:                                             ; preds = %5736, %5731
  %5740 = add nuw nsw i64 %.01, 717
  %5741 = call zeroext i8 @randombit()
  %5742 = getelementptr inbounds i8, i8* %1, i64 %5740
  store i8 %5741, i8* %5742, align 1
  %5743 = icmp eq i8 %5741, 0
  br i1 %5743, label %5744, label %5747

5744:                                             ; preds = %5739
  %5745 = shl nuw nsw i64 %5740, 4
  %5746 = getelementptr inbounds i8, i8* %0, i64 %5745
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5746, i8 0, i64 16, i1 false)
  br label %5747

5747:                                             ; preds = %5744, %5739
  %5748 = add nuw nsw i64 %.01, 718
  %5749 = call zeroext i8 @randombit()
  %5750 = getelementptr inbounds i8, i8* %1, i64 %5748
  store i8 %5749, i8* %5750, align 1
  %5751 = icmp eq i8 %5749, 0
  br i1 %5751, label %5752, label %5755

5752:                                             ; preds = %5747
  %5753 = shl nuw nsw i64 %5748, 4
  %5754 = getelementptr inbounds i8, i8* %0, i64 %5753
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5754, i8 0, i64 16, i1 false)
  br label %5755

5755:                                             ; preds = %5752, %5747
  %5756 = add nuw nsw i64 %.01, 719
  %5757 = call zeroext i8 @randombit()
  %5758 = getelementptr inbounds i8, i8* %1, i64 %5756
  store i8 %5757, i8* %5758, align 1
  %5759 = icmp eq i8 %5757, 0
  br i1 %5759, label %5760, label %5763

5760:                                             ; preds = %5755
  %5761 = shl nuw nsw i64 %5756, 4
  %5762 = getelementptr inbounds i8, i8* %0, i64 %5761
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5762, i8 0, i64 16, i1 false)
  br label %5763

5763:                                             ; preds = %5760, %5755
  %5764 = add nuw nsw i64 %.01, 720
  %5765 = call zeroext i8 @randombit()
  %5766 = getelementptr inbounds i8, i8* %1, i64 %5764
  store i8 %5765, i8* %5766, align 1
  %5767 = icmp eq i8 %5765, 0
  br i1 %5767, label %5768, label %5771

5768:                                             ; preds = %5763
  %5769 = shl nuw nsw i64 %5764, 4
  %5770 = getelementptr inbounds i8, i8* %0, i64 %5769
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5770, i8 0, i64 16, i1 false)
  br label %5771

5771:                                             ; preds = %5768, %5763
  %5772 = add nuw nsw i64 %.01, 721
  %5773 = call zeroext i8 @randombit()
  %5774 = getelementptr inbounds i8, i8* %1, i64 %5772
  store i8 %5773, i8* %5774, align 1
  %5775 = icmp eq i8 %5773, 0
  br i1 %5775, label %5776, label %5779

5776:                                             ; preds = %5771
  %5777 = shl nuw nsw i64 %5772, 4
  %5778 = getelementptr inbounds i8, i8* %0, i64 %5777
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5778, i8 0, i64 16, i1 false)
  br label %5779

5779:                                             ; preds = %5776, %5771
  %5780 = add nuw nsw i64 %.01, 722
  %5781 = call zeroext i8 @randombit()
  %5782 = getelementptr inbounds i8, i8* %1, i64 %5780
  store i8 %5781, i8* %5782, align 1
  %5783 = icmp eq i8 %5781, 0
  br i1 %5783, label %5784, label %5787

5784:                                             ; preds = %5779
  %5785 = shl nuw nsw i64 %5780, 4
  %5786 = getelementptr inbounds i8, i8* %0, i64 %5785
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5786, i8 0, i64 16, i1 false)
  br label %5787

5787:                                             ; preds = %5784, %5779
  %5788 = add nuw nsw i64 %.01, 723
  %5789 = call zeroext i8 @randombit()
  %5790 = getelementptr inbounds i8, i8* %1, i64 %5788
  store i8 %5789, i8* %5790, align 1
  %5791 = icmp eq i8 %5789, 0
  br i1 %5791, label %5792, label %5795

5792:                                             ; preds = %5787
  %5793 = shl nuw nsw i64 %5788, 4
  %5794 = getelementptr inbounds i8, i8* %0, i64 %5793
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5794, i8 0, i64 16, i1 false)
  br label %5795

5795:                                             ; preds = %5792, %5787
  %5796 = add nuw nsw i64 %.01, 724
  %5797 = call zeroext i8 @randombit()
  %5798 = getelementptr inbounds i8, i8* %1, i64 %5796
  store i8 %5797, i8* %5798, align 1
  %5799 = icmp eq i8 %5797, 0
  br i1 %5799, label %5800, label %5803

5800:                                             ; preds = %5795
  %5801 = shl nuw nsw i64 %5796, 4
  %5802 = getelementptr inbounds i8, i8* %0, i64 %5801
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5802, i8 0, i64 16, i1 false)
  br label %5803

5803:                                             ; preds = %5800, %5795
  %5804 = add nuw nsw i64 %.01, 725
  %5805 = call zeroext i8 @randombit()
  %5806 = getelementptr inbounds i8, i8* %1, i64 %5804
  store i8 %5805, i8* %5806, align 1
  %5807 = icmp eq i8 %5805, 0
  br i1 %5807, label %5808, label %5811

5808:                                             ; preds = %5803
  %5809 = shl nuw nsw i64 %5804, 4
  %5810 = getelementptr inbounds i8, i8* %0, i64 %5809
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5810, i8 0, i64 16, i1 false)
  br label %5811

5811:                                             ; preds = %5808, %5803
  %5812 = add nuw nsw i64 %.01, 726
  %5813 = call zeroext i8 @randombit()
  %5814 = getelementptr inbounds i8, i8* %1, i64 %5812
  store i8 %5813, i8* %5814, align 1
  %5815 = icmp eq i8 %5813, 0
  br i1 %5815, label %5816, label %5819

5816:                                             ; preds = %5811
  %5817 = shl nuw nsw i64 %5812, 4
  %5818 = getelementptr inbounds i8, i8* %0, i64 %5817
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5818, i8 0, i64 16, i1 false)
  br label %5819

5819:                                             ; preds = %5816, %5811
  %5820 = add nuw nsw i64 %.01, 727
  %5821 = call zeroext i8 @randombit()
  %5822 = getelementptr inbounds i8, i8* %1, i64 %5820
  store i8 %5821, i8* %5822, align 1
  %5823 = icmp eq i8 %5821, 0
  br i1 %5823, label %5824, label %5827

5824:                                             ; preds = %5819
  %5825 = shl nuw nsw i64 %5820, 4
  %5826 = getelementptr inbounds i8, i8* %0, i64 %5825
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5826, i8 0, i64 16, i1 false)
  br label %5827

5827:                                             ; preds = %5824, %5819
  %5828 = add nuw nsw i64 %.01, 728
  %5829 = call zeroext i8 @randombit()
  %5830 = getelementptr inbounds i8, i8* %1, i64 %5828
  store i8 %5829, i8* %5830, align 1
  %5831 = icmp eq i8 %5829, 0
  br i1 %5831, label %5832, label %5835

5832:                                             ; preds = %5827
  %5833 = shl nuw nsw i64 %5828, 4
  %5834 = getelementptr inbounds i8, i8* %0, i64 %5833
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5834, i8 0, i64 16, i1 false)
  br label %5835

5835:                                             ; preds = %5832, %5827
  %5836 = add nuw nsw i64 %.01, 729
  %5837 = call zeroext i8 @randombit()
  %5838 = getelementptr inbounds i8, i8* %1, i64 %5836
  store i8 %5837, i8* %5838, align 1
  %5839 = icmp eq i8 %5837, 0
  br i1 %5839, label %5840, label %5843

5840:                                             ; preds = %5835
  %5841 = shl nuw nsw i64 %5836, 4
  %5842 = getelementptr inbounds i8, i8* %0, i64 %5841
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5842, i8 0, i64 16, i1 false)
  br label %5843

5843:                                             ; preds = %5840, %5835
  %5844 = add nuw nsw i64 %.01, 730
  %5845 = call zeroext i8 @randombit()
  %5846 = getelementptr inbounds i8, i8* %1, i64 %5844
  store i8 %5845, i8* %5846, align 1
  %5847 = icmp eq i8 %5845, 0
  br i1 %5847, label %5848, label %5851

5848:                                             ; preds = %5843
  %5849 = shl nuw nsw i64 %5844, 4
  %5850 = getelementptr inbounds i8, i8* %0, i64 %5849
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5850, i8 0, i64 16, i1 false)
  br label %5851

5851:                                             ; preds = %5848, %5843
  %5852 = add nuw nsw i64 %.01, 731
  %5853 = call zeroext i8 @randombit()
  %5854 = getelementptr inbounds i8, i8* %1, i64 %5852
  store i8 %5853, i8* %5854, align 1
  %5855 = icmp eq i8 %5853, 0
  br i1 %5855, label %5856, label %5859

5856:                                             ; preds = %5851
  %5857 = shl nuw nsw i64 %5852, 4
  %5858 = getelementptr inbounds i8, i8* %0, i64 %5857
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5858, i8 0, i64 16, i1 false)
  br label %5859

5859:                                             ; preds = %5856, %5851
  %5860 = add nuw nsw i64 %.01, 732
  %5861 = call zeroext i8 @randombit()
  %5862 = getelementptr inbounds i8, i8* %1, i64 %5860
  store i8 %5861, i8* %5862, align 1
  %5863 = icmp eq i8 %5861, 0
  br i1 %5863, label %5864, label %5867

5864:                                             ; preds = %5859
  %5865 = shl nuw nsw i64 %5860, 4
  %5866 = getelementptr inbounds i8, i8* %0, i64 %5865
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5866, i8 0, i64 16, i1 false)
  br label %5867

5867:                                             ; preds = %5864, %5859
  %5868 = add nuw nsw i64 %.01, 733
  %5869 = call zeroext i8 @randombit()
  %5870 = getelementptr inbounds i8, i8* %1, i64 %5868
  store i8 %5869, i8* %5870, align 1
  %5871 = icmp eq i8 %5869, 0
  br i1 %5871, label %5872, label %5875

5872:                                             ; preds = %5867
  %5873 = shl nuw nsw i64 %5868, 4
  %5874 = getelementptr inbounds i8, i8* %0, i64 %5873
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5874, i8 0, i64 16, i1 false)
  br label %5875

5875:                                             ; preds = %5872, %5867
  %5876 = add nuw nsw i64 %.01, 734
  %5877 = call zeroext i8 @randombit()
  %5878 = getelementptr inbounds i8, i8* %1, i64 %5876
  store i8 %5877, i8* %5878, align 1
  %5879 = icmp eq i8 %5877, 0
  br i1 %5879, label %5880, label %5883

5880:                                             ; preds = %5875
  %5881 = shl nuw nsw i64 %5876, 4
  %5882 = getelementptr inbounds i8, i8* %0, i64 %5881
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5882, i8 0, i64 16, i1 false)
  br label %5883

5883:                                             ; preds = %5880, %5875
  %5884 = add nuw nsw i64 %.01, 735
  %5885 = call zeroext i8 @randombit()
  %5886 = getelementptr inbounds i8, i8* %1, i64 %5884
  store i8 %5885, i8* %5886, align 1
  %5887 = icmp eq i8 %5885, 0
  br i1 %5887, label %5888, label %5891

5888:                                             ; preds = %5883
  %5889 = shl nuw nsw i64 %5884, 4
  %5890 = getelementptr inbounds i8, i8* %0, i64 %5889
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5890, i8 0, i64 16, i1 false)
  br label %5891

5891:                                             ; preds = %5888, %5883
  %5892 = add nuw nsw i64 %.01, 736
  %5893 = call zeroext i8 @randombit()
  %5894 = getelementptr inbounds i8, i8* %1, i64 %5892
  store i8 %5893, i8* %5894, align 1
  %5895 = icmp eq i8 %5893, 0
  br i1 %5895, label %5896, label %5899

5896:                                             ; preds = %5891
  %5897 = shl nuw nsw i64 %5892, 4
  %5898 = getelementptr inbounds i8, i8* %0, i64 %5897
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5898, i8 0, i64 16, i1 false)
  br label %5899

5899:                                             ; preds = %5896, %5891
  %5900 = add nuw nsw i64 %.01, 737
  %5901 = call zeroext i8 @randombit()
  %5902 = getelementptr inbounds i8, i8* %1, i64 %5900
  store i8 %5901, i8* %5902, align 1
  %5903 = icmp eq i8 %5901, 0
  br i1 %5903, label %5904, label %5907

5904:                                             ; preds = %5899
  %5905 = shl nuw nsw i64 %5900, 4
  %5906 = getelementptr inbounds i8, i8* %0, i64 %5905
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5906, i8 0, i64 16, i1 false)
  br label %5907

5907:                                             ; preds = %5904, %5899
  %5908 = add nuw nsw i64 %.01, 738
  %5909 = call zeroext i8 @randombit()
  %5910 = getelementptr inbounds i8, i8* %1, i64 %5908
  store i8 %5909, i8* %5910, align 1
  %5911 = icmp eq i8 %5909, 0
  br i1 %5911, label %5912, label %5915

5912:                                             ; preds = %5907
  %5913 = shl nuw nsw i64 %5908, 4
  %5914 = getelementptr inbounds i8, i8* %0, i64 %5913
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5914, i8 0, i64 16, i1 false)
  br label %5915

5915:                                             ; preds = %5912, %5907
  %5916 = add nuw nsw i64 %.01, 739
  %5917 = call zeroext i8 @randombit()
  %5918 = getelementptr inbounds i8, i8* %1, i64 %5916
  store i8 %5917, i8* %5918, align 1
  %5919 = icmp eq i8 %5917, 0
  br i1 %5919, label %5920, label %5923

5920:                                             ; preds = %5915
  %5921 = shl nuw nsw i64 %5916, 4
  %5922 = getelementptr inbounds i8, i8* %0, i64 %5921
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5922, i8 0, i64 16, i1 false)
  br label %5923

5923:                                             ; preds = %5920, %5915
  %5924 = add nuw nsw i64 %.01, 740
  %5925 = call zeroext i8 @randombit()
  %5926 = getelementptr inbounds i8, i8* %1, i64 %5924
  store i8 %5925, i8* %5926, align 1
  %5927 = icmp eq i8 %5925, 0
  br i1 %5927, label %5928, label %5931

5928:                                             ; preds = %5923
  %5929 = shl nuw nsw i64 %5924, 4
  %5930 = getelementptr inbounds i8, i8* %0, i64 %5929
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5930, i8 0, i64 16, i1 false)
  br label %5931

5931:                                             ; preds = %5928, %5923
  %5932 = add nuw nsw i64 %.01, 741
  %5933 = call zeroext i8 @randombit()
  %5934 = getelementptr inbounds i8, i8* %1, i64 %5932
  store i8 %5933, i8* %5934, align 1
  %5935 = icmp eq i8 %5933, 0
  br i1 %5935, label %5936, label %5939

5936:                                             ; preds = %5931
  %5937 = shl nuw nsw i64 %5932, 4
  %5938 = getelementptr inbounds i8, i8* %0, i64 %5937
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5938, i8 0, i64 16, i1 false)
  br label %5939

5939:                                             ; preds = %5936, %5931
  %5940 = add nuw nsw i64 %.01, 742
  %5941 = call zeroext i8 @randombit()
  %5942 = getelementptr inbounds i8, i8* %1, i64 %5940
  store i8 %5941, i8* %5942, align 1
  %5943 = icmp eq i8 %5941, 0
  br i1 %5943, label %5944, label %5947

5944:                                             ; preds = %5939
  %5945 = shl nuw nsw i64 %5940, 4
  %5946 = getelementptr inbounds i8, i8* %0, i64 %5945
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5946, i8 0, i64 16, i1 false)
  br label %5947

5947:                                             ; preds = %5944, %5939
  %5948 = add nuw nsw i64 %.01, 743
  %5949 = call zeroext i8 @randombit()
  %5950 = getelementptr inbounds i8, i8* %1, i64 %5948
  store i8 %5949, i8* %5950, align 1
  %5951 = icmp eq i8 %5949, 0
  br i1 %5951, label %5952, label %5955

5952:                                             ; preds = %5947
  %5953 = shl nuw nsw i64 %5948, 4
  %5954 = getelementptr inbounds i8, i8* %0, i64 %5953
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5954, i8 0, i64 16, i1 false)
  br label %5955

5955:                                             ; preds = %5952, %5947
  %5956 = add nuw nsw i64 %.01, 744
  %5957 = call zeroext i8 @randombit()
  %5958 = getelementptr inbounds i8, i8* %1, i64 %5956
  store i8 %5957, i8* %5958, align 1
  %5959 = icmp eq i8 %5957, 0
  br i1 %5959, label %5960, label %5963

5960:                                             ; preds = %5955
  %5961 = shl nuw nsw i64 %5956, 4
  %5962 = getelementptr inbounds i8, i8* %0, i64 %5961
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5962, i8 0, i64 16, i1 false)
  br label %5963

5963:                                             ; preds = %5960, %5955
  %5964 = add nuw nsw i64 %.01, 745
  %5965 = call zeroext i8 @randombit()
  %5966 = getelementptr inbounds i8, i8* %1, i64 %5964
  store i8 %5965, i8* %5966, align 1
  %5967 = icmp eq i8 %5965, 0
  br i1 %5967, label %5968, label %5971

5968:                                             ; preds = %5963
  %5969 = shl nuw nsw i64 %5964, 4
  %5970 = getelementptr inbounds i8, i8* %0, i64 %5969
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5970, i8 0, i64 16, i1 false)
  br label %5971

5971:                                             ; preds = %5968, %5963
  %5972 = add nuw nsw i64 %.01, 746
  %5973 = call zeroext i8 @randombit()
  %5974 = getelementptr inbounds i8, i8* %1, i64 %5972
  store i8 %5973, i8* %5974, align 1
  %5975 = icmp eq i8 %5973, 0
  br i1 %5975, label %5976, label %5979

5976:                                             ; preds = %5971
  %5977 = shl nuw nsw i64 %5972, 4
  %5978 = getelementptr inbounds i8, i8* %0, i64 %5977
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5978, i8 0, i64 16, i1 false)
  br label %5979

5979:                                             ; preds = %5976, %5971
  %5980 = add nuw nsw i64 %.01, 747
  %5981 = call zeroext i8 @randombit()
  %5982 = getelementptr inbounds i8, i8* %1, i64 %5980
  store i8 %5981, i8* %5982, align 1
  %5983 = icmp eq i8 %5981, 0
  br i1 %5983, label %5984, label %5987

5984:                                             ; preds = %5979
  %5985 = shl nuw nsw i64 %5980, 4
  %5986 = getelementptr inbounds i8, i8* %0, i64 %5985
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5986, i8 0, i64 16, i1 false)
  br label %5987

5987:                                             ; preds = %5984, %5979
  %5988 = add nuw nsw i64 %.01, 748
  %5989 = call zeroext i8 @randombit()
  %5990 = getelementptr inbounds i8, i8* %1, i64 %5988
  store i8 %5989, i8* %5990, align 1
  %5991 = icmp eq i8 %5989, 0
  br i1 %5991, label %5992, label %5995

5992:                                             ; preds = %5987
  %5993 = shl nuw nsw i64 %5988, 4
  %5994 = getelementptr inbounds i8, i8* %0, i64 %5993
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %5994, i8 0, i64 16, i1 false)
  br label %5995

5995:                                             ; preds = %5992, %5987
  %5996 = add nuw nsw i64 %.01, 749
  %5997 = call zeroext i8 @randombit()
  %5998 = getelementptr inbounds i8, i8* %1, i64 %5996
  store i8 %5997, i8* %5998, align 1
  %5999 = icmp eq i8 %5997, 0
  br i1 %5999, label %6000, label %6003

6000:                                             ; preds = %5995
  %6001 = shl nuw nsw i64 %5996, 4
  %6002 = getelementptr inbounds i8, i8* %0, i64 %6001
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6002, i8 0, i64 16, i1 false)
  br label %6003

6003:                                             ; preds = %6000, %5995
  %6004 = add nuw nsw i64 %.01, 750
  %6005 = call zeroext i8 @randombit()
  %6006 = getelementptr inbounds i8, i8* %1, i64 %6004
  store i8 %6005, i8* %6006, align 1
  %6007 = icmp eq i8 %6005, 0
  br i1 %6007, label %6008, label %6011

6008:                                             ; preds = %6003
  %6009 = shl nuw nsw i64 %6004, 4
  %6010 = getelementptr inbounds i8, i8* %0, i64 %6009
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6010, i8 0, i64 16, i1 false)
  br label %6011

6011:                                             ; preds = %6008, %6003
  %6012 = add nuw nsw i64 %.01, 751
  %6013 = call zeroext i8 @randombit()
  %6014 = getelementptr inbounds i8, i8* %1, i64 %6012
  store i8 %6013, i8* %6014, align 1
  %6015 = icmp eq i8 %6013, 0
  br i1 %6015, label %6016, label %6019

6016:                                             ; preds = %6011
  %6017 = shl nuw nsw i64 %6012, 4
  %6018 = getelementptr inbounds i8, i8* %0, i64 %6017
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6018, i8 0, i64 16, i1 false)
  br label %6019

6019:                                             ; preds = %6016, %6011
  %6020 = add nuw nsw i64 %.01, 752
  %6021 = call zeroext i8 @randombit()
  %6022 = getelementptr inbounds i8, i8* %1, i64 %6020
  store i8 %6021, i8* %6022, align 1
  %6023 = icmp eq i8 %6021, 0
  br i1 %6023, label %6024, label %6027

6024:                                             ; preds = %6019
  %6025 = shl nuw nsw i64 %6020, 4
  %6026 = getelementptr inbounds i8, i8* %0, i64 %6025
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6026, i8 0, i64 16, i1 false)
  br label %6027

6027:                                             ; preds = %6024, %6019
  %6028 = add nuw nsw i64 %.01, 753
  %6029 = call zeroext i8 @randombit()
  %6030 = getelementptr inbounds i8, i8* %1, i64 %6028
  store i8 %6029, i8* %6030, align 1
  %6031 = icmp eq i8 %6029, 0
  br i1 %6031, label %6032, label %6035

6032:                                             ; preds = %6027
  %6033 = shl nuw nsw i64 %6028, 4
  %6034 = getelementptr inbounds i8, i8* %0, i64 %6033
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6034, i8 0, i64 16, i1 false)
  br label %6035

6035:                                             ; preds = %6032, %6027
  %6036 = add nuw nsw i64 %.01, 754
  %6037 = call zeroext i8 @randombit()
  %6038 = getelementptr inbounds i8, i8* %1, i64 %6036
  store i8 %6037, i8* %6038, align 1
  %6039 = icmp eq i8 %6037, 0
  br i1 %6039, label %6040, label %6043

6040:                                             ; preds = %6035
  %6041 = shl nuw nsw i64 %6036, 4
  %6042 = getelementptr inbounds i8, i8* %0, i64 %6041
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6042, i8 0, i64 16, i1 false)
  br label %6043

6043:                                             ; preds = %6040, %6035
  %6044 = add nuw nsw i64 %.01, 755
  %6045 = call zeroext i8 @randombit()
  %6046 = getelementptr inbounds i8, i8* %1, i64 %6044
  store i8 %6045, i8* %6046, align 1
  %6047 = icmp eq i8 %6045, 0
  br i1 %6047, label %6048, label %6051

6048:                                             ; preds = %6043
  %6049 = shl nuw nsw i64 %6044, 4
  %6050 = getelementptr inbounds i8, i8* %0, i64 %6049
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6050, i8 0, i64 16, i1 false)
  br label %6051

6051:                                             ; preds = %6048, %6043
  %6052 = add nuw nsw i64 %.01, 756
  %6053 = call zeroext i8 @randombit()
  %6054 = getelementptr inbounds i8, i8* %1, i64 %6052
  store i8 %6053, i8* %6054, align 1
  %6055 = icmp eq i8 %6053, 0
  br i1 %6055, label %6056, label %6059

6056:                                             ; preds = %6051
  %6057 = shl nuw nsw i64 %6052, 4
  %6058 = getelementptr inbounds i8, i8* %0, i64 %6057
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6058, i8 0, i64 16, i1 false)
  br label %6059

6059:                                             ; preds = %6056, %6051
  %6060 = add nuw nsw i64 %.01, 757
  %6061 = call zeroext i8 @randombit()
  %6062 = getelementptr inbounds i8, i8* %1, i64 %6060
  store i8 %6061, i8* %6062, align 1
  %6063 = icmp eq i8 %6061, 0
  br i1 %6063, label %6064, label %6067

6064:                                             ; preds = %6059
  %6065 = shl nuw nsw i64 %6060, 4
  %6066 = getelementptr inbounds i8, i8* %0, i64 %6065
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6066, i8 0, i64 16, i1 false)
  br label %6067

6067:                                             ; preds = %6064, %6059
  %6068 = add nuw nsw i64 %.01, 758
  %6069 = call zeroext i8 @randombit()
  %6070 = getelementptr inbounds i8, i8* %1, i64 %6068
  store i8 %6069, i8* %6070, align 1
  %6071 = icmp eq i8 %6069, 0
  br i1 %6071, label %6072, label %6075

6072:                                             ; preds = %6067
  %6073 = shl nuw nsw i64 %6068, 4
  %6074 = getelementptr inbounds i8, i8* %0, i64 %6073
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6074, i8 0, i64 16, i1 false)
  br label %6075

6075:                                             ; preds = %6072, %6067
  %6076 = add nuw nsw i64 %.01, 759
  %6077 = call zeroext i8 @randombit()
  %6078 = getelementptr inbounds i8, i8* %1, i64 %6076
  store i8 %6077, i8* %6078, align 1
  %6079 = icmp eq i8 %6077, 0
  br i1 %6079, label %6080, label %6083

6080:                                             ; preds = %6075
  %6081 = shl nuw nsw i64 %6076, 4
  %6082 = getelementptr inbounds i8, i8* %0, i64 %6081
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6082, i8 0, i64 16, i1 false)
  br label %6083

6083:                                             ; preds = %6080, %6075
  %6084 = add nuw nsw i64 %.01, 760
  %6085 = call zeroext i8 @randombit()
  %6086 = getelementptr inbounds i8, i8* %1, i64 %6084
  store i8 %6085, i8* %6086, align 1
  %6087 = icmp eq i8 %6085, 0
  br i1 %6087, label %6088, label %6091

6088:                                             ; preds = %6083
  %6089 = shl nuw nsw i64 %6084, 4
  %6090 = getelementptr inbounds i8, i8* %0, i64 %6089
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6090, i8 0, i64 16, i1 false)
  br label %6091

6091:                                             ; preds = %6088, %6083
  %6092 = add nuw nsw i64 %.01, 761
  %6093 = call zeroext i8 @randombit()
  %6094 = getelementptr inbounds i8, i8* %1, i64 %6092
  store i8 %6093, i8* %6094, align 1
  %6095 = icmp eq i8 %6093, 0
  br i1 %6095, label %6096, label %6099

6096:                                             ; preds = %6091
  %6097 = shl nuw nsw i64 %6092, 4
  %6098 = getelementptr inbounds i8, i8* %0, i64 %6097
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6098, i8 0, i64 16, i1 false)
  br label %6099

6099:                                             ; preds = %6096, %6091
  %6100 = add nuw nsw i64 %.01, 762
  %6101 = call zeroext i8 @randombit()
  %6102 = getelementptr inbounds i8, i8* %1, i64 %6100
  store i8 %6101, i8* %6102, align 1
  %6103 = icmp eq i8 %6101, 0
  br i1 %6103, label %6104, label %6107

6104:                                             ; preds = %6099
  %6105 = shl nuw nsw i64 %6100, 4
  %6106 = getelementptr inbounds i8, i8* %0, i64 %6105
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6106, i8 0, i64 16, i1 false)
  br label %6107

6107:                                             ; preds = %6104, %6099
  %6108 = add nuw nsw i64 %.01, 763
  %6109 = call zeroext i8 @randombit()
  %6110 = getelementptr inbounds i8, i8* %1, i64 %6108
  store i8 %6109, i8* %6110, align 1
  %6111 = icmp eq i8 %6109, 0
  br i1 %6111, label %6112, label %6115

6112:                                             ; preds = %6107
  %6113 = shl nuw nsw i64 %6108, 4
  %6114 = getelementptr inbounds i8, i8* %0, i64 %6113
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6114, i8 0, i64 16, i1 false)
  br label %6115

6115:                                             ; preds = %6112, %6107
  %6116 = add nuw nsw i64 %.01, 764
  %6117 = call zeroext i8 @randombit()
  %6118 = getelementptr inbounds i8, i8* %1, i64 %6116
  store i8 %6117, i8* %6118, align 1
  %6119 = icmp eq i8 %6117, 0
  br i1 %6119, label %6120, label %6123

6120:                                             ; preds = %6115
  %6121 = shl nuw nsw i64 %6116, 4
  %6122 = getelementptr inbounds i8, i8* %0, i64 %6121
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6122, i8 0, i64 16, i1 false)
  br label %6123

6123:                                             ; preds = %6120, %6115
  %6124 = add nuw nsw i64 %.01, 765
  %6125 = call zeroext i8 @randombit()
  %6126 = getelementptr inbounds i8, i8* %1, i64 %6124
  store i8 %6125, i8* %6126, align 1
  %6127 = icmp eq i8 %6125, 0
  br i1 %6127, label %6128, label %6131

6128:                                             ; preds = %6123
  %6129 = shl nuw nsw i64 %6124, 4
  %6130 = getelementptr inbounds i8, i8* %0, i64 %6129
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6130, i8 0, i64 16, i1 false)
  br label %6131

6131:                                             ; preds = %6128, %6123
  %6132 = add nuw nsw i64 %.01, 766
  %6133 = call zeroext i8 @randombit()
  %6134 = getelementptr inbounds i8, i8* %1, i64 %6132
  store i8 %6133, i8* %6134, align 1
  %6135 = icmp eq i8 %6133, 0
  br i1 %6135, label %6136, label %6139

6136:                                             ; preds = %6131
  %6137 = shl nuw nsw i64 %6132, 4
  %6138 = getelementptr inbounds i8, i8* %0, i64 %6137
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6138, i8 0, i64 16, i1 false)
  br label %6139

6139:                                             ; preds = %6136, %6131
  %6140 = add nuw nsw i64 %.01, 767
  %6141 = call zeroext i8 @randombit()
  %6142 = getelementptr inbounds i8, i8* %1, i64 %6140
  store i8 %6141, i8* %6142, align 1
  %6143 = icmp eq i8 %6141, 0
  br i1 %6143, label %6144, label %6147

6144:                                             ; preds = %6139
  %6145 = shl nuw nsw i64 %6140, 4
  %6146 = getelementptr inbounds i8, i8* %0, i64 %6145
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6146, i8 0, i64 16, i1 false)
  br label %6147

6147:                                             ; preds = %6144, %6139
  %6148 = add nuw nsw i64 %.01, 768
  %6149 = call zeroext i8 @randombit()
  %6150 = getelementptr inbounds i8, i8* %1, i64 %6148
  store i8 %6149, i8* %6150, align 1
  %6151 = icmp eq i8 %6149, 0
  br i1 %6151, label %6152, label %6155

6152:                                             ; preds = %6147
  %6153 = shl nuw nsw i64 %6148, 4
  %6154 = getelementptr inbounds i8, i8* %0, i64 %6153
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6154, i8 0, i64 16, i1 false)
  br label %6155

6155:                                             ; preds = %6152, %6147
  %6156 = add nuw nsw i64 %.01, 769
  %6157 = call zeroext i8 @randombit()
  %6158 = getelementptr inbounds i8, i8* %1, i64 %6156
  store i8 %6157, i8* %6158, align 1
  %6159 = icmp eq i8 %6157, 0
  br i1 %6159, label %6160, label %6163

6160:                                             ; preds = %6155
  %6161 = shl nuw nsw i64 %6156, 4
  %6162 = getelementptr inbounds i8, i8* %0, i64 %6161
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6162, i8 0, i64 16, i1 false)
  br label %6163

6163:                                             ; preds = %6160, %6155
  %6164 = add nuw nsw i64 %.01, 770
  %6165 = call zeroext i8 @randombit()
  %6166 = getelementptr inbounds i8, i8* %1, i64 %6164
  store i8 %6165, i8* %6166, align 1
  %6167 = icmp eq i8 %6165, 0
  br i1 %6167, label %6168, label %6171

6168:                                             ; preds = %6163
  %6169 = shl nuw nsw i64 %6164, 4
  %6170 = getelementptr inbounds i8, i8* %0, i64 %6169
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6170, i8 0, i64 16, i1 false)
  br label %6171

6171:                                             ; preds = %6168, %6163
  %6172 = add nuw nsw i64 %.01, 771
  %6173 = call zeroext i8 @randombit()
  %6174 = getelementptr inbounds i8, i8* %1, i64 %6172
  store i8 %6173, i8* %6174, align 1
  %6175 = icmp eq i8 %6173, 0
  br i1 %6175, label %6176, label %6179

6176:                                             ; preds = %6171
  %6177 = shl nuw nsw i64 %6172, 4
  %6178 = getelementptr inbounds i8, i8* %0, i64 %6177
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6178, i8 0, i64 16, i1 false)
  br label %6179

6179:                                             ; preds = %6176, %6171
  %6180 = add nuw nsw i64 %.01, 772
  %6181 = call zeroext i8 @randombit()
  %6182 = getelementptr inbounds i8, i8* %1, i64 %6180
  store i8 %6181, i8* %6182, align 1
  %6183 = icmp eq i8 %6181, 0
  br i1 %6183, label %6184, label %6187

6184:                                             ; preds = %6179
  %6185 = shl nuw nsw i64 %6180, 4
  %6186 = getelementptr inbounds i8, i8* %0, i64 %6185
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6186, i8 0, i64 16, i1 false)
  br label %6187

6187:                                             ; preds = %6184, %6179
  %6188 = add nuw nsw i64 %.01, 773
  %6189 = call zeroext i8 @randombit()
  %6190 = getelementptr inbounds i8, i8* %1, i64 %6188
  store i8 %6189, i8* %6190, align 1
  %6191 = icmp eq i8 %6189, 0
  br i1 %6191, label %6192, label %6195

6192:                                             ; preds = %6187
  %6193 = shl nuw nsw i64 %6188, 4
  %6194 = getelementptr inbounds i8, i8* %0, i64 %6193
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6194, i8 0, i64 16, i1 false)
  br label %6195

6195:                                             ; preds = %6192, %6187
  %6196 = add nuw nsw i64 %.01, 774
  %6197 = call zeroext i8 @randombit()
  %6198 = getelementptr inbounds i8, i8* %1, i64 %6196
  store i8 %6197, i8* %6198, align 1
  %6199 = icmp eq i8 %6197, 0
  br i1 %6199, label %6200, label %6203

6200:                                             ; preds = %6195
  %6201 = shl nuw nsw i64 %6196, 4
  %6202 = getelementptr inbounds i8, i8* %0, i64 %6201
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6202, i8 0, i64 16, i1 false)
  br label %6203

6203:                                             ; preds = %6200, %6195
  %6204 = add nuw nsw i64 %.01, 775
  %6205 = call zeroext i8 @randombit()
  %6206 = getelementptr inbounds i8, i8* %1, i64 %6204
  store i8 %6205, i8* %6206, align 1
  %6207 = icmp eq i8 %6205, 0
  br i1 %6207, label %6208, label %6211

6208:                                             ; preds = %6203
  %6209 = shl nuw nsw i64 %6204, 4
  %6210 = getelementptr inbounds i8, i8* %0, i64 %6209
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6210, i8 0, i64 16, i1 false)
  br label %6211

6211:                                             ; preds = %6208, %6203
  %6212 = add nuw nsw i64 %.01, 776
  %6213 = call zeroext i8 @randombit()
  %6214 = getelementptr inbounds i8, i8* %1, i64 %6212
  store i8 %6213, i8* %6214, align 1
  %6215 = icmp eq i8 %6213, 0
  br i1 %6215, label %6216, label %6219

6216:                                             ; preds = %6211
  %6217 = shl nuw nsw i64 %6212, 4
  %6218 = getelementptr inbounds i8, i8* %0, i64 %6217
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6218, i8 0, i64 16, i1 false)
  br label %6219

6219:                                             ; preds = %6216, %6211
  %6220 = add nuw nsw i64 %.01, 777
  %6221 = call zeroext i8 @randombit()
  %6222 = getelementptr inbounds i8, i8* %1, i64 %6220
  store i8 %6221, i8* %6222, align 1
  %6223 = icmp eq i8 %6221, 0
  br i1 %6223, label %6224, label %6227

6224:                                             ; preds = %6219
  %6225 = shl nuw nsw i64 %6220, 4
  %6226 = getelementptr inbounds i8, i8* %0, i64 %6225
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6226, i8 0, i64 16, i1 false)
  br label %6227

6227:                                             ; preds = %6224, %6219
  %6228 = add nuw nsw i64 %.01, 778
  %6229 = call zeroext i8 @randombit()
  %6230 = getelementptr inbounds i8, i8* %1, i64 %6228
  store i8 %6229, i8* %6230, align 1
  %6231 = icmp eq i8 %6229, 0
  br i1 %6231, label %6232, label %6235

6232:                                             ; preds = %6227
  %6233 = shl nuw nsw i64 %6228, 4
  %6234 = getelementptr inbounds i8, i8* %0, i64 %6233
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6234, i8 0, i64 16, i1 false)
  br label %6235

6235:                                             ; preds = %6232, %6227
  %6236 = add nuw nsw i64 %.01, 779
  %6237 = call zeroext i8 @randombit()
  %6238 = getelementptr inbounds i8, i8* %1, i64 %6236
  store i8 %6237, i8* %6238, align 1
  %6239 = icmp eq i8 %6237, 0
  br i1 %6239, label %6240, label %6243

6240:                                             ; preds = %6235
  %6241 = shl nuw nsw i64 %6236, 4
  %6242 = getelementptr inbounds i8, i8* %0, i64 %6241
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6242, i8 0, i64 16, i1 false)
  br label %6243

6243:                                             ; preds = %6240, %6235
  %6244 = add nuw nsw i64 %.01, 780
  %6245 = call zeroext i8 @randombit()
  %6246 = getelementptr inbounds i8, i8* %1, i64 %6244
  store i8 %6245, i8* %6246, align 1
  %6247 = icmp eq i8 %6245, 0
  br i1 %6247, label %6248, label %6251

6248:                                             ; preds = %6243
  %6249 = shl nuw nsw i64 %6244, 4
  %6250 = getelementptr inbounds i8, i8* %0, i64 %6249
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6250, i8 0, i64 16, i1 false)
  br label %6251

6251:                                             ; preds = %6248, %6243
  %6252 = add nuw nsw i64 %.01, 781
  %6253 = call zeroext i8 @randombit()
  %6254 = getelementptr inbounds i8, i8* %1, i64 %6252
  store i8 %6253, i8* %6254, align 1
  %6255 = icmp eq i8 %6253, 0
  br i1 %6255, label %6256, label %6259

6256:                                             ; preds = %6251
  %6257 = shl nuw nsw i64 %6252, 4
  %6258 = getelementptr inbounds i8, i8* %0, i64 %6257
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6258, i8 0, i64 16, i1 false)
  br label %6259

6259:                                             ; preds = %6256, %6251
  %6260 = add nuw nsw i64 %.01, 782
  %6261 = call zeroext i8 @randombit()
  %6262 = getelementptr inbounds i8, i8* %1, i64 %6260
  store i8 %6261, i8* %6262, align 1
  %6263 = icmp eq i8 %6261, 0
  br i1 %6263, label %6264, label %6267

6264:                                             ; preds = %6259
  %6265 = shl nuw nsw i64 %6260, 4
  %6266 = getelementptr inbounds i8, i8* %0, i64 %6265
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6266, i8 0, i64 16, i1 false)
  br label %6267

6267:                                             ; preds = %6264, %6259
  %6268 = add nuw nsw i64 %.01, 783
  %6269 = call zeroext i8 @randombit()
  %6270 = getelementptr inbounds i8, i8* %1, i64 %6268
  store i8 %6269, i8* %6270, align 1
  %6271 = icmp eq i8 %6269, 0
  br i1 %6271, label %6272, label %6275

6272:                                             ; preds = %6267
  %6273 = shl nuw nsw i64 %6268, 4
  %6274 = getelementptr inbounds i8, i8* %0, i64 %6273
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6274, i8 0, i64 16, i1 false)
  br label %6275

6275:                                             ; preds = %6272, %6267
  %6276 = add nuw nsw i64 %.01, 784
  %6277 = call zeroext i8 @randombit()
  %6278 = getelementptr inbounds i8, i8* %1, i64 %6276
  store i8 %6277, i8* %6278, align 1
  %6279 = icmp eq i8 %6277, 0
  br i1 %6279, label %6280, label %6283

6280:                                             ; preds = %6275
  %6281 = shl nuw nsw i64 %6276, 4
  %6282 = getelementptr inbounds i8, i8* %0, i64 %6281
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6282, i8 0, i64 16, i1 false)
  br label %6283

6283:                                             ; preds = %6280, %6275
  %6284 = add nuw nsw i64 %.01, 785
  %6285 = call zeroext i8 @randombit()
  %6286 = getelementptr inbounds i8, i8* %1, i64 %6284
  store i8 %6285, i8* %6286, align 1
  %6287 = icmp eq i8 %6285, 0
  br i1 %6287, label %6288, label %6291

6288:                                             ; preds = %6283
  %6289 = shl nuw nsw i64 %6284, 4
  %6290 = getelementptr inbounds i8, i8* %0, i64 %6289
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6290, i8 0, i64 16, i1 false)
  br label %6291

6291:                                             ; preds = %6288, %6283
  %6292 = add nuw nsw i64 %.01, 786
  %6293 = call zeroext i8 @randombit()
  %6294 = getelementptr inbounds i8, i8* %1, i64 %6292
  store i8 %6293, i8* %6294, align 1
  %6295 = icmp eq i8 %6293, 0
  br i1 %6295, label %6296, label %6299

6296:                                             ; preds = %6291
  %6297 = shl nuw nsw i64 %6292, 4
  %6298 = getelementptr inbounds i8, i8* %0, i64 %6297
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6298, i8 0, i64 16, i1 false)
  br label %6299

6299:                                             ; preds = %6296, %6291
  %6300 = add nuw nsw i64 %.01, 787
  %6301 = call zeroext i8 @randombit()
  %6302 = getelementptr inbounds i8, i8* %1, i64 %6300
  store i8 %6301, i8* %6302, align 1
  %6303 = icmp eq i8 %6301, 0
  br i1 %6303, label %6304, label %6307

6304:                                             ; preds = %6299
  %6305 = shl nuw nsw i64 %6300, 4
  %6306 = getelementptr inbounds i8, i8* %0, i64 %6305
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6306, i8 0, i64 16, i1 false)
  br label %6307

6307:                                             ; preds = %6304, %6299
  %6308 = add nuw nsw i64 %.01, 788
  %6309 = call zeroext i8 @randombit()
  %6310 = getelementptr inbounds i8, i8* %1, i64 %6308
  store i8 %6309, i8* %6310, align 1
  %6311 = icmp eq i8 %6309, 0
  br i1 %6311, label %6312, label %6315

6312:                                             ; preds = %6307
  %6313 = shl nuw nsw i64 %6308, 4
  %6314 = getelementptr inbounds i8, i8* %0, i64 %6313
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6314, i8 0, i64 16, i1 false)
  br label %6315

6315:                                             ; preds = %6312, %6307
  %6316 = add nuw nsw i64 %.01, 789
  %6317 = call zeroext i8 @randombit()
  %6318 = getelementptr inbounds i8, i8* %1, i64 %6316
  store i8 %6317, i8* %6318, align 1
  %6319 = icmp eq i8 %6317, 0
  br i1 %6319, label %6320, label %6323

6320:                                             ; preds = %6315
  %6321 = shl nuw nsw i64 %6316, 4
  %6322 = getelementptr inbounds i8, i8* %0, i64 %6321
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6322, i8 0, i64 16, i1 false)
  br label %6323

6323:                                             ; preds = %6320, %6315
  %6324 = add nuw nsw i64 %.01, 790
  %6325 = call zeroext i8 @randombit()
  %6326 = getelementptr inbounds i8, i8* %1, i64 %6324
  store i8 %6325, i8* %6326, align 1
  %6327 = icmp eq i8 %6325, 0
  br i1 %6327, label %6328, label %6331

6328:                                             ; preds = %6323
  %6329 = shl nuw nsw i64 %6324, 4
  %6330 = getelementptr inbounds i8, i8* %0, i64 %6329
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6330, i8 0, i64 16, i1 false)
  br label %6331

6331:                                             ; preds = %6328, %6323
  %6332 = add nuw nsw i64 %.01, 791
  %6333 = call zeroext i8 @randombit()
  %6334 = getelementptr inbounds i8, i8* %1, i64 %6332
  store i8 %6333, i8* %6334, align 1
  %6335 = icmp eq i8 %6333, 0
  br i1 %6335, label %6336, label %6339

6336:                                             ; preds = %6331
  %6337 = shl nuw nsw i64 %6332, 4
  %6338 = getelementptr inbounds i8, i8* %0, i64 %6337
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6338, i8 0, i64 16, i1 false)
  br label %6339

6339:                                             ; preds = %6336, %6331
  %6340 = add nuw nsw i64 %.01, 792
  %6341 = call zeroext i8 @randombit()
  %6342 = getelementptr inbounds i8, i8* %1, i64 %6340
  store i8 %6341, i8* %6342, align 1
  %6343 = icmp eq i8 %6341, 0
  br i1 %6343, label %6344, label %6347

6344:                                             ; preds = %6339
  %6345 = shl nuw nsw i64 %6340, 4
  %6346 = getelementptr inbounds i8, i8* %0, i64 %6345
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6346, i8 0, i64 16, i1 false)
  br label %6347

6347:                                             ; preds = %6344, %6339
  %6348 = add nuw nsw i64 %.01, 793
  %6349 = call zeroext i8 @randombit()
  %6350 = getelementptr inbounds i8, i8* %1, i64 %6348
  store i8 %6349, i8* %6350, align 1
  %6351 = icmp eq i8 %6349, 0
  br i1 %6351, label %6352, label %6355

6352:                                             ; preds = %6347
  %6353 = shl nuw nsw i64 %6348, 4
  %6354 = getelementptr inbounds i8, i8* %0, i64 %6353
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6354, i8 0, i64 16, i1 false)
  br label %6355

6355:                                             ; preds = %6352, %6347
  %6356 = add nuw nsw i64 %.01, 794
  %6357 = call zeroext i8 @randombit()
  %6358 = getelementptr inbounds i8, i8* %1, i64 %6356
  store i8 %6357, i8* %6358, align 1
  %6359 = icmp eq i8 %6357, 0
  br i1 %6359, label %6360, label %6363

6360:                                             ; preds = %6355
  %6361 = shl nuw nsw i64 %6356, 4
  %6362 = getelementptr inbounds i8, i8* %0, i64 %6361
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6362, i8 0, i64 16, i1 false)
  br label %6363

6363:                                             ; preds = %6360, %6355
  %6364 = add nuw nsw i64 %.01, 795
  %6365 = call zeroext i8 @randombit()
  %6366 = getelementptr inbounds i8, i8* %1, i64 %6364
  store i8 %6365, i8* %6366, align 1
  %6367 = icmp eq i8 %6365, 0
  br i1 %6367, label %6368, label %6371

6368:                                             ; preds = %6363
  %6369 = shl nuw nsw i64 %6364, 4
  %6370 = getelementptr inbounds i8, i8* %0, i64 %6369
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6370, i8 0, i64 16, i1 false)
  br label %6371

6371:                                             ; preds = %6368, %6363
  %6372 = add nuw nsw i64 %.01, 796
  %6373 = call zeroext i8 @randombit()
  %6374 = getelementptr inbounds i8, i8* %1, i64 %6372
  store i8 %6373, i8* %6374, align 1
  %6375 = icmp eq i8 %6373, 0
  br i1 %6375, label %6376, label %6379

6376:                                             ; preds = %6371
  %6377 = shl nuw nsw i64 %6372, 4
  %6378 = getelementptr inbounds i8, i8* %0, i64 %6377
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6378, i8 0, i64 16, i1 false)
  br label %6379

6379:                                             ; preds = %6376, %6371
  %6380 = add nuw nsw i64 %.01, 797
  %6381 = call zeroext i8 @randombit()
  %6382 = getelementptr inbounds i8, i8* %1, i64 %6380
  store i8 %6381, i8* %6382, align 1
  %6383 = icmp eq i8 %6381, 0
  br i1 %6383, label %6384, label %6387

6384:                                             ; preds = %6379
  %6385 = shl nuw nsw i64 %6380, 4
  %6386 = getelementptr inbounds i8, i8* %0, i64 %6385
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6386, i8 0, i64 16, i1 false)
  br label %6387

6387:                                             ; preds = %6384, %6379
  %6388 = add nuw nsw i64 %.01, 798
  %6389 = call zeroext i8 @randombit()
  %6390 = getelementptr inbounds i8, i8* %1, i64 %6388
  store i8 %6389, i8* %6390, align 1
  %6391 = icmp eq i8 %6389, 0
  br i1 %6391, label %6392, label %6395

6392:                                             ; preds = %6387
  %6393 = shl nuw nsw i64 %6388, 4
  %6394 = getelementptr inbounds i8, i8* %0, i64 %6393
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6394, i8 0, i64 16, i1 false)
  br label %6395

6395:                                             ; preds = %6392, %6387
  %6396 = add nuw nsw i64 %.01, 799
  %6397 = call zeroext i8 @randombit()
  %6398 = getelementptr inbounds i8, i8* %1, i64 %6396
  store i8 %6397, i8* %6398, align 1
  %6399 = icmp eq i8 %6397, 0
  br i1 %6399, label %6400, label %6403

6400:                                             ; preds = %6395
  %6401 = shl nuw nsw i64 %6396, 4
  %6402 = getelementptr inbounds i8, i8* %0, i64 %6401
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6402, i8 0, i64 16, i1 false)
  br label %6403

6403:                                             ; preds = %6400, %6395
  %6404 = add nuw nsw i64 %.01, 800
  %6405 = call zeroext i8 @randombit()
  %6406 = getelementptr inbounds i8, i8* %1, i64 %6404
  store i8 %6405, i8* %6406, align 1
  %6407 = icmp eq i8 %6405, 0
  br i1 %6407, label %6408, label %6411

6408:                                             ; preds = %6403
  %6409 = shl nuw nsw i64 %6404, 4
  %6410 = getelementptr inbounds i8, i8* %0, i64 %6409
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6410, i8 0, i64 16, i1 false)
  br label %6411

6411:                                             ; preds = %6408, %6403
  %6412 = add nuw nsw i64 %.01, 801
  %6413 = call zeroext i8 @randombit()
  %6414 = getelementptr inbounds i8, i8* %1, i64 %6412
  store i8 %6413, i8* %6414, align 1
  %6415 = icmp eq i8 %6413, 0
  br i1 %6415, label %6416, label %6419

6416:                                             ; preds = %6411
  %6417 = shl nuw nsw i64 %6412, 4
  %6418 = getelementptr inbounds i8, i8* %0, i64 %6417
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6418, i8 0, i64 16, i1 false)
  br label %6419

6419:                                             ; preds = %6416, %6411
  %6420 = add nuw nsw i64 %.01, 802
  %6421 = call zeroext i8 @randombit()
  %6422 = getelementptr inbounds i8, i8* %1, i64 %6420
  store i8 %6421, i8* %6422, align 1
  %6423 = icmp eq i8 %6421, 0
  br i1 %6423, label %6424, label %6427

6424:                                             ; preds = %6419
  %6425 = shl nuw nsw i64 %6420, 4
  %6426 = getelementptr inbounds i8, i8* %0, i64 %6425
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6426, i8 0, i64 16, i1 false)
  br label %6427

6427:                                             ; preds = %6424, %6419
  %6428 = add nuw nsw i64 %.01, 803
  %6429 = call zeroext i8 @randombit()
  %6430 = getelementptr inbounds i8, i8* %1, i64 %6428
  store i8 %6429, i8* %6430, align 1
  %6431 = icmp eq i8 %6429, 0
  br i1 %6431, label %6432, label %6435

6432:                                             ; preds = %6427
  %6433 = shl nuw nsw i64 %6428, 4
  %6434 = getelementptr inbounds i8, i8* %0, i64 %6433
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6434, i8 0, i64 16, i1 false)
  br label %6435

6435:                                             ; preds = %6432, %6427
  %6436 = add nuw nsw i64 %.01, 804
  %6437 = call zeroext i8 @randombit()
  %6438 = getelementptr inbounds i8, i8* %1, i64 %6436
  store i8 %6437, i8* %6438, align 1
  %6439 = icmp eq i8 %6437, 0
  br i1 %6439, label %6440, label %6443

6440:                                             ; preds = %6435
  %6441 = shl nuw nsw i64 %6436, 4
  %6442 = getelementptr inbounds i8, i8* %0, i64 %6441
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6442, i8 0, i64 16, i1 false)
  br label %6443

6443:                                             ; preds = %6440, %6435
  %6444 = add nuw nsw i64 %.01, 805
  %6445 = call zeroext i8 @randombit()
  %6446 = getelementptr inbounds i8, i8* %1, i64 %6444
  store i8 %6445, i8* %6446, align 1
  %6447 = icmp eq i8 %6445, 0
  br i1 %6447, label %6448, label %6451

6448:                                             ; preds = %6443
  %6449 = shl nuw nsw i64 %6444, 4
  %6450 = getelementptr inbounds i8, i8* %0, i64 %6449
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6450, i8 0, i64 16, i1 false)
  br label %6451

6451:                                             ; preds = %6448, %6443
  %6452 = add nuw nsw i64 %.01, 806
  %6453 = call zeroext i8 @randombit()
  %6454 = getelementptr inbounds i8, i8* %1, i64 %6452
  store i8 %6453, i8* %6454, align 1
  %6455 = icmp eq i8 %6453, 0
  br i1 %6455, label %6456, label %6459

6456:                                             ; preds = %6451
  %6457 = shl nuw nsw i64 %6452, 4
  %6458 = getelementptr inbounds i8, i8* %0, i64 %6457
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6458, i8 0, i64 16, i1 false)
  br label %6459

6459:                                             ; preds = %6456, %6451
  %6460 = add nuw nsw i64 %.01, 807
  %6461 = call zeroext i8 @randombit()
  %6462 = getelementptr inbounds i8, i8* %1, i64 %6460
  store i8 %6461, i8* %6462, align 1
  %6463 = icmp eq i8 %6461, 0
  br i1 %6463, label %6464, label %6467

6464:                                             ; preds = %6459
  %6465 = shl nuw nsw i64 %6460, 4
  %6466 = getelementptr inbounds i8, i8* %0, i64 %6465
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6466, i8 0, i64 16, i1 false)
  br label %6467

6467:                                             ; preds = %6464, %6459
  %6468 = add nuw nsw i64 %.01, 808
  %6469 = call zeroext i8 @randombit()
  %6470 = getelementptr inbounds i8, i8* %1, i64 %6468
  store i8 %6469, i8* %6470, align 1
  %6471 = icmp eq i8 %6469, 0
  br i1 %6471, label %6472, label %6475

6472:                                             ; preds = %6467
  %6473 = shl nuw nsw i64 %6468, 4
  %6474 = getelementptr inbounds i8, i8* %0, i64 %6473
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6474, i8 0, i64 16, i1 false)
  br label %6475

6475:                                             ; preds = %6472, %6467
  %6476 = add nuw nsw i64 %.01, 809
  %6477 = call zeroext i8 @randombit()
  %6478 = getelementptr inbounds i8, i8* %1, i64 %6476
  store i8 %6477, i8* %6478, align 1
  %6479 = icmp eq i8 %6477, 0
  br i1 %6479, label %6480, label %6483

6480:                                             ; preds = %6475
  %6481 = shl nuw nsw i64 %6476, 4
  %6482 = getelementptr inbounds i8, i8* %0, i64 %6481
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6482, i8 0, i64 16, i1 false)
  br label %6483

6483:                                             ; preds = %6480, %6475
  %6484 = add nuw nsw i64 %.01, 810
  %6485 = call zeroext i8 @randombit()
  %6486 = getelementptr inbounds i8, i8* %1, i64 %6484
  store i8 %6485, i8* %6486, align 1
  %6487 = icmp eq i8 %6485, 0
  br i1 %6487, label %6488, label %6491

6488:                                             ; preds = %6483
  %6489 = shl nuw nsw i64 %6484, 4
  %6490 = getelementptr inbounds i8, i8* %0, i64 %6489
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6490, i8 0, i64 16, i1 false)
  br label %6491

6491:                                             ; preds = %6488, %6483
  %6492 = add nuw nsw i64 %.01, 811
  %6493 = call zeroext i8 @randombit()
  %6494 = getelementptr inbounds i8, i8* %1, i64 %6492
  store i8 %6493, i8* %6494, align 1
  %6495 = icmp eq i8 %6493, 0
  br i1 %6495, label %6496, label %6499

6496:                                             ; preds = %6491
  %6497 = shl nuw nsw i64 %6492, 4
  %6498 = getelementptr inbounds i8, i8* %0, i64 %6497
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6498, i8 0, i64 16, i1 false)
  br label %6499

6499:                                             ; preds = %6496, %6491
  %6500 = add nuw nsw i64 %.01, 812
  %6501 = call zeroext i8 @randombit()
  %6502 = getelementptr inbounds i8, i8* %1, i64 %6500
  store i8 %6501, i8* %6502, align 1
  %6503 = icmp eq i8 %6501, 0
  br i1 %6503, label %6504, label %6507

6504:                                             ; preds = %6499
  %6505 = shl nuw nsw i64 %6500, 4
  %6506 = getelementptr inbounds i8, i8* %0, i64 %6505
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6506, i8 0, i64 16, i1 false)
  br label %6507

6507:                                             ; preds = %6504, %6499
  %6508 = add nuw nsw i64 %.01, 813
  %6509 = call zeroext i8 @randombit()
  %6510 = getelementptr inbounds i8, i8* %1, i64 %6508
  store i8 %6509, i8* %6510, align 1
  %6511 = icmp eq i8 %6509, 0
  br i1 %6511, label %6512, label %6515

6512:                                             ; preds = %6507
  %6513 = shl nuw nsw i64 %6508, 4
  %6514 = getelementptr inbounds i8, i8* %0, i64 %6513
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6514, i8 0, i64 16, i1 false)
  br label %6515

6515:                                             ; preds = %6512, %6507
  %6516 = add nuw nsw i64 %.01, 814
  %6517 = call zeroext i8 @randombit()
  %6518 = getelementptr inbounds i8, i8* %1, i64 %6516
  store i8 %6517, i8* %6518, align 1
  %6519 = icmp eq i8 %6517, 0
  br i1 %6519, label %6520, label %6523

6520:                                             ; preds = %6515
  %6521 = shl nuw nsw i64 %6516, 4
  %6522 = getelementptr inbounds i8, i8* %0, i64 %6521
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6522, i8 0, i64 16, i1 false)
  br label %6523

6523:                                             ; preds = %6520, %6515
  %6524 = add nuw nsw i64 %.01, 815
  %6525 = call zeroext i8 @randombit()
  %6526 = getelementptr inbounds i8, i8* %1, i64 %6524
  store i8 %6525, i8* %6526, align 1
  %6527 = icmp eq i8 %6525, 0
  br i1 %6527, label %6528, label %6531

6528:                                             ; preds = %6523
  %6529 = shl nuw nsw i64 %6524, 4
  %6530 = getelementptr inbounds i8, i8* %0, i64 %6529
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6530, i8 0, i64 16, i1 false)
  br label %6531

6531:                                             ; preds = %6528, %6523
  %6532 = add nuw nsw i64 %.01, 816
  %6533 = call zeroext i8 @randombit()
  %6534 = getelementptr inbounds i8, i8* %1, i64 %6532
  store i8 %6533, i8* %6534, align 1
  %6535 = icmp eq i8 %6533, 0
  br i1 %6535, label %6536, label %6539

6536:                                             ; preds = %6531
  %6537 = shl nuw nsw i64 %6532, 4
  %6538 = getelementptr inbounds i8, i8* %0, i64 %6537
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6538, i8 0, i64 16, i1 false)
  br label %6539

6539:                                             ; preds = %6536, %6531
  %6540 = add nuw nsw i64 %.01, 817
  %6541 = call zeroext i8 @randombit()
  %6542 = getelementptr inbounds i8, i8* %1, i64 %6540
  store i8 %6541, i8* %6542, align 1
  %6543 = icmp eq i8 %6541, 0
  br i1 %6543, label %6544, label %6547

6544:                                             ; preds = %6539
  %6545 = shl nuw nsw i64 %6540, 4
  %6546 = getelementptr inbounds i8, i8* %0, i64 %6545
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6546, i8 0, i64 16, i1 false)
  br label %6547

6547:                                             ; preds = %6544, %6539
  %6548 = add nuw nsw i64 %.01, 818
  %6549 = call zeroext i8 @randombit()
  %6550 = getelementptr inbounds i8, i8* %1, i64 %6548
  store i8 %6549, i8* %6550, align 1
  %6551 = icmp eq i8 %6549, 0
  br i1 %6551, label %6552, label %6555

6552:                                             ; preds = %6547
  %6553 = shl nuw nsw i64 %6548, 4
  %6554 = getelementptr inbounds i8, i8* %0, i64 %6553
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6554, i8 0, i64 16, i1 false)
  br label %6555

6555:                                             ; preds = %6552, %6547
  %6556 = add nuw nsw i64 %.01, 819
  %6557 = call zeroext i8 @randombit()
  %6558 = getelementptr inbounds i8, i8* %1, i64 %6556
  store i8 %6557, i8* %6558, align 1
  %6559 = icmp eq i8 %6557, 0
  br i1 %6559, label %6560, label %6563

6560:                                             ; preds = %6555
  %6561 = shl nuw nsw i64 %6556, 4
  %6562 = getelementptr inbounds i8, i8* %0, i64 %6561
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6562, i8 0, i64 16, i1 false)
  br label %6563

6563:                                             ; preds = %6560, %6555
  %6564 = add nuw nsw i64 %.01, 820
  %6565 = call zeroext i8 @randombit()
  %6566 = getelementptr inbounds i8, i8* %1, i64 %6564
  store i8 %6565, i8* %6566, align 1
  %6567 = icmp eq i8 %6565, 0
  br i1 %6567, label %6568, label %6571

6568:                                             ; preds = %6563
  %6569 = shl nuw nsw i64 %6564, 4
  %6570 = getelementptr inbounds i8, i8* %0, i64 %6569
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6570, i8 0, i64 16, i1 false)
  br label %6571

6571:                                             ; preds = %6568, %6563
  %6572 = add nuw nsw i64 %.01, 821
  %6573 = call zeroext i8 @randombit()
  %6574 = getelementptr inbounds i8, i8* %1, i64 %6572
  store i8 %6573, i8* %6574, align 1
  %6575 = icmp eq i8 %6573, 0
  br i1 %6575, label %6576, label %6579

6576:                                             ; preds = %6571
  %6577 = shl nuw nsw i64 %6572, 4
  %6578 = getelementptr inbounds i8, i8* %0, i64 %6577
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6578, i8 0, i64 16, i1 false)
  br label %6579

6579:                                             ; preds = %6576, %6571
  %6580 = add nuw nsw i64 %.01, 822
  %6581 = call zeroext i8 @randombit()
  %6582 = getelementptr inbounds i8, i8* %1, i64 %6580
  store i8 %6581, i8* %6582, align 1
  %6583 = icmp eq i8 %6581, 0
  br i1 %6583, label %6584, label %6587

6584:                                             ; preds = %6579
  %6585 = shl nuw nsw i64 %6580, 4
  %6586 = getelementptr inbounds i8, i8* %0, i64 %6585
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6586, i8 0, i64 16, i1 false)
  br label %6587

6587:                                             ; preds = %6584, %6579
  %6588 = add nuw nsw i64 %.01, 823
  %6589 = call zeroext i8 @randombit()
  %6590 = getelementptr inbounds i8, i8* %1, i64 %6588
  store i8 %6589, i8* %6590, align 1
  %6591 = icmp eq i8 %6589, 0
  br i1 %6591, label %6592, label %6595

6592:                                             ; preds = %6587
  %6593 = shl nuw nsw i64 %6588, 4
  %6594 = getelementptr inbounds i8, i8* %0, i64 %6593
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6594, i8 0, i64 16, i1 false)
  br label %6595

6595:                                             ; preds = %6592, %6587
  %6596 = add nuw nsw i64 %.01, 824
  %6597 = call zeroext i8 @randombit()
  %6598 = getelementptr inbounds i8, i8* %1, i64 %6596
  store i8 %6597, i8* %6598, align 1
  %6599 = icmp eq i8 %6597, 0
  br i1 %6599, label %6600, label %6603

6600:                                             ; preds = %6595
  %6601 = shl nuw nsw i64 %6596, 4
  %6602 = getelementptr inbounds i8, i8* %0, i64 %6601
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6602, i8 0, i64 16, i1 false)
  br label %6603

6603:                                             ; preds = %6600, %6595
  %6604 = add nuw nsw i64 %.01, 825
  %6605 = call zeroext i8 @randombit()
  %6606 = getelementptr inbounds i8, i8* %1, i64 %6604
  store i8 %6605, i8* %6606, align 1
  %6607 = icmp eq i8 %6605, 0
  br i1 %6607, label %6608, label %6611

6608:                                             ; preds = %6603
  %6609 = shl nuw nsw i64 %6604, 4
  %6610 = getelementptr inbounds i8, i8* %0, i64 %6609
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6610, i8 0, i64 16, i1 false)
  br label %6611

6611:                                             ; preds = %6608, %6603
  %6612 = add nuw nsw i64 %.01, 826
  %6613 = call zeroext i8 @randombit()
  %6614 = getelementptr inbounds i8, i8* %1, i64 %6612
  store i8 %6613, i8* %6614, align 1
  %6615 = icmp eq i8 %6613, 0
  br i1 %6615, label %6616, label %6619

6616:                                             ; preds = %6611
  %6617 = shl nuw nsw i64 %6612, 4
  %6618 = getelementptr inbounds i8, i8* %0, i64 %6617
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6618, i8 0, i64 16, i1 false)
  br label %6619

6619:                                             ; preds = %6616, %6611
  %6620 = add nuw nsw i64 %.01, 827
  %6621 = call zeroext i8 @randombit()
  %6622 = getelementptr inbounds i8, i8* %1, i64 %6620
  store i8 %6621, i8* %6622, align 1
  %6623 = icmp eq i8 %6621, 0
  br i1 %6623, label %6624, label %6627

6624:                                             ; preds = %6619
  %6625 = shl nuw nsw i64 %6620, 4
  %6626 = getelementptr inbounds i8, i8* %0, i64 %6625
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6626, i8 0, i64 16, i1 false)
  br label %6627

6627:                                             ; preds = %6624, %6619
  %6628 = add nuw nsw i64 %.01, 828
  %6629 = call zeroext i8 @randombit()
  %6630 = getelementptr inbounds i8, i8* %1, i64 %6628
  store i8 %6629, i8* %6630, align 1
  %6631 = icmp eq i8 %6629, 0
  br i1 %6631, label %6632, label %6635

6632:                                             ; preds = %6627
  %6633 = shl nuw nsw i64 %6628, 4
  %6634 = getelementptr inbounds i8, i8* %0, i64 %6633
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6634, i8 0, i64 16, i1 false)
  br label %6635

6635:                                             ; preds = %6632, %6627
  %6636 = add nuw nsw i64 %.01, 829
  %6637 = call zeroext i8 @randombit()
  %6638 = getelementptr inbounds i8, i8* %1, i64 %6636
  store i8 %6637, i8* %6638, align 1
  %6639 = icmp eq i8 %6637, 0
  br i1 %6639, label %6640, label %6643

6640:                                             ; preds = %6635
  %6641 = shl nuw nsw i64 %6636, 4
  %6642 = getelementptr inbounds i8, i8* %0, i64 %6641
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6642, i8 0, i64 16, i1 false)
  br label %6643

6643:                                             ; preds = %6640, %6635
  %6644 = add nuw nsw i64 %.01, 830
  %6645 = call zeroext i8 @randombit()
  %6646 = getelementptr inbounds i8, i8* %1, i64 %6644
  store i8 %6645, i8* %6646, align 1
  %6647 = icmp eq i8 %6645, 0
  br i1 %6647, label %6648, label %6651

6648:                                             ; preds = %6643
  %6649 = shl nuw nsw i64 %6644, 4
  %6650 = getelementptr inbounds i8, i8* %0, i64 %6649
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6650, i8 0, i64 16, i1 false)
  br label %6651

6651:                                             ; preds = %6648, %6643
  %6652 = add nuw nsw i64 %.01, 831
  %6653 = call zeroext i8 @randombit()
  %6654 = getelementptr inbounds i8, i8* %1, i64 %6652
  store i8 %6653, i8* %6654, align 1
  %6655 = icmp eq i8 %6653, 0
  br i1 %6655, label %6656, label %6659

6656:                                             ; preds = %6651
  %6657 = shl nuw nsw i64 %6652, 4
  %6658 = getelementptr inbounds i8, i8* %0, i64 %6657
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6658, i8 0, i64 16, i1 false)
  br label %6659

6659:                                             ; preds = %6656, %6651
  %6660 = add nuw nsw i64 %.01, 832
  %6661 = call zeroext i8 @randombit()
  %6662 = getelementptr inbounds i8, i8* %1, i64 %6660
  store i8 %6661, i8* %6662, align 1
  %6663 = icmp eq i8 %6661, 0
  br i1 %6663, label %6664, label %6667

6664:                                             ; preds = %6659
  %6665 = shl nuw nsw i64 %6660, 4
  %6666 = getelementptr inbounds i8, i8* %0, i64 %6665
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6666, i8 0, i64 16, i1 false)
  br label %6667

6667:                                             ; preds = %6664, %6659
  %6668 = add nuw nsw i64 %.01, 833
  %6669 = call zeroext i8 @randombit()
  %6670 = getelementptr inbounds i8, i8* %1, i64 %6668
  store i8 %6669, i8* %6670, align 1
  %6671 = icmp eq i8 %6669, 0
  br i1 %6671, label %6672, label %6675

6672:                                             ; preds = %6667
  %6673 = shl nuw nsw i64 %6668, 4
  %6674 = getelementptr inbounds i8, i8* %0, i64 %6673
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6674, i8 0, i64 16, i1 false)
  br label %6675

6675:                                             ; preds = %6672, %6667
  %6676 = add nuw nsw i64 %.01, 834
  %6677 = call zeroext i8 @randombit()
  %6678 = getelementptr inbounds i8, i8* %1, i64 %6676
  store i8 %6677, i8* %6678, align 1
  %6679 = icmp eq i8 %6677, 0
  br i1 %6679, label %6680, label %6683

6680:                                             ; preds = %6675
  %6681 = shl nuw nsw i64 %6676, 4
  %6682 = getelementptr inbounds i8, i8* %0, i64 %6681
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6682, i8 0, i64 16, i1 false)
  br label %6683

6683:                                             ; preds = %6680, %6675
  %6684 = add nuw nsw i64 %.01, 835
  %6685 = call zeroext i8 @randombit()
  %6686 = getelementptr inbounds i8, i8* %1, i64 %6684
  store i8 %6685, i8* %6686, align 1
  %6687 = icmp eq i8 %6685, 0
  br i1 %6687, label %6688, label %6691

6688:                                             ; preds = %6683
  %6689 = shl nuw nsw i64 %6684, 4
  %6690 = getelementptr inbounds i8, i8* %0, i64 %6689
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6690, i8 0, i64 16, i1 false)
  br label %6691

6691:                                             ; preds = %6688, %6683
  %6692 = add nuw nsw i64 %.01, 836
  %6693 = call zeroext i8 @randombit()
  %6694 = getelementptr inbounds i8, i8* %1, i64 %6692
  store i8 %6693, i8* %6694, align 1
  %6695 = icmp eq i8 %6693, 0
  br i1 %6695, label %6696, label %6699

6696:                                             ; preds = %6691
  %6697 = shl nuw nsw i64 %6692, 4
  %6698 = getelementptr inbounds i8, i8* %0, i64 %6697
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6698, i8 0, i64 16, i1 false)
  br label %6699

6699:                                             ; preds = %6696, %6691
  %6700 = add nuw nsw i64 %.01, 837
  %6701 = call zeroext i8 @randombit()
  %6702 = getelementptr inbounds i8, i8* %1, i64 %6700
  store i8 %6701, i8* %6702, align 1
  %6703 = icmp eq i8 %6701, 0
  br i1 %6703, label %6704, label %6707

6704:                                             ; preds = %6699
  %6705 = shl nuw nsw i64 %6700, 4
  %6706 = getelementptr inbounds i8, i8* %0, i64 %6705
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6706, i8 0, i64 16, i1 false)
  br label %6707

6707:                                             ; preds = %6704, %6699
  %6708 = add nuw nsw i64 %.01, 838
  %6709 = call zeroext i8 @randombit()
  %6710 = getelementptr inbounds i8, i8* %1, i64 %6708
  store i8 %6709, i8* %6710, align 1
  %6711 = icmp eq i8 %6709, 0
  br i1 %6711, label %6712, label %6715

6712:                                             ; preds = %6707
  %6713 = shl nuw nsw i64 %6708, 4
  %6714 = getelementptr inbounds i8, i8* %0, i64 %6713
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6714, i8 0, i64 16, i1 false)
  br label %6715

6715:                                             ; preds = %6712, %6707
  %6716 = add nuw nsw i64 %.01, 839
  %6717 = call zeroext i8 @randombit()
  %6718 = getelementptr inbounds i8, i8* %1, i64 %6716
  store i8 %6717, i8* %6718, align 1
  %6719 = icmp eq i8 %6717, 0
  br i1 %6719, label %6720, label %6723

6720:                                             ; preds = %6715
  %6721 = shl nuw nsw i64 %6716, 4
  %6722 = getelementptr inbounds i8, i8* %0, i64 %6721
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6722, i8 0, i64 16, i1 false)
  br label %6723

6723:                                             ; preds = %6720, %6715
  %6724 = add nuw nsw i64 %.01, 840
  %6725 = call zeroext i8 @randombit()
  %6726 = getelementptr inbounds i8, i8* %1, i64 %6724
  store i8 %6725, i8* %6726, align 1
  %6727 = icmp eq i8 %6725, 0
  br i1 %6727, label %6728, label %6731

6728:                                             ; preds = %6723
  %6729 = shl nuw nsw i64 %6724, 4
  %6730 = getelementptr inbounds i8, i8* %0, i64 %6729
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6730, i8 0, i64 16, i1 false)
  br label %6731

6731:                                             ; preds = %6728, %6723
  %6732 = add nuw nsw i64 %.01, 841
  %6733 = call zeroext i8 @randombit()
  %6734 = getelementptr inbounds i8, i8* %1, i64 %6732
  store i8 %6733, i8* %6734, align 1
  %6735 = icmp eq i8 %6733, 0
  br i1 %6735, label %6736, label %6739

6736:                                             ; preds = %6731
  %6737 = shl nuw nsw i64 %6732, 4
  %6738 = getelementptr inbounds i8, i8* %0, i64 %6737
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6738, i8 0, i64 16, i1 false)
  br label %6739

6739:                                             ; preds = %6736, %6731
  %6740 = add nuw nsw i64 %.01, 842
  %6741 = call zeroext i8 @randombit()
  %6742 = getelementptr inbounds i8, i8* %1, i64 %6740
  store i8 %6741, i8* %6742, align 1
  %6743 = icmp eq i8 %6741, 0
  br i1 %6743, label %6744, label %6747

6744:                                             ; preds = %6739
  %6745 = shl nuw nsw i64 %6740, 4
  %6746 = getelementptr inbounds i8, i8* %0, i64 %6745
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6746, i8 0, i64 16, i1 false)
  br label %6747

6747:                                             ; preds = %6744, %6739
  %6748 = add nuw nsw i64 %.01, 843
  %6749 = call zeroext i8 @randombit()
  %6750 = getelementptr inbounds i8, i8* %1, i64 %6748
  store i8 %6749, i8* %6750, align 1
  %6751 = icmp eq i8 %6749, 0
  br i1 %6751, label %6752, label %6755

6752:                                             ; preds = %6747
  %6753 = shl nuw nsw i64 %6748, 4
  %6754 = getelementptr inbounds i8, i8* %0, i64 %6753
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6754, i8 0, i64 16, i1 false)
  br label %6755

6755:                                             ; preds = %6752, %6747
  %6756 = add nuw nsw i64 %.01, 844
  %6757 = call zeroext i8 @randombit()
  %6758 = getelementptr inbounds i8, i8* %1, i64 %6756
  store i8 %6757, i8* %6758, align 1
  %6759 = icmp eq i8 %6757, 0
  br i1 %6759, label %6760, label %6763

6760:                                             ; preds = %6755
  %6761 = shl nuw nsw i64 %6756, 4
  %6762 = getelementptr inbounds i8, i8* %0, i64 %6761
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6762, i8 0, i64 16, i1 false)
  br label %6763

6763:                                             ; preds = %6760, %6755
  %6764 = add nuw nsw i64 %.01, 845
  %6765 = call zeroext i8 @randombit()
  %6766 = getelementptr inbounds i8, i8* %1, i64 %6764
  store i8 %6765, i8* %6766, align 1
  %6767 = icmp eq i8 %6765, 0
  br i1 %6767, label %6768, label %6771

6768:                                             ; preds = %6763
  %6769 = shl nuw nsw i64 %6764, 4
  %6770 = getelementptr inbounds i8, i8* %0, i64 %6769
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6770, i8 0, i64 16, i1 false)
  br label %6771

6771:                                             ; preds = %6768, %6763
  %6772 = add nuw nsw i64 %.01, 846
  %6773 = call zeroext i8 @randombit()
  %6774 = getelementptr inbounds i8, i8* %1, i64 %6772
  store i8 %6773, i8* %6774, align 1
  %6775 = icmp eq i8 %6773, 0
  br i1 %6775, label %6776, label %6779

6776:                                             ; preds = %6771
  %6777 = shl nuw nsw i64 %6772, 4
  %6778 = getelementptr inbounds i8, i8* %0, i64 %6777
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6778, i8 0, i64 16, i1 false)
  br label %6779

6779:                                             ; preds = %6776, %6771
  %6780 = add nuw nsw i64 %.01, 847
  %6781 = call zeroext i8 @randombit()
  %6782 = getelementptr inbounds i8, i8* %1, i64 %6780
  store i8 %6781, i8* %6782, align 1
  %6783 = icmp eq i8 %6781, 0
  br i1 %6783, label %6784, label %6787

6784:                                             ; preds = %6779
  %6785 = shl nuw nsw i64 %6780, 4
  %6786 = getelementptr inbounds i8, i8* %0, i64 %6785
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6786, i8 0, i64 16, i1 false)
  br label %6787

6787:                                             ; preds = %6784, %6779
  %6788 = add nuw nsw i64 %.01, 848
  %6789 = call zeroext i8 @randombit()
  %6790 = getelementptr inbounds i8, i8* %1, i64 %6788
  store i8 %6789, i8* %6790, align 1
  %6791 = icmp eq i8 %6789, 0
  br i1 %6791, label %6792, label %6795

6792:                                             ; preds = %6787
  %6793 = shl nuw nsw i64 %6788, 4
  %6794 = getelementptr inbounds i8, i8* %0, i64 %6793
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6794, i8 0, i64 16, i1 false)
  br label %6795

6795:                                             ; preds = %6792, %6787
  %6796 = add nuw nsw i64 %.01, 849
  %6797 = call zeroext i8 @randombit()
  %6798 = getelementptr inbounds i8, i8* %1, i64 %6796
  store i8 %6797, i8* %6798, align 1
  %6799 = icmp eq i8 %6797, 0
  br i1 %6799, label %6800, label %6803

6800:                                             ; preds = %6795
  %6801 = shl nuw nsw i64 %6796, 4
  %6802 = getelementptr inbounds i8, i8* %0, i64 %6801
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6802, i8 0, i64 16, i1 false)
  br label %6803

6803:                                             ; preds = %6800, %6795
  %6804 = add nuw nsw i64 %.01, 850
  %6805 = call zeroext i8 @randombit()
  %6806 = getelementptr inbounds i8, i8* %1, i64 %6804
  store i8 %6805, i8* %6806, align 1
  %6807 = icmp eq i8 %6805, 0
  br i1 %6807, label %6808, label %6811

6808:                                             ; preds = %6803
  %6809 = shl nuw nsw i64 %6804, 4
  %6810 = getelementptr inbounds i8, i8* %0, i64 %6809
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6810, i8 0, i64 16, i1 false)
  br label %6811

6811:                                             ; preds = %6808, %6803
  %6812 = add nuw nsw i64 %.01, 851
  %6813 = call zeroext i8 @randombit()
  %6814 = getelementptr inbounds i8, i8* %1, i64 %6812
  store i8 %6813, i8* %6814, align 1
  %6815 = icmp eq i8 %6813, 0
  br i1 %6815, label %6816, label %6819

6816:                                             ; preds = %6811
  %6817 = shl nuw nsw i64 %6812, 4
  %6818 = getelementptr inbounds i8, i8* %0, i64 %6817
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6818, i8 0, i64 16, i1 false)
  br label %6819

6819:                                             ; preds = %6816, %6811
  %6820 = add nuw nsw i64 %.01, 852
  %6821 = call zeroext i8 @randombit()
  %6822 = getelementptr inbounds i8, i8* %1, i64 %6820
  store i8 %6821, i8* %6822, align 1
  %6823 = icmp eq i8 %6821, 0
  br i1 %6823, label %6824, label %6827

6824:                                             ; preds = %6819
  %6825 = shl nuw nsw i64 %6820, 4
  %6826 = getelementptr inbounds i8, i8* %0, i64 %6825
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6826, i8 0, i64 16, i1 false)
  br label %6827

6827:                                             ; preds = %6824, %6819
  %6828 = add nuw nsw i64 %.01, 853
  %6829 = call zeroext i8 @randombit()
  %6830 = getelementptr inbounds i8, i8* %1, i64 %6828
  store i8 %6829, i8* %6830, align 1
  %6831 = icmp eq i8 %6829, 0
  br i1 %6831, label %6832, label %6835

6832:                                             ; preds = %6827
  %6833 = shl nuw nsw i64 %6828, 4
  %6834 = getelementptr inbounds i8, i8* %0, i64 %6833
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6834, i8 0, i64 16, i1 false)
  br label %6835

6835:                                             ; preds = %6832, %6827
  %6836 = add nuw nsw i64 %.01, 854
  %6837 = call zeroext i8 @randombit()
  %6838 = getelementptr inbounds i8, i8* %1, i64 %6836
  store i8 %6837, i8* %6838, align 1
  %6839 = icmp eq i8 %6837, 0
  br i1 %6839, label %6840, label %6843

6840:                                             ; preds = %6835
  %6841 = shl nuw nsw i64 %6836, 4
  %6842 = getelementptr inbounds i8, i8* %0, i64 %6841
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6842, i8 0, i64 16, i1 false)
  br label %6843

6843:                                             ; preds = %6840, %6835
  %6844 = add nuw nsw i64 %.01, 855
  %6845 = call zeroext i8 @randombit()
  %6846 = getelementptr inbounds i8, i8* %1, i64 %6844
  store i8 %6845, i8* %6846, align 1
  %6847 = icmp eq i8 %6845, 0
  br i1 %6847, label %6848, label %6851

6848:                                             ; preds = %6843
  %6849 = shl nuw nsw i64 %6844, 4
  %6850 = getelementptr inbounds i8, i8* %0, i64 %6849
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6850, i8 0, i64 16, i1 false)
  br label %6851

6851:                                             ; preds = %6848, %6843
  %6852 = add nuw nsw i64 %.01, 856
  %6853 = call zeroext i8 @randombit()
  %6854 = getelementptr inbounds i8, i8* %1, i64 %6852
  store i8 %6853, i8* %6854, align 1
  %6855 = icmp eq i8 %6853, 0
  br i1 %6855, label %6856, label %6859

6856:                                             ; preds = %6851
  %6857 = shl nuw nsw i64 %6852, 4
  %6858 = getelementptr inbounds i8, i8* %0, i64 %6857
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6858, i8 0, i64 16, i1 false)
  br label %6859

6859:                                             ; preds = %6856, %6851
  %6860 = add nuw nsw i64 %.01, 857
  %6861 = call zeroext i8 @randombit()
  %6862 = getelementptr inbounds i8, i8* %1, i64 %6860
  store i8 %6861, i8* %6862, align 1
  %6863 = icmp eq i8 %6861, 0
  br i1 %6863, label %6864, label %6867

6864:                                             ; preds = %6859
  %6865 = shl nuw nsw i64 %6860, 4
  %6866 = getelementptr inbounds i8, i8* %0, i64 %6865
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6866, i8 0, i64 16, i1 false)
  br label %6867

6867:                                             ; preds = %6864, %6859
  %6868 = add nuw nsw i64 %.01, 858
  %6869 = call zeroext i8 @randombit()
  %6870 = getelementptr inbounds i8, i8* %1, i64 %6868
  store i8 %6869, i8* %6870, align 1
  %6871 = icmp eq i8 %6869, 0
  br i1 %6871, label %6872, label %6875

6872:                                             ; preds = %6867
  %6873 = shl nuw nsw i64 %6868, 4
  %6874 = getelementptr inbounds i8, i8* %0, i64 %6873
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6874, i8 0, i64 16, i1 false)
  br label %6875

6875:                                             ; preds = %6872, %6867
  %6876 = add nuw nsw i64 %.01, 859
  %6877 = call zeroext i8 @randombit()
  %6878 = getelementptr inbounds i8, i8* %1, i64 %6876
  store i8 %6877, i8* %6878, align 1
  %6879 = icmp eq i8 %6877, 0
  br i1 %6879, label %6880, label %6883

6880:                                             ; preds = %6875
  %6881 = shl nuw nsw i64 %6876, 4
  %6882 = getelementptr inbounds i8, i8* %0, i64 %6881
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6882, i8 0, i64 16, i1 false)
  br label %6883

6883:                                             ; preds = %6880, %6875
  %6884 = add nuw nsw i64 %.01, 860
  %6885 = call zeroext i8 @randombit()
  %6886 = getelementptr inbounds i8, i8* %1, i64 %6884
  store i8 %6885, i8* %6886, align 1
  %6887 = icmp eq i8 %6885, 0
  br i1 %6887, label %6888, label %6891

6888:                                             ; preds = %6883
  %6889 = shl nuw nsw i64 %6884, 4
  %6890 = getelementptr inbounds i8, i8* %0, i64 %6889
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6890, i8 0, i64 16, i1 false)
  br label %6891

6891:                                             ; preds = %6888, %6883
  %6892 = add nuw nsw i64 %.01, 861
  %6893 = call zeroext i8 @randombit()
  %6894 = getelementptr inbounds i8, i8* %1, i64 %6892
  store i8 %6893, i8* %6894, align 1
  %6895 = icmp eq i8 %6893, 0
  br i1 %6895, label %6896, label %6899

6896:                                             ; preds = %6891
  %6897 = shl nuw nsw i64 %6892, 4
  %6898 = getelementptr inbounds i8, i8* %0, i64 %6897
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6898, i8 0, i64 16, i1 false)
  br label %6899

6899:                                             ; preds = %6896, %6891
  %6900 = add nuw nsw i64 %.01, 862
  %6901 = call zeroext i8 @randombit()
  %6902 = getelementptr inbounds i8, i8* %1, i64 %6900
  store i8 %6901, i8* %6902, align 1
  %6903 = icmp eq i8 %6901, 0
  br i1 %6903, label %6904, label %6907

6904:                                             ; preds = %6899
  %6905 = shl nuw nsw i64 %6900, 4
  %6906 = getelementptr inbounds i8, i8* %0, i64 %6905
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6906, i8 0, i64 16, i1 false)
  br label %6907

6907:                                             ; preds = %6904, %6899
  %6908 = add nuw nsw i64 %.01, 863
  %6909 = call zeroext i8 @randombit()
  %6910 = getelementptr inbounds i8, i8* %1, i64 %6908
  store i8 %6909, i8* %6910, align 1
  %6911 = icmp eq i8 %6909, 0
  br i1 %6911, label %6912, label %6915

6912:                                             ; preds = %6907
  %6913 = shl nuw nsw i64 %6908, 4
  %6914 = getelementptr inbounds i8, i8* %0, i64 %6913
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6914, i8 0, i64 16, i1 false)
  br label %6915

6915:                                             ; preds = %6912, %6907
  %6916 = add nuw nsw i64 %.01, 864
  %6917 = call zeroext i8 @randombit()
  %6918 = getelementptr inbounds i8, i8* %1, i64 %6916
  store i8 %6917, i8* %6918, align 1
  %6919 = icmp eq i8 %6917, 0
  br i1 %6919, label %6920, label %6923

6920:                                             ; preds = %6915
  %6921 = shl nuw nsw i64 %6916, 4
  %6922 = getelementptr inbounds i8, i8* %0, i64 %6921
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6922, i8 0, i64 16, i1 false)
  br label %6923

6923:                                             ; preds = %6920, %6915
  %6924 = add nuw nsw i64 %.01, 865
  %6925 = call zeroext i8 @randombit()
  %6926 = getelementptr inbounds i8, i8* %1, i64 %6924
  store i8 %6925, i8* %6926, align 1
  %6927 = icmp eq i8 %6925, 0
  br i1 %6927, label %6928, label %6931

6928:                                             ; preds = %6923
  %6929 = shl nuw nsw i64 %6924, 4
  %6930 = getelementptr inbounds i8, i8* %0, i64 %6929
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6930, i8 0, i64 16, i1 false)
  br label %6931

6931:                                             ; preds = %6928, %6923
  %6932 = add nuw nsw i64 %.01, 866
  %6933 = call zeroext i8 @randombit()
  %6934 = getelementptr inbounds i8, i8* %1, i64 %6932
  store i8 %6933, i8* %6934, align 1
  %6935 = icmp eq i8 %6933, 0
  br i1 %6935, label %6936, label %6939

6936:                                             ; preds = %6931
  %6937 = shl nuw nsw i64 %6932, 4
  %6938 = getelementptr inbounds i8, i8* %0, i64 %6937
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6938, i8 0, i64 16, i1 false)
  br label %6939

6939:                                             ; preds = %6936, %6931
  %6940 = add nuw nsw i64 %.01, 867
  %6941 = call zeroext i8 @randombit()
  %6942 = getelementptr inbounds i8, i8* %1, i64 %6940
  store i8 %6941, i8* %6942, align 1
  %6943 = icmp eq i8 %6941, 0
  br i1 %6943, label %6944, label %6947

6944:                                             ; preds = %6939
  %6945 = shl nuw nsw i64 %6940, 4
  %6946 = getelementptr inbounds i8, i8* %0, i64 %6945
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6946, i8 0, i64 16, i1 false)
  br label %6947

6947:                                             ; preds = %6944, %6939
  %6948 = add nuw nsw i64 %.01, 868
  %6949 = call zeroext i8 @randombit()
  %6950 = getelementptr inbounds i8, i8* %1, i64 %6948
  store i8 %6949, i8* %6950, align 1
  %6951 = icmp eq i8 %6949, 0
  br i1 %6951, label %6952, label %6955

6952:                                             ; preds = %6947
  %6953 = shl nuw nsw i64 %6948, 4
  %6954 = getelementptr inbounds i8, i8* %0, i64 %6953
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6954, i8 0, i64 16, i1 false)
  br label %6955

6955:                                             ; preds = %6952, %6947
  %6956 = add nuw nsw i64 %.01, 869
  %6957 = call zeroext i8 @randombit()
  %6958 = getelementptr inbounds i8, i8* %1, i64 %6956
  store i8 %6957, i8* %6958, align 1
  %6959 = icmp eq i8 %6957, 0
  br i1 %6959, label %6960, label %6963

6960:                                             ; preds = %6955
  %6961 = shl nuw nsw i64 %6956, 4
  %6962 = getelementptr inbounds i8, i8* %0, i64 %6961
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6962, i8 0, i64 16, i1 false)
  br label %6963

6963:                                             ; preds = %6960, %6955
  %6964 = add nuw nsw i64 %.01, 870
  %6965 = call zeroext i8 @randombit()
  %6966 = getelementptr inbounds i8, i8* %1, i64 %6964
  store i8 %6965, i8* %6966, align 1
  %6967 = icmp eq i8 %6965, 0
  br i1 %6967, label %6968, label %6971

6968:                                             ; preds = %6963
  %6969 = shl nuw nsw i64 %6964, 4
  %6970 = getelementptr inbounds i8, i8* %0, i64 %6969
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6970, i8 0, i64 16, i1 false)
  br label %6971

6971:                                             ; preds = %6968, %6963
  %6972 = add nuw nsw i64 %.01, 871
  %6973 = call zeroext i8 @randombit()
  %6974 = getelementptr inbounds i8, i8* %1, i64 %6972
  store i8 %6973, i8* %6974, align 1
  %6975 = icmp eq i8 %6973, 0
  br i1 %6975, label %6976, label %6979

6976:                                             ; preds = %6971
  %6977 = shl nuw nsw i64 %6972, 4
  %6978 = getelementptr inbounds i8, i8* %0, i64 %6977
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6978, i8 0, i64 16, i1 false)
  br label %6979

6979:                                             ; preds = %6976, %6971
  %6980 = add nuw nsw i64 %.01, 872
  %6981 = call zeroext i8 @randombit()
  %6982 = getelementptr inbounds i8, i8* %1, i64 %6980
  store i8 %6981, i8* %6982, align 1
  %6983 = icmp eq i8 %6981, 0
  br i1 %6983, label %6984, label %6987

6984:                                             ; preds = %6979
  %6985 = shl nuw nsw i64 %6980, 4
  %6986 = getelementptr inbounds i8, i8* %0, i64 %6985
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6986, i8 0, i64 16, i1 false)
  br label %6987

6987:                                             ; preds = %6984, %6979
  %6988 = add nuw nsw i64 %.01, 873
  %6989 = call zeroext i8 @randombit()
  %6990 = getelementptr inbounds i8, i8* %1, i64 %6988
  store i8 %6989, i8* %6990, align 1
  %6991 = icmp eq i8 %6989, 0
  br i1 %6991, label %6992, label %6995

6992:                                             ; preds = %6987
  %6993 = shl nuw nsw i64 %6988, 4
  %6994 = getelementptr inbounds i8, i8* %0, i64 %6993
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %6994, i8 0, i64 16, i1 false)
  br label %6995

6995:                                             ; preds = %6992, %6987
  %6996 = add nuw nsw i64 %.01, 874
  %6997 = call zeroext i8 @randombit()
  %6998 = getelementptr inbounds i8, i8* %1, i64 %6996
  store i8 %6997, i8* %6998, align 1
  %6999 = icmp eq i8 %6997, 0
  br i1 %6999, label %7000, label %7003

7000:                                             ; preds = %6995
  %7001 = shl nuw nsw i64 %6996, 4
  %7002 = getelementptr inbounds i8, i8* %0, i64 %7001
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7002, i8 0, i64 16, i1 false)
  br label %7003

7003:                                             ; preds = %7000, %6995
  %7004 = add nuw nsw i64 %.01, 875
  %7005 = call zeroext i8 @randombit()
  %7006 = getelementptr inbounds i8, i8* %1, i64 %7004
  store i8 %7005, i8* %7006, align 1
  %7007 = icmp eq i8 %7005, 0
  br i1 %7007, label %7008, label %7011

7008:                                             ; preds = %7003
  %7009 = shl nuw nsw i64 %7004, 4
  %7010 = getelementptr inbounds i8, i8* %0, i64 %7009
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7010, i8 0, i64 16, i1 false)
  br label %7011

7011:                                             ; preds = %7008, %7003
  %7012 = add nuw nsw i64 %.01, 876
  %7013 = call zeroext i8 @randombit()
  %7014 = getelementptr inbounds i8, i8* %1, i64 %7012
  store i8 %7013, i8* %7014, align 1
  %7015 = icmp eq i8 %7013, 0
  br i1 %7015, label %7016, label %7019

7016:                                             ; preds = %7011
  %7017 = shl nuw nsw i64 %7012, 4
  %7018 = getelementptr inbounds i8, i8* %0, i64 %7017
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7018, i8 0, i64 16, i1 false)
  br label %7019

7019:                                             ; preds = %7016, %7011
  %7020 = add nuw nsw i64 %.01, 877
  %7021 = call zeroext i8 @randombit()
  %7022 = getelementptr inbounds i8, i8* %1, i64 %7020
  store i8 %7021, i8* %7022, align 1
  %7023 = icmp eq i8 %7021, 0
  br i1 %7023, label %7024, label %7027

7024:                                             ; preds = %7019
  %7025 = shl nuw nsw i64 %7020, 4
  %7026 = getelementptr inbounds i8, i8* %0, i64 %7025
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7026, i8 0, i64 16, i1 false)
  br label %7027

7027:                                             ; preds = %7024, %7019
  %7028 = add nuw nsw i64 %.01, 878
  %7029 = call zeroext i8 @randombit()
  %7030 = getelementptr inbounds i8, i8* %1, i64 %7028
  store i8 %7029, i8* %7030, align 1
  %7031 = icmp eq i8 %7029, 0
  br i1 %7031, label %7032, label %7035

7032:                                             ; preds = %7027
  %7033 = shl nuw nsw i64 %7028, 4
  %7034 = getelementptr inbounds i8, i8* %0, i64 %7033
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7034, i8 0, i64 16, i1 false)
  br label %7035

7035:                                             ; preds = %7032, %7027
  %7036 = add nuw nsw i64 %.01, 879
  %7037 = call zeroext i8 @randombit()
  %7038 = getelementptr inbounds i8, i8* %1, i64 %7036
  store i8 %7037, i8* %7038, align 1
  %7039 = icmp eq i8 %7037, 0
  br i1 %7039, label %7040, label %7043

7040:                                             ; preds = %7035
  %7041 = shl nuw nsw i64 %7036, 4
  %7042 = getelementptr inbounds i8, i8* %0, i64 %7041
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7042, i8 0, i64 16, i1 false)
  br label %7043

7043:                                             ; preds = %7040, %7035
  %7044 = add nuw nsw i64 %.01, 880
  %7045 = call zeroext i8 @randombit()
  %7046 = getelementptr inbounds i8, i8* %1, i64 %7044
  store i8 %7045, i8* %7046, align 1
  %7047 = icmp eq i8 %7045, 0
  br i1 %7047, label %7048, label %7051

7048:                                             ; preds = %7043
  %7049 = shl nuw nsw i64 %7044, 4
  %7050 = getelementptr inbounds i8, i8* %0, i64 %7049
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7050, i8 0, i64 16, i1 false)
  br label %7051

7051:                                             ; preds = %7048, %7043
  %7052 = add nuw nsw i64 %.01, 881
  %7053 = call zeroext i8 @randombit()
  %7054 = getelementptr inbounds i8, i8* %1, i64 %7052
  store i8 %7053, i8* %7054, align 1
  %7055 = icmp eq i8 %7053, 0
  br i1 %7055, label %7056, label %7059

7056:                                             ; preds = %7051
  %7057 = shl nuw nsw i64 %7052, 4
  %7058 = getelementptr inbounds i8, i8* %0, i64 %7057
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7058, i8 0, i64 16, i1 false)
  br label %7059

7059:                                             ; preds = %7056, %7051
  %7060 = add nuw nsw i64 %.01, 882
  %7061 = call zeroext i8 @randombit()
  %7062 = getelementptr inbounds i8, i8* %1, i64 %7060
  store i8 %7061, i8* %7062, align 1
  %7063 = icmp eq i8 %7061, 0
  br i1 %7063, label %7064, label %7067

7064:                                             ; preds = %7059
  %7065 = shl nuw nsw i64 %7060, 4
  %7066 = getelementptr inbounds i8, i8* %0, i64 %7065
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7066, i8 0, i64 16, i1 false)
  br label %7067

7067:                                             ; preds = %7064, %7059
  %7068 = add nuw nsw i64 %.01, 883
  %7069 = call zeroext i8 @randombit()
  %7070 = getelementptr inbounds i8, i8* %1, i64 %7068
  store i8 %7069, i8* %7070, align 1
  %7071 = icmp eq i8 %7069, 0
  br i1 %7071, label %7072, label %7075

7072:                                             ; preds = %7067
  %7073 = shl nuw nsw i64 %7068, 4
  %7074 = getelementptr inbounds i8, i8* %0, i64 %7073
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7074, i8 0, i64 16, i1 false)
  br label %7075

7075:                                             ; preds = %7072, %7067
  %7076 = add nuw nsw i64 %.01, 884
  %7077 = call zeroext i8 @randombit()
  %7078 = getelementptr inbounds i8, i8* %1, i64 %7076
  store i8 %7077, i8* %7078, align 1
  %7079 = icmp eq i8 %7077, 0
  br i1 %7079, label %7080, label %7083

7080:                                             ; preds = %7075
  %7081 = shl nuw nsw i64 %7076, 4
  %7082 = getelementptr inbounds i8, i8* %0, i64 %7081
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7082, i8 0, i64 16, i1 false)
  br label %7083

7083:                                             ; preds = %7080, %7075
  %7084 = add nuw nsw i64 %.01, 885
  %7085 = call zeroext i8 @randombit()
  %7086 = getelementptr inbounds i8, i8* %1, i64 %7084
  store i8 %7085, i8* %7086, align 1
  %7087 = icmp eq i8 %7085, 0
  br i1 %7087, label %7088, label %7091

7088:                                             ; preds = %7083
  %7089 = shl nuw nsw i64 %7084, 4
  %7090 = getelementptr inbounds i8, i8* %0, i64 %7089
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7090, i8 0, i64 16, i1 false)
  br label %7091

7091:                                             ; preds = %7088, %7083
  %7092 = add nuw nsw i64 %.01, 886
  %7093 = call zeroext i8 @randombit()
  %7094 = getelementptr inbounds i8, i8* %1, i64 %7092
  store i8 %7093, i8* %7094, align 1
  %7095 = icmp eq i8 %7093, 0
  br i1 %7095, label %7096, label %7099

7096:                                             ; preds = %7091
  %7097 = shl nuw nsw i64 %7092, 4
  %7098 = getelementptr inbounds i8, i8* %0, i64 %7097
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7098, i8 0, i64 16, i1 false)
  br label %7099

7099:                                             ; preds = %7096, %7091
  %7100 = add nuw nsw i64 %.01, 887
  %7101 = call zeroext i8 @randombit()
  %7102 = getelementptr inbounds i8, i8* %1, i64 %7100
  store i8 %7101, i8* %7102, align 1
  %7103 = icmp eq i8 %7101, 0
  br i1 %7103, label %7104, label %7107

7104:                                             ; preds = %7099
  %7105 = shl nuw nsw i64 %7100, 4
  %7106 = getelementptr inbounds i8, i8* %0, i64 %7105
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7106, i8 0, i64 16, i1 false)
  br label %7107

7107:                                             ; preds = %7104, %7099
  %7108 = add nuw nsw i64 %.01, 888
  %7109 = call zeroext i8 @randombit()
  %7110 = getelementptr inbounds i8, i8* %1, i64 %7108
  store i8 %7109, i8* %7110, align 1
  %7111 = icmp eq i8 %7109, 0
  br i1 %7111, label %7112, label %7115

7112:                                             ; preds = %7107
  %7113 = shl nuw nsw i64 %7108, 4
  %7114 = getelementptr inbounds i8, i8* %0, i64 %7113
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7114, i8 0, i64 16, i1 false)
  br label %7115

7115:                                             ; preds = %7112, %7107
  %7116 = add nuw nsw i64 %.01, 889
  %7117 = call zeroext i8 @randombit()
  %7118 = getelementptr inbounds i8, i8* %1, i64 %7116
  store i8 %7117, i8* %7118, align 1
  %7119 = icmp eq i8 %7117, 0
  br i1 %7119, label %7120, label %7123

7120:                                             ; preds = %7115
  %7121 = shl nuw nsw i64 %7116, 4
  %7122 = getelementptr inbounds i8, i8* %0, i64 %7121
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7122, i8 0, i64 16, i1 false)
  br label %7123

7123:                                             ; preds = %7120, %7115
  %7124 = add nuw nsw i64 %.01, 890
  %7125 = call zeroext i8 @randombit()
  %7126 = getelementptr inbounds i8, i8* %1, i64 %7124
  store i8 %7125, i8* %7126, align 1
  %7127 = icmp eq i8 %7125, 0
  br i1 %7127, label %7128, label %7131

7128:                                             ; preds = %7123
  %7129 = shl nuw nsw i64 %7124, 4
  %7130 = getelementptr inbounds i8, i8* %0, i64 %7129
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7130, i8 0, i64 16, i1 false)
  br label %7131

7131:                                             ; preds = %7128, %7123
  %7132 = add nuw nsw i64 %.01, 891
  %7133 = call zeroext i8 @randombit()
  %7134 = getelementptr inbounds i8, i8* %1, i64 %7132
  store i8 %7133, i8* %7134, align 1
  %7135 = icmp eq i8 %7133, 0
  br i1 %7135, label %7136, label %7139

7136:                                             ; preds = %7131
  %7137 = shl nuw nsw i64 %7132, 4
  %7138 = getelementptr inbounds i8, i8* %0, i64 %7137
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7138, i8 0, i64 16, i1 false)
  br label %7139

7139:                                             ; preds = %7136, %7131
  %7140 = add nuw nsw i64 %.01, 892
  %7141 = call zeroext i8 @randombit()
  %7142 = getelementptr inbounds i8, i8* %1, i64 %7140
  store i8 %7141, i8* %7142, align 1
  %7143 = icmp eq i8 %7141, 0
  br i1 %7143, label %7144, label %7147

7144:                                             ; preds = %7139
  %7145 = shl nuw nsw i64 %7140, 4
  %7146 = getelementptr inbounds i8, i8* %0, i64 %7145
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7146, i8 0, i64 16, i1 false)
  br label %7147

7147:                                             ; preds = %7144, %7139
  %7148 = add nuw nsw i64 %.01, 893
  %7149 = call zeroext i8 @randombit()
  %7150 = getelementptr inbounds i8, i8* %1, i64 %7148
  store i8 %7149, i8* %7150, align 1
  %7151 = icmp eq i8 %7149, 0
  br i1 %7151, label %7152, label %7155

7152:                                             ; preds = %7147
  %7153 = shl nuw nsw i64 %7148, 4
  %7154 = getelementptr inbounds i8, i8* %0, i64 %7153
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7154, i8 0, i64 16, i1 false)
  br label %7155

7155:                                             ; preds = %7152, %7147
  %7156 = add nuw nsw i64 %.01, 894
  %7157 = call zeroext i8 @randombit()
  %7158 = getelementptr inbounds i8, i8* %1, i64 %7156
  store i8 %7157, i8* %7158, align 1
  %7159 = icmp eq i8 %7157, 0
  br i1 %7159, label %7160, label %7163

7160:                                             ; preds = %7155
  %7161 = shl nuw nsw i64 %7156, 4
  %7162 = getelementptr inbounds i8, i8* %0, i64 %7161
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7162, i8 0, i64 16, i1 false)
  br label %7163

7163:                                             ; preds = %7160, %7155
  %7164 = add nuw nsw i64 %.01, 895
  %7165 = call zeroext i8 @randombit()
  %7166 = getelementptr inbounds i8, i8* %1, i64 %7164
  store i8 %7165, i8* %7166, align 1
  %7167 = icmp eq i8 %7165, 0
  br i1 %7167, label %7168, label %7171

7168:                                             ; preds = %7163
  %7169 = shl nuw nsw i64 %7164, 4
  %7170 = getelementptr inbounds i8, i8* %0, i64 %7169
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7170, i8 0, i64 16, i1 false)
  br label %7171

7171:                                             ; preds = %7168, %7163
  %7172 = add nuw nsw i64 %.01, 896
  %7173 = call zeroext i8 @randombit()
  %7174 = getelementptr inbounds i8, i8* %1, i64 %7172
  store i8 %7173, i8* %7174, align 1
  %7175 = icmp eq i8 %7173, 0
  br i1 %7175, label %7176, label %7179

7176:                                             ; preds = %7171
  %7177 = shl nuw nsw i64 %7172, 4
  %7178 = getelementptr inbounds i8, i8* %0, i64 %7177
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7178, i8 0, i64 16, i1 false)
  br label %7179

7179:                                             ; preds = %7176, %7171
  %7180 = add nuw nsw i64 %.01, 897
  %7181 = call zeroext i8 @randombit()
  %7182 = getelementptr inbounds i8, i8* %1, i64 %7180
  store i8 %7181, i8* %7182, align 1
  %7183 = icmp eq i8 %7181, 0
  br i1 %7183, label %7184, label %7187

7184:                                             ; preds = %7179
  %7185 = shl nuw nsw i64 %7180, 4
  %7186 = getelementptr inbounds i8, i8* %0, i64 %7185
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7186, i8 0, i64 16, i1 false)
  br label %7187

7187:                                             ; preds = %7184, %7179
  %7188 = add nuw nsw i64 %.01, 898
  %7189 = call zeroext i8 @randombit()
  %7190 = getelementptr inbounds i8, i8* %1, i64 %7188
  store i8 %7189, i8* %7190, align 1
  %7191 = icmp eq i8 %7189, 0
  br i1 %7191, label %7192, label %7195

7192:                                             ; preds = %7187
  %7193 = shl nuw nsw i64 %7188, 4
  %7194 = getelementptr inbounds i8, i8* %0, i64 %7193
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7194, i8 0, i64 16, i1 false)
  br label %7195

7195:                                             ; preds = %7192, %7187
  %7196 = add nuw nsw i64 %.01, 899
  %7197 = call zeroext i8 @randombit()
  %7198 = getelementptr inbounds i8, i8* %1, i64 %7196
  store i8 %7197, i8* %7198, align 1
  %7199 = icmp eq i8 %7197, 0
  br i1 %7199, label %7200, label %7203

7200:                                             ; preds = %7195
  %7201 = shl nuw nsw i64 %7196, 4
  %7202 = getelementptr inbounds i8, i8* %0, i64 %7201
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7202, i8 0, i64 16, i1 false)
  br label %7203

7203:                                             ; preds = %7200, %7195
  %7204 = add nuw nsw i64 %.01, 900
  %7205 = call zeroext i8 @randombit()
  %7206 = getelementptr inbounds i8, i8* %1, i64 %7204
  store i8 %7205, i8* %7206, align 1
  %7207 = icmp eq i8 %7205, 0
  br i1 %7207, label %7208, label %7211

7208:                                             ; preds = %7203
  %7209 = shl nuw nsw i64 %7204, 4
  %7210 = getelementptr inbounds i8, i8* %0, i64 %7209
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7210, i8 0, i64 16, i1 false)
  br label %7211

7211:                                             ; preds = %7208, %7203
  %7212 = add nuw nsw i64 %.01, 901
  %7213 = call zeroext i8 @randombit()
  %7214 = getelementptr inbounds i8, i8* %1, i64 %7212
  store i8 %7213, i8* %7214, align 1
  %7215 = icmp eq i8 %7213, 0
  br i1 %7215, label %7216, label %7219

7216:                                             ; preds = %7211
  %7217 = shl nuw nsw i64 %7212, 4
  %7218 = getelementptr inbounds i8, i8* %0, i64 %7217
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7218, i8 0, i64 16, i1 false)
  br label %7219

7219:                                             ; preds = %7216, %7211
  %7220 = add nuw nsw i64 %.01, 902
  %7221 = call zeroext i8 @randombit()
  %7222 = getelementptr inbounds i8, i8* %1, i64 %7220
  store i8 %7221, i8* %7222, align 1
  %7223 = icmp eq i8 %7221, 0
  br i1 %7223, label %7224, label %7227

7224:                                             ; preds = %7219
  %7225 = shl nuw nsw i64 %7220, 4
  %7226 = getelementptr inbounds i8, i8* %0, i64 %7225
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7226, i8 0, i64 16, i1 false)
  br label %7227

7227:                                             ; preds = %7224, %7219
  %7228 = add nuw nsw i64 %.01, 903
  %7229 = call zeroext i8 @randombit()
  %7230 = getelementptr inbounds i8, i8* %1, i64 %7228
  store i8 %7229, i8* %7230, align 1
  %7231 = icmp eq i8 %7229, 0
  br i1 %7231, label %7232, label %7235

7232:                                             ; preds = %7227
  %7233 = shl nuw nsw i64 %7228, 4
  %7234 = getelementptr inbounds i8, i8* %0, i64 %7233
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7234, i8 0, i64 16, i1 false)
  br label %7235

7235:                                             ; preds = %7232, %7227
  %7236 = add nuw nsw i64 %.01, 904
  %7237 = call zeroext i8 @randombit()
  %7238 = getelementptr inbounds i8, i8* %1, i64 %7236
  store i8 %7237, i8* %7238, align 1
  %7239 = icmp eq i8 %7237, 0
  br i1 %7239, label %7240, label %7243

7240:                                             ; preds = %7235
  %7241 = shl nuw nsw i64 %7236, 4
  %7242 = getelementptr inbounds i8, i8* %0, i64 %7241
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7242, i8 0, i64 16, i1 false)
  br label %7243

7243:                                             ; preds = %7240, %7235
  %7244 = add nuw nsw i64 %.01, 905
  %7245 = call zeroext i8 @randombit()
  %7246 = getelementptr inbounds i8, i8* %1, i64 %7244
  store i8 %7245, i8* %7246, align 1
  %7247 = icmp eq i8 %7245, 0
  br i1 %7247, label %7248, label %7251

7248:                                             ; preds = %7243
  %7249 = shl nuw nsw i64 %7244, 4
  %7250 = getelementptr inbounds i8, i8* %0, i64 %7249
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7250, i8 0, i64 16, i1 false)
  br label %7251

7251:                                             ; preds = %7248, %7243
  %7252 = add nuw nsw i64 %.01, 906
  %7253 = call zeroext i8 @randombit()
  %7254 = getelementptr inbounds i8, i8* %1, i64 %7252
  store i8 %7253, i8* %7254, align 1
  %7255 = icmp eq i8 %7253, 0
  br i1 %7255, label %7256, label %7259

7256:                                             ; preds = %7251
  %7257 = shl nuw nsw i64 %7252, 4
  %7258 = getelementptr inbounds i8, i8* %0, i64 %7257
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7258, i8 0, i64 16, i1 false)
  br label %7259

7259:                                             ; preds = %7256, %7251
  %7260 = add nuw nsw i64 %.01, 907
  %7261 = call zeroext i8 @randombit()
  %7262 = getelementptr inbounds i8, i8* %1, i64 %7260
  store i8 %7261, i8* %7262, align 1
  %7263 = icmp eq i8 %7261, 0
  br i1 %7263, label %7264, label %7267

7264:                                             ; preds = %7259
  %7265 = shl nuw nsw i64 %7260, 4
  %7266 = getelementptr inbounds i8, i8* %0, i64 %7265
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7266, i8 0, i64 16, i1 false)
  br label %7267

7267:                                             ; preds = %7264, %7259
  %7268 = add nuw nsw i64 %.01, 908
  %7269 = call zeroext i8 @randombit()
  %7270 = getelementptr inbounds i8, i8* %1, i64 %7268
  store i8 %7269, i8* %7270, align 1
  %7271 = icmp eq i8 %7269, 0
  br i1 %7271, label %7272, label %7275

7272:                                             ; preds = %7267
  %7273 = shl nuw nsw i64 %7268, 4
  %7274 = getelementptr inbounds i8, i8* %0, i64 %7273
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7274, i8 0, i64 16, i1 false)
  br label %7275

7275:                                             ; preds = %7272, %7267
  %7276 = add nuw nsw i64 %.01, 909
  %7277 = call zeroext i8 @randombit()
  %7278 = getelementptr inbounds i8, i8* %1, i64 %7276
  store i8 %7277, i8* %7278, align 1
  %7279 = icmp eq i8 %7277, 0
  br i1 %7279, label %7280, label %7283

7280:                                             ; preds = %7275
  %7281 = shl nuw nsw i64 %7276, 4
  %7282 = getelementptr inbounds i8, i8* %0, i64 %7281
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7282, i8 0, i64 16, i1 false)
  br label %7283

7283:                                             ; preds = %7280, %7275
  %7284 = add nuw nsw i64 %.01, 910
  %7285 = call zeroext i8 @randombit()
  %7286 = getelementptr inbounds i8, i8* %1, i64 %7284
  store i8 %7285, i8* %7286, align 1
  %7287 = icmp eq i8 %7285, 0
  br i1 %7287, label %7288, label %7291

7288:                                             ; preds = %7283
  %7289 = shl nuw nsw i64 %7284, 4
  %7290 = getelementptr inbounds i8, i8* %0, i64 %7289
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7290, i8 0, i64 16, i1 false)
  br label %7291

7291:                                             ; preds = %7288, %7283
  %7292 = add nuw nsw i64 %.01, 911
  %7293 = call zeroext i8 @randombit()
  %7294 = getelementptr inbounds i8, i8* %1, i64 %7292
  store i8 %7293, i8* %7294, align 1
  %7295 = icmp eq i8 %7293, 0
  br i1 %7295, label %7296, label %7299

7296:                                             ; preds = %7291
  %7297 = shl nuw nsw i64 %7292, 4
  %7298 = getelementptr inbounds i8, i8* %0, i64 %7297
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7298, i8 0, i64 16, i1 false)
  br label %7299

7299:                                             ; preds = %7296, %7291
  %7300 = add nuw nsw i64 %.01, 912
  %7301 = call zeroext i8 @randombit()
  %7302 = getelementptr inbounds i8, i8* %1, i64 %7300
  store i8 %7301, i8* %7302, align 1
  %7303 = icmp eq i8 %7301, 0
  br i1 %7303, label %7304, label %7307

7304:                                             ; preds = %7299
  %7305 = shl nuw nsw i64 %7300, 4
  %7306 = getelementptr inbounds i8, i8* %0, i64 %7305
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7306, i8 0, i64 16, i1 false)
  br label %7307

7307:                                             ; preds = %7304, %7299
  %7308 = add nuw nsw i64 %.01, 913
  %7309 = call zeroext i8 @randombit()
  %7310 = getelementptr inbounds i8, i8* %1, i64 %7308
  store i8 %7309, i8* %7310, align 1
  %7311 = icmp eq i8 %7309, 0
  br i1 %7311, label %7312, label %7315

7312:                                             ; preds = %7307
  %7313 = shl nuw nsw i64 %7308, 4
  %7314 = getelementptr inbounds i8, i8* %0, i64 %7313
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7314, i8 0, i64 16, i1 false)
  br label %7315

7315:                                             ; preds = %7312, %7307
  %7316 = add nuw nsw i64 %.01, 914
  %7317 = call zeroext i8 @randombit()
  %7318 = getelementptr inbounds i8, i8* %1, i64 %7316
  store i8 %7317, i8* %7318, align 1
  %7319 = icmp eq i8 %7317, 0
  br i1 %7319, label %7320, label %7323

7320:                                             ; preds = %7315
  %7321 = shl nuw nsw i64 %7316, 4
  %7322 = getelementptr inbounds i8, i8* %0, i64 %7321
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7322, i8 0, i64 16, i1 false)
  br label %7323

7323:                                             ; preds = %7320, %7315
  %7324 = add nuw nsw i64 %.01, 915
  %7325 = call zeroext i8 @randombit()
  %7326 = getelementptr inbounds i8, i8* %1, i64 %7324
  store i8 %7325, i8* %7326, align 1
  %7327 = icmp eq i8 %7325, 0
  br i1 %7327, label %7328, label %7331

7328:                                             ; preds = %7323
  %7329 = shl nuw nsw i64 %7324, 4
  %7330 = getelementptr inbounds i8, i8* %0, i64 %7329
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7330, i8 0, i64 16, i1 false)
  br label %7331

7331:                                             ; preds = %7328, %7323
  %7332 = add nuw nsw i64 %.01, 916
  %7333 = call zeroext i8 @randombit()
  %7334 = getelementptr inbounds i8, i8* %1, i64 %7332
  store i8 %7333, i8* %7334, align 1
  %7335 = icmp eq i8 %7333, 0
  br i1 %7335, label %7336, label %7339

7336:                                             ; preds = %7331
  %7337 = shl nuw nsw i64 %7332, 4
  %7338 = getelementptr inbounds i8, i8* %0, i64 %7337
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7338, i8 0, i64 16, i1 false)
  br label %7339

7339:                                             ; preds = %7336, %7331
  %7340 = add nuw nsw i64 %.01, 917
  %7341 = call zeroext i8 @randombit()
  %7342 = getelementptr inbounds i8, i8* %1, i64 %7340
  store i8 %7341, i8* %7342, align 1
  %7343 = icmp eq i8 %7341, 0
  br i1 %7343, label %7344, label %7347

7344:                                             ; preds = %7339
  %7345 = shl nuw nsw i64 %7340, 4
  %7346 = getelementptr inbounds i8, i8* %0, i64 %7345
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7346, i8 0, i64 16, i1 false)
  br label %7347

7347:                                             ; preds = %7344, %7339
  %7348 = add nuw nsw i64 %.01, 918
  %7349 = call zeroext i8 @randombit()
  %7350 = getelementptr inbounds i8, i8* %1, i64 %7348
  store i8 %7349, i8* %7350, align 1
  %7351 = icmp eq i8 %7349, 0
  br i1 %7351, label %7352, label %7355

7352:                                             ; preds = %7347
  %7353 = shl nuw nsw i64 %7348, 4
  %7354 = getelementptr inbounds i8, i8* %0, i64 %7353
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7354, i8 0, i64 16, i1 false)
  br label %7355

7355:                                             ; preds = %7352, %7347
  %7356 = add nuw nsw i64 %.01, 919
  %7357 = call zeroext i8 @randombit()
  %7358 = getelementptr inbounds i8, i8* %1, i64 %7356
  store i8 %7357, i8* %7358, align 1
  %7359 = icmp eq i8 %7357, 0
  br i1 %7359, label %7360, label %7363

7360:                                             ; preds = %7355
  %7361 = shl nuw nsw i64 %7356, 4
  %7362 = getelementptr inbounds i8, i8* %0, i64 %7361
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7362, i8 0, i64 16, i1 false)
  br label %7363

7363:                                             ; preds = %7360, %7355
  %7364 = add nuw nsw i64 %.01, 920
  %7365 = call zeroext i8 @randombit()
  %7366 = getelementptr inbounds i8, i8* %1, i64 %7364
  store i8 %7365, i8* %7366, align 1
  %7367 = icmp eq i8 %7365, 0
  br i1 %7367, label %7368, label %7371

7368:                                             ; preds = %7363
  %7369 = shl nuw nsw i64 %7364, 4
  %7370 = getelementptr inbounds i8, i8* %0, i64 %7369
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7370, i8 0, i64 16, i1 false)
  br label %7371

7371:                                             ; preds = %7368, %7363
  %7372 = add nuw nsw i64 %.01, 921
  %7373 = call zeroext i8 @randombit()
  %7374 = getelementptr inbounds i8, i8* %1, i64 %7372
  store i8 %7373, i8* %7374, align 1
  %7375 = icmp eq i8 %7373, 0
  br i1 %7375, label %7376, label %7379

7376:                                             ; preds = %7371
  %7377 = shl nuw nsw i64 %7372, 4
  %7378 = getelementptr inbounds i8, i8* %0, i64 %7377
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7378, i8 0, i64 16, i1 false)
  br label %7379

7379:                                             ; preds = %7376, %7371
  %7380 = add nuw nsw i64 %.01, 922
  %7381 = call zeroext i8 @randombit()
  %7382 = getelementptr inbounds i8, i8* %1, i64 %7380
  store i8 %7381, i8* %7382, align 1
  %7383 = icmp eq i8 %7381, 0
  br i1 %7383, label %7384, label %7387

7384:                                             ; preds = %7379
  %7385 = shl nuw nsw i64 %7380, 4
  %7386 = getelementptr inbounds i8, i8* %0, i64 %7385
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7386, i8 0, i64 16, i1 false)
  br label %7387

7387:                                             ; preds = %7384, %7379
  %7388 = add nuw nsw i64 %.01, 923
  %7389 = call zeroext i8 @randombit()
  %7390 = getelementptr inbounds i8, i8* %1, i64 %7388
  store i8 %7389, i8* %7390, align 1
  %7391 = icmp eq i8 %7389, 0
  br i1 %7391, label %7392, label %7395

7392:                                             ; preds = %7387
  %7393 = shl nuw nsw i64 %7388, 4
  %7394 = getelementptr inbounds i8, i8* %0, i64 %7393
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7394, i8 0, i64 16, i1 false)
  br label %7395

7395:                                             ; preds = %7392, %7387
  %7396 = add nuw nsw i64 %.01, 924
  %7397 = call zeroext i8 @randombit()
  %7398 = getelementptr inbounds i8, i8* %1, i64 %7396
  store i8 %7397, i8* %7398, align 1
  %7399 = icmp eq i8 %7397, 0
  br i1 %7399, label %7400, label %7403

7400:                                             ; preds = %7395
  %7401 = shl nuw nsw i64 %7396, 4
  %7402 = getelementptr inbounds i8, i8* %0, i64 %7401
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7402, i8 0, i64 16, i1 false)
  br label %7403

7403:                                             ; preds = %7400, %7395
  %7404 = add nuw nsw i64 %.01, 925
  %7405 = call zeroext i8 @randombit()
  %7406 = getelementptr inbounds i8, i8* %1, i64 %7404
  store i8 %7405, i8* %7406, align 1
  %7407 = icmp eq i8 %7405, 0
  br i1 %7407, label %7408, label %7411

7408:                                             ; preds = %7403
  %7409 = shl nuw nsw i64 %7404, 4
  %7410 = getelementptr inbounds i8, i8* %0, i64 %7409
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7410, i8 0, i64 16, i1 false)
  br label %7411

7411:                                             ; preds = %7408, %7403
  %7412 = add nuw nsw i64 %.01, 926
  %7413 = call zeroext i8 @randombit()
  %7414 = getelementptr inbounds i8, i8* %1, i64 %7412
  store i8 %7413, i8* %7414, align 1
  %7415 = icmp eq i8 %7413, 0
  br i1 %7415, label %7416, label %7419

7416:                                             ; preds = %7411
  %7417 = shl nuw nsw i64 %7412, 4
  %7418 = getelementptr inbounds i8, i8* %0, i64 %7417
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7418, i8 0, i64 16, i1 false)
  br label %7419

7419:                                             ; preds = %7416, %7411
  %7420 = add nuw nsw i64 %.01, 927
  %7421 = call zeroext i8 @randombit()
  %7422 = getelementptr inbounds i8, i8* %1, i64 %7420
  store i8 %7421, i8* %7422, align 1
  %7423 = icmp eq i8 %7421, 0
  br i1 %7423, label %7424, label %7427

7424:                                             ; preds = %7419
  %7425 = shl nuw nsw i64 %7420, 4
  %7426 = getelementptr inbounds i8, i8* %0, i64 %7425
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7426, i8 0, i64 16, i1 false)
  br label %7427

7427:                                             ; preds = %7424, %7419
  %7428 = add nuw nsw i64 %.01, 928
  %7429 = call zeroext i8 @randombit()
  %7430 = getelementptr inbounds i8, i8* %1, i64 %7428
  store i8 %7429, i8* %7430, align 1
  %7431 = icmp eq i8 %7429, 0
  br i1 %7431, label %7432, label %7435

7432:                                             ; preds = %7427
  %7433 = shl nuw nsw i64 %7428, 4
  %7434 = getelementptr inbounds i8, i8* %0, i64 %7433
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7434, i8 0, i64 16, i1 false)
  br label %7435

7435:                                             ; preds = %7432, %7427
  %7436 = add nuw nsw i64 %.01, 929
  %7437 = call zeroext i8 @randombit()
  %7438 = getelementptr inbounds i8, i8* %1, i64 %7436
  store i8 %7437, i8* %7438, align 1
  %7439 = icmp eq i8 %7437, 0
  br i1 %7439, label %7440, label %7443

7440:                                             ; preds = %7435
  %7441 = shl nuw nsw i64 %7436, 4
  %7442 = getelementptr inbounds i8, i8* %0, i64 %7441
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7442, i8 0, i64 16, i1 false)
  br label %7443

7443:                                             ; preds = %7440, %7435
  %7444 = add nuw nsw i64 %.01, 930
  %7445 = call zeroext i8 @randombit()
  %7446 = getelementptr inbounds i8, i8* %1, i64 %7444
  store i8 %7445, i8* %7446, align 1
  %7447 = icmp eq i8 %7445, 0
  br i1 %7447, label %7448, label %7451

7448:                                             ; preds = %7443
  %7449 = shl nuw nsw i64 %7444, 4
  %7450 = getelementptr inbounds i8, i8* %0, i64 %7449
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7450, i8 0, i64 16, i1 false)
  br label %7451

7451:                                             ; preds = %7448, %7443
  %7452 = add nuw nsw i64 %.01, 931
  %7453 = call zeroext i8 @randombit()
  %7454 = getelementptr inbounds i8, i8* %1, i64 %7452
  store i8 %7453, i8* %7454, align 1
  %7455 = icmp eq i8 %7453, 0
  br i1 %7455, label %7456, label %7459

7456:                                             ; preds = %7451
  %7457 = shl nuw nsw i64 %7452, 4
  %7458 = getelementptr inbounds i8, i8* %0, i64 %7457
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7458, i8 0, i64 16, i1 false)
  br label %7459

7459:                                             ; preds = %7456, %7451
  %7460 = add nuw nsw i64 %.01, 932
  %7461 = call zeroext i8 @randombit()
  %7462 = getelementptr inbounds i8, i8* %1, i64 %7460
  store i8 %7461, i8* %7462, align 1
  %7463 = icmp eq i8 %7461, 0
  br i1 %7463, label %7464, label %7467

7464:                                             ; preds = %7459
  %7465 = shl nuw nsw i64 %7460, 4
  %7466 = getelementptr inbounds i8, i8* %0, i64 %7465
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7466, i8 0, i64 16, i1 false)
  br label %7467

7467:                                             ; preds = %7464, %7459
  %7468 = add nuw nsw i64 %.01, 933
  %7469 = call zeroext i8 @randombit()
  %7470 = getelementptr inbounds i8, i8* %1, i64 %7468
  store i8 %7469, i8* %7470, align 1
  %7471 = icmp eq i8 %7469, 0
  br i1 %7471, label %7472, label %7475

7472:                                             ; preds = %7467
  %7473 = shl nuw nsw i64 %7468, 4
  %7474 = getelementptr inbounds i8, i8* %0, i64 %7473
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7474, i8 0, i64 16, i1 false)
  br label %7475

7475:                                             ; preds = %7472, %7467
  %7476 = add nuw nsw i64 %.01, 934
  %7477 = call zeroext i8 @randombit()
  %7478 = getelementptr inbounds i8, i8* %1, i64 %7476
  store i8 %7477, i8* %7478, align 1
  %7479 = icmp eq i8 %7477, 0
  br i1 %7479, label %7480, label %7483

7480:                                             ; preds = %7475
  %7481 = shl nuw nsw i64 %7476, 4
  %7482 = getelementptr inbounds i8, i8* %0, i64 %7481
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7482, i8 0, i64 16, i1 false)
  br label %7483

7483:                                             ; preds = %7480, %7475
  %7484 = add nuw nsw i64 %.01, 935
  %7485 = call zeroext i8 @randombit()
  %7486 = getelementptr inbounds i8, i8* %1, i64 %7484
  store i8 %7485, i8* %7486, align 1
  %7487 = icmp eq i8 %7485, 0
  br i1 %7487, label %7488, label %7491

7488:                                             ; preds = %7483
  %7489 = shl nuw nsw i64 %7484, 4
  %7490 = getelementptr inbounds i8, i8* %0, i64 %7489
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7490, i8 0, i64 16, i1 false)
  br label %7491

7491:                                             ; preds = %7488, %7483
  %7492 = add nuw nsw i64 %.01, 936
  %7493 = call zeroext i8 @randombit()
  %7494 = getelementptr inbounds i8, i8* %1, i64 %7492
  store i8 %7493, i8* %7494, align 1
  %7495 = icmp eq i8 %7493, 0
  br i1 %7495, label %7496, label %7499

7496:                                             ; preds = %7491
  %7497 = shl nuw nsw i64 %7492, 4
  %7498 = getelementptr inbounds i8, i8* %0, i64 %7497
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7498, i8 0, i64 16, i1 false)
  br label %7499

7499:                                             ; preds = %7496, %7491
  %7500 = add nuw nsw i64 %.01, 937
  %7501 = call zeroext i8 @randombit()
  %7502 = getelementptr inbounds i8, i8* %1, i64 %7500
  store i8 %7501, i8* %7502, align 1
  %7503 = icmp eq i8 %7501, 0
  br i1 %7503, label %7504, label %7507

7504:                                             ; preds = %7499
  %7505 = shl nuw nsw i64 %7500, 4
  %7506 = getelementptr inbounds i8, i8* %0, i64 %7505
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7506, i8 0, i64 16, i1 false)
  br label %7507

7507:                                             ; preds = %7504, %7499
  %7508 = add nuw nsw i64 %.01, 938
  %7509 = call zeroext i8 @randombit()
  %7510 = getelementptr inbounds i8, i8* %1, i64 %7508
  store i8 %7509, i8* %7510, align 1
  %7511 = icmp eq i8 %7509, 0
  br i1 %7511, label %7512, label %7515

7512:                                             ; preds = %7507
  %7513 = shl nuw nsw i64 %7508, 4
  %7514 = getelementptr inbounds i8, i8* %0, i64 %7513
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7514, i8 0, i64 16, i1 false)
  br label %7515

7515:                                             ; preds = %7512, %7507
  %7516 = add nuw nsw i64 %.01, 939
  %7517 = call zeroext i8 @randombit()
  %7518 = getelementptr inbounds i8, i8* %1, i64 %7516
  store i8 %7517, i8* %7518, align 1
  %7519 = icmp eq i8 %7517, 0
  br i1 %7519, label %7520, label %7523

7520:                                             ; preds = %7515
  %7521 = shl nuw nsw i64 %7516, 4
  %7522 = getelementptr inbounds i8, i8* %0, i64 %7521
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7522, i8 0, i64 16, i1 false)
  br label %7523

7523:                                             ; preds = %7520, %7515
  %7524 = add nuw nsw i64 %.01, 940
  %7525 = call zeroext i8 @randombit()
  %7526 = getelementptr inbounds i8, i8* %1, i64 %7524
  store i8 %7525, i8* %7526, align 1
  %7527 = icmp eq i8 %7525, 0
  br i1 %7527, label %7528, label %7531

7528:                                             ; preds = %7523
  %7529 = shl nuw nsw i64 %7524, 4
  %7530 = getelementptr inbounds i8, i8* %0, i64 %7529
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7530, i8 0, i64 16, i1 false)
  br label %7531

7531:                                             ; preds = %7528, %7523
  %7532 = add nuw nsw i64 %.01, 941
  %7533 = call zeroext i8 @randombit()
  %7534 = getelementptr inbounds i8, i8* %1, i64 %7532
  store i8 %7533, i8* %7534, align 1
  %7535 = icmp eq i8 %7533, 0
  br i1 %7535, label %7536, label %7539

7536:                                             ; preds = %7531
  %7537 = shl nuw nsw i64 %7532, 4
  %7538 = getelementptr inbounds i8, i8* %0, i64 %7537
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7538, i8 0, i64 16, i1 false)
  br label %7539

7539:                                             ; preds = %7536, %7531
  %7540 = add nuw nsw i64 %.01, 942
  %7541 = call zeroext i8 @randombit()
  %7542 = getelementptr inbounds i8, i8* %1, i64 %7540
  store i8 %7541, i8* %7542, align 1
  %7543 = icmp eq i8 %7541, 0
  br i1 %7543, label %7544, label %7547

7544:                                             ; preds = %7539
  %7545 = shl nuw nsw i64 %7540, 4
  %7546 = getelementptr inbounds i8, i8* %0, i64 %7545
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7546, i8 0, i64 16, i1 false)
  br label %7547

7547:                                             ; preds = %7544, %7539
  %7548 = add nuw nsw i64 %.01, 943
  %7549 = call zeroext i8 @randombit()
  %7550 = getelementptr inbounds i8, i8* %1, i64 %7548
  store i8 %7549, i8* %7550, align 1
  %7551 = icmp eq i8 %7549, 0
  br i1 %7551, label %7552, label %7555

7552:                                             ; preds = %7547
  %7553 = shl nuw nsw i64 %7548, 4
  %7554 = getelementptr inbounds i8, i8* %0, i64 %7553
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7554, i8 0, i64 16, i1 false)
  br label %7555

7555:                                             ; preds = %7552, %7547
  %7556 = add nuw nsw i64 %.01, 944
  %7557 = call zeroext i8 @randombit()
  %7558 = getelementptr inbounds i8, i8* %1, i64 %7556
  store i8 %7557, i8* %7558, align 1
  %7559 = icmp eq i8 %7557, 0
  br i1 %7559, label %7560, label %7563

7560:                                             ; preds = %7555
  %7561 = shl nuw nsw i64 %7556, 4
  %7562 = getelementptr inbounds i8, i8* %0, i64 %7561
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7562, i8 0, i64 16, i1 false)
  br label %7563

7563:                                             ; preds = %7560, %7555
  %7564 = add nuw nsw i64 %.01, 945
  %7565 = call zeroext i8 @randombit()
  %7566 = getelementptr inbounds i8, i8* %1, i64 %7564
  store i8 %7565, i8* %7566, align 1
  %7567 = icmp eq i8 %7565, 0
  br i1 %7567, label %7568, label %7571

7568:                                             ; preds = %7563
  %7569 = shl nuw nsw i64 %7564, 4
  %7570 = getelementptr inbounds i8, i8* %0, i64 %7569
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7570, i8 0, i64 16, i1 false)
  br label %7571

7571:                                             ; preds = %7568, %7563
  %7572 = add nuw nsw i64 %.01, 946
  %7573 = call zeroext i8 @randombit()
  %7574 = getelementptr inbounds i8, i8* %1, i64 %7572
  store i8 %7573, i8* %7574, align 1
  %7575 = icmp eq i8 %7573, 0
  br i1 %7575, label %7576, label %7579

7576:                                             ; preds = %7571
  %7577 = shl nuw nsw i64 %7572, 4
  %7578 = getelementptr inbounds i8, i8* %0, i64 %7577
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7578, i8 0, i64 16, i1 false)
  br label %7579

7579:                                             ; preds = %7576, %7571
  %7580 = add nuw nsw i64 %.01, 947
  %7581 = call zeroext i8 @randombit()
  %7582 = getelementptr inbounds i8, i8* %1, i64 %7580
  store i8 %7581, i8* %7582, align 1
  %7583 = icmp eq i8 %7581, 0
  br i1 %7583, label %7584, label %7587

7584:                                             ; preds = %7579
  %7585 = shl nuw nsw i64 %7580, 4
  %7586 = getelementptr inbounds i8, i8* %0, i64 %7585
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7586, i8 0, i64 16, i1 false)
  br label %7587

7587:                                             ; preds = %7584, %7579
  %7588 = add nuw nsw i64 %.01, 948
  %7589 = call zeroext i8 @randombit()
  %7590 = getelementptr inbounds i8, i8* %1, i64 %7588
  store i8 %7589, i8* %7590, align 1
  %7591 = icmp eq i8 %7589, 0
  br i1 %7591, label %7592, label %7595

7592:                                             ; preds = %7587
  %7593 = shl nuw nsw i64 %7588, 4
  %7594 = getelementptr inbounds i8, i8* %0, i64 %7593
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7594, i8 0, i64 16, i1 false)
  br label %7595

7595:                                             ; preds = %7592, %7587
  %7596 = add nuw nsw i64 %.01, 949
  %7597 = call zeroext i8 @randombit()
  %7598 = getelementptr inbounds i8, i8* %1, i64 %7596
  store i8 %7597, i8* %7598, align 1
  %7599 = icmp eq i8 %7597, 0
  br i1 %7599, label %7600, label %7603

7600:                                             ; preds = %7595
  %7601 = shl nuw nsw i64 %7596, 4
  %7602 = getelementptr inbounds i8, i8* %0, i64 %7601
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7602, i8 0, i64 16, i1 false)
  br label %7603

7603:                                             ; preds = %7600, %7595
  %7604 = add nuw nsw i64 %.01, 950
  %7605 = call zeroext i8 @randombit()
  %7606 = getelementptr inbounds i8, i8* %1, i64 %7604
  store i8 %7605, i8* %7606, align 1
  %7607 = icmp eq i8 %7605, 0
  br i1 %7607, label %7608, label %7611

7608:                                             ; preds = %7603
  %7609 = shl nuw nsw i64 %7604, 4
  %7610 = getelementptr inbounds i8, i8* %0, i64 %7609
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7610, i8 0, i64 16, i1 false)
  br label %7611

7611:                                             ; preds = %7608, %7603
  %7612 = add nuw nsw i64 %.01, 951
  %7613 = call zeroext i8 @randombit()
  %7614 = getelementptr inbounds i8, i8* %1, i64 %7612
  store i8 %7613, i8* %7614, align 1
  %7615 = icmp eq i8 %7613, 0
  br i1 %7615, label %7616, label %7619

7616:                                             ; preds = %7611
  %7617 = shl nuw nsw i64 %7612, 4
  %7618 = getelementptr inbounds i8, i8* %0, i64 %7617
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7618, i8 0, i64 16, i1 false)
  br label %7619

7619:                                             ; preds = %7616, %7611
  %7620 = add nuw nsw i64 %.01, 952
  %7621 = call zeroext i8 @randombit()
  %7622 = getelementptr inbounds i8, i8* %1, i64 %7620
  store i8 %7621, i8* %7622, align 1
  %7623 = icmp eq i8 %7621, 0
  br i1 %7623, label %7624, label %7627

7624:                                             ; preds = %7619
  %7625 = shl nuw nsw i64 %7620, 4
  %7626 = getelementptr inbounds i8, i8* %0, i64 %7625
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7626, i8 0, i64 16, i1 false)
  br label %7627

7627:                                             ; preds = %7624, %7619
  %7628 = add nuw nsw i64 %.01, 953
  %7629 = call zeroext i8 @randombit()
  %7630 = getelementptr inbounds i8, i8* %1, i64 %7628
  store i8 %7629, i8* %7630, align 1
  %7631 = icmp eq i8 %7629, 0
  br i1 %7631, label %7632, label %7635

7632:                                             ; preds = %7627
  %7633 = shl nuw nsw i64 %7628, 4
  %7634 = getelementptr inbounds i8, i8* %0, i64 %7633
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7634, i8 0, i64 16, i1 false)
  br label %7635

7635:                                             ; preds = %7632, %7627
  %7636 = add nuw nsw i64 %.01, 954
  %7637 = call zeroext i8 @randombit()
  %7638 = getelementptr inbounds i8, i8* %1, i64 %7636
  store i8 %7637, i8* %7638, align 1
  %7639 = icmp eq i8 %7637, 0
  br i1 %7639, label %7640, label %7643

7640:                                             ; preds = %7635
  %7641 = shl nuw nsw i64 %7636, 4
  %7642 = getelementptr inbounds i8, i8* %0, i64 %7641
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7642, i8 0, i64 16, i1 false)
  br label %7643

7643:                                             ; preds = %7640, %7635
  %7644 = add nuw nsw i64 %.01, 955
  %7645 = call zeroext i8 @randombit()
  %7646 = getelementptr inbounds i8, i8* %1, i64 %7644
  store i8 %7645, i8* %7646, align 1
  %7647 = icmp eq i8 %7645, 0
  br i1 %7647, label %7648, label %7651

7648:                                             ; preds = %7643
  %7649 = shl nuw nsw i64 %7644, 4
  %7650 = getelementptr inbounds i8, i8* %0, i64 %7649
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7650, i8 0, i64 16, i1 false)
  br label %7651

7651:                                             ; preds = %7648, %7643
  %7652 = add nuw nsw i64 %.01, 956
  %7653 = call zeroext i8 @randombit()
  %7654 = getelementptr inbounds i8, i8* %1, i64 %7652
  store i8 %7653, i8* %7654, align 1
  %7655 = icmp eq i8 %7653, 0
  br i1 %7655, label %7656, label %7659

7656:                                             ; preds = %7651
  %7657 = shl nuw nsw i64 %7652, 4
  %7658 = getelementptr inbounds i8, i8* %0, i64 %7657
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7658, i8 0, i64 16, i1 false)
  br label %7659

7659:                                             ; preds = %7656, %7651
  %7660 = add nuw nsw i64 %.01, 957
  %7661 = call zeroext i8 @randombit()
  %7662 = getelementptr inbounds i8, i8* %1, i64 %7660
  store i8 %7661, i8* %7662, align 1
  %7663 = icmp eq i8 %7661, 0
  br i1 %7663, label %7664, label %7667

7664:                                             ; preds = %7659
  %7665 = shl nuw nsw i64 %7660, 4
  %7666 = getelementptr inbounds i8, i8* %0, i64 %7665
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7666, i8 0, i64 16, i1 false)
  br label %7667

7667:                                             ; preds = %7664, %7659
  %7668 = add nuw nsw i64 %.01, 958
  %7669 = call zeroext i8 @randombit()
  %7670 = getelementptr inbounds i8, i8* %1, i64 %7668
  store i8 %7669, i8* %7670, align 1
  %7671 = icmp eq i8 %7669, 0
  br i1 %7671, label %7672, label %7675

7672:                                             ; preds = %7667
  %7673 = shl nuw nsw i64 %7668, 4
  %7674 = getelementptr inbounds i8, i8* %0, i64 %7673
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7674, i8 0, i64 16, i1 false)
  br label %7675

7675:                                             ; preds = %7672, %7667
  %7676 = add nuw nsw i64 %.01, 959
  %7677 = call zeroext i8 @randombit()
  %7678 = getelementptr inbounds i8, i8* %1, i64 %7676
  store i8 %7677, i8* %7678, align 1
  %7679 = icmp eq i8 %7677, 0
  br i1 %7679, label %7680, label %7683

7680:                                             ; preds = %7675
  %7681 = shl nuw nsw i64 %7676, 4
  %7682 = getelementptr inbounds i8, i8* %0, i64 %7681
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7682, i8 0, i64 16, i1 false)
  br label %7683

7683:                                             ; preds = %7680, %7675
  %7684 = add nuw nsw i64 %.01, 960
  %7685 = call zeroext i8 @randombit()
  %7686 = getelementptr inbounds i8, i8* %1, i64 %7684
  store i8 %7685, i8* %7686, align 1
  %7687 = icmp eq i8 %7685, 0
  br i1 %7687, label %7688, label %7691

7688:                                             ; preds = %7683
  %7689 = shl nuw nsw i64 %7684, 4
  %7690 = getelementptr inbounds i8, i8* %0, i64 %7689
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7690, i8 0, i64 16, i1 false)
  br label %7691

7691:                                             ; preds = %7688, %7683
  %7692 = add nuw nsw i64 %.01, 961
  %7693 = call zeroext i8 @randombit()
  %7694 = getelementptr inbounds i8, i8* %1, i64 %7692
  store i8 %7693, i8* %7694, align 1
  %7695 = icmp eq i8 %7693, 0
  br i1 %7695, label %7696, label %7699

7696:                                             ; preds = %7691
  %7697 = shl nuw nsw i64 %7692, 4
  %7698 = getelementptr inbounds i8, i8* %0, i64 %7697
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7698, i8 0, i64 16, i1 false)
  br label %7699

7699:                                             ; preds = %7696, %7691
  %7700 = add nuw nsw i64 %.01, 962
  %7701 = call zeroext i8 @randombit()
  %7702 = getelementptr inbounds i8, i8* %1, i64 %7700
  store i8 %7701, i8* %7702, align 1
  %7703 = icmp eq i8 %7701, 0
  br i1 %7703, label %7704, label %7707

7704:                                             ; preds = %7699
  %7705 = shl nuw nsw i64 %7700, 4
  %7706 = getelementptr inbounds i8, i8* %0, i64 %7705
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7706, i8 0, i64 16, i1 false)
  br label %7707

7707:                                             ; preds = %7704, %7699
  %7708 = add nuw nsw i64 %.01, 963
  %7709 = call zeroext i8 @randombit()
  %7710 = getelementptr inbounds i8, i8* %1, i64 %7708
  store i8 %7709, i8* %7710, align 1
  %7711 = icmp eq i8 %7709, 0
  br i1 %7711, label %7712, label %7715

7712:                                             ; preds = %7707
  %7713 = shl nuw nsw i64 %7708, 4
  %7714 = getelementptr inbounds i8, i8* %0, i64 %7713
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7714, i8 0, i64 16, i1 false)
  br label %7715

7715:                                             ; preds = %7712, %7707
  %7716 = add nuw nsw i64 %.01, 964
  %7717 = call zeroext i8 @randombit()
  %7718 = getelementptr inbounds i8, i8* %1, i64 %7716
  store i8 %7717, i8* %7718, align 1
  %7719 = icmp eq i8 %7717, 0
  br i1 %7719, label %7720, label %7723

7720:                                             ; preds = %7715
  %7721 = shl nuw nsw i64 %7716, 4
  %7722 = getelementptr inbounds i8, i8* %0, i64 %7721
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7722, i8 0, i64 16, i1 false)
  br label %7723

7723:                                             ; preds = %7720, %7715
  %7724 = add nuw nsw i64 %.01, 965
  %7725 = call zeroext i8 @randombit()
  %7726 = getelementptr inbounds i8, i8* %1, i64 %7724
  store i8 %7725, i8* %7726, align 1
  %7727 = icmp eq i8 %7725, 0
  br i1 %7727, label %7728, label %7731

7728:                                             ; preds = %7723
  %7729 = shl nuw nsw i64 %7724, 4
  %7730 = getelementptr inbounds i8, i8* %0, i64 %7729
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7730, i8 0, i64 16, i1 false)
  br label %7731

7731:                                             ; preds = %7728, %7723
  %7732 = add nuw nsw i64 %.01, 966
  %7733 = call zeroext i8 @randombit()
  %7734 = getelementptr inbounds i8, i8* %1, i64 %7732
  store i8 %7733, i8* %7734, align 1
  %7735 = icmp eq i8 %7733, 0
  br i1 %7735, label %7736, label %7739

7736:                                             ; preds = %7731
  %7737 = shl nuw nsw i64 %7732, 4
  %7738 = getelementptr inbounds i8, i8* %0, i64 %7737
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7738, i8 0, i64 16, i1 false)
  br label %7739

7739:                                             ; preds = %7736, %7731
  %7740 = add nuw nsw i64 %.01, 967
  %7741 = call zeroext i8 @randombit()
  %7742 = getelementptr inbounds i8, i8* %1, i64 %7740
  store i8 %7741, i8* %7742, align 1
  %7743 = icmp eq i8 %7741, 0
  br i1 %7743, label %7744, label %7747

7744:                                             ; preds = %7739
  %7745 = shl nuw nsw i64 %7740, 4
  %7746 = getelementptr inbounds i8, i8* %0, i64 %7745
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7746, i8 0, i64 16, i1 false)
  br label %7747

7747:                                             ; preds = %7744, %7739
  %7748 = add nuw nsw i64 %.01, 968
  %7749 = call zeroext i8 @randombit()
  %7750 = getelementptr inbounds i8, i8* %1, i64 %7748
  store i8 %7749, i8* %7750, align 1
  %7751 = icmp eq i8 %7749, 0
  br i1 %7751, label %7752, label %7755

7752:                                             ; preds = %7747
  %7753 = shl nuw nsw i64 %7748, 4
  %7754 = getelementptr inbounds i8, i8* %0, i64 %7753
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7754, i8 0, i64 16, i1 false)
  br label %7755

7755:                                             ; preds = %7752, %7747
  %7756 = add nuw nsw i64 %.01, 969
  %7757 = call zeroext i8 @randombit()
  %7758 = getelementptr inbounds i8, i8* %1, i64 %7756
  store i8 %7757, i8* %7758, align 1
  %7759 = icmp eq i8 %7757, 0
  br i1 %7759, label %7760, label %7763

7760:                                             ; preds = %7755
  %7761 = shl nuw nsw i64 %7756, 4
  %7762 = getelementptr inbounds i8, i8* %0, i64 %7761
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7762, i8 0, i64 16, i1 false)
  br label %7763

7763:                                             ; preds = %7760, %7755
  %7764 = add nuw nsw i64 %.01, 970
  %7765 = call zeroext i8 @randombit()
  %7766 = getelementptr inbounds i8, i8* %1, i64 %7764
  store i8 %7765, i8* %7766, align 1
  %7767 = icmp eq i8 %7765, 0
  br i1 %7767, label %7768, label %7771

7768:                                             ; preds = %7763
  %7769 = shl nuw nsw i64 %7764, 4
  %7770 = getelementptr inbounds i8, i8* %0, i64 %7769
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7770, i8 0, i64 16, i1 false)
  br label %7771

7771:                                             ; preds = %7768, %7763
  %7772 = add nuw nsw i64 %.01, 971
  %7773 = call zeroext i8 @randombit()
  %7774 = getelementptr inbounds i8, i8* %1, i64 %7772
  store i8 %7773, i8* %7774, align 1
  %7775 = icmp eq i8 %7773, 0
  br i1 %7775, label %7776, label %7779

7776:                                             ; preds = %7771
  %7777 = shl nuw nsw i64 %7772, 4
  %7778 = getelementptr inbounds i8, i8* %0, i64 %7777
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7778, i8 0, i64 16, i1 false)
  br label %7779

7779:                                             ; preds = %7776, %7771
  %7780 = add nuw nsw i64 %.01, 972
  %7781 = call zeroext i8 @randombit()
  %7782 = getelementptr inbounds i8, i8* %1, i64 %7780
  store i8 %7781, i8* %7782, align 1
  %7783 = icmp eq i8 %7781, 0
  br i1 %7783, label %7784, label %7787

7784:                                             ; preds = %7779
  %7785 = shl nuw nsw i64 %7780, 4
  %7786 = getelementptr inbounds i8, i8* %0, i64 %7785
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7786, i8 0, i64 16, i1 false)
  br label %7787

7787:                                             ; preds = %7784, %7779
  %7788 = add nuw nsw i64 %.01, 973
  %7789 = call zeroext i8 @randombit()
  %7790 = getelementptr inbounds i8, i8* %1, i64 %7788
  store i8 %7789, i8* %7790, align 1
  %7791 = icmp eq i8 %7789, 0
  br i1 %7791, label %7792, label %7795

7792:                                             ; preds = %7787
  %7793 = shl nuw nsw i64 %7788, 4
  %7794 = getelementptr inbounds i8, i8* %0, i64 %7793
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7794, i8 0, i64 16, i1 false)
  br label %7795

7795:                                             ; preds = %7792, %7787
  %7796 = add nuw nsw i64 %.01, 974
  %7797 = call zeroext i8 @randombit()
  %7798 = getelementptr inbounds i8, i8* %1, i64 %7796
  store i8 %7797, i8* %7798, align 1
  %7799 = icmp eq i8 %7797, 0
  br i1 %7799, label %7800, label %7803

7800:                                             ; preds = %7795
  %7801 = shl nuw nsw i64 %7796, 4
  %7802 = getelementptr inbounds i8, i8* %0, i64 %7801
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7802, i8 0, i64 16, i1 false)
  br label %7803

7803:                                             ; preds = %7800, %7795
  %7804 = add nuw nsw i64 %.01, 975
  %7805 = call zeroext i8 @randombit()
  %7806 = getelementptr inbounds i8, i8* %1, i64 %7804
  store i8 %7805, i8* %7806, align 1
  %7807 = icmp eq i8 %7805, 0
  br i1 %7807, label %7808, label %7811

7808:                                             ; preds = %7803
  %7809 = shl nuw nsw i64 %7804, 4
  %7810 = getelementptr inbounds i8, i8* %0, i64 %7809
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7810, i8 0, i64 16, i1 false)
  br label %7811

7811:                                             ; preds = %7808, %7803
  %7812 = add nuw nsw i64 %.01, 976
  %7813 = call zeroext i8 @randombit()
  %7814 = getelementptr inbounds i8, i8* %1, i64 %7812
  store i8 %7813, i8* %7814, align 1
  %7815 = icmp eq i8 %7813, 0
  br i1 %7815, label %7816, label %7819

7816:                                             ; preds = %7811
  %7817 = shl nuw nsw i64 %7812, 4
  %7818 = getelementptr inbounds i8, i8* %0, i64 %7817
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7818, i8 0, i64 16, i1 false)
  br label %7819

7819:                                             ; preds = %7816, %7811
  %7820 = add nuw nsw i64 %.01, 977
  %7821 = call zeroext i8 @randombit()
  %7822 = getelementptr inbounds i8, i8* %1, i64 %7820
  store i8 %7821, i8* %7822, align 1
  %7823 = icmp eq i8 %7821, 0
  br i1 %7823, label %7824, label %7827

7824:                                             ; preds = %7819
  %7825 = shl nuw nsw i64 %7820, 4
  %7826 = getelementptr inbounds i8, i8* %0, i64 %7825
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7826, i8 0, i64 16, i1 false)
  br label %7827

7827:                                             ; preds = %7824, %7819
  %7828 = add nuw nsw i64 %.01, 978
  %7829 = call zeroext i8 @randombit()
  %7830 = getelementptr inbounds i8, i8* %1, i64 %7828
  store i8 %7829, i8* %7830, align 1
  %7831 = icmp eq i8 %7829, 0
  br i1 %7831, label %7832, label %7835

7832:                                             ; preds = %7827
  %7833 = shl nuw nsw i64 %7828, 4
  %7834 = getelementptr inbounds i8, i8* %0, i64 %7833
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7834, i8 0, i64 16, i1 false)
  br label %7835

7835:                                             ; preds = %7832, %7827
  %7836 = add nuw nsw i64 %.01, 979
  %7837 = call zeroext i8 @randombit()
  %7838 = getelementptr inbounds i8, i8* %1, i64 %7836
  store i8 %7837, i8* %7838, align 1
  %7839 = icmp eq i8 %7837, 0
  br i1 %7839, label %7840, label %7843

7840:                                             ; preds = %7835
  %7841 = shl nuw nsw i64 %7836, 4
  %7842 = getelementptr inbounds i8, i8* %0, i64 %7841
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7842, i8 0, i64 16, i1 false)
  br label %7843

7843:                                             ; preds = %7840, %7835
  %7844 = add nuw nsw i64 %.01, 980
  %7845 = call zeroext i8 @randombit()
  %7846 = getelementptr inbounds i8, i8* %1, i64 %7844
  store i8 %7845, i8* %7846, align 1
  %7847 = icmp eq i8 %7845, 0
  br i1 %7847, label %7848, label %7851

7848:                                             ; preds = %7843
  %7849 = shl nuw nsw i64 %7844, 4
  %7850 = getelementptr inbounds i8, i8* %0, i64 %7849
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7850, i8 0, i64 16, i1 false)
  br label %7851

7851:                                             ; preds = %7848, %7843
  %7852 = add nuw nsw i64 %.01, 981
  %7853 = call zeroext i8 @randombit()
  %7854 = getelementptr inbounds i8, i8* %1, i64 %7852
  store i8 %7853, i8* %7854, align 1
  %7855 = icmp eq i8 %7853, 0
  br i1 %7855, label %7856, label %7859

7856:                                             ; preds = %7851
  %7857 = shl nuw nsw i64 %7852, 4
  %7858 = getelementptr inbounds i8, i8* %0, i64 %7857
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7858, i8 0, i64 16, i1 false)
  br label %7859

7859:                                             ; preds = %7856, %7851
  %7860 = add nuw nsw i64 %.01, 982
  %7861 = call zeroext i8 @randombit()
  %7862 = getelementptr inbounds i8, i8* %1, i64 %7860
  store i8 %7861, i8* %7862, align 1
  %7863 = icmp eq i8 %7861, 0
  br i1 %7863, label %7864, label %7867

7864:                                             ; preds = %7859
  %7865 = shl nuw nsw i64 %7860, 4
  %7866 = getelementptr inbounds i8, i8* %0, i64 %7865
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7866, i8 0, i64 16, i1 false)
  br label %7867

7867:                                             ; preds = %7864, %7859
  %7868 = add nuw nsw i64 %.01, 983
  %7869 = call zeroext i8 @randombit()
  %7870 = getelementptr inbounds i8, i8* %1, i64 %7868
  store i8 %7869, i8* %7870, align 1
  %7871 = icmp eq i8 %7869, 0
  br i1 %7871, label %7872, label %7875

7872:                                             ; preds = %7867
  %7873 = shl nuw nsw i64 %7868, 4
  %7874 = getelementptr inbounds i8, i8* %0, i64 %7873
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7874, i8 0, i64 16, i1 false)
  br label %7875

7875:                                             ; preds = %7872, %7867
  %7876 = add nuw nsw i64 %.01, 984
  %7877 = call zeroext i8 @randombit()
  %7878 = getelementptr inbounds i8, i8* %1, i64 %7876
  store i8 %7877, i8* %7878, align 1
  %7879 = icmp eq i8 %7877, 0
  br i1 %7879, label %7880, label %7883

7880:                                             ; preds = %7875
  %7881 = shl nuw nsw i64 %7876, 4
  %7882 = getelementptr inbounds i8, i8* %0, i64 %7881
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7882, i8 0, i64 16, i1 false)
  br label %7883

7883:                                             ; preds = %7880, %7875
  %7884 = add nuw nsw i64 %.01, 985
  %7885 = call zeroext i8 @randombit()
  %7886 = getelementptr inbounds i8, i8* %1, i64 %7884
  store i8 %7885, i8* %7886, align 1
  %7887 = icmp eq i8 %7885, 0
  br i1 %7887, label %7888, label %7891

7888:                                             ; preds = %7883
  %7889 = shl nuw nsw i64 %7884, 4
  %7890 = getelementptr inbounds i8, i8* %0, i64 %7889
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7890, i8 0, i64 16, i1 false)
  br label %7891

7891:                                             ; preds = %7888, %7883
  %7892 = add nuw nsw i64 %.01, 986
  %7893 = call zeroext i8 @randombit()
  %7894 = getelementptr inbounds i8, i8* %1, i64 %7892
  store i8 %7893, i8* %7894, align 1
  %7895 = icmp eq i8 %7893, 0
  br i1 %7895, label %7896, label %7899

7896:                                             ; preds = %7891
  %7897 = shl nuw nsw i64 %7892, 4
  %7898 = getelementptr inbounds i8, i8* %0, i64 %7897
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7898, i8 0, i64 16, i1 false)
  br label %7899

7899:                                             ; preds = %7896, %7891
  %7900 = add nuw nsw i64 %.01, 987
  %7901 = call zeroext i8 @randombit()
  %7902 = getelementptr inbounds i8, i8* %1, i64 %7900
  store i8 %7901, i8* %7902, align 1
  %7903 = icmp eq i8 %7901, 0
  br i1 %7903, label %7904, label %7907

7904:                                             ; preds = %7899
  %7905 = shl nuw nsw i64 %7900, 4
  %7906 = getelementptr inbounds i8, i8* %0, i64 %7905
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7906, i8 0, i64 16, i1 false)
  br label %7907

7907:                                             ; preds = %7904, %7899
  %7908 = add nuw nsw i64 %.01, 988
  %7909 = call zeroext i8 @randombit()
  %7910 = getelementptr inbounds i8, i8* %1, i64 %7908
  store i8 %7909, i8* %7910, align 1
  %7911 = icmp eq i8 %7909, 0
  br i1 %7911, label %7912, label %7915

7912:                                             ; preds = %7907
  %7913 = shl nuw nsw i64 %7908, 4
  %7914 = getelementptr inbounds i8, i8* %0, i64 %7913
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7914, i8 0, i64 16, i1 false)
  br label %7915

7915:                                             ; preds = %7912, %7907
  %7916 = add nuw nsw i64 %.01, 989
  %7917 = call zeroext i8 @randombit()
  %7918 = getelementptr inbounds i8, i8* %1, i64 %7916
  store i8 %7917, i8* %7918, align 1
  %7919 = icmp eq i8 %7917, 0
  br i1 %7919, label %7920, label %7923

7920:                                             ; preds = %7915
  %7921 = shl nuw nsw i64 %7916, 4
  %7922 = getelementptr inbounds i8, i8* %0, i64 %7921
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7922, i8 0, i64 16, i1 false)
  br label %7923

7923:                                             ; preds = %7920, %7915
  %7924 = add nuw nsw i64 %.01, 990
  %7925 = call zeroext i8 @randombit()
  %7926 = getelementptr inbounds i8, i8* %1, i64 %7924
  store i8 %7925, i8* %7926, align 1
  %7927 = icmp eq i8 %7925, 0
  br i1 %7927, label %7928, label %7931

7928:                                             ; preds = %7923
  %7929 = shl nuw nsw i64 %7924, 4
  %7930 = getelementptr inbounds i8, i8* %0, i64 %7929
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7930, i8 0, i64 16, i1 false)
  br label %7931

7931:                                             ; preds = %7928, %7923
  %7932 = add nuw nsw i64 %.01, 991
  %7933 = call zeroext i8 @randombit()
  %7934 = getelementptr inbounds i8, i8* %1, i64 %7932
  store i8 %7933, i8* %7934, align 1
  %7935 = icmp eq i8 %7933, 0
  br i1 %7935, label %7936, label %7939

7936:                                             ; preds = %7931
  %7937 = shl nuw nsw i64 %7932, 4
  %7938 = getelementptr inbounds i8, i8* %0, i64 %7937
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7938, i8 0, i64 16, i1 false)
  br label %7939

7939:                                             ; preds = %7936, %7931
  %7940 = add nuw nsw i64 %.01, 992
  %7941 = call zeroext i8 @randombit()
  %7942 = getelementptr inbounds i8, i8* %1, i64 %7940
  store i8 %7941, i8* %7942, align 1
  %7943 = icmp eq i8 %7941, 0
  br i1 %7943, label %7944, label %7947

7944:                                             ; preds = %7939
  %7945 = shl nuw nsw i64 %7940, 4
  %7946 = getelementptr inbounds i8, i8* %0, i64 %7945
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7946, i8 0, i64 16, i1 false)
  br label %7947

7947:                                             ; preds = %7944, %7939
  %7948 = add nuw nsw i64 %.01, 993
  %7949 = call zeroext i8 @randombit()
  %7950 = getelementptr inbounds i8, i8* %1, i64 %7948
  store i8 %7949, i8* %7950, align 1
  %7951 = icmp eq i8 %7949, 0
  br i1 %7951, label %7952, label %7955

7952:                                             ; preds = %7947
  %7953 = shl nuw nsw i64 %7948, 4
  %7954 = getelementptr inbounds i8, i8* %0, i64 %7953
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7954, i8 0, i64 16, i1 false)
  br label %7955

7955:                                             ; preds = %7952, %7947
  %7956 = add nuw nsw i64 %.01, 994
  %7957 = call zeroext i8 @randombit()
  %7958 = getelementptr inbounds i8, i8* %1, i64 %7956
  store i8 %7957, i8* %7958, align 1
  %7959 = icmp eq i8 %7957, 0
  br i1 %7959, label %7960, label %7963

7960:                                             ; preds = %7955
  %7961 = shl nuw nsw i64 %7956, 4
  %7962 = getelementptr inbounds i8, i8* %0, i64 %7961
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7962, i8 0, i64 16, i1 false)
  br label %7963

7963:                                             ; preds = %7960, %7955
  %7964 = add nuw nsw i64 %.01, 995
  %7965 = call zeroext i8 @randombit()
  %7966 = getelementptr inbounds i8, i8* %1, i64 %7964
  store i8 %7965, i8* %7966, align 1
  %7967 = icmp eq i8 %7965, 0
  br i1 %7967, label %7968, label %7971

7968:                                             ; preds = %7963
  %7969 = shl nuw nsw i64 %7964, 4
  %7970 = getelementptr inbounds i8, i8* %0, i64 %7969
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7970, i8 0, i64 16, i1 false)
  br label %7971

7971:                                             ; preds = %7968, %7963
  %7972 = add nuw nsw i64 %.01, 996
  %7973 = call zeroext i8 @randombit()
  %7974 = getelementptr inbounds i8, i8* %1, i64 %7972
  store i8 %7973, i8* %7974, align 1
  %7975 = icmp eq i8 %7973, 0
  br i1 %7975, label %7976, label %7979

7976:                                             ; preds = %7971
  %7977 = shl nuw nsw i64 %7972, 4
  %7978 = getelementptr inbounds i8, i8* %0, i64 %7977
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7978, i8 0, i64 16, i1 false)
  br label %7979

7979:                                             ; preds = %7976, %7971
  %7980 = add nuw nsw i64 %.01, 997
  %7981 = call zeroext i8 @randombit()
  %7982 = getelementptr inbounds i8, i8* %1, i64 %7980
  store i8 %7981, i8* %7982, align 1
  %7983 = icmp eq i8 %7981, 0
  br i1 %7983, label %7984, label %7987

7984:                                             ; preds = %7979
  %7985 = shl nuw nsw i64 %7980, 4
  %7986 = getelementptr inbounds i8, i8* %0, i64 %7985
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7986, i8 0, i64 16, i1 false)
  br label %7987

7987:                                             ; preds = %7984, %7979
  %7988 = add nuw nsw i64 %.01, 998
  %7989 = call zeroext i8 @randombit()
  %7990 = getelementptr inbounds i8, i8* %1, i64 %7988
  store i8 %7989, i8* %7990, align 1
  %7991 = icmp eq i8 %7989, 0
  br i1 %7991, label %7992, label %7995

7992:                                             ; preds = %7987
  %7993 = shl nuw nsw i64 %7988, 4
  %7994 = getelementptr inbounds i8, i8* %0, i64 %7993
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %7994, i8 0, i64 16, i1 false)
  br label %7995

7995:                                             ; preds = %7992, %7987
  %7996 = add nuw nsw i64 %.01, 999
  %7997 = call zeroext i8 @randombit()
  %7998 = getelementptr inbounds i8, i8* %1, i64 %7996
  store i8 %7997, i8* %7998, align 1
  %7999 = icmp eq i8 %7997, 0
  br i1 %7999, label %8000, label %8003

8000:                                             ; preds = %7995
  %8001 = shl nuw nsw i64 %7996, 4
  %8002 = getelementptr inbounds i8, i8* %0, i64 %8001
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8002, i8 0, i64 16, i1 false)
  br label %8003

8003:                                             ; preds = %8000, %7995
  %8004 = add nuw nsw i64 %.01, 1000
  %8005 = call zeroext i8 @randombit()
  %8006 = getelementptr inbounds i8, i8* %1, i64 %8004
  store i8 %8005, i8* %8006, align 1
  %8007 = icmp eq i8 %8005, 0
  br i1 %8007, label %8008, label %8011

8008:                                             ; preds = %8003
  %8009 = shl nuw nsw i64 %8004, 4
  %8010 = getelementptr inbounds i8, i8* %0, i64 %8009
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8010, i8 0, i64 16, i1 false)
  br label %8011

8011:                                             ; preds = %8008, %8003
  %8012 = add nuw nsw i64 %.01, 1001
  %8013 = call zeroext i8 @randombit()
  %8014 = getelementptr inbounds i8, i8* %1, i64 %8012
  store i8 %8013, i8* %8014, align 1
  %8015 = icmp eq i8 %8013, 0
  br i1 %8015, label %8016, label %8019

8016:                                             ; preds = %8011
  %8017 = shl nuw nsw i64 %8012, 4
  %8018 = getelementptr inbounds i8, i8* %0, i64 %8017
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8018, i8 0, i64 16, i1 false)
  br label %8019

8019:                                             ; preds = %8016, %8011
  %8020 = add nuw nsw i64 %.01, 1002
  %8021 = call zeroext i8 @randombit()
  %8022 = getelementptr inbounds i8, i8* %1, i64 %8020
  store i8 %8021, i8* %8022, align 1
  %8023 = icmp eq i8 %8021, 0
  br i1 %8023, label %8024, label %8027

8024:                                             ; preds = %8019
  %8025 = shl nuw nsw i64 %8020, 4
  %8026 = getelementptr inbounds i8, i8* %0, i64 %8025
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8026, i8 0, i64 16, i1 false)
  br label %8027

8027:                                             ; preds = %8024, %8019
  %8028 = add nuw nsw i64 %.01, 1003
  %8029 = call zeroext i8 @randombit()
  %8030 = getelementptr inbounds i8, i8* %1, i64 %8028
  store i8 %8029, i8* %8030, align 1
  %8031 = icmp eq i8 %8029, 0
  br i1 %8031, label %8032, label %8035

8032:                                             ; preds = %8027
  %8033 = shl nuw nsw i64 %8028, 4
  %8034 = getelementptr inbounds i8, i8* %0, i64 %8033
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8034, i8 0, i64 16, i1 false)
  br label %8035

8035:                                             ; preds = %8032, %8027
  %8036 = add nuw nsw i64 %.01, 1004
  %8037 = call zeroext i8 @randombit()
  %8038 = getelementptr inbounds i8, i8* %1, i64 %8036
  store i8 %8037, i8* %8038, align 1
  %8039 = icmp eq i8 %8037, 0
  br i1 %8039, label %8040, label %8043

8040:                                             ; preds = %8035
  %8041 = shl nuw nsw i64 %8036, 4
  %8042 = getelementptr inbounds i8, i8* %0, i64 %8041
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8042, i8 0, i64 16, i1 false)
  br label %8043

8043:                                             ; preds = %8040, %8035
  %8044 = add nuw nsw i64 %.01, 1005
  %8045 = call zeroext i8 @randombit()
  %8046 = getelementptr inbounds i8, i8* %1, i64 %8044
  store i8 %8045, i8* %8046, align 1
  %8047 = icmp eq i8 %8045, 0
  br i1 %8047, label %8048, label %8051

8048:                                             ; preds = %8043
  %8049 = shl nuw nsw i64 %8044, 4
  %8050 = getelementptr inbounds i8, i8* %0, i64 %8049
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8050, i8 0, i64 16, i1 false)
  br label %8051

8051:                                             ; preds = %8048, %8043
  %8052 = add nuw nsw i64 %.01, 1006
  %8053 = call zeroext i8 @randombit()
  %8054 = getelementptr inbounds i8, i8* %1, i64 %8052
  store i8 %8053, i8* %8054, align 1
  %8055 = icmp eq i8 %8053, 0
  br i1 %8055, label %8056, label %8059

8056:                                             ; preds = %8051
  %8057 = shl nuw nsw i64 %8052, 4
  %8058 = getelementptr inbounds i8, i8* %0, i64 %8057
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8058, i8 0, i64 16, i1 false)
  br label %8059

8059:                                             ; preds = %8056, %8051
  %8060 = add nuw nsw i64 %.01, 1007
  %8061 = call zeroext i8 @randombit()
  %8062 = getelementptr inbounds i8, i8* %1, i64 %8060
  store i8 %8061, i8* %8062, align 1
  %8063 = icmp eq i8 %8061, 0
  br i1 %8063, label %8064, label %8067

8064:                                             ; preds = %8059
  %8065 = shl nuw nsw i64 %8060, 4
  %8066 = getelementptr inbounds i8, i8* %0, i64 %8065
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8066, i8 0, i64 16, i1 false)
  br label %8067

8067:                                             ; preds = %8064, %8059
  %8068 = add nuw nsw i64 %.01, 1008
  %8069 = call zeroext i8 @randombit()
  %8070 = getelementptr inbounds i8, i8* %1, i64 %8068
  store i8 %8069, i8* %8070, align 1
  %8071 = icmp eq i8 %8069, 0
  br i1 %8071, label %8072, label %8075

8072:                                             ; preds = %8067
  %8073 = shl nuw nsw i64 %8068, 4
  %8074 = getelementptr inbounds i8, i8* %0, i64 %8073
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8074, i8 0, i64 16, i1 false)
  br label %8075

8075:                                             ; preds = %8072, %8067
  %8076 = add nuw nsw i64 %.01, 1009
  %8077 = call zeroext i8 @randombit()
  %8078 = getelementptr inbounds i8, i8* %1, i64 %8076
  store i8 %8077, i8* %8078, align 1
  %8079 = icmp eq i8 %8077, 0
  br i1 %8079, label %8080, label %8083

8080:                                             ; preds = %8075
  %8081 = shl nuw nsw i64 %8076, 4
  %8082 = getelementptr inbounds i8, i8* %0, i64 %8081
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8082, i8 0, i64 16, i1 false)
  br label %8083

8083:                                             ; preds = %8080, %8075
  %8084 = add nuw nsw i64 %.01, 1010
  %8085 = call zeroext i8 @randombit()
  %8086 = getelementptr inbounds i8, i8* %1, i64 %8084
  store i8 %8085, i8* %8086, align 1
  %8087 = icmp eq i8 %8085, 0
  br i1 %8087, label %8088, label %8091

8088:                                             ; preds = %8083
  %8089 = shl nuw nsw i64 %8084, 4
  %8090 = getelementptr inbounds i8, i8* %0, i64 %8089
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8090, i8 0, i64 16, i1 false)
  br label %8091

8091:                                             ; preds = %8088, %8083
  %8092 = add nuw nsw i64 %.01, 1011
  %8093 = call zeroext i8 @randombit()
  %8094 = getelementptr inbounds i8, i8* %1, i64 %8092
  store i8 %8093, i8* %8094, align 1
  %8095 = icmp eq i8 %8093, 0
  br i1 %8095, label %8096, label %8099

8096:                                             ; preds = %8091
  %8097 = shl nuw nsw i64 %8092, 4
  %8098 = getelementptr inbounds i8, i8* %0, i64 %8097
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8098, i8 0, i64 16, i1 false)
  br label %8099

8099:                                             ; preds = %8096, %8091
  %8100 = add nuw nsw i64 %.01, 1012
  %8101 = call zeroext i8 @randombit()
  %8102 = getelementptr inbounds i8, i8* %1, i64 %8100
  store i8 %8101, i8* %8102, align 1
  %8103 = icmp eq i8 %8101, 0
  br i1 %8103, label %8104, label %8107

8104:                                             ; preds = %8099
  %8105 = shl nuw nsw i64 %8100, 4
  %8106 = getelementptr inbounds i8, i8* %0, i64 %8105
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8106, i8 0, i64 16, i1 false)
  br label %8107

8107:                                             ; preds = %8104, %8099
  %8108 = add nuw nsw i64 %.01, 1013
  %8109 = call zeroext i8 @randombit()
  %8110 = getelementptr inbounds i8, i8* %1, i64 %8108
  store i8 %8109, i8* %8110, align 1
  %8111 = icmp eq i8 %8109, 0
  br i1 %8111, label %8112, label %8115

8112:                                             ; preds = %8107
  %8113 = shl nuw nsw i64 %8108, 4
  %8114 = getelementptr inbounds i8, i8* %0, i64 %8113
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8114, i8 0, i64 16, i1 false)
  br label %8115

8115:                                             ; preds = %8112, %8107
  %8116 = add nuw nsw i64 %.01, 1014
  %8117 = call zeroext i8 @randombit()
  %8118 = getelementptr inbounds i8, i8* %1, i64 %8116
  store i8 %8117, i8* %8118, align 1
  %8119 = icmp eq i8 %8117, 0
  br i1 %8119, label %8120, label %8123

8120:                                             ; preds = %8115
  %8121 = shl nuw nsw i64 %8116, 4
  %8122 = getelementptr inbounds i8, i8* %0, i64 %8121
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8122, i8 0, i64 16, i1 false)
  br label %8123

8123:                                             ; preds = %8120, %8115
  %8124 = add nuw nsw i64 %.01, 1015
  %8125 = call zeroext i8 @randombit()
  %8126 = getelementptr inbounds i8, i8* %1, i64 %8124
  store i8 %8125, i8* %8126, align 1
  %8127 = icmp eq i8 %8125, 0
  br i1 %8127, label %8128, label %8131

8128:                                             ; preds = %8123
  %8129 = shl nuw nsw i64 %8124, 4
  %8130 = getelementptr inbounds i8, i8* %0, i64 %8129
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8130, i8 0, i64 16, i1 false)
  br label %8131

8131:                                             ; preds = %8128, %8123
  %8132 = add nuw nsw i64 %.01, 1016
  %8133 = call zeroext i8 @randombit()
  %8134 = getelementptr inbounds i8, i8* %1, i64 %8132
  store i8 %8133, i8* %8134, align 1
  %8135 = icmp eq i8 %8133, 0
  br i1 %8135, label %8136, label %8139

8136:                                             ; preds = %8131
  %8137 = shl nuw nsw i64 %8132, 4
  %8138 = getelementptr inbounds i8, i8* %0, i64 %8137
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8138, i8 0, i64 16, i1 false)
  br label %8139

8139:                                             ; preds = %8136, %8131
  %8140 = add nuw nsw i64 %.01, 1017
  %8141 = call zeroext i8 @randombit()
  %8142 = getelementptr inbounds i8, i8* %1, i64 %8140
  store i8 %8141, i8* %8142, align 1
  %8143 = icmp eq i8 %8141, 0
  br i1 %8143, label %8144, label %8147

8144:                                             ; preds = %8139
  %8145 = shl nuw nsw i64 %8140, 4
  %8146 = getelementptr inbounds i8, i8* %0, i64 %8145
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8146, i8 0, i64 16, i1 false)
  br label %8147

8147:                                             ; preds = %8144, %8139
  %8148 = add nuw nsw i64 %.01, 1018
  %8149 = call zeroext i8 @randombit()
  %8150 = getelementptr inbounds i8, i8* %1, i64 %8148
  store i8 %8149, i8* %8150, align 1
  %8151 = icmp eq i8 %8149, 0
  br i1 %8151, label %8152, label %8155

8152:                                             ; preds = %8147
  %8153 = shl nuw nsw i64 %8148, 4
  %8154 = getelementptr inbounds i8, i8* %0, i64 %8153
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8154, i8 0, i64 16, i1 false)
  br label %8155

8155:                                             ; preds = %8152, %8147
  %8156 = add nuw nsw i64 %.01, 1019
  %8157 = call zeroext i8 @randombit()
  %8158 = getelementptr inbounds i8, i8* %1, i64 %8156
  store i8 %8157, i8* %8158, align 1
  %8159 = icmp eq i8 %8157, 0
  br i1 %8159, label %8160, label %8163

8160:                                             ; preds = %8155
  %8161 = shl nuw nsw i64 %8156, 4
  %8162 = getelementptr inbounds i8, i8* %0, i64 %8161
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8162, i8 0, i64 16, i1 false)
  br label %8163

8163:                                             ; preds = %8160, %8155
  %8164 = add nuw nsw i64 %.01, 1020
  %8165 = call zeroext i8 @randombit()
  %8166 = getelementptr inbounds i8, i8* %1, i64 %8164
  store i8 %8165, i8* %8166, align 1
  %8167 = icmp eq i8 %8165, 0
  br i1 %8167, label %8168, label %8171

8168:                                             ; preds = %8163
  %8169 = shl nuw nsw i64 %8164, 4
  %8170 = getelementptr inbounds i8, i8* %0, i64 %8169
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8170, i8 0, i64 16, i1 false)
  br label %8171

8171:                                             ; preds = %8168, %8163
  %8172 = add nuw nsw i64 %.01, 1021
  %8173 = call zeroext i8 @randombit()
  %8174 = getelementptr inbounds i8, i8* %1, i64 %8172
  store i8 %8173, i8* %8174, align 1
  %8175 = icmp eq i8 %8173, 0
  br i1 %8175, label %8176, label %8179

8176:                                             ; preds = %8171
  %8177 = shl nuw nsw i64 %8172, 4
  %8178 = getelementptr inbounds i8, i8* %0, i64 %8177
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8178, i8 0, i64 16, i1 false)
  br label %8179

8179:                                             ; preds = %8176, %8171
  %8180 = add nuw nsw i64 %.01, 1022
  %8181 = call zeroext i8 @randombit()
  %8182 = getelementptr inbounds i8, i8* %1, i64 %8180
  store i8 %8181, i8* %8182, align 1
  %8183 = icmp eq i8 %8181, 0
  br i1 %8183, label %8184, label %8187

8184:                                             ; preds = %8179
  %8185 = shl nuw nsw i64 %8180, 4
  %8186 = getelementptr inbounds i8, i8* %0, i64 %8185
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8186, i8 0, i64 16, i1 false)
  br label %8187

8187:                                             ; preds = %8184, %8179
  %8188 = add nuw nsw i64 %.01, 1023
  %8189 = call zeroext i8 @randombit()
  %8190 = getelementptr inbounds i8, i8* %1, i64 %8188
  store i8 %8189, i8* %8190, align 1
  %8191 = icmp eq i8 %8189, 0
  br i1 %8191, label %8192, label %8195

8192:                                             ; preds = %8187
  %8193 = shl nuw nsw i64 %8188, 4
  %8194 = getelementptr inbounds i8, i8* %0, i64 %8193
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8194, i8 0, i64 16, i1 false)
  br label %8195

8195:                                             ; preds = %8192, %8187
  %8196 = add nuw nsw i64 %.01, 1024
  %8197 = call zeroext i8 @randombit()
  %8198 = getelementptr inbounds i8, i8* %1, i64 %8196
  store i8 %8197, i8* %8198, align 1
  %8199 = icmp eq i8 %8197, 0
  br i1 %8199, label %8200, label %8203

8200:                                             ; preds = %8195
  %8201 = shl nuw nsw i64 %8196, 4
  %8202 = getelementptr inbounds i8, i8* %0, i64 %8201
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8202, i8 0, i64 16, i1 false)
  br label %8203

8203:                                             ; preds = %8200, %8195
  %8204 = add nuw nsw i64 %.01, 1025
  %8205 = call zeroext i8 @randombit()
  %8206 = getelementptr inbounds i8, i8* %1, i64 %8204
  store i8 %8205, i8* %8206, align 1
  %8207 = icmp eq i8 %8205, 0
  br i1 %8207, label %8208, label %8211

8208:                                             ; preds = %8203
  %8209 = shl nuw nsw i64 %8204, 4
  %8210 = getelementptr inbounds i8, i8* %0, i64 %8209
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8210, i8 0, i64 16, i1 false)
  br label %8211

8211:                                             ; preds = %8208, %8203
  %8212 = add nuw nsw i64 %.01, 1026
  %8213 = call zeroext i8 @randombit()
  %8214 = getelementptr inbounds i8, i8* %1, i64 %8212
  store i8 %8213, i8* %8214, align 1
  %8215 = icmp eq i8 %8213, 0
  br i1 %8215, label %8216, label %8219

8216:                                             ; preds = %8211
  %8217 = shl nuw nsw i64 %8212, 4
  %8218 = getelementptr inbounds i8, i8* %0, i64 %8217
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8218, i8 0, i64 16, i1 false)
  br label %8219

8219:                                             ; preds = %8216, %8211
  %8220 = add nuw nsw i64 %.01, 1027
  %8221 = call zeroext i8 @randombit()
  %8222 = getelementptr inbounds i8, i8* %1, i64 %8220
  store i8 %8221, i8* %8222, align 1
  %8223 = icmp eq i8 %8221, 0
  br i1 %8223, label %8224, label %8227

8224:                                             ; preds = %8219
  %8225 = shl nuw nsw i64 %8220, 4
  %8226 = getelementptr inbounds i8, i8* %0, i64 %8225
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8226, i8 0, i64 16, i1 false)
  br label %8227

8227:                                             ; preds = %8224, %8219
  %8228 = add nuw nsw i64 %.01, 1028
  %8229 = call zeroext i8 @randombit()
  %8230 = getelementptr inbounds i8, i8* %1, i64 %8228
  store i8 %8229, i8* %8230, align 1
  %8231 = icmp eq i8 %8229, 0
  br i1 %8231, label %8232, label %8235

8232:                                             ; preds = %8227
  %8233 = shl nuw nsw i64 %8228, 4
  %8234 = getelementptr inbounds i8, i8* %0, i64 %8233
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8234, i8 0, i64 16, i1 false)
  br label %8235

8235:                                             ; preds = %8232, %8227
  %8236 = add nuw nsw i64 %.01, 1029
  %8237 = call zeroext i8 @randombit()
  %8238 = getelementptr inbounds i8, i8* %1, i64 %8236
  store i8 %8237, i8* %8238, align 1
  %8239 = icmp eq i8 %8237, 0
  br i1 %8239, label %8240, label %8243

8240:                                             ; preds = %8235
  %8241 = shl nuw nsw i64 %8236, 4
  %8242 = getelementptr inbounds i8, i8* %0, i64 %8241
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8242, i8 0, i64 16, i1 false)
  br label %8243

8243:                                             ; preds = %8240, %8235
  %8244 = add nuw nsw i64 %.01, 1030
  %8245 = call zeroext i8 @randombit()
  %8246 = getelementptr inbounds i8, i8* %1, i64 %8244
  store i8 %8245, i8* %8246, align 1
  %8247 = icmp eq i8 %8245, 0
  br i1 %8247, label %8248, label %8251

8248:                                             ; preds = %8243
  %8249 = shl nuw nsw i64 %8244, 4
  %8250 = getelementptr inbounds i8, i8* %0, i64 %8249
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8250, i8 0, i64 16, i1 false)
  br label %8251

8251:                                             ; preds = %8248, %8243
  %8252 = add nuw nsw i64 %.01, 1031
  %8253 = call zeroext i8 @randombit()
  %8254 = getelementptr inbounds i8, i8* %1, i64 %8252
  store i8 %8253, i8* %8254, align 1
  %8255 = icmp eq i8 %8253, 0
  br i1 %8255, label %8256, label %8259

8256:                                             ; preds = %8251
  %8257 = shl nuw nsw i64 %8252, 4
  %8258 = getelementptr inbounds i8, i8* %0, i64 %8257
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8258, i8 0, i64 16, i1 false)
  br label %8259

8259:                                             ; preds = %8256, %8251
  %8260 = add nuw nsw i64 %.01, 1032
  %8261 = call zeroext i8 @randombit()
  %8262 = getelementptr inbounds i8, i8* %1, i64 %8260
  store i8 %8261, i8* %8262, align 1
  %8263 = icmp eq i8 %8261, 0
  br i1 %8263, label %8264, label %8267

8264:                                             ; preds = %8259
  %8265 = shl nuw nsw i64 %8260, 4
  %8266 = getelementptr inbounds i8, i8* %0, i64 %8265
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8266, i8 0, i64 16, i1 false)
  br label %8267

8267:                                             ; preds = %8264, %8259
  %8268 = add nuw nsw i64 %.01, 1033
  %8269 = call zeroext i8 @randombit()
  %8270 = getelementptr inbounds i8, i8* %1, i64 %8268
  store i8 %8269, i8* %8270, align 1
  %8271 = icmp eq i8 %8269, 0
  br i1 %8271, label %8272, label %8275

8272:                                             ; preds = %8267
  %8273 = shl nuw nsw i64 %8268, 4
  %8274 = getelementptr inbounds i8, i8* %0, i64 %8273
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8274, i8 0, i64 16, i1 false)
  br label %8275

8275:                                             ; preds = %8272, %8267
  %8276 = add nuw nsw i64 %.01, 1034
  %8277 = call zeroext i8 @randombit()
  %8278 = getelementptr inbounds i8, i8* %1, i64 %8276
  store i8 %8277, i8* %8278, align 1
  %8279 = icmp eq i8 %8277, 0
  br i1 %8279, label %8280, label %8283

8280:                                             ; preds = %8275
  %8281 = shl nuw nsw i64 %8276, 4
  %8282 = getelementptr inbounds i8, i8* %0, i64 %8281
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8282, i8 0, i64 16, i1 false)
  br label %8283

8283:                                             ; preds = %8280, %8275
  %8284 = add nuw nsw i64 %.01, 1035
  %8285 = call zeroext i8 @randombit()
  %8286 = getelementptr inbounds i8, i8* %1, i64 %8284
  store i8 %8285, i8* %8286, align 1
  %8287 = icmp eq i8 %8285, 0
  br i1 %8287, label %8288, label %8291

8288:                                             ; preds = %8283
  %8289 = shl nuw nsw i64 %8284, 4
  %8290 = getelementptr inbounds i8, i8* %0, i64 %8289
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8290, i8 0, i64 16, i1 false)
  br label %8291

8291:                                             ; preds = %8288, %8283
  %8292 = add nuw nsw i64 %.01, 1036
  %8293 = call zeroext i8 @randombit()
  %8294 = getelementptr inbounds i8, i8* %1, i64 %8292
  store i8 %8293, i8* %8294, align 1
  %8295 = icmp eq i8 %8293, 0
  br i1 %8295, label %8296, label %8299

8296:                                             ; preds = %8291
  %8297 = shl nuw nsw i64 %8292, 4
  %8298 = getelementptr inbounds i8, i8* %0, i64 %8297
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8298, i8 0, i64 16, i1 false)
  br label %8299

8299:                                             ; preds = %8296, %8291
  %8300 = add nuw nsw i64 %.01, 1037
  %8301 = call zeroext i8 @randombit()
  %8302 = getelementptr inbounds i8, i8* %1, i64 %8300
  store i8 %8301, i8* %8302, align 1
  %8303 = icmp eq i8 %8301, 0
  br i1 %8303, label %8304, label %8307

8304:                                             ; preds = %8299
  %8305 = shl nuw nsw i64 %8300, 4
  %8306 = getelementptr inbounds i8, i8* %0, i64 %8305
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8306, i8 0, i64 16, i1 false)
  br label %8307

8307:                                             ; preds = %8304, %8299
  %8308 = add nuw nsw i64 %.01, 1038
  %8309 = call zeroext i8 @randombit()
  %8310 = getelementptr inbounds i8, i8* %1, i64 %8308
  store i8 %8309, i8* %8310, align 1
  %8311 = icmp eq i8 %8309, 0
  br i1 %8311, label %8312, label %8315

8312:                                             ; preds = %8307
  %8313 = shl nuw nsw i64 %8308, 4
  %8314 = getelementptr inbounds i8, i8* %0, i64 %8313
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8314, i8 0, i64 16, i1 false)
  br label %8315

8315:                                             ; preds = %8312, %8307
  %8316 = add nuw nsw i64 %.01, 1039
  %8317 = call zeroext i8 @randombit()
  %8318 = getelementptr inbounds i8, i8* %1, i64 %8316
  store i8 %8317, i8* %8318, align 1
  %8319 = icmp eq i8 %8317, 0
  br i1 %8319, label %8320, label %8323

8320:                                             ; preds = %8315
  %8321 = shl nuw nsw i64 %8316, 4
  %8322 = getelementptr inbounds i8, i8* %0, i64 %8321
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8322, i8 0, i64 16, i1 false)
  br label %8323

8323:                                             ; preds = %8320, %8315
  %8324 = add nuw nsw i64 %.01, 1040
  %8325 = call zeroext i8 @randombit()
  %8326 = getelementptr inbounds i8, i8* %1, i64 %8324
  store i8 %8325, i8* %8326, align 1
  %8327 = icmp eq i8 %8325, 0
  br i1 %8327, label %8328, label %8331

8328:                                             ; preds = %8323
  %8329 = shl nuw nsw i64 %8324, 4
  %8330 = getelementptr inbounds i8, i8* %0, i64 %8329
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8330, i8 0, i64 16, i1 false)
  br label %8331

8331:                                             ; preds = %8328, %8323
  %8332 = add nuw nsw i64 %.01, 1041
  %8333 = call zeroext i8 @randombit()
  %8334 = getelementptr inbounds i8, i8* %1, i64 %8332
  store i8 %8333, i8* %8334, align 1
  %8335 = icmp eq i8 %8333, 0
  br i1 %8335, label %8336, label %8339

8336:                                             ; preds = %8331
  %8337 = shl nuw nsw i64 %8332, 4
  %8338 = getelementptr inbounds i8, i8* %0, i64 %8337
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8338, i8 0, i64 16, i1 false)
  br label %8339

8339:                                             ; preds = %8336, %8331
  %8340 = add nuw nsw i64 %.01, 1042
  %8341 = call zeroext i8 @randombit()
  %8342 = getelementptr inbounds i8, i8* %1, i64 %8340
  store i8 %8341, i8* %8342, align 1
  %8343 = icmp eq i8 %8341, 0
  br i1 %8343, label %8344, label %8347

8344:                                             ; preds = %8339
  %8345 = shl nuw nsw i64 %8340, 4
  %8346 = getelementptr inbounds i8, i8* %0, i64 %8345
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8346, i8 0, i64 16, i1 false)
  br label %8347

8347:                                             ; preds = %8344, %8339
  %8348 = add nuw nsw i64 %.01, 1043
  %8349 = call zeroext i8 @randombit()
  %8350 = getelementptr inbounds i8, i8* %1, i64 %8348
  store i8 %8349, i8* %8350, align 1
  %8351 = icmp eq i8 %8349, 0
  br i1 %8351, label %8352, label %8355

8352:                                             ; preds = %8347
  %8353 = shl nuw nsw i64 %8348, 4
  %8354 = getelementptr inbounds i8, i8* %0, i64 %8353
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8354, i8 0, i64 16, i1 false)
  br label %8355

8355:                                             ; preds = %8352, %8347
  %8356 = add nuw nsw i64 %.01, 1044
  %8357 = call zeroext i8 @randombit()
  %8358 = getelementptr inbounds i8, i8* %1, i64 %8356
  store i8 %8357, i8* %8358, align 1
  %8359 = icmp eq i8 %8357, 0
  br i1 %8359, label %8360, label %8363

8360:                                             ; preds = %8355
  %8361 = shl nuw nsw i64 %8356, 4
  %8362 = getelementptr inbounds i8, i8* %0, i64 %8361
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8362, i8 0, i64 16, i1 false)
  br label %8363

8363:                                             ; preds = %8360, %8355
  %8364 = add nuw nsw i64 %.01, 1045
  %8365 = call zeroext i8 @randombit()
  %8366 = getelementptr inbounds i8, i8* %1, i64 %8364
  store i8 %8365, i8* %8366, align 1
  %8367 = icmp eq i8 %8365, 0
  br i1 %8367, label %8368, label %8371

8368:                                             ; preds = %8363
  %8369 = shl nuw nsw i64 %8364, 4
  %8370 = getelementptr inbounds i8, i8* %0, i64 %8369
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8370, i8 0, i64 16, i1 false)
  br label %8371

8371:                                             ; preds = %8368, %8363
  %8372 = add nuw nsw i64 %.01, 1046
  %8373 = call zeroext i8 @randombit()
  %8374 = getelementptr inbounds i8, i8* %1, i64 %8372
  store i8 %8373, i8* %8374, align 1
  %8375 = icmp eq i8 %8373, 0
  br i1 %8375, label %8376, label %8379

8376:                                             ; preds = %8371
  %8377 = shl nuw nsw i64 %8372, 4
  %8378 = getelementptr inbounds i8, i8* %0, i64 %8377
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8378, i8 0, i64 16, i1 false)
  br label %8379

8379:                                             ; preds = %8376, %8371
  %8380 = add nuw nsw i64 %.01, 1047
  %8381 = call zeroext i8 @randombit()
  %8382 = getelementptr inbounds i8, i8* %1, i64 %8380
  store i8 %8381, i8* %8382, align 1
  %8383 = icmp eq i8 %8381, 0
  br i1 %8383, label %8384, label %8387

8384:                                             ; preds = %8379
  %8385 = shl nuw nsw i64 %8380, 4
  %8386 = getelementptr inbounds i8, i8* %0, i64 %8385
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8386, i8 0, i64 16, i1 false)
  br label %8387

8387:                                             ; preds = %8384, %8379
  %8388 = add nuw nsw i64 %.01, 1048
  %8389 = call zeroext i8 @randombit()
  %8390 = getelementptr inbounds i8, i8* %1, i64 %8388
  store i8 %8389, i8* %8390, align 1
  %8391 = icmp eq i8 %8389, 0
  br i1 %8391, label %8392, label %8395

8392:                                             ; preds = %8387
  %8393 = shl nuw nsw i64 %8388, 4
  %8394 = getelementptr inbounds i8, i8* %0, i64 %8393
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8394, i8 0, i64 16, i1 false)
  br label %8395

8395:                                             ; preds = %8392, %8387
  %8396 = add nuw nsw i64 %.01, 1049
  %8397 = call zeroext i8 @randombit()
  %8398 = getelementptr inbounds i8, i8* %1, i64 %8396
  store i8 %8397, i8* %8398, align 1
  %8399 = icmp eq i8 %8397, 0
  br i1 %8399, label %8400, label %8403

8400:                                             ; preds = %8395
  %8401 = shl nuw nsw i64 %8396, 4
  %8402 = getelementptr inbounds i8, i8* %0, i64 %8401
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8402, i8 0, i64 16, i1 false)
  br label %8403

8403:                                             ; preds = %8400, %8395
  %8404 = add nuw nsw i64 %.01, 1050
  %8405 = call zeroext i8 @randombit()
  %8406 = getelementptr inbounds i8, i8* %1, i64 %8404
  store i8 %8405, i8* %8406, align 1
  %8407 = icmp eq i8 %8405, 0
  br i1 %8407, label %8408, label %8411

8408:                                             ; preds = %8403
  %8409 = shl nuw nsw i64 %8404, 4
  %8410 = getelementptr inbounds i8, i8* %0, i64 %8409
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8410, i8 0, i64 16, i1 false)
  br label %8411

8411:                                             ; preds = %8408, %8403
  %8412 = add nuw nsw i64 %.01, 1051
  %8413 = call zeroext i8 @randombit()
  %8414 = getelementptr inbounds i8, i8* %1, i64 %8412
  store i8 %8413, i8* %8414, align 1
  %8415 = icmp eq i8 %8413, 0
  br i1 %8415, label %8416, label %8419

8416:                                             ; preds = %8411
  %8417 = shl nuw nsw i64 %8412, 4
  %8418 = getelementptr inbounds i8, i8* %0, i64 %8417
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8418, i8 0, i64 16, i1 false)
  br label %8419

8419:                                             ; preds = %8416, %8411
  %8420 = add nuw nsw i64 %.01, 1052
  %8421 = call zeroext i8 @randombit()
  %8422 = getelementptr inbounds i8, i8* %1, i64 %8420
  store i8 %8421, i8* %8422, align 1
  %8423 = icmp eq i8 %8421, 0
  br i1 %8423, label %8424, label %8427

8424:                                             ; preds = %8419
  %8425 = shl nuw nsw i64 %8420, 4
  %8426 = getelementptr inbounds i8, i8* %0, i64 %8425
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8426, i8 0, i64 16, i1 false)
  br label %8427

8427:                                             ; preds = %8424, %8419
  %8428 = add nuw nsw i64 %.01, 1053
  %8429 = call zeroext i8 @randombit()
  %8430 = getelementptr inbounds i8, i8* %1, i64 %8428
  store i8 %8429, i8* %8430, align 1
  %8431 = icmp eq i8 %8429, 0
  br i1 %8431, label %8432, label %8435

8432:                                             ; preds = %8427
  %8433 = shl nuw nsw i64 %8428, 4
  %8434 = getelementptr inbounds i8, i8* %0, i64 %8433
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8434, i8 0, i64 16, i1 false)
  br label %8435

8435:                                             ; preds = %8432, %8427
  %8436 = add nuw nsw i64 %.01, 1054
  %8437 = call zeroext i8 @randombit()
  %8438 = getelementptr inbounds i8, i8* %1, i64 %8436
  store i8 %8437, i8* %8438, align 1
  %8439 = icmp eq i8 %8437, 0
  br i1 %8439, label %8440, label %8443

8440:                                             ; preds = %8435
  %8441 = shl nuw nsw i64 %8436, 4
  %8442 = getelementptr inbounds i8, i8* %0, i64 %8441
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8442, i8 0, i64 16, i1 false)
  br label %8443

8443:                                             ; preds = %8440, %8435
  %8444 = add nuw nsw i64 %.01, 1055
  %8445 = call zeroext i8 @randombit()
  %8446 = getelementptr inbounds i8, i8* %1, i64 %8444
  store i8 %8445, i8* %8446, align 1
  %8447 = icmp eq i8 %8445, 0
  br i1 %8447, label %8448, label %8451

8448:                                             ; preds = %8443
  %8449 = shl nuw nsw i64 %8444, 4
  %8450 = getelementptr inbounds i8, i8* %0, i64 %8449
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8450, i8 0, i64 16, i1 false)
  br label %8451

8451:                                             ; preds = %8448, %8443
  %8452 = add nuw nsw i64 %.01, 1056
  %8453 = call zeroext i8 @randombit()
  %8454 = getelementptr inbounds i8, i8* %1, i64 %8452
  store i8 %8453, i8* %8454, align 1
  %8455 = icmp eq i8 %8453, 0
  br i1 %8455, label %8456, label %8459

8456:                                             ; preds = %8451
  %8457 = shl nuw nsw i64 %8452, 4
  %8458 = getelementptr inbounds i8, i8* %0, i64 %8457
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8458, i8 0, i64 16, i1 false)
  br label %8459

8459:                                             ; preds = %8456, %8451
  %8460 = add nuw nsw i64 %.01, 1057
  %8461 = call zeroext i8 @randombit()
  %8462 = getelementptr inbounds i8, i8* %1, i64 %8460
  store i8 %8461, i8* %8462, align 1
  %8463 = icmp eq i8 %8461, 0
  br i1 %8463, label %8464, label %8467

8464:                                             ; preds = %8459
  %8465 = shl nuw nsw i64 %8460, 4
  %8466 = getelementptr inbounds i8, i8* %0, i64 %8465
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8466, i8 0, i64 16, i1 false)
  br label %8467

8467:                                             ; preds = %8464, %8459
  %8468 = add nuw nsw i64 %.01, 1058
  %8469 = call zeroext i8 @randombit()
  %8470 = getelementptr inbounds i8, i8* %1, i64 %8468
  store i8 %8469, i8* %8470, align 1
  %8471 = icmp eq i8 %8469, 0
  br i1 %8471, label %8472, label %8475

8472:                                             ; preds = %8467
  %8473 = shl nuw nsw i64 %8468, 4
  %8474 = getelementptr inbounds i8, i8* %0, i64 %8473
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8474, i8 0, i64 16, i1 false)
  br label %8475

8475:                                             ; preds = %8472, %8467
  %8476 = add nuw nsw i64 %.01, 1059
  %8477 = call zeroext i8 @randombit()
  %8478 = getelementptr inbounds i8, i8* %1, i64 %8476
  store i8 %8477, i8* %8478, align 1
  %8479 = icmp eq i8 %8477, 0
  br i1 %8479, label %8480, label %8483

8480:                                             ; preds = %8475
  %8481 = shl nuw nsw i64 %8476, 4
  %8482 = getelementptr inbounds i8, i8* %0, i64 %8481
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8482, i8 0, i64 16, i1 false)
  br label %8483

8483:                                             ; preds = %8480, %8475
  %8484 = add nuw nsw i64 %.01, 1060
  %8485 = call zeroext i8 @randombit()
  %8486 = getelementptr inbounds i8, i8* %1, i64 %8484
  store i8 %8485, i8* %8486, align 1
  %8487 = icmp eq i8 %8485, 0
  br i1 %8487, label %8488, label %8491

8488:                                             ; preds = %8483
  %8489 = shl nuw nsw i64 %8484, 4
  %8490 = getelementptr inbounds i8, i8* %0, i64 %8489
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8490, i8 0, i64 16, i1 false)
  br label %8491

8491:                                             ; preds = %8488, %8483
  %8492 = add nuw nsw i64 %.01, 1061
  %8493 = call zeroext i8 @randombit()
  %8494 = getelementptr inbounds i8, i8* %1, i64 %8492
  store i8 %8493, i8* %8494, align 1
  %8495 = icmp eq i8 %8493, 0
  br i1 %8495, label %8496, label %8499

8496:                                             ; preds = %8491
  %8497 = shl nuw nsw i64 %8492, 4
  %8498 = getelementptr inbounds i8, i8* %0, i64 %8497
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8498, i8 0, i64 16, i1 false)
  br label %8499

8499:                                             ; preds = %8496, %8491
  %8500 = add nuw nsw i64 %.01, 1062
  %8501 = call zeroext i8 @randombit()
  %8502 = getelementptr inbounds i8, i8* %1, i64 %8500
  store i8 %8501, i8* %8502, align 1
  %8503 = icmp eq i8 %8501, 0
  br i1 %8503, label %8504, label %8507

8504:                                             ; preds = %8499
  %8505 = shl nuw nsw i64 %8500, 4
  %8506 = getelementptr inbounds i8, i8* %0, i64 %8505
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8506, i8 0, i64 16, i1 false)
  br label %8507

8507:                                             ; preds = %8504, %8499
  %8508 = add nuw nsw i64 %.01, 1063
  %8509 = call zeroext i8 @randombit()
  %8510 = getelementptr inbounds i8, i8* %1, i64 %8508
  store i8 %8509, i8* %8510, align 1
  %8511 = icmp eq i8 %8509, 0
  br i1 %8511, label %8512, label %8515

8512:                                             ; preds = %8507
  %8513 = shl nuw nsw i64 %8508, 4
  %8514 = getelementptr inbounds i8, i8* %0, i64 %8513
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8514, i8 0, i64 16, i1 false)
  br label %8515

8515:                                             ; preds = %8512, %8507
  %8516 = add nuw nsw i64 %.01, 1064
  %8517 = call zeroext i8 @randombit()
  %8518 = getelementptr inbounds i8, i8* %1, i64 %8516
  store i8 %8517, i8* %8518, align 1
  %8519 = icmp eq i8 %8517, 0
  br i1 %8519, label %8520, label %8523

8520:                                             ; preds = %8515
  %8521 = shl nuw nsw i64 %8516, 4
  %8522 = getelementptr inbounds i8, i8* %0, i64 %8521
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8522, i8 0, i64 16, i1 false)
  br label %8523

8523:                                             ; preds = %8520, %8515
  %8524 = add nuw nsw i64 %.01, 1065
  %8525 = call zeroext i8 @randombit()
  %8526 = getelementptr inbounds i8, i8* %1, i64 %8524
  store i8 %8525, i8* %8526, align 1
  %8527 = icmp eq i8 %8525, 0
  br i1 %8527, label %8528, label %8531

8528:                                             ; preds = %8523
  %8529 = shl nuw nsw i64 %8524, 4
  %8530 = getelementptr inbounds i8, i8* %0, i64 %8529
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8530, i8 0, i64 16, i1 false)
  br label %8531

8531:                                             ; preds = %8528, %8523
  %8532 = add nuw nsw i64 %.01, 1066
  %8533 = call zeroext i8 @randombit()
  %8534 = getelementptr inbounds i8, i8* %1, i64 %8532
  store i8 %8533, i8* %8534, align 1
  %8535 = icmp eq i8 %8533, 0
  br i1 %8535, label %8536, label %8539

8536:                                             ; preds = %8531
  %8537 = shl nuw nsw i64 %8532, 4
  %8538 = getelementptr inbounds i8, i8* %0, i64 %8537
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8538, i8 0, i64 16, i1 false)
  br label %8539

8539:                                             ; preds = %8536, %8531
  %8540 = add nuw nsw i64 %.01, 1067
  %8541 = call zeroext i8 @randombit()
  %8542 = getelementptr inbounds i8, i8* %1, i64 %8540
  store i8 %8541, i8* %8542, align 1
  %8543 = icmp eq i8 %8541, 0
  br i1 %8543, label %8544, label %8547

8544:                                             ; preds = %8539
  %8545 = shl nuw nsw i64 %8540, 4
  %8546 = getelementptr inbounds i8, i8* %0, i64 %8545
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8546, i8 0, i64 16, i1 false)
  br label %8547

8547:                                             ; preds = %8544, %8539
  %8548 = add nuw nsw i64 %.01, 1068
  %8549 = call zeroext i8 @randombit()
  %8550 = getelementptr inbounds i8, i8* %1, i64 %8548
  store i8 %8549, i8* %8550, align 1
  %8551 = icmp eq i8 %8549, 0
  br i1 %8551, label %8552, label %8555

8552:                                             ; preds = %8547
  %8553 = shl nuw nsw i64 %8548, 4
  %8554 = getelementptr inbounds i8, i8* %0, i64 %8553
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8554, i8 0, i64 16, i1 false)
  br label %8555

8555:                                             ; preds = %8552, %8547
  %8556 = add nuw nsw i64 %.01, 1069
  %8557 = call zeroext i8 @randombit()
  %8558 = getelementptr inbounds i8, i8* %1, i64 %8556
  store i8 %8557, i8* %8558, align 1
  %8559 = icmp eq i8 %8557, 0
  br i1 %8559, label %8560, label %8563

8560:                                             ; preds = %8555
  %8561 = shl nuw nsw i64 %8556, 4
  %8562 = getelementptr inbounds i8, i8* %0, i64 %8561
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8562, i8 0, i64 16, i1 false)
  br label %8563

8563:                                             ; preds = %8560, %8555
  %8564 = add nuw nsw i64 %.01, 1070
  %8565 = call zeroext i8 @randombit()
  %8566 = getelementptr inbounds i8, i8* %1, i64 %8564
  store i8 %8565, i8* %8566, align 1
  %8567 = icmp eq i8 %8565, 0
  br i1 %8567, label %8568, label %8571

8568:                                             ; preds = %8563
  %8569 = shl nuw nsw i64 %8564, 4
  %8570 = getelementptr inbounds i8, i8* %0, i64 %8569
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8570, i8 0, i64 16, i1 false)
  br label %8571

8571:                                             ; preds = %8568, %8563
  %8572 = add nuw nsw i64 %.01, 1071
  %8573 = call zeroext i8 @randombit()
  %8574 = getelementptr inbounds i8, i8* %1, i64 %8572
  store i8 %8573, i8* %8574, align 1
  %8575 = icmp eq i8 %8573, 0
  br i1 %8575, label %8576, label %8579

8576:                                             ; preds = %8571
  %8577 = shl nuw nsw i64 %8572, 4
  %8578 = getelementptr inbounds i8, i8* %0, i64 %8577
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8578, i8 0, i64 16, i1 false)
  br label %8579

8579:                                             ; preds = %8576, %8571
  %8580 = add nuw nsw i64 %.01, 1072
  %8581 = call zeroext i8 @randombit()
  %8582 = getelementptr inbounds i8, i8* %1, i64 %8580
  store i8 %8581, i8* %8582, align 1
  %8583 = icmp eq i8 %8581, 0
  br i1 %8583, label %8584, label %8587

8584:                                             ; preds = %8579
  %8585 = shl nuw nsw i64 %8580, 4
  %8586 = getelementptr inbounds i8, i8* %0, i64 %8585
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8586, i8 0, i64 16, i1 false)
  br label %8587

8587:                                             ; preds = %8584, %8579
  %8588 = add nuw nsw i64 %.01, 1073
  %8589 = call zeroext i8 @randombit()
  %8590 = getelementptr inbounds i8, i8* %1, i64 %8588
  store i8 %8589, i8* %8590, align 1
  %8591 = icmp eq i8 %8589, 0
  br i1 %8591, label %8592, label %8595

8592:                                             ; preds = %8587
  %8593 = shl nuw nsw i64 %8588, 4
  %8594 = getelementptr inbounds i8, i8* %0, i64 %8593
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8594, i8 0, i64 16, i1 false)
  br label %8595

8595:                                             ; preds = %8592, %8587
  %8596 = add nuw nsw i64 %.01, 1074
  %8597 = call zeroext i8 @randombit()
  %8598 = getelementptr inbounds i8, i8* %1, i64 %8596
  store i8 %8597, i8* %8598, align 1
  %8599 = icmp eq i8 %8597, 0
  br i1 %8599, label %8600, label %8603

8600:                                             ; preds = %8595
  %8601 = shl nuw nsw i64 %8596, 4
  %8602 = getelementptr inbounds i8, i8* %0, i64 %8601
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8602, i8 0, i64 16, i1 false)
  br label %8603

8603:                                             ; preds = %8600, %8595
  %8604 = add nuw nsw i64 %.01, 1075
  %8605 = call zeroext i8 @randombit()
  %8606 = getelementptr inbounds i8, i8* %1, i64 %8604
  store i8 %8605, i8* %8606, align 1
  %8607 = icmp eq i8 %8605, 0
  br i1 %8607, label %8608, label %8611

8608:                                             ; preds = %8603
  %8609 = shl nuw nsw i64 %8604, 4
  %8610 = getelementptr inbounds i8, i8* %0, i64 %8609
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8610, i8 0, i64 16, i1 false)
  br label %8611

8611:                                             ; preds = %8608, %8603
  %8612 = add nuw nsw i64 %.01, 1076
  %8613 = call zeroext i8 @randombit()
  %8614 = getelementptr inbounds i8, i8* %1, i64 %8612
  store i8 %8613, i8* %8614, align 1
  %8615 = icmp eq i8 %8613, 0
  br i1 %8615, label %8616, label %8619

8616:                                             ; preds = %8611
  %8617 = shl nuw nsw i64 %8612, 4
  %8618 = getelementptr inbounds i8, i8* %0, i64 %8617
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8618, i8 0, i64 16, i1 false)
  br label %8619

8619:                                             ; preds = %8616, %8611
  %8620 = add nuw nsw i64 %.01, 1077
  %8621 = call zeroext i8 @randombit()
  %8622 = getelementptr inbounds i8, i8* %1, i64 %8620
  store i8 %8621, i8* %8622, align 1
  %8623 = icmp eq i8 %8621, 0
  br i1 %8623, label %8624, label %8627

8624:                                             ; preds = %8619
  %8625 = shl nuw nsw i64 %8620, 4
  %8626 = getelementptr inbounds i8, i8* %0, i64 %8625
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8626, i8 0, i64 16, i1 false)
  br label %8627

8627:                                             ; preds = %8624, %8619
  %8628 = add nuw nsw i64 %.01, 1078
  %8629 = call zeroext i8 @randombit()
  %8630 = getelementptr inbounds i8, i8* %1, i64 %8628
  store i8 %8629, i8* %8630, align 1
  %8631 = icmp eq i8 %8629, 0
  br i1 %8631, label %8632, label %8635

8632:                                             ; preds = %8627
  %8633 = shl nuw nsw i64 %8628, 4
  %8634 = getelementptr inbounds i8, i8* %0, i64 %8633
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8634, i8 0, i64 16, i1 false)
  br label %8635

8635:                                             ; preds = %8632, %8627
  %8636 = add nuw nsw i64 %.01, 1079
  %8637 = call zeroext i8 @randombit()
  %8638 = getelementptr inbounds i8, i8* %1, i64 %8636
  store i8 %8637, i8* %8638, align 1
  %8639 = icmp eq i8 %8637, 0
  br i1 %8639, label %8640, label %8643

8640:                                             ; preds = %8635
  %8641 = shl nuw nsw i64 %8636, 4
  %8642 = getelementptr inbounds i8, i8* %0, i64 %8641
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8642, i8 0, i64 16, i1 false)
  br label %8643

8643:                                             ; preds = %8640, %8635
  %8644 = add nuw nsw i64 %.01, 1080
  %8645 = call zeroext i8 @randombit()
  %8646 = getelementptr inbounds i8, i8* %1, i64 %8644
  store i8 %8645, i8* %8646, align 1
  %8647 = icmp eq i8 %8645, 0
  br i1 %8647, label %8648, label %8651

8648:                                             ; preds = %8643
  %8649 = shl nuw nsw i64 %8644, 4
  %8650 = getelementptr inbounds i8, i8* %0, i64 %8649
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8650, i8 0, i64 16, i1 false)
  br label %8651

8651:                                             ; preds = %8648, %8643
  %8652 = add nuw nsw i64 %.01, 1081
  %8653 = call zeroext i8 @randombit()
  %8654 = getelementptr inbounds i8, i8* %1, i64 %8652
  store i8 %8653, i8* %8654, align 1
  %8655 = icmp eq i8 %8653, 0
  br i1 %8655, label %8656, label %8659

8656:                                             ; preds = %8651
  %8657 = shl nuw nsw i64 %8652, 4
  %8658 = getelementptr inbounds i8, i8* %0, i64 %8657
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8658, i8 0, i64 16, i1 false)
  br label %8659

8659:                                             ; preds = %8656, %8651
  %8660 = add nuw nsw i64 %.01, 1082
  %8661 = call zeroext i8 @randombit()
  %8662 = getelementptr inbounds i8, i8* %1, i64 %8660
  store i8 %8661, i8* %8662, align 1
  %8663 = icmp eq i8 %8661, 0
  br i1 %8663, label %8664, label %8667

8664:                                             ; preds = %8659
  %8665 = shl nuw nsw i64 %8660, 4
  %8666 = getelementptr inbounds i8, i8* %0, i64 %8665
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8666, i8 0, i64 16, i1 false)
  br label %8667

8667:                                             ; preds = %8664, %8659
  %8668 = add nuw nsw i64 %.01, 1083
  %8669 = call zeroext i8 @randombit()
  %8670 = getelementptr inbounds i8, i8* %1, i64 %8668
  store i8 %8669, i8* %8670, align 1
  %8671 = icmp eq i8 %8669, 0
  br i1 %8671, label %8672, label %8675

8672:                                             ; preds = %8667
  %8673 = shl nuw nsw i64 %8668, 4
  %8674 = getelementptr inbounds i8, i8* %0, i64 %8673
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8674, i8 0, i64 16, i1 false)
  br label %8675

8675:                                             ; preds = %8672, %8667
  %8676 = add nuw nsw i64 %.01, 1084
  %8677 = call zeroext i8 @randombit()
  %8678 = getelementptr inbounds i8, i8* %1, i64 %8676
  store i8 %8677, i8* %8678, align 1
  %8679 = icmp eq i8 %8677, 0
  br i1 %8679, label %8680, label %8683

8680:                                             ; preds = %8675
  %8681 = shl nuw nsw i64 %8676, 4
  %8682 = getelementptr inbounds i8, i8* %0, i64 %8681
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8682, i8 0, i64 16, i1 false)
  br label %8683

8683:                                             ; preds = %8680, %8675
  %8684 = add nuw nsw i64 %.01, 1085
  %8685 = call zeroext i8 @randombit()
  %8686 = getelementptr inbounds i8, i8* %1, i64 %8684
  store i8 %8685, i8* %8686, align 1
  %8687 = icmp eq i8 %8685, 0
  br i1 %8687, label %8688, label %8691

8688:                                             ; preds = %8683
  %8689 = shl nuw nsw i64 %8684, 4
  %8690 = getelementptr inbounds i8, i8* %0, i64 %8689
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8690, i8 0, i64 16, i1 false)
  br label %8691

8691:                                             ; preds = %8688, %8683
  %8692 = add nuw nsw i64 %.01, 1086
  %8693 = call zeroext i8 @randombit()
  %8694 = getelementptr inbounds i8, i8* %1, i64 %8692
  store i8 %8693, i8* %8694, align 1
  %8695 = icmp eq i8 %8693, 0
  br i1 %8695, label %8696, label %8699

8696:                                             ; preds = %8691
  %8697 = shl nuw nsw i64 %8692, 4
  %8698 = getelementptr inbounds i8, i8* %0, i64 %8697
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8698, i8 0, i64 16, i1 false)
  br label %8699

8699:                                             ; preds = %8696, %8691
  %8700 = add nuw nsw i64 %.01, 1087
  %8701 = call zeroext i8 @randombit()
  %8702 = getelementptr inbounds i8, i8* %1, i64 %8700
  store i8 %8701, i8* %8702, align 1
  %8703 = icmp eq i8 %8701, 0
  br i1 %8703, label %8704, label %8707

8704:                                             ; preds = %8699
  %8705 = shl nuw nsw i64 %8700, 4
  %8706 = getelementptr inbounds i8, i8* %0, i64 %8705
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8706, i8 0, i64 16, i1 false)
  br label %8707

8707:                                             ; preds = %8704, %8699
  %8708 = add nuw nsw i64 %.01, 1088
  %8709 = call zeroext i8 @randombit()
  %8710 = getelementptr inbounds i8, i8* %1, i64 %8708
  store i8 %8709, i8* %8710, align 1
  %8711 = icmp eq i8 %8709, 0
  br i1 %8711, label %8712, label %8715

8712:                                             ; preds = %8707
  %8713 = shl nuw nsw i64 %8708, 4
  %8714 = getelementptr inbounds i8, i8* %0, i64 %8713
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8714, i8 0, i64 16, i1 false)
  br label %8715

8715:                                             ; preds = %8712, %8707
  %8716 = add nuw nsw i64 %.01, 1089
  %8717 = call zeroext i8 @randombit()
  %8718 = getelementptr inbounds i8, i8* %1, i64 %8716
  store i8 %8717, i8* %8718, align 1
  %8719 = icmp eq i8 %8717, 0
  br i1 %8719, label %8720, label %8723

8720:                                             ; preds = %8715
  %8721 = shl nuw nsw i64 %8716, 4
  %8722 = getelementptr inbounds i8, i8* %0, i64 %8721
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8722, i8 0, i64 16, i1 false)
  br label %8723

8723:                                             ; preds = %8720, %8715
  %8724 = add nuw nsw i64 %.01, 1090
  %8725 = call zeroext i8 @randombit()
  %8726 = getelementptr inbounds i8, i8* %1, i64 %8724
  store i8 %8725, i8* %8726, align 1
  %8727 = icmp eq i8 %8725, 0
  br i1 %8727, label %8728, label %8731

8728:                                             ; preds = %8723
  %8729 = shl nuw nsw i64 %8724, 4
  %8730 = getelementptr inbounds i8, i8* %0, i64 %8729
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8730, i8 0, i64 16, i1 false)
  br label %8731

8731:                                             ; preds = %8728, %8723
  %8732 = add nuw nsw i64 %.01, 1091
  %8733 = call zeroext i8 @randombit()
  %8734 = getelementptr inbounds i8, i8* %1, i64 %8732
  store i8 %8733, i8* %8734, align 1
  %8735 = icmp eq i8 %8733, 0
  br i1 %8735, label %8736, label %8739

8736:                                             ; preds = %8731
  %8737 = shl nuw nsw i64 %8732, 4
  %8738 = getelementptr inbounds i8, i8* %0, i64 %8737
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8738, i8 0, i64 16, i1 false)
  br label %8739

8739:                                             ; preds = %8736, %8731
  %8740 = add nuw nsw i64 %.01, 1092
  %8741 = call zeroext i8 @randombit()
  %8742 = getelementptr inbounds i8, i8* %1, i64 %8740
  store i8 %8741, i8* %8742, align 1
  %8743 = icmp eq i8 %8741, 0
  br i1 %8743, label %8744, label %8747

8744:                                             ; preds = %8739
  %8745 = shl nuw nsw i64 %8740, 4
  %8746 = getelementptr inbounds i8, i8* %0, i64 %8745
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8746, i8 0, i64 16, i1 false)
  br label %8747

8747:                                             ; preds = %8744, %8739
  %8748 = add nuw nsw i64 %.01, 1093
  %8749 = call zeroext i8 @randombit()
  %8750 = getelementptr inbounds i8, i8* %1, i64 %8748
  store i8 %8749, i8* %8750, align 1
  %8751 = icmp eq i8 %8749, 0
  br i1 %8751, label %8752, label %8755

8752:                                             ; preds = %8747
  %8753 = shl nuw nsw i64 %8748, 4
  %8754 = getelementptr inbounds i8, i8* %0, i64 %8753
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8754, i8 0, i64 16, i1 false)
  br label %8755

8755:                                             ; preds = %8752, %8747
  %8756 = add nuw nsw i64 %.01, 1094
  %8757 = call zeroext i8 @randombit()
  %8758 = getelementptr inbounds i8, i8* %1, i64 %8756
  store i8 %8757, i8* %8758, align 1
  %8759 = icmp eq i8 %8757, 0
  br i1 %8759, label %8760, label %8763

8760:                                             ; preds = %8755
  %8761 = shl nuw nsw i64 %8756, 4
  %8762 = getelementptr inbounds i8, i8* %0, i64 %8761
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8762, i8 0, i64 16, i1 false)
  br label %8763

8763:                                             ; preds = %8760, %8755
  %8764 = add nuw nsw i64 %.01, 1095
  %8765 = call zeroext i8 @randombit()
  %8766 = getelementptr inbounds i8, i8* %1, i64 %8764
  store i8 %8765, i8* %8766, align 1
  %8767 = icmp eq i8 %8765, 0
  br i1 %8767, label %8768, label %8771

8768:                                             ; preds = %8763
  %8769 = shl nuw nsw i64 %8764, 4
  %8770 = getelementptr inbounds i8, i8* %0, i64 %8769
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8770, i8 0, i64 16, i1 false)
  br label %8771

8771:                                             ; preds = %8768, %8763
  %8772 = add nuw nsw i64 %.01, 1096
  %8773 = call zeroext i8 @randombit()
  %8774 = getelementptr inbounds i8, i8* %1, i64 %8772
  store i8 %8773, i8* %8774, align 1
  %8775 = icmp eq i8 %8773, 0
  br i1 %8775, label %8776, label %8779

8776:                                             ; preds = %8771
  %8777 = shl nuw nsw i64 %8772, 4
  %8778 = getelementptr inbounds i8, i8* %0, i64 %8777
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8778, i8 0, i64 16, i1 false)
  br label %8779

8779:                                             ; preds = %8776, %8771
  %8780 = add nuw nsw i64 %.01, 1097
  %8781 = call zeroext i8 @randombit()
  %8782 = getelementptr inbounds i8, i8* %1, i64 %8780
  store i8 %8781, i8* %8782, align 1
  %8783 = icmp eq i8 %8781, 0
  br i1 %8783, label %8784, label %8787

8784:                                             ; preds = %8779
  %8785 = shl nuw nsw i64 %8780, 4
  %8786 = getelementptr inbounds i8, i8* %0, i64 %8785
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8786, i8 0, i64 16, i1 false)
  br label %8787

8787:                                             ; preds = %8784, %8779
  %8788 = add nuw nsw i64 %.01, 1098
  %8789 = call zeroext i8 @randombit()
  %8790 = getelementptr inbounds i8, i8* %1, i64 %8788
  store i8 %8789, i8* %8790, align 1
  %8791 = icmp eq i8 %8789, 0
  br i1 %8791, label %8792, label %8795

8792:                                             ; preds = %8787
  %8793 = shl nuw nsw i64 %8788, 4
  %8794 = getelementptr inbounds i8, i8* %0, i64 %8793
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8794, i8 0, i64 16, i1 false)
  br label %8795

8795:                                             ; preds = %8792, %8787
  %8796 = add nuw nsw i64 %.01, 1099
  %8797 = call zeroext i8 @randombit()
  %8798 = getelementptr inbounds i8, i8* %1, i64 %8796
  store i8 %8797, i8* %8798, align 1
  %8799 = icmp eq i8 %8797, 0
  br i1 %8799, label %8800, label %8803

8800:                                             ; preds = %8795
  %8801 = shl nuw nsw i64 %8796, 4
  %8802 = getelementptr inbounds i8, i8* %0, i64 %8801
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8802, i8 0, i64 16, i1 false)
  br label %8803

8803:                                             ; preds = %8800, %8795
  %8804 = add nuw nsw i64 %.01, 1100
  %8805 = call zeroext i8 @randombit()
  %8806 = getelementptr inbounds i8, i8* %1, i64 %8804
  store i8 %8805, i8* %8806, align 1
  %8807 = icmp eq i8 %8805, 0
  br i1 %8807, label %8808, label %8811

8808:                                             ; preds = %8803
  %8809 = shl nuw nsw i64 %8804, 4
  %8810 = getelementptr inbounds i8, i8* %0, i64 %8809
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8810, i8 0, i64 16, i1 false)
  br label %8811

8811:                                             ; preds = %8808, %8803
  %8812 = add nuw nsw i64 %.01, 1101
  %8813 = call zeroext i8 @randombit()
  %8814 = getelementptr inbounds i8, i8* %1, i64 %8812
  store i8 %8813, i8* %8814, align 1
  %8815 = icmp eq i8 %8813, 0
  br i1 %8815, label %8816, label %8819

8816:                                             ; preds = %8811
  %8817 = shl nuw nsw i64 %8812, 4
  %8818 = getelementptr inbounds i8, i8* %0, i64 %8817
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8818, i8 0, i64 16, i1 false)
  br label %8819

8819:                                             ; preds = %8816, %8811
  %8820 = add nuw nsw i64 %.01, 1102
  %8821 = call zeroext i8 @randombit()
  %8822 = getelementptr inbounds i8, i8* %1, i64 %8820
  store i8 %8821, i8* %8822, align 1
  %8823 = icmp eq i8 %8821, 0
  br i1 %8823, label %8824, label %8827

8824:                                             ; preds = %8819
  %8825 = shl nuw nsw i64 %8820, 4
  %8826 = getelementptr inbounds i8, i8* %0, i64 %8825
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8826, i8 0, i64 16, i1 false)
  br label %8827

8827:                                             ; preds = %8824, %8819
  %8828 = add nuw nsw i64 %.01, 1103
  %8829 = call zeroext i8 @randombit()
  %8830 = getelementptr inbounds i8, i8* %1, i64 %8828
  store i8 %8829, i8* %8830, align 1
  %8831 = icmp eq i8 %8829, 0
  br i1 %8831, label %8832, label %8835

8832:                                             ; preds = %8827
  %8833 = shl nuw nsw i64 %8828, 4
  %8834 = getelementptr inbounds i8, i8* %0, i64 %8833
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8834, i8 0, i64 16, i1 false)
  br label %8835

8835:                                             ; preds = %8832, %8827
  %8836 = add nuw nsw i64 %.01, 1104
  %8837 = call zeroext i8 @randombit()
  %8838 = getelementptr inbounds i8, i8* %1, i64 %8836
  store i8 %8837, i8* %8838, align 1
  %8839 = icmp eq i8 %8837, 0
  br i1 %8839, label %8840, label %8843

8840:                                             ; preds = %8835
  %8841 = shl nuw nsw i64 %8836, 4
  %8842 = getelementptr inbounds i8, i8* %0, i64 %8841
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8842, i8 0, i64 16, i1 false)
  br label %8843

8843:                                             ; preds = %8840, %8835
  %8844 = add nuw nsw i64 %.01, 1105
  %8845 = call zeroext i8 @randombit()
  %8846 = getelementptr inbounds i8, i8* %1, i64 %8844
  store i8 %8845, i8* %8846, align 1
  %8847 = icmp eq i8 %8845, 0
  br i1 %8847, label %8848, label %8851

8848:                                             ; preds = %8843
  %8849 = shl nuw nsw i64 %8844, 4
  %8850 = getelementptr inbounds i8, i8* %0, i64 %8849
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8850, i8 0, i64 16, i1 false)
  br label %8851

8851:                                             ; preds = %8848, %8843
  %8852 = add nuw nsw i64 %.01, 1106
  %8853 = call zeroext i8 @randombit()
  %8854 = getelementptr inbounds i8, i8* %1, i64 %8852
  store i8 %8853, i8* %8854, align 1
  %8855 = icmp eq i8 %8853, 0
  br i1 %8855, label %8856, label %8859

8856:                                             ; preds = %8851
  %8857 = shl nuw nsw i64 %8852, 4
  %8858 = getelementptr inbounds i8, i8* %0, i64 %8857
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8858, i8 0, i64 16, i1 false)
  br label %8859

8859:                                             ; preds = %8856, %8851
  %8860 = add nuw nsw i64 %.01, 1107
  %8861 = call zeroext i8 @randombit()
  %8862 = getelementptr inbounds i8, i8* %1, i64 %8860
  store i8 %8861, i8* %8862, align 1
  %8863 = icmp eq i8 %8861, 0
  br i1 %8863, label %8864, label %8867

8864:                                             ; preds = %8859
  %8865 = shl nuw nsw i64 %8860, 4
  %8866 = getelementptr inbounds i8, i8* %0, i64 %8865
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8866, i8 0, i64 16, i1 false)
  br label %8867

8867:                                             ; preds = %8864, %8859
  %8868 = add nuw nsw i64 %.01, 1108
  %8869 = call zeroext i8 @randombit()
  %8870 = getelementptr inbounds i8, i8* %1, i64 %8868
  store i8 %8869, i8* %8870, align 1
  %8871 = icmp eq i8 %8869, 0
  br i1 %8871, label %8872, label %8875

8872:                                             ; preds = %8867
  %8873 = shl nuw nsw i64 %8868, 4
  %8874 = getelementptr inbounds i8, i8* %0, i64 %8873
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8874, i8 0, i64 16, i1 false)
  br label %8875

8875:                                             ; preds = %8872, %8867
  %8876 = add nuw nsw i64 %.01, 1109
  %8877 = call zeroext i8 @randombit()
  %8878 = getelementptr inbounds i8, i8* %1, i64 %8876
  store i8 %8877, i8* %8878, align 1
  %8879 = icmp eq i8 %8877, 0
  br i1 %8879, label %8880, label %8883

8880:                                             ; preds = %8875
  %8881 = shl nuw nsw i64 %8876, 4
  %8882 = getelementptr inbounds i8, i8* %0, i64 %8881
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8882, i8 0, i64 16, i1 false)
  br label %8883

8883:                                             ; preds = %8880, %8875
  %8884 = add nuw nsw i64 %.01, 1110
  %8885 = call zeroext i8 @randombit()
  %8886 = getelementptr inbounds i8, i8* %1, i64 %8884
  store i8 %8885, i8* %8886, align 1
  %8887 = icmp eq i8 %8885, 0
  br i1 %8887, label %8888, label %8891

8888:                                             ; preds = %8883
  %8889 = shl nuw nsw i64 %8884, 4
  %8890 = getelementptr inbounds i8, i8* %0, i64 %8889
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8890, i8 0, i64 16, i1 false)
  br label %8891

8891:                                             ; preds = %8888, %8883
  %8892 = add nuw nsw i64 %.01, 1111
  %8893 = call zeroext i8 @randombit()
  %8894 = getelementptr inbounds i8, i8* %1, i64 %8892
  store i8 %8893, i8* %8894, align 1
  %8895 = icmp eq i8 %8893, 0
  br i1 %8895, label %8896, label %8899

8896:                                             ; preds = %8891
  %8897 = shl nuw nsw i64 %8892, 4
  %8898 = getelementptr inbounds i8, i8* %0, i64 %8897
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8898, i8 0, i64 16, i1 false)
  br label %8899

8899:                                             ; preds = %8896, %8891
  %8900 = add nuw nsw i64 %.01, 1112
  %8901 = call zeroext i8 @randombit()
  %8902 = getelementptr inbounds i8, i8* %1, i64 %8900
  store i8 %8901, i8* %8902, align 1
  %8903 = icmp eq i8 %8901, 0
  br i1 %8903, label %8904, label %8907

8904:                                             ; preds = %8899
  %8905 = shl nuw nsw i64 %8900, 4
  %8906 = getelementptr inbounds i8, i8* %0, i64 %8905
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8906, i8 0, i64 16, i1 false)
  br label %8907

8907:                                             ; preds = %8904, %8899
  %8908 = add nuw nsw i64 %.01, 1113
  %8909 = call zeroext i8 @randombit()
  %8910 = getelementptr inbounds i8, i8* %1, i64 %8908
  store i8 %8909, i8* %8910, align 1
  %8911 = icmp eq i8 %8909, 0
  br i1 %8911, label %8912, label %8915

8912:                                             ; preds = %8907
  %8913 = shl nuw nsw i64 %8908, 4
  %8914 = getelementptr inbounds i8, i8* %0, i64 %8913
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8914, i8 0, i64 16, i1 false)
  br label %8915

8915:                                             ; preds = %8912, %8907
  %8916 = add nuw nsw i64 %.01, 1114
  %8917 = call zeroext i8 @randombit()
  %8918 = getelementptr inbounds i8, i8* %1, i64 %8916
  store i8 %8917, i8* %8918, align 1
  %8919 = icmp eq i8 %8917, 0
  br i1 %8919, label %8920, label %8923

8920:                                             ; preds = %8915
  %8921 = shl nuw nsw i64 %8916, 4
  %8922 = getelementptr inbounds i8, i8* %0, i64 %8921
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8922, i8 0, i64 16, i1 false)
  br label %8923

8923:                                             ; preds = %8920, %8915
  %8924 = add nuw nsw i64 %.01, 1115
  %8925 = call zeroext i8 @randombit()
  %8926 = getelementptr inbounds i8, i8* %1, i64 %8924
  store i8 %8925, i8* %8926, align 1
  %8927 = icmp eq i8 %8925, 0
  br i1 %8927, label %8928, label %8931

8928:                                             ; preds = %8923
  %8929 = shl nuw nsw i64 %8924, 4
  %8930 = getelementptr inbounds i8, i8* %0, i64 %8929
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8930, i8 0, i64 16, i1 false)
  br label %8931

8931:                                             ; preds = %8928, %8923
  %8932 = add nuw nsw i64 %.01, 1116
  %8933 = call zeroext i8 @randombit()
  %8934 = getelementptr inbounds i8, i8* %1, i64 %8932
  store i8 %8933, i8* %8934, align 1
  %8935 = icmp eq i8 %8933, 0
  br i1 %8935, label %8936, label %8939

8936:                                             ; preds = %8931
  %8937 = shl nuw nsw i64 %8932, 4
  %8938 = getelementptr inbounds i8, i8* %0, i64 %8937
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8938, i8 0, i64 16, i1 false)
  br label %8939

8939:                                             ; preds = %8936, %8931
  %8940 = add nuw nsw i64 %.01, 1117
  %8941 = call zeroext i8 @randombit()
  %8942 = getelementptr inbounds i8, i8* %1, i64 %8940
  store i8 %8941, i8* %8942, align 1
  %8943 = icmp eq i8 %8941, 0
  br i1 %8943, label %8944, label %8947

8944:                                             ; preds = %8939
  %8945 = shl nuw nsw i64 %8940, 4
  %8946 = getelementptr inbounds i8, i8* %0, i64 %8945
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8946, i8 0, i64 16, i1 false)
  br label %8947

8947:                                             ; preds = %8944, %8939
  %8948 = add nuw nsw i64 %.01, 1118
  %8949 = call zeroext i8 @randombit()
  %8950 = getelementptr inbounds i8, i8* %1, i64 %8948
  store i8 %8949, i8* %8950, align 1
  %8951 = icmp eq i8 %8949, 0
  br i1 %8951, label %8952, label %8955

8952:                                             ; preds = %8947
  %8953 = shl nuw nsw i64 %8948, 4
  %8954 = getelementptr inbounds i8, i8* %0, i64 %8953
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8954, i8 0, i64 16, i1 false)
  br label %8955

8955:                                             ; preds = %8952, %8947
  %8956 = add nuw nsw i64 %.01, 1119
  %8957 = call zeroext i8 @randombit()
  %8958 = getelementptr inbounds i8, i8* %1, i64 %8956
  store i8 %8957, i8* %8958, align 1
  %8959 = icmp eq i8 %8957, 0
  br i1 %8959, label %8960, label %8963

8960:                                             ; preds = %8955
  %8961 = shl nuw nsw i64 %8956, 4
  %8962 = getelementptr inbounds i8, i8* %0, i64 %8961
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8962, i8 0, i64 16, i1 false)
  br label %8963

8963:                                             ; preds = %8960, %8955
  %8964 = add nuw nsw i64 %.01, 1120
  %8965 = call zeroext i8 @randombit()
  %8966 = getelementptr inbounds i8, i8* %1, i64 %8964
  store i8 %8965, i8* %8966, align 1
  %8967 = icmp eq i8 %8965, 0
  br i1 %8967, label %8968, label %8971

8968:                                             ; preds = %8963
  %8969 = shl nuw nsw i64 %8964, 4
  %8970 = getelementptr inbounds i8, i8* %0, i64 %8969
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8970, i8 0, i64 16, i1 false)
  br label %8971

8971:                                             ; preds = %8968, %8963
  %8972 = add nuw nsw i64 %.01, 1121
  %8973 = call zeroext i8 @randombit()
  %8974 = getelementptr inbounds i8, i8* %1, i64 %8972
  store i8 %8973, i8* %8974, align 1
  %8975 = icmp eq i8 %8973, 0
  br i1 %8975, label %8976, label %8979

8976:                                             ; preds = %8971
  %8977 = shl nuw nsw i64 %8972, 4
  %8978 = getelementptr inbounds i8, i8* %0, i64 %8977
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8978, i8 0, i64 16, i1 false)
  br label %8979

8979:                                             ; preds = %8976, %8971
  %8980 = add nuw nsw i64 %.01, 1122
  %8981 = call zeroext i8 @randombit()
  %8982 = getelementptr inbounds i8, i8* %1, i64 %8980
  store i8 %8981, i8* %8982, align 1
  %8983 = icmp eq i8 %8981, 0
  br i1 %8983, label %8984, label %8987

8984:                                             ; preds = %8979
  %8985 = shl nuw nsw i64 %8980, 4
  %8986 = getelementptr inbounds i8, i8* %0, i64 %8985
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8986, i8 0, i64 16, i1 false)
  br label %8987

8987:                                             ; preds = %8984, %8979
  %8988 = add nuw nsw i64 %.01, 1123
  %8989 = call zeroext i8 @randombit()
  %8990 = getelementptr inbounds i8, i8* %1, i64 %8988
  store i8 %8989, i8* %8990, align 1
  %8991 = icmp eq i8 %8989, 0
  br i1 %8991, label %8992, label %8995

8992:                                             ; preds = %8987
  %8993 = shl nuw nsw i64 %8988, 4
  %8994 = getelementptr inbounds i8, i8* %0, i64 %8993
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %8994, i8 0, i64 16, i1 false)
  br label %8995

8995:                                             ; preds = %8992, %8987
  %8996 = add nuw nsw i64 %.01, 1124
  %8997 = call zeroext i8 @randombit()
  %8998 = getelementptr inbounds i8, i8* %1, i64 %8996
  store i8 %8997, i8* %8998, align 1
  %8999 = icmp eq i8 %8997, 0
  br i1 %8999, label %9000, label %9003

9000:                                             ; preds = %8995
  %9001 = shl nuw nsw i64 %8996, 4
  %9002 = getelementptr inbounds i8, i8* %0, i64 %9001
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9002, i8 0, i64 16, i1 false)
  br label %9003

9003:                                             ; preds = %9000, %8995
  %9004 = add nuw nsw i64 %.01, 1125
  %9005 = call zeroext i8 @randombit()
  %9006 = getelementptr inbounds i8, i8* %1, i64 %9004
  store i8 %9005, i8* %9006, align 1
  %9007 = icmp eq i8 %9005, 0
  br i1 %9007, label %9008, label %9011

9008:                                             ; preds = %9003
  %9009 = shl nuw nsw i64 %9004, 4
  %9010 = getelementptr inbounds i8, i8* %0, i64 %9009
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9010, i8 0, i64 16, i1 false)
  br label %9011

9011:                                             ; preds = %9008, %9003
  %9012 = add nuw nsw i64 %.01, 1126
  %9013 = call zeroext i8 @randombit()
  %9014 = getelementptr inbounds i8, i8* %1, i64 %9012
  store i8 %9013, i8* %9014, align 1
  %9015 = icmp eq i8 %9013, 0
  br i1 %9015, label %9016, label %9019

9016:                                             ; preds = %9011
  %9017 = shl nuw nsw i64 %9012, 4
  %9018 = getelementptr inbounds i8, i8* %0, i64 %9017
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9018, i8 0, i64 16, i1 false)
  br label %9019

9019:                                             ; preds = %9016, %9011
  %9020 = add nuw nsw i64 %.01, 1127
  %9021 = call zeroext i8 @randombit()
  %9022 = getelementptr inbounds i8, i8* %1, i64 %9020
  store i8 %9021, i8* %9022, align 1
  %9023 = icmp eq i8 %9021, 0
  br i1 %9023, label %9024, label %9027

9024:                                             ; preds = %9019
  %9025 = shl nuw nsw i64 %9020, 4
  %9026 = getelementptr inbounds i8, i8* %0, i64 %9025
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9026, i8 0, i64 16, i1 false)
  br label %9027

9027:                                             ; preds = %9024, %9019
  %9028 = add nuw nsw i64 %.01, 1128
  %9029 = call zeroext i8 @randombit()
  %9030 = getelementptr inbounds i8, i8* %1, i64 %9028
  store i8 %9029, i8* %9030, align 1
  %9031 = icmp eq i8 %9029, 0
  br i1 %9031, label %9032, label %9035

9032:                                             ; preds = %9027
  %9033 = shl nuw nsw i64 %9028, 4
  %9034 = getelementptr inbounds i8, i8* %0, i64 %9033
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9034, i8 0, i64 16, i1 false)
  br label %9035

9035:                                             ; preds = %9032, %9027
  %9036 = add nuw nsw i64 %.01, 1129
  %9037 = call zeroext i8 @randombit()
  %9038 = getelementptr inbounds i8, i8* %1, i64 %9036
  store i8 %9037, i8* %9038, align 1
  %9039 = icmp eq i8 %9037, 0
  br i1 %9039, label %9040, label %9043

9040:                                             ; preds = %9035
  %9041 = shl nuw nsw i64 %9036, 4
  %9042 = getelementptr inbounds i8, i8* %0, i64 %9041
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9042, i8 0, i64 16, i1 false)
  br label %9043

9043:                                             ; preds = %9040, %9035
  %9044 = add nuw nsw i64 %.01, 1130
  %9045 = call zeroext i8 @randombit()
  %9046 = getelementptr inbounds i8, i8* %1, i64 %9044
  store i8 %9045, i8* %9046, align 1
  %9047 = icmp eq i8 %9045, 0
  br i1 %9047, label %9048, label %9051

9048:                                             ; preds = %9043
  %9049 = shl nuw nsw i64 %9044, 4
  %9050 = getelementptr inbounds i8, i8* %0, i64 %9049
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9050, i8 0, i64 16, i1 false)
  br label %9051

9051:                                             ; preds = %9048, %9043
  %9052 = add nuw nsw i64 %.01, 1131
  %9053 = call zeroext i8 @randombit()
  %9054 = getelementptr inbounds i8, i8* %1, i64 %9052
  store i8 %9053, i8* %9054, align 1
  %9055 = icmp eq i8 %9053, 0
  br i1 %9055, label %9056, label %9059

9056:                                             ; preds = %9051
  %9057 = shl nuw nsw i64 %9052, 4
  %9058 = getelementptr inbounds i8, i8* %0, i64 %9057
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9058, i8 0, i64 16, i1 false)
  br label %9059

9059:                                             ; preds = %9056, %9051
  %9060 = add nuw nsw i64 %.01, 1132
  %9061 = call zeroext i8 @randombit()
  %9062 = getelementptr inbounds i8, i8* %1, i64 %9060
  store i8 %9061, i8* %9062, align 1
  %9063 = icmp eq i8 %9061, 0
  br i1 %9063, label %9064, label %9067

9064:                                             ; preds = %9059
  %9065 = shl nuw nsw i64 %9060, 4
  %9066 = getelementptr inbounds i8, i8* %0, i64 %9065
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9066, i8 0, i64 16, i1 false)
  br label %9067

9067:                                             ; preds = %9064, %9059
  %9068 = add nuw nsw i64 %.01, 1133
  %9069 = call zeroext i8 @randombit()
  %9070 = getelementptr inbounds i8, i8* %1, i64 %9068
  store i8 %9069, i8* %9070, align 1
  %9071 = icmp eq i8 %9069, 0
  br i1 %9071, label %9072, label %9075

9072:                                             ; preds = %9067
  %9073 = shl nuw nsw i64 %9068, 4
  %9074 = getelementptr inbounds i8, i8* %0, i64 %9073
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9074, i8 0, i64 16, i1 false)
  br label %9075

9075:                                             ; preds = %9072, %9067
  %9076 = add nuw nsw i64 %.01, 1134
  %9077 = call zeroext i8 @randombit()
  %9078 = getelementptr inbounds i8, i8* %1, i64 %9076
  store i8 %9077, i8* %9078, align 1
  %9079 = icmp eq i8 %9077, 0
  br i1 %9079, label %9080, label %9083

9080:                                             ; preds = %9075
  %9081 = shl nuw nsw i64 %9076, 4
  %9082 = getelementptr inbounds i8, i8* %0, i64 %9081
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9082, i8 0, i64 16, i1 false)
  br label %9083

9083:                                             ; preds = %9080, %9075
  %9084 = add nuw nsw i64 %.01, 1135
  %9085 = call zeroext i8 @randombit()
  %9086 = getelementptr inbounds i8, i8* %1, i64 %9084
  store i8 %9085, i8* %9086, align 1
  %9087 = icmp eq i8 %9085, 0
  br i1 %9087, label %9088, label %9091

9088:                                             ; preds = %9083
  %9089 = shl nuw nsw i64 %9084, 4
  %9090 = getelementptr inbounds i8, i8* %0, i64 %9089
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9090, i8 0, i64 16, i1 false)
  br label %9091

9091:                                             ; preds = %9088, %9083
  %9092 = add nuw nsw i64 %.01, 1136
  %9093 = call zeroext i8 @randombit()
  %9094 = getelementptr inbounds i8, i8* %1, i64 %9092
  store i8 %9093, i8* %9094, align 1
  %9095 = icmp eq i8 %9093, 0
  br i1 %9095, label %9096, label %9099

9096:                                             ; preds = %9091
  %9097 = shl nuw nsw i64 %9092, 4
  %9098 = getelementptr inbounds i8, i8* %0, i64 %9097
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9098, i8 0, i64 16, i1 false)
  br label %9099

9099:                                             ; preds = %9096, %9091
  %9100 = add nuw nsw i64 %.01, 1137
  %9101 = call zeroext i8 @randombit()
  %9102 = getelementptr inbounds i8, i8* %1, i64 %9100
  store i8 %9101, i8* %9102, align 1
  %9103 = icmp eq i8 %9101, 0
  br i1 %9103, label %9104, label %9107

9104:                                             ; preds = %9099
  %9105 = shl nuw nsw i64 %9100, 4
  %9106 = getelementptr inbounds i8, i8* %0, i64 %9105
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9106, i8 0, i64 16, i1 false)
  br label %9107

9107:                                             ; preds = %9104, %9099
  %9108 = add nuw nsw i64 %.01, 1138
  %9109 = call zeroext i8 @randombit()
  %9110 = getelementptr inbounds i8, i8* %1, i64 %9108
  store i8 %9109, i8* %9110, align 1
  %9111 = icmp eq i8 %9109, 0
  br i1 %9111, label %9112, label %9115

9112:                                             ; preds = %9107
  %9113 = shl nuw nsw i64 %9108, 4
  %9114 = getelementptr inbounds i8, i8* %0, i64 %9113
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9114, i8 0, i64 16, i1 false)
  br label %9115

9115:                                             ; preds = %9112, %9107
  %9116 = add nuw nsw i64 %.01, 1139
  %9117 = call zeroext i8 @randombit()
  %9118 = getelementptr inbounds i8, i8* %1, i64 %9116
  store i8 %9117, i8* %9118, align 1
  %9119 = icmp eq i8 %9117, 0
  br i1 %9119, label %9120, label %9123

9120:                                             ; preds = %9115
  %9121 = shl nuw nsw i64 %9116, 4
  %9122 = getelementptr inbounds i8, i8* %0, i64 %9121
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9122, i8 0, i64 16, i1 false)
  br label %9123

9123:                                             ; preds = %9120, %9115
  %9124 = add nuw nsw i64 %.01, 1140
  %9125 = call zeroext i8 @randombit()
  %9126 = getelementptr inbounds i8, i8* %1, i64 %9124
  store i8 %9125, i8* %9126, align 1
  %9127 = icmp eq i8 %9125, 0
  br i1 %9127, label %9128, label %9131

9128:                                             ; preds = %9123
  %9129 = shl nuw nsw i64 %9124, 4
  %9130 = getelementptr inbounds i8, i8* %0, i64 %9129
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9130, i8 0, i64 16, i1 false)
  br label %9131

9131:                                             ; preds = %9128, %9123
  %9132 = add nuw nsw i64 %.01, 1141
  %9133 = call zeroext i8 @randombit()
  %9134 = getelementptr inbounds i8, i8* %1, i64 %9132
  store i8 %9133, i8* %9134, align 1
  %9135 = icmp eq i8 %9133, 0
  br i1 %9135, label %9136, label %9139

9136:                                             ; preds = %9131
  %9137 = shl nuw nsw i64 %9132, 4
  %9138 = getelementptr inbounds i8, i8* %0, i64 %9137
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9138, i8 0, i64 16, i1 false)
  br label %9139

9139:                                             ; preds = %9136, %9131
  %9140 = add nuw nsw i64 %.01, 1142
  %9141 = call zeroext i8 @randombit()
  %9142 = getelementptr inbounds i8, i8* %1, i64 %9140
  store i8 %9141, i8* %9142, align 1
  %9143 = icmp eq i8 %9141, 0
  br i1 %9143, label %9144, label %9147

9144:                                             ; preds = %9139
  %9145 = shl nuw nsw i64 %9140, 4
  %9146 = getelementptr inbounds i8, i8* %0, i64 %9145
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9146, i8 0, i64 16, i1 false)
  br label %9147

9147:                                             ; preds = %9144, %9139
  %9148 = add nuw nsw i64 %.01, 1143
  %9149 = call zeroext i8 @randombit()
  %9150 = getelementptr inbounds i8, i8* %1, i64 %9148
  store i8 %9149, i8* %9150, align 1
  %9151 = icmp eq i8 %9149, 0
  br i1 %9151, label %9152, label %9155

9152:                                             ; preds = %9147
  %9153 = shl nuw nsw i64 %9148, 4
  %9154 = getelementptr inbounds i8, i8* %0, i64 %9153
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9154, i8 0, i64 16, i1 false)
  br label %9155

9155:                                             ; preds = %9152, %9147
  %9156 = add nuw nsw i64 %.01, 1144
  %9157 = call zeroext i8 @randombit()
  %9158 = getelementptr inbounds i8, i8* %1, i64 %9156
  store i8 %9157, i8* %9158, align 1
  %9159 = icmp eq i8 %9157, 0
  br i1 %9159, label %9160, label %9163

9160:                                             ; preds = %9155
  %9161 = shl nuw nsw i64 %9156, 4
  %9162 = getelementptr inbounds i8, i8* %0, i64 %9161
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9162, i8 0, i64 16, i1 false)
  br label %9163

9163:                                             ; preds = %9160, %9155
  %9164 = add nuw nsw i64 %.01, 1145
  %9165 = call zeroext i8 @randombit()
  %9166 = getelementptr inbounds i8, i8* %1, i64 %9164
  store i8 %9165, i8* %9166, align 1
  %9167 = icmp eq i8 %9165, 0
  br i1 %9167, label %9168, label %9171

9168:                                             ; preds = %9163
  %9169 = shl nuw nsw i64 %9164, 4
  %9170 = getelementptr inbounds i8, i8* %0, i64 %9169
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9170, i8 0, i64 16, i1 false)
  br label %9171

9171:                                             ; preds = %9168, %9163
  %9172 = add nuw nsw i64 %.01, 1146
  %9173 = call zeroext i8 @randombit()
  %9174 = getelementptr inbounds i8, i8* %1, i64 %9172
  store i8 %9173, i8* %9174, align 1
  %9175 = icmp eq i8 %9173, 0
  br i1 %9175, label %9176, label %9179

9176:                                             ; preds = %9171
  %9177 = shl nuw nsw i64 %9172, 4
  %9178 = getelementptr inbounds i8, i8* %0, i64 %9177
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9178, i8 0, i64 16, i1 false)
  br label %9179

9179:                                             ; preds = %9176, %9171
  %9180 = add nuw nsw i64 %.01, 1147
  %9181 = call zeroext i8 @randombit()
  %9182 = getelementptr inbounds i8, i8* %1, i64 %9180
  store i8 %9181, i8* %9182, align 1
  %9183 = icmp eq i8 %9181, 0
  br i1 %9183, label %9184, label %9187

9184:                                             ; preds = %9179
  %9185 = shl nuw nsw i64 %9180, 4
  %9186 = getelementptr inbounds i8, i8* %0, i64 %9185
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9186, i8 0, i64 16, i1 false)
  br label %9187

9187:                                             ; preds = %9184, %9179
  %9188 = add nuw nsw i64 %.01, 1148
  %9189 = call zeroext i8 @randombit()
  %9190 = getelementptr inbounds i8, i8* %1, i64 %9188
  store i8 %9189, i8* %9190, align 1
  %9191 = icmp eq i8 %9189, 0
  br i1 %9191, label %9192, label %9195

9192:                                             ; preds = %9187
  %9193 = shl nuw nsw i64 %9188, 4
  %9194 = getelementptr inbounds i8, i8* %0, i64 %9193
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9194, i8 0, i64 16, i1 false)
  br label %9195

9195:                                             ; preds = %9192, %9187
  %9196 = add nuw nsw i64 %.01, 1149
  %9197 = call zeroext i8 @randombit()
  %9198 = getelementptr inbounds i8, i8* %1, i64 %9196
  store i8 %9197, i8* %9198, align 1
  %9199 = icmp eq i8 %9197, 0
  br i1 %9199, label %9200, label %9203

9200:                                             ; preds = %9195
  %9201 = shl nuw nsw i64 %9196, 4
  %9202 = getelementptr inbounds i8, i8* %0, i64 %9201
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9202, i8 0, i64 16, i1 false)
  br label %9203

9203:                                             ; preds = %9200, %9195
  %9204 = add nuw nsw i64 %.01, 1150
  %9205 = call zeroext i8 @randombit()
  %9206 = getelementptr inbounds i8, i8* %1, i64 %9204
  store i8 %9205, i8* %9206, align 1
  %9207 = icmp eq i8 %9205, 0
  br i1 %9207, label %9208, label %9211

9208:                                             ; preds = %9203
  %9209 = shl nuw nsw i64 %9204, 4
  %9210 = getelementptr inbounds i8, i8* %0, i64 %9209
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9210, i8 0, i64 16, i1 false)
  br label %9211

9211:                                             ; preds = %9208, %9203
  %9212 = add nuw nsw i64 %.01, 1151
  %9213 = call zeroext i8 @randombit()
  %9214 = getelementptr inbounds i8, i8* %1, i64 %9212
  store i8 %9213, i8* %9214, align 1
  %9215 = icmp eq i8 %9213, 0
  br i1 %9215, label %9216, label %9219

9216:                                             ; preds = %9211
  %9217 = shl nuw nsw i64 %9212, 4
  %9218 = getelementptr inbounds i8, i8* %0, i64 %9217
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9218, i8 0, i64 16, i1 false)
  br label %9219

9219:                                             ; preds = %9216, %9211
  %9220 = add nuw nsw i64 %.01, 1152
  %9221 = call zeroext i8 @randombit()
  %9222 = getelementptr inbounds i8, i8* %1, i64 %9220
  store i8 %9221, i8* %9222, align 1
  %9223 = icmp eq i8 %9221, 0
  br i1 %9223, label %9224, label %9227

9224:                                             ; preds = %9219
  %9225 = shl nuw nsw i64 %9220, 4
  %9226 = getelementptr inbounds i8, i8* %0, i64 %9225
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9226, i8 0, i64 16, i1 false)
  br label %9227

9227:                                             ; preds = %9224, %9219
  %9228 = add nuw nsw i64 %.01, 1153
  %9229 = call zeroext i8 @randombit()
  %9230 = getelementptr inbounds i8, i8* %1, i64 %9228
  store i8 %9229, i8* %9230, align 1
  %9231 = icmp eq i8 %9229, 0
  br i1 %9231, label %9232, label %9235

9232:                                             ; preds = %9227
  %9233 = shl nuw nsw i64 %9228, 4
  %9234 = getelementptr inbounds i8, i8* %0, i64 %9233
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9234, i8 0, i64 16, i1 false)
  br label %9235

9235:                                             ; preds = %9232, %9227
  %9236 = add nuw nsw i64 %.01, 1154
  %9237 = call zeroext i8 @randombit()
  %9238 = getelementptr inbounds i8, i8* %1, i64 %9236
  store i8 %9237, i8* %9238, align 1
  %9239 = icmp eq i8 %9237, 0
  br i1 %9239, label %9240, label %9243

9240:                                             ; preds = %9235
  %9241 = shl nuw nsw i64 %9236, 4
  %9242 = getelementptr inbounds i8, i8* %0, i64 %9241
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9242, i8 0, i64 16, i1 false)
  br label %9243

9243:                                             ; preds = %9240, %9235
  %9244 = add nuw nsw i64 %.01, 1155
  %9245 = call zeroext i8 @randombit()
  %9246 = getelementptr inbounds i8, i8* %1, i64 %9244
  store i8 %9245, i8* %9246, align 1
  %9247 = icmp eq i8 %9245, 0
  br i1 %9247, label %9248, label %9251

9248:                                             ; preds = %9243
  %9249 = shl nuw nsw i64 %9244, 4
  %9250 = getelementptr inbounds i8, i8* %0, i64 %9249
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9250, i8 0, i64 16, i1 false)
  br label %9251

9251:                                             ; preds = %9248, %9243
  %9252 = add nuw nsw i64 %.01, 1156
  %9253 = call zeroext i8 @randombit()
  %9254 = getelementptr inbounds i8, i8* %1, i64 %9252
  store i8 %9253, i8* %9254, align 1
  %9255 = icmp eq i8 %9253, 0
  br i1 %9255, label %9256, label %9259

9256:                                             ; preds = %9251
  %9257 = shl nuw nsw i64 %9252, 4
  %9258 = getelementptr inbounds i8, i8* %0, i64 %9257
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9258, i8 0, i64 16, i1 false)
  br label %9259

9259:                                             ; preds = %9256, %9251
  %9260 = add nuw nsw i64 %.01, 1157
  %9261 = call zeroext i8 @randombit()
  %9262 = getelementptr inbounds i8, i8* %1, i64 %9260
  store i8 %9261, i8* %9262, align 1
  %9263 = icmp eq i8 %9261, 0
  br i1 %9263, label %9264, label %9267

9264:                                             ; preds = %9259
  %9265 = shl nuw nsw i64 %9260, 4
  %9266 = getelementptr inbounds i8, i8* %0, i64 %9265
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9266, i8 0, i64 16, i1 false)
  br label %9267

9267:                                             ; preds = %9264, %9259
  %9268 = add nuw nsw i64 %.01, 1158
  %9269 = call zeroext i8 @randombit()
  %9270 = getelementptr inbounds i8, i8* %1, i64 %9268
  store i8 %9269, i8* %9270, align 1
  %9271 = icmp eq i8 %9269, 0
  br i1 %9271, label %9272, label %9275

9272:                                             ; preds = %9267
  %9273 = shl nuw nsw i64 %9268, 4
  %9274 = getelementptr inbounds i8, i8* %0, i64 %9273
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9274, i8 0, i64 16, i1 false)
  br label %9275

9275:                                             ; preds = %9272, %9267
  %9276 = add nuw nsw i64 %.01, 1159
  %9277 = call zeroext i8 @randombit()
  %9278 = getelementptr inbounds i8, i8* %1, i64 %9276
  store i8 %9277, i8* %9278, align 1
  %9279 = icmp eq i8 %9277, 0
  br i1 %9279, label %9280, label %9283

9280:                                             ; preds = %9275
  %9281 = shl nuw nsw i64 %9276, 4
  %9282 = getelementptr inbounds i8, i8* %0, i64 %9281
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9282, i8 0, i64 16, i1 false)
  br label %9283

9283:                                             ; preds = %9280, %9275
  %9284 = add nuw nsw i64 %.01, 1160
  %9285 = call zeroext i8 @randombit()
  %9286 = getelementptr inbounds i8, i8* %1, i64 %9284
  store i8 %9285, i8* %9286, align 1
  %9287 = icmp eq i8 %9285, 0
  br i1 %9287, label %9288, label %9291

9288:                                             ; preds = %9283
  %9289 = shl nuw nsw i64 %9284, 4
  %9290 = getelementptr inbounds i8, i8* %0, i64 %9289
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9290, i8 0, i64 16, i1 false)
  br label %9291

9291:                                             ; preds = %9288, %9283
  %9292 = add nuw nsw i64 %.01, 1161
  %9293 = call zeroext i8 @randombit()
  %9294 = getelementptr inbounds i8, i8* %1, i64 %9292
  store i8 %9293, i8* %9294, align 1
  %9295 = icmp eq i8 %9293, 0
  br i1 %9295, label %9296, label %9299

9296:                                             ; preds = %9291
  %9297 = shl nuw nsw i64 %9292, 4
  %9298 = getelementptr inbounds i8, i8* %0, i64 %9297
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9298, i8 0, i64 16, i1 false)
  br label %9299

9299:                                             ; preds = %9296, %9291
  %9300 = add nuw nsw i64 %.01, 1162
  %9301 = call zeroext i8 @randombit()
  %9302 = getelementptr inbounds i8, i8* %1, i64 %9300
  store i8 %9301, i8* %9302, align 1
  %9303 = icmp eq i8 %9301, 0
  br i1 %9303, label %9304, label %9307

9304:                                             ; preds = %9299
  %9305 = shl nuw nsw i64 %9300, 4
  %9306 = getelementptr inbounds i8, i8* %0, i64 %9305
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9306, i8 0, i64 16, i1 false)
  br label %9307

9307:                                             ; preds = %9304, %9299
  %9308 = add nuw nsw i64 %.01, 1163
  %9309 = call zeroext i8 @randombit()
  %9310 = getelementptr inbounds i8, i8* %1, i64 %9308
  store i8 %9309, i8* %9310, align 1
  %9311 = icmp eq i8 %9309, 0
  br i1 %9311, label %9312, label %9315

9312:                                             ; preds = %9307
  %9313 = shl nuw nsw i64 %9308, 4
  %9314 = getelementptr inbounds i8, i8* %0, i64 %9313
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9314, i8 0, i64 16, i1 false)
  br label %9315

9315:                                             ; preds = %9312, %9307
  %9316 = add nuw nsw i64 %.01, 1164
  %9317 = call zeroext i8 @randombit()
  %9318 = getelementptr inbounds i8, i8* %1, i64 %9316
  store i8 %9317, i8* %9318, align 1
  %9319 = icmp eq i8 %9317, 0
  br i1 %9319, label %9320, label %9323

9320:                                             ; preds = %9315
  %9321 = shl nuw nsw i64 %9316, 4
  %9322 = getelementptr inbounds i8, i8* %0, i64 %9321
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9322, i8 0, i64 16, i1 false)
  br label %9323

9323:                                             ; preds = %9320, %9315
  %9324 = add nuw nsw i64 %.01, 1165
  %9325 = call zeroext i8 @randombit()
  %9326 = getelementptr inbounds i8, i8* %1, i64 %9324
  store i8 %9325, i8* %9326, align 1
  %9327 = icmp eq i8 %9325, 0
  br i1 %9327, label %9328, label %9331

9328:                                             ; preds = %9323
  %9329 = shl nuw nsw i64 %9324, 4
  %9330 = getelementptr inbounds i8, i8* %0, i64 %9329
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9330, i8 0, i64 16, i1 false)
  br label %9331

9331:                                             ; preds = %9328, %9323
  %9332 = add nuw nsw i64 %.01, 1166
  %9333 = call zeroext i8 @randombit()
  %9334 = getelementptr inbounds i8, i8* %1, i64 %9332
  store i8 %9333, i8* %9334, align 1
  %9335 = icmp eq i8 %9333, 0
  br i1 %9335, label %9336, label %9339

9336:                                             ; preds = %9331
  %9337 = shl nuw nsw i64 %9332, 4
  %9338 = getelementptr inbounds i8, i8* %0, i64 %9337
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9338, i8 0, i64 16, i1 false)
  br label %9339

9339:                                             ; preds = %9336, %9331
  %9340 = add nuw nsw i64 %.01, 1167
  %9341 = call zeroext i8 @randombit()
  %9342 = getelementptr inbounds i8, i8* %1, i64 %9340
  store i8 %9341, i8* %9342, align 1
  %9343 = icmp eq i8 %9341, 0
  br i1 %9343, label %9344, label %9347

9344:                                             ; preds = %9339
  %9345 = shl nuw nsw i64 %9340, 4
  %9346 = getelementptr inbounds i8, i8* %0, i64 %9345
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9346, i8 0, i64 16, i1 false)
  br label %9347

9347:                                             ; preds = %9344, %9339
  %9348 = add nuw nsw i64 %.01, 1168
  %9349 = call zeroext i8 @randombit()
  %9350 = getelementptr inbounds i8, i8* %1, i64 %9348
  store i8 %9349, i8* %9350, align 1
  %9351 = icmp eq i8 %9349, 0
  br i1 %9351, label %9352, label %9355

9352:                                             ; preds = %9347
  %9353 = shl nuw nsw i64 %9348, 4
  %9354 = getelementptr inbounds i8, i8* %0, i64 %9353
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9354, i8 0, i64 16, i1 false)
  br label %9355

9355:                                             ; preds = %9352, %9347
  %9356 = add nuw nsw i64 %.01, 1169
  %9357 = call zeroext i8 @randombit()
  %9358 = getelementptr inbounds i8, i8* %1, i64 %9356
  store i8 %9357, i8* %9358, align 1
  %9359 = icmp eq i8 %9357, 0
  br i1 %9359, label %9360, label %9363

9360:                                             ; preds = %9355
  %9361 = shl nuw nsw i64 %9356, 4
  %9362 = getelementptr inbounds i8, i8* %0, i64 %9361
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9362, i8 0, i64 16, i1 false)
  br label %9363

9363:                                             ; preds = %9360, %9355
  %9364 = add nuw nsw i64 %.01, 1170
  %9365 = call zeroext i8 @randombit()
  %9366 = getelementptr inbounds i8, i8* %1, i64 %9364
  store i8 %9365, i8* %9366, align 1
  %9367 = icmp eq i8 %9365, 0
  br i1 %9367, label %9368, label %9371

9368:                                             ; preds = %9363
  %9369 = shl nuw nsw i64 %9364, 4
  %9370 = getelementptr inbounds i8, i8* %0, i64 %9369
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9370, i8 0, i64 16, i1 false)
  br label %9371

9371:                                             ; preds = %9368, %9363
  %9372 = add nuw nsw i64 %.01, 1171
  %9373 = call zeroext i8 @randombit()
  %9374 = getelementptr inbounds i8, i8* %1, i64 %9372
  store i8 %9373, i8* %9374, align 1
  %9375 = icmp eq i8 %9373, 0
  br i1 %9375, label %9376, label %9379

9376:                                             ; preds = %9371
  %9377 = shl nuw nsw i64 %9372, 4
  %9378 = getelementptr inbounds i8, i8* %0, i64 %9377
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9378, i8 0, i64 16, i1 false)
  br label %9379

9379:                                             ; preds = %9376, %9371
  %9380 = add nuw nsw i64 %.01, 1172
  %9381 = call zeroext i8 @randombit()
  %9382 = getelementptr inbounds i8, i8* %1, i64 %9380
  store i8 %9381, i8* %9382, align 1
  %9383 = icmp eq i8 %9381, 0
  br i1 %9383, label %9384, label %9387

9384:                                             ; preds = %9379
  %9385 = shl nuw nsw i64 %9380, 4
  %9386 = getelementptr inbounds i8, i8* %0, i64 %9385
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9386, i8 0, i64 16, i1 false)
  br label %9387

9387:                                             ; preds = %9384, %9379
  %9388 = add nuw nsw i64 %.01, 1173
  %9389 = call zeroext i8 @randombit()
  %9390 = getelementptr inbounds i8, i8* %1, i64 %9388
  store i8 %9389, i8* %9390, align 1
  %9391 = icmp eq i8 %9389, 0
  br i1 %9391, label %9392, label %9395

9392:                                             ; preds = %9387
  %9393 = shl nuw nsw i64 %9388, 4
  %9394 = getelementptr inbounds i8, i8* %0, i64 %9393
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9394, i8 0, i64 16, i1 false)
  br label %9395

9395:                                             ; preds = %9392, %9387
  %9396 = add nuw nsw i64 %.01, 1174
  %9397 = call zeroext i8 @randombit()
  %9398 = getelementptr inbounds i8, i8* %1, i64 %9396
  store i8 %9397, i8* %9398, align 1
  %9399 = icmp eq i8 %9397, 0
  br i1 %9399, label %9400, label %9403

9400:                                             ; preds = %9395
  %9401 = shl nuw nsw i64 %9396, 4
  %9402 = getelementptr inbounds i8, i8* %0, i64 %9401
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9402, i8 0, i64 16, i1 false)
  br label %9403

9403:                                             ; preds = %9400, %9395
  %9404 = add nuw nsw i64 %.01, 1175
  %9405 = call zeroext i8 @randombit()
  %9406 = getelementptr inbounds i8, i8* %1, i64 %9404
  store i8 %9405, i8* %9406, align 1
  %9407 = icmp eq i8 %9405, 0
  br i1 %9407, label %9408, label %9411

9408:                                             ; preds = %9403
  %9409 = shl nuw nsw i64 %9404, 4
  %9410 = getelementptr inbounds i8, i8* %0, i64 %9409
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9410, i8 0, i64 16, i1 false)
  br label %9411

9411:                                             ; preds = %9408, %9403
  %9412 = add nuw nsw i64 %.01, 1176
  %9413 = call zeroext i8 @randombit()
  %9414 = getelementptr inbounds i8, i8* %1, i64 %9412
  store i8 %9413, i8* %9414, align 1
  %9415 = icmp eq i8 %9413, 0
  br i1 %9415, label %9416, label %9419

9416:                                             ; preds = %9411
  %9417 = shl nuw nsw i64 %9412, 4
  %9418 = getelementptr inbounds i8, i8* %0, i64 %9417
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9418, i8 0, i64 16, i1 false)
  br label %9419

9419:                                             ; preds = %9416, %9411
  %9420 = add nuw nsw i64 %.01, 1177
  %9421 = call zeroext i8 @randombit()
  %9422 = getelementptr inbounds i8, i8* %1, i64 %9420
  store i8 %9421, i8* %9422, align 1
  %9423 = icmp eq i8 %9421, 0
  br i1 %9423, label %9424, label %9427

9424:                                             ; preds = %9419
  %9425 = shl nuw nsw i64 %9420, 4
  %9426 = getelementptr inbounds i8, i8* %0, i64 %9425
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9426, i8 0, i64 16, i1 false)
  br label %9427

9427:                                             ; preds = %9424, %9419
  %9428 = add nuw nsw i64 %.01, 1178
  %9429 = call zeroext i8 @randombit()
  %9430 = getelementptr inbounds i8, i8* %1, i64 %9428
  store i8 %9429, i8* %9430, align 1
  %9431 = icmp eq i8 %9429, 0
  br i1 %9431, label %9432, label %9435

9432:                                             ; preds = %9427
  %9433 = shl nuw nsw i64 %9428, 4
  %9434 = getelementptr inbounds i8, i8* %0, i64 %9433
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9434, i8 0, i64 16, i1 false)
  br label %9435

9435:                                             ; preds = %9432, %9427
  %9436 = add nuw nsw i64 %.01, 1179
  %9437 = call zeroext i8 @randombit()
  %9438 = getelementptr inbounds i8, i8* %1, i64 %9436
  store i8 %9437, i8* %9438, align 1
  %9439 = icmp eq i8 %9437, 0
  br i1 %9439, label %9440, label %9443

9440:                                             ; preds = %9435
  %9441 = shl nuw nsw i64 %9436, 4
  %9442 = getelementptr inbounds i8, i8* %0, i64 %9441
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9442, i8 0, i64 16, i1 false)
  br label %9443

9443:                                             ; preds = %9440, %9435
  %9444 = add nuw nsw i64 %.01, 1180
  %9445 = call zeroext i8 @randombit()
  %9446 = getelementptr inbounds i8, i8* %1, i64 %9444
  store i8 %9445, i8* %9446, align 1
  %9447 = icmp eq i8 %9445, 0
  br i1 %9447, label %9448, label %9451

9448:                                             ; preds = %9443
  %9449 = shl nuw nsw i64 %9444, 4
  %9450 = getelementptr inbounds i8, i8* %0, i64 %9449
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9450, i8 0, i64 16, i1 false)
  br label %9451

9451:                                             ; preds = %9448, %9443
  %9452 = add nuw nsw i64 %.01, 1181
  %9453 = call zeroext i8 @randombit()
  %9454 = getelementptr inbounds i8, i8* %1, i64 %9452
  store i8 %9453, i8* %9454, align 1
  %9455 = icmp eq i8 %9453, 0
  br i1 %9455, label %9456, label %9459

9456:                                             ; preds = %9451
  %9457 = shl nuw nsw i64 %9452, 4
  %9458 = getelementptr inbounds i8, i8* %0, i64 %9457
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9458, i8 0, i64 16, i1 false)
  br label %9459

9459:                                             ; preds = %9456, %9451
  %9460 = add nuw nsw i64 %.01, 1182
  %9461 = call zeroext i8 @randombit()
  %9462 = getelementptr inbounds i8, i8* %1, i64 %9460
  store i8 %9461, i8* %9462, align 1
  %9463 = icmp eq i8 %9461, 0
  br i1 %9463, label %9464, label %9467

9464:                                             ; preds = %9459
  %9465 = shl nuw nsw i64 %9460, 4
  %9466 = getelementptr inbounds i8, i8* %0, i64 %9465
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9466, i8 0, i64 16, i1 false)
  br label %9467

9467:                                             ; preds = %9464, %9459
  %9468 = add nuw nsw i64 %.01, 1183
  %9469 = call zeroext i8 @randombit()
  %9470 = getelementptr inbounds i8, i8* %1, i64 %9468
  store i8 %9469, i8* %9470, align 1
  %9471 = icmp eq i8 %9469, 0
  br i1 %9471, label %9472, label %9475

9472:                                             ; preds = %9467
  %9473 = shl nuw nsw i64 %9468, 4
  %9474 = getelementptr inbounds i8, i8* %0, i64 %9473
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9474, i8 0, i64 16, i1 false)
  br label %9475

9475:                                             ; preds = %9472, %9467
  %9476 = add nuw nsw i64 %.01, 1184
  %9477 = call zeroext i8 @randombit()
  %9478 = getelementptr inbounds i8, i8* %1, i64 %9476
  store i8 %9477, i8* %9478, align 1
  %9479 = icmp eq i8 %9477, 0
  br i1 %9479, label %9480, label %9483

9480:                                             ; preds = %9475
  %9481 = shl nuw nsw i64 %9476, 4
  %9482 = getelementptr inbounds i8, i8* %0, i64 %9481
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9482, i8 0, i64 16, i1 false)
  br label %9483

9483:                                             ; preds = %9480, %9475
  %9484 = add nuw nsw i64 %.01, 1185
  %9485 = call zeroext i8 @randombit()
  %9486 = getelementptr inbounds i8, i8* %1, i64 %9484
  store i8 %9485, i8* %9486, align 1
  %9487 = icmp eq i8 %9485, 0
  br i1 %9487, label %9488, label %9491

9488:                                             ; preds = %9483
  %9489 = shl nuw nsw i64 %9484, 4
  %9490 = getelementptr inbounds i8, i8* %0, i64 %9489
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9490, i8 0, i64 16, i1 false)
  br label %9491

9491:                                             ; preds = %9488, %9483
  %9492 = add nuw nsw i64 %.01, 1186
  %9493 = call zeroext i8 @randombit()
  %9494 = getelementptr inbounds i8, i8* %1, i64 %9492
  store i8 %9493, i8* %9494, align 1
  %9495 = icmp eq i8 %9493, 0
  br i1 %9495, label %9496, label %9499

9496:                                             ; preds = %9491
  %9497 = shl nuw nsw i64 %9492, 4
  %9498 = getelementptr inbounds i8, i8* %0, i64 %9497
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9498, i8 0, i64 16, i1 false)
  br label %9499

9499:                                             ; preds = %9496, %9491
  %9500 = add nuw nsw i64 %.01, 1187
  %9501 = call zeroext i8 @randombit()
  %9502 = getelementptr inbounds i8, i8* %1, i64 %9500
  store i8 %9501, i8* %9502, align 1
  %9503 = icmp eq i8 %9501, 0
  br i1 %9503, label %9504, label %9507

9504:                                             ; preds = %9499
  %9505 = shl nuw nsw i64 %9500, 4
  %9506 = getelementptr inbounds i8, i8* %0, i64 %9505
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9506, i8 0, i64 16, i1 false)
  br label %9507

9507:                                             ; preds = %9504, %9499
  %9508 = add nuw nsw i64 %.01, 1188
  %9509 = call zeroext i8 @randombit()
  %9510 = getelementptr inbounds i8, i8* %1, i64 %9508
  store i8 %9509, i8* %9510, align 1
  %9511 = icmp eq i8 %9509, 0
  br i1 %9511, label %9512, label %9515

9512:                                             ; preds = %9507
  %9513 = shl nuw nsw i64 %9508, 4
  %9514 = getelementptr inbounds i8, i8* %0, i64 %9513
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9514, i8 0, i64 16, i1 false)
  br label %9515

9515:                                             ; preds = %9512, %9507
  %9516 = add nuw nsw i64 %.01, 1189
  %9517 = call zeroext i8 @randombit()
  %9518 = getelementptr inbounds i8, i8* %1, i64 %9516
  store i8 %9517, i8* %9518, align 1
  %9519 = icmp eq i8 %9517, 0
  br i1 %9519, label %9520, label %9523

9520:                                             ; preds = %9515
  %9521 = shl nuw nsw i64 %9516, 4
  %9522 = getelementptr inbounds i8, i8* %0, i64 %9521
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9522, i8 0, i64 16, i1 false)
  br label %9523

9523:                                             ; preds = %9520, %9515
  %9524 = add nuw nsw i64 %.01, 1190
  %9525 = call zeroext i8 @randombit()
  %9526 = getelementptr inbounds i8, i8* %1, i64 %9524
  store i8 %9525, i8* %9526, align 1
  %9527 = icmp eq i8 %9525, 0
  br i1 %9527, label %9528, label %9531

9528:                                             ; preds = %9523
  %9529 = shl nuw nsw i64 %9524, 4
  %9530 = getelementptr inbounds i8, i8* %0, i64 %9529
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9530, i8 0, i64 16, i1 false)
  br label %9531

9531:                                             ; preds = %9528, %9523
  %9532 = add nuw nsw i64 %.01, 1191
  %9533 = call zeroext i8 @randombit()
  %9534 = getelementptr inbounds i8, i8* %1, i64 %9532
  store i8 %9533, i8* %9534, align 1
  %9535 = icmp eq i8 %9533, 0
  br i1 %9535, label %9536, label %9539

9536:                                             ; preds = %9531
  %9537 = shl nuw nsw i64 %9532, 4
  %9538 = getelementptr inbounds i8, i8* %0, i64 %9537
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9538, i8 0, i64 16, i1 false)
  br label %9539

9539:                                             ; preds = %9536, %9531
  %9540 = add nuw nsw i64 %.01, 1192
  %9541 = call zeroext i8 @randombit()
  %9542 = getelementptr inbounds i8, i8* %1, i64 %9540
  store i8 %9541, i8* %9542, align 1
  %9543 = icmp eq i8 %9541, 0
  br i1 %9543, label %9544, label %9547

9544:                                             ; preds = %9539
  %9545 = shl nuw nsw i64 %9540, 4
  %9546 = getelementptr inbounds i8, i8* %0, i64 %9545
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9546, i8 0, i64 16, i1 false)
  br label %9547

9547:                                             ; preds = %9544, %9539
  %9548 = add nuw nsw i64 %.01, 1193
  %9549 = call zeroext i8 @randombit()
  %9550 = getelementptr inbounds i8, i8* %1, i64 %9548
  store i8 %9549, i8* %9550, align 1
  %9551 = icmp eq i8 %9549, 0
  br i1 %9551, label %9552, label %9555

9552:                                             ; preds = %9547
  %9553 = shl nuw nsw i64 %9548, 4
  %9554 = getelementptr inbounds i8, i8* %0, i64 %9553
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9554, i8 0, i64 16, i1 false)
  br label %9555

9555:                                             ; preds = %9552, %9547
  %9556 = add nuw nsw i64 %.01, 1194
  %9557 = call zeroext i8 @randombit()
  %9558 = getelementptr inbounds i8, i8* %1, i64 %9556
  store i8 %9557, i8* %9558, align 1
  %9559 = icmp eq i8 %9557, 0
  br i1 %9559, label %9560, label %9563

9560:                                             ; preds = %9555
  %9561 = shl nuw nsw i64 %9556, 4
  %9562 = getelementptr inbounds i8, i8* %0, i64 %9561
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9562, i8 0, i64 16, i1 false)
  br label %9563

9563:                                             ; preds = %9560, %9555
  %9564 = add nuw nsw i64 %.01, 1195
  %9565 = call zeroext i8 @randombit()
  %9566 = getelementptr inbounds i8, i8* %1, i64 %9564
  store i8 %9565, i8* %9566, align 1
  %9567 = icmp eq i8 %9565, 0
  br i1 %9567, label %9568, label %9571

9568:                                             ; preds = %9563
  %9569 = shl nuw nsw i64 %9564, 4
  %9570 = getelementptr inbounds i8, i8* %0, i64 %9569
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9570, i8 0, i64 16, i1 false)
  br label %9571

9571:                                             ; preds = %9568, %9563
  %9572 = add nuw nsw i64 %.01, 1196
  %9573 = call zeroext i8 @randombit()
  %9574 = getelementptr inbounds i8, i8* %1, i64 %9572
  store i8 %9573, i8* %9574, align 1
  %9575 = icmp eq i8 %9573, 0
  br i1 %9575, label %9576, label %9579

9576:                                             ; preds = %9571
  %9577 = shl nuw nsw i64 %9572, 4
  %9578 = getelementptr inbounds i8, i8* %0, i64 %9577
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9578, i8 0, i64 16, i1 false)
  br label %9579

9579:                                             ; preds = %9576, %9571
  %9580 = add nuw nsw i64 %.01, 1197
  %9581 = call zeroext i8 @randombit()
  %9582 = getelementptr inbounds i8, i8* %1, i64 %9580
  store i8 %9581, i8* %9582, align 1
  %9583 = icmp eq i8 %9581, 0
  br i1 %9583, label %9584, label %9587

9584:                                             ; preds = %9579
  %9585 = shl nuw nsw i64 %9580, 4
  %9586 = getelementptr inbounds i8, i8* %0, i64 %9585
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9586, i8 0, i64 16, i1 false)
  br label %9587

9587:                                             ; preds = %9584, %9579
  %9588 = add nuw nsw i64 %.01, 1198
  %9589 = call zeroext i8 @randombit()
  %9590 = getelementptr inbounds i8, i8* %1, i64 %9588
  store i8 %9589, i8* %9590, align 1
  %9591 = icmp eq i8 %9589, 0
  br i1 %9591, label %9592, label %9595

9592:                                             ; preds = %9587
  %9593 = shl nuw nsw i64 %9588, 4
  %9594 = getelementptr inbounds i8, i8* %0, i64 %9593
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9594, i8 0, i64 16, i1 false)
  br label %9595

9595:                                             ; preds = %9592, %9587
  %9596 = add nuw nsw i64 %.01, 1199
  %9597 = call zeroext i8 @randombit()
  %9598 = getelementptr inbounds i8, i8* %1, i64 %9596
  store i8 %9597, i8* %9598, align 1
  %9599 = icmp eq i8 %9597, 0
  br i1 %9599, label %9600, label %9603

9600:                                             ; preds = %9595
  %9601 = shl nuw nsw i64 %9596, 4
  %9602 = getelementptr inbounds i8, i8* %0, i64 %9601
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9602, i8 0, i64 16, i1 false)
  br label %9603

9603:                                             ; preds = %9600, %9595
  %9604 = add nuw nsw i64 %.01, 1200
  %9605 = call zeroext i8 @randombit()
  %9606 = getelementptr inbounds i8, i8* %1, i64 %9604
  store i8 %9605, i8* %9606, align 1
  %9607 = icmp eq i8 %9605, 0
  br i1 %9607, label %9608, label %9611

9608:                                             ; preds = %9603
  %9609 = shl nuw nsw i64 %9604, 4
  %9610 = getelementptr inbounds i8, i8* %0, i64 %9609
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9610, i8 0, i64 16, i1 false)
  br label %9611

9611:                                             ; preds = %9608, %9603
  %9612 = add nuw nsw i64 %.01, 1201
  %9613 = call zeroext i8 @randombit()
  %9614 = getelementptr inbounds i8, i8* %1, i64 %9612
  store i8 %9613, i8* %9614, align 1
  %9615 = icmp eq i8 %9613, 0
  br i1 %9615, label %9616, label %9619

9616:                                             ; preds = %9611
  %9617 = shl nuw nsw i64 %9612, 4
  %9618 = getelementptr inbounds i8, i8* %0, i64 %9617
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9618, i8 0, i64 16, i1 false)
  br label %9619

9619:                                             ; preds = %9616, %9611
  %9620 = add nuw nsw i64 %.01, 1202
  %9621 = call zeroext i8 @randombit()
  %9622 = getelementptr inbounds i8, i8* %1, i64 %9620
  store i8 %9621, i8* %9622, align 1
  %9623 = icmp eq i8 %9621, 0
  br i1 %9623, label %9624, label %9627

9624:                                             ; preds = %9619
  %9625 = shl nuw nsw i64 %9620, 4
  %9626 = getelementptr inbounds i8, i8* %0, i64 %9625
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9626, i8 0, i64 16, i1 false)
  br label %9627

9627:                                             ; preds = %9624, %9619
  %9628 = add nuw nsw i64 %.01, 1203
  %9629 = call zeroext i8 @randombit()
  %9630 = getelementptr inbounds i8, i8* %1, i64 %9628
  store i8 %9629, i8* %9630, align 1
  %9631 = icmp eq i8 %9629, 0
  br i1 %9631, label %9632, label %9635

9632:                                             ; preds = %9627
  %9633 = shl nuw nsw i64 %9628, 4
  %9634 = getelementptr inbounds i8, i8* %0, i64 %9633
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9634, i8 0, i64 16, i1 false)
  br label %9635

9635:                                             ; preds = %9632, %9627
  %9636 = add nuw nsw i64 %.01, 1204
  %9637 = call zeroext i8 @randombit()
  %9638 = getelementptr inbounds i8, i8* %1, i64 %9636
  store i8 %9637, i8* %9638, align 1
  %9639 = icmp eq i8 %9637, 0
  br i1 %9639, label %9640, label %9643

9640:                                             ; preds = %9635
  %9641 = shl nuw nsw i64 %9636, 4
  %9642 = getelementptr inbounds i8, i8* %0, i64 %9641
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9642, i8 0, i64 16, i1 false)
  br label %9643

9643:                                             ; preds = %9640, %9635
  %9644 = add nuw nsw i64 %.01, 1205
  %9645 = call zeroext i8 @randombit()
  %9646 = getelementptr inbounds i8, i8* %1, i64 %9644
  store i8 %9645, i8* %9646, align 1
  %9647 = icmp eq i8 %9645, 0
  br i1 %9647, label %9648, label %9651

9648:                                             ; preds = %9643
  %9649 = shl nuw nsw i64 %9644, 4
  %9650 = getelementptr inbounds i8, i8* %0, i64 %9649
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9650, i8 0, i64 16, i1 false)
  br label %9651

9651:                                             ; preds = %9648, %9643
  %9652 = add nuw nsw i64 %.01, 1206
  %9653 = call zeroext i8 @randombit()
  %9654 = getelementptr inbounds i8, i8* %1, i64 %9652
  store i8 %9653, i8* %9654, align 1
  %9655 = icmp eq i8 %9653, 0
  br i1 %9655, label %9656, label %9659

9656:                                             ; preds = %9651
  %9657 = shl nuw nsw i64 %9652, 4
  %9658 = getelementptr inbounds i8, i8* %0, i64 %9657
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9658, i8 0, i64 16, i1 false)
  br label %9659

9659:                                             ; preds = %9656, %9651
  %9660 = add nuw nsw i64 %.01, 1207
  %9661 = call zeroext i8 @randombit()
  %9662 = getelementptr inbounds i8, i8* %1, i64 %9660
  store i8 %9661, i8* %9662, align 1
  %9663 = icmp eq i8 %9661, 0
  br i1 %9663, label %9664, label %9667

9664:                                             ; preds = %9659
  %9665 = shl nuw nsw i64 %9660, 4
  %9666 = getelementptr inbounds i8, i8* %0, i64 %9665
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9666, i8 0, i64 16, i1 false)
  br label %9667

9667:                                             ; preds = %9664, %9659
  %9668 = add nuw nsw i64 %.01, 1208
  %9669 = call zeroext i8 @randombit()
  %9670 = getelementptr inbounds i8, i8* %1, i64 %9668
  store i8 %9669, i8* %9670, align 1
  %9671 = icmp eq i8 %9669, 0
  br i1 %9671, label %9672, label %9675

9672:                                             ; preds = %9667
  %9673 = shl nuw nsw i64 %9668, 4
  %9674 = getelementptr inbounds i8, i8* %0, i64 %9673
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9674, i8 0, i64 16, i1 false)
  br label %9675

9675:                                             ; preds = %9672, %9667
  %9676 = add nuw nsw i64 %.01, 1209
  %9677 = call zeroext i8 @randombit()
  %9678 = getelementptr inbounds i8, i8* %1, i64 %9676
  store i8 %9677, i8* %9678, align 1
  %9679 = icmp eq i8 %9677, 0
  br i1 %9679, label %9680, label %9683

9680:                                             ; preds = %9675
  %9681 = shl nuw nsw i64 %9676, 4
  %9682 = getelementptr inbounds i8, i8* %0, i64 %9681
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9682, i8 0, i64 16, i1 false)
  br label %9683

9683:                                             ; preds = %9680, %9675
  %9684 = add nuw nsw i64 %.01, 1210
  %9685 = call zeroext i8 @randombit()
  %9686 = getelementptr inbounds i8, i8* %1, i64 %9684
  store i8 %9685, i8* %9686, align 1
  %9687 = icmp eq i8 %9685, 0
  br i1 %9687, label %9688, label %9691

9688:                                             ; preds = %9683
  %9689 = shl nuw nsw i64 %9684, 4
  %9690 = getelementptr inbounds i8, i8* %0, i64 %9689
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9690, i8 0, i64 16, i1 false)
  br label %9691

9691:                                             ; preds = %9688, %9683
  %9692 = add nuw nsw i64 %.01, 1211
  %9693 = call zeroext i8 @randombit()
  %9694 = getelementptr inbounds i8, i8* %1, i64 %9692
  store i8 %9693, i8* %9694, align 1
  %9695 = icmp eq i8 %9693, 0
  br i1 %9695, label %9696, label %9699

9696:                                             ; preds = %9691
  %9697 = shl nuw nsw i64 %9692, 4
  %9698 = getelementptr inbounds i8, i8* %0, i64 %9697
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9698, i8 0, i64 16, i1 false)
  br label %9699

9699:                                             ; preds = %9696, %9691
  %9700 = add nuw nsw i64 %.01, 1212
  %9701 = call zeroext i8 @randombit()
  %9702 = getelementptr inbounds i8, i8* %1, i64 %9700
  store i8 %9701, i8* %9702, align 1
  %9703 = icmp eq i8 %9701, 0
  br i1 %9703, label %9704, label %9707

9704:                                             ; preds = %9699
  %9705 = shl nuw nsw i64 %9700, 4
  %9706 = getelementptr inbounds i8, i8* %0, i64 %9705
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9706, i8 0, i64 16, i1 false)
  br label %9707

9707:                                             ; preds = %9704, %9699
  %9708 = add nuw nsw i64 %.01, 1213
  %9709 = call zeroext i8 @randombit()
  %9710 = getelementptr inbounds i8, i8* %1, i64 %9708
  store i8 %9709, i8* %9710, align 1
  %9711 = icmp eq i8 %9709, 0
  br i1 %9711, label %9712, label %9715

9712:                                             ; preds = %9707
  %9713 = shl nuw nsw i64 %9708, 4
  %9714 = getelementptr inbounds i8, i8* %0, i64 %9713
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9714, i8 0, i64 16, i1 false)
  br label %9715

9715:                                             ; preds = %9712, %9707
  %9716 = add nuw nsw i64 %.01, 1214
  %9717 = call zeroext i8 @randombit()
  %9718 = getelementptr inbounds i8, i8* %1, i64 %9716
  store i8 %9717, i8* %9718, align 1
  %9719 = icmp eq i8 %9717, 0
  br i1 %9719, label %9720, label %9723

9720:                                             ; preds = %9715
  %9721 = shl nuw nsw i64 %9716, 4
  %9722 = getelementptr inbounds i8, i8* %0, i64 %9721
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9722, i8 0, i64 16, i1 false)
  br label %9723

9723:                                             ; preds = %9720, %9715
  %9724 = add nuw nsw i64 %.01, 1215
  %9725 = call zeroext i8 @randombit()
  %9726 = getelementptr inbounds i8, i8* %1, i64 %9724
  store i8 %9725, i8* %9726, align 1
  %9727 = icmp eq i8 %9725, 0
  br i1 %9727, label %9728, label %9731

9728:                                             ; preds = %9723
  %9729 = shl nuw nsw i64 %9724, 4
  %9730 = getelementptr inbounds i8, i8* %0, i64 %9729
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9730, i8 0, i64 16, i1 false)
  br label %9731

9731:                                             ; preds = %9728, %9723
  %9732 = add nuw nsw i64 %.01, 1216
  %9733 = call zeroext i8 @randombit()
  %9734 = getelementptr inbounds i8, i8* %1, i64 %9732
  store i8 %9733, i8* %9734, align 1
  %9735 = icmp eq i8 %9733, 0
  br i1 %9735, label %9736, label %9739

9736:                                             ; preds = %9731
  %9737 = shl nuw nsw i64 %9732, 4
  %9738 = getelementptr inbounds i8, i8* %0, i64 %9737
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9738, i8 0, i64 16, i1 false)
  br label %9739

9739:                                             ; preds = %9736, %9731
  %9740 = add nuw nsw i64 %.01, 1217
  %9741 = call zeroext i8 @randombit()
  %9742 = getelementptr inbounds i8, i8* %1, i64 %9740
  store i8 %9741, i8* %9742, align 1
  %9743 = icmp eq i8 %9741, 0
  br i1 %9743, label %9744, label %9747

9744:                                             ; preds = %9739
  %9745 = shl nuw nsw i64 %9740, 4
  %9746 = getelementptr inbounds i8, i8* %0, i64 %9745
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9746, i8 0, i64 16, i1 false)
  br label %9747

9747:                                             ; preds = %9744, %9739
  %9748 = add nuw nsw i64 %.01, 1218
  %9749 = call zeroext i8 @randombit()
  %9750 = getelementptr inbounds i8, i8* %1, i64 %9748
  store i8 %9749, i8* %9750, align 1
  %9751 = icmp eq i8 %9749, 0
  br i1 %9751, label %9752, label %9755

9752:                                             ; preds = %9747
  %9753 = shl nuw nsw i64 %9748, 4
  %9754 = getelementptr inbounds i8, i8* %0, i64 %9753
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9754, i8 0, i64 16, i1 false)
  br label %9755

9755:                                             ; preds = %9752, %9747
  %9756 = add nuw nsw i64 %.01, 1219
  %9757 = call zeroext i8 @randombit()
  %9758 = getelementptr inbounds i8, i8* %1, i64 %9756
  store i8 %9757, i8* %9758, align 1
  %9759 = icmp eq i8 %9757, 0
  br i1 %9759, label %9760, label %9763

9760:                                             ; preds = %9755
  %9761 = shl nuw nsw i64 %9756, 4
  %9762 = getelementptr inbounds i8, i8* %0, i64 %9761
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9762, i8 0, i64 16, i1 false)
  br label %9763

9763:                                             ; preds = %9760, %9755
  %9764 = add nuw nsw i64 %.01, 1220
  %9765 = call zeroext i8 @randombit()
  %9766 = getelementptr inbounds i8, i8* %1, i64 %9764
  store i8 %9765, i8* %9766, align 1
  %9767 = icmp eq i8 %9765, 0
  br i1 %9767, label %9768, label %9771

9768:                                             ; preds = %9763
  %9769 = shl nuw nsw i64 %9764, 4
  %9770 = getelementptr inbounds i8, i8* %0, i64 %9769
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9770, i8 0, i64 16, i1 false)
  br label %9771

9771:                                             ; preds = %9768, %9763
  %9772 = add nuw nsw i64 %.01, 1221
  %9773 = call zeroext i8 @randombit()
  %9774 = getelementptr inbounds i8, i8* %1, i64 %9772
  store i8 %9773, i8* %9774, align 1
  %9775 = icmp eq i8 %9773, 0
  br i1 %9775, label %9776, label %9779

9776:                                             ; preds = %9771
  %9777 = shl nuw nsw i64 %9772, 4
  %9778 = getelementptr inbounds i8, i8* %0, i64 %9777
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9778, i8 0, i64 16, i1 false)
  br label %9779

9779:                                             ; preds = %9776, %9771
  %9780 = add nuw nsw i64 %.01, 1222
  %9781 = call zeroext i8 @randombit()
  %9782 = getelementptr inbounds i8, i8* %1, i64 %9780
  store i8 %9781, i8* %9782, align 1
  %9783 = icmp eq i8 %9781, 0
  br i1 %9783, label %9784, label %9787

9784:                                             ; preds = %9779
  %9785 = shl nuw nsw i64 %9780, 4
  %9786 = getelementptr inbounds i8, i8* %0, i64 %9785
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9786, i8 0, i64 16, i1 false)
  br label %9787

9787:                                             ; preds = %9784, %9779
  %9788 = add nuw nsw i64 %.01, 1223
  %9789 = call zeroext i8 @randombit()
  %9790 = getelementptr inbounds i8, i8* %1, i64 %9788
  store i8 %9789, i8* %9790, align 1
  %9791 = icmp eq i8 %9789, 0
  br i1 %9791, label %9792, label %9795

9792:                                             ; preds = %9787
  %9793 = shl nuw nsw i64 %9788, 4
  %9794 = getelementptr inbounds i8, i8* %0, i64 %9793
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9794, i8 0, i64 16, i1 false)
  br label %9795

9795:                                             ; preds = %9792, %9787
  %9796 = add nuw nsw i64 %.01, 1224
  %9797 = call zeroext i8 @randombit()
  %9798 = getelementptr inbounds i8, i8* %1, i64 %9796
  store i8 %9797, i8* %9798, align 1
  %9799 = icmp eq i8 %9797, 0
  br i1 %9799, label %9800, label %9803

9800:                                             ; preds = %9795
  %9801 = shl nuw nsw i64 %9796, 4
  %9802 = getelementptr inbounds i8, i8* %0, i64 %9801
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9802, i8 0, i64 16, i1 false)
  br label %9803

9803:                                             ; preds = %9800, %9795
  %9804 = add nuw nsw i64 %.01, 1225
  %9805 = call zeroext i8 @randombit()
  %9806 = getelementptr inbounds i8, i8* %1, i64 %9804
  store i8 %9805, i8* %9806, align 1
  %9807 = icmp eq i8 %9805, 0
  br i1 %9807, label %9808, label %9811

9808:                                             ; preds = %9803
  %9809 = shl nuw nsw i64 %9804, 4
  %9810 = getelementptr inbounds i8, i8* %0, i64 %9809
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9810, i8 0, i64 16, i1 false)
  br label %9811

9811:                                             ; preds = %9808, %9803
  %9812 = add nuw nsw i64 %.01, 1226
  %9813 = call zeroext i8 @randombit()
  %9814 = getelementptr inbounds i8, i8* %1, i64 %9812
  store i8 %9813, i8* %9814, align 1
  %9815 = icmp eq i8 %9813, 0
  br i1 %9815, label %9816, label %9819

9816:                                             ; preds = %9811
  %9817 = shl nuw nsw i64 %9812, 4
  %9818 = getelementptr inbounds i8, i8* %0, i64 %9817
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9818, i8 0, i64 16, i1 false)
  br label %9819

9819:                                             ; preds = %9816, %9811
  %9820 = add nuw nsw i64 %.01, 1227
  %9821 = call zeroext i8 @randombit()
  %9822 = getelementptr inbounds i8, i8* %1, i64 %9820
  store i8 %9821, i8* %9822, align 1
  %9823 = icmp eq i8 %9821, 0
  br i1 %9823, label %9824, label %9827

9824:                                             ; preds = %9819
  %9825 = shl nuw nsw i64 %9820, 4
  %9826 = getelementptr inbounds i8, i8* %0, i64 %9825
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9826, i8 0, i64 16, i1 false)
  br label %9827

9827:                                             ; preds = %9824, %9819
  %9828 = add nuw nsw i64 %.01, 1228
  %9829 = call zeroext i8 @randombit()
  %9830 = getelementptr inbounds i8, i8* %1, i64 %9828
  store i8 %9829, i8* %9830, align 1
  %9831 = icmp eq i8 %9829, 0
  br i1 %9831, label %9832, label %9835

9832:                                             ; preds = %9827
  %9833 = shl nuw nsw i64 %9828, 4
  %9834 = getelementptr inbounds i8, i8* %0, i64 %9833
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9834, i8 0, i64 16, i1 false)
  br label %9835

9835:                                             ; preds = %9832, %9827
  %9836 = add nuw nsw i64 %.01, 1229
  %9837 = call zeroext i8 @randombit()
  %9838 = getelementptr inbounds i8, i8* %1, i64 %9836
  store i8 %9837, i8* %9838, align 1
  %9839 = icmp eq i8 %9837, 0
  br i1 %9839, label %9840, label %9843

9840:                                             ; preds = %9835
  %9841 = shl nuw nsw i64 %9836, 4
  %9842 = getelementptr inbounds i8, i8* %0, i64 %9841
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9842, i8 0, i64 16, i1 false)
  br label %9843

9843:                                             ; preds = %9840, %9835
  %9844 = add nuw nsw i64 %.01, 1230
  %9845 = call zeroext i8 @randombit()
  %9846 = getelementptr inbounds i8, i8* %1, i64 %9844
  store i8 %9845, i8* %9846, align 1
  %9847 = icmp eq i8 %9845, 0
  br i1 %9847, label %9848, label %9851

9848:                                             ; preds = %9843
  %9849 = shl nuw nsw i64 %9844, 4
  %9850 = getelementptr inbounds i8, i8* %0, i64 %9849
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9850, i8 0, i64 16, i1 false)
  br label %9851

9851:                                             ; preds = %9848, %9843
  %9852 = add nuw nsw i64 %.01, 1231
  %9853 = call zeroext i8 @randombit()
  %9854 = getelementptr inbounds i8, i8* %1, i64 %9852
  store i8 %9853, i8* %9854, align 1
  %9855 = icmp eq i8 %9853, 0
  br i1 %9855, label %9856, label %9859

9856:                                             ; preds = %9851
  %9857 = shl nuw nsw i64 %9852, 4
  %9858 = getelementptr inbounds i8, i8* %0, i64 %9857
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9858, i8 0, i64 16, i1 false)
  br label %9859

9859:                                             ; preds = %9856, %9851
  %9860 = add nuw nsw i64 %.01, 1232
  %9861 = call zeroext i8 @randombit()
  %9862 = getelementptr inbounds i8, i8* %1, i64 %9860
  store i8 %9861, i8* %9862, align 1
  %9863 = icmp eq i8 %9861, 0
  br i1 %9863, label %9864, label %9867

9864:                                             ; preds = %9859
  %9865 = shl nuw nsw i64 %9860, 4
  %9866 = getelementptr inbounds i8, i8* %0, i64 %9865
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9866, i8 0, i64 16, i1 false)
  br label %9867

9867:                                             ; preds = %9864, %9859
  %9868 = add nuw nsw i64 %.01, 1233
  %9869 = call zeroext i8 @randombit()
  %9870 = getelementptr inbounds i8, i8* %1, i64 %9868
  store i8 %9869, i8* %9870, align 1
  %9871 = icmp eq i8 %9869, 0
  br i1 %9871, label %9872, label %9875

9872:                                             ; preds = %9867
  %9873 = shl nuw nsw i64 %9868, 4
  %9874 = getelementptr inbounds i8, i8* %0, i64 %9873
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9874, i8 0, i64 16, i1 false)
  br label %9875

9875:                                             ; preds = %9872, %9867
  %9876 = add nuw nsw i64 %.01, 1234
  %9877 = call zeroext i8 @randombit()
  %9878 = getelementptr inbounds i8, i8* %1, i64 %9876
  store i8 %9877, i8* %9878, align 1
  %9879 = icmp eq i8 %9877, 0
  br i1 %9879, label %9880, label %9883

9880:                                             ; preds = %9875
  %9881 = shl nuw nsw i64 %9876, 4
  %9882 = getelementptr inbounds i8, i8* %0, i64 %9881
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9882, i8 0, i64 16, i1 false)
  br label %9883

9883:                                             ; preds = %9880, %9875
  %9884 = add nuw nsw i64 %.01, 1235
  %9885 = call zeroext i8 @randombit()
  %9886 = getelementptr inbounds i8, i8* %1, i64 %9884
  store i8 %9885, i8* %9886, align 1
  %9887 = icmp eq i8 %9885, 0
  br i1 %9887, label %9888, label %9891

9888:                                             ; preds = %9883
  %9889 = shl nuw nsw i64 %9884, 4
  %9890 = getelementptr inbounds i8, i8* %0, i64 %9889
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9890, i8 0, i64 16, i1 false)
  br label %9891

9891:                                             ; preds = %9888, %9883
  %9892 = add nuw nsw i64 %.01, 1236
  %9893 = call zeroext i8 @randombit()
  %9894 = getelementptr inbounds i8, i8* %1, i64 %9892
  store i8 %9893, i8* %9894, align 1
  %9895 = icmp eq i8 %9893, 0
  br i1 %9895, label %9896, label %9899

9896:                                             ; preds = %9891
  %9897 = shl nuw nsw i64 %9892, 4
  %9898 = getelementptr inbounds i8, i8* %0, i64 %9897
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9898, i8 0, i64 16, i1 false)
  br label %9899

9899:                                             ; preds = %9896, %9891
  %9900 = add nuw nsw i64 %.01, 1237
  %9901 = call zeroext i8 @randombit()
  %9902 = getelementptr inbounds i8, i8* %1, i64 %9900
  store i8 %9901, i8* %9902, align 1
  %9903 = icmp eq i8 %9901, 0
  br i1 %9903, label %9904, label %9907

9904:                                             ; preds = %9899
  %9905 = shl nuw nsw i64 %9900, 4
  %9906 = getelementptr inbounds i8, i8* %0, i64 %9905
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9906, i8 0, i64 16, i1 false)
  br label %9907

9907:                                             ; preds = %9904, %9899
  %9908 = add nuw nsw i64 %.01, 1238
  %9909 = call zeroext i8 @randombit()
  %9910 = getelementptr inbounds i8, i8* %1, i64 %9908
  store i8 %9909, i8* %9910, align 1
  %9911 = icmp eq i8 %9909, 0
  br i1 %9911, label %9912, label %9915

9912:                                             ; preds = %9907
  %9913 = shl nuw nsw i64 %9908, 4
  %9914 = getelementptr inbounds i8, i8* %0, i64 %9913
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9914, i8 0, i64 16, i1 false)
  br label %9915

9915:                                             ; preds = %9912, %9907
  %9916 = add nuw nsw i64 %.01, 1239
  %9917 = call zeroext i8 @randombit()
  %9918 = getelementptr inbounds i8, i8* %1, i64 %9916
  store i8 %9917, i8* %9918, align 1
  %9919 = icmp eq i8 %9917, 0
  br i1 %9919, label %9920, label %9923

9920:                                             ; preds = %9915
  %9921 = shl nuw nsw i64 %9916, 4
  %9922 = getelementptr inbounds i8, i8* %0, i64 %9921
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9922, i8 0, i64 16, i1 false)
  br label %9923

9923:                                             ; preds = %9920, %9915
  %9924 = add nuw nsw i64 %.01, 1240
  %9925 = call zeroext i8 @randombit()
  %9926 = getelementptr inbounds i8, i8* %1, i64 %9924
  store i8 %9925, i8* %9926, align 1
  %9927 = icmp eq i8 %9925, 0
  br i1 %9927, label %9928, label %9931

9928:                                             ; preds = %9923
  %9929 = shl nuw nsw i64 %9924, 4
  %9930 = getelementptr inbounds i8, i8* %0, i64 %9929
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9930, i8 0, i64 16, i1 false)
  br label %9931

9931:                                             ; preds = %9928, %9923
  %9932 = add nuw nsw i64 %.01, 1241
  %9933 = call zeroext i8 @randombit()
  %9934 = getelementptr inbounds i8, i8* %1, i64 %9932
  store i8 %9933, i8* %9934, align 1
  %9935 = icmp eq i8 %9933, 0
  br i1 %9935, label %9936, label %9939

9936:                                             ; preds = %9931
  %9937 = shl nuw nsw i64 %9932, 4
  %9938 = getelementptr inbounds i8, i8* %0, i64 %9937
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9938, i8 0, i64 16, i1 false)
  br label %9939

9939:                                             ; preds = %9936, %9931
  %9940 = add nuw nsw i64 %.01, 1242
  %9941 = call zeroext i8 @randombit()
  %9942 = getelementptr inbounds i8, i8* %1, i64 %9940
  store i8 %9941, i8* %9942, align 1
  %9943 = icmp eq i8 %9941, 0
  br i1 %9943, label %9944, label %9947

9944:                                             ; preds = %9939
  %9945 = shl nuw nsw i64 %9940, 4
  %9946 = getelementptr inbounds i8, i8* %0, i64 %9945
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9946, i8 0, i64 16, i1 false)
  br label %9947

9947:                                             ; preds = %9944, %9939
  %9948 = add nuw nsw i64 %.01, 1243
  %9949 = call zeroext i8 @randombit()
  %9950 = getelementptr inbounds i8, i8* %1, i64 %9948
  store i8 %9949, i8* %9950, align 1
  %9951 = icmp eq i8 %9949, 0
  br i1 %9951, label %9952, label %9955

9952:                                             ; preds = %9947
  %9953 = shl nuw nsw i64 %9948, 4
  %9954 = getelementptr inbounds i8, i8* %0, i64 %9953
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9954, i8 0, i64 16, i1 false)
  br label %9955

9955:                                             ; preds = %9952, %9947
  %9956 = add nuw nsw i64 %.01, 1244
  %9957 = call zeroext i8 @randombit()
  %9958 = getelementptr inbounds i8, i8* %1, i64 %9956
  store i8 %9957, i8* %9958, align 1
  %9959 = icmp eq i8 %9957, 0
  br i1 %9959, label %9960, label %9963

9960:                                             ; preds = %9955
  %9961 = shl nuw nsw i64 %9956, 4
  %9962 = getelementptr inbounds i8, i8* %0, i64 %9961
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9962, i8 0, i64 16, i1 false)
  br label %9963

9963:                                             ; preds = %9960, %9955
  %9964 = add nuw nsw i64 %.01, 1245
  %9965 = call zeroext i8 @randombit()
  %9966 = getelementptr inbounds i8, i8* %1, i64 %9964
  store i8 %9965, i8* %9966, align 1
  %9967 = icmp eq i8 %9965, 0
  br i1 %9967, label %9968, label %9971

9968:                                             ; preds = %9963
  %9969 = shl nuw nsw i64 %9964, 4
  %9970 = getelementptr inbounds i8, i8* %0, i64 %9969
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9970, i8 0, i64 16, i1 false)
  br label %9971

9971:                                             ; preds = %9968, %9963
  %9972 = add nuw nsw i64 %.01, 1246
  %9973 = call zeroext i8 @randombit()
  %9974 = getelementptr inbounds i8, i8* %1, i64 %9972
  store i8 %9973, i8* %9974, align 1
  %9975 = icmp eq i8 %9973, 0
  br i1 %9975, label %9976, label %9979

9976:                                             ; preds = %9971
  %9977 = shl nuw nsw i64 %9972, 4
  %9978 = getelementptr inbounds i8, i8* %0, i64 %9977
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9978, i8 0, i64 16, i1 false)
  br label %9979

9979:                                             ; preds = %9976, %9971
  %9980 = add nuw nsw i64 %.01, 1247
  %9981 = call zeroext i8 @randombit()
  %9982 = getelementptr inbounds i8, i8* %1, i64 %9980
  store i8 %9981, i8* %9982, align 1
  %9983 = icmp eq i8 %9981, 0
  br i1 %9983, label %9984, label %9987

9984:                                             ; preds = %9979
  %9985 = shl nuw nsw i64 %9980, 4
  %9986 = getelementptr inbounds i8, i8* %0, i64 %9985
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9986, i8 0, i64 16, i1 false)
  br label %9987

9987:                                             ; preds = %9984, %9979
  %9988 = add nuw nsw i64 %.01, 1248
  %9989 = call zeroext i8 @randombit()
  %9990 = getelementptr inbounds i8, i8* %1, i64 %9988
  store i8 %9989, i8* %9990, align 1
  %9991 = icmp eq i8 %9989, 0
  br i1 %9991, label %9992, label %9995

9992:                                             ; preds = %9987
  %9993 = shl nuw nsw i64 %9988, 4
  %9994 = getelementptr inbounds i8, i8* %0, i64 %9993
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %9994, i8 0, i64 16, i1 false)
  br label %9995

9995:                                             ; preds = %9992, %9987
  %9996 = add nuw nsw i64 %.01, 1249
  %9997 = call zeroext i8 @randombit()
  %9998 = getelementptr inbounds i8, i8* %1, i64 %9996
  store i8 %9997, i8* %9998, align 1
  %9999 = icmp eq i8 %9997, 0
  br i1 %9999, label %10000, label %10003

10000:                                            ; preds = %9995
  %10001 = shl nuw nsw i64 %9996, 4
  %10002 = getelementptr inbounds i8, i8* %0, i64 %10001
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(16) %10002, i8 0, i64 16, i1 false)
  br label %10003

10003:                                            ; preds = %10000, %9995
  %10004 = add nuw nsw i64 %.01, 1250
  %exitcond.1249 = icmp eq i64 %10004, 100000
  br i1 %exitcond.1249, label %15, label %3, !llvm.loop !4
}

; Function Attrs: nounwind
define void @br_md5_init(%struct.br_md5_context* nocapture %0, i64 %N) #3 {
  %2 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 0
  store %struct.br_hash_class_* @br_md5_vtable, %struct.br_hash_class_** %2, align 8
  %3 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 0
  %4 = bitcast i32* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %4, i8* nonnull align 16 dereferenceable(16) bitcast ([4 x i32]* @br_md5_IV to i8*), i64 16, i1 false)
  %5 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 2
  store i64 0, i64* %5, align 8
  ret void
}

; Function Attrs: nounwind
define void @br_md5_update(%struct.br_md5_context* nocapture %0, i64 %N, i8* nocapture readonly %1, i64 %N1, i64 %2) #3 {
  %4 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 2
  %5 = icmp eq i64 %2, 0
  br i1 %5, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  %6 = load i64, i64* %4, align 8
  %7 = and i64 %6, 63
  %8 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 1, i64 0
  %9 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 0
  %10 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 0
  %11 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 0
  %12 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 0
  %13 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 0
  %14 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 0
  %15 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 0
  %16 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 0
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %118
  %.016 = phi i64 [ %.1.7, %118 ], [ %7, %.lr.ph.preheader ]
  %.025 = phi i64 [ %113, %118 ], [ %2, %.lr.ph.preheader ]
  %.034 = phi i8* [ %112, %118 ], [ %1, %.lr.ph.preheader ]
  %17 = sub i64 64, %.016
  %18 = icmp ugt i64 %17, %.025
  %spec.select = select i1 %18, i64 %.025, i64 %17
  %19 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 1, i64 %.016
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %19, i8* align 1 %.034, i64 %spec.select, i1 false)
  %20 = add i64 %spec.select, %.016
  %21 = getelementptr inbounds i8, i8* %.034, i64 %spec.select
  %22 = sub i64 %.025, %spec.select
  %23 = load i64, i64* %4, align 8
  %24 = add i64 %23, %spec.select
  store i64 %24, i64* %4, align 8
  %25 = icmp eq i64 %20, 64
  br i1 %25, label %26, label %27

26:                                               ; preds = %.lr.ph
  call void @br_md5_round(i8* nonnull %8, i64 %N, i32* nonnull %9, i64 undef)
  br label %27

27:                                               ; preds = %26, %.lr.ph
  %.1 = phi i64 [ 0, %26 ], [ %20, %.lr.ph ]
  %28 = icmp eq i64 %22, 0
  br i1 %28, label %._crit_edge, label %29

._crit_edge:                                      ; preds = %118, %105, %92, %79, %66, %53, %40, %27, %3
  ret void

29:                                               ; preds = %27
  %30 = sub i64 64, %.1
  %31 = icmp ugt i64 %30, %22
  %spec.select.1 = select i1 %31, i64 %22, i64 %30
  %32 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 1, i64 %.1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %32, i8* align 1 %21, i64 %spec.select.1, i1 false)
  %33 = add i64 %spec.select.1, %.1
  %34 = getelementptr inbounds i8, i8* %21, i64 %spec.select.1
  %35 = sub i64 %22, %spec.select.1
  %36 = load i64, i64* %4, align 8
  %37 = add i64 %36, %spec.select.1
  store i64 %37, i64* %4, align 8
  %38 = icmp eq i64 %33, 64
  br i1 %38, label %39, label %40

39:                                               ; preds = %29
  call void @br_md5_round(i8* nonnull %8, i64 %N, i32* nonnull %10, i64 undef)
  br label %40

40:                                               ; preds = %39, %29
  %.1.1 = phi i64 [ 0, %39 ], [ %33, %29 ]
  %41 = icmp eq i64 %35, 0
  br i1 %41, label %._crit_edge, label %42

42:                                               ; preds = %40
  %43 = sub i64 64, %.1.1
  %44 = icmp ugt i64 %43, %35
  %spec.select.2 = select i1 %44, i64 %35, i64 %43
  %45 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 1, i64 %.1.1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %45, i8* align 1 %34, i64 %spec.select.2, i1 false)
  %46 = add i64 %spec.select.2, %.1.1
  %47 = getelementptr inbounds i8, i8* %34, i64 %spec.select.2
  %48 = sub i64 %35, %spec.select.2
  %49 = load i64, i64* %4, align 8
  %50 = add i64 %49, %spec.select.2
  store i64 %50, i64* %4, align 8
  %51 = icmp eq i64 %46, 64
  br i1 %51, label %52, label %53

52:                                               ; preds = %42
  call void @br_md5_round(i8* nonnull %8, i64 %N, i32* nonnull %11, i64 undef)
  br label %53

53:                                               ; preds = %52, %42
  %.1.2 = phi i64 [ 0, %52 ], [ %46, %42 ]
  %54 = icmp eq i64 %48, 0
  br i1 %54, label %._crit_edge, label %55

55:                                               ; preds = %53
  %56 = sub i64 64, %.1.2
  %57 = icmp ugt i64 %56, %48
  %spec.select.3 = select i1 %57, i64 %48, i64 %56
  %58 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 1, i64 %.1.2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %58, i8* align 1 %47, i64 %spec.select.3, i1 false)
  %59 = add i64 %spec.select.3, %.1.2
  %60 = getelementptr inbounds i8, i8* %47, i64 %spec.select.3
  %61 = sub i64 %48, %spec.select.3
  %62 = load i64, i64* %4, align 8
  %63 = add i64 %62, %spec.select.3
  store i64 %63, i64* %4, align 8
  %64 = icmp eq i64 %59, 64
  br i1 %64, label %65, label %66

65:                                               ; preds = %55
  call void @br_md5_round(i8* nonnull %8, i64 %N, i32* nonnull %12, i64 undef)
  br label %66

66:                                               ; preds = %65, %55
  %.1.3 = phi i64 [ 0, %65 ], [ %59, %55 ]
  %67 = icmp eq i64 %61, 0
  br i1 %67, label %._crit_edge, label %68

68:                                               ; preds = %66
  %69 = sub i64 64, %.1.3
  %70 = icmp ugt i64 %69, %61
  %spec.select.4 = select i1 %70, i64 %61, i64 %69
  %71 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 1, i64 %.1.3
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %71, i8* align 1 %60, i64 %spec.select.4, i1 false)
  %72 = add i64 %spec.select.4, %.1.3
  %73 = getelementptr inbounds i8, i8* %60, i64 %spec.select.4
  %74 = sub i64 %61, %spec.select.4
  %75 = load i64, i64* %4, align 8
  %76 = add i64 %75, %spec.select.4
  store i64 %76, i64* %4, align 8
  %77 = icmp eq i64 %72, 64
  br i1 %77, label %78, label %79

78:                                               ; preds = %68
  call void @br_md5_round(i8* nonnull %8, i64 %N, i32* nonnull %13, i64 undef)
  br label %79

79:                                               ; preds = %78, %68
  %.1.4 = phi i64 [ 0, %78 ], [ %72, %68 ]
  %80 = icmp eq i64 %74, 0
  br i1 %80, label %._crit_edge, label %81

81:                                               ; preds = %79
  %82 = sub i64 64, %.1.4
  %83 = icmp ugt i64 %82, %74
  %spec.select.5 = select i1 %83, i64 %74, i64 %82
  %84 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 1, i64 %.1.4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %84, i8* align 1 %73, i64 %spec.select.5, i1 false)
  %85 = add i64 %spec.select.5, %.1.4
  %86 = getelementptr inbounds i8, i8* %73, i64 %spec.select.5
  %87 = sub i64 %74, %spec.select.5
  %88 = load i64, i64* %4, align 8
  %89 = add i64 %88, %spec.select.5
  store i64 %89, i64* %4, align 8
  %90 = icmp eq i64 %85, 64
  br i1 %90, label %91, label %92

91:                                               ; preds = %81
  call void @br_md5_round(i8* nonnull %8, i64 %N, i32* nonnull %14, i64 undef)
  br label %92

92:                                               ; preds = %91, %81
  %.1.5 = phi i64 [ 0, %91 ], [ %85, %81 ]
  %93 = icmp eq i64 %87, 0
  br i1 %93, label %._crit_edge, label %94

94:                                               ; preds = %92
  %95 = sub i64 64, %.1.5
  %96 = icmp ugt i64 %95, %87
  %spec.select.6 = select i1 %96, i64 %87, i64 %95
  %97 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 1, i64 %.1.5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %97, i8* align 1 %86, i64 %spec.select.6, i1 false)
  %98 = add i64 %spec.select.6, %.1.5
  %99 = getelementptr inbounds i8, i8* %86, i64 %spec.select.6
  %100 = sub i64 %87, %spec.select.6
  %101 = load i64, i64* %4, align 8
  %102 = add i64 %101, %spec.select.6
  store i64 %102, i64* %4, align 8
  %103 = icmp eq i64 %98, 64
  br i1 %103, label %104, label %105

104:                                              ; preds = %94
  call void @br_md5_round(i8* nonnull %8, i64 %N, i32* nonnull %15, i64 undef)
  br label %105

105:                                              ; preds = %104, %94
  %.1.6 = phi i64 [ 0, %104 ], [ %98, %94 ]
  %106 = icmp eq i64 %100, 0
  br i1 %106, label %._crit_edge, label %107

107:                                              ; preds = %105
  %108 = sub i64 64, %.1.6
  %109 = icmp ugt i64 %108, %100
  %spec.select.7 = select i1 %109, i64 %100, i64 %108
  %110 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 1, i64 %.1.6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %110, i8* align 1 %99, i64 %spec.select.7, i1 false)
  %111 = add i64 %spec.select.7, %.1.6
  %112 = getelementptr inbounds i8, i8* %99, i64 %spec.select.7
  %113 = sub i64 %100, %spec.select.7
  %114 = load i64, i64* %4, align 8
  %115 = add i64 %114, %spec.select.7
  store i64 %115, i64* %4, align 8
  %116 = icmp eq i64 %111, 64
  br i1 %116, label %117, label %118

117:                                              ; preds = %107
  call void @br_md5_round(i8* nonnull %8, i64 %N, i32* nonnull %16, i64 undef)
  br label %118

118:                                              ; preds = %117, %107
  %.1.7 = phi i64 [ 0, %117 ], [ %111, %107 ]
  %119 = icmp eq i64 %113, 0
  br i1 %119, label %._crit_edge, label %.lr.ph, !llvm.loop !6
}

; Function Attrs: nounwind
define void @br_md5_out(%struct.br_md5_context* nocapture readonly %0, i64 %N, i8* nocapture %1, i64 %N1) #3 {
  %3 = alloca [64 x i8], align 16
  %4 = alloca [4 x i32], align 16
  %5 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 2
  %6 = load i64, i64* %5, align 8
  %7 = and i64 %6, 63
  %8 = getelementptr inbounds [64 x i8], [64 x i8]* %3, i64 0, i64 0
  %9 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %8, i8* nonnull align 8 %9, i64 %7, i1 false)
  %10 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 0, i64 0
  %11 = bitcast [4 x i32]* %4 to i8*
  %12 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 0
  %13 = bitcast i32* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(16) %11, i8* nonnull align 8 dereferenceable(16) %13, i64 16, i1 false)
  %14 = add nuw nsw i64 %7, 1
  %15 = getelementptr inbounds [64 x i8], [64 x i8]* %3, i64 0, i64 %7
  store i8 -128, i8* %15, align 1
  %16 = icmp ugt i64 %7, 55
  %17 = getelementptr inbounds [64 x i8], [64 x i8]* %3, i64 0, i64 %14
  br i1 %16, label %18, label %20

18:                                               ; preds = %2
  %19 = xor i64 %7, 63
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 %17, i8 0, i64 %19, i1 false)
  call void @br_md5_round(i8* nonnull %8, i64 64, i32* nonnull %10, i64 undef)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(56) %8, i8 0, i64 56, i1 false)
  br label %22

20:                                               ; preds = %2
  %21 = sub nsw i64 55, %7
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 %17, i8 0, i64 %21, i1 false)
  br label %22

22:                                               ; preds = %20, %18
  %23 = getelementptr inbounds [64 x i8], [64 x i8]* %3, i64 0, i64 56
  %24 = load i64, i64* %5, align 8
  %25 = shl i64 %24, 3
  %26 = bitcast i8* %23 to i64*
  store i64 %25, i64* %26, align 8
  call void @br_md5_round(i8* nonnull %8, i64 64, i32* nonnull %10, i64 undef)
  %prol.iter.sub.i.1 = add nsw i64 4, -1
  br label %.prol.preheader.i

.prol.preheader.i:                                ; preds = %.prol.preheader.i..prol.preheader.i_crit_edge, %22
  %.04.prol.i = phi i8* [ %30, %.prol.preheader.i..prol.preheader.i_crit_edge ], [ %1, %22 ]
  %.013.prol.i = phi i32* [ %27, %.prol.preheader.i..prol.preheader.i_crit_edge ], [ %10, %22 ]
  %prol.iter.sub.i.phi = phi i64 [ %prol.iter.sub.i.0, %.prol.preheader.i..prol.preheader.i_crit_edge ], [ %prol.iter.sub.i.1, %22 ]
  %27 = getelementptr inbounds i32, i32* %.013.prol.i, i64 1
  %28 = load i32, i32* %.013.prol.i, align 4
  %29 = bitcast i8* %.04.prol.i to i32*
  store i32 %28, i32* %29, align 4
  %30 = getelementptr inbounds i8, i8* %.04.prol.i, i64 4
  %prol.iter.cmp.i = icmp eq i64 %prol.iter.sub.i.phi, 0
  br i1 %prol.iter.cmp.i, label %br_range_enc32le.exit, label %.prol.preheader.i..prol.preheader.i_crit_edge, !llvm.loop !7

.prol.preheader.i..prol.preheader.i_crit_edge:    ; preds = %.prol.preheader.i
  %prol.iter.sub.i.0 = add nsw i64 %prol.iter.sub.i.phi, -1
  br label %.prol.preheader.i

br_range_enc32le.exit:                            ; preds = %.prol.preheader.i
  ret void
}

; Function Attrs: nofree norecurse nounwind
define i64 @br_md5_state(%struct.br_md5_context* nocapture readonly %0, i64 %N, i8* nocapture %1, i64 %N1) #4 {
  %3 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 0
  %prol.iter.sub.i.1 = add nsw i64 4, -1
  br label %.prol.preheader.i

.prol.preheader.i:                                ; preds = %.prol.preheader.i..prol.preheader.i_crit_edge, %2
  %.04.prol.i = phi i8* [ %7, %.prol.preheader.i..prol.preheader.i_crit_edge ], [ %1, %2 ]
  %.013.prol.i = phi i32* [ %4, %.prol.preheader.i..prol.preheader.i_crit_edge ], [ %3, %2 ]
  %prol.iter.sub.i.phi = phi i64 [ %prol.iter.sub.i.0, %.prol.preheader.i..prol.preheader.i_crit_edge ], [ %prol.iter.sub.i.1, %2 ]
  %4 = getelementptr inbounds i32, i32* %.013.prol.i, i64 1
  %5 = load i32, i32* %.013.prol.i, align 4
  %6 = bitcast i8* %.04.prol.i to i32*
  store i32 %5, i32* %6, align 4
  %7 = getelementptr inbounds i8, i8* %.04.prol.i, i64 4
  %prol.iter.cmp.i = icmp eq i64 %prol.iter.sub.i.phi, 0
  br i1 %prol.iter.cmp.i, label %br_range_enc32le.exit, label %.prol.preheader.i..prol.preheader.i_crit_edge, !llvm.loop !7

.prol.preheader.i..prol.preheader.i_crit_edge:    ; preds = %.prol.preheader.i
  %prol.iter.sub.i.0 = add nsw i64 %prol.iter.sub.i.phi, -1
  br label %.prol.preheader.i

br_range_enc32le.exit:                            ; preds = %.prol.preheader.i
  %8 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 2
  %9 = load i64, i64* %8, align 8
  ret i64 %9
}

; Function Attrs: nofree norecurse nounwind
define void @br_md5_set_state(%struct.br_md5_context* nocapture %0, i64 %N, i8* nocapture readonly %1, i64 %N1, i64 %2) #4 {
  %4 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 0
  %5 = bitcast i8* %1 to i32*
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 1
  store i32 %6, i32* %4, align 4
  %8 = getelementptr inbounds i8, i8* %1, i64 4
  %9 = bitcast i8* %8 to i32*
  %10 = load i32, i32* %9, align 4
  %11 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 2
  store i32 %10, i32* %7, align 4
  %12 = getelementptr inbounds i8, i8* %1, i64 8
  %13 = bitcast i8* %12 to i32*
  %14 = load i32, i32* %13, align 4
  %15 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 3
  store i32 %14, i32* %11, align 4
  %16 = getelementptr inbounds i8, i8* %1, i64 12
  %17 = bitcast i8* %16 to i32*
  %18 = load i32, i32* %17, align 4
  %19 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 4
  store i32 %18, i32* %15, align 4
  %20 = getelementptr inbounds i8, i8* %1, i64 16
  %21 = bitcast i8* %20 to i32*
  %22 = load i32, i32* %21, align 4
  %23 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 5
  store i32 %22, i32* %19, align 4
  %24 = getelementptr inbounds i8, i8* %1, i64 20
  %25 = bitcast i8* %24 to i32*
  %26 = load i32, i32* %25, align 4
  %27 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 6
  store i32 %26, i32* %23, align 4
  %28 = getelementptr inbounds i8, i8* %1, i64 24
  %29 = bitcast i8* %28 to i32*
  %30 = load i32, i32* %29, align 4
  %31 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 7
  store i32 %30, i32* %27, align 4
  %32 = getelementptr inbounds i8, i8* %1, i64 28
  %33 = bitcast i8* %32 to i32*
  %34 = load i32, i32* %33, align 4
  %35 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 8
  store i32 %34, i32* %31, align 4
  %36 = getelementptr inbounds i8, i8* %1, i64 32
  %37 = bitcast i8* %36 to i32*
  %38 = load i32, i32* %37, align 4
  %39 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 9
  store i32 %38, i32* %35, align 4
  %40 = getelementptr inbounds i8, i8* %1, i64 36
  %41 = bitcast i8* %40 to i32*
  %42 = load i32, i32* %41, align 4
  %43 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 10
  store i32 %42, i32* %39, align 4
  %44 = getelementptr inbounds i8, i8* %1, i64 40
  %45 = bitcast i8* %44 to i32*
  %46 = load i32, i32* %45, align 4
  %47 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 11
  store i32 %46, i32* %43, align 4
  %48 = getelementptr inbounds i8, i8* %1, i64 44
  %49 = bitcast i8* %48 to i32*
  %50 = load i32, i32* %49, align 4
  %51 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 12
  store i32 %50, i32* %47, align 4
  %52 = getelementptr inbounds i8, i8* %1, i64 48
  %53 = bitcast i8* %52 to i32*
  %54 = load i32, i32* %53, align 4
  %55 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 13
  store i32 %54, i32* %51, align 4
  %56 = getelementptr inbounds i8, i8* %1, i64 52
  %57 = bitcast i8* %56 to i32*
  %58 = load i32, i32* %57, align 4
  %59 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 14
  store i32 %58, i32* %55, align 4
  %60 = getelementptr inbounds i8, i8* %1, i64 56
  %61 = bitcast i8* %60 to i32*
  %62 = load i32, i32* %61, align 4
  %63 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 3, i64 15
  store i32 %62, i32* %59, align 4
  %64 = getelementptr inbounds i8, i8* %1, i64 60
  %65 = bitcast i8* %64 to i32*
  %66 = load i32, i32* %65, align 4
  store i32 %66, i32* %63, align 4
  %67 = getelementptr inbounds %struct.br_md5_context, %struct.br_md5_context* %0, i64 0, i32 2
  store i64 %2, i64* %67, align 8
  ret void
}

; Function Attrs: nofree norecurse nounwind
define void @br_md5_round(i8* nocapture readonly %0, i64 %N, i32* nocapture %1, i64 %N1) local_unnamed_addr #4 {
.preheader18:
  %2 = load i32, i32* %1, align 4
  %3 = getelementptr inbounds i32, i32* %1, i64 1
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr inbounds i32, i32* %1, i64 2
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds i32, i32* %1, i64 3
  %8 = load i32, i32* %7, align 4
  %9 = bitcast i8* %0 to i32*
  %10 = load i32, i32* %9, align 4
  %11 = getelementptr inbounds i8, i8* %0, i64 4
  %12 = bitcast i8* %11 to i32*
  %13 = load i32, i32* %12, align 4
  %14 = getelementptr inbounds i8, i8* %0, i64 8
  %15 = bitcast i8* %14 to i32*
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds i8, i8* %0, i64 12
  %18 = bitcast i8* %17 to i32*
  %19 = load i32, i32* %18, align 4
  %20 = getelementptr inbounds i8, i8* %0, i64 16
  %21 = bitcast i8* %20 to i32*
  %22 = load i32, i32* %21, align 4
  %23 = getelementptr inbounds i8, i8* %0, i64 20
  %24 = bitcast i8* %23 to i32*
  %25 = load i32, i32* %24, align 4
  %26 = getelementptr inbounds i8, i8* %0, i64 24
  %27 = bitcast i8* %26 to i32*
  %28 = load i32, i32* %27, align 4
  %29 = getelementptr inbounds i8, i8* %0, i64 28
  %30 = bitcast i8* %29 to i32*
  %31 = load i32, i32* %30, align 4
  %32 = getelementptr inbounds i8, i8* %0, i64 32
  %33 = bitcast i8* %32 to i32*
  %34 = load i32, i32* %33, align 4
  %35 = getelementptr inbounds i8, i8* %0, i64 36
  %36 = bitcast i8* %35 to i32*
  %37 = load i32, i32* %36, align 4
  %38 = getelementptr inbounds i8, i8* %0, i64 40
  %39 = bitcast i8* %38 to i32*
  %40 = load i32, i32* %39, align 4
  %41 = getelementptr inbounds i8, i8* %0, i64 44
  %42 = bitcast i8* %41 to i32*
  %43 = load i32, i32* %42, align 4
  %44 = getelementptr inbounds i8, i8* %0, i64 48
  %45 = bitcast i8* %44 to i32*
  %46 = load i32, i32* %45, align 4
  %47 = getelementptr inbounds i8, i8* %0, i64 52
  %48 = bitcast i8* %47 to i32*
  %49 = load i32, i32* %48, align 4
  %50 = getelementptr inbounds i8, i8* %0, i64 56
  %51 = bitcast i8* %50 to i32*
  %52 = load i32, i32* %51, align 4
  %53 = getelementptr inbounds i8, i8* %0, i64 60
  %54 = bitcast i8* %53 to i32*
  %55 = load i32, i32* %54, align 4
  %56 = xor i32 %8, %6
  %57 = and i32 %56, %4
  %58 = xor i32 %57, %8
  %59 = add i32 %2, -680876936
  %60 = add i32 %59, %10
  %61 = add i32 %60, %58
  %62 = shl i32 %61, 7
  %63 = lshr i32 %61, 25
  %64 = or i32 %62, %63
  %65 = add i32 %64, %4
  %66 = xor i32 %6, %4
  %67 = and i32 %65, %66
  %68 = xor i32 %67, %6
  %69 = add i32 %8, -389564586
  %70 = add i32 %69, %13
  %71 = add i32 %70, %68
  %72 = shl i32 %71, 12
  %73 = lshr i32 %71, 20
  %74 = or i32 %72, %73
  %75 = add i32 %74, %65
  %76 = xor i32 %65, %4
  %77 = and i32 %75, %76
  %78 = xor i32 %77, %4
  %79 = add i32 %6, 606105819
  %80 = add i32 %79, %16
  %81 = add i32 %80, %78
  %82 = shl i32 %81, 17
  %83 = lshr i32 %81, 15
  %84 = or i32 %82, %83
  %85 = add i32 %84, %75
  %86 = xor i32 %75, %65
  %87 = and i32 %85, %86
  %88 = xor i32 %87, %65
  %89 = add i32 %4, -1044525330
  %90 = add i32 %89, %19
  %91 = add i32 %90, %88
  %92 = shl i32 %91, 22
  %93 = lshr i32 %91, 10
  %94 = or i32 %92, %93
  %95 = add i32 %94, %85
  %96 = xor i32 %85, %75
  %97 = and i32 %95, %96
  %98 = xor i32 %97, %75
  %99 = add i32 %22, -176418897
  %100 = add i32 %99, %65
  %101 = add i32 %100, %98
  %102 = shl i32 %101, 7
  %103 = lshr i32 %101, 25
  %104 = or i32 %102, %103
  %105 = add i32 %104, %95
  %106 = xor i32 %95, %85
  %107 = and i32 %105, %106
  %108 = xor i32 %107, %85
  %109 = add i32 %25, 1200080426
  %110 = add i32 %109, %75
  %111 = add i32 %110, %108
  %112 = shl i32 %111, 12
  %113 = lshr i32 %111, 20
  %114 = or i32 %112, %113
  %115 = add i32 %114, %105
  %116 = xor i32 %105, %95
  %117 = and i32 %115, %116
  %118 = xor i32 %117, %95
  %119 = add i32 %28, -1473231341
  %120 = add i32 %119, %85
  %121 = add i32 %120, %118
  %122 = shl i32 %121, 17
  %123 = lshr i32 %121, 15
  %124 = or i32 %122, %123
  %125 = add i32 %124, %115
  %126 = xor i32 %115, %105
  %127 = and i32 %125, %126
  %128 = xor i32 %127, %105
  %129 = add i32 %31, -45705983
  %130 = add i32 %129, %95
  %131 = add i32 %130, %128
  %132 = shl i32 %131, 22
  %133 = lshr i32 %131, 10
  %134 = or i32 %132, %133
  %135 = add i32 %134, %125
  %136 = xor i32 %125, %115
  %137 = and i32 %135, %136
  %138 = xor i32 %137, %115
  %139 = add i32 %34, 1770035416
  %140 = add i32 %139, %105
  %141 = add i32 %140, %138
  %142 = shl i32 %141, 7
  %143 = lshr i32 %141, 25
  %144 = or i32 %142, %143
  %145 = add i32 %144, %135
  %146 = xor i32 %135, %125
  %147 = and i32 %145, %146
  %148 = xor i32 %147, %125
  %149 = add i32 %37, -1958414417
  %150 = add i32 %149, %115
  %151 = add i32 %150, %148
  %152 = shl i32 %151, 12
  %153 = lshr i32 %151, 20
  %154 = or i32 %152, %153
  %155 = add i32 %154, %145
  %156 = xor i32 %145, %135
  %157 = and i32 %155, %156
  %158 = xor i32 %157, %135
  %159 = add i32 %40, -42063
  %160 = add i32 %159, %125
  %161 = add i32 %160, %158
  %162 = shl i32 %161, 17
  %163 = lshr i32 %161, 15
  %164 = or i32 %162, %163
  %165 = add i32 %164, %155
  %166 = xor i32 %155, %145
  %167 = and i32 %165, %166
  %168 = xor i32 %167, %145
  %169 = add i32 %43, -1990404162
  %170 = add i32 %169, %135
  %171 = add i32 %170, %168
  %172 = shl i32 %171, 22
  %173 = lshr i32 %171, 10
  %174 = or i32 %172, %173
  %175 = add i32 %174, %165
  %176 = xor i32 %165, %155
  %177 = and i32 %175, %176
  %178 = xor i32 %177, %155
  %179 = add i32 %46, 1804603682
  %180 = add i32 %179, %145
  %181 = add i32 %180, %178
  %182 = shl i32 %181, 7
  %183 = lshr i32 %181, 25
  %184 = or i32 %182, %183
  %185 = add i32 %184, %175
  %186 = xor i32 %175, %165
  %187 = and i32 %185, %186
  %188 = xor i32 %187, %165
  %189 = add i32 %49, -40341101
  %190 = add i32 %189, %155
  %191 = add i32 %190, %188
  %192 = shl i32 %191, 12
  %193 = lshr i32 %191, 20
  %194 = or i32 %192, %193
  %195 = add i32 %194, %185
  %196 = xor i32 %185, %175
  %197 = and i32 %195, %196
  %198 = xor i32 %197, %175
  %199 = add i32 %52, -1502002290
  %200 = add i32 %199, %165
  %201 = add i32 %200, %198
  %202 = shl i32 %201, 17
  %203 = lshr i32 %201, 15
  %204 = or i32 %202, %203
  %205 = add i32 %204, %195
  %206 = xor i32 %195, %185
  %207 = and i32 %205, %206
  %208 = xor i32 %207, %185
  %209 = add i32 %55, 1236535329
  %210 = add i32 %209, %175
  %211 = add i32 %210, %208
  %212 = shl i32 %211, 22
  %213 = lshr i32 %211, 10
  %214 = or i32 %212, %213
  %215 = add i32 %214, %205
  %216 = xor i32 %215, %205
  %217 = and i32 %216, %195
  %218 = xor i32 %217, %205
  %219 = add i32 %13, -165796510
  %220 = add i32 %219, %185
  %221 = add i32 %220, %218
  %222 = shl i32 %221, 5
  %223 = lshr i32 %221, 27
  %224 = or i32 %222, %223
  %225 = add i32 %224, %215
  %226 = xor i32 %225, %215
  %227 = and i32 %226, %205
  %228 = xor i32 %227, %215
  %229 = add i32 %28, -1069501632
  %230 = add i32 %229, %195
  %231 = add i32 %230, %228
  %232 = shl i32 %231, 9
  %233 = lshr i32 %231, 23
  %234 = or i32 %232, %233
  %235 = add i32 %234, %225
  %236 = xor i32 %235, %225
  %237 = and i32 %236, %215
  %238 = xor i32 %237, %225
  %239 = add i32 %43, 643717713
  %240 = add i32 %239, %205
  %241 = add i32 %240, %238
  %242 = shl i32 %241, 14
  %243 = lshr i32 %241, 18
  %244 = or i32 %242, %243
  %245 = add i32 %244, %235
  %246 = xor i32 %245, %235
  %247 = and i32 %246, %225
  %248 = xor i32 %247, %235
  %249 = add i32 %10, -373897302
  %250 = add i32 %249, %215
  %251 = add i32 %250, %248
  %252 = shl i32 %251, 20
  %253 = lshr i32 %251, 12
  %254 = or i32 %252, %253
  %255 = add i32 %254, %245
  %256 = xor i32 %255, %245
  %257 = and i32 %256, %235
  %258 = xor i32 %257, %245
  %259 = add i32 %25, -701558691
  %260 = add i32 %259, %225
  %261 = add i32 %260, %258
  %262 = shl i32 %261, 5
  %263 = lshr i32 %261, 27
  %264 = or i32 %262, %263
  %265 = add i32 %264, %255
  %266 = xor i32 %265, %255
  %267 = and i32 %266, %245
  %268 = xor i32 %267, %255
  %269 = add i32 %40, 38016083
  %270 = add i32 %269, %235
  %271 = add i32 %270, %268
  %272 = shl i32 %271, 9
  %273 = lshr i32 %271, 23
  %274 = or i32 %272, %273
  %275 = add i32 %274, %265
  %276 = xor i32 %275, %265
  %277 = and i32 %276, %255
  %278 = xor i32 %277, %265
  %279 = add i32 %55, -660478335
  %280 = add i32 %279, %245
  %281 = add i32 %280, %278
  %282 = shl i32 %281, 14
  %283 = lshr i32 %281, 18
  %284 = or i32 %282, %283
  %285 = add i32 %284, %275
  %286 = xor i32 %285, %275
  %287 = and i32 %286, %265
  %288 = xor i32 %287, %275
  %289 = add i32 %22, -405537848
  %290 = add i32 %289, %255
  %291 = add i32 %290, %288
  %292 = shl i32 %291, 20
  %293 = lshr i32 %291, 12
  %294 = or i32 %292, %293
  %295 = add i32 %294, %285
  %296 = xor i32 %295, %285
  %297 = and i32 %296, %275
  %298 = xor i32 %297, %285
  %299 = add i32 %37, 568446438
  %300 = add i32 %299, %265
  %301 = add i32 %300, %298
  %302 = shl i32 %301, 5
  %303 = lshr i32 %301, 27
  %304 = or i32 %302, %303
  %305 = add i32 %304, %295
  %306 = xor i32 %305, %295
  %307 = and i32 %306, %285
  %308 = xor i32 %307, %295
  %309 = add i32 %52, -1019803690
  %310 = add i32 %309, %275
  %311 = add i32 %310, %308
  %312 = shl i32 %311, 9
  %313 = lshr i32 %311, 23
  %314 = or i32 %312, %313
  %315 = add i32 %314, %305
  %316 = xor i32 %315, %305
  %317 = and i32 %316, %295
  %318 = xor i32 %317, %305
  %319 = add i32 %19, -187363961
  %320 = add i32 %319, %285
  %321 = add i32 %320, %318
  %322 = shl i32 %321, 14
  %323 = lshr i32 %321, 18
  %324 = or i32 %322, %323
  %325 = add i32 %324, %315
  %326 = xor i32 %325, %315
  %327 = and i32 %326, %305
  %328 = xor i32 %327, %315
  %329 = add i32 %34, 1163531501
  %330 = add i32 %329, %295
  %331 = add i32 %330, %328
  %332 = shl i32 %331, 20
  %333 = lshr i32 %331, 12
  %334 = or i32 %332, %333
  %335 = add i32 %334, %325
  %336 = xor i32 %335, %325
  %337 = and i32 %336, %315
  %338 = xor i32 %337, %325
  %339 = add i32 %49, -1444681467
  %340 = add i32 %339, %305
  %341 = add i32 %340, %338
  %342 = shl i32 %341, 5
  %343 = lshr i32 %341, 27
  %344 = or i32 %342, %343
  %345 = add i32 %344, %335
  %346 = xor i32 %345, %335
  %347 = and i32 %346, %325
  %348 = xor i32 %347, %335
  %349 = add i32 %16, -51403784
  %350 = add i32 %349, %315
  %351 = add i32 %350, %348
  %352 = shl i32 %351, 9
  %353 = lshr i32 %351, 23
  %354 = or i32 %352, %353
  %355 = add i32 %354, %345
  %356 = xor i32 %355, %345
  %357 = and i32 %356, %335
  %358 = xor i32 %357, %345
  %359 = add i32 %31, 1735328473
  %360 = add i32 %359, %325
  %361 = add i32 %360, %358
  %362 = shl i32 %361, 14
  %363 = lshr i32 %361, 18
  %364 = or i32 %362, %363
  %365 = add i32 %364, %355
  %366 = xor i32 %365, %355
  %367 = and i32 %366, %345
  %368 = xor i32 %367, %355
  %369 = add i32 %46, -1926607734
  %370 = add i32 %369, %335
  %371 = add i32 %370, %368
  %372 = shl i32 %371, 20
  %373 = lshr i32 %371, 12
  %374 = or i32 %372, %373
  %375 = add i32 %374, %365
  %376 = xor i32 %365, %355
  %377 = xor i32 %376, %375
  %378 = add i32 %25, -378558
  %379 = add i32 %378, %345
  %380 = add i32 %379, %377
  %381 = shl i32 %380, 4
  %382 = lshr i32 %380, 28
  %383 = or i32 %381, %382
  %384 = add i32 %383, %375
  %385 = xor i32 %375, %365
  %386 = xor i32 %385, %384
  %387 = add i32 %34, -2022574463
  %388 = add i32 %387, %355
  %389 = add i32 %388, %386
  %390 = shl i32 %389, 11
  %391 = lshr i32 %389, 21
  %392 = or i32 %390, %391
  %393 = add i32 %392, %384
  %394 = xor i32 %384, %375
  %395 = xor i32 %394, %393
  %396 = add i32 %43, 1839030562
  %397 = add i32 %396, %365
  %398 = add i32 %397, %395
  %399 = shl i32 %398, 16
  %400 = lshr i32 %398, 16
  %401 = or i32 %399, %400
  %402 = add i32 %401, %393
  %403 = xor i32 %393, %384
  %404 = xor i32 %403, %402
  %405 = add i32 %52, -35309556
  %406 = add i32 %405, %375
  %407 = add i32 %406, %404
  %408 = shl i32 %407, 23
  %409 = lshr i32 %407, 9
  %410 = or i32 %408, %409
  %411 = add i32 %410, %402
  %412 = xor i32 %402, %393
  %413 = xor i32 %412, %411
  %414 = add i32 %13, -1530992060
  %415 = add i32 %414, %384
  %416 = add i32 %415, %413
  %417 = shl i32 %416, 4
  %418 = lshr i32 %416, 28
  %419 = or i32 %417, %418
  %420 = add i32 %419, %411
  %421 = xor i32 %411, %402
  %422 = xor i32 %421, %420
  %423 = add i32 %22, 1272893353
  %424 = add i32 %423, %393
  %425 = add i32 %424, %422
  %426 = shl i32 %425, 11
  %427 = lshr i32 %425, 21
  %428 = or i32 %426, %427
  %429 = add i32 %428, %420
  %430 = xor i32 %420, %411
  %431 = xor i32 %430, %429
  %432 = add i32 %31, -155497632
  %433 = add i32 %432, %402
  %434 = add i32 %433, %431
  %435 = shl i32 %434, 16
  %436 = lshr i32 %434, 16
  %437 = or i32 %435, %436
  %438 = add i32 %437, %429
  %439 = xor i32 %429, %420
  %440 = xor i32 %439, %438
  %441 = add i32 %40, -1094730640
  %442 = add i32 %441, %411
  %443 = add i32 %442, %440
  %444 = shl i32 %443, 23
  %445 = lshr i32 %443, 9
  %446 = or i32 %444, %445
  %447 = add i32 %446, %438
  %448 = xor i32 %438, %429
  %449 = xor i32 %448, %447
  %450 = add i32 %49, 681279174
  %451 = add i32 %450, %420
  %452 = add i32 %451, %449
  %453 = shl i32 %452, 4
  %454 = lshr i32 %452, 28
  %455 = or i32 %453, %454
  %456 = add i32 %455, %447
  %457 = xor i32 %447, %438
  %458 = xor i32 %457, %456
  %459 = add i32 %10, -358537222
  %460 = add i32 %459, %429
  %461 = add i32 %460, %458
  %462 = shl i32 %461, 11
  %463 = lshr i32 %461, 21
  %464 = or i32 %462, %463
  %465 = add i32 %464, %456
  %466 = xor i32 %456, %447
  %467 = xor i32 %466, %465
  %468 = add i32 %19, -722521979
  %469 = add i32 %468, %438
  %470 = add i32 %469, %467
  %471 = shl i32 %470, 16
  %472 = lshr i32 %470, 16
  %473 = or i32 %471, %472
  %474 = add i32 %473, %465
  %475 = xor i32 %465, %456
  %476 = xor i32 %475, %474
  %477 = add i32 %28, 76029189
  %478 = add i32 %477, %447
  %479 = add i32 %478, %476
  %480 = shl i32 %479, 23
  %481 = lshr i32 %479, 9
  %482 = or i32 %480, %481
  %483 = add i32 %482, %474
  %484 = xor i32 %474, %465
  %485 = xor i32 %484, %483
  %486 = add i32 %37, -640364487
  %487 = add i32 %486, %456
  %488 = add i32 %487, %485
  %489 = shl i32 %488, 4
  %490 = lshr i32 %488, 28
  %491 = or i32 %489, %490
  %492 = add i32 %491, %483
  %493 = xor i32 %483, %474
  %494 = xor i32 %493, %492
  %495 = add i32 %46, -421815835
  %496 = add i32 %495, %465
  %497 = add i32 %496, %494
  %498 = shl i32 %497, 11
  %499 = lshr i32 %497, 21
  %500 = or i32 %498, %499
  %501 = add i32 %500, %492
  %502 = xor i32 %492, %483
  %503 = xor i32 %502, %501
  %504 = add i32 %55, 530742520
  %505 = add i32 %504, %474
  %506 = add i32 %505, %503
  %507 = shl i32 %506, 16
  %508 = lshr i32 %506, 16
  %509 = or i32 %507, %508
  %510 = add i32 %509, %501
  %511 = xor i32 %501, %492
  %512 = xor i32 %511, %510
  %513 = add i32 %16, -995338651
  %514 = add i32 %513, %483
  %515 = add i32 %514, %512
  %516 = shl i32 %515, 23
  %517 = lshr i32 %515, 9
  %518 = or i32 %516, %517
  %519 = add i32 %518, %510
  %520 = xor i32 %501, -1
  %521 = or i32 %519, %520
  %522 = xor i32 %521, %510
  %523 = add i32 %10, -198630844
  %524 = add i32 %523, %492
  %525 = add i32 %524, %522
  %526 = shl i32 %525, 6
  %527 = lshr i32 %525, 26
  %528 = or i32 %526, %527
  %529 = add i32 %528, %519
  %530 = xor i32 %510, -1
  %531 = or i32 %529, %530
  %532 = xor i32 %531, %519
  %533 = add i32 %31, 1126891415
  %534 = add i32 %533, %501
  %535 = add i32 %534, %532
  %536 = shl i32 %535, 10
  %537 = lshr i32 %535, 22
  %538 = or i32 %536, %537
  %539 = add i32 %538, %529
  %540 = xor i32 %519, -1
  %541 = or i32 %539, %540
  %542 = xor i32 %541, %529
  %543 = add i32 %52, -1416354905
  %544 = add i32 %543, %510
  %545 = add i32 %544, %542
  %546 = shl i32 %545, 15
  %547 = lshr i32 %545, 17
  %548 = or i32 %546, %547
  %549 = add i32 %548, %539
  %550 = xor i32 %529, -1
  %551 = or i32 %549, %550
  %552 = xor i32 %551, %539
  %553 = add i32 %25, -57434055
  %554 = add i32 %553, %519
  %555 = add i32 %554, %552
  %556 = shl i32 %555, 21
  %557 = lshr i32 %555, 11
  %558 = or i32 %556, %557
  %559 = add i32 %558, %549
  %560 = xor i32 %539, -1
  %561 = or i32 %559, %560
  %562 = xor i32 %561, %549
  %563 = add i32 %46, 1700485571
  %564 = add i32 %563, %529
  %565 = add i32 %564, %562
  %566 = shl i32 %565, 6
  %567 = lshr i32 %565, 26
  %568 = or i32 %566, %567
  %569 = add i32 %568, %559
  %570 = xor i32 %549, -1
  %571 = or i32 %569, %570
  %572 = xor i32 %571, %559
  %573 = add i32 %19, -1894986606
  %574 = add i32 %573, %539
  %575 = add i32 %574, %572
  %576 = shl i32 %575, 10
  %577 = lshr i32 %575, 22
  %578 = or i32 %576, %577
  %579 = add i32 %578, %569
  %580 = xor i32 %559, -1
  %581 = or i32 %579, %580
  %582 = xor i32 %581, %569
  %583 = add i32 %40, -1051523
  %584 = add i32 %583, %549
  %585 = add i32 %584, %582
  %586 = shl i32 %585, 15
  %587 = lshr i32 %585, 17
  %588 = or i32 %586, %587
  %589 = add i32 %588, %579
  %590 = xor i32 %569, -1
  %591 = or i32 %589, %590
  %592 = xor i32 %591, %579
  %593 = add i32 %13, -2054922799
  %594 = add i32 %593, %559
  %595 = add i32 %594, %592
  %596 = shl i32 %595, 21
  %597 = lshr i32 %595, 11
  %598 = or i32 %596, %597
  %599 = add i32 %598, %589
  %600 = xor i32 %579, -1
  %601 = or i32 %599, %600
  %602 = xor i32 %601, %589
  %603 = add i32 %34, 1873313359
  %604 = add i32 %603, %569
  %605 = add i32 %604, %602
  %606 = shl i32 %605, 6
  %607 = lshr i32 %605, 26
  %608 = or i32 %606, %607
  %609 = add i32 %608, %599
  %610 = xor i32 %589, -1
  %611 = or i32 %609, %610
  %612 = xor i32 %611, %599
  %613 = add i32 %55, -30611744
  %614 = add i32 %613, %579
  %615 = add i32 %614, %612
  %616 = shl i32 %615, 10
  %617 = lshr i32 %615, 22
  %618 = or i32 %616, %617
  %619 = add i32 %618, %609
  %620 = xor i32 %599, -1
  %621 = or i32 %619, %620
  %622 = xor i32 %621, %609
  %623 = add i32 %28, -1560198380
  %624 = add i32 %623, %589
  %625 = add i32 %624, %622
  %626 = shl i32 %625, 15
  %627 = lshr i32 %625, 17
  %628 = or i32 %626, %627
  %629 = add i32 %628, %619
  %630 = xor i32 %609, -1
  %631 = or i32 %629, %630
  %632 = xor i32 %631, %619
  %633 = add i32 %49, 1309151649
  %634 = add i32 %633, %599
  %635 = add i32 %634, %632
  %636 = shl i32 %635, 21
  %637 = lshr i32 %635, 11
  %638 = or i32 %636, %637
  %639 = add i32 %638, %629
  %640 = xor i32 %619, -1
  %641 = or i32 %639, %640
  %642 = xor i32 %641, %629
  %643 = add i32 %22, -145523070
  %644 = add i32 %643, %609
  %645 = add i32 %644, %642
  %646 = shl i32 %645, 6
  %647 = lshr i32 %645, 26
  %648 = or i32 %646, %647
  %649 = add i32 %648, %639
  %650 = xor i32 %629, -1
  %651 = or i32 %649, %650
  %652 = xor i32 %651, %639
  %653 = add i32 %43, -1120210379
  %654 = add i32 %653, %619
  %655 = add i32 %654, %652
  %656 = shl i32 %655, 10
  %657 = lshr i32 %655, 22
  %658 = or i32 %656, %657
  %659 = add i32 %658, %649
  %660 = xor i32 %639, -1
  %661 = or i32 %659, %660
  %662 = xor i32 %661, %649
  %663 = add i32 %16, 718787259
  %664 = add i32 %663, %629
  %665 = add i32 %664, %662
  %666 = shl i32 %665, 15
  %667 = lshr i32 %665, 17
  %668 = or i32 %666, %667
  %669 = add i32 %668, %659
  %670 = xor i32 %649, -1
  %671 = or i32 %669, %670
  %672 = xor i32 %671, %659
  %673 = add i32 %37, -343485551
  %674 = add i32 %673, %639
  %675 = add i32 %674, %672
  %676 = shl i32 %675, 21
  %677 = lshr i32 %675, 11
  %678 = or i32 %676, %677
  %679 = add i32 %649, %2
  store i32 %679, i32* %1, align 4
  %680 = load i32, i32* %3, align 4
  %681 = add i32 %669, %680
  %682 = add i32 %681, %678
  store i32 %682, i32* %3, align 4
  %683 = load i32, i32* %5, align 4
  %684 = add i32 %669, %683
  store i32 %684, i32* %5, align 4
  %685 = load i32, i32* %7, align 4
  %686 = add i32 %659, %685
  store i32 %686, i32* %7, align 4
  ret void
}

; Function Attrs: nofree norecurse nounwind
define void @br_range_enc32le(i8* nocapture %0, i64 %N, i32* nocapture readonly %1, i64 %N1, i64 %2) local_unnamed_addr #4 {
  %4 = add i64 %2, -1
  %5 = icmp eq i64 %2, 0
  br i1 %5, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %3
  %xtraiter = and i64 %2, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph, %.prol.preheader
  %.04.prol = phi i8* [ %9, %.prol.preheader ], [ %0, %.lr.ph ]
  %.013.prol = phi i32* [ %6, %.prol.preheader ], [ %1, %.lr.ph ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.lr.ph ]
  %6 = getelementptr inbounds i32, i32* %.013.prol, i64 1
  %7 = load i32, i32* %.013.prol, align 4
  %8 = bitcast i8* %.04.prol to i32*
  store i32 %7, i32* %8, align 4
  %9 = getelementptr inbounds i8, i8* %.04.prol, i64 4
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !7

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %10 = sub i64 %4, %xtraiter
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.loopexit
  %.unr = phi i64 [ %4, %.lr.ph ], [ %10, %.prol.loopexit.loopexit ]
  %.04.unr = phi i8* [ %0, %.lr.ph ], [ %9, %.prol.loopexit.loopexit ]
  %.013.unr = phi i32* [ %1, %.lr.ph ], [ %6, %.prol.loopexit.loopexit ]
  %11 = icmp ult i64 %4, 7
  br i1 %11, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit, %.lr.ph.new
  %12 = phi i64 [ %45, %.lr.ph.new ], [ %.unr, %.prol.loopexit ]
  %.04 = phi i8* [ %44, %.lr.ph.new ], [ %.04.unr, %.prol.loopexit ]
  %.013 = phi i32* [ %41, %.lr.ph.new ], [ %.013.unr, %.prol.loopexit ]
  %13 = getelementptr inbounds i32, i32* %.013, i64 1
  %14 = load i32, i32* %.013, align 4
  %15 = bitcast i8* %.04 to i32*
  store i32 %14, i32* %15, align 4
  %16 = getelementptr inbounds i8, i8* %.04, i64 4
  %17 = getelementptr inbounds i32, i32* %.013, i64 2
  %18 = load i32, i32* %13, align 4
  %19 = bitcast i8* %16 to i32*
  store i32 %18, i32* %19, align 4
  %20 = getelementptr inbounds i8, i8* %.04, i64 8
  %21 = getelementptr inbounds i32, i32* %.013, i64 3
  %22 = load i32, i32* %17, align 4
  %23 = bitcast i8* %20 to i32*
  store i32 %22, i32* %23, align 4
  %24 = getelementptr inbounds i8, i8* %.04, i64 12
  %25 = getelementptr inbounds i32, i32* %.013, i64 4
  %26 = load i32, i32* %21, align 4
  %27 = bitcast i8* %24 to i32*
  store i32 %26, i32* %27, align 4
  %28 = getelementptr inbounds i8, i8* %.04, i64 16
  %29 = getelementptr inbounds i32, i32* %.013, i64 5
  %30 = load i32, i32* %25, align 4
  %31 = bitcast i8* %28 to i32*
  store i32 %30, i32* %31, align 4
  %32 = getelementptr inbounds i8, i8* %.04, i64 20
  %33 = getelementptr inbounds i32, i32* %.013, i64 6
  %34 = load i32, i32* %29, align 4
  %35 = bitcast i8* %32 to i32*
  store i32 %34, i32* %35, align 4
  %36 = getelementptr inbounds i8, i8* %.04, i64 24
  %37 = getelementptr inbounds i32, i32* %.013, i64 7
  %38 = load i32, i32* %33, align 4
  %39 = bitcast i8* %36 to i32*
  store i32 %38, i32* %39, align 4
  %40 = getelementptr inbounds i8, i8* %.04, i64 28
  %41 = getelementptr inbounds i32, i32* %.013, i64 8
  %42 = load i32, i32* %37, align 4
  %43 = bitcast i8* %40 to i32*
  store i32 %42, i32* %43, align 4
  %44 = getelementptr inbounds i8, i8* %.04, i64 32
  %45 = add i64 %12, -8
  %46 = icmp eq i64 %12, 7
  br i1 %46, label %._crit_edge, label %.lr.ph.new, !llvm.loop !8

._crit_edge:                                      ; preds = %.lr.ph.new, %3, %.prol.loopexit
  ret void
}

; Function Attrs: nofree norecurse nounwind
define void @br_range_dec32le(i32* nocapture %0, i64 %N, i64 %1, i8* nocapture readonly %2, i64 %N1, i1 %.cond) local_unnamed_addr #4 {
  %shadow.sroa.0 = alloca i32, align 8
  %4 = bitcast i8* %2 to i32*
  %5 = load i32, i32* %4, align 4
  %6 = getelementptr inbounds i32, i32* %0, i64 1
  %7 = load i32, i32* %0, align 4
  %select.val. = select i1 %.cond, i32 %5, i32 %7
  store i32 %select.val., i32* %0, align 4
  %8 = getelementptr inbounds i8, i8* %2, i64 4
  %9 = bitcast i8* %8 to i32*
  %10 = load i32, i32* %9, align 4
  %11 = getelementptr inbounds i32, i32* %0, i64 2
  %12 = icmp sgt i64 %N, 1
  %safe. = or i1 %12, %.cond
  %select.ptr. = select i1 %safe., i32* %6, i32* %shadow.sroa.0
  %13 = load i32, i32* %6, align 4
  %select.val.2 = select i1 %.cond, i32 %10, i32 %13
  store i32 %select.val.2, i32* %select.ptr., align 4
  %14 = getelementptr inbounds i8, i8* %2, i64 8
  %15 = bitcast i8* %14 to i32*
  %16 = load i32, i32* %15, align 4
  %17 = getelementptr inbounds i32, i32* %0, i64 3
  %select.ptr.4 = select i1 %safe., i32* %11, i32* %shadow.sroa.0
  %18 = load i32, i32* %11, align 4
  %select.val.5 = select i1 %.cond, i32 %16, i32 %18
  store i32 %select.val.5, i32* %select.ptr.4, align 4
  %19 = getelementptr inbounds i8, i8* %2, i64 12
  %20 = bitcast i8* %19 to i32*
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds i32, i32* %0, i64 4
  %select.ptr.7 = select i1 %safe., i32* %17, i32* %shadow.sroa.0
  %23 = load i32, i32* %17, align 4
  %select.val.8 = select i1 %.cond, i32 %21, i32 %23
  store i32 %select.val.8, i32* %select.ptr.7, align 4
  %24 = getelementptr inbounds i8, i8* %2, i64 16
  %25 = bitcast i8* %24 to i32*
  %26 = load i32, i32* %25, align 4
  %27 = getelementptr inbounds i32, i32* %0, i64 5
  %select.ptr.10 = select i1 %safe., i32* %22, i32* %shadow.sroa.0
  %28 = load i32, i32* %22, align 4
  %select.val.11 = select i1 %.cond, i32 %26, i32 %28
  store i32 %select.val.11, i32* %select.ptr.10, align 4
  %29 = getelementptr inbounds i8, i8* %2, i64 20
  %30 = bitcast i8* %29 to i32*
  %31 = load i32, i32* %30, align 4
  %32 = getelementptr inbounds i32, i32* %0, i64 6
  %select.ptr.13 = select i1 %safe., i32* %27, i32* %shadow.sroa.0
  %33 = load i32, i32* %27, align 4
  %select.val.14 = select i1 %.cond, i32 %31, i32 %33
  store i32 %select.val.14, i32* %select.ptr.13, align 4
  %34 = getelementptr inbounds i8, i8* %2, i64 24
  %35 = bitcast i8* %34 to i32*
  %36 = load i32, i32* %35, align 4
  %37 = getelementptr inbounds i32, i32* %0, i64 7
  %select.ptr.16 = select i1 %safe., i32* %32, i32* %shadow.sroa.0
  %38 = load i32, i32* %32, align 4
  %select.val.17 = select i1 %.cond, i32 %36, i32 %38
  store i32 %select.val.17, i32* %select.ptr.16, align 4
  %39 = getelementptr inbounds i8, i8* %2, i64 28
  %40 = bitcast i8* %39 to i32*
  %41 = load i32, i32* %40, align 4
  %42 = getelementptr inbounds i32, i32* %0, i64 8
  %select.ptr.19 = select i1 %safe., i32* %37, i32* %shadow.sroa.0
  %43 = load i32, i32* %37, align 4
  %select.val.20 = select i1 %.cond, i32 %41, i32 %43
  store i32 %select.val.20, i32* %select.ptr.19, align 4
  %44 = getelementptr inbounds i8, i8* %2, i64 32
  %45 = bitcast i8* %44 to i32*
  %46 = load i32, i32* %45, align 4
  %47 = getelementptr inbounds i32, i32* %0, i64 9
  %select.ptr.22 = select i1 %safe., i32* %42, i32* %shadow.sroa.0
  %48 = load i32, i32* %42, align 4
  %select.val.23 = select i1 %.cond, i32 %46, i32 %48
  store i32 %select.val.23, i32* %select.ptr.22, align 4
  %49 = getelementptr inbounds i8, i8* %2, i64 36
  %50 = bitcast i8* %49 to i32*
  %51 = load i32, i32* %50, align 4
  %52 = getelementptr inbounds i32, i32* %0, i64 10
  %select.ptr.25 = select i1 %safe., i32* %47, i32* %shadow.sroa.0
  %53 = load i32, i32* %47, align 4
  %select.val.26 = select i1 %.cond, i32 %51, i32 %53
  store i32 %select.val.26, i32* %select.ptr.25, align 4
  %54 = getelementptr inbounds i8, i8* %2, i64 40
  %55 = bitcast i8* %54 to i32*
  %56 = load i32, i32* %55, align 4
  %57 = getelementptr inbounds i32, i32* %0, i64 11
  %select.ptr.28 = select i1 %safe., i32* %52, i32* %shadow.sroa.0
  %58 = load i32, i32* %52, align 4
  %select.val.29 = select i1 %.cond, i32 %56, i32 %58
  store i32 %select.val.29, i32* %select.ptr.28, align 4
  %59 = getelementptr inbounds i8, i8* %2, i64 44
  %60 = bitcast i8* %59 to i32*
  %61 = load i32, i32* %60, align 4
  %62 = getelementptr inbounds i32, i32* %0, i64 12
  %select.ptr.31 = select i1 %safe., i32* %57, i32* %shadow.sroa.0
  %63 = load i32, i32* %57, align 4
  %select.val.32 = select i1 %.cond, i32 %61, i32 %63
  store i32 %select.val.32, i32* %select.ptr.31, align 4
  %64 = getelementptr inbounds i8, i8* %2, i64 48
  %65 = bitcast i8* %64 to i32*
  %66 = load i32, i32* %65, align 4
  %67 = getelementptr inbounds i32, i32* %0, i64 13
  %select.ptr.34 = select i1 %safe., i32* %62, i32* %shadow.sroa.0
  %68 = load i32, i32* %62, align 4
  %select.val.35 = select i1 %.cond, i32 %66, i32 %68
  store i32 %select.val.35, i32* %select.ptr.34, align 4
  %69 = getelementptr inbounds i8, i8* %2, i64 52
  %70 = bitcast i8* %69 to i32*
  %71 = load i32, i32* %70, align 4
  %72 = getelementptr inbounds i32, i32* %0, i64 14
  %select.ptr.37 = select i1 %safe., i32* %67, i32* %shadow.sroa.0
  %73 = load i32, i32* %67, align 4
  %select.val.38 = select i1 %.cond, i32 %71, i32 %73
  store i32 %select.val.38, i32* %select.ptr.37, align 4
  %74 = getelementptr inbounds i8, i8* %2, i64 56
  %75 = bitcast i8* %74 to i32*
  %76 = load i32, i32* %75, align 4
  %77 = getelementptr inbounds i32, i32* %0, i64 15
  %select.ptr.40 = select i1 %safe., i32* %72, i32* %shadow.sroa.0
  %78 = load i32, i32* %72, align 4
  %select.val.41 = select i1 %.cond, i32 %76, i32 %78
  store i32 %select.val.41, i32* %select.ptr.40, align 4
  %79 = getelementptr inbounds i8, i8* %2, i64 60
  %80 = bitcast i8* %79 to i32*
  %81 = load i32, i32* %80, align 4
  %select.ptr.43 = select i1 %safe., i32* %77, i32* %shadow.sroa.0
  %82 = load i32, i32* %77, align 4
  %select.val.44 = select i1 %.cond, i32 %81, i32 %82
  store i32 %select.val.44, i32* %select.ptr.43, align 4
  ret void
}

define void @randombytes(i8* nocapture %0, i64 %N, i64 %1) local_unnamed_addr {
  %3 = icmp sgt i64 %1, -1
  br i1 %3, label %5, label %4

4:                                                ; preds = %2
  call void @__assert_fail(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.17, i64 0, i64 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__PRETTY_FUNCTION__.randombytes, i64 0, i64 0)) #8
  unreachable

5:                                                ; preds = %2
  %6 = load i32, i32* @randombytes.fd, align 4
  %7 = icmp eq i32 %6, -1
  br i1 %7, label %.preheader, label %.loopexit

.preheader:                                       ; preds = %5
  %8 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %8, i32* @randombytes.fd, align 4
  %9 = icmp eq i32 %8, -1
  br i1 %9, label %.lr.ph7, label %.loopexit

.lr.ph7:                                          ; preds = %.preheader, %91
  %10 = call i32 @sleep(i32 1)
  %11 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %11, i32* @randombytes.fd, align 4
  %12 = icmp eq i32 %11, -1
  br i1 %12, label %67, label %.loopexit

.loopexit:                                        ; preds = %91, %87, %83, %79, %75, %71, %67, %.lr.ph7, %.preheader, %5
  %13 = icmp sgt i64 %1, 0
  br i1 %13, label %.lr.ph, label %.outer._crit_edge

.lr.ph:                                           ; preds = %.loopexit, %.outer
  %14 = phi i1 [ %24, %.outer ], [ %13, %.loopexit ]
  %.0.ph6 = phi i8* [ %22, %.outer ], [ %0, %.loopexit ]
  %.01.ph5 = phi i64 [ %23, %.outer ], [ %1, %.loopexit ]
  %15 = icmp slt i64 %.01.ph5, 1048576
  %.01. = select i1 %15, i64 %.01.ph5, i64 1048576
  br label %16

16:                                               ; preds = %65, %.lr.ph
  %17 = load i32, i32* @randombytes.fd, align 4
  %18 = call i64 @read(i32 %17, i8* %.0.ph6, i64 %.01.)
  %19 = icmp slt i64 %18, 1
  br i1 %19, label %20, label %.outer

20:                                               ; preds = %16
  %21 = call i32 @sleep(i32 1)
  br i1 %14, label %25, label %.outer._crit_edge

.outer:                                           ; preds = %61, %55, %49, %43, %37, %31, %25, %16
  %.lcssa = phi i64 [ %18, %16 ], [ %27, %25 ], [ %33, %31 ], [ %39, %37 ], [ %45, %43 ], [ %51, %49 ], [ %57, %55 ], [ %63, %61 ]
  %22 = getelementptr inbounds i8, i8* %.0.ph6, i64 %.lcssa
  %23 = sub nsw i64 %.01.ph5, %.lcssa
  %24 = icmp sgt i64 %23, 0
  br i1 %24, label %.lr.ph, label %.outer._crit_edge

.outer._crit_edge:                                ; preds = %.outer, %20, %29, %35, %41, %47, %53, %59, %65, %.loopexit
  ret void

25:                                               ; preds = %20
  %26 = load i32, i32* @randombytes.fd, align 4
  %27 = call i64 @read(i32 %26, i8* %.0.ph6, i64 %.01.)
  %28 = icmp slt i64 %27, 1
  br i1 %28, label %29, label %.outer

29:                                               ; preds = %25
  %30 = call i32 @sleep(i32 1)
  br i1 %14, label %31, label %.outer._crit_edge

31:                                               ; preds = %29
  %32 = load i32, i32* @randombytes.fd, align 4
  %33 = call i64 @read(i32 %32, i8* %.0.ph6, i64 %.01.)
  %34 = icmp slt i64 %33, 1
  br i1 %34, label %35, label %.outer

35:                                               ; preds = %31
  %36 = call i32 @sleep(i32 1)
  br i1 %14, label %37, label %.outer._crit_edge

37:                                               ; preds = %35
  %38 = load i32, i32* @randombytes.fd, align 4
  %39 = call i64 @read(i32 %38, i8* %.0.ph6, i64 %.01.)
  %40 = icmp slt i64 %39, 1
  br i1 %40, label %41, label %.outer

41:                                               ; preds = %37
  %42 = call i32 @sleep(i32 1)
  br i1 %14, label %43, label %.outer._crit_edge

43:                                               ; preds = %41
  %44 = load i32, i32* @randombytes.fd, align 4
  %45 = call i64 @read(i32 %44, i8* %.0.ph6, i64 %.01.)
  %46 = icmp slt i64 %45, 1
  br i1 %46, label %47, label %.outer

47:                                               ; preds = %43
  %48 = call i32 @sleep(i32 1)
  br i1 %14, label %49, label %.outer._crit_edge

49:                                               ; preds = %47
  %50 = load i32, i32* @randombytes.fd, align 4
  %51 = call i64 @read(i32 %50, i8* %.0.ph6, i64 %.01.)
  %52 = icmp slt i64 %51, 1
  br i1 %52, label %53, label %.outer

53:                                               ; preds = %49
  %54 = call i32 @sleep(i32 1)
  br i1 %14, label %55, label %.outer._crit_edge

55:                                               ; preds = %53
  %56 = load i32, i32* @randombytes.fd, align 4
  %57 = call i64 @read(i32 %56, i8* %.0.ph6, i64 %.01.)
  %58 = icmp slt i64 %57, 1
  br i1 %58, label %59, label %.outer

59:                                               ; preds = %55
  %60 = call i32 @sleep(i32 1)
  br i1 %14, label %61, label %.outer._crit_edge

61:                                               ; preds = %59
  %62 = load i32, i32* @randombytes.fd, align 4
  %63 = call i64 @read(i32 %62, i8* %.0.ph6, i64 %.01.)
  %64 = icmp slt i64 %63, 1
  br i1 %64, label %65, label %.outer

65:                                               ; preds = %61
  %66 = call i32 @sleep(i32 1)
  br i1 %14, label %16, label %.outer._crit_edge, !llvm.loop !9

67:                                               ; preds = %.lr.ph7
  %68 = call i32 @sleep(i32 1)
  %69 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %69, i32* @randombytes.fd, align 4
  %70 = icmp eq i32 %69, -1
  br i1 %70, label %71, label %.loopexit

71:                                               ; preds = %67
  %72 = call i32 @sleep(i32 1)
  %73 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %73, i32* @randombytes.fd, align 4
  %74 = icmp eq i32 %73, -1
  br i1 %74, label %75, label %.loopexit

75:                                               ; preds = %71
  %76 = call i32 @sleep(i32 1)
  %77 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %77, i32* @randombytes.fd, align 4
  %78 = icmp eq i32 %77, -1
  br i1 %78, label %79, label %.loopexit

79:                                               ; preds = %75
  %80 = call i32 @sleep(i32 1)
  %81 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %81, i32* @randombytes.fd, align 4
  %82 = icmp eq i32 %81, -1
  br i1 %82, label %83, label %.loopexit

83:                                               ; preds = %79
  %84 = call i32 @sleep(i32 1)
  %85 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %85, i32* @randombytes.fd, align 4
  %86 = icmp eq i32 %85, -1
  br i1 %86, label %87, label %.loopexit

87:                                               ; preds = %83
  %88 = call i32 @sleep(i32 1)
  %89 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %89, i32* @randombytes.fd, align 4
  %90 = icmp eq i32 %89, -1
  br i1 %90, label %91, label %.loopexit

91:                                               ; preds = %87
  %92 = call i32 @sleep(i32 1)
  %93 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 0)
  store i32 %93, i32* @randombytes.fd, align 4
  %94 = icmp eq i32 %93, -1
  br i1 %94, label %.lr.ph7, label %.loopexit, !llvm.loop !10
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #5

; Function Attrs: nofree
declare i32 @open(i8* nocapture readonly, i32, ...) local_unnamed_addr #6

declare i32 @sleep(i32) local_unnamed_addr #7

; Function Attrs: nofree
declare i64 @read(i32, i8* nocapture, i64) local_unnamed_addr #6

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local zeroext i8 @randombit() local_unnamed_addr #0 {
  %1 = alloca i8, align 1
  store i8 0, i8* %1, align 1
  call void @randombytes(i8* nonnull %1, i64 undef, i64 1) #3
  %2 = load i8, i8* %1, align 1
  %3 = and i8 %2, 1
  ret i8 %3
}

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nofree norecurse nounwind }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nofree "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind }

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

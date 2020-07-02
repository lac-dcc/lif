; ModuleID = 'comp/llvm-ir/comp1.ll'
source_filename = "comp/sources/comp1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @comp(i32* %0, i64 %len., i32* %1, i64 %len.1) #0 !dbg !9 {
  call void @llvm.dbg.value(metadata i32* %0, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32* %1, metadata !16, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !19
  %shadow = alloca i64
  %out. = alloca i1
  %out.2 = alloca i1
  %out.3 = alloca i1
  %out.4 = alloca i1
  %out.5 = alloca i1
  %out.6 = alloca i1
  %out.7 = alloca i1
  %out.8 = alloca i1
  %out.9 = alloca i1
  %out.10 = alloca i1
  %out.11 = alloca i1
  %out.12 = alloca i1
  %out.13 = alloca i1
  %out.14 = alloca i1
  %out.15 = alloca i1
  %out.16 = alloca i1
  %out.17 = alloca i1
  %out.18 = alloca i1
  %out.19 = alloca i1
  %out.20 = alloca i1
  %out.21 = alloca i1
  %out.22 = alloca i1
  %out.23 = alloca i1
  %out.24 = alloca i1
  %out.25 = alloca i1
  %out.26 = alloca i1
  %out.27 = alloca i1
  %out.28 = alloca i1
  %out.29 = alloca i1
  %out.30 = alloca i1
  %out.31 = alloca i1
  %out.32 = alloca i1
  %out.33 = alloca i1
  %out.34 = alloca i1
  %out.35 = alloca i1
  store i1 true, i1* %out.
  %3 = load i1, i1* %out.
  %4 = load i32, i32* %0, align 4, !dbg !20
  %5 = load i32, i32* %1, align 4, !dbg !23
  %6 = icmp ne i32 %4, %5, !dbg !24
  call void @llvm.dbg.value(metadata i32 1, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %3, i1* %out.3
  %7 = load i1, i1* %out.3
  %8 = xor i1 %6, true
  %in. = and i1 %7, %8
  %9 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !20
  %10 = icmp slt i64 1, %len.
  %11 = bitcast i64* %shadow to i32*
  %safe. = or i1 %in., %10
  %select.ptr. = select i1 %safe., i32* %9, i32* %11
  %12 = load i32, i32* %select.ptr., align 4, !dbg !20
  %13 = getelementptr inbounds i32, i32* %1, i64 1, !dbg !23
  %14 = icmp slt i64 1, %len.1
  %15 = bitcast i64* %shadow to i32*
  %safe.99 = or i1 %in., %14
  %select.ptr.100 = select i1 %safe.99, i32* %13, i32* %15
  %16 = load i32, i32* %select.ptr.100, align 4, !dbg !23
  %17 = icmp ne i32 %12, %16, !dbg !24
  call void @llvm.dbg.value(metadata i32 2, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in., i1* %out.2
  %18 = load i1, i1* %out.2
  %19 = xor i1 %17, true
  %in.68 = and i1 %18, %19
  %20 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !20
  %21 = icmp slt i64 2, %len.
  %22 = bitcast i64* %shadow to i32*
  %safe.101 = or i1 %in.68, %21
  %select.ptr.102 = select i1 %safe.101, i32* %20, i32* %22
  %23 = load i32, i32* %select.ptr.102, align 4, !dbg !20
  %24 = getelementptr inbounds i32, i32* %1, i64 2, !dbg !23
  %25 = icmp slt i64 2, %len.1
  %26 = bitcast i64* %shadow to i32*
  %safe.103 = or i1 %in.68, %25
  %select.ptr.104 = select i1 %safe.103, i32* %24, i32* %26
  %27 = load i32, i32* %select.ptr.104, align 4, !dbg !23
  %28 = icmp ne i32 %23, %27, !dbg !24
  call void @llvm.dbg.value(metadata i32 3, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.68, i1* %out.5
  %29 = load i1, i1* %out.5
  %30 = xor i1 %28, true
  %in.69 = and i1 %29, %30
  %31 = getelementptr inbounds i32, i32* %0, i64 3, !dbg !20
  %32 = icmp slt i64 3, %len.
  %33 = bitcast i64* %shadow to i32*
  %safe.105 = or i1 %in.69, %32
  %select.ptr.106 = select i1 %safe.105, i32* %31, i32* %33
  %34 = load i32, i32* %select.ptr.106, align 4, !dbg !20
  %35 = getelementptr inbounds i32, i32* %1, i64 3, !dbg !23
  %36 = icmp slt i64 3, %len.1
  %37 = bitcast i64* %shadow to i32*
  %safe.107 = or i1 %in.69, %36
  %select.ptr.108 = select i1 %safe.107, i32* %35, i32* %37
  %38 = load i32, i32* %select.ptr.108, align 4, !dbg !23
  %39 = icmp ne i32 %34, %38, !dbg !24
  call void @llvm.dbg.value(metadata i32 4, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.69, i1* %out.6
  %40 = load i1, i1* %out.6
  %41 = xor i1 %39, true
  %in.70 = and i1 %40, %41
  %42 = getelementptr inbounds i32, i32* %0, i64 4, !dbg !20
  %43 = icmp slt i64 4, %len.
  %44 = bitcast i64* %shadow to i32*
  %safe.109 = or i1 %in.70, %43
  %select.ptr.110 = select i1 %safe.109, i32* %42, i32* %44
  %45 = load i32, i32* %select.ptr.110, align 4, !dbg !20
  %46 = getelementptr inbounds i32, i32* %1, i64 4, !dbg !23
  %47 = icmp slt i64 4, %len.1
  %48 = bitcast i64* %shadow to i32*
  %safe.111 = or i1 %in.70, %47
  %select.ptr.112 = select i1 %safe.111, i32* %46, i32* %48
  %49 = load i32, i32* %select.ptr.112, align 4, !dbg !23
  %50 = icmp ne i32 %45, %49, !dbg !24
  call void @llvm.dbg.value(metadata i32 5, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.70, i1* %out.7
  %51 = load i1, i1* %out.7
  %52 = xor i1 %50, true
  %in.71 = and i1 %51, %52
  %53 = getelementptr inbounds i32, i32* %0, i64 5, !dbg !20
  %54 = icmp slt i64 5, %len.
  %55 = bitcast i64* %shadow to i32*
  %safe.113 = or i1 %in.71, %54
  %select.ptr.114 = select i1 %safe.113, i32* %53, i32* %55
  %56 = load i32, i32* %select.ptr.114, align 4, !dbg !20
  %57 = getelementptr inbounds i32, i32* %1, i64 5, !dbg !23
  %58 = icmp slt i64 5, %len.1
  %59 = bitcast i64* %shadow to i32*
  %safe.115 = or i1 %in.71, %58
  %select.ptr.116 = select i1 %safe.115, i32* %57, i32* %59
  %60 = load i32, i32* %select.ptr.116, align 4, !dbg !23
  %61 = icmp ne i32 %56, %60, !dbg !24
  call void @llvm.dbg.value(metadata i32 6, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.71, i1* %out.8
  %62 = load i1, i1* %out.8
  %63 = xor i1 %61, true
  %in.72 = and i1 %62, %63
  %64 = getelementptr inbounds i32, i32* %0, i64 6, !dbg !20
  %65 = icmp slt i64 6, %len.
  %66 = bitcast i64* %shadow to i32*
  %safe.117 = or i1 %in.72, %65
  %select.ptr.118 = select i1 %safe.117, i32* %64, i32* %66
  %67 = load i32, i32* %select.ptr.118, align 4, !dbg !20
  %68 = getelementptr inbounds i32, i32* %1, i64 6, !dbg !23
  %69 = icmp slt i64 6, %len.1
  %70 = bitcast i64* %shadow to i32*
  %safe.119 = or i1 %in.72, %69
  %select.ptr.120 = select i1 %safe.119, i32* %68, i32* %70
  %71 = load i32, i32* %select.ptr.120, align 4, !dbg !23
  %72 = icmp ne i32 %67, %71, !dbg !24
  call void @llvm.dbg.value(metadata i32 7, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.72, i1* %out.9
  %73 = load i1, i1* %out.9
  %74 = xor i1 %72, true
  %in.73 = and i1 %73, %74
  %75 = getelementptr inbounds i32, i32* %0, i64 7, !dbg !20
  %76 = icmp slt i64 7, %len.
  %77 = bitcast i64* %shadow to i32*
  %safe.121 = or i1 %in.73, %76
  %select.ptr.122 = select i1 %safe.121, i32* %75, i32* %77
  %78 = load i32, i32* %select.ptr.122, align 4, !dbg !20
  %79 = getelementptr inbounds i32, i32* %1, i64 7, !dbg !23
  %80 = icmp slt i64 7, %len.1
  %81 = bitcast i64* %shadow to i32*
  %safe.123 = or i1 %in.73, %80
  %select.ptr.124 = select i1 %safe.123, i32* %79, i32* %81
  %82 = load i32, i32* %select.ptr.124, align 4, !dbg !23
  %83 = icmp ne i32 %78, %82, !dbg !24
  call void @llvm.dbg.value(metadata i32 8, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.73, i1* %out.10
  %84 = load i1, i1* %out.10
  %85 = xor i1 %83, true
  %in.74 = and i1 %84, %85
  %86 = getelementptr inbounds i32, i32* %0, i64 8, !dbg !20
  %87 = icmp slt i64 8, %len.
  %88 = bitcast i64* %shadow to i32*
  %safe.125 = or i1 %in.74, %87
  %select.ptr.126 = select i1 %safe.125, i32* %86, i32* %88
  %89 = load i32, i32* %select.ptr.126, align 4, !dbg !20
  %90 = getelementptr inbounds i32, i32* %1, i64 8, !dbg !23
  %91 = icmp slt i64 8, %len.1
  %92 = bitcast i64* %shadow to i32*
  %safe.127 = or i1 %in.74, %91
  %select.ptr.128 = select i1 %safe.127, i32* %90, i32* %92
  %93 = load i32, i32* %select.ptr.128, align 4, !dbg !23
  %94 = icmp ne i32 %89, %93, !dbg !24
  call void @llvm.dbg.value(metadata i32 9, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.74, i1* %out.11
  %95 = load i1, i1* %out.11
  %96 = xor i1 %94, true
  %in.75 = and i1 %95, %96
  %97 = getelementptr inbounds i32, i32* %0, i64 9, !dbg !20
  %98 = icmp slt i64 9, %len.
  %99 = bitcast i64* %shadow to i32*
  %safe.129 = or i1 %in.75, %98
  %select.ptr.130 = select i1 %safe.129, i32* %97, i32* %99
  %100 = load i32, i32* %select.ptr.130, align 4, !dbg !20
  %101 = getelementptr inbounds i32, i32* %1, i64 9, !dbg !23
  %102 = icmp slt i64 9, %len.1
  %103 = bitcast i64* %shadow to i32*
  %safe.131 = or i1 %in.75, %102
  %select.ptr.132 = select i1 %safe.131, i32* %101, i32* %103
  %104 = load i32, i32* %select.ptr.132, align 4, !dbg !23
  %105 = icmp ne i32 %100, %104, !dbg !24
  call void @llvm.dbg.value(metadata i32 10, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.75, i1* %out.12
  %106 = load i1, i1* %out.12
  %107 = xor i1 %105, true
  %in.76 = and i1 %106, %107
  %108 = getelementptr inbounds i32, i32* %0, i64 10, !dbg !20
  %109 = icmp slt i64 10, %len.
  %110 = bitcast i64* %shadow to i32*
  %safe.133 = or i1 %in.76, %109
  %select.ptr.134 = select i1 %safe.133, i32* %108, i32* %110
  %111 = load i32, i32* %select.ptr.134, align 4, !dbg !20
  %112 = getelementptr inbounds i32, i32* %1, i64 10, !dbg !23
  %113 = icmp slt i64 10, %len.1
  %114 = bitcast i64* %shadow to i32*
  %safe.135 = or i1 %in.76, %113
  %select.ptr.136 = select i1 %safe.135, i32* %112, i32* %114
  %115 = load i32, i32* %select.ptr.136, align 4, !dbg !23
  %116 = icmp ne i32 %111, %115, !dbg !24
  call void @llvm.dbg.value(metadata i32 11, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.76, i1* %out.13
  %117 = load i1, i1* %out.13
  %118 = xor i1 %116, true
  %in.77 = and i1 %117, %118
  %119 = getelementptr inbounds i32, i32* %0, i64 11, !dbg !20
  %120 = icmp slt i64 11, %len.
  %121 = bitcast i64* %shadow to i32*
  %safe.137 = or i1 %in.77, %120
  %select.ptr.138 = select i1 %safe.137, i32* %119, i32* %121
  %122 = load i32, i32* %select.ptr.138, align 4, !dbg !20
  %123 = getelementptr inbounds i32, i32* %1, i64 11, !dbg !23
  %124 = icmp slt i64 11, %len.1
  %125 = bitcast i64* %shadow to i32*
  %safe.139 = or i1 %in.77, %124
  %select.ptr.140 = select i1 %safe.139, i32* %123, i32* %125
  %126 = load i32, i32* %select.ptr.140, align 4, !dbg !23
  %127 = icmp ne i32 %122, %126, !dbg !24
  call void @llvm.dbg.value(metadata i32 12, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.77, i1* %out.14
  %128 = load i1, i1* %out.14
  %129 = xor i1 %127, true
  %in.78 = and i1 %128, %129
  %130 = getelementptr inbounds i32, i32* %0, i64 12, !dbg !20
  %131 = icmp slt i64 12, %len.
  %132 = bitcast i64* %shadow to i32*
  %safe.141 = or i1 %in.78, %131
  %select.ptr.142 = select i1 %safe.141, i32* %130, i32* %132
  %133 = load i32, i32* %select.ptr.142, align 4, !dbg !20
  %134 = getelementptr inbounds i32, i32* %1, i64 12, !dbg !23
  %135 = icmp slt i64 12, %len.1
  %136 = bitcast i64* %shadow to i32*
  %safe.143 = or i1 %in.78, %135
  %select.ptr.144 = select i1 %safe.143, i32* %134, i32* %136
  %137 = load i32, i32* %select.ptr.144, align 4, !dbg !23
  %138 = icmp ne i32 %133, %137, !dbg !24
  call void @llvm.dbg.value(metadata i32 13, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.78, i1* %out.15
  %139 = load i1, i1* %out.15
  %140 = xor i1 %138, true
  %in.79 = and i1 %139, %140
  %141 = getelementptr inbounds i32, i32* %0, i64 13, !dbg !20
  %142 = icmp slt i64 13, %len.
  %143 = bitcast i64* %shadow to i32*
  %safe.145 = or i1 %in.79, %142
  %select.ptr.146 = select i1 %safe.145, i32* %141, i32* %143
  %144 = load i32, i32* %select.ptr.146, align 4, !dbg !20
  %145 = getelementptr inbounds i32, i32* %1, i64 13, !dbg !23
  %146 = icmp slt i64 13, %len.1
  %147 = bitcast i64* %shadow to i32*
  %safe.147 = or i1 %in.79, %146
  %select.ptr.148 = select i1 %safe.147, i32* %145, i32* %147
  %148 = load i32, i32* %select.ptr.148, align 4, !dbg !23
  %149 = icmp ne i32 %144, %148, !dbg !24
  call void @llvm.dbg.value(metadata i32 14, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.79, i1* %out.16
  %150 = load i1, i1* %out.16
  %151 = xor i1 %149, true
  %in.80 = and i1 %150, %151
  %152 = getelementptr inbounds i32, i32* %0, i64 14, !dbg !20
  %153 = icmp slt i64 14, %len.
  %154 = bitcast i64* %shadow to i32*
  %safe.149 = or i1 %in.80, %153
  %select.ptr.150 = select i1 %safe.149, i32* %152, i32* %154
  %155 = load i32, i32* %select.ptr.150, align 4, !dbg !20
  %156 = getelementptr inbounds i32, i32* %1, i64 14, !dbg !23
  %157 = icmp slt i64 14, %len.1
  %158 = bitcast i64* %shadow to i32*
  %safe.151 = or i1 %in.80, %157
  %select.ptr.152 = select i1 %safe.151, i32* %156, i32* %158
  %159 = load i32, i32* %select.ptr.152, align 4, !dbg !23
  %160 = icmp ne i32 %155, %159, !dbg !24
  call void @llvm.dbg.value(metadata i32 15, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.80, i1* %out.17
  %161 = load i1, i1* %out.17
  %162 = xor i1 %160, true
  %in.81 = and i1 %161, %162
  %163 = getelementptr inbounds i32, i32* %0, i64 15, !dbg !20
  %164 = icmp slt i64 15, %len.
  %165 = bitcast i64* %shadow to i32*
  %safe.153 = or i1 %in.81, %164
  %select.ptr.154 = select i1 %safe.153, i32* %163, i32* %165
  %166 = load i32, i32* %select.ptr.154, align 4, !dbg !20
  %167 = getelementptr inbounds i32, i32* %1, i64 15, !dbg !23
  %168 = icmp slt i64 15, %len.1
  %169 = bitcast i64* %shadow to i32*
  %safe.155 = or i1 %in.81, %168
  %select.ptr.156 = select i1 %safe.155, i32* %167, i32* %169
  %170 = load i32, i32* %select.ptr.156, align 4, !dbg !23
  %171 = icmp ne i32 %166, %170, !dbg !24
  call void @llvm.dbg.value(metadata i32 16, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.81, i1* %out.18
  %172 = load i1, i1* %out.18
  %173 = xor i1 %171, true
  %in.82 = and i1 %172, %173
  %174 = getelementptr inbounds i32, i32* %0, i64 16, !dbg !20
  %175 = icmp slt i64 16, %len.
  %176 = bitcast i64* %shadow to i32*
  %safe.157 = or i1 %in.82, %175
  %select.ptr.158 = select i1 %safe.157, i32* %174, i32* %176
  %177 = load i32, i32* %select.ptr.158, align 4, !dbg !20
  %178 = getelementptr inbounds i32, i32* %1, i64 16, !dbg !23
  %179 = icmp slt i64 16, %len.1
  %180 = bitcast i64* %shadow to i32*
  %safe.159 = or i1 %in.82, %179
  %select.ptr.160 = select i1 %safe.159, i32* %178, i32* %180
  %181 = load i32, i32* %select.ptr.160, align 4, !dbg !23
  %182 = icmp ne i32 %177, %181, !dbg !24
  call void @llvm.dbg.value(metadata i32 17, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.82, i1* %out.19
  %183 = load i1, i1* %out.19
  %184 = xor i1 %182, true
  %in.83 = and i1 %183, %184
  %185 = getelementptr inbounds i32, i32* %0, i64 17, !dbg !20
  %186 = icmp slt i64 17, %len.
  %187 = bitcast i64* %shadow to i32*
  %safe.161 = or i1 %in.83, %186
  %select.ptr.162 = select i1 %safe.161, i32* %185, i32* %187
  %188 = load i32, i32* %select.ptr.162, align 4, !dbg !20
  %189 = getelementptr inbounds i32, i32* %1, i64 17, !dbg !23
  %190 = icmp slt i64 17, %len.1
  %191 = bitcast i64* %shadow to i32*
  %safe.163 = or i1 %in.83, %190
  %select.ptr.164 = select i1 %safe.163, i32* %189, i32* %191
  %192 = load i32, i32* %select.ptr.164, align 4, !dbg !23
  %193 = icmp ne i32 %188, %192, !dbg !24
  call void @llvm.dbg.value(metadata i32 18, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.83, i1* %out.20
  %194 = load i1, i1* %out.20
  %195 = xor i1 %193, true
  %in.84 = and i1 %194, %195
  %196 = getelementptr inbounds i32, i32* %0, i64 18, !dbg !20
  %197 = icmp slt i64 18, %len.
  %198 = bitcast i64* %shadow to i32*
  %safe.165 = or i1 %in.84, %197
  %select.ptr.166 = select i1 %safe.165, i32* %196, i32* %198
  %199 = load i32, i32* %select.ptr.166, align 4, !dbg !20
  %200 = getelementptr inbounds i32, i32* %1, i64 18, !dbg !23
  %201 = icmp slt i64 18, %len.1
  %202 = bitcast i64* %shadow to i32*
  %safe.167 = or i1 %in.84, %201
  %select.ptr.168 = select i1 %safe.167, i32* %200, i32* %202
  %203 = load i32, i32* %select.ptr.168, align 4, !dbg !23
  %204 = icmp ne i32 %199, %203, !dbg !24
  call void @llvm.dbg.value(metadata i32 19, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.84, i1* %out.21
  %205 = load i1, i1* %out.21
  %206 = xor i1 %204, true
  %in.85 = and i1 %205, %206
  %207 = getelementptr inbounds i32, i32* %0, i64 19, !dbg !20
  %208 = icmp slt i64 19, %len.
  %209 = bitcast i64* %shadow to i32*
  %safe.169 = or i1 %in.85, %208
  %select.ptr.170 = select i1 %safe.169, i32* %207, i32* %209
  %210 = load i32, i32* %select.ptr.170, align 4, !dbg !20
  %211 = getelementptr inbounds i32, i32* %1, i64 19, !dbg !23
  %212 = icmp slt i64 19, %len.1
  %213 = bitcast i64* %shadow to i32*
  %safe.171 = or i1 %in.85, %212
  %select.ptr.172 = select i1 %safe.171, i32* %211, i32* %213
  %214 = load i32, i32* %select.ptr.172, align 4, !dbg !23
  %215 = icmp ne i32 %210, %214, !dbg !24
  call void @llvm.dbg.value(metadata i32 20, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.85, i1* %out.22
  %216 = load i1, i1* %out.22
  %217 = xor i1 %215, true
  %in.86 = and i1 %216, %217
  %218 = getelementptr inbounds i32, i32* %0, i64 20, !dbg !20
  %219 = icmp slt i64 20, %len.
  %220 = bitcast i64* %shadow to i32*
  %safe.173 = or i1 %in.86, %219
  %select.ptr.174 = select i1 %safe.173, i32* %218, i32* %220
  %221 = load i32, i32* %select.ptr.174, align 4, !dbg !20
  %222 = getelementptr inbounds i32, i32* %1, i64 20, !dbg !23
  %223 = icmp slt i64 20, %len.1
  %224 = bitcast i64* %shadow to i32*
  %safe.175 = or i1 %in.86, %223
  %select.ptr.176 = select i1 %safe.175, i32* %222, i32* %224
  %225 = load i32, i32* %select.ptr.176, align 4, !dbg !23
  %226 = icmp ne i32 %221, %225, !dbg !24
  call void @llvm.dbg.value(metadata i32 21, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.86, i1* %out.23
  %227 = load i1, i1* %out.23
  %228 = xor i1 %226, true
  %in.87 = and i1 %227, %228
  %229 = getelementptr inbounds i32, i32* %0, i64 21, !dbg !20
  %230 = icmp slt i64 21, %len.
  %231 = bitcast i64* %shadow to i32*
  %safe.177 = or i1 %in.87, %230
  %select.ptr.178 = select i1 %safe.177, i32* %229, i32* %231
  %232 = load i32, i32* %select.ptr.178, align 4, !dbg !20
  %233 = getelementptr inbounds i32, i32* %1, i64 21, !dbg !23
  %234 = icmp slt i64 21, %len.1
  %235 = bitcast i64* %shadow to i32*
  %safe.179 = or i1 %in.87, %234
  %select.ptr.180 = select i1 %safe.179, i32* %233, i32* %235
  %236 = load i32, i32* %select.ptr.180, align 4, !dbg !23
  %237 = icmp ne i32 %232, %236, !dbg !24
  call void @llvm.dbg.value(metadata i32 22, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.87, i1* %out.24
  %238 = load i1, i1* %out.24
  %239 = xor i1 %237, true
  %in.88 = and i1 %238, %239
  %240 = getelementptr inbounds i32, i32* %0, i64 22, !dbg !20
  %241 = icmp slt i64 22, %len.
  %242 = bitcast i64* %shadow to i32*
  %safe.181 = or i1 %in.88, %241
  %select.ptr.182 = select i1 %safe.181, i32* %240, i32* %242
  %243 = load i32, i32* %select.ptr.182, align 4, !dbg !20
  %244 = getelementptr inbounds i32, i32* %1, i64 22, !dbg !23
  %245 = icmp slt i64 22, %len.1
  %246 = bitcast i64* %shadow to i32*
  %safe.183 = or i1 %in.88, %245
  %select.ptr.184 = select i1 %safe.183, i32* %244, i32* %246
  %247 = load i32, i32* %select.ptr.184, align 4, !dbg !23
  %248 = icmp ne i32 %243, %247, !dbg !24
  call void @llvm.dbg.value(metadata i32 23, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.88, i1* %out.25
  %249 = load i1, i1* %out.25
  %250 = xor i1 %248, true
  %in.89 = and i1 %249, %250
  %251 = getelementptr inbounds i32, i32* %0, i64 23, !dbg !20
  %252 = icmp slt i64 23, %len.
  %253 = bitcast i64* %shadow to i32*
  %safe.185 = or i1 %in.89, %252
  %select.ptr.186 = select i1 %safe.185, i32* %251, i32* %253
  %254 = load i32, i32* %select.ptr.186, align 4, !dbg !20
  %255 = getelementptr inbounds i32, i32* %1, i64 23, !dbg !23
  %256 = icmp slt i64 23, %len.1
  %257 = bitcast i64* %shadow to i32*
  %safe.187 = or i1 %in.89, %256
  %select.ptr.188 = select i1 %safe.187, i32* %255, i32* %257
  %258 = load i32, i32* %select.ptr.188, align 4, !dbg !23
  %259 = icmp ne i32 %254, %258, !dbg !24
  call void @llvm.dbg.value(metadata i32 24, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.89, i1* %out.26
  %260 = load i1, i1* %out.26
  %261 = xor i1 %259, true
  %in.90 = and i1 %260, %261
  %262 = getelementptr inbounds i32, i32* %0, i64 24, !dbg !20
  %263 = icmp slt i64 24, %len.
  %264 = bitcast i64* %shadow to i32*
  %safe.189 = or i1 %in.90, %263
  %select.ptr.190 = select i1 %safe.189, i32* %262, i32* %264
  %265 = load i32, i32* %select.ptr.190, align 4, !dbg !20
  %266 = getelementptr inbounds i32, i32* %1, i64 24, !dbg !23
  %267 = icmp slt i64 24, %len.1
  %268 = bitcast i64* %shadow to i32*
  %safe.191 = or i1 %in.90, %267
  %select.ptr.192 = select i1 %safe.191, i32* %266, i32* %268
  %269 = load i32, i32* %select.ptr.192, align 4, !dbg !23
  %270 = icmp ne i32 %265, %269, !dbg !24
  call void @llvm.dbg.value(metadata i32 25, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.90, i1* %out.27
  %271 = load i1, i1* %out.27
  %272 = xor i1 %270, true
  %in.91 = and i1 %271, %272
  %273 = getelementptr inbounds i32, i32* %0, i64 25, !dbg !20
  %274 = icmp slt i64 25, %len.
  %275 = bitcast i64* %shadow to i32*
  %safe.193 = or i1 %in.91, %274
  %select.ptr.194 = select i1 %safe.193, i32* %273, i32* %275
  %276 = load i32, i32* %select.ptr.194, align 4, !dbg !20
  %277 = getelementptr inbounds i32, i32* %1, i64 25, !dbg !23
  %278 = icmp slt i64 25, %len.1
  %279 = bitcast i64* %shadow to i32*
  %safe.195 = or i1 %in.91, %278
  %select.ptr.196 = select i1 %safe.195, i32* %277, i32* %279
  %280 = load i32, i32* %select.ptr.196, align 4, !dbg !23
  %281 = icmp ne i32 %276, %280, !dbg !24
  call void @llvm.dbg.value(metadata i32 26, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.91, i1* %out.28
  %282 = load i1, i1* %out.28
  %283 = xor i1 %281, true
  %in.92 = and i1 %282, %283
  %284 = getelementptr inbounds i32, i32* %0, i64 26, !dbg !20
  %285 = icmp slt i64 26, %len.
  %286 = bitcast i64* %shadow to i32*
  %safe.197 = or i1 %in.92, %285
  %select.ptr.198 = select i1 %safe.197, i32* %284, i32* %286
  %287 = load i32, i32* %select.ptr.198, align 4, !dbg !20
  %288 = getelementptr inbounds i32, i32* %1, i64 26, !dbg !23
  %289 = icmp slt i64 26, %len.1
  %290 = bitcast i64* %shadow to i32*
  %safe.199 = or i1 %in.92, %289
  %select.ptr.200 = select i1 %safe.199, i32* %288, i32* %290
  %291 = load i32, i32* %select.ptr.200, align 4, !dbg !23
  %292 = icmp ne i32 %287, %291, !dbg !24
  call void @llvm.dbg.value(metadata i32 27, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.92, i1* %out.29
  %293 = load i1, i1* %out.29
  %294 = xor i1 %292, true
  %in.93 = and i1 %293, %294
  %295 = getelementptr inbounds i32, i32* %0, i64 27, !dbg !20
  %296 = icmp slt i64 27, %len.
  %297 = bitcast i64* %shadow to i32*
  %safe.201 = or i1 %in.93, %296
  %select.ptr.202 = select i1 %safe.201, i32* %295, i32* %297
  %298 = load i32, i32* %select.ptr.202, align 4, !dbg !20
  %299 = getelementptr inbounds i32, i32* %1, i64 27, !dbg !23
  %300 = icmp slt i64 27, %len.1
  %301 = bitcast i64* %shadow to i32*
  %safe.203 = or i1 %in.93, %300
  %select.ptr.204 = select i1 %safe.203, i32* %299, i32* %301
  %302 = load i32, i32* %select.ptr.204, align 4, !dbg !23
  %303 = icmp ne i32 %298, %302, !dbg !24
  call void @llvm.dbg.value(metadata i32 28, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.93, i1* %out.30
  %304 = load i1, i1* %out.30
  %305 = xor i1 %303, true
  %in.94 = and i1 %304, %305
  %306 = getelementptr inbounds i32, i32* %0, i64 28, !dbg !20
  %307 = icmp slt i64 28, %len.
  %308 = bitcast i64* %shadow to i32*
  %safe.205 = or i1 %in.94, %307
  %select.ptr.206 = select i1 %safe.205, i32* %306, i32* %308
  %309 = load i32, i32* %select.ptr.206, align 4, !dbg !20
  %310 = getelementptr inbounds i32, i32* %1, i64 28, !dbg !23
  %311 = icmp slt i64 28, %len.1
  %312 = bitcast i64* %shadow to i32*
  %safe.207 = or i1 %in.94, %311
  %select.ptr.208 = select i1 %safe.207, i32* %310, i32* %312
  %313 = load i32, i32* %select.ptr.208, align 4, !dbg !23
  %314 = icmp ne i32 %309, %313, !dbg !24
  call void @llvm.dbg.value(metadata i32 29, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.94, i1* %out.31
  %315 = load i1, i1* %out.31
  %316 = xor i1 %314, true
  %in.95 = and i1 %315, %316
  %317 = getelementptr inbounds i32, i32* %0, i64 29, !dbg !20
  %318 = icmp slt i64 29, %len.
  %319 = bitcast i64* %shadow to i32*
  %safe.209 = or i1 %in.95, %318
  %select.ptr.210 = select i1 %safe.209, i32* %317, i32* %319
  %320 = load i32, i32* %select.ptr.210, align 4, !dbg !20
  %321 = getelementptr inbounds i32, i32* %1, i64 29, !dbg !23
  %322 = icmp slt i64 29, %len.1
  %323 = bitcast i64* %shadow to i32*
  %safe.211 = or i1 %in.95, %322
  %select.ptr.212 = select i1 %safe.211, i32* %321, i32* %323
  %324 = load i32, i32* %select.ptr.212, align 4, !dbg !23
  %325 = icmp ne i32 %320, %324, !dbg !24
  call void @llvm.dbg.value(metadata i32 30, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.95, i1* %out.32
  %326 = load i1, i1* %out.32
  %327 = xor i1 %325, true
  %in.96 = and i1 %326, %327
  %328 = getelementptr inbounds i32, i32* %0, i64 30, !dbg !20
  %329 = icmp slt i64 30, %len.
  %330 = bitcast i64* %shadow to i32*
  %safe.213 = or i1 %in.96, %329
  %select.ptr.214 = select i1 %safe.213, i32* %328, i32* %330
  %331 = load i32, i32* %select.ptr.214, align 4, !dbg !20
  %332 = getelementptr inbounds i32, i32* %1, i64 30, !dbg !23
  %333 = icmp slt i64 30, %len.1
  %334 = bitcast i64* %shadow to i32*
  %safe.215 = or i1 %in.96, %333
  %select.ptr.216 = select i1 %safe.215, i32* %332, i32* %334
  %335 = load i32, i32* %select.ptr.216, align 4, !dbg !23
  %336 = icmp ne i32 %331, %335, !dbg !24
  call void @llvm.dbg.value(metadata i32 31, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.96, i1* %out.33
  %337 = load i1, i1* %out.33
  %338 = xor i1 %336, true
  %in.97 = and i1 %337, %338
  %339 = getelementptr inbounds i32, i32* %0, i64 31, !dbg !20
  %340 = icmp slt i64 31, %len.
  %341 = bitcast i64* %shadow to i32*
  %safe.217 = or i1 %in.97, %340
  %select.ptr.218 = select i1 %safe.217, i32* %339, i32* %341
  %342 = load i32, i32* %select.ptr.218, align 4, !dbg !20
  %343 = getelementptr inbounds i32, i32* %1, i64 31, !dbg !23
  %344 = icmp slt i64 31, %len.1
  %345 = bitcast i64* %shadow to i32*
  %safe.219 = or i1 %in.97, %344
  %select.ptr.220 = select i1 %safe.219, i32* %343, i32* %345
  %346 = load i32, i32* %select.ptr.220, align 4, !dbg !23
  %347 = icmp ne i32 %342, %346, !dbg !24
  call void @llvm.dbg.value(metadata i32 32, metadata !17, metadata !DIExpression()), !dbg !19
  store i1 %in.97, i1* %out.34
  %348 = load i1, i1* %out.34
  %349 = xor i1 %347, true
  %in.98 = and i1 %348, %349
  store i1 %in.98, i1* %out.35
  %350 = load i1, i1* %out.2
  %in.67 = and i1 %350, %17
  %351 = sext i1 %in.67 to i32
  %352 = sub i32 0, %351
  %353 = and i32 0, %352
  %354 = load i1, i1* %out.3
  %in.66 = and i1 %354, %6
  %355 = sext i1 %in.66 to i32
  %356 = sub i32 0, %355
  %357 = and i32 0, %356
  %358 = load i1, i1* %out.5
  %in.65 = and i1 %358, %28
  %359 = sext i1 %in.65 to i32
  %360 = sub i32 0, %359
  %361 = and i32 0, %360
  %362 = load i1, i1* %out.6
  %in.64 = and i1 %362, %39
  %363 = sext i1 %in.64 to i32
  %364 = sub i32 0, %363
  %365 = and i32 0, %364
  %366 = load i1, i1* %out.7
  %in.63 = and i1 %366, %50
  %367 = sext i1 %in.63 to i32
  %368 = sub i32 0, %367
  %369 = and i32 0, %368
  %370 = load i1, i1* %out.8
  %in.62 = and i1 %370, %61
  %371 = sext i1 %in.62 to i32
  %372 = sub i32 0, %371
  %373 = and i32 0, %372
  %374 = load i1, i1* %out.9
  %in.61 = and i1 %374, %72
  %375 = sext i1 %in.61 to i32
  %376 = sub i32 0, %375
  %377 = and i32 0, %376
  %378 = load i1, i1* %out.10
  %in.60 = and i1 %378, %83
  %379 = sext i1 %in.60 to i32
  %380 = sub i32 0, %379
  %381 = and i32 0, %380
  %382 = load i1, i1* %out.11
  %in.59 = and i1 %382, %94
  %383 = sext i1 %in.59 to i32
  %384 = sub i32 0, %383
  %385 = and i32 0, %384
  %386 = load i1, i1* %out.12
  %in.58 = and i1 %386, %105
  %387 = sext i1 %in.58 to i32
  %388 = sub i32 0, %387
  %389 = and i32 0, %388
  %390 = load i1, i1* %out.13
  %in.57 = and i1 %390, %116
  %391 = sext i1 %in.57 to i32
  %392 = sub i32 0, %391
  %393 = and i32 0, %392
  %394 = load i1, i1* %out.14
  %in.56 = and i1 %394, %127
  %395 = sext i1 %in.56 to i32
  %396 = sub i32 0, %395
  %397 = and i32 0, %396
  %398 = load i1, i1* %out.15
  %in.55 = and i1 %398, %138
  %399 = sext i1 %in.55 to i32
  %400 = sub i32 0, %399
  %401 = and i32 0, %400
  %402 = load i1, i1* %out.16
  %in.54 = and i1 %402, %149
  %403 = sext i1 %in.54 to i32
  %404 = sub i32 0, %403
  %405 = and i32 0, %404
  %406 = load i1, i1* %out.17
  %in.53 = and i1 %406, %160
  %407 = sext i1 %in.53 to i32
  %408 = sub i32 0, %407
  %409 = and i32 0, %408
  %410 = load i1, i1* %out.18
  %in.52 = and i1 %410, %171
  %411 = sext i1 %in.52 to i32
  %412 = sub i32 0, %411
  %413 = and i32 0, %412
  %414 = load i1, i1* %out.19
  %in.51 = and i1 %414, %182
  %415 = sext i1 %in.51 to i32
  %416 = sub i32 0, %415
  %417 = and i32 0, %416
  %418 = load i1, i1* %out.20
  %in.50 = and i1 %418, %193
  %419 = sext i1 %in.50 to i32
  %420 = sub i32 0, %419
  %421 = and i32 0, %420
  %422 = load i1, i1* %out.21
  %in.49 = and i1 %422, %204
  %423 = sext i1 %in.49 to i32
  %424 = sub i32 0, %423
  %425 = and i32 0, %424
  %426 = load i1, i1* %out.22
  %in.48 = and i1 %426, %215
  %427 = sext i1 %in.48 to i32
  %428 = sub i32 0, %427
  %429 = and i32 0, %428
  %430 = load i1, i1* %out.23
  %in.47 = and i1 %430, %226
  %431 = sext i1 %in.47 to i32
  %432 = sub i32 0, %431
  %433 = and i32 0, %432
  %434 = load i1, i1* %out.24
  %in.46 = and i1 %434, %237
  %435 = sext i1 %in.46 to i32
  %436 = sub i32 0, %435
  %437 = and i32 0, %436
  %438 = load i1, i1* %out.25
  %in.45 = and i1 %438, %248
  %439 = sext i1 %in.45 to i32
  %440 = sub i32 0, %439
  %441 = and i32 0, %440
  %442 = load i1, i1* %out.26
  %in.44 = and i1 %442, %259
  %443 = sext i1 %in.44 to i32
  %444 = sub i32 0, %443
  %445 = and i32 0, %444
  %446 = load i1, i1* %out.27
  %in.43 = and i1 %446, %270
  %447 = sext i1 %in.43 to i32
  %448 = sub i32 0, %447
  %449 = and i32 0, %448
  %450 = load i1, i1* %out.28
  %in.42 = and i1 %450, %281
  %451 = sext i1 %in.42 to i32
  %452 = sub i32 0, %451
  %453 = and i32 0, %452
  %454 = load i1, i1* %out.29
  %in.41 = and i1 %454, %292
  %455 = sext i1 %in.41 to i32
  %456 = sub i32 0, %455
  %457 = and i32 0, %456
  %458 = load i1, i1* %out.30
  %in.40 = and i1 %458, %303
  %459 = sext i1 %in.40 to i32
  %460 = sub i32 0, %459
  %461 = and i32 0, %460
  %462 = load i1, i1* %out.31
  %in.39 = and i1 %462, %314
  %463 = sext i1 %in.39 to i32
  %464 = sub i32 0, %463
  %465 = and i32 0, %464
  %466 = load i1, i1* %out.32
  %in.38 = and i1 %466, %325
  %467 = sext i1 %in.38 to i32
  %468 = sub i32 0, %467
  %469 = and i32 0, %468
  %470 = load i1, i1* %out.33
  %in.37 = and i1 %470, %336
  %471 = sext i1 %in.37 to i32
  %472 = sub i32 0, %471
  %473 = and i32 0, %472
  %474 = load i1, i1* %out.34
  %in.36 = and i1 %474, %347
  %475 = sext i1 %in.36 to i32
  %476 = sub i32 0, %475
  %477 = and i32 0, %476
  %478 = load i1, i1* %out.35
  %479 = sext i1 %478 to i32
  %480 = sub i32 0, %479
  %481 = and i32 1, %480
  %482 = or i32 %353, %357
  %483 = or i32 %482, %361
  %484 = or i32 %483, %365
  %485 = or i32 %484, %369
  %486 = or i32 %485, %373
  %487 = or i32 %486, %377
  %488 = or i32 %487, %381
  %489 = or i32 %488, %385
  %490 = or i32 %489, %389
  %491 = or i32 %490, %393
  %492 = or i32 %491, %397
  %493 = or i32 %492, %401
  %494 = or i32 %493, %405
  %495 = or i32 %494, %409
  %496 = or i32 %495, %413
  %497 = or i32 %496, %417
  %498 = or i32 %497, %421
  %499 = or i32 %498, %425
  %500 = or i32 %499, %429
  %501 = or i32 %500, %433
  %502 = or i32 %501, %437
  %503 = or i32 %502, %441
  %504 = or i32 %503, %445
  %505 = or i32 %504, %449
  %506 = or i32 %505, %453
  %507 = or i32 %506, %457
  %508 = or i32 %507, %461
  %509 = or i32 %508, %465
  %510 = or i32 %509, %469
  %511 = or i32 %510, %473
  %512 = or i32 %511, %477
  %select.phi. = or i32 %512, %481
  %513 = or i1 %in.67, %in.66
  %514 = or i1 %513, %in.65
  %515 = or i1 %514, %in.64
  %516 = or i1 %515, %in.63
  %517 = or i1 %516, %in.62
  %518 = or i1 %517, %in.61
  %519 = or i1 %518, %in.60
  %520 = or i1 %519, %in.59
  %521 = or i1 %520, %in.58
  %522 = or i1 %521, %in.57
  %523 = or i1 %522, %in.56
  %524 = or i1 %523, %in.55
  %525 = or i1 %524, %in.54
  %526 = or i1 %525, %in.53
  %527 = or i1 %526, %in.52
  %528 = or i1 %527, %in.51
  %529 = or i1 %528, %in.50
  %530 = or i1 %529, %in.49
  %531 = or i1 %530, %in.48
  %532 = or i1 %531, %in.47
  %533 = or i1 %532, %in.46
  %534 = or i1 %533, %in.45
  %535 = or i1 %534, %in.44
  %536 = or i1 %535, %in.43
  %537 = or i1 %536, %in.42
  %538 = or i1 %537, %in.41
  %539 = or i1 %538, %in.40
  %540 = or i1 %539, %in.39
  %541 = or i1 %540, %in.38
  %542 = or i1 %541, %in.37
  %543 = or i1 %542, %in.36
  %544 = or i1 %543, %478
  store i1 %544, i1* %out.4
  ret i32 %select.phi., !dbg !25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 !dbg !26 {
  %1 = alloca [32 x i32], align 16
  %2 = alloca [32 x i32], align 16
  call void @llvm.dbg.declare(metadata [32 x i32]* %1, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [32 x i32]* %2, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.value(metadata i32 0, metadata !36, metadata !DIExpression()), !dbg !38
  br label %3, !dbg !39

3:                                                ; preds = %0
  call void @llvm.dbg.value(metadata i64 0, metadata !36, metadata !DIExpression()), !dbg !38
  %4 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 0, !dbg !40
  store i32 0, i32* %4, align 4, !dbg !42
  %5 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 0, !dbg !43
  store i32 0, i32* %5, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 1, metadata !36, metadata !DIExpression()), !dbg !38
  %6 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 1, !dbg !40
  store i32 1, i32* %6, align 4, !dbg !42
  %7 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 1, !dbg !43
  store i32 1, i32* %7, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 2, metadata !36, metadata !DIExpression()), !dbg !38
  %8 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 2, !dbg !40
  store i32 2, i32* %8, align 4, !dbg !42
  %9 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 2, !dbg !43
  store i32 2, i32* %9, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 3, metadata !36, metadata !DIExpression()), !dbg !38
  %10 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 3, !dbg !40
  store i32 3, i32* %10, align 4, !dbg !42
  %11 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 3, !dbg !43
  store i32 3, i32* %11, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 4, metadata !36, metadata !DIExpression()), !dbg !38
  %12 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 4, !dbg !40
  store i32 4, i32* %12, align 4, !dbg !42
  %13 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 4, !dbg !43
  store i32 4, i32* %13, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 5, metadata !36, metadata !DIExpression()), !dbg !38
  %14 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 5, !dbg !40
  store i32 5, i32* %14, align 4, !dbg !42
  %15 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 5, !dbg !43
  store i32 5, i32* %15, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 6, metadata !36, metadata !DIExpression()), !dbg !38
  %16 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 6, !dbg !40
  store i32 6, i32* %16, align 4, !dbg !42
  %17 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 6, !dbg !43
  store i32 6, i32* %17, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 7, metadata !36, metadata !DIExpression()), !dbg !38
  %18 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 7, !dbg !40
  store i32 7, i32* %18, align 4, !dbg !42
  %19 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 7, !dbg !43
  store i32 7, i32* %19, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 8, metadata !36, metadata !DIExpression()), !dbg !38
  %20 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 8, !dbg !40
  store i32 8, i32* %20, align 4, !dbg !42
  %21 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 8, !dbg !43
  store i32 8, i32* %21, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 9, metadata !36, metadata !DIExpression()), !dbg !38
  %22 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 9, !dbg !40
  store i32 9, i32* %22, align 4, !dbg !42
  %23 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 9, !dbg !43
  store i32 9, i32* %23, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 10, metadata !36, metadata !DIExpression()), !dbg !38
  %24 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 10, !dbg !40
  store i32 10, i32* %24, align 4, !dbg !42
  %25 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 10, !dbg !43
  store i32 10, i32* %25, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 11, metadata !36, metadata !DIExpression()), !dbg !38
  %26 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 11, !dbg !40
  store i32 11, i32* %26, align 4, !dbg !42
  %27 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 11, !dbg !43
  store i32 11, i32* %27, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 12, metadata !36, metadata !DIExpression()), !dbg !38
  %28 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 12, !dbg !40
  store i32 12, i32* %28, align 4, !dbg !42
  %29 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 12, !dbg !43
  store i32 12, i32* %29, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 13, metadata !36, metadata !DIExpression()), !dbg !38
  %30 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 13, !dbg !40
  store i32 13, i32* %30, align 4, !dbg !42
  %31 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 13, !dbg !43
  store i32 13, i32* %31, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 14, metadata !36, metadata !DIExpression()), !dbg !38
  %32 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 14, !dbg !40
  store i32 14, i32* %32, align 4, !dbg !42
  %33 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 14, !dbg !43
  store i32 14, i32* %33, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 15, metadata !36, metadata !DIExpression()), !dbg !38
  %34 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 15, !dbg !40
  store i32 15, i32* %34, align 4, !dbg !42
  %35 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 15, !dbg !43
  store i32 15, i32* %35, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 16, metadata !36, metadata !DIExpression()), !dbg !38
  %36 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 16, !dbg !40
  store i32 16, i32* %36, align 4, !dbg !42
  %37 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 16, !dbg !43
  store i32 16, i32* %37, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 17, metadata !36, metadata !DIExpression()), !dbg !38
  %38 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 17, !dbg !40
  store i32 17, i32* %38, align 4, !dbg !42
  %39 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 17, !dbg !43
  store i32 17, i32* %39, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 18, metadata !36, metadata !DIExpression()), !dbg !38
  %40 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 18, !dbg !40
  store i32 18, i32* %40, align 4, !dbg !42
  %41 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 18, !dbg !43
  store i32 18, i32* %41, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 19, metadata !36, metadata !DIExpression()), !dbg !38
  %42 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 19, !dbg !40
  store i32 19, i32* %42, align 4, !dbg !42
  %43 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 19, !dbg !43
  store i32 19, i32* %43, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 20, metadata !36, metadata !DIExpression()), !dbg !38
  %44 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 20, !dbg !40
  store i32 20, i32* %44, align 4, !dbg !42
  %45 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 20, !dbg !43
  store i32 20, i32* %45, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 21, metadata !36, metadata !DIExpression()), !dbg !38
  %46 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 21, !dbg !40
  store i32 21, i32* %46, align 4, !dbg !42
  %47 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 21, !dbg !43
  store i32 21, i32* %47, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 22, metadata !36, metadata !DIExpression()), !dbg !38
  %48 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 22, !dbg !40
  store i32 22, i32* %48, align 4, !dbg !42
  %49 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 22, !dbg !43
  store i32 22, i32* %49, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 23, metadata !36, metadata !DIExpression()), !dbg !38
  %50 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 23, !dbg !40
  store i32 23, i32* %50, align 4, !dbg !42
  %51 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 23, !dbg !43
  store i32 23, i32* %51, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 24, metadata !36, metadata !DIExpression()), !dbg !38
  %52 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 24, !dbg !40
  store i32 24, i32* %52, align 4, !dbg !42
  %53 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 24, !dbg !43
  store i32 24, i32* %53, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 25, metadata !36, metadata !DIExpression()), !dbg !38
  %54 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 25, !dbg !40
  store i32 25, i32* %54, align 4, !dbg !42
  %55 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 25, !dbg !43
  store i32 25, i32* %55, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 26, metadata !36, metadata !DIExpression()), !dbg !38
  %56 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 26, !dbg !40
  store i32 26, i32* %56, align 4, !dbg !42
  %57 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 26, !dbg !43
  store i32 26, i32* %57, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 27, metadata !36, metadata !DIExpression()), !dbg !38
  %58 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 27, !dbg !40
  store i32 27, i32* %58, align 4, !dbg !42
  %59 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 27, !dbg !43
  store i32 27, i32* %59, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 28, metadata !36, metadata !DIExpression()), !dbg !38
  %60 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 28, !dbg !40
  store i32 28, i32* %60, align 4, !dbg !42
  %61 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 28, !dbg !43
  store i32 28, i32* %61, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 29, metadata !36, metadata !DIExpression()), !dbg !38
  %62 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 29, !dbg !40
  store i32 29, i32* %62, align 4, !dbg !42
  %63 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 29, !dbg !43
  store i32 29, i32* %63, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 30, metadata !36, metadata !DIExpression()), !dbg !38
  %64 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 30, !dbg !40
  store i32 30, i32* %64, align 4, !dbg !42
  %65 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 30, !dbg !43
  store i32 30, i32* %65, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 31, metadata !36, metadata !DIExpression()), !dbg !38
  %66 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 31, !dbg !40
  store i32 31, i32* %66, align 4, !dbg !42
  %67 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 31, !dbg !43
  store i32 31, i32* %67, align 4, !dbg !44
  call void @llvm.dbg.value(metadata i64 32, metadata !36, metadata !DIExpression()), !dbg !38
  %68 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 0, !dbg !45
  %69 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 0, !dbg !46
  %70 = sext i32 32 to i64
  %71 = sext i32 32 to i64
  %72 = call i32 @comp(i32* %68, i64 %70, i32* %69, i64 %71), !dbg !47
  call void @llvm.dbg.value(metadata i32 %72, metadata !48, metadata !DIExpression()), !dbg !49
  %73 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %72), !dbg !50
  ret i32 0, !dbg !51
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "comp/sources/comp1.c", directory: "/home/luigi/dev/ufmg/static-analysis/side-channel/lif/llvm/bench")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"PIE Level", i32 2}
!8 = !{!"clang version 10.0.0 "}
!9 = distinct !DISubprogram(name: "comp", scope: !1, file: !1, line: 5, type: !10, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !13, !13}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 5, type: !13)
!15 = !DILocation(line: 0, scope: !9)
!16 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 5, type: !13)
!17 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 6, type: !12)
!18 = distinct !DILexicalBlock(scope: !9, file: !1, line: 6, column: 5)
!19 = !DILocation(line: 0, scope: !18)
!20 = !DILocation(line: 7, column: 13, scope: !21)
!21 = distinct !DILexicalBlock(scope: !22, file: !1, line: 7, column: 13)
!22 = distinct !DILexicalBlock(scope: !18, file: !1, line: 6, column: 5)
!23 = !DILocation(line: 7, column: 21, scope: !21)
!24 = !DILocation(line: 7, column: 18, scope: !21)
!25 = !DILocation(line: 9, column: 1, scope: !9)
!26 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 11, type: !27, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{!12}
!29 = !DILocalVariable(name: "a", scope: !26, file: !1, line: 12, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1024, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 32)
!33 = !DILocation(line: 12, column: 9, scope: !26)
!34 = !DILocalVariable(name: "b", scope: !26, file: !1, line: 12, type: !30)
!35 = !DILocation(line: 12, column: 15, scope: !26)
!36 = !DILocalVariable(name: "i", scope: !37, file: !1, line: 13, type: !12)
!37 = distinct !DILexicalBlock(scope: !26, file: !1, line: 13, column: 5)
!38 = !DILocation(line: 0, scope: !37)
!39 = !DILocation(line: 13, column: 5, scope: !37)
!40 = !DILocation(line: 13, column: 40, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !1, line: 13, column: 5)
!42 = !DILocation(line: 13, column: 45, scope: !41)
!43 = !DILocation(line: 13, column: 33, scope: !41)
!44 = !DILocation(line: 13, column: 38, scope: !41)
!45 = !DILocation(line: 14, column: 18, scope: !26)
!46 = !DILocation(line: 14, column: 21, scope: !26)
!47 = !DILocation(line: 14, column: 13, scope: !26)
!48 = !DILocalVariable(name: "r", scope: !26, file: !1, line: 14, type: !12)
!49 = !DILocation(line: 0, scope: !26)
!50 = !DILocation(line: 15, column: 5, scope: !26)
!51 = !DILocation(line: 16, column: 5, scope: !26)

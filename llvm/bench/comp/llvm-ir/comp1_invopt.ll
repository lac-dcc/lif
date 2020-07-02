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
  %3 = load i32, i32* %0, align 4, !dbg !20
  %4 = load i32, i32* %1, align 4, !dbg !23
  %5 = icmp ne i32 %3, %4, !dbg !24
  call void @llvm.dbg.value(metadata i32 1, metadata !17, metadata !DIExpression()), !dbg !19
  %6 = xor i1 %5, true
  %7 = getelementptr inbounds i32, i32* %0, i64 1, !dbg !20
  %8 = icmp slt i64 1, %len.
  %9 = bitcast i64* %shadow to i32*
  %safe. = or i1 %6, %8
  %select.ptr. = select i1 %safe., i32* %7, i32* %9
  %10 = load i32, i32* %select.ptr., align 4, !dbg !20
  %11 = getelementptr inbounds i32, i32* %1, i64 1, !dbg !23
  %12 = icmp slt i64 1, %len.1
  %safe.99 = or i1 %6, %12
  %select.ptr.100 = select i1 %safe.99, i32* %11, i32* %9
  %13 = load i32, i32* %select.ptr.100, align 4, !dbg !23
  %14 = icmp ne i32 %10, %13, !dbg !24
  call void @llvm.dbg.value(metadata i32 2, metadata !17, metadata !DIExpression()), !dbg !19
  %15 = xor i1 %14, true
  %in.68 = and i1 %6, %15
  %16 = getelementptr inbounds i32, i32* %0, i64 2, !dbg !20
  %17 = icmp slt i64 2, %len.
  %safe.101 = or i1 %in.68, %17
  %select.ptr.102 = select i1 %safe.101, i32* %16, i32* %9
  %18 = load i32, i32* %select.ptr.102, align 4, !dbg !20
  %19 = getelementptr inbounds i32, i32* %1, i64 2, !dbg !23
  %20 = icmp slt i64 2, %len.1
  %safe.103 = or i1 %in.68, %20
  %select.ptr.104 = select i1 %safe.103, i32* %19, i32* %9
  %21 = load i32, i32* %select.ptr.104, align 4, !dbg !23
  %22 = icmp ne i32 %18, %21, !dbg !24
  call void @llvm.dbg.value(metadata i32 3, metadata !17, metadata !DIExpression()), !dbg !19
  %23 = xor i1 %22, true
  %in.69 = and i1 %in.68, %23
  %24 = getelementptr inbounds i32, i32* %0, i64 3, !dbg !20
  %25 = icmp slt i64 3, %len.
  %safe.105 = or i1 %in.69, %25
  %select.ptr.106 = select i1 %safe.105, i32* %24, i32* %9
  %26 = load i32, i32* %select.ptr.106, align 4, !dbg !20
  %27 = getelementptr inbounds i32, i32* %1, i64 3, !dbg !23
  %28 = icmp slt i64 3, %len.1
  %safe.107 = or i1 %in.69, %28
  %select.ptr.108 = select i1 %safe.107, i32* %27, i32* %9
  %29 = load i32, i32* %select.ptr.108, align 4, !dbg !23
  %30 = icmp ne i32 %26, %29, !dbg !24
  call void @llvm.dbg.value(metadata i32 4, metadata !17, metadata !DIExpression()), !dbg !19
  %31 = xor i1 %30, true
  %in.70 = and i1 %in.69, %31
  %32 = getelementptr inbounds i32, i32* %0, i64 4, !dbg !20
  %33 = icmp slt i64 4, %len.
  %safe.109 = or i1 %in.70, %33
  %select.ptr.110 = select i1 %safe.109, i32* %32, i32* %9
  %34 = load i32, i32* %select.ptr.110, align 4, !dbg !20
  %35 = getelementptr inbounds i32, i32* %1, i64 4, !dbg !23
  %36 = icmp slt i64 4, %len.1
  %safe.111 = or i1 %in.70, %36
  %select.ptr.112 = select i1 %safe.111, i32* %35, i32* %9
  %37 = load i32, i32* %select.ptr.112, align 4, !dbg !23
  %38 = icmp ne i32 %34, %37, !dbg !24
  call void @llvm.dbg.value(metadata i32 5, metadata !17, metadata !DIExpression()), !dbg !19
  %39 = xor i1 %38, true
  %in.71 = and i1 %in.70, %39
  %40 = getelementptr inbounds i32, i32* %0, i64 5, !dbg !20
  %41 = icmp slt i64 5, %len.
  %safe.113 = or i1 %in.71, %41
  %select.ptr.114 = select i1 %safe.113, i32* %40, i32* %9
  %42 = load i32, i32* %select.ptr.114, align 4, !dbg !20
  %43 = getelementptr inbounds i32, i32* %1, i64 5, !dbg !23
  %44 = icmp slt i64 5, %len.1
  %safe.115 = or i1 %in.71, %44
  %select.ptr.116 = select i1 %safe.115, i32* %43, i32* %9
  %45 = load i32, i32* %select.ptr.116, align 4, !dbg !23
  %46 = icmp ne i32 %42, %45, !dbg !24
  call void @llvm.dbg.value(metadata i32 6, metadata !17, metadata !DIExpression()), !dbg !19
  %47 = xor i1 %46, true
  %in.72 = and i1 %in.71, %47
  %48 = getelementptr inbounds i32, i32* %0, i64 6, !dbg !20
  %49 = icmp slt i64 6, %len.
  %safe.117 = or i1 %in.72, %49
  %select.ptr.118 = select i1 %safe.117, i32* %48, i32* %9
  %50 = load i32, i32* %select.ptr.118, align 4, !dbg !20
  %51 = getelementptr inbounds i32, i32* %1, i64 6, !dbg !23
  %52 = icmp slt i64 6, %len.1
  %safe.119 = or i1 %in.72, %52
  %select.ptr.120 = select i1 %safe.119, i32* %51, i32* %9
  %53 = load i32, i32* %select.ptr.120, align 4, !dbg !23
  %54 = icmp ne i32 %50, %53, !dbg !24
  call void @llvm.dbg.value(metadata i32 7, metadata !17, metadata !DIExpression()), !dbg !19
  %55 = xor i1 %54, true
  %in.73 = and i1 %in.72, %55
  %56 = getelementptr inbounds i32, i32* %0, i64 7, !dbg !20
  %57 = icmp slt i64 7, %len.
  %safe.121 = or i1 %in.73, %57
  %select.ptr.122 = select i1 %safe.121, i32* %56, i32* %9
  %58 = load i32, i32* %select.ptr.122, align 4, !dbg !20
  %59 = getelementptr inbounds i32, i32* %1, i64 7, !dbg !23
  %60 = icmp slt i64 7, %len.1
  %safe.123 = or i1 %in.73, %60
  %select.ptr.124 = select i1 %safe.123, i32* %59, i32* %9
  %61 = load i32, i32* %select.ptr.124, align 4, !dbg !23
  %62 = icmp ne i32 %58, %61, !dbg !24
  call void @llvm.dbg.value(metadata i32 8, metadata !17, metadata !DIExpression()), !dbg !19
  %63 = xor i1 %62, true
  %in.74 = and i1 %in.73, %63
  %64 = getelementptr inbounds i32, i32* %0, i64 8, !dbg !20
  %65 = icmp slt i64 8, %len.
  %safe.125 = or i1 %in.74, %65
  %select.ptr.126 = select i1 %safe.125, i32* %64, i32* %9
  %66 = load i32, i32* %select.ptr.126, align 4, !dbg !20
  %67 = getelementptr inbounds i32, i32* %1, i64 8, !dbg !23
  %68 = icmp slt i64 8, %len.1
  %safe.127 = or i1 %in.74, %68
  %select.ptr.128 = select i1 %safe.127, i32* %67, i32* %9
  %69 = load i32, i32* %select.ptr.128, align 4, !dbg !23
  %70 = icmp ne i32 %66, %69, !dbg !24
  call void @llvm.dbg.value(metadata i32 9, metadata !17, metadata !DIExpression()), !dbg !19
  %71 = xor i1 %70, true
  %in.75 = and i1 %in.74, %71
  %72 = getelementptr inbounds i32, i32* %0, i64 9, !dbg !20
  %73 = icmp slt i64 9, %len.
  %safe.129 = or i1 %in.75, %73
  %select.ptr.130 = select i1 %safe.129, i32* %72, i32* %9
  %74 = load i32, i32* %select.ptr.130, align 4, !dbg !20
  %75 = getelementptr inbounds i32, i32* %1, i64 9, !dbg !23
  %76 = icmp slt i64 9, %len.1
  %safe.131 = or i1 %in.75, %76
  %select.ptr.132 = select i1 %safe.131, i32* %75, i32* %9
  %77 = load i32, i32* %select.ptr.132, align 4, !dbg !23
  %78 = icmp ne i32 %74, %77, !dbg !24
  call void @llvm.dbg.value(metadata i32 10, metadata !17, metadata !DIExpression()), !dbg !19
  %79 = xor i1 %78, true
  %in.76 = and i1 %in.75, %79
  %80 = getelementptr inbounds i32, i32* %0, i64 10, !dbg !20
  %81 = icmp slt i64 10, %len.
  %safe.133 = or i1 %in.76, %81
  %select.ptr.134 = select i1 %safe.133, i32* %80, i32* %9
  %82 = load i32, i32* %select.ptr.134, align 4, !dbg !20
  %83 = getelementptr inbounds i32, i32* %1, i64 10, !dbg !23
  %84 = icmp slt i64 10, %len.1
  %safe.135 = or i1 %in.76, %84
  %select.ptr.136 = select i1 %safe.135, i32* %83, i32* %9
  %85 = load i32, i32* %select.ptr.136, align 4, !dbg !23
  %86 = icmp ne i32 %82, %85, !dbg !24
  call void @llvm.dbg.value(metadata i32 11, metadata !17, metadata !DIExpression()), !dbg !19
  %87 = xor i1 %86, true
  %in.77 = and i1 %in.76, %87
  %88 = getelementptr inbounds i32, i32* %0, i64 11, !dbg !20
  %89 = icmp slt i64 11, %len.
  %safe.137 = or i1 %in.77, %89
  %select.ptr.138 = select i1 %safe.137, i32* %88, i32* %9
  %90 = load i32, i32* %select.ptr.138, align 4, !dbg !20
  %91 = getelementptr inbounds i32, i32* %1, i64 11, !dbg !23
  %92 = icmp slt i64 11, %len.1
  %safe.139 = or i1 %in.77, %92
  %select.ptr.140 = select i1 %safe.139, i32* %91, i32* %9
  %93 = load i32, i32* %select.ptr.140, align 4, !dbg !23
  %94 = icmp ne i32 %90, %93, !dbg !24
  call void @llvm.dbg.value(metadata i32 12, metadata !17, metadata !DIExpression()), !dbg !19
  %95 = xor i1 %94, true
  %in.78 = and i1 %in.77, %95
  %96 = getelementptr inbounds i32, i32* %0, i64 12, !dbg !20
  %97 = icmp slt i64 12, %len.
  %safe.141 = or i1 %in.78, %97
  %select.ptr.142 = select i1 %safe.141, i32* %96, i32* %9
  %98 = load i32, i32* %select.ptr.142, align 4, !dbg !20
  %99 = getelementptr inbounds i32, i32* %1, i64 12, !dbg !23
  %100 = icmp slt i64 12, %len.1
  %safe.143 = or i1 %in.78, %100
  %select.ptr.144 = select i1 %safe.143, i32* %99, i32* %9
  %101 = load i32, i32* %select.ptr.144, align 4, !dbg !23
  %102 = icmp ne i32 %98, %101, !dbg !24
  call void @llvm.dbg.value(metadata i32 13, metadata !17, metadata !DIExpression()), !dbg !19
  %103 = xor i1 %102, true
  %in.79 = and i1 %in.78, %103
  %104 = getelementptr inbounds i32, i32* %0, i64 13, !dbg !20
  %105 = icmp slt i64 13, %len.
  %safe.145 = or i1 %in.79, %105
  %select.ptr.146 = select i1 %safe.145, i32* %104, i32* %9
  %106 = load i32, i32* %select.ptr.146, align 4, !dbg !20
  %107 = getelementptr inbounds i32, i32* %1, i64 13, !dbg !23
  %108 = icmp slt i64 13, %len.1
  %safe.147 = or i1 %in.79, %108
  %select.ptr.148 = select i1 %safe.147, i32* %107, i32* %9
  %109 = load i32, i32* %select.ptr.148, align 4, !dbg !23
  %110 = icmp ne i32 %106, %109, !dbg !24
  call void @llvm.dbg.value(metadata i32 14, metadata !17, metadata !DIExpression()), !dbg !19
  %111 = xor i1 %110, true
  %in.80 = and i1 %in.79, %111
  %112 = getelementptr inbounds i32, i32* %0, i64 14, !dbg !20
  %113 = icmp slt i64 14, %len.
  %safe.149 = or i1 %in.80, %113
  %select.ptr.150 = select i1 %safe.149, i32* %112, i32* %9
  %114 = load i32, i32* %select.ptr.150, align 4, !dbg !20
  %115 = getelementptr inbounds i32, i32* %1, i64 14, !dbg !23
  %116 = icmp slt i64 14, %len.1
  %safe.151 = or i1 %in.80, %116
  %select.ptr.152 = select i1 %safe.151, i32* %115, i32* %9
  %117 = load i32, i32* %select.ptr.152, align 4, !dbg !23
  %118 = icmp ne i32 %114, %117, !dbg !24
  call void @llvm.dbg.value(metadata i32 15, metadata !17, metadata !DIExpression()), !dbg !19
  %119 = xor i1 %118, true
  %in.81 = and i1 %in.80, %119
  %120 = getelementptr inbounds i32, i32* %0, i64 15, !dbg !20
  %121 = icmp slt i64 15, %len.
  %safe.153 = or i1 %in.81, %121
  %select.ptr.154 = select i1 %safe.153, i32* %120, i32* %9
  %122 = load i32, i32* %select.ptr.154, align 4, !dbg !20
  %123 = getelementptr inbounds i32, i32* %1, i64 15, !dbg !23
  %124 = icmp slt i64 15, %len.1
  %safe.155 = or i1 %in.81, %124
  %select.ptr.156 = select i1 %safe.155, i32* %123, i32* %9
  %125 = load i32, i32* %select.ptr.156, align 4, !dbg !23
  %126 = icmp ne i32 %122, %125, !dbg !24
  call void @llvm.dbg.value(metadata i32 16, metadata !17, metadata !DIExpression()), !dbg !19
  %127 = xor i1 %126, true
  %in.82 = and i1 %in.81, %127
  %128 = getelementptr inbounds i32, i32* %0, i64 16, !dbg !20
  %129 = icmp slt i64 16, %len.
  %safe.157 = or i1 %in.82, %129
  %select.ptr.158 = select i1 %safe.157, i32* %128, i32* %9
  %130 = load i32, i32* %select.ptr.158, align 4, !dbg !20
  %131 = getelementptr inbounds i32, i32* %1, i64 16, !dbg !23
  %132 = icmp slt i64 16, %len.1
  %safe.159 = or i1 %in.82, %132
  %select.ptr.160 = select i1 %safe.159, i32* %131, i32* %9
  %133 = load i32, i32* %select.ptr.160, align 4, !dbg !23
  %134 = icmp ne i32 %130, %133, !dbg !24
  call void @llvm.dbg.value(metadata i32 17, metadata !17, metadata !DIExpression()), !dbg !19
  %135 = xor i1 %134, true
  %in.83 = and i1 %in.82, %135
  %136 = getelementptr inbounds i32, i32* %0, i64 17, !dbg !20
  %137 = icmp slt i64 17, %len.
  %safe.161 = or i1 %in.83, %137
  %select.ptr.162 = select i1 %safe.161, i32* %136, i32* %9
  %138 = load i32, i32* %select.ptr.162, align 4, !dbg !20
  %139 = getelementptr inbounds i32, i32* %1, i64 17, !dbg !23
  %140 = icmp slt i64 17, %len.1
  %safe.163 = or i1 %in.83, %140
  %select.ptr.164 = select i1 %safe.163, i32* %139, i32* %9
  %141 = load i32, i32* %select.ptr.164, align 4, !dbg !23
  %142 = icmp ne i32 %138, %141, !dbg !24
  call void @llvm.dbg.value(metadata i32 18, metadata !17, metadata !DIExpression()), !dbg !19
  %143 = xor i1 %142, true
  %in.84 = and i1 %in.83, %143
  %144 = getelementptr inbounds i32, i32* %0, i64 18, !dbg !20
  %145 = icmp slt i64 18, %len.
  %safe.165 = or i1 %in.84, %145
  %select.ptr.166 = select i1 %safe.165, i32* %144, i32* %9
  %146 = load i32, i32* %select.ptr.166, align 4, !dbg !20
  %147 = getelementptr inbounds i32, i32* %1, i64 18, !dbg !23
  %148 = icmp slt i64 18, %len.1
  %safe.167 = or i1 %in.84, %148
  %select.ptr.168 = select i1 %safe.167, i32* %147, i32* %9
  %149 = load i32, i32* %select.ptr.168, align 4, !dbg !23
  %150 = icmp ne i32 %146, %149, !dbg !24
  call void @llvm.dbg.value(metadata i32 19, metadata !17, metadata !DIExpression()), !dbg !19
  %151 = xor i1 %150, true
  %in.85 = and i1 %in.84, %151
  %152 = getelementptr inbounds i32, i32* %0, i64 19, !dbg !20
  %153 = icmp slt i64 19, %len.
  %safe.169 = or i1 %in.85, %153
  %select.ptr.170 = select i1 %safe.169, i32* %152, i32* %9
  %154 = load i32, i32* %select.ptr.170, align 4, !dbg !20
  %155 = getelementptr inbounds i32, i32* %1, i64 19, !dbg !23
  %156 = icmp slt i64 19, %len.1
  %safe.171 = or i1 %in.85, %156
  %select.ptr.172 = select i1 %safe.171, i32* %155, i32* %9
  %157 = load i32, i32* %select.ptr.172, align 4, !dbg !23
  %158 = icmp ne i32 %154, %157, !dbg !24
  call void @llvm.dbg.value(metadata i32 20, metadata !17, metadata !DIExpression()), !dbg !19
  %159 = xor i1 %158, true
  %in.86 = and i1 %in.85, %159
  %160 = getelementptr inbounds i32, i32* %0, i64 20, !dbg !20
  %161 = icmp slt i64 20, %len.
  %safe.173 = or i1 %in.86, %161
  %select.ptr.174 = select i1 %safe.173, i32* %160, i32* %9
  %162 = load i32, i32* %select.ptr.174, align 4, !dbg !20
  %163 = getelementptr inbounds i32, i32* %1, i64 20, !dbg !23
  %164 = icmp slt i64 20, %len.1
  %safe.175 = or i1 %in.86, %164
  %select.ptr.176 = select i1 %safe.175, i32* %163, i32* %9
  %165 = load i32, i32* %select.ptr.176, align 4, !dbg !23
  %166 = icmp ne i32 %162, %165, !dbg !24
  call void @llvm.dbg.value(metadata i32 21, metadata !17, metadata !DIExpression()), !dbg !19
  %167 = xor i1 %166, true
  %in.87 = and i1 %in.86, %167
  %168 = getelementptr inbounds i32, i32* %0, i64 21, !dbg !20
  %169 = icmp slt i64 21, %len.
  %safe.177 = or i1 %in.87, %169
  %select.ptr.178 = select i1 %safe.177, i32* %168, i32* %9
  %170 = load i32, i32* %select.ptr.178, align 4, !dbg !20
  %171 = getelementptr inbounds i32, i32* %1, i64 21, !dbg !23
  %172 = icmp slt i64 21, %len.1
  %safe.179 = or i1 %in.87, %172
  %select.ptr.180 = select i1 %safe.179, i32* %171, i32* %9
  %173 = load i32, i32* %select.ptr.180, align 4, !dbg !23
  %174 = icmp ne i32 %170, %173, !dbg !24
  call void @llvm.dbg.value(metadata i32 22, metadata !17, metadata !DIExpression()), !dbg !19
  %175 = xor i1 %174, true
  %in.88 = and i1 %in.87, %175
  %176 = getelementptr inbounds i32, i32* %0, i64 22, !dbg !20
  %177 = icmp slt i64 22, %len.
  %safe.181 = or i1 %in.88, %177
  %select.ptr.182 = select i1 %safe.181, i32* %176, i32* %9
  %178 = load i32, i32* %select.ptr.182, align 4, !dbg !20
  %179 = getelementptr inbounds i32, i32* %1, i64 22, !dbg !23
  %180 = icmp slt i64 22, %len.1
  %safe.183 = or i1 %in.88, %180
  %select.ptr.184 = select i1 %safe.183, i32* %179, i32* %9
  %181 = load i32, i32* %select.ptr.184, align 4, !dbg !23
  %182 = icmp ne i32 %178, %181, !dbg !24
  call void @llvm.dbg.value(metadata i32 23, metadata !17, metadata !DIExpression()), !dbg !19
  %183 = xor i1 %182, true
  %in.89 = and i1 %in.88, %183
  %184 = getelementptr inbounds i32, i32* %0, i64 23, !dbg !20
  %185 = icmp slt i64 23, %len.
  %safe.185 = or i1 %in.89, %185
  %select.ptr.186 = select i1 %safe.185, i32* %184, i32* %9
  %186 = load i32, i32* %select.ptr.186, align 4, !dbg !20
  %187 = getelementptr inbounds i32, i32* %1, i64 23, !dbg !23
  %188 = icmp slt i64 23, %len.1
  %safe.187 = or i1 %in.89, %188
  %select.ptr.188 = select i1 %safe.187, i32* %187, i32* %9
  %189 = load i32, i32* %select.ptr.188, align 4, !dbg !23
  %190 = icmp ne i32 %186, %189, !dbg !24
  call void @llvm.dbg.value(metadata i32 24, metadata !17, metadata !DIExpression()), !dbg !19
  %191 = xor i1 %190, true
  %in.90 = and i1 %in.89, %191
  %192 = getelementptr inbounds i32, i32* %0, i64 24, !dbg !20
  %193 = icmp slt i64 24, %len.
  %safe.189 = or i1 %in.90, %193
  %select.ptr.190 = select i1 %safe.189, i32* %192, i32* %9
  %194 = load i32, i32* %select.ptr.190, align 4, !dbg !20
  %195 = getelementptr inbounds i32, i32* %1, i64 24, !dbg !23
  %196 = icmp slt i64 24, %len.1
  %safe.191 = or i1 %in.90, %196
  %select.ptr.192 = select i1 %safe.191, i32* %195, i32* %9
  %197 = load i32, i32* %select.ptr.192, align 4, !dbg !23
  %198 = icmp ne i32 %194, %197, !dbg !24
  call void @llvm.dbg.value(metadata i32 25, metadata !17, metadata !DIExpression()), !dbg !19
  %199 = xor i1 %198, true
  %in.91 = and i1 %in.90, %199
  %200 = getelementptr inbounds i32, i32* %0, i64 25, !dbg !20
  %201 = icmp slt i64 25, %len.
  %safe.193 = or i1 %in.91, %201
  %select.ptr.194 = select i1 %safe.193, i32* %200, i32* %9
  %202 = load i32, i32* %select.ptr.194, align 4, !dbg !20
  %203 = getelementptr inbounds i32, i32* %1, i64 25, !dbg !23
  %204 = icmp slt i64 25, %len.1
  %safe.195 = or i1 %in.91, %204
  %select.ptr.196 = select i1 %safe.195, i32* %203, i32* %9
  %205 = load i32, i32* %select.ptr.196, align 4, !dbg !23
  %206 = icmp ne i32 %202, %205, !dbg !24
  call void @llvm.dbg.value(metadata i32 26, metadata !17, metadata !DIExpression()), !dbg !19
  %207 = xor i1 %206, true
  %in.92 = and i1 %in.91, %207
  %208 = getelementptr inbounds i32, i32* %0, i64 26, !dbg !20
  %209 = icmp slt i64 26, %len.
  %safe.197 = or i1 %in.92, %209
  %select.ptr.198 = select i1 %safe.197, i32* %208, i32* %9
  %210 = load i32, i32* %select.ptr.198, align 4, !dbg !20
  %211 = getelementptr inbounds i32, i32* %1, i64 26, !dbg !23
  %212 = icmp slt i64 26, %len.1
  %safe.199 = or i1 %in.92, %212
  %select.ptr.200 = select i1 %safe.199, i32* %211, i32* %9
  %213 = load i32, i32* %select.ptr.200, align 4, !dbg !23
  %214 = icmp ne i32 %210, %213, !dbg !24
  call void @llvm.dbg.value(metadata i32 27, metadata !17, metadata !DIExpression()), !dbg !19
  %215 = xor i1 %214, true
  %in.93 = and i1 %in.92, %215
  %216 = getelementptr inbounds i32, i32* %0, i64 27, !dbg !20
  %217 = icmp slt i64 27, %len.
  %safe.201 = or i1 %in.93, %217
  %select.ptr.202 = select i1 %safe.201, i32* %216, i32* %9
  %218 = load i32, i32* %select.ptr.202, align 4, !dbg !20
  %219 = getelementptr inbounds i32, i32* %1, i64 27, !dbg !23
  %220 = icmp slt i64 27, %len.1
  %safe.203 = or i1 %in.93, %220
  %select.ptr.204 = select i1 %safe.203, i32* %219, i32* %9
  %221 = load i32, i32* %select.ptr.204, align 4, !dbg !23
  %222 = icmp ne i32 %218, %221, !dbg !24
  call void @llvm.dbg.value(metadata i32 28, metadata !17, metadata !DIExpression()), !dbg !19
  %223 = xor i1 %222, true
  %in.94 = and i1 %in.93, %223
  %224 = getelementptr inbounds i32, i32* %0, i64 28, !dbg !20
  %225 = icmp slt i64 28, %len.
  %safe.205 = or i1 %in.94, %225
  %select.ptr.206 = select i1 %safe.205, i32* %224, i32* %9
  %226 = load i32, i32* %select.ptr.206, align 4, !dbg !20
  %227 = getelementptr inbounds i32, i32* %1, i64 28, !dbg !23
  %228 = icmp slt i64 28, %len.1
  %safe.207 = or i1 %in.94, %228
  %select.ptr.208 = select i1 %safe.207, i32* %227, i32* %9
  %229 = load i32, i32* %select.ptr.208, align 4, !dbg !23
  %230 = icmp ne i32 %226, %229, !dbg !24
  call void @llvm.dbg.value(metadata i32 29, metadata !17, metadata !DIExpression()), !dbg !19
  %231 = xor i1 %230, true
  %in.95 = and i1 %in.94, %231
  %232 = getelementptr inbounds i32, i32* %0, i64 29, !dbg !20
  %233 = icmp slt i64 29, %len.
  %safe.209 = or i1 %in.95, %233
  %select.ptr.210 = select i1 %safe.209, i32* %232, i32* %9
  %234 = load i32, i32* %select.ptr.210, align 4, !dbg !20
  %235 = getelementptr inbounds i32, i32* %1, i64 29, !dbg !23
  %236 = icmp slt i64 29, %len.1
  %safe.211 = or i1 %in.95, %236
  %select.ptr.212 = select i1 %safe.211, i32* %235, i32* %9
  %237 = load i32, i32* %select.ptr.212, align 4, !dbg !23
  %238 = icmp ne i32 %234, %237, !dbg !24
  call void @llvm.dbg.value(metadata i32 30, metadata !17, metadata !DIExpression()), !dbg !19
  %239 = xor i1 %238, true
  %in.96 = and i1 %in.95, %239
  %240 = getelementptr inbounds i32, i32* %0, i64 30, !dbg !20
  %241 = icmp slt i64 30, %len.
  %safe.213 = or i1 %in.96, %241
  %select.ptr.214 = select i1 %safe.213, i32* %240, i32* %9
  %242 = load i32, i32* %select.ptr.214, align 4, !dbg !20
  %243 = getelementptr inbounds i32, i32* %1, i64 30, !dbg !23
  %244 = icmp slt i64 30, %len.1
  %safe.215 = or i1 %in.96, %244
  %select.ptr.216 = select i1 %safe.215, i32* %243, i32* %9
  %245 = load i32, i32* %select.ptr.216, align 4, !dbg !23
  %246 = icmp ne i32 %242, %245, !dbg !24
  call void @llvm.dbg.value(metadata i32 31, metadata !17, metadata !DIExpression()), !dbg !19
  %247 = xor i1 %246, true
  %in.97 = and i1 %in.96, %247
  %248 = getelementptr inbounds i32, i32* %0, i64 31, !dbg !20
  %249 = icmp slt i64 31, %len.
  %safe.217 = or i1 %in.97, %249
  %select.ptr.218 = select i1 %safe.217, i32* %248, i32* %9
  %250 = load i32, i32* %select.ptr.218, align 4, !dbg !20
  %251 = getelementptr inbounds i32, i32* %1, i64 31, !dbg !23
  %252 = icmp slt i64 31, %len.1
  %safe.219 = or i1 %in.97, %252
  %select.ptr.220 = select i1 %safe.219, i32* %251, i32* %9
  %253 = load i32, i32* %select.ptr.220, align 4, !dbg !23
  %254 = icmp ne i32 %250, %253, !dbg !24
  call void @llvm.dbg.value(metadata i32 32, metadata !17, metadata !DIExpression()), !dbg !19
  %255 = xor i1 %254, true
  %in.98 = and i1 %in.97, %255
  %256 = sext i1 %in.98 to i32
  %257 = sub i32 0, %256
  %258 = and i32 1, %257
  ret i32 %258, !dbg !25
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

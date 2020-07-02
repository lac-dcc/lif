; ModuleID = 'comp/llvm-ir/invar.ll'
source_filename = "comp1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @comp(i32* %len.1, i64 %len.len.1, i64 %len.11, i32* %len.12, i64 %len.len.13, i64 %len.14) #0 !dbg !9 {
  call void @llvm.dbg.value(metadata i32* %len.1, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32* %len.12, metadata !16, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 0, metadata !17, metadata !DIExpression()), !dbg !19
  %shadow = alloca i64
  %1 = load i32, i32* %len.1, align 4, !dbg !20
  %2 = load i32, i32* %len.12, align 4, !dbg !23
  %3 = icmp ne i32 %1, %2, !dbg !24
  call void @llvm.dbg.value(metadata i32 1, metadata !17, metadata !DIExpression()), !dbg !19
  %4 = xor i1 %3, true
  %5 = getelementptr inbounds i32, i32* %len.1, i64 1, !dbg !20
  %6 = icmp slt i64 1, %len.11
  %7 = bitcast i64* %shadow to i32*
  %safe. = or i1 %4, %6
  %select.ptr. = select i1 %safe., i32* %5, i32* %7
  %8 = load i32, i32* %select.ptr., align 4, !dbg !20
  %9 = getelementptr inbounds i32, i32* %len.12, i64 1, !dbg !23
  %10 = icmp slt i64 1, %len.14
  %safe.99 = or i1 %4, %10
  %select.ptr.100 = select i1 %safe.99, i32* %9, i32* %7
  %11 = load i32, i32* %select.ptr.100, align 4, !dbg !23
  %12 = icmp ne i32 %8, %11, !dbg !24
  call void @llvm.dbg.value(metadata i32 2, metadata !17, metadata !DIExpression()), !dbg !19
  %13 = xor i1 %12, true
  %in.68 = and i1 %4, %13
  %14 = getelementptr inbounds i32, i32* %len.1, i64 2, !dbg !20
  %15 = icmp slt i64 2, %len.11
  %safe.101 = or i1 %in.68, %15
  %select.ptr.102 = select i1 %safe.101, i32* %14, i32* %7
  %16 = load i32, i32* %select.ptr.102, align 4, !dbg !20
  %17 = getelementptr inbounds i32, i32* %len.12, i64 2, !dbg !23
  %18 = icmp slt i64 2, %len.14
  %safe.103 = or i1 %in.68, %18
  %select.ptr.104 = select i1 %safe.103, i32* %17, i32* %7
  %19 = load i32, i32* %select.ptr.104, align 4, !dbg !23
  %20 = icmp ne i32 %16, %19, !dbg !24
  call void @llvm.dbg.value(metadata i32 3, metadata !17, metadata !DIExpression()), !dbg !19
  %21 = xor i1 %20, true
  %in.69 = and i1 %in.68, %21
  %22 = getelementptr inbounds i32, i32* %len.1, i64 3, !dbg !20
  %23 = icmp slt i64 3, %len.11
  %safe.105 = or i1 %in.69, %23
  %select.ptr.106 = select i1 %safe.105, i32* %22, i32* %7
  %24 = load i32, i32* %select.ptr.106, align 4, !dbg !20
  %25 = getelementptr inbounds i32, i32* %len.12, i64 3, !dbg !23
  %26 = icmp slt i64 3, %len.14
  %safe.107 = or i1 %in.69, %26
  %select.ptr.108 = select i1 %safe.107, i32* %25, i32* %7
  %27 = load i32, i32* %select.ptr.108, align 4, !dbg !23
  %28 = icmp ne i32 %24, %27, !dbg !24
  call void @llvm.dbg.value(metadata i32 4, metadata !17, metadata !DIExpression()), !dbg !19
  %29 = xor i1 %28, true
  %in.70 = and i1 %in.69, %29
  %30 = getelementptr inbounds i32, i32* %len.1, i64 4, !dbg !20
  %31 = icmp slt i64 4, %len.11
  %safe.109 = or i1 %in.70, %31
  %select.ptr.110 = select i1 %safe.109, i32* %30, i32* %7
  %32 = load i32, i32* %select.ptr.110, align 4, !dbg !20
  %33 = getelementptr inbounds i32, i32* %len.12, i64 4, !dbg !23
  %34 = icmp slt i64 4, %len.14
  %safe.111 = or i1 %in.70, %34
  %select.ptr.112 = select i1 %safe.111, i32* %33, i32* %7
  %35 = load i32, i32* %select.ptr.112, align 4, !dbg !23
  %36 = icmp ne i32 %32, %35, !dbg !24
  call void @llvm.dbg.value(metadata i32 5, metadata !17, metadata !DIExpression()), !dbg !19
  %37 = xor i1 %36, true
  %in.71 = and i1 %in.70, %37
  %38 = getelementptr inbounds i32, i32* %len.1, i64 5, !dbg !20
  %39 = icmp slt i64 5, %len.11
  %safe.113 = or i1 %in.71, %39
  %select.ptr.114 = select i1 %safe.113, i32* %38, i32* %7
  %40 = load i32, i32* %select.ptr.114, align 4, !dbg !20
  %41 = getelementptr inbounds i32, i32* %len.12, i64 5, !dbg !23
  %42 = icmp slt i64 5, %len.14
  %safe.115 = or i1 %in.71, %42
  %select.ptr.116 = select i1 %safe.115, i32* %41, i32* %7
  %43 = load i32, i32* %select.ptr.116, align 4, !dbg !23
  %44 = icmp ne i32 %40, %43, !dbg !24
  call void @llvm.dbg.value(metadata i32 6, metadata !17, metadata !DIExpression()), !dbg !19
  %45 = xor i1 %44, true
  %in.72 = and i1 %in.71, %45
  %46 = getelementptr inbounds i32, i32* %len.1, i64 6, !dbg !20
  %47 = icmp slt i64 6, %len.11
  %safe.117 = or i1 %in.72, %47
  %select.ptr.118 = select i1 %safe.117, i32* %46, i32* %7
  %48 = load i32, i32* %select.ptr.118, align 4, !dbg !20
  %49 = getelementptr inbounds i32, i32* %len.12, i64 6, !dbg !23
  %50 = icmp slt i64 6, %len.14
  %safe.119 = or i1 %in.72, %50
  %select.ptr.120 = select i1 %safe.119, i32* %49, i32* %7
  %51 = load i32, i32* %select.ptr.120, align 4, !dbg !23
  %52 = icmp ne i32 %48, %51, !dbg !24
  call void @llvm.dbg.value(metadata i32 7, metadata !17, metadata !DIExpression()), !dbg !19
  %53 = xor i1 %52, true
  %in.73 = and i1 %in.72, %53
  %54 = getelementptr inbounds i32, i32* %len.1, i64 7, !dbg !20
  %55 = icmp slt i64 7, %len.11
  %safe.121 = or i1 %in.73, %55
  %select.ptr.122 = select i1 %safe.121, i32* %54, i32* %7
  %56 = load i32, i32* %select.ptr.122, align 4, !dbg !20
  %57 = getelementptr inbounds i32, i32* %len.12, i64 7, !dbg !23
  %58 = icmp slt i64 7, %len.14
  %safe.123 = or i1 %in.73, %58
  %select.ptr.124 = select i1 %safe.123, i32* %57, i32* %7
  %59 = load i32, i32* %select.ptr.124, align 4, !dbg !23
  %60 = icmp ne i32 %56, %59, !dbg !24
  call void @llvm.dbg.value(metadata i32 8, metadata !17, metadata !DIExpression()), !dbg !19
  %61 = xor i1 %60, true
  %in.74 = and i1 %in.73, %61
  %62 = getelementptr inbounds i32, i32* %len.1, i64 8, !dbg !20
  %63 = icmp slt i64 8, %len.11
  %safe.125 = or i1 %in.74, %63
  %select.ptr.126 = select i1 %safe.125, i32* %62, i32* %7
  %64 = load i32, i32* %select.ptr.126, align 4, !dbg !20
  %65 = getelementptr inbounds i32, i32* %len.12, i64 8, !dbg !23
  %66 = icmp slt i64 8, %len.14
  %safe.127 = or i1 %in.74, %66
  %select.ptr.128 = select i1 %safe.127, i32* %65, i32* %7
  %67 = load i32, i32* %select.ptr.128, align 4, !dbg !23
  %68 = icmp ne i32 %64, %67, !dbg !24
  call void @llvm.dbg.value(metadata i32 9, metadata !17, metadata !DIExpression()), !dbg !19
  %69 = xor i1 %68, true
  %in.75 = and i1 %in.74, %69
  %70 = getelementptr inbounds i32, i32* %len.1, i64 9, !dbg !20
  %71 = icmp slt i64 9, %len.11
  %safe.129 = or i1 %in.75, %71
  %select.ptr.130 = select i1 %safe.129, i32* %70, i32* %7
  %72 = load i32, i32* %select.ptr.130, align 4, !dbg !20
  %73 = getelementptr inbounds i32, i32* %len.12, i64 9, !dbg !23
  %74 = icmp slt i64 9, %len.14
  %safe.131 = or i1 %in.75, %74
  %select.ptr.132 = select i1 %safe.131, i32* %73, i32* %7
  %75 = load i32, i32* %select.ptr.132, align 4, !dbg !23
  %76 = icmp ne i32 %72, %75, !dbg !24
  call void @llvm.dbg.value(metadata i32 10, metadata !17, metadata !DIExpression()), !dbg !19
  %77 = xor i1 %76, true
  %in.76 = and i1 %in.75, %77
  %78 = getelementptr inbounds i32, i32* %len.1, i64 10, !dbg !20
  %79 = icmp slt i64 10, %len.11
  %safe.133 = or i1 %in.76, %79
  %select.ptr.134 = select i1 %safe.133, i32* %78, i32* %7
  %80 = load i32, i32* %select.ptr.134, align 4, !dbg !20
  %81 = getelementptr inbounds i32, i32* %len.12, i64 10, !dbg !23
  %82 = icmp slt i64 10, %len.14
  %safe.135 = or i1 %in.76, %82
  %select.ptr.136 = select i1 %safe.135, i32* %81, i32* %7
  %83 = load i32, i32* %select.ptr.136, align 4, !dbg !23
  %84 = icmp ne i32 %80, %83, !dbg !24
  call void @llvm.dbg.value(metadata i32 11, metadata !17, metadata !DIExpression()), !dbg !19
  %85 = xor i1 %84, true
  %in.77 = and i1 %in.76, %85
  %86 = getelementptr inbounds i32, i32* %len.1, i64 11, !dbg !20
  %87 = icmp slt i64 11, %len.11
  %safe.137 = or i1 %in.77, %87
  %select.ptr.138 = select i1 %safe.137, i32* %86, i32* %7
  %88 = load i32, i32* %select.ptr.138, align 4, !dbg !20
  %89 = getelementptr inbounds i32, i32* %len.12, i64 11, !dbg !23
  %90 = icmp slt i64 11, %len.14
  %safe.139 = or i1 %in.77, %90
  %select.ptr.140 = select i1 %safe.139, i32* %89, i32* %7
  %91 = load i32, i32* %select.ptr.140, align 4, !dbg !23
  %92 = icmp ne i32 %88, %91, !dbg !24
  call void @llvm.dbg.value(metadata i32 12, metadata !17, metadata !DIExpression()), !dbg !19
  %93 = xor i1 %92, true
  %in.78 = and i1 %in.77, %93
  %94 = getelementptr inbounds i32, i32* %len.1, i64 12, !dbg !20
  %95 = icmp slt i64 12, %len.11
  %safe.141 = or i1 %in.78, %95
  %select.ptr.142 = select i1 %safe.141, i32* %94, i32* %7
  %96 = load i32, i32* %select.ptr.142, align 4, !dbg !20
  %97 = getelementptr inbounds i32, i32* %len.12, i64 12, !dbg !23
  %98 = icmp slt i64 12, %len.14
  %safe.143 = or i1 %in.78, %98
  %select.ptr.144 = select i1 %safe.143, i32* %97, i32* %7
  %99 = load i32, i32* %select.ptr.144, align 4, !dbg !23
  %100 = icmp ne i32 %96, %99, !dbg !24
  call void @llvm.dbg.value(metadata i32 13, metadata !17, metadata !DIExpression()), !dbg !19
  %101 = xor i1 %100, true
  %in.79 = and i1 %in.78, %101
  %102 = getelementptr inbounds i32, i32* %len.1, i64 13, !dbg !20
  %103 = icmp slt i64 13, %len.11
  %safe.145 = or i1 %in.79, %103
  %select.ptr.146 = select i1 %safe.145, i32* %102, i32* %7
  %104 = load i32, i32* %select.ptr.146, align 4, !dbg !20
  %105 = getelementptr inbounds i32, i32* %len.12, i64 13, !dbg !23
  %106 = icmp slt i64 13, %len.14
  %safe.147 = or i1 %in.79, %106
  %select.ptr.148 = select i1 %safe.147, i32* %105, i32* %7
  %107 = load i32, i32* %select.ptr.148, align 4, !dbg !23
  %108 = icmp ne i32 %104, %107, !dbg !24
  call void @llvm.dbg.value(metadata i32 14, metadata !17, metadata !DIExpression()), !dbg !19
  %109 = xor i1 %108, true
  %in.80 = and i1 %in.79, %109
  %110 = getelementptr inbounds i32, i32* %len.1, i64 14, !dbg !20
  %111 = icmp slt i64 14, %len.11
  %safe.149 = or i1 %in.80, %111
  %select.ptr.150 = select i1 %safe.149, i32* %110, i32* %7
  %112 = load i32, i32* %select.ptr.150, align 4, !dbg !20
  %113 = getelementptr inbounds i32, i32* %len.12, i64 14, !dbg !23
  %114 = icmp slt i64 14, %len.14
  %safe.151 = or i1 %in.80, %114
  %select.ptr.152 = select i1 %safe.151, i32* %113, i32* %7
  %115 = load i32, i32* %select.ptr.152, align 4, !dbg !23
  %116 = icmp ne i32 %112, %115, !dbg !24
  call void @llvm.dbg.value(metadata i32 15, metadata !17, metadata !DIExpression()), !dbg !19
  %117 = xor i1 %116, true
  %in.81 = and i1 %in.80, %117
  %118 = getelementptr inbounds i32, i32* %len.1, i64 15, !dbg !20
  %119 = icmp slt i64 15, %len.11
  %safe.153 = or i1 %in.81, %119
  %select.ptr.154 = select i1 %safe.153, i32* %118, i32* %7
  %120 = load i32, i32* %select.ptr.154, align 4, !dbg !20
  %121 = getelementptr inbounds i32, i32* %len.12, i64 15, !dbg !23
  %122 = icmp slt i64 15, %len.14
  %safe.155 = or i1 %in.81, %122
  %select.ptr.156 = select i1 %safe.155, i32* %121, i32* %7
  %123 = load i32, i32* %select.ptr.156, align 4, !dbg !23
  %124 = icmp ne i32 %120, %123, !dbg !24
  call void @llvm.dbg.value(metadata i32 16, metadata !17, metadata !DIExpression()), !dbg !19
  %125 = xor i1 %124, true
  %in.82 = and i1 %in.81, %125
  %126 = getelementptr inbounds i32, i32* %len.1, i64 16, !dbg !20
  %127 = icmp slt i64 16, %len.11
  %safe.157 = or i1 %in.82, %127
  %select.ptr.158 = select i1 %safe.157, i32* %126, i32* %7
  %128 = load i32, i32* %select.ptr.158, align 4, !dbg !20
  %129 = getelementptr inbounds i32, i32* %len.12, i64 16, !dbg !23
  %130 = icmp slt i64 16, %len.14
  %safe.159 = or i1 %in.82, %130
  %select.ptr.160 = select i1 %safe.159, i32* %129, i32* %7
  %131 = load i32, i32* %select.ptr.160, align 4, !dbg !23
  %132 = icmp ne i32 %128, %131, !dbg !24
  call void @llvm.dbg.value(metadata i32 17, metadata !17, metadata !DIExpression()), !dbg !19
  %133 = xor i1 %132, true
  %in.83 = and i1 %in.82, %133
  %134 = getelementptr inbounds i32, i32* %len.1, i64 17, !dbg !20
  %135 = icmp slt i64 17, %len.11
  %safe.161 = or i1 %in.83, %135
  %select.ptr.162 = select i1 %safe.161, i32* %134, i32* %7
  %136 = load i32, i32* %select.ptr.162, align 4, !dbg !20
  %137 = getelementptr inbounds i32, i32* %len.12, i64 17, !dbg !23
  %138 = icmp slt i64 17, %len.14
  %safe.163 = or i1 %in.83, %138
  %select.ptr.164 = select i1 %safe.163, i32* %137, i32* %7
  %139 = load i32, i32* %select.ptr.164, align 4, !dbg !23
  %140 = icmp ne i32 %136, %139, !dbg !24
  call void @llvm.dbg.value(metadata i32 18, metadata !17, metadata !DIExpression()), !dbg !19
  %141 = xor i1 %140, true
  %in.84 = and i1 %in.83, %141
  %142 = getelementptr inbounds i32, i32* %len.1, i64 18, !dbg !20
  %143 = icmp slt i64 18, %len.11
  %safe.165 = or i1 %in.84, %143
  %select.ptr.166 = select i1 %safe.165, i32* %142, i32* %7
  %144 = load i32, i32* %select.ptr.166, align 4, !dbg !20
  %145 = getelementptr inbounds i32, i32* %len.12, i64 18, !dbg !23
  %146 = icmp slt i64 18, %len.14
  %safe.167 = or i1 %in.84, %146
  %select.ptr.168 = select i1 %safe.167, i32* %145, i32* %7
  %147 = load i32, i32* %select.ptr.168, align 4, !dbg !23
  %148 = icmp ne i32 %144, %147, !dbg !24
  call void @llvm.dbg.value(metadata i32 19, metadata !17, metadata !DIExpression()), !dbg !19
  %149 = xor i1 %148, true
  %in.85 = and i1 %in.84, %149
  %150 = getelementptr inbounds i32, i32* %len.1, i64 19, !dbg !20
  %151 = icmp slt i64 19, %len.11
  %safe.169 = or i1 %in.85, %151
  %select.ptr.170 = select i1 %safe.169, i32* %150, i32* %7
  %152 = load i32, i32* %select.ptr.170, align 4, !dbg !20
  %153 = getelementptr inbounds i32, i32* %len.12, i64 19, !dbg !23
  %154 = icmp slt i64 19, %len.14
  %safe.171 = or i1 %in.85, %154
  %select.ptr.172 = select i1 %safe.171, i32* %153, i32* %7
  %155 = load i32, i32* %select.ptr.172, align 4, !dbg !23
  %156 = icmp ne i32 %152, %155, !dbg !24
  call void @llvm.dbg.value(metadata i32 20, metadata !17, metadata !DIExpression()), !dbg !19
  %157 = xor i1 %156, true
  %in.86 = and i1 %in.85, %157
  %158 = getelementptr inbounds i32, i32* %len.1, i64 20, !dbg !20
  %159 = icmp slt i64 20, %len.11
  %safe.173 = or i1 %in.86, %159
  %select.ptr.174 = select i1 %safe.173, i32* %158, i32* %7
  %160 = load i32, i32* %select.ptr.174, align 4, !dbg !20
  %161 = getelementptr inbounds i32, i32* %len.12, i64 20, !dbg !23
  %162 = icmp slt i64 20, %len.14
  %safe.175 = or i1 %in.86, %162
  %select.ptr.176 = select i1 %safe.175, i32* %161, i32* %7
  %163 = load i32, i32* %select.ptr.176, align 4, !dbg !23
  %164 = icmp ne i32 %160, %163, !dbg !24
  call void @llvm.dbg.value(metadata i32 21, metadata !17, metadata !DIExpression()), !dbg !19
  %165 = xor i1 %164, true
  %in.87 = and i1 %in.86, %165
  %166 = getelementptr inbounds i32, i32* %len.1, i64 21, !dbg !20
  %167 = icmp slt i64 21, %len.11
  %safe.177 = or i1 %in.87, %167
  %select.ptr.178 = select i1 %safe.177, i32* %166, i32* %7
  %168 = load i32, i32* %select.ptr.178, align 4, !dbg !20
  %169 = getelementptr inbounds i32, i32* %len.12, i64 21, !dbg !23
  %170 = icmp slt i64 21, %len.14
  %safe.179 = or i1 %in.87, %170
  %select.ptr.180 = select i1 %safe.179, i32* %169, i32* %7
  %171 = load i32, i32* %select.ptr.180, align 4, !dbg !23
  %172 = icmp ne i32 %168, %171, !dbg !24
  call void @llvm.dbg.value(metadata i32 22, metadata !17, metadata !DIExpression()), !dbg !19
  %173 = xor i1 %172, true
  %in.88 = and i1 %in.87, %173
  %174 = getelementptr inbounds i32, i32* %len.1, i64 22, !dbg !20
  %175 = icmp slt i64 22, %len.11
  %safe.181 = or i1 %in.88, %175
  %select.ptr.182 = select i1 %safe.181, i32* %174, i32* %7
  %176 = load i32, i32* %select.ptr.182, align 4, !dbg !20
  %177 = getelementptr inbounds i32, i32* %len.12, i64 22, !dbg !23
  %178 = icmp slt i64 22, %len.14
  %safe.183 = or i1 %in.88, %178
  %select.ptr.184 = select i1 %safe.183, i32* %177, i32* %7
  %179 = load i32, i32* %select.ptr.184, align 4, !dbg !23
  %180 = icmp ne i32 %176, %179, !dbg !24
  call void @llvm.dbg.value(metadata i32 23, metadata !17, metadata !DIExpression()), !dbg !19
  %181 = xor i1 %180, true
  %in.89 = and i1 %in.88, %181
  %182 = getelementptr inbounds i32, i32* %len.1, i64 23, !dbg !20
  %183 = icmp slt i64 23, %len.11
  %safe.185 = or i1 %in.89, %183
  %select.ptr.186 = select i1 %safe.185, i32* %182, i32* %7
  %184 = load i32, i32* %select.ptr.186, align 4, !dbg !20
  %185 = getelementptr inbounds i32, i32* %len.12, i64 23, !dbg !23
  %186 = icmp slt i64 23, %len.14
  %safe.187 = or i1 %in.89, %186
  %select.ptr.188 = select i1 %safe.187, i32* %185, i32* %7
  %187 = load i32, i32* %select.ptr.188, align 4, !dbg !23
  %188 = icmp ne i32 %184, %187, !dbg !24
  call void @llvm.dbg.value(metadata i32 24, metadata !17, metadata !DIExpression()), !dbg !19
  %189 = xor i1 %188, true
  %in.90 = and i1 %in.89, %189
  %190 = getelementptr inbounds i32, i32* %len.1, i64 24, !dbg !20
  %191 = icmp slt i64 24, %len.11
  %safe.189 = or i1 %in.90, %191
  %select.ptr.190 = select i1 %safe.189, i32* %190, i32* %7
  %192 = load i32, i32* %select.ptr.190, align 4, !dbg !20
  %193 = getelementptr inbounds i32, i32* %len.12, i64 24, !dbg !23
  %194 = icmp slt i64 24, %len.14
  %safe.191 = or i1 %in.90, %194
  %select.ptr.192 = select i1 %safe.191, i32* %193, i32* %7
  %195 = load i32, i32* %select.ptr.192, align 4, !dbg !23
  %196 = icmp ne i32 %192, %195, !dbg !24
  call void @llvm.dbg.value(metadata i32 25, metadata !17, metadata !DIExpression()), !dbg !19
  %197 = xor i1 %196, true
  %in.91 = and i1 %in.90, %197
  %198 = getelementptr inbounds i32, i32* %len.1, i64 25, !dbg !20
  %199 = icmp slt i64 25, %len.11
  %safe.193 = or i1 %in.91, %199
  %select.ptr.194 = select i1 %safe.193, i32* %198, i32* %7
  %200 = load i32, i32* %select.ptr.194, align 4, !dbg !20
  %201 = getelementptr inbounds i32, i32* %len.12, i64 25, !dbg !23
  %202 = icmp slt i64 25, %len.14
  %safe.195 = or i1 %in.91, %202
  %select.ptr.196 = select i1 %safe.195, i32* %201, i32* %7
  %203 = load i32, i32* %select.ptr.196, align 4, !dbg !23
  %204 = icmp ne i32 %200, %203, !dbg !24
  call void @llvm.dbg.value(metadata i32 26, metadata !17, metadata !DIExpression()), !dbg !19
  %205 = xor i1 %204, true
  %in.92 = and i1 %in.91, %205
  %206 = getelementptr inbounds i32, i32* %len.1, i64 26, !dbg !20
  %207 = icmp slt i64 26, %len.11
  %safe.197 = or i1 %in.92, %207
  %select.ptr.198 = select i1 %safe.197, i32* %206, i32* %7
  %208 = load i32, i32* %select.ptr.198, align 4, !dbg !20
  %209 = getelementptr inbounds i32, i32* %len.12, i64 26, !dbg !23
  %210 = icmp slt i64 26, %len.14
  %safe.199 = or i1 %in.92, %210
  %select.ptr.200 = select i1 %safe.199, i32* %209, i32* %7
  %211 = load i32, i32* %select.ptr.200, align 4, !dbg !23
  %212 = icmp ne i32 %208, %211, !dbg !24
  call void @llvm.dbg.value(metadata i32 27, metadata !17, metadata !DIExpression()), !dbg !19
  %213 = xor i1 %212, true
  %in.93 = and i1 %in.92, %213
  %214 = getelementptr inbounds i32, i32* %len.1, i64 27, !dbg !20
  %215 = icmp slt i64 27, %len.11
  %safe.201 = or i1 %in.93, %215
  %select.ptr.202 = select i1 %safe.201, i32* %214, i32* %7
  %216 = load i32, i32* %select.ptr.202, align 4, !dbg !20
  %217 = getelementptr inbounds i32, i32* %len.12, i64 27, !dbg !23
  %218 = icmp slt i64 27, %len.14
  %safe.203 = or i1 %in.93, %218
  %select.ptr.204 = select i1 %safe.203, i32* %217, i32* %7
  %219 = load i32, i32* %select.ptr.204, align 4, !dbg !23
  %220 = icmp ne i32 %216, %219, !dbg !24
  call void @llvm.dbg.value(metadata i32 28, metadata !17, metadata !DIExpression()), !dbg !19
  %221 = xor i1 %220, true
  %in.94 = and i1 %in.93, %221
  %222 = getelementptr inbounds i32, i32* %len.1, i64 28, !dbg !20
  %223 = icmp slt i64 28, %len.11
  %safe.205 = or i1 %in.94, %223
  %select.ptr.206 = select i1 %safe.205, i32* %222, i32* %7
  %224 = load i32, i32* %select.ptr.206, align 4, !dbg !20
  %225 = getelementptr inbounds i32, i32* %len.12, i64 28, !dbg !23
  %226 = icmp slt i64 28, %len.14
  %safe.207 = or i1 %in.94, %226
  %select.ptr.208 = select i1 %safe.207, i32* %225, i32* %7
  %227 = load i32, i32* %select.ptr.208, align 4, !dbg !23
  %228 = icmp ne i32 %224, %227, !dbg !24
  call void @llvm.dbg.value(metadata i32 29, metadata !17, metadata !DIExpression()), !dbg !19
  %229 = xor i1 %228, true
  %in.95 = and i1 %in.94, %229
  %230 = getelementptr inbounds i32, i32* %len.1, i64 29, !dbg !20
  %231 = icmp slt i64 29, %len.11
  %safe.209 = or i1 %in.95, %231
  %select.ptr.210 = select i1 %safe.209, i32* %230, i32* %7
  %232 = load i32, i32* %select.ptr.210, align 4, !dbg !20
  %233 = getelementptr inbounds i32, i32* %len.12, i64 29, !dbg !23
  %234 = icmp slt i64 29, %len.14
  %safe.211 = or i1 %in.95, %234
  %select.ptr.212 = select i1 %safe.211, i32* %233, i32* %7
  %235 = load i32, i32* %select.ptr.212, align 4, !dbg !23
  %236 = icmp ne i32 %232, %235, !dbg !24
  call void @llvm.dbg.value(metadata i32 30, metadata !17, metadata !DIExpression()), !dbg !19
  %237 = xor i1 %236, true
  %in.96 = and i1 %in.95, %237
  %238 = getelementptr inbounds i32, i32* %len.1, i64 30, !dbg !20
  %239 = icmp slt i64 30, %len.11
  %safe.213 = or i1 %in.96, %239
  %select.ptr.214 = select i1 %safe.213, i32* %238, i32* %7
  %240 = load i32, i32* %select.ptr.214, align 4, !dbg !20
  %241 = getelementptr inbounds i32, i32* %len.12, i64 30, !dbg !23
  %242 = icmp slt i64 30, %len.14
  %safe.215 = or i1 %in.96, %242
  %select.ptr.216 = select i1 %safe.215, i32* %241, i32* %7
  %243 = load i32, i32* %select.ptr.216, align 4, !dbg !23
  %244 = icmp ne i32 %240, %243, !dbg !24
  call void @llvm.dbg.value(metadata i32 31, metadata !17, metadata !DIExpression()), !dbg !19
  %245 = xor i1 %244, true
  %in.97 = and i1 %in.96, %245
  %246 = getelementptr inbounds i32, i32* %len.1, i64 31, !dbg !20
  %247 = icmp slt i64 31, %len.11
  %safe.217 = or i1 %in.97, %247
  %select.ptr.218 = select i1 %safe.217, i32* %246, i32* %7
  %248 = load i32, i32* %select.ptr.218, align 4, !dbg !20
  %249 = getelementptr inbounds i32, i32* %len.12, i64 31, !dbg !23
  %250 = icmp slt i64 31, %len.14
  %safe.219 = or i1 %in.97, %250
  %select.ptr.220 = select i1 %safe.219, i32* %249, i32* %7
  %251 = load i32, i32* %select.ptr.220, align 4, !dbg !23
  %252 = icmp ne i32 %248, %251, !dbg !24
  call void @llvm.dbg.value(metadata i32 32, metadata !17, metadata !DIExpression()), !dbg !19
  %253 = xor i1 %252, true
  %in.98 = and i1 %in.97, %253
  %254 = sext i1 %in.98 to i32
  %255 = sub i32 0, %254
  %256 = and i32 1, %255
  %shadow5 = alloca i64
  %out. = alloca i1
  store i1 true, i1* %out.
  ret i32 %256, !dbg !25
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main() #0 !dbg !26 {
  %1 = alloca [32 x i32], align 16
  %2 = alloca [32 x i32], align 16
  call void @llvm.dbg.declare(metadata [32 x i32]* %1, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [32 x i32]* %2, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.value(metadata i64 0, metadata !36, metadata !DIExpression()), !dbg !38
  %3 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 0, !dbg !39
  store i32 0, i32* %3, align 4, !dbg !41
  %4 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 0, !dbg !42
  store i32 0, i32* %4, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 1, metadata !36, metadata !DIExpression()), !dbg !38
  %5 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 1, !dbg !39
  store i32 1, i32* %5, align 4, !dbg !41
  %6 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 1, !dbg !42
  store i32 1, i32* %6, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 2, metadata !36, metadata !DIExpression()), !dbg !38
  %7 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 2, !dbg !39
  store i32 2, i32* %7, align 4, !dbg !41
  %8 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 2, !dbg !42
  store i32 2, i32* %8, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 3, metadata !36, metadata !DIExpression()), !dbg !38
  %9 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 3, !dbg !39
  store i32 3, i32* %9, align 4, !dbg !41
  %10 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 3, !dbg !42
  store i32 3, i32* %10, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 4, metadata !36, metadata !DIExpression()), !dbg !38
  %11 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 4, !dbg !39
  store i32 4, i32* %11, align 4, !dbg !41
  %12 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 4, !dbg !42
  store i32 4, i32* %12, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 5, metadata !36, metadata !DIExpression()), !dbg !38
  %13 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 5, !dbg !39
  store i32 5, i32* %13, align 4, !dbg !41
  %14 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 5, !dbg !42
  store i32 5, i32* %14, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 6, metadata !36, metadata !DIExpression()), !dbg !38
  %15 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 6, !dbg !39
  store i32 6, i32* %15, align 4, !dbg !41
  %16 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 6, !dbg !42
  store i32 6, i32* %16, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 7, metadata !36, metadata !DIExpression()), !dbg !38
  %17 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 7, !dbg !39
  store i32 7, i32* %17, align 4, !dbg !41
  %18 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 7, !dbg !42
  store i32 7, i32* %18, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 8, metadata !36, metadata !DIExpression()), !dbg !38
  %19 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 8, !dbg !39
  store i32 8, i32* %19, align 4, !dbg !41
  %20 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 8, !dbg !42
  store i32 8, i32* %20, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 9, metadata !36, metadata !DIExpression()), !dbg !38
  %21 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 9, !dbg !39
  store i32 9, i32* %21, align 4, !dbg !41
  %22 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 9, !dbg !42
  store i32 9, i32* %22, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 10, metadata !36, metadata !DIExpression()), !dbg !38
  %23 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 10, !dbg !39
  store i32 10, i32* %23, align 4, !dbg !41
  %24 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 10, !dbg !42
  store i32 10, i32* %24, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 11, metadata !36, metadata !DIExpression()), !dbg !38
  %25 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 11, !dbg !39
  store i32 11, i32* %25, align 4, !dbg !41
  %26 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 11, !dbg !42
  store i32 11, i32* %26, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 12, metadata !36, metadata !DIExpression()), !dbg !38
  %27 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 12, !dbg !39
  store i32 12, i32* %27, align 4, !dbg !41
  %28 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 12, !dbg !42
  store i32 12, i32* %28, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 13, metadata !36, metadata !DIExpression()), !dbg !38
  %29 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 13, !dbg !39
  store i32 13, i32* %29, align 4, !dbg !41
  %30 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 13, !dbg !42
  store i32 13, i32* %30, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 14, metadata !36, metadata !DIExpression()), !dbg !38
  %31 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 14, !dbg !39
  store i32 14, i32* %31, align 4, !dbg !41
  %32 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 14, !dbg !42
  store i32 14, i32* %32, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 15, metadata !36, metadata !DIExpression()), !dbg !38
  %33 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 15, !dbg !39
  store i32 15, i32* %33, align 4, !dbg !41
  %34 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 15, !dbg !42
  store i32 15, i32* %34, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 16, metadata !36, metadata !DIExpression()), !dbg !38
  %35 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 16, !dbg !39
  store i32 16, i32* %35, align 4, !dbg !41
  %36 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 16, !dbg !42
  store i32 16, i32* %36, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 17, metadata !36, metadata !DIExpression()), !dbg !38
  %37 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 17, !dbg !39
  store i32 17, i32* %37, align 4, !dbg !41
  %38 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 17, !dbg !42
  store i32 17, i32* %38, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 18, metadata !36, metadata !DIExpression()), !dbg !38
  %39 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 18, !dbg !39
  store i32 18, i32* %39, align 4, !dbg !41
  %40 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 18, !dbg !42
  store i32 18, i32* %40, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 19, metadata !36, metadata !DIExpression()), !dbg !38
  %41 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 19, !dbg !39
  store i32 19, i32* %41, align 4, !dbg !41
  %42 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 19, !dbg !42
  store i32 19, i32* %42, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 20, metadata !36, metadata !DIExpression()), !dbg !38
  %43 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 20, !dbg !39
  store i32 20, i32* %43, align 4, !dbg !41
  %44 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 20, !dbg !42
  store i32 20, i32* %44, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 21, metadata !36, metadata !DIExpression()), !dbg !38
  %45 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 21, !dbg !39
  store i32 21, i32* %45, align 4, !dbg !41
  %46 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 21, !dbg !42
  store i32 21, i32* %46, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 22, metadata !36, metadata !DIExpression()), !dbg !38
  %47 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 22, !dbg !39
  store i32 22, i32* %47, align 4, !dbg !41
  %48 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 22, !dbg !42
  store i32 22, i32* %48, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 23, metadata !36, metadata !DIExpression()), !dbg !38
  %49 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 23, !dbg !39
  store i32 23, i32* %49, align 4, !dbg !41
  %50 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 23, !dbg !42
  store i32 23, i32* %50, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 24, metadata !36, metadata !DIExpression()), !dbg !38
  %51 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 24, !dbg !39
  store i32 24, i32* %51, align 4, !dbg !41
  %52 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 24, !dbg !42
  store i32 24, i32* %52, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 25, metadata !36, metadata !DIExpression()), !dbg !38
  %53 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 25, !dbg !39
  store i32 25, i32* %53, align 4, !dbg !41
  %54 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 25, !dbg !42
  store i32 25, i32* %54, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 26, metadata !36, metadata !DIExpression()), !dbg !38
  %55 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 26, !dbg !39
  store i32 26, i32* %55, align 4, !dbg !41
  %56 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 26, !dbg !42
  store i32 26, i32* %56, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 27, metadata !36, metadata !DIExpression()), !dbg !38
  %57 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 27, !dbg !39
  store i32 27, i32* %57, align 4, !dbg !41
  %58 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 27, !dbg !42
  store i32 27, i32* %58, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 28, metadata !36, metadata !DIExpression()), !dbg !38
  %59 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 28, !dbg !39
  store i32 28, i32* %59, align 4, !dbg !41
  %60 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 28, !dbg !42
  store i32 28, i32* %60, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 29, metadata !36, metadata !DIExpression()), !dbg !38
  %61 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 29, !dbg !39
  store i32 29, i32* %61, align 4, !dbg !41
  %62 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 29, !dbg !42
  store i32 29, i32* %62, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 30, metadata !36, metadata !DIExpression()), !dbg !38
  %63 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 30, !dbg !39
  store i32 30, i32* %63, align 4, !dbg !41
  %64 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 30, !dbg !42
  store i32 30, i32* %64, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 31, metadata !36, metadata !DIExpression()), !dbg !38
  %65 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 31, !dbg !39
  store i32 31, i32* %65, align 4, !dbg !41
  %66 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 31, !dbg !42
  store i32 31, i32* %66, align 4, !dbg !43
  call void @llvm.dbg.value(metadata i64 32, metadata !36, metadata !DIExpression()), !dbg !38
  %67 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i64 0, i64 0, !dbg !44
  %68 = getelementptr inbounds [32 x i32], [32 x i32]* %2, i64 0, i64 0, !dbg !45
  %69 = sext i32 32 to i64
  %70 = sext i32 32 to i64
  %71 = sext i32 32 to i64
  %72 = sext i32 32 to i64
  %73 = call i32 @comp(i32* %67, i64 %71, i64 %69, i32* %68, i64 %72, i64 %70), !dbg !46
  call void @llvm.dbg.value(metadata i32 %73, metadata !47, metadata !DIExpression()), !dbg !48
  %74 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %73), !dbg !49
  ret i32 0, !dbg !50
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
!1 = !DIFile(filename: "comp1.c", directory: "/home/luigi/dev/ufmg/static-analysis/side-channel/lif/llvm/bench/comp/sources")
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
!39 = !DILocation(line: 13, column: 40, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !1, line: 13, column: 5)
!41 = !DILocation(line: 13, column: 45, scope: !40)
!42 = !DILocation(line: 13, column: 33, scope: !40)
!43 = !DILocation(line: 13, column: 38, scope: !40)
!44 = !DILocation(line: 14, column: 18, scope: !26)
!45 = !DILocation(line: 14, column: 21, scope: !26)
!46 = !DILocation(line: 14, column: 13, scope: !26)
!47 = !DILocalVariable(name: "r", scope: !26, file: !1, line: 14, type: !12)
!48 = !DILocation(line: 0, scope: !26)
!49 = !DILocation(line: 15, column: 5, scope: !26)
!50 = !DILocation(line: 16, column: 5, scope: !26)

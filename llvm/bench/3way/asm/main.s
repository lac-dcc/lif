	.text
	.file	"llvm-link"
	.globl	printvec                # -- Begin function printvec
	.p2align	4, 0x90
	.type	printvec,@function
printvec:                               # @printvec
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, %rax
	movq	%rdi, -16(%rbp)
	movq	%rsi, -8(%rbp)
	movq	16(%rsi), %rdx
	movq	(%rsi), %r8
	movq	8(%rsi), %rcx
	movl	$.L.str, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	callq	printf
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	printvec, .Lfunc_end0-printvec
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$368, %rsp              # imm = 0x170
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	movl	$0, -392(%rbp)
	movq	$0, -368(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -384(%rbp)
	movq	$1, -336(%rbp)
	movq	$1, -344(%rbp)
	movq	$1, -352(%rbp)
	leaq	-280(%rbp), %r14
	leaq	-384(%rbp), %r15
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	twy_key
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.2, %edi
	movq	%r15, %rsi
	callq	printvec
	leaq	-352(%rbp), %r12
	movl	$.L.str.3, %edi
	movq	%r12, %rsi
	callq	printvec
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	encrypt
	movl	$.L.str.4, %edi
	movq	%r12, %rsi
	callq	printvec
	movq	$6, -384(%rbp)
	movq	$5, -376(%rbp)
	movq	$4, -368(%rbp)
	movq	$3, -352(%rbp)
	movq	$2, -344(%rbp)
	movq	$1, -336(%rbp)
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	twy_key
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.2, %edi
	movq	%r15, %rsi
	callq	printvec
	movl	$.L.str.3, %edi
	movq	%r12, %rsi
	callq	printvec
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	encrypt
	movl	$.L.str.4, %edi
	movq	%r12, %rsi
	callq	printvec
	movl	$2209258948, %ebx       # imm = 0x83AE9DC4
	leaq	959468110(%rbx), %rax
	movq	%rax, -368(%rbp)
	movq	$1164413355, -376(%rbp) # imm = 0x456789AB
	leaq	1531016304(%rbx), %rax
	movq	%rax, -384(%rbp)
	movq	$19088743, -336(%rbp)   # imm = 0x1234567
	leaq	386810156(%rbx), %rax
	movq	%rax, -344(%rbp)
	movq	$591751049, -352(%rbp)  # imm = 0x23456789
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	twy_key
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.2, %edi
	movq	%r15, %rsi
	callq	printvec
	movl	$.L.str.3, %edi
	movq	%r12, %rsi
	callq	printvec
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	encrypt
	movl	$.L.str.4, %edi
	movq	%r12, %rsi
	callq	printvec
	leaq	1191871241(%rbx), %rax
	movq	%rax, -368(%rbp)
	leaq	1382392692(%rbx), %rax
	movq	%rax, -376(%rbp)
	leaq	1329708442(%rbx), %rax
	movq	%rax, -384(%rbp)
	leaq	695422771(%rbx), %rax
	movq	%rax, -336(%rbp)
	movq	%rbx, -344(%rbp)
	movq	$1079625582, -352(%rbp) # imm = 0x4059C76E
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	twy_key
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.2, %edi
	movq	%r15, %rsi
	callq	printvec
	movl	$.L.str.3, %edi
	movq	%r12, %rsi
	callq	printvec
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	encrypt
	movl	$.L.str.4, %edi
	movq	%r12, %rsi
	callq	printvec
	movl	$0, -388(%rbp)
	cmpl	$8, -388(%rbp)
	jg	.LBB1_3
	.p2align	4, 0x90
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	movslq	-388(%rbp), %rax
	movq	%rax, -352(%rbp,%rax,8)
	addl	$1, %eax
	movl	%eax, -388(%rbp)
	cmpl	$8, -388(%rbp)
	jle	.LBB1_2
.LBB1_3:
	leaq	-280(%rbp), %rdi
	leaq	-352(%rbp), %rsi
	movl	$3, %edx
	callq	twy_enc
	movl	$0, -388(%rbp)
	cmpl	$8, -388(%rbp)
	jg	.LBB1_6
	.p2align	4, 0x90
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	movslq	-388(%rbp), %rax
	imulq	$1431655766, %rax, %rsi # imm = 0x55555556
	movq	%rsi, %rcx
	shrq	$63, %rcx
	shrq	$32, %rsi
	addl	%ecx, %esi
	movq	-352(%rbp,%rax,8), %rdx
	movq	-344(%rbp,%rax,8), %rcx
	movq	-336(%rbp,%rax,8), %r8
	movl	$.L.str.5, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	addl	$3, -388(%rbp)
	cmpl	$8, -388(%rbp)
	jle	.LBB1_5
.LBB1_6:
	leaq	-280(%rbp), %rbx
	leaq	-352(%rbp), %rsi
	movq	%rbx, %rdi
	movl	$2, %edx
	callq	twy_dec
	leaq	-304(%rbp), %rsi
	movq	%rbx, %rdi
	movl	$1, %edx
	callq	twy_dec
	movl	$0, -388(%rbp)
	cmpl	$8, -388(%rbp)
	jg	.LBB1_9
	.p2align	4, 0x90
.LBB1_8:                                # =>This Inner Loop Header: Depth=1
	movslq	-388(%rbp), %rax
	imulq	$1431655766, %rax, %rsi # imm = 0x55555556
	movq	%rsi, %rcx
	shrq	$63, %rcx
	shrq	$32, %rsi
	addl	%ecx, %esi
	movq	-352(%rbp,%rax,8), %rdx
	movq	-344(%rbp,%rax,8), %rcx
	movq	-336(%rbp,%rax,8), %r8
	movl	$.L.str.6, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	addl	$3, -388(%rbp)
	cmpl	$8, -388(%rbp)
	jle	.LBB1_8
.LBB1_9:
	movq	%fs:40, %rax
	cmpq	-40(%rbp), %rax
	jne	.LBB1_11
# %bb.10:                               # %SP_return
	xorl	%eax, %eax
	addq	$368, %rsp              # imm = 0x170
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB1_11:                               # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.globl	mu                      # -- Begin function mu
	.p2align	4, 0x90
	.type	mu,@function
mu:                                     # @mu
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -32(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_1
# %bb.2:
	testb	$1, 8(%rdi)
	jne	.LBB2_3
.LBB2_4:
	testb	$1, 16(%rdi)
	je	.LBB2_6
.LBB2_5:
	orb	$1, -32(%rbp)
.LBB2_6:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_7
# %bb.8:
	testb	$1, 8(%rdi)
	jne	.LBB2_9
.LBB2_10:
	testb	$1, 16(%rdi)
	je	.LBB2_12
.LBB2_11:
	orb	$1, -32(%rbp)
.LBB2_12:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_13
# %bb.14:
	testb	$1, 8(%rdi)
	jne	.LBB2_15
.LBB2_16:
	testb	$1, 16(%rdi)
	je	.LBB2_18
.LBB2_17:
	orb	$1, -32(%rbp)
.LBB2_18:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_19
# %bb.20:
	testb	$1, 8(%rdi)
	jne	.LBB2_21
.LBB2_22:
	testb	$1, 16(%rdi)
	je	.LBB2_24
.LBB2_23:
	orb	$1, -32(%rbp)
.LBB2_24:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_25
# %bb.26:
	testb	$1, 8(%rdi)
	jne	.LBB2_27
.LBB2_28:
	testb	$1, 16(%rdi)
	je	.LBB2_30
.LBB2_29:
	orb	$1, -32(%rbp)
.LBB2_30:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_31
# %bb.32:
	testb	$1, 8(%rdi)
	jne	.LBB2_33
.LBB2_34:
	testb	$1, 16(%rdi)
	je	.LBB2_36
.LBB2_35:
	orb	$1, -32(%rbp)
.LBB2_36:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_37
# %bb.38:
	testb	$1, 8(%rdi)
	jne	.LBB2_39
.LBB2_40:
	testb	$1, 16(%rdi)
	je	.LBB2_42
.LBB2_41:
	orb	$1, -32(%rbp)
.LBB2_42:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_43
# %bb.44:
	testb	$1, 8(%rdi)
	jne	.LBB2_45
.LBB2_46:
	testb	$1, 16(%rdi)
	je	.LBB2_48
.LBB2_47:
	orb	$1, -32(%rbp)
.LBB2_48:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_49
# %bb.50:
	testb	$1, 8(%rdi)
	jne	.LBB2_51
.LBB2_52:
	testb	$1, 16(%rdi)
	je	.LBB2_54
.LBB2_53:
	orb	$1, -32(%rbp)
.LBB2_54:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_55
# %bb.56:
	testb	$1, 8(%rdi)
	jne	.LBB2_57
.LBB2_58:
	testb	$1, 16(%rdi)
	je	.LBB2_60
.LBB2_59:
	orb	$1, -32(%rbp)
.LBB2_60:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_61
# %bb.62:
	testb	$1, 8(%rdi)
	jne	.LBB2_63
.LBB2_64:
	testb	$1, 16(%rdi)
	je	.LBB2_66
.LBB2_65:
	orb	$1, -32(%rbp)
.LBB2_66:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_67
# %bb.68:
	testb	$1, 8(%rdi)
	jne	.LBB2_69
.LBB2_70:
	testb	$1, 16(%rdi)
	je	.LBB2_72
.LBB2_71:
	orb	$1, -32(%rbp)
.LBB2_72:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_73
# %bb.74:
	testb	$1, 8(%rdi)
	jne	.LBB2_75
.LBB2_76:
	testb	$1, 16(%rdi)
	je	.LBB2_78
.LBB2_77:
	orb	$1, -32(%rbp)
.LBB2_78:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_79
# %bb.80:
	testb	$1, 8(%rdi)
	jne	.LBB2_81
.LBB2_82:
	testb	$1, 16(%rdi)
	je	.LBB2_84
.LBB2_83:
	orb	$1, -32(%rbp)
.LBB2_84:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_85
# %bb.86:
	testb	$1, 8(%rdi)
	jne	.LBB2_87
.LBB2_88:
	testb	$1, 16(%rdi)
	je	.LBB2_90
.LBB2_89:
	orb	$1, -32(%rbp)
.LBB2_90:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_91
# %bb.92:
	testb	$1, 8(%rdi)
	jne	.LBB2_93
.LBB2_94:
	testb	$1, 16(%rdi)
	je	.LBB2_96
.LBB2_95:
	orb	$1, -32(%rbp)
.LBB2_96:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_97
# %bb.98:
	testb	$1, 8(%rdi)
	jne	.LBB2_99
.LBB2_100:
	testb	$1, 16(%rdi)
	je	.LBB2_102
.LBB2_101:
	orb	$1, -32(%rbp)
.LBB2_102:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_103
# %bb.104:
	testb	$1, 8(%rdi)
	jne	.LBB2_105
.LBB2_106:
	testb	$1, 16(%rdi)
	je	.LBB2_108
.LBB2_107:
	orb	$1, -32(%rbp)
.LBB2_108:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_109
# %bb.110:
	testb	$1, 8(%rdi)
	jne	.LBB2_111
.LBB2_112:
	testb	$1, 16(%rdi)
	je	.LBB2_114
.LBB2_113:
	orb	$1, -32(%rbp)
.LBB2_114:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_115
# %bb.116:
	testb	$1, 8(%rdi)
	jne	.LBB2_117
.LBB2_118:
	testb	$1, 16(%rdi)
	je	.LBB2_120
.LBB2_119:
	orb	$1, -32(%rbp)
.LBB2_120:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_121
# %bb.122:
	testb	$1, 8(%rdi)
	jne	.LBB2_123
.LBB2_124:
	testb	$1, 16(%rdi)
	je	.LBB2_126
.LBB2_125:
	orb	$1, -32(%rbp)
.LBB2_126:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_127
# %bb.128:
	testb	$1, 8(%rdi)
	jne	.LBB2_129
.LBB2_130:
	testb	$1, 16(%rdi)
	je	.LBB2_132
.LBB2_131:
	orb	$1, -32(%rbp)
.LBB2_132:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_133
# %bb.134:
	testb	$1, 8(%rdi)
	jne	.LBB2_135
.LBB2_136:
	testb	$1, 16(%rdi)
	je	.LBB2_138
.LBB2_137:
	orb	$1, -32(%rbp)
.LBB2_138:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_139
# %bb.140:
	testb	$1, 8(%rdi)
	jne	.LBB2_141
.LBB2_142:
	testb	$1, 16(%rdi)
	je	.LBB2_144
.LBB2_143:
	orb	$1, -32(%rbp)
.LBB2_144:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_145
# %bb.146:
	testb	$1, 8(%rdi)
	jne	.LBB2_147
.LBB2_148:
	testb	$1, 16(%rdi)
	je	.LBB2_150
.LBB2_149:
	orb	$1, -32(%rbp)
.LBB2_150:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_151
# %bb.152:
	testb	$1, 8(%rdi)
	jne	.LBB2_153
.LBB2_154:
	testb	$1, 16(%rdi)
	je	.LBB2_156
.LBB2_155:
	orb	$1, -32(%rbp)
.LBB2_156:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_157
# %bb.158:
	testb	$1, 8(%rdi)
	jne	.LBB2_159
.LBB2_160:
	testb	$1, 16(%rdi)
	je	.LBB2_162
.LBB2_161:
	orb	$1, -32(%rbp)
.LBB2_162:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_163
# %bb.164:
	testb	$1, 8(%rdi)
	jne	.LBB2_165
.LBB2_166:
	testb	$1, 16(%rdi)
	je	.LBB2_168
.LBB2_167:
	orb	$1, -32(%rbp)
.LBB2_168:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_169
# %bb.170:
	testb	$1, 8(%rdi)
	jne	.LBB2_171
.LBB2_172:
	testb	$1, 16(%rdi)
	je	.LBB2_174
.LBB2_173:
	orb	$1, -32(%rbp)
.LBB2_174:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_175
# %bb.176:
	testb	$1, 8(%rdi)
	jne	.LBB2_177
.LBB2_178:
	testb	$1, 16(%rdi)
	je	.LBB2_180
.LBB2_179:
	orb	$1, -32(%rbp)
.LBB2_180:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_181
# %bb.182:
	testb	$1, 8(%rdi)
	jne	.LBB2_183
.LBB2_184:
	testb	$1, 16(%rdi)
	je	.LBB2_186
.LBB2_185:
	orb	$1, -32(%rbp)
.LBB2_186:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	shlq	-32(%rbp)
	shlq	-24(%rbp)
	shlq	-16(%rbp)
	testb	$1, (%rdi)
	jne	.LBB2_187
# %bb.188:
	testb	$1, 8(%rdi)
	jne	.LBB2_189
.LBB2_190:
	testb	$1, 16(%rdi)
	je	.LBB2_192
.LBB2_191:
	orb	$1, -32(%rbp)
.LBB2_192:
	shrq	(%rdi)
	shrq	8(%rdi)
	shrq	16(%rdi)
	movq	-32(%rbp), %rax
	movq	%rax, (%rdi)
	movq	-24(%rbp), %rax
	movq	%rax, 8(%rdi)
	movq	-16(%rbp), %rax
	movq	%rax, 16(%rdi)
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB2_194
# %bb.193:                              # %SP_return
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB2_1:
	.cfi_def_cfa %rbp, 16
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_4
.LBB2_3:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_5
	jmp	.LBB2_6
.LBB2_7:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_10
.LBB2_9:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_11
	jmp	.LBB2_12
.LBB2_13:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_16
.LBB2_15:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_17
	jmp	.LBB2_18
.LBB2_19:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_22
.LBB2_21:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_23
	jmp	.LBB2_24
.LBB2_25:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_28
.LBB2_27:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_29
	jmp	.LBB2_30
.LBB2_31:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_34
.LBB2_33:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_35
	jmp	.LBB2_36
.LBB2_37:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_40
.LBB2_39:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_41
	jmp	.LBB2_42
.LBB2_43:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_46
.LBB2_45:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_47
	jmp	.LBB2_48
.LBB2_49:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_52
.LBB2_51:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_53
	jmp	.LBB2_54
.LBB2_55:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_58
.LBB2_57:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_59
	jmp	.LBB2_60
.LBB2_61:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_64
.LBB2_63:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_65
	jmp	.LBB2_66
.LBB2_67:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_70
.LBB2_69:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_71
	jmp	.LBB2_72
.LBB2_73:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_76
.LBB2_75:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_77
	jmp	.LBB2_78
.LBB2_79:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_82
.LBB2_81:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_83
	jmp	.LBB2_84
.LBB2_85:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_88
.LBB2_87:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_89
	jmp	.LBB2_90
.LBB2_91:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_94
.LBB2_93:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_95
	jmp	.LBB2_96
.LBB2_97:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_100
.LBB2_99:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_101
	jmp	.LBB2_102
.LBB2_103:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_106
.LBB2_105:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_107
	jmp	.LBB2_108
.LBB2_109:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_112
.LBB2_111:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_113
	jmp	.LBB2_114
.LBB2_115:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_118
.LBB2_117:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_119
	jmp	.LBB2_120
.LBB2_121:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_124
.LBB2_123:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_125
	jmp	.LBB2_126
.LBB2_127:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_130
.LBB2_129:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_131
	jmp	.LBB2_132
.LBB2_133:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_136
.LBB2_135:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_137
	jmp	.LBB2_138
.LBB2_139:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_142
.LBB2_141:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_143
	jmp	.LBB2_144
.LBB2_145:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_148
.LBB2_147:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_149
	jmp	.LBB2_150
.LBB2_151:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_154
.LBB2_153:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_155
	jmp	.LBB2_156
.LBB2_157:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_160
.LBB2_159:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_161
	jmp	.LBB2_162
.LBB2_163:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_166
.LBB2_165:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_167
	jmp	.LBB2_168
.LBB2_169:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_172
.LBB2_171:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_173
	jmp	.LBB2_174
.LBB2_175:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_178
.LBB2_177:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_179
	jmp	.LBB2_180
.LBB2_181:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_184
.LBB2_183:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_185
	jmp	.LBB2_186
.LBB2_187:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	je	.LBB2_190
.LBB2_189:
	orb	$1, -24(%rbp)
	testb	$1, 16(%rdi)
	jne	.LBB2_191
	jmp	.LBB2_192
.LBB2_194:                              # %CallStackCheckFailBlk
	callq	__stack_chk_fail
.Lfunc_end2:
	.size	mu, .Lfunc_end2-mu
	.cfi_endproc
                                        # -- End function
	.globl	gamma_                  # -- Begin function gamma_
	.p2align	4, 0x90
	.type	gamma_,@function
gamma_:                                 # @gamma_
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	movq	16(%rdi), %rax
	notq	%rax
	orq	8(%rdi), %rax
	xorq	(%rdi), %rax
	movq	%rax, -32(%rbp)
	movq	(%rdi), %rcx
	notq	%rcx
	orq	16(%rdi), %rcx
	xorq	8(%rdi), %rcx
	movq	%rcx, -24(%rbp)
	movq	8(%rdi), %rcx
	notq	%rcx
	orq	(%rdi), %rcx
	xorq	16(%rdi), %rcx
	movq	%rcx, -16(%rbp)
	movq	%rax, (%rdi)
	movq	-24(%rbp), %rax
	movq	%rax, 8(%rdi)
	movq	-16(%rbp), %rax
	movq	%rax, 16(%rdi)
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB3_2
# %bb.1:                                # %SP_return
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB3_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end3:
	.size	gamma_, .Lfunc_end3-gamma_
	.cfi_endproc
                                        # -- End function
	.globl	theta                   # -- Begin function theta
	.p2align	4, 0x90
	.type	theta,@function
theta:                                  # @theta
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	movq	(%rdi), %r8
	movq	8(%rdi), %rsi
	movq	%r8, %rdx
	shrq	$16, %rdx
	xorq	%r8, %rdx
	movq	%rsi, %rax
	shlq	$16, %rax
	movq	%rsi, %rcx
	shrq	$16, %rcx
	xorq	%rax, %rcx
	xorq	%rdx, %rcx
	movq	16(%rdi), %rax
	movq	%rax, %rdx
	shlq	$16, %rdx
	shrq	$24, %rsi
	xorq	%rdx, %rsi
	movq	%rax, %rdx
	shlq	$8, %rdx
	xorq	%rsi, %rdx
	xorq	%rcx, %rdx
	movq	%rax, %rcx
	shrq	$8, %rcx
	movq	%r8, %rsi
	shlq	$24, %rsi
	xorq	%rcx, %rsi
	movq	%rax, %rcx
	shrq	$16, %rcx
	xorq	%rsi, %rcx
	movq	%r8, %rsi
	shlq	$16, %rsi
	xorq	%rcx, %rsi
	xorq	%rdx, %rsi
	shrq	$24, %rax
	shlq	$8, %r8
	xorq	%rax, %r8
	xorq	%rsi, %r8
	movq	%r8, -32(%rbp)
	movq	(%rdi), %r9
	movq	8(%rdi), %rcx
	movq	%rcx, %rax
	shrq	$16, %rax
	xorq	%rcx, %rax
	movq	16(%rdi), %rdx
	movq	%rdx, %r10
	shlq	$16, %r10
	movq	%rdx, %rsi
	shrq	$16, %rsi
	xorq	%r10, %rsi
	xorq	%rax, %rsi
	movq	%r9, %rax
	shlq	$16, %rax
	shrq	$24, %rdx
	xorq	%rax, %rdx
	movq	%r9, %rax
	shlq	$8, %rax
	xorq	%rdx, %rax
	xorq	%rsi, %rax
	movq	%r9, %rdx
	shrq	$8, %rdx
	movq	%rcx, %rsi
	shlq	$24, %rsi
	xorq	%rdx, %rsi
	movq	%r9, %rdx
	shrq	$16, %rdx
	xorq	%rsi, %rdx
	movq	%rcx, %rsi
	shlq	$16, %rsi
	xorq	%rdx, %rsi
	xorq	%rax, %rsi
	shrq	$24, %r9
	shlq	$8, %rcx
	xorq	%r9, %rcx
	xorq	%rsi, %rcx
	movq	%rcx, -24(%rbp)
	movq	16(%rdi), %rcx
	movq	%rcx, %rax
	shrq	$16, %rax
	xorq	%rcx, %rax
	movq	(%rdi), %rdx
	movq	8(%rdi), %r9
	movq	%rdx, %r10
	shlq	$16, %r10
	movq	%rdx, %rsi
	shrq	$16, %rsi
	xorq	%r10, %rsi
	xorq	%rax, %rsi
	movq	%r9, %rax
	shlq	$16, %rax
	shrq	$24, %rdx
	xorq	%rax, %rdx
	movq	%r9, %rax
	shlq	$8, %rax
	xorq	%rdx, %rax
	xorq	%rsi, %rax
	movq	%r9, %rdx
	shrq	$8, %rdx
	movq	%rcx, %rsi
	shlq	$24, %rsi
	xorq	%rdx, %rsi
	movq	%r9, %rdx
	shrq	$16, %rdx
	xorq	%rsi, %rdx
	movq	%rcx, %rsi
	shlq	$16, %rsi
	xorq	%rdx, %rsi
	xorq	%rax, %rsi
	shrq	$24, %r9
	shlq	$8, %rcx
	xorq	%r9, %rcx
	xorq	%rsi, %rcx
	movq	%rcx, -16(%rbp)
	movq	%r8, (%rdi)
	movq	-24(%rbp), %rax
	movq	%rax, 8(%rdi)
	movq	-16(%rbp), %rax
	movq	%rax, 16(%rdi)
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB4_2
# %bb.1:                                # %SP_return
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB4_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end4:
	.size	theta, .Lfunc_end4-theta
	.cfi_endproc
                                        # -- End function
	.globl	pi_1                    # -- Begin function pi_1
	.p2align	4, 0x90
	.type	pi_1,@function
pi_1:                                   # @pi_1
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	(%rdi), %rax
	movq	16(%rdi), %rcx
	movq	%rax, %rdx
	shrq	$10, %rdx
	shlq	$22, %rax
	xorq	%rdx, %rax
	movq	%rax, (%rdi)
	leaq	(%rcx,%rcx), %rax
	shrq	$31, %rcx
	xorq	%rcx, %rax
	movq	%rax, 16(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	pi_1, .Lfunc_end5-pi_1
	.cfi_endproc
                                        # -- End function
	.globl	pi_2                    # -- Begin function pi_2
	.p2align	4, 0x90
	.type	pi_2,@function
pi_2:                                   # @pi_2
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	(%rdi), %rax
	movq	16(%rdi), %rcx
	leaq	(%rax,%rax), %rdx
	shrq	$31, %rax
	xorq	%rax, %rdx
	movq	%rdx, (%rdi)
	movq	%rcx, %rax
	shrq	$10, %rax
	shlq	$22, %rcx
	xorq	%rax, %rcx
	movq	%rcx, 16(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end6:
	.size	pi_2, .Lfunc_end6-pi_2
	.cfi_endproc
                                        # -- End function
	.globl	rho                     # -- Begin function rho
	.p2align	4, 0x90
	.type	rho,@function
rho:                                    # @rho
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	callq	theta
	movq	%rbx, %rdi
	callq	pi_1
	movq	%rbx, %rdi
	callq	gamma_
	movq	%rbx, %rdi
	callq	pi_2
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end7:
	.size	rho, .Lfunc_end7-rho
	.cfi_endproc
                                        # -- End function
	.globl	rndcon_gen              # -- Begin function rndcon_gen
	.p2align	4, 0x90
	.type	rndcon_gen,@function
rndcon_gen:                             # @rndcon_gen
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, (%rsi)
	addq	%rdi, %rdi
	movq	%rdi, %rax
	xorq	$69649, %rax            # imm = 0x11011
	testl	$65536, %edi            # imm = 0x10000
	cmoveq	%rdi, %rax
	movq	%rax, 8(%rsi)
	addq	%rax, %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testl	$65536, %eax            # imm = 0x10000
	cmoveq	%rax, %rcx
	movq	%rcx, 16(%rsi)
	addq	%rcx, %rcx
	movq	%rcx, %rax
	xorq	$69649, %rax            # imm = 0x11011
	testl	$65536, %ecx            # imm = 0x10000
	cmoveq	%rcx, %rax
	movq	%rax, 24(%rsi)
	addq	%rax, %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testl	$65536, %eax            # imm = 0x10000
	cmoveq	%rax, %rcx
	movq	%rcx, 32(%rsi)
	addq	%rcx, %rcx
	movq	%rcx, %rax
	xorq	$69649, %rax            # imm = 0x11011
	testl	$65536, %ecx            # imm = 0x10000
	cmoveq	%rcx, %rax
	movq	%rax, 40(%rsi)
	addq	%rax, %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testl	$65536, %eax            # imm = 0x10000
	cmoveq	%rax, %rcx
	movq	%rcx, 48(%rsi)
	addq	%rcx, %rcx
	movq	%rcx, %rax
	xorq	$69649, %rax            # imm = 0x11011
	testl	$65536, %ecx            # imm = 0x10000
	cmoveq	%rcx, %rax
	movq	%rax, 56(%rsi)
	addq	%rax, %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testl	$65536, %eax            # imm = 0x10000
	cmoveq	%rax, %rcx
	movq	%rcx, 64(%rsi)
	addq	%rcx, %rcx
	movq	%rcx, %rax
	xorq	$69649, %rax            # imm = 0x11011
	testl	$65536, %ecx            # imm = 0x10000
	cmoveq	%rcx, %rax
	movq	%rax, 72(%rsi)
	addq	%rax, %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testl	$65536, %eax            # imm = 0x10000
	cmoveq	%rax, %rcx
	movq	%rcx, 80(%rsi)
	addq	%rcx, %rcx
	movq	%rcx, %rax
	xorq	$69649, %rax            # imm = 0x11011
	testl	$65536, %ecx            # imm = 0x10000
	cmoveq	%rcx, %rax
	movq	%rax, 88(%rsi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end8:
	.size	rndcon_gen, .Lfunc_end8-rndcon_gen
	.cfi_endproc
                                        # -- End function
	.globl	encrypt                 # -- Begin function encrypt
	.p2align	4, 0x90
	.type	encrypt,@function
encrypt:                                # @encrypt
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, %rbx
	movq	48(%rdi), %rax
	shlq	$16, %rax
	xorq	(%rdi), %rax
	movq	%rsi, %r14
	xorq	%rax, (%rsi)
	movq	8(%rdi), %rax
	xorq	%rax, 8(%rsi)
	movq	16(%rdi), %rax
	xorq	48(%rdi), %rax
	xorq	%rax, 16(%rsi)
	movq	%rsi, %rdi
	callq	rho
	movq	56(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	16(%rbx), %rax
	xorq	56(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	64(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	16(%rbx), %rax
	xorq	64(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	72(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	16(%rbx), %rax
	xorq	72(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	80(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	16(%rbx), %rax
	xorq	80(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	88(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	16(%rbx), %rax
	xorq	88(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	96(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	16(%rbx), %rax
	xorq	96(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	104(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	16(%rbx), %rax
	xorq	104(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	112(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	16(%rbx), %rax
	xorq	112(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	120(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	16(%rbx), %rax
	xorq	120(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	128(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	16(%rbx), %rax
	xorq	128(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	136(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	16(%rbx), %rax
	xorq	136(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	theta
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end9:
	.size	encrypt, .Lfunc_end9-encrypt
	.cfi_endproc
                                        # -- End function
	.globl	decrypt                 # -- Begin function decrypt
	.p2align	4, 0x90
	.type	decrypt,@function
decrypt:                                # @decrypt
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	mu
	movq	144(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	40(%rbx), %rax
	xorq	144(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	152(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	40(%rbx), %rax
	xorq	152(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	160(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	40(%rbx), %rax
	xorq	160(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	168(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	40(%rbx), %rax
	xorq	168(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	176(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	40(%rbx), %rax
	xorq	176(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	184(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	40(%rbx), %rax
	xorq	184(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	192(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	40(%rbx), %rax
	xorq	192(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	200(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	40(%rbx), %rax
	xorq	200(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	208(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	40(%rbx), %rax
	xorq	208(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	216(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	40(%rbx), %rax
	xorq	216(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	224(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	40(%rbx), %rax
	xorq	224(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	232(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	40(%rbx), %rax
	xorq	232(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	theta
	movq	%r14, %rdi
	callq	mu
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end10:
	.size	decrypt, .Lfunc_end10-decrypt
	.cfi_endproc
                                        # -- End function
	.globl	twy_key                 # -- Begin function twy_key
	.p2align	4, 0x90
	.type	twy_key,@function
twy_key:                                # @twy_key
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, %rbx
	movq	(%rsi), %rax
	movq	%rax, (%rdi)
	leaq	24(%rdi), %r14
	movq	%rax, 24(%rdi)
	movq	8(%rsi), %rax
	movq	%rax, 8(%rdi)
	movq	%rax, 32(%rdi)
	movq	16(%rsi), %rax
	movq	%rax, 16(%rdi)
	movq	%rax, 40(%rdi)
	movq	%r14, %rdi
	callq	theta
	movq	%r14, %rdi
	callq	mu
	leaq	48(%rbx), %rsi
	movl	$2827, %edi             # imm = 0xB0B
	callq	rndcon_gen
	leaq	144(%rbx), %rsi
	movl	$45489, %edi            # imm = 0xB1B1
	callq	rndcon_gen
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end11:
	.size	twy_key, .Lfunc_end11-twy_key
	.cfi_endproc
                                        # -- End function
	.globl	twy_enc                 # -- Begin function twy_enc
	.p2align	4, 0x90
	.type	twy_enc,@function
twy_enc:                                # @twy_enc
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, %r15d
	movq	%rsi, %rbx
	movq	%rdi, %r14
	testl	%edx, %edx
	jg	.LBB12_1
# %bb.2:
	cmpl	$2, %r15d
	jge	.LBB12_3
.LBB12_4:
	cmpl	$3, %r15d
	jl	.LBB12_6
.LBB12_5:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	encrypt
.LBB12_6:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB12_1:
	.cfi_def_cfa %rbp, 16
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	encrypt
	addq	$24, %rbx
	cmpl	$2, %r15d
	jl	.LBB12_4
.LBB12_3:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	encrypt
	addq	$24, %rbx
	cmpl	$3, %r15d
	jge	.LBB12_5
	jmp	.LBB12_6
.Lfunc_end12:
	.size	twy_enc, .Lfunc_end12-twy_enc
	.cfi_endproc
                                        # -- End function
	.globl	twy_dec                 # -- Begin function twy_dec
	.p2align	4, 0x90
	.type	twy_dec,@function
twy_dec:                                # @twy_dec
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, %r15d
	movq	%rsi, %rbx
	movq	%rdi, %r14
	testl	%edx, %edx
	jg	.LBB13_1
# %bb.2:
	cmpl	$2, %r15d
	jge	.LBB13_3
.LBB13_4:
	cmpl	$3, %r15d
	jl	.LBB13_6
.LBB13_5:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	decrypt
.LBB13_6:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB13_1:
	.cfi_def_cfa %rbp, 16
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	decrypt
	addq	$24, %rbx
	cmpl	$2, %r15d
	jl	.LBB13_4
.LBB13_3:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	decrypt
	addq	$24, %rbx
	cmpl	$3, %r15d
	jge	.LBB13_5
	jmp	.LBB13_6
.Lfunc_end13:
	.size	twy_dec, .Lfunc_end13-twy_dec
	.cfi_endproc
                                        # -- End function
	.globl	twy_destroy             # -- Begin function twy_destroy
	.p2align	4, 0x90
	.type	twy_destroy,@function
twy_destroy:                            # @twy_destroy
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rdi)
	movups	%xmm0, 32(%rdi)
	movups	%xmm0, 16(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end14:
	.size	twy_destroy, .Lfunc_end14-twy_destroy
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%20s : %08lx %08lx %08lx \n"
	.size	.L.str, 27

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"**********\n"
	.size	.L.str.1, 12

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"KEY = "
	.size	.L.str.2, 7

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"PLAIN = "
	.size	.L.str.3, 9

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"CIPHER = "
	.size	.L.str.4, 10

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"Block %01d encrypts to %08lx %08lx %08lx\n"
	.size	.L.str.5, 42

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"Block %01d decrypts to %08lx %08lx %08lx\n"
	.size	.L.str.6, 42

	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits

	.text
	.file	"llvm-link"
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
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	movl	$0, -52(%rbp)
	callq	init_dut
	movaps	.L__const.main.input_data+16(%rip), %xmm0
	movaps	%xmm0, -32(%rbp)
	movaps	.L__const.main.input_data(%rip), %xmm0
	movaps	%xmm0, -48(%rbp)
	leaq	-48(%rbp), %rdi
	movl	$32, %esi
	callq	do_one_computation
	movzbl	%al, %esi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB0_2
# %bb.1:                                # %SP_return
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB0_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	do_one_computation      # -- Begin function do_one_computation
	.p2align	4, 0x90
	.type	do_one_computation,@function
do_one_computation:                     # @do_one_computation
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 16(%rsp)
	movaps	%xmm0, (%rsp)
	movaps	.L__const.do_one_computation.basepoint(%rip), %xmm0
	movaps	%xmm0, 32(%rsp)
	movaps	.L__const.do_one_computation.basepoint+16(%rip), %xmm0
	movaps	%xmm0, 48(%rsp)
	movq	%rsp, %r12
	leaq	32(%rsp), %r15
	movl	$32, %esi
	movl	$32, %r9d
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	movq	%r15, %r8
	callq	curve25519_donna
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	%rax, (%rbx)
	movq	%rcx, 8(%rbx)
	movq	16(%rsp), %rax
	movq	%rax, 16(%rbx)
	movq	24(%rsp), %rax
	movq	%rax, 24(%rbx)
	movl	$32, %esi
	movl	$32, %r9d
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	movq	%r15, %r8
	callq	curve25519_donna
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	%rax, (%rbx)
	movq	%rcx, 8(%rbx)
	movq	16(%rsp), %rax
	movq	%rax, 16(%rbx)
	movq	24(%rsp), %rax
	movq	%rax, 24(%rbx)
	movl	$32, %esi
	movl	$32, %r9d
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	movq	%r15, %r8
	callq	curve25519_donna
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	%rax, (%rbx)
	movq	%rcx, 8(%rbx)
	movq	16(%rsp), %rax
	movq	%rax, 16(%rbx)
	movq	24(%rsp), %rax
	movq	%rax, 24(%rbx)
	movl	$32, %esi
	movl	$32, %r9d
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	movq	%r15, %r8
	callq	curve25519_donna
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	%rax, (%rbx)
	movq	%rcx, 8(%rbx)
	movq	16(%rsp), %rax
	movq	%rax, 16(%rbx)
	movq	24(%rsp), %rax
	movq	%rax, 24(%rbx)
	movl	$32, %esi
	movl	$32, %r9d
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	movq	%r15, %r8
	callq	curve25519_donna
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	%rax, (%rbx)
	movq	%rcx, 8(%rbx)
	movq	16(%rsp), %rax
	movq	%rax, 16(%rbx)
	movq	24(%rsp), %rax
	movq	%rax, 24(%rbx)
	movl	$32, %esi
	movl	$32, %r9d
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	movq	%r15, %r8
	callq	curve25519_donna
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	%rax, (%rbx)
	movq	%rcx, 8(%rbx)
	movq	16(%rsp), %rax
	movq	%rax, 16(%rbx)
	movq	24(%rsp), %rax
	movq	%rax, 24(%rbx)
	movl	$32, %esi
	movl	$32, %r9d
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	movq	%r15, %r8
	callq	curve25519_donna
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	%rax, (%rbx)
	movq	%rcx, 8(%rbx)
	movq	16(%rsp), %rax
	movq	%rax, 16(%rbx)
	movq	24(%rsp), %rax
	movq	%rax, 24(%rbx)
	movl	$32, %esi
	movl	$32, %r9d
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	movq	%r15, %r8
	callq	curve25519_donna
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	%rax, (%rbx)
	movq	%rcx, 8(%rbx)
	movq	16(%rsp), %rax
	movq	%rax, 16(%rbx)
	movq	24(%rsp), %rax
	movq	%rax, 24(%rbx)
	movl	$32, %esi
	movl	$32, %r9d
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	movq	%r15, %r8
	callq	curve25519_donna
	movq	24(%rsp), %rax
	movq	%rax, 24(%rbx)
	movq	16(%rsp), %rax
	movq	%rax, 16(%rbx)
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, (%rbx)
	movb	(%rsp), %al
	addq	$72, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	do_one_computation, .Lfunc_end1-do_one_computation
	.cfi_endproc
                                        # -- End function
	.globl	init_dut                # -- Begin function init_dut
	.p2align	4, 0x90
	.type	init_dut,@function
init_dut:                               # @init_dut
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	init_dut, .Lfunc_end2-init_dut
	.cfi_endproc
                                        # -- End function
	.globl	prepare_inputs          # -- Begin function prepare_inputs
	.p2align	4, 0x90
	.type	prepare_inputs,@function
prepare_inputs:                         # @prepare_inputs
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdx, %r14
	movq	%rdi, %rbx
	movl	$32, %edx
	callq	randombytes
	callq	randombit
	movb	%al, (%r14)
	testb	%al, %al
	jne	.LBB3_2
# %bb.1:
	movq	$0, 24(%rbx)
	movq	$0, 16(%rbx)
	movq	$0, 8(%rbx)
	movq	$0, (%rbx)
.LBB3_2:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	prepare_inputs, .Lfunc_end3-prepare_inputs
	.cfi_endproc
                                        # -- End function
	.globl	curve25519_donna        # -- Begin function curve25519_donna
	.p2align	4, 0x90
	.type	curve25519_donna,@function
curve25519_donna:                       # @curve25519_donna
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$392, %rsp              # imm = 0x188
	.cfi_def_cfa_offset 448
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, %rcx
	movq	%rsi, %r14
	movq	%rdi, %r15
	movb	$1, 47(%rsp)
	movb	(%rdx), %al
	movb	%al, (%rsp)
	movb	1(%rdx), %al
	movb	%al, 1(%rsp)
	movb	2(%rdx), %al
	movb	%al, 2(%rsp)
	movb	3(%rdx), %al
	movb	%al, 3(%rsp)
	movb	4(%rdx), %al
	movb	%al, 4(%rsp)
	movb	5(%rdx), %al
	movb	%al, 5(%rsp)
	movb	6(%rdx), %al
	movb	%al, 6(%rsp)
	movb	7(%rdx), %al
	movb	%al, 7(%rsp)
	movb	8(%rdx), %al
	movb	%al, 8(%rsp)
	movb	9(%rdx), %al
	movb	%al, 9(%rsp)
	movb	10(%rdx), %al
	movb	%al, 10(%rsp)
	movb	11(%rdx), %al
	movb	%al, 11(%rsp)
	movb	12(%rdx), %al
	movb	%al, 12(%rsp)
	movb	13(%rdx), %al
	movb	%al, 13(%rsp)
	movb	14(%rdx), %al
	movb	%al, 14(%rsp)
	movb	15(%rdx), %al
	movb	%al, 15(%rsp)
	movb	16(%rdx), %al
	movb	%al, 16(%rsp)
	movb	17(%rdx), %al
	movb	%al, 17(%rsp)
	movb	18(%rdx), %al
	movb	%al, 18(%rsp)
	movb	19(%rdx), %al
	movb	%al, 19(%rsp)
	movb	20(%rdx), %al
	movb	%al, 20(%rsp)
	movb	21(%rdx), %al
	movb	%al, 21(%rsp)
	movb	22(%rdx), %al
	movb	%al, 22(%rsp)
	movb	23(%rdx), %al
	movb	%al, 23(%rsp)
	movb	24(%rdx), %al
	movb	%al, 24(%rsp)
	movb	25(%rdx), %al
	movb	%al, 25(%rsp)
	movb	26(%rdx), %al
	movb	%al, 26(%rsp)
	movb	27(%rdx), %al
	movb	%al, 27(%rsp)
	movb	28(%rdx), %al
	movb	%al, 28(%rsp)
	movb	29(%rdx), %al
	movb	%al, 29(%rsp)
	movb	30(%rdx), %al
	movb	%al, 30(%rsp)
	movb	31(%rdx), %al
	movb	%al, 31(%rsp)
	andb	$-8, (%rsp)
	andb	$63, %al
	orb	$64, %al
	movb	%al, 31(%rsp)
	leaq	208(%rsp), %r13
	movl	$10, %esi
	movq	%r13, %rdi
	movq	%r8, %rdx
	movl	$1, %r8d
	callq	fexpand
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	136(%rsp), %r12
	leaq	296(%rsp), %rbp
	leaq	8(%rsp), %r8
	movl	$10, %esi
	movl	$11, %ecx
	movl	$32, %r9d
	movq	%r12, %rdi
	movq	%rbp, %rdx
	pushq	$1
	.cfi_adjust_cfa_offset 8
	pushq	$10
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	cmult
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	leaq	48(%rsp), %rbx
	movl	$10, %esi
	movl	$11, %ecx
	movq	%rbx, %rdi
	movq	%rbp, %rdx
	movl	$1, %r8d
	callq	crecip
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$11, %esi
	movl	$10, %ecx
	movl	$10, %r9d
	movq	%rbp, %rdi
	movq	%r12, %rdx
	movq	%rbx, %r8
	pushq	$1
	.cfi_adjust_cfa_offset 8
	callq	fmul
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	movl	$11, %ecx
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbp, %rdx
	movl	$1, %r8d
	callq	fcontract
	xorl	%eax, %eax
	addq	$392, %rsp              # imm = 0x188
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	curve25519_donna, .Lfunc_end4-curve25519_donna
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fexpand
	.type	fexpand,@function
fexpand:                                # @fexpand
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	andb	$1, %r8b
	leaq	2(%rdx), %rax
	leaq	3(%rdx), %r9
	cmpq	$3, %rcx
	leaq	-8(%rsp), %r15
	movq	%r15, %r10
	cmovgq	%r9, %r10
	testb	%r8b, %r8b
	movq	%r10, %r11
	cmovneq	%r9, %r11
	cmpq	$2, %rcx
	movq	%r15, %r12
	cmovgq	%rax, %r12
	testb	%r8b, %r8b
	cmovneq	%rax, %r12
	leaq	1(%rdx), %r14
	cmpq	$1, %rcx
	movq	%r15, %rax
	cmovgq	%r14, %rax
	testb	%r8b, %r8b
	cmovneq	%r14, %rax
	testq	%rcx, %rcx
	movq	%r15, %rbx
	cmovgq	%rdx, %rbx
	testb	%r8b, %r8b
	movb	%r8b, -9(%rsp)
	cmovneq	%rdx, %rbx
	movzbl	(%rbx), %ebx
	movzbl	(%rax), %eax
	shll	$8, %eax
	orl	%ebx, %eax
	movzbl	(%r12), %ebx
	shll	$16, %ebx
	orl	%eax, %ebx
	movzbl	(%r11), %eax
	shll	$24, %eax
	orl	%ebx, %eax
	andl	$67108863, %eax         # imm = 0x3FFFFFF
	testb	%r8b, %r8b
	cmoveq	(%rdi), %rax
	testq	%rsi, %rsi
	movq	%r15, %rbx
	cmovgq	%rdi, %rbx
	testb	%r8b, %r8b
	cmovneq	%rdi, %rbx
	movq	%rax, (%rbx)
	leaq	5(%rdx), %r12
	leaq	6(%rdx), %r8
	cmpq	$6, %rcx
	movb	-9(%rsp), %r13b
	movq	%r15, %r11
	cmovgq	%r8, %r11
	testb	%r13b, %r13b
	movq	%r11, %r14
	cmovneq	%r8, %r14
	cmpq	$5, %rcx
	movq	%r15, %rax
	cmovgq	%r12, %rax
	testb	%r13b, %r13b
	cmovneq	%r12, %rax
	leaq	4(%rdx), %rbx
	cmpq	$4, %rcx
	movq	%r15, %rbp
	cmovgq	%rbx, %rbp
	testb	%r13b, %r13b
	cmovneq	%r9, %r10
	movzbl	(%r10), %r9d
	cmovneq	%rbx, %rbp
	movzbl	(%rbp), %ebp
	shll	$8, %ebp
	orl	%r9d, %ebp
	movzbl	(%rax), %eax
	shll	$16, %eax
	orl	%ebp, %eax
	movzbl	(%r14), %ebp
	shll	$24, %ebp
	orl	%eax, %ebp
	shrl	$2, %ebp
	andl	$33554431, %ebp         # imm = 0x1FFFFFF
	testb	%r13b, %r13b
	cmoveq	8(%rdi), %rbp
	leaq	8(%rdi), %rax
	cmpq	$1, %rsi
	movq	%r15, %rbx
	cmovgq	%rax, %rbx
	testb	%r13b, %r13b
	cmovneq	%rax, %rbx
	movq	%rbp, (%rbx)
	leaq	8(%rdx), %rax
	leaq	9(%rdx), %r9
	cmpq	$9, %rcx
	movb	-9(%rsp), %r12b
	movq	%r15, %r10
	cmovgq	%r9, %r10
	testb	%r12b, %r12b
	movq	%r10, %r14
	cmovneq	%r9, %r14
	cmpq	$8, %rcx
	movq	%r15, %rbp
	cmovgq	%rax, %rbp
	testb	%r12b, %r12b
	cmovneq	%rax, %rbp
	leaq	7(%rdx), %rax
	cmpq	$7, %rcx
	movq	%r15, %rbx
	cmovgq	%rax, %rbx
	testb	%r12b, %r12b
	cmovneq	%r8, %r11
	movzbl	(%r11), %r8d
	cmovneq	%rax, %rbx
	movzbl	(%rbx), %eax
	shll	$8, %eax
	orl	%r8d, %eax
	movzbl	(%rbp), %ebp
	shll	$16, %ebp
	orl	%eax, %ebp
	movzbl	(%r14), %eax
	shll	$24, %eax
	orl	%ebp, %eax
	shrl	$3, %eax
	andl	$67108863, %eax         # imm = 0x3FFFFFF
	testb	%r12b, %r12b
	cmoveq	16(%rdi), %rax
	leaq	16(%rdi), %rbp
	cmpq	$2, %rsi
	movq	%r15, %rbx
	cmovgq	%rbp, %rbx
	testb	%r12b, %r12b
	cmovneq	%rbp, %rbx
	movq	%rax, (%rbx)
	leaq	11(%rdx), %rax
	leaq	12(%rdx), %r8
	cmpq	$12, %rcx
	movb	-9(%rsp), %r12b
	movq	%r15, %r11
	cmovgq	%r8, %r11
	testb	%r12b, %r12b
	movq	%r11, %r14
	cmovneq	%r8, %r14
	cmpq	$11, %rcx
	movq	%r15, %rbp
	cmovgq	%rax, %rbp
	testb	%r12b, %r12b
	cmovneq	%rax, %rbp
	leaq	10(%rdx), %rax
	cmpq	$10, %rcx
	movq	%r15, %rbx
	cmovgq	%rax, %rbx
	testb	%r12b, %r12b
	cmovneq	%r9, %r10
	movzbl	(%r10), %r9d
	cmovneq	%rax, %rbx
	movzbl	(%rbx), %eax
	shll	$8, %eax
	orl	%r9d, %eax
	movzbl	(%rbp), %ebp
	shll	$16, %ebp
	orl	%eax, %ebp
	movzbl	(%r14), %eax
	shll	$24, %eax
	orl	%ebp, %eax
	shrl	$5, %eax
	andl	$33554431, %eax         # imm = 0x1FFFFFF
	testb	%r12b, %r12b
	cmoveq	24(%rdi), %rax
	leaq	24(%rdi), %rbp
	cmpq	$3, %rsi
	movq	%r15, %rbx
	cmovgq	%rbp, %rbx
	testb	%r12b, %r12b
	cmovneq	%rbp, %rbx
	movq	%rax, (%rbx)
	leaq	14(%rdx), %r9
	leaq	15(%rdx), %rbp
	cmpq	$15, %rcx
	movq	%r15, %rax
	cmovgq	%rbp, %rax
	movb	-9(%rsp), %r10b
	testb	%r10b, %r10b
	cmovneq	%rbp, %rax
	cmpq	$14, %rcx
	movq	%r15, %rbp
	cmovgq	%r9, %rbp
	testb	%r10b, %r10b
	cmovneq	%r9, %rbp
	leaq	13(%rdx), %r9
	cmpq	$13, %rcx
	movq	%r15, %rbx
	cmovgq	%r9, %rbx
	testb	%r10b, %r10b
	cmovneq	%r8, %r11
	movzbl	(%r11), %r8d
	cmovneq	%r9, %rbx
	movzbl	(%rbx), %ebx
	shlq	$8, %rbx
	orq	%r8, %rbx
	movzbl	(%rbp), %ebp
	shlq	$16, %rbp
	orq	%rbx, %rbp
	movzbl	(%rax), %eax
	shlq	$24, %rax
	orq	%rbp, %rax
	shrq	$6, %rax
	testb	%r10b, %r10b
	cmoveq	32(%rdi), %rax
	leaq	32(%rdi), %rbp
	cmpq	$4, %rsi
	movq	%r15, %rbx
	cmovgq	%rbp, %rbx
	testb	%r10b, %r10b
	cmovneq	%rbp, %rbx
	movq	%rax, (%rbx)
	leaq	18(%rdx), %rax
	leaq	19(%rdx), %r8
	cmpq	$19, %rcx
	movb	-9(%rsp), %r11b
	movq	%r15, %r9
	cmovgq	%r8, %r9
	testb	%r11b, %r11b
	movq	%r9, %r10
	cmovneq	%r8, %r10
	cmpq	$18, %rcx
	movq	%r15, %rbp
	cmovgq	%rax, %rbp
	testb	%r11b, %r11b
	cmovneq	%rax, %rbp
	leaq	17(%rdx), %rax
	cmpq	$17, %rcx
	movq	%r15, %rbx
	cmovgq	%rax, %rbx
	testb	%r11b, %r11b
	cmovneq	%rax, %rbx
	leaq	16(%rdx), %r14
	cmpq	$16, %rcx
	movq	%r15, %rax
	cmovgq	%r14, %rax
	testb	%r11b, %r11b
	cmovneq	%r14, %rax
	movzbl	(%rax), %eax
	movzbl	(%rbx), %ebx
	shll	$8, %ebx
	orl	%eax, %ebx
	movzbl	(%rbp), %eax
	shll	$16, %eax
	orl	%ebx, %eax
	movzbl	(%r10), %ebp
	shll	$24, %ebp
	orl	%eax, %ebp
	andl	$33554431, %ebp         # imm = 0x1FFFFFF
	testb	%r11b, %r11b
	cmoveq	40(%rdi), %rbp
	leaq	40(%rdi), %rax
	cmpq	$5, %rsi
	movq	%r15, %rbx
	cmovgq	%rax, %rbx
	testb	%r11b, %r11b
	cmovneq	%rax, %rbx
	movq	%rbp, (%rbx)
	leaq	21(%rdx), %rax
	leaq	22(%rdx), %r10
	cmpq	$22, %rcx
	movb	-9(%rsp), %r12b
	movq	%r15, %r11
	cmovgq	%r10, %r11
	testb	%r12b, %r12b
	movq	%r11, %r14
	cmovneq	%r10, %r14
	cmpq	$21, %rcx
	movq	%r15, %rbp
	cmovgq	%rax, %rbp
	testb	%r12b, %r12b
	cmovneq	%rax, %rbp
	leaq	20(%rdx), %rax
	cmpq	$20, %rcx
	movq	%r15, %rbx
	cmovgq	%rax, %rbx
	testb	%r12b, %r12b
	cmovneq	%r8, %r9
	movzbl	(%r9), %r8d
	cmovneq	%rax, %rbx
	movzbl	(%rbx), %eax
	shll	$8, %eax
	orl	%r8d, %eax
	movzbl	(%rbp), %ebp
	shll	$16, %ebp
	orl	%eax, %ebp
	movzbl	(%r14), %eax
	shll	$24, %eax
	orl	%ebp, %eax
	shrl	%eax
	andl	$67108863, %eax         # imm = 0x3FFFFFF
	testb	%r12b, %r12b
	cmoveq	48(%rdi), %rax
	leaq	48(%rdi), %rbp
	cmpq	$6, %rsi
	movq	%r15, %rbx
	cmovgq	%rbp, %rbx
	testb	%r12b, %r12b
	cmovneq	%rbp, %rbx
	movq	%rax, (%rbx)
	leaq	24(%rdx), %rax
	leaq	25(%rdx), %r9
	cmpq	$25, %rcx
	movb	-9(%rsp), %r12b
	movq	%r15, %r14
	cmovgq	%r9, %r14
	testb	%r12b, %r12b
	movq	%r14, %r8
	cmovneq	%r9, %r8
	cmpq	$24, %rcx
	movq	%r15, %rbp
	cmovgq	%rax, %rbp
	testb	%r12b, %r12b
	cmovneq	%rax, %rbp
	leaq	23(%rdx), %rax
	cmpq	$23, %rcx
	movq	%r15, %rbx
	cmovgq	%rax, %rbx
	testb	%r12b, %r12b
	cmovneq	%r10, %r11
	movzbl	(%r11), %r10d
	cmovneq	%rax, %rbx
	movzbl	(%rbx), %eax
	shll	$8, %eax
	orl	%r10d, %eax
	movzbl	(%rbp), %ebp
	shll	$16, %ebp
	orl	%eax, %ebp
	movzbl	(%r8), %eax
	shll	$24, %eax
	orl	%ebp, %eax
	shrl	$3, %eax
	andl	$33554431, %eax         # imm = 0x1FFFFFF
	testb	%r12b, %r12b
	cmoveq	56(%rdi), %rax
	leaq	56(%rdi), %rbp
	cmpq	$7, %rsi
	movq	%r15, %rbx
	cmovgq	%rbp, %rbx
	testb	%r12b, %r12b
	cmovneq	%rbp, %rbx
	movq	%rax, (%rbx)
	leaq	27(%rdx), %rax
	leaq	28(%rdx), %r8
	cmpq	$28, %rcx
	movb	-9(%rsp), %r12b
	movq	%r15, %r10
	cmovgq	%r8, %r10
	testb	%r12b, %r12b
	movq	%r10, %r11
	cmovneq	%r8, %r11
	cmpq	$27, %rcx
	movq	%r15, %rbp
	cmovgq	%rax, %rbp
	testb	%r12b, %r12b
	cmovneq	%rax, %rbp
	leaq	26(%rdx), %rax
	cmpq	$26, %rcx
	movq	%r15, %rbx
	cmovgq	%rax, %rbx
	testb	%r12b, %r12b
	cmovneq	%r9, %r14
	movzbl	(%r14), %r9d
	cmovneq	%rax, %rbx
	movzbl	(%rbx), %eax
	shll	$8, %eax
	orl	%r9d, %eax
	movzbl	(%rbp), %ebp
	shll	$16, %ebp
	orl	%eax, %ebp
	movzbl	(%r11), %eax
	shll	$24, %eax
	orl	%ebp, %eax
	shrl	$4, %eax
	andl	$67108863, %eax         # imm = 0x3FFFFFF
	testb	%r12b, %r12b
	cmoveq	64(%rdi), %rax
	leaq	64(%rdi), %rbp
	cmpq	$8, %rsi
	movq	%r15, %rbx
	cmovgq	%rbp, %rbx
	testb	%r12b, %r12b
	cmovneq	%rbp, %rbx
	movq	%rax, (%rbx)
	leaq	30(%rdx), %r9
	leaq	31(%rdx), %rbp
	cmpq	$31, %rcx
	movq	%r15, %rax
	cmovgq	%rbp, %rax
	movb	-9(%rsp), %bl
	testb	%bl, %bl
	cmovneq	%rbp, %rax
	cmpq	$30, %rcx
	movq	%r15, %rbp
	cmovgq	%r9, %rbp
	testb	%bl, %bl
	cmovneq	%r9, %rbp
	addq	$29, %rdx
	cmpq	$29, %rcx
	movq	%r15, %rcx
	cmovgq	%rdx, %rcx
	testb	%bl, %bl
	cmovneq	%r8, %r10
	movzbl	(%r10), %r8d
	cmovneq	%rdx, %rcx
	movzbl	(%rcx), %ecx
	shll	$8, %ecx
	orl	%r8d, %ecx
	movzbl	(%rbp), %edx
	shll	$16, %edx
	orl	%ecx, %edx
	movzbl	(%rax), %eax
	shll	$24, %eax
	orl	%edx, %eax
	shrl	$6, %eax
	andl	$33554431, %eax         # imm = 0x1FFFFFF
	testb	%bl, %bl
	cmoveq	72(%rdi), %rax
	addq	$72, %rdi
	cmpq	$9, %rsi
	cmovgq	%rdi, %r15
	testb	%bl, %bl
	cmovneq	%rdi, %r15
	movq	%rax, (%r15)
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	fexpand, .Lfunc_end5-fexpand
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function cmult
	.type	cmult,@function
cmult:                                  # @cmult
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$1320, %rsp             # imm = 0x528
	.cfi_def_cfa_offset 1376
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r9, 16(%rsp)           # 8-byte Spill
	movq	%r8, 8(%rsp)            # 8-byte Spill
	movq	%rdx, 1312(%rsp)        # 8-byte Spill
	movq	%rdi, 1304(%rsp)        # 8-byte Spill
	movq	1376(%rsp), %rsi
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 832(%rsp)
	movaps	%xmm0, 848(%rsp)
	movaps	%xmm0, 864(%rsp)
	movaps	%xmm0, 880(%rsp)
	movaps	%xmm0, 896(%rsp)
	movaps	%xmm0, 912(%rsp)
	movaps	%xmm0, 928(%rsp)
	movaps	%xmm0, 944(%rsp)
	movaps	%xmm0, 960(%rsp)
	movq	$0, 976(%rsp)
	movaps	%xmm0, 1152(%rsp)
	movaps	%xmm0, 1168(%rsp)
	movaps	%xmm0, 1184(%rsp)
	movaps	%xmm0, 1200(%rsp)
	movaps	%xmm0, 1216(%rsp)
	movaps	%xmm0, 1232(%rsp)
	movaps	%xmm0, 1248(%rsp)
	movaps	%xmm0, 1264(%rsp)
	movaps	%xmm0, 1280(%rsp)
	movq	$0, 1296(%rsp)
	movl	1392(%rsp), %ebx
	cmpb	$0, 1392(%rsp)
	movl	$1, %eax
	movq	1152(%rsp), %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 1152(%rsp)
	movaps	%xmm0, 672(%rsp)
	movaps	%xmm0, 688(%rsp)
	movaps	%xmm0, 704(%rsp)
	movaps	%xmm0, 720(%rsp)
	movaps	%xmm0, 736(%rsp)
	movaps	%xmm0, 752(%rsp)
	movaps	%xmm0, 768(%rsp)
	movaps	%xmm0, 784(%rsp)
	movaps	%xmm0, 800(%rsp)
	movq	$0, 816(%rsp)
	movq	672(%rsp), %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 672(%rsp)
	movaps	%xmm0, 192(%rsp)
	movaps	%xmm0, 208(%rsp)
	movaps	%xmm0, 224(%rsp)
	movaps	%xmm0, 240(%rsp)
	movaps	%xmm0, 256(%rsp)
	movaps	%xmm0, 272(%rsp)
	movaps	%xmm0, 288(%rsp)
	movaps	%xmm0, 304(%rsp)
	movaps	%xmm0, 320(%rsp)
	movq	$0, 336(%rsp)
	movaps	%xmm0, 640(%rsp)
	movaps	%xmm0, 624(%rsp)
	movaps	%xmm0, 608(%rsp)
	movaps	%xmm0, 592(%rsp)
	movaps	%xmm0, 576(%rsp)
	movaps	%xmm0, 560(%rsp)
	movaps	%xmm0, 544(%rsp)
	movaps	%xmm0, 528(%rsp)
	movaps	%xmm0, 512(%rsp)
	movq	$0, 656(%rsp)
	movaps	%xmm0, 992(%rsp)
	movaps	%xmm0, 1120(%rsp)
	movaps	%xmm0, 1104(%rsp)
	movaps	%xmm0, 1088(%rsp)
	movaps	%xmm0, 1072(%rsp)
	movaps	%xmm0, 1056(%rsp)
	movaps	%xmm0, 1040(%rsp)
	movaps	%xmm0, 1024(%rsp)
	movaps	%xmm0, 1008(%rsp)
	movq	$0, 1136(%rsp)
	cmpb	$0, 1392(%rsp)
	movq	992(%rsp), %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 992(%rsp)
	movaps	%xmm0, 32(%rsp)
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm0, 64(%rsp)
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm0, 96(%rsp)
	movaps	%xmm0, 112(%rsp)
	movaps	%xmm0, 128(%rsp)
	movaps	%xmm0, 144(%rsp)
	movaps	%xmm0, 160(%rsp)
	movq	$0, 176(%rsp)
	movaps	%xmm0, 352(%rsp)
	movaps	%xmm0, 480(%rsp)
	movaps	%xmm0, 464(%rsp)
	movaps	%xmm0, 448(%rsp)
	movaps	%xmm0, 432(%rsp)
	movaps	%xmm0, 416(%rsp)
	movaps	%xmm0, 400(%rsp)
	movaps	%xmm0, 384(%rsp)
	movaps	%xmm0, 368(%rsp)
	movq	$0, 496(%rsp)
	cmpb	$0, 1392(%rsp)
	cmoveq	352(%rsp), %rax
	movq	%rax, 352(%rsp)
	leaq	832(%rsp), %rdi
	movl	$10, %ecx
	movq	%rdi, %rdx
	rep;movsq (%rsi), %es:(%rdi)
	leaq	31(%r8), %rax
	cmpq	$31, %r9
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %r15d
	movq	%r15, %r14
	shrq	$7, %r14
	leaq	672(%rsp), %rdi
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leaq	192(%rsp), %r13
	leaq	1152(%rsp), %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%rbp, %rdx
	movq	%r14, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	1000(%rsp), %rax
	leaq	40(%rsp), %r12
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	movq	%r12, %rdi
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%rbp
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rbp
	pushq	%rbp
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rbp
	pushq	%rbp
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%rax
	movq	%rax, %rbp
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %rdx
	movq	%r14, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rbp, %rdx
	movq	%r14, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %r13
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r12
	movq	%r12, %rdi
	leaq	992(%rsp), %r15
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rdx
	movq	%r14, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r14
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%r14, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r13
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%r14, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r12
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r12
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %r14            # 8-byte Reload
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r15
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	%r14, %rax
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r13
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$30, %rax
	cmpq	$30, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r15
	movq	%r14, %rdx
	movq	%r14, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r14
	movq	%r14, %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r15
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	512(%rsp), %r14
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r14
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %r12
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r13
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %r14
	movq	%r14, %rdx
	leaq	840(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	832(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	832(%rsp), %r15
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r14
	movq	%r14, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %r14            # 8-byte Reload
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r13
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	%r14, %rax
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r14
	movq	%r14, %rdi
	leaq	200(%rsp), %r12
	movq	%r12, %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$29, %rax
	cmpq	$29, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %r15
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r13
	movq	%r13, %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r14
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r12
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	leaq	512(%rsp), %r15
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r13
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r14
	movq	%r14, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %r13
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r14d
	movq	%r14, %rbp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %r13
	movq	%r13, %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	512(%rsp), %r15
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rdx
	movq	%r14, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$28, %rax
	cmpq	$28, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %r14d
	movq	%r14, %rbp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %r15
	movq	%r15, %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	512(%rsp), %r13
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %r14d
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r15
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	512(%rsp), %r12
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%r14b, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r14
	movq	%r14, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r14
	movq	%r14, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r15
	leaq	512(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %eax
	movq	%rax, %rbp
	movq	%rax, %r14
	movq	%rax, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	512(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r12
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r13
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$27, %rax
	cmpq	$27, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r15
	movq	%r15, %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r14d
	movq	%r14, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	832(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r15
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%r14, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %r14
	movq	%r14, %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %eax
	movq	%rax, %rbp
	movq	%rax, %r14
	movq	%rax, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r12
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r13
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r15
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$26, %rax
	cmpq	$26, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r12
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r13
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r14d
	movq	%r14, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r15
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r14
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %r13
	movq	%r13, %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r14, %rdx
	movq	%r14, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r14
	movq	%r14, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r13
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %r14            # 8-byte Reload
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	%r14, %rax
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$25, %rax
	cmpq	$25, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%r14, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %r12
	movq	%r12, %rdx
	leaq	520(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r15
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%r14, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %r14
	movq	%r14, %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %eax
	movq	%rax, %rbp
	movq	%rax, %r14
	movq	%rax, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r13
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r12
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r15
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$24, %rax
	cmpq	$24, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r13
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r12
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r14d
	movq	%r14, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r15
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r14
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %r12
	movq	%r12, %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r15
	movq	%r14, %rdx
	movq	%r14, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r13
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r12
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %r12
	movq	%r12, %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$23, %rax
	cmpq	$23, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	512(%rsp), %r15
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r14
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r12
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %r14            # 8-byte Reload
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%r14b, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r12
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r14
	movq	%r14, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r13
	leaq	512(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r15
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r14d
	movq	%r14, %rbp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	512(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r15
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	512(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$22, %rax
	cmpq	$22, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %r14d
	movq	%r14, %rbp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r15
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %r14d
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	832(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r15
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%r14b, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r14
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r12
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%r14, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r14d
	movq	%r14, %rbp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	832(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	512(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %r14
	movq	%r14, %rdx
	leaq	840(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	832(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$21, %rax
	cmpq	$21, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	832(%rsp), %r13
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %r14            # 8-byte Reload
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	%r14, %rcx
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r13
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r14
	movq	%r14, %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r15
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %r14            # 8-byte Reload
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	movq	%rdi, %r15
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	%r14, %rax
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r13
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$20, %rax
	cmpq	$20, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r13
	movq	%r14, %rdx
	movq	%r14, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r14
	movq	%r14, %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r12
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %r13
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %r14            # 8-byte Reload
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	832(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r13
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	%r14, %rcx
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	512(%rsp), %r15
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	992(%rsp), %rdx
	movq	%rdx, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r12
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r13
	movq	%r13, %rdx
	leaq	520(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r15
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%r14, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r14
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r12
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	movq	%rdi, %r15
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %r13
	movq	%r13, %rdx
	leaq	840(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r12
	leaq	832(%rsp), %r15
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$19, %rax
	cmpq	$19, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r12
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r14
	movq	%r14, %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r15
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r14
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r14
	movq	%r14, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %r13
	movq	%r13, %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r14d
	movq	%r14, %rbp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	832(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r15
	leaq	832(%rsp), %rdx
	movq	%rdx, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$18, %rax
	cmpq	$18, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r14d
	movq	%r14, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	832(%rsp), %r14
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %r13
	movq	%r13, %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r15
	movq	%r15, %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r14d
	movq	%r14, %rbp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r12
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r14
	movq	%r14, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$17, %rax
	cmpq	$17, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %r13
	movq	%r13, %rdx
	leaq	520(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %r14            # 8-byte Reload
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	%r14, %rcx
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r14
	movq	%r14, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r14
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %r13
	movq	%r13, %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %rdx
	movq	%rdx, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	832(%rsp), %r13
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$16, %rax
	cmpq	$16, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%r14, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r14
	movq	%r14, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r15
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r14
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r12
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r14
	movq	%r14, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r14d
	movq	%r14, %rbp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r15
	movq	%r15, %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$15, %rax
	cmpq	$15, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r14, %rdx
	movq	%r14, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r14
	movq	%r14, %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r15
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	512(%rsp), %r14
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %r12
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r12
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r14
	movq	%r14, %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r15
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %r14            # 8-byte Reload
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	movq	%rdi, %r15
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	%r14, %rax
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r12
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$14, %rax
	cmpq	$14, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r12
	movq	%r14, %rdx
	movq	%r14, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r14
	movq	%r14, %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r13
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	512(%rsp), %r12
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %r14            # 8-byte Reload
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	832(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r12
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	%r14, %rcx
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %r15
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	992(%rsp), %rdx
	movq	%rdx, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r12
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r13
	movq	%r13, %rdx
	leaq	520(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r15
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%r14, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r14
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r12
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	movq	%rdi, %r15
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %r13
	movq	%r13, %rdx
	leaq	840(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r12
	leaq	832(%rsp), %r15
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$13, %rax
	cmpq	$13, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r12
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r14
	movq	%r14, %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r15
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r14
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r14
	movq	%r14, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %r13
	movq	%r13, %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r14d
	movq	%r14, %rbp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	832(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r15
	leaq	832(%rsp), %rdx
	movq	%rdx, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$12, %rax
	cmpq	$12, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r14d
	movq	%r14, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	832(%rsp), %r14
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r13
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r14
	movq	%r14, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %r13
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r14d
	movq	%r14, %rbp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r15
	leaq	832(%rsp), %rdx
	movq	%rdx, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r14
	movq	%r14, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r14
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$11, %rax
	cmpq	$11, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %r12
	movq	%r12, %rdx
	leaq	520(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r14, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %r13
	movq	%r13, %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %r14
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %r13
	movq	%r13, %rdx
	leaq	840(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r12
	leaq	832(%rsp), %r15
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$10, %rax
	cmpq	$10, 16(%rsp)           # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%r14, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r14
	movq	%r14, %rdi
	leaq	360(%rsp), %r15
	movq	%r15, %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r13
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %r15
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %r15
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%r14, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r14
	movq	%r14, %rdi
	leaq	360(%rsp), %r15
	movq	%r15, %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %eax
	movq	%rax, %rbp
	movq	%rax, %r14
	movq	%rax, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	832(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %r13
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	leaq	832(%rsp), %r12
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r13
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$9, %rax
	cmpq	$9, 16(%rsp)            # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r12
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r15, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r12
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r14
	movq	%r14, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %r14
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$8, %rax
	cmpq	$8, 16(%rsp)            # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %rdx
	movq	%rdx, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r15
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	movq	%r15, %r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r13
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	movq	%r14, %r15
	movq	%r14, %rdx
	leaq	840(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	832(%rsp), %r13
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %r14
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$7, %rax
	cmpq	$7, 16(%rsp)            # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %rdx
	movq	%rdx, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r15
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	movq	%r15, %r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r13
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	movq	%r14, %r15
	movq	%r14, %rdx
	leaq	840(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	832(%rsp), %r13
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %r14
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$6, %rax
	cmpq	$6, 16(%rsp)            # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %rdx
	movq	%rdx, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r15
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	movq	%r15, %r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r13
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	movq	%r14, %r15
	movq	%r14, %rdx
	leaq	840(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	832(%rsp), %r13
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %r14
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$5, %rax
	cmpq	$5, 16(%rsp)            # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %rdx
	movq	%rdx, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r15
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	movq	%r15, %r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r13
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rcx            # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%r15, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	movq	%r14, %r15
	movq	%r14, %rdx
	leaq	840(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	832(%rsp), %r13
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r12, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %r14
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$4, %rax
	cmpq	$4, 16(%rsp)            # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %r12
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	512(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r14
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	leaq	512(%rsp), %r13
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	832(%rsp), %r13
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%r14, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r13
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %r14
	movq	%r14, %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r14d
	movq	%r14, %rbp
	movq	%r14, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	832(%rsp), %r14
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r15
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$3, %rax
	cmpq	$3, 16(%rsp)            # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r13
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	movq	%r15, %r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	leaq	832(%rsp), %r13
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	movq	%r14, %rdx
	leaq	520(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ecx
	movq	%rcx, (%rsp)            # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	movq	%r12, %r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %r12
	movq	%r12, %rdi
	leaq	832(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	movq	%r14, %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%rdi, %r15
	leaq	512(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	512(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addq	$2, %rax
	cmpq	$2, 16(%rsp)            # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r13
	movq	%r13, %rdx
	leaq	520(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	leaq	512(%rsp), %r15
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r14d
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	leaq	832(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %eax
	movq	%rax, (%rsp)            # 8-byte Spill
	movzbl	%r14b, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %r12
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %r15
	movq	%r15, %rdx
	leaq	840(%rsp), %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r14
	leaq	832(%rsp), %rdx
	movq	%rdx, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %r15
	movq	%r15, %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r14, %rdx
	movq	%r14, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %eax
	movq	%rax, %rbp
	movq	%rax, %r14
	movq	%rax, (%rsp)            # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	leaq	512(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	(%rsp), %rax            # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %r13
	movq	%r13, %rdx
	leaq	840(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%r14, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	incq	%rax
	cmpq	$1, 16(%rsp)            # 8-byte Folded Reload
	leaq	24(%rsp), %rcx
	cmovgq	%rax, %rcx
	cmpb	$0, 1392(%rsp)
	cmovneq	%rax, %rcx
	movzbl	(%rcx), %ebp
	movq	%rbp, 16(%rsp)          # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	672(%rsp), %r14
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r12
	leaq	1152(%rsp), %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %rdi
	leaq	360(%rsp), %r15
	movq	%r15, %rdx
	leaq	520(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1192(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %r14
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	16(%rsp), %rax          # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r13
	movq	%r13, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	16(%rsp), %rax          # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	16(%rsp), %rax          # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ecx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r13
	movq	%r12, %rdx
	movq	%r12, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	16(%rsp), %rax          # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rdx
	movq	%r14, %r12
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	16(%rsp), %rax          # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r14d
	movq	%r14, %rbp
	movq	%r14, 16(%rsp)          # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	leaq	32(%rsp), %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	leaq	832(%rsp), %r14
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r12
	movq	%r12, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %r15
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	16(%rsp), %rax          # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	movzbl	(%rax), %ebp
	movq	%rbp, 8(%rsp)           # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r12
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r13, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%r12, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %r15
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rcx           # 8-byte Reload
	shll	$2, %ecx
	movzbl	%cl, %eax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movzbl	%cl, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r14, %r12
	movq	%r15, %rdx
	movq	%r15, %r14
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r15
	movq	%r15, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r13
	movq	%r13, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r12
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r12, %r13
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r15
	movq	%r15, %rdi
	leaq	360(%rsp), %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r14
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	352(%rsp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	movq	%rbp, 8(%rsp)           # 8-byte Spill
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	leaq	840(%rsp), %r15
	movq	%r15, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r13
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	leaq	192(%rsp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r13, %rdx
	movq	%r13, %r15
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	40(%rsp), %r13
	movq	%r13, %rdi
	leaq	360(%rsp), %r14
	movq	%r14, %rdx
	leaq	520(%rsp), %r12
	movq	%r12, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	movq	1400(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	888(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	264(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	760(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1096(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movq	8(%rsp), %rax           # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ebp
	shrq	$7, %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r12, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$19, %esi
	movl	$19, %ecx
	movl	$19, %r9d
	leaq	680(%rsp), %r12
	movq	%r12, %rdi
	leaq	200(%rsp), %rdx
	movq	%rdx, %r13
	leaq	840(%rsp), %r14
	movq	%r14, %r8
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	1400(%rsp)
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	568(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	424(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	120(%rsp), %rax
	pushq	%rax
	.cfi_adjust_cfa_offset 8
	pushq	$19
	.cfi_adjust_cfa_offset 8
	leaq	1256(%rsp), %r15
	pushq	%r15
	.cfi_adjust_cfa_offset 8
	callq	fmonty
	addq	$112, %rsp
	.cfi_adjust_cfa_offset -112
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r14, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%r15, %rdx
	movq	%rbp, %r8
	movl	%ebx, %r9d
	callq	swap_conditional
	movl	$10, %ecx
	movq	1304(%rsp), %rdi        # 8-byte Reload
	movq	%r12, %rsi
	rep;movsq (%rsi), %es:(%rdi)
	movl	$10, %ecx
	movq	1312(%rsp), %rdi        # 8-byte Reload
	movq	%r13, %rsi
	rep;movsq (%rsi), %es:(%rdi)
	addq	$1320, %rsp             # imm = 0x528
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end6:
	.size	cmult, .Lfunc_end6-cmult
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function crecip
	.type	crecip,@function
crecip:                                 # @crecip
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$840, %rsp              # imm = 0x348
	.cfi_def_cfa_offset 896
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r8d, %ebp
	movq	%rcx, %r15
	movq	%rdx, %r13
	movq	%rsi, 24(%rsp)          # 8-byte Spill
	movq	%rdi, 16(%rsp)          # 8-byte Spill
	movl	%r8d, %eax
	andl	$1, %eax
	movb	%al, 15(%rsp)
	leaq	112(%rsp), %rbx
	movl	$10, %esi
	movq	%rbx, %rdi
	callq	fsquare
	leaq	192(%rsp), %r12
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	leaq	272(%rsp), %rbx
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	%ebp, (%rsp)
	leaq	752(%rsp), %r14
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movq	%r13, %r8
	movq	%r15, %r9
	callq	fmul
	movl	%ebp, (%rsp)
	leaq	32(%rsp), %r15
	movl	$10, %esi
	movl	$10, %ecx
	movl	$10, %r9d
	movq	%r15, %rdi
	leaq	112(%rsp), %r8
	movq	%r14, %rdx
	callq	fmul
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r15, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	%ebp, (%rsp)
	leaq	672(%rsp), %r13
	movl	$10, %esi
	movl	$10, %ecx
	movl	$10, %r9d
	movq	%r13, %rdi
	movq	%r14, %r8
	movq	%rbx, %rdx
	callq	fmul
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r13, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	%ebp, (%rsp)
	leaq	592(%rsp), %r15
	movl	$10, %esi
	movl	$10, %ecx
	movl	$10, %r9d
	movq	%r15, %rdi
	movq	%r13, %r8
	movq	%rbx, %rdx
	callq	fmul
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r15, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	%ebp, (%rsp)
	leaq	512(%rsp), %r14
	movl	$10, %esi
	movl	$10, %ecx
	movl	$10, %r9d
	movq	%r14, %rdi
	movq	%r12, %rdx
	movq	%r15, %r8
	callq	fmul
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r14, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	%ebp, (%rsp)
	movl	$10, %esi
	movl	$10, %ecx
	movl	$10, %r9d
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movq	%r14, %r8
	callq	fmul
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	%ebp, (%rsp)
	leaq	432(%rsp), %r14
	movl	$10, %esi
	movl	$10, %ecx
	movl	$10, %r9d
	movq	%r14, %rdi
	movq	%r15, %r8
	movq	%rbx, %rdx
	callq	fmul
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r14, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	%ebp, (%rsp)
	leaq	352(%rsp), %r15
	movl	$10, %esi
	movl	$10, %ecx
	movl	$10, %r9d
	movq	%r15, %rdi
	movq	%r12, %rdx
	movq	%r14, %r8
	callq	fmul
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%r15, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	%ebp, (%rsp)
	movl	$10, %esi
	movl	$10, %ecx
	movl	$10, %r9d
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movq	%r15, %r8
	callq	fmul
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	%ebp, (%rsp)
	movl	$10, %esi
	movl	$10, %ecx
	movl	$10, %r9d
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movq	%r14, %r8
	callq	fmul
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	$10, %esi
	movl	$10, %ecx
	movq	%r12, %rdi
	movq	%rbx, %rdx
	movl	%ebp, %r8d
	callq	fsquare
	movl	%ebp, (%rsp)
	movl	$10, %ecx
	movl	$10, %r9d
	movq	16(%rsp), %rdi          # 8-byte Reload
	movq	24(%rsp), %rsi          # 8-byte Reload
	movq	%r12, %rdx
	leaq	32(%rsp), %r8
	callq	fmul
	addq	$840, %rsp              # imm = 0x348
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end7:
	.size	crecip, .Lfunc_end7-crecip
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fmul
	.type	fmul,@function
fmul:                                   # @fmul
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$176, %rsp
	.cfi_def_cfa_offset 208
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movl	208(%rsp), %ebp
	movl	%ebp, (%rsp)
	leaq	16(%rsp), %rbx
	movl	$19, %esi
	movq	%rbx, %rdi
	callq	fproduct
	movl	$19, %esi
	movq	%rbx, %rdi
	movl	%ebp, %edx
	callq	freduce_degree
	movl	$19, %esi
	movq	%rbx, %rdi
	movl	%ebp, %edx
	callq	freduce_coefficients
	movl	$10, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	rep;movsq (%rsi), %es:(%rdi)
	addq	$176, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end8:
	.size	fmul, .Lfunc_end8-fmul
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fcontract
	.type	fcontract,@function
fcontract:                              # @fcontract
	.cfi_startproc
# %bb.0:                                # %.preheader6
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r8d, 108(%rsp)         # 4-byte Spill
	movq	%rcx, %r12
	movq	%rsi, 120(%rsp)         # 8-byte Spill
	movq	%rdi, 112(%rsp)         # 8-byte Spill
	movl	%r8d, %eax
	andb	$1, %al
	movb	%al, 15(%rsp)
	movl	16(%rsp), %ebx
	leaq	8(%rdx), %rcx
	cmpq	$1, %r12
	leaq	128(%rsp), %rdi
	movq	%rdi, %rsi
	movq	%rdi, %rbp
	cmovgq	%rcx, %rsi
	testb	%al, %al
	cmovnel	(%rdx), %ebx
	movl	%ebx, 64(%rsp)          # 4-byte Spill
	movl	%ebx, 16(%rsp)
	cmovneq	%rcx, %rsi
	leaq	20(%rsp), %rcx
	cmovneq	%rsi, %rcx
	movl	(%rcx), %ecx
	movl	%ebx, %r15d
	sarl	$31, %r15d
	andl	%ebx, %r15d
	movl	%r15d, 88(%rsp)         # 4-byte Spill
	sarl	$26, %r15d
	addl	%ecx, %r15d
	testb	%al, %al
	cmovel	%ecx, %r15d
	leaq	16(%rdx), %rsi
	cmpq	$2, %r12
	cmovgq	%rsi, %rdi
	testb	%al, %al
	movl	%ecx, 20(%rsp)
	cmovneq	%rsi, %rdi
	leaq	24(%rsp), %rcx
	cmovneq	%rdi, %rcx
	movl	(%rcx), %ecx
	movl	%r15d, %r9d
	sarl	$31, %r9d
	andl	%r15d, %r9d
	movl	%r9d, 84(%rsp)          # 4-byte Spill
	sarl	$25, %r9d
	addl	%ecx, %r9d
	testb	%al, %al
	cmovel	%ecx, %r9d
	leaq	24(%rdx), %rsi
	cmpq	$3, %r12
	movq	%rbp, %rdi
	cmovgq	%rsi, %rdi
	testb	%al, %al
	movl	%ecx, 24(%rsp)
	cmovneq	%rsi, %rdi
	leaq	28(%rsp), %rcx
	cmovneq	%rdi, %rcx
	movl	(%rcx), %ecx
	movl	%r9d, %r14d
	sarl	$31, %r14d
	andl	%r9d, %r14d
	movl	%r14d, 80(%rsp)         # 4-byte Spill
	sarl	$26, %r14d
	addl	%ecx, %r14d
	testb	%al, %al
	cmovel	%ecx, %r14d
	movl	%ecx, 28(%rsp)
	leaq	32(%rdx), %rcx
	cmpq	$4, %r12
	movq	%rbp, %rsi
	cmovgq	%rcx, %rsi
	testb	%al, %al
	cmovneq	%rcx, %rsi
	leaq	32(%rsp), %rcx
	cmovneq	%rsi, %rcx
	movl	(%rcx), %ecx
	movl	%r14d, %r13d
	sarl	$31, %r13d
	andl	%r14d, %r13d
	movl	%r13d, 76(%rsp)         # 4-byte Spill
	sarl	$25, %r13d
	addl	%ecx, %r13d
	testb	%al, %al
	cmovel	%ecx, %r13d
	movl	%ecx, 32(%rsp)
	cmpq	$5, %r12
	leaq	40(%rdx), %rcx
	movq	%rbp, %rsi
	cmovgq	%rcx, %rsi
	testb	%al, %al
	cmovneq	%rcx, %rsi
	leaq	36(%rsp), %rcx
	cmovneq	%rsi, %rcx
	movl	(%rcx), %ecx
	movl	%r13d, %r11d
	sarl	$31, %r11d
	andl	%r13d, %r11d
	movl	%r11d, 72(%rsp)         # 4-byte Spill
	sarl	$26, %r11d
	addl	%ecx, %r11d
	testb	%al, %al
	cmovel	%ecx, %r11d
	movl	%ecx, 36(%rsp)
	cmpq	$6, %r12
	leaq	48(%rdx), %rcx
	movq	%rbp, %rsi
	movq	%rbp, %rdi
	cmovgq	%rcx, %rsi
	testb	%al, %al
	cmovneq	%rcx, %rsi
	leaq	40(%rsp), %rcx
	cmovneq	%rsi, %rcx
	movl	(%rcx), %ecx
	movl	%r11d, %ebp
	sarl	$31, %ebp
	andl	%r11d, %ebp
	movl	%ebp, 68(%rsp)          # 4-byte Spill
	sarl	$25, %ebp
	addl	%ecx, %ebp
	testb	%al, %al
	cmovel	%ecx, %ebp
	movl	%ecx, 40(%rsp)
	cmpq	$7, %r12
	leaq	56(%rdx), %rcx
	movq	%rdi, %rsi
	cmovgq	%rcx, %rsi
	testb	%al, %al
	cmovneq	%rcx, %rsi
	leaq	44(%rsp), %rcx
	cmovneq	%rsi, %rcx
	movl	(%rcx), %ecx
	movl	%ebp, %esi
	sarl	$31, %esi
	andl	%ebp, %esi
	movl	%esi, 104(%rsp)         # 4-byte Spill
	sarl	$26, %esi
	addl	%ecx, %esi
	testb	%al, %al
	cmovel	%ecx, %esi
	movl	%ecx, 44(%rsp)
	cmpq	$8, %r12
	leaq	64(%rdx), %r10
	movq	%rdi, %rcx
	cmovgq	%r10, %rcx
	testb	%al, %al
	cmovneq	%r10, %rcx
	leaq	48(%rsp), %rbx
	cmovneq	%rcx, %rbx
	movl	(%rbx), %ebx
	movl	%esi, %ecx
	sarl	$31, %ecx
	andl	%esi, %ecx
	movl	%ecx, 100(%rsp)         # 4-byte Spill
	sarl	$25, %ecx
	addl	%ebx, %ecx
	testb	%al, %al
	cmovel	%ebx, %ecx
	addq	$72, %rdx
	cmpq	$9, %r12
	movl	%ebx, 48(%rsp)
	movq	%rdi, %rbx
	cmovgq	%rdx, %rbx
	testb	%al, %al
	cmovneq	%rdx, %rbx
	leaq	52(%rsp), %rdx
	cmovneq	%rbx, %rdx
	movl	(%rdx), %edx
	movl	%ecx, %r8d
	sarl	$31, %r8d
	andl	%ecx, %r8d
	movl	%r8d, %r12d
	sarl	$26, %r12d
	addl	%edx, %r12d
	testb	%al, %al
	cmovel	%edx, %r12d
	movl	88(%rsp), %ebx          # 4-byte Reload
	andl	$-67108864, %ebx        # imm = 0xFC000000
	movl	64(%rsp), %edi          # 4-byte Reload
	movl	%edi, %edx
	subl	%ebx, %edx
	testb	%al, %al
	cmovel	%edi, %edx
	movl	%r12d, %edi
	sarl	$31, %edi
	andl	%r12d, %edi
	movl	%edi, 96(%rsp)          # 4-byte Spill
	movl	%edi, %ebx
	sarl	$25, %ebx
	leal	(%rbx,%rbx,8), %edi
	leal	(%rbx,%rdi,2), %ebx
	addl	%edx, %ebx
	testb	%al, %al
	cmovel	%edx, %ebx
	movl	84(%rsp), %edx          # 4-byte Reload
	andl	$-33554432, %edx        # imm = 0xFE000000
	movl	%r15d, %edi
	subl	%edx, %edi
	testb	%al, %al
	cmovel	%r15d, %edi
	movl	%ebx, %r10d
	sarl	$31, %r10d
	andl	%ebx, %r10d
	movl	%ebx, %r15d
	movl	%r10d, %edx
	sarl	$26, %edx
	addl	%edi, %edx
	testb	%al, %al
	cmovel	%edi, %edx
	movl	80(%rsp), %ebx          # 4-byte Reload
	andl	$-67108864, %ebx        # imm = 0xFC000000
	movl	%r9d, %edi
	subl	%ebx, %edi
	testb	%al, %al
	cmovel	%r9d, %edi
	movl	%edx, %r9d
	sarl	$31, %r9d
	andl	%edx, %r9d
	movl	%r9d, 92(%rsp)          # 4-byte Spill
	sarl	$25, %r9d
	addl	%edi, %r9d
	testb	%al, %al
	cmovel	%edi, %r9d
	movl	76(%rsp), %ebx          # 4-byte Reload
	andl	$-33554432, %ebx        # imm = 0xFE000000
	movl	%r14d, %edi
	subl	%ebx, %edi
	testb	%al, %al
	cmovel	%r14d, %edi
	movl	%r9d, %r14d
	sarl	$31, %r14d
	andl	%r9d, %r14d
	movl	%r14d, 64(%rsp)         # 4-byte Spill
	sarl	$26, %r14d
	addl	%edi, %r14d
	testb	%al, %al
	cmovel	%edi, %r14d
	movl	72(%rsp), %ebx          # 4-byte Reload
	andl	$-67108864, %ebx        # imm = 0xFC000000
	movl	%r13d, %edi
	subl	%ebx, %edi
	testb	%al, %al
	cmovel	%r13d, %edi
	movl	%r14d, %ebx
	sarl	$31, %ebx
	andl	%r14d, %ebx
	movl	%ebx, 88(%rsp)          # 4-byte Spill
	sarl	$25, %ebx
	addl	%edi, %ebx
	testb	%al, %al
	cmovel	%edi, %ebx
	movl	68(%rsp), %edi          # 4-byte Reload
	andl	$-33554432, %edi        # imm = 0xFE000000
	movl	%r11d, %r13d
	subl	%edi, %r13d
	testb	%al, %al
	cmovel	%r11d, %r13d
	movl	%ebx, %edi
	sarl	$31, %edi
	andl	%ebx, %edi
	movl	%edi, 84(%rsp)          # 4-byte Spill
	sarl	$26, %edi
	addl	%r13d, %edi
	testb	%al, %al
	cmovel	%r13d, %edi
	movl	104(%rsp), %r13d        # 4-byte Reload
	andl	$-67108864, %r13d       # imm = 0xFC000000
	movl	%ebp, %r11d
	subl	%r13d, %r11d
	testb	%al, %al
	cmovel	%ebp, %r11d
	movl	%edi, %r13d
	sarl	$31, %r13d
	andl	%edi, %r13d
	movl	%r13d, 80(%rsp)         # 4-byte Spill
	sarl	$25, %r13d
	addl	%r11d, %r13d
	testb	%al, %al
	cmovel	%r11d, %r13d
	movl	100(%rsp), %r11d        # 4-byte Reload
	andl	$-33554432, %r11d       # imm = 0xFE000000
	movl	%esi, %ebp
	subl	%r11d, %ebp
	testb	%al, %al
	cmovel	%esi, %ebp
	movl	%r13d, %esi
	sarl	$31, %esi
	andl	%r13d, %esi
	movl	%esi, 76(%rsp)          # 4-byte Spill
	sarl	$26, %esi
	addl	%ebp, %esi
	testb	%al, %al
	cmovel	%ebp, %esi
	andl	$-67108864, %r8d        # imm = 0xFC000000
	movl	%ecx, %r11d
	subl	%r8d, %r11d
	testb	%al, %al
	cmovel	%ecx, %r11d
	movl	%esi, %ecx
	sarl	$31, %ecx
	andl	%esi, %ecx
	movl	%ecx, 72(%rsp)          # 4-byte Spill
	sarl	$25, %ecx
	addl	%r11d, %ecx
	testb	%al, %al
	cmovel	%r11d, %ecx
	movl	96(%rsp), %ebp          # 4-byte Reload
	andl	$-33554432, %ebp        # imm = 0xFE000000
	movl	%r12d, %r8d
	subl	%ebp, %r8d
	testb	%al, %al
	cmovel	%r12d, %r8d
	movl	%ecx, %ebp
	sarl	$31, %ebp
	andl	%ecx, %ebp
	movl	%ebp, 68(%rsp)          # 4-byte Spill
	sarl	$26, %ebp
	addl	%r8d, %ebp
	testb	%al, %al
	cmovel	%r8d, %ebp
	andl	$-67108864, %r10d       # imm = 0xFC000000
	movl	%r15d, %r8d
	subl	%r10d, %r8d
	testb	%al, %al
	cmovel	%r15d, %r8d
	movl	%ebp, %r11d
	sarl	$31, %r11d
	andl	%ebp, %r11d
	movl	%r11d, %r12d
	sarl	$25, %r12d
	leal	(%r12,%r12,8), %r15d
	leal	(%r12,%r15,2), %r15d
	addl	%r8d, %r15d
	testb	%al, %al
	cmovel	%r8d, %r15d
	movl	92(%rsp), %r10d         # 4-byte Reload
	andl	$-33554432, %r10d       # imm = 0xFE000000
	movl	%edx, %r8d
	subl	%r10d, %r8d
	testb	%al, %al
	cmovel	%edx, %r8d
	movl	%r15d, %edx
	sarl	$31, %edx
	andl	%r15d, %edx
	movl	%edx, %r12d
	sarl	$26, %r12d
	addl	%r8d, %r12d
	testb	%al, %al
	cmovel	%r8d, %r12d
	andl	$-67108864, %edx        # imm = 0xFC000000
	movl	%r15d, %r10d
	subl	%edx, %r10d
	testb	%al, %al
	cmovel	%r15d, %r10d
	movl	%r10d, %r8d
	sarl	$26, %r8d
	addl	%r12d, %r8d
	testb	%al, %al
	cmovel	%r12d, %r8d
	movl	64(%rsp), %r15d         # 4-byte Reload
	andl	$-67108864, %r15d       # imm = 0xFC000000
	movl	%r9d, %edx
	subl	%r15d, %edx
	testb	%al, %al
	cmovel	%r9d, %edx
	movl	%r8d, %r15d
	sarl	$25, %r15d
	addl	%edx, %r15d
	testb	%al, %al
	cmovel	%edx, %r15d
	movl	88(%rsp), %r9d          # 4-byte Reload
	andl	$-33554432, %r9d        # imm = 0xFE000000
	movl	%r14d, %edx
	subl	%r9d, %edx
	testb	%al, %al
	cmovel	%r14d, %edx
	movl	%r15d, %r9d
	sarl	$26, %r9d
	addl	%edx, %r9d
	testb	%al, %al
	cmovel	%edx, %r9d
	movl	84(%rsp), %edx          # 4-byte Reload
	andl	$-67108864, %edx        # imm = 0xFC000000
	movl	%ebx, %r12d
	subl	%edx, %r12d
	testb	%al, %al
	cmovel	%ebx, %r12d
	movl	%r9d, %r14d
	sarl	$25, %r14d
	addl	%r12d, %r14d
	testb	%al, %al
	cmovel	%r12d, %r14d
	movl	80(%rsp), %edx          # 4-byte Reload
	andl	$-33554432, %edx        # imm = 0xFE000000
	movl	%edi, %r12d
	subl	%edx, %r12d
	testb	%al, %al
	cmovel	%edi, %r12d
	movl	%r14d, %ebx
	sarl	$26, %ebx
	addl	%r12d, %ebx
	testb	%al, %al
	cmovel	%r12d, %ebx
	movl	76(%rsp), %edx          # 4-byte Reload
	andl	$-67108864, %edx        # imm = 0xFC000000
	movl	%r13d, %edi
	subl	%edx, %edi
	testb	%al, %al
	cmovel	%r13d, %edi
	movl	%ebx, %r13d
	sarl	$25, %r13d
	addl	%edi, %r13d
	testb	%al, %al
	cmovel	%edi, %r13d
	movl	72(%rsp), %edx          # 4-byte Reload
	andl	$-33554432, %edx        # imm = 0xFE000000
	movl	%esi, %edi
	subl	%edx, %edi
	testb	%al, %al
	cmovel	%esi, %edi
	movl	%r13d, %r12d
	sarl	$26, %r12d
	addl	%edi, %r12d
	testb	%al, %al
	cmovel	%edi, %r12d
	movl	68(%rsp), %edx          # 4-byte Reload
	andl	$-67108864, %edx        # imm = 0xFC000000
	movl	%ecx, %edi
	subl	%edx, %edi
	testb	%al, %al
	cmovel	%ecx, %edi
	movl	%r12d, %esi
	sarl	$25, %esi
	addl	%edi, %esi
	testb	%al, %al
	cmovel	%edi, %esi
	andl	$-33554432, %r11d       # imm = 0xFE000000
	movl	%ebp, %ecx
	subl	%r11d, %ecx
	testb	%al, %al
	cmovel	%ebp, %ecx
	movl	%esi, %edi
	sarl	$26, %edi
	addl	%ecx, %edi
	testb	%al, %al
	cmovel	%ecx, %edi
	movl	%r10d, %ecx
	andl	$67108863, %ecx         # imm = 0x3FFFFFF
	testb	%al, %al
	cmovel	%r10d, %ecx
	movl	%edi, %ebp
	sarl	$25, %ebp
	leal	(%rbp,%rbp,8), %edx
	leal	(%rbp,%rdx,2), %r10d
	addl	%ecx, %r10d
	testb	%al, %al
	cmovel	%ecx, %r10d
	movl	%r8d, %ecx
	andl	$33554431, %ecx         # imm = 0x1FFFFFF
	testb	%al, %al
	cmovel	%r8d, %ecx
	movl	%r10d, %r8d
	sarl	$26, %r8d
	addl	%ecx, %r8d
	testb	%al, %al
	cmovel	%ecx, %r8d
	movl	%r8d, 64(%rsp)          # 4-byte Spill
	movl	%r15d, %ecx
	andl	$67108863, %ecx         # imm = 0x3FFFFFF
	testb	%al, %al
	cmovel	%r15d, %ecx
	sarl	$25, %r8d
	addl	%ecx, %r8d
	testb	%al, %al
	cmovel	%ecx, %r8d
	movl	%r9d, %ecx
	andl	$33554431, %ecx         # imm = 0x1FFFFFF
	testb	%al, %al
	cmovel	%r9d, %ecx
	movl	%r8d, %r11d
	sarl	$26, %r11d
	addl	%ecx, %r11d
	testb	%al, %al
	cmovel	%ecx, %r11d
	movl	%r14d, %ecx
	andl	$67108863, %ecx         # imm = 0x3FFFFFF
	testb	%al, %al
	cmovel	%r14d, %ecx
	movl	%r11d, %r14d
	sarl	$25, %r14d
	addl	%ecx, %r14d
	testb	%al, %al
	cmovel	%ecx, %r14d
	movl	%ebx, %ecx
	andl	$33554431, %ecx         # imm = 0x1FFFFFF
	testb	%al, %al
	cmovel	%ebx, %ecx
	movl	%r14d, %r15d
	sarl	$26, %r15d
	addl	%ecx, %r15d
	testb	%al, %al
	cmovel	%ecx, %r15d
	movl	%r13d, %edx
	andl	$67108863, %edx         # imm = 0x3FFFFFF
	testb	%al, %al
	cmovel	%r13d, %edx
	movl	%r15d, %r9d
	sarl	$25, %r9d
	addl	%edx, %r9d
	testb	%al, %al
	cmovel	%edx, %r9d
	movl	%r12d, %ebp
	andl	$33554431, %ebp         # imm = 0x1FFFFFF
	testb	%al, %al
	cmovel	%r12d, %ebp
	movl	%r9d, %ecx
	sarl	$26, %ecx
	addl	%ebp, %ecx
	testb	%al, %al
	cmovel	%ebp, %ecx
	movl	%esi, %ebp
	andl	$67108863, %ebp         # imm = 0x3FFFFFF
	testb	%al, %al
	cmovel	%esi, %ebp
	movl	%ecx, %edx
	sarl	$25, %edx
	addl	%ebp, %edx
	testb	%al, %al
	cmovel	%ebp, %edx
	movl	%edi, %esi
	andl	$33554431, %esi         # imm = 0x1FFFFFF
	testb	%al, %al
	cmovel	%edi, %esi
	movl	%edx, %ebx
	sarl	$26, %ebx
	addl	%esi, %ebx
	testb	%al, %al
	cmovel	%esi, %ebx
	movl	%r10d, %esi
	andl	$67108863, %esi         # imm = 0x3FFFFFF
	testb	%al, %al
	cmovel	%r10d, %esi
	movl	%ebx, %edi
	sarl	$25, %edi
	leal	(%rdi,%rdi,8), %ebp
	leal	(%rdi,%rbp,2), %edi
	addl	%esi, %edi
	testb	%al, %al
	cmovel	%esi, %edi
	movl	%ebx, %r10d
	andl	$33554431, %r10d        # imm = 0x1FFFFFF
	testb	%al, %al
	cmovel	%ebx, %r10d
	movl	%edx, %r12d
	andl	$67108863, %r12d        # imm = 0x3FFFFFF
	testb	%al, %al
	cmovel	%edx, %r12d
	movl	%ecx, %r13d
	andl	$33554431, %r13d        # imm = 0x1FFFFFF
	testb	%al, %al
	cmovel	%ecx, %r13d
	movl	%r9d, %edx
	andl	$67108863, %edx         # imm = 0x3FFFFFF
	testb	%al, %al
	cmovel	%r9d, %edx
	movl	%r15d, %r9d
	andl	$33554431, %r9d         # imm = 0x1FFFFFF
	testb	%al, %al
	cmovel	%r15d, %r9d
	movl	%r14d, %esi
	andl	$67108863, %esi         # imm = 0x3FFFFFF
	testb	%al, %al
	cmovel	%r14d, %esi
	movl	%r11d, %ebp
	andl	$33554431, %ebp         # imm = 0x1FFFFFF
	testb	%al, %al
	cmovel	%r11d, %ebp
	movl	%r8d, %ebx
	andl	$67108863, %ebx         # imm = 0x3FFFFFF
	testb	%al, %al
	cmovel	%r8d, %ebx
	movl	64(%rsp), %r8d          # 4-byte Reload
	movl	%r8d, %ecx
	andl	$33554431, %ecx         # imm = 0x1FFFFFF
	testb	%al, %al
	cmovel	%r8d, %ecx
	movl	%ecx, 20(%rsp)
	movl	%ebx, 24(%rsp)
	movl	%ebp, 28(%rsp)
	movl	%esi, 32(%rsp)
	movl	%r9d, 36(%rsp)
	movl	%edx, 40(%rsp)
	movl	%r13d, 44(%rsp)
	movl	%r12d, 48(%rsp)
	movl	%r10d, 52(%rsp)
	movl	%edi, 16(%rsp)
	movl	$67108845, %esi         # imm = 0x3FFFFED
	movl	108(%rsp), %r14d        # 4-byte Reload
	movl	%r14d, %edx
	callq	s32_gte
	movl	%eax, %r12d
	movl	20(%rsp), %edi
	movl	$33554431, %esi         # imm = 0x1FFFFFF
	movl	%r14d, %edx
	callq	s32_eq
	movl	%eax, %ebp
	movl	24(%rsp), %edi
	movl	$67108863, %esi         # imm = 0x3FFFFFF
	movl	%r14d, %edx
	callq	s32_eq
	movl	%eax, %ebx
	andl	%ebp, %ebx
	movl	28(%rsp), %edi
	movl	$33554431, %esi         # imm = 0x1FFFFFF
	movl	%r14d, %edx
	callq	s32_eq
	movl	%eax, %ebp
	andl	%ebx, %ebp
	movl	32(%rsp), %edi
	movl	$67108863, %esi         # imm = 0x3FFFFFF
	movl	%r14d, %edx
	callq	s32_eq
	movl	%eax, %ebx
	andl	%ebp, %ebx
	movl	36(%rsp), %edi
	movl	$33554431, %esi         # imm = 0x1FFFFFF
	movl	%r14d, %edx
	callq	s32_eq
	movl	%eax, %ebp
	andl	%ebx, %ebp
	movl	40(%rsp), %edi
	movl	$67108863, %esi         # imm = 0x3FFFFFF
	movl	%r14d, %edx
	callq	s32_eq
	movl	%eax, %ebx
	andl	%ebp, %ebx
	movl	44(%rsp), %edi
	movl	$33554431, %esi         # imm = 0x1FFFFFF
	movl	%r14d, %edx
	callq	s32_eq
	movl	%eax, %ebp
	andl	%ebx, %ebp
	movl	48(%rsp), %edi
	movl	$67108863, %esi         # imm = 0x3FFFFFF
	movl	%r14d, %edx
	callq	s32_eq
	movl	%eax, %ebx
	andl	%ebp, %ebx
	movl	52(%rsp), %edi
	movl	$33554431, %esi         # imm = 0x1FFFFFF
	movl	%r14d, %edx
	callq	s32_eq
	andl	%ebx, %eax
	andl	%r12d, %eax
	movl	%eax, %ecx
	andl	$67108845, %ecx         # imm = 0x3FFFFED
	movl	16(%rsp), %r11d
	subl	%ecx, %r11d
	movl	20(%rsp), %r9d
	movl	%eax, %esi
	andl	$33554431, %esi         # imm = 0x1FFFFFF
	subl	%esi, %r9d
	andl	$67108863, %eax         # imm = 0x3FFFFFF
	movl	24(%rsp), %r10d
	subl	%eax, %r10d
	movl	28(%rsp), %r15d
	subl	%esi, %r15d
	movl	32(%rsp), %r13d
	subl	%eax, %r13d
	movl	36(%rsp), %r14d
	subl	%esi, %r14d
	movl	40(%rsp), %r12d
	subl	%eax, %r12d
	movl	44(%rsp), %r8d
	subl	%esi, %r8d
	movl	48(%rsp), %ecx
	subl	%eax, %ecx
	movl	52(%rsp), %ebp
	subl	%esi, %ebp
	movb	15(%rsp), %dl
	testb	%dl, %dl
	cmovel	20(%rsp), %r9d
	cmovel	24(%rsp), %r10d
	cmovel	28(%rsp), %r15d
	cmovel	32(%rsp), %r13d
	cmovel	40(%rsp), %r12d
	cmovel	44(%rsp), %r8d
	cmovel	48(%rsp), %ecx
	cmovel	52(%rsp), %ebp
	movl	%r15d, %esi
	shll	$5, %esi
	movl	%r13d, %edi
	shll	$6, %edi
	movl	%ecx, %ebx
	shll	$4, %ebx
	movl	%ebp, %eax
	shll	$6, %eax
	testb	%dl, %dl
	cmovel	16(%rsp), %r11d
	movl	%r11d, 16(%rsp)
	cmovel	36(%rsp), %r14d
	movl	%r14d, 36(%rsp)
	leal	(,%r9,4), %edx
	cmovel	%r9d, %edx
	movl	%edx, 20(%rsp)
	leal	(,%r10,8), %edx
	cmovel	%r10d, %edx
	movl	%edx, 24(%rsp)
	cmovel	%r15d, %esi
	movl	%esi, 28(%rsp)
	cmovel	%r13d, %edi
	movl	%edi, 32(%rsp)
	leal	(%r12,%r12), %edx
	cmovel	%r12d, %edx
	movl	%edx, 40(%rsp)
	leal	(,%r8,8), %edx
	cmovel	%r8d, %edx
	movl	%edx, 44(%rsp)
	cmovel	%ecx, %ebx
	movl	%ebx, 48(%rsp)
	cmovel	%ebp, %eax
	movl	%eax, 52(%rsp)
	movq	112(%rsp), %rbx         # 8-byte Reload
	movzbl	(%rbx), %eax
	movl	$0, %edi
	cmovnel	%edi, %eax
	movb	%al, (%rbx)
	leaq	16(%rbx), %r9
	movq	120(%rsp), %rcx         # 8-byte Reload
	cmpq	$16, %rcx
	leaq	128(%rsp), %r8
	movq	%r8, %rax
	cmovgq	%r9, %rax
	cmpb	$0, 15(%rsp)
	movq	%rax, %rdx
	cmovneq	%r9, %rdx
	movzbl	16(%rbx), %esi
	cmovnel	%edi, %esi
	movb	%sil, (%rdx)
	movzbl	(%rbx), %edx
	movl	16(%rsp), %esi
	orl	%edx, %esi
	cmpb	$0, 15(%rsp)
	cmovel	%edx, %esi
	movb	%sil, (%rbx)
	leaq	1(%rbx), %rdx
	cmpq	$1, %rcx
	movq	%r8, %rsi
	cmovgq	%rdx, %rsi
	cmpb	$0, 15(%rsp)
	cmovneq	%rdx, %rsi
	movzbl	1(%rbx), %edx
	movzbl	17(%rsp), %edi
	cmovel	%edx, %edi
	movb	%dil, (%rsi)
	leaq	18(%rsp), %rdx
	leaq	2(%rbx), %rsi
	cmpq	$2, %rcx
	movq	%r8, %rdi
	cmovgq	%rsi, %rdi
	cmpb	$0, 15(%rsp)
	cmovneq	%rsi, %rdi
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movb	%dl, (%rdi)
	leaq	19(%rsp), %rdx
	leaq	3(%rbx), %rsi
	cmpq	$3, %rcx
	movq	%r8, %rbp
	cmovgq	%rsi, %rbp
	cmpb	$0, 15(%rsp)
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movq	%rbp, %rdi
	cmovneq	%rsi, %rdi
	movb	%dl, (%rdi)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%rsi, %rbp
	movzbl	(%rbp), %esi
	orl	20(%rsp), %esi
	testb	%dl, %dl
	movzbl	3(%rbx), %edx
	cmovnel	%esi, %edx
	movb	%dl, (%rbp)
	leaq	21(%rsp), %rdx
	leaq	4(%rbx), %rsi
	cmpq	$4, %rcx
	movq	%r8, %rdi
	cmovgq	%rsi, %rdi
	cmpb	$0, 15(%rsp)
	cmovneq	%rsi, %rdi
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movb	%dl, (%rdi)
	leaq	22(%rsp), %rdx
	leaq	5(%rbx), %rsi
	cmpq	$5, %rcx
	movq	%r8, %rdi
	cmovgq	%rsi, %rdi
	cmpb	$0, 15(%rsp)
	cmovneq	%rsi, %rdi
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movb	%dl, (%rdi)
	leaq	23(%rsp), %rdx
	leaq	6(%rbx), %rsi
	cmpq	$6, %rcx
	movq	%r8, %rbp
	cmovgq	%rsi, %rbp
	cmpb	$0, 15(%rsp)
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movq	%rbp, %rdi
	cmovneq	%rsi, %rdi
	movb	%dl, (%rdi)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%rsi, %rbp
	movzbl	(%rbp), %esi
	orl	24(%rsp), %esi
	testb	%dl, %dl
	movzbl	6(%rbx), %edx
	cmovnel	%esi, %edx
	movb	%dl, (%rbp)
	leaq	25(%rsp), %rdx
	leaq	7(%rbx), %rsi
	cmpq	$7, %rcx
	movq	%r8, %rdi
	cmovgq	%rsi, %rdi
	cmpb	$0, 15(%rsp)
	cmovneq	%rsi, %rdi
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movb	%dl, (%rdi)
	leaq	26(%rsp), %rdx
	leaq	8(%rbx), %rsi
	cmpq	$8, %rcx
	movq	%r8, %rdi
	cmovgq	%rsi, %rdi
	cmpb	$0, 15(%rsp)
	cmovneq	%rsi, %rdi
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movb	%dl, (%rdi)
	leaq	27(%rsp), %rdx
	leaq	9(%rbx), %rsi
	cmpq	$9, %rcx
	movq	%r8, %rbp
	cmovgq	%rsi, %rbp
	cmpb	$0, 15(%rsp)
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movq	%rbp, %rdi
	cmovneq	%rsi, %rdi
	movb	%dl, (%rdi)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%rsi, %rbp
	movzbl	(%rbp), %esi
	orl	28(%rsp), %esi
	testb	%dl, %dl
	movzbl	9(%rbx), %edx
	cmovnel	%esi, %edx
	movb	%dl, (%rbp)
	leaq	29(%rsp), %rdx
	leaq	10(%rbx), %rsi
	cmpq	$10, %rcx
	movq	%r8, %rdi
	cmovgq	%rsi, %rdi
	cmpb	$0, 15(%rsp)
	cmovneq	%rsi, %rdi
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movb	%dl, (%rdi)
	leaq	30(%rsp), %rdx
	leaq	11(%rbx), %rsi
	cmpq	$11, %rcx
	movq	%r8, %rdi
	cmovgq	%rsi, %rdi
	cmpb	$0, 15(%rsp)
	cmovneq	%rsi, %rdi
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movb	%dl, (%rdi)
	leaq	31(%rsp), %rdx
	leaq	12(%rbx), %rsi
	cmpq	$12, %rcx
	movq	%r8, %rbp
	cmovgq	%rsi, %rbp
	cmpb	$0, 15(%rsp)
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movq	%rbp, %rdi
	cmovneq	%rsi, %rdi
	movb	%dl, (%rdi)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%rsi, %rbp
	movzbl	(%rbp), %esi
	orl	32(%rsp), %esi
	testb	%dl, %dl
	movzbl	12(%rbx), %edx
	cmovnel	%esi, %edx
	movb	%dl, (%rbp)
	leaq	33(%rsp), %rdx
	leaq	13(%rbx), %rsi
	movq	%rcx, %rbp
	cmpq	$13, %rcx
	movq	%r8, %rdi
	cmovgq	%rsi, %rdi
	cmpb	$0, 15(%rsp)
	cmovneq	%rsi, %rdi
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movb	%dl, (%rdi)
	leaq	34(%rsp), %rdx
	leaq	14(%rbx), %rsi
	cmpq	$14, %rcx
	movq	%r8, %rdi
	cmovgq	%rsi, %rdi
	cmpb	$0, 15(%rsp)
	cmovneq	%rsi, %rdi
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movb	%dl, (%rdi)
	leaq	35(%rsp), %rdx
	leaq	15(%rbx), %rsi
	cmpq	$15, %rcx
	movq	%r8, %rdi
	cmovgq	%rsi, %rdi
	cmpb	$0, 15(%rsp)
	cmovneq	%rsi, %rdi
	cmoveq	%rsi, %rdx
	movb	(%rdx), %dl
	movb	%dl, (%rdi)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%r9, %rax
	movzbl	(%rax), %ecx
	orl	36(%rsp), %ecx
	testb	%dl, %dl
	movzbl	16(%rbx), %edx
	cmovnel	%ecx, %edx
	movb	%dl, (%rax)
	leaq	37(%rsp), %rax
	leaq	17(%rbx), %rcx
	cmpq	$17, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmovneq	%rcx, %rdx
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movb	%al, (%rdx)
	leaq	38(%rsp), %rax
	leaq	18(%rbx), %rcx
	cmpq	$18, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmovneq	%rcx, %rdx
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movb	%al, (%rdx)
	leaq	39(%rsp), %rax
	leaq	19(%rbx), %rcx
	cmpq	$19, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movq	%rdx, %rsi
	cmovneq	%rcx, %rsi
	movb	%al, (%rsi)
	movb	15(%rsp), %al
	testb	%al, %al
	cmovneq	%rcx, %rdx
	movzbl	(%rdx), %ecx
	orl	40(%rsp), %ecx
	testb	%al, %al
	movzbl	19(%rbx), %eax
	cmovnel	%ecx, %eax
	movb	%al, (%rdx)
	leaq	41(%rsp), %rax
	leaq	20(%rbx), %rcx
	cmpq	$20, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmovneq	%rcx, %rdx
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movb	%al, (%rdx)
	leaq	42(%rsp), %rax
	leaq	21(%rbx), %rcx
	cmpq	$21, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmovneq	%rcx, %rdx
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movb	%al, (%rdx)
	leaq	43(%rsp), %rax
	leaq	22(%rbx), %rcx
	cmpq	$22, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movq	%rdx, %rsi
	cmovneq	%rcx, %rsi
	movb	%al, (%rsi)
	movb	15(%rsp), %al
	testb	%al, %al
	cmovneq	%rcx, %rdx
	movzbl	(%rdx), %ecx
	orl	44(%rsp), %ecx
	testb	%al, %al
	movzbl	22(%rbx), %eax
	cmovnel	%ecx, %eax
	movb	%al, (%rdx)
	leaq	45(%rsp), %rax
	leaq	23(%rbx), %rcx
	cmpq	$23, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmovneq	%rcx, %rdx
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movb	%al, (%rdx)
	leaq	46(%rsp), %rax
	leaq	24(%rbx), %rcx
	cmpq	$24, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmovneq	%rcx, %rdx
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movb	%al, (%rdx)
	leaq	47(%rsp), %rax
	leaq	25(%rbx), %rcx
	cmpq	$25, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movq	%rdx, %rsi
	cmovneq	%rcx, %rsi
	movb	%al, (%rsi)
	movb	15(%rsp), %al
	testb	%al, %al
	cmovneq	%rcx, %rdx
	movzbl	(%rdx), %ecx
	orl	48(%rsp), %ecx
	testb	%al, %al
	movzbl	25(%rbx), %eax
	cmovnel	%ecx, %eax
	movb	%al, (%rdx)
	leaq	49(%rsp), %rax
	leaq	26(%rbx), %rcx
	cmpq	$26, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmovneq	%rcx, %rdx
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movb	%al, (%rdx)
	leaq	50(%rsp), %rax
	leaq	27(%rbx), %rcx
	cmpq	$27, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmovneq	%rcx, %rdx
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movb	%al, (%rdx)
	leaq	51(%rsp), %rax
	leaq	28(%rbx), %rcx
	cmpq	$28, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movq	%rdx, %rsi
	cmovneq	%rcx, %rsi
	movb	%al, (%rsi)
	movb	15(%rsp), %al
	testb	%al, %al
	cmovneq	%rcx, %rdx
	movzbl	(%rdx), %ecx
	orl	52(%rsp), %ecx
	testb	%al, %al
	movzbl	28(%rbx), %eax
	cmovnel	%ecx, %eax
	movb	%al, (%rdx)
	leaq	53(%rsp), %rax
	leaq	29(%rbx), %rcx
	cmpq	$29, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmovneq	%rcx, %rdx
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movb	%al, (%rdx)
	leaq	54(%rsp), %rax
	leaq	30(%rbx), %rcx
	cmpq	$30, %rbp
	movq	%r8, %rdx
	cmovgq	%rcx, %rdx
	cmpb	$0, 15(%rsp)
	cmovneq	%rcx, %rdx
	cmoveq	%rcx, %rax
	movb	(%rax), %al
	movb	%al, (%rdx)
	addq	$31, %rbx
	cmpq	$31, %rbp
	leaq	55(%rsp), %rax
	movq	%r8, %rcx
	cmovgq	%rbx, %rcx
	cmpb	$0, 15(%rsp)
	cmovneq	%rbx, %rcx
	cmovneq	%rax, %rbx
	movb	(%rbx), %al
	movb	%al, (%rcx)
	addq	$136, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end9:
	.size	fcontract, .Lfunc_end9-fcontract
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function s32_gte
	.type	s32_gte,@function
s32_gte:                                # @s32_gte
	.cfi_startproc
# %bb.0:
	movl	%edi, %eax
	andl	$1, %edx
	movb	%dl, -9(%rsp)
	subl	%esi, %eax
	sarl	$31, %eax
	notl	%eax
	retq
.Lfunc_end10:
	.size	s32_gte, .Lfunc_end10-s32_gte
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function s32_eq
	.type	s32_eq,@function
s32_eq:                                 # @s32_eq
	.cfi_startproc
# %bb.0:
	andl	$1, %edx
	movb	%dl, -9(%rsp)
	xorl	%esi, %edi
	notl	%edi
	movl	%edi, %eax
	shll	$16, %eax
	andl	%edi, %eax
	movl	%eax, %ecx
	shll	$8, %ecx
	andl	%eax, %ecx
	movl	%ecx, %eax
	shll	$4, %eax
	andl	%ecx, %eax
	leal	(,%rax,4), %ecx
	andl	%eax, %ecx
	leal	(%rcx,%rcx), %eax
	andl	%ecx, %eax
	sarl	$31, %eax
	retq
.Lfunc_end11:
	.size	s32_eq, .Lfunc_end11-s32_eq
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fproduct
	.type	fproduct,@function
fproduct:                               # @fproduct
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	testq	%rcx, %rcx
	movq	%rcx, %r11
	movq	%rcx, -120(%rsp)        # 8-byte Spill
	leaq	-104(%rsp), %rcx
	movq	%rcx, %rbp
	cmovgq	%rdx, %rbp
	testq	%r9, %r9
	movq	%r9, %r12
	movb	288(%rsp), %al
	movq	%rcx, %rbx
	movq	%rcx, %r13
	cmovgq	%r8, %rbx
	testb	%al, %al
	movq	%rbp, %rcx
	cmovneq	%rdx, %rcx
	movq	%rdx, %r14
	movslq	(%rcx), %rcx
	movq	%rbx, %rdx
	cmovneq	%r8, %rdx
	movslq	(%rdx), %rdx
	imulq	%rcx, %rdx
	testb	%al, %al
	movq	%rdi, -112(%rsp)        # 8-byte Spill
	cmoveq	(%rdi), %rdx
	testq	%rsi, %rsi
	movq	%rsi, %r9
	movq	%rsi, -88(%rsp)         # 8-byte Spill
	movq	%r13, %rcx
	cmovgq	%rdi, %rcx
	testb	%al, %al
	cmovneq	%rdi, %rcx
	movq	%rdx, (%rcx)
	leaq	8(%r14), %rdi
	movq	%rdi, -48(%rsp)         # 8-byte Spill
	movq	%r14, %r15
	movb	288(%rsp), %al
	testb	%al, %al
	movq	%rbx, %rcx
	movq	%rbx, %r14
	movq	%rbx, 96(%rsp)          # 8-byte Spill
	movq	%r8, %rbx
	movq	%r8, -128(%rsp)         # 8-byte Spill
	cmovneq	%r8, %rcx
	cmpq	$1, %r11
	movq	%r13, %rsi
	movq	%r13, %r11
	cmovgq	%rdi, %rsi
	testb	%al, %al
	movq	%rsi, %rdx
	movq	%rsi, %r8
	movq	%rsi, -64(%rsp)         # 8-byte Spill
	cmovneq	%rdi, %rdx
	leaq	8(%rbx), %rdi
	cmpq	$1, %r12
	movq	%r12, %r13
	movq	%r12, 80(%rsp)          # 8-byte Spill
	movq	%r11, %rbx
	cmovgq	%rdi, %rbx
	testb	%al, %al
	movq	%rbp, %rsi
	movq	%rbp, %r12
	movq	%rbp, -56(%rsp)         # 8-byte Spill
	cmovneq	%r15, %rsi
	movq	%r15, %r10
	movslq	(%rsi), %rsi
	movq	%rbx, %rbp
	movq	%rbx, -24(%rsp)         # 8-byte Spill
	cmovneq	%rdi, %rbp
	movq	%rdi, %r15
	movq	%rdi, 184(%rsp)         # 8-byte Spill
	movslq	(%rbp), %rbp
	imulq	%rsi, %rbp
	movslq	(%rdx), %rdx
	movslq	(%rcx), %rcx
	imulq	%rdx, %rcx
	addq	%rbp, %rcx
	testb	%al, %al
	movq	-112(%rsp), %rdx        # 8-byte Reload
	cmoveq	8(%rdx), %rcx
	cmpq	$1, %r9
	leaq	8(%rdx), %rdx
	movq	%r11, %rbp
	movq	%r11, %rsi
	cmovgq	%rdx, %rsi
	testb	%al, %al
	cmovneq	%rdx, %rsi
	movq	%rcx, (%rsi)
	movb	288(%rsp), %dil
	testb	%dil, %dil
	movq	%r14, %r9
	movq	-128(%rsp), %rax        # 8-byte Reload
	cmovneq	%rax, %r9
	movq	-120(%rsp), %r11        # 8-byte Reload
	cmpq	$2, %r11
	leaq	16(%r10), %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movq	%r10, %r14
	movq	%rbp, %rdx
	cmovgq	%rcx, %rdx
	movq	%rdx, -96(%rsp)         # 8-byte Spill
	testb	%dil, %dil
	cmovneq	%rcx, %rdx
	cmpq	$2, %r13
	leaq	16(%rax), %r10
	movq	%rbp, %r13
	cmovgq	%r10, %r13
	testb	%dil, %dil
	movq	%r8, %rsi
	cmovneq	-48(%rsp), %rsi         # 8-byte Folded Reload
	movslq	(%rsi), %r8
	movq	%rbx, %rbp
	cmovneq	%r15, %rbp
	movslq	(%rbp), %rbp
	movq	%r12, %rbx
	cmovneq	%r14, %rbx
	movq	%r14, %r12
	movq	%r13, %rsi
	movq	%r13, 160(%rsp)         # 8-byte Spill
	cmovneq	%r10, %rsi
	movq	%r10, 152(%rsp)         # 8-byte Spill
	imulq	%r8, %rbp
	movslq	(%rbx), %rbx
	movslq	(%rsi), %rsi
	imulq	%rbx, %rsi
	leaq	(%rsi,%rbp,2), %rsi
	movslq	(%rdx), %rdx
	movslq	(%r9), %rcx
	imulq	%rdx, %rcx
	addq	%rsi, %rcx
	testb	%dil, %dil
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	16(%rax), %rcx
	cmpq	$2, -88(%rsp)           # 8-byte Folded Reload
	leaq	16(%rax), %rdx
	leaq	-104(%rsp), %rbp
	movq	%rbp, %rsi
	cmovgq	%rdx, %rsi
	testb	%dil, %dil
	cmovneq	%rdx, %rsi
	movq	%rcx, (%rsi)
	movb	288(%rsp), %al
	testb	%al, %al
	movq	96(%rsp), %r14          # 8-byte Reload
	movq	%r14, %r9
	movq	-128(%rsp), %rdx        # 8-byte Reload
	cmovneq	%rdx, %r9
	cmpq	$3, %r11
	leaq	24(%r12), %rcx
	movq	%rcx, 112(%rsp)         # 8-byte Spill
	movq	%rbp, %r15
	cmovgq	%rcx, %r15
	movq	%r15, 104(%rsp)         # 8-byte Spill
	testb	%al, %al
	cmovneq	%rcx, %r15
	cmpq	$3, 80(%rsp)            # 8-byte Folded Reload
	leaq	24(%rdx), %rdx
	movq	%rbp, %rcx
	cmovgq	%rdx, %rcx
	movq	%rdx, %rdi
	movq	%rdx, 32(%rsp)          # 8-byte Spill
	movq	%rcx, %rdx
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	testb	%al, %al
	movq	-64(%rsp), %rsi         # 8-byte Reload
	cmovneq	-48(%rsp), %rsi         # 8-byte Folded Reload
	movslq	(%rsi), %r8
	cmovneq	%r10, %r13
	movslq	(%r13), %rbp
	movq	-96(%rsp), %rbx         # 8-byte Reload
	cmovneq	8(%rsp), %rbx           # 8-byte Folded Reload
	movq	-24(%rsp), %rsi         # 8-byte Reload
	movq	184(%rsp), %r13         # 8-byte Reload
	cmovneq	%r13, %rsi
	movq	-56(%rsp), %rcx         # 8-byte Reload
	cmovneq	%r12, %rcx
	cmovneq	%rdi, %rdx
	imulq	%r8, %rbp
	movslq	(%rbx), %rbx
	movslq	(%rsi), %rsi
	imulq	%rbx, %rsi
	addq	%rbp, %rsi
	movslq	(%rcx), %rcx
	movslq	(%rdx), %rdx
	imulq	%rcx, %rdx
	addq	%rsi, %rdx
	movslq	(%r15), %rcx
	movslq	(%r9), %rsi
	imulq	%rcx, %rsi
	addq	%rdx, %rsi
	testb	%al, %al
	movq	-112(%rsp), %rcx        # 8-byte Reload
	cmoveq	24(%rcx), %rsi
	cmpq	$3, -88(%rsp)           # 8-byte Folded Reload
	leaq	24(%rcx), %rcx
	leaq	-104(%rsp), %rbp
	movq	%rbp, %rdx
	cmovgq	%rcx, %rdx
	testb	%al, %al
	cmovneq	%rcx, %rdx
	movq	%rsi, (%rdx)
	movb	288(%rsp), %dil
	testb	%dil, %dil
	movq	%r14, %r9
	movq	-128(%rsp), %rcx        # 8-byte Reload
	cmovneq	%rcx, %r9
	cmpq	$4, -120(%rsp)          # 8-byte Folded Reload
	leaq	32(%r12), %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	%r12, %r8
	movq	%rbp, %r15
	cmovgq	%rax, %r15
	movq	%r15, 24(%rsp)          # 8-byte Spill
	testb	%dil, %dil
	cmovneq	%rax, %r15
	movq	80(%rsp), %r10          # 8-byte Reload
	cmpq	$4, %r10
	leaq	32(%rcx), %rcx
	movq	%rbp, %rax
	cmovgq	%rcx, %rax
	movq	%rcx, %r11
	movq	%rcx, 72(%rsp)          # 8-byte Spill
	movq	%rax, -16(%rsp)         # 8-byte Spill
	testb	%dil, %dil
	movq	-96(%rsp), %rdx         # 8-byte Reload
	cmovneq	8(%rsp), %rdx           # 8-byte Folded Reload
	movslq	(%rdx), %r12
	movq	160(%rsp), %rbp         # 8-byte Reload
	cmovneq	152(%rsp), %rbp         # 8-byte Folded Reload
	movslq	(%rbp), %rbp
	movq	-64(%rsp), %rbx         # 8-byte Reload
	cmovneq	-48(%rsp), %rbx         # 8-byte Folded Reload
	movq	40(%rsp), %rdx          # 8-byte Reload
	cmovneq	32(%rsp), %rdx          # 8-byte Folded Reload
	movq	104(%rsp), %rcx         # 8-byte Reload
	movq	112(%rsp), %r14         # 8-byte Reload
	cmovneq	%r14, %rcx
	movq	-24(%rsp), %rsi         # 8-byte Reload
	cmovneq	%r13, %rsi
	movq	-56(%rsp), %r13         # 8-byte Reload
	movq	%r8, 208(%rsp)          # 8-byte Spill
	cmovneq	%r8, %r13
	cmovneq	%r11, %rax
	imulq	%r12, %rbp
	movslq	(%rbx), %rbx
	movslq	(%rdx), %rdx
	imulq	%rbx, %rdx
	movslq	(%rcx), %rcx
	movslq	(%rsi), %rsi
	imulq	%rcx, %rsi
	addq	%rdx, %rsi
	leaq	(%rbp,%rsi,2), %rcx
	movslq	(%r13), %rdx
	movslq	(%rax), %rax
	imulq	%rdx, %rax
	addq	%rcx, %rax
	movslq	(%r15), %rcx
	movslq	(%r9), %rdx
	imulq	%rcx, %rdx
	addq	%rax, %rdx
	testb	%dil, %dil
	movq	-112(%rsp), %rcx        # 8-byte Reload
	cmoveq	32(%rcx), %rdx
	cmpq	$4, -88(%rsp)           # 8-byte Folded Reload
	leaq	32(%rcx), %rax
	leaq	-104(%rsp), %rsi
	movq	%rsi, %rcx
	cmovgq	%rax, %rcx
	testb	%dil, %dil
	cmovneq	%rax, %rcx
	movq	%rdx, (%rcx)
	movb	288(%rsp), %r13b
	testb	%r13b, %r13b
	movq	96(%rsp), %r11          # 8-byte Reload
	movq	-128(%rsp), %rcx        # 8-byte Reload
	cmovneq	%rcx, %r11
	cmpq	$5, -120(%rsp)          # 8-byte Folded Reload
	leaq	40(%r8), %rax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movq	%rsi, %r15
	cmovgq	%rax, %r15
	movq	%r15, 176(%rsp)         # 8-byte Spill
	testb	%r13b, %r13b
	cmovneq	%rax, %r15
	cmpq	$5, %r10
	leaq	40(%rcx), %rcx
	movq	%rsi, %rax
	cmovgq	%rcx, %rax
	movq	%rcx, %r10
	movq	%rcx, 48(%rsp)          # 8-byte Spill
	movq	%rax, 64(%rsp)          # 8-byte Spill
	testb	%r13b, %r13b
	movq	-96(%rsp), %rdx         # 8-byte Reload
	cmovneq	8(%rsp), %rdx           # 8-byte Folded Reload
	movslq	(%rdx), %rcx
	movq	%rcx, -40(%rsp)         # 8-byte Spill
	movq	40(%rsp), %rdi          # 8-byte Reload
	cmovneq	32(%rsp), %rdi          # 8-byte Folded Reload
	movslq	(%rdi), %r9
	movq	104(%rsp), %r12         # 8-byte Reload
	movq	%r12, %rbp
	cmovneq	%r14, %rbp
	movq	160(%rsp), %rbx         # 8-byte Reload
	cmovneq	152(%rsp), %rbx         # 8-byte Folded Reload
	movq	-64(%rsp), %r8          # 8-byte Reload
	cmovneq	-48(%rsp), %r8          # 8-byte Folded Reload
	movq	-16(%rsp), %rsi         # 8-byte Reload
	cmovneq	72(%rsp), %rsi          # 8-byte Folded Reload
	movq	24(%rsp), %rdi          # 8-byte Reload
	cmovneq	16(%rsp), %rdi          # 8-byte Folded Reload
	movq	-24(%rsp), %rcx         # 8-byte Reload
	cmovneq	184(%rsp), %rcx         # 8-byte Folded Reload
	movq	-56(%rsp), %rdx         # 8-byte Reload
	movq	208(%rsp), %r14         # 8-byte Reload
	cmovneq	%r14, %rdx
	cmovneq	%r10, %rax
	imulq	-40(%rsp), %r9          # 8-byte Folded Reload
	movslq	(%rbp), %rbp
	movslq	(%rbx), %rbx
	imulq	%rbp, %rbx
	addq	%r9, %rbx
	movslq	(%r8), %rbp
	movslq	(%rsi), %rsi
	imulq	%rbp, %rsi
	addq	%rbx, %rsi
	movslq	(%rdi), %rdi
	movslq	(%rcx), %rcx
	imulq	%rdi, %rcx
	addq	%rsi, %rcx
	movslq	(%rdx), %rdx
	movslq	(%rax), %rax
	imulq	%rdx, %rax
	addq	%rcx, %rax
	movslq	(%r15), %rcx
	movslq	(%r11), %rdx
	imulq	%rcx, %rdx
	addq	%rax, %rdx
	testb	%r13b, %r13b
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	40(%rax), %rdx
	cmpq	$5, -88(%rsp)           # 8-byte Folded Reload
	leaq	40(%rax), %rax
	leaq	-104(%rsp), %rsi
	movq	%rsi, %rcx
	cmovgq	%rax, %rcx
	testb	%r13b, %r13b
	cmovneq	%rax, %rcx
	movq	%rdx, (%rcx)
	movb	288(%rsp), %r11b
	testb	%r11b, %r11b
	movq	96(%rsp), %rax          # 8-byte Reload
	movq	-128(%rsp), %rcx        # 8-byte Reload
	cmovneq	%rcx, %rax
	movq	%rax, -72(%rsp)         # 8-byte Spill
	cmpq	$6, -120(%rsp)          # 8-byte Folded Reload
	movq	%r14, %r10
	leaq	48(%r14), %rax
	movq	%rax, -40(%rsp)         # 8-byte Spill
	movq	%rsi, %r14
	cmovgq	%rax, %r14
	movq	%r14, 168(%rsp)         # 8-byte Spill
	testb	%r11b, %r11b
	cmovneq	%rax, %r14
	movq	%r14, -80(%rsp)         # 8-byte Spill
	cmpq	$6, 80(%rsp)            # 8-byte Folded Reload
	leaq	48(%rcx), %r14
	movq	%rsi, %rcx
	cmovgq	%r14, %rcx
	movq	%r14, 144(%rsp)         # 8-byte Spill
	movq	%rcx, 136(%rsp)         # 8-byte Spill
	testb	%r11b, %r11b
	cmovneq	112(%rsp), %r12         # 8-byte Folded Reload
	movslq	(%r12), %r12
	movq	40(%rsp), %rdi          # 8-byte Reload
	cmovneq	32(%rsp), %rdi          # 8-byte Folded Reload
	movslq	(%rdi), %r15
	movq	-64(%rsp), %r13         # 8-byte Reload
	cmovneq	-48(%rsp), %r13         # 8-byte Folded Reload
	movq	64(%rsp), %rbx          # 8-byte Reload
	cmovneq	48(%rsp), %rbx          # 8-byte Folded Reload
	movq	176(%rsp), %r9          # 8-byte Reload
	cmovneq	56(%rsp), %r9           # 8-byte Folded Reload
	movq	-24(%rsp), %rdx         # 8-byte Reload
	cmovneq	184(%rsp), %rdx         # 8-byte Folded Reload
	movq	-96(%rsp), %r8          # 8-byte Reload
	cmovneq	8(%rsp), %r8            # 8-byte Folded Reload
	movq	-16(%rsp), %rax         # 8-byte Reload
	cmovneq	72(%rsp), %rax          # 8-byte Folded Reload
	movq	24(%rsp), %rdi          # 8-byte Reload
	cmovneq	16(%rsp), %rdi          # 8-byte Folded Reload
	movq	160(%rsp), %rbp         # 8-byte Reload
	cmovneq	152(%rsp), %rbp         # 8-byte Folded Reload
	movq	-56(%rsp), %rsi         # 8-byte Reload
	cmovneq	%r10, %rsi
	cmovneq	%r14, %rcx
	imulq	%r12, %r15
	movslq	(%r13), %r12
	movslq	(%rbx), %rbx
	imulq	%r12, %rbx
	addq	%r15, %rbx
	movslq	(%r9), %r9
	movslq	(%rdx), %rdx
	imulq	%r9, %rdx
	addq	%rbx, %rdx
	movslq	(%r8), %rbx
	movslq	(%rax), %rax
	imulq	%rbx, %rax
	leaq	(%rax,%rdx,2), %rax
	movslq	(%rdi), %rdx
	movslq	(%rbp), %rdi
	imulq	%rdx, %rdi
	addq	%rax, %rdi
	movslq	(%rsi), %rax
	movslq	(%rcx), %rcx
	imulq	%rax, %rcx
	addq	%rdi, %rcx
	movq	-80(%rsp), %rax         # 8-byte Reload
	movslq	(%rax), %rax
	movq	-72(%rsp), %rdx         # 8-byte Reload
	movslq	(%rdx), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	testb	%r11b, %r11b
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	48(%rax), %rdx
	cmpq	$6, -88(%rsp)           # 8-byte Folded Reload
	leaq	48(%rax), %rax
	leaq	-104(%rsp), %rdi
	movq	%rdi, %rcx
	cmovgq	%rax, %rcx
	testb	%r11b, %r11b
	cmovneq	%rax, %rcx
	movq	%rdx, (%rcx)
	movb	288(%rsp), %r11b
	testb	%r11b, %r11b
	movq	96(%rsp), %rax          # 8-byte Reload
	movq	-128(%rsp), %rsi        # 8-byte Reload
	cmovneq	%rsi, %rax
	movq	%rax, -72(%rsp)         # 8-byte Spill
	cmpq	$7, -120(%rsp)          # 8-byte Folded Reload
	leaq	56(%r10), %rcx
	movq	%rcx, 192(%rsp)         # 8-byte Spill
	movq	%rdi, %rax
	cmovgq	%rcx, %rax
	movq	%rax, 200(%rsp)         # 8-byte Spill
	testb	%r11b, %r11b
	cmovneq	%rcx, %rax
	movq	%rax, -80(%rsp)         # 8-byte Spill
	cmpq	$7, 80(%rsp)            # 8-byte Folded Reload
	leaq	56(%rsi), %r10
	movq	%rdi, %rax
	cmovgq	%r10, %rax
	movq	%rax, (%rsp)            # 8-byte Spill
	movq	%r10, 128(%rsp)         # 8-byte Spill
	testb	%r11b, %r11b
	movq	104(%rsp), %rdx         # 8-byte Reload
	cmovneq	112(%rsp), %rdx         # 8-byte Folded Reload
	movslq	(%rdx), %rax
	movq	%rax, -32(%rsp)         # 8-byte Spill
	movq	-16(%rsp), %rdx         # 8-byte Reload
	cmovneq	72(%rsp), %rdx          # 8-byte Folded Reload
	movslq	(%rdx), %r14
	movq	24(%rsp), %r15          # 8-byte Reload
	cmovneq	16(%rsp), %r15          # 8-byte Folded Reload
	movq	40(%rsp), %r13          # 8-byte Reload
	cmovneq	32(%rsp), %r13          # 8-byte Folded Reload
	movq	-96(%rsp), %r12         # 8-byte Reload
	cmovneq	8(%rsp), %r12           # 8-byte Folded Reload
	movq	64(%rsp), %r8           # 8-byte Reload
	cmovneq	48(%rsp), %r8           # 8-byte Folded Reload
	movq	176(%rsp), %r9          # 8-byte Reload
	cmovneq	56(%rsp), %r9           # 8-byte Folded Reload
	movq	160(%rsp), %rsi         # 8-byte Reload
	cmovneq	152(%rsp), %rsi         # 8-byte Folded Reload
	movq	-64(%rsp), %rbx         # 8-byte Reload
	cmovneq	-48(%rsp), %rbx         # 8-byte Folded Reload
	movq	136(%rsp), %rdx         # 8-byte Reload
	cmovneq	144(%rsp), %rdx         # 8-byte Folded Reload
	movq	168(%rsp), %rbp         # 8-byte Reload
	cmovneq	-40(%rsp), %rbp         # 8-byte Folded Reload
	movq	-24(%rsp), %rdi         # 8-byte Reload
	cmovneq	184(%rsp), %rdi         # 8-byte Folded Reload
	movq	-56(%rsp), %rcx         # 8-byte Reload
	cmovneq	208(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rsp), %rax            # 8-byte Reload
	cmovneq	%r10, %rax
	imulq	-32(%rsp), %r14         # 8-byte Folded Reload
	movslq	(%r15), %r15
	movslq	(%r13), %r13
	imulq	%r15, %r13
	addq	%r14, %r13
	movslq	(%r12), %r14
	movslq	(%r8), %r8
	imulq	%r14, %r8
	addq	%r13, %r8
	movslq	(%r9), %r9
	movslq	(%rsi), %rsi
	imulq	%r9, %rsi
	addq	%r8, %rsi
	movslq	(%rbx), %rbx
	movslq	(%rdx), %rdx
	imulq	%rbx, %rdx
	addq	%rsi, %rdx
	movslq	(%rbp), %rsi
	movslq	(%rdi), %rdi
	imulq	%rsi, %rdi
	addq	%rdx, %rdi
	movslq	(%rcx), %rcx
	movslq	(%rax), %rax
	imulq	%rcx, %rax
	addq	%rdi, %rax
	movq	-80(%rsp), %rcx         # 8-byte Reload
	movslq	(%rcx), %rcx
	movq	-72(%rsp), %rdx         # 8-byte Reload
	movslq	(%rdx), %rdx
	imulq	%rcx, %rdx
	addq	%rax, %rdx
	testb	%r11b, %r11b
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	56(%rax), %rdx
	cmpq	$7, -88(%rsp)           # 8-byte Folded Reload
	leaq	56(%rax), %rax
	leaq	-104(%rsp), %rdi
	movq	%rdi, %rcx
	cmovgq	%rax, %rcx
	testb	%r11b, %r11b
	cmovneq	%rax, %rcx
	movq	%rdx, (%rcx)
	movb	288(%rsp), %bl
	movb	%bl, 224(%rsp)          # 1-byte Spill
	testb	%bl, %bl
	movq	96(%rsp), %rax          # 8-byte Reload
	movq	-128(%rsp), %rsi        # 8-byte Reload
	cmovneq	%rsi, %rax
	movq	%rax, -8(%rsp)          # 8-byte Spill
	cmpq	$8, -120(%rsp)          # 8-byte Folded Reload
	movq	208(%rsp), %r11         # 8-byte Reload
	leaq	64(%r11), %rdx
	movq	%rdx, 120(%rsp)         # 8-byte Spill
	movq	%rdi, %rcx
	cmovgq	%rdx, %rcx
	movq	%rcx, -32(%rsp)         # 8-byte Spill
	testb	%bl, %bl
	cmovneq	%rdx, %rcx
	movq	%rcx, 88(%rsp)          # 8-byte Spill
	cmpq	$8, 80(%rsp)            # 8-byte Folded Reload
	leaq	64(%rsi), %rdx
	movq	%rdx, -80(%rsp)         # 8-byte Spill
	movq	%rdi, %rcx
	cmovgq	%rdx, %rcx
	movq	%rcx, -72(%rsp)         # 8-byte Spill
	testb	%bl, %bl
	movq	24(%rsp), %rax          # 8-byte Reload
	cmovneq	16(%rsp), %rax          # 8-byte Folded Reload
	movslq	(%rax), %rax
	movq	%rax, 216(%rsp)         # 8-byte Spill
	movq	-16(%rsp), %rax         # 8-byte Reload
	cmovneq	72(%rsp), %rax          # 8-byte Folded Reload
	movslq	(%rax), %r12
	movq	104(%rsp), %r13         # 8-byte Reload
	cmovneq	112(%rsp), %r13         # 8-byte Folded Reload
	movq	64(%rsp), %r15          # 8-byte Reload
	cmovneq	48(%rsp), %r15          # 8-byte Folded Reload
	movq	176(%rsp), %rbp         # 8-byte Reload
	cmovneq	56(%rsp), %rbp          # 8-byte Folded Reload
	movq	40(%rsp), %rbx          # 8-byte Reload
	cmovneq	32(%rsp), %rbx          # 8-byte Folded Reload
	movq	-64(%rsp), %r10         # 8-byte Reload
	cmovneq	-48(%rsp), %r10         # 8-byte Folded Reload
	movq	(%rsp), %rdx            # 8-byte Reload
	cmovneq	128(%rsp), %rdx         # 8-byte Folded Reload
	movq	200(%rsp), %rdi         # 8-byte Reload
	cmovneq	192(%rsp), %rdi         # 8-byte Folded Reload
	movq	-24(%rsp), %rax         # 8-byte Reload
	cmovneq	184(%rsp), %rax         # 8-byte Folded Reload
	movq	-96(%rsp), %rsi         # 8-byte Reload
	cmovneq	8(%rsp), %rsi           # 8-byte Folded Reload
	movq	136(%rsp), %rcx         # 8-byte Reload
	cmovneq	144(%rsp), %rcx         # 8-byte Folded Reload
	movq	168(%rsp), %r9          # 8-byte Reload
	cmovneq	-40(%rsp), %r9          # 8-byte Folded Reload
	movq	160(%rsp), %r8          # 8-byte Reload
	cmovneq	152(%rsp), %r8          # 8-byte Folded Reload
	movq	-56(%rsp), %r14         # 8-byte Reload
	cmovneq	%r11, %r14
	movq	-72(%rsp), %r11         # 8-byte Reload
	cmovneq	-80(%rsp), %r11         # 8-byte Folded Reload
	imulq	216(%rsp), %r12         # 8-byte Folded Reload
	movslq	(%r13), %r13
	movslq	(%r15), %r15
	imulq	%r13, %r15
	movslq	(%rbp), %rbp
	movslq	(%rbx), %rbx
	imulq	%rbp, %rbx
	addq	%r15, %rbx
	movslq	(%r10), %rbp
	movslq	(%rdx), %rdx
	imulq	%rbp, %rdx
	addq	%rbx, %rdx
	movslq	(%rdi), %rdi
	movslq	(%rax), %rax
	imulq	%rdi, %rax
	addq	%rdx, %rax
	leaq	(%r12,%rax,2), %rax
	movslq	(%rsi), %rdx
	movslq	(%rcx), %rcx
	imulq	%rdx, %rcx
	addq	%rax, %rcx
	movslq	(%r9), %rax
	movslq	(%r8), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movslq	(%r14), %rax
	movslq	(%r11), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movq	88(%rsp), %rax          # 8-byte Reload
	movslq	(%rax), %rax
	movq	-8(%rsp), %rdx          # 8-byte Reload
	movslq	(%rdx), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movb	224(%rsp), %bl          # 1-byte Reload
	testb	%bl, %bl
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	64(%rax), %rdx
	cmpq	$8, -88(%rsp)           # 8-byte Folded Reload
	leaq	64(%rax), %rax
	leaq	-104(%rsp), %rbp
	movq	%rbp, %rcx
	cmovgq	%rax, %rcx
	testb	%bl, %bl
	cmovneq	%rax, %rcx
	movq	%rdx, (%rcx)
	movb	288(%rsp), %bl
	movb	%bl, 216(%rsp)          # 1-byte Spill
	testb	%bl, %bl
	movq	-128(%rsp), %rax        # 8-byte Reload
	movq	96(%rsp), %rcx          # 8-byte Reload
	cmovneq	%rax, %rcx
	movq	%rcx, 96(%rsp)          # 8-byte Spill
	cmpq	$9, -120(%rsp)          # 8-byte Folded Reload
	movq	208(%rsp), %rdi         # 8-byte Reload
	leaq	72(%rdi), %rsi
	movq	%rsi, -8(%rsp)          # 8-byte Spill
	movq	%rbp, %rdx
	cmovgq	%rsi, %rdx
	movq	%rdx, 88(%rsp)          # 8-byte Spill
	testb	%bl, %bl
	cmovneq	%rsi, %rdx
	movq	%rdx, 224(%rsp)         # 8-byte Spill
	addq	$72, %rax
	movq	%rax, -128(%rsp)        # 8-byte Spill
	cmpq	$9, 80(%rsp)            # 8-byte Folded Reload
	movq	%rbp, %rdx
	cmovgq	%rax, %rdx
	movq	%rdx, -120(%rsp)        # 8-byte Spill
	testb	%bl, %bl
	movq	-56(%rsp), %rax         # 8-byte Reload
	cmovneq	%rdi, %rax
	movq	%rax, -56(%rsp)         # 8-byte Spill
	movq	24(%rsp), %rdx          # 8-byte Reload
	cmovneq	16(%rsp), %rdx          # 8-byte Folded Reload
	movslq	(%rdx), %rax
	movq	%rax, 208(%rsp)         # 8-byte Spill
	movq	64(%rsp), %rdi          # 8-byte Reload
	cmovneq	48(%rsp), %rdi          # 8-byte Folded Reload
	movslq	(%rdi), %r15
	movq	176(%rsp), %rbp         # 8-byte Reload
	cmovneq	56(%rsp), %rbp          # 8-byte Folded Reload
	movq	-16(%rsp), %rbx         # 8-byte Reload
	cmovneq	72(%rsp), %rbx          # 8-byte Folded Reload
	movq	104(%rsp), %rcx         # 8-byte Reload
	cmovneq	112(%rsp), %rcx         # 8-byte Folded Reload
	movq	136(%rsp), %rsi         # 8-byte Reload
	cmovneq	144(%rsp), %rsi         # 8-byte Folded Reload
	movq	168(%rsp), %rax         # 8-byte Reload
	cmovneq	-40(%rsp), %rax         # 8-byte Folded Reload
	movq	40(%rsp), %rdx          # 8-byte Reload
	cmovneq	32(%rsp), %rdx          # 8-byte Folded Reload
	movq	-96(%rsp), %r12         # 8-byte Reload
	cmovneq	8(%rsp), %r12           # 8-byte Folded Reload
	movq	(%rsp), %r11            # 8-byte Reload
	cmovneq	128(%rsp), %r11         # 8-byte Folded Reload
	movq	200(%rsp), %r13         # 8-byte Reload
	cmovneq	192(%rsp), %r13         # 8-byte Folded Reload
	movq	160(%rsp), %r8          # 8-byte Reload
	cmovneq	152(%rsp), %r8          # 8-byte Folded Reload
	movq	-64(%rsp), %r10         # 8-byte Reload
	cmovneq	-48(%rsp), %r10         # 8-byte Folded Reload
	movq	-72(%rsp), %r9          # 8-byte Reload
	cmovneq	-80(%rsp), %r9          # 8-byte Folded Reload
	movq	-32(%rsp), %rdi         # 8-byte Reload
	cmovneq	120(%rsp), %rdi         # 8-byte Folded Reload
	movq	%rdi, 80(%rsp)          # 8-byte Spill
	movq	-24(%rsp), %rdi         # 8-byte Reload
	cmovneq	184(%rsp), %rdi         # 8-byte Folded Reload
	movq	-120(%rsp), %r14        # 8-byte Reload
	cmovneq	-128(%rsp), %r14        # 8-byte Folded Reload
	imulq	208(%rsp), %r15         # 8-byte Folded Reload
	movslq	(%rbp), %rbp
	movslq	(%rbx), %rbx
	imulq	%rbp, %rbx
	addq	%r15, %rbx
	movslq	(%rcx), %rcx
	movslq	(%rsi), %rsi
	imulq	%rcx, %rsi
	addq	%rbx, %rsi
	movslq	(%rax), %rax
	movslq	(%rdx), %rcx
	imulq	%rax, %rcx
	addq	%rsi, %rcx
	movslq	(%r12), %rax
	movslq	(%r11), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movslq	(%r13), %rax
	movslq	(%r8), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movslq	(%r10), %rax
	movslq	(%r9), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movq	80(%rsp), %rax          # 8-byte Reload
	movslq	(%rax), %rax
	movslq	(%rdi), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movq	-56(%rsp), %rax         # 8-byte Reload
	movslq	(%rax), %rax
	movslq	(%r14), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movq	224(%rsp), %rax         # 8-byte Reload
	movslq	(%rax), %rax
	movq	96(%rsp), %rcx          # 8-byte Reload
	movslq	(%rcx), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movb	216(%rsp), %bl          # 1-byte Reload
	testb	%bl, %bl
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	72(%rax), %rcx
	cmpq	$9, -88(%rsp)           # 8-byte Folded Reload
	leaq	72(%rax), %rax
	leaq	-104(%rsp), %rdx
	cmovgq	%rax, %rdx
	testb	%bl, %bl
	cmovneq	%rax, %rdx
	movq	%rcx, (%rdx)
	movb	288(%rsp), %al
	movb	%al, -56(%rsp)          # 1-byte Spill
	testb	%al, %al
	movq	-64(%rsp), %rax         # 8-byte Reload
	cmovneq	-48(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, -64(%rsp)         # 8-byte Spill
	movq	-24(%rsp), %rax         # 8-byte Reload
	cmovneq	184(%rsp), %rax         # 8-byte Folded Reload
	movq	%rax, -24(%rsp)         # 8-byte Spill
	movq	176(%rsp), %rcx         # 8-byte Reload
	cmovneq	56(%rsp), %rcx          # 8-byte Folded Reload
	movslq	(%rcx), %rax
	movq	%rax, -48(%rsp)         # 8-byte Spill
	movq	64(%rsp), %rdx          # 8-byte Reload
	cmovneq	48(%rsp), %rdx          # 8-byte Folded Reload
	movslq	(%rdx), %rdi
	movq	104(%rsp), %rbp         # 8-byte Reload
	cmovneq	112(%rsp), %rbp         # 8-byte Folded Reload
	movq	(%rsp), %rbx            # 8-byte Reload
	cmovneq	128(%rsp), %rbx         # 8-byte Folded Reload
	movq	200(%rsp), %rax         # 8-byte Reload
	cmovneq	192(%rsp), %rax         # 8-byte Folded Reload
	movq	40(%rsp), %rcx          # 8-byte Reload
	cmovneq	32(%rsp), %rcx          # 8-byte Folded Reload
	movq	-120(%rsp), %rdx        # 8-byte Reload
	cmovneq	-128(%rsp), %rdx        # 8-byte Folded Reload
	movq	88(%rsp), %rsi          # 8-byte Reload
	cmovneq	-8(%rsp), %rsi          # 8-byte Folded Reload
	movq	24(%rsp), %r14          # 8-byte Reload
	cmovneq	16(%rsp), %r14          # 8-byte Folded Reload
	movq	136(%rsp), %r15         # 8-byte Reload
	cmovneq	144(%rsp), %r15         # 8-byte Folded Reload
	movq	168(%rsp), %r12         # 8-byte Reload
	cmovneq	-40(%rsp), %r12         # 8-byte Folded Reload
	movq	-16(%rsp), %r13         # 8-byte Reload
	cmovneq	72(%rsp), %r13          # 8-byte Folded Reload
	movq	-96(%rsp), %r8          # 8-byte Reload
	cmovneq	8(%rsp), %r8            # 8-byte Folded Reload
	movq	-72(%rsp), %r9          # 8-byte Reload
	cmovneq	-80(%rsp), %r9          # 8-byte Folded Reload
	movq	-32(%rsp), %r10         # 8-byte Reload
	cmovneq	120(%rsp), %r10         # 8-byte Folded Reload
	movq	160(%rsp), %r11         # 8-byte Reload
	cmovneq	152(%rsp), %r11         # 8-byte Folded Reload
	imulq	-48(%rsp), %rdi         # 8-byte Folded Reload
	movslq	(%rbp), %rbp
	movslq	(%rbx), %rbx
	imulq	%rbp, %rbx
	addq	%rdi, %rbx
	movslq	(%rax), %rax
	movslq	(%rcx), %rcx
	imulq	%rax, %rcx
	addq	%rbx, %rcx
	movq	-64(%rsp), %rax         # 8-byte Reload
	movslq	(%rax), %rax
	movslq	(%rdx), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movslq	(%rsi), %rax
	movq	-24(%rsp), %rcx         # 8-byte Reload
	movslq	(%rcx), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movslq	(%r14), %rax
	movslq	(%r15), %rdx
	imulq	%rax, %rdx
	leaq	(%rdx,%rcx,2), %rax
	movslq	(%r12), %rcx
	movslq	(%r13), %rdx
	imulq	%rcx, %rdx
	addq	%rax, %rdx
	movslq	(%r8), %rax
	movslq	(%r9), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movslq	(%r10), %rax
	movslq	(%r11), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movb	-56(%rsp), %bl          # 1-byte Reload
	testb	%bl, %bl
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	80(%rax), %rdx
	cmpq	$10, -88(%rsp)          # 8-byte Folded Reload
	leaq	80(%rax), %rax
	leaq	-104(%rsp), %rcx
	cmovgq	%rax, %rcx
	testb	%bl, %bl
	cmovneq	%rax, %rcx
	movq	%rdx, (%rcx)
	movb	288(%rsp), %al
	movb	%al, -64(%rsp)          # 1-byte Spill
	testb	%al, %al
	movq	-96(%rsp), %rax         # 8-byte Reload
	cmovneq	8(%rsp), %rax           # 8-byte Folded Reload
	movq	%rax, -96(%rsp)         # 8-byte Spill
	movq	160(%rsp), %r8          # 8-byte Reload
	cmovneq	152(%rsp), %r8          # 8-byte Folded Reload
	movq	176(%rsp), %rcx         # 8-byte Reload
	cmovneq	56(%rsp), %rcx          # 8-byte Folded Reload
	movslq	(%rcx), %r9
	movq	136(%rsp), %rdx         # 8-byte Reload
	cmovneq	144(%rsp), %rdx         # 8-byte Folded Reload
	movslq	(%rdx), %r10
	movq	168(%rsp), %rsi         # 8-byte Reload
	cmovneq	-40(%rsp), %rsi         # 8-byte Folded Reload
	movq	64(%rsp), %rdi          # 8-byte Reload
	cmovneq	48(%rsp), %rdi          # 8-byte Folded Reload
	movq	24(%rsp), %rbp          # 8-byte Reload
	cmovneq	16(%rsp), %rbp          # 8-byte Folded Reload
	movq	(%rsp), %rbx            # 8-byte Reload
	cmovneq	128(%rsp), %rbx         # 8-byte Folded Reload
	movq	200(%rsp), %rax         # 8-byte Reload
	cmovneq	192(%rsp), %rax         # 8-byte Folded Reload
	movq	-16(%rsp), %rcx         # 8-byte Reload
	cmovneq	72(%rsp), %rcx          # 8-byte Folded Reload
	movq	104(%rsp), %r11         # 8-byte Reload
	cmovneq	112(%rsp), %r11         # 8-byte Folded Reload
	movq	-72(%rsp), %rdx         # 8-byte Reload
	cmovneq	-80(%rsp), %rdx         # 8-byte Folded Reload
	movq	-32(%rsp), %r14         # 8-byte Reload
	cmovneq	120(%rsp), %r14         # 8-byte Folded Reload
	movq	40(%rsp), %r15          # 8-byte Reload
	cmovneq	32(%rsp), %r15          # 8-byte Folded Reload
	movq	-120(%rsp), %r12        # 8-byte Reload
	cmovneq	-128(%rsp), %r12        # 8-byte Folded Reload
	movq	88(%rsp), %r13          # 8-byte Reload
	cmovneq	-8(%rsp), %r13          # 8-byte Folded Reload
	imulq	%r9, %r10
	movslq	(%rsi), %rsi
	movslq	(%rdi), %rdi
	imulq	%rsi, %rdi
	addq	%r10, %rdi
	movslq	(%rbp), %rsi
	movslq	(%rbx), %rbp
	imulq	%rsi, %rbp
	addq	%rdi, %rbp
	movslq	(%rax), %rax
	movslq	(%rcx), %rcx
	imulq	%rax, %rcx
	addq	%rbp, %rcx
	movslq	(%r11), %rax
	movslq	(%rdx), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movslq	(%r14), %rax
	movslq	(%r15), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movq	-96(%rsp), %rax         # 8-byte Reload
	movslq	(%rax), %rax
	movslq	(%r12), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movslq	(%r13), %rax
	movslq	(%r8), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movb	-64(%rsp), %bl          # 1-byte Reload
	testb	%bl, %bl
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	88(%rax), %rcx
	cmpq	$11, -88(%rsp)          # 8-byte Folded Reload
	leaq	88(%rax), %rax
	leaq	-104(%rsp), %rdx
	cmovgq	%rax, %rdx
	testb	%bl, %bl
	cmovneq	%rax, %rdx
	movq	%rcx, (%rdx)
	movb	288(%rsp), %al
	movb	%al, -96(%rsp)          # 1-byte Spill
	testb	%al, %al
	movq	104(%rsp), %r9          # 8-byte Reload
	cmovneq	112(%rsp), %r9          # 8-byte Folded Reload
	movq	40(%rsp), %r8           # 8-byte Reload
	cmovneq	32(%rsp), %r8           # 8-byte Folded Reload
	movq	168(%rsp), %rcx         # 8-byte Reload
	cmovneq	-40(%rsp), %rcx         # 8-byte Folded Reload
	movslq	(%rcx), %r12
	movq	136(%rsp), %rdx         # 8-byte Reload
	cmovneq	144(%rsp), %rdx         # 8-byte Folded Reload
	movslq	(%rdx), %r10
	movq	176(%rsp), %rsi         # 8-byte Reload
	cmovneq	56(%rsp), %rsi          # 8-byte Folded Reload
	movq	(%rsp), %rdi            # 8-byte Reload
	cmovneq	128(%rsp), %rdi         # 8-byte Folded Reload
	movq	200(%rsp), %rbp         # 8-byte Reload
	cmovneq	192(%rsp), %rbp         # 8-byte Folded Reload
	movq	64(%rsp), %rbx          # 8-byte Reload
	cmovneq	48(%rsp), %rbx          # 8-byte Folded Reload
	movq	-120(%rsp), %rax        # 8-byte Reload
	cmovneq	-128(%rsp), %rax        # 8-byte Folded Reload
	movq	88(%rsp), %rcx          # 8-byte Reload
	cmovneq	-8(%rsp), %rcx          # 8-byte Folded Reload
	movq	24(%rsp), %rdx          # 8-byte Reload
	cmovneq	16(%rsp), %rdx          # 8-byte Folded Reload
	movq	-72(%rsp), %r11         # 8-byte Reload
	cmovneq	-80(%rsp), %r11         # 8-byte Folded Reload
	movq	-32(%rsp), %r14         # 8-byte Reload
	cmovneq	120(%rsp), %r14         # 8-byte Folded Reload
	movq	-16(%rsp), %r13         # 8-byte Reload
	movq	%r13, %r15
	cmovneq	72(%rsp), %r15          # 8-byte Folded Reload
	imulq	%r12, %r10
	movslq	(%rsi), %rsi
	movslq	(%rdi), %rdi
	imulq	%rsi, %rdi
	movslq	(%rbp), %rsi
	movslq	(%rbx), %rbp
	imulq	%rsi, %rbp
	addq	%rdi, %rbp
	movslq	(%r9), %rsi
	movslq	(%rax), %rax
	imulq	%rsi, %rax
	addq	%rbp, %rax
	movslq	(%rcx), %rcx
	movslq	(%r8), %rsi
	imulq	%rcx, %rsi
	addq	%rax, %rsi
	leaq	(%r10,%rsi,2), %rax
	movslq	(%rdx), %rcx
	movslq	(%r11), %rdx
	imulq	%rcx, %rdx
	addq	%rax, %rdx
	movslq	(%r14), %rax
	movslq	(%r15), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movb	-96(%rsp), %bl          # 1-byte Reload
	testb	%bl, %bl
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	96(%rax), %rcx
	cmpq	$12, -88(%rsp)          # 8-byte Folded Reload
	leaq	96(%rax), %rax
	leaq	-104(%rsp), %rdx
	cmovgq	%rax, %rdx
	testb	%bl, %bl
	cmovneq	%rax, %rdx
	movq	%rcx, (%rdx)
	movb	288(%rsp), %al
	movb	%al, -96(%rsp)          # 1-byte Spill
	testb	%al, %al
	movq	24(%rsp), %r15          # 8-byte Reload
	cmovneq	16(%rsp), %r15          # 8-byte Folded Reload
	cmovneq	72(%rsp), %r13          # 8-byte Folded Reload
	movq	%r13, -16(%rsp)         # 8-byte Spill
	movq	168(%rsp), %rcx         # 8-byte Reload
	cmovneq	-40(%rsp), %rcx         # 8-byte Folded Reload
	movslq	(%rcx), %r9
	movq	(%rsp), %rdx            # 8-byte Reload
	cmovneq	128(%rsp), %rdx         # 8-byte Folded Reload
	movslq	(%rdx), %rdx
	movq	200(%rsp), %r12         # 8-byte Reload
	movq	%r12, %rsi
	movq	192(%rsp), %r13         # 8-byte Reload
	cmovneq	%r13, %rsi
	movq	136(%rsp), %rdi         # 8-byte Reload
	cmovneq	144(%rsp), %rdi         # 8-byte Folded Reload
	movq	176(%rsp), %r14         # 8-byte Reload
	movq	%r14, %rbp
	cmovneq	56(%rsp), %rbp          # 8-byte Folded Reload
	movq	-72(%rsp), %rbx         # 8-byte Reload
	cmovneq	-80(%rsp), %rbx         # 8-byte Folded Reload
	movq	-32(%rsp), %rax         # 8-byte Reload
	cmovneq	120(%rsp), %rax         # 8-byte Folded Reload
	movq	64(%rsp), %rcx          # 8-byte Reload
	cmovneq	48(%rsp), %rcx          # 8-byte Folded Reload
	movq	-120(%rsp), %r10        # 8-byte Reload
	cmovneq	-128(%rsp), %r10        # 8-byte Folded Reload
	movq	88(%rsp), %r8           # 8-byte Reload
	movq	%r8, %r11
	cmovneq	-8(%rsp), %r11          # 8-byte Folded Reload
	imulq	%r9, %rdx
	movslq	(%rsi), %rsi
	movslq	(%rdi), %rdi
	imulq	%rsi, %rdi
	addq	%rdx, %rdi
	movslq	(%rbp), %rdx
	movslq	(%rbx), %rsi
	imulq	%rdx, %rsi
	addq	%rdi, %rsi
	movslq	(%rax), %rax
	movslq	(%rcx), %rcx
	imulq	%rax, %rcx
	addq	%rsi, %rcx
	movslq	(%r15), %rax
	movslq	(%r10), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movslq	(%r11), %rax
	movq	-16(%rsp), %rcx         # 8-byte Reload
	movslq	(%rcx), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movb	-96(%rsp), %bl          # 1-byte Reload
	testb	%bl, %bl
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	104(%rax), %rcx
	cmpq	$13, -88(%rsp)          # 8-byte Folded Reload
	leaq	104(%rax), %rax
	leaq	-104(%rsp), %rdx
	cmovgq	%rax, %rdx
	testb	%bl, %bl
	cmovneq	%rax, %rdx
	movq	%rcx, (%rdx)
	movb	288(%rsp), %r10b
	testb	%r10b, %r10b
	cmovneq	56(%rsp), %r14          # 8-byte Folded Reload
	movq	64(%rsp), %r15          # 8-byte Reload
	cmovneq	48(%rsp), %r15          # 8-byte Folded Reload
	cmovneq	%r13, %r12
	movslq	(%r12), %r9
	movq	(%rsp), %rdx            # 8-byte Reload
	cmovneq	128(%rsp), %rdx         # 8-byte Folded Reload
	movslq	(%rdx), %rdx
	movq	-120(%rsp), %rsi        # 8-byte Reload
	cmovneq	-128(%rsp), %rsi        # 8-byte Folded Reload
	cmovneq	-8(%rsp), %r8           # 8-byte Folded Reload
	movq	168(%rsp), %r11         # 8-byte Reload
	movq	%r11, %rbp
	cmovneq	-40(%rsp), %rbp         # 8-byte Folded Reload
	movq	-72(%rsp), %rbx         # 8-byte Reload
	cmovneq	-80(%rsp), %rbx         # 8-byte Folded Reload
	movq	-32(%rsp), %rax         # 8-byte Reload
	cmovneq	120(%rsp), %rax         # 8-byte Folded Reload
	movq	136(%rsp), %r13         # 8-byte Reload
	movq	%r13, %rcx
	movq	144(%rsp), %r12         # 8-byte Reload
	cmovneq	%r12, %rcx
	imulq	%r9, %rdx
	movslq	(%r14), %r9
	movslq	(%rsi), %rsi
	imulq	%r9, %rsi
	addq	%rdx, %rsi
	movslq	(%r8), %rdx
	movslq	(%r15), %rdi
	imulq	%rdx, %rdi
	addq	%rsi, %rdi
	movslq	(%rbp), %rdx
	movslq	(%rbx), %rsi
	imulq	%rdx, %rsi
	leaq	(%rsi,%rdi,2), %rdx
	movslq	(%rax), %rax
	movslq	(%rcx), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	testb	%r10b, %r10b
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	112(%rax), %rcx
	movq	-88(%rsp), %r9          # 8-byte Reload
	cmpq	$14, %r9
	leaq	112(%rax), %rax
	leaq	-104(%rsp), %rdx
	cmovgq	%rax, %rdx
	testb	%r10b, %r10b
	cmovneq	%rax, %rdx
	movq	%rcx, (%rdx)
	movb	288(%rsp), %r8b
	testb	%r8b, %r8b
	cmovneq	-40(%rsp), %r11         # 8-byte Folded Reload
	movq	%r13, %rax
	cmovneq	%r12, %rax
	movq	200(%rsp), %r12         # 8-byte Reload
	movq	%r12, %rcx
	movq	192(%rsp), %r13         # 8-byte Reload
	cmovneq	%r13, %rcx
	movslq	(%rcx), %rcx
	movq	-72(%rsp), %rdx         # 8-byte Reload
	movq	-80(%rsp), %r10         # 8-byte Reload
	cmovneq	%r10, %rdx
	movslq	(%rdx), %rdx
	movq	-32(%rsp), %rsi         # 8-byte Reload
	cmovneq	120(%rsp), %rsi         # 8-byte Folded Reload
	movq	(%rsp), %r15            # 8-byte Reload
	movq	%r15, %rdi
	movq	128(%rsp), %r14         # 8-byte Reload
	cmovneq	%r14, %rdi
	movq	-120(%rsp), %rbp        # 8-byte Reload
	cmovneq	-128(%rsp), %rbp        # 8-byte Folded Reload
	movq	88(%rsp), %rbx          # 8-byte Reload
	cmovneq	-8(%rsp), %rbx          # 8-byte Folded Reload
	imulq	%rcx, %rdx
	movslq	(%rsi), %rcx
	movslq	(%rdi), %rsi
	imulq	%rcx, %rsi
	addq	%rdx, %rsi
	movslq	(%r11), %rcx
	movslq	(%rbp), %rdx
	imulq	%rcx, %rdx
	addq	%rsi, %rdx
	movslq	(%rbx), %rcx
	movslq	(%rax), %rsi
	imulq	%rcx, %rsi
	addq	%rdx, %rsi
	testb	%r8b, %r8b
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	120(%rax), %rsi
	cmpq	$15, %r9
	leaq	120(%rax), %rcx
	leaq	-104(%rsp), %rdx
	cmovgq	%rcx, %rdx
	testb	%r8b, %r8b
	cmovneq	%rcx, %rdx
	movq	%rsi, (%rdx)
	movb	288(%rsp), %al
	testb	%al, %al
	movq	%r12, %rbx
	cmovneq	%r13, %rbx
	movq	%r15, %rbp
	cmovneq	%r14, %rbp
	movq	-32(%rsp), %r8          # 8-byte Reload
	movq	%r8, %rcx
	movq	120(%rsp), %r14         # 8-byte Reload
	cmovneq	%r14, %rcx
	movslq	(%rcx), %rcx
	movq	-72(%rsp), %r9          # 8-byte Reload
	movq	%r9, %rdx
	cmovneq	%r10, %rdx
	movslq	(%rdx), %rdx
	movq	-120(%rsp), %r11        # 8-byte Reload
	movq	%r11, %rsi
	movq	-128(%rsp), %r13        # 8-byte Reload
	cmovneq	%r13, %rsi
	movq	88(%rsp), %r15          # 8-byte Reload
	movq	%r15, %rdi
	movq	-8(%rsp), %r12          # 8-byte Reload
	cmovneq	%r12, %rdi
	imulq	%rcx, %rdx
	movslq	(%rbx), %rcx
	movslq	(%rsi), %rsi
	imulq	%rcx, %rsi
	movslq	(%rdi), %rcx
	movslq	(%rbp), %rdi
	imulq	%rcx, %rdi
	addq	%rsi, %rdi
	testb	%al, %al
	leaq	(%rdx,%rdi,2), %rcx
	movq	-112(%rsp), %r10        # 8-byte Reload
	cmoveq	128(%r10), %rcx
	leaq	128(%r10), %rdx
	movq	-88(%rsp), %rdi         # 8-byte Reload
	cmpq	$16, %rdi
	leaq	-104(%rsp), %rsi
	cmovgq	%rdx, %rsi
	testb	%al, %al
	cmovneq	%rdx, %rsi
	movq	%rcx, (%rsi)
	movb	288(%rsp), %al
	testb	%al, %al
	cmovneq	%r14, %r8
	movslq	(%r8), %rcx
	movq	%r11, %rdx
	cmovneq	%r13, %rdx
	movslq	(%rdx), %rdx
	cmovneq	-80(%rsp), %r9          # 8-byte Folded Reload
	movq	%r15, %rsi
	cmovneq	%r12, %rsi
	imulq	%rcx, %rdx
	movslq	(%rsi), %rcx
	movslq	(%r9), %rsi
	imulq	%rcx, %rsi
	addq	%rdx, %rsi
	testb	%al, %al
	cmoveq	136(%r10), %rsi
	leaq	136(%r10), %rcx
	cmpq	$17, %rdi
	leaq	-104(%rsp), %r9
	movq	%r9, %rdx
	cmovgq	%rcx, %rdx
	testb	%al, %al
	cmovneq	%rcx, %rdx
	movq	%rsi, (%rdx)
	movb	288(%rsp), %al
	testb	%al, %al
	movq	%r15, %rcx
	cmovneq	%r12, %rcx
	cmovneq	%r13, %r11
	movslq	(%rcx), %rcx
	movslq	(%r11), %rdx
	imulq	%rcx, %rdx
	addq	%rdx, %rdx
	testb	%al, %al
	cmoveq	144(%r10), %rdx
	addq	$144, %r10
	cmpq	$18, %rdi
	movq	%r9, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r10, %rsi
	movq	%rdx, (%rsi)
	addq	$232, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end12:
	.size	fproduct, .Lfunc_end12-fproduct
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function freduce_degree
	.type	freduce_degree,@function
freduce_degree:                         # @freduce_degree
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	andb	$1, %dl
	movb	%dl, -9(%rsp)
	leaq	144(%rdi), %r10
	leaq	64(%rdi), %r9
	cmpq	$18, %rsi
	leaq	-8(%rsp), %r8
	movq	%r8, %r11
	cmovgq	%r10, %r11
	cmpq	$8, %rsi
	movq	%r8, %rcx
	cmovgq	%r9, %rcx
	testb	%dl, %dl
	movq	%r11, %rax
	cmovneq	%r10, %rax
	movq	(%rax), %rax
	movq	%rcx, %rbx
	cmovneq	%r9, %rbx
	shlq	$4, %rax
	addq	(%rbx), %rax
	testb	%dl, %dl
	cmoveq	64(%rdi), %rax
	movq	%rax, (%rbx)
	movb	-9(%rsp), %al
	testb	%al, %al
	movq	%r11, %rdx
	cmovneq	%r10, %rdx
	movq	(%rdx), %rdx
	movq	%rcx, %rbx
	cmovneq	%r9, %rbx
	addq	%rdx, %rdx
	addq	(%rbx), %rdx
	testb	%al, %al
	cmoveq	64(%rdi), %rdx
	movq	%rdx, (%rbx)
	movb	-9(%rsp), %al
	testb	%al, %al
	cmovneq	%r10, %r11
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	addq	(%r11), %rdx
	testb	%al, %al
	cmoveq	64(%rdi), %rdx
	movq	%rdx, (%rcx)
	leaq	136(%rdi), %r10
	leaq	56(%rdi), %r9
	cmpq	$17, %rsi
	movq	%r8, %r14
	cmovgq	%r10, %r14
	cmpq	$7, %rsi
	movb	-9(%rsp), %r11b
	movq	%r8, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	movq	%r14, %rcx
	cmovneq	%r10, %rcx
	movq	(%rcx), %rcx
	movq	%rax, %rdx
	cmovneq	%r9, %rdx
	shlq	$4, %rcx
	addq	(%rdx), %rcx
	testb	%r11b, %r11b
	cmoveq	56(%rdi), %rcx
	movq	%rcx, (%rdx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	movq	%r14, %rdx
	cmovneq	%r10, %rdx
	movq	(%rdx), %rdx
	movq	%rax, %rbx
	cmovneq	%r9, %rbx
	addq	%rdx, %rdx
	addq	(%rbx), %rdx
	testb	%cl, %cl
	cmoveq	56(%rdi), %rdx
	movq	%rdx, (%rbx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	cmovneq	%r10, %r14
	cmovneq	%r9, %rax
	movq	(%rax), %rdx
	addq	(%r14), %rdx
	testb	%cl, %cl
	cmoveq	56(%rdi), %rdx
	movq	%rdx, (%rax)
	leaq	128(%rdi), %r10
	leaq	48(%rdi), %r9
	cmpq	$16, %rsi
	movq	%r8, %r14
	cmovgq	%r10, %r14
	cmpq	$6, %rsi
	movb	-9(%rsp), %r11b
	movq	%r8, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	movq	%r14, %rcx
	cmovneq	%r10, %rcx
	movq	(%rcx), %rcx
	movq	%rax, %rdx
	cmovneq	%r9, %rdx
	shlq	$4, %rcx
	addq	(%rdx), %rcx
	testb	%r11b, %r11b
	cmoveq	48(%rdi), %rcx
	movq	%rcx, (%rdx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	movq	%r14, %rdx
	cmovneq	%r10, %rdx
	movq	(%rdx), %rdx
	movq	%rax, %rbx
	cmovneq	%r9, %rbx
	addq	%rdx, %rdx
	addq	(%rbx), %rdx
	testb	%cl, %cl
	cmoveq	48(%rdi), %rdx
	movq	%rdx, (%rbx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	cmovneq	%r10, %r14
	cmovneq	%r9, %rax
	movq	(%rax), %rdx
	addq	(%r14), %rdx
	testb	%cl, %cl
	cmoveq	48(%rdi), %rdx
	movq	%rdx, (%rax)
	leaq	120(%rdi), %r10
	leaq	40(%rdi), %r9
	cmpq	$15, %rsi
	movq	%r8, %r14
	cmovgq	%r10, %r14
	cmpq	$5, %rsi
	movb	-9(%rsp), %r11b
	movq	%r8, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	movq	%r14, %rcx
	cmovneq	%r10, %rcx
	movq	(%rcx), %rcx
	movq	%rax, %rdx
	cmovneq	%r9, %rdx
	shlq	$4, %rcx
	addq	(%rdx), %rcx
	testb	%r11b, %r11b
	cmoveq	40(%rdi), %rcx
	movq	%rcx, (%rdx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	movq	%r14, %rdx
	cmovneq	%r10, %rdx
	movq	(%rdx), %rdx
	movq	%rax, %rbx
	cmovneq	%r9, %rbx
	addq	%rdx, %rdx
	addq	(%rbx), %rdx
	testb	%cl, %cl
	cmoveq	40(%rdi), %rdx
	movq	%rdx, (%rbx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	cmovneq	%r10, %r14
	cmovneq	%r9, %rax
	movq	(%rax), %rdx
	addq	(%r14), %rdx
	testb	%cl, %cl
	cmoveq	40(%rdi), %rdx
	movq	%rdx, (%rax)
	leaq	112(%rdi), %r10
	leaq	32(%rdi), %r9
	cmpq	$14, %rsi
	movq	%r8, %r14
	cmovgq	%r10, %r14
	cmpq	$4, %rsi
	movb	-9(%rsp), %r11b
	movq	%r8, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	movq	%r14, %rcx
	cmovneq	%r10, %rcx
	movq	(%rcx), %rcx
	movq	%rax, %rdx
	cmovneq	%r9, %rdx
	shlq	$4, %rcx
	addq	(%rdx), %rcx
	testb	%r11b, %r11b
	cmoveq	32(%rdi), %rcx
	movq	%rcx, (%rdx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	movq	%r14, %rdx
	cmovneq	%r10, %rdx
	movq	(%rdx), %rdx
	movq	%rax, %rbx
	cmovneq	%r9, %rbx
	addq	%rdx, %rdx
	addq	(%rbx), %rdx
	testb	%cl, %cl
	cmoveq	32(%rdi), %rdx
	movq	%rdx, (%rbx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	cmovneq	%r10, %r14
	cmovneq	%r9, %rax
	movq	(%rax), %rdx
	addq	(%r14), %rdx
	testb	%cl, %cl
	cmoveq	32(%rdi), %rdx
	movq	%rdx, (%rax)
	leaq	104(%rdi), %r10
	leaq	24(%rdi), %r9
	cmpq	$13, %rsi
	movq	%r8, %r14
	cmovgq	%r10, %r14
	cmpq	$3, %rsi
	movb	-9(%rsp), %r11b
	movq	%r8, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	movq	%r14, %rcx
	cmovneq	%r10, %rcx
	movq	(%rcx), %rcx
	movq	%rax, %rdx
	cmovneq	%r9, %rdx
	shlq	$4, %rcx
	addq	(%rdx), %rcx
	testb	%r11b, %r11b
	cmoveq	24(%rdi), %rcx
	movq	%rcx, (%rdx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	movq	%r14, %rdx
	cmovneq	%r10, %rdx
	movq	(%rdx), %rdx
	movq	%rax, %rbx
	cmovneq	%r9, %rbx
	addq	%rdx, %rdx
	addq	(%rbx), %rdx
	testb	%cl, %cl
	cmoveq	24(%rdi), %rdx
	movq	%rdx, (%rbx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	cmovneq	%r10, %r14
	cmovneq	%r9, %rax
	movq	(%rax), %rdx
	addq	(%r14), %rdx
	testb	%cl, %cl
	cmoveq	24(%rdi), %rdx
	movq	%rdx, (%rax)
	leaq	96(%rdi), %r10
	leaq	16(%rdi), %r9
	cmpq	$12, %rsi
	movq	%r8, %r14
	cmovgq	%r10, %r14
	cmpq	$2, %rsi
	movb	-9(%rsp), %r11b
	movq	%r8, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	movq	%r14, %rcx
	cmovneq	%r10, %rcx
	movq	(%rcx), %rcx
	movq	%rax, %rdx
	cmovneq	%r9, %rdx
	shlq	$4, %rcx
	addq	(%rdx), %rcx
	testb	%r11b, %r11b
	cmoveq	16(%rdi), %rcx
	movq	%rcx, (%rdx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	movq	%r14, %rdx
	cmovneq	%r10, %rdx
	movq	(%rdx), %rdx
	movq	%rax, %rbx
	cmovneq	%r9, %rbx
	addq	%rdx, %rdx
	addq	(%rbx), %rdx
	testb	%cl, %cl
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rbx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	cmovneq	%r10, %r14
	cmovneq	%r9, %rax
	movq	(%rax), %rdx
	addq	(%r14), %rdx
	testb	%cl, %cl
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rax)
	leaq	88(%rdi), %r10
	leaq	8(%rdi), %r9
	cmpq	$11, %rsi
	movq	%r8, %r14
	cmovgq	%r10, %r14
	cmpq	$1, %rsi
	movb	-9(%rsp), %r11b
	movq	%r8, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	movq	%r14, %rcx
	cmovneq	%r10, %rcx
	movq	(%rcx), %rcx
	movq	%rax, %rdx
	cmovneq	%r9, %rdx
	shlq	$4, %rcx
	addq	(%rdx), %rcx
	testb	%r11b, %r11b
	cmoveq	8(%rdi), %rcx
	movq	%rcx, (%rdx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	movq	%r14, %rdx
	cmovneq	%r10, %rdx
	movq	(%rdx), %rdx
	movq	%rax, %rbx
	cmovneq	%r9, %rbx
	addq	%rdx, %rdx
	addq	(%rbx), %rdx
	testb	%cl, %cl
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rbx)
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	cmovneq	%r10, %r14
	cmovneq	%r9, %rax
	movq	(%rax), %rdx
	addq	(%r14), %rdx
	testb	%cl, %cl
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rax)
	leaq	80(%rdi), %rax
	cmpq	$10, %rsi
	movq	%r8, %rcx
	cmovgq	%rax, %rcx
	testq	%rsi, %rsi
	movb	-9(%rsp), %dl
	cmovgq	%rdi, %r8
	testb	%dl, %dl
	movq	%rcx, %rsi
	cmovneq	%rax, %rsi
	movq	(%rsi), %rsi
	movq	%r8, %rbx
	cmovneq	%rdi, %rbx
	shlq	$4, %rsi
	addq	(%rbx), %rsi
	testb	%dl, %dl
	cmoveq	(%rdi), %rsi
	movq	%rsi, (%rbx)
	movb	-9(%rsp), %dl
	testb	%dl, %dl
	movq	%rcx, %rsi
	cmovneq	%rax, %rsi
	movq	(%rsi), %rsi
	movq	%r8, %rbx
	cmovneq	%rdi, %rbx
	addq	%rsi, %rsi
	addq	(%rbx), %rsi
	testb	%dl, %dl
	cmoveq	(%rdi), %rsi
	movq	%rsi, (%rbx)
	movb	-9(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%rax, %rcx
	cmovneq	%rdi, %r8
	movq	(%r8), %rax
	addq	(%rcx), %rax
	testb	%dl, %dl
	cmoveq	(%rdi), %rax
	movq	%rax, (%r8)
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end13:
	.size	freduce_degree, .Lfunc_end13-freduce_degree
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function freduce_coefficients
	.type	freduce_coefficients,@function
freduce_coefficients:                   # @freduce_coefficients
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%edx, %r14d
	movq	%rsi, %rbp
	movq	%rdi, %rbx
	movl	%r14d, %eax
	andb	$1, %al
	movb	%al, 7(%rsp)
	leaq	80(%rdi), %rcx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	cmpq	$10, %rsi
	movq	%rsi, 8(%rsp)           # 8-byte Spill
	leaq	48(%rsp), %r15
	movq	%r15, %rdx
	cmovgq	%rcx, %rdx
	movq	%rdx, 24(%rsp)          # 8-byte Spill
	xorl	%edi, %edi
	testb	%al, %al
	movq	%rdx, %rax
	cmovneq	%rcx, %rax
	movq	80(%rbx), %rcx
	cmovneq	%rdi, %rcx
	movq	%rcx, (%rax)
	movq	(%rbx), %rdi
	movl	%r14d, %esi
	callq	div_by_2_26
	movq	%rax, %rcx
	shlq	$26, %rcx
	movq	(%rbx), %rdx
	movq	%rdx, %rsi
	subq	%rcx, %rsi
	cmpb	$0, 7(%rsp)
	cmoveq	%rdx, %rsi
	movq	%rsi, (%rbx)
	leaq	8(%rbx), %rsi
	cmpq	$1, %rbp
	movb	7(%rsp), %cl
	movq	%r15, %rdi
	cmovgq	%rsi, %rdi
	testb	%cl, %cl
	movq	%rdi, %rdx
	cmovneq	%rsi, %rdx
	addq	(%rdx), %rax
	testb	%cl, %cl
	cmoveq	8(%rbx), %rax
	movq	%rax, (%rdx)
	cmpb	$0, 7(%rsp)
	movq	%rdi, %rax
	movq	%rdi, %rbp
	movq	%rdi, 40(%rsp)          # 8-byte Spill
	cmovneq	%rsi, %rax
	movq	%rsi, %r12
	movq	%rsi, 32(%rsp)          # 8-byte Spill
	movq	(%rax), %rdi
	movl	%r14d, %esi
	callq	div_by_2_25
	movq	%rax, %rcx
	shlq	$25, %rcx
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	%rbp, %rsi
	cmovneq	%r12, %rsi
	movq	(%rsi), %rdi
	subq	%rcx, %rdi
	testb	%dl, %dl
	cmoveq	8(%rbx), %rdi
	movq	%rdi, (%rsi)
	leaq	16(%rbx), %r13
	movq	8(%rsp), %rbp           # 8-byte Reload
	cmpq	$2, %rbp
	movb	7(%rsp), %cl
	movq	%r15, %r12
	cmovgq	%r13, %r12
	testb	%cl, %cl
	movq	%r12, %rdx
	cmovneq	%r13, %rdx
	addq	(%rdx), %rax
	testb	%cl, %cl
	cmoveq	16(%rbx), %rax
	movq	%rax, (%rdx)
	cmpb	$0, 7(%rsp)
	movq	%r12, %rax
	cmovneq	%r13, %rax
	movq	(%rax), %rdi
	movl	%r14d, %esi
	callq	div_by_2_26
	movq	%rax, %rcx
	shlq	$26, %rcx
	movb	7(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%r13, %r12
	movq	(%r12), %rsi
	subq	%rcx, %rsi
	testb	%dl, %dl
	cmoveq	16(%rbx), %rsi
	movq	%rsi, (%r12)
	leaq	24(%rbx), %r12
	cmpq	$3, %rbp
	movb	7(%rsp), %cl
	movq	%r15, %rbp
	cmovgq	%r12, %rbp
	testb	%cl, %cl
	movq	%rbp, %rdx
	cmovneq	%r12, %rdx
	addq	(%rdx), %rax
	testb	%cl, %cl
	cmoveq	24(%rbx), %rax
	movq	%rax, (%rdx)
	cmpb	$0, 7(%rsp)
	movq	%rbp, %rax
	cmovneq	%r12, %rax
	movq	(%rax), %rdi
	movl	%r14d, %r13d
	movl	%r14d, %esi
	callq	div_by_2_25
	movq	%rax, %rcx
	shlq	$25, %rcx
	movb	7(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%r12, %rbp
	movq	(%rbp), %rsi
	subq	%rcx, %rsi
	testb	%dl, %dl
	cmoveq	24(%rbx), %rsi
	movq	%rsi, (%rbp)
	leaq	32(%rbx), %r12
	movq	8(%rsp), %r14           # 8-byte Reload
	cmpq	$4, %r14
	movb	7(%rsp), %cl
	movq	%r15, %rbp
	cmovgq	%r12, %rbp
	testb	%cl, %cl
	movq	%rbp, %rdx
	cmovneq	%r12, %rdx
	addq	(%rdx), %rax
	testb	%cl, %cl
	cmoveq	32(%rbx), %rax
	movq	%rax, (%rdx)
	cmpb	$0, 7(%rsp)
	movq	%rbp, %rax
	cmovneq	%r12, %rax
	movq	(%rax), %rdi
	movl	%r13d, %esi
	callq	div_by_2_26
	movq	%rax, %rcx
	shlq	$26, %rcx
	movb	7(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%r12, %rbp
	movq	(%rbp), %rsi
	subq	%rcx, %rsi
	testb	%dl, %dl
	cmoveq	32(%rbx), %rsi
	movq	%rsi, (%rbp)
	leaq	40(%rbx), %r12
	cmpq	$5, %r14
	movb	7(%rsp), %cl
	movq	%r15, %rbp
	cmovgq	%r12, %rbp
	testb	%cl, %cl
	movq	%rbp, %rdx
	cmovneq	%r12, %rdx
	addq	(%rdx), %rax
	testb	%cl, %cl
	cmoveq	40(%rbx), %rax
	movq	%rax, (%rdx)
	cmpb	$0, 7(%rsp)
	movq	%rbp, %rax
	cmovneq	%r12, %rax
	movq	(%rax), %rdi
	movl	%r13d, %esi
	callq	div_by_2_25
	movq	%rax, %rcx
	shlq	$25, %rcx
	movb	7(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%r12, %rbp
	movq	(%rbp), %rsi
	subq	%rcx, %rsi
	testb	%dl, %dl
	cmoveq	40(%rbx), %rsi
	movq	%rsi, (%rbp)
	leaq	48(%rbx), %r12
	cmpq	$6, %r14
	movb	7(%rsp), %cl
	movq	%r15, %rbp
	cmovgq	%r12, %rbp
	testb	%cl, %cl
	movq	%rbp, %rdx
	cmovneq	%r12, %rdx
	addq	(%rdx), %rax
	testb	%cl, %cl
	cmoveq	48(%rbx), %rax
	movq	%rax, (%rdx)
	cmpb	$0, 7(%rsp)
	movq	%rbp, %rax
	cmovneq	%r12, %rax
	movq	(%rax), %rdi
	movl	%r13d, %esi
	callq	div_by_2_26
	movq	%rax, %rcx
	shlq	$26, %rcx
	movb	7(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%r12, %rbp
	movq	(%rbp), %rsi
	subq	%rcx, %rsi
	testb	%dl, %dl
	cmoveq	48(%rbx), %rsi
	movq	%rsi, (%rbp)
	leaq	56(%rbx), %r12
	cmpq	$7, %r14
	movb	7(%rsp), %cl
	movq	%r15, %rbp
	cmovgq	%r12, %rbp
	testb	%cl, %cl
	movq	%rbp, %rdx
	cmovneq	%r12, %rdx
	addq	(%rdx), %rax
	testb	%cl, %cl
	cmoveq	56(%rbx), %rax
	movq	%rax, (%rdx)
	cmpb	$0, 7(%rsp)
	movq	%rbp, %rax
	cmovneq	%r12, %rax
	movq	(%rax), %rdi
	movl	%r13d, %esi
	callq	div_by_2_25
	movq	%rax, %rcx
	shlq	$25, %rcx
	movb	7(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%r12, %rbp
	movq	(%rbp), %rsi
	subq	%rcx, %rsi
	testb	%dl, %dl
	cmoveq	56(%rbx), %rsi
	movq	%rsi, (%rbp)
	leaq	64(%rbx), %r12
	cmpq	$8, %r14
	movb	7(%rsp), %cl
	movq	%r15, %rbp
	cmovgq	%r12, %rbp
	testb	%cl, %cl
	movq	%rbp, %rdx
	cmovneq	%r12, %rdx
	addq	(%rdx), %rax
	testb	%cl, %cl
	cmoveq	64(%rbx), %rax
	movq	%rax, (%rdx)
	cmpb	$0, 7(%rsp)
	movq	%rbp, %rax
	cmovneq	%r12, %rax
	movq	(%rax), %rdi
	movl	%r13d, %esi
	callq	div_by_2_26
	movq	%rax, %rcx
	shlq	$26, %rcx
	movb	7(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%r12, %rbp
	movq	(%rbp), %rsi
	subq	%rcx, %rsi
	testb	%dl, %dl
	cmoveq	64(%rbx), %rsi
	movq	%rsi, (%rbp)
	leaq	72(%rbx), %rbp
	cmpq	$9, %r14
	movb	7(%rsp), %cl
	cmovgq	%rbp, %r15
	testb	%cl, %cl
	movq	%r15, %rdx
	cmovneq	%rbp, %rdx
	addq	(%rdx), %rax
	testb	%cl, %cl
	cmoveq	72(%rbx), %rax
	movq	%rax, (%rdx)
	cmpb	$0, 7(%rsp)
	movq	%r15, %rax
	cmovneq	%rbp, %rax
	movq	(%rax), %rdi
	movl	%r13d, %esi
	callq	div_by_2_25
	movq	%rax, %rcx
	shlq	$25, %rcx
	movb	7(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%rbp, %r15
	movq	(%r15), %rsi
	subq	%rcx, %rsi
	testb	%dl, %dl
	cmoveq	72(%rbx), %rsi
	movq	%rsi, (%r15)
	movb	7(%rsp), %cl
	testb	%cl, %cl
	movq	24(%rsp), %rsi          # 8-byte Reload
	movq	%rsi, %rdx
	movq	16(%rsp), %rdi          # 8-byte Reload
	cmovneq	%rdi, %rdx
	addq	(%rdx), %rax
	testb	%cl, %cl
	cmoveq	80(%rbx), %rax
	movq	%rax, (%rdx)
	movb	7(%rsp), %al
	testb	%al, %al
	movq	%rsi, %rcx
	cmovneq	%rdi, %rcx
	movq	(%rcx), %rcx
	shlq	$4, %rcx
	movq	(%rbx), %rdx
	addq	%rdx, %rcx
	testb	%al, %al
	cmoveq	%rdx, %rcx
	movq	%rcx, (%rbx)
	cmpb	$0, 7(%rsp)
	movq	%rsi, %rax
	cmovneq	%rdi, %rax
	movq	(%rax), %rax
	leaq	(%rcx,%rax,2), %rax
	cmoveq	%rcx, %rax
	movq	%rax, (%rbx)
	movb	7(%rsp), %cl
	testb	%cl, %cl
	movq	%rsi, %rdx
	cmovneq	%rdi, %rdx
	movq	(%rdx), %rdx
	addq	%rax, %rdx
	testb	%cl, %cl
	cmoveq	%rax, %rdx
	movq	%rdx, (%rbx)
	cmpb	$0, 7(%rsp)
	cmovneq	%rdi, %rsi
	movl	$0, %eax
	cmoveq	80(%rbx), %rax
	movq	%rax, (%rsi)
	movq	(%rbx), %rdi
	movl	%r13d, %esi
	callq	div_by_2_26
	movq	%rax, %rcx
	shlq	$26, %rcx
	movq	(%rbx), %rdx
	movq	%rdx, %rsi
	subq	%rcx, %rsi
	cmpb	$0, 7(%rsp)
	cmoveq	%rdx, %rsi
	movq	%rsi, (%rbx)
	movb	7(%rsp), %cl
	testb	%cl, %cl
	movq	40(%rsp), %rdx          # 8-byte Reload
	cmovneq	32(%rsp), %rdx          # 8-byte Folded Reload
	addq	(%rdx), %rax
	testb	%cl, %cl
	cmoveq	8(%rbx), %rax
	movq	%rax, (%rdx)
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end14:
	.size	freduce_coefficients, .Lfunc_end14-freduce_coefficients
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function div_by_2_26
	.type	div_by_2_26,@function
div_by_2_26:                            # @div_by_2_26
	.cfi_startproc
# %bb.0:
	andl	$1, %esi
	movb	%sil, -9(%rsp)
	movq	%rdi, %rax
	sarq	$63, %rax
	shrl	$6, %eax
	addq	%rdi, %rax
	sarq	$26, %rax
	retq
.Lfunc_end15:
	.size	div_by_2_26, .Lfunc_end15-div_by_2_26
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function div_by_2_25
	.type	div_by_2_25,@function
div_by_2_25:                            # @div_by_2_25
	.cfi_startproc
# %bb.0:
	andl	$1, %esi
	movb	%sil, -9(%rsp)
	movq	%rdi, %rax
	sarq	$63, %rax
	shrl	$7, %eax
	addq	%rdi, %rax
	sarq	$25, %rax
	retq
.Lfunc_end16:
	.size	div_by_2_25, .Lfunc_end16-div_by_2_25
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fsquare
	.type	fsquare,@function
fsquare:                                # @fsquare
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$176, %rsp
	.cfi_def_cfa_offset 208
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	%r8d, %ebx
	movq	%rdi, %r14
	movl	%r8d, %eax
	andl	$1, %eax
	movb	%al, 15(%rsp)
	leaq	16(%rsp), %r15
	movl	$19, %esi
	movq	%r15, %rdi
	callq	fsquare_inner
	movl	$19, %esi
	movq	%r15, %rdi
	movl	%ebx, %edx
	callq	freduce_degree
	movl	$19, %esi
	movq	%r15, %rdi
	movl	%ebx, %edx
	callq	freduce_coefficients
	movl	$10, %ecx
	movq	%r14, %rdi
	movq	%r15, %rsi
	rep;movsq (%rsi), %es:(%rdi)
	addq	$176, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end17:
	.size	fsquare, .Lfunc_end17-fsquare
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fsquare_inner
	.type	fsquare_inner,@function
fsquare_inner:                          # @fsquare_inner
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$64, %rsp
	.cfi_def_cfa_offset 120
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %r13
	andb	$1, %r8b
	movb	%r8b, -121(%rsp)
	testq	%rcx, %rcx
	movq	%rcx, %rbx
	leaq	-120(%rsp), %rax
	movq	%rax, %rcx
	movq	%rax, %r11
	cmovgq	%rdx, %rcx
	testb	%r8b, %r8b
	movq	%rcx, %rax
	movq	%rcx, %r9
	cmovneq	%rdx, %rax
	movslq	(%rax), %rax
	imulq	%rax, %rax
	testb	%r8b, %r8b
	cmoveq	(%rdi), %rax
	testq	%rsi, %rsi
	movq	%rsi, %r10
	movq	%r11, %rcx
	cmovgq	%rdi, %rcx
	testb	%r8b, %r8b
	cmovneq	%rdi, %rcx
	movq	%rax, (%rcx)
	leaq	8(%rdx), %rbp
	cmpq	$1, %rbx
	movq	%rbx, %r15
	movb	-121(%rsp), %al
	movq	%r11, %rbx
	cmovgq	%rbp, %rbx
	testb	%al, %al
	movq	%r9, %rcx
	cmovneq	%rdx, %rcx
	movslq	(%rcx), %rcx
	movq	%rbx, %rsi
	movq	%rbx, %r8
	cmovneq	%rbp, %rsi
	movq	%rbp, %rdx
	movslq	(%rsi), %rsi
	imulq	%rcx, %rsi
	addq	%rsi, %rsi
	testb	%al, %al
	movq	%rdi, -112(%rsp)        # 8-byte Spill
	cmoveq	8(%rdi), %rsi
	leaq	8(%rdi), %rcx
	cmpq	$1, %r10
	movq	%r11, %rbp
	cmovgq	%rcx, %rbp
	testb	%al, %al
	cmovneq	%rcx, %rbp
	movq	%rsi, (%rbp)
	leaq	16(%r13), %rbx
	cmpq	$2, %r15
	movb	-121(%rsp), %al
	movq	%r11, %rbp
	cmovgq	%rbx, %rbp
	testb	%al, %al
	movq	%r8, %rcx
	movq	%r8, %rdi
	movq	%r8, -16(%rsp)          # 8-byte Spill
	cmovneq	%rdx, %rcx
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	movslq	(%rcx), %rcx
	movq	%r9, %rsi
	movq	%r9, %r12
	movq	%r9, 24(%rsp)           # 8-byte Spill
	cmovneq	%r13, %rsi
	movslq	(%rsi), %r8
	movq	%rbp, %rsi
	movq	%rbp, %r14
	cmovneq	%rbx, %rsi
	imulq	%rcx, %rcx
	movslq	(%rsi), %rbp
	imulq	%r8, %rbp
	addq	%rcx, %rbp
	addq	%rbp, %rbp
	testb	%al, %al
	movq	-112(%rsp), %rcx        # 8-byte Reload
	cmoveq	16(%rcx), %rbp
	addq	$16, %rcx
	cmpq	$2, %r10
	movq	%r10, %r11
	movq	%r10, -104(%rsp)        # 8-byte Spill
	leaq	-120(%rsp), %r10
	movq	%r10, %rsi
	cmovgq	%rcx, %rsi
	testb	%al, %al
	cmovneq	%rcx, %rsi
	movq	%rbp, (%rsi)
	leaq	24(%r13), %rax
	movq	%r15, %r9
	movq	%r15, -96(%rsp)         # 8-byte Spill
	cmpq	$3, %r15
	movb	-121(%rsp), %r8b
	movq	%r10, %rcx
	cmovgq	%rax, %rcx
	movq	%rax, %r10
	movq	%rcx, %rax
	testb	%r8b, %r8b
	cmovneq	%rdx, %rdi
	movslq	(%rdi), %rcx
	movq	%r14, %rsi
	movq	%r14, %rdx
	movq	%r14, -88(%rsp)         # 8-byte Spill
	cmovneq	%rbx, %rsi
	movq	%rbx, %r15
	movslq	(%rsi), %rsi
	movq	%r12, %rbp
	cmovneq	%r13, %rbp
	movq	%rax, %rbx
	movq	%rax, %r12
	cmovneq	%r10, %rbx
	movq	%r10, %r14
	imulq	%rcx, %rsi
	movslq	(%rbp), %rcx
	movslq	(%rbx), %rbp
	imulq	%rcx, %rbp
	addq	%rsi, %rbp
	addq	%rbp, %rbp
	testb	%r8b, %r8b
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	24(%rax), %rbp
	leaq	24(%rax), %rcx
	cmpq	$3, %r11
	leaq	-120(%rsp), %rax
	movq	%rax, %rsi
	cmovgq	%rcx, %rsi
	testb	%r8b, %r8b
	cmovneq	%rcx, %rsi
	movq	%rbp, (%rsi)
	leaq	32(%r13), %rsi
	cmpq	$4, %r9
	movb	-121(%rsp), %r10b
	movq	%rax, %rcx
	cmovgq	%rsi, %rcx
	movq	%rsi, %r11
	movq	%rsi, -24(%rsp)         # 8-byte Spill
	movq	%rcx, %rax
	testb	%r10b, %r10b
	movq	%rdx, %rcx
	cmovneq	%r15, %rcx
	movq	%r15, %r9
	movq	%r15, (%rsp)            # 8-byte Spill
	movq	-16(%rsp), %rsi         # 8-byte Reload
	cmovneq	16(%rsp), %rsi          # 8-byte Folded Reload
	movslq	(%rsi), %r8
	movq	%r12, %rbp
	movq	%r12, -40(%rsp)         # 8-byte Spill
	cmovneq	%r14, %rbp
	movq	%r14, %rdx
	movq	%r14, -72(%rsp)         # 8-byte Spill
	movslq	(%rbp), %rbp
	movq	24(%rsp), %rdi          # 8-byte Reload
	movq	%rdi, %rbx
	cmovneq	%r13, %rbx
	movq	%rax, %rsi
	movq	%rax, %r15
	movq	%rax, -64(%rsp)         # 8-byte Spill
	cmovneq	%r11, %rsi
	imulq	%r8, %rbp
	movslq	(%rbx), %rbx
	movslq	(%rsi), %rsi
	imulq	%rbx, %rsi
	movslq	(%rcx), %rcx
	imulq	%rcx, %rcx
	leaq	(%rcx,%rbp,4), %rcx
	leaq	(%rcx,%rsi,2), %rcx
	testb	%r10b, %r10b
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	32(%rax), %rcx
	cmpq	$4, -104(%rsp)          # 8-byte Folded Reload
	leaq	32(%rax), %rsi
	leaq	-120(%rsp), %rax
	movq	%rax, %rbp
	cmovgq	%rsi, %rbp
	testb	%r10b, %r10b
	cmovneq	%rsi, %rbp
	movq	%rcx, (%rbp)
	leaq	40(%r13), %rcx
	cmpq	$5, -96(%rsp)           # 8-byte Folded Reload
	cmovgq	%rcx, %rax
	movq	%rcx, %r10
	movq	%rax, %r11
	movb	-121(%rsp), %r14b
	testb	%r14b, %r14b
	movq	-88(%rsp), %rcx         # 8-byte Reload
	cmovneq	%r9, %rcx
	movslq	(%rcx), %r8
	cmovneq	%rdx, %r12
	movslq	(%r12), %rsi
	movq	-16(%rsp), %r9          # 8-byte Reload
	movq	%r9, %rbx
	movq	16(%rsp), %rdx          # 8-byte Reload
	cmovneq	%rdx, %rbx
	movq	%r15, %rcx
	movq	-24(%rsp), %r15         # 8-byte Reload
	cmovneq	%r15, %rcx
	movq	%rdi, %rax
	cmovneq	%r13, %rax
	movq	%r11, %rbp
	movq	%r11, %rdi
	movq	%r11, 8(%rsp)           # 8-byte Spill
	cmovneq	%r10, %rbp
	movq	%r10, -80(%rsp)         # 8-byte Spill
	imulq	%r8, %rsi
	movslq	(%rbx), %rbx
	movslq	(%rcx), %rcx
	imulq	%rbx, %rcx
	addq	%rsi, %rcx
	movslq	(%rax), %rax
	movslq	(%rbp), %rsi
	imulq	%rax, %rsi
	addq	%rcx, %rsi
	addq	%rsi, %rsi
	testb	%r14b, %r14b
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	40(%rax), %rsi
	cmpq	$5, -104(%rsp)          # 8-byte Folded Reload
	leaq	40(%rax), %rax
	leaq	-120(%rsp), %rbx
	movq	%rbx, %rcx
	cmovgq	%rax, %rcx
	testb	%r14b, %r14b
	cmovneq	%rax, %rcx
	movq	%rsi, (%rcx)
	movb	-121(%rsp), %r14b
	testb	%r14b, %r14b
	movq	%r9, %r11
	cmovneq	%rdx, %r11
	movq	%rdi, %rsi
	cmovneq	%r10, %rsi
	movq	-96(%rsp), %r12         # 8-byte Reload
	cmpq	$6, %r12
	leaq	48(%r13), %rdx
	movq	%rbx, %rcx
	cmovgq	%rdx, %rcx
	movq	%rdx, -56(%rsp)         # 8-byte Spill
	movq	%rcx, -48(%rsp)         # 8-byte Spill
	testb	%r14b, %r14b
	movq	-40(%rsp), %rbp         # 8-byte Reload
	movq	-72(%rsp), %r9          # 8-byte Reload
	cmovneq	%r9, %rbp
	movq	-88(%rsp), %rbx         # 8-byte Reload
	cmovneq	(%rsp), %rbx            # 8-byte Folded Reload
	movslq	(%rbx), %r8
	movq	-64(%rsp), %r10         # 8-byte Reload
	movq	%r10, %rbx
	movq	%r15, %rdi
	cmovneq	%r15, %rbx
	movslq	(%rbx), %rbx
	movq	24(%rsp), %rax          # 8-byte Reload
	cmovneq	%r13, %rax
	cmovneq	%rdx, %rcx
	imulq	%r8, %rbx
	movslq	(%rbp), %rbp
	imulq	%rbp, %rbp
	addq	%rbp, %rbx
	movslq	(%rax), %rax
	movslq	(%rcx), %rbp
	imulq	%rax, %rbp
	addq	%rbx, %rbp
	movslq	(%r11), %rax
	movslq	(%rsi), %rcx
	imulq	%rax, %rcx
	leaq	(%rbp,%rcx,2), %rax
	addq	%rax, %rax
	testb	%r14b, %r14b
	movq	-112(%rsp), %rcx        # 8-byte Reload
	cmoveq	48(%rcx), %rax
	cmpq	$6, -104(%rsp)          # 8-byte Folded Reload
	leaq	48(%rcx), %rcx
	leaq	-120(%rsp), %rdx
	movq	%rdx, %rsi
	cmovgq	%rcx, %rsi
	testb	%r14b, %r14b
	cmovneq	%rcx, %rsi
	movq	%rax, (%rsi)
	cmpq	$7, %r12
	movq	%r13, %r12
	movq	%r13, 56(%rsp)          # 8-byte Spill
	leaq	56(%r13), %rax
	movq	%rdx, %rcx
	cmovgq	%rax, %rcx
	movq	%rcx, %r8
	movq	%rax, %r11
	movb	-121(%rsp), %r15b
	testb	%r15b, %r15b
	movq	-40(%rsp), %rcx         # 8-byte Reload
	cmovneq	%r9, %rcx
	movslq	(%rcx), %r14
	movq	%r10, %rsi
	cmovneq	%rdi, %rsi
	movslq	(%rsi), %rsi
	movq	-88(%rsp), %rbx         # 8-byte Reload
	cmovneq	(%rsp), %rbx            # 8-byte Folded Reload
	movq	8(%rsp), %r9            # 8-byte Reload
	movq	%r9, %rbp
	movq	-80(%rsp), %r13         # 8-byte Reload
	cmovneq	%r13, %rbp
	movq	-16(%rsp), %rdx         # 8-byte Reload
	movq	%rdx, %rcx
	movq	16(%rsp), %rdi          # 8-byte Reload
	cmovneq	%rdi, %rcx
	movq	-48(%rsp), %rax         # 8-byte Reload
	cmovneq	-56(%rsp), %rax         # 8-byte Folded Reload
	movq	24(%rsp), %r10          # 8-byte Reload
	cmovneq	%r12, %r10
	movq	%r8, %r12
	movq	%r8, -8(%rsp)           # 8-byte Spill
	movq	%r11, -32(%rsp)         # 8-byte Spill
	cmovneq	%r11, %r8
	imulq	%r14, %rsi
	movslq	(%rbx), %rbx
	movslq	(%rbp), %rbp
	imulq	%rbx, %rbp
	addq	%rsi, %rbp
	movslq	(%rcx), %rcx
	movslq	(%rax), %rax
	imulq	%rcx, %rax
	addq	%rbp, %rax
	movslq	(%r10), %rcx
	movslq	(%r8), %rsi
	imulq	%rcx, %rsi
	addq	%rax, %rsi
	addq	%rsi, %rsi
	testb	%r15b, %r15b
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	56(%rax), %rsi
	cmpq	$7, -104(%rsp)          # 8-byte Folded Reload
	leaq	56(%rax), %rax
	leaq	-120(%rsp), %r8
	movq	%r8, %rcx
	cmovgq	%rax, %rcx
	testb	%r15b, %r15b
	cmovneq	%rax, %rcx
	movq	%rsi, (%rcx)
	movb	-121(%rsp), %r10b
	testb	%r10b, %r10b
	movq	%rdx, %rcx
	cmovneq	%rdi, %rcx
	movq	%r12, %rbp
	cmovneq	%r11, %rbp
	movq	-40(%rsp), %r14         # 8-byte Reload
	cmovneq	-72(%rsp), %r14         # 8-byte Folded Reload
	cmovneq	%r13, %r9
	movq	-96(%rsp), %rdi         # 8-byte Reload
	cmpq	$8, %rdi
	movq	56(%rsp), %rbx          # 8-byte Reload
	leaq	64(%rbx), %rdx
	cmovgq	%rdx, %r8
	movq	%rdx, 40(%rsp)          # 8-byte Spill
	movq	%r8, 32(%rsp)           # 8-byte Spill
	testb	%r10b, %r10b
	movq	-64(%rsp), %r13         # 8-byte Reload
	movq	%r13, %r12
	cmovneq	-24(%rsp), %r12         # 8-byte Folded Reload
	movq	-88(%rsp), %rax         # 8-byte Reload
	cmovneq	(%rsp), %rax            # 8-byte Folded Reload
	movslq	(%rax), %r15
	movq	-48(%rsp), %rax         # 8-byte Reload
	cmovneq	-56(%rsp), %rax         # 8-byte Folded Reload
	movslq	(%rax), %rax
	movq	24(%rsp), %r11          # 8-byte Reload
	cmovneq	%rbx, %r11
	cmovneq	%rdx, %r8
	imulq	%r15, %rax
	movslq	(%r11), %r11
	movslq	(%r8), %r8
	imulq	%r11, %r8
	addq	%rax, %r8
	movslq	(%rcx), %rax
	movslq	(%rbp), %rcx
	imulq	%rax, %rcx
	movslq	(%r14), %rax
	movslq	(%r9), %rbp
	imulq	%rax, %rbp
	addq	%rcx, %rbp
	leaq	(%r8,%rbp,2), %rax
	movslq	(%r12), %rcx
	imulq	%rcx, %rcx
	leaq	(%rcx,%rax,2), %rax
	testb	%r10b, %r10b
	movq	-112(%rsp), %rcx        # 8-byte Reload
	cmoveq	64(%rcx), %rax
	cmpq	$8, -104(%rsp)          # 8-byte Folded Reload
	leaq	64(%rcx), %rcx
	leaq	-120(%rsp), %r9
	movq	%r9, %rsi
	cmovgq	%rcx, %rsi
	testb	%r10b, %r10b
	cmovneq	%rcx, %rsi
	movq	%rax, (%rsi)
	cmpq	$9, %rdi
	leaq	72(%rbx), %rdi
	movq	%r9, %r10
	movq	%r9, %r8
	cmovgq	%rdi, %r10
	movq	%r10, 48(%rsp)          # 8-byte Spill
	movq	%rdi, -96(%rsp)         # 8-byte Spill
	movb	-121(%rsp), %r11b
	testb	%r11b, %r11b
	movq	24(%rsp), %r9           # 8-byte Reload
	cmovneq	%rbx, %r9
	cmovneq	-24(%rsp), %r13         # 8-byte Folded Reload
	movslq	(%r13), %r14
	movq	8(%rsp), %rsi           # 8-byte Reload
	cmovneq	-80(%rsp), %rsi         # 8-byte Folded Reload
	movslq	(%rsi), %r15
	movq	-40(%rsp), %rbp         # 8-byte Reload
	cmovneq	-72(%rsp), %rbp         # 8-byte Folded Reload
	movq	-48(%rsp), %rbx         # 8-byte Reload
	movq	-56(%rsp), %r13         # 8-byte Reload
	cmovneq	%r13, %rbx
	movq	-88(%rsp), %rcx         # 8-byte Reload
	cmovneq	(%rsp), %rcx            # 8-byte Folded Reload
	movq	-8(%rsp), %rax          # 8-byte Reload
	cmovneq	-32(%rsp), %rax         # 8-byte Folded Reload
	movq	-16(%rsp), %rdx         # 8-byte Reload
	cmovneq	16(%rsp), %rdx          # 8-byte Folded Reload
	movq	32(%rsp), %r12          # 8-byte Reload
	movq	%r12, %rsi
	cmovneq	40(%rsp), %rsi          # 8-byte Folded Reload
	cmovneq	%rdi, %r10
	imulq	%r14, %r15
	movslq	(%rbp), %rbp
	movslq	(%rbx), %rbx
	imulq	%rbp, %rbx
	addq	%r15, %rbx
	movslq	(%rcx), %rcx
	movslq	(%rax), %rax
	imulq	%rcx, %rax
	addq	%rbx, %rax
	movslq	(%rdx), %rcx
	movslq	(%rsi), %rdx
	imulq	%rcx, %rdx
	addq	%rax, %rdx
	movslq	(%r9), %rax
	movslq	(%r10), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	addq	%rcx, %rcx
	testb	%r11b, %r11b
	movq	-112(%rsp), %rdi        # 8-byte Reload
	cmoveq	72(%rdi), %rcx
	movq	-104(%rsp), %r9         # 8-byte Reload
	cmpq	$9, %r9
	leaq	72(%rdi), %rax
	movq	%r8, %rdx
	cmovgq	%rax, %rdx
	testb	%r11b, %r11b
	cmovneq	%rax, %rdx
	movq	%rcx, (%rdx)
	movb	-121(%rsp), %r10b
	testb	%r10b, %r10b
	movq	-16(%rsp), %r11         # 8-byte Reload
	cmovneq	16(%rsp), %r11          # 8-byte Folded Reload
	movq	8(%rsp), %r8            # 8-byte Reload
	movq	%r8, %r14
	cmovneq	-80(%rsp), %r14         # 8-byte Folded Reload
	movq	-64(%rsp), %rdx         # 8-byte Reload
	cmovneq	-24(%rsp), %rdx         # 8-byte Folded Reload
	movslq	(%rdx), %rax
	movq	-48(%rsp), %rsi         # 8-byte Reload
	cmovneq	%r13, %rsi
	movslq	(%rsi), %rsi
	movq	-88(%rsp), %rbp         # 8-byte Reload
	movq	(%rsp), %r13            # 8-byte Reload
	cmovneq	%r13, %rbp
	movq	%r12, %rbx
	cmovneq	40(%rsp), %rbx          # 8-byte Folded Reload
	movq	-40(%rsp), %r15         # 8-byte Reload
	cmovneq	-72(%rsp), %r15         # 8-byte Folded Reload
	movq	-8(%rsp), %rdx          # 8-byte Reload
	cmovneq	-32(%rsp), %rdx         # 8-byte Folded Reload
	movq	48(%rsp), %r12          # 8-byte Reload
	movq	%r12, %rcx
	cmovneq	-96(%rsp), %rcx         # 8-byte Folded Reload
	imulq	%rax, %rsi
	movslq	(%r14), %rax
	imulq	%rax, %rax
	addq	%rax, %rsi
	movslq	(%rbp), %rax
	movslq	(%rbx), %rbp
	imulq	%rax, %rbp
	addq	%rsi, %rbp
	movslq	(%r15), %rax
	movslq	(%rdx), %rdx
	imulq	%rax, %rdx
	movslq	(%r11), %rax
	movslq	(%rcx), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	leaq	(%rbp,%rcx,2), %rax
	addq	%rax, %rax
	testb	%r10b, %r10b
	cmoveq	80(%rdi), %rax
	cmpq	$10, %r9
	leaq	80(%rdi), %rcx
	leaq	-120(%rsp), %rdx
	cmovgq	%rcx, %rdx
	testb	%r10b, %r10b
	cmovneq	%rcx, %rdx
	movq	%rax, (%rdx)
	movb	-121(%rsp), %r10b
	testb	%r10b, %r10b
	movq	-88(%rsp), %r15         # 8-byte Reload
	cmovneq	%r13, %r15
	cmovneq	-80(%rsp), %r8          # 8-byte Folded Reload
	movslq	(%r8), %r11
	movq	-48(%rsp), %r13         # 8-byte Reload
	movq	%r13, %rdx
	movq	-56(%rsp), %r8          # 8-byte Reload
	cmovneq	%r8, %rdx
	movslq	(%rdx), %rdx
	movq	-64(%rsp), %rsi         # 8-byte Reload
	movq	-24(%rsp), %r9          # 8-byte Reload
	cmovneq	%r9, %rsi
	movq	-8(%rsp), %rbp          # 8-byte Reload
	cmovneq	-32(%rsp), %rbp         # 8-byte Folded Reload
	movq	-40(%rsp), %r14         # 8-byte Reload
	movq	%r14, %rbx
	cmovneq	-72(%rsp), %rbx         # 8-byte Folded Reload
	movq	32(%rsp), %rax          # 8-byte Reload
	movq	40(%rsp), %rdi          # 8-byte Reload
	cmovneq	%rdi, %rax
	movq	%r12, %rcx
	movq	-96(%rsp), %r12         # 8-byte Reload
	cmovneq	%r12, %rcx
	imulq	%r11, %rdx
	movslq	(%rsi), %rsi
	movslq	(%rbp), %rbp
	imulq	%rsi, %rbp
	addq	%rdx, %rbp
	movslq	(%rbx), %rdx
	movslq	(%rax), %rax
	imulq	%rdx, %rax
	addq	%rbp, %rax
	movslq	(%r15), %rdx
	movslq	(%rcx), %rcx
	imulq	%rdx, %rcx
	addq	%rax, %rcx
	addq	%rcx, %rcx
	testb	%r10b, %r10b
	movq	-112(%rsp), %rax        # 8-byte Reload
	cmoveq	88(%rax), %rcx
	movq	-104(%rsp), %r11        # 8-byte Reload
	cmpq	$11, %r11
	leaq	88(%rax), %rax
	leaq	-120(%rsp), %rdx
	cmovgq	%rax, %rdx
	testb	%r10b, %r10b
	cmovneq	%rax, %rdx
	movq	%rcx, (%rdx)
	movb	-121(%rsp), %r10b
	testb	%r10b, %r10b
	cmovneq	-72(%rsp), %r14         # 8-byte Folded Reload
	movq	%r13, %rcx
	cmovneq	%r8, %rcx
	movq	-64(%rsp), %rdx         # 8-byte Reload
	cmovneq	%r9, %rdx
	movslq	(%rdx), %rdx
	movq	32(%rsp), %r8           # 8-byte Reload
	movq	%r8, %rsi
	cmovneq	%rdi, %rsi
	movslq	(%rsi), %rsi
	movq	8(%rsp), %r15           # 8-byte Reload
	movq	%r15, %rbp
	cmovneq	-80(%rsp), %rbp         # 8-byte Folded Reload
	movq	-8(%rsp), %r9           # 8-byte Reload
	movq	%r9, %rbx
	movq	-32(%rsp), %r13         # 8-byte Reload
	cmovneq	%r13, %rbx
	movq	48(%rsp), %rax          # 8-byte Reload
	cmovneq	%r12, %rax
	imulq	%rdx, %rsi
	movslq	(%rbp), %rdx
	movslq	(%rbx), %rbp
	imulq	%rdx, %rbp
	movslq	(%r14), %rdx
	movslq	(%rax), %rax
	imulq	%rdx, %rax
	addq	%rbp, %rax
	leaq	(%rsi,%rax,2), %rax
	movslq	(%rcx), %rcx
	imulq	%rcx, %rcx
	leaq	(%rcx,%rax,2), %rax
	testb	%r10b, %r10b
	movq	-112(%rsp), %rdi        # 8-byte Reload
	cmoveq	96(%rdi), %rax
	cmpq	$12, %r11
	leaq	96(%rdi), %rcx
	leaq	-120(%rsp), %rdx
	cmovgq	%rcx, %rdx
	testb	%r10b, %r10b
	cmovneq	%rcx, %rdx
	movq	%rax, (%rdx)
	movb	-121(%rsp), %r11b
	testb	%r11b, %r11b
	movq	-64(%rsp), %rax         # 8-byte Reload
	cmovneq	-24(%rsp), %rax         # 8-byte Folded Reload
	movq	-48(%rsp), %r14         # 8-byte Reload
	movq	%r14, %rcx
	cmovneq	-56(%rsp), %rcx         # 8-byte Folded Reload
	movslq	(%rcx), %rcx
	movq	%r9, %r12
	movq	%r9, %rdx
	movq	%r13, %r9
	cmovneq	%r13, %rdx
	movslq	(%rdx), %rdx
	movq	%r15, %rsi
	movq	-80(%rsp), %r13         # 8-byte Reload
	cmovneq	%r13, %rsi
	movq	%r8, %rbp
	movq	40(%rsp), %r15          # 8-byte Reload
	cmovneq	%r15, %rbp
	movq	48(%rsp), %r10          # 8-byte Reload
	movq	%r10, %rbx
	movq	-96(%rsp), %r8          # 8-byte Reload
	cmovneq	%r8, %rbx
	imulq	%rcx, %rdx
	movslq	(%rsi), %rcx
	movslq	(%rbp), %rsi
	imulq	%rcx, %rsi
	addq	%rdx, %rsi
	movslq	(%rax), %rcx
	movslq	(%rbx), %rdx
	imulq	%rcx, %rdx
	addq	%rsi, %rdx
	addq	%rdx, %rdx
	testb	%r11b, %r11b
	cmoveq	104(%rdi), %rdx
	cmpq	$13, -104(%rsp)         # 8-byte Folded Reload
	leaq	104(%rdi), %rcx
	leaq	-120(%rsp), %rsi
	cmovgq	%rcx, %rsi
	testb	%r11b, %r11b
	cmovneq	%rcx, %rsi
	movq	%rdx, (%rsi)
	movb	-121(%rsp), %al
	testb	%al, %al
	movq	%r12, %rcx
	cmovneq	%r9, %rcx
	movq	8(%rsp), %rbx           # 8-byte Reload
	cmovneq	%r13, %rbx
	movq	%r14, %rdx
	movq	-56(%rsp), %r11         # 8-byte Reload
	cmovneq	%r11, %rdx
	movslq	(%rdx), %rdx
	movq	32(%rsp), %r12          # 8-byte Reload
	movq	%r12, %rsi
	cmovneq	%r15, %rsi
	movslq	(%rsi), %rsi
	movq	%r10, %rbp
	cmovneq	%r8, %rbp
	imulq	%rdx, %rsi
	movslq	(%rcx), %rcx
	imulq	%rcx, %rcx
	addq	%rcx, %rsi
	movslq	(%rbx), %rcx
	movslq	(%rbp), %rdx
	imulq	%rcx, %rdx
	leaq	(%rsi,%rdx,2), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	112(%rdi), %rcx
	leaq	112(%rdi), %rdx
	movq	%rdi, %r13
	movq	-104(%rsp), %rbp        # 8-byte Reload
	cmpq	$14, %rbp
	leaq	-120(%rsp), %rsi
	cmovgq	%rdx, %rsi
	testb	%al, %al
	cmovneq	%rdx, %rsi
	movq	%rcx, (%rsi)
	movb	-121(%rsp), %al
	testb	%al, %al
	movq	-8(%rsp), %r9           # 8-byte Reload
	movq	%r9, %rcx
	cmovneq	-32(%rsp), %rcx         # 8-byte Folded Reload
	movslq	(%rcx), %rcx
	movq	%r12, %rdx
	cmovneq	%r15, %rdx
	movslq	(%rdx), %rdx
	movq	%r14, %rbx
	cmovneq	%r11, %rbx
	movq	%r10, %r14
	movq	%r10, %rsi
	cmovneq	%r8, %rsi
	imulq	%rcx, %rdx
	movslq	(%rbx), %rcx
	movslq	(%rsi), %rsi
	imulq	%rcx, %rsi
	addq	%rdx, %rsi
	addq	%rsi, %rsi
	testb	%al, %al
	cmoveq	120(%rdi), %rsi
	leaq	120(%rdi), %rcx
	cmpq	$15, %rbp
	leaq	-120(%rsp), %r10
	movq	%r10, %rdx
	cmovgq	%rcx, %rdx
	testb	%al, %al
	cmovneq	%rcx, %rdx
	movq	%rsi, (%rdx)
	movb	-121(%rsp), %al
	testb	%al, %al
	movq	%r12, %rcx
	cmovneq	%r15, %rcx
	movslq	(%rcx), %rcx
	cmovneq	-32(%rsp), %r9          # 8-byte Folded Reload
	movslq	(%r9), %rdx
	movq	%r14, %rsi
	cmovneq	%r8, %rsi
	imulq	%rcx, %rcx
	movslq	(%rsi), %rsi
	imulq	%rdx, %rsi
	testb	%al, %al
	leaq	(%rcx,%rsi,4), %rcx
	cmoveq	128(%rdi), %rcx
	leaq	128(%rdi), %rdx
	cmpq	$16, %rbp
	movq	%r10, %rsi
	cmovgq	%rdx, %rsi
	testb	%al, %al
	cmovneq	%rdx, %rsi
	movq	%rcx, (%rsi)
	movb	-121(%rsp), %al
	testb	%al, %al
	cmovneq	%r15, %r12
	movslq	(%r12), %rcx
	movq	%r14, %rdx
	cmovneq	%r8, %rdx
	movslq	(%rdx), %rdx
	imulq	%rcx, %rdx
	addq	%rdx, %rdx
	testb	%al, %al
	cmoveq	136(%rdi), %rdx
	leaq	136(%rdi), %rcx
	cmpq	$17, %rbp
	movq	%r10, %rsi
	cmovgq	%rcx, %rsi
	testb	%al, %al
	cmovneq	%rcx, %rsi
	movq	%rdx, (%rsi)
	movb	-121(%rsp), %al
	testb	%al, %al
	movq	%r14, %rcx
	cmovneq	%r8, %rcx
	movslq	(%rcx), %rcx
	imulq	%rcx, %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	movq	%rdi, %rsi
	cmoveq	144(%r13), %rcx
	addq	$144, %rsi
	cmpq	$18, %rbp
	movq	%r10, %rdx
	cmovgq	%rsi, %rdx
	testb	%al, %al
	cmovneq	%rsi, %rdx
	movq	%rcx, (%rdx)
	addq	$64, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end18:
	.size	fsquare_inner, .Lfunc_end18-fsquare_inner
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function swap_conditional
	.type	swap_conditional,@function
swap_conditional:                       # @swap_conditional
	.cfi_startproc
# %bb.0:                                # %.loopexit
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	%r9d, %eax
	andb	$1, %al
	movb	%al, -10(%rsp)
	cmpq	$1, %r8
	setne	%r8b
	sete	%al
	andb	%r9b, %al
	movb	%al, -11(%rsp)
	movq	(%rdi), %r9
	movq	(%rdx), %rax
	cmoveq	%r9, %rax
	movq	%rax, (%rdi)
	movslq	%r9d, %rax
	cmpb	$0, -11(%rsp)
	cmoveq	(%rdx), %rax
	movq	%rax, (%rdx)
	leaq	8(%rdi), %r9
	cmpq	$1, %rsi
	leaq	-8(%rsp), %r10
	movq	%r10, %rax
	cmovgq	%r9, %rax
	leaq	8(%rdx), %r11
	cmpq	$1, %rcx
	movq	%r10, %r15
	cmovgq	%r11, %r15
	cmpb	$0, -11(%rsp)
	cmovneq	%r9, %rax
	movslq	(%rax), %r14
	movq	%r15, %rbx
	cmovneq	%r11, %rbx
	cmoveq	%r9, %rbx
	movq	(%rbx), %rbx
	movq	%rbx, (%rax)
	cmpb	$0, -11(%rsp)
	cmovneq	%r11, %r15
	cmoveq	8(%rdx), %r14
	movq	%r14, (%r15)
	leaq	16(%rdi), %r11
	cmpq	$2, %rsi
	movq	%r10, %rbx
	cmovgq	%r11, %rbx
	leaq	16(%rdx), %r9
	cmpq	$2, %rcx
	movq	%r10, %r15
	cmovgq	%r9, %r15
	cmpb	$0, -11(%rsp)
	cmovneq	%r11, %rbx
	movslq	(%rbx), %r14
	movq	%r15, %rax
	cmovneq	%r9, %rax
	cmoveq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, (%rbx)
	cmpb	$0, -11(%rsp)
	cmovneq	%r9, %r15
	cmoveq	16(%rdx), %r14
	movq	%r14, (%r15)
	leaq	24(%rdi), %r11
	cmpq	$3, %rsi
	movq	%r10, %rbx
	cmovgq	%r11, %rbx
	leaq	24(%rdx), %r9
	cmpq	$3, %rcx
	movq	%r10, %r15
	cmovgq	%r9, %r15
	cmpb	$0, -11(%rsp)
	cmovneq	%r11, %rbx
	movslq	(%rbx), %r14
	movq	%r15, %rax
	cmovneq	%r9, %rax
	cmoveq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, (%rbx)
	cmpb	$0, -11(%rsp)
	cmovneq	%r9, %r15
	cmoveq	24(%rdx), %r14
	movq	%r14, (%r15)
	leaq	32(%rdi), %r11
	cmpq	$4, %rsi
	movq	%r10, %rbx
	cmovgq	%r11, %rbx
	leaq	32(%rdx), %r9
	cmpq	$4, %rcx
	movq	%r10, %r15
	cmovgq	%r9, %r15
	cmpb	$0, -11(%rsp)
	cmovneq	%r11, %rbx
	movslq	(%rbx), %r14
	movq	%r15, %rax
	cmovneq	%r9, %rax
	cmoveq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, (%rbx)
	cmpb	$0, -11(%rsp)
	cmovneq	%r9, %r15
	cmoveq	32(%rdx), %r14
	movq	%r14, (%r15)
	leaq	40(%rdi), %r11
	cmpq	$5, %rsi
	movq	%r10, %rbx
	cmovgq	%r11, %rbx
	leaq	40(%rdx), %r9
	cmpq	$5, %rcx
	movq	%r10, %r15
	cmovgq	%r9, %r15
	cmpb	$0, -11(%rsp)
	cmovneq	%r11, %rbx
	movslq	(%rbx), %r14
	movq	%r15, %rax
	cmovneq	%r9, %rax
	cmoveq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, (%rbx)
	cmpb	$0, -11(%rsp)
	cmovneq	%r9, %r15
	cmoveq	40(%rdx), %r14
	movq	%r14, (%r15)
	leaq	48(%rdi), %r11
	cmpq	$6, %rsi
	movq	%r10, %rbx
	cmovgq	%r11, %rbx
	leaq	48(%rdx), %r9
	cmpq	$6, %rcx
	movq	%r10, %r15
	cmovgq	%r9, %r15
	cmpb	$0, -11(%rsp)
	cmovneq	%r11, %rbx
	movslq	(%rbx), %r14
	movq	%r15, %rax
	cmovneq	%r9, %rax
	cmoveq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, (%rbx)
	cmpb	$0, -11(%rsp)
	cmovneq	%r9, %r15
	cmoveq	48(%rdx), %r14
	movq	%r14, (%r15)
	leaq	56(%rdi), %r11
	cmpq	$7, %rsi
	movq	%r10, %rbx
	cmovgq	%r11, %rbx
	leaq	56(%rdx), %r9
	cmpq	$7, %rcx
	movq	%r10, %r15
	cmovgq	%r9, %r15
	cmpb	$0, -11(%rsp)
	cmovneq	%r11, %rbx
	movslq	(%rbx), %r14
	movq	%r15, %rax
	cmovneq	%r9, %rax
	cmoveq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, (%rbx)
	cmpb	$0, -11(%rsp)
	cmovneq	%r9, %r15
	cmoveq	56(%rdx), %r14
	movq	%r14, (%r15)
	leaq	64(%rdi), %r11
	cmpq	$8, %rsi
	movq	%r10, %rbx
	cmovgq	%r11, %rbx
	leaq	64(%rdx), %r9
	cmpq	$8, %rcx
	movq	%r10, %r15
	cmovgq	%r9, %r15
	cmpb	$0, -11(%rsp)
	cmovneq	%r11, %rbx
	movslq	(%rbx), %r14
	movq	%r15, %rax
	cmovneq	%r9, %rax
	cmoveq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, (%rbx)
	cmpb	$0, -11(%rsp)
	cmovneq	%r9, %r15
	cmoveq	64(%rdx), %r14
	movq	%r14, (%r15)
	addq	$72, %rdi
	cmpq	$9, %rsi
	movq	%r10, %rax
	cmovgq	%rdi, %rax
	leaq	72(%rdx), %rsi
	cmpq	$9, %rcx
	cmovgq	%rsi, %r10
	cmpb	$0, -11(%rsp)
	cmovneq	%rdi, %rax
	movslq	(%rax), %rcx
	movq	%r10, %rbx
	cmovneq	%rsi, %rbx
	cmoveq	%rdi, %rbx
	movq	(%rbx), %rdi
	movq	%rdi, (%rax)
	cmpb	$0, -11(%rsp)
	cmovneq	%rsi, %r10
	cmoveq	72(%rdx), %rcx
	movq	%rcx, (%r10)
	andb	-10(%rsp), %r8b
	orb	-11(%rsp), %r8b
	andb	$1, %r8b
	movb	%r8b, -9(%rsp)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end19:
	.size	swap_conditional, .Lfunc_end19-swap_conditional
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fmonty
	.type	fmonty,@function
fmonty:                                 # @fmonty
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$1336, %rsp             # imm = 0x538
	.cfi_def_cfa_offset 1392
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r8, 8(%rsp)            # 8-byte Spill
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	movq	%rdx, 32(%rsp)          # 8-byte Spill
	movq	%rsi, 24(%rsp)          # 8-byte Spill
	movq	%rdi, 16(%rsp)          # 8-byte Spill
	movq	1456(%rsp), %rbp
	movq	1464(%rsp), %r12
	movq	1408(%rsp), %rax
	movl	1488(%rsp), %r14d
	movl	$10, %ecx
	leaq	448(%rsp), %rbx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	rep;movsq (%rsi), %es:(%rdi)
	movq	1416(%rsp), %rsi
	movq	1424(%rsp), %r15
	movq	1432(%rsp), %r13
	movq	%rax, %rdi
	movq	%r15, %rdx
	movq	%r13, %rcx
	movl	%r14d, %r8d
	callq	fsum
	movl	$10, %ecx
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	movl	%r14d, %r8d
	callq	fdifference
	leaq	48(%rsp), %rbx
	movl	$10, %ecx
	movq	%rbx, %rdi
	movq	1440(%rsp), %rax
	movq	%rax, %rsi
	rep;movsq (%rsi), %es:(%rdi)
	movq	%rax, %rdi
	movq	1448(%rsp), %rsi
	movq	%rbp, %rdx
	movq	%r12, %rcx
	movl	%r14d, %r8d
	callq	fsum
	movl	$10, %ecx
	movq	%rbp, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	movl	%r14d, %r8d
	callq	fdifference
	movl	%r14d, (%rsp)
	leaq	128(%rsp), %rbx
	movl	$19, %esi
	movq	%rbx, %rdi
	movq	1440(%rsp), %rdx
	movq	1448(%rsp), %rcx
	movq	%r15, %r8
	movq	%r13, %r9
	callq	fproduct
	movl	%r14d, (%rsp)
	leaq	848(%rsp), %r13
	movl	$19, %esi
	movq	%r13, %rdi
	movq	1408(%rsp), %rdx
	movq	1416(%rsp), %r15
	movq	%r15, %rcx
	movq	%rbp, %r8
	movq	%r12, %r9
	callq	fproduct
	movl	$19, %esi
	movq	%rbx, %rdi
	movl	%r14d, %edx
	callq	freduce_degree
	movl	$19, %esi
	movq	%rbx, %rdi
	movl	%r14d, %edx
	callq	freduce_coefficients
	movl	$19, %esi
	movq	%r13, %rdi
	movl	%r14d, %edx
	callq	freduce_degree
	movl	$19, %esi
	movq	%r13, %rdi
	movl	%r14d, %edx
	callq	freduce_coefficients
	movaps	192(%rsp), %xmm0
	movaps	%xmm0, 112(%rsp)
	movaps	128(%rsp), %xmm0
	movaps	144(%rsp), %xmm1
	movaps	160(%rsp), %xmm2
	movaps	176(%rsp), %xmm3
	movaps	%xmm3, 96(%rsp)
	movaps	%xmm2, 80(%rsp)
	movaps	%xmm1, 64(%rsp)
	movaps	%xmm0, 48(%rsp)
	movl	$19, %esi
	movl	$19, %ecx
	movq	%rbx, %rdi
	movq	%r13, %rdx
	movl	%r14d, %r8d
	callq	fsum
	movl	$19, %esi
	movl	$10, %ecx
	movq	%r13, %rdi
	leaq	48(%rsp), %rdx
	movl	%r14d, %r8d
	callq	fdifference
	leaq	528(%rsp), %rbp
	movl	$19, %esi
	movl	$19, %ecx
	movq	%rbp, %rdi
	movq	%rbx, %rdx
	movl	%r14d, %r8d
	callq	fsquare
	leaq	688(%rsp), %rbx
	movl	$19, %esi
	movl	$19, %ecx
	movq	%rbx, %rdi
	movq	%r13, %rdx
	movl	%r14d, %r8d
	callq	fsquare
	movl	%r14d, (%rsp)
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r13, %rdi
	movq	%rbx, %rdx
	movq	1472(%rsp), %r8
	movq	1480(%rsp), %r9
	callq	fproduct
	movl	$19, %esi
	movq	%r13, %rdi
	movl	%r14d, %edx
	callq	freduce_degree
	movl	$19, %esi
	movq	%r13, %rdi
	movl	%r14d, %edx
	callq	freduce_coefficients
	movl	$10, %ecx
	movq	8(%rsp), %rdi           # 8-byte Reload
	movq	%rbp, %rsi
	rep;movsq (%rsi), %es:(%rdi)
	movl	$10, %ecx
	movq	1392(%rsp), %rdi
	movq	%r13, %rsi
	rep;movsq (%rsi), %es:(%rdi)
	leaq	1168(%rsp), %r13
	movl	$19, %esi
	movq	%r13, %rdi
	movq	1408(%rsp), %rdx
	movq	%r15, %rcx
	movl	%r14d, %r8d
	callq	fsquare
	leaq	1008(%rsp), %r15
	movl	$19, %esi
	movq	%r15, %rdi
	movq	1424(%rsp), %rdx
	movq	1432(%rsp), %rcx
	movl	%r14d, %r8d
	callq	fsquare
	movl	%r14d, (%rsp)
	movl	$19, %ecx
	movl	$19, %r9d
	movq	16(%rsp), %rbx          # 8-byte Reload
	movq	%rbx, %rdi
	movq	24(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	%r15, %r8
	callq	fproduct
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	movl	%r14d, %edx
	callq	freduce_degree
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	movl	%r14d, %edx
	callq	freduce_coefficients
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r15, %rdi
	movq	%r13, %rdx
	movl	%r14d, %r8d
	callq	fdifference
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 416(%rsp)
	movaps	%xmm0, 400(%rsp)
	movaps	%xmm0, 384(%rsp)
	movaps	%xmm0, 368(%rsp)
	movq	$0, 432(%rsp)
	leaq	288(%rsp), %r12
	movl	$19, %esi
	movl	$19, %ecx
	movl	$121665, %r8d           # imm = 0x1DB41
	movq	%r12, %rdi
	movq	%r15, %rdx
	movl	%r14d, %r9d
	callq	fscalar_product
	movl	$19, %esi
	movq	%r12, %rdi
	movl	%r14d, %edx
	callq	freduce_coefficients
	movl	$19, %esi
	movl	$19, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movl	%r14d, %r8d
	callq	fsum
	movl	%r14d, (%rsp)
	movl	$19, %ecx
	movl	$19, %r9d
	movq	32(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, %rdi
	movq	40(%rsp), %rbx          # 8-byte Reload
	movq	%rbx, %rsi
	movq	%r15, %rdx
	movq	%r12, %r8
	callq	fproduct
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	movl	%r14d, %edx
	callq	freduce_degree
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	movl	%r14d, %edx
	callq	freduce_coefficients
	addq	$1336, %rsp             # imm = 0x538
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end20:
	.size	fmonty, .Lfunc_end20-fmonty
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fsum
	.type	fsum,@function
fsum:                                   # @fsum
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	andb	$1, %r8b
	movb	%r8b, -9(%rsp)
	movq	(%rdi), %r9
	movq	(%rdx), %rax
	addq	%r9, %rax
	testb	%r8b, %r8b
	cmoveq	%r9, %rax
	movq	%rax, (%rdi)
	leaq	8(%rdi), %r8
	cmpq	$1, %rsi
	leaq	-8(%rsp), %r9
	movq	%r9, %r11
	cmovgq	%r8, %r11
	leaq	8(%rdx), %r10
	cmpq	$1, %rcx
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %bpl
	testb	%bpl, %bpl
	cmovneq	%r8, %r11
	movq	(%r11), %rbx
	cmovneq	%r10, %rax
	addq	(%rax), %rbx
	testb	%bpl, %bpl
	cmoveq	8(%rdi), %rbx
	movq	%rbx, (%r11)
	leaq	16(%rdi), %r8
	cmpq	$2, %rsi
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	16(%rdx), %r10
	cmpq	$2, %rcx
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbx
	cmovneq	%r10, %rax
	addq	(%rax), %rbx
	testb	%r11b, %r11b
	cmoveq	16(%rdi), %rbx
	movq	%rbx, (%rbp)
	leaq	24(%rdi), %r8
	cmpq	$3, %rsi
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	24(%rdx), %r10
	cmpq	$3, %rcx
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbx
	cmovneq	%r10, %rax
	addq	(%rax), %rbx
	testb	%r11b, %r11b
	cmoveq	24(%rdi), %rbx
	movq	%rbx, (%rbp)
	leaq	32(%rdi), %r8
	cmpq	$4, %rsi
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	32(%rdx), %r10
	cmpq	$4, %rcx
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbx
	cmovneq	%r10, %rax
	addq	(%rax), %rbx
	testb	%r11b, %r11b
	cmoveq	32(%rdi), %rbx
	movq	%rbx, (%rbp)
	leaq	40(%rdi), %r8
	cmpq	$5, %rsi
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	40(%rdx), %r10
	cmpq	$5, %rcx
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbx
	cmovneq	%r10, %rax
	addq	(%rax), %rbx
	testb	%r11b, %r11b
	cmoveq	40(%rdi), %rbx
	movq	%rbx, (%rbp)
	leaq	48(%rdi), %r8
	cmpq	$6, %rsi
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	48(%rdx), %r10
	cmpq	$6, %rcx
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbx
	cmovneq	%r10, %rax
	addq	(%rax), %rbx
	testb	%r11b, %r11b
	cmoveq	48(%rdi), %rbx
	movq	%rbx, (%rbp)
	leaq	56(%rdi), %r8
	cmpq	$7, %rsi
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	56(%rdx), %r10
	cmpq	$7, %rcx
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbx
	cmovneq	%r10, %rax
	addq	(%rax), %rbx
	testb	%r11b, %r11b
	cmoveq	56(%rdi), %rbx
	movq	%rbx, (%rbp)
	leaq	64(%rdi), %r8
	cmpq	$8, %rsi
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	64(%rdx), %r10
	cmpq	$8, %rcx
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbx
	cmovneq	%r10, %rax
	addq	(%rax), %rbx
	testb	%r11b, %r11b
	cmoveq	64(%rdi), %rbx
	movq	%rbx, (%rbp)
	leaq	72(%rdi), %rax
	cmpq	$9, %rsi
	movq	%r9, %rsi
	cmovgq	%rax, %rsi
	addq	$72, %rdx
	cmpq	$9, %rcx
	cmovgq	%rdx, %r9
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	cmovneq	%rax, %rsi
	movq	(%rsi), %rax
	cmovneq	%rdx, %r9
	addq	(%r9), %rax
	testb	%cl, %cl
	cmoveq	72(%rdi), %rax
	movq	%rax, (%rsi)
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end21:
	.size	fsum, .Lfunc_end21-fsum
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fdifference
	.type	fdifference,@function
fdifference:                            # @fdifference
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	andb	$1, %r8b
	movb	%r8b, -9(%rsp)
	movq	(%rdx), %rax
	movq	(%rdi), %r9
	subq	%r9, %rax
	testb	%r8b, %r8b
	cmoveq	%r9, %rax
	movq	%rax, (%rdi)
	leaq	8(%rdx), %r8
	cmpq	$1, %rcx
	leaq	-8(%rsp), %r9
	movq	%r9, %r11
	cmovgq	%r8, %r11
	leaq	8(%rdi), %r10
	cmpq	$1, %rsi
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %bpl
	testb	%bpl, %bpl
	cmovneq	%r8, %r11
	movq	(%r11), %rbx
	cmovneq	%r10, %rax
	subq	(%rax), %rbx
	testb	%bpl, %bpl
	cmoveq	8(%rdi), %rbx
	movq	%rbx, (%rax)
	leaq	16(%rdx), %r8
	cmpq	$2, %rcx
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	16(%rdi), %r10
	cmpq	$2, %rsi
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %bl
	testb	%bl, %bl
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbp
	cmovneq	%r10, %rax
	subq	(%rax), %rbp
	testb	%bl, %bl
	cmoveq	16(%rdi), %rbp
	movq	%rbp, (%rax)
	leaq	24(%rdx), %r8
	cmpq	$3, %rcx
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	24(%rdi), %r10
	cmpq	$3, %rsi
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %bl
	testb	%bl, %bl
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbp
	cmovneq	%r10, %rax
	subq	(%rax), %rbp
	testb	%bl, %bl
	cmoveq	24(%rdi), %rbp
	movq	%rbp, (%rax)
	leaq	32(%rdx), %r8
	cmpq	$4, %rcx
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	32(%rdi), %r10
	cmpq	$4, %rsi
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %bl
	testb	%bl, %bl
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbp
	cmovneq	%r10, %rax
	subq	(%rax), %rbp
	testb	%bl, %bl
	cmoveq	32(%rdi), %rbp
	movq	%rbp, (%rax)
	leaq	40(%rdx), %r8
	cmpq	$5, %rcx
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	40(%rdi), %r10
	cmpq	$5, %rsi
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %bl
	testb	%bl, %bl
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbp
	cmovneq	%r10, %rax
	subq	(%rax), %rbp
	testb	%bl, %bl
	cmoveq	40(%rdi), %rbp
	movq	%rbp, (%rax)
	leaq	48(%rdx), %r8
	cmpq	$6, %rcx
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	48(%rdi), %r10
	cmpq	$6, %rsi
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %bl
	testb	%bl, %bl
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbp
	cmovneq	%r10, %rax
	subq	(%rax), %rbp
	testb	%bl, %bl
	cmoveq	48(%rdi), %rbp
	movq	%rbp, (%rax)
	leaq	56(%rdx), %r8
	cmpq	$7, %rcx
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	56(%rdi), %r10
	cmpq	$7, %rsi
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %bl
	testb	%bl, %bl
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbp
	cmovneq	%r10, %rax
	subq	(%rax), %rbp
	testb	%bl, %bl
	cmoveq	56(%rdi), %rbp
	movq	%rbp, (%rax)
	leaq	64(%rdx), %r8
	cmpq	$8, %rcx
	movq	%r9, %rbp
	cmovgq	%r8, %rbp
	leaq	64(%rdi), %r10
	cmpq	$8, %rsi
	movq	%r9, %rax
	cmovgq	%r10, %rax
	movb	-9(%rsp), %bl
	testb	%bl, %bl
	cmovneq	%r8, %rbp
	movq	(%rbp), %rbp
	cmovneq	%r10, %rax
	subq	(%rax), %rbp
	testb	%bl, %bl
	cmoveq	64(%rdi), %rbp
	movq	%rbp, (%rax)
	addq	$72, %rdx
	cmpq	$9, %rcx
	movq	%r9, %rax
	cmovgq	%rdx, %rax
	leaq	72(%rdi), %rcx
	cmpq	$9, %rsi
	cmovgq	%rcx, %r9
	movb	-9(%rsp), %bl
	testb	%bl, %bl
	cmovneq	%rdx, %rax
	movq	(%rax), %rax
	cmovneq	%rcx, %r9
	subq	(%r9), %rax
	testb	%bl, %bl
	cmoveq	72(%rdi), %rax
	movq	%rax, (%r9)
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end22:
	.size	fdifference, .Lfunc_end22-fdifference
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fscalar_product
	.type	fscalar_product,@function
fscalar_product:                        # @fscalar_product
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	andb	$1, %r9b
	movb	%r9b, -9(%rsp)
	movq	(%rdx), %rax
	imulq	%r8, %rax
	testb	%r9b, %r9b
	cmoveq	(%rdi), %rax
	movq	%rax, (%rdi)
	leaq	8(%rdx), %r9
	cmpq	$1, %rcx
	leaq	-8(%rsp), %r10
	movq	%r10, %rax
	cmovgq	%r9, %rax
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r9, %rax
	movq	(%rax), %rax
	imulq	%r8, %rax
	testb	%r11b, %r11b
	cmoveq	8(%rdi), %rax
	leaq	8(%rdi), %r9
	cmpq	$1, %rsi
	movq	%r10, %rbx
	cmovgq	%r9, %rbx
	testb	%r11b, %r11b
	cmovneq	%r9, %rbx
	movq	%rax, (%rbx)
	leaq	16(%rdx), %r9
	cmpq	$2, %rcx
	movq	%r10, %rbx
	cmovgq	%r9, %rbx
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r9, %rbx
	movq	(%rbx), %rbx
	imulq	%r8, %rbx
	testb	%r11b, %r11b
	cmoveq	16(%rdi), %rbx
	leaq	16(%rdi), %r9
	cmpq	$2, %rsi
	movq	%r10, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r9, %rax
	movq	%rbx, (%rax)
	leaq	24(%rdx), %r9
	cmpq	$3, %rcx
	movq	%r10, %rbx
	cmovgq	%r9, %rbx
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r9, %rbx
	movq	(%rbx), %rbx
	imulq	%r8, %rbx
	testb	%r11b, %r11b
	cmoveq	24(%rdi), %rbx
	leaq	24(%rdi), %r9
	cmpq	$3, %rsi
	movq	%r10, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r9, %rax
	movq	%rbx, (%rax)
	leaq	32(%rdx), %r9
	cmpq	$4, %rcx
	movq	%r10, %rbx
	cmovgq	%r9, %rbx
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r9, %rbx
	movq	(%rbx), %rbx
	imulq	%r8, %rbx
	testb	%r11b, %r11b
	cmoveq	32(%rdi), %rbx
	leaq	32(%rdi), %r9
	cmpq	$4, %rsi
	movq	%r10, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r9, %rax
	movq	%rbx, (%rax)
	leaq	40(%rdx), %r9
	cmpq	$5, %rcx
	movq	%r10, %rbx
	cmovgq	%r9, %rbx
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r9, %rbx
	movq	(%rbx), %rbx
	imulq	%r8, %rbx
	testb	%r11b, %r11b
	cmoveq	40(%rdi), %rbx
	leaq	40(%rdi), %r9
	cmpq	$5, %rsi
	movq	%r10, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r9, %rax
	movq	%rbx, (%rax)
	leaq	48(%rdx), %r9
	cmpq	$6, %rcx
	movq	%r10, %rbx
	cmovgq	%r9, %rbx
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r9, %rbx
	movq	(%rbx), %rbx
	imulq	%r8, %rbx
	testb	%r11b, %r11b
	cmoveq	48(%rdi), %rbx
	leaq	48(%rdi), %r9
	cmpq	$6, %rsi
	movq	%r10, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r9, %rax
	movq	%rbx, (%rax)
	leaq	56(%rdx), %r9
	cmpq	$7, %rcx
	movq	%r10, %rbx
	cmovgq	%r9, %rbx
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r9, %rbx
	movq	(%rbx), %rbx
	imulq	%r8, %rbx
	testb	%r11b, %r11b
	cmoveq	56(%rdi), %rbx
	leaq	56(%rdi), %r9
	cmpq	$7, %rsi
	movq	%r10, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r9, %rax
	movq	%rbx, (%rax)
	leaq	64(%rdx), %r9
	cmpq	$8, %rcx
	movq	%r10, %rbx
	cmovgq	%r9, %rbx
	movb	-9(%rsp), %r11b
	testb	%r11b, %r11b
	cmovneq	%r9, %rbx
	movq	(%rbx), %rbx
	imulq	%r8, %rbx
	testb	%r11b, %r11b
	cmoveq	64(%rdi), %rbx
	leaq	64(%rdi), %r9
	cmpq	$8, %rsi
	movq	%r10, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r9, %rax
	movq	%rbx, (%rax)
	addq	$72, %rdx
	cmpq	$9, %rcx
	movq	%r10, %rax
	cmovgq	%rdx, %rax
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	cmovneq	%rdx, %rax
	imulq	(%rax), %r8
	testb	%cl, %cl
	cmoveq	72(%rdi), %r8
	addq	$72, %rdi
	cmpq	$9, %rsi
	cmovgq	%rdi, %r10
	testb	%cl, %cl
	cmovneq	%rdi, %r10
	movq	%r8, (%r10)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end23:
	.size	fscalar_product, .Lfunc_end23-fscalar_product
	.cfi_endproc
                                        # -- End function
	.globl	randombytes             # -- Begin function randombytes
	.p2align	4, 0x90
	.type	randombytes,@function
randombytes:                            # @randombytes
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	testq	%rdx, %rdx
	js	.LBB24_30
# %bb.1:
	movq	%rdx, %rbx
	movq	%rdi, %r14
	cmpl	$-1, randombytes.fd(%rip)
	jne	.LBB24_4
	jmp	.LBB24_2
	.p2align	4, 0x90
.LBB24_3:                               # %.lr.ph7
                                        #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.23:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.24:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.25:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.26:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.27:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.28:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.29:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
.LBB24_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	je	.LBB24_3
.LBB24_4:                               # %.loopexit
	testq	%rbx, %rbx
	setg	%bpl
	jle	.LBB24_9
.LBB24_5:                               # =>This Inner Loop Header: Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.6:                                #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %bpl
	je	.LBB24_9
# %bb.7:                                #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.10:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %bpl
	je	.LBB24_9
# %bb.11:                               #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.12:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %bpl
	je	.LBB24_9
# %bb.13:                               #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.14:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %bpl
	je	.LBB24_9
# %bb.15:                               #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.16:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %bpl
	je	.LBB24_9
# %bb.17:                               #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.18:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %bpl
	je	.LBB24_9
# %bb.19:                               #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.20:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %bpl
	je	.LBB24_9
# %bb.21:                               #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.22:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %bpl
	jne	.LBB24_5
	jmp	.LBB24_9
	.p2align	4, 0x90
.LBB24_8:                               # %.outer
                                        #   in Loop: Header=BB24_5 Depth=1
	addq	%rax, %r14
	movq	%rbx, %rcx
	subq	%rax, %rcx
	testq	%rcx, %rcx
	setg	%bpl
	subq	%rax, %rbx
	jg	.LBB24_5
.LBB24_9:                               # %.outer._crit_edge
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB24_30:
	.cfi_def_cfa_offset 32
	movl	$.L.str.9, %edi
	movl	$.L.str.1, %esi
	movl	$.L__PRETTY_FUNCTION__.randombytes, %ecx
	movl	$14, %edx
	callq	__assert_fail
.Lfunc_end24:
	.size	randombytes, .Lfunc_end24-randombytes
	.cfi_endproc
                                        # -- End function
	.globl	randombit               # -- Begin function randombit
	.p2align	4, 0x90
	.type	randombit,@function
randombit:                              # @randombit
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	movb	$0, -9(%rbp)
	leaq	-9(%rbp), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	randombytes
	movb	-9(%rbp), %al
	movq	%fs:40, %rcx
	cmpq	-8(%rbp), %rcx
	jne	.LBB25_2
# %bb.1:                                # %SP_return
	andb	$1, %al
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB25_2:                               # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end25:
	.size	randombit, .Lfunc_end25-randombit
	.cfi_endproc
                                        # -- End function
	.type	.L__const.main.input_data,@object # @__const.main.input_data
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	4
.L__const.main.input_data:
	.ascii	"\221E\356\f\212\272\023\305\256\353\244\334\274?\3440X{\1775\253\t\226\246AI\027\364\322qj\326"
	.size	.L__const.main.input_data, 32

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d\n"
	.size	.L.str, 4

	.type	chunk_size,@object      # @chunk_size
	.section	.rodata,"a",@progbits
	.globl	chunk_size
	.p2align	3
chunk_size:
	.quad	32                      # 0x20
	.size	chunk_size, 8

	.type	number_measurements,@object # @number_measurements
	.globl	number_measurements
	.p2align	3
number_measurements:
	.quad	1                       # 0x1
	.size	number_measurements, 8

	.type	.L__const.do_one_computation.basepoint,@object # @__const.do_one_computation.basepoint
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	4
.L__const.do_one_computation.basepoint:
	.byte	9                       # 0x9
	.zero	31
	.size	.L__const.do_one_computation.basepoint, 32

	.type	.L.str.9,@object        # @.str.9
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.9:
	.asciz	"xlen >= 0"
	.size	.L.str.9, 10

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"dudect-examples/donnabad/sources/random.c"
	.size	.L.str.1, 42

	.type	.L__PRETTY_FUNCTION__.randombytes,@object # @__PRETTY_FUNCTION__.randombytes
.L__PRETTY_FUNCTION__.randombytes:
	.asciz	"void randombytes(uint8_t *, size_t)"
	.size	.L__PRETTY_FUNCTION__.randombytes, 36

	.type	randombytes.fd,@object  # @randombytes.fd
	.data
	.p2align	2
randombytes.fd:
	.long	4294967295              # 0xffffffff
	.size	randombytes.fd, 4

	.type	.L.str.2,@object        # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"/dev/urandom"
	.size	.L.str.2, 13

	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits

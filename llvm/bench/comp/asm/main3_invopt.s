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
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	movabsq	$4294967296, %rax       # imm = 0x100000000
	movq	%rax, -48(%rbp)
	movq	%rax, -32(%rbp)
	movabsq	$-4294967294, %rax      # imm = 0xFFFFFFFF00000002
	movq	%rax, -40(%rbp)
	movabsq	$12884901890, %rax      # imm = 0x300000002
	movq	%rax, -24(%rbp)
	leaq	-32(%rbp), %rdi
	leaq	-48(%rbp), %rdx
	movl	$4, %esi
	movl	$4, %ecx
	callq	comp
	movl	$.L.str, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB0_2
# %bb.1:                                # %SP_return
	xorl	%eax, %eax
	addq	$48, %rsp
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
	.globl	comp                    # -- Begin function comp
	.p2align	4, 0x90
	.type	comp,@function
comp:                                   # @comp
# %bb.0:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	movq	%rcx, %r15
	movq	%rdx, %r14
	movl	(%rdi), %eax
	movl	(%rdx), %ebp
	movl	%eax, %r8d
	xorl	%ebp, %r8d
	leaq	4(%rdi), %r10
	leaq	4(%rdx), %r9
	cmpl	%ebp, %eax
	setne	-9(%rsp)                # 1-byte Folded Spill
	leaq	-8(%rsp), %rdx
	movq	%r10, %rbx
	cmovneq	%rdx, %rbx
	movq	%r9, %rbp
	cmovneq	%rdx, %rbp
	cmpq	$1, %rsi
	cmovgq	%r10, %rbx
	movl	(%rbx), %ebx
	cmpq	$1, %rcx
	cmovgq	%r9, %rbp
	movl	(%rbp), %ebp
	cmpl	%ebp, %ebx
	setne	-10(%rsp)               # 1-byte Folded Spill
	xorl	%ebp, %ebx
	leaq	8(%rdi), %r10
	leaq	8(%r14), %r9
	orl	%r8d, %ebx
	sete	%r8b
	movq	%rdx, %rbx
	cmoveq	%r10, %rbx
	movq	%rdx, %rbp
	cmoveq	%r9, %rbp
	cmpq	$2, %rsi
	cmovgq	%r10, %rbx
	movl	(%rbx), %ebx
	cmpq	$2, %rcx
	cmovgq	%r9, %rbp
	cmpl	(%rbp), %ebx
	setne	%r11b
	sete	%al
	andb	%r8b, %al
	leaq	12(%rdi), %r9
	leaq	12(%r14), %r8
	testb	%al, %al
	movb	%al, -12(%rsp)          # 1-byte Spill
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$3, %rsi
	cmovgq	%r9, %rbx
	movl	(%rbx), %ebx
	cmpq	$3, %rcx
	cmovgq	%r8, %rbp
	cmpl	(%rbp), %ebx
	setne	-11(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	leaq	16(%rdi), %r9
	leaq	16(%r14), %r8
	testb	%cl, %cl
	movb	%cl, -14(%rsp)          # 1-byte Spill
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$4, %rsi
	cmovgq	%r9, %rbx
	movl	(%rbx), %ebx
	cmpq	$4, %r15
	cmovgq	%r8, %rbp
	cmpl	(%rbp), %ebx
	setne	-13(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	leaq	20(%rdi), %r9
	leaq	20(%r14), %r8
	testb	%al, %al
	movb	%al, -16(%rsp)          # 1-byte Spill
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$5, %rsi
	cmovgq	%r9, %rbx
	movl	(%rbx), %ebx
	cmpq	$5, %r15
	cmovgq	%r8, %rbp
	cmpl	(%rbp), %ebx
	setne	-15(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	leaq	24(%rdi), %r9
	leaq	24(%r14), %r8
	testb	%cl, %cl
	movb	%cl, -18(%rsp)          # 1-byte Spill
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$6, %rsi
	cmovgq	%r9, %rbx
	movl	(%rbx), %ebx
	cmpq	$6, %r15
	cmovgq	%r8, %rbp
	cmpl	(%rbp), %ebx
	setne	-17(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	leaq	28(%rdi), %r9
	leaq	28(%r14), %r8
	testb	%al, %al
	movb	%al, -20(%rsp)          # 1-byte Spill
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$7, %rsi
	cmovgq	%r9, %rbx
	movl	(%rbx), %ebx
	cmpq	$7, %r15
	cmovgq	%r8, %rbp
	cmpl	(%rbp), %ebx
	setne	-19(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	leaq	32(%rdi), %r9
	leaq	32(%r14), %r8
	testb	%cl, %cl
	movb	%cl, -22(%rsp)          # 1-byte Spill
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$8, %rsi
	cmovgq	%r9, %rbx
	movl	(%rbx), %ebx
	cmpq	$8, %r15
	cmovgq	%r8, %rbp
	cmpl	(%rbp), %ebx
	setne	-21(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	leaq	36(%rdi), %r8
	testb	%al, %al
	movb	%al, -24(%rsp)          # 1-byte Spill
	movq	%rdx, %rbx
	cmovneq	%r8, %rbx
	leaq	36(%r14), %r9
	movq	%rdx, %rbp
	cmovneq	%r9, %rbp
	cmpq	$9, %rsi
	cmovgq	%r8, %rbx
	cmpq	$9, %r15
	cmovgq	%r9, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-23(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	leaq	40(%rdi), %r8
	testb	%cl, %cl
	movb	%cl, -26(%rsp)          # 1-byte Spill
	movq	%rdx, %rbx
	cmovneq	%r8, %rbx
	leaq	40(%r14), %r9
	movq	%rdx, %rbp
	cmovneq	%r9, %rbp
	cmpq	$10, %rsi
	cmovgq	%r8, %rbx
	cmpq	$10, %r15
	cmovgq	%r9, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-25(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -28(%rsp)          # 1-byte Spill
	leaq	44(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	44(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$11, %rsi
	cmovgq	%r9, %rbx
	cmpq	$11, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-27(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -30(%rsp)          # 1-byte Spill
	leaq	48(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	48(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$12, %rsi
	cmovgq	%r9, %rbx
	cmpq	$12, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-29(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -32(%rsp)          # 1-byte Spill
	leaq	52(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	52(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$13, %rsi
	cmovgq	%r9, %rbx
	cmpq	$13, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-31(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -33(%rsp)          # 1-byte Spill
	leaq	56(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	56(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$14, %rsi
	cmovgq	%r9, %rbx
	cmpq	$14, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-52(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -34(%rsp)          # 1-byte Spill
	leaq	60(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	60(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$15, %rsi
	cmovgq	%r9, %rbx
	cmpq	$15, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-53(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -35(%rsp)          # 1-byte Spill
	leaq	64(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	64(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$16, %rsi
	cmovgq	%r9, %rbx
	cmpq	$16, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-54(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -36(%rsp)          # 1-byte Spill
	leaq	68(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	68(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$17, %rsi
	cmovgq	%r9, %rbx
	cmpq	$17, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-55(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -38(%rsp)          # 1-byte Spill
	leaq	72(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	72(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$18, %rsi
	cmovgq	%r9, %rbx
	cmpq	$18, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-37(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -39(%rsp)          # 1-byte Spill
	leaq	76(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	76(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$19, %rsi
	cmovgq	%r9, %rbx
	cmpq	$19, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-65(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -40(%rsp)          # 1-byte Spill
	leaq	80(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	80(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$20, %rsi
	cmovgq	%r9, %rbx
	cmpq	$20, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-56(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -41(%rsp)          # 1-byte Spill
	leaq	84(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	84(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$21, %rsi
	cmovgq	%r9, %rbx
	cmpq	$21, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-57(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -42(%rsp)          # 1-byte Spill
	leaq	88(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	88(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$22, %rsi
	cmovgq	%r9, %rbx
	cmpq	$22, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-58(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -43(%rsp)          # 1-byte Spill
	leaq	92(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	92(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$23, %rsi
	cmovgq	%r9, %rbx
	cmpq	$23, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-59(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -44(%rsp)          # 1-byte Spill
	leaq	96(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	96(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$24, %rsi
	cmovgq	%r9, %rbx
	cmpq	$24, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-66(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -45(%rsp)          # 1-byte Spill
	leaq	100(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	100(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$25, %rsi
	cmovgq	%r9, %rbx
	cmpq	$25, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-60(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -46(%rsp)          # 1-byte Spill
	leaq	104(%rdi), %r8
	movq	%rdx, %r10
	cmovneq	%r8, %r10
	leaq	104(%r14), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	cmpq	$26, %rsi
	cmovgq	%r8, %r10
	cmpq	$26, %r15
	cmovgq	%r9, %rbx
	movl	(%r10), %ebp
	cmpl	(%rbx), %ebp
	setne	-61(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -47(%rsp)          # 1-byte Spill
	leaq	108(%rdi), %r8
	movq	%rdx, %r10
	cmovneq	%r8, %r10
	leaq	108(%r14), %r9
	movq	%rdx, %rbp
	cmovneq	%r9, %rbp
	cmpq	$27, %rsi
	cmovgq	%r8, %r10
	cmpq	$27, %r15
	cmovgq	%r9, %rbp
	movl	(%r10), %ebx
	cmpl	(%rbp), %ebx
	setne	-62(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -49(%rsp)          # 1-byte Spill
	leaq	112(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	112(%r14), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$28, %rsi
	cmovgq	%r9, %rbx
	cmpq	$28, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-63(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movl	%eax, %ecx
	movb	%al, -51(%rsp)          # 1-byte Spill
	leaq	116(%rdi), %rbp
	movq	%rdx, %rbx
	cmovneq	%rbp, %rbx
	leaq	116(%r14), %r8
	movq	%rdx, %rax
	cmovneq	%r8, %rax
	cmpq	$29, %rsi
	cmovgq	%rbp, %rbx
	cmpq	$29, %r15
	cmovgq	%r8, %rax
	movl	(%rbx), %ebp
	cmpl	(%rax), %ebp
	setne	-50(%rsp)               # 1-byte Folded Spill
	sete	%r8b
	andb	%cl, %r8b
	testb	%r8b, %r8b
	leaq	120(%rdi), %rax
	movq	%rdx, %rbx
	cmovneq	%rax, %rbx
	leaq	120(%r14), %rbp
	movq	%rdx, %rcx
	cmovneq	%rbp, %rcx
	cmpq	$30, %rsi
	cmovgq	%rax, %rbx
	cmpq	$30, %r15
	cmovgq	%rbp, %rcx
	movl	(%rbx), %eax
	cmpl	(%rcx), %eax
	setne	-64(%rsp)               # 1-byte Folded Spill
	sete	%al
	addq	$124, %rdi
	addq	$124, %r14
	testb	%al, %r8b
	movq	%rdx, %rax
	cmovneq	%rdi, %rax
	cmovneq	%r14, %rdx
	cmpq	$31, %rsi
	cmovgq	%rdi, %rax
	cmpq	$31, %r15
	cmovgq	%r14, %rdx
	movl	(%rax), %eax
	cmpl	(%rdx), %eax
	sete	-48(%rsp)               # 1-byte Folded Spill
	movb	-11(%rsp), %cl          # 1-byte Reload
	andb	-12(%rsp), %cl          # 1-byte Folded Reload
	movb	-13(%rsp), %dl          # 1-byte Reload
	andb	-14(%rsp), %dl          # 1-byte Folded Reload
	movb	-15(%rsp), %bl          # 1-byte Reload
	andb	-16(%rsp), %bl          # 1-byte Folded Reload
	movb	-17(%rsp), %r12b        # 1-byte Reload
	andb	-18(%rsp), %r12b        # 1-byte Folded Reload
	movb	-19(%rsp), %dil         # 1-byte Reload
	andb	-20(%rsp), %dil         # 1-byte Folded Reload
	movb	-21(%rsp), %r14b        # 1-byte Reload
	andb	-22(%rsp), %r14b        # 1-byte Folded Reload
	movb	-23(%rsp), %r15b        # 1-byte Reload
	andb	-24(%rsp), %r15b        # 1-byte Folded Reload
	movb	-25(%rsp), %sil         # 1-byte Reload
	andb	-26(%rsp), %sil         # 1-byte Folded Reload
	movb	-27(%rsp), %r9b         # 1-byte Reload
	andb	-28(%rsp), %r9b         # 1-byte Folded Reload
	movb	-29(%rsp), %r10b        # 1-byte Reload
	andb	-30(%rsp), %r10b        # 1-byte Folded Reload
	movb	-31(%rsp), %bpl         # 1-byte Reload
	andb	-32(%rsp), %bpl         # 1-byte Folded Reload
	movb	-33(%rsp), %r13b        # 1-byte Reload
	andb	%r13b, -52(%rsp)        # 1-byte Folded Spill
	movb	-34(%rsp), %al          # 1-byte Reload
	andb	%al, -53(%rsp)          # 1-byte Folded Spill
	movb	-35(%rsp), %al          # 1-byte Reload
	andb	%al, -54(%rsp)          # 1-byte Folded Spill
	movb	-36(%rsp), %al          # 1-byte Reload
	andb	%al, -55(%rsp)          # 1-byte Folded Spill
	movb	-37(%rsp), %r13b        # 1-byte Reload
	andb	-38(%rsp), %r13b        # 1-byte Folded Reload
	movb	-65(%rsp), %al          # 1-byte Reload
	andb	-39(%rsp), %al          # 1-byte Folded Reload
	movb	%al, -65(%rsp)          # 1-byte Spill
	movb	-40(%rsp), %al          # 1-byte Reload
	andb	%al, -56(%rsp)          # 1-byte Folded Spill
	movb	-41(%rsp), %al          # 1-byte Reload
	andb	%al, -57(%rsp)          # 1-byte Folded Spill
	movb	-42(%rsp), %al          # 1-byte Reload
	andb	%al, -58(%rsp)          # 1-byte Folded Spill
	movb	-43(%rsp), %al          # 1-byte Reload
	andb	%al, -59(%rsp)          # 1-byte Folded Spill
	movb	-66(%rsp), %al          # 1-byte Reload
	andb	-44(%rsp), %al          # 1-byte Folded Reload
	movb	%al, -66(%rsp)          # 1-byte Spill
	movb	-45(%rsp), %al          # 1-byte Reload
	andb	%al, -60(%rsp)          # 1-byte Folded Spill
	movb	-46(%rsp), %al          # 1-byte Reload
	andb	%al, -61(%rsp)          # 1-byte Folded Spill
	movb	-47(%rsp), %al          # 1-byte Reload
	andb	%al, -62(%rsp)          # 1-byte Folded Spill
	movb	-49(%rsp), %al          # 1-byte Reload
	andb	%al, -63(%rsp)          # 1-byte Folded Spill
	movb	-50(%rsp), %al          # 1-byte Reload
	andb	-51(%rsp), %al          # 1-byte Folded Reload
	andb	%r8b, -64(%rsp)         # 1-byte Folded Spill
	orb	-10(%rsp), %r11b        # 1-byte Folded Reload
	orb	%cl, %r11b
	orb	%dl, %r11b
	orb	%bl, %r11b
	orb	%r12b, %r11b
	orb	%dil, %r11b
	orb	%r14b, %r11b
	orb	%r15b, %r11b
	orb	%sil, %r11b
	orb	%r9b, %r11b
	orb	%r10b, %r11b
	orb	%bpl, %r11b
	orb	-52(%rsp), %r11b        # 1-byte Folded Reload
	orb	-53(%rsp), %r11b        # 1-byte Folded Reload
	orb	-54(%rsp), %r11b        # 1-byte Folded Reload
	orb	-55(%rsp), %r11b        # 1-byte Folded Reload
	orb	%r13b, %r11b
	orb	-65(%rsp), %r11b        # 1-byte Folded Reload
	orb	-56(%rsp), %r11b        # 1-byte Folded Reload
	orb	-57(%rsp), %r11b        # 1-byte Folded Reload
	orb	-58(%rsp), %r11b        # 1-byte Folded Reload
	orb	-59(%rsp), %r11b        # 1-byte Folded Reload
	orb	-66(%rsp), %r11b        # 1-byte Folded Reload
	orb	-60(%rsp), %r11b        # 1-byte Folded Reload
	orb	-61(%rsp), %r11b        # 1-byte Folded Reload
	orb	-62(%rsp), %r11b        # 1-byte Folded Reload
	orb	-63(%rsp), %r11b        # 1-byte Folded Reload
	orb	%al, %r11b
	orb	-64(%rsp), %r11b        # 1-byte Folded Reload
	orb	-9(%rsp), %r11b         # 1-byte Folded Reload
	xorb	$1, %r11b
	andb	-48(%rsp), %r11b        # 1-byte Folded Reload
	movzbl	%r11b, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end1:
	.size	comp, .Lfunc_end1-comp
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d\n"
	.size	.L.str, 4

	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits

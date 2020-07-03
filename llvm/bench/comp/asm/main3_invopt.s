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
	movq	%rdx, %r11
	movq	%rsi, %r14
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
	leaq	8(%r11), %r9
	orl	%r8d, %ebx
	sete	%al
	movb	%al, -11(%rsp)          # 1-byte Spill
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
	setne	-56(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	leaq	12(%rdi), %r9
	leaq	12(%r11), %r8
	testb	%cl, %cl
	movb	%cl, -12(%rsp)          # 1-byte Spill
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$3, %rsi
	cmovgq	%r9, %rbx
	movl	(%rbx), %ebx
	cmpq	$3, %r15
	cmovgq	%r8, %rbp
	cmpl	(%rbp), %ebx
	setne	-57(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	leaq	16(%rdi), %r9
	leaq	16(%r11), %r8
	testb	%al, %al
	movb	%al, -13(%rsp)          # 1-byte Spill
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
	setne	-58(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	leaq	20(%rdi), %r9
	leaq	20(%r11), %r8
	testb	%cl, %cl
	movb	%cl, -14(%rsp)          # 1-byte Spill
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
	setne	-59(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	leaq	24(%rdi), %r9
	leaq	24(%r11), %r8
	testb	%al, %al
	movb	%al, -15(%rsp)          # 1-byte Spill
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
	setne	-60(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	leaq	28(%rdi), %r9
	leaq	28(%r11), %r8
	testb	%cl, %cl
	movb	%cl, -16(%rsp)          # 1-byte Spill
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
	setne	-61(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	leaq	32(%rdi), %r8
	testb	%al, %al
	movb	%al, -17(%rsp)          # 1-byte Spill
	movq	%rdx, %rbx
	cmovneq	%r8, %rbx
	leaq	32(%r11), %r9
	movq	%rdx, %rbp
	cmovneq	%r9, %rbp
	cmpq	$8, %rsi
	cmovgq	%r8, %rbx
	cmpq	$8, %r15
	cmovgq	%r9, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-62(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	leaq	36(%rdi), %r8
	testb	%cl, %cl
	movb	%cl, -18(%rsp)          # 1-byte Spill
	movq	%rdx, %rbx
	cmovneq	%r8, %rbx
	leaq	36(%r11), %r9
	movq	%rdx, %rbp
	cmovneq	%r9, %rbp
	cmpq	$9, %rsi
	cmovgq	%r8, %rbx
	cmpq	$9, %r15
	cmovgq	%r9, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-53(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -19(%rsp)          # 1-byte Spill
	leaq	40(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	40(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$10, %rsi
	cmovgq	%r9, %rbx
	cmpq	$10, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-63(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -20(%rsp)          # 1-byte Spill
	leaq	44(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	44(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$11, %rsi
	cmovgq	%r9, %rbx
	cmpq	$11, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-54(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -21(%rsp)          # 1-byte Spill
	leaq	48(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	48(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$12, %rsi
	cmovgq	%r9, %rbx
	cmpq	$12, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-64(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -22(%rsp)          # 1-byte Spill
	leaq	52(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	52(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$13, %rsi
	cmovgq	%r9, %rbx
	cmpq	$13, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-65(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -23(%rsp)          # 1-byte Spill
	leaq	56(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	56(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$14, %rsi
	cmovgq	%r9, %rbx
	cmpq	$14, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-66(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -24(%rsp)          # 1-byte Spill
	leaq	60(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	60(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$15, %rsi
	cmovgq	%r9, %rbx
	cmpq	$15, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-67(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -25(%rsp)          # 1-byte Spill
	leaq	64(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	64(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$16, %rsi
	cmovgq	%r9, %rbx
	cmpq	$16, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-68(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -27(%rsp)          # 1-byte Spill
	leaq	68(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	68(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$17, %rsi
	cmovgq	%r9, %rbx
	cmpq	$17, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-26(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -29(%rsp)          # 1-byte Spill
	leaq	72(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	72(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$18, %rsi
	cmovgq	%r9, %rbx
	cmpq	$18, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-28(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -31(%rsp)          # 1-byte Spill
	leaq	76(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	76(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$19, %rsi
	cmovgq	%r9, %rbx
	cmpq	$19, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-30(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -33(%rsp)          # 1-byte Spill
	leaq	80(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	80(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$20, %rsi
	cmovgq	%r9, %rbx
	cmpq	$20, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-32(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -35(%rsp)          # 1-byte Spill
	leaq	84(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	84(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$21, %rsi
	cmovgq	%r9, %rbx
	cmpq	$21, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-34(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -37(%rsp)          # 1-byte Spill
	leaq	88(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	88(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$22, %rsi
	cmovgq	%r9, %rbx
	cmpq	$22, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-36(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -39(%rsp)          # 1-byte Spill
	leaq	92(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	92(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$23, %rsi
	cmovgq	%r9, %rbx
	cmpq	$23, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-38(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -41(%rsp)          # 1-byte Spill
	leaq	96(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	96(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$24, %rsi
	cmovgq	%r9, %rbx
	cmpq	$24, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-40(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -43(%rsp)          # 1-byte Spill
	leaq	100(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	100(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$25, %rsi
	cmovgq	%r9, %rbx
	cmpq	$25, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-42(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -45(%rsp)          # 1-byte Spill
	leaq	104(%rdi), %r8
	movq	%rdx, %r10
	cmovneq	%r8, %r10
	leaq	104(%r11), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	cmpq	$26, %rsi
	cmovgq	%r8, %r10
	cmpq	$26, %r15
	cmovgq	%r9, %rbx
	movl	(%r10), %ebp
	cmpl	(%rbx), %ebp
	setne	-44(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -47(%rsp)          # 1-byte Spill
	leaq	108(%rdi), %r8
	movq	%rdx, %r10
	cmovneq	%r8, %r10
	leaq	108(%r11), %r9
	movq	%rdx, %rbp
	cmovneq	%r9, %rbp
	cmpq	$27, %rsi
	cmovgq	%r8, %r10
	cmpq	$27, %r15
	cmovgq	%r9, %rbp
	movl	(%r10), %ebx
	cmpl	(%rbp), %ebx
	setne	-46(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%cl, %al
	testb	%al, %al
	movb	%al, -49(%rsp)          # 1-byte Spill
	leaq	112(%rdi), %r9
	movq	%rdx, %rbx
	cmovneq	%r9, %rbx
	leaq	112(%r11), %r8
	movq	%rdx, %rbp
	cmovneq	%r8, %rbp
	cmpq	$28, %rsi
	cmovgq	%r9, %rbx
	cmpq	$28, %r15
	cmovgq	%r8, %rbp
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-48(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%al, %cl
	testb	%cl, %cl
	movb	%cl, -51(%rsp)          # 1-byte Spill
	leaq	116(%rdi), %r8
	movq	%rdx, %rbx
	cmovneq	%r8, %rbx
	leaq	116(%r11), %r9
	movq	%rdx, %rax
	cmovneq	%r9, %rax
	cmpq	$29, %rsi
	cmovgq	%r8, %rbx
	cmpq	$29, %r15
	cmovgq	%r9, %rax
	movl	(%rbx), %ebx
	cmpl	(%rax), %ebx
	setne	-50(%rsp)               # 1-byte Folded Spill
	sete	%r13b
	andb	%cl, %r13b
	testb	%r13b, %r13b
	leaq	120(%rdi), %r9
	movq	%rdx, %rax
	cmovneq	%r9, %rax
	leaq	120(%r11), %rsi
	movq	%rdx, %rcx
	cmovneq	%rsi, %rcx
	cmpq	$30, %r14
	cmovgq	%r9, %rax
	cmpq	$30, %r15
	cmovgq	%rsi, %rcx
	movl	(%rax), %eax
	cmpl	(%rcx), %eax
	setne	-55(%rsp)               # 1-byte Folded Spill
	sete	%al
	andb	%r13b, %al
	movb	%al, -52(%rsp)          # 1-byte Spill
	addq	$124, %rdi
	addq	$124, %r11
	testb	%al, %al
	movq	%rdx, %rax
	cmovneq	%rdi, %rax
	cmovneq	%r11, %rdx
	cmpq	$31, %r14
	cmovgq	%rdi, %rax
	cmpq	$31, %r15
	cmovgq	%r11, %rdx
	movl	(%rax), %eax
	cmpl	(%rdx), %eax
	setne	%al
	movb	-56(%rsp), %cl          # 1-byte Reload
	andb	-11(%rsp), %cl          # 1-byte Folded Reload
	movb	%cl, -56(%rsp)          # 1-byte Spill
	movb	-57(%rsp), %cl          # 1-byte Reload
	andb	-12(%rsp), %cl          # 1-byte Folded Reload
	movb	%cl, -57(%rsp)          # 1-byte Spill
	movb	-58(%rsp), %cl          # 1-byte Reload
	andb	-13(%rsp), %cl          # 1-byte Folded Reload
	movb	%cl, -58(%rsp)          # 1-byte Spill
	movb	-59(%rsp), %cl          # 1-byte Reload
	andb	-14(%rsp), %cl          # 1-byte Folded Reload
	movb	%cl, -59(%rsp)          # 1-byte Spill
	movb	-60(%rsp), %cl          # 1-byte Reload
	andb	-15(%rsp), %cl          # 1-byte Folded Reload
	movb	%cl, -60(%rsp)          # 1-byte Spill
	movb	-61(%rsp), %cl          # 1-byte Reload
	andb	-16(%rsp), %cl          # 1-byte Folded Reload
	movb	%cl, -61(%rsp)          # 1-byte Spill
	movb	-62(%rsp), %cl          # 1-byte Reload
	andb	-17(%rsp), %cl          # 1-byte Folded Reload
	movb	%cl, -62(%rsp)          # 1-byte Spill
	movb	-18(%rsp), %cl          # 1-byte Reload
	andb	%cl, -53(%rsp)          # 1-byte Folded Spill
	movb	-63(%rsp), %cl          # 1-byte Reload
	andb	-19(%rsp), %cl          # 1-byte Folded Reload
	movb	%cl, -63(%rsp)          # 1-byte Spill
	movb	-20(%rsp), %cl          # 1-byte Reload
	andb	%cl, -54(%rsp)          # 1-byte Folded Spill
	movb	-64(%rsp), %cl          # 1-byte Reload
	andb	-21(%rsp), %cl          # 1-byte Folded Reload
	movb	%cl, -64(%rsp)          # 1-byte Spill
	movb	-65(%rsp), %cl          # 1-byte Reload
	andb	-22(%rsp), %cl          # 1-byte Folded Reload
	movb	%cl, -65(%rsp)          # 1-byte Spill
	movb	-66(%rsp), %cl          # 1-byte Reload
	andb	-23(%rsp), %cl          # 1-byte Folded Reload
	movb	%cl, -66(%rsp)          # 1-byte Spill
	movb	-67(%rsp), %cl          # 1-byte Reload
	andb	-24(%rsp), %cl          # 1-byte Folded Reload
	movb	%cl, -67(%rsp)          # 1-byte Spill
	movb	-68(%rsp), %cl          # 1-byte Reload
	andb	-25(%rsp), %cl          # 1-byte Folded Reload
	movb	%cl, -68(%rsp)          # 1-byte Spill
	movb	-26(%rsp), %r12b        # 1-byte Reload
	andb	-27(%rsp), %r12b        # 1-byte Folded Reload
	movb	-28(%rsp), %r15b        # 1-byte Reload
	andb	-29(%rsp), %r15b        # 1-byte Folded Reload
	movb	-30(%rsp), %r14b        # 1-byte Reload
	andb	-31(%rsp), %r14b        # 1-byte Folded Reload
	movb	-32(%rsp), %bpl         # 1-byte Reload
	andb	-33(%rsp), %bpl         # 1-byte Folded Reload
	movb	-34(%rsp), %bl          # 1-byte Reload
	andb	-35(%rsp), %bl          # 1-byte Folded Reload
	movb	-36(%rsp), %r11b        # 1-byte Reload
	andb	-37(%rsp), %r11b        # 1-byte Folded Reload
	movb	-38(%rsp), %r10b        # 1-byte Reload
	andb	-39(%rsp), %r10b        # 1-byte Folded Reload
	movb	-40(%rsp), %r9b         # 1-byte Reload
	andb	-41(%rsp), %r9b         # 1-byte Folded Reload
	movb	-42(%rsp), %r8b         # 1-byte Reload
	andb	-43(%rsp), %r8b         # 1-byte Folded Reload
	movb	-44(%rsp), %dil         # 1-byte Reload
	andb	-45(%rsp), %dil         # 1-byte Folded Reload
	movb	-46(%rsp), %sil         # 1-byte Reload
	andb	-47(%rsp), %sil         # 1-byte Folded Reload
	movb	-48(%rsp), %dl          # 1-byte Reload
	andb	-49(%rsp), %dl          # 1-byte Folded Reload
	movb	-50(%rsp), %cl          # 1-byte Reload
	andb	-51(%rsp), %cl          # 1-byte Folded Reload
	andb	%r13b, -55(%rsp)        # 1-byte Folded Spill
	andb	-52(%rsp), %al          # 1-byte Folded Reload
	orb	%cl, %al
	orb	%dl, %al
	orb	%sil, %al
	orb	%dil, %al
	orb	%r8b, %al
	orb	%r9b, %al
	orb	%r10b, %al
	orb	%r11b, %al
	orb	%bl, %al
	orb	%bpl, %al
	orb	%r14b, %al
	orb	%r15b, %al
	orb	%r12b, %al
	orb	-68(%rsp), %al          # 1-byte Folded Reload
	orb	-67(%rsp), %al          # 1-byte Folded Reload
	orb	-66(%rsp), %al          # 1-byte Folded Reload
	orb	-65(%rsp), %al          # 1-byte Folded Reload
	orb	-64(%rsp), %al          # 1-byte Folded Reload
	orb	-54(%rsp), %al          # 1-byte Folded Reload
	orb	-63(%rsp), %al          # 1-byte Folded Reload
	orb	-53(%rsp), %al          # 1-byte Folded Reload
	orb	-62(%rsp), %al          # 1-byte Folded Reload
	orb	-61(%rsp), %al          # 1-byte Folded Reload
	orb	-60(%rsp), %al          # 1-byte Folded Reload
	orb	-59(%rsp), %al          # 1-byte Folded Reload
	orb	-58(%rsp), %al          # 1-byte Folded Reload
	orb	-57(%rsp), %al          # 1-byte Folded Reload
	orb	-56(%rsp), %al          # 1-byte Folded Reload
	orb	-9(%rsp), %al           # 1-byte Folded Reload
	orb	-10(%rsp), %al          # 1-byte Folded Reload
	orb	-55(%rsp), %al          # 1-byte Folded Reload
	notb	%al
	movzbl	%al, %eax
	andl	$1, %eax
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

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
	movl	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	cmpq	$3, -56(%rbp)
	ja	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movq	-56(%rbp), %rax
	movl	%eax, -48(%rbp,%rax,4)
	movl	%eax, -32(%rbp,%rax,4)
	addq	$1, %rax
	movq	%rax, -56(%rbp)
	cmpq	$3, -56(%rbp)
	jbe	.LBB0_2
.LBB0_3:
	movl	$-1, -36(%rbp)
	leaq	-32(%rbp), %rdi
	leaq	-48(%rbp), %rdx
	movl	$4, %esi
	movl	$4, %ecx
	callq	comp
	movl	%eax, -60(%rbp)
	movl	$.L.str, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB0_5
# %bb.4:                                # %SP_return
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB0_5:                                # %CallStackCheckFailBlk
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
	movq	%rcx, %r15
	movq	%rdx, %r11
	movq	%rsi, %r14
	movq	%rdi, %r8
	movb	$1, -15(%rsp)
	movl	(%rdi), %r9d
	leaq	4(%rdi), %r10
	cmpq	$1, %rsi
	leaq	-8(%rsp), %rsi
	movq	%rsi, %rbx
	cmovgq	%r10, %rbx
	leaq	4(%rdx), %rcx
	cmpq	$1, %r15
	movq	%rsi, %rbp
	cmovgq	%rcx, %rbp
	cmpl	(%rdx), %r9d
	setne	-43(%rsp)               # 1-byte Folded Spill
	sete	%r9b
	sete	-16(%rsp)
	cmoveq	%r10, %rbx
	movl	(%rbx), %ebx
	cmoveq	%rcx, %rbp
	cmpl	(%rbp), %ebx
	setne	-44(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%r9b, %cl
	movb	%cl, -17(%rsp)
	leaq	8(%rdi), %r9
	cmpq	$2, %r14
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	leaq	8(%rdx), %r10
	cmpq	$2, %r15
	movq	%rsi, %rbp
	cmovgq	%r10, %rbp
	testb	%cl, %cl
	cmovneq	%r9, %rbx
	movl	(%rbx), %ebx
	cmovneq	%r10, %rbp
	cmpl	(%rbp), %ebx
	setne	-45(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	movb	%bl, -18(%rsp)
	leaq	12(%rdi), %r9
	cmpq	$3, %r14
	movq	%rsi, %rbp
	cmovgq	%r9, %rbp
	leaq	12(%rdx), %r10
	cmpq	$3, %r15
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%bl, %bl
	cmovneq	%r9, %rbp
	movl	(%rbp), %ebp
	cmovneq	%r10, %rcx
	cmpl	(%rcx), %ebp
	setne	-46(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	movb	%cl, -19(%rsp)
	leaq	16(%rdi), %r9
	cmpq	$4, %r14
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	leaq	16(%rdx), %r10
	cmpq	$4, %r15
	movq	%rsi, %rbp
	cmovgq	%r10, %rbp
	testb	%cl, %cl
	cmovneq	%r9, %rbx
	movl	(%rbx), %ebx
	cmovneq	%r10, %rbp
	cmpl	(%rbp), %ebx
	setne	-47(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	movb	%bl, -20(%rsp)
	leaq	20(%rdi), %r9
	cmpq	$5, %r14
	movq	%rsi, %rbp
	cmovgq	%r9, %rbp
	leaq	20(%rdx), %r10
	cmpq	$5, %r15
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%bl, %bl
	cmovneq	%r9, %rbp
	movl	(%rbp), %ebp
	cmovneq	%r10, %rcx
	cmpl	(%rcx), %ebp
	setne	-48(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	movb	%cl, -21(%rsp)
	leaq	24(%rdi), %r9
	cmpq	$6, %r14
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	leaq	24(%rdx), %r10
	cmpq	$6, %r15
	movq	%rsi, %rbp
	cmovgq	%r10, %rbp
	testb	%cl, %cl
	cmovneq	%r9, %rbx
	movl	(%rbx), %ebx
	cmovneq	%r10, %rbp
	cmpl	(%rbp), %ebx
	setne	-49(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	movb	%bl, -22(%rsp)
	leaq	28(%rdi), %r9
	cmpq	$7, %r14
	movq	%rsi, %rbp
	cmovgq	%r9, %rbp
	leaq	28(%rdx), %r10
	cmpq	$7, %r15
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%bl, %bl
	cmovneq	%r9, %rbp
	movl	(%rbp), %ebp
	cmovneq	%r10, %rcx
	cmpl	(%rcx), %ebp
	setne	-50(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	movb	%cl, -23(%rsp)
	leaq	32(%rdi), %r9
	cmpq	$8, %r14
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	leaq	32(%rdx), %r10
	cmpq	$8, %r15
	movq	%rsi, %rbp
	cmovgq	%r10, %rbp
	testb	%cl, %cl
	cmovneq	%r9, %rbx
	movl	(%rbx), %ebx
	cmovneq	%r10, %rbp
	cmpl	(%rbp), %ebx
	setne	-51(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	movb	%bl, -24(%rsp)
	leaq	36(%rdi), %r9
	cmpq	$9, %r14
	movq	%rsi, %rbp
	cmovgq	%r9, %rbp
	leaq	36(%rdx), %r10
	cmpq	$9, %r15
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%bl, %bl
	cmovneq	%r9, %rbp
	movl	(%rbp), %ebp
	cmovneq	%r10, %rcx
	cmpl	(%rcx), %ebp
	setne	-52(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	movb	%cl, -25(%rsp)
	leaq	40(%rdi), %r9
	cmpq	$10, %r14
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	leaq	40(%rdx), %r10
	cmpq	$10, %r15
	movq	%rsi, %rbp
	cmovgq	%r10, %rbp
	testb	%cl, %cl
	cmovneq	%r9, %rbx
	movl	(%rbx), %ebx
	cmovneq	%r10, %rbp
	cmpl	(%rbp), %ebx
	setne	-53(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	movb	%bl, -26(%rsp)
	leaq	44(%rdi), %r9
	cmpq	$11, %r14
	movq	%rsi, %rbp
	cmovgq	%r9, %rbp
	leaq	44(%rdx), %r10
	cmpq	$11, %r15
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%bl, %bl
	cmovneq	%r9, %rbp
	movl	(%rbp), %ebp
	cmovneq	%r10, %rcx
	cmpl	(%rcx), %ebp
	setne	-54(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	leaq	48(%rdi), %r9
	cmpq	$12, %r14
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	leaq	48(%rdx), %r10
	cmpq	$12, %r15
	movq	%rsi, %rbp
	cmovgq	%r10, %rbp
	testb	%cl, %cl
	cmovneq	%r9, %rbx
	movb	%cl, -27(%rsp)
	movl	(%rbx), %ebx
	cmovneq	%r10, %rbp
	cmpl	(%rbp), %ebx
	setne	-55(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	leaq	52(%rdi), %r9
	cmpq	$13, %r14
	movq	%rsi, %rbp
	cmovgq	%r9, %rbp
	leaq	52(%rdx), %r10
	cmpq	$13, %r15
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%bl, %bl
	cmovneq	%r9, %rbp
	movb	%bl, -28(%rsp)
	movl	(%rbp), %ebp
	cmovneq	%r10, %rcx
	cmpl	(%rcx), %ebp
	setne	-56(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	leaq	56(%rdi), %r9
	cmpq	$14, %r14
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	cmpq	$14, %r15
	leaq	56(%rdx), %r10
	movq	%rsi, %rbp
	cmovgq	%r10, %rbp
	testb	%cl, %cl
	cmovneq	%r9, %rbx
	cmovneq	%r10, %rbp
	movb	%cl, -29(%rsp)
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-57(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	leaq	60(%rdi), %r9
	cmpq	$15, %r14
	movq	%rsi, %rbp
	cmovgq	%r9, %rbp
	cmpq	$15, %r15
	leaq	60(%rdx), %r10
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%bl, %bl
	cmovneq	%r9, %rbp
	cmovneq	%r10, %rcx
	movb	%bl, -30(%rsp)
	movl	(%rbp), %ebp
	cmpl	(%rcx), %ebp
	setne	-58(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	leaq	64(%rdi), %r9
	cmpq	$16, %r14
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	cmpq	$16, %r15
	leaq	64(%rdx), %r10
	movq	%rsi, %rbp
	cmovgq	%r10, %rbp
	testb	%cl, %cl
	cmovneq	%r9, %rbx
	cmovneq	%r10, %rbp
	movb	%cl, -31(%rsp)
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-59(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	leaq	68(%rdi), %r9
	cmpq	$17, %r14
	movq	%rsi, %rbp
	cmovgq	%r9, %rbp
	cmpq	$17, %r15
	leaq	68(%rdx), %r10
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%bl, %bl
	cmovneq	%r9, %rbp
	cmovneq	%r10, %rcx
	movb	%bl, -32(%rsp)
	movl	(%rbp), %ebp
	cmpl	(%rcx), %ebp
	setne	-60(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	cmpq	$18, %r14
	leaq	72(%rdi), %r9
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	cmpq	$18, %r15
	leaq	72(%rdx), %r10
	movq	%rsi, %rbp
	cmovgq	%r10, %rbp
	testb	%cl, %cl
	cmovneq	%r9, %rbx
	cmovneq	%r10, %rbp
	movb	%cl, -33(%rsp)
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-61(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	cmpq	$19, %r14
	leaq	76(%rdi), %r9
	movq	%rsi, %rbp
	cmovgq	%r9, %rbp
	cmpq	$19, %r15
	leaq	76(%rdx), %r10
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%bl, %bl
	cmovneq	%r9, %rbp
	cmovneq	%r10, %rcx
	movb	%bl, -34(%rsp)
	movl	(%rbp), %ebp
	cmpl	(%rcx), %ebp
	setne	-62(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	cmpq	$20, %r14
	leaq	80(%rdi), %r9
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	cmpq	$20, %r15
	leaq	80(%rdx), %r10
	movq	%rsi, %rbp
	cmovgq	%r10, %rbp
	testb	%cl, %cl
	cmovneq	%r9, %rbx
	cmovneq	%r10, %rbp
	movb	%cl, -35(%rsp)
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-63(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	cmpq	$21, %r14
	leaq	84(%rdi), %r9
	movq	%rsi, %rbp
	cmovgq	%r9, %rbp
	cmpq	$21, %r15
	leaq	84(%rdx), %r10
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%bl, %bl
	cmovneq	%r9, %rbp
	cmovneq	%r10, %rcx
	movb	%bl, -36(%rsp)
	movl	(%rbp), %ebp
	cmpl	(%rcx), %ebp
	setne	-64(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	cmpq	$22, %r14
	leaq	88(%rdi), %r9
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	cmpq	$22, %r15
	leaq	88(%rdx), %r10
	movq	%rsi, %rbp
	cmovgq	%r10, %rbp
	testb	%cl, %cl
	cmovneq	%r9, %rbx
	cmovneq	%r10, %rbp
	movb	%cl, -37(%rsp)
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-65(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	cmpq	$23, %r14
	leaq	92(%rdi), %r9
	movq	%rsi, %rbp
	cmovgq	%r9, %rbp
	cmpq	$23, %r15
	leaq	92(%rdx), %r10
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%bl, %bl
	cmovneq	%r9, %rbp
	cmovneq	%r10, %rcx
	movb	%bl, -38(%rsp)
	movl	(%rbp), %ebp
	cmpl	(%rcx), %ebp
	setne	-66(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	cmpq	$24, %r14
	leaq	96(%rdi), %r9
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	cmpq	$24, %r15
	leaq	96(%rdx), %r10
	movq	%rsi, %rbp
	cmovgq	%r10, %rbp
	testb	%cl, %cl
	cmovneq	%r9, %rbx
	cmovneq	%r10, %rbp
	movb	%cl, -39(%rsp)
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-67(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	cmpq	$25, %r14
	leaq	100(%rdi), %r9
	movq	%rsi, %rbp
	cmovgq	%r9, %rbp
	cmpq	$25, %r15
	leaq	100(%rdx), %r10
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%bl, %bl
	cmovneq	%r9, %rbp
	cmovneq	%r10, %rcx
	movb	%bl, -40(%rsp)
	movl	(%rbp), %ebp
	cmpl	(%rcx), %ebp
	setne	-68(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	cmpq	$26, %r14
	leaq	104(%rdi), %r9
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	cmpq	$26, %r15
	leaq	104(%rdx), %r10
	movq	%rsi, %rbp
	cmovgq	%r10, %rbp
	testb	%cl, %cl
	cmovneq	%r9, %rbx
	cmovneq	%r10, %rbp
	movb	%cl, -41(%rsp)
	movl	(%rbx), %ebx
	cmpl	(%rbp), %ebx
	setne	-69(%rsp)               # 1-byte Folded Spill
	sete	%r12b
	andb	%cl, %r12b
	cmpq	$27, %r14
	leaq	108(%rdi), %r9
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	cmpq	$27, %r15
	leaq	108(%rdx), %r10
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%r12b, %r12b
	cmovneq	%r9, %rbx
	cmovneq	%r10, %rcx
	movb	%r12b, -11(%rsp)
	movl	(%rbx), %ebx
	cmpl	(%rcx), %ebx
	setne	-70(%rsp)               # 1-byte Folded Spill
	sete	%bpl
	andb	%r12b, %bpl
	cmpq	$28, %r14
	leaq	112(%rdi), %r9
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	cmpq	$28, %r15
	leaq	112(%rdx), %r10
	movq	%rsi, %rcx
	cmovgq	%r10, %rcx
	testb	%bpl, %bpl
	cmovneq	%r9, %rbx
	cmovneq	%r10, %rcx
	movb	%bpl, -12(%rsp)
	movl	(%rbx), %ebx
	cmpl	(%rcx), %ebx
	setne	%r13b
	sete	%r10b
	andb	%bpl, %r10b
	cmpq	$29, %r14
	leaq	116(%rdi), %r9
	movq	%rsi, %rbx
	cmovgq	%r9, %rbx
	cmpq	$29, %r15
	leaq	116(%rdx), %rcx
	movq	%rsi, %rax
	cmovgq	%rcx, %rax
	testb	%r10b, %r10b
	cmovneq	%r9, %rbx
	cmovneq	%rcx, %rax
	movb	%r10b, -13(%rsp)
	movl	(%rbx), %ecx
	cmpl	(%rax), %ecx
	setne	%bl
	sete	%r9b
	andb	%r10b, %r9b
	cmpq	$30, %r14
	leaq	120(%rdi), %rdi
	movq	%rsi, %rcx
	cmovgq	%rdi, %rcx
	cmpq	$30, %r15
	leaq	120(%rdx), %rax
	movq	%rsi, %rdx
	cmovgq	%rax, %rdx
	testb	%r9b, %r9b
	cmovneq	%rdi, %rcx
	cmovneq	%rax, %rdx
	movb	%r9b, -14(%rsp)
	movl	(%rcx), %eax
	cmpl	(%rdx), %eax
	setne	%dil
	sete	%al
	andb	%r9b, %al
	addq	$124, %r8
	cmpq	$31, %r14
	movq	%rsi, %rdx
	cmovgq	%r8, %rdx
	addq	$124, %r11
	cmpq	$31, %r15
	movb	%al, -42(%rsp)
	cmovgq	%r11, %rsi
	testb	%al, %al
	cmovneq	%r8, %rdx
	cmovneq	%r11, %rsi
	movl	(%rdx), %eax
	xorl	%edx, %edx
	cmpl	(%rsi), %eax
	sete	%dl
	movb	-44(%rsp), %al          # 1-byte Reload
	andb	-16(%rsp), %al
	movb	-45(%rsp), %cl          # 1-byte Reload
	andb	-17(%rsp), %cl
	orb	%al, %cl
	movb	-46(%rsp), %al          # 1-byte Reload
	andb	-18(%rsp), %al
	orb	%cl, %al
	movb	-47(%rsp), %cl          # 1-byte Reload
	andb	-19(%rsp), %cl
	orb	%al, %cl
	movb	-48(%rsp), %al          # 1-byte Reload
	andb	-20(%rsp), %al
	orb	%cl, %al
	movb	-49(%rsp), %cl          # 1-byte Reload
	andb	-21(%rsp), %cl
	orb	%al, %cl
	movb	-50(%rsp), %al          # 1-byte Reload
	andb	-22(%rsp), %al
	orb	%cl, %al
	movb	-51(%rsp), %cl          # 1-byte Reload
	andb	-23(%rsp), %cl
	orb	%al, %cl
	movb	-52(%rsp), %al          # 1-byte Reload
	andb	-24(%rsp), %al
	orb	%cl, %al
	movb	-53(%rsp), %cl          # 1-byte Reload
	andb	-25(%rsp), %cl
	orb	%al, %cl
	movb	-54(%rsp), %al          # 1-byte Reload
	andb	-26(%rsp), %al
	orb	%cl, %al
	movb	-55(%rsp), %cl          # 1-byte Reload
	andb	-27(%rsp), %cl
	orb	%al, %cl
	movb	-56(%rsp), %al          # 1-byte Reload
	andb	-28(%rsp), %al
	orb	%cl, %al
	movb	-57(%rsp), %cl          # 1-byte Reload
	andb	-29(%rsp), %cl
	orb	%al, %cl
	movb	-58(%rsp), %al          # 1-byte Reload
	andb	-30(%rsp), %al
	orb	%cl, %al
	movb	-59(%rsp), %cl          # 1-byte Reload
	andb	-31(%rsp), %cl
	orb	%al, %cl
	movb	-60(%rsp), %al          # 1-byte Reload
	andb	-32(%rsp), %al
	orb	%cl, %al
	movb	-61(%rsp), %cl          # 1-byte Reload
	andb	-33(%rsp), %cl
	orb	%al, %cl
	movb	-62(%rsp), %al          # 1-byte Reload
	andb	-34(%rsp), %al
	orb	%cl, %al
	movb	-63(%rsp), %cl          # 1-byte Reload
	andb	-35(%rsp), %cl
	orb	%al, %cl
	movb	-64(%rsp), %al          # 1-byte Reload
	andb	-36(%rsp), %al
	orb	%cl, %al
	movb	-65(%rsp), %cl          # 1-byte Reload
	andb	-37(%rsp), %cl
	orb	%al, %cl
	movb	-66(%rsp), %al          # 1-byte Reload
	andb	-38(%rsp), %al
	orb	%cl, %al
	movb	-67(%rsp), %cl          # 1-byte Reload
	andb	-39(%rsp), %cl
	orb	%al, %cl
	movb	-68(%rsp), %al          # 1-byte Reload
	andb	-40(%rsp), %al
	orb	%cl, %al
	movb	-69(%rsp), %cl          # 1-byte Reload
	andb	-41(%rsp), %cl
	orb	%al, %cl
	movb	-70(%rsp), %al          # 1-byte Reload
	andb	%r12b, %al
	orb	%cl, %al
	andb	%bpl, %r13b
	orb	%al, %r13b
	andb	%r10b, %bl
	orb	%r13b, %bl
	andb	%r9b, %dil
	orb	%bl, %dil
	movb	-43(%rsp), %al          # 1-byte Reload
	andb	-15(%rsp), %al
	orb	%al, %dil
	xorl	%eax, %eax
	movl	%edi, %ecx
	andb	$1, %cl
	cmovel	%edx, %eax
	movb	%cl, -10(%rsp)
	orb	-42(%rsp), %dil
	andb	$1, %dil
	movb	%dil, -9(%rsp)
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
.Lfunc_end1:
	.size	comp, .Lfunc_end1-comp
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d\n"
	.size	.L.str, 4

	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits

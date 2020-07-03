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
	movq	%rcx, %r13
	movq	%rdx, %r8
	movq	%rsi, %r10
	movb	$1, -9(%rsp)
	movl	(%rdi), %r9d
	movl	(%rdx), %r11d
	leaq	4(%rdi), %rbp
	cmpq	$1, %rsi
	leaq	-8(%rsp), %rdx
	movq	%rdx, %rbx
	cmovgq	%rbp, %rbx
	leaq	4(%r8), %rcx
	cmpq	$1, %r13
	movq	%rdx, %rsi
	cmovgq	%rcx, %rsi
	cmpl	%r11d, %r9d
	movb	$1, -18(%rsp)
	cmoveq	%rbp, %rbx
	movl	(%rbx), %ebx
	cmoveq	%rcx, %rsi
	cmpl	(%rsi), %ebx
	setne	-50(%rsp)               # 1-byte Folded Spill
	sete	%cl
	cmpl	%r11d, %r9d
	setne	-51(%rsp)               # 1-byte Folded Spill
	sete	%bl
	sete	-17(%rsp)
	andb	%cl, %bl
	leaq	8(%rdi), %r9
	cmpq	$2, %r10
	movq	%rdx, %rsi
	cmovgq	%r9, %rsi
	leaq	8(%r8), %rbp
	cmpq	$2, %r13
	movq	%rdx, %rcx
	cmovgq	%rbp, %rcx
	testb	%bl, %bl
	cmovneq	%r9, %rsi
	movl	(%rsi), %esi
	cmovneq	%rbp, %rcx
	cmpl	(%rcx), %esi
	setne	-67(%rsp)               # 1-byte Folded Spill
	sete	%cl
	movb	%bl, -19(%rsp)
	andb	%bl, %cl
	leaq	12(%rdi), %r11
	cmpq	$3, %r10
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	leaq	12(%r8), %rbx
	cmpq	$3, %r13
	movq	%rdx, %rsi
	cmovgq	%rbx, %rsi
	testb	%cl, %cl
	cmovneq	%r11, %rbp
	movl	(%rbp), %ebp
	cmovneq	%rbx, %rsi
	cmpl	(%rsi), %ebp
	setne	-52(%rsp)               # 1-byte Folded Spill
	sete	%bl
	movb	%cl, -20(%rsp)
	andb	%cl, %bl
	leaq	16(%rdi), %r11
	cmpq	$4, %r10
	movq	%rdx, %rsi
	cmovgq	%r11, %rsi
	leaq	16(%r8), %rbp
	cmpq	$4, %r13
	movq	%rdx, %rcx
	cmovgq	%rbp, %rcx
	testb	%bl, %bl
	cmovneq	%r11, %rsi
	movl	(%rsi), %esi
	cmovneq	%rbp, %rcx
	cmpl	(%rcx), %esi
	setne	-53(%rsp)               # 1-byte Folded Spill
	sete	%cl
	movb	%bl, -21(%rsp)
	andb	%bl, %cl
	leaq	20(%rdi), %r11
	cmpq	$5, %r10
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	leaq	20(%r8), %rbx
	cmpq	$5, %r13
	movq	%rdx, %rsi
	cmovgq	%rbx, %rsi
	testb	%cl, %cl
	cmovneq	%r11, %rbp
	movl	(%rbp), %ebp
	cmovneq	%rbx, %rsi
	cmpl	(%rsi), %ebp
	setne	-54(%rsp)               # 1-byte Folded Spill
	sete	%bl
	movb	%cl, -22(%rsp)
	andb	%cl, %bl
	leaq	24(%rdi), %r11
	cmpq	$6, %r10
	movq	%rdx, %rsi
	cmovgq	%r11, %rsi
	leaq	24(%r8), %rbp
	cmpq	$6, %r13
	movq	%rdx, %rcx
	cmovgq	%rbp, %rcx
	testb	%bl, %bl
	cmovneq	%r11, %rsi
	movl	(%rsi), %esi
	cmovneq	%rbp, %rcx
	cmpl	(%rcx), %esi
	setne	-55(%rsp)               # 1-byte Folded Spill
	sete	%cl
	movb	%bl, -23(%rsp)
	andb	%bl, %cl
	leaq	28(%rdi), %r11
	cmpq	$7, %r10
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	leaq	28(%r8), %rbx
	cmpq	$7, %r13
	movq	%rdx, %rsi
	cmovgq	%rbx, %rsi
	testb	%cl, %cl
	cmovneq	%r11, %rbp
	movl	(%rbp), %ebp
	cmovneq	%rbx, %rsi
	cmpl	(%rsi), %ebp
	setne	-56(%rsp)               # 1-byte Folded Spill
	sete	%bl
	movb	%cl, -24(%rsp)
	andb	%cl, %bl
	leaq	32(%rdi), %r11
	cmpq	$8, %r10
	movq	%rdx, %rsi
	cmovgq	%r11, %rsi
	leaq	32(%r8), %rbp
	cmpq	$8, %r13
	movq	%rdx, %rcx
	cmovgq	%rbp, %rcx
	testb	%bl, %bl
	cmovneq	%r11, %rsi
	movl	(%rsi), %esi
	cmovneq	%rbp, %rcx
	cmpl	(%rcx), %esi
	setne	-57(%rsp)               # 1-byte Folded Spill
	sete	%cl
	movb	%bl, -25(%rsp)
	andb	%bl, %cl
	leaq	36(%rdi), %r11
	cmpq	$9, %r10
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	leaq	36(%r8), %rbx
	cmpq	$9, %r13
	movq	%rdx, %rsi
	cmovgq	%rbx, %rsi
	testb	%cl, %cl
	cmovneq	%r11, %rbp
	movl	(%rbp), %ebp
	cmovneq	%rbx, %rsi
	cmpl	(%rsi), %ebp
	setne	-58(%rsp)               # 1-byte Folded Spill
	sete	%bl
	movb	%cl, -26(%rsp)
	andb	%cl, %bl
	leaq	40(%rdi), %r11
	cmpq	$10, %r10
	movq	%rdx, %rsi
	cmovgq	%r11, %rsi
	leaq	40(%r8), %rbp
	cmpq	$10, %r13
	movq	%rdx, %rcx
	cmovgq	%rbp, %rcx
	testb	%bl, %bl
	cmovneq	%r11, %rsi
	movl	(%rsi), %esi
	cmovneq	%rbp, %rcx
	cmpl	(%rcx), %esi
	setne	-59(%rsp)               # 1-byte Folded Spill
	sete	%cl
	movb	%bl, -27(%rsp)
	andb	%bl, %cl
	leaq	44(%rdi), %r11
	cmpq	$11, %r10
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	leaq	44(%r8), %rbx
	cmpq	$11, %r13
	movq	%rdx, %rsi
	cmovgq	%rbx, %rsi
	testb	%cl, %cl
	cmovneq	%r11, %rbp
	movl	(%rbp), %ebp
	cmovneq	%rbx, %rsi
	cmpl	(%rsi), %ebp
	setne	-60(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	leaq	48(%rdi), %r11
	cmpq	$12, %r10
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	leaq	48(%r8), %r14
	cmpq	$12, %r13
	movq	%rdx, %rsi
	cmovgq	%r14, %rsi
	testb	%bl, %bl
	cmovneq	%r11, %rbp
	movb	%cl, -28(%rsp)
	movl	(%rbp), %ecx
	cmovneq	%r14, %rsi
	cmpl	(%rsi), %ecx
	setne	-75(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	leaq	52(%rdi), %r11
	cmpq	$13, %r10
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	cmpq	$13, %r13
	leaq	52(%r8), %r14
	movq	%rdx, %rsi
	cmovgq	%r14, %rsi
	testb	%cl, %cl
	cmovneq	%r11, %rbp
	movb	%bl, -29(%rsp)
	movl	(%rbp), %ebp
	cmovneq	%r14, %rsi
	cmpl	(%rsi), %ebp
	setne	-76(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	leaq	56(%rdi), %r11
	cmpq	$14, %r10
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	cmpq	$14, %r13
	leaq	56(%r8), %r14
	movq	%rdx, %rsi
	cmovgq	%r14, %rsi
	testb	%bl, %bl
	cmovneq	%r11, %rbp
	cmovneq	%r14, %rsi
	movb	%cl, -30(%rsp)
	movl	(%rbp), %ecx
	cmpl	(%rsi), %ecx
	setne	-61(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	leaq	60(%rdi), %r11
	cmpq	$15, %r10
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	cmpq	$15, %r13
	leaq	60(%r8), %r14
	movq	%rdx, %rsi
	cmovgq	%r14, %rsi
	testb	%cl, %cl
	cmovneq	%r11, %rbp
	cmovneq	%r14, %rsi
	movb	%bl, -31(%rsp)
	movl	(%rbp), %ebp
	cmpl	(%rsi), %ebp
	setne	-44(%rsp)               # 1-byte Folded Spill
	movb	%cl, -32(%rsp)
	sete	%bl
	andb	%cl, %bl
	leaq	64(%rdi), %r11
	cmpq	$16, %r10
	movq	%rdx, %rsi
	cmovgq	%r11, %rsi
	cmpq	$16, %r13
	leaq	64(%r8), %rbp
	movq	%rdx, %rcx
	cmovgq	%rbp, %rcx
	testb	%bl, %bl
	cmovneq	%r11, %rsi
	cmovneq	%rbp, %rcx
	movl	(%rsi), %esi
	cmpl	(%rcx), %esi
	movb	%bl, -33(%rsp)
	setne	-62(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	leaq	68(%rdi), %r11
	cmpq	$17, %r10
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	cmpq	$17, %r13
	leaq	68(%r8), %rbx
	movq	%rdx, %rsi
	cmovgq	%rbx, %rsi
	testb	%cl, %cl
	cmovneq	%r11, %rbp
	cmovneq	%rbx, %rsi
	movl	(%rbp), %ebp
	cmpl	(%rsi), %ebp
	movb	%cl, -34(%rsp)
	setne	-63(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	cmpq	$18, %r10
	leaq	72(%rdi), %r11
	movq	%rdx, %rsi
	cmovgq	%r11, %rsi
	cmpq	$18, %r13
	leaq	72(%r8), %rbp
	movq	%rdx, %rcx
	cmovgq	%rbp, %rcx
	testb	%bl, %bl
	cmovneq	%r11, %rsi
	cmovneq	%rbp, %rcx
	movl	(%rsi), %esi
	cmpl	(%rcx), %esi
	movb	%bl, -35(%rsp)
	setne	-64(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	cmpq	$19, %r10
	leaq	76(%rdi), %r11
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	cmpq	$19, %r13
	leaq	76(%r8), %rbx
	movq	%rdx, %rsi
	cmovgq	%rbx, %rsi
	testb	%cl, %cl
	cmovneq	%r11, %rbp
	cmovneq	%rbx, %rsi
	movl	(%rbp), %ebp
	cmpl	(%rsi), %ebp
	movb	%cl, -36(%rsp)
	setne	-65(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	cmpq	$20, %r10
	leaq	80(%rdi), %r11
	movq	%rdx, %rsi
	cmovgq	%r11, %rsi
	cmpq	$20, %r13
	leaq	80(%r8), %rbp
	movq	%rdx, %rcx
	cmovgq	%rbp, %rcx
	testb	%bl, %bl
	cmovneq	%r11, %rsi
	cmovneq	%rbp, %rcx
	movl	(%rsi), %esi
	cmpl	(%rcx), %esi
	movb	%bl, -37(%rsp)
	setne	-66(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	cmpq	$21, %r10
	leaq	84(%rdi), %r11
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	cmpq	$21, %r13
	leaq	84(%r8), %rbx
	movq	%rdx, %rsi
	cmovgq	%rbx, %rsi
	testb	%cl, %cl
	cmovneq	%r11, %rbp
	cmovneq	%rbx, %rsi
	movl	(%rbp), %ebp
	cmpl	(%rsi), %ebp
	movb	%cl, -38(%rsp)
	setne	-68(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	cmpq	$22, %r10
	leaq	88(%rdi), %r11
	movq	%rdx, %rsi
	cmovgq	%r11, %rsi
	cmpq	$22, %r13
	leaq	88(%r8), %rbp
	movq	%rdx, %rcx
	cmovgq	%rbp, %rcx
	testb	%bl, %bl
	cmovneq	%r11, %rsi
	cmovneq	%rbp, %rcx
	movl	(%rsi), %esi
	cmpl	(%rcx), %esi
	movb	%bl, -39(%rsp)
	setne	-70(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	cmpq	$23, %r10
	leaq	92(%rdi), %r11
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	cmpq	$23, %r13
	leaq	92(%r8), %rbx
	movq	%rdx, %rsi
	cmovgq	%rbx, %rsi
	testb	%cl, %cl
	cmovneq	%r11, %rbp
	cmovneq	%rbx, %rsi
	movl	(%rbp), %ebp
	cmpl	(%rsi), %ebp
	movb	%cl, -40(%rsp)
	setne	-71(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	cmpq	$24, %r10
	leaq	96(%rdi), %r11
	movq	%rdx, %rsi
	cmovgq	%r11, %rsi
	cmpq	$24, %r13
	leaq	96(%r8), %rbp
	movq	%rdx, %rcx
	cmovgq	%rbp, %rcx
	testb	%bl, %bl
	cmovneq	%r11, %rsi
	cmovneq	%rbp, %rcx
	movl	(%rsi), %esi
	cmpl	(%rcx), %esi
	movb	%bl, -41(%rsp)
	setne	-72(%rsp)               # 1-byte Folded Spill
	sete	%cl
	andb	%bl, %cl
	cmpq	$25, %r10
	leaq	100(%rdi), %r11
	movq	%rdx, %rbp
	cmovgq	%r11, %rbp
	cmpq	$25, %r13
	leaq	100(%r8), %rbx
	movq	%rdx, %rsi
	cmovgq	%rbx, %rsi
	testb	%cl, %cl
	cmovneq	%r11, %rbp
	cmovneq	%rbx, %rsi
	movl	(%rbp), %ebp
	cmpl	(%rsi), %ebp
	movb	%cl, -42(%rsp)
	setne	-73(%rsp)               # 1-byte Folded Spill
	sete	%bl
	andb	%cl, %bl
	cmpq	$26, %r10
	leaq	104(%rdi), %r11
	movq	%rdx, %rsi
	cmovgq	%r11, %rsi
	cmpq	$26, %r13
	leaq	104(%r8), %rbp
	movq	%rdx, %rcx
	cmovgq	%rbp, %rcx
	testb	%bl, %bl
	cmovneq	%r11, %rsi
	cmovneq	%rbp, %rcx
	movl	(%rsi), %esi
	cmpl	(%rcx), %esi
	movb	%bl, -43(%rsp)
	setne	-74(%rsp)               # 1-byte Folded Spill
	sete	%bpl
	andb	%bl, %bpl
	cmpq	$27, %r10
	leaq	108(%rdi), %r11
	movq	%rdx, %rsi
	cmovgq	%r11, %rsi
	cmpq	$27, %r13
	leaq	108(%r8), %rbx
	movq	%rdx, %rcx
	cmovgq	%rbx, %rcx
	testb	%bpl, %bpl
	cmovneq	%r11, %rsi
	cmovneq	%rbx, %rcx
	movl	(%rsi), %esi
	cmpl	(%rcx), %esi
	setne	%r12b
	sete	%r9b
	andb	%bpl, %r9b
	cmpq	$28, %r10
	leaq	112(%rdi), %r11
	movq	%rdx, %rsi
	cmovgq	%r11, %rsi
	cmpq	$28, %r13
	leaq	112(%r8), %r14
	movq	%rdx, %rcx
	cmovgq	%r14, %rcx
	testb	%r9b, %r9b
	cmovneq	%r11, %rsi
	cmovneq	%r14, %rcx
	movb	%bpl, -11(%rsp)
	movl	(%rsi), %esi
	cmpl	(%rcx), %esi
	setne	-69(%rsp)               # 1-byte Folded Spill
	sete	%r11b
	andb	%r9b, %r11b
	cmpq	$29, %r10
	leaq	116(%rdi), %r14
	movq	%rdx, %rsi
	cmovgq	%r14, %rsi
	cmpq	$29, %r13
	leaq	116(%r8), %r15
	movq	%rdx, %rcx
	cmovgq	%r15, %rcx
	testb	%r11b, %r11b
	cmovneq	%r14, %rsi
	cmovneq	%r15, %rcx
	movb	%r9b, -12(%rsp)
	movl	(%rsi), %esi
	cmpl	(%rcx), %esi
	setne	%r15b
	sete	%bl
	andb	%r11b, %bl
	cmpq	$30, %r10
	leaq	120(%rdi), %r14
	movq	%rdx, %rcx
	cmovgq	%r14, %rcx
	cmpq	$30, %r13
	leaq	120(%r8), %rsi
	movq	%rdx, %rax
	cmovgq	%rsi, %rax
	testb	%bl, %bl
	cmovneq	%r14, %rcx
	cmovneq	%rsi, %rax
	movb	%r11b, -13(%rsp)
	movl	(%rcx), %ecx
	cmpl	(%rax), %ecx
	setne	%sil
	sete	%cl
	andb	%bl, %cl
	addq	$124, %rdi
	cmpq	$31, %r10
	movq	%rdx, %rax
	cmovgq	%rdi, %rax
	addq	$124, %r8
	cmpq	$31, %r13
	cmovgq	%r8, %rdx
	testb	%cl, %cl
	cmovneq	%rdi, %rax
	cmovneq	%r8, %rdx
	movb	%bl, -14(%rsp)
	movl	(%rax), %eax
	cmpl	(%rdx), %eax
	setne	%dl
	sete	%al
	andb	%bpl, %r12b
	movb	%r12b, -47(%rsp)        # 1-byte Spill
	andb	%r9b, -69(%rsp)         # 1-byte Folded Spill
	andb	%r11b, %r15b
	movb	%r15b, -48(%rsp)        # 1-byte Spill
	andb	%bl, %sil
	movb	%sil, -49(%rsp)         # 1-byte Spill
	movb	%cl, -15(%rsp)
	andb	%cl, %al
	movb	%al, -45(%rsp)          # 1-byte Spill
	movl	%edx, %eax
	andb	%cl, %al
	movb	%al, -46(%rsp)          # 1-byte Spill
	xorb	$1, %al
	movzbl	%al, %eax
	movb	-50(%rsp), %cl          # 1-byte Reload
	andb	-17(%rsp), %cl
	movb	%cl, -50(%rsp)          # 1-byte Spill
	movb	-51(%rsp), %cl          # 1-byte Reload
	andb	-18(%rsp), %cl
	movb	%cl, -51(%rsp)          # 1-byte Spill
	movb	-67(%rsp), %cl          # 1-byte Reload
	andb	-19(%rsp), %cl
	movb	%cl, -67(%rsp)          # 1-byte Spill
	movb	-52(%rsp), %cl          # 1-byte Reload
	andb	-20(%rsp), %cl
	movb	%cl, -52(%rsp)          # 1-byte Spill
	movb	-53(%rsp), %cl          # 1-byte Reload
	andb	-21(%rsp), %cl
	movb	%cl, -53(%rsp)          # 1-byte Spill
	movb	-54(%rsp), %cl          # 1-byte Reload
	andb	-22(%rsp), %cl
	movb	%cl, -54(%rsp)          # 1-byte Spill
	movb	-55(%rsp), %cl          # 1-byte Reload
	andb	-23(%rsp), %cl
	movb	%cl, -55(%rsp)          # 1-byte Spill
	movb	-56(%rsp), %cl          # 1-byte Reload
	andb	-24(%rsp), %cl
	movb	%cl, -56(%rsp)          # 1-byte Spill
	movb	-57(%rsp), %cl          # 1-byte Reload
	andb	-25(%rsp), %cl
	movb	%cl, -57(%rsp)          # 1-byte Spill
	movb	-58(%rsp), %cl          # 1-byte Reload
	andb	-26(%rsp), %cl
	movb	%cl, -58(%rsp)          # 1-byte Spill
	movb	-59(%rsp), %cl          # 1-byte Reload
	andb	-27(%rsp), %cl
	movb	%cl, -59(%rsp)          # 1-byte Spill
	movb	-60(%rsp), %cl          # 1-byte Reload
	andb	-28(%rsp), %cl
	movb	%cl, -60(%rsp)          # 1-byte Spill
	movb	-75(%rsp), %cl          # 1-byte Reload
	andb	-29(%rsp), %cl
	movb	%cl, -75(%rsp)          # 1-byte Spill
	movb	-76(%rsp), %cl          # 1-byte Reload
	andb	-30(%rsp), %cl
	movb	%cl, -76(%rsp)          # 1-byte Spill
	movb	-61(%rsp), %r13b        # 1-byte Reload
	andb	-31(%rsp), %r13b
	movb	%r13b, -61(%rsp)        # 1-byte Spill
	movb	-44(%rsp), %r12b        # 1-byte Reload
	andb	-32(%rsp), %r12b
	movb	-62(%rsp), %r15b        # 1-byte Reload
	andb	-33(%rsp), %r15b
	movb	%r15b, -62(%rsp)        # 1-byte Spill
	movb	-63(%rsp), %r14b        # 1-byte Reload
	andb	-34(%rsp), %r14b
	movb	%r14b, -63(%rsp)        # 1-byte Spill
	movb	-64(%rsp), %bpl         # 1-byte Reload
	andb	-35(%rsp), %bpl
	movb	%bpl, -64(%rsp)         # 1-byte Spill
	movb	-65(%rsp), %bl          # 1-byte Reload
	andb	-36(%rsp), %bl
	movb	%bl, -65(%rsp)          # 1-byte Spill
	movb	-66(%rsp), %r11b        # 1-byte Reload
	andb	-37(%rsp), %r11b
	movb	%r11b, -66(%rsp)        # 1-byte Spill
	movb	-68(%rsp), %r10b        # 1-byte Reload
	andb	-38(%rsp), %r10b
	movb	%r10b, -68(%rsp)        # 1-byte Spill
	movb	-70(%rsp), %r9b         # 1-byte Reload
	andb	-39(%rsp), %r9b
	movb	%r9b, -70(%rsp)         # 1-byte Spill
	movb	-71(%rsp), %r8b         # 1-byte Reload
	andb	-40(%rsp), %r8b
	movb	%r8b, -71(%rsp)         # 1-byte Spill
	movb	-72(%rsp), %dil         # 1-byte Reload
	andb	-41(%rsp), %dil
	movb	%dil, -72(%rsp)         # 1-byte Spill
	movb	-73(%rsp), %sil         # 1-byte Reload
	andb	-42(%rsp), %sil
	movb	%sil, -73(%rsp)         # 1-byte Spill
	movb	-74(%rsp), %cl          # 1-byte Reload
	andb	-43(%rsp), %cl
	movb	%cl, -74(%rsp)          # 1-byte Spill
	xorl	%edx, %edx
	cmpb	$0, -49(%rsp)           # 1-byte Folded Reload
	cmovnel	%edx, %eax
	cmpb	$0, -48(%rsp)           # 1-byte Folded Reload
	cmovnel	%edx, %eax
	cmpb	$0, -69(%rsp)           # 1-byte Folded Reload
	cmovnel	%edx, %eax
	cmpb	$0, -47(%rsp)           # 1-byte Folded Reload
	cmovnel	%edx, %eax
	testb	%cl, %cl
	cmovnel	%edx, %eax
	testb	%sil, %sil
	cmovnel	%edx, %eax
	testb	%dil, %dil
	cmovnel	%edx, %eax
	testb	%r8b, %r8b
	cmovnel	%edx, %eax
	testb	%r9b, %r9b
	cmovnel	%edx, %eax
	testb	%r10b, %r10b
	cmovnel	%edx, %eax
	testb	%r11b, %r11b
	cmovnel	%edx, %eax
	testb	%bl, %bl
	cmovnel	%edx, %eax
	testb	%bpl, %bpl
	cmovnel	%edx, %eax
	testb	%r14b, %r14b
	cmovnel	%edx, %eax
	testb	%r15b, %r15b
	cmovnel	%edx, %eax
	testb	%r12b, %r12b
	cmovnel	%edx, %eax
	testb	%r13b, %r13b
	cmovnel	%edx, %eax
	cmpb	$0, -76(%rsp)           # 1-byte Folded Reload
	cmovnel	%edx, %eax
	cmpb	$0, -75(%rsp)           # 1-byte Folded Reload
	cmovnel	%edx, %eax
	movb	-60(%rsp), %r15b        # 1-byte Reload
	testb	%r15b, %r15b
	cmovnel	%edx, %eax
	movb	-59(%rsp), %r14b        # 1-byte Reload
	testb	%r14b, %r14b
	cmovnel	%edx, %eax
	movb	-58(%rsp), %dil         # 1-byte Reload
	testb	%dil, %dil
	cmovnel	%edx, %eax
	movb	-57(%rsp), %sil         # 1-byte Reload
	testb	%sil, %sil
	cmovnel	%edx, %eax
	movb	-56(%rsp), %r13b        # 1-byte Reload
	testb	%r13b, %r13b
	cmovnel	%edx, %eax
	movb	-55(%rsp), %r9b         # 1-byte Reload
	testb	%r9b, %r9b
	cmovnel	%edx, %eax
	movb	-54(%rsp), %bpl         # 1-byte Reload
	testb	%bpl, %bpl
	cmovnel	%edx, %eax
	movb	-53(%rsp), %r11b        # 1-byte Reload
	testb	%r11b, %r11b
	cmovnel	%edx, %eax
	movb	-52(%rsp), %r10b        # 1-byte Reload
	testb	%r10b, %r10b
	cmovnel	%edx, %eax
	movb	-67(%rsp), %bl          # 1-byte Reload
	testb	%bl, %bl
	cmovnel	%edx, %eax
	movb	-51(%rsp), %cl          # 1-byte Reload
	testb	%cl, %cl
	cmovnel	%edx, %eax
	movb	-50(%rsp), %r8b         # 1-byte Reload
	testb	%r8b, %r8b
	cmovnel	%edx, %eax
	movl	%ebx, %edx
	orb	%cl, %dl
	orb	%r10b, %dl
	orb	%r11b, %dl
	orb	%bpl, %dl
	orb	%r9b, %dl
	orb	%r13b, %dl
	orb	%sil, %dl
	orb	%dil, %dl
	orb	%r14b, %dl
	orb	%r15b, %dl
	orb	-75(%rsp), %dl          # 1-byte Folded Reload
	orb	-76(%rsp), %dl          # 1-byte Folded Reload
	orb	-61(%rsp), %dl          # 1-byte Folded Reload
	orb	%r12b, %dl
	orb	-62(%rsp), %dl          # 1-byte Folded Reload
	orb	-63(%rsp), %dl          # 1-byte Folded Reload
	orb	-64(%rsp), %dl          # 1-byte Folded Reload
	orb	-65(%rsp), %dl          # 1-byte Folded Reload
	orb	-66(%rsp), %dl          # 1-byte Folded Reload
	orb	-68(%rsp), %dl          # 1-byte Folded Reload
	orb	-70(%rsp), %dl          # 1-byte Folded Reload
	orb	-71(%rsp), %dl          # 1-byte Folded Reload
	orb	-72(%rsp), %dl          # 1-byte Folded Reload
	orb	-73(%rsp), %dl          # 1-byte Folded Reload
	orb	-74(%rsp), %dl          # 1-byte Folded Reload
	orb	-47(%rsp), %dl          # 1-byte Folded Reload
	orb	-69(%rsp), %dl          # 1-byte Folded Reload
	orb	-48(%rsp), %dl          # 1-byte Folded Reload
	orb	-49(%rsp), %dl          # 1-byte Folded Reload
	orb	-46(%rsp), %dl          # 1-byte Folded Reload
	movb	-45(%rsp), %cl          # 1-byte Reload
	movb	%cl, -16(%rsp)
	orb	%cl, %dl
	orb	%r8b, %dl
	andb	$1, %dl
	movb	%dl, -10(%rsp)
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

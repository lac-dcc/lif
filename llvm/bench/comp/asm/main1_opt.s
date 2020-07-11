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
	subq	$272, %rsp              # imm = 0x110
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	%eax, -272(%rbp,%rax,4)
	movl	%eax, -144(%rbp,%rax,4)
	leal	1(%rax), %ecx
	movl	%ecx, -268(%rbp,%rax,4)
	movl	%ecx, -140(%rbp,%rax,4)
	leal	2(%rax), %ecx
	movl	%ecx, -264(%rbp,%rax,4)
	movl	%ecx, -136(%rbp,%rax,4)
	leal	3(%rax), %ecx
	movl	%ecx, -260(%rbp,%rax,4)
	movl	%ecx, -132(%rbp,%rax,4)
	addq	$4, %rax
	cmpq	$32, %rax
	jne	.LBB0_1
# %bb.2:
	leaq	-144(%rbp), %rdi
	leaq	-272(%rbp), %rsi
	callq	comp
	movl	$.L.str, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB0_4
# %bb.3:                                # %SP_return
	xorl	%eax, %eax
	addq	$272, %rsp              # imm = 0x110
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB0_4:                                # %CallStackCheckFailBlk
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
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	(%rdi), %eax
	cmpl	(%rsi), %eax
	jne	.LBB1_32
# %bb.1:
	movl	4(%rdi), %eax
	cmpl	4(%rsi), %eax
	jne	.LBB1_32
# %bb.2:
	movl	8(%rdi), %eax
	cmpl	8(%rsi), %eax
	jne	.LBB1_32
# %bb.3:
	movl	12(%rdi), %eax
	cmpl	12(%rsi), %eax
	jne	.LBB1_32
# %bb.4:
	movl	16(%rdi), %eax
	cmpl	16(%rsi), %eax
	jne	.LBB1_32
# %bb.5:
	movl	20(%rdi), %eax
	cmpl	20(%rsi), %eax
	jne	.LBB1_32
# %bb.6:
	movl	24(%rdi), %eax
	cmpl	24(%rsi), %eax
	jne	.LBB1_32
# %bb.7:
	movl	28(%rdi), %eax
	cmpl	28(%rsi), %eax
	jne	.LBB1_32
# %bb.8:
	movl	32(%rdi), %eax
	cmpl	32(%rsi), %eax
	jne	.LBB1_32
# %bb.9:
	movl	36(%rdi), %eax
	cmpl	36(%rsi), %eax
	jne	.LBB1_32
# %bb.10:
	movl	40(%rdi), %eax
	cmpl	40(%rsi), %eax
	jne	.LBB1_32
# %bb.11:
	movl	44(%rdi), %eax
	cmpl	44(%rsi), %eax
	jne	.LBB1_32
# %bb.12:
	movl	48(%rdi), %eax
	cmpl	48(%rsi), %eax
	jne	.LBB1_32
# %bb.13:
	movl	52(%rdi), %eax
	cmpl	52(%rsi), %eax
	jne	.LBB1_32
# %bb.14:
	movl	56(%rdi), %eax
	cmpl	56(%rsi), %eax
	jne	.LBB1_32
# %bb.15:
	movl	60(%rdi), %eax
	cmpl	60(%rsi), %eax
	jne	.LBB1_32
# %bb.16:
	movl	64(%rdi), %eax
	cmpl	64(%rsi), %eax
	jne	.LBB1_32
# %bb.17:
	movl	68(%rdi), %eax
	cmpl	68(%rsi), %eax
	jne	.LBB1_32
# %bb.18:
	movl	72(%rdi), %eax
	cmpl	72(%rsi), %eax
	jne	.LBB1_32
# %bb.19:
	movl	76(%rdi), %eax
	cmpl	76(%rsi), %eax
	jne	.LBB1_32
# %bb.20:
	movl	80(%rdi), %eax
	cmpl	80(%rsi), %eax
	jne	.LBB1_32
# %bb.21:
	movl	84(%rdi), %eax
	cmpl	84(%rsi), %eax
	jne	.LBB1_32
# %bb.22:
	movl	88(%rdi), %eax
	cmpl	88(%rsi), %eax
	jne	.LBB1_32
# %bb.23:
	movl	92(%rdi), %eax
	cmpl	92(%rsi), %eax
	jne	.LBB1_32
# %bb.24:
	movl	96(%rdi), %eax
	cmpl	96(%rsi), %eax
	jne	.LBB1_32
# %bb.25:
	movl	100(%rdi), %eax
	cmpl	100(%rsi), %eax
	jne	.LBB1_32
# %bb.26:
	movl	104(%rdi), %eax
	cmpl	104(%rsi), %eax
	jne	.LBB1_32
# %bb.27:
	movl	108(%rdi), %eax
	cmpl	108(%rsi), %eax
	jne	.LBB1_32
# %bb.28:
	movl	112(%rdi), %eax
	cmpl	112(%rsi), %eax
	jne	.LBB1_32
# %bb.29:
	movl	116(%rdi), %eax
	cmpl	116(%rsi), %eax
	jne	.LBB1_32
# %bb.30:
	movl	120(%rdi), %eax
	cmpl	120(%rsi), %eax
	jne	.LBB1_32
# %bb.31:
	movl	124(%rdi), %ecx
	xorl	%eax, %eax
	cmpl	124(%rsi), %ecx
	sete	%al
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB1_32:
	.cfi_def_cfa %rbp, 16
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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

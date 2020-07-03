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
	leaq	-48(%rbp), %rsi
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
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	(%rdi), %ecx
	xorl	%eax, %eax
	cmpl	(%rsi), %ecx
	jne	.LBB1_33
# %bb.1:
	movl	4(%rdi), %ecx
	cmpl	4(%rsi), %ecx
	jne	.LBB1_33
# %bb.2:
	movl	8(%rdi), %ecx
	cmpl	8(%rsi), %ecx
	jne	.LBB1_33
# %bb.3:
	movl	12(%rdi), %ecx
	cmpl	12(%rsi), %ecx
	jne	.LBB1_33
# %bb.4:
	movl	16(%rdi), %ecx
	cmpl	16(%rsi), %ecx
	jne	.LBB1_33
# %bb.5:
	movl	20(%rdi), %ecx
	cmpl	20(%rsi), %ecx
	jne	.LBB1_33
# %bb.6:
	movl	24(%rdi), %ecx
	cmpl	24(%rsi), %ecx
	jne	.LBB1_33
# %bb.7:
	movl	28(%rdi), %ecx
	cmpl	28(%rsi), %ecx
	jne	.LBB1_33
# %bb.8:
	movl	32(%rdi), %ecx
	cmpl	32(%rsi), %ecx
	jne	.LBB1_33
# %bb.9:
	movl	36(%rdi), %ecx
	cmpl	36(%rsi), %ecx
	jne	.LBB1_33
# %bb.10:
	movl	40(%rdi), %ecx
	cmpl	40(%rsi), %ecx
	jne	.LBB1_33
# %bb.11:
	movl	44(%rdi), %ecx
	cmpl	44(%rsi), %ecx
	jne	.LBB1_33
# %bb.12:
	movl	48(%rdi), %ecx
	cmpl	48(%rsi), %ecx
	jne	.LBB1_33
# %bb.13:
	movl	52(%rdi), %ecx
	cmpl	52(%rsi), %ecx
	jne	.LBB1_33
# %bb.14:
	movl	56(%rdi), %ecx
	cmpl	56(%rsi), %ecx
	jne	.LBB1_33
# %bb.15:
	movl	60(%rdi), %ecx
	cmpl	60(%rsi), %ecx
	jne	.LBB1_33
# %bb.16:
	movl	64(%rdi), %ecx
	cmpl	64(%rsi), %ecx
	jne	.LBB1_33
# %bb.17:
	movl	68(%rdi), %ecx
	cmpl	68(%rsi), %ecx
	jne	.LBB1_33
# %bb.18:
	movl	72(%rdi), %ecx
	cmpl	72(%rsi), %ecx
	jne	.LBB1_33
# %bb.19:
	movl	76(%rdi), %ecx
	cmpl	76(%rsi), %ecx
	jne	.LBB1_33
# %bb.20:
	movl	80(%rdi), %ecx
	cmpl	80(%rsi), %ecx
	jne	.LBB1_33
# %bb.21:
	movl	84(%rdi), %ecx
	cmpl	84(%rsi), %ecx
	jne	.LBB1_33
# %bb.22:
	movl	88(%rdi), %ecx
	cmpl	88(%rsi), %ecx
	jne	.LBB1_33
# %bb.23:
	movl	92(%rdi), %ecx
	cmpl	92(%rsi), %ecx
	jne	.LBB1_33
# %bb.24:
	movl	96(%rdi), %ecx
	cmpl	96(%rsi), %ecx
	jne	.LBB1_33
# %bb.25:
	movl	100(%rdi), %ecx
	cmpl	100(%rsi), %ecx
	jne	.LBB1_33
# %bb.26:
	movl	104(%rdi), %ecx
	cmpl	104(%rsi), %ecx
	jne	.LBB1_33
# %bb.27:
	movl	108(%rdi), %ecx
	cmpl	108(%rsi), %ecx
	jne	.LBB1_33
# %bb.28:
	movl	112(%rdi), %ecx
	cmpl	112(%rsi), %ecx
	jne	.LBB1_33
# %bb.29:
	movl	116(%rdi), %ecx
	cmpl	116(%rsi), %ecx
	jne	.LBB1_33
# %bb.30:
	movl	120(%rdi), %ecx
	cmpl	120(%rsi), %ecx
	jne	.LBB1_33
# %bb.31:
	movl	124(%rdi), %ecx
	cmpl	124(%rsi), %ecx
	jne	.LBB1_33
# %bb.32:
	movl	$1, %eax
.LBB1_33:
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

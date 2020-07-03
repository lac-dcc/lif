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
	movabsq	$4294967296, %rax       # imm = 0x100000000
	movq	%rax, -272(%rbp)
	movl	$0, -144(%rbp)
	movabsq	$8589934593, %rax       # imm = 0x200000001
	movq	%rax, -140(%rbp)
	movabsq	$12884901890, %rax      # imm = 0x300000002
	movq	%rax, -264(%rbp)
	movabsq	$17179869187, %rax      # imm = 0x400000003
	movq	%rax, -132(%rbp)
	movabsq	$21474836484, %rax      # imm = 0x500000004
	movq	%rax, -256(%rbp)
	movabsq	$25769803781, %rax      # imm = 0x600000005
	movq	%rax, -124(%rbp)
	movabsq	$30064771078, %rax      # imm = 0x700000006
	movq	%rax, -248(%rbp)
	movabsq	$34359738375, %rax      # imm = 0x800000007
	movq	%rax, -116(%rbp)
	movabsq	$38654705672, %rax      # imm = 0x900000008
	movq	%rax, -240(%rbp)
	movabsq	$42949672969, %rax      # imm = 0xA00000009
	movq	%rax, -108(%rbp)
	movabsq	$47244640266, %rax      # imm = 0xB0000000A
	movq	%rax, -232(%rbp)
	movabsq	$51539607563, %rax      # imm = 0xC0000000B
	movq	%rax, -100(%rbp)
	movabsq	$55834574860, %rax      # imm = 0xD0000000C
	movq	%rax, -224(%rbp)
	movabsq	$60129542157, %rax      # imm = 0xE0000000D
	movq	%rax, -92(%rbp)
	movabsq	$64424509454, %rax      # imm = 0xF0000000E
	movq	%rax, -216(%rbp)
	movl	$15, -84(%rbp)
	movabsq	$73014444048, %rax      # imm = 0x1100000010
	movq	%rax, -208(%rbp)
	movq	%rax, -80(%rbp)
	movabsq	$81604378642, %rax      # imm = 0x1300000012
	movq	%rax, -200(%rbp)
	movq	%rax, -72(%rbp)
	movabsq	$90194313236, %rax      # imm = 0x1500000014
	movq	%rax, -192(%rbp)
	movq	%rax, -64(%rbp)
	movabsq	$98784247830, %rax      # imm = 0x1700000016
	movq	%rax, -184(%rbp)
	movq	%rax, -56(%rbp)
	movabsq	$107374182424, %rax     # imm = 0x1900000018
	movq	%rax, -176(%rbp)
	movq	%rax, -48(%rbp)
	movabsq	$115964117018, %rax     # imm = 0x1B0000001A
	movq	%rax, -168(%rbp)
	movq	%rax, -40(%rbp)
	movabsq	$124554051612, %rax     # imm = 0x1D0000001C
	movq	%rax, -160(%rbp)
	movq	%rax, -32(%rbp)
	movabsq	$133143986206, %rax     # imm = 0x1F0000001E
	movq	%rax, -152(%rbp)
	movq	%rax, -24(%rbp)
	leaq	-144(%rbp), %rdi
	leaq	-272(%rbp), %rsi
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
	addq	$272, %rsp              # imm = 0x110
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

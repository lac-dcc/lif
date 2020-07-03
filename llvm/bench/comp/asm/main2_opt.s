	.text
	.file	"llvm-link"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4               # -- Begin function main
.LCPI0_0:
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	3                       # 0x3
.LCPI0_1:
	.long	4                       # 0x4
	.long	5                       # 0x5
	.long	6                       # 0x6
	.long	7                       # 0x7
.LCPI0_2:
	.long	8                       # 0x8
	.long	9                       # 0x9
	.long	10                      # 0xa
	.long	11                      # 0xb
.LCPI0_3:
	.long	12                      # 0xc
	.long	13                      # 0xd
	.long	14                      # 0xe
	.long	15                      # 0xf
.LCPI0_4:
	.long	16                      # 0x10
	.long	17                      # 0x11
	.long	18                      # 0x12
	.long	19                      # 0x13
.LCPI0_5:
	.long	20                      # 0x14
	.long	21                      # 0x15
	.long	22                      # 0x16
	.long	23                      # 0x17
.LCPI0_6:
	.long	24                      # 0x18
	.long	25                      # 0x19
	.long	26                      # 0x1a
	.long	27                      # 0x1b
.LCPI0_7:
	.long	28                      # 0x1c
	.long	29                      # 0x1d
	.long	30                      # 0x1e
	.long	31                      # 0x1f
	.text
	.globl	main
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
	movaps	.LCPI0_0(%rip), %xmm0   # xmm0 = [0,1,2,3]
	movaps	%xmm0, -272(%rbp)
	movaps	%xmm0, -144(%rbp)
	movaps	.LCPI0_1(%rip), %xmm0   # xmm0 = [4,5,6,7]
	movaps	%xmm0, -256(%rbp)
	movaps	%xmm0, -128(%rbp)
	movaps	.LCPI0_2(%rip), %xmm0   # xmm0 = [8,9,10,11]
	movaps	%xmm0, -240(%rbp)
	movaps	%xmm0, -112(%rbp)
	movaps	.LCPI0_3(%rip), %xmm0   # xmm0 = [12,13,14,15]
	movaps	%xmm0, -224(%rbp)
	movaps	%xmm0, -96(%rbp)
	movaps	.LCPI0_4(%rip), %xmm0   # xmm0 = [16,17,18,19]
	movaps	%xmm0, -208(%rbp)
	movaps	%xmm0, -80(%rbp)
	movaps	.LCPI0_5(%rip), %xmm0   # xmm0 = [20,21,22,23]
	movaps	%xmm0, -192(%rbp)
	movaps	%xmm0, -64(%rbp)
	movaps	.LCPI0_6(%rip), %xmm0   # xmm0 = [24,25,26,27]
	movaps	%xmm0, -176(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	.LCPI0_7(%rip), %xmm0   # xmm0 = [28,29,30,31]
	movaps	%xmm0, -160(%rbp)
	movaps	%xmm0, -32(%rbp)
	movl	$-1, -272(%rbp)
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

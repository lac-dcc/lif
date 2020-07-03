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
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	movq	.L__const.main.a(%rip), %rax
	movq	%rax, -24(%rbp)
	movl	.L__const.main.a+8(%rip), %eax
	movl	%eax, -16(%rbp)
	leaq	-24(%rbp), %rdi
	callq	mu
	movl	-24(%rbp), %esi
	movl	-20(%rbp), %edx
	movl	-16(%rbp), %ecx
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB0_2
# %bb.1:                                # %SP_return
	xorl	%eax, %eax
	addq	$32, %rsp
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, -48(%rbp)         # 8-byte Spill
	movl	(%rdi), %r9d
	movl	4(%rdi), %r8d
	movl	%r9d, %eax
	andl	$1, %eax
	movl	%r8d, %ecx
	andl	$1, %ecx
	movl	8(%rdi), %edi
	movl	%edi, %edx
	andl	$1, %edx
	movl	%r9d, %esi
	andl	$2, %esi
	leal	(%rsi,%rax,4), %r11d
	movl	%r8d, %eax
	andl	$2, %eax
	leal	(%rax,%rcx,4), %r15d
	movl	%edi, %eax
	andl	$2, %eax
	leal	(%rax,%rdx,4), %r14d
	movl	%edi, %ecx
	andl	$4, %ecx
	movl	%edi, %eax
	shrl	$2, %eax
	andl	$2, %eax
	orl	%ecx, %eax
	movl	%r8d, %ecx
	andl	$4, %ecx
	movl	%r8d, %esi
	shrl	$2, %esi
	andl	$2, %esi
	orl	%ecx, %esi
	movl	%r9d, %ecx
	andl	$4, %ecx
	movl	%r9d, %edx
	shrl	$2, %edx
	andl	$2, %edx
	orl	%ecx, %edx
	movl	%r9d, %ebx
	shrl	$4, %ebx
	movl	%ebx, %ecx
	andl	$1, %ecx
	orl	%edx, %ecx
	movl	%r8d, %r13d
	shrl	$4, %r13d
	movl	%r13d, %edx
	andl	$1, %edx
	orl	%esi, %edx
	movl	%edi, %r12d
	shrl	$4, %r12d
	movl	%r12d, %esi
	andl	$1, %esi
	orl	%eax, %esi
	shll	$4, %r14d
	leal	(%r14,%rsi,4), %r14d
	andl	$2, %r12d
	shll	$4, %r15d
	leal	(%r15,%rdx,4), %r15d
	andl	$2, %r13d
	shll	$4, %r11d
	leal	(%r11,%rcx,4), %eax
	andl	$2, %ebx
	movl	%r9d, %r11d
	shrl	$6, %r11d
	movl	%r11d, %esi
	andl	$1, %esi
	orl	%ebx, %esi
	orl	%eax, %esi
	movl	%r8d, %ebx
	shrl	$6, %ebx
	movl	%ebx, %eax
	andl	$1, %eax
	orl	%r13d, %eax
	orl	%r15d, %eax
	movl	%edi, %r10d
	shrl	$6, %r10d
	movl	%r10d, %ecx
	andl	$1, %ecx
	orl	%r12d, %ecx
	orl	%r14d, %ecx
	andl	$2, %r10d
	andl	$2, %ebx
	andl	$2, %r11d
	movl	%r9d, %r13d
	shrl	$8, %r13d
	movl	%r13d, %r12d
	andl	$1, %r12d
	orl	%r11d, %r12d
	movl	%r8d, %r15d
	shrl	$8, %r15d
	movl	%r15d, %edx
	andl	$1, %edx
	orl	%ebx, %edx
	movl	%edi, %r14d
	shrl	$8, %r14d
	movl	%r14d, %ebx
	andl	$1, %ebx
	orl	%r10d, %ebx
	shll	$4, %ecx
	leal	(%rcx,%rbx,4), %r11d
	andl	$2, %r14d
	shll	$4, %eax
	leal	(%rax,%rdx,4), %ecx
	andl	$2, %r15d
	shll	$4, %esi
	leal	(%rsi,%r12,4), %eax
	andl	$2, %r13d
	movl	%r9d, %edx
	shrl	$10, %edx
	movl	%edx, %r10d
	andl	$1, %r10d
	orl	%r13d, %r10d
	orl	%eax, %r10d
	movl	%r8d, %ebx
	shrl	$10, %ebx
	movl	%ebx, %eax
	andl	$1, %eax
	orl	%r15d, %eax
	orl	%ecx, %eax
	movl	%edi, %esi
	shrl	$10, %esi
	movl	%esi, %ecx
	andl	$1, %ecx
	orl	%r14d, %ecx
	orl	%r11d, %ecx
	andl	$2, %esi
	andl	$2, %ebx
	andl	$2, %edx
	movl	%r9d, %r13d
	shrl	$12, %r13d
	movl	%r13d, %r12d
	andl	$1, %r12d
	orl	%edx, %r12d
	movl	%r8d, %r15d
	shrl	$12, %r15d
	movl	%r15d, %edx
	andl	$1, %edx
	orl	%ebx, %edx
	movl	%edi, %r14d
	shrl	$12, %r14d
	movl	%r14d, %ebx
	andl	$1, %ebx
	orl	%esi, %ebx
	shll	$4, %ecx
	leal	(%rcx,%rbx,4), %r11d
	andl	$2, %r14d
	shll	$4, %eax
	leal	(%rax,%rdx,4), %ecx
	andl	$2, %r15d
	shll	$4, %r10d
	leal	(%r10,%r12,4), %eax
	andl	$2, %r13d
	movl	%r9d, %edx
	shrl	$14, %edx
	movl	%edx, %r10d
	andl	$1, %r10d
	orl	%r13d, %r10d
	orl	%eax, %r10d
	movl	%r8d, %ebx
	shrl	$14, %ebx
	movl	%ebx, %eax
	andl	$1, %eax
	orl	%r15d, %eax
	orl	%ecx, %eax
	movl	%edi, %esi
	shrl	$14, %esi
	movl	%esi, %ecx
	andl	$1, %ecx
	orl	%r14d, %ecx
	orl	%r11d, %ecx
	andl	$2, %esi
	andl	$2, %ebx
	andl	$2, %edx
	movl	%r9d, %r13d
	shrl	$16, %r13d
	movl	%r13d, %r12d
	andl	$1, %r12d
	orl	%edx, %r12d
	movl	%r8d, %r15d
	shrl	$16, %r15d
	movl	%r15d, %edx
	andl	$1, %edx
	orl	%ebx, %edx
	movl	%edi, %r14d
	shrl	$16, %r14d
	movl	%r14d, %ebx
	andl	$1, %ebx
	orl	%esi, %ebx
	shll	$4, %ecx
	leal	(%rcx,%rbx,4), %r11d
	andl	$2, %r14d
	shll	$4, %eax
	leal	(%rax,%rdx,4), %ecx
	andl	$2, %r15d
	shll	$4, %r10d
	leal	(%r10,%r12,4), %eax
	andl	$2, %r13d
	movl	%r9d, %edx
	shrl	$18, %edx
	movl	%edx, %r10d
	andl	$1, %r10d
	orl	%r13d, %r10d
	orl	%eax, %r10d
	movl	%r8d, %ebx
	shrl	$18, %ebx
	movl	%ebx, %eax
	andl	$1, %eax
	orl	%r15d, %eax
	orl	%ecx, %eax
	movl	%edi, %esi
	shrl	$18, %esi
	movl	%esi, %ecx
	andl	$1, %ecx
	orl	%r14d, %ecx
	orl	%r11d, %ecx
	andl	$2, %esi
	andl	$2, %ebx
	andl	$2, %edx
	movl	%r9d, %r13d
	shrl	$20, %r13d
	movl	%r13d, %r12d
	andl	$1, %r12d
	orl	%edx, %r12d
	movl	%r8d, %r15d
	shrl	$20, %r15d
	movl	%r15d, %edx
	andl	$1, %edx
	orl	%ebx, %edx
	movl	%edi, %r14d
	shrl	$20, %r14d
	movl	%r14d, %ebx
	andl	$1, %ebx
	orl	%esi, %ebx
	shll	$4, %ecx
	leal	(%rcx,%rbx,4), %r11d
	andl	$2, %r14d
	shll	$4, %eax
	leal	(%rax,%rdx,4), %ecx
	andl	$2, %r15d
	shll	$4, %r10d
	leal	(%r10,%r12,4), %eax
	andl	$2, %r13d
	movl	%r9d, %edx
	shrl	$22, %edx
	movl	%edx, %r10d
	andl	$1, %r10d
	orl	%r13d, %r10d
	orl	%eax, %r10d
	movl	%r8d, %ebx
	shrl	$22, %ebx
	movl	%ebx, %eax
	andl	$1, %eax
	orl	%r15d, %eax
	orl	%ecx, %eax
	movl	%edi, %esi
	shrl	$22, %esi
	movl	%esi, %ecx
	andl	$1, %ecx
	orl	%r14d, %ecx
	orl	%r11d, %ecx
	andl	$2, %esi
	andl	$2, %ebx
	andl	$2, %edx
	movl	%r9d, %r13d
	shrl	$24, %r13d
	movl	%r13d, %r12d
	andl	$1, %r12d
	orl	%edx, %r12d
	movl	%r8d, %r15d
	shrl	$24, %r15d
	movl	%r15d, %edx
	andl	$1, %edx
	orl	%ebx, %edx
	movl	%edi, %r14d
	shrl	$24, %r14d
	movl	%r14d, %ebx
	andl	$1, %ebx
	orl	%esi, %ebx
	shll	$4, %ecx
	leal	(%rcx,%rbx,4), %r11d
	andl	$2, %r14d
	shll	$4, %eax
	leal	(%rax,%rdx,4), %ecx
	andl	$2, %r15d
	shll	$4, %r10d
	leal	(%r10,%r12,4), %eax
	andl	$2, %r13d
	movl	%r9d, %edx
	shrl	$26, %edx
	movl	%edx, %r10d
	andl	$1, %r10d
	orl	%r13d, %r10d
	orl	%eax, %r10d
	movl	%r8d, %ebx
	shrl	$26, %ebx
	movl	%ebx, %eax
	andl	$1, %eax
	orl	%r15d, %eax
	orl	%ecx, %eax
	movl	%edi, %esi
	shrl	$26, %esi
	movl	%esi, %ecx
	andl	$1, %ecx
	orl	%r14d, %ecx
	orl	%r11d, %ecx
	andl	$2, %esi
	andl	$2, %ebx
	andl	$2, %edx
	movl	%r9d, %r12d
	shrl	$28, %r12d
	movl	%r12d, %r15d
	andl	$1, %r15d
	orl	%edx, %r15d
	movl	%r8d, %r13d
	shrl	$28, %r13d
	movl	%r13d, %edx
	andl	$1, %edx
	orl	%ebx, %edx
	movl	%edi, %r14d
	shrl	$28, %r14d
	movl	%r14d, %ebx
	andl	$1, %ebx
	orl	%esi, %ebx
	shll	$4, %ecx
	leal	(%rcx,%rbx,4), %r11d
	shll	$4, %eax
	leal	(%rax,%rdx,4), %eax
	shll	$4, %r10d
	leal	(%r10,%r15,4), %ecx
	andl	$2, %r12d
	movl	%r9d, %edx
	shrl	$30, %edx
	andl	$1, %edx
	orl	%r12d, %edx
	andl	$2, %r13d
	orl	%ecx, %edx
	movl	%r8d, %ecx
	shrl	$30, %ecx
	andl	$1, %ecx
	orl	%r13d, %ecx
	andl	$2, %r14d
	orl	%eax, %ecx
	movl	%edi, %eax
	shrl	$30, %eax
	andl	$1, %eax
	orl	%r14d, %eax
	orl	%r11d, %eax
	shldl	$1, %r9d, %edx
	shldl	$1, %r8d, %ecx
	shldl	$1, %edi, %eax
	movq	-48(%rbp), %rsi         # 8-byte Reload
	movl	%eax, (%rsi)
	movl	%ecx, 4(%rsi)
	movl	%edx, 8(%rsi)
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	mu, .Lfunc_end1-mu
	.cfi_endproc
                                        # -- End function
	.type	.L__const.main.a,@object # @__const.main.a
	.section	.rodata,"a",@progbits
	.p2align	2
.L__const.main.a:
	.long	1                       # 0x1
	.long	3                       # 0x3
	.long	5                       # 0x5
	.size	.L__const.main.a, 12

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d\t%d\t%d\n"
	.size	.L.str, 10

	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits

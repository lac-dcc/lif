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
	movl	$3, %esi
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
# %bb.0:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	movl	(%rdi), %r8d
	movl	4(%rdi), %r9d
	movl	8(%rdi), %r10d
	movl	%r8d, %r15d
	sarl	%r15d
	movl	%r9d, %edx
	sarl	%edx
	movl	%r10d, %ebx
	sarl	%ebx
	movl	%r10d, %r11d
	andl	$1, %r11d
	movl	%r9d, %esi
	andl	$1, %esi
	movl	%r8d, %ecx
	andl	$1, %ecx
	movl	%r15d, %eax
	andl	$1, %eax
	leal	(%rax,%rcx,2), %r14d
	movl	%edx, %eax
	andl	$1, %eax
	leal	(%rax,%rsi,2), %r12d
	movl	%ebx, %ecx
	andl	$1, %ecx
	leal	(%rcx,%r11,2), %eax
	movl	%r8d, %r11d
	sarl	$3, %r11d
	movl	%r9d, %r13d
	sarl	$3, %r13d
	movl	%r10d, %ebp
	sarl	$3, %ebp
	andl	$2, %ebx
	leal	(%rbx,%rax,4), %ebx
	andl	$2, %edx
	leal	(%rdx,%r12,4), %edx
	andl	$2, %r15d
	leal	(%r15,%r14,4), %ecx
	movl	%r11d, %eax
	andl	$1, %eax
	orl	%ecx, %eax
	movl	%r13d, %ecx
	andl	$1, %ecx
	orl	%edx, %ecx
	movl	%ebp, %esi
	andl	$1, %esi
	orl	%ebx, %esi
	movl	%r8d, %r14d
	sarl	$5, %r14d
	movl	%r9d, %r15d
	sarl	$5, %r15d
	movl	%r10d, %r12d
	sarl	$5, %r12d
	andl	$2, %ebp
	leal	(%rbp,%rsi,4), %ebp
	andl	$2, %r13d
	leal	(%r13,%rcx,4), %ecx
	andl	$2, %r11d
	leal	(%r11,%rax,4), %eax
	movl	%r14d, %esi
	andl	$1, %esi
	orl	%eax, %esi
	movl	%r15d, %edx
	andl	$1, %edx
	orl	%ecx, %edx
	movl	%r12d, %ebx
	andl	$1, %ebx
	orl	%ebp, %ebx
	movl	%r8d, %r11d
	sarl	$7, %r11d
	movl	%r9d, %r13d
	sarl	$7, %r13d
	movl	%r10d, %ebp
	sarl	$7, %ebp
	andl	$2, %r12d
	leal	(%r12,%rbx,4), %r12d
	andl	$2, %r15d
	leal	(%r15,%rdx,4), %edx
	andl	$2, %r14d
	leal	(%r14,%rsi,4), %esi
	movl	%r11d, %ebx
	andl	$1, %ebx
	orl	%esi, %ebx
	movl	%r13d, %ecx
	andl	$1, %ecx
	orl	%edx, %ecx
	movl	%ebp, %eax
	andl	$1, %eax
	orl	%r12d, %eax
	movl	%r8d, %r14d
	sarl	$9, %r14d
	movl	%r9d, %r15d
	sarl	$9, %r15d
	movl	%r10d, %r12d
	sarl	$9, %r12d
	andl	$2, %ebp
	leal	(%rbp,%rax,4), %eax
	andl	$2, %r13d
	leal	(%r13,%rcx,4), %ecx
	andl	$2, %r11d
	leal	(%r11,%rbx,4), %ebp
	movl	%r14d, %ebx
	andl	$1, %ebx
	orl	%ebp, %ebx
	movl	%r15d, %edx
	andl	$1, %edx
	orl	%ecx, %edx
	movl	%r12d, %esi
	andl	$1, %esi
	orl	%eax, %esi
	movl	%r8d, %r11d
	sarl	$11, %r11d
	movl	%r9d, %r13d
	sarl	$11, %r13d
	movl	%r10d, %ebp
	sarl	$11, %ebp
	andl	$2, %r12d
	leal	(%r12,%rsi,4), %r12d
	andl	$2, %r15d
	leal	(%r15,%rdx,4), %edx
	andl	$2, %r14d
	leal	(%r14,%rbx,4), %ecx
	movl	%r11d, %esi
	andl	$1, %esi
	orl	%ecx, %esi
	movl	%r13d, %ecx
	andl	$1, %ecx
	orl	%edx, %ecx
	movl	%ebp, %eax
	andl	$1, %eax
	orl	%r12d, %eax
	movl	%r8d, %r14d
	sarl	$13, %r14d
	movl	%r9d, %r15d
	sarl	$13, %r15d
	movl	%r10d, %ebx
	sarl	$13, %ebx
	andl	$2, %ebp
	leal	(%rbp,%rax,4), %ebp
	andl	$2, %r13d
	leal	(%r13,%rcx,4), %ecx
	andl	$2, %r11d
	leal	(%r11,%rsi,4), %edx
	movl	%r14d, %eax
	andl	$1, %eax
	orl	%edx, %eax
	movl	%r15d, %edx
	andl	$1, %edx
	orl	%ecx, %edx
	movl	%ebx, %esi
	andl	$1, %esi
	orl	%ebp, %esi
	movl	%r8d, %r11d
	sarl	$15, %r11d
	movl	%r9d, %r12d
	sarl	$15, %r12d
	movl	%r10d, %ebp
	sarl	$15, %ebp
	andl	$2, %ebx
	leal	(%rbx,%rsi,4), %ebx
	andl	$2, %r15d
	leal	(%r15,%rdx,4), %edx
	andl	$2, %r14d
	leal	(%r14,%rax,4), %eax
	movl	%r11d, %esi
	andl	$1, %esi
	orl	%eax, %esi
	movl	%r12d, %ecx
	andl	$1, %ecx
	orl	%edx, %ecx
	movl	%ebp, %eax
	andl	$1, %eax
	orl	%ebx, %eax
	movl	%r8d, %r14d
	sarl	$17, %r14d
	movl	%r9d, %r15d
	sarl	$17, %r15d
	movl	%r10d, %ebx
	sarl	$17, %ebx
	andl	$2, %ebp
	leal	(%rbp,%rax,4), %ebp
	andl	$2, %r12d
	leal	(%r12,%rcx,4), %ecx
	andl	$2, %r11d
	leal	(%r11,%rsi,4), %edx
	movl	%r14d, %eax
	andl	$1, %eax
	orl	%edx, %eax
	movl	%r15d, %edx
	andl	$1, %edx
	orl	%ecx, %edx
	movl	%ebx, %esi
	andl	$1, %esi
	orl	%ebp, %esi
	movl	%r8d, %r11d
	sarl	$19, %r11d
	movl	%r9d, %r12d
	sarl	$19, %r12d
	movl	%r10d, %ebp
	sarl	$19, %ebp
	andl	$2, %ebx
	leal	(%rbx,%rsi,4), %ebx
	andl	$2, %r15d
	leal	(%r15,%rdx,4), %edx
	andl	$2, %r14d
	leal	(%r14,%rax,4), %eax
	movl	%r11d, %esi
	andl	$1, %esi
	orl	%eax, %esi
	movl	%r12d, %ecx
	andl	$1, %ecx
	orl	%edx, %ecx
	movl	%ebp, %eax
	andl	$1, %eax
	orl	%ebx, %eax
	movl	%r8d, %r14d
	sarl	$21, %r14d
	movl	%r9d, %r15d
	sarl	$21, %r15d
	movl	%r10d, %ebx
	sarl	$21, %ebx
	andl	$2, %ebp
	leal	(%rbp,%rax,4), %ebp
	andl	$2, %r12d
	leal	(%r12,%rcx,4), %ecx
	andl	$2, %r11d
	leal	(%r11,%rsi,4), %edx
	movl	%r14d, %eax
	andl	$1, %eax
	orl	%edx, %eax
	movl	%r15d, %edx
	andl	$1, %edx
	orl	%ecx, %edx
	movl	%ebx, %esi
	andl	$1, %esi
	orl	%ebp, %esi
	movl	%r8d, %r11d
	sarl	$23, %r11d
	movl	%r9d, %r12d
	sarl	$23, %r12d
	movl	%r10d, %ebp
	sarl	$23, %ebp
	andl	$2, %ebx
	leal	(%rbx,%rsi,4), %ebx
	andl	$2, %r15d
	leal	(%r15,%rdx,4), %edx
	andl	$2, %r14d
	leal	(%r14,%rax,4), %eax
	movl	%r11d, %esi
	andl	$1, %esi
	orl	%eax, %esi
	movl	%r12d, %ecx
	andl	$1, %ecx
	orl	%edx, %ecx
	movl	%ebp, %eax
	andl	$1, %eax
	orl	%ebx, %eax
	movl	%r8d, %r14d
	sarl	$25, %r14d
	movl	%r9d, %r15d
	sarl	$25, %r15d
	movl	%r10d, %ebx
	sarl	$25, %ebx
	andl	$2, %ebp
	leal	(%rbp,%rax,4), %eax
	andl	$2, %r12d
	leal	(%r12,%rcx,4), %ecx
	andl	$2, %r11d
	leal	(%r11,%rsi,4), %edx
	movl	%r14d, %ebp
	andl	$1, %ebp
	orl	%edx, %ebp
	movl	%r15d, %edx
	andl	$1, %edx
	orl	%ecx, %edx
	movl	%ebx, %esi
	andl	$1, %esi
	orl	%eax, %esi
	movl	%r8d, %r11d
	sarl	$27, %r11d
	movl	%r9d, %r12d
	sarl	$27, %r12d
	movl	%r10d, %eax
	sarl	$27, %eax
	andl	$2, %ebx
	leal	(%rbx,%rsi,4), %esi
	andl	$2, %r15d
	leal	(%r15,%rdx,4), %ebx
	andl	$2, %r14d
	leal	(%r14,%rbp,4), %ebp
	movl	%r11d, %edx
	andl	$1, %edx
	orl	%ebp, %edx
	movl	%r12d, %ecx
	andl	$1, %ecx
	orl	%ebx, %ecx
	movl	%eax, %ebx
	andl	$1, %ebx
	orl	%esi, %ebx
	sarl	$29, %r8d
	sarl	$29, %r9d
	sarl	$29, %r10d
	andl	$2, %eax
	leal	(%rax,%rbx,4), %eax
	andl	$2, %r12d
	leal	(%r12,%rcx,4), %esi
	andl	$2, %r11d
	leal	(%r11,%rdx,4), %edx
	movl	%r8d, %ecx
	andl	$1, %ecx
	orl	%edx, %ecx
	movl	%r9d, %edx
	andl	$1, %edx
	orl	%esi, %edx
	movl	%r10d, %esi
	andl	$1, %esi
	orl	%eax, %esi
	movl	%r8d, %eax
	shrl	$2, %eax
	movl	%r9d, %ebp
	shrl	$2, %ebp
	movl	%r10d, %ebx
	shrl	$2, %ebx
	andl	$2, %r10d
	leal	(%r10,%rsi,4), %esi
	andl	$2, %r9d
	leal	(%r9,%rdx,4), %edx
	andl	$2, %r8d
	leal	(%r8,%rcx,4), %ecx
	andl	$1, %eax
	orl	%ecx, %eax
	andl	$1, %ebp
	orl	%edx, %ebp
	andl	$1, %ebx
	orl	%esi, %ebx
	movl	%ebx, (%rdi)
	movl	%ebp, 4(%rdi)
	movl	%eax, 8(%rdi)
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end1:
	.size	mu, .Lfunc_end1-mu
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

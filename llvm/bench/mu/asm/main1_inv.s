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
	movq	$0, -24(%rbp)
	movl	$0, -16(%rbp)
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
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$88, %rsp
	.cfi_def_cfa_offset 104
	.cfi_offset %rbx, -16
	movl	$0, -120(%rsp)
	movb	$1, 79(%rsp)
	movq	$0, -128(%rsp)
	movb	(%rdi), %al
	movb	$1, 78(%rsp)
	leal	1(%rax), %ecx
	movzbl	%cl, %ecx
	decl	%ecx
	andl	$1, %ecx
	movl	%ecx, -120(%rsp)
	andb	$1, %al
	movb	%al, 77(%rsp)
	movb	4(%rdi), %al
	movb	$1, 76(%rsp)
	leal	1(%rax), %ecx
	movzbl	%cl, %ecx
	decl	%ecx
	andl	$1, %ecx
	movl	%ecx, -124(%rsp)
	andb	$1, %al
	movb	%al, 75(%rsp)
	movb	8(%rdi), %al
	movb	$1, 74(%rsp)
	leal	1(%rax), %ecx
	movzbl	%cl, %ecx
	decl	%ecx
	andl	$1, %ecx
	movl	%ecx, -128(%rsp)
	andb	$1, %al
	movb	%al, 73(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %eax
	leal	(%rax,%rax), %esi
	movl	%esi, -120(%rsp)
	movb	(%rdi), %dl
	movl	%edx, %ecx
	andb	$1, %cl
	movb	$1, 72(%rsp)
	leal	1(%rax,%rax), %eax
	incb	%dl
	movzbl	%dl, %edx
	andl	$1, %edx
	movl	%edx, %ebx
	negl	%ebx
	andl	%esi, %ebx
	decl	%edx
	andl	%eax, %edx
	orl	%ebx, %edx
	movl	%edx, -120(%rsp)
	movb	%cl, 71(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 70(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, 69(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 68(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, 67(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, 66(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, 65(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 64(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, 63(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 62(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, 61(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, 60(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, 59(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 58(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, 57(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 56(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, 55(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, 54(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, 53(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 52(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, 51(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 50(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, 49(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, 48(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, 47(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 46(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, 45(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 44(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, 43(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, 42(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, 41(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 40(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, 39(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 38(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, 37(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, 36(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, 35(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 34(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, 33(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 32(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, 31(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, 30(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, 29(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 28(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, 27(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 26(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, 25(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, 24(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, 23(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 22(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, 21(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 20(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, 19(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, 18(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, 17(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 16(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, 15(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 14(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, 13(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, 12(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, 11(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 10(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, 9(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 8(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, 7(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, 6(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, 5(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 4(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, 3(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, 2(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, 1(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, (%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -1(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -2(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -3(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -4(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -5(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -6(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -7(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -8(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -9(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -10(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -11(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -12(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -13(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -14(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -15(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -16(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -17(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -18(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -19(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -20(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -21(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -22(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -23(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -24(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -25(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -26(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -27(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -28(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -29(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -30(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -31(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -32(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -33(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -34(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -35(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -36(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -37(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -38(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -39(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -40(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -41(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -42(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -43(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -44(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -45(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -46(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -47(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -48(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -49(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -50(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -51(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -52(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -53(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -54(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -55(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -56(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -57(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -58(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -59(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -60(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -61(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -62(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -63(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -64(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -65(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -66(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -67(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -68(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -69(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -70(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -71(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -72(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -73(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -74(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -75(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -76(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -77(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -78(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -79(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -80(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -81(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -82(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -83(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -84(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -85(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -86(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -87(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -88(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -89(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -90(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -91(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -92(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -93(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -94(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -95(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -96(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -97(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -98(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -99(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -100(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -101(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -102(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -103(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -104(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -105(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -106(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -107(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %r9d
	movl	-124(%rsp), %r11d
	leal	(%r9,%r9), %r8d
	movl	%r8d, -128(%rsp)
	leal	(%r11,%r11), %r10d
	movl	%r10d, -124(%rsp)
	movl	-120(%rsp), %ebx
	leal	(%rbx,%rbx), %eax
	movl	%eax, -120(%rsp)
	movb	(%rdi), %cl
	movl	%ecx, %edx
	andb	$1, %dl
	movb	$1, -108(%rsp)
	leal	1(%rbx,%rbx), %ebx
	incb	%cl
	movzbl	%cl, %ecx
	andl	$1, %ecx
	movl	%ecx, %esi
	negl	%esi
	andl	%eax, %esi
	decl	%ecx
	andl	%ebx, %ecx
	orl	%esi, %ecx
	movl	%ecx, -120(%rsp)
	movb	%dl, -109(%rsp)
	movb	4(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -110(%rsp)
	leal	1(%r11,%r11), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r10d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -124(%rsp)
	movb	%cl, -111(%rsp)
	movb	8(%rdi), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	$1, -112(%rsp)
	leal	1(%r9,%r9), %edx
	incb	%al
	movzbl	%al, %eax
	andl	$1, %eax
	movl	%eax, %esi
	negl	%esi
	andl	%r8d, %esi
	decl	%eax
	andl	%edx, %eax
	orl	%esi, %eax
	movl	%eax, -128(%rsp)
	movb	%cl, -113(%rsp)
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-128(%rsp), %eax
	movl	%eax, (%rdi)
	movl	-124(%rsp), %eax
	movl	%eax, 4(%rdi)
	movl	-120(%rsp), %eax
	movl	%eax, 8(%rdi)
	movb	$1, -114(%rsp)
	addq	$88, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	mu, .Lfunc_end1-mu
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d\t%d\t%d\n"
	.size	.L.str, 10

	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits

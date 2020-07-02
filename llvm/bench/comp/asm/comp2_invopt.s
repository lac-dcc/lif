	.text
	.file	"comp2.c"
	.globl	comp                    # -- Begin function comp
	.p2align	4, 0x90
	.type	comp,@function
comp:                                   # @comp
.Lfunc_begin0:
	.file	1 "/home/luigi/dev/ufmg/static-analysis/side-channel/lif/llvm/bench/comp/sources/comp2.c"
	.loc	1 5 0                   # comp/sources/comp2.c:5:0
	.cfi_startproc
# %bb.0:
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: comp:b <- $rdx
	#DEBUG_VALUE: comp:b <- $rdx
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp0:
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
.Ltmp1:
	#DEBUG_VALUE: i <- 0
	.loc	1 7 13 prologue_end     # comp/sources/comp2.c:7:13
	movl	(%rdi), %r8d
	.loc	1 7 21 is_stmt 0        # comp/sources/comp2.c:7:21
	movl	(%rdx), %r9d
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	movl	%r8d, %r10d
	xorl	%r9d, %r10d
.Ltmp2:
	#DEBUG_VALUE: i <- 1
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	4(%rdi), %r11
	cmpq	$1, %rsi
	leaq	-32(%rbp), %r15
	movq	%r15, %rbx
	cmovgq	%r11, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	4(%rdx), %r14
	cmpq	$1, %rcx
	movq	%r15, %rax
	cmovgq	%r14, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	%r9d, %r8d
	cmoveq	%r11, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %r11d
	cmoveq	%r14, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	xorl	(%rax), %r11d
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	8(%rdi), %r8
	cmpq	$2, %rsi
	movq	%r15, %rax
	cmovgq	%r8, %rax
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	8(%rdx), %r9
	cmpq	$2, %rcx
	movq	%r15, %rbx
	cmovgq	%r9, %rbx
.Ltmp3:
	#DEBUG_VALUE: i <- 2
	.loc	1 0 21                  # comp/sources/comp2.c:0:21
	orl	%r10d, %r11d
	cmoveq	%r8, %rax
	sete	%r8b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rax), %eax
	cmoveq	%r9, %rbx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rbx), %eax
	sete	%r10b
.Ltmp4:
	#DEBUG_VALUE: i <- 3
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r8b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	12(%rdi), %r8
	cmpq	$3, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	12(%rdx), %r9
	cmpq	$3, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp5:
	#DEBUG_VALUE: i <- 4
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	16(%rdi), %r8
	cmpq	$4, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	16(%rdx), %r9
	cmpq	$4, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r10b
.Ltmp6:
	#DEBUG_VALUE: i <- 5
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	20(%rdi), %r8
	cmpq	$5, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	20(%rdx), %r9
	cmpq	$5, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp7:
	#DEBUG_VALUE: i <- 6
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	24(%rdi), %r8
	cmpq	$6, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	24(%rdx), %r9
	cmpq	$6, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r10b
.Ltmp8:
	#DEBUG_VALUE: i <- 7
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	28(%rdi), %r8
	cmpq	$7, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	28(%rdx), %r9
	cmpq	$7, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp9:
	#DEBUG_VALUE: i <- 8
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	32(%rdi), %r8
	cmpq	$8, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	32(%rdx), %r9
	cmpq	$8, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r10b
.Ltmp10:
	#DEBUG_VALUE: i <- 9
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	36(%rdi), %r8
	cmpq	$9, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	36(%rdx), %r9
	cmpq	$9, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp11:
	#DEBUG_VALUE: i <- 10
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	40(%rdi), %r8
	cmpq	$10, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	40(%rdx), %r9
	cmpq	$10, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r10b
.Ltmp12:
	#DEBUG_VALUE: i <- 11
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	44(%rdi), %r8
	cmpq	$11, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	44(%rdx), %r9
	cmpq	$11, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp13:
	#DEBUG_VALUE: i <- 12
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	48(%rdi), %r8
	cmpq	$12, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	48(%rdx), %r9
	cmpq	$12, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r10b
.Ltmp14:
	#DEBUG_VALUE: i <- 13
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	52(%rdi), %r8
	cmpq	$13, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	52(%rdx), %r9
	cmpq	$13, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp15:
	#DEBUG_VALUE: i <- 14
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	56(%rdi), %r8
	cmpq	$14, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	56(%rdx), %r9
	cmpq	$14, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r10b
.Ltmp16:
	#DEBUG_VALUE: i <- 15
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	60(%rdi), %r8
	cmpq	$15, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	60(%rdx), %r9
	cmpq	$15, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp17:
	#DEBUG_VALUE: i <- 16
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	64(%rdi), %r8
	cmpq	$16, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	64(%rdx), %r9
	cmpq	$16, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r10b
.Ltmp18:
	#DEBUG_VALUE: i <- 17
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	68(%rdi), %r8
	cmpq	$17, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	68(%rdx), %r9
	cmpq	$17, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp19:
	#DEBUG_VALUE: i <- 18
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	72(%rdi), %r8
	cmpq	$18, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	72(%rdx), %r9
	cmpq	$18, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r10b
.Ltmp20:
	#DEBUG_VALUE: i <- 19
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	76(%rdi), %r8
	cmpq	$19, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	76(%rdx), %r9
	cmpq	$19, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp21:
	#DEBUG_VALUE: i <- 20
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	80(%rdi), %r8
	cmpq	$20, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	80(%rdx), %r9
	cmpq	$20, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r10b
.Ltmp22:
	#DEBUG_VALUE: i <- 21
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	84(%rdi), %r8
	cmpq	$21, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	84(%rdx), %r9
	cmpq	$21, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp23:
	#DEBUG_VALUE: i <- 22
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	88(%rdi), %r8
	cmpq	$22, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	88(%rdx), %r9
	cmpq	$22, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r10b
.Ltmp24:
	#DEBUG_VALUE: i <- 23
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	92(%rdi), %r8
	cmpq	$23, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	92(%rdx), %r9
	cmpq	$23, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp25:
	#DEBUG_VALUE: i <- 24
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	96(%rdi), %r8
	cmpq	$24, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	96(%rdx), %r9
	cmpq	$24, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r10b
.Ltmp26:
	#DEBUG_VALUE: i <- 25
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	100(%rdi), %r8
	cmpq	$25, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	100(%rdx), %r9
	cmpq	$25, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp27:
	#DEBUG_VALUE: i <- 26
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	104(%rdi), %r8
	cmpq	$26, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	104(%rdx), %r9
	cmpq	$26, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r10b
.Ltmp28:
	#DEBUG_VALUE: i <- 27
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	108(%rdi), %r8
	cmpq	$27, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	108(%rdx), %r9
	cmpq	$27, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp29:
	#DEBUG_VALUE: i <- 28
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	112(%rdi), %r8
	cmpq	$28, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	112(%rdx), %r9
	cmpq	$28, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r10b
.Ltmp30:
	#DEBUG_VALUE: i <- 29
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %r10b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	116(%rdi), %r8
	cmpq	$29, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	116(%rdx), %r9
	cmpq	$29, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r10b, %r10b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%r11b
.Ltmp31:
	#DEBUG_VALUE: i <- 30
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r10b, %r11b
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	leaq	120(%rdi), %r8
	cmpq	$30, %rsi
	movq	%r15, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	leaq	120(%rdx), %r9
	cmpq	$30, %rcx
	movq	%r15, %rax
	cmovgq	%r9, %rax
	testb	%r11b, %r11b
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r9, %rax
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%rax), %ebx
	sete	%al
.Ltmp32:
	#DEBUG_VALUE: i <- 31
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%r11b, %al
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	addq	$124, %rdi
.Ltmp33:
	.loc	1 0 13                  # comp/sources/comp2.c:0:13
	cmpq	$31, %rsi
	movq	%r15, %rsi
	cmovgq	%rdi, %rsi
	.loc	1 7 21                  # comp/sources/comp2.c:7:21
	addq	$124, %rdx
.Ltmp34:
	.loc	1 0 21                  # comp/sources/comp2.c:0:21
	cmpq	$31, %rcx
	cmovgq	%rdx, %r15
	testb	%al, %al
	cmovneq	%rdi, %rsi
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	(%rsi), %ecx
	cmovneq	%rdx, %r15
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	(%r15), %ecx
	sete	%cl
.Ltmp35:
	#DEBUG_VALUE: i <- 32
	.loc	1 0 18                  # comp/sources/comp2.c:0:18
	andb	%al, %cl
	movzbl	%cl, %eax
.Ltmp36:
	.loc	1 9 1 is_stmt 1         # comp/sources/comp2.c:9:1
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp37:
.Lfunc_end0:
	.size	comp, .Lfunc_end0-comp
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin1:
	.loc	1 11 0                  # comp/sources/comp2.c:11:0
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
.Ltmp38:
	#DEBUG_VALUE: i <- 0
	.loc	1 13 45 prologue_end    # comp/sources/comp2.c:13:45
	movq	%rax, -272(%rbp)
	.loc	1 13 38 is_stmt 0       # comp/sources/comp2.c:13:38
	movl	$0, -144(%rbp)
	movabsq	$8589934593, %rax       # imm = 0x200000001
.Ltmp39:
	#DEBUG_VALUE: i <- 1
	movq	%rax, -140(%rbp)
	movabsq	$12884901890, %rax      # imm = 0x300000002
.Ltmp40:
	#DEBUG_VALUE: i <- 2
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -264(%rbp)
	movabsq	$17179869187, %rax      # imm = 0x400000003
.Ltmp41:
	#DEBUG_VALUE: i <- 3
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -132(%rbp)
	movabsq	$21474836484, %rax      # imm = 0x500000004
.Ltmp42:
	#DEBUG_VALUE: i <- 4
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -256(%rbp)
	movabsq	$25769803781, %rax      # imm = 0x600000005
.Ltmp43:
	#DEBUG_VALUE: i <- 5
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -124(%rbp)
	movabsq	$30064771078, %rax      # imm = 0x700000006
.Ltmp44:
	#DEBUG_VALUE: i <- 6
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -248(%rbp)
	movabsq	$34359738375, %rax      # imm = 0x800000007
.Ltmp45:
	#DEBUG_VALUE: i <- 7
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -116(%rbp)
	movabsq	$38654705672, %rax      # imm = 0x900000008
.Ltmp46:
	#DEBUG_VALUE: i <- 8
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -240(%rbp)
	movabsq	$42949672969, %rax      # imm = 0xA00000009
.Ltmp47:
	#DEBUG_VALUE: i <- 9
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -108(%rbp)
	movabsq	$47244640266, %rax      # imm = 0xB0000000A
.Ltmp48:
	#DEBUG_VALUE: i <- 10
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -232(%rbp)
	movabsq	$51539607563, %rax      # imm = 0xC0000000B
.Ltmp49:
	#DEBUG_VALUE: i <- 11
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -100(%rbp)
	movabsq	$55834574860, %rax      # imm = 0xD0000000C
.Ltmp50:
	#DEBUG_VALUE: i <- 12
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -224(%rbp)
	movabsq	$60129542157, %rax      # imm = 0xE0000000D
.Ltmp51:
	#DEBUG_VALUE: i <- 13
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -92(%rbp)
	movabsq	$64424509454, %rax      # imm = 0xF0000000E
.Ltmp52:
	#DEBUG_VALUE: i <- 14
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -216(%rbp)
.Ltmp53:
	#DEBUG_VALUE: i <- 15
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movl	$15, -84(%rbp)
	movabsq	$73014444048, %rax      # imm = 0x1100000010
.Ltmp54:
	#DEBUG_VALUE: i <- 16
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -208(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -80(%rbp)
	movabsq	$81604378642, %rax      # imm = 0x1300000012
.Ltmp55:
	#DEBUG_VALUE: i <- 18
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -200(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -72(%rbp)
	movabsq	$90194313236, %rax      # imm = 0x1500000014
.Ltmp56:
	#DEBUG_VALUE: i <- 20
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -192(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -64(%rbp)
	movabsq	$98784247830, %rax      # imm = 0x1700000016
.Ltmp57:
	#DEBUG_VALUE: i <- 22
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -184(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -56(%rbp)
	movabsq	$107374182424, %rax     # imm = 0x1900000018
.Ltmp58:
	#DEBUG_VALUE: i <- 24
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -176(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -48(%rbp)
	movabsq	$115964117018, %rax     # imm = 0x1B0000001A
.Ltmp59:
	#DEBUG_VALUE: i <- 26
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -168(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -40(%rbp)
	movabsq	$124554051612, %rax     # imm = 0x1D0000001C
.Ltmp60:
	#DEBUG_VALUE: i <- 28
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -160(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -32(%rbp)
	movabsq	$133143986206, %rax     # imm = 0x1F0000001E
.Ltmp61:
	#DEBUG_VALUE: i <- 30
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -152(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -24(%rbp)
.Ltmp62:
	#DEBUG_VALUE: i <- 32
	.loc	1 14 10 is_stmt 1       # comp/sources/comp2.c:14:10
	movl	$-1, -272(%rbp)
	leaq	-144(%rbp), %rdi
	leaq	-272(%rbp), %rdx
	.loc	1 15 13                 # comp/sources/comp2.c:15:13
	movl	$32, %esi
	movl	$32, %ecx
	callq	comp
.Ltmp63:
	#DEBUG_VALUE: main:r <- $eax
	.loc	1 16 5                  # comp/sources/comp2.c:16:5
	movl	$.L.str, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
.Ltmp64:
	callq	printf
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB1_2
.Ltmp65:
# %bb.1:                                # %SP_return
	.loc	1 17 5                  # comp/sources/comp2.c:17:5
	xorl	%eax, %eax
	addq	$272, %rsp              # imm = 0x110
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB1_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
.Ltmp66:
	#DEBUG_VALUE: i <- 32
	.loc	1 0 0 is_stmt 0         # comp/sources/comp2.c:0:0
	callq	__stack_chk_fail
.Ltmp67:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d\n"
	.size	.L.str, 4

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 10.0.0 " # string offset=0
.Linfo_string1:
	.asciz	"comp/sources/comp2.c"  # string offset=22
.Linfo_string2:
	.asciz	"/home/luigi/dev/ufmg/static-analysis/side-channel/lif/llvm/bench" # string offset=43
.Linfo_string3:
	.asciz	"comp"                  # string offset=108
.Linfo_string4:
	.asciz	"int"                   # string offset=113
.Linfo_string5:
	.asciz	"main"                  # string offset=117
.Linfo_string6:
	.asciz	"a"                     # string offset=122
.Linfo_string7:
	.asciz	"b"                     # string offset=124
.Linfo_string8:
	.asciz	"i"                     # string offset=126
.Linfo_string9:
	.asciz	"__ARRAY_SIZE_TYPE__"   # string offset=128
.Linfo_string10:
	.asciz	"r"                     # string offset=148
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp34-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Ltmp1-.Lfunc_begin0
	.quad	.Ltmp2-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp2-.Lfunc_begin0
	.quad	.Ltmp3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Ltmp4-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp4-.Lfunc_begin0
	.quad	.Ltmp5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	3                       # 3
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp5-.Lfunc_begin0
	.quad	.Ltmp6-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp6-.Lfunc_begin0
	.quad	.Ltmp7-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp7-.Lfunc_begin0
	.quad	.Ltmp8-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	6                       # 6
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp8-.Lfunc_begin0
	.quad	.Ltmp9-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	7                       # 7
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp9-.Lfunc_begin0
	.quad	.Ltmp10-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	8                       # 8
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp10-.Lfunc_begin0
	.quad	.Ltmp11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	9                       # 9
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp11-.Lfunc_begin0
	.quad	.Ltmp12-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp12-.Lfunc_begin0
	.quad	.Ltmp13-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	11                      # 11
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp14-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	12                      # 12
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp14-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	13                      # 13
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp16-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp16-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	15                      # 15
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp17-.Lfunc_begin0
	.quad	.Ltmp18-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	16                      # 16
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp18-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	17                      # 17
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp20-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	18                      # 18
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp20-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	19                      # 19
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp22-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	20                      # 20
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp22-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	21                      # 21
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp24-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	22                      # 22
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp24-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp26-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	24                      # 24
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp26-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	25                      # 25
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	26                      # 26
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	27                      # 27
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp29-.Lfunc_begin0
	.quad	.Ltmp30-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	28                      # 28
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp30-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	29                      # 29
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp32-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	30                      # 30
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp32-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	31                      # 31
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	32                      # 32
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc3:
	.quad	.Ltmp38-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp40-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp40-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp42-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	3                       # 3
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp42-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp44-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp44-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	6                       # 6
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	7                       # 7
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	8                       # 8
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp48-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	9                       # 9
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp48-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp50-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	11                      # 11
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp50-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	12                      # 12
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp52-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	13                      # 13
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp52-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp54-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	15                      # 15
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp54-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	16                      # 16
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp56-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	18                      # 18
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp56-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	20                      # 20
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp58-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	22                      # 22
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp58-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	24                      # 24
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp60-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	26                      # 26
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp60-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	28                      # 28
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp62-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	30                      # 30
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp62-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	32                      # 32
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp66-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	32                      # 32
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # super-register DW_OP_reg0
	.quad	0
	.quad	0
	.section	.debug_abbrev,"",@progbits
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	4                       # DWARF version number
	.long	.debug_abbrev           # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0xf8 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x55 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	227                     # DW_AT_type
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x43:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	234                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x52:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	234                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x61:0x1d DW_TAG_lexical_block
	.quad	.Ltmp0                  # DW_AT_low_pc
	.long	.Ltmp36-.Ltmp0          # DW_AT_high_pc
	.byte	5                       # Abbrev [5] 0x6e:0xf DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	227                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x7f:0x64 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	227                     # DW_AT_type
                                        # DW_AT_external
	.byte	7                       # Abbrev [7] 0x98:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\360~"
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0xa7:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\360}"
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	239                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0xb6:0xf DW_TAG_variable
	.long	.Ldebug_loc4            # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	227                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0xc5:0x1d DW_TAG_lexical_block
	.quad	.Ltmp38                 # DW_AT_low_pc
	.long	.Ltmp62-.Ltmp38         # DW_AT_high_pc
	.byte	5                       # Abbrev [5] 0xd2:0xf DW_TAG_variable
	.long	.Ldebug_loc3            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	227                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0xe3:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0xea:0x5 DW_TAG_pointer_type
	.long	227                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0xef:0xc DW_TAG_array_type
	.long	227                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0xf4:0x6 DW_TAG_subrange_type
	.long	251                     # DW_AT_type
	.byte	32                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xfb:0x7 DW_TAG_base_type
	.long	.Linfo_string9          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	0                       # End Of Children Mark
.Ldebug_info_end0:
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:

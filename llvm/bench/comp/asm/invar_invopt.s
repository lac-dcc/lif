	.text
	.file	"comp1.c"
	.globl	comp                    # -- Begin function comp
	.p2align	4, 0x90
	.type	comp,@function
comp:                                   # @comp
.Lfunc_begin0:
	.file	1 "/home/luigi/dev/ufmg/static-analysis/side-channel/lif/llvm/bench/comp/sources/comp1.c"
	.loc	1 5 0                   # comp1.c:5:0
	.cfi_startproc
# %bb.0:
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: comp:b <- $rcx
	#DEBUG_VALUE: comp:b <- $rcx
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp0:
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
.Ltmp1:
	#DEBUG_VALUE: i <- 0
	.loc	1 7 13 prologue_end     # comp1.c:7:13
	movl	(%rdi), %r8d
	.loc	1 7 21 is_stmt 0        # comp1.c:7:21
	movl	(%rcx), %r11d
	.loc	1 7 18                  # comp1.c:7:18
	movl	%r8d, %r10d
	xorl	%r11d, %r10d
.Ltmp2:
	#DEBUG_VALUE: i <- 1
	.loc	1 7 13                  # comp1.c:7:13
	leaq	4(%rdi), %r14
	cmpq	$1, %rdx
	leaq	-40(%rbp), %r12
	movq	%r12, %rbx
	cmovgq	%r14, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	4(%rcx), %r15
	cmpq	$1, %r9
	movq	%r12, %rax
	cmovgq	%r15, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	%r11d, %r8d
	cmoveq	%r14, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmoveq	%r15, %rax
	.loc	1 7 18                  # comp1.c:7:18
	xorl	(%rax), %ebx
	.loc	1 7 13                  # comp1.c:7:13
	leaq	8(%rdi), %r8
	cmpq	$2, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	8(%rcx), %r11
	cmpq	$2, %r9
	movq	%r12, %rax
	cmovgq	%r11, %rax
.Ltmp3:
	#DEBUG_VALUE: i <- 2
	.loc	1 0 21                  # comp1.c:0:21
	orl	%r10d, %ebx
	cmoveq	%r8, %rsi
	sete	%bl
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmoveq	%r11, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp4:
	#DEBUG_VALUE: i <- 3
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	12(%rdi), %r8
	cmpq	$3, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	12(%rcx), %r10
	cmpq	$3, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp5:
	#DEBUG_VALUE: i <- 4
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	16(%rdi), %r8
	cmpq	$4, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	16(%rcx), %r10
	cmpq	$4, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp6:
	#DEBUG_VALUE: i <- 5
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	20(%rdi), %r8
	cmpq	$5, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	20(%rcx), %r10
	cmpq	$5, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp7:
	#DEBUG_VALUE: i <- 6
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	24(%rdi), %r8
	cmpq	$6, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	24(%rcx), %r10
	cmpq	$6, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp8:
	#DEBUG_VALUE: i <- 7
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	28(%rdi), %r8
	cmpq	$7, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	28(%rcx), %r10
	cmpq	$7, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp9:
	#DEBUG_VALUE: i <- 8
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	32(%rdi), %r8
	cmpq	$8, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	32(%rcx), %r10
	cmpq	$8, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp10:
	#DEBUG_VALUE: i <- 9
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	36(%rdi), %r8
	cmpq	$9, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	36(%rcx), %r10
	cmpq	$9, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp11:
	#DEBUG_VALUE: i <- 10
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	40(%rdi), %r8
	cmpq	$10, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	40(%rcx), %r10
	cmpq	$10, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp12:
	#DEBUG_VALUE: i <- 11
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	44(%rdi), %r8
	cmpq	$11, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	44(%rcx), %r10
	cmpq	$11, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp13:
	#DEBUG_VALUE: i <- 12
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	48(%rdi), %r8
	cmpq	$12, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	48(%rcx), %r10
	cmpq	$12, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp14:
	#DEBUG_VALUE: i <- 13
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	52(%rdi), %r8
	cmpq	$13, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	52(%rcx), %r10
	cmpq	$13, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp15:
	#DEBUG_VALUE: i <- 14
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	56(%rdi), %r8
	cmpq	$14, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	56(%rcx), %r10
	cmpq	$14, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp16:
	#DEBUG_VALUE: i <- 15
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	60(%rdi), %r8
	cmpq	$15, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	60(%rcx), %r10
	cmpq	$15, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp17:
	#DEBUG_VALUE: i <- 16
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	64(%rdi), %r8
	cmpq	$16, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	64(%rcx), %r10
	cmpq	$16, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp18:
	#DEBUG_VALUE: i <- 17
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	68(%rdi), %r8
	cmpq	$17, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	68(%rcx), %r10
	cmpq	$17, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp19:
	#DEBUG_VALUE: i <- 18
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	72(%rdi), %r8
	cmpq	$18, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	72(%rcx), %r10
	cmpq	$18, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp20:
	#DEBUG_VALUE: i <- 19
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	76(%rdi), %r8
	cmpq	$19, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	76(%rcx), %r10
	cmpq	$19, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp21:
	#DEBUG_VALUE: i <- 20
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	80(%rdi), %r8
	cmpq	$20, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	80(%rcx), %r10
	cmpq	$20, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp22:
	#DEBUG_VALUE: i <- 21
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	84(%rdi), %r8
	cmpq	$21, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	84(%rcx), %r10
	cmpq	$21, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp23:
	#DEBUG_VALUE: i <- 22
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	88(%rdi), %r8
	cmpq	$22, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	88(%rcx), %r10
	cmpq	$22, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp24:
	#DEBUG_VALUE: i <- 23
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	92(%rdi), %r8
	cmpq	$23, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	92(%rcx), %r10
	cmpq	$23, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp25:
	#DEBUG_VALUE: i <- 24
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	96(%rdi), %r8
	cmpq	$24, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	96(%rcx), %r10
	cmpq	$24, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp26:
	#DEBUG_VALUE: i <- 25
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	100(%rdi), %r8
	cmpq	$25, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	100(%rcx), %r10
	cmpq	$25, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp27:
	#DEBUG_VALUE: i <- 26
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	104(%rdi), %r8
	cmpq	$26, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	104(%rcx), %r10
	cmpq	$26, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp28:
	#DEBUG_VALUE: i <- 27
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	108(%rdi), %r8
	cmpq	$27, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	108(%rcx), %r10
	cmpq	$27, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp29:
	#DEBUG_VALUE: i <- 28
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	112(%rdi), %r8
	cmpq	$28, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	112(%rcx), %r10
	cmpq	$28, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp30:
	#DEBUG_VALUE: i <- 29
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	leaq	116(%rdi), %r8
	cmpq	$29, %rdx
	movq	%r12, %rbx
	cmovgq	%r8, %rbx
	.loc	1 7 21                  # comp1.c:7:21
	leaq	116(%rcx), %r10
	cmpq	$29, %r9
	movq	%r12, %rsi
	cmovgq	%r10, %rsi
	testb	%al, %al
	cmovneq	%r8, %rbx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rbx), %ebx
	cmovneq	%r10, %rsi
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rsi), %ebx
	sete	%bl
.Ltmp31:
	#DEBUG_VALUE: i <- 30
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %bl
	.loc	1 7 13                  # comp1.c:7:13
	leaq	120(%rdi), %r8
	cmpq	$30, %rdx
	movq	%r12, %rsi
	cmovgq	%r8, %rsi
	.loc	1 7 21                  # comp1.c:7:21
	leaq	120(%rcx), %r10
	cmpq	$30, %r9
	movq	%r12, %rax
	cmovgq	%r10, %rax
	testb	%bl, %bl
	cmovneq	%r8, %rsi
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rsi), %esi
	cmovneq	%r10, %rax
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%rax), %esi
	sete	%al
.Ltmp32:
	#DEBUG_VALUE: i <- 31
	.loc	1 0 18                  # comp1.c:0:18
	andb	%bl, %al
	.loc	1 7 13                  # comp1.c:7:13
	addq	$124, %rdi
.Ltmp33:
	.loc	1 0 13                  # comp1.c:0:13
	cmpq	$31, %rdx
	movq	%r12, %rdx
	cmovgq	%rdi, %rdx
	.loc	1 7 21                  # comp1.c:7:21
	addq	$124, %rcx
.Ltmp34:
	.loc	1 0 21                  # comp1.c:0:21
	cmpq	$31, %r9
	cmovgq	%rcx, %r12
	testb	%al, %al
	cmovneq	%rdi, %rdx
	.loc	1 7 13                  # comp1.c:7:13
	movl	(%rdx), %edx
	cmovneq	%rcx, %r12
	.loc	1 7 18                  # comp1.c:7:18
	cmpl	(%r12), %edx
	sete	%cl
.Ltmp35:
	#DEBUG_VALUE: i <- 32
	.loc	1 0 18                  # comp1.c:0:18
	andb	%al, %cl
	movzbl	%cl, %eax
.Ltmp36:
	.loc	1 9 1 is_stmt 1         # comp1.c:9:1
	popq	%rbx
	popq	%r12
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
	.loc	1 11 0                  # comp1.c:11:0
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
	.loc	1 13 45 prologue_end    # comp1.c:13:45
	movq	%rax, -272(%rbp)
	.loc	1 13 38 is_stmt 0       # comp1.c:13:38
	movl	$0, -144(%rbp)
	movabsq	$8589934593, %rax       # imm = 0x200000001
.Ltmp39:
	#DEBUG_VALUE: i <- 1
	movq	%rax, -140(%rbp)
	movabsq	$12884901890, %rax      # imm = 0x300000002
.Ltmp40:
	#DEBUG_VALUE: i <- 2
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -264(%rbp)
	movabsq	$17179869187, %rax      # imm = 0x400000003
.Ltmp41:
	#DEBUG_VALUE: i <- 3
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -132(%rbp)
	movabsq	$21474836484, %rax      # imm = 0x500000004
.Ltmp42:
	#DEBUG_VALUE: i <- 4
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -256(%rbp)
	movabsq	$25769803781, %rax      # imm = 0x600000005
.Ltmp43:
	#DEBUG_VALUE: i <- 5
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -124(%rbp)
	movabsq	$30064771078, %rax      # imm = 0x700000006
.Ltmp44:
	#DEBUG_VALUE: i <- 6
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -248(%rbp)
	movabsq	$34359738375, %rax      # imm = 0x800000007
.Ltmp45:
	#DEBUG_VALUE: i <- 7
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -116(%rbp)
	movabsq	$38654705672, %rax      # imm = 0x900000008
.Ltmp46:
	#DEBUG_VALUE: i <- 8
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -240(%rbp)
	movabsq	$42949672969, %rax      # imm = 0xA00000009
.Ltmp47:
	#DEBUG_VALUE: i <- 9
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -108(%rbp)
	movabsq	$47244640266, %rax      # imm = 0xB0000000A
.Ltmp48:
	#DEBUG_VALUE: i <- 10
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -232(%rbp)
	movabsq	$51539607563, %rax      # imm = 0xC0000000B
.Ltmp49:
	#DEBUG_VALUE: i <- 11
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -100(%rbp)
	movabsq	$55834574860, %rax      # imm = 0xD0000000C
.Ltmp50:
	#DEBUG_VALUE: i <- 12
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -224(%rbp)
	movabsq	$60129542157, %rax      # imm = 0xE0000000D
.Ltmp51:
	#DEBUG_VALUE: i <- 13
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -92(%rbp)
	movabsq	$64424509454, %rax      # imm = 0xF0000000E
.Ltmp52:
	#DEBUG_VALUE: i <- 14
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -216(%rbp)
.Ltmp53:
	#DEBUG_VALUE: i <- 15
	.loc	1 13 38                 # comp1.c:13:38
	movl	$15, -84(%rbp)
	movabsq	$73014444048, %rax      # imm = 0x1100000010
.Ltmp54:
	#DEBUG_VALUE: i <- 16
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -208(%rbp)
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -80(%rbp)
	movabsq	$81604378642, %rax      # imm = 0x1300000012
.Ltmp55:
	#DEBUG_VALUE: i <- 18
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -200(%rbp)
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -72(%rbp)
	movabsq	$90194313236, %rax      # imm = 0x1500000014
.Ltmp56:
	#DEBUG_VALUE: i <- 20
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -192(%rbp)
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -64(%rbp)
	movabsq	$98784247830, %rax      # imm = 0x1700000016
.Ltmp57:
	#DEBUG_VALUE: i <- 22
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -184(%rbp)
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -56(%rbp)
	movabsq	$107374182424, %rax     # imm = 0x1900000018
.Ltmp58:
	#DEBUG_VALUE: i <- 24
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -176(%rbp)
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -48(%rbp)
	movabsq	$115964117018, %rax     # imm = 0x1B0000001A
.Ltmp59:
	#DEBUG_VALUE: i <- 26
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -168(%rbp)
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -40(%rbp)
	movabsq	$124554051612, %rax     # imm = 0x1D0000001C
.Ltmp60:
	#DEBUG_VALUE: i <- 28
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -160(%rbp)
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -32(%rbp)
	movabsq	$133143986206, %rax     # imm = 0x1F0000001E
.Ltmp61:
	#DEBUG_VALUE: i <- 30
	.loc	1 13 45                 # comp1.c:13:45
	movq	%rax, -152(%rbp)
	.loc	1 13 38                 # comp1.c:13:38
	movq	%rax, -24(%rbp)
.Ltmp62:
	#DEBUG_VALUE: i <- 32
	.loc	1 0 38                  # comp1.c:0:38
	leaq	-144(%rbp), %rdi
	leaq	-272(%rbp), %rcx
.Ltmp63:
	.loc	1 14 13 is_stmt 1       # comp1.c:14:13
	movl	$32, %esi
	movl	$32, %edx
	movl	$32, %r8d
	movl	$32, %r9d
	callq	comp
.Ltmp64:
	#DEBUG_VALUE: main:r <- $eax
	.loc	1 15 5                  # comp1.c:15:5
	movl	$.L.str, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
.Ltmp65:
	callq	printf
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB1_2
.Ltmp66:
# %bb.1:                                # %SP_return
	.loc	1 16 5                  # comp1.c:16:5
	xorl	%eax, %eax
	addq	$272, %rsp              # imm = 0x110
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB1_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
.Ltmp67:
	#DEBUG_VALUE: i <- 32
	.loc	1 0 0 is_stmt 0         # comp1.c:0:0
	callq	__stack_chk_fail
.Ltmp68:
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
	.asciz	"comp1.c"               # string offset=22
.Linfo_string2:
	.asciz	"/home/luigi/dev/ufmg/static-analysis/side-channel/lif/llvm/bench/comp/sources" # string offset=30
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
	.byte	82                      # DW_OP_reg2
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
	.quad	.Ltmp66-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	32                      # 32
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	32                      # 32
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
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
	.byte	14                      # DW_AT_decl_line
	.long	227                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0xc5:0x1d DW_TAG_lexical_block
	.quad	.Ltmp38                 # DW_AT_low_pc
	.long	.Ltmp63-.Ltmp38         # DW_AT_high_pc
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

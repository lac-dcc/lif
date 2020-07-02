	.text
	.file	"mu2.c"
	.globl	mu                      # -- Begin function mu
	.p2align	4, 0x90
	.type	mu,@function
mu:                                     # @mu
.Lfunc_begin0:
	.file	1 "/home/luigi/dev/ufmg/static-analysis/side-channel/lif/llvm/bench/mu/sources/mu2.c"
	.loc	1 4 0                   # mu/sources/mu2.c:4:0
	.cfi_startproc
# %bb.0:
	#DEBUG_VALUE: mu:a <- $rdi
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	#DEBUG_VALUE: mu:a <- $rdi
.Ltmp0:
	.loc	1 7 24 prologue_end     # mu/sources/mu2.c:7:24
	movl	$0, -12(%rbp)
	.loc	1 7 10 is_stmt 0        # mu/sources/mu2.c:7:10
	movq	$0, -20(%rbp)
.Ltmp1:
	#DEBUG_VALUE: mu:i <- 0
	.loc	1 12 13 is_stmt 1       # mu/sources/mu2.c:12:13
	movl	(%rdi), %eax
	.loc	1 12 18 is_stmt 0       # mu/sources/mu2.c:12:18
	andl	$1, %eax
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	movl	%eax, -12(%rbp)
.Ltmp2:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu2.c:13:13
	movl	4(%rdi), %eax
	.loc	1 13 18 is_stmt 0       # mu/sources/mu2.c:13:18
	andl	$1, %eax
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	movl	%eax, -16(%rbp)
.Ltmp3:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu2.c:14:13
	movl	8(%rdi), %eax
	.loc	1 14 18 is_stmt 0       # mu/sources/mu2.c:14:18
	andl	$1, %eax
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	movl	%eax, -20(%rbp)
.Ltmp4:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp5:
	#DEBUG_VALUE: mu:i <- 1
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp6:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp7:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp8:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp9:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp10:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp11:
	#DEBUG_VALUE: mu:i <- 2
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp12:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp13:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp14:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp15:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp16:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp17:
	#DEBUG_VALUE: mu:i <- 3
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp18:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp19:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp20:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp21:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp22:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp23:
	#DEBUG_VALUE: mu:i <- 4
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp24:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp25:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp26:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp27:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp28:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp29:
	#DEBUG_VALUE: mu:i <- 5
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp30:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp31:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp32:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp33:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp34:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp35:
	#DEBUG_VALUE: mu:i <- 6
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp36:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp37:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp38:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp39:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp40:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp41:
	#DEBUG_VALUE: mu:i <- 7
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp42:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp43:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp44:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp45:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp46:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp47:
	#DEBUG_VALUE: mu:i <- 8
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp48:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp49:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp50:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp51:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp52:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp53:
	#DEBUG_VALUE: mu:i <- 9
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp54:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp55:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp56:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp57:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp58:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp59:
	#DEBUG_VALUE: mu:i <- 10
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp60:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp61:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp62:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp63:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp64:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp65:
	#DEBUG_VALUE: mu:i <- 11
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp66:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp67:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp68:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp69:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp70:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp71:
	#DEBUG_VALUE: mu:i <- 12
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp72:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp73:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp74:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp75:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp76:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp77:
	#DEBUG_VALUE: mu:i <- 13
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp78:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp79:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp80:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp81:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp82:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp83:
	#DEBUG_VALUE: mu:i <- 14
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp84:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp85:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp86:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp87:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp88:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp89:
	#DEBUG_VALUE: mu:i <- 15
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp90:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp91:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp92:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp93:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp94:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp95:
	#DEBUG_VALUE: mu:i <- 16
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp96:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp97:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp98:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp99:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp100:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp101:
	#DEBUG_VALUE: mu:i <- 17
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp102:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp103:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp104:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp105:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp106:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp107:
	#DEBUG_VALUE: mu:i <- 18
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp108:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp109:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp110:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp111:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp112:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp113:
	#DEBUG_VALUE: mu:i <- 19
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp114:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp115:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp116:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp117:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp118:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp119:
	#DEBUG_VALUE: mu:i <- 20
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp120:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp121:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp122:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp123:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp124:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp125:
	#DEBUG_VALUE: mu:i <- 21
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp126:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp127:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp128:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp129:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp130:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp131:
	#DEBUG_VALUE: mu:i <- 22
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp132:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp133:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp134:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp135:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp136:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp137:
	#DEBUG_VALUE: mu:i <- 23
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp138:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp139:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp140:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp141:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp142:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp143:
	#DEBUG_VALUE: mu:i <- 24
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp144:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp145:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp146:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp147:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp148:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp149:
	#DEBUG_VALUE: mu:i <- 25
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp150:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp151:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp152:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp153:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp154:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp155:
	#DEBUG_VALUE: mu:i <- 26
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp156:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp157:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp158:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp159:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp160:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp161:
	#DEBUG_VALUE: mu:i <- 27
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp162:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp163:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp164:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp165:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp166:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp167:
	#DEBUG_VALUE: mu:i <- 28
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp168:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp169:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp170:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp171:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp172:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp173:
	#DEBUG_VALUE: mu:i <- 29
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp174:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp175:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp176:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp177:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp178:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp179:
	#DEBUG_VALUE: mu:i <- 30
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp180:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp181:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp182:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp183:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp184:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp185:
	#DEBUG_VALUE: mu:i <- 31
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp186:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu2.c:10:14
	movl	-16(%rbp), %ecx
	.loc	1 9 14                  # mu/sources/mu2.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu2.c:10:14
	leal	(%rcx,%rcx), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu2.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	%edx, -12(%rbp)
.Ltmp187:
	.loc	1 12 28                 # mu/sources/mu2.c:12:28
	addl	%eax, %eax
	addl	$1, %eax
	testb	$1, (%rdi)
	cmovel	%edx, %eax
	movl	%eax, -12(%rbp)
.Ltmp188:
	.loc	1 13 28                 # mu/sources/mu2.c:13:28
	leal	(%rcx,%rcx), %eax
	addl	$1, %eax
	testb	$1, 4(%rdi)
	cmovel	%esi, %eax
	movl	%eax, -16(%rbp)
	testb	$1, 8(%rdi)
.Ltmp189:
	.loc	1 14 28                 # mu/sources/mu2.c:14:28
	leal	1(%r8,%r8), %eax
	cmovel	%r9d, %eax
	movl	%eax, -20(%rbp)
.Ltmp190:
	.loc	1 15 14                 # mu/sources/mu2.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu2.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu2.c:17:14
	sarl	8(%rdi)
.Ltmp191:
	#DEBUG_VALUE: mu:i <- 32
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	movl	-20(%rbp), %eax
	.loc	1 19 10 is_stmt 1       # mu/sources/mu2.c:19:10
	movl	%eax, (%rdi)
	.loc	1 20 12                 # mu/sources/mu2.c:20:12
	movl	-16(%rbp), %eax
	.loc	1 20 10 is_stmt 0       # mu/sources/mu2.c:20:10
	movl	%eax, 4(%rdi)
	.loc	1 21 12 is_stmt 1       # mu/sources/mu2.c:21:12
	movl	-12(%rbp), %eax
	.loc	1 21 10 is_stmt 0       # mu/sources/mu2.c:21:10
	movl	%eax, 8(%rdi)
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB0_2
.Ltmp192:
# %bb.1:                                # %SP_return
	#DEBUG_VALUE: mu:i <- 32
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 22 1 is_stmt 1        # mu/sources/mu2.c:22:1
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp193:
.LBB0_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	#DEBUG_VALUE: mu:i <- 32
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	callq	__stack_chk_fail
.Ltmp194:
.Lfunc_end0:
	.size	mu, .Lfunc_end0-mu
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin1:
	.loc	1 24 0 is_stmt 1        # mu/sources/mu2.c:24:0
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
.Ltmp195:
	.loc	1 25 9 prologue_end     # mu/sources/mu2.c:25:9
	movq	.L__const.main.a(%rip), %rax
	movq	%rax, -24(%rbp)
	movl	.L__const.main.a+8(%rip), %eax
	movl	%eax, -16(%rbp)
	leaq	-24(%rbp), %rdi
	.loc	1 26 5                  # mu/sources/mu2.c:26:5
	movl	$3, %esi
	callq	mu
	.loc	1 27 28                 # mu/sources/mu2.c:27:28
	movl	-24(%rbp), %esi
	.loc	1 27 34 is_stmt 0       # mu/sources/mu2.c:27:34
	movl	-20(%rbp), %edx
	.loc	1 27 40                 # mu/sources/mu2.c:27:40
	movl	-16(%rbp), %ecx
	.loc	1 27 5                  # mu/sources/mu2.c:27:5
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB1_2
# %bb.1:                                # %SP_return
	.loc	1 28 1 is_stmt 1        # mu/sources/mu2.c:28:1
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB1_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	.loc	1 0 0 is_stmt 0         # mu/sources/mu2.c:0:0
	callq	__stack_chk_fail
.Ltmp196:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
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

	.file	2 "/usr/include/bits/types.h"
	.file	3 "/usr/include/bits/stdint-intn.h"
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 10.0.0 " # string offset=0
.Linfo_string1:
	.asciz	"mu/sources/mu2.c"      # string offset=22
.Linfo_string2:
	.asciz	"/home/luigi/dev/ufmg/static-analysis/side-channel/lif/llvm/bench" # string offset=39
.Linfo_string3:
	.asciz	"mu"                    # string offset=104
.Linfo_string4:
	.asciz	"main"                  # string offset=107
.Linfo_string5:
	.asciz	"int"                   # string offset=112
.Linfo_string6:
	.asciz	"b"                     # string offset=116
.Linfo_string7:
	.asciz	"__int32_t"             # string offset=118
.Linfo_string8:
	.asciz	"int32_t"               # string offset=128
.Linfo_string9:
	.asciz	"__ARRAY_SIZE_TYPE__"   # string offset=136
.Linfo_string10:
	.asciz	"a"                     # string offset=156
.Linfo_string11:
	.asciz	"i"                     # string offset=158
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0-.Lfunc_begin0
	.quad	.Ltmp194-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp1-.Lfunc_begin0
	.quad	.Ltmp5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp5-.Lfunc_begin0
	.quad	.Ltmp11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp11-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp17-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	3                       # 3
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp29-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	6                       # 6
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	7                       # 7
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	8                       # 8
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	9                       # 9
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp65-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	11                      # 11
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	12                      # 12
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	13                      # 13
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Ltmp95-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	15                      # 15
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Ltmp101-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	16                      # 16
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp101-.Lfunc_begin0
	.quad	.Ltmp107-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	17                      # 17
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp107-.Lfunc_begin0
	.quad	.Ltmp113-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	18                      # 18
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp113-.Lfunc_begin0
	.quad	.Ltmp119-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	19                      # 19
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp119-.Lfunc_begin0
	.quad	.Ltmp125-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	20                      # 20
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp125-.Lfunc_begin0
	.quad	.Ltmp131-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	21                      # 21
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp131-.Lfunc_begin0
	.quad	.Ltmp137-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	22                      # 22
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp137-.Lfunc_begin0
	.quad	.Ltmp143-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp143-.Lfunc_begin0
	.quad	.Ltmp149-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	24                      # 24
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp149-.Lfunc_begin0
	.quad	.Ltmp155-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	25                      # 25
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp155-.Lfunc_begin0
	.quad	.Ltmp161-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	26                      # 26
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp161-.Lfunc_begin0
	.quad	.Ltmp167-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	27                      # 27
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp167-.Lfunc_begin0
	.quad	.Ltmp173-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	28                      # 28
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp173-.Lfunc_begin0
	.quad	.Ltmp179-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	29                      # 29
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp179-.Lfunc_begin0
	.quad	.Ltmp185-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	30                      # 30
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp185-.Lfunc_begin0
	.quad	.Ltmp191-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	31                      # 31
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp191-.Lfunc_begin0
	.quad	.Lfunc_end0-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	32                      # 32
	.byte	159                     # DW_OP_stack_value
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
	.byte	8                       # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
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
	.byte	12                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
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
	.byte	1                       # Abbrev [1] 0xb:0xcb DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x42 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x3f:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	196                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x4e:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	155                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x5c:0xf DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	148                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x6c:0x28 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string4          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	24                      # DW_AT_decl_line
	.long	148                     # DW_AT_type
                                        # DW_AT_external
	.byte	4                       # Abbrev [4] 0x85:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	25                      # DW_AT_decl_line
	.long	201                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x94:0x7 DW_TAG_base_type
	.long	.Linfo_string5          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	8                       # Abbrev [8] 0x9b:0xc DW_TAG_array_type
	.long	167                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0xa0:0x6 DW_TAG_subrange_type
	.long	189                     # DW_AT_type
	.byte	3                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0xa7:0xb DW_TAG_typedef
	.long	178                     # DW_AT_type
	.long	.Linfo_string8          # DW_AT_name
	.byte	3                       # DW_AT_decl_file
	.byte	26                      # DW_AT_decl_line
	.byte	10                      # Abbrev [10] 0xb2:0xb DW_TAG_typedef
	.long	148                     # DW_AT_type
	.long	.Linfo_string7          # DW_AT_name
	.byte	2                       # DW_AT_decl_file
	.byte	41                      # DW_AT_decl_line
	.byte	11                      # Abbrev [11] 0xbd:0x7 DW_TAG_base_type
	.long	.Linfo_string9          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	12                      # Abbrev [12] 0xc4:0x5 DW_TAG_pointer_type
	.long	167                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xc9:0xc DW_TAG_array_type
	.long	148                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0xce:0x6 DW_TAG_subrange_type
	.long	189                     # DW_AT_type
	.byte	3                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
.Ldebug_info_end0:
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:

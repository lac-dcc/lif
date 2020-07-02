	.text
	.file	"mu1.c"
	.globl	mu                      # -- Begin function mu
	.p2align	4, 0x90
	.type	mu,@function
mu:                                     # @mu
.Lfunc_begin0:
	.file	1 "/home/luigi/dev/ufmg/static-analysis/side-channel/lif/llvm/bench/mu/sources/mu1.c"
	.loc	1 4 0                   # mu/sources/mu1.c:4:0
	.cfi_startproc
# %bb.0:
	#DEBUG_VALUE: mu:a <- $rdi
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$224, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	#DEBUG_VALUE: mu:a <- $rdi
.Ltmp0:
	.loc	1 7 24 prologue_end     # mu/sources/mu1.c:7:24
	movl	$0, -12(%rbp)
.Ltmp1:
	#DEBUG_VALUE: mu:i <- 0
	.loc	1 0 24 is_stmt 0        # mu/sources/mu1.c:0:24
	movb	$1, -214(%rbp)
.Ltmp2:
	.loc	1 9 14 is_stmt 1        # mu/sources/mu1.c:9:14
	movq	$0, -20(%rbp)
.Ltmp3:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movl	(%rdi), %eax
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andl	$1, %eax
	movb	$1, -213(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	movl	%eax, -12(%rbp)
	movb	%al, -212(%rbp)
.Ltmp4:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movl	4(%rdi), %eax
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andl	$1, %eax
	movb	$1, -211(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	movl	%eax, -16(%rbp)
	movb	%al, -210(%rbp)
.Ltmp5:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movl	8(%rdi), %eax
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andl	$1, %eax
	movb	$1, -209(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	movl	%eax, -20(%rbp)
	movb	%al, -208(%rbp)
.Ltmp6:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp7:
	#DEBUG_VALUE: mu:i <- 1
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp8:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp9:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -207(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -206(%rbp)
.Ltmp10:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -205(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -204(%rbp)
.Ltmp11:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -203(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -202(%rbp)
.Ltmp12:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp13:
	#DEBUG_VALUE: mu:i <- 2
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp14:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp15:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -201(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -200(%rbp)
.Ltmp16:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -199(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -198(%rbp)
.Ltmp17:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -197(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -196(%rbp)
.Ltmp18:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp19:
	#DEBUG_VALUE: mu:i <- 3
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp20:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp21:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -195(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -194(%rbp)
.Ltmp22:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -193(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -192(%rbp)
.Ltmp23:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -191(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -190(%rbp)
.Ltmp24:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp25:
	#DEBUG_VALUE: mu:i <- 4
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp26:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp27:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -189(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -188(%rbp)
.Ltmp28:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -187(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -186(%rbp)
.Ltmp29:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -185(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -184(%rbp)
.Ltmp30:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp31:
	#DEBUG_VALUE: mu:i <- 5
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp32:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp33:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -183(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -182(%rbp)
.Ltmp34:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -181(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -180(%rbp)
.Ltmp35:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -179(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -178(%rbp)
.Ltmp36:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp37:
	#DEBUG_VALUE: mu:i <- 6
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp38:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp39:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -177(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -176(%rbp)
.Ltmp40:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -175(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -174(%rbp)
.Ltmp41:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -173(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -172(%rbp)
.Ltmp42:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp43:
	#DEBUG_VALUE: mu:i <- 7
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp44:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp45:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -171(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -170(%rbp)
.Ltmp46:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -169(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -168(%rbp)
.Ltmp47:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -167(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -166(%rbp)
.Ltmp48:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp49:
	#DEBUG_VALUE: mu:i <- 8
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp50:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp51:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -165(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -164(%rbp)
.Ltmp52:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -163(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -162(%rbp)
.Ltmp53:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -161(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -160(%rbp)
.Ltmp54:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp55:
	#DEBUG_VALUE: mu:i <- 9
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp56:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp57:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -159(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -158(%rbp)
.Ltmp58:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -157(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -156(%rbp)
.Ltmp59:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -155(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -154(%rbp)
.Ltmp60:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp61:
	#DEBUG_VALUE: mu:i <- 10
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp62:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp63:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -153(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -152(%rbp)
.Ltmp64:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -151(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -150(%rbp)
.Ltmp65:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -149(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -148(%rbp)
.Ltmp66:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp67:
	#DEBUG_VALUE: mu:i <- 11
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp68:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp69:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -147(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -146(%rbp)
.Ltmp70:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -145(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -144(%rbp)
.Ltmp71:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -143(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -142(%rbp)
.Ltmp72:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp73:
	#DEBUG_VALUE: mu:i <- 12
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp74:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp75:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -141(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -140(%rbp)
.Ltmp76:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -139(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -138(%rbp)
.Ltmp77:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -137(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -136(%rbp)
.Ltmp78:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp79:
	#DEBUG_VALUE: mu:i <- 13
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp80:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp81:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -135(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -134(%rbp)
.Ltmp82:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -133(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -132(%rbp)
.Ltmp83:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -131(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -130(%rbp)
.Ltmp84:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp85:
	#DEBUG_VALUE: mu:i <- 14
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp86:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp87:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -129(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -128(%rbp)
.Ltmp88:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -127(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -126(%rbp)
.Ltmp89:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -125(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -124(%rbp)
.Ltmp90:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp91:
	#DEBUG_VALUE: mu:i <- 15
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp92:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp93:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -123(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -122(%rbp)
.Ltmp94:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -121(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -120(%rbp)
.Ltmp95:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -119(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -118(%rbp)
.Ltmp96:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp97:
	#DEBUG_VALUE: mu:i <- 16
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp98:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp99:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -117(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -116(%rbp)
.Ltmp100:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -115(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -114(%rbp)
.Ltmp101:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -113(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -112(%rbp)
.Ltmp102:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp103:
	#DEBUG_VALUE: mu:i <- 17
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp104:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp105:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -111(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -110(%rbp)
.Ltmp106:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -109(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -108(%rbp)
.Ltmp107:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -107(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -106(%rbp)
.Ltmp108:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp109:
	#DEBUG_VALUE: mu:i <- 18
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp110:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp111:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -105(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -104(%rbp)
.Ltmp112:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -103(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -102(%rbp)
.Ltmp113:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -101(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -100(%rbp)
.Ltmp114:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp115:
	#DEBUG_VALUE: mu:i <- 19
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp116:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp117:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -99(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -98(%rbp)
.Ltmp118:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -97(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -96(%rbp)
.Ltmp119:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -95(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -94(%rbp)
.Ltmp120:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp121:
	#DEBUG_VALUE: mu:i <- 20
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp122:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp123:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -93(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -92(%rbp)
.Ltmp124:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -91(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -90(%rbp)
.Ltmp125:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -89(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -88(%rbp)
.Ltmp126:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp127:
	#DEBUG_VALUE: mu:i <- 21
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp128:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp129:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -87(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -86(%rbp)
.Ltmp130:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -85(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -84(%rbp)
.Ltmp131:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -83(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -82(%rbp)
.Ltmp132:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp133:
	#DEBUG_VALUE: mu:i <- 22
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp134:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp135:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -81(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -80(%rbp)
.Ltmp136:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -79(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -78(%rbp)
.Ltmp137:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -77(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -76(%rbp)
.Ltmp138:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp139:
	#DEBUG_VALUE: mu:i <- 23
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp140:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp141:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -75(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -74(%rbp)
.Ltmp142:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -73(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -72(%rbp)
.Ltmp143:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -71(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -70(%rbp)
.Ltmp144:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp145:
	#DEBUG_VALUE: mu:i <- 24
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp146:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp147:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -69(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -68(%rbp)
.Ltmp148:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -67(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -66(%rbp)
.Ltmp149:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -65(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -64(%rbp)
.Ltmp150:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp151:
	#DEBUG_VALUE: mu:i <- 25
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp152:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp153:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -63(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -62(%rbp)
.Ltmp154:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -61(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -60(%rbp)
.Ltmp155:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -59(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -58(%rbp)
.Ltmp156:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp157:
	#DEBUG_VALUE: mu:i <- 26
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp158:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp159:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -57(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -56(%rbp)
.Ltmp160:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -55(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -54(%rbp)
.Ltmp161:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -53(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -52(%rbp)
.Ltmp162:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp163:
	#DEBUG_VALUE: mu:i <- 27
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp164:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp165:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -51(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -50(%rbp)
.Ltmp166:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -49(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -48(%rbp)
.Ltmp167:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -47(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -46(%rbp)
.Ltmp168:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp169:
	#DEBUG_VALUE: mu:i <- 28
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp170:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp171:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -45(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -44(%rbp)
.Ltmp172:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -43(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -42(%rbp)
.Ltmp173:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -41(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -40(%rbp)
.Ltmp174:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp175:
	#DEBUG_VALUE: mu:i <- 29
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp176:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp177:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -39(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -38(%rbp)
.Ltmp178:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -37(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -36(%rbp)
.Ltmp179:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -35(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -34(%rbp)
.Ltmp180:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp181:
	#DEBUG_VALUE: mu:i <- 30
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp182:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp183:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -33(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -32(%rbp)
.Ltmp184:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -31(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -30(%rbp)
.Ltmp185:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -29(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -28(%rbp)
.Ltmp186:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp187:
	#DEBUG_VALUE: mu:i <- 31
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %r8d
.Ltmp188:
	.loc	1 10 14 is_stmt 1       # mu/sources/mu1.c:10:14
	movl	-16(%rbp), %r10d
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	leal	(%r8,%r8), %r9d
	movl	%r9d, -20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	leal	(%r10,%r10), %esi
	movl	%esi, -16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	movl	-12(%rbp), %eax
	leal	(%rax,%rax), %ecx
	movl	%ecx, -12(%rbp)
.Ltmp189:
	.loc	1 12 13                 # mu/sources/mu1.c:12:13
	movb	(%rdi), %dl
	.loc	1 12 18 is_stmt 0       # mu/sources/mu1.c:12:18
	andb	$1, %dl
	movb	$1, -27(%rbp)
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	leal	1(%rax,%rax), %eax
	cmovel	%ecx, %eax
	movl	%eax, -12(%rbp)
	movb	%dl, -26(%rbp)
.Ltmp190:
	.loc	1 13 13 is_stmt 1       # mu/sources/mu1.c:13:13
	movb	4(%rdi), %al
	.loc	1 13 18 is_stmt 0       # mu/sources/mu1.c:13:18
	andb	$1, %al
	movb	$1, -25(%rbp)
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	leal	1(%r10,%r10), %ecx
	cmovel	%esi, %ecx
	movl	%ecx, -16(%rbp)
	movb	%al, -24(%rbp)
.Ltmp191:
	.loc	1 14 13 is_stmt 1       # mu/sources/mu1.c:14:13
	movb	8(%rdi), %al
	.loc	1 14 18 is_stmt 0       # mu/sources/mu1.c:14:18
	andb	$1, %al
	movb	$1, -23(%rbp)
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	leal	1(%r8,%r8), %ecx
	cmovel	%r9d, %ecx
	movl	%ecx, -20(%rbp)
	movb	%al, -22(%rbp)
.Ltmp192:
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp193:
	#DEBUG_VALUE: mu:i <- 32
	.loc	1 0 14 is_stmt 0        # mu/sources/mu1.c:0:14
	movl	-20(%rbp), %eax
.Ltmp194:
	.loc	1 19 10 is_stmt 1       # mu/sources/mu1.c:19:10
	movl	%eax, (%rdi)
	movl	-16(%rbp), %eax
	.loc	1 20 10                 # mu/sources/mu1.c:20:10
	movl	%eax, 4(%rdi)
	movl	-12(%rbp), %eax
	.loc	1 21 10                 # mu/sources/mu1.c:21:10
	movl	%eax, 8(%rdi)
	movb	$1, -21(%rbp)
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB0_2
.Ltmp195:
# %bb.1:                                # %SP_return
	#DEBUG_VALUE: mu:i <- 32
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 22 1                  # mu/sources/mu1.c:22:1
	addq	$224, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp196:
.LBB0_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	#DEBUG_VALUE: mu:i <- 32
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	callq	__stack_chk_fail
.Ltmp197:
.Lfunc_end0:
	.size	mu, .Lfunc_end0-mu
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin1:
	.loc	1 24 0 is_stmt 1        # mu/sources/mu1.c:24:0
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
.Ltmp198:
	.loc	1 25 9 prologue_end     # mu/sources/mu1.c:25:9
	movq	$0, -24(%rbp)
	movl	$0, -16(%rbp)
	leaq	-24(%rbp), %rdi
	.loc	1 26 5                  # mu/sources/mu1.c:26:5
	movl	$3, %esi
	callq	mu
	.loc	1 27 28                 # mu/sources/mu1.c:27:28
	movl	-24(%rbp), %esi
	.loc	1 27 34 is_stmt 0       # mu/sources/mu1.c:27:34
	movl	-20(%rbp), %edx
	.loc	1 27 40                 # mu/sources/mu1.c:27:40
	movl	-16(%rbp), %ecx
	.loc	1 27 5                  # mu/sources/mu1.c:27:5
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB1_2
# %bb.1:                                # %SP_return
	.loc	1 28 1 is_stmt 1        # mu/sources/mu1.c:28:1
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB1_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	callq	__stack_chk_fail
.Ltmp199:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
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
	.asciz	"mu/sources/mu1.c"      # string offset=22
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
	.quad	.Ltmp197-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp1-.Lfunc_begin0
	.quad	.Ltmp7-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp7-.Lfunc_begin0
	.quad	.Ltmp13-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	3                       # 3
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	6                       # 6
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	7                       # 7
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	8                       # 8
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	9                       # 9
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp67-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	11                      # 11
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	12                      # 12
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	13                      # 13
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp97-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	15                      # 15
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp97-.Lfunc_begin0
	.quad	.Ltmp103-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	16                      # 16
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp103-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	17                      # 17
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp115-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	18                      # 18
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp115-.Lfunc_begin0
	.quad	.Ltmp121-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	19                      # 19
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp121-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	20                      # 20
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp133-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	21                      # 21
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp133-.Lfunc_begin0
	.quad	.Ltmp139-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	22                      # 22
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp139-.Lfunc_begin0
	.quad	.Ltmp145-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	.Ltmp151-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	24                      # 24
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp151-.Lfunc_begin0
	.quad	.Ltmp157-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	25                      # 25
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp157-.Lfunc_begin0
	.quad	.Ltmp163-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	26                      # 26
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp163-.Lfunc_begin0
	.quad	.Ltmp169-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	27                      # 27
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp169-.Lfunc_begin0
	.quad	.Ltmp175-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	28                      # 28
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp175-.Lfunc_begin0
	.quad	.Ltmp181-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	29                      # 29
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp181-.Lfunc_begin0
	.quad	.Ltmp187-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	30                      # 30
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp187-.Lfunc_begin0
	.quad	.Ltmp193-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	31                      # 31
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp193-.Lfunc_begin0
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

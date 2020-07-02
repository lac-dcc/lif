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
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	#DEBUG_VALUE: mu:a <- $rdi
.Ltmp0:
	.loc	1 7 24 prologue_end     # mu/sources/mu1.c:7:24
	movl	$0, -12(%rbp)
.Ltmp1:
	#DEBUG_VALUE: mu:i <- 0
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	movq	$0, -20(%rbp)
.Ltmp2:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp3:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_1
.Ltmp4:
# %bb.2:
	#DEBUG_VALUE: mu:i <- 0
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp5:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_3
.Ltmp6:
.LBB0_4:
	#DEBUG_VALUE: mu:i <- 0
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp7:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_6
.Ltmp8:
.LBB0_5:
	#DEBUG_VALUE: mu:i <- 0
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp9:
.LBB0_6:
	#DEBUG_VALUE: mu:i <- 0
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp10:
	#DEBUG_VALUE: mu:i <- 1
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp11:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp12:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_7
.Ltmp13:
# %bb.8:
	#DEBUG_VALUE: mu:i <- 1
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp14:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_9
.Ltmp15:
.LBB0_10:
	#DEBUG_VALUE: mu:i <- 1
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp16:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_12
.Ltmp17:
.LBB0_11:
	#DEBUG_VALUE: mu:i <- 1
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp18:
.LBB0_12:
	#DEBUG_VALUE: mu:i <- 1
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp19:
	#DEBUG_VALUE: mu:i <- 2
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp20:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp21:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_13
.Ltmp22:
# %bb.14:
	#DEBUG_VALUE: mu:i <- 2
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp23:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_15
.Ltmp24:
.LBB0_16:
	#DEBUG_VALUE: mu:i <- 2
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp25:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_18
.Ltmp26:
.LBB0_17:
	#DEBUG_VALUE: mu:i <- 2
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp27:
.LBB0_18:
	#DEBUG_VALUE: mu:i <- 2
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp28:
	#DEBUG_VALUE: mu:i <- 3
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp29:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp30:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_19
.Ltmp31:
# %bb.20:
	#DEBUG_VALUE: mu:i <- 3
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp32:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_21
.Ltmp33:
.LBB0_22:
	#DEBUG_VALUE: mu:i <- 3
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp34:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_24
.Ltmp35:
.LBB0_23:
	#DEBUG_VALUE: mu:i <- 3
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp36:
.LBB0_24:
	#DEBUG_VALUE: mu:i <- 3
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp37:
	#DEBUG_VALUE: mu:i <- 4
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp38:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp39:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_25
.Ltmp40:
# %bb.26:
	#DEBUG_VALUE: mu:i <- 4
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp41:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_27
.Ltmp42:
.LBB0_28:
	#DEBUG_VALUE: mu:i <- 4
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp43:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_30
.Ltmp44:
.LBB0_29:
	#DEBUG_VALUE: mu:i <- 4
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp45:
.LBB0_30:
	#DEBUG_VALUE: mu:i <- 4
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp46:
	#DEBUG_VALUE: mu:i <- 5
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp47:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp48:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_31
.Ltmp49:
# %bb.32:
	#DEBUG_VALUE: mu:i <- 5
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp50:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_33
.Ltmp51:
.LBB0_34:
	#DEBUG_VALUE: mu:i <- 5
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp52:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_36
.Ltmp53:
.LBB0_35:
	#DEBUG_VALUE: mu:i <- 5
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp54:
.LBB0_36:
	#DEBUG_VALUE: mu:i <- 5
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp55:
	#DEBUG_VALUE: mu:i <- 6
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp56:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp57:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_37
.Ltmp58:
# %bb.38:
	#DEBUG_VALUE: mu:i <- 6
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp59:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_39
.Ltmp60:
.LBB0_40:
	#DEBUG_VALUE: mu:i <- 6
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp61:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_42
.Ltmp62:
.LBB0_41:
	#DEBUG_VALUE: mu:i <- 6
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp63:
.LBB0_42:
	#DEBUG_VALUE: mu:i <- 6
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp64:
	#DEBUG_VALUE: mu:i <- 7
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp65:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp66:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_43
.Ltmp67:
# %bb.44:
	#DEBUG_VALUE: mu:i <- 7
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp68:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_45
.Ltmp69:
.LBB0_46:
	#DEBUG_VALUE: mu:i <- 7
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp70:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_48
.Ltmp71:
.LBB0_47:
	#DEBUG_VALUE: mu:i <- 7
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp72:
.LBB0_48:
	#DEBUG_VALUE: mu:i <- 7
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp73:
	#DEBUG_VALUE: mu:i <- 8
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp74:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp75:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_49
.Ltmp76:
# %bb.50:
	#DEBUG_VALUE: mu:i <- 8
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp77:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_51
.Ltmp78:
.LBB0_52:
	#DEBUG_VALUE: mu:i <- 8
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp79:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_54
.Ltmp80:
.LBB0_53:
	#DEBUG_VALUE: mu:i <- 8
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp81:
.LBB0_54:
	#DEBUG_VALUE: mu:i <- 8
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp82:
	#DEBUG_VALUE: mu:i <- 9
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp83:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp84:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_55
.Ltmp85:
# %bb.56:
	#DEBUG_VALUE: mu:i <- 9
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp86:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_57
.Ltmp87:
.LBB0_58:
	#DEBUG_VALUE: mu:i <- 9
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp88:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_60
.Ltmp89:
.LBB0_59:
	#DEBUG_VALUE: mu:i <- 9
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp90:
.LBB0_60:
	#DEBUG_VALUE: mu:i <- 9
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp91:
	#DEBUG_VALUE: mu:i <- 10
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp92:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp93:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_61
.Ltmp94:
# %bb.62:
	#DEBUG_VALUE: mu:i <- 10
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp95:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_63
.Ltmp96:
.LBB0_64:
	#DEBUG_VALUE: mu:i <- 10
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp97:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_66
.Ltmp98:
.LBB0_65:
	#DEBUG_VALUE: mu:i <- 10
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp99:
.LBB0_66:
	#DEBUG_VALUE: mu:i <- 10
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp100:
	#DEBUG_VALUE: mu:i <- 11
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp101:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp102:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_67
.Ltmp103:
# %bb.68:
	#DEBUG_VALUE: mu:i <- 11
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp104:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_69
.Ltmp105:
.LBB0_70:
	#DEBUG_VALUE: mu:i <- 11
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp106:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_72
.Ltmp107:
.LBB0_71:
	#DEBUG_VALUE: mu:i <- 11
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp108:
.LBB0_72:
	#DEBUG_VALUE: mu:i <- 11
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp109:
	#DEBUG_VALUE: mu:i <- 12
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp110:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp111:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_73
.Ltmp112:
# %bb.74:
	#DEBUG_VALUE: mu:i <- 12
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp113:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_75
.Ltmp114:
.LBB0_76:
	#DEBUG_VALUE: mu:i <- 12
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp115:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_78
.Ltmp116:
.LBB0_77:
	#DEBUG_VALUE: mu:i <- 12
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp117:
.LBB0_78:
	#DEBUG_VALUE: mu:i <- 12
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp118:
	#DEBUG_VALUE: mu:i <- 13
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp119:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp120:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_79
.Ltmp121:
# %bb.80:
	#DEBUG_VALUE: mu:i <- 13
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp122:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_81
.Ltmp123:
.LBB0_82:
	#DEBUG_VALUE: mu:i <- 13
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp124:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_84
.Ltmp125:
.LBB0_83:
	#DEBUG_VALUE: mu:i <- 13
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp126:
.LBB0_84:
	#DEBUG_VALUE: mu:i <- 13
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp127:
	#DEBUG_VALUE: mu:i <- 14
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp128:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp129:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_85
.Ltmp130:
# %bb.86:
	#DEBUG_VALUE: mu:i <- 14
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp131:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_87
.Ltmp132:
.LBB0_88:
	#DEBUG_VALUE: mu:i <- 14
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp133:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_90
.Ltmp134:
.LBB0_89:
	#DEBUG_VALUE: mu:i <- 14
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp135:
.LBB0_90:
	#DEBUG_VALUE: mu:i <- 14
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp136:
	#DEBUG_VALUE: mu:i <- 15
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp137:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp138:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_91
.Ltmp139:
# %bb.92:
	#DEBUG_VALUE: mu:i <- 15
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp140:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_93
.Ltmp141:
.LBB0_94:
	#DEBUG_VALUE: mu:i <- 15
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp142:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_96
.Ltmp143:
.LBB0_95:
	#DEBUG_VALUE: mu:i <- 15
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp144:
.LBB0_96:
	#DEBUG_VALUE: mu:i <- 15
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp145:
	#DEBUG_VALUE: mu:i <- 16
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp146:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp147:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_97
.Ltmp148:
# %bb.98:
	#DEBUG_VALUE: mu:i <- 16
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp149:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_99
.Ltmp150:
.LBB0_100:
	#DEBUG_VALUE: mu:i <- 16
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp151:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_102
.Ltmp152:
.LBB0_101:
	#DEBUG_VALUE: mu:i <- 16
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp153:
.LBB0_102:
	#DEBUG_VALUE: mu:i <- 16
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp154:
	#DEBUG_VALUE: mu:i <- 17
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp155:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp156:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_103
.Ltmp157:
# %bb.104:
	#DEBUG_VALUE: mu:i <- 17
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp158:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_105
.Ltmp159:
.LBB0_106:
	#DEBUG_VALUE: mu:i <- 17
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp160:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_108
.Ltmp161:
.LBB0_107:
	#DEBUG_VALUE: mu:i <- 17
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp162:
.LBB0_108:
	#DEBUG_VALUE: mu:i <- 17
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp163:
	#DEBUG_VALUE: mu:i <- 18
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp164:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp165:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_109
.Ltmp166:
# %bb.110:
	#DEBUG_VALUE: mu:i <- 18
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp167:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_111
.Ltmp168:
.LBB0_112:
	#DEBUG_VALUE: mu:i <- 18
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp169:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_114
.Ltmp170:
.LBB0_113:
	#DEBUG_VALUE: mu:i <- 18
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp171:
.LBB0_114:
	#DEBUG_VALUE: mu:i <- 18
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp172:
	#DEBUG_VALUE: mu:i <- 19
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp173:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp174:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_115
.Ltmp175:
# %bb.116:
	#DEBUG_VALUE: mu:i <- 19
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp176:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_117
.Ltmp177:
.LBB0_118:
	#DEBUG_VALUE: mu:i <- 19
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp178:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_120
.Ltmp179:
.LBB0_119:
	#DEBUG_VALUE: mu:i <- 19
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp180:
.LBB0_120:
	#DEBUG_VALUE: mu:i <- 19
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp181:
	#DEBUG_VALUE: mu:i <- 20
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp182:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp183:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_121
.Ltmp184:
# %bb.122:
	#DEBUG_VALUE: mu:i <- 20
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp185:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_123
.Ltmp186:
.LBB0_124:
	#DEBUG_VALUE: mu:i <- 20
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp187:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_126
.Ltmp188:
.LBB0_125:
	#DEBUG_VALUE: mu:i <- 20
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp189:
.LBB0_126:
	#DEBUG_VALUE: mu:i <- 20
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp190:
	#DEBUG_VALUE: mu:i <- 21
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp191:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp192:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_127
.Ltmp193:
# %bb.128:
	#DEBUG_VALUE: mu:i <- 21
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp194:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_129
.Ltmp195:
.LBB0_130:
	#DEBUG_VALUE: mu:i <- 21
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp196:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_132
.Ltmp197:
.LBB0_131:
	#DEBUG_VALUE: mu:i <- 21
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp198:
.LBB0_132:
	#DEBUG_VALUE: mu:i <- 21
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp199:
	#DEBUG_VALUE: mu:i <- 22
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp200:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp201:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_133
.Ltmp202:
# %bb.134:
	#DEBUG_VALUE: mu:i <- 22
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp203:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_135
.Ltmp204:
.LBB0_136:
	#DEBUG_VALUE: mu:i <- 22
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp205:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_138
.Ltmp206:
.LBB0_137:
	#DEBUG_VALUE: mu:i <- 22
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp207:
.LBB0_138:
	#DEBUG_VALUE: mu:i <- 22
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp208:
	#DEBUG_VALUE: mu:i <- 23
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp209:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp210:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_139
.Ltmp211:
# %bb.140:
	#DEBUG_VALUE: mu:i <- 23
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp212:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_141
.Ltmp213:
.LBB0_142:
	#DEBUG_VALUE: mu:i <- 23
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp214:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_144
.Ltmp215:
.LBB0_143:
	#DEBUG_VALUE: mu:i <- 23
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp216:
.LBB0_144:
	#DEBUG_VALUE: mu:i <- 23
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp217:
	#DEBUG_VALUE: mu:i <- 24
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp218:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp219:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_145
.Ltmp220:
# %bb.146:
	#DEBUG_VALUE: mu:i <- 24
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp221:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_147
.Ltmp222:
.LBB0_148:
	#DEBUG_VALUE: mu:i <- 24
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp223:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_150
.Ltmp224:
.LBB0_149:
	#DEBUG_VALUE: mu:i <- 24
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp225:
.LBB0_150:
	#DEBUG_VALUE: mu:i <- 24
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp226:
	#DEBUG_VALUE: mu:i <- 25
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp227:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp228:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_151
.Ltmp229:
# %bb.152:
	#DEBUG_VALUE: mu:i <- 25
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp230:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_153
.Ltmp231:
.LBB0_154:
	#DEBUG_VALUE: mu:i <- 25
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp232:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_156
.Ltmp233:
.LBB0_155:
	#DEBUG_VALUE: mu:i <- 25
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp234:
.LBB0_156:
	#DEBUG_VALUE: mu:i <- 25
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp235:
	#DEBUG_VALUE: mu:i <- 26
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp236:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp237:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_157
.Ltmp238:
# %bb.158:
	#DEBUG_VALUE: mu:i <- 26
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp239:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_159
.Ltmp240:
.LBB0_160:
	#DEBUG_VALUE: mu:i <- 26
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp241:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_162
.Ltmp242:
.LBB0_161:
	#DEBUG_VALUE: mu:i <- 26
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp243:
.LBB0_162:
	#DEBUG_VALUE: mu:i <- 26
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp244:
	#DEBUG_VALUE: mu:i <- 27
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp245:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp246:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_163
.Ltmp247:
# %bb.164:
	#DEBUG_VALUE: mu:i <- 27
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp248:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_165
.Ltmp249:
.LBB0_166:
	#DEBUG_VALUE: mu:i <- 27
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp250:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_168
.Ltmp251:
.LBB0_167:
	#DEBUG_VALUE: mu:i <- 27
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp252:
.LBB0_168:
	#DEBUG_VALUE: mu:i <- 27
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp253:
	#DEBUG_VALUE: mu:i <- 28
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp254:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp255:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_169
.Ltmp256:
# %bb.170:
	#DEBUG_VALUE: mu:i <- 28
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp257:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_171
.Ltmp258:
.LBB0_172:
	#DEBUG_VALUE: mu:i <- 28
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp259:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_174
.Ltmp260:
.LBB0_173:
	#DEBUG_VALUE: mu:i <- 28
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp261:
.LBB0_174:
	#DEBUG_VALUE: mu:i <- 28
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp262:
	#DEBUG_VALUE: mu:i <- 29
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp263:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp264:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_175
.Ltmp265:
# %bb.176:
	#DEBUG_VALUE: mu:i <- 29
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp266:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_177
.Ltmp267:
.LBB0_178:
	#DEBUG_VALUE: mu:i <- 29
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp268:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_180
.Ltmp269:
.LBB0_179:
	#DEBUG_VALUE: mu:i <- 29
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp270:
.LBB0_180:
	#DEBUG_VALUE: mu:i <- 29
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp271:
	#DEBUG_VALUE: mu:i <- 30
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp272:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp273:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_181
.Ltmp274:
# %bb.182:
	#DEBUG_VALUE: mu:i <- 30
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp275:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_183
.Ltmp276:
.LBB0_184:
	#DEBUG_VALUE: mu:i <- 30
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp277:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_186
.Ltmp278:
.LBB0_185:
	#DEBUG_VALUE: mu:i <- 30
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp279:
.LBB0_186:
	#DEBUG_VALUE: mu:i <- 30
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp280:
	#DEBUG_VALUE: mu:i <- 31
	.loc	1 9 14                  # mu/sources/mu1.c:9:14
	shll	-20(%rbp)
	.loc	1 10 14                 # mu/sources/mu1.c:10:14
	shll	-16(%rbp)
	.loc	1 11 14                 # mu/sources/mu1.c:11:14
	shll	-12(%rbp)
.Ltmp281:
	.loc	1 12 18                 # mu/sources/mu1.c:12:18
	testb	$1, (%rdi)
.Ltmp282:
	.loc	1 12 13 is_stmt 0       # mu/sources/mu1.c:12:13
	jne	.LBB0_187
.Ltmp283:
# %bb.188:
	#DEBUG_VALUE: mu:i <- 31
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 18 is_stmt 1       # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp284:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	jne	.LBB0_189
.Ltmp285:
.LBB0_190:
	#DEBUG_VALUE: mu:i <- 31
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp286:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	je	.LBB0_192
.Ltmp287:
.LBB0_191:
	#DEBUG_VALUE: mu:i <- 31
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 14 28                 # mu/sources/mu1.c:14:28
	orb	$1, -20(%rbp)
.Ltmp288:
.LBB0_192:
	#DEBUG_VALUE: mu:i <- 31
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 15 14 is_stmt 1       # mu/sources/mu1.c:15:14
	sarl	(%rdi)
	.loc	1 16 14                 # mu/sources/mu1.c:16:14
	sarl	4(%rdi)
	.loc	1 17 14                 # mu/sources/mu1.c:17:14
	sarl	8(%rdi)
.Ltmp289:
	#DEBUG_VALUE: mu:i <- 32
	.loc	1 0 0 is_stmt 0         # mu/sources/mu1.c:0:0
	movl	-20(%rbp), %eax
	.loc	1 19 10 is_stmt 1       # mu/sources/mu1.c:19:10
	movl	%eax, (%rdi)
	.loc	1 20 12                 # mu/sources/mu1.c:20:12
	movl	-16(%rbp), %eax
	.loc	1 20 10 is_stmt 0       # mu/sources/mu1.c:20:10
	movl	%eax, 4(%rdi)
	.loc	1 21 12 is_stmt 1       # mu/sources/mu1.c:21:12
	movl	-12(%rbp), %eax
	.loc	1 21 10 is_stmt 0       # mu/sources/mu1.c:21:10
	movl	%eax, 8(%rdi)
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB0_194
.Ltmp290:
# %bb.193:                              # %SP_return
	#DEBUG_VALUE: mu:i <- 32
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 22 1 is_stmt 1        # mu/sources/mu1.c:22:1
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp291:
.LBB0_1:
	.cfi_def_cfa %rbp, 16
	#DEBUG_VALUE: mu:i <- 0
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28                 # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp292:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp293:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_4
.Ltmp294:
.LBB0_3:
	#DEBUG_VALUE: mu:i <- 0
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp295:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp296:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_5
	jmp	.LBB0_6
.Ltmp297:
.LBB0_7:
	#DEBUG_VALUE: mu:i <- 1
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp298:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp299:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_10
.Ltmp300:
.LBB0_9:
	#DEBUG_VALUE: mu:i <- 1
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp301:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp302:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_11
	jmp	.LBB0_12
.Ltmp303:
.LBB0_13:
	#DEBUG_VALUE: mu:i <- 2
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp304:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp305:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_16
.Ltmp306:
.LBB0_15:
	#DEBUG_VALUE: mu:i <- 2
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp307:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp308:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_17
	jmp	.LBB0_18
.Ltmp309:
.LBB0_19:
	#DEBUG_VALUE: mu:i <- 3
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp310:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp311:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_22
.Ltmp312:
.LBB0_21:
	#DEBUG_VALUE: mu:i <- 3
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp313:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp314:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_23
	jmp	.LBB0_24
.Ltmp315:
.LBB0_25:
	#DEBUG_VALUE: mu:i <- 4
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp316:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp317:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_28
.Ltmp318:
.LBB0_27:
	#DEBUG_VALUE: mu:i <- 4
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp319:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp320:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_29
	jmp	.LBB0_30
.Ltmp321:
.LBB0_31:
	#DEBUG_VALUE: mu:i <- 5
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp322:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp323:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_34
.Ltmp324:
.LBB0_33:
	#DEBUG_VALUE: mu:i <- 5
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp325:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp326:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_35
	jmp	.LBB0_36
.Ltmp327:
.LBB0_37:
	#DEBUG_VALUE: mu:i <- 6
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp328:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp329:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_40
.Ltmp330:
.LBB0_39:
	#DEBUG_VALUE: mu:i <- 6
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp331:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp332:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_41
	jmp	.LBB0_42
.Ltmp333:
.LBB0_43:
	#DEBUG_VALUE: mu:i <- 7
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp334:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp335:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_46
.Ltmp336:
.LBB0_45:
	#DEBUG_VALUE: mu:i <- 7
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp337:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp338:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_47
	jmp	.LBB0_48
.Ltmp339:
.LBB0_49:
	#DEBUG_VALUE: mu:i <- 8
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp340:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp341:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_52
.Ltmp342:
.LBB0_51:
	#DEBUG_VALUE: mu:i <- 8
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp343:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp344:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_53
	jmp	.LBB0_54
.Ltmp345:
.LBB0_55:
	#DEBUG_VALUE: mu:i <- 9
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp346:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp347:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_58
.Ltmp348:
.LBB0_57:
	#DEBUG_VALUE: mu:i <- 9
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp349:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp350:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_59
	jmp	.LBB0_60
.Ltmp351:
.LBB0_61:
	#DEBUG_VALUE: mu:i <- 10
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp352:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp353:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_64
.Ltmp354:
.LBB0_63:
	#DEBUG_VALUE: mu:i <- 10
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp355:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp356:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_65
	jmp	.LBB0_66
.Ltmp357:
.LBB0_67:
	#DEBUG_VALUE: mu:i <- 11
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp358:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp359:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_70
.Ltmp360:
.LBB0_69:
	#DEBUG_VALUE: mu:i <- 11
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp361:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp362:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_71
	jmp	.LBB0_72
.Ltmp363:
.LBB0_73:
	#DEBUG_VALUE: mu:i <- 12
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp364:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp365:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_76
.Ltmp366:
.LBB0_75:
	#DEBUG_VALUE: mu:i <- 12
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp367:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp368:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_77
	jmp	.LBB0_78
.Ltmp369:
.LBB0_79:
	#DEBUG_VALUE: mu:i <- 13
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp370:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp371:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_82
.Ltmp372:
.LBB0_81:
	#DEBUG_VALUE: mu:i <- 13
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp373:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp374:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_83
	jmp	.LBB0_84
.Ltmp375:
.LBB0_85:
	#DEBUG_VALUE: mu:i <- 14
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp376:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp377:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_88
.Ltmp378:
.LBB0_87:
	#DEBUG_VALUE: mu:i <- 14
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp379:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp380:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_89
	jmp	.LBB0_90
.Ltmp381:
.LBB0_91:
	#DEBUG_VALUE: mu:i <- 15
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp382:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp383:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_94
.Ltmp384:
.LBB0_93:
	#DEBUG_VALUE: mu:i <- 15
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp385:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp386:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_95
	jmp	.LBB0_96
.Ltmp387:
.LBB0_97:
	#DEBUG_VALUE: mu:i <- 16
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp388:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp389:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_100
.Ltmp390:
.LBB0_99:
	#DEBUG_VALUE: mu:i <- 16
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp391:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp392:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_101
	jmp	.LBB0_102
.Ltmp393:
.LBB0_103:
	#DEBUG_VALUE: mu:i <- 17
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp394:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp395:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_106
.Ltmp396:
.LBB0_105:
	#DEBUG_VALUE: mu:i <- 17
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp397:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp398:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_107
	jmp	.LBB0_108
.Ltmp399:
.LBB0_109:
	#DEBUG_VALUE: mu:i <- 18
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp400:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp401:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_112
.Ltmp402:
.LBB0_111:
	#DEBUG_VALUE: mu:i <- 18
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp403:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp404:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_113
	jmp	.LBB0_114
.Ltmp405:
.LBB0_115:
	#DEBUG_VALUE: mu:i <- 19
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp406:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp407:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_118
.Ltmp408:
.LBB0_117:
	#DEBUG_VALUE: mu:i <- 19
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp409:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp410:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_119
	jmp	.LBB0_120
.Ltmp411:
.LBB0_121:
	#DEBUG_VALUE: mu:i <- 20
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp412:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp413:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_124
.Ltmp414:
.LBB0_123:
	#DEBUG_VALUE: mu:i <- 20
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp415:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp416:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_125
	jmp	.LBB0_126
.Ltmp417:
.LBB0_127:
	#DEBUG_VALUE: mu:i <- 21
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp418:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp419:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_130
.Ltmp420:
.LBB0_129:
	#DEBUG_VALUE: mu:i <- 21
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp421:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp422:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_131
	jmp	.LBB0_132
.Ltmp423:
.LBB0_133:
	#DEBUG_VALUE: mu:i <- 22
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp424:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp425:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_136
.Ltmp426:
.LBB0_135:
	#DEBUG_VALUE: mu:i <- 22
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp427:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp428:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_137
	jmp	.LBB0_138
.Ltmp429:
.LBB0_139:
	#DEBUG_VALUE: mu:i <- 23
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp430:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp431:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_142
.Ltmp432:
.LBB0_141:
	#DEBUG_VALUE: mu:i <- 23
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp433:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp434:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_143
	jmp	.LBB0_144
.Ltmp435:
.LBB0_145:
	#DEBUG_VALUE: mu:i <- 24
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp436:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp437:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_148
.Ltmp438:
.LBB0_147:
	#DEBUG_VALUE: mu:i <- 24
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp439:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp440:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_149
	jmp	.LBB0_150
.Ltmp441:
.LBB0_151:
	#DEBUG_VALUE: mu:i <- 25
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp442:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp443:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_154
.Ltmp444:
.LBB0_153:
	#DEBUG_VALUE: mu:i <- 25
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp445:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp446:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_155
	jmp	.LBB0_156
.Ltmp447:
.LBB0_157:
	#DEBUG_VALUE: mu:i <- 26
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp448:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp449:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_160
.Ltmp450:
.LBB0_159:
	#DEBUG_VALUE: mu:i <- 26
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp451:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp452:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_161
	jmp	.LBB0_162
.Ltmp453:
.LBB0_163:
	#DEBUG_VALUE: mu:i <- 27
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp454:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp455:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_166
.Ltmp456:
.LBB0_165:
	#DEBUG_VALUE: mu:i <- 27
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp457:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp458:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_167
	jmp	.LBB0_168
.Ltmp459:
.LBB0_169:
	#DEBUG_VALUE: mu:i <- 28
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp460:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp461:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_172
.Ltmp462:
.LBB0_171:
	#DEBUG_VALUE: mu:i <- 28
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp463:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp464:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_173
	jmp	.LBB0_174
.Ltmp465:
.LBB0_175:
	#DEBUG_VALUE: mu:i <- 29
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp466:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp467:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_178
.Ltmp468:
.LBB0_177:
	#DEBUG_VALUE: mu:i <- 29
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp469:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp470:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_179
	jmp	.LBB0_180
.Ltmp471:
.LBB0_181:
	#DEBUG_VALUE: mu:i <- 30
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp472:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp473:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_184
.Ltmp474:
.LBB0_183:
	#DEBUG_VALUE: mu:i <- 30
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp475:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp476:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_185
	jmp	.LBB0_186
.Ltmp477:
.LBB0_187:
	#DEBUG_VALUE: mu:i <- 31
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 12 28 is_stmt 1       # mu/sources/mu1.c:12:28
	orb	$1, -12(%rbp)
.Ltmp478:
	.loc	1 13 18                 # mu/sources/mu1.c:13:18
	testb	$1, 4(%rdi)
.Ltmp479:
	.loc	1 13 13 is_stmt 0       # mu/sources/mu1.c:13:13
	je	.LBB0_190
.Ltmp480:
.LBB0_189:
	#DEBUG_VALUE: mu:i <- 31
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 13 28                 # mu/sources/mu1.c:13:28
	orb	$1, -16(%rbp)
.Ltmp481:
	.loc	1 14 18 is_stmt 1       # mu/sources/mu1.c:14:18
	testb	$1, 8(%rdi)
.Ltmp482:
	.loc	1 14 13 is_stmt 0       # mu/sources/mu1.c:14:13
	jne	.LBB0_191
	jmp	.LBB0_192
.Ltmp483:
.LBB0_194:                              # %CallStackCheckFailBlk
	#DEBUG_VALUE: mu:i <- 32
	#DEBUG_VALUE: mu:a <- $rdi
	.loc	1 0 0                   # mu/sources/mu1.c:0:0
	callq	__stack_chk_fail
.Ltmp484:
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
.Ltmp485:
	.loc	1 25 9 prologue_end     # mu/sources/mu1.c:25:9
	movq	$0, -24(%rbp)
	movl	$0, -16(%rbp)
	leaq	-24(%rbp), %rdi
	.loc	1 26 5                  # mu/sources/mu1.c:26:5
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
.Ltmp486:
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
	.quad	.Ltmp484-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	85                      # DW_OP_reg5
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp1-.Lfunc_begin0
	.quad	.Ltmp10-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp10-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp28-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp28-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	3                       # 3
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp46-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp46-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp64-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	6                       # 6
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp64-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	7                       # 7
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	8                       # 8
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	9                       # 9
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp100-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp100-.Lfunc_begin0
	.quad	.Ltmp109-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	11                      # 11
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp109-.Lfunc_begin0
	.quad	.Ltmp118-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	12                      # 12
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp118-.Lfunc_begin0
	.quad	.Ltmp127-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	13                      # 13
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp127-.Lfunc_begin0
	.quad	.Ltmp136-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp136-.Lfunc_begin0
	.quad	.Ltmp145-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	15                      # 15
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp145-.Lfunc_begin0
	.quad	.Ltmp154-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	16                      # 16
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp154-.Lfunc_begin0
	.quad	.Ltmp163-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	17                      # 17
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp163-.Lfunc_begin0
	.quad	.Ltmp172-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	18                      # 18
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp172-.Lfunc_begin0
	.quad	.Ltmp181-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	19                      # 19
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp181-.Lfunc_begin0
	.quad	.Ltmp190-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	20                      # 20
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp190-.Lfunc_begin0
	.quad	.Ltmp199-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	21                      # 21
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp199-.Lfunc_begin0
	.quad	.Ltmp208-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	22                      # 22
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp208-.Lfunc_begin0
	.quad	.Ltmp217-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp217-.Lfunc_begin0
	.quad	.Ltmp226-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	24                      # 24
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp226-.Lfunc_begin0
	.quad	.Ltmp235-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	25                      # 25
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp235-.Lfunc_begin0
	.quad	.Ltmp244-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	26                      # 26
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp244-.Lfunc_begin0
	.quad	.Ltmp253-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	27                      # 27
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp253-.Lfunc_begin0
	.quad	.Ltmp262-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	28                      # 28
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp262-.Lfunc_begin0
	.quad	.Ltmp271-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	29                      # 29
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp271-.Lfunc_begin0
	.quad	.Ltmp280-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	30                      # 30
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp280-.Lfunc_begin0
	.quad	.Ltmp289-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	31                      # 31
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp289-.Lfunc_begin0
	.quad	.Ltmp291-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	32                      # 32
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp291-.Lfunc_begin0
	.quad	.Ltmp297-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp297-.Lfunc_begin0
	.quad	.Ltmp303-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp303-.Lfunc_begin0
	.quad	.Ltmp309-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp309-.Lfunc_begin0
	.quad	.Ltmp315-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	3                       # 3
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp315-.Lfunc_begin0
	.quad	.Ltmp321-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp321-.Lfunc_begin0
	.quad	.Ltmp327-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp327-.Lfunc_begin0
	.quad	.Ltmp333-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	6                       # 6
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp333-.Lfunc_begin0
	.quad	.Ltmp339-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	7                       # 7
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp339-.Lfunc_begin0
	.quad	.Ltmp345-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	8                       # 8
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp345-.Lfunc_begin0
	.quad	.Ltmp351-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	9                       # 9
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp351-.Lfunc_begin0
	.quad	.Ltmp357-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp357-.Lfunc_begin0
	.quad	.Ltmp363-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	11                      # 11
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp363-.Lfunc_begin0
	.quad	.Ltmp369-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	12                      # 12
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp369-.Lfunc_begin0
	.quad	.Ltmp375-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	13                      # 13
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp375-.Lfunc_begin0
	.quad	.Ltmp381-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp381-.Lfunc_begin0
	.quad	.Ltmp387-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	15                      # 15
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp387-.Lfunc_begin0
	.quad	.Ltmp393-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	16                      # 16
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp393-.Lfunc_begin0
	.quad	.Ltmp399-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	17                      # 17
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp399-.Lfunc_begin0
	.quad	.Ltmp405-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	18                      # 18
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp405-.Lfunc_begin0
	.quad	.Ltmp411-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	19                      # 19
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp411-.Lfunc_begin0
	.quad	.Ltmp417-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	20                      # 20
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp417-.Lfunc_begin0
	.quad	.Ltmp423-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	21                      # 21
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp423-.Lfunc_begin0
	.quad	.Ltmp429-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	22                      # 22
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp429-.Lfunc_begin0
	.quad	.Ltmp435-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp435-.Lfunc_begin0
	.quad	.Ltmp441-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	24                      # 24
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp441-.Lfunc_begin0
	.quad	.Ltmp447-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	25                      # 25
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp447-.Lfunc_begin0
	.quad	.Ltmp453-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	26                      # 26
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp453-.Lfunc_begin0
	.quad	.Ltmp459-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	27                      # 27
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp459-.Lfunc_begin0
	.quad	.Ltmp465-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	28                      # 28
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp465-.Lfunc_begin0
	.quad	.Ltmp471-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	29                      # 29
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp471-.Lfunc_begin0
	.quad	.Ltmp477-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	30                      # 30
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp477-.Lfunc_begin0
	.quad	.Ltmp483-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	31                      # 31
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp483-.Lfunc_begin0
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

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
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: i <- 0
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	#DEBUG_VALUE: i <- 0
.Ltmp0:
	.loc	1 7 13 prologue_end     # comp/sources/comp2.c:7:13
	movl	(%rdi), %ecx
	xorl	%eax, %eax
	.loc	1 7 18 is_stmt 0        # comp/sources/comp2.c:7:18
	cmpl	(%rsi), %ecx
.Ltmp1:
	#DEBUG_VALUE: i <- 1
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp2:
# %bb.1:
	#DEBUG_VALUE: i <- 1
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 1
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	4(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	4(%rsi), %ecx
.Ltmp3:
	#DEBUG_VALUE: i <- 2
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp4:
# %bb.2:
	#DEBUG_VALUE: i <- 2
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 2
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	8(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	8(%rsi), %ecx
.Ltmp5:
	#DEBUG_VALUE: i <- 3
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp6:
# %bb.3:
	#DEBUG_VALUE: i <- 3
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 3
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	12(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	12(%rsi), %ecx
.Ltmp7:
	#DEBUG_VALUE: i <- 4
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp8:
# %bb.4:
	#DEBUG_VALUE: i <- 4
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 4
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	16(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	16(%rsi), %ecx
.Ltmp9:
	#DEBUG_VALUE: i <- 5
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp10:
# %bb.5:
	#DEBUG_VALUE: i <- 5
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 5
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	20(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	20(%rsi), %ecx
.Ltmp11:
	#DEBUG_VALUE: i <- 6
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp12:
# %bb.6:
	#DEBUG_VALUE: i <- 6
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 6
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	24(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	24(%rsi), %ecx
.Ltmp13:
	#DEBUG_VALUE: i <- 7
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp14:
# %bb.7:
	#DEBUG_VALUE: i <- 7
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 7
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	28(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	28(%rsi), %ecx
.Ltmp15:
	#DEBUG_VALUE: i <- 8
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp16:
# %bb.8:
	#DEBUG_VALUE: i <- 8
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 8
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	32(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	32(%rsi), %ecx
.Ltmp17:
	#DEBUG_VALUE: i <- 9
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp18:
# %bb.9:
	#DEBUG_VALUE: i <- 9
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 9
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	36(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	36(%rsi), %ecx
.Ltmp19:
	#DEBUG_VALUE: i <- 10
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp20:
# %bb.10:
	#DEBUG_VALUE: i <- 10
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 10
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	40(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	40(%rsi), %ecx
.Ltmp21:
	#DEBUG_VALUE: i <- 11
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp22:
# %bb.11:
	#DEBUG_VALUE: i <- 11
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 11
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	44(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	44(%rsi), %ecx
.Ltmp23:
	#DEBUG_VALUE: i <- 12
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp24:
# %bb.12:
	#DEBUG_VALUE: i <- 12
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 12
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	48(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	48(%rsi), %ecx
.Ltmp25:
	#DEBUG_VALUE: i <- 13
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp26:
# %bb.13:
	#DEBUG_VALUE: i <- 13
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 13
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	52(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	52(%rsi), %ecx
.Ltmp27:
	#DEBUG_VALUE: i <- 14
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp28:
# %bb.14:
	#DEBUG_VALUE: i <- 14
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 14
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	56(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	56(%rsi), %ecx
.Ltmp29:
	#DEBUG_VALUE: i <- 15
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp30:
# %bb.15:
	#DEBUG_VALUE: i <- 15
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 15
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	60(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	60(%rsi), %ecx
.Ltmp31:
	#DEBUG_VALUE: i <- 16
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp32:
# %bb.16:
	#DEBUG_VALUE: i <- 16
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 16
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	64(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	64(%rsi), %ecx
.Ltmp33:
	#DEBUG_VALUE: i <- 17
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp34:
# %bb.17:
	#DEBUG_VALUE: i <- 17
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 17
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	68(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	68(%rsi), %ecx
.Ltmp35:
	#DEBUG_VALUE: i <- 18
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp36:
# %bb.18:
	#DEBUG_VALUE: i <- 18
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 18
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	72(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	72(%rsi), %ecx
.Ltmp37:
	#DEBUG_VALUE: i <- 19
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp38:
# %bb.19:
	#DEBUG_VALUE: i <- 19
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 19
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	76(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	76(%rsi), %ecx
.Ltmp39:
	#DEBUG_VALUE: i <- 20
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp40:
# %bb.20:
	#DEBUG_VALUE: i <- 20
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 20
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	80(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	80(%rsi), %ecx
.Ltmp41:
	#DEBUG_VALUE: i <- 21
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp42:
# %bb.21:
	#DEBUG_VALUE: i <- 21
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 21
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	84(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	84(%rsi), %ecx
.Ltmp43:
	#DEBUG_VALUE: i <- 22
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp44:
# %bb.22:
	#DEBUG_VALUE: i <- 22
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 22
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	88(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	88(%rsi), %ecx
.Ltmp45:
	#DEBUG_VALUE: i <- 23
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp46:
# %bb.23:
	#DEBUG_VALUE: i <- 23
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 23
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	92(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	92(%rsi), %ecx
.Ltmp47:
	#DEBUG_VALUE: i <- 24
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp48:
# %bb.24:
	#DEBUG_VALUE: i <- 24
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 24
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	96(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	96(%rsi), %ecx
.Ltmp49:
	#DEBUG_VALUE: i <- 25
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp50:
# %bb.25:
	#DEBUG_VALUE: i <- 25
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 25
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	100(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	100(%rsi), %ecx
.Ltmp51:
	#DEBUG_VALUE: i <- 26
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp52:
# %bb.26:
	#DEBUG_VALUE: i <- 26
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 26
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	104(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	104(%rsi), %ecx
.Ltmp53:
	#DEBUG_VALUE: i <- 27
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp54:
# %bb.27:
	#DEBUG_VALUE: i <- 27
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 27
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	108(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	108(%rsi), %ecx
.Ltmp55:
	#DEBUG_VALUE: i <- 28
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp56:
# %bb.28:
	#DEBUG_VALUE: i <- 28
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 28
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	112(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	112(%rsi), %ecx
.Ltmp57:
	#DEBUG_VALUE: i <- 29
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp58:
# %bb.29:
	#DEBUG_VALUE: i <- 29
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 29
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	116(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	116(%rsi), %ecx
.Ltmp59:
	#DEBUG_VALUE: i <- 30
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp60:
# %bb.30:
	#DEBUG_VALUE: i <- 30
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 30
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	120(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	120(%rsi), %ecx
.Ltmp61:
	#DEBUG_VALUE: i <- 31
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp62:
# %bb.31:
	#DEBUG_VALUE: i <- 31
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	#DEBUG_VALUE: i <- 31
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	movl	124(%rdi), %ecx
	.loc	1 7 18                  # comp/sources/comp2.c:7:18
	cmpl	124(%rsi), %ecx
.Ltmp63:
	#DEBUG_VALUE: i <- 32
	.loc	1 7 13                  # comp/sources/comp2.c:7:13
	jne	.LBB0_33
.Ltmp64:
# %bb.32:
	#DEBUG_VALUE: i <- 32
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	.loc	1 0 13                  # comp/sources/comp2.c:0:13
	movl	$1, %eax
.Ltmp65:
.LBB0_33:
	#DEBUG_VALUE: comp:b <- $rsi
	#DEBUG_VALUE: comp:a <- $rdi
	.loc	1 9 1 is_stmt 1         # comp/sources/comp2.c:9:1
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp66:
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
.Ltmp67:
	#DEBUG_VALUE: i <- 0
	.loc	1 13 45 prologue_end    # comp/sources/comp2.c:13:45
	movq	%rax, -272(%rbp)
	.loc	1 13 38 is_stmt 0       # comp/sources/comp2.c:13:38
	movl	$0, -144(%rbp)
	movabsq	$8589934593, %rax       # imm = 0x200000001
.Ltmp68:
	#DEBUG_VALUE: i <- 1
	movq	%rax, -140(%rbp)
	movabsq	$12884901890, %rax      # imm = 0x300000002
.Ltmp69:
	#DEBUG_VALUE: i <- 2
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -264(%rbp)
	movabsq	$17179869187, %rax      # imm = 0x400000003
.Ltmp70:
	#DEBUG_VALUE: i <- 3
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -132(%rbp)
	movabsq	$21474836484, %rax      # imm = 0x500000004
.Ltmp71:
	#DEBUG_VALUE: i <- 4
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -256(%rbp)
	movabsq	$25769803781, %rax      # imm = 0x600000005
.Ltmp72:
	#DEBUG_VALUE: i <- 5
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -124(%rbp)
	movabsq	$30064771078, %rax      # imm = 0x700000006
.Ltmp73:
	#DEBUG_VALUE: i <- 6
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -248(%rbp)
	movabsq	$34359738375, %rax      # imm = 0x800000007
.Ltmp74:
	#DEBUG_VALUE: i <- 7
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -116(%rbp)
	movabsq	$38654705672, %rax      # imm = 0x900000008
.Ltmp75:
	#DEBUG_VALUE: i <- 8
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -240(%rbp)
	movabsq	$42949672969, %rax      # imm = 0xA00000009
.Ltmp76:
	#DEBUG_VALUE: i <- 9
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -108(%rbp)
	movabsq	$47244640266, %rax      # imm = 0xB0000000A
.Ltmp77:
	#DEBUG_VALUE: i <- 10
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -232(%rbp)
	movabsq	$51539607563, %rax      # imm = 0xC0000000B
.Ltmp78:
	#DEBUG_VALUE: i <- 11
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -100(%rbp)
	movabsq	$55834574860, %rax      # imm = 0xD0000000C
.Ltmp79:
	#DEBUG_VALUE: i <- 12
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -224(%rbp)
	movabsq	$60129542157, %rax      # imm = 0xE0000000D
.Ltmp80:
	#DEBUG_VALUE: i <- 13
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -92(%rbp)
	movabsq	$64424509454, %rax      # imm = 0xF0000000E
.Ltmp81:
	#DEBUG_VALUE: i <- 14
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -216(%rbp)
.Ltmp82:
	#DEBUG_VALUE: i <- 15
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movl	$15, -84(%rbp)
	movabsq	$73014444048, %rax      # imm = 0x1100000010
.Ltmp83:
	#DEBUG_VALUE: i <- 16
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -208(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -80(%rbp)
	movabsq	$81604378642, %rax      # imm = 0x1300000012
.Ltmp84:
	#DEBUG_VALUE: i <- 18
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -200(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -72(%rbp)
	movabsq	$90194313236, %rax      # imm = 0x1500000014
.Ltmp85:
	#DEBUG_VALUE: i <- 20
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -192(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -64(%rbp)
	movabsq	$98784247830, %rax      # imm = 0x1700000016
.Ltmp86:
	#DEBUG_VALUE: i <- 22
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -184(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -56(%rbp)
	movabsq	$107374182424, %rax     # imm = 0x1900000018
.Ltmp87:
	#DEBUG_VALUE: i <- 24
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -176(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -48(%rbp)
	movabsq	$115964117018, %rax     # imm = 0x1B0000001A
.Ltmp88:
	#DEBUG_VALUE: i <- 26
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -168(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -40(%rbp)
	movabsq	$124554051612, %rax     # imm = 0x1D0000001C
.Ltmp89:
	#DEBUG_VALUE: i <- 28
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -160(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -32(%rbp)
	movabsq	$133143986206, %rax     # imm = 0x1F0000001E
.Ltmp90:
	#DEBUG_VALUE: i <- 30
	.loc	1 13 45                 # comp/sources/comp2.c:13:45
	movq	%rax, -152(%rbp)
	.loc	1 13 38                 # comp/sources/comp2.c:13:38
	movq	%rax, -24(%rbp)
.Ltmp91:
	#DEBUG_VALUE: i <- 32
	.loc	1 14 10 is_stmt 1       # comp/sources/comp2.c:14:10
	movl	$-1, -272(%rbp)
	leaq	-144(%rbp), %rdi
	leaq	-272(%rbp), %rsi
	.loc	1 15 13                 # comp/sources/comp2.c:15:13
	callq	comp
.Ltmp92:
	#DEBUG_VALUE: main:r <- $eax
	.loc	1 16 5                  # comp/sources/comp2.c:16:5
	movl	$.L.str, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
.Ltmp93:
	callq	printf
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB1_2
.Ltmp94:
# %bb.1:                                # %SP_return
	.loc	1 17 5                  # comp/sources/comp2.c:17:5
	xorl	%eax, %eax
	addq	$272, %rsp              # imm = 0x110
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB1_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
.Ltmp95:
	#DEBUG_VALUE: i <- 32
	.loc	1 0 0 is_stmt 0         # comp/sources/comp2.c:0:0
	callq	__stack_chk_fail
.Ltmp96:
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
	.quad	.Ltmp1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp1-.Lfunc_begin0
	.quad	.Ltmp3-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp3-.Lfunc_begin0
	.quad	.Ltmp5-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp5-.Lfunc_begin0
	.quad	.Ltmp7-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	3                       # 3
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp7-.Lfunc_begin0
	.quad	.Ltmp9-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp9-.Lfunc_begin0
	.quad	.Ltmp11-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp11-.Lfunc_begin0
	.quad	.Ltmp13-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	6                       # 6
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp13-.Lfunc_begin0
	.quad	.Ltmp15-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	7                       # 7
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp15-.Lfunc_begin0
	.quad	.Ltmp17-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	8                       # 8
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp17-.Lfunc_begin0
	.quad	.Ltmp19-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	9                       # 9
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp19-.Lfunc_begin0
	.quad	.Ltmp21-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp21-.Lfunc_begin0
	.quad	.Ltmp23-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	11                      # 11
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp23-.Lfunc_begin0
	.quad	.Ltmp25-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	12                      # 12
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp25-.Lfunc_begin0
	.quad	.Ltmp27-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	13                      # 13
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp27-.Lfunc_begin0
	.quad	.Ltmp29-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp29-.Lfunc_begin0
	.quad	.Ltmp31-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	15                      # 15
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp31-.Lfunc_begin0
	.quad	.Ltmp33-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	16                      # 16
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp33-.Lfunc_begin0
	.quad	.Ltmp35-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	17                      # 17
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp35-.Lfunc_begin0
	.quad	.Ltmp37-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	18                      # 18
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp37-.Lfunc_begin0
	.quad	.Ltmp39-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	19                      # 19
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp39-.Lfunc_begin0
	.quad	.Ltmp41-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	20                      # 20
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp41-.Lfunc_begin0
	.quad	.Ltmp43-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	21                      # 21
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp43-.Lfunc_begin0
	.quad	.Ltmp45-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	22                      # 22
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp45-.Lfunc_begin0
	.quad	.Ltmp47-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	23                      # 23
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp47-.Lfunc_begin0
	.quad	.Ltmp49-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	24                      # 24
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp49-.Lfunc_begin0
	.quad	.Ltmp51-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	25                      # 25
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp51-.Lfunc_begin0
	.quad	.Ltmp53-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	26                      # 26
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp53-.Lfunc_begin0
	.quad	.Ltmp55-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	27                      # 27
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp55-.Lfunc_begin0
	.quad	.Ltmp57-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	28                      # 28
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp57-.Lfunc_begin0
	.quad	.Ltmp59-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	29                      # 29
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp59-.Lfunc_begin0
	.quad	.Ltmp61-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	30                      # 30
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp61-.Lfunc_begin0
	.quad	.Ltmp63-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	31                      # 31
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp63-.Lfunc_begin0
	.quad	.Ltmp65-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	32                      # 32
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc1:
	.quad	.Ltmp67-.Lfunc_begin0
	.quad	.Ltmp68-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	0                       # 0
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp68-.Lfunc_begin0
	.quad	.Ltmp69-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	1                       # 1
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp69-.Lfunc_begin0
	.quad	.Ltmp70-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	2                       # 2
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp70-.Lfunc_begin0
	.quad	.Ltmp71-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	3                       # 3
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp71-.Lfunc_begin0
	.quad	.Ltmp72-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	4                       # 4
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp72-.Lfunc_begin0
	.quad	.Ltmp73-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	5                       # 5
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp73-.Lfunc_begin0
	.quad	.Ltmp74-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	6                       # 6
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp74-.Lfunc_begin0
	.quad	.Ltmp75-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	7                       # 7
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp75-.Lfunc_begin0
	.quad	.Ltmp76-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	8                       # 8
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp76-.Lfunc_begin0
	.quad	.Ltmp77-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	9                       # 9
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp77-.Lfunc_begin0
	.quad	.Ltmp78-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	10                      # 10
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp78-.Lfunc_begin0
	.quad	.Ltmp79-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	11                      # 11
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp79-.Lfunc_begin0
	.quad	.Ltmp80-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	12                      # 12
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp80-.Lfunc_begin0
	.quad	.Ltmp81-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	13                      # 13
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp81-.Lfunc_begin0
	.quad	.Ltmp82-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	14                      # 14
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp82-.Lfunc_begin0
	.quad	.Ltmp83-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	15                      # 15
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp83-.Lfunc_begin0
	.quad	.Ltmp84-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	16                      # 16
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp84-.Lfunc_begin0
	.quad	.Ltmp85-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	18                      # 18
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp85-.Lfunc_begin0
	.quad	.Ltmp86-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	20                      # 20
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp86-.Lfunc_begin0
	.quad	.Ltmp87-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	22                      # 22
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp87-.Lfunc_begin0
	.quad	.Ltmp88-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	24                      # 24
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp88-.Lfunc_begin0
	.quad	.Ltmp89-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	26                      # 26
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp89-.Lfunc_begin0
	.quad	.Ltmp90-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	28                      # 28
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp90-.Lfunc_begin0
	.quad	.Ltmp91-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	30                      # 30
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp91-.Lfunc_begin0
	.quad	.Ltmp94-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	32                      # 32
	.byte	159                     # DW_OP_stack_value
	.quad	.Ltmp95-.Lfunc_begin0
	.quad	.Lfunc_end1-.Lfunc_begin0
	.short	3                       # Loc expr size
	.byte	17                      # DW_OP_consts
	.byte	32                      # 32
	.byte	159                     # DW_OP_stack_value
	.quad	0
	.quad	0
.Ldebug_loc2:
	.quad	.Ltmp92-.Lfunc_begin0
	.quad	.Ltmp93-.Lfunc_begin0
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
	.byte	1                       # Abbrev [1] 0xb:0xf4 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x51 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	223                     # DW_AT_type
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x43:0xd DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	230                     # DW_AT_type
	.byte	3                       # Abbrev [3] 0x50:0xd DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	84
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	230                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x5d:0x1d DW_TAG_lexical_block
	.quad	.Ltmp0                  # DW_AT_low_pc
	.long	.Ltmp64-.Ltmp0          # DW_AT_high_pc
	.byte	5                       # Abbrev [5] 0x6a:0xf DW_TAG_variable
	.long	.Ldebug_loc0            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.long	223                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x7b:0x64 DW_TAG_subprogram
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	223                     # DW_AT_type
                                        # DW_AT_external
	.byte	7                       # Abbrev [7] 0x94:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\360~"
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	235                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0xa3:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\360}"
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.long	235                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0xb2:0xf DW_TAG_variable
	.long	.Ldebug_loc2            # DW_AT_location
	.long	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	15                      # DW_AT_decl_line
	.long	223                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0xc1:0x1d DW_TAG_lexical_block
	.quad	.Ltmp67                 # DW_AT_low_pc
	.long	.Ltmp91-.Ltmp67         # DW_AT_high_pc
	.byte	5                       # Abbrev [5] 0xce:0xf DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	13                      # DW_AT_decl_line
	.long	223                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0xdf:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0xe6:0x5 DW_TAG_pointer_type
	.long	223                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0xeb:0xc DW_TAG_array_type
	.long	223                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0xf0:0x6 DW_TAG_subrange_type
	.long	247                     # DW_AT_type
	.byte	32                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	12                      # Abbrev [12] 0xf7:0x7 DW_TAG_base_type
	.long	.Linfo_string9          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	0                       # End Of Children Mark
.Ldebug_info_end0:
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:

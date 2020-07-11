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
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	movl	$0, -52(%rbp)
	callq	init_dut
	movaps	.L__const.main.input_data+16(%rip), %xmm0
	movaps	%xmm0, -32(%rbp)
	movaps	.L__const.main.input_data(%rip), %xmm0
	movaps	%xmm0, -48(%rbp)
	leaq	-48(%rbp), %rdi
	xorl	%esi, %esi
	callq	do_one_computation
	movzbl	%al, %esi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB0_2
# %bb.1:                                # %SP_return
	xorl	%eax, %eax
	addq	$64, %rsp
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
	.globl	do_one_computation      # -- Begin function do_one_computation
	.p2align	4, 0x90
	.type	do_one_computation,@function
do_one_computation:                     # @do_one_computation
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %rbx
	movq	%fs:40, %rax
	movq	%rax, -32(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	.L__const.do_one_computation.secret(%rip), %xmm0
	movaps	%xmm0, -96(%rbp)
	movaps	.L__const.do_one_computation.secret+16(%rip), %xmm0
	movaps	%xmm0, -80(%rbp)
	movaps	.L__const.do_one_computation.basepoint(%rip), %xmm0
	movaps	%xmm0, -128(%rbp)
	movaps	.L__const.do_one_computation.basepoint+16(%rip), %xmm0
	movaps	%xmm0, -112(%rbp)
	leaq	-64(%rbp), %r15
	leaq	-128(%rbp), %r14
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	curve25519_donna
	movaps	-64(%rbp), %xmm0
	movaps	-48(%rbp), %xmm1
	movups	%xmm0, (%rbx)
	movups	%xmm1, 16(%rbx)
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	curve25519_donna
	movaps	-64(%rbp), %xmm0
	movaps	-48(%rbp), %xmm1
	movups	%xmm0, (%rbx)
	movups	%xmm1, 16(%rbx)
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	curve25519_donna
	movaps	-64(%rbp), %xmm0
	movaps	-48(%rbp), %xmm1
	movups	%xmm0, (%rbx)
	movups	%xmm1, 16(%rbx)
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	curve25519_donna
	movaps	-64(%rbp), %xmm0
	movaps	-48(%rbp), %xmm1
	movups	%xmm0, (%rbx)
	movups	%xmm1, 16(%rbx)
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	curve25519_donna
	movaps	-64(%rbp), %xmm0
	movaps	-48(%rbp), %xmm1
	movups	%xmm0, (%rbx)
	movups	%xmm1, 16(%rbx)
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	curve25519_donna
	movaps	-64(%rbp), %xmm0
	movaps	-48(%rbp), %xmm1
	movups	%xmm0, (%rbx)
	movups	%xmm1, 16(%rbx)
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	curve25519_donna
	movaps	-64(%rbp), %xmm0
	movaps	-48(%rbp), %xmm1
	movups	%xmm0, (%rbx)
	movups	%xmm1, 16(%rbx)
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	curve25519_donna
	movaps	-64(%rbp), %xmm0
	movaps	-48(%rbp), %xmm1
	movups	%xmm0, (%rbx)
	movups	%xmm1, 16(%rbx)
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	curve25519_donna
	movaps	-64(%rbp), %xmm0
	movaps	-48(%rbp), %xmm1
	movups	%xmm0, (%rbx)
	movups	%xmm1, 16(%rbx)
	movb	-64(%rbp), %al
	movq	%fs:40, %rcx
	cmpq	-32(%rbp), %rcx
	jne	.LBB1_2
# %bb.1:                                # %SP_return
	addq	$104, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB1_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end1:
	.size	do_one_computation, .Lfunc_end1-do_one_computation
	.cfi_endproc
                                        # -- End function
	.globl	init_dut                # -- Begin function init_dut
	.p2align	4, 0x90
	.type	init_dut,@function
init_dut:                               # @init_dut
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	init_dut, .Lfunc_end2-init_dut
	.cfi_endproc
                                        # -- End function
	.globl	prepare_inputs          # -- Begin function prepare_inputs
	.p2align	4, 0x90
	.type	prepare_inputs,@function
prepare_inputs:                         # @prepare_inputs
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movl	$32, %esi
	callq	randombytes
	callq	randombit
	movb	%al, (%r14)
	testb	%al, %al
	jne	.LBB3_2
# %bb.1:
	xorps	%xmm0, %xmm0
	movups	%xmm0, 16(%rbx)
	movups	%xmm0, (%rbx)
.LBB3_2:
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	prepare_inputs, .Lfunc_end3-prepare_inputs
	.cfi_endproc
                                        # -- End function
	.globl	curve25519_donna        # -- Begin function curve25519_donna
	.p2align	4, 0x90
	.type	curve25519_donna,@function
curve25519_donna:                       # @curve25519_donna
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$384, %rsp              # imm = 0x180
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	movb	(%rsi), %al
	movb	%al, -416(%rbp)
	movb	1(%rsi), %al
	movb	%al, -415(%rbp)
	movb	2(%rsi), %al
	movb	%al, -414(%rbp)
	movb	3(%rsi), %al
	movb	%al, -413(%rbp)
	movb	4(%rsi), %al
	movb	%al, -412(%rbp)
	movb	5(%rsi), %al
	movb	%al, -411(%rbp)
	movb	6(%rsi), %al
	movb	%al, -410(%rbp)
	movb	7(%rsi), %al
	movb	%al, -409(%rbp)
	movb	8(%rsi), %al
	movb	%al, -408(%rbp)
	movb	9(%rsi), %al
	movb	%al, -407(%rbp)
	movb	10(%rsi), %al
	movb	%al, -406(%rbp)
	movb	11(%rsi), %al
	movb	%al, -405(%rbp)
	movb	12(%rsi), %al
	movb	%al, -404(%rbp)
	movb	13(%rsi), %al
	movb	%al, -403(%rbp)
	movb	14(%rsi), %al
	movb	%al, -402(%rbp)
	movb	15(%rsi), %al
	movb	%al, -401(%rbp)
	movb	16(%rsi), %al
	movb	%al, -400(%rbp)
	movb	17(%rsi), %al
	movb	%al, -399(%rbp)
	movb	18(%rsi), %al
	movb	%al, -398(%rbp)
	movb	19(%rsi), %al
	movb	%al, -397(%rbp)
	movb	20(%rsi), %al
	movb	%al, -396(%rbp)
	movb	21(%rsi), %al
	movb	%al, -395(%rbp)
	movb	22(%rsi), %al
	movb	%al, -394(%rbp)
	movb	23(%rsi), %al
	movb	%al, -393(%rbp)
	movb	24(%rsi), %al
	movb	%al, -392(%rbp)
	movb	25(%rsi), %al
	movb	%al, -391(%rbp)
	movb	26(%rsi), %al
	movb	%al, -390(%rbp)
	movb	27(%rsi), %al
	movb	%al, -389(%rbp)
	movb	28(%rsi), %al
	movb	%al, -388(%rbp)
	movb	29(%rsi), %al
	movb	%al, -387(%rbp)
	movb	30(%rsi), %al
	movb	%al, -386(%rbp)
	movb	31(%rsi), %al
	movb	%al, -385(%rbp)
	andb	$-8, -416(%rbp)
	movq	%rdi, %r14
	andb	$63, %al
	orb	$64, %al
	movb	%al, -385(%rbp)
	leaq	-128(%rbp), %r12
	movq	%r12, %rdi
	movq	%rdx, %rsi
	callq	fexpand
	leaq	-208(%rbp), %r15
	leaq	-304(%rbp), %rbx
	leaq	-416(%rbp), %rdx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rcx
	callq	cmult
	leaq	-384(%rbp), %r12
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	crecip
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	callq	fmul
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	fcontract
	movq	%fs:40, %rax
	cmpq	-40(%rbp), %rax
	jne	.LBB4_2
# %bb.1:                                # %SP_return
	xorl	%eax, %eax
	addq	$384, %rsp              # imm = 0x180
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB4_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end4:
	.size	curve25519_donna, .Lfunc_end4-curve25519_donna
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fexpand
	.type	fexpand,@function
fexpand:                                # @fexpand
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	(%rsi), %eax
	andl	$67108863, %eax         # imm = 0x3FFFFFF
	movq	%rax, (%rdi)
	movl	3(%rsi), %eax
	shrl	$2, %eax
	andl	$33554431, %eax         # imm = 0x1FFFFFF
	movq	%rax, 8(%rdi)
	movl	6(%rsi), %eax
	shrl	$3, %eax
	andl	$67108863, %eax         # imm = 0x3FFFFFF
	movq	%rax, 16(%rdi)
	movl	9(%rsi), %eax
	shrl	$5, %eax
	andl	$33554431, %eax         # imm = 0x1FFFFFF
	movq	%rax, 24(%rdi)
	movl	12(%rsi), %eax
	shrq	$6, %rax
	movq	%rax, 32(%rdi)
	movl	16(%rsi), %eax
	andl	$33554431, %eax         # imm = 0x1FFFFFF
	movq	%rax, 40(%rdi)
	movl	19(%rsi), %eax
	shrl	%eax
	andl	$67108863, %eax         # imm = 0x3FFFFFF
	movq	%rax, 48(%rdi)
	movl	22(%rsi), %eax
	shrl	$3, %eax
	andl	$33554431, %eax         # imm = 0x1FFFFFF
	movq	%rax, 56(%rdi)
	movl	25(%rsi), %eax
	shrl	$4, %eax
	andl	$67108863, %eax         # imm = 0x3FFFFFF
	movq	%rax, 64(%rdi)
	movl	28(%rsi), %eax
	shrl	$6, %eax
	andl	$33554431, %eax         # imm = 0x1FFFFFF
	movq	%rax, 72(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	fexpand, .Lfunc_end5-fexpand
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function cmult
	.type	cmult,@function
cmult:                                  # @cmult
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
	subq	$1336, %rsp             # imm = 0x538
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %rbx
	movq	%rdx, -1352(%rbp)       # 8-byte Spill
	movq	%rsi, -1368(%rbp)       # 8-byte Spill
	movq	%rdi, -1360(%rbp)       # 8-byte Spill
	movq	%fs:40, %rax
	movq	%rax, -48(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -208(%rbp)
	movaps	%xmm0, -192(%rbp)
	movaps	%xmm0, -176(%rbp)
	movaps	%xmm0, -160(%rbp)
	movaps	%xmm0, -144(%rbp)
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm0, -112(%rbp)
	movaps	%xmm0, -96(%rbp)
	movaps	%xmm0, -80(%rbp)
	movq	$0, -64(%rbp)
	movaps	%xmm0, -368(%rbp)
	movaps	%xmm0, -352(%rbp)
	movaps	%xmm0, -336(%rbp)
	movaps	%xmm0, -320(%rbp)
	movaps	%xmm0, -304(%rbp)
	movaps	%xmm0, -288(%rbp)
	movaps	%xmm0, -272(%rbp)
	movaps	%xmm0, -256(%rbp)
	movaps	%xmm0, -240(%rbp)
	movq	$0, -224(%rbp)
	movq	$1, -368(%rbp)
	movaps	%xmm0, -528(%rbp)
	movaps	%xmm0, -400(%rbp)
	movaps	%xmm0, -416(%rbp)
	movaps	%xmm0, -432(%rbp)
	movaps	%xmm0, -448(%rbp)
	movaps	%xmm0, -464(%rbp)
	movaps	%xmm0, -480(%rbp)
	movaps	%xmm0, -496(%rbp)
	movaps	%xmm0, -512(%rbp)
	movq	$0, -384(%rbp)
	movq	$1, -528(%rbp)
	movaps	%xmm0, -688(%rbp)
	movaps	%xmm0, -672(%rbp)
	movaps	%xmm0, -656(%rbp)
	movaps	%xmm0, -640(%rbp)
	movaps	%xmm0, -624(%rbp)
	movaps	%xmm0, -608(%rbp)
	movaps	%xmm0, -592(%rbp)
	movaps	%xmm0, -576(%rbp)
	movaps	%xmm0, -560(%rbp)
	movq	$0, -544(%rbp)
	movaps	%xmm0, -720(%rbp)
	movaps	%xmm0, -736(%rbp)
	movaps	%xmm0, -752(%rbp)
	movaps	%xmm0, -768(%rbp)
	movaps	%xmm0, -784(%rbp)
	movaps	%xmm0, -800(%rbp)
	movaps	%xmm0, -816(%rbp)
	movaps	%xmm0, -832(%rbp)
	movaps	%xmm0, -848(%rbp)
	movq	$0, -704(%rbp)
	movaps	%xmm0, -880(%rbp)
	movaps	%xmm0, -896(%rbp)
	movaps	%xmm0, -912(%rbp)
	movaps	%xmm0, -928(%rbp)
	movaps	%xmm0, -944(%rbp)
	movaps	%xmm0, -960(%rbp)
	movaps	%xmm0, -976(%rbp)
	movaps	%xmm0, -992(%rbp)
	movaps	%xmm0, -1008(%rbp)
	movq	$0, -864(%rbp)
	movq	$1, -1008(%rbp)
	movaps	%xmm0, -1040(%rbp)
	movaps	%xmm0, -1056(%rbp)
	movaps	%xmm0, -1072(%rbp)
	movaps	%xmm0, -1088(%rbp)
	movaps	%xmm0, -1104(%rbp)
	movaps	%xmm0, -1120(%rbp)
	movaps	%xmm0, -1136(%rbp)
	movaps	%xmm0, -1152(%rbp)
	movaps	%xmm0, -1168(%rbp)
	movq	$0, -1024(%rbp)
	movaps	%xmm0, -1200(%rbp)
	movaps	%xmm0, -1216(%rbp)
	movaps	%xmm0, -1232(%rbp)
	movaps	%xmm0, -1248(%rbp)
	movaps	%xmm0, -1264(%rbp)
	movaps	%xmm0, -1280(%rbp)
	movaps	%xmm0, -1296(%rbp)
	movaps	%xmm0, -1312(%rbp)
	movaps	%xmm0, -1328(%rbp)
	movq	$0, -1184(%rbp)
	movq	$1, -1328(%rbp)
	movups	64(%rcx), %xmm0
	movaps	%xmm0, -144(%rbp)
	movups	(%rcx), %xmm0
	movups	16(%rcx), %xmm1
	movups	32(%rcx), %xmm2
	movups	48(%rcx), %xmm3
	movq	%rcx, -1336(%rbp)       # 8-byte Spill
	movaps	%xmm3, -160(%rbp)
	movaps	%xmm2, -176(%rbp)
	movaps	%xmm1, -192(%rbp)
	movaps	%xmm0, -208(%rbp)
	movzbl	31(%rdx), %r15d
	movq	%r15, %r12
	shrq	$7, %r12
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%r12, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%r12, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	leaq	-1008(%rbp), %rcx
	movq	%r14, %rdi
	movq	%r13, %rdx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%rbx
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	leaq	-1008(%rbp), %rsi
	movq	%r12, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r15, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %eax
	movq	%rax, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r14
	movq	%r14, %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r15
	movq	%r15, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r15, %r12
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	movq	%r15, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	30(%rax), %r12d
	movq	%r12, %rbx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	movq	%r13, %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r14, %r15
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r13, %r12
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r15
	movq	%r15, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%r13, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r13, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rsi, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %r12
	movq	%r12, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r14, %r12
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	movq	%r12, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r14
	movq	%r14, %rsi
	leaq	-208(%rbp), %rdx
	movq	%rdx, %r13
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r15, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	29(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %r12
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %r14d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r15
	movq	%r15, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r15
	movq	%r15, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %eax
	movq	%rax, -1344(%rbp)       # 8-byte Spill
	movzbl	%r14b, %ebx
	shrq	$7, %rbx
	movq	%r15, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %r13
	movq	%r13, %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %rcx
	movq	%r15, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %r12
	movq	%r12, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r14, %r12
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	movq	%r12, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%r13, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %r15
	movq	%r15, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	28(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %r12
	movq	%r12, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	movq	%r15, %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %eax
	movq	%rax, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r14, %r15
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	movq	%r15, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%r14, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r14, %r13
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	movq	%r13, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r14
	movq	%r14, %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r15, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	27(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%r13, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r13, %r12
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r13
	movq	%r13, %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	26(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r12, %r13
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	movq	%r13, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r15, %r13
	movq	%r14, %rsi
	movq	%r14, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r14, %r15
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	movq	%r15, %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %eax
	movq	%rax, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %r13
	movq	%r13, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rsi, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r13, %r14
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r12
	movq	%r12, %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %r13
	movq	%r13, %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	25(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	movq	%r15, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r13, %r12
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r14, %r12
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%r13, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r12, %r15
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	movq	%r15, %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r12d
	movq	%r12, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r14, %r15
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r15
	movq	%r15, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r15
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	24(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r12, %r14
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %r13
	movq	%r13, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r15
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r15
	movq	%r15, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %eax
	movq	%rax, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	movq	%r15, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r14, %r15
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	movq	%rdx, %r13
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r15, %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r14, %r12
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	23(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r12, %r14
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r12
	movq	%r12, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r15, %r14
	movq	%r13, %rsi
	movq	%r13, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %r13
	movq	%r13, %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %eax
	movq	%rax, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	movq	%r12, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r14, %r13
	movq	%r15, %rsi
	movq	%r15, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r13, %r12
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%r14, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%r14, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	22(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	movq	%r15, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r12
	movq	%r12, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r13, %r14
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%r14, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%r14, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %r14
	movq	%r14, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r14, %r13
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r12
	movq	%r12, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	movq	%r13, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	21(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r12
	movq	%r12, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%r13, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r15, %rsi
	movq	%r15, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %eax
	movq	%rax, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r13, %r15
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	movq	%r15, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r12d
	movq	%r12, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%r14, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r14, %r15
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	movq	%r15, %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %r13
	movq	%r13, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rsi, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	20(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %r13
	movq	%r13, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r15, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r15
	movq	%r15, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %eax
	movq	%rax, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %r13
	movq	%r13, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r15, %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r12
	movq	%r12, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r14, %r12
	movq	%r13, %rsi
	movq	%r13, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r13, %r12
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	19(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %r13
	movq	%r13, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	movq	%r15, %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %eax
	movq	%rax, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %r13
	movq	%r13, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %r14
	movq	%r14, %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r15, %r12
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	18(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r12, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%r12, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r15
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rsi
	movq	%r15, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %eax
	movq	%rax, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r15
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %r13
	movq	%r13, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	movq	%r15, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %r14       # 8-byte Reload
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %r13
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r13, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r12
	movq	%r12, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	17(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r12
	movq	%r12, %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r12, %r13
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r15
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	movq	%r15, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r12
	movq	%r12, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	16(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r13, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	movq	%r15, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%r14, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r14, %r12
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	movq	%r12, %r8
	leaq	-688(%rbp), %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r15, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r14, %r12
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r14, %r12
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	15(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r12
	movq	%r12, %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r12, %r14
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r12, %rdi
	movq	%r12, %r14
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	movq	%r14, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r12, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	14(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %r13
	movq	%r13, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r14, %r12
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%r15, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	movq	%r12, %r15
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	movq	%r15, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r15
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r14d
	movq	%r14, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	movq	%rdi, %r15
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %rcx
	movq	%r13, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r15
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r15
	movq	%r15, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r15, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %r13
	movq	%r13, %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%r15, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	13(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %r12
	movq	%r12, %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r12, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r15
	movq	%r15, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %r15d
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	pushq	%r14
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	movq	%rdx, %r13
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%r13, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r13, %r12
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r13
	movq	%r13, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r13, %r12
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%r15, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	12(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	movq	%r12, %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r15
	movq	%r15, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%r13, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %r13d
	movq	%r13, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r13,%r13), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r15
	movq	%r15, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r15, %r13
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r13, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rsi, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %r15
	movq	%r15, %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	11(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %r12
	movq	%r12, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r15
	movq	%r15, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	movq	%r13, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %r14d
	movq	%r14, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r15, %r13
	movq	%r12, %rsi
	movq	%r12, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r12
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r12, %r15
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	movq	%r13, %r8
	movq	%r15, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %r13
	movq	%r13, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	movq	%r15, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	10(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r12, %r15
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %r13
	movq	%r13, %rsi
	leaq	-848(%rbp), %r15
	movq	%r15, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %r14d
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	movq	%r13, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r15, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	movq	%rdx, %r12
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r13, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %r13
	movq	%r13, %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%r15, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	9(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %r12
	movq	%r12, %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	movq	%r14, %r8
	leaq	-688(%rbp), %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r12, %r13
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %r15
	movq	%r15, %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %eax
	movq	%rax, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r15, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r13, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	pushq	%r14
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %r12       # 8-byte Reload
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %r13
	movq	%r13, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%r13, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r14
	movq	%r14, %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r13, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r15, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	8(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %r12
	movq	%r12, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r12, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	movq	%r12, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%r14, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r14d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	movq	%r13, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r15
	movq	%r15, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %r13d
	movq	%r13, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r13,%r13), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r13d
	movzbl	%r13b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	7(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %r13
	movq	%r13, %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r12, %r15
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r13, %r12
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r15
	movq	%r15, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %ecx
	movq	%rcx, -1344(%rbp)       # 8-byte Spill
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r15, %rdi
	movq	%r15, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	movq	%r13, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %r15       # 8-byte Reload
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %r13
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	movq	%r13, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%r14, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r14, %r12
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r15, %rsi
	movq	%r15, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	6(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %r12
	movq	%r12, %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	movq	%r13, %r8
	leaq	-688(%rbp), %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r15, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %r13
	movq	%r13, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r13, %r14
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %r15d
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r13
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %rcx
	movq	%r13, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r13
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	movq	%rdx, %r12
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%r15, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	5(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r15
	movq	%r15, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %r15d
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r12
	movq	%r12, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	movq	%r13, %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r12, %rsi
	movq	%r12, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %rcx
	movq	%r13, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	4(%rax), %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %r14
	movq	%r14, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %r13d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r15
	movq	%r15, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %rcx
	movq	%r12, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r13,%r13), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r15
	movq	%r15, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r15, %rdi
	movq	%r15, %r12
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r15
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r13d
	movzbl	%r13b, %r14d
	movq	%r14, -1344(%rbp)       # 8-byte Spill
	movzbl	%r13b, %ebx
	shrq	$7, %rbx
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r15
	movq	%r15, %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r13
	movq	%r13, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r15, %r13
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %r15
	movq	%r15, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	movq	%r13, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r12
	movq	%r12, %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%r12, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%r14, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	3(%rax), %r14d
	movq	%r14, %rbx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r14,%r14), %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r14, %r15
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	movq	%r15, %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %eax
	movq	%rax, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%r14, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %r14       # 8-byte Reload
	leal	(%r14,%r14), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r12
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %rcx
	movq	%rcx, %r15
	movq	%r13, %r8
	leaq	-688(%rbp), %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r14d
	movzbl	%r14b, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r12
	movq	%r12, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r12, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%r14, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	2(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %r13
	movq	%r13, %rsi
	leaq	-848(%rbp), %r12
	movq	%r12, %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%r12, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r13, %r15
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r15, %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rsi
	movq	%r13, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %r13d
	movq	%r13, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	movq	%r14, %r12
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r15
	movq	%r15, %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r15, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r13,%r13), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %r15
	movq	%r15, %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r15, %r12
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r14
	movq	%r14, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r12, %r13
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r13, %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	1(%rax), %ebx
	movq	%rbx, -1344(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r15
	movq	%r15, %rdx
	leaq	-1008(%rbp), %r14
	movq	%r14, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r12, %r13
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r15
	movq	%r15, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r15, %rsi
	movq	%r15, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %eax
	movq	%rax, -1344(%rbp)       # 8-byte Spill
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r15
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %rdx
	movq	%rdx, %r13
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r15, %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1344(%rbp), %rax       # 8-byte Reload
	shll	$2, %eax
	movzbl	%al, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r12
	leaq	-1008(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	movq	%r12, %r9
	movq	-1336(%rbp), %r12       # 8-byte Reload
	pushq	%r12
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r13
	movq	%r13, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r12
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	leaq	-1008(%rbp), %rsi
	movq	%rsi, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r13, %r15
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	movq	%r15, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r15       # 8-byte Reload
	pushq	%r15
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movzbl	(%rax), %ebx
	movq	%rbx, -1352(%rbp)       # 8-byte Spill
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %r12
	movq	%r12, %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r15
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%r14, %r15
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	-1352(%rbp), %rax       # 8-byte Reload
	addl	%eax, %eax
	movzbl	%al, %r12d
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r13
	movq	%r13, %rdx
	leaq	-368(%rbp), %r15
	movq	%r15, %rcx
	movq	%r14, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r12,%r12), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %r15
	movq	%r15, %rsi
	leaq	-848(%rbp), %rdx
	leaq	-1008(%rbp), %r13
	movq	%r13, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r14
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r12d
	movzbl	%r12b, %r15d
	movzbl	%r12b, %ebx
	shrq	$7, %rbx
	movq	%r14, %rdi
	leaq	-848(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	leaq	-688(%rbp), %r12
	movq	%r12, %rsi
	leaq	-208(%rbp), %rdx
	leaq	-368(%rbp), %rcx
	leaq	-1168(%rbp), %r8
	movq	%r14, %r9
	movq	-1336(%rbp), %r14       # 8-byte Reload
	pushq	%r14
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	movq	%r13, %rdi
	leaq	-208(%rbp), %rsi
	movq	%rsi, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r12, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rsi, %r12
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r13
	movq	%r13, %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r14
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%r13, %rsi
	movq	%r13, %r14
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %r15d
	movq	%r15, %rbx
	shrq	$7, %rbx
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %rsi
	leaq	-208(%rbp), %r14
	movq	%r14, %rdx
	leaq	-368(%rbp), %r12
	movq	%r12, %rcx
	movq	%r13, %r8
	leaq	-1328(%rbp), %r9
	movq	-1336(%rbp), %r13       # 8-byte Reload
	pushq	%r13
	leaq	-1008(%rbp), %rax
	pushq	%rax
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-688(%rbp), %rdi
	movq	%rdi, %r14
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leal	(%r15,%r15), %eax
	movzbl	%al, %ebx
	shrq	$7, %rbx
	leaq	-528(%rbp), %rdi
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r14, %rdi
	leaq	-368(%rbp), %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-1168(%rbp), %rdi
	leaq	-1328(%rbp), %rsi
	leaq	-848(%rbp), %r14
	movq	%r14, %rdx
	leaq	-1008(%rbp), %r12
	movq	%r12, %rcx
	leaq	-528(%rbp), %r8
	leaq	-688(%rbp), %r9
	pushq	%r13
	leaq	-368(%rbp), %rax
	pushq	%rax
	leaq	-208(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-1168(%rbp), %rdi
	movq	%rdi, %r13
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	shll	$2, %r15d
	movzbl	%r15b, %ebx
	shrq	$7, %rbx
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	movq	%r12, %r13
	movq	%rbx, %rdx
	callq	swap_conditional
	subq	$8, %rsp
	leaq	-528(%rbp), %rdi
	leaq	-688(%rbp), %r15
	movq	%r15, %rsi
	leaq	-208(%rbp), %r12
	movq	%r12, %rdx
	leaq	-368(%rbp), %r14
	movq	%r14, %rcx
	leaq	-1168(%rbp), %r8
	leaq	-1328(%rbp), %r9
	pushq	-1336(%rbp)             # 8-byte Folded Reload
	pushq	%r13
	leaq	-848(%rbp), %rax
	pushq	%rax
	callq	fmonty
	addq	$32, %rsp
	leaq	-528(%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	swap_conditional
	movaps	-464(%rbp), %xmm0
	movq	-1360(%rbp), %rax       # 8-byte Reload
	movups	%xmm0, 64(%rax)
	movaps	-528(%rbp), %xmm0
	movaps	-512(%rbp), %xmm1
	movaps	-496(%rbp), %xmm2
	movaps	-480(%rbp), %xmm3
	movups	%xmm3, 48(%rax)
	movups	%xmm2, 32(%rax)
	movups	%xmm1, 16(%rax)
	movups	%xmm0, (%rax)
	movaps	-624(%rbp), %xmm0
	movq	-1368(%rbp), %rax       # 8-byte Reload
	movups	%xmm0, 64(%rax)
	movaps	-688(%rbp), %xmm0
	movaps	-672(%rbp), %xmm1
	movaps	-656(%rbp), %xmm2
	movaps	-640(%rbp), %xmm3
	movups	%xmm3, 48(%rax)
	movups	%xmm2, 32(%rax)
	movups	%xmm1, 16(%rax)
	movups	%xmm0, (%rax)
	movq	%fs:40, %rax
	cmpq	-48(%rbp), %rax
	jne	.LBB6_2
# %bb.1:                                # %SP_return
	addq	$1336, %rsp             # imm = 0x538
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB6_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end6:
	.size	cmult, .Lfunc_end6-cmult
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function crecip
	.type	crecip,@function
crecip:                                 # @crecip
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
	subq	$824, %rsp              # imm = 0x338
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movq	%rdi, -856(%rbp)        # 8-byte Spill
	movq	%fs:40, %rax
	movq	%rax, -48(%rbp)
	leaq	-128(%rbp), %r13
	movq	%r13, %rdi
	callq	fsquare
	leaq	-848(%rbp), %r15
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	fsquare
	leaq	-768(%rbp), %rbx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	leaq	-208(%rbp), %r12
	movq	%r12, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	fmul
	leaq	-288(%rbp), %r14
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%r13, %rdx
	callq	fmul
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	fsquare
	leaq	-368(%rbp), %r13
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	fmul
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	leaq	-448(%rbp), %r14
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	callq	fmul
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	leaq	-528(%rbp), %r13
	movq	%r13, %rdi
	movq	%r15, %rsi
	movq	%r14, %rdx
	callq	fmul
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	callq	fmul
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	leaq	-608(%rbp), %r13
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	fmul
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	leaq	-688(%rbp), %r14
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	callq	fmul
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	fmul
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	callq	fmul
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsquare
	movq	-856(%rbp), %rdi        # 8-byte Reload
	movq	%r15, %rsi
	leaq	-288(%rbp), %rdx
	callq	fmul
	movq	%fs:40, %rax
	cmpq	-48(%rbp), %rax
	jne	.LBB7_2
# %bb.1:                                # %SP_return
	addq	$824, %rsp              # imm = 0x338
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB7_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end7:
	.size	crecip, .Lfunc_end7-crecip
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fmul
	.type	fmul,@function
fmul:                                   # @fmul
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$160, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, %rbx
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	leaq	-176(%rbp), %r14
	movq	%r14, %rdi
	callq	fproduct
	movq	%r14, %rdi
	callq	freduce_degree
	movq	%r14, %rdi
	callq	freduce_coefficients
	movaps	-112(%rbp), %xmm0
	movups	%xmm0, 64(%rbx)
	movaps	-176(%rbp), %xmm0
	movaps	-160(%rbp), %xmm1
	movaps	-144(%rbp), %xmm2
	movaps	-128(%rbp), %xmm3
	movups	%xmm3, 48(%rbx)
	movups	%xmm2, 32(%rbx)
	movups	%xmm1, 16(%rbx)
	movups	%xmm0, (%rbx)
	movq	%fs:40, %rax
	cmpq	-24(%rbp), %rax
	jne	.LBB8_2
# %bb.1:                                # %SP_return
	addq	$160, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB8_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end8:
	.size	fmul, .Lfunc_end8-fmul
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fcontract
	.type	fcontract,@function
fcontract:                              # @fcontract
	.cfi_startproc
# %bb.0:                                # %.preheader6
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$48, %rsp
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	movl	(%rsi), %ecx
	movl	%ecx, -80(%rbp)
	movl	8(%rsi), %edx
	movl	%edx, -76(%rbp)
	movl	16(%rsi), %eax
	movl	%eax, -72(%rbp)
	movl	24(%rsi), %r15d
	movl	%r15d, -68(%rbp)
	movl	32(%rsi), %r14d
	movl	%r14d, -64(%rbp)
	movl	40(%rsi), %r11d
	movl	%r11d, -60(%rbp)
	movl	48(%rsi), %r10d
	movl	%r10d, -56(%rbp)
	movl	56(%rsi), %r9d
	movl	%r9d, -52(%rbp)
	movl	64(%rsi), %r8d
	movl	%r8d, -48(%rbp)
	movl	72(%rsi), %esi
	movl	%esi, -44(%rbp)
	movl	%ecx, %esi
	sarl	$31, %esi
	andl	%ecx, %esi
	movl	%esi, %ebx
	sarl	$26, %ebx
	andl	$-67108864, %esi        # imm = 0xFC000000
	subl	%esi, %ecx
	movl	%ecx, -80(%rbp)
	addl	%edx, %ebx
	movl	%ebx, %ecx
	sarl	$31, %ecx
	andl	%ebx, %ecx
	movl	%ecx, %edx
	sarl	$25, %edx
	andl	$-33554432, %ecx        # imm = 0xFE000000
	subl	%ecx, %ebx
	movl	%ebx, -76(%rbp)
	addl	%eax, %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	andl	%edx, %ecx
	movl	%ecx, %eax
	sarl	$26, %eax
	andl	$-67108864, %ecx        # imm = 0xFC000000
	subl	%ecx, %edx
	movl	%edx, -72(%rbp)
	addl	%r15d, %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	andl	%eax, %ecx
	movl	%ecx, %edx
	sarl	$25, %edx
	andl	$-33554432, %ecx        # imm = 0xFE000000
	subl	%ecx, %eax
	movl	%eax, -68(%rbp)
	addl	%r14d, %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	andl	%edx, %ecx
	movl	%ecx, %esi
	sarl	$26, %esi
	andl	$-67108864, %ecx        # imm = 0xFC000000
	subl	%ecx, %edx
	movl	%edx, -64(%rbp)
	addl	%r11d, %esi
	movl	%esi, %ecx
	sarl	$31, %ecx
	andl	%esi, %ecx
	movl	%ecx, %edx
	sarl	$25, %edx
	andl	$-33554432, %ecx        # imm = 0xFE000000
	subl	%ecx, %esi
	movl	%esi, -60(%rbp)
	addl	%r10d, %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	andl	%edx, %ecx
	movl	%ecx, %esi
	sarl	$26, %esi
	andl	$-67108864, %ecx        # imm = 0xFC000000
	subl	%ecx, %edx
	movl	%edx, -56(%rbp)
	addl	%r9d, %esi
	movl	%esi, %ecx
	sarl	$31, %ecx
	andl	%esi, %ecx
	movl	%ecx, %edx
	sarl	$25, %edx
	andl	$-33554432, %ecx        # imm = 0xFE000000
	subl	%ecx, %esi
	movl	%esi, -52(%rbp)
	addl	%r8d, %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	andl	%edx, %ecx
	movl	%ecx, %esi
	sarl	$26, %esi
	andl	$-67108864, %ecx        # imm = 0xFC000000
	subl	%ecx, %edx
	movl	%edx, -48(%rbp)
	addl	-44(%rbp), %esi
	movl	%esi, %ecx
	sarl	$31, %ecx
	andl	%esi, %ecx
	movl	%ecx, %edx
	sarl	$25, %edx
	andl	$-33554432, %ecx        # imm = 0xFE000000
	subl	%ecx, %esi
	movl	%esi, -44(%rbp)
	leal	(%rdx,%rdx,8), %ecx
	leal	(%rdx,%rcx,2), %ecx
	addl	-80(%rbp), %ecx
	movl	%ecx, %edx
	sarl	$31, %edx
	andl	%ecx, %edx
	movl	%edx, %esi
	sarl	$26, %esi
	andl	$-67108864, %edx        # imm = 0xFC000000
	subl	%edx, %ecx
	movl	%ecx, -80(%rbp)
	addl	-76(%rbp), %esi
	movl	%esi, %ecx
	sarl	$31, %ecx
	andl	%esi, %ecx
	movl	%ecx, %edx
	sarl	$25, %edx
	andl	$-33554432, %ecx        # imm = 0xFE000000
	subl	%ecx, %esi
	movl	%esi, -76(%rbp)
	addl	-72(%rbp), %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	andl	%edx, %ecx
	movl	%ecx, %esi
	sarl	$26, %esi
	andl	$-67108864, %ecx        # imm = 0xFC000000
	subl	%ecx, %edx
	movl	%edx, -72(%rbp)
	addl	%eax, %esi
	movl	%esi, %eax
	sarl	$31, %eax
	andl	%esi, %eax
	movl	%eax, %ecx
	sarl	$25, %ecx
	andl	$-33554432, %eax        # imm = 0xFE000000
	subl	%eax, %esi
	movl	%esi, -68(%rbp)
	addl	-64(%rbp), %ecx
	movl	%ecx, %eax
	sarl	$31, %eax
	andl	%ecx, %eax
	movl	%eax, %edx
	sarl	$26, %edx
	andl	$-67108864, %eax        # imm = 0xFC000000
	subl	%eax, %ecx
	movl	%ecx, -64(%rbp)
	addl	-60(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	andl	%edx, %eax
	movl	%eax, %ecx
	sarl	$25, %ecx
	andl	$-33554432, %eax        # imm = 0xFE000000
	subl	%eax, %edx
	movl	%edx, -60(%rbp)
	addl	-56(%rbp), %ecx
	movl	%ecx, %eax
	sarl	$31, %eax
	andl	%ecx, %eax
	movl	%eax, %edx
	sarl	$26, %edx
	andl	$-67108864, %eax        # imm = 0xFC000000
	subl	%eax, %ecx
	movl	%ecx, -56(%rbp)
	addl	-52(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	andl	%edx, %eax
	movl	%eax, %ecx
	sarl	$25, %ecx
	andl	$-33554432, %eax        # imm = 0xFE000000
	subl	%eax, %edx
	movl	%edx, -52(%rbp)
	addl	-48(%rbp), %ecx
	movl	%ecx, %eax
	sarl	$31, %eax
	andl	%ecx, %eax
	movl	%eax, %edx
	sarl	$26, %edx
	andl	$-67108864, %eax        # imm = 0xFC000000
	subl	%eax, %ecx
	movl	%ecx, -48(%rbp)
	addl	-44(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	andl	%edx, %eax
	movl	%eax, %ecx
	sarl	$25, %ecx
	andl	$-33554432, %eax        # imm = 0xFE000000
	subl	%eax, %edx
	movl	%edx, -44(%rbp)
	leal	(%rcx,%rcx,8), %eax
	leal	(%rcx,%rax,2), %eax
	addl	-80(%rbp), %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	andl	%eax, %ecx
	movl	%ecx, %edx
	sarl	$26, %edx
	andl	$-67108864, %ecx        # imm = 0xFC000000
	subl	%ecx, %eax
	movl	%eax, -80(%rbp)
	addl	-76(%rbp), %edx
	movl	%eax, %ecx
	sarl	$26, %ecx
	addl	%edx, %ecx
	andl	$67108863, %eax         # imm = 0x3FFFFFF
	movl	%eax, -80(%rbp)
	movl	%ecx, %eax
	sarl	$25, %eax
	andl	$33554431, %ecx         # imm = 0x1FFFFFF
	movl	%ecx, -76(%rbp)
	addl	-72(%rbp), %eax
	movl	%eax, %ecx
	sarl	$26, %ecx
	andl	$67108863, %eax         # imm = 0x3FFFFFF
	movl	%eax, -72(%rbp)
	addl	-68(%rbp), %ecx
	movl	%ecx, %edx
	sarl	$25, %edx
	andl	$33554431, %ecx         # imm = 0x1FFFFFF
	movl	%ecx, -68(%rbp)
	addl	-64(%rbp), %edx
	movl	%edx, %esi
	sarl	$26, %esi
	andl	$67108863, %edx         # imm = 0x3FFFFFF
	movl	%edx, -64(%rbp)
	addl	-60(%rbp), %esi
	movl	%esi, %edx
	sarl	$25, %edx
	andl	$33554431, %esi         # imm = 0x1FFFFFF
	movl	%esi, -60(%rbp)
	addl	-56(%rbp), %edx
	movl	%edx, %esi
	sarl	$26, %esi
	andl	$67108863, %edx         # imm = 0x3FFFFFF
	movl	%edx, -56(%rbp)
	addl	-52(%rbp), %esi
	movl	%esi, %edx
	sarl	$25, %edx
	andl	$33554431, %esi         # imm = 0x1FFFFFF
	movl	%esi, -52(%rbp)
	addl	-48(%rbp), %edx
	movl	%edx, %esi
	sarl	$26, %esi
	andl	$67108863, %edx         # imm = 0x3FFFFFF
	movl	%edx, -48(%rbp)
	addl	-44(%rbp), %esi
	movl	%esi, %edx
	sarl	$25, %edx
	andl	$33554431, %esi         # imm = 0x1FFFFFF
	movl	%esi, -44(%rbp)
	leal	(%rdx,%rdx,8), %esi
	leal	(%rdx,%rsi,2), %edx
	addl	-80(%rbp), %edx
	movl	%edx, %esi
	sarl	$26, %esi
	andl	$67108863, %edx         # imm = 0x3FFFFFF
	movl	%edx, -80(%rbp)
	addl	-76(%rbp), %esi
	movl	%esi, %edx
	sarl	$25, %edx
	andl	$33554431, %esi         # imm = 0x1FFFFFF
	movl	%esi, -76(%rbp)
	addl	%eax, %edx
	movl	%edx, %eax
	sarl	$26, %eax
	andl	$67108863, %edx         # imm = 0x3FFFFFF
	movl	%edx, -72(%rbp)
	addl	%ecx, %eax
	movl	%eax, %ecx
	sarl	$25, %ecx
	andl	$33554431, %eax         # imm = 0x1FFFFFF
	movl	%eax, -68(%rbp)
	addl	-64(%rbp), %ecx
	movl	%ecx, %eax
	sarl	$26, %eax
	andl	$67108863, %ecx         # imm = 0x3FFFFFF
	movl	%ecx, -64(%rbp)
	addl	-60(%rbp), %eax
	movl	%eax, %ecx
	sarl	$25, %ecx
	andl	$33554431, %eax         # imm = 0x1FFFFFF
	movl	%eax, -60(%rbp)
	addl	-56(%rbp), %ecx
	movq	%rdi, %rbx
	movl	%ecx, %eax
	sarl	$26, %eax
	andl	$67108863, %ecx         # imm = 0x3FFFFFF
	movl	%ecx, -56(%rbp)
	addl	-52(%rbp), %eax
	movl	%eax, %ecx
	sarl	$25, %ecx
	andl	$33554431, %eax         # imm = 0x1FFFFFF
	movl	%eax, -52(%rbp)
	addl	-48(%rbp), %ecx
	movl	%ecx, %eax
	sarl	$26, %eax
	andl	$67108863, %ecx         # imm = 0x3FFFFFF
	movl	%ecx, -48(%rbp)
	addl	-44(%rbp), %eax
	movl	%eax, %ecx
	sarl	$25, %ecx
	andl	$33554431, %eax         # imm = 0x1FFFFFF
	movl	%eax, -44(%rbp)
	leal	(%rcx,%rcx,8), %eax
	leal	(%rcx,%rax,2), %edi
	addl	-80(%rbp), %edi
	movl	%edi, -80(%rbp)
	movl	$67108845, %esi         # imm = 0x3FFFFED
	callq	s32_gte
	movl	%eax, %r14d
	movl	-76(%rbp), %edi
	movl	$33554431, %esi         # imm = 0x1FFFFFF
	callq	s32_eq
	movl	%eax, %r15d
	movl	-72(%rbp), %edi
	movl	$67108863, %esi         # imm = 0x3FFFFFF
	callq	s32_eq
	movl	%eax, %r12d
	andl	%r15d, %r12d
	movl	-68(%rbp), %edi
	movl	$33554431, %esi         # imm = 0x1FFFFFF
	callq	s32_eq
	movl	%eax, %r15d
	andl	%r12d, %r15d
	movl	-64(%rbp), %edi
	movl	$67108863, %esi         # imm = 0x3FFFFFF
	callq	s32_eq
	movl	%eax, %r12d
	andl	%r15d, %r12d
	movl	-60(%rbp), %edi
	movl	$33554431, %esi         # imm = 0x1FFFFFF
	callq	s32_eq
	movl	%eax, %r15d
	andl	%r12d, %r15d
	movl	-56(%rbp), %edi
	movl	$67108863, %esi         # imm = 0x3FFFFFF
	callq	s32_eq
	movl	%eax, %r12d
	andl	%r15d, %r12d
	movl	-52(%rbp), %edi
	movl	$33554431, %esi         # imm = 0x1FFFFFF
	callq	s32_eq
	movl	%eax, %r15d
	andl	%r12d, %r15d
	movl	-48(%rbp), %edi
	movl	$67108863, %esi         # imm = 0x3FFFFFF
	callq	s32_eq
	movl	%eax, %r12d
	andl	%r15d, %r12d
	movl	-44(%rbp), %edi
	movl	$33554431, %esi         # imm = 0x1FFFFFF
	callq	s32_eq
	andl	%r12d, %eax
	andl	%r14d, %eax
	movl	%eax, %ecx
	andl	$67108845, %ecx         # imm = 0x3FFFFED
	subl	%ecx, -80(%rbp)
	movl	%eax, %esi
	andl	$33554431, %esi         # imm = 0x1FFFFFF
	movl	-76(%rbp), %r9d
	movl	-72(%rbp), %r8d
	subl	%esi, %r9d
	movl	%r9d, -76(%rbp)
	andl	$67108863, %eax         # imm = 0x3FFFFFF
	subl	%eax, %r8d
	movl	%r8d, -72(%rbp)
	movl	-68(%rbp), %r10d
	subl	%esi, %r10d
	movl	%r10d, -68(%rbp)
	movl	-64(%rbp), %r11d
	subl	%eax, %r11d
	movl	%r11d, -64(%rbp)
	subl	%esi, -60(%rbp)
	movl	-56(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, -56(%rbp)
	movl	-52(%rbp), %edi
	subl	%esi, %edi
	movl	%edi, -52(%rbp)
	movl	-48(%rbp), %ecx
	subl	%eax, %ecx
	movl	%ecx, -48(%rbp)
	movl	-44(%rbp), %eax
	subl	%esi, %eax
	shll	$2, %r9d
	movl	%r9d, -76(%rbp)
	shll	$3, %r8d
	movl	%r8d, -72(%rbp)
	shll	$5, %r10d
	movl	%r10d, -68(%rbp)
	shll	$6, %r11d
	movl	%r11d, -64(%rbp)
	addl	%edx, %edx
	movl	%edx, -56(%rbp)
	shll	$3, %edi
	movl	%edi, -52(%rbp)
	shll	$4, %ecx
	movl	%ecx, -48(%rbp)
	shll	$6, %eax
	movl	%eax, -44(%rbp)
	movb	$0, (%rbx)
	movb	$0, 16(%rbx)
	movb	-80(%rbp), %al
	movb	%al, (%rbx)
	movb	-79(%rbp), %al
	movb	%al, 1(%rbx)
	movb	-78(%rbp), %al
	movb	%al, 2(%rbx)
	movl	-80(%rbp), %eax
	sarl	$24, %eax
	movb	%al, 3(%rbx)
	orl	-76(%rbp), %eax
	movb	%al, 3(%rbx)
	movb	-75(%rbp), %al
	movb	%al, 4(%rbx)
	movb	-74(%rbp), %al
	movb	%al, 5(%rbx)
	movl	-76(%rbp), %eax
	sarl	$24, %eax
	movb	%al, 6(%rbx)
	orl	-72(%rbp), %eax
	movb	%al, 6(%rbx)
	movb	-71(%rbp), %al
	movb	%al, 7(%rbx)
	movb	-70(%rbp), %al
	movb	%al, 8(%rbx)
	movl	-72(%rbp), %eax
	sarl	$24, %eax
	movb	%al, 9(%rbx)
	orl	-68(%rbp), %eax
	movb	%al, 9(%rbx)
	movb	-67(%rbp), %al
	movb	%al, 10(%rbx)
	movb	-66(%rbp), %al
	movb	%al, 11(%rbx)
	movl	-68(%rbp), %eax
	sarl	$24, %eax
	movb	%al, 12(%rbx)
	orl	-64(%rbp), %eax
	movb	%al, 12(%rbx)
	movb	-63(%rbp), %al
	movb	%al, 13(%rbx)
	movb	-62(%rbp), %al
	movb	%al, 14(%rbx)
	movb	-61(%rbp), %al
	movb	%al, 15(%rbx)
	movzbl	16(%rbx), %eax
	orl	-60(%rbp), %eax
	movb	%al, 16(%rbx)
	movb	-59(%rbp), %al
	movb	%al, 17(%rbx)
	movb	-58(%rbp), %al
	movb	%al, 18(%rbx)
	movl	-60(%rbp), %eax
	sarl	$24, %eax
	movb	%al, 19(%rbx)
	orl	-56(%rbp), %eax
	movb	%al, 19(%rbx)
	movb	-55(%rbp), %al
	movb	%al, 20(%rbx)
	movb	-54(%rbp), %al
	movb	%al, 21(%rbx)
	movl	-56(%rbp), %eax
	sarl	$24, %eax
	movb	%al, 22(%rbx)
	orl	-52(%rbp), %eax
	movb	%al, 22(%rbx)
	movb	-51(%rbp), %al
	movb	%al, 23(%rbx)
	movb	-50(%rbp), %al
	movb	%al, 24(%rbx)
	movl	-52(%rbp), %eax
	sarl	$24, %eax
	movb	%al, 25(%rbx)
	orl	-48(%rbp), %eax
	movb	%al, 25(%rbx)
	movb	-47(%rbp), %al
	movb	%al, 26(%rbx)
	movb	-46(%rbp), %al
	movb	%al, 27(%rbx)
	movl	-48(%rbp), %eax
	sarl	$24, %eax
	movb	%al, 28(%rbx)
	orl	-44(%rbp), %eax
	movb	%al, 28(%rbx)
	movb	-43(%rbp), %al
	movb	%al, 29(%rbx)
	movb	-42(%rbp), %al
	movb	%al, 30(%rbx)
	movb	-41(%rbp), %al
	movb	%al, 31(%rbx)
	movq	%fs:40, %rax
	cmpq	-40(%rbp), %rax
	jne	.LBB9_2
# %bb.1:                                # %SP_return
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB9_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end9:
	.size	fcontract, .Lfunc_end9-fcontract
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function s32_gte
	.type	s32_gte,@function
s32_gte:                                # @s32_gte
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, %eax
	subl	%esi, %eax
	sarl	$31, %eax
	notl	%eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end10:
	.size	s32_gte, .Lfunc_end10-s32_gte
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function s32_eq
	.type	s32_eq,@function
s32_eq:                                 # @s32_eq
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%esi, %edi
	notl	%edi
	movl	%edi, %eax
	shll	$16, %eax
	andl	%edi, %eax
	movl	%eax, %ecx
	shll	$8, %ecx
	andl	%eax, %ecx
	movl	%ecx, %eax
	shll	$4, %eax
	andl	%ecx, %eax
	leal	(,%rax,4), %ecx
	andl	%eax, %ecx
	leal	(%rcx,%rcx), %eax
	andl	%ecx, %eax
	sarl	$31, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end11:
	.size	s32_eq, .Lfunc_end11-s32_eq
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fproduct
	.type	fproduct,@function
fproduct:                               # @fproduct
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movslq	(%rsi), %rax
	movslq	(%rdx), %rcx
	imulq	%rax, %rcx
	movq	%rcx, (%rdi)
	movslq	(%rsi), %rax
	movslq	8(%rdx), %rcx
	imulq	%rax, %rcx
	movslq	8(%rsi), %r8
	movslq	(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movq	%rax, 8(%rdi)
	movslq	8(%rsi), %rax
	movslq	8(%rdx), %rcx
	imulq	%rax, %rcx
	movslq	(%rsi), %r8
	movslq	16(%rdx), %rax
	imulq	%r8, %rax
	leaq	(%rax,%rcx,2), %r8
	movslq	16(%rsi), %rcx
	movslq	(%rdx), %rax
	imulq	%rcx, %rax
	addq	%r8, %rax
	movq	%rax, 16(%rdi)
	movslq	8(%rsi), %rax
	movslq	16(%rdx), %rcx
	imulq	%rax, %rcx
	movslq	16(%rsi), %r8
	movslq	8(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	(%rsi), %r8
	movslq	24(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	24(%rsi), %r8
	movslq	(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movq	%rax, 24(%rdi)
	movslq	16(%rsi), %rax
	movslq	16(%rdx), %r9
	imulq	%rax, %r9
	movslq	8(%rsi), %r8
	movslq	24(%rdx), %rax
	imulq	%r8, %rax
	movslq	24(%rsi), %r8
	movslq	8(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	leaq	(%r9,%rcx,2), %r8
	movslq	(%rsi), %rcx
	movslq	32(%rdx), %rax
	imulq	%rcx, %rax
	addq	%r8, %rax
	movslq	32(%rsi), %r8
	movslq	(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movq	%rcx, 32(%rdi)
	movslq	16(%rsi), %rax
	movslq	24(%rdx), %rcx
	imulq	%rax, %rcx
	movslq	24(%rsi), %r8
	movslq	16(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	8(%rsi), %r8
	movslq	32(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	32(%rsi), %r8
	movslq	8(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	(%rsi), %r8
	movslq	40(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	40(%rsi), %r8
	movslq	(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movq	%rax, 40(%rdi)
	movslq	24(%rsi), %rax
	movslq	24(%rdx), %rcx
	imulq	%rax, %rcx
	movslq	8(%rsi), %r8
	movslq	40(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	40(%rsi), %r8
	movslq	8(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	16(%rsi), %r8
	movslq	32(%rdx), %rax
	imulq	%r8, %rax
	leaq	(%rax,%rcx,2), %r8
	movslq	32(%rsi), %rcx
	movslq	16(%rdx), %rax
	imulq	%rcx, %rax
	addq	%r8, %rax
	movslq	(%rsi), %r8
	movslq	48(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	48(%rsi), %r8
	movslq	(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movq	%rax, 48(%rdi)
	movslq	24(%rsi), %rax
	movslq	32(%rdx), %rcx
	imulq	%rax, %rcx
	movslq	32(%rsi), %r8
	movslq	24(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	16(%rsi), %r8
	movslq	40(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	40(%rsi), %r8
	movslq	16(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	8(%rsi), %r8
	movslq	48(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	48(%rsi), %r8
	movslq	8(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	(%rsi), %r8
	movslq	56(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	56(%rsi), %r8
	movslq	(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movq	%rax, 56(%rdi)
	movslq	32(%rsi), %rax
	movslq	32(%rdx), %r9
	imulq	%rax, %r9
	movslq	24(%rsi), %r8
	movslq	40(%rdx), %rax
	imulq	%r8, %rax
	movslq	40(%rsi), %r8
	movslq	24(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	8(%rsi), %r8
	movslq	56(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	56(%rsi), %r8
	movslq	8(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	leaq	(%r9,%rcx,2), %r8
	movslq	16(%rsi), %rcx
	movslq	48(%rdx), %rax
	imulq	%rcx, %rax
	addq	%r8, %rax
	movslq	48(%rsi), %r8
	movslq	16(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	(%rsi), %r8
	movslq	64(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	64(%rsi), %r8
	movslq	(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movq	%rcx, 64(%rdi)
	movslq	32(%rsi), %rax
	movslq	40(%rdx), %rcx
	imulq	%rax, %rcx
	movslq	40(%rsi), %r8
	movslq	32(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	24(%rsi), %r8
	movslq	48(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	48(%rsi), %r8
	movslq	24(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	16(%rsi), %r8
	movslq	56(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	56(%rsi), %r8
	movslq	16(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	8(%rsi), %r8
	movslq	64(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	64(%rsi), %r8
	movslq	8(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	(%rsi), %r8
	movslq	72(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	72(%rsi), %r8
	movslq	(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movq	%rax, 72(%rdi)
	movslq	40(%rsi), %rax
	movslq	40(%rdx), %rcx
	imulq	%rax, %rcx
	movslq	24(%rsi), %r8
	movslq	56(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	56(%rsi), %r8
	movslq	24(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	8(%rsi), %r8
	movslq	72(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	72(%rsi), %r8
	movslq	8(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	32(%rsi), %r8
	movslq	48(%rdx), %rax
	imulq	%r8, %rax
	leaq	(%rax,%rcx,2), %r8
	movslq	48(%rsi), %rcx
	movslq	32(%rdx), %rax
	imulq	%rcx, %rax
	addq	%r8, %rax
	movslq	16(%rsi), %r8
	movslq	64(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	64(%rsi), %r8
	movslq	16(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movq	%rax, 80(%rdi)
	movslq	40(%rsi), %rax
	movslq	48(%rdx), %rcx
	imulq	%rax, %rcx
	movslq	48(%rsi), %r8
	movslq	40(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	32(%rsi), %r8
	movslq	56(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	56(%rsi), %r8
	movslq	32(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	24(%rsi), %r8
	movslq	64(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	64(%rsi), %r8
	movslq	24(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	16(%rsi), %r8
	movslq	72(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	72(%rsi), %r8
	movslq	16(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movq	%rax, 88(%rdi)
	movslq	48(%rsi), %rax
	movslq	48(%rdx), %r9
	imulq	%rax, %r9
	movslq	40(%rsi), %r8
	movslq	56(%rdx), %rax
	imulq	%r8, %rax
	movslq	56(%rsi), %r8
	movslq	40(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	24(%rsi), %r8
	movslq	72(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	72(%rsi), %r8
	movslq	24(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	leaq	(%r9,%rcx,2), %r8
	movslq	32(%rsi), %rcx
	movslq	64(%rdx), %rax
	imulq	%rcx, %rax
	addq	%r8, %rax
	movslq	64(%rsi), %r8
	movslq	32(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movq	%rcx, 96(%rdi)
	movslq	48(%rsi), %rax
	movslq	56(%rdx), %rcx
	imulq	%rax, %rcx
	movslq	56(%rsi), %r8
	movslq	48(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	40(%rsi), %r8
	movslq	64(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	64(%rsi), %r8
	movslq	40(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	32(%rsi), %r8
	movslq	72(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	72(%rsi), %r8
	movslq	32(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movq	%rax, 104(%rdi)
	movslq	56(%rsi), %rax
	movslq	56(%rdx), %rcx
	imulq	%rax, %rcx
	movslq	40(%rsi), %r8
	movslq	72(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	72(%rsi), %r8
	movslq	40(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	48(%rsi), %r8
	movslq	64(%rdx), %rax
	imulq	%r8, %rax
	leaq	(%rax,%rcx,2), %r8
	movslq	64(%rsi), %rcx
	movslq	48(%rdx), %rax
	imulq	%rcx, %rax
	addq	%r8, %rax
	movq	%rax, 112(%rdi)
	movslq	56(%rsi), %rax
	movslq	64(%rdx), %rcx
	imulq	%rax, %rcx
	movslq	64(%rsi), %r8
	movslq	56(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movslq	48(%rsi), %r8
	movslq	72(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	movslq	72(%rsi), %r8
	movslq	48(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movq	%rax, 120(%rdi)
	movslq	64(%rsi), %rax
	movslq	64(%rdx), %r9
	imulq	%rax, %r9
	movslq	56(%rsi), %r8
	movslq	72(%rdx), %rax
	imulq	%r8, %rax
	movslq	72(%rsi), %r8
	movslq	56(%rdx), %rcx
	imulq	%r8, %rcx
	addq	%rax, %rcx
	leaq	(%r9,%rcx,2), %rax
	movq	%rax, 128(%rdi)
	movslq	64(%rsi), %rax
	movslq	72(%rdx), %rcx
	imulq	%rax, %rcx
	movslq	72(%rsi), %r8
	movslq	64(%rdx), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	movq	%rax, 136(%rdi)
	movslq	72(%rsi), %rax
	movslq	72(%rdx), %rcx
	imulq	%rax, %rcx
	addq	%rcx, %rcx
	movq	%rcx, 144(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end12:
	.size	fproduct, .Lfunc_end12-fproduct
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function freduce_degree
	.type	freduce_degree,@function
freduce_degree:                         # @freduce_degree
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	144(%rdi), %rax
	movq	%rax, %rcx
	shlq	$4, %rcx
	addq	64(%rdi), %rcx
	leaq	(%rcx,%rax,2), %rcx
	addq	%rax, %rcx
	movq	%rcx, 64(%rdi)
	movq	136(%rdi), %rax
	movq	%rax, %rcx
	shlq	$4, %rcx
	addq	56(%rdi), %rcx
	leaq	(%rcx,%rax,2), %rcx
	addq	%rax, %rcx
	movq	%rcx, 56(%rdi)
	movq	128(%rdi), %rax
	movq	%rax, %rcx
	shlq	$4, %rcx
	addq	48(%rdi), %rcx
	leaq	(%rcx,%rax,2), %rcx
	addq	%rax, %rcx
	movq	%rcx, 48(%rdi)
	movq	120(%rdi), %rax
	movq	%rax, %rcx
	shlq	$4, %rcx
	addq	40(%rdi), %rcx
	leaq	(%rcx,%rax,2), %rcx
	addq	%rax, %rcx
	movq	%rcx, 40(%rdi)
	movq	104(%rdi), %rax
	movq	112(%rdi), %rcx
	movq	%rcx, %rdx
	shlq	$4, %rdx
	addq	32(%rdi), %rdx
	leaq	(%rdx,%rcx,2), %rdx
	addq	%rcx, %rdx
	movq	%rdx, 32(%rdi)
	shlq	$4, %rax
	addq	24(%rdi), %rax
	movq	%rax, 24(%rdi)
	movq	104(%rdi), %rcx
	leaq	(%rax,%rcx,2), %rax
	movq	%rax, 24(%rdi)
	addq	104(%rdi), %rax
	movq	%rax, 24(%rdi)
	movq	96(%rdi), %rax
	shlq	$4, %rax
	addq	16(%rdi), %rax
	movq	%rax, 16(%rdi)
	movq	96(%rdi), %rcx
	leaq	(%rax,%rcx,2), %rax
	movq	%rax, 16(%rdi)
	addq	96(%rdi), %rax
	movq	%rax, 16(%rdi)
	movq	88(%rdi), %rax
	shlq	$4, %rax
	addq	8(%rdi), %rax
	movq	%rax, 8(%rdi)
	movq	88(%rdi), %rcx
	leaq	(%rax,%rcx,2), %rax
	movq	%rax, 8(%rdi)
	addq	88(%rdi), %rax
	movq	%rax, 8(%rdi)
	movq	80(%rdi), %rax
	shlq	$4, %rax
	addq	(%rdi), %rax
	movq	%rax, (%rdi)
	movq	80(%rdi), %rcx
	leaq	(%rax,%rcx,2), %rax
	movq	%rax, (%rdi)
	addq	80(%rdi), %rax
	movq	%rax, (%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end13:
	.size	freduce_degree, .Lfunc_end13-freduce_degree
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function freduce_coefficients
	.type	freduce_coefficients,@function
freduce_coefficients:                   # @freduce_coefficients
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movq	$0, 80(%rdi)
	movq	(%rdi), %rdi
	callq	div_by_2_26
	movq	%rax, %rcx
	shlq	$26, %rcx
	subq	%rcx, (%rbx)
	addq	8(%rbx), %rax
	movq	%rax, 8(%rbx)
	movq	%rax, %rdi
	callq	div_by_2_25
	movq	%rax, %rcx
	shlq	$25, %rcx
	subq	%rcx, 8(%rbx)
	addq	16(%rbx), %rax
	movq	%rax, 16(%rbx)
	movq	%rax, %rdi
	callq	div_by_2_26
	movq	%rax, %rcx
	shlq	$26, %rcx
	subq	%rcx, 16(%rbx)
	addq	24(%rbx), %rax
	movq	%rax, 24(%rbx)
	movq	%rax, %rdi
	callq	div_by_2_25
	movq	%rax, %rcx
	shlq	$25, %rcx
	subq	%rcx, 24(%rbx)
	addq	32(%rbx), %rax
	movq	%rax, 32(%rbx)
	movq	%rax, %rdi
	callq	div_by_2_26
	movq	%rax, %rcx
	shlq	$26, %rcx
	subq	%rcx, 32(%rbx)
	addq	40(%rbx), %rax
	movq	%rax, 40(%rbx)
	movq	%rax, %rdi
	callq	div_by_2_25
	movq	%rax, %rcx
	shlq	$25, %rcx
	subq	%rcx, 40(%rbx)
	addq	48(%rbx), %rax
	movq	%rax, 48(%rbx)
	movq	%rax, %rdi
	callq	div_by_2_26
	movq	%rax, %rcx
	shlq	$26, %rcx
	subq	%rcx, 48(%rbx)
	addq	56(%rbx), %rax
	movq	%rax, 56(%rbx)
	movq	%rax, %rdi
	callq	div_by_2_25
	movq	%rax, %rcx
	shlq	$25, %rcx
	subq	%rcx, 56(%rbx)
	addq	64(%rbx), %rax
	movq	%rax, 64(%rbx)
	movq	%rax, %rdi
	callq	div_by_2_26
	movq	%rax, %rcx
	shlq	$26, %rcx
	subq	%rcx, 64(%rbx)
	addq	72(%rbx), %rax
	movq	%rax, 72(%rbx)
	movq	%rax, %rdi
	callq	div_by_2_25
	movq	%rax, %rcx
	shlq	$25, %rcx
	subq	%rcx, 72(%rbx)
	addq	80(%rbx), %rax
	movq	%rax, %rcx
	shlq	$4, %rcx
	addq	(%rbx), %rcx
	leaq	(%rcx,%rax,2), %rdi
	addq	%rax, %rdi
	movq	%rdi, (%rbx)
	movq	$0, 80(%rbx)
	callq	div_by_2_26
	movq	%rax, %rcx
	shlq	$26, %rcx
	subq	%rcx, (%rbx)
	addq	%rax, 8(%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end14:
	.size	freduce_coefficients, .Lfunc_end14-freduce_coefficients
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function div_by_2_26
	.type	div_by_2_26,@function
div_by_2_26:                            # @div_by_2_26
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, %rax
	sarq	$63, %rax
	shrl	$6, %eax
	addq	%rdi, %rax
	sarq	$26, %rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end15:
	.size	div_by_2_26, .Lfunc_end15-div_by_2_26
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function div_by_2_25
	.type	div_by_2_25,@function
div_by_2_25:                            # @div_by_2_25
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, %rax
	sarq	$63, %rax
	shrl	$7, %eax
	addq	%rdi, %rax
	sarq	$25, %rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end16:
	.size	div_by_2_25, .Lfunc_end16-div_by_2_25
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fsquare
	.type	fsquare,@function
fsquare:                                # @fsquare
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$160, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, %rbx
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	leaq	-176(%rbp), %r14
	movq	%r14, %rdi
	callq	fsquare_inner
	movq	%r14, %rdi
	callq	freduce_degree
	movq	%r14, %rdi
	callq	freduce_coefficients
	movaps	-112(%rbp), %xmm0
	movups	%xmm0, 64(%rbx)
	movaps	-176(%rbp), %xmm0
	movaps	-160(%rbp), %xmm1
	movaps	-144(%rbp), %xmm2
	movaps	-128(%rbp), %xmm3
	movups	%xmm3, 48(%rbx)
	movups	%xmm2, 32(%rbx)
	movups	%xmm1, 16(%rbx)
	movups	%xmm0, (%rbx)
	movq	%fs:40, %rax
	cmpq	-24(%rbp), %rax
	jne	.LBB17_2
# %bb.1:                                # %SP_return
	addq	$160, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB17_2:                               # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end17:
	.size	fsquare, .Lfunc_end17-fsquare
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fsquare_inner
	.type	fsquare_inner,@function
fsquare_inner:                          # @fsquare_inner
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movslq	(%rsi), %rax
	imulq	%rax, %rax
	movq	%rax, (%rdi)
	movslq	(%rsi), %rax
	movslq	8(%rsi), %rcx
	imulq	%rax, %rcx
	addq	%rcx, %rcx
	movq	%rcx, 8(%rdi)
	movslq	8(%rsi), %rax
	imulq	%rax, %rax
	movslq	(%rsi), %rcx
	movslq	16(%rsi), %rdx
	imulq	%rcx, %rdx
	addq	%rax, %rdx
	addq	%rdx, %rdx
	movq	%rdx, 16(%rdi)
	movslq	8(%rsi), %rax
	movslq	16(%rsi), %rcx
	imulq	%rax, %rcx
	movslq	(%rsi), %rax
	movslq	24(%rsi), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	addq	%rdx, %rdx
	movq	%rdx, 24(%rdi)
	movslq	16(%rsi), %rax
	imulq	%rax, %rax
	movslq	8(%rsi), %rcx
	movslq	24(%rsi), %rdx
	imulq	%rcx, %rdx
	leaq	(%rax,%rdx,4), %rax
	movslq	(%rsi), %rcx
	movslq	32(%rsi), %rdx
	imulq	%rcx, %rdx
	leaq	(%rax,%rdx,2), %rax
	movq	%rax, 32(%rdi)
	movslq	16(%rsi), %rax
	movslq	24(%rsi), %rcx
	imulq	%rax, %rcx
	movslq	8(%rsi), %rax
	movslq	32(%rsi), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movslq	(%rsi), %rax
	movslq	40(%rsi), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	addq	%rcx, %rcx
	movq	%rcx, 40(%rdi)
	movslq	24(%rsi), %rax
	imulq	%rax, %rax
	movslq	16(%rsi), %rcx
	movslq	32(%rsi), %rdx
	imulq	%rcx, %rdx
	addq	%rax, %rdx
	movslq	(%rsi), %rax
	movslq	48(%rsi), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movslq	8(%rsi), %rax
	movslq	40(%rsi), %rdx
	imulq	%rax, %rdx
	leaq	(%rcx,%rdx,2), %rax
	addq	%rax, %rax
	movq	%rax, 48(%rdi)
	movslq	24(%rsi), %rax
	movslq	32(%rsi), %rcx
	imulq	%rax, %rcx
	movslq	16(%rsi), %rax
	movslq	40(%rsi), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movslq	8(%rsi), %rax
	movslq	48(%rsi), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movslq	(%rsi), %rax
	movslq	56(%rsi), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	addq	%rdx, %rdx
	movq	%rdx, 56(%rdi)
	movslq	32(%rsi), %r9
	imulq	%r9, %r9
	movslq	16(%rsi), %rcx
	movslq	48(%rsi), %rdx
	imulq	%rcx, %rdx
	movslq	(%rsi), %r8
	movslq	64(%rsi), %rcx
	imulq	%r8, %rcx
	addq	%rdx, %rcx
	movslq	8(%rsi), %r8
	movslq	56(%rsi), %rdx
	imulq	%r8, %rdx
	movslq	24(%rsi), %r8
	movslq	40(%rsi), %rax
	imulq	%r8, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax,2), %rax
	leaq	(%r9,%rax,2), %rax
	movq	%rax, 64(%rdi)
	movslq	32(%rsi), %rax
	movslq	40(%rsi), %rcx
	imulq	%rax, %rcx
	movslq	24(%rsi), %rax
	movslq	48(%rsi), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movslq	16(%rsi), %rax
	movslq	56(%rsi), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movslq	8(%rsi), %rax
	movslq	64(%rsi), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movslq	(%rsi), %rax
	movslq	72(%rsi), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	addq	%rcx, %rcx
	movq	%rcx, 72(%rdi)
	movslq	40(%rsi), %rax
	imulq	%rax, %rax
	movslq	32(%rsi), %rcx
	movslq	48(%rsi), %rdx
	imulq	%rcx, %rdx
	addq	%rax, %rdx
	movslq	16(%rsi), %rax
	movslq	64(%rsi), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movslq	24(%rsi), %rax
	movslq	56(%rsi), %rdx
	imulq	%rax, %rdx
	movslq	8(%rsi), %r8
	movslq	72(%rsi), %rax
	imulq	%r8, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax,2), %rax
	addq	%rax, %rax
	movq	%rax, 80(%rdi)
	movslq	40(%rsi), %rax
	movslq	48(%rsi), %rcx
	imulq	%rax, %rcx
	movslq	32(%rsi), %rax
	movslq	56(%rsi), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movslq	24(%rsi), %rax
	movslq	64(%rsi), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	movslq	16(%rsi), %rax
	movslq	72(%rsi), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	addq	%rdx, %rdx
	movq	%rdx, 88(%rdi)
	movslq	48(%rsi), %r9
	imulq	%r9, %r9
	movslq	32(%rsi), %rcx
	movslq	64(%rsi), %rdx
	imulq	%rcx, %rdx
	movslq	40(%rsi), %r8
	movslq	56(%rsi), %rcx
	imulq	%r8, %rcx
	movslq	24(%rsi), %r8
	movslq	72(%rsi), %rax
	imulq	%r8, %rax
	addq	%rcx, %rax
	leaq	(%rdx,%rax,2), %rax
	leaq	(%r9,%rax,2), %rax
	movq	%rax, 96(%rdi)
	movslq	48(%rsi), %rax
	movslq	56(%rsi), %rcx
	imulq	%rax, %rcx
	movslq	40(%rsi), %rax
	movslq	64(%rsi), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	movslq	32(%rsi), %rax
	movslq	72(%rsi), %rcx
	imulq	%rax, %rcx
	addq	%rdx, %rcx
	addq	%rcx, %rcx
	movq	%rcx, 104(%rdi)
	movslq	56(%rsi), %rax
	imulq	%rax, %rax
	movslq	48(%rsi), %rcx
	movslq	64(%rsi), %rdx
	imulq	%rcx, %rdx
	addq	%rax, %rdx
	movslq	40(%rsi), %rax
	movslq	72(%rsi), %rcx
	imulq	%rax, %rcx
	leaq	(%rdx,%rcx,2), %rax
	addq	%rax, %rax
	movq	%rax, 112(%rdi)
	movslq	56(%rsi), %rax
	movslq	64(%rsi), %rcx
	imulq	%rax, %rcx
	movslq	48(%rsi), %rax
	movslq	72(%rsi), %rdx
	imulq	%rax, %rdx
	addq	%rcx, %rdx
	addq	%rdx, %rdx
	movq	%rdx, 120(%rdi)
	movslq	64(%rsi), %rax
	imulq	%rax, %rax
	movslq	56(%rsi), %rcx
	movslq	72(%rsi), %rdx
	imulq	%rcx, %rdx
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, 128(%rdi)
	movslq	64(%rsi), %rax
	movslq	72(%rsi), %rcx
	imulq	%rax, %rcx
	addq	%rcx, %rcx
	movq	%rcx, 136(%rdi)
	movslq	72(%rsi), %rax
	imulq	%rax, %rax
	addq	%rax, %rax
	movq	%rax, 144(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end18:
	.size	fsquare_inner, .Lfunc_end18-fsquare_inner
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function swap_conditional
	.type	swap_conditional,@function
swap_conditional:                       # @swap_conditional
	.cfi_startproc
# %bb.0:
	cmpq	$1, %rdx
	jne	.LBB19_2
# %bb.1:                                # %.loopexit
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movslq	(%rdi), %rax
	movq	(%rsi), %rcx
	movq	%rcx, (%rdi)
	movq	%rax, (%rsi)
	movslq	8(%rdi), %rax
	movq	8(%rsi), %rcx
	movq	%rcx, 8(%rdi)
	movq	%rax, 8(%rsi)
	movslq	16(%rdi), %rax
	movq	16(%rsi), %rcx
	movq	%rcx, 16(%rdi)
	movq	%rax, 16(%rsi)
	movslq	24(%rdi), %rax
	movq	24(%rsi), %rcx
	movq	%rcx, 24(%rdi)
	movq	%rax, 24(%rsi)
	movslq	32(%rdi), %rax
	movq	32(%rsi), %rcx
	movq	%rcx, 32(%rdi)
	movq	%rax, 32(%rsi)
	movslq	40(%rdi), %rax
	movq	40(%rsi), %rcx
	movq	%rcx, 40(%rdi)
	movq	%rax, 40(%rsi)
	movslq	48(%rdi), %rax
	movq	48(%rsi), %rcx
	movq	%rcx, 48(%rdi)
	movq	%rax, 48(%rsi)
	movslq	56(%rdi), %rax
	movq	56(%rsi), %rcx
	movq	%rcx, 56(%rdi)
	movq	%rax, 56(%rsi)
	movslq	64(%rdi), %rax
	movq	64(%rsi), %rcx
	movq	%rcx, 64(%rdi)
	movq	%rax, 64(%rsi)
	movslq	72(%rdi), %rax
	movq	72(%rsi), %rcx
	movq	%rcx, 72(%rdi)
	movq	%rax, 72(%rsi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
.LBB19_2:
	retq
.Lfunc_end19:
	.size	swap_conditional, .Lfunc_end19-swap_conditional
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fmonty
	.type	fmonty,@function
fmonty:                                 # @fmonty
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
	subq	$1336, %rsp             # imm = 0x538
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %r14
	movq	%r8, %r13
	movq	%rcx, -1352(%rbp)       # 8-byte Spill
	movq	%rdx, -1336(%rbp)       # 8-byte Spill
	movq	%rsi, -1368(%rbp)       # 8-byte Spill
	movq	%rdi, -1360(%rbp)       # 8-byte Spill
	movq	24(%rbp), %rbx
	movq	16(%rbp), %r15
	movq	%fs:40, %rax
	movq	%rax, -48(%rbp)
	movups	(%r8), %xmm0
	movups	16(%r8), %xmm1
	movups	32(%r8), %xmm2
	movups	48(%r8), %xmm3
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movups	64(%r8), %xmm0
	movaps	%xmm0, -64(%rbp)
	movq	%r8, %rdi
	movq	%r9, %rsi
	callq	fsum
	leaq	-128(%rbp), %rsi
	movq	%r14, %rdi
	movq	%r14, -1344(%rbp)       # 8-byte Spill
	callq	fdifference
	movups	64(%r15), %xmm0
	movaps	%xmm0, -144(%rbp)
	movups	(%r15), %xmm0
	movups	16(%r15), %xmm1
	movups	32(%r15), %xmm2
	movups	48(%r15), %xmm3
	movaps	%xmm3, -160(%rbp)
	movaps	%xmm2, -176(%rbp)
	movaps	%xmm1, -192(%rbp)
	movaps	%xmm0, -208(%rbp)
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	fsum
	leaq	-208(%rbp), %rsi
	movq	%rbx, %rdi
	callq	fdifference
	leaq	-848(%rbp), %r12
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%r14, %rdx
	callq	fproduct
	leaq	-1008(%rbp), %r15
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	fproduct
	movq	%r12, %rdi
	callq	freduce_degree
	movq	%r12, %rdi
	callq	freduce_coefficients
	movq	%r15, %rdi
	callq	freduce_degree
	movq	%r15, %rdi
	callq	freduce_coefficients
	movaps	-784(%rbp), %xmm0
	movaps	%xmm0, -144(%rbp)
	movaps	-848(%rbp), %xmm0
	movaps	-832(%rbp), %xmm1
	movaps	-816(%rbp), %xmm2
	movaps	-800(%rbp), %xmm3
	movaps	%xmm3, -160(%rbp)
	movaps	%xmm2, -176(%rbp)
	movaps	%xmm1, -192(%rbp)
	movaps	%xmm0, -208(%rbp)
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	fsum
	movq	%r15, %rdi
	leaq	-208(%rbp), %rsi
	callq	fdifference
	leaq	-1328(%rbp), %rdi
	movq	%r12, %rsi
	callq	fsquare
	leaq	-1168(%rbp), %rbx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	fsquare
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	32(%rbp), %rdx
	callq	fproduct
	movq	%r15, %rdi
	callq	freduce_degree
	movq	%r15, %rdi
	callq	freduce_coefficients
	movaps	-1264(%rbp), %xmm0
	movq	-1336(%rbp), %rax       # 8-byte Reload
	movups	%xmm0, 64(%rax)
	movaps	-1328(%rbp), %xmm0
	movaps	-1312(%rbp), %xmm1
	movaps	-1296(%rbp), %xmm2
	movaps	-1280(%rbp), %xmm3
	movups	%xmm3, 48(%rax)
	movups	%xmm2, 32(%rax)
	movups	%xmm1, 16(%rax)
	movups	%xmm0, (%rax)
	movaps	-944(%rbp), %xmm0
	movq	-1352(%rbp), %rax       # 8-byte Reload
	movups	%xmm0, 64(%rax)
	movaps	-1008(%rbp), %xmm0
	movaps	-992(%rbp), %xmm1
	movaps	-976(%rbp), %xmm2
	movaps	-960(%rbp), %xmm3
	movups	%xmm3, 48(%rax)
	movups	%xmm2, 32(%rax)
	movups	%xmm1, 16(%rax)
	movups	%xmm0, (%rax)
	leaq	-528(%rbp), %r14
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	fsquare
	leaq	-688(%rbp), %r15
	movq	%r15, %rdi
	movq	-1344(%rbp), %rsi       # 8-byte Reload
	callq	fsquare
	movq	-1360(%rbp), %rbx       # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	fproduct
	movq	%rbx, %rdi
	callq	freduce_degree
	movq	%rbx, %rdi
	callq	freduce_coefficients
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	fdifference
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -240(%rbp)
	movaps	%xmm0, -256(%rbp)
	movaps	%xmm0, -272(%rbp)
	movaps	%xmm0, -288(%rbp)
	movq	$0, -224(%rbp)
	leaq	-368(%rbp), %r12
	movl	$121665, %edx           # imm = 0x1DB41
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	fscalar_product
	movq	%r12, %rdi
	callq	freduce_coefficients
	movq	%r12, %rdi
	movq	%r14, %rsi
	callq	fsum
	movq	-1368(%rbp), %rbx       # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	callq	fproduct
	movq	%rbx, %rdi
	callq	freduce_degree
	movq	%rbx, %rdi
	callq	freduce_coefficients
	movq	%fs:40, %rax
	cmpq	-48(%rbp), %rax
	jne	.LBB20_2
# %bb.1:                                # %SP_return
	addq	$1336, %rsp             # imm = 0x538
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB20_2:                               # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end20:
	.size	fmonty, .Lfunc_end20-fmonty
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fsum
	.type	fsum,@function
fsum:                                   # @fsum
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	(%rsi), %rax
	addq	%rax, (%rdi)
	movq	8(%rsi), %rax
	addq	%rax, 8(%rdi)
	movq	16(%rsi), %rax
	addq	%rax, 16(%rdi)
	movq	24(%rsi), %rax
	addq	%rax, 24(%rdi)
	movq	32(%rsi), %rax
	addq	%rax, 32(%rdi)
	movq	40(%rsi), %rax
	addq	%rax, 40(%rdi)
	movq	48(%rsi), %rax
	addq	%rax, 48(%rdi)
	movq	56(%rsi), %rax
	addq	%rax, 56(%rdi)
	movq	64(%rsi), %rax
	addq	%rax, 64(%rdi)
	movq	72(%rsi), %rax
	addq	%rax, 72(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end21:
	.size	fsum, .Lfunc_end21-fsum
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fdifference
	.type	fdifference,@function
fdifference:                            # @fdifference
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	(%rsi), %rax
	subq	(%rdi), %rax
	movq	%rax, (%rdi)
	movq	8(%rsi), %rax
	subq	8(%rdi), %rax
	movq	%rax, 8(%rdi)
	movq	16(%rsi), %rax
	subq	16(%rdi), %rax
	movq	%rax, 16(%rdi)
	movq	24(%rsi), %rax
	subq	24(%rdi), %rax
	movq	%rax, 24(%rdi)
	movq	32(%rsi), %rax
	subq	32(%rdi), %rax
	movq	%rax, 32(%rdi)
	movq	40(%rsi), %rax
	subq	40(%rdi), %rax
	movq	%rax, 40(%rdi)
	movq	48(%rsi), %rax
	subq	48(%rdi), %rax
	movq	%rax, 48(%rdi)
	movq	56(%rsi), %rax
	subq	56(%rdi), %rax
	movq	%rax, 56(%rdi)
	movq	64(%rsi), %rax
	subq	64(%rdi), %rax
	movq	%rax, 64(%rdi)
	movq	72(%rsi), %rax
	subq	72(%rdi), %rax
	movq	%rax, 72(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end22:
	.size	fdifference, .Lfunc_end22-fdifference
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function fscalar_product
	.type	fscalar_product,@function
fscalar_product:                        # @fscalar_product
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	(%rsi), %rax
	imulq	%rdx, %rax
	movq	%rax, (%rdi)
	movq	8(%rsi), %rax
	imulq	%rdx, %rax
	movq	%rax, 8(%rdi)
	movq	16(%rsi), %rax
	imulq	%rdx, %rax
	movq	%rax, 16(%rdi)
	movq	24(%rsi), %rax
	imulq	%rdx, %rax
	movq	%rax, 24(%rdi)
	movq	32(%rsi), %rax
	imulq	%rdx, %rax
	movq	%rax, 32(%rdi)
	movq	40(%rsi), %rax
	imulq	%rdx, %rax
	movq	%rax, 40(%rdi)
	movq	48(%rsi), %rax
	imulq	%rdx, %rax
	movq	%rax, 48(%rdi)
	movq	56(%rsi), %rax
	imulq	%rdx, %rax
	movq	%rax, 56(%rdi)
	movq	64(%rsi), %rax
	imulq	%rdx, %rax
	movq	%rax, 64(%rdi)
	imulq	72(%rsi), %rdx
	movq	%rdx, 72(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end23:
	.size	fscalar_product, .Lfunc_end23-fscalar_product
	.cfi_endproc
                                        # -- End function
	.globl	randombytes             # -- Begin function randombytes
	.p2align	4, 0x90
	.type	randombytes,@function
randombytes:                            # @randombytes
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	testq	%rsi, %rsi
	js	.LBB24_30
# %bb.1:
	movq	%rsi, %rbx
	movq	%rdi, %r14
	cmpl	$-1, randombytes.fd(%rip)
	jne	.LBB24_4
	jmp	.LBB24_2
	.p2align	4, 0x90
.LBB24_3:                               # %.lr.ph7
                                        #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.23:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.24:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.25:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.26:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.27:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.28:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB24_4
# %bb.29:                               #   in Loop: Header=BB24_2 Depth=1
	movl	$1, %edi
	callq	sleep
.LBB24_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	je	.LBB24_3
.LBB24_4:                               # %.loopexit
	testq	%rbx, %rbx
	setg	%r15b
	jle	.LBB24_9
.LBB24_5:                               # =>This Inner Loop Header: Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.6:                                #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %r15b
	je	.LBB24_9
# %bb.7:                                #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.10:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %r15b
	je	.LBB24_9
# %bb.11:                               #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.12:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %r15b
	je	.LBB24_9
# %bb.13:                               #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.14:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %r15b
	je	.LBB24_9
# %bb.15:                               #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.16:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %r15b
	je	.LBB24_9
# %bb.17:                               #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.18:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %r15b
	je	.LBB24_9
# %bb.19:                               #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.20:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %r15b
	je	.LBB24_9
# %bb.21:                               #   in Loop: Header=BB24_5 Depth=1
	cmpq	$1048577, %rbx          # imm = 0x100001
	movl	$1048576, %edx          # imm = 0x100000
	cmovlq	%rbx, %rdx
	movl	randombytes.fd(%rip), %edi
	movq	%r14, %rsi
	callq	read
	testq	%rax, %rax
	jg	.LBB24_8
# %bb.22:                               #   in Loop: Header=BB24_5 Depth=1
	movl	$1, %edi
	callq	sleep
	testb	$1, %r15b
	jne	.LBB24_5
	jmp	.LBB24_9
	.p2align	4, 0x90
.LBB24_8:                               # %.outer
                                        #   in Loop: Header=BB24_5 Depth=1
	addq	%rax, %r14
	movq	%rbx, %rcx
	subq	%rax, %rcx
	testq	%rcx, %rcx
	setg	%r15b
	subq	%rax, %rbx
	jg	.LBB24_5
.LBB24_9:                               # %.outer._crit_edge
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB24_30:
	.cfi_def_cfa %rbp, 16
	movl	$.L.str.9, %edi
	movl	$.L.str.1, %esi
	movl	$.L__PRETTY_FUNCTION__.randombytes, %ecx
	movl	$14, %edx
	callq	__assert_fail
.Lfunc_end24:
	.size	randombytes, .Lfunc_end24-randombytes
	.cfi_endproc
                                        # -- End function
	.globl	randombit               # -- Begin function randombit
	.p2align	4, 0x90
	.type	randombit,@function
randombit:                              # @randombit
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	movb	$0, -9(%rbp)
	leaq	-9(%rbp), %rdi
	movl	$1, %esi
	callq	randombytes
	movb	-9(%rbp), %al
	movq	%fs:40, %rcx
	cmpq	-8(%rbp), %rcx
	jne	.LBB25_2
# %bb.1:                                # %SP_return
	andb	$1, %al
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB25_2:                               # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end25:
	.size	randombit, .Lfunc_end25-randombit
	.cfi_endproc
                                        # -- End function
	.type	.L__const.main.input_data,@object # @__const.main.input_data
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	4
.L__const.main.input_data:
	.ascii	"\221E\356\f\212\272\023\305\256\353\244\334\274?\3440X{\1775\253\t\226\246AI\027\364\322qj\326"
	.size	.L__const.main.input_data, 32

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d\n"
	.size	.L.str, 4

	.type	chunk_size,@object      # @chunk_size
	.section	.rodata,"a",@progbits
	.globl	chunk_size
	.p2align	3
chunk_size:
	.quad	32                      # 0x20
	.size	chunk_size, 8

	.type	number_measurements,@object # @number_measurements
	.globl	number_measurements
	.p2align	3
number_measurements:
	.quad	1                       # 0x1
	.size	number_measurements, 8

	.type	.L__const.do_one_computation.secret,@object # @__const.do_one_computation.secret
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	4
.L__const.do_one_computation.secret:
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	3                       # 0x3
	.zero	29
	.size	.L__const.do_one_computation.secret, 32

	.type	.L__const.do_one_computation.basepoint,@object # @__const.do_one_computation.basepoint
	.p2align	4
.L__const.do_one_computation.basepoint:
	.byte	9                       # 0x9
	.zero	31
	.size	.L__const.do_one_computation.basepoint, 32

	.type	.L.str.9,@object        # @.str.9
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.9:
	.asciz	"xlen >= 0"
	.size	.L.str.9, 10

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"dudect-examples/donnabad/sources/random.c"
	.size	.L.str.1, 42

	.type	.L__PRETTY_FUNCTION__.randombytes,@object # @__PRETTY_FUNCTION__.randombytes
.L__PRETTY_FUNCTION__.randombytes:
	.asciz	"void randombytes(uint8_t *, size_t)"
	.size	.L__PRETTY_FUNCTION__.randombytes, 36

	.type	randombytes.fd,@object  # @randombytes.fd
	.data
	.p2align	2
randombytes.fd:
	.long	4294967295              # 0xffffffff
	.size	randombytes.fd, 4

	.type	.L.str.2,@object        # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"/dev/urandom"
	.size	.L.str.2, 13

	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits

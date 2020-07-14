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
	callq	init_dut
	movaps	.L__const.main.input_data(%rip), %xmm0
	movaps	%xmm0, -32(%rbp)
	leaq	-32(%rbp), %rdi
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
	pushq	%rbx
	subq	$264, %rsp              # imm = 0x108
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movq	%fs:40, %rax
	movq	%rax, -16(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -272(%rbp)
	movaps	%xmm0, -256(%rbp)
	movaps	%xmm0, -240(%rbp)
	movaps	%xmm0, -224(%rbp)
	movaps	%xmm0, -208(%rbp)
	movaps	%xmm0, -192(%rbp)
	movaps	%xmm0, -176(%rbp)
	movaps	%xmm0, -160(%rbp)
	movaps	%xmm0, -144(%rbp)
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm0, -112(%rbp)
	movaps	%xmm0, -96(%rbp)
	movaps	%xmm0, -80(%rbp)
	movaps	%xmm0, -64(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	%xmm0, -32(%rbp)
	movl	$10, -272(%rbp)
	leaq	-272(%rbp), %rsi
	callq	br_md5_round
	movl	$ctx, %edi
	movl	$32, %edx
	movq	%rbx, %rsi
	callq	br_md5_update
	movb	(%rbx), %al
	movq	%fs:40, %rcx
	cmpq	-16(%rbp), %rcx
	jne	.LBB1_2
# %bb.1:                                # %SP_return
	addq	$264, %rsp              # imm = 0x108
	popq	%rbx
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
	movl	$ctx, %edi
	callq	br_md5_init
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	init_dut, .Lfunc_end2-init_dut
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4               # -- Begin function prepare_inputs
.LCPI3_0:
	.zero	16
	.text
	.globl	prepare_inputs
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
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1600000, %esi          # imm = 0x186A00
	callq	randombytes
	xorl	%r12d, %r12d
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_2501:                             #   in Loop: Header=BB3_1 Depth=1
	addq	$1250, %r12             # imm = 0x4E2
	cmpq	$100000, %r12           # imm = 0x186A0
	je	.LBB3_2502
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	callq	randombit
	movb	%al, (%r15,%r12)
	testb	%al, %al
	jne	.LBB3_3
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movq	%r12, %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_3:                                #   in Loop: Header=BB3_1 Depth=1
	movq	%r12, %rbx
	orq	$1, %rbx
	callq	randombit
	movb	%al, (%r15,%rbx)
	testb	%al, %al
	jne	.LBB3_5
# %bb.4:                                #   in Loop: Header=BB3_1 Depth=1
	shlq	$4, %rbx
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rbx)
.LBB3_5:                                #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 2(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_7
# %bb.6:                                #   in Loop: Header=BB3_1 Depth=1
	leaq	2(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_7:                                #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 3(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_9
# %bb.8:                                #   in Loop: Header=BB3_1 Depth=1
	leaq	3(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_9:                                #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 4(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_11
# %bb.10:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	4(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_11:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 5(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_13
# %bb.12:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	5(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_13:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 6(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_15
# %bb.14:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	6(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_15:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 7(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_17
# %bb.16:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	7(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_17:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 8(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_19
# %bb.18:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	8(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_19:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 9(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_21
# %bb.20:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	9(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_21:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 10(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_23
# %bb.22:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	10(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_23:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 11(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_25
# %bb.24:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	11(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_25:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 12(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_27
# %bb.26:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	12(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_27:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 13(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_29
# %bb.28:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	13(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_29:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 14(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_31
# %bb.30:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	14(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_31:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 15(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_33
# %bb.32:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	15(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_33:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 16(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_35
# %bb.34:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	16(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_35:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 17(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_37
# %bb.36:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	17(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_37:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 18(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_39
# %bb.38:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	18(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_39:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 19(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_41
# %bb.40:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	19(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_41:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 20(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_43
# %bb.42:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	20(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_43:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 21(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_45
# %bb.44:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	21(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_45:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 22(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_47
# %bb.46:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	22(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_47:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 23(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_49
# %bb.48:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	23(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_49:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 24(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_51
# %bb.50:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	24(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_51:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 25(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_53
# %bb.52:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	25(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_53:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 26(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_55
# %bb.54:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	26(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_55:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 27(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_57
# %bb.56:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	27(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_57:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 28(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_59
# %bb.58:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	28(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_59:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 29(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_61
# %bb.60:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	29(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_61:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 30(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_63
# %bb.62:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	30(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_63:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 31(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_65
# %bb.64:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	31(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_65:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 32(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_67
# %bb.66:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	32(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_67:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 33(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_69
# %bb.68:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	33(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_69:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 34(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_71
# %bb.70:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	34(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_71:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 35(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_73
# %bb.72:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	35(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_73:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 36(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_75
# %bb.74:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	36(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_75:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 37(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_77
# %bb.76:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	37(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_77:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 38(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_79
# %bb.78:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	38(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_79:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 39(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_81
# %bb.80:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	39(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_81:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 40(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_83
# %bb.82:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	40(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_83:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 41(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_85
# %bb.84:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	41(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_85:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 42(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_87
# %bb.86:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	42(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_87:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 43(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_89
# %bb.88:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	43(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_89:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 44(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_91
# %bb.90:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	44(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_91:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 45(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_93
# %bb.92:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	45(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_93:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 46(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_95
# %bb.94:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	46(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_95:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 47(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_97
# %bb.96:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	47(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_97:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 48(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_99
# %bb.98:                               #   in Loop: Header=BB3_1 Depth=1
	leaq	48(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_99:                               #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 49(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_101
# %bb.100:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	49(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_101:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 50(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_103
# %bb.102:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	50(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_103:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 51(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_105
# %bb.104:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	51(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_105:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 52(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_107
# %bb.106:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	52(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_107:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 53(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_109
# %bb.108:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	53(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_109:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 54(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_111
# %bb.110:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	54(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_111:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 55(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_113
# %bb.112:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	55(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_113:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 56(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_115
# %bb.114:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	56(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_115:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 57(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_117
# %bb.116:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	57(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_117:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 58(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_119
# %bb.118:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	58(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_119:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 59(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_121
# %bb.120:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	59(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_121:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 60(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_123
# %bb.122:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	60(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_123:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 61(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_125
# %bb.124:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	61(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_125:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 62(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_127
# %bb.126:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	62(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_127:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 63(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_129
# %bb.128:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	63(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_129:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 64(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_131
# %bb.130:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	64(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_131:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 65(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_133
# %bb.132:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	65(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_133:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 66(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_135
# %bb.134:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	66(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_135:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 67(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_137
# %bb.136:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	67(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_137:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 68(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_139
# %bb.138:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	68(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_139:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 69(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_141
# %bb.140:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	69(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_141:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 70(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_143
# %bb.142:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	70(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_143:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 71(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_145
# %bb.144:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	71(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_145:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 72(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_147
# %bb.146:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	72(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_147:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 73(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_149
# %bb.148:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	73(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_149:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 74(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_151
# %bb.150:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	74(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_151:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 75(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_153
# %bb.152:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	75(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_153:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 76(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_155
# %bb.154:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	76(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_155:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 77(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_157
# %bb.156:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	77(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_157:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 78(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_159
# %bb.158:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	78(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_159:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 79(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_161
# %bb.160:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	79(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_161:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 80(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_163
# %bb.162:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	80(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_163:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 81(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_165
# %bb.164:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	81(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_165:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 82(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_167
# %bb.166:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	82(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_167:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 83(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_169
# %bb.168:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	83(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_169:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 84(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_171
# %bb.170:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	84(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_171:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 85(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_173
# %bb.172:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	85(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_173:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 86(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_175
# %bb.174:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	86(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_175:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 87(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_177
# %bb.176:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	87(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_177:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 88(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_179
# %bb.178:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	88(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_179:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 89(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_181
# %bb.180:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	89(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_181:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 90(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_183
# %bb.182:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	90(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_183:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 91(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_185
# %bb.184:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	91(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_185:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 92(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_187
# %bb.186:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	92(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_187:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 93(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_189
# %bb.188:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	93(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_189:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 94(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_191
# %bb.190:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	94(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_191:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 95(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_193
# %bb.192:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	95(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_193:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 96(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_195
# %bb.194:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	96(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_195:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 97(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_197
# %bb.196:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	97(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_197:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 98(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_199
# %bb.198:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	98(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_199:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 99(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_201
# %bb.200:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	99(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_201:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 100(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_203
# %bb.202:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	100(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_203:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 101(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_205
# %bb.204:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	101(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_205:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 102(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_207
# %bb.206:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	102(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_207:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 103(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_209
# %bb.208:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	103(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_209:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 104(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_211
# %bb.210:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	104(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_211:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 105(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_213
# %bb.212:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	105(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_213:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 106(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_215
# %bb.214:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	106(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_215:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 107(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_217
# %bb.216:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	107(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_217:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 108(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_219
# %bb.218:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	108(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_219:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 109(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_221
# %bb.220:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	109(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_221:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 110(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_223
# %bb.222:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	110(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_223:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 111(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_225
# %bb.224:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	111(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_225:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 112(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_227
# %bb.226:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	112(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_227:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 113(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_229
# %bb.228:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	113(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_229:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 114(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_231
# %bb.230:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	114(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_231:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 115(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_233
# %bb.232:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	115(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_233:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 116(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_235
# %bb.234:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	116(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_235:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 117(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_237
# %bb.236:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	117(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_237:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 118(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_239
# %bb.238:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	118(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_239:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 119(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_241
# %bb.240:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	119(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_241:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 120(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_243
# %bb.242:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	120(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_243:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 121(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_245
# %bb.244:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	121(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_245:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 122(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_247
# %bb.246:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	122(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_247:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 123(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_249
# %bb.248:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	123(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_249:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 124(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_251
# %bb.250:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	124(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_251:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 125(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_253
# %bb.252:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	125(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_253:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 126(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_255
# %bb.254:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	126(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_255:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 127(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_257
# %bb.256:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	127(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_257:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 128(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_259
# %bb.258:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	128(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_259:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 129(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_261
# %bb.260:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	129(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_261:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 130(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_263
# %bb.262:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	130(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_263:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 131(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_265
# %bb.264:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	131(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_265:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 132(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_267
# %bb.266:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	132(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_267:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 133(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_269
# %bb.268:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	133(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_269:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 134(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_271
# %bb.270:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	134(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_271:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 135(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_273
# %bb.272:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	135(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_273:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 136(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_275
# %bb.274:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	136(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_275:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 137(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_277
# %bb.276:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	137(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_277:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 138(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_279
# %bb.278:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	138(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_279:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 139(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_281
# %bb.280:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	139(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_281:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 140(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_283
# %bb.282:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	140(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_283:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 141(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_285
# %bb.284:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	141(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_285:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 142(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_287
# %bb.286:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	142(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_287:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 143(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_289
# %bb.288:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	143(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_289:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 144(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_291
# %bb.290:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	144(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_291:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 145(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_293
# %bb.292:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	145(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_293:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 146(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_295
# %bb.294:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	146(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_295:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 147(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_297
# %bb.296:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	147(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_297:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 148(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_299
# %bb.298:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	148(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_299:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 149(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_301
# %bb.300:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	149(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_301:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 150(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_303
# %bb.302:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	150(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_303:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 151(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_305
# %bb.304:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	151(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_305:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 152(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_307
# %bb.306:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	152(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_307:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 153(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_309
# %bb.308:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	153(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_309:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 154(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_311
# %bb.310:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	154(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_311:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 155(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_313
# %bb.312:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	155(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_313:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 156(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_315
# %bb.314:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	156(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_315:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 157(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_317
# %bb.316:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	157(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_317:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 158(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_319
# %bb.318:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	158(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_319:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 159(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_321
# %bb.320:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	159(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_321:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 160(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_323
# %bb.322:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	160(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_323:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 161(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_325
# %bb.324:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	161(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_325:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 162(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_327
# %bb.326:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	162(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_327:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 163(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_329
# %bb.328:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	163(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_329:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 164(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_331
# %bb.330:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	164(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_331:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 165(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_333
# %bb.332:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	165(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_333:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 166(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_335
# %bb.334:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	166(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_335:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 167(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_337
# %bb.336:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	167(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_337:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 168(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_339
# %bb.338:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	168(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_339:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 169(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_341
# %bb.340:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	169(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_341:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 170(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_343
# %bb.342:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	170(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_343:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 171(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_345
# %bb.344:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	171(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_345:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 172(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_347
# %bb.346:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	172(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_347:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 173(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_349
# %bb.348:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	173(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_349:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 174(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_351
# %bb.350:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	174(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_351:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 175(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_353
# %bb.352:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	175(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_353:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 176(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_355
# %bb.354:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	176(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_355:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 177(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_357
# %bb.356:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	177(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_357:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 178(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_359
# %bb.358:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	178(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_359:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 179(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_361
# %bb.360:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	179(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_361:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 180(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_363
# %bb.362:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	180(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_363:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 181(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_365
# %bb.364:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	181(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_365:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 182(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_367
# %bb.366:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	182(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_367:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 183(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_369
# %bb.368:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	183(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_369:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 184(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_371
# %bb.370:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	184(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_371:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 185(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_373
# %bb.372:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	185(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_373:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 186(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_375
# %bb.374:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	186(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_375:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 187(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_377
# %bb.376:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	187(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_377:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 188(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_379
# %bb.378:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	188(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_379:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 189(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_381
# %bb.380:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	189(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_381:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 190(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_383
# %bb.382:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	190(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_383:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 191(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_385
# %bb.384:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	191(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_385:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 192(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_387
# %bb.386:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	192(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_387:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 193(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_389
# %bb.388:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	193(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_389:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 194(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_391
# %bb.390:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	194(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_391:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 195(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_393
# %bb.392:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	195(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_393:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 196(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_395
# %bb.394:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	196(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_395:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 197(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_397
# %bb.396:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	197(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_397:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 198(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_399
# %bb.398:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	198(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_399:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 199(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_401
# %bb.400:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	199(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_401:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 200(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_403
# %bb.402:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	200(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_403:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 201(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_405
# %bb.404:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	201(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_405:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 202(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_407
# %bb.406:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	202(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_407:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 203(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_409
# %bb.408:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	203(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_409:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 204(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_411
# %bb.410:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	204(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_411:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 205(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_413
# %bb.412:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	205(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_413:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 206(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_415
# %bb.414:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	206(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_415:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 207(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_417
# %bb.416:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	207(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_417:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 208(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_419
# %bb.418:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	208(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_419:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 209(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_421
# %bb.420:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	209(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_421:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 210(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_423
# %bb.422:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	210(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_423:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 211(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_425
# %bb.424:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	211(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_425:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 212(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_427
# %bb.426:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	212(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_427:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 213(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_429
# %bb.428:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	213(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_429:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 214(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_431
# %bb.430:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	214(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_431:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 215(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_433
# %bb.432:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	215(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_433:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 216(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_435
# %bb.434:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	216(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_435:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 217(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_437
# %bb.436:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	217(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_437:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 218(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_439
# %bb.438:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	218(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_439:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 219(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_441
# %bb.440:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	219(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_441:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 220(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_443
# %bb.442:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	220(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_443:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 221(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_445
# %bb.444:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	221(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_445:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 222(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_447
# %bb.446:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	222(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_447:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 223(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_449
# %bb.448:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	223(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_449:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 224(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_451
# %bb.450:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	224(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_451:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 225(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_453
# %bb.452:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	225(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_453:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 226(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_455
# %bb.454:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	226(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_455:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 227(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_457
# %bb.456:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	227(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_457:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 228(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_459
# %bb.458:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	228(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_459:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 229(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_461
# %bb.460:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	229(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_461:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 230(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_463
# %bb.462:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	230(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_463:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 231(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_465
# %bb.464:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	231(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_465:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 232(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_467
# %bb.466:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	232(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_467:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 233(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_469
# %bb.468:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	233(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_469:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 234(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_471
# %bb.470:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	234(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_471:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 235(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_473
# %bb.472:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	235(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_473:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 236(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_475
# %bb.474:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	236(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_475:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 237(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_477
# %bb.476:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	237(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_477:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 238(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_479
# %bb.478:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	238(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_479:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 239(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_481
# %bb.480:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	239(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_481:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 240(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_483
# %bb.482:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	240(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_483:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 241(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_485
# %bb.484:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	241(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_485:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 242(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_487
# %bb.486:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	242(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_487:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 243(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_489
# %bb.488:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	243(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_489:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 244(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_491
# %bb.490:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	244(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_491:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 245(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_493
# %bb.492:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	245(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_493:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 246(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_495
# %bb.494:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	246(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_495:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 247(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_497
# %bb.496:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	247(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_497:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 248(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_499
# %bb.498:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	248(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_499:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 249(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_501
# %bb.500:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	249(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_501:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 250(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_503
# %bb.502:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	250(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_503:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 251(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_505
# %bb.504:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	251(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_505:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 252(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_507
# %bb.506:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	252(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_507:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 253(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_509
# %bb.508:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	253(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_509:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 254(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_511
# %bb.510:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	254(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_511:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 255(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_513
# %bb.512:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	255(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_513:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 256(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_515
# %bb.514:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	256(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_515:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 257(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_517
# %bb.516:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	257(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_517:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 258(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_519
# %bb.518:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	258(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_519:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 259(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_521
# %bb.520:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	259(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_521:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 260(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_523
# %bb.522:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	260(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_523:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 261(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_525
# %bb.524:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	261(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_525:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 262(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_527
# %bb.526:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	262(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_527:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 263(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_529
# %bb.528:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	263(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_529:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 264(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_531
# %bb.530:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	264(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_531:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 265(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_533
# %bb.532:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	265(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_533:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 266(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_535
# %bb.534:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	266(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_535:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 267(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_537
# %bb.536:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	267(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_537:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 268(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_539
# %bb.538:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	268(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_539:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 269(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_541
# %bb.540:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	269(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_541:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 270(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_543
# %bb.542:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	270(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_543:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 271(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_545
# %bb.544:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	271(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_545:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 272(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_547
# %bb.546:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	272(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_547:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 273(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_549
# %bb.548:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	273(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_549:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 274(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_551
# %bb.550:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	274(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_551:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 275(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_553
# %bb.552:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	275(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_553:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 276(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_555
# %bb.554:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	276(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_555:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 277(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_557
# %bb.556:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	277(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_557:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 278(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_559
# %bb.558:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	278(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_559:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 279(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_561
# %bb.560:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	279(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_561:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 280(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_563
# %bb.562:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	280(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_563:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 281(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_565
# %bb.564:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	281(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_565:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 282(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_567
# %bb.566:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	282(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_567:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 283(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_569
# %bb.568:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	283(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_569:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 284(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_571
# %bb.570:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	284(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_571:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 285(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_573
# %bb.572:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	285(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_573:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 286(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_575
# %bb.574:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	286(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_575:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 287(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_577
# %bb.576:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	287(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_577:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 288(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_579
# %bb.578:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	288(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_579:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 289(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_581
# %bb.580:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	289(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_581:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 290(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_583
# %bb.582:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	290(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_583:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 291(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_585
# %bb.584:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	291(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_585:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 292(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_587
# %bb.586:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	292(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_587:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 293(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_589
# %bb.588:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	293(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_589:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 294(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_591
# %bb.590:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	294(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_591:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 295(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_593
# %bb.592:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	295(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_593:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 296(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_595
# %bb.594:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	296(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_595:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 297(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_597
# %bb.596:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	297(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_597:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 298(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_599
# %bb.598:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	298(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_599:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 299(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_601
# %bb.600:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	299(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_601:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 300(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_603
# %bb.602:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	300(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_603:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 301(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_605
# %bb.604:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	301(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_605:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 302(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_607
# %bb.606:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	302(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_607:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 303(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_609
# %bb.608:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	303(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_609:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 304(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_611
# %bb.610:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	304(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_611:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 305(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_613
# %bb.612:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	305(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_613:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 306(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_615
# %bb.614:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	306(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_615:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 307(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_617
# %bb.616:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	307(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_617:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 308(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_619
# %bb.618:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	308(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_619:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 309(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_621
# %bb.620:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	309(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_621:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 310(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_623
# %bb.622:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	310(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_623:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 311(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_625
# %bb.624:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	311(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_625:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 312(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_627
# %bb.626:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	312(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_627:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 313(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_629
# %bb.628:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	313(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_629:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 314(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_631
# %bb.630:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	314(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_631:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 315(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_633
# %bb.632:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	315(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_633:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 316(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_635
# %bb.634:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	316(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_635:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 317(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_637
# %bb.636:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	317(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_637:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 318(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_639
# %bb.638:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	318(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_639:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 319(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_641
# %bb.640:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	319(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_641:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 320(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_643
# %bb.642:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	320(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_643:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 321(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_645
# %bb.644:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	321(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_645:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 322(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_647
# %bb.646:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	322(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_647:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 323(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_649
# %bb.648:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	323(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_649:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 324(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_651
# %bb.650:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	324(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_651:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 325(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_653
# %bb.652:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	325(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_653:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 326(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_655
# %bb.654:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	326(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_655:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 327(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_657
# %bb.656:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	327(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_657:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 328(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_659
# %bb.658:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	328(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_659:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 329(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_661
# %bb.660:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	329(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_661:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 330(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_663
# %bb.662:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	330(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_663:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 331(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_665
# %bb.664:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	331(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_665:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 332(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_667
# %bb.666:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	332(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_667:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 333(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_669
# %bb.668:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	333(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_669:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 334(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_671
# %bb.670:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	334(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_671:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 335(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_673
# %bb.672:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	335(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_673:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 336(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_675
# %bb.674:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	336(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_675:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 337(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_677
# %bb.676:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	337(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_677:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 338(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_679
# %bb.678:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	338(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_679:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 339(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_681
# %bb.680:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	339(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_681:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 340(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_683
# %bb.682:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	340(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_683:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 341(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_685
# %bb.684:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	341(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_685:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 342(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_687
# %bb.686:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	342(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_687:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 343(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_689
# %bb.688:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	343(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_689:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 344(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_691
# %bb.690:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	344(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_691:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 345(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_693
# %bb.692:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	345(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_693:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 346(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_695
# %bb.694:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	346(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_695:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 347(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_697
# %bb.696:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	347(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_697:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 348(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_699
# %bb.698:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	348(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_699:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 349(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_701
# %bb.700:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	349(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_701:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 350(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_703
# %bb.702:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	350(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_703:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 351(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_705
# %bb.704:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	351(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_705:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 352(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_707
# %bb.706:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	352(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_707:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 353(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_709
# %bb.708:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	353(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_709:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 354(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_711
# %bb.710:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	354(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_711:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 355(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_713
# %bb.712:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	355(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_713:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 356(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_715
# %bb.714:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	356(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_715:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 357(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_717
# %bb.716:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	357(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_717:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 358(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_719
# %bb.718:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	358(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_719:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 359(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_721
# %bb.720:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	359(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_721:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 360(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_723
# %bb.722:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	360(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_723:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 361(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_725
# %bb.724:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	361(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_725:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 362(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_727
# %bb.726:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	362(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_727:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 363(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_729
# %bb.728:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	363(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_729:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 364(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_731
# %bb.730:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	364(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_731:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 365(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_733
# %bb.732:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	365(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_733:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 366(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_735
# %bb.734:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	366(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_735:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 367(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_737
# %bb.736:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	367(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_737:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 368(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_739
# %bb.738:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	368(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_739:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 369(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_741
# %bb.740:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	369(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_741:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 370(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_743
# %bb.742:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	370(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_743:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 371(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_745
# %bb.744:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	371(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_745:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 372(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_747
# %bb.746:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	372(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_747:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 373(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_749
# %bb.748:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	373(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_749:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 374(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_751
# %bb.750:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	374(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_751:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 375(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_753
# %bb.752:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	375(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_753:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 376(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_755
# %bb.754:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	376(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_755:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 377(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_757
# %bb.756:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	377(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_757:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 378(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_759
# %bb.758:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	378(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_759:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 379(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_761
# %bb.760:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	379(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_761:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 380(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_763
# %bb.762:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	380(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_763:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 381(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_765
# %bb.764:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	381(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_765:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 382(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_767
# %bb.766:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	382(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_767:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 383(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_769
# %bb.768:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	383(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_769:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 384(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_771
# %bb.770:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	384(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_771:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 385(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_773
# %bb.772:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	385(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_773:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 386(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_775
# %bb.774:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	386(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_775:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 387(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_777
# %bb.776:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	387(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_777:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 388(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_779
# %bb.778:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	388(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_779:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 389(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_781
# %bb.780:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	389(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_781:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 390(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_783
# %bb.782:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	390(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_783:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 391(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_785
# %bb.784:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	391(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_785:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 392(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_787
# %bb.786:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	392(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_787:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 393(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_789
# %bb.788:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	393(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_789:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 394(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_791
# %bb.790:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	394(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_791:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 395(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_793
# %bb.792:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	395(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_793:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 396(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_795
# %bb.794:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	396(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_795:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 397(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_797
# %bb.796:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	397(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_797:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 398(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_799
# %bb.798:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	398(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_799:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 399(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_801
# %bb.800:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	399(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_801:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 400(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_803
# %bb.802:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	400(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_803:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 401(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_805
# %bb.804:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	401(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_805:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 402(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_807
# %bb.806:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	402(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_807:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 403(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_809
# %bb.808:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	403(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_809:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 404(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_811
# %bb.810:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	404(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_811:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 405(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_813
# %bb.812:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	405(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_813:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 406(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_815
# %bb.814:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	406(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_815:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 407(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_817
# %bb.816:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	407(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_817:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 408(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_819
# %bb.818:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	408(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_819:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 409(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_821
# %bb.820:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	409(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_821:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 410(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_823
# %bb.822:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	410(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_823:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 411(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_825
# %bb.824:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	411(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_825:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 412(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_827
# %bb.826:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	412(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_827:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 413(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_829
# %bb.828:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	413(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_829:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 414(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_831
# %bb.830:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	414(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_831:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 415(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_833
# %bb.832:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	415(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_833:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 416(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_835
# %bb.834:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	416(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_835:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 417(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_837
# %bb.836:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	417(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_837:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 418(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_839
# %bb.838:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	418(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_839:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 419(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_841
# %bb.840:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	419(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_841:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 420(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_843
# %bb.842:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	420(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_843:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 421(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_845
# %bb.844:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	421(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_845:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 422(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_847
# %bb.846:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	422(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_847:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 423(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_849
# %bb.848:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	423(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_849:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 424(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_851
# %bb.850:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	424(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_851:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 425(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_853
# %bb.852:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	425(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_853:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 426(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_855
# %bb.854:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	426(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_855:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 427(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_857
# %bb.856:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	427(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_857:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 428(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_859
# %bb.858:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	428(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_859:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 429(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_861
# %bb.860:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	429(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_861:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 430(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_863
# %bb.862:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	430(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_863:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 431(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_865
# %bb.864:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	431(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_865:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 432(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_867
# %bb.866:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	432(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_867:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 433(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_869
# %bb.868:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	433(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_869:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 434(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_871
# %bb.870:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	434(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_871:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 435(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_873
# %bb.872:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	435(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_873:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 436(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_875
# %bb.874:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	436(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_875:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 437(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_877
# %bb.876:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	437(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_877:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 438(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_879
# %bb.878:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	438(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_879:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 439(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_881
# %bb.880:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	439(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_881:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 440(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_883
# %bb.882:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	440(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_883:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 441(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_885
# %bb.884:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	441(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_885:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 442(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_887
# %bb.886:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	442(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_887:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 443(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_889
# %bb.888:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	443(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_889:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 444(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_891
# %bb.890:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	444(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_891:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 445(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_893
# %bb.892:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	445(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_893:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 446(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_895
# %bb.894:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	446(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_895:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 447(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_897
# %bb.896:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	447(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_897:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 448(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_899
# %bb.898:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	448(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_899:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 449(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_901
# %bb.900:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	449(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_901:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 450(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_903
# %bb.902:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	450(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_903:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 451(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_905
# %bb.904:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	451(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_905:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 452(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_907
# %bb.906:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	452(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_907:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 453(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_909
# %bb.908:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	453(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_909:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 454(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_911
# %bb.910:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	454(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_911:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 455(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_913
# %bb.912:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	455(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_913:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 456(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_915
# %bb.914:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	456(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_915:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 457(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_917
# %bb.916:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	457(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_917:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 458(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_919
# %bb.918:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	458(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_919:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 459(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_921
# %bb.920:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	459(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_921:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 460(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_923
# %bb.922:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	460(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_923:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 461(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_925
# %bb.924:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	461(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_925:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 462(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_927
# %bb.926:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	462(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_927:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 463(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_929
# %bb.928:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	463(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_929:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 464(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_931
# %bb.930:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	464(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_931:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 465(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_933
# %bb.932:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	465(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_933:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 466(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_935
# %bb.934:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	466(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_935:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 467(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_937
# %bb.936:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	467(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_937:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 468(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_939
# %bb.938:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	468(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_939:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 469(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_941
# %bb.940:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	469(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_941:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 470(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_943
# %bb.942:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	470(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_943:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 471(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_945
# %bb.944:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	471(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_945:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 472(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_947
# %bb.946:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	472(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_947:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 473(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_949
# %bb.948:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	473(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_949:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 474(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_951
# %bb.950:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	474(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_951:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 475(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_953
# %bb.952:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	475(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_953:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 476(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_955
# %bb.954:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	476(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_955:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 477(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_957
# %bb.956:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	477(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_957:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 478(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_959
# %bb.958:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	478(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_959:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 479(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_961
# %bb.960:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	479(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_961:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 480(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_963
# %bb.962:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	480(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_963:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 481(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_965
# %bb.964:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	481(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_965:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 482(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_967
# %bb.966:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	482(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_967:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 483(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_969
# %bb.968:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	483(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_969:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 484(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_971
# %bb.970:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	484(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_971:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 485(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_973
# %bb.972:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	485(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_973:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 486(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_975
# %bb.974:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	486(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_975:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 487(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_977
# %bb.976:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	487(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_977:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 488(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_979
# %bb.978:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	488(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_979:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 489(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_981
# %bb.980:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	489(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_981:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 490(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_983
# %bb.982:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	490(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_983:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 491(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_985
# %bb.984:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	491(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_985:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 492(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_987
# %bb.986:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	492(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_987:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 493(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_989
# %bb.988:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	493(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_989:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 494(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_991
# %bb.990:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	494(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_991:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 495(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_993
# %bb.992:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	495(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_993:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 496(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_995
# %bb.994:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	496(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_995:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 497(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_997
# %bb.996:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	497(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_997:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 498(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_999
# %bb.998:                              #   in Loop: Header=BB3_1 Depth=1
	leaq	498(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_999:                              #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 499(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1001
# %bb.1000:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	499(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1001:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 500(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1003
# %bb.1002:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	500(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1003:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 501(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1005
# %bb.1004:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	501(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1005:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 502(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1007
# %bb.1006:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	502(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1007:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 503(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1009
# %bb.1008:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	503(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1009:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 504(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1011
# %bb.1010:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	504(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1011:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 505(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1013
# %bb.1012:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	505(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1013:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 506(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1015
# %bb.1014:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	506(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1015:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 507(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1017
# %bb.1016:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	507(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1017:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 508(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1019
# %bb.1018:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	508(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1019:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 509(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1021
# %bb.1020:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	509(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1021:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 510(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1023
# %bb.1022:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	510(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1023:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 511(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1025
# %bb.1024:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	511(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1025:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 512(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1027
# %bb.1026:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	512(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1027:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 513(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1029
# %bb.1028:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	513(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1029:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 514(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1031
# %bb.1030:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	514(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1031:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 515(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1033
# %bb.1032:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	515(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1033:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 516(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1035
# %bb.1034:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	516(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1035:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 517(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1037
# %bb.1036:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	517(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1037:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 518(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1039
# %bb.1038:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	518(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1039:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 519(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1041
# %bb.1040:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	519(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1041:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 520(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1043
# %bb.1042:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	520(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1043:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 521(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1045
# %bb.1044:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	521(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1045:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 522(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1047
# %bb.1046:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	522(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1047:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 523(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1049
# %bb.1048:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	523(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1049:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 524(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1051
# %bb.1050:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	524(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1051:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 525(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1053
# %bb.1052:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	525(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1053:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 526(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1055
# %bb.1054:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	526(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1055:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 527(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1057
# %bb.1056:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	527(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1057:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 528(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1059
# %bb.1058:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	528(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1059:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 529(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1061
# %bb.1060:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	529(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1061:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 530(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1063
# %bb.1062:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	530(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1063:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 531(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1065
# %bb.1064:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	531(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1065:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 532(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1067
# %bb.1066:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	532(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1067:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 533(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1069
# %bb.1068:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	533(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1069:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 534(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1071
# %bb.1070:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	534(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1071:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 535(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1073
# %bb.1072:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	535(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1073:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 536(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1075
# %bb.1074:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	536(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1075:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 537(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1077
# %bb.1076:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	537(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1077:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 538(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1079
# %bb.1078:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	538(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1079:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 539(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1081
# %bb.1080:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	539(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1081:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 540(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1083
# %bb.1082:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	540(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1083:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 541(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1085
# %bb.1084:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	541(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1085:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 542(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1087
# %bb.1086:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	542(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1087:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 543(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1089
# %bb.1088:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	543(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1089:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 544(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1091
# %bb.1090:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	544(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1091:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 545(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1093
# %bb.1092:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	545(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1093:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 546(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1095
# %bb.1094:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	546(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1095:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 547(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1097
# %bb.1096:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	547(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1097:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 548(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1099
# %bb.1098:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	548(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1099:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 549(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1101
# %bb.1100:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	549(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1101:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 550(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1103
# %bb.1102:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	550(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1103:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 551(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1105
# %bb.1104:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	551(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1105:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 552(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1107
# %bb.1106:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	552(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1107:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 553(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1109
# %bb.1108:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	553(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1109:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 554(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1111
# %bb.1110:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	554(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1111:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 555(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1113
# %bb.1112:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	555(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1113:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 556(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1115
# %bb.1114:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	556(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1115:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 557(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1117
# %bb.1116:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	557(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1117:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 558(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1119
# %bb.1118:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	558(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1119:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 559(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1121
# %bb.1120:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	559(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1121:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 560(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1123
# %bb.1122:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	560(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1123:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 561(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1125
# %bb.1124:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	561(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1125:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 562(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1127
# %bb.1126:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	562(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1127:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 563(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1129
# %bb.1128:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	563(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1129:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 564(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1131
# %bb.1130:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	564(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1131:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 565(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1133
# %bb.1132:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	565(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1133:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 566(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1135
# %bb.1134:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	566(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1135:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 567(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1137
# %bb.1136:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	567(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1137:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 568(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1139
# %bb.1138:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	568(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1139:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 569(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1141
# %bb.1140:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	569(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1141:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 570(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1143
# %bb.1142:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	570(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1143:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 571(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1145
# %bb.1144:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	571(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1145:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 572(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1147
# %bb.1146:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	572(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1147:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 573(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1149
# %bb.1148:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	573(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1149:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 574(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1151
# %bb.1150:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	574(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1151:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 575(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1153
# %bb.1152:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	575(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1153:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 576(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1155
# %bb.1154:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	576(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1155:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 577(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1157
# %bb.1156:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	577(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1157:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 578(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1159
# %bb.1158:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	578(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1159:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 579(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1161
# %bb.1160:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	579(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1161:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 580(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1163
# %bb.1162:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	580(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1163:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 581(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1165
# %bb.1164:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	581(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1165:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 582(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1167
# %bb.1166:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	582(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1167:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 583(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1169
# %bb.1168:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	583(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1169:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 584(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1171
# %bb.1170:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	584(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1171:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 585(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1173
# %bb.1172:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	585(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1173:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 586(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1175
# %bb.1174:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	586(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1175:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 587(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1177
# %bb.1176:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	587(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1177:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 588(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1179
# %bb.1178:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	588(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1179:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 589(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1181
# %bb.1180:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	589(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1181:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 590(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1183
# %bb.1182:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	590(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1183:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 591(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1185
# %bb.1184:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	591(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1185:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 592(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1187
# %bb.1186:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	592(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1187:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 593(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1189
# %bb.1188:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	593(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1189:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 594(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1191
# %bb.1190:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	594(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1191:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 595(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1193
# %bb.1192:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	595(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1193:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 596(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1195
# %bb.1194:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	596(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1195:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 597(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1197
# %bb.1196:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	597(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1197:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 598(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1199
# %bb.1198:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	598(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1199:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 599(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1201
# %bb.1200:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	599(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1201:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 600(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1203
# %bb.1202:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	600(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1203:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 601(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1205
# %bb.1204:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	601(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1205:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 602(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1207
# %bb.1206:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	602(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1207:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 603(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1209
# %bb.1208:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	603(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1209:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 604(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1211
# %bb.1210:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	604(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1211:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 605(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1213
# %bb.1212:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	605(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1213:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 606(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1215
# %bb.1214:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	606(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1215:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 607(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1217
# %bb.1216:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	607(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1217:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 608(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1219
# %bb.1218:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	608(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1219:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 609(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1221
# %bb.1220:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	609(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1221:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 610(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1223
# %bb.1222:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	610(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1223:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 611(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1225
# %bb.1224:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	611(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1225:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 612(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1227
# %bb.1226:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	612(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1227:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 613(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1229
# %bb.1228:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	613(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1229:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 614(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1231
# %bb.1230:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	614(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1231:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 615(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1233
# %bb.1232:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	615(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1233:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 616(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1235
# %bb.1234:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	616(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1235:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 617(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1237
# %bb.1236:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	617(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1237:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 618(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1239
# %bb.1238:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	618(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1239:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 619(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1241
# %bb.1240:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	619(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1241:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 620(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1243
# %bb.1242:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	620(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1243:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 621(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1245
# %bb.1244:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	621(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1245:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 622(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1247
# %bb.1246:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	622(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1247:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 623(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1249
# %bb.1248:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	623(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1249:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 624(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1251
# %bb.1250:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	624(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1251:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 625(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1253
# %bb.1252:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	625(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1253:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 626(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1255
# %bb.1254:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	626(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1255:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 627(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1257
# %bb.1256:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	627(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1257:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 628(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1259
# %bb.1258:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	628(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1259:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 629(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1261
# %bb.1260:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	629(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1261:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 630(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1263
# %bb.1262:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	630(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1263:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 631(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1265
# %bb.1264:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	631(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1265:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 632(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1267
# %bb.1266:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	632(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1267:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 633(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1269
# %bb.1268:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	633(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1269:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 634(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1271
# %bb.1270:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	634(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1271:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 635(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1273
# %bb.1272:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	635(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1273:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 636(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1275
# %bb.1274:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	636(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1275:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 637(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1277
# %bb.1276:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	637(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1277:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 638(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1279
# %bb.1278:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	638(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1279:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 639(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1281
# %bb.1280:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	639(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1281:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 640(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1283
# %bb.1282:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	640(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1283:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 641(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1285
# %bb.1284:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	641(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1285:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 642(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1287
# %bb.1286:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	642(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1287:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 643(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1289
# %bb.1288:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	643(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1289:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 644(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1291
# %bb.1290:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	644(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1291:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 645(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1293
# %bb.1292:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	645(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1293:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 646(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1295
# %bb.1294:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	646(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1295:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 647(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1297
# %bb.1296:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	647(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1297:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 648(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1299
# %bb.1298:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	648(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1299:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 649(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1301
# %bb.1300:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	649(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1301:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 650(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1303
# %bb.1302:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	650(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1303:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 651(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1305
# %bb.1304:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	651(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1305:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 652(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1307
# %bb.1306:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	652(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1307:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 653(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1309
# %bb.1308:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	653(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1309:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 654(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1311
# %bb.1310:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	654(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1311:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 655(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1313
# %bb.1312:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	655(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1313:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 656(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1315
# %bb.1314:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	656(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1315:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 657(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1317
# %bb.1316:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	657(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1317:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 658(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1319
# %bb.1318:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	658(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1319:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 659(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1321
# %bb.1320:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	659(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1321:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 660(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1323
# %bb.1322:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	660(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1323:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 661(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1325
# %bb.1324:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	661(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1325:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 662(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1327
# %bb.1326:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	662(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1327:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 663(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1329
# %bb.1328:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	663(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1329:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 664(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1331
# %bb.1330:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	664(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1331:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 665(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1333
# %bb.1332:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	665(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1333:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 666(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1335
# %bb.1334:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	666(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1335:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 667(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1337
# %bb.1336:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	667(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1337:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 668(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1339
# %bb.1338:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	668(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1339:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 669(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1341
# %bb.1340:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	669(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1341:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 670(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1343
# %bb.1342:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	670(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1343:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 671(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1345
# %bb.1344:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	671(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1345:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 672(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1347
# %bb.1346:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	672(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1347:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 673(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1349
# %bb.1348:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	673(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1349:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 674(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1351
# %bb.1350:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	674(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1351:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 675(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1353
# %bb.1352:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	675(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1353:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 676(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1355
# %bb.1354:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	676(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1355:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 677(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1357
# %bb.1356:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	677(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1357:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 678(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1359
# %bb.1358:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	678(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1359:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 679(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1361
# %bb.1360:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	679(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1361:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 680(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1363
# %bb.1362:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	680(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1363:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 681(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1365
# %bb.1364:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	681(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1365:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 682(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1367
# %bb.1366:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	682(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1367:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 683(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1369
# %bb.1368:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	683(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1369:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 684(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1371
# %bb.1370:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	684(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1371:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 685(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1373
# %bb.1372:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	685(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1373:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 686(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1375
# %bb.1374:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	686(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1375:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 687(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1377
# %bb.1376:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	687(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1377:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 688(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1379
# %bb.1378:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	688(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1379:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 689(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1381
# %bb.1380:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	689(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1381:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 690(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1383
# %bb.1382:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	690(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1383:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 691(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1385
# %bb.1384:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	691(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1385:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 692(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1387
# %bb.1386:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	692(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1387:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 693(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1389
# %bb.1388:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	693(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1389:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 694(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1391
# %bb.1390:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	694(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1391:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 695(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1393
# %bb.1392:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	695(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1393:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 696(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1395
# %bb.1394:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	696(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1395:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 697(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1397
# %bb.1396:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	697(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1397:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 698(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1399
# %bb.1398:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	698(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1399:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 699(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1401
# %bb.1400:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	699(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1401:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 700(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1403
# %bb.1402:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	700(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1403:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 701(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1405
# %bb.1404:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	701(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1405:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 702(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1407
# %bb.1406:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	702(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1407:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 703(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1409
# %bb.1408:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	703(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1409:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 704(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1411
# %bb.1410:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	704(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1411:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 705(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1413
# %bb.1412:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	705(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1413:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 706(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1415
# %bb.1414:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	706(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1415:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 707(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1417
# %bb.1416:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	707(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1417:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 708(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1419
# %bb.1418:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	708(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1419:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 709(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1421
# %bb.1420:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	709(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1421:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 710(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1423
# %bb.1422:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	710(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1423:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 711(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1425
# %bb.1424:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	711(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1425:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 712(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1427
# %bb.1426:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	712(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1427:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 713(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1429
# %bb.1428:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	713(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1429:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 714(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1431
# %bb.1430:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	714(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1431:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 715(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1433
# %bb.1432:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	715(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1433:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 716(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1435
# %bb.1434:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	716(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1435:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 717(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1437
# %bb.1436:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	717(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1437:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 718(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1439
# %bb.1438:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	718(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1439:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 719(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1441
# %bb.1440:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	719(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1441:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 720(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1443
# %bb.1442:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	720(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1443:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 721(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1445
# %bb.1444:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	721(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1445:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 722(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1447
# %bb.1446:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	722(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1447:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 723(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1449
# %bb.1448:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	723(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1449:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 724(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1451
# %bb.1450:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	724(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1451:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 725(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1453
# %bb.1452:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	725(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1453:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 726(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1455
# %bb.1454:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	726(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1455:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 727(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1457
# %bb.1456:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	727(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1457:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 728(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1459
# %bb.1458:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	728(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1459:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 729(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1461
# %bb.1460:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	729(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1461:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 730(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1463
# %bb.1462:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	730(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1463:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 731(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1465
# %bb.1464:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	731(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1465:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 732(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1467
# %bb.1466:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	732(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1467:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 733(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1469
# %bb.1468:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	733(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1469:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 734(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1471
# %bb.1470:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	734(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1471:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 735(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1473
# %bb.1472:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	735(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1473:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 736(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1475
# %bb.1474:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	736(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1475:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 737(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1477
# %bb.1476:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	737(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1477:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 738(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1479
# %bb.1478:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	738(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1479:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 739(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1481
# %bb.1480:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	739(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1481:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 740(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1483
# %bb.1482:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	740(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1483:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 741(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1485
# %bb.1484:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	741(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1485:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 742(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1487
# %bb.1486:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	742(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1487:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 743(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1489
# %bb.1488:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	743(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1489:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 744(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1491
# %bb.1490:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	744(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1491:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 745(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1493
# %bb.1492:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	745(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1493:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 746(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1495
# %bb.1494:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	746(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1495:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 747(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1497
# %bb.1496:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	747(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1497:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 748(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1499
# %bb.1498:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	748(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1499:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 749(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1501
# %bb.1500:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	749(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1501:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 750(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1503
# %bb.1502:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	750(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1503:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 751(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1505
# %bb.1504:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	751(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1505:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 752(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1507
# %bb.1506:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	752(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1507:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 753(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1509
# %bb.1508:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	753(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1509:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 754(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1511
# %bb.1510:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	754(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1511:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 755(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1513
# %bb.1512:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	755(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1513:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 756(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1515
# %bb.1514:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	756(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1515:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 757(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1517
# %bb.1516:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	757(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1517:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 758(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1519
# %bb.1518:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	758(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1519:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 759(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1521
# %bb.1520:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	759(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1521:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 760(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1523
# %bb.1522:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	760(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1523:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 761(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1525
# %bb.1524:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	761(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1525:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 762(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1527
# %bb.1526:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	762(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1527:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 763(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1529
# %bb.1528:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	763(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1529:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 764(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1531
# %bb.1530:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	764(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1531:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 765(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1533
# %bb.1532:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	765(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1533:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 766(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1535
# %bb.1534:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	766(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1535:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 767(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1537
# %bb.1536:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	767(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1537:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 768(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1539
# %bb.1538:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	768(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1539:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 769(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1541
# %bb.1540:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	769(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1541:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 770(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1543
# %bb.1542:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	770(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1543:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 771(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1545
# %bb.1544:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	771(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1545:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 772(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1547
# %bb.1546:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	772(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1547:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 773(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1549
# %bb.1548:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	773(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1549:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 774(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1551
# %bb.1550:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	774(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1551:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 775(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1553
# %bb.1552:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	775(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1553:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 776(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1555
# %bb.1554:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	776(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1555:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 777(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1557
# %bb.1556:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	777(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1557:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 778(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1559
# %bb.1558:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	778(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1559:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 779(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1561
# %bb.1560:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	779(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1561:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 780(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1563
# %bb.1562:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	780(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1563:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 781(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1565
# %bb.1564:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	781(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1565:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 782(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1567
# %bb.1566:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	782(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1567:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 783(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1569
# %bb.1568:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	783(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1569:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 784(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1571
# %bb.1570:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	784(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1571:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 785(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1573
# %bb.1572:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	785(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1573:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 786(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1575
# %bb.1574:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	786(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1575:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 787(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1577
# %bb.1576:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	787(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1577:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 788(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1579
# %bb.1578:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	788(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1579:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 789(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1581
# %bb.1580:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	789(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1581:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 790(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1583
# %bb.1582:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	790(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1583:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 791(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1585
# %bb.1584:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	791(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1585:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 792(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1587
# %bb.1586:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	792(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1587:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 793(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1589
# %bb.1588:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	793(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1589:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 794(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1591
# %bb.1590:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	794(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1591:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 795(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1593
# %bb.1592:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	795(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1593:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 796(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1595
# %bb.1594:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	796(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1595:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 797(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1597
# %bb.1596:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	797(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1597:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 798(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1599
# %bb.1598:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	798(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1599:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 799(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1601
# %bb.1600:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	799(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1601:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 800(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1603
# %bb.1602:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	800(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1603:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 801(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1605
# %bb.1604:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	801(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1605:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 802(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1607
# %bb.1606:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	802(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1607:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 803(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1609
# %bb.1608:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	803(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1609:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 804(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1611
# %bb.1610:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	804(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1611:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 805(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1613
# %bb.1612:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	805(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1613:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 806(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1615
# %bb.1614:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	806(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1615:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 807(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1617
# %bb.1616:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	807(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1617:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 808(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1619
# %bb.1618:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	808(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1619:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 809(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1621
# %bb.1620:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	809(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1621:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 810(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1623
# %bb.1622:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	810(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1623:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 811(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1625
# %bb.1624:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	811(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1625:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 812(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1627
# %bb.1626:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	812(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1627:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 813(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1629
# %bb.1628:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	813(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1629:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 814(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1631
# %bb.1630:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	814(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1631:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 815(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1633
# %bb.1632:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	815(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1633:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 816(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1635
# %bb.1634:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	816(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1635:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 817(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1637
# %bb.1636:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	817(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1637:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 818(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1639
# %bb.1638:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	818(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1639:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 819(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1641
# %bb.1640:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	819(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1641:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 820(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1643
# %bb.1642:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	820(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1643:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 821(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1645
# %bb.1644:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	821(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1645:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 822(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1647
# %bb.1646:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	822(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1647:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 823(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1649
# %bb.1648:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	823(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1649:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 824(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1651
# %bb.1650:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	824(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1651:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 825(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1653
# %bb.1652:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	825(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1653:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 826(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1655
# %bb.1654:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	826(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1655:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 827(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1657
# %bb.1656:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	827(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1657:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 828(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1659
# %bb.1658:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	828(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1659:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 829(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1661
# %bb.1660:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	829(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1661:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 830(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1663
# %bb.1662:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	830(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1663:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 831(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1665
# %bb.1664:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	831(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1665:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 832(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1667
# %bb.1666:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	832(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1667:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 833(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1669
# %bb.1668:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	833(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1669:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 834(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1671
# %bb.1670:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	834(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1671:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 835(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1673
# %bb.1672:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	835(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1673:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 836(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1675
# %bb.1674:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	836(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1675:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 837(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1677
# %bb.1676:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	837(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1677:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 838(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1679
# %bb.1678:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	838(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1679:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 839(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1681
# %bb.1680:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	839(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1681:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 840(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1683
# %bb.1682:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	840(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1683:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 841(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1685
# %bb.1684:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	841(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1685:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 842(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1687
# %bb.1686:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	842(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1687:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 843(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1689
# %bb.1688:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	843(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1689:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 844(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1691
# %bb.1690:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	844(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1691:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 845(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1693
# %bb.1692:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	845(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1693:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 846(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1695
# %bb.1694:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	846(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1695:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 847(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1697
# %bb.1696:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	847(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1697:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 848(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1699
# %bb.1698:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	848(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1699:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 849(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1701
# %bb.1700:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	849(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1701:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 850(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1703
# %bb.1702:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	850(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1703:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 851(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1705
# %bb.1704:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	851(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1705:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 852(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1707
# %bb.1706:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	852(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1707:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 853(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1709
# %bb.1708:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	853(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1709:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 854(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1711
# %bb.1710:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	854(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1711:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 855(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1713
# %bb.1712:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	855(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1713:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 856(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1715
# %bb.1714:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	856(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1715:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 857(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1717
# %bb.1716:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	857(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1717:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 858(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1719
# %bb.1718:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	858(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1719:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 859(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1721
# %bb.1720:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	859(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1721:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 860(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1723
# %bb.1722:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	860(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1723:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 861(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1725
# %bb.1724:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	861(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1725:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 862(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1727
# %bb.1726:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	862(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1727:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 863(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1729
# %bb.1728:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	863(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1729:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 864(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1731
# %bb.1730:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	864(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1731:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 865(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1733
# %bb.1732:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	865(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1733:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 866(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1735
# %bb.1734:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	866(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1735:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 867(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1737
# %bb.1736:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	867(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1737:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 868(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1739
# %bb.1738:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	868(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1739:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 869(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1741
# %bb.1740:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	869(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1741:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 870(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1743
# %bb.1742:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	870(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1743:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 871(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1745
# %bb.1744:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	871(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1745:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 872(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1747
# %bb.1746:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	872(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1747:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 873(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1749
# %bb.1748:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	873(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1749:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 874(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1751
# %bb.1750:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	874(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1751:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 875(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1753
# %bb.1752:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	875(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1753:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 876(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1755
# %bb.1754:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	876(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1755:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 877(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1757
# %bb.1756:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	877(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1757:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 878(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1759
# %bb.1758:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	878(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1759:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 879(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1761
# %bb.1760:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	879(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1761:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 880(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1763
# %bb.1762:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	880(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1763:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 881(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1765
# %bb.1764:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	881(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1765:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 882(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1767
# %bb.1766:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	882(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1767:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 883(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1769
# %bb.1768:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	883(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1769:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 884(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1771
# %bb.1770:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	884(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1771:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 885(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1773
# %bb.1772:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	885(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1773:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 886(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1775
# %bb.1774:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	886(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1775:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 887(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1777
# %bb.1776:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	887(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1777:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 888(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1779
# %bb.1778:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	888(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1779:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 889(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1781
# %bb.1780:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	889(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1781:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 890(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1783
# %bb.1782:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	890(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1783:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 891(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1785
# %bb.1784:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	891(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1785:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 892(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1787
# %bb.1786:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	892(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1787:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 893(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1789
# %bb.1788:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	893(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1789:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 894(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1791
# %bb.1790:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	894(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1791:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 895(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1793
# %bb.1792:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	895(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1793:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 896(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1795
# %bb.1794:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	896(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1795:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 897(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1797
# %bb.1796:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	897(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1797:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 898(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1799
# %bb.1798:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	898(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1799:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 899(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1801
# %bb.1800:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	899(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1801:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 900(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1803
# %bb.1802:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	900(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1803:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 901(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1805
# %bb.1804:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	901(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1805:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 902(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1807
# %bb.1806:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	902(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1807:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 903(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1809
# %bb.1808:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	903(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1809:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 904(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1811
# %bb.1810:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	904(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1811:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 905(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1813
# %bb.1812:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	905(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1813:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 906(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1815
# %bb.1814:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	906(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1815:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 907(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1817
# %bb.1816:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	907(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1817:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 908(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1819
# %bb.1818:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	908(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1819:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 909(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1821
# %bb.1820:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	909(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1821:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 910(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1823
# %bb.1822:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	910(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1823:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 911(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1825
# %bb.1824:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	911(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1825:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 912(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1827
# %bb.1826:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	912(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1827:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 913(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1829
# %bb.1828:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	913(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1829:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 914(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1831
# %bb.1830:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	914(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1831:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 915(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1833
# %bb.1832:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	915(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1833:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 916(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1835
# %bb.1834:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	916(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1835:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 917(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1837
# %bb.1836:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	917(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1837:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 918(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1839
# %bb.1838:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	918(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1839:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 919(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1841
# %bb.1840:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	919(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1841:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 920(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1843
# %bb.1842:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	920(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1843:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 921(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1845
# %bb.1844:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	921(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1845:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 922(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1847
# %bb.1846:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	922(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1847:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 923(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1849
# %bb.1848:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	923(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1849:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 924(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1851
# %bb.1850:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	924(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1851:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 925(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1853
# %bb.1852:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	925(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1853:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 926(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1855
# %bb.1854:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	926(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1855:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 927(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1857
# %bb.1856:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	927(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1857:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 928(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1859
# %bb.1858:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	928(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1859:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 929(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1861
# %bb.1860:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	929(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1861:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 930(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1863
# %bb.1862:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	930(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1863:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 931(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1865
# %bb.1864:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	931(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1865:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 932(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1867
# %bb.1866:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	932(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1867:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 933(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1869
# %bb.1868:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	933(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1869:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 934(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1871
# %bb.1870:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	934(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1871:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 935(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1873
# %bb.1872:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	935(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1873:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 936(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1875
# %bb.1874:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	936(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1875:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 937(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1877
# %bb.1876:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	937(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1877:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 938(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1879
# %bb.1878:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	938(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1879:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 939(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1881
# %bb.1880:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	939(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1881:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 940(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1883
# %bb.1882:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	940(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1883:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 941(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1885
# %bb.1884:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	941(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1885:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 942(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1887
# %bb.1886:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	942(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1887:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 943(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1889
# %bb.1888:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	943(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1889:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 944(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1891
# %bb.1890:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	944(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1891:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 945(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1893
# %bb.1892:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	945(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1893:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 946(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1895
# %bb.1894:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	946(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1895:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 947(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1897
# %bb.1896:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	947(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1897:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 948(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1899
# %bb.1898:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	948(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1899:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 949(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1901
# %bb.1900:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	949(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1901:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 950(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1903
# %bb.1902:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	950(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1903:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 951(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1905
# %bb.1904:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	951(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1905:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 952(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1907
# %bb.1906:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	952(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1907:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 953(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1909
# %bb.1908:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	953(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1909:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 954(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1911
# %bb.1910:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	954(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1911:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 955(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1913
# %bb.1912:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	955(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1913:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 956(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1915
# %bb.1914:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	956(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1915:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 957(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1917
# %bb.1916:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	957(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1917:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 958(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1919
# %bb.1918:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	958(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1919:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 959(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1921
# %bb.1920:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	959(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1921:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 960(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1923
# %bb.1922:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	960(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1923:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 961(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1925
# %bb.1924:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	961(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1925:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 962(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1927
# %bb.1926:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	962(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1927:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 963(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1929
# %bb.1928:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	963(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1929:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 964(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1931
# %bb.1930:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	964(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1931:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 965(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1933
# %bb.1932:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	965(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1933:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 966(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1935
# %bb.1934:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	966(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1935:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 967(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1937
# %bb.1936:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	967(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1937:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 968(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1939
# %bb.1938:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	968(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1939:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 969(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1941
# %bb.1940:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	969(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1941:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 970(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1943
# %bb.1942:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	970(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1943:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 971(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1945
# %bb.1944:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	971(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1945:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 972(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1947
# %bb.1946:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	972(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1947:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 973(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1949
# %bb.1948:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	973(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1949:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 974(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1951
# %bb.1950:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	974(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1951:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 975(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1953
# %bb.1952:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	975(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1953:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 976(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1955
# %bb.1954:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	976(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1955:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 977(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1957
# %bb.1956:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	977(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1957:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 978(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1959
# %bb.1958:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	978(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1959:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 979(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1961
# %bb.1960:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	979(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1961:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 980(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1963
# %bb.1962:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	980(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1963:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 981(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1965
# %bb.1964:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	981(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1965:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 982(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1967
# %bb.1966:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	982(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1967:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 983(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1969
# %bb.1968:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	983(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1969:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 984(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1971
# %bb.1970:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	984(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1971:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 985(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1973
# %bb.1972:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	985(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1973:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 986(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1975
# %bb.1974:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	986(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1975:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 987(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1977
# %bb.1976:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	987(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1977:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 988(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1979
# %bb.1978:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	988(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1979:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 989(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1981
# %bb.1980:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	989(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1981:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 990(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1983
# %bb.1982:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	990(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1983:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 991(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1985
# %bb.1984:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	991(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1985:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 992(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1987
# %bb.1986:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	992(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1987:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 993(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1989
# %bb.1988:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	993(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1989:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 994(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1991
# %bb.1990:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	994(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1991:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 995(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1993
# %bb.1992:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	995(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1993:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 996(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1995
# %bb.1994:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	996(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1995:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 997(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1997
# %bb.1996:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	997(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1997:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 998(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_1999
# %bb.1998:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	998(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_1999:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 999(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2001
# %bb.2000:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	999(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2001:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1000(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2003
# %bb.2002:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1000(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2003:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1001(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2005
# %bb.2004:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1001(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2005:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1002(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2007
# %bb.2006:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1002(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2007:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1003(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2009
# %bb.2008:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1003(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2009:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1004(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2011
# %bb.2010:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1004(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2011:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1005(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2013
# %bb.2012:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1005(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2013:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1006(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2015
# %bb.2014:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1006(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2015:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1007(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2017
# %bb.2016:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1007(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2017:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1008(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2019
# %bb.2018:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1008(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2019:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1009(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2021
# %bb.2020:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1009(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2021:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1010(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2023
# %bb.2022:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1010(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2023:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1011(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2025
# %bb.2024:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1011(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2025:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1012(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2027
# %bb.2026:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1012(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2027:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1013(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2029
# %bb.2028:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1013(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2029:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1014(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2031
# %bb.2030:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1014(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2031:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1015(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2033
# %bb.2032:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1015(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2033:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1016(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2035
# %bb.2034:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1016(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2035:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1017(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2037
# %bb.2036:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1017(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2037:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1018(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2039
# %bb.2038:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1018(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2039:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1019(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2041
# %bb.2040:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1019(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2041:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1020(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2043
# %bb.2042:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1020(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2043:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1021(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2045
# %bb.2044:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1021(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2045:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1022(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2047
# %bb.2046:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1022(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2047:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1023(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2049
# %bb.2048:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1023(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2049:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1024(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2051
# %bb.2050:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1024(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2051:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1025(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2053
# %bb.2052:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1025(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2053:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1026(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2055
# %bb.2054:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1026(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2055:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1027(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2057
# %bb.2056:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1027(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2057:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1028(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2059
# %bb.2058:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1028(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2059:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1029(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2061
# %bb.2060:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1029(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2061:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1030(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2063
# %bb.2062:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1030(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2063:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1031(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2065
# %bb.2064:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1031(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2065:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1032(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2067
# %bb.2066:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1032(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2067:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1033(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2069
# %bb.2068:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1033(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2069:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1034(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2071
# %bb.2070:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1034(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2071:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1035(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2073
# %bb.2072:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1035(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2073:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1036(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2075
# %bb.2074:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1036(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2075:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1037(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2077
# %bb.2076:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1037(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2077:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1038(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2079
# %bb.2078:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1038(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2079:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1039(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2081
# %bb.2080:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1039(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2081:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1040(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2083
# %bb.2082:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1040(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2083:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1041(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2085
# %bb.2084:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1041(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2085:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1042(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2087
# %bb.2086:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1042(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2087:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1043(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2089
# %bb.2088:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1043(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2089:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1044(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2091
# %bb.2090:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1044(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2091:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1045(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2093
# %bb.2092:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1045(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2093:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1046(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2095
# %bb.2094:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1046(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2095:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1047(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2097
# %bb.2096:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1047(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2097:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1048(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2099
# %bb.2098:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1048(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2099:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1049(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2101
# %bb.2100:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1049(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2101:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1050(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2103
# %bb.2102:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1050(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2103:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1051(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2105
# %bb.2104:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1051(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2105:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1052(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2107
# %bb.2106:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1052(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2107:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1053(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2109
# %bb.2108:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1053(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2109:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1054(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2111
# %bb.2110:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1054(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2111:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1055(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2113
# %bb.2112:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1055(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2113:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1056(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2115
# %bb.2114:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1056(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2115:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1057(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2117
# %bb.2116:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1057(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2117:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1058(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2119
# %bb.2118:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1058(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2119:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1059(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2121
# %bb.2120:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1059(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2121:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1060(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2123
# %bb.2122:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1060(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2123:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1061(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2125
# %bb.2124:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1061(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2125:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1062(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2127
# %bb.2126:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1062(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2127:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1063(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2129
# %bb.2128:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1063(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2129:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1064(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2131
# %bb.2130:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1064(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2131:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1065(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2133
# %bb.2132:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1065(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2133:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1066(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2135
# %bb.2134:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1066(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2135:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1067(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2137
# %bb.2136:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1067(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2137:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1068(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2139
# %bb.2138:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1068(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2139:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1069(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2141
# %bb.2140:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1069(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2141:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1070(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2143
# %bb.2142:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1070(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2143:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1071(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2145
# %bb.2144:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1071(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2145:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1072(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2147
# %bb.2146:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1072(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2147:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1073(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2149
# %bb.2148:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1073(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2149:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1074(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2151
# %bb.2150:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1074(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2151:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1075(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2153
# %bb.2152:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1075(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2153:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1076(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2155
# %bb.2154:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1076(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2155:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1077(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2157
# %bb.2156:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1077(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2157:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1078(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2159
# %bb.2158:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1078(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2159:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1079(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2161
# %bb.2160:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1079(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2161:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1080(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2163
# %bb.2162:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1080(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2163:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1081(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2165
# %bb.2164:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1081(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2165:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1082(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2167
# %bb.2166:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1082(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2167:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1083(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2169
# %bb.2168:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1083(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2169:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1084(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2171
# %bb.2170:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1084(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2171:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1085(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2173
# %bb.2172:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1085(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2173:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1086(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2175
# %bb.2174:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1086(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2175:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1087(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2177
# %bb.2176:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1087(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2177:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1088(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2179
# %bb.2178:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1088(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2179:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1089(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2181
# %bb.2180:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1089(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2181:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1090(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2183
# %bb.2182:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1090(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2183:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1091(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2185
# %bb.2184:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1091(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2185:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1092(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2187
# %bb.2186:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1092(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2187:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1093(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2189
# %bb.2188:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1093(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2189:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1094(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2191
# %bb.2190:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1094(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2191:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1095(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2193
# %bb.2192:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1095(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2193:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1096(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2195
# %bb.2194:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1096(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2195:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1097(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2197
# %bb.2196:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1097(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2197:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1098(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2199
# %bb.2198:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1098(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2199:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1099(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2201
# %bb.2200:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1099(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2201:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1100(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2203
# %bb.2202:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1100(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2203:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1101(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2205
# %bb.2204:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1101(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2205:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1102(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2207
# %bb.2206:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1102(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2207:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1103(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2209
# %bb.2208:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1103(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2209:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1104(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2211
# %bb.2210:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1104(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2211:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1105(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2213
# %bb.2212:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1105(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2213:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1106(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2215
# %bb.2214:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1106(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2215:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1107(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2217
# %bb.2216:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1107(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2217:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1108(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2219
# %bb.2218:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1108(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2219:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1109(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2221
# %bb.2220:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1109(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2221:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1110(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2223
# %bb.2222:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1110(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2223:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1111(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2225
# %bb.2224:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1111(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2225:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1112(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2227
# %bb.2226:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1112(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2227:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1113(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2229
# %bb.2228:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1113(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2229:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1114(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2231
# %bb.2230:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1114(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2231:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1115(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2233
# %bb.2232:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1115(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2233:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1116(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2235
# %bb.2234:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1116(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2235:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1117(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2237
# %bb.2236:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1117(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2237:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1118(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2239
# %bb.2238:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1118(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2239:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1119(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2241
# %bb.2240:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1119(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2241:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1120(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2243
# %bb.2242:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1120(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2243:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1121(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2245
# %bb.2244:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1121(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2245:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1122(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2247
# %bb.2246:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1122(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2247:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1123(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2249
# %bb.2248:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1123(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2249:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1124(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2251
# %bb.2250:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1124(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2251:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1125(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2253
# %bb.2252:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1125(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2253:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1126(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2255
# %bb.2254:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1126(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2255:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1127(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2257
# %bb.2256:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1127(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2257:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1128(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2259
# %bb.2258:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1128(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2259:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1129(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2261
# %bb.2260:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1129(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2261:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1130(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2263
# %bb.2262:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1130(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2263:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1131(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2265
# %bb.2264:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1131(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2265:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1132(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2267
# %bb.2266:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1132(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2267:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1133(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2269
# %bb.2268:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1133(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2269:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1134(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2271
# %bb.2270:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1134(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2271:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1135(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2273
# %bb.2272:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1135(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2273:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1136(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2275
# %bb.2274:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1136(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2275:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1137(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2277
# %bb.2276:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1137(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2277:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1138(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2279
# %bb.2278:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1138(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2279:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1139(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2281
# %bb.2280:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1139(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2281:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1140(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2283
# %bb.2282:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1140(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2283:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1141(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2285
# %bb.2284:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1141(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2285:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1142(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2287
# %bb.2286:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1142(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2287:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1143(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2289
# %bb.2288:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1143(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2289:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1144(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2291
# %bb.2290:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1144(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2291:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1145(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2293
# %bb.2292:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1145(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2293:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1146(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2295
# %bb.2294:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1146(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2295:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1147(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2297
# %bb.2296:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1147(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2297:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1148(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2299
# %bb.2298:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1148(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2299:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1149(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2301
# %bb.2300:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1149(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2301:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1150(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2303
# %bb.2302:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1150(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2303:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1151(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2305
# %bb.2304:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1151(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2305:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1152(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2307
# %bb.2306:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1152(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2307:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1153(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2309
# %bb.2308:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1153(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2309:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1154(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2311
# %bb.2310:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1154(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2311:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1155(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2313
# %bb.2312:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1155(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2313:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1156(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2315
# %bb.2314:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1156(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2315:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1157(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2317
# %bb.2316:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1157(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2317:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1158(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2319
# %bb.2318:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1158(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2319:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1159(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2321
# %bb.2320:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1159(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2321:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1160(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2323
# %bb.2322:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1160(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2323:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1161(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2325
# %bb.2324:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1161(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2325:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1162(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2327
# %bb.2326:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1162(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2327:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1163(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2329
# %bb.2328:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1163(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2329:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1164(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2331
# %bb.2330:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1164(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2331:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1165(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2333
# %bb.2332:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1165(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2333:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1166(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2335
# %bb.2334:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1166(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2335:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1167(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2337
# %bb.2336:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1167(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2337:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1168(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2339
# %bb.2338:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1168(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2339:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1169(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2341
# %bb.2340:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1169(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2341:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1170(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2343
# %bb.2342:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1170(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2343:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1171(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2345
# %bb.2344:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1171(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2345:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1172(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2347
# %bb.2346:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1172(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2347:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1173(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2349
# %bb.2348:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1173(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2349:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1174(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2351
# %bb.2350:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1174(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2351:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1175(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2353
# %bb.2352:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1175(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2353:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1176(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2355
# %bb.2354:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1176(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2355:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1177(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2357
# %bb.2356:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1177(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2357:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1178(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2359
# %bb.2358:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1178(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2359:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1179(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2361
# %bb.2360:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1179(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2361:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1180(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2363
# %bb.2362:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1180(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2363:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1181(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2365
# %bb.2364:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1181(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2365:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1182(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2367
# %bb.2366:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1182(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2367:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1183(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2369
# %bb.2368:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1183(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2369:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1184(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2371
# %bb.2370:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1184(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2371:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1185(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2373
# %bb.2372:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1185(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2373:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1186(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2375
# %bb.2374:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1186(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2375:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1187(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2377
# %bb.2376:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1187(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2377:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1188(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2379
# %bb.2378:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1188(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2379:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1189(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2381
# %bb.2380:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1189(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2381:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1190(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2383
# %bb.2382:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1190(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2383:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1191(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2385
# %bb.2384:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1191(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2385:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1192(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2387
# %bb.2386:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1192(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2387:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1193(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2389
# %bb.2388:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1193(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2389:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1194(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2391
# %bb.2390:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1194(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2391:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1195(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2393
# %bb.2392:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1195(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2393:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1196(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2395
# %bb.2394:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1196(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2395:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1197(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2397
# %bb.2396:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1197(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2397:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1198(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2399
# %bb.2398:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1198(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2399:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1199(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2401
# %bb.2400:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1199(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2401:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1200(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2403
# %bb.2402:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1200(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2403:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1201(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2405
# %bb.2404:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1201(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2405:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1202(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2407
# %bb.2406:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1202(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2407:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1203(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2409
# %bb.2408:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1203(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2409:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1204(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2411
# %bb.2410:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1204(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2411:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1205(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2413
# %bb.2412:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1205(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2413:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1206(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2415
# %bb.2414:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1206(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2415:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1207(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2417
# %bb.2416:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1207(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2417:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1208(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2419
# %bb.2418:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1208(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2419:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1209(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2421
# %bb.2420:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1209(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2421:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1210(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2423
# %bb.2422:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1210(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2423:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1211(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2425
# %bb.2424:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1211(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2425:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1212(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2427
# %bb.2426:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1212(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2427:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1213(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2429
# %bb.2428:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1213(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2429:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1214(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2431
# %bb.2430:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1214(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2431:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1215(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2433
# %bb.2432:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1215(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2433:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1216(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2435
# %bb.2434:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1216(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2435:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1217(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2437
# %bb.2436:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1217(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2437:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1218(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2439
# %bb.2438:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1218(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2439:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1219(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2441
# %bb.2440:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1219(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2441:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1220(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2443
# %bb.2442:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1220(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2443:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1221(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2445
# %bb.2444:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1221(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2445:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1222(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2447
# %bb.2446:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1222(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2447:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1223(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2449
# %bb.2448:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1223(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2449:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1224(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2451
# %bb.2450:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1224(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2451:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1225(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2453
# %bb.2452:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1225(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2453:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1226(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2455
# %bb.2454:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1226(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2455:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1227(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2457
# %bb.2456:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1227(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2457:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1228(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2459
# %bb.2458:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1228(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2459:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1229(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2461
# %bb.2460:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1229(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2461:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1230(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2463
# %bb.2462:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1230(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2463:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1231(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2465
# %bb.2464:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1231(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2465:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1232(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2467
# %bb.2466:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1232(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2467:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1233(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2469
# %bb.2468:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1233(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2469:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1234(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2471
# %bb.2470:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1234(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2471:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1235(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2473
# %bb.2472:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1235(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2473:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1236(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2475
# %bb.2474:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1236(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2475:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1237(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2477
# %bb.2476:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1237(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2477:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1238(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2479
# %bb.2478:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1238(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2479:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1239(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2481
# %bb.2480:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1239(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2481:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1240(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2483
# %bb.2482:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1240(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2483:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1241(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2485
# %bb.2484:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1241(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2485:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1242(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2487
# %bb.2486:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1242(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2487:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1243(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2489
# %bb.2488:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1243(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2489:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1244(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2491
# %bb.2490:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1244(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2491:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1245(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2493
# %bb.2492:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1245(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2493:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1246(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2495
# %bb.2494:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1246(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2495:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1247(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2497
# %bb.2496:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1247(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2497:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1248(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2499
# %bb.2498:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1248(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
.LBB3_2499:                             #   in Loop: Header=BB3_1 Depth=1
	callq	randombit
	movb	%al, 1249(%r15,%r12)
	testb	%al, %al
	jne	.LBB3_2501
# %bb.2500:                             #   in Loop: Header=BB3_1 Depth=1
	leaq	1249(%r12), %rax
	shlq	$4, %rax
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%r14,%rax)
	jmp	.LBB3_2501
.LBB3_2502:
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	prepare_inputs, .Lfunc_end3-prepare_inputs
	.cfi_endproc
                                        # -- End function
	.globl	br_md5_init             # -- Begin function br_md5_init
	.p2align	4, 0x90
	.type	br_md5_init,@function
br_md5_init:                            # @br_md5_init
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	$br_md5_vtable, (%rdi)
	movaps	br_md5_IV(%rip), %xmm0
	movups	%xmm0, 80(%rdi)
	movq	$0, 72(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	br_md5_init, .Lfunc_end4-br_md5_init
	.cfi_endproc
                                        # -- End function
	.globl	br_md5_update           # -- Begin function br_md5_update
	.p2align	4, 0x90
	.type	br_md5_update,@function
br_md5_update:                          # @br_md5_update
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
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, -48(%rbp)         # 8-byte Spill
	testq	%rdx, %rdx
	je	.LBB5_26
# %bb.1:                                # %.lr.ph.preheader
	movq	%rdx, %r13
	movq	%rsi, %r14
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	72(%rax), %r15
	andl	$63, %r15d
	leaq	8(%rax), %rcx
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	addq	$80, %rax
	movq	%rax, -56(%rbp)         # 8-byte Spill
	jmp	.LBB5_2
	.p2align	4, 0x90
.LBB5_25:                               #   in Loop: Header=BB5_2 Depth=1
	addq	%rbx, %r14
	testq	%r13, %r13
	je	.LBB5_26
.LBB5_2:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movl	$64, %r12d
	subq	%r15, %r12
	cmpq	%r13, %r12
	cmovaq	%r13, %r12
	movq	-48(%rbp), %rbx         # 8-byte Reload
	leaq	(%rbx,%r15), %rdi
	addq	$8, %rdi
	movq	%r14, %rsi
	movq	%r12, %rdx
	callq	memcpy
	addq	%r12, %r15
	subq	%r12, %r13
	addq	%r12, 72(%rbx)
	cmpq	$64, %r15
	jne	.LBB5_4
# %bb.3:                                #   in Loop: Header=BB5_2 Depth=1
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movq	-56(%rbp), %rsi         # 8-byte Reload
	callq	br_md5_round
	xorl	%r15d, %r15d
.LBB5_4:                                #   in Loop: Header=BB5_2 Depth=1
	testq	%r13, %r13
	je	.LBB5_26
# %bb.5:                                #   in Loop: Header=BB5_2 Depth=1
	addq	%r12, %r14
	movl	$64, %ebx
	subq	%r15, %rbx
	cmpq	%r13, %rbx
	cmovaq	%r13, %rbx
	movq	-48(%rbp), %r12         # 8-byte Reload
	leaq	(%r12,%r15), %rdi
	addq	$8, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	memcpy
	addq	%rbx, %r15
	subq	%rbx, %r13
	addq	%rbx, 72(%r12)
	cmpq	$64, %r15
	jne	.LBB5_7
# %bb.6:                                #   in Loop: Header=BB5_2 Depth=1
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movq	-56(%rbp), %rsi         # 8-byte Reload
	callq	br_md5_round
	xorl	%r15d, %r15d
.LBB5_7:                                #   in Loop: Header=BB5_2 Depth=1
	testq	%r13, %r13
	je	.LBB5_26
# %bb.8:                                #   in Loop: Header=BB5_2 Depth=1
	addq	%rbx, %r14
	movl	$64, %ebx
	subq	%r15, %rbx
	cmpq	%r13, %rbx
	cmovaq	%r13, %rbx
	movq	-48(%rbp), %r12         # 8-byte Reload
	leaq	(%r12,%r15), %rdi
	addq	$8, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	memcpy
	addq	%rbx, %r15
	subq	%rbx, %r13
	addq	%rbx, 72(%r12)
	cmpq	$64, %r15
	jne	.LBB5_10
# %bb.9:                                #   in Loop: Header=BB5_2 Depth=1
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movq	-56(%rbp), %rsi         # 8-byte Reload
	callq	br_md5_round
	xorl	%r15d, %r15d
.LBB5_10:                               #   in Loop: Header=BB5_2 Depth=1
	testq	%r13, %r13
	je	.LBB5_26
# %bb.11:                               #   in Loop: Header=BB5_2 Depth=1
	addq	%rbx, %r14
	movl	$64, %ebx
	subq	%r15, %rbx
	cmpq	%r13, %rbx
	cmovaq	%r13, %rbx
	movq	-48(%rbp), %r12         # 8-byte Reload
	leaq	(%r12,%r15), %rdi
	addq	$8, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	memcpy
	addq	%rbx, %r15
	subq	%rbx, %r13
	addq	%rbx, 72(%r12)
	cmpq	$64, %r15
	jne	.LBB5_13
# %bb.12:                               #   in Loop: Header=BB5_2 Depth=1
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movq	-56(%rbp), %rsi         # 8-byte Reload
	callq	br_md5_round
	xorl	%r15d, %r15d
.LBB5_13:                               #   in Loop: Header=BB5_2 Depth=1
	testq	%r13, %r13
	je	.LBB5_26
# %bb.14:                               #   in Loop: Header=BB5_2 Depth=1
	addq	%rbx, %r14
	movl	$64, %ebx
	subq	%r15, %rbx
	cmpq	%r13, %rbx
	cmovaq	%r13, %rbx
	movq	-48(%rbp), %r12         # 8-byte Reload
	leaq	(%r12,%r15), %rdi
	addq	$8, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	memcpy
	addq	%rbx, %r15
	subq	%rbx, %r13
	addq	%rbx, 72(%r12)
	cmpq	$64, %r15
	jne	.LBB5_16
# %bb.15:                               #   in Loop: Header=BB5_2 Depth=1
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movq	-56(%rbp), %rsi         # 8-byte Reload
	callq	br_md5_round
	xorl	%r15d, %r15d
.LBB5_16:                               #   in Loop: Header=BB5_2 Depth=1
	testq	%r13, %r13
	je	.LBB5_26
# %bb.17:                               #   in Loop: Header=BB5_2 Depth=1
	addq	%rbx, %r14
	movl	$64, %ebx
	subq	%r15, %rbx
	cmpq	%r13, %rbx
	cmovaq	%r13, %rbx
	movq	-48(%rbp), %r12         # 8-byte Reload
	leaq	(%r12,%r15), %rdi
	addq	$8, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	memcpy
	addq	%rbx, %r15
	subq	%rbx, %r13
	addq	%rbx, 72(%r12)
	cmpq	$64, %r15
	jne	.LBB5_19
# %bb.18:                               #   in Loop: Header=BB5_2 Depth=1
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movq	-56(%rbp), %rsi         # 8-byte Reload
	callq	br_md5_round
	xorl	%r15d, %r15d
.LBB5_19:                               #   in Loop: Header=BB5_2 Depth=1
	testq	%r13, %r13
	je	.LBB5_26
# %bb.20:                               #   in Loop: Header=BB5_2 Depth=1
	addq	%rbx, %r14
	movl	$64, %ebx
	subq	%r15, %rbx
	cmpq	%r13, %rbx
	cmovaq	%r13, %rbx
	movq	-48(%rbp), %r12         # 8-byte Reload
	leaq	(%r12,%r15), %rdi
	addq	$8, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	memcpy
	addq	%rbx, %r15
	subq	%rbx, %r13
	addq	%rbx, 72(%r12)
	cmpq	$64, %r15
	jne	.LBB5_22
# %bb.21:                               #   in Loop: Header=BB5_2 Depth=1
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movq	-56(%rbp), %rsi         # 8-byte Reload
	callq	br_md5_round
	xorl	%r15d, %r15d
.LBB5_22:                               #   in Loop: Header=BB5_2 Depth=1
	testq	%r13, %r13
	je	.LBB5_26
# %bb.23:                               #   in Loop: Header=BB5_2 Depth=1
	addq	%rbx, %r14
	movl	$64, %ebx
	subq	%r15, %rbx
	cmpq	%r13, %rbx
	cmovaq	%r13, %rbx
	movq	-48(%rbp), %r12         # 8-byte Reload
	leaq	(%r12,%r15), %rdi
	addq	$8, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	memcpy
	addq	%rbx, %r15
	subq	%rbx, %r13
	addq	%rbx, 72(%r12)
	cmpq	$64, %r15
	jne	.LBB5_25
# %bb.24:                               #   in Loop: Header=BB5_2 Depth=1
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movq	-56(%rbp), %rsi         # 8-byte Reload
	callq	br_md5_round
	xorl	%r15d, %r15d
	jmp	.LBB5_25
.LBB5_26:                               # %._crit_edge
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	br_md5_update, .Lfunc_end5-br_md5_update
	.cfi_endproc
                                        # -- End function
	.globl	br_md5_out              # -- Begin function br_md5_out
	.p2align	4, 0x90
	.type	br_md5_out,@function
br_md5_out:                             # @br_md5_out
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
	subq	$88, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movq	%rdi, %r15
	movq	%fs:40, %rax
	movq	%rax, -32(%rbp)
	movq	72(%rdi), %rbx
	andl	$63, %ebx
	leaq	8(%rdi), %rsi
	leaq	-96(%rbp), %rdi
	movq	%rbx, %rdx
	callq	memcpy
	movups	80(%r15), %xmm0
	movaps	%xmm0, -112(%rbp)
	movb	$-128, -96(%rbp,%rbx)
	leaq	(%rbx,%rbp), %rdi
	addq	$-95, %rdi
	cmpq	$56, %rbx
	jb	.LBB6_2
# %bb.1:
	xorq	$63, %rbx
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	memset
	leaq	-96(%rbp), %rdi
	leaq	-112(%rbp), %rsi
	callq	br_md5_round
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	%xmm0, -80(%rbp)
	movaps	%xmm0, -96(%rbp)
	movq	$0, -48(%rbp)
	jmp	.LBB6_3
.LBB6_2:
	movl	$55, %edx
	subq	%rbx, %rdx
	xorl	%esi, %esi
	callq	memset
.LBB6_3:
	leaq	-40(%rbp), %rdi
	movq	72(%r15), %rsi
	shlq	$3, %rsi
	callq	br_enc64le
	leaq	-96(%rbp), %rdi
	leaq	-112(%rbp), %rbx
	movq	%rbx, %rsi
	callq	br_md5_round
	movl	$4, %edx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	br_range_enc32le
	movq	%fs:40, %rax
	cmpq	-32(%rbp), %rax
	jne	.LBB6_5
# %bb.4:                                # %SP_return
	addq	$88, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB6_5:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end6:
	.size	br_md5_out, .Lfunc_end6-br_md5_out
	.cfi_endproc
                                        # -- End function
	.globl	br_md5_state            # -- Begin function br_md5_state
	.p2align	4, 0x90
	.type	br_md5_state,@function
br_md5_state:                           # @br_md5_state
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
	movq	%rsi, %rax
	movq	%rdi, %rbx
	leaq	80(%rdi), %rsi
	movl	$4, %edx
	movq	%rax, %rdi
	callq	br_range_enc32le
	movq	72(%rbx), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end7:
	.size	br_md5_state, .Lfunc_end7-br_md5_state
	.cfi_endproc
                                        # -- End function
	.globl	br_md5_set_state        # -- Begin function br_md5_set_state
	.p2align	4, 0x90
	.type	br_md5_set_state,@function
br_md5_set_state:                       # @br_md5_set_state
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
	movq	%rdx, %r14
	movq	%rsi, %rdx
	movq	%rdi, %rbx
	addq	$80, %rdi
	callq	br_range_dec32le
	movq	%r14, 72(%rbx)
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end8:
	.size	br_md5_set_state, .Lfunc_end8-br_md5_set_state
	.cfi_endproc
                                        # -- End function
	.globl	br_md5_round            # -- Begin function br_md5_round
	.p2align	4, 0x90
	.type	br_md5_round,@function
br_md5_round:                           # @br_md5_round
	.cfi_startproc
# %bb.0:                                # %.preheader18
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
	subq	$136, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %rdx
	movq	%fs:40, %rax
	movq	%rax, -48(%rbp)
	movq	%rsi, -176(%rbp)        # 8-byte Spill
	movl	(%rsi), %r13d
	movl	4(%rsi), %r14d
	movl	8(%rsi), %r15d
	movl	12(%rsi), %r12d
	leaq	-112(%rbp), %rdi
	callq	br_range_dec32le
	movl	%r12d, %eax
	xorl	%r15d, %eax
	andl	%r14d, %eax
	xorl	%r12d, %eax
	movl	-112(%rbp), %edx
	movl	%edx, -144(%rbp)        # 4-byte Spill
	movl	-108(%rbp), %r11d
	addl	%edx, %r13d
	leal	(%rax,%r13), %esi
	addl	$-680876936, %esi       # imm = 0xD76AA478
	roll	$7, %esi
	addl	%r14d, %esi
	movl	%r15d, %eax
	xorl	%r14d, %eax
	andl	%esi, %eax
	xorl	%r15d, %eax
	addl	%r11d, %r12d
	movl	%r11d, -136(%rbp)       # 4-byte Spill
	addl	%r12d, %eax
	addl	$-389564586, %eax       # imm = 0xE8C7B756
	roll	$12, %eax
	addl	%esi, %eax
	movl	%esi, %ecx
	xorl	%r14d, %ecx
	andl	%eax, %ecx
	xorl	%r14d, %ecx
	movl	-104(%rbp), %edx
	movl	%edx, -132(%rbp)        # 4-byte Spill
	addl	%edx, %r15d
	addl	%r15d, %ecx
	addl	$606105819, %ecx        # imm = 0x242070DB
	roll	$17, %ecx
	addl	%eax, %ecx
	movl	%eax, %edx
	xorl	%esi, %edx
	andl	%ecx, %edx
	xorl	%esi, %edx
	movl	-100(%rbp), %edi
	addl	%edi, %r14d
	movl	%edi, %r15d
	addl	%r14d, %edx
	addl	$-1044525330, %edx      # imm = 0xC1BDCEEE
	roll	$22, %edx
	addl	%ecx, %edx
	movl	%ecx, %edi
	xorl	%eax, %edi
	andl	%edx, %edi
	xorl	%eax, %edi
	movl	-96(%rbp), %ebx
	movl	%ebx, -128(%rbp)        # 4-byte Spill
	addl	%ebx, %esi
	addl	%esi, %edi
	addl	$-176418897, %edi       # imm = 0xF57C0FAF
	roll	$7, %edi
	addl	%edx, %edi
	movl	%edx, %esi
	xorl	%ecx, %esi
	andl	%edi, %esi
	xorl	%ecx, %esi
	movl	-92(%rbp), %ebx
	movl	%ebx, -116(%rbp)        # 4-byte Spill
	addl	%ebx, %eax
	addl	%esi, %eax
	addl	$1200080426, %eax       # imm = 0x4787C62A
	roll	$12, %eax
	addl	%edi, %eax
	movl	%edi, %esi
	xorl	%edx, %esi
	andl	%eax, %esi
	xorl	%edx, %esi
	movl	-88(%rbp), %r10d
	addl	%r10d, %ecx
	movl	%r10d, -168(%rbp)       # 4-byte Spill
	addl	%esi, %ecx
	addl	$-1473231341, %ecx      # imm = 0xA8304613
	roll	$17, %ecx
	addl	%eax, %ecx
	movl	%eax, %esi
	xorl	%edi, %esi
	andl	%ecx, %esi
	xorl	%edi, %esi
	movl	-84(%rbp), %ebx
	movl	%ebx, -164(%rbp)        # 4-byte Spill
	addl	%ebx, %edx
	addl	%esi, %edx
	addl	$-45705983, %edx        # imm = 0xFD469501
	roll	$22, %edx
	addl	%ecx, %edx
	movl	%ecx, %esi
	xorl	%eax, %esi
	andl	%edx, %esi
	xorl	%eax, %esi
	movl	-80(%rbp), %ebx
	movl	%ebx, -124(%rbp)        # 4-byte Spill
	addl	%ebx, %edi
	leal	(%rsi,%rdi), %r8d
	addl	$1770035416, %r8d       # imm = 0x698098D8
	roll	$7, %r8d
	addl	%edx, %r8d
	movl	%edx, %esi
	xorl	%ecx, %esi
	andl	%r8d, %esi
	xorl	%ecx, %esi
	movl	-76(%rbp), %edi
	addl	%edi, %eax
	movl	%edi, %r12d
	movl	%edi, -120(%rbp)        # 4-byte Spill
	addl	%eax, %esi
	addl	$-1958414417, %esi      # imm = 0x8B44F7AF
	roll	$12, %esi
	addl	%r8d, %esi
	movl	%r8d, %eax
	xorl	%edx, %eax
	andl	%esi, %eax
	xorl	%edx, %eax
	movl	-72(%rbp), %edi
	addl	%edi, %ecx
	movl	%edi, %r14d
	movl	%edi, -152(%rbp)        # 4-byte Spill
	addl	%ecx, %eax
	addl	$-42063, %eax           # imm = 0xFFFF5BB1
	roll	$17, %eax
	addl	%esi, %eax
	movl	%esi, %ecx
	xorl	%r8d, %ecx
	andl	%eax, %ecx
	xorl	%r8d, %ecx
	movl	-68(%rbp), %r9d
	addl	%r9d, %edx
	movl	%r9d, -140(%rbp)        # 4-byte Spill
	addl	%ecx, %edx
	addl	$-1990404162, %edx      # imm = 0x895CD7BE
	roll	$22, %edx
	addl	%eax, %edx
	movl	%eax, %ecx
	xorl	%esi, %ecx
	andl	%edx, %ecx
	xorl	%esi, %ecx
	movl	-64(%rbp), %edi
	movl	%edi, -156(%rbp)        # 4-byte Spill
	addl	%edi, %r8d
	addl	%r8d, %ecx
	addl	$1804603682, %ecx       # imm = 0x6B901122
	roll	$7, %ecx
	addl	%edx, %ecx
	movl	%edx, %edi
	xorl	%eax, %edi
	andl	%ecx, %edi
	xorl	%eax, %edi
	movl	-60(%rbp), %ebx
	addl	%ebx, %esi
	movl	%ebx, %r8d
	addl	%edi, %esi
	addl	$-40341101, %esi        # imm = 0xFD987193
	roll	$12, %esi
	addl	%ecx, %esi
	movl	%ecx, %edi
	xorl	%edx, %edi
	andl	%esi, %edi
	xorl	%edx, %edi
	movl	-56(%rbp), %ebx
	addl	%ebx, %eax
	movl	%ebx, %r13d
	addl	%edi, %eax
	addl	$-1502002290, %eax      # imm = 0xA679438E
	roll	$17, %eax
	addl	%esi, %eax
	movl	%esi, %edi
	xorl	%ecx, %edi
	andl	%eax, %edi
	xorl	%ecx, %edi
	movl	-52(%rbp), %ebx
	addl	%ebx, %edx
	movl	%ebx, -160(%rbp)        # 4-byte Spill
	addl	%edi, %edx
	addl	$1236535329, %edx       # imm = 0x49B40821
	roll	$22, %edx
	addl	%eax, %edx
	movl	%edx, %edi
	xorl	%eax, %edi
	andl	%esi, %edi
	xorl	%eax, %edi
	addl	%r11d, %ecx
	addl	%edi, %ecx
	addl	$-165796510, %ecx       # imm = 0xF61E2562
	roll	$5, %ecx
	addl	%edx, %ecx
	movl	%ecx, %edi
	xorl	%edx, %edi
	andl	%eax, %edi
	xorl	%edx, %edi
	addl	%r10d, %esi
	addl	%edi, %esi
	addl	$-1069501632, %esi      # imm = 0xC040B340
	roll	$9, %esi
	addl	%ecx, %esi
	movl	%esi, %edi
	xorl	%ecx, %edi
	andl	%edx, %edi
	xorl	%ecx, %edi
	addl	%r9d, %eax
	addl	%edi, %eax
	addl	$643717713, %eax        # imm = 0x265E5A51
	roll	$14, %eax
	addl	%esi, %eax
	movl	%eax, %edi
	xorl	%esi, %edi
	andl	%ecx, %edi
	xorl	%esi, %edi
	addl	-144(%rbp), %edx        # 4-byte Folded Reload
	addl	%edi, %edx
	addl	$-373897302, %edx       # imm = 0xE9B6C7AA
	roll	$20, %edx
	addl	%eax, %edx
	movl	%edx, %edi
	xorl	%eax, %edi
	andl	%esi, %edi
	xorl	%eax, %edi
	movl	-116(%rbp), %r10d       # 4-byte Reload
	addl	%r10d, %ecx
	addl	%edi, %ecx
	addl	$-701558691, %ecx       # imm = 0xD62F105D
	roll	$5, %ecx
	addl	%edx, %ecx
	movl	%ecx, %edi
	xorl	%edx, %edi
	andl	%eax, %edi
	xorl	%edx, %edi
	addl	%r14d, %esi
	addl	%edi, %esi
	addl	$38016083, %esi         # imm = 0x2441453
	roll	$9, %esi
	addl	%ecx, %esi
	movl	%esi, %edi
	xorl	%ecx, %edi
	andl	%edx, %edi
	xorl	%ecx, %edi
	addl	%ebx, %eax
	addl	%edi, %eax
	addl	$-660478335, %eax       # imm = 0xD8A1E681
	roll	$14, %eax
	addl	%esi, %eax
	movl	%eax, %edi
	xorl	%esi, %edi
	andl	%ecx, %edi
	xorl	%esi, %edi
	movl	-128(%rbp), %r11d       # 4-byte Reload
	addl	%r11d, %edx
	addl	%edi, %edx
	addl	$-405537848, %edx       # imm = 0xE7D3FBC8
	roll	$20, %edx
	addl	%eax, %edx
	movl	%edx, %edi
	xorl	%eax, %edi
	andl	%esi, %edi
	xorl	%eax, %edi
	addl	%r12d, %ecx
	addl	%edi, %ecx
	addl	$568446438, %ecx        # imm = 0x21E1CDE6
	roll	$5, %ecx
	addl	%edx, %ecx
	movl	%ecx, %edi
	xorl	%edx, %edi
	andl	%eax, %edi
	xorl	%edx, %edi
	addl	%r13d, %esi
	movl	%r13d, -148(%rbp)       # 4-byte Spill
	addl	%edi, %esi
	addl	$-1019803690, %esi      # imm = 0xC33707D6
	roll	$9, %esi
	addl	%ecx, %esi
	movl	%esi, %edi
	xorl	%ecx, %edi
	andl	%edx, %edi
	xorl	%ecx, %edi
	movl	%r15d, %r14d
	addl	%r15d, %eax
	addl	%edi, %eax
	addl	$-187363961, %eax       # imm = 0xF4D50D87
	roll	$14, %eax
	addl	%esi, %eax
	movl	%eax, %edi
	xorl	%esi, %edi
	andl	%ecx, %edi
	xorl	%esi, %edi
	movl	-124(%rbp), %ebx        # 4-byte Reload
	addl	%ebx, %edx
	addl	%edi, %edx
	addl	$1163531501, %edx       # imm = 0x455A14ED
	roll	$20, %edx
	addl	%eax, %edx
	movl	%edx, %edi
	xorl	%eax, %edi
	andl	%esi, %edi
	xorl	%eax, %edi
	addl	%r8d, %ecx
	movl	%r8d, %r15d
	addl	%edi, %ecx
	addl	$-1444681467, %ecx      # imm = 0xA9E3E905
	roll	$5, %ecx
	addl	%edx, %ecx
	movl	%ecx, %edi
	xorl	%edx, %edi
	andl	%eax, %edi
	xorl	%edx, %edi
	addl	-132(%rbp), %esi        # 4-byte Folded Reload
	addl	%edi, %esi
	addl	$-51403784, %esi        # imm = 0xFCEFA3F8
	roll	$9, %esi
	addl	%ecx, %esi
	movl	%esi, %edi
	xorl	%ecx, %edi
	andl	%edx, %edi
	xorl	%ecx, %edi
	movl	-164(%rbp), %r9d        # 4-byte Reload
	addl	%r9d, %eax
	leal	(%rdi,%rax), %r8d
	addl	$1735328473, %r8d       # imm = 0x676F02D9
	roll	$14, %r8d
	addl	%esi, %r8d
	movl	%r8d, %eax
	xorl	%esi, %eax
	movl	%eax, %edi
	andl	%ecx, %edi
	xorl	%esi, %edi
	movl	-156(%rbp), %r12d       # 4-byte Reload
	addl	%r12d, %edx
	addl	%edx, %edi
	addl	$-1926607734, %edi      # imm = 0x8D2A4C8A
	roll	$20, %edi
	addl	%r8d, %edi
	xorl	%edi, %eax
	addl	%r10d, %ecx
	addl	%eax, %ecx
	addl	$-378558, %ecx          # imm = 0xFFFA3942
	roll	$4, %ecx
	addl	%edi, %ecx
	movl	%edi, %eax
	xorl	%r8d, %eax
	xorl	%ecx, %eax
	addl	%ebx, %esi
	leal	(%rax,%rsi), %edx
	addl	$-2022574463, %edx      # imm = 0x8771F681
	roll	$11, %edx
	addl	%ecx, %edx
	movl	%ecx, %eax
	xorl	%edi, %eax
	xorl	%edx, %eax
	addl	-140(%rbp), %r8d        # 4-byte Folded Reload
	addl	%r8d, %eax
	addl	$1839030562, %eax       # imm = 0x6D9D6122
	roll	$16, %eax
	addl	%edx, %eax
	movl	%edx, %esi
	xorl	%ecx, %esi
	xorl	%eax, %esi
	addl	%r13d, %edi
	addl	%edi, %esi
	addl	$-35309556, %esi        # imm = 0xFDE5380C
	roll	$23, %esi
	addl	%eax, %esi
	movl	%eax, %edi
	xorl	%edx, %edi
	xorl	%esi, %edi
	addl	-136(%rbp), %ecx        # 4-byte Folded Reload
	addl	%edi, %ecx
	addl	$-1530992060, %ecx      # imm = 0xA4BEEA44
	roll	$4, %ecx
	addl	%esi, %ecx
	movl	%esi, %edi
	xorl	%eax, %edi
	xorl	%ecx, %edi
	addl	%r11d, %edx
	addl	%edi, %edx
	addl	$1272893353, %edx       # imm = 0x4BDECFA9
	roll	$11, %edx
	addl	%ecx, %edx
	movl	%ecx, %edi
	xorl	%esi, %edi
	xorl	%edx, %edi
	addl	%r9d, %eax
	movl	%r9d, %r13d
	addl	%edi, %eax
	addl	$-155497632, %eax       # imm = 0xF6BB4B60
	roll	$16, %eax
	addl	%edx, %eax
	movl	%edx, %edi
	xorl	%ecx, %edi
	xorl	%eax, %edi
	movl	-152(%rbp), %r11d       # 4-byte Reload
	addl	%r11d, %esi
	addl	%edi, %esi
	addl	$-1094730640, %esi      # imm = 0xBEBFBC70
	roll	$23, %esi
	addl	%eax, %esi
	movl	%eax, %edi
	xorl	%edx, %edi
	xorl	%esi, %edi
	addl	%r15d, %ecx
	addl	%edi, %ecx
	addl	$681279174, %ecx        # imm = 0x289B7EC6
	roll	$4, %ecx
	addl	%esi, %ecx
	movl	%esi, %edi
	xorl	%eax, %edi
	xorl	%ecx, %edi
	movl	-144(%rbp), %r8d        # 4-byte Reload
	addl	%r8d, %edx
	addl	%edi, %edx
	addl	$-358537222, %edx       # imm = 0xEAA127FA
	roll	$11, %edx
	addl	%ecx, %edx
	movl	%ecx, %edi
	xorl	%esi, %edi
	xorl	%edx, %edi
	addl	%r14d, %eax
	addl	%edi, %eax
	addl	$-722521979, %eax       # imm = 0xD4EF3085
	roll	$16, %eax
	addl	%edx, %eax
	movl	%edx, %edi
	xorl	%ecx, %edi
	xorl	%eax, %edi
	movl	-168(%rbp), %ebx        # 4-byte Reload
	addl	%ebx, %esi
	addl	%edi, %esi
	addl	$76029189, %esi         # imm = 0x4881D05
	roll	$23, %esi
	addl	%eax, %esi
	movl	%eax, %edi
	xorl	%edx, %edi
	xorl	%esi, %edi
	addl	-120(%rbp), %ecx        # 4-byte Folded Reload
	addl	%edi, %ecx
	addl	$-640364487, %ecx       # imm = 0xD9D4D039
	roll	$4, %ecx
	addl	%esi, %ecx
	movl	%esi, %edi
	xorl	%eax, %edi
	xorl	%ecx, %edi
	movl	%r12d, %r9d
	addl	%r12d, %edx
	addl	%edi, %edx
	addl	$-421815835, %edx       # imm = 0xE6DB99E5
	roll	$11, %edx
	addl	%ecx, %edx
	movl	%ecx, %edi
	xorl	%esi, %edi
	xorl	%edx, %edi
	movl	-160(%rbp), %r10d       # 4-byte Reload
	addl	%r10d, %eax
	addl	%edi, %eax
	addl	$530742520, %eax        # imm = 0x1FA27CF8
	roll	$16, %eax
	addl	%edx, %eax
	movl	%edx, %edi
	xorl	%ecx, %edi
	xorl	%eax, %edi
	movl	-132(%rbp), %r12d       # 4-byte Reload
	addl	%r12d, %esi
	addl	%esi, %edi
	addl	$-995338651, %edi       # imm = 0xC4AC5665
	roll	$23, %edi
	addl	%r8d, %ecx
	addl	%eax, %edi
	movl	%edx, %esi
	notl	%esi
	orl	%edi, %esi
	xorl	%eax, %esi
	addl	%esi, %ecx
	addl	$-198630844, %ecx       # imm = 0xF4292244
	roll	$6, %ecx
	addl	%r13d, %edx
	addl	%edi, %ecx
	movl	%eax, %esi
	notl	%esi
	orl	%ecx, %esi
	xorl	%edi, %esi
	addl	%esi, %edx
	addl	$1126891415, %edx       # imm = 0x432AFF97
	roll	$10, %edx
	addl	-148(%rbp), %eax        # 4-byte Folded Reload
	addl	%ecx, %edx
	movl	%edi, %esi
	notl	%esi
	orl	%edx, %esi
	xorl	%ecx, %esi
	addl	%eax, %esi
	addl	$-1416354905, %esi      # imm = 0xAB9423A7
	roll	$15, %esi
	addl	-116(%rbp), %edi        # 4-byte Folded Reload
	addl	%edx, %esi
	movl	%ecx, %eax
	notl	%eax
	orl	%esi, %eax
	xorl	%edx, %eax
	addl	%edi, %eax
	addl	$-57434055, %eax        # imm = 0xFC93A039
	roll	$21, %eax
	addl	%r9d, %ecx
	addl	%esi, %eax
	movl	%edx, %edi
	notl	%edi
	orl	%eax, %edi
	xorl	%esi, %edi
	addl	%edi, %ecx
	addl	$1700485571, %ecx       # imm = 0x655B59C3
	roll	$6, %ecx
	addl	%r14d, %edx
	addl	%eax, %ecx
	movl	%esi, %edi
	notl	%edi
	orl	%ecx, %edi
	xorl	%eax, %edi
	addl	%edi, %edx
	addl	$-1894986606, %edx      # imm = 0x8F0CCC92
	roll	$10, %edx
	addl	%r11d, %esi
	addl	%ecx, %edx
	movl	%eax, %edi
	notl	%edi
	orl	%edx, %edi
	xorl	%ecx, %edi
	addl	%edi, %esi
	addl	$-1051523, %esi         # imm = 0xFFEFF47D
	roll	$15, %esi
	addl	-136(%rbp), %eax        # 4-byte Folded Reload
	addl	%edx, %esi
	movl	%ecx, %edi
	notl	%edi
	orl	%esi, %edi
	xorl	%edx, %edi
	addl	%edi, %eax
	addl	$-2054922799, %eax      # imm = 0x85845DD1
	roll	$21, %eax
	addl	%esi, %eax
	addl	-124(%rbp), %ecx        # 4-byte Folded Reload
	movl	%edx, %edi
	notl	%edi
	orl	%eax, %edi
	xorl	%esi, %edi
	addl	%edi, %ecx
	addl	$1873313359, %ecx       # imm = 0x6FA87E4F
	roll	$6, %ecx
	addl	%eax, %ecx
	addl	%r10d, %edx
	movl	%esi, %edi
	notl	%edi
	orl	%ecx, %edi
	xorl	%eax, %edi
	addl	%edi, %edx
	addl	$-30611744, %edx        # imm = 0xFE2CE6E0
	roll	$10, %edx
	addl	%ecx, %edx
	addl	%ebx, %esi
	movl	%eax, %edi
	notl	%edi
	orl	%edx, %edi
	xorl	%ecx, %edi
	addl	%edi, %esi
	addl	$-1560198380, %esi      # imm = 0xA3014314
	roll	$15, %esi
	addl	%edx, %esi
	addl	%r15d, %eax
	movl	%ecx, %edi
	notl	%edi
	orl	%esi, %edi
	xorl	%edx, %edi
	addl	%edi, %eax
	addl	$1309151649, %eax       # imm = 0x4E0811A1
	roll	$21, %eax
	addl	%esi, %eax
	addl	-128(%rbp), %ecx        # 4-byte Folded Reload
	movl	%edx, %edi
	notl	%edi
	orl	%eax, %edi
	xorl	%esi, %edi
	addl	%edi, %ecx
	addl	$-145523070, %ecx       # imm = 0xF7537E82
	roll	$6, %ecx
	addl	%eax, %ecx
	addl	-140(%rbp), %edx        # 4-byte Folded Reload
	movl	%esi, %edi
	notl	%edi
	orl	%ecx, %edi
	xorl	%eax, %edi
	addl	%edi, %edx
	addl	$-1120210379, %edx      # imm = 0xBD3AF235
	roll	$10, %edx
	addl	%ecx, %edx
	addl	%r12d, %esi
	movl	%eax, %edi
	notl	%edi
	orl	%edx, %edi
	xorl	%ecx, %edi
	addl	%edi, %esi
	addl	$718787259, %esi        # imm = 0x2AD7D2BB
	roll	$15, %esi
	movq	-176(%rbp), %rdi        # 8-byte Reload
	addl	%ecx, (%rdi)
	addl	-120(%rbp), %eax        # 4-byte Folded Reload
	addl	%edx, %esi
                                        # kill: def $ecx killed $ecx def $rcx
	notl	%ecx
	orl	%esi, %ecx
	xorl	%edx, %ecx
	addl	%ecx, %eax
	addl	$-343485551, %eax       # imm = 0xEB86D391
	roll	$21, %eax
	movl	4(%rdi), %ecx
	addl	%esi, %ecx
	addl	%eax, %ecx
	movl	%ecx, 4(%rdi)
	addl	%esi, 8(%rdi)
	addl	%edx, 12(%rdi)
	movq	%fs:40, %rax
	cmpq	-48(%rbp), %rax
	jne	.LBB9_2
# %bb.1:                                # %SP_return
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB9_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end9:
	.size	br_md5_round, .Lfunc_end9-br_md5_round
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function br_enc64le
	.type	br_enc64le,@function
br_enc64le:                             # @br_enc64le
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rsi, (%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end10:
	.size	br_enc64le, .Lfunc_end10-br_enc64le
	.cfi_endproc
                                        # -- End function
	.globl	br_range_enc32le        # -- Begin function br_range_enc32le
	.p2align	4, 0x90
	.type	br_range_enc32le,@function
br_range_enc32le:                       # @br_range_enc32le
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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %rax
	subq	$1, %rax
	jb	.LBB11_9
# %bb.1:                                # %.lr.ph
	movq	%rdx, %r15
	movq	%rsi, %r14
	movq	%rdi, %r13
	andq	$7, %r15
	je	.LBB11_2
# %bb.3:                                # %.prol.preheader.preheader
	movq	%rax, %r12
	movq	%r15, %rbx
	.p2align	4, 0x90
.LBB11_4:                               # %.prol.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	(%r14), %esi
	addq	$4, %r14
	movq	%r13, %rdi
	callq	br_enc32le
	addq	$4, %r13
	addq	$-1, %rbx
	jne	.LBB11_4
# %bb.5:                                # %.prol.loopexit.loopexit
	movq	%r12, %rax
	subq	%r15, %r12
	cmpq	$7, %rax
	jae	.LBB11_7
	jmp	.LBB11_9
.LBB11_2:
	movq	%rax, %r12
	cmpq	$7, %rax
	jb	.LBB11_9
.LBB11_7:                               # %.lr.ph.new.preheader
	addq	$1, %r12
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB11_8:                               # %.lr.ph.new
                                        # =>This Inner Loop Header: Depth=1
	movl	(%r14,%rbx,4), %esi
	movq	%r13, %rdi
	callq	br_enc32le
	movl	4(%r14,%rbx,4), %esi
	leaq	4(%r13), %rdi
	callq	br_enc32le
	movl	8(%r14,%rbx,4), %esi
	leaq	8(%r13), %rdi
	callq	br_enc32le
	movl	12(%r14,%rbx,4), %esi
	leaq	12(%r13), %rdi
	callq	br_enc32le
	movl	16(%r14,%rbx,4), %esi
	leaq	16(%r13), %rdi
	callq	br_enc32le
	movl	20(%r14,%rbx,4), %esi
	leaq	20(%r13), %rdi
	callq	br_enc32le
	movl	24(%r14,%rbx,4), %esi
	leaq	24(%r13), %rdi
	callq	br_enc32le
	movl	28(%r14,%rbx,4), %esi
	leaq	28(%r13), %rdi
	callq	br_enc32le
	addq	$8, %rbx
	addq	$32, %r13
	cmpq	%rbx, %r12
	jne	.LBB11_8
.LBB11_9:                               # %._crit_edge
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end11:
	.size	br_range_enc32le, .Lfunc_end11-br_range_enc32le
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function br_enc32le
	.type	br_enc32le,@function
br_enc32le:                             # @br_enc32le
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%esi, (%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end12:
	.size	br_enc32le, .Lfunc_end12-br_enc32le
	.cfi_endproc
                                        # -- End function
	.globl	br_range_dec32le        # -- Begin function br_range_dec32le
	.p2align	4, 0x90
	.type	br_range_dec32le,@function
br_range_dec32le:                       # @br_range_dec32le
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
	movq	%rdx, %rbx
	movq	%rdi, %r14
	movq	%rdx, %rdi
	callq	br_dec32le
	movl	%eax, (%r14)
	leaq	4(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 4(%r14)
	leaq	8(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 8(%r14)
	leaq	12(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 12(%r14)
	leaq	16(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 16(%r14)
	leaq	20(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 20(%r14)
	leaq	24(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 24(%r14)
	leaq	28(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 28(%r14)
	leaq	32(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 32(%r14)
	leaq	36(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 36(%r14)
	leaq	40(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 40(%r14)
	leaq	44(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 44(%r14)
	leaq	48(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 48(%r14)
	leaq	52(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 52(%r14)
	leaq	56(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 56(%r14)
	leaq	60(%rbx), %rdi
	callq	br_dec32le
	movl	%eax, 60(%r14)
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end13:
	.size	br_range_dec32le, .Lfunc_end13-br_range_dec32le
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function br_dec32le
	.type	br_dec32le,@function
br_dec32le:                             # @br_dec32le
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	(%rdi), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end14:
	.size	br_dec32le, .Lfunc_end14-br_dec32le
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
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	testq	%rsi, %rsi
	js	.LBB15_31
# %bb.1:
	movq	%rsi, %r14
	movq	%rdi, %r15
	cmpl	$-1, randombytes.fd(%rip)
	jne	.LBB15_4
	jmp	.LBB15_2
	.p2align	4, 0x90
.LBB15_3:                               # %.lr.ph7
                                        #   in Loop: Header=BB15_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB15_4
# %bb.24:                               #   in Loop: Header=BB15_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB15_4
# %bb.25:                               #   in Loop: Header=BB15_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB15_4
# %bb.26:                               #   in Loop: Header=BB15_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB15_4
# %bb.27:                               #   in Loop: Header=BB15_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB15_4
# %bb.28:                               #   in Loop: Header=BB15_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB15_4
# %bb.29:                               #   in Loop: Header=BB15_2 Depth=1
	movl	$1, %edi
	callq	sleep
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	jne	.LBB15_4
# %bb.30:                               #   in Loop: Header=BB15_2 Depth=1
	movl	$1, %edi
	callq	sleep
.LBB15_2:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	open
	movl	%eax, randombytes.fd(%rip)
	cmpl	$-1, %eax
	je	.LBB15_3
.LBB15_4:                               # %.loopexit
	testq	%r14, %r14
	setg	%r12b
	jle	.LBB15_10
.LBB15_5:                               # %.lr.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB15_6 Depth 2
	cmpq	$1048577, %r14          # imm = 0x100001
	movl	$1048576, %ebx          # imm = 0x100000
	cmovlq	%r14, %rbx
.LBB15_6:                               #   Parent Loop BB15_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	randombytes.fd(%rip), %edi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	read
	testq	%rax, %rax
	jg	.LBB15_9
# %bb.7:                                #   in Loop: Header=BB15_6 Depth=2
	movl	$1, %edi
	callq	sleep
	testb	$1, %r12b
	je	.LBB15_10
# %bb.8:                                #   in Loop: Header=BB15_6 Depth=2
	movl	randombytes.fd(%rip), %edi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	read
	testq	%rax, %rax
	jg	.LBB15_9
# %bb.11:                               #   in Loop: Header=BB15_6 Depth=2
	movl	$1, %edi
	callq	sleep
	testb	$1, %r12b
	je	.LBB15_10
# %bb.12:                               #   in Loop: Header=BB15_6 Depth=2
	movl	randombytes.fd(%rip), %edi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	read
	testq	%rax, %rax
	jg	.LBB15_9
# %bb.13:                               #   in Loop: Header=BB15_6 Depth=2
	movl	$1, %edi
	callq	sleep
	testb	$1, %r12b
	je	.LBB15_10
# %bb.14:                               #   in Loop: Header=BB15_6 Depth=2
	movl	randombytes.fd(%rip), %edi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	read
	testq	%rax, %rax
	jg	.LBB15_9
# %bb.15:                               #   in Loop: Header=BB15_6 Depth=2
	movl	$1, %edi
	callq	sleep
	testb	$1, %r12b
	je	.LBB15_10
# %bb.16:                               #   in Loop: Header=BB15_6 Depth=2
	movl	randombytes.fd(%rip), %edi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	read
	testq	%rax, %rax
	jg	.LBB15_9
# %bb.17:                               #   in Loop: Header=BB15_6 Depth=2
	movl	$1, %edi
	callq	sleep
	testb	$1, %r12b
	je	.LBB15_10
# %bb.18:                               #   in Loop: Header=BB15_6 Depth=2
	movl	randombytes.fd(%rip), %edi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	read
	testq	%rax, %rax
	jg	.LBB15_9
# %bb.19:                               #   in Loop: Header=BB15_6 Depth=2
	movl	$1, %edi
	callq	sleep
	testb	$1, %r12b
	je	.LBB15_10
# %bb.20:                               #   in Loop: Header=BB15_6 Depth=2
	movl	randombytes.fd(%rip), %edi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	read
	testq	%rax, %rax
	jg	.LBB15_9
# %bb.21:                               #   in Loop: Header=BB15_6 Depth=2
	movl	$1, %edi
	callq	sleep
	testb	$1, %r12b
	je	.LBB15_10
# %bb.22:                               #   in Loop: Header=BB15_6 Depth=2
	movl	randombytes.fd(%rip), %edi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	read
	testq	%rax, %rax
	jg	.LBB15_9
# %bb.23:                               #   in Loop: Header=BB15_6 Depth=2
	movl	$1, %edi
	callq	sleep
	testb	$1, %r12b
	jne	.LBB15_6
	jmp	.LBB15_10
	.p2align	4, 0x90
.LBB15_9:                               # %.outer
                                        #   in Loop: Header=BB15_5 Depth=1
	addq	%rax, %r15
	movq	%r14, %rcx
	subq	%rax, %rcx
	testq	%rcx, %rcx
	setg	%r12b
	subq	%rax, %r14
	jg	.LBB15_5
.LBB15_10:                              # %.outer._crit_edge
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB15_31:
	.cfi_def_cfa %rbp, 16
	movl	$.L.str.17, %edi
	movl	$.L.str.1, %esi
	movl	$.L__PRETTY_FUNCTION__.randombytes, %ecx
	movl	$14, %edx
	callq	__assert_fail
.Lfunc_end15:
	.size	randombytes, .Lfunc_end15-randombytes
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
	jne	.LBB16_2
# %bb.1:                                # %SP_return
	andb	$1, %al
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB16_2:                               # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail
.Lfunc_end16:
	.size	randombit, .Lfunc_end16-randombit
	.cfi_endproc
                                        # -- End function
	.type	.L__const.main.input_data,@object # @__const.main.input_data
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.L__const.main.input_data:
	.ascii	"\223f[\375y\004\bV\333\232R\r\033\036F\300"
	.size	.L__const.main.input_data, 16

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d\n"
	.size	.L.str, 4

	.type	key,@object             # @key
	.bss
	.globl	key
	.p2align	4
key:
	.zero	256
	.size	key, 256

	.type	chunk_size,@object      # @chunk_size
	.section	.rodata,"a",@progbits
	.globl	chunk_size
	.p2align	3
chunk_size:
	.quad	16                      # 0x10
	.size	chunk_size, 8

	.type	number_measurements,@object # @number_measurements
	.globl	number_measurements
	.p2align	3
number_measurements:
	.quad	100000                  # 0x186a0
	.size	number_measurements, 8

	.type	ctx,@object             # @ctx
	.comm	ctx,96,8
	.type	br_md5_IV,@object       # @br_md5_IV
	.globl	br_md5_IV
	.p2align	4
br_md5_IV:
	.long	1732584193              # 0x67452301
	.long	4023233417              # 0xefcdab89
	.long	2562383102              # 0x98badcfe
	.long	271733878               # 0x10325476
	.size	br_md5_IV, 16

	.type	br_md5_vtable,@object   # @br_md5_vtable
	.globl	br_md5_vtable
	.p2align	3
br_md5_vtable:
	.quad	96                      # 0x60
	.long	319295489               # 0x13081001
	.zero	4
	.quad	br_md5_init
	.quad	br_md5_update
	.quad	br_md5_out
	.quad	br_md5_state
	.quad	br_md5_set_state
	.size	br_md5_vtable, 56

	.type	.L.str.17,@object       # @.str.17
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.17:
	.asciz	"xlen >= 0"
	.size	.L.str.17, 10

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"bearssl/hash/md5/sources/random.c"
	.size	.L.str.1, 34

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
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits

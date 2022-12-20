	.text
	.file	"crypto_poly1305.c"
	.globl	_poly1305_blocks                # -- Begin function _poly1305_blocks
	.p2align	4, 0x90
	.type	_poly1305_blocks,@function
_poly1305_blocks:                       # @_poly1305_blocks
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
	subq	$248, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%fs:40, %rax
	movq	%rax, -48(%rbp)
	movb	$0, -233(%rbp)
	movb	$0, -235(%rbp)
	movb	$0, -234(%rbp)
	movb	$0, -236(%rbp)
	movb	$1, -237(%rbp)
	movq	(%rsi), %rax
	movq	%rax, -88(%rbp)
	xorl	%eax, %eax
	cmpb	$0, 88(%rdi)
	sete	%al
	shlq	$40, %rax
	movq	%rax, -96(%rbp)
	movq	(%rdi), %rax
	movq	%rax, -104(%rbp)
	movq	8(%rdi), %rax
	movq	%rax, -112(%rbp)
	movq	16(%rdi), %rcx
	movq	%rcx, -120(%rbp)
	movq	24(%rdi), %rdx
	movq	%rdx, -128(%rbp)
	movq	32(%rdi), %rdx
	movq	%rdx, -136(%rbp)
	movq	%rdi, -256(%rbp)                # 8-byte Spill
	movq	40(%rdi), %rdx
	movq	%rdx, -144(%rbp)
	shlq	$2, %rax
	leaq	(%rax,%rax,4), %rax
	movq	%rax, -152(%rbp)
	shlq	$2, %rcx
	leaq	(%rcx,%rcx,4), %rax
	movq	%rax, -160(%rbp)
	movq	8(%rsi), %rax
	shrq	$4, %rax
	movq	%rax, -264(%rbp)                # 8-byte Spill
	movq	$0, -280(%rbp)
	movb	$1, %al
	movl	$8, %ecx
	xorl	%edx, %edx
	movabsq	$17592186044415, %r15           # imm = 0xFFFFFFFFFFF
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	andb	-237(%rbp), %al
	orb	-234(%rbp), %al
	andb	$1, %al
	movb	%al, -233(%rbp)
	cmpq	-264(%rbp), %rdx                # 8-byte Folded Reload
	jae	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	setb	%al
	andb	-233(%rbp), %al
	movb	%al, -235(%rbp)
	movq	-88(%rbp), %rax
	addq	%rcx, %rax
	addq	$-8, %rax
	movq	$0, -72(%rbp)
	movq	%rax, -80(%rbp)
	leaq	-80(%rbp), %rdi
	movq	%rcx, -248(%rbp)                # 8-byte Spill
	movq	%rdx, -272(%rbp)                # 8-byte Spill
	callq	load64_le
	movq	%rax, -168(%rbp)
	movq	-88(%rbp), %rax
	addq	-248(%rbp), %rax                # 8-byte Folded Reload
	movq	$0, -56(%rbp)
	movq	%rax, -64(%rbp)
	leaq	-64(%rbp), %rdi
	callq	load64_le
	movq	%rax, %rdi
	movq	-168(%rbp), %rbx
	movq	%rbx, %r10
	andq	%r15, %r10
	addq	-128(%rbp), %r10
	movq	%rax, -176(%rbp)
	shrdq	$44, %rax, %rbx
	andq	%r15, %rbx
	addq	-136(%rbp), %rbx
	shrq	$24, %rdi
	movabsq	$4398046511103, %rax            # imm = 0x3FFFFFFFFFF
	andq	%rax, %rdi
	orq	-96(%rbp), %rdi
	addq	-144(%rbp), %rdi
	movq	-104(%rbp), %r14
	movq	%r10, %rax
	mulq	%r14
	movq	%rax, %rcx
	movq	%rdx, %r8
	movq	-160(%rbp), %r12
	movq	%rbx, %rax
	mulq	%r12
	movq	%rdx, %r9
	movq	%rax, %rsi
	addq	%rcx, %rsi
	adcq	%r8, %r9
	movq	%rdi, %rax
	mulq	-152(%rbp)
	movq	%rdx, %rcx
	movq	%rax, %r8
	addq	%rsi, %r8
	adcq	%r9, %rcx
	movq	-112(%rbp), %r11
	movq	%r10, %rax
	mulq	%r11
	movq	%rax, %rsi
	movq	%rdx, %r9
	movq	%r10, -128(%rbp)
	movq	%rbx, %rax
	mulq	%r14
	movq	%rdx, %r10
	movq	%rax, %r13
	addq	%rsi, %r13
	adcq	%r9, %r10
	movq	%rdi, %rax
	mulq	%r12
	movq	%rax, %r9
	movq	%rdx, %rsi
	movq	%rbx, -136(%rbp)
	addq	%r13, %r9
	adcq	%r10, %rsi
	movq	-128(%rbp), %rax
	mulq	-120(%rbp)
	movq	%rdx, %r10
	movq	%rax, %r13
	movq	%r11, %rax
	mulq	-136(%rbp)
	movq	%rdx, %r11
	movq	%rax, %rbx
	addq	%r13, %rbx
	adcq	%r10, %r11
	movq	%rdi, %rax
	mulq	%r14
	movq	%rdi, -144(%rbp)
	addq	%rbx, %rax
	adcq	%r11, %rdx
	movq	%r8, -192(%rbp)
	movq	%rcx, -184(%rbp)
	shldq	$20, %r8, %rcx
	movq	%r9, -208(%rbp)
	movq	%rcx, -232(%rbp)
	andq	%r15, %r8
	addq	%r9, %rcx
	movq	%rsi, -200(%rbp)
	movq	%rax, -224(%rbp)
	adcq	$0, %rsi
	movq	%rcx, -208(%rbp)
	movq	%rsi, -200(%rbp)
	shldq	$20, %rcx, %rsi
	movq	%rsi, -232(%rbp)
	andq	%r15, %rcx
	addq	%rax, %rsi
	movq	%rdx, -216(%rbp)
	adcq	$0, %rdx
	movq	%rsi, -224(%rbp)
	movq	%rdx, -216(%rbp)
	shldq	$22, %rsi, %rdx
	movabsq	$4398046511103, %rax            # imm = 0x3FFFFFFFFFF
	andq	%rax, %rsi
	movq	%rsi, -144(%rbp)
	movq	%r8, -128(%rbp)
	movq	%rdx, -232(%rbp)
	leaq	(%rdx,%rdx,4), %rax
	addq	%r8, %rax
	movq	%rax, %rdx
	andq	%r15, %rax
	movq	%rax, -128(%rbp)
	movq	%rcx, -136(%rbp)
	shrq	$44, %rdx
	movq	%rdx, -232(%rbp)
	addq	%rcx, %rdx
	movq	-248(%rbp), %rcx                # 8-byte Reload
	movq	%rdx, -136(%rbp)
	movq	-272(%rbp), %rdx                # 8-byte Reload
	movzbl	-235(%rbp), %eax
	movb	%al, -234(%rbp)
	addq	$1, %rdx
	addq	$16, %rcx
	xorl	%eax, %eax
	jmp	.LBB0_1
.LBB0_3:
	setae	%al
	andb	-233(%rbp), %al
	movb	%al, -236(%rbp)
	movq	-128(%rbp), %rax
	movq	-256(%rbp), %rcx                # 8-byte Reload
	movq	%rax, 24(%rcx)
	movq	-136(%rbp), %rax
	movq	%rax, 32(%rcx)
	movq	-144(%rbp), %rax
	movq	%rax, 40(%rcx)
	movq	%fs:40, %rax
	cmpq	-48(%rbp), %rax
	jne	.LBB0_5
# %bb.4:                                # %SP_return
	addq	$248, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB0_5:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail@PLT
.Lfunc_end0:
	.size	_poly1305_blocks, .Lfunc_end0-_poly1305_blocks
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function load64_le
	.type	load64_le,@function
load64_le:                              # @load64_le
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	$1, -1(%rbp)
	movq	(%rdi), %rax
	movq	(%rax), %rax
	movq	$0, -16(%rbp)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	load64_le, .Lfunc_end1-load64_le
	.cfi_endproc
                                        # -- End function
	.globl	_poly1305_init                  # -- Begin function _poly1305_init
	.p2align	4, 0x90
	.type	_poly1305_init,@function
_poly1305_init:                         # @_poly1305_init
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movq	%fs:40, %rax
	movq	%rax, -16(%rbp)
	movb	$1, -105(%rbp)
	movq	(%rsi), %rax
	movq	%rax, -88(%rbp)
	movq	$0, -24(%rbp)
	movq	%rax, -32(%rbp)
	leaq	-32(%rbp), %rdi
	callq	load64_le
	movq	%rax, -96(%rbp)
	movq	-88(%rbp), %rax
	addq	$8, %rax
	movq	$0, -40(%rbp)
	movq	%rax, -48(%rbp)
	leaq	-48(%rbp), %rdi
	callq	load64_le
	movq	%rax, -104(%rbp)
	movabsq	$17575274610687, %rax           # imm = 0xFFC0FFFFFFF
	andq	-96(%rbp), %rax
	movq	%rax, (%rbx)
	movq	-96(%rbp), %rax
	movq	-104(%rbp), %rcx
	shldq	$20, %rax, %rcx
	movabsq	$17592181915647, %rax           # imm = 0xFFFFFC0FFFF
	andq	%rcx, %rax
	movq	%rax, 8(%rbx)
	movq	-104(%rbp), %rax
	shrq	$24, %rax
	movabsq	$68719475727, %rcx              # imm = 0xFFFFFFC0F
	andq	%rax, %rcx
	movq	%rcx, 16(%rbx)
	xorps	%xmm0, %xmm0
	movups	%xmm0, 24(%rbx)
	movq	$0, 40(%rbx)
	movq	-88(%rbp), %rax
	addq	$16, %rax
	movq	$0, -56(%rbp)
	movq	%rax, -64(%rbp)
	leaq	-64(%rbp), %rdi
	callq	load64_le
	movq	%rax, 48(%rbx)
	movq	-88(%rbp), %rax
	addq	$24, %rax
	movq	$0, -72(%rbp)
	movq	%rax, -80(%rbp)
	leaq	-80(%rbp), %rdi
	callq	load64_le
	movq	%rax, 56(%rbx)
	movq	$0, 64(%rbx)
	movb	$0, 88(%rbx)
	movq	$0, -120(%rbp)
	movq	%fs:40, %rax
	cmpq	-16(%rbp), %rax
	jne	.LBB2_2
# %bb.1:                                # %SP_return
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB2_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail@PLT
.Lfunc_end2:
	.size	_poly1305_init, .Lfunc_end2-_poly1305_init
	.cfi_endproc
                                        # -- End function
	.globl	_poly1305_update                # -- Begin function _poly1305_update
	.p2align	4, 0x90
	.type	_poly1305_update,@function
_poly1305_update:                       # @_poly1305_update
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
	subq	$104, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	%fs:40, %rax
	movq	%rax, -48(%rbp)
	movb	$1, -119(%rbp)
	movb	$0, -102(%rbp)
	movb	$0, -101(%rbp)
	movb	$0, -118(%rbp)
	movb	$0, -117(%rbp)
	movb	$0, -100(%rbp)
	movb	$0, -99(%rbp)
	movb	$0, -127(%rbp)
	movb	$0, -116(%rbp)
	movb	$0, -98(%rbp)
	movb	$0, -126(%rbp)
	movb	$0, -115(%rbp)
	movb	$0, -114(%rbp)
	movb	$0, -97(%rbp)
	movb	$0, -96(%rbp)
	movb	$0, -113(%rbp)
	movb	$0, -112(%rbp)
	movb	$0, -95(%rbp)
	movb	$0, -94(%rbp)
	movb	$0, -125(%rbp)
	movb	$0, -111(%rbp)
	movb	$0, -93(%rbp)
	movb	$0, -124(%rbp)
	movb	$0, -110(%rbp)
	movb	$0, -109(%rbp)
	movb	$0, -92(%rbp)
	movb	$0, -108(%rbp)
	movb	$0, -91(%rbp)
	movb	$0, -90(%rbp)
	movb	$0, -123(%rbp)
	movb	$0, -107(%rbp)
	movb	$0, -89(%rbp)
	movb	$0, -122(%rbp)
	movb	$0, -106(%rbp)
	movb	$0, -105(%rbp)
	movb	$0, -104(%rbp)
	movb	$0, -103(%rbp)
	movb	$0, -121(%rbp)
	movb	$0, -120(%rbp)
	movb	$1, -102(%rbp)
	movb	$0, -97(%rbp)
	movq	(%rsi), %rax
	movq	%rax, -56(%rbp)
	movq	64(%rdi), %r12
	movq	$0, -144(%rbp)
	testq	%r12, %r12
	je	.LBB3_1
# %bb.2:
	setne	%al
	andb	-102(%rbp), %al
	movb	%al, -101(%rbp)
	movl	$16, %eax
	subq	64(%rbx), %rax
	movq	8(%r14), %rcx
	movq	%rax, %r15
	cmpq	%rcx, %rax
	jbe	.LBB3_4
# %bb.3:
	seta	%dl
	andb	-101(%rbp), %dl
	movb	%dl, -118(%rbp)
	movq	8(%r14), %r15
.LBB3_4:
	cmpq	%rcx, %rax
	setbe	%al
	andb	-101(%rbp), %al
	orb	-118(%rbp), %al
	andb	$1, %al
	movb	%al, -117(%rbp)
	movb	$1, %cl
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB3_5:                                # =>This Inner Loop Header: Depth=1
	andb	-117(%rbp), %cl
	orb	-97(%rbp), %cl
	andb	$1, %cl
	movb	%cl, -100(%rbp)
	cmpq	%r15, %rax
	jae	.LBB3_10
# %bb.6:                                #   in Loop: Header=BB3_5 Depth=1
	setb	%cl
	andb	-100(%rbp), %cl
	movb	%cl, -99(%rbp)
	movq	64(%rbx), %rcx
	leaq	(%rax,%rcx), %rdx
	cmpq	$15, %rdx
	ja	.LBB3_28
# %bb.7:                                #   in Loop: Header=BB3_5 Depth=1
	setbe	%dl
	andb	-99(%rbp), %dl
	movb	%dl, -127(%rbp)
	movb	%dl, -98(%rbp)
	cmpq	8(%r14), %rax
	jae	.LBB3_9
# %bb.8:                                #   in Loop: Header=BB3_5 Depth=1
	setb	%dl
	andb	-98(%rbp), %dl
	movb	%dl, -126(%rbp)
	movb	%dl, -114(%rbp)
	movq	-56(%rbp), %rdx
	movzbl	(%rdx,%rax), %edx
	addq	%rbx, %rcx
	movb	%dl, 72(%rax,%rcx)
	movzbl	-114(%rbp), %ecx
	movb	%cl, -97(%rbp)
	addq	$1, %rax
	xorl	%ecx, %ecx
	jmp	.LBB3_5
.LBB3_10:
	setae	%al
	andb	-100(%rbp), %al
	movb	%al, -96(%rbp)
	movq	64(%rbx), %rax
	addq	%r15, %rax
	movq	%rax, 64(%rbx)
	cmpq	$15, %rax
	ja	.LBB3_12
# %bb.11:
	setbe	%al
	andb	-96(%rbp), %al
	movb	%al, -113(%rbp)
	jmp	.LBB3_26
.LBB3_1:
	xorl	%r15d, %r15d
	jmp	.LBB3_13
.LBB3_12:
	seta	%al
	andb	-96(%rbp), %al
	movb	%al, -112(%rbp)
	movq	$16, -64(%rbp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	$16, -64(%rbp)
	movq	%rax, -72(%rbp)
	leaq	-72(%rbp), %rsi
	movq	%rbx, %rdi
	callq	_poly1305_blocks
	movq	$0, 64(%rbx)
.LBB3_13:
	testq	%r12, %r12
	sete	%al
	andb	-102(%rbp), %al
	orb	-112(%rbp), %al
	andb	$1, %al
	movb	%al, -95(%rbp)
	movq	8(%r14), %rcx
	subq	%r15, %rcx
	cmpq	$16, %rcx
	jb	.LBB3_14
# %bb.15:
	setae	%al
	andb	-95(%rbp), %al
	movb	%al, -94(%rbp)
	movq	8(%r14), %r12
	subq	%r15, %r12
	andq	$-16, %r12
	leaq	(%r15,%r12), %r13
	cmpq	%r13, %r15
	jae	.LBB3_31
# %bb.16:
	movq	%rcx, -136(%rbp)                # 8-byte Spill
	setb	%al
	andb	-94(%rbp), %al
	movb	%al, -125(%rbp)
	movb	%al, -93(%rbp)
	cmpq	8(%r14), %r13
	ja	.LBB3_32
# %bb.17:
	setbe	%al
	andb	-93(%rbp), %al
	movb	%al, -124(%rbp)
	movb	%al, -109(%rbp)
	movq	%r12, -80(%rbp)
	movq	%r12, %rdi
	callq	malloc@PLT
	movq	%r12, -80(%rbp)
	movq	%rax, -88(%rbp)
	addq	-56(%rbp), %r15
	movq	%rax, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	callq	memcpy@PLT
	leaq	-88(%rbp), %rsi
	movq	%rbx, %rdi
	callq	_poly1305_blocks
	movq	-136(%rbp), %rcx                # 8-byte Reload
	jmp	.LBB3_18
.LBB3_14:
	movq	%r15, %r13
.LBB3_18:
	cmpq	$16, %rcx
	setb	%al
	andb	-95(%rbp), %al
	orb	-109(%rbp), %al
	andb	$1, %al
	movb	%al, -92(%rbp)
	cmpq	8(%r14), %r13
	setb	-119(%rbp)
	jae	.LBB3_26
# %bb.19:
	setb	%al
	andb	-92(%rbp), %al
	movb	%al, -108(%rbp)
	movq	8(%r14), %rdi
	subq	%r13, %rdi
	movb	$1, %dl
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB3_20:                               # =>This Inner Loop Header: Depth=1
	andb	-108(%rbp), %dl
	orb	-104(%rbp), %dl
	andb	$1, %dl
	movb	%dl, -91(%rbp)
	cmpq	%rdi, %rcx
	jae	.LBB3_25
# %bb.21:                               #   in Loop: Header=BB3_20 Depth=1
	setb	%dl
	andb	-91(%rbp), %dl
	movb	%dl, -90(%rbp)
	movq	64(%rbx), %rdx
	leaq	(%rcx,%rdx), %rsi
	cmpq	$15, %rsi
	ja	.LBB3_33
# %bb.22:                               #   in Loop: Header=BB3_20 Depth=1
	setbe	%al
	andb	-90(%rbp), %al
	movb	%al, -123(%rbp)
	movb	%al, -89(%rbp)
	leaq	(%rcx,%r13), %rax
	cmpq	8(%r14), %rax
	jae	.LBB3_24
# %bb.23:                               #   in Loop: Header=BB3_20 Depth=1
	setb	%al
	andb	-89(%rbp), %al
	movb	%al, -122(%rbp)
	movb	%al, -105(%rbp)
	movq	-56(%rbp), %rax
	addq	%r13, %rax
	movzbl	(%rcx,%rax), %eax
	addq	%rbx, %rdx
	movb	%al, 72(%rcx,%rdx)
	movzbl	-105(%rbp), %eax
	movb	%al, -104(%rbp)
	addq	$1, %rcx
	xorl	%edx, %edx
	jmp	.LBB3_20
.LBB3_25:
	setae	%al
	andb	-91(%rbp), %al
	movb	%al, -103(%rbp)
	addq	%rdi, 64(%rbx)
.LBB3_26:
	movb	-119(%rbp), %al
	notb	%al
	andb	-92(%rbp), %al
	orb	-103(%rbp), %al
	orb	-113(%rbp), %al
	andb	$1, %al
	movb	%al, -121(%rbp)
	movq	%fs:40, %rax
	cmpq	-48(%rbp), %rax
	jne	.LBB3_30
# %bb.27:                               # %SP_return
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB3_28:
	.cfi_def_cfa %rbp, 16
	seta	%al
	andb	-99(%rbp), %al
	movb	%al, -116(%rbp)
	movl	$.L.str.4, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__._poly1305_update, %ecx
	movl	$124, %edx
	jmp	.LBB3_29
.LBB3_9:
	setae	%al
	andb	-98(%rbp), %al
	movb	%al, -115(%rbp)
	movl	$.L.str.6, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__._poly1305_update, %ecx
	movl	$125, %edx
	jmp	.LBB3_29
.LBB3_33:
	seta	%al
	andb	-90(%rbp), %al
	movb	%al, -107(%rbp)
	movl	$.L.str.9, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__._poly1305_update, %ecx
	movl	$171, %edx
	jmp	.LBB3_29
.LBB3_24:
	setae	%al
	andb	-89(%rbp), %al
	movb	%al, -106(%rbp)
	movl	$.L.str.10, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__._poly1305_update, %ecx
	movl	$172, %edx
.LBB3_29:                               # %UnifiedUnreachableBlock
	callq	__assert_fail@PLT
	movb	-110(%rbp), %al
	orb	-111(%rbp), %al
	orb	-106(%rbp), %al
	orb	-115(%rbp), %al
	orb	-116(%rbp), %al
	orb	-107(%rbp), %al
	andb	$1, %al
	movb	%al, -120(%rbp)
.LBB3_30:                               # %CallStackCheckFailBlk
	callq	__stack_chk_fail@PLT
.LBB3_31:
	setae	%al
	andb	-94(%rbp), %al
	movb	%al, -111(%rbp)
	movl	$.L.str.7, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__._poly1305_update, %ecx
	movl	$151, %edx
	jmp	.LBB3_29
.LBB3_32:
	seta	%al
	andb	-93(%rbp), %al
	movb	%al, -110(%rbp)
	movl	$.L.str.8, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__._poly1305_update, %ecx
	movl	$152, %edx
	jmp	.LBB3_29
.Lfunc_end3:
	.size	_poly1305_update, .Lfunc_end3-_poly1305_update
	.cfi_endproc
                                        # -- End function
	.globl	_poly1305_finish                # -- Begin function _poly1305_finish
	.p2align	4, 0x90
	.type	_poly1305_finish,@function
_poly1305_finish:                       # @_poly1305_finish
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
	subq	$168, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r15
	movq	%fs:40, %rax
	movq	%rax, -32(%rbp)
	movb	$0, -162(%rbp)
	movb	$0, -170(%rbp)
	movb	$0, -169(%rbp)
	movb	$0, -166(%rbp)
	movb	$0, -161(%rbp)
	movb	$0, -165(%rbp)
	movb	$0, -164(%rbp)
	movb	$0, -163(%rbp)
	movb	$0, -168(%rbp)
	movb	$1, -167(%rbp)
	movq	(%rsi), %rax
	movq	%rax, -72(%rbp)
	movq	64(%rdi), %r14
	movq	$0, -184(%rbp)
	testq	%r14, %r14
	je	.LBB4_6
# %bb.1:
	setne	%al
	andb	-167(%rbp), %al
	movb	%al, -162(%rbp)
	movq	64(%r15), %rax
	cmpq	$15, %rax
	ja	.LBB4_8
# %bb.2:
	setbe	%cl
	andb	-162(%rbp), %cl
	movb	%cl, -170(%rbp)
	movb	%cl, -166(%rbp)
	movb	$1, 72(%r15,%rax)
	addq	$1, %rax
	movb	$1, %cl
	.p2align	4, 0x90
.LBB4_3:                                # =>This Inner Loop Header: Depth=1
	andb	-166(%rbp), %cl
	orb	-164(%rbp), %cl
	andb	$1, %cl
	movb	%cl, -161(%rbp)
	cmpq	$15, %rax
	ja	.LBB4_5
# %bb.4:                                #   in Loop: Header=BB4_3 Depth=1
	setbe	%cl
	andb	-161(%rbp), %cl
	movb	%cl, -165(%rbp)
	movb	$0, 72(%r15,%rax)
	movzbl	-165(%rbp), %ecx
	movb	%cl, -164(%rbp)
	addq	$1, %rax
	xorl	%ecx, %ecx
	jmp	.LBB4_3
.LBB4_5:
	seta	%al
	andb	-161(%rbp), %al
	movb	%al, -163(%rbp)
	movb	$1, 88(%r15)
	movq	$16, -80(%rbp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	$16, -80(%rbp)
	movq	%rax, -88(%rbp)
	leaq	-88(%rbp), %rsi
	movq	%r15, %rdi
	callq	_poly1305_blocks
.LBB4_6:
	testq	%r14, %r14
	sete	%al
	andb	-167(%rbp), %al
	orb	-163(%rbp), %al
	andb	$1, %al
	movb	%al, -168(%rbp)
	movq	24(%r15), %rax
	movq	%rax, -96(%rbp)
	movq	32(%r15), %rcx
	movq	%rcx, -104(%rbp)
	movq	%rcx, %rdx
	shrq	$44, %rdx
	movabsq	$17592186044415, %r9            # imm = 0xFFFFFFFFFFF
	andq	%r9, %rcx
	addq	40(%r15), %rdx
	movq	%rdx, %rsi
	shrq	$42, %rsi
	movabsq	$4398046511103, %r8             # imm = 0x3FFFFFFFFFF
	andq	%r8, %rdx
	leaq	(%rsi,%rsi,4), %rsi
	addq	%rax, %rsi
	movq	%rsi, %rax
	shrq	$44, %rax
	addq	%rcx, %rax
	andq	%r9, %rsi
	movq	%rax, %rcx
	shrq	$44, %rcx
	addq	%rdx, %rcx
	andq	%r9, %rax
	movq	%rcx, -112(%rbp)
	shrq	$42, %rcx
	andl	$1023, -108(%rbp)               # imm = 0x3FF
	leaq	(%rcx,%rcx,4), %rdi
	addq	%rsi, %rdi
	movq	%rdi, %r11
	shrq	$44, %r11
	addq	%rax, %r11
	andq	%r9, %rdi
	leaq	5(%rdi), %rdx
	movq	%rdx, %rcx
	shrq	$44, %rcx
	addq	%r11, %rcx
	movq	%rcx, %rax
	shrq	$44, %rax
	movq	-112(%rbp), %r10
	addq	%r10, %rax
	movq	%r8, %rsi
	notq	%rsi
	addq	%rax, %rsi
	movq	%rsi, %rbx
	shrq	$63, %rbx
	addq	$-1, %rbx
	andq	%r9, %rdx
	andq	%rbx, %rdx
	movq	%rdx, -128(%rbp)
	andq	%r9, %rcx
	andq	%rbx, %rcx
	movq	%rcx, -136(%rbp)
	andq	%rsi, %rbx
	movq	%rbx, -144(%rbp)
	sarq	$63, %rsi
	movq	%rsi, -120(%rbp)
	andq	%rsi, %rdi
	orq	%rdx, %rdi
	movq	%rdi, -96(%rbp)
	andq	%rsi, %r11
	orq	%rcx, %r11
	movq	%r11, -104(%rbp)
	andq	%r10, %rsi
	orq	%rbx, %rsi
	movq	%rsi, -112(%rbp)
	movq	48(%r15), %rbx
	movq	%rbx, -152(%rbp)
	movq	56(%r15), %rax
	movq	%rax, -160(%rbp)
	movq	%rax, %rcx
	shldq	$20, %rbx, %rcx
	andq	%r9, %rbx
	addq	%rdi, %rbx
	movq	%rbx, %rdx
	shrq	$44, %rdx
	andq	%r9, %rbx
	andq	%r9, %rcx
	addq	%rdx, %rcx
	addq	%r11, %rcx
	movq	%rcx, %rdx
	shrq	$44, %rdx
	movq	%rdx, -120(%rbp)
	andq	%r9, %rcx
	shrq	$24, %rax
	addq	%rdx, %rax
	addq	%rsi, %rax
	andq	%r8, %rax
	movq	%rax, -112(%rbp)
	movq	%rcx, %rsi
	shlq	$44, %rsi
	orq	%rbx, %rsi
	movq	%rsi, -96(%rbp)
	shrq	$20, %rcx
	shlq	$24, %rax
	orq	%rcx, %rax
	movq	%rax, -104(%rbp)
	movq	-72(%rbp), %rax
	movq	$0, -56(%rbp)
	movq	%rax, -64(%rbp)
	leaq	-64(%rbp), %rdi
	callq	store64_le
	movq	-72(%rbp), %rax
	addq	$8, %rax
	movq	-104(%rbp), %rsi
	movq	$0, -40(%rbp)
	movq	%rax, -48(%rbp)
	leaq	-48(%rbp), %rdi
	callq	store64_le
	movl	$96, %esi
	movq	%r15, %rdi
	callq	sodium_memzero@PLT
	movq	%fs:40, %rax
	cmpq	-32(%rbp), %rax
	jne	.LBB4_7
# %bb.9:                                # %SP_return
	addq	$168, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB4_8:
	.cfi_def_cfa %rbp, 16
	seta	%al
	andb	-162(%rbp), %al
	movb	%al, -169(%rbp)
	movl	$.L.str.11, %edi
	movl	$.L.str.5, %esi
	movl	$.L__PRETTY_FUNCTION__._poly1305_finish, %ecx
	movl	$191, %edx
	callq	__assert_fail@PLT
.LBB4_7:                                # %CallStackCheckFailBlk
	callq	__stack_chk_fail@PLT
.Lfunc_end4:
	.size	_poly1305_finish, .Lfunc_end4-_poly1305_finish
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function store64_le
	.type	store64_le,@function
store64_le:                             # @store64_le
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rsi, %rax
	movb	$1, -1(%rbp)
	movq	(%rdi), %rcx
	movb	%al, (%rcx)
	movb	%ah, 1(%rcx)
	movq	%rsi, %rdx
	shrq	$16, %rdx
	movb	%dl, 2(%rcx)
	movq	%rsi, %rdx
	shrq	$24, %rdx
	movb	%dl, 3(%rcx)
	movq	%rsi, %rdx
	shrq	$32, %rdx
	movb	%dl, 4(%rcx)
	movq	%rsi, %rdx
	shrq	$40, %rdx
	movb	%dl, 5(%rcx)
	movq	%rsi, %rdx
	shrq	$48, %rdx
	movb	%dl, 6(%rcx)
	shrq	$56, %rax
	movb	%al, 7(%rcx)
	movq	$0, -16(%rbp)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	store64_le, .Lfunc_end5-store64_le
	.cfi_endproc
                                        # -- End function
	.globl	_crypto_onetimeauth_poly1305    # -- Begin function _crypto_onetimeauth_poly1305
	.p2align	4, 0x90
	.type	_crypto_onetimeauth_poly1305,@function
_crypto_onetimeauth_poly1305:           # @_crypto_onetimeauth_poly1305
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$176, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	movb	$1, -177(%rbp)
	movq	(%rdi), %rax
	movq	(%rdx), %rcx
	movq	%rax, -168(%rbp)
	movq	%rcx, -176(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm0, -112(%rbp)
	movaps	%xmm0, -96(%rbp)
	movaps	%xmm0, -80(%rbp)
	movaps	%xmm0, -64(%rbp)
	movaps	%xmm0, -48(%rbp)
	movq	$0, -136(%rbp)
	movq	%rcx, -144(%rbp)
	leaq	-128(%rbp), %rbx
	leaq	-144(%rbp), %rsi
	movq	%rbx, %rdi
	callq	_poly1305_init
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_poly1305_update
	movq	-168(%rbp), %rax
	movq	$0, -152(%rbp)
	movq	%rax, -160(%rbp)
	leaq	-160(%rbp), %rsi
	movq	%rbx, %rdi
	callq	_poly1305_finish
	movq	$0, -192(%rbp)
	movq	%fs:40, %rax
	cmpq	-24(%rbp), %rax
	jne	.LBB6_2
# %bb.1:                                # %SP_return
	xorl	%eax, %eax
	addq	$176, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB6_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail@PLT
.Lfunc_end6:
	.size	_crypto_onetimeauth_poly1305, .Lfunc_end6-_crypto_onetimeauth_poly1305
	.cfi_endproc
                                        # -- End function
	.globl	_crypto_onetimeauth_poly1305_verify # -- Begin function _crypto_onetimeauth_poly1305_verify
	.p2align	4, 0x90
	.type	_crypto_onetimeauth_poly1305_verify,@function
_crypto_onetimeauth_poly1305_verify:    # @_crypto_onetimeauth_poly1305_verify
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$96, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	movb	$1, -89(%rbp)
	movq	(%rdi), %rbx
	movq	(%rdx), %rax
	movq	%rax, -88(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -48(%rbp)
	movq	$16, -56(%rbp)
	leaq	-48(%rbp), %r14
	movq	%r14, -64(%rbp)
	movq	$0, -72(%rbp)
	movq	%rax, -80(%rbp)
	leaq	-64(%rbp), %rdi
	leaq	-80(%rbp), %rdx
	callq	_crypto_onetimeauth_poly1305
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_crypto_verify_16@PLT
	movq	$0, -104(%rbp)
	movq	%fs:40, %rcx
	cmpq	-24(%rbp), %rcx
	jne	.LBB7_2
# %bb.1:                                # %SP_return
	addq	$96, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB7_2:                                # %CallStackCheckFailBlk
	.cfi_def_cfa %rbp, 16
	callq	__stack_chk_fail@PLT
.Lfunc_end7:
	.size	_crypto_onetimeauth_poly1305_verify, .Lfunc_end7-_crypto_onetimeauth_poly1305_verify
	.cfi_endproc
                                        # -- End function
	.type	.L.str.4,@object                # @.str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4:
	.asciz	"index < len_state_buffer"
	.size	.L.str.4, 25

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"crypto_poly1305.c"
	.size	.L.str.5, 18

	.type	.L__PRETTY_FUNCTION__._poly1305_update,@object # @__PRETTY_FUNCTION__._poly1305_update
.L__PRETTY_FUNCTION__._poly1305_update:
	.asciz	"void _poly1305_update(poly1305_state_internal_t *, uint8ptr_wrapped_ty *)"
	.size	.L__PRETTY_FUNCTION__._poly1305_update, 74

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"i < m->len"
	.size	.L.str.6, 11

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"_mindex < _mindex + want"
	.size	.L.str.7, 25

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"_mindex + want <= m->len"
	.size	.L.str.8, 25

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"_leftover + i < len_state_buffer"
	.size	.L.str.9, 33

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"_mindex + i < m->len"
	.size	.L.str.10, 21

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"start < len_state_buffer"
	.size	.L.str.11, 25

	.type	.L__PRETTY_FUNCTION__._poly1305_finish,@object # @__PRETTY_FUNCTION__._poly1305_finish
.L__PRETTY_FUNCTION__._poly1305_finish:
	.asciz	"void _poly1305_finish(poly1305_state_internal_t *, uint8_t *)"
	.size	.L__PRETTY_FUNCTION__._poly1305_finish, 62

	.ident	"clang version 14.0.6"
	.section	".note.GNU-stack","",@progbits

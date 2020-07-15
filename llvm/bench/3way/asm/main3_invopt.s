	.text
	.file	"llvm-link"
	.globl	printvec                # -- Begin function printvec
	.p2align	4, 0x90
	.type	printvec,@function
printvec:                               # @printvec
# %bb.0:
	pushq	%rax
	movq	%rdi, %rsi
	movq	16(%rdx), %rax
	movq	(%rdx), %r8
	movq	8(%rdx), %rcx
	movl	$.L.str, %edi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf
	popq	%rax
	retq
.Lfunc_end0:
	.size	printvec, .Lfunc_end0-printvec
                                        # -- End function
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$360, %rsp              # imm = 0x168
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%fs:40, %rax
	movq	%rax, -32(%rbp)
	movl	$2596069104, %eax       # imm = 0x9ABCDEF0
	leaq	572657954(%rax), %rcx
	movq	%rcx, -368(%rbp)
	movq	$1164413355, -376(%rbp) # imm = 0x456789AB
	leaq	1144206148(%rax), %rcx
	movq	%rcx, -384(%rbp)
	movq	$19088743, -336(%rbp)   # imm = 0x1234567
	movq	%rax, -344(%rbp)
	movq	$591751049, -352(%rbp)  # imm = 0x23456789
	leaq	-272(%rbp), %r14
	leaq	-384(%rbp), %rbx
	movl	$1, %esi
	movq	%r14, %rdi
	movq	%rbx, %rdx
	callq	twy_key
	movl	$.Lstr, %edi
	callq	puts
	movl	$.L.str.2, %edi
	movq	%rbx, %rdx
	callq	printvec
	leaq	-352(%rbp), %rbx
	movl	$.L.str.3, %edi
	movq	%rbx, %rdx
	callq	printvec
	movl	$1, %esi
	movl	$9, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movl	$1, %r8d
	callq	encrypt
	movl	$.L.str.4, %edi
	movq	%rbx, %rdx
	callq	printvec
	movq	$0, -352(%rbp)
	movq	$1, -344(%rbp)
	movq	$2, -336(%rbp)
	movq	$3, -328(%rbp)
	movq	$4, -320(%rbp)
	movq	$5, -312(%rbp)
	leaq	-304(%rbp), %r15
	movq	$6, -304(%rbp)
	movq	$7, -296(%rbp)
	movq	$8, -288(%rbp)
	movl	$1, %esi
	movl	$9, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movl	$3, %r8d
	callq	twy_enc
	movq	-352(%rbp), %rdx
	movq	-344(%rbp), %rcx
	movq	-336(%rbp), %r8
	movl	$.L.str.5, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movq	-328(%rbp), %rdx
	movq	-320(%rbp), %rcx
	movq	-312(%rbp), %r8
	movl	$.L.str.5, %edi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	printf
	movq	-304(%rbp), %rdx
	movq	-296(%rbp), %rcx
	movq	-288(%rbp), %r8
	movl	$.L.str.5, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$1, %esi
	movl	$9, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movl	$2, %r8d
	callq	twy_dec
	movl	$1, %esi
	movl	$9, %ecx
	movq	%r14, %rdi
	movq	%r15, %rdx
	movl	$1, %r8d
	callq	twy_dec
	movq	-352(%rbp), %rdx
	movq	-344(%rbp), %rcx
	movq	-336(%rbp), %r8
	movl	$.L.str.6, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf
	movq	-328(%rbp), %rdx
	movq	-320(%rbp), %rcx
	movq	-312(%rbp), %r8
	movl	$.L.str.6, %edi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	printf
	movq	-304(%rbp), %rdx
	movq	-296(%rbp), %rcx
	movq	-288(%rbp), %r8
	movl	$.L.str.6, %edi
	movl	$2, %esi
	xorl	%eax, %eax
	callq	printf
	movq	%fs:40, %rax
	cmpq	-32(%rbp), %rax
	jne	.LBB1_2
# %bb.1:                                # %SP_return
	xorl	%eax, %eax
	addq	$360, %rsp              # imm = 0x168
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
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.globl	mu                      # -- Begin function mu
	.p2align	4, 0x90
	.type	mu,@function
mu:                                     # @mu
# %bb.0:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$744, %rsp              # imm = 0x2E8
	movq	(%rdi), %r13
	leaq	8(%rdi), %r9
	cmpq	$1, %rsi
	setg	%al
	orb	%dl, %al
	movb	%al, -112(%rsp)         # 1-byte Spill
	testb	$1, %al
	leaq	-128(%rsp), %rcx
	cmoveq	%rcx, %r9
	movl	(%r9), %eax
	andl	%edx, %eax
	movq	%rax, -120(%rsp)        # 8-byte Spill
	leaq	16(%rdi), %r8
	cmpq	$2, %rsi
	setg	%al
	orb	%dl, %al
	testb	$1, %al
	cmoveq	%rcx, %r8
	movl	(%r8), %ecx
	andl	%edx, %ecx
	movq	%rcx, 240(%rsp)         # 8-byte Spill
	movl	%edx, %ecx
	andb	$1, %cl
	movq	%r13, %rsi
	shrq	%cl, %rsi
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	8(%rdi), %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	testb	$1, %al
	movq	%rsi, (%r8)
	movq	(%rdi), %rbx
	movq	%rbx, 248(%rsp)         # 8-byte Spill
	movq	8(%rdi), %r10
	movq	%r10, 232(%rsp)         # 8-byte Spill
	movl	-128(%rsp), %ebp
	movl	%ebp, 220(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 272(%rsp)         # 8-byte Spill
	movq	%rbx, %rsi
	shrq	%cl, %rsi
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%r10, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	testb	$1, %al
	movq	%rsi, (%r8)
	movl	-128(%rsp), %ebp
	movl	%ebp, 216(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 288(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 256(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, -96(%rsp)         # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 212(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 304(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 264(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, -88(%rsp)         # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 208(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 320(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 280(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, -80(%rsp)         # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 204(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 336(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 296(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, -72(%rsp)         # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 200(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 352(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 312(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, -64(%rsp)         # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 196(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 368(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 328(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, -56(%rsp)         # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 192(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 384(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 344(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, -48(%rsp)         # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 188(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 400(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 360(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, -40(%rsp)         # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 184(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 416(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 376(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, -32(%rsp)         # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 180(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 432(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 392(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, -24(%rsp)         # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 176(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 448(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 408(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, -16(%rsp)         # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 172(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 464(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 424(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, -8(%rsp)          # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 168(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 480(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 440(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, (%rsp)            # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 164(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 496(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 456(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, 8(%rsp)           # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 160(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 512(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 472(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, 16(%rsp)          # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 156(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 528(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 488(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, 24(%rsp)          # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 152(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 544(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 504(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, 32(%rsp)          # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 148(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 560(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 520(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, 40(%rsp)          # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 144(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 576(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 536(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, 48(%rsp)          # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 140(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 592(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 552(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, 56(%rsp)          # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 136(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 608(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 568(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, 64(%rsp)          # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 132(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 624(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 584(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, 72(%rsp)          # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 128(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 640(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 600(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rbp, %r12
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 124(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 656(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 616(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, 88(%rsp)          # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 120(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 672(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 632(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, 80(%rsp)          # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 116(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 688(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 648(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, 96(%rsp)          # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 112(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 704(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 664(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rbp, -104(%rsp)        # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebp
	movl	%ebp, 108(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebp, %esi
	movq	%rsi, 712(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 680(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %rbp
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%rbp, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	testb	$1, %al
	movl	-128(%rsp), %ebx
	movl	%ebx, 104(%rsp)         # 4-byte Spill
	movl	16(%rdi), %esi
	cmovel	%ebx, %esi
	movq	%rsi, 728(%rsp)         # 8-byte Spill
	movq	(%rdi), %rsi
	movq	%rsi, 696(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %r14
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%r14, %rsi
	movq	%rsi, (%r9)
	movq	(%r8), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	movq	(%rdi), %rsi
	movq	%rsi, 720(%rsp)         # 8-byte Spill
	shrq	%cl, %rsi
	movq	8(%rdi), %r11
	movl	-128(%rsp), %ebx
	movq	%rbx, 224(%rsp)         # 8-byte Spill
	movq	%rsi, (%rdi)
	movq	(%r9), %rsi
	shrq	%rsi
	testb	%cl, %cl
	cmoveq	%r11, %rsi
	movq	%rsi, 736(%rsp)         # 8-byte Spill
	andl	%edx, %r13d
	andl	$1, %r13d
	testb	%cl, %cl
	leaq	(%r13,%r13), %r15
	cmoveq	%r13, %r15
	movq	-120(%rsp), %rsi        # 8-byte Reload
	andl	$1, %esi
	testb	%cl, %cl
	leaq	(%rsi,%rsi), %rbx
	cmoveq	%rsi, %rbx
	movq	240(%rsp), %rsi         # 8-byte Reload
	andl	$1, %esi
	testb	%cl, %cl
	leaq	(%rsi,%rsi), %r13
	cmoveq	%rsi, %r13
	testb	$1, -112(%rsp)          # 1-byte Folded Reload
	movq	232(%rsp), %r10         # 8-byte Reload
	cmovel	220(%rsp), %r10d        # 4-byte Folded Reload
	movq	-96(%rsp), %rsi         # 8-byte Reload
	cmovel	216(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, -96(%rsp)         # 8-byte Spill
	movq	-88(%rsp), %rsi         # 8-byte Reload
	cmovel	212(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, -88(%rsp)         # 8-byte Spill
	movq	-80(%rsp), %rsi         # 8-byte Reload
	cmovel	208(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, -80(%rsp)         # 8-byte Spill
	movq	-72(%rsp), %rsi         # 8-byte Reload
	cmovel	204(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, -72(%rsp)         # 8-byte Spill
	movq	-64(%rsp), %rsi         # 8-byte Reload
	cmovel	200(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, -64(%rsp)         # 8-byte Spill
	movq	-56(%rsp), %rsi         # 8-byte Reload
	cmovel	196(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, -56(%rsp)         # 8-byte Spill
	movq	-48(%rsp), %rsi         # 8-byte Reload
	cmovel	192(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, -48(%rsp)         # 8-byte Spill
	movq	-40(%rsp), %rsi         # 8-byte Reload
	cmovel	188(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, -40(%rsp)         # 8-byte Spill
	movq	-32(%rsp), %rsi         # 8-byte Reload
	cmovel	184(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, -32(%rsp)         # 8-byte Spill
	movq	-24(%rsp), %rsi         # 8-byte Reload
	cmovel	180(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, -24(%rsp)         # 8-byte Spill
	movq	-16(%rsp), %rsi         # 8-byte Reload
	cmovel	176(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, -16(%rsp)         # 8-byte Spill
	movq	-8(%rsp), %rsi          # 8-byte Reload
	cmovel	172(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, -8(%rsp)          # 8-byte Spill
	movq	(%rsp), %rsi            # 8-byte Reload
	cmovel	168(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, (%rsp)            # 8-byte Spill
	movq	8(%rsp), %rsi           # 8-byte Reload
	cmovel	164(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, 8(%rsp)           # 8-byte Spill
	movq	16(%rsp), %rsi          # 8-byte Reload
	cmovel	160(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, 16(%rsp)          # 8-byte Spill
	movq	24(%rsp), %rsi          # 8-byte Reload
	cmovel	156(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, 24(%rsp)          # 8-byte Spill
	movq	32(%rsp), %rsi          # 8-byte Reload
	cmovel	152(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, 32(%rsp)          # 8-byte Spill
	movq	40(%rsp), %rsi          # 8-byte Reload
	cmovel	148(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, 40(%rsp)          # 8-byte Spill
	movq	48(%rsp), %rsi          # 8-byte Reload
	cmovel	144(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, 48(%rsp)          # 8-byte Spill
	movq	56(%rsp), %rsi          # 8-byte Reload
	cmovel	140(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, 56(%rsp)          # 8-byte Spill
	movq	64(%rsp), %rsi          # 8-byte Reload
	cmovel	136(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, 64(%rsp)          # 8-byte Spill
	movq	72(%rsp), %rsi          # 8-byte Reload
	cmovel	132(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, 72(%rsp)          # 8-byte Spill
	cmovel	128(%rsp), %r12d        # 4-byte Folded Reload
	movq	%r12, -120(%rsp)        # 8-byte Spill
	movq	88(%rsp), %r12          # 8-byte Reload
	cmovel	124(%rsp), %r12d        # 4-byte Folded Reload
	movq	%r12, 88(%rsp)          # 8-byte Spill
	movq	80(%rsp), %rsi          # 8-byte Reload
	cmovel	120(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, 80(%rsp)          # 8-byte Spill
	movq	96(%rsp), %r12          # 8-byte Reload
	cmovel	116(%rsp), %r12d        # 4-byte Folded Reload
	movq	%r12, 96(%rsp)          # 8-byte Spill
	movq	-104(%rsp), %rsi        # 8-byte Reload
	cmovel	112(%rsp), %esi         # 4-byte Folded Reload
	movq	%rsi, -104(%rsp)        # 8-byte Spill
	cmovel	108(%rsp), %ebp         # 4-byte Folded Reload
	movq	%rbp, %r12
	cmovel	104(%rsp), %r14d        # 4-byte Folded Reload
	movq	%r14, -112(%rsp)        # 8-byte Spill
	movq	224(%rsp), %r14         # 8-byte Reload
	cmovel	%r14d, %r11d
	testb	$1, %al
	cmovnel	16(%rdi), %r14d
	movq	248(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%r15, %rax
	movq	%rax, %rbp
	andl	%edx, %r10d
	andl	$1, %r10d
	orq	%rbx, %r10
	movq	272(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%r13, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %r10
	shlq	%cl, %rbp
	movq	256(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-96(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%r10, %rax
	movq	%rax, %rbx
	movq	288(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	264(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-88(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	304(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	280(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-80(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	320(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	296(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-72(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	336(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	312(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-64(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	352(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	328(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-56(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	368(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	344(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-48(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	384(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	360(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-40(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	400(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	376(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-32(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	416(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	392(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-24(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	432(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	408(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-16(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	448(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	424(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-8(%rsp), %rax          # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	464(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	440(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	(%rsp), %rax            # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	480(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	456(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	8(%rsp), %rax           # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	496(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	472(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	16(%rsp), %rax          # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	512(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	488(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	24(%rsp), %rax          # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	528(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	504(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	32(%rsp), %rax          # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	544(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	520(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	40(%rsp), %rax          # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	560(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	536(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	48(%rsp), %rax          # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	576(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	552(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	56(%rsp), %rax          # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	592(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	568(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	64(%rsp), %rax          # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	608(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	584(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	72(%rsp), %rax          # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	624(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	600(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-120(%rsp), %rax        # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	640(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	616(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	88(%rsp), %rax          # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	656(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	632(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	80(%rsp), %rax          # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	672(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	648(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	96(%rsp), %rax          # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	688(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	664(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-104(%rsp), %rax        # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	704(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	680(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	%r12, %rax
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	712(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	movq	%rax, %rsi
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	696(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbp, %rax
	movq	%rax, %rbp
	movq	-112(%rsp), %rax        # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rbx, %rax
	movq	%rax, %rbx
	movq	728(%rsp), %rax         # 8-byte Reload
	andl	%edx, %eax
	andl	$1, %eax
	orq	%rsi, %rax
	shlq	%cl, %rax
	shlq	%cl, %rbx
	shlq	%cl, %rbp
	movq	720(%rsp), %rsi         # 8-byte Reload
	andl	%edx, %esi
	andl	$1, %esi
	orq	%rbp, %rsi
	andl	%edx, %r11d
	andl	$1, %r11d
	orq	%rbx, %r11
	movq	%r14, %rbx
	andl	%edx, %ebx
	andl	$1, %ebx
	orq	%rax, %rbx
	movq	736(%rsp), %rax         # 8-byte Reload
	movq	%rax, (%r9)
	movq	(%r8), %rax
	shrq	%rax
	testb	%cl, %cl
	cmoveq	16(%rdi), %rax
	movq	%rax, (%r8)
	cmoveq	(%rdi), %rbx
	movq	%rbx, (%rdi)
	cmoveq	8(%rdi), %r11
	movq	%r11, (%r9)
	cmoveq	16(%rdi), %rsi
	movq	%rsi, (%r8)
	addq	$744, %rsp              # imm = 0x2E8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end2:
	.size	mu, .Lfunc_end2-mu
                                        # -- End function
	.globl	gamma_                  # -- Begin function gamma_
	.p2align	4, 0x90
	.type	gamma_,@function
gamma_:                                 # @gamma_
# %bb.0:
	pushq	%r14
	pushq	%rbx
	leaq	16(%rdi), %r9
	testb	$1, %dl
	leaq	-8(%rsp), %rcx
	movq	%rcx, %r8
	cmovneq	%r9, %r8
	leaq	8(%rdi), %r10
	testb	$1, %dl
	movq	%rcx, %r14
	cmovneq	%rdi, %r14
	cmovneq	%r10, %rcx
	testq	%rsi, %rsi
	cmovgq	%rdi, %r14
	movq	(%r14), %r11
	cmpq	$1, %rsi
	cmovgq	%r10, %rcx
	movq	(%rcx), %rax
	cmpq	$2, %rsi
	cmovgq	%r9, %r8
	movq	(%r8), %r9
	movq	%r9, %rsi
	notq	%rsi
	orq	%rax, %rsi
	xorq	%r11, %rsi
	movq	%r11, %rbx
	notq	%rbx
	orq	%r9, %rbx
	xorq	%rax, %rbx
	notq	%rax
	orq	%r11, %rax
	xorq	%r9, %rax
	testb	$1, %dl
	cmoveq	(%rdi), %rsi
	movq	%rsi, (%r14)
	cmoveq	8(%rdi), %rbx
	movq	%rbx, (%rcx)
	cmoveq	16(%rdi), %rax
	movq	%rax, (%r8)
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end3:
	.size	gamma_, .Lfunc_end3-gamma_
                                        # -- End function
	.globl	theta                   # -- Begin function theta
	.p2align	4, 0x90
	.type	theta,@function
theta:                                  # @theta
# %bb.0:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	movq	%rdi, %r12
	leaq	16(%rdi), %rax
	movl	%edx, %edi
	movl	%edx, -44(%rsp)         # 4-byte Spill
	testb	$1, %dil
	leaq	-8(%rsp), %r11
	movq	%r11, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, %rdx
	leaq	8(%r12), %rcx
	testb	$1, %dil
	movq	%r11, %rdi
	cmovneq	%r12, %rdi
	cmovneq	%rcx, %r11
	testq	%rsi, %rsi
	cmovgq	%r12, %rdi
	movq	%rdi, -24(%rsp)         # 8-byte Spill
	movq	(%rdi), %rbx
	movq	%rbx, %rdi
	shrq	$16, %rdi
	movq	%rdi, %r13
	movq	%rdi, -40(%rsp)         # 8-byte Spill
	cmpq	$1, %rsi
	cmovgq	%rcx, %r11
	movq	(%r11), %rbp
	movq	%rbp, %r9
	shlq	$16, %r9
	movq	%rbp, %r15
	shrq	$16, %r15
	cmpq	$2, %rsi
	cmovgq	%rax, %rdx
	movq	%rdx, -16(%rsp)         # 8-byte Spill
	movq	(%rdx), %r14
	movq	%r14, %r10
	shlq	$16, %r10
	movq	%rbp, %rsi
	shrq	$24, %rsi
	movq	%rsi, -32(%rsp)         # 8-byte Spill
	movq	%r14, %r8
	shlq	$8, %r8
	movq	%r14, %rdx
	shrq	$8, %rdx
	movq	%rbx, %rax
	shlq	$24, %rax
	movq	%rbx, %rdi
	shlq	$16, %rdi
	movq	%rbx, %rcx
	shlq	$8, %rcx
	xorq	%rbx, %rax
	xorq	%rdi, %rax
	xorq	%rcx, %rax
	xorq	%r9, %rax
	xorq	%r15, %rax
	xorq	%rsi, %rax
	xorq	%r10, %rax
	xorq	%r8, %rax
	xorq	%rdx, %rax
	movq	%rbx, %rdx
	shrq	$8, %rdx
	xorq	%rbp, %rcx
	xorq	%rdx, %rcx
	movq	%rbp, %rdx
	shlq	$24, %rdx
	shrq	$24, %rbx
	xorq	%r13, %rcx
	xorq	%rbx, %rcx
	xorq	%r15, %rcx
	xorq	%rdx, %rcx
	movq	%r14, %rdx
	shrq	$16, %rdx
	movq	%r14, %rsi
	shrq	$24, %rsi
	xorq	%rdx, %rax
	xorq	%rsi, %rax
	movq	%rbp, %r13
	shlq	$8, %r13
	xorq	%r9, %rcx
	xorq	%r13, %rcx
	xorq	%r10, %rcx
	xorq	%rdx, %rcx
	xorq	%rsi, %rcx
	xorq	%rdi, %rcx
	xorq	%rdi, %rbx
	xorq	%r14, %rbx
	xorq	%r9, %rbx
	xorq	%r13, %rbx
	shrq	$8, %rbp
	xorq	%rbp, %rbx
	xorq	%r15, %rbx
	xorq	-32(%rsp), %rbx         # 8-byte Folded Reload
	xorq	%rdx, %rbx
	shlq	$24, %r14
	xorq	%r14, %rbx
	xorq	%r10, %rbx
	xorq	%r8, %rbx
	movq	-40(%rsp), %rdx         # 8-byte Reload
	xorq	%rdx, %rax
	xorq	%rdx, %rbx
	testb	$1, -44(%rsp)           # 1-byte Folded Reload
	cmoveq	(%r12), %rax
	movq	-24(%rsp), %rdx         # 8-byte Reload
	movq	%rax, (%rdx)
	cmoveq	8(%r12), %rcx
	movq	%rcx, (%r11)
	cmoveq	16(%r12), %rbx
	movq	-16(%rsp), %rax         # 8-byte Reload
	movq	%rbx, (%rax)
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end4:
	.size	theta, .Lfunc_end4-theta
                                        # -- End function
	.globl	pi_1                    # -- Begin function pi_1
	.p2align	4, 0x90
	.type	pi_1,@function
pi_1:                                   # @pi_1
# %bb.0:
	leaq	16(%rdi), %r8
	testb	$1, %dl
	leaq	-8(%rsp), %r9
	movq	%r9, %rcx
	cmovneq	%rdi, %rcx
	cmovneq	%r8, %r9
	testq	%rsi, %rsi
	cmovgq	%rdi, %rcx
	movq	(%rcx), %rax
	movq	%rax, %r10
	shrq	$10, %r10
	shlq	$22, %rax
	xorq	%r10, %rax
	testb	$1, %dl
	cmoveq	(%rdi), %rax
	movq	%rax, (%rcx)
	cmpq	$2, %rsi
	cmovgq	%r8, %r9
	movq	(%r9), %rax
	leaq	(%rax,%rax), %rcx
	shrq	$31, %rax
	xorq	%rax, %rcx
	testb	$1, %dl
	cmoveq	16(%rdi), %rcx
	movq	%rcx, (%r9)
	retq
.Lfunc_end5:
	.size	pi_1, .Lfunc_end5-pi_1
                                        # -- End function
	.globl	pi_2                    # -- Begin function pi_2
	.p2align	4, 0x90
	.type	pi_2,@function
pi_2:                                   # @pi_2
# %bb.0:
	leaq	16(%rdi), %r8
	testb	$1, %dl
	leaq	-8(%rsp), %r10
	movq	%r10, %rcx
	cmovneq	%rdi, %rcx
	cmovneq	%r8, %r10
	testq	%rsi, %rsi
	cmovgq	%rdi, %rcx
	movq	(%rcx), %r9
	leaq	(%r9,%r9), %rax
	shrq	$31, %r9
	xorq	%r9, %rax
	testb	$1, %dl
	cmoveq	(%rdi), %rax
	movq	%rax, (%rcx)
	cmpq	$2, %rsi
	cmovgq	%r8, %r10
	movq	(%r10), %rax
	movq	%rax, %rcx
	shrq	$10, %rcx
	shlq	$22, %rax
	xorq	%rcx, %rax
	testb	$1, %dl
	cmoveq	16(%rdi), %rax
	movq	%rax, (%r10)
	retq
.Lfunc_end6:
	.size	pi_2, .Lfunc_end6-pi_2
                                        # -- End function
	.globl	rho                     # -- Begin function rho
	.p2align	4, 0x90
	.type	rho,@function
rho:                                    # @rho
# %bb.0:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	movq	%rdi, %r8
	testq	%rsi, %rsi
	setg	%al
	orb	%dl, %al
	leaq	16(%rdi), %r14
	cmpq	$2, %rsi
	setg	%cl
	orb	%dl, %cl
	movl	%edx, -52(%rsp)         # 4-byte Spill
	testb	$1, %al
	leaq	-8(%rsp), %rbp
	movq	%rbp, %rdi
	cmovneq	%r8, %rdi
	movq	%rdi, -16(%rsp)         # 8-byte Spill
	testb	$1, %cl
	cmoveq	%rbp, %r14
	testb	$1, %al
	movq	%rbp, %rax
	cmovneq	%r8, %rax
	movq	%rax, -24(%rsp)         # 8-byte Spill
	movq	(%rax), %rbx
	movq	%rbx, %rax
	shrq	$16, %rax
	movq	%rax, %r13
	movq	%rax, -48(%rsp)         # 8-byte Spill
	leaq	8(%r8), %rcx
	cmpq	$1, %rsi
	setg	%al
	orb	%dl, %al
	testb	$1, %al
	cmoveq	%rbp, %rcx
	movq	%rcx, -32(%rsp)         # 8-byte Spill
	movq	(%rcx), %r9
	movq	(%r14), %r12
	movq	%r9, %r10
	shlq	$16, %r10
	movq	%r9, %rbp
	shrq	$16, %rbp
	movq	%r12, %r11
	shlq	$16, %r11
	movq	%r9, %r15
	shrq	$24, %r15
	movq	%r12, %rax
	shlq	$8, %rax
	movq	%rax, %rsi
	movq	%rax, -40(%rsp)         # 8-byte Spill
	movq	%r12, %rdx
	shrq	$8, %rdx
	movq	%rbx, %rcx
	shlq	$24, %rcx
	movq	%rbx, %rdi
	shlq	$16, %rdi
	movq	%rbx, %rax
	shlq	$8, %rax
	xorq	%rbx, %rcx
	xorq	%rdi, %rcx
	xorq	%rax, %rcx
	xorq	%r10, %rcx
	xorq	%rbp, %rcx
	xorq	%r15, %rcx
	xorq	%r11, %rcx
	xorq	%rsi, %rcx
	xorq	%rdx, %rcx
	movq	%rbx, %rdx
	shrq	$8, %rdx
	xorq	%r9, %rax
	xorq	%rdx, %rax
	movq	%r9, %rdx
	shlq	$24, %rdx
	shrq	$24, %rbx
	xorq	%r13, %rax
	xorq	%rbx, %rax
	xorq	%rbp, %rax
	xorq	%rdx, %rax
	movq	%r12, %rdx
	shrq	$16, %rdx
	movq	%r12, %r13
	shrq	$24, %r13
	xorq	%rdx, %rcx
	xorq	%r13, %rcx
	movq	%r9, %rsi
	shlq	$8, %rsi
	xorq	%r10, %rax
	xorq	%rsi, %rax
	xorq	%r11, %rax
	xorq	%rdx, %rax
	xorq	%r13, %rax
	xorq	%rdi, %rax
	xorq	%rdi, %rbx
	xorq	%r12, %rbx
	xorq	%r10, %rbx
	xorq	%rsi, %rbx
	shrq	$8, %r9
	xorq	%r9, %rbx
	xorq	%rbp, %rbx
	xorq	%r15, %rbx
	xorq	%rdx, %rbx
	shlq	$24, %r12
	xorq	%r12, %rbx
	xorq	%r11, %rbx
	movq	-48(%rsp), %rdx         # 8-byte Reload
	xorq	%rdx, %rcx
	xorq	-40(%rsp), %rbx         # 8-byte Folded Reload
	xorq	%rdx, %rbx
	movl	-52(%rsp), %ebp         # 4-byte Reload
	testb	$1, %bpl
	cmoveq	(%r8), %rcx
	movq	-24(%rsp), %rdx         # 8-byte Reload
	movq	%rcx, (%rdx)
	cmoveq	8(%r8), %rax
	movq	-32(%rsp), %rsi         # 8-byte Reload
	movq	%rax, (%rsi)
	cmoveq	16(%r8), %rbx
	movq	%rbx, (%r14)
	movq	(%rdx), %rax
	movq	%rdx, %r9
	movq	%rax, %rcx
	shrq	$10, %rcx
	shlq	$22, %rax
	xorq	%rcx, %rax
	testb	$1, %bpl
	cmoveq	(%r8), %rax
	movq	%rax, (%rdx)
	movq	(%r14), %rax
	leaq	(%rax,%rax), %rcx
	shrq	$31, %rax
	xorq	%rax, %rcx
	testb	$1, %bpl
	cmoveq	16(%r8), %rcx
	movq	%rcx, (%r14)
	movq	-16(%rsp), %rbx         # 8-byte Reload
	movq	(%rbx), %rax
	movq	(%rsi), %rcx
	movq	%rsi, %r10
	movq	(%r14), %rdx
	movq	%rax, %rsi
	notq	%rsi
	movq	%rcx, %rdi
	notq	%rdi
	orq	%rdx, %rsi
	orq	%rax, %rdi
	xorq	%rdx, %rdi
	notq	%rdx
	orq	%rcx, %rdx
	xorq	%rax, %rdx
	xorq	%rcx, %rsi
	testb	$1, %bpl
	cmoveq	(%r8), %rdx
	movq	%rdx, (%rbx)
	cmoveq	8(%r8), %rsi
	movq	%rsi, (%r10)
	cmoveq	16(%r8), %rdi
	movq	%rdi, (%r14)
	movq	(%r9), %rax
	leaq	(%rax,%rax), %rcx
	shrq	$31, %rax
	xorq	%rax, %rcx
	testb	$1, %bpl
	cmoveq	(%r8), %rcx
	movq	%rcx, (%r9)
	movq	(%r14), %rax
	movq	%rax, %rcx
	shrq	$10, %rcx
	shlq	$22, %rax
	xorq	%rcx, %rax
	testb	$1, %bpl
	cmoveq	16(%r8), %rax
	movq	%rax, (%r14)
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end7:
	.size	rho, .Lfunc_end7-rho
                                        # -- End function
	.globl	rndcon_gen              # -- Begin function rndcon_gen
	.p2align	4, 0x90
	.type	rndcon_gen,@function
rndcon_gen:                             # @rndcon_gen
# %bb.0:
	movq	%rdi, (%rsi)
	leaq	(%rdi,%rdi), %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testw	%di, %di
	cmovnsq	%rax, %rcx
	movq	%rcx, 8(%rsi)
	leaq	(%rcx,%rcx), %rax
	movq	%rax, %rdx
	xorq	$69649, %rdx            # imm = 0x11011
	testw	%cx, %cx
	cmovnsq	%rax, %rdx
	movq	%rdx, 16(%rsi)
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testw	%dx, %dx
	cmovnsq	%rax, %rcx
	movq	%rcx, 24(%rsi)
	leaq	(%rcx,%rcx), %rax
	movq	%rax, %rdx
	xorq	$69649, %rdx            # imm = 0x11011
	testw	%cx, %cx
	cmovnsq	%rax, %rdx
	movq	%rdx, 32(%rsi)
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testw	%dx, %dx
	cmovnsq	%rax, %rcx
	movq	%rcx, 40(%rsi)
	leaq	(%rcx,%rcx), %rax
	movq	%rax, %rdx
	xorq	$69649, %rdx            # imm = 0x11011
	testw	%cx, %cx
	cmovnsq	%rax, %rdx
	movq	%rdx, 48(%rsi)
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testw	%dx, %dx
	cmovnsq	%rax, %rcx
	movq	%rcx, 56(%rsi)
	leaq	(%rcx,%rcx), %rax
	movq	%rax, %rdx
	xorq	$69649, %rdx            # imm = 0x11011
	testw	%cx, %cx
	cmovnsq	%rax, %rdx
	movq	%rdx, 64(%rsi)
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testw	%dx, %dx
	cmovnsq	%rax, %rcx
	movq	%rcx, 72(%rsi)
	leaq	(%rcx,%rcx), %rax
	movq	%rax, %rdx
	xorq	$69649, %rdx            # imm = 0x11011
	testw	%cx, %cx
	cmovnsq	%rax, %rdx
	movq	%rdx, 80(%rsi)
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testw	%dx, %dx
	cmovnsq	%rax, %rcx
	movq	%rcx, 88(%rsi)
	retq
.Lfunc_end8:
	.size	rndcon_gen, .Lfunc_end8-rndcon_gen
                                        # -- End function
	.globl	encrypt                 # -- Begin function encrypt
	.p2align	4, 0x90
	.type	encrypt,@function
encrypt:                                # @encrypt
# %bb.0:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$248, %rsp
	movl	%r8d, %ebp
	movq	%rcx, %r9
	movq	%rdx, %r12
	movq	%rsi, %r8
	movq	%rdi, %rbx
	addq	$8, %rdx
	cmpq	$1, %rcx
	setg	%al
	orb	%bpl, %al
	leaq	16(%r12), %rsi
	cmpq	$2, %rcx
	movq	%rcx, 40(%rsp)          # 8-byte Spill
	setg	%cl
	orb	%bpl, %cl
	testb	$1, %cl
	leaq	232(%rsp), %rdi
	movq	%rdi, %r10
	cmovneq	%rsi, %r10
	leaq	240(%rsp), %rcx
	cmoveq	%rcx, %rsi
	movq	%rsi, 80(%rsp)          # 8-byte Spill
	testb	$1, %al
	movq	%rdi, %r11
	cmovneq	%rdx, %r11
	cmoveq	%rcx, %rdx
	movq	%rdx, 72(%rsp)          # 8-byte Spill
	testb	$1, %bpl
	cmovneq	%r12, %rcx
	movq	%rcx, 64(%rsp)          # 8-byte Spill
	leaq	136(%rbx), %rax
	movq	%rax, 224(%rsp)         # 8-byte Spill
	testb	$1, %bpl
	movq	%rdi, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 216(%rsp)         # 8-byte Spill
	leaq	128(%rbx), %rax
	movq	%rax, 208(%rsp)         # 8-byte Spill
	testb	$1, %bpl
	movq	%rdi, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 200(%rsp)         # 8-byte Spill
	testb	$1, %bpl
	leaq	120(%rbx), %rax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	movq	%rdi, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 184(%rsp)         # 8-byte Spill
	testb	$1, %bpl
	leaq	112(%rbx), %rax
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	%rdi, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 168(%rsp)         # 8-byte Spill
	testb	$1, %bpl
	leaq	104(%rbx), %rax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	%rdi, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 152(%rsp)         # 8-byte Spill
	testb	$1, %bpl
	leaq	96(%rbx), %rax
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	%rdi, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 136(%rsp)         # 8-byte Spill
	testb	$1, %bpl
	leaq	88(%rbx), %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	%rdi, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 120(%rsp)         # 8-byte Spill
	testb	$1, %bpl
	leaq	80(%rbx), %rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	%rdi, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 104(%rsp)         # 8-byte Spill
	testb	$1, %bpl
	leaq	72(%rbx), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%rdi, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 88(%rsp)          # 8-byte Spill
	testq	%r8, %r8
	setg	%al
	orb	%bpl, %al
	testb	$1, %al
	movq	%rdi, %rdx
	cmovneq	%rbx, %rdx
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	leaq	48(%rbx), %rax
	cmoveq	%rdi, %rax
	movq	(%rax), %rcx
	shlq	$16, %rcx
	xorq	(%rdx), %rcx
	xorl	%edx, %edx
	testb	$1, %bpl
	cmoveq	%rdx, %rcx
	xorq	%rcx, (%r12)
	cmpq	$1, %r8
	movq	%r8, 48(%rsp)           # 8-byte Spill
	setg	%cl
	orb	%bpl, %cl
	testb	$1, %cl
	leaq	8(%rbx), %rsi
	cmoveq	%rdi, %rsi
	movq	%rsi, 8(%rsp)           # 8-byte Spill
	movq	%r11, 56(%rsp)          # 8-byte Spill
	movq	(%r11), %rdx
	xorq	(%rsi), %rdx
	testb	$1, %bpl
	cmoveq	8(%r12), %rdx
	movq	%rdx, (%r11)
	cmpq	$2, %r8
	setg	%r14b
	orb	%bpl, %r14b
	testb	$1, %r14b
	movq	(%rax), %rax
	leaq	16(%rbx), %r15
	cmoveq	%rdi, %r15
	xorq	(%r15), %rax
	movq	%r15, 32(%rsp)          # 8-byte Spill
	movq	%r10, 24(%rsp)          # 8-byte Spill
	xorq	(%r10), %rax
	testb	$1, %bpl
	cmoveq	16(%r12), %rax
	movq	%rax, (%r10)
	testb	$1, %cl
	leaq	56(%rbx), %r13
	cmoveq	%rdi, %r13
	movq	%r12, %rdi
	movq	%r9, %rsi
	movl	%ebp, %edx
	callq	rho
	movq	(%r13), %rax
	shlq	$16, %rax
	movq	16(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bpl
	movl	$0, %ecx
	cmoveq	%rcx, %rax
	xorq	%rax, (%r12)
	movq	56(%rsp), %rdx          # 8-byte Reload
	movq	(%rdx), %rax
	movq	8(%rsp), %rcx           # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bpl
	cmoveq	8(%r12), %rax
	movq	%rax, (%rdx)
	movq	(%r13), %rax
	xorq	(%r15), %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bpl
	cmoveq	16(%r12), %rax
	addq	$64, %rbx
	testb	$1, %r14b
	movq	%rax, (%rcx)
	leaq	232(%rsp), %rax
	cmoveq	%rax, %rbx
	movq	%r12, %rdi
	movq	40(%rsp), %r15          # 8-byte Reload
	movq	%r15, %rsi
	movl	%ebp, %edx
	callq	rho
	movq	(%rbx), %rax
	shlq	$16, %rax
	movq	16(%rsp), %r13          # 8-byte Reload
	xorq	(%r13), %rax
	testb	$1, %bpl
	movl	$0, %ecx
	cmoveq	%rcx, %rax
	xorq	%rax, (%r12)
	movq	56(%rsp), %rdx          # 8-byte Reload
	movq	(%rdx), %rax
	movq	8(%rsp), %rcx           # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bpl
	cmoveq	8(%r12), %rax
	movq	%rax, (%rdx)
	movq	(%rbx), %rax
	movq	32(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bpl
	cmoveq	16(%r12), %rax
	movq	%rax, (%rcx)
	movq	%r12, %rdi
	movq	%r15, %rsi
	movl	%ebp, %edx
	callq	rho
	movq	48(%rsp), %rbx          # 8-byte Reload
	cmpq	$3, %rbx
	movq	88(%rsp), %rcx          # 8-byte Reload
	cmovgq	96(%rsp), %rcx          # 8-byte Folded Reload
	movq	(%rcx), %rax
	movq	%rcx, %rdx
	shlq	$16, %rax
	xorq	(%r13), %rax
	testb	$1, %bpl
	movl	$0, %ecx
	cmoveq	%rcx, %rax
	xorq	%rax, (%r12)
	movq	56(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx), %rax
	movq	8(%rsp), %r14           # 8-byte Reload
	xorq	(%r14), %rax
	testb	$1, %bpl
	cmoveq	8(%r12), %rax
	movq	%rax, (%rcx)
	movq	(%rdx), %rax
	movq	32(%rsp), %r13          # 8-byte Reload
	xorq	(%r13), %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bpl
	cmoveq	16(%r12), %rax
	movq	%rax, (%rcx)
	movq	%r12, %rdi
	movq	%r15, %rsi
	movl	%ebp, %edx
	callq	rho
	cmpq	$4, %rbx
	movq	104(%rsp), %rcx         # 8-byte Reload
	cmovgq	112(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	movq	16(%rsp), %rbx          # 8-byte Reload
	xorq	(%rbx), %rax
	testb	$1, %bpl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r12)
	movq	56(%rsp), %r15          # 8-byte Reload
	movq	(%r15), %rax
	xorq	(%r14), %rax
	testb	$1, %bpl
	cmoveq	8(%r12), %rax
	movq	%rax, (%r15)
	movq	(%rcx), %rax
	xorq	(%r13), %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bpl
	cmoveq	16(%r12), %rax
	movq	%rax, (%rcx)
	movq	%r12, %rdi
	movq	40(%rsp), %r13          # 8-byte Reload
	movq	%r13, %rsi
	movl	%ebp, %edx
	callq	rho
	movq	48(%rsp), %r14          # 8-byte Reload
	cmpq	$5, %r14
	movq	120(%rsp), %rcx         # 8-byte Reload
	cmovgq	128(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	testb	$1, %bpl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r12)
	movq	(%r15), %rax
	movq	8(%rsp), %rdx           # 8-byte Reload
	xorq	(%rdx), %rax
	testb	$1, %bpl
	cmoveq	8(%r12), %rax
	movq	%rax, (%r15)
	movq	(%rcx), %rax
	movq	32(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bpl
	cmoveq	16(%r12), %rax
	movq	%rax, (%rcx)
	movq	%r12, %rdi
	movq	%r13, %rsi
	movl	%ebp, %edx
	callq	rho
	cmpq	$6, %r14
	movq	136(%rsp), %rcx         # 8-byte Reload
	cmovgq	144(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	movq	16(%rsp), %r13          # 8-byte Reload
	xorq	(%r13), %rax
	testb	$1, %bpl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r12)
	movq	(%r15), %rax
	movq	8(%rsp), %rdx           # 8-byte Reload
	xorq	(%rdx), %rax
	testb	$1, %bpl
	cmoveq	8(%r12), %rax
	movq	%rax, (%r15)
	movq	(%rcx), %rax
	movq	32(%rsp), %rbx          # 8-byte Reload
	xorq	(%rbx), %rax
	movq	24(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bpl
	cmoveq	16(%r12), %rax
	movq	%rax, (%rcx)
	movq	%r12, %rdi
	movq	40(%rsp), %rsi          # 8-byte Reload
	movl	%ebp, %edx
	callq	rho
	cmpq	$7, %r14
	movq	152(%rsp), %rcx         # 8-byte Reload
	cmovgq	160(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	xorq	(%r13), %rax
	testb	$1, %bpl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r12)
	movq	(%r15), %rax
	movq	8(%rsp), %r14           # 8-byte Reload
	xorq	(%r14), %rax
	testb	$1, %bpl
	cmoveq	8(%r12), %rax
	movq	%rax, (%r15)
	movq	(%rcx), %rax
	xorq	(%rbx), %rax
	movq	24(%rsp), %rbx          # 8-byte Reload
	xorq	(%rbx), %rax
	testb	$1, %bpl
	cmoveq	16(%r12), %rax
	movq	%rax, (%rbx)
	movq	%r12, %rdi
	movq	40(%rsp), %rsi          # 8-byte Reload
	movl	%ebp, %edx
	callq	rho
	cmpq	$8, 48(%rsp)            # 8-byte Folded Reload
	movq	168(%rsp), %rcx         # 8-byte Reload
	cmovgq	176(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	xorq	(%r13), %rax
	testb	$1, %bpl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r12)
	movq	(%r15), %rax
	xorq	(%r14), %rax
	testb	$1, %bpl
	cmoveq	8(%r12), %rax
	movq	%rax, (%r15)
	movq	(%rcx), %rax
	movq	32(%rsp), %r13          # 8-byte Reload
	xorq	(%r13), %rax
	xorq	(%rbx), %rax
	testb	$1, %bpl
	cmoveq	16(%r12), %rax
	movq	%rax, (%rbx)
	movq	%r12, %rdi
	movq	40(%rsp), %r14          # 8-byte Reload
	movq	%r14, %rsi
	movl	%ebp, %edx
	callq	rho
	cmpq	$9, 48(%rsp)            # 8-byte Folded Reload
	movq	184(%rsp), %rcx         # 8-byte Reload
	cmovgq	192(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	movq	16(%rsp), %rdx          # 8-byte Reload
	xorq	(%rdx), %rax
	testb	$1, %bpl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r12)
	movq	(%r15), %rax
	movq	8(%rsp), %rdx           # 8-byte Reload
	xorq	(%rdx), %rax
	testb	$1, %bpl
	cmoveq	8(%r12), %rax
	movq	%rax, (%r15)
	movq	(%rcx), %rax
	xorq	(%r13), %rax
	xorq	(%rbx), %rax
	testb	$1, %bpl
	cmoveq	16(%r12), %rax
	movq	%rax, (%rbx)
	movq	%r12, %rdi
	movq	%r14, %rsi
	movl	%ebp, %edx
	callq	rho
	movq	48(%rsp), %r14          # 8-byte Reload
	cmpq	$10, %r14
	movq	200(%rsp), %rcx         # 8-byte Reload
	cmovgq	208(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	movq	16(%rsp), %rdx          # 8-byte Reload
	xorq	(%rdx), %rax
	testb	$1, %bpl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r12)
	movq	(%r15), %rax
	movq	8(%rsp), %r13           # 8-byte Reload
	xorq	(%r13), %rax
	testb	$1, %bpl
	cmoveq	8(%r12), %rax
	movq	%rax, (%r15)
	movq	(%rcx), %rax
	movq	32(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	xorq	(%rbx), %rax
	testb	$1, %bpl
	cmoveq	16(%r12), %rax
	movq	%rax, (%rbx)
	movq	%r12, %rdi
	movq	40(%rsp), %rsi          # 8-byte Reload
	movl	%ebp, %edx
	callq	rho
	cmpq	$11, %r14
	movq	216(%rsp), %rcx         # 8-byte Reload
	cmovgq	224(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	movq	16(%rsp), %rdx          # 8-byte Reload
	xorq	(%rdx), %rax
	testb	$1, %bpl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r12)
	movq	(%r15), %rax
	xorq	(%r13), %rax
	testb	$1, %bpl
	cmoveq	8(%r12), %rax
	movq	%rax, (%r15)
	movq	(%rcx), %rax
	movq	32(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	xorq	(%rbx), %rax
	testb	$1, %bpl
	cmoveq	16(%r12), %rax
	movq	%rax, (%rbx)
	cmpq	$0, 40(%rsp)            # 8-byte Folded Reload
	movq	64(%rsp), %rax          # 8-byte Reload
	cmovgq	%r12, %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	(%rax), %rdx
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	(%rax), %r14
	movq	%r14, %r8
	shlq	$16, %r8
	movq	%r14, %r11
	shrq	$16, %r11
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	(%rax), %r9
	movq	%r9, %r10
	shlq	$16, %r10
	movq	%r14, %rax
	shrq	$24, %rax
	movq	%rax, %rbx
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	%r9, %rax
	shlq	$8, %rax
	movq	%rax, %rsi
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%r9, %rdi
	shrq	$8, %rdi
	movq	%rdx, %rcx
	shlq	$24, %rcx
	movq	%rdx, %r15
	shlq	$16, %r15
	movq	%rdx, %rax
	shlq	$8, %rax
	xorq	%rdx, %rcx
	xorq	%r15, %rcx
	xorq	%rax, %rcx
	xorq	%r8, %rcx
	xorq	%r11, %rcx
	xorq	%rbx, %rcx
	xorq	%r10, %rcx
	xorq	%rsi, %rcx
	xorq	%rdi, %rcx
	movq	%rdx, %rdi
	shrq	$8, %rdi
	xorq	%r14, %rax
	xorq	%rdi, %rax
	movq	%rdx, %rdi
	shrq	$16, %rdi
	movq	%r14, %rbx
	shlq	$24, %rbx
	shrq	$24, %rdx
	xorq	%rdi, %rax
	xorq	%rdx, %rax
	xorq	%r11, %rax
	xorq	%rbx, %rax
	movq	%r9, %rbx
	shrq	$16, %rbx
	movq	%r9, %r13
	shrq	$24, %r13
	xorq	%rbx, %rcx
	xorq	%r13, %rcx
	movq	%r14, %rsi
	shlq	$8, %rsi
	xorq	%r8, %rax
	xorq	%rsi, %rax
	xorq	%r10, %rax
	xorq	%rbx, %rax
	xorq	%r13, %rax
	xorq	%r15, %rax
	xorq	%r15, %rdx
	xorq	%r9, %rdx
	xorq	%r8, %rdx
	xorq	%rsi, %rdx
	shrq	$8, %r14
	xorq	%r14, %rdx
	xorq	%r11, %rdx
	xorq	16(%rsp), %rdx          # 8-byte Folded Reload
	xorq	%rbx, %rdx
	shlq	$24, %r9
	xorq	%r9, %rdx
	xorq	%r10, %rdx
	xorq	8(%rsp), %rdx           # 8-byte Folded Reload
	xorq	%rdi, %rcx
	xorq	%rdi, %rdx
	testb	$1, %bpl
	cmoveq	(%r12), %rcx
	movq	64(%rsp), %rsi          # 8-byte Reload
	movq	%rcx, (%rsi)
	cmoveq	8(%r12), %rax
	movq	72(%rsp), %rcx          # 8-byte Reload
	movq	%rax, (%rcx)
	cmoveq	16(%r12), %rdx
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rdx, (%rax)
	addq	$248, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end9:
	.size	encrypt, .Lfunc_end9-encrypt
                                        # -- End function
	.globl	decrypt                 # -- Begin function decrypt
	.p2align	4, 0x90
	.type	decrypt,@function
decrypt:                                # @decrypt
# %bb.0:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$248, %rsp
	movl	%r8d, %ebx
	movq	%rcx, %rbp
	movq	%rdx, %r15
	movq	%rsi, 40(%rsp)          # 8-byte Spill
	movq	%rdi, %r13
	addq	$8, %rdx
	cmpq	$1, %rcx
	setg	%al
	orb	%bl, %al
	leaq	16(%r15), %rsi
	cmpq	$2, %rcx
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	setg	%cl
	orb	%bl, %cl
	testb	$1, %cl
	leaq	232(%rsp), %r12
	movq	%r12, %rcx
	cmovneq	%rsi, %rcx
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	leaq	240(%rsp), %rcx
	cmoveq	%rcx, %rsi
	movq	%rsi, 80(%rsp)          # 8-byte Spill
	testb	$1, %al
	movq	%r12, %r14
	cmovneq	%rdx, %r14
	cmoveq	%rcx, %rdx
	movq	%rdx, 72(%rsp)          # 8-byte Spill
	testb	$1, %bl
	cmovneq	%r15, %rcx
	movq	%rcx, 64(%rsp)          # 8-byte Spill
	leaq	232(%rdi), %rax
	movq	%rax, 224(%rsp)         # 8-byte Spill
	testb	$1, %bl
	movq	%r12, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 216(%rsp)         # 8-byte Spill
	leaq	224(%rdi), %rax
	movq	%rax, 208(%rsp)         # 8-byte Spill
	testb	$1, %bl
	movq	%r12, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 200(%rsp)         # 8-byte Spill
	testb	$1, %bl
	leaq	216(%rdi), %rax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	movq	%r12, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 184(%rsp)         # 8-byte Spill
	testb	$1, %bl
	leaq	208(%rdi), %rax
	movq	%rax, 176(%rsp)         # 8-byte Spill
	movq	%r12, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 168(%rsp)         # 8-byte Spill
	testb	$1, %bl
	leaq	200(%rdi), %rax
	movq	%rax, 160(%rsp)         # 8-byte Spill
	movq	%r12, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 152(%rsp)         # 8-byte Spill
	testb	$1, %bl
	leaq	192(%rdi), %rax
	movq	%rax, 144(%rsp)         # 8-byte Spill
	movq	%r12, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 136(%rsp)         # 8-byte Spill
	testb	$1, %bl
	leaq	184(%rdi), %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	movq	%r12, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 120(%rsp)         # 8-byte Spill
	testb	$1, %bl
	leaq	176(%rdi), %rax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movq	%r12, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 104(%rsp)         # 8-byte Spill
	testb	$1, %bl
	leaq	168(%rdi), %rax
	movq	%rax, 96(%rsp)          # 8-byte Spill
	movq	%r12, %rcx
	cmovneq	%rax, %rcx
	movq	%rcx, 88(%rsp)          # 8-byte Spill
	movq	%r15, %rdi
	movq	%rbp, %rsi
	movl	%r8d, %edx
	callq	mu
	leaq	24(%r13), %rdx
	movq	40(%rsp), %rbp          # 8-byte Reload
	testq	%rbp, %rbp
	setg	%cl
	orb	%bl, %cl
	leaq	144(%r13), %rax
	testb	$1, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	cmoveq	%r12, %rax
	movq	%r12, %rdi
	movq	(%rax), %rcx
	shlq	$16, %rcx
	xorq	(%rdx), %rcx
	xorl	%edx, %edx
	testb	$1, %bl
	cmoveq	%rdx, %rcx
	xorq	%rcx, (%r15)
	leaq	32(%r13), %rsi
	cmpq	$1, %rbp
	setg	%cl
	orb	%bl, %cl
	testb	$1, %cl
	movq	(%r14), %rdx
	cmoveq	%r12, %rsi
	movq	%rsi, 48(%rsp)          # 8-byte Spill
	xorq	(%rsi), %rdx
	testb	$1, %bl
	cmoveq	8(%r15), %rdx
	movq	%rdx, (%r14)
	leaq	40(%r13), %rdx
	cmpq	$2, %rbp
	setg	%r12b
	orb	%bl, %r12b
	testb	$1, %r12b
	movq	(%rax), %rax
	cmoveq	%rdi, %rdx
	movq	%rdx, 8(%rsp)           # 8-byte Spill
	xorq	(%rdx), %rax
	movq	32(%rsp), %rdx          # 8-byte Reload
	xorq	(%rdx), %rax
	testb	$1, %bl
	cmoveq	16(%r15), %rax
	leaq	152(%r13), %rbp
	testb	$1, %cl
	movq	%rax, (%rdx)
	cmoveq	%rdi, %rbp
	movq	%r15, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
	movl	%ebx, %edx
	callq	rho
	movq	(%rbp), %rax
	shlq	$16, %rax
	movq	16(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bl
	movl	$0, %ecx
	cmoveq	%rcx, %rax
	xorq	%rax, (%r15)
	movq	%r14, %rcx
	movq	%r14, 56(%rsp)          # 8-byte Spill
	movq	(%r14), %rax
	movq	48(%rsp), %r14          # 8-byte Reload
	xorq	(%r14), %rax
	testb	$1, %bl
	cmoveq	8(%r15), %rax
	movq	%rax, (%rcx)
	movq	(%rbp), %rax
	movq	8(%rsp), %rcx           # 8-byte Reload
	xorq	(%rcx), %rax
	movq	32(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bl
	cmoveq	16(%r15), %rax
	addq	$160, %r13
	testb	$1, %r12b
	movq	%rax, (%rcx)
	movq	%rcx, %r12
	leaq	232(%rsp), %rax
	cmoveq	%rax, %r13
	movq	%r15, %rdi
	movq	24(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, %rsi
	movl	%ebx, %edx
	callq	rho
	movq	(%r13), %rax
	shlq	$16, %rax
	movq	16(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bl
	movl	$0, %ecx
	cmoveq	%rcx, %rax
	xorq	%rax, (%r15)
	movq	56(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx), %rax
	xorq	(%r14), %rax
	testb	$1, %bl
	cmoveq	8(%r15), %rax
	movq	%rax, (%rcx)
	movq	%rcx, %r14
	movq	(%r13), %rax
	movq	8(%rsp), %rcx           # 8-byte Reload
	xorq	(%rcx), %rax
	xorq	(%r12), %rax
	testb	$1, %bl
	cmoveq	16(%r15), %rax
	movq	%rax, (%r12)
	movq	%r15, %rdi
	movq	%rbp, %rsi
	movl	%ebx, %edx
	callq	rho
	movq	40(%rsp), %rbp          # 8-byte Reload
	cmpq	$3, %rbp
	movq	88(%rsp), %rcx          # 8-byte Reload
	cmovgq	96(%rsp), %rcx          # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	movq	16(%rsp), %r13          # 8-byte Reload
	xorq	(%r13), %rax
	testb	$1, %bl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r15)
	movq	(%r14), %rax
	movq	48(%rsp), %r12          # 8-byte Reload
	xorq	(%r12), %rax
	testb	$1, %bl
	cmoveq	8(%r15), %rax
	movq	%rax, (%r14)
	movq	(%rcx), %rax
	movq	8(%rsp), %r14           # 8-byte Reload
	xorq	(%r14), %rax
	movq	32(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bl
	cmoveq	16(%r15), %rax
	movq	%rax, (%rcx)
	movq	%r15, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
	movl	%ebx, %edx
	callq	rho
	cmpq	$4, %rbp
	movq	104(%rsp), %rcx         # 8-byte Reload
	cmovgq	112(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	xorq	(%r13), %rax
	testb	$1, %bl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r15)
	movq	56(%rsp), %rdx          # 8-byte Reload
	movq	(%rdx), %rax
	movq	%r12, %rbp
	xorq	(%r12), %rax
	testb	$1, %bl
	cmoveq	8(%r15), %rax
	movq	%rax, (%rdx)
	movq	(%rcx), %rax
	xorq	(%r14), %rax
	movq	32(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bl
	cmoveq	16(%r15), %rax
	movq	%rax, (%rcx)
	movq	%r15, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
	movl	%ebx, %edx
	callq	rho
	movq	40(%rsp), %r12          # 8-byte Reload
	cmpq	$5, %r12
	movq	120(%rsp), %rcx         # 8-byte Reload
	cmovgq	128(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	xorq	(%r13), %rax
	testb	$1, %bl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r15)
	movq	56(%rsp), %r14          # 8-byte Reload
	movq	(%r14), %rax
	xorq	(%rbp), %rax
	testb	$1, %bl
	cmoveq	8(%r15), %rax
	movq	%rax, (%r14)
	movq	(%rcx), %rax
	movq	8(%rsp), %r13           # 8-byte Reload
	xorq	(%r13), %rax
	movq	32(%rsp), %rcx          # 8-byte Reload
	xorq	(%rcx), %rax
	testb	$1, %bl
	cmoveq	16(%r15), %rax
	movq	%rax, (%rcx)
	movq	%r15, %rdi
	movq	24(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, %rsi
	movl	%ebx, %edx
	callq	rho
	cmpq	$6, %r12
	movq	136(%rsp), %rcx         # 8-byte Reload
	cmovgq	144(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	movq	16(%rsp), %rdx          # 8-byte Reload
	xorq	(%rdx), %rax
	testb	$1, %bl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r15)
	movq	(%r14), %rax
	movq	48(%rsp), %rdx          # 8-byte Reload
	xorq	(%rdx), %rax
	testb	$1, %bl
	cmoveq	8(%r15), %rax
	movq	%rax, (%r14)
	movq	(%rcx), %rax
	xorq	(%r13), %rax
	movq	32(%rsp), %r12          # 8-byte Reload
	xorq	(%r12), %rax
	testb	$1, %bl
	cmoveq	16(%r15), %rax
	movq	%rax, (%r12)
	movq	%r15, %rdi
	movq	%rbp, %rsi
	movl	%ebx, %edx
	callq	rho
	movq	40(%rsp), %rbp          # 8-byte Reload
	cmpq	$7, %rbp
	movq	152(%rsp), %rcx         # 8-byte Reload
	cmovgq	160(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	movq	16(%rsp), %r13          # 8-byte Reload
	xorq	(%r13), %rax
	testb	$1, %bl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r15)
	movq	(%r14), %rax
	movq	48(%rsp), %rdx          # 8-byte Reload
	xorq	(%rdx), %rax
	testb	$1, %bl
	cmoveq	8(%r15), %rax
	movq	%rax, (%r14)
	movq	(%rcx), %rax
	movq	8(%rsp), %rcx           # 8-byte Reload
	xorq	(%rcx), %rax
	xorq	(%r12), %rax
	testb	$1, %bl
	cmoveq	16(%r15), %rax
	movq	%rax, (%r12)
	movq	%r15, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
	movl	%ebx, %edx
	callq	rho
	cmpq	$8, %rbp
	movq	168(%rsp), %rcx         # 8-byte Reload
	cmovgq	176(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	xorq	(%r13), %rax
	testb	$1, %bl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r15)
	movq	(%r14), %rax
	movq	48(%rsp), %rbp          # 8-byte Reload
	xorq	(%rbp), %rax
	testb	$1, %bl
	cmoveq	8(%r15), %rax
	movq	%rax, (%r14)
	movq	(%rcx), %rax
	movq	8(%rsp), %r14           # 8-byte Reload
	xorq	(%r14), %rax
	xorq	(%r12), %rax
	testb	$1, %bl
	cmoveq	16(%r15), %rax
	movq	%rax, (%r12)
	movq	%r15, %rdi
	movq	24(%rsp), %r13          # 8-byte Reload
	movq	%r13, %rsi
	movl	%ebx, %edx
	callq	rho
	movq	40(%rsp), %r12          # 8-byte Reload
	cmpq	$9, %r12
	movq	184(%rsp), %rcx         # 8-byte Reload
	cmovgq	192(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	movq	16(%rsp), %rdx          # 8-byte Reload
	xorq	(%rdx), %rax
	testb	$1, %bl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r15)
	movq	56(%rsp), %rdx          # 8-byte Reload
	movq	(%rdx), %rax
	xorq	(%rbp), %rax
	testb	$1, %bl
	cmoveq	8(%r15), %rax
	movq	%rax, (%rdx)
	movq	(%rcx), %rax
	xorq	(%r14), %rax
	movq	32(%rsp), %r14          # 8-byte Reload
	xorq	(%r14), %rax
	testb	$1, %bl
	cmoveq	16(%r15), %rax
	movq	%rax, (%r14)
	movq	%r15, %rdi
	movq	%r13, %rsi
	movl	%ebx, %edx
	callq	rho
	cmpq	$10, %r12
	movq	200(%rsp), %rcx         # 8-byte Reload
	cmovgq	208(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	movq	16(%rsp), %r12          # 8-byte Reload
	xorq	(%r12), %rax
	testb	$1, %bl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r15)
	movq	56(%rsp), %rdx          # 8-byte Reload
	movq	(%rdx), %rax
	xorq	(%rbp), %rax
	testb	$1, %bl
	cmoveq	8(%r15), %rax
	movq	%rax, (%rdx)
	movq	%rdx, %rbp
	movq	(%rcx), %rax
	movq	8(%rsp), %rcx           # 8-byte Reload
	xorq	(%rcx), %rax
	xorq	(%r14), %rax
	testb	$1, %bl
	cmoveq	16(%r15), %rax
	movq	%rax, (%r14)
	movq	%r15, %rdi
	movq	%r13, %rsi
	movl	%ebx, %edx
	callq	rho
	cmpq	$11, 40(%rsp)           # 8-byte Folded Reload
	movq	216(%rsp), %rcx         # 8-byte Reload
	cmovgq	224(%rsp), %rcx         # 8-byte Folded Reload
	movq	(%rcx), %rax
	shlq	$16, %rax
	xorq	(%r12), %rax
	testb	$1, %bl
	movl	$0, %edx
	cmoveq	%rdx, %rax
	xorq	%rax, (%r15)
	movq	(%rbp), %rax
	movq	48(%rsp), %rdx          # 8-byte Reload
	xorq	(%rdx), %rax
	testb	$1, %bl
	cmoveq	8(%r15), %rax
	movq	%rax, (%rbp)
	movq	(%rcx), %rax
	movq	8(%rsp), %rcx           # 8-byte Reload
	xorq	(%rcx), %rax
	xorq	(%r14), %rax
	testb	$1, %bl
	cmoveq	16(%r15), %rax
	movq	%rax, (%r14)
	testq	%r13, %r13
	movq	64(%rsp), %rax          # 8-byte Reload
	cmovgq	%r15, %rax
	movq	%rax, 64(%rsp)          # 8-byte Spill
	movq	(%rax), %rdx
	movq	72(%rsp), %rax          # 8-byte Reload
	movq	(%rax), %r14
	movq	%r14, %r8
	shlq	$16, %r8
	movq	%r14, %r11
	shrq	$16, %r11
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	(%rax), %r9
	movq	%r9, %r10
	shlq	$16, %r10
	movq	%r14, %rax
	shrq	$24, %rax
	movq	%rax, %rbp
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movq	%r9, %rax
	shlq	$8, %rax
	movq	%rax, %rsi
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%r9, %rdi
	shrq	$8, %rdi
	movq	%rdx, %rcx
	shlq	$24, %rcx
	movq	%rdx, %r12
	shlq	$16, %r12
	movq	%rdx, %rax
	shlq	$8, %rax
	xorq	%rdx, %rcx
	xorq	%r12, %rcx
	xorq	%rax, %rcx
	xorq	%r8, %rcx
	xorq	%r11, %rcx
	xorq	%rbp, %rcx
	xorq	%r10, %rcx
	xorq	%rsi, %rcx
	xorq	%rdi, %rcx
	movq	%rdx, %rdi
	shrq	$8, %rdi
	xorq	%r14, %rax
	xorq	%rdi, %rax
	movq	%rdx, %rdi
	shrq	$16, %rdi
	movq	%r14, %rbp
	shlq	$24, %rbp
	shrq	$24, %rdx
	xorq	%rdi, %rax
	xorq	%rdx, %rax
	xorq	%r11, %rax
	xorq	%rbp, %rax
	movq	%r9, %rbp
	shrq	$16, %rbp
	movq	%r9, %r13
	shrq	$24, %r13
	xorq	%rbp, %rcx
	xorq	%r13, %rcx
	movq	%r14, %rsi
	shlq	$8, %rsi
	xorq	%r8, %rax
	xorq	%rsi, %rax
	xorq	%r10, %rax
	xorq	%rbp, %rax
	xorq	%r13, %rax
	xorq	%r12, %rax
	xorq	%r12, %rdx
	xorq	%r9, %rdx
	xorq	%r8, %rdx
	xorq	%rsi, %rdx
	shrq	$8, %r14
	xorq	%r14, %rdx
	xorq	%r11, %rdx
	xorq	16(%rsp), %rdx          # 8-byte Folded Reload
	xorq	%rbp, %rdx
	shlq	$24, %r9
	xorq	%r9, %rdx
	xorq	%r10, %rdx
	xorq	8(%rsp), %rdx           # 8-byte Folded Reload
	xorq	%rdi, %rcx
	xorq	%rdi, %rdx
	testb	$1, %bl
	cmoveq	(%r15), %rcx
	movq	64(%rsp), %rsi          # 8-byte Reload
	movq	%rcx, (%rsi)
	cmoveq	8(%r15), %rax
	movq	72(%rsp), %rcx          # 8-byte Reload
	movq	%rax, (%rcx)
	cmoveq	16(%r15), %rdx
	movq	80(%rsp), %rax          # 8-byte Reload
	movq	%rdx, (%rax)
	movq	%r15, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
	movl	%ebx, %edx
	callq	mu
	addq	$248, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end10:
	.size	decrypt, .Lfunc_end10-decrypt
                                        # -- End function
	.globl	twy_key                 # -- Begin function twy_key
	.p2align	4, 0x90
	.type	twy_key,@function
twy_key:                                # @twy_key
# %bb.0:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	%rsi, 16(%rsp)          # 8-byte Spill
	movq	%rdi, %rbx
	movq	(%rdx), %rcx
	movq	%rcx, (%rdi)
	movq	%rcx, 24(%rdi)
	movq	8(%rdx), %r15
	movq	%r15, 8(%rdi)
	movq	%r15, 32(%rdi)
	movq	16(%rdx), %r10
	movq	%rcx, %r9
	shrq	$16, %r9
	movq	%r15, %rsi
	shlq	$16, %rsi
	movq	%r15, %r11
	shrq	$16, %r11
	movq	%r10, %r8
	shlq	$16, %r8
	movq	%r15, %r14
	shrq	$24, %r14
	movq	%r10, %rax
	shlq	$8, %rax
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movq	%r10, %rbp
	shrq	$8, %rbp
	movq	%rcx, %rdx
	shlq	$24, %rdx
	movq	%rcx, %r13
	shlq	$16, %r13
	movq	%rcx, %rax
	shlq	$8, %rax
	xorq	%rcx, %rdx
	xorq	%r13, %rdx
	xorq	%rax, %rdx
	xorq	%rsi, %rdx
	xorq	%r11, %rdx
	xorq	%r14, %rdx
	xorq	%r8, %rdx
	xorq	%rdi, %rdx
	xorq	%rbp, %rdx
	movq	%rcx, %rbp
	shrq	$8, %rbp
	xorq	%r15, %rax
	xorq	%rbp, %rax
	movq	%r15, %rbp
	shlq	$24, %rbp
	shrq	$24, %rcx
	xorq	%r9, %rax
	xorq	%rcx, %rax
	xorq	%r11, %rax
	xorq	%rbp, %rax
	movq	%r10, %rbp
	shrq	$16, %rbp
	movq	%r10, %r12
	shrq	$24, %r12
	xorq	%rbp, %rdx
	xorq	%r12, %rdx
	movq	%r15, %rdi
	shlq	$8, %rdi
	xorq	%rsi, %rax
	xorq	%rdi, %rax
	xorq	%r8, %rax
	xorq	%rbp, %rax
	xorq	%r12, %rax
	xorq	%r13, %rax
	xorq	%r13, %rcx
	xorq	%r10, %rcx
	xorq	%rsi, %rcx
	xorq	%rdi, %rcx
	shrq	$8, %r15
	xorq	%r15, %rcx
	xorq	%r11, %rcx
	xorq	%r14, %rcx
	xorq	%rbp, %rcx
	movq	%r10, 16(%rbx)
	shlq	$24, %r10
	xorq	%r10, %rcx
	xorq	%r8, %rcx
	xorq	8(%rsp), %rcx           # 8-byte Folded Reload
	xorq	%r9, %rdx
	xorq	%r9, %rcx
	movq	%rdx, 24(%rbx)
	movq	%rax, 32(%rbx)
	movq	%rcx, 40(%rbx)
	leaq	24(%rbx), %rdi
	movq	16(%rsp), %rsi          # 8-byte Reload
	movl	$1, %edx
	callq	mu
	movq	$2827, 48(%rbx)         # imm = 0xB0B
	movq	$5654, 56(%rbx)         # imm = 0x1616
	movq	$11308, 64(%rbx)        # imm = 0x2C2C
	movq	$22616, 72(%rbx)        # imm = 0x5858
	movq	$45232, 80(%rbx)        # imm = 0xB0B0
	movq	$29041, 88(%rbx)        # imm = 0x7171
	movq	$58082, 96(%rbx)        # imm = 0xE2E2
	movq	$54741, 104(%rbx)       # imm = 0xD5D5
	movq	$48059, 112(%rbx)       # imm = 0xBBBB
	movq	$26471, 120(%rbx)       # imm = 0x6767
	movq	$52942, 128(%rbx)       # imm = 0xCECE
	movq	$36237, 136(%rbx)       # imm = 0x8D8D
	movq	$45489, 144(%rbx)       # imm = 0xB1B1
	movq	$29555, 152(%rbx)       # imm = 0x7373
	movq	$59110, 160(%rbx)       # imm = 0xE6E6
	movq	$56797, 168(%rbx)       # imm = 0xDDDD
	movq	$43947, 176(%rbx)       # imm = 0xABAB
	movq	$18247, 184(%rbx)       # imm = 0x4747
	movq	$36494, 192(%rbx)       # imm = 0x8E8E
	movq	$3341, 200(%rbx)        # imm = 0xD0D
	movq	$6682, 208(%rbx)        # imm = 0x1A1A
	movq	$13364, 216(%rbx)       # imm = 0x3434
	movq	$26728, 224(%rbx)       # imm = 0x6868
	movq	$53456, 232(%rbx)       # imm = 0xD0D0
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end11:
	.size	twy_key, .Lfunc_end11-twy_key
                                        # -- End function
	.globl	twy_enc                 # -- Begin function twy_enc
	.p2align	4, 0x90
	.type	twy_enc,@function
twy_enc:                                # @twy_enc
# %bb.0:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%r8d, %r13d
	movq	%rcx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	leaq	24(%rdx), %rbx
	xorl	%r8d, %r8d
	testl	%r13d, %r13d
	setg	%r8b
	cmovleq	%rdx, %rbx
	callq	encrypt
	leaq	24(%rbx), %rbp
	xorl	%r8d, %r8d
	cmpl	$1, %r13d
	setg	%r8b
	cmovleq	%rbx, %rbp
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	callq	encrypt
	xorl	%r8d, %r8d
	cmpl	$2, %r13d
	setg	%r8b
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbp, %rdx
	movq	%r14, %rcx
	callq	encrypt
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end12:
	.size	twy_enc, .Lfunc_end12-twy_enc
                                        # -- End function
	.globl	twy_dec                 # -- Begin function twy_dec
	.p2align	4, 0x90
	.type	twy_dec,@function
twy_dec:                                # @twy_dec
# %bb.0:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%r8d, %r13d
	movq	%rcx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	leaq	24(%rdx), %rbx
	xorl	%r8d, %r8d
	testl	%r13d, %r13d
	setg	%r8b
	cmovleq	%rdx, %rbx
	callq	decrypt
	leaq	24(%rbx), %rbp
	xorl	%r8d, %r8d
	cmpl	$1, %r13d
	setg	%r8b
	cmovleq	%rbx, %rbp
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	callq	decrypt
	xorl	%r8d, %r8d
	cmpl	$2, %r13d
	setg	%r8b
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbp, %rdx
	movq	%r14, %rcx
	callq	decrypt
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end13:
	.size	twy_dec, .Lfunc_end13-twy_dec
                                        # -- End function
	.globl	twy_destroy             # -- Begin function twy_destroy
	.p2align	4, 0x90
	.type	twy_destroy,@function
twy_destroy:                            # @twy_destroy
# %bb.0:
	movq	$0, 40(%rdi)
	movq	$0, 32(%rdi)
	movq	$0, 24(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 8(%rdi)
	movq	$0, (%rdi)
	retq
.Lfunc_end14:
	.size	twy_destroy, .Lfunc_end14-twy_destroy
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%20s : %08lx %08lx %08lx \n"
	.size	.L.str, 27

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"KEY = "
	.size	.L.str.2, 7

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"PLAIN = "
	.size	.L.str.3, 9

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"CIPHER = "
	.size	.L.str.4, 10

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"Block %01d encrypts to %08lx %08lx %08lx\n"
	.size	.L.str.5, 42

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"Block %01d decrypts to %08lx %08lx %08lx\n"
	.size	.L.str.6, 42

	.type	.Lstr,@object           # @str
.Lstr:
	.asciz	"**********"
	.size	.Lstr, 11

	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits

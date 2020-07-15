	.text
	.file	"llvm-link"
	.globl	printvec                # -- Begin function printvec
	.p2align	4, 0x90
	.type	printvec,@function
printvec:                               # @printvec
	.cfi_startproc
# %bb.0:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rsi
	movq	%rdi, 16(%rsp)
	movq	%rdx, 8(%rsp)
	movq	16(%rdx), %rax
	movq	(%rdx), %r8
	movq	8(%rdx), %rcx
	movl	$.L.str, %edi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	printvec, .Lfunc_end0-printvec
	.cfi_endproc
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
	pushq	%r14
	pushq	%rbx
	subq	$368, %rsp              # imm = 0x170
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	movl	$0, -376(%rbp)
	movl	$2209258948, %eax       # imm = 0x83AE9DC4
	leaq	1191871241(%rax), %rcx
	movq	%rcx, -352(%rbp)
	leaq	1382392692(%rax), %rcx
	movq	%rcx, -360(%rbp)
	leaq	1329708442(%rax), %rcx
	movq	%rcx, -368(%rbp)
	leaq	695422771(%rax), %rcx
	movq	%rcx, -320(%rbp)
	movq	%rax, -328(%rbp)
	movq	$1079625582, -336(%rbp) # imm = 0x4059C76E
	leaq	-264(%rbp), %r14
	leaq	-368(%rbp), %rbx
	movl	$1, %esi
	movl	$3, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	callq	twy_key
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.2, %edi
	movl	$7, %esi
	movl	$3, %ecx
	movq	%rbx, %rdx
	callq	printvec
	leaq	-336(%rbp), %rbx
	movl	$.L.str.3, %edi
	movl	$9, %esi
	movl	$9, %ecx
	movq	%rbx, %rdx
	callq	printvec
	movl	$1, %esi
	movl	$9, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rdx
	movl	$1, %r8d
	callq	encrypt
	movl	$.L.str.4, %edi
	movl	$10, %esi
	movl	$9, %ecx
	movq	%rbx, %rdx
	callq	printvec
	movl	$0, -372(%rbp)
	cmpl	$8, -372(%rbp)
	jg	.LBB1_3
	.p2align	4, 0x90
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	movslq	-372(%rbp), %rax
	movq	%rax, -336(%rbp,%rax,8)
	addl	$1, %eax
	movl	%eax, -372(%rbp)
	cmpl	$8, -372(%rbp)
	jle	.LBB1_2
.LBB1_3:
	leaq	-264(%rbp), %rdi
	leaq	-336(%rbp), %rdx
	movl	$1, %esi
	movl	$9, %ecx
	movl	$3, %r8d
	callq	twy_enc
	movl	$0, -372(%rbp)
	cmpl	$8, -372(%rbp)
	jg	.LBB1_6
	.p2align	4, 0x90
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	movslq	-372(%rbp), %rax
	imulq	$1431655766, %rax, %rsi # imm = 0x55555556
	movq	%rsi, %rcx
	shrq	$63, %rcx
	shrq	$32, %rsi
	addl	%ecx, %esi
	movq	-336(%rbp,%rax,8), %rdx
	movq	-328(%rbp,%rax,8), %rcx
	movq	-320(%rbp,%rax,8), %r8
	movl	$.L.str.5, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	addl	$3, -372(%rbp)
	cmpl	$8, -372(%rbp)
	jle	.LBB1_5
.LBB1_6:
	leaq	-264(%rbp), %rbx
	leaq	-336(%rbp), %rdx
	movl	$1, %esi
	movl	$9, %ecx
	movq	%rbx, %rdi
	movl	$2, %r8d
	callq	twy_dec
	leaq	-288(%rbp), %rdx
	movl	$1, %esi
	movl	$9, %ecx
	movq	%rbx, %rdi
	movl	$1, %r8d
	callq	twy_dec
	movl	$0, -372(%rbp)
	cmpl	$8, -372(%rbp)
	jg	.LBB1_9
	.p2align	4, 0x90
.LBB1_8:                                # =>This Inner Loop Header: Depth=1
	movslq	-372(%rbp), %rax
	imulq	$1431655766, %rax, %rsi # imm = 0x55555556
	movq	%rsi, %rcx
	shrq	$63, %rcx
	shrq	$32, %rsi
	addl	%ecx, %esi
	movq	-336(%rbp,%rax,8), %rdx
	movq	-328(%rbp,%rax,8), %rcx
	movq	-320(%rbp,%rax,8), %r8
	movl	$.L.str.6, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	addl	$3, -372(%rbp)
	cmpl	$8, -372(%rbp)
	jle	.LBB1_8
.LBB1_9:
	movq	%fs:40, %rax
	cmpq	-24(%rbp), %rax
	jne	.LBB1_11
# %bb.10:                               # %SP_return
	xorl	%eax, %eax
	addq	$368, %rsp              # imm = 0x170
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB1_11:                               # %CallStackCheckFailBlk
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
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$112, %rsp
	.cfi_def_cfa_offset 160
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	%edx, %eax
	andb	$1, %al
	leaq	8(%rdi), %r9
	leaq	16(%rdi), %r8
	cmpq	$2, %rsi
	leaq	104(%rsp), %r11
	movq	%r11, %r10
	cmovgq	%r8, %r10
	testb	%al, %al
	movq	%r10, %r14
	cmovneq	%r8, %r14
	cmpq	$1, %rsi
	cmovgq	%r9, %r11
	testb	%al, %al
	movq	%r11, %r15
	cmovneq	%r9, %r15
	xorl	%ebx, %ebx
	testb	%al, %al
	movq	-112(%rsp), %rcx
	cmovneq	%rbx, %rcx
	leaq	(%rcx,%rcx), %r13
	testb	%al, %al
	movq	-120(%rsp), %rsi
	cmovneq	%rbx, %rsi
	cmoveq	%rcx, %r13
	leaq	(%rsi,%rsi), %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %rbx
	cmoveq	%rsi, %rcx
	leaq	(%rbx,%rbx), %r12
	testb	%al, %al
	movb	%al, 103(%rsp)
	cmoveq	%rbx, %r12
	movq	%r12, -128(%rsp)
	movq	%rcx, -120(%rsp)
	movq	%r13, -112(%rsp)
	movl	(%rdi), %esi
	andl	%edx, %esi
	andb	$1, %sil
	movb	%sil, 102(%rsp)
	movq	%r13, %rbx
	orq	$1, %rbx
	testb	%sil, %sil
	cmoveq	%r13, %rbx
	movq	%rbx, -112(%rsp)
	movb	%al, 101(%rsp)
	movl	(%r15), %esi
	andl	%edx, %esi
	andb	$1, %sil
	movb	%sil, 100(%rsp)
	movq	%rcx, %rbx
	orq	$1, %rbx
	testb	%sil, %sil
	cmoveq	%rcx, %rbx
	movq	%rbx, -120(%rsp)
	movb	%al, 99(%rsp)
	andl	(%r14), %edx
	andb	$1, %dl
	movb	%dl, 98(%rsp)
	movq	%r12, %rcx
	orq	$1, %rcx
	testb	%dl, %dl
	cmoveq	%r12, %rcx
	movq	%rcx, -128(%rsp)
	movb	%al, -58(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-58(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-58(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-58(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 97(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 96(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 95(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 94(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 93(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -59(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-59(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-59(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-59(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 92(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 91(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 90(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 89(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 88(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -60(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-60(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-60(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-60(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 87(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 86(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 85(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 84(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 83(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -61(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-61(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-61(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-61(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 82(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 81(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 80(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 79(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 78(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -62(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-62(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-62(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-62(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 77(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 76(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 75(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 74(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 73(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -63(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-63(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-63(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-63(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 72(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 71(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 70(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 69(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 68(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -64(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-64(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-64(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-64(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 67(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 66(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 65(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 64(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 63(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -65(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-65(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-65(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-65(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 62(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 61(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 60(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 59(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 58(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -66(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-66(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-66(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-66(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 57(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 56(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 55(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 54(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 53(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -67(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-67(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-67(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-67(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 52(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 51(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 50(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 49(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 48(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -68(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-68(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-68(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-68(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 47(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 46(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 45(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 44(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 43(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -69(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-69(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-69(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-69(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 42(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 41(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 40(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 39(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 38(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -70(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-70(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-70(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-70(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 37(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 36(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 35(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 34(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 33(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -71(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-71(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-71(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-71(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 32(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 31(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 30(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 29(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 28(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -72(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-72(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-72(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-72(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 27(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 26(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 25(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 24(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 23(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -73(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-73(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-73(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-73(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 22(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 21(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 20(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 19(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 18(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -74(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-74(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-74(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-74(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 17(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 16(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 15(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 14(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 13(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -75(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-75(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-75(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-75(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 12(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 11(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 10(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 9(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 8(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -76(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-76(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-76(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-76(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 7(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 6(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, 5(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, 4(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, 3(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -77(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-77(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-77(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-77(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, 2(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, 1(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, (%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, -1(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, -2(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -78(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-78(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-78(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-78(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, -3(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, -4(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, -5(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, -6(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, -7(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -79(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-79(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-79(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-79(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, -8(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, -9(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, -10(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, -11(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, -12(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -80(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-80(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-80(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-80(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, -13(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, -14(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, -15(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, -16(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, -17(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -81(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-81(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-81(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-81(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, -18(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, -19(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, -20(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, -21(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, -22(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -82(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-82(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-82(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-82(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, -23(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, -24(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, -25(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, -26(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, -27(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -83(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-83(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-83(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-83(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, -28(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, -29(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, -30(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, -31(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, -32(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -84(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-84(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-84(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-84(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, -33(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, -34(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, -35(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, -36(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, -37(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -85(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-85(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-85(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-85(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, -38(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, -39(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, -40(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, -41(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, -42(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -86(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-86(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-86(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-86(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, -43(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, -44(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, -45(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, -46(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, -47(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -87(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-87(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-87(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-87(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, -48(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, -49(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, -50(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, -51(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, -52(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -88(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-88(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-88(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-88(%rsp), %al
	movq	-128(%rsp), %r12
	movq	-120(%rsp), %rdx
	addq	%r12, %r12
	addq	%rdx, %rdx
	movq	-112(%rsp), %rcx
	addq	%rcx, %rcx
	testb	%al, %al
	cmoveq	-128(%rsp), %r12
	movq	%r12, -128(%rsp)
	cmoveq	-120(%rsp), %rdx
	movq	%rdx, -120(%rsp)
	cmoveq	-112(%rsp), %rcx
	movq	%rcx, -112(%rsp)
	movq	%r11, %r15
	cmovneq	%r9, %r15
	movq	%r10, %r14
	cmovneq	%r8, %r14
	movb	(%rdi), %bl
	andb	%al, %bl
	movb	%bl, -53(%rsp)
	movq	%rcx, %rsi
	orq	$1, %rsi
	testb	%bl, %bl
	cmoveq	%rcx, %rsi
	movq	%rsi, -112(%rsp)
	movb	%al, -54(%rsp)
	movb	(%r15), %cl
	andb	%al, %cl
	movb	%cl, -55(%rsp)
	movq	%rdx, %rsi
	orq	$1, %rsi
	testb	%cl, %cl
	cmoveq	%rdx, %rsi
	movq	%rsi, -120(%rsp)
	movb	%al, -56(%rsp)
	movb	(%r14), %cl
	andb	%al, %cl
	movb	%cl, -57(%rsp)
	movq	%r12, %rdx
	orq	$1, %rdx
	testb	%cl, %cl
	cmoveq	%r12, %rdx
	movq	%rdx, -128(%rsp)
	movb	%al, -89(%rsp)
	movq	(%rdi), %rcx
	movq	%rcx, %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rdi)
	movb	-89(%rsp), %al
	testb	%al, %al
	movq	%r11, %rcx
	cmovneq	%r9, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	cmoveq	8(%rdi), %rdx
	movq	%rdx, (%rcx)
	movb	-89(%rsp), %al
	testb	%al, %al
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rdx
	shrq	%rdx
	testb	%al, %al
	leaq	-112(%rsp), %rax
	leaq	-120(%rsp), %rsi
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%rcx)
	cmpb	$0, -89(%rsp)
	leaq	-128(%rsp), %rcx
	cmoveq	%rdi, %rcx
	movq	(%rcx), %rcx
	movq	%rcx, (%rdi)
	cmpb	$0, -89(%rsp)
	cmovneq	%r9, %r11
	cmoveq	%r9, %rsi
	movq	(%rsi), %rcx
	movq	%rcx, (%r11)
	cmpb	$0, -89(%rsp)
	cmovneq	%r8, %r10
	cmoveq	%r8, %rax
	movq	(%rax), %rax
	movq	%rax, (%r10)
	addq	$112, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	mu, .Lfunc_end2-mu
	.cfi_endproc
                                        # -- End function
	.globl	gamma_                  # -- Begin function gamma_
	.p2align	4, 0x90
	.type	gamma_,@function
gamma_:                                 # @gamma_
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	andb	$1, %dl
	leaq	-32(%rsp), %r8
	cmoveq	%rdi, %r8
	testq	%rsi, %rsi
	leaq	-8(%rsp), %r11
	movq	%r11, %rax
	cmovgq	%rdi, %rax
	testb	%dl, %dl
	cmovneq	%rdi, %rax
	leaq	8(%rdi), %r9
	cmpq	$1, %rsi
	movq	%r11, %r10
	cmovgq	%r9, %r10
	testb	%dl, %dl
	movq	%r10, %rcx
	cmovneq	%r9, %rcx
	addq	$16, %rdi
	cmpq	$2, %rsi
	cmovgq	%rdi, %r11
	testb	%dl, %dl
	movb	%dl, -33(%rsp)
	movq	%r11, %rsi
	cmovneq	%rdi, %rsi
	movq	(%rsi), %rbx
	notq	%rbx
	orq	(%rcx), %rbx
	xorq	(%rax), %rbx
	testb	%dl, %dl
	cmoveq	-32(%rsp), %rbx
	movq	%rbx, -32(%rsp)
	movq	(%rax), %rbx
	notq	%rbx
	orq	(%rsi), %rbx
	xorq	(%rcx), %rbx
	testb	%dl, %dl
	cmoveq	-24(%rsp), %rbx
	movq	%rbx, -24(%rsp)
	movq	(%rcx), %rcx
	notq	%rcx
	orq	(%rax), %rcx
	xorq	(%rsi), %rcx
	testb	%dl, %dl
	leaq	-24(%rsp), %rdx
	leaq	-16(%rsp), %rsi
	cmoveq	-16(%rsp), %rcx
	movq	%rcx, -16(%rsp)
	movq	(%r8), %rcx
	movq	%rcx, (%rax)
	cmpb	$0, -33(%rsp)
	cmovneq	%r9, %r10
	cmoveq	%r9, %rdx
	movq	(%rdx), %rax
	movq	%rax, (%r10)
	cmpb	$0, -33(%rsp)
	cmovneq	%rdi, %r11
	cmoveq	%rdi, %rsi
	movq	(%rsi), %rax
	movq	%rax, (%r11)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	gamma_, .Lfunc_end3-gamma_
	.cfi_endproc
                                        # -- End function
	.globl	theta                   # -- Begin function theta
	.p2align	4, 0x90
	.type	theta,@function
theta:                                  # @theta
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	andb	$1, %dl
	leaq	16(%rdi), %r9
	testb	%dl, %dl
	leaq	-32(%rsp), %r8
	cmoveq	%rdi, %r8
	cmpq	$2, %rsi
	leaq	-8(%rsp), %r13
	movq	%r13, %r11
	cmovgq	%r9, %r11
	testb	%dl, %dl
	movq	%r11, %r15
	cmovneq	%r9, %r15
	leaq	8(%rdi), %r10
	cmpq	$1, %rsi
	movq	%r13, %r14
	cmovgq	%r10, %r14
	testb	%dl, %dl
	movq	%r14, %r12
	cmovneq	%r10, %r12
	testq	%rsi, %rsi
	cmovgq	%rdi, %r13
	testb	%dl, %dl
	movb	%dl, -33(%rsp)
	cmovneq	%rdi, %r13
	movq	(%r13), %rsi
	movq	%rsi, %rdi
	shrq	$16, %rdi
	movq	(%r12), %rcx
	movq	%rcx, %rbx
	shlq	$16, %rbx
	xorq	%rdi, %rbx
	movq	%rcx, %rax
	shrq	$16, %rax
	xorq	%rbx, %rax
	movq	(%r15), %rdi
	movq	%rdi, %rbx
	shlq	$16, %rbx
	xorq	%rax, %rbx
	shrq	$24, %rcx
	xorq	%rbx, %rcx
	movq	%rdi, %rax
	shlq	$8, %rax
	xorq	%rcx, %rax
	movq	%rdi, %rcx
	shrq	$8, %rcx
	xorq	%rax, %rcx
	movq	%rsi, %rax
	shlq	$24, %rax
	xorq	%rcx, %rax
	movq	%rdi, %rcx
	shrq	$16, %rcx
	xorq	%rax, %rcx
	movq	%rsi, %rax
	shlq	$16, %rax
	xorq	%rcx, %rax
	shrq	$24, %rdi
	xorq	%rax, %rdi
	movq	%rsi, %rax
	shlq	$8, %rax
	xorq	%rdi, %rax
	xorq	%rsi, %rax
	testb	%dl, %dl
	cmoveq	-32(%rsp), %rax
	movq	%rax, -32(%rsp)
	movq	(%r12), %rsi
	movq	(%r15), %rax
	movq	(%r13), %rdi
	movq	%rsi, %rcx
	shrq	$16, %rcx
	movq	%rax, %rbx
	shlq	$16, %rbx
	xorq	%rcx, %rbx
	movq	%rax, %rcx
	shrq	$16, %rcx
	xorq	%rbx, %rcx
	movq	%rdi, %rbx
	shlq	$16, %rbx
	xorq	%rcx, %rbx
	shrq	$24, %rax
	xorq	%rbx, %rax
	movq	%rdi, %rcx
	shlq	$8, %rcx
	xorq	%rax, %rcx
	movq	%rdi, %rax
	shrq	$8, %rax
	xorq	%rcx, %rax
	movq	%rsi, %rcx
	shlq	$24, %rcx
	xorq	%rax, %rcx
	movq	%rdi, %rax
	shrq	$16, %rax
	xorq	%rcx, %rax
	movq	%rsi, %rcx
	shlq	$16, %rcx
	xorq	%rax, %rcx
	shrq	$24, %rdi
	xorq	%rcx, %rdi
	movq	%rsi, %rax
	shlq	$8, %rax
	xorq	%rdi, %rax
	xorq	%rsi, %rax
	testb	%dl, %dl
	cmoveq	-24(%rsp), %rax
	movq	%rax, -24(%rsp)
	movq	(%r15), %rsi
	movq	(%r13), %rcx
	movq	(%r12), %rax
	movq	%rsi, %rdi
	shrq	$16, %rdi
	movq	%rcx, %rbx
	shlq	$16, %rbx
	xorq	%rdi, %rbx
	movq	%rcx, %rdi
	shrq	$16, %rdi
	xorq	%rbx, %rdi
	movq	%rax, %rbx
	shlq	$16, %rbx
	xorq	%rdi, %rbx
	shrq	$24, %rcx
	xorq	%rbx, %rcx
	movq	%rax, %rdi
	shlq	$8, %rdi
	xorq	%rcx, %rdi
	movq	%rax, %rcx
	shrq	$8, %rcx
	xorq	%rdi, %rcx
	movq	%rsi, %rdi
	shlq	$24, %rdi
	xorq	%rcx, %rdi
	movq	%rax, %rcx
	shrq	$16, %rcx
	xorq	%rdi, %rcx
	movq	%rsi, %rdi
	shlq	$16, %rdi
	xorq	%rcx, %rdi
	shrq	$24, %rax
	xorq	%rdi, %rax
	movq	%rsi, %rcx
	shlq	$8, %rcx
	xorq	%rax, %rcx
	xorq	%rsi, %rcx
	testb	%dl, %dl
	leaq	-24(%rsp), %rax
	leaq	-16(%rsp), %rdx
	cmoveq	-16(%rsp), %rcx
	movq	%rcx, -16(%rsp)
	movq	(%r8), %rcx
	movq	%rcx, (%r13)
	cmpb	$0, -33(%rsp)
	cmovneq	%r10, %r14
	cmoveq	%r10, %rax
	movq	(%rax), %rax
	movq	%rax, (%r14)
	cmpb	$0, -33(%rsp)
	cmovneq	%r9, %r11
	cmoveq	%r9, %rdx
	movq	(%rdx), %rax
	movq	%rax, (%r11)
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	theta, .Lfunc_end4-theta
	.cfi_endproc
                                        # -- End function
	.globl	pi_1                    # -- Begin function pi_1
	.p2align	4, 0x90
	.type	pi_1,@function
pi_1:                                   # @pi_1
	.cfi_startproc
# %bb.0:
	andb	$1, %dl
	movb	%dl, -9(%rsp)
	testq	%rsi, %rsi
	leaq	-8(%rsp), %r8
	movq	%r8, %rcx
	cmovgq	%rdi, %rcx
	testb	%dl, %dl
	cmovneq	%rdi, %rcx
	movq	(%rcx), %rax
	movq	%rax, %r9
	shrq	$10, %r9
	shlq	$22, %rax
	xorq	%r9, %rax
	testb	%dl, %dl
	cmoveq	(%rdi), %rax
	movq	%rax, (%rcx)
	leaq	16(%rdi), %rax
	cmpq	$2, %rsi
	cmovgq	%rax, %r8
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	cmovneq	%rax, %r8
	movq	(%r8), %rax
	leaq	(%rax,%rax), %rdx
	shrq	$31, %rax
	xorq	%rax, %rdx
	testb	%cl, %cl
	cmoveq	16(%rdi), %rdx
	movq	%rdx, (%r8)
	retq
.Lfunc_end5:
	.size	pi_1, .Lfunc_end5-pi_1
	.cfi_endproc
                                        # -- End function
	.globl	pi_2                    # -- Begin function pi_2
	.p2align	4, 0x90
	.type	pi_2,@function
pi_2:                                   # @pi_2
	.cfi_startproc
# %bb.0:
	andb	$1, %dl
	movb	%dl, -9(%rsp)
	testq	%rsi, %rsi
	leaq	-8(%rsp), %r9
	movq	%r9, %rcx
	cmovgq	%rdi, %rcx
	testb	%dl, %dl
	cmovneq	%rdi, %rcx
	movq	(%rcx), %r8
	leaq	(%r8,%r8), %rax
	shrq	$31, %r8
	xorq	%r8, %rax
	testb	%dl, %dl
	cmoveq	(%rdi), %rax
	movq	%rax, (%rcx)
	leaq	16(%rdi), %rax
	cmpq	$2, %rsi
	cmovgq	%rax, %r9
	movb	-9(%rsp), %cl
	testb	%cl, %cl
	cmovneq	%rax, %r9
	movq	(%r9), %rax
	movq	%rax, %rdx
	shrq	$10, %rdx
	shlq	$22, %rax
	xorq	%rdx, %rax
	testb	%cl, %cl
	cmoveq	16(%rdi), %rax
	movq	%rax, (%r9)
	retq
.Lfunc_end6:
	.size	pi_2, .Lfunc_end6-pi_2
	.cfi_endproc
                                        # -- End function
	.globl	rho                     # -- Begin function rho
	.p2align	4, 0x90
	.type	rho,@function
rho:                                    # @rho
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	%edx, %ebx
	movq	%rsi, %r14
	movq	%rdi, %r15
	movl	%edx, %eax
	andl	$1, %eax
	movb	%al, 7(%rsp)
	callq	theta
	movq	%r15, %rdi
	movq	%r14, %rsi
	movl	%ebx, %edx
	callq	pi_1
	movq	%r15, %rdi
	movq	%r14, %rsi
	movl	%ebx, %edx
	callq	gamma_
	movq	%r15, %rdi
	movq	%r14, %rsi
	movl	%ebx, %edx
	callq	pi_2
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end7:
	.size	rho, .Lfunc_end7-rho
	.cfi_endproc
                                        # -- End function
	.globl	rndcon_gen              # -- Begin function rndcon_gen
	.p2align	4, 0x90
	.type	rndcon_gen,@function
rndcon_gen:                             # @rndcon_gen
	.cfi_startproc
# %bb.0:
	movq	%rdi, (%rsi)
	addq	%rdi, %rdi
	movq	%rdi, %rax
	xorq	$69649, %rax            # imm = 0x11011
	testl	$65536, %edi            # imm = 0x10000
	cmoveq	%rdi, %rax
	movq	%rax, 8(%rsi)
	addq	%rax, %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testl	$65536, %eax            # imm = 0x10000
	cmoveq	%rax, %rcx
	movq	%rcx, 16(%rsi)
	addq	%rcx, %rcx
	movq	%rcx, %rax
	xorq	$69649, %rax            # imm = 0x11011
	testl	$65536, %ecx            # imm = 0x10000
	cmoveq	%rcx, %rax
	movq	%rax, 24(%rsi)
	addq	%rax, %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testl	$65536, %eax            # imm = 0x10000
	cmoveq	%rax, %rcx
	movq	%rcx, 32(%rsi)
	addq	%rcx, %rcx
	movq	%rcx, %rax
	xorq	$69649, %rax            # imm = 0x11011
	testl	$65536, %ecx            # imm = 0x10000
	cmoveq	%rcx, %rax
	movq	%rax, 40(%rsi)
	addq	%rax, %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testl	$65536, %eax            # imm = 0x10000
	cmoveq	%rax, %rcx
	movq	%rcx, 48(%rsi)
	addq	%rcx, %rcx
	movq	%rcx, %rax
	xorq	$69649, %rax            # imm = 0x11011
	testl	$65536, %ecx            # imm = 0x10000
	cmoveq	%rcx, %rax
	movq	%rax, 56(%rsi)
	addq	%rax, %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testl	$65536, %eax            # imm = 0x10000
	cmoveq	%rax, %rcx
	movq	%rcx, 64(%rsi)
	addq	%rcx, %rcx
	movq	%rcx, %rax
	xorq	$69649, %rax            # imm = 0x11011
	testl	$65536, %ecx            # imm = 0x10000
	cmoveq	%rcx, %rax
	movq	%rax, 72(%rsi)
	addq	%rax, %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testl	$65536, %eax            # imm = 0x10000
	cmoveq	%rax, %rcx
	movq	%rcx, 80(%rsi)
	addq	%rcx, %rcx
	movq	%rcx, %rax
	xorq	$69649, %rax            # imm = 0x11011
	testl	$65536, %ecx            # imm = 0x10000
	cmoveq	%rcx, %rax
	movq	%rax, 88(%rsi)
	retq
.Lfunc_end8:
	.size	rndcon_gen, .Lfunc_end8-rndcon_gen
	.cfi_endproc
                                        # -- End function
	.globl	encrypt                 # -- Begin function encrypt
	.p2align	4, 0x90
	.type	encrypt,@function
encrypt:                                # @encrypt
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %rbp
	testq	%rsi, %rsi
	leaq	72(%rsp), %r11
	movq	%r11, %rax
	cmovgq	%rdi, %rax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	leaq	48(%rdi), %r15
	testq	%rsi, %rsi
	movq	%rsi, %r10
	setg	%dl
	movq	%r11, %r9
	cmovgq	%r15, %r9
	movl	%r8d, 16(%rsp)          # 4-byte Spill
	movl	%r8d, %ebx
	andb	$1, %bl
	movb	%bl, 15(%rsp)
	orb	%r8b, %dl
	testb	$1, %dl
	movq	%r11, %rdx
	cmovneq	%rdi, %rdx
	movq	%r11, %rsi
	cmovneq	%r15, %rsi
	movq	(%rsi), %rsi
	movq	(%rbp), %rax
	shlq	$16, %rsi
	xorq	(%rdx), %rsi
	xorq	%rax, %rsi
	testb	%bl, %bl
	cmoveq	%rax, %rsi
	movq	%rsi, (%rbp)
	leaq	16(%rdi), %rdx
	leaq	56(%rdi), %r12
	movq	%r12, 128(%rsp)         # 8-byte Spill
	leaq	64(%rdi), %rsi
	movq	%rsi, 136(%rsp)         # 8-byte Spill
	movq	%rdi, %rax
	movq	%r10, %rdi
	movq	%r10, 112(%rsp)         # 8-byte Spill
	cmpq	$2, %r10
	setg	23(%rsp)                # 1-byte Folded Spill
	movq	%r11, %r8
	movq	%r11, %rbx
	cmovgq	%rsi, %rbx
	movq	%rbx, 144(%rsp)         # 8-byte Spill
	movq	%r11, %rsi
	cmovgq	%rdx, %rsi
	movq	%rsi, %r11
	movq	%rdx, %r10
	movq	%rdx, 80(%rsp)          # 8-byte Spill
	cmpq	$1, %rdi
	movq	%r8, %r14
	cmovgq	%r12, %r14
	leaq	8(%rax), %rbx
	movq	%rbx, 48(%rsp)          # 8-byte Spill
	movq	%rax, %r12
	movq	%rax, 120(%rsp)         # 8-byte Spill
	movq	%r8, %rdi
	cmovgq	%rbx, %rdi
	movq	%rdi, 88(%rsp)          # 8-byte Spill
	cmpq	$1, %rcx
	leaq	8(%rbp), %rdx
	movq	%r8, %rax
	movq	%r8, %r13
	cmovgq	%rdx, %rax
	movq	%rax, 24(%rsp)          # 8-byte Spill
	movq	%rdx, 56(%rsp)          # 8-byte Spill
	movb	15(%rsp), %r8b
	testb	%r8b, %r8b
	movq	%rdi, %rsi
	cmovneq	%rbx, %rsi
	cmovneq	%rdx, %rax
	movq	(%rax), %rbx
	xorq	(%rsi), %rbx
	testb	%r8b, %r8b
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rax)
	cmpq	$2, %rcx
	movq	%rcx, 64(%rsp)          # 8-byte Spill
	leaq	16(%rbp), %rdi
	movq	%rdi, 96(%rsp)          # 8-byte Spill
	movq	%r13, %rsi
	cmovgq	%rdi, %rsi
	movq	%rsi, 40(%rsp)          # 8-byte Spill
	movb	15(%rsp), %dl
	testb	%dl, %dl
	cmovneq	%r15, %r9
	movq	%r11, %rax
	movq	%r11, %r13
	movq	%r11, 104(%rsp)         # 8-byte Spill
	cmovneq	%r10, %rax
	movq	(%rax), %rax
	cmovneq	%rdi, %rsi
	xorq	(%r9), %rax
	xorq	(%rsi), %rax
	testb	%dl, %dl
	cmoveq	16(%rbp), %rax
	movq	%rax, (%rsi)
	movq	%rbp, %rdi
	movq	%rcx, %rsi
	movl	16(%rsp), %ebx          # 4-byte Reload
	movl	%ebx, %edx
	callq	rho
	movb	15(%rsp), %al
	testb	%al, %al
	movq	32(%rsp), %rcx          # 8-byte Reload
	cmovneq	%r12, %rcx
	movq	%r14, %rdx
	movq	128(%rsp), %rdi         # 8-byte Reload
	cmovneq	%rdi, %rdx
	movq	(%rdx), %rdx
	movq	(%rbp), %rsi
	shlq	$16, %rdx
	xorq	(%rcx), %rdx
	xorq	%rsi, %rdx
	testb	%al, %al
	cmoveq	%rsi, %rdx
	movq	%rdx, (%rbp)
	movb	15(%rsp), %al
	testb	%al, %al
	movq	88(%rsp), %r15          # 8-byte Reload
	movq	%r15, %rcx
	cmovneq	48(%rsp), %rcx          # 8-byte Folded Reload
	movq	24(%rsp), %rdx          # 8-byte Reload
	cmovneq	56(%rsp), %rdx          # 8-byte Folded Reload
	movq	(%rdx), %rsi
	xorq	(%rcx), %rsi
	testb	%al, %al
	cmoveq	8(%rbp), %rsi
	movq	%rsi, (%rdx)
	movb	15(%rsp), %al
	testb	%al, %al
	movq	80(%rsp), %r12          # 8-byte Reload
	cmovneq	%r12, %r13
	movq	(%r13), %rcx
	cmovneq	%rdi, %r14
	movq	40(%rsp), %rdx          # 8-byte Reload
	movq	96(%rsp), %r13          # 8-byte Reload
	cmovneq	%r13, %rdx
	xorq	(%r14), %rcx
	xorq	(%rdx), %rcx
	testb	%al, %al
	cmoveq	16(%rbp), %rcx
	movq	%rcx, (%rdx)
	movq	%rbp, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	movl	%ebx, %edx
	callq	rho
	movb	15(%rsp), %al
	testb	%al, %al
	movq	32(%rsp), %rcx          # 8-byte Reload
	cmovneq	120(%rsp), %rcx         # 8-byte Folded Reload
	movq	136(%rsp), %rdi         # 8-byte Reload
	movq	144(%rsp), %rdx         # 8-byte Reload
	cmovneq	%rdi, %rdx
	movq	(%rdx), %rdx
	shlq	$16, %rdx
	xorq	(%rcx), %rdx
	movq	(%rbp), %rcx
	xorq	%rcx, %rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rbp)
	movb	15(%rsp), %al
	testb	%al, %al
	movq	%r15, %rcx
	movq	48(%rsp), %rbx          # 8-byte Reload
	cmovneq	%rbx, %rcx
	movq	24(%rsp), %rdx          # 8-byte Reload
	cmovneq	56(%rsp), %rdx          # 8-byte Folded Reload
	movq	(%rdx), %rsi
	xorq	(%rcx), %rsi
	testb	%al, %al
	cmoveq	8(%rbp), %rsi
	movq	%rsi, (%rdx)
	movb	15(%rsp), %al
	orb	%al, 23(%rsp)           # 1-byte Folded Spill
	leaq	72(%rsp), %r15
	movq	%r15, %rcx
	cmovneq	%r12, %rcx
	movq	(%rcx), %rcx
	movq	%rdi, %rdx
	cmoveq	%r15, %rdx
	movq	%r15, %r12
	xorq	(%rdx), %rcx
	testb	%al, %al
	movq	40(%rsp), %r14          # 8-byte Reload
	movq	%r14, %rdx
	cmovneq	%r13, %rdx
	xorq	(%rdx), %rcx
	testb	%al, %al
	cmoveq	16(%rbp), %rcx
	movq	%rcx, (%rdx)
	movq	%rbp, %rdi
	movq	64(%rsp), %r15          # 8-byte Reload
	movq	%r15, %rsi
	movl	16(%rsp), %edx          # 4-byte Reload
	callq	rho
	movq	120(%rsp), %rdi         # 8-byte Reload
	leaq	72(%rdi), %rcx
	cmpq	$3, 112(%rsp)           # 8-byte Folded Reload
	movb	15(%rsp), %dl
	movq	%r12, %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	32(%rsp), %r13          # 8-byte Reload
	movq	%r13, %rsi
	cmovneq	%rdi, %rsi
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	88(%rsp), %rsi          # 8-byte Reload
	cmovneq	%rbx, %rsi
	movq	24(%rsp), %rdi          # 8-byte Reload
	cmovneq	56(%rsp), %rdi          # 8-byte Folded Reload
	movq	(%rdi), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rdi)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	104(%rsp), %r12         # 8-byte Reload
	movq	%r12, %rsi
	cmovneq	80(%rsp), %rsi          # 8-byte Folded Reload
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	cmovneq	96(%rsp), %r14          # 8-byte Folded Reload
	xorq	(%rax), %rsi
	xorq	(%r14), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%r14)
	movq	%rbp, %rdi
	movq	%r15, %rsi
	movl	16(%rsp), %edx          # 4-byte Reload
	callq	rho
	movq	120(%rsp), %rdi         # 8-byte Reload
	leaq	80(%rdi), %rcx
	cmpq	$4, 112(%rsp)           # 8-byte Folded Reload
	movb	15(%rsp), %dl
	leaq	72(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	%r13, %rsi
	cmovneq	%rdi, %rsi
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	88(%rsp), %r15          # 8-byte Reload
	movq	%r15, %rsi
	cmovneq	48(%rsp), %rsi          # 8-byte Folded Reload
	movq	24(%rsp), %rdi          # 8-byte Reload
	movq	56(%rsp), %r14          # 8-byte Reload
	cmovneq	%r14, %rdi
	movq	(%rdi), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rdi)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	cmovneq	80(%rsp), %r12          # 8-byte Folded Reload
	movq	(%r12), %rsi
	cmovneq	%rcx, %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	movq	96(%rsp), %r13          # 8-byte Reload
	cmovneq	%r13, %rcx
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	movl	16(%rsp), %edx          # 4-byte Reload
	callq	rho
	movq	120(%rsp), %rdi         # 8-byte Reload
	leaq	88(%rdi), %rcx
	movq	112(%rsp), %r12         # 8-byte Reload
	cmpq	$5, %r12
	movb	15(%rsp), %dl
	leaq	72(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	32(%rsp), %rsi          # 8-byte Reload
	cmovneq	%rdi, %rsi
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	%r15, %rsi
	cmovneq	48(%rsp), %rsi          # 8-byte Folded Reload
	movq	24(%rsp), %r15          # 8-byte Reload
	movq	%r15, %rdi
	cmovneq	%r14, %rdi
	movq	(%rdi), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rdi)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	104(%rsp), %rsi         # 8-byte Reload
	movq	80(%rsp), %r14          # 8-byte Reload
	cmovneq	%r14, %rsi
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	cmovneq	%r13, %rcx
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	movl	16(%rsp), %edx          # 4-byte Reload
	callq	rho
	movq	120(%rsp), %rdi         # 8-byte Reload
	leaq	96(%rdi), %rcx
	cmpq	$6, %r12
	movb	15(%rsp), %dl
	leaq	72(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	32(%rsp), %rsi          # 8-byte Reload
	cmovneq	%rdi, %rsi
	movq	%rdi, %r12
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	88(%rsp), %rsi          # 8-byte Reload
	cmovneq	48(%rsp), %rsi          # 8-byte Folded Reload
	movq	%r15, %rdi
	cmovneq	56(%rsp), %rdi          # 8-byte Folded Reload
	movq	(%rdi), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rdi)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	104(%rsp), %r13         # 8-byte Reload
	movq	%r13, %rsi
	cmovneq	%r14, %rsi
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	movq	40(%rsp), %r14          # 8-byte Reload
	movq	%r14, %rcx
	movq	96(%rsp), %r15          # 8-byte Reload
	cmovneq	%r15, %rcx
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	movl	16(%rsp), %edx          # 4-byte Reload
	callq	rho
	leaq	104(%r12), %rcx
	cmpq	$7, 112(%rsp)           # 8-byte Folded Reload
	movb	15(%rsp), %dl
	leaq	72(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	32(%rsp), %rsi          # 8-byte Reload
	cmovneq	%r12, %rsi
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	88(%rsp), %rsi          # 8-byte Reload
	cmovneq	48(%rsp), %rsi          # 8-byte Folded Reload
	movq	24(%rsp), %rdi          # 8-byte Reload
	cmovneq	56(%rsp), %rdi          # 8-byte Folded Reload
	movq	(%rdi), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rdi)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	%r13, %rsi
	cmovneq	80(%rsp), %rsi          # 8-byte Folded Reload
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	movq	%r14, %rcx
	cmovneq	%r15, %rcx
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	movl	16(%rsp), %r13d         # 4-byte Reload
	movl	%r13d, %edx
	callq	rho
	leaq	112(%r12), %rcx
	movq	112(%rsp), %r14         # 8-byte Reload
	cmpq	$8, %r14
	movb	15(%rsp), %dl
	leaq	72(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	32(%rsp), %r15          # 8-byte Reload
	movq	%r15, %rsi
	cmovneq	%r12, %rsi
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	88(%rsp), %rsi          # 8-byte Reload
	cmovneq	48(%rsp), %rsi          # 8-byte Folded Reload
	movq	24(%rsp), %rdi          # 8-byte Reload
	cmovneq	56(%rsp), %rdi          # 8-byte Folded Reload
	movq	(%rdi), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rdi)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	104(%rsp), %rsi         # 8-byte Reload
	cmovneq	80(%rsp), %rsi          # 8-byte Folded Reload
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	cmovneq	96(%rsp), %rcx          # 8-byte Folded Reload
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	movl	%r13d, %edx
	callq	rho
	leaq	120(%r12), %rcx
	cmpq	$9, %r14
	movb	15(%rsp), %dl
	leaq	72(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	%r15, %rsi
	cmovneq	%r12, %rsi
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	88(%rsp), %r14          # 8-byte Reload
	movq	%r14, %rsi
	movq	48(%rsp), %r15          # 8-byte Reload
	cmovneq	%r15, %rsi
	movq	24(%rsp), %r13          # 8-byte Reload
	movq	%r13, %rdi
	cmovneq	56(%rsp), %rdi          # 8-byte Folded Reload
	movq	(%rdi), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rdi)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	104(%rsp), %rsi         # 8-byte Reload
	cmovneq	80(%rsp), %rsi          # 8-byte Folded Reload
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	cmovneq	96(%rsp), %rcx          # 8-byte Folded Reload
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	64(%rsp), %rsi          # 8-byte Reload
	movl	16(%rsp), %edx          # 4-byte Reload
	callq	rho
	leaq	128(%r12), %rcx
	cmpq	$10, 112(%rsp)          # 8-byte Folded Reload
	movb	15(%rsp), %dl
	leaq	72(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	32(%rsp), %rsi          # 8-byte Reload
	cmovneq	%r12, %rsi
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	%r14, %rsi
	cmovneq	%r15, %rsi
	movq	56(%rsp), %r14          # 8-byte Reload
	cmovneq	%r14, %r13
	movq	(%r13), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%r13)
	movb	15(%rsp), %dl
	testb	%dl, %dl
	movq	104(%rsp), %rsi         # 8-byte Reload
	movq	80(%rsp), %r13          # 8-byte Reload
	cmovneq	%r13, %rsi
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	cmovneq	96(%rsp), %rcx          # 8-byte Folded Reload
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	64(%rsp), %r15          # 8-byte Reload
	movq	%r15, %rsi
	movl	16(%rsp), %edx          # 4-byte Reload
	callq	rho
	leaq	136(%r12), %rax
	cmpq	$11, 112(%rsp)          # 8-byte Folded Reload
	movb	15(%rsp), %cl
	leaq	72(%rsp), %rdi
	cmovgq	%rax, %rdi
	testb	%cl, %cl
	movq	32(%rsp), %rsi          # 8-byte Reload
	cmovneq	%r12, %rsi
	movq	%rdi, %rdx
	movq	%rdi, %rbx
	cmovneq	%rax, %rdx
	movq	(%rdx), %rdx
	shlq	$16, %rdx
	xorq	(%rsi), %rdx
	movq	(%rbp), %rsi
	xorq	%rsi, %rdx
	testb	%cl, %cl
	cmoveq	%rsi, %rdx
	movq	%rdx, (%rbp)
	movb	15(%rsp), %cl
	testb	%cl, %cl
	movq	88(%rsp), %rdi          # 8-byte Reload
	cmovneq	48(%rsp), %rdi          # 8-byte Folded Reload
	movq	24(%rsp), %rsi          # 8-byte Reload
	cmovneq	%r14, %rsi
	movq	(%rsi), %rdx
	xorq	(%rdi), %rdx
	testb	%cl, %cl
	cmoveq	8(%rbp), %rdx
	movq	%rdx, (%rsi)
	movb	15(%rsp), %cl
	testb	%cl, %cl
	movq	104(%rsp), %rdx         # 8-byte Reload
	cmovneq	%r13, %rdx
	movq	(%rdx), %rdx
	cmovneq	%rax, %rbx
	movq	40(%rsp), %rax          # 8-byte Reload
	cmovneq	96(%rsp), %rax          # 8-byte Folded Reload
	xorq	(%rbx), %rdx
	xorq	(%rax), %rdx
	testb	%cl, %cl
	cmoveq	16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	%rbp, %rdi
	movq	%r15, %rsi
	movl	16(%rsp), %edx          # 4-byte Reload
	callq	theta
	addq	$152, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end9:
	.size	encrypt, .Lfunc_end9-encrypt
	.cfi_endproc
                                        # -- End function
	.globl	decrypt                 # -- Begin function decrypt
	.p2align	4, 0x90
	.type	decrypt,@function
decrypt:                                # @decrypt
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rcx, 24(%rsp)          # 8-byte Spill
	movq	%rdx, %rbp
	movq	%rdi, %r12
	leaq	24(%rdi), %r14
	movq	%rsi, 56(%rsp)          # 8-byte Spill
	testq	%rsi, %rsi
	leaq	16(%rsp), %r13
	movq	%r13, %rax
	cmovgq	%r14, %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	%r14, 88(%rsp)          # 8-byte Spill
	leaq	144(%rdi), %r15
	testq	%rsi, %rsi
	setg	%bl
	cmovgq	%r15, %r13
	movl	%r8d, %edx
	movl	%r8d, 8(%rsp)           # 4-byte Spill
	movl	%r8d, %eax
	andl	$1, %eax
	movb	%al, 7(%rsp)
	movq	%rbp, %rdi
	movq	%rcx, %rsi
	callq	mu
	movb	7(%rsp), %al
	orb	%al, %bl
	leaq	16(%rsp), %rsi
	movq	%rsi, %rcx
	cmovneq	%r14, %rcx
	movq	%rsi, %rdx
	movq	%rsi, %r14
	cmovneq	%r15, %rdx
	movq	(%rdx), %rdx
	movq	(%rbp), %rsi
	shlq	$16, %rdx
	xorq	(%rcx), %rdx
	xorq	%rsi, %rdx
	testb	%al, %al
	cmoveq	%rsi, %rdx
	movq	%rdx, (%rbp)
	movq	%r12, 112(%rsp)         # 8-byte Spill
	leaq	32(%r12), %rdi
	leaq	8(%rbp), %r9
	leaq	40(%r12), %rax
	leaq	152(%r12), %rbx
	movq	%rbx, 128(%rsp)         # 8-byte Spill
	leaq	160(%r12), %rsi
	movq	%rsi, 136(%rsp)         # 8-byte Spill
	movq	56(%rsp), %rdx          # 8-byte Reload
	cmpq	$2, %rdx
	setg	15(%rsp)                # 1-byte Folded Spill
	movq	%r14, %rcx
	cmovgq	%rsi, %rcx
	movq	%rcx, 144(%rsp)         # 8-byte Spill
	movq	%r14, %rsi
	cmovgq	%rax, %rsi
	movq	%rsi, %r10
	movq	%rsi, 104(%rsp)         # 8-byte Spill
	movq	%rax, %r8
	movq	%rax, 64(%rsp)          # 8-byte Spill
	cmpq	$1, %rdx
	movq	%r14, %r12
	cmovgq	%rbx, %r12
	movq	%r14, %rcx
	movq	%rdi, 120(%rsp)         # 8-byte Spill
	cmovgq	%rdi, %rcx
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	movq	24(%rsp), %rax          # 8-byte Reload
	cmpq	$1, %rax
	movb	7(%rsp), %bl
	movq	%r14, %rdx
	movq	%r9, 72(%rsp)           # 8-byte Spill
	cmovgq	%r9, %rdx
	movq	%rdx, 80(%rsp)          # 8-byte Spill
	testb	%bl, %bl
	cmovneq	%rdi, %rcx
	movq	%rdx, %rdi
	cmovneq	%r9, %rdi
	movq	(%rdi), %rsi
	xorq	(%rcx), %rsi
	testb	%bl, %bl
	cmoveq	8(%rbp), %rsi
	movq	%rsi, (%rdi)
	leaq	16(%rbp), %rbx
	movq	%rbx, 96(%rsp)          # 8-byte Spill
	cmpq	$2, %rax
	movq	%rax, %rsi
	movb	7(%rsp), %al
	movq	%r14, %rdx
	cmovgq	%rbx, %rdx
	movq	%rdx, 40(%rsp)          # 8-byte Spill
	testb	%al, %al
	cmovneq	%r15, %r13
	movq	%r10, %rcx
	cmovneq	%r8, %rcx
	movq	(%rcx), %rcx
	cmovneq	%rbx, %rdx
	xorq	(%r13), %rcx
	xorq	(%rdx), %rcx
	testb	%al, %al
	cmoveq	16(%rbp), %rcx
	movq	%rcx, (%rdx)
	movq	%rbp, %rdi
	movl	8(%rsp), %r15d          # 4-byte Reload
	movl	%r15d, %edx
	callq	rho
	movb	7(%rsp), %al
	testb	%al, %al
	movq	48(%rsp), %r13          # 8-byte Reload
	movq	%r13, %rcx
	movq	88(%rsp), %r14          # 8-byte Reload
	cmovneq	%r14, %rcx
	movq	%r12, %rdx
	movq	128(%rsp), %rdi         # 8-byte Reload
	cmovneq	%rdi, %rdx
	movq	(%rdx), %rdx
	movq	(%rbp), %rsi
	shlq	$16, %rdx
	xorq	(%rcx), %rdx
	xorq	%rsi, %rdx
	testb	%al, %al
	cmoveq	%rsi, %rdx
	movq	%rdx, (%rbp)
	movb	7(%rsp), %al
	testb	%al, %al
	movq	32(%rsp), %rcx          # 8-byte Reload
	movq	120(%rsp), %rbx         # 8-byte Reload
	cmovneq	%rbx, %rcx
	movq	80(%rsp), %rdx          # 8-byte Reload
	cmovneq	72(%rsp), %rdx          # 8-byte Folded Reload
	movq	(%rdx), %rsi
	xorq	(%rcx), %rsi
	testb	%al, %al
	cmoveq	8(%rbp), %rsi
	movq	%rsi, (%rdx)
	movb	7(%rsp), %al
	testb	%al, %al
	movq	104(%rsp), %rcx         # 8-byte Reload
	cmovneq	64(%rsp), %rcx          # 8-byte Folded Reload
	movq	(%rcx), %rcx
	cmovneq	%rdi, %r12
	movq	40(%rsp), %rdx          # 8-byte Reload
	cmovneq	96(%rsp), %rdx          # 8-byte Folded Reload
	xorq	(%r12), %rcx
	xorq	(%rdx), %rcx
	testb	%al, %al
	cmoveq	16(%rbp), %rcx
	movq	%rcx, (%rdx)
	movq	%rbp, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
	movl	%r15d, %edx
	callq	rho
	movb	7(%rsp), %al
	testb	%al, %al
	movq	%r13, %rcx
	cmovneq	%r14, %rcx
	movq	136(%rsp), %rdi         # 8-byte Reload
	movq	144(%rsp), %rdx         # 8-byte Reload
	cmovneq	%rdi, %rdx
	movq	(%rdx), %rdx
	shlq	$16, %rdx
	xorq	(%rcx), %rdx
	movq	(%rbp), %rcx
	xorq	%rcx, %rdx
	testb	%al, %al
	cmoveq	%rcx, %rdx
	movq	%rdx, (%rbp)
	movb	7(%rsp), %al
	testb	%al, %al
	movq	32(%rsp), %r13          # 8-byte Reload
	movq	%r13, %rcx
	cmovneq	%rbx, %rcx
	movq	80(%rsp), %r12          # 8-byte Reload
	movq	%r12, %rdx
	movq	72(%rsp), %rbx          # 8-byte Reload
	cmovneq	%rbx, %rdx
	movq	(%rdx), %rsi
	xorq	(%rcx), %rsi
	testb	%al, %al
	cmoveq	8(%rbp), %rsi
	movq	%rsi, (%rdx)
	movb	7(%rsp), %al
	orb	%al, 15(%rsp)           # 1-byte Folded Spill
	leaq	16(%rsp), %r14
	movq	%r14, %rcx
	cmovneq	64(%rsp), %rcx          # 8-byte Folded Reload
	movq	(%rcx), %rcx
	movq	%rdi, %rdx
	cmoveq	%r14, %rdx
	xorq	(%rdx), %rcx
	testb	%al, %al
	movq	40(%rsp), %rdx          # 8-byte Reload
	cmovneq	96(%rsp), %rdx          # 8-byte Folded Reload
	xorq	(%rdx), %rcx
	testb	%al, %al
	cmoveq	16(%rbp), %rcx
	movq	%rcx, (%rdx)
	movq	%rbp, %rdi
	movq	24(%rsp), %r15          # 8-byte Reload
	movq	%r15, %rsi
	movl	8(%rsp), %edx           # 4-byte Reload
	callq	rho
	movq	112(%rsp), %rax         # 8-byte Reload
	leaq	168(%rax), %rcx
	cmpq	$3, 56(%rsp)            # 8-byte Folded Reload
	movb	7(%rsp), %dl
	movq	%r14, %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	48(%rsp), %rsi          # 8-byte Reload
	cmovneq	88(%rsp), %rsi          # 8-byte Folded Reload
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	%r13, %rsi
	movq	120(%rsp), %r13         # 8-byte Reload
	cmovneq	%r13, %rsi
	movq	%r12, %rdi
	cmovneq	%rbx, %rdi
	movq	(%rdi), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rdi)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	104(%rsp), %r14         # 8-byte Reload
	movq	%r14, %rsi
	cmovneq	64(%rsp), %rsi          # 8-byte Folded Reload
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	movq	40(%rsp), %r12          # 8-byte Reload
	movq	%r12, %rcx
	cmovneq	96(%rsp), %rcx          # 8-byte Folded Reload
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	%r15, %rsi
	movl	8(%rsp), %edx           # 4-byte Reload
	callq	rho
	movq	112(%rsp), %rax         # 8-byte Reload
	leaq	176(%rax), %rcx
	cmpq	$4, 56(%rsp)            # 8-byte Folded Reload
	movb	7(%rsp), %dl
	leaq	16(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	48(%rsp), %rsi          # 8-byte Reload
	movq	88(%rsp), %r15          # 8-byte Reload
	cmovneq	%r15, %rsi
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	32(%rsp), %rsi          # 8-byte Reload
	cmovneq	%r13, %rsi
	movq	80(%rsp), %rdi          # 8-byte Reload
	cmovneq	72(%rsp), %rdi          # 8-byte Folded Reload
	movq	(%rdi), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rdi)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	cmovneq	64(%rsp), %r14          # 8-byte Folded Reload
	movq	(%r14), %rsi
	cmovneq	%rcx, %rax
	movq	%r12, %rcx
	movq	96(%rsp), %r12          # 8-byte Reload
	cmovneq	%r12, %rcx
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
	movl	8(%rsp), %edx           # 4-byte Reload
	callq	rho
	movq	112(%rsp), %r13         # 8-byte Reload
	leaq	184(%r13), %rcx
	cmpq	$5, 56(%rsp)            # 8-byte Folded Reload
	movb	7(%rsp), %dl
	leaq	16(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	48(%rsp), %rsi          # 8-byte Reload
	cmovneq	%r15, %rsi
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	32(%rsp), %rsi          # 8-byte Reload
	movq	120(%rsp), %r14         # 8-byte Reload
	cmovneq	%r14, %rsi
	movq	80(%rsp), %rdi          # 8-byte Reload
	cmovneq	72(%rsp), %rdi          # 8-byte Folded Reload
	movq	(%rdi), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rdi)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	104(%rsp), %rsi         # 8-byte Reload
	cmovneq	64(%rsp), %rsi          # 8-byte Folded Reload
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	cmovneq	%r12, %rcx
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
	movl	8(%rsp), %r15d          # 4-byte Reload
	movl	%r15d, %edx
	callq	rho
	leaq	192(%r13), %rcx
	movq	56(%rsp), %r12          # 8-byte Reload
	cmpq	$6, %r12
	movb	7(%rsp), %dl
	leaq	16(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	48(%rsp), %rsi          # 8-byte Reload
	cmovneq	88(%rsp), %rsi          # 8-byte Folded Reload
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	32(%rsp), %rsi          # 8-byte Reload
	cmovneq	%r14, %rsi
	movq	80(%rsp), %r14          # 8-byte Reload
	movq	%r14, %rdi
	cmovneq	72(%rsp), %rdi          # 8-byte Folded Reload
	movq	(%rdi), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rdi)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	104(%rsp), %rsi         # 8-byte Reload
	movq	64(%rsp), %r13          # 8-byte Reload
	cmovneq	%r13, %rsi
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	cmovneq	96(%rsp), %rcx          # 8-byte Folded Reload
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
	movl	%r15d, %edx
	callq	rho
	movq	112(%rsp), %rax         # 8-byte Reload
	leaq	200(%rax), %rcx
	cmpq	$7, %r12
	movb	7(%rsp), %dl
	leaq	16(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	48(%rsp), %r12          # 8-byte Reload
	movq	%r12, %rsi
	cmovneq	88(%rsp), %rsi          # 8-byte Folded Reload
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	32(%rsp), %rsi          # 8-byte Reload
	cmovneq	120(%rsp), %rsi         # 8-byte Folded Reload
	cmovneq	72(%rsp), %r14          # 8-byte Folded Reload
	movq	(%r14), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%r14)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	104(%rsp), %rsi         # 8-byte Reload
	cmovneq	%r13, %rsi
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	cmovneq	96(%rsp), %rcx          # 8-byte Folded Reload
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	24(%rsp), %r15          # 8-byte Reload
	movq	%r15, %rsi
	movl	8(%rsp), %edx           # 4-byte Reload
	callq	rho
	movq	112(%rsp), %rax         # 8-byte Reload
	leaq	208(%rax), %rcx
	cmpq	$8, 56(%rsp)            # 8-byte Folded Reload
	movb	7(%rsp), %dl
	leaq	16(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	%r12, %rsi
	movq	88(%rsp), %r14          # 8-byte Reload
	cmovneq	%r14, %rsi
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	32(%rsp), %r13          # 8-byte Reload
	movq	%r13, %rsi
	cmovneq	120(%rsp), %rsi         # 8-byte Folded Reload
	movq	80(%rsp), %rdi          # 8-byte Reload
	cmovneq	72(%rsp), %rdi          # 8-byte Folded Reload
	movq	(%rdi), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rdi)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	104(%rsp), %r12         # 8-byte Reload
	movq	%r12, %rsi
	cmovneq	64(%rsp), %rsi          # 8-byte Folded Reload
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	movq	40(%rsp), %rcx          # 8-byte Reload
	cmovneq	96(%rsp), %rcx          # 8-byte Folded Reload
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	%r15, %rsi
	movl	8(%rsp), %edx           # 4-byte Reload
	callq	rho
	movq	112(%rsp), %rax         # 8-byte Reload
	leaq	216(%rax), %rcx
	cmpq	$9, 56(%rsp)            # 8-byte Folded Reload
	movb	7(%rsp), %dl
	leaq	16(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	48(%rsp), %rsi          # 8-byte Reload
	cmovneq	%r14, %rsi
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	%r13, %rsi
	cmovneq	120(%rsp), %rsi         # 8-byte Folded Reload
	movq	80(%rsp), %r13          # 8-byte Reload
	movq	%r13, %rdi
	movq	72(%rsp), %r15          # 8-byte Reload
	cmovneq	%r15, %rdi
	movq	(%rdi), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%rdi)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	%r12, %rsi
	cmovneq	64(%rsp), %rsi          # 8-byte Folded Reload
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	movq	40(%rsp), %r14          # 8-byte Reload
	movq	%r14, %rcx
	movq	96(%rsp), %r12          # 8-byte Reload
	cmovneq	%r12, %rcx
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
	movl	8(%rsp), %edx           # 4-byte Reload
	callq	rho
	movq	112(%rsp), %rax         # 8-byte Reload
	leaq	224(%rax), %rcx
	cmpq	$10, 56(%rsp)           # 8-byte Folded Reload
	movb	7(%rsp), %dl
	leaq	16(%rsp), %rax
	cmovgq	%rcx, %rax
	testb	%dl, %dl
	movq	48(%rsp), %rsi          # 8-byte Reload
	cmovneq	88(%rsp), %rsi          # 8-byte Folded Reload
	movq	%rax, %rdi
	cmovneq	%rcx, %rdi
	movq	(%rdi), %rdi
	shlq	$16, %rdi
	xorq	(%rsi), %rdi
	movq	(%rbp), %rsi
	xorq	%rsi, %rdi
	testb	%dl, %dl
	cmoveq	%rsi, %rdi
	movq	%rdi, (%rbp)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	32(%rsp), %rsi          # 8-byte Reload
	cmovneq	120(%rsp), %rsi         # 8-byte Folded Reload
	cmovneq	%r15, %r13
	movq	(%r13), %rbx
	xorq	(%rsi), %rbx
	testb	%dl, %dl
	cmoveq	8(%rbp), %rbx
	movq	%rbx, (%r13)
	movb	7(%rsp), %dl
	testb	%dl, %dl
	movq	104(%rsp), %rsi         # 8-byte Reload
	movq	64(%rsp), %r15          # 8-byte Reload
	cmovneq	%r15, %rsi
	movq	(%rsi), %rsi
	cmovneq	%rcx, %rax
	movq	%r14, %rcx
	cmovneq	%r12, %rcx
	xorq	(%rax), %rsi
	xorq	(%rcx), %rsi
	testb	%dl, %dl
	cmoveq	16(%rbp), %rsi
	movq	%rsi, (%rcx)
	movq	%rbp, %rdi
	movq	24(%rsp), %r14          # 8-byte Reload
	movq	%r14, %rsi
	movl	8(%rsp), %r13d          # 4-byte Reload
	movl	%r13d, %edx
	callq	rho
	movq	112(%rsp), %rsi         # 8-byte Reload
	addq	$232, %rsi
	cmpq	$11, 56(%rsp)           # 8-byte Folded Reload
	movb	7(%rsp), %al
	leaq	16(%rsp), %rdi
	cmovgq	%rsi, %rdi
	testb	%al, %al
	movq	48(%rsp), %rdx          # 8-byte Reload
	cmovneq	88(%rsp), %rdx          # 8-byte Folded Reload
	movq	%rdi, %rcx
	movq	%rdi, %rbx
	cmovneq	%rsi, %rcx
	movq	(%rcx), %rcx
	shlq	$16, %rcx
	xorq	(%rdx), %rcx
	movq	(%rbp), %rdx
	xorq	%rdx, %rcx
	testb	%al, %al
	cmoveq	%rdx, %rcx
	movq	%rcx, (%rbp)
	movb	7(%rsp), %al
	testb	%al, %al
	movq	32(%rsp), %rdi          # 8-byte Reload
	cmovneq	120(%rsp), %rdi         # 8-byte Folded Reload
	movq	80(%rsp), %rdx          # 8-byte Reload
	cmovneq	72(%rsp), %rdx          # 8-byte Folded Reload
	movq	(%rdx), %rcx
	xorq	(%rdi), %rcx
	testb	%al, %al
	cmoveq	8(%rbp), %rcx
	movq	%rcx, (%rdx)
	movb	7(%rsp), %al
	testb	%al, %al
	movq	104(%rsp), %rcx         # 8-byte Reload
	cmovneq	%r15, %rcx
	movq	(%rcx), %rcx
	cmovneq	%rsi, %rbx
	movq	40(%rsp), %rdx          # 8-byte Reload
	cmovneq	%r12, %rdx
	xorq	(%rbx), %rcx
	xorq	(%rdx), %rcx
	testb	%al, %al
	cmoveq	16(%rbp), %rcx
	movq	%rcx, (%rdx)
	movq	%rbp, %rdi
	movq	%r14, %rsi
	movl	%r13d, %edx
	callq	theta
	movq	%rbp, %rdi
	movq	%r14, %rsi
	movl	%r13d, %edx
	callq	mu
	addq	$152, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end10:
	.size	decrypt, .Lfunc_end10-decrypt
	.cfi_endproc
                                        # -- End function
	.globl	twy_key                 # -- Begin function twy_key
	.p2align	4, 0x90
	.type	twy_key,@function
twy_key:                                # @twy_key
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	(%rdx), %rax
	movq	%rax, (%rdi)
	leaq	24(%rdi), %r15
	movq	%rax, 24(%rdi)
	movq	8(%rdx), %rax
	movq	%rax, 8(%rdi)
	movq	%rax, 32(%rdi)
	movq	16(%rdx), %rax
	movq	%rax, 16(%rdi)
	movq	%rax, 40(%rdi)
	movq	%r15, %rdi
	movl	$1, %edx
	callq	theta
	movq	%r15, %rdi
	movq	%r14, %rsi
	movl	$1, %edx
	callq	mu
	leaq	48(%rbx), %rsi
	movl	$2827, %edi             # imm = 0xB0B
	movq	%r14, %rdx
	callq	rndcon_gen
	leaq	144(%rbx), %rsi
	movl	$45489, %edi            # imm = 0xB1B1
	movq	%r14, %rdx
	callq	rndcon_gen
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end11:
	.size	twy_key, .Lfunc_end11-twy_key
	.cfi_endproc
                                        # -- End function
	.globl	twy_enc                 # -- Begin function twy_enc
	.p2align	4, 0x90
	.type	twy_enc,@function
twy_enc:                                # @twy_enc
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r8d, %r13d
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movq	%rdx, %rbx
	movq	%rsi, %r15
	movq	%rdi, %r12
	movb	$1, 6(%rsp)
	xorl	%r8d, %r8d
	testl	%r13d, %r13d
	setle	%r14b
	setg	%r8b
	setg	5(%rsp)
	callq	encrypt
	leaq	24(%rbx), %rbp
	andb	6(%rsp), %r14b
	cmovneq	%rbx, %rbp
	orb	5(%rsp), %r14b
	movl	%r14d, %eax
	andb	$1, %al
	movb	%al, 4(%rsp)
	cmpl	$1, %r13d
	setg	%al
	andb	%r14b, %al
	movb	%al, 3(%rsp)
	movzbl	%al, %r8d
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbp, %rdx
	movq	8(%rsp), %r14           # 8-byte Reload
	movq	%r14, %rcx
	callq	encrypt
	leaq	24(%rbp), %rdx
	cmpl	$2, %r13d
	setl	%bl
	setg	%cl
	andb	4(%rsp), %bl
	cmovneq	%rbp, %rdx
	orb	3(%rsp), %bl
	movl	%ebx, %eax
	andb	$1, %al
	movb	%al, 2(%rsp)
	cmpl	$3, %r13d
	setl	%bpl
	andb	%cl, %bl
	movb	%bl, 1(%rsp)
	movzbl	%bl, %r8d
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%r14, %rcx
	callq	encrypt
	andb	2(%rsp), %bpl
	orb	1(%rsp), %bpl
	andb	$1, %bpl
	movb	%bpl, 7(%rsp)
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end12:
	.size	twy_enc, .Lfunc_end12-twy_enc
	.cfi_endproc
                                        # -- End function
	.globl	twy_dec                 # -- Begin function twy_dec
	.p2align	4, 0x90
	.type	twy_dec,@function
twy_dec:                                # @twy_dec
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%r8d, %r13d
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movq	%rdx, %rbx
	movq	%rsi, %r15
	movq	%rdi, %r12
	movb	$1, 6(%rsp)
	xorl	%r8d, %r8d
	testl	%r13d, %r13d
	setle	%r14b
	setg	%r8b
	setg	5(%rsp)
	callq	decrypt
	leaq	24(%rbx), %rbp
	andb	6(%rsp), %r14b
	cmovneq	%rbx, %rbp
	orb	5(%rsp), %r14b
	movl	%r14d, %eax
	andb	$1, %al
	movb	%al, 4(%rsp)
	cmpl	$1, %r13d
	setg	%al
	andb	%r14b, %al
	movb	%al, 3(%rsp)
	movzbl	%al, %r8d
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbp, %rdx
	movq	8(%rsp), %r14           # 8-byte Reload
	movq	%r14, %rcx
	callq	decrypt
	leaq	24(%rbp), %rdx
	cmpl	$2, %r13d
	setl	%bl
	setg	%cl
	andb	4(%rsp), %bl
	cmovneq	%rbp, %rdx
	orb	3(%rsp), %bl
	movl	%ebx, %eax
	andb	$1, %al
	movb	%al, 2(%rsp)
	cmpl	$3, %r13d
	setl	%bpl
	andb	%cl, %bl
	movb	%bl, 1(%rsp)
	movzbl	%bl, %r8d
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%r14, %rcx
	callq	decrypt
	andb	2(%rsp), %bpl
	orb	1(%rsp), %bpl
	andb	$1, %bpl
	movb	%bpl, 7(%rsp)
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end13:
	.size	twy_dec, .Lfunc_end13-twy_dec
	.cfi_endproc
                                        # -- End function
	.globl	twy_destroy             # -- Begin function twy_destroy
	.p2align	4, 0x90
	.type	twy_destroy,@function
twy_destroy:                            # @twy_destroy
	.cfi_startproc
# %bb.0:
	movq	$0, 24(%rdi)
	movq	$0, (%rdi)
	movq	$0, 32(%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 40(%rdi)
	movq	$0, 16(%rdi)
	retq
.Lfunc_end14:
	.size	twy_destroy, .Lfunc_end14-twy_destroy
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%20s : %08lx %08lx %08lx \n"
	.size	.L.str, 27

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"**********\n"
	.size	.L.str.1, 12

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

	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits

	.text
	.file	"llvm-link"
	.globl	printvec                # -- Begin function printvec
	.p2align	4, 0x90
	.type	printvec,@function
printvec:                               # @printvec
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, %rax
	movq	16(%rsi), %rdx
	movq	(%rsi), %r8
	movq	8(%rsi), %rcx
	movl	$.L.str, %edi
	movq	%rax, %rsi
	xorl	%eax, %eax
	callq	printf
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$352, %rsp              # imm = 0x160
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -384(%rbp)
	movq	$0, -368(%rbp)
	movq	$1, -336(%rbp)
	movq	$1, -344(%rbp)
	movq	$1, -352(%rbp)
	leaq	-280(%rbp), %r14
	leaq	-384(%rbp), %r15
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	twy_key
	movl	$.Lstr, %edi
	callq	puts
	movl	$.L.str.2, %edi
	movq	%r15, %rsi
	callq	printvec
	leaq	-352(%rbp), %r12
	movl	$.L.str.3, %edi
	movq	%r12, %rsi
	callq	printvec
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	encrypt
	movl	$.L.str.4, %edi
	movq	%r12, %rsi
	callq	printvec
	movq	$6, -384(%rbp)
	movq	$5, -376(%rbp)
	movq	$4, -368(%rbp)
	movq	$3, -352(%rbp)
	movq	$2, -344(%rbp)
	movq	$1, -336(%rbp)
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	twy_key
	movl	$.Lstr.1, %edi
	callq	puts
	movl	$.L.str.2, %edi
	movq	%r15, %rsi
	callq	printvec
	movl	$.L.str.3, %edi
	movq	%r12, %rsi
	callq	printvec
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	encrypt
	movl	$.L.str.4, %edi
	movq	%r12, %rsi
	callq	printvec
	movl	$2209258948, %ebx       # imm = 0x83AE9DC4
	leaq	959468110(%rbx), %rax
	movq	%rax, -368(%rbp)
	movq	$1164413355, -376(%rbp) # imm = 0x456789AB
	leaq	1531016304(%rbx), %rax
	movq	%rax, -384(%rbp)
	movq	$19088743, -336(%rbp)   # imm = 0x1234567
	leaq	386810156(%rbx), %rax
	movq	%rax, -344(%rbp)
	movq	$591751049, -352(%rbp)  # imm = 0x23456789
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	twy_key
	movl	$.Lstr.2, %edi
	callq	puts
	movl	$.L.str.2, %edi
	movq	%r15, %rsi
	callq	printvec
	movl	$.L.str.3, %edi
	movq	%r12, %rsi
	callq	printvec
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	encrypt
	movl	$.L.str.4, %edi
	movq	%r12, %rsi
	callq	printvec
	leaq	1191871241(%rbx), %rax
	movq	%rax, -368(%rbp)
	leaq	1382392692(%rbx), %rax
	movq	%rax, -376(%rbp)
	leaq	1329708442(%rbx), %rax
	movq	%rax, -384(%rbp)
	leaq	695422771(%rbx), %rax
	movq	%rax, -336(%rbp)
	movq	%rbx, -344(%rbp)
	movq	$1079625582, -352(%rbp) # imm = 0x4059C76E
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	twy_key
	movl	$.Lstr.3, %edi
	callq	puts
	movl	$.L.str.2, %edi
	movq	%r15, %rsi
	callq	printvec
	movl	$.L.str.3, %edi
	movq	%r12, %rsi
	callq	printvec
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	encrypt
	movl	$.L.str.4, %edi
	movq	%r12, %rsi
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
	movq	%r14, %rdi
	movq	%r12, %rsi
	movl	$3, %edx
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
	movq	%r14, %rdi
	movq	%r12, %rsi
	movl	$2, %edx
	callq	twy_dec
	movq	%r14, %rdi
	movq	%r15, %rsi
	movl	$1, %edx
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
	cmpq	-40(%rbp), %rax
	jne	.LBB1_2
# %bb.1:                                # %SP_return
	xorl	%eax, %eax
	addq	$352, %rsp              # imm = 0x160
	popq	%rbx
	popq	%r12
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
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %rax
	movq	(%rdi), %rdi
	movq	8(%rax), %rbx
	movq	%rax, %rdx
	movq	%rax, -72(%rbp)         # 8-byte Spill
	movl	%edi, %eax
	andl	$1, %eax
	movl	%ebx, %ecx
	andl	$1, %ecx
	movq	16(%rdx), %r10
	movl	%r10d, %edx
	andl	$1, %edx
	movl	%edi, %esi
	andl	$2, %esi
	leaq	(%rsi,%rax,4), %r11
	movl	%ebx, %eax
	andl	$2, %eax
	leaq	(%rax,%rcx,4), %r12
	movl	%r10d, %eax
	andl	$2, %eax
	leaq	(%rax,%rdx,4), %r15
	movq	%rdi, %rdx
	shrq	$2, %rdx
	movq	%rbx, %rcx
	shrq	$2, %rcx
	movq	%r10, %rax
	shrq	$2, %rax
	movq	%rdi, %r8
	shrq	$4, %r8
	movq	%rbx, %r14
	shrq	$4, %r14
	movl	%r10d, %esi
	andl	$4, %esi
	andl	$2, %eax
	orq	%rsi, %rax
	movl	%ebx, %esi
	movq	%rbx, %r9
	andl	$4, %esi
	andl	$2, %ecx
	orq	%rsi, %rcx
	movl	%edi, %esi
	andl	$4, %esi
	andl	$2, %edx
	orq	%rsi, %rdx
	movl	%r8d, %esi
	andl	$1, %esi
	orq	%rdx, %rsi
	movl	%r14d, %edx
	andl	$1, %edx
	orq	%rcx, %rdx
	movq	%r10, %rcx
	shrq	$4, %rcx
	movl	%ecx, %ebx
	andl	$1, %ebx
	orq	%rax, %rbx
	shlq	$4, %r15
	leaq	(%r15,%rbx,4), %rbx
	movq	%rdi, %r15
	shrq	$6, %r15
	shlq	$4, %r12
	leaq	(%r12,%rdx,4), %rax
	movq	%r9, %r12
	shrq	$6, %r12
	shlq	$4, %r11
	leaq	(%r11,%rsi,4), %rsi
	andl	$2, %r8d
	movl	%r15d, %edx
	andl	$1, %edx
	orq	%r8, %rdx
	movq	%r10, %r8
	shrq	$6, %r8
	andl	$2, %ecx
	andl	$2, %r14d
	orq	%rsi, %rdx
	movl	%r12d, %esi
	andl	$1, %esi
	orq	%r14, %rsi
	orq	%rax, %rsi
	movl	%r8d, %eax
	andl	$1, %eax
	orq	%rcx, %rax
	orq	%rbx, %rax
	movq	%rdi, %r14
	shrq	$8, %r14
	movq	%r9, %r11
	shrq	$8, %r11
	andl	$2, %r12d
	andl	$2, %r15d
	movl	%r14d, %ecx
	andl	$1, %ecx
	orq	%r15, %rcx
	movl	%r11d, %ebx
	andl	$1, %ebx
	orq	%r12, %rbx
	movq	%r10, %r12
	shrq	$8, %r12
	andl	$2, %r8d
	movl	%r12d, %r15d
	andl	$1, %r15d
	orq	%r8, %r15
	shlq	$4, %rax
	leaq	(%rax,%r15,4), %r13
	movq	%rdi, %r15
	shrq	$10, %r15
	shlq	$4, %rsi
	leaq	(%rsi,%rbx,4), %rsi
	movq	%r9, %r8
	shrq	$10, %r8
	shlq	$4, %rdx
	leaq	(%rdx,%rcx,4), %rdx
	andl	$2, %r14d
	movl	%r15d, %eax
	andl	$1, %eax
	orq	%r14, %rax
	movq	%r10, %rcx
	shrq	$10, %rcx
	andl	$2, %r12d
	andl	$2, %r11d
	orq	%rdx, %rax
	movl	%r8d, %edx
	andl	$1, %edx
	orq	%r11, %rdx
	orq	%rsi, %rdx
	movl	%ecx, %ebx
	andl	$1, %ebx
	orq	%r12, %rbx
	orq	%r13, %rbx
	movq	%rdi, %r14
	shrq	$12, %r14
	movq	%r9, %r11
	shrq	$12, %r11
	andl	$2, %r8d
	andl	$2, %r15d
	movl	%r14d, %esi
	andl	$1, %esi
	orq	%r15, %rsi
	movl	%r11d, %r12d
	andl	$1, %r12d
	orq	%r8, %r12
	movq	%r10, %r8
	shrq	$12, %r8
	andl	$2, %ecx
	movl	%r8d, %r15d
	andl	$1, %r15d
	orq	%rcx, %r15
	shlq	$4, %rbx
	leaq	(%rbx,%r15,4), %rcx
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movq	%rdi, %r15
	shrq	$14, %r15
	shlq	$4, %rdx
	leaq	(%rdx,%r12,4), %rcx
	movq	%r9, %r12
	movq	%r9, -48(%rbp)          # 8-byte Spill
	shrq	$14, %r12
	shlq	$4, %rax
	leaq	(%rax,%rsi,4), %rdx
	andl	$2, %r14d
	movl	%r15d, %eax
	andl	$1, %eax
	orq	%r14, %rax
	movq	%r10, %rbx
	shrq	$14, %rbx
	andl	$2, %r8d
	andl	$2, %r11d
	orq	%rdx, %rax
	movl	%r12d, %edx
	andl	$1, %edx
	orq	%r11, %rdx
	orq	%rcx, %rdx
	movl	%ebx, %ecx
	andl	$1, %ecx
	orq	%r8, %rcx
	addq	-56(%rbp), %rcx         # 8-byte Folded Reload
	movq	%rdi, %r14
	shrq	$16, %r14
	shrq	$16, %r9
	andl	$2, %r12d
	andl	$2, %r15d
	movl	%r14d, %esi
	andl	$1, %esi
	orq	%r15, %rsi
	movl	%r9d, %r11d
	andl	$1, %r11d
	orq	%r12, %r11
	movq	%r10, %r8
	shrq	$16, %r8
	andl	$2, %ebx
	movl	%r8d, %r15d
	andl	$1, %r15d
	orq	%rbx, %r15
	shlq	$4, %rcx
	leaq	(%rcx,%r15,4), %r13
	movq	%rdi, %r15
	shrq	$18, %r15
	shlq	$4, %rdx
	leaq	(%rdx,%r11,4), %rcx
	movq	-48(%rbp), %r11         # 8-byte Reload
	movq	%r11, %r12
	shrq	$18, %r12
	shlq	$4, %rax
	leaq	(%rax,%rsi,4), %rdx
	andl	$2, %r14d
	movl	%r15d, %eax
	andl	$1, %eax
	orq	%r14, %rax
	movq	%r10, %rbx
	shrq	$18, %rbx
	andl	$2, %r8d
	andl	$2, %r9d
	orq	%rdx, %rax
	movl	%r12d, %edx
	andl	$1, %edx
	orq	%r9, %rdx
	orq	%rcx, %rdx
	movl	%ebx, %ecx
	andl	$1, %ecx
	orq	%r8, %rcx
	orq	%r13, %rcx
	movq	%rdi, %r14
	shrq	$20, %r14
	shrq	$20, %r11
	andl	$2, %r12d
	andl	$2, %r15d
	movl	%r14d, %r9d
	andl	$1, %r9d
	orq	%r15, %r9
	movl	%r11d, %esi
	andl	$1, %esi
	orq	%r12, %rsi
	movq	%r10, %r8
	shrq	$20, %r8
	andl	$2, %ebx
	movl	%r8d, %r15d
	andl	$1, %r15d
	orq	%rbx, %r15
	shlq	$4, %rcx
	leaq	(%rcx,%r15,4), %r15
	movq	%rdi, %r13
	shrq	$22, %r13
	shlq	$4, %rdx
	leaq	(%rdx,%rsi,4), %rsi
	movq	-48(%rbp), %rcx         # 8-byte Reload
	movq	%rcx, %r12
	shrq	$22, %r12
	shlq	$4, %rax
	leaq	(%rax,%r9,4), %rdx
	andl	$2, %r14d
	movl	%r13d, %eax
	andl	$1, %eax
	orq	%r14, %rax
	movq	%r10, %r9
	shrq	$22, %r9
	andl	$2, %r8d
	andl	$2, %r11d
	orq	%rdx, %rax
	movl	%r12d, %edx
	andl	$1, %edx
	orq	%r11, %rdx
	orq	%rsi, %rdx
	movl	%r9d, %ebx
	andl	$1, %ebx
	orq	%r8, %rbx
	orq	%r15, %rbx
	movq	%rdi, -64(%rbp)         # 8-byte Spill
	movq	%rdi, %r15
	shrq	$24, %r15
	movq	%rcx, %r14
	shrq	$24, %r14
	andl	$2, %r12d
	andl	$2, %r13d
	movl	%r15d, %r11d
	andl	$1, %r11d
	orq	%r13, %r11
	movl	%r14d, %ecx
	andl	$1, %ecx
	orq	%r12, %rcx
	movq	%r10, %r8
	shrq	$24, %r8
	andl	$2, %r9d
	movl	%r8d, %esi
	andl	$1, %esi
	orq	%r9, %rsi
	shlq	$4, %rbx
	leaq	(%rbx,%rsi,4), %r9
	movq	%rdi, %r13
	shrq	$26, %r13
	shlq	$4, %rdx
	leaq	(%rdx,%rcx,4), %rcx
	movq	-48(%rbp), %rsi         # 8-byte Reload
	movq	%rsi, %r12
	shrq	$26, %r12
	shlq	$4, %rax
	leaq	(%rax,%r11,4), %rax
	andl	$2, %r15d
	movl	%r13d, %r11d
	andl	$1, %r11d
	orq	%r15, %r11
	movq	%r10, %r15
	shrq	$26, %r15
	andl	$2, %r8d
	andl	$2, %r14d
	orq	%rax, %r11
	movl	%r12d, %edx
	andl	$1, %edx
	orq	%r14, %rdx
	orq	%rcx, %rdx
	movl	%r15d, %ebx
	andl	$1, %ebx
	orq	%r8, %rbx
	orq	%r9, %rbx
	movq	%rdi, %r8
	shrq	$28, %r8
	movq	%rsi, %rcx
	movq	%rsi, %rdi
	shrq	$28, %rcx
	andl	$2, %r12d
	andl	$2, %r13d
	movl	%r8d, %r14d
	andl	$1, %r14d
	orq	%r13, %r14
	movl	%ecx, %r9d
	andl	$1, %r9d
	orq	%r12, %r9
	movq	%r10, %rax
	shrq	$28, %rax
	andl	$2, %r15d
	movl	%eax, %esi
	andl	$1, %esi
	orq	%r15, %rsi
	shlq	$4, %rbx
	leaq	(%rbx,%rsi,4), %r15
	movl	%r10d, %ebx
	shrl	$30, %ebx
	andl	$1, %ebx
	andl	$2, %eax
	orq	%rbx, %rax
	shlq	$4, %rdx
	leaq	(%rdx,%r9,4), %rdx
	movq	%rdi, %r9
	movl	%r9d, %ebx
	shrl	$30, %ebx
	andl	$1, %ebx
	andl	$2, %ecx
	orq	%rbx, %rcx
	shlq	$4, %r11
	leaq	(%r11,%r14,4), %rbx
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movl	%edi, %esi
	shrl	$30, %esi
	andl	$1, %esi
	andl	$2, %r8d
	orq	%rsi, %r8
	orq	%rbx, %r8
	orq	%rdx, %rcx
	orq	%r15, %rax
	shrl	$31, %edi
	leaq	(%rdi,%r8,2), %rdx
	movq	%r9, %rsi
	shrl	$31, %esi
	leaq	(%rsi,%rcx,2), %rcx
	shrl	$31, %r10d
	leaq	(%r10,%rax,2), %rax
	movq	-72(%rbp), %rsi         # 8-byte Reload
	movq	%rax, (%rsi)
	movq	%rcx, 8(%rsi)
	movq	%rdx, 16(%rsi)
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	(%rdi), %r8
	movq	8(%rdi), %rcx
	movq	16(%rdi), %rdx
	movq	%rdx, %rsi
	notq	%rsi
	orq	%rcx, %rsi
	xorq	%r8, %rsi
	movq	%r8, %rax
	notq	%rax
	orq	%rdx, %rax
	xorq	%rcx, %rax
	notq	%rcx
	orq	%r8, %rcx
	xorq	%rdx, %rcx
	movq	%rsi, (%rdi)
	movq	%rax, 8(%rdi)
	movq	%rcx, 16(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	(%rdi), %rbx
	movq	8(%rdi), %r15
	movq	%rdi, -48(%rbp)         # 8-byte Spill
	movq	%rbx, %r11
	shrq	$16, %r11
	movq	%r11, %rax
	xorq	%rbx, %rax
	movq	%r15, %r10
	shlq	$16, %r10
	movq	%r15, %r9
	shrq	$16, %r9
	movq	16(%rdi), %r8
	movq	%r8, %rcx
	shlq	$16, %rcx
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movq	%r15, %r13
	shrq	$24, %r13
	movq	%rbx, %rdx
	shlq	$24, %rdx
	movq	%rbx, %r14
	shlq	$16, %r14
	movq	%rbx, %rsi
	shlq	$8, %rsi
	xorq	%r14, %rdx
	xorq	%rax, %rdx
	movq	%rbx, %rax
	shrq	$8, %rax
	xorq	%rsi, %rax
	xorq	%r10, %rsi
	xorq	%r9, %rsi
	xorq	%rdx, %rsi
	movq	%r8, %rdx
	shlq	$8, %rdx
	movq	%r8, %r12
	shrq	$8, %r12
	movq	%r13, %rcx
	movq	-56(%rbp), %rdi         # 8-byte Reload
	xorq	%rdi, %rcx
	xorq	%rdx, %rcx
	xorq	%r12, %rcx
	xorq	%rsi, %rcx
	movq	%r14, %rsi
	xorq	%r15, %rsi
	xorq	%rsi, %rax
	xorq	%r11, %r14
	shrq	$24, %rbx
	xorq	%rbx, %r11
	xorq	%r9, %r11
	xorq	%rax, %r11
	movq	%r15, %rax
	shlq	$24, %rax
	movq	%r15, %rsi
	shlq	$8, %rsi
	xorq	%r10, %rax
	xorq	%rsi, %rax
	xorq	%rdi, %rax
	xorq	%r11, %rax
	movq	%r8, %r11
	shrq	$16, %r11
	movq	%r8, %r12
	shrq	$24, %r12
	xorq	%r11, %r12
	xorq	%r12, %rcx
	xorq	%r12, %rax
	xorq	%r8, %rbx
	xorq	%r14, %rbx
	xorq	%r10, %rsi
	shrq	$8, %r15
	xorq	%r15, %rsi
	xorq	%rbx, %rsi
	xorq	%r9, %r13
	xorq	%r11, %r13
	shlq	$24, %r8
	xorq	%r8, %r13
	xorq	%rsi, %r13
	xorq	%rdi, %rdx
	xorq	%r13, %rdx
	movq	-48(%rbp), %rsi         # 8-byte Reload
	movq	%rcx, (%rsi)
	movq	%rax, 8(%rsi)
	movq	%rdx, 16(%rsi)
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	(%rdi), %rax
	movq	16(%rdi), %rcx
	movq	%rax, %rdx
	shrq	$10, %rdx
	shlq	$22, %rax
	xorq	%rdx, %rax
	movq	%rax, (%rdi)
	leaq	(%rcx,%rcx), %rax
	shrq	$31, %rcx
	xorq	%rcx, %rax
	movq	%rax, 16(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	(%rdi), %rax
	movq	16(%rdi), %rcx
	leaq	(%rax,%rax), %rdx
	shrq	$31, %rax
	xorq	%rax, %rdx
	movq	%rdx, (%rdi)
	movq	%rcx, %rax
	shrq	$10, %rax
	shlq	$22, %rcx
	xorq	%rax, %rcx
	movq	%rcx, 16(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	callq	theta
	movq	%rbx, %rdi
	callq	pi_1
	movq	%rbx, %rdi
	callq	gamma_
	movq	%rbx, %rdi
	callq	pi_2
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, (%rsi)
	leaq	(%rdi,%rdi), %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testw	%di, %di
	cmovnsq	%rax, %rcx
	leaq	(%rcx,%rcx), %rax
	movq	%rax, %rdx
	xorq	$69649, %rdx            # imm = 0x11011
	testw	%cx, %cx
	cmovnsq	%rax, %rdx
	movq	%rcx, 8(%rsi)
	movq	%rdx, 16(%rsi)
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testw	%dx, %dx
	cmovnsq	%rax, %rcx
	leaq	(%rcx,%rcx), %rax
	movq	%rax, %rdx
	xorq	$69649, %rdx            # imm = 0x11011
	testw	%cx, %cx
	cmovnsq	%rax, %rdx
	movq	%rcx, 24(%rsi)
	movq	%rdx, 32(%rsi)
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testw	%dx, %dx
	cmovnsq	%rax, %rcx
	leaq	(%rcx,%rcx), %rax
	movq	%rax, %rdx
	xorq	$69649, %rdx            # imm = 0x11011
	testw	%cx, %cx
	cmovnsq	%rax, %rdx
	movq	%rcx, 40(%rsi)
	movq	%rdx, 48(%rsi)
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testw	%dx, %dx
	cmovnsq	%rax, %rcx
	leaq	(%rcx,%rcx), %rax
	movq	%rax, %rdx
	xorq	$69649, %rdx            # imm = 0x11011
	testw	%cx, %cx
	cmovnsq	%rax, %rdx
	movq	%rcx, 56(%rsi)
	movq	%rdx, 64(%rsi)
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testw	%dx, %dx
	cmovnsq	%rax, %rcx
	leaq	(%rcx,%rcx), %rax
	movq	%rax, %rdx
	xorq	$69649, %rdx            # imm = 0x11011
	testw	%cx, %cx
	cmovnsq	%rax, %rdx
	movq	%rcx, 72(%rsi)
	movq	%rdx, 80(%rsi)
	leaq	(%rdx,%rdx), %rax
	movq	%rax, %rcx
	xorq	$69649, %rcx            # imm = 0x11011
	testw	%dx, %dx
	cmovnsq	%rax, %rcx
	movq	%rcx, 88(%rsi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, %rbx
	movq	48(%rdi), %rax
	shlq	$16, %rax
	xorq	(%rdi), %rax
	movq	%rsi, %r14
	xorq	%rax, (%rsi)
	movq	8(%rdi), %rax
	xorq	%rax, 8(%rsi)
	movq	48(%rdi), %rax
	xorq	16(%rdi), %rax
	xorq	%rax, 16(%rsi)
	movq	%rsi, %rdi
	callq	rho
	movq	56(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	56(%rbx), %rax
	xorq	16(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	64(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	64(%rbx), %rax
	xorq	16(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	72(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	72(%rbx), %rax
	xorq	16(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	80(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	80(%rbx), %rax
	xorq	16(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	88(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	88(%rbx), %rax
	xorq	16(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	96(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	96(%rbx), %rax
	xorq	16(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	104(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	104(%rbx), %rax
	xorq	16(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	112(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	112(%rbx), %rax
	xorq	16(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	120(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	120(%rbx), %rax
	xorq	16(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	128(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	128(%rbx), %rax
	xorq	16(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	136(%rbx), %rax
	shlq	$16, %rax
	xorq	(%rbx), %rax
	xorq	%rax, (%r14)
	movq	8(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	136(%rbx), %rax
	xorq	16(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	theta
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	callq	mu
	movq	144(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	144(%rbx), %rax
	xorq	40(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	152(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	152(%rbx), %rax
	xorq	40(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	160(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	160(%rbx), %rax
	xorq	40(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	168(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	168(%rbx), %rax
	xorq	40(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	176(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	176(%rbx), %rax
	xorq	40(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	184(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	184(%rbx), %rax
	xorq	40(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	192(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	192(%rbx), %rax
	xorq	40(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	200(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	200(%rbx), %rax
	xorq	40(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	208(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	208(%rbx), %rax
	xorq	40(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	216(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	216(%rbx), %rax
	xorq	40(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	224(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	224(%rbx), %rax
	xorq	40(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	rho
	movq	232(%rbx), %rax
	shlq	$16, %rax
	xorq	24(%rbx), %rax
	xorq	%rax, (%r14)
	movq	32(%rbx), %rax
	xorq	%rax, 8(%r14)
	movq	232(%rbx), %rax
	xorq	40(%rbx), %rax
	xorq	%rax, 16(%r14)
	movq	%r14, %rdi
	callq	theta
	movq	%r14, %rdi
	callq	mu
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, %rbx
	movq	(%rsi), %rax
	movq	%rax, (%rdi)
	leaq	24(%rdi), %r14
	movq	%rax, 24(%rdi)
	movq	8(%rsi), %rax
	movq	%rax, 8(%rdi)
	movq	%rax, 32(%rdi)
	movq	16(%rsi), %rax
	movq	%rax, 16(%rdi)
	movq	%rax, 40(%rdi)
	movq	%r14, %rdi
	callq	theta
	movq	%r14, %rdi
	callq	mu
	leaq	48(%rbx), %rsi
	movl	$2827, %edi             # imm = 0xB0B
	callq	rndcon_gen
	leaq	144(%rbx), %rsi
	movl	$45489, %edi            # imm = 0xB1B1
	callq	rndcon_gen
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	movl	%edx, %r15d
	movq	%rsi, %rbx
	movq	%rdi, %r14
	testl	%edx, %edx
	jle	.LBB12_2
# %bb.1:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	encrypt
	addq	$24, %rbx
.LBB12_2:
	cmpl	$2, %r15d
	jl	.LBB12_4
# %bb.3:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	encrypt
	addq	$24, %rbx
.LBB12_4:
	cmpl	$3, %r15d
	jl	.LBB12_6
# %bb.5:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	encrypt
.LBB12_6:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	movl	%edx, %r15d
	movq	%rsi, %rbx
	movq	%rdi, %r14
	testl	%edx, %edx
	jle	.LBB13_2
# %bb.1:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	decrypt
	addq	$24, %rbx
.LBB13_2:
	cmpl	$2, %r15d
	jl	.LBB13_4
# %bb.3:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	decrypt
	addq	$24, %rbx
.LBB13_4:
	cmpl	$3, %r15d
	jl	.LBB13_6
# %bb.5:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	decrypt
.LBB13_6:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorps	%xmm0, %xmm0
	movups	%xmm0, 32(%rdi)
	movups	%xmm0, 16(%rdi)
	movups	%xmm0, (%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
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

	.type	.Lstr.1,@object         # @str.1
.Lstr.1:
	.asciz	"**********"
	.size	.Lstr.1, 11

	.type	.Lstr.2,@object         # @str.2
.Lstr.2:
	.asciz	"**********"
	.size	.Lstr.2, 11

	.type	.Lstr.3,@object         # @str.3
.Lstr.3:
	.asciz	"**********"
	.size	.Lstr.3, 11

	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits

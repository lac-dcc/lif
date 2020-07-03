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
	movq	.L__const.main.a(%rip), %rax
	movq	%rax, -24(%rbp)
	movl	.L__const.main.a+8(%rip), %eax
	movl	%eax, -16(%rbp)
	leaq	-24(%rbp), %rdi
	callq	mu
	movl	-24(%rbp), %esi
	movl	-20(%rbp), %edx
	movl	-16(%rbp), %ecx
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
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	movl	$0, -12(%rbp)
	movq	$0, -20(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_1
# %bb.2:
	testb	$1, 4(%rdi)
	jne	.LBB1_3
.LBB1_4:
	testb	$1, 8(%rdi)
	je	.LBB1_6
.LBB1_5:
	orb	$1, -20(%rbp)
.LBB1_6:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_7
# %bb.8:
	testb	$1, 4(%rdi)
	jne	.LBB1_9
.LBB1_10:
	testb	$1, 8(%rdi)
	je	.LBB1_12
.LBB1_11:
	orb	$1, -20(%rbp)
.LBB1_12:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_13
# %bb.14:
	testb	$1, 4(%rdi)
	jne	.LBB1_15
.LBB1_16:
	testb	$1, 8(%rdi)
	je	.LBB1_18
.LBB1_17:
	orb	$1, -20(%rbp)
.LBB1_18:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_19
# %bb.20:
	testb	$1, 4(%rdi)
	jne	.LBB1_21
.LBB1_22:
	testb	$1, 8(%rdi)
	je	.LBB1_24
.LBB1_23:
	orb	$1, -20(%rbp)
.LBB1_24:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_25
# %bb.26:
	testb	$1, 4(%rdi)
	jne	.LBB1_27
.LBB1_28:
	testb	$1, 8(%rdi)
	je	.LBB1_30
.LBB1_29:
	orb	$1, -20(%rbp)
.LBB1_30:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_31
# %bb.32:
	testb	$1, 4(%rdi)
	jne	.LBB1_33
.LBB1_34:
	testb	$1, 8(%rdi)
	je	.LBB1_36
.LBB1_35:
	orb	$1, -20(%rbp)
.LBB1_36:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_37
# %bb.38:
	testb	$1, 4(%rdi)
	jne	.LBB1_39
.LBB1_40:
	testb	$1, 8(%rdi)
	je	.LBB1_42
.LBB1_41:
	orb	$1, -20(%rbp)
.LBB1_42:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_43
# %bb.44:
	testb	$1, 4(%rdi)
	jne	.LBB1_45
.LBB1_46:
	testb	$1, 8(%rdi)
	je	.LBB1_48
.LBB1_47:
	orb	$1, -20(%rbp)
.LBB1_48:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_49
# %bb.50:
	testb	$1, 4(%rdi)
	jne	.LBB1_51
.LBB1_52:
	testb	$1, 8(%rdi)
	je	.LBB1_54
.LBB1_53:
	orb	$1, -20(%rbp)
.LBB1_54:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_55
# %bb.56:
	testb	$1, 4(%rdi)
	jne	.LBB1_57
.LBB1_58:
	testb	$1, 8(%rdi)
	je	.LBB1_60
.LBB1_59:
	orb	$1, -20(%rbp)
.LBB1_60:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_61
# %bb.62:
	testb	$1, 4(%rdi)
	jne	.LBB1_63
.LBB1_64:
	testb	$1, 8(%rdi)
	je	.LBB1_66
.LBB1_65:
	orb	$1, -20(%rbp)
.LBB1_66:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_67
# %bb.68:
	testb	$1, 4(%rdi)
	jne	.LBB1_69
.LBB1_70:
	testb	$1, 8(%rdi)
	je	.LBB1_72
.LBB1_71:
	orb	$1, -20(%rbp)
.LBB1_72:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_73
# %bb.74:
	testb	$1, 4(%rdi)
	jne	.LBB1_75
.LBB1_76:
	testb	$1, 8(%rdi)
	je	.LBB1_78
.LBB1_77:
	orb	$1, -20(%rbp)
.LBB1_78:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_79
# %bb.80:
	testb	$1, 4(%rdi)
	jne	.LBB1_81
.LBB1_82:
	testb	$1, 8(%rdi)
	je	.LBB1_84
.LBB1_83:
	orb	$1, -20(%rbp)
.LBB1_84:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_85
# %bb.86:
	testb	$1, 4(%rdi)
	jne	.LBB1_87
.LBB1_88:
	testb	$1, 8(%rdi)
	je	.LBB1_90
.LBB1_89:
	orb	$1, -20(%rbp)
.LBB1_90:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_91
# %bb.92:
	testb	$1, 4(%rdi)
	jne	.LBB1_93
.LBB1_94:
	testb	$1, 8(%rdi)
	je	.LBB1_96
.LBB1_95:
	orb	$1, -20(%rbp)
.LBB1_96:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_97
# %bb.98:
	testb	$1, 4(%rdi)
	jne	.LBB1_99
.LBB1_100:
	testb	$1, 8(%rdi)
	je	.LBB1_102
.LBB1_101:
	orb	$1, -20(%rbp)
.LBB1_102:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_103
# %bb.104:
	testb	$1, 4(%rdi)
	jne	.LBB1_105
.LBB1_106:
	testb	$1, 8(%rdi)
	je	.LBB1_108
.LBB1_107:
	orb	$1, -20(%rbp)
.LBB1_108:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_109
# %bb.110:
	testb	$1, 4(%rdi)
	jne	.LBB1_111
.LBB1_112:
	testb	$1, 8(%rdi)
	je	.LBB1_114
.LBB1_113:
	orb	$1, -20(%rbp)
.LBB1_114:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_115
# %bb.116:
	testb	$1, 4(%rdi)
	jne	.LBB1_117
.LBB1_118:
	testb	$1, 8(%rdi)
	je	.LBB1_120
.LBB1_119:
	orb	$1, -20(%rbp)
.LBB1_120:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_121
# %bb.122:
	testb	$1, 4(%rdi)
	jne	.LBB1_123
.LBB1_124:
	testb	$1, 8(%rdi)
	je	.LBB1_126
.LBB1_125:
	orb	$1, -20(%rbp)
.LBB1_126:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_127
# %bb.128:
	testb	$1, 4(%rdi)
	jne	.LBB1_129
.LBB1_130:
	testb	$1, 8(%rdi)
	je	.LBB1_132
.LBB1_131:
	orb	$1, -20(%rbp)
.LBB1_132:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_133
# %bb.134:
	testb	$1, 4(%rdi)
	jne	.LBB1_135
.LBB1_136:
	testb	$1, 8(%rdi)
	je	.LBB1_138
.LBB1_137:
	orb	$1, -20(%rbp)
.LBB1_138:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_139
# %bb.140:
	testb	$1, 4(%rdi)
	jne	.LBB1_141
.LBB1_142:
	testb	$1, 8(%rdi)
	je	.LBB1_144
.LBB1_143:
	orb	$1, -20(%rbp)
.LBB1_144:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_145
# %bb.146:
	testb	$1, 4(%rdi)
	jne	.LBB1_147
.LBB1_148:
	testb	$1, 8(%rdi)
	je	.LBB1_150
.LBB1_149:
	orb	$1, -20(%rbp)
.LBB1_150:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_151
# %bb.152:
	testb	$1, 4(%rdi)
	jne	.LBB1_153
.LBB1_154:
	testb	$1, 8(%rdi)
	je	.LBB1_156
.LBB1_155:
	orb	$1, -20(%rbp)
.LBB1_156:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_157
# %bb.158:
	testb	$1, 4(%rdi)
	jne	.LBB1_159
.LBB1_160:
	testb	$1, 8(%rdi)
	je	.LBB1_162
.LBB1_161:
	orb	$1, -20(%rbp)
.LBB1_162:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_163
# %bb.164:
	testb	$1, 4(%rdi)
	jne	.LBB1_165
.LBB1_166:
	testb	$1, 8(%rdi)
	je	.LBB1_168
.LBB1_167:
	orb	$1, -20(%rbp)
.LBB1_168:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_169
# %bb.170:
	testb	$1, 4(%rdi)
	jne	.LBB1_171
.LBB1_172:
	testb	$1, 8(%rdi)
	je	.LBB1_174
.LBB1_173:
	orb	$1, -20(%rbp)
.LBB1_174:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_175
# %bb.176:
	testb	$1, 4(%rdi)
	jne	.LBB1_177
.LBB1_178:
	testb	$1, 8(%rdi)
	je	.LBB1_180
.LBB1_179:
	orb	$1, -20(%rbp)
.LBB1_180:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_181
# %bb.182:
	testb	$1, 4(%rdi)
	jne	.LBB1_183
.LBB1_184:
	testb	$1, 8(%rdi)
	je	.LBB1_186
.LBB1_185:
	orb	$1, -20(%rbp)
.LBB1_186:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	shll	-20(%rbp)
	shll	-16(%rbp)
	shll	-12(%rbp)
	testb	$1, (%rdi)
	jne	.LBB1_187
# %bb.188:
	testb	$1, 4(%rdi)
	jne	.LBB1_189
.LBB1_190:
	testb	$1, 8(%rdi)
	je	.LBB1_192
.LBB1_191:
	orb	$1, -20(%rbp)
.LBB1_192:
	sarl	(%rdi)
	sarl	4(%rdi)
	sarl	8(%rdi)
	movl	-20(%rbp), %eax
	movl	%eax, (%rdi)
	movl	-16(%rbp), %eax
	movl	%eax, 4(%rdi)
	movl	-12(%rbp), %eax
	movl	%eax, 8(%rdi)
	movq	%fs:40, %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB1_194
# %bb.193:                              # %SP_return
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB1_1:
	.cfi_def_cfa %rbp, 16
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_4
.LBB1_3:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_5
	jmp	.LBB1_6
.LBB1_7:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_10
.LBB1_9:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_11
	jmp	.LBB1_12
.LBB1_13:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_16
.LBB1_15:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_17
	jmp	.LBB1_18
.LBB1_19:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_22
.LBB1_21:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_23
	jmp	.LBB1_24
.LBB1_25:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_28
.LBB1_27:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_29
	jmp	.LBB1_30
.LBB1_31:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_34
.LBB1_33:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_35
	jmp	.LBB1_36
.LBB1_37:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_40
.LBB1_39:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_41
	jmp	.LBB1_42
.LBB1_43:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_46
.LBB1_45:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_47
	jmp	.LBB1_48
.LBB1_49:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_52
.LBB1_51:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_53
	jmp	.LBB1_54
.LBB1_55:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_58
.LBB1_57:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_59
	jmp	.LBB1_60
.LBB1_61:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_64
.LBB1_63:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_65
	jmp	.LBB1_66
.LBB1_67:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_70
.LBB1_69:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_71
	jmp	.LBB1_72
.LBB1_73:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_76
.LBB1_75:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_77
	jmp	.LBB1_78
.LBB1_79:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_82
.LBB1_81:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_83
	jmp	.LBB1_84
.LBB1_85:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_88
.LBB1_87:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_89
	jmp	.LBB1_90
.LBB1_91:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_94
.LBB1_93:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_95
	jmp	.LBB1_96
.LBB1_97:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_100
.LBB1_99:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_101
	jmp	.LBB1_102
.LBB1_103:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_106
.LBB1_105:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_107
	jmp	.LBB1_108
.LBB1_109:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_112
.LBB1_111:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_113
	jmp	.LBB1_114
.LBB1_115:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_118
.LBB1_117:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_119
	jmp	.LBB1_120
.LBB1_121:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_124
.LBB1_123:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_125
	jmp	.LBB1_126
.LBB1_127:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_130
.LBB1_129:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_131
	jmp	.LBB1_132
.LBB1_133:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_136
.LBB1_135:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_137
	jmp	.LBB1_138
.LBB1_139:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_142
.LBB1_141:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_143
	jmp	.LBB1_144
.LBB1_145:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_148
.LBB1_147:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_149
	jmp	.LBB1_150
.LBB1_151:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_154
.LBB1_153:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_155
	jmp	.LBB1_156
.LBB1_157:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_160
.LBB1_159:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_161
	jmp	.LBB1_162
.LBB1_163:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_166
.LBB1_165:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_167
	jmp	.LBB1_168
.LBB1_169:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_172
.LBB1_171:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_173
	jmp	.LBB1_174
.LBB1_175:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_178
.LBB1_177:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_179
	jmp	.LBB1_180
.LBB1_181:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_184
.LBB1_183:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_185
	jmp	.LBB1_186
.LBB1_187:
	orb	$1, -12(%rbp)
	testb	$1, 4(%rdi)
	je	.LBB1_190
.LBB1_189:
	orb	$1, -16(%rbp)
	testb	$1, 8(%rdi)
	jne	.LBB1_191
	jmp	.LBB1_192
.LBB1_194:                              # %CallStackCheckFailBlk
	callq	__stack_chk_fail
.Lfunc_end1:
	.size	mu, .Lfunc_end1-mu
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

	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.section	".note.GNU-stack","",@progbits

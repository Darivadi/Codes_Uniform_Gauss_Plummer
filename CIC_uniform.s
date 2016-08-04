	.file	"CIC_uniform.c"
	.text
.Ltext0:
	.comm	GV,1096,32
	.comm	part,8,8
	.comm	Header,256,32
	.comm	cells,8,8
	.section	.rodata
	.align 8
.LC0:
	.string	"############################################################"
.LC1:
	.string	"Reading snapshot %s\n"
.LC2:
	.string	"r"
.LC3:
	.string	"File %s cannot be open\n"
	.align 8
.LC4:
	.string	"----------------------------------------"
.LC5:
	.string	"Reading snapshot with:"
	.align 8
.LC6:
	.string	"Type %d has Npart=%12d NpartTotal=%12d with mass %16.8lf\n"
	.align 8
.LC7:
	.string	" There is a total %d particles in the snapshot\n\n"
.LC8:
	.string	" * Frame's Time... %16.8f\n"
.LC9:
	.string	" * Redshift... %16.8f\n"
.LC10:
	.string	" * Flagsfr... %d\n"
.LC11:
	.string	" * Flagfed... %d\n"
.LC12:
	.string	" * Flagcool... %d\n"
.LC13:
	.string	" * numfiles... %d\n"
.LC14:
	.string	" * Boxsize... %16.8f\n"
.LC15:
	.string	" * Omega0... %16.8f\n"
.LC16:
	.string	" * OmageLa... %16.8f\n"
.LC17:
	.string	" * Hubbleparam... %16.8f\n"
	.align 8
.LC18:
	.string	"Structure particles could not be allocated"
	.align 8
.LC19:
	.string	" Can not read properly ids %d %lu\n"
	.text
	.globl	readGADGETBinaryFile
	.type	readGADGETBinaryFile, @function
readGADGETBinaryFile:
.LFB2:
	.file 1 "functions.h"
	.loc 1 12 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	.loc 1 13 0
	movq	$0, -24(%rbp)
	.loc 1 15 0
	movl	$0, -28(%rbp)
	.loc 1 19 0
	movl	$.LC0, %edi
	call	puts
	.loc 1 20 0
	movl	$GV+64, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	.loc 1 21 0
	movl	$.LC2, %esi
	movl	$GV+64, %edi
	call	fopen
	movq	%rax, -24(%rbp)
	.loc 1 22 0
	cmpq	$0, -24(%rbp)
	jne	.L2
	.loc 1 23 0
	movl	$GV+64, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
.L2:
	.loc 1 26 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 27 0
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$256, %esi
	movl	$Header, %edi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 28 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 30 0
	movl	$0, -40(%rbp)
	.loc 1 32 0
	movl	$.LC4, %edi
	call	puts
	.loc 1 33 0
	movl	$.LC5, %edi
	call	puts
	.loc 1 34 0
	movl	$.LC4, %edi
	call	puts
	.loc 1 35 0
	movl	$0, -48(%rbp)
	jmp	.L3
.L4:
	.loc 1 36 0 discriminator 2
	movl	-48(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	addl	%eax, -40(%rbp)
	.loc 1 37 0 discriminator 2
	movl	-48(%rbp), %eax
	cltq
	addq	$2, %rax
	movq	Header+8(,%rax,8), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	addq	$24, %rdx
	movl	Header(,%rdx,4), %ecx
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	movl	Header(,%rdx,4), %edx
	movl	-48(%rbp), %esi
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC6, %edi
	movl	$1, %eax
	call	printf
	.loc 1 35 0 discriminator 2
	addl	$1, -48(%rbp)
.L3:
	.loc 1 35 0 is_stmt 0 discriminator 1
	cmpl	$5, -48(%rbp)
	jle	.L4
	.loc 1 41 0 is_stmt 1
	movl	-40(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	.loc 1 42 0
	movl	$.LC4, %edi
	call	puts
	.loc 1 43 0
	movq	Header+72(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC8, %edi
	movl	$1, %eax
	call	printf
	.loc 1 44 0
	movq	Header+80(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC9, %edi
	movl	$1, %eax
	call	printf
	.loc 1 45 0
	movl	Header+88(%rip), %eax
	movl	%eax, %esi
	movl	$.LC10, %edi
	movl	$0, %eax
	call	printf
	.loc 1 46 0
	movl	Header+92(%rip), %eax
	movl	%eax, %esi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	.loc 1 47 0
	movl	Header+120(%rip), %eax
	movl	%eax, %esi
	movl	$.LC12, %edi
	movl	$0, %eax
	call	printf
	.loc 1 48 0
	movl	Header+124(%rip), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	.loc 1 49 0
	movq	Header+128(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC14, %edi
	movl	$1, %eax
	call	printf
	.loc 1 50 0
	movq	Header+136(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC15, %edi
	movl	$1, %eax
	call	printf
	.loc 1 51 0
	movq	Header+144(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC16, %edi
	movl	$1, %eax
	call	printf
	.loc 1 52 0
	movq	Header+152(%rip), %rax
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	movl	$.LC17, %edi
	movl	$1, %eax
	call	printf
	.loc 1 55 0
	movl	-40(%rbp), %eax
	cltq
	movl	$64, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, part(%rip)
	.loc 1 57 0
	movq	part(%rip), %rax
	testq	%rax, %rax
	jne	.L5
	.loc 1 58 0
	movl	$.LC18, %edi
	call	puts
	.loc 1 59 0
	movl	$0, %edi
	call	exit
.L5:
	.loc 1 65 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 66 0
	movl	$0, -48(%rbp)
	jmp	.L6
.L7:
	.loc 1 67 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 68 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-16(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 8(%rax)
	.loc 1 69 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-12(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 16(%rax)
	.loc 1 70 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-8(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 24(%rax)
	.loc 1 66 0 discriminator 2
	addl	$1, -48(%rbp)
.L6:
	.loc 1 66 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L7
	.loc 1 72 0 is_stmt 1
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 73 0
	movl	-60(%rbp), %eax
	movslq	%eax, %rcx
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	cmpq	%rax, %rcx
	je	.L8
	.loc 1 74 0
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC19, %edi
	movl	$0, %eax
	call	printf
	.loc 1 75 0
	movl	$0, %edi
	call	exit
.L8:
	.loc 1 81 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 82 0
	movl	$0, -48(%rbp)
	jmp	.L9
.L10:
	.loc 1 83 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 84 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-16(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 32(%rax)
	.loc 1 85 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-12(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 40(%rax)
	.loc 1 86 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-8(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 48(%rax)
	.loc 1 82 0 discriminator 2
	addl	$1, -48(%rbp)
.L9:
	.loc 1 82 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L10
	.loc 1 88 0 is_stmt 1
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 89 0
	movl	-60(%rbp), %eax
	movslq	%eax, %rcx
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	cmpq	%rax, %rcx
	je	.L11
	.loc 1 90 0
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC19, %edi
	movl	$0, %eax
	call	printf
	.loc 1 91 0
	movl	$0, %edi
	call	exit
.L11:
	.loc 1 97 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 98 0
	movl	$0, -48(%rbp)
	jmp	.L12
.L13:
	.loc 1 99 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-52(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 100 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movl	-52(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 98 0 discriminator 2
	addl	$1, -48(%rbp)
.L12:
	.loc 1 98 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L13
	.loc 1 103 0 is_stmt 1
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 104 0
	movl	-60(%rbp), %eax
	cltq
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	cmpq	%rdx, %rax
	je	.L14
	.loc 1 105 0
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC19, %edi
	movl	$0, %eax
	call	printf
	.loc 1 106 0
	movl	$0, %edi
	call	exit
.L14:
	.loc 1 112 0
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 113 0
	movl	$0, -32(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 114 0
	movl	$0, -44(%rbp)
	jmp	.L15
.L24:
	.loc 1 115 0
	movl	-44(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	addl	%eax, -32(%rbp)
	.loc 1 116 0
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	movsd	Header+8(,%rax,8), %xmm0
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L16
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jne	.L16
	.loc 1 116 0 is_stmt 0 discriminator 1
	movl	-44(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	testl	%eax, %eax
	je	.L16
	.loc 1 117 0 is_stmt 1
	movl	-36(%rbp), %eax
	movl	%eax, -48(%rbp)
	jmp	.L18
.L19:
	.loc 1 118 0 discriminator 2
	movq	-24(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 119 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movss	-56(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, 56(%rax)
	.loc 1 117 0 discriminator 2
	addl	$1, -48(%rbp)
.L18:
	.loc 1 117 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L19
.L16:
	.loc 1 122 0 is_stmt 1
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	movsd	Header+8(,%rax,8), %xmm0
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L27
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	je	.L20
.L27:
	.loc 1 122 0 is_stmt 0 discriminator 1
	movl	-44(%rbp), %eax
	cltq
	addq	$24, %rax
	movl	Header(,%rax,4), %eax
	testl	%eax, %eax
	je	.L20
	.loc 1 123 0 is_stmt 1
	movl	-36(%rbp), %eax
	movl	%eax, -48(%rbp)
	jmp	.L22
.L23:
	.loc 1 124 0 discriminator 2
	movq	part(%rip), %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	movq	Header+8(,%rax,8), %rax
	movq	%rax, 56(%rdx)
	.loc 1 123 0 discriminator 2
	addl	$1, -48(%rbp)
.L22:
	.loc 1 123 0 is_stmt 0 discriminator 1
	movl	-48(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L23
.L20:
	.loc 1 127 0 is_stmt 1
	movl	-32(%rbp), %eax
	movl	%eax, -36(%rbp)
	.loc 1 114 0
	addl	$1, -44(%rbp)
.L15:
	.loc 1 114 0 is_stmt 0 discriminator 1
	cmpl	$5, -44(%rbp)
	jle	.L24
	.loc 1 129 0 is_stmt 1
	movq	-24(%rbp), %rdx
	leaq	-60(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -28(%rbp)
	.loc 1 130 0
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 1 131 0
	movl	-40(%rbp), %eax
	.loc 1 132 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	readGADGETBinaryFile, .-readGADGETBinaryFile
	.globl	W
	.type	W, @function
W:
.LFB3:
	.loc 1 149 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movsd	%xmm0, -40(%rbp)
	movsd	%xmm1, -48(%rbp)
	movsd	%xmm2, -56(%rbp)
	movsd	%xmm3, -64(%rbp)
	.loc 1 183 0
	movsd	-40(%rbp), %xmm1
	movsd	.LC21(%rip), %xmm0
	andpd	%xmm1, %xmm0
	movsd	-64(%rbp), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L42
	.loc 1 184 0
	movsd	-40(%rbp), %xmm1
	movsd	.LC21(%rip), %xmm0
	andpd	%xmm1, %xmm0
	divsd	-64(%rbp), %xmm0
	movsd	.LC22(%rip), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	jmp	.L31
.L42:
	.loc 1 186 0
	movl	$0, %eax
	movq	%rax, -24(%rbp)
.L31:
	.loc 1 189 0
	movsd	-48(%rbp), %xmm1
	movsd	.LC21(%rip), %xmm0
	andpd	%xmm1, %xmm0
	movsd	-64(%rbp), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L43
	.loc 1 190 0
	movsd	-48(%rbp), %xmm1
	movsd	.LC21(%rip), %xmm0
	andpd	%xmm1, %xmm0
	divsd	-64(%rbp), %xmm0
	movsd	.LC22(%rip), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	jmp	.L34
.L43:
	.loc 1 192 0
	movl	$0, %eax
	movq	%rax, -16(%rbp)
.L34:
	.loc 1 195 0
	movsd	-56(%rbp), %xmm1
	movsd	.LC21(%rip), %xmm0
	andpd	%xmm1, %xmm0
	movsd	-64(%rbp), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L44
	.loc 1 196 0
	movsd	-56(%rbp), %xmm1
	movsd	.LC21(%rip), %xmm0
	andpd	%xmm1, %xmm0
	divsd	-64(%rbp), %xmm0
	movsd	.LC22(%rip), %xmm1
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L37
.L44:
	.loc 1 198 0
	movl	$0, %eax
	movq	%rax, -8(%rbp)
.L37:
	.loc 1 231 0
	movsd	-24(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0
	mulsd	-8(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	movq	-72(%rbp), %rax
	.loc 1 237 0
	movq	%rax, -72(%rbp)
	movsd	-72(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	W, .-W
	.globl	locateCell
	.type	locateCell, @function
locateCell:
.LFB4:
	.loc 1 252 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movsd	%xmm0, -40(%rbp)
	movsd	%xmm1, -48(%rbp)
	movsd	%xmm2, -56(%rbp)
	movl	%edi, -60(%rbp)
	movq	%rsi, -72(%rbp)
	.loc 1 259 0
	movsd	GV+8(%rip), %xmm1
	movsd	-40(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movl	GV(%rip), %eax
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	call	floor
	cvttsd2si	%xmm0, %eax
	movl	%eax, -32(%rbp)
	.loc 1 261 0
	movsd	GV+8(%rip), %xmm1
	movsd	-48(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movl	GV(%rip), %eax
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	call	floor
	cvttsd2si	%xmm0, %eax
	movl	%eax, -28(%rbp)
	.loc 1 263 0
	movsd	GV+8(%rip), %xmm1
	movsd	-56(%rbp), %xmm0
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movl	GV(%rip), %eax
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	call	floor
	cvttsd2si	%xmm0, %eax
	movl	%eax, -24(%rbp)
	.loc 1 265 0
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	-32(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	imull	%eax, %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -20(%rbp)
	.loc 1 268 0
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, (%rcx)
	.loc 1 269 0
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	8(%rax), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	realloc
	movq	%rax, 8(%rbx)
	.loc 1 270 0
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movq	8(%rax), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	subq	$8, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-60(%rbp), %eax
	cltq
	movq	%rax, (%rdx)
	.loc 1 271 0
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	locateCell, .-locateCell
	.globl	mod
	.type	mod, @function
mod:
.LFB5:
	.loc 1 285 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	.loc 1 286 0
	movl	-20(%rbp), %eax
	cltd
	idivl	-24(%rbp)
	movl	%edx, -4(%rbp)
	.loc 1 287 0
	jmp	.L47
.L48:
	.loc 1 288 0
	movl	-24(%rbp), %eax
	addl	%eax, -4(%rbp)
.L47:
	.loc 1 287 0 discriminator 1
	cmpl	$0, -4(%rbp)
	js	.L48
	.loc 1 290 0
	movl	-4(%rbp), %eax
	.loc 1 291 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	mod, .-mod
	.section	.rodata
	.align 8
.LC23:
	.string	"grep -v \"#\" %s | grep -v \"^$\" | gawk -F\"=\" '{print $2}' > %s.dump"
	.text
	.globl	conf2dump
	.type	conf2dump, @function
conf2dump:
.LFB6:
	.file 2 "readWrite.h"
	.loc 2 10 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -136(%rbp)
	.loc 2 10 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 2 12 0
	movq	-136(%rbp), %rcx
	movq	-136(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movl	$.LC23, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 2 15 0
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	system
	.loc 2 17 0
	movl	$0, %eax
	.loc 2 18 0
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L52
	call	__stack_chk_fail
.L52:
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	conf2dump, .-conf2dump
	.section	.rodata
	.align 8
.LC24:
	.string	"  * The file '%s' doesn't exist!\n"
.LC25:
	.string	"%s.dump"
.LC26:
	.string	"%d"
.LC27:
	.string	"%s"
	.align 8
.LC28:
	.string	"  * The file '%s' has been loaded!\n"
.LC29:
	.string	"rm -rf %s.dump"
	.text
	.globl	read_parameters
	.type	read_parameters, @function
read_parameters:
.LFB7:
	.loc 2 29 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movq	%rdi, -248(%rbp)
	.loc 2 29 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 2 31 0
	movl	$0, -236(%rbp)
	.loc 2 35 0
	movq	-248(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -232(%rbp)
	.loc 2 36 0
	cmpq	$0, -232(%rbp)
	jne	.L54
	.loc 2 37 0
	movq	-248(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC24, %edi
	movl	$0, %eax
	call	printf
	.loc 2 38 0
	movl	$1, %eax
	jmp	.L56
.L54:
	.loc 2 39 0
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 2 42 0
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	conf2dump
	.loc 2 43 0
	movq	-248(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movl	$.LC25, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 2 44 0
	leaq	-112(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -232(%rbp)
	.loc 2 52 0
	movq	-232(%rbp), %rax
	movl	$GV, %edx
	movl	$.LC26, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf
	.loc 2 53 0
	movq	-232(%rbp), %rax
	movl	$GV+64, %edx
	movl	$.LC27, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf
	.loc 2 55 0
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 2 57 0
	movq	-248(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC28, %edi
	movl	$0, %eax
	call	printf
	.loc 2 59 0
	movq	-248(%rbp), %rdx
	leaq	-224(%rbp), %rax
	movl	$.LC29, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 2 60 0
	leaq	-224(%rbp), %rax
	movq	%rax, %rdi
	call	system
	.loc 2 62 0
	movl	$0, %eax
.L56:
	.loc 2 63 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L57
	call	__stack_chk_fail
.L57:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	read_parameters, .-read_parameters
	.section	.rodata
.LC30:
	.string	"w"
	.align 8
.LC31:
	.string	"./../../Processed_data/CIC_DenCon_uniform_256.bin"
.LC32:
	.string	"Ntotalgrid=%15d\n"
	.text
	.globl	write_binary
	.type	write_binary, @function
write_binary:
.LFB8:
	.loc 2 67 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	.loc 2 71 0
	movq	$0, -72(%rbp)
	.loc 2 73 0
	movl	$.LC30, %esi
	movl	$.LC31, %edi
	call	fopen
	movq	%rax, -72(%rbp)
	.loc 2 76 0
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+8, %edi
	call	fwrite
	.loc 2 77 0
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+1064, %edi
	call	fwrite
	.loc 2 78 0
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+1072, %edi
	call	fwrite
	.loc 2 79 0
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+1080, %edi
	call	fwrite
	.loc 2 80 0
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	movl	$GV+1088, %edi
	call	fwrite
	.loc 2 82 0
	movl	GV+24(%rip), %eax
	movl	%eax, %esi
	movl	$.LC32, %edi
	movl	$0, %eax
	call	printf
	.loc 2 84 0
	movl	$0, -76(%rbp)
	jmp	.L59
.L60:
	.loc 2 87 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	56(%rax), %rax
	movq	%rax, -64(%rbp)
	.loc 2 88 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	64(%rax), %rax
	movq	%rax, -56(%rbp)
	.loc 2 89 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	72(%rax), %rax
	movq	%rax, -48(%rbp)
	.loc 2 91 0 discriminator 2
	movq	-72(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$8, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 2 94 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rax
	movq	%rax, -32(%rbp)
	.loc 2 95 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	24(%rax), %rax
	movq	%rax, -24(%rbp)
	.loc 2 96 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	32(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 2 98 0 discriminator 2
	movq	-72(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$3, %edx
	movl	$8, %esi
	movq	%rax, %rdi
	call	fwrite
	.loc 2 101 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	leaq	40(%rax), %rdi
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$8, %esi
	call	fwrite
	.loc 2 84 0 discriminator 2
	addl	$1, -76(%rbp)
.L59:
	.loc 2 84 0 is_stmt 0 discriminator 1
	movl	GV+24(%rip), %eax
	cmpl	-76(%rbp), %eax
	jg	.L60
	.loc 2 104 0 is_stmt 1
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 2 105 0
	movl	$0, %eax
	.loc 2 106 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	write_binary, .-write_binary
	.section	.rodata
.LC33:
	.string	"./parameters_file.dat"
.LC38:
	.string	"Simulation parameters:"
	.align 8
.LC39:
	.string	"NGRID=%d NGRID3=%d Particle_Mass=%lf NpTotal=%lf rhoMean=%lf L=%lf volCell=%lf dx=%lf Filename=%s\n"
	.align 8
.LC40:
	.string	"-----------------------------------------------"
.LC41:
	.string	"Particles located in the grid"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.file 3 "CIC_uniform.c"
	.loc 3 21 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$160, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	.loc 3 26 0
	movl	$0, -132(%rbp)
	.loc 3 30 0
	movl	$0, %eax
	movq	%rax, -112(%rbp)
	.loc 3 37 0
	movl	$.LC33, %edi
	call	read_parameters
	.loc 3 38 0
	movabsq	$4711630319722168320, %rax
	movq	%rax, GV+16(%rip)
	.loc 3 41 0
	movabsq	$4645744490609377280, %rax
	movq	%rax, GV+8(%rip)
	.loc 3 42 0
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	%eax, %edx
	movl	GV(%rip), %eax
	imull	%edx, %eax
	movl	%eax, GV+24(%rip)
	.loc 3 43 0
	movabsq	$4607182418800017408, %rax
	movq	%rax, GV+40(%rip)
	.loc 3 44 0
	movsd	GV+40(%rip), %xmm1
	movsd	GV+16(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, -168(%rbp)
	movq	GV+8(%rip), %rax
	movabsq	$4613937818241073152, %rdx
	movq	%rdx, -176(%rbp)
	movsd	-176(%rbp), %xmm1
	movq	%rax, -176(%rbp)
	movsd	-176(%rbp), %xmm0
	call	pow
	movsd	-168(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, GV+32(%rip)
	.loc 3 45 0
	movsd	GV+8(%rip), %xmm1
	movl	GV(%rip), %eax
	cvtsi2sd	%eax, %xmm0
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, GV+56(%rip)
	.loc 3 46 0
	movsd	GV+56(%rip), %xmm1
	movsd	GV+56(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	GV+56(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, GV+48(%rip)
	.loc 3 48 0
	movsd	GV+16(%rip), %xmm0
	ucomisd	.LC37(%rip), %xmm0
	jnb	.L63
	cvttsd2siq	%xmm0, %rax
	jmp	.L64
.L63:
	movsd	.LC37(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movabsq	$-9223372036854775808, %rdx
	xorq	%rdx, %rax
.L64:
	movl	$64, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, part(%rip)
	.loc 3 50 0
	movl	$0, -160(%rbp)
	jmp	.L65
.L66:
	.loc 3 51 0 discriminator 2
	movq	part(%rip), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	leaq	(%rax,%rdx), %rbx
	call	drand48
	movsd	GV+8(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rbx)
	.loc 3 52 0 discriminator 2
	movq	part(%rip), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	leaq	(%rax,%rdx), %rbx
	call	drand48
	movsd	GV+8(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 16(%rbx)
	.loc 3 53 0 discriminator 2
	movq	part(%rip), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	leaq	(%rax,%rdx), %rbx
	call	drand48
	movsd	GV+8(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, 24(%rbx)
	.loc 3 55 0 discriminator 2
	movq	part(%rip), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 32(%rdx)
	.loc 3 56 0 discriminator 2
	movq	part(%rip), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 40(%rdx)
	.loc 3 57 0 discriminator 2
	movq	part(%rip), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, 48(%rdx)
	.loc 3 59 0 discriminator 2
	movq	part(%rip), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movl	-160(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 3 61 0 discriminator 2
	movq	part(%rip), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rax, %rdx
	movabsq	$4607182418800017408, %rax
	movq	%rax, 56(%rdx)
	.loc 3 50 0 discriminator 2
	addl	$1, -160(%rbp)
.L65:
	.loc 3 50 0 is_stmt 0 discriminator 1
	cvtsi2sd	-160(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L66
	.loc 3 83 0 is_stmt 1
	movl	$.LC38, %edi
	call	puts
	.loc 3 84 0
	movq	GV+56(%rip), %r9
	movq	GV+48(%rip), %r8
	movq	GV+8(%rip), %rdi
	movq	GV+32(%rip), %rsi
	movq	GV+16(%rip), %rdx
	movq	GV+40(%rip), %rax
	movl	GV+24(%rip), %r11d
	movl	GV(%rip), %r10d
	movl	$GV+64, %ecx
	movq	%r9, -168(%rbp)
	movsd	-168(%rbp), %xmm5
	movq	%r8, -168(%rbp)
	movsd	-168(%rbp), %xmm4
	movq	%rdi, -168(%rbp)
	movsd	-168(%rbp), %xmm3
	movq	%rsi, -168(%rbp)
	movsd	-168(%rbp), %xmm2
	movq	%rdx, -168(%rbp)
	movsd	-168(%rbp), %xmm1
	movq	%rax, -168(%rbp)
	movsd	-168(%rbp), %xmm0
	movl	%r11d, %edx
	movl	%r10d, %esi
	movl	$.LC39, %edi
	movl	$6, %eax
	call	printf
	.loc 3 94 0
	movl	$.LC40, %edi
	call	puts
	.loc 3 102 0
	movl	GV+24(%rip), %eax
	cltq
	movl	$80, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, cells(%rip)
	.loc 3 105 0
	movl	$0, -160(%rbp)
	jmp	.L67
.L68:
	.loc 3 106 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-160(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	$0, (%rax)
	.loc 3 107 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-160(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movl	$0, %eax
	movq	%rax, 40(%rdx)
	.loc 3 108 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-160(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movl	$0, %eax
	movq	%rax, 48(%rdx)
	.loc 3 109 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-160(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movl	$0, %eax
	movq	%rax, 16(%rdx)
	.loc 3 110 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-160(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movl	$0, %eax
	movq	%rax, 24(%rdx)
	.loc 3 111 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-160(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movl	$0, %eax
	movq	%rax, 32(%rdx)
	.loc 3 105 0 discriminator 2
	addl	$1, -160(%rbp)
.L67:
	.loc 3 105 0 is_stmt 0 discriminator 1
	movl	GV+24(%rip), %eax
	cmpl	-160(%rbp), %eax
	jg	.L68
	.loc 3 115 0 is_stmt 1
	movl	$0, -160(%rbp)
	jmp	.L69
.L70:
	.loc 3 116 0 discriminator 2
	movq	cells(%rip), %rsi
	movq	part(%rip), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	24(%rax), %rcx
	movq	part(%rip), %rax
	movl	-160(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	16(%rax), %rdx
	movq	part(%rip), %rax
	movl	-160(%rbp), %edi
	movslq	%edi, %rdi
	salq	$6, %rdi
	addq	%rdi, %rax
	movq	8(%rax), %rax
	movl	-160(%rbp), %edi
	movq	%rcx, -168(%rbp)
	movsd	-168(%rbp), %xmm2
	movq	%rdx, -168(%rbp)
	movsd	-168(%rbp), %xmm1
	movq	%rax, -168(%rbp)
	movsd	-168(%rbp), %xmm0
	call	locateCell
	.loc 3 115 0 discriminator 2
	addl	$1, -160(%rbp)
.L69:
	.loc 3 115 0 is_stmt 0 discriminator 1
	cvtsi2sd	-160(%rbp), %xmm0
	movsd	GV+16(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L70
	.loc 3 119 0 is_stmt 1
	movl	$.LC41, %edi
	call	puts
	.loc 3 120 0
	movl	$.LC40, %edi
	call	puts
	.loc 3 123 0
	movl	$0, -160(%rbp)
	jmp	.L71
.L86:
	.loc 3 124 0
	movl	$0, -156(%rbp)
	jmp	.L72
.L85:
	.loc 3 125 0
	movl	$0, -152(%rbp)
	jmp	.L73
.L84:
	.loc 3 128 0
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	-160(%rbp), %eax
	movl	%eax, %ecx
	movl	-156(%rbp), %eax
	addl	%ecx, %eax
	imull	%eax, %edx
	movl	-152(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -128(%rbp)
	.loc 3 131 0
	movsd	GV+56(%rip), %xmm1
	cvtsi2sd	-160(%rbp), %xmm0
	movsd	.LC42(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -104(%rbp)
	.loc 3 132 0
	movsd	GV+56(%rip), %xmm1
	cvtsi2sd	-156(%rbp), %xmm0
	movsd	.LC42(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	.loc 3 133 0
	movsd	GV+56(%rip), %xmm1
	cvtsi2sd	-152(%rbp), %xmm0
	movsd	.LC42(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc 3 136 0
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, -124(%rbp)
	.loc 3 137 0
	cmpl	$0, -124(%rbp)
	jne	.L74
	.loc 3 138 0
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movl	$0, %eax
	movq	%rax, 16(%rdx)
	.loc 3 139 0
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movl	$0, %eax
	movq	%rax, 24(%rdx)
	.loc 3 140 0
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movl	$0, %eax
	movq	%rax, 32(%rdx)
	.loc 3 141 0
	jmp	.L75
.L74:
	.loc 3 144 0
	movl	$0, -148(%rbp)
	jmp	.L76
.L83:
	.loc 3 146 0
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rax
	movl	-148(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	%eax, -120(%rbp)
	.loc 3 149 0
	movq	part(%rip), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	8(%rax), %rax
	movq	%rax, -80(%rbp)
	.loc 3 150 0
	movq	part(%rip), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	16(%rax), %rax
	movq	%rax, -72(%rbp)
	.loc 3 151 0
	movq	part(%rip), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	24(%rax), %rax
	movq	%rax, -64(%rbp)
	.loc 3 154 0
	movq	part(%rip), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	32(%rax), %rax
	movq	%rax, -56(%rbp)
	.loc 3 155 0
	movq	part(%rip), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	40(%rax), %rax
	movq	%rax, -48(%rbp)
	.loc 3 156 0
	movq	part(%rip), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	movq	48(%rax), %rax
	movq	%rax, -40(%rbp)
	.loc 3 164 0
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	cells(%rip), %rsi
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movsd	16(%rax), %xmm0
	addsd	-56(%rbp), %xmm0
	movsd	%xmm0, 16(%rcx)
	.loc 3 165 0
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	cells(%rip), %rsi
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movsd	24(%rax), %xmm0
	addsd	-48(%rbp), %xmm0
	movsd	%xmm0, 24(%rcx)
	.loc 3 166 0
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	cells(%rip), %rsi
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movsd	32(%rax), %xmm0
	addsd	-40(%rbp), %xmm0
	movsd	%xmm0, 32(%rcx)
	.loc 3 169 0
	movl	$-1, -144(%rbp)
	jmp	.L77
.L82:
	.loc 3 170 0
	movl	$-1, -140(%rbp)
	jmp	.L78
.L81:
	.loc 3 171 0
	movl	$-1, -136(%rbp)
	jmp	.L79
.L80:
	.loc 3 172 0 discriminator 2
	movl	GV(%rip), %eax
	movl	-136(%rbp), %edx
	movl	-152(%rbp), %ecx
	addl	%ecx, %edx
	movl	%eax, %esi
	movl	%edx, %edi
	call	mod
	movl	%eax, %ebx
	movl	GV(%rip), %r13d
	movl	GV(%rip), %eax
	movl	-140(%rbp), %edx
	movl	-156(%rbp), %ecx
	addl	%ecx, %edx
	movl	%eax, %esi
	movl	%edx, %edi
	call	mod
	movl	%eax, %r12d
	movl	GV(%rip), %r14d
	movl	GV(%rip), %eax
	movl	-144(%rbp), %edx
	movl	-160(%rbp), %ecx
	addl	%ecx, %edx
	movl	%eax, %esi
	movl	%edx, %edi
	call	mod
	imull	%r14d, %eax
	addl	%r12d, %eax
	imull	%r13d, %eax
	addl	%ebx, %eax
	movl	%eax, -116(%rbp)
	.loc 3 173 0 discriminator 2
	movsd	GV+56(%rip), %xmm2
	cvtsi2sd	-160(%rbp), %xmm0
	movsd	.LC42(%rip), %xmm1
	addsd	%xmm0, %xmm1
	cvtsi2sd	-144(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, -104(%rbp)
	.loc 3 174 0 discriminator 2
	movsd	GV+56(%rip), %xmm2
	cvtsi2sd	-156(%rbp), %xmm0
	movsd	.LC42(%rip), %xmm1
	addsd	%xmm0, %xmm1
	cvtsi2sd	-140(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, -96(%rbp)
	.loc 3 175 0 discriminator 2
	movsd	GV+56(%rip), %xmm2
	cvtsi2sd	-152(%rbp), %xmm0
	movsd	.LC42(%rip), %xmm1
	addsd	%xmm0, %xmm1
	cvtsi2sd	-136(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc 3 176 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-116(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rbx
	movq	cells(%rip), %rcx
	movl	-116(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rcx, %rax
	movsd	48(%rax), %xmm6
	movsd	%xmm6, -168(%rbp)
	movsd	GV+40(%rip), %xmm7
	movsd	%xmm7, -176(%rbp)
	movq	GV+56(%rip), %rax
	movsd	-88(%rbp), %xmm0
	movapd	%xmm0, %xmm2
	subsd	-64(%rbp), %xmm2
	movsd	-96(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	subsd	-72(%rbp), %xmm1
	movsd	-104(%rbp), %xmm0
	subsd	-80(%rbp), %xmm0
	movq	%rax, -184(%rbp)
	movsd	-184(%rbp), %xmm3
	call	W
	mulsd	-176(%rbp), %xmm0
	addsd	-168(%rbp), %xmm0
	movsd	%xmm0, 48(%rbx)
	.loc 3 171 0 discriminator 2
	addl	$1, -136(%rbp)
.L79:
	.loc 3 171 0 is_stmt 0 discriminator 1
	cmpl	$1, -136(%rbp)
	jle	.L80
	.loc 3 170 0 is_stmt 1
	addl	$1, -140(%rbp)
.L78:
	.loc 3 170 0 is_stmt 0 discriminator 1
	cmpl	$1, -140(%rbp)
	jle	.L81
	.loc 3 169 0 is_stmt 1
	addl	$1, -144(%rbp)
.L77:
	.loc 3 169 0 is_stmt 0 discriminator 1
	cmpl	$1, -144(%rbp)
	jle	.L82
	.loc 3 144 0 is_stmt 1
	addl	$1, -148(%rbp)
.L76:
	.loc 3 144 0 is_stmt 0 discriminator 1
	movl	-148(%rbp), %eax
	cmpl	-124(%rbp), %eax
	jl	.L83
	.loc 3 189 0 is_stmt 1
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	cells(%rip), %rsi
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movsd	16(%rax), %xmm1
	cvtsi2sd	-124(%rbp), %xmm0
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, 16(%rcx)
	.loc 3 190 0
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	cells(%rip), %rsi
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movsd	24(%rax), %xmm1
	cvtsi2sd	-124(%rbp), %xmm0
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, 24(%rcx)
	.loc 3 191 0
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	cells(%rip), %rsi
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movsd	32(%rax), %xmm1
	cvtsi2sd	-124(%rbp), %xmm0
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, 32(%rcx)
.L75:
	.loc 3 125 0
	addl	$1, -152(%rbp)
.L73:
	.loc 3 125 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-152(%rbp), %eax
	jg	.L84
	.loc 3 124 0 is_stmt 1
	addl	$1, -156(%rbp)
.L72:
	.loc 3 124 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-156(%rbp), %eax
	jg	.L85
	.loc 3 123 0 is_stmt 1
	addl	$1, -160(%rbp)
.L71:
	.loc 3 123 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-160(%rbp), %eax
	jg	.L86
	.loc 3 206 0 is_stmt 1
	movl	$0, -160(%rbp)
	jmp	.L87
.L92:
	.loc 3 207 0
	movl	$0, -156(%rbp)
	jmp	.L88
.L91:
	.loc 3 208 0
	movl	$0, -152(%rbp)
	jmp	.L89
.L90:
	.loc 3 209 0 discriminator 2
	movl	GV(%rip), %edx
	movl	GV(%rip), %eax
	imull	-160(%rbp), %eax
	movl	%eax, %ecx
	movl	-156(%rbp), %eax
	addl	%ecx, %eax
	imull	%eax, %edx
	movl	-152(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -128(%rbp)
	.loc 3 211 0 discriminator 2
	movsd	GV+56(%rip), %xmm1
	cvtsi2sd	-160(%rbp), %xmm0
	movsd	.LC42(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -104(%rbp)
	.loc 3 212 0 discriminator 2
	movsd	GV+56(%rip), %xmm1
	cvtsi2sd	-156(%rbp), %xmm0
	movsd	.LC42(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)
	.loc 3 213 0 discriminator 2
	movsd	GV+56(%rip), %xmm1
	cvtsi2sd	-152(%rbp), %xmm0
	movsd	.LC42(%rip), %xmm2
	addsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	.loc 3 215 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movq	-104(%rbp), %rax
	movq	%rax, 56(%rdx)
	.loc 3 216 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movq	-96(%rbp), %rax
	movq	%rax, 64(%rdx)
	.loc 3 217 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	leaq	(%rcx,%rax), %rdx
	movq	-88(%rbp), %rax
	movq	%rax, 72(%rdx)
	.loc 3 219 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	cells(%rip), %rsi
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movsd	48(%rax), %xmm0
	movsd	GV+48(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, 48(%rcx)
	.loc 3 221 0 discriminator 2
	movq	cells(%rip), %rcx
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rax, %rcx
	movq	cells(%rip), %rsi
	movl	-128(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	%rsi, %rax
	movsd	48(%rax), %xmm0
	movsd	GV+32(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	.LC22(%rip), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, 40(%rcx)
	.loc 3 208 0 discriminator 2
	addl	$1, -152(%rbp)
.L89:
	.loc 3 208 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-152(%rbp), %eax
	jg	.L90
	.loc 3 207 0 is_stmt 1
	addl	$1, -156(%rbp)
.L88:
	.loc 3 207 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-156(%rbp), %eax
	jg	.L91
	.loc 3 206 0 is_stmt 1
	addl	$1, -160(%rbp)
.L87:
	.loc 3 206 0 is_stmt 0 discriminator 1
	movl	GV(%rip), %eax
	cmpl	-160(%rbp), %eax
	jg	.L92
	.loc 3 235 0 is_stmt 1
	call	write_binary
	.loc 3 239 0
	movq	part(%rip), %rax
	movq	%rax, %rdi
	call	free
	.loc 3 240 0
	movq	cells(%rip), %rax
	movq	%rax, %rdi
	call	free
	.loc 3 242 0
	movl	$0, %eax
	.loc 3 243 0
	addq	$160, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.section	.rodata
	.align 16
.LC21:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC22:
	.long	0
	.long	1072693248
	.align 8
.LC37:
	.long	0
	.long	1138753536
	.align 8
.LC42:
	.long	0
	.long	1071644672
	.text
.Letext0:
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/libio.h"
	.file 8 "structures.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xa99
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF119
	.byte	0x1
	.long	.LASF120
	.long	.LASF121
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x4
	.byte	0xd4
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x5
	.byte	0x83
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x5
	.byte	0x84
	.long	0x69
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x6
	.byte	0x30
	.long	0xa7
	.uleb128 0x7
	.long	.LASF42
	.byte	0xd8
	.byte	0x7
	.byte	0xf5
	.long	0x227
	.uleb128 0x8
	.long	.LASF13
	.byte	0x7
	.byte	0xf6
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x7
	.byte	0xfb
	.long	0x8f
	.byte	0x8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x7
	.byte	0xfc
	.long	0x8f
	.byte	0x10
	.uleb128 0x8
	.long	.LASF16
	.byte	0x7
	.byte	0xfd
	.long	0x8f
	.byte	0x18
	.uleb128 0x8
	.long	.LASF17
	.byte	0x7
	.byte	0xfe
	.long	0x8f
	.byte	0x20
	.uleb128 0x8
	.long	.LASF18
	.byte	0x7
	.byte	0xff
	.long	0x8f
	.byte	0x28
	.uleb128 0x9
	.long	.LASF19
	.byte	0x7
	.value	0x100
	.long	0x8f
	.byte	0x30
	.uleb128 0x9
	.long	.LASF20
	.byte	0x7
	.value	0x101
	.long	0x8f
	.byte	0x38
	.uleb128 0x9
	.long	.LASF21
	.byte	0x7
	.value	0x102
	.long	0x8f
	.byte	0x40
	.uleb128 0x9
	.long	.LASF22
	.byte	0x7
	.value	0x104
	.long	0x8f
	.byte	0x48
	.uleb128 0x9
	.long	.LASF23
	.byte	0x7
	.value	0x105
	.long	0x8f
	.byte	0x50
	.uleb128 0x9
	.long	.LASF24
	.byte	0x7
	.value	0x106
	.long	0x8f
	.byte	0x58
	.uleb128 0x9
	.long	.LASF25
	.byte	0x7
	.value	0x108
	.long	0x25f
	.byte	0x60
	.uleb128 0x9
	.long	.LASF26
	.byte	0x7
	.value	0x10a
	.long	0x265
	.byte	0x68
	.uleb128 0x9
	.long	.LASF27
	.byte	0x7
	.value	0x10c
	.long	0x62
	.byte	0x70
	.uleb128 0x9
	.long	.LASF28
	.byte	0x7
	.value	0x110
	.long	0x62
	.byte	0x74
	.uleb128 0x9
	.long	.LASF29
	.byte	0x7
	.value	0x112
	.long	0x70
	.byte	0x78
	.uleb128 0x9
	.long	.LASF30
	.byte	0x7
	.value	0x116
	.long	0x46
	.byte	0x80
	.uleb128 0x9
	.long	.LASF31
	.byte	0x7
	.value	0x117
	.long	0x54
	.byte	0x82
	.uleb128 0x9
	.long	.LASF32
	.byte	0x7
	.value	0x118
	.long	0x26b
	.byte	0x83
	.uleb128 0x9
	.long	.LASF33
	.byte	0x7
	.value	0x11c
	.long	0x27b
	.byte	0x88
	.uleb128 0x9
	.long	.LASF34
	.byte	0x7
	.value	0x125
	.long	0x7b
	.byte	0x90
	.uleb128 0x9
	.long	.LASF35
	.byte	0x7
	.value	0x12e
	.long	0x8d
	.byte	0x98
	.uleb128 0x9
	.long	.LASF36
	.byte	0x7
	.value	0x12f
	.long	0x8d
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x7
	.value	0x130
	.long	0x8d
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x7
	.value	0x131
	.long	0x8d
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x7
	.value	0x132
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF40
	.byte	0x7
	.value	0x134
	.long	0x62
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x7
	.value	0x136
	.long	0x281
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF122
	.byte	0x7
	.byte	0x9a
	.uleb128 0x7
	.long	.LASF43
	.byte	0x18
	.byte	0x7
	.byte	0xa0
	.long	0x25f
	.uleb128 0x8
	.long	.LASF44
	.byte	0x7
	.byte	0xa1
	.long	0x25f
	.byte	0
	.uleb128 0x8
	.long	.LASF45
	.byte	0x7
	.byte	0xa2
	.long	0x265
	.byte	0x8
	.uleb128 0x8
	.long	.LASF46
	.byte	0x7
	.byte	0xa6
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22e
	.uleb128 0x6
	.byte	0x8
	.long	0xa7
	.uleb128 0xb
	.long	0x95
	.long	0x27b
	.uleb128 0xc
	.long	0x86
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x227
	.uleb128 0xb
	.long	0x95
	.long	0x291
	.uleb128 0xc
	.long	0x86
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF47
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF48
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF49
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF50
	.uleb128 0xd
	.long	.LASF51
	.value	0x448
	.byte	0x8
	.byte	0x7
	.long	0x358
	.uleb128 0x8
	.long	.LASF52
	.byte	0x8
	.byte	0x8
	.long	0x62
	.byte	0
	.uleb128 0xe
	.string	"L"
	.byte	0x8
	.byte	0x9
	.long	0x2a6
	.byte	0x8
	.uleb128 0x8
	.long	.LASF53
	.byte	0x8
	.byte	0xa
	.long	0x2a6
	.byte	0x10
	.uleb128 0x8
	.long	.LASF54
	.byte	0x8
	.byte	0xb
	.long	0x62
	.byte	0x18
	.uleb128 0x8
	.long	.LASF55
	.byte	0x8
	.byte	0xc
	.long	0x2a6
	.byte	0x20
	.uleb128 0x8
	.long	.LASF56
	.byte	0x8
	.byte	0xd
	.long	0x2a6
	.byte	0x28
	.uleb128 0x8
	.long	.LASF57
	.byte	0x8
	.byte	0xe
	.long	0x2a6
	.byte	0x30
	.uleb128 0xe
	.string	"dx"
	.byte	0x8
	.byte	0xf
	.long	0x2a6
	.byte	0x38
	.uleb128 0x8
	.long	.LASF58
	.byte	0x8
	.byte	0x10
	.long	0x358
	.byte	0x40
	.uleb128 0xf
	.long	.LASF59
	.byte	0x8
	.byte	0x13
	.long	0x2a6
	.value	0x428
	.uleb128 0xf
	.long	.LASF60
	.byte	0x8
	.byte	0x14
	.long	0x2a6
	.value	0x430
	.uleb128 0x10
	.string	"zRS"
	.byte	0x8
	.byte	0x15
	.long	0x2a6
	.value	0x438
	.uleb128 0xf
	.long	.LASF61
	.byte	0x8
	.byte	0x16
	.long	0x2a6
	.value	0x440
	.byte	0
	.uleb128 0xb
	.long	0x95
	.long	0x369
	.uleb128 0x11
	.long	0x86
	.value	0x3e7
	.byte	0
	.uleb128 0x7
	.long	.LASF62
	.byte	0x40
	.byte	0x8
	.byte	0x1b
	.long	0x3d5
	.uleb128 0xe
	.string	"id"
	.byte	0x8
	.byte	0x1c
	.long	0x4d
	.byte	0
	.uleb128 0x8
	.long	.LASF63
	.byte	0x8
	.byte	0x1e
	.long	0x2a6
	.byte	0x8
	.uleb128 0x8
	.long	.LASF64
	.byte	0x8
	.byte	0x1f
	.long	0x2a6
	.byte	0x10
	.uleb128 0x8
	.long	.LASF65
	.byte	0x8
	.byte	0x20
	.long	0x2a6
	.byte	0x18
	.uleb128 0x8
	.long	.LASF66
	.byte	0x8
	.byte	0x22
	.long	0x2a6
	.byte	0x20
	.uleb128 0x8
	.long	.LASF67
	.byte	0x8
	.byte	0x23
	.long	0x2a6
	.byte	0x28
	.uleb128 0x8
	.long	.LASF68
	.byte	0x8
	.byte	0x24
	.long	0x2a6
	.byte	0x30
	.uleb128 0x8
	.long	.LASF56
	.byte	0x8
	.byte	0x26
	.long	0x2a6
	.byte	0x38
	.byte	0
	.uleb128 0xd
	.long	.LASF69
	.value	0x100
	.byte	0x8
	.byte	0x2a
	.long	0x48b
	.uleb128 0x8
	.long	.LASF70
	.byte	0x8
	.byte	0x2b
	.long	0x48b
	.byte	0
	.uleb128 0x8
	.long	.LASF56
	.byte	0x8
	.byte	0x2c
	.long	0x49b
	.byte	0x18
	.uleb128 0x8
	.long	.LASF71
	.byte	0x8
	.byte	0x2d
	.long	0x2a6
	.byte	0x48
	.uleb128 0x8
	.long	.LASF72
	.byte	0x8
	.byte	0x2e
	.long	0x2a6
	.byte	0x50
	.uleb128 0x8
	.long	.LASF73
	.byte	0x8
	.byte	0x2f
	.long	0x62
	.byte	0x58
	.uleb128 0x8
	.long	.LASF74
	.byte	0x8
	.byte	0x30
	.long	0x62
	.byte	0x5c
	.uleb128 0x8
	.long	.LASF75
	.byte	0x8
	.byte	0x31
	.long	0x48b
	.byte	0x60
	.uleb128 0x8
	.long	.LASF76
	.byte	0x8
	.byte	0x32
	.long	0x62
	.byte	0x78
	.uleb128 0x8
	.long	.LASF77
	.byte	0x8
	.byte	0x33
	.long	0x62
	.byte	0x7c
	.uleb128 0x8
	.long	.LASF78
	.byte	0x8
	.byte	0x34
	.long	0x2a6
	.byte	0x80
	.uleb128 0x8
	.long	.LASF79
	.byte	0x8
	.byte	0x35
	.long	0x2a6
	.byte	0x88
	.uleb128 0x8
	.long	.LASF80
	.byte	0x8
	.byte	0x36
	.long	0x2a6
	.byte	0x90
	.uleb128 0x8
	.long	.LASF61
	.byte	0x8
	.byte	0x37
	.long	0x2a6
	.byte	0x98
	.uleb128 0x8
	.long	.LASF81
	.byte	0x8
	.byte	0x38
	.long	0x4ab
	.byte	0xa0
	.byte	0
	.uleb128 0xb
	.long	0x62
	.long	0x49b
	.uleb128 0xc
	.long	0x86
	.byte	0x5
	.byte	0
	.uleb128 0xb
	.long	0x2a6
	.long	0x4ab
	.uleb128 0xc
	.long	0x86
	.byte	0x5
	.byte	0
	.uleb128 0xb
	.long	0x95
	.long	0x4bb
	.uleb128 0xc
	.long	0x86
	.byte	0x5f
	.byte	0
	.uleb128 0x7
	.long	.LASF82
	.byte	0x50
	.byte	0x8
	.byte	0x3c
	.long	0x528
	.uleb128 0x8
	.long	.LASF83
	.byte	0x8
	.byte	0x3d
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF84
	.byte	0x8
	.byte	0x3e
	.long	0x528
	.byte	0x8
	.uleb128 0x8
	.long	.LASF66
	.byte	0x8
	.byte	0x3f
	.long	0x2a6
	.byte	0x10
	.uleb128 0x8
	.long	.LASF67
	.byte	0x8
	.byte	0x40
	.long	0x2a6
	.byte	0x18
	.uleb128 0x8
	.long	.LASF68
	.byte	0x8
	.byte	0x41
	.long	0x2a6
	.byte	0x20
	.uleb128 0x8
	.long	.LASF85
	.byte	0x8
	.byte	0x42
	.long	0x2a6
	.byte	0x28
	.uleb128 0xe
	.string	"rho"
	.byte	0x8
	.byte	0x43
	.long	0x2a6
	.byte	0x30
	.uleb128 0xe
	.string	"pos"
	.byte	0x8
	.byte	0x44
	.long	0x52e
	.byte	0x38
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x69
	.uleb128 0xb
	.long	0x2a6
	.long	0x53e
	.uleb128 0xc
	.long	0x86
	.byte	0x2
	.byte	0
	.uleb128 0x12
	.long	.LASF95
	.byte	0x1
	.byte	0xc
	.long	0x62
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x5f9
	.uleb128 0x13
	.long	.LASF86
	.byte	0x1
	.byte	0xd
	.long	0x5f9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.string	"i"
	.byte	0x1
	.byte	0xe
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x14
	.string	"j"
	.byte	0x1
	.byte	0xe
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x13
	.long	.LASF87
	.byte	0x1
	.byte	0xf
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x13
	.long	.LASF88
	.byte	0x1
	.byte	0xf
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x13
	.long	.LASF89
	.byte	0x1
	.byte	0xf
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x13
	.long	.LASF90
	.byte	0x1
	.byte	0xf
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x13
	.long	.LASF91
	.byte	0x1
	.byte	0xf
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.long	.LASF92
	.byte	0x1
	.byte	0x10
	.long	0x29f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x13
	.long	.LASF93
	.byte	0x1
	.byte	0x10
	.long	0x5ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.long	.LASF94
	.byte	0x1
	.byte	0x11
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0xb
	.long	0x29f
	.long	0x60f
	.uleb128 0xc
	.long	0x86
	.byte	0x2
	.byte	0
	.uleb128 0x15
	.string	"W"
	.byte	0x1
	.byte	0x95
	.long	0x2a6
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x688
	.uleb128 0x16
	.string	"x"
	.byte	0x1
	.byte	0x95
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x16
	.string	"y"
	.byte	0x1
	.byte	0x95
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x16
	.string	"z"
	.byte	0x1
	.byte	0x95
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x16
	.string	"H"
	.byte	0x1
	.byte	0x95
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x14
	.string	"Wx"
	.byte	0x1
	.byte	0x96
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x14
	.string	"Wy"
	.byte	0x1
	.byte	0x96
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.string	"Wz"
	.byte	0x1
	.byte	0x96
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x17
	.long	.LASF96
	.byte	0x1
	.byte	0xfc
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x720
	.uleb128 0x16
	.string	"xp"
	.byte	0x1
	.byte	0xfc
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x16
	.string	"yp"
	.byte	0x1
	.byte	0xfc
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x16
	.string	"zp"
	.byte	0x1
	.byte	0xfc
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x18
	.long	.LASF97
	.byte	0x1
	.byte	0xfc
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x18
	.long	.LASF98
	.byte	0x1
	.byte	0xfc
	.long	0x720
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x19
	.string	"i"
	.byte	0x1
	.value	0x100
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x19
	.string	"j"
	.byte	0x1
	.value	0x100
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x19
	.string	"k"
	.byte	0x1
	.value	0x100
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.string	"n"
	.byte	0x1
	.value	0x100
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x4bb
	.uleb128 0x1a
	.string	"mod"
	.byte	0x1
	.value	0x11d
	.long	0x62
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x772
	.uleb128 0x1b
	.string	"a"
	.byte	0x1
	.value	0x11d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1b
	.string	"b"
	.byte	0x1
	.value	0x11d
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.string	"mod"
	.byte	0x1
	.value	0x11e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1c
	.long	.LASF99
	.byte	0x2
	.byte	0x9
	.long	0x62
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x7b2
	.uleb128 0x18
	.long	.LASF100
	.byte	0x2
	.byte	0x9
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x14
	.string	"cmd"
	.byte	0x2
	.byte	0xb
	.long	0x7b2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.byte	0
	.uleb128 0xb
	.long	0x95
	.long	0x7c2
	.uleb128 0xc
	.long	0x86
	.byte	0x63
	.byte	0
	.uleb128 0x1c
	.long	.LASF101
	.byte	0x2
	.byte	0x1c
	.long	0x62
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x82d
	.uleb128 0x18
	.long	.LASF100
	.byte	0x2
	.byte	0x1c
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x14
	.string	"cmd"
	.byte	0x2
	.byte	0x1e
	.long	0x7b2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x13
	.long	.LASF102
	.byte	0x2
	.byte	0x1e
	.long	0x7b2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x14
	.string	"i"
	.byte	0x2
	.byte	0x1f
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -252
	.uleb128 0x13
	.long	.LASF103
	.byte	0x2
	.byte	0x20
	.long	0x5f9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.byte	0
	.uleb128 0x1c
	.long	.LASF104
	.byte	0x2
	.byte	0x42
	.long	0x62
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x893
	.uleb128 0x14
	.string	"i"
	.byte	0x2
	.byte	0x44
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x1d
	.long	.LASF91
	.byte	0x2
	.byte	0x44
	.long	0x62
	.uleb128 0x13
	.long	.LASF105
	.byte	0x2
	.byte	0x45
	.long	0x52e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x13
	.long	.LASF106
	.byte	0x2
	.byte	0x46
	.long	0x52e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x13
	.long	.LASF107
	.byte	0x2
	.byte	0x47
	.long	0x5f9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.byte	0
	.uleb128 0x12
	.long	.LASF108
	.byte	0x3
	.byte	0x15
	.long	0x62
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0xa43
	.uleb128 0x14
	.string	"i"
	.byte	0x3
	.byte	0x17
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x14
	.string	"j"
	.byte	0x3
	.byte	0x17
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -172
	.uleb128 0x14
	.string	"k"
	.byte	0x3
	.byte	0x17
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x14
	.string	"l"
	.byte	0x3
	.byte	0x17
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -164
	.uleb128 0x13
	.long	.LASF109
	.byte	0x3
	.byte	0x17
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x13
	.long	.LASF110
	.byte	0x3
	.byte	0x17
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x14
	.string	"Np"
	.byte	0x3
	.byte	0x17
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -140
	.uleb128 0x13
	.long	.LASF111
	.byte	0x3
	.byte	0x17
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x14
	.string	"ii"
	.byte	0x3
	.byte	0x18
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x14
	.string	"jj"
	.byte	0x3
	.byte	0x18
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.uleb128 0x14
	.string	"kk"
	.byte	0x3
	.byte	0x18
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1d
	.long	.LASF112
	.byte	0x3
	.byte	0x19
	.long	0x62
	.uleb128 0x1d
	.long	.LASF113
	.byte	0x3
	.byte	0x19
	.long	0x62
	.uleb128 0x1d
	.long	.LASF114
	.byte	0x3
	.byte	0x19
	.long	0x62
	.uleb128 0x13
	.long	.LASF115
	.byte	0x3
	.byte	0x1a
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -148
	.uleb128 0x14
	.string	"xc"
	.byte	0x3
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x14
	.string	"yc"
	.byte	0x3
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x14
	.string	"zc"
	.byte	0x3
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1e
	.string	"vxc"
	.byte	0x3
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x1e
	.string	"vyc"
	.byte	0x3
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x1e
	.string	"vzc"
	.byte	0x3
	.byte	0x1b
	.long	0x2a6
	.uleb128 0x14
	.string	"xp"
	.byte	0x3
	.byte	0x1c
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x14
	.string	"yp"
	.byte	0x3
	.byte	0x1c
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x14
	.string	"zp"
	.byte	0x3
	.byte	0x1c
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x14
	.string	"vxp"
	.byte	0x3
	.byte	0x1c
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x14
	.string	"vyp"
	.byte	0x3
	.byte	0x1c
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x14
	.string	"vzp"
	.byte	0x3
	.byte	0x1c
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.long	.LASF116
	.byte	0x3
	.byte	0x1d
	.long	0x5f9
	.uleb128 0x14
	.string	"foo"
	.byte	0x3
	.byte	0x1e
	.long	0x2a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1d
	.long	.LASF56
	.byte	0x3
	.byte	0x1f
	.long	0x2a6
	.byte	0
	.uleb128 0x1f
	.string	"GV"
	.byte	0x8
	.byte	0x18
	.long	0x2ad
	.uleb128 0x9
	.byte	0x3
	.quad	GV
	.uleb128 0x20
	.long	.LASF117
	.byte	0x8
	.byte	0x27
	.long	0xa6c
	.uleb128 0x9
	.byte	0x3
	.quad	part
	.uleb128 0x6
	.byte	0x8
	.long	0x369
	.uleb128 0x20
	.long	.LASF118
	.byte	0x8
	.byte	0x3a
	.long	0x3d5
	.uleb128 0x9
	.byte	0x3
	.quad	Header
	.uleb128 0x20
	.long	.LASF98
	.byte	0x8
	.byte	0x45
	.long	0x720
	.uleb128 0x9
	.byte	0x3
	.quad	cells
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF61:
	.string	"HubbleParam"
.LASF69:
	.string	"gadget_head"
.LASF32:
	.string	"_shortbuf"
.LASF122:
	.string	"_IO_lock_t"
.LASF83:
	.string	"Np_cell"
.LASF21:
	.string	"_IO_buf_end"
.LASF72:
	.string	"redshift"
.LASF19:
	.string	"_IO_write_end"
.LASF3:
	.string	"unsigned int"
.LASF13:
	.string	"_flags"
.LASF53:
	.string	"NpTot"
.LASF90:
	.string	"dummy"
.LASF105:
	.string	"pos_aux"
.LASF52:
	.string	"NGRID"
.LASF25:
	.string	"_markers"
.LASF119:
	.string	"GNU C 4.8.4 -mtune=generic -march=x86-64 -g -fstack-protector"
.LASF84:
	.string	"id_part"
.LASF107:
	.string	"outFile"
.LASF94:
	.string	"uintaux"
.LASF117:
	.string	"part"
.LASF46:
	.string	"_pos"
.LASF118:
	.string	"Header"
.LASF24:
	.string	"_IO_save_end"
.LASF49:
	.string	"float"
.LASF109:
	.string	"index"
.LASF48:
	.string	"long long unsigned int"
.LASF103:
	.string	"file"
.LASF55:
	.string	"rhoMean"
.LASF81:
	.string	"fill"
.LASF92:
	.string	"Maux"
.LASF60:
	.string	"OmegaL0"
.LASF23:
	.string	"_IO_backup_base"
.LASF86:
	.string	"fdata"
.LASF34:
	.string	"_offset"
.LASF71:
	.string	"time"
.LASF95:
	.string	"readGADGETBinaryFile"
.LASF78:
	.string	"BoxSize"
.LASF27:
	.string	"_fileno"
.LASF76:
	.string	"flag_cooling"
.LASF85:
	.string	"denCon"
.LASF7:
	.string	"size_t"
.LASF59:
	.string	"OmegaM0"
.LASF16:
	.string	"_IO_read_base"
.LASF44:
	.string	"_next"
.LASF51:
	.string	"globalVariables"
.LASF120:
	.string	"CIC_uniform.c"
.LASF113:
	.string	"jcor"
.LASF121:
	.string	"/home/darivadi/Documents/University/Master/Courses/Investigation_III/Codes_last_version/Codes_Uniform_Gauss_Plummer"
.LASF11:
	.string	"char"
.LASF80:
	.string	"OmegaLambda"
.LASF116:
	.string	"outfile"
.LASF40:
	.string	"_mode"
.LASF100:
	.string	"filename"
.LASF111:
	.string	"idPart"
.LASF43:
	.string	"_IO_marker"
.LASF14:
	.string	"_IO_read_ptr"
.LASF70:
	.string	"Npart"
.LASF115:
	.string	"suma"
.LASF82:
	.string	"Cell"
.LASF17:
	.string	"_IO_write_base"
.LASF47:
	.string	"long long int"
.LASF58:
	.string	"FILENAME"
.LASF22:
	.string	"_IO_save_base"
.LASF101:
	.string	"read_parameters"
.LASF102:
	.string	"filenamedump"
.LASF106:
	.string	"momentum_aux"
.LASF35:
	.string	"__pad1"
.LASF36:
	.string	"__pad2"
.LASF37:
	.string	"__pad3"
.LASF38:
	.string	"__pad4"
.LASF39:
	.string	"__pad5"
.LASF56:
	.string	"mass"
.LASF31:
	.string	"_vtable_offset"
.LASF15:
	.string	"_IO_read_end"
.LASF5:
	.string	"short int"
.LASF93:
	.string	"faux"
.LASF6:
	.string	"long int"
.LASF96:
	.string	"locateCell"
.LASF97:
	.string	"indexPartArray"
.LASF75:
	.string	"npartTotal"
.LASF89:
	.string	"N_max"
.LASF73:
	.string	"flag_sfr"
.LASF98:
	.string	"cells"
.LASF57:
	.string	"volCell"
.LASF74:
	.string	"flag_feedback"
.LASF33:
	.string	"_lock"
.LASF10:
	.string	"sizetype"
.LASF110:
	.string	"indexaux"
.LASF0:
	.string	"long unsigned int"
.LASF62:
	.string	"particle"
.LASF29:
	.string	"_old_offset"
.LASF42:
	.string	"_IO_FILE"
.LASF54:
	.string	"NGRID3"
.LASF66:
	.string	"velx"
.LASF67:
	.string	"vely"
.LASF68:
	.string	"velz"
.LASF112:
	.string	"icor"
.LASF88:
	.string	"N_min"
.LASF104:
	.string	"write_binary"
.LASF1:
	.string	"unsigned char"
.LASF99:
	.string	"conf2dump"
.LASF45:
	.string	"_sbuf"
.LASF79:
	.string	"Omega0"
.LASF18:
	.string	"_IO_write_ptr"
.LASF63:
	.string	"posx"
.LASF64:
	.string	"posy"
.LASF65:
	.string	"posz"
.LASF8:
	.string	"__off_t"
.LASF91:
	.string	"nread"
.LASF4:
	.string	"signed char"
.LASF2:
	.string	"short unsigned int"
.LASF108:
	.string	"main"
.LASF50:
	.string	"double"
.LASF26:
	.string	"_chain"
.LASF114:
	.string	"kcor"
.LASF12:
	.string	"FILE"
.LASF28:
	.string	"_flags2"
.LASF77:
	.string	"num_files"
.LASF30:
	.string	"_cur_column"
.LASF87:
	.string	"N_tot"
.LASF9:
	.string	"__off64_t"
.LASF41:
	.string	"_unused2"
.LASF20:
	.string	"_IO_buf_base"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits

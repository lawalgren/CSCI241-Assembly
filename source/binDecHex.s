.section .data

i:
	.long 1975

binStr:
	.rept 32
	.byte ' '
	.endr
	.byte 0

decStr:
	.rept 32
	.byte ' '
	.endr
	.byte 0

hexStr:
	.rept 32
	.byte ' '
	.endr
	.byte 0

	.text
	.globl	main

main:
	push	%rbp
	mov		%rsp, %rbp
	sub		$32, %rsp

	mov 	i(%rip), %rbx
	lea		binStr, %rax
	add		$32, %rax
binary:
	cmp		$0, %rbx
	je		outputbin

	shr		%rbx
	jc		one
	movb	$0x30, (%rax)
	dec		%rax

	jmp		binary
one:
	movb	$0x31, (%rax)
	dec		%rax

	jmp		binary
outputbin:
	lea		binStr, %rcx
	call	puts

	mov		i(%rip), %rax
	mov		$10, %rbx
	lea		decStr, %rcx
	add		$32, %rcx
	decimal:
	cmp		$0, %rax
	je		outputdec

	xor		%rdx, %rdx
	div		%rbx
	add		$0x30,%rdx
	mov		%rdx,(%rcx)
	dec		%rcx

	jmp		decimal
	outputdec:
	lea		decStr,%rcx
	call	puts

	mov		i, %rax
	lea		hexStr, %rcx
	add		$32, %rcx
	hex:
	cmp		$0, %rax
	je		outputhex

	mov		%rax, %rbx
	and		$0xF, %rbx

	cmp		$9, %rbx
	jg		letter

	add		$0x30, %rbx
	mov		%rbx, (%rcx)
	dec		%rcx
	shr		$4, %rax

	jmp		hex

	letter:
	add		$0x37, %rbx
	mov		%rbx, (%rcx)
	dec		%rcx
	shr		$4, %rax

	jmp		hex
	outputhex:
	lea		hexStr, %rcx
	call	puts

	mov		$0, %eax
	add		$32, %rsp
	pop		%rbp
	ret

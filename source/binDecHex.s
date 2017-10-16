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

	mov 	i, %ebx
	lea		binStr, %rax
	add		$32, %rax
binary:
	cmp		$0, %ebx
	je		outputbin

	shr		%ebx
	jc		one
	movb	$0x30, (%rax)
	dec		%rax

	jmp		binary
one:
	movb	$0x31, (%rax)
	dec		%rax

	jmp		binary
outputbin:
	lea		binStr, %ecx
	call	puts

	mov		i, %eax
	mov		$10, %ebx
	lea		decStr, %rcx
	add		$32, %rcx
	decimal:
	cmp		$0, %eax
	je		outputdec

	xor		%edx, %edx
	div		%ebx
	add		$0x30,%dl
	mov		%dl,(%rcx)
	dec		%rcx

	jmp		decimal
	outputdec:
	lea		decStr,%ecx
	call	puts

	mov		i, %eax
	lea		hexStr, %rcx
	add		$32, %rcx
	hex:
	cmp		$0, %eax
	je		outputhex

	mov		%eax, %ebx
	and		$0xF, %ebx

	cmp		$9, %ebx
	jg		letter

	add		$0x30, %bl
	mov		%bl, (%rcx)
	dec		%rcx
	shr		$4, %eax

	jmp		hex

	letter:
	add		$0x37, %bl
	mov		%bl, (%rcx)
	dec		%rcx
	shr		$4, %eax

	jmp		hex
	outputhex:
	lea		hexStr, %rcx
	call	puts

	mov		$0, %eax
	add		$32, %rsp
	pop		%rbp
	ret

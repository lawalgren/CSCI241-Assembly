.section .data

i:
	.long 1975959

stack:
	.rept 32
	.long 0x00
	.endr

	.text
	.globl	main

main:
	push	%rbp
	mov		%rsp, %rbp
	sub		$32, %rsp

	mov 	i(%rip), %rbx
	xor		%rsi, %rsi
binary:
	cmp		$0, %rbx
	je		outputbin

	shr		%rbx
	lea		stack, %rax
	jc		one
	movl	$0x30, (%rax, %rsi, 4)
	inc		%rsi

	jmp		binary
one:
	movl	$0x31, (%rax, %rsi, 4)
	inc		%rsi

	jmp		binary
outputbin:
	cmp   $0, %rsi
	je		endbin

	dec		%rsi
	lea		stack, %rax
	mov		(%rax, %rsi, 4), %rcx
	call	putchar
	lea		stack, %rax
	movl	$0, (%rax, %rsi, 4)

	jmp		outputbin
endbin:
	mov		$0xA, %rcx
	call	putchar
	mov		i(%rip), %rax
	mov		$10, %rbx
	xor		%rsi, %rsi
decimal:
	cmp		$0, %rax
	je		outputdec

	xor		%rdx, %rdx
	div		%rbx
	lea		stack, %rcx
	mov		%rdx, (%rcx, %rsi, 4)
	inc		%rsi

	jmp		decimal
outputdec:
	cmp		$0, %rsi
	je		enddec

	dec		%rsi
	lea		stack, %rax
	mov		(%rax, %rsi, 4), %rcx
	add		$0x30, %rcx
	call	putchar
	lea		stack, %rax
	movl	$0, (%rax, %rsi, 4)

	jmp		outputdec
enddec:
	mov		$0xA, %rcx
	call	putchar
	mov		i, %rax
	xor		%rsi, %rsi
hex:
	cmp		$0, %rax
	je		outputhex

	mov		%rax, %rbx
	and		$0xF, %rbx
	lea		stack, %rcx
	mov		%rbx, (%rcx, %rsi, 4)
	inc		%rsi
	shr		$4, %rax

	jmp		hex
outputhex:
	cmp		$0, %rsi
	je		endhex

	dec		%rsi
	lea		stack, %rax
	mov		(%rax, %rsi, 4), %rcx

	and		$0xf, %rcx
	cmp		$9, %rcx
	jg		letter
	add		$0x30, %rcx
	call	putchar

	jmp		outputhex
letter:
	add		$0x37, %rcx
	call 	putchar

	jmp 	outputhex
endhex:

	mov		$0, %eax
	add		$32, %rsp
	pop		%rbp
	ret

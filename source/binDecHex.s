.section .data
	
i:
	.long  1234
j:
	.long  0
k:
	.byte  0

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
	
	mov 	i(%rip), %rax
	mov		%rax, j(%rip)
bin:
	mov		j(%rip), %rax
	cmp		$0, %rax
	je		dbin
	xor		%rcx, %rcx
	shr		%rax
	mov		%rax, j(%rip)
	jc		one
	mov		$0x30, %rcx
	call	putchar
	jmp	bin

one:
	mov		$0x31, %rcx
	call	putchar
	jmp 	bin
dbin:
	mov		i(%rip), %rax
	and		$1, %rax
	cmp		$0, %rax
	je		addz

nline:
	mov		$0xa, %rcx
	call	putchar
	jmp		dec
	
addz:
	mov		$0, %rcx
	call	putchar
	jmp 	nline
dec:
	
	
	mov		$0, %eax
	add		$32, %rsp
	pop		%rbp
	ret

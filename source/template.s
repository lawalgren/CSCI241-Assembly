.section .data
Message:
	.ascii "Hello World\0"
	.text
	.globl	main

main:
	push	%rbp
	mov		%rsp, %rbp
	sub		$32, %rsp
	
	lea		Message(%rip), %rcx
	call	puts
	
	mov		$7, %eax
	add		$32, %rsp
	pop		%rbp
	ret

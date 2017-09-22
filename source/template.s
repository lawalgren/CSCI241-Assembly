.section .data
Message:
	.ascii "Hello World\0"
	.globl	main
.text
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

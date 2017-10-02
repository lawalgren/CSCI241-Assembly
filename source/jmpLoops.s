.section .data
Message:
	.ascii "Hello World\0"
i: .long 0
	.text
	.globl	main

main:
	push	%rbp
	mov		%rsp, %rbp
	sub		$32, %rsp
	
	movl $0,i
top:
	cmp $10,i
	jns done
	
	lea		Message(%rip), %rcx
	call	puts
	
	incl i
	jmp top
done:
	
	mov		$7, %eax
	add		$32, %rsp
	pop		%rbp
	ret

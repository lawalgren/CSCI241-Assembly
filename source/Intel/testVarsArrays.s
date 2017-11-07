.section .data
Message:
	.ascii "Hello World\0"
i:
	.long 0
// long i = 0;
	
c:
	.rept 7
	.long 0x00
	.endr
//long c[7];

	.text
	.globl	main

main:
	push	%rbp
	mov		%rsp, %rbp
	sub		$32, %rsp
	
	lea c, %rbx
	mov $6, %rcx
	incl (%rbx, %rcx, 4)
	//c[6]++;
	
	xor %eax, %eax
	movl %eax, i
	// i = 0;
	
stuff:
	lea		Message(%rip), %rcx
	call	puts
	
	incl i
	mov $10, %rax
	cmp %rax, i
js stuff
	
//while (i - 10 < 0) {
//	puts("hello world");
//}
	
	//lea		Message(%rip), %rcx
	//call	puts
	
	mov		$7, %eax
	add		$32, %rsp
	pop		%rbp
	ret

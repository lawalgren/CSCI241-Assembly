.section .data
Message:
	.ascii "Hello World\0"
	i: .long 0
// long i = 0;
b:
	.rept 10
		.long 0x00
	.endr

// long b[10];

	.text
	.globl	main
	

main:
	push	%rbp
	mov		%rsp, %rbp
	sub		$32, %rsp
	
	lea b, %rbx
	add $12, %rbx
	movl $0xa5,(%rbx)
	
	lea b, %rbx
	mov $3, %rcx
	mov (%rbx, %rcx, 4), %eax
	incl (%rbx, %rcx, 4)
	mov (%rbx,%rcx, 4), %eax
	//b[3] = b[3] + 1;
	
	// i=0;
	//movl $0, %eax
	xor %eax, %eax
	movl %eax, i

	// i=i+9;
	movl i, %eax
	add $9, %eax
	movl %eax, i
	
	// bool i < 10 a flag if i<10 or i== 10
	movl i,%eax
	cmp $10, %eax
	// Check sign flag
	
	// i++; i = i + 1;
	movl i, %eax
	add $1, %eax
	movl %eax, i
	
	lea		Message, %rcx
	call	puts
	
	mov		$7, %eax
	add		$32, %rsp
	pop		%rbp
	ret


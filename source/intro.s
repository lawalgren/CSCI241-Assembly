.section .data
Message:
	.ascii "Hello World\0"
	.globl	main
.text
main:
	push	%rbp
	mov		%rsp, %rbp
	sub		$32, %rsp
	
	/*  SUB, SBB, ADD, ADC, CLR, STC, CLC */
	
	movl $01, %eax
	movw $0xff, %ax
	movq $0xff, %rax
	movq $0xffff, %rax
	clc
	sub $0x02, %eax
	sub $0b00000000001110001010, %eax
	stc
stuff:
	movl $0, %ecx
	mov $0, %ax
	adcw $1024, %ax
	mov $0, %rax

	sbb %eax, %ebx
	add $0x10, %eax
	adc $0x10, %ebx
	
	lea		Message(%rip), %rcx
	call	puts
	
	mov		$7, %eax
	add		$32, %rsp
	pop		%rbp
	ret

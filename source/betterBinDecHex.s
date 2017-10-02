.section .data
i:
	.long 15559
	
stack:
	.rept 32
	.long 0x00
	.endr
	
position:
	.long 1
	 
	.text
	.globl	main

main:
	push	%rbp
	mov		%rsp, %rbp
	sub		$32, %rsp

top:
	xor		%rsi, %rsi
	lea		stack(%rip), %rax
startclear:
	cmp 	$32, %rsi
	je		cleared
	movl	$0, (%rax, %rsi, 4)
	inc		%rsi
	jmp	startclear
cleared:
	
	mov		position(%rip), %rax
	
	cmp		$1, %rax
	je		bin

	cmp 	$2, %rax
	je		dec

	cmp		$3,	%rax
	je		hex
	
	jmp		done
	
bin:
	mov		i(%rip), %rax
	mov		$2, %rbx
	xor		%rsi, %rsi
	jmp		convert
	
dec:	
	mov		i(%rip), %rax
	mov		$10,  %rbx
	xor		%rsi, %rsi
	jmp		convert
	
hex:
	mov		i(%rip), %rax
	mov 	$16, %rbx
	xor		%rsi, %rsi
		
convert:
	cmp		$0, %rax
	je		output

	xor		%rdx, %rdx
	div		%rbx
	lea		stack(%rip), %rcx
	mov		%rdx, (%rcx, %rsi, 4)
	inc		%rsi
	jmp		convert
output:
	cmp 	$0, %rsi
	je		end
	dec 	%rsi
	lea		stack(%rip), %rax
	mov		(%rax, %rsi, 4), %rcx
	
	and		$0xff, %rcx
	cmp		$9, %rcx
	ja		letter
	
	add		$0x30, %rcx
	call	putchar
	jmp 	output
letter:
	add		$0x37, %rcx
	call	putchar
	jmp		output
end:
	mov		$0xa, %rcx
	call	putchar
	incl	position(%rip)
	jmp		top	
done:
	
	mov		$0, %eax
	add		$32, %rsp
	pop		%rbp
	ret

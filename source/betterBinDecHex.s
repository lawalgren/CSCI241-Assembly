.macro setup base
	mov		i(%rip), %rax
	mov		$\base, %rbx
	xor		%rsi, %rsi
	jmp		convert
.endm

.section .data
i:
	.long 999595

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

	mov		position(%rip), %rax

	cmp		$1, %rax
	je		bin

	cmp 	$2, %rax
	je		deci

	cmp		$3,	%rax
	je		hex

	jmp		done

bin:
	setup	2

deci:
	setup 10

hex:
	setup 16

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
	movl	$0, (%rax, %rsi, 4)

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

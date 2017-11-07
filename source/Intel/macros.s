.macro	programStart
	.text
	.globl	main

main:
	push	%rbp
	mov		%rsp, %rbp
	sub		$32, %rsp
.endm

.macro	programEnd
	mov		$7, %eax
	add		$32, %rsp
	pop		%rbp
	ret
.endm

.macro	int name start
.section .data
\name: .long \start
.text
.endm

.macro	string name value
.section .data
\name: .ascii "\value\0"
.text
.endm

.macro	for start end label
int	\label, \start
top_\label:
	cmp		$\end, \label
	je		bottom_\label
	incl	\label
.endm

.macro	forRegisters start end label
top_\label:
	cmp		\start, \end
	je		bottom_\label
	incl	\start
.endm

.macro	endFor label
jmp	 top_\label
bottom_\label:
.endm

.macro	whileLess current compare label
top_\label:
	cmp		$\compare, \current
	jge		bottom_\label
.endm

.macro	endWhileLess label
	jmp		top_\label
	bottom_\label:
.endm

.macro	whileGreater current compare label
top_\label:
	cmp		$\compare, \current
	jle		bottom_\label
.endm

.macro	endWhileGreater	label
	jmp		top_\label
	bottom_\label:
.endm

.macro	whileEquals current compare label
top_\label:
	cmp		$\compare, \current
	jne		bottom_\label
.endm

.macro	endWhileEquals label
jmp		top_\label
bottom_\label:
.endm

.macro	outputS stringName
lea		\stringName, %rcx
call	puts
.endm

.macro	outputInt intName
string  fstring_\intName,"%d"
lea			fstring_\intName, %rcx
mov			\intName, %rdx
call		printf
.endm

.macro	ifLess current compare label
cmp		$\compare, \current
jge		\label
.endm

.macro  endIfLess label
\label:
.endm

.macro	ifGreater current compare label
cmp		$\compare, \current
jle		\label
.endm

.macro	endIfGreater label
\label:
.endm

.macro	ifEqual	current	compare label
cmp		$\compare, \current
jne		\label
.endm

.macro  endIfEqual label
\label:
.endm

.macro	pow num exp
mov \num, %rax
mov $1, %rbx
lbl:
	adc	\num,%rax
	inc	%rbx
	cmp	$\exp,%rbx
	jne	lbl
.endm

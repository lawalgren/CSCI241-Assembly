.include "macros.s"
.section .data
outputS:
	.rept 32
	.byte ' '
	.endr
	.byte 0
.text
programStart
	movw r0,#1234 /*number to convert*/
	ldr r1,=outputS /*mem address of string*/
	mov r2,#10 /*base*/

	mov r4,r1
	mov r5,r1
	add r4,r4,#31
	mov r1,r2
convert:
	bl divide
	cmp r0,#9
	ble noletter
	add r0,#7
noletter:
	add r0,r0,#48
	strb r0,[r4]
	mov r0, r3
	sub r4,r4,#1
	cmp r0,#0
	bne convert

	mov r0,r5
	bl puts
programEnd

divide:
	/*r0 should contain dividend, will contain quotient afterwards*/
	/*r1 should contain divisor*/
	mov r2,#0 /*counter*/
	mov r3,#0 /*quotient*/
top:
	lsl r1,r1,#1
	add r2,r2,#1
	cmp r0,r1
	bge top
	lsr r1,r1,#1
subtract:
	cmp r0,r1
	ble skip
	sub r0,r0,r1
	add r3,r3,#1
skip:
	lsl r3,r3,#1
	lsr r1,r1,#1
	sub r2,r2,#1
	bne subtract
end:
	lsr r3,r3,#1
	lsl r1,r1,#1
	cmp r0,r1
	bne noteq
	sub r0,r0,r1
	add r3,r3,#1
noteq:
	bx lr

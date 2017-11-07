.include "macros.s"
programStart
	movw r0,#1234 /*dividend*/
	mov r1,#10 /*divisor*/
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
programEnd

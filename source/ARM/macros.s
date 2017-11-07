.macro programStart
.text
.global main
.thumb
.thumb_func
main:
 push    {r7, lr}
 add     r7, sp, #0
.endm

.macro programEnd
 mov     r0, r3
 pop     {r7, pc}
.endm

.macro string name,contents
.section .data
\name\():
	.ascii "\contents\000"
.text
.endm

.macro outputS name
 movw    r0, #:lower16:\name
 movt    r0, #:upper16:\name
 bl      puts
.endm

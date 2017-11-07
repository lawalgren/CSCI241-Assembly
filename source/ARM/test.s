	.section	.data
Message:
	.ascii	"Hello world!\000"
	.text
	.global	main
main:
	push	{r7, lr}
	add	r7, sp, #0
	movw	r0, #:lower16:Message
	movt	r0, #:upper16:Message
	bl	puts
	mov	r0, r3
	pop	{r7, pc}

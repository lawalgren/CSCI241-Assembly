	.thumb
	.section	.data
.LC0:
	.ascii	"Hello world!\000"
	.text
	.global	main
	.thumb
	.thumb_func
main:
	push	{r7, lr}
	add	r7, sp, #0
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	puts
	mov	r0, r3
	pop	{r7, pc}

.include "macros.s"
programStart
  push {r1,r2,r3}
  string nString,10011010010
  ldr r0,=nString /*address of String*/ 
  mov r1,#2 /*base*/
  mov r2,#0 /*working num*/

calculate:
  ldrb r3,[r0]
  cmp r3,#48
  blt endcalc
  mul r2,r2,r1
  add r0,r0,#1

  cmp r3,#57
  bgt hex

  sub r3,r3,#48
  add r2,r2,r3
  bal calculate

hex:
  sub r3,r3,#55
  add r2,r2,r3
  bal calculate

endcalc:
  mov r0,r2
  pop {r1,r2,r3}
programEnd

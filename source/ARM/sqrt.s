.include "macros.s"

programStart
push {r1,r2,r3,r4,r5,r6}

mov r0,#37 /*number to calculate sqrt of*/
mov r1,#0 /*low*/
mov r2,#0 /*high*/
mov r3,r0
mov r4,r0

guess:
  cmp r3,#0
  beq endguess
  lsr r3,r3,#2
  lsr r4,r4,#1
  bal guess
endguess:
  lsl r3,r4,#1
  mov r2,r3
  mov r1,r4
calculate:
  mov r3,r1
  mov r4,r2
  mov r5,r3
  mov r6,r4
  sub r6,r6,r5
  
  cmp r6,#1
  ble endcalc
  add r4,r3,r4
  lsr r4,r4,#1

  mov r5,r4
  mul r4,r4,r4
  cmp r4,r0
  bgt greater
  mov r1,r5
  bal calculate 
greater:
  mov r2,r5 
  bal calculate
endcalc:
  mov r3,r2
  mul r3,r3,r3
  cmp r3,r0
  ble high
  mov r0,r1
  bal end
high:
  mov r0,r2 
end:
 pop {r1,r2,r3,r4,r5,r6} 
programEnd

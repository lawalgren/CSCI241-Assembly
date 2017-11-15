.include "macros.s"
programStart
push {r1,r2,r3,r4,r5}
mov r0,#0 /*shift*/
mov r1,#15 /*u*/
mov r2,#6 /*v*/
mov r5,#1 /*bit mask*/

cmp r1,#0
beq returnr2
cmp r2,#0
beq returnr1

top:
mov r3,r1
mov r4,r2
orr r3,r3,r4
and r3,r3,r5
add r0,r0,#1
cmp r3,#0
bne bottom
lsr r1,r1,#1
lsr r2,r2,#1
bal top
bottom:

oddutop:
mov r4,r1
and r4,r4,r5
cmp r4,#0
bne oddubottom
lsr r1,r1,#1
bal oddutop
oddubottom:

do:
  oddvtop:
    mov r4,r2
    and r4,r4,r5
    cmp r4,#0
    bne oddvbottom
    lsr r2,r2,#1
    bal oddvtop
  oddvbottom:
  
  cmp r1,r2
  ble skip
    mov r4,r1
    mov r1,r2
    mov r2,r4
  skip:
  sub r2,r2,r1
  cmp r2,#0
  bne do
  
  sub r0,r0,#1
  lsl r1,r1,r0
  mov r0,r1
  bal end

  returnr1:
  mov r0,r1
  bal end
  
  returnr2:
  mov r0,r2
end:
pop {r1,r2,r3,r4,r5}
programEnd

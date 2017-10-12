.include "macros.s"
programStart
  int num,111
  int low,0
  int high,0
  mov num,%eax
  mov num,%ebx
guess:
  cmp $0,%eax
  je  endguess
  shr $2,%eax
  shr %ebx
  jmp guess
endguess:
  mov %ebx, %eax
  shl %eax
  mov %ebx, low
  mov %eax, high
calculate:
  mov low,%eax
  mov high,%ebx
  mov %eax,%ecx
  mov %ebx,%edx
  sub %ecx,%edx

  cmp $1,%edx
  jbe endcalc
  add %eax,%ebx
  shr %ebx

  and $0xff,%ebx
  mov %ebx,%eax
  mov %ebx,%ecx
  xor %edx,%edx

  mul %ebx
  cmp num,%eax
  ja  greater
  mov %ecx,low
  jmp calculate
greater:
  mov %ecx,high
  jmp calculate
endcalc:
outputInt low
programEnd

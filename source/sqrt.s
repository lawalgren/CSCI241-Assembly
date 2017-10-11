.include "macros.s"
programStart
  int num,35
  int low,0
  int high,0
  mov num,%rax
  mov num,%rbx
guess:
  cmp $0,%rax
  je  endguess
  shr $2,%rax
  shr %rbx
  jmp guess
endguess:
  mov %rbx, %rax
  shl %rax
  mov %rbx, low
  mov %rax, high
  xor %rdx,%rdx
calculate:
  mov low,%rax
  mov high,%rbx
  mov %rax,%rcx
  mov %rbx,%rdx
  sub %rcx,%rdx

  cmp $1,%rcx
  jle endcalc
  add %rax,%rbx
  shr %rbx

  and $0xff,%rbx
  mov %rbx,%rax
  mov %rbx,%rcx

  mul %rbx
  cmp %rax,num
  jge greater
  mov %rcx,low
  jmp calculate
greater:
  mov %rcx,high
  jmp calculate
endcalc:
  outputInt high
programEnd

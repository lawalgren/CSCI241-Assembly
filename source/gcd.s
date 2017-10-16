.include "macros.s"
programStart
int a,8
int b,36
calculate:
mov a,%eax
mov b,%ebx
mov %eax,%ecx
mov %ebx,%edx

cmp %eax,%ebx
je  endcalc
jns greater
sub %edx,%ecx
mov %ecx,a
jmp calculate

greater:
sub %ecx,%edx
mov %edx,b
jmp calculate

endcalc:
outputInt a
programEnd

.include "macros.s"
programStart
string nString,"ED5"
int base,16
int workingNum,0

lea nString, %ebx
xor %edx,%edx
calculate:
mov (%ebx),%cl
cmp $0x30, %cl
jb endcalc
mov workingNum,%eax
mull base
mov %eax,workingNum
inc %ebx

cmp $0x39,%cl
jg  hex

sub $0x30,%cl
add %cl,workingNum
jmp calculate

hex:
sub $0x37,%cl
add %cl,workingNum
jmp calculate
endcalc:
outputInt workingNum

programEnd

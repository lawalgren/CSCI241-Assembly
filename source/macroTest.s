.include "macros.s"
programStart
  string    text,"Hello World!"
  for     0,10,i
    outputS   text
  endFor  i

  int     j,10
  ifLess  j,111,q
    outputInt   j
  endIfLess   q

  int t,5
  whileLess t,7,wl
    outputInt   t
    incl        t
  endWhileLess wl

programEnd

import std/[bitops]

proc delay*(t: int) =
  for _ in 1..t:
    for _ in 1..20000:
      discard


func `[]`*(n: var SomeUnsignedInt, i: int): bool =
  testBit n, i

func `[]=`*(n: var SomeUnsignedInt, i: int, v: bool) =
  if v: setBit n, i
  else: clearBit n, i

func clear*(n: var SomeUnsignedInt) = n = n.low
func pullup*(n: var SomeUnsignedInt) = n = n.high

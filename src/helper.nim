import std/[bitops]

# system --------------------------

proc delay*(t: int) =
  for _ in 1..t:
    for _ in 1..100000:
      discard

# bits --------------------------

func `[]`*(n: var SomeUnsignedInt, i: int): bool =
  testBit n, i

func `[]=`*(n: var SomeUnsignedInt, i: int, v: bool) =
  if v: setBit n, i
  else: clearBit n, i

func `[]=`*(n: var SomeUnsignedInt, i: int, v: range[0..1]) =
  if v == 1: setBit n, i
  else: clearBit n, i

func clear*[T: SomeUnsignedInt](n: var T) =
  n = T.low

func pullup*[T: SomeUnsignedInt](n: var T) =
  n = T.high

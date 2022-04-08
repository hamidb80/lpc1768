import std/[bitops]

# system --------------------------

type MS* = distinct int

proc delay*(t: MS) =
  for _ in 1 .. t.int:
    for _ in 1 .. 5000:
      discard

# ranges ------------------------

func `[]`*(r: HSlice[int, int], i: int): int =
  r.a + i

# bits --------------------------

func `[]`*(n: var SomeUnsignedInt, i: int): bool =
  testBit n, i

func `[]=`*(n: var SomeUnsignedInt, i: int, v: bool) =
  if v: setBit n, i
  else: clearBit n, i

func `[]=`*(n: var SomeUnsignedInt, i: int, v: static[range[0..1]]) =
  if v == 1: setBit n, i
  else: clearBit n, i

func clear*[T: SomeUnsignedInt](n: var T) =
  n = 0

func pullup*[T: SomeUnsignedInt](n: var T) =
  n = T.high

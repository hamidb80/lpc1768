import init, defs


proc delay(t: int) =
  for _ in 1..t:
    for _ in 1..20000:
      discard

func `[]`(n: var SomeUnsignedInt, i: int): bool =
  false

func `[]=`(n: var SomeUnsignedInt, i: int, v: bool) =
  discard

var gotoLeft = false

proc blinkLoop =
  var i = 0

  while true:
    LPC_GPIO2.FIOCLR = 0xffffffff'u32 # turn off all
    LPC_GPIO2.FIOSET[i] = true

    i =
      if gotoLeft:
        if i == 7: 0
        else: i+1

      else:
        if i == 0: 7
        else: i - 1

    delay 1000 # sleep for 1 second


proc EINT3_IRQHandler() {.exportc.} =
  if LPC_GPIOINT.IO2IntStatR[11]:
    gotoLeft = not gotoLeft
    LPC_GPIOINT.IO2IntClr = 0xFFFFFFFF'u32

# ----------------------------------

proc main: cint {.exportc.} =
  systemInit()
  blinkLoop()

import std/[bitops]
import init, defs, helper

# --------------------------

var gotoLeft = false

proc blinkLoop =
  var i = 0

  while true:
    delay 1000 # sleep for 1 second

    pullup LPC_GPIO2.FIOCLR
    setBit LPC_GPIO2.FIOSET, i

    i =
      if gotoLeft:
        if i == 7: 0
        else: i+1

      else:
        if i == 0: 7
        else: i - 1


proc btnEventHandler() {.exportc: "EINT3_IRQHandler".} =
  if LPC_GPIOINT.IO2IntStatR[11]:
    gotoLeft = not gotoLeft
    pullup LPC_GPIOINT.IO2IntClr

# ----------------------------------

proc main: cint {.exportc.} =
  systemInit()
  blinkLoop()

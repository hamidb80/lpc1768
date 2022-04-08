import std/[bitops]
import internal/[init, defs], helper

# states -------------------

var gotoLeft = true
const 
  BTNi = 19
  LEDsi = 20 .. 23

# LED -----------------------

proc prepareLEDs =
  for li in LEDsi:
    P0.FIODIR[li] = 1

proc blinkLoop =
  var i = 0

  while true:
    P0.FIOSET[LEDsi[i]] = 1
    delay 500.MS
    P0.FIOCLR[LEDsi[i]] = 1

    i =
      if gotoLeft:
        if i == 3: 0
        else: i+1

      else:
        if i == 0: 3
        else: i-1

# interrupts --------------

proc prepareInterrupts =
  enableInterrupt EINT3_IRQn
  PIntr.IO0IntEnR[BTNi] = 1

proc btnEventHandler {.exportc: "EINT3_IRQHandler".} =
  # if PIntr.IO0IntStatR[BTNi]:
  gotoLeft = not gotoLeft
  pullup PIntr.IO0IntClr

# go ------------------------------

proc main: cint {.exportc.} =
  systemInit()
  prepareLEDs()
  prepareInterrupts()
  blinkLoop()

import internal/[init, defs], helper

# states -------------------

const
  BtnLeft = 16
  BtnRight = 17
  LEDsi = 20 .. 23

# LED -----------------------

proc prepareLEDs =
  for li in LEDsi:
    P0.FIODIR[li] = 1


# interrupts --------------
proc prepareInterrupts =
  enableInterrupt EINT3_IRQn
  PIntr.IO0IntEnR[BtnLeft] = 1
  PIntr.IO0IntEnR[BtnRight] = 1

var i = LEDsi.a

proc btnEventHandler {.exportc: "EINT3_IRQHandler".} =
  pullup P0.FIOCLR

  if PIntr.IO0IntStatR[BtnLeft]:
    if i - 1 in LEDsi:
      i -= 1

  elif PIntr.IO0IntStatR[BtnRight]:
    if i + 1 in LEDsi:
      i += 1

  delay 100.MS
  P0.FIOSET[i] = 1
  pullup PIntr.IO0IntClr

# go ------------------------------

proc main: cint {.exportc.} =
  systemInit()
  prepareLEDs()
  prepareInterrupts()

  P0.FIOSET[i] = 1

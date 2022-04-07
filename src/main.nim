import std/[bitops]
import internal/[init, defs], helper

# --------------------------

# var gotoLeft = false

# proc blinkLoop =
#   var i = 0

#   while true:
#     delay 100

#     pullup P2.FIOCLR
#     setBit P2.FIOSET, i

#     i =
#       if gotoLeft:
#         if i == 7: 0
#         else: i+1

#       else:
#         if i == 0: 7
#         else: i-1


# proc btnEventHandler() {.exportc: "EINT3_IRQHandler".} =
#   if LPC_GPIOINT.IO2IntStatR[11]:
#     gotoLeft = not gotoLeft
#     pullup LPC_GPIOINT.IO2IntClr

# proc turnOff() =
#   pullup P0.FIODIR
#   clear P0.FIOSET

# ----------------------------------

const LEDsi = 20 .. 23

proc prepare =
  for li in LEDsi:
    P0.FIODIR[li] = 1

proc main: cint {.exportc.} =
  systemInit()
  prepare()

  while true:
    for li in LEDsi:
      P0.FIOSET[li] = 1
      delay 1000.MS

      P0.FIOCLR[li] = 1
      delay 100.MS
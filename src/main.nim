import std/[bitops]
import internal/[init, defs], helper

# --------------------------

# var gotoLeft = false

# proc blinkLoop =
#   var i = 0

#   while true:
#     delay 50

#     pullup LPC_GPIO2.FIOCLR
#     setBit LPC_GPIO2.FIOSET, i

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

proc main: cint {.exportc.} =
  systemInit()
  # blinkLoop()
  # turnOff()
  const 
    B1 = 20
    B2 = 21
    B3 = 22
    B4 = 23
  
  P0.FIODIR[B1] = true
  P0.FIODIR[B2] = true
  P0.FIODIR[B3] = true
  P0.FIODIR[B4] = true

  while true:
    P0.FIOSET[B1] = true
    delay 100
    P0.FIOCLR[B1] = true
    delay 10
    P0.FIOSET[B2] = true
    delay 100
    P0.FIOCLR[B2] = true
    delay 10
    P0.FIOSET[B3] = true
    delay 100
    P0.FIOCLR[B3] = true
    delay 10
    P0.FIOSET[B4] = true
    delay 100
    P0.FIOCLR[B4] = true
    delay 10


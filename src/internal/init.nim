{.compile: "../../lib/system_LPC17xx.c".}

proc systemInit*() {.importc: "SystemInit", header: "../lib/system_LPC17xx.h".}

proc exit(status: int) {.exportc.} = discard

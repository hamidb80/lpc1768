{.compile: "./startup/system_LPC17xx.c".}

proc systemInit*() {.importc: "SystemInit", header: "startup/system_LPC17xx.h".}

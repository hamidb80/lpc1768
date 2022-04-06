# Package --------------------------
version       = "0.0.1"
author        = "hamidb80"
description   = "coding in lpc1768 in Nim"
license       = "MIT"
srcDir        = "src"
bin           = @["main"]


# Dependencies ---------------------
requires "nim >= 1.6.0"

# Tasks ----------------------------
task b, "build":
  if dirExists "./build":
    rmDir "./build"

  mkDir "./build"
  exec "nim c -o:./build/main.elf ./src/main.nim"
  exec "arm-none-eabi-objcopy.exe --change-address 0xE0000 -S -O ihex ./build/main.elf ./build/main.hex"

  rmFile "./build/main.elf"

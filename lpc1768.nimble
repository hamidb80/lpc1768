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
  exec "nim -f c -o:./build/main.elf ./src/main.nim"
  # exec "arm-none-eabi-objdump.exe -x --syms ./build/main.elf"
  exec "arm-none-eabi-objcopy.exe -O ihex ./build/main.elf ./build/main.hex"

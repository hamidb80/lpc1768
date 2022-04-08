# Package --------------------------
version       = "0.0.1"
author        = "hamidb80"
description   = "coding lpc1768 with Nim"
license       = "MIT"
srcDir        = "src"
bin           = @["main"]


# Dependencies ---------------------
requires "nim >= 1.6.0"

# Tasks ----------------------------
task b, "build":
  if dirExists "./build":
    rmDir "./build"

  exec "nim -f c ./src/main.nim"
  rmFile "./build/main.json"
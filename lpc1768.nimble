# Package --------------------------
version       = "0.0.1"
author        = "hamidb80"
description   = "coding lpc1768 with Nim"
license       = "MIT"
srcDir        = "src"
bin           = @["main"]
mode = Verbose


# Dependencies ---------------------
requires "nim >= 1.6.0"

# Tasks ----------------------------
import os
let projectSrc = readfile "./env/projectPath"

proc cpFileToFolder(fpath, folder: string) = 
  let dest = folder / extractFilename fpath
  
  if fileExists dest:
    rmFile dest
  
  cpfile fpath, folder / extractFilename fpath


task prepare, "copies initial files to the MCUExpresso project folder":
  for f in listFiles "./lib":
    cpFileToFolder f, "./build/"

task gen, "generates the c files":
  if dirExists "./build":
    rmDir "./build"

  exec "nim -f c ./src/main.nim"
  rmFile "./build/main.json"

task move, "copies compiled files to the MCUExpresso project folder":
  for f in listFiles "./build":
    cpFileToFolder f, projectSrc

task finalize, "does all the jobs":
  prepareTask()
  finalTask()
  moveTask()
# Ammonite Pad

Trying to find a way to have ensime and the ammonite repl coexist. This still seems a bit clumsy.

### Simple/Crude dev env model

- manually keep ammonite imports consistent with build.sbt
- keep ammnonite imports in PadPredef.sc
- keep "package" code in a single file (Pad.scala) and develop in with ensime
- For ammonite, cat PadPredef.sc and Pad.scal > Pad.sc
- load Pad.sc into ammonite via `amm -f Pad.sc`


### Basic core libs for common tasks

- http request
- json serialization
- ammonite ops for dir and file manipulation

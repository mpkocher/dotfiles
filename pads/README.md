# Scala Scratch Pads driven from Ensime


Requires: Ammonite 0.7.6

Hacky inital model using "scratch pads". Use ensime for the scala integration, then have a thin layer that loads the Pad.scala file into Ammonite with a companion predef. 


### Ensime


- Generate initial config using `sbt ensimeConfig`
- M-x ensime-start 
- run ammonite within asci-term in emacs. Start ammonite with a Pad specific predef.sc file and load Pad.scala via `import $file.Pad` from ammonite


### Better Model 

- directly have a interior process within emacs, then send the ammonite the direct buffer
- unclear: What is the expected behavior of `import $file.Example`, then edit the file, now reimport with `import $file.Example`. There's some caching that is preventing this model for working


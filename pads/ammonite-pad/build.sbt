name := "ammonitepad"

version := "0.1.0-SNAPSHOT"

scalaVersion := "2.11.8"

// Note, these deps need to be consistent with what is defined in 
// the Ammonite Predef file

libraryDependencies += "com.lihaoyi" % "ammonite" % "0.7.6" cross CrossVersion.full

libraryDependencies += "io.spray" % "spray-json_2.11" % "1.3.2"

// https://mvnrepository.com/artifact/org.scalaj/scalaj-http_2.11
libraryDependencies += "org.scalaj" % "scalaj-http_2.11" % "2.2.0"


// This is painfully slow to load
// use test:console to load ammonite from sbt
initialCommands in (Test, console) := """ammonite.Main().run()"""

import ammonite.ops._
import spray.json._
import scalaj.http._

import scala.util.{Try, Failure, Success}
import scala.concurrent.duration._
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global


object Example {

  // Demo to test if spray is imported
  def demo = { 
    val sx = "{\"id\": \"My-id\"}"
    val js = sx.parseJson
    js
  }

  // Demo to test Ammonite
  def demo2: Future[Int] = Future { 0 }

  // Demo to test scalaj
  def demo3 = Http("https://api.github.com/repos/scala/scala")
}

import ammonite.ops._
import spray.json._


object Example {

  def demo = { 
    val sx = "{\"id\": \"My-id\"}"
    val js = sx.parseJson
    js
  }
}

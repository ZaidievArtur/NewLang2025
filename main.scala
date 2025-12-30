import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.scala.DefaultScalaModule

case class Game(title: String, year: Int)

object Main {
  def main(args: Array[String]): Unit = {
    val mapper = new ObjectMapper()
    mapper.registerModule(DefaultScalaModule)

    val games = List(
      Game("The Witcher 3", 2015),
      Game("Elden Ring", 2022)
    )

    val jsonString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(games)
    
    println("Успешная конвертация:")
    println(jsonString)
  }
}
scoreUI <- function(id) {
  shiny::tagList(
    shiny::textOutput(shiny::NS(id, "home")),
    " - ",
    shiny::textOutput(shiny::NS(id, "guest"))
  )
}

scoreServer <- function(id, pairing) {
  shiny::moduleServer(id, function(input, output, session) {
    s <- shiny::reactive(score(pairing))
    output$home <- shiny::renderText(s()["home"])
    output$guest <- shiny::renderText(s()["guest"])
  })
}

scoreApp <- function(pairing = new("Pairing")) {
  ui <- shiny::fluidPage(
    scoreUI("x")
  )
  server <- function(input, output, session) {
    pairing <- methods::new("Pairing", home = new("Routine", endvalue = 10))
    scoreServer("x", pairing)
  }

  shiny::shinyApp(ui, server)
}

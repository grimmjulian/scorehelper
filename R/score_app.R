scoreUI <- function(id, team) {
  stopifnot(team %in% c("home", "guest"))
  shiny::tagList(
    shiny::textOutput(shiny::NS(id, team))
  )
}

scoreServer <- function(id, pairing) {
  shiny::moduleServer(id, function(input, output, session) {
    s <- shiny::reactive(score(pairing))
    output$home <- shiny::renderText(s()[1])
    output$guest <- shiny::renderText(s()[2])
  })
}

scoreApp <- function(pairing = new("Pairing")) {
  ui <- shiny::fluidPage(
    scoreUI("x", "home"),
    scoreUI("x", "guest")
  )
  server <- function(input, output, session) {
    pairing <- new("Pairing", home = new("Routine", endvalue = 10))
    scoreServer("x", pairing)
  }

  shiny::shinyApp(ui, server)
}

appUI <- function() {
  shiny::fluidPage(
    shiny::titlePanel(
      "Scorehelper by Julian"
    ),
    eventResultUI("event")
  )
}

appServer <- function(input, output, session) {
  eventResultServer("event")
}

app <- function(...) {
  ui <- appUI()
  server <- appServer
  shiny::shinyApp(ui, server)
}

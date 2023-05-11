app <- function(...) {
  ui <- shiny::fluidPage(
    shiny::titlePanel(
      "Scorehelper by Julian"
    ),
    eventResultUI("event")
  )

  server <- function(input, output, session) {
    eventResultServer("event")
  }

  shiny::shinyApp(ui, server)
}

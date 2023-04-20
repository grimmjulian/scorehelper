app <- function(...) {
  ui <- shiny::fluidPage(
    shiny::titlePanel(
      "Scorehelper by Julian"
    ),
    eventResultUI("test")
  )

  server <- function(input, output, session) {
    eventResultServer("test")
  }

  shiny::shinyApp(ui, server)
}

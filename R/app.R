library(shiny)
app <- function(...) {
  ui <- fluidPage(
    titlePanel(
      "Scorehelper by Julian"
    ),
    routineResultUI("test"),
    pairingResultUI("test2")
  )

  server <- function(input, output, session) {
    routineResultServer("test")
    pairingResultServer("test2")
  }

  shinyApp(ui, server)
}

library(shiny)
app <- function(...) {
  ui <- fluidPage(
    titlePanel(
      "Scorehelper by Julian"
    ),
    routineResultUI("test"),
  )

  server <- function(input, output, session) {
    routineResultServer("test")
  }

  shinyApp(ui, server)
}

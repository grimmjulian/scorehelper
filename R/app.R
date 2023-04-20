library(shiny)
app <- function(...) {
  ui <- fluidPage(
    titlePanel(
      "Scorehelper by Julian"
    ),
    eventResultUI("test")
  )

  server <- function(input, output, session) {
    eventResultServer("test")
  }

  shinyApp(ui, server)
}

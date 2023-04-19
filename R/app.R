library(shiny)
app <- function(...) {
  ui <- fluidPage(
    dataTableOutput("event")
  )
  server <- function(input, output, session) {
    output$event <- renderDataTable(as.data.frame(new("Event")))
  }

  shinyApp(ui, server)
}

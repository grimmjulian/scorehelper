debugApp <- function(ui_module, server_module) {
  function() {
    ui <- shiny::fluidPage(
      ui_module("x"),
      shiny::verbatimTextOutput("y")
    )
    server <- function(input, output, session) {
      a <- server_module("x")
      output$y <- shiny::renderPrint({
        a()
      })
    }
    shiny::shinyApp(ui, server)
  }
}

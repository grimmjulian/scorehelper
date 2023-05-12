library(shiny)

ui <- fluidPage(
  textInput("name", "Whats your name"),
  textOutput("greeting"),
  numericInput("min", "Minimum", 0),
  sliderInput("n", "n", min = 0, max = 3, value = 1)
)
server <- function(input, output, session) {
  string <- reactive(paste0("Hello ", input$name))
  output$greeting <- renderText(string())
  observeEvent(input$name, {
    message("Greeting performed")
  })
  observeEvent(input$min, {
    updateSliderInput(inputId = "n", min = input$min)
  })
}

shinyApp(ui, server)

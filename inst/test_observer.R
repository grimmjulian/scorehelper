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

ui <- fluidPage(
  numericInput("x", "x", value = 9999, step = 1),
)
server <- function(input, output, session) {
  observeEvent(input$x,
    {
      if (!is.numeric(input$x)) {
        updateNumericInput(session, "x", value = 0)
      }
    },
    ignoreInit = TRUE
  )
}

shinyApp(ui, server)

ui_module <- function(id) {
  shiny::tagList(
    numericInput(shiny::NS(id, "x"), "x", value = 9999, step = 1),
  )
}
ui <- fluidPage(
  ui_module("test")
)

server_module <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    observeEvent(input$x,
      {
        if (!is.numeric(input$x)) {
          updateNumericInput(session, "x", value = 0)
        }
      },
      ignoreInit = TRUE
    )
  })
}
server <- function(input, output, session) {
  server_module("test")
}

shinyApp(ui, server)

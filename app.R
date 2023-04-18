library(shiny)
ui <- fluidPage(
  "This is a routine",
  routineUI("test"),
  textOutput("gymnast"),
  textOutput("routine")
)
server <- function(input, output, session) {
  gymnast <- reactive(
    new("Gymnast", id = 1, name = input$gymnast, birthday = as.Date(NA))
  )
  routine <- reactive(
    new("Routine",
      gymnast = gymnast(),
      dvalue = input$dvalue,
      evalue = input$endvalue - input$dvalue
    )
  )
  output$routine <- renderPrint({
    routine()
  })
}

shinyApp(ui, server)

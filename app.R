
library(shiny)

ui <- fluidPage(
	competition_ui("competition")
)

server <- function(input, output, session) {
}

shinyApp(ui, server)

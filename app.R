ui <- shiny::fluidPage(
	competition_ui("competition")
)

server <- function(input, output, session) {
	competition_server("competition")
}

shiny::shinyApp(ui, server)

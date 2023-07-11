appUI <- function() {
  shiny::fluidPage(
    shiny::titlePanel(
      "Scorehelper by Julian"
    ),
    shiny::tabsetPanel(
      shiny::tabPanel("competition", competitionUI("comp")),
      shiny::tabPanel("teams", "Hier kommen Daten zu einer Mannschaft bzw Turner hin.")
    )
  )
}

appServer <- function(input, output, session) {
  # eventResultServer("event")
  competitionServer("comp")
}

app <- function(...) {
  ui <- appUI()
  server <- appServer
  shiny::shinyApp(ui, server)
}

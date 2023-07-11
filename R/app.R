appUI <- function() {
  shiny::fluidPage(
    shiny::titlePanel(
      "Scorehelper by Julian"
    ),
    shiny::tabsetPanel(
      shiny::tabPanel("competition", competitionInputUI("comp")),
      shiny::tabPanel("teams", "Hier kommen Daten zu einer Mannschaft bzw Turner hin.")
    )
  )
}

appServer <- function(input, output, session) {
  # eventResultServer("event")
  competitionInputServer("comp")
}

app <- function(...) {
  ui <- appUI()
  server <- appServer
  shiny::shinyApp(ui, server)
}

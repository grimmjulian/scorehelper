eventScoreUI <- function(id) {
  shiny::fluidRow(
    shiny::column(3, ""),
    shiny::column(2, "Summe"),
    shiny::column(1, scoreUI(shiny::NS(id, "score_home"))),
    shiny::column(3, ""),
    shiny::column(2, "Summe"),
    shiny::column(1, scoreUI(shiny::NS(id, "score_guest")))
  )
}

eventPairingsUI <- function(id) {
  shiny::tagList(
    pairingResultUI(shiny::NS(id, "first")),
    pairingResultUI(shiny::NS(id, "second")),
    pairingResultUI(shiny::NS(id, "third")),
    pairingResultUI(shiny::NS(id, "fourth"))
  )
}

eventResultUI <- function(id, home_starts = TRUE) {
  shiny::tagList(
    pairingHeaderUI(),
    eventPairingsUI(id),
    eventScoreUI(id),
    shiny::checkboxInput(shiny::NS(id, "home_starts"), "Heim beginnt", home_starts)
  )
}

eventResultServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    event <- shiny::reactive(
      Event.pairings(
        list(
          pairingResultServer("first", input$home_starts)(),
          pairingResultServer("second", input$home_starts)(),
          pairingResultServer("third", !input$home_starts)(),
          pairingResultServer("fourth", !input$home_starts)()
        )
      )
    )
    s <- shiny::reactive(score(event()))
    output$score_home <- shiny::renderText(s()[1])
    output$score_guest <- shiny::renderText(s()[2])
    return(event)
  })
}

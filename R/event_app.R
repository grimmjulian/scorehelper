#' @include debug_app.R

teamScoreUI <- function(id) {
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(6, ""),
      shiny::column(4, "Summe"),
      shiny::column(2, scoreUI(id))
    )
  )
}

eventScoreUI <- function(id) {
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(6, teamScoreUI(shiny::NS(id, "home"))),
      shiny::column(6, teamScoreUI(shiny::NS(id, "guest")))
    )
  )
}

eventScoreServer <- function(id, event = new("Event")) {
  shiny::moduleServer(id, function(input, output, session) {
    s <- shiny::reactive(score(event))
    output$home <- shiny::renderText(s()[1])
    output$guest <- shiny::renderText(s()[2])
    return(s)
  })
}

eventScoreApp <- debugApp(eventScoreUI, eventScoreServer)

eventPairingsUI <- function(id) {
  shiny::tagList(
    pairingResultUI(shiny::NS(id, "first")),
    pairingResultUI(shiny::NS(id, "second")),
    pairingResultUI(shiny::NS(id, "third")),
    pairingResultUI(shiny::NS(id, "fourth"))
  )
}

eventResultUI <- function(id) {
  shiny::tagList(
    eventPairingsUI(id),
    eventScoreUI(shiny::NS(id, "score")),
  )
}

eventResultServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    event <- shiny::reactive(
      Event.pairings(
        list(
          pairingResultServer("first")(),
          pairingResultServer("second")(),
          pairingResultServer("third")(),
          pairingResultServer("fourth")()
        )
      )
    )
    eventScoreServer("score", event())
    return(event)
  })
}

eventResultApp <- debugApp(eventResultUI, eventResultServer)

scoreUI <- function(id) {
  shiny::textOutput(id)
}

pairingHeaderUI <- function() {
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(1, ""),
      shiny::column(4, routineHeaderUI()),
      shiny::column(1, "Sc"),
      shiny::column(1, ""),
      shiny::column(4, routineHeaderUI()),
      shiny::column(1, "Sc")
    )
  )
}

beginsUI <- function(id) {
  shiny::textOutput(shiny::NS(id, "indicator_begins"))
}

beginsServer <- function(id, starts) {
  shiny::moduleServer(id, function(input, output, session) {
    if (starts) {
      output$indicator_begins <- shiny::renderText("X")
    } else {
      output$indicator_begins <- shiny::renderText("O")
    }
  })
}

pairingResultUI <- function(id) {
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(1, beginsUI(shiny::NS(id, "home_starts"))),
      shiny::column(4, routineResultUI(shiny::NS(id, "home"))),
      shiny::column(1, scoreUI(shiny::NS(id, "score_home"))),
      shiny::column(1, beginsUI(shiny::NS(id, "guest_starts"))),
      shiny::column(4, routineResultUI(shiny::NS(id, "guest"))),
      shiny::column(1, scoreUI(shiny::NS(id, "score_guest")))
    )
  )
}

pairingResultServer <- function(id, home_starts = TRUE) {
  shiny::moduleServer(id, function(input, output, session) {
    routine_home <- routineResultServer("home")
    routine_guest <- routineResultServer("guest")
    pairing <- shiny::reactive(methods::new("Pairing", home = routine_home(), guest = routine_guest(), home_starts = home_starts))
    s <- shiny::reactive(score(pairing()))
    output$score_home <- shiny::renderText(s()[1])
    output$score_guest <- shiny::renderText(s()[2])
    beginsServer("home_starts", home_starts)
    beginsServer("guest_starts", !home_starts)
    return(pairing)
  })
}

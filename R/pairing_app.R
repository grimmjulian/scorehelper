pairingResultUI <- function(id) {
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(1, beginsUI(shiny::NS(id, "starts"))),
      shiny::column(4, routineResultUI(shiny::NS(id, "home"))),
      shiny::column(1, scoreUI(shiny::NS(id, "score"), "home")),
      shiny::column(4, routineResultUI(shiny::NS(id, "guest"))),
      shiny::column(1, scoreUI(shiny::NS(id, "score"), "guest"))
    )
  )
}

pairingResultServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    home <- routineResultServer("home")
    guest <- routineResultServer("guest")
    pairing <- shiny::reactive(methods::new("Pairing", home = home(), guest = guest()))
    shiny::observeEvent(pairing(), {
      beginsServer("starts", pairing())
      scoreServer("score", pairing())
    })
    return(pairing)
  })
}

pairingResultApp <- debugApp(pairingResultUI, pairingResultServer)

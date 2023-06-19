pairingInputUI <- function(id) {
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(1, beginsUI(shiny::NS(id, "starts"))),
      shiny::column(4, routineInputUI(shiny::NS(id, "home"))),
      shiny::column(1, scoreUI(shiny::NS(id, "score"), "home")),
      shiny::column(4, routineInputUI(shiny::NS(id, "guest"))),
      shiny::column(1, scoreUI(shiny::NS(id, "score"), "guest"))
    )
  )
}

pairingInputServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    home <- routineInputServer("home")
    guest <- routineInputServer("guest")
    pairing <- shiny::reactive(methods::new("Pairing", home = home(), guest = guest()))
    shiny::observeEvent(pairing(), {
      beginsServer("starts", pairing())
      scoreServer("score", pairing())
    })
    return(pairing)
  })
}

pairingInputApp <- debugApp(pairingInputUI, pairingInputServer)

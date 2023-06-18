pairingResultUI <- function(id) {
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(1, beginsUI(shiny::NS(id, "starts"))),
      shiny::column(4, routineResultUI(shiny::NS(id, "home"))),
      shiny::column(4, routineResultUI(shiny::NS(id, "guest"))),
    )
  )
}

pairingResultServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    home <- routineResultServer("home")
    guest <- routineResultServer("guest")
    pairing <- shiny::reactive(methods::new("Pairing", home = home(), guest = guest()))
    beginsServer("starts", pairing())
    return(pairing)
  })
}

pairingResultApp <- debugApp(pairingResultUI, pairingResultServer)

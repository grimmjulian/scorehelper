pairingLayout <- function(...) {
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(1, ...elt(1)),
      shiny::column(4, ...elt(2)),
      shiny::column(1, ...elt(3)),
      shiny::column(4, ...elt(4)),
      shiny::column(1, ...elt(5))
    )
  )
}

pairingInputUI <- function(id) {
  pairingLayout(
    beginsUI(shiny::NS(id, "starts")),
    routineInputUI(shiny::NS(id, "home")),
    scoreUI(shiny::NS(id, "score"), "home"),
    routineInputUI(shiny::NS(id, "guest")),
    scoreUI(shiny::NS(id, "score"), "guest")
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

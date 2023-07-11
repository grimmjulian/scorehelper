#' @include debug_app.R

eventInputUI <- function(id) {
  shiny::tagList(
    pairingInputUI(shiny::NS(id, "first")),
    pairingInputUI(shiny::NS(id, "second")),
    pairingInputUI(shiny::NS(id, "third")),
    pairingInputUI(shiny::NS(id, "fourth"))
  )
}

eventInputServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    pairingInputServer("first")
    pairingInputServer("second")
    pairingInputServer("third")
    pairingInputServer("fourth")
  })
}

eventUI <- function(id, event = "event") {
  shiny::tagList(
    htmltools::h3(event),
    eventInputUI(shiny::NS(id, "input"))
  )
}

eventServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    eventInputServer("input")
  })
}

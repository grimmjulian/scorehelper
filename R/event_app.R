#' @include debug_app.R

eventInputUI <- function(id) {
  shiny::tagList(
    pairingInputUI(shiny::NS(id, "first")),
    pairingInputUI(shiny::NS(id, "second")),
    pairingInputUI(shiny::NS(id, "third")),
    pairingInputUI(shiny::NS(id, "fourth"))
  )
}

eventInputServer <- function(id, value = methods::new("Event")) {
  shiny::moduleServer(id, function(input, output, session) {
    pairingInputServer("first", value = value[[1]])
    pairingInputServer("second", value = value[[2]])
    pairingInputServer("third", value = value[[3]])
    pairingInputServer("fourth", value = value[[4]])
  })
}

eventResultUI <- function(id) {
  pairingLayout("",
  routineResultUI(shiny::NS(id, "home")),
  "SCORE HOME",
  routineResultUI(shiny::NS(id, "guest")),
  "SCORE GUEST")
}

eventResultServer <- function(id, value = methods::new("Event")) {
  shiny::moduleServer(id, function(input, output, session) {

  })
}


eventUI <- function(id, event = "event") {
  shiny::tagList(
    htmltools::h3(event),
    eventInputUI(shiny::NS(id, "input")),
    eventResultUI(shiny::NS(id, "result"))
  )
}

eventServer <- function(id, value = methods::new("Event")) {
  shiny::moduleServer(id, function(input, output, session) {
    eventInputServer("input", value = value)
    eventResultServer("result", value = value)
  })
}

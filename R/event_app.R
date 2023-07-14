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
    shiny::reactive(Event.pairings(list(
      pairingInputServer("first", value = value[[1]])(),
      pairingInputServer("second", value = value[[2]])(),
      pairingInputServer("third", value = value[[3]])(),
      pairingInputServer("fourth", value = value[[4]])()
    )))
  })
}

routineResultUI <- function(id) {
  gymnast <- "Summe"
  dvalue <- "dvalue"
  endvalue <- "endvalue"
  routineLayout(gymnast, dvalue, endvalue)
}

routineResultServer <- function(id, value = list(new("Routine"))) {
  shiny::moduleServer(id, function(input, output, session) {
  })
}

eventResultUI <- function(id, value = new("Event")) {
  pairingLayout(
    "",
    routineResultUI(shiny::NS(id, "home")),
    scoreUI(shiny::NS(id, "score"), "home"),
    routineResultUI(shiny::NS(id, "guest")),
    scoreUI(shiny::NS(id, "score"), "guest")
  )
}

eventResultServer <- function(id, value = methods::new("Event")) {
  shiny::moduleServer(id, function(input, output, session) {
    scoreServer("score", value)
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
    e <- eventInputServer("input", value = value)
    shiny::observeEvent(e(), {
      eventResultServer("result", value = e())
    })
  })
}

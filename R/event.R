#' @include pairing.R

#' An S4 class that stores all pairings for an event.
#'
#' @slot first The first pairing
#' @slot second The second pairing
#' @slot third The third pairing
#' @slot fourth The fourth pairing
#' @export

methods::setClass(
  "Event",
  slots = c(
    first = "Pairing",
    second = "Pairing",
    third = "Pairing",
    fourth = "Pairing"
  ),
  prototype = list(
    first = new("Pairing"),
    second = new("Pairing"),
    third = new("Pairing"),
    fourth = new("Pairing")
  )
)

methods::setMethod("as.data.frame", "Event", function(x) {
  rbind(
    as.data.frame(x@first),
    as.data.frame(x@second),
    as.data.frame(x@third),
    as.data.frame(x@fourth)
  )
})

#' Calculate the score result of an event
#' @param x An object to calculate the score from
methods::setMethod("score", "Event", function(x) {
  score(x@first) + score(x@second) + score(x@third) + score(x@fourth)
})

methods::setMethod("as.list", "Event", function(x) {
  list(x@first, x@second, x@third, x@fourth)
})

scoreEventUI <- function(id) {
    shiny::fluidRow(
                    shiny::column(5, "Summe"),
                    shiny::column(1, scoreUI(shiny::NS(id, "score_home"))),
                    shiny::column(5, "Summe"),
                    shiny::column(1, scoreUI(shiny::NS(id, "score_guest")))
    )

}
eventResultUI <- function(id) {
  shiny::tagList(
    pairingResultUI(shiny::NS(id, "first")),
    pairingResultUI(shiny::NS(id, "second")),
    pairingResultUI(shiny::NS(id, "third")),
    pairingResultUI(shiny::NS(id, "fourth")),
    scoreEventUI(id)
  )
}

eventResultServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    event <- shiny::reactive(new("Event",
      first = pairingResultServer("first")(),
      second = pairingResultServer("second")(),
      third = pairingResultServer("third")(),
      fourth = pairingResultServer("fourth")()
    ))
    s <- shiny::reactive(score(event()))
    output$score_home <- shiny::renderText(s()[1])
    output$score_guest <- shiny::renderText(s()[2])
    return(event)
  })
}

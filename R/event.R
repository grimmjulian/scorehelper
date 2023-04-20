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

eventScoreUI <- function(id) {
    shiny::fluidRow(
                    shiny::column(3, ""),
                    shiny::column(2, "Summe"),
                    shiny::column(1, scoreUI(shiny::NS(id, "score_home"))),
                    shiny::column(3, ""),
                    shiny::column(2, "Summe"),
                    shiny::column(1, scoreUI(shiny::NS(id, "score_guest")))
    )

}

eventResultUI <- function(id, home_starts = TRUE) {
  shiny::tagList(
                 pairingHeaderUI(),
    pairingResultUI(shiny::NS(id, "first")),
    pairingResultUI(shiny::NS(id, "second")),
    pairingResultUI(shiny::NS(id, "third")),
    pairingResultUI(shiny::NS(id, "fourth")),
    eventScoreUI(id),
    shiny::checkboxInput(shiny::NS(id, "home_starts"), "Heim beginnt", TRUE)
  )
}

eventResultServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    event <- shiny::reactive(methods::new("Event",
      first = pairingResultServer("first", input$home_starts)(),
      second = pairingResultServer("second", input$home_starts)(),
      third = pairingResultServer("third", !input$home_starts)(),
      fourth = pairingResultServer("fourth", !input$home_starts)()
    ))
    s <- shiny::reactive(score(event()))
    output$score_home <- shiny::renderText(s()[1])
    output$score_guest <- shiny::renderText(s()[2])
    return(event)
  })
}

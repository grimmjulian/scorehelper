#' @include routine.R

#' An S4 class for a pairing of routines
#' @slot home Routine of the home team
#' @slot guest Routine of the guest team
#' @export

methods::setClass(
  "Pairing",
  slots = c(
    home = "Routine",
    guest = "Routine"
  ),
  prototype = list(
    home = new("Routine"),
    guest = new("Routine")
  )
)

#' Calculate the score result of a pairing
#' @param x An object to calculate the score from
methods::setMethod("score", "Pairing", function(x) {
  calc_score(home = x@home@endvalue, guest = x@guest@endvalue)
})

methods::setMethod("as.data.frame", "Pairing", function(x) {
  home <- as.data.frame(x@home)
  guest <- as.data.frame(x@guest)
  s <- score(x)
  df <- cbind(home, score = s[1], guest, score = s[2])
  colnames(df)[1:4] <- paste0(colnames(df)[1:4], "_home")
  colnames(df)[5:8] <- paste0(colnames(df)[5:8], "_guest")
  df
})

scoreUI <- function(id) {
  shiny::textOutput(id)
}

pairingResultUI <- function(id) {
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(5, routineResultUI(shiny::NS(id, "home"))),
      shiny::column(1, scoreUI(shiny::NS(id, "score_home"))),
      shiny::column(5, routineResultUI(shiny::NS(id, "guest"))),
      shiny::column(1, scoreUI(shiny::NS(id, "score_guest")))
    )
  )
}

pairingResultServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    routine_home <- routineResultServer("home")
    routine_guest <- routineResultServer("guest")
    pairing <- shiny::reactive(new("Pairing", home = routine_home(), guest = routine_guest()))
    s <- shiny::reactive(score(pairing()))
    output$score_home <- shiny::renderText(s()[1])
    output$score_guest <- shiny::renderText(s()[2])
    return(pairing)
  })
}

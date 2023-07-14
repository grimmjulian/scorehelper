competitionInputUI <- function(id) {
  shiny::tagList(
    eventUI(shiny::NS(id, "floor"), "Boden"),
    eventUI(shiny::NS(id, "pommel_horse"), "Seitpferd"),
    eventUI(shiny::NS(id, "still_rings"), "Ringe"),
    eventUI(shiny::NS(id, "vault"), "Sprung"),
    eventUI(shiny::NS(id, "parallel_bars"), "Barren"),
    eventUI(shiny::NS(id, "horizontal_bar"), "Reck"),
  )
}

competitionInputServer <- function(id, value = Competition()) {
  shiny::moduleServer(id, function(input, output, session) {
    eventServer("floor", value = value@floor)
    eventServer("pommel_horse", value = value@pommel_horse)
    eventServer("still_rings", value = value@still_rings)
    eventServer("vault", value = value@vault)
    eventServer("parallel_bars", value = value@parallel_bars)
    eventServer("horizontal_bar", value = value@horizontal_bar)
  })
}

fmt_result <- function(x, FUN) {
  sprintf("%s : %s", FUN(x)[["home"]], FUN(x)[["guest"]])
}

fmt_score_result <- function(x) {
  fmt_result(x, score)
}

fmt_event_score_result <- function(x) {
  fmt_result(x, event_score)
}

competitionScoreResultUI <- function(id) {
  shiny::tagList(
    htmltools::h1(
      shiny::textOutput(shiny::NS(id, "result"))
    )
  )
}

competitionScoreResultServer <- function(id, value = new("Competition")) {
  shiny::moduleServer(id, function(input, output, session) {
    output$result <- shiny::renderText(fmt_score_result(value))
  })
}

competitionEventScoreResultUI <- function(id) {
  shiny::tagList(
    htmltools::h2(
      shiny::textOutput(shiny::NS(id, "result"))
    )
  )
}

competitionEventScoreResultServer <- function(id, value = new("Competition")) {
  shiny::moduleServer(id, function(input, output, session) {
    output$result <- shiny::renderText(fmt_event_score_result(value))
  })
}

competitionResultUI <- function(id) {
  shiny::tagList(
    competitionScoreResultUI(shiny::NS(id, "score")),
    competitionEventScoreResultUI(shiny::NS(id, "event_score"))
  )
}

competitionResultServer <- function(id, value = new("Competition")) {
  shiny::moduleServer(id, function(input, output, session) {
    competitionScoreResultServer("score", value = value)
    competitionEventScoreResultServer("event_score", value = value)
  })
}

competitionUI <- function(id) {
  shiny::tagList(
    competitionResultUI(shiny::NS(id, "result")),
    competitionInputUI(shiny::NS(id, "input"))
  )
}

competitionServer <- function(id, value = Competition()) {
  shiny::moduleServer(id, function(input, output, session) {
    competitionResultServer("result", value = value)
    competitionInputServer("input", value = value)
  })
}

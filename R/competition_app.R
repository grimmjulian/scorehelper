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

competitionScoreResultUI <- function(id) {
  shiny::tagList(
    htmltools::h1(
      shiny::textOutput(shiny::NS(id, "result"))
    )
  )
}

competitionScoreResultServer <- function(id, value = new("Competition")) {
  shiny::moduleServer(id, function(input, output, session) {
    output$result <- shiny::renderText(sprintf("%s : %s", score(value)[["home"]], score(value)[["guest"]]))
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
    output$result <- shiny::renderText(sprintf(
      "%s : %s",
      event_score(value)[["home"]],
      event_score(value)[["guest"]]
    ))
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

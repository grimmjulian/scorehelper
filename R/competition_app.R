competitionInputUI <- function(id) {
  shiny::tagList(
    "Team Info Heim vs. Team Info Gast",
    htmltools::br(),
    "Sorce Heim : Score Gast",
    htmltools::br(),
    "Geräte Punkte Heim : Geräte Punkte Gast",
    htmltools::br(),
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

competitionInputUI <- function(id) {
  shiny::tagList(
    "Team Info Heim vs. Team Info Gast",
    htmltools::br(),
    "Sorce Heim : Score Gast",
    htmltools::br(),
    "Geräte Punkte Heim : Geräte Punkte Gast",
    htmltools::br(),
    htmltools::h3("Boden"),
    "Ergebnis",
    htmltools::h3("Seitpferd"),
    "Ergebnis",
    htmltools::h3("Ringe"),
    "Ergebnis",
    htmltools::h3("Sprung"),
    "Ergebnis",
    htmltools::h3("Barren"),
    "Ergebnis",
    htmltools::h3("Reck"),
    "Ergebnis",
  )
}

competitionInputServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {

  })
}

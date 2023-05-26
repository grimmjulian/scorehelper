beginsUI <- function(id) {
  shiny::textOutput(shiny::NS(id, "indicator_begins"))
}

beginsServer <- function(id, pairing) {
  starts <- home_starts(pairing)
  shiny::moduleServer(id, function(input, output, session) {
    if (starts) {
      output$indicator_begins <- shiny::renderText("X")
    } else {
      output$indicator_begins <- shiny::renderText("O")
    }
  })
}

beginsUI <- function(id) {
  shiny::textOutput(shiny::NS(id, "indicator_begins"))
}

beginsServer <- function(id, pairing) {
  shiny::moduleServer(id, function(input, output, session) {
    starts <- shiny::reactive(home_starts(pairing))
    output$indicator_begins <- shiny::renderText(beginning_indicator(starts()))
  })
}

beginning_indicator <- function(begins = TRUE) {
  if (begins) {
    return("\nX")
  } else {
    return("")
  }
}

valueInputUI <- function(id, max, step) {
  shiny::tagList(
    shiny::numericInput(
      shiny::NS(id, "x"),
      "",
      value = 0,
      step = step,
      min = 0,
      max = max
    )
  )
}

dvalueInputUI <- function(id) {
  valueInputUI(id, max = 10, step = 0.1)
}

endvalueInputUI <- function(id) {
  valueInputUI(id, max = 20, step = 0.05)
}

valueInputServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    tryCatch(shiny::reactive(input$x),
      error = function(e) 0
    )
  })
}

valueInputApp <- debugApp(dvalueInputUI, valueInputServer)

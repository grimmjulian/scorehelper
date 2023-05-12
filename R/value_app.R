valueUI <- function(id, max, step) {
  shiny::numericInput(
    shiny::NS(id, "value"),
    value = 0,
    min = 0,
    max = max,
    step = step,
    label = ""
  )
}

dvalueUI <- function(id) {
  valueUI(id, max = 10, step = 0.1)
}

endvalueUI <- function(id) {
  valueUI(id, max = 20, step = 0.05)
}

valueServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    value <- shiny::reactive(input$value)
    return(value)
  })
}

valueApp <- debugApp(dvalueUI, valueServer)

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

controll_numericInput <- function(input, id, session) {
  shiny::observeEvent(input[[id]],
    {
      if (!is.numeric(input[[id]])) {
        shiny::updateNumericInput(session, id, value = 0)
      }
    },
    ignoreInit = TRUE
  )
}

valueInputServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    controll_numericInput(input, "x", session)
    value <- shiny::reactive(input$x)
    return(value)
  })
}

valueInputApp <- debugApp(dvalueInputUI, valueInputServer)

gymnastNameInputUI <- function(id) {
  shiny::textInput(
    shiny::NS(id, "gymnastname"),
    label = ""
  )
}

gymnastNameInputServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    gymnast <- shiny::reactive(methods::new("Gymnast",
      name = input$gymnastname
    ))
    return(gymnast)
  })
}

gymnastNameInputApp <- debugApp(gymnastNameInputUI, gymnastNameInputServer)

gymnastNameUI <- function(id) {
  shiny::textInput(
    shiny::NS(id, "gymnastname"),
    label = ""
  )
}

gymnastNameServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    gymnast <- shiny::reactive(methods::new("Gymnast",
      name = input$gymnastname
    ))
    return(gymnast)
  })
}

gymnastNameApp <- debugApp(gymnastNameUI, gymnastNameServer)

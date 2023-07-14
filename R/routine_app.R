routineLayout <- function(gymnast, dvalue, endvalue) {
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(6, gymnast),
      shiny::column(3, dvalue),
      shiny::column(3, endvalue)
    )
  )
}

routineHeader <- function() {
  routineLayout("Turner", "D-Note", "Endwert")
}

routineInputUI <- function(id) {
  gymnastname <- gymnastNameInputUI(shiny::NS(id, "gymnastname"))
  dvalue <- dvalueInputUI(shiny::NS(id, "dvalue"))
  endvalue <- endvalueInputUI(shiny::NS(id, "endvalue"))
  routineLayout(gymnastname, dvalue, endvalue)
}

routineInputServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    routine <- shiny::reactive(methods::new("Routine",
      gymnast = gymnastNameInputServer("gymnastname")(),
      dvalue = valueInputServer("dvalue")(),
      endvalue = valueInputServer("endvalue")()
    ))
    return(routine)
  })
}

routineInputApp <- debugApp(routineInputUI, routineInputServer)

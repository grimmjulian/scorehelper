routineTableUI <- function(gymnast, dvalue, endvalue) {
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(6, gymnast),
      shiny::column(3, dvalue),
      shiny::column(3, endvalue)
    )
  )
}

routineHeaderUI <- function() {
  routineTableUI("Turner", "D-Note", "Endwert")
}

routineResultUI <- function(id) {
  gymnastname <- gymnastNameUI(shiny::NS(id, "gymnastname"))
  dvalue <- dvalueUI(shiny::NS(id, "dvalue"))
  endvalue <- endvalueUI(shiny::NS(id, "endvalue"))
  routineTableUI(gymnastname, dvalue, endvalue)
}

routineResultServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    routine <- shiny::reactive(methods::new("Routine",
      gymnast = gymnastNameServer("gymnastname")(),
      dvalue = valueServer("dvalue")(),
      endvalue = valueServer("endvalue")()
    ))
    return(routine)
  })
}

routineResultApp <- debugApp(routineResultUI, routineResultServer)

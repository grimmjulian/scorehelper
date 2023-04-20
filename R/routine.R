#' @include gymnast.R

#' An S4 class that stores a routinge
#' @slot gymnast A gymnast object
#' @slot dvalue Numeric dvalue
#' @slot endvalue Numeric endvalue
#' @export

methods::setClass(
  "Routine",
  slots = c(
    gymnast = "Gymnast",
    dvalue = "numeric",
    endvalue = "numeric"
  ),
  prototype = list(
    gymnast = new("Gymnast"),
    dvalue = 0,
    endvalue = 0
  )
)

methods::setGeneric("as.data.frame")

methods::setMethod("as.data.frame", "Routine", function(x) {
  data.frame(
    "gymnast" = x@gymnast@name,
    "dvalue" = x@dvalue,
    "endvalue" = x@endvalue
  )
})

valueUI <- function(id, max, step) {
  shiny::numericInput(shiny::NS(id, "value"),
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
    if (!is.numeric(value())) {
      value <- function() 0
    }
    return(value)
  })
}

routineHeaderUI <- function() {
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(6, "Turner"),
      shiny::column(3, "D-Note"),
      shiny::column(3, "Endwert")
    )
  )
}

routineResultUI <- function(id) {
  gymnastname <-
    shiny::textInput(shiny::NS(id, "gymnastname"),
      label = ""
    )
  dvalue <- dvalueUI(shiny::NS(id, "dvalue"))
  endvalue <- endvalueUI(shiny::NS(id, "endvalue"))
  shiny::tagList(
    shiny::fluidRow(
      shiny::column(6, gymnastname),
      shiny::column(3, dvalue),
      shiny::column(3, endvalue)
    )
  )
}

routineResultServer <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    gymnast <- shiny::reactive(new("Gymnast", name = input$gymnastname))
    routine <- shiny::reactive(new("Routine",
      gymnast = gymnast(),
      dvalue = valueServer("dvalue")(),
      endvalue = valueServer("endvalue")()
    ))
    return(routine)
  })
}

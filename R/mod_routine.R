#' @include routine.R

gymnast_input <- function(inputID) { # nolint: object_name_linter.
	shiny::textInput(inputID, "", "Gymnast")
}

value_input <- function(inputID) { # nolint: object_name_linter.
	shiny::numericInput(inputID, "", 0, min = 0, max = 20, step = 0.05)
}

routine_ui <- function(id) {
	ns <- shiny::NS(id)
	gymnast_width <- 4
	value_width <- floor((12 - gymnast_width) / 2)
	shiny::tagList(
		shiny::fluidRow(
			shiny::column(gymnast_width, gymnast_input(ns("gymnast"))),
			shiny::column(value_width, value_input(ns("d_value"))),
			shiny::column(value_width, value_input(ns("end_value")))
		)
	)
}

routine_server <- function(id) {
	shiny::moduleServer(id, function(input, output, session) {
		r <- routine( # nolint: object_usage_linter.
			gymnast = input$gymnast,
			d_value = input$d_value,
			end_value = input$end_value
		) |>
			shiny::reactive()
		return(r)
	})
}

team_routines_ui <- function(id, title) {
	ns <- shiny::NS(id)
	shiny::tagList(
		shiny::column(
			12,
			list(
		shiny::fluidRow(shiny::h3(title)),
				shiny::fluidRow(routine_ui(ns("r1"))),
				shiny::fluidRow(routine_ui(ns("r2"))),
				shiny::fluidRow(routine_ui(ns("r3"))),
				shiny::fluidRow(routine_ui(ns("r4")))
			)
		)
	)
}

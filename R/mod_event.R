event_ui <- function(id, title) {
	ns <- shiny::NS(id)
	shiny::tagList(
		shiny::fluidRow(shiny::column(12, shiny::h2(title))),
			shiny::fluidRow(
				shiny::column(6, team_routines_ui("home", "Heim")),
				shiny::column(6, team_routines_ui("guest", "Gast"))
		),
		shiny::fluidRow(shiny::column(12, shiny::h3("Gesamt")))
	)
}

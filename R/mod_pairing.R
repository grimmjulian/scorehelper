#' @include pairing.R mod_routine.R

pairing_ui <- function(id) {
	ns <- shiny::NS(id)
	routine_width <- 5
	score_width <- (12 - 2 * routine_width) / 2
	shiny::tagList(
		shiny::fluidRow(
			shiny::column(routine_width, routine_ui(ns("home"))),
			shiny::column(score_width, 
				shiny::textOutput(ns("home_score"))),
			shiny::column(routine_width, routine_ui(ns("guest"))),
			shiny::column(score_width, shiny::textOutput(ns("guest_score")))
		)
	)
}

pairing_server <- function(id) {
	shiny::moduleServer(id, function(input, output, session) {
		home <- routine_server("home")
		guest <- routine_server("guest")
		p <- pairing(home = home(), guest = guest()) |> # nolint: object_usage_linter.
			shiny::reactive()
		output$home_score <- shiny::renderText(p()@score[[1]])
		output$guest_score <- shiny::renderText(p()@score[[2]])
		return(p)
	})
}

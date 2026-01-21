#' @include pairing.R mod_routine.R

pairing_layout <- function(home_routine, home_score, guest_routine, guest_score) {
	routine_width <- 5
	score_width <- (12 - 2 * routine_width) / 2
	shiny::tagList(
		shiny::fluidRow(
			shiny::column(routine_width, home_routine),
			shiny::column(score_width, home_score),
			shiny::column(routine_width, guest_routine),
			shiny::column(score_width, guest_score)
		)
	)
}

pairing_ui <- function(id) {
	ns <- shiny::NS(id)
	pairing_layout(
		routine_ui(ns("home")),
		shiny::textOutput(ns("home_score")),
		routine_ui(ns("guest")),
		shiny::textOutput(ns("guest_score"))
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

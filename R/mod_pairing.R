#' @include pairing.R mod_routine.R

pairing_team_ui <- function(id) {
	ns <- shiny::NS(id)
	routine_width <- 10
	score_width <- 12 - routine_width
	shiny::tagList(
		shiny::fluidRow(
			shiny::column(routine_width, routine_ui(ns("routine"))),
			shiny::column(score_width, shiny::textOutput(ns("score")))
		)
	)
}

pairing_team_server <- function(id, p) {
	team_index <- 2
	if (endsWith(id, "home")) {
		team_index <- 1
	}
	shiny::moduleServer(id, function(input, output, session) {
		r <- routine_server("routine")
		output$score <- shiny::renderText(p()@score[[team_index]])
		return(r)
	})
}

pairing_ui <- function(id) {
	ns <- shiny::NS(id)
	c("home", "guest") |>
		lapply(ns) |>
		lapply(pairing_team_ui) |>
		lapply(shiny::column, width = 6) |>
		shiny::fluidRow() |>
		shiny::tagList()
}

pairing_server <- function(id) {
	shiny::moduleServer(id, function(input, output, session) {
		home <- pairing_team_server("home", p)
		guest <- pairing_team_server("guest", p)
		p <- pairing(home = home(), guest = guest()) |> # nolint: object_usage_linter.
			shiny::reactive()
		return(p)
	})
}

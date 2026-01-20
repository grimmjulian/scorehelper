events <- c("Boden", "Seitpferd", "Ringe", "Sprung", "Barren", "Reck")
competition_ui <- function(id) {
	ns <- shiny::NS(id)
	shiny::tagList(
		events |>
			lapply(\(x) event_ui(ns(tolower(x)), x)) |>
			lapply(shiny::column, width = 12) |>
			lapply(shiny::fluidRow)
	)
}

competition_server <- function(id) {
	shiny::moduleServer(id, function(input, output, session) {
		for (e in tolower(events)) {
			event_server(e)
		}
	})
}

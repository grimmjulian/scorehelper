competition_ui <- function(id, title) {
	ns <- shiny::NS(id)
	events <- c("Boden", "Seitpferd", "Ringe", "Sprung", "Barren", "Reck")
	shiny::tagList(
		events |>
		lapply(\(x) event_ui(ns(tolower(x)), x)) |>
			lapply(shiny::column, width = 12) |>
			lapply(shiny::fluidRow)
	)
}

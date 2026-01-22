#' @include mod_event.R competition.R

events <- c("Boden", "Seitpferd", "Ringe", "Sprung", "Barren", "Reck")

competition_result_ui <- function(id) {
	ns <- shiny::NS(id)
	designs <- list(shiny::h2, shiny::h3, shiny::h3)
	c("score", "event_result", "end_value") |>
		lapply(ns) |>
		lapply(shiny::textOutput) |>
		Map(f = \(x, y) y(x), designs) |>
		lapply(shiny::fluidRow) |>
		lapply(shiny::column, width = 12) |>
		shiny::tagList()
}

competition_result_server <- function(id, comp) {
	shiny::moduleServer(id, function(input, output, session) {
		fields <- c("score", "event_result", "end_value")
		foo <- function(x) {
			x |>
				S7::prop(object = comp()) |>
				paste(a = _, collapse = " : ") |>
				shiny::renderText()
		}

		values <- fields |>
			lapply(foo)
		Map(\(x, y) output[[x]] <- y, fields, values)
	})
}

competition_ui <- function(id) {
	ns <- shiny::NS(id)
	shiny::tagList(
		competition_result_ui(ns("result")),
		events |>
			lapply(\(x) event_ui(ns(tolower(x)), x)) |>
			lapply(shiny::column, width = 12) |>
			lapply(shiny::fluidRow)
	)
}

competition_server <- function(id) {
	shiny::moduleServer(id, function(input, output, session) {
		comp <- shiny::reactiveVal(competition()) # nolint: object_usage_linter.

		lapply(1:6, function(i) {
			id_event <- tolower(events[[i]])
			e <- event_server(id_event)
			shiny::observe({
				current_comp <- comp()
				current_comp@events[[i]] <- e()
				comp(current_comp)
			})
		})

		competition_result_server(
			"result",
			comp # nolint: object_usage_linter.
		)

		return(comp)
	})
}

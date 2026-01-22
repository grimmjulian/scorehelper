#' @include mod_pairing.R event.R

event_team_result_ui <- function(id) {
	ns <- shiny::NS(id)
	start <- ""
	if (endsWith(id, "home")) {
		start <- shiny::h4("Gesamt")
	}
	shiny::tagList(
		shiny::fluidRow(
			shiny::column(8, start),
			shiny::column(2, shiny::textOutput(ns("end_value"))),
			shiny::column(2, shiny::textOutput(ns("score")))
		)
	)
}

event_team_result_server <- function(id, e) {
	team_index <- 2
	if (endsWith(id, "home")) {
		team_index <- 1
	}
	shiny::moduleServer(id, function(input, output, session) {
		output$score <- shiny::renderText(e()@score[[team_index]])
		output$end_value <- shiny::renderText({
			e() |>
				S7::prop(name = id) |>
				sapply(\(x) x@end_value) |>
				sum()
		})
	})
}

event_result_ui <- function(id) {
	ns <- shiny::NS(id)
	shiny::tagList(
		shiny::fluidRow(
			shiny::column(6, event_team_result_ui(ns("home"))),
			shiny::column(6, event_team_result_ui(ns("guest")))
		)
	)
}

event_result_server <- function(id, e) {
	shiny::moduleServer(id, function(input, output, session) {
		event_team_result_server("home", e)
		event_team_result_server("guest", e)
	})
}


event_ui <- function(id, title) {
	ns <- shiny::NS(id)
	shiny::tagList(
		shiny::fluidRow(shiny::column(12, shiny::h2(title))),
		shiny::fluidRow(
			shiny::column(6, shiny::h3("Heim")),
			shiny::column(6, shiny::h3("Gast"))
		),
		1:4 |>
			paste0("pairing_", a = _) |>
			lapply(ns) |>
			lapply(pairing_ui) |>
			shiny::column(width = 12) |>
			shiny::fluidRow(),
		event_result_ui(ns("result")),
		shiny::verbatimTextOutput(ns("test"))
	)
}

event_server <- function(id) {
	shiny::moduleServer(id, function(input, output, session) {
		e <- shiny::reactiveVal(event()) # nolint: object_usage_linter.
		pairings_list <- shiny::reactiveVal(vector("list", 4))

		lapply(1:4, function(i) {
			id_pairing <- paste0("pairing_", i)
			p <- pairing_server(id_pairing)

			shiny::observe({
				current_p <- p() # Den Wert des Moduls abrufen
				newList <- pairings_list()
				newList[[i]] <- current_p
				pairings_list(newList)

				current_e <- e()
				current_e@pairings <- newList
				e(current_e)
			})
		})

		event_result_server(
			"result",
			shiny::reactive(e())
		)
		return(e)
	})
}

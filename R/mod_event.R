#' @include mod_pairing.R event.R
event_result_ui <- function(id) {
	ns <- shiny::NS(id)
	pairing_layout(
		shiny::h4("Gesamt"),
		shiny::textOutput(ns("home_score")),
		"",
		shiny::textOutput(ns("guest_score"))
	)
}

event_result_server <- function(id, e) {
	shiny::moduleServer(id, function(input, output, session) {
		output$home_score <- shiny::renderText(e()@score[[1]])
		output$guest_score <- shiny::renderText(e()@score[[2]])
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
		e <- shiny::reactiveVal(event())
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
	})
}

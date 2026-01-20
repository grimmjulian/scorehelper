event_ui <- function(id, title) {
	ns <- shiny::NS(id)
	shiny::tagList(
		shiny::fluidRow(shiny::column(12, shiny::h2(title))),
		shiny::fluidRow(
			1:4 |>
				paste0("pairing_", a = _) |>
				lapply(ns) |>
				lapply(pairing_ui)
		),
		shiny::fluidRow(shiny::column(12, shiny::h3("Gesamt")))
	)
}

event_server <- function(id) {
	shiny::moduleServer(id, function(input, output, session) {
		for (i in 1:4) {
			id <- paste0("pairing_", i)
			pairing_server(id)
		}
	})
}

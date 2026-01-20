runApp <- function(...) {
	options(
		shiny.autoload.R = FALSE,
		shiny.autoreload = TRUE
	)
	on.exit(options(shiny.autoload.R = NULL))
	shiny::runApp(...)
}

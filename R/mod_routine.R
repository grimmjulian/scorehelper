routine_ui <- function(id) {
	ns <- shiny::NS(id)
	gymnast_width <- 4 
	value_width <- floor((12-gymnast_width)/3)
	shiny::tagList(
		shiny::fluidRow(
			shiny::column(gymnast_width, "GYMNAST"),
			shiny::column(value_width, "D-VALUE"),
			shiny::column(value_width, "END-VALUE"),
			shiny::column(value_width, "SCORE-VALUE")
		)
	)
}

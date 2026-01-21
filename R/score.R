#' @include routine.R
score <- S7::new_generic("score", c("x", "y"))

S7::method(
	score,
	list(S7::class_numeric, S7::class_numeric)
) <- function(x, y) {
	breaks <- c(-Inf, 0.1, 0.25, 0.5, 1, 2, 6, 10)
	labels <- c(0:5, 10)
	if (x <= y) {
		diff <- y - x
		s <- cut(diff, breaks = breaks, labels = labels) |>
			as.character() |>
			as.numeric()
		c(0, s)
	} else {
		diff <- x - y
		s <- cut(diff, breaks = breaks, labels = labels) |>
			as.character() |>
			as.numeric()
		c(s, 0)
	}
}

S7::method(
	score,
	list(routine, routine)
) <- function(x, y) {
	score(x@end_value, y@end_value)
}

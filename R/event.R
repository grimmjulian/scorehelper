#' @include pairing.R

event <- S7::new_class(
	"event",
	properties = list(
		pairings = S7::class_list,
		score = S7::new_property(
			getter = function(self) {
				self@pairings |>
					lapply(\(x) x@score) |>
					Reduce(f = `+`)
			}
		)
	)
)

#' @include event.R

competition <- S7::new_class(
	"competition",
	properties = list(
		events = S7::new_property(
			S7::class_list,
			default = replicate(6, event())
		),
		score = S7::new_property(
			getter = function(self) {
				self@events |>
					lapply(\(x) x@score) |>
					Reduce(f = `+`)
			}
		),
		end_value = S7::new_property(
			getter = function(self) {
				self@events |>
					lapply(\(x) x@end_value) |>
					Reduce(f = `+`)
			}
		),
		event_result = S7::new_property(
			getter = function(self) {
				self@events |>
					lapply(\(x) x@event_result) |>
					Reduce(f = `+`)
			}
		)
	)
)

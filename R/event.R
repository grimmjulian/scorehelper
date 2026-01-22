#' @include pairing.R

team_property <- function(team) {
	S7::new_property(
		getter = function(self) {
			self@pairings |>
				lapply(\(x) S7::prop(x, team))
		},
		setter = function(self, value) {
			for (i in seq_along(value)) {
				S7::prop(self@pairings[[i]], team) <- value[[i]]
			}
			self
		}
	)
}

event <- S7::new_class(
	"event",
	properties = list(
		pairings = S7::new_property(
			S7::class_list,
			default = replicate(4, pairing())
		),
		score = S7::new_property(
			getter = function(self) {
				self@pairings |>
					lapply(\(x) x@score) |>
					Reduce(f = `+`)
			}
		),
		end_value = S7::new_property(
			getter = function(self) {
				self@pairings |>
					lapply(\(x) x@end_value) |>
					Reduce(f = `+`)
			}
		),
		event_result = S7::new_property(
			getter = function(self) {
				if (self@score[[1]] == self@score[[2]]) {
					c(1, 1)
				} else if (self@score[[1]] > self@score[[2]]) {
					c(2, 0)
				} else {
					c(0, 2)
				}
			}
		),
		home = team_property("home"),
		guest = team_property("guest")
	)
)

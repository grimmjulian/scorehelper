#' @include routine.R
pairing <- S7::new_class(
	"pairing",
	properties = list(
		home = routine,
		guest = routine,
		score = S7::new_property(
			getter = function(self) score(self@home, self@guest)
		),
		end_value = S7::new_property(
			getter = function(self) {
				c(self@home@end_value, self@guest@end_value)
			}
		)
	)
)

#' @include routine.R
pairing <- S7::new_class(
	"pairing",
	properties = list(
		home = routine,
		guest = routine,
		score = S7::new_property(
			getter = function(self) score(self@home, self@guest)
		)
	)
)

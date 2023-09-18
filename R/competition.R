#' @include events.R

methods::setClass(
  "Competition",
  slots = c(
    floor = "Event",
    pommel_horse = "Event",
    still_rings = "Event",
    vault = "Event",
    parallel_bars = "Event",
    horizontal_bar = "Event"
  ),
  prototype = list(
    floor = methods::new("Event"),
    pommel_horse = methods::new("Event"),
    still_rings = methods::new("Event"),
    vault = methods::new("Event"),
    parallel_bars = methods::new("Event"),
    horizontal_bar = methods::new("Event")
  )
)

Competition <- function(home_starts = TRUE) {
  methods::new("Competition", home_starts = home_starts)
}

methods::setMethod(
  "initialize",
  "Competition",
  function(.Object, home_starts = TRUE) {
    .Object@floor <- methods::new("Event")
    .Object@pommel_horse <- methods::new("Event")
    .Object@still_rings <- methods::new("Event")
    .Object@vault <- methods::new("Event")
    .Object@parallel_bars <- methods::new("Event")
    .Object@horizontal_bar <- methods::new("Event")
    home_starts(.Object) <- home_starts
    .Object
  }
)



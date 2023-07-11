#' @include events.R

#' An S4 class that stores a list of events.
#' @export

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
  competition <- methods::new("Competition")
  home_starts(competition) <- home_starts
  return(competition)
}

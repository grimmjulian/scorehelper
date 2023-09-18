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
  )
)

Competition <- function(home_starts = TRUE) {
  methods::new("Competition", home_starts = home_starts)
}

methods::setMethod(
  "initialize",
  "Competition",
  function(.Object, home_starts = TRUE) {
    floor(.Object) <- methods::new("Event")
    pommel_horse(.Object) <- methods::new("Event")
    still_rings(.Object) <- methods::new("Event")
    vault(.Object) <- methods::new("Event")
    parallel_bars(.Object) <- methods::new("Event")
    horizontal_bar(.Object) <- methods::new("Event")
    home_starts(.Object) <- home_starts
    .Object
  }
)

methods::setMethod("as.list", "Competition", function(x) {
  list(
    floor = floor(x),
    pommel_horse = pommel_horse(x),
    still_rings = still_rings(x),
    vault = vault(x),
    parallel_bars = parallel_bars(x),
    horizontal_bar = horizontal_bar(x)
  )
})

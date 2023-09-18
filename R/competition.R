#' @include events.R


methods::setClass(
  "competition_information",
  slots = list(
    home_team = "Team",
    guest_team = "Team"
  )
)

methods::setMethod(
  "initialize",
  "competition_information",
  function(.Object) {
    .Object@home_team <- methods::new("Team")
    .Object@guest_team <- methods::new("Team")
    .Object
  }
)



methods::setClass(
  "Competition",
  slots = c(
    floor = "Event",
    pommel_horse = "Event",
    still_rings = "Event",
    vault = "Event",
    parallel_bars = "Event",
    horizontal_bar = "Event",
    information = "competition_information"
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
    .Object@information <- methods::new("competition_information")
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

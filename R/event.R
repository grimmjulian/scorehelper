#' @include pairing.R

methods::setClass(
  "Event",
  contains = "list",
  prototype = list(
    methods::new("Pairing"),
    methods::new("Pairing"),
    methods::new("Pairing", home_starts = FALSE),
    methods::new("Pairing", home_starts = FALSE)
  )
)

methods::setValidity("Event", function(object) {
  if (home_starts(object[[1]]) == home_starts(object[[3]])) {
    "home_starts for pairings is not set correctly."
  } else if (home_starts(object[[1]]) == home_starts(object[[4]])) {
    "home_starts for pairings is not set correctly."
  } else if (!home_starts(object[[1]]) == home_starts(object[[2]])) {
    TRUE
  }
})

Event.pairings <- function(pairings) {
  stopifnot(all(sapply(pairings, methods::is, class2 = "Pairing")))
  stopifnot(length(pairings) <= 4)
  event <- methods::new("Event")
  event[seq_len(length(pairings))] <- pairings
  home_starts(event) <- home_starts(pairings[[1]])
  return(event)
}

Event.routines <- function(home = list(new("Routine")), guest = list(new("Routine")), home_starts = TRUE) {
  stopifnot(all(sapply(home, methods::is, class2 = "Routine")))
  stopifnot(all(sapply(guest, methods::is, class2 = "Routine")))
  home_starts <- c(home_starts, home_starts, !home_starts, !home_starts)
  pairings <- mapply(methods::new,
    home = home,
    guest = guest,
    home_starts = home_starts,
    MoreArgs = list(Class = "Pairing")
  )
  event <- Event.pairings(pairings)
  return(event)
}

methods::setMethod(
  "reorder",
  "Event",
  function(x, home_order = 1:4, guest_order = 1:4, home_starts = x[[1]]@home_starts) {
    home <- team_routines(x, team = "home")[home_order]
    guest <- team_routines(x, team = "guest")[guest_order]
    event <- Event.routines(home, guest, home_starts = home_starts)
    return(event)
  }
)

methods::setMethod(
  "sort",
  "Event",
  function(x, decreasing = FALSE) {
    x <- as.list(x)
    x <- x[order(sapply(x, score_diff), decreasing = decreasing)]
    event <- Event.pairings(x)
    return(event)
  }
)

team_routines <- function(event, team = "home") {
  stopifnot(team %in% c("home", "guest"))
  routines <- lapply(event, methods::slot, name = team)
  return(routines)
}

permutations <- function(event) {
  orders <- combinat::permn(1:4)
  events <- lapply(orders, reorder, x = event)
  methods::new("Events", events)
}

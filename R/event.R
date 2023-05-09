#' @include pairing.R

#' An S4 class that stores all pairings for an event.
#'
#' @slot first The first pairing
#' @slot second The second pairing
#' @slot third The third pairing
#' @slot fourth The fourth pairing
#' @export

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
  } else {
    TRUE
  }
})

methods::setMethod("as.data.frame", "Event", function(x) {
  rbind(
    as.data.frame(x[[1]]),
    as.data.frame(x[[2]]),
    as.data.frame(x[[3]]),
    as.data.frame(x[[4]])
  )
})

#' Calculate the score result of an event
#' @param x An object to calculate the score from
methods::setMethod("score", "Event", function(x) {
  Reduce(`+`, lapply(x, score))
})

#' Rate the score result of an event
#' @param x An object to rate the score
methods::setMethod("score_diff", "Event", function(x) {
  Reduce(`+`, lapply(x, score_diff))
})

team_routines <- function(event, team = "home") {
  stopifnot(team %in% c("home", "guest"))
  routines <- lapply(event, methods::slot, name = team)
  return(routines)
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

Event.pairings <- function(pairings) {
  stopifnot(all(sapply(pairings, methods::is, class2 = "Pairing")))
  stopifnot(length(pairings) <= 4)
  event <- methods::new("Event")
  event[seq_len(length(pairings))] <- pairings
  home_starts(event) <- home_starts(pairings[[1]])
  return(event)
}

Event.routines <- function(home, guest, home_starts = TRUE) {
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
  "sort",
  "Event",
  function(x, decreasing = TRUE) {
    x <- as.list(x)
    x <- x[order(sapply(x, score_diff), decreasing = decreasing)]
    event <- Event.pairings(x)
    return(event)
  }
)

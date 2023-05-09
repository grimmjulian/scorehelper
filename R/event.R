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
    new("Pairing"),
    new("Pairing"),
    new("Pairing"),
    new("Pairing")
  )
)

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
methods::setMethod("rating", "Event", function(x) {
  Reduce(`+`, lapply(x, rating))
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
  stopifnot(length(pairings) == 4)
  stopifnot(all(sapply(pairings, methods::is, class2 = "Pairing")))
  event <- new("Event", pairings)
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

routine_order <- function(home_starts = TRUE) {
  stopifnot(is.logical(home_starts))
  a <- list(c(1, 3, 6, 8), c(2, 4, 5, 7))
  if (!home_starts) {
    a <- rev(a)
  }
  names(a) <- c("home", "guest")
  return(a)
}

methods::setMethod(
  "sort",
  "Event",
  function(x, home = TRUE) {
    x <- as.list(x)
    x <- x[order(sapply(x, rating), decreasing = home)]
    event <- Event.pairings(x)
    return(event)
  }
)

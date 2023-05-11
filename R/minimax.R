minimax.p12 <- function(event) {
  events <- permutations(event)
  foo <- ifelse(home_starts(event), min, max)
  event <- foo(events)
  e <- sort(event, decreasing = home_starts(event))
  return(e)
}

identical_pairings <- function(x, y) {
  if (inherits(x, "Pairing")) {
    home_starts(x) <- TRUE
    home_starts(y) <- TRUE
  }
  identical(x, y)
}

remove_pairing <- function(event, pairing) {
  p <- Position(function(l) identical_pairings(l, pairing), event)
  return(event[-p])
}

remove_pairings <- function(event, pairings) {
  Reduce(remove_pairing, pairings, init = event)
}

pairing_in_event <- function(pairing, event) {
  any(sapply(event, identical_pairings, y = pairing))
}

pairings_in_event <- function(pairings, event) {
  all(sapply(pairings, pairing_in_event, event = event))
}

minimax <- function(event) {
  e1 <- minimax.p12(event)
  e2 <- reorder(e1, home_order = c(1, 2, 4, 3))
  events <- methods::new("Events", list(e1, e2))
  foo <- ifelse(home_starts(event), max, min)
  event <- foo(events)
  return(event)
}

minimax.p12 <- function(event) {
  events <- permutations(event)
  event <- ifelse(home_starts(event), min(events), max(events))
  e <- sort(event, decreasing = home_starts(event))
  return(e[1:2])
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

# minimax <- function(event) {
#   p12 <- minimax.p12(event)
#   events <- all_possible_events(event)
#   events <- Filter(function(e) pairings_in_event(p12, e), events)
#   event <- ifelse(home_starts(event), max(events), min(events))
#   p34 <- remove_pairings(event, p12)
#   minimax_event <- Event.pairings(c(p12, p34))
#   return(minimax_event)
# }

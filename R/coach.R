permutations <- function(event) {
  orders <- combinat::permn(1:4)
  lapply(orders, reorder, x = event)
}

get_first_two_pairings <- function(event, home_starts = TRUE) {
  possible_events <- permutations(event)
  event_ratings <- sapply(possible_events, rating)
  event_order <- order(event_ratings, decreasing = !home_starts)
  event <- possible_events[event_order][[1]]
  event <- sort(event, home_starts)
  pairings <- as.list(event)[1:2]
  pairings[[1]]@home_starts <- TRUE 
  pairings[[2]]@home_starts <- TRUE 
  return(pairings)
}

get_all_pairing_combs <- function(pairings) {
  home <- lapply(pairings, methods::slot, name = "home")
  guest <- lapply(pairings, methods::slot, name = "guest")
  combs <- expand.grid(home = home, guest = guest)
  pairing_combs <- mapply(methods::new, home = combs$home, guest = combs$guest, MoreArgs = list(Class = "Pairing"))
  return(pairing_combs)
}

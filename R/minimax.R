minimax.p12 <- function(event) {
  events <- permutations(event)
  orders <- order(sapply(events, score_diff), decreasing = home_starts(event))
  event <- events[orders][[1]]
  e <- sort(event, decreasing = home_starts(event))
  return(e[1:2])
}

minimax <- function(event) {
  p12 <- minimax.p12(event)
  events <- all_possible_events(event)
  events <- Filter(function(e) all(p12 %in% e), events)
  orders <- order(sapply(events, score_diff), decreasing = !home_starts(event))
  event <- events[orders][[1]]

}

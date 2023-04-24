all_pairing_combs <- function(event) {
  o <- combinat::permn(1:4)
  FUN <- function(x) {
    reorder(event, home_order = 1:4, guest_order = x)
  }
  events <- lapply(o, FUN)
  return(events)
}

perm_with_fixed <- function(n) {
  stopifnot(n %in% 0:4)
if (n < 3) {
    fix <- seq_len(n)
    flex <- combinat::permn((n + 1):4)
    perms <- lapply(flex, c, rev(fix))
    perms <- lapply(perms, rev)
} else if (n %in% 3:4) {
  perms <- list(1:4)
}
  return(perms)
}

order_of_events <- function(events, for_home = TRUE) {
  rating <- sapply(events, rating)
  o <- order(rating, decreasing = for_home)
  return(o)
}

get_all_routine_combinations <- function(event, for_home = TRUE) {
  events <- all_pairing_combs(event)
  o <- order_of_events(events, for_home)
  return(events[o])
}

permutations <- function(event) {
  orders <- combinat::permn(1:4)
  lapply(orders, reorder, x = event)
}


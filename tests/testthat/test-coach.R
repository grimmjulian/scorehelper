test_that("permutating of guest routines works", {
  r <- lapply(1:8, function(x) new("Routine", endvalue = x))
  r <- split(r, f = c(1, 1, 2, 2, 3, 3, 4, 4))
  e <- lapply(r, function(x) new("Pairing", home = x[[1]], guest = x[[2]]))
  e <- new("Event", first = e[[1]], second = e[[2]], third = e[[3]], fourth = e[[4]])
  f <- all_pairing_combs(e)
  f <- lapply(f, as.data.frame)
  expect_snapshot(f)
})

test_that("permutations get translated from number", {
  expect_error(perm_with_fixed(-1))
  expect_error(perm_with_fixed(5))
  expect_equal(perm_with_fixed(4), list(1:4))
  expect_equal(perm_with_fixed(3), list(1:4))
  expect_equal(perm_with_fixed(2), list(c(1, 2, 4, 3), 1:4))
  expect_equal(
    perm_with_fixed(1),
    list(
      c(1, 4, 3, 2), c(1, 3, 4, 2), c(1, 3, 2, 4),
      1:4, c(1, 2, 4, 3), c(1, 4, 2, 3)
    )
  )
  expect_true(all(perm_with_fixed(0) %in% combinat::permn(1:4)))
  expect_length(perm_with_fixed(0), 24)
})

test_that("the order of the events is right", {
  r1 <- new("Routine", endvalue = 10)
  p1 <- new("Pairing", home = r1)
  e1 <- new("Event", first = p1)
  events <- list(new("Event"), e1)
  expect_equal(order_of_events(events), c(2, 1))
})

test_that("all possible events from this routines are ordered correctly", {
  r <- lapply(1:8, function(x) new("Routine", endvalue = x))
  r <- split(r, f = c(1, 1, 2, 2, 3, 3, 4, 4))
  e <- lapply(r, function(x) new("Pairing", home = x[[1]], guest = x[[2]]))
  event <- new("Event", first = e[[1]], second = e[[2]], third = e[[3]], fourth = e[[4]])
  events <- get_all_routine_combinations(event)
  expect_snapshot(lapply(events, as.data.frame))
})

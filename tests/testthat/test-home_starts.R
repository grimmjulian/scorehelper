test_that("home_starts works for pairings", {
  p <- new("Pairing")
  expect_true(home_starts(p))
  home_starts(p) <- FALSE
  expect_false(home_starts(p))
})

test_that("home_starts works for events", {
  e <- new("Event")
  expect_true(home_starts(e))
  home_starts(e) <- FALSE
  expect_false(home_starts(e))
})

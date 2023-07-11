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

test_that("home_starts works for competition", {
  comp <- new("Competition")
  expect_true(home_starts(comp))
  home_starts(comp) <- FALSE
  expect_false(home_starts(comp))
  expect_false(home_starts(comp@floor))
  expect_true(home_starts(comp@pommel_horse))
  expect_false(home_starts(comp@still_rings))
  expect_true(home_starts(comp@vault))
  expect_false(home_starts(comp@parallel_bars))
  expect_true(home_starts(comp@horizontal_bar))
})

test_that("S4_in works for single elements", {
  r <- lapply(1:8, function(x) new("Routine", endvalue = x))
  p <- new("Pairing", home = new("Routine", endvalue = 10))
  expect_true(S4_in(r[[1]], r))
  expect_false(S4_in(p, r))
})

test_that("S4_in works for list", {
  r <- lapply(1:8, function(x) new("Routine", endvalue = x))
  expect_equal(S4_in(r[1:2], r), c(TRUE, TRUE))
  p <- new("Routine", endvalue = 10)
  expect_equal(S4_in(list(p, r[[3]]), r), c(FALSE, TRUE))
})

test_that("S4_in return true for empyt list", {
  expect_true(S4_in(list(), list(1, 2, 3)))
})

test_that("calculation score points gives point to correct team", {
  x <- 10
  y <- 8
  expect_equal(calc_score(10, 8), c(home = 4, guest = 0))
  expect_equal(calc_score(8, 10), c(home = 0, guest = 4))
})

test_that("score points are correct", {
  expect_equal(unname(calc_score(0)), c(0, 0))
  expect_equal(unname(calc_score(0.1)), c(0, 0))
  expect_equal(unname(calc_score(0.15)), c(1, 0))
  expect_equal(unname(calc_score(0.25)), c(1, 0))
  expect_equal(unname(calc_score(0.3)), c(2, 0))
  expect_equal(unname(calc_score(0.5)), c(2, 0))
  expect_equal(unname(calc_score(0.55)), c(3, 0))
  expect_equal(unname(calc_score(1)), c(3, 0))
  expect_equal(unname(calc_score(1.05)), c(4, 0))
  expect_equal(unname(calc_score(2)), c(4, 0))
  expect_equal(unname(calc_score(2.05)), c(5, 0))
  expect_equal(unname(calc_score(6)), c(5, 0))
  expect_equal(unname(calc_score(6.05)), c(10, 0))
  expect_equal(unname(calc_score(10)), c(10, 0))
})

test_that("calculation of the score result of a competition works", {
  comp <- new("Competition")
  expect_equal(score(comp), c(home = 0, guest = 0))
})

test_that("calculation of score for events works", {
  e <- Event.routines(list(methods::new("Routine", endvalue = 3)))
  expect_equal(score(e), c(home = 20, guest = 0))
})

test_that("calculation of score_diff works for events", {
  e <- Event.routines(list(methods::new("Routine", endvalue = 3)))
  expect_equal(score_diff(e), 20)
})

test_that("calculation of event_score works for events", {
  e <- Event.routines(list(methods::new("Routine", endvalue = 3)))
  expect_equal(event_score(e), c(home = 2, guest = 0))
})

test_that("calculation of event_score works for competition", {
  comp <- new("Competition")
  expect_equal(event_score(comp), c(home = 6, guest = 6))
  e <- Event.routines(list(methods::new("Routine", endvalue = 3)))
  comp@floor <- e
  expect_equal(event_score(comp), c(home = 7, guest = 5))
})

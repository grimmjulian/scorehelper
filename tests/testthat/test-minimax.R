test_that("Recursive of lists works", {
  expect_equal(remove_pairing(c(1, 1, 2), 1), c(1, 2))
  p <- new("Pairing", home = new("Routine", endvalue = 10))
  p1 <- new("Pairing")
  p2 <- new("Pairing", home_starts = FALSE)
  expect_equal(remove_pairing(Event.pairings(list(p)), p1), list(p, p2, p2))
  expect_equal(remove_pairing(Event.pairings(list(p)), p2), list(p, p2, p2))
})

test_that("Recursive Reduciton of lists works", {
  expect_equal(remove_pairings(list(1, 1, 1, 3), list(1, 1)), list(1, 3))
  p1 <- new("Pairing")
  p2 <- new("Pairing", home_starts = FALSE)
  p3 <- new("Pairing", home = new("Routine", endvalue = 10), home_starts = FALSE)
  expect_equal(remove_pairings(list(p1, p1, p1, p3), list(p1, p1)), list(p1, p3))
  expect_equal(remove_pairings(Event.pairings(list(p3)), list(p2, p1)), list(p3, p1))
})

test_that("finding the first two pairings works if home has higher endvalue", {
  r1 <- new("Routine", endvalue = 14)
  r2 <- new("Routine", endvalue = 12)
  p <- new("Pairing", home = r1, guest = r2)
  event <- Event.pairings(list(p))
  event <- minimax.p12(event)
  expect_equal(score_diff(event[[1]]), 10)
})

test_that("finding the first two pairings works if home has lower endvalue", {
  r1 <- new("Routine", endvalue = 12)
  r2 <- new("Routine", endvalue = 14)
  p <- new("Pairing", home = r1, guest = r2)
  event <- Event.pairings(list(p))
  event <- minimax.p12(event)
  expect_equal(score_diff(event[[1]]), 0)
  expect_equal(score_diff(event[[2]]), 0)
})

test_that("finding the minimax event", {
  r1 <- new("Routine", endvalue = 14)
  r2 <- new("Routine", endvalue = 12)
  p <- new("Pairing", home = r1, guest = r2)
  event <- Event.pairings(list(p))
  event <- minimax(event)
  expect_equal(score_diff(event), 0)
})

test_that("finding the minimax event", {
  r1 <- new("Routine", endvalue = 12)
  r2 <- new("Routine", endvalue = 14)
  p <- new("Pairing", home = r1, guest = r2)
  event <- Event.pairings(list(p))
  event <- minimax(event)
  expect_equal(score_diff(event), 0)
})

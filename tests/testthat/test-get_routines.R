test_that("getting Routines for a pairing works", {
  p <- new("Pairing", home = new("Routine", endvalue = 10))
  h <- get_routines(p, "home")
  expect_equal(slot(h, "endvalue"), 10)
})

test_that("getting routines for an event works", {
  p <- new("Pairing", guest = new("Routine", endvalue = 10))
  e <- Event.pairings(list(p))
  h <- get_routines(e, "guest")
  expect_equal(sapply(h, slot, name = "endvalue"), c(10, 0, 0, 0))
})

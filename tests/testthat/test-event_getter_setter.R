test_that("getting the floor event of a competition works", {
  r <- new("Routine", endvalue = 10)
  p <- new("Pairing", home = r)
  e <- Event.pairings(list(p))
  c <- new("Competition")
  c@floor <- e
  c@vault <- e
  expect_equal(score(floor(c)), c(home = 10, guest = 0))
  expect_equal(score(vault(c)), c(home = 10, guest = 0))
})

test_that("setting a new basic event works in a competition", {
  r <- new("Routine", endvalue = 10)
  p <- new("Pairing", home = r)
  e <- Event.pairings(list(p))
  c <- new("Competition")
  floor(c) <- e
  vault(c) <- e
  expect_equal(score(floor(c)), c(home = 10, guest = 0))
  expect_equal(score(vault(c)), c(home = 10, guest = 0))

})

test_that("setting a new event also adapts the starting team to competition", {
  e <- new("Event")
  c <- new("Competition", home_starts = FALSE)
  floor(c) <- e
  expect_false(home_starts(c))
})

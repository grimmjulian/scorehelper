test_that("permutations are correct", {
  event <- new("Event")
  expect_length(permutations(event), 24)
})

test_that("the first two pairings work", {
  r1 <- new("Routine", endvalue = 12)
  r2 <- new("Routine", endvalue = 14)
  p <- new("Pairing", home = r1, guest = r2)
  e <- new("Event", first = p)
  pairings <- get_first_two_pairings(e)
  expect_equal(pairings, list(new("Pairing"), new("Pairing")))
})

test_that("getting all possible different combinations of pairings", {
  r1 <- new("Routine", endvalue = 12)
  r2 <- new("Routine", endvalue = 14)
  p1 <- new("Pairing", home = r1, guest = r2)
  p2 <- new("Pairing")
  p3 <- new("Pairing", home = r1)
  p4 <- new("Pairing", guest = r2)
  pairings <- get_all_pairing_combs(list(p1, p2))
  expect_true(my_in(p1, pairings))
  expect_true(my_in(p2, pairings))
  expect_true(my_in(p3, pairings))
  expect_true(my_in(p4, pairings))
})

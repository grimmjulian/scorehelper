test_that("prototype pairing works", {
  expect_no_error(new("Pairing"))
})

test_that("score points get calculated correctly", {
  pairing <- new("Pairing")
  expect_equal(score(pairing), c(home = 0, guest = 0))
  routine <- new("Routine", endvalue = 2)
  pairing@home <- routine
  expect_equal(score(pairing), c(home = 4, guest = 0))
  routine2 <- new("Routine", endvalue = 2.5)
  pairing@guest <- routine2
  expect_equal(score(pairing), c(home = 0, guest = 2))
})

test_that("as.data.frame works for pairing", {
  expect_snapshot(as.data.frame(new("Pairing")))
})

test_that("pairings are rated the correct way", {
  pairing <- new("Pairing")
  expect_equal(score_diff(pairing), 0)
  routine <- new("Routine", endvalue = 2)
  pairing@home <- routine
  expect_equal(score_diff(pairing), 4)
  routine2 <- new("Routine", endvalue = 2.5)
  pairing@guest <- routine2
  expect_equal(score_diff(pairing), -2)
})

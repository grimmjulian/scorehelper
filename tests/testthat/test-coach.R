test_that("extraction of the routines of one team from an event works", {
  r <- lapply(1:8, function(x) new("Routine", endvalue = x))
  r1 <- r
  r <- split(r, f = c(1, 1, 2, 2, 3, 3, 4, 4))
  e <- lapply(r, function(x) new("Pairing", home = x[[1]], guest = x[[2]]))
  e <- new("Event", first = e[[1]], second = e[[2]], third = e[[3]], fourth = e[[4]])
  g <- team_routines(e, team = "guest")
  expect_equal(g, r1[c(2, 4, 6, 8)])
})

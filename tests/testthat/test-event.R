test_that("prototype event works", {
  expect_no_error(new("Event"))
})

test_that("as.data.frame works for event", {
  expect_snapshot(as.data.frame(new("Event")))
})

test_that("scoring for an event works", {
  expect_equal(score(new("Event")), c(0, 0))
})

test_that("as.list works for events", {
  expect_equal(
    as.list(new("Event")),
    list(new("Pairing"), new("Pairing"), new("Pairing"), new("Pairing"))
  )
})

test_that("rating of an event works", {
  expect_equal(rating(new("Event")), 0)
})

test_that("Creation of an event from two lists of routines works", {
  home <- lapply(1:4, FUN = function(x) {
    methods::new("Routine", endvalue = x)
  })
  guest <- lapply(5:8, FUN = function(x) {
    methods::new("Routine", endvalue = x)
  })
  event <- Event.routines(home, guest)
  expect_snapshot(as.data.frame(event))
})

test_that("extraction of the routines of one team from an event works", {
  r <- lapply(1:8, function(x) new("Routine", endvalue = x))
  r1 <- r
  r <- split(r, f = c(1, 1, 2, 2, 3, 3, 4, 4))
  e <- lapply(r, function(x) new("Pairing", home = x[[1]], guest = x[[2]]))
  e <- new("Event", first = e[[1]], second = e[[2]], third = e[[3]], fourth = e[[4]])
  g <- team_routines(e, team = "guest")
  expect_equal(g, r1[c(2, 4, 6, 8)])
})

test_that("reordering of routines in an event works", {
  r <- lapply(1:8, function(x) new("Routine", endvalue = x))
  r <- split(r, f = c(1, 1, 2, 2, 3, 3, 4, 4))
  e <- lapply(r, function(x) new("Pairing", home = x[[1]], guest = x[[2]]))
  e <- new("Event", first = e[[1]], second = e[[2]], third = e[[3]], fourth = e[[4]])
  g <- reorder(e, home_order = 4:1, guest_order = c(3, 4, 1, 2))
  expect_snapshot(as.data.frame(g))
})

test_that("the order of the routines is right", {
  expect_equal(routine_order(TRUE), list(home = c(1, 3, 6, 8), guest = c(2, 4, 5, 7)))
  expect_equal(routine_order(FALSE), list(home = c(2, 4, 5, 7), guest = c(1, 3, 6, 8)))
})

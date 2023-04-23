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
  expect_snapshot(event)
})

test_that("prototype event works", {
  expect_no_error(new("Event"))
})

test_that("as.data.frame works for event", {
  expect_snapshot(as.data.frame(new("Event")))
})

test_that("scoring for an event works", {
  expect_equal(score(new("Event")), c(0, 0))
})

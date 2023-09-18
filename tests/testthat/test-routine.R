test_that("prototype routine works", {
  expect_no_error(new("Routine"))
})

test_that("validation of routine works", {
  expect_error(new("Routine", dvalue = 1:2))
  expect_error(new("Routine", dvalue = -1))
  expect_error(new("Routine", endvalue = 1:2))
  expect_error(new("Routine", endvalue = -1))
})

test_that("routine output as data.frame works", {
  routine <- new("Routine")
  expect_snapshot(as.data.frame(new("Routine")))
})

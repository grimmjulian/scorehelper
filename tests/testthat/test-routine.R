test_that("prototype routine works", {
  expect_no_error(new("Routine"))
})

test_that("routine output as data.frame works", {
  routine <- new("Routine")
  expect_equal(
    as.data.frame(routine),
    data.frame(gymnast = NA_character_, dvalue = 0, endvalue = 0)
  )
})

test_that("as.data.frame works for routine", {
  expect_snapshot(as.data.frame(new("Routine")))
})

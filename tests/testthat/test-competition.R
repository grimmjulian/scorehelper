test_that("helper function for competitionworks", {
  comp <- Competition()
  expect_true(is(comp, "Competition"))
  expect_no_error(methods::validObject(comp))
})

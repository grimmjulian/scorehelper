test_that("prototype gymnast works", {
  expect_no_error(new("Gymnast"))
})

test_that("validation of gymnast works", {
  expect_error(new("Gymnast", dvalue = 1:2))
  expect_error(new("Gymnast", dvalue = -1))
  expect_error(new("Gymnast", endvalue = 1:2))
  expect_error(new("Gymnast", endvalue = -1))
})

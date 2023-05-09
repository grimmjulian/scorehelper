test_that("prototype gymnast works", {
  expect_no_error(new("Gymnast"))
})

test_that("validation of gymnast works", {
  expect_error(new("Gymnast", id = LETTERS[1:2]))
  expect_error(new("Gymnast", name = LETTERS[1:2]))
  expect_error(new("Gymnast", nationality = LETTERS[1:2]))
})

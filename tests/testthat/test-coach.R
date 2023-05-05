test_that("permutations are correct", {
  event <- new("Event")
  expect_length(permutations(event), 24)
})

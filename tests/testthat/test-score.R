test_that("score works for numerics", {
	expect_equal(score(5, 5.1), c(0, 0))
	expect_equal(score(7, 7.25), c(0, 1))
	expect_equal(score(0.3, 0), c(2, 0))
})

test_that("score works for routines", {
	r1 <- routine(end_value = 5.05)
	r2 <- routine(end_value = 4)
	expect_equal(score(r1, r2), c(4, 0))
	expect_equal(score(r2, r1), c(0, 4))
})

test_that("score works for extrem values", {
	expect_equal(score(1005, 5.1), c(10, 0))
})

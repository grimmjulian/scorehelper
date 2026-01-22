test_that("score prop works for pairings", {
	r1 <- routine(end_value = 5.05)
	r2 <- routine(end_value = 4)
	p <- pairing(home = r1, guest = r2)
	expect_equal(p@score, c(4, 0))
})

test_that("end_value prop works for pairings", {
	r1 <- routine(end_value = 5.05)
	r2 <- routine(end_value = 4)
	p <- pairing(home = r1, guest = r2)
	expect_equal(p@end_value, c(5.05, 4))
})

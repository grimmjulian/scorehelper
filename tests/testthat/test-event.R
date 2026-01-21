test_that("score property for events works", {
	r1 <- routine(end_value = 2)
	r2 <- routine(end_value = 0.5)
	p1 <- pairing(home = r1)
	p2 <- pairing(guest = r2)
	e <- event(pairings = list(p1, p2))
	expect_equal(e@score, c(4, 2))
})

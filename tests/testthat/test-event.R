test_that("default event has 4 pairings", {
	e <- event()
	expect_length(e@pairings, 4)
	expect_true(all(sapply(e@pairings, S7::S7_inherits, pairing)))
})

test_that("score property for events works", {
	r1 <- routine(end_value = 2)
	r2 <- routine(end_value = 0.5)
	p1 <- pairing(home = r1)
	p2 <- pairing(guest = r2)
	e <- event(pairings = list(p1, p2))
	expect_equal(e@score, c(4, 2))
})

test_that("end_value property for events works", {
	r1 <- routine(end_value = 2)
	r2 <- routine(end_value = 0.5)
	p1 <- pairing(home = r1)
	p2 <- pairing(guest = r2)
	e <- event(pairings = list(p1, p2))
	expect_equal(e@end_value, c(2, 0.5))
})

test_that("event_result property for events works", {
	r1 <- routine(end_value = 2)
	r2 <- routine(end_value = 0.5)
	p1 <- pairing(home = r1)
	p2 <- pairing(guest = r2)
	e1 <- event(pairings = list(p1, p2))
	expect_equal(e1@event_result, c(2, 0))
	p3 <- pairing(guest = r1)
	p4 <- pairing(home = r2)
	e2 <- event(pairings = list(p1, p2, p3, p4))
	expect_equal(e2@event_result, c(1, 1))
})

test_that("home/guest property getter works", {
	r <- routine(end_value = 2)
	p <- pairing(guest = r)
	e <- event(pairings = list(pairing(), p))
	expect_equal(e@guest[[2]]@end_value, 2)
})

test_that("home/guest property setter works", {
	r <- routine(end_value = 2)
	e <- event()
	e@home[[2]] <- r
	expect_equal(e@home[[2]]@end_value, 2)
})

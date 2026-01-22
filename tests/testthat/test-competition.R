test_that("default competition has 6 events", {
	comp <- competition()
	expect_length(comp@events, 6)
	expect_true(all(sapply(comp@events, S7::S7_inherits, event)))
})

test_that("score property for competitions works", {
	r1 <- routine(end_value = 2)
	r2 <- routine(end_value = 0.5)
	p1 <- pairing(home = r1)
	p2 <- pairing(guest = r2)
	e1 <- event(pairings = list(p1, p2))
	e2 <- event(pairings = list(p2))
	comp <- competition()
	comp@events[1:2] <- list(e1, e2)
	expect_equal(comp@score, c(4, 4))
})

test_that("end_value property for competitions works", {
	r1 <- routine(end_value = 2)
	r2 <- routine(end_value = 0.5)
	p1 <- pairing(home = r1)
	p2 <- pairing(guest = r2)
	e1 <- event(pairings = list(p1, p2))
	e2 <- event(pairings = list(p2))
	comp <- competition()
	comp@events[1:2] <- list(e1, e2)
	expect_equal(comp@end_value, c(2, 1))
})

test_that("event_result property for competitions works", {
	r1 <- routine(end_value = 2)
	r2 <- routine(end_value = 0.5)
	p1 <- pairing(home = r1)
	p2 <- pairing(guest = r2)
	e1 <- event(pairings = list(p1, p2))
	p3 <- pairing(guest = r1)
	p4 <- pairing(home = r2)
	e2 <- event(pairings = list(p1, p2, p3, p4))
	comp <- competition()
	comp@events[1:2] <- list(e1, e2)
	expect_equal(comp@event_result, c(7, 5))
})


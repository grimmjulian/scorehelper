test_that("default routine has 0 end_value and 0 d_value", {
	r <- routine()
	expect_equal(r@end_value, 0)
	expect_equal(r@d_value, 0)
})

test_that("permutations are correct", {
  event <- new("Event")
  expect_length(permutations(event), 24)
})

test_that("the first two pairings work", {
            r1 <- new("Routine", endvalue = 12)
            r2 <- new("Routine", endvalue = 14)
            p <- new("Pairing", home = r1, guest = r2)
            e <- new("Event", first = p)
            pairings  <- get_first_two_pairings(e)
            expect_equal(pairings, list(new("Pairing"), new("Pairing")))
})

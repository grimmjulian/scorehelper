library(methods)
library(testthat)

get_slot <- function(slot) {
  function(x) slot(x, slot)
}

setClass("TEST", slots = list(a = "character", b = "character"))
for (e in c("a", "b")) {
  def <- eval(parse(text = sprintf("function(x) standardGeneric('%s')", e)))
  setGeneric(e, def = def)
  setMethod(e, "TEST", get_slot(e))
}

test_that("getters work", {
  o <- new("TEST")
  o@a <- "a"
  o@b <- "b"
  expect_equal(a(o), "a")
  expect_equal(b(o), "b")
})

getMethod("a", signature = "TEST")
getMethod("b", signature = "TEST")

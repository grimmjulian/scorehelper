my_in <- function(x, y) {
  foo <- function(x, y) {
    any(sapply(y, identical, x = x))
  }

  if (length(x) > 1) {
    sapply(x, foo, y = y)
  } else {
    foo(x, y)
  }
}

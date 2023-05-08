S4_in <- function(x, y) {
  foo <- function(x, y) {
    any(sapply(y, identical, x = x, USE.NAMES = FALSE))
  }
  if (length(x) == 0) {
    TRUE
  } else if (is.list(x)) {
    unname(sapply(x, foo, y = y, USE.NAMES = FALSE))
  } else if (length(x) > 1) {
    unname(sapply(x, foo, y = y, USE.NAMES = FALSE))
  } else {
    foo(x, y)
  }
}

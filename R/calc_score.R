# The calculation is based on
# https://www.deutsche-turnliga.de/dtl/wissen/regeln.html

calc_score <- function(home = 0, guest = 0) {
  diff <- home - guest
  diff <- abs(diff)
  score <- 0

  if (diff < 0.15) {
    score <- 0
  } else if (diff < 0.3) {
    score <- 1
  } else if (diff < 0.55) {
    score <- 2
  } else if (diff < 1.05) {
    score <- 3
  } else if (diff < 2.05) {
    score <- 4
  } else if (diff < 6.05) {
    score <- 5
  } else {
    score <- 10
  }

  if (home >= guest) {
    return(c(score, 0))
  } else {
    return(c(0, score))
  }
}

#' Calculate the score results
#'
#' @param x An object to calculate the score from
#' @param ... Extra named arguments
#' @rdname score
#' @export
setGeneric("score", function(x, ...) standardGeneric("score"))

#' Rate the score results
#'
#' @param x An object to calculate the score_diff from
#' @param ... Extra named arguments
#' @rdname score_diff
#' @export
setGeneric("score_diff", function(x, ...) standardGeneric("score_diff"))

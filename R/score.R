#' @include pairing.R
#' @include event.R

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
    return(c(home = score, guest = 0))
  } else {
    return(c(home = 0, guest = score))
  }
}

#' Calculate the score results
#'
#' @param x An object to calculate the score from
#' @param ... Extra named arguments
#' @rdname score
#' @export
setGeneric("score", function(x, ...) standardGeneric("score"))

#' Calculate the score result of a pairing
#' @param x An object to calculate the score from
methods::setMethod("score", "Pairing", function(x) {
  calc_score(home = x@home@endvalue, guest = x@guest@endvalue)
})

#' Calculate the score result of an event
#' @param x An object to calculate the score from
methods::setMethod("score", "Event", function(x) {
  Reduce(`+`, lapply(x, score))
})

#' Calculate the score result of a competition
#' @param x An object to calculate the score from
methods::setMethod("score", "Competition", function(x) {
  score(x@floor) +
    score(x@pommel_horse) +
    score(x@still_rings) +
    score(x@vault) +
    score(x@parallel_bars) +
    score(x@horizontal_bar)
})

#' Rate the score results
#'
#' @param x An object to calculate the score_diff from
#' @param ... Extra named arguments
#' @rdname score_diff
#' @export
setGeneric("score_diff", function(x, ...) standardGeneric("score_diff"))

#' Calculate the score result of a pairing
#' @param x An object to calculate the score from
methods::setMethod("score_diff", "Pairing", function(x) {
  s <- unname(score(x))
  return(s[1] - s[2])
})

#' Rate the score result of an event
#' @param x An object to rate the score
methods::setMethod("score_diff", "Event", function(x) {
  Reduce(`+`, lapply(x, score_diff))
})

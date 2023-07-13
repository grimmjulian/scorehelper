#' @include event.R


methods::setClass(
  "Events",
  contains = "list"
)

methods::setValidity("Events", function(object) {
  if (!all(sapply(object, is, class = "Event"))) {
    "Object can only contain objects of class event."
  } else {
    TRUE
  }
})

methods::setMethod(
  "sort",
  "Events",
  function(x, decreasing = FALSE) {
    x <- x[order(sapply(x, score_diff), decreasing = decreasing)]
    return(x)
  }
)

#' Get the Event with the hightest Score difference for the home team
#'
#' @param x Events object to choose from
methods::setMethod(
  "max",
  "Events",
  function(x) {
    x <- x[order(sapply(x, score_diff), decreasing = TRUE)]
    return(x[[1]])
  }
)

#' Get the Event with the lowest Score difference for the home team
#'
#' @param x Events object to choose from
methods::setMethod(
  "min",
  "Events",
  function(x) {
    x <- x[order(sapply(x, score_diff), decreasing = FALSE)]
    return(x[[1]])
  }
)

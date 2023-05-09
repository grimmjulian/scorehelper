#' @include event.R

#' An S4 class that stores a list of events.
#' @export

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

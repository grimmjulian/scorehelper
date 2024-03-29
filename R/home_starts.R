#' Is home starting in this object?
#'
#' @param x The object to check
setGeneric("home_starts", function(x) standardGeneric("home_starts"))

#' Set the starting team of the object
#'
#' @param x The object to set
#' @param value The value that should be set to (boolean)
setGeneric("home_starts<-", function(x, value) standardGeneric("home_starts<-"))

methods::setMethod("home_starts", "Pairing", function(x) x@home_starts)
methods::setMethod("home_starts<-", "Pairing", function(x, value) {
  x@home_starts <- value
  return(x)
})

methods::setMethod("home_starts", "Event", function(x) x[[1]]@home_starts)
methods::setMethod("home_starts<-", "Event", function(x, value) {
  x <- mapply(`home_starts<-`, x = x, value = c(value, value, !value, !value))
  x <- methods::new("Event", x)
  return(x)
})

methods::setMethod("home_starts", "Competition", function(x) home_starts(x@floor))
methods::setMethod("home_starts<-", "Competition", function(x, value) {
  home_starts(x@floor) <- value
  home_starts(x@pommel_horse) <- !value
  home_starts(x@still_rings) <- value
  home_starts(x@vault) <- !value
  home_starts(x@parallel_bars) <- value
  home_starts(x@horizontal_bar) <- !value
  return(x)
})

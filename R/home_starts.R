#' Set the starting team in an object
#'
#' @param x An object to set the starting team to
#' @param home_starts Boolean if home starts'
#' @rdname set_home_starts
#' @export
setGeneric("home_starts", function(x) standardGeneric("home_starts"))
setGeneric("home_starts<-", function(x, value) standardGeneric("home_starts<-"))

#' Calculate the score result of a pairing
#' @param x An object to calculate the score from
methods::setMethod("home_starts", "Pairing", function(x) x@home_starts)
methods::setMethod("home_starts<-", "Pairing", function(x, value) {
  x@home_starts <- value
  x
})

#' Calculate the score result of a pairing
#' @param x An object to calculate the score from
methods::setMethod("home_starts", "Event", function(x) x[[1]]@home_starts)
methods::setMethod("home_starts<-", "Event", function(x, value) {
  x <- mapply(`home_starts<-`, x = x, value = c(value, value, !value, !value))
  methods::new("Event", x)
})
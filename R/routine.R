#' @include gymnast.R

#' An S4 class that stores a routinge
#' @slot gymnast A gymnast object
#' @slot dvalue Numeric dvalue
#' @slot endvalue Numeric endvalue
#' @export

methods::setClass(
  "Routine",
  slots = c(
    gymnast = "Gymnast",
    dvalue = "numeric",
    endvalue = "numeric"
  ),
  prototype = list(
    gymnast = new("Gymnast"),
    dvalue = 0,
    endvalue = 0
  )
)

methods::setGeneric("as.data.frame")

methods::setMethod("as.data.frame", "Routine", function(x) {
  data.frame(
    "gymnast" = x@gymnast@name,
    "dvalue" = x@dvalue,
    "endvalue" = x@endvalue
  )
})


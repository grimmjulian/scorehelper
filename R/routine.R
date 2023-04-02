#' @include gymnast.R

methods::setClass(
  "Routine",
  slots = c(
    gymnast = "Gymnast",
    dvalue = "numeric",
    evalue = "numeric"
  ),
  prototype = list(
    gymnast = new("Gymnast"),
    dvalue = 0,
    evalue = 0
  )
)

methods::setGeneric("as.data.frame")

methods::setMethod("as.data.frame", "Routine", function(x) {
  data.frame(
    "gymnast" = x@gymnast@name,
    "dvalue" = x@dvalue,
    "evalue" = x@evalue
  )
})

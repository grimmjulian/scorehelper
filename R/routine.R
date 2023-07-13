#' @include gymnast.R

methods::setClass(
  "Routine",
  slots = list(
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

methods::setValidity("Routine", function(object) {
  if (length(object@dvalue) > 1) {
    "@dvalue must be of length 1"
  } else if (length(object@endvalue) > 1) {
    "@endvalue must be of length 1"
  } else if (object@dvalue < 0) {
    "@dvalue needs to be positive."
  } else if (object@endvalue < 0) {
    "@endvalue needs to be positive."
  } else {
    TRUE
  }
})

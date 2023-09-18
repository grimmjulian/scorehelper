#' @include gymnast.R

#' @export
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

#' @export
methods::setValidity("Routine", function(object) {
  if (length(object@dvalue) > 1) {
    "@dvalue must be of length 1"
  } else if (length(object@endvalue) > 1) {
    "@endvalue must be of length 1"
  } else if (!is.na(object@dvalue)) {
    if (object@dvalue < 0) {
      "@dvalue needs to be positive."
    } else if (!is.na(object@endvalue)) {
      if (object@endvalue < 0) {
        "@endvalue needs to be positive."
      }
    }
  } else {
    TRUE
  }
})

methods::setMethod(
  "initialize",
  "Routine",
  function(.Object,
           gymnast = new("Gymnast"),
           dvalue = 0,
           endvalue = 0) {
    .Object@gymnast <- gymnast
    .Object@dvalue <- as.numeric(dvalue)
    .Object@endvalue <- as.numeric(endvalue)
    methods::validObject(.Object)
    .Object
  }
)

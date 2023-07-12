#' An S4 class that stores a Gymnast
#' @slot id Numeric ID as on homepage
#' @slot name Name of the gymnast
#' @slot nationality Nationality of the gymnast
#' @export
methods::setClass(
  "Gymnast",
  slots = c(
    id = "character",
    name = "character",
    nationality = "character"
  ),
  prototype = list(
    id = NA_character_,
    name = NA_character_,
    nationality = NA_character_
  )
)

setValidity("Gymnast", function(object) {
  if (length(object@id) > 1) {
    "@id must be of length 1"
  } else if (length(object@name) > 1) {
    "@name must be of length 1"
  } else if (length(object@nationality) > 1) {
    "@nationality must be of length 1"
  } else {
    TRUE
  }
})

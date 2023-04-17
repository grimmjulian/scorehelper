#' An S4 class that stores a Gymnast
#' @slot id Numeric ID as on homepage
#' @slot name Name of the gymnast
#' @slot birthday date of birth
#' @slot nationality Nationality of the gymnast
#' @export
methods::setClass(
  "Gymnast",
  slots = c(
    id = "numeric",
    name = "character",
    birthday = "Date",
    nationality = "character"
  ),
  prototype = list(
    id = NA_integer_,
    name = NA_character_,
    birthday = NA,
    nationality = NA_character_
  )
)

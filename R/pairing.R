#' @include routine.R

#' An S4 class for a pairing of routines
#' @slot home Routine of the home team
#' @slot guest Routine of the guest team
#' @export

methods::setClass(
  "Pairing",
  slots = c(
    home = "Routine",
    guest = "Routine",
    home_starts = "logical"
  ),
  prototype = list(
    home = new("Routine"),
    guest = new("Routine"),
    home_starts = TRUE
  )
)

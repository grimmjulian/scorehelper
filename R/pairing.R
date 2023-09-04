#' @include routine.R

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

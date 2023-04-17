#' @include routine.R

#' An S4 class for a pairing of routines
#' @slot home Routine of the home team
#' @slot guest Routine of the guest team
#' @export

methods::setClass(
  "Pairing",
  slots = c(
    home = "Routine",
    guest = "Routine"
  ),
  prototype = list(
    home = new("Routine"),
    guest = new("Routine")
  )
)

#' Calculate the score result of a pairing
#' @param x An object to calculate the score from
methods::setMethod("score", "Pairing", function(x) {
  calc_score(home = x@home@evalue, guest = x@guest@evalue)
})

methods::setMethod("as.data.frame", "Pairing", function(x) {
  home <- as.data.frame(x@home)
  guest <- as.data.frame(x@guest)
  s <- score(x)
  df <- cbind(home, score = s[1], guest, score = s[2])
  colnames(df)[1:4] <- paste0(colnames(df)[1:4], "_home")
  colnames(df)[5:8] <- paste0(colnames(df)[5:8], "_guest")
  df
})

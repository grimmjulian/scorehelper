#' @include event.R
methods::setGeneric("as.data.frame")

methods::setMethod("as.data.frame", "Routine", function(x) {
  data.frame(
    "gymnast" = x@gymnast@name,
    "dvalue" = x@dvalue,
    "endvalue" = x@endvalue
  )
})

methods::setMethod("as.data.frame", "Pairing", function(x) {
  home <- as.data.frame(x@home)
  guest <- as.data.frame(x@guest)
  s <- score(x)
  df <- cbind(home, score = s[1], guest, score = s[2], home_starts = home_starts(x))
  colnames(df)[1:4] <- paste0(colnames(df)[1:4], "_home")
  colnames(df)[5:8] <- paste0(colnames(df)[5:8], "_guest")
  rownames(df) <- NULL
  df
})

methods::setMethod("as.data.frame", "Event", function(x) {
  pairing_data <- do.call(rbind, lapply(x, as.data.frame))
  pairing_data <- cbind(order = 1:4, pairing_data)
  return(pairing_data)
})

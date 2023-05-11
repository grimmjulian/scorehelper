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
  df <- cbind(home, score = s[1], guest, score = s[2])
  colnames(df)[1:4] <- paste0(colnames(df)[1:4], "_home")
  colnames(df)[5:8] <- paste0(colnames(df)[5:8], "_guest")
  df
})

methods::setMethod("as.data.frame", "Event", function(x) {
  rbind(
    as.data.frame(x[[1]]),
    as.data.frame(x[[2]]),
    as.data.frame(x[[3]]),
    as.data.frame(x[[4]])
  )
})

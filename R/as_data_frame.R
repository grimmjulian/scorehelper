#' @include competition.R
#' @export
methods::setGeneric("as.data.frame")

#' @export
methods::setMethod("as.data.frame", "Routine", function(x) {
  data.frame(
    "team" = x@gymnast@team@name,
    "gymnast" = x@gymnast@name,
    "dvalue" = x@dvalue,
    "endvalue" = x@endvalue
  )
})

#' @export
methods::setMethod("as.data.frame", "Pairing", function(x) {
  home <- as.data.frame(x@home)
  guest <- as.data.frame(x@guest)
  s <- score(x)
  df <- cbind(home, score = s[1], guest, score = s[2], home_starts = home_starts(x))
  colnames(df)[seq_len(ncol(home))] <- paste0(colnames(df)[seq_len(ncol(home))], "_home")
  colnames(df)[seq_len(ncol(home)) + ncol(home)] <- paste0(colnames(df)[seq_len(ncol(home)) + ncol(home)], "_guest")
  rownames(df) <- NULL
  df
})

#' @export
methods::setMethod("as.data.frame", "Event", function(x) {
  pairing_data <- do.call(rbind, lapply(x, as.data.frame))
  pairing_data <- cbind(pairing_order = 1:4, pairing_data)
  return(pairing_data)
})

#' @export
methods::setMethod("as.data.frame", "Competition", function(x) {
  comp_data <- do.call(rbind, lapply(as.list(x), as.data.frame))
  order <- rep(1:6, each = 4)
  df <- cbind(order = rownames(comp_data), event_order = order, comp_data)
  rownames(df) <- NULL
  df <- rbind(df, as.data.frame(x$competition_information))
  df
})

#' @export
methods::setMethod("as.data.frame", "competition_information", function(x) {
  data.frame(url = x$url, date = x$date, location = x$location)
})

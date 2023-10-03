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
  home_cols <- seq_len(ncol(home) + 1)
  guest_cols <- home_cols + ncol(home) + 1
  colnames(df)[home_cols] <- paste0(colnames(df)[home_cols], "_home")
  colnames(df)[guest_cols] <- paste0(colnames(df)[guest_cols], "_guest")
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
  event <- rep(event_names, each = 4)
  df <- x |>
    as.list() |>
    lapply(as.data.frame) |>
    do.call(rbind, args = _)
  cbind(event, df, as.data.frame(x@information))
})

#' @export
methods::setMethod("as.data.frame", "competition_information", function(x) {
  data.frame(url = x@url, time = x@time, location = x@location)
})

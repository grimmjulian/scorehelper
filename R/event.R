#' @include pairing.R


methods::setClass(
  "Event",
  slots = c(
    first = "Pairing",
    second = "Pairing",
    third = "Pairing",
    fourth = "Pairing"
  ),
  prototype = list(
    first = new("Pairing"),
    second = new("Pairing"),
    third = new("Pairing"),
    fourth = new("Pairing")
  )
)

methods::setMethod("as.data.frame", "Event", function(x) {
  rbind(
    as.data.frame(x@first),
    as.data.frame(x@second),
    as.data.frame(x@third),
    as.data.frame(x@fourth)
  )
})

methods::setMethod("score", "Event", function(x) {
  score(x@first) + score(x@second) + score(x@third) + score(x@fourth)
})

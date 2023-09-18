get_event <- function(event) {
  function(x) methods::slot(x, event)
}

# No generic for floor method because of base R floor function
methods::setMethod("floor", "Competition", get_event("floor"))

methods::setGeneric("pommel_horse", def = function(x) standardGeneric("pommel_horse"))
methods::setMethod("pommel_horse", "Competition", get_event("pommel_horse"))

methods::setGeneric("still_rings", def = function(x) standardGeneric("still_rings"))
methods::setMethod("still_rings", "Competition", get_event("still_rings"))

methods::setGeneric("vault", def = function(x) standardGeneric("vault"))
methods::setMethod("vault", "Competition", get_event("vault"))

methods::setGeneric("parallel_bars", def = function(x) standardGeneric("parallel_bars"))
methods::setMethod("parallel_bars", "Competition", get_event("parallel_bars"))

methods::setGeneric("horizontal_bar", def = function(x) standardGeneric("horizontal_bar"))
methods::setMethod("horizontal_bar", "Competition", get_event("horizontal_bar"))


methods::setGeneric("floor<-", def = function(x, value) standardGeneric("floor<-"))
methods::setMethod(
  "floor<-", "Competition",
  function(x, value) {
    home_starts(value) <- home_starts(floor(x))
    methods::slot(x, "floor") <- value
    methods::validObject(x)
    x
  }
)

methods::setGeneric("pommel_horse<-", def = function(x, value) standardGeneric("pommel_horse<-"))
methods::setMethod(
  "pommel_horse<-", "Competition",
  function(x, value) {
    home_starts(value) <- home_starts(pommel_horse(x))
    methods::slot(x, "pommel_horse") <- value
    methods::validObject(x)
    x
  }
)

methods::setGeneric("still_rings<-", def = function(x, value) standardGeneric("still_rings<-"))
methods::setMethod(
  "still_rings<-", "Competition",
  function(x, value) {
    home_starts(value) <- home_starts(still_rings(x))
    methods::slot(x, "still_rings") <- value
    methods::validObject(x)
    x
  }
)

methods::setGeneric("vault<-", def = function(x, value) standardGeneric("vault<-"))
methods::setMethod(
  "vault<-", "Competition",
  function(x, value) {
    home_starts(value) <- home_starts(vault(x))
    methods::slot(x, "vault") <- value
    methods::validObject(x)
    x
  }
)

methods::setGeneric("parallel_bars<-", def = function(x, value) standardGeneric("parallel_bars<-"))
methods::setMethod(
  "parallel_bars<-", "Competition",
  function(x, value) {
    home_starts(value) <- home_starts(parallel_bars(x))
    methods::slot(x, "parallel_bars") <- value
    methods::validObject(x)
    x
  }
)

methods::setGeneric("horizontal_bar<-", def = function(x, value) standardGeneric("horizontal_bar<-"))
methods::setMethod(
  "horizontal_bar<-", "Competition",
  function(x, value) {
    home_starts(value) <- home_starts(horizontal_bar(x))
    methods::slot(x, "horizontal_bar") <- value
    methods::validObject(x)
    x
  }
)

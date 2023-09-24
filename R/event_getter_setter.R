event_names <- c(
  "floor",
  "pommel_horse",
  "still_rings",
  "vault",
  "parallel_bars",
  "horizontal_bar"
)

# No generic for floor method because of base R floor function
for (e in event_names[-1]) {
  eval(substitute(setGeneric(sn, function(x) standardGeneric(sn)), list(sn = e)))
}

get_event <- function(event) {
  force(event)
  function(x) methods::slot(x, event)
}

for (e in event_names) {
  setMethod(e, "Competition", get_event(e))
}

set_event <- function(event) {
  force(event)
  function(x, value) {
    getter <- get(event)
    home_starts(value) <- home_starts(getter(x))
    methods::slot(x, event) <- value
    methods::validObject(x)
    x
  }
}

for (e in event_names) {
  f <- paste0(e, "<-")
  eval(substitute(setGeneric(sn, function(x, value) standardGeneric(sn)), list(sn = f)))
}

for (e in event_names) {
  f <- paste0(e, "<-")
  setMethod(f, "Competition", set_event(e))
}

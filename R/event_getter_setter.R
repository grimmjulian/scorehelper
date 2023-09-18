get_event <- function(event) {
  function(x) slot(x, event)
}

# No generic for floor method because of base R floor function
methods::setMethod("floor", "Competition", get_event("floor"))

for (e in event_names[-1]) {
  def <- eval(parse(text = sprintf("function(x) standardGeneric('%s')", e)))
  methods::setGeneric(e, def = def)
  methods::setMethod(e, "Competition", get_event(e))
}

set_event <- function(event) {
  getter <- get(event)
  function(x, value) {
    home_starts(value) <- home_starts(getter(x))
    slot(x, event) <- value
    methods::validObject(x)
    x
  }
}

for (e in event_names) {
  name <- sprintf("%s<-", e)
  def <- eval(parse(text = sprintf("function(x, value) standardGeneric('%s')", name)))
  methods::setGeneric(name, def = def)
  methods::setMethod(name, "Competition", set_event(e))
}



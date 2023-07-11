#' @include event.R

#' Get routines of a team
#'
#' @param x An object with routines for two teams
#' @rdname get_team
#' @export
setGeneric("get_routines", function(x, team) standardGeneric("get_routines"))

#' Get the routine of a team in a pairing
#' @param x An object to calculate the score from
#' @param team Which team the routines should be extracted for
methods::setMethod("get_routines", "Pairing", function(x, team) {
  stopifnot(team %in% c("home", "guest"))
  return(slot(x, team))
})


#' Get the routines of a team in an event
#' @param x An object to calculate the score from
#' @param team Which team the routines should be extracted for
methods::setMethod("get_routines", "Event", function(x, team) {
  lapply(X = x, FUN = get_routines, team = team)
})

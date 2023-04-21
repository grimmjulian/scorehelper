team_routines <- function(event, team = "guest") {
  event <- as.list(event)
  routines <- lapply(event, slot, name = team)
  return(routines)
}

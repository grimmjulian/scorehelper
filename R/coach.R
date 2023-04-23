team_routines <- function(event, team = "guest") {
  event <- as.list(event)
  routines <- lapply(event, slot, name = team)
  return(routines)
}


methods::setMethod("reorder",
                   "Event", 
                   function(x, home_order = 1:4, guest_order = 1:4, home_starts = x@first@home_starts) {
  home <- team_routines(x, team = "home")[home_order]
  guest <- team_routines(x, team = "guest")[guest_order]
  event <- Event.routines(home, guest, home_starts = home_starts)
  return(event)
})

## code to prepare `event_names` dataset goes here
event_names <- c(
  "floor",
  "pommel_horse",
  "still_rings",
  "vault",
  "parallel_bars",
  "horizontal_bar"
)

usethis::use_data(event_names, internal = TRUE)

## code to prepare `crawl_results` dataset goes here

library("rvest")

url <- "https://www.deutsche-turnliga.de/dtl/historie/archiv/detailsm0.html?ID=2399"

html <- read_html(url)

extract_table <- function(html, table_nr = 1) {
  html |>
    html_elements("table") |>
    _[[table_nr]] |>
    html_table()
}

extract_information <- function(html, url = NA_character_) {
  results <- extract_table(html, 2)
  comp_info <- new("competition_information")
  comp_info@home_team <- new("Team", as.character(results[1, 1]))
  comp_info@guest_team <- new("Team", as.character(results[1, 6]))
  comp_info@url <- url
  comp_info
}

to_num <- function(x) {
  gsub(",", "\\.", x) |> as.numeric()
}

extract_raw_results <- function(html) {
  results <- extract_table(html, 2)
  num_cols <- c("X2", "X3", "X7", "X8")
  gymnast_cols <- c("X1", "X6")
  cols <- c(num_cols, gymnast_cols)
  results <- results[-c(1:3, 8:10, 15:17, 22:24, 29:31, 36:38, 43:44), cols]
  results[num_cols] <- lapply(results[num_cols], to_num)
  results
}

extract_gymnasts <- function(html) {
  comp_info <- extract_information(html)
  gymnast <- function(name, team) new("Gymnast", name = name, team = team)
  routines <- extract_raw_results(html)
  home <- lapply(as.list(routines$X1), gymnast, team = comp_info@home_team)
  guest <- lapply(as.list(routines$X6), gymnast, team = comp_info@guest_team)
  list(home = home, guest = guest)
}

extract_routines <- function(html) {
  gymnasts <- extract_gymnasts(html)
  routines <- extract_raw_results(html)
  home <- mapply(function(x, y, z) new("Routine", x, y, z), gymnasts[["home"]], routines$X2, routines$X3)
  guest <- mapply(function(x, y, z) new("Routine", x, y, z), gymnasts[["guest"]], routines$X7, routines$X8)
  list(home = home, guest = guest)
}

extract_pairings <- function(html) {
  routines <- extract_routines(html)
  mapply(new, Class = "Pairing", home = routines[["home"]], guest = routines[["guest"]])
}

extract_events <- function(html) {
  pairings <- extract_pairings(html)
  pairings_split <- split(pairings, rep(1:6, each = 4))
  lapply(pairings_split, Event.pairings)
}

extract_competition_results <- function(html) {
  events <- extract_events(html)
  comp <- new("Competition")
  floor(comp) <- events[[1]]
  pommel_horse(comp) <- events[[2]]
  still_rings(comp) <- events[[3]]
  vault(comp) <- events[[4]]
  parallel_bars(comp) <- events[[5]]
  horizontal_bar(comp) <- events[[6]]
  comp
}

extract_competition <- function(html, url = NA_character_) {
  comp <- extract_competition_results(html)
  comp_info <- extract_information(html, url)
  comp@information <- comp_info
  comp
}

extract_competition(html)

craw_competition <- function(url) {
  html <- read_html(url)
  extract_competition(html)
}

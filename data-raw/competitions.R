## code to prepare `crawl_results` dataset goes here

library("rvest")

url <- "https://www.deutsche-turnliga.de/dtl/historie/archiv/detailsm0.html?ID=2399"

html <- read_html(url)

tables <- html |> html_elements("table")
results <- tables[[2]] |> html_table()
comp_info <- new("competition_information")
comp_info@home_team <- new("Team", as.character(results[1, 1]))
comp_info@guest_team <- new("Team", as.character(results[1, 6]))
comp_info@url <- url

routines <- results[-c(1:3, 8:10, 15:17, 22:24, 29:31, 36:38, 43:44), ]
routines <- routines[-c(4:5, 9:11)]

home_gymnasts <- lapply(as.list(routines$X1), function(x) new("Gymnast", name = x, team = comp_info@home_team))
guest_gymnasts <- lapply(as.list(routines$X6), function(x) new("Gymnast", name = x, team = comp_info@guest_team))

to_num <- function(x) {
  gsub(",", "\\.", x) |> as.numeric()
}

home_routines <- mapply(function(x, y, z) new("Routine", x, y, z), home_gymnasts, to_num(routines$X2), to_num(routines$X3))
guest_routines <- mapply(function(x, y, z) new("Routine", x, y, z), guest_gymnasts, to_num(routines$X7), to_num(routines$X8))

pairings <- mapply(new, Class = "Pairing", home = home_routines, guest = guest_routines)

pairings_split <- split(pairings, rep(1:6, each = 4))
events <- lapply(pairings_split, Event.pairings)

comp <- new("Competition")
floor(comp) <- events[[1]]
pommel_horse(comp) <- events[[2]]
still_rings(comp) <- events[[3]]
vault(comp) <- events[[4]]
parallel_bars(comp) <- events[[5]]
horizontal_bar(comp) <- events[[6]]

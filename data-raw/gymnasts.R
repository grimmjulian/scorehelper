## code to prepare `gymnasts` dataset goes here

library(rvest)

gymnast_url <- function(id) {
  paste0("https://www.deutsche-turnliga.de/vereine/turner.html?ID=", id)
}

gymnast_page <- function(id) {
  read_html(gymnast_url(id)) |>
    html_elements("#verein-turner")
}

gymnast_pages <- lapply(1:100, gymnast_page)

extract_gymnast_name <- function(page) {
  page |> 
    html_elements("h1") |>
    html_text2()
}

lapply(gymnast_pages, extract_gymnast_name)

get_table_data <- function(id) {
  gymnast <- read_html(gymnast_url(id))
  name <- gymnast |>
    html_elements("h1") |>
    html_text2()
  data <- gymnast |>
    html_node("table")
  if (inherits(data, "xml_missing")) {
    data <- (data.frame(X1 = NA, X2 = NA, id = id))
  } else {
    data <- html_table(data)
    data[["id"]] <- id
  }
  data[["name"]] <- name
  return(data)
}

for (id in 1:100) {
  row <- get_table_data(id)
  gymnasts <- rbind(gymnasts, row)
}

get_table_data(1)
get_table_data(2)
get_table_data(9999)

scrape_gymnast_data <- function(id) {
  url <- paste0("https://www.deutsche-turnliga.de/vereine/turner.html?ID=", id)
  gymnast <- read_html(url)
  name <- gymnast |>
    html_elements("h1") |>
    html_text2()
  data <- gymnast |>
    html_node("table") |>
    html_table()
  nationality <- as.character(data[data$X1 == "Nationalität", 2])
  birthday <- data[data$X1 == "Geburtsdatum", 2] |>
    sub(" (.*)$", "", x = _) |>
    as.Date(format = "%d.%m.%Y")
  new("Gymnast", id = id, name = name, nationality = nationality, birthday = birthday)
}

scrape_gymnast_data(150000)

for (id in 1:15) {
  gymnast <- scrape_gymnast_data(id)
  gymnasts[id, "id"] <- gymnast@id
  gymnasts[id, "url"] <- gymnast@url
  gymnasts[id, "name"] <- gymnast@name
  gymnasts[id, "nationality"] <- gymnast@nationality
  gymnasts[id, "birthday"] <- gymnast@birthday
}



# usethis::use_data(gymnasts, overwrite = TRUE)

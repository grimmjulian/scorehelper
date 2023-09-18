## code to prepare `crawl_results` dataset goes here

library("rvest")

url <- "https://www.deutsche-turnliga.de/dtl/historie/archiv/detailsm0.html?ID=2399"

html <- read_html(url)

tables <- html |> html_elements("table")
results <- tables[[2]] |> html_table()
usethis::use_data(competitions, overwrite = TRUE)

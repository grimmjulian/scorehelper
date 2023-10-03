## code to prepare `crawl_results` dataset goes here

urls_2022_3_S <- paste0(
  "https://www.deutsche-turnliga.de/dtl/historie/archiv.html?Typ=Mann&SaisonID=17&LigaID=648&TagesID=570",
  c(
    570, 589, 590, 591, 592, 593, 594
  )
)

urls_2022_2_S <- paste0(
  "https://www.deutsche-turnliga.de/dtl/historie/archiv.html?Typ=Mann&SaisonID=17&LigaID=641&TagesID=",
  c(
    582,
    581,
    580,
    579,
    578,
    577,
    568
  )
)

urls_2022 <- c(urls_2022_3_S, urls_2022_2_S)

urls_2023 <- paste0(
  "https://www.deutsche-turnliga.de/bundesliga-2/maenner-sued/wettkampftag.html?TagesID=",
  610:611 # update one more for each week till 616
)

urls <- c(urls_2022, urls_2023)

crawled_urls <- sapply(competitions, function(x) x@information@url)
error_urls <- c(
  "https://www.deutsche-turnliga.de/dtl/historie/archiv/detailsm0.html?ID=2456"
)
skip_urls <- c(crawled_urls, error_urls)
filter_skip_urls <- function(y) Filter(Negate(function(x) x %in% skip_urls), y)

competitions <- urls |>
  crawl_competition_urls() |>
  filter_skip_urls() |>
  lapply(crawl_competition)

usethis::use_data(competitions, overwrite = TRUE)

competitions_csv_data <- competitions |>
  lapply(as.data.frame) |>
  do.call(rbind, args = _)

write.csv2(competitions_csv_data, file = "data-raw/competitions.csv")

home_routines_csv <- function(df) {
  suffix_good <- "_home$"
  suffix_bad <- "_guest$"
  columns <- grep(suffix_bad, names(df))
  df <- df[, -columns]
  colnames(df) <- sub(suffix_good, "", colnames(df))
  df
}

guest_routines_csv <- function(df) {
  suffix_good <- "_guest$"
  suffix_bad <- "_home$"
  columns <- grep(suffix_bad, names(df))
  df <- df[, -columns]
  colnames(df) <- sub(suffix_good, "", colnames(df))
  df
}

routines_csv_data_home <- home_routines_csv(competitions_csv_data)
routines_csv_data_guest <- guest_routines_csv(competitions_csv_data)
routines_csv_data <- rbind(routines_csv_data_home, routines_csv_data_guest)

write.csv2(routines_csv_data, file = "data-raw/routines.csv")

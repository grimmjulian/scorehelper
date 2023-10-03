## code to prepare `crawl_results` dataset goes here
urls_2022 <- paste0(
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

urls_2023 <- paste0(
  "https://www.deutsche-turnliga.de/bundesliga-2/maenner-sued/wettkampftag.html?TagesID=",
  610:611 # update one more for each week till 616
)

urls <- c(urls_2022, urls_2023)
competitions <- urls |>
  crawl_competition_urls() |>
  lapply(crawl_competition)

usethis::use_data(competitions, overwrite = TRUE)

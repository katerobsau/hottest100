load("./data/tracks.rda")

library(dplyr)

artists <- tracks |>
  distinct(artist, country, releaseyear) |>
  mutate(releaseyear = as.integer(releaseyear))

readr::write_csv(artists, "data-raw/csv/hottest100-artists.csv")
usethis::use_data(artists, overwrite = TRUE)

  

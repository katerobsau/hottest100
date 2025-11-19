load("./data/hottest100_tracks.rda")

library(dplyr)
library(tidyr)

hottest100_artists <- hottest100_tracks |>
  distinct(artist, country, releaseyear)

usethis::use_data(hottest100_artists, overwrite = TRUE)
  

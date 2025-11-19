library(rvest)

# Obtain the HTML content from the hottest 100 archive page
html_src <- read_html("https://www.abc.net.au/triplej/hottest100/archive/search/")

# Find all scripts in the HTML
html_scripts <- html_elements(src, "script") |> html_text()

# Find the script which contains the hottest 100 data
hottest100_script <- scripts[stringr::str_detect(scripts, "var tracks =") ]

# Extract the JSON parts from the script
track_i <- regexpr("var tracks =", hottest100_script)
album_i <- regexpr("var albums =", hottest100_script)
hottest100_track_json <- substr(hottest100_script, track_i + attr(track_i, "match.length"), album_i - 1)
hottest100_album_json <- substr(hottest100_script, album_i + attr(album_i, "match.length"), nchar(hottest100_script) - 1)

# Parse the JSON data
hottest100_tracks <- jsonlite::fromJSON(hottest100_track_json)
hottest100_albums <- jsonlite::fromJSON(hottest100_album_json)

usethis::use_data(hottest100_tracks, overwrite = TRUE)
usethis::use_data(hottest100_albums, overwrite = TRUE)

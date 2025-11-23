# Triple J Hottest 100 Track Data

A dataset containing track-level data from the Triple J Hottest 100.
Scraped on 22 Nov, 2025 from the official Triple J archive.

## Usage

``` r
tracks
```

## Format

A data.frame with one row per track, including variables such as:

- alltime:

  Logical; indicates if the entry is from an all-time chart or specific
  year.

- artist:

  Character; name of the artist or band associated with the track.

- country:

  Character; the country associated with the track/chart.

- id:

  Unique identifier for each track (within year)

- pollyear:

  Countdown poll year

- position:

  Chart position of the track.

- releaseyear:

  Original release year of the track.

- track:

  Title of the track or song.

## Source

<https://www.abc.net.au/triplej/hottest100/archive/search/>

## Examples

``` r
library(dplyr)
as_tibble(tracks)
#> # A tibble: 4,200 × 8
#>    alltime artist           country   id    pollyear position releaseyear track 
#>    <lgl>   <chr>            <chr>     <chr>    <int>    <int> <chr>       <chr> 
#>  1 FALSE   Spiderbait       Australia 1         1996        1 1996        Buy M…
#>  2 FALSE   Tool             USA       2         1996        2 1996        Stink…
#>  3 FALSE   Ben Folds Five   USA       3         1996        3 1996        Under…
#>  4 FALSE   Butthole Surfers USA       4         1996        4 1996        Pepper
#>  5 FALSE   Bush             UK        5         1996        5 1996        Glyce…
#>  6 FALSE   Powderfinger     Australia 6         1996        6 1996        Pick …
#>  7 FALSE   The Prodigy      UK        7         1996        7 1996        Breat…
#>  8 FALSE   Allen Ginsberg   USA       8         1996        8 1996        Balla…
#>  9 FALSE   Weezer           USA       9         1996        9 1996        El Sc…
#> 10 FALSE   311              USA       10        1996       11 1996        Down  
#> # ℹ 4,190 more rows

# What are the top 1 tracks not incuding the "alltime" counts
tracks |>
  filter(
    position == 1,
    alltime == FALSE
  ) |>
  arrange(pollyear) |>
  relocate(
    pollyear,
    position,
    track,
    artist,
    country,
    releaseyear,
    id
  )
#>    pollyear position                                     track
#> 1      1993        1                                   Asshole
#> 2      1994        1                                    Zombie
#> 3      1995        1                                Wonderwall
#> 4      1996        1                             Buy Me a Pony
#> 5      1997        1                            No Aphrodisiac
#> 6      1998        1              Pretty Fly (For a White Guy)
#> 7      1999        1                                These Days
#> 8      2000        1                              My Happiness
#> 9      2001        1                                   Amazing
#> 10     2002        1                              No One Knows
#> 11     2003        1                 Are You Gonna Be My Girl?
#> 12     2004        1                               Take Me Out
#> 13     2005        1                             Wish You Well
#> 14     2006        1                          One Crowded Hour
#> 15     2007        1                        Knights of Cydonia
#> 16     2008        1                               Sex on Fire
#> 17     2009        1                           Little Lion Man
#> 18     2010        1                             Big Jet Plane
#> 19     2011        1 Somebody That I Used to Know {ft. Kimbra}
#> 20     2012        1                    Thrift Shop {ft. Wanz}
#> 21     2013        1                                   Riptide
#> 22     2014        1                             Talk Is Cheap
#> 23     2015        1                                     Hoops
#> 24     2016        1               Never Be Like You {Ft. Kai}
#> 25     2017        1                                   HUMBLE.
#> 26     2018        1                                Confidence
#> 27     2019        1                                   bad guy
#> 28     2020        1                                Heat Waves
#> 29     2021        1   Elephant [triple j Like A Version 2021]
#> 30     2022        1                               Say Nothing
#> 31     2023        1                        Paint The Town Red
#> 32     2024        1                          Good Luck, Babe!
#>                     artist   country releaseyear         id alltime
#> 1              Denis Leary       USA        1993        547   FALSE
#> 2          The Cranberries   Ireland        1994       1821   FALSE
#> 3                    Oasis        UK        1995       1368   FALSE
#> 4               Spiderbait Australia        1996          1   FALSE
#> 5             The Whitlams Australia        1997        909   FALSE
#> 6            The Offspring       USA        1998        640   FALSE
#> 7             Powderfinger Australia        1999       1638   FALSE
#> 8             Powderfinger Australia        2000       1455   FALSE
#> 9               Alex Lloyd Australia        2001        995   FALSE
#> 10 Queens of the Stone Age       USA        2002        176   FALSE
#> 11                     Jet Australia        2003       1548   FALSE
#> 12         Franz Ferdinand        UK        2004        730   FALSE
#> 13         Bernard Fanning Australia        2005       1730   FALSE
#> 14             Augie March Australia        2006       1272   FALSE
#> 15                    Muse        UK        2007       1087   FALSE
#> 16           Kings of Leon       USA        2008       1182   FALSE
#> 17          Mumford & Sons        UK        2009        265   FALSE
#> 18     Angus & Julia Stone Australia        2010        454   FALSE
#> 19                   Gotye Australia        2011       2201   FALSE
#> 20 Macklemore & Ryan Lewis       USA        2012       2502   FALSE
#> 21               Vance Joy Australia        2013       2702   FALSE
#> 22              Chet Faker Australia        2014       2802   FALSE
#> 23              The Rubens Australia        2015       2902   FALSE
#> 24                   Flume Australia        2016       3002   FALSE
#> 25          Kendrick Lamar       USA        2017        910   FALSE
#> 26             Ocean Alley Australia        2018       1140   FALSE
#> 27           Billie Eilish       USA        <NA>     edc6f2   FALSE
#> 28           Glass Animals        UK        2020   D1F13F72   FALSE
#> 29             The Wiggles Australia        2021      12021   FALSE
#> 30       Flume [Ft. MAY-A] Australia        2022 mpL5pbNQMn   FALSE
#> 31                Doja Cat       USA        2023 mpr8bab0NL   FALSE
#> 32           Chappell Roan       USA        2024 mpnYv168jL   FALSE
```

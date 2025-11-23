# Triple J Hottest 100 Artists

A deduplicated dataset of artists represented in the Triple J Hottest
100, created from `tracks`.

## Usage

``` r
artists
```

## Format

A data.frame with one row per artist, including variables:

- artist:

  Artist name

- country:

  Country of origin

- releaseyear:

  Release year of included track

## Source

Derived from `tracks`

## Examples

``` r
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
as_tibble(artists)
#> # A tibble: 2,729 × 3
#>    artist           country   releaseyear
#>    <chr>            <chr>     <chr>      
#>  1 Spiderbait       Australia 1996       
#>  2 Tool             USA       1996       
#>  3 Ben Folds Five   USA       1996       
#>  4 Butthole Surfers USA       1996       
#>  5 Bush             UK        1996       
#>  6 Powderfinger     Australia 1996       
#>  7 The Prodigy      UK        1996       
#>  8 Allen Ginsberg   USA       1996       
#>  9 Weezer           USA       1996       
#> 10 311              USA       1996       
#> # ℹ 2,719 more rows
# who has appeared 10 or more times?
artists |>
  count(artist, sort = TRUE) |>
  filter(n >= 10)
#>                  artist  n
#> 1         Hilltop Hoods 14
#> 2          Foo Fighters 12
#> 3              The Cure 12
#> 4        The Living End 12
#> 5        Arctic Monkeys 11
#> 6             Radiohead 11
#> 7  Bring Me The Horizon 10
#> 8             Grinspoon 10
#> 9                  Illy 10
#> 10           Kanye West 10
#> 11            Metallica 10
#> 12            Pearl Jam 10
#> 13         Powderfinger 10
#> 14               R.E.M. 10
#> 15          Tame Impala 10
#> 16                   U2 10
# top 10 artists?
artists |>
  count(country, sort = TRUE) |>
  slice_max(n = 10, order_by = n)
#>        country    n
#> 1    Australia 1234
#> 2          USA  757
#> 3           UK  479
#> 4       Canada   48
#> 5  New Zealand   29
#> 6       Sweden   27
#> 7      Ireland   23
#> 8       France   18
#> 9      Germany   11
#> 10     Iceland   11
```

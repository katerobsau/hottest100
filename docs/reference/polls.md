# Triple J Hottest 100 Polls

A dataset with information about each Triple J Hottest 100 poll. Scraped
on 22 Nov, 2025 from the official Triple J archive.

## Usage

``` r
polls
```

## Format

A data.frame with one row per countdown, including variables such as:

- year:

  The year the poll was held.

- alltime:

  Logical; whether the poll was an "All-Time" countdown

- alltimedescription:

  A description of the poll, if applicable.

- colorRGB:

  Primary RGB color value associated with the year in character format.

- contrastColorRGB:

  Contrasting RGB color value (in character format) suitable for text
  overlay.

## Source

<https://www.abc.net.au/triplej/hottest100/archive/search/>

## Examples

``` r
library(dplyr)
as_tibble(polls)
#> # A tibble: 42 × 5
#>     year alltime alltimedescription    colorRGB      contrastColorRGB
#>    <int> <lgl>   <chr>                 <chr>         <chr>           
#>  1  2025 TRUE    "Of Australian Songs" 224, 49, 37   NA              
#>  2  2024 FALSE   ""                    119, 38, 127  NA              
#>  3  2023 FALSE   ""                    221, 121, 62  0, 0, 0         
#>  4  2023 TRUE    "Like A Version"      46, 65, 79    NA              
#>  5  2022 FALSE   ""                    248, 215, 189 0, 0, 0         
#>  6  2021 FALSE   ""                    0, 135, 0     NA              
#>  7  2020 FALSE   ""                    239, 43, 204  0, 0, 0         
#>  8  2020 TRUE    "Of The Decade"       16, 32, 92    NA              
#>  9  2019 FALSE   ""                    244, 171, 68  0, 0, 0         
#> 10  2018 FALSE   ""                    181, 204, 62  0, 0, 0         
#> # ℹ 32 more rows
```

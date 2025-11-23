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

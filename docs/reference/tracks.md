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

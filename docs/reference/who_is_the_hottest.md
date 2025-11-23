# Find the best in any year

This function will help searching for information by year

## Usage

``` r
who_is_the_hottest(year, special = NULL)
```

## Arguments

- year:

  integer, pollyear to search in \`tracks\` data.

- special:

  logical, whether to include \`alltime\` in the data. Default is to not
  include this.

## Examples

``` r
who_is_the_hottest(1993)
#> In 1993, Denis Leary was the hottest!
who_is_the_hottest(2023)
#> In 2023, Doja Cat was the hottest!
```

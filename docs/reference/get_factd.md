# Get the facts

This function will provide some random facts in one of several different
categories of fact(d)s: artists with the most entries ever; artist who
has the most entries in regular countdowns ever; Artist who has the most
entries in the top 10 ever, Artist who has the most entries in the top
10 regular countdowns ever, artist who has appeared in the most number
of countdowns, artist who has appeared in the most number of reg
countdowns.

## Usage

``` r
get_factd(factd = sample(1:6, 1))
```

## Arguments

- factd:

  is the type of fact to extract, defaults to sample(1:6)

## Examples

``` r
get_factd()
#> The Cure has appeared in largest number of past countdowns. They have made appearances in 9 different countdowns!
get_factd()
#> [1] "Billie Eilish has appeared in 7 yearly countdowns. G Flip has appeared in 7 yearly countdowns.  That's higher than any other artist"
get_factd()
#> Powderfinger has the most top 10 entries in the yearly countdowns. They have appeared 9 times!
```

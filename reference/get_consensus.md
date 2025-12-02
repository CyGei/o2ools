# Get the consensus transmission tree

Computes the most frequent ancestor for each case across the posterior
sample.

## Usage

``` r
get_consensus(out)
```

## Arguments

- out:

  An object of class `outbreaker_chains`

## Value

A data frame showing the most frequent ancestor for each case.

## Examples

``` r
get_consensus(out)
#>    from to frequency
#> 1  <NA>  1 1.0000000
#> 2     9 10 0.9950249
#> 3     7 11 0.8109453
#> 4     8 12 0.8358209
#> 5     9 13 1.0000000
#> 6     5 14 0.9900498
#> 7     5 15 0.7263682
#> 8     7 16 0.9950249
#> 9     7 17 0.9701493
#> 10    8 18 0.9651741
#> 11    9 19 1.0000000
#> 12    1  2 1.0000000
#> 13   10 20 1.0000000
#> 14   11 21 1.0000000
#> 15   11 22 1.0000000
#> 16   13 23 1.0000000
#> 17   13 24 1.0000000
#> 18   13 25 1.0000000
#> 19   17 26 0.9751244
#> 20   17 27 1.0000000
#> 21 <NA> 28 1.0000000
#> 22   10 29 1.0000000
#> 23    2  3 1.0000000
#> 24   13 30 1.0000000
#> 25 <NA>  4 1.0000000
#> 26    3  5 1.0000000
#> 27   10  6 0.9950249
#> 28    4  7 1.0000000
#> 29    5  8 0.9601990
#> 30    4  9 0.9502488
```

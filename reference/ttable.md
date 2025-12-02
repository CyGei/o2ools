# Compute the transmission contingency table

Generates a contingency table based on 'from' (infector) and 'to'
(infectee) vectors.

## Usage

``` r
ttable(from, to, levels = NULL, ...)
```

## Arguments

- from:

  A vector of infectors.

- to:

  A vector of infectees.

- levels:

  Optional. A vector of factor levels. Defaults to the unique, sorted
  values of 'from' and 'to'.

- ...:

  Additional arguments passed to the `table` function.

## Value

A contingency table of infectors (rows) and infectees (columns).

## Examples

``` r
from <- c("A", "A", NA, "C", "C", "C")
to <- c("A", "B", "B", "C", "C", "C")
ttable(from, to)
#>     to
#> from A B C
#>    A 1 1 0
#>    B 0 0 0
#>    C 0 0 3
```

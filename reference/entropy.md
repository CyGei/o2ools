# Compute entropy of a categorical variable

Computes the entropy of a categorical variable, with optional
normalisation.

## Usage

``` r
entropy(x, normalise = TRUE)
```

## Arguments

- x:

  A character vector representing observed categorical values.

- normalise:

  Logical. If `TRUE`, entropy is normalised to range from 0 to 1. If
  `FALSE`, returns raw Shannon entropy.

## Value

A numeric value representing the entropy of `x`.

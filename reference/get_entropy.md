# Compute the entropy of transmission trees

Computes the mean entropy of transmission trees from `outbreaker2`,
quantifying uncertainty in inferred infectors. By default, entropy is
normalised between 0 (complete certainty) and 1 (maximum uncertainty).

## Usage

``` r
get_entropy(out, normalise = TRUE)
```

## Arguments

- out:

  A data frame of class `outbreaker_chains` containing posterior samples
  of transmission ancestries (alpha).

- normalise:

  Logical. If `TRUE` (default), entropy is normalised between 0 and 1.
  If `FALSE`, returns raw Shannon entropy.

## Value

A numeric value representing the mean entropy of transmission trees
across posterior samples.

## Details

Entropy quantifies uncertainty in inferred infectors across posterior
samples using the Shannon entropy formula:

\$\$H(X) = -\sum p_i log(p_i)\$\$

where \\p_i\\ is the proportion of times each infector is inferred. If
`normalise = TRUE`, entropy is scaled by its maximum possible value,
\\log(K)\\, where \\K\\ is the number of distinct inferred infectors:

\$\$H^\*(X) = \frac{H(X)}{log(K)}\$\$

This normalisation ensures values range from 0 to 1:

- **0**: Complete certainty — the same infector is inferred across all
  samples.

- **1**: Maximum uncertainty — all infectors are equally likely.

## Examples

``` r
# High entropy
out <- data.frame(alpha_1 = sample(c("2", "3"), 100, replace = TRUE),
                  alpha_2 = sample(c("1", "3"), 100, replace = TRUE))
class(out) <- c("outbreaker_chains", class(out))
get_entropy(out)
#>   alpha_1   alpha_2 
#> 0.9974016 0.9895875 

# Low entropy
out <- data.frame(alpha_1 = sample(c("2", "3"), 100, replace = TRUE, prob = c(0.95, 0.05)),
                  alpha_2 = sample(c("1", "3"), 100, replace = TRUE, prob = c(0.95, 0.05)))
class(out) <- c("outbreaker_chains", class(out))
get_entropy(out)
#>   alpha_1   alpha_2 
#> 0.3659237 0.4021792 
```

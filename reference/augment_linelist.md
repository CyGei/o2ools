# Append summaries of outbreaker results to a linelist

For each case in `linelist`, appends summary statistics of selected
parameters from an `outbreaker_chains` object (e.g. infection times,
number of generations).

## Usage

``` r
augment_linelist(
  out,
  linelist,
  params = c("t_inf", "kappa"),
  summary_fns = list(mean = function(x) mean(x, na.rm = TRUE), q25 = function(x)
    quantile(x, 0.25, na.rm = TRUE), q75 = function(x) quantile(x, 0.75, na.rm = TRUE))
)
```

## Arguments

- out:

  An `outbreaker_chains` object containing posterior samples.

- linelist:

  A `data.frame` with an `id` column matching the IDs in `out`.

- params:

  Character vector of parameter prefixes to summarise (e.g. `"t_inf"`,
  `"kappa"`).

- summary_fns:

  A **named** list of summary functions. Each function takes a numeric
  vector and returns a single value. Example:
  ` list( mean = function(x) mean(x, na.rm = TRUE), q25 = function(x) quantile(x, 0.25, na.rm = TRUE), q75 = function(x) quantile(x, 0.75, na.rm = TRUE) ) `

## Value

The input `linelist`, with new columns named `<param>_<fn>` (e.g.
`t_inf_mean`, `kappa_q25`).

## Examples

``` r
augmented_linelist <- augment_linelist(
  out, linelist,
  params = c("t_inf", "kappa"),
  summary_fns = list(
    median = function(x) median(x, na.rm = TRUE),
    q25 = function(x) quantile(x, 0.25, na.rm = TRUE),
    q75 = function(x) quantile(x, 0.75, na.rm = TRUE)
  )
)
```

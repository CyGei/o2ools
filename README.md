# o2ools

Helper functions for the [outbreaker2](https://github.com/reconhub/outbreaker2) R package.

## Installation

```         
devtools::install_github("CyGei/o2ools") 
```

## Functions

### `identify`

Replace integers from the `outbreaker2` output with unique identifiers from the linelist.

```         
 identify(out, ids)
```

### `get_trees`

Return a list of posterior transmission trees as data frames from an *outbreaker2* output.

```         
get_trees(out, ids = linelist$ids, dates = linelist$dates) 
```

### `filter_alpha_by_kappa`

Return only the ancestors (*alpha*) that are below a given number of generations (*kappa*).

```         
filter_alpha_by_kappa(out, kappa_max = 1)
```

### `get_accuracy`
Accuracy of outbreak reconstruction is defined as the proportion of correctly inferred transmission pairs.
You thus need to provide the true transmission pairs as input (a data frame with columns `from` and `to`).

```
get_accuracy(out, true_tt)
```


# Replace integers in outbreaker2 output with unique identifiers

Replace integers in outbreaker2 output with unique identifiers

## Usage

``` r
identify(out, ids)
```

## Arguments

- out:

  A data frame of class `outbreaker_chains`.

- ids:

  A vector of IDs from the original linelist (see
  [`outbreaker2::outbreaker_data()`](https://rdrr.io/pkg/outbreaker2/man/outbreaker_data.html)).

## Value

A data frame of class `outbreaker_chains` with integers replaced by the
corresponding IDs.

## Examples

``` r
identify(out, id = linelist$name)
#> 
#> 
#>  ///// outbreaker results ///
#> 
#> class:  outbreaker_chains data.frame
#> dimensions 201 rows,  98 columns
#> ancestries not shown: alpha_Natashia - alpha_Rabi
#> infection dates not shown: t_inf_Natashia - t_inf_Rabi
#> intermediate generations not shown: kappa_Natashia - kappa_Rabi
#> 
#> /// head //
#>   step       post       like    prior           mu        pi       eps
#> 1    1 -1198.0669 -1199.4211 1.354240 0.0001000000 0.9000000 0.5000000
#> 2   50  -576.3898  -578.4358 2.046006 0.0001322360 0.9719080 0.6238018
#> 3  100  -579.1822  -580.9235 1.741283 0.0001218749 0.9395509 0.5810956
#>       lambda
#> 1 0.05000000
#> 2 0.06582716
#> 3 0.10193745
#> 
#> ...
#> /// tail //
#>      step      post      like    prior           mu        pi       eps
#> 199  9900 -563.6538 -565.2708 1.616983 0.0001236515 0.9266639 0.7634021
#> 200  9950 -567.0488 -569.0806 2.031785 0.0001179255 0.9703719 0.7057554
#> 201 10000 -564.4037 -565.6457 1.242090 0.0001456115 0.8888590 0.6301657
#>         lambda
#> 199 0.07471296
#> 200 0.07418330
#> 201 0.08802858
```

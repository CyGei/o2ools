
<!-- badges: start -->

[![R-CMD-check](https://github.com/CyGei/o2ools/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/CyGei/o2ools/actions/workflows/R-CMD-check.yaml)
[![CRANdownloads](https://cranlogs.r-pkg.org/badges/grand-total/o2ools)](https://CRAN.R-project.org/package=o2ools)
[![CodeFactor](https://www.codefactor.io/repository/github/cygei/o2ools/badge)](https://www.codefactor.io/repository/github/cygei/o2ools)
<!-- badges: end -->

# o2ools <a href="https://cygei.github.io/o2ools/"><img src="man/figures/logo.png" alt="o2ools website" align="right" height="242"/></a>

Tools to process the results of
[`outbreaker2`](https://github.com/reconhub/outbreaker2).

## Installation

Install the package from
[CRAN](https://cran.r-project.org/web/packages/o2ools/index.html):

``` r
install.packages("o2ools")
library(o2ools)
```

Or the development version from GitHub:

``` r
devtools::install_github("cygei/o2ools")
```

## Information

The inference of transmission chains from genomic, epidemiological and
contact data is central to outbreak investigations.
[`outbreaker2`](https://github.com/reconhub/outbreaker2) and other
popular models use Bayesian inference to reconstruct who infected whom.
However, the results of these models are difficult to interpret and
visualise. `o2ools` provides tools to analyse and visualise the results
of `outbreaker2`. To get started, check the package
[vignette](https://cygei.github.io/o2ools/articles/o2ools.html).

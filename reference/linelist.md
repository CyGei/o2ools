# Simulated linelist with group labels

A simulated linelist derived from `fake_outbreak`, where cases are
assigned to the patient or hcw group. First names are randomly generated
using the randomNames package.

## Usage

``` r
linelist
```

## Format

A data frame with 30 rows and 5 columns:

- id:

  Case ID

- name:

  Simulated first name

- group:

  Group label: `"patient"` or `"hcw"`

- onset:

  Date of symptom onset

- sample:

  Date of sample collection

## See also

[`fake_outbreak`](https://rdrr.io/pkg/outbreaker2/man/fake_outbreak.html)

## Examples

``` r
head(linelist)
#>   id         name   group onset sample
#> 1  1     Natashia     hcw     0      3
#> 2  2      Yesenia patient     2      5
#> 3  3 Abdul Kareem     hcw     4      6
#> 4  4        Logan     hcw     4      6
#> 5  5        Emily     hcw     6      7
#> 6  6       Shelby     hcw     6      9
```

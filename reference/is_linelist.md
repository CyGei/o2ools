# Check if the object conforms to linelist expectations

This function checks if the input is a data frame and contains an 'id'
column, as expected for a linelist.

## Usage

``` r
is_linelist(linelist)
```

## Arguments

- linelist:

  The object to be checked.

## Value

TRUE if the object is a data frame with an 'id' column; otherwise, stops
with an error.
